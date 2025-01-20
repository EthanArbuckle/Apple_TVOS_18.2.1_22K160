id SZGetLoggingHandle()
{
  if (SZGetLoggingHandle_onceToken != -1) {
    dispatch_once(&SZGetLoggingHandle_onceToken, &__block_literal_global_3);
  }
  return (id)SZGetLoggingHandle_logHandle;
}

void __SZGetLoggingHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.streamingzip", "framework");
  v1 = (void *)SZGetLoggingHandle_logHandle;
  SZGetLoggingHandle_logHandle = (uint64_t)v0;
}

id SZGetTraceHandle()
{
  if (SZGetTraceHandle_onceToken != -1) {
    dispatch_once(&SZGetTraceHandle_onceToken, &__block_literal_global_3_5);
  }
  return (id)SZGetTraceHandle_logHandle;
}

void __SZGetTraceHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.streamingzip.signposts", "framework");
  v1 = (void *)SZGetTraceHandle_logHandle;
  SZGetTraceHandle_logHandle = (uint64_t)v0;
}

uint64_t UNIX2DOSTime(uint64_t a1)
{
  time_t v5 = (a1 + 1) & 0xFFFFFFFFFFFFFFFELL;
  v1 = localtime_r(&v5, &v4);
  int tm_year = v1->tm_year;
  if (tm_year >= 80) {
    return ((tm_year << 25) + 1610612736) | (v1->tm_sec >> 1) | (32 * v1->tm_min) | (v1->tm_hour << 11) | (v1->tm_mday << 16) | ((v1->tm_mon << 21) + 0x200000);
  }
  else {
    return 2162688LL;
  }
}

time_t DOS2UNIXTime(unsigned int a1)
{
  time_t v6 = time(0LL);
  v3 = (tm *)DOS2UNIXTime_t;
  if (!DOS2UNIXTime_t)
  {
    v3 = localtime_r(&v6, &DOS2UNIXTime_buf);
    DOS2UNIXTime_t = (uint64_t)v3;
  }

  v3->tm_isdst = -1;
  v2.i32[0] = a1;
  int8x16_t v4 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_1870ED240);
  v4.i32[0] = vshlq_u32(v2, (uint32x4_t)xmmword_1870ED230).u32[0];
  *(int8x16_t *)&v3->tm_sec = vandq_s8(v4, (int8x16_t)xmmword_1870ED250);
  v3->tm_mon = ((a1 >> 21) & 0xF) - 1;
  v3->int tm_year = (a1 >> 25) + 80;
  return mktime(v3);
}

unsigned __int16 *GetExtraFieldWithSignature(uint64_t a1, unint64_t a2, unsigned __int16 *a3)
{
  if (a2)
  {
    uint64_t v3 = 0LL;
    int v4 = 0;
    do
    {
      uint64_t v5 = v3 + 4;
      if (v3 + 4 > a2) {
        break;
      }
      time_t v6 = (unsigned __int16 *)(a1 + v3);
      uint64_t v7 = v6[1];
      if (*v6 == *a3)
      {
        if (v5 + v7 <= a2) {
          return v6;
        }
        else {
          return 0LL;
        }
      }

      v4 += v7 + 4;
      uint64_t v3 = (unsigned __int16)v4;
    }

    while ((unsigned __int16)v4 < a2);
  }

  return 0LL;
}

unsigned __int16 *OpenLocalFile(uint64_t a1, uint64_t a2, char *__s, unsigned __int16 a4, char a5, int *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  size_t v10 = *(void *)(a2 + 64) + strlen(__s) + a4 + 30;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v13 = *(unsigned int *)(a2 + 28);
  compression_status v14 = *(unsigned __int16 *)(a2 + 6);
  v15 = *(const char **)(a2 + 72);
  v16 = (unsigned __int16 *)calloc(1uLL, 0x78uLL);
  *a6 = 0;
  v16[56] = v14;
  *((_BYTE *)v16 + 114) = a5;
  *((void *)v16 + 5) = v10;
  *((void *)v16 + 6) = v11;
  *((void *)v16 + 7) = v12;
  *((void *)v16 + 8) = 0LL;
  *((void *)v16 + 9) = a1;
  *((void *)v16 + 10) = 0LL;
  *((void *)v16 + 12) = crc32(0LL, 0LL, 0);
  *((void *)v16 + 13) = v13;
  *((void *)v16 + 11) = strdup(v15);
  if (!*((_BYTE *)v16 + 114))
  {
    unsigned int v17 = v16[56];
    if (v17 > 0xD)
    {
      if (v17 != 14 && v17 != 99) {
        goto LABEL_11;
      }
    }

    else
    {
      if (!v16[56]) {
        return v16;
      }
      if (v17 != 8)
      {
LABEL_11:
        v19 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *((void *)v16 + 11);
          int v26 = 67109378;
          compression_status v27 = v14;
          __int16 v28 = 2080;
          uint64_t v29 = v25;
          _os_log_error_impl( &dword_1870CA000,  v19,  OS_LOG_TYPE_ERROR,  "Unknown compression scheme (%d) found for file %s; must use raw mode.",
            (uint8_t *)&v26,
            0x12u);
        }

        int v20 = 5;
LABEL_20:
        *a6 = v20;
        free(*((void **)v16 + 11));
        free(*((void **)v16 + 10));
        free(v16);
        return 0LL;
      }
    }

    *((void *)v16 + 10) = malloc(0x10000uLL);
    if (v17 == 8)
    {
      compression_algorithm v18 = COMPRESSION_ZLIB;
    }

    else if (v17 == 14)
    {
      compression_algorithm v18 = COMPRESSION_LZMA;
    }

    else
    {
      compression_algorithm v18 = COMPRESSION_LZFSE;
    }

    compression_status v21 = compression_stream_init((compression_stream *)v16, COMPRESSION_STREAM_DECODE, v18);
    if (v21)
    {
      compression_status v22 = v21;
      v23 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v26 = 67109120;
        compression_status v27 = v22;
        _os_log_error_impl( &dword_1870CA000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to initialize compression: %d",  (uint8_t *)&v26,  8u);
      }

      int v20 = 3;
      goto LABEL_20;
    }
  }

  return v16;
}

uint64_t ReadLocalFileData(uint64_t *a1, void *a2, size_t a3, size_t *a4)
{
  size_t v5 = a3;
  uint64_t v62 = *MEMORY[0x1895F89C0];
  int v8 = *((unsigned __int16 *)a1 + 56);
  if (!*((_WORD *)a1 + 56) || *((_BYTE *)a1 + 114))
  {
    if (a1[6])
    {
      if (fseeko(*(FILE **)a1[9], a1[5], 0))
      {
        v9 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          size_t v10 = __error();
          uint64_t v11 = strerror(*v10);
          *(_DWORD *)buf = 136315138;
          *(void *)v61 = v11;
          uint64_t v12 = "Failed to seek to local file data: %s";
          goto LABEL_41;
        }

        return 4LL;
      }

      if (a1[6] < v5) {
        size_t v5 = a1[6];
      }
      if (v5 != fread(a2, 1uLL, v5, *(FILE **)a1[9]))
      {
        v9 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v61 = v5;
          uint64_t v12 = "Failed to read %ld bytes of local file data";
          goto LABEL_41;
        }

        return 4LL;
      }

      if (!*((_WORD *)a1 + 56)) {
        a1[12] = crc32(a1[12], (const Bytef *)a2, v5);
      }
      *a4 = v5;
      size_t v37 = a1[6] - v5;
      BOOL v38 = a1[6] == v5;
      a1[5] += v5;
      a1[6] = v37;
      a1[8] += v5;
      return (2 * v38);
    }

    else
    {
      uint64_t v13 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = 2LL;
        _os_log_error_impl(&dword_1870CA000, v13, OS_LOG_TYPE_ERROR, "No data remaining!", buf, 2u);
      }

      else
      {
        return 2LL;
      }
    }

    return v14;
  }

  if (v8 != 8 && v8 != 99 && v8 != 14)
  {
    v41 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v56 = *((unsigned __int16 *)a1 + 56);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v61 = v56;
      _os_log_error_impl(&dword_1870CA000, v41, OS_LOG_TYPE_ERROR, "Unknown compression method: %d", buf, 8u);
    }

    return 5LL;
  }

  *a1 = (uint64_t)a2;
  a1[1] = a3;
  *a4 = 0LL;
  while (1)
  {
    uint64_t v16 = a1[1];
    if (!v16) {
      return 0LL;
    }
    if (a1[3]) {
      goto LABEL_24;
    }
    unint64_t v17 = a1[6];
    if (!v17) {
      goto LABEL_24;
    }
    if (v17 >= 0x10000) {
      unint64_t v17 = 0x10000LL;
    }
    compression_algorithm v18 = (FILE **)a1[9];
    a1[2] = a1[10];
    a1[3] = v17;
    if (fseeko(*v18, a1[5], 0)) {
      break;
    }
    size_t v19 = fread((void *)a1[10], 1uLL, a1[3], *(FILE **)a1[9]);
    size_t v20 = v19;
    if (a1[3] != v19)
    {
      v54 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = a1[3];
        if (feof(*(FILE **)a1[9])) {
          int v58 = 121;
        }
        else {
          int v58 = 110;
        }
        int v59 = ferror(*(FILE **)a1[9]);
        *(_DWORD *)buf = 134218752;
        *(void *)v61 = v57;
        *(_WORD *)&v61[8] = 2048;
        *(void *)&v61[10] = v20;
        *(_WORD *)&v61[18] = 1024;
        *(_DWORD *)&v61[20] = v58;
        *(_WORD *)&v61[24] = 1024;
        *(_DWORD *)&v61[26] = v59;
        uint64_t v12 = "Failed to read %zu bytes of local file data; read %lu bytes; isEOF=%c; ferror=%d";
        v39 = v54;
        uint32_t v40 = 34;
        goto LABEL_42;
      }

      return 4LL;
    }

    size_t v21 = a1[6] - v19;
    a1[5] += v19;
    a1[6] = v21;
    uint64_t v16 = a1[1];
LABEL_24:
    compression_status v22 = (const Bytef *)*a1;
    v23 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = a1[2];
      uint64_t v30 = a1[3];
      v31 = (const Bytef *)*a1;
      uint64_t v32 = a1[1];
      *(_DWORD *)buf = 134218752;
      *(void *)v61 = v29;
      *(_WORD *)&v61[8] = 2048;
      *(void *)&v61[10] = v30;
      *(_WORD *)&v61[18] = 2048;
      *(void *)&v61[20] = v31;
      *(_WORD *)&v61[28] = 2048;
      *(void *)&v61[30] = v32;
      _os_log_debug_impl( &dword_1870CA000,  v23,  OS_LOG_TYPE_DEBUG,  "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x2Au);
    }

    compression_status v24 = compression_stream_process((compression_stream *)a1, 0);
    uint64_t v25 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = a1[2];
      uint64_t v34 = a1[3];
      uint64_t v35 = *a1;
      uint64_t v36 = a1[1];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v61 = v24;
      *(_WORD *)&v61[4] = 2048;
      *(void *)&v61[6] = v33;
      *(_WORD *)&v61[14] = 2048;
      *(void *)&v61[16] = v34;
      *(_WORD *)&v61[24] = 2048;
      *(void *)&v61[26] = v35;
      *(_WORD *)&v61[34] = 2048;
      *(void *)&v61[36] = v36;
      _os_log_debug_impl( &dword_1870CA000,  v25,  OS_LOG_TYPE_DEBUG,  "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x30u);
    }

    if (v24 == COMPRESSION_STATUS_ERROR)
    {
      v43 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v61 = -1;
        v44 = "compression_stream_process returned %d";
        v45 = v43;
        uint32_t v46 = 8;
LABEL_55:
        _os_log_error_impl(&dword_1870CA000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
      }

      return 3LL;
    }

    uint64_t v26 = v16 - a1[1];
    compression_status v27 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v61 = v26;
      _os_log_debug_impl(&dword_1870CA000, v27, OS_LOG_TYPE_DEBUG, "Processed %zu bytes", buf, 0xCu);
    }

    a1[12] = crc32(a1[12], v22, v26);
    *a4 += v26;
    uint64_t v28 = a1[8] + v26;
    a1[8] = v28;
    if (v24 == COMPRESSION_STATUS_END)
    {
      if (!a1[6])
      {
        if (a1[7] == v28) {
          return 2LL;
        }
        v49 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          return 3LL;
        }
        uint64_t v51 = a1[7];
        uint64_t v50 = a1[8];
        *(_DWORD *)buf = 134218240;
        *(void *)v61 = v50;
        *(_WORD *)&v61[8] = 2048;
        *(void *)&v61[10] = v51;
        v44 = "Hit end at %llu, before expected size %llu";
        v45 = v49;
        uint32_t v46 = 22;
        goto LABEL_55;
      }

      v47 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = a1[6];
        *(_DWORD *)buf = 134217984;
        *(void *)v61 = v48;
        v44 = "Hit end with %llu remaining";
        v45 = v47;
        uint32_t v46 = 12;
        goto LABEL_55;
      }

      return 3LL;
    }
  }

  v9 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 136315138;
    *(void *)v61 = v53;
    uint64_t v12 = "Failed to seek to local file data: %s";
LABEL_41:
    v39 = v9;
    uint32_t v40 = 12;
LABEL_42:
    _os_log_error_impl(&dword_1870CA000, v39, OS_LOG_TYPE_ERROR, v12, buf, v40);
  }

  return 4LL;
}

uint64_t CloseLocalFile(compression_stream *stream)
{
  uint64_t v2 = 0LL;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unsigned int state_low = LOWORD(stream[2].state);
  if (state_low > 0xD)
  {
    if (state_low != 99 && state_low != 14) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }

  if (LOWORD(stream[2].state))
  {
    if (state_low != 8) {
      goto LABEL_20;
    }
LABEL_10:
    if (BYTE2(stream[2].state)) {
      BOOL v5 = state_low == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_16;
    }
  }

  if (stream[2].src_ptr == (const uint8_t *)stream[2].src_size)
  {
LABEL_16:
    uint64_t v2 = 0LL;
    goto LABEL_20;
  }

  time_t v6 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    src_ptr = stream[2].src_ptr;
    size_t src_size = stream[2].src_size;
    size_t dst_size = stream[2].dst_size;
    int v16 = 136315650;
    size_t v17 = dst_size;
    __int16 v18 = 2048;
    size_t v19 = src_size;
    __int16 v20 = 2048;
    size_t v21 = src_ptr;
    _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "CRC mismatch for %s; expected 0x%lx, actual 0x%lx",
      (uint8_t *)&v16,
      0x20u);
  }

  uint64_t v2 = 6LL;
LABEL_20:
  if (!BYTE2(stream[2].state))
  {
    int v7 = LOWORD(stream[2].state);
    if (v7 == 8 || v7 == 99 || v7 == 14)
    {
      compression_status v8 = compression_stream_destroy(stream);
      if (v8)
      {
        compression_status v9 = v8;
        size_t v10 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v16 = 67109120;
          LODWORD(v17) = v9;
          _os_log_error_impl( &dword_1870CA000,  v10,  OS_LOG_TYPE_ERROR,  "compression_stream_destroy returned %d",  (uint8_t *)&v16,  8u);
        }

        uint64_t v2 = 3LL;
      }
    }
  }

  dst_ptr = stream[2].dst_ptr;
  if (dst_ptr) {
    free(dst_ptr);
  }
  free((void *)stream[2].dst_size);
  free(stream);
  return v2;
}

_WORD *CopyLocalFileHeader(FILE **a1, uint64_t a2, int *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (fseeko(*a1, *(void *)(a2 + 64), 0))
  {
    time_t v6 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to seek to local file record",  (uint8_t *)v27,  2u);
    }

    goto LABEL_13;
  }

  int v7 = malloc(0x1EuLL);
  if (!v7)
  {
    __int16 v18 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      uint64_t v26 = "Failed to malloc LocalFileRecord";
      goto LABEL_24;
    }

LABEL_10:
    MutableLocalFileRecord = 0LL;
    int v20 = 3;
    goto LABEL_14;
  }

  compression_status v8 = v7;
  if (fread(v7, 1uLL, 0x1EuLL, *a1) != 30)
  {
    size_t v21 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read local file record";
LABEL_26:
    int v16 = v21;
    uint32_t v17 = 2;
    goto LABEL_27;
  }

  if (*v8 != 67324752)
  {
    compression_status v9 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(unsigned __int8 *)v8;
      int v11 = *((unsigned __int8 *)v8 + 1);
      int v12 = *((unsigned __int8 *)v8 + 2);
      int v13 = *((unsigned __int8 *)v8 + 3);
      off_t v14 = ftello(*a1);
      v27[0] = 67110144;
      v27[1] = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      int v31 = v12;
      __int16 v32 = 1024;
      int v33 = v13;
      __int16 v34 = 2048;
      off_t v35 = v14 - 30;
      v15 = "Found invalid local file record with signature 0x%02hhx%02hhx%02hhx%02hhx at offset %lld";
      int v16 = v9;
      uint32_t v17 = 36;
LABEL_27:
      _os_log_error_impl(&dword_1870CA000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)v27, v17);
    }

        ++a2;
      }
    }

LABEL_12:
    free(v8);
LABEL_13:
    MutableLocalFileRecord = 0LL;
    int v20 = 4;
    goto LABEL_14;
  }

  size_t v23 = *((unsigned __int16 *)v8 + 14) + (unint64_t)*((unsigned __int16 *)v8 + 13);
  compression_status v24 = reallocf(v8, v23 + 30);
  if (!v24)
  {
    __int16 v18 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      uint64_t v26 = "Failed to allocate full local file record";
LABEL_24:
      _os_log_error_impl(&dword_1870CA000, v18, OS_LOG_TYPE_ERROR, v26, (uint8_t *)v27, 2u);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  compression_status v8 = v24;
  if (v23 != fread((char *)v24 + 30, 1uLL, v23, *a1))
  {
    size_t v21 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read in variable-length portion of central directory record";
    goto LABEL_26;
  }

  *a3 = 0;
  MutableLocalFileRecord = CreateMutableLocalFileRecord((uint64_t)v8);
  free(v8);
  __int16 v25 = MutableLocalFileRecord[1];
  int v20 = 0;
  if ((v25 & 8) != 0)
  {
    *(_OWORD *)(MutableLocalFileRecord + 20) = *(_OWORD *)(a2 + 32);
    *((_DWORD *)MutableLocalFileRecord + 8) = *(_DWORD *)(a2 + 28);
    MutableLocalFileRecord[1] = v25 & 0xFFF7;
  }

    uint64_t v22 = 0LL;
    size_t v23 = 0LL;
    compression_status v24 = 0LL;
LABEL_13:
    __int16 v25 = 0LL;
LABEL_14:
    uint64_t v26 = 0;
    goto LABEL_15;
  }

  int v10 = strlen(__s);
  if (!v10)
  {
    size_t v21 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      v15 = "Source path supplied was an empty string";
      int v16 = v21;
      uint32_t v17 = 2;
      goto LABEL_48;
    }

    goto LABEL_12;
  }

  int v11 = v10;
  if (lstat(__s, &v144))
  {
    int v12 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = __error();
      off_t v14 = strerror(*v13);
      buf[0].st_dev = 136315394;
      *(void *)&buf[0].st_mode = __s;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v14;
      v15 = "Failed to stat source path %s : %s";
      int v16 = v12;
      uint32_t v17 = 22;
LABEL_48:
      _os_log_error_impl(&dword_1870CA000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)buf, v17);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  st_mode = v144.st_mode;
  uint64_t v36 = v144.st_mode & 0xF000;
  if (v36 == 0x4000)
  {
    if ((_BYTE)v128) {
      int v11 = strrchr(__s, 47) - __s;
    }
    if (!(_BYTE)v127)
    {
      size_t v37 = v150;
      st_size = v149;
      st_mode = v144.st_mode;
      goto LABEL_51;
    }

LABEL_14:
  *a3 = v20;
  return MutableLocalFileRecord;
}

void *OpenZipFile(const char *a1, char a2)
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  int v4 = calloc(1uLL, 0x60uLL);
  BOOL v5 = fopen(a1, "rb");
  *int v4 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      int v6 = fileno(v5);
      if (fcntl(v6, 48, 1LL))
      {
        int v7 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v33 = __error();
          __int16 v34 = strerror(*v33);
          *(_DWORD *)buf = 136315138;
          *(void *)v97 = v34;
          _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to set F_NOCACHE on zip file FD: %s",  buf,  0xCu);
        }
      }
    }

    v4[6] = -1LL;
    v4[3] = 0LL;
    if (fseeko((FILE *)*v4, -22LL, 2))
    {
      compression_status v8 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        compression_status v9 = __error();
        int v10 = strerror(*v9);
        *(_DWORD *)buf = 136315138;
        *(void *)v97 = v10;
        int v11 = "Failed to seek to end record: %s";
        int v12 = v8;
        uint32_t v13 = 12;
LABEL_25:
        _os_log_error_impl(&dword_1870CA000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
        goto LABEL_26;
      }

      goto LABEL_26;
    }

    v4[1] = ftello((FILE *)*v4) + 22;
    size_t v14 = fread(v4 + 7, 1uLL, 0x16uLL, (FILE *)*v4);
    if (v14 != 22)
    {
      size_t v16 = v14;
      uint32_t v17 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v97 = 22LL;
        *(_WORD *)&v97[8] = 2048;
        *(void *)v98 = v16;
        int v11 = "Failed to read end record: expected to read %lu but actually read %lu";
        int v12 = v17;
        uint32_t v13 = 22;
        goto LABEL_25;
      }

LABEL_26:
      size_t v23 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      __int16 v25 = "Failed to get end record";
      goto LABEL_32;
    }

    if (*((_DWORD *)v4 + 14) != 101010256)
    {
      v15 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      int v11 = "Failed to locate end record";
LABEL_24:
      int v12 = v15;
      uint32_t v13 = 2;
      goto LABEL_25;
    }

    if (*((__int16 *)v4 + 32) != -1)
    {
      unsigned int v18 = *((unsigned __int16 *)v4 + 33);
      if (v18 != 0xFFFF && *((_DWORD *)v4 + 17) != -1 && *((_DWORD *)v4 + 18) != -1)
      {
LABEL_40:
        uint64_t v31 = v4[10];
        if (v31)
        {
          if (v18 == 0xFFFF) {
            uint64_t v32 = *(void *)(v31 + 32);
          }
          else {
            uint64_t v32 = v18;
          }
          v4[2] = v32;
          LODWORD(v32) = *((_DWORD *)v4 + 17);
          if ((_DWORD)v32 == -1) {
            uint64_t v41 = *(void *)(v31 + 40);
          }
          else {
            uint64_t v41 = *((unsigned int *)v4 + 17);
          }
          v4[5] = v41;
          uint64_t v42 = *((unsigned int *)v4 + 18);
          if ((_DWORD)v42 == -1)
          {
            uint64_t v42 = *(void *)(v31 + 48);
            LODWORD(v40) = -1;
          }

          else
          {
            LODWORD(v40) = *((_DWORD *)v4 + 18);
          }

          v4[4] = v42;
          if (v4[11])
          {
            if (*(_DWORD *)(v31 + 16))
            {
              v43 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                int v44 = *(_DWORD *)(v4[10] + 16LL);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v44;
                __int16 v25 = "Z64: Archive says it's disk number %d; must be 0";
LABEL_97:
                uint64_t v26 = v43;
                uint32_t v27 = 8;
                goto LABEL_33;
              }

              goto LABEL_27;
            }

            if (*(_DWORD *)(v31 + 20))
            {
              v43 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                int v50 = *(_DWORD *)(v4[10] + 20LL);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v50;
                __int16 v25 = "Z64: Archive says central directory starts on disk disk number %d; must be 0";
                goto LABEL_97;
              }

LABEL_27:
              if (*v4) {
                fclose((FILE *)*v4);
              }
              goto LABEL_29;
            }

            if (*(void *)(v31 + 24) != *(void *)(v31 + 32))
            {
              size_t v23 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                goto LABEL_27;
              }
              *(_WORD *)buf = 0;
              __int16 v25 = "Z64: Archive must only span a single disk, but this disk does not have all of the central directory records.";
              goto LABEL_32;
            }

            unint64_t v54 = *(void *)(v31 + 40);
            unint64_t v55 = v4[1];
            if (v54 > v55)
            {
              int v56 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                goto LABEL_27;
              }
              uint64_t v57 = *(void *)(v4[10] + 40LL);
              uint64_t v58 = v4[1];
              *(_DWORD *)buf = 134218240;
              *(void *)v97 = v57;
              *(_WORD *)&v97[8] = 2048;
              *(void *)v98 = v58;
              __int16 v25 = "Z64: Central directory says it's %ld bytes long, which is longer than file length %ld";
              goto LABEL_102;
            }

            if (*(void *)(v31 + 48) + v54 > v55)
            {
              v69 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                uint64_t v70 = v4[10];
                uint64_t v72 = *(void *)(v70 + 40);
                uint64_t v71 = *(void *)(v70 + 48);
                uint64_t v73 = v4[1];
                *(_DWORD *)buf = 134218496;
                *(void *)v97 = v72;
                *(_WORD *)&v97[8] = 2048;
                *(void *)v98 = v71;
                *(_WORD *)&v98[8] = 2048;
                uint64_t v99 = v73;
                __int16 v25 = "Z64: Central directory length (%ld) + offset (%ld) > file length %ld";
                uint64_t v26 = v69;
                uint32_t v27 = 32;
                goto LABEL_33;
              }

              goto LABEL_27;
            }
          }
        }

        else
        {
          v4[2] = v18;
          uint64_t v32 = *((unsigned int *)v4 + 17);
          uint64_t v40 = *((unsigned int *)v4 + 18);
          v4[4] = v40;
          v4[5] = v32;
        }

        if (*((_WORD *)v4 + 30))
        {
          v43 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            int v74 = *((unsigned __int16 *)v4 + 30);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v74;
            __int16 v25 = "Archive says it's disk number %hd; must be 0";
            goto LABEL_97;
          }

          goto LABEL_27;
        }

        if (*((_WORD *)v4 + 31))
        {
          v43 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            int v75 = *((unsigned __int16 *)v4 + 31);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v75;
            __int16 v25 = "Archive says central directory starts on disk disk number %d; must be 0";
            goto LABEL_97;
          }

          goto LABEL_27;
        }

        if (*((unsigned __int16 *)v4 + 32) == v18)
        {
          unint64_t v76 = v4[1];
          if (v76 >= v32)
          {
            v79 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
              goto LABEL_27;
            }
            int v80 = *((_DWORD *)v4 + 17);
            int v81 = *((_DWORD *)v4 + 18);
            uint64_t v82 = v4[1];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v97 = v80;
            *(_WORD *)&v97[4] = 1024;
            *(_DWORD *)&v97[6] = v81;
            *(_WORD *)v98 = 2048;
            *(void *)&v98[2] = v82;
            __int16 v25 = "Central directory length (%u) + offset (%u) > file length %ld";
            uint64_t v26 = v79;
            uint32_t v27 = 24;
            goto LABEL_33;
          }

          int v56 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          uint64_t v77 = *((unsigned int *)v4 + 17);
          uint64_t v78 = v4[1];
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v77;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = v78;
          __int16 v25 = "Central directory says it's %ld bytes long, which is longer than file length %ld";
LABEL_102:
          uint64_t v26 = v56;
          uint32_t v27 = 22;
          goto LABEL_33;
        }

        size_t v23 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        __int16 v25 = "Archive must only span a single disk, but this disk does not have all of the central directory records.";
LABEL_32:
        uint64_t v26 = v23;
        uint32_t v27 = 2;
LABEL_33:
        _os_log_error_impl(&dword_1870CA000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_27;
      }
    }

    size_t v19 = (FILE *)*v4;
    if (fseeko((FILE *)*v4, -42LL, 2))
    {
      int v20 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        size_t v21 = 0LL;
        uint64_t v22 = 0LL;
LABEL_22:
        free(v22);
        free(v21);
        v15 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        int v11 = "Failed to read Zip64 end records";
        goto LABEL_24;
      }

      uint64_t v48 = __error();
      v49 = strerror(*v48);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v49;
      size_t v37 = "Failed to seek to zip64 end record locator: %s";
LABEL_63:
      _os_log_error_impl(&dword_1870CA000, v20, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
      goto LABEL_21;
    }

    __int16 v28 = (off_t *)calloc(1uLL, 0x14uLL);
    if (!v28)
    {
      int v20 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      off_t v35 = __error();
      uint64_t v36 = strerror(*v35);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v36;
      size_t v37 = "Failed to allocate zip64 end record locator: %s";
      goto LABEL_63;
    }

    uint64_t v22 = v28;
    size_t v29 = fread(v28, 1uLL, 0x14uLL, v19);
    if (v29 != 20)
    {
      size_t v38 = v29;
      v39 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v97 = 20LL;
      *(_WORD *)&v97[8] = 2048;
      *(void *)v98 = v38;
      v47 = "Failed to read zip64 end record locator: expected to read %lu but actually read %lu";
LABEL_79:
      v60 = v39;
      uint32_t v61 = 22;
      goto LABEL_80;
    }

    if (*(_DWORD *)v22 != 117853008)
    {
      __int16 v30 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1870CA000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to locate zip64 end record locator; what we found doesn't have the right signature.",
          buf,
          2u);
      }

      goto LABEL_39;
    }

    if (*((_DWORD *)v22 + 1))
    {
      v45 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        int v46 = *((_DWORD *)v22 + 1);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v46;
        v47 = "Expected for end record to be on disk 0, but zip64 end record locator claimed disk %d";
LABEL_77:
        v60 = v45;
        uint32_t v61 = 8;
LABEL_80:
        _os_log_error_impl(&dword_1870CA000, v60, OS_LOG_TYPE_ERROR, v47, buf, v61);
        goto LABEL_46;
      }

      goto LABEL_46;
    }

    if (*((_DWORD *)v22 + 4) != 1)
    {
      v45 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        int v59 = *((_DWORD *)v22 + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v59;
        v47 = "Expected total disks to be 1, but zip64 end record locator claimed %d disks";
        goto LABEL_77;
      }

LABEL_46:
      size_t v21 = 0LL;
      goto LABEL_22;
    }

    if (fseeko(v19, v22[1], 0))
    {
      v39 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      off_t v51 = v22[1];
      v52 = __error();
      v53 = strerror(*v52);
      *(_DWORD *)buf = 134218242;
      *(void *)v97 = v51;
      *(_WORD *)&v97[8] = 2080;
      *(void *)v98 = v53;
      v47 = "Failed to seek to zip64 end record at %lld: %s";
      goto LABEL_79;
    }

    __stream = v19;
    uint64_t v62 = calloc(1uLL, 0x38uLL);
    if (v62)
    {
      size_t v21 = v62;
      size_t v63 = fread(v62, 1uLL, 0x38uLL, __stream);
      if (v63 != 56)
      {
        size_t v86 = v63;
        v87 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 134218240;
        *(void *)v97 = 56LL;
        *(_WORD *)&v97[8] = 2048;
        *(void *)v98 = v86;
        v66 = "Failed to read zip64 end record: expected to read %lu but actually read %lu";
        v67 = v87;
        goto LABEL_113;
      }

      if (*v21 != 101075792)
      {
        v64 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        off_t v65 = v22[1];
        *(_DWORD *)buf = 134217984;
        *(void *)v97 = v65;
        v66 = "Failed to locate zip64 end record; what we found at offset %lld doesn't have the right signature.";
        v67 = v64;
        uint32_t v68 = 12;
LABEL_114:
        _os_log_error_impl(&dword_1870CA000, v67, OS_LOG_TYPE_ERROR, v66, buf, v68);
        goto LABEL_22;
      }

      uint64_t v88 = *(void *)(v21 + 1);
      uint64_t v89 = v88 + 12;
      if ((unint64_t)(v88 + 12) < 0x39)
      {
        if (v88 != 44)
        {
          v94 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v89;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = 56LL;
          v66 = "Zip64 end record said it was %zu bytes; we expect at least %zu bytes";
LABEL_124:
          v67 = v94;
LABEL_113:
          uint32_t v68 = 22;
          goto LABEL_114;
        }

        v39 = Mutable;
LABEL_47:
        free(v18);
        unsigned int v18 = 0LL;
        off_t v51 = 4;
        goto LABEL_51;
      }

      if (*v18 != 33639248)
      {
        v45 = (os_log_s *)SZGetLoggingHandle();
        size_t v38 = v62;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v39 = Mutable;
          int v46 = *((unsigned __int8 *)v18 + 1);
          v47 = *((unsigned __int8 *)v18 + 2);
          uint64_t v48 = *((unsigned __int8 *)v18 + 3);
          *(void *)&context = __PAIR64__(*(unsigned __int8 *)v18, 67109888);
          WORD4(context) = 1024;
          *(_DWORD *)((char *)&context + 10) = v46;
          HIWORD(context) = 1024;
          off_t v65 = v47;
          v66 = 1024;
          v67 = v48;
          int v44 = "Found invalid central directory record with signature 0x%02hhx%02hhx%02hhx%02hhx";
          v49 = v45;
          int v50 = 26;
LABEL_64:
          _os_log_error_impl(&dword_1870CA000, v49, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&context, v50);
          goto LABEL_47;
        }

        goto LABEL_46;
      }

      size_t v19 = *((unsigned __int16 *)v18 + 15)
      int v20 = reallocf(v18, v19 + 46);
      if (!v20)
      {
        v39 = Mutable;
        uint64_t v41 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        LOWORD(context) = 0;
        uint64_t v42 = "Failed to allocate full central directory record";
        goto LABEL_61;
      }

      unsigned int v18 = v20;
      if (v19 != fread((char *)v20 + 46, 1uLL, v19, *(FILE **)a1))
      {
        v43 = (os_log_s *)SZGetLoggingHandle();
        size_t v38 = v62;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        v39 = Mutable;
        LOWORD(context) = 0;
        int v44 = "Failed to read in variable-length portion of central directory record";
        goto LABEL_63;
      }

      size_t v21 = ftello(*(FILE **)a1);
      *(void *)(a1 + 48) = v21;
      uint64_t v22 = *(void *)(a1 + 40) + *(void *)(a1 + 32);
      if (v22 == v21)
      {
        *(void *)(a1 + 48) = -1LL;
        *(void *)(a1 + 24) = 0LL;
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        compression_status v24 = 1;
      }

      else
      {
        if (v21 > v22)
        {
          v39 = Mutable;
          goto LABEL_49;
        }

        __int16 v25 = *(void *)(a1 + 16);
        uint64_t v26 = *(void *)(a1 + 24) + 1LL;
        *(void *)(a1 + 24) = v26;
        if (v26 > v25) {
          __assert_rtn("CopyNextCDRecord", "ParseZipFile.c", 496, "ctx->cd_records_processed <= ctx->total_cd_records");
        }
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        compression_status v24 = 0;
      }

      free(v18);
      uint32_t v27 = (const char *)*((void *)MutableCDRecord + 9);
      if (!strcmp("META-INF/", v27))
      {
        __int16 v28 = v61;
LABEL_24:
        *__int16 v28 = v14;
        break;
      }

      if (!strcmp("mimetype", v27))
      {
        __int16 v28 = v55;
        goto LABEL_24;
      }

      if (strcmp("META-INF/com.apple.ZipMetadata.plist", v27) && strcmp("META-INF/com.apple.FixedZipMetadata.bin", v27)) {
        break;
      }
      DestroyMutableCDRecord((void **)MutableCDRecord);
      --v11;
      if ((v24 & 1) != 0) {
        goto LABEL_28;
      }
    }

    v62[v14++] = (void **)MutableCDRecord;
    size_t v29 = (unsigned __int16)MutableCDRecord[12];
    __int16 v30 = Mutable;
    if (*((_BYTE *)MutableCDRecord + 26)) {
      Mutable = theDict;
    }
    uint64_t v31 = (char *)CFDictionaryGetValue(Mutable, (const void *)(unsigned __int16)MutableCDRecord[12]) + 1;
    uint64_t v32 = Mutable;
    Mutable = v30;
    CFDictionarySetValue(v32, (const void *)v29, v31);
    v15 += *((void *)MutableCDRecord + 5);
  }

  while ((v24 & 1) == 0);
LABEL_28:
  if (v14 != v11) {
    __assert_rtn("_ReadOriginalCentralDirectory", "ConvertZipToStream.c", 245, "cdIndex == origCDRecordCount");
  }
  context = 0uLL;
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  int v33 = Mutable;
  __int16 v34 = WORD4(context);
  context = 0uLL;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  off_t v35 = WORD4(context);
  *a2 = v62;
  *a3 = v11;
  *a4 = v15;
  *a7 = v34;
  Mutable = v33;
  *a8 = v35;
  uint64_t v36 = 1LL;
LABEL_59:
  CFRelease(Mutable);
  CFRelease(theDict);
  return v36;
}

LABEL_121:
        v4[10] = v21;
        v4[11] = v22;
        uint64_t v22 = 0LL;
LABEL_39:
        free(v22);
        unsigned int v18 = *((unsigned __int16 *)v4 + 33);
        goto LABEL_40;
      }

      v90 = reallocf(v21, v88 + 12);
      if (v90)
      {
        size_t v21 = v90;
        uint64_t v91 = v88 - 44;
        size_t v92 = fread(v90 + 14, 1uLL, v88 - 44, __stream);
        if (v88 - 44 != v92)
        {
          size_t v93 = v92;
          v94 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v91;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = v93;
          v66 = "Failed to read extensible data in zip64 end record: expected to read %lu but actually read %lu";
          goto LABEL_124;
        }

        goto LABEL_121;
      }

      v83 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)v97 = v88 + 12;
      v47 = "Failed to grow zip64 end record allocation to %zu bytes";
    }

    else
    {
      v83 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      v84 = __error();
      v85 = strerror(*v84);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v85;
      v47 = "Failed to allocate zip64 end record: %s";
    }

    v60 = v83;
    uint32_t v61 = 12;
    goto LABEL_80;
  }

LABEL_29:
  free(v4);
  return 0LL;
}

      v94 = 0LL;
      v90 = 0LL;
      cf = 0LL;
      __int16 v34 = 0LL;
      off_t v35 = 0LL;
      uint64_t v36 = v92;
LABEL_30:
      close(v36);
      free(v35);
      unsigned int v18 = buffer;
      if (v34) {
        CFRelease(v34);
      }
      if (cf) {
        CFRelease(cf);
      }
      uint64_t v31 = v90;
LABEL_35:
      if (v107) {
        CFRelease(v107);
      }
      v107 = 0LL;
      if (v31) {
        CFRelease(v31);
      }
      if (v94) {
        CFRelease(v94);
      }
      uint64_t v22 = v93;
      goto LABEL_42;
    }

    size_t v37 = (UInt8 *)malloc(v108.st_size);
    if (st_size == read(v92, v37, st_size))
    {
      size_t v38 = CFDataCreateWithBytesNoCopy(v11, v37, v108.st_size, bytesDeallocator);
      if (v38)
      {
        uint64_t v89 = v38;
        v39 = CFPropertyListCreateWithData(v11, v38, 0LL, 0LL, (CFErrorRef *)&v107);
        if (!v39)
        {
          uint64_t v58 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            buf = 136315138;
            v111 = (off_t)__str;
            _os_log_error_impl( &dword_1870CA000,  v58,  OS_LOG_TYPE_ERROR,  "Failed to deserialize Info plist %s",  (uint8_t *)&buf,  0xCu);
          }

          v94 = 0LL;
          v90 = 0LL;
          cf = 0LL;
          goto LABEL_82;
        }

        uint64_t v40 = v39;
        TypeID = CFDictionaryGetTypeID();
        cf = v40;
        if (TypeID == CFGetTypeID(v40))
        {
          uint64_t v42 = strrchr(buffer, 47);
          if (v42)
          {
            v43 = v42;
            *uint64_t v42 = 0;
            int v44 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
            os_log_s *v43 = 47;
            v90 = v44;
            if (!v44)
            {
              uint32_t v61 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                v94 = 0LL;
                v90 = 0LL;
                goto LABEL_80;
              }

              buf = 136315138;
              v111 = (off_t)__str;
              _os_log_error_impl( &dword_1870CA000,  v61,  OS_LOG_TYPE_ERROR,  "Failed to create CF string from plist path %s",  (uint8_t *)&buf,  0xCu);
              v94 = 0LL;
              v90 = 0LL;
LABEL_86:
              Mutable = v96;
              goto LABEL_81;
            }

            v45 = CFDictionaryGetValue((CFDictionaryRef)cf, key);
            if (v45)
            {
              int v46 = v45;
              v47 = CFStringGetTypeID();
              if (v47 == CFGetTypeID(v46))
              {
                v94 = CFStringCreateWithFormat(v11, 0LL, @"%@/%@", v90, v46);
                if (v94)
                {
                  CFArrayAppendValue(a2, v94);
LABEL_80:
                  Mutable = v96;
LABEL_81:
                  a6 = v97;
                  goto LABEL_82;
                }

                v69 = (os_log_s *)SZGetLoggingHandle();
                if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
LABEL_79:
                  v94 = 0LL;
                  goto LABEL_80;
                }

                LOWORD(buf) = 0;
                size_t v63 = v69;
                v64 = "Failed to construct path to bundle executable";
                v66 = 2;
                goto LABEL_74;
              }

              off_t v65 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                goto LABEL_79;
              }
              buf = 136315138;
              v111 = (off_t)__str;
              size_t v63 = v65;
              v64 = "CFBundleExecutable was not a CFString for plist %s";
            }

            else
            {
              uint64_t v62 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                goto LABEL_79;
              }
              buf = 136315138;
              v111 = (off_t)__str;
              size_t v63 = v62;
              v64 = "Plist %s did not contain a value for kCFBundleExecutableKey";
            }

            v66 = 12;
LABEL_74:
            _os_log_error_impl(&dword_1870CA000, v63, OS_LOG_TYPE_ERROR, v64, (uint8_t *)&buf, v66);
            v94 = 0LL;
            goto LABEL_86;
          }

          v60 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v94 = 0LL;
            v90 = 0LL;
            goto LABEL_82;
          }

          buf = 136315138;
          v111 = (off_t)buffer;
          v67 = v60;
          uint32_t v68 = "Failed to find last slash in plist path %s";
        }

        else
        {
          int v59 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
LABEL_64:
            v94 = 0LL;
            v90 = 0LL;
LABEL_82:
            uint64_t v36 = v92;
            off_t v35 = v37;
            __int16 v34 = v89;
            goto LABEL_30;
          }

          buf = 136315138;
          v111 = (off_t)__str;
          v67 = v59;
          uint32_t v68 = "Plist %s did not contain a dictionary";
        }

        _os_log_error_impl(&dword_1870CA000, v67, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&buf, 0xCu);
        goto LABEL_64;
      }

      uint64_t v57 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_59:
        v94 = 0LL;
        v90 = 0LL;
        cf = 0LL;
        uint64_t v36 = v92;
        off_t v35 = v37;
        __int16 v34 = 0LL;
        goto LABEL_30;
      }

      LOWORD(buf) = 0;
      v52 = v57;
      v53 = "Failed to create data from malloc allocation";
      unint64_t v54 = 2;
    }

    else
    {
      uint64_t v48 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_59;
      }
      v49 = v108.st_size;
      int v50 = __error();
      off_t v51 = strerror(*v50);
      buf = 134218498;
      v111 = v49;
      a6 = v97;
      v112 = 2080;
      v113 = __str;
      v114 = 2080;
      v115 = v51;
      v52 = v48;
      v53 = "Failed to read %lld bytes from Info.plist at path %s: %s";
      unint64_t v54 = 32;
    }

    _os_log_error_impl(&dword_1870CA000, v52, OS_LOG_TYPE_ERROR, v53, (uint8_t *)&buf, v54);
    goto LABEL_59;
  }

  uint64_t v70 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    uint64_t v71 = __error();
    uint64_t v72 = strerror(*v71);
    *(_DWORD *)__str = 136315394;
    *(void *)&__str[4] = a1;
    *(_WORD *)&__str[12] = 2080;
    *(void *)&__str[14] = v72;
    uint64_t v73 = "fts_open failed for path %s: %s";
LABEL_96:
    uint64_t v77 = v70;
    uint64_t v78 = 22;
LABEL_97:
    _os_log_error_impl(&dword_1870CA000, v77, OS_LOG_TYPE_ERROR, v73, (uint8_t *)__str, v78);
  }

    size_t v16 = 0LL;
LABEL_30:
    CloseZipFile(v16);
    return 0LL;
  }

  v15 = OpenZipFile(a1, SBYTE14(v91));
  if (!v15)
  {
    size_t v29 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v125 = (uint64_t)a1;
      int v12 = "Failed to open zip file %s";
      uint32_t v13 = v29;
      size_t v14 = 12;
      goto LABEL_28;
    }

    goto LABEL_29;
  }

  size_t v16 = (uint64_t)v15;
  ZipStreamCallPreflightResultCallback( *((uint64_t *)&v90[0] + 1),  *(void *)(v16 + 16),  *(void *)(v16 + 8),  v107.st_mode);
  v122 = 0LL;
  v123 = 0LL;
  v120 = 0LL;
  v121 = 0LL;
  v118 = 0LL;
  v119 = 0LL;
  v116 = 0LL;
  v117 = 0LL;
  MutableLocalFileRecord = 0LL;
  v115 = 0LL;
  v112 = -1LL;
  v113 = -1LL;
  v111 = 0;
  if (!_ReadOriginalCentralDirectory(v16, &v121, &v123, &v122, &v113, &v112, (_WORD *)&v111 + 1, &v111))
  {
    size_t v23 = 0LL;
    size_t v21 = 0LL;
    goto LABEL_86;
  }

  uint32_t v17 = v123;
  unsigned int v18 = v113;
  size_t v19 = 1LL;
  if (v113 == -1LL) {
    size_t v19 = 2LL;
  }
  int v20 = v19 + v123;
  if (*(void *)&v90[0]) {
    size_t v21 = v20 + 1;
  }
  else {
    size_t v21 = v20;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], v123 + 3, 0LL);
  size_t v23 = Mutable;
  compression_status v24 = v112;
  if (v112 != -1LL)
  {
    __int16 v25 = v121;
    CFArrayAppendValue(Mutable, v121[v112]);
    v25[v24] = 0LL;
  }

  if (v18 == -1LL)
  {
    Count = CFArrayGetCount(v23);
    uint64_t v31 = time(0LL);
    uint64_t v32 = time(0LL);
    CDRecord = CreateCDRecord("META-INF/", 16877, v31, v32);
    MutableCDRecord = CreateMutableCDRecord((uint64_t)CDRecord);
    CFArrayAppendValue(v23, MutableCDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    MutableLocalFileRecord = (void **)CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    uint64_t v36 = LocalFileRecord;
    uint32_t v27 = Count;
    free(v36);
    free(CDRecord);
  }

  else
  {
    uint64_t v26 = v121;
    CFArrayAppendValue(v23, v121[v18]);
    v26[v18] = 0LL;
    uint32_t v27 = -1LL;
  }

  v87 = (unsigned __int16)v111;
  uint64_t v88 = HIWORD(v111);
  if (!ZipStreamConcoctStreamData(v21, v122, SHIWORD(v111), v111, (uint64_t)v90, &v120, &v119, &v118))
  {
    v45 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v46 = "Failed to concoct stream data";
LABEL_52:
      v47 = v45;
      uint64_t v48 = 2;
LABEL_80:
      _os_log_error_impl(&dword_1870CA000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    }

LABEL_30:
  if (!a2) {
    goto LABEL_41;
  }
LABEL_31:
  size_t v23 = v23;
  v45 = 0LL;
  *a2 = v23;
LABEL_42:

  return v45;
}

void CloseZipFile(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    fclose(*(FILE **)a1);
    free((void *)a1);
  }
}

uint64_t GenericHashInit(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = 0;
  *(_OWORD *)(result + 196) = 0u;
  *(_OWORD *)(result + 180) = 0u;
  *(_OWORD *)(result + 164) = 0u;
  *(_OWORD *)(result + 148) = 0u;
  *(_OWORD *)(result + 132) = 0u;
  *(_OWORD *)(result + 116) = 0u;
  *(_OWORD *)(result + 100) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 68) = 0u;
  *(_OWORD *)(result + 52) = 0u;
  *(_OWORD *)(result + 36) = 0u;
  *(_OWORD *)(result + 20) = 0u;
  *(_OWORD *)(result + 4) = 0u;
  *(_DWORD *)result = a2;
  switch(a2)
  {
    case 0:
      result = CC_MD5_Init((CC_MD5_CTX *)(result + 8));
      break;
    case 1:
      result = CC_SHA1_Init((CC_SHA1_CTX *)(result + 8));
      break;
    case 4:
      result = CC_SHA224_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 5:
      result = CC_SHA256_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 6:
      result = CC_SHA384_Init((CC_SHA512_CTX *)(result + 8));
      break;
    case 7:
      result = CC_SHA512_Init((CC_SHA512_CTX *)(result + 8));
      break;
    default:
      return result;
  }

  return result;
}

uint64_t GenericHashUpdate(uint64_t result, void *data, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    BOOL v5 = (_DWORD *)result;
    int v6 = (CC_MD5_CTX *)(result + 8);
    do
    {
      if (v3 >= 0xFFFFFFFF) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v3;
      }
      switch(*v5)
      {
        case 0:
          result = CC_MD5_Update(v6, data, v7);
          break;
        case 1:
          result = CC_SHA1_Update((CC_SHA1_CTX *)v6, data, v7);
          break;
        case 4:
          result = CC_SHA224_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 5:
          result = CC_SHA256_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 6:
          result = CC_SHA384_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        case 7:
          result = CC_SHA512_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        default:
          break;
      }

      v3 -= v7;
    }

    while (v3);
  }

  return result;
}

unsigned __int8 *GenericHashFinal(unsigned __int8 *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = (unsigned __int8 *)CC_MD5_Final(result, (CC_MD5_CTX *)(a2 + 8));
      break;
    case 1:
      result = (unsigned __int8 *)CC_SHA1_Final(result, (CC_SHA1_CTX *)(a2 + 8));
      break;
    case 4:
      result = (unsigned __int8 *)CC_SHA224_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 5:
      result = (unsigned __int8 *)CC_SHA256_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 6:
      result = (unsigned __int8 *)CC_SHA384_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    case 7:
      result = (unsigned __int8 *)CC_SHA512_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    default:
      return result;
  }

  return result;
}

char *CreateLocalFileRecord(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20) == -1 || *(_DWORD *)(a1 + 24) == -1) {
    __assert_rtn( "CreateLocalFileRecord",  "ZipStructure.c",  40,  "UREAD(cdRecord->thirty_two_bit_compressed_size) < UINT32_MAX && UREAD(cdRecord->thirty_two_bit_uncompressed_size) < UINT32_MAX");
  }
  uint64_t v2 = (char *)calloc(1uLL, *(unsigned __int16 *)(a1 + 28) + 46LL);
  *(_DWORD *)uint64_t v2 = 67324752;
  *((_WORD *)v2 + 2) = *(_WORD *)(a1 + 6);
  *((_WORD *)v2 + 3) = *(_WORD *)(a1 + 8);
  *((_WORD *)v2 + 4) = *(_WORD *)(a1 + 10);
  *(_DWORD *)(v2 + 10) = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(v2 + 14) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(v2 + 18) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(v2 + 22) = *(_DWORD *)(a1 + 24);
  size_t v3 = *(unsigned __int16 *)(a1 + 28);
  *(_DWORD *)(v2 + 26) = (unsigned __int16)v3;
  memcpy(v2 + 30, (const void *)(a1 + 46), v3);
  unint64_t v4 = *(unsigned __int16 *)(a1 + 30);
  if (v4 >= 0xC)
  {
    ExtraFieldWithSignature = GetExtraFieldWithSignature( a1 + 46 + *(unsigned __int16 *)(a1 + 28),  v4,  &kInfoZipExtraFieldSignature);
    if (ExtraFieldWithSignature)
    {
      if (ExtraFieldWithSignature[1] >= 8u)
      {
        unsigned __int16 v6 = *ExtraFieldWithSignature;
        uint64_t v7 = &v2[v3];
        uint64_t v8 = *(void *)(ExtraFieldWithSignature + 2);
        *((_WORD *)v2 + 14) = 16;
        *((_WORD *)v7 + 15) = v6;
        *((_WORD *)v7 + 16) = 12;
        *(void *)(v7 + 34) = v8;
        *(_DWORD *)(v7 + 42) = 32834037;
      }
    }
  }

  return v2;
}

unsigned __int16 *GetInfoZipExtraFieldFromLF(uint64_t a1)
{
  if (!*(_WORD *)(a1 + 28)) {
    return 0LL;
  }
  result = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 26) + 30,  *(unsigned __int16 *)(a1 + 28),  &kInfoZipExtraFieldSignature);
  if (result)
  {
    if (result[1] < 8u) {
      return 0LL;
    }
  }

  return result;
}

BOOL LocalFileRecordHasZip64ExtraField(uint64_t a1)
{
  return *(_WORD *)(a1 + 28)
      && ((ExtraFieldWithSignature = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 26) + 30,  *(unsigned __int16 *)(a1 + 28),  &kZip64ExtraFieldSignature)) == 0LL || ExtraFieldWithSignature[1] >= 0x10u)
      && ExtraFieldWithSignature != 0LL;
}

unsigned __int16 *GetZip64ExtraFieldDataFromLF(uint64_t a1, void *a2, void *a3)
{
  if (!*(_WORD *)(a1 + 28)) {
    return 0LL;
  }
  result = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 26) + 30,  *(unsigned __int16 *)(a1 + 28),  &kZip64ExtraFieldSignature);
  if (!result) {
    return result;
  }
  if (result[1] != 16) {
    return 0LL;
  }
  if (a2) {
    *a2 = *(void *)(result + 2);
  }
  if (a3) {
    *a3 = *(void *)(result + 6);
  }
  return (unsigned __int16 *)1;
}

uint64_t GetLFUncompressedSize(uint64_t a1)
{
  uint64_t v4 = 0LL;
  if (*(_DWORD *)(a1 + 18) == -1 || (unsigned int v2 = *(_DWORD *)(a1 + 22), v2 == -1))
  {
    return *(unsigned int *)(a1 + 22);
  }

  return v2;
}

_DWORD *CreateCDRecord(const char *a1, int a2, int a3, int a4)
{
  size_t v8 = strlen(a1);
  if (v8 >> 16) {
    return 0LL;
  }
  size_t v10 = v8;
  compression_status v9 = calloc(1uLL, v8 + 58);
  *(void *)compression_status v9 = 0x14031E02014B50LL;
  time_t v11 = time(0LL);
  v9[3] = UNIX2DOSTime(v11);
  *((_WORD *)v9 + 14) = v10;
  *((_WORD *)v9 + 15) = 12;
  *(_DWORD *)((char *)v9 + 38) = (a2 << 16) | 0x4000;
  memcpy((char *)v9 + 46, a1, v10);
  int v12 = (_DWORD *)((char *)v9 + v10 + 46);
  *int v12 = 546901;
  v12[1] = a4;
  v12[2] = a3;
  return v9;
}

void ZipStreamAddStatisticsForCDRecord(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v6 = *(void *)(a1 + 40);
  if (a3[17] < v6) {
    a3[17] = v6;
  }
  unint64_t v7 = *(void *)(a1 + 32);
  if (a3[18] < v7) {
    a3[18] = v7;
  }
  unint64_t v8 = a3[2] + v7;
  a3[1] += v6;
  a3[2] = v8;
  unint64_t v9 = (v6 + 4095) & 0xFFFFFFFFFFFFF000LL | 0x800;
  if (*(_BYTE *)(a1 + 26)) {
    uint64_t v10 = 1024LL;
  }
  else {
    uint64_t v10 = v9;
  }
  time_t v11 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    int v18 = 134218242;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = v15;
    _os_log_debug_impl(&dword_1870CA000, v11, OS_LOG_TYPE_DEBUG, "Counting size %llu for %s", (uint8_t *)&v18, 0x16u);
  }

  *a3 += v10;
  ++a3[4];
  if (*(_BYTE *)(a1 + 26))
  {
    int v12 = a3 + 19;
LABEL_12:
    ++*v12;
    goto LABEL_16;
  }

  uint64_t v13 = 20LL;
  if ((*(_WORD *)(a1 + 24) & 0xF000) == 0xA000) {
    uint64_t v13 = 21LL;
  }
  ++a3[v13];
  if (!*(void *)(a1 + 40))
  {
    int v12 = a3 + 22;
    goto LABEL_12;
  }

LABEL_16:
  if (a2)
  {
    size_t v14 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 72);
      int v17 = *(unsigned __int16 *)(a1 + 24);
      int v18 = 136315394;
      uint64_t v19 = v16;
      __int16 v20 = 1024;
      LODWORD(v21) = v17;
      _os_log_debug_impl( &dword_1870CA000,  v14,  OS_LOG_TYPE_DEBUG,  "File %s has non-standard mode %o",  (uint8_t *)&v18,  0x12u);
    }

    ++a3[14];
  }

uint64_t ZipStreamWriteLocalFile( uint64_t a1, void ***a2, void ***a3, char *a4, int a5, unsigned int a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v227 = *MEMORY[0x1895F89C0];
  int v12 = (char *)malloc(0x20000uLL);
  uint64_t v13 = *a3;
  size_t v14 = calloc(1uLL, 0x50uLL);
  *size_t v14 = *(_OWORD *)v13;
  __int128 v15 = *((_OWORD *)v13 + 4);
  __int128 v17 = *((_OWORD *)v13 + 1);
  __int128 v16 = *((_OWORD *)v13 + 2);
  v14[3] = *((_OWORD *)v13 + 3);
  v14[4] = v15;
  v14[1] = v17;
  v14[2] = v16;
  *((void *)v14 + 7) = strdup((const char *)v13[7]);
  size_t v18 = *((unsigned __int16 *)v13 + 32);
  uint64_t v19 = malloc(v18);
  *((void *)v14 + 9) = v19;
  size_t v20 = v18;
  uint64_t v21 = a9;
  memcpy(v19, v13[9], v20);
  uint64_t v22 = *a2;
  size_t v23 = (unsigned __int16 *)calloc(1uLL, 0x68uLL);
  __int128 v25 = *((_OWORD *)v22 + 1);
  __int128 v24 = *((_OWORD *)v22 + 2);
  *(_OWORD *)size_t v23 = *(_OWORD *)v22;
  *((_OWORD *)v23 + 1) = v25;
  *((_OWORD *)v23 + 2) = v24;
  __int128 v27 = *((_OWORD *)v22 + 4);
  __int128 v26 = *((_OWORD *)v22 + 5);
  __int128 v28 = *((_OWORD *)v22 + 3);
  *((void *)v23 + 12) = v22[12];
  *((_OWORD *)v23 + 4) = v27;
  *((_OWORD *)v23 + 5) = v26;
  *((_OWORD *)v23 + 3) = v28;
  *((void *)v23 + 9) = strdup((const char *)v22[9]);
  size_t v29 = *((unsigned __int16 *)v22 + 24);
  __int16 v30 = malloc(v29);
  *((void *)v23 + 10) = v30;
  memcpy(v30, v22[10], v29);
  size_t v31 = *((unsigned __int16 *)v22 + 44);
  uint64_t v32 = malloc(v31);
  *((void *)v23 + 12) = v32;
  memcpy(v32, v22[12], v31);
  unint64_t v216 = *((void *)v14 + 5);
  unint64_t v219 = *((void *)v14 + 6);
  int v33 = *((unsigned __int16 *)v14 + 2);
  int v221 = *((_DWORD *)v14 + 8);
  uLong v34 = crc32(0LL, 0LL, 0);
  uint64_t v35 = (*(uint64_t (**)(void))(*(void *)(v21 + 8) + 72LL))(*(void *)(*(void *)(v21 + 8) + 80LL));
  if (v35 < 0)
  {
    int v37 = *__error();
    size_t v38 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
LABEL_62:
      uint32_t v61 = 0LL;
      int v56 = 0LL;
      uint64_t v62 = 0LL;
      goto LABEL_200;
    }

    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = strerror(v37);
    v39 = "Failed to get offset before writing LF record: %s";
LABEL_167:
    _os_log_error_impl(&dword_1870CA000, v38, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);
    goto LABEL_62;
  }

  int v210 = v33;
  uint64_t v209 = v35;
  unint64_t v36 = v219;
  if (!a5)
  {
    if (v33 == 8 || v33 == 99 || v33 == 14)
    {
      if (*(_DWORD *)(a9 + 32) == 2)
      {
        a5 = 3;
        goto LABEL_20;
      }

      a5 = 1;
      if (!*(_BYTE *)(a9 + 45) || v216 <= v219) {
        goto LABEL_20;
      }
      uint64_t v40 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v161 = *((void *)v23 + 9);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v161;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v216 - v219;
        _os_log_debug_impl( &dword_1870CA000,  v40,  OS_LOG_TYPE_DEBUG,  "%s is %llu bytes larger compressed than uncompressed; converting.",
          buf,
          0x16u);
      }

      int64x2_t v41 = vdupq_n_s64(1uLL);
      v41.i64[0] = v216 - v219;
      *(int64x2_t *)(a8 + 40) = vaddq_s64(v41, *(int64x2_t *)(a8 + 40));
      a5 = 2;
    }

    else
    {
      uint64_t v42 = (const char *)*((void *)v23 + 9);
      a5 = 2;
      if (strcmp(v42, "mimetype"))
      {
        if (!strcmp(v42, "META-INF/com.apple.FixedZipMetadata.bin")) {
          a5 = 2;
        }
        else {
          a5 = 3;
        }
      }
    }

    unint64_t v36 = v219;
  }

LABEL_20:
  if (v36) {
    int v43 = a5;
  }
  else {
    int v43 = 2;
  }
  int v44 = *(_DWORD *)(a9 + 32);
  BOOL v45 = v43 != 2 && v44 == 3;
  if (v45) {
    int v43 = 4;
  }
  if (v44) {
    int v46 = v43;
  }
  else {
    int v46 = 2;
  }
  unsigned int v215 = v46 - 3;
  int v212 = v46;
  if ((v46 - 3) < 2)
  {
    *((_WORD *)v14 + 2) = *(_DWORD *)(a9 + 36);
    unint64_t v47 = v36;
    uint64_t v48 = a4;
  }

  else
  {
    unint64_t v47 = v216;
    uint64_t v48 = a4;
    if (v46 != 1)
    {
      if (v46 != 2) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 333, "false");
      }
      *((_WORD *)v14 + 2) = 0;
      *((void *)v14 + 5) = v36;
      unint64_t v47 = v36;
    }
  }

  int v49 = v23[12];
  if (*((_BYTE *)v23 + 26)) {
    unsigned int v50 = a7;
  }
  else {
    unsigned int v50 = a6;
  }
  if (v49 == v50)
  {
    int v205 = 0;
    if (!v47) {
      goto LABEL_45;
    }
  }

  else
  {
    *((_WORD *)v14 + 14) = v49;
    int v205 = 1;
    if (!v47)
    {
LABEL_45:
      int v208 = 0;
      *((_WORD *)v14 + 1) &= ~8u;
      v23[2] &= ~8u;
      goto LABEL_50;
    }
  }

  if (v221 && v215 > 1) {
    goto LABEL_45;
  }
  __int16 v51 = *((_WORD *)v14 + 1);
  if (*(_BYTE *)(a9 + 47))
  {
    *((_WORD *)v14 + 1) = v51 | 8;
    v23[2] |= 8u;
    int v52 = 1;
  }

  else
  {
    *((_WORD *)v14 + 1) = v51 & 0xFFF7;
    v23[2] &= ~8u;
    int v52 = 2;
  }

  int v208 = v52;
LABEL_50:
  uint64_t v53 = *(void *)(a9 + 8);
  unint64_t v54 = *(void (**)(void, void, void, unint64_t, void))(v53 + 24);
  v207 = a2;
  if (v54)
  {
    v54(0LL, *((void *)v14 + 7), 0LL, v47, *(void *)(v53 + 32));
    uint64_t v53 = *(void *)(a9 + 8);
  }

  unint64_t v55 = CreateAndWriteLocalFileRecord((uint64_t)v14, v53);
  if (!v55)
  {
    size_t v38 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    uint64_t v129 = *((void *)v23 + 9);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v129;
    v39 = "Failed to write local file record for file %s to output file";
    goto LABEL_167;
  }

  int v56 = v55;
  uint64_t v198 = *((unsigned __int16 *)v55 + 14);
  uint64_t v199 = *((unsigned __int16 *)v55 + 13);
  unint64_t v211 = v47;
  if (!v47)
  {
    uint64_t v203 = a9;
    size_t v63 = 0LL;
    v64 = 0LL;
LABEL_64:
    *((void *)v23 + 8) = v209;
    if (v215 < 2)
    {
      if (!v64) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 617, "cmpStreamPtr");
      }
      v23[3] = *((_WORD *)v14 + 2);
      *((void *)v23 + 4) = v47;
    }

    else
    {
      if (v212 == 1) {
        goto LABEL_77;
      }
      if (v212 != 2) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 627, "false");
      }
      v23[3] = 0;
      *((void *)v23 + 4) = *((void *)v23 + 5);
    }

    if (!v221) {
      *((_DWORD *)v23 + 7) = v34;
    }
LABEL_77:
    if (v208)
    {
      if (v208 != 1)
      {
        if ((*((_WORD *)v14 + 1) & 8) != 0) {
          __assert_rtn( "ZipStreamWriteLocalFile",  "ZipStream.c",  638,  "!(newLFRecord->flags & ZIP_FLAGS_BIT_EXPECT_DATA_DESCRIPTOR)");
        }
        *((void *)v14 + 5) = v47;
        if (!v221) {
          *((_DWORD *)v14 + 8) = v34;
        }
        uint64_t v67 = (*(uint64_t (**)(void))(*(void *)(v203 + 8) + 72LL))(*(void *)(*(void *)(v203 + 8) + 80LL));
        if (v67 < 0)
        {
          int v127 = *__error();
          uint64_t v72 = (os_log_s *)SZGetLoggingHandle();
          uint32_t v61 = v63;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v128 = strerror(v127);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v128;
            int v74 = "Failed to get current offset to restore after writing local file record: %s";
            goto LABEL_170;
          }

      unint64_t v8 = 0LL;
      unint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      time_t v11 = 0LL;
LABEL_43:
      __int128 v15 = 0;
LABEL_44:
      size_t v14 = bytes;
      goto LABEL_45;
    }

    __int16 v30 = CloseLocalFile(v13);
    v69 = v30;
    if (v30)
    {
      size_t v31 = v30;
      uint64_t v32 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v71) = v31;
        int v33 = "Failed to close local file: %d";
        uLong v34 = v32;
        uint64_t v35 = 8;
LABEL_40:
        _os_log_error_impl(&dword_1870CA000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
        goto LABEL_41;
      }

      goto LABEL_41;
    }

    size_t v38 = v67;
    if (v67 != v6)
    {
      __int16 v51 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v71 = v5;
        uint64_t v72 = 2048;
        uint64_t v73 = v38;
        int v74 = 2048;
        int v75 = v6;
        int v33 = "Failed to read full info plist %s; read %ld bytes; expected %lld bytes";
        uLong v34 = v51;
        uint64_t v35 = 32;
        goto LABEL_40;
      }

LABEL_194:
          uint64_t v57 = 0LL;
          goto LABEL_195;
        }

        uint64_t v68 = v67;
        if (v209 != (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v203 + 8) + 64LL))( *(void *)(*(void *)(v203 + 8) + 80LL),  v209,  0LL))
        {
          int v130 = *__error();
          uint64_t v72 = (os_log_s *)SZGetLoggingHandle();
          uint32_t v61 = v63;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v131 = strerror(v130);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v131;
            int v74 = "Failed to seek to local compressed size offset in local file header: %s";
            goto LABEL_170;
          }

          goto LABEL_194;
        }

        free(v56);
        v69 = CreateAndWriteLocalFileRecord((uint64_t)v14, *(void *)(v203 + 8));
        uint32_t v61 = v63;
        if (!v69)
        {
          v154 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            uint64_t v173 = *((void *)v23 + 9);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v173;
            _os_log_error_impl( &dword_1870CA000,  v154,  OS_LOG_TYPE_ERROR,  "Failed to write local file record for file %s to output file",  buf,  0xCu);
          }

          uint64_t v57 = 0LL;
          int v56 = 0LL;
          goto LABEL_195;
        }

        int v56 = v69;
        unint64_t v70 = *((unsigned __int16 *)v69 + 13) + (unint64_t)*((unsigned __int16 *)v69 + 14) + 30;
        if (v199 + v198 + 30 != v70)
        {
          v155 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
            goto LABEL_194;
          }
          uint64_t v174 = *((void *)v23 + 9);
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v174;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v199 + v198 + 30;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v70;
          int v74 = "LocalFileHeader for %s changed in size when we updated it! Originally wrote %zu bytes; it's now %zu bytes.";
          v132 = buf;
          v135 = v155;
          uint32_t v136 = 32;
          goto LABEL_175;
        }

        if (v68 != (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v203 + 8) + 64LL))( *(void *)(*(void *)(v203 + 8) + 80LL),  v68,  0LL))
        {
          int v71 = *__error();
          uint64_t v72 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            uint64_t v73 = strerror(v71);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v73;
            int v74 = "Failed to seek to end of compressed data offset in local file header: %s";
LABEL_170:
            v132 = buf;
LABEL_174:
            v135 = v72;
            uint32_t v136 = 12;
LABEL_175:
            _os_log_error_impl(&dword_1870CA000, v135, OS_LOG_TYPE_ERROR, v74, v132, v136);
            goto LABEL_194;
          }

          goto LABEL_194;
        }

LABEL_159:
        ZipStreamAddStatisticsForCDRecord((uint64_t)v23, v205, (void *)a8);
        uint64_t v123 = *(void *)(v203 + 8);
        v124 = *(void (**)(uint64_t, void, void, unint64_t, void))(v123 + 24);
        if (v124) {
          v124(2LL, *((void *)v14 + 7), *((void *)v23 + 5), v211, *(void *)(v123 + 32));
        }
        DestroyMutableCDRecord(*v207);
        *v207 = (void **)v23;
        DestroyMutableLocalFileRecord(*a3);
        uint64_t v57 = 0LL;
        size_t v23 = 0LL;
        *a3 = (void **)v14;
        uint64_t v62 = 1LL;
        size_t v14 = 0LL;
        goto LABEL_196;
      }

      *(void *)&buf[12] = 0LL;
      *(void *)&uint8_t buf[4] = 0LL;
      BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField((uint64_t)v56);
      int v76 = *((_DWORD *)v23 + 7);
      if (HasZip64ExtraField)
      {
        *(void *)&uint8_t buf[4] = *((void *)v23 + 4);
        *(void *)&buf[12] = *((void *)v23 + 5);
        uint64_t v77 = 20LL;
      }

      else
      {
        uint64_t v120 = *((void *)v23 + 5);
        *(_DWORD *)&uint8_t buf[4] = *((void *)v23 + 4);
        *(_DWORD *)&buf[8] = v120;
        uint64_t v77 = 12LL;
      }

      *(_DWORD *)buf = v76;
      *__error() = 0;
      uint64_t v121 = (*(uint64_t (**)(void, const char *, uint64_t))(*(void *)(v203 + 8) + 48LL))( *(void *)(*(void *)(v203 + 8) + 80LL),  "PK\a\b",  4LL);
      v122 = __error();
      if (v121 == 4)
      {
        int *v122 = 0;
        if (v77 == (*(uint64_t (**)(void, _BYTE *, uint64_t))(*(void *)(v203 + 8) + 48LL))( *(void *)(*(void *)(v203 + 8) + 80LL),  buf,  v77)) {
          goto LABEL_158;
        }
        int v133 = *__error();
        uint64_t v72 = (os_log_s *)SZGetLoggingHandle();
        uint32_t v61 = v63;
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          goto LABEL_194;
        }
        v134 = strerror(v133);
        *(_DWORD *)v225 = 136315138;
        *(void *)&v225[4] = v134;
        int v74 = "Failed to write data descriptor: %s";
      }

      else
      {
        int v125 = *v122;
        uint64_t v72 = (os_log_s *)SZGetLoggingHandle();
        uint32_t v61 = v63;
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          goto LABEL_194;
        }
        v126 = strerror(v125);
        *(_DWORD *)v225 = 136315138;
        *(void *)&v225[4] = v126;
        int v74 = "Failed to write data descriptor signature: %s";
      }

      v132 = v225;
      goto LABEL_174;
    }

LABEL_158:
    uint32_t v61 = v63;
    goto LABEL_159;
  }

  int v224 = 0;
  if (!v48)
  {
    uint64_t v57 = OpenLocalFile(a1, (uint64_t)*v207, (char *)(*a3)[7], *((_WORD *)*a3 + 32), v212 == 1, &v224);
    if (!v224) {
      goto LABEL_56;
    }
    v66 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      uint64_t v159 = *((void *)v23 + 9);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v159;
      _os_log_error_impl(&dword_1870CA000, v66, OS_LOG_TYPE_ERROR, "Failed to open local file %s", buf, 0xCu);
    }

    uint32_t v61 = 0LL;
    v64 = 0LL;
LABEL_195:
    uint64_t v62 = 0LL;
    goto LABEL_196;
  }

  uint64_t v57 = 0LL;
LABEL_56:
  v194 = a3;
  stream = (uint64_t *)v57;
  if (v215 > 1)
  {
    v196 = v56;
    v222 = 0LL;
    off_t v65 = 0LL;
  }

  else
  {
    uint64_t v58 = (compression_stream *)calloc(1uLL, 0x28uLL);
    int v59 = *(_DWORD *)(a9 + 36);
    switch(v59)
    {
      case 8:
        compression_algorithm v60 = COMPRESSION_ZLIB;
        break;
      case 14:
        compression_algorithm v60 = COMPRESSION_LZMA;
        break;
      case 99:
        compression_algorithm v60 = COMPRESSION_LZFSE;
        break;
      default:
        compression_algorithm v60 = 0;
        break;
    }

    off_t v65 = v58;
    compression_status v78 = compression_stream_init(v58, COMPRESSION_STREAM_ENCODE, v60);
    if (v78)
    {
      compression_status v79 = v78;
      int v80 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v79;
        _os_log_error_impl( &dword_1870CA000,  v80,  OS_LOG_TYPE_ERROR,  "Failed to initialize compression stream: %d",  buf,  8u);
      }

      uint32_t v61 = 0LL;
      uint64_t v62 = 0LL;
      v64 = v65;
      goto LABEL_154;
    }

    v196 = v56;
    v222 = (uint8_t *)malloc(0x20000uLL);
  }

  int LocalFileData = 0;
  unint64_t v82 = 0LL;
  unint64_t v47 = 0LL;
  v195 = v12;
  if (v48) {
    int v12 = v48;
  }
  v201 = v23;
  v223 = v65;
  uint64_t v203 = a9;
  v200 = v14;
  while (1)
  {
    *(void *)v225 = 0LL;
    if (v48)
    {
      if (v211 - v82 >= 0x20000) {
        unint64_t v83 = 0x20000LL;
      }
      else {
        unint64_t v83 = v211 - v82;
      }
      if (v83 + v82 >= v211) {
        int LocalFileData = 2;
      }
      unint64_t v202 = v83;
    }

    else
    {
      int LocalFileData = ReadLocalFileData(stream, v12, 0x20000uLL, (size_t *)v225);
      if ((LocalFileData & 5) != 0)
      {
        int v224 = LocalFileData;
        int v157 = LocalFileData;
        v158 = (os_log_s *)SZGetLoggingHandle();
        int v12 = v195;
        int v56 = v196;
        if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v157;
          v137 = "ReadLocalFileData returned %d";
          v138 = v158;
          uint32_t v139 = 8;
          goto LABEL_178;
        }

        goto LABEL_152;
      }

      unint64_t v202 = 0LL;
      unint64_t v83 = *(void *)v225;
    }

    int v206 = LocalFileData;
    if (v221)
    {
      unint64_t v84 = v82;
    }

    else
    {
      unint64_t v84 = v82;
      if (v83)
      {
        unint64_t v85 = v83;
        size_t v86 = (const Bytef *)v12;
        do
        {
          if (v83 >= 0x7FFFFFFF) {
            uint64_t v87 = 0x7FFFFFFFLL;
          }
          else {
            uint64_t v87 = v83;
          }
          uLong v34 = crc32(v34, v86, v87);
          v86 += v87;
          v83 -= v87;
        }

        while (v83);
        goto LABEL_118;
      }
    }

    unint64_t v85 = v83;
    if (!v83)
    {
      uint64_t v48 = a4;
      unint64_t v82 = v84;
      size_t v14 = v200;
      size_t v23 = v201;
      goto LABEL_141;
    }

LABEL_118:
    unint64_t v88 = v85;
    unint64_t v82 = v85 + v84;
    uint64_t v89 = *(void *)(v21 + 8);
    v90 = v223;
    if (v223)
    {
      unint64_t v192 = v82;
      unint64_t v193 = v88;
      uint64_t v91 = (const uint8_t *)v12;
      unint64_t v92 = v88;
      size_t v14 = v200;
LABEL_120:
      uint64_t v93 = 0x7FFFFFFFFFFFFFFFLL;
      if (v92 < 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v93 = v92;
      }
      v90->src_ptr = v91;
      v90->size_t src_size = v93;
      uint64_t v197 = v93;
      while (1)
      {
        v90->dst_ptr = v222;
        v90->size_t dst_size = 0x20000LL;
        v94 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          src_ptr = v90->src_ptr;
          size_t src_size = v90->src_size;
          dst_ptr = v90->dst_ptr;
          size_t dst_size = v90->dst_size;
          *(_DWORD *)buf = 134218752;
          *(void *)&uint8_t buf[4] = src_ptr;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = src_size;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = dst_ptr;
          *(_WORD *)&buf[32] = 2048;
          *(void *)&buf[34] = dst_size;
          _os_log_debug_impl( &dword_1870CA000,  v94,  OS_LOG_TYPE_DEBUG,  "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x2Au);
        }

        compression_status v95 = compression_stream_process(v90, 0);
        if (v95)
        {
          compression_status v113 = v95;
          int v224 = v206;
          v114 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
            goto LABEL_151;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v113;
          v115 = "compression_stream_process returned error %d";
          v116 = v114;
          uint32_t v117 = 8;
          goto LABEL_205;
        }

        v96 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        {
          v103 = v223->src_ptr;
          size_t v104 = v223->src_size;
          v105 = v223->dst_ptr;
          size_t v106 = v223->dst_size;
          *(void *)buf = 67110144LL;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = v103;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v104;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v105;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = v106;
          _os_log_debug_impl( &dword_1870CA000,  v96,  OS_LOG_TYPE_DEBUG,  "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x30u);
        }

        v90 = v223;
        size_t v97 = v223->dst_size;
        size_t v98 = 0x20000 - v97;
        if (v97 == 0x20000)
        {
          v47 += v98;
LABEL_133:
          v91 += v197;
          v92 -= v197;
          if (v92) {
            goto LABEL_120;
          }
          size_t v23 = v201;
          uint64_t v21 = a9;
          uint64_t v48 = a4;
          int LocalFileData = v206;
          unint64_t v82 = v192;
          goto LABEL_141;
        }

        v90 = v223;
        v47 += v98;
        if (v223->dst_size) {
          goto LABEL_133;
        }
      }

      int v224 = v206;
      int v118 = *__error();
      v163 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
        goto LABEL_151;
      }
      v160 = strerror(v118);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v160;
      v115 = "fwrite failed to write out entire compressed buffer: %s";
      goto LABEL_204;
    }

    BOOL v45 = (*(uint64_t (**)(void, char *, unint64_t))(v89 + 48))(*(void *)(v89 + 80), v12, v88) == v88;
    unint64_t v107 = v88;
    size_t v14 = v200;
    size_t v23 = v201;
    uint64_t v48 = a4;
    if (!v45)
    {
      unint64_t v193 = v107;
      int v224 = v206;
      int v162 = *__error();
      v163 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
      {
LABEL_151:
        v119 = (os_log_s *)SZGetLoggingHandle();
        int v12 = v195;
        int v56 = v196;
        size_t v23 = v201;
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_152;
        }
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v193;
        v137 = "Failed to write %ld bytes of local file data to output file";
        goto LABEL_177;
      }

      v165 = strerror(v162);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v165;
      v115 = "fwrite failed to write out entire buffer: %s";
LABEL_204:
      v116 = v163;
      uint32_t v117 = 12;
LABEL_205:
      _os_log_error_impl(&dword_1870CA000, v116, OS_LOG_TYPE_ERROR, v115, buf, v117);
      goto LABEL_151;
    }

    v47 += v107;
    uint64_t v21 = a9;
    int LocalFileData = v206;
LABEL_141:
    uint64_t v108 = *(void *)(v21 + 8);
    v109 = *(void (**)(uint64_t, void, unint64_t, unint64_t, void))(v108 + 24);
    if (v109)
    {
      v109(1LL, *((void *)v14 + 7), v82, v211, *(void *)(v108 + 32));
      int LocalFileData = v206;
    }

    v110 = v223;
    if (LocalFileData == 2) {
      break;
    }
    v12 += v202;
    if (v211 <= v82)
    {
      int v224 = LocalFileData;
      int v111 = LocalFileData;
      v112 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v111;
        _os_log_error_impl( &dword_1870CA000,  v112,  OS_LOG_TYPE_ERROR,  "Consumed all data to copy without getting end of data signal; got status: %d",
          buf,
          8u);
      }

      uint64_t v62 = 0LL;
      int v12 = v195;
      int v56 = v196;
      uint32_t v61 = v222;
      v64 = v223;
      goto LABEL_154;
    }
  }

  int v224 = 2;
  unint64_t v140 = v211 - v82;
  int v56 = v196;
  if (v140)
  {
    v119 = (os_log_s *)SZGetLoggingHandle();
    int v12 = v195;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v140;
      v137 = "Breaking read/write loop with %llu bytes remaining";
LABEL_177:
      v138 = v119;
      uint32_t v139 = 12;
LABEL_178:
      _os_log_error_impl(&dword_1870CA000, v138, OS_LOG_TYPE_ERROR, v137, buf, v139);
    }

LABEL_152:
    uint64_t v62 = 0LL;
    v64 = v223;
LABEL_153:
    uint32_t v61 = v222;
    goto LABEL_154;
  }

  if (!v223)
  {
    int v12 = v195;
    a3 = v194;
LABEL_213:
    int v166 = v212;
    if (stream)
    {
      int v167 = CloseLocalFile((compression_stream *)stream);
      int v166 = v212;
      if (v167)
      {
        int v168 = v167;
        v169 = (os_log_s *)SZGetLoggingHandle();
        uint32_t v61 = v222;
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        {
          uint64_t v182 = *((void *)v201 + 9);
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v182;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v168;
          size_t v23 = v201;
          _os_log_error_impl(&dword_1870CA000, v169, OS_LOG_TYPE_ERROR, "Failed to close local file %s: %d", buf, 0x12u);
          uint64_t v57 = 0LL;
          uint64_t v62 = 0LL;
          v64 = v223;
        }

        else
        {
          uint64_t v57 = 0LL;
          uint64_t v62 = 0LL;
          v64 = v223;
          size_t v23 = v201;
        }

        goto LABEL_196;
      }
    }

    v64 = v223;
    size_t v23 = v201;
    if (v166 == 4 || !v223 || *(_BYTE *)(a9 + 47))
    {
LABEL_220:
      size_t v63 = v222;
      goto LABEL_64;
    }

    if ((v210 == 8 || v210 == 99 || v210 == 14) && v47 > v216 && v216 < v219 && *(_DWORD *)(a9 + 36) == v210)
    {
      v175 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v188 = *((void *)v201 + 9);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v188;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v47 - v216;
        _os_log_debug_impl( &dword_1870CA000,  v175,  OS_LOG_TYPE_DEBUG,  "%s is %llu bytes larger when we compressed it. Using original compressed data.",  buf,  0x16u);
      }

      uint64_t v176 = 1LL;
    }

    else
    {
      unint64_t v177 = v47 - v219;
      if (v47 < v219) {
        goto LABEL_220;
      }
      if (v210 == 8 || v210 == 99 || v210 == 14)
      {
        int v178 = *(_DWORD *)(a9 + 36);
        v179 = (os_log_s *)SZGetLoggingHandle();
        BOOL v180 = os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG);
        if (v178 == v210)
        {
          if (v180)
          {
            uint64_t v189 = *((void *)v201 + 9);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v189;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v47 - v219;
            _os_log_debug_impl( &dword_1870CA000,  v179,  OS_LOG_TYPE_DEBUG,  "%s is %llu bytes larger compressed than uncompressed; converting.",
              buf,
              0x16u);
          }

          int64x2_t v181 = vdupq_n_s64(1uLL);
          v181.i64[0] = v47 - v219;
          *(int64x2_t *)(a8 + 40) = vaddq_s64(v181, *(int64x2_t *)(a8 + 40));
        }

        else
        {
          if (v180)
          {
            uint64_t v190 = *((void *)v201 + 9);
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v190;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v47 - v216;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v47 - v219;
            _os_log_debug_impl( &dword_1870CA000,  v179,  OS_LOG_TYPE_DEBUG,  "%s is %llu bytes larger with the new compression method and is %llu bytes larger than uncompressed; storing uncompressed.",
              buf,
              0x20u);
          }

          ++*(void *)(a8 + 56);
        }

        uint64_t v176 = 2LL;
      }

      else
      {
        v184 = (os_log_s *)SZGetLoggingHandle();
        uint64_t v176 = 2LL;
        if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v191 = *((void *)v201 + 9);
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v191;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v177;
          _os_log_debug_impl( &dword_1870CA000,  v184,  OS_LOG_TYPE_DEBUG,  "%s was not compressed before, and was %llu bytes larger when compressed. Storing uncompressed.",  buf,  0x16u);
        }
      }
    }

    if (v209 == (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a9 + 8) + 64LL))( *(void *)(*(void *)(a9 + 8) + 80LL),  v209,  0LL))
    {
      uint64_t v62 = ZipStreamWriteLocalFile(a1, v207, a3, a4, v176, a6, a7, a8, a9);
      uint64_t v57 = 0LL;
    }

    else
    {
      int v185 = *__error();
      v186 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
      {
        v187 = strerror(v185);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v187;
        _os_log_error_impl( &dword_1870CA000,  v186,  OS_LOG_TYPE_ERROR,  "Failed to seek back to start of local file header: %s",  buf,  0xCu);
      }

      uint64_t v57 = 0LL;
      uint64_t v62 = 0LL;
    }

    int v12 = v195;
    uint32_t v61 = v222;
    v64 = v223;
    size_t v14 = v200;
    size_t v23 = v201;
    goto LABEL_196;
  }

  do
  {
    v110->dst_ptr = v222;
    v110->size_t dst_size = 0x20000LL;
    v141 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
    {
      v146 = v110->src_ptr;
      size_t v147 = v110->src_size;
      v148 = v110->dst_ptr;
      size_t v149 = v110->dst_size;
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = v146;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v147;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v148;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = v149;
      _os_log_debug_impl( &dword_1870CA000,  v141,  OS_LOG_TYPE_DEBUG,  "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x2Au);
    }

    compression_status v142 = compression_stream_process(v110, 1);
    v143 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
    {
      v150 = v110->src_ptr;
      size_t v151 = v110->src_size;
      v152 = v110->dst_ptr;
      size_t v153 = v110->dst_size;
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&uint8_t buf[4] = v142;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v150;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v151;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v152;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = v153;
      _os_log_debug_impl( &dword_1870CA000,  v143,  OS_LOG_TYPE_DEBUG,  "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu",  buf,  0x30u);
    }

    size_t v144 = v110->dst_size;
    if (!(v144 >> 17))
    {
      size_t v145 = 0x20000 - v144;
      *__error() = 0;
      if (v145 != (*(uint64_t (**)(void, uint8_t *, size_t))(*(void *)(v21 + 8) + 48LL))( *(void *)(*(void *)(v21 + 8) + 80LL),  v222,  v145))
      {
        int v171 = *__error();
        v172 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
        {
          v183 = strerror(v171);
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v183;
          _os_log_error_impl( &dword_1870CA000,  v172,  OS_LOG_TYPE_ERROR,  "Failed to write final compressed data: %s",  buf,  0xCu);
        }

        uint64_t v62 = 0LL;
        int v12 = v195;
        int v56 = v196;
        v64 = v223;
        size_t v23 = v201;
        goto LABEL_153;
      }

      v47 += v145;
      v110 = v223;
    }
  }

  while (v142 == COMPRESSION_STATUS_OK);
  a3 = v194;
  if (v142 == COMPRESSION_STATUS_END)
  {
    int v12 = v195;
    int v56 = v196;
    goto LABEL_213;
  }

  v170 = (os_log_s *)SZGetLoggingHandle();
  int v12 = v195;
  uint32_t v61 = v222;
  if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v142;
    _os_log_error_impl( &dword_1870CA000,  v170,  OS_LOG_TYPE_ERROR,  "compression_stream_process with finalize did not return compression_status_end: %d",  buf,  8u);
  }

  uint64_t v62 = 0LL;
  int v56 = v196;
  v64 = v223;
  size_t v23 = v201;
LABEL_154:
  uint64_t v57 = (unsigned __int16 *)stream;
LABEL_196:
  if (v64)
  {
    compression_stream_destroy(v64);
    free(v64);
  }

  if (v57) {
    CloseLocalFile((compression_stream *)v57);
  }
LABEL_200:
  DestroyMutableCDRecord((void **)v23);
  DestroyMutableLocalFileRecord((void **)v14);
  free(v56);
  free(v61);
  free(v12);
  return v62;
}

BOOL ZipStreamConcoctStreamData( uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v39 = a2;
  uint64_t valuePtr = a1;
  __int16 v38 = a3;
  __int16 v37 = a4;
  int v12 = time(0LL);
  int v13 = time(0LL);
  CDRecord = CreateCDRecord("META-INF/com.apple.ZipMetadata.plist", 33188, v12, v13);
  __int128 v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFNumberRef v17 = CFNumberCreate(v15, kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(Mutable, @"RecordCount", v17);
  CFRelease(v17);
  CFNumberRef v18 = CFNumberCreate(v15, kCFNumberSInt64Type, &v39);
  CFDictionaryAddValue(Mutable, @"TotalUncompressedBytes", v18);
  CFRelease(v18);
  int v36 = 2;
  CFNumberRef v19 = CFNumberCreate(v15, kCFNumberIntType, &v36);
  CFDictionaryAddValue(Mutable, @"Version", v19);
  CFRelease(v19);
  CFNumberRef v20 = CFNumberCreate(v15, kCFNumberSInt16Type, &v38);
  CFDictionarySetValue(Mutable, @"StandardFilePerms", v20);
  CFRelease(v20);
  CFNumberRef v21 = CFNumberCreate(v15, kCFNumberSInt16Type, &v37);
  CFDictionarySetValue(Mutable, @"StandardDirectoryPerms", v21);
  CFRelease(v21);
  uint64_t v22 = *(const void **)(a5 + 16);
  if (v22) {
    CFDictionarySetValue(Mutable, @"CreatorToolCommandLine", v22);
  }
  size_t v23 = *(const void **)(a5 + 24);
  if (v23) {
    CFDictionarySetValue(Mutable, @"CreatorToolUUID", v23);
  }
  Data = CFPropertyListCreateData(v15, Mutable, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  __int128 v25 = Data;
  if (Data)
  {
    size_t Length = CFDataGetLength(Data);
    if (Length >= 0xFFFFFFFF) {
      __assert_rtn("ZipStreamConcoctStreamData", "ZipStream.c", 807, "dataLength < UINT32_MAX");
    }
    uInt v27 = Length;
    __int128 v28 = malloc(Length);
    BytePtr = CFDataGetBytePtr(v25);
    size_t v30 = CFDataGetLength(v25);
    memcpy(v28, BytePtr, v30);
    CFRelease(v25);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v27;
    CDRecord[6] = v27;
    uLong v31 = crc32(0LL, 0LL, 0);
    CDRecord[4] = crc32(v31, (const Bytef *)v28, v27);
    *a6 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a7 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(CDRecord);
    free(LocalFileRecord);
    *a8 = v28;
  }

  else
  {
    int v33 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v35 = 0;
      _os_log_error_impl(&dword_1870CA000, v33, OS_LOG_TYPE_ERROR, "Failed to serialize stream data", v35, 2u);
    }

    free(CDRecord);
  }

  CFRelease(Mutable);
  return v25 != 0LL;
}

BOOL ZipStreamConcoctFixedStreamData(uint64_t a1, void *a2, void *a3, const Bytef **a4)
{
  int v8 = time(0LL);
  int v9 = time(0LL);
  CDRecord = CreateCDRecord("META-INF/com.apple.FixedZipMetadata.bin", 33188, v8, v9);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 44);
  size_t v12 = gHashDigestSizes[v11];
  int v13 = v12 + 7;
  size_t v14 = (char *)malloc(v12 + 7);
  __int128 v15 = (const Bytef *)v14;
  if (v14)
  {
    *(_DWORD *)size_t v14 = 2017879117;
    v14[4] = v11 + 1;
    *(_WORD *)(v14 + 5) = v12;
    bzero(v14 + 7, v12);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v13;
    CDRecord[6] = v13;
    uLong v16 = crc32(0LL, 0LL, 0);
    CDRecord[4] = crc32(v16, v15, (int)v12 + 7);
    *a2 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a3 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(LocalFileRecord);
    *a4 = v15;
  }

  free(CDRecord);
  return v15 != 0LL;
}

uint64_t ZipStreamShouldOrderFileEarly(const char *a1, _BYTE *a2)
{
  *a2 = 0;
  if (!strncmp(a1, "com.apple.deltainstallcommands.", 0x1FuLL)) {
    return 1LL;
  }
  if (!strncmp(a1, "Payload/", 8uLL))
  {
    if (strcmp(a1, "Payload/"))
    {
      BOOL v5 = strdup(a1 + 8);
      unint64_t v6 = strchr(v5, 47);
      if (v6)
      {
        unint64_t v7 = v6;
        *unint64_t v6 = 0;
        int v8 = rindex(v5, 46);
        if (!v8)
        {
LABEL_11:
          uint64_t v4 = 0LL;
          *unint64_t v7 = 47;
LABEL_20:
          free(v5);
          return v4;
        }

        int v9 = v8;
        size_t v10 = strlen(v8);
        uint64_t v11 = 0LL;
        while (strlen(bundle_extensions[v11]) != v10 || strcasecmp(v9, bundle_extensions[v11]))
        {
          if (++v11 == 3) {
            goto LABEL_11;
          }
        }

        *unint64_t v7 = 47;
        int v13 = v7[1];
        size_t v12 = v7 + 1;
        if (!v13
          || !strncmp(v12, "_CodeSignature/", 0xFuLL)
          || !strcmp(v12, "embedded.mobileprovision")
          || !strcmp(v12, "ResourceRules.plist"))
        {
          uint64_t v4 = 1LL;
          goto LABEL_20;
        }

        if (!strcmp(v12, "Info.plist"))
        {
          uint64_t v4 = 1LL;
          *a2 = 1;
          goto LABEL_20;
        }
      }

      uint64_t v4 = 0LL;
      goto LABEL_20;
    }

    return 1LL;
  }

  return 0LL;
}

uint64_t ZipStreamWriteCentralDirectoryAndEndRecords( const __CFArray *a1, CFIndex a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v153 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a5 + 8);
  uint64_t v7 = *(void *)(v6 + 80);
  if (!*(_BYTE *)(a5 + 49))
  {
    size_t v10 = (void *)a5;
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(v6 + 72))(v7);
    if (v14 < 0)
    {
      int v65 = *__error();
      v66 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = strerror(v65);
        uint64_t v67 = "ftello before writing central directory failed: %s";
        goto LABEL_92;
      }

      goto LABEL_93;
    }

    uint64_t v15 = v14;
    uint64_t v132 = v14;
    uint64_t v133 = a4;
    v134 = a1;
    v135 = v10;
    if (!*v10 || *((_BYTE *)v10 + 47))
    {
      int v16 = 0;
LABEL_10:
      int v131 = v16;
      CFNumberRef v17 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1870CA000, v17, OS_LOG_TYPE_DEBUG, "Writing Central Directory", buf, 2u);
      }

      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        for (CFIndex i = 0LL; Count != i; ++i)
        {
          ValueAtIndex = (unsigned __int16 *)CFArrayGetValueAtIndex(a1, i);
          CFNumberRef v20 = ValueAtIndex;
          unsigned int v21 = ValueAtIndex[3];
          if (v21 > 0xD)
          {
            uint64_t v22 = (void *)(v133 + 88);
            if (v21 != 14)
            {
              uint64_t v22 = (void *)(v133 + 80);
              if (v21 != 99) {
LABEL_20:
              }
                uint64_t v22 = (void *)(v133 + 96);
            }
          }

          else
          {
            uint64_t v22 = (void *)(v133 + 64);
            if (ValueAtIndex[3])
            {
              uint64_t v22 = (void *)(v133 + 72);
              if (v21 != 8) {
                goto LABEL_20;
              }
            }
          }

          ++*v22;
          uint64_t v23 = v10[1];
          *(void *)buf = 0LL;
          unsigned __int16 v24 = 8 * (*((void *)ValueAtIndex + 5) > 0xFFFFFFFEuLL);
          if (*((void *)ValueAtIndex + 4) > 0xFFFFFFFEuLL) {
            v24 += 8;
          }
          if (*((void *)ValueAtIndex + 8) > 0xFFFFFFFEuLL) {
            v24 += 8;
          }
          if (*((_DWORD *)ValueAtIndex + 13) <= 0xFFFEu) {
            unsigned __int16 v25 = v24;
          }
          else {
            unsigned __int16 v25 = v24 | 4;
          }
          __int128 v26 = 0LL;
          if (_GetExtraFieldOfLength(ValueAtIndex + 44, &kZip64ExtraFieldSignature, v25, buf))
          {
            uint64_t v27 = *(void *)buf;
            if (*(void *)buf)
            {
              unint64_t v28 = *((void *)v20 + 5);
              if (v28 < 0xFFFFFFFF)
              {
                size_t v29 = (unint64_t *)(*(void *)buf + 4LL);
              }

              else
              {
                *(void *)(*(void *)buf + 4LL) = v28;
                size_t v29 = (unint64_t *)(v27 + 12);
              }

              unint64_t v30 = *((void *)v20 + 4);
              if (v30 >= 0xFFFFFFFF) {
                *v29++ = v30;
              }
              unint64_t v31 = *((void *)v20 + 8);
              if (v31 >= 0xFFFFFFFF) {
                *v29++ = v31;
              }
              unsigned int v32 = *((_DWORD *)v20 + 13);
              if (v32 >= 0xFFFF) {
                *(_DWORD *)size_t v29 = v32;
              }
            }

            *(void *)buf = 0LL;
            __int128 v26 = 0LL;
            if (_GetExtraFieldOfLength( v20 + 44,  &kInfoZipExtraFieldSignature,  8 * (*((void *)v20 + 2) != *((void *)v20 + 1)),  buf))
            {
              uint64_t v33 = *(void *)buf;
              if (*(void *)buf)
              {
                unint64_t v34 = *((void *)v20 + 1);
                if (v34 > 0xFFFFFFFE) {
                  LODWORD(v34) = -1;
                }
                *(_DWORD *)(*(void *)buf + 4LL) = v34;
                unint64_t v35 = *((void *)v20 + 2);
                if (v35 > 0xFFFFFFFE) {
                  LODWORD(v35) = -1;
                }
                *(_DWORD *)(v33 + 8) = v35;
              }

              size_t v36 = strlen(*((const char **)v20 + 9));
              if (v36 >= 0x10000) {
                __assert_rtn( "CreateCDRecordFromMutable",  "MutableZipStructure.c",  379,  "file_name_length <= UINT16_MAX");
              }
              size_t v37 = v36;
              __int16 v38 = (char *)malloc(v36 + v20[44] + v20[24] + 46);
              __int128 v26 = v38;
              *(_DWORD *)__int16 v38 = 33639248;
              *((_WORD *)v38 + 2) = *v20;
              if (v25) {
                __int16 v39 = 45;
              }
              else {
                __int16 v39 = v20[1];
              }
              *((_WORD *)v38 + 3) = v39;
              *((_WORD *)v38 + 4) = v20[2];
              *((_WORD *)v38 + 5) = v20[3];
              *((_DWORD *)v38 + 3) = UNIX2DOSTime(*((void *)v20 + 2));
              *((_DWORD *)v26 + 4) = *((_DWORD *)v20 + 7);
              int8x16_t v40 = *((int8x16_t *)v20 + 2);
              v41.i64[0] = 0xFFFFFFFFLL;
              v41.i64[1] = 0xFFFFFFFFLL;
              int8x16_t v42 = (int8x16_t)vcgtq_u64(v41, (uint64x2_t)v40);
              *(int32x2_t *)(v26 + 20) = vmovn_s64((int64x2_t)vornq_s8(vandq_s8(v40, v42), v42));
              *((_WORD *)v26 + 14) = v37;
              size_t v43 = v20[44];
              *((_WORD *)v26 + 15) = v43;
              size_t v44 = v20[24];
              *((_WORD *)v26 + 16) = v44;
              unsigned int v45 = *((_DWORD *)v20 + 13);
              if (v45 >= 0xFFFF) {
                LOWORD(v45) = -1;
              }
              *((_WORD *)v26 + 17) = v45;
              *((_WORD *)v26 + 18) = v20[28];
              *(_DWORD *)(v26 + 38) = (v20[12] << 16) | 0x4000;
              unint64_t v46 = *((void *)v20 + 8);
              if (v46 >= 0xFFFFFFFF) {
                LODWORD(v46) = -1;
              }
              *(_DWORD *)(v26 + 42) = v46;
              memcpy(v26 + 46, *((const void **)v20 + 9), v37);
              unint64_t v47 = &v26[v37 + 46];
              memcpy(v47, *((const void **)v20 + 12), v43);
              memcpy(&v47[v43], *((const void **)v20 + 10), v44);
              a1 = v134;
              size_t v10 = v135;
            }
          }

          unint64_t v48 = *((unsigned __int16 *)v26 + 14)
              + (unint64_t)*((unsigned __int16 *)v26 + 15)
          uint64_t v49 = (*(uint64_t (**)(void, char *, unint64_t))(v23 + 48))( *(void *)(v23 + 80),  v26,  v48);
          if (v49 == v48) {
            unsigned int v50 = 0LL;
          }
          else {
            unsigned int v50 = v26;
          }
          free(v50);
          if (v49 != v48 || !v26)
          {
            v66 = (os_log_s *)SZGetLoggingHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              uint64_t v68 = __error();
              v69 = strerror(*v68);
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = v69;
              uint64_t v67 = "Failed to write central directory record: %s";
              goto LABEL_92;
            }

            goto LABEL_93;
          }

          free(v26);
        }
      }

      __int16 v51 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( &dword_1870CA000,  v51,  OS_LOG_TYPE_DEBUG,  "Writing end of central directory records",  buf,  2u);
      }

      uint64_t v52 = (*(uint64_t (**)(void))(v10[1] + 72LL))(*(void *)(v10[1] + 80LL));
      if ((v52 & 0x8000000000000000LL) == 0)
      {
        uint64_t v53 = v52;
        uint64_t v54 = v52 - v132;
        unint64_t v55 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v108 = *(void *)(v133 + 136);
          uint64_t v107 = *(void *)(v133 + 144);
          *(_DWORD *)buf = 134219008;
          *(void *)&uint8_t buf[4] = Count;
          *(_WORD *)v146 = 2048;
          *(void *)&v146[2] = v132;
          __int16 v147 = 2048;
          uint64_t v148 = v54;
          __int16 v149 = 2048;
          uint64_t v150 = v107;
          __int16 v151 = 2048;
          uint64_t v152 = v108;
          _os_log_debug_impl( &dword_1870CA000,  v55,  OS_LOG_TYPE_DEBUG,  "Zip64 triggers: total_cd_records %lu; cd_offset %lld; cd_length %llu; max compressed_size %llu; max uncompressed_size %llu",
            buf,
            0x34u);
        }

        if (v132 > 4294967294LL
          || Count > 65534
          || v54 > 4294967294LL
          || *(void *)(v133 + 136) > 0xFFFFFFFEuLL
          || *(void *)(v133 + 144) > 0xFFFFFFFEuLL)
        {
          int v56 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1870CA000, v56, OS_LOG_TYPE_DEBUG, "Writing Zip64 records", buf, 2u);
          }

          *(_BYTE *)(v133 + 200) = 1;
          uint64_t v57 = calloc(1uLL, 0x14uLL);
          v57[4] = 1;
          *uint64_t v57 = 117853008;
          uint64_t v58 = (char *)calloc(1uLL, 0x38uLL);
          *(_DWORD *)uint64_t v58 = 101075792;
          *(void *)(v58 + 4) = 44LL;
          *((_DWORD *)v58 + 3) = 2949918;
          *((void *)v57 + 1) = v53;
          *((void *)v58 + 3) = Count;
          *((void *)v58 + 4) = Count;
          *((void *)v58 + 5) = v54;
          *((void *)v58 + 6) = v132;
          unint64_t v59 = *(void *)(v58 + 4) + 12LL;
          if (v59 >= 0x7FFFFFFFFFFFFFFFLL) {
            __assert_rtn("ZipStreamWriteCentralDirectoryAndEndRecords", "ZipStream.c", 1242, "writeSize < INTPTR_MAX");
          }
          compression_algorithm v60 = v58;
          *__error() = 0;
          uint64_t v61 = (*(uint64_t (**)(void, void *, unint64_t))(v135[1] + 48LL))( *(void *)(v135[1] + 80LL),  v60,  v59);
          uint64_t v62 = __error();
          if (v59 == v61)
          {
            *uint64_t v62 = 0;
            if ((*(uint64_t (**)(void, _DWORD *, uint64_t))(v135[1] + 48LL))( *(void *)(v135[1] + 80LL),  v57,  20LL) == 20)
            {
              memset(v146, 0, sizeof(v146));
              *(void *)&uint8_t buf[4] = 0LL;
              *(_DWORD *)buf = 101010256;
              if (Count >= 0x10000) {
                LOWORD(Count) = -1;
              }
              goto LABEL_112;
            }

            int v90 = *__error();
            unint64_t v84 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              goto LABEL_134;
            }
            uint64_t v91 = strerror(v90);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v91;
            size_t v86 = "Failed to write zip64 end record locator: %s";
          }

          else
          {
            int v83 = *v62;
            unint64_t v84 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              goto LABEL_134;
            }
            unint64_t v85 = strerror(v83);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v85;
            size_t v86 = "Failed to write zip64 end record: %s";
          }

          unint64_t v92 = buf;
LABEL_133:
          _os_log_error_impl(&dword_1870CA000, v84, OS_LOG_TYPE_ERROR, v86, v92, 0xCu);
          goto LABEL_134;
        }

        compression_algorithm v60 = 0LL;
        uint64_t v57 = 0LL;
        memset(v146, 0, sizeof(v146));
        *(void *)&uint8_t buf[4] = 0LL;
        *(_DWORD *)buf = 101010256;
LABEL_112:
        *(_WORD *)&buf[8] = Count;
        *(_WORD *)&buf[10] = Count;
        int v93 = -1;
        if (v54 >= 0xFFFFFFFFLL) {
          int v94 = -1;
        }
        else {
          int v94 = v54;
        }
        if (v132 < 0xFFFFFFFFLL) {
          int v93 = v132;
        }
        *(_DWORD *)v146 = v94;
        *(_DWORD *)&v146[4] = v93;
        *__error() = 0;
        if ((*(uint64_t (**)(void, _BYTE *, uint64_t))(v135[1] + 48LL))( *(void *)(v135[1] + 80LL),  buf,  22LL) == 22)
        {
          unint64_t v95 = (*(uint64_t (**)(void))(v135[1] + 72LL))(*(void *)(v135[1] + 80LL));
          if ((v95 & 0x8000000000000000LL) == 0)
          {
            if (!*v135 || v131)
            {
              unint64_t v96 = v132 + 4;
            }

            else
            {
              unint64_t v96 = *v135 + (unint64_t)v132 / *v135 * *v135;
              if (v96 >= v95) {
                unint64_t v96 = v95;
              }
            }

            *(void *)(v133 + 128) = v96;
            *(void *)(v133 + 104) = v95 - v132;
            uint64_t v9 = 1LL;
            goto LABEL_135;
          }

          int v104 = *__error();
          unint64_t v84 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_134;
          }
          v105 = strerror(v104);
          *(_DWORD *)uint32_t v139 = 136315138;
          unint64_t v140 = v105;
          size_t v86 = "Failed to determine offset of output file: %s";
          goto LABEL_132;
        }

        int v97 = *__error();
        unint64_t v84 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          size_t v98 = strerror(v97);
          *(_DWORD *)uint32_t v139 = 136315138;
          unint64_t v140 = v98;
          size_t v86 = "Failed to write end record: %s";
LABEL_132:
          unint64_t v92 = v139;
          goto LABEL_133;
        }

LABEL_134:
        uint64_t v9 = 0LL;
        goto LABEL_135;
      }

      int v81 = *__error();
      v66 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        unint64_t v82 = strerror(v81);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v82;
        uint64_t v67 = "ftello after writing central directory failed: %s";
LABEL_92:
        _os_log_error_impl(&dword_1870CA000, v66, OS_LOG_TYPE_ERROR, v67, buf, 0xCu);
      }

LABEL_93:
      uint64_t v9 = 0LL;
LABEL_94:
      uint64_t v57 = 0LL;
      compression_algorithm v60 = 0LL;
LABEL_135:
      free(v60);
      free(v57);
      return v9;
    }

    unint64_t v70 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1870CA000, v70, OS_LOG_TYPE_DEBUG, "Writing partial hash", buf, 2u);
    }

    int v71 = CFArrayGetValueAtIndex(a1, a2);
    uint64_t v72 = malloc(0x400000uLL);
    size_t v73 = gHashDigestSizes[*((unsigned __int8 *)v10 + 44)];
    v138 = (unsigned __int8 *)malloc(v73);
    uint64_t v74 = v15 + 4;
    uint64_t v75 = (v15 + 4) / *v10 * *v10;
    int v76 = (char *)v71[8];
    size_t v77 = (size_t)&v76[strlen(*(const char **)(a3 + 56)) + *(unsigned __int16 *)(a3 + 64)];
    size_t v78 = v77 + 37;
    if (v75 < (uint64_t)(v77 + 37 + v73))
    {
      compression_status v79 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        int v80 = "Not computing partial hash for last chunk because last chunk includes metadata digest";
LABEL_161:
        _os_log_debug_impl(&dword_1870CA000, v79, OS_LOG_TYPE_DEBUG, v80, buf, 2u);
        goto LABEL_127;
      }

      goto LABEL_127;
    }

    uint64_t v87 = v74 - v75;
    if (!v87)
    {
      compression_status v79 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        int v80 = "Not computing partial hash for last chunk because central directory signature ends at a chunk boundary.";
        goto LABEL_161;
      }

      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      unsigned __int16 v25 = 0LL;
      __int128 v26 = 0;
      if (!v27) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    compression_algorithm v60 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(buf[0].st_dev) = 0;
    uint64_t v61 = "Failed to concoct fixed stream data";
LABEL_139:
    unint64_t v88 = (uint8_t *)buf;
    goto LABEL_140;
  }

LABEL_127:
      int v16 = 0;
      uint64_t v9 = 1LL;
      a1 = v134;
      goto LABEL_182;
    }

    uint32_t v136 = v72;
    if (v87 <= 0) {
      __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1016, "chunkStart < hashEndOffset");
    }
    *__error() = 0;
    if ((*(uint64_t (**)(void, void *, uint64_t))(v10[1] + 48LL))( *(void *)(v10[1] + 80LL),  &kCDRecordSignature,  4LL) == 4)
    {
      GenericHashInit((uint64_t)buf, *((unsigned __int8 *)v10 + 44));
      if (v75 == (*(uint64_t (**)(void, uint64_t, void))(v10[1] + 64LL))( *(void *)(v10[1] + 80LL),  v75,  0LL))
      {
        while (v87)
        {
          else {
            unint64_t v88 = v87;
          }
          uint64_t v89 = (*(uint64_t (**)(void, void *, unint64_t))(v10[1] + 56LL))( *(void *)(v10[1] + 80LL),  v72,  v88);
          if (v89 != v88)
          {
            int v118 = (char *)v89;
            int v119 = *__error();
            uint64_t v120 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
              goto LABEL_180;
            }
            *(_DWORD *)uint32_t v139 = 134218498;
            unint64_t v140 = (char *)v88;
            __int16 v141 = 2048;
            compression_status v142 = v118;
            __int16 v143 = 2080;
            size_t v144 = strerror(v119);
            v102 = "Expected to read %ld bytes, but only got %ld bytes from outfile: %s";
LABEL_157:
            v103 = v139;
            v110 = v120;
            uint32_t v111 = 32;
LABEL_143:
            _os_log_error_impl(&dword_1870CA000, v110, OS_LOG_TYPE_ERROR, v102, v103, v111);
            goto LABEL_180;
          }

          GenericHashUpdate((uint64_t)buf, v72, v88);
          v87 -= v88;
          if (v87 < 0) {
            __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1048, "remaining >= 0");
          }
        }

        GenericHashFinal(v138, (uint64_t)buf);
        uint64_t v112 = (*(uint64_t (**)(void, size_t, void))(v10[1] + 64LL))(*(void *)(v10[1] + 80LL), v78, 0LL);
        compression_status v113 = __error();
        if (v78 != v112)
        {
          int v121 = *v113;
          v122 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
            goto LABEL_180;
          }
          *(_DWORD *)uint32_t v139 = 134218242;
          unint64_t v140 = (char *)(v77 + 37);
          __int16 v141 = 2080;
          compression_status v142 = strerror(v121);
          v102 = "Failed to seek to digest offset %llu in fixed metadata: %s";
          goto LABEL_175;
        }

        *compression_status v113 = 0;
        if (v73 == (*(uint64_t (**)(void, unsigned __int8 *, size_t))(v10[1] + 48LL))( *(void *)(v10[1] + 80LL),  v138,  v73))
        {
          if (v77 + 30 == (*(uint64_t (**)(void, size_t, void))(v10[1] + 64LL))( *(void *)(v10[1] + 80LL),  v77 + 30,  0LL))
          {
            uLong v114 = crc32(0LL, 0LL, 0);
            uint64_t v115 = *(void *)(a3 + 48);
            while (v115 >= 1)
            {
              else {
                uint64_t v116 = v115;
              }
              uint64_t v117 = (*(uint64_t (**)(void, void *, uint64_t))(v10[1] + 56LL))( *(void *)(v10[1] + 80LL),  v72,  v116);
              if (v117 != v116)
              {
                v126 = (char *)v117;
                int v127 = *__error();
                uint64_t v120 = (os_log_s *)SZGetLoggingHandle();
                if (!os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_180;
                }
                *(_DWORD *)uint32_t v139 = 134218498;
                unint64_t v140 = (char *)v116;
                __int16 v141 = 2048;
                compression_status v142 = v126;
                __int16 v143 = 2080;
                size_t v144 = strerror(v127);
                v102 = "Expected to read %ld bytes, but only got %ld bytes from outfile: %s";
                goto LABEL_157;
              }

              uLong v114 = crc32(v114, (const Bytef *)v72, v116);
              v115 -= v116;
              if (v115 < 0) {
                __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1089, "remaining >= 0");
              }
            }

            *(_DWORD *)(a3 + 32) = v114;
            if (v76 == (char *)(*(uint64_t (**)(void, char *, void))(v10[1] + 64LL))( *(void *)(v10[1] + 80LL),  v76,  0LL))
            {
              int v125 = CreateAndWriteLocalFileRecord(a3, v10[1]);
              if (!v125)
              {
                uint64_t v129 = (os_log_s *)SZGetLoggingHandle();
                if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_180;
                }
                *(_WORD *)uint32_t v139 = 0;
                v102 = "Failed to write updated fixed metadata LF record";
                v103 = v139;
                v110 = v129;
                uint32_t v111 = 2;
                goto LABEL_143;
              }

              free(v125);
              *((_DWORD *)v71 + 7) = *(_DWORD *)(a3 + 32);
              if ((*(uint64_t (**)(void, uint64_t, void))(v10[1] + 64LL))( *(void *)(v10[1] + 80LL),  v132,  0LL) == v132)
              {
                int v16 = 1;
                uint64_t v9 = 1LL;
                goto LABEL_181;
              }

              int v130 = *__error();
              uint64_t v100 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint32_t v139 = 136315138;
                unint64_t v140 = strerror(v130);
                v102 = "Failed to seek to the beginning of the central directory: %s";
                goto LABEL_141;
              }

LABEL_180:
              int v16 = 0;
              uint64_t v9 = 0LL;
LABEL_181:
              a1 = v134;
              uint64_t v72 = v136;
LABEL_182:
              free(v72);
              free(v138);
              size_t v10 = v135;
              if (!(_DWORD)v9) {
                goto LABEL_94;
              }
              goto LABEL_10;
            }

            int v128 = *__error();
            v122 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
              goto LABEL_180;
            }
            *(_DWORD *)uint32_t v139 = 134218242;
            unint64_t v140 = v76;
            __int16 v141 = 2080;
            compression_status v142 = strerror(v128);
            v102 = "Failed to seek to fixed metadata LF header at offset %llu: %s";
          }

          else
          {
            int v124 = *__error();
            v122 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
              goto LABEL_180;
            }
            *(_DWORD *)uint32_t v139 = 134218242;
            unint64_t v140 = (char *)(v77 + 30);
            __int16 v141 = 2080;
            compression_status v142 = strerror(v124);
            v102 = "Failed to seek to beginning of fixed metadata file data %llu: %s";
          }

LABEL_175:
          v103 = v139;
          v110 = v122;
          uint32_t v111 = 22;
          goto LABEL_143;
        }

        int v123 = *__error();
        uint64_t v100 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          goto LABEL_180;
        }
        *(_DWORD *)uint32_t v139 = 136315138;
        unint64_t v140 = strerror(v123);
        v102 = "Failed to write digest to fixed metadata: %s";
      }

      else
      {
        int v109 = *__error();
        uint64_t v100 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          goto LABEL_180;
        }
        *(_DWORD *)uint32_t v139 = 136315138;
        unint64_t v140 = strerror(v109);
        v102 = "Failed to seek to start of last partial chunk before CD: %s";
      }

LABEL_141:
      v103 = v139;
    }

    else
    {
      int v99 = *__error();
      uint64_t v100 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
        goto LABEL_180;
      }
      v101 = strerror(v99);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v101;
      v102 = "Failed to write out first CD record signature: %s";
      v103 = buf;
    }

    v110 = v100;
    uint32_t v111 = 12;
    goto LABEL_143;
  }

  if ((*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 48))(v7, &kCDRecordSignature, 4LL) == 4)
  {
    int v8 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_DEBUG,  "Wrote central directory header to trigger stream end",  buf,  2u);
    }

    return 1LL;
  }

  else
  {
    int v63 = *__error();
    v64 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = strerror(v63);
      _os_log_error_impl( &dword_1870CA000,  v64,  OS_LOG_TYPE_ERROR,  "Failed to write central directory record signature: %s",  buf,  0xCu);
    }

    return 0LL;
  }

          SZGetLoggingHandle();
          uint64_t v120 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
          {
            [*v12 streamInfoDict];
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            v551.st_dev = v456;
            *(void *)&v551.st_mode = v262;
            _os_log_debug_impl( &dword_1870CA000,  v120,  OS_LOG_TYPE_DEBUG,  "Got stream metadata: %@",  (uint8_t *)&v551,  0xCu);
          }

          [*v12 streamInfoDict];
          int v121 = (void *)objc_claimAutoreleasedReturnValue();
          [v121 objectForKey:@"Version"];
          unint64_t v88 = (id)objc_claimAutoreleasedReturnValue();

          if (!v88
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || [v88 intValue] != 2)
          {
            SZGetLoggingHandle();
            unint64_t v211 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl( &dword_1870CA000,  v211,  OS_LOG_TYPE_DEFAULT,  "Stream metadata was incompatible version or not present; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v13);
            uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_326;
          }

          [*v12 setUnsureData:0];
          [*v12 streamInfoDict];
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          [v122 objectForKey:@"RecordCount"];
          int v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (v123)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              objc_msgSend( *v12,  "setTotalRecordCount:",  -[os_log_s unsignedLongLongValue](v123, "unsignedLongLongValue"));
            }
          }

          [*v12 streamInfoDict];
          int v124 = (void *)objc_claimAutoreleasedReturnValue();
          [v124 objectForKey:@"TotalUncompressedBytes"];
          int v125 = (void *)objc_claimAutoreleasedReturnValue();

          if (v125)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              objc_msgSend(*v12, "setTotalUncompressedBytes:", objc_msgSend(v125, "unsignedLongLongValue"));
            }
          }

          goto LABEL_298;
        }

        [v464 stringByAppendingPathComponent:v65];
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603F80] inputStreamWithFileAtPath:v69];
        uint64_t v107 = (id)objc_claimAutoreleasedReturnValue();
        if (v107)
        {
          v503 = 0LL;
          [MEMORY[0x1896079E8] propertyListWithStream:v107 options:0 format:0 error:&v503];
          int v118 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v91 = v503;
          [*v12 setStreamInfoDict:v118];

          [*v12 streamInfoDict];
          int v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (v119)
          {

            goto LABEL_141;
          }

          SZGetLoggingHandle();
          v247 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v551.st_dev) = 0;
            _os_log_impl( &dword_1870CA000,  v247,  OS_LOG_TYPE_DEFAULT,  "Failed to decode stream metadata; entering passthrough mode",
              (uint8_t *)&v551,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v13);
          uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          SZGetLoggingHandle();
          v242 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
          {
            v551.st_dev = v456;
            *(void *)&v551.st_mode = v69;
            _os_log_impl( &dword_1870CA000,  v242,  OS_LOG_TYPE_DEFAULT,  "Failed to read stream metadata from %@; entering passthrough mode",
              (uint8_t *)&v551,
              0xCu);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v13);
          uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v91 = v467;
        }

        goto LABEL_336;
      case 4:
        goto LABEL_58;
      case 5:
        [*v12 fileWriter];
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v300) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1612,  "_currentState.fileWriter");
        }

        objc_msgSend(*v12, "setCurrentOffset:", objc_msgSend(*v12, "currentOffset") + v13);
        v301 = *v12;
        v302 = [*v12 currentOffset];
        [v301 updateHashFromOffset:v302 - v13 withBytes:v510 length:v13];
        CFNumberRef v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          goto LABEL_463;
        }
        [*v12 fileWriter];
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        v469 = 0LL;
        int v16 = [v303 writeBuffer:v510 length:v509 error:&v469];
        size_t v10 = v469;

        if (!(_DWORD)v16) {
          goto LABEL_511;
        }
        __int128 v26 = *v12;
        goto LABEL_400;
      case 6:
        if ([*v12 hashedChunkSize])
        {
          v304 = [*v12 hashedChunkSize];
          v305 = [*v12 bytesHashedInChunk];
          if (v304 - v305 < v13) {
            int v13 = v304 - v305;
          }
        }

        v306 = *v12;
        v307 = [*v12 currentOffset];
        [v306 updateHashFromOffset:v307 withBytes:v510 length:v13 onlyFinishCurrentChunk:1];
        CFNumberRef v17 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v12, "setCurrentOffset:", objc_msgSend(*v12, "currentOffset") + v13);
        if (v17) {
          goto LABEL_463;
        }
        if (![*v12 bytesHashedInChunk]) {
          goto LABEL_509;
        }
        if (v13 != v509) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1645,  "lengthToRead == length");
        }
        goto LABEL_407;
      case 7:
        goto LABEL_511;
      case 8:
        goto LABEL_510;
      default:
        SZGetLoggingHandle();
        v440 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
        {
          v441 = [*v468 streamState];
          v551.st_dev = 67109120;
          *(_DWORD *)&v551.st_mode = v441;
          _os_log_error_impl( &dword_1870CA000,  v440,  OS_LOG_TYPE_ERROR,  "Invalid unzip state encountered: %hhu",  (uint8_t *)&v551,  8u);
        }

        __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1658, "false");
    }
  }

uint64_t ZipStreamConfigureOutput(void *a1, char a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v2 = *(unsigned __int8 *)a1;
  if (v2 != 1)
  {
    BOOL v5 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v2;
      uint64_t v6 = "Only version 1 of callbacks struct is supported; you specified %hhu";
      uint64_t v7 = v5;
      uint32_t v8 = 8;
LABEL_15:
      _os_log_error_impl(&dword_1870CA000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)v11, v8);
    }

    return 0LL;
  }

  uint64_t v3 = a1[5];
  if (!v3)
  {
    if (a1[6] && (a1[7] && a1[8] && a1[12] || a2) && a1[9]) {
      return 1LL;
    }
    uint64_t v9 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      uint64_t v6 = "Must specify either outFILE or appropriate output contexts in configuration struct. HINT: you must specify wr"
           "ite and tell callbacks for non-seakable output; you must specify all for seekable output.";
      uint64_t v7 = v9;
      uint32_t v8 = 2;
      goto LABEL_15;
    }

    return 0LL;
  }

  a1[6] = ZipStreamFILEWriteCallback;
  a1[7] = ZipStreamFILEReadCallback;
  a1[8] = ZipStreamFILESeekCallback;
  a1[9] = ZipStreamFILETellCallback;
  a1[10] = v3;
  a1[11] = ZipStreamFILEFlushCallback;
  uint64_t v4 = 1LL;
  a1[12] = ZipStreamFILETruncateCallback;
  return v4;
}

size_t ZipStreamFILEWriteCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3 = a3;
  if (fwrite(__ptr, 1uLL, a3, __stream) != a3) {
    return -1LL;
  }
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "fwrite returned result > INTPTR_MAX and so is not representable as a ssize_t",  (uint8_t *)v6,  2u);
    }

    return -1LL;
  }

  return v3;
}

size_t ZipStreamFILEReadCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3 = a3;
  if (fread(__ptr, 1uLL, a3, __stream) != a3) {
    return -1LL;
  }
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "fread returned result > INTPTR_MAX and so is not representable as a ssize_t",  (uint8_t *)v6,  2u);
    }

    return -1LL;
  }

  return v3;
}

off_t ZipStreamFILESeekCallback(FILE *__stream, off_t a2, int a3)
{
  if ((a2 || a3 != 1) && fseeko(__stream, a2, a3) == -1) {
    return -1LL;
  }
  else {
    return ftello(__stream);
  }
}

uint64_t ZipStreamFILETruncateCallback(FILE *a1, off_t a2)
{
  int v3 = fileno(a1);
  return ftruncate(v3, a2);
}

void ZipStreamCallPreflightResultCallback(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  keys[3] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v11 = a3;
  uint64_t valuePtr = a2;
  __int16 v10 = a4;
  if (*(void *)(a1 + 8))
  {
    BOOL v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
    CFNumberRef v7 = CFNumberCreate(v5, kCFNumberSInt64Type, &v11);
    CFNumberRef v8 = CFNumberCreate(v5, kCFNumberSInt16Type, &v10);
    keys[0] = @"PreflightResultTotalFileCount";
    keys[1] = @"PreflightResultTotalFileSize";
    keys[2] = @"PreflightTargetPathMode";
    values[0] = v6;
    values[1] = v7;
    values[2] = v8;
    CFDictionaryRef v9 = CFDictionaryCreate( v5,  (const void **)keys,  (const void **)values,  3LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    (*(void (**)(CFDictionaryRef, void))(a1 + 8))(v9, *(void *)(a1 + 16));
    CFRelease(v6);
    CFRelease(v7);
    CFRelease(v8);
    CFRelease(v9);
  }

_WORD *CreateMutableLocalFileRecord(uint64_t a1)
{
  int v2 = calloc(1uLL, 0x50uLL);
  *int v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF(a1);
  if (!InfoZipExtraFieldFromLF)
  {
    time_t v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 10));
    *((void *)v2 + 1) = v4;
    *((void *)v2 + 2) = v4;
    goto LABEL_5;
  }

  *((void *)v2 + 1) = *((unsigned int *)InfoZipExtraFieldFromLF + 1);
  *((void *)v2 + 2) = *((unsigned int *)InfoZipExtraFieldFromLF + 2);
  if (InfoZipExtraFieldFromLF[1] < 0xCu)
  {
LABEL_5:
    *((_DWORD *)v2 + 6) = -1;
    goto LABEL_6;
  }

  v2[12] = InfoZipExtraFieldFromLF[6];
  v2[13] = InfoZipExtraFieldFromLF[7];
LABEL_6:
  *((_BYTE *)v2 + 30) = *(_BYTE *)(*(unsigned __int16 *)(a1 + 26) + a1 + 29) == 47;
  *((_DWORD *)v2 + 8) = *(_DWORD *)(a1 + 14);
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v5 = *(unsigned int *)(a1 + 18);
  if ((_DWORD)v5 != -1)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
    if ((_DWORD)v6 != -1) {
      goto LABEL_11;
    }
  }

  if (!GetZip64ExtraFieldDataFromLF(a1, &v11, &v12))
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
LABEL_11:
    uint64_t v6 = v6;
    uint64_t v11 = v6;
    uint64_t v12 = v5;
    goto LABEL_12;
  }

  uint64_t v6 = v11;
  uint64_t v5 = v12;
LABEL_12:
  *((void *)v2 + 5) = v5;
  *((void *)v2 + 6) = v6;
  v2[32] = *(_WORD *)(a1 + 28);
  size_t v7 = *(unsigned __int16 *)(a1 + 26);
  CFNumberRef v8 = calloc(v7 + 1, 1uLL);
  memcpy(v8, (const void *)(a1 + 30), v7);
  *((void *)v2 + 7) = v8;
  CFDictionaryRef v9 = malloc(*(unsigned __int16 *)(a1 + 28));
  *((void *)v2 + 9) = v9;
  memcpy(v9, (const void *)(a1 + 30 + *(unsigned __int16 *)(a1 + 26)), *(unsigned __int16 *)(a1 + 28));
  return v2;
}

void DestroyMutableLocalFileRecord(void **a1)
{
  if (a1)
  {
    free(a1[7]);
    free(a1[9]);
    free(a1);
  }

uint64_t _GetExtraFieldOfLength(unsigned __int16 *a1, unsigned __int16 *a2, unsigned int a3, void *a4)
{
  unsigned int v8 = *a1;
  ExtraFieldWithSignature = GetExtraFieldWithSignature(*((void *)a1 + 1), *a1, a2);
  if (ExtraFieldWithSignature)
  {
    unsigned __int16 v10 = ExtraFieldWithSignature[1];
    unsigned __int16 v11 = v10 + 4;
    if (v8 > (unsigned __int16)(v10 + 4))
    {
      memmove( ExtraFieldWithSignature,  (char *)ExtraFieldWithSignature + (unsigned __int16)(v10 + 4),  (unsigned __int16)(v10 + 4));
      unsigned int v8 = *a1;
    }

    if (v8 < v11) {
      __assert_rtn("_RemoveExtraField", "MutableZipStructure.c", 81, "fieldLength <= extraInfo->length");
    }
    LOWORD(v8) = v8 - v11;
    *a1 = v8;
  }

  if (a3)
  {
    size_t v12 = a3 + (unint64_t)(unsigned __int16)v8 + 4;
    if (v12 >> 16)
    {
      ExtraFieldWithSignature = 0LL;
LABEL_14:
      uint64_t v13 = 0LL;
      goto LABEL_15;
    }

    ExtraFieldWithSignature = reallocf(*((void **)a1 + 1), v12);
    *((void *)a1 + 1) = ExtraFieldWithSignature;
    if (!ExtraFieldWithSignature) {
      goto LABEL_14;
    }
    ExtraFieldWithSignature = (_WORD *)((char *)ExtraFieldWithSignature + *a1);
    *a1 = v12;
    _WORD *ExtraFieldWithSignature = *a2;
    ExtraFieldWithSignature[1] = a3;
  }

  else
  {
    ExtraFieldWithSignature = 0LL;
  }

LABEL_13:
  uint64_t v13 = 1LL;
LABEL_15:
  *a4 = ExtraFieldWithSignature;
  return v13;
}
}

char *CreateAndWriteLocalFileRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = 0LL;
  if (*(void *)(a1 + 40) <= 0xFFFFFFFEuLL && *(void *)(a1 + 48) < 0xFFFFFFFFuLL)
  {
    unsigned int v5 = 0;
    int v4 = 1;
  }

  else
  {
    int v4 = 0;
    unsigned int v5 = 16;
  }

  uint64_t v6 = (unsigned __int16 *)(a1 + 64);
  if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kZip64ExtraFieldSignature, v5, &v29))
  {
    uint64_t v7 = v29;
    if (v29)
    {
      *(void *)(v29 + 4) = *(void *)(a1 + 48);
      *(void *)(v7 + 12) = *(void *)(a1 + 40);
    }

    uint64_t v29 = 0LL;
    unsigned int v8 = 0LL;
    if (_GetExtraFieldOfLength( (unsigned __int16 *)(a1 + 64),  &kStreamingZipLFExtraFieldSignature,  2 * (*(_WORD *)(a1 + 28) != 0),  &v29))
    {
      if (v29) {
        *(_WORD *)(v29 + 4) = *(_WORD *)(a1 + 28);
      }
      unsigned int v9 = 8 * (*(void *)(a1 + 16) != *(void *)(a1 + 8));
      uint64_t v29 = 0LL;
      unsigned int v8 = 0LL;
      if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kInfoZipExtraFieldSignature, v9, &v29))
      {
        uint64_t v10 = v29;
        if (v29)
        {
          unint64_t v11 = *(void *)(a1 + 8);
          if (v11 > 0xFFFFFFFE) {
            LODWORD(v11) = -1;
          }
          *(_DWORD *)(v29 + 4) = v11;
          unint64_t v12 = *(void *)(a1 + 16);
          if (v12 > 0xFFFFFFFE) {
            LODWORD(v12) = -1;
          }
          *(_DWORD *)(v10 + 8) = v12;
          if (v9 == 12)
          {
            *(_WORD *)(v10 + 12) = *(_WORD *)(a1 + 24);
            *(_WORD *)(v10 + 14) = *(_WORD *)(a1 + 26);
          }
        }

        size_t v13 = strlen(*(const char **)(a1 + 56));
        if (v13 >= 0x10000) {
          __assert_rtn( "CreateLocalFileRecordFromMutable",  "MutableZipStructure.c",  188,  "file_name_length <= UINT16_MAX");
        }
        size_t v14 = v13;
        uint64_t v15 = (char *)malloc(v13 + *v6 + 30);
        unsigned int v8 = v15;
        *(_DWORD *)uint64_t v15 = 67324752;
        if (v4) {
          __int16 v16 = *(_WORD *)a1;
        }
        else {
          __int16 v16 = 45;
        }
        *((_WORD *)v15 + 2) = v16;
        *(_DWORD *)(v15 + 6) = *(_DWORD *)(a1 + 2);
        *(_DWORD *)(v15 + 10) = UNIX2DOSTime(*(void *)(a1 + 16));
        char v23 = v4 ^ 1;
        if ((*(_WORD *)(a1 + 2) & 8) == 0) {
          char v23 = 1;
        }
        if ((v23 & 1) != 0 || !*(_WORD *)(a1 + 4))
        {
          *(_DWORD *)(v8 + 14) = *(_DWORD *)(a1 + 32);
          int v24 = -1;
          unint64_t v25 = *(void *)(a1 + 40);
          unint64_t v26 = *(void *)(a1 + 48);
          if (v25 >= 0xFFFFFFFF) {
            LODWORD(v25) = -1;
          }
          *(_DWORD *)(v8 + 18) = v25;
          if (v26 < 0xFFFFFFFF) {
            int v24 = v26;
          }
        }

        else
        {
          int v24 = 0;
          *(void *)(v8 + 14) = 0LL;
        }

        *(_DWORD *)(v8 + 22) = v24;
        *((_WORD *)v8 + 13) = v14;
        uint64_t v27 = *(const void **)(a1 + 56);
        memcpy(v8 + 30, v27, v14);
        if (!strcmp((const char *)v27, "mimetype"))
        {
          *((_WORD *)v8 + 14) = 0;
        }

        else
        {
          size_t v28 = *(unsigned __int16 *)(a1 + 64);
          *((_WORD *)v8 + 14) = v28;
          memcpy(&v8[v14 + 30], *(const void **)(a1 + 72), v28);
        }
      }
    }
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  unint64_t v17 = *((unsigned __int16 *)v8 + 13) + (unint64_t)*((unsigned __int16 *)v8 + 14) + 30;
  uint64_t v18 = (*(uint64_t (**)(void, char *, unint64_t))(a2 + 48))(*(void *)(a2 + 80), v8, v17);
  BOOL v19 = v18 == v17;
  if (v18 == v17) {
    CFNumberRef v20 = 0LL;
  }
  else {
    CFNumberRef v20 = v8;
  }
  if (v19) {
    unsigned int v21 = v8;
  }
  else {
    unsigned int v21 = 0LL;
  }
  free(v20);
  return v21;
}

_WORD *CreateMutableCDRecord(uint64_t a1)
{
  int v2 = calloc(1uLL, 0x68uLL);
  *int v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  v2[3] = *(_WORD *)(a1 + 10);
  if (*(_WORD *)(a1 + 30)
    && (ExtraFieldWithSignature = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 28) + 46,  *(unsigned __int16 *)(a1 + 30),  &kInfoZipExtraFieldSignature)) != 0LL && ExtraFieldWithSignature[1] >= 8u)
  {
    *((void *)v2 + 2) = *((unsigned int *)ExtraFieldWithSignature + 2);
    time_t v4 = *((unsigned int *)ExtraFieldWithSignature + 1);
  }

  else
  {
    time_t v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 12));
    *((void *)v2 + 2) = v4;
  }

  *((void *)v2 + 1) = v4;
  if (*(_BYTE *)(a1 + 5) != 3 && *(_BYTE *)(a1 + 5)
    || (int v5 = HIWORD(*(_DWORD *)(a1 + 38)), v6 = v5 & 0xF000, v6 != 0x4000) && v6 != 40960 && v6 != 0x8000
    || !v5)
  {
    else {
      LOWORD(v5) = -32332;
    }
  }

  v2[12] = v5 & 0xF1FF;
  *((_BYTE *)v2 + 26) = *(_BYTE *)(*(unsigned __int16 *)(a1 + 28) + a1 + 45) == 47;
  *((_DWORD *)v2 + 7) = *(_DWORD *)(a1 + 16);
  uint64_t v7 = *(unsigned int *)(a1 + 20);
  if ((_DWORD)v7 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (v8 = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 28) + 46,  *(unsigned __int16 *)(a1 + 30),  &kZip64ExtraFieldSignature)) != 0LL && ((v9 = *(_DWORD *)(a1 + 24), v9 != -1) ? (unsigned int v10 = 8) : (unsigned int v10 = 16), v10 <= v8[1]))
    {
      uint64_t v7 = *(void *)&v8[4 * (v9 == -1) + 2];
    }

    else
    {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
  }

  *((void *)v2 + 4) = v7;
  uint64_t v11 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v11 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (unint64_t v12 = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 28) + 46,  *(unsigned __int16 *)(a1 + 30),  &kZip64ExtraFieldSignature)) != 0LL && v12[1] >= 8u)
    {
      uint64_t v11 = *(void *)(v12 + 2);
    }

    else
    {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
  }

  *((void *)v2 + 5) = v11;
  v2[44] = *(_WORD *)(a1 + 30);
  v2[24] = *(_WORD *)(a1 + 32);
  *((_DWORD *)v2 + 13) = *(unsigned __int16 *)(a1 + 34);
  v2[28] = *(_WORD *)(a1 + 36);
  uint64_t v13 = *(unsigned int *)(a1 + 42);
  if ((_DWORD)v13 == -1)
  {
    if (!*(_WORD *)(a1 + 30)) {
      goto LABEL_39;
    }
    size_t v14 = GetExtraFieldWithSignature( a1 + *(unsigned __int16 *)(a1 + 28) + 46,  *(unsigned __int16 *)(a1 + 30),  &kZip64ExtraFieldSignature);
    if (!v14) {
      goto LABEL_39;
    }
    int v16 = *(_DWORD *)(a1 + 20);
    int v15 = *(_DWORD *)(a1 + 24);
    if (v15 == -1) {
      unsigned int v17 = 16;
    }
    else {
      unsigned int v17 = 8;
    }
    if (v16 == -1) {
      v17 += 8;
    }
    if (v14[1] >= v17)
    {
      LODWORD(v18) = 8 * (v15 == -1);
      if (v16 == -1) {
        uint64_t v18 = (v18 + 8);
      }
      else {
        uint64_t v18 = v18;
      }
      uint64_t v13 = *(void *)((char *)v14 + v18 + 4);
    }

    else
    {
LABEL_39:
      uint64_t v13 = 0xFFFFFFFFLL;
    }
  }

  *((void *)v2 + 8) = v13;
  BOOL v19 = calloc(*(unsigned __int16 *)(a1 + 28) + 1LL, 1uLL);
  memcpy(v19, (const void *)(a1 + 46), *(unsigned __int16 *)(a1 + 28));
  *((void *)v2 + 9) = v19;
  CFNumberRef v20 = malloc(*(unsigned __int16 *)(a1 + 30));
  *((void *)v2 + 12) = v20;
  memcpy(v20, (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 28)), *(unsigned __int16 *)(a1 + 30));
  unsigned int v21 = malloc(*(unsigned __int16 *)(a1 + 32));
  *((void *)v2 + 10) = v21;
  memcpy( v21,  (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 32) + *(unsigned __int16 *)(a1 + 30)),  *(unsigned __int16 *)(a1 + 32));
  return v2;
}

void DestroyMutableCDRecord(void **a1)
{
  if (a1)
  {
    free(a1[9]);
    free(a1[12]);
    free(a1[10]);
    free(a1);
  }

uint64_t _ReadOriginalCentralDirectory( uint64_t a1, void ****a2, size_t *a3, void *a4, size_t *a5, size_t *a6, _WORD *a7, _WORD *a8)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  size_t v11 = *(void *)(a1 + 16);
  uint64_t v62 = (void ***)calloc(v11, 8uLL);
  unint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  theDict = CFDictionaryCreateMutable(v12, 0LL, 0LL, 0LL);
  size_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v61 = a5;
  *a5 = -1LL;
  unint64_t v55 = a6;
  *a6 = -1LL;
  do
  {
    while (1)
    {
      if (v14 >= v11)
      {
        size_t v37 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 134217984;
          *(void *)((char *)&context + 4) = v11;
          _os_log_error_impl( &dword_1870CA000,  v37,  OS_LOG_TYPE_ERROR,  "Too many CD records found in file; expected %llu",
            (uint8_t *)&context,
            0xCu);
        }

        __int16 v38 = v62;
        if (v11) {
          goto LABEL_54;
        }
        goto LABEL_58;
      }

      off_t v16 = *(void *)(a1 + 48);
      if (v16 == -1)
      {
        off_t v16 = *(void *)(a1 + 32);
        *(void *)(a1 + 48) = v16;
        *(void *)(a1 + 24) = 0LL;
      }

      if (fseeko(*(FILE **)a1, v16, 0))
      {
        __int16 v39 = Mutable;
        int8x16_t v40 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(context) = 0;
          _os_log_error_impl( &dword_1870CA000,  v40,  OS_LOG_TYPE_ERROR,  "Failed to seek to central directory record",  (uint8_t *)&context,  2u);
        }

        uint64_t v18 = 0LL;
LABEL_49:
        int v51 = 4;
LABEL_50:
        __int16 v38 = v62;
LABEL_51:
        *(void *)(a1 + 48) = -1LL;
        *(void *)(a1 + 24) = 0LL;
        free(v18);
        uint64_t v52 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 67109120;
          DWORD1(context) = v51;
          _os_log_error_impl( &dword_1870CA000,  v52,  OS_LOG_TYPE_ERROR,  "CopyNextCDRecord returned error %d",  (uint8_t *)&context,  8u);
        }

        Mutable = v39;
LABEL_54:
        uint64_t v53 = v38;
        do
        {
          if (*v53) {
            DestroyMutableCDRecord(*v53);
          }
          ++v53;
          --v11;
        }

        while (v11);
LABEL_58:
        free(v38);
        uint64_t v36 = 0LL;
        goto LABEL_59;
      }

      unsigned int v17 = malloc(0x2EuLL);
      if (!v17)
      {
        __int16 v39 = Mutable;
        uint64x2_t v41 = (os_log_s *)SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
LABEL_44:
          uint64_t v18 = 0LL;
          int v51 = 3;
          goto LABEL_50;
        }

        LOWORD(context) = 0;
        int8x16_t v42 = "Failed to allocate record";
LABEL_61:
        _os_log_error_impl(&dword_1870CA000, v41, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&context, 2u);
        goto LABEL_44;
      }

      uint64_t v18 = v17;
      if (fread(v17, 1uLL, 0x2EuLL, *(FILE **)a1) != 46)
      {
        size_t v43 = (os_log_s *)SZGetLoggingHandle();
        __int16 v38 = v62;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          __int16 v39 = Mutable;
          LOWORD(context) = 0;
          size_t v44 = "Failed to read central directory record";
LABEL_63:
          uint64_t v49 = v43;
          uint32_t v50 = 2;
          goto LABEL_64;
        }

uint64_t _SortZipEntries(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (!(*a1 | *a2)) {
    return 0LL;
  }
  if (v2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    return 1LL;
  }
  int v6 = *(const char **)(v2 + 72);
  uint64_t v7 = *(const char **)(v3 + 72);
  uint64_t result = _SortLateIfPrefix(v6, v7, "__MACOSX/", 9uLL);
  if (!(_DWORD)result)
  {
    unsigned int v8 = rindex(v6, 47);
    int v9 = rindex(v7, 47);
    unsigned int v10 = v9;
    if (v8) {
      *unsigned int v8 = 0;
    }
    if (v9) {
      char *v9 = 0;
    }
    if (strcmp(v6, v7)
      || (v8 ? (size_t v11 = v8 + 1) : (size_t v11 = v6),
          v10 ? (unint64_t v12 = v10 + 1) : (unint64_t v12 = v7),
          uint64_t result = _SortLateIfPrefix(v11, v12, "._", 2uLL),
          !(_DWORD)result))
    {
      if (v8) {
        *unsigned int v8 = 47;
      }
      if (v10) {
        *unsigned int v10 = 47;
      }
      return strcmp(v6, v7);
    }
  }

  return result;
}

BOOL _GetCDIndexOfBundleExecutableForInfoPlist( FILE **a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  BOOL v5 = *(const char **)(a4 + 72);
  int v69 = 0;
  CFErrorRef error = 0LL;
  size_t v6 = *(void *)(a4 + 40);
  if (v6 < 0x40000001)
  {
    bytes = (UInt8 *)malloc(*(void *)(a4 + 40));
    off_t v21 = CopyLocalFileHeader(a1, a4, &v69);
    if (!v21)
    {
      size_t v28 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v71 = v5;
        __int16 v72 = 1024;
        LODWORD(v73) = v69;
        _os_log_error_impl( &dword_1870CA000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to get local file record for info plist %s: %d",  buf,  0x12u);
      }

      CFStringRef v8 = 0LL;
      int v9 = 0LL;
      unsigned int v10 = 0LL;
      size_t v11 = 0LL;
      unint64_t v12 = 0LL;
      goto LABEL_42;
    }

    unint64_t v12 = (void **)v21;
    off_t v22 = (uint64_t *)OpenLocalFile((uint64_t)a1, a4, *((char **)v21 + 7), v21[32], 0, &v69);
    uint64_t v13 = (compression_stream *)v22;
    if (v22) {
      BOOL v23 = v69 == 0;
    }
    else {
      BOOL v23 = 0;
    }
    if (!v23)
    {
      char v24 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        unint64_t v25 = "Failed to open plist file in zip archive";
        unint64_t v26 = v24;
        uint32_t v27 = 2;
LABEL_59:
        _os_log_error_impl(&dword_1870CA000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_20;
      }

      goto LABEL_20;
    }

    size_t v67 = 0LL;
    int v29 = ReadLocalFileData(v22, bytes, v6, &v67);
    if (v29 != 2)
    {
      int v36 = v29;
      size_t v37 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v71 = v5;
        __int16 v72 = 1024;
        LODWORD(v73) = v36;
        unint64_t v25 = "Failed to read file data for info plist %s: %d";
        unint64_t v26 = v37;
        uint32_t v27 = 18;
        goto LABEL_59;
      }

LABEL_41:
      CFStringRef v8 = 0LL;
      int v9 = 0LL;
      unsigned int v10 = 0LL;
      size_t v11 = 0LL;
LABEL_42:
      uint64_t v13 = 0LL;
      goto LABEL_43;
    }

    __int16 v39 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    int8x16_t v40 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  v6,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
    if (!v40)
    {
      uint64_t v52 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v33 = "Failed to create data from uncompressed bytes";
        __int16 v34 = v52;
        uint32_t v35 = 2;
        goto LABEL_40;
      }

      goto LABEL_41;
    }

    size_t v11 = v40;
    uint64x2_t v41 = (const __CFDictionary *)CFPropertyListCreateWithData(v39, v40, 0LL, 0LL, &error);
    if (!v41)
    {
      uint64_t v54 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v71 = v5;
        _os_log_error_impl(&dword_1870CA000, v54, OS_LOG_TYPE_ERROR, "Failed to deserialize Info plist %s", buf, 0xCu);
      }

      CFStringRef v8 = 0LL;
      int v9 = 0LL;
      unsigned int v10 = 0LL;
      goto LABEL_42;
    }

    unsigned int v10 = v41;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v10))
    {
      size_t v43 = strrchr(v5, 47);
      if (v43)
      {
        char *v43 = 0;
        size_t v44 = v43;
        CFStringRef v45 = CFStringCreateWithFileSystemRepresentation(v39, v5);
        char *v44 = 47;
        if (v45)
        {
          CFStringRef v8 = v45;
          Value = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x189604DF8]);
          if (Value)
          {
            int v47 = Value;
            CFTypeID v64 = CFStringGetTypeID();
            if (v64 == CFGetTypeID(v47))
            {
              int v48 = CFStringCreateWithFormat(v39, 0LL, @"%@/%@", v8, v47);
              if (v48)
              {
                int v9 = v48;
                if (CFStringGetFileSystemRepresentation(v48, (char *)buf, 1024LL))
                {
                  uint64_t v49 = 0LL;
                  BOOL v15 = 1;
                  while (1)
                  {
                    uint64_t v50 = *(void *)(a2 + 8 * v49);
                    if (v50)
                    {
                    }

                    BOOL v15 = ++v49 < a3;
                    if (a3 == v49) {
                      goto LABEL_42;
                    }
                  }

                  uint64_t v63 = v49;
                  uint64_t v13 = 0LL;
                  *a5 = v63;
                  goto LABEL_44;
                }

                uint64_t v62 = (os_log_s *)SZGetLoggingHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)__int16 v66 = 0;
                  _os_log_error_impl( &dword_1870CA000,  v62,  OS_LOG_TYPE_ERROR,  "Failed to convert CF executable path string to C string",  v66,  2u);
                }

                goto LABEL_42;
              }

              uint64_t v61 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                goto LABEL_71;
              }
              *(_WORD *)buf = 0;
              uint64_t v58 = "Failed to construct path to bundle executable";
              unint64_t v59 = v61;
              uint32_t v60 = 2;
              goto LABEL_77;
            }

            uint64_t v57 = (os_log_s *)SZGetLoggingHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              int v71 = v5;
              uint64_t v58 = "CFBundleExecutable was not a CFString for plist %s";
              goto LABEL_76;
            }
          }

          else
          {
            uint64_t v57 = (os_log_s *)SZGetLoggingHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              int v71 = v5;
              uint64_t v58 = "Plist %s did not contain a value for kCFBundleExecutableKey";
LABEL_76:
              unint64_t v59 = v57;
              uint32_t v60 = 12;
LABEL_77:
              _os_log_error_impl(&dword_1870CA000, v59, OS_LOG_TYPE_ERROR, v58, buf, v60);
            }
          }

LABEL_71:
          int v9 = 0LL;
          goto LABEL_42;
        }

        unint64_t v55 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          int v71 = v5;
          int v56 = "Failed to create CF string from plist path %s";
          goto LABEL_69;
        }

LABEL_70:
        CFStringRef v8 = 0LL;
        goto LABEL_71;
      }

      unint64_t v55 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_DWORD *)buf = 136315138;
      int v71 = v5;
      int v56 = "Failed to find last slash in plist path %s";
    }

    else
    {
      unint64_t v55 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_DWORD *)buf = 136315138;
      int v71 = v5;
      int v56 = "Plist %s did not contain a dictionary";
    }

LABEL_69:
    _os_log_error_impl(&dword_1870CA000, v55, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);
    goto LABEL_70;
  }

  uint64_t v7 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v71 = v5;
    _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Found plist at %s greater than 1 GB in size; something must be wrong.",
      buf,
      0xCu);
  }

  CFStringRef v8 = 0LL;
  int v9 = 0LL;
  unsigned int v10 = 0LL;
  size_t v11 = 0LL;
  unint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  size_t v14 = 0LL;
  BOOL v15 = 0;
LABEL_45:
  free(v14);
  DestroyMutableLocalFileRecord(v12);
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0LL;
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v13) {
    CloseLocalFile(v13);
  }
  return v15;
}

uint64_t _SortLateIfPrefix(const char *a1, const char *a2, char *__s2, size_t __n)
{
  BOOL v7 = strncmp(a1, __s2, __n) == 0;
  int v8 = strncmp(a2, __s2, __n);
  if (v8) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  unsigned int v10 = v9 - 1;
  if (v7 && v8 != 0) {
    return 1LL;
  }
  else {
    return v10;
  }
}

void _AddIndexToDictionary(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a2 != -1)
  {
    if (a2 < 0)
    {
      BOOL v7 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v8 = 134217984;
        *(void *)&v8[4] = a2;
        _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "can't represent index %llu as an SInt64\n",  v8,  0xCu);
      }
    }

    else
    {
      *(void *)int v8 = a2;
      CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v8);
      CFDictionarySetValue(a3, a1, v6);
      CFRelease(v6);
    }
  }

uint64_t _Prescan(char *a1, const __CFArray *a2, _WORD *a3, _WORD *a4, void *a5, void *a6)
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  v109[0] = a1;
  v109[1] = 0LL;
  size_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  uint64_t v13 = CFDictionaryCreateMutable(v11, 0LL, 0LL, 0LL);
  size_t v105 = strlen(a1);
  size_t v14 = fts_open(v109, 84, 0LL);
  if (v14)
  {
    v101 = a4;
    uint64_t v102 = 0LL;
    uint64_t v103 = 0LL;
    key = (void *)*MEMORY[0x189604DF8];
    bytesDeallocator = (const __CFAllocator *)*MEMORY[0x189604DC8];
    while (1)
    {
      do
      {
        while (1)
        {
          BOOL v15 = fts_read(v14);
          if (!v15)
          {
            if (*__error())
            {
              __int16 v74 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              size_t v75 = __error();
              uint64_t v76 = strerror(*v75);
              *(_DWORD *)__str = 136315138;
              *(void *)&__str[4] = v76;
              size_t v73 = "fts_read returned NULL and set errno: %s";
              size_t v77 = v74;
              uint32_t v78 = 12;
              goto LABEL_97;
            }

            *(void *)__str = 0LL;
            *(void *)&__str[8] = 0LL;
            CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            int v81 = a6;
            __int16 v82 = *(_WORD *)&__str[8];
            *(void *)__str = 0LL;
            *(void *)&__str[8] = 0LL;
            CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            __int16 v83 = *(_WORD *)&__str[8];
            *a3 = v82;
            _WORD *v101 = v83;
            *a5 = v103;
            *int v81 = v102;
            unint64_t v84 = (os_log_s *)SZGetLoggingHandle();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__str = 134217984;
              *(void *)&__str[4] = v103;
              _os_log_debug_impl( &dword_1870CA000,  v84,  OS_LOG_TYPE_DEBUG,  "Prescan says record count should be %llu",  (uint8_t *)__str,  0xCu);
            }

            uint64_t v85 = 1LL;
            if (Mutable) {
              goto LABEL_104;
            }
            goto LABEL_105;
          }

          off_t v16 = v15;
          unsigned int fts_info = v15->fts_info;
          if (fts_info > 0xD) {
            goto LABEL_102;
          }
          if (((1 << fts_info) & 0x3102) != 0) {
            break;
          }
          if (fts_info != 6)
          {
            if (((1 << fts_info) & 0x490) != 0)
            {
              unint64_t v70 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              fts_path = v16->fts_path;
              int v80 = strerror(v16->fts_errno);
              *(_DWORD *)__str = 136315394;
              *(void *)&__str[4] = fts_path;
              *(_WORD *)&__str[12] = 2080;
              *(void *)&__str[14] = v80;
              size_t v73 = "fts_read gave error for file %s: %s";
              goto LABEL_96;
            }

LABEL_102:
            size_t v86 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
              goto LABEL_103;
            }
            int v88 = v16->fts_info;
            *(_DWORD *)__str = 67109120;
            *(_DWORD *)&__str[4] = v88;
            size_t v73 = "fts_read returned unhandled fts_info value %d";
            size_t v77 = v86;
            uint32_t v78 = 8;
            goto LABEL_97;
          }
        }
      }

      while (!v15->fts_level);
      buffer = _CopyArchivePath((uint64_t)v15->fts_path, v105, v15->fts_statp->st_mode);
      if ((_IsExcludedFileName(buffer) & 1) != 0)
      {
        uint64_t v18 = buffer;
        goto LABEL_45;
      }

      unint64_t v96 = Mutable;
      int v97 = a6;
      int v19 = v16->fts_info;
      if (v19 == 1) {
        Mutable = v13;
      }
      st_mode = (const void *)v16->fts_statp->st_mode;
      Value = (char *)CFDictionaryGetValue(Mutable, st_mode);
      CFDictionarySetValue(Mutable, st_mode, Value + 1);
      unint64_t v95 = v13;
      if (v19 != 1) {
        v102 += v16->fts_statp->st_size;
      }
      uint64_t v18 = buffer;
      CFStringRef v22 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
      v118.length = CFArrayGetCount(a2);
      v118.location = 0LL;
      Mutable = v96;
      a6 = v97;
      if (!CFArrayContainsValue(a2, v118, v22))
      {
        char v106 = 0;
        if (ZipStreamShouldOrderFileEarly(buffer, &v106))
        {
          CFArrayAppendValue(a2, v22);
          if (v106) {
            break;
          }
        }
      }

LABEL_42:
      if (v22) {
        CFRelease(v22);
      }
      ++v103;
      uint64_t v13 = v95;
LABEL_45:
      free(v18);
    }

    int v93 = v22;
    bzero(__str, 0x400uLL);
    memset(&v108, 0, sizeof(v108));
    CFTypeRef v107 = 0LL;
    snprintf(__str, 0x400uLL, "%s/%s", a1, buffer);
    int v23 = open(__str, 0, 0LL);
    if (v23 < 0)
    {
      int v30 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        unint64_t v55 = __error();
        int v56 = strerror(*v55);
        int buf = 136315394;
        off_t v111 = (off_t)__str;
        __int16 v112 = 2080;
        compression_status v113 = v56;
        _os_log_error_impl( &dword_1870CA000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to open Info.plist at path %s: %s",  (uint8_t *)&buf,  0x16u);
      }

      CFStringRef v31 = 0LL;
      CFStringRef v94 = 0LL;
      uint64_t v18 = buffer;
      goto LABEL_35;
    }

    int v92 = v23;
    if (fstat(v23, &v108))
    {
      char v24 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unint64_t v25 = __error();
        unint64_t v26 = strerror(*v25);
        int buf = 136315394;
        off_t v111 = (off_t)__str;
        __int16 v112 = 2080;
        compression_status v113 = v26;
        uint32_t v27 = v24;
        size_t v28 = "Failed to stat Info.plist at path %s: %s";
        uint32_t v29 = 22;
LABEL_28:
        _os_log_error_impl(&dword_1870CA000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v29);
        goto LABEL_29;
      }

      goto LABEL_29;
    }

    size_t st_size = v108.st_size;
    if (v108.st_size >= 524288000)
    {
      uint64_t v33 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        int buf = 134217984;
        off_t v111 = v108.st_size;
        uint32_t v27 = v33;
        size_t v28 = "Found Info.plist but it was too big (larger than 500 MB): was %lld bytes";
        uint32_t v29 = 12;
        goto LABEL_28;
      }

LABEL_103:
  uint64_t v85 = 0LL;
  if (Mutable) {
LABEL_104:
  }
    CFRelease(Mutable);
LABEL_105:
  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    fts_close(v14);
  }
  return v85;
}

uint64_t _WriteLocalFile( const char *a1, const char *a2, size_t a3, int a4, void *a5, void *a6, __int16 a7, __int16 a8, uint64_t a9, uint64_t a10, unsigned __int16 a11, unsigned __int16 a12, CFMutableArrayRef theArray)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  value = 0LL;
  CFNumberRef v20 = (void **)calloc(1uLL, 0x50uLL);
  off_t v21 = v20;
  uint64_t v58 = v20;
  *(_WORD *)CFNumberRef v20 = 20;
  v20[1] = a5;
  v20[2] = a6;
  int v22 = a4 & 0xF000;
  *((_WORD *)v20 + 12) = a7;
  *((_WORD *)v20 + 13) = a8;
  *((_BYTE *)v20 + 30) = v22 == 0x4000;
  if (v22 == 0x4000)
  {
    if (a4 != a12) {
      *((_WORD *)v20 + 14) = a4;
    }
  }

  else
  {
    if (a4 != a11) {
      *((_WORD *)v20 + 14) = a4;
    }
    if (v22 == 0x8000)
    {
      v20[5] = (void *)a3;
      v20[6] = (void *)a3;
    }

    else
    {
      v20[5] = 0LL;
      v20[6] = 0LL;
    }
  }

  *((_WORD *)v20 + 2) = 0;
  *((_DWORD *)v20 + 8) = 0;
  *((_WORD *)v20 + 1) |= 0x800u;
  int v23 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (!CFStringGetCString(v23, buffer, 1024LL, 0x8000100u))
  {
    unsigned int v32 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v60 = (uint64_t)a2;
      uint64_t v33 = "Failed to get path %s as UTF8 string";
      __int16 v34 = v32;
      uint32_t v35 = 12;
LABEL_51:
      _os_log_error_impl(&dword_1870CA000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  v21[7] = strdup(buffer);
  char v24 = (char *)calloc(1uLL, 0x68uLL);
  if (!v24)
  {
    value = 0LL;
    int v36 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      uint64_t v33 = "Failed to create mutable CD record from LF record";
      __int16 v34 = v36;
      uint32_t v35 = 2;
      goto LABEL_51;
    }

    goto LABEL_21;
  }

  unint64_t v25 = v24;
  *(_WORD *)char v24 = 798;
  *((_WORD *)v24 + 1) = *(_WORD *)v21;
  *((_DWORD *)v24 + 1) = *(_DWORD *)((char *)v21 + 2);
  *(_OWORD *)(v24 + 8) = *(_OWORD *)(v21 + 1);
  *((_WORD *)v24 + 12) = *((_WORD *)v21 + 14);
  v24[26] = *((_BYTE *)v21 + 30);
  *((_DWORD *)v24 + 7) = *((_DWORD *)v21 + 8);
  *((_OWORD *)v24 + 2) = *(_OWORD *)(v21 + 5);
  *((void *)v24 + 9) = strdup((const char *)v21[7]);
  value = v25;
  *((_WORD *)v25 + 12) = a4;
  if (v22 == 40960)
  {
    CFPropertyListRef v39 = a1;
    ssize_t v40 = readlink(a1, buffer, 0x400uLL);
    if (v40 < 0)
    {
      CFStringRef v44 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v45 = __error();
        int v46 = strerror(*v45);
        *(_DWORD *)int buf = 136315394;
        uint64_t v60 = (uint64_t)v39;
        __int16 v61 = 2080;
        size_t v62 = (size_t)v46;
        uint64_t v33 = "Failed to read symlink destination for file %s: %s";
LABEL_47:
        __int16 v34 = v44;
        uint32_t v35 = 22;
        goto LABEL_51;
      }

LABEL_21:
      DestroyMutableLocalFileRecord(v21);
      goto LABEL_22;
    }

    v21[5] = (void *)v40;
    v21[6] = (void *)v40;
    CFStringRef v31 = buffer;
    uint64_t v30 = -1LL;
    int v28 = -1;
    *((void *)v25 + 4) = v40;
    *((void *)v25 + 5) = v40;
  }

  else
  {
    if (v22 == 0x8000)
    {
      if (a3)
      {
        unint64_t v26 = a1;
        int v27 = open(a1, 0, 0LL);
        if ((v27 & 0x80000000) == 0)
        {
          int v28 = v27;
          if (a3 == -1LL)
          {
            off_t v49 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
LABEL_53:
              close(v28);
              goto LABEL_21;
            }

            *(_DWORD *)int buf = 134218242;
            uint64_t v60 = -1LL;
            __int16 v61 = 2080;
            size_t v62 = (size_t)v26;
            uint64_t v50 = "File with size %lld is to big to map: %s";
            int v51 = v49;
            uint32_t v52 = 22;
          }

          else
          {
            uint32_t v29 = (char *)mmap(0LL, a3, 1, 1026, v27, 0LL);
            if (v29 != (char *)-1LL)
            {
              uint64_t v30 = (uint64_t)v29;
              CFStringRef v31 = v29;
              goto LABEL_30;
            }

            uint64_t v53 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            uint32_t v54 = __error();
            unint64_t v55 = strerror(*v54);
            *(_DWORD *)int buf = 136315650;
            uint64_t v60 = (uint64_t)a1;
            __int16 v61 = 2048;
            size_t v62 = a3;
            __int16 v63 = 2080;
            CFTypeID v64 = v55;
            uint64_t v50 = "Failed to map file %s of size %llu: %s";
            int v51 = v53;
            uint32_t v52 = 32;
          }

          _os_log_error_impl(&dword_1870CA000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
          goto LABEL_53;
        }

        CFStringRef v44 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          CFTypeID v47 = __error();
          int v48 = strerror(*v47);
          *(_DWORD *)int buf = 136315394;
          uint64_t v60 = (uint64_t)v26;
          __int16 v61 = 2080;
          size_t v62 = (size_t)v48;
          uint64_t v33 = "Failed to open file: %s : %s";
          goto LABEL_47;
        }

        goto LABEL_21;
      }

      buffer[0] = 0;
      CFStringRef v31 = buffer;
    }

    else
    {
      CFStringRef v31 = 0LL;
    }

    uint64_t v30 = -1LL;
    int v28 = -1;
  }

        unint64_t v25 = v509;
        unint64_t v26 = *v12;
        if (!v509)
        {
LABEL_400:
          [v26 markResumptionPoint];
          goto LABEL_474;
        }

        if ((unint64_t)[v26 thisStageBytesComplete] <= 0x1D) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  617,  "_currentState.thisStageBytesComplete >= sizeof(LocalFileRecord)");
        }
        int v27 = [*v12 currentLFRecord];
        int v28 = *(unsigned __int16 *)(v27 + 26) + (unint64_t)*(unsigned __int16 *)(v27 + 28) + 30;
        if (v28 > [*v12 currentLFRecordAllocationSize])
        {
          objc_msgSend(*v12, "setCurrentLFRecord:", reallocf((void *)objc_msgSend(*v12, "currentLFRecord"), v28));
          if (![*v12 currentLFRecord])
          {
            SZGetLoggingHandle();
            v343 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_error_impl( &dword_1870CA000,  v343,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  (uint8_t *)&v551,  2u);
            }

            v345 = _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  624LL,  v457,  12LL,  0LL,  0LL,  @"Could not allocate memory for local file record",  v344,  v446);
            goto LABEL_440;
          }

          [*v12 setCurrentLFRecordAllocationSize:v28];
        }

        if ([*v12 thisStageBytesComplete] < v28)
        {
          uint32_t v29 = _CopyStreamBytesToRecord([*v12 currentLFRecord], v28, *v12, (const void **)&v510, &v509);

          if (v29) {
            goto LABEL_395;
          }
          unint64_t v25 = v509;
          if (!v509)
          {
LABEL_407:
            int v48 = *v12;
LABEL_408:
            [v48 markResumptionPoint];
            unsigned int v10 = 0LL;
LABEL_474:
            off_t v16 = 0LL;
            goto LABEL_511;
          }

          unsigned int v10 = 0LL;
        }

        if ([*v12 thisStageBytesComplete] != v28) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  643,  "_currentState.thisStageBytesComplete == fullLFRSize");
        }
        if (([*v12 currentLFRequiresDataDescriptor] & 1) == 0)
        {
          UncompressedSize = _GetUncompressedSize(*v12);
          CompressedSize = _GetCompressedSize(*v12);
          unsigned int v32 = *v12;
          if (!CompressedSize && UncompressedSize)
          {
            [v32 unsureData];
            v346 = (void *)objc_claimAutoreleasedReturnValue();

            SZGetLoggingHandle();
            v347 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v348 = v347;
            if (v346)
            {
              if (os_log_type_enabled(v347, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_impl( &dword_1870CA000,  v348,  OS_LOG_TYPE_DEFAULT,  "File has 0-length compressed size but non-zero uncompressed size; entering passthrough mode",
                  (uint8_t *)&v551,
                  2u);
              }

              v334 = v510;
              v336 = v8;
              v335 = v25;
              goto LABEL_439;
            }

            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              v429 = [*v12 currentOffset];
              v551.st_dev = v458;
              *(void *)&v551.st_mode = v429;
              _os_log_error_impl( &dword_1870CA000,  v348,  OS_LOG_TYPE_ERROR,  "Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-z ero uncompressed size",  (uint8_t *)&v551,  0xCu);
            }

            v558 = @"SZExtractorFileOffsetErrorKey";
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            v559 = v374;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v559 forKeys:&v558 count:1];
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            v444 = [*v12 currentOffset];
            _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  658LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v375,  @"Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size",  v381,  v444);
            goto LABEL_504;
          }

          if (!*(_WORD *)([v32 currentLFRecord] + 8) && UncompressedSize != CompressedSize)
          {
            v349 = v14;
            [*v12 unsureData];
            v350 = (void *)objc_claimAutoreleasedReturnValue();

            SZGetLoggingHandle();
            v351 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v352 = v351;
            if (v350)
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_impl( &dword_1870CA000,  v352,  OS_LOG_TYPE_DEFAULT,  "Stored file has compressed size != uncompressed size; entering passthrough mode",
                  (uint8_t *)&v551,
                  2u);
              }

              v353 = -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v25);
            }

            else
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
              {
                v430 = [*v12 currentOffset];
                v551.st_dev = 134218496;
                *(void *)&v551.st_mode = v430;
                WORD2(v551.st_ino) = 2048;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = UncompressedSize;
                HIWORD(v551.st_gid) = 2048;
                *(void *)&v551.st_rdev = CompressedSize;
                _os_log_error_impl( &dword_1870CA000,  v352,  OS_LOG_TYPE_ERROR,  "Encountered inconsistency in stream data: file at offset %llu is stored without compression but the un compressed and compressed sizes are not equal (%llu != %llu)",  (uint8_t *)&v551,  0x20u);
              }

              v556 = @"SZExtractorFileOffsetErrorKey";
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
              v382 = (void *)objc_claimAutoreleasedReturnValue();
              v557 = v382;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v557 forKeys:&v556 count:1];
              v383 = (void *)objc_claimAutoreleasedReturnValue();
              v384 = [*v12 currentOffset];
              v353 = _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  671LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v383,  @"Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)",  v385,  v384);
            }

            off_t v16 = 0LL;
            unsigned int v10 = (id)v353;
            size_t v14 = v349;
            goto LABEL_511;
          }
        }

        v467 = v10;
        v463 = v14;
        unsigned int v10 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v12 currentLFRecord]);
        uint64_t v33 = (const char *)[v10 fileSystemRepresentation];
        __int16 v34 = *v12;
        if (!v10 || !v33)
        {
          [v34 unsureData];
          v318 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v319 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v320 = v319;
          if (v318)
          {
            v321 = os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT);
            size_t v14 = v463;
            if (v321)
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl( &dword_1870CA000,  v320,  OS_LOG_TYPE_DEFAULT,  "Failed to get filename for file; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v25);
            unsigned int v17 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v367 = os_log_type_enabled(v319, OS_LOG_TYPE_ERROR);
            size_t v14 = v463;
            if (v367)
            {
              v419 = [*v12 currentOffset];
              v551.st_dev = v458;
              *(void *)&v551.st_mode = v419;
              _os_log_error_impl( &dword_1870CA000,  v320,  OS_LOG_TYPE_ERROR,  "Failed to get filename for file at offset %llu.",  (uint8_t *)&v551,  0xCu);
            }

            v554 = @"SZExtractorFileOffsetErrorKey";
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            v555 = v368;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v555 forKeys:&v554 count:1];
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            v370 = [*v12 currentOffset];
            _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  686LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v369,  @"Failed to get filename for file at offset %llu.",  v371,  v370);
            unsigned int v17 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_461;
        }

        uint32_t v35 = [v34 currentLFRecord];
        int v36 = *(unsigned __int8 *)(*(unsigned __int16 *)(v35 + 26) + v35 + 29);
        [*v12 setPerformingExtraction:1];
        uint64_t v37 = [*v12 currentLFRecord];
        size_t v38 = v12;
        CFPropertyListRef v39 = *(unsigned __int16 *)(v37 + 8);
        ssize_t v40 = [*v38 currentLFRequiresDataDescriptor];
        SZGetTraceHandle();
        char v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        int8x16_t v42 = os_signpost_enabled(v41);
        if (v40)
        {
          if (!v42) {
            goto LABEL_78;
          }
          v551.st_dev = v455;
          *(void *)&v551.st_mode = v10;
          WORD2(v551.st_ino) = 1024;
          *(_DWORD *)((char *)&v551.st_ino + 6) = v39;
          size_t v43 = v41;
          CFStringRef v44 = "Processing file %@ (csize: ??; usize: ??; cmethod: %hu)";
          CFStringRef v45 = 18;
        }

        else
        {
          if (!v42) {
            goto LABEL_78;
          }
          size_t v75 = v468;
          uint64_t v76 = _GetCompressedSize(*v468);
          size_t v77 = _GetUncompressedSize(*v75);
          v551.st_dev = v454;
          *(void *)&v551.st_mode = v10;
          WORD2(v551.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v76;
          HIWORD(v551.st_gid) = 2048;
          *(void *)&v551.st_rdev = v77;
          LOWORD(v551.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&v551.st_atimespec.tv_sec + 2) = v39;
          size_t v43 = v41;
          CFStringRef v44 = "Processing file %@ (csize: %llu; usize: %llu; cmethod: %hu)";
          CFStringRef v45 = 38;
        }

        _os_signpost_emit_with_name_impl( &dword_1870CA000,  v43,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  v44,  (uint8_t *)&v551,  v45);
LABEL_78:

        unint64_t v12 = v468;
        if (v36 == 47 && ([*v468 currentLFRequiresDataDescriptor] & 1) == 0 && _GetCompressedSize(*v12))
        {
          [*v12 unsureData];
          v372 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v373 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v322 = v373;
          if (v372)
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
            {
              v551.st_dev = v451;
              *(void *)&v551.st_mode = v33;
              v324 = "Got directory %s with non-zero compressed data size; entering passthrough mode";
              v325 = v322;
              v326 = 12;
LABEL_419:
              _os_log_impl(&dword_1870CA000, v325, OS_LOG_TYPE_DEFAULT, v324, (uint8_t *)&v551, v326);
            }

LABEL_30:
  char v41 = ZipStreamWriteLocalFile(0LL, (void ***)&value, &v58, v31, 0, a11, a12, a9, a10);
  if ((v41 & 1) != 0)
  {
    if (*(_BYTE *)(a10 + 49)) {
      DestroyMutableCDRecord((void **)value);
    }
    else {
      CFArrayAppendValue(theArray, value);
    }
  }

  else
  {
    int8x16_t v42 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      size_t v43 = v58[7];
      *(_DWORD *)int buf = 136315138;
      uint64_t v60 = (uint64_t)v43;
      _os_log_error_impl( &dword_1870CA000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to write local file named %s to archive",  buf,  0xCu);
    }
  }

  if (v30 != -1) {
    munmap((void *)v30, a3);
  }
  if ((v28 & 0x80000000) == 0) {
    close(v28);
  }
  DestroyMutableLocalFileRecord(v58);
  if ((v41 & 1) != 0)
  {
    uint64_t v37 = 1LL;
    if (!v23) {
      return v37;
    }
    goto LABEL_23;
  }

LABEL_22:
  DestroyMutableCDRecord((void **)value);
  uint64_t v37 = 0LL;
  if (v23) {
LABEL_23:
  }
    CFRelease(v23);
  return v37;
}

char *_CopyArchivePath(uint64_t a1, uint64_t a2, __int16 a3)
{
  if (*(_BYTE *)(a1 + a2) == 47) {
    uint64_t v3 = a2 + 1;
  }
  else {
    uint64_t v3 = a2;
  }
  CFNumberRef v6 = 0LL;
  BOOL v4 = (const char *)(a1 + v3);
  if ((a3 & 0xF000) != 0x4000) {
    return strdup(v4);
  }
  asprintf(&v6, "%s/", v4);
  return v6;
}

uint64_t _IsExcludedFileName(char *__s2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (strcmp("META-INF/", __s2)
    && strcmp("META-INF/com.apple.ZipMetadata.plist", __s2)
    && strcmp("META-INF/com.apple.FixedZipMetadata.bin", __s2)
    && strcmp("mimetype", __s2))
  {
    return 0LL;
  }

  uint64_t v3 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    BOOL v5 = __s2;
    _os_log_debug_impl(&dword_1870CA000, v3, OS_LOG_TYPE_DEBUG, "Path %s is excluded", (uint8_t *)&v4, 0xCu);
  }

  return 1LL;
}

uint64_t _IsOrderedEarly(char *buffer, const __CFArray *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = a2;
  CFStringRef v4 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], buffer);
  v10.length = CFArrayGetCount(v2);
  v10.location = 0LL;
  LODWORD(v2) = CFArrayContainsValue(v2, v10, v4);
  CFRelease(v4);
  if (!(_DWORD)v2) {
    return 0LL;
  }
  BOOL v5 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    int v8 = buffer;
    _os_log_debug_impl(&dword_1870CA000, v5, OS_LOG_TYPE_DEBUG, "Path %s was ordered early", (uint8_t *)&v7, 0xCu);
  }

  return 1LL;
}

unint64_t _FindHighestCount(unint64_t result, unint64_t a2, unint64_t *a3)
{
  if (*a3 < a2)
  {
    *a3 = a2;
    a3[1] = result;
  }

  return result;
}

CFArrayRef SZArchiverCopyStatsKeys()
{
  uint64_t v0 = 0LL;
  values[26] = *(void **)MEMORY[0x1895F89C0];
  v1 = (void ***)&sStatsData;
  do
  {
    uint64_t v2 = *v1;
    v1 += 5;
    values[v0++] = *v2;
  }

  while (v0 != 26);
  return CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)values, 26LL, MEMORY[0x189605228]);
}

CFArrayRef SZArchiverCopyStatsDescriptions()
{
  uint64_t v0 = 0LL;
  unint64_t v1 = 0LL;
  values[26] = *(void **)MEMORY[0x1895F89C0];
  do
  {
    unint64_t Length = CFStringGetLength(*(&sStatsData)[v0]);
    if (Length > v1) {
      unint64_t v1 = Length;
    }
    v0 += 5LL;
  }

  while (v0 != 130);
  uint64_t v3 = malloc(v1 + 4);
  uint64_t v4 = 0LL;
  BOOL v5 = &off_189FE1418;
  uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  do
  {
    int v7 = (CFStringRef *)*(v5 - 4);
    size_t v8 = v1 - CFStringGetLength(*v7) + 4;
    memset(v3, 32, v8);
    *((_BYTE *)v3 + v8) = 0;
    uint64_t v9 = "CFNumber:uint64_t";
    if (v4 == 13) {
      uint64_t v9 = "CFNumber:int64_t";
    }
    if (v4 == 14) {
      uint64_t v9 = "CFNumber:double";
    }
    if (v4 == 21) {
      uint64_t v9 = "CFBoolean     ";
    }
    CFRange v10 = *v5;
    v5 += 5;
    values[v4++] = (void *)CFStringCreateWithFormat(v6, 0LL, @"       %@%s%s\t%s", *v7, v3, v9, v10);
  }

  while (v4 != 26);
  CFArrayRef v11 = CFArrayCreate(v6, (const void **)values, 26LL, MEMORY[0x189605228]);
  for (uint64_t i = 0LL; i != 26; ++i)
    CFRelease(values[i]);
  free(v3);
  return v11;
}

uint64_t SZArchiverConvertZipArchiveToStreamable( const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t v128 = *MEMORY[0x1895F89C0];
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  memset(v90, 0, sizeof(v90));
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  uint64_t v93 = 0LL;
  uint64_t result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v89);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(a3, (uint64_t)v90);
  if (!(_DWORD)result) {
    return result;
  }
  *((void *)&v90[0] + 1) = v89;
  memset(&v107, 0, sizeof(v107));
  if (*(void *)&v90[0] && HIBYTE(v91))
  {
    size_t v8 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_ERROR,  "Ignoring hashed chunk size supplied because output seeking is disallowed.",  buf,  2u);
    }

    *(void *)&v90[0] = 0LL;
  }

  if (lstat(a1, &v107))
  {
    uint64_t v9 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFRange v10 = __error();
      CFArrayRef v11 = strerror(*v10);
      *(_DWORD *)int buf = 136315394;
      uint64_t v125 = (uint64_t)a1;
      __int16 v126 = 2080;
      CFIndex v127 = (CFIndex)v11;
      unint64_t v12 = "Failed to stat %s : %s";
      uint64_t v13 = v9;
      uint32_t v14 = 22;
LABEL_28:
      _os_log_error_impl(&dword_1870CA000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_29;
    }

    goto LABEL_29;
  }

  if ((v107.st_mode & 0xF000) != 0x8000)
  {
    int v28 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315394;
      uint64_t v125 = (uint64_t)a1;
      __int16 v126 = 1024;
      LODWORD(v127) = v107.st_mode;
      unint64_t v12 = "Object at input path %s was not a file; mode 0%ho";
      uint64_t v13 = v28;
      uint32_t v14 = 18;
      goto LABEL_28;
    }

LABEL_86:
    char v59 = 0;
    goto LABEL_87;
  }

  CFIndex v86 = CFArrayGetCount(v23);
  CFArrayAppendValue(v23, v120);
  uint64_t v120 = 0LL;
  CFIndex v85 = -1LL;
  if (*(void *)&v90[0] && !HIBYTE(v91))
  {
    if (!ZipStreamConcoctFixedStreamData((uint64_t)v90, &v117, &v116, (const Bytef **)&v115))
    {
      CFStringRef v45 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      *(_WORD *)int buf = 0;
      int v46 = "Failed to concoct fixed stream data";
      goto LABEL_52;
    }

    CFIndex v85 = CFArrayGetCount(v23);
    CFArrayAppendValue(v23, v117);
    uint64_t v117 = 0LL;
  }

  uint64_t v37 = (const void **)v121;
  if (v17)
  {
    uint64_t v83 = v27;
    for (uint64_t i = 0LL; i != v17; ++i)
    {
      CFPropertyListRef v39 = v37[i];
      if (v39)
      {
        ssize_t v40 = (const char *)*((void *)v39 + 9);
        LOBYTE(v109) = 0;
        if (ZipStreamShouldOrderFileEarly(v40, &v109))
        {
          CFArrayAppendValue(v23, v37[i]);
          uint64_t v41 = (uint64_t)v37[i];
          v37[i] = 0LL;
          if ((_BYTE)v109)
          {
            v110 = 0LL;
            if (_GetCDIndexOfBundleExecutableForInfoPlist((FILE **)v16, (uint64_t)v37, v17, v41, &v110))
            {
              int8x16_t v42 = v110;
              size_t v43 = v37[(void)v110];
              *((void *)&v101 + 1) = v43[5];
              CFArrayAppendValue(v23, v43);
              v37[(void)v42] = 0LL;
            }

            else
            {
              CFStringRef v44 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 136315138;
                uint64_t v125 = (uint64_t)v40;
                _os_log_debug_impl( &dword_1870CA000,  v44,  OS_LOG_TYPE_DEBUG,  "Failed to find executable for bundle Info.plist %s",  buf,  0xCu);
              }
            }
          }
        }
      }
    }

    qsort(v37, v17, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
    uint64_t v27 = v83;
    do
    {
      if (*v37)
      {
        CFArrayAppendValue(v23, *v37);
        *uint64_t v37 = 0LL;
      }

      ++v37;
      --v17;
    }

    while (v17);
  }

  else
  {
    qsort(v121, 0LL, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
  }

  off_t v49 = (os_log_s *)SZGetLoggingHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_debug_impl(&dword_1870CA000, v49, OS_LOG_TYPE_DEBUG, "Writing local files", buf, 2u);
  }

  if (v21 != CFArrayGetCount(v23))
  {
    uint64_t v57 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      CFIndex v58 = CFArrayGetCount(v23);
      *(_DWORD *)int buf = 134218240;
      uint64_t v125 = v21;
      __int16 v126 = 2048;
      CFIndex v127 = v58;
      int v46 = "Mismatched record count: expected %llu records, but we have %ld records";
      CFTypeID v47 = v57;
      uint32_t v48 = 22;
      goto LABEL_80;
    }

    goto LABEL_86;
  }

  if (v21)
  {
    CFIndex v50 = 0LL;
    __int16 v82 = v115;
    unint64_t v84 = v118;
    while (1)
    {
      ValueAtIndex = (void **)CFArrayGetValueAtIndex(v23, v50);
      int v109 = 0LL;
      v110 = ValueAtIndex;
      int v108 = 0;
      uint32_t v52 = ValueAtIndex[9];
      uint64_t v53 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136315138;
        uint64_t v125 = (uint64_t)v52;
        _os_log_debug_impl(&dword_1870CA000, v53, OS_LOG_TYPE_DEBUG, "Processing file %s", buf, 0xCu);
      }

      if (v86 == v50)
      {
        int v54 = 0;
        p_MutableLocalFileRecord = &v119;
        int v56 = v84;
      }

      else if (v85 == v50)
      {
        int v54 = 0;
        p_MutableLocalFileRecord = &v116;
        int v56 = (char *)v82;
      }

      else if (v27 == v50)
      {
        int v56 = 0LL;
        int v54 = 0;
        p_MutableLocalFileRecord = &MutableLocalFileRecord;
      }

      else
      {
        int v109 = (void **)CopyLocalFileHeader((FILE **)v16, (uint64_t)ValueAtIndex, &v108);
        if (!v109)
        {
          int v81 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            LODWORD(v125) = v108;
            _os_log_error_impl( &dword_1870CA000,  v81,  OS_LOG_TYPE_ERROR,  "CopyLocalFileHeader returned error %d",  buf,  8u);
          }

          goto LABEL_122;
        }

        int v56 = 0LL;
        p_MutableLocalFileRecord = &v109;
        int v54 = 1;
      }

      CFArraySetValueAtIndex(v23, v50, v110);
      if (v54) {
        DestroyMutableLocalFileRecord(v109);
      }
      if (v21 == ++v50) {
        goto LABEL_83;
      }
    }

    int v80 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      if (!v54) {
        goto LABEL_122;
      }
      goto LABEL_121;
    }

    *(_DWORD *)int buf = 136315138;
    uint64_t v125 = (uint64_t)v52;
    _os_log_error_impl(&dword_1870CA000, v80, OS_LOG_TYPE_ERROR, "Failed to write local file %s", buf, 0xCu);
    if (v54) {
LABEL_121:
    }
      free(v109);
LABEL_122:
    char v59 = 0;
    goto LABEL_87;
  }

LABEL_83:
  if ((ZipStreamWriteCentralDirectoryAndEndRecords(v23, v85, (uint64_t)v116, (uint64_t)&v94, (uint64_t)v90) & 1) == 0)
  {
    CFStringRef v45 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_86;
    }
    *(_WORD *)int buf = 0;
    int v46 = "Failed to finish writing archive.";
    goto LABEL_52;
  }

  char v59 = 1;
LABEL_87:
  uint64_t v60 = v121;
  if (v121)
  {
    size_t v61 = v123;
    if (v123)
    {
      size_t v62 = v121;
      do
      {
        if (*v62) {
          DestroyMutableCDRecord(*v62);
        }
        ++v62;
        --v61;
      }

      while (v61);
    }

    free(v60);
  }

  if (v23)
  {
    if (v21)
    {
      for (CFIndex j = 0LL; j != v21; ++j)
      {
        CFTypeID v64 = (void **)CFArrayGetValueAtIndex(v23, j);
        DestroyMutableCDRecord(v64);
      }
    }

    CFRelease(v23);
  }

  DestroyMutableCDRecord(v120);
  DestroyMutableLocalFileRecord(v119);
  free(v118);
  DestroyMutableCDRecord(v117);
  DestroyMutableLocalFileRecord(v116);
  free(v115);
  DestroyMutableLocalFileRecord(MutableLocalFileRecord);
  if ((v59 & 1) == 0)
  {
    unint64_t v70 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)int buf = 136315138;
    uint64_t v125 = (uint64_t)a1;
    int v71 = "Failed to process file %s";
    __int16 v72 = v70;
LABEL_118:
    _os_log_error_impl(&dword_1870CA000, v72, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);
    goto LABEL_30;
  }

  uint64_t v65 = *((void *)&v90[0] + 1);
  uint64_t v66 = *(unsigned int (**)(void))(*((void *)&v90[0] + 1) + 88LL);
  if (v66)
  {
    if (v66(*(void *)(*((void *)&v90[0] + 1) + 80LL)) == -1)
    {
      int v76 = *__error();
      __int16 v74 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      size_t v77 = strerror(v76);
      *(_DWORD *)int buf = 136315138;
      uint64_t v125 = (uint64_t)v77;
      int v71 = "Failed to flush output: %s";
      goto LABEL_117;
    }

    uint64_t v65 = *((void *)&v90[0] + 1);
  }

  uint64_t v67 = (*(uint64_t (**)(void))(v65 + 72))(*(void *)(v65 + 80));
  if (v67 < 0)
  {
    int v73 = *__error();
    __int16 v74 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    size_t v75 = strerror(v73);
    *(_DWORD *)int buf = 136315138;
    uint64_t v125 = (uint64_t)v75;
    int v71 = "Failed to get offset in file at end of writing: %s";
    goto LABEL_117;
  }

  unint64_t v68 = v67;
  if (!HIBYTE(v91)
    && (*(unsigned int (**)(void, uint64_t))(*((void *)&v90[0] + 1) + 96LL))( *(void *)(*((void *)&v90[0] + 1) + 80LL),  v67))
  {
    int v78 = *__error();
    __int16 v74 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    compression_status v79 = strerror(v78);
    *(_DWORD *)int buf = 136315138;
    uint64_t v125 = (uint64_t)v79;
    int v71 = "Failed to truncate output: %s";
LABEL_117:
    __int16 v72 = v74;
    goto LABEL_118;
  }

  *((void *)&v95 + 1) = v68;
  unint64_t v69 = *(void *)(v16 + 8);
  *((void *)&v105 + 1) = v68 - v69;
  *(double *)&__int128 v106 = (double)v68 / (double)v69 * 100.0;
  CloseZipFile(v16);
  if (a4) {
    *a4 = _ConvertStatsToDict((uint64_t)&v94);
  }
  return 1LL;
}

BOOL _UpgradeCallbacksToCurrent(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*a1 == 1)
  {
    __int128 v8 = *(_OWORD *)a1;
    __int128 v9 = *((_OWORD *)a1 + 2);
    *(_OWORD *)(a2 + 16) = *((_OWORD *)a1 + 1);
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)a2 = v8;
    __int128 v10 = *((_OWORD *)a1 + 3);
    __int128 v11 = *((_OWORD *)a1 + 4);
    __int128 v12 = *((_OWORD *)a1 + 5);
    *(void *)(a2 + 96) = *((void *)a1 + 12);
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v12;
    *(_OWORD *)(a2 + 48) = v10;
    return 1LL;
  }

  else if (*a1)
  {
    uint64_t v13 = (os_log_s *)SZGetLoggingHandle();
    BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (result)
    {
      int v14 = *a1;
      v15[0] = 67109120;
      v15[1] = v14;
      _os_log_error_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_ERROR,  "Don't know how to handle callbacks struct version %hhu",  (uint8_t *)v15,  8u);
      return 0LL;
    }
  }

  else
  {
    __int128 v3 = *((_OWORD *)a1 + 1);
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = v3;
    __int128 v4 = *((_OWORD *)a1 + 2);
    __int128 v5 = *((_OWORD *)a1 + 4);
    uint64_t v6 = *((void *)a1 + 10);
    *(_OWORD *)(a2 + 48) = *((_OWORD *)a1 + 3);
    *(_OWORD *)(a2 + 64) = v5;
    *(_OWORD *)(a2 + 32) = v4;
    BOOL result = 1LL;
    *(_BYTE *)a2 = 1;
    *(void *)(a2 + 88) = 0LL;
    *(void *)(a2 + 96) = 0LL;
    *(void *)(a2 + 80) = v6;
  }

  return result;
}

uint64_t _ConvertOptionsToConfiguration(const __CFDictionary *a1, uint64_t a2)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"HashedChunkSize");
  if (Value)
  {
    uint64_t result = CFNumberGetValue(Value, kCFNumberLongLongType, (void *)a2);
    if (!(_DWORD)result) {
      return result;
    }
  }

  *(void *)(a2 + 16) = CFDictionaryGetValue(a1, @"CommandLineString");
  *(void *)(a2 + 24) = CFDictionaryGetValue(a1, @"ExecutableUUID");
  uint64_t v6 = (const __CFString *)CFDictionaryGetValue(a1, @"CompressionOptions");
  if (v6 && (int v7 = v6, CFStringCompare(v6, @"ForceUncompressed", 0LL)))
  {
    if (CFStringCompare(v7, @"PreserveCompression", 0LL))
    {
      if (CFStringCompare(v7, @"TryRecompress", 0LL))
      {
        if (CFStringCompare(v7, @"ForceCompressed", 0LL)) {
          return 0LL;
        }
        int v8 = 3;
      }

      else
      {
        int v8 = 2;
      }
    }

    else
    {
      int v8 = 1;
    }
  }

  else
  {
    int v8 = 0;
  }

  *(_DWORD *)(a2 + 32) = v8;
  __int128 v9 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ZlibCompressionLevel");
  __int128 v10 = (_DWORD *)(a2 + 40);
  if (v9)
  {
    uint64_t result = CFNumberGetValue(v9, kCFNumberIntType, (void *)(a2 + 40));
    if (!(_DWORD)result) {
      return result;
    }
    if (*v10 > 9u) {
      return 0LL;
    }
  }

  else
  {
    *__int128 v10 = 9;
  }

  __int128 v11 = (const __CFString *)CFDictionaryGetValue(a1, @"HashType");
  if (!v11) {
    goto LABEL_31;
  }
  __int128 v12 = v11;
  if (CFStringCompare(v11, @"MD5", 0LL) == kCFCompareEqualTo)
  {
    char v13 = 0;
    goto LABEL_30;
  }

  if (CFStringCompare(v12, @"SHA1", 0LL) == kCFCompareEqualTo)
  {
    char v13 = 1;
    goto LABEL_30;
  }

  if (CFStringCompare(v12, @"SHA224", 0LL) == kCFCompareEqualTo)
  {
    char v13 = 4;
    goto LABEL_30;
  }

  if (CFStringCompare(v12, @"SHA256", 0LL) == kCFCompareEqualTo)
  {
    char v13 = 5;
    goto LABEL_30;
  }

  if (CFStringCompare(v12, @"SHA384", 0LL) == kCFCompareEqualTo)
  {
    char v13 = 6;
    goto LABEL_30;
  }

  if (CFStringCompare(v12, @"SHA512", 0LL)) {
    return 0LL;
  }
  char v13 = 7;
LABEL_30:
  *(_BYTE *)(a2 + 44) = v13;
LABEL_31:
  int v14 = (const __CFString *)CFDictionaryGetValue(a1, @"CompressionMethod");
  if (v14 && (BOOL v15 = v14, CFStringCompare(v14, @"DEFLATE", 0LL)))
  {
    if (CFStringCompare(v15, @"LZFSE", 0LL))
    {
      if (CFStringCompare(v15, @"LZMA", 0LL)) {
        return 0LL;
      }
      int v16 = 14;
    }

    else
    {
      int v16 = 99;
    }
  }

  else
  {
    int v16 = 8;
  }

  *(_DWORD *)(a2 + 36) = v16;
  _FetchAndSetBoolean(a1, @"UncompressBloatedFiles", (BOOL *)(a2 + 45), 1);
  _FetchAndSetBoolean(a1, @"NoCache", (BOOL *)(a2 + 46), 0);
  _FetchAndSetBoolean(a1, @"NoSeekOutput", (BOOL *)(a2 + 47), 0);
  _FetchAndSetBoolean(a1, @"SkipPrescan", (BOOL *)(a2 + 48), 0);
  _FetchAndSetBoolean(a1, @"NoCentralDirectory", (BOOL *)(a2 + 49), 0);
  unint64_t v17 = CFDictionaryGetValue(a1, @"CustomPathOrdering");
  if (v17) {
    *(_BYTE *)(a2 + 48) = 1;
  }
  *(void *)(a2 + 56) = v17;
  _FetchAndSetBoolean(a1, @"IncludeContainingDirectory", (BOOL *)(a2 + 64), 0);
  _FetchAndSetBoolean(a1, @"FollowAllSymlinks", (BOOL *)(a2 + 65), 0);
  return 1LL;
}

CFDictionaryRef _ConvertStatsToDict(uint64_t a1)
{
  uint64_t v2 = 0LL;
  keys[26] = *(void **)MEMORY[0x1895F89C0];
  __int128 v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  __int128 v4 = (const __CFNumber *)*MEMORY[0x189604DE8];
  __int128 v5 = (const __CFNumber *)*MEMORY[0x189604DE0];
  unint64_t v6 = 0x1FFFFFFFFFFFFF7EuLL;
  do
  {
    keys[v2] = *(&sStatsData)[v6 + 130];
    if (v6 == 0x1FFFFFFFFFFFFFE7LL)
    {
      if ((*(_BYTE *)(a1 + 200) & 1) != 0) {
        CFNumberRef v7 = v4;
      }
      else {
        CFNumberRef v7 = v5;
      }
      CFRetain(v7);
    }

    else
    {
      CFNumberRef v7 = CFNumberCreate(v3, (CFNumberType)(&sStatsData)[v6 + 131], (char *)(&sStatsData)[v6 + 133] + a1);
    }

    v11[v2++] = v7;
    v6 += 5LL;
  }

  while (v6 * 8);
  CFDictionaryRef v8 = CFDictionaryCreate(v3, (const void **)keys, v11, 26LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  for (uint64_t i = 0LL; i != 26; ++i)
    CFRelease(v11[i]);
  return v8;
}

const void *_FetchAndSetBoolean(const __CFDictionary *a1, const void *a2, BOOL *a3, BOOL a4)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t result = (const void *)CFEqual(result, (CFTypeRef)*MEMORY[0x189604DE8]);
    a4 = (_DWORD)result != 0;
  }

  *a3 = a4;
  return result;
}

uint64_t SZArchiverCreateStreamableZip( const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t v162 = *MEMORY[0x1895F89C0];
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  memset(v125, 0, sizeof(v125));
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  uint64_t v128 = 0LL;
  uint64_t result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v124);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(a3, (uint64_t)v125);
  if (!(_DWORD)result) {
    return result;
  }
  *((void *)&v125[0] + 1) = v124;
  *(_DWORD *)__int16 v151 = 0;
  uint64_t v150 = 0LL;
  off_t v149 = 0LL;
  value = 0LL;
  __int16 v147 = 0LL;
  v146 = 0LL;
  CFDictionaryRef v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  size_t v145 = 0LL;
  bzero(__str, 0x400uLL);
  memset(&v144, 0, sizeof(v144));
  memset(&v143, 0, sizeof(v143));
  bzero(__s, 0x400uLL);
  v159[0] = __s;
  v159[1] = 0LL;
  if (!realpath_DARWIN_EXTSN(a1, __s))
  {
    int v18 = *__error();
    uint64_t v19 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = strerror(v18);
      buf[0].st_dev = 136315906;
      *(void *)&buf[0].mode_t st_mode = a1;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)__s;
      HIWORD(buf[0].st_gid) = 2080;
      *(void *)&buf[0].st_rdev = v20;
      LOWORD(buf[0].st_atimespec.tv_sec) = 1024;
      *(_DWORD *)((char *)&buf[0].st_atimespec.tv_sec + 2) = v18;
      BOOL v15 = "Realpath for %s failed at %s : %s (%d)";
      int v16 = v19;
      uint32_t v17 = 38;
      goto LABEL_48;
    }

LABEL_44:
    off_t st_size = 0LL;
    CFIndex v37 = 16LL;
    uint64_t v150 = 16LL;
    v151[0] = 16877;
    v151[1] = -32348;
    goto LABEL_54;
  }

  if (v36 != 0x8000)
  {
    CFPropertyListRef v39 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      buf[0].st_dev = 67109120;
      *(_DWORD *)&buf[0].mode_t st_mode = v144.st_mode;
      BOOL v15 = "Unsupported type for source path: mode = 0%ho";
      int v16 = v39;
      uint32_t v17 = 8;
      goto LABEL_48;
    }

    goto LABEL_12;
  }

  if ((_BYTE)v127) {
    goto LABEL_44;
  }
  v151[1] = v144.st_mode;
  v151[0] = 16877;
  CFIndex v37 = 1LL;
  uint64_t v150 = 1LL;
  off_t st_size = v144.st_size;
  off_t v149 = v144.st_size;
LABEL_51:
  uint64_t v40 = 2LL;
  if (!HIBYTE(v126)) {
    uint64_t v40 = 3LL;
  }
  ZipStreamCallPreflightResultCallback(*((uint64_t *)&v125[0] + 1), v40 + v37, st_size, st_mode);
LABEL_54:
  size_t v24 = CFArrayCreateMutable(v8, v37, 0LL);
  snprintf(__str, 0x400uLL, "%s/mimetype", __s);
  if (!lstat(__str, &v143)
    && (_WriteLocalFile( __str,  "mimetype",  v143.st_size,  v143.st_mode,  (void *)v143.st_atimespec.tv_sec,  (void *)v143.st_mtimespec.tv_sec,  v143.st_uid,  v143.st_gid,  (uint64_t)&v129,  (uint64_t)v125,  v151[1],  v151[0],  v24) & 1) == 0)
  {
    uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "Failed to write mimetype file out to archive";
    goto LABEL_139;
  }

  snprintf(__str, 0x400uLL, "%s/%s", __s, "META-INF/");
  if (lstat(__str, &v143))
  {
    memset(&v143, 0, sizeof(v143));
    v143.mode_t st_mode = 16877;
    tv_sec = (void *)time(0LL);
    v143.st_mtimespec.tv_sec = (__darwin_time_t)tv_sec;
    __int16 st_gid = 501;
    *(int32x2_t *)&v143.__int16 st_uid = vdup_n_s32(0x1F5u);
    __int16 st_uid = 501;
  }

  else
  {
    tv_sec = (void *)v143.st_mtimespec.tv_sec;
    __int16 st_uid = v143.st_uid;
    __int16 st_gid = v143.st_gid;
  }

  unsigned int v44 = (unsigned __int16)v151[1];
  unsigned int v45 = (unsigned __int16)v151[0];
  if ((_WriteLocalFile( __str,  "META-INF/",  v143.st_size,  v143.st_mode,  (void *)v143.st_atimespec.tv_sec,  tv_sec,  st_uid,  st_gid,  (uint64_t)&v129,  (uint64_t)v125,  v151[1],  v151[0],  v24) & 1) == 0)
  {
    uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "Failed to write metadata directory to archive";
    goto LABEL_139;
  }

  if (!ZipStreamConcoctStreamData(v37, st_size, v44, v45, (uint64_t)v125, &value, &v147, &v145))
  {
    uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "failed to create stream metadata";
    goto LABEL_139;
  }

  uint64_t v27 = v145;
  if ((ZipStreamWriteLocalFile(0LL, (void ***)&value, &v147, (char *)v145, 0, v44, v45, (uint64_t)&v129, (uint64_t)v125) & 1) == 0)
  {
    uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      size_t v61 = "Failed to write stream metadata";
      goto LABEL_139;
    }

    goto LABEL_93;
  }

  CFArrayAppendValue(v24, value);
  value = 0LL;
  free(v27);
  size_t v145 = 0LL;
  DestroyMutableLocalFileRecord(v147);
  __int16 v147 = 0LL;
  CFIndex Count = -1LL;
  if (*(void *)&v125[0] && !HIBYTE(v126))
  {
    if (ZipStreamConcoctFixedStreamData((uint64_t)v125, &value, &v146, (const Bytef **)&v145))
    {
      uint64_t v27 = v145;
      if ((ZipStreamWriteLocalFile( 0LL,  (void ***)&value,  &v146,  (char *)v145,  0,  v44,  v45,  (uint64_t)&v129,  (uint64_t)v125) & 1) != 0)
      {
        CFIndex Count = CFArrayGetCount(v24);
        CFArrayAppendValue(v24, value);
        value = 0LL;
        free(v27);
        size_t v145 = 0LL;
        goto LABEL_67;
      }

      uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0].st_dev) = 0;
        size_t v61 = "Failed to write stream metadata";
        goto LABEL_139;
      }

LABEL_67:
  CFIndex v120 = Count;
  unsigned __int16 v122 = v45;
  unsigned __int16 v123 = v44;
  if (Mutable)
  {
    CFIndex v121 = CFArrayGetCount(Mutable);
    if (v121 >= 1)
    {
      CFIndex v47 = 0LL;
      while (1)
      {
        bzero(buf, 0x400uLL);
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v47);
        CFStringRef v49 = CFStringCreateWithFileSystemRepresentation(0LL, __s);
        if (!v49)
        {
          __int128 v92 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            goto LABEL_142;
          }
          *(_DWORD *)uint64_t v152 = 136315138;
          uint64_t v153 = __s;
          size_t v61 = "unable to create dirPathStr from: %s";
          unsigned int v88 = v152;
          uint64_t v89 = v92;
          uint32_t v90 = 12;
          goto LABEL_141;
        }

        CFIndex v50 = (char *)v49;
        int v51 = CFStringCreateWithFormat(v8, 0LL, @"%@/%@", v49, ValueAtIndex);
        if (!v51)
        {
          uint64_t v93 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v152 = 138412546;
            uint64_t v153 = v50;
            __int16 v154 = 2112;
            v155 = (stat *)ValueAtIndex;
            _os_log_error_impl( &dword_1870CA000,  v93,  OS_LOG_TYPE_ERROR,  "unable to create fullPath from: %@ and %@",  v152,  0x16u);
          }

          CFRelease(v50);
          goto LABEL_142;
        }

        uint32_t v52 = v51;
        int FileSystemRepresentation = CFStringGetFileSystemRepresentation(v51, __str, 1024LL);
        CFRelease(v50);
        CFRelease(v52);
        if (!FileSystemRepresentation)
        {
          uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_142;
          }
          *(_WORD *)uint64_t v152 = 0;
          size_t v61 = "Failed to convert full path to C string";
          goto LABEL_173;
        }

        if (!CFStringGetFileSystemRepresentation(ValueAtIndex, (char *)buf, 1024LL))
        {
          uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_142;
          }
          *(_WORD *)uint64_t v152 = 0;
          size_t v61 = "Failed to convert archive path to C string";
          goto LABEL_173;
        }

        LOWORD(v45) = v122;
        LOWORD(v44) = v123;
        if (!lstat(__str, &v143)
          && (_WriteLocalFile( __str,  (const char *)buf,  v143.st_size,  v143.st_mode,  (void *)v143.st_atimespec.tv_sec,  (void *)v143.st_mtimespec.tv_sec,  v143.st_uid,  v143.st_gid,  (uint64_t)&v129,  (uint64_t)v125,  v123,  v122,  v24) & 1) == 0)
        {
          break;
        }

        if (v121 == ++v47) {
          goto LABEL_77;
        }
      }

      uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        goto LABEL_142;
      }
      *(_WORD *)uint64_t v152 = 0;
      size_t v61 = "Failed to write mimetype file out to archive";
      goto LABEL_173;
    }
  }

LABEL_77:
  int v54 = v144.st_mode;
  if ((v144.st_mode & 0xF000) == 0x4000)
  {
    if (*((void *)&v127 + 1))
    {
      CFIndex v55 = CFArrayGetCount(*((CFArrayRef *)&v127 + 1));
      bzero(buf, 0x400uLL);
      if (v55 <= 0)
      {
        uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v152 = 0;
          size_t v61 = "The custom path ordering array is empty";
LABEL_173:
          unsigned int v88 = v152;
LABEL_140:
          uint64_t v89 = v60;
          uint32_t v90 = 2;
LABEL_141:
          _os_log_error_impl(&dword_1870CA000, v89, OS_LOG_TYPE_ERROR, v61, v88, v90);
        }
      }

      else
      {
        int v56 = (void **)calloc(v55 + 1, 8uLL);
        if (v56)
        {
          int v22 = v56;
          CFIndex v57 = 0LL;
          while (1)
          {
            CFIndex v58 = (const __CFString *)CFArrayGetValueAtIndex(*((CFArrayRef *)&v127 + 1), v57);
            if (!CFStringGetFileSystemRepresentation(v58, (char *)buf, 1024LL))
            {
              __int128 v104 = (os_log_s *)SZGetLoggingHandle();
              if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                goto LABEL_143;
              }
              *(_WORD *)uint64_t v152 = 0;
              __int128 v97 = "Failed to convert path to C string";
              __int128 v98 = v152;
              __int128 v99 = v104;
              uint32_t v100 = 2;
              goto LABEL_168;
            }

            compression_status v142 = 0LL;
            v22[v57++] = v142;
            if (v55 == v57)
            {
              v22[v55] = 0LL;
              char v59 = (char **)v22;
              goto LABEL_113;
            }
          }

          int v105 = *__error();
          __int128 v106 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
            goto LABEL_143;
          }
          stat v107 = strerror(v105);
          *(_DWORD *)uint64_t v152 = 136315650;
          uint64_t v153 = __s;
          __int16 v154 = 2080;
          v155 = buf;
          __int16 v156 = 2080;
          int v157 = v107;
          __int128 v97 = "Failed to create path from %s/%s : %s";
          __int128 v98 = v152;
          __int128 v99 = v106;
          uint32_t v100 = 32;
          goto LABEL_168;
        }

        uint64_t v60 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v152 = 0;
          size_t v61 = "Malloc failed for path buffer array";
          goto LABEL_173;
        }
      }

LABEL_142:
      int v22 = 0LL;
LABEL_143:
      int v23 = 0LL;
      goto LABEL_13;
    }

    int v22 = 0LL;
    char v59 = v159;
LABEL_113:
    unint64_t v69 = fts_open(v59, 84, 0LL);
    if (!v69)
    {
      __int128 v94 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        goto LABEL_143;
      }
      __int128 v95 = __error();
      __int128 v96 = strerror(*v95);
      buf[0].st_dev = 136315394;
      *(void *)&buf[0].mode_t st_mode = __s;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v96;
      __int128 v97 = "fts_open failed for path %s: %s";
      __int128 v98 = (uint8_t *)buf;
      __int128 v99 = v94;
      uint32_t v100 = 22;
LABEL_168:
      _os_log_error_impl(&dword_1870CA000, v99, OS_LOG_TYPE_ERROR, v97, v98, v100);
      goto LABEL_143;
    }

    unint64_t v25 = v69;
    while (1)
    {
      unint64_t v70 = fts_read(v25);
      if (!v70)
      {
        if (!*__error()) {
          goto LABEL_102;
        }
        __int128 v101 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          __int128 v102 = __error();
          __int128 v103 = strerror(*v102);
          buf[0].st_dev = 136315138;
          *(void *)&buf[0].mode_t st_mode = v103;
          CFIndex v85 = "fts_read returned NULL and set errno: %s";
          goto LABEL_179;
        }

        goto LABEL_182;
      }

      int v71 = v70;
      unsigned int fts_info = v70->fts_info;
      if (fts_info > 0xD) {
        break;
      }
      if (((1 << fts_info) & 0x3102) != 0)
      {
        if (v70->fts_level) {
          BOOL v73 = 0;
        }
        else {
          BOOL v73 = *((void *)&v127 + 1) == 0LL;
        }
        if (!v73 || v128 != 0)
        {
          int v23 = _CopyArchivePath((uint64_t)v70->fts_path, v11, v70->fts_statp->st_mode);
          if ((_IsExcludedFileName(v23) & 1) == 0 && (_IsOrderedEarly(v23, Mutable) & 1) == 0)
          {
            memset(buf, 0, 144);
            if (v71->fts_info != 12 || !BYTE1(v128)) {
              goto LABEL_131;
            }
            if (stat(v71->fts_path, buf))
            {
              uint64_t v115 = (os_log_s *)SZGetLoggingHandle();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
              {
                fts_path = v71->fts_path;
                uint64_t v117 = __error();
                CFRange v118 = strerror(*v117);
                *(_DWORD *)uint64_t v152 = 136315394;
                uint64_t v153 = fts_path;
                __int16 v154 = 2080;
                v155 = (stat *)v118;
                _os_log_error_impl( &dword_1870CA000,  v115,  OS_LOG_TYPE_ERROR,  "stat failed for path %s: %s",  v152,  0x16u);
              }

              goto LABEL_14;
            }

            int v75 = buf[0].st_mode;
            p_off_t st_size = &buf[0].st_size;
            p_st_atimespec = (void **)&buf[0].st_atimespec;
            p_st_mtimespec = (void **)&buf[0].st_mtimespec;
            p___int16 st_uid = &buf[0].st_uid;
            p___int16 st_gid = &buf[0].st_gid;
            if ((buf[0].st_mode & 0xF000) != 0x8000)
            {
LABEL_131:
              fts_statp = v71->fts_statp;
              p___int16 st_gid = &fts_statp->st_gid;
              p___int16 st_uid = &fts_statp->st_uid;
              p_st_mtimespec = (void **)&fts_statp->st_mtimespec;
              p_st_atimespec = (void **)&fts_statp->st_atimespec;
              p_off_t st_size = &fts_statp->st_size;
              int v75 = fts_statp->st_mode;
            }

            if ((_WriteLocalFile( v71->fts_path,  v23,  *p_st_size,  v75,  *p_st_atimespec,  *p_st_mtimespec,  *p_st_uid,  *p_st_gid,  (uint64_t)&v129,  (uint64_t)v125,  v123,  v122,  v24) & 1) == 0) {
              goto LABEL_14;
            }
          }

          free(v23);
        }
      }

      else if (fts_info != 6)
      {
        if (((1 << fts_info) & 0x490) != 0)
        {
          __int16 v82 = (os_log_s *)SZGetLoggingHandle();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            goto LABEL_182;
          }
          uint64_t v83 = v71->fts_path;
          unint64_t v84 = strerror(v71->fts_errno);
          buf[0].st_dev = 136315394;
          *(void *)&buf[0].mode_t st_mode = v83;
          WORD2(buf[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v84;
          CFIndex v85 = "fts_read gave error for file %s: %s";
          CFIndex v86 = v82;
          uint32_t v87 = 22;
          goto LABEL_180;
        }

        break;
      }
    }

    __int16 v114 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
      goto LABEL_182;
    }
    int v119 = v71->fts_info;
    buf[0].st_dev = 67109120;
    *(_DWORD *)&buf[0].mode_t st_mode = v119;
    CFIndex v85 = "fts_read returned unhandled fts_info value %d";
    CFIndex v86 = v114;
    uint32_t v87 = 8;
    goto LABEL_180;
  }

  size_t v62 = strrchr(__s, 47);
  if (v62) {
    __int16 v63 = v62;
  }
  else {
    __int16 v63 = __s;
  }
  int v64 = _WriteLocalFile( __s,  v63,  v144.st_size,  v54,  (void *)v144.st_atimespec.tv_sec,  (void *)v144.st_mtimespec.tv_sec,  v144.st_uid,  v144.st_gid,  (uint64_t)&v129,  (uint64_t)v125,  v44,  v45,  v24);
  int v22 = 0LL;
  if (!v64)
  {
    int v26 = 0;
    int v23 = 0LL;
    unint64_t v25 = 0LL;
    goto LABEL_15;
  }

  unint64_t v25 = 0LL;
LABEL_102:
  if ((ZipStreamWriteCentralDirectoryAndEndRecords(v24, v120, (uint64_t)v146, (uint64_t)&v129, (uint64_t)v125) & 1) == 0)
  {
    __int128 v91 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      CFIndex v85 = "Failed to write end of archive.";
      CFIndex v86 = v91;
      uint32_t v87 = 2;
LABEL_180:
      _os_log_error_impl(&dword_1870CA000, v86, OS_LOG_TYPE_ERROR, v85, (uint8_t *)buf, v87);
      goto LABEL_182;
    }

    goto LABEL_182;
  }

  uint64_t v65 = *((void *)&v125[0] + 1);
  uint64_t v66 = *(unsigned int (**)(void))(*((void *)&v125[0] + 1) + 88LL);
  if (v66)
  {
    if (v66(*(void *)(*((void *)&v125[0] + 1) + 80LL)) == -1)
    {
      int v110 = *__error();
      __int128 v101 = (os_log_s *)SZGetLoggingHandle();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        goto LABEL_182;
      }
      int v111 = strerror(v110);
      buf[0].st_dev = 136315138;
      *(void *)&buf[0].mode_t st_mode = v111;
      CFIndex v85 = "Failed to flush output: %s";
      goto LABEL_179;
    }

    uint64_t v65 = *((void *)&v125[0] + 1);
  }

  uint64_t v67 = (*(uint64_t (**)(void))(v65 + 72))(*(void *)(v65 + 80));
  if (v67 < 0)
  {
    int v108 = *__error();
    __int128 v101 = (os_log_s *)SZGetLoggingHandle();
    if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      goto LABEL_182;
    }
    int v109 = strerror(v108);
    buf[0].st_dev = 136315138;
    *(void *)&buf[0].mode_t st_mode = v109;
    CFIndex v85 = "Failed to get offset in file at end of writing: %s";
LABEL_179:
    CFIndex v86 = v101;
    uint32_t v87 = 12;
    goto LABEL_180;
  }

  uint64_t v68 = v67;
  if (!HIBYTE(v126)
    && (*(unsigned int (**)(void, uint64_t))(*((void *)&v125[0] + 1) + 96LL))( *(void *)(*((void *)&v125[0] + 1) + 80LL),  v67))
  {
    int v112 = *__error();
    __int128 v101 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      size_t v113 = strerror(v112);
      buf[0].st_dev = 136315138;
      *(void *)&buf[0].mode_t st_mode = v113;
      CFIndex v85 = "Failed to truncate output: %s";
      goto LABEL_179;
    }

LABEL_182:
    int v23 = 0LL;
    goto LABEL_14;
  }

  int v23 = 0LL;
  *((void *)&v130 + 1) = v68;
  int v26 = 1;
LABEL_15:
  uint64_t v27 = v145;
  if (v145) {
LABEL_16:
  }
    free(v27);
LABEL_17:
  DestroyMutableCDRecord((void **)value);
  DestroyMutableLocalFileRecord(v147);
  DestroyMutableLocalFileRecord(v146);
  if (v24)
  {
    CFIndex v28 = CFArrayGetCount(v24);
    if (v28)
    {
      CFIndex v29 = v28;
      for (CFIndex i = 0LL; i != v29; ++i)
      {
        int v31 = (void **)CFArrayGetValueAtIndex(v24, i);
        DestroyMutableCDRecord(v31);
      }
    }

    CFRelease(v24);
  }

  free(v23);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v25) {
    fts_close(v25);
  }
  if (v22)
  {
    int v32 = *v22;
    if (*v22)
    {
      uint64_t v33 = v22 + 1;
      do
      {
        free(v32);
        *(v33 - 1) = 0LL;
        __int16 v34 = *v33++;
        int v32 = v34;
      }

      while (v34);
    }

    free(v22);
  }

  if (!v26) {
    return 0LL;
  }
  if (a4) {
    *a4 = _ConvertStatsToDict((uint64_t)&v129);
  }
  return 1LL;
}

uint64_t SZArchiverExtractFile()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  __int128 v4 = v3;
  size_t v6 = v5;
  CFNumberRef v7 = (const char *)v0;
  uint64_t v88 = *MEMORY[0x1895F89C0];
  memset(v72, 0, 208);
  memset(v68, 0, sizeof(v68));
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  uint64_t v71 = 0LL;
  uint64_t result = _UpgradeCallbacksToCurrent(v8, (uint64_t)v67);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(v4, (uint64_t)v68);
  if (!(_DWORD)result) {
    return result;
  }
  *((void *)&v68[0] + 1) = v67;
  size_t v10 = (FILE **)OpenZipFile(v7, SBYTE14(v69));
  if (!v10)
  {
    uint64_t v20 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      size_t v85 = (size_t)v7;
      _os_log_error_impl(&dword_1870CA000, v20, OS_LOG_TYPE_ERROR, "Failed to open zip file %s", buf, 0xCu);
    }

LABEL_15:
    uint64_t v11 = 0LL;
LABEL_16:
    CloseZipFile((uint64_t)v11);
    return 0LL;
  }

  uint64_t v11 = v10;
  uint64_t v78 = 0LL;
  size_t v79 = 0LL;
  uint64_t v76 = -1LL;
  size_t v77 = 0LL;
  uint64_t v74 = -1LL;
  uint64_t v75 = -1LL;
  int v73 = 0;
  if (!_ReadOriginalCentralDirectory( (uint64_t)v10,  (void ****)&v77,  &v79,  &v78,  (size_t *)&v76,  (size_t *)&v75,  (_WORD *)&v73 + 1,  &v73)) {
    goto LABEL_50;
  }
  if (v6 != -1LL)
  {
    size_t v12 = v79;
    if (v79 <= v6)
    {
      __int16 v34 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 134218240;
        size_t v85 = v6;
        __int16 v86 = 2048;
        size_t v87 = v12 - 1;
        _os_log_error_impl( &dword_1870CA000,  v34,  OS_LOG_TYPE_ERROR,  "Central directory index %llu is out of range, must be between 0 and %llu",  buf,  0x16u);
      }

      char v19 = 0;
    }

    else
    {
      uint64_t v13 = *((void *)v77 + v6);
      uint64_t v14 = *((void *)&v68[0] + 1);
      int v81 = 2;
      printf("Extracting %s\n", *(const char **)(v13 + 72));
      BOOL v15 = CopyLocalFileHeader(v11, v13, &v81);
      int v16 = v15;
      if (v15)
      {
        uint32_t v17 = (uint64_t *)OpenLocalFile((uint64_t)v11, v13, *((char **)v15 + 7), v15[32], 0, &v81);
        if (v81)
        {
          int v18 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)int buf = 0;
            _os_log_error_impl(&dword_1870CA000, v18, OS_LOG_TYPE_ERROR, "Failed to open local file", buf, 2u);
          }

          char v19 = 0;
        }

        else
        {
          uint64_t v66 = v16;
          size_t v50 = v16[6];
          if (v50)
          {
            size_t v51 = 0LL;
            while (1)
            {
              size_t v80 = 0LL;
              uint32_t v52 = v17;
              int v53 = ReadLocalFileData(v17, buf, 0x1000uLL, &v80);
              if ((v53 & 5) != 0) {
                break;
              }
              size_t v54 = v80;
              if (v80)
              {
                if (v54 != (*(uint64_t (**)(void, uint8_t *, size_t))(v14 + 48))( *(void *)(v14 + 80),  buf,  v80))
                {
                  int v60 = *__error();
                  size_t v61 = (os_log_s *)SZGetLoggingHandle();
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_84;
                  }
                  int v64 = strerror(v60);
                  *(_DWORD *)__int16 v82 = 136315138;
                  uint64_t v83 = v64;
                  CFIndex v57 = "fwrite failed to write out entire buffer: %s";
                  CFIndex v58 = v61;
                  uint32_t v59 = 12;
                  goto LABEL_94;
                }

                v51 += v54;
              }

              uint32_t v17 = v52;
              if (v51 >= v50)
              {
                if (v53 != 2) {
                  goto LABEL_78;
                }
                if (v51 == v50)
                {
                  char v19 = 1;
                }

                else
                {
                  __int16 v63 = (os_log_s *)SZGetLoggingHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 134218240;
                    size_t v85 = v51;
                    __int16 v86 = 2048;
                    size_t v87 = v50;
                    _os_log_error_impl( &dword_1870CA000,  v63,  OS_LOG_TYPE_ERROR,  "Failed to read entire file size; expected %llu, got %llu",
                      buf,
                      0x16u);
                  }

                  char v19 = 0;
                }

                goto LABEL_86;
              }
            }

            int v56 = (os_log_s *)SZGetLoggingHandle();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
LABEL_84:
              char v19 = 0;
              goto LABEL_85;
            }

            *(_DWORD *)__int16 v82 = 67109120;
            LODWORD(v83) = v53;
            CFIndex v57 = "ReadLocalFileData returned %d";
            CFIndex v58 = v56;
            uint32_t v59 = 8;
LABEL_94:
            _os_log_error_impl(&dword_1870CA000, v58, OS_LOG_TYPE_ERROR, v57, v82, v59);
            goto LABEL_84;
          }

          int v53 = 0;
LABEL_78:
          uint32_t v52 = v17;
          CFIndex v55 = (os_log_s *)SZGetLoggingHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            LODWORD(v85) = v53;
            _os_log_error_impl(&dword_1870CA000, v55, OS_LOG_TYPE_ERROR, "Failed to read file data: %d", buf, 8u);
          }

          char v19 = 0;
LABEL_85:
          uint32_t v17 = v52;
LABEL_86:
          int v16 = v66;
        }

        if (v17) {
          CloseLocalFile((compression_stream *)v17);
        }
      }

      else
      {
        CFStringRef v49 = (os_log_s *)SZGetLoggingHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          LODWORD(v85) = v81;
          _os_log_error_impl(&dword_1870CA000, v49, OS_LOG_TYPE_ERROR, "Failed to get local file record: %d", buf, 8u);
        }

        char v19 = 0;
      }

      free(v16);
    }

    goto LABEL_51;
  }

  Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  unint64_t v22 = v79;
  if (!v79)
  {
    uint64_t v25 = -1LL;
    goto LABEL_41;
  }

  uint64_t v23 = 0LL;
  size_t v24 = v77;
  int v65 = HIWORD(v73);
  uint64_t v25 = -1LL;
  int v26 = (unsigned __int16)v73;
  do
  {
    uint64_t v27 = v24[v23];
    if (!v27) {
      goto LABEL_32;
    }
    if (v25 == -1)
    {
      buf[0] = 0;
      unsigned __int8 ShouldOrderFileEarly = ZipStreamShouldOrderFileEarly(*(const char **)(v27 + 72), buf);
      if ((ShouldOrderFileEarly & (buf[0] != 0)) != 0) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = -1LL;
      }
      uint64_t v27 = v24[v23];
    }

    CFStringRef v29 = CFStringCreateWithFileSystemRepresentation(0LL, *(const char **)(v27 + 72));
    CFArrayAppendValue(Mutable, v29);
    CFRelease(v29);
    uint64_t v30 = v24[v23];
    int v31 = *(unsigned __int16 *)(v30 + 24);
    if (*(_BYTE *)(v30 + 26))
    {
      if (v31 != v26) {
        goto LABEL_30;
      }
    }

    else if (v31 != v65)
    {
LABEL_30:
      int v32 = 1;
      goto LABEL_31;
    }

    int v32 = 0;
LABEL_31:
    ZipStreamAddStatisticsForCDRecord(v30, v32, v72);
LABEL_32:
    ++v23;
  }

  while (v22 != v23);
  if (v25 == -1)
  {
LABEL_41:
    uint64_t v33 = -1LL;
    goto LABEL_42;
  }

  else {
    uint64_t v33 = -1LL;
  }
LABEL_42:
  uint32_t v35 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  int v36 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionarySetValue(v36, @"paths", Mutable);
  _AddIndexToDictionary(@"META-INF", v76, v36);
  _AddIndexToDictionary(@"mimetype", v75, v36);
  _AddIndexToDictionary(@"Info.plist", v25, v36);
  _AddIndexToDictionary(@"Executable", v33, v36);
  Data = CFPropertyListCreateData(v35, v36, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  if (Data)
  {
    size_t v38 = Data;
    CFIndex Length = CFDataGetLength(Data);
    *__error() = 0;
    uint64_t v40 = *((void *)&v68[0] + 1);
    BytePtr = CFDataGetBytePtr(v38);
    if (Length != (*(uint64_t (**)(void, const UInt8 *, CFIndex))(v40 + 48))( *(void *)(v40 + 80),  BytePtr,  Length))
    {
      int v42 = *__error();
      size_t v43 = (os_log_s *)SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        size_t v62 = strerror(v42);
        *(_DWORD *)int buf = 136315138;
        size_t v85 = (size_t)v62;
        _os_log_error_impl( &dword_1870CA000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to write entire output dictionary: %s",  buf,  0xCu);
      }
    }

    CFRelease(v38);
  }

  else
  {
    unsigned int v44 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_1870CA000, v44, OS_LOG_TYPE_ERROR, "Failed to create output dictionary", buf, 2u);
    }
  }

  CFRelease(v36);
LABEL_50:
  char v19 = 1;
LABEL_51:
  unsigned int v45 = v77;
  if (v77)
  {
    size_t v46 = v79;
    if (v79)
    {
      CFIndex v47 = (void **)v77;
      do
      {
        if (*v47) {
          free(*v47);
        }
        ++v47;
        --v46;
      }

      while (v46);
    }

    free(v45);
  }

  if ((v19 & 1) == 0)
  {
    uint32_t v48 = (os_log_s *)SZGetLoggingHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      size_t v85 = (size_t)v7;
      _os_log_error_impl(&dword_1870CA000, v48, OS_LOG_TYPE_ERROR, "Failed to process file %s", buf, 0xCu);
    }

    goto LABEL_16;
  }

  CloseZipFile((uint64_t)v11);
  if (v2) {
    *uint64_t v2 = _ConvertStatsToDict((uint64_t)v72);
  }
  return 1LL;
}

    unint64_t v22 = [v5 privileged];
    uint64_t v20 = v22 ^ -[SZExtractor privileged](self, "privileged") ^ 1;
    goto LABEL_16;
  }

  LOBYTE(v20) = 0;
LABEL_17:

  return v20;
}

LABEL_7:
  uint64_t v14 = (NSString *)[v6 copy];
  extractionPath = self->_extractionPath;
  self->_extractionPath = v14;

  int v16 = (NSDictionary *)[v7 copy];
  options = self->_options;
  self->_options = v16;

  SZGetLoggingHandle();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412802;
    int v32 = self;
    uint64_t v33 = 2112;
    __int16 v34 = v6;
    uint32_t v35 = 2112;
    int v36 = v7;
    _os_log_impl(&dword_1870CA000, v18, OS_LOG_TYPE_DEFAULT, "%@: initialized with path: %@ options: %@", buf, 0x20u);
  }
}

void sub_1870D719C(_Unwind_Exception *a1)
{
}

void sub_1870D8010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

LABEL_17:
    goto LABEL_18;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = 138412546;
    uint64_t v14 = self;
    BOOL v15 = 2048;
    int v16 = v4;
    _os_log_impl( &dword_1870CA000,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Setting extractor delegate to 0x%p",  (uint8_t *)&v13,  0x16u);
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  __int128 v9 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    LODWORD(v10) = v9 & 1 | 2;
  }
  else {
    LODWORD(v10) = v9 & 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    size_t v10 = v10 | 4;
  }
  else {
    size_t v10 = v10;
  }
  uint64_t v11 = -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  size_t v12 = (void *)v11;
  if (v11) {
    objc_storeWeak((id *)(v11 + 8), v4);
  }

  -[SZExtractor setActiveExtractorDelegateMethods:](self, "setActiveExtractorDelegateMethods:", v10);
LABEL_18:
}

    a3 = v35;
  }

  else
  {
    CFStringRef v29 = *__error();
    SZGetLoggingHandle();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315394;
      size_t v43 = [v7 fileSystemRepresentation];
      unsigned int v44 = 2080;
      unsigned int v45 = strerror(v29);
      _os_log_error_impl( &dword_1870CA000,  v30,  OS_LOG_TYPE_ERROR,  "Call to realpath failed for suspicious path %s: %s",  buf,  0x16u);
    }

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v29 userInfo:0];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFStringRef v49 = *MEMORY[0x1896074F8];
    size_t v50 = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    size_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = [v7 fileSystemRepresentation];
    strerror(v29);
    _CreateError( (uint64_t)"_CheckRealpathHasBasePrefix",  430LL,  @"SZExtractorErrorDomain",  5LL,  v9,  v10,  @"Call to realpath failed for suspicious path %s: %s",  v32,  v31);
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = 0LL;
  }

  if (a3 && (v23 & 1) == 0) {
    *a3 = v22;
  }

  return v23;
}

id _CreateError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  uint64_t v20 = (void *)v19;
  if (v18)
  {
    uint64_t v21 = (void *)[objc_alloc(NSString) initWithFormat:v18 arguments:&a9];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1896075E0]];
  }

  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x189607798]];
  }
  [NSString stringWithUTF8String:a1];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v22 forKeyedSubscript:@"SZExtractorFunctionNameErrorKey"];

  [MEMORY[0x189607968] numberWithInt:a2];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v23 forKeyedSubscript:@"SZExtractorSourceFileLineErrorKey"];

  [MEMORY[0x189607870] errorWithDomain:v15 code:a4 userInfo:v20];
  size_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
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

LABEL_60:
  SZGetTraceHandle();
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Ending fragmentation of the supplied buffer",  buf,  2u);
  }

LABEL_62:
  CFPropertyListRef v39 = *(dispatch_group_s **)(a1 + 40);
  [*(id *)(a1 + 48) serialQueue];
  uint64_t v40 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_168;
  block[3] = &unk_189FE1A98;
  size_t v43 = *(id *)(a1 + 64);
  unsigned int v44 = *(_OWORD *)(a1 + 72);
  dispatch_group_notify(v39, v40, block);
}

  size_t v43 = v43;
  CFIndex v58 = 0;
  CFIndex v57 = v43;
LABEL_63:

  size_t v10 = v57;
  if ((v58 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  v4[2](v4, v10);
}

      GenericHashInit((uint64_t)__errnum, v69);
      *((void *)v9 + 5) = 0LL;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = 0u;
      __int128 v70 = v7;
      if (stat((const char *)[v70 fileSystemRepresentation], &v257))
      {
        uint64_t v71 = (uint64_t)v70;
        __int16 v72 = *__error();
        SZGetLoggingHandle();
        int v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          CFIndex v121 = strerror(v72);
          *(_DWORD *)int buf = 138412546;
          *(void *)v267 = v70;
          *(_WORD *)&v267[8] = 2080;
          *(void *)v268 = v121;
          _os_log_error_impl(&dword_1870CA000, v73, OS_LOG_TYPE_ERROR, "Failed to stat path %@: %s", buf, 0x16u);
        }

        uint64_t v74 = (void *)*MEMORY[0x189607688];
        v275 = *MEMORY[0x1896074F8];
        v276[0] = v71;
        [*(id *)(v16 + 3944) dictionaryWithObjects:v276 forKeys:&v275 count:1];
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v72);
        _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  938LL,  v74,  v72,  0LL,  v75,  @"Failed to stat path %@: %s",  v76,  v71);
LABEL_66:
        size_t v43 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
LABEL_68:
        uint32_t v59 = 0LL;
LABEL_69:
        CFIndex v58 = v229;
        goto LABEL_70;
      }

      size_t v77 = v257.st_mode & 0xF000;
      if (v77 != 0x4000 && v77 != 0x8000)
      {
        SZGetLoggingHandle();
        __int128 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 138412546;
          *(void *)v267 = v70;
          *(_WORD *)&v267[8] = 1024;
          *(_DWORD *)v268 = v257.st_mode;
          _os_log_error_impl( &dword_1870CA000,  v94,  OS_LOG_TYPE_ERROR,  "Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)",  buf,  0x12u);
        }

        v273 = *MEMORY[0x1896074F8];
        v274 = v70;
        [*(id *)(v16 + 3944) dictionaryWithObjects:&v274 forKeys:&v273 count:1];
        __int128 v95 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  944LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  v95,  @"Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)",  v96,  (uint64_t)v70);
        size_t v43 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_67;
      }

      v256 = -1;
      v255 = -1;
      if ([v9 resolveOwnershipWithExtraField:0 outUID:&v256 outGID:&v255])
      {
        uint64_t v78 = v70;
        size_t v79 = (const char *)[v78 fileSystemRepresentation];
        if (lchown(v79, v256, v255))
        {
          v226 = v70;
          size_t v80 = *__error();
          SZGetLoggingHandle();
          int v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v82 = [v78 fileSystemRepresentation];
            v220 = v256;
            v223 = v255;
            uint64_t v83 = strerror(v80);
            *(_DWORD *)int buf = 136316162;
            *(void *)v267 = v82;
            *(_WORD *)&v267[8] = 1024;
            *(_DWORD *)v268 = v220;
            *(_WORD *)&v268[4] = 1024;
            *(_DWORD *)&v268[6] = v223;
            LOWORD(v269) = 1024;
            *(_DWORD *)((char *)&v269 + 2) = v80;
            HIWORD(v269) = 2080;
            v270[0] = v83;
            _os_log_impl( &dword_1870CA000,  v81,  OS_LOG_TYPE_DEFAULT,  "Failed to lchown %s to (%d:%d) : %d (%s)",  buf,  0x28u);
          }

          __int128 v70 = v226;
        }
      }

      if ((v257.st_mode & 0xF000) == 0x4000)
      {
        __n = 0LL;
        uint64_t v227 = v70;
        unint64_t v84 = [v70 stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
        v245 = 0LL;
        size_t v85 = [MEMORY[0x189603F48] dataWithContentsOfFile:v84 options:2 error:&v245];
        __int16 v86 = v245;
        int v221 = v86;
        int v224 = (id)v85;
        unint64_t v219 = (void *)v84;
        if (v85)
        {
          [MEMORY[0x1896078A8] defaultManager];
          size_t v87 = (void *)objc_claimAutoreleasedReturnValue();
          v242 = 0LL;
          uint64_t v88 = [v87 removeItemAtPath:v84 error:&v242];
          v218 = v242;

          if ((v88 & 1) == 0)
          {
            SZGetLoggingHandle();
            uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138412546;
              *(void *)v267 = v219;
              *(_WORD *)&v267[8] = 2112;
              *(void *)v268 = v218;
              _os_log_error_impl(&dword_1870CA000, v89, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
            }
          }

          v241 = v233;
          uint32_t v59 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v224 error:&v241];
          size_t v43 = v241;

          [v59 setDecodingFailurePolicy:0];
          if (!v59)
          {
            SZGetLoggingHandle();
            unsigned __int16 v122 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)v267 = v43;
              _os_log_error_impl( &dword_1870CA000,  v122,  OS_LOG_TYPE_ERROR,  "Failed to deserialize resumption data (%@); resuming from offset 0",
                buf,
                0xCu);
            }

            v239 = v43;
            _RemoveAndRecreateDirectoryAtPath(v227, &v239);
            unsigned __int16 v123 = v239;
            uint32_t v59 = 0LL;
            goto LABEL_193;
          }

          uint32_t v90 = [v59 decodeIntForKey:@"SerializationVersion"];
          if (v90 == 8)
          {
            [v59 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOffset"];
            __int128 v91 = (void *)objc_claimAutoreleasedReturnValue();
            v234 = [v91 unsignedLongLongValue];

            if (![*((id *)v9 + 12) count]) {
              goto LABEL_160;
            }
            __int128 v92 = *((void *)v9 + 7);
            if (v92) {
              uint64_t v93 = v234 / v92;
            }
            else {
              uint64_t v93 = 0LL;
            }
            if (v93 < [*((id *)v9 + 12) count])
            {
              __int128 v139 = v59;
              __int128 v140 = (const void *)[v139 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (v140 && __n)
              {
                if (__n != gHashContextSizes[*__errnum])
                {
                  SZGetLoggingHandle();
                  v186 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
                  {
                    unint64_t v211 = *__errnum;
                    int v212 = gHashStringNames[v211];
                    v213 = (const char *)gHashContextSizes[v211];
                    *(_DWORD *)int buf = 136315650;
                    *(void *)v267 = v212;
                    *(_WORD *)&v267[8] = 2048;
                    *(void *)v268 = __n;
                    *(_WORD *)&v268[8] = 2048;
                    v269 = v213;
                    _os_log_error_impl( &dword_1870CA000,  v186,  OS_LOG_TYPE_ERROR,  "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                      buf,
                      0x20u);
                  }

                  v237 = v43;
                  _RemoveAndRecreateDirectoryAtPath(v227, &v237);
                  __int128 v130 = v43;
                  size_t v43 = v237;
                  uint32_t v59 = v139;
                  goto LABEL_194;
                }

                memcpy(v9 + 136, v140, __n);
                __int128 v141 = *((void *)v9 + 7);
                compression_status v142 = v234;
                if (v141) {
                  compression_status v142 = v234 % v141;
                }
                *((void *)v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = v142;
              }

void sub_1870DA690( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

void sub_1870DBCDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  bzero(__s, 0x400uLL);
  id v7 = v5;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], __s) || *__error() == 2)
  {
    uint32_t v35 = a3;
    [MEMORY[0x1896078A8] defaultManager];
    CFDictionaryRef v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFileSystemRepresentation:__s length:strlen(__s)];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 pathComponents];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    [v6 pathComponents];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v37;
      __int16 v34 = v9;
      while (2)
      {
        id v16 = v7;
        id v17 = v6;
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (v14 + i < (unint64_t)[v10 count])
          {
            [v10 objectAtIndexedSubscript:v14 + i];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            char v21 = [v19 isEqualToString:v20];

            if ((v21 & 1) != 0) {
              continue;
            }
          }

          SZGetLoggingHandle();
          size_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          id v6 = v17;
          id v7 = v16;
          __int128 v9 = v34;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = [v7 fileSystemRepresentation];
            *(_DWORD *)int buf = 136315650;
            uint64_t v43 = v33;
            __int16 v44 = 2112;
            unsigned int v45 = (char *)v34;
            __int16 v46 = 2112;
            id v47 = v6;
            _os_log_error_impl( &dword_1870CA000,  v24,  OS_LOG_TYPE_ERROR,  "Rejecting %s because its resolved path %@ points outside or to the unzip dir %@",  buf,  0x20u);
          }

          uint64_t v40 = *MEMORY[0x1896074F8];
          id v41 = v7;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v7 fileSystemRepresentation];
          _CreateError( (uint64_t)"_CheckRealpathHasBasePrefix",  442LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v25,  @"Rejecting %s because its resolved path %@ points outside or to the unzip dir %@",  v27,  v26);
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v23 = 0LL;
          goto LABEL_17;
        }

        v14 += i;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
        unint64_t v22 = 0LL;
        uint64_t v23 = 1LL;
        id v6 = v17;
        id v7 = v16;
        __int128 v9 = v34;
        if (v13) {
          continue;
        }
        break;
      }
    }

    else
    {
      unint64_t v22 = 0LL;
      uint64_t v23 = 1LL;
    }

uint64_t __Block_byref_object_copy__427(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__428(uint64_t a1)
{
}

LABEL_525:
                SZGetLoggingHandle();
                v420 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v420, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl( &dword_1870CA000,  v420,  OS_LOG_TYPE_DEBUG,  "Finished central directory signature; updating hash with remainder of stream data",
                    (uint8_t *)&v551,
                    2u);
                }

                v421 = v509;
                if ([*v12 hashedChunkSize])
                {
                  v422 = [*v12 hashedChunkSize];
                  v423 = [*v12 bytesHashedInChunk];
                  if (v422 - v423 >= v421) {
                    v424 = v421;
                  }
                  else {
                    v424 = v422 - v423;
                  }
                }

                else
                {
                  v424 = v421;
                }

                v425 = *v12;
                v426 = [*v12 currentOffset];
                [v425 updateHashFromOffset:v426 withBytes:v510 length:v424 onlyFinishCurrentChunk:1];
                uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*v12, "setCurrentOffset:", objc_msgSend(*v12, "currentOffset") + v424);
                if (v10) {
                  goto LABEL_454;
                }
                if ([*v12 bytesHashedInChunk])
                {
                  if (v424 != v421) {
                    __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  543,  "lengthToRead == length");
                  }
                  SZGetLoggingHandle();
                  v427 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v427, OS_LOG_TYPE_DEBUG))
                  {
                    LOWORD(v551.st_dev) = 0;
                    _os_log_debug_impl( &dword_1870CA000,  v427,  OS_LOG_TYPE_DEBUG,  "After hitting Central Directory, we need more data to finish the chunk",  (uint8_t *)&v551,  2u);
                  }

                  [*v468 setStreamState:6];
                  uint64_t v10 = 0LL;
                  goto LABEL_454;
                }

                SZGetLoggingHandle();
                v437 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v437, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl( &dword_1870CA000,  v437,  OS_LOG_TYPE_DEBUG,  "After hitting Central Directory, we had enough data already to finish the chunk",  (uint8_t *)&v551,  2u);
                }

                [*v468 setStreamState:7];
                uint64_t v10 = 0LL;
                id v16 = 1LL;
                goto LABEL_455;
              }
            }

            else
            {
              SZGetLoggingHandle();
              v412 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v412, OS_LOG_TYPE_DEBUG))
              {
                v439 = [*v12 currentOffset];
                v551.st_dev = v458;
                *(void *)&v551.mode_t st_mode = v439;
                _os_log_debug_impl( &dword_1870CA000,  v412,  OS_LOG_TYPE_DEBUG,  "Finished central directory signature at offset %llu and we are also at a chunk boundary.",  (uint8_t *)&v551,  0xCu);
              }
            }

LABEL_509:
            [*v12 setStreamState:7];
            uint64_t v10 = 0LL;
LABEL_510:
            id v16 = 1LL;
            goto LABEL_511;
          }

          [v21 setStreamState:1];
        }

        else
        {
          [v19 markResumptionPoint];
        }

        uint64_t v10 = 0LL;
LABEL_55:
        CFIndex v57 = 3;
LABEL_359:
        objc_autoreleasePoolPop(v14);
        if (v57 != 3) {
          goto LABEL_377;
        }
        continue;
      case 1:
        if (![*v12 currentLFRecord]) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  567,  "_currentState.currentLFRecord");
        }
        _CopyStreamBytesToRecord([*v12 currentLFRecord], 30, *v12, (const void **)&v510, &v509);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          goto LABEL_463;
        }
        uint64_t v10 = 0LL;
LABEL_16:
        if ([*v12 thisStageBytesComplete] != 30) {
          goto LABEL_21;
        }
        objc_msgSend( *v12,  "setCurrentLFRequiresDataDescriptor:",  (*(unsigned __int16 *)(objc_msgSend(*v12, "currentLFRecord") + 6) >> 3) & 1);
        unint64_t v22 = *(unsigned __int16 *)([*v12 currentLFRecord] + 26);
        uint64_t v23 = *v12;
        if (!v22)
        {
          [v23 unsureData];
          v328 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v329 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v330 = v329;
          if (v328)
          {
            if (os_log_type_enabled(v329, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              v331 = "Got zero-length filename; entering passthrough mode";
              v332 = v330;
              v333 = 2;
              goto LABEL_425;
            }

LABEL_426:
            v334 = v510;
            v335 = v509;
            v336 = v8;
LABEL_439:
            v345 = -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v336, (uint64_t)v334, v335);
LABEL_440:
            id v17 = (id)v345;
LABEL_462:

            goto LABEL_463;
          }

          if (os_log_type_enabled(v329, OS_LOG_TYPE_ERROR))
          {
            v428 = [*v12 currentOffset];
            v551.st_dev = v458;
            *(void *)&v551.mode_t st_mode = v428;
            _os_log_error_impl( &dword_1870CA000,  v330,  OS_LOG_TYPE_ERROR,  "Encountered zero-length filename for local file record at offset %llu",  (uint8_t *)&v551,  0xCu);
          }

          v562 = @"SZExtractorFileOffsetErrorKey";
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          v563 = v374;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v563 forKeys:&v562 count:1];
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          v443 = [*v12 currentOffset];
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  589LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v375,  @"Encountered zero-length filename for local file record at offset %llu",  v376,  v443);
          uint64_t v29 = LABEL_504:;

LABEL_395:
          id v16 = 0LL;
          uint64_t v10 = (id)v29;
          goto LABEL_511;
        }

        size_t v24 = *(unsigned __int16 *)([v23 currentLFRecord] + 8);
        if ((v24 > 0xE || ((1 << v24) & 0x4101) == 0) && (_DWORD)v24 != 99)
        {
          [*v12 unsureData];
          v398 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v399 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v330 = v399;
          if (v398)
          {
            if (os_log_type_enabled(v399, OS_LOG_TYPE_DEFAULT))
            {
              v551.st_dev = 67109120;
              *(_DWORD *)&v551.mode_t st_mode = v24;
              v331 = "Got unexpected compression method: %hu; entering passthrough mode";
              v332 = v330;
              v333 = 8;
LABEL_425:
              _os_log_impl(&dword_1870CA000, v332, OS_LOG_TYPE_DEFAULT, v331, (uint8_t *)&v551, v333);
            }

            goto LABEL_426;
          }

          if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR))
          {
            v438 = [*v12 currentOffset];
            v551.st_dev = 67109376;
            *(_DWORD *)&v551.mode_t st_mode = v24;
            LOWORD(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = v438;
            _os_log_error_impl( &dword_1870CA000,  v330,  OS_LOG_TYPE_ERROR,  "Encountered unsupported compression method %hu in stream at offset %llu",  (uint8_t *)&v551,  0x12u);
          }

          v560 = @"SZExtractorFileOffsetErrorKey";
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          v561 = v374;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v561 forKeys:&v560 count:1];
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          [*v12 currentOffset];
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  601LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v375,  @"Encountered unsupported compression method %hu in stream at offset %llu",  v411,  v24);
          goto LABEL_504;
        }

LABEL_420:
            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v25);
            id v17 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v451;
              *(void *)&v551.mode_t st_mode = v33;
              _os_log_error_impl( &dword_1870CA000,  v322,  OS_LOG_TYPE_ERROR,  "Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                (uint8_t *)&v551,
                0xCu);
            }

            v552 = @"SZExtractorFileOffsetErrorKey";
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            v553 = v404;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v553 forKeys:&v552 count:1];
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  708LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v405,  @"Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
              v406,
              (uint64_t)v33);
            id v17 = (id)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v14 = v463;
LABEL_461:

          goto LABEL_462;
        }

        [*v12 unsureData];
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v78) {
          goto LABEL_108;
        }
        if ((unint64_t)[*v12 recordsProcessed] >= 3) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  714,  "_currentState.recordsProcessed <= 2");
        }
        if ([*v12 recordsProcessed])
        {
          if ([*v12 recordsProcessed] != 1)
          {
            if ([*v12 recordsProcessed] != 2 || strcmp(v33, "META-INF/com.apple.ZipMetadata.plist"))
            {
LABEL_417:
              SZGetLoggingHandle();
              v322 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
              {
                v323 = [*v12 recordsProcessed];
                v551.st_dev = 134218498;
                *(void *)&v551.mode_t st_mode = v323;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v33;
                HIWORD(v551.st_gid) = 2080;
                *(void *)&v551.st_rdev = "META-INF/";
                v324 = "Item %lld (%s) in archive was not 'mimetype' or %s; entering passthrough mode";
                v325 = v322;
                v326 = 32;
                goto LABEL_419;
              }

              goto LABEL_420;
            }

LABEL_105:
            SZGetLoggingHandle();
            __int128 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
            {
              v551.st_dev = v451;
              *(void *)&v551.mode_t st_mode = v33;
              _os_log_debug_impl( &dword_1870CA000,  v94,  OS_LOG_TYPE_DEBUG,  "File %s is metadata file, so keeping in memory",  (uint8_t *)&v551,  0xCu);
            }

            [*v12 setStoreCurrentFileInMemory:1];
            goto LABEL_108;
          }

          if (!strcmp(v33, "META-INF/com.apple.ZipMetadata.plist")) {
            goto LABEL_105;
          }
          size_t v79 = v33;
          size_t v80 = "META-INF/";
        }

        else
        {
          if (!strcmp(v33, "META-INF/")) {
            goto LABEL_108;
          }
          size_t v79 = v33;
          size_t v80 = "mimetype";
        }

        if (strcmp(v79, v80)) {
          goto LABEL_417;
        }
LABEL_108:
        if (!strcmp(v33, "META-INF/com.apple.FixedZipMetadata.bin"))
        {
          SZGetLoggingHandle();
          __int128 v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            v551.st_dev = v451;
            *(void *)&v551.mode_t st_mode = v33;
            _os_log_debug_impl( &dword_1870CA000,  v95,  OS_LOG_TYPE_DEBUG,  "File %s is fixed metadata file, so keeping in memory",  (uint8_t *)&v551,  0xCu);
          }

          [*v12 setStoreCurrentFileInMemory:1];
        }

        __int128 v96 = [v464 stringByAppendingPathComponent:v10];
        __int128 v97 = (const char *)[v96 fileSystemRepresentation];
        [*v12 streamInfoDict];
        __int128 v98 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v99 = *v12;
        if (!v98)
        {
          if (v36 == 47) {
            __int128 v106 = 16877LL;
          }
          else {
            __int128 v106 = 33188LL;
          }
          goto LABEL_137;
        }

        uint32_t v100 = [v99 currentLFRecord];
        if (*(_WORD *)(v100 + 28))
        {
          ExtraFieldWithSignature = GetExtraFieldWithSignature( v100 + *(unsigned __int16 *)(v100 + 26) + 30,  *(unsigned __int16 *)(v100 + 28),  &kStreamingZipLFExtraFieldSignature);
          if (ExtraFieldWithSignature)
          {
            if (ExtraFieldWithSignature[1] >= 2u)
            {
              __int128 v106 = ExtraFieldWithSignature[2];
              __int128 v99 = *v12;
LABEL_137:
              [v99 setCurrentLFMode:v106];
              goto LABEL_155;
            }
          }
        }

        [*v12 streamInfoDict];
        __int128 v102 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v103 = v102;
        if (v36 == 47)
        {
          [v102 objectForKeyedSubscript:@"StandardDirectoryPerms"];
          __int128 v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v104)
          {
            int v105 = 16877LL;
            goto LABEL_154;
          }

LABEL_122:
          int v105 = [v104 unsignedShortValue];
          goto LABEL_154;
        }

        [v102 objectForKeyedSubscript:@"StandardFilePerms"];
        __int128 v104 = (void *)objc_claimAutoreleasedReturnValue();

        if (v104) {
          goto LABEL_122;
        }
        int v105 = 33188LL;
LABEL_154:
        [*v12 setCurrentLFMode:v105];

LABEL_155:
        objc_msgSend(*v12, "setCurrentLFMode:", objc_msgSend(*v12, "currentLFMode") & 0xFFFFF1FFLL);
        if (([*v12 currentLFMode] & 0xF000) == 0xA000)
        {
          SZGetLoggingHandle();
          __int128 v126 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
          {
            v246 = [*v12 currentLFMode];
            v551.st_dev = v453;
            *(void *)&v551.mode_t st_mode = v33;
            WORD2(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 6) = v246;
            _os_log_debug_impl( &dword_1870CA000,  v126,  OS_LOG_TYPE_DEBUG,  "File %s is a symlink (mode = 0%o), so keeping in memory",  (uint8_t *)&v551,  0x12u);
          }

          [*v12 setStoreCurrentFileInMemory:1];
        }

        LFUncompressedSize = GetLFUncompressedSize([*v12 currentLFRecord]);
        if (LFUncompressedSize > 0x500000)
        {
          uint64_t v128 = LFUncompressedSize;
          SZGetLoggingHandle();
          __int128 v129 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
          {
            v551.st_dev = v453;
            *(void *)&v551.mode_t st_mode = v33;
            WORD2(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v128;
            _os_log_debug_impl( &dword_1870CA000,  v129,  OS_LOG_TYPE_DEBUG,  "File %s is larger than 5 MB (%llu) so not keeping in memory",  (uint8_t *)&v551,  0x16u);
          }

          [*v12 setStoreCurrentFileInMemory:0];
        }

        [v96 stringByDeletingLastPathComponent];
        __int128 v130 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v130 isEqualToString:v464]) {
          goto LABEL_176;
        }
        __int128 v131 = v130;
        __int128 v132 = (const char *)[v131 fileSystemRepresentation];
        if (!stat(v132, &v551)) {
          goto LABEL_176;
        }
        if (*__error() != 2)
        {
          uint64_t v153 = *__error();
          SZGetLoggingHandle();
          __int16 v154 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            v259 = strerror(v153);
            v547 = v455;
            v548 = v131;
            v549 = 2080;
            v550 = v259;
            _os_log_error_impl( &dword_1870CA000,  v154,  OS_LOG_TYPE_ERROR,  "Can't determine if parent path exists %@: %s",  (uint8_t *)&v547,  0x16u);
          }

          v543 = v461;
          v544 = v131;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v544 forKeys:&v543 count:1];
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v153);
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  881LL,  v457,  v153,  0LL,  v155,  @"Can't determine if parent path exists %@: %s",  v156,  (uint64_t)v131);
          int v157 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_200;
        }

        v465 = v97;
        SZGetLoggingHandle();
        __int128 v133 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
        {
          v547 = v456;
          v548 = v131;
          _os_log_debug_impl( &dword_1870CA000,  v133,  OS_LOG_TYPE_DEBUG,  "Parent path %@ did not exist",  (uint8_t *)&v547,  0xCu);
        }

        __int128 v134 = mkpath_np(v132, 0x1EDu);
        __int128 v135 = v134;
        CFIndex v57 = 0;
        __int128 v136 = 1;
        if (v134 && v134 != 17)
        {
          SZGetLoggingHandle();
          __int128 v137 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            v274 = strerror(v135);
            v547 = v455;
            v548 = v131;
            v549 = 2080;
            v550 = v274;
            _os_log_error_impl( &dword_1870CA000,  v137,  OS_LOG_TYPE_ERROR,  "Failed to create parent directory %@: %s",  (uint8_t *)&v547,  0x16u);
          }

          v545 = v461;
          v546 = v131;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v546 forKeys:&v545 count:1];
          __int128 v138 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v135);
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  834LL,  v457,  v135,  0LL,  v138,  @"Failed to create parent directory %@: %s",  v139,  (uint64_t)v131);
          __int128 v140 = (void *)objc_claimAutoreleasedReturnValue();

          __int128 v136 = 0;
          CFIndex v57 = 2;
          v467 = v140;
        }

        __int128 v97 = v465;
        if (v135 && v135 != 17 && !v136) {
          goto LABEL_207;
        }
LABEL_176:
        InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF([*v12 currentLFRecord]);
        compression_status v142 = *v12;
        if (v36 == 47)
        {
          if (mkdir(v97, [*v12 currentLFMode]))
          {
            if (*__error() != 17)
            {
              v158 = *__error();
              SZGetLoggingHandle();
              uint64_t v159 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
              {
                v260 = strerror(v158);
                v551.st_dev = v455;
                *(void *)&v551.mode_t st_mode = v96;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v260;
                _os_log_error_impl( &dword_1870CA000,  v159,  OS_LOG_TYPE_ERROR,  "Failed to create directory at path %@: %s",  (uint8_t *)&v551,  0x16u);
              }

              v541 = v461;
              v542 = v96;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v542 forKeys:&v541 count:1];
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v158);
              _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  899LL,  v457,  v158,  0LL,  v160,  @"Failed to create directory at path %@: %s",  v161,  (uint64_t)v96);
              int v157 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_200:
              CFIndex v57 = 2;
              v467 = v157;
              goto LABEL_207;
            }

            if (chmod(v97, [*v12 currentLFMode]))
            {
              SZGetLoggingHandle();
              stat v143 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
              {
                v264 = __error();
                v265 = strerror(*v264);
                v551.st_dev = v455;
                *(void *)&v551.mode_t st_mode = v96;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v265;
                _os_log_error_impl( &dword_1870CA000,  v143,  OS_LOG_TYPE_ERROR,  "Failed to set proper mode on directory %@: %s",  (uint8_t *)&v551,  0x16u);
              }
            }
          }

          v547 = -1;
          v508 = -1;
          if ([*v12 resolveOwnershipWithExtraField:InfoZipExtraFieldFromLF outUID:&v547 outGID:&v508]
            && lchown(v97, v547, v508))
          {
            stat v144 = *__error();
            SZGetLoggingHandle();
            size_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              v146 = v547;
              __int16 v147 = v508;
              uint64_t v148 = strerror(v144);
              v551.st_dev = v450;
              *(void *)&v551.mode_t st_mode = v97;
              WORD2(v551.st_ino) = 1024;
              *(_DWORD *)((char *)&v551.st_ino + 6) = v146;
              uint64_t v12 = v468;
              HIWORD(v551.st_uid) = 1024;
              v551.__int16 st_gid = v147;
              LOWORD(v551.st_rdev) = 1024;
              *(dev_t *)((char *)&v551.st_rdev + 2) = v144;
              *((_WORD *)&v551.st_rdev + 3) = 2080;
              v551.st_atimespec.tv_sec = (__darwin_time_t)v148;
              _os_log_impl( &dword_1870CA000,  v145,  OS_LOG_TYPE_DEFAULT,  "Failed to lchown %s to (%d:%d) : %d (%s)",  (uint8_t *)&v551,  0x28u);
            }
          }

          goto LABEL_204;
        }

        if ([v142 storeCurrentFileInMemory]) {
          goto LABEL_204;
        }
        off_t v149 = [*v12 fileWriter];
        uint64_t v150 = v12;
        __int16 v151 = v466;
        if (v149) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  929,  "!_currentState.fileWriter");
        }
        if ([*v150 currentLFRequiresDataDescriptor]) {
          uint64_t v152 = -1LL;
        }
        else {
          uint64_t v152 = _GetUncompressedSize(*v150);
        }
        uint64_t v162 = [*(id *)(v151 + 64) performCachedWrites];
        v163 = *(void *)(v151 + 96);
        v164 = v467;
        v507 = v467;
        v165 = +[StreamingFileWriter fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:]( &OBJC_CLASS___StreamingFileWriter,  "fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:",  v96,  1537LL,  384LL,  0LL,  v162,  v152,  v163,  v151,  &v507);
        int v166 = v507;

        if (v165)
        {
          v551.st_dev = -1;
          v547 = -1;
          uint64_t v12 = v468;
          int v167 = [*v468 resolveOwnershipWithExtraField:InfoZipExtraFieldFromLF outUID:&v551 outGID:&v547];
          [v165 configureFileAndSetOwnership:v167 toUID:v551.st_dev GID:v547];
          [*v12 setFileWriter:v165];

          v467 = v166;
LABEL_204:
          if (([*v12 currentLFRequiresDataDescriptor] & 1) != 0 || _GetCompressedSize(*v12))
          {
            [*v12 setStreamState:2];
            CFIndex v57 = 0;
          }

          else
          {
            [*v12 setStreamState:4];
            CFIndex v57 = 3;
          }

          goto LABEL_207;
        }

        SZGetLoggingHandle();
        v218 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v219 = os_log_type_enabled(v218, OS_LOG_TYPE_ERROR);
        uint64_t v12 = v468;
        if (v219)
        {
          v551.st_dev = v456;
          *(void *)&v551.mode_t st_mode = v96;
          _os_log_error_impl( &dword_1870CA000,  v218,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  (uint8_t *)&v551,  0xCu);
        }

        v539 = v461;
        v540 = v96;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v540 forKeys:&v539 count:1];
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  940LL,  @"SZExtractorErrorDomain",  1LL,  v166,  v220,  @"Failed to open output file at path %@",  v221,  (uint64_t)v96);
        v467 = (id)objc_claimAutoreleasedReturnValue();

        CFIndex v57 = 2;
LABEL_207:

        if (v57)
        {
          uint64_t v14 = v463;
          uint64_t v10 = v467;
          goto LABEL_359;
        }

        uint64_t v13 = v509;
        CFDictionaryRef v8 = v466;
        uint64_t v10 = v467;
        uint64_t v14 = v463;
LABEL_210:
        int v168 = [*v12 currentLFRequiresDataDescriptor];
        v169 = *(unsigned __int16 *)([*v12 currentLFRecord] + 8);
        v460 = v168;
        if (!v168 || (v170 = v13, !v169))
        {
          int v171 = _GetCompressedSize(*v12);
          v172 = [*v12 thisStageBytesComplete];
          if (v13 >= v171 - v172) {
            v170 = v171 - v172;
          }
          else {
            v170 = v13;
          }
        }

        if (![*v12 thisStageBytesComplete])
        {
          objc_msgSend(*v12, "setCurrentCRC32:", crc32(0, 0, 0));
          if (v170) {
            goto LABEL_219;
          }
LABEL_276:
          if (v460 && *(_WORD *)([*v12 currentLFRecord] + 8))
          {
            if ((v170 & 1) != 0)
            {
              uint64_t v209 = *v12;
LABEL_282:
              CFIndex v57 = 3;
              [v209 setStreamState:3];
              goto LABEL_359;
            }
          }

          else
          {
            int v210 = [*v12 thisStageBytesComplete];
            if (v210 != _GetCompressedSize(*v12))
            {
              if (v13) {
                __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1295,  "0 == length");
              }
              goto LABEL_474;
            }

            uint64_t v209 = *v12;
            if (v460) {
              goto LABEL_282;
            }
            [v209 setStreamState:4];
          }

          goto LABEL_55;
        }

        if (!v170) {
          goto LABEL_276;
        }
LABEL_219:
        v447 = 0;
        v448 = v169;
        v463 = v14;
        while (2)
        {
          if (v170 >= 0x7FFFFFFF) {
            uint64_t v173 = 0x7FFFFFFFLL;
          }
          else {
            uint64_t v173 = v170;
          }
          v459 = v170 - v173;
          if (v169 > 13)
          {
            if (v169 != 14 && v169 != 99)
            {
LABEL_448:
              GetFileNameStringFromLocalFileRecord((_WORD *)[*v12 currentLFRecord]);
              v290 = (void *)objc_claimAutoreleasedReturnValue();
              v527[0] = @"SZExtractorFileOffsetErrorKey";
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
              v359 = (void *)objc_claimAutoreleasedReturnValue();
              v527[1] = v461;
              v528[0] = v359;
              v528[1] = v290;
              [MEMORY[0x189603F68] dictionaryWithObjects:v528 forKeys:v527 count:2];
              v292 = (void *)objc_claimAutoreleasedReturnValue();

              SZGetLoggingHandle();
              v360 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
              {
                v414 = *(unsigned __int16 *)([*v12 currentLFRecord] + 8);
                v551.st_dev = 67109378;
                *(_DWORD *)&v551.mode_t st_mode = v414;
                LOWORD(v551.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = (__darwin_ino64_t)v290;
                _os_log_error_impl( &dword_1870CA000,  v360,  OS_LOG_TYPE_ERROR,  "Unknown compression method %hu for file %@",  (uint8_t *)&v551,  0x12u);
              }

              v361 = [*v12 currentLFRecord];
              v299 = _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1283LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v292,  @"Unknown compression method %hu for file %@",  v362,  *(unsigned __int16 *)(v361 + 8));
              goto LABEL_394;
            }

            goto LABEL_229;
          }

          if (v169)
          {
            if (v169 != 8) {
              goto LABEL_448;
            }
LABEL_229:
            v467 = v10;
            if (!*(void *)(v8 + 56)) {
              *(void *)(v8 + 56) = malloc(0x10000uLL);
            }
            uint64_t v174 = (compression_stream *)[*v12 cmpState];
            if (![*v12 thisStageBytesComplete])
            {
              v175 = compression_stream_reinit();
              if ((_DWORD)v175)
              {
                v354 = v175;
                SZGetLoggingHandle();
                v355 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
                {
                  v551.st_dev = 67109120;
                  *(_DWORD *)&v551.mode_t st_mode = v354;
                  _os_log_error_impl( &dword_1870CA000,  v355,  OS_LOG_TYPE_ERROR,  "Failed to initialize compression: %d",  (uint8_t *)&v551,  8u);
                }

                v537 = @"SZExtractorCompressionLibErrorKey";
                [MEMORY[0x189607968] numberWithInt:v354];
                v356 = (void *)objc_claimAutoreleasedReturnValue();
                v538 = v356;
                [MEMORY[0x189603F68] dictionaryWithObjects:&v538 forKeys:&v537 count:1];
                v357 = (void *)objc_claimAutoreleasedReturnValue();
                _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1044LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v357,  @"Failed to initialize compression: %d",  v358,  v354);
                uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_474;
              }
            }

            LODWORD(v465) = 0;
            src_ptr = v510;
            v174->src_ptr = v510;
            v174->size_t src_size = v173;
            while (1)
            {
              v174->dst_ptr = *(uint8_t **)(v8 + 56);
              v174->size_t dst_size = 0x10000LL;
              unint64_t v177 = compression_stream_process(v174, 0);
              size_t src_size = v174->src_size;
              v179 = v173 - src_size;
              SZGetLoggingHandle();
              BOOL v180 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
              {
                v551.st_dev = v458;
                *(void *)&v551.mode_t st_mode = v173 - src_size;
                _os_log_debug_impl( &dword_1870CA000,  v180,  OS_LOG_TYPE_DEBUG,  "compression_stream_process consumed %zu bytes",  (uint8_t *)&v551,  0xCu);
              }

              objc_msgSend(*v12, "setCurrentOffset:", objc_msgSend(*v12, "currentOffset") + v179);
              objc_msgSend(*v12, "setThisStageBytesComplete:", objc_msgSend(*v12, "thisStageBytesComplete") + v179);
              size_t dst_size = v174->dst_size;
              if (dst_size > 0x10000) {
                __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1083,  "outputSize >= cmpState->dst_size");
              }
              if (!(_DWORD)v177 && v173 && v173 == src_size && dst_size == 0x10000)
              {
                v535[0] = @"SZExtractorFileOffsetErrorKey";
                v277 = v468;
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v468, "currentOffset"));
                v278 = (void *)objc_claimAutoreleasedReturnValue();
                v536[0] = v278;
                v535[1] = v461;
                GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                v536[1] = v279;
                [MEMORY[0x189603F68] dictionaryWithObjects:v536 forKeys:v535 count:2];
                v280 = (void *)objc_claimAutoreleasedReturnValue();

                SZGetLoggingHandle();
                v281 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v281, OS_LOG_TYPE_ERROR))
                {
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                  v327 = (id)objc_claimAutoreleasedReturnValue();
                  v551.st_dev = 138412802;
                  *(void *)&v551.mode_t st_mode = v327;
                  WORD2(v551.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v173;
                  HIWORD(v551.st_gid) = 2048;
                  *(void *)&v551.st_rdev = 0x10000LL;
                  _os_log_error_impl( &dword_1870CA000,  v281,  OS_LOG_TYPE_ERROR,  "compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                    (uint8_t *)&v551,
                    0x20u);
                }

                GetFileNameStringFromLocalFileRecord((_WORD *)[*v277 currentLFRecord]);
                v282 = (void *)objc_claimAutoreleasedReturnValue();
                _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1089LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v280,  @"compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                  v283,
                  (uint64_t)v282);
                uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_384:
                id v16 = 0LL;
                CFDictionaryRef v8 = v466;
LABEL_385:
                uint64_t v14 = v463;
                goto LABEL_511;
              }

              if (v177 >= 2)
              {
                v533[0] = @"SZExtractorCompressionLibErrorKey";
                [MEMORY[0x189607968] numberWithInt:v177];
                v284 = (void *)objc_claimAutoreleasedReturnValue();
                v534[0] = v284;
                v533[1] = @"SZExtractorFileOffsetErrorKey";
                v285 = v468;
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v468, "currentOffset"));
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v534[1] = v286;
                v533[2] = v461;
                GetFileNameStringFromLocalFileRecord((_WORD *)[*v285 currentLFRecord]);
                v287 = (void *)objc_claimAutoreleasedReturnValue();
                v534[2] = v287;
                [MEMORY[0x189603F68] dictionaryWithObjects:v534 forKeys:v533 count:3];
                v280 = (void *)objc_claimAutoreleasedReturnValue();

                SZGetLoggingHandle();
                v288 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
                {
                  v551.st_dev = 67109120;
                  *(_DWORD *)&v551.mode_t st_mode = v177;
                  _os_log_error_impl( &dword_1870CA000,  v288,  OS_LOG_TYPE_ERROR,  "compression_stream_process returned unexpected result %d",  (uint8_t *)&v551,  8u);
                }

                _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1097LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v280,  @"compression_stream_process returned unexpected result %d",  v289,  v177);
                uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_384;
              }

              if (v173 == src_size)
              {
                CFDictionaryRef v8 = v466;
              }

              else
              {
                uint64_t v182 = objc_msgSend( *v468,  "updateHashFromOffset:withBytes:length:",  objc_msgSend(*v468, "currentOffset") - v179,  src_ptr,  v173 - src_size);

                CFDictionaryRef v8 = v466;
                if (v182)
                {
                  id v16 = 0LL;
                  uint64_t v10 = (id)v182;
                  goto LABEL_385;
                }

                v467 = 0LL;
                LODWORD(v465) = (_DWORD)v465 + v179;
              }

              if (dst_size == 0x10000)
              {
                uint64_t v12 = v468;
              }

              else
              {
                v183 = 0x10000 - dst_size;
                objc_msgSend( *(id *)(v8 + 64),  "setUncompressedBytesOutput:",  objc_msgSend(*(id *)(v8 + 64), "uncompressedBytesOutput") + 0x10000 - dst_size);
                objc_msgSend( *(id *)(v8 + 64),  "setCurrentCRC32:",  crc32( objc_msgSend(*(id *)(v8 + 64), "currentCRC32"),  *(const Bytef **)(v8 + 56),  0x10000 - (int)dst_size));
                v184 = [*(id *)(v8 + 64) storeCurrentFileInMemory];
                int v185 = *(void **)(v8 + 64);
                if (v184)
                {
                  [v185 inMemoryFileData];
                  v186 = (void *)objc_claimAutoreleasedReturnValue();
                  [v186 appendBytes:*(void *)(v8 + 56) length:v183];

                  uint64_t v12 = v468;
                }

                else
                {
                  [v185 fileWriter];
                  v187 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v188 = v468;
                  if (!v187) {
                    __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1118,  "_currentState.fileWriter");
                  }

                  [*(id *)(v8 + 64) fileWriter];
                  uint64_t v189 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v190 = *(void *)(v8 + 56);
                  uint64_t v191 = v467;
                  v505 = v467;
                  unint64_t v192 = [v189 writeBuffer:v190 length:v183 error:&v505];
                  unint64_t v193 = v505;

                  if (!v192) {
                    goto LABEL_489;
                  }
                  v467 = v193;
                  uint64_t v12 = v188;
                }

                objc_msgSend(*v12, "setTotalFileSizeWritten:", objc_msgSend(*v12, "totalFileSizeWritten") + v183);
                if ([*v12 totalUncompressedBytes]) {
                  -[StreamingUnzipper _sendExtractionProgress:]( v8,  (double)(unint64_t)[*(id *)(v8 + 64) totalFileSizeWritten]
                }
                  / (double)(unint64_t)[*(id *)(v8 + 64) totalUncompressedBytes]);
              }

              if ((_DWORD)v177) {
                break;
              }
              uint64_t v173 = v174->src_size;
              if (!v173 && v174->dst_size) {
                goto LABEL_263;
              }
              src_ptr = v174->src_ptr;
            }

            if ((v460 & 1) == 0)
            {
              v204 = _GetCompressedSize(*v12);
              int v205 = [*v12 thisStageBytesComplete];
              uint64_t v10 = v467;
              if (v204 == v205)
              {
                int v206 = _GetUncompressedSize(*v12);
                if (v206 == [*v12 uncompressedBytesOutput])
                {
                  LODWORD(v173) = (_DWORD)v465;
                  uint64_t v14 = v463;
                  goto LABEL_274;
                }

                SZGetLoggingHandle();
                v393 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v393, OS_LOG_TYPE_ERROR))
                {
                  v434 = [*v12 uncompressedBytesOutput];
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v12 currentLFRecord]);
                  v435 = (id)objc_claimAutoreleasedReturnValue();
                  v436 = _GetUncompressedSize(*v12);
                  v551.st_dev = 134218498;
                  *(void *)&v551.mode_t st_mode = v434;
                  WORD2(v551.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v435;
                  HIWORD(v551.st_gid) = 2048;
                  *(void *)&v551.st_rdev = v436;
                  _os_log_error_impl( &dword_1870CA000,  v393,  OS_LOG_TYPE_ERROR,  "Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes",  (uint8_t *)&v551,  0x20u);
                }

                v529 = @"SZExtractorFileOffsetErrorKey";
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
                v394 = (void *)objc_claimAutoreleasedReturnValue();
                v530 = v394;
                [MEMORY[0x189603F68] dictionaryWithObjects:&v530 forKeys:&v529 count:1];
                v395 = (void *)objc_claimAutoreleasedReturnValue();
                v396 = [*v12 uncompressedBytesOutput];
                GetFileNameStringFromLocalFileRecord((_WORD *)[*v12 currentLFRecord]);
                v442 = (void *)objc_claimAutoreleasedReturnValue();
                _GetUncompressedSize(*v12);
                _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1143LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v395,  @"Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes",  v397,  v396);
                unint64_t v193 = (id)objc_claimAutoreleasedReturnValue();

LABEL_489:
                id v16 = 0LL;
                uint64_t v10 = v193;
              }

              else
              {
                SZGetLoggingHandle();
                v386 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v386, OS_LOG_TYPE_ERROR))
                {
                  v431 = _GetCompressedSize(*v12);
                  v432 = v431 - [*v12 thisStageBytesComplete];
                  GetFileNameStringFromLocalFileRecord((_WORD *)[*v468 currentLFRecord]);
                  v433 = (id)objc_claimAutoreleasedReturnValue();
                  v551.st_dev = 134218242;
                  *(void *)&v551.mode_t st_mode = v432;
                  uint64_t v12 = v468;
                  WORD2(v551.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v433;
                  _os_log_error_impl( &dword_1870CA000,  v386,  OS_LOG_TYPE_ERROR,  "Hit compression stream end with %llu compressed bytes remaining for file %@",  (uint8_t *)&v551,  0x16u);
                }

                v531 = @"SZExtractorFileOffsetErrorKey";
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
                v387 = (void *)objc_claimAutoreleasedReturnValue();
                v532 = v387;
                [MEMORY[0x189603F68] dictionaryWithObjects:&v532 forKeys:&v531 count:1];
                v388 = (void *)objc_claimAutoreleasedReturnValue();
                v389 = _GetCompressedSize(*v12);
                v390 = v389 - [*v12 thisStageBytesComplete];
                GetFileNameStringFromLocalFileRecord((_WORD *)[*v468 currentLFRecord]);
                v445 = (void *)objc_claimAutoreleasedReturnValue();
                v392 = _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1140LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v388,  @"Hit compression stream end with %llu compressed bytes remaining for file %@",  v391,  v390);

                id v16 = 0LL;
                uint64_t v10 = (id)v392;
              }

              goto LABEL_385;
            }

            v459 = 0LL;
            v447 = 1;
LABEL_263:
            LODWORD(v173) = (_DWORD)v465;
            uint64_t v14 = v463;
            uint64_t v10 = v467;
LABEL_274:
            [*v12 unsureData];
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            int v208 = v510;
            [v207 appendBytes:v510 length:v173];

            uint64_t v13 = v509 - v173;
            v509 = v13;
            v510 = &v208[v173];
            v169 = v448;
            v170 = v459;
            if (!v459)
            {
              LOBYTE(v170) = v447;
              goto LABEL_276;
            }

            continue;
          }

          break;
        }

        v194 = [*v12 currentCRC32];
        v195 = v510;
        objc_msgSend(*v12, "setCurrentCRC32:", crc32(v194, v510, v173));
        v196 = [*v12 storeCurrentFileInMemory];
        uint64_t v197 = *v12;
        if (v196)
        {
          [v197 inMemoryFileData];
          uint64_t v198 = (void *)objc_claimAutoreleasedReturnValue();
          [v198 appendBytes:v195 length:v173];

LABEL_267:
          objc_msgSend(*v12, "setCurrentOffset:", objc_msgSend(*v12, "currentOffset") + v173);
          objc_msgSend(*v12, "setThisStageBytesComplete:", objc_msgSend(*v12, "thisStageBytesComplete") + v173);
          objc_msgSend(*v12, "setUncompressedBytesOutput:", objc_msgSend(*v12, "uncompressedBytesOutput") + v173);
          objc_msgSend(*v12, "setTotalFileSizeWritten:", objc_msgSend(*v12, "totalFileSizeWritten") + v173);
          if ([*v12 totalUncompressedBytes]) {
            -[StreamingUnzipper _sendExtractionProgress:]( v8,  (double)(unint64_t)[*(id *)(v8 + 64) totalFileSizeWritten]
          }
            / (double)(unint64_t)[*(id *)(v8 + 64) totalUncompressedBytes]);
          unint64_t v202 = *v12;
          uint64_t v203 = [*v12 currentOffset];
          [v202 updateHashFromOffset:v203 - v173 withBytes:v510 length:v173];
          id v17 = (id)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            [*v12 markResumptionPoint];
            uint64_t v10 = 0LL;
            goto LABEL_274;
          }
        }

        else
        {
          [v197 fileWriter];
          uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v199) {
            __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  993,  "_currentState.fileWriter");
          }

          [*v12 fileWriter];
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          v506 = v10;
          v201 = [v200 writeBuffer:v195 length:v173 error:&v506];
          id v17 = v506;

          if (v201)
          {
            uint64_t v10 = v17;
            goto LABEL_267;
          }
        }

LABEL_463:
        id v16 = 0LL;
        uint64_t v10 = v17;
LABEL_511:
        objc_autoreleasePoolPop(v14);
        id v7 = v462;
LABEL_512:
        if (v10)
        {
          if ([*v468 performingExtraction])
          {
            SZGetTraceHandle();
            v413 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v413))
            {
              LOWORD(v551.st_dev) = 0;
              _os_signpost_emit_with_name_impl( &dword_1870CA000,  v413,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction failed",  (uint8_t *)&v551,  2u);
            }

            [*v468 setPerformingExtraction:0];
          }

          -[StreamingUnzipper _setErrorState](v8);
        }

        v7[2](v7, v10, v16);

LABEL_519:
        return;
      case 2:
        goto LABEL_210;
      case 3:
        if (![*v12 dataDescriptor]) {
          objc_msgSend(*v12, "setDataDescriptor:", calloc(1uLL, 0x18uLL));
        }
        BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([*v12 currentLFRecord]);
        if (HasZip64ExtraField) {
          id v47 = 24LL;
        }
        else {
          id v47 = 16LL;
        }
        uint64_t v29 = _CopyStreamBytesToRecord([*v12 dataDescriptor], v47, *v12, (const void **)&v510, &v509);

        if (v29) {
          goto LABEL_395;
        }
        uint64_t v13 = v509;
        uint32_t v48 = *v12;
        if (!v509) {
          goto LABEL_408;
        }
        if ([v48 thisStageBytesComplete] != v47) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1334,  "_currentState.thisStageBytesComplete == expected_size");
        }
        if (*(_DWORD *)[*v12 dataDescriptor] != 134695760)
        {
          [*v12 unsureData];
          v308 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v309 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v310 = v309;
          if (v308)
          {
            if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
            {
              v311 = *(unsigned __int8 *)[*v12 dataDescriptor];
              v312 = *(unsigned __int8 *)([*v468 dataDescriptor] + 1);
              v313 = *(unsigned __int8 *)([*v468 dataDescriptor] + 2);
              v314 = *(unsigned __int8 *)([*v468 dataDescriptor] + 3);
              v551.st_dev = 67109888;
              *(_DWORD *)&v551.mode_t st_mode = v311;
              LOWORD(v551.st_ino) = 1024;
              *(_DWORD *)((char *)&v551.st_ino + 2) = v312;
              HIWORD(v551.st_ino) = 1024;
              v551.__int16 st_uid = v313;
              LOWORD(v551.st_gid) = 1024;
              *(gid_t *)((char *)&v551.st_gid + 2) = v314;
              _os_log_impl( &dword_1870CA000,  v310,  OS_LOG_TYPE_DEFAULT,  "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx); entering passthrough mode",
                (uint8_t *)&v551,
                0x1Au);
            }

            v315 = v510;
            v316 = v8;
            v317 = v13;
            goto LABEL_431;
          }

          if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
          {
            v415 = *(unsigned __int8 *)[*v12 dataDescriptor];
            v416 = *(unsigned __int8 *)([*v468 dataDescriptor] + 1);
            v417 = *(unsigned __int8 *)([*v468 dataDescriptor] + 2);
            v418 = *(unsigned __int8 *)([*v468 dataDescriptor] + 3);
            v551.st_dev = 67109888;
            *(_DWORD *)&v551.mode_t st_mode = v415;
            uint64_t v12 = v468;
            LOWORD(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 2) = v416;
            HIWORD(v551.st_ino) = 1024;
            v551.__int16 st_uid = v417;
            LOWORD(v551.st_gid) = 1024;
            *(gid_t *)((char *)&v551.st_gid + 2) = v418;
            _os_log_error_impl( &dword_1870CA000,  v310,  OS_LOG_TYPE_ERROR,  "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).",  (uint8_t *)&v551,  0x1Au);
          }

          v525 = @"SZExtractorFileOffsetErrorKey";
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          v526 = v363;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v526 forKeys:&v525 count:1];
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          v365 = *(unsigned __int8 *)[*v12 dataDescriptor];
          [*v468 dataDescriptor];
          [*v468 dataDescriptor];
          [*v468 dataDescriptor];
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1343LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v364,  @"Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).",  v366,  v365);
          uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_454:
          id v16 = 0LL;
LABEL_455:
          CFDictionaryRef v8 = v466;
          goto LABEL_511;
        }

        SZGetLoggingHandle();
        uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
        if (HasZip64ExtraField)
        {
          if (!v50) {
            goto LABEL_57;
          }
          size_t v51 = *(_DWORD *)([*v12 dataDescriptor] + 4);
          uint64_t v52 = *(void *)([*v468 dataDescriptor] + 16);
          int v53 = *(void *)([*v468 dataDescriptor] + 8);
          v551.st_dev = v452;
          *(_DWORD *)&v551.mode_t st_mode = v51;
          uint64_t v12 = v468;
          LOWORD(v551.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = v52;
          HIWORD(v551.st_uid) = 2048;
          *(void *)&v551.__int16 st_gid = v53;
          size_t v54 = v49;
          CFIndex v55 = "Got data descriptor with CRC 0x%x, uncompressed size %llu, compressed size %llu";
          int v56 = 28;
        }

        else
        {
          if (!v50) {
            goto LABEL_57;
          }
          v243 = *(_DWORD *)([*v12 dataDescriptor] + 4);
          v244 = *(_DWORD *)([*v468 dataDescriptor] + 12);
          v245 = *(_DWORD *)([*v468 dataDescriptor] + 8);
          v551.st_dev = v452;
          *(_DWORD *)&v551.mode_t st_mode = v243;
          uint64_t v12 = v468;
          LOWORD(v551.st_ino) = 1024;
          *(_DWORD *)((char *)&v551.st_ino + 2) = v244;
          HIWORD(v551.st_ino) = 1024;
          v551.__int16 st_uid = v245;
          size_t v54 = v49;
          CFIndex v55 = "Got data descriptor with CRC 0x%x, uncompressed size %u, compressed size %u";
          int v56 = 20;
        }

        _os_log_debug_impl(&dword_1870CA000, v54, OS_LOG_TYPE_DEBUG, v55, (uint8_t *)&v551, v56);
LABEL_57:

        [*v12 setStreamState:4];
        uint64_t v10 = 0LL;
LABEL_58:
        CFIndex v58 = [*v12 uncompressedBytesOutput];
        uint32_t v59 = _GetUncompressedSize(*v12);
        int v60 = *v12;
        if (v58 != v59)
        {
          GetFileNameStringFromLocalFileRecord((_WORD *)[v60 currentLFRecord]);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          v523[0] = @"SZExtractorFileOffsetErrorKey";
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          v523[1] = v461;
          v524[0] = v291;
          v524[1] = v290;
          [MEMORY[0x189603F68] dictionaryWithObjects:v524 forKeys:v523 count:2];
          v292 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v293 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v293, OS_LOG_TYPE_ERROR))
          {
            v400 = [*v12 uncompressedBytesOutput];
            v401 = _GetUncompressedSize(*v12);
            v551.st_dev = 138412802;
            *(void *)&v551.mode_t st_mode = v290;
            WORD2(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v400;
            HIWORD(v551.st_gid) = 2048;
            *(void *)&v551.st_rdev = v401;
            _os_log_error_impl( &dword_1870CA000,  v293,  OS_LOG_TYPE_ERROR,  "Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
              (uint8_t *)&v551,
              0x20u);
          }

          [*v12 uncompressedBytesOutput];
          _GetUncompressedSize(*v12);
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1364LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v292,  @"Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
            v294,
            (uint64_t)v290);
          v299 = LABEL_393:;
LABEL_394:
          uint64_t v29 = v299;

          goto LABEL_395;
        }

        size_t v61 = [v60 currentCRC32];
        CRC32 = _GetCRC32(*v12);
        __int16 v63 = (_WORD *)[*v12 currentLFRecord];
        if (v61 != CRC32)
        {
          GetFileNameStringFromLocalFileRecord(v63);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          v521[0] = @"SZExtractorFileOffsetErrorKey";
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          v521[1] = v461;
          v522[0] = v295;
          v522[1] = v290;
          [MEMORY[0x189603F68] dictionaryWithObjects:v522 forKeys:v521 count:2];
          v292 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v296 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR))
          {
            v402 = [*v12 currentCRC32];
            v403 = _GetCRC32(*v12);
            v551.st_dev = 134218498;
            *(void *)&v551.mode_t st_mode = v402;
            WORD2(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 6) = v403;
            HIWORD(v551.st_uid) = 2112;
            *(void *)&v551.__int16 st_gid = v290;
            _os_log_error_impl( &dword_1870CA000,  v296,  OS_LOG_TYPE_ERROR,  "CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
              (uint8_t *)&v551,
              0x1Cu);
          }

          v297 = [*v12 currentCRC32];
          _GetCRC32(*v12);
          _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1372LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v292,  @"CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
            v298,
            v297);
          goto LABEL_393;
        }

        v467 = v10;
        int v64 = GetInfoZipExtraFieldFromLF((uint64_t)v63);
        int v65 = GetFileNameStringFromLocalFileRecord((_WORD *)[*v12 currentLFRecord]);
        uint64_t v66 = (const char *)[v65 fileSystemRepresentation];
        uint64_t v67 = *v12;
        if (!v65 || !v66)
        {
          [v67 unsureData];
          __int16 v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v72)
          {
            int v81 = [*v12 currentLFRecord];
            __int16 v82 = *(unsigned __int16 *)(v81 + 26);
            uint64_t v83 = calloc(v82 + 1, 1uLL);
            memcpy(v83, (const void *)(v81 + 30), v82);
            SZGetLoggingHandle();
            unint64_t v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v451;
              *(void *)&v551.mode_t st_mode = v83;
              _os_log_error_impl( &dword_1870CA000,  v84,  OS_LOG_TYPE_ERROR,  "Couldn't get filename for current file %s",  (uint8_t *)&v551,  0xCu);
            }

            v519 = @"SZExtractorFileOffsetErrorKey";
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
            size_t v85 = (void *)objc_claimAutoreleasedReturnValue();
            v520 = v85;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v520 forKeys:&v519 count:1];
            __int16 v86 = (void *)objc_claimAutoreleasedReturnValue();
            CFIndex v57 = 2;
            _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1387LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v86,  @"Couldn't get filename for current file %s",  v87,  (uint64_t)v83);
            uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

            free(v83);
            goto LABEL_358;
          }

          SZGetLoggingHandle();
          int v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v551.st_dev) = 0;
            _os_log_impl( &dword_1870CA000,  v73,  OS_LOG_TYPE_DEFAULT,  "Couldn't get filename for stream metadata file; entering passthrough mode",
              (uint8_t *)&v551,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v13);
          uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

LABEL_74:
          CFIndex v57 = 2;
          goto LABEL_358;
        }

        uint64_t v68 = [v67 recordsProcessed];
        v463 = v14;
        if (v68 > 2 || strcmp(v66, "META-INF/com.apple.ZipMetadata.plist"))
        {
          if ((unint64_t)[*v12 recordsProcessed] > 3
            || strcmp(v66, "META-INF/com.apple.FixedZipMetadata.bin"))
          {
            if (([*v12 currentLFMode] & 0xF000) == 0xA000)
            {
              [v464 stringByAppendingPathComponent:v65];
              __int128 v69 = (void *)objc_claimAutoreleasedReturnValue();
              if ([*v12 storeCurrentFileInMemory])
              {
                [*v12 inMemoryFileData];
                __int128 v70 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v70) {
                  __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1496,  "_currentState.inMemoryFileData");
                }

                [*v12 inMemoryFileData];
                uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_126;
              }

              v473 = 0LL;
              [MEMORY[0x189603FB8] dataWithContentsOfFile:v69 options:3 error:&v473];
              uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
              stat v107 = v473;
              if (v71)
              {
                [MEMORY[0x1896078A8] defaultManager];
                int v108 = (void *)objc_claimAutoreleasedReturnValue();
                [v108 removeItemAtPath:v69 error:0];

LABEL_126:
                v472 = 0;
                [v71 appendBytes:&v472 length:1];
                int v109 = v71;
                int v110 = (const char *)[v109 bytes];
                uint64_t v88 = v69;
                int v111 = (const char *)[v88 fileSystemRepresentation];
                if ([*v12 denyInvalidSymlinks])
                {
                  if (*v110 == 47)
                  {
                    SZGetLoggingHandle();
                    int v112 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    {
                      v551.st_dev = v453;
                      *(void *)&v551.mode_t st_mode = v111;
                      WORD2(v551.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v110;
                      _os_log_error_impl( &dword_1870CA000,  v112,  OS_LOG_TYPE_ERROR,  "Invalid symlink: %s -> %s (absolute symlinks are forbidden)",  (uint8_t *)&v551,  0x16u);
                    }

                    v515 = v461;
                    v516 = v88;
                    [MEMORY[0x189603F68] dictionaryWithObjects:&v516 forKeys:&v515 count:1];
                    size_t v113 = (void *)objc_claimAutoreleasedReturnValue();
                    _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1520LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v113,  @"Invalid symlink: %s -> %s (absolute symlinks are forbidden)",  v114,  (uint64_t)v111);
LABEL_324:
                    uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_325;
                  }

                  v547 = 0;
                  v508 = 0;
                  if (!_GetAndValidatePathDepth( (const char *)[v65 fileSystemRepresentation], 0, (int *)&v508)
                    || !_GetAndValidatePathDepth(v110, v508, (int *)&v547))
                  {
                    SZGetLoggingHandle();
                    v240 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
                    {
                      v551.st_dev = v453;
                      *(void *)&v551.mode_t st_mode = v111;
                      WORD2(v551.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v110;
                      _os_log_error_impl( &dword_1870CA000,  v240,  OS_LOG_TYPE_ERROR,  "Invalid symlink: %s -> %s",  (uint8_t *)&v551,  0x16u);
                    }

                    v513 = v461;
                    v514 = v88;
                    [MEMORY[0x189603F68] dictionaryWithObjects:&v514 forKeys:&v513 count:1];
                    size_t v113 = (void *)objc_claimAutoreleasedReturnValue();
                    _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1533LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v113,  @"Invalid symlink: %s -> %s",  v241,  (uint64_t)v111);
                    goto LABEL_324;
                  }
                }

                if (symlink(v110, v111))
                {
                  v222 = v109;
                  v223 = *__error();
                  SZGetLoggingHandle();
                  int v224 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
                  {
                    v263 = strerror(v223);
                    v551.st_dev = v449;
                    *(void *)&v551.mode_t st_mode = v111;
                    WORD2(v551.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v110;
                    HIWORD(v551.st_gid) = 2080;
                    *(void *)&v551.st_rdev = v263;
                    _os_log_error_impl( &dword_1870CA000,  v224,  OS_LOG_TYPE_ERROR,  "Failed to create symlink at %s to %s: %s",  (uint8_t *)&v551,  0x20u);
                  }

                  v511 = v461;
                  v512 = v88;
                  [MEMORY[0x189603F68] dictionaryWithObjects:&v512 forKeys:&v511 count:1];
                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                  strerror(v223);
                  _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1541LL,  v457,  v223,  0LL,  v225,  @"Failed to create symlink at %s to %s: %s",  v226,  (uint64_t)v111);
                  uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

                  int v109 = v222;
                  goto LABEL_325;
                }

                lchmod(v111, [*v12 currentLFMode]);
                if ([*v12 denyInvalidSymlinks])
                {
                  v465 = v109;
                  v237 = v8;
                  v238 = v467;
                  v471 = v467;
                  v239 = _CheckRealpathHasBasePrefix(v88, v464, &v471);
                  uint64_t v74 = v471;

                  CFDictionaryRef v8 = v237;
                  int v109 = (char *)v465;
                  v467 = v74;
                  if (!v239)
                  {
LABEL_325:

LABEL_326:
LABEL_337:
                    CFIndex v57 = 2;
                    uint64_t v14 = v463;
LABEL_358:

                    uint64_t v10 = v74;
                    goto LABEL_359;
                  }
                }

                if (v64)
                {
                  *(void *)&v551.st_dev = *((unsigned int *)v64 + 1);
                  LODWORD(v551.st_ino) = 0;
                  *(void *)&v551.__int16 st_uid = *((unsigned int *)v64 + 2);
                }

                else
                {
                  *(void *)&v551.st_dev = DOS2UNIXTime(*(_DWORD *)([*v12 currentLFRecord] + 10));
                  LODWORD(v551.st_ino) = 0;
                  *(void *)&v551.__int16 st_uid = *(void *)&v551.st_dev;
                }

                v551.st_rdev = 0;
                lutimes(v111, (const timeval *)&v551);

                goto LABEL_343;
              }

              SZGetLoggingHandle();
              uint64_t v227 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
              {
                v551.st_dev = v456;
                *(void *)&v551.mode_t st_mode = v69;
                _os_log_error_impl( &dword_1870CA000,  v227,  OS_LOG_TYPE_ERROR,  "Failed to read symlink path from %@",  (uint8_t *)&v551,  0xCu);
              }

              v517 = v461;
              v518 = v69;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v518 forKeys:&v517 count:1];
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1502LL,  @"SZExtractorErrorDomain",  5LL,  v107,  v228,  @"Failed to read symlink path from %@",  v229,  (uint64_t)v69);
              uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

LABEL_336:
              goto LABEL_337;
            }

            if ([*v12 storeCurrentFileInMemory])
            {
              SZGetLoggingHandle();
              uint64_t v88 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_DEBUG))
              {
                v551.st_dev = v456;
                *(void *)&v551.mode_t st_mode = v65;
                _os_log_debug_impl( &dword_1870CA000,  (os_log_t)v88,  OS_LOG_TYPE_DEBUG,  "Not doing anything with data for file %@",  (uint8_t *)&v551,  0xCu);
              }
            }

            else
            {
              if (v64)
              {
                uint64_t v116 = *((unsigned int *)v64 + 1);
                uint64_t v115 = *((unsigned int *)v64 + 2);
              }

              else
              {
                uint64_t v115 = DOS2UNIXTime(*(_DWORD *)([*v12 currentLFRecord] + 10));
                uint64_t v116 = v115;
              }

              v230 = [*v12 currentLFRecord];
              if (*(_BYTE *)(*(unsigned __int16 *)(v230 + 26) + v230 + 29) != 47)
              {
                [*v12 fileWriter];
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v232) {
                  __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1582,  "_currentState.fileWriter");
                }

                [*v12 fileWriter];
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                v234 = [*v12 currentLFMode];
                v235 = v467;
                v470 = v467;
                v236 = objc_msgSend( v233,  "finalizeFileWithAccessTime:modTime:mode:error:",  v116,  0,  v115,  0,  v234,  &v470);
                uint64_t v74 = v470;

                if ((v236 & 1) == 0) {
                  goto LABEL_74;
                }
                goto LABEL_344;
              }

              [v464 stringByAppendingPathComponent:v65];
              v231 = (void *)objc_claimAutoreleasedReturnValue();
              *(void *)&v551.st_dev = v116;
              v551.st_ino = 0LL;
              *(void *)&v551.__int16 st_uid = v115;
              *(void *)&v551.st_rdev = 0LL;
              uint64_t v88 = v231;
              lutimes((const char *)[v88 fileSystemRepresentation], (const timeval *)&v551);
            }

LABEL_343:
            uint64_t v74 = v467;
            uint64_t v14 = v463;
LABEL_344:
            SZGetTraceHandle();
            v251 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v251))
            {
              v551.st_dev = v456;
              *(void *)&v551.mode_t st_mode = v65;
              _os_signpost_emit_with_name_impl( &dword_1870CA000,  v251,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction completed successfully for file %@",  (uint8_t *)&v551,  0xCu);
            }

            [*(id *)(v8 + 64) setPerformingExtraction:0];
            v252 = v65;
            if ((*(_BYTE *)(v8 + 80) & 2) != 0)
            {
              [(id)v8 xpcConnection];
              v253 = (void *)objc_claimAutoreleasedReturnValue();
              v254 = v253;
              if (v253)
              {
                [v253 remoteObjectProxy];
                v255 = (id)objc_claimAutoreleasedReturnValue();
                [v255 extractionCompleteAtArchivePath:v252];
              }

              else
              {
                [(id)v8 inProcessExtractorDelegate];
                v256 = (void *)v8;
                v255 = (id)objc_claimAutoreleasedReturnValue();
                if (v255)
                {
                  [v256 inProcessDelegateQueue];
                  v257 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v257)
                  {
                    [v256 inProcessDelegateQueue];
                    v258 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
                    *(void *)&v551.st_dev = MEMORY[0x1895F87A8];
                    v551.st_ino = 3221225472LL;
                    *(void *)&v551.__int16 st_uid = __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke;
                    *(void *)&v551.st_rdev = &unk_189FE1D48;
                    v255 = v255;
                    v551.st_atimespec.tv_sec = (__darwin_time_t)v255;
                    v551.st_atimespec.tv_nsec = (uint64_t)v252;
                    dispatch_async(v258, &v551);
                  }
                }

                uint64_t v12 = v468;
              }

              CFDictionaryRef v8 = v466;
            }

            [*v12 setStreamState:0];
            if (![*v12 totalUncompressedBytes] && objc_msgSend(*v12, "totalRecordCount")) {
              -[StreamingUnzipper _sendExtractionProgress:]( v8,  (double)(unint64_t)[*(id *)(v8 + 64) recordsProcessed]
            }
              / (double)(unint64_t)[*(id *)(v8 + 64) totalRecordCount]);
            CFIndex v57 = 3;
            goto LABEL_358;
          }

          if ([*v12 storeCurrentFileInMemory])
          {
            [*v12 inMemoryFileData];
            uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v117) {
              __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1452,  "_currentState.inMemoryFileData");
            }

            [*v12 inMemoryFileData];
            uint64_t v88 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            [v464 stringByAppendingPathComponent:v65];
            int v212 = (void *)objc_claimAutoreleasedReturnValue();
            v502 = 0LL;
            [MEMORY[0x189603F48] dataWithContentsOfFile:v212 options:3 error:&v502];
            uint64_t v88 = (id)objc_claimAutoreleasedReturnValue();
            v213 = v502;
            if (!v88)
            {
              SZGetLoggingHandle();
              v214 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
              {
                v551.st_dev = v455;
                *(void *)&v551.mode_t st_mode = v212;
                WORD2(v551.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v213;
                _os_log_error_impl( &dword_1870CA000,  v214,  OS_LOG_TYPE_ERROR,  "Failed to read fixed stream metadata from %@: %@",  (uint8_t *)&v551,  0x16u);
              }
            }
          }

          if (!v88) {
            goto LABEL_343;
          }
          unsigned int v215 = v88;
          unint64_t v216 = [v215 bytes];
          v217 = [v215 length];
          if (v217 < 7 || *(_DWORD *)v216 != 2017879117)
          {
            SZGetLoggingHandle();
            unsigned __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v458;
              *(void *)&v551.mode_t st_mode = v217;
              _os_log_error_impl( &dword_1870CA000,  v123,  OS_LOG_TYPE_ERROR,  "Got a fixed metadata file that did not match expected content (length %lu). Ignoring.",  (uint8_t *)&v551,  0xCu);
            }

LABEL_298:
            goto LABEL_343;
          }

          v248 = *v12;
          if (*v12)
          {
            [v248 hashContext];
            v248 = *v12;
            v249 = v488 + 1;
            if (v248)
            {
              v248 = (id)[v248 hashContext];
              v250 = v474;
              goto LABEL_364;
            }

            v261 = 0uLL;
          }

          else
          {
            v501 = 0LL;
            v261 = 0uLL;
            v499 = 0u;
            v500 = 0u;
            v497 = 0u;
            v498 = 0u;
            v495 = 0u;
            v496 = 0u;
            v493 = 0u;
            v494 = 0u;
            v491 = 0u;
            v492 = 0u;
            v489 = 0u;
            v490 = 0u;
            v249 = 1;
            v488 = 0u;
          }

          v250 = 0LL;
          v487 = 0LL;
          v485 = v261;
          v486 = v261;
          v483 = v261;
          v484 = v261;
          v481 = v261;
          v482 = v261;
          v480 = v261;
          v478 = v261;
          v479 = v261;
          v476 = v261;
          v477 = v261;
          v474 = v261;
          v475 = v261;
LABEL_364:
          v266 = gHashDigestSizes[v250];
          LOWORD(v547) = v266;
          v267 = *(unsigned __int8 *)(v216 + 4) == v249;
          uint64_t v12 = v468;
          if (!v267) {
            goto LABEL_343;
          }
          v268 = (unsigned __int16)v266;
          MEMORY[0x1895F8858](v248);
          v270 = (char *)&v446 - v269;
          bzero((char *)&v446 - v269, v268);
          v271 = (unsigned __int8 *)(v216 + 7);
          if (!memcmp(v270, v271, v268))
          {
            SZGetLoggingHandle();
            unsigned __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_debug_impl( &dword_1870CA000,  v123,  OS_LOG_TYPE_DEBUG,  "Found last chunk partial hash data but the hash was not computed.",  (uint8_t *)&v551,  2u);
            }
          }

          else
          {
            StringFromDigest(v271, v268);
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            [*v12 setLastChunkPartialHash:v272];

            SZGetLoggingHandle();
            unsigned __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
            {
              [*v12 lastChunkPartialHash];
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              v551.st_dev = v456;
              *(void *)&v551.mode_t st_mode = v273;
              _os_log_debug_impl( &dword_1870CA000,  v123,  OS_LOG_TYPE_DEBUG,  "Got last chunk partial hash %@",  (uint8_t *)&v551,  0xCu);
            }
          }

          goto LABEL_298;
        }

        if ([*v12 storeCurrentFileInMemory])
        {
          [*v12 inMemoryFileData];
          uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v89) {
            __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1396,  "_currentState.inMemoryFileData");
          }

          [*v12 inMemoryFileData];
          __int128 v69 = (void *)objc_claimAutoreleasedReturnValue();
          v504 = 0LL;
          [MEMORY[0x1896079E8] propertyListWithData:v69 options:0 format:0 error:&v504];
          uint32_t v90 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v91 = v504;
          [*v12 setStreamInfoDict:v90];

          [*v12 streamInfoDict];
          __int128 v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v92)
          {
            SZGetLoggingHandle();
            uint64_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl( &dword_1870CA000,  v93,  OS_LOG_TYPE_DEFAULT,  "Failed to decode stream metadata; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v8, (uint64_t)v510, v13);
            uint64_t v74 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_74;
          }

id _CopyStreamBytesToRecord(uint64_t a1, uint64_t a2, void *a3, const void **a4, size_t *a5)
{
  size_t v9 = *a5;
  id v10 = a3;
  uint64_t v11 = [v10 thisStageBytesComplete];
  if (v9 >= a2 - v11) {
    size_t v12 = a2 - v11;
  }
  else {
    size_t v12 = v9;
  }
  memcpy((void *)(a1 + [v10 thisStageBytesComplete]), *a4, v12);
  objc_msgSend(v10, "setThisStageBytesComplete:", objc_msgSend(v10, "thisStageBytesComplete") + v12);
  [v10 unsureData];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 appendBytes:*a4 length:v12];

  objc_msgSend(v10, "setCurrentOffset:", objc_msgSend(v10, "currentOffset") + v12);
  objc_msgSend(v10, "updateHashFromOffset:withBytes:length:", objc_msgSend(v10, "currentOffset") - v12, *a4, v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    *a4 = (char *)*a4 + v12;
    *a5 -= v12;
  }

  return v14;
}

LABEL_34:
      -[StreamingUnzipper _setErrorState](a1);
      goto LABEL_35;
    }

    __int128 v37 = v19;
    uint64_t v20 = [v13 writeBuffer:a2 length:a3 error:&v37];
    uint64_t v14 = v37;

    if ((v20 & 1) != 0)
    {
      uint64_t v19 = v14;
      goto LABEL_16;
    }

    SZGetLoggingHandle();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( &dword_1870CA000,  v31,  OS_LOG_TYPE_ERROR,  "Failed to write remaining initial data to passthrough output file",  (uint8_t *)&buf,  2u);
    }

    uint64_t v40 = *MEMORY[0x1896074F8];
    id v41 = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  211LL,  @"SZExtractorErrorDomain",  1LL,  v14,  v26,  @"Failed to write remaining initial data to passthrough output file",  v32,  v36);
LABEL_33:
    char v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  SZGetLoggingHandle();
  CFIndex v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl( &dword_1870CA000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to write initial data to passthrough output file",  (uint8_t *)&buf,  2u);
  }

  int v42 = *MEMORY[0x1896074F8];
  uint64_t v43 = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  205LL,  @"SZExtractorErrorDomain",  1LL,  v19,  v29,  @"Failed to write initial data to passthrough output file",  v30,  v36);
  char v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21) {
    goto LABEL_34;
  }
LABEL_35:

  return v21;
}

uint64_t _GetUncompressedSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if (*(_WORD *)([v1 currentLFRecord] + 8)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetUncompressedSize",  "StreamingUnzipper.m",  339,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 340, "NULL != currentState.dataDescriptor");
    }
    BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    uint64_t v4 = [v1 dataDescriptor];
    if (HasZip64ExtraField) {
      uint64_t LFUncompressedSize = *(void *)(v4 + 16);
    }
    else {
      uint64_t LFUncompressedSize = *(unsigned int *)(v4 + 12);
    }
  }

  else
  {
    uint64_t LFUncompressedSize = GetLFUncompressedSize(v2);
  }

  return LFUncompressedSize;
}

uint64_t _GetCompressedSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if (*(_WORD *)([v1 currentLFRecord] + 8)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetCompressedSize",  "StreamingUnzipper.m",  356,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 357, "NULL != currentState.dataDescriptor");
    }
    BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    uint64_t v4 = [v1 dataDescriptor];
    if (HasZip64ExtraField) {
      uint64_t v5 = *(void *)(v4 + 8);
    }
    else {
      uint64_t v5 = *(unsigned int *)(v4 + 8);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v5 = *(unsigned int *)(v2 + 18);
  }

  return v5;
}

id GetFileNameStringFromLocalFileRecord(_WORD *a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  size_t v2 = (unsigned __int16)a1[13];
  __int128 v3 = (unsigned __int8 *)calloc(v2 + 1, 1uLL);
  memcpy(v3, a1 + 15, v2);
  if (!v3)
  {
    SZGetLoggingHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl( &dword_1870CA000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to get name from local file record.",  buf,  2u);
    }

    return 0LL;
  }

  uint64_t v4 = 0LL;
  char v5 = 0;
  int v6 = 0;
  int v7 = 0;
  do
  {
    int v8 = v3[v4];
    if ((char)v3[v4] < 0)
    {
      char v5 = 1;
    }

    else if (v2 != v4 && !v3[v4])
    {
      SZGetLoggingHandle();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136315650;
        CFIndex v28 = v3;
        __int16 v29 = 2048;
        size_t v30 = v2;
        __int16 v31 = 2048;
        uint64_t v32 = v4;
        _os_log_error_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_ERROR,  "Found NUL in path %s length %zu at %zu",  buf,  0x20u);
      }

LABEL_43:
      id v10 = 0LL;
      goto LABEL_66;
    }

    switch(v7)
    {
      case 0:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 1;
        }
        break;
      case 1:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 2;
        }
        break;
      case 2:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 47) {
          int v9 = 1;
        }
        else {
          int v9 = v6;
        }
        if (v3[v4])
        {
          int v6 = v9;
        }

        else
        {
          int v7 = 0;
          int v6 = 1;
        }

        break;
      case 3:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        break;
      default:
        break;
    }

    ++v4;
  }

  while (v2 + 1 != v4);
  if ((v5 & 1) != 0)
  {
    if (!(((a1[3] & 0x800) == 0) | v6 & 1))
    {
LABEL_36:
      id v10 = (void *)[objc_alloc(NSString) initWithBytes:v3 length:v2 encoding:4];
      goto LABEL_66;
    }
  }

  else if ((v6 & 1) == 0)
  {
    goto LABEL_36;
  }

  id v10 = (void *)[objc_alloc(NSString) initWithBytes:v3 length:v2 encoding:4];
  if (!v10)
  {
    id v15 = objc_alloc(NSString);
    id v10 = (void *)objc_msgSend( v15,  "initWithBytes:length:encoding:",  v3,  v2,  objc_msgSend(NSString, "defaultCStringEncoding"));
    if (!v10)
    {
      id v10 = (void *)[objc_alloc(NSString) initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x600u)];
      if (!v10)
      {
        id v10 = (void *)[objc_alloc(NSString) initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x400u)];
        if (!v10)
        {
          SZGetLoggingHandle();
          size_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136315138;
            CFIndex v28 = v3;
            _os_log_error_impl( &dword_1870CA000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to convert path to string: %s",  buf,  0xCu);
          }

          goto LABEL_43;
        }
      }
    }
  }

  if ((v6 & 1) != 0)
  {
    uint64_t v26 = v10;
    [v10 componentsSeparatedByString:@"/"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = (void *)[v25 mutableCopy];
    uint64_t v17 = [v16 count];
    if (v17)
    {
      uint64_t v18 = v17;
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        uint64_t v20 = [v16 count];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = 0LL;
          while (1)
          {
            [v16 objectAtIndex:v22];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22
              && (([v23 isEqualToString:@"."] & 1) != 0
               || [v23 isEqualToString:&stru_189FE3B88]))
            {
              goto LABEL_62;
            }

            if (v21 == ++v22) {
              goto LABEL_64;
            }
          }

          [v16 removeObjectAtIndex:v22];
          if (!v22) {
            goto LABEL_63;
          }
          --v22;
LABEL_62:
          [v16 removeObjectAtIndex:v22];
LABEL_63:
        }

LABEL_64:
        ;
      }
    }

    [v16 componentsJoinedByString:@"/"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_66:
  free(v3);
  return v10;
}

uint64_t _GetCRC32(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if ([v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetCRC32",  "StreamingUnzipper.m",  322,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 323, "NULL != currentState.dataDescriptor");
    }
    LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    __int128 v3 = (unsigned int *)([v1 dataDescriptor] + 4);
  }

  else
  {
    __int128 v3 = (unsigned int *)(v2 + 14);
  }

  uint64_t v4 = *v3;

  return v4;
}

id StringFromDigest(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  [MEMORY[0x189607940] stringWithCapacity:a2];
  for (uint64_t i = (void *)objc_claimAutoreleasedReturnValue(); v2; --v2)
  {
    unsigned int v5 = *a1++;
    objc_msgSend(i, "appendFormat:", @"%02x", v5);
  }

  return i;
}

uint64_t _GetAndValidatePathDepth(const char *a1, int a2, int *a3)
{
  int v6 = strndup(a1, 0x400uLL);
  __stringp = v6;
  if (!v6) {
    return 0LL;
  }
  int v7 = v6;
  if (*v6 == 47 || !*a1)
  {
LABEL_14:
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  while (1)
  {
    int v8 = strsep(&__stringp, "/");
    if (!v8) {
      break;
    }
    if (*v8)
    {
      if (*v8 != 46) {
        goto LABEL_10;
      }
      if (v8[1])
      {
        if (v8[1] == 46 && !v8[2])
        {
          --a2;
          goto LABEL_11;
        }

LABEL_11:
    if (a2 < 1) {
      goto LABEL_14;
    }
  }

  *a3 = a2;
  uint64_t v9 = 1LL;
LABEL_15:
  free(v7);
  return v9;
}

LABEL_25:
  return (int)v18 >= 0;
}

LABEL_19:
  if (((v18 | !v12) & 1) == 0)
  {
    SZGetTraceHandle();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)int buf = 138412546;
      uint64_t v26 = v9;
      uint64_t v27 = 2048;
      CFIndex v28 = a3;
      _os_signpost_emit_with_name_impl( &dword_1870CA000,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_FILE_QUEUE_FULL",  "Insufficient buffer avilable for %@ size %lld",  buf,  0x16u);
    }
  }

  *a6 = v16;

  return v19;
}

void sub_1870E5F7C(_Unwind_Exception *a1)
{
}

LABEL_18:
      free(self->_currentLFRecord);
      self->_currentLFRecord = 0LL;
      break;
    default:
      break;
  }

  self->_streamState = v3;
  -[StreamingUnzipState markResumptionPoint](self, "markResumptionPoint");
}

LABEL_24:
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_uncompressedBytesOutput];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v23 forKey:@"CurrentOutputFileOffset"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_totalFileSizeWritten];
  size_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v24 forKey:@"TotalFileSizeWritten"];

  [MEMORY[0x189607968] numberWithUnsignedLong:self->_currentCRC32];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v25 forKey:@"CurrentCRC32"];

  state = self->_cmpState.state;
  if (state)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:state length:compression_stream_get_state_size() freeWhenDone:0];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 encodeObject:v27 forKey:@"SerializedCompressionState"];
  }

  [v9 encodeBool:self->_fileWriter != 0 forKey:@"OpenCurrentOutputFile"];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_recordsProcessed];
  CFIndex v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v28 forKey:@"RecordsProcessed"];

  [MEMORY[0x189607968] numberWithUnsignedShort:self->_currentLFMode];
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v29 forKey:@"LocalFileMode"];

  [MEMORY[0x189607968] numberWithUnsignedChar:self->_streamState];
  size_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v30 forKey:@"StreamState"];

  [v9 encodeBool:self->_storeCurrentFileInMemory forKey:@"StoreCurrentFileInMemory"];
  [v9 encodedData];
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:]( self->_unzipPath,  "stringByAppendingPathComponent:",  @"com.apple.StreamingUnzipResumptionData");
  uint64_t v32 = (char *)objc_claimAutoreleasedReturnValue();
  SZGetLoggingHandle();
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v34 = v33;
  if (!v31)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v78 = v32;
      _os_log_error_impl( &dword_1870CA000,  v34,  OS_LOG_TYPE_ERROR,  "Failed to create archive for resumption data to path %@",  buf,  0xCu);
    }

    __int128 v69 = *MEMORY[0x1896074F8];
    __int128 v70 = v32;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    __int128 v37 = (id)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[StreamingUnzipState serializeState]",  424LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v37,  @"Failed to create archive for resumption data to path %@",  v54,  (uint64_t)v32);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    int v60 = [v31 length];
    currentOffset = self->_currentOffset;
    *(_DWORD *)int buf = 134218240;
    uint64_t v78 = (const char *)v60;
    size_t v79 = 2048;
    size_t v80 = currentOffset;
    _os_log_debug_impl( &dword_1870CA000,  v34,  OS_LOG_TYPE_DEBUG,  "Serializing %lu bytes of resumption data for offset %llu",  buf,  0x16u);
  }

  int v64 = 0LL;
  uint32_t v35 = 1;
  __int128 v36 = [v31 writeToFile:v32 options:1 error:&v64];
  __int128 v37 = v64;
  if ((v36 & 1) == 0)
  {
    SZGetLoggingHandle();
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412546;
      uint64_t v78 = v32;
      size_t v79 = 2112;
      size_t v80 = (unint64_t)v37;
      _os_log_error_impl( &dword_1870CA000,  v38,  OS_LOG_TYPE_ERROR,  "Failed to save resumption data to path %@: %@",  buf,  0x16u);
    }

    uint64_t v67 = *MEMORY[0x1896074F8];
    uint64_t v68 = v32;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[StreamingUnzipState serializeState]",  431LL,  @"SZExtractorErrorDomain",  1LL,  v37,  v39,  @"Failed to save resumption data to path %@: %@",  v40,  (uint64_t)v32);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
    uint32_t v35 = 0;
  }

  if (v35) {
    return 0LL;
  }
  return v2;
}

LABEL_160:
              stat v143 = [v59 decodePropertyListForKey:@"StreamInfoDict"];
              stat v144 = (void *)*((void *)v9 + 43);
              *((void *)v9 + 43) = v143;

              size_t v145 = (void *)*((void *)v9 + 43);
              if (v145)
              {
                [v145 objectForKeyedSubscript:@"RecordCount"];
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                *((void *)v9 + 53) = [v146 unsignedLongLongValue];

                [*((id *)v9 + 43) objectForKeyedSubscript:@"TotalUncompressedBytes"];
                __int16 v147 = (void *)objc_claimAutoreleasedReturnValue();
                *((void *)v9 + 54) = [v147 unsignedLongLongValue];
              }

              uint64_t v148 = [v59 decodeObjectOfClass:objc_opt_class() forKey:@"LastChunkPartialHash"];
              off_t v149 = (void *)*((void *)v9 + 44);
              *((void *)v9 + 44) = v148;

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"UnsureData"];
              uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue();
              __int16 v151 = [v150 mutableCopy];
              uint64_t v152 = (void *)*((void *)v9 + 45);
              *((void *)v9 + 45) = v151;

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"InMemoryFileData"];
              uint64_t v153 = (void *)objc_claimAutoreleasedReturnValue();
              __int16 v154 = [v153 mutableCopy];
              v155 = (void *)*((void *)v9 + 46);
              *((void *)v9 + 46) = v154;

              __n = 0LL;
              uint32_t v59 = v59;
              __int16 v156 = [v59 decodeBytesForKey:@"LocalFileRecord" returnedLength:&__n];
              if (v156)
              {
                int v157 = __n;
                if (__n)
                {
                  v158 = (const void *)v156;
                  uint64_t v159 = (void *)*((void *)v9 + 47);
                  if (*((void *)v9 + 15) < __n)
                  {
                    uint64_t v159 = reallocf(v159, __n);
                    *((void *)v9 + 47) = v159;
                    if (!v159)
                    {
                      SZGetLoggingHandle();
                      v194 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)int buf = 0;
                        _os_log_error_impl( &dword_1870CA000,  v194,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  buf,  2u);
                      }

                      _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1160LL,  (void *)*MEMORY[0x189607688],  12LL,  0LL,  0LL,  @"Could not allocate memory for local file record",  v195,  v217);
LABEL_230:
                      unsigned __int16 v123 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_193;
                    }

                    int v157 = __n;
                    *((void *)v9 + 15) = __n;
                  }

                  memcpy(v159, v158, v157);
                }
              }

              v9[452] = (*(_BYTE *)(*((void *)v9 + 47) + 6LL) & 8) != 0;
              __n = 0LL;
              uint32_t v59 = v59;
              if ([v59 decodeBytesForKey:@"DataDescriptorUnion" returnedLength:&__n] && __n)
              {
                *((void *)v9 + 4_Block_object_dispose((const void *)(v30 - 176), 8) = calloc(1uLL, 0x18uLL);
                __memcpy_chk();
              }

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"StageBytesComplete"];
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              *((void *)v9 + 50) = [v160 unsignedLongLongValue];

              *((void *)v9 + 51) = v234;
              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"StreamState"];
              uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue();
              v9[450] = [v161 unsignedCharValue];

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentCRC32"];
              uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue();
              *((void *)v9 + 55) = [v162 unsignedLongValue];

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"RecordsProcessed"];
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              *((void *)v9 + 52) = [v163 unsignedShortValue];

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"LocalFileMode"];
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              *((_WORD *)v9 + 224) = [v164 unsignedShortValue] & 0xF1FF;

              v9[451] = [v59 decodeBoolForKey:@"StoreCurrentFileInMemory"];
              *((void *)v9 + 6) = *((void *)v9 + 51);
              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOutputFileOffset"];
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              *((void *)v9 + 9) = [v165 unsignedLongLongValue];

              [v59 decodeObjectOfClass:objc_opt_class() forKey:@"TotalFileSizeWritten"];
              int v166 = (void *)objc_claimAutoreleasedReturnValue();
              *((void *)v9 + 10) = [v166 unsignedLongLongValue];

              int v167 = (_WORD *)*((void *)v9 + 47);
              if (v167)
              {
                int v168 = GetFileNameStringFromLocalFileRecord(v167);
                if (!v168)
                {
                  SZGetLoggingHandle();
                  uint64_t v191 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)int buf = 0;
                    _os_log_error_impl( &dword_1870CA000,  v191,  OS_LOG_TYPE_ERROR,  "Failed to get path from current local file record.",  buf,  2u);
                  }

                  v262 = *MEMORY[0x1896074F8];
                  v263 = v227;
                  [MEMORY[0x189603F68] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
                  unint64_t v192 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1202LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v192,  @"Failed to get path from current local file record.",  v193,  v217);
                  int v178 = (id)objc_claimAutoreleasedReturnValue();

                  __int128 v130 = v43;
                  goto LABEL_247;
                }

                __int128 v130 = (void *)v168;
                [v227 stringByAppendingPathComponent:v168];
                __errnumb = (void *)objc_claimAutoreleasedReturnValue();
                SZGetLoggingHandle();
                v169 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v209 = *((void *)v9 + 9);
                  *(_DWORD *)int buf = 138412546;
                  *(void *)v267 = __errnumb;
                  *(_WORD *)&v267[8] = 2048;
                  *(void *)v268 = v209;
                  _os_log_debug_impl( &dword_1870CA000,  v169,  OS_LOG_TYPE_DEBUG,  "Resuming %@ at offset %lld",  buf,  0x16u);
                }

                if ([v59 decodeBoolForKey:@"OpenCurrentOutputFile"])
                {
                  v170 = v9[454];
                  v236 = v43;
                  int v171 = +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  __errnumb,  2LL,  0LL,  0LL,  v170,  &v236);
                  v235 = v236;

                  v172 = (void *)*((void *)v9 + 49);
                  *((void *)v9 + 49) = v171;

                  if (!*((void *)v9 + 49))
                  {
                    SZGetLoggingHandle();
                    v204 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)int buf = 138412290;
                      *(void *)v267 = __errnumb;
                      _os_log_error_impl( &dword_1870CA000,  v204,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  buf,  0xCu);
                    }

                    v260 = *MEMORY[0x1896074F8];
                    v261 = __errnumb;
                    [MEMORY[0x189603F68] dictionaryWithObjects:&v261 forKeys:&v260 count:1];
                    uint64_t v43 = (id)objc_claimAutoreleasedReturnValue();
                    _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1213LL,  @"SZExtractorErrorDomain",  1LL,  v235,  v43,  @"Failed to open output file at path %@",  v205,  (uint64_t)__errnumb);
                    goto LABEL_244;
                  }

                  uint64_t v43 = v235;
                }

                uint64_t v173 = *(unsigned __int16 *)(*((void *)v9 + 47) + 8LL);
                if (v173 != 8 && v173 != 99 && v173 != 14)
                {
LABEL_185:
                  if (!*((void *)v9 + 9)
                    || (uint64_t v176 = (void *)*((void *)v9 + 49)) == 0LL
                    || (unint64_t v177 = objc_msgSend(v176, "setCurrentOffset:error:"),
                        int v178 = v43,
                        v43,
                        uint64_t v43 = v178,
                        (v177 & 1) != 0))
                  {

LABEL_194:
LABEL_195:

                    BOOL v180 = v219;
LABEL_196:

                    goto LABEL_69;
                  }

                  goto LABEL_246;
                }

                [v59 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedCompressionState"];
                v235 = (id)objc_claimAutoreleasedReturnValue();
                if (!v235)
                {
                  SZGetLoggingHandle();
                  uint64_t v197 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)int buf = 0;
                    _os_log_error_impl( &dword_1870CA000,  v197,  OS_LOG_TYPE_ERROR,  "Failed to get serialized compression state from save data",  buf,  2u);
                  }

                  _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1222LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Failed to get serialized compression state from save data",  v198,  v217);
                  int v178 = (id)objc_claimAutoreleasedReturnValue();
                  v235 = 0LL;
                  goto LABEL_245;
                }

                uint64_t v174 = [v235 length];
                v175 = malloc(v174);
                [v235 getBytes:v175 length:v174];
                if (compression_stream_is_state_valid())
                {
                  *((void *)v9 + 5) = v175;

                  goto LABEL_185;
                }

                SZGetLoggingHandle();
                v207 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)int buf = 0;
                  _os_log_error_impl( &dword_1870CA000,  v207,  OS_LOG_TYPE_ERROR,  "Compression save state was not valid.",  buf,  2u);
                }

                _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1231LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Compression save state was not valid.",  v208,  v217);
LABEL_244:
                int v178 = (id)objc_claimAutoreleasedReturnValue();
LABEL_245:

LABEL_246:
LABEL_247:
                uint64_t v43 = v178;
                goto LABEL_194;
              }

              SZGetLoggingHandle();
              v184 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 138412290;
                *(void *)v267 = v227;
                _os_log_error_impl( &dword_1870CA000,  v184,  OS_LOG_TYPE_ERROR,  "Invalid state in resumption data at path %@",  buf,  0xCu);
              }

              _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1377LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Invalid state in resumption data at path %@",  v185,  (uint64_t)v227);
              goto LABEL_230;
            }

            SZGetLoggingHandle();
            v179 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
            {
              int v206 = [*((id *)v9 + 12) count];
              *(_DWORD *)int buf = 134218240;
              *(void *)v267 = v93;
              *(_WORD *)&v267[8] = 2048;
              *(void *)v268 = v206;
              _os_log_error_impl( &dword_1870CA000,  v179,  OS_LOG_TYPE_ERROR,  "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            v238 = v43;
            _RemoveAndRecreateDirectoryAtPath(v227, &v238);
            __int128 v126 = v238;
          }

          else
          {
            int v124 = v90;
            SZGetLoggingHandle();
            uint64_t v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109634;
              *(_DWORD *)v267 = v124;
              *(_WORD *)&v267[4] = 1024;
              *(_DWORD *)&v267[6] = 8;
              *(_WORD *)v268 = 2112;
              *(void *)&v268[2] = v227;
              _os_log_error_impl( &dword_1870CA000,  v125,  OS_LOG_TYPE_ERROR,  "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            v240 = v43;
            _RemoveAndRecreateDirectoryAtPath(v227, &v240);
            __int128 v126 = v240;
          }

          unsigned __int16 v123 = v126;
LABEL_193:
          __int128 v130 = v43;
          uint64_t v43 = v123;
          goto LABEL_194;
        }

        int v119 = (void *)*MEMORY[0x189607460];
        [v86 domain];
        CFIndex v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119 == v120)
        {
          __int128 v127 = [v221 code];

          if (v127 == 260)
          {
LABEL_138:
            [MEMORY[0x1896078A8] defaultManager];
            __int128 v129 = (void *)objc_claimAutoreleasedReturnValue();
            v244 = v233;
            [v129 contentsOfDirectoryAtPath:v227 error:&v244];
            __int128 v130 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v131 = v244;

            if (v130 && ![v130 count])
            {
              uint64_t v43 = 0LL;
            }

            else
            {
              v243 = v131;
              _RemoveAndRecreateDirectoryAtPath(v227, &v243);
              uint64_t v43 = v243;
            }

            v218 = 0LL;
            uint32_t v59 = 0LL;
            goto LABEL_194;
          }
        }

        else
        {
        }

        SZGetLoggingHandle();
        uint64_t v128 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 138412546;
          *(void *)v267 = v219;
          *(_WORD *)&v267[8] = 2112;
          *(void *)v268 = v221;
          _os_log_error_impl( &dword_1870CA000,  v128,  OS_LOG_TYPE_ERROR,  "Failed to read resumption data from path %@: %@; starting from offset 0",
            buf,
            0x16u);
        }

        goto LABEL_138;
      }

      off_t st_size = v257.st_size;
      __int128 v98 = v70;
      __int128 v99 = getxattr( (const char *)[v98 fileSystemRepresentation],  "com.apple.StreamingPassthroughResumptionData",  0,  0,  0,  1);
      if (v99 == -1)
      {
        if (*__error() == 2 || *__error() == 93)
        {
          v254 = v233;
          _RemoveAndRecreateDirectoryAtPath(v98, &v254);
          uint64_t v43 = v254;

          goto LABEL_68;
        }

        __errnuma = *__error();
        SZGetLoggingHandle();
        __int128 v135 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
        {
          v196 = strerror(__errnuma);
          *(_DWORD *)int buf = 136315650;
          *(void *)v267 = "com.apple.StreamingPassthroughResumptionData";
          *(_WORD *)&v267[8] = 2112;
          *(void *)v268 = v98;
          *(_WORD *)&v268[8] = 2080;
          v269 = v196;
          _os_log_error_impl( &dword_1870CA000,  v135,  OS_LOG_TYPE_ERROR,  "Failed to get size of xattr %s from path %@: %s",  buf,  0x20u);
        }

        __int128 v136 = (void *)*MEMORY[0x189607688];
        v271 = *MEMORY[0x1896074F8];
        v272 = v98;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(__errnuma);
        _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  976LL,  v136,  __errnuma,  0LL,  v75,  @"Failed to get size of xattr %s from path %@: %s",  v137,  (uint64_t)"com.apple.StreamingPassthroughResumptionData");
        goto LABEL_66;
      }

      uint32_t v100 = v99;
      if (v99 < 1 || ![*((id *)v9 + 12) count])
      {
        uint32_t v59 = 0LL;
        int v105 = v233;
        goto LABEL_115;
      }

      [MEMORY[0x189603FB8] dataWithCapacity:v100];
      __int128 v101 = (void *)objc_claimAutoreleasedReturnValue();
      [v101 setLength:v100];
      v225 = v98;
      __int128 v102 = (const char *)[v225 fileSystemRepresentation];
      v228 = v101;
      __int128 v103 = getxattr( v102,  "com.apple.StreamingPassthroughResumptionData",  (void *)[v228 mutableBytes],  v100,  0,  1);
      if (v103 == v100)
      {
        v222 = v225;
        if (removexattr( (const char *)[v222 fileSystemRepresentation],  "com.apple.StreamingPassthroughResumptionData",  1))
        {
          SZGetLoggingHandle();
          __int128 v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v201 = [v222 fileSystemRepresentation];
            unint64_t v202 = __error();
            uint64_t v203 = strerror(*v202);
            *(_DWORD *)int buf = 136315650;
            *(void *)v267 = "com.apple.StreamingPassthroughResumptionData";
            *(_WORD *)&v267[8] = 2080;
            *(void *)v268 = v201;
            *(_WORD *)&v268[8] = 2080;
            v269 = v203;
            _os_log_error_impl( &dword_1870CA000,  v104,  OS_LOG_TYPE_ERROR,  "Failed to remove EA %s from %s: %s",  buf,  0x20u);
          }
        }

        v252 = v233;
        uint32_t v59 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v228 error:&v252];
        int v105 = v252;

        [v59 setDecodingFailurePolicy:0];
        if (v59)
        {
          __int128 v106 = [v59 decodeIntForKey:@"SerializationVersion"];
          if (v106 == 8)
          {
            stat v107 = *((void *)v9 + 7);
            if (v107) {
              int v108 = (st_size - (unint64_t)(st_size > 0)) / v107;
            }
            else {
              int v108 = 0LL;
            }
            if (v108 < [*((id *)v9 + 12) count])
            {
              __n = 0LL;
              uint32_t v59 = v59;
              v187 = (const void *)[v59 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (!v187 || !__n)
              {
LABEL_217:

LABEL_115:
                v9[450] = 5;
                *((void *)v9 + 6) = st_size;
                int v109 = (void *)*((void *)v9 + 45);
                *((void *)v9 + 45) = 0LL;

                int v110 = (void *)*((void *)v9 + 46);
                *((void *)v9 + 46) = 0LL;

                *((void *)v9 + 51) = st_size;
                int v111 = v9[454];
                int v112 = v105;
                v246 = v105;
                size_t v113 = +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  v98,  9LL,  0LL,  0LL,  v111,  &v246);
                uint64_t v43 = v246;

                __int16 v114 = (void *)*((void *)v9 + 49);
                *((void *)v9 + 49) = v113;

                if (!*((void *)v9 + 49))
                {
                  SZGetLoggingHandle();
                  uint64_t v115 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 138412290;
                    *(void *)v267 = v98;
                    _os_log_error_impl( &dword_1870CA000,  v115,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  buf,  0xCu);
                  }

                  v264 = *MEMORY[0x1896074F8];
                  v265 = v98;
                  [MEMORY[0x189603F68] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
                  uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
                  CFRange v118 = _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1060LL,  @"SZExtractorErrorDomain",  1LL,  v43,  v116,  @"Failed to open output file at path %@",  v117,  (uint64_t)v98);

                  uint64_t v43 = (id)v118;
                }

                goto LABEL_69;
              }

              if (__n == gHashContextSizes[*__errnum])
              {
                memcpy(v9 + 136, v187, __n);
                uint64_t v188 = *((void *)v9 + 7);
                uint64_t v189 = st_size;
                if (v188) {
                  uint64_t v189 = st_size % v188;
                }
                *((void *)v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = v189;
                goto LABEL_217;
              }

              SZGetLoggingHandle();
              uint64_t v199 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
              {
                v214 = *__errnum;
                unsigned int v215 = gHashStringNames[v214];
                unint64_t v216 = (const char *)gHashContextSizes[v214];
                *(_DWORD *)int buf = 136315650;
                *(void *)v267 = v215;
                *(_WORD *)&v267[8] = 2048;
                *(void *)v268 = __n;
                *(_WORD *)&v268[8] = 2048;
                v269 = v216;
                _os_log_error_impl( &dword_1870CA000,  v199,  OS_LOG_TYPE_ERROR,  "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                  buf,
                  0x20u);
              }

              v200 = v105;
              v247 = v105;
              _RemoveAndRecreateDirectoryAtPath(v222, &v247);
              uint64_t v43 = v247;

LABEL_223:
              BOOL v180 = v228;
              goto LABEL_196;
            }

            SZGetLoggingHandle();
            uint64_t v190 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
            {
              int v210 = [*((id *)v9 + 12) count];
              *(_DWORD *)int buf = 134218240;
              *(void *)v267 = v108;
              *(_WORD *)&v267[8] = 2048;
              *(void *)v268 = v210;
              _os_log_error_impl( &dword_1870CA000,  v190,  OS_LOG_TYPE_ERROR,  "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            v249 = v105;
            __int128 v134 = &v249;
          }

          else
          {
            uint64_t v182 = v106;
            SZGetLoggingHandle();
            v183 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109634;
              *(_DWORD *)v267 = v182;
              *(_WORD *)&v267[4] = 1024;
              *(_DWORD *)&v267[6] = 8;
              *(_WORD *)v268 = 2112;
              *(void *)&v268[2] = v222;
              _os_log_error_impl( &dword_1870CA000,  v183,  OS_LOG_TYPE_ERROR,  "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            v251 = v105;
            __int128 v134 = &v251;
          }
        }

        else
        {
          SZGetLoggingHandle();
          int64x2_t v181 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 138412290;
            *(void *)v267 = v105;
            _os_log_error_impl( &dword_1870CA000,  v181,  OS_LOG_TYPE_ERROR,  "Unable to deserialize resumption data (%@); resuming from offset 0",
              buf,
              0xCu);
          }

          uint32_t v59 = 0LL;
          v250 = v105;
          __int128 v134 = &v250;
        }

        v233 = v105;
      }

      else
      {
        __int128 v132 = v103;
        SZGetLoggingHandle();
        __int128 v133 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 134218754;
          *(void *)v267 = v100;
          *(_WORD *)&v267[8] = 2048;
          *(void *)v268 = v132;
          *(_WORD *)&v268[8] = 2080;
          v269 = "com.apple.StreamingPassthroughResumptionData";
          LOWORD(v270[0]) = 2112;
          *(void *)((char *)v270 + 2) = v225;
          _os_log_error_impl( &dword_1870CA000,  v133,  OS_LOG_TYPE_ERROR,  "Expected to read %ld bytes but got %ld for EA %s on %@; resuming from offset 0",
            buf,
            0x2Au);
        }

        uint32_t v59 = 0LL;
        v253 = v233;
        __int128 v134 = &v253;
      }

      _RemoveAndRecreateDirectoryAtPath(v225, v134);
      uint64_t v43 = *v134;

      goto LABEL_223;
    }
  }

  else
  {
  }

  SZGetLoggingHandle();
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 138412290;
    *(void *)v267 = v10;
    _os_log_error_impl( &dword_1870CA000,  v40,  OS_LOG_TYPE_ERROR,  "Options dictionary supplied has one or more options with an incorrect type: %@",  buf,  0xCu);
  }

  _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  864LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  @"Options dictionary supplied has one or more options with an incorrect type: %@",  v41,  (uint64_t)v10);
  int v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = v42;
  if (!a4) {
    goto LABEL_40;
  }
  __int16 v44 = v42;
  uint64_t v43 = v44;
LABEL_38:
  uint32_t v48 = 0LL;
  *a4 = v44;
LABEL_41:

LABEL_42:
  return v48;
}

uint64_t _RemoveAndRecreateDirectoryAtPath(void *a1, void *a2)
{
  *(void *)&v70[13] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  uint64_t v65 = *MEMORY[0x189607500];
  [MEMORY[0x189607968] numberWithUnsignedShort:16877];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v66 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = v3;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 256);
  if (v7 < 0)
  {
    uint64_t v12 = *__error();
    SZGetLoggingHandle();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = [v6 fileSystemRepresentation];
      size_t v54 = strerror(v12);
      *(_DWORD *)int buf = 136315394;
      uint64_t v68 = v53;
      __int16 v69 = 2080;
      *(void *)__int128 v70 = v54;
      _os_log_error_impl(&dword_1870CA000, v13, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
    }

    uint64_t v14 = (void *)*MEMORY[0x189607688];
    uint64_t v15 = [v6 fileSystemRepresentation];
    strerror(v12);
    _CreateError( (uint64_t)"_GetDataProtectionClassForPath",  586LL,  v14,  v12,  0LL,  0LL,  @"Failed to open %s : %s",  v16,  v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v8 = v7;
    uint64_t v9 = fcntl(v7, 63);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = v9;
      close(v8);

      int v11 = 1;
      goto LABEL_14;
    }

    uint64_t v18 = *__error();
    SZGetLoggingHandle();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = [v6 fileSystemRepresentation];
      CFIndex v58 = strerror(v18);
      *(_DWORD *)int buf = 136315394;
      uint64_t v68 = v57;
      __int16 v69 = 2080;
      *(void *)__int128 v70 = v58;
      _os_log_error_impl( &dword_1870CA000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to get protection class on %s : %s",  buf,  0x16u);
    }

    uint64_t v14 = (void *)*MEMORY[0x189607688];
    uint64_t v20 = [v6 fileSystemRepresentation];
    strerror(v18);
    _CreateError( (uint64_t)"_GetDataProtectionClassForPath",  593LL,  v14,  v18,  0LL,  0LL,  @"Failed to get protection class on %s : %s",  v21,  v20);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    close(v8);
  }

  id v22 = v17;

  id v23 = v22;
  uint64_t v24 = [v23 domain];
  if (v14 != (void *)v24)
  {
    uint64_t v25 = (os_log_s *)v24;
    goto LABEL_29;
  }

  uint64_t v26 = [v23 code];

  if (v26 != 2) {
    goto LABEL_30;
  }

  int v11 = 0;
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_14:
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  id v64 = 0LL;
  char v28 = [v27 removeItemAtPath:v6 error:&v64];
  id v23 = v64;

  if ((v28 & 1) != 0)
  {
LABEL_15:
    __int16 v29 = v23;
    [MEMORY[0x1896078A8] defaultManager];
    size_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v63 = v23;
    char v31 = [v30 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v5 error:&v63];
    id v23 = v63;

    if ((v31 & 1) != 0)
    {
      if (!v11)
      {
        uint64_t v45 = 1LL;
        goto LABEL_42;
      }

      id v32 = v6;
      int v33 = open((const char *)[v32 fileSystemRepresentation], 256);
      if (v33 < 0)
      {
        uint64_t v46 = *__error();
        SZGetLoggingHandle();
        id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v61 = [v32 fileSystemRepresentation];
          size_t v62 = strerror(v46);
          *(_DWORD *)int buf = 136315394;
          uint64_t v68 = v61;
          __int16 v69 = 2080;
          *(void *)__int128 v70 = v62;
          _os_log_error_impl(&dword_1870CA000, v47, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
        }

        uint32_t v48 = (void *)*MEMORY[0x189607688];
        uint64_t v49 = [v32 fileSystemRepresentation];
        strerror(v46);
        _CreateError( (uint64_t)"_SetDataProtectionClassOnPath",  615LL,  v48,  v46,  0LL,  0LL,  @"Failed to open %s : %s",  v50,  v49);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        int v34 = v33;
        if (!fcntl(v33, 64, v10))
        {
          close(v34);
          char v52 = 1;
          id v51 = v23;
LABEL_38:

          id v55 = v51;
          if ((v52 & 1) != 0)
          {
            uint64_t v45 = 1LL;
            id v23 = v55;
            goto LABEL_42;
          }

          id v23 = v55;
          if (!a2)
          {
LABEL_41:
            uint64_t v45 = 0LL;
            goto LABEL_42;
          }

          goto LABEL_31;
        }

        uint64_t v35 = *__error();
        SZGetLoggingHandle();
        __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v59 = [v32 fileSystemRepresentation];
          int v60 = strerror(v35);
          *(_DWORD *)int buf = 136315650;
          uint64_t v68 = v59;
          __int16 v69 = 1024;
          *(_DWORD *)__int128 v70 = v10;
          v70[2] = 2080;
          *(void *)&v70[3] = v60;
          _os_log_error_impl( &dword_1870CA000,  v36,  OS_LOG_TYPE_ERROR,  "Failed to set protection class on %s to %d: %s",  buf,  0x1Cu);
        }

        __int128 v37 = (void *)*MEMORY[0x189607688];
        uint64_t v38 = [v32 fileSystemRepresentation];
        strerror(v35);
        _CreateError( (uint64_t)"_SetDataProtectionClassOnPath",  621LL,  v37,  v35,  0LL,  0LL,  @"Failed to set protection class on %s to %d: %s",  v39,  v38);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        close(v34);
      }

      id v51 = v40;

      char v52 = 0;
      goto LABEL_38;
    }

    SZGetLoggingHandle();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)int buf = 138412546;
    uint64_t v68 = (uint64_t)v6;
    __int16 v69 = 2112;
    *(void *)__int128 v70 = v23;
    uint64_t v43 = "Failed to create extraction directory at path %@: %@";
    goto LABEL_44;
  }

  id v41 = (void *)*MEMORY[0x189607460];
  [v23 domain];
  int v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 == v42)
  {
    uint64_t v44 = [v23 code];

    if (v44 == 4)
    {

      id v23 = 0LL;
      goto LABEL_15;
    }
  }

  else
  {
  }

  SZGetLoggingHandle();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 138412546;
    uint64_t v68 = (uint64_t)v6;
    __int16 v69 = 2112;
    *(void *)__int128 v70 = v23;
    uint64_t v43 = "Failed to remove bad extraction path at %@: %@";
LABEL_44:
    _os_log_error_impl(&dword_1870CA000, v25, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
  }

uint64_t _ValidateDictionaryKeyValueType(void *a1, void *a2, objc_class *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [a1 objectForKey:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    SZGetLoggingHandle();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a3);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_error_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_ERROR,  "Value of key %@ in options dictionary was not an object of type %@. Was %@",  (uint8_t *)&v13,  0x20u);
    }

    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 1LL;
  }

  return v7;
}

id FetchGroupIDs(void *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v2 = getgroups(16, v19);
  if (v2 != -1)
  {
    int v3 = v2;
    uint64_t v4 = (void *)objc_opt_new();
    if (v3 >= 1)
    {
      uint64_t v5 = v3;
      id v6 = v19;
      do
      {
        unsigned int v7 = *v6++;
        [MEMORY[0x189607968] numberWithUnsignedInt:v7];
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v8];

        --v5;
      }

      while (v5);
    }

    uint64_t v9 = (void *)[v4 copy];
    uint64_t v10 = 0LL;
    if (!a1) {
      goto LABEL_12;
    }
LABEL_10:
    if (!v9) {
      *a1 = v10;
    }
    goto LABEL_12;
  }

  uint64_t v11 = *__error();
  SZGetLoggingHandle();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136315138;
    uint64_t v18 = strerror(v11);
    _os_log_error_impl( &dword_1870CA000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to get current group access list: %s",  buf,  0xCu);
  }

  int v13 = (void *)*MEMORY[0x189607688];
  id v14 = strerror(v11);
  _CreateError( (uint64_t)"FetchGroupIDs",  250LL,  v13,  v11,  0LL,  0LL,  @"Failed to get current group access list: %s",  v15,  (uint64_t)v14);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = 0LL;
  uint64_t v9 = 0LL;
  if (a1) {
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

void sub_1870EB248( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id location)
{
}

LABEL_9:
  [v9 invalidate];
  uint64_t v12 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void sub_1870EBA18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
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

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1896033E0](*(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

uint64_t compression_stream_get_state_size()
{
  return MEMORY[0x1896149C0]();
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

uint64_t compression_stream_is_state_valid()
{
  return MEMORY[0x1896149D8]();
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

uint64_t compression_stream_reinit()
{
  return MEMORY[0x1896149E8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
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

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FB428](__stream, a2, *(void *)&__whence);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FB478](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
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

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1895FB578](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FBA90](a1, a2);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1895FBF60](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1895FCD38](path, name, *(void *)&options);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FCD78](a1, *(void *)&a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1895FCD98]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t objc_msgSend__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_reservation_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_reservation_error_);
}

uint64_t objc_msgSend__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_error_);
}

uint64_t objc_msgSend__openCurrentOutputFDForPath_withOpenFlags_mode_performCachedWrites_quarantineInfo_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__openCurrentOutputFDForPath_withOpenFlags_mode_performCachedWrites_quarantineInfo_error_);
}

uint64_t objc_msgSend_fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error_);
}

uint64_t objc_msgSend_reserveAsyncOperationForFileSize_path_group_operationPendingForPath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_reserveAsyncOperationForFileSize_path_group_operationPendingForPath_);
}

uint64_t objc_msgSend_setupUnzipperWithOutputPath_sandboxExtensionToken_options_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setupUnzipperWithOutputPath_sandboxExtensionToken_options_withReply_);
}

uint64_t objc_msgSend_synchronousFileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_synchronousFileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_error_);
}