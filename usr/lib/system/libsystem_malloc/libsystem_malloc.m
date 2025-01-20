uint64_t bitarray_size(unsigned int a1)
{
  if (a1 < 0xA) {
    return 64LL;
  }
  else {
    return 8LL
  }
         * (*(_DWORD *)((char *)&levels_num_words
}

void *bitarray_create(unsigned int a1)
{
  if (a1 < 0xA) {
    size_t v1 = 64LL;
  }
  else {
    size_t v1 = 8LL
  }
       * (*(_DWORD *)((char *)&levels_num_words
  return j__calloc(1uLL, v1);
}

uint64_t bitarray_get(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    a1 += 8LL
    unsigned int v3 = (a3 >> 6) & 7;
  }

  else
  {
    unsigned int v3 = a3 >> 6;
  }

  return (*(void *)(a1 + 8LL * v3) >> a3) & 1LL;
}

uint64_t bitarray_set(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 <= 9)
  {
    uint64_t v3 = a3 >> 6;
    uint64_t v4 = *(void *)(a1 + 8LL * v3);
    uint64_t v5 = v4 | (1LL << a3);
    if (v4 != v5)
    {
      *(void *)(a1 + 8 * v3) = v5;
      return 1LL;
    }

    return 0LL;
  }

  unint64_t v6 = (a2 - 10) / 9uLL;
  unsigned int v7 = a3 >> 9;
  uint64_t v8 = a1 + 8LL * levels_num_words[v6] + 64LL * (a3 >> 9);
  uint64_t v9 = (a3 >> 6) & 7;
  uint64_t v10 = *(void *)(v8 + 8LL * v9);
  uint64_t v11 = v10 | (1LL << a3);
  if (v10 == v11) {
    return 0LL;
  }
  *(void *)(v8 + 8 * v9) = v11;
  if (v10) {
    return 1LL;
  }
  switch((int)v6)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_16;
    case 2:
      goto LABEL_14;
    case 3:
      uint64_t v14 = a1 + 64LL * (a3 >> 18) + 16810048;
      uint64_t v15 = (a3 >> 15) & 7;
      uint64_t v16 = *(void *)(v14 + 8LL * v15);
      uint64_t v12 = 1LL;
      uint64_t v17 = v16 | (1LL << v7);
      if (v16 == v17) {
        return v12;
      }
      *(void *)(v14 + 8 * v15) = v17;
      if (v16) {
        return 1LL;
      }
      unsigned int v7 = a3 >> 18;
LABEL_14:
      uint64_t v18 = (v7 >> 6) & 7;
      uint64_t v12 = 1LL;
      uint64_t v19 = 1LL << v7;
      v7 >>= 9;
      uint64_t v20 = a1 + 64LL * v7 + 32832;
      uint64_t v21 = *(void *)(v20 + 8LL * v18);
      uint64_t v22 = v19 | v21;
      if (v21 == v22) {
        return v12;
      }
      *(void *)(v20 + 8 * v18) = v22;
      if (v21) {
        return 1LL;
      }
LABEL_16:
      uint64_t v23 = (v7 >> 6) & 7;
      uint64_t v12 = 1LL;
      uint64_t v24 = 1LL << v7;
      v7 >>= 9;
      uint64_t v25 = a1 + 64LL * v7 + 64;
      uint64_t v26 = *(void *)(v25 + 8LL * v23);
      uint64_t v27 = v24 | v26;
      if (v26 == v27) {
        return v12;
      }
      *(void *)(v25 + 8 * v23) = v27;
      if (v26) {
        return 1LL;
      }
LABEL_10:
      *(void *)(a1 + 8LL * ((v7 >> 6) & 7)) |= 1LL << v7;
      uint64_t v12 = 1LL;
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }

  return v12;
}

uint64_t bitarray_zap(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 <= 9)
  {
    uint64_t v3 = a3 >> 6;
    uint64_t v4 = *(void *)(a1 + 8LL * v3);
    uint64_t v5 = v4 & ~(1LL << a3);
    if (v4 != v5)
    {
      *(void *)(a1 + 8 * v3) = v5;
      return 1LL;
    }

    return 0LL;
  }

  unint64_t v6 = (a2 - 10) / 9uLL;
  unsigned int v7 = (void *)(a1 + 8LL * levels_num_words[v6] + 64LL * (a3 >> 9));
  uint64_t v8 = (a3 >> 6) & 7;
  uint64_t v9 = v7[v8];
  uint64_t v10 = v9 & ~(1LL << a3);
  if (v9 == v10) {
    return 0LL;
  }
  v7[v8] = v10;
  if (*v7) {
    return 1LL;
  }
  unsigned int v13 = a3 >> 9;
  uint64_t v14 = 1LL;
  do
  {
    if (v14 == 8)
    {
      if (v10) {
        return 1LL;
      }
      goto LABEL_16;
    }
  }

  while (!v7[v14++]);
  uint64_t v11 = 1LL;
LABEL_16:
  switch((int)v6)
  {
    case 0:
      goto LABEL_17;
    case 1:
      goto LABEL_33;
    case 2:
      goto LABEL_24;
    case 3:
      unsigned int v13 = a3 >> 18;
      uint64_t v16 = (uint64_t *)(a1 + 64LL * (a3 >> 18) + 16810048);
      uint64_t v17 = (a3 >> 15) & 7;
      uint64_t v18 = v16[v17];
      uint64_t v11 = 1LL;
      uint64_t v19 = v18 & ~(1LL << (a3 >> 9));
      if (v18 == v19) {
        return v11;
      }
      v16[v17] = v19;
      if (v19) {
        return 1LL;
      }
      uint64_t v20 = *v16;
      if (*v16) {
        return 1LL;
      }
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }

  while (v20 != 7)
  {
    if (*(void *)(((a3 >> 12) & 0xFFFC0) + a1 + 16810056 + 8 * v20++))
    {
      break;
    }
  }

LABEL_24:
  unsigned int v22 = v13 >> 9;
  uint64_t v23 = (uint64_t *)(a1 + 64LL * (v13 >> 9) + 32832);
  uint64_t v24 = (v13 >> 6) & 7;
  uint64_t v25 = v23[v24];
  uint64_t v11 = 1LL;
  uint64_t v26 = v25 & ~(1LL << v13);
  if (v25 != v26)
  {
    v23[v24] = v26;
    if (v26) {
      return 1LL;
    }
    uint64_t v27 = *v23;
    if (*v23) {
      return 1LL;
    }
    uint64_t v28 = ((v13 >> 3) & 0xFFFC0) + a1 + 32840;
    do
    {
      if (v27 == 7)
      {
        unsigned int v13 = v22;
        goto LABEL_33;
      }
    }

    while (!*(void *)(v28 + 8 * v27++));
    unsigned int v13 = v22;
LABEL_33:
    unsigned int v30 = v13 >> 9;
    v31 = (uint64_t *)(a1 + 64LL * (v13 >> 9) + 64);
    uint64_t v32 = (v13 >> 6) & 7;
    uint64_t v33 = v31[v32];
    uint64_t v11 = 1LL;
    uint64_t v34 = v33 & ~(1LL << v13);
    if (v33 != v34)
    {
      v31[v32] = v34;
      if (!v34)
      {
        uint64_t v35 = *v31;
        if (!*v31)
        {
          uint64_t v36 = ((v13 >> 3) & 0xFFFC0) + a1 + 72;
          do
          {
            if (v35 == 7)
            {
              unsigned int v13 = v30;
LABEL_17:
              *(void *)(a1 + 8LL * ((v13 >> 6) & 7)) &= ~(1LL << v13);
              return 1LL;
            }
          }

          while (!*(void *)(v36 + 8 * v35++));
          unsigned int v13 = v30;
        }
      }

      return 1LL;
    }
  }

  return v11;
}

  if (!v10) {
    *(void *)(StatusReg + 904) = 0LL;
  }
  return v14;
}

uint64_t bitarray_first_set(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 0LL;
  for (int i = 0; ; i -= 64)
  {
    unint64_t v4 = *(void *)(a1 + v2);
    if (v4) {
      break;
    }
    v2 += 8LL;
    if (v2 == 64) {
      return 0LL;
    }
  }

  uint64_t v6 = __clz(__rbit64(v4)) - i;
  if (a2 < 0xA) {
    return (v6 + 1);
  }
  unsigned int v7 = (a2 - 1) / 9;
  switch(v7)
  {
    case 1u:
      goto LABEL_40;
    case 2u:
      uint64_t v8 = 0LL;
      a1 += 64LL;
      int v9 = (_DWORD)v6 << 9;
      uint64_t v10 = (unint64_t *)(a1 + (v6 << 6));
      while (1)
      {
        unint64_t v12 = *v10++;
        unint64_t v11 = v12;
        if (v12) {
          goto LABEL_25;
        }
        v8 -= 64LL;
        if (v8 == -512) {
          goto LABEL_24;
        }
      }

    case 3u:
      uint64_t v13 = 0LL;
      uint64_t v14 = (unint64_t *)(a1 + (v6 << 6) + 64);
      while (1)
      {
        unint64_t v16 = *v14++;
        unint64_t v15 = v16;
        if (v16) {
          break;
        }
        v13 -= 64LL;
        if (v13 == -512)
        {
          int v17 = 0;
          goto LABEL_21;
        }
      }

      int v17 = __clz(__rbit64(v15)) - v13 + 1;
LABEL_21:
      uint64_t v8 = 0LL;
      a1 += 32832LL;
      int v9 = ((((_DWORD)v6 << 9) + v17) << 9) - 512;
      uint64_t v23 = (unint64_t *)(a1 + 8LL * (8 * (v17 + ((_DWORD)v6 << 9)) - 8));
      while (1)
      {
        unint64_t v24 = *v23++;
        unint64_t v11 = v24;
        if (v24) {
          break;
        }
        v8 -= 64LL;
        if (v8 == -512)
        {
LABEL_24:
          int v25 = 0;
          goto LABEL_26;
        }
      }

LABEL_25:
      int v25 = __clz(__rbit64(v11)) - v8 + 1;
LABEL_26:
      int v26 = v9 + v25;
      goto LABEL_39;
    case 4u:
      uint64_t v18 = 0LL;
      uint64_t v19 = (unint64_t *)(a1 + (v6 << 6) + 64);
      break;
    default:
      bitarray_first_set_cold_1((a2 - 1) / 9);
  }

  while (1)
  {
    unint64_t v21 = *v19++;
    unint64_t v20 = v21;
    if (v21) {
      break;
    }
    v18 -= 64LL;
    if (v18 == -512)
    {
      int v22 = 0;
      goto LABEL_28;
    }
  }

  int v22 = __clz(__rbit64(v20)) - v18 + 1;
LABEL_28:
  uint64_t v27 = 0LL;
  uint64_t v28 = (unint64_t *)(a1 + 8LL * (8 * (v22 + ((_DWORD)v6 << 9)) - 8) + 32832);
  while (1)
  {
    unint64_t v30 = *v28++;
    unint64_t v29 = v30;
    if (v30) {
      break;
    }
    v27 -= 64LL;
    if (v27 == -512)
    {
      int v31 = 0;
      goto LABEL_33;
    }
  }

  int v31 = __clz(__rbit64(v29)) - v27 + 1;
LABEL_33:
  uint64_t v32 = 0LL;
  a1 += 16810048LL;
  int v33 = ((((((_DWORD)v6 << 9) + v22) << 9) - 512 + v31) << 9) - 512;
  uint64_t v34 = (unint64_t *)(a1 + 8LL * (8 * (v31 + (v22 << 9) + ((_DWORD)v6 << 18)) - 4104));
  while (1)
  {
    unint64_t v36 = *v34++;
    unint64_t v35 = v36;
    if (v36) {
      break;
    }
    v32 -= 64LL;
    if (v32 == -512)
    {
      int v37 = 0;
      goto LABEL_38;
    }
  }

  int v37 = __clz(__rbit64(v35)) - v32 + 1;
LABEL_38:
  int v26 = v33 + v37;
LABEL_39:
  LODWORD(v6) = v26 - 1;
LABEL_40:
  uint64_t v38 = 0LL;
  uint64_t v39 = a1 + 8LL * (8 << (9 * v7 - 9));
  int v40 = (_DWORD)v6 << 9;
  v41 = (unint64_t *)(v39 + 8LL * (8 * v6));
  while (1)
  {
    unint64_t v43 = *v41++;
    unint64_t v42 = v43;
    if (v43) {
      break;
    }
    v38 -= 64LL;
    if (v38 == -512)
    {
      int v44 = 0;
      return (v44 + v40);
    }
  }

  int v44 = __clz(__rbit64(v42)) - v38 + 1;
  return (v44 + v40);
}

    __clrex();
    int v9 = v16;
  }

  a2[1] = 0LL;
  if (v9 < 0) {
    uint64_t v14 = 2043;
  }
  else {
    uint64_t v14 = 2045;
  }
  unint64_t v15 = v14 | v12 | v13;
  do
  {
    unint64_t v16 = __ldxr(v8);
    if (v16 != v9) {
      goto LABEL_25;
    }
  }

  while (__stlxr(v15, v8));
  if (v9 < 0 || nanov2_madvise_policy)
  {
LABEL_30:
    if ((v15 & 0x80000000) == 0)
    {
      int v17 = (unsigned __int16 *)(a1 + 28672);
      if (((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0 && (double)v10 * 0.75 <= (double)((v15 >> 11) & 0x3FF))
      {
        do
          uint64_t v18 = __ldxr(v17);
        while (__stxr(v18 & ~(unsigned __int16)(1 << v6), v17));
      }
    }
  }

  else
  {
    nanov2_madvise_block((os_unfair_lock_s *)a1, v8, v6, 2045);
  }

  if (v20) {
    kdebug_trace();
  }
  return v2;
}

      ++v17;
      v16 += 64;
      if (v17 == 4096)
      {
        v15 += 0x4000000LL;
        if (v15 >= v13) {
          goto LABEL_27;
        }
        goto LABEL_14;
      }
    }
  }

  return result;
}

  if (!name) {
    goto LABEL_37;
  }
  unint64_t v11 = strlen(name) + 1;
  unint64_t v12 = name;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    uint64_t v13 = _malloc_zone_malloc((uint64_t)zone, v11, 0);
    if (!v13) {
      goto LABEL_30;
    }
    unint64_t v12 = (const char *)v13;
    _platform_strcpy();
  }

  zone->zone_name = v12;
LABEL_30:
  wrapped_zone = get_wrapped_zone((uint64_t)zone);
  if (wrapped_zone)
  {
    if (zone->version <= 0xD) {
      purgeable_ptr_in_use_enumerator_cold_1(wrapped_zone, v15, v16);
    }
    int v17 = (malloc_zone_t *)wrapped_zone;
    else {
      uint64_t v18 = "Sanitizer";
    }
    uint64_t v19 = strlen(name);
    unint64_t v20 = strlen(v18);
    unint64_t v21 = strlen("Wrapped");
    int v22 = _malloc_zone_malloc((uint64_t)v17, v19 + v21 + v20 + 3, 0);
    if (v22)
    {
      uint64_t v23 = (char *)v22;
      _platform_strcpy();
      *(_WORD *)&v23[strlen(v23)] = 45;
      unint64_t v24 = strcat(v23, v18);
      *(_WORD *)&v23[strlen(v24)] = 45;
      *(void *)&v23[strlen(v23)] = 0x64657070617257LL;
      malloc_set_zone_name(v17, v23);
      malloc_zone_free(v17, v23);
    }
  }

    malloc_zone_check_fail((uint64_t)"check: tiny free list incorrect ", (uint64_t)v5);
    os_unfair_lock_unlock(v6);
  }

BOOL bitarray_zap_first_set(uint64_t a1, int a2, unsigned int *a3)
{
  int v3 = 0;
  uint64_t v4 = 0LL;
  while (1)
  {
    unint64_t v5 = *(void *)(a1 + 8 * v4);
    if (v5) {
      break;
    }
    ++v4;
    v3 -= 64;
    if (v4 == 8) {
      return v5 != 0;
    }
  }

  int v6 = __clz(__rbit64(v5));
  unsigned int v7 = v6 - v3;
  if ((a2 - 1) > 8)
  {
    unsigned int v8 = (a2 - 1) / 9u;
    uint64_t v9 = v8 - 1;
    switch(v8)
    {
      case 1u:
        uint64_t v10 = a1;
        goto LABEL_42;
      case 2u:
        uint64_t v11 = 0LL;
        uint64_t v10 = a1 + 64;
        int v12 = v7 << 9;
        uint64_t v13 = (unint64_t *)(a1 + 64 + ((unint64_t)(v6 - v3) << 6));
        while (1)
        {
          unint64_t v15 = *v13++;
          unint64_t v14 = v15;
          if (v15) {
            goto LABEL_27;
          }
          v11 -= 64LL;
          if (v11 == -512) {
            goto LABEL_26;
          }
        }

      case 3u:
        uint64_t v16 = 0LL;
        unsigned int v17 = v7 << 9;
        uint64_t v18 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        while (1)
        {
          unint64_t v20 = *v18++;
          unint64_t v19 = v20;
          if (v20) {
            break;
          }
          v16 -= 64LL;
          if (v16 == -512)
          {
            int v21 = 0;
            goto LABEL_23;
          }
        }

        int v21 = __clz(__rbit64(v19)) - v16 + 1;
LABEL_23:
        uint64_t v11 = 0LL;
        int v28 = (v17 + v21) << 9;
        uint64_t v10 = a1 + 32832;
        int v12 = v28 - 512;
        unint64_t v29 = (unint64_t *)(a1 + 32832 + 8LL * (8 * (v21 + ((v6 - v3) << 9)) - 8));
        while (1)
        {
          unint64_t v30 = *v29++;
          unint64_t v14 = v30;
          if (v30) {
            break;
          }
          v11 -= 64LL;
          if (v11 == -512)
          {
LABEL_26:
            int v31 = 0;
            goto LABEL_28;
          }
        }

LABEL_27:
        int v31 = __clz(__rbit64(v14)) - v11 + 1;
LABEL_28:
        int v32 = v12 + v31;
        goto LABEL_41;
      case 4u:
        uint64_t v22 = 0LL;
        unsigned int v23 = v7 << 9;
        unint64_t v24 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        break;
      default:
        bitarray_first_set_cold_1(v8);
    }

    while (1)
    {
      unint64_t v26 = *v24++;
      unint64_t v25 = v26;
      if (v26) {
        break;
      }
      v22 -= 64LL;
      if (v22 == -512)
      {
        int v27 = 0;
        goto LABEL_30;
      }
    }

    int v27 = __clz(__rbit64(v25)) - v22 + 1;
LABEL_30:
    uint64_t v33 = 0LL;
    int v34 = ((v23 + v27) << 9) - 512;
    unint64_t v35 = (unint64_t *)(a1 + 8LL * (8 * (v27 + ((v6 - v3) << 9)) - 8) + 32832);
    while (1)
    {
      unint64_t v37 = *v35++;
      unint64_t v36 = v37;
      if (v37) {
        break;
      }
      v33 -= 64LL;
      if (v33 == -512)
      {
        int v38 = 0;
        goto LABEL_35;
      }
    }

    int v38 = __clz(__rbit64(v36)) - v33 + 1;
LABEL_35:
    uint64_t v39 = 0LL;
    int v40 = (v34 + v38) << 9;
    uint64_t v10 = a1 + 16810048;
    int v41 = v40 - 512;
    unint64_t v42 = (unint64_t *)(a1 + 16810048 + 8LL * (8 * (v38 + (v27 << 9) + ((v6 - v3) << 18)) - 4104));
    while (1)
    {
      unint64_t v44 = *v42++;
      unint64_t v43 = v44;
      if (v44) {
        break;
      }
      v39 -= 64LL;
      if (v39 == -512)
      {
        int v45 = 0;
        goto LABEL_40;
      }
    }

    int v45 = __clz(__rbit64(v43)) - v39 + 1;
LABEL_40:
    int v32 = v41 + v45;
LABEL_41:
    unsigned int v7 = v32 - 1;
LABEL_42:
    uint64_t v46 = 0LL;
    v47 = (unint64_t *)(v10 + 8LL * (8 << (9 * v8 - 9)) + 64LL * v7);
    while (1)
    {
      unint64_t v49 = *v47++;
      unint64_t v48 = v49;
      if (v49) {
        break;
      }
      v46 -= 64LL;
      if (v46 == -512)
      {
        int v50 = 0;
        goto LABEL_47;
      }
    }

    int v50 = __clz(__rbit64(v48)) - v46 + 1;
LABEL_47:
    unsigned int v51 = (v7 << 9) + v50 - 1;
    *a3 = v51;
    v52 = (void *)(a1 + 8LL * levels_num_words[v9] + 64LL * (v51 >> 9));
    uint64_t v53 = (v51 >> 6) & 7;
    uint64_t v54 = v52[v53];
    uint64_t v55 = v54 & ~(1LL << v51);
    if (v54 != v55)
    {
      v52[v53] = v55;
      if (!*v52)
      {
        unsigned int v57 = v51 >> 9;
        uint64_t v58 = 1LL;
        do
        {
          if (v58 == 8)
          {
            if (v55) {
              return v5 != 0;
            }
            goto LABEL_57;
          }
        }

        while (!v52[v58++]);
LABEL_57:
        switch((int)v9)
        {
          case 0:
            goto LABEL_58;
          case 1:
            goto LABEL_75;
          case 2:
            goto LABEL_66;
          case 3:
            unsigned int v57 = v51 >> 18;
            v60 = (uint64_t *)(a1 + 64LL * (v51 >> 18) + 16810048);
            uint64_t v61 = (v51 >> 15) & 7;
            uint64_t v62 = v60[v61];
            uint64_t v63 = v62 & ~(1LL << (v51 >> 9));
            if (v62 == v63) {
              return v5 != 0;
            }
            v60[v61] = v63;
            if (v63) {
              return v5 != 0;
            }
            uint64_t v64 = *v60;
            if (v64) {
              return v5 != 0;
            }
            uint64_t v65 = ((v51 >> 12) & 0xFFFC0) + a1 + 16810056;
            break;
          default:
            bitarray_set_cold_1(v9);
        }

        while (v64 != 7)
        {
          if (*(void *)(v65 + 8 * v64++))
          {
            break;
          }
        }

LABEL_66:
        unsigned int v67 = v57 >> 9;
        v68 = (uint64_t *)(a1 + 64LL * (v57 >> 9) + 32832);
        uint64_t v69 = (v57 >> 6) & 7;
        uint64_t v70 = v68[v69];
        uint64_t v71 = v70 & ~(1LL << v57);
        if (v70 != v71)
        {
          v68[v69] = v71;
          if (!v71)
          {
            uint64_t v72 = *v68;
            if (!v72)
            {
              uint64_t v73 = ((v57 >> 3) & 0xFFFC0) + a1 + 32840;
              do
              {
                if (v72 == 7)
                {
                  unsigned int v57 = v67;
                  goto LABEL_75;
                }
              }

              while (!*(void *)(v73 + 8 * v72++));
              unsigned int v57 = v67;
LABEL_75:
              unsigned int v75 = v57 >> 9;
              v76 = (uint64_t *)(a1 + 64LL * (v57 >> 9) + 64);
              uint64_t v77 = (v57 >> 6) & 7;
              uint64_t v78 = v76[v77];
              uint64_t v79 = v78 & ~(1LL << v57);
              if (v78 != v79)
              {
                v76[v77] = v79;
                if (!v79)
                {
                  uint64_t v80 = *v76;
                  if (!v80)
                  {
                    uint64_t v81 = ((v57 >> 3) & 0xFFFC0) + a1 + 72;
                    do
                    {
                      if (v80 == 7)
                      {
                        unsigned int v57 = v75;
LABEL_58:
                        uint64_t v4 = (v57 >> 6) & 7;
                        LOBYTE(v6) = v57 & 0x3F;
                        goto LABEL_7;
                      }
                    }

                    while (!*(void *)(v81 + 8 * v80++));
                    unsigned int v57 = v75;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  else
  {
    *a3 = v7;
LABEL_7:
    *(void *)(a1 + 8 * v4) &= ~(1LL << v6);
  }

  return v5 != 0;
}

              int v31 = v29 & 0xFFFFFFFFFF800000LL;
              if (v29 < (v29 & 0xFFFFFFFFFF800000LL | 0x7FA6))
              {
                int v32 = v29;
              }

              else
              {
                int v32 = v29;
                if (v29 < (v31 | 0x81F8))
                {
                  uint64_t v33 = *(_WORD *)(v29 + 16);
                  int v34 = v33;
                  int v32 = v31 + ((unint64_t)(v33 & 0x7FFF) << 9);
                  if (v34 >= 0) {
                    int v32 = 0LL;
                  }
                }
              }

              goto LABEL_76;
            }

uint64_t bitarray_zap_first_set_multiple(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (a2 <= 9) {
    return FFS_and_zap_word(a1, a3, a4, 0);
  }
  uint64_t v8 = 0LL;
  if (a3)
  {
    uint64_t v9 = a1 + 64;
    uint64_t v73 = a1 + 32832;
    uint64_t v72 = a1 + 16810048;
    unsigned int v68 = (a2 - 1) / 9;
    uint64_t v69 = a1 + 16810056;
    uint64_t v70 = a1 + 32840;
    uint64_t v71 = a1 + 72;
    do
    {
      int v10 = 0;
      uint64_t v11 = 0LL;
      int v12 = 0;
      while (1)
      {
        unint64_t v13 = *(void *)(a1 + v11);
        if (v13) {
          break;
        }
        v12 -= 64;
        v11 += 8LL;
        v10 += 64;
        if (v11 == 64) {
          return v8;
        }
      }

      int v14 = __clz(__rbit64(v13));
      unsigned int v15 = v14 - v12;
      switch(v68)
      {
        case 1u:
          uint64_t v16 = a1;
          goto LABEL_44;
        case 2u:
          uint64_t v17 = 0LL;
          uint64_t v18 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          while (1)
          {
            unint64_t v20 = *v18++;
            unint64_t v19 = v20;
            if (v20) {
              break;
            }
            v17 -= 64LL;
            if (v17 == -512)
            {
              int v21 = 0;
              goto LABEL_24;
            }
          }

          int v21 = __clz(__rbit64(v19)) - v17 + 1;
LABEL_24:
          unsigned int v15 = (v15 << 9) + v21 - 1;
          uint64_t v16 = a1 + 64;
          goto LABEL_44;
        case 3u:
          uint64_t v22 = 0LL;
          unsigned int v23 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          while (1)
          {
            unint64_t v25 = *v23++;
            unint64_t v24 = v25;
            if (v25) {
              break;
            }
            v22 -= 64LL;
            if (v22 == -512)
            {
              int v26 = 0;
              goto LABEL_26;
            }
          }

          int v26 = __clz(__rbit64(v24)) - v22 + 1;
LABEL_26:
          uint64_t v32 = 0LL;
          uint64_t v33 = (unint64_t *)(v73 + 8LL * (8 * (v26 + ((v14 + v10) << 9)) - 8));
          while (1)
          {
            unint64_t v35 = *v33++;
            unint64_t v34 = v35;
            if (v35) {
              break;
            }
            v32 -= 64LL;
            if (v32 == -512)
            {
              int v36 = 0;
              goto LABEL_36;
            }
          }

          int v36 = __clz(__rbit64(v34)) - v32 + 1;
LABEL_36:
          unsigned int v15 = (((v15 << 9) + v26) << 9) - 512 + v36 - 1;
          uint64_t v16 = v73;
          goto LABEL_44;
        case 4u:
          uint64_t v27 = 0LL;
          int v28 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          break;
        default:
          bitarray_first_set_cold_1(v68);
      }

      while (1)
      {
        unint64_t v30 = *v28++;
        unint64_t v29 = v30;
        if (v30) {
          break;
        }
        v27 -= 64LL;
        if (v27 == -512)
        {
          int v31 = 0;
          goto LABEL_31;
        }
      }

      int v31 = __clz(__rbit64(v29)) - v27 + 1;
LABEL_31:
      uint64_t v37 = 0LL;
      int v38 = (unint64_t *)(v73 + 8LL * (8 * (v31 + ((v14 + v10) << 9)) - 8));
      while (1)
      {
        unint64_t v40 = *v38++;
        unint64_t v39 = v40;
        if (v40) {
          break;
        }
        v37 -= 64LL;
        if (v37 == -512)
        {
          int v41 = 0;
          goto LABEL_38;
        }
      }

      int v41 = __clz(__rbit64(v39)) - v37 + 1;
LABEL_38:
      uint64_t v42 = 0LL;
      unint64_t v43 = (unint64_t *)(v72 + 8LL * (8 * (v41 + (v31 << 9) + ((v14 + v10) << 18)) - 4104));
      while (1)
      {
        unint64_t v45 = *v43++;
        unint64_t v44 = v45;
        if (v45) {
          break;
        }
        v42 -= 64LL;
        if (v42 == -512)
        {
          int v46 = 0;
          goto LABEL_43;
        }
      }

      int v46 = __clz(__rbit64(v44)) - v42 + 1;
LABEL_43:
      unsigned int v15 = (((((v15 << 9) + v31) << 9) - 512 + v41) << 9) - 512 + v46 - 1;
      uint64_t v16 = v72;
LABEL_44:
      v47 = (void *)(v16 + 8LL * (8 << (9 * (v68 - 1))) + 64LL * v15);
      if (v8 >= a3)
      {
        if (*v47) {
          return v8;
        }
        uint64_t v48 = 1LL;
        while (v48 != 8)
        {
          if (v47[v48++])
          {
            break;
          }
        }
      }

      switch(v68)
      {
        case 1u:
          goto LABEL_46;
        case 2u:
          goto LABEL_69;
        case 3u:
          goto LABEL_61;
        case 4u:
          int v50 = (uint64_t *)(v72 + 64LL * (v15 >> 9));
          uint64_t v51 = (v15 >> 6) & 7;
          uint64_t v52 = v50[v51];
          uint64_t v53 = v52 & ~(1LL << v15);
          if (v52 == v53) {
            continue;
          }
          v50[v51] = v53;
          if (v53) {
            continue;
          }
          uint64_t v54 = *v50;
          if (v54) {
            continue;
          }
          break;
        default:
          bitarray_first_set_cold_1(v68 - 1);
      }

      do
      {
        if (v54 == 7)
        {
          v15 >>= 9;
          goto LABEL_61;
        }
      }

      while (!*(void *)(v69 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v54++));
      v15 >>= 9;
LABEL_61:
      v56 = (uint64_t *)(v73 + 64LL * (v15 >> 9));
      uint64_t v57 = (v15 >> 6) & 7;
      uint64_t v58 = v56[v57];
      uint64_t v59 = v58 & ~(1LL << v15);
      if (v58 != v59)
      {
        v56[v57] = v59;
        if (!v59)
        {
          uint64_t v60 = *v56;
          if (!v60)
          {
            do
            {
              if (v60 == 7)
              {
                v15 >>= 9;
                goto LABEL_69;
              }
            }

            while (!*(void *)(v70 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v60++));
            v15 >>= 9;
LABEL_69:
            uint64_t v62 = (uint64_t *)(v9 + 64LL * (v15 >> 9));
            uint64_t v63 = (v15 >> 6) & 7;
            uint64_t v64 = v62[v63];
            uint64_t v65 = v64 & ~(1LL << v15);
            if (v64 != v65)
            {
              v62[v63] = v65;
              if (!v65)
              {
                uint64_t v66 = *v62;
                if (!v66)
                {
                  while (v66 != 7)
                  {
                    if (*(void *)(v71 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v66++))
                    {
                      v15 >>= 9;
LABEL_46:
                      *(void *)(a1 + 8LL * ((v15 >> 6) & 7)) &= ~(1LL << v15);
                      goto LABEL_72;
                    }
                  }

                  v15 >>= 9;
                  goto LABEL_46;
                }
              }
            }
          }
        }
      }

LABEL_72:
      ;
    }

    while (v8 < a3);
  }

  return v8;
}

uint64_t FFS_and_zap_word(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    unint64_t v6 = *(void *)(a1 + 8 * v4);
    if (v6)
    {
      do
      {
        int v7 = __clz(__rbit64(v6));
        *(_DWORD *)(a3 + 4LL * v5) = a4 + ((_DWORD)v4 << 6) + v7;
        uint64_t v5 = (v5 + 1);
        v6 &= ~(1LL << v7);
      }

      while (v5 < a2 && v6);
      *(void *)(a1 + 8 * v4) = v6;
    }

    ++v4;
  }

  while (v4 != 8);
  return v5;
}

mach_vm_address_t _xzm_range_group_alloc_anywhere_segment( mach_vm_address_t a1, mach_vm_size_t size, unint64_t a3, uint64_t a4, char a5)
{
  kern_return_t v7;
  uint64_t v8;
  mach_vm_address_t address;
  address = a1;
  if ((a5 & 2) != 0) {
    int v5 = ((a5 & 1) << 24) | 0x2000003;
  }
  else {
    int v5 = ((a5 & 1) << 24) | 0x2000001;
  }
  uint64_t v6 = 0x400000LL;
  if (a3 > 0x400000) {
    uint64_t v6 = a3;
  }
  int v7 = mach_vm_map(*MEMORY[0x1895FFD48], &address, size, v6 - 1, v5, 0, 0LL, 0, 3, 7, 1u);
  if (!v7) {
    return address;
  }
  uint64_t v8 = 0LL;
  if (v7 != 3)
  {
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment (size=%lu, flags=%x, kr=%d)\n");
    return 0LL;
  }

  return v8;
}

void xzm_main_malloc_zone_init_range_groups(uint64_t a1)
{
  kern_return_t v25;
  const char *v26;
  int v27;
  kern_return_t v28;
  void *v29;
  char *__endptr;
  size_t address;
  char __str[8];
  unint64_t v33;
  size_t v34;
  uint64_t v35;
  unint64_t v35 = *MEMORY[0x1895FEE08];
  address = 255LL;
  if (sysctlbyname("vm.malloc_ranges", __str, &address, 0LL, 0LL) == -1)
  {
    uint64_t v27 = *__error();
    if (v27 != 2)
    {
      if (v27 != 1) {
        xzm_main_malloc_zone_init_range_groups_cold_1();
      }
      int v26 = "sysctlbyname(vm.malloc_ranges) denied\n";
      goto LABEL_41;
    }
  }

  else
  {
    __str[address] = 0;
    __endptr = __str;
    unint64_t v2 = strtoull(__str, &__endptr, 16);
    ++__endptr;
    unint64_t v3 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    unint64_t v4 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    unint64_t v5 = strtoull(__endptr, &__endptr, 16);
    if (!v2) {
      xzm_main_malloc_zone_init_range_groups_cold_2();
    }
    if (v3 < v2) {
      xzm_main_malloc_zone_init_range_groups_cold_3();
    }
    unint64_t v6 = v4 - v3;
    if (v4 < v3) {
      xzm_main_malloc_zone_init_range_groups_cold_4();
    }
    if (v5 < v4) {
      xzm_main_malloc_zone_init_range_groups_cold_5();
    }
    unint64_t v7 = (v2 + 0x1FFFFFF) & 0xFFFFFFFFFE000000LL;
    unint64_t v8 = v3 - 0x300000000LL;
    if (v3 < 0x300000000LL) {
      unint64_t v8 = 0LL;
    }
    unint64_t v9 = v8 & 0xFFFFFFFFFE000000LL;
    BOOL v19 = v9 >= v7;
    unint64_t v10 = v9 - v7;
    if (v19) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0LL;
    }
    size_t v12 = v4 + 0x100000000LL;
    unint64_t v13 = (v4 & 0xFFFFFFFFFE000000LL) + 0x102000000LL;
    if ((v4 & 0x1FFFFFF) == 0) {
      unint64_t v13 = v4 + 0x100000000LL;
    }
    unint64_t v14 = v5 - 0x200000000LL;
    if (v5 < 0x200000000LL) {
      unint64_t v14 = 0LL;
    }
    unint64_t v15 = v14 & 0xFFFFFFFFFE000000LL;
    BOOL v19 = v15 >= v13;
    unint64_t v16 = v15 - v13;
    if (!v19) {
      unint64_t v16 = 0LL;
    }
    if ((v16 & 0x1FFFFFF) != 0) {
      xzm_main_malloc_zone_init_range_groups_cold_10();
    }
    unint64_t v17 = v16 + v11;
    if (!v17) {
      xzm_main_malloc_zone_init_range_groups_cold_6();
    }
    unint64_t v18 = qword_18C444C28 % (v17 >> 25);
    BOOL v19 = v18 >= v11 >> 25;
    if (v18 >= v11 >> 25) {
      unint64_t v20 = v11 >> 25;
    }
    else {
      unint64_t v20 = 0LL;
    }
    if (v19) {
      unint64_t v7 = v13;
    }
    size_t v21 = v7 + ((v18 - v20) << 25);
    if ((v21 < v2 || v21 + 0x300000000LL > v3) && (v21 < v12 || v21 + 0x200000000LL > v5)) {
      xzm_main_malloc_zone_init_range_groups_cold_7();
    }
    *(void *)__str = 0x202000000000000LL;
    uint64_t v33 = v7 + ((v18 - v20) << 25);
    unint64_t v34 = v21 + 0x200000000LL;
    unint64_t v24 = (vm_map_t *)MEMORY[0x1895FFD48];
    unint64_t v25 = mach_vm_range_create(*MEMORY[0x1895FFD48], MACH_VM_RANGE_FLAVOR_V1, (mach_vm_range_recipes_raw_t)__str, 0x18u);
    if (v25)
    {
      if (v25 != 46)
      {
        if (v25 != 53) {
          xzm_main_malloc_zone_init_range_groups_cold_8(v25);
        }
        int v26 = "mach_vm_range_create() denied\n";
LABEL_41:
        malloc_report(3u, (uint64_t)v26);
      }
    }

    else
    {
      address = v21;
      int v28 = mach_vm_map(*v24, &address, 0x200000000uLL, 0LL, 0x4000, 0, 0LL, 0, 0, 0, 1u);
      if (v28) {
        xzm_main_malloc_zone_init_range_groups_cold_9(v28);
      }
      *(_BYTE *)(a1 + 328) |= 1u;
      unint64_t v29 = *(void **)(a1 + 384);
      v29[10] = v21;
      v29[11] = 0x200000000LL;
      v29[12] = v21;
      v29[13] = 0x200000000LL;
      v29[3] = v3;
      v29[4] = v6;
    }
  }
}

mach_vm_address_t xzm_segment_group_alloc_chunk( uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t *a5, unint64_t a6, int a7, int a8)
{
  kern_return_t v29;
  mach_vm_address_t address;
  if (a2 == 7)
  {
    if (a6 >= 0x400000) {
      unint64_t v11 = a6;
    }
    else {
      unint64_t v11 = 0LL;
    }
    address = 0LL;
    else {
      return 0LL;
    }
  }

  if (a4 == 1 && a2 == 6) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = a4;
  }
  BOOL v19 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock_with_options();
  uint64_t chunk = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v18, a6);
  if (chunk)
  {
    uint64_t v12 = chunk;
LABEL_16:
    os_unfair_lock_unlock(v19);
    goto LABEL_19;
  }

  BOOL v21 = os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 8));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
  if (!v21)
  {
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    uint64_t v12 = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v18, a6);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    BOOL v19 = (os_unfair_lock_s *)(a1 + 8);
    if (v12) {
      goto LABEL_16;
    }
  }

  uint64_t v12 = _xzm_segment_group_alloc_segment_and_chunk((os_unfair_lock_s *)a1, a2, a3, a5, v18, a6);
  if (!v12) {
    return v12;
  }
LABEL_19:
  int v22 = *(_BYTE *)(v12 + 32) & 0xF;
  if ((v22 - 6) < 2)
  {
    mach_vm_size_t v23 = (unint64_t)*(unsigned int *)(v12 + 40) << 14;
  }

  else if (v22 == 2)
  {
    mach_vm_size_t v23 = 0x4000LL;
  }

  else
  {
    if (v22 != 5) {
      xzm_segment_group_alloc_chunk_cold_1(v22);
    }
    mach_vm_size_t v23 = 0x10000LL;
  }

  uint64_t v24 = *(void *)((v12 & 0xFFFFFFFFFFFFC000LL) + 0x30);
  unint64_t v25 = (0xAAAAAAAAAAAAC000LL * (((unint64_t)(v12 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL;
  mach_vm_address_t v26 = v25 + v24;
  if ((*(_BYTE *)(v12 + 32) & 0x10) != 0) {
    goto LABEL_34;
  }
  if (a2 == 6 && (*(_BYTE *)(*(void *)(a1 + 24) + 328LL) & 2) != 0)
  {
    _xzm_segment_group_overwrite_chunk(v25 + v24, v23);
LABEL_33:
    *(_BYTE *)(v12 + 32) |= 0x10u;
    goto LABEL_34;
  }

  if (a7)
  {
    uint64_t v27 = (void *)(v25 + v24);
    if (a2 == 2) {
      bzero(v27, v23);
    }
    else {
      _xzm_segment_group_clear_chunk((char *)v27, v23);
    }
    goto LABEL_33;
  }

LABEL_34:
  if (a8)
  {
    address = v26;
    unint64_t v29 = mach_vm_map(*MEMORY[0x1895FFD48], &address, v23, 0LL, 33570818, 0, 0LL, 0, 3, 7, 1u);
    if (v29) {
      xzm_segment_group_alloc_chunk_cold_2(v29);
    }
  }

  return v12;
}

  BOOL v21 = *(void *)(a2 + 2128);
  int v22 = v3 << 9;
  if (v21 < v22) {
    return;
  }
  unint64_t v10 = *(void *)(a2 + 2144) - v21 + 0x800000;
  mach_vm_size_t v23 = v21 - v22;
  *(void *)(a2 + 2128) = v23;
  if (v23) {
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000LL | (2 * (((v10 + v22 - 33280) >> 9) & 0x3FFFLL))) + 0x28) = v23 >> 9;
  }
LABEL_14:
  ++*(_DWORD *)(a2 + 2168);
  uint64_t v12 = v3 << 9;
  *(void *)(a2 + 2152) += v12;
  if (*(_DWORD *)(v10 & 0xFFFFFFFFFF800000LL | 0x81FC) == *(unsigned __int16 *)((char *)&malloc_entropy + 1))
  {
    unint64_t v13 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x10) + v12;
    *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x10) = v13;
    if (v13 >= 0x5F9E80) {
      *(_BYTE *)((v10 & 0xFFFFFFFFFF800000LL) + 0x20) = 0;
    }
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000LL)
  }

  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }

  if (!v24) {
    return v13;
  }
  if ((a3 & 1) != 0 && *MEMORY[0x189600140] < a2)
  {
    if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
      unint64_t v15 = *MEMORY[0x189600148];
    }
    else {
      unint64_t v15 = *MEMORY[0x189600128];
    }
    unint64_t v16 = 1 << a2;
    unint64_t v17 = (v15 + v13 + v16 - 1) & -v16;
    if (mach_vm_deallocate(*v10, v13, v17 - (v15 + v13)))
    {
      unsigned int v18 = "can't unmap excess guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
LABEL_44:
      malloc_zone_error(a3, 0, (uint64_t)v18);
      return 0LL;
    }

    if (v16 == v17 - v13)
    {
      unint64_t v13 = (v15 + v13 + v16 - 1) & -v16;
    }

    else
    {
      BOOL v21 = mach_vm_deallocate(*v10, v6 - (v16 - v17), v16 - (v17 - v13));
      unint64_t v13 = (v15 + v13 + v16 - 1) & -v16;
      if (v21)
      {
        unsigned int v18 = "can't unmap excess trailing guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
        goto LABEL_44;
      }
    }
  }

  else if ((a3 & 1) != 0)
  {
    unint64_t v20 = *MEMORY[0x189600128];
    if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
      unint64_t v20 = *MEMORY[0x189600148];
    }
    v13 += v20;
  }

  mvm_protect_plat(v13, a1, 0, a3);
  return v13;
}

      a4("}, \n");
      a4("xzones: {\n");
      int v28 = v90;
      unint64_t v29 = *(void *)(v11 + 216);
      if (v90 > v29) {
        goto LABEL_66;
      }
      unint64_t v30 = 88LL * *(unsigned __int8 *)(v11 + 210);
      int v31 = v29 - v90;
      uint64_t v32 = __CFADD__(v29 - v90, v30);
      uint64_t v33 = v29 - v90 + v30;
      if (v32) {
        goto LABEL_66;
      }
      unint64_t v34 = *(void *)(v11 + 304);
      if (v33 > v34
        || (uint64_t v54 = v31 + v11) == 0
        || (unint64_t v35 = *(void *)(v11 + 224), v90 > v35)
        || (int v36 = *(unsigned __int8 *)(v11 + 210) * (unint64_t)*(unsigned __int8 *)(v11 + 211),
            uint64_t v37 = v35 - v90,
            uint64_t v32 = __CFADD__(v35 - v90, 32 * v36),
            int v38 = v35 - v90 + 32 * v36,
            v32)
        || v38 > v34
        || (unint64_t v39 = v37 + v11) == 0)
      {
LABEL_66:
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(v81, 8);
        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(&v86, 8);
        return;
      }

      unint64_t v40 = v92;
      if (*(unsigned __int8 *)(v92 + 210) >= 2u)
      {
        int v41 = 1LL;
        do
        {
          a4("    %d: {\n", v41);
          uint64_t v42 = v54 + 88 * v41;
          a4("        id: %d, \n", *(unsigned __int8 *)(v42 + 72));
          a4("        bucket: %d, \n", *(unsigned __int8 *)(v42 + 76));
          a4( "        segment_group: %zu, \n",  0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*(void *)(v42 + 40) - *(void *)(v11 + 392)) >> 4));
          unint64_t v43 = *(void *)(v42 + 48);
          v42 += 48LL;
          a4("        block_size: %llu, \n", v43);
          a4("        chunk_capacity: %u, \n", *(_DWORD *)(v42 + 20));
          a4("        sequestered: %d,\n", *(_BYTE *)(v42 + 30) & 1);
          uint64_t v55 = (void *)v42;
          unint64_t v44 = *(char *)(v42 + 29);
          unint64_t v45 = "UNKNOWN";
          if (v44 <= 2) {
            unint64_t v45 = (&off_189654740)[v44];
          }
          a4("        slot_config: %s,\n", v45);
          a4("        allocation_slots: [\n");
          if (*(_BYTE *)(v40 + 211))
          {
            int v46 = 0;
            do
            {
              v47 = v41;
              uint64_t v48 = v41 + v46 * *(unsigned __int8 *)(v40 + 210);
              unint64_t v49 = v39 + 32 * v48;
              a4("            {\n");
              if (*v55 > 0x1000uLL)
              {
                a4("                chunk: %p,\n", *(const void **)v49);
                a4("                allocations: %lu,\n", *(unsigned int *)(v49 + 16));
                int v50 = "                contentions: %lu,\n";
              }

              else
              {
                a4("                atomic_value: 0x%llx,\n", *(void *)v49);
                a4("                xsg_locked: 0x%llx,\n", *(_DWORD *)v49 & 1);
                a4("                xsg_waiters: 0x%llx,\n", (*(_DWORD *)v49 >> 1) & 1);
                a4("                xsc_ptr: 0x%llx,\n", (*(void *)v49 >> 2) & 0x7FFFFFFFFFFFLL);
                a4("                allocations: %lu,\n", *(unsigned int *)(v49 + 16));
                a4("                contentions: %lu,\n", *(_DWORD *)(v49 + 20) & 0xFFFFFF);
                int v50 = "                slot_config: %s,\n";
              }

              a4(v50);
              int v41 = v47;
              a4("                last_chunk_empty_ts: %llu\n", *(void *)(v39 + 32 * v48 + 24));
              a4("            }");
              a4("\n");
              ++v46;
            }

            while (v46 < *(unsigned __int8 *)(v40 + 211));
          }

          a4("        ]\n");
          a4("    }");
          a4("\n");
          ++v41;
        }

        while (v41 < *(unsigned __int8 *)(v40 + 210));
      }

      a4("}, \n");
      unint64_t v5 = v57;
      unint64_t v8 = v58;
      unint64_t v7 = v56;
      unint64_t v10 = MEMORY[0x1895FED80];
    }

    else
    {
      unint64_t v40 = v92;
      int v28 = v90;
    }

    a4("spans: {\n");
    *((_BYTE *)v76 + 24) = 1;
    *((_BYTE *)v72 + 24) = 0;
    v61[0] = v10;
    v61[1] = 0x40000000LL;
    v61[2] = __xzm_print_block_invoke_3;
    v61[3] = &unk_189654610;
    v61[5] = &v75;
    v61[6] = a4;
    v61[4] = v79;
    v60[0] = v10;
    v60[1] = 0x40000000LL;
    v60[2] = __xzm_print_block_invoke_4;
    v60[3] = &unk_189654638;
    v60[6] = a4;
    v60[7] = v11;
    v60[4] = v79;
    v60[5] = &v75;
    if (v8 == a2)
    {
      v59[0] = v10;
      v59[1] = 0x40000000LL;
      v59[2] = __xzm_print_block_invoke_5;
      v59[3] = &unk_189654660;
      v59[6] = a4;
      v59[7] = v11;
      uint64_t v51 = v59;
      v59[4] = v79;
      v59[5] = &v75;
    }

    else
    {
      uint64_t v51 = 0LL;
    }

    uint64_t v52 = _xzm_introspect_enumerate( v7,  v5,  (unint64_t)a2,  v40,  v28,  v11,  0,  (uint64_t)v61,  (uint64_t)v63,  (uint64_t)v60,  (uint64_t)v51);
    uint64_t v53 = v83[3];
    if (v53) {
      mach_vm_deallocate(*MEMORY[0x1895FFD48], v53, 4 * v87[3]);
    }
    if (!v52)
    {
      a4("}\n");
      a4("}\n");
      a4("End xzone malloc JSON\n");
    }

    goto LABEL_66;
  }

      ++v4;
    }

    while (v4 < *(unsigned __int8 *)(a1 + 210));
  }

  if (a2)
  {
    _xzm_allocation_slots_do_lock_action(a1, a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 280), a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 284), a2);
  }

  mach_vm_size_t v23 = *(_BYTE *)(v22 + 32) & 0xF;
  if (v23 > 7) {
    xzm_segment_group_free_chunk_cold_3(v23);
  }
  unint64_t v29 = a2
      - *(void *)((v22 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v22 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v23 == 5 || v23 == 2)
  {
    int v31 = *(void *)(v14 + 216) + 88LL * *(unsigned __int8 *)(v22 + 33);
    unint64_t v13 = *(void *)(v31 + 48);
  }

  else
  {
    unint64_t v13 = (unint64_t)*(unsigned int *)(v22 + 40) << 14;
    if (v29 % v13) {
      goto LABEL_36;
    }
  }

  if (v23 == 5)
  {
    if (((*(_DWORD *)v22 >> (v29 / v13)) & 1) == 0) {
      goto LABEL_37;
    }
LABEL_36:
    unint64_t v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_37;
  }

  if (v23 == 2 && *(void *)a2 == (*(void *)(v14 + 272) ^ a2))
  {
    uint64_t v32 = v13;
    uint64_t v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v22, a2);
    unint64_t v13 = v32;
    if (v33) {
      goto LABEL_36;
    }
  }

            unint64_t v29 = v20 + 1;
            unint64_t v30 = 1;
            do
            {
              int v31 = v30++;
              uint64_t v32 = *(_DWORD *)(v24 + 4LL * ((v29 >> 4) & 0xFFE)) >> v29;
              ++v29;
            }

            while ((v32 & 1) == 0);
            uint64_t v33 = &v46[v23];
            *uint64_t v33 = v26 + v15;
            v33[1] = 16LL * v31;
            if (++v23 >= 0x100)
            {
              v37(v11, v36, 1LL, v46);
              mach_vm_size_t v23 = 0;
            }

            goto LABEL_41;
          }
        }

        else
        {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t _xzm_segment_group_find_and_allocate_chunk( uint64_t a1, int a2, unsigned __int8 *a3, uint64_t *a4, unsigned int a5, unint64_t a6)
{
  uint64_t v6 = 0LL;
  if (a6 > 0x4000) {
    unint64_t v7 = a6 >> 14;
  }
  else {
    unint64_t v7 = 0LL;
  }
  if (HIDWORD(v7)) {
    return v6;
  }
  unsigned int v8 = a5;
  if (a3 && *a3)
  {
    int v13 = (arc4random_uniform(*a3) + 1);
    unsigned int v14 = (v13 * v8 * a3[1]) >> 8;
    uint32_t v15 = (v13 * v8 * a3[1]);
    if (v15 && v15 > arc4random_uniform(0x100u)) {
      LOBYTE(v14) = v14 + 1;
    }
    unsigned int v16 = v13 * v8 + v14;
    if (!(_DWORD)v7) {
      goto LABEL_14;
    }
  }

  else
  {
    LOBYTE(v14) = 0;
    int v13 = 1;
    unsigned int v16 = a5;
    if (!(_DWORD)v7) {
      goto LABEL_14;
    }
  }

  BOOL v17 = __CFADD__(v16, v7 - 1);
  v16 += v7 - 1;
  if (v17) {
    return 0LL;
  }
LABEL_14:
  unsigned int v18 = v16 - 1;
  unsigned int v19 = __clz(v16 - 1);
  unsigned int v20 = (((v16 - 1) >> (29 - v19)) & 3) - 4 * v19 + 119;
  if (v16 >= 9) {
    unsigned int v18 = v20;
  }
  BOOL v21 = (uint64_t *)(a1 + 16LL * v18 + 32);
  while (2)
  {
    uint64_t v22 = *v21;
    while (1)
    {
      uint64_t v6 = v22;
      if (!v22) {
        break;
      }
      if ((*(_BYTE *)(v22 + 32) & 0xF) == 1) {
        unsigned int v23 = 1;
      }
      else {
        unsigned int v23 = *(_DWORD *)(v22 + 40);
      }
      uint64_t v22 = *(void *)(v22 + 16);
      if (v23 >= v16)
      {
        if (v22)
        {
          *(void *)(v22 + 24) = *(void *)(v6 + 24);
          uint64_t v24 = *(void *)(v6 + 16);
        }

        else
        {
          uint64_t v24 = 0LL;
        }

        **(void **)(v6 + 24) = v24;
        unint64_t v25 = v6 & 0xFFFFFFFFFFFFC000LL;
        if ((_DWORD)v7 && (unsigned int v26 = -1431655765 * ((v6 - v25 - 2104) >> 4) % v7) != 0)
        {
          v23 += v26 - v7;
          uint64_t v6 = _xzm_segment_group_segment_slice_split(a1, v6 & 0xFFFFFFFFFFFFC000LL, v6, v23, 1);
        }

        else
        {
          unsigned int v8 = v16;
        }

        if (v23 > v8) {
          _xzm_segment_group_segment_span_free( a1,  v25,  v8 - 1431655765 * ((v6 - v25 - 2104) >> 4),  *(_DWORD *)(v6 + 40) - v8,  (*(unsigned __int8 *)(v6 + 32) >> 4) & 1);
        }
        uint64_t v27 = (uint64_t)(v6 - v25 - 2104) >> 4;
        unsigned int v28 = v14;
        if ((_BYTE)v14)
        {
          unsigned int v29 = v13 + 1;
          int v30 = ~(-1 << (v13 + 1));
          if (v28 >= (3 * (v13 + 1)) >> 2)
          {
            uint64_t v38 = ~(-1 << (v13 + 1));
            uint32_t v39 = v13 + 1;
          }

          else if (v28 <= v29 >> 2)
          {
            uint64_t v38 = 0LL;
            uint32_t v39 = 0;
          }

          else
          {
            uint32_t v31 = arc4random() & v30;
            v32.i32[0] = v31;
            uint8x8_t v33 = (uint8x8_t)vcnt_s8(v32);
            v33.i16[0] = vaddlv_u8(v33);
            unsigned __int32 v34 = v28 - v33.i32[0];
            if (v33.i32[0] >= v28) {
              unsigned __int32 v34 = v33.i32[0] - v28;
            }
            unsigned __int32 v35 = v28 - (v29 - v33.i32[0]);
            if (v29 - v33.i32[0] >= v28) {
              unsigned __int32 v35 = v29 - v33.i32[0] - v28;
            }
            BOOL v36 = v34 > v35;
            if (v34 <= v35) {
              int v37 = 0;
            }
            else {
              int v37 = ~(-1 << (v13 + 1));
            }
            uint64_t v38 = v37 ^ v31;
            if (v36) {
              uint32_t v39 = v29 - v33.i32[0];
            }
            else {
              uint32_t v39 = v33.i32[0];
            }
          }

          if (v39 >= v28)
          {
            if (v39 > v28) {
              LODWORD(v38) = _xzm_random_clear_n_bits(v38, v39, v39 - v28);
            }
          }

          else
          {
            LODWORD(v38) = _xzm_random_clear_n_bits(v38 ^ v30, v29 - v39, v28 - v39) ^ v30;
          }
        }

        else
        {
          LODWORD(v38) = 0;
        }

        unsigned int v40 = -1431655765 * v27;
        if (a2 == 2)
        {
          unsigned int v8 = 1;
        }

        else if (a2 == 5)
        {
          unsigned int v8 = 4;
        }

        uint64_t v6 = 0LL;
        if (v13)
        {
          int v41 = 0;
          char v42 = *(_BYTE *)(v25 + 48LL * v40 + 2136) & 0x10;
          do
          {
            if ((v38 & 1) != 0) {
              _xzm_segment_group_segment_create_guard(v25, v40++);
            }
            uint64_t v43 = _xzm_segment_group_segment_span_mark_allocated(v25, a2, v40, v8);
            *(_BYTE *)(v43 + 32) = *(_BYTE *)(v43 + 32) & 0xEF | v42;
            if (v41)
            {
              *(void *)(v43 + 16) = *a4;
              *a4 = v43;
            }

            else
            {
              uint64_t v6 = v43;
            }

            LODWORD(v38) = v38 >> 1;
            v40 += v8;
            ++v41;
          }

          while (v13 != v41);
        }

        if ((_DWORD)v38) {
          _xzm_segment_group_segment_create_guard(v25, v40);
        }
        return v6;
      }
    }

    v21 += 2;
    break;
  }

  return v6;
}

uint64_t _xzm_segment_group_alloc_segment_and_chunk( os_unfair_lock_s *a1, int a2, unsigned __int8 *a3, uint64_t *a4, unsigned int a5, unint64_t a6)
{
  uint64_t chunk = 0LL;
  if (_xzm_segment_group_alloc_segment((uint64_t)a1, 0LL, 0LL, 0LL, 0))
  {
    uint64_t chunk = _xzm_segment_group_find_and_allocate_chunk((uint64_t)a1, a2, a3, a4, a5, a6);
    os_unfair_lock_unlock(a1 + 1);
  }

  os_unfair_lock_unlock(a1 + 2);
  return chunk;
}

uint64_t _xzm_segment_group_overwrite_chunk(mach_vm_address_t a1, mach_vm_size_t size)
{
  mach_vm_address_t address = a1;
  uint64_t result = mach_vm_map(*MEMORY[0x1895FFD48], &address, size, 0LL, 33570816, 0, 0LL, 0, 3, 7, 1u);
  if ((_DWORD)result) {
    xzm_segment_group_alloc_chunk_cold_2(result);
  }
  return result;
}

uint64_t _xzm_segment_group_clear_chunk(char *a1, size_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = a1;
  uint64_t result = madvise(a1, a2, 11);
  if (v2 && (_DWORD)result)
  {
    do
    {
      if (v2 >= 0x80000) {
        size_t v5 = 0x80000LL;
      }
      else {
        size_t v5 = v2;
      }
      bzero(v3, v5);
      uint64_t result = mvm_madvise(v3, v5, 7);
      v3 += v5;
      v2 -= v5;
    }

    while (v2);
  }

  return result;
}

BOOL xzm_segment_group_segment_madvise_span(uint64_t a1, void *a2, unsigned int a3)
{
  return mvm_madvise(a2, (unint64_t)a3 << 14, 7);
}

BOOL xzm_segment_group_segment_madvise_chunk(uint64_t a1, uint64_t a2)
{
  int v2 = *(_BYTE *)(a2 + 32) & 0xF;
  if ((v2 - 6) < 2)
  {
    size_t v3 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
  }

  else if (v2 == 2)
  {
    size_t v3 = 0x4000LL;
  }

  else
  {
    if (v2 != 5) {
      xzm_segment_group_alloc_chunk_cold_1(v2);
    }
    size_t v3 = 0x10000LL;
  }

  return mvm_madvise( (void *)(((0xAAAAAAAAAAAAC000LL * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
                  + *(void *)((a2 & 0xFFFFFFFFFFFFC000LL) + 0x30)),
           v3,
           7);
}

void xzm_segment_group_free_chunk(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v3 = a2;
  uint64_t v4 = a1;
  int v5 = *(_BYTE *)(a2 + 32) & 0xF;
  if (v5 == 7)
  {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFC000LL;
LABEL_3:
    _xzm_segment_group_segment_deallocate(a1, v6);
    return;
  }

  if ((a3 & 1) != 0)
  {
    if ((v5 - 6) < 2)
    {
      mach_vm_size_t v29 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
    }

    else if (v5 == 2)
    {
      mach_vm_size_t v29 = 0x4000LL;
    }

    else
    {
      if (v5 != 5) {
        xzm_segment_group_alloc_chunk_cold_1(v5);
      }
      mach_vm_size_t v29 = 0x10000LL;
    }

    unint64_t v7 = (unsigned __int8 **)(v3 & 0xFFFFFFFFFFFFC000LL);
    a1 = _xzm_segment_group_overwrite_chunk( ((0xAAAAAAAAAAAAC000LL * (((v3 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
         + *(void *)((v3 & 0xFFFFFFFFFFFFC000LL) + 0x30),
           v29);
  }

  else
  {
    unint64_t v7 = (unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000LL);
  }

  if (v5 != 6 || (*(_BYTE *)(*(void *)(v4 + 24) + 328LL) & 2) == 0)
  {
    if (v5 != 5) {
      xzm_segment_group_segment_madvise_chunk(a1, v3);
    }
  }

  else
  {
    int v9 = *(_BYTE *)(v3 + 32) & 0xF;
    if ((v9 - 6) < 2)
    {
      mach_vm_size_t v10 = (unint64_t)*(unsigned int *)(v3 + 40) << 14;
    }

    else if (v9 == 2)
    {
      mach_vm_size_t v10 = 0x4000LL;
    }

    else
    {
      if (v9 != 5) {
        xzm_segment_group_alloc_chunk_cold_1(v9);
      }
      mach_vm_size_t v10 = 0x10000LL;
    }

    _xzm_segment_group_overwrite_chunk( (mach_vm_address_t)&v7[6][(0xAAAAAAAAAAAAC000LL * ((v3 - (unint64_t)v7 - 2104) >> 4)) & 0x3FFFFFFFC000LL],  v10);
  }

  os_unfair_lock_lock_with_options();
  char v11 = *(_BYTE *)(v3 + 32);
  unsigned int v12 = v11 & 0xF;
  if (v12 > 7) {
    xzm_segment_group_free_chunk_cold_3(v12);
  }
  unsigned int v13 = 1;
  if (((1 << v12) & 0x1B) == 0)
  {
    if (((1 << v12) & 0xE0) == 0) {
      goto LABEL_27;
    }
LABEL_26:
    unsigned int v13 = *(_DWORD *)(v3 + 40);
    goto LABEL_27;
  }

  if ((v11 & 0xD) != 1) {
    xzm_segment_group_free_chunk_cold_5();
  }
  if (v12 != 1) {
    goto LABEL_26;
  }
LABEL_27:
  *(_BYTE *)(v3 + 32) = v11 & 0xF0;
  if (v3 + 48LL * v13 < (unint64_t)&v7[6 * *((unsigned int *)v7 + 4) + 263])
  {
    unsigned int v14 = v13;
    char v15 = *(_BYTE *)(v3 + 48LL * v13 + 32);
    if ((v15 & 0xD) == 1)
    {
      int v16 = v15 & 0xF;
      if (v16 != 1) {
        int v16 = *(_DWORD *)(v3 + 48LL * v13 + 40);
      }
      v13 += v16;
      unint64_t v17 = v3 + 48LL * v14;
      uint64_t v20 = *(void *)(v17 + 16);
      unsigned int v18 = (uint64_t *)(v17 + 16);
      uint64_t v19 = v20;
      if (v20)
      {
        *(void *)(v19 + 24) = *(void *)(v3 + 48LL * v14 + 24);
        uint64_t v21 = *v18;
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      **(void **)(v3 + 48LL * v14 + 24) = v21;
    }
  }

  if ((unint64_t)(v7 + 263) < v3)
  {
    unint64_t v22 = v3 - 48;
    if ((*(_BYTE *)(v3 - 16) & 0xF) == 4)
    {
      unint64_t v30 = v22 - *(unsigned int *)(v3 - 12);
      unsigned int v31 = *(_BYTE *)(v30 + 32) & 0xF;
      if (v31 <= 8)
      {
        int v32 = 1 << v31;
        if ((v32 & 0x1E8) != 0)
        {
          goto LABEL_64;
        }

        if ((v32 & 6) != 0 && v22 == v30) {
LABEL_64:
        }
          v22 -= *(unsigned int *)(v3 - 12);
      }
    }

LABEL_37:
    char v23 = *(_BYTE *)(v22 + 32);
    if ((v23 & 0xD) == 1)
    {
      int v24 = v23 & 0xF;
      if (v24 != 1) {
        int v24 = *(_DWORD *)(v22 + 40);
      }
      v13 += v24;
      uint64_t v25 = *(void *)(v22 + 16);
      if (v25)
      {
        *(void *)(v25 + 24) = *(void *)(v22 + 24);
        uint64_t v25 = *(void *)(v22 + 16);
      }

      **(void **)(v22 + 24) = v25;
      unint64_t v3 = v22;
    }
  }

  _xzm_segment_group_segment_span_free( v4,  (uint64_t)v7,  -1431655765 * ((v3 - (unint64_t)(v7 + 263)) >> 4),  v13,  0);
  int v26 = *((_DWORD *)v7 + 2) - 1;
  *((_DWORD *)v7 + 2) = v26;
  unsigned int v27 = **v7;
  if (v27 < 2)
  {
    if (!v26)
    {
      unsigned int v28 = v7[265];
      if (v28)
      {
        *((void *)v28 + 3) = v7[266];
        unsigned int v28 = v7[265];
      }

      *(void *)v7[266] = v28;
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 4));
      a1 = v4;
      unint64_t v6 = (unint64_t)v7;
      goto LABEL_3;
    }
  }

  else if (v27 - 2 >= 2)
  {
    xzm_segment_group_free_chunk_cold_4(v27);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 4));
}

      if (++v10 == 31)
      {
        _simple_sappend();
        int v9 = v19 + 1;
        goto LABEL_10;
      }
    }
  }

  if (!v13) {
    goto LABEL_38;
  }
LABEL_17:
  if (v13 >= 0x401 && (*(_BYTE *)(a1 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  if (v14) {
    char v15 = v14;
  }
  else {
    char v15 = a1;
  }
  _xzm_free(v15, a2, 1);
}

  if ((v4 & 1) == 0) {
    mprotect(zone, 0xC8uLL, 1);
  }
}

uint64_t xzm_segment_group_try_realloc_large_chunk( os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v7 = *(_DWORD *)(a3 + 40);
  if (v7 >= a4)
  {
    if (v7 > a4)
    {
      os_unfair_lock_lock_with_options();
      unsigned int v21 = *(_DWORD *)(a3 + 40) - a4;
      *(_DWORD *)(a3 + 40) = a4;
      uint64_t v22 = a3 + 48LL * (a4 - 1);
      *(_BYTE *)(v22 + 32) = *(_BYTE *)(v22 + 32) & 0xF0 | 4;
      *(_DWORD *)(v22 + 36) = 48 * (a4 - 1);
      if (v21 >= 2) {
        int v23 = 6;
      }
      else {
        int v23 = 2;
      }
      _xzm_segment_group_segment_span_mark_allocated( a3 & 0xFFFFFFFFFFFFC000LL,  v23,  -1431655765 * ((a3 + 48LL * a4 - (a3 & 0xFFFFFFFFFFFFC000LL) - 2104) >> 4),  v21);
      os_unfair_lock_unlock(a1 + 1);
      xzm_segment_group_free_chunk((uint64_t)a1, a3 + 48LL * a4, 0);
    }

    return 1LL;
  }

  os_unfair_lock_lock_with_options();
  unsigned int v9 = *(_DWORD *)(a3 + 40);
  unint64_t v10 = a3 + 48LL * v9;
  if (v10 < a2 + 48 * (unint64_t)*(unsigned int *)(a2 + 16) + 2104)
  {
    uint64_t v11 = a3 + 48LL * v9;
    char v14 = *(_BYTE *)(v11 + 32);
    unsigned int v12 = (unsigned __int8 *)(v11 + 32);
    char v13 = v14;
    if ((v14 & 0xD) == 1)
    {
      uint64_t v15 = a4 - v9;
      if ((v13 & 0xF) == 1)
      {
        if (v15 <= 1)
        {
LABEL_6:
          uint64_t v16 = a3 + 48LL * v9;
          uint64_t v19 = *(void *)(v16 + 16);
          unint64_t v17 = (uint64_t *)(v16 + 16);
          uint64_t v18 = v19;
          if (v19)
          {
            *(void *)(v18 + 24) = *(void *)(a3 + 48LL * v9 + 24);
            uint64_t v20 = *v17;
          }

          else
          {
            uint64_t v20 = 0LL;
          }

          **(void **)(a3 + 48LL * v9 + 24) = v20;
          unsigned int v25 = *v12;
          unsigned int v26 = v25 & 0xF;
          if (v26 != 1) {
            unsigned int v26 = *(_DWORD *)(a3 + 48LL * v9 + 40);
          }
          if (v26 > v15) {
            _xzm_segment_group_segment_span_free( (uint64_t)a1,  a2,  v15 - 1431655765 * ((v10 - a2 - 2104) >> 4),  *(_DWORD *)(a3 + 48LL * v9 + 40) - v15,  (v25 >> 4) & 1);
          }
          if (a4 != v9)
          {
            int v27 = 48 * v9;
            uint64_t v28 = a3 + 48LL * v9 + 32;
            do
            {
              *(_BYTE *)uint64_t v28 = *(_BYTE *)v28 & 0xF0 | 4;
              *(_DWORD *)(v28 + 4) = v27;
              v27 += 48;
              v28 += 48LL;
              --v15;
            }

            while (v15);
          }

          *(_DWORD *)(a3 + 40) = a4;
          os_unfair_lock_unlock(a1 + 1);
          return 1LL;
        }
      }

      else if (*(_DWORD *)(a3 + 48LL * v9 + 40) >= v15)
      {
        goto LABEL_6;
      }
    }
  }

  os_unfair_lock_unlock(a1 + 1);
  return 0LL;
}

uint64_t _xzm_segment_group_segment_slice_split(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v6 = *(_DWORD *)(a3 + 40) - a4;
  if (a5)
  {
    uint64_t v7 = a3 + 48LL * v6;
    *(_DWORD *)(v7 + 40) = a4;
    char v8 = *(_BYTE *)(v7 + 32) & 0xF0 | 3;
    *(_BYTE *)(v7 + 32) = v8;
    *(_BYTE *)(v7 + 32) = v8 & 0xEF | *(_BYTE *)(a3 + 32) & 0x10;
    unsigned int v9 = -1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
  }

  else
  {
    unsigned int v9 = a4 - 1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
    uint64_t v7 = a3;
  }

  _xzm_segment_group_segment_span_free(a1, a2, v9, v6, (*(unsigned __int8 *)(a3 + 32) >> 4) & 1);
  return v7;
}

uint64_t _xzm_segment_group_segment_span_mark_allocated(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = a1 + 48 * a3;
  uint64_t v5 = v4 + 2104;
  unsigned int v6 = a4 - 1;
  if (a4 - 1 >= 3) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = v6;
  }
  unint64_t v8 = *(unsigned int *)(a1 + 16);
  if (v7 + a3 >= v8) {
    uint64_t v7 = v8 + ~a3;
  }
  if (v7)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 2LL;
    uint64_t v11 = a1 + 48 * a3;
    uint64_t v12 = v10 - 1;
    do
    {
      uint64_t v13 = v11 + v9;
      *(_BYTE *)(v13 + 2184) = *(_BYTE *)(v11 + v9 + 2184) & 0xF0 | 4;
      v9 += 48LL;
      *(_DWORD *)(v13 + 2188) = v9;
      --v12;
    }

    while (v12);
    uint64_t v4 = a1 + 48 * a3 + v9;
  }

  unint64_t v14 = v4 + 2152;
  if (a2 == 7) {
    goto LABEL_16;
  }
  uint64_t v15 = a3 + a4 - 1;
  if (a1 + 48 * v15 + 2104 >= v14)
  {
    uint64_t v16 = a1 + 48 * v15;
    *(_BYTE *)(v16 + 2136) = *(_BYTE *)(v16 + 2136) & 0xF0 | 4;
    *(_DWORD *)(v16 + 2140) = 48 * v6;
  }

  if (a2 != 2) {
LABEL_16:
  }
    *(_DWORD *)(a1 + 48 * a3 + 2144) = a4;
  *(_BYTE *)(a1 + 48 * a3 + 2136) = *(_BYTE *)(a1 + 48 * a3 + 2136) & 0xF0 | a2 & 0xF;
  ++*(_DWORD *)(a1 + 8);
  return v5;
}

uint64_t xzm_segment_group_try_realloc_huge_chunk( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v8 = *(unsigned int *)(a4 + 40);
  if (a5 <= v8)
  {
    uint64_t v12 = *(unsigned int *)(a3 + 12);
    if ((_DWORD)v12 == a5) {
      return 1LL;
    }
    uint64_t v13 = *(void *)(a3 + 48);
    unint64_t v14 = v13 + (v12 << 14);
    mach_vm_address_t v15 = v13 + ((unint64_t)a5 << 14);
    if (v15 >= v14)
    {
      return 1LL;
    }

    else
    {
      unint64_t v16 = (unint64_t)a5 << 14;
      unint64_t v17 = (v15 & 0xFFFFFFFFFFC00000LL) + 0x400000;
      if ((v15 & 0x3FFFFF) == 0) {
        unint64_t v17 = v15;
      }
      if (v17 < v14)
      {
        uint64_t v18 = *(void *)(a1 + 24);
        do
        {
          unint64_t v19 = v17 >> 22;
          if (v17 >> 36) {
            unint64_t v19 = 0x4000LL;
          }
          if (v19 >> 14) {
            uint64_t v20 = 0LL;
          }
          else {
            uint64_t v20 = (_DWORD *)(*(void *)(v18 + 408) + 4 * v19);
          }
          *uint64_t v20 = 0;
          v17 += 0x400000LL;
        }

        while (v17 < v14);
      }

      mvm_deallocate_plat(v15, v14 - v15, 0);
      uint64_t v21 = 1LL;
      _xzm_segment_group_init_segment(a1, a3, *(void *)(a3 + 48), v16, 1, 0);
    }
  }

  else
  {
    int v10 = *(_BYTE *)(a4 + 32) & 0xF;
    if ((v10 - 6) < 2)
    {
      uint64_t v11 = v8 << 14;
    }

    else if (v10 == 2)
    {
      uint64_t v11 = 0x4000LL;
    }

    else
    {
      if (v10 != 5) {
        xzm_segment_group_alloc_chunk_cold_1(v10);
      }
      uint64_t v11 = 0x10000LL;
    }

    mach_vm_address_t v23 = v22 + v11;
    uint64_t v24 = a5 - v8;
    unint64_t v25 = (v22 + v11 + 0x3FFFFF) & 0xFFFFFFFFFFC00000LL;
    unint64_t v26 = v22 + v11 + (v24 << 14);
    if (v25 < v26)
    {
      unint64_t v27 = v25;
      do
      {
        unint64_t v28 = v27 >> 22;
        if (v27 >> 36) {
          unint64_t v28 = 0x4000LL;
        }
        if (!(v28 >> 14))
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 24) + 408LL);
          if (v29)
          {
            if (*(_DWORD *)(v29 + 4 * v28)) {
              return 0LL;
            }
          }
        }

        v27 += 0x400000LL;
      }

      while (v27 < v26);
    }

    uint64_t v21 = 1LL;
    _xzm_segment_group_init_segment(a1, a3, *(void *)(a3 + 48), (unint64_t)a5 << 14, 1, 0);
    if (v22 + ((unint64_t)a5 << 14) > v25)
    {
      if (*(void *)(a2 + 232)) {
        uint64_t v30 = *(void *)(a2 + 232);
      }
      else {
        uint64_t v30 = a2;
      }
      _xzm_segment_table_allocated_at(v30, v25, a3);
    }
  }

  return v21;
}

uint64_t _xzm_segment_group_init_segment( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5, int a6)
{
  if (a2 >> 36) {
    _xzm_segment_group_init_segment_cold_3();
  }
  if (a3 >> 36) {
    _xzm_segment_group_init_segment_cold_2();
  }
  if (a4 >> 46) {
    _xzm_segment_group_init_segment_cold_1();
  }
  *(void *)a2 = a1;
  int v9 = a4 >> 14;
  if (((a4 >> 14) & 0xFFFFFF00) != 0) {
    int v9 = 256;
  }
  unint64_t v10 = a4 >> 14;
  *(_DWORD *)(a2 + 12) = a4 >> 14;
  *(_DWORD *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)(a2 + 48) = a3;
  *(_BYTE *)(a2 + 20) = a5;
  if (a5)
  {
    uint64_t result = _xzm_segment_group_segment_span_mark_allocated(a2, 7, 0LL, a4 >> 14);
    if (a6) {
      char v12 = 16;
    }
    else {
      char v12 = 0;
    }
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xEF | v12;
  }

  else
  {
    os_unfair_lock_lock_with_options();
    _xzm_segment_group_segment_span_free(a1, a2, 0, v10, a6);
    return 0LL;
  }

  return result;
}

uint64_t _xzm_segment_table_allocated_at(uint64_t result, unint64_t a2, unint64_t a3)
{
  if (a3 >= 0x3FFFFFFFC000LL) {
    _xzm_segment_table_allocated_at_cold_1();
  }
  for (unint64_t i = *(void *)(a3 + 48) + ((unint64_t)*(unsigned int *)(a3 + 12) << 14); a2 < i; a2 += 0x400000LL)
  {
    unint64_t v4 = a2 >> 22;
    if (a2 >> 36) {
      unint64_t v4 = 0x4000LL;
    }
    if (v4 >> 14) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = (unsigned int *)(*(void *)(result + 408) + 4 * v4);
    }
    atomic_store(a3 >> 14, v5);
  }

  return result;
}

uint64_t _xzm_segment_group_alloc_segment(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, int a5)
{
  kern_return_t v25;
  mach_vm_address_t address;
  int v8 = a2 != 0;
  if (a2) {
    mach_vm_size_t v9 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
  }
  else {
    mach_vm_size_t v9 = 0x400000LL;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = v8 | 2u;
  if (a5) {
    LOBYTE(v8) = v8 | 2;
  }
  if (!*(_BYTE *)v10)
  {
    if ((*(_BYTE *)(*(void *)(v10 + 8) + 328LL) & 1) != 0)
    {
      mach_vm_address_t pages_plat = _xzm_range_group_alloc_anywhere_segment(0LL, v9, a3, v11, v8);
      goto LABEL_26;
    }

    if (a5) {
      int v15 = 128;
    }
    else {
      int v15 = 0;
    }
    unint64_t v16 = __clz(__rbit64(a3));
    if (v16 <= 0x16) {
      LODWORD(v16) = 22;
    }
    if (a3) {
      int v14 = v16;
    }
    else {
      int v14 = 22;
    }
    unint64_t v13 = v9;
    int v12 = v15;
LABEL_22:
    mach_vm_address_t pages_plat = mvm_allocate_pages_plat(v13, v14, v12, v11);
LABEL_26:
    mach_vm_address_t v21 = pages_plat;
    goto LABEL_27;
  }

  if ((*(_BYTE *)(*(void *)(v10 + 8) + 328LL) & 1) == 0)
  {
    if (a5) {
      int v12 = 128;
    }
    else {
      int v12 = 0;
    }
    unint64_t v13 = v9;
    int v14 = 22;
    goto LABEL_22;
  }

  os_unfair_lock_lock_with_options();
  mach_vm_size_t v18 = *(void *)(v10 + 48);
  BOOL v19 = v18 >= v9;
  mach_vm_size_t v20 = v18 - v9;
  if (!v19)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
LABEL_34:
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment - out of space\n");
    return 0LL;
  }

  mach_vm_address_t v21 = *(void *)(v10 + 40);
  *(void *)(v10 + 40) = v21 + v9;
  *(void *)(v10 + 48) = v20;
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
  if (!v21) {
    goto LABEL_34;
  }
  mach_vm_address_t address = v21;
  unint64_t v25 = mach_vm_map(*MEMORY[0x1895FFD48], &address, v9, 0LL, 33570816, 0, 0LL, 0, 3, 7, 1u);
  if (v25) {
    _xzm_segment_group_alloc_segment_cold_2(v25);
  }
LABEL_27:
  if (!v21) {
    return 0LL;
  }
  if (v21 >> 36) {
    _xzm_segment_group_alloc_segment_cold_1();
  }
  unint64_t v22 = xzm_metapool_alloc(*(void *)(*(void *)(a1 + 24) + 400LL));
  uint64_t v23 = 1LL;
  uint64_t inited = _xzm_segment_group_init_segment(a1, v22, v21, v9, a2 != 0, 1);
  _xzm_segment_table_allocated_at(*(void *)(a1 + 24), v21, v22);
  if (a2) {
    *a4 = inited;
  }
  return v23;
}

uint64_t _xzm_segment_group_segment_create_guard(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = a1 + 2104 + 48LL * a2;
  else {
    unsigned int v3 = 1;
  }
  if (v2 <= a1 + 2104) {
    goto LABEL_9;
  }
  unint64_t v4 = v2 - 48;
  if ((*(_BYTE *)(v2 - 16) & 0xF) == 4)
  {
    unint64_t v10 = v4 - *(unsigned int *)(v2 - 12);
    unsigned int v11 = *(_BYTE *)(v10 + 32) & 0xF;
    if (v11 <= 8)
    {
      int v12 = 1 << v11;
      if ((v12 & 0x1E8) != 0)
      {
        goto LABEL_26;
      }

      if ((v12 & 6) != 0 && v4 == v10) {
LABEL_26:
      }
        v4 -= *(unsigned int *)(v2 - 12);
    }
  }

LABEL_7:
  if ((*(_BYTE *)(v4 + 32) & 0xF) == 8)
  {
    int v5 = *(_DWORD *)(v4 + 40);
    a2 -= v5;
    v3 += v5;
    goto LABEL_10;
  }

LABEL_9:
  unint64_t v4 = a1 + 2104 + 48LL * a2;
LABEL_10:
  if (v3 < 2)
  {
    ++*(_DWORD *)(a1 + 8);
    uint64_t v7 = v3;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = v3;
    do
    {
      uint64_t v8 = v4 + v6;
      *(_DWORD *)(v8 + 84) = v6 + 48;
      *(_BYTE *)(v8 + 80) = *(_BYTE *)(v4 + v6 + 80) & 0xF0 | 4;
      v6 += 48LL;
    }

    while (48LL * v3 - 48 != v6);
  }

  *(_DWORD *)(v4 + 40) = v3;
  uint64_t result = mprotect((void *)(*(void *)(a1 + 48) + ((unint64_t)a2 << 14)), v7 << 14, 0);
  if ((_DWORD)result) {
    _xzm_segment_group_segment_create_guard_cold_1();
  }
  *(_BYTE *)(v4 + 32) = *(_BYTE *)(v4 + 32) & 0xF0 | 8;
  return result;
}

            uint64_t result = 0LL;
            if (++v13 == v33) {
              return result;
            }
          }
        }

        return 0LL;
      }
    }
  }

  return result;
}

        int v14 = 0LL;
LABEL_10:
        int v15 = 12;
        goto LABEL_11;
      }

      int v14 = 0LL;
      int v15 = 22;
    }
  }

  unint64_t v4 = (int32_t *)pFRZCounterLive;
  OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
  if (malloc_num_zones <= initial_num_zones)
  {
LABEL_13:
    unint64_t v2 = 0LL;
  }

  else
  {
    int v5 = 8LL * initial_num_zones;
    uint64_t v6 = malloc_num_zones - initial_num_zones;
    while (!malloc_zone_claimed_address(*(void *)((char *)malloc_zones + v5), a1))
    {
      v5 += 8LL;
      if (!--v6) {
        goto LABEL_13;
      }
    }

    unint64_t v2 = 1LL;
  }

  OSAtomicDecrement32Barrier(v4);
  return v2;
}

            uint64_t result = 0LL;
            if (++v13 == v39) {
              return result;
            }
          }

          uint64_t result = v4(v11, v14, 0x100000LL, &v42);
          if (!(_DWORD)result)
          {
            unint64_t v16 = *v38;
            if ((int)v16 < 1)
            {
              unint64_t v17 = 0;
            }

            else
            {
              unint64_t v17 = 0;
              mach_vm_size_t v18 = (void *)(v41 + 24);
              do
              {
                if (v14 == *v18) {
                  ++v17;
                }
                v18 += 320;
                --v16;
              }

              while (v16);
            }

            BOOL v19 = *(_DWORD *)(v42 + 24);
            if (v14 == *(void *)(v41 + 2560LL * v19 + 2144))
            {
              unint64_t v22 = v41 + 2560LL * v19;
              mach_vm_size_t v20 = *(void *)(v22 + 2136) >> 4;
              mach_vm_address_t v21 = 64504 - (*(void *)(v22 + 2128) >> 4);
            }

            else
            {
              LODWORD(v20) = 0;
              mach_vm_address_t v21 = 64504;
            }

            uint64_t v23 = 0;
            uint64_t v24 = v42 + 40;
            unint64_t v25 = v42 + 44;
            while (1)
            {
              unint64_t v26 = (16 * v20);
              if (((*(_DWORD *)(v24 + 4LL * (((v20 + 1) >> 4) & 0xFFE)) >> (v20 + 1)) & 1) == 0)
              {
                unsigned int v31 = *(_WORD *)(v42 + v26 + 16528);
LABEL_41:
                if (!v31) {
                  return 5LL;
                }
                goto LABEL_42;
              }

              unsigned int v31 = 1;
LABEL_42:
              LODWORD(v20) = v20 + v31;
              if (v20 >= v21)
              {
                unint64_t v10 = v36;
                unint64_t v2 = v37;
                uint64_t v8 = v34;
                if (v23) {
                  v37(v11, v36, 1LL, v46);
                }
                goto LABEL_9;
              }
            }

            if (v17)
            {
              unint64_t v27 = *v38;
              if ((int)v27 >= 1)
              {
                unint64_t v28 = (_WORD *)(v41 + 16);
                while (v15 + v26 != *((void *)v28 - 1))
                {
                  v28 += 1280;
                  if (!--v27) {
                    goto LABEL_34;
                  }
                }

                unsigned int v31 = *v28;
                if (!*v28) {
                  return 5LL;
                }
                --v17;
                goto LABEL_42;
              }
            }

uint64_t _xzm_random_clear_n_bits(uint64_t a1, uint32_t __upper_bound, int a3)
{
  if (a3)
  {
    int v4 = a3;
    do
    {
      uint32_t v6 = arc4random_uniform(__upper_bound);
      int v7 = a1;
      if (v6)
      {
        int v7 = a1;
        do
        {
          v7 &= v7 - 1;
          --v6;
        }

        while (v6);
      }

      a1 = v7 & -v7 ^ a1;
      --__upper_bound;
      --v4;
    }

    while (v4);
  }

  return a1;
}

void _xzm_segment_group_segment_deallocate(uint64_t a1, uint64_t a2)
{
  mach_vm_address_t v4 = *(void *)(a2 + 48);
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  mach_vm_address_t v6 = v4 + (v5 << 14);
  if (v4 >= v6)
  {
    mach_vm_size_t v10 = v5 << 14;
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 24);
    do
    {
      unint64_t v8 = v4 >> 22;
      if (v4 >> 36) {
        unint64_t v8 = 0x4000LL;
      }
      if (v8 >> 14) {
        mach_vm_size_t v9 = 0LL;
      }
      else {
        mach_vm_size_t v9 = (_DWORD *)(*(void *)(v7 + 408) + 4 * v8);
      }
      *mach_vm_size_t v9 = 0;
      v4 += 0x400000LL;
    }

    while (v4 < v6);
    mach_vm_address_t v4 = *(void *)(a2 + 48);
    mach_vm_size_t v10 = (unint64_t)*(unsigned int *)(a2 + 12) << 14;
  }

  mvm_deallocate_plat(v4, v10, 0);
  xzm_metapool_free(*(void *)(*(void *)(a1 + 24) + 400LL), (void *)a2);
}

uint64_t _xzm_segment_group_segment_span_free( uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v5 = a2 + 48LL * a3;
  mach_vm_address_t v6 = (_BYTE *)(v5 + 2136);
  if (a5) {
    char v7 = 16;
  }
  else {
    char v7 = 0;
  }
  char v8 = *(_BYTE *)(v5 + 2136) & 0xE0 | v7;
  unsigned int v9 = a4 - 1;
  if (a4 == 1)
  {
    *mach_vm_address_t v6 = v8 | 1;
    unsigned int v9 = *(unsigned __int8 *)(a2 + 20);
    if (*(_BYTE *)(a2 + 20)) {
      return result;
    }
  }

  else
  {
    *mach_vm_address_t v6 = v8 | 3;
    *(_DWORD *)(a2 + 2104 + 48LL * a3 + 40) = a4;
    uint64_t v10 = a2 + 2104 + 48LL * (v9 + a3);
    *(_BYTE *)(v10 + 32) = *(_BYTE *)(v10 + 32) & 0xF0 | 4;
    *(_DWORD *)(v10 + 36) = 48 * a4 - 48;
    if (*(_BYTE *)(a2 + 20)) {
      return result;
    }
    unsigned int v11 = __clz(v9);
    int v12 = ((v9 >> (29 - v11)) & 3) - 4 * v11 + 119;
    if (a4 >= 9) {
      unsigned int v9 = v12;
    }
  }

  uint64_t v13 = v5 + 2104;
  uint64_t v14 = result + 16LL * v9;
  uint64_t v16 = *(void *)(v14 + 32);
  uint64_t v15 = v14 + 32;
  uint64_t v17 = a2 + 48LL * a3;
  *(void *)(v17 + 2120) = v16;
  if (v16) {
    *(void *)(*(void *)v15 + 24LL) = v17 + 2120;
  }
  *(void *)uint64_t v15 = v13;
  *(void *)(v17 + 2128) = v15;
  return result;
}

_BYTE *malloc_common_strstr(_BYTE *a1)
{
  if (!*a1) {
    return 0LL;
  }
  size_t v1 = a1;
  while (_platform_strncmp())
  {
    if (!*++v1) {
      return 0LL;
    }
  }

  return v1;
}

uint64_t malloc_common_convert_to_long(char *a1, void *a2)
{
  uint64_t v3 = 0LL;
  do
  {
    mach_vm_address_t v4 = a1;
    uint64_t result = v3;
    uint64_t v6 = *a1;
    if (!v6) {
      break;
    }
    unsigned int v7 = (v6 - 58);
    uint64_t v3 = (v6 - 48) + 10 * v3;
    a1 = v4 + 1;
  }

  while (v7 > 0xF5);
  *a2 = v4;
  return result;
}

unsigned __int8 *malloc_common_value_for_key(unsigned __int8 *a1, char *__s)
{
  size_t v3 = strlen(__s);
  int v4 = *a1;
  while (v4)
  {
    if (_platform_strncmp())
    {
      int v5 = *++a1;
      int v4 = v5;
    }

    else
    {
      if (v3) {
        a1 += v3;
      }
      int v4 = *a1;
      if (v4 == 61) {
        return a1 + 1;
      }
    }
  }

  return 0LL;
}

_BYTE *malloc_common_value_for_key_copy(unsigned __int8 *a1, char *a2, _BYTE *a3, unint64_t a4)
{
  uint64_t v6 = malloc_common_value_for_key(a1, a2);
  if (!v6) {
    return 0LL;
  }
  unsigned int v7 = a3;
  if (a4 >= 2)
  {
    unsigned int v7 = a3;
    do
    {
      unsigned int v8 = *v6;
      if (v8 <= 0x20 && ((1LL << v8) & 0x100000601LL) != 0) {
        break;
      }
      ++v6;
      *v7++ = v8;
      --a4;
    }

    while (a4 > 1);
  }

  *unsigned int v7 = 0;
  return a3;
}

uint64_t malloc_zone_batch_malloc_fallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = a4;
  while (1)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2);
    if (!v9) {
      break;
    }
    *(void *)(a3 + 8 * v7++) = v9;
    if (v8 == v7) {
      return v8;
    }
  }

  return v7;
}

uint64_t malloc_zone_batch_free_fallback(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v5 = result;
    unsigned int v6 = a3 - 1;
    for (unsigned int i = 1; i <= a3; ++i)
    {
      if (*(void *)(a2 + 8LL * v6)) {
        uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 48))(v5);
      }
      --v6;
    }
  }

  return result;
}

uint64_t malloc_zone_pressure_relief_fallback()
{
  return 0LL;
}

uint64_t _malloc_is_platform_binary()
{
  else {
    return 0LL;
  }
}

BOOL _malloc_allow_internal_security_policy()
{
  return MEMORY[0xFFFFF4084] != 0;
}

mach_vm_address_t create_purgeable_zone(uint64_t a1, uint64_t a2, int a3)
{
  mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x189600148] + 18943LL) & -*MEMORY[0x189600148], 0, 0x40000000, 1);
  mach_vm_address_t v6 = pages;
  if (pages)
  {
    uint64_t v7 = (int *)(pages + 16392);
    int v8 = a3 | 0x80;
    rack_init(pages + 16512, 1, 0, a3 | 0x80);
    rack_init(v6 + 17280, 2, 0, a3 | 0x80);
    *(_DWORD *)(v6 + 104) = 11;
    *(void *)(v6 + 16) = purgeable_size;
    *(void *)(v6 + 24) = purgeable_malloc;
    *(void *)(v6 + 32) = purgeable_calloc;
    *(void *)(v6 + 40) = purgeable_valloc;
    *(void *)(v6 + 48) = purgeable_free;
    *(void *)(v6 + 56) = purgeable_realloc;
    *(void *)(v6 + 64) = purgeable_destroy;
    *(void *)(v6 + 80) = purgeable_batch_malloc;
    *(void *)(v6 + 88) = purgeable_batch_free;
    *(void *)(v6 + 96) = &purgeable_introspect;
    *(void *)(v6 + 112) = purgeable_memalign;
    *(void *)(v6 + 120) = purgeable_free_definite_size;
    *(void *)(v6 + 128) = purgeable_pressure_relief;
    *(void *)(v6 + 136) = purgeable_claimed_address;
    *(void *)mach_vm_address_t v6 = 0LL;
    *(void *)(v6 + 8) = 0LL;
    mprotect((void *)v6, 0xC8uLL, 1);
    *uint64_t v7 = a3 | 0x80;
    if ((a3 & 7) != 0)
    {
      if ((a3 & 4) == 0)
      {
        malloc_report(6u, (uint64_t)"purgeable zone does not support guard pages\n");
        int v8 = *v7;
      }

      *uint64_t v7 = v8 & 0xFFFFFFF8;
    }

    *(_DWORD *)(v6 + 18816) = 0;
    *(void *)(v6 + 18864) = a2;
  }

  return v6;
}

unint64_t purgeable_malloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 18864);
  }
  return szone_malloc(a1, a2);
}

unint64_t purgeable_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1 || is_mul_ok(a2, a3) && (a3 *= a2, a3 <= malloc_absolute_max_size))
  {
    if (a3 <= 0x3C00) {
      a1 = *(void *)(a1 + 18864);
    }
    return szone_calloc(a1, 1uLL, a3);
  }

  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return 0LL;
  }

mach_vm_address_t purgeable_valloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 18864);
  }
  return szone_valloc(a1, a2);
}

void purgeable_free(uint64_t a1, unint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = large_entry_for_pointer_no_lock(a1, a2);
  os_unfair_lock_unlock(v4);
  if (v5) {
    free_large(a1, a2, 0);
  }
  else {
    szone_free(*(void *)(a1 + 18864), a2);
  }
}

uint64_t purgeable_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (!a2)
  {
    if (a3 <= 0x3C00) {
      uint64_t v4 = *(void *)(a1 + 18864);
    }
    uint64_t v8 = v4;
    unint64_t v9 = a3;
    return szone_malloc(v8, v9);
  }

  if (!a3)
  {
    purgeable_free(a1, (unint64_t)a2);
    uint64_t v8 = *(void *)(v4 + 18864);
    unint64_t v9 = 1LL;
    return szone_malloc(v8, v9);
  }

  size_t v6 = szone_size_try_large(a1, (unint64_t)a2);
  if (!v6)
  {
    size_t v6 = szone_size(*(void *)(v4 + 18864), (unint64_t)a2);
    if (!v6)
    {
      malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
      return 0LL;
    }
  }

  if (v6 <= 0x3C00)
  {
    if (a3 <= 0x3C00) {
      return szone_realloc(*(void *)(v4 + 18864), (unint64_t)a2, a3);
    }
    uint64_t v14 = (void *)szone_malloc(v4, a3);
    unsigned int v11 = v14;
    if (!v14) {
      return (uint64_t)v11;
    }
    memcpy(v14, a2, v6);
    uint64_t v15 = *(void *)(v4 + 18864);
    goto LABEL_24;
  }

  if (a3 > 0x3C00)
  {
    uint64_t v10 = (void *)szone_malloc(v4, a3);
    unsigned int v11 = v10;
    if (v10)
    {
      if (v6 >= a3) {
        size_t v13 = a3;
      }
      else {
        size_t v13 = v6;
      }
      int v12 = a2;
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v10 = (void *)szone_malloc(*(void *)(v4 + 18864), a3);
    unsigned int v11 = v10;
    if (v10)
    {
      int v12 = a2;
      size_t v13 = a3;
LABEL_23:
      memcpy(v10, v12, v13);
      uint64_t v15 = v4;
LABEL_24:
      szone_free_definite_size(v15, (unint64_t)a2, v6);
    }
  }

  return (uint64_t)v11;
}

uint64_t purgeable_destroy(uint64_t a1)
{
  unint64_t v2 = (unsigned int *)(a1 + 16392);
  uint64_t v3 = *(unsigned int *)(a1 + 18824);
  if ((_DWORD)v3)
  {
    uint64_t v4 = 24 * v3;
    do
    {
      uint64_t v5 = *(void *)(a1 + 18832) + v4;
      uint64_t v6 = *(void *)(v5 - 24);
      if (v6) {
        mvm_deallocate_pages(v6, *(void *)(v5 - 16), *v2);
      }
      v4 -= 24LL;
    }

    while (v4);
    unsigned int v7 = v2[608];
  }

  else
  {
    unsigned int v7 = 0;
  }

  large_entries_free_no_lock(a1, *(void *)(a1 + 18832), v7, &v9);
  if (v10) {
    mvm_deallocate_pages(v9, v10, 0LL);
  }
  return mvm_deallocate_pages(a1, (*MEMORY[0x189600148] + 18943LL) & -*MEMORY[0x189600148], 0LL);
}

uint64_t purgeable_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return szone_batch_malloc(*(void *)(a1 + 18864), a2, a3, a4);
}

void purgeable_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
}

mach_vm_address_t purgeable_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00) {
    a1 = *(void *)(a1 + 18864);
  }
  return szone_memalign(a1, a2, a3);
}

void purgeable_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00) {
    a1 = *(void *)(a1 + 18864);
  }
  szone_free_definite_size(a1, a2, a3);
}

uint64_t purgeable_pressure_relief()
{
  uint64_t v0 = szone_pressure_relief();
  return szone_pressure_relief() + v0;
}

BOOL purgeable_claimed_address(uint64_t a1, unint64_t a2)
{
  return szone_claimed_address(*(void *)(a1 + 18864), a2);
}

uint64_t purgeable_ptr_in_use_enumerator( uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t v5 = a5;
  if (!a5)
  {
    if ((_DWORD)task && !mach_task_is_self(task)) {
      purgeable_ptr_in_use_enumerator_cold_1();
    }
    uint64_t v5 = _malloc_default_reader;
  }

  uint64_t result = v5(task, a4, 18944LL, &v9);
  if (!(_DWORD)result) {
    return large_in_use_enumerator();
  }
  return result;
}

uint64_t purgeable_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 18864);
  }
  return szone_good_size(a1, a2);
}

uint64_t purgeable_check()
{
  return 1LL;
}

uint64_t purgeable_print_self()
{
  uint64_t result = *MEMORY[0x1895FFD48];
  if ((_DWORD)result)
  {
    uint64_t result = mach_task_is_self(result);
    if (!(_DWORD)result) {
      purgeable_ptr_in_use_enumerator_cold_1();
    }
  }

  return result;
}

uint64_t purgeable_log(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16400) = a2;
  return result;
}

uint64_t purgeable_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void purgeable_force_unlock(os_unfair_lock_s *a1)
{
}

uint64_t purgeable_statistics(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)(result + 18820);
  uint64_t v2 = *(void *)(result + 18840);
  *(void *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t purgeable_locked(os_unfair_lock_s *a1)
{
  size_t v1 = a1 + 4704;
  if (!os_unfair_lock_trylock(a1 + 4704)) {
    return 1LL;
  }
  os_unfair_lock_unlock(v1);
  return 0LL;
}

uint64_t purgeable_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 18816) = 0;
  return result;
}

uint64_t purgeable_print_task( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), uint64_t (*a5)(const char *, ...))
{
  uint64_t result = a4(a1, a3, 18944LL, &v8);
  if ((_DWORD)result) {
    return a5( "Purgeable zone %p: inUse=%u(%y) flags=%d\n",  a3,  *(unsigned int *)(v8 + 18820),  *(void *)(v8 + 18840),  *(unsigned int *)(v8 + 16392));
  }
  return result;
}

uint64_t _malloc_default_reader(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1 && !mach_task_is_self(a1)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  *a4 = a2;
  return 0LL;
}

uint64_t sanitizer_diagnose_fault_from_crash_reporter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v10 = (uint64_t *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, a4, 16680LL);
  mach_vm_size_t v18 = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, v10[31], 0x1000000LL);
  unsigned int v11 = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, v10[30], 37748744LL);
  xmmword_18C5280D8 = 0uLL;
  enumeration_context = a1;
  g_crm_reader = a5;
  num_read_memory = 0;
  szone_ptr_in_use_enumerator( a3,  0LL,  1LL,  v10[25],  (uint64_t (*)(task_name_t, uint64_t, uint64_t, uint64_t *))memory_reader_adapter);
  if (num_read_memory)
  {
    unint64_t v12 = 0LL;
    do
      _free((void *)read_memory[v12++]);
    while (v12 < num_read_memory);
  }

  g_crm_reader = 0LL;
  _platform_memset();
  *(void *)a2 = a1;
  if ((void)xmmword_18C5280D8)
  {
    uint64_t v13 = *((void *)&xmmword_18C5280D8 + 1);
    *(void *)(a2 + 8) = xmmword_18C5280D8;
    *(void *)(a2 + 16) = v13;
    uint64_t v14 = (_DWORD *)((uint64_t (*)(uint64_t))a5)(a3);
    int v15 = v14[2];
    int v16 = v14[3];
    *(void *)(a2 + 24) = 0LL;
    *(_DWORD *)(a2 + 40) = stacktrace_depo_find((uint64_t)v11, v15, a2 + 48);
    *(void *)(a2 + 560) = 0LL;
    *(_DWORD *)(a2 + 576) = stacktrace_depo_find((uint64_t)v11, v16, a2 + 584);
    _free(v14);
  }

  _free(v11);
  _free(v18);
  _free(v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&crash_reporter_lock);
  return 0LL;
}

uint64_t memory_reader_adapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = g_crm_reader();
  *a4 = v5;
  uint64_t v6 = num_read_memory++;
  read_memory[v6] = v5;
  if (v5) {
    return 0LL;
  }
  else {
    return 5LL;
  }
}

__n128 pointer_recorder(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v5 = a5;
    while (a4->n128_u64[0] > enumeration_context || enumeration_context >= a4->n128_u64[1] + a4->n128_u64[0])
    {
      ++a4;
      if (!--v5) {
        return result;
      }
    }

    __n128 result = *a4;
    xmmword_18C5280D8 = (__int128)*a4;
  }

  return result;
}

uint64_t stacktrace_depo_find(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a1 + 8LL * (a2 & 0x7FFFF));
  if ((_DWORD)v3 != a2 || (v3 & 0xFFFFFF00000000LL) > 0x40000000000000LL) {
    return 0LL;
  }
  unsigned int v6 = -474048815;
  unint64_t v7 = HIBYTE(v3);
  if (HIBYTE(v3))
  {
    unint64_t v8 = 0LL;
    unint64_t v9 = HIDWORD(v3);
    else {
      uint64_t v10 = v7;
    }
    do
    {
      if (v8 >= 0x40)
      {
        uint64_t v11 = *(void *)(a3 + 8 * v8);
      }

      else
      {
        uint64_t v11 = *(void *)(a1 + 8LL * (((_DWORD)v9 + (_DWORD)v8) & 0x3FFFFF) + 0x400000);
        *(void *)(a3 + 8 * v8) = v11;
      }

      unsigned int v6 = (1540483477
          * ((1540483477 * ((1540483477 * v11) ^ ((1540483477 * v11) >> 24))) ^ (1540483477 * v6))) ^ (1540483477 * ((1540483477 * HIDWORD(v11)) ^ ((1540483477 * HIDWORD(v11)) >> 24)));
      ++v8;
    }

    while (v10 != v8);
  }

  if (((1540483477 * (v6 ^ (v6 >> 13))) ^ ((1540483477 * (v6 ^ (v6 >> 13))) >> 15)) == a2) {
    return v7;
  }
  else {
    return 0LL;
  }
}

unsigned __int8 *sanitizer_should_enable()
{
  else {
    return env_BOOL();
  }
}

unsigned __int8 *env_BOOL()
{
  __n128 result = (unsigned __int8 *)_simple_getenv();
  if (result) {
    return (unsigned __int8 *)(*result == 49);
  }
  return result;
}

uint64_t sanitizer_reset_environment()
{
  return unsetenv("MallocQuarantineZone");
}

mach_vm_address_t sanitizer_create_zone(uint64_t a1)
{
  uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
  vm_map_t v3 = *MEMORY[0x1895FFD48];
  uint64_t v4 = (void *)MEMORY[0x189600148];
  mach_vm_address_t address = 0LL;
  uint64_t v5 = mach_vm_map( v3,  &address,  (*MEMORY[0x189600148] + 16679LL) & -*MEMORY[0x189600148],  0LL,  16777217,  0,  0LL,  0,  3,  3,  1u);
  if ((_DWORD)v5) {
    purgeable_ptr_in_use_enumerator_cold_1(v5, v6, v7);
  }
  mach_vm_address_t v8 = address;
  *(_OWORD *)(address + 32) = xmmword_189654288;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)&off_189654298;
  *(_OWORD *)(v8 + 96) = xmmword_1896542C8;
  *(_OWORD *)(v8 + 112) = *(_OWORD *)&off_1896542D8;
  *(_OWORD *)(v8 + 64) = xmmword_1896542A8;
  *(_OWORD *)(v8 + 80) = *(_OWORD *)&off_1896542B8;
  *(void *)(v8 + 192) = 0LL;
  *(_OWORD *)(v8 + 160) = xmmword_189654308;
  *(_OWORD *)(v8 + 176) = unk_189654318;
  *(_OWORD *)(v8 + 128) = xmmword_1896542E8;
  *(_OWORD *)(v8 + 144) = unk_1896542F8;
  *(_OWORD *)mach_vm_address_t v8 = malloc_zone_template;
  *(_OWORD *)(v8 + 16) = *(_OWORD *)&off_189654278;
  *(void *)(v8 + 200) = a1;
  if (*(_DWORD *)(a1 + 104) <= 0xCu) {
    malloc_report(0x40u, (uint64_t)"Unsupported wrapped zone version: %u\n");
  }
  *(_BYTE *)(v8 + 208) = env_BOOL();
  *(_BYTE *)(v8 + 209) = env_BOOL() ^ 1;
  unint64_t v9 = env_uint((uint64_t)"MallocSanitizerRedzoneSize", 16LL);
  *(void *)(v8 + 216) = v9;
  if ((v9 & 7) != 0) {
    purgeable_ptr_in_use_enumerator_cold_1(v9, v10, v11);
  }
  *(void *)(v8 + 224) = env_uint((uint64_t)"MallocQuarantineMaxItems", 0LL);
  *(void *)(v8 + 232) = (unint64_t)env_uint((uint64_t)"MallocQuarantineMaxSizeInMB", 256LL) << 20;
  unint64_t v12 = (unsigned __int8 *)MEMORY[0x189600140];
  *(void *)(v8 + 240) = mvm_allocate_pages(0x2400008uLL, *MEMORY[0x189600140], 0, 10);
  *(void *)(v8 + 248) = mvm_allocate_pages(0x1000000uLL, *v12, 0, 10);
  *(_DWORD *)(v8 + 16640) = 0;
  uint64_t v13 = mach_vm_protect(*v2, v8, (*v4 + 0x3FFFLL) & -*v4, 0, 1);
  if ((_DWORD)v13) {
    purgeable_ptr_in_use_enumerator_cold_1(v13, v14, v15);
  }
  return v8;
}

unint64_t env_uint(uint64_t a1, uint64_t a2)
{
  vm_map_t v3 = (const char *)_simple_getenv();
  if (v3) {
    return strtoul(v3, 0LL, 0);
  }
  return a2;
}

unint64_t sanitizer_size(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16LL))();
  unint64_t v5 = v4;
  if (v4)
  {
    if (*(_BYTE *)(a1 + 209))
    {
      unint64_t v6 = *(void *)(a2 + v4 - (v4 & 7) - 8);
      if (*(void *)(a1 + 216) > v6 || v4 <= v6) {
        purgeable_ptr_in_use_enumerator_cold_1();
      }
      if (*(_BYTE *)(a1 + 208)) {
        malloc_report(6u, (uint64_t)"size(%p) = 0x%lx - redzone 0x%lx\n");
      }
      v5 -= v6;
    }

    else if (*(_BYTE *)(a1 + 208))
    {
      malloc_report(6u, (uint64_t)"size(%p) = 0x%lx\n");
    }
  }

  return v5;
}

uint64_t sanitizer_malloc(uint64_t a1, unint64_t a2)
{
  v18[16] = *MEMORY[0x1895FEE08];
  if (a2 <= 1) {
    unint64_t v3 = 1LL;
  }
  else {
    unint64_t v3 = a2;
  }
  uint64_t v4 = *(void *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    v4 += -(int)v3 & 7LL;
    unint64_t v5 = v4 + v3;
    if (__CFADD__(v4, v3))
    {
      uint64_t v6 = 0LL;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v6;
    }
  }

  else
  {
    unint64_t v5 = v3;
  }

  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  if (v6) {
    BOOL v7 = *MEMORY[0x189600148] > v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 240);
    uint64_t v9 = *(void *)(a1 + 248);
    thread_stack_pcs();
    if (v17 < 2) {
      unint64_t v10 = 0LL;
    }
    else {
      unint64_t v10 = stacktrace_depo_insert(v8, v18, v17 - 1LL);
    }
    unsigned int v11 = (1540483477 * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
    unint64_t v12 = (unsigned __int128 *)(v9
                              + 16LL
                              * ((1540483477 * (v11 ^ (v11 >> 13))) & 0xFFFFF ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)));
    do
      __ldxp(v12);
    while (__stxp(__PAIR128__(v10, v6), v12));
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"malloc(0x%lx) = %p\n");
  }
  if (v6 && *(_BYTE *)(a1 + 209))
  {
    unint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16LL))(*(void *)(a1 + 200), v6);
    if (v13 < v5) {
      purgeable_ptr_in_use_enumerator_cold_1(v13, v14, v15);
    }
    poison_alloc(a1, v6, v3, v4 - v5 + v13);
  }

  return v6;
}

uint64_t sanitizer_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  v20[16] = *MEMORY[0x1895FEE08];
  unint64_t v5 = 1LL;
  if (a2 && a3 && (unint64_t v5 = a3, a2 != 1) && (!is_mul_ok(a2, a3) || (unint64_t v5 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    || (v6 = *(void *)(a1 + 216), *(_BYTE *)(a1 + 209)) && (v6 = v6 - (v5 & 7) + 8, unint64_t v3 = v6 + v5, __CFADD__(v6, v5)))
  {
    uint64_t v8 = 0LL;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }

  else
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
    if (*(_BYTE *)(a1 + 208)) {
      malloc_report(6u, (uint64_t)"calloc(0x%lx, 0x%lx) = %p\n");
    }
    if (v8) {
      BOOL v9 = *MEMORY[0x189600148] > v5;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 240);
      uint64_t v11 = *(void *)(a1 + 248);
      thread_stack_pcs();
      if (v19 < 2) {
        unint64_t v12 = 0LL;
      }
      else {
        unint64_t v12 = stacktrace_depo_insert(v10, v20, v19 - 1LL);
      }
      unsigned int v13 = (1540483477 * ((1540483477 * ((1540483477 * v8) ^ ((1540483477 * v8) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v8)) ^ ((1540483477 * HIDWORD(v8)) >> 24)));
      uint64_t v14 = (unsigned __int128 *)(v11
                                + 16LL
                                * ((1540483477 * (v13 ^ (v13 >> 13))) & 0xFFFFF ^ ((1540483477 * (v13 ^ (v13 >> 13))) >> 15)));
      do
        __ldxp(v14);
      while (__stxp(__PAIR128__(v12, v8), v14));
    }

    else if (!v8)
    {
      return v8;
    }

    if (*(_BYTE *)(a1 + 209))
    {
      unint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 200) + 16LL))( *(void *)(a1 + 200),  v8,  v7);
      if (v15 < v3) {
        purgeable_ptr_in_use_enumerator_cold_1(v15, v16, v17);
      }
      poison_alloc(a1, v8, v5, v6 - v3 + v15);
    }
  }

  return v8;
}

uint64_t sanitizer_valloc(uint64_t a1, unint64_t a2)
{
  v18[16] = *MEMORY[0x1895FEE08];
  if (a2 <= 1) {
    unint64_t v3 = 1LL;
  }
  else {
    unint64_t v3 = a2;
  }
  uint64_t v4 = *(void *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    uint64_t v4 = v4 - (v3 & 7) + 8;
    unint64_t v5 = v4 + v3;
    if (__CFADD__(v4, v3)) {
      return 0LL;
    }
  }

  else
  {
    unint64_t v5 = v3;
  }

  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40LL))();
  if (v6) {
    BOOL v7 = *MEMORY[0x189600148] > v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 240);
    uint64_t v9 = *(void *)(a1 + 248);
    thread_stack_pcs();
    if (v17 < 2) {
      unint64_t v10 = 0LL;
    }
    else {
      unint64_t v10 = stacktrace_depo_insert(v8, v18, v17 - 1LL);
    }
    unsigned int v11 = (1540483477 * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
    unint64_t v12 = (unsigned __int128 *)(v9
                              + 16LL
                              * ((1540483477 * (v11 ^ (v11 >> 13))) & 0xFFFFF ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)));
    do
      __ldxp(v12);
    while (__stxp(__PAIR128__(v10, v6), v12));
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"valloc(0x%lx) = %p\n");
  }
  if (v6 && *(_BYTE *)(a1 + 209))
  {
    unint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16LL))(*(void *)(a1 + 200), v6);
    if (v13 < v5) {
      purgeable_ptr_in_use_enumerator_cold_1(v13, v14, v15);
    }
    poison_alloc(a1, v6, v3, v4 - v5 + v13);
  }

  return v6;
}

void sanitizer_free(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 209))
  {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16LL))();
    poison_free(a1, a2, v4);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"free(%p)\n");
  }
  place_into_quarantine(a1, a2, v4);
}

uint64_t sanitizer_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  v30[16] = *MEMORY[0x1895FEE08];
  if (a3 <= 1) {
    unint64_t v5 = 1LL;
  }
  else {
    unint64_t v5 = a3;
  }
  uint64_t v6 = *(void *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    uint64_t v6 = v6 - (v5 & 7) + 8;
    unint64_t v7 = v6 + v5;
    if (__CFADD__(v6, v5)) {
      return 0LL;
    }
  }

  else
  {
    unint64_t v7 = v5;
  }

  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  if (v8) {
    BOOL v12 = *MEMORY[0x189600148] > v5;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 240);
    uint64_t v14 = *(void *)(a1 + 248);
    thread_stack_pcs();
    if (v29 < 2) {
      unint64_t v15 = 0LL;
    }
    else {
      unint64_t v15 = stacktrace_depo_insert(v13, v30, v29 - 1LL);
    }
    unsigned int v16 = (1540483477 * ((1540483477 * ((1540483477 * v8) ^ ((1540483477 * v8) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v8)) ^ ((1540483477 * HIDWORD(v8)) >> 24)));
    unsigned int v17 = (unsigned __int128 *)(v14
                              + 16LL
                              * ((1540483477 * (v16 ^ (v16 >> 13))) & 0xFFFFF ^ ((1540483477 * (v16 ^ (v16 >> 13))) >> 15)));
    do
      __ldxp(v17);
    while (__stxp(__PAIR128__(v15, v8), v17));
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx) = %p\n");
  }
  if (!a2)
  {
    if (!v8) {
      return v8;
    }
    goto LABEL_40;
  }

  unint64_t v18 = (*(uint64_t (**)(void, char *, uint64_t))(*(void *)(a1 + 200) + 16LL))( *(void *)(a1 + 200),  a2,  v9);
  unint64_t v21 = v18;
  if (*(_BYTE *)(a1 + 209))
  {
    unint64_t v22 = *(void *)&a2[v18 - (v18 & 7) - 8];
    if (*(void *)(a1 + 216) > v22 || v18 <= v22) {
      purgeable_ptr_in_use_enumerator_cold_1(v18, v19, v20);
    }
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx): size(%p) = 0x%lx - redzone 0x%lx)\n");
  }
  if (v8)
  {
    if (v21 - v22 >= v5) {
      size_t v24 = v5;
    }
    else {
      size_t v24 = v21 - v22;
    }
    memcpy((void *)v8, a2, v24);
    if (*(_BYTE *)(a1 + 209)) {
      poison_free(a1, (uint64_t)a2, v21);
    }
    place_into_quarantine(a1, (uint64_t)a2, v21);
LABEL_40:
    if (*(_BYTE *)(a1 + 209))
    {
      unint64_t v25 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 200) + 16LL))( *(void *)(a1 + 200),  v8,  v9,  v10,  v11);
      if (v25 < v7) {
        purgeable_ptr_in_use_enumerator_cold_1(v25, v26, v27);
      }
      poison_alloc(a1, v8, v5, v6 - v7 + v25);
    }
  }

  return v8;
}

uint64_t sanitizer_destroy(mach_vm_address_t a1)
{
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1895FFD48], a1, (*MEMORY[0x189600148] + 16679LL) & -*MEMORY[0x189600148]);
  if ((_DWORD)result) {
    purgeable_ptr_in_use_enumerator_cold_1(result, v3, v4);
  }
  return result;
}

uint64_t sanitizer_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v19[16] = *MEMORY[0x1895FEE08];
  if (a3 <= 1) {
    unint64_t v4 = 1LL;
  }
  else {
    unint64_t v4 = a3;
  }
  uint64_t v5 = *(void *)(a1 + 216);
  unint64_t v6 = v4;
  if (*(_BYTE *)(a1 + 209))
  {
    unint64_t v6 = v5 + v4;
    if (__CFADD__(v5, v4)) {
      return 0LL;
    }
  }

  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  if (v7) {
    BOOL v8 = *MEMORY[0x189600148] > v4;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 240);
    uint64_t v10 = *(void *)(a1 + 248);
    thread_stack_pcs();
    if (v18 < 2) {
      unint64_t v11 = 0LL;
    }
    else {
      unint64_t v11 = stacktrace_depo_insert(v9, v19, v18 - 1LL);
    }
    unsigned int v12 = (1540483477 * ((1540483477 * ((1540483477 * v7) ^ ((1540483477 * v7) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v7)) ^ ((1540483477 * HIDWORD(v7)) >> 24)));
    uint64_t v13 = (unsigned __int128 *)(v10
                              + 16LL
                              * ((1540483477 * (v12 ^ (v12 >> 13))) & 0xFFFFF ^ ((1540483477 * (v12 ^ (v12 >> 13))) >> 15)));
    do
      __ldxp(v13);
    while (__stxp(__PAIR128__(v11, v7), v13));
  }

  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"memalign(0x%lx, 0x%lx)\n");
  }
  if (v7 && *(_BYTE *)(a1 + 209))
  {
    unint64_t v14 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16LL))(*(void *)(a1 + 200), v7);
    if (v14 < v6) {
      purgeable_ptr_in_use_enumerator_cold_1(v14, v15, v16);
    }
    poison_alloc(a1, v7, v4, v5 - v6 + v14);
  }

  return v7;
}

void sanitizer_free_definite_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"free_definite_size(%p, 0x%lx)\n");
  }
  if (*(_BYTE *)(a1 + 209))
  {
    a3 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16LL))(*(void *)(a1 + 200), a2);
    poison_free(a1, a2, a3);
  }

  place_into_quarantine(a1, a2, a3);
}

BOOL sanitizer_claimed_address(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 200) + 136LL))() != 0;
}

void poison_alloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"poison_alloc(%p, 0x%lx, 0x%lx)\n");
  }
  if (!*(_BYTE *)(a1 + 209)) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  *(void *)(((a4 + a3) & 0xFFFFFFFFFFFFFFF8LL) + a2 - 8) = a4;
  functions = (void (**)(uint64_t, void, uint64_t, uint64_t))malloc_sanitizer_get_functions();
  if (functions && *functions)
  {
    (*functions)(a2, 0LL, a3, a4);
  }

  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report( 4u,  (uint64_t)"MallocSanitizerZone: Not poisoning allocation %p of size %lu with redzone size %lu due to missing pointers!\n");
  }

uint64_t stacktrace_depo_insert(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 >= 0x100) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  unsigned int v3 = -474048815;
  if (a3)
  {
    unint64_t v4 = a2;
    unint64_t v5 = a3;
    do
    {
      uint64_t v6 = *v4++;
      unsigned int v3 = (1540483477
          * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ (1540483477 * v3))) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
      --v5;
    }

    while (v5);
  }

  uint64_t v7 = (1540483477 * (v3 ^ (v3 >> 13))) ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  uint64_t v8 = v7 & 0x7FFFF;
  unint64_t v9 = *(void *)(a1 + 8LL * v8);
  if (a3 != HIBYTE(v9) || (_DWORD)v7 != (_DWORD)v9)
  {
    unint64_t v11 = (unint64_t *)(a1 + 37748736);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + a3, v11));
    for (*(void *)(a1 + 8 * v8) = v7 | ((unint64_t)(v12 & 0x3FFFFF | ((_DWORD)a3 << 24)) << 32);
          a3;
          --a3)
    {
      uint64_t v13 = *a2++;
      *(void *)(a1 + 8 * (v12++ & 0x3FFFFF) + 0x400000) = v13;
    }
  }

  return v7;
}

void poison_free(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"poison_free(%p, 0x%lx)\n");
  }
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint64_t functions = malloc_sanitizer_get_functions();
  if (functions && (uint64_t v7 = *(void (**)(uint64_t, uint64_t))(functions + 8)) != 0LL)
  {
    v7(a2, a3);
  }

  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report( 4u,  (uint64_t)"MallocSanitizerZone: Not poisoning deallocation %p of size %lu due to missing pointers!\n");
  }

void place_into_quarantine(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v32[16] = *MEMORY[0x1895FEE08];
  if (a2)
  {
    unint64_t v3 = a3;
    if (!a3) {
      unint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16LL))();
    }
    if (v3 <= *MEMORY[0x189600148])
    {
      uint64_t v6 = *(void *)(a1 + 240);
      thread_stack_pcs();
      if (v31 < 3) {
        uint64_t v7 = 0LL;
      }
      else {
        uint64_t v7 = stacktrace_depo_insert(v6, v32, v31 - 2LL) << 32;
      }
      unsigned int v8 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
      unint64_t v9 = (unsigned __int128 *)(*(void *)(a1 + 248)
                               + 16LL
                               * ((1540483477 * (v8 ^ (v8 >> 13))) & 0xFFFFF ^ ((1540483477 * (v8 ^ (v8 >> 13))) >> 15)));
      do
        unsigned __int128 v10 = __ldxp(v9);
      while (__stxp(v10, v9));
      uint64_t v11 = DWORD2(v10);
      if ((void)v10 != a2) {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = v11 | v7;
      os_unfair_lock_lock_with_options();
      if (*(void *)(a1 + 16664)) {
        **(void **)(a1 + 16656) = **(void **)(a1 + 16656) & 0xFFFF000000000000LL | a2 & 0xFFFFFFFFFFFFLL;
      }
      else {
        *(void *)(a1 + 16648) = a2;
      }
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      *(void *)(a1 + 16656) = a2;
      *(void *)a2 = v3 << 48;
      *(void *)(*(void *)(a1 + 16656) + 8LL) = v12;
      unint64_t v15 = *(void *)(a1 + 16664) + 1LL;
      unint64_t v16 = *(void *)(a1 + 16672) + v3;
      unint64_t v17 = *(void *)(a1 + 224);
      unint64_t v18 = *(void *)(a1 + 232);
      uint64_t v19 = v15 - v17;
      if (v15 < v17) {
        uint64_t v19 = 0LL;
      }
      if (v17) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0LL;
      }
      uint64_t v21 = v16 - v18;
      if (v16 < v18) {
        uint64_t v21 = 0LL;
      }
      if (v18) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0LL;
      }
      uint64_t v23 = *(uint64_t **)(a1 + 16648);
      BOOL v24 = v20 <= 0 && v22 < 1;
      unint64_t v25 = *(unint64_t **)(a1 + 16648);
      if (!v24)
      {
        uint64_t v26 = 0LL;
        uint64_t v13 = 0LL;
        unint64_t v25 = *(unint64_t **)(a1 + 16648);
        do
        {
          do
          {
            uint64_t v27 = v20 + v26;
            unint64_t v28 = *v25;
            v13 += HIWORD(v28);
            v22 -= HIWORD(v28);
            unint64_t v25 = (unint64_t *)(v28 & 0xFFFFFFFFFFFFLL);
            --v26;
          }

          while (v27 > 1);
        }

        while (v22 >= 1);
        uint64_t v14 = -v26;
      }

      *(void *)(a1 + 16648) = v25;
      *(void *)(a1 + 16664) = v15 - v14;
      *(void *)(a1 + 16672) = v16 - v13;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16640));
      for (; v14; --v14)
      {
        uint64_t v29 = *v23;
        uint64_t v30 = HIWORD(*v23);
        if (*(_BYTE *)(a1 + 208)) {
          malloc_report(6u, (uint64_t)"evicting %p from quarantine, size = 0x%lx\n");
        }
        if (*(_BYTE *)(a1 + 209)) {
          unpoison(a1, (uint64_t)v23, v30);
        }
        (*(void (**)(void, uint64_t *))(*(void *)(a1 + 200) + 120LL))(*(void *)(a1 + 200), v23);
        uint64_t v23 = (uint64_t *)(v29 & 0xFFFFFFFFFFFFLL);
      }
    }

    else
    {
      if (*(_BYTE *)(a1 + 209)) {
        unpoison(a1, a2, v3);
      }
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 200) + 48LL))(*(void *)(a1 + 200), a2);
    }
  }

void unpoison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"unpoison(%p, 0x%lx)\n");
  }
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint64_t functions = (void (**)(uint64_t, void, uint64_t, void))malloc_sanitizer_get_functions();
  if (functions && *functions)
  {
    (*functions)(a2, 0LL, a3, 0LL);
  }

  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not unpoisoning %p of size %lu due to missing pointers!\n");
  }

uint64_t sanitizer_enumerator()
{
  return 46LL;
}

uint64_t sanitizer_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 200) + 96LL) + 8LL))();
}

uint64_t sanitizer_check()
{
  return 1LL;
}

uint64_t sanitizer_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void sanitizer_force_unlock(os_unfair_lock_s *a1)
{
}

BOOL sanitizer_zone_locked(os_unfair_lock_s *a1)
{
  size_t v1 = a1 + 4160;
  BOOL v2 = os_unfair_lock_trylock(a1 + 4160);
  if (v2) {
    os_unfair_lock_unlock(v1);
  }
  return !v2;
}

uint64_t sanitizer_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16640) = 0;
  return result;
}

uint64_t sanitizer_statistics_task()
{
  return 46LL;
}

uint64_t large_debug_print( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  if (a4(a1, a3, 18944LL, &v15))
  {
    unsigned int v8 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v8);
  }

  uint64_t result = _simple_salloc();
  if (result)
  {
    if (a4(a1, *(void *)(v15 + 18832), 24LL * *(unsigned int *)(v15 + 18824), &v14))
    {
      unsigned int v8 = "Failed to read large entries\n";
      return ((uint64_t (*)(const char *))a5)(v8);
    }

    _simple_sprintf();
    uint64_t v10 = v15;
    if (*(_DWORD *)(v15 + 18824))
    {
      unsigned int v11 = 0;
      uint64_t v12 = v14 + 8;
      do
      {
        if (*(void *)(v12 - 8))
        {
          _simple_sprintf();
          _simple_sprintf();
          uint64_t v10 = v15;
        }

        ++v11;
        v12 += 24LL;
      }

      while (v11 < *(_DWORD *)(v10 + 18824));
    }

    _simple_sprintf();
    uint64_t v13 = (const char *)_simple_string();
    a5("%s\n", v13);
    return _simple_sfree();
  }

  return result;
}

void *large_entry_for_pointer_no_lock(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 18824);
  if (!(_DWORD)v2) {
    return 0LL;
  }
  uint64_t v3 = *(void *)(a1 + 18832);
  unsigned int v4 = (a2 >> *MEMORY[0x189600140]) % v2;
  while (1)
  {
    uint64_t result = (void *)(v3 + 24LL * v4);
    if (*result == a2) {
      break;
    }
    if (*result)
    {
      if (v4 + 1 == (_DWORD)v2) {
        unsigned int v4 = 0;
      }
      else {
        ++v4;
      }
    }

    return 0LL;
  }

  return result;
}

void large_entries_free_no_lock(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  *a4 = a2;
  uint64_t v4 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v4 = *MEMORY[0x189600138];
  }
  a4[1] = (v4 + 24LL * a3) & ~v4;
}

uint64_t large_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  unint64_t v2 = v1;
  unsigned int v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v25 = *MEMORY[0x1895FEE08];
  uint64_t v12 = 24LL * v3;
  uint64_t result = v13(v0, v5, v12, &v23);
  if (!(_DWORD)result)
  {
    if ((v8 & 4) != 0)
    {
      uint64_t v15 = *MEMORY[0x189600118];
      if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
        uint64_t v15 = *MEMORY[0x189600138];
      }
      *(void *)&__int128 v22 = v6;
      *((void *)&v22 + 1) = (v15 + v12) & ~v15;
      v2(v11, v10, 4LL, &v22, 1LL);
    }

    uint64_t result = 0LL;
    if ((v8 & 3) != 0 && v4)
    {
      int v16 = 0;
      unsigned int v17 = v4 - 1;
      do
      {
        uint64_t v18 = v17;
        uint64_t v19 = (uint64_t *)(v23 + 24LL * v17);
        uint64_t v20 = *v19;
        if (*v19)
        {
          uint64_t v21 = v19[1];
          *(void *)&__int128 v22 = v20;
          *((void *)&v22 + 1) = v21;
          v24[v16] = v22;
          if ((v16 + 1) >= 0x100)
          {
            v2(v11, v10, 3LL, v24, (v16 + 1));
            int v16 = 0;
          }

          else
          {
            ++v16;
          }
        }

        --v17;
      }

      while (v18);
      if (v16) {
        ((void (*)(uint64_t, uint64_t, uint64_t, _OWORD *))v2)(v11, v10, 3LL, v24);
      }
      return 0LL;
    }
  }

  return result;
}

mach_vm_address_t large_malloc(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6 = (_DWORD *)(a1 + 16392);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (a2 <= 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = a2;
  }
  int v8 = *MEMORY[0x189600120];
  uint64_t v9 = (_DWORD *)MEMORY[0x189600140];
  if (*MEMORY[0x189600120] <= *MEMORY[0x189600140]) {
    LOBYTE(v8) = *MEMORY[0x189600140];
  }
  uint64_t v10 = v7 << v8;
  mach_vm_address_t pages = mvm_allocate_pages(v7 << v8, a3, (2 * *v6) & 0x40000000u | *v6, 3);
  if (!pages) {
    return pages;
  }
  os_unfair_lock_lock_with_options();
  unsigned int v12 = v6[608];
  if (4 * v6[607] + 4 <= v12)
  {
    uint64_t v14 = 0LL;
LABEL_13:
    uint64_t v15 = 0LL;
    goto LABEL_36;
  }

  if (v12)
  {
    unsigned int v13 = (2 * v12) | 1;
  }

  else
  {
    unint64_t v16 = *MEMORY[0x189600128];
    if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
      unint64_t v16 = *MEMORY[0x189600148];
    }
    unsigned int v13 = v16 / 0x18 - 1;
  }

  uint64_t v14 = *(void *)(a1 + 18832);
  uint64_t v17 = *MEMORY[0x189600118];
  uint64_t v18 = (uint64_t *)MEMORY[0x189600138];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v17 = *MEMORY[0x189600138];
  }
  mach_vm_address_t v19 = mvm_allocate_pages((v17 + 24LL * v13) & ~v17, 0, (2 * *v6) & 0x40000000 | *v6 & 0x60000000u, 3);
  if (!v19)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 18816));
    return 0LL;
  }

  v6[608] = v13;
  *(void *)(a1 + 18832) = v19;
  if (v12)
  {
    unsigned int v20 = v12;
    do
    {
      while (1)
      {
        uint64_t v21 = (uint64_t *)(v14 + 24LL * --v20);
        unint64_t v22 = *v21;
        if (*v21) {
          break;
        }
LABEL_29:
        if (!v20) {
          goto LABEL_32;
        }
      }

      __int128 v31 = *(_OWORD *)(v21 + 1);
      unint64_t v23 = v6[608];
      unsigned int v24 = (v22 >> *v9) % v23;
      while (1)
      {
        uint64_t v25 = *(void *)(a1 + 18832) + 24LL * v24;
        if (!*(void *)v25) {
          break;
        }
        if (v24 + 1 == (_DWORD)v23) {
          unsigned int v24 = 0;
        }
        else {
          ++v24;
        }
      }

      *(void *)uint64_t v25 = v22;
      *(_OWORD *)(v25 + 8) = v31;
    }

    while (v20);
  }

LABEL_32:
  if (!v14) {
    goto LABEL_13;
  }
  uint64_t v26 = *MEMORY[0x189600118];
  uint64_t v15 = (v26 + 24LL * v12) & ~v26;
LABEL_36:
  unint64_t v27 = v6[608];
  unsigned int v28 = (pages >> *v9) % v27;
  while (1)
  {
    uint64_t v29 = *(void *)(a1 + 18832) + 24LL * v28;
    if (!*(void *)v29) {
      break;
    }
    if (v28 + 1 == (_DWORD)v27) {
      unsigned int v28 = 0;
    }
    else {
      ++v28;
    }
  }

  *(void *)uint64_t v29 = pages;
  *(void *)(v29 + 8) = v10;
  *(_DWORD *)(v29 + 16) = 0;
LABEL_44:
  ++v6[607];
  *(void *)(a1 + 18840) += v10;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 18816));
  if (v15) {
    mvm_deallocate_pages(v14, v15, 0LL);
  }
  return pages;
}

    uint64_t v18 = 0LL;
    *(void *)uint64_t v10 = v27;
    *(void *)(v10 + 8) = v26;
    *(void *)(v10 + 16) = v11;
    unsigned int v28 = (unint64_t)*v25 >> 2;
    uint64_t v29 = v38;
    uint64_t v30 = v24 + 8LL * v21;
    *(void *)(v10 + 24) = v35
    *(void *)(v10 + 32) = *(unsigned __int16 *)(v30 + 4);
    *(void *)(v10 + 40) = slot_state_labels[*v25 & 3];
    *(_DWORD *)(v10 + 48) = 0;
    if (*(_DWORD *)(v29 + (v28 << 8)) == (_DWORD)v21)
    {
      *(_DWORD *)(v10 + 48) = 1;
      __int128 v31 = v29 + (v28 << 8);
      int v32 = *(unsigned __int16 *)(v31 + 20);
      *(_OWORD *)(v10 + 56) = *(_OWORD *)(v31 + 4);
      *(_DWORD *)(v10 + 72) = trace_decode(v31 + 40, v32, v10 + 80, 64LL);
      if ((*v25 & 3) == 2)
      {
        ++*(_DWORD *)(v10 + 48);
        uint8x8_t v33 = v31 + *(unsigned __int16 *)(v31 + 20) + 40;
        *(_OWORD *)(v10 + 592) = *(_OWORD *)(v31 + 22);
        uint64_t v18 = 0LL;
        *(_DWORD *)(v10 + 608) = trace_decode(v33, *(unsigned __int16 *)(v31 + 38), v10 + 616, 64LL);
      }

      else
      {
        uint64_t v18 = 0LL;
      }
    }
  }

  else
  {
    if ((HIDWORD(v21) & 0x7FFFFFFF) == 3)
    {
      uint64_t v26 = "high";
      unint64_t v27 = "out-of-bounds";
      goto LABEL_32;
    }

    malloc_report( 0x223u,  (uint64_t)"Failed to generate PGM report for fault address %p: slot is unexpectedly allocated with bounds %d\n");
    uint64_t v18 = 5LL;
  }

  free_read_memory();
LABEL_20:
  os_unfair_lock_unlock(&crash_reporter_lock_0);
  return v18;
}

  if (!v13) {
    goto LABEL_94;
  }
LABEL_33:
  if (v13 >= 0x401 && (*(void *)(a1 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  if (v14) {
    unint64_t v23 = v14;
  }
  else {
    unint64_t v23 = a1;
  }
  _xzm_free(v23, a2, 0);
}

  if (!v19) {
    xzm_malloc_zone_malloc_type_realloc_slow_cold_1();
  }
  if ((v8 & 0x20) != 0 && v19 > a3) {
    _platform_memset();
  }
  if ((v8 & 0x80) == 0 || a3 > 0x8000 && !v20 || a3 <= 0x8000 && v20)
  {
    if (v10) {
      goto LABEL_53;
    }
    uint64_t v30 = *(void *)(v7 + 232);
    if (!v30) {
      uint64_t v30 = v7;
    }
    __int128 v31 = *(void *)(v30 + 408);
    if (!v31) {
      goto LABEL_53;
    }
    int v32 = *(unsigned int *)(v31 + 4 * v9);
    if (!(_DWORD)v32) {
      goto LABEL_53;
    }
    uint8x8_t v33 = v32 << 14;
    unsigned __int32 v34 = a2 - *(void *)(v33 + 48);
    unsigned __int32 v35 = v34 >> 14;
    BOOL v36 = v33 + 48LL * v35 + 2104;
    if ((*(_BYTE *)(v33 + 48LL * v35 + 2136) & 0xF) == 4)
    {
      unsigned int v68 = v36 - *(unsigned int *)(v33 + 48LL * v35 + 2140);
      uint64_t v69 = *(_BYTE *)(v68 + 32) & 0xF;
      if (v69 <= 8)
      {
        uint64_t v70 = 1 << v69;
        if ((v70 & 0x1E8) != 0)
        {
          goto LABEL_182;
        }

        if ((v70 & 6) != 0 && v36 == v68) {
LABEL_182:
        }
          BOOL v36 = v68;
      }
    }

BOOL free_large(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = (_DWORD *)(a1 + 16392);
  uint64_t v7 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  int v8 = large_entry_for_pointer_no_lock(a1, a2);
  uint64_t v9 = v8;
  if (v8)
  {
    --v6[607];
    uint64_t v10 = v8[1];
    *(void *)(a1 + 18840) -= v10;
    if (malloc_tracing_enabled)
    {
      kdebug_trace();
      uint64_t v10 = v9[1];
    }

    uint64_t v11 = *v9;
    if ((*v6 & 3) != 0)
    {
      mvm_protect(*v9, v10, 3LL);
      uint64_t v12 = *MEMORY[0x189600128];
      if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
        uint64_t v12 = *MEMORY[0x189600148];
      }
      v11 -= v12;
      v10 += 2 * v12;
    }

    *uint64_t v9 = 0LL;
    v9[1] = 0LL;
    *((_DWORD *)v9 + 4) = 0;
    uint64_t v13 = v6[608];
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *(void *)(a1 + 18832)) >> 3);
    uint64_t v15 = (_DWORD *)MEMORY[0x189600140];
    unint64_t v16 = v14;
    do
    {
      if (v16 + 1 == v13) {
        unint64_t v16 = 0LL;
      }
      else {
        ++v16;
      }
      uint64_t v17 = *(void *)(a1 + 18832);
      uint64_t v18 = (uint64_t *)(v17 + 24 * v16);
      unint64_t v19 = *v18;
      __int128 v24 = *(_OWORD *)(v18 + 1);
      if (!*v18) {
        break;
      }
      *uint64_t v18 = 0LL;
      v18[1] = 0LL;
      *((_DWORD *)v18 + 4) = 0;
      unint64_t v20 = v6[608];
      unsigned int v21 = (v19 >> *v15) % v20;
      while (1)
      {
        uint64_t v22 = v17 + 24LL * v21;
        if (!*(void *)v22) {
          break;
        }
        if (v21 + 1 == (_DWORD)v20) {
          unsigned int v21 = 0;
        }
        else {
          ++v21;
        }
      }

      *(void *)uint64_t v22 = v19;
      *(_OWORD *)(v22 + 8) = v24;
LABEL_21:
      ;
    }

    while (v16 != v14);
    os_unfair_lock_unlock(v7);
    if (v11) {
      mvm_deallocate_pages(v11, v10, 0LL);
    }
  }

  else
  {
    if ((a3 & 1) == 0) {
      malloc_zone_error(*v6, 1, (uint64_t)"pointer %p being freed was not allocated\n");
    }
    os_unfair_lock_unlock(v7);
  }

  return v9 != 0LL;
}

unint64_t large_try_shrink_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 - a4;
  if (a3 != a4)
  {
    uint64_t v6 = a4;
    int v8 = (os_unfair_lock_s *)(a1 + 18816);
    os_unfair_lock_lock_with_options();
    uint64_t v9 = large_entry_for_pointer_no_lock(a1, a2);
    if (v9)
    {
      *uint64_t v9 = a2;
      v9[1] = v6;
      *(void *)(a1 + 18840) -= v5;
      int v10 = *(_DWORD *)(a1 + 16392) & 3;
      os_unfair_lock_unlock(v8);
      if (v10)
      {
        uint64_t v11 = (uint64_t *)MEMORY[0x189600128];
        uint64_t v12 = (uint64_t *)MEMORY[0x189600148];
        if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
          size_t v13 = *MEMORY[0x189600148];
        }
        else {
          size_t v13 = *MEMORY[0x189600128];
        }
        uint64_t v14 = *v11;
        v6 += v14;
        v5 -= v14;
      }

      mvm_deallocate_pages(v6 + a2, v5, 0LL);
    }

    else
    {
      malloc_zone_error(*(_DWORD *)(a1 + 16392), 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
      os_unfair_lock_unlock(v8);
    }
  }

  return a2;
}

uint64_t large_try_realloc_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = a2 + a3;
  vm_address_t address = a2 + a3;
  uint64_t v9 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  int v10 = large_entry_for_pointer_no_lock(a1, v8);
  os_unfair_lock_unlock(v9);
  if (v10) {
    return 0LL;
  }
  uint64_t v11 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v11 = *MEMORY[0x189600138];
  }
  uint64_t v12 = (v11 + a4) & ~v11;
  vm_size_t v13 = v12 - a3;
  if (vm_allocate(*MEMORY[0x1895FFD48], &address, v13, 100663296)) {
    return 0LL;
  }
  os_unfair_lock_lock_with_options();
  unint64_t v16 = large_entry_for_pointer_no_lock(a1, a2);
  if (v16)
  {
    *unint64_t v16 = a2;
    v16[1] = v12;
    *(void *)(a1 + 18840) += v13;
    uint64_t v14 = 1LL;
  }

  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 16392), 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
    uint64_t v14 = 0LL;
  }

  os_unfair_lock_unlock(v9);
  return v14;
}

uint64_t large_claimed_address(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  unint64_t v5 = *(unsigned int *)(a1 + 18824);
  if ((_DWORD)v5)
  {
    unint64_t v6 = -*MEMORY[0x189600148] & a2;
    uint64_t v7 = *(void *)(a1 + 18832);
    unsigned int v8 = (v6 >> *MEMORY[0x189600140]) % v5;
    while (1)
    {
      unint64_t v9 = *(void *)(v7 + 24LL * v8);
      if (v9 == v6 || v9 <= v6 && *(void *)(v7 + 24LL * v8 + 8) + v9 > v6) {
        break;
      }
      if (!v8) {
        unsigned int v8 = *(_DWORD *)(a1 + 18824);
      }
    }

    uint64_t v10 = 1LL;
  }

  else
  {
LABEL_9:
    uint64_t v10 = 0LL;
  }

  os_unfair_lock_unlock(v4);
  return v10;
}

void szone_free(uint64_t a1, unint64_t a2)
{
}

void _szone_free(uint64_t a1, unint64_t a2, int a3)
{
  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      if ((a3 & 1) == 0)
      {
        int v5 = *(_DWORD *)(a1 + 16392);
        unint64_t v6 = "Non-aligned pointer %p being freed\n";
LABEL_35:
        malloc_zone_error(v5, 1, (uint64_t)v6);
        return;
      }

      goto LABEL_39;
    }

    uint64_t v7 = *(uint64_t **)(a1 + 16536);
    uint64_t v8 = *v7;
    if (*v7)
    {
      unint64_t v9 = a2 & 0xFFFFFFFFFFF00000LL;
      uint64_t v10 = v7[2];
      unint64_t v11 = (0x9E3779B97F4A7C55LL * (a2 >> 20)) >> -*((_BYTE *)v7 + 8);
      unint64_t v12 = v11;
      do
      {
        uint64_t v13 = *(void *)(v10 + 8 * v12);
        if (!v13) {
          break;
        }
        if (v13 == v9)
        {
          if (!v9) {
            break;
          }
          if ((((_DWORD)a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
          {
            int v5 = *(_DWORD *)(a1 + 16392);
            unint64_t v6 = "Pointer %p to metadata being freed\n";
            goto LABEL_35;
          }

          free_tiny(a1 + 16512, a2, v9, 0LL, 0);
          return;
        }

        if (v12 + 1 == v8) {
          unint64_t v12 = 0LL;
        }
        else {
          ++v12;
        }
      }

      while (v12 != v11);
    }

    if ((a2 & 0x1FF) != 0)
    {
      if ((a3 & 1) == 0)
      {
        int v5 = *(_DWORD *)(a1 + 16392);
        unint64_t v6 = "Non-aligned pointer %p being freed (2)\n";
        goto LABEL_35;
      }

LABEL_39:
      find_zone_and_free((void *)a2, 1u);
      return;
    }

    uint64_t v14 = *(uint64_t **)(a1 + 17304);
    uint64_t v15 = *v14;
    if (*v14)
    {
      unint64_t v16 = a2 & 0xFFFFFFFFFF800000LL;
      uint64_t v17 = v14[2];
      unint64_t v18 = (0x9E3779B97F4A7C55LL * ((a2 & 0xFFFFFFFFFF800000LL) >> 20)) >> -*((_BYTE *)v14 + 8);
      unint64_t v19 = v18;
      do
      {
        uint64_t v20 = *(void *)(v17 + 8 * v19);
        if (!v20) {
          break;
        }
        if (v20 == v16)
        {
          if (!v16) {
            break;
          }
          if ((((_DWORD)a2 + 8355328) & 0x7FFE00u) > 0x7F7C00uLL)
          {
            int v5 = *(_DWORD *)(a1 + 16392);
            unint64_t v6 = "Pointer %p to metadata being freed (2)\n";
            goto LABEL_35;
          }

          free_small(a1 + 17280, a2, v16, 0LL);
          return;
        }

        if (v19 + 1 == v15) {
          unint64_t v19 = 0LL;
        }
        else {
          ++v19;
        }
      }

      while (v19 != v18);
    }

    if (((*MEMORY[0x189600148] - 1LL) & a2) != 0)
    {
      if ((a3 & 1) == 0)
      {
        int v5 = *(_DWORD *)(a1 + 16392);
        unint64_t v6 = "non-page-aligned, non-allocated pointer %p being freed\n";
        goto LABEL_35;
      }

      goto LABEL_39;
    }

    BOOL v21 = free_large(a1, a2, a3);
    if (a3 && !v21) {
      goto LABEL_39;
    }
  }

  malloc_report_simple((uint64_t)"Nanozonev2 %p: blocks in use: %llu, size in use: %llu allocated size: %llu, allocated re"
                                "gions: %d, region holes: %d\n");
  malloc_report_simple((uint64_t)"Current Allocation Blocks By Size Class/Context [CPU]\n");
  uint64_t v26 = 0LL;
  uint64_t v70 = a1;
  unint64_t v27 = a1 + 2048;
  do
  {
    malloc_report_simple((uint64_t)"  Class %d: ");
    for (unsigned int i = 0LL; i != 64; ++i)
    {
      if (v27[i]) {
        malloc_report_simple((uint64_t)"%d: %p; ");
      }
    }

    malloc_report_simple((uint64_t)"\n");
    ++v26;
    v27 += 64;
  }

  while (v26 != 16);
  uint64_t v29 = v70;
  uint64_t v30 = v70[3590];
  __int128 v31 = atomic_load(v70 + 3591);
  uint64_t v65 = v31;
  if (v30)
  {
    int v32 = 0;
    uint8x8_t v33 = ((unsigned __int16)(v70[3585] >> 6) | (unsigned __int16)((unsigned __int16)v70[3585] << 6)) & 0xFFF;
    uint64_t v63 = (v31 - 1) & 0xFFFFFFFFE0000000LL;
    do
    {
      uint64_t v64 = v32;
      malloc_report_simple((uint64_t)"\nRegion %d: base address %p\n");
      if (task)
      {
        unsigned __int32 v34 = mach_task_is_self(task);
        if (!(_DWORD)v34) {
          purgeable_ptr_in_use_enumerator_cold_1(v34, v35, v36);
        }
      }

      int v37 = v30 + 0x20000000;
      if (v30 == v63) {
        int v37 = v65;
      }
      unsigned int v67 = v30;
      uint64_t v69 = v37;
      if (v30 < v37)
      {
        uint64_t v38 = 0;
        uint32_t v39 = v30;
        do
        {
          unsigned int v40 = 0LL;
          int v41 = 0;
          char v42 = 0;
          uint64_t v43 = 0;
          unint64_t v44 = 0;
          unint64_t v45 = 0;
          int v46 = (_DWORD *)(v29[3586] ^ v39 & 0xFFFFFFFFFC000000LL);
          do
          {
            if (v33 != v40)
            {
              v47 = v46[v40] & 0x7FF;
              if (v47 > 0x7FD)
              {
                if (v47 == 2046) {
                  ++v41;
                }
                else {
                  ++v42;
                }
              }

              else if (v47)
              {
                if (v47 == 2045) {
                  ++v44;
                }
                else {
                  ++v45;
                }
              }

              else
              {
                ++v43;
              }
            }

            ++v40;
          }

          while (v40 != 4096);
          uint64_t v71 = v39;
          malloc_report_simple((uint64_t)"Arena #%d: base address %p. Blocks - active: %d, madvisable: %d, madvising: %d, "
                                        "madvised: %d, unused: %d\n");
          uint64_t v48 = 0;
          unint64_t v49 = 0LL;
          memset(v75, 0, sizeof(v75));
          do
          {
            if (v33 != v49 && (v46[v49] & 0x7FFu) - 2045 >= 3 && (v46[v49] & 0x7FF) != 0)
            {
              uint64_t v51 = ptr_offset_to_size_class[((v48 | (unsigned __int16)(v49 >> 6)) & 0xFC0 ^ *((_DWORD *)v29 + 7170)) >> 6];
              ++*((_DWORD *)v75 + v51);
            }

            ++v49;
            v48 += 64;
          }

          while (v49 != 4096);
          malloc_report_simple((uint64_t)"Size classes with allocated blocks: ");
          for (j = 0LL; j != 16; ++j)
          {
            if (*((_DWORD *)v75 + j)) {
              malloc_report_simple((uint64_t)"%d ");
            }
          }

          malloc_report_simple((uint64_t)"\n");
          uint64_t v53 = v71;
          if (a2)
          {
            uint64_t v54 = 0;
            for (k = 0LL; k != 4096; ++k)
            {
              if (v33 != k)
              {
                v56 = *v46 & 0x7FF;
                uint64_t v57 = (v56 - 2042) > 5 || ((1 << (*v46 + 6)) & 0x31) == 0;
                if (v57 && v56 != 0)
                {
                  uint64_t v59 = v56 != 2044 && v56 != 2045;
                  malloc_report_simple((uint64_t)"    Block %d: base %p; metadata: %p, size %d (class %d) in-use: %d ");
                  if (v59)
                  {
                    if (v56 == 2043) {
                      uint64_t v60 = "BUMP (free list empty)";
                    }
                    else {
                      uint64_t v60 = "next_slot (1-based) = %d";
                    }
                    malloc_report_simple((uint64_t)v60);
                    malloc_report_simple((uint64_t)", allocated slots: %d, free slots = %d, occupancy: %d%%\n");
                  }

                  else
                  {
                    malloc_report_simple((uint64_t)"%s\n");
                  }

                  uint64_t v53 = v71;
                }
              }

              v54 += 64;
              ++v46;
            }
          }

          uint32_t v39 = v53 + 0x4000000;
          ++v38;
          uint64_t v29 = v70;
        }

        while (v39 < v69);
      }

      if (*(_WORD *)((v29[3586] ^ v67 & 0xFFFFFFFFFC000000LL) {
                    + 4LL
      }
      else {
        uint64_t v61 = 1;
      }
      int v32 = v64 + 1;
      uint64_t v62 = v61
         || v67
          + ((unint64_t)*(unsigned __int16 *)((v29[3586] ^ v67 & 0xFFFFFFFFFC000000LL)
                                                   + 4LL
                                                   * (((unsigned __int16)(*((_DWORD *)v29 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v29 + 7170) << 6)) & 0xFFF)) << 29) >= v65;
      uint64_t v30 = v67
          + ((unint64_t)*(unsigned __int16 *)((v29[3586] ^ v67 & 0xFFFFFFFFFC000000LL)
                                                   + 4LL
                                                   * (((unsigned __int16)(*((_DWORD *)v29 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v29 + 7170) << 6)) & 0xFFF)) << 29);
    }

    while (!v62);
  }

void szone_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      int v3 = *(_DWORD *)(a1 + 16392);
      unsigned int v4 = "Non-aligned pointer %p being freed\n";
    }

    else if (a3 > 0x3F0)
    {
      if ((a2 & 0x1FF) != 0)
      {
        int v3 = *(_DWORD *)(a1 + 16392);
        unsigned int v4 = "Non-aligned pointer %p being freed (2)\n";
      }

      else if (a3 > 0x3C00)
      {
        if (((*MEMORY[0x189600148] - 1LL) & a2) == 0)
        {
          free_large(a1, a2, 0);
          return;
        }

        int v3 = *(_DWORD *)(a1 + 16392);
        unsigned int v4 = "non-page-aligned, non-allocated pointer %p being freed\n";
      }

      else
      {
        if ((((_DWORD)a2 + 8355328) & 0x7FFE00u) <= 0x7F7C00uLL)
        {
          free_small(a1 + 17280, a2, a2 & 0xFFFFFFFFFF800000LL, a3);
          return;
        }

        int v3 = *(_DWORD *)(a1 + 16392);
        unsigned int v4 = "Pointer %p to metadata being freed (2)\n";
      }
    }

    else
    {
      if ((((_DWORD)a2 + 1032064) & 0xFFF80u) <= 0xFBF70uLL)
      {
        free_tiny(a1 + 16512, a2, a2 & 0xFFFFFFFFFFF00000LL, a3, 0);
        return;
      }

      int v3 = *(_DWORD *)(a1 + 16392);
      unsigned int v4 = "Pointer %p to metadata being freed\n";
    }

    malloc_zone_error(v3, 1, (uint64_t)v4);
  }

unint64_t szone_malloc_should_clear(uint64_t a1, unint64_t a2, int a3)
{
  if (a2 <= 0x3F0)
  {
    else {
      uint64_t v6 = 1LL;
    }
    mach_vm_address_t should_clear = tiny_malloc_should_clear(a1 + 16512, v6, a3);
LABEL_14:
    unint64_t v11 = should_clear;
    if (!a2) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }

  if (a2 <= 0x3C00)
  {
    mach_vm_address_t should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a2 + 511) >> 9), a3);
    goto LABEL_14;
  }

  uint64_t v8 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v8 = *MEMORY[0x189600138];
  }
  unint64_t v9 = (v8 + a2) & ~v8;
  int v10 = *MEMORY[0x189600120];
  if (*MEMORY[0x189600120] <= *MEMORY[0x189600140]) {
    LOBYTE(v10) = *MEMORY[0x189600140];
  }
  if (v9 >> v10)
  {
    mach_vm_address_t should_clear = large_malloc(a1, v9 >> v10, 0);
    goto LABEL_14;
  }

  unint64_t v11 = 0LL;
LABEL_15:
  if (!a3 && (*(_DWORD *)(a1 + 16392) & 0x20) != 0 && v11 != 0)
  {
    szone_size(a1, v11);
    _platform_memset();
    return v11;
  }

LABEL_22:
  if (!v11) {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return v11;
}

        if ((*(_BYTE *)(v4 + 16392) & 0x20) != 0) {
          goto LABEL_35;
        }
        return (uint64_t)v5;
      }

      goto LABEL_33;
    }

    return tiny_try_shrink_in_place(v4 + 16512, (uint64_t)v5, v7, v8);
  }

  os_unfair_lock_lock_with_options();
  if (*(unsigned __int8 *)(a2 + 77) != (_DWORD)v5)
  {
LABEL_28:
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
    goto LABEL_29;
  }

  if (!(_DWORD)v5)
  {
    unint64_t v16 = 1;
    goto LABEL_27;
  }

  if ((_DWORD)v5 == 1)
  {
    unint64_t v16 = 2;
LABEL_27:
    *(_BYTE *)(a2 + 77) = v16;
    goto LABEL_28;
  }

uint64_t szone_size(uint64_t a1, unint64_t a2)
{
  if (!a2 || (a2 & 0xF) != 0) {
    return 0LL;
  }
  uint64_t result = tiny_size(a1 + 16512, a2);
  if (!result)
  {
    if ((a2 & 0x1FF) != 0) {
      return 0LL;
    }
    uint64_t result = small_size(a1 + 17280, a2);
    if (!result)
    {
      if (((*MEMORY[0x189600148] - 1LL) & a2) == 0) {
        return szone_size_try_large(a1, a2);
      }
      return 0LL;
    }
  }

  return result;
}

unint64_t szone_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

unint64_t szone_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1) {
    return szone_malloc_should_clear(a1, a3, 1);
  }
  if (is_mul_ok(a2, a3))
  {
    a3 *= a2;
    if (a3 <= malloc_absolute_max_size) {
      return szone_malloc_should_clear(a1, a3, 1);
    }
  }

  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0LL;
}

mach_vm_address_t szone_valloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x800000) {
    return szone_memalign(a1, *MEMORY[0x189600148], a2);
  }
  uint64_t v3 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v3 = *MEMORY[0x189600138];
  }
  unint64_t v4 = (v3 + a2) & ~v3;
  int v5 = *MEMORY[0x189600120];
  if (*MEMORY[0x189600120] <= *MEMORY[0x189600140]) {
    LOBYTE(v5) = *MEMORY[0x189600140];
  }
  return large_malloc(a1, v4 >> v5, 0);
}

mach_vm_address_t szone_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 1) {
    a3 = 1LL;
  }
  unint64_t v3 = a3 + a2;
  if (__CFADD__(a3, a2)) {
    return 0LL;
  }
  if (a2 <= 0x10) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  unint64_t v5 = v3 - 1;
  if (v3 - 1 <= 0x3F0) {
    return tiny_memalign(a1, a2, a3, v5);
  }
  if (a2 <= 0x200 && a3 >= 0x3F1) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  if (a3 < 0x3F1)
  {
    a3 = 1024LL;
    unint64_t v5 = a2 + 1023;
  }

  if (v5 <= 0x3C00) {
    return small_memalign(a1, a2, a3, v5);
  }
  if (a3 >= 0x3C01 && *MEMORY[0x189600148] >= a2) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  uint64_t v6 = 15361LL;
  if (a3 > 0x3C01) {
    uint64_t v6 = a3;
  }
  uint64_t v7 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v7 = *MEMORY[0x189600138];
  }
  unint64_t v8 = (v7 + v6) & ~v7;
  int v9 = *MEMORY[0x189600120];
  int v10 = *MEMORY[0x189600140];
  if (*MEMORY[0x189600120] <= *MEMORY[0x189600140]) {
    LOBYTE(v9) = *MEMORY[0x189600140];
  }
  unint64_t v11 = v8 >> v9;
  if (!v11) {
    return 0LL;
  }
  int v12 = __clz(__rbit64(a2));
  if (v10 <= v12) {
    LOBYTE(v10) = v12;
  }
  return large_malloc(a1, v11, v10);
}

uint64_t szone_size_try_large(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  unint64_t v5 = large_entry_for_pointer_no_lock(a1, a2);
  if (v5) {
    uint64_t v6 = v5[1];
  }
  else {
    uint64_t v6 = 0LL;
  }
  os_unfair_lock_unlock(v4);
  return v6;
}

uint64_t szone_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (!a2)
  {
    unint64_t v10 = a3;
    return szone_malloc_should_clear(a1, v10, 0);
  }

  unint64_t v5 = (const void *)a2;
  if (!a3)
  {
    _szone_free(a1, a2, 0);
    a1 = v4;
    unint64_t v10 = 1LL;
    return szone_malloc_should_clear(a1, v10, 0);
  }

  uint64_t v6 = szone_size(a1, a2);
  if (!v6)
  {
    malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
    return 0LL;
  }

  unint64_t v7 = v6;
  unint64_t v8 = szone_good_size(v6, a3);
  if (v8 == v7) {
    return (uint64_t)v5;
  }
  unint64_t v9 = v8;
  if (v8 > 0x3F0)
  {
    if (v8 > 0x3C00)
    {
      if (v7 < 0x3C01) {
        goto LABEL_31;
      }
      int v12 = *(_DWORD *)(v4 + 16392);
      if ((v12 & 0x80) != 0) {
        goto LABEL_31;
      }
      if (v8 > v7 >> 1)
      {
        if (v8 <= v7) {
          goto LABEL_34;
        }
        if (large_try_realloc_in_place(v4, (unint64_t)v5, v7, v8))
        {
          if ((*(_BYTE *)(v4 + 16392) & 0x20) != 0) {
            goto LABEL_35;
          }
          return (uint64_t)v5;
        }

        goto LABEL_31;
      }

      return large_try_shrink_in_place(v4, (unint64_t)v5, v7, v8);
    }

    else
    {
      if ((v7 - 1009) >> 4 > 0x380) {
        goto LABEL_31;
      }
      if (v8 > v7 >> 1)
      {
        if (v8 > v7)
        {
          goto LABEL_22;
        }

LABEL_33:
        LOBYTE(v12) = *(_BYTE *)(v4 + 16392);
LABEL_34:
        if ((v12 & 0x20) != 0) {
LABEL_35:
        }
          _platform_memset();
        return (uint64_t)v5;
      }

      return small_try_shrink_in_place(v4 + 17280, (uint64_t)v5, v7, v8);
    }
  }

  else
  {
    if (v7 > 0x3F0) {
      goto LABEL_31;
    }
    if (v8 > v7 >> 1)
    {
      if (v8 > v7)
      {
        if (!tiny_try_realloc_in_place(v4 + 16512, (uint64_t)v5, v7, v8))
        {
LABEL_31:
          if (v9 > v7 >> 1 && v9 <= v7) {
            goto LABEL_33;
          }
          mach_vm_address_t should_clear = (void *)szone_malloc_should_clear(v4, a3, 0);
          if (should_clear)
          {
            uint64_t v14 = should_clear;
            if (v7 >= a3) {
              size_t v15 = a3;
            }
            else {
              size_t v15 = v7;
            }
            memcpy(should_clear, v5, v15);
            _szone_free(v4, (unint64_t)v5, 0);
            return (uint64_t)v14;
          }

          return 0LL;
        }

          a4("            } \n");
          a4("        } \n");
          a4("    }\n");
        }

        while (!((unsigned int (*)(void, const void *, uint64_t, uint64_t *))v57)(v56, v27, 14392LL, &v62)
             && !v64((uint64_t)v63, v27, v62, "                    "))
        {
          unint64_t v27 = *(const void **)(v62 + 24);
          if (!v27) {
            goto LABEL_33;
          }
        }

        goto LABEL_66;
      }

uint64_t szone_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x3F0)
  {
    if (a2 > 0x3C00)
    {
      uint64_t v4 = *MEMORY[0x189600118];
      if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
        uint64_t v4 = *MEMORY[0x189600138];
      }
      unint64_t v5 = (v4 + a2) & ~v4;
      if (v5 < a2) {
        return -1LL;
      }
      else {
        return v5;
      }
    }

    else
    {
      return ((_DWORD)a2 + 511) & 0x1FFFE00;
    }
  }

  else
  {
    else {
      unsigned int v2 = 1;
    }
    return 16LL * v2;
  }

uint64_t szone_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 > 0x3F0) {
    return 0LL;
  }
  else {
    return tiny_batch_malloc(a1, a2, a3, a4);
  }
}

void szone_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    tiny_batch_free(a1, a2, a3);
    unsigned int v6 = a3 - 1;
    do
    {
      unint64_t v7 = *(void *)(a2 + 8LL * v6);
      if (v7) {
        _szone_free(a1, v7, 0);
      }
    }

    while ((unint64_t)v6--);
  }

BOOL szone_claimed_address(uint64_t a1, unint64_t a2)
{
  return tiny_claimed_address(a1 + 16512, a2)
      || small_claimed_address(a1 + 17280, a2)
      || large_claimed_address(a1, a2) != 0;
}

void *scalable_zone_info(uint64_t a1, void *__dst, unsigned int a3)
{
  uint64_t v35 = *MEMORY[0x1895FEE08];
  task_name_t v6 = *MEMORY[0x1895FFD48];
  uint64_t v7 = *(void *)(a1 + 17136);
  if (*MEMORY[0x1895FFD48])
  {
    is_self = mach_task_is_self(*MEMORY[0x1895FFD48]);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
    }
  }

  uint64_t v11 = *(unsigned int *)(a1 + 17120);
  if ((v11 & 0x80000000) != 0)
  {
    uint64_t v14 = 0LL;
    int v13 = 0;
    LODWORD(v12) = 0;
  }

  else
  {
    uint64_t v12 = 0LL;
    int v13 = 0;
    uint64_t v14 = 0LL;
    uint64_t v15 = v11 + 1;
    uint64_t v16 = v7 - 432;
    do
    {
      v14 += *(void *)(v16 + 8) + *(void *)v16;
      v13 += *(_DWORD *)(v16 + 40);
      v12 += *(void *)(v16 + 24);
      v16 += 2560LL;
      --v15;
    }

    while (v15);
  }

  __src[4] = v13;
  __src[5] = v12;
  uint64_t v17 = *(void *)(a1 + 17904);
  if (v6)
  {
    uint64_t v18 = mach_task_is_self(v6);
    if (!(_DWORD)v18) {
      purgeable_ptr_in_use_enumerator_cold_1(v18, v19, v20);
    }
  }

  uint64_t v21 = *(unsigned int *)(a1 + 17888);
  if ((v21 & 0x80000000) != 0)
  {
    int v23 = 0;
    LODWORD(v22) = 0;
  }

  else
  {
    uint64_t v22 = 0LL;
    int v23 = 0;
    uint64_t v24 = v21 + 1;
    uint64_t v25 = v17 - 432;
    do
    {
      v14 += *(void *)(v25 + 8) + *(void *)v25;
      v23 += *(_DWORD *)(v25 + 40);
      v22 += *(void *)(v25 + 24);
      v25 += 2560LL;
      --v24;
    }

    while (v24);
  }

  __src[6] = v23;
  __src[7] = v22;
  int v26 = *(_DWORD *)(a1 + 18840);
  int v30 = *(_DWORD *)(a1 + 18820);
  int v31 = v26;
  int v32 = 0;
  int v33 = 0;
  int v34 = *(_DWORD *)(a1 + 16392);
  __src[0] = v23 + v13 + v30;
  __src[1] = v22 + v12 + v26;
  int v27 = ((*(_DWORD *)(a1 + 17288) - *(_DWORD *)(a1 + 17296)) << 23)
      + ((*(_DWORD *)(a1 + 16520) - *(_DWORD *)(a1 + 16528)) << 20)
      + v26;
  __src[2] = v27 - v14;
  __src[3] = v27;
  return memcpy(__dst, __src, 4LL * a3);
}

uint64_t _malloc_default_reader_0(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1 && !mach_task_is_self(a1)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  *a4 = a2;
  return 0LL;
}

uint64_t szone_pressure_relief()
{
  if (malloc_tracing_enabled) {
    szone_pressure_relief_cold_1();
  }
  return 0LL;
}

uint64_t scalable_zone_statistics(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a1 + 17120);
      if ((v4 & 0x80000000) != 0)
      {
        uint64_t v7 = 0LL;
        int v6 = 0;
        uint64_t v5 = 0LL;
      }

      else
      {
        uint64_t v5 = 0LL;
        int v6 = 0;
        uint64_t v7 = 0LL;
        uint64_t v8 = *(void *)(a1 + 17136) - 432LL;
        uint64_t v9 = v4 + 1;
        do
        {
          v5 += *(void *)(v8 + 8) + *(void *)v8;
          v6 += *(_DWORD *)(v8 + 40);
          v7 += *(void *)(v8 + 24);
          v8 += 2560LL;
          --v9;
        }

        while (v9);
      }

      *(_DWORD *)a2 = v6;
      uint64_t v17 = (*(void *)(a1 + 16520) - *(void *)(a1 + 16528)) << 20;
      *(void *)(a2 + 8) = v7;
      *(void *)(a2 + 16) = v17 - v5;
      *(void *)(a2 + 24) = v17;
      goto LABEL_18;
    case 1:
      uint64_t v10 = *(unsigned int *)(a1 + 17888);
      if ((v10 & 0x80000000) != 0)
      {
        uint64_t v13 = 0LL;
        int v12 = 0;
        uint64_t v11 = 0LL;
      }

      else
      {
        uint64_t v11 = 0LL;
        int v12 = 0;
        uint64_t v13 = 0LL;
        uint64_t v14 = *(void *)(a1 + 17904) - 432LL;
        uint64_t v15 = v10 + 1;
        do
        {
          v13 += *(void *)(v14 + 8) + *(void *)v14;
          v12 += *(_DWORD *)(v14 + 40);
          v11 += *(void *)(v14 + 24);
          v14 += 2560LL;
          --v15;
        }

        while (v15);
      }

      *(_DWORD *)a2 = v12;
      uint64_t v18 = (*(void *)(a1 + 17288) - *(void *)(a1 + 17296)) << 23;
      *(void *)(a2 + 24) = v18;
      uint64_t v16 = v18 - v13;
      *(void *)(a2 + 8) = v11;
      goto LABEL_17;
    case 2:
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 18820);
      uint64_t v16 = *(void *)(a1 + 18840);
      *(void *)(a2 + 24) = v16;
      *(void *)(a2 + 8) = v16;
LABEL_17:
      *(void *)(a2 + 16) = v16;
LABEL_18:
      uint64_t result = 1LL;
      break;
    case 3:
    case 4:
      *(_DWORD *)a2 = 0;
      *(void *)(a2 + 16) = 0LL;
      *(void *)(a2 + 24) = 0LL;
      uint64_t result = 1LL;
      *(void *)(a2 + 8) = 0LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t szone_ptr_in_use_enumerator( uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t v5 = a5;
  if (!a5)
  {
    if ((_DWORD)task && !mach_task_is_self(task)) {
      purgeable_ptr_in_use_enumerator_cold_1();
    }
    uint64_t v5 = _malloc_default_reader_0;
  }

  uint64_t result = v5(task, a4, 18944LL, &v9);
  if (!(_DWORD)result)
  {
    uint64_t result = tiny_in_use_enumerator();
    if (!(_DWORD)result)
    {
      uint64_t result = small_in_use_enumerator();
      if (!(_DWORD)result) {
        return large_in_use_enumerator();
      }
    }
  }

  return result;
}

uint64_t szone_check(uint64_t a1)
{
  unsigned int v2 = szone_check_counter + 1;
  szone_check_counter = v2;
  HIDWORD(v3) = 989560465 * v2;
  LODWORD(v3) = 989560465 * v2;
  if ((v3 >> 4) <= 0x68DB8)
  {
    malloc_report(5u, (uint64_t)"at szone_check counter=%d\n");
    unsigned int v2 = szone_check_counter;
  }

  if (v2 < szone_check_start || v2 % szone_check_modulo) {
    return 1LL;
  }
  else {
    return szone_check_all(a1);
  }
}

uint64_t szone_print_self(const void *a1, int a2)
{
  return szone_print( *MEMORY[0x1895FFD48],  2 * (a2 != 0),  a1,  (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t *))_malloc_default_reader_0,  (void (*)(const char *, ...))malloc_report_simple);
}

uint64_t szone_log(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16400) = a2;
  return result;
}

uint64_t szone_force_lock(uint64_t a1)
{
  size_t v1 = (int *)(a1 + 17120);
  if (*(int *)(a1 + 17120) >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_lock_with_options();
      ++v3;
      v2 += 2560LL;
    }

    while (v3 < *v1);
  }

  os_unfair_lock_lock_with_options();
  os_unfair_lock_lock_with_options();
  if (v1[192] >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    do
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_lock_with_options();
      ++v5;
      v4 += 2560LL;
    }

    while (v5 < v1[192]);
  }

  os_unfair_lock_lock_with_options();
  os_unfair_lock_lock_with_options();
  return os_unfair_lock_lock_with_options();
}

void szone_force_unlock(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 17120);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 18816));
  if ((v2[192] & 0x80000000) == 0)
  {
    uint64_t v3 = -1LL;
    uint64_t v4 = -2560LL;
    do
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v4));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v4 + 4));
      ++v3;
      v4 += 2560LL;
    }

    while (v3 < v2[192]);
  }

  if ((*v2 & 0x80000000) == 0)
  {
    uint64_t v5 = -1LL;
    uint64_t v6 = -2560LL;
    do
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17136) + v6));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17136) + v6 + 4));
      ++v5;
      v6 += 2560LL;
    }

    while (v5 < *v2);
  }

uint64_t szone_statistics(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  task_name_t v4 = *MEMORY[0x1895FFD48];
  if (*MEMORY[0x1895FFD48])
  {
    is_self = mach_task_is_self(*MEMORY[0x1895FFD48]);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v6, v7);
    }
    uint64_t v8 = mach_task_is_self(v4);
    if (!(_DWORD)v8) {
      purgeable_ptr_in_use_enumerator_cold_1(v8, v9, v10);
    }
    uint64_t v11 = *(void *)(v3 + 17136);
    uint64_t result = mach_task_is_self(v4);
    if (!(_DWORD)result) {
      purgeable_ptr_in_use_enumerator_cold_1(result, v12, v13);
    }
  }

  else
  {
    uint64_t v11 = *(void *)(result + 17136);
  }

  uint64_t v14 = *(unsigned int *)(v3 + 17120);
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v17 = 0LL;
    int v16 = 0;
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = 0LL;
    int v16 = 0;
    uint64_t v17 = 0LL;
    uint64_t v18 = v14 + 1;
    uint64_t v19 = v11 - 432;
    do
    {
      v17 += *(void *)(v19 + 8) + *(void *)v19;
      v16 += *(_DWORD *)(v19 + 40);
      v15 += *(void *)(v19 + 24);
      v19 += 2560LL;
      --v18;
    }

    while (v18);
  }

  uint64_t v20 = *(void *)(v3 + 17904);
  if (v4)
  {
    uint64_t result = mach_task_is_self(v4);
    if (!(_DWORD)result) {
      purgeable_ptr_in_use_enumerator_cold_1(result, v21, v22);
    }
  }

  uint64_t v23 = *(unsigned int *)(v3 + 17888);
  if ((v23 & 0x80000000) == 0)
  {
    uint64_t v24 = v23 + 1;
    uint64_t v25 = v20 - 432;
    do
    {
      v17 += *(void *)(v25 + 8) + *(void *)v25;
      v16 += *(_DWORD *)(v25 + 40);
      v15 += *(void *)(v25 + 24);
      v25 += 2560LL;
      --v24;
    }

    while (v24);
  }

  uint64_t v26 = *(void *)(v3 + 18840);
  *(_DWORD *)a2 = *(_DWORD *)(v3 + 18820) + v16;
  uint64_t v27 = v26 + v15;
  uint64_t v28 = v26
      + ((*(void *)(v3 + 16520) - *(void *)(v3 + 16528)) << 20)
      + ((*(void *)(v3 + 17288) - *(void *)(v3 + 17296)) << 23);
  *(void *)(a2 + 24) = v28;
  *(void *)(a2 + 8) = v27;
  *(void *)(a2 + 16) = v28 - v17;
  return result;
}

uint64_t szone_locked(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 18816);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 18816)))
  {
    uint64_t v3 = (int *)(a1 + 17120);
    os_unfair_lock_unlock(v2);
    if ((*(_DWORD *)(a1 + 17888) & 0x80000000) != 0)
    {
LABEL_7:
      if (*v3 < 0) {
        return 0LL;
      }
      uint64_t v6 = -1LL;
      for (uint64_t i = -2560LL; os_unfair_lock_trylock((os_unfair_lock_t)(*(void *)(a1 + 17136) + i)); i += 2560LL)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17136) + i));
        if (!os_unfair_lock_trylock((os_unfair_lock_t)(*(void *)(a1 + 17136) + i + 4))) {
          break;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17136) + i + 4));
        if (++v6 >= *v3) {
          return 0LL;
        }
      }
    }

    else
    {
      uint64_t v4 = -1LL;
      uint64_t v5 = -2560LL;
      while (os_unfair_lock_trylock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v5)))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v5));
        if (!os_unfair_lock_trylock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v5 + 4))) {
          break;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 17904) + v5 + 4));
        ++v4;
        v5 += 2560LL;
      }
    }
  }

  return 1LL;
}

uint64_t szone_reinit_lock(uint64_t result)
{
  size_t v1 = (int *)(result + 17120);
  *(_DWORD *)(result + 18816) = 0;
  if ((*(_DWORD *)(result + 17888) & 0x80000000) == 0)
  {
    uint64_t v2 = (void *)(*(void *)(result + 17904) - 2560LL);
    uint64_t v3 = -1LL;
    do
    {
      *uint64_t v2 = 0LL;
      ++v3;
      v2 += 320;
    }

    while (v3 < *(int *)(result + 17888));
  }

  if ((*v1 & 0x80000000) == 0)
  {
    uint64_t v4 = (void *)(*(void *)(result + 17136) - 2560LL);
    uint64_t v5 = -1LL;
    do
    {
      *uint64_t v4 = 0LL;
      ++v5;
      v4 += 320;
    }

    while (v5 < *v1);
  }

  return result;
}

uint64_t szone_statistics_task( uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), uint64_t a4)
{
  uint64_t v5 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
      }
    }

    uint64_t v5 = _malloc_default_reader_0;
  }

  uint64_t result = v5(task, a2, 18944LL, &v25);
  if (!(_DWORD)result)
  {
    uint64_t result = v5(task, *(void *)(v25 + 17136), 2560LL * *(int *)(v25 + 17120), &v24);
    if (!(_DWORD)result)
    {
      uint64_t v12 = *(unsigned int *)(v25 + 17120);
      if ((v12 & 0x80000000) != 0)
      {
        uint64_t v15 = 0LL;
        int v14 = 0;
        uint64_t v13 = 0LL;
      }

      else
      {
        uint64_t v13 = 0LL;
        int v14 = 0;
        uint64_t v15 = 0LL;
        uint64_t v16 = v24 - 432;
        uint64_t v17 = v12 + 1;
        do
        {
          v15 += *(void *)(v16 + 8) + *(void *)v16;
          v14 += *(_DWORD *)(v16 + 40);
          v13 += *(void *)(v16 + 24);
          v16 += 2560LL;
          --v17;
        }

        while (v17);
      }

      uint64_t result = v5(task, *(void *)(v25 + 17904), 2560LL * *(int *)(v25 + 17888), &v24);
      if (!(_DWORD)result)
      {
        uint64_t v18 = (void *)v25;
        uint64_t v19 = *(unsigned int *)(v25 + 17888);
        if ((v19 & 0x80000000) == 0)
        {
          uint64_t v20 = v24 - 432;
          uint64_t v21 = v19 + 1;
          do
          {
            v15 += *(void *)(v20 + 8) + *(void *)v20;
            v14 += *(_DWORD *)(v20 + 40);
            v13 += *(void *)(v20 + 24);
            v20 += 2560LL;
            --v21;
          }

          while (v21);
        }

        uint64_t result = 0LL;
        uint64_t v22 = *(void *)(v25 + 18840);
        *(_DWORD *)a4 = *(_DWORD *)(v25 + 18820) + v14;
        *(void *)(a4 + 8) = v22 + v13;
        uint64_t v23 = v22 + ((v18[2065] - v18[2066]) << 20) + ((v18[2161] - v18[2162]) << 23);
        *(void *)(a4 + 16) = v23 - v15;
        *(void *)(a4 + 24) = v23;
      }
    }
  }

  return result;
}

mach_vm_address_t create_scalable_szone(uint64_t a1, int a2)
{
  mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x189600148] + 18943LL) & -*MEMORY[0x189600148], 0, 0x40000000, 1);
  mach_vm_address_t v4 = pages;
  if (pages)
  {
    uint64_t v5 = (unsigned int *)(pages + 16392);
    unsigned int v6 = a2 & 0xBFFFFFFF | ((_dyld_get_image_slide() == 0) << 30);
    unsigned int v7 = max_magazines;
    if (v7 <= 1) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
    rack_init(v4 + 16512, 1, v8, v6);
    rack_init(v4 + 17280, 2, v8, v6);
    *(void *)(v4 + 18856) = malloc_entropy;
    *(_DWORD *)(v4 + 104) = 16;
    *(void *)(v4 + 16) = szone_size;
    *(void *)(v4 + 24) = szone_malloc;
    *(void *)(v4 + 32) = szone_calloc;
    *(void *)(v4 + 40) = szone_valloc;
    *(void *)(v4 + 48) = szone_free;
    *(void *)(v4 + 56) = szone_realloc;
    *(void *)(v4 + 64) = szone_destroy;
    *(void *)(v4 + 80) = szone_batch_malloc;
    *(void *)(v4 + 88) = szone_batch_free;
    *(void *)(v4 + 96) = &szone_introspect;
    *(void *)(v4 + 112) = szone_memalign;
    *(void *)(v4 + 120) = szone_free_definite_size;
    *(void *)(v4 + 128) = szone_pressure_relief;
    *(void *)(v4 + 136) = szone_claimed_address;
    *(void *)(v4 + 144) = szone_try_free_default;
    *(void *)(v4 + 160) = szone_malloc_type_malloc;
    *(void *)(v4 + 168) = szone_malloc_type_calloc;
    *(void *)(v4 + 176) = szone_malloc_type_realloc;
    *(void *)(v4 + 184) = szone_malloc_type_memalign;
    *(void *)mach_vm_address_t v4 = 0LL;
    *(void *)(v4 + 8) = 0LL;
    mprotect((void *)v4, 0xC8uLL, 1);
    *uint64_t v5 = v6;
    *(_DWORD *)(v4 + 18816) = 0;
    *(void *)(v4 + 0x4000) = -1LL;
  }

  return v4;
}

uint64_t szone_destroy(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)(a1 + 16392);
  uint64_t v3 = *(unsigned int *)(a1 + 18824);
  if ((_DWORD)v3)
  {
    uint64_t v4 = 24 * v3;
    do
    {
      uint64_t v5 = *(void *)(a1 + 18832) + v4;
      uint64_t v6 = *(void *)(v5 - 24);
      if (v6) {
        mvm_deallocate_pages(v6, *(void *)(v5 - 16), *v2);
      }
      v4 -= 24LL;
    }

    while (v4);
    unsigned int v7 = v2[608];
  }

  else
  {
    unsigned int v7 = 0;
  }

  large_entries_free_no_lock(a1, *(void *)(a1 + 18832), v7, &v9);
  if (v10) {
    mvm_deallocate_pages(v9, v10, *v2);
  }
  rack_destroy_regions(a1 + 16512);
  rack_destroy_regions(a1 + 17280);
  rack_destroy(a1 + 16512);
  rack_destroy(a1 + 17280);
  return mvm_deallocate_pages(a1, (*MEMORY[0x189600148] + 18943LL) & -*MEMORY[0x189600148], 0LL);
}

void szone_try_free_default(uint64_t a1, unint64_t a2)
{
}

unint64_t szone_malloc_type_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

uint64_t szone_check_all(uint64_t a1)
{
  if (v2)
  {
    uint64_t v3 = *(unint64_t **)(a1 + 17304);
    unint64_t v4 = *v3;
    if (*v3)
    {
      for (unint64_t i = 0LL; i < v4; ++i)
      {
        uint64_t v6 = *(void *)(v3[2] + 8 * i);
        if ((unint64_t)(v6 + 1) >= 2)
        {
          uint64_t v7 = *(void *)(a1 + 17904);
          int v8 = *(_DWORD *)(v6 + 24);
          uint64_t v9 = (os_unfair_lock_s *)(v7 + 2560LL * v8);
          os_unfair_lock_lock_with_options();
          int v10 = *(_DWORD *)(v6 + 24);
          if (v10 != v8)
          {
            do
            {
              os_unfair_lock_unlock(v9);
              uint64_t v9 = (os_unfair_lock_s *)(v7 + 2560LL * v10);
              os_unfair_lock_lock_with_options();
              BOOL v11 = v10 == *(_DWORD *)(v6 + 24);
              int v10 = *(_DWORD *)(v6 + 24);
            }

            while (!v11);
          }

          small_check_region(a1 + 17280, v6, i);
          int v13 = v12;
          os_unfair_lock_unlock(v9);
          if (!v13) {
            goto LABEL_15;
          }
          uint64_t v3 = *(unint64_t **)(a1 + 17304);
          unint64_t v4 = *v3;
        }
      }
    }

    uint64_t v14 = 0LL;
    while (1)
    {
      small_free_list_check(a1 + 17280, v14);
      if (!v15) {
        break;
      }
      if (++v14 == 31) {
        return 1LL;
      }
    }
  }

LABEL_15:
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 16392) &= ~0x80000000;
  return result;
}

  int v12 = a3 & 0xFFFFFFFFFF800000LL;
  if (a3 < (a3 & 0xFFFFFFFFFF800000LL | 0x7FA6) || a3 >= (v12 | 0x81F8))
  {
    uint64_t v16 = *(void *)(a1 + 632) ^ a1;
    *(_BYTE *)(a3 + 8) = BYTE4(v16)
                       + v16
    *(void *)a3 = 0LL;
    LODWORD(v16) = ((v16 ^ v7) >> 32) + (v16 ^ v7) + ((((v16 ^ v7) >> 32) + (v16 ^ v7)) >> 16);
    *(_BYTE *)(a3 + 24) = v16 + BYTE1(v16);
    *(void *)(a3 + 16) = v7;
    int v15 = a3;
  }

  else
  {
    *(void *)a3 = 0LL;
    *(void *)(a3 + 8) = v7;
    if (a3)
    {
      int v13 = *(_WORD *)(a3 + 16);
      uint64_t v14 = v12 + ((unint64_t)(v13 & 0x7FFF) << 9);
      if (v13 < 0) {
        int v15 = v14;
      }
      else {
        int v15 = 0LL;
      }
    }

    else
    {
      int v15 = 0LL;
    }
  }

  uint64_t v17 = ((v15 - (v15 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  uint64_t v18 = ((unint64_t)(v15 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v17 > v18) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v19 = (v15 & 0xFFFFFFFFFF800000LL) + 40;
  *(_WORD *)(v19 + 2 * v17) = a4 | 0x8000;
  *(_WORD *)(v19 + 2 * v18) = a4 | 0x8000;
  if (!v7) {
    goto LABEL_32;
  }
  uint64_t v20 = v7 & 0xFFFFFFFFFF800000LL;
  if (v7 < (v7 & 0xFFFFFFFFFF800000LL | 0x7FA6) || v7 >= (v20 | 0x81F8))
  {
    uint64_t v21 = *(void *)(a1 + 632) ^ a1 ^ a3;
    *(_BYTE *)(v7 + 8) = BYTE4(v21)
                       + v21
  }

  else if ((*(_WORD *)(v7 + 16) & 0x8000) == 0 {
         || (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9 == -(uint64_t)v20)
  }
  {
LABEL_32:
    *(_DWORD *)(a2 + 4LL * (v4 >> 5) + 2088) |= 1 << v4;
    goto LABEL_33;
  }

  *(void *)uint64_t v7 = a3;
LABEL_33:
  *uint64_t v6 = a3;
  return a3;
}

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
  return v3;
}

    BOOL v11 = a1;
    if (*(void *)(a1 + 304) != v7) {
      return;
    }
    goto LABEL_16;
  }

  uint64_t v9 = 16 * (int)v6 + 16;
  if ((a2 & 0x3FFF) != (a2 & 0x3FFF) / v9 * v9) {
    goto LABEL_21;
  }
  int v10 = *(void *)(a1 + 28696);
  if (16 * (_DWORD)v6 == -16 || (v10 ^ *(void *)a2) == a2) {
    goto LABEL_21;
  }
  if (v9 >= 0x11 && malloc_zero_policy == 0)
  {
    bzero((void *)(a2 + 16), v9 - 16);
    int v10 = *(void *)(a1 + 28696);
  }

  int v15 = *v7;
  uint64_t v16 = slots_by_size_class[v6];
  *(void *)a2 = v10 ^ a2;
  while (1)
  {
    uint64_t v17 = v15 & 0x7FF;
    uint64_t v18 = (v15 + 2048) & 0x1FF800;
    uint64_t v19 = (v15 + 0x200000) & 0x7FE00000 | v15 & 0x80000000;
    if (v17 != 2044) {
      break;
    }
    uint64_t v17 = 2043;
LABEL_42:
    uint64_t v21 = v18 | v19 | ((unsigned __int16)((unsigned __int16)(a2 & 0x3FFF) / (int)v9) + 1) & 0x7FF;
    *(void *)(a2 + 8) = v17;
    while (1)
    {
      uint64_t v22 = __ldxr(v7);
      if (v22 != v15) {
        break;
      }
      if (!__stlxr(v21, v7))
      {
        uint64_t v24 = 1;
        goto LABEL_47;
      }
    }

    uint64_t v24 = 0;
    __clrex();
LABEL_47:
    if (v24) {
      goto LABEL_55;
    }
LABEL_51:
    int v15 = v22;
  }

  if (v16 - 1 != v18 >> 11) {
    goto LABEL_42;
  }
  *(void *)(a2 + 8) = 0LL;
  if (v15 < 0) {
    uint64_t v20 = 2043;
  }
  else {
    uint64_t v20 = 2045;
  }
  uint64_t v21 = v20 | v18 | v19;
  while (1)
  {
    uint64_t v22 = __ldxr(v7);
    if (v22 != v15) {
      break;
    }
    if (!__stlxr(v21, v7))
    {
      uint64_t v23 = 1;
      goto LABEL_50;
    }
  }

  uint64_t v23 = 0;
  __clrex();
LABEL_50:
  if ((v23 & 1) == 0) {
    goto LABEL_51;
  }
  if ((v15 & 0x80000000) == 0 && !nanov2_madvise_policy)
  {
    nanov2_madvise_block((os_unfair_lock_s *)a1, v7, v6, 2045);
    return;
  }

  if (v17 < a3 || v17 >> 1 > a3)
  {
    xzm_malloc(v6, a3, a4, 0);
    uint64_t v19 = v18;
    if (v18)
    {
      if (v17 >= a3) {
        uint64_t v20 = a3;
      }
      else {
        uint64_t v20 = v17;
      }
      memcpy(v18, (const void *)a2, v20);
    }
  }

  if (v13)
  {
    uint64_t v14 = 0LL;
    goto LABEL_33;
  }

  if ((*(_BYTE *)(a1 + 296) & 0x80) == 0) {
LABEL_94:
  }
    xzm_malloc_zone_free_slow_cold_1(a2);
  if (*(void *)(a1 + 232)) {
    uint64_t v14 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v14 = a1;
  }
  if (v4 >> 14) {
    goto LABEL_31;
  }
  int v15 = *(void *)(v14 + 232);
  if (!v15) {
    int v15 = v14;
  }
  uint64_t v16 = *(void *)(v15 + 408);
  if (!v16) {
    goto LABEL_31;
  }
  uint64_t v17 = *(unsigned int *)(v16 + 4 * v4);
  if (!(_DWORD)v17) {
    goto LABEL_31;
  }
  uint64_t v18 = v17 << 14;
  uint64_t v19 = a2 - *(void *)(v18 + 48);
  uint64_t v20 = v19 >> 14;
  uint64_t v21 = v18 + 48LL * v20 + 2104;
  if ((*(_BYTE *)(v18 + 48LL * v20 + 2136) & 0xF) == 4)
  {
    int v37 = v21 - *(unsigned int *)(v18 + 48LL * v20 + 2140);
    uint64_t v38 = *(_BYTE *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      uint32_t v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        goto LABEL_93;
      }

      if ((v39 & 6) != 0 && v21 == v37) {
LABEL_93:
      }
        uint64_t v21 = v37;
    }
  }

  if (v15 || (*(_BYTE *)(a1 + 296) & 0x80) == 0)
  {
    uint64_t v16 = 0LL;
    goto LABEL_18;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v16 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v16 = a1;
  }
  if (v6 >> 14) {
    goto LABEL_38;
  }
  uint64_t v18 = *(void *)(v16 + 232);
  if (!v18) {
    uint64_t v18 = v16;
  }
  uint64_t v19 = *(void *)(v18 + 408);
  if (!v19) {
    goto LABEL_38;
  }
  uint64_t v20 = *(unsigned int *)(v19 + 4 * v6);
  if (!(_DWORD)v20) {
    goto LABEL_38;
  }
  uint64_t v21 = v20 << 14;
  uint64_t v22 = a2 - *(void *)(v21 + 48);
  uint64_t v23 = v22 >> 14;
  uint64_t v24 = v21 + 48LL * v23 + 2104;
  if ((*(_BYTE *)(v21 + 48LL * v23 + 2136) & 0xF) == 4)
  {
    int v37 = v24 - *(unsigned int *)(v21 + 48LL * v23 + 2140);
    uint64_t v38 = *(_BYTE *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      uint32_t v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        goto LABEL_92;
      }

      if ((v39 & 6) != 0 && v24 == v37) {
LABEL_92:
      }
        uint64_t v24 = v37;
    }
  }

  if (v13)
  {
    uint64_t v14 = 0LL;
    goto LABEL_17;
  }

  if ((*(_BYTE *)(a1 + 296) & 0x80) == 0)
  {
LABEL_38:
    find_zone_and_free((void *)a2, 1u);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v14 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v14 = a1;
  }
  if (v4 >> 14) {
    goto LABEL_36;
  }
  uint64_t v16 = *(void *)(v14 + 232);
  if (!v16) {
    uint64_t v16 = v14;
  }
  uint64_t v17 = *(void *)(v16 + 408);
  if (!v17) {
    goto LABEL_36;
  }
  uint64_t v18 = *(unsigned int *)(v17 + 4 * v4);
  if (!(_DWORD)v18) {
    goto LABEL_36;
  }
  uint64_t v19 = v18 << 14;
  uint64_t v20 = a2 - *(void *)(v19 + 48);
  uint64_t v21 = v20 >> 14;
  uint64_t v22 = v19 + 48LL * v21 + 2104;
  if ((*(_BYTE *)(v19 + 48LL * v21 + 2136) & 0xF) == 4)
  {
    uint64_t v38 = v22 - *(unsigned int *)(v19 + 48LL * v21 + 2140);
    uint32_t v39 = *(_BYTE *)(v38 + 32) & 0xF;
    if (v39 <= 8)
    {
      unsigned int v40 = 1 << v39;
      if ((v40 & 0x1E8) != 0)
      {
        goto LABEL_94;
      }

      if ((v40 & 6) != 0 && v22 == v38) {
LABEL_94:
      }
        uint64_t v22 = v38;
    }
  }

  if (*((void *)&xmmword_18C528090 + 1)) {
    uint64_t result = (*((uint64_t (**)(uint64_t))&xmmword_18C528090 + 1))(result);
  }
  initial_num_zones = malloc_num_zones;
  if (malloc_sanitizer_enabled) {
    return sanitizer_reset_environment();
  }
  return result;
}

uint64_t szone_print( uint64_t a1, uint64_t a2, const void *a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  __src[7] = *MEMORY[0x1895FEE08];
  if (a4(a1, (uint64_t)a3, 18944LL, &v38))
  {
    int v10 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }

  uint64_t v11 = v38;
  uint64_t v12 = *(unsigned int *)(v11 + 17120);
  if ((v12 & 0x80000000) != 0)
  {
    uint64_t v15 = 0LL;
    unsigned int v14 = 0;
    LODWORD(v13) = 0;
  }

  else
  {
    uint64_t v13 = 0LL;
    unsigned int v14 = 0;
    uint64_t v15 = 0LL;
    uint64_t v16 = v12 + 1;
    uint64_t v17 = (uint64_t *)(v39 - 54);
    do
    {
      v15 += v17[1] + *v17;
      v14 += *((_DWORD *)v17 + 10);
      v13 += v17[3];
      v17 += 320;
      --v16;
    }

    while (v16);
  }

  __src[2] = __PAIR64__(v13, v14);
  if (a4(a1, *(void *)(v11 + 17904), 2560LL, (uint64_t *)&v39))
  {
LABEL_10:
    int v10 = "Failed to get scalable zone info\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }

  uint64_t v19 = *(unsigned int *)(v11 + 17888);
  if ((v19 & 0x80000000) != 0)
  {
    unsigned int v21 = 0;
    LODWORD(v20) = 0;
  }

  else
  {
    uint64_t v20 = 0LL;
    unsigned int v21 = 0;
    uint64_t v22 = v19 + 1;
    uint64_t v23 = (uint64_t *)(v39 - 54);
    do
    {
      v15 += v23[1] + *v23;
      v21 += *((_DWORD *)v23 + 10);
      v20 += v23[3];
      v23 += 320;
      --v22;
    }

    while (v22);
  }

  __src[3] = __PAIR64__(v20, v21);
  int v24 = *(_DWORD *)(v11 + 18840);
  LODWORD(__src[4]) = *(_DWORD *)(v11 + 18820);
  HIDWORD(__src[4]) = v24;
  __src[5] = 0LL;
  LODWORD(__src[6]) = *(_DWORD *)(v11 + 16392);
  LODWORD(__src[0]) = v21 + v14 + LODWORD(__src[4]);
  HIDWORD(__src[0]) = v20 + v13 + v24;
  int v25 = ((*(_DWORD *)(v11 + 17288) - *(_DWORD *)(v11 + 17296)) << 23)
      + ((*(_DWORD *)(v11 + 16520) - *(_DWORD *)(v11 + 16528)) << 20)
      + v24;
  LODWORD(__src[1]) = v25 - v15;
  HIDWORD(__src[1]) = v25;
  memcpy(__dst, __src, sizeof(__dst));
  a5( "Scalable zone %p: inUse=%u(%u) touched=%u allocated=%u flags=0x%x\n",  a3,  __dst[0],  __dst[1],  __dst[2],  __dst[3],  __dst[12]);
  a5("\ttiny=%u(%u) small=%u(%u) large=%u(%u)\n", __dst[4], __dst[5], __dst[6], __dst[7], __dst[8], __dst[9]);
  if (!mach_task_is_self(a1))
  {
    int v10 = "(unable to safely further examine remote process)\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  a5("%lu tiny regions:\n", *(void *)(v38 + 16520));
  uint64_t v26 = v38;
  if (*(void *)(v38 + 16528))
  {
    a5("[%lu tiny regions have been vm_deallocate'd]\n", *(void *)(v38 + 16528));
    uint64_t v26 = v38;
  }

  if (a4(a1, *(void *)(v26 + 16536), 32LL, (uint64_t *)&v39))
  {
    int v10 = "Failed to map tiny rack region_generation\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  if (a4(a1, v39[2], 8LL, &v37))
  {
    int v10 = "Failed to map tiny rack hashed_regions\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  if (a4(a1, *(void *)(v38 + 17136), 2560LL * *(int *)(v38 + 17120), &v36))
  {
    int v10 = "Failed to map tiny rack magazines\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  unint64_t v27 = *v39;
  if (*v39)
  {
    unint64_t v28 = 0LL;
    int v29 = 0;
    do
    {
      if ((unint64_t)(*(void *)(v37 + 8 * v28) + 1LL) >= 2)
      {
        if (a4(a1, *(void *)(v37 + 8 * v28), 0x100000LL, __src))
        {
LABEL_57:
          int v10 = "Failed to map region %p\n";
          return ((uint64_t (*)(void))a5)(v10);
        }

        if (*(_DWORD *)(__src[0] + 24LL) == -1LL) {
          ++v29;
        }
        print_tiny_region();
        unint64_t v27 = *v39;
      }

      ++v28;
    }

    while (v28 < v27);
  }

  if (*(void *)(v36 - 408)) {
    int v30 = "Tiny recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  }
  else {
    int v30 = "Tiny recirc depot is empty\n";
  }
  a5(v30);
  if ((_DWORD)a2) {
    print_tiny_free_list(a1, a4, a5, (uint64_t)a3 + 16512);
  }
  a5("%lu small regions:\n", *(void *)(v38 + 17288));
  uint64_t v31 = v38;
  if (*(void *)(v38 + 17296))
  {
    a5("[%lu small regions have been vm_deallocate'd]\n", *(void *)(v38 + 17296));
    uint64_t v31 = v38;
  }

  if (a4(a1, *(void *)(v31 + 17304), 32LL, (uint64_t *)&v39))
  {
    int v10 = "Failed to map small rack region_generation\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  if (a4(a1, v39[2], 8LL, &v37))
  {
    int v10 = "Failed to map small rack hashed_regions\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  if (a4(a1, *(void *)(v38 + 17904), 2560LL * *(int *)(v38 + 17888), &v36))
  {
    int v10 = "Failed to map small rack magazines\n";
    return ((uint64_t (*)(void))a5)(v10);
  }

  unint64_t v32 = *v39;
  if (*v39)
  {
    unint64_t v33 = 0LL;
    int v34 = 0;
    do
    {
      if ((unint64_t)(*(void *)(v37 + 8 * v33) + 1LL) >= 2)
      {
        if (a4(a1, *(void *)(v37 + 8 * v33), 0x800000LL, __src)) {
          goto LABEL_57;
        }
        if (*(_DWORD *)(__src[0] + 24LL) == -1LL) {
          ++v34;
        }
        print_small_region();
        unint64_t v32 = *v39;
      }

      ++v33;
    }

    while (v33 < v32);
  }

  if (*(void *)(v36 - 408)) {
    uint64_t v35 = "Small recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  }
  else {
    uint64_t v35 = "Small recirc depot is empty\n";
  }
  a5(v35);
  if ((_DWORD)a2) {
    print_small_free_list(a1, a4, a5, (uint64_t)a3 + 17280);
  }
  return large_debug_print(a1, a2, (uint64_t)a3, a4, a5);
}

  ;
}

unint64_t small_finalize_region(unint64_t result, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 2128);
  if (v3)
  {
    uint64_t v4 = result;
    unint64_t v5 = *(void *)(a2 + 2144) - v3;
    unint64_t v6 = v5 + 0x800000;
    unint64_t v7 = v3 >> 9;
    unsigned int v8 = ((v5 + 8355328) >> 9) & 0x3FFF;
    uint64_t v9 = *(_WORD *)(((v5 + 0x7FFFFF) & 0xFFFFFFFFFF800000LL | (2
                                                             * ((((_DWORD)v5
                                                                + 0x7FFFFF
                                                                - (((_DWORD)v5 + 0x7FFFFF) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                  + 0x28) & 0x7FFF;
    if (v8) {
      BOOL v10 = v8 >= v9;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      unint64_t v11 = v6 - (v9 << 9);
      if (*(__int16 *)((v11 & 0xFFFFFFFFFF800000LL | (2
                                                     * (((v11 - (v11 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + 0x28) < 0)
      {
        small_free_list_find_by_ptr(result, v6 - (v9 << 9), v9);
        small_free_list_remove_ptr(v4, a2, v12, v9);
        LOWORD(v7) = v9 + v7;
        unint64_t v6 = v11;
      }
    }

    uint64_t result = small_free_list_add_ptr(v4, a2, v6, (unsigned __int16)v7);
    *(void *)(a2 + 2128) = 0LL;
  }

  *(void *)(a2 + 2144) = 0LL;
  return result;
}

void small_free_list_find_by_ptr(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = a2 & 0xFFFFFFFFFF800000LL;
  if ((a3 | 0x8000) == *(unsigned __int16 *)((a2 & 0xFFFFFFFFFF800000LL | (2
                                                                          * (((unint64_t)(a2
                                                                                               - (a2 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                                            + 0x28))
  {
    if (((*MEMORY[0x189600148] - 1LL) & a2) == 0 && (unint64_t)a3 << 9 >= *MEMORY[0x189600128])
    {
      for (uint64_t i = 0LL; i != 594; i += 18LL)
      {
        __int16 v6 = *(_WORD *)(v3 + 32694 + i);
        if (v6)
        {
          int v7 = v6;
          unint64_t v8 = ((v3 + 32678 + i) & 0xFFFFFFFFFF800000LL) + ((unint64_t)(v6 & 0x7FFF) << 9);
          if (v7 >= 0) {
            unint64_t v8 = 0LL;
          }
          if (v8 == a2) {
            break;
          }
        }
      }
    }
  }

  else
  {
    malloc_zone_error( *(_DWORD *)(a1 + 620),  1,  (uint64_t)"small_free_list_find_by_ptr: ptr is not free (ptr metadata !SMALL_IS_FREE), ptr=%p msize=%d metadata=0x%x\n");
    __break(1u);
  }

void small_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a3)
  {
    unint64_t v4 = a3 & 0xFFFFFFFFFF800000LL;
    if ((a3 & 0xFFFFFFFFFF800000LL | 0x7FA6) > a3)
    {
      unint64_t v5 = a3;
    }

    else
    {
      unint64_t v5 = a3;
      if ((v4 | 0x81F8) > a3)
      {
        __int16 v6 = *(_WORD *)(a3 + 16);
        unint64_t v7 = v4 + ((unint64_t)(v6 & 0x7FFF) << 9);
        if (v6 < 0) {
          unint64_t v5 = v7;
        }
        else {
          unint64_t v5 = 0LL;
        }
      }
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  unint64_t v8 = v5 & 0xFFFFFFFFFF800000LL;
  unint64_t v9 = ((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  unint64_t v10 = ((unint64_t)(v5 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v9 > v10) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint64_t v11 = v8 | 0x28;
  if ((*(_WORD *)(v11 + 2 * v9) & 0x7FFF) != a4) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  *(_WORD *)(v11 + 2 * v9) = 0;
  *(_WORD *)(v11 + 2 * v10) = 0;
  small_free_list_remove_ptr_no_clear(a1, a2, a3, a4);
}

unint64_t small_free_list_add_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a4 >= 0x20) {
    unsigned int v4 = 30;
  }
  else {
    unsigned int v4 = a4 - 1;
  }
  if (!a4) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v5 = a2 + 8LL * v4;
  unint64_t v8 = *(void *)(v5 + 32);
  __int16 v6 = (unint64_t *)(v5 + 32);
  unint64_t v7 = v8;
  if (((*MEMORY[0x189600148] - 1LL) & a3) == 0 && (unint64_t)a4 << 9 >= *MEMORY[0x189600128])
  {
    uint64_t v10 = 0LL;
    while (*(_WORD *)((a3 & 0xFFFFFFFFFF800000LL | 0x7FB6) + v10))
    {
      v10 += 18LL;
      if (v10 == 594) {
        goto LABEL_15;
      }
    }

    uint64_t v11 = (a3 & 0xFFFFFFFFFF800000LL) + v10;
    *(_WORD *)(v11 + 32694) = (a3 >> 9) & 0x3FFF | 0x8000;
    a3 = v11 + 32678;
  }

uint64_t small_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 33280;
  unint64_t v4 = a3 + 0x800000;
  uint64_t v7 = 0LL;
  unint64_t v8 = v3 & 0xFFFFFFFFFF800000LL | 0x28;
  do
  {
    int v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    uint64_t v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0) {
      break;
    }
    if (v9 < 0)
    {
      small_free_list_find_by_ptr(a1, v3, v9 & 0x7FFF);
      small_free_list_remove_ptr_no_clear(a1, a2, v11, v10);
    }

    else
    {
      uint64_t v7 = (v7 + 1);
    }

    v3 += v10 << 9;
  }

  while (v3 < v4);
  return v7;
}

void small_free_list_remove_ptr_no_clear(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a4 >= 0x20) {
    unsigned int v4 = 30;
  }
  else {
    unsigned int v4 = a4 - 1;
  }
  if (!a3) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, 0LL);
  }
  unint64_t v5 = a3 & 0xFFFFFFFFFF800000LL;
  BOOL v7 = (a3 & 0xFFFFFFFFFF800000LL | 0x7FA6) > a3 || (a3 & 0xFFFFFFFFFF800000LL | 0x81F8) <= a3;
  if (v7)
  {
    unint64_t v8 = *(void *)a3;
    uint64_t v9 = *(void *)(a1 + 632) ^ a1;
    uint64_t v10 = v9 ^ *(void *)a3;
    if (*(unsigned __int8 *)(a3 + 8) != (BYTE4(v10) {
                                                         + v10
    }
                                                         + ((HIDWORD(v10) + v10) >> 16)
                                                         + ((unsigned __int16)(WORD2(v10)
                                                                             + v10
    unint64_t v11 = *(void *)(a3 + 16);
    unint64_t v12 = v9 ^ v11;
    if (*(unsigned __int8 *)(a3 + 24) != (BYTE4(v12) {
                                                          + v12
    }
                                                          + ((HIDWORD(v12) + v12) >> 16)
                                                          + ((unsigned __int16)(WORD2(v12)
                                                                              + v12
    if (!v8)
    {
LABEL_36:
      *(void *)(a2 + 8LL * v4 + 32) = v11;
      if (v11)
      {
        unint64_t v21 = v11 & 0xFFFFFFFFFF800000LL;
        if (v11 < (v11 & 0xFFFFFFFFFF800000LL | 0x7FA6)) {
          goto LABEL_56;
        }
        unint64_t v22 = v11;
        if (v11 >= (v21 | 0x81F8))
        {
LABEL_41:
          if (v22)
          {
LABEL_56:
            BOOL v27 = v11 < v21 + 32678 || v11 >= v21 + 33272;
            char v28 = v27;
            if (!v27)
            {
              if ((*(_WORD *)(v11 + 16) & 0x8000) == 0
                || (unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9 == -(uint64_t)v21)
              {
                goto LABEL_84;
              }

              unint64_t v29 = *(void *)v11;
              if (!*(void *)v11) {
                goto LABEL_74;
              }
              goto LABEL_66;
            }

            unint64_t v29 = *(void *)v11;
            uint64_t v30 = *(void *)(a1 + 632) ^ a1 ^ *(void *)v11;
            if (*(unsigned __int8 *)(v11 + 8) == (BYTE4(v30)
                                                                  + v30
                                                                  + ((HIDWORD(v30) + v30) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v30)
                                                                                      + v30
                                                                                      + ((HIDWORD(v30) + v30) >> 16)) >> 8)))
            {
              if (!v29)
              {
LABEL_74:
                unint64_t v32 = 0LL;
LABEL_76:
                unint64_t v35 = a3;
                if (!v7)
                {
                  __int16 v36 = *(_WORD *)(a3 + 16);
                  unint64_t v37 = v5 + ((unint64_t)(v36 & 0x7FFF) << 9);
                  if (v36 < 0) {
                    unint64_t v35 = v37;
                  }
                  else {
                    unint64_t v35 = 0LL;
                  }
                }

                if (v32 != v35) {
                  small_free_list_remove_ptr_no_clear_cold_2(a1, a3, v29);
                }
                if ((v28 & 1) != 0)
                {
                  unint64_t v38 = *(void *)(a1 + 632) ^ a1 ^ v8;
                  *(_BYTE *)(v11 + 8) = BYTE4(v38)
                                      + v38
                }

                *(void *)unint64_t v11 = v8;
                goto LABEL_84;
              }

LABEL_92:
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }

          goto LABEL_44;
        }

        if ((*(_WORD *)(v11 + 16) & 0x8000) != 0)
        {
          unint64_t v22 = v21 + ((unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9);
          goto LABEL_41;
        }
      }

LABEL_44:
      *(_DWORD *)(a2 + 4LL * (v4 >> 5) + 2088) &= ~(1 << v4);
      if (!v11) {
        goto LABEL_84;
      }
      goto LABEL_55;
    }
  }

  else
  {
    unint64_t v8 = *(void *)a3;
    unint64_t v11 = *(void *)(a3 + 8);
    if (!*(void *)a3) {
      goto LABEL_36;
    }
  }

  BOOL v13 = v8 < (v8 & 0xFFFFFFFFFF800000LL | 0x7FA6) || v8 >= (v8 & 0xFFFFFFFFFF800000LL | 0x81F8);
  char v14 = v13;
  if (v13)
  {
    unint64_t v15 = *(void *)(v8 + 16);
    unint64_t v16 = *(void *)(a1 + 632) ^ a1 ^ v15;
    if (*(unsigned __int8 *)(v8 + 24) != (BYTE4(v16) {
                                                          + v16
    }
                                                          + ((HIDWORD(v16) + v16) >> 16)
                                                          + ((unsigned __int16)(WORD2(v16)
                                                                              + v16
    if (!v15)
    {
LABEL_35:
      unint64_t v18 = 0LL;
      goto LABEL_47;
    }
  }

  else
  {
    if ((*(_WORD *)(v8 + 16) & 0x8000) == 0
      || (unint64_t)(*(_WORD *)(v8 + 16) & 0x7FFF) << 9 == -(uint64_t)(v8 & 0xFFFFFFFFFF800000LL))
    {
      goto LABEL_36;
    }

    unint64_t v15 = *(void *)(v8 + 8);
    if (!v15) {
      goto LABEL_35;
    }
  }

  unint64_t v17 = v15 & 0xFFFFFFFFFF800000LL;
  if (v15 < (v15 & 0xFFFFFFFFFF800000LL | 0x7FA6))
  {
    unint64_t v18 = v15;
  }

  else
  {
    unint64_t v18 = v15;
    if (v15 < (v17 | 0x81F8))
    {
      __int16 v19 = *(_WORD *)(v15 + 16);
      int v20 = v19;
      unint64_t v18 = v17 + ((unint64_t)(v19 & 0x7FFF) << 9);
      if (v20 >= 0) {
        unint64_t v18 = 0LL;
      }
    }
  }

LABEL_47:
  unint64_t v23 = a3;
  if (!v7)
  {
    __int16 v24 = *(_WORD *)(a3 + 16);
    int v25 = v24;
    unint64_t v23 = v5 + ((unint64_t)(v24 & 0x7FFF) << 9);
    if (v25 >= 0) {
      unint64_t v23 = 0LL;
    }
  }

  if (v18 != v23) {
    small_free_list_remove_ptr_no_clear_cold_3(a1, a3, v15);
  }
  if ((v14 & 1) == 0)
  {
    *(void *)(v8 + 8) = v11;
    if (!v11) {
      goto LABEL_84;
    }
    goto LABEL_55;
  }

  unint64_t v26 = *(void *)(a1 + 632) ^ a1 ^ v11;
  *(_BYTE *)(v8 + 24) = BYTE4(v26)
                      + v26
  *(void *)(v8 + 16) = v11;
  if (v11)
  {
LABEL_55:
    unint64_t v21 = v11 & 0xFFFFFFFFFF800000LL;
    goto LABEL_56;
  }

LABEL_84:
  if (!v7)
  {
    *(void *)a3 = -1LL;
    *(void *)(a3 + 8) = -1LL;
    *(_WORD *)(a3 + 16) = 0;
  }

    v8 += v39;
LABEL_22:
    unint64_t v32 = a1;
    if (*((_DWORD *)v16 + 109) && (v31 & 2) == 0 && (*(_DWORD *)(a1 + 620) & 0x20) != 0) {
      _platform_memset();
    }
    tiny_free_list_add_ptr(a1, a2, v18, v8);
    goto LABEL_27;
  }

  uint64_t v54 = __ROR8__(*(void *)(v12 + 8), 60);
  uint64_t v55 = (void *)(v54 & 0xFFFFFFFFFFFFFFF0LL);
  v56 = *(void *)(a1 + 632);
  uint64_t v57 = v54 & 0xFFFFFFFFFFFFFFF0LL ^ v56;
  if (((v54 ^ (HIDWORD(v57)
                            + (_DWORD)v57
                            + ((HIDWORD(v57) + v57) >> 16)
                            + ((HIDWORD(v57) + (_DWORD)v57 + ((HIDWORD(v57) + v57) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    uint64_t v72 = a1;
LABEL_101:
    free_list_checksum_botch(v72);
    __break(1u);
LABEL_102:
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
    return;
  }

  uint64_t v58 = __ROR8__(*(void *)v12, 60);
  uint64_t v59 = v58 & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v60 = v58 & 0xFFFFFFFFFFFFFFF0LL ^ v56;
  if (((v58 ^ (HIDWORD(v60)
                            + (_DWORD)v60
                            + ((HIDWORD(v60) + v60) >> 16)
                            + ((HIDWORD(v60) + (_DWORD)v60 + ((HIDWORD(v60) + v60) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    uint64_t v72 = a1;
    goto LABEL_101;
  }

  if (v59)
  {
    uint64_t v61 = v56 ^ v18;
    *((void *)&v62 + 1) = HIDWORD(v61)
                          + (_DWORD)v61
    *(void *)&uint64_t v62 = v18;
    *(void *)(v59 + 8) = v62 >> 4;
  }

  else
  {
    *(void *)(a2 + 536) = v18;
  }

  if (v55)
  {
    uint64_t v63 = *(void *)(a1 + 632) ^ v18;
    *((void *)&v64 + 1) = HIDWORD(v63)
                          + (_DWORD)v63
    *(void *)&uint64_t v64 = v18;
    *uint64_t v55 = v64 >> 4;
  }

  v8 += v38;
  *(void *)unint64_t v18 = *(void *)v12;
  *(void *)(v18 + 8) = *(void *)(v12 + 8);
  *unint64_t v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
  if (!*((_DWORD *)v16 + 109))
  {
    *(_WORD *)(v12 + 16) = 0;
    *(void *)unint64_t v12 = 0LL;
    *(void *)(v12 + 8) = 0LL;
    *(_WORD *)(v12 + 16 * v38 - 2) = 0;
  }

  uint64_t v65 = (v18 & 0xFFFFF) - 16512;
  uint64_t v66 = v18 & 0xFFFFFFFFFFF00000LL | (v65 >> 6) & 0x3FF8;
  unsigned int v67 = 1 << (v65 >> 4);
  unsigned int v68 = *(_DWORD *)(v66 + 0x28) | v67;
  uint64_t v69 = *(_DWORD *)(v66 + 0x2C) & ~v67;
  *(_DWORD *)(v66 + 40) = v68;
  *(_DWORD *)(v66 + 44) = v69;
  unint64_t v31 = a7;
  if (v8 >= 2u)
  {
    *(_WORD *)(v18 + 16LL * v8 - 2) = v8;
    unint64_t v32 = a1;
LABEL_94:
    *(_WORD *)(v18 + 16) = v8;
    goto LABEL_95;
  }

  unint64_t v32 = a1;
  if (!v8) {
    goto LABEL_94;
  }
LABEL_95:
  uint64_t v70 = v27 >> 4;
  uint64_t v71 = (v65 >> 4) + 1;
LABEL_27:
  *(void *)(a2 + 2152) -= v11;
  __int16 v33 = *(_DWORD *)(a4 + 16) - v11;
  *(_DWORD *)(a4 + 16) = v33;
  if ((v31 & 1) == 0)
  {
    --*(_DWORD *)(a4 + 20);
    --*(_DWORD *)(a2 + 2168);
  }

  if (aggressive_madvise_enabled)
  {
    tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
    __int16 v33 = *(_DWORD *)(a4 + 16);
  }

  if (a3 == -1)
  {
    if (aggressive_madvise_enabled)
    {
      if (v33) {
        return;
      }
    }

    else
    {
      tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
      if (v33) {
        return;
      }
    }

    if (*(int *)(a4 + 28) <= 0)
    {
      uint64_t v43 = tiny_free_try_depot_unmap_no_lock(v32, a2, a4);
      unint64_t v44 = (os_unfair_lock_s *)a2;
LABEL_70:
      os_unfair_lock_unlock(v44);
      if (v43)
      {
        uint64_t v52 = *(_DWORD *)(v32 + 620);
        if ((v52 & 4) != 0) {
          uint64_t v53 = -2;
        }
        else {
          uint64_t v53 = -4;
        }
        mvm_deallocate_pages(v43, 0x100000LL, v53 & v52);
      }
    }
  }

  else
  {
    if (v33 <= 0xBCF9F) {
      *(_BYTE *)(a4 + 32) = 1;
    }
    int v34 = *(void *)(a2 + 2160);
    unint64_t v35 = *(void *)(a2 + 2152);
    if (v34 - v35 >= 0x179F41 && v35 < v34 - (v34 >> 2))
    {
      __int16 v36 = *(void *)(a2 + 2184);
      if (v36)
      {
        unint64_t v37 = (int64x2_t *)(a2 + 2152);
        while (!*(_BYTE *)(v36 + 32) || *(_DWORD *)(v36 + 28))
        {
          __int16 v36 = *(void *)v36;
          if (!v36) {
            return;
          }
        }

        if (*(void *)(a2 + 2144) == (v36 & 0xFFFFFFFFFFF00000LL)
          && (*(void *)(a2 + 2128) || *(void *)(a2 + 2136)))
        {
          tiny_finalize_region(v32, a2);
        }

        int v41 = *(void *)v36;
        char v42 = *(uint64_t **)(v36 + 8);
        if (*(void *)v36)
        {
          *(void *)(v41 + 8) = v42;
          char v42 = *(uint64_t **)(v36 + 8);
        }

        else
        {
          *(void *)(a2 + 2176) = v42;
        }

        if (!v42) {
          char v42 = (uint64_t *)(a2 + 2184);
        }
        *char v42 = v41;
        *(void *)__int16 v36 = 0LL;
        *(void *)(v36 + 8) = 0LL;
        --*(_DWORD *)(a2 + 2172);
        unint64_t v45 = tiny_free_detach_region(v32, a2, v36 & 0xFFFFFFFFFFF00000LL);
        int v46 = *(void *)(v32 + 624);
        os_unfair_lock_lock_with_options();
        *(_DWORD *)((v36 & 0xFFFFFFFFFFF00000LL) + 0x18) = -1;
        *(_DWORD *)(v36 + 28) = 0;
        v47 = tiny_free_reattach_region(v32, v46 - 2560, v36 & 0xFFFFFFFFFFF00000LL);
        uint64_t v48 = vdupq_n_s64(0xFFFFFFFFFFF04080LL);
        unint64_t v49 = vaddq_s64(*v37, v48);
        v48.i64[0] = v47;
        v48.i64[0] = vsubq_s64(*v37, v48).u64[0];
        v48.i64[1] = v49.i64[1];
        *unint64_t v37 = v48;
        *(_DWORD *)(a2 + 2168) -= v45;
        os_unfair_lock_unlock((os_unfair_lock_t)a2);
        int v50 = vdupq_n_s64(0xFBF80uLL);
        v50.i64[0] = v47;
        *(int64x2_t *)(v46 - 408) = vaddq_s64(*(int64x2_t *)(v46 - 408), v50);
        *(_DWORD *)(v46 - 392) += v45;
        uint64_t v51 = *(void *)(v46 - 376);
        if (v51) {
          *(void *)(v51 + 8) = v36;
        }
        else {
          *(void *)(v46 - 384) = v36;
        }
        *(void *)__int16 v36 = v51;
        *(void *)(v46 - 376) = v36;
        *(void *)(v36 + 8) = 0LL;
        *(_BYTE *)(v36 + 32) = 0;
        ++*(_DWORD *)(v46 - 388);
        if (!aggressive_madvise_enabled) {
          tiny_free_scan_madvise_free(v32, (os_unfair_lock_s *)(v46 - 2560), v36 & 0xFFFFFFFFFFF00000LL);
        }
        uint64_t v43 = tiny_free_try_depot_unmap_no_lock(v32, v46 - 2560, v36);
        unint64_t v44 = (os_unfair_lock_s *)(v46 - 2560);
        goto LABEL_70;
      }
    }
  }

uint64_t small_free_reattach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 33280;
  unint64_t v4 = a3 + 0x800000;
  uint64_t v7 = 0LL;
  unint64_t v8 = v3 & 0xFFFFFFFFFF800000LL | 0x28;
  do
  {
    int v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    uint64_t v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0) {
      break;
    }
    if (v9 < 0)
    {
      small_free_list_add_ptr(a1, a2, v3, v9 & 0x7FFF);
      unint64_t v11 = (unint64_t)v10 << 9;
    }

    else
    {
      unint64_t v11 = (unint64_t)(v9 & 0x7FFF) << 9;
      v7 += v10 << 9;
    }

    v3 += v11;
  }

  while (v3 < v4);
  return v7;
}

unint64_t small_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  v34[1] = *MEMORY[0x1895FEE08];
  __int16 v6 = (_DWORD *)MEMORY[0x189600120];
  unint64_t result = MEMORY[0x1895FE128]();
  unint64_t v12 = (char *)v34 - v11;
  if (v8 < v10)
  {
    LODWORD(v13) = 0;
    uint64_t v14 = *MEMORY[0x189600118];
    uint64_t v15 = ~*MEMORY[0x189600118];
    unint64_t v16 = v8;
    while (1)
    {
      if (v17 == 0x8000 && v16 == v8) {
        break;
      }
      uint64_t v19 = v17 & 0x7FFF;
      if ((v17 & 0x7FFF) != 0)
      {
        if ((v17 & 0x8000) != 0)
        {
          unint64_t v21 = (v16 + v14 + 10) & v15;
          uint64_t v22 = v19;
          unint64_t v20 = (unint64_t)v19 << 9;
          unint64_t v23 = (v16 + (v22 << 9) - 2) & v15;
          BOOL v24 = v23 > v21;
          unint64_t result = v23 - v21;
          if (v24)
          {
            int v25 = &v12[4 * (int)v13];
            *(_WORD *)int v25 = (v21 - a3) >> v9;
            *((_WORD *)v25 + 1) = result >> v9;
            LODWORD(v13) = v13 + 1;
          }
        }

        else
        {
          unint64_t v20 = v19 << 9;
        }

        v16 += v20;
        if (v16 < v10) {
          continue;
        }
      }

      goto LABEL_18;
    }

    unint64_t v26 = (v8 + v14 + 10) & v15;
    unint64_t v27 = (v8 + 8388606) & v15;
    BOOL v24 = v27 > v26;
    unint64_t v28 = v27 - v26;
    if (v24)
    {
      unint64_t v29 = (v26 - v8) >> v9;
      uint64_t v30 = &v12[4 * (int)v13];
      *(_WORD *)uint64_t v30 = v29;
      *((_WORD *)v30 + 1) = v28 >> v9;
      LODWORD(v13) = v13 + 1;
    }

LABEL_18:
    if ((int)v13 >= 1)
    {
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      uint64_t v13 = v13;
      unint64_t v31 = (unsigned __int16 *)(v12 + 2);
      do
      {
        uint64_t v32 = a3 + (*(v31 - 1) << *v6);
        int v33 = *v31;
        v31 += 2;
        mvm_madvise_free(a1, a3, v32, v32 + (v33 << *v6), 0LL, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }

      while (v13);
      os_unfair_lock_lock_with_options();
      return OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
    }
  }

  return result;
}

    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
  }

  return v5;
}

  if (v12 >= a4 + 0x100000
    || (unint64_t v26 = v12 & 0xFFFFFFFFFFF00000LL | 0x4080,
        unint64_t v27 = v12 - v26,
        unint64_t v28 = ((v12 - v26) >> 8) & 0xFFE,
        unint64_t v29 = (int8x8_t *)((v12 & 0xFFFFFFFFFFF00000LL | (8 * ((v28 >> 1) & 0x7FF))) + 40),
        uint64_t v30 = 1 << ((v12 - v26) >> 4),
        (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000LL | (8 * ((v28 >> 1) & 0x7FF))) + 0x28) & v30) == 0)
    || (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000LL) + 4 * v28 + 0x2C) & v30) != 0)
  {
    unint64_t v31 = a7;
    goto LABEL_22;
  }

  if (v12 + 16 >= v26 + 1032064
    || ((*(_DWORD *)(((v12 + 16) & 0xFFFFFFFFFFF00000LL | ((((v12 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v12 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    LODWORD(v38) = 1;
    goto LABEL_51;
  }

  unint64_t v38 = *(unsigned __int16 *)(v12 + 16);
  if (v38 < 0x40)
  {
LABEL_51:
    tiny_free_list_remove_ptr(a1, a2, v12, v38);
    uint32_t v39 = v38;
    *unint64_t v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
    unint64_t v16 = &read_memory[993];
    unint64_t v31 = a7;
    if (!malloc_zero_policy)
    {
      *(void *)unint64_t v12 = 0LL;
      *(void *)(v12 + 8) = 0LL;
      if (v39 >= 2)
      {
        *(_WORD *)(v12 + 16) = 0;
        unsigned int v40 = (_WORD *)(v12 + 16LL * (v39 & 0xFFF) - 2);
LABEL_83:
        *unsigned int v40 = 0;
        goto LABEL_84;
      }

      if (!v39)
      {
        unsigned int v40 = (_WORD *)(v12 + 16);
        goto LABEL_83;
      }
    }

unint64_t small_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a4 + 511;
  unint64_t v8 = a1 + 17280;
  mach_vm_address_t should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a4 + 511) >> 9), 0);
  unint64_t v10 = should_clear;
  if (should_clear)
  {
    unint64_t v28 = v8;
    if (((a2 - 1) & should_clear) != 0) {
      mach_vm_address_t v11 = a2 - ((a2 - 1) & should_clear);
    }
    else {
      mach_vm_address_t v11 = 0LL;
    }
    int v12 = a3 + 511;
    unint64_t v13 = (v11 + 511) >> 9;
    unint64_t v29 = (unint64_t)(a3 + 511) >> 9;
    unsigned __int16 v14 = (v7 >> 9) - v29 - v13;
    if ((_WORD)v13)
    {
      unint64_t v27 = v11 + should_clear;
      uint64_t v15 = *(void *)(a1 + 17904);
      int v16 = *(_DWORD *)((should_clear & 0xFFFFFFFFFF800000LL) + 0x18);
      int v17 = (os_unfair_lock_s *)(v15 + 2560LL * v16);
      os_unfair_lock_lock_with_options();
      int v18 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
      if (v18 != v16)
      {
        do
        {
          os_unfair_lock_unlock(v17);
          int v17 = (os_unfair_lock_s *)(v15 + 2560LL * v18);
          os_unfair_lock_lock_with_options();
          BOOL v19 = v18 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
          int v18 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
        }

        while (!v19);
      }

      *(_WORD *)((v10 & 0xFFFFFFFFFF800000LL)
      ++v17[542]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v17);
      unint64_t v20 = v28;
      free_small(v28, v10, v10 & 0xFFFFFFFFFF800000LL, (unsigned __int16)v13 << 9);
      unint64_t v10 = v27;
      int v12 = a3 + 511;
    }

    else
    {
      unint64_t v20 = v28;
    }

    if (v14)
    {
      unint64_t v21 = (v12 & 0x1FFFE00) + v10;
      uint64_t v22 = *(void *)(a1 + 17904);
      int v23 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
      BOOL v24 = (os_unfair_lock_s *)(v22 + 2560LL * v23);
      os_unfair_lock_lock_with_options();
      int v25 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
      if (v25 != v23)
      {
        do
        {
          os_unfair_lock_unlock(v24);
          BOOL v24 = (os_unfair_lock_s *)(v22 + 2560LL * v25);
          os_unfair_lock_lock_with_options();
          BOOL v19 = v25 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
          int v25 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000LL) + 0x18);
        }

        while (!v19);
      }

      *(_WORD *)((v10 & 0xFFFFFFFFFF800000LL)
      ++v24[542]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v24);
      free_small(v20, v21, v21 & 0xFFFFFFFFFF800000LL, v14 << 9);
    }
  }

  return v10;
}

mach_vm_address_t small_malloc_should_clear(unint64_t a1, unsigned int a2, int a3)
{
  signed int v6 = rack_get_thread_index() % *(_DWORD *)(a1 + 608);
  uint64_t v7 = *(void *)(a1 + 624);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v8 = v7 + 2560LL * v6;
  mach_vm_address_t v11 = *(void *)(v8 + 8);
  uint64_t v9 = v8 + 8;
  mach_vm_address_t v10 = v11;
  if (*(unsigned __int16 *)(v9 + 8) == a2)
  {
    *(void *)uint64_t v9 = 0LL;
    *(_WORD *)(v9 + 8) = 0;
    *(void *)(v7 + 2560LL * v6 + 24) = 0LL;
    goto LABEL_6;
  }

  small_malloc_from_free_list(a1, v7 + 2560LL * v6, a2);
  mach_vm_address_t v10 = v12;
  if (v12)
  {
LABEL_6:
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    if (a3) {
      _platform_memset();
    }
    return v10;
  }

  uint64_t v14 = v7 + 2560LL * v6;
  uint64_t v62 = (_DWORD *)(v14 + 2168);
  uint64_t v63 = (int64x2_t *)(v14 + 2152);
  uint64_t v61 = (unint64_t *)(v14 + 2176);
  uint64_t v64 = (unint64_t *)(v14 + 2184);
  uint64_t v65 = (_DWORD *)(v14 + 2172);
  os_unfair_lock_t lock = (os_unfair_lock_t)(v14 + 4);
  int64x2_t v59 = vdupq_n_s64(0x7F7E00uLL);
  int64x2_t v60 = vdupq_n_s64(0xFFFFFFFFFF808200LL);
  while (2)
  {
    uint64_t v15 = *(void *)(a1 + 624);
    int v16 = (os_unfair_lock_s *)(v15 - 2560);
    os_unfair_lock_lock_with_options();
    uint64_t v17 = v15 - 2528;
    int v18 = (unint64_t *)(v15 - 2288);
    unsigned __int16 v19 = a2;
    while (1)
    {
      if ((v19 & 0xFFE0) != 0) {
        unsigned int v20 = 30;
      }
      else {
        unsigned int v20 = v19 - 1;
      }
      unint64_t v21 = *(void *)(v17 + 8LL * v20);
      if (!v21
        || ((unint64_t v22 = v21 & 0xFFFFFFFFFF800000LL, (v21 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v21)
          ? (BOOL v23 = (v21 & 0xFFFFFFFFFF800000LL | 0x81F8) > v21)
          : (BOOL v23 = 0),
            v23
         && ((__int16 v24 = *(_WORD *)(v21 + 16), (v24 & 0x8000) == 0)
          || (unint64_t v21 = v22 + ((unint64_t)(v24 & 0x7FFF) << 9)) == 0)))
      {
        int v25 = v20 >> 5;
        int v26 = -1 << v20;
        while (1)
        {
          int v27 = v25;
          if (v25) {
            break;
          }
          int v25 = 1;
          unsigned int v28 = *(_DWORD *)(v15 - 472) & v26;
          int v26 = -1;
          if (v28) {
            goto LABEL_28;
          }
        }

        if (v25 == 1) {
          goto LABEL_48;
        }
        unsigned int v28 = 0;
LABEL_28:
        if ((unint64_t v29 = (unint64_t *)(v17 + 8LL * (__clz(__rbit32(v28)) + 32 * v27)), v29 >= v18)
          || (unint64_t v21 = *v29) == 0
          || ((unint64_t v30 = v21 & 0xFFFFFFFFFF800000LL, (v21 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v21)
            ? (BOOL v31 = (v21 & 0xFFFFFFFFFF800000LL | 0x81F8) > v21)
            : (BOOL v31 = 0),
              v31
           && ((__int16 v32 = *(_WORD *)(v21 + 16), (v32 & 0x8000) == 0)
            || (unint64_t v21 = v30 + ((unint64_t)(v32 & 0x7FFF) << 9)) == 0)))
        {
          unint64_t v21 = *v18;
          if (!*v18) {
            goto LABEL_48;
          }
          unint64_t v33 = v21 & 0xFFFFFFFFFF800000LL;
          if ((v21 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v21 && (v21 & 0xFFFFFFFFFF800000LL | 0x81F8) > v21)
          {
            __int16 v35 = *(_WORD *)(v21 + 16);
            if ((v35 & 0x8000) == 0) {
              goto LABEL_48;
            }
            unint64_t v21 = v33 + ((unint64_t)(v35 & 0x7FFF) << 9);
            if (!v21) {
              goto LABEL_48;
            }
          }
        }
      }

      unint64_t v36 = v21 & 0xFFFFFFFFFF800000LL;
      if ((v21 & 0xFFFFFFFFFF800000LL) == 0)
      {
LABEL_48:
        os_unfair_lock_unlock((os_unfair_lock_t)(v15 - 2560));
        unint64_t v37 = lock;
        goto LABEL_49;
      }

      if (!*(_DWORD *)((v21 & 0xFFFFFFFFFF800000LL) + 0x1C)) {
        break;
      }
      if (++v19 > 0x1Eu) {
        goto LABEL_48;
      }
    }

    uint64_t v40 = *(void *)v36;
    int v41 = *(void **)((v21 & 0xFFFFFFFFFF800000LL) + 8);
    if (*(void *)v36)
    {
      *(void *)(v40 + 8) = v41;
      int v41 = *(void **)((v21 & 0xFFFFFFFFFF800000LL) + 8);
    }

    else
    {
      *(void *)(v15 - 384) = v41;
    }

    if (!v41) {
      int v41 = (void *)(v15 - 376);
    }
    void *v41 = v40;
    *(void *)unint64_t v36 = 0LL;
    *(void *)((v21 & 0xFFFFFFFFFF800000LL) + 8) = 0LL;
    --*(_DWORD *)(v15 - 388);
    uint64_t v42 = small_free_detach_region(a1, v15 - 2560, v36);
    int v58 = v42;
    *(_DWORD *)(v36 + 24) = v6;
    if (*(_DWORD *)(v36 + 28)) {
      purgeable_ptr_in_use_enumerator_cold_1(v42, v43, v44);
    }
    uint64_t v45 = small_free_reattach_region(a1, v7 + 2560LL * v6, v36);
    int64x2_t v46 = *(int64x2_t *)(v15 - 408);
    v47.i64[1] = v60.i64[1];
    v47.i64[0] = v45;
    v47.i64[0] = vsubq_s64(v46, v47).u64[0];
    v47.i64[1] = vaddq_s64(v46, v60).i64[1];
    *(int64x2_t *)(v15 - 408) = v47;
    *(_DWORD *)(v15 - 392) -= v58;
    v47.i64[1] = v59.i64[1];
    v47.i64[0] = v45;
    *uint64_t v63 = vaddq_s64(*v63, v47);
    *v62 += v58;
    unint64_t v48 = *v64;
    if (*v64) {
      *(void *)(v48 + 8) = v36;
    }
    else {
      *uint64_t v61 = v36;
    }
    *(void *)unint64_t v36 = v48;
    *uint64_t v64 = v36;
    *(void *)(v36 + 8) = 0LL;
    *(_BYTE *)(v36 + 32) = 0;
    unint64_t v37 = lock;
    ++*v65;
    os_unfair_lock_unlock(v16);
    small_malloc_from_free_list(a1, v7 + 2560LL * v6, a2);
    if (v49)
    {
      mach_vm_address_t v10 = v49;
      goto LABEL_6;
    }

LABEL_49:
    BOOL v38 = os_unfair_lock_trylock(v37);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    if (!v38)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_unlock(v37);
      os_unfair_lock_lock_with_options();
      small_malloc_from_free_list(a1, v7 + 2560LL * v6, a2);
      mach_vm_address_t v10 = v39;
      if (!v39) {
        continue;
      }
      goto LABEL_6;
    }

    break;
  }

  unsigned int v50 = *(_DWORD *)(a1 + 620);
  if ((v50 & 4) != 0) {
    int v51 = -2;
  }
  else {
    int v51 = -4;
  }
  mach_vm_address_t pages = mvm_allocate_pages(0x800000uLL, 23, v51 & v50, 2);
  os_unfair_lock_lock_with_options();
  if (pages)
  {
    *(_DWORD *)(pages + 33276) = *(unsigned __int16 *)((char *)&malloc_entropy + 1);
    uint64_t v53 = (void *)(v7 + 2560LL * v6 + 2128);
    if (*v53 || *(void *)(v7 + 2560LL * v6 + 2136)) {
      small_finalize_region(a1, v7 + 2560LL * v6);
    }
    *(_DWORD *)(pages + 24) = v6;
    rack_region_insert(a1, pages);
    uint64_t v54 = v7 + 2560LL * v6;
    *(void *)(v54 + 2144) = pages;
    *(_DWORD *)(pages + 16) = a2 << 9;
    mach_vm_address_t v10 = pages + 33280;
    unint64_t v55 = (pages + 33280) & 0xFFFFFFFFFF800000LL;
    *(_WORD *)(v55 + 40) = a2;
    ++*v62;
    int64x2_t v56 = vdupq_n_s64(0x7F7E00uLL);
    v56.i64[0] = a2 << 9;
    *uint64_t v63 = vaddq_s64(*v63, v56);
    *(_WORD *)((v55 | 0x28) + 2LL * a2) = 16319 - a2;
    *uint64_t v53 = (16319 - a2) << 9;
    *(void *)(v54 + 2136) = 0LL;
    unint64_t v57 = *v64;
    if (*v64) {
      *(void *)(v57 + 8) = pages;
    }
    else {
      *uint64_t v61 = pages;
    }
    *(void *)mach_vm_address_t pages = v57;
    *uint64_t v64 = pages;
    *(void *)(pages + 8) = 0LL;
    *(_BYTE *)(pages + 32) = 0;
    ++*v65;
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    os_unfair_lock_unlock(v37);
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    os_unfair_lock_unlock(v37);
    return 0LL;
  }

  return v10;
}

void free_small(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
  uint64_t v8 = *(void *)(a1 + 624);
  if (a4)
  {
    unint64_t v9 = (unint64_t)(a4 + 511) >> 9;
  }

  else
  {
    LODWORD(v9) = *(__int16 *)((a2 & 0xFFFFFFFFFF800000LL)
    if ((v9 & 0x80000000) != 0)
    {
LABEL_28:
      free_small_botch(a1);
      return;
    }
  }

  uint64_t v10 = v8 + 2560LL * v7;
  os_unfair_lock_lock_with_options();
  if (v7 == -1)
  {
    unint64_t v13 = a2;
    goto LABEL_12;
  }

  uint64_t v11 = v8 + 2560LL * v7;
  unint64_t v14 = *(void *)(v11 + 8);
  uint64_t v12 = v11 + 8;
  unint64_t v13 = v14;
  if (v14 == a2)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    goto LABEL_28;
  }

  __int16 v15 = *(_WORD *)(v12 + 8);
  uint64_t v16 = *(void *)(v12 + 16);
  if ((_WORD)v9 && (*(_DWORD *)(a1 + 620) & 0x20) != 0)
  {
    __int16 v50 = *(_WORD *)(v12 + 8);
    uint64_t v49 = *(void *)(v12 + 16);
    _platform_memset();
    uint64_t v16 = v49;
    __int16 v15 = v50;
  }

  *(void *)uint64_t v12 = a2;
  *(_WORD *)(v12 + 8) = v9;
  *(void *)(v12 + 16) = a3;
  if (!v13) {
    goto LABEL_48;
  }
  LOWORD(v9) = v15;
  a3 = v16;
LABEL_12:
  for (int i = *(_DWORD *)(a3 + 24); v7 != i; int i = *(_DWORD *)(a3 + 24))
  {
    int v7 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    uint64_t v10 = *(void *)(a1 + 624) + 2560LL * v7;
    os_unfair_lock_lock_with_options();
  }

  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  uint64_t v51 = (unsigned __int16)v9 << 9;
  if (*(_DWORD *)(a3 + 33276) != *(unsigned __int16 *)((char *)&malloc_entropy + 1))
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
    return;
  }

  unint64_t v18 = v13 & 0xFFFFFFFFFF800000LL | 0x28;
  unsigned int v19 = ((v13 + 8355328) >> 9) & 0x3FFF;
  unsigned __int16 v20 = v9;
  unint64_t v21 = v13;
  if (v19)
  {
    int v22 = *(__int16 *)(v18 + 2LL * (v19 - 1));
    unsigned __int16 v20 = v9;
    unint64_t v21 = v13;
    if (v22 < 0)
    {
      uint64_t v23 = *(_WORD *)(v18 + 2LL * (v19 - 1)) & 0x7FFF;
      unint64_t v21 = v13 - (v23 << 9);
      small_free_list_find_by_ptr(a1, v21, v23);
      small_free_list_remove_ptr(a1, v10, v24, v23);
      *(_WORD *)(v18 + 2LL * v19) = 0;
      unsigned __int16 v20 = v23 + v9;
    }
  }

  if (v13 + v51 < a3 + 0x800000)
  {
    int v25 = *(__int16 *)(v18 + 2LL * (unsigned __int16)(v9 + v19));
    if (v25 < 0)
    {
      unsigned __int16 v26 = v20;
      unsigned int v27 = v25 & 0x7FFF;
      small_free_list_find_by_ptr(a1, v13 + v51, v27);
      small_free_list_remove_ptr(a1, v10, v28, v27);
      unsigned __int16 v20 = v27 + v26;
    }
  }

  int v29 = *(_DWORD *)(a1 + 620);
  if ((v29 & 0x20) != 0)
  {
    if (v20) {
      _platform_memset();
    }
    else {
      malloc_zone_error(v29, 1, (uint64_t)"incorrect size information for %p - block header was damaged\n");
    }
  }

  unint64_t v30 = small_free_list_add_ptr(a1, v10, v21, v20);
  *(void *)(v10 + 2152) -= v51;
  unsigned int v31 = *(_DWORD *)(a3 + 16) - v51;
  *(_DWORD *)(a3 + 16) = v31;
  if (aggressive_madvise_enabled)
  {
    small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v10, a3, v30, v20, v13, v51);
    unsigned int v31 = *(_DWORD *)(a3 + 16);
  }

  if (v7 != -1)
  {
    if (v31 <= 0x5F9E7F) {
      *(_BYTE *)(a3 + 32) = 1;
    }
    unint64_t v32 = *(void *)(v10 + 2160);
    unint64_t v33 = *(void *)(v10 + 2152);
    if (v32 - v33 >= 0xBF3D01 && v33 < v32 - (v32 >> 2))
    {
      uint64_t v34 = *(void *)(v10 + 2176);
      if (v34)
      {
        __int16 v35 = (int64x2_t *)(v10 + 2152);
        while (!*(_BYTE *)(v34 + 32) || *(_DWORD *)(v34 + 28))
        {
          uint64_t v34 = *(void *)(v34 + 8);
          if (!v34) {
            goto LABEL_48;
          }
        }

        if (*(void *)(v10 + 2144) == (v34 & 0xFFFFFFFFFF800000LL)
          && (*(void *)(v10 + 2128) || *(void *)(v10 + 2136)))
        {
          small_finalize_region(a1, v10);
        }

        uint64_t v36 = *(void *)v34;
        unint64_t v37 = *(void **)(v34 + 8);
        if (*(void *)v34)
        {
          *(void *)(v36 + 8) = v37;
          unint64_t v37 = *(void **)(v34 + 8);
        }

        else
        {
          *(void *)(v10 + 2176) = v37;
        }

        if (!v37) {
          unint64_t v37 = (void *)(v10 + 2184);
        }
        *unint64_t v37 = v36;
        *(void *)uint64_t v34 = 0LL;
        *(void *)(v34 + 8) = 0LL;
        --*(_DWORD *)(v10 + 2172);
        int v40 = small_free_detach_region(a1, v10, v34 & 0xFFFFFFFFFF800000LL);
        uint64_t v41 = *(void *)(a1 + 624);
        os_unfair_lock_lock_with_options();
        *(_DWORD *)((v34 & 0xFFFFFFFFFF800000LL) + 0x18) = -1;
        *(_DWORD *)(v34 + 28) = 0;
        uint64_t v42 = small_free_reattach_region(a1, v41 - 2560, v34 & 0xFFFFFFFFFF800000LL);
        int64x2_t v43 = vdupq_n_s64(0xFFFFFFFFFF808200LL);
        int64x2_t v44 = vaddq_s64(*v35, v43);
        v43.i64[0] = v42;
        v43.i64[0] = vsubq_s64(*v35, v43).u64[0];
        v43.i64[1] = v44.i64[1];
        *__int16 v35 = v43;
        *(_DWORD *)(v10 + 2168) -= v40;
        os_unfair_lock_unlock((os_unfair_lock_t)v10);
        int64x2_t v45 = vdupq_n_s64(0x7F7E00uLL);
        v45.i64[0] = v42;
        *(int64x2_t *)(v41 - 408) = vaddq_s64(*(int64x2_t *)(v41 - 408), v45);
        *(_DWORD *)(v41 - 392) += v40;
        uint64_t v46 = *(void *)(v41 - 376);
        if (v46) {
          *(void *)(v46 + 8) = v34;
        }
        else {
          *(void *)(v41 - 384) = v34;
        }
        *(void *)uint64_t v34 = v46;
        *(void *)(v41 - 376) = v34;
        *(void *)(v34 + 8) = 0LL;
        *(_BYTE *)(v34 + 32) = 0;
        ++*(_DWORD *)(v41 - 388);
        if (!aggressive_madvise_enabled) {
          small_free_scan_madvise_free(a1, (os_unfair_lock_s *)(v41 - 2560), v34 & 0xFFFFFFFFFF800000LL);
        }
        unint64_t v38 = small_free_try_depot_unmap_no_lock(a1, v41 - 2560, v34);
        mach_vm_address_t v39 = (os_unfair_lock_s *)(v41 - 2560);
        goto LABEL_65;
      }
    }

LABEL_48:
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    return;
  }

  if (aggressive_madvise_enabled)
  {
    if (v31) {
      goto LABEL_48;
    }
  }

  else
  {
    small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v10, a3, v30, v20, v13, v51);
    if (v31) {
      goto LABEL_48;
    }
  }

  unint64_t v38 = small_free_try_depot_unmap_no_lock(a1, v10, a3);
  mach_vm_address_t v39 = (os_unfair_lock_s *)v10;
LABEL_65:
  os_unfair_lock_unlock(v39);
  if (v38)
  {
    unsigned int v47 = *(_DWORD *)(a1 + 620);
    if ((v47 & 4) != 0) {
      int v48 = -2;
    }
    else {
      int v48 = -4;
    }
    mvm_deallocate_pages(v38, 0x800000LL, v48 & v47);
  }

BOOL small_claimed_address(uint64_t a1, unint64_t a2)
{
  int v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFF800000LL;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55LL * ((a2 & 0xFFFFFFFFFF800000LL) >> 20)) >> -*((_BYTE *)v2 + 8);
    unint64_t v7 = v6;
    do
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        break;
      }
      if (v8 == v4) {
        goto LABEL_10;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0LL;
      }
      else {
        ++v7;
      }
    }

    while (v7 != v6);
  }

  unint64_t v4 = 0LL;
LABEL_10:
  if (v4) {
    BOOL v9 = v4 + 33280 > a2;
  }
  else {
    BOOL v9 = 1;
  }
  unint64_t v10 = v4 + 0x800000;
  return !v9 && v10 > a2;
}

uint64_t small_try_shrink_in_place(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 9;
  __int16 v6 = (a3 >> 9) - (a4 >> 9);
  if (v6)
  {
    unint64_t v7 = (a4 & 0x1FFFE00) + a2;
    uint64_t v8 = *(void *)(a1 + 624);
    int v9 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
    unint64_t v10 = (os_unfair_lock_s *)(v8 + 2560LL * v9);
    os_unfair_lock_lock_with_options();
    int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
    if (v11 != v9)
    {
      do
      {
        os_unfair_lock_unlock(v10);
        unint64_t v10 = (os_unfair_lock_s *)(v8 + 2560LL * v11);
        os_unfair_lock_lock_with_options();
        BOOL v12 = v11 == *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
        int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
      }

      while (!v12);
    }

    *(_WORD *)((a2 & 0xFFFFFFFFFF800000LL)
    ++v10[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v10);
    free_small(a1, v7, v7 & 0xFFFFFFFFFF800000LL, 0LL);
  }

  return a2;
}

uint64_t small_try_realloc_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = ((a2 + 8355328) >> 9) & 0x3FFF;
  unsigned int v6 = v5 + (unsigned __int16)(a3 >> 9);
  if (v6 > 0x3FBE) {
    return 0LL;
  }
  unint64_t v9 = a2 & 0xFFFFFFFFFF800000LL;
  uint64_t v10 = *(void *)(a1 + 624);
  int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
  uint64_t v12 = v10 + 2560LL * v11;
  os_unfair_lock_lock_with_options();
  for (int i = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18); v11 != i; int i = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18))
  {
    int v11 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    uint64_t v12 = v10 + 2560LL * v11;
    os_unfair_lock_lock_with_options();
  }

  if (v11 == -1)
  {
LABEL_14:
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    return 0LL;
  }

  uint64_t v14 = v9 | 0x28;
  unint64_t v15 = (unint64_t)(a4 + 511) >> 9;
  uint64_t v16 = a2 + a3;
  int v17 = (unsigned __int16)(a3 >> 9);
  int v18 = (unsigned __int16)v15 - v17;
  if (*(void *)(v12 + 8) == a2 + a3
    && (int v19 = *(unsigned __int16 *)(v12 + 16), v17 + v19 >= (unsigned __int16)v15))
  {
    if (v19 == (unsigned __int16)v18)
    {
      uint64_t v26 = 0LL;
      *(_WORD *)(v12 + 16) = 0;
      *(void *)(v12 + 24) = 0LL;
    }

    else
    {
      __int16 v30 = v19 - v18;
      *(_WORD *)(v12 + 16) = v30;
      uint64_t v26 = a2 + a4;
      *(_WORD *)(v14 + 2LL * (unsigned __int16)(v5 + v15)) = v30;
    }

    *(void *)(v12 + 8) = v26;
    *(_WORD *)(v14 + 2LL * v5) = v15;
    LOWORD(v15) = 0;
    unsigned int v5 = (unsigned __int16)v6;
  }

  else if (*(void *)(v12 + 2144) == v9 {
         && ((uint64_t v20 = *(void *)(v12 + 2128),
  }
              (unsigned __int16)(v15 - v17) < (unsigned __int16)(v20 >> 9))
           ? (BOOL v21 = v9 - v20 + 0x800000 == v16)
           : (BOOL v21 = 0),
             v21))
  {
    *(_WORD *)(v14 + 2LL * v5) = v15;
    *(_WORD *)(v14 + 2LL * (unsigned __int16)v6) = 0;
    unint64_t v27 = v20 - ((unsigned __int16)(v15 - v17) << 9);
    *(void *)(v12 + 2128) = v27;
    unsigned __int16 v28 = v5 + v15;
    unint64_t v15 = v27 >> 9;
    unsigned int v5 = v28;
  }

  else
  {
    int v22 = *(__int16 *)(v14 + 2LL * v6);
    if ((v22 & 0x80000000) == 0) {
      goto LABEL_14;
    }
    unsigned int v23 = v22 & 0x7FFF;
    unsigned int v24 = v17 + v23;
    __int16 v32 = v24;
    int v33 = v18;
    small_free_list_find_by_ptr(a1, v16, v22 & 0x7FFF);
    small_free_list_remove_ptr(a1, v12, v29, v23);
    *(_WORD *)(v14 + 2LL * (unsigned __int16)v6) = 0;
    if (v32 != (_WORD)v15) {
      small_free_list_add_ptr(a1, v12, a2 + ((unsigned __int16)v15 << 9), (unsigned __int16)(v32 - v15));
    }
    int v18 = v33;
  }

  *(_WORD *)(v14 + 2LL * v5) = v15;
  *(void *)(v12 + 2152) += (v18 << 9);
  unsigned int v31 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x10) + (v18 << 9);
  *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x10) = v31;
  if (v31 >= 0x5F9E80) {
    *(_BYTE *)((a2 & 0xFFFFFFFFFF800000LL) + 0x20) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v12);
  return 1LL;
}

void small_check_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2 + 0x800000;
  int v4 = *(_DWORD *)(((a2 + 33280) & 0xFFFFFFFFFF800000LL) + 0x18);
  uint64_t v5 = *(void *)(a1 + 624);
  unint64_t v6 = a2 + 33280;
  if (*(void *)(v5 + 2560LL * v4 + 2144) == a2)
  {
    uint64_t v7 = v5 + 2560LL * v4;
    unint64_t v6 = a2 + 33280 + *(void *)(v7 + 2136);
    v3 -= *(void *)(v7 + 2128);
  }

  if (v6 < v3)
  {
    unint64_t v8 = (a2 + 33280) & 0xFFFFFFFFFF800000LL | 0x28;
    do
    {
      unint64_t v9 = v6 & 0xFFFFFFFFFF800000LL;
      uint64_t v10 = *(unsigned __int16 *)(v8 + 2 * (((v6 - (v6 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF));
      if (*(__int16 *)(v8 + 2 * (((v6 - (v6 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)) < 0)
      {
        uint64_t v12 = v10 & 0x7FFF;
        if ((v10 & 0x7FFF) == 0)
        {
          uint64_t v34 = "%ld, counter=%d\n*** invariant broken for free block %p this msize=%d\n";
          goto LABEL_55;
        }

        unint64_t v13 = v6;
        if ((v6 & (*MEMORY[0x189600148] - 1LL)) == 0)
        {
          unint64_t v13 = v6;
          if ((unint64_t)(v10 & 0x7FFF) << 9 >= *MEMORY[0x189600128])
          {
            unint64_t v14 = v9 + 32678;
            unint64_t v15 = v9 + 32678;
            uint64_t v16 = 33LL;
            while ((*(_WORD *)(v15 + 16) & 0x8000) == 0
                 || v6 != (v14 & 0xFFFFFFFFFF800000LL) + ((unint64_t)(*(_WORD *)(v15 + 16) & 0x7FFF) << 9))
            {
              v15 += 18LL;
              v14 += 18LL;
              if (!--v16)
              {
                unint64_t v15 = 0LL;
                break;
              }
            }

            if (v15) {
              unint64_t v13 = v15;
            }
            else {
              unint64_t v13 = v6;
            }
          }
        }

        if (!v13) {
          purgeable_ptr_in_use_enumerator_cold_1(a1, 0LL, a3);
        }
        if ((v13 & 0xFFFFFFFFFF800000LL | 0x7FA6) > v13 || (v13 & 0xFFFFFFFFFF800000LL | 0x81F8) <= v13)
        {
          unint64_t v18 = *(void *)v13;
          uint64_t v19 = *(void *)(a1 + 632) ^ a1;
          uint64_t v20 = v19 ^ *(void *)v13;
          if (*(unsigned __int8 *)(v13 + 8) != (BYTE4(v20)
                                                                + v20
                                                                + ((HIDWORD(v20) + v20) >> 16)
                                                                + ((unsigned __int16)(WORD2(v20)
                                                                                    + v20
                                                                                    + ((HIDWORD(v20) + v20) >> 16)) >> 8))
            || (unint64_t v17 = *(void *)(v13 + 16),
                unint64_t v21 = v19 ^ v17,
                *(unsigned __int8 *)(v13 + 24) != (BYTE4(v21)
                                                                  + v21
                                                                  + ((HIDWORD(v21) + v21) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v21)
                                                                                      + v21
                                                                                      + ((HIDWORD(v21) + v21) >> 16)) >> 8))))
          {
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }
        }

        else
        {
          unint64_t v18 = *(void *)v13;
          unint64_t v17 = *(void *)(v13 + 8);
        }

        if (v18)
        {
          unint64_t v22 = v18 & 0xFFFFFFFFFF800000LL;
          BOOL v23 = v18 < (v18 & 0xFFFFFFFFFF800000LL | 0x7FA6) || v18 >= (v18 & 0xFFFFFFFFFF800000LL | 0x81F8);
          int v24 = v18;
          unint64_t v25 = v18 & 0xFFFFFFFFFF800000LL;
          if (!v23)
          {
            __int16 v26 = *(_WORD *)(v18 + 16);
            BOOL v27 = v26 < 0;
            unint64_t v25 = v26 < 0 ? v22 + ((unint64_t)(v26 & 0x4000) << 9) : 0LL;
            int v24 = v22 + ((v26 & 0x7FFF) << 9);
            if (!v27) {
              int v24 = 0;
            }
          }

          if ((*(__int16 *)(v25 + 2 * (((unint64_t)(v24 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            uint64_t v34 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }

        if (v17)
        {
          unint64_t v28 = v17 & 0xFFFFFFFFFF800000LL;
          BOOL v29 = v17 < (v17 & 0xFFFFFFFFFF800000LL | 0x7FA6) || v17 >= (v17 & 0xFFFFFFFFFF800000LL | 0x81F8);
          int v30 = v17;
          unint64_t v31 = v17 & 0xFFFFFFFFFF800000LL;
          if (!v29)
          {
            __int16 v32 = *(_WORD *)(v17 + 16);
            BOOL v33 = v32 < 0;
            if (v32 < 0) {
              unint64_t v31 = v28 + ((unint64_t)(v32 & 0x4000) << 9);
            }
            else {
              unint64_t v31 = 0LL;
            }
            int v30 = v28 + ((v32 & 0x7FFF) << 9);
            if (!v33) {
              int v30 = 0;
            }
          }

          if ((*(__int16 *)(v31 + 2 * (((unint64_t)(v30 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            uint64_t v34 = "%ld, counter=%d\n*** invariant broken for %p (next %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }

        unint64_t v11 = v6 + (v12 << 9);
        if ((*(_WORD *)(((v11 - 2) & 0xFFFFFFFFFF800000LL | (2
                                                            * ((((_DWORD)v11
                                                               - 2
                                                               - (((_DWORD)v11 - 2) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                       + 0x28) & 0x7FFF) != (_DWORD)v12)
        {
          uint64_t v34 = "%ld, counter=%d\n"
                "*** invariant broken for small free %p followed by %p in region [%p-%p] (end marker incorrect) should be"
                " %d; in fact %d\n";
          goto LABEL_55;
        }
      }

      else
      {
        if (!*(_WORD *)(v8 + 2 * (((v6 - (v6 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
        {
          uint64_t v34 = "%ld, counter=%d\n*** invariant broken: null msize ptr=%p num_small_regions=%d end=%p\n";
LABEL_55:
          malloc_zone_check_fail((uint64_t)"check: incorrect small region ", (uint64_t)v34);
          return;
        }

        unint64_t v11 = v6 + (v10 << 9);
      }

      unint64_t v6 = v11;
    }

    while (v11 < v3);
  }

unint64_t small_free_list_get_ptr(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result & 0xFFFFFFFFFF800000LL;
    if ((result & 0xFFFFFFFFFF800000LL | 0x7FA6) <= result && (v1 | 0x81F8) > result)
    {
      __int16 v2 = *(_WORD *)(result + 16);
      unint64_t v3 = v1 + ((unint64_t)(v2 & 0x7FFF) << 9);
      if (v2 < 0) {
        return v3;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t small_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  __int16 v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v41 = *MEMORY[0x1895FEE08];
  uint64_t v35 = 0LL;
  uint64_t result = v3(v0, *(void *)(v5 + 17304), 32LL, (uint64_t *)&v34);
  if (!(_DWORD)result)
  {
    uint64_t v33 = *v34;
    uint64_t result = v4(v11, v34[2], 8 * *v34, &v39);
    if (!(_DWORD)result)
    {
      if ((v8 & 1) == 0
        || (uint64_t result = v4(v11, *(void *)(v6 + 17904), 2560LL * *(int *)(v6 + 17888), &v35), !(_DWORD)result))
      {
        if (v33)
        {
          uint64_t v13 = 0LL;
          unint64_t v31 = v2;
          __int16 v32 = (unsigned int *)(v6 + 17888);
          uint64_t v30 = v10;
          while (1)
          {
            uint64_t v14 = *(void *)(v39 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                v38[0] = *(void *)(v39 + 8 * v13);
                v38[1] = 32678LL;
                ((void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))v2)(v11, v10, 4LL, v38, 1LL);
              }

              uint64_t v15 = v14 + 33280;
              if ((v8 & 6) != 0)
              {
                v37[0] = v14 + 33280;
                v37[1] = 8355328LL;
                ((void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))v2)(v11, v10, 2LL, v37, 1LL);
              }

              if ((v8 & 1) != 0)
              {
                uint64_t result = v4(v11, v14, 0x800000LL, &v36);
                if ((_DWORD)result) {
                  return result;
                }
                uint64_t v16 = *v32;
                if ((int)v16 < 1)
                {
                  int v17 = 0;
                }

                else
                {
                  int v17 = 0;
                  unint64_t v18 = (void *)(v35 + 24);
                  do
                  {
                    if (v14 == *v18) {
                      ++v17;
                    }
                    v18 += 320;
                    --v16;
                  }

                  while (v16);
                }

                int v19 = *(_DWORD *)(v36 + 24);
                if (v14 != *(void *)(v35 + 2560LL * v19 + 2144))
                {
                  LODWORD(v20) = 0;
                  unsigned int v21 = 16319;
LABEL_27:
                  int v23 = 0;
                  uint64_t v24 = v36 + 40;
                  do
                  {
                    uint64_t v25 = *(_WORD *)(v24 + 2LL * v20) & 0x7FFF;
                    if ((*(_WORD *)(v24 + 2LL * v20) & 0x8000) == 0)
                    {
                      uint64_t v26 = v15 + ((_DWORD)v20 << 9);
                      if (v17 && (uint64_t v27 = *v32, (int)v27 >= 1))
                      {
                        unint64_t v28 = (void *)(v35 + 8);
                        while (v26 != *v28)
                        {
                          v28 += 320;
                          if (!--v27) {
                            goto LABEL_35;
                          }
                        }

                        --v17;
                      }

                      else
                      {
LABEL_35:
                        BOOL v29 = &v40[v23];
                        *BOOL v29 = v26;
                        v29[1] = v25 << 9;
                        if (++v23 >= 0x100)
                        {
                          v31(v11, v30, 1LL, v40);
                          int v23 = 0;
                        }
                      }
                    }

                    LODWORD(v20) = v20 + v25;
                  }

                  while (v20 < v21);
                  uint64_t v10 = v30;
                  __int16 v2 = v31;
                  if (v23) {
                    v31(v11, v30, 1LL, v40);
                  }
                  goto LABEL_9;
                }

                uint64_t v22 = v35 + 2560LL * v19;
                uint64_t v20 = *(void *)(v22 + 2136) >> 9;
                unsigned int v21 = 16319 - (*(void *)(v22 + 2128) >> 9);
              }
            }

void small_malloc_from_free_list(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = a3;
  if (a3 >= 0x20) {
    unsigned int v6 = 30;
  }
  else {
    unsigned int v6 = a3 - 1;
  }
  unint64_t v7 = *(void *)(a2 + 32 + 8LL * v6);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFF800000LL;
    BOOL v9 = (v7 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v7 && (v7 & 0xFFFFFFFFFF800000LL | 0x81F8) > v7;
    uint64_t v10 = *(void *)(a2 + 32 + 8LL * v6);
    if (!v9) {
      goto LABEL_13;
    }
    if ((*(_WORD *)(v7 + 16) & 0x8000) != 0)
    {
      unint64_t v11 = (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9;
      if (v11 != -(uint64_t)v8)
      {
        uint64_t v10 = v11 + v8;
LABEL_13:
        small_free_list_remove_ptr(a1, a2, v7, v3);
        goto LABEL_14;
      }
    }
  }

  int v14 = v6 >> 5;
  int v15 = -1 << v6;
  while (1)
  {
    int v16 = v14;
    if (v14) {
      break;
    }
    int v14 = 1;
    unsigned int v17 = *(_DWORD *)(a2 + 2088) & v15;
    int v15 = -1;
    if (v17) {
      goto LABEL_24;
    }
  }

  if (v14 == 1) {
    goto LABEL_34;
  }
  unsigned int v17 = 0;
LABEL_24:
  unint64_t v18 = *(void *)(a2 + 32 + 8LL * (__clz(__rbit32(v17)) + 32 * v16));
  if (v18)
  {
    BOOL v19 = (v18 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v18 && (v18 & 0xFFFFFFFFFF800000LL | 0x81F8) > v18;
    uint64_t v10 = v18;
    if (!v19
      || (*(_WORD *)(v18 + 16) & 0x8000) != 0
      && (uint64_t v10 = (v18 & 0xFFFFFFFFFF800000LL) + ((unint64_t)(*(_WORD *)(v18 + 16) & 0x7FFF) << 9)) != 0)
    {
      unsigned int v20 = *(_WORD *)((v10 & 0xFFFFFFFFFF800000LL | (2
                                                    * (((unint64_t)(v10
                                                                         - (v10 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                     + 0x28) & 0x7FFF;
      small_free_list_remove_ptr(a1, a2, v18, v20);
      if (v20 <= v3) {
        unsigned int v3 = v20;
      }
      else {
        small_free_list_add_ptr(a1, a2, v10 + (v3 << 9), (unsigned __int16)(v20 - v3));
      }
      goto LABEL_14;
    }
  }

unint64_t small_size(uint64_t a1, uint64_t a2)
{
  __int16 v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFF800000LL;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55LL * ((a2 & 0xFFFFFFFFFF800000LL) >> 20)) >> -*((_BYTE *)v2 + 8);
    unint64_t v7 = v6;
    while (1)
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        return 0LL;
      }
      if (v8 == v4) {
        break;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0LL;
      }
      else {
        ++v7;
      }
      if (v7 == v6) {
        return 0LL;
      }
    }

    if (v4)
    {
      unint64_t v9 = ((unint64_t)(a2 - v4 - 33280) >> 9) & 0x3FFF;
      if (v9 <= 0x3FBE)
      {
        int v10 = *(__int16 *)((a2 & 0xFFFFFFFFFF800000LL) + 2 * v9 + 0x28);
        if ((v10 & 0x80000000) == 0)
        {
          int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000LL) + 0x18);
          if (v11 != -1)
          {
            if (*(void *)(*(void *)(a1 + 624) + 2560LL * v11 + 8) == a2) {
              return 0LL;
            }
            return (unint64_t)(unsigned __int16)v10 << 9;
          }

          uint64_t v13 = *(unsigned int *)(a1 + 608);
          for (int i = (void *)(*(void *)(a1 + 624) + 8LL); *i != a2; i += 320)
          {
            if (!--v13) {
              return (unint64_t)(unsigned __int16)v10 << 9;
            }
          }
        }
      }
    }
  }

  return 0LL;
}

void free_small_botch(uint64_t a1)
{
}

void print_small_free_list( uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  if (_simple_salloc())
  {
    if (a2(a1, a4, 768LL, &v21))
    {
      uint64_t v8 = "Failed to map small rack\n";
LABEL_6:
      a3(v8);
      return;
    }

    if (a2(a1, *(void *)(v21 + 624), 2560LL * *(int *)(v21 + 608), &v20))
    {
      uint64_t v8 = "Failed to map small rack magazines\n";
      goto LABEL_6;
    }

    _simple_sappend();
    if ((*(_DWORD *)(v21 + 608) & 0x80000000) != 0)
    {
LABEL_42:
      unint64_t v18 = (const char *)_simple_string();
      a3("%s\n", v18);
      _simple_sfree();
      return;
    }

    uint64_t v9 = -1LL;
LABEL_10:
    uint64_t v19 = v9;
    _simple_sprintf();
    uint64_t v10 = 0LL;
    uint64_t v11 = v19;
    while (1)
    {
      unint64_t v12 = *(void *)(v20 + 2560 * v11 + 8 * v10 + 32);
      if (v12)
      {
        if ((v12 & 0xFFFFFFFFFF800000LL | 0x7FA6) > v12 || (v12 & 0xFFFFFFFFFF800000LL | 0x81F8) <= v12)
        {
LABEL_16:
          int v14 = 0;
          while (1)
          {
            if (v12 >= (v12 & 0xFFFFFFFFFF800000LL | 0x7FA6) && v12 < (v12 & 0xFFFFFFFFFF800000LL | 0x81F8))
            {
              if (!a2(a1, v12, 18LL, &v23))
              {
                unint64_t v12 = *(void *)(v23 + 8);
                goto LABEL_31;
              }

              int v16 = "Failed to map small oobe pointer\n";
              goto LABEL_28;
            }

            if (a2(a1, v12 + 16, 16LL, &v23)) {
              break;
            }
            if (a2(a1, a4, 768LL, &v22))
            {
              int v16 = "Failed to map small rack\n";
              goto LABEL_28;
            }

            unint64_t v12 = *(void *)v23;
            uint64_t v17 = *(void *)(v22 + 632) ^ a4 ^ *(void *)v23;
            if (*(unsigned __int8 *)(v23 + 8) != (BYTE4(v17)
                                                                  + v17
                                                                  + ((HIDWORD(v17) + v17) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v17)
                                                                                      + v17
                                                                                      + ((HIDWORD(v17) + v17) >> 16)) >> 8)))
            {
              free_list_checksum_botch(a4);
              __break(1u);
              return;
            }

LABEL_31:
            ++v14;
            if (!v12)
            {
              _simple_sprintf();
              goto LABEL_36;
            }
          }

          int v16 = "Unable to map small linkage pointer %p\n";
LABEL_28:
          a3(v16);
          unint64_t v12 = 0LL;
          goto LABEL_31;
        }

        if (a2(a1, v12, 18LL, &v23))
        {
          a3("Failed to map small oobe pointer\n");
        }

        else if (*(__int16 *)(v23 + 16) < 0)
        {
          uint64_t v11 = v19;
          goto LABEL_37;
        }

      ++v25;
      v24 += 64;
      if (v25 == 4096)
      {
        v23 += 0x4000000LL;
        goto LABEL_20;
      }
    }
  }

  int v14 = v13;
  v9("Failed to map nanozonev2_s at %p\n", a2);
  return v14;
}

      __clrex();
      unint64_t v12 = v26;
    }

    int v15 = v12;
    if ((v12 & 0x3FF800) == 0)
    {
      while (1)
      {
        uint64_t v26 = __ldxr(v8);
        if (v26 != v12) {
          break;
        }
        if (!__stxr(v12 & 0xFFFFFFFFF03FFFFFLL, v8)) {
          return 0LL;
        }
      }

      goto LABEL_31;
    }

      uint64_t v13 = 1;
      goto LABEL_33;
    }
  }

  else
  {
    if (a3 > 0x8000)
    {
      _xzm_malloc_large_huge(a1, a3, 0LL, a4, 1);
      return;
    }

    if (*(void *)(a1 + 232)) {
      uint64_t v9 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v9 = a1;
    }
    uint64_t v10 = __clz(a3 - 1);
    uint64_t v11 = (((a3 - 1) >> (61 - v10)) & 3) - 4 * v10 + 488;
    if (a3 <= 0x80) {
      uint64_t v11 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    if (!a3) {
      LOBYTE(v11) = 0;
    }
    unint64_t v12 = v11;
    uint64_t v8 = *(_BYTE *)(*(void *)(v9 + 368) + v11);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000LL) != 0x40000000000LL)
      {
        ((void (*)(void))((char *)&loc_1803E4C4C
                        + *((int *)&qword_1803E4CD0[-1]
        return;
      }

      goto LABEL_31;
    }
  }

  uint64_t v13 = 0;
LABEL_33:
  _xzm_xzone_malloc(a1, a3, (v13 + v8), 1);
}

LABEL_36:
        uint64_t v11 = v19;
      }

  uint64_t v25 = *(_BYTE *)(v24 + 32) & 0xF;
  if (v25 > 7) {
    xzm_segment_group_free_chunk_cold_3(v25);
  }
  BOOL v29 = a2
      - (((0xAAAAAAAAAAAAC000LL * (((v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
       + *(void *)((v24 & 0xFFFFFFFFFFFFC000LL) + 0x30));
  if (v25 == 5 || v25 == 2)
  {
    unint64_t v31 = *(void *)(v16 + 216) + 88LL * *(unsigned __int8 *)(v24 + 33);
    __int16 v32 = *(void *)(v31 + 48);
  }

  else
  {
    __int16 v32 = (unint64_t)*(unsigned int *)(v24 + 40) << 14;
    if (v29 % v32) {
      goto LABEL_38;
    }
  }

  if (v25 != 5)
  {
    if (v25 != 2
      || *(void *)a2 != (*(void *)(v16 + 272) ^ a2)
      || !_xzm_xzone_tiny_chunk_block_is_free_slow(v16, v24, a2))
    {
      goto LABEL_18;
    }

    goto LABEL_38;
  }

  if (((*(_DWORD *)v24 >> (v29 / v32)) & 1) != 0) {
LABEL_38:
  }
    _xzm_ptr_size_outlined(v16, a2);
LABEL_18:
  if (a3 >= 0x401 && (*(void *)(a1 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = a1;
  }
  _xzm_free(v17, a2, 0);
}

uint64_t print_small_region()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  uint64_t v10 = v9;
  uint64_t v37 = *MEMORY[0x1895FEE08];
  uint64_t v11 = (char *)(v5 + 33280);
  if (v12(v0, v5 + 33280, 0x800000LL, &v35)) {
    return v10("Failed to map small region at %p\n", v11);
  }
  if (v6 == -1)
  {
    uint64_t result = _simple_salloc();
    if (!result) {
      return result;
    }
    _simple_sprintf();
    unint64_t v28 = (const char *)_simple_string();
    v10("%s\n", v28);
    return _simple_sfree();
  }

  int v34 = v8;
  unint64_t v14 = (unint64_t)&v11[v4];
  unint64_t v15 = v6 + 0x800000 - v2;
  uint64_t v16 = v35;
  _platform_memset();
  if ((unint64_t)&v11[v4] >= v15)
  {
    int v17 = 0;
  }

  else
  {
    int v17 = 0;
    uint64_t v18 = 0LL;
    uint64_t v19 = v16 - (void)v11;
    uint64_t v20 = *MEMORY[0x189600148];
    uint64_t v21 = -*MEMORY[0x189600148];
    while (1)
    {
      uint64_t v22 = *(void *)((v14 & 0xFFFFFFFFFF800000LL | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40);
      if ((*(_DWORD *)((v14 & 0xFFFFFFFFFF800000LL | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40) & 0x7FFF) == 0)
        break;
      if ((v22 & 0x8000) != 0)
      {
        unint64_t v24 = (v14 + v20 + 9) & v21;
        unint64_t v23 = (unint64_t)(v22 & 0x7FFF) << 9;
        unint64_t v25 = (v14 + v23 - 2) & v21;
        BOOL v26 = v25 >= v24;
        unint64_t v27 = v25 - v24;
        if (!v26) {
          unint64_t v27 = 0LL;
        }
        v18 += v27;
      }

      else
      {
        ++v17;
        unint64_t v23 = (unint64_t)(v22 & 0x7FFF) << 9;
      }

      v14 += v23;
      if (v14 >= v15) {
        goto LABEL_20;
      }
    }

    v10("*** error with %p: msize=%d, free: %x\n", (const void *)v14, 0, v22 & 0x8000);
  }

LABEL_20:
  uint64_t result = _simple_salloc();
  if (result)
  {
    int v29 = *(_DWORD *)(v16 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v2 | v4) {
      _simple_sprintf();
    }
    if (v29 != -1) {
      _simple_sprintf();
    }
    _simple_sprintf();
    if (v34 >= 2 && v17)
    {
      _simple_sappend();
      uint64_t v30 = 0LL;
      unint64_t v31 = v36;
      do
      {
        if (*v31++) {
          _simple_sprintf();
        }
        v30 += 512LL;
      }

      while (v30 != 0x80000);
    }

    uint64_t v33 = (const char *)_simple_string();
    v10("%s\n", v33);
    return _simple_sfree();
  }

  return result;
}

void small_free_list_check(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 608) & 0x80000000) == 0)
  {
    uint64_t v3 = a2;
    uint64_t v4 = -1LL;
    uint64_t v5 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
    do
    {
      uint64_t v6 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560 * v4);
      os_unfair_lock_lock_with_options();
      unint64_t v7 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
      if (v7)
      {
        int v8 = 0;
        unint64_t v9 = 0LL;
        unint64_t v10 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
        while (2)
        {
          BOOL v11 = (v7 & 0xFFFFFFFFFF800000LL | 0x7FA6) <= v10 && (v7 & 0xFFFFFFFFFF800000LL | 0x81F8) > v10;
          int v12 = !v11;
          unint64_t v13 = v10;
          if (v11)
          {
            if ((*(_WORD *)(v10 + 16) & 0x8000) == 0) {
              break;
            }
            unint64_t v13 = (v7 & 0xFFFFFFFFFF800000LL) + ((unint64_t)(*(_WORD *)(v10 + 16) & 0x7FFF) << 9);
          }

          if (v13)
          {
            unint64_t v14 = v13 & 0xFFFFFFFFFF800000LL;
            if ((*(__int16 *)((v13 & 0xFFFFFFFFFF800000LL | (2
                                                            * (((v13 - (v13 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                             + 0x28) & 0x80000000) == 0)
              goto LABEL_39;
            if ((v13 & 0x1FF) != 0)
            {
              uint64_t v5 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
              goto LABEL_39;
            }

            unint64_t v15 = *(uint64_t **)(a1 + 24);
            uint64_t v16 = *v15;
            if (!*v15)
            {
LABEL_38:
              uint64_t v5 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d count=%d ptr=%p\n";
LABEL_39:
              malloc_zone_check_fail((uint64_t)"check: small free list incorrect", (uint64_t)v5);
              os_unfair_lock_unlock(v6);
              return;
            }

            uint64_t v17 = v15[2];
            unint64_t v18 = (0x9E3779B97F4A7C55LL * (v14 >> 20)) >> -*((_BYTE *)v15 + 8);
            unint64_t v19 = v18;
            while (1)
            {
              uint64_t v20 = *(void *)(v17 + 8 * v19);
              if (!v20) {
                goto LABEL_38;
              }
              if (v20 == v14) {
                break;
              }
              if (v19 + 1 == v16) {
                unint64_t v19 = 0LL;
              }
              else {
                ++v19;
              }
              if (v19 == v18) {
                goto LABEL_38;
              }
            }

            if (!v14) {
              goto LABEL_38;
            }
            if (v12)
            {
              uint64_t v21 = *(void *)(a1 + 632) ^ a1;
              uint64_t v22 = v21 ^ *(void *)v10;
              if (*(unsigned __int8 *)(v10 + 8) != (BYTE4(v22)
                                                                    + v22
                                                                    + ((HIDWORD(v22) + v22) >> 16)
                                                                    + ((unsigned __int16)(WORD2(v22)
                                                                                        + v22
              if (v9 != *(void *)v10)
              {
LABEL_41:
                uint64_t v5 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
                goto LABEL_39;
              }

              unint64_t v7 = *(void *)(v10 + 16);
              if (*(unsigned __int8 *)(v10 + 24) != (((v21 ^ v7) >> 32)
                                                                     + (v21 ^ v7)
                                                                     + ((((v21 ^ v7) >> 32) + (v21 ^ v7)) >> 16)
                                                                     + ((unsigned __int16)(((v21 ^ v7) >> 32)
                                                                                         + (v21 ^ v7)
                                                                                         + ((((v21 ^ v7) >> 32) + (v21 ^ v7)) >> 16)) >> 8)))
              {
LABEL_42:
                free_list_checksum_botch(a1);
                __break(1u);
                return;
              }
            }

            else
            {
              if (v9 != *(void *)v10) {
                goto LABEL_41;
              }
              unint64_t v7 = *(void *)(v10 + 8);
            }

            ++v8;
            unint64_t v9 = v10;
            unint64_t v10 = v7;
            if (v7) {
              continue;
            }
          }

          break;
        }
      }

      os_unfair_lock_unlock(v6);
      ++v4;
    }

    while (v4 < *(int *)(a1 + 608));
  }

void free_list_checksum_botch(uint64_t a1)
{
}

unint64_t small_madvise_free_range_no_lock( unint64_t result, os_unfair_lock_s *a2, uint64_t a3, unint64_t a4, unsigned int a5, unint64_t a6, uint64_t a7)
{
  uint64_t v10 = result;
  unint64_t v11 = a4 & 0xFFFFFFFFFF800000LL;
  if (a4)
  {
    if (v11 + 32678 > a4 || v11 + 33272 <= a4)
    {
      unint64_t v16 = a4 & 0xFFFFFFFFFF800000LL;
      unint64_t v15 = a4;
    }

    else
    {
      __int16 v12 = *(_WORD *)(a4 + 16);
      int v13 = v12;
      unint64_t v14 = v11 + ((unint64_t)(v12 & 0x7FFF) << 9);
      if (v13 < 0) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = 0LL;
      }
      unint64_t v16 = a4 & 0xFFFFFFFFFF800000LL;
    }
  }

  else
  {
    unint64_t v16 = 0LL;
    unint64_t v15 = 0LL;
  }

  BOOL v18 = v11 + 32678 > a4;
  unint64_t v17 = v11 + 33272;
  BOOL v18 = !v18 && v17 > a4;
  int v19 = !v18;
  uint64_t v20 = 10LL;
  if (!v19) {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = *MEMORY[0x189600118];
  unint64_t v22 = (*MEMORY[0x189600118] + v20 + v15) & ~*MEMORY[0x189600118];
  unint64_t v23 = (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x189600118];
  if (v22 < v23)
  {
    unint64_t v24 = (a6 + a7 + v20 + v21) & ~v21;
    unint64_t v25 = v22 <= (~v21 & a6) ? ~v21 & a6 : v22;
    unint64_t v26 = v23 >= v24 ? v24 : (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x189600118];
    if (v25 < v26)
    {
      if (!a4) {
        LOBYTE(v19) = 1;
      }
      unint64_t v27 = a4;
      if ((v19 & 1) == 0)
      {
        __int16 v28 = *(_WORD *)(a4 + 16);
        unint64_t v29 = v16 + ((unint64_t)(v28 & 0x7FFF) << 9);
        if (v28 < 0) {
          unint64_t v27 = v29;
        }
        else {
          unint64_t v27 = 0LL;
        }
      }

      unint64_t v30 = ((v27 - (v27 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
      unint64_t v31 = ((unint64_t)(v27 + (a5 << 9) - 33281) >> 9) & 0x3FFF;
      if (v30 > v31) {
        purgeable_ptr_in_use_enumerator_cold_1(result, a2, a3);
      }
      unint64_t v32 = (v27 & 0xFFFFFFFFFF800000LL) + 40;
      *(_WORD *)(v32 + 2 * v30) &= ~0x8000u;
      *(_WORD *)(v32 + 2 * v31) &= ~0x8000u;
      small_free_list_remove_ptr_no_clear(result, (uint64_t)a2, a4, a5);
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      mvm_madvise_free(v10, a3, v25, v26, v10 + 640, *(_DWORD *)(v10 + 620) & 0x20);
      os_unfair_lock_lock_with_options();
      OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
      return small_free_list_add_ptr(v10, (uint64_t)a2, v15, a5);
    }
  }

  return result;
}

unint64_t small_free_try_depot_unmap_no_lock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16)) {
    return 0LL;
  }
  unsigned int v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions) {
    return 0LL;
  }
  uint64_t v7 = *(void *)a3;
  int v8 = *(void **)(a3 + 8);
  if (*(void *)a3)
  {
    *(void *)(v7 + 8) = v8;
    int v8 = *(void **)(a3 + 8);
  }

  else
  {
    *(void *)(a2 + 2176) = v8;
  }

  if (!v8) {
    int v8 = (void *)(a2 + 2184);
  }
  *int v8 = v7;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  unint64_t v9 = a3 & 0xFFFFFFFFFF800000LL;
  if (small_free_detach_region(a1, a2, a3 & 0xFFFFFFFFFF800000LL))
  {
    malloc_zone_error( *(_DWORD *)(a1 + 620),  1,  (uint64_t)"small_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0LL;
  }

  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFF800000LL, a3)) {
    return 0LL;
  }
  *(void *)(a2 + 2160) -= 8355328LL;
  return v9;
}

void OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t trace_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((_DWORD)a4)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      do
      {
        if (!(v5 - a2 + v8)) {
          return v4;
        }
        char v9 = *(_BYTE *)(a1 + v5 + v8);
        v7 |= (unint64_t)(v9 & 0x7F) << v6;
        ++v8;
        v6 += 7LL;
      }

      while ((v9 & 0x80) == 0);
      if (!v8) {
        return v4;
      }
      if (v4) {
        uint64_t v10 = *(void *)(a3 + 8 * v4 - 8);
      }
      else {
        uint64_t v10 = 0LL;
      }
      v5 += v8;
      *(void *)(a3 + 8 * v4++) = v10 + 4 * (-(uint64_t)(v7 & 1) ^ (v7 >> 1));
    }

    while (v4 != a4);
  }

  return a4;
}

uint64_t trace_collect(uint64_t a1, uint64_t a2)
{
  v14[65] = *(void **)MEMORY[0x1895FEE08];
  unsigned int v4 = backtrace(v14, 65);
  if (v4 < 2) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = v4 - 1;
  while (2)
  {
    if (v6) {
      char v9 = v14[v6];
    }
    else {
      char v9 = 0LL;
    }
    uint64_t v10 = (_BYTE *)v14[v6 + 1] - v9;
    if (v10 >= -3) {
      unint64_t v11 = 2 * (v10 / 4);
    }
    else {
      unint64_t v11 = ~(2 * (v10 / 4));
    }
    uint64_t result = v7;
    do
    {
      if (a2 == result) {
        return v7;
      }
      char v12 = v11;
      *(_BYTE *)(a1 + result++) = v11 & 0x7F;
      BOOL v13 = v11 > 0x7F;
      v11 >>= 7;
    }

    while (v13);
    *(_BYTE *)(a1 + result - 1) = v12 | 0x80;
    ++v6;
    uint64_t v7 = result;
    if (v6 != v8) {
      continue;
    }
    break;
  }

  return result;
}

uint64_t xzm_metapool_init(uint64_t result, char a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)uint64_t result = 0;
  *(_BYTE *)(result + 4) = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_DWORD *)(result + 16) = a5;
  *(void *)(result + 32) = 0LL;
  *(void *)(result + 40) = 0LL;
  *(void *)(result + 24) = 0LL;
  *(_DWORD *)(result + 48) = 0;
  *(void *)(result + 56) = a6;
  return result;
}

uint64_t xzm_metapool_alloc(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    plat = *(void **)(a1 + 40);
    if (plat)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 48);
      if (v6 != *(_DWORD *)(a1 + 8))
      {
LABEL_14:
        uint64_t v3 = plat[1] + v6;
        *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 16) + v6;
        goto LABEL_15;
      }
    }

    else
    {
      unsigned int v6 = *(_DWORD *)(a1 + 8);
    }

    plat = (void *)mvm_allocate_plat(0LL, v6, __clz(__rbit32(*(_DWORD *)(a1 + 12))), 1, 0, 1);
    if (!plat) {
      xzm_metapool_alloc_cold_1();
    }
    uint64_t v7 = plat;
    if (*(void *)(a1 + 56))
    {
      plat = (void *)xzm_metapool_alloc();
      unsigned int v6 = 0;
    }

    else
    {
      unsigned int v6 = *(_DWORD *)(a1 + 16);
    }

    *(_DWORD *)(a1 + 48) = v6;
    void *plat = 0LL;
    plat[1] = v7;
    *(void *)(a1 + 40) = plat;
    void *plat = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = plat;
    goto LABEL_14;
  }

  uint64_t v3 = v2[1];
  *(void *)(a1 + 32) = *v2;
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    xzm_metapool_free(v4, v2);
  }

  else
  {
    *uint64_t v2 = 0LL;
    v2[1] = 0LL;
  }

void xzm_metapool_free(uint64_t a1, void *a2)
{
  uint64_t v4 = a2;
  if (*(void *)(a1 + 56))
  {
    uint64_t v4 = (void *)xzm_metapool_alloc();
    if (*(void *)(a1 + 56))
    {
      size_t v5 = *(unsigned int *)(a1 + 16);
      if (*MEMORY[0x189600148] <= v5) {
        mvm_madvise(a2, v5, 7);
      }
    }
  }

  *uint64_t v4 = *(void *)(a1 + 32);
  v4[1] = a2;
  *(void *)(a1 + 32) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void *rack_init(uint64_t a1, int a2, int a3, int a4)
{
  *(_OWORD *)(a1 + 32) = xmmword_1803F0E80;
  uint64_t v8 = a1 + 32;
  *(_DWORD *)(a1 + 4) = a2;
  *(void *)(a1 + 88) = a1 + 32;
  *(void *)(a1 + 24) = a1 + 32;
  *(void *)(a1 + 48) = a1 + 96;
  *(void *)(a1 + 56) = a1 + 64;
  uint64_t result = (void *)_platform_memset();
  uint64_t v10 = malloc_entropy;
  if (a2 == 2) {
    uint64_t v10 = ~malloc_entropy;
  }
  *(void *)(v8 + 600) = v10;
  *(_DWORD *)(v8 + 588) = a4;
  *(_DWORD *)(v8 + 576) = a3;
  *(void *)(v8 + 592) = 0LL;
  *(void *)(v8 - 24) = 0LL;
  *(void *)(v8 - 16) = 0LL;
  if (a3)
  {
    uint64_t result = (void *)mvm_allocate_pages( (*MEMORY[0x189600148] + 2560LL * (a3 + 1) - 1) & -*MEMORY[0x189600148],  0,  1073741827,  1);
    if (!result) {
      rack_init_cold_1();
    }
    unint64_t v11 = result + 320;
    *(void *)(a1 + 624) = result + 320;
    *(_DWORD *)(a1 + 616) = 0;
    unsigned int v12 = a3 - 1;
    if (a3 != 1)
    {
      int v13 = 0;
      unsigned int v14 = 1;
      do
      {
        ++v13;
        v14 *= 2;
      }

      while (v14 <= v12);
      *(_DWORD *)(a1 + 616) = v13;
      unsigned int v12 = v14 - 1;
    }

    *(_DWORD *)(a1 + 612) = v12;
    *(void *)(a1 + 640) = 0LL;
    *(_DWORD *)a1 = 0;
    *uint64_t result = 0LL;
    if (*(int *)(a1 + 608) >= 1)
    {
      uint64_t v15 = 0LL;
      do
      {
        *unint64_t v11 = 0LL;
        ++v15;
        v11 += 320;
      }

      while (v15 < *(int *)(a1 + 608));
    }
  }

  return result;
}

uint64_t rack_destroy_regions(uint64_t result)
{
  uint64_t v1 = *(unint64_t **)(result + 24);
  unint64_t v2 = *v1;
  if (*v1)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    do
    {
      uint64_t result = *(void *)(v1[2] + 8 * v4);
      if ((unint64_t)(result + 1) >= 2)
      {
        uint64_t result = mvm_deallocate_pages();
        *(void *)(*(void *)(*(void *)(v3 + 24) + 16LL) + 8 * v4) = -1LL;
        uint64_t v1 = *(unint64_t **)(v3 + 24);
        unint64_t v2 = *v1;
      }

      ++v4;
    }

    while (v2 > v4);
  }

  return result;
}

uint64_t rack_destroy(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  uint64_t result = v2[2];
  unint64_t v4 = (void *)MEMORY[0x189600148];
  if (result != a1 + 96) {
    uint64_t result = mvm_deallocate_pages(result, (*MEMORY[0x189600148] + 8LL * *v2 - 1) & -*MEMORY[0x189600148], 0LL);
  }
  int v5 = *(_DWORD *)(a1 + 608);
  if (v5 >= 1)
  {
    uint64_t result = mvm_deallocate_pages(*(void *)(a1 + 624) - 2560LL, (*v4 + 2560LL * v5 + 2559) & -*v4, 3LL);
    *(void *)(a1 + 624) = 0LL;
  }

  return result;
}

void rack_region_insert(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void **)(a1 + 24);
  uint64_t v5 = *v4;
  if (*v4 < (unint64_t)(2LL * *(void *)(a1 + 8)))
  {
    uint64_t v7 = v4[1];
    uint64_t v6 = v4[2];
    uint64_t v8 = 2 * v5;
    mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x189600148] + 16 * v5 - 1) & -*MEMORY[0x189600148], 0, 0x40000000, 1);
    if (v5)
    {
      uint64_t v10 = 0LL;
      char v11 = 63 - v7;
      do
      {
        unint64_t v12 = *(void *)(v6 + 8 * v10);
        if (v12 + 1 >= 2)
        {
          unint64_t v13 = (0x9E3779B97F4A7C55LL * (v12 >> 20)) >> v11;
          while ((unint64_t)(*(void *)(pages + 8 * v13) + 1LL) > 1)
          {
            if (v13 + 1 == v8) {
              unint64_t v13 = 0LL;
            }
            else {
              ++v13;
            }
            if (v13 == (0x9E3779B97F4A7C55LL * (v12 >> 20)) >> v11) {
              goto LABEL_13;
            }
          }

          *(void *)(pages + 8 * v13) = v12;
        }

LABEL_13:
        ++v10;
      }

      while (v10 != v5);
    }

    unsigned int v14 = *(uint64_t **)(*(void *)(a1 + 24) + 24LL);
    v14[1] = v7 + 1;
    v14[2] = pages;
    *unsigned int v14 = v8;
    OSMemoryBarrier();
    unint64_t v4 = *(void **)(*(void *)(a1 + 24) + 24LL);
    *(void *)(a1 + 24) = v4;
    uint64_t v5 = *v4;
  }

  uint64_t v15 = v4[2];
  unint64_t v16 = (0x9E3779B97F4A7C55LL * (a2 >> 20)) >> -*((_BYTE *)v4 + 8);
  unint64_t v17 = v16;
  while ((unint64_t)(*(void *)(v15 + 8 * v17) + 1LL) > 1)
  {
    if (v17 + 1 == v5) {
      unint64_t v17 = 0LL;
    }
    else {
      ++v17;
    }
    if (v17 == v16) {
      goto LABEL_23;
    }
  }

  *(void *)(v15 + 8 * v17) = a2;
LABEL_23:
  ++*(void *)(a1 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

    _xzm_free_outlined(a1, (void *)a2, a3);
    return;
  }

BOOL rack_region_remove(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void **)v6;
  if (*(void *)v6)
  {
    uint64_t v8 = *(void *)(v6 + 16);
    unint64_t v9 = (0x9E3779B97F4A7C55LL * (a2 >> 20)) >> -*(_BYTE *)(v6 + 8);
    unint64_t v10 = v9;
    while (1)
    {
      uint64_t v11 = *(void *)(v8 + 8 * v10);
      if (!v11)
      {
LABEL_9:
        uint64_t v7 = 0LL;
        goto LABEL_11;
      }

      if (v11 == a2) {
        break;
      }
      if ((void *)(v10 + 1) == v7) {
        unint64_t v10 = 0LL;
      }
      else {
        ++v10;
      }
      if (v10 == v9) {
        goto LABEL_9;
      }
    }

    uint64_t v7 = (void *)(v8 + 8 * v10);
  }

LABEL_11:
  int v12 = *(_DWORD *)(a3 + 36);
  BOOL v13 = (v12 & 1) == 0;
  if ((v12 & 1) != 0) {
    *(_DWORD *)(a3 + 36) = v12 | 2;
  }
  if (v7)
  {
    *uint64_t v7 = -1LL;
    OSAtomicIncrement64((OSAtomic_int64_aligned64_t *)(a1 + 16));
  }

  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"tiny_free_try_depot_unmap_no_lock hash lookup failed: %p\n");
    BOOL v13 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
  return v13;
}

  if (!v11) {
    *(void *)(StatusReg + 904) = 0LL;
  }
  if (!v14 && (v6 & 1) != 0) {
    **(_DWORD **)(StatusReg + 8) = v15;
  }
  return v14;
}

uint64_t rack_region_maybe_dispose(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = *(_DWORD *)(a4 + 36);
  if ((v8 & 2) != 0)
  {
    uint32_t os_unfair_lock_opaque = a1[155]._os_unfair_lock_opaque;
    if ((os_unfair_lock_opaque & 4) != 0) {
      int v10 = -2;
    }
    else {
      int v10 = -4;
    }
    mvm_deallocate_pages(a2, a3, v10 & os_unfair_lock_opaque);
  }

  else
  {
    *(_DWORD *)(a4 + 36) = v8 & 0xFFFFFFFE;
  }

  os_unfair_lock_unlock(a1);
  return (v8 >> 1) & 1;
}

unint64_t rack_get_thread_index()
{
  unint64_t result = _os_cpu_number_override;
  if (_os_cpu_number_override == -1) {
    return _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  return result;
}

void *create_legacy_scalable_zone(uint64_t a1, uint64_t a2)
{
  scalable_zone = (void *)create_scalable_zone(a1, a2);
  uint64_t v3 = scalable_zone;
  if (scalable_zone)
  {
    mprotect(scalable_zone, 0xC8uLL, 3);
    v3[5] = legacy_valloc;
    v3[15] = 0LL;
    mprotect(v3, 0xC8uLL, 1);
  }

  return v3;
}

mach_vm_address_t legacy_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *MEMORY[0x189600118];
  if (*MEMORY[0x189600118] <= *MEMORY[0x189600138]) {
    uint64_t v2 = *MEMORY[0x189600138];
  }
  unint64_t v3 = (v2 + a2) & ~v2;
  int v4 = *MEMORY[0x189600120];
  if (*MEMORY[0x189600120] <= *MEMORY[0x189600140]) {
    LOBYTE(v4) = *MEMORY[0x189600140];
  }
  return large_malloc(a1, v3 >> v4, 0);
}

uint64_t mvm_aslr_init()
{
  uint64_t result = _dyld_get_image_slide();
  if (result)
  {
    if (!entropic_address)
    {
      uint64_t v1 = 0x16FD00000LL - ((_DWORD)qword_18C444C28 << 25);
      mach_vm_address_t address = 0LL;
      uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
      unint64_t v3 = (mach_vm_size_t *)MEMORY[0x189600148];
      if (!mach_vm_allocate(*MEMORY[0x1895FFD48], &address, *MEMORY[0x189600148], 117440513))
      {
        mach_vm_address_t v4 = address;
        if (address > 0x16FE00000LL)
        {
          uint64_t v1 = (address & 0xFFFFFFFFFE000000LL) + 0x200000000LL;
          OSAtomicCompareAndSwapLong(0LL, address, &entropic_base);
          mach_vm_address_t v4 = address;
        }

        mach_vm_deallocate(*v2, v4, *v3);
      }

      OSAtomicCompareAndSwapLong(0LL, v1, &entropic_limit);
      return OSAtomicCompareAndSwapLong(0LL, v1 - 0x10000000, &entropic_address);
    }
  }

  else
  {
    malloc_entropy = 0LL;
    qword_18C444C28 = 0LL;
  }

  return result;
}

mach_vm_address_t mvm_allocate_plat( mach_vm_address_t a1, mach_vm_size_t size, char a3, int a4, __int16 a5, int a6)
{
  if (a1 && (a4 & 1) != 0) {
    malloc_zone_error( a5 | 0x40,  0,  (uint64_t)"Unsupported anywhere allocation at address 0x%lx of size 0x%lx with flags %d\n");
  }
  if ((a5 & 0x200) != 0) {
    malloc_zone_error( a5 | 0x40,  0,  (uint64_t)"Unsupported unpopulated allocation at address 0x%lx of size 0x%lx with flags %d\n");
  }
  mach_vm_address_t address = a1;
  if (mach_vm_map(*MEMORY[0x1895FFD48], &address, size, ~(-1LL << a3), a4 | (a6 << 24), 0, 0LL, 0, 3, 7, 1u)) {
    return 0LL;
  }
  else {
    return address;
  }
}

mach_vm_address_t mvm_allocate_pages(unint64_t a1, int a2, int a3, int a4)
{
  return mvm_allocate_pages_plat(a1, a2, a3, a4);
}

mach_vm_address_t mvm_allocate_pages_plat(unint64_t a1, int a2, int a3, int a4)
{
  kern_return_t v12;
  mach_vm_address_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v20;
  kern_return_t v21;
  int v24;
  mach_vm_address_t address;
  unint64_t v5 = *MEMORY[0x189600148];
  if (((a1 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148]) != 0) {
    mach_vm_size_t v6 = (a1 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148];
  }
  else {
    mach_vm_size_t v6 = *MEMORY[0x189600148];
  }
  if ((a3 & 3) != 0)
  {
    if ((a3 & 1) != 0 && *MEMORY[0x189600140] < a2)
    {
      if (*MEMORY[0x189600128] > v5) {
        unint64_t v5 = *MEMORY[0x189600128];
      }
      v6 += (1 << a2) + v5;
    }

    else
    {
      if (*MEMORY[0x189600128] > v5) {
        unint64_t v5 = *MEMORY[0x189600128];
      }
      v6 += v5 << ((a3 & 3) == 3);
    }
  }

  if ((a3 & 0x80) != 0) {
    int v7 = 3;
  }
  else {
    int v7 = 1;
  }
  if (v6 < a1) {
    return 0LL;
  }
  unint64_t v24 = a3 & 3;
  mach_vm_offset_t v8 = ~(-1LL << a2);
  int v9 = v7 | (a4 << 24);
  int v10 = (vm_map_t *)MEMORY[0x1895FFD48];
  if ((a3 & 0x40000000) != 0) {
    goto LABEL_19;
  }
LABEL_18:
  for (mach_vm_address_t i = entropic_address; ; mach_vm_address_t i = *MEMORY[0x189600148])
  {
    mach_vm_address_t address = i;
    int v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0LL, 0, 3, 7, 1u);
    if ((a3 & 0x40000000) == 0 && v12 == 3)
    {
      mach_vm_address_t address = *MEMORY[0x189600148];
      int v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0LL, 0, 3, 7, 1u);
    }

    if (v12)
    {
      if (v12 == 3) {
        return 0LL;
      }
      BOOL v18 = "can't allocate region\n:*** mach_vm_map(size=%lu, flags: %x) failed (error code=%d)\n";
      goto LABEL_44;
    }

    BOOL v13 = address;
    if ((a3 & 0x40000000) != 0) {
      goto LABEL_34;
    }
    if (address + v6 <= entropic_limit) {
      break;
    }
    unsigned int v14 = entropic_address;
    mach_vm_deallocate(*v10, address, v6);
    OSAtomicCompareAndSwapLong(v14, v14 - 0x10000000, &entropic_address);
    if ((a3 & 0x40000000) == 0) {
      goto LABEL_18;
    }
LABEL_19:
    ;
  }

  if (address < entropic_address
    && (unint64_t)entropic_address >> 28
    && entropic_address - 0x10000000 >= (unint64_t)entropic_base)
  {
    OSAtomicCompareAndSwapLong(entropic_address, entropic_address - 0x10000000, &entropic_address);
  }

void mvm_protect_plat(uint64_t a1, uint64_t a2, int a3, char a4)
{
  if ((a4 & 9) == 1)
  {
    size_t v8 = *MEMORY[0x189600128] <= *MEMORY[0x189600148] ? *MEMORY[0x189600148] : *MEMORY[0x189600128];
  }

  if ((a4 & 0x12) == 2)
  {
    if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
      size_t v9 = *MEMORY[0x189600148];
    }
    else {
      size_t v9 = *MEMORY[0x189600128];
    }
  }

void mvm_deallocate_plat(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1895FFD48], address, size)) {
    malloc_zone_error(a3, 0, (uint64_t)"Failed to deallocate at address %p of size 0x%lx: %d\n");
  }
}

void mvm_deallocate_pages_plat(mach_vm_address_t a1, mach_vm_size_t a2, __int16 a3)
{
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0) {
      goto LABEL_3;
    }
    goto LABEL_7;
  }

  uint64_t v3 = *MEMORY[0x189600128];
  if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
    uint64_t v3 = *MEMORY[0x189600148];
  }
  a1 -= v3;
  a2 += v3;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    uint64_t v4 = *MEMORY[0x189600128];
    if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
      uint64_t v4 = *MEMORY[0x189600148];
    }
    a2 += v4;
  }

LABEL_3:
  mvm_deallocate_plat(a1, a2, a3);
}

  while (1)
  {
    size_t v9 = *a1++;
    int v10 = (unint64_t)v9 << 14;
    if (v9 && v8 != v10)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(a3 + 16))(a3, v10);
      size_t v8 = v10;
      if ((_DWORD)result) {
        return result;
      }
    }

    if (!--v6) {
      goto LABEL_9;
    }
  }

BOOL mvm_madvise(void *a1, size_t a2, int a3)
{
  return madvise(a1, a2, a3) == -1;
}

uint64_t mvm_madvise_free_plat(int a1, int a2, void *a3, unint64_t a4, void **a5, int a6)
{
  size_t v6 = a4 - (void)a3;
  if (a6 && malloc_zero_policy) {
    _platform_memset();
  }
  if (a5)
  {
    if (*a5 == a3) {
      return 0LL;
    }
    *a5 = a3;
  }

  if (madvise(a3, v6, 7) != -1)
  {
    if (malloc_tracing_enabled) {
      kdebug_trace();
    }
    return 0LL;
  }

  return 1LL;
}

void _malloc_detect_interposition()
{
  BOOL v1 = (int *)malloc_zone_valloc < &dword_1803C3000 || (unint64_t)malloc_zone_valloc >= 0x1803FB000LL;
  int v3 = (int *)malloc_zone_memalign < &dword_1803C3000 || (unint64_t)malloc_zone_memalign >= 0x1803FB000LL || v1;
  BOOL v5 = (int *)malloc < &dword_1803C3000 || (unint64_t)malloc >= 0x1803FB000LL;
  BOOL v13 = (int *)malloc_zone_malloc < &dword_1803C3000 || (unint64_t)malloc_zone_malloc >= 0x1803FB000LL;
  BOOL v15 = (int *)malloc_zone_calloc < &dword_1803C3000 || (unint64_t)malloc_zone_calloc >= 0x1803FB000LL;
  int v16 = v13 || v15;
  BOOL v18 = (int *)malloc_zone_free < &dword_1803C3000 || (unint64_t)malloc_zone_free >= 0x1803FB000LL;
  int v19 = v16 | v18;
  BOOL v21 = (int *)malloc_zone_realloc < &dword_1803C3000 || (unint64_t)malloc_zone_realloc >= 0x1803FB000LL;
  int v22 = v5 | v19 | v21 | v3;
  BOOL v24 = (int *)malloc_type_zone_valloc >= &dword_1803C3000 && (unint64_t)malloc_type_zone_valloc < 0x1803FB000LL;
  if ((int *)malloc_type_zone_memalign < &dword_1803C3000
    || (unint64_t)malloc_type_zone_memalign >= 0x1803FB000LL)
  {
    BOOL v24 = 0;
  }

  BOOL v27 = (int *)malloc_type_malloc < &dword_1803C3000 || (unint64_t)malloc_type_malloc >= 0x1803FB000LL;
  if ((int *)malloc_type_aligned_alloc < &dword_1803C3000
    || (unint64_t)malloc_type_aligned_alloc >= 0x1803FB000LL)
  {
    BOOL v27 = 1;
  }

  if ((int *)malloc_type_posix_memalign < &dword_1803C3000
    || (unint64_t)malloc_type_posix_memalign >= 0x1803FB000LL)
  {
    BOOL v27 = 1;
  }

  BOOL v35 = (int *)malloc_type_zone_malloc < &dword_1803C3000 || (unint64_t)malloc_type_zone_malloc >= 0x1803FB000LL;
  BOOL v37 = (int *)malloc_type_zone_calloc < &dword_1803C3000 || (unint64_t)malloc_type_zone_calloc >= 0x1803FB000LL;
  int v38 = v35 || v37;
  BOOL v40 = (int *)malloc_type_zone_free < &dword_1803C3000 || (unint64_t)malloc_type_zone_free >= 0x1803FB000LL;
  int v41 = v38 | v40;
  BOOL v43 = (int *)malloc_type_zone_realloc < &dword_1803C3000
     || (unint64_t)malloc_type_zone_realloc >= 0x1803FB000LL;
  int v44 = v22 & v24 & ~(v27 | v41 | v43);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
  }
  uint64_t v6 = *(void *)malloc_zones;
  unsigned int v7 = *(_DWORD *)(*(void *)malloc_zones + 104LL);
  if (v7 >= 0x10) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, malloc_type_id_t))(v6 + 160))(v6, size, type_id);
  }
  if (v7 > 0xC) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t))(v6 + 24))(v6, size);
  }
  else {
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
  }
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_slowpath == 0;
  }
  if (!v6) {
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
  }
  uint64_t v7 = *(void *)malloc_zones;
  unsigned int v8 = *(_DWORD *)(*(void *)malloc_zones + 104LL);
  if (v8 >= 0x10) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t, malloc_type_id_t))(v7 + 168))( v7,  count,  size,  type_id);
  }
  if (v8 > 0xC) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t))(v7 + 32))(v7, count, size);
  }
  else {
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
  }
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_slowpath == 0;
  }
  if (!v6 || malloc_absolute_max_size < size) {
    return _malloc_type_realloc_outlined(ptr, size, type_id);
  }
  if (ptr && size)
  {
    registered_zone = find_registered_zone((uint64_t)ptr, 0LL, 0);
    if (!registered_zone) {
      JUMPOUT(0x1803E8558LL);
    }
    if (registered_zone == default_zone) {
      registered_zone = *(void **)malloc_zones;
    }
    if (*((_DWORD *)registered_zone + 26) >= 0x10u)
    {
      uint64_t v9 = (*((uint64_t (**)(void *, void *, size_t, malloc_type_id_t))registered_zone + 22))( registered_zone,  ptr,  size,  type_id);
      goto LABEL_24;
    }

    int v12 = (uint64_t (*)(void))*((void *)registered_zone + 7);
LABEL_22:
    uint64_t v9 = v12();
    goto LABEL_24;
  }

  uint64_t v10 = *(void *)malloc_zones;
  unsigned int v11 = *(_DWORD *)(*(void *)malloc_zones + 104LL);
  if (v11 >= 0x10)
  {
    int v12 = *(uint64_t (**)(void))(v10 + 160);
    goto LABEL_22;
  }

  if (v11 > 0xC) {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, size_t))(v10 + 24))(v10, size);
  }
  else {
    uint64_t v9 = _malloc_type_malloc_outlined(size, type_id, 0);
  }
LABEL_24:
  BOOL v13 = (void *)v9;
  if (v9)
  {
    if (!size) {
      _free(ptr);
    }
  }

  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }

  return v13;
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v3 = *(void *)(StatusReg + 904);
  if (type_id <= 1) {
    malloc_type_id_t v4 = 1LL;
  }
  else {
    malloc_type_id_t v4 = type_id;
  }
  *(void *)(StatusReg + 904) = v4;
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t result = j__valloc(size);
  }
  else {
    uint64_t result = (void *)_malloc_zone_valloc((uint64_t)default_zone, size, 1);
  }
  *(void *)(StatusReg + 904) = v3;
  return result;
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = malloc_slowpath == 0;
  }
  BOOL v4 = v3 && malloc_absolute_max_size >= size;
  if (!v4 || alignment < 8) {
    return (void *)_malloc_type_aligned_alloc_outlined(alignment, size, type_id);
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)alignment);
  v5.i16[0] = vaddlv_u8(v5);
  BOOL v6 = *(_DWORD *)(*(void *)malloc_zones + 104LL) < 0x10u || v5.u32[0] > 1uLL;
  if (v6 || ((alignment - 1) & size) != 0) {
    return (void *)_malloc_type_aligned_alloc_outlined(alignment, size, type_id);
  }
  uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)malloc_zones + 184LL))();
  if (!result) {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return result;
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = malloc_slowpath == 0;
  }
  BOOL v6 = v5 && malloc_absolute_max_size >= size;
  if (!v6 || alignment < 8) {
    return _malloc_type_posix_memalign_outlined(memptr, alignment, size, type_id);
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)alignment);
  v7.i16[0] = vaddlv_u8(v7);
  if (*(_DWORD *)(*(void *)malloc_zones + 104LL) < 0x10u || v7.u32[0] > 1uLL) {
    return _malloc_type_posix_memalign_outlined(memptr, alignment, size, type_id);
  }
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)malloc_zones + 184LL))();
  if (!v9) {
    return 12;
  }
  uint64_t v10 = (void *)v9;
  int result = 0;
  *memptr = v10;
  return result;
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = malloc_slowpath == 0;
  }
  if (!v3 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  unsigned int version = zone->version;
  if (version >= 0x10) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, malloc_type_id_t))zone[1].size)( zone,  size,  type_id);
  }
  if (version > 0xC) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t))zone->malloc)(zone, size);
  }
  else {
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
  }
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4) {
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  unsigned int version = zone->version;
  if (version >= 0x10) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t, malloc_type_id_t))zone[1].malloc)( zone,  count,  size,  type_id);
  }
  if (version > 0xC) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t))zone->calloc)(zone, count, size);
  }
  else {
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
  }
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_realloc_outlined(zone, ptr, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  if (zone->version < 0x10) {
    return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, type_id);
  }
  else {
    return (void *)((uint64_t (*)(malloc_zone_t *, void *, size_t, malloc_type_id_t))zone[1].calloc)( zone,  ptr,  size,  type_id);
  }
}

void *__cdecl malloc_type_zone_valloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (type_id <= 1) {
    malloc_type_id_t v5 = 1LL;
  }
  else {
    malloc_type_id_t v5 = type_id;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    int result = j__malloc_zone_valloc(zone, size);
  }
  else {
    int result = (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  if (alignment >= 8
    && zone->version >= 0x10
    && (uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)alignment), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] <= 1uLL))
  {
    return (void *)((uint64_t (*)(void))zone[1].valloc)();
  }

  else
  {
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  }

uint64_t _malloc_type_malloc_outlined(size_t __size, unint64_t a2, int a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a2 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a2;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (!v6 || a3 == 0) {
    uint64_t result = _malloc_zone_malloc((uint64_t)default_zone, __size, 1);
  }
  else {
    uint64_t result = (uint64_t)j__malloc(__size);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_calloc_outlined(size_t __count, size_t __size, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__calloc(__count, __size);
  }
  else {
    uint64_t result = _malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1LL);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

void *_malloc_type_realloc_outlined(void *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = j__realloc(a1, a2);
  }
  else {
    uint64_t result = _realloc(a1, a2);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_aligned_alloc_outlined(size_t __alignment, size_t __size, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__aligned_alloc(__alignment, __size);
  }
  else {
    uint64_t result = _malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3LL, 0LL);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_posix_memalign_outlined(void **a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = j__posix_memalign(a1, a2, a3);
  }
  else {
    uint64_t result = _posix_memalign((uint64_t *)a1, a2, a3);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_malloc_outlined(malloc_zone_t *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__malloc_zone_malloc(a1, a2);
  }
  else {
    uint64_t result = _malloc_zone_malloc((uint64_t)a1, a2, 0);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_zone_calloc_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_calloc(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_calloc((uint64_t)a1, a2, a3, 0LL);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_realloc_outlined(malloc_zone_t *a1, void *a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_realloc(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_realloc((uint64_t)a1, (uint64_t)a2, a3, 0LL);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_memalign_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_memalign(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_memalign((uint64_t)a1, a2, a3, 0LL, 0LL);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t malloc_type_zone_malloc_with_options_np( malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  return malloc_type_zone_malloc_with_options_internal(a1, a2, a3, a5, a4);
}

uint64_t malloc_type_zone_malloc_with_options_internal( malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4, uint64_t a5)
{
  if (!a2 || (a2 & (a2 - 1)) == 0 && ((a2 - 1) & a3) == 0)
  {
    if (malloc_logger) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = malloc_slowpath == 0;
    }
    if (!v5) {
      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    }
    if (default_zone == (_UNKNOWN *)a1)
    {
      a1 = *(malloc_zone_t **)malloc_zones;
      if (*(void *)malloc_zones) {
        goto LABEL_12;
      }
    }

    else if (a1)
    {
LABEL_12:
      if (a1->version >= 0x10)
      {
        free = (uint64_t (*)(void))a1[1].free;
        if (free) {
          return free();
        }
      }

      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    }

    a1 = *(malloc_zone_t **)malloc_zones;
    goto LABEL_12;
  }

  return 0LL;
}

uint64_t _malloc_type_zone_malloc_with_options_np_outlined( malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v6 = *(void *)(StatusReg + 904);
  if (a5 <= 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = a5;
  }
  *(void *)(StatusReg + 904) = v7;
  uint64_t result = _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  *(void *)(StatusReg + 904) = v6;
  return result;
}

uint64_t set_msl_lite_hooks(uint64_t (*a1)(uint64_t (**)(), uint64_t))
{
  return a1(malloc_msl_lite_hooks, 24LL);
}

void insert_msl_lite_zone(uint64_t a1)
{
  lite_zone = a1;
  malloc_slowpath_update();
}

uint64_t get_global_helper_zone()
{
  return *(void *)malloc_zones;
}

uint64_t mfm_lock()
{
  uint64_t result = mfm_arena;
  if (mfm_arena) {
    return os_unfair_lock_lock_with_options();
  }
  return result;
}

void mfm_unlock()
{
  if (mfm_arena) {
    os_unfair_lock_unlock((os_unfair_lock_t)mfm_arena);
  }
}

void mfm_reinit_lock()
{
  if (mfm_arena) {
    *(_DWORD *)mfm_arena = 0;
  }
}

uint64_t mfm_initialize()
{
  mach_vm_address_t pages_plat = mvm_allocate_pages_plat(0x800000uLL, 0, 1073741827, 1);
  if (!pages_plat) {
    mfm_initialize_cold_1();
  }
  unint64_t v1 = pages_plat;
  mach_vm_address_t address = pages_plat;
  uint64_t result = mach_vm_map(*MEMORY[0x1895FFD48], &address, 0x800000uLL, 0LL, 117456896, 0, 0LL, 0, 3, 7, 1u);
  if ((_DWORD)result) {
    mfm_initialize_cold_2(result);
  }
  *(_DWORD *)unint64_t v1 = 0;
  *(void *)(v1 + 216) = 0x8000000000000000LL;
  for (unint64_t i = 2LL; i != 13; ++i)
    *(int64x2_t *)(v1 + 16 * i) = vdupq_n_s64(i);
  *(void *)(v1 + 224) |= 1uLL;
  atomic_store(v1, &mfm_arena);
  return result;
}

uint64_t mfm_alloc_size(unint64_t a1)
{
  unint64_t v1 = mfm_arena + 0x20000;
  if (mfm_arena) {
    BOOL v2 = v1 > a1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  if ((a1 & 0xF) == 0 && mfm_arena + 0x800000 > a1)
  {
    unint64_t v4 = (uint64_t)(a1 - v1) >> 4;
    if ((*(void *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0LL)) & (1LL << v4) & *(void *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8))) != 0)
    {
      unint64_t v5 = v4 + 1;
      unint64_t v6 = v5 >> 5;
      uint64_t v7 = (v5 >> 5) & 0x7FFFFFFFFFFFFFELL;
      uint64_t v8 = mfm_arena + 8 * v7;
      unint64_t v9 = *(void *)(v8 + 224) >> v5;
      if (v9)
      {
        unint64_t v10 = __clz(__rbit64(v9));
      }

      else
      {
        unint64_t v13 = v5 & 0x3F;
        unint64_t v14 = *(void *)(v8 + 240);
        if (v14)
        {
          unint64_t v11 = __clz(__rbit64(v14)) - v13 + 65;
          return 16 * v11;
        }

        unint64_t v15 = *(void *)(mfm_arena + ((8 * v6) | 8) + 224);
        if (v13 < 0x2E) {
          LODWORD(v16) = 0;
        }
        else {
          uint64_t v16 = *(void *)(mfm_arena + 8 * v7 + 248);
        }
        unint64_t v10 = ((v15 >> v13) | ((unint64_t)(2 * v16) << (v13 ^ 0x3Fu))) & 0x7FFFF;
      }

      unint64_t v11 = v10 + 1;
      return 16 * v11;
    }

    return 0LL;
  }

  return v3;
}

uint64_t *mfm_alloc(unint64_t a1)
{
  uint64_t v1 = mfm_arena;
  if (a1 > 0x4000) {
    return 0LL;
  }
  if (a1)
  {
    if ((a1 & 0xF) != 0) {
      unint64_t v3 = (a1 >> 4) + 1;
    }
    else {
      unint64_t v3 = a1 >> 4;
    }
    os_unfair_lock_lock_with_options();
    LODWORD(v4) = 64 - __clz(v3 - 1);
    else {
      uint64_t v4 = v4;
    }
    if (v3 < 2)
    {
      unint64_t v3 = 1LL;
      uint64_t v4 = 0LL;
    }
  }

  else
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = 0LL;
    unint64_t v3 = 1LL;
  }

  uint64_t v5 = v1 + 32;
  uint64_t v6 = 16 * v4;
  while (1)
  {
    uint64_t v7 = *(void *)(v5 + v6);
    BOOL v2 = (uint64_t *)(v1 + 16 * v7);
    v6 += 16LL;
    if (v6 == 176)
    {
      uint64_t v8 = mfm_arena;
      unint64_t v9 = *(void *)(mfm_arena + 8);
      if (v3 >= 516096 - v9)
      {
        BOOL v2 = 0LL;
      }

      else
      {
        unint64_t v10 = v9 + v3;
        *(void *)(v1 + 16 * ((v9 + v3) >> 6) + 224) |= 1LL << (v9 + v3);
        if (v3 > 0x3F)
        {
          __mfm_block_set_sizes(v1, 1, v9, v3);
          uint64_t v8 = mfm_arena;
          unint64_t v10 = *(void *)(mfm_arena + 8) + v3;
        }

        else
        {
          uint64_t v11 = v1 + 224;
          *(void *)(v11 + ((v9 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v1
                                                                                + 224
                                                                                + ((v9 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) | (1LL << v9);
          *(void *)(v11 + (((v3 + v9 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v1
                                                                                           + 224
                                                                                           + (((v3 + v9 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) | (1LL << (v3 + v9 - 1));
        }

        *(void *)(v8 + 8) = v10;
        *(_DWORD *)(v1 + 4) += v3;
        ++*(void *)(v1 + 24);
        BOOL v2 = (uint64_t *)(v1 + 16 * v9 + 0x20000);
        if (*(void *)(v8 + 16) < v10) {
          *(void *)(v8 + 16) = v10;
        }
      }

      goto LABEL_31;
    }
  }

  uint64_t v12 = 16 * v7;
  uint64_t v13 = *v2;
  uint64_t v14 = v2[1];
  *(void *)(v1 + 16 * *v2 + 8) = v14;
  *(void *)(v1 + 16 * v14) = v13;
  *BOOL v2 = 0LL;
  v2[1] = 0LL;
  unint64_t v15 = v12 - 0x20000;
  unint64_t v16 = (v12 - 0x20000) >> 4;
  unint64_t v17 = (v16 + 1) >> 5;
  uint64_t v18 = v17 & 0x7FFFFFFFFFFFFFELL;
  unint64_t v19 = v1 + 8 * (v17 & 0x7FFFFFFFFFFFFFELL);
  unint64_t v20 = *(void *)(v19 + 224) >> (v16 + 1);
  if (v20)
  {
    unint64_t v21 = __clz(__rbit64(v20));
LABEL_24:
    unint64_t v22 = v21 + 1;
    goto LABEL_25;
  }

  unint64_t v25 = ((_BYTE)v16 + 1) & 0x3F;
  unint64_t v26 = *(void *)(v19 + 240);
  if (!v26)
  {
    unint64_t v27 = *(void *)(v1 + ((8 * v17) | 8) + 224);
    if (v25 < 0x2E) {
      LODWORD(v28) = 0;
    }
    else {
      uint64_t v28 = *(void *)(v1 + 8 * v18 + 248);
    }
    unint64_t v21 = ((v27 >> v25) | ((unint64_t)(2 * v28) << (v25 ^ 0x3Fu))) & 0x7FFFF;
    goto LABEL_24;
  }

  unint64_t v22 = __clz(__rbit64(v26)) - v25 + 65;
LABEL_25:
  if (v22 > v3)
  {
    *(void *)(v1 + 16 * ((v16 + v3) >> 6) + 224) |= 1LL << (v16 + v3);
    __mfm_free_block(v1, v16 + v3, v22 - v3);
  }

  if (v3 > 0x3F)
  {
    __mfm_block_set_sizes(v1, 1, v16, v3);
  }

  else
  {
    uint64_t v23 = v1 + 224;
    *(void *)(v23 + ((v16 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v1
                                                                           + 224
                                                                           + ((v16 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) | (1LL << (v15 >> 4));
    *(void *)(v23 + (((v3 + v16 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v1
                                                                                      + 224
                                                                                      + (((v3 + v16 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) | (1LL << (v3 + v16 - 1));
  }

  *(_DWORD *)(v1 + 4) += v3;
  ++*(void *)(v1 + 24);
LABEL_31:
  os_unfair_lock_unlock((os_unfair_lock_t)v1);
  return v2;
}

uint64_t __mfm_free_block(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a2 & 0x3F;
  if (a3 > 0x3F)
  {
    unint64_t v10 = a3 - 1;
    *(void *)(result + ((8 * (a2 >> 5)) | 8) + 224) = *(void *)(result + ((8 * (a2 >> 5)) | 8) + 224) & ~(0xFFFFFLL << v3) | ((2 * (a3 - 1)) << v3);
    if (v3 >= 0x2D) {
      *(void *)(result + 8 * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(void *)(result
    }
                                                                                    + 8
                                                                                    * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                    + 248) & ~(0x7FFFFuLL >> (v3 ^ 0x3Fu)) | ((v10 & 0x7FFFFFFFFFFFFFFFLL) >> (v3 ^ 0x3Fu));
    unint64_t v11 = (v10 + a2) >> 6;
    unint64_t v12 = (v10 + a2) & 0x3F;
    uint64_t v13 = 0xFFFFFLL << (v12 + 45);
    unint64_t v14 = 0x7FFFFuLL >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      unint64_t v14 = 0xFFFFFLL << (v12 + 45);
      uint64_t v13 = 0LL;
    }

    unint64_t v15 = v10 << (v12 + 45);
    unint64_t v16 = v10 >> 1 >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      unint64_t v16 = v15;
      unint64_t v15 = 0LL;
    }

    if (v12 >= 0x13)
    {
      uint64_t v17 = 2 * v11;
    }

    else
    {
      uint64_t v17 = 2 * v11;
      *(void *)(result + 16 * v11 + 216) = *(void *)(result + 16 * v11 + 216) & ~v13 | v15;
    }

    *(void *)(result + ((8 * v17) | 8) + 224) = *(void *)(result + ((8 * v17) | 8) + 224) & ~v14 | v16;
  }

  else
  {
    uint64_t v4 = result + 224;
    *(void *)(v4 + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(result
                                                                         + 224
                                                                         + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) & ~(1LL << v3);
    *(void *)(v4 + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(result
                                                                                    + 224
                                                                                    + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) & ~(1LL << (a3 + a2 - 1));
  }

  LODWORD(v5) = 63 - __clz(a3);
  else {
    uint64_t v5 = v5;
  }
  uint64_t v6 = result + 16LL * v5;
  uint64_t v7 = 16 * a2 + 0x20000;
  uint64_t v8 = (void *)(v7 + result);
  uint64_t v9 = *(void *)(v6 + 32);
  v7 >>= 4;
  *uint64_t v8 = v9;
  v8[1] = v5 + 2;
  *(void *)(v6 + 32) = v7;
  *(void *)(result + 16 * v9 + 8) = v7;
  return result;
}

void mfm_free(void *a1)
{
  uint64_t v2 = mfm_arena;
  unint64_t v3 = mfm_arena + 0x20000;
  if (mfm_arena) {
    BOOL v4 = v3 > (unint64_t)a1;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v6 = (uint64_t)((uint64_t)a1 - v3) >> 4;
  unint64_t v7 = mfm_arena + 224;
  uint64_t v8 = (v6 >> 5) | 1;
  if ((*(void *)(mfm_arena + 224 + 8 * ((v6 >> 5) & 0x7FFFFFFFFFFFFFELL)) & *(void *)(mfm_arena + 224 + 8 * v8) & (1LL << v6)) == 0) {
    mfm_free_cold_1((uint64_t)a1);
  }
  unint64_t v9 = (v6 + 1) & 0x3F;
  unint64_t v10 = (v6 + 1) >> 5;
  uint64_t v11 = v10 & 0x7FFFFFFFFFFFFFELL;
  unint64_t v12 = mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL);
  unint64_t v14 = *(void *)(v12 + 224);
  uint64_t v13 = (void *)(v12 + 224);
  unint64_t v15 = v14 >> (v6 + 1);
  if (v15)
  {
    unint64_t v16 = __clz(__rbit64(v15));
  }

  else
  {
    unint64_t v47 = *(void *)(mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL) + 240);
    if (v47)
    {
      unint64_t v17 = __clz(__rbit64(v47)) - v9 + 65;
      goto LABEL_14;
    }

    if (v9 < 0x2E) {
      LODWORD(v52) = 0;
    }
    else {
      uint64_t v52 = *(void *)(mfm_arena + 8 * v11 + 248);
    }
    unint64_t v16 = ((*(void *)(mfm_arena + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v52) << (v9 ^ 0x3Fu))) & 0x7FFFF;
  }

  unint64_t v17 = v16 + 1;
LABEL_14:
  bzero(a1, 16 * v17);
  os_unfair_lock_lock_with_options();
  uint64_t v19 = 1LL << v6;
  uint64_t v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
  uint64_t v20 = *(void *)(v7 + 8 * v18);
  if ((v20 & *(void *)(v7 + 8 * v8) & (1LL << v6)) == 0
    || ((unint64_t v21 = *v13 >> v9) == 0
      ? ((unint64_t v48 = *(void *)(v2 + 8 * v11 + 240)) == 0
       ? (v9 < 0x2E ? (LODWORD(v53) = 0) : (uint64_t v53 = *(void *)(v2 + 8 * v11 + 248)),
          uint64_t v22 = (((*(void *)(v2 + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v53) << (v9 ^ 0x3Fu))) & 0x7FFFF)
              + 1LL,
          uint64_t v19 = 1LL << v6,
          uint64_t v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL)
       : (uint64_t v22 = __clz(__rbit64(v48)) - v9 + 65))
      : (uint64_t v22 = __clz(__rbit64(v21)) + 1),
        v17 != v22))
  {
    mfm_free_cold_2((uint64_t)a1);
  }

  *(_DWORD *)(v2 + 4) -= v17;
  --*(void *)(v2 + 24);
  uint64_t v23 = (uint64_t)(v6 - 1) >> 5;
  unint64_t v24 = *(void *)(v7 + ((8 * v23) | 8));
  if (((v24 >> (v6 - 1)) & 1) == 0)
  {
    unint64_t v25 = ((_BYTE)v6 - 1) & 0x3F;
    unint64_t v26 = v23 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v27 = v2 + 8 * v26;
    unint64_t v28 = *(void *)(v27 + 224) << (v25 ^ 0x3Fu);
    if (v28)
    {
      uint64_t v29 = __clz(v28) + 1;
    }

    else
    {
      unint64_t v49 = *(void *)(v27 + 208);
      if (v49)
      {
        uint64_t v29 = v25 + __clz(v49) + 2;
      }

      else
      {
        if (v25 > 0x12) {
          unint64_t v54 = 0LL;
        }
        else {
          unint64_t v54 = *(void *)(v2 + 8 * v26 + 216);
        }
        char v57 = v25 + 45;
        uint64_t v58 = ((2 * v24) << ~v57) | (v54 >> v57);
        unint64_t v59 = v24 >> v57;
        if ((v57 & 0x40) == 0) {
          LODWORD(v59) = v58;
        }
        uint64_t v29 = (v59 & 0x7FFFF) + 1;
        uint64_t v19 = 1LL << v6;
        uint64_t v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
      }
    }

    v6 -= v29;
    *(void *)(v2 + 8 * v18 + 224) = v20 & ~v19;
    unint64_t v30 = (uint64_t *)(v2 + 16 * v6 + 0x20000);
    uint64_t v31 = *v30;
    uint64_t v32 = *(void *)(v2 + 16 * v6 + 131080);
    *(void *)(v2 + 16 * *v30 + 8) = v32;
    *(void *)(v2 + 16 * v32) = v31;
    *unint64_t v30 = 0LL;
    v30[1] = 0LL;
    v17 += v29;
  }

  unint64_t v33 = v6 + v17;
  unint64_t v34 = *(void *)(v2 + 8);
  if (v6 + v17 < v34)
  {
    uint64_t v35 = (v33 >> 5) & 0x7FFFFFFFFFFFFFELL;
    uint64_t v36 = *(void *)(v7 + 8 * v35);
    if ((v36 & (1LL << v33) & *(void *)(v7 + ((8 * (v33 >> 5)) | 8))) == 0)
    {
      unint64_t v37 = (v33 + 1) >> 5;
      uint64_t v38 = v37 & 0x7FFFFFFFFFFFFFELL;
      unint64_t v39 = v2 + 8 * (v37 & 0x7FFFFFFFFFFFFFELL);
      unint64_t v40 = *(void *)(v39 + 224) >> (v33 + 1);
      if (v40)
      {
        unint64_t v41 = __clz(__rbit64(v40));
      }

      else
      {
        unint64_t v50 = ((_BYTE)v33 + 1) & 0x3F;
        unint64_t v51 = *(void *)(v39 + 240);
        if (v51)
        {
          unint64_t v42 = __clz(__rbit64(v51)) - v50 + 65;
          goto LABEL_27;
        }

        unint64_t v55 = *(void *)(v2 + ((8 * v37) | 8) + 224);
        if (v50 < 0x2E) {
          LODWORD(v56) = 0;
        }
        else {
          uint64_t v56 = *(void *)(v2 + 8 * v38 + 248);
        }
        unint64_t v41 = ((v55 >> v50) | ((unint64_t)(2 * v56) << (v50 ^ 0x3Fu))) & 0x7FFFF;
      }

      unint64_t v42 = v41 + 1;
LABEL_27:
      *(void *)(v2 + 8 * v35 + 224) = v36 & ~(1LL << v33);
      BOOL v43 = (void *)(v2 + 16 * v33 + 0x20000);
      uint64_t v44 = v43[1];
      uint64_t v45 = v2 + 16LL * *v43;
      *(void *)(v2 + 16 * v44) = *v43;
      *(void *)(v45 + 8) = v44;
      *BOOL v43 = 0LL;
      v43[1] = 0LL;
      v17 += v42;
      unint64_t v34 = *(void *)(v2 + 8);
      unint64_t v33 = v17 + v6;
    }
  }

  if (v33 == v34)
  {
    *(void *)(v2 + 16 * (v34 >> 6) + 224) &= ~(1LL << v34);
    if (v17 > 0x3F)
    {
      __mfm_block_set_sizes(v2, 0, v6, v17);
    }

    else
    {
      uint64_t v46 = v2 + 224;
      *(void *)(v46 + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v2
                                                                            + 224
                                                                            + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) & ~(1LL << v6);
      *(void *)(v46 + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) = *(void *)(v2
                                                                                        + 224
                                                                                        + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8)) & ~(1LL << (v6 + v17 - 1));
    }

    *(void *)(v2 + 8) = v6;
  }

  else
  {
    __mfm_free_block(v2, v6, v17);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

BOOL mfm_claimed_address(unint64_t a1)
{
  if (mfm_arena) {
    BOOL v1 = mfm_arena + 0x20000 > a1;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1 && mfm_arena + 0x800000 > a1;
}

uint64_t mfm_zone_address()
{
  return mfm_arena;
}

uint64_t mfmi_enumerator( uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t v30 = *MEMORY[0x1895FEE08];
  uint64_t result = mfmi_read_zone(a1, a4, a5, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v28 = a4;
    uint64_t v29 = 0x20000LL;
    a6(a1, a2, 4LL, &v28, 1LL);
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 1) == 0) {
        return 0LL;
      }
      goto LABEL_8;
    }
  }

  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }

  uint64_t v28 = a4 + 0x20000;
  uint64_t v29 = 8257536LL;
  a6(a1, a2, 2LL, &v28, 1LL);
  if ((a3 & 1) == 0) {
    return 0LL;
  }
LABEL_8:
  uint64_t v12 = v27;
  if (!*(void *)(v27 + 8)) {
    return 0LL;
  }
  unint64_t v13 = 0LL;
  unsigned int v14 = 0;
  do
  {
    unint64_t v15 = (v13 + 1) >> 5;
    uint64_t v16 = v15 & 0x7FFFFFFFFFFFFFELL;
    uint64_t v17 = v12 + 8 * (v15 & 0x7FFFFFFFFFFFFFELL);
    unint64_t v18 = *(void *)(v17 + 224) >> (v13 + 1);
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
LABEL_12:
      unint64_t v20 = v19 + 1;
      goto LABEL_13;
    }

    unint64_t v23 = ((_BYTE)v13 + 1) & 0x3F;
    unint64_t v24 = *(void *)(v17 + 240);
    if (!v24)
    {
      unint64_t v25 = *(void *)(v12 + ((8 * v15) | 8) + 224);
      if (v23 < 0x2E) {
        LODWORD(v26) = 0;
      }
      else {
        uint64_t v26 = *(void *)(v12 + 8 * v16 + 248);
      }
      unint64_t v19 = ((v25 >> v23) | ((unint64_t)(2 * v26) << (v23 ^ 0x3Fu))) & 0x7FFFF;
      goto LABEL_12;
    }

    unint64_t v20 = __clz(__rbit64(v24)) - v23 + 65;
LABEL_13:
    if ((*(void *)(v12 + 224 + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0LL)) & (1LL << v13) & *(void *)(v12
                                                                                                  + 224
                                                                                                  + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8))) != 0)
    {
      uint64_t v21 = v12;
      if (v14 == 32)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1LL, &v28);
        unsigned int v14 = 0;
        uint64_t v21 = v27;
      }

      uint64_t v22 = &v28 + 2 * v14;
      *uint64_t v22 = v12 + 16 * v13 + 0x20000 + a4 - v21;
      v22[1] = 16 * v20;
      ++v14;
      uint64_t v12 = v21;
    }

    v13 += v20;
  }

  while (v13 < *(void *)(v12 + 8));
  if (v14) {
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1LL, &v28);
  }
  return 0LL;
}

unint64_t mfmi_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x4000) {
    return 0LL;
  }
  else {
    return (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
}

uint64_t mfmi_check()
{
  return 1LL;
}

void mfmi_print_self(uint64_t a1, int a2)
{
  uint64_t v2 = mfm_arena;
  if (mfm_arena)
  {
    malloc_report_simple((uint64_t)"mfm_arena info\n");
    malloc_report_simple((uint64_t)" address      : %p\n");
    malloc_report_simple((uint64_t)" size         : %zd\n");
    malloc_report_simple((uint64_t)" high water   : %zd\n");
    malloc_report_simple((uint64_t)" arena        : [%p, %p)\n");
    malloc_report_simple((uint64_t)"\n");
    malloc_report_simple((uint64_t)"freelists\n");
    for (uint64_t i = 0LL; i != 11; ++i)
    {
      uint64_t v5 = v2 + 16 * i;
      malloc_report_simple((uint64_t)" size %-8zd:\n");
      uint64_t v8 = *(void *)(v5 + 32);
      unint64_t v7 = (uint64_t *)(v5 + 32);
      for (uint64_t j = v8; ; uint64_t j = *v9)
      {
        unint64_t v9 = (uint64_t *)(v2 + 16 * j);
        if (v9 == v7) {
          break;
        }
        malloc_report_simple((uint64_t)"  [%p, %p) size=%zd\n");
      }
    }

    malloc_report_simple((uint64_t)"\n");
    if (a2)
    {
      malloc_report_simple((uint64_t)"blocks\n");
      if (*(void *)(v2 + 8))
      {
        unint64_t v10 = 0LL;
        do
        {
          unint64_t v11 = (v10 + 1) >> 5;
          uint64_t v12 = v11 & 0x7FFFFFFFFFFFFFELL;
          unint64_t v13 = v2 + 8 * (v11 & 0x7FFFFFFFFFFFFFELL);
          unint64_t v14 = *(void *)(v13 + 224) >> (v10 + 1);
          if (v14)
          {
            unint64_t v15 = __clz(__rbit64(v14));
          }

          else
          {
            unint64_t v17 = ((_BYTE)v10 + 1) & 0x3F;
            unint64_t v18 = *(void *)(v13 + 240);
            if (v18)
            {
              unint64_t v16 = __clz(__rbit64(v18)) - v17 + 65;
              goto LABEL_13;
            }

            unint64_t v19 = *(void *)(v2 + ((8 * v11) | 8) + 224);
            if (v17 < 0x2E) {
              LODWORD(v20) = 0;
            }
            else {
              uint64_t v20 = *(void *)(v2 + 8 * v12 + 248);
            }
            unint64_t v15 = ((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu))) & 0x7FFFF;
          }

          unint64_t v16 = v15 + 1;
LABEL_13:
          malloc_report_simple((uint64_t)" %c[%p, %p) size=%zd\n");
          v10 += v16;
        }

        while (v10 < *(void *)(v2 + 8));
      }

      malloc_report_simple((uint64_t)"  [%p, %p) size=%zd (bump)\n");
      malloc_report_simple((uint64_t)"\n");
    }
  }

uint64_t mfmi_force_lock()
{
  uint64_t result = mfm_arena;
  if (mfm_arena) {
    return os_unfair_lock_lock_with_options();
  }
  return result;
}

void mfmi_force_unlock()
{
  if (mfm_arena) {
    os_unfair_lock_unlock((os_unfair_lock_t)mfm_arena);
  }
}

void mfmi_statistics_self(int a1, _DWORD *a2)
{
  uint64_t v3 = mfm_arena;
  bzero(a2, 0x20uLL);
  if (v3)
  {
    unint64_t v4 = *(void *)(v3 + 16);
    *a2 = *(void *)(v3 + 24);
    uint64_t v5 = 16LL * *(unsigned int *)(v3 + 4);
    *((void *)a2 + 3) = 0x800000LL;
    uint64_t v6 = ((((v4 >> 2) & 0x1FFFFFFFFFFFFFF8LL) + *MEMORY[0x189600148] + 223) & -*MEMORY[0x189600148])
       + *((void *)a2 + 2)
       + ((*MEMORY[0x189600148] + 16 * v4 - 1) & -*MEMORY[0x189600148]);
    *((void *)a2 + 1) = v5;
    *((void *)a2 + 2) = v6;
  }

BOOL mfmi_locked()
{
  uint64_t v0 = (os_unfair_lock_s *)mfm_arena;
  if (!mfm_arena) {
    return 0LL;
  }
  BOOL result = os_unfair_lock_trylock((os_unfair_lock_t)mfm_arena);
  if (result)
  {
    os_unfair_lock_unlock(v0);
    return 1LL;
  }

  return result;
}

void mfmi_reinit_lock()
{
  if (mfm_arena) {
    *(_DWORD *)mfm_arena = 0;
  }
}

uint64_t mfmi_print_task( uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t (*a5)(const char *, ...))
{
  else {
    return print_mfm_arena(v9, a2 > 1, (void (*)(const char *, ...))a5);
  }
}

void mfmi_statistics_task( uint64_t a1, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void *a4)
{
  int v5 = mfmi_read_zone(a1, a2, a3, &v9);
  bzero(a4, 0x20uLL);
  if (!v5)
  {
    uint64_t v6 = v9;
    unint64_t v7 = *(void *)(v9 + 16);
    *(_DWORD *)a4 = *(void *)(v9 + 24);
    a4[3] = 0x800000LL;
    uint64_t v8 = ((((v7 >> 2) & 0x1FFFFFFFFFFFFFF8LL) + *MEMORY[0x189600148] + 223) & -*MEMORY[0x189600148])
       + a4[2]
       + ((*MEMORY[0x189600148] + 16 * v7 - 1) & -*MEMORY[0x189600148]);
    a4[1] = 16LL * *(unsigned int *)(v6 + 4);
    a4[2] = v8;
  }

uint64_t __mfm_block_set_sizes(uint64_t result, int a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - 1;
  *(void *)(result + ((8 * (a3 >> 5)) | 8) + 224) = *(void *)(result + ((8 * (a3 >> 5)) | 8) + 224) & ~(0xFFFFFLL << a3) | ((a2 & 1 | (unint64_t)(2 * (a4 - 1))) << a3);
  if ((a3 & 0x3F) >= 0x2D) {
    *(void *)(result + 8 * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(void *)(result
  }
                                                                                  + 8
                                                                                  * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                  + 248) & ~(0x7FFFFuLL >> (a3 & 0x3F ^ 0x3F)) | ((v4 & 0x7FFFFFFFFFFFFFFFuLL) >> (a3 & 0x3F ^ 0x3F));
  unint64_t v5 = (v4 + a3) >> 6;
  unint64_t v6 = (v4 + a3) & 0x3F;
  uint64_t v7 = 0x80000LL;
  if (!a2) {
    uint64_t v7 = 0LL;
  }
  unint64_t v8 = v4 + v7;
  uint64_t v9 = 0xFFFFFLL << (v6 + 45);
  unint64_t v10 = 0x7FFFFuLL >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    unint64_t v10 = 0xFFFFFLL << (v6 + 45);
    uint64_t v9 = 0LL;
  }

  uint64_t v11 = v8 << (v6 + 45);
  unint64_t v12 = v8 >> 1 >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    unint64_t v12 = v11;
    uint64_t v11 = 0LL;
  }

  if (v6 >= 0x13)
  {
    uint64_t v13 = 2 * v5;
  }

  else
  {
    uint64_t v13 = 2 * v5;
    *(void *)(result + 16 * v5 + 216) = *(void *)(result + 16 * v5 + 216) & ~v9 | v11;
  }

  *(void *)(result + ((8 * v13) | 8) + 224) = *(void *)(result + ((8 * v13) | 8) + 224) & ~v10 | v12;
  return result;
}

uint64_t mfmi_read_zone( uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void *a4)
{
  unint64_t v5 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
      }
    }

    unint64_t v5 = _malloc_default_reader_1;
  }

  return v5(task, a2, 0x800000LL, a4);
}

uint64_t _malloc_default_reader_1(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t print_mfm_arena(uint64_t a1, char a2, void (*a3)(const char *, ...))
{
  for (uint64_t i = 0LL; i != 11; ++i)
  {
    uint64_t v6 = a1 + 16 * i;
    a3(" size %-8zd:\n", 16LL << i);
    uint64_t v9 = *(void *)(v6 + 32);
    uint64_t v8 = (uint64_t *)(v6 + 32);
    for (uint64_t j = v9; ; uint64_t j = *v10)
    {
      uint64_t v10 = (uint64_t *)(a1 + 16 * j);
      if (v10 == v8) {
        break;
      }
      unint64_t v11 = ((16 * j - 0x20000) >> 4) + 1;
      unint64_t v12 = v11 >> 5;
      uint64_t v13 = (v11 >> 5) & 0x7FFFFFFFFFFFFFELL;
      uint64_t v14 = a1 + 8 * v13;
      unint64_t v15 = *(void *)(v14 + 224) >> v11;
      if (v15)
      {
        unint64_t v16 = __clz(__rbit64(v15)) + 1;
LABEL_6:
        a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v16], 16 * v16);
        continue;
      }

      unint64_t v17 = v11 & 0x3F;
      unint64_t v18 = *(void *)(v14 + 240);
      if (v18)
      {
        unint64_t v16 = __clz(__rbit64(v18)) - v17 + 65;
        goto LABEL_6;
      }

      unint64_t v19 = *(void *)(a1 + ((8 * v12) | 8) + 224);
      if (v17 < 0x2E) {
        LODWORD(v20) = 0;
      }
      else {
        uint64_t v20 = *(void *)(a1 + 8 * v13 + 248);
      }
      a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v21], 16 * v21);
    }
  }

  uint64_t result = ((uint64_t (*)(const char *))a3)("\n");
  if ((a2 & 1) != 0)
  {
    a3("blocks\n");
    unint64_t v23 = *(void *)(a1 + 8);
    if (v23)
    {
      unint64_t v24 = 0LL;
      do
      {
        unint64_t v25 = (v24 + 1) >> 5;
        uint64_t v26 = v25 & 0x7FFFFFFFFFFFFFELL;
        uint64_t v27 = a1 + 8 * (v25 & 0x7FFFFFFFFFFFFFELL);
        unint64_t v28 = *(void *)(v27 + 224) >> (v24 + 1);
        if (v28)
        {
          unint64_t v29 = __clz(__rbit64(v28));
        }

        else
        {
          unint64_t v32 = ((_BYTE)v24 + 1) & 0x3F;
          unint64_t v33 = *(void *)(v27 + 240);
          if (v33)
          {
            unint64_t v30 = __clz(__rbit64(v33)) - v32 + 65;
            goto LABEL_21;
          }

          unint64_t v34 = *(void *)(a1 + ((8 * v25) | 8) + 224);
          if (v32 < 0x2E) {
            LODWORD(v35) = 0;
          }
          else {
            uint64_t v35 = *(void *)(a1 + 8 * v26 + 248);
          }
          unint64_t v29 = ((v34 >> v32) | ((unint64_t)(2 * v35) << (v32 ^ 0x3Fu))) & 0x7FFFF;
        }

        unint64_t v30 = v29 + 1;
LABEL_21:
        if ((*(void *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0LL)) & (1LL << v24) & *(void *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0LL | 8))) != 0) {
          uint64_t v31 = "*";
        }
        else {
          uint64_t v31 = " *";
        }
        a3( " %c[%p, %p) size=%zd\n",  *v31,  (const void *)(a1 + 16 * v24 + 0x20000),  (const void *)(a1 + 16 * v24 + 0x20000 + 16 * v30),  16 * v30);
        v24 += v30;
        unint64_t v23 = *(void *)(a1 + 8);
      }

      while (v24 < v23);
    }

    a3( "  [%p, %p) size=%zd (bump)\n",  (const void *)(a1 + 16 * v23 + 0x20000),  (const void *)(a1 + 0x800000),  8257536 - 16 * v23);
    return ((uint64_t (*)(const char *))a3)("\n");
  }

  return result;
}

uint64_t xzm_segment_group_segment_foreach_span(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 + 2104;
  if (*(_BYTE *)(a1 + 20) == 1) {
    return (*(uint64_t (**)(uint64_t, unint64_t, void))(a2 + 16))( a2,  v3,  *(unsigned int *)(a1 + 2144));
  }
  unint64_t v5 = v3 + 48LL * *(unsigned int *)(a1 + 16);
  if (v3 < v5)
  {
    while (1)
    {
      int v6 = *(_BYTE *)(v3 + 32) & 0xF;
      if (v6 == 2)
      {
        uint64_t v7 = 1LL;
        goto LABEL_6;
      }

      unint64_t v8 = 0LL;
      do
      {
        unint64_t v9 = v3 + v8 + 48;
        unsigned int v10 = *(_BYTE *)(v3 + v8 + 80) & 0xF;
        BOOL v11 = v10 > 7 || ((1 << v10) & 0xE4) == 0;
        v8 += 48LL;
      }

      while (v11 && v10 != 8 && v9 < v5);
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))(a2 + 16))( a2,  v3,  -1431655765 * (v8 >> 4));
      if ((_DWORD)result) {
        return result;
      }
      v3 += v8;
LABEL_8:
      if (v3 >= v5) {
        return 0LL;
      }
    }

    uint64_t v7 = *(unsigned int *)(v3 + 40);
LABEL_6:
    uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v3, v7);
    if ((_DWORD)result) {
      return result;
    }
    v3 += 48LL * v7;
    goto LABEL_8;
  }

  return 0LL;
}

uint64_t xzm_segment_table_foreach(unsigned int *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  if (a4)
  {
    unint64_t v8 = *a4;
    if (a2) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }

  unint64_t v8 = 0LL;
  if (!a2)
  {
LABEL_9:
    uint64_t result = 0LL;
    if (a4) {
      *a4 = v8;
    }
    return result;
  }

uint64_t xzm_ptr_in_use_enumerator( uint64_t task, uint64_t a2, char a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void **), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t v7 = a5;
  if (!a5)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v13, v14);
      }
    }

    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))_malloc_default_reader_2;
  }

  uint64_t result = _xzm_introspect_map_zone_and_main(task, a4, v7, &v34, &v33, &v32);
  if (!(_DWORD)result)
  {
    unint64_t v16 = v32;
    uint64_t v17 = v33;
    BOOL v18 = v32 == a4;
    if (v32 != a4
      || (uint64_t result = mfmi_enumerator( task,  a2,  a3,  *(void *)(v33 + 336),  (uint64_t (*)(task_name_t, uint64_t, uint64_t, void *))v7,  a6),  !(_DWORD)result))
    {
      v28[0] = MEMORY[0x1895FED80];
      v28[1] = 0x40000000LL;
      v28[2] = __xzm_ptr_in_use_enumerator_block_invoke;
      v28[3] = &__block_descriptor_tmp;
      BOOL v30 = (a3 & 4) != 0;
      BOOL v31 = v18;
      int v29 = task;
      v28[4] = a6;
      v28[5] = a2;
      v23[0] = MEMORY[0x1895FED80];
      v23[1] = 0x40000000LL;
      v23[2] = __xzm_ptr_in_use_enumerator_block_invoke_3;
      v23[3] = &__block_descriptor_tmp_4;
      BOOL v25 = v30;
      int v24 = task;
      v23[4] = a6;
      v23[5] = a2;
      BOOL v26 = (a3 & 2) != 0;
      char v27 = a3 & 1;
      if (v16 == a4)
      {
        v20[0] = MEMORY[0x1895FED80];
        v20[1] = 0x40000000LL;
        v20[2] = __xzm_ptr_in_use_enumerator_block_invoke_4;
        v20[3] = &__block_descriptor_tmp_6;
        BOOL v22 = (a3 & 2) != 0;
        int v21 = task;
        unint64_t v19 = v20;
        v20[4] = a6;
        v20[5] = a2;
      }

      else
      {
        unint64_t v19 = 0LL;
      }

      return _xzm_introspect_enumerate( task,  (uint64_t (*)(void))v7,  a4,  v34,  v16,  v17,  a3 & 1,  (uint64_t)v28,  (uint64_t)&__block_literal_global,  (uint64_t)v23,  (uint64_t)v19);
    }
  }

  return result;
}

void xzm_print_self(unint64_t a1)
{
  uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
  task_name_t v3 = *MEMORY[0x1895FFD48];
  if (!*MEMORY[0x1895FFD48])
  {
    unint64_t v7 = *(void *)(a1 + 200);
    if (v7 < 0x130) {
      return;
    }
    unint64_t v11 = *(void *)(a1 + 232);
    if (v11)
    {
      if (*(void *)(v11 + 304) < 0x1D8uLL) {
        return;
      }
      goto LABEL_16;
    }

    goto LABEL_15;
  }

  is_self = mach_task_is_self(*MEMORY[0x1895FFD48]);
  if (!(_DWORD)is_self) {
    purgeable_ptr_in_use_enumerator_cold_1(is_self, v5, v6);
  }
  unint64_t v7 = *(void *)(a1 + 200);
  if (v7 >= 0x130)
  {
    uint64_t v8 = mach_task_is_self(v3);
    if (!(_DWORD)v8) {
      purgeable_ptr_in_use_enumerator_cold_1(v8, v9, v10);
    }
    unint64_t v11 = *(void *)(a1 + 232);
    if (v11)
    {
      uint64_t v12 = mach_task_is_self(v3);
      if (!(_DWORD)v12) {
        purgeable_ptr_in_use_enumerator_cold_1(v12, v13, v14);
      }
      unint64_t v15 = *(void *)(v11 + 304);
      if (v15 < 0x1D8) {
        return;
      }
      uint64_t v16 = mach_task_is_self(v3);
      if (!(_DWORD)v16) {
        purgeable_ptr_in_use_enumerator_cold_1(v16, v17, v18);
      }
      if (v15 < *(void *)(v11 + 304)) {
        return;
      }
LABEL_16:
      if (!v11) {
        xzm_print_self_cold_1();
      }
      malloc_report_simple((uint64_t)"Begin xzone malloc JSON:\n");
      malloc_report_simple((uint64_t)"{\n");
      malloc_report_simple((uint64_t)"desc: xzone malloc, \n");
      malloc_report_simple((uint64_t)"addr: %p, \n");
      malloc_report_simple((uint64_t)"segment_size: %zu, \n");
      malloc_report_simple((uint64_t)"slice_size: %zu, \n");
      malloc_report_simple((uint64_t)"mzone: %d, \n");
      malloc_report_simple((uint64_t)"is_main: %d, \n");
      malloc_report_simple((uint64_t)"max_slot_config: %d, \n");
      uint64_t v75 = 0LL;
      v76 = &v75;
      uint64_t v77 = 0x2000000000LL;
      uint64_t v78 = 0LL;
      uint64_t v71 = 0LL;
      uint64_t v72 = &v71;
      uint64_t v73 = 0x2000000000LL;
      uint64_t v74 = 0LL;
      v70[0] = 0LL;
      v70[1] = v70;
      v70[2] = 0x2000000000LL;
      uint64_t v19 = MEMORY[0x1895FED80];
      v70[3] = 0LL;
      v68[0] = MEMORY[0x1895FED80];
      v68[1] = 0x40000000LL;
      v68[2] = __xzm_print_block_invoke;
      v68[3] = &unk_1896545C0;
      task_name_t v69 = v3;
      v68[4] = v70;
      v68[5] = &v75;
      v68[6] = &v71;
      v68[7] = malloc_report_simple;
      uint64_t v64 = 0LL;
      uint64_t v65 = &v64;
      uint64_t v66 = 0x2000000000LL;
      char v67 = 1;
      uint64_t v60 = 0LL;
      uint64_t v61 = &v60;
      uint64_t v62 = 0x2000000000LL;
      char v63 = 1;
      v52[0] = MEMORY[0x1895FED80];
      v52[1] = 0x40000000LL;
      uint64_t v53 = __xzm_print_block_invoke_2;
      unint64_t v54 = &unk_1896545E8;
      uint64_t v58 = malloc_report_simple;
      unint64_t v59 = v11;
      uint64_t v56 = &v64;
      char v57 = &v60;
      unint64_t v55 = v68;
      if (v11 == a1)
      {
        malloc_report_simple((uint64_t)"bucketing_key: %016llx%016llx, \n");
        malloc_report_simple((uint64_t)"guard_config: {\n");
        malloc_report_simple((uint64_t)"    guards_enabled: %d, \n");
        malloc_report_simple((uint64_t)"    data_guards_enabled: %d, \n");
        malloc_report_simple((uint64_t)"    tiny_run_size: %d, \n");
        malloc_report_simple((uint64_t)"    tiny_guard_density: %d, \n");
        malloc_report_simple((uint64_t)"    small_run_size: %d, \n");
        malloc_report_simple((uint64_t)"    small_guard_density: %d \n");
        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"defer_large: %s, \n");
        malloc_report_simple((uint64_t)"defer_xzones: %s, \n");
        malloc_report_simple((uint64_t)"range_groups: {\n");
        unint64_t v20 = *(void *)(v11 + 384);
        uint64_t v21 = v20 - a1;
        if (v20 < a1) {
          goto LABEL_72;
        }
        uint64_t v22 = *(unsigned __int8 *)(v11 + 329);
        if (__CFADD__(v21, 56 * v22)) {
          goto LABEL_72;
        }
        uint64_t v23 = v21 + v11;
        if (!(v21 + v11)) {
          goto LABEL_72;
        }
        if (*(_BYTE *)(v11 + 329))
        {
          unint64_t v24 = 0LL;
          do
          {
            malloc_report_simple((uint64_t)"    ");
            if (v24) {
              malloc_report_simple((uint64_t)", ");
            }
            malloc_report_simple((uint64_t)"%d: {\n");
            malloc_report_simple((uint64_t)"        id: %d, \n");
            malloc_report_simple((uint64_t)"        lock: %u, \n");
            malloc_report_simple((uint64_t)"        base: %p, \n");
            malloc_report_simple((uint64_t)"        size: %zu, \n");
            malloc_report_simple((uint64_t)"        next: %p, \n");
            malloc_report_simple((uint64_t)"        remaining: %zu\n");
            malloc_report_simple((uint64_t)"    }\n");
            ++v24;
            v23 += 56LL;
          }

          while (v24 < *(unsigned __int8 *)(v11 + 329));
        }

        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"segment_groups: {\n");
        unint64_t v25 = *(void *)(v11 + 392);
        uint64_t v26 = v25 - a1;
        if (v25 < a1) {
          goto LABEL_72;
        }
        uint64_t v27 = *(unsigned __int8 *)(v11 + 344);
        if (__CFADD__(v26, 496 * v27)) {
          goto LABEL_72;
        }
        uint64_t v28 = v26 + v11;
        if (!(v26 + v11)) {
          goto LABEL_72;
        }
        if (*(_BYTE *)(v11 + 344))
        {
          uint64_t v29 = 0LL;
          while (1)
          {
            malloc_report_simple((uint64_t)"    ");
            if (v29) {
              malloc_report_simple((uint64_t)", ");
            }
            malloc_report_simple((uint64_t)"%d: {\n");
            malloc_report_simple((uint64_t)"        id: %s, \n");
            malloc_report_simple((uint64_t)"        segment_cache: { \n");
            malloc_report_simple((uint64_t)"            max_count: %u, \n");
            malloc_report_simple((uint64_t)"            count: %u, \n");
            malloc_report_simple((uint64_t)"            max_entry_slices: %u, \n");
            malloc_report_simple((uint64_t)"            segments: { \n");
            if (*(_WORD *)(v28 + 496 * v29 + 482))
            {
              BOOL v30 = *(void **)(v28 + 496 * v29 + 464);
              if (v30) {
                break;
              }
            }

LABEL_41:
            malloc_report_simple((uint64_t)"            } \n");
            malloc_report_simple((uint64_t)"        } \n");
            malloc_report_simple((uint64_t)"    }\n");
          }

          while (1)
          {
            if (v3)
            {
              uint64_t v31 = mach_task_is_self(v3);
              if (!(_DWORD)v31) {
                purgeable_ptr_in_use_enumerator_cold_1(v31, v32, v33);
              }
            }

            BOOL v30 = (void *)v30[3];
            if (!v30) {
              goto LABEL_41;
            }
          }
        }

LABEL_42:
        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"xzones: {\n");
        unint64_t v34 = *(void *)(v11 + 216);
        uint64_t v35 = v34 - a1;
        if (v34 < a1
          || (uint64_t v36 = 88LL * *(unsigned __int8 *)(v11 + 210), v37 = v35 + v36, __CFADD__(v35, v36))
          || (unint64_t v38 = *(void *)(v11 + 304), v37 > v38)
          || (uint64_t v48 = v35 + v11) == 0
          || (unint64_t v39 = *(void *)(v11 + 224), v40 = v39 >= a1, v41 = v39 - a1, !v40)
          || __CFADD__(v41, 32 * *(unsigned __int8 *)(v11 + 210) * (unint64_t)*(unsigned __int8 *)(v11 + 211))
          || v41 + 32 * *(unsigned __int8 *)(v11 + 210) * (unint64_t)*(unsigned __int8 *)(v11 + 211) > v38
          || !(v41 + v11))
        {
LABEL_72:
          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(v70, 8);
          _Block_object_dispose(&v71, 8);
          _Block_object_dispose(&v75, 8);
          return;
        }

        if (*(unsigned __int8 *)(a1 + 210) >= 2u)
        {
          unint64_t v42 = 1LL;
          do
          {
            malloc_report_simple((uint64_t)"    %d: {\n");
            malloc_report_simple((uint64_t)"        id: %d, \n");
            malloc_report_simple((uint64_t)"        bucket: %d, \n");
            malloc_report_simple((uint64_t)"        segment_group: %zu, \n");
            malloc_report_simple((uint64_t)"        block_size: %llu, \n");
            malloc_report_simple((uint64_t)"        chunk_capacity: %u, \n");
            malloc_report_simple((uint64_t)"        sequestered: %d,\n");
            malloc_report_simple((uint64_t)"        slot_config: %s,\n");
            malloc_report_simple((uint64_t)"        allocation_slots: [\n");
            if (*(_BYTE *)(a1 + 211))
            {
              int v43 = 0;
              do
              {
                malloc_report_simple((uint64_t)"            {\n");
                if (*(void *)(v48 + 88 * v42 + 48) > 0x1000uLL)
                {
                  malloc_report_simple((uint64_t)"                chunk: %p,\n");
                  malloc_report_simple((uint64_t)"                allocations: %lu,\n");
                  uint64_t v44 = "                contentions: %lu,\n";
                }

                else
                {
                  malloc_report_simple((uint64_t)"                atomic_value: 0x%llx,\n");
                  malloc_report_simple((uint64_t)"                xsg_locked: 0x%llx,\n");
                  malloc_report_simple((uint64_t)"                xsg_waiters: 0x%llx,\n");
                  malloc_report_simple((uint64_t)"                xsc_ptr: 0x%llx,\n");
                  malloc_report_simple((uint64_t)"                allocations: %lu,\n");
                  malloc_report_simple((uint64_t)"                contentions: %lu,\n");
                  uint64_t v44 = "                slot_config: %s,\n";
                }

                malloc_report_simple((uint64_t)v44);
                malloc_report_simple((uint64_t)"                last_chunk_empty_ts: %llu\n");
                malloc_report_simple((uint64_t)"            }");
                malloc_report_simple((uint64_t)"\n");
                ++v43;
              }

              while (v43 < *(unsigned __int8 *)(a1 + 211));
            }

            malloc_report_simple((uint64_t)"        ]\n");
            malloc_report_simple((uint64_t)"    }");
            malloc_report_simple((uint64_t)"\n");
            ++v42;
          }

          while (v42 < *(unsigned __int8 *)(a1 + 210));
        }

        malloc_report_simple((uint64_t)"}, \n");
        uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
        uint64_t v19 = MEMORY[0x1895FED80];
      }

      malloc_report_simple((uint64_t)"spans: {\n");
      *((_BYTE *)v65 + 24) = 1;
      *((_BYTE *)v61 + 24) = 0;
      v50[7] = v11;
      v51[0] = v19;
      v51[1] = 0x40000000LL;
      v51[2] = __xzm_print_block_invoke_3;
      v51[3] = &unk_189654610;
      v51[5] = &v64;
      v51[6] = malloc_report_simple;
      v51[4] = v68;
      v50[0] = v19;
      v50[1] = 0x40000000LL;
      v50[2] = __xzm_print_block_invoke_4;
      v50[3] = &unk_189654638;
      v50[5] = &v64;
      v50[6] = malloc_report_simple;
      v50[4] = v68;
      if (v11 == a1)
      {
        v49[0] = v19;
        v49[1] = 0x40000000LL;
        v49[2] = __xzm_print_block_invoke_5;
        v49[3] = &unk_189654660;
        v49[6] = malloc_report_simple;
        v49[7] = v11;
        uint64_t v45 = v49;
        v49[4] = v68;
        v49[5] = &v64;
      }

      else
      {
        uint64_t v45 = 0LL;
      }

      int v46 = _xzm_introspect_enumerate( v3,  (uint64_t (*)(void))_malloc_default_reader_2,  a1,  a1,  v11,  v11,  0,  (uint64_t)v51,  (uint64_t)v52,  (uint64_t)v50,  (uint64_t)v45);
      mach_vm_address_t v47 = v72[3];
      if (v47) {
        mach_vm_deallocate(*v2, v47, 4 * v76[3]);
      }
      if (!v46)
      {
        malloc_report_simple((uint64_t)"}\n");
        malloc_report_simple((uint64_t)"}\n");
        malloc_report_simple((uint64_t)"End xzone malloc JSON\n");
      }

      goto LABEL_72;
    }

  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_18C528038 = v13;
  __break(1u);
LABEL_43:
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_18C528038 = v13;
  __break(1u);
}

void xzm_statistics_self(unint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 232)) {
    mfm_lock();
  }
  xzm_force_lock(a1);
  xzm_statistics(*MEMORY[0x1895FFD48], a1, _malloc_default_reader_2, a2);
  xzm_force_unlock(a1);
  if (!*(void *)(a1 + 232)) {
    mfm_unlock();
  }
}

void xzm_print_task( uint64_t a1, uint64_t a2, const void *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void **), void (*a5)(const char *, ...))
{
}

uint64_t _xzm_introspect_map_zone_and_main( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void **), void *a4, void *a5, void *a6)
{
  uint64_t v10 = a2;
  uint64_t v18 = 0LL;
  uint64_t result = a3(a1, a2, 304LL, &v18);
  if (!(_DWORD)result)
  {
    unint64_t v13 = v18[25];
    if (v13 < 0x130) {
      return 5LL;
    }
    uint64_t result = a3(a1, v10, v18[25], &v18);
    if (!(_DWORD)result)
    {
      uint64_t v17 = 0LL;
      uint64_t v14 = v18;
      uint64_t v15 = v18[29];
      if (v15)
      {
        uint64_t result = a3(a1, v18[29], 472LL, &v17);
        if ((_DWORD)result) {
          return result;
        }
        unint64_t v16 = v17[38];
        if (v16 < 0x1D8) {
          return 5LL;
        }
        uint64_t result = a3(a1, v15, v17[38], &v17);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v14 = v17;
        if (v16 < v17[38]) {
          return 5LL;
        }
        uint64_t v10 = v15;
      }

      else
      {
        uint64_t v17 = v18;
        if (v18[38] != v13) {
          return 5LL;
        }
      }

      if (!v18) {
        _xzm_introspect_map_zone_and_main_cold_1();
      }
      if (!v10) {
        xzm_print_self_cold_1();
      }
      uint64_t result = 0LL;
      *a4 = v18;
      *a5 = v14;
      *a6 = v10;
    }
  }

  return result;
}

uint64_t _xzm_introspect_enumerate( unsigned int a1, uint64_t (*a2)(void), unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v15 = a3 == a5;
  unint64_t v16 = (void *)(a6 + 304);
  uint64_t v17 = (uint64_t *)(a4 + 200);
  if (a3 == a5) {
    uint64_t v17 = (uint64_t *)(a6 + 304);
  }
  uint64_t v18 = *v17;
  if (a3 != a5) {
    goto LABEL_17;
  }
  unint64_t v19 = *(void *)(a6 + 400);
  unint64_t v20 = v19 - a3;
  if (v19 < a3) {
    return 5LL;
  }
  uint64_t v21 = *(unsigned __int8 *)(a6 + 330);
  uint64_t result = 5LL;
  if (__CFADD__(v20, v21 << 6)) {
    return result;
  }
  if (v20 + (v21 << 6) > *(void *)(a6 + 304)) {
    return result;
  }
  uint64_t v23 = v20 + a6;
  if (!(v20 + a6)) {
    return result;
  }
  if (!*(_BYTE *)(a6 + 330))
  {
LABEL_17:
    unint64_t v29 = *(void *)(a6 + 408);
    BOOL v30 = v29 >= a5;
    unint64_t v31 = v29 - a5;
    if (v30)
    {
      uint64_t result = 5LL;
      if (v31 < 0xFFFFFFFFFFFF0000LL && v31 + 0x10000 <= *v16)
      {
        uint64_t v32 = v31 + a6;
        if (v31 + a6)
        {
          uint64_t v33 = 0LL;
          uint64_t v34 = 0LL;
          v54[0] = MEMORY[0x1895FED80];
          unint64_t v55 = ___xzm_introspect_enumerate_block_invoke;
          uint64_t v56 = &unk_189654598;
          v54[1] = 0x40000000LL;
          unsigned int v64 = a1;
          uint64_t v61 = a4;
          unint64_t v62 = a3;
          uint64_t v63 = v18;
          char v65 = a7;
          uint64_t v57 = a9;
          uint64_t v58 = a10;
          BOOL v66 = v15;
          uint64_t v59 = a11;
          uint64_t v60 = a2;
          while (1)
          {
            uint64_t v35 = *(unsigned int *)(v32 + v33);
            uint64_t v36 = v35 << 14;
            if ((_DWORD)v35 && v34 != v36)
            {
              uint64_t result = v55((uint64_t)v54, v36);
              uint64_t v34 = v36;
              if ((_DWORD)result) {
                break;
              }
            }

            v33 += 4LL;
            if (v33 == 0x10000)
            {
              unint64_t v38 = *(void *)(a6 + 416);
              if (v38 >> 62) {
                return 5LL;
              }
              unint64_t v39 = *(void *)(a6 + 424);
              uint64_t result = 0LL;
              BOOL v30 = v39 >= a5;
              unint64_t v40 = v39 - a5;
              if (v30 && !__CFADD__(v40, 4 * v38) && v40 + 4 * v38 <= *v16)
              {
                uint64_t result = 0LL;
                uint64_t v41 = v40 + a6;
                if (v40 + a6)
                {
                  if (v38)
                  {
                    uint64_t v42 = 0LL;
                    while (1)
                    {
                      uint64_t v43 = *(unsigned int *)(v41 + 4 * v42);
                      if ((_DWORD)v43) {
                        break;
                      }
LABEL_48:
                      uint64_t result = 0LL;
                      if (++v42 >= v38) {
                        return result;
                      }
                    }

                    uint64_t result = ((uint64_t (*)(void, uint64_t, uint64_t, void **))a2)( a1,  v43 << 16,  0x10000LL,  &v67);
                    if (!(_DWORD)result)
                    {
                      uint64_t v44 = 0LL;
                      uint64_t v45 = v67;
                      while (1)
                      {
                        uint64_t v46 = *(unsigned int *)((char *)v45 + v44);
                        uint64_t v47 = v46 << 14;
                        if ((_DWORD)v46 && v34 != v47)
                        {
                          uint64_t result = v55((uint64_t)v54, v47);
                          uint64_t v34 = v47;
                          if ((_DWORD)result) {
                            break;
                          }
                        }

                        v44 += 4LL;
                        if (v44 == 0x10000)
                        {
                          unint64_t v38 = *(void *)(a6 + 416);
                          goto LABEL_48;
                        }
                      }
                    }
                  }
                }
              }

              return result;
            }
          }
        }
      }

      return result;
    }

    return 5LL;
  }

  uint64_t v25 = 0LL;
  BOOL v50 = a3 == a5;
  char v51 = a7;
  uint64_t v49 = v20 + a6;
  while (1)
  {
    uint64_t v26 = v23 + (v25 << 6);
    if (*(void *)(v26 + 24)) {
      break;
    }
LABEL_16:
  }

  uint64_t v27 = (unsigned int *)(v26 + 8);
  uint64_t v28 = (unsigned __int8 *)(v26 + 4);
  while (1)
  {
    char v67 = 0LL;
    uint64_t result = a2(a1);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a8 + 16))(a8, v67[1], *v27, *v28);
    if ((_DWORD)result) {
      return result;
    }
    if (!*v67)
    {
      LODWORD(v21) = *(unsigned __int8 *)(a6 + 330);
      BOOL v15 = v50;
      a7 = v51;
      uint64_t v23 = v49;
      goto LABEL_16;
    }
  }

uint64_t __xzm_ptr_in_use_enumerator_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 52) && *(_BYTE *)(a1 + 53))
  {
    v4[0] = a2;
    v4[1] = a3;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  4LL,  v4,  1LL);
  }

  return 0LL;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_2()
{
  return 0LL;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v13 = *(_BYTE *)(a4 + 32) & 0xF;
  if (*(_BYTE *)(a1 + 52)) {
    BOOL v14 = v13 == 7;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v18 = a2;
    unint64_t v19 = 0x4000LL;
    (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  4LL,  &v18,  1LL);
  }

  if (*(_BYTE *)(a1 + 53))
  {
    uint64_t v18 = a6;
    unint64_t v19 = (unint64_t)a5 << 14;
    if (v13 != 5 && v13 != 2)
    {
LABEL_22:
      (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  3LL,  &v18,  1LL);
      return 0LL;
    }

    (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  2LL,  &v18,  1LL);
    if (!*(_BYTE *)(a1 + 54)) {
      return 0LL;
    }
    goto LABEL_21;
  }

  if (*(_BYTE *)(a1 + 54))
  {
    uint64_t v18 = a6;
    unint64_t v19 = (unint64_t)a5 << 14;
    if (v13 != 2 && v13 != 5) {
      goto LABEL_22;
    }
LABEL_21:
    (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  1LL,  a8,  a9);
  }

  return 0LL;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  if (*(_BYTE *)(a1 + 52))
  {
    v7[0] = a6;
    v7[1] = (unint64_t)a5 << 14;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  2LL,  v7,  1LL);
  }

  return 0LL;
}

uint64_t _malloc_default_reader_2(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t ___xzm_introspect_enumerate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 56))( *(unsigned int *)(a1 + 88),  a2,  14392LL,  &v14);
  if (!(_DWORD)result)
  {
    uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t *))(a1 + 56))( *(unsigned int *)(a1 + 88),  *(void *)(v14 + 48),  (unint64_t)*(unsigned int *)(v14 + 12) << 14,  &v13);
    if (!(_DWORD)result)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      if (!(_DWORD)result)
      {
        v5[0] = MEMORY[0x1895FED80];
        v5[1] = 0x40000000LL;
        v5[2] = ___xzm_introspect_enumerate_block_invoke_2;
        v5[3] = &unk_189654570;
        uint64_t v7 = v14;
        uint64_t v8 = v13;
        uint64_t v9 = *(void *)(a1 + 64);
        __int128 v10 = *(_OWORD *)(a1 + 72);
        __int16 v12 = *(_WORD *)(a1 + 92);
        uint64_t v11 = a2;
        __int128 v6 = *(_OWORD *)(a1 + 40);
        return xzm_segment_group_segment_foreach_span(v14, (uint64_t)v5);
      }
    }
  }

  return result;
}

uint64_t ___xzm_introspect_enumerate_block_invoke_2()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v3 = v2;
  uint64_t v4 = (unsigned int *)v1;
  v45[2048] = *MEMORY[0x1895FEE08];
  uint64_t v5 = *(void *)(v0 + 48);
  unint64_t v6 = 0xAAAAAAAAAAAAC000LL * ((unint64_t)(v1 - v5 - 2104) >> 4);
  uint64_t v7 = (v6 & 0x3FFFFFFFC000LL) + *(void *)(v5 + 48);
  unsigned int v8 = *(_BYTE *)(v1 + 32) & 0xF;
  BOOL v9 = v8 > 7 || ((1 << v8) & 0xE4) == 0;
  if (v9 || (uint64_t v10 = *(void *)(v0 + 64), *(unsigned __int16 *)(v1 + 34) != *(unsigned __int16 *)(v10 + 208)))
  {
    uint64_t v14 = *(unsigned __int8 *)(v0 + 97);
    if (*(_BYTE *)(v0 + 97))
    {
      if (!*(_WORD *)(v1 + 34)) {
        return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)(v0 + 40) + 16LL))( *(void *)(v0 + 40),  *(void *)(v0 + 88),  v5,  v1,  v2,  (v6 & 0x3FFFFFFFC000LL) + *(void *)(v5 + 48));
      }
      return 0LL;
    }

    return v14;
  }

  uint64_t v11 = *(void *)(v0 + 56);
  if (v8 != 5 && v8 != 2)
  {
    uint64_t v16 = 0LL;
    goto LABEL_21;
  }

  unint64_t v12 = *(void *)(v0 + 72);
  unint64_t v13 = *(void *)(v10 + 216) + 88LL * *(unsigned __int8 *)(v1 + 33);
  if (v12 <= v13)
  {
    unint64_t v17 = v13 - v12;
    BOOL v18 = __CFADD__(v13 - v12, 88LL);
    unint64_t v19 = v13 - v12 + 88;
    char v20 = v18;
    uint64_t v14 = 5LL;
    uint64_t v16 = v17 + v10;
    if (!(v17 + v10) || (v20 & 1) != 0 || v19 > *(void *)(v0 + 80)) {
      return v14;
    }
LABEL_21:
    if (!*(_BYTE *)(v0 + 96)) {
      return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 32),  *(void *)(v0 + 88),  v5,  v1,  v2,  v7,  v16,  0LL,  0LL);
    }
    uint64_t v21 = *(void *)(v0 + 88);
    uint64_t v22 = *(void *)(v0 + 32);
    if (v8 == 2 || v8 == 5)
    {
      bzero(v45, 0x4000uLL);
      unint64_t v23 = *(unsigned int *)(v16 + 68);
      uint64_t v14 = 5LL;
      uint64_t v24 = *(void *)(v16 + 48);
      uint64_t v25 = v24;
      if (v8 == 5)
      {
        if ((_DWORD)v23)
        {
          unsigned int v26 = 0;
          uint64_t v27 = 0LL;
          uint64_t v28 = 0LL;
          unsigned int v29 = *v4;
          do
          {
            if (((v29 >> v27) & 1) == 0)
            {
              BOOL v30 = &v45[2 * v28];
              *BOOL v30 = v7 + v26;
              v30[1] = v24;
              ++v28;
            }

            ++v27;
            v26 += v24;
          }

          while (v23 != v27);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v22 + 16))( v22,  v21,  v5,  v4,  v3,  v7,  v16,  v45,  v28);
        }

LABEL_56:
        LODWORD(v28) = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v22 + 16))( v22,  v21,  v5,  v4,  v3,  v7,  v16,  v45,  v28);
      }

      unint64_t v32 = *(void *)v4;
      if ((~*v4 & 0x7FELL) != 0)
      {
        unint64_t v33 = *(void *)v4 & 0x7FFLL;
        if (v33 > 0x3FF)
        {
          unint64_t v34 = 0LL;
        }

        else
        {
          unint64_t v34 = 0LL;
          unint64_t v35 = v24 >> 4;
          do
          {
            if (v33 % v35) {
              break;
            }
            uint64_t v36 = &v45[2 * (v33 / v35)];
            if (*v36) {
              break;
            }
            ++v34;
            *uint64_t v36 = 1;
            unint64_t v33 = *(void *)(v6 + v11 + 16 * v33 + 8) & 0x7FFLL;
          }

          while (v33 < 0x400);
        }

        unint64_t v37 = (v32 >> 11) & 0x7FF;
        if (v34 >= v37 || v37 > v23) {
          uint64_t v39 = 0LL;
        }
        else {
          uint64_t v39 = v34 - v37;
        }
        uint64_t v40 = v39 + v23;
        if (v40)
        {
          uint64_t v28 = 0LL;
          uint64_t v41 = (unsigned __int8 *)v45;
          uint64_t v42 = v7;
          do
          {
            int v43 = *v41;
            v41 += 16;
            if (!v43)
            {
              uint64_t v44 = &v45[2 * v28];
              *uint64_t v44 = v42;
              v44[1] = v25;
              ++v28;
            }

            v42 += v25;
            --v40;
          }

          while (v40);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v22 + 16))( v22,  v21,  v5,  v4,  v3,  v7,  v16,  v45,  v28);
        }

        goto LABEL_56;
      }

      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void, void))(v22 + 16))( v22,  v21,  v5,  v4,  v3,  v7,  v16,  0LL,  0LL);
    }

    else
    {
      v45[0] = (v6 & 0x3FFFFFFFC000LL) + *(void *)(v5 + 48);
      v45[1] = (unint64_t)v2 << 14;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, uint64_t))(v22 + 16))( v22,  v21,  v5,  v1,  v2,  v7,  0LL,  v45,  1LL);
    }
  }

  return 5LL;
}

void xzm_print( uint64_t a1, const void *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void **), void (*a4)(const char *, ...))
{
  uint64_t v5 = (uint64_t (*)(void))a3;
  unsigned int v7 = a1;
  if (!_xzm_introspect_map_zone_and_main(a1, (uint64_t)a2, a3, &v92, &v91, &v90))
  {
    unsigned int v8 = (const void *)v90;
    a4("Begin xzone malloc JSON:\n");
    a4("{\n");
    a4("desc: xzone malloc, \n");
    a4("addr: %p, \n", a2);
    a4("segment_size: %zu, \n", 0x400000uLL);
    a4("slice_size: %zu, \n", 0x4000uLL);
    uint64_t v9 = v92;
    a4("mzone: %d, \n", *(unsigned __int16 *)(v92 + 208));
    a4("is_main: %d, \n", v8 == a2);
    a4("max_slot_config: %d, \n", *(_BYTE *)(v9 + 240) & 3);
    uint64_t v86 = 0LL;
    v87 = &v86;
    uint64_t v88 = 0x2000000000LL;
    uint64_t v89 = 0LL;
    uint64_t v82 = 0LL;
    v83 = &v82;
    uint64_t v84 = 0x2000000000LL;
    uint64_t v85 = 0LL;
    v81[0] = 0LL;
    v81[1] = v81;
    v81[2] = 0x2000000000LL;
    v81[3] = 0LL;
    uint64_t v10 = MEMORY[0x1895FED80];
    v79[0] = MEMORY[0x1895FED80];
    v79[1] = 0x40000000LL;
    v79[2] = __xzm_print_block_invoke;
    v79[3] = &unk_1896545C0;
    unsigned int v80 = v7;
    v79[4] = v81;
    v79[5] = &v86;
    v79[6] = &v82;
    v79[7] = a4;
    uint64_t v75 = 0LL;
    v76 = &v75;
    uint64_t v77 = 0x2000000000LL;
    char v78 = 1;
    uint64_t v71 = 0LL;
    uint64_t v72 = &v71;
    uint64_t v73 = 0x2000000000LL;
    char v74 = 1;
    v63[0] = MEMORY[0x1895FED80];
    v63[1] = 0x40000000LL;
    unsigned int v64 = __xzm_print_block_invoke_2;
    char v65 = &unk_1896545E8;
    uint64_t v11 = v91;
    task_name_t v69 = a4;
    uint64_t v70 = v91;
    char v67 = &v75;
    unsigned int v68 = &v71;
    BOOL v66 = v79;
    if (v8 == a2)
    {
      uint64_t v58 = v8;
      a4("bucketing_key: %016llx%016llx, \n", *(void *)(v91 + 312), *(void *)(v91 + 320));
      a4("guard_config: {\n");
      a4("    guards_enabled: %d, \n", *(unsigned __int8 *)(v11 + 452));
      a4("    data_guards_enabled: %d, \n", *(unsigned __int8 *)(v11 + 453));
      a4("    tiny_run_size: %d, \n", *(unsigned __int8 *)(v11 + 454));
      a4("    tiny_guard_density: %d, \n", *(unsigned __int8 *)(v11 + 455));
      a4("    small_run_size: %d, \n", *(unsigned __int8 *)(v11 + 456));
      a4("    small_guard_density: %d \n", *(unsigned __int8 *)(v11 + 457));
      a4("}, \n");
      if ((*(_BYTE *)(v11 + 328) & 8) != 0) {
        unint64_t v12 = "true";
      }
      else {
        unint64_t v12 = "false";
      }
      a4("defer_large: %s, \n", v12);
      if ((*(_BYTE *)(v11 + 328) & 4) != 0) {
        unint64_t v13 = "true";
      }
      else {
        unint64_t v13 = "false";
      }
      a4("defer_xzones: %s, \n", v13);
      a4("range_groups: {\n");
      unint64_t v14 = *(void *)(v11 + 384);
      unint64_t v15 = v14 - (void)a2;
      uint64_t v16 = *(unsigned __int8 *)(v11 + 329);
      if (__CFADD__(v15, 56 * v16)) {
        goto LABEL_66;
      }
      if (v15 + 56 * v16 > *(void *)(v11 + 304)) {
        goto LABEL_66;
      }
      unint64_t v17 = (unsigned __int8 *)(v15 + v11);
      if (!(v15 + v11)) {
        goto LABEL_66;
      }
      unsigned int v56 = v7;
      uint64_t v57 = v5;
      if (*(_BYTE *)(v11 + 329))
      {
        unint64_t v18 = 0LL;
        do
        {
          a4("    ");
          if (v18) {
            a4(", ");
          }
          a4("%d: {\n", *v17);
          a4("        id: %d, \n", *v17);
          a4("        lock: %u, \n", *((_DWORD *)v17 + 4));
          a4("        base: %p, \n", *((const void **)v17 + 3));
          a4("        size: %zu, \n", *((void *)v17 + 4));
          a4("        next: %p, \n", *((const void **)v17 + 5));
          a4("        remaining: %zu\n", *((void *)v17 + 6));
          a4("    }\n");
          ++v18;
          v17 += 56;
        }

        while (v18 < *(unsigned __int8 *)(v11 + 329));
      }

      a4("}, \n");
      a4("segment_groups: {\n");
      unint64_t v19 = *(void *)(v11 + 392);
      unint64_t v20 = v19 - (void)a2;
      uint64_t v21 = *(unsigned __int8 *)(v11 + 344);
      if (__CFADD__(v20, 496 * v21)) {
        goto LABEL_66;
      }
      if (v20 + 496 * v21 > *(void *)(v11 + 304)) {
        goto LABEL_66;
      }
      unint64_t v22 = v20 + v11;
      if (!(v20 + v11)) {
        goto LABEL_66;
      }
      if (*(_BYTE *)(v11 + 344))
      {
        uint64_t v23 = 0LL;
        while (1)
        {
          a4("    ");
          if (v23) {
            a4(", ");
          }
          a4("%d: {\n", *(unsigned __int8 *)(v22 + 496 * v23));
          unint64_t v24 = *(char *)(v22 + 496 * v23);
          uint64_t v25 = "unknown";
          if (v24 <= 3) {
            uint64_t v25 = (&off_189654758)[v24];
          }
          a4("        id: %s, \n", v25);
          a4("        segment_cache: { \n");
          unint64_t v26 = v22 + 496 * v23;
          a4("            max_count: %u, \n", *(unsigned __int16 *)(v26 + 480));
          a4("            count: %u, \n", *(unsigned __int16 *)(v26 + 482));
          a4("            max_entry_slices: %u, \n", *(_DWORD *)(v26 + 484));
          a4("            segments: { \n");
          if (*(_WORD *)(v26 + 482))
          {
            uint64_t v27 = *(const void **)(v22 + 496 * v23 + 464);
            if (v27) {
              break;
            }
          }

uint64_t __xzm_print_block_invoke(uint64_t a1, mach_vm_offset_t address, unint64_t a3, const char *a4)
{
  uint64_t result = *(unsigned int *)(a1 + 64);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  mach_vm_offset_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = (unint64_t *)MEMORY[0x189600148];
  unint64_t v12 = *MEMORY[0x189600148];
  if (v10 > address || v10 + v12 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) < a3 + address)
  {
    *(void *)(v9 + 24) = address;
    mach_vm_size_t v13 = a3 / v12;
    if (a3 % v12) {
      ++v13;
    }
    unint64_t v14 = 0x400000 / v12;
    if (v13 <= v14) {
      mach_vm_size_t v15 = v14;
    }
    else {
      mach_vm_size_t v15 = v13;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    mach_vm_size_t v17 = *(void *)(v16 + 24);
    if (v15 > v17)
    {
      mach_vm_address_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      unint64_t v19 = (vm_map_t *)MEMORY[0x1895FFD48];
      if (v18)
      {
        mach_vm_deallocate(*MEMORY[0x1895FFD48], v18, 4 * v17);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0LL;
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
      }

      *(void *)(v16 + 24) = v15;
      uint64_t result = mach_vm_allocate( *v19,  (mach_vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  4LL * *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  1);
      if ((_DWORD)result) {
        return result;
      }
      LODWORD(result) = *(_DWORD *)(a1 + 64);
    }

    mach_vm_size_t dispositions_count = v15;
    if (a3 <= 0x400000) {
      mach_vm_size_t v20 = 0x400000LL;
    }
    else {
      mach_vm_size_t v20 = a3;
    }
    uint64_t result = mach_vm_page_range_query( result,  address,  v20,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  &dispositions_count);
    if ((_DWORD)result) {
      return result;
    }
  }

  (*(void (**)(const char *, ...))(a1 + 56))("%s    dispositions: ", a4);
  unint64_t v28 = a4;
  if (*v11 > a3)
  {
    uint64_t v23 = 0LL;
    uint64_t v22 = 0LL;
LABEL_29:
    (*(void (**)(const char *))(a1 + 56))(", \n");
    (*(void (**)(const char *, ...))(a1 + 56))("%s    dirty_count: %zu, \n", v28, v23);
    (*(void (**)(const char *, ...))(a1 + 56))("%s    swapped_count: %zu, \n", v28, v22);
    return 0LL;
  }

  else
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    mach_vm_offset_t v24 = (address - *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) / *v11;
    while (v24 < *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      int v25 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) + 4 * v24);
      if ((v25 & 8) != 0)
      {
        ++v23;
        uint64_t v27 = "d";
      }

      else
      {
        unint64_t v26 = v25 & 0x10;
        if ((_DWORD)v26) {
          uint64_t v27 = "s";
        }
        else {
          uint64_t v27 = "c";
        }
        v22 += v26 >> 4;
      }

      (*(void (**)(const char *))(a1 + 56))(v27);
      ++v24;
      if (++v21 >= a3 / *v11) {
        goto LABEL_29;
      }
    }

    return 5LL;
  }

uint64_t __xzm_print_block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, const char *a4)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    (*(void (**)(const char *))(a1 + 56))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s%p: {\n", a4, a2);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    addr: %p, \n", a4, a2);
  unint64_t v8 = 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*(void *)a3 - *(void *)(*(void *)(a1 + 64) + 392LL)) >> 4);
  uint64_t v9 = "unknown";
  if ((v8 & 0xFC) == 0) {
    uint64_t v9 = (&off_189654758)[(char)v8];
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    segment_group: %s, \n", a4, v9);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    body_addr: %p, \n", a4, *(const void **)(a3 + 48));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    used: %u, \n", a4, *(_DWORD *)(a3 + 8));
  mach_vm_offset_t v10 = "huge_segment";
  if (*(_BYTE *)(a3 + 20) != 1) {
    mach_vm_offset_t v10 = "unknown";
  }
  if (*(_BYTE *)(a3 + 20)) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = "normal_segment";
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    kind: %s, \n", a4, v11);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    slice_count: %u, \n", a4, *(_DWORD *)(a3 + 12));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    slice_entry_count: %u \n", a4, *(_DWORD *)(a3 + 16));
  (*(void (**)(const char *, ...))(a1 + 56))("%s}\n", a4);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return 0LL;
}

uint64_t __xzm_print_block_invoke_3(uint64_t a1, const void *a2, int a3, unsigned int a4)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("%p: {\n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        addr: %p, \n", a2);
  if (a4 > 3) {
    unint64_t v8 = "unknown slab";
  }
  else {
    unint64_t v8 = (&off_189654778)[(char)a4];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        kind: %s, \n", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  (*(void (**)(const char *, ...))(a1 + 48))("        size: %u \n", a3);
  (*(void (**)(const char *))(a1 + 48))("    }\n");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return 0LL;
}

uint64_t __xzm_print_block_invoke_4( uint64_t a1, _BYTE *a2, void *a3, uint64_t a4, int a5, const void *a6, uint64_t a7)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("%p: {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        addr: %p, \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))( "        metadata_addr: %p, \n",  (const void *)(a2 - (_BYTE *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        mzone: %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        xzone: %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        segment: %p, \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))( "        segment_group: %zu, \n",  0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(void *)(*(void *)(a1 + 56) + 392LL)) >> 4));
  uint64_t v14 = *(_BYTE *)(a4 + 32) & 0xF;
  else {
    mach_vm_size_t v15 = (&off_189654798)[v14];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        kind: %s, \n", v15);
  (*(void (**)(const char *, ...))(a1 + 48))("        slice_count: %u, \n", a5);
  if (a7) {
    int v16 = *(_DWORD *)(a7 + 48);
  }
  else {
    int v16 = 0;
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        block_size: %u, \n", v16);
  (*(void (**)(const char *))(a1 + 48))("        in_use: 1, \n");
  uint64_t v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (!(_DWORD)v17)
  {
    if ((_DWORD)v14 == 5 || (_DWORD)v14 == 2) {
      (*(void (**)(const char *, ...))(a1 + 48))("        bucket: %u,\n", *(unsigned __int8 *)(a7 + 76));
    }
    if ((_DWORD)v14 == 5)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        free: 0x%x,\n", *(_DWORD *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        used: %u,\n", *(_DWORD *)(a4 + 4));
      (*(void (**)(const char *))(a1 + 48))("        alloc_idx: %u,\n");
    }

    else if ((_DWORD)v14 == 2)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        meta: 0x%llx,\n", *(void *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        xca_alloc_head: 0x%llx,\n", *(_DWORD *)a4 & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_free_count: 0x%llx,\n",  (*(_DWORD *)a4 >> 11) & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_alloc_idx: 0x%llx,\n",  (*(_DWORD *)a4 >> 22) & 0x3F);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_on_partial_list: 0x%llx,\n",  (*(_DWORD *)a4 >> 28) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_on_empty_list: 0x%llx,\n",  (*(_DWORD *)a4 >> 29) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_walk_locked: 0x%llx,\n",  (*(_DWORD *)a4 >> 30) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))( "        xca_head_seqno: 0x%llx,\n",  (*(void *)a4 >> 38) & 0x1FFFLL);
      (*(void (**)(const char *))(a1 + 48))("        xca_seqno: 0x%llx,\n");
    }

    (*(void (**)(const char *, ...))(a1 + 48))( "        is_preallocated: %d,\n",  (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *, ...))(a1 + 48))( "        is_pristine: %d\n",  (*(unsigned __int8 *)(a4 + 32) >> 4) & 1);
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return v17;
}

uint64_t __xzm_print_block_invoke_5(uint64_t a1, _BYTE *a2, void *a3, uint64_t a4, int a5, const void *a6)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("%p: {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        addr: %p, \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))( "        metadata_addr: %p, \n",  (const void *)(a2 - (_BYTE *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        mzone: %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        xzone: %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        segment: %p, \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))( "        segment_group: %zu, \n",  0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(void *)(*(void *)(a1 + 56) + 392LL)) >> 4));
  uint64_t v12 = *(_BYTE *)(a4 + 32) & 0xF;
  else {
    mach_vm_size_t v13 = (&off_189654798)[v12];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        kind: %s, \n", v13);
  (*(void (**)(const char *, ...))(a1 + 48))("        slice_count: %u, \n", a5);
  uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (!(_DWORD)v14)
  {
    (*(void (**)(const char *, ...))(a1 + 48))( "        is_preallocated: %d,\n",  (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *))(a1 + 48))("        in_use: 0 \n");
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return v14;
}

uint64_t xzm_statistics( uint64_t task, unint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a4)
{
  uint64_t v5 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
      }
    }

    uint64_t v5 = _malloc_default_reader_2;
  }

  uint64_t result = _xzm_introspect_map_zone_and_main( task,  a2,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))v5,  &v19,  &v18,  &v17);
  if (!(_DWORD)result)
  {
    unint64_t v12 = v17;
    uint64_t v13 = v18;
    if (v17 == a2)
    {
      mfmi_statistics_task(task, *(void *)(v18 + 336), v5, (void *)a4);
      *(void *)(a4 + 16) = 0LL;
    }

    v16[0] = MEMORY[0x1895FED80];
    v16[1] = 0x40000000LL;
    v16[2] = __xzm_statistics_block_invoke_3;
    v16[3] = &__block_descriptor_tmp_162;
    v16[4] = a4;
    if (v12 == a2)
    {
      v15[0] = MEMORY[0x1895FED80];
      v15[1] = 0x40000000LL;
      v15[2] = __xzm_statistics_block_invoke_4;
      v15[3] = &__block_descriptor_tmp_163;
      v15[4] = a4;
      uint64_t v14 = v15;
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    return _xzm_introspect_enumerate( task,  (uint64_t (*)(void))v5,  a2,  v19,  v12,  v13,  0,  (uint64_t)&__block_literal_global_159,  (uint64_t)&__block_literal_global_161,  (uint64_t)v16,  (uint64_t)v14);
  }

  return result;
}

uint64_t __xzm_statistics_block_invoke()
{
  return 0LL;
}

uint64_t __xzm_statistics_block_invoke_2()
{
  return 0LL;
}

uint64_t __xzm_statistics_block_invoke_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7 = (unint64_t)a5 << 14;
  int v8 = *(_BYTE *)(a4 + 32) & 0xF;
  if (v8 == 5)
  {
    uint64_t v10 = *(unsigned int *)(a4 + 4);
LABEL_8:
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)v9 += v10;
    unint64_t v11 = *(void *)(v9 + 8) + *(void *)(a7 + 48) * v10;
    goto LABEL_9;
  }

  if (v8 != 2)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    ++*(_DWORD *)v9;
    unint64_t v11 = *(void *)(v9 + 8) + v7;
LABEL_9:
    *(void *)(v9 + 8) = v11;
    goto LABEL_10;
  }

  if ((~*(_DWORD *)a4 & 0x7FE) != 0)
  {
    uint64_t v10 = *(_DWORD *)(a7 + 68) - ((*(_DWORD *)a4 >> 11) & 0x7FFu);
    goto LABEL_8;
  }

  uint64_t v9 = *(void *)(a1 + 32);
LABEL_10:
  *(void *)(v9 + 24) += v7;
  return 0LL;
}

uint64_t __xzm_statistics_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) += (unint64_t)a5 << 14;
  return 0LL;
}

uint64_t main_image_has_section()
{
  image_header = _dyld_get_image_header(0);
  if (!image_header->ncmds) {
    return 0LL;
  }
  uint64_t v1 = image_header;
  int v2 = 0;
  p_cputype = &image_header[1].cputype;
  while (*p_cputype != 25 || _platform_strncmp() && v1->filetype != 1 || !p_cputype[16])
  {
LABEL_11:
    p_cputype = (cpu_type_t *)((char *)p_cputype + p_cputype[1]);
    if (++v2 >= v1->ncmds) {
      return 0LL;
    }
  }

  unsigned int v4 = 0;
  uint64_t v5 = p_cputype + 22;
  while (_platform_strncmp() || _platform_strncmp())
  {
    ++v4;
    v5 += 20;
    if (v4 >= p_cputype[16]) {
      goto LABEL_11;
    }
  }

  return 1LL;
}

uint64_t pgm_thread_set_disabled(uint64_t result)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v2 = 0xFFFFFFFFLL;
  if (!(_DWORD)result) {
    uint64_t v2 = 0LL;
  }
  *(void *)(StatusReg + 880) = v2;
  return result;
}

char *pgm_init_config(int a1)
{
  if (a1) {
    g_env_0 = 1;
  }
  uint64_t result = getenv("MallocProbGuard");
  if (result)
  {
    g_env_1 = 1;
    uint64_t result = getenv("MallocProbGuard");
    if (result) {
      BOOL v2 = *result == 49;
    }
    else {
      BOOL v2 = 0;
    }
    g_env_2 = v2;
  }

  return result;
}

uint64_t pgm_should_enable()
{
  if (g_env_1 == 1) {
    return g_env_2 != 0;
  }
  char v1 = g_env_0;
  if ((v1 & 1) != 0)
  {
    uint32_t v2 = 250;
  }

  else
  {
    uint32_t v2 = 1000;
  }

  if (!arc4random_uniform(v2) && (main_image_has_section() & 1) == 0 && MEMORY[0xFFFFFC038] > 0x4CCCCCCCuLL) {
    return 1LL;
  }
  return _os_feature_enabled_simple_impl();
}

uint64_t pgm_create_zone(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 104) <= 0xFu) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  my_vm_map_common(0, 16720LL, 3, 1, 1);
  MEMORY[0x20] = xmmword_189654800;
  MEMORY[0x30] = *(_OWORD *)&off_189654810;
  MEMORY[0x60] = xmmword_189654840;
  MEMORY[0x70] = *(_OWORD *)&off_189654850;
  MEMORY[0x40] = xmmword_189654820;
  MEMORY[0x50] = *(_OWORD *)&off_189654830;
  MEMORY[0xA0] = xmmword_189654880;
  MEMORY[0xB0] = *(_OWORD *)off_189654890;
  MEMORY[0x80] = xmmword_189654860;
  MEMORY[0x90] = unk_189654870;
  MEMORY[0] = malloc_zone_template_0;
  MEMORY[0x10] = *(_OWORD *)&off_1896547F0;
  MEMORY[0xC0] = pgm_malloc_type_malloc_with_options;
  MEMORY[0xC8] = a1;
  if (!*(void *)(a1 + 112)) {
    MEMORY[0x70] = 0LL;
  }
  if (!*(void *)(a1 + 184)) {
    MEMORY[0xB8] = 0LL;
  }
  if (!*(void *)(a1 + 120)) {
    MEMORY[0x78] = 0LL;
  }
  if (!*(void *)(a1 + 136)) {
    MEMORY[0x88] = 0LL;
  }
  if (!*(void *)(a1 + 152)) {
    MEMORY[0x98] = 0LL;
  }
  if (!*(void *)(a1 + 192)) {
    MEMORY[0xC0] = 0LL;
  }
  unint64_t v3 = env_uint_0("MallocProbGuardMemoryBudgetInKB", 2048LL);
  unint64_t v4 = (unint64_t)v3 << 10;
  uint64_t v5 = (void *)MEMORY[0x189600148];
  unint64_t v6 = (*MEMORY[0x189600148] + 16719LL) & -*MEMORY[0x189600148];
  BOOL v7 = v4 >= v6;
  unint64_t v8 = v4 - v6;
  if (!v7
    || (unint64_t v9 = v8 / (unint64_t)((double)(unint64_t)*MEMORY[0x189600148] + 1600.0 + 80.0 + 768.0), !(_DWORD)v9))
  {
    pgm_create_zone_cold_2(v3);
  }

  MEMORY[0xD4] = env_uint_0("MallocProbGuardAllocations", v9);
  MEMORY[0xD0] = env_uint_0("MallocProbGuardSlots", (10 * MEMORY[0xD4]));
  MEMORY[0xD8] = env_uint_0("MallocProbGuardMetadata", (3 * MEMORY[0xD4]));
  uint32_t v10 = arc4random_uniform(0x1194u);
  int v11 = env_uint_0("MallocProbGuardSampleRate", v10 + 500);
  int v12 = 2 * v11;
  if (v11 == 1) {
    int v12 = 1;
  }
  MEMORY[0xDC] = v12;
  uint64_t v13 = getenv("MallocProbGuardDebug");
  if (v13) {
    BOOL v14 = *v13 == 49;
  }
  else {
    BOOL v14 = 0;
  }
  MEMORY[0xE0] = v14;
  unint64_t v15 = env_uint_0("MallocProbGuardDebugLogThrottleInMillis", 1000LL);
  MEMORY[0xE8] = v15;
  if (MEMORY[0xE0]) {
    malloc_report( 6u,  (uint64_t)"ProbGuard configuration: %u kB budget, 1/%u sample rate, %u/%u/%u allocations/metadata/slots\n");
  }
  if (!MEMORY[0xD4] || MEMORY[0xD4] > MEMORY[0xD8] >> 1 || MEMORY[0xD8] > MEMORY[0xD0] || !MEMORY[0xDC]) {
    pgm_create_zone_cold_3(v15);
  }
  MEMORY[0xF0] = *v5 * ((2 * MEMORY[0xD0]) | 1u);
  MEMORY[0x108] = MEMORY[0xF0] + 0x4000000LL;
  my_vm_map_common(0, MEMORY[0xF0] + 0x4000000LL, 0, 1, 1);
  MEMORY[0x110] = 0LL;
  MEMORY[0xF8] = 0x2000000LL;
  MEMORY[0x100] = MEMORY[0xF0] + 0x2000000LL;
  my_vm_map_common(0x2000000, MEMORY[0xF0], 0, 0x4000, 13);
  MEMORY[0x118] = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32LL))( MEMORY[0xC8],  MEMORY[0xD0],  8LL,  v16,  v17);
  uint64_t v20 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32LL))( MEMORY[0xC8],  MEMORY[0xD8],  256LL,  v18,  v19);
  MEMORY[0x120] = v20;
  if (!MEMORY[0x118] || !v20) {
    purgeable_ptr_in_use_enumerator_cold_1(v20, v21, v22);
  }
  MEMORY[0x4128] = 0;
  my_vm_protect(0LL, 0x4000LL, 1);
  return 0LL;
}

uint64_t my_vm_protect(mach_vm_address_t address, uint64_t a2, vm_prot_t new_protection)
{
  uint64_t result = mach_vm_protect( *MEMORY[0x1895FFD48],  address,  (a2 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148],  0,  new_protection);
  if ((_DWORD)result) {
    purgeable_ptr_in_use_enumerator_cold_1(result, v4, v5);
  }
  return result;
}

uint64_t pgm_extract_report_from_corpse()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint32_t v2 = v1;
  unsigned int v4 = v3;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v0;
  uint64_t v39 = *MEMORY[0x1895FEE08];
  uint64_t v12 = os_unfair_lock_lock_with_options();
  if (!v2) {
    purgeable_ptr_in_use_enumerator_cold_1(v12, v13, v14);
  }
  g_crm_reader_0 = v2;
  num_read_memory_0 = 0;
  if (!v4)
  {
LABEL_19:
    uint64_t v18 = 5LL;
    goto LABEL_20;
  }

  uint64_t v15 = v4;
  while (1)
  {
    unsigned int zone_type = get_zone_type( v8,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))memory_reader_adapter_0,  *v6,  v34);
    if (v34[0] == 2) {
      unsigned int v17 = 0;
    }
    else {
      unsigned int v17 = 257;
    }
    if (zone_type) {
      uint64_t v18 = zone_type;
    }
    else {
      uint64_t v18 = v17;
    }
    free_read_memory();
    if ((_DWORD)v18 == 257) {
      goto LABEL_18;
    }
    if ((_DWORD)v18) {
      goto LABEL_20;
    }
    uint64_t zone = read_zone( v8,  *v6,  (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))memory_reader_adapter_0,  (uint64_t)v34,  6);
    if ((_DWORD)zone)
    {
      uint64_t v18 = zone;
      free_read_memory();
      if ((_DWORD)v18 != 257) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }

    if (v35 <= v11 && v36 > v11) {
      break;
    }
    free_read_memory();
LABEL_18:
    ++v6;
    if (!--v15) {
      goto LABEL_19;
    }
  }

  unint64_t v21 = lookup_slot((uint64_t)v34, v11);
  uint64_t v24 = v37;
  int v25 = (_DWORD *)(v37 + 8LL * v21);
  if (v34[54] <= *v25 >> 2) {
    purgeable_ptr_in_use_enumerator_cold_1(v21, v22, v23);
  }
  if ((*v25 & 3) == 0)
  {
    unint64_t v26 = "low";
    uint64_t v27 = "long-range OOB";
    goto LABEL_32;
  }

  if ((*v25 & 3) == 2)
  {
    if ((v21 & 0x7FFFFFFE00000000LL) != 0)
    {
      if ((HIDWORD(v21) & 0x7FFFFFFE) != 2) {
        purgeable_ptr_in_use_enumerator_cold_1(v21, v22, v23);
      }
      unint64_t v26 = "low";
      uint64_t v27 = "OOB + UAF";
    }

    else
    {
      unint64_t v26 = "high";
      uint64_t v27 = "use-after-free";
    }

uint64_t pgm_size(os_unfair_lock_s *a1, unint64_t a2)
{
  if (*(void *)&a1[62]._os_unfair_lock_opaque > a2 || *(void *)&a1[64]._os_unfair_lock_opaque <= a2) {
    return (*(uint64_t (**)(void))(*(void *)&a1[50]._os_unfair_lock_opaque + 16LL))();
  }
  uint64_t v5 = a1 + 4170;
  os_unfair_lock_lock_with_options();
  unint64_t v6 = lookup_slot((uint64_t)a1, a2);
  if ((v6 & 0x8000000000000000LL) != 0) {
    uint64_t v7 = *(unsigned __int16 *)(*(void *)&a1[70]._os_unfair_lock_opaque + 8LL * v6 + 4);
  }
  else {
    uint64_t v7 = 0LL;
  }
  os_unfair_lock_unlock(v5);
  return v7;
}

uint64_t pgm_malloc(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (*MEMORY[0x189600148] < a2 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v7 = *(_DWORD *)(StatusReg + 880);
  if (v7 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  }
  if (v7)
  {
    uint32_t v9 = v7 - 1;
  }

  else
  {
    uint64_t v8 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v8) {
      purgeable_ptr_in_use_enumerator_cold_1(v8, a2, a3);
    }
    uint32_t v9 = arc4random_uniform(v8);
  }

  *(void *)(StatusReg + 880) = v9;
  if (v9) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v11 = allocate(a1, a2, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v11) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
  }
  else {
    return v11;
  }
}

uint64_t pgm_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!is_mul_ok(a2, a3)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
  }
  if (*MEMORY[0x189600148] < a2 * a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v12 = (void *)allocate(a1, a2 * a3, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v12) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32LL))();
  }
  bzero(v12, a2 * a3);
  return (uint64_t)v12;
}

uint64_t pgm_valloc(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)MEMORY[0x189600148];
  if (*MEMORY[0x189600148] < a2 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40LL))();
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40LL))();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v12 = allocate(a1, a2, *v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v12) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40LL))();
  }
  else {
    return v12;
  }
}

void pgm_free(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 248) <= a2 && *(void *)(a1 + 256) > a2)
  {
    os_unfair_lock_lock_with_options();
    deallocate(a1, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 200) + 48LL))();
  }

uint64_t pgm_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  if (!a2) {
    return pgm_malloc(a1, a3, a3);
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_13;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    goto LABEL_13;
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10)
  {
LABEL_13:
    int v12 = 0;
  }

  else
  {
    int v12 = 1;
  }

  os_unfair_lock_lock_with_options();
  uint64_t v13 = reallocate(a1, a2, a3, v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  return (uint64_t)v13;
}

uint64_t pgm_destroy(mach_vm_address_t a1)
{
  return my_vm_deallocate(a1, 16720LL);
}

uint64_t pgm_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x189600148] < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  }
  unint64_t v12 = a2 <= 0x10 ? 16LL : a2;
  os_unfair_lock_lock_with_options();
  uint64_t v13 = allocate(a1, a3, v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v13) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112LL))();
  }
  else {
    return v13;
  }
}

void pgm_free_definite_size(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 248) <= a2 && *(void *)(a1 + 256) > a2)
  {
    os_unfair_lock_lock_with_options();
    deallocate(a1, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 200) + 120LL))();
  }

uint64_t pgm_claimed_address(void *a1, unint64_t a2)
{
  if (a1[31] <= a2 && a1[32] > a2) {
    return 1LL;
  }
  else {
    return (*(uint64_t (**)(void))(a1[25] + 136LL))();
  }
}

uint64_t pgm_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (*MEMORY[0x189600148] < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 152LL))();
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 152LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v10 = *(_DWORD *)(StatusReg + 880);
  if (v10 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 152LL))();
  }
  if (v10)
  {
    uint32_t v12 = v10 - 1;
  }

  else
  {
    uint64_t v11 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v11) {
      purgeable_ptr_in_use_enumerator_cold_1(v11, a2, a3);
    }
    uint32_t v12 = arc4random_uniform(v11);
  }

  *(void *)(StatusReg + 880) = v12;
  if (v12) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 152LL))();
  }
  unint64_t v14 = a2 <= 0x10 ? 16LL : a2;
  os_unfair_lock_lock_with_options();
  uint64_t v15 = (void *)allocate(a1, a3, v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v15) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 152LL))();
  }
  if ((a4 & 1) != 0) {
    bzero(v15, a3);
  }
  return (uint64_t)v15;
}

uint64_t pgm_malloc_type_malloc(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (*MEMORY[0x189600148] < a2 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 160LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v7 = *(_DWORD *)(StatusReg + 880);
  if (v7 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 160LL))();
  }
  if (v7)
  {
    uint32_t v9 = v7 - 1;
  }

  else
  {
    uint64_t v8 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v8) {
      purgeable_ptr_in_use_enumerator_cold_1(v8, a2, a3);
    }
    uint32_t v9 = arc4random_uniform(v8);
  }

  *(void *)(StatusReg + 880) = v9;
  if (v9) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 160LL))();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v11 = allocate(a1, a2, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v11) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 160LL))();
  }
  else {
    return v11;
  }
}

uint64_t pgm_malloc_type_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!is_mul_ok(a2, a3)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 168LL))();
  }
  if (*MEMORY[0x189600148] < a2 * a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 168LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 168LL))();
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 168LL))();
  }
  os_unfair_lock_lock_with_options();
  uint32_t v12 = (void *)allocate(a1, a2 * a3, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v12) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 168LL))();
  }
  bzero(v12, a2 * a3);
  return (uint64_t)v12;
}

uint64_t pgm_malloc_type_realloc(uint64_t a1, const void *a2, unint64_t a3, uint64_t a4)
{
  if (!a2) {
    return pgm_malloc_type_malloc(a1, a3, a4);
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_13;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v9 = *(_DWORD *)(StatusReg + 880);
  if (v9 == -1) {
    goto LABEL_13;
  }
  if (v9)
  {
    uint32_t v11 = v9 - 1;
  }

  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v10) {
      purgeable_ptr_in_use_enumerator_cold_1(v10, a2, a3);
    }
    uint32_t v11 = arc4random_uniform(v10);
  }

  *(void *)(StatusReg + 880) = v11;
  if (v11)
  {
LABEL_13:
    int v13 = 0;
  }

  else
  {
    int v13 = 1;
  }

  os_unfair_lock_lock_with_options();
  unint64_t v14 = reallocate(a1, a2, a3, v13);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  return (uint64_t)v14;
}

uint64_t pgm_malloc_type_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x189600148] < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 184LL))();
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 184LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 184LL))();
  }
  if (v8)
  {
    uint32_t v10 = v8 - 1;
  }

  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9) {
      purgeable_ptr_in_use_enumerator_cold_1(v9, a2, a3);
    }
    uint32_t v10 = arc4random_uniform(v9);
  }

  *(void *)(StatusReg + 880) = v10;
  if (v10) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 184LL))();
  }
  unint64_t v12 = a2 <= 0x10 ? 16LL : a2;
  os_unfair_lock_lock_with_options();
  uint64_t v13 = allocate(a1, a3, v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v13) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 184LL))();
  }
  else {
    return v13;
  }
}

uint64_t pgm_malloc_type_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (*MEMORY[0x189600148] < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 192LL))();
  }
  if (*MEMORY[0x189600148] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 192LL))();
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v10 = *(_DWORD *)(StatusReg + 880);
  if (v10 == -1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 192LL))();
  }
  if (v10)
  {
    uint32_t v12 = v10 - 1;
  }

  else
  {
    uint64_t v11 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v11) {
      purgeable_ptr_in_use_enumerator_cold_1(v11, a2, a3);
    }
    uint32_t v12 = arc4random_uniform(v11);
  }

  *(void *)(StatusReg + 880) = v12;
  if (v12) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 192LL))();
  }
  unint64_t v14 = a2 <= 0x10 ? 16LL : a2;
  os_unfair_lock_lock_with_options();
  uint64_t v15 = (void *)allocate(a1, a3, v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v15) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 192LL))();
  }
  if ((a4 & 1) != 0) {
    bzero(v15, a3);
  }
  return (uint64_t)v15;
}

unint64_t lookup_slot(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 248);
  unint64_t v3 = a2 - v2;
  if (a2 < v2 || (unint64_t v4 = *(void *)(a1 + 256), v4 <= a2)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  unint64_t v5 = *MEMORY[0x189600148];
  if (v2 % *MEMORY[0x189600148]) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  if (v5 + v2 <= a2)
  {
    if (v4 - v5 <= a2)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 208) - 1;
    }

    else if (((v3 / v5) & 1) == 0 && a2 % v5 >= v5 >> 1)
    {
      unsigned int v6 = (((v3 / v5) - 1) >> 1) + 1;
    }

    else
    {
      unsigned int v6 = ((v3 / v5) - 1) >> 1;
    }
  }

  else
  {
    unsigned int v6 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 280);
  uint64_t v9 = v6;
  if (((v3 / v5) & 1) != 0)
  {
    uint64_t v12 = v8 + 8LL * v6;
    unsigned int v13 = *(unsigned __int16 *)(v12 + 6);
    unsigned int v14 = (unsigned __int16)(a2 % v5);
    if (v14 == v13)
    {
      uint64_t v11 = 0LL;
      char v10 = 1;
    }

    else
    {
      char v10 = 0;
      BOOL v15 = v14 < (unsigned __int16)(*(_WORD *)(v12 + 4) + v13) && v14 > v13;
      uint64_t v11 = 0x200000000LL;
      if (v15) {
        uint64_t v11 = 0x100000000LL;
      }
    }
  }

  else
  {
    char v10 = 0;
    uint64_t v11 = 0x300000000LL;
  }

  BOOL v16 = (v10 & ((*(_DWORD *)(v8 + 8 * v9) & 3) == 1)) == 0;
  unint64_t v17 = 0x8000000000000000LL;
  if (v16) {
    unint64_t v17 = 0LL;
  }
  return v11 | v9 | v17;
}

uint64_t allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = (uint64_t *)MEMORY[0x189600148];
  unint64_t v4 = *MEMORY[0x189600148];
  if (*MEMORY[0x189600148] < a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  if (a3 < 0x10 || v4 < a3) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] != 1LL) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint64_t v7 = a1;
  uint64_t v8 = (_DWORD *)(a1 + 16684);
  if (*(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return 0LL;
  }
  if (a2) {
    unint64_t v10 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  else {
    unint64_t v10 = 16LL;
  }
  uint64_t v11 = *(unsigned int *)(a1 + 16692);
  uint64_t v12 = *(void *)(a1 + 280);
  int v13 = *(_DWORD *)(v12 + 8 * v11) & 3;
  unsigned int v14 = *(_DWORD *)(a1 + 208);
  while (v13 == 1)
  {
    LODWORD(v11) = ((int)v11 + 1) % v14;
    int v13 = *(_DWORD *)(v12 + 8LL * v11) & 3;
  }

  *(_DWORD *)(a1 + 16692) = ((int)v11 + 1) % v14;
  LODWORD(v15) = *(_DWORD *)(a1 + 16688);
  if (v15 >= *(_DWORD *)(a1 + 216))
  {
    unint64_t v15 = (unint64_t)*(unsigned int *)(v12 + 8LL * v11) >> 2;
    if (*(_DWORD *)(*(void *)(a1 + 288) + (v15 << 8)) != (_DWORD)v11)
    {
      do
      {
        uint64_t v16 = *(unsigned int *)(v7 + 216);
        if (!(_DWORD)v16) {
          purgeable_ptr_in_use_enumerator_cold_1(v16, a2, a3);
        }
        a1 = arc4random_uniform(v16);
      }

      while ((*(_DWORD *)(*(void *)(v7 + 280)
                         + 8LL * *(unsigned int *)(*(void *)(v7 + 288) + ((unint64_t)a1 << 8))) & 3) != 2);
      unint64_t v4 = *v3;
      LODWORD(v15) = a1;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 16688) = v15 + 1;
  }

  uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(unsigned __int16)v4);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] != 1LL) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  uint64_t v18 = arc4random_uniform(2u);
  if ((_DWORD)v18) {
    unsigned __int16 v21 = 0;
  }
  else {
    unsigned __int16 v21 = (v4 - v10) & -(__int16)a3;
  }
  mach_vm_address_t v22 = *(void *)(v7 + 248) + *v3 * ((2 * (_DWORD)v11) | 1u);
  my_vm_protect(v22, *v3, 3);
  uint64_t v23 = *(void *)(v7 + 280) + 8LL * v11;
  *(_DWORD *)uint64_t v23 = (4 * v15) | 1;
  *(_WORD *)(v23 + 4) = v10;
  *(_WORD *)(v23 + 6) = v21;
  unint64_t v24 = *(void *)(v7 + 288) + ((unint64_t)v15 << 8);
  *(_DWORD *)unint64_t v24 = v11;
  *(void *)(v24 + 4) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(void *)(v24 + 12) = mach_absolute_time();
  *(void *)(v24 + 30) = 0LL;
  *(void *)(v24 + 22) = 0LL;
  *(_WORD *)(v24 + 38) = 0;
  *(_WORD *)(v24 + 20) = trace_collect(v24 + 40, 216LL);
  ++*v8;
  unint64_t v25 = *(void *)(v7 + 16696) + v10;
  *(void *)(v7 + 16696) = v25;
  if (v25 <= *(void *)(v7 + 16704)) {
    unint64_t v25 = *(void *)(v7 + 16704);
  }
  *(void *)(v7 + 16704) = v25;
  uint64_t v9 = v22 + v21;
  debug_zone(v7, (uint64_t)"allocated", v9);
  return v9;
}

uint64_t debug_zone(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(result + 224))
  {
    uint64_t v4 = result;
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = v5 - *(void *)(v4 + 16712);
    mach_timebase_info(&info);
    if (*(void *)(v4 + 232) <= v6 * info.numer / info.denom / 0xF4240)
    {
      *(void *)(v4 + 16712) = v5;
      malloc_report(6u, (uint64_t)"ProbGuard: %9s 0x%llx, fill state: %3u/%u\n");
    }

    uint64_t result = pgm_check(v4);
    if (!(_DWORD)result) {
      debug_zone_cold_1(a3);
    }
  }

  return result;
}

BOOL pgm_check(uint64_t a1)
{
  BOOL result = check_zone(a1);
  if (result)
  {
    BOOL result = check_slots(a1);
    if (result) {
      return check_metadata(a1);
    }
  }

  return result;
}

BOOL check_zone(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 212);
  if (!v1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 216);
  if (v1 > v2 >> 1) {
    return 0LL;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 208);
  if (v2 > v3) {
    return 0LL;
  }
  unint64_t v4 = *(unsigned int *)(a1 + 220);
  if ((_DWORD)v4)
  {
    unint64_t v5 = *(void *)(a1 + 240);
    unint64_t v6 = *MEMORY[0x189600148];
    if (v5 != *MEMORY[0x189600148] * ((2 * v3) | 1)) {
      return 0LL;
    }
    unint64_t v7 = *(void *)(a1 + 248);
    if (v7 % v6) {
      return 0LL;
    }
    unint64_t v4 = v5 % v6;
    if (v4) {
      return 0LL;
    }
    unint64_t v9 = *(void *)(a1 + 256);
    if (v7 + v5 == v9 && v7 < v9)
    {
      if (*(void *)(a1 + 264) != v5 + 0x4000000) {
        return 0LL;
      }
      unint64_t v4 = 0LL;
      unint64_t v10 = *(void *)(a1 + 272);
      if (v10 != v7 - 0x2000000 || v10 >= v7) {
        return v4;
      }
      unsigned int v11 = *(_DWORD *)(a1 + 16684);
      if (v11 > v1) {
        return 0LL;
      }
      unint64_t v4 = 0LL;
      unsigned int v12 = *(_DWORD *)(a1 + 16688);
      if (v11 > v12 || v12 > v2) {
        return v4;
      }
      if (*(_DWORD *)(a1 + 16692) >= v3) {
        return 0LL;
      }
      unint64_t v4 = *(void *)(a1 + 280);
      if (v4)
      {
        unint64_t v4 = *(void *)(a1 + 288);
        if (v4) {
          return *(void *)(a1 + 16696) <= *(void *)(a1 + 16704);
        }
      }
    }
  }

  return v4;
}

BOOL check_slots(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v1)
  {
    uint64_t v2 = 0LL;
    int v3 = 0;
    unint64_t v4 = *MEMORY[0x189600148];
    for (uint64_t i = (unsigned __int16 *)(*(void *)(a1 + 280) + 6LL); ; i += 4)
    {
      unsigned int v6 = *(_DWORD *)(i - 3);
      int v7 = v6 & 3;
      if ((v6 & 3) != 0)
      {
        if (v7 == 3) {
          return 0LL;
        }
        if (*(_DWORD *)(a1 + 16688) <= v6 >> 2) {
          return 0LL;
        }
        unint64_t v8 = *(i - 1);
        if (v4 < v8) {
          return 0LL;
        }
        uint64_t v9 = ((_DWORD)v8 + 15) & 0x1FFF0;
        if (!*(i - 1)) {
          uint64_t v9 = 16LL;
        }
        if (v9 != v8) {
          return 0LL;
        }
        uint64_t v10 = 0LL;
        unint64_t v11 = *i;
        if (v4 < v11 || (v11 & 0xF) != 0 || v11 + v8 > v4) {
          return v10;
        }
        if (v7 == 1)
        {
          ++v3;
          v2 += v8;
        }
      }

      if (!--v1) {
        return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(void *)(a1 + 16696);
      }
    }
  }

  int v3 = 0;
  uint64_t v2 = 0LL;
  return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(void *)(a1 + 16696);
}

BOOL check_metadata(uint64_t a1)
{
  unint64_t v1 = *(unsigned int *)(a1 + 16688);
  if ((_DWORD)v1)
  {
    uint64_t v2 = *(unsigned int **)(a1 + 288);
    unint64_t v3 = *(unsigned int *)(a1 + 208);
    unint64_t v4 = *v2;
    if (v4 >= v3)
    {
      return 0;
    }

    else
    {
      BOOL v5 = 0;
      unsigned int v6 = v2 + 64;
      unint64_t v7 = 1LL;
      do
      {
        BOOL v5 = v7 >= v1;
        if (v1 == v7) {
          break;
        }
        unint64_t v4 = *v6;
        v6 += 64;
        ++v7;
      }

      while (v4 < v3);
    }
  }

  else
  {
    return 1;
  }

  return v5;
}

uint64_t deallocate(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = lookup_slot(a1, a2);
  if ((v4 & 0x8000000000000000LL) == 0) {
    deallocate_cold_1(a2);
  }
  unsigned int v5 = v4;
  uint64_t v6 = *(void *)(a1 + 280);
  uint64_t v7 = 8LL * v4;
  uint64_t v8 = *(unsigned int *)(v6 + v7);
  *(_DWORD *)(v6 + v7) = v8 & 0xFFFFFFFC | 2;
  uint64_t v9 = *(void *)(a1 + 288) + ((v8 << 6) & 0x3FFFFFFF00LL);
  *(void *)(v9 + 22) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(void *)(v9 + 30) = mach_absolute_time();
  else {
    uint64_t v10 = *(unsigned __int16 *)(v9 + 20);
  }
  *(_WORD *)(v9 + 20) = v10;
  uint64_t v11 = trace_collect(v9 + v10 + 40, 216 - v10);
  int v14 = *(_DWORD *)(a1 + 16684);
  *(_WORD *)(v9 + 38) = v11;
  *(_DWORD *)(a1 + 16684) = v14 - 1;
  *(void *)(a1 + 16696) -= *(unsigned __int16 *)(*(void *)(a1 + 280) + v7 + 4);
  if (*(_DWORD *)(a1 + 208) <= v5) {
    purgeable_ptr_in_use_enumerator_cold_1(v11, v12, v13);
  }
  unint64_t v15 = (uint64_t *)MEMORY[0x189600148];
  uint64_t v16 = (void *)(*(void *)(a1 + 248) + *MEMORY[0x189600148] * ((2 * v5) | 1LL));
  uint64_t v17 = madvise(v16, *MEMORY[0x189600148], 7);
  if ((_DWORD)v17) {
    purgeable_ptr_in_use_enumerator_cold_1(v17, v18, v19);
  }
  my_vm_protect((mach_vm_address_t)v16, *v15, 0);
  return debug_zone(a1, (uint64_t)"freed", a2);
}

void *reallocate(uint64_t a1, const void *a2, unint64_t a3, int a4)
{
  BOOL v8 = *(void *)(a1 + 248) <= (unint64_t)a2 && *(void *)(a1 + 256) > (unint64_t)a2;
  if (!(v8 | a4)) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  if (!v8)
  {
    unint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16LL))();
    if (v11) {
      goto LABEL_8;
    }
LABEL_13:
    reallocate_cold_2((uint64_t)a2);
  }

  unint64_t v9 = lookup_slot(a1, (unint64_t)a2);
  if ((v9 & 0x8000000000000000LL) == 0) {
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 280) + 8LL * v9;
  unint64_t v11 = *(unsigned __int16 *)(v10 + 4);
  if (!*(_WORD *)(v10 + 4)) {
    goto LABEL_13;
  }
LABEL_8:
  if (a4 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    uint64_t v12 = (void *)allocate(a1, a3, 0x10uLL);
    if (!v12) {
      purgeable_ptr_in_use_enumerator_cold_1(0LL, v13, v14);
    }
  }

  else
  {
    uint64_t v12 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24LL))();
    if (!v12) {
      return v12;
    }
  }

  if (v11 >= a3) {
    size_t v15 = a3;
  }
  else {
    size_t v15 = v11;
  }
  memcpy(v12, a2, v15);
  if (v8) {
    deallocate(a1, (unint64_t)a2);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 200) + 48LL))();
  }
  return v12;
}

uint64_t my_vm_deallocate(mach_vm_address_t address, uint64_t a2)
{
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1895FFD48], address, (a2 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148]);
  if ((_DWORD)result) {
    purgeable_ptr_in_use_enumerator_cold_1(result, v3, v4);
  }
  return result;
}

uint64_t pgm_enumerator()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v25 = *MEMORY[0x1895FEE08];
  if ((v2 & 3) != 0)
  {
    uint64_t v6 = v5;
    char v7 = v2;
    uint64_t v8 = v1;
    uint64_t v9 = v0;
    uint64_t result = read_zone(v0, v3, v4, (uint64_t)v21, 2);
    if ((_DWORD)result) {
      return result;
    }
    unint64_t v13 = v22;
    if (v22)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      unint64_t v16 = 0LL;
      uint64_t v17 = (uint64_t *)MEMORY[0x189600148];
      do
      {
        if ((*(_DWORD *)(v24 + 4 * v15) & 3) == 1)
        {
          if ((v7 & 2) != 0)
          {
            uint64_t v18 = *v17;
            uint64_t v19 = v23 + *v17 * (v15 & 0xFFFFFFFE | 1LL);
            uint64_t v20 = v18;
            uint64_t result = v6(v9, v8, 2LL, &v19, 1LL);
            unint64_t v13 = v22;
          }

          if ((v7 & 1) != 0)
          {
            if (v16 >= v13) {
              purgeable_ptr_in_use_enumerator_cold_1(result, v11, v12);
            }
            uint64_t v19 = v23 + *v17 * (v15 & 0xFFFFFFFE | 1LL) + *(unsigned __int16 *)(v24 + v14 + 6);
            uint64_t v20 = *(unsigned __int16 *)(v24 + v14 + 4);
            uint64_t result = v6(v9, v8, 1LL, &v19, 1LL);
            unint64_t v13 = v22;
          }
        }

        ++v16;
        v15 += 2LL;
        v14 += 8LL;
      }

      while (v16 < v13);
    }
  }

  return 0LL;
}

uint64_t pgm_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 200) + 96LL) + 8LL))();
}

void pgm_print(uint64_t a1, int a2)
{
  malloc_report_simple((uint64_t)"ProbGuard zone: slots: %u, slots in use: %u, size in use: %llu, max size in use: %llu, a"
                                "llocated size: %llu\n");
  malloc_report_simple((uint64_t)"Quarantine: size: %llu, address range: [%p - %p)\n");
  malloc_report_simple((uint64_t)"Slots (#, state, offset, size, block address):\n");
  unint64_t v4 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v4)
  {
    uint64_t v5 = 0LL;
    int v6 = 0;
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      if (a2 || (*(_DWORD *)(*(void *)(a1 + 280) + v5) & 3) == 1)
      {
        malloc_report_simple((uint64_t)"%4u, %9s, %4u, %4u, %p\n");
        unint64_t v4 = *(unsigned int *)(a1 + 208);
      }

      v6 += 2;
      v5 += 8LL;
    }
  }

uint64_t pgm_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void pgm_force_unlock(os_unfair_lock_s *a1)
{
}

__n128 pgm_statistics(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 16684);
  uint64_t v3 = *MEMORY[0x189600148] * v2;
  *(_DWORD *)a2 = v2;
  __n128 result = *(__n128 *)(a1 + 16696);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v3;
  return result;
}

BOOL pgm_zone_locked(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 4170;
  BOOL v2 = os_unfair_lock_trylock(a1 + 4170);
  if (v2) {
    os_unfair_lock_unlock(v1);
  }
  return !v2;
}

uint64_t pgm_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16680) = 0;
  return result;
}

uint64_t pgm_print_task()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  BOOL v2 = v1;
  unint64_t v4 = (const void *)v3;
  unsigned int v6 = v5;
  uint64_t v10 = *MEMORY[0x1895FEE08];
  else {
    return print_zone((uint64_t)v9, v6 > 1, (void (*)(const char *, ...))v2);
  }
}

double pgm_statistics_task()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v2 = v1;
  uint64_t v10 = *MEMORY[0x1895FEE08];
  if (!read_zone(v0, v3, v4, (uint64_t)v7, 1))
  {
    uint64_t v6 = *MEMORY[0x189600148] * v8;
    *(_DWORD *)uint64_t v2 = v8;
    double result = v9[0];
    *(_OWORD *)(v2 + 8) = *(_OWORD *)v9;
    *(void *)(v2 + 24) = v6;
  }

  return result;
}

uint64_t read_zone( uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, const void **a4), uint64_t a4, char a5)
{
  char v7 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v11, v12);
      }
    }

    char v7 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))_malloc_default_reader_3;
  }

  uint64_t result = v7(task, a2, 16720LL, &v15);
  if (!(_DWORD)result)
  {
    uint64_t v14 = v15;
    memcpy((void *)a4, v14, 0x4150uLL);
    if ((a5 & 2) != 0)
    {
      uint64_t result = v7(task, *(void *)(a4 + 280), 8LL * *(unsigned int *)(a4 + 208), (const void **)(a4 + 280));
      if ((_DWORD)result) {
        return result;
      }
      if (!check_slots(a4)) {
        return 5LL;
      }
    }

    if ((a5 & 4) == 0) {
      return 0LL;
    }
    uint64_t result = v7( task,  *(void *)(a4 + 288),  (unint64_t)*(unsigned int *)(a4 + 216) << 8,  (const void **)(a4 + 288));
    if (!(_DWORD)result)
    {
      if (check_metadata(a4)) {
        return 0LL;
      }
      return 5LL;
    }
  }

  return result;
}

uint64_t _malloc_default_reader_3(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t print_zone(uint64_t a1, int a2, void (*a3)(const char *, ...))
{
  uint64_t v6 = (void *)MEMORY[0x189600148];
  a3( "ProbGuard zone: slots: %u, slots in use: %u, size in use: %llu, max size in use: %llu, allocated size: %llu\n",  *(_DWORD *)(a1 + 208),  *(_DWORD *)(a1 + 16684),  *(void *)(a1 + 16696),  *(void *)(a1 + 16704),  *MEMORY[0x189600148] * *(unsigned int *)(a1 + 16684));
  a3( "Quarantine: size: %llu, address range: [%p - %p)\n",  *(void *)(a1 + 240),  *(const void **)(a1 + 248),  *(const void **)(a1 + 256));
  uint64_t result = ((uint64_t (*)(const char *))a3)("Slots (#, state, offset, size, block address):\n");
  unint64_t v8 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v8)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    for (unint64_t i = 0LL; i < v8; ++i)
    {
      uint64_t v12 = *(void *)(a1 + 280);
      if (a2 || (*(_DWORD *)(v12 + 4 * v10) & 3) == 1)
      {
        uint64_t result = ((uint64_t (*)(const char *, ...))a3)( "%4u, %9s, %4u, %4u, %p\n",  i,  slot_state_labels[*(_DWORD *)(v12 + 4 * v10) & 3],  *(unsigned __int16 *)(v12 + v9 + 6),  *(unsigned __int16 *)(v12 + v9 + 4),  (const void *)(*(unsigned __int16 *)(v12 + v9 + 6)
        unint64_t v8 = *(unsigned int *)(a1 + 208);
      }

      v10 += 2LL;
      v9 += 8LL;
    }
  }

  return result;
}

unint64_t env_uint_0(const char *a1, uint64_t a2)
{
  uint64_t v3 = getenv(a1);
  if (v3) {
    return strtoul(v3, 0LL, 0);
  }
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> my_vm_map_common( int a1, uint64_t a2, vm_prot_t cur_protection, int a4, int a5)
{
  uint64_t v5 = mach_vm_map( *MEMORY[0x1895FFD48],  &address,  (a2 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148],  0LL,  a4 | (a5 << 24),  0,  0LL,  0,  cur_protection,  3,  1u);
  if ((_DWORD)v5) {
    purgeable_ptr_in_use_enumerator_cold_1(v5, v6, v7);
  }
}

uint64_t memory_reader_adapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = g_crm_reader_0();
  *a4 = v5;
  if (!v5) {
    return 5LL;
  }
  uint64_t v6 = v5;
  uint64_t result = 0LL;
  uint64_t v8 = num_read_memory_0++;
  read_memory_0[v8] = v6;
  return result;
}

void free_read_memory()
{
  if (num_read_memory_0)
  {
    unint64_t v0 = 0LL;
    do
      _free((void *)read_memory_0[v0++]);
    while (v0 < num_read_memory_0);
  }

  num_read_memory_0 = 0;
}

void OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2)
{
}

void nanov2_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  _DWORD __src[8] = *MEMORY[0x1895FEE08];
  if ((_simple_getenv() || malloc_common_value_for_key(a3, "nanov2_madvise_policy"))
    && _platform_strncmp())
  {
    if (!_platform_strncmp())
    {
      int v4 = 1;
      goto LABEL_10;
    }

    if (!_platform_strncmp())
    {
      int v4 = 2;
      goto LABEL_10;
    }

    malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
  }

  int v4 = 0;
LABEL_10:
  nanov2_madvise_policy = v4;
  uint64_t v5 = _simple_getenv();
  if (v5 || (uint64_t v5 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_single_arena", v42, 0x100uLL)) != 0)
  {
    int v6 = 0;
    uint64_t v7 = (char *)v5;
    while (*v7)
    {
      unint64_t v8 = malloc_common_convert_to_long(v7, __src);
      if ((char *)__src[0] == v7
        || ((int v9 = *(unsigned __int8 *)__src[0], v9 != 58) ? (v10 = v9 == 0) : (v10 = 1),
            !v10 || v8 - 16 > 0xF0 || (v8 & 0xF) != 0))
      {
        malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
        goto LABEL_25;
      }

      v6 |= 1 << ((v8 >> 4) - 1);
      uint64_t v7 = (char *)(__src[0] + 1LL);
      if (!*(_BYTE *)__src[0]) {
        break;
      }
    }
  }

  else
  {
LABEL_25:
    LOWORD(v6) = 0;
  }

  word_18C444A78 = v6;
  uint64_t v11 = _simple_getenv();
  if (v11)
  {
    uint64_t v12 = (char *)v11;
  }

  else
  {
    unint64_t v13 = malloc_common_value_for_key_copy(a3, "nanov2_scan_policy", v42, 0x100uLL);
    if (!v13)
    {
LABEL_69:
      int v19 = 10;
      int v18 = 80;
      int v17 = 20;
      int v31 = 1;
      goto LABEL_75;
    }

    uint64_t v12 = v13;
  }

  if (!_platform_strcmp())
  {
    int v31 = 0;
    int v19 = 10;
    int v18 = 80;
    int v17 = 20;
    goto LABEL_75;
  }

  if (!*v12) {
    goto LABEL_69;
  }
  uint64_t v40 = a3;
  int v14 = 0;
  int v15 = 0;
  int v16 = 0;
  int v17 = 20;
  int v18 = 80;
  int v19 = 10;
  uint64_t v20 = v12;
  while (1)
  {
    if (_platform_strncmp() | v14)
    {
      if (_platform_strncmp() | v15)
      {
        if (_platform_strncmp() | v16)
        {
          LOBYTE(v21) = 1;
        }

        else
        {
          v20 += 3;
          uint64_t v28 = malloc_common_convert_to_long(v20, __src);
          int v21 = v20 == (char *)__src[0] || v28 < 0;
          if (!v21)
          {
            int v19 = v28;
            uint64_t v20 = (char *)__src[0];
          }

          int v16 = 1;
        }
      }

      else
      {
        v20 += 3;
        uint64_t v25 = malloc_common_convert_to_long(v20, __src);
        BOOL v27 = v20 != (char *)__src[0] && v25 >= 0;
        int v21 = v27 && v25 < 101;
        BOOL v10 = v21 == 0;
        LOBYTE(v21) = v21 ^ 1;
        if (!v10)
        {
          int v18 = v25;
          uint64_t v20 = (char *)__src[0];
        }

        int v15 = 1;
      }
    }

    else
    {
      v20 += 3;
      uint64_t v22 = malloc_common_convert_to_long(v20, __src);
      BOOL v24 = v20 != (char *)__src[0] && v22 >= 0;
      int v21 = v24 && v22 < 101;
      BOOL v10 = v21 == 0;
      LOBYTE(v21) = v21 ^ 1;
      if (!v10)
      {
        int v17 = v22;
        uint64_t v20 = (char *)__src[0];
      }

      int v14 = 1;
    }

    if (*v20 != 58) {
      break;
    }
    if ((v21 & 1) != 0) {
      goto LABEL_73;
    }
    if (!*++v20)
    {
      if (v17 <= v18) {
        goto LABEL_74;
      }
LABEL_73:
      malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
      a3 = v40;
      goto LABEL_76;
    }
  }

  if (*v20 || v21 & 1 | (v17 > v18)) {
    goto LABEL_73;
  }
LABEL_74:
  int v31 = 1;
  a3 = v40;
LABEL_75:
  nanov2_policy_config = v31;
  unk_18C444A6C = v17;
  dword_18C444A70 = v18;
  unk_18C444A74 = v19;
LABEL_76:
  uint64_t v32 = _simple_getenv();
  if (v32 || (uint64_t v32 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_size_class_blocks", v42, 0x100uLL)) != 0)
  {
    uint64_t v33 = 0LL;
    int v34 = 0;
    unint64_t v35 = (char *)v32;
    do
    {
      int v36 = malloc_common_convert_to_long(v35, &v41);
      uint64_t v37 = v41;
      if (v41 == v35 || (v33 != 60 ? (int v38 = 44) : (int v38 = 0), v38 != *v41 || v36 > 64))
      {
        uint64_t v39 = "%s value invalid: [%s] - ignored.\n";
        goto LABEL_89;
      }

      *(_DWORD *)((char *)__src + v33) = v36;
      v34 += v36;
      unint64_t v35 = v37 + 1;
      v33 += 4LL;
    }

    while (v33 != 64);
    if (v34 == 64)
    {
      memcpy(block_units_by_size_class, __src, 0x40uLL);
      return;
    }

    uint64_t v39 = "%s value invalid - values must sum to %d, not %d - ignored.\n";
LABEL_89:
    malloc_report(3u, (uint64_t)v39);
  }

uint64_t nanov2_configure()
{
  if (nanov2_config_predicate != -1) {
    return _os_once();
  }
  return result;
}

void nanov2_configure_once()
{
  uint64_t v0 = 0LL;
  int32x4_t v1 = 0uLL;
  do
    int32x4_t v1 = vaddq_s32(vshlq_n_s32((int32x4_t)block_units_by_size_class[v0++], 6uLL), v1);
  while (v0 != 4);
  if (vaddvq_s32(v1) != 4096) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  first_block_offset_by_size_class[0] = 1;
  int v2 = LODWORD(block_units_by_size_class[0]) << 6;
  last_block_offset_by_size_class[0] = (LODWORD(block_units_by_size_class[0]) << 6) - 1;
  uint64_t v3 = 1u;
  do
  {
    first_block_offset_by_size_class[v3] = v2;
    v2 += *(_DWORD *)((char *)block_units_by_size_class + v3 * 4) << 6;
    last_block_offset_by_size_class[v3++] = v2 - 1;
  }

  while (v3 != 16);
  if (v2 != 4096) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v4 = 0LL;
  int v5 = 0;
  do
  {
    int v6 = *((_DWORD *)block_units_by_size_class + v4);
    if (v6 >= 1)
    {
      uint64_t v7 = (_DWORD *)((char *)&ptr_offset_to_size_class + 4 * v5);
      v5 += v6;
      do
      {
        *v7++ = v4;
        --v6;
      }

      while (v6);
    }

    ++v4;
  }

  while (v4 != 16);
  if (v5 != 64) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
}

uint64_t nanov2_size(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFE000000FLL) != 0x300000000LL) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16LL))();
  }
  if (*(void *)(a1 + 28720) > a2 || *(void *)(a1 + 28728) < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16LL))();
  }
  uint64_t v3 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  unsigned int v4 = *(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000LL)
                 + 4LL * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v4 > 0x7FD)
  {
    if (v4 - 2046 < 2) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16LL))();
    }
    goto LABEL_13;
  }

  if (!v4 || v4 == 2042) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16LL))();
  }
  if (v4 != 2044)
  {
LABEL_13:
    if (((*(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000LL) {
  }
    }

  unint64_t v5 = 16 * (int)v3 + 16;
  if ((a2 & 0x3FFF) == (a2 & 0x3FFF) / v5 * v5 && (_DWORD)v5 && (*(void *)(a1 + 28696) ^ *(void *)a2) != a2) {
    return v5;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16LL))();
}

void *nanov2_malloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x10) {
    unint64_t v2 = 16LL;
  }
  else {
    unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v2 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24LL))();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }

  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  uint64_t v7 = *(unsigned int **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0LL;
    unsigned int v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      uint64_t v12 = 0LL;
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v14 = 0LL;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0LL);
      }

      int v13 = v9 & 0x7FF;
      uint64_t v14 = 0LL;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0LL);
      }
      int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        while (1)
        {
          unsigned int v19 = __ldxr(v7);
          if (v19 != v9) {
            break;
          }
          if (!__stxr(v18, v7))
          {
            int v25 = slots_by_size_class[v3] + ~v15;
            char v26 = 1;
            goto LABEL_37;
          }
        }

        __clrex();
      }

      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v25 = v13 - 1;
        uint64_t v14 = v8 + v25 * v11;
        if (v15) {
          __int16 v20 = *(_WORD *)(v14 + 8);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        while (1)
        {
          unsigned int v22 = __ldxr(v7);
          if (v22 != v9) {
            break;
          }
          if (!__stxr(v21, v7))
          {
            char v23 = 1;
            goto LABEL_31;
          }
        }

        char v23 = 0;
        __clrex();
LABEL_31:
        if ((v23 & 1) != 0)
        {
          if (v14) {
            goto LABEL_45;
          }
          char v26 = 0;
LABEL_37:
          if (!v8) {
            unint64_t v8 = v10;
          }
          uint64_t v14 = v8 + v25 * v11;
          if ((v26 & 1) == 0)
          {
LABEL_45:
            if ((*(void *)(a1 + 28696) ^ *(void *)v14) != v14) {
              goto LABEL_41;
            }
          }

          else if (!v14)
          {
LABEL_41:
            uint64_t v12 = 0LL;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0LL);
          }

          *(void *)uint64_t v14 = 0LL;
          *(void *)(v14 + 8) = 0LL;
          return (void *)v14;
        }

        unsigned int v19 = v22;
      }

      unsigned int v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        uint64_t v14 = 0LL;
        uint64_t v12 = v7;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0LL);
      }
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0LL);
}

void *nanov2_malloc_type(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  if (a2 <= 0x10) {
    unint64_t v3 = 16LL;
  }
  if (v3 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160LL))();
  }
  uint64_t v4 = (v3 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v5) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v5) = v5 % nano_common_max_magazines;
  }

  unsigned int v6 = v5 & 0x3F;
  uint64_t v7 = a1 + (v4 << 9) + 8 * (v5 & 0x3F);
  unint64_t v8 = *(unsigned int **)(v7 + 0x4000);
  if (v8)
  {
    unint64_t v9 = 0LL;
    unsigned int v10 = *v8;
    unint64_t v11 = (unint64_t)v8 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
    int v12 = 16 * v4 + 16;
    while (1)
    {
      int v13 = 0LL;
      if ((v10 & 0x80000000) == 0)
      {
        uint64_t v15 = 0LL;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }

      int v14 = v10 & 0x7FF;
      uint64_t v15 = 0LL;
      if (v14 == 2044) {
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
      int v16 = (v10 >> 11) & 0x3FF;
      int v17 = (v10 + 2095104) & 0x1FF800 | (v10 + 0x200000) & 0x7FE00000;
      if (v14 == 2043 || v14 == 2045)
      {
        if (v16) {
          int v18 = 2043;
        }
        else {
          int v18 = 2044;
        }
        unsigned int v19 = v17 | v18 | 0x80000000;
        while (1)
        {
          unsigned int v20 = __ldxr(v8);
          if (v20 != v10) {
            break;
          }
          if (!__stxr(v19, v8))
          {
            int v26 = slots_by_size_class[v4] + ~v16;
            char v27 = 1;
            goto LABEL_36;
          }
        }

        __clrex();
      }

      else
      {
        if (!v9) {
          unint64_t v9 = (unint64_t)v8 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
        }
        int v26 = v14 - 1;
        uint64_t v15 = v9 + v26 * v12;
        if (v16) {
          __int16 v21 = *(_WORD *)(v15 + 8);
        }
        else {
          __int16 v21 = 2044;
        }
        unsigned int v22 = v17 | v21 & 0x7FF | 0x80000000;
        while (1)
        {
          unsigned int v23 = __ldxr(v8);
          if (v23 != v10) {
            break;
          }
          if (!__stxr(v22, v8))
          {
            char v24 = 1;
            goto LABEL_30;
          }
        }

        char v24 = 0;
        __clrex();
LABEL_30:
        if ((v24 & 1) != 0)
        {
          if (v15) {
            goto LABEL_44;
          }
          char v27 = 0;
LABEL_36:
          if (!v9) {
            unint64_t v9 = v11;
          }
          uint64_t v15 = v9 + v26 * v12;
          if ((v27 & 1) == 0)
          {
LABEL_44:
            if ((*(void *)(a1 + 28696) ^ *(void *)v15) != v15) {
              goto LABEL_40;
            }
          }

          else if (!v15)
          {
LABEL_40:
            int v13 = 0LL;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
          }

          *(void *)uint64_t v15 = 0LL;
          *(void *)(v15 + 8) = 0LL;
          return (void *)v15;
        }

        unsigned int v20 = v23;
      }

      unsigned int v10 = v20;
      if ((v20 & 0x7FF) - 2045 < 3)
      {
        uint64_t v15 = 0LL;
        int v13 = v8;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
    }
  }

  int v13 = 0LL;
  uint64_t v15 = 0LL;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
}

void nanov2_free_definite_size(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  if (!a2 || (unint64_t)a2 >> 29 != 24)
  {
    (*(void (**)(void))(*(void *)(a1 + 28704) + 120LL))();
    return;
  }

  unint64_t v5 = a3 >> 4;
  if ((a3 & 0xF) != 0) {
    LODWORD(v5) = v5 + 1;
  }
  int v6 = v5 - 1;
  if (malloc_zero_policy) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (_DWORD)v5 == 1;
  }
  if (!v7) {
    bzero(a2 + 2, a3 - 16);
  }
  int v9 = *v8;
  int v10 = slots_by_size_class[v6];
  *a2 = *(void *)(a1 + 28696) ^ (unint64_t)a2;
  while (1)
  {
    unsigned int v11 = v9 & 0x7FF;
    unsigned int v12 = (v9 + 2048) & 0x1FF800;
    unsigned int v13 = (v9 + 0x200000) & 0x7FE00000 | v9 & 0x80000000;
    if (v11 == 2044)
    {
      unsigned int v11 = 2043;
      goto LABEL_21;
    }

    if (v10 - 1 == v12 >> 11) {
      break;
    }
LABEL_21:
    unsigned int v15 = v12 | v13 | ((unsigned __int16)(((unsigned __int16)a2 & 0x3FFF) / (16 * v6 + 16)) + 1) & 0x7FF;
    a2[1] = v11;
    while (1)
    {
      unsigned int v16 = __ldxr(v8);
      if (v16 != v9) {
        break;
      }
      if (!__stlxr(v15, v8)) {
        goto LABEL_30;
      }
    }

void nanov2_madvise_block(os_unfair_lock_s *a1, unsigned int *a2, int a3, int a4)
{
  unint64_t v8 = (unint64_t)a2 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  int v9 = a1 + 7184;
  os_unfair_lock_lock_with_options();
  nanov2_madvise_block_locked(a1, a2, v8, a3, a4);
  os_unfair_lock_unlock(v9);
}

void nanov2_free(uint64_t a1, unint64_t a2)
{
}

void _nanov2_free(uint64_t a1, unint64_t a2, int a3)
{
  if (!a2 || (a2 & 0xFFFFFFFFE000000FLL) != 0x300000000LL) {
    goto LABEL_21;
  }
  if (*(void *)(a1 + 28720) > a2 || *(void *)(a1 + 28728) < a2) {
    goto LABEL_21;
  }
  uint64_t v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  unsigned int v8 = *v7 & 0x7FF;
  if (v8 > 0x7FD)
  {
    if (v8 - 2046 < 2) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }

  if (!v8 || v8 == 2042) {
    goto LABEL_21;
  }
  if (v8 != 2044)
  {
LABEL_14:
    if (((*v7 >> 11) & 0x3FF) != slots_by_size_class[v6] - 1) {
      goto LABEL_15;
    }
LABEL_21:
    uint64_t v12 = *(void *)(a1 + 28704);
    if (a3) {
      unsigned int v13 = *(void (**)(void))(v12 + 144);
    }
    else {
      unsigned int v13 = *(void (**)(void))(v12 + 48);
    }
    v13();
    return;
  }

LABEL_55:
  if ((v21 & 0x80000000) == 0)
  {
    int v25 = (unsigned __int16 *)(a1 + 28672);
    if (((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0 && (double)v16 * 0.75 <= (double)((v21 >> 11) & 0x3FF))
    {
      do
        unsigned __int16 v26 = __ldxr(v25);
      while (__stxr(v26 & ~(unsigned __int16)(1 << v6), v25));
    }
  }

    malloc_zone_check_fail((uint64_t)"*** check: incorrect tiny region ", (uint64_t)v50);
    return;
  }

  while (1)
  {
    unsigned int v21 = v8 & 0xFFFFFFFFFFF00000LL | 0x28;
    unsigned int v22 = v8 & 0xFFFFFFFFFFF00000LL | 0x4080;
    char v23 = ((v8 - v22) >> 8) & 0xFFE;
    int v24 = 1 << ((v8 - v22) >> 4);
    int v25 = (unsigned int *)(v21 + 4LL * v23);
    unsigned __int16 v26 = *v25;
    if ((v26 & v24) == 0)
    {
LABEL_41:
      BOOL v50 = "%ld, counter=%d\n*** invariant broken for tiny block %p this msize=%d - size is too small\n";
      goto LABEL_55;
    }

    if ((*(_DWORD *)(v21 + 4LL * (v23 | 1)) & v24) != 0)
    {
      char v27 = ((v8 - v22) >> 4) & 0x1F;
      uint64_t v28 = ((unint64_t)v25[2] << (32 - v27)) | (v26 >> v27);
      if (v27) {
        v28 |= (unint64_t)v25[4] << -(char)v27;
      }
      if (v28 < 2) {
        goto LABEL_41;
      }
      uint64_t v29 = __clz(__rbit64(v28 >> 1));
      uint64_t v30 = v29 + 1;
      if (v29 == 63)
      {
        BOOL v50 = "%ld, counter=%d\n*** invariant broken for %p this tiny msize=%d - size is too large\n";
        goto LABEL_55;
      }

      int v31 = 0;
      v8 += (16 * v30);
      goto LABEL_36;
    }

    if (v8 + 16 >= v22 + 1032064
      || ((*(_DWORD *)(((v8 + 16) & 0xFFFFFFFFFFF00000LL | ((((v8 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v8 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
    {
      uint64_t v32 = 1;
    }

    else
    {
      uint64_t v32 = *(unsigned __int16 *)(v8 + 16);
      if (!*(_WORD *)(v8 + 16) && v8 == v6) {
        return;
      }
      if (!*(_WORD *)(v8 + 16)) {
        goto LABEL_41;
      }
    }

    uint64_t v33 = __ROR8__(*(void *)v8, 60);
    int v34 = v33 & 0xFFFFFFFFFFFFFFF0LL;
    unint64_t v35 = *(void *)(a1 + 632);
    int v36 = v33 & 0xFFFFFFFFFFFFFFF0LL ^ v35;
    if (((v33 ^ (HIDWORD(v36)
                              + (_DWORD)v36
                              + ((HIDWORD(v36) + v36) >> 16)
                              + ((HIDWORD(v36) + (_DWORD)v36 + ((HIDWORD(v36) + v36) >> 16)) >> 8))) & 0xFLL) != 0)
    {
      int v52 = a1;
      goto LABEL_63;
    }

    uint64_t v37 = __ROR8__(*(void *)(v8 + 8), 60);
    int v38 = v37 & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v39 = v37 & 0xFFFFFFFFFFFFFFF0LL ^ v35;
    if (((v37 ^ (HIDWORD(v39) {
                              + (_DWORD)v39
    }
                              + ((HIDWORD(v39) + v39) >> 16)
    if (v34)
    {
      uint64_t v40 = v33 & 0xFFFFFFFFFFF00000LL;
      unint64_t v41 = v34 - v40 - 16512;
      unint64_t v42 = (v41 >> 8) & 0xFFE;
      uint64_t v43 = 1 << (v41 >> 4);
      if ((*(_DWORD *)((v40 & 0xFFFFFFFFFFFFC007LL | (8 * ((v42 >> 1) & 0x7FF))) + 0x28) & v43) == 0
        || (*(_DWORD *)(v40 + 4 * v42 + 44) & v43) != 0)
      {
        BOOL v50 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
        goto LABEL_55;
      }
    }

    if (v38)
    {
      unint64_t v44 = v37 & 0xFFFFFFFFFFF00000LL;
      uint64_t v45 = v38 - (v37 & 0xFFFFFFFFFFF00000LL) - 16512;
      int v46 = (v45 >> 8) & 0xFFE;
      unint64_t v47 = 1 << (v45 >> 4);
      if ((*(_DWORD *)((v44 & 0xFFFFFFFFFFFFC007LL | (8 * ((v46 >> 1) & 0x7FF))) + 0x28) & v47) == 0
        || (*(_DWORD *)(v44 + 4 * v46 + 44) & v47) != 0)
      {
        BOOL v50 = "%ld, counter=%d\n*** invariant broken for %p (next in free list %p is not a free pointer)\n";
        goto LABEL_55;
      }
    }

    uint64_t v48 = (16 * v32);
    unint64_t v49 = v8 + v48;
    if (v7 == v8 + v48)
    {
      unint64_t v54 = 1;
      goto LABEL_44;
    }

    if (get_tiny_previous_free_msize(v8 + v48) != v32)
    {
      BOOL v50 = "%ld, counter=%d\n"
            "*** invariant broken for tiny free %p followed by %p in region %p [%p-%p] (end marker incorrect) should be %d; in fact %d\n";
      goto LABEL_55;
    }

    int v31 = 1;
    unsigned int v8 = v49;
LABEL_36:
    if (v8 >= v7) {
      goto LABEL_43;
    }
  }

  int v52 = a1;
LABEL_63:
  free_list_checksum_botch(v52);
  __break(1u);
}

void nanov2_try_free_default(uint64_t a1, unint64_t a2)
{
}

void *nanov2_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (unint64_t v3 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      int v16 = 0LL;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v16;
    }
  }

  if (v3 <= 0x10) {
    unint64_t v4 = 16LL;
  }
  else {
    unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v3 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 32LL))();
  }
  uint64_t v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }

  unsigned int v7 = v6 & 0x3F;
  uint64_t v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  unint64_t v9 = *(unsigned int **)(v8 + 0x4000);
  if (!v9)
  {
    int v14 = 0LL;
    int v16 = 0LL;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0LL);
  }

  unint64_t v10 = 0LL;
  unsigned int v11 = *v9;
  unint64_t v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  int v13 = 16 * v5 + 16;
  while (1)
  {
    int v14 = 0LL;
    if ((v11 & 0x80000000) == 0)
    {
      int v16 = 0LL;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0LL);
    }

    int v15 = v11 & 0x7FF;
    int v16 = 0LL;
    if (v15 == 2044) {
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0LL);
    }
    int v17 = (v11 >> 11) & 0x3FF;
    int v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
    if (v15 == 2043 || v15 == 2045)
    {
      if (v17) {
        int v19 = 2043;
      }
      else {
        int v19 = 2044;
      }
      unsigned int v20 = v18 | v19 | 0x80000000;
      while (1)
      {
        unsigned int v21 = __ldxr(v9);
        if (v21 != v11) {
          break;
        }
        if (!__stxr(v20, v9))
        {
          int v27 = slots_by_size_class[v5] + ~v17;
          char v28 = 1;
          goto LABEL_42;
        }
      }

      __clrex();
      goto LABEL_36;
    }

    if (!v10) {
      unint64_t v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
    }
    int v27 = v15 - 1;
    int v16 = (void *)(v10 + v27 * v13);
    __int16 v22 = v17 ? *((_WORD *)v16 + 4) : 2044;
    unsigned int v23 = v18 | v22 & 0x7FF | 0x80000000;
    while (1)
    {
      unsigned int v24 = __ldxr(v9);
      if (v24 != v11) {
        break;
      }
      if (!__stxr(v23, v9))
      {
        char v25 = 1;
        goto LABEL_34;
      }
    }

    char v25 = 0;
    __clrex();
LABEL_34:
    if ((v25 & 1) != 0) {
      break;
    }
    unsigned int v21 = v24;
LABEL_36:
    unsigned int v11 = v21;
    if ((v21 & 0x7FF) - 2045 < 3)
    {
      int v16 = 0LL;
      int v14 = v9;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0LL);
    }
  }

  if (v16) {
    goto LABEL_50;
  }
  char v28 = 0;
LABEL_42:
  if (!v10) {
    unint64_t v10 = v12;
  }
  int v16 = (void *)(v10 + v27 * v13);
  if ((v28 & 1) == 0)
  {
LABEL_50:
    if ((void *)(*(void *)(a1 + 28696) ^ *v16) != v16) {
      goto LABEL_46;
    }
  }

  else if (!v16)
  {
LABEL_46:
    int v14 = 0LL;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0LL);
  }

  if (malloc_zero_policy)
  {
    bzero(v16, v4);
  }

  else
  {
    *int v16 = 0LL;
    v16[1] = 0LL;
  }

  return v16;
}

void *nanov2_calloc_type(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (unint64_t v4 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      int v17 = 0LL;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v17;
    }
  }

  if (v4 <= 0x10) {
    unint64_t v5 = 16LL;
  }
  else {
    unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v4 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 168LL))();
  }
  uint64_t v6 = (v5 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v7) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v7) = v7 % nano_common_max_magazines;
  }

  unsigned int v8 = v7 & 0x3F;
  uint64_t v9 = a1 + (v6 << 9) + 8 * (v7 & 0x3F);
  unint64_t v10 = *(unsigned int **)(v9 + 0x4000);
  if (!v10)
  {
    int v15 = 0LL;
    int v17 = 0LL;
    return nanov2_allocate_outlined( a1,  (unsigned int **)(v9 + 0x4000),  v5,  (v5 >> 4) - 1,  v8,  v15,  (uint64_t)v17,  1,  1,  a4);
  }

  unint64_t v11 = 0LL;
  unsigned int v12 = *v10;
  unint64_t v13 = (unint64_t)v10 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
  int v14 = 16 * v6 + 16;
  while (1)
  {
    int v15 = 0LL;
    if ((v12 & 0x80000000) == 0)
    {
      int v17 = 0LL;
      return nanov2_allocate_outlined( a1,  (unsigned int **)(v9 + 0x4000),  v5,  (v5 >> 4) - 1,  v8,  v15,  (uint64_t)v17,  1,  1,  a4);
    }

    int v16 = v12 & 0x7FF;
    int v17 = 0LL;
    if (v16 == 2044) {
      return nanov2_allocate_outlined( a1,  (unsigned int **)(v9 + 0x4000),  v5,  (v5 >> 4) - 1,  v8,  v15,  (uint64_t)v17,  1,  1,  a4);
    }
    int v18 = (v12 >> 11) & 0x3FF;
    int v19 = (v12 + 2095104) & 0x1FF800 | (v12 + 0x200000) & 0x7FE00000;
    if (v16 == 2043 || v16 == 2045)
    {
      if (v18) {
        int v20 = 2043;
      }
      else {
        int v20 = 2044;
      }
      unsigned int v21 = v19 | v20 | 0x80000000;
      while (1)
      {
        unsigned int v22 = __ldxr(v10);
        if (v22 != v12) {
          break;
        }
        if (!__stxr(v21, v10))
        {
          int v28 = slots_by_size_class[v6] + ~v18;
          char v29 = 1;
          goto LABEL_42;
        }
      }

      __clrex();
      goto LABEL_36;
    }

    if (!v11) {
      unint64_t v11 = (unint64_t)v10 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
    }
    int v28 = v16 - 1;
    int v17 = (void *)(v11 + v28 * v14);
    __int16 v23 = v18 ? *((_WORD *)v17 + 4) : 2044;
    unsigned int v24 = v19 | v23 & 0x7FF | 0x80000000;
    while (1)
    {
      unsigned int v25 = __ldxr(v10);
      if (v25 != v12) {
        break;
      }
      if (!__stxr(v24, v10))
      {
        char v26 = 1;
        goto LABEL_34;
      }
    }

    char v26 = 0;
    __clrex();
LABEL_34:
    if ((v26 & 1) != 0) {
      break;
    }
    unsigned int v22 = v25;
LABEL_36:
    unsigned int v12 = v22;
    if ((v22 & 0x7FF) - 2045 < 3)
    {
      int v17 = 0LL;
      int v15 = v10;
      return nanov2_allocate_outlined( a1,  (unsigned int **)(v9 + 0x4000),  v5,  (v5 >> 4) - 1,  v8,  v15,  (uint64_t)v17,  1,  1,  a4);
    }
  }

  if (v17) {
    goto LABEL_50;
  }
  char v29 = 0;
LABEL_42:
  if (!v11) {
    unint64_t v11 = v13;
  }
  int v17 = (void *)(v11 + v28 * v14);
  if ((v29 & 1) == 0)
  {
LABEL_50:
    if ((void *)(*(void *)(a1 + 28696) ^ *v17) != v17) {
      goto LABEL_46;
    }
  }

  else if (!v17)
  {
LABEL_46:
    int v15 = 0LL;
    return nanov2_allocate_outlined( a1,  (unsigned int **)(v9 + 0x4000),  v5,  (v5 >> 4) - 1,  v8,  v15,  (uint64_t)v17,  1,  1,  a4);
  }

  if (malloc_zero_policy)
  {
    bzero(v17, v5);
  }

  else
  {
    *int v17 = 0LL;
    v17[1] = 0LL;
  }

  return v17;
}

void *nanov2_malloc_zero_on_alloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x10) {
    unint64_t v2 = 16LL;
  }
  else {
    unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v2 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24LL))();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }

  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  unint64_t v7 = *(unsigned int **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0LL;
    unsigned int v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      unsigned int v12 = 0LL;
      if ((v9 & 0x80000000) == 0)
      {
        int v14 = 0LL;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0LL);
      }

      int v13 = v9 & 0x7FF;
      int v14 = 0LL;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0LL);
      }
      int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        while (1)
        {
          unsigned int v19 = __ldxr(v7);
          if (v19 != v9) {
            break;
          }
          if (!__stxr(v18, v7))
          {
            int v25 = slots_by_size_class[v3] + ~v15;
            char v26 = 1;
            goto LABEL_37;
          }
        }

        __clrex();
      }

      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v25 = v13 - 1;
        int v14 = (void *)(v8 + v25 * v11);
        if (v15) {
          __int16 v20 = *((_WORD *)v14 + 4);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        while (1)
        {
          unsigned int v22 = __ldxr(v7);
          if (v22 != v9) {
            break;
          }
          if (!__stxr(v21, v7))
          {
            char v23 = 1;
            goto LABEL_31;
          }
        }

        char v23 = 0;
        __clrex();
LABEL_31:
        if ((v23 & 1) != 0)
        {
          if (v14) {
            goto LABEL_45;
          }
          char v26 = 0;
LABEL_37:
          if (!v8) {
            unint64_t v8 = v10;
          }
          int v14 = (void *)(v8 + v25 * v11);
          if ((v26 & 1) == 0)
          {
LABEL_45:
            if ((void *)(*(void *)(a1 + 28696) ^ *v14) != v14) {
              goto LABEL_41;
            }
          }

          else if (!v14)
          {
LABEL_41:
            unsigned int v12 = 0LL;
            return nanov2_allocate_outlined( a1,  (unsigned int **)(v6 + 0x4000),  v2,  v3,  v5,  v12,  (uint64_t)v14,  1,  0,  0LL);
          }

          if (malloc_zero_policy)
          {
            bzero(v14, v2);
          }

          else
          {
            *int v14 = 0LL;
            v14[1] = 0LL;
          }

          return v14;
        }

        unsigned int v19 = v22;
      }

      unsigned int v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        int v14 = 0LL;
        unsigned int v12 = v7;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0LL);
      }
    }
  }

  unsigned int v12 = 0LL;
  int v14 = 0LL;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0LL);
}

void *nanov2_malloc_type_zero_on_alloc(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 <= 0x10) {
    unint64_t v4 = 16LL;
  }
  else {
    unint64_t v4 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v4 > 0x100) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160LL))();
  }
  uint64_t v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == -1) {
      unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }

  unsigned int v7 = v6 & 0x3F;
  uint64_t v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  unsigned int v9 = *(unsigned int **)(v8 + 0x4000);
  if (v9)
  {
    unint64_t v10 = 0LL;
    unsigned int v11 = *v9;
    unint64_t v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
    int v13 = 16 * v5 + 16;
    while (1)
    {
      int v14 = 0LL;
      if ((v11 & 0x80000000) == 0)
      {
        int v16 = 0LL;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }

      int v15 = v11 & 0x7FF;
      int v16 = 0LL;
      if (v15 == 2044) {
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
      int v17 = (v11 >> 11) & 0x3FF;
      int v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
      if (v15 == 2043 || v15 == 2045)
      {
        if (v17) {
          int v19 = 2043;
        }
        else {
          int v19 = 2044;
        }
        unsigned int v20 = v18 | v19 | 0x80000000;
        while (1)
        {
          unsigned int v21 = __ldxr(v9);
          if (v21 != v11) {
            break;
          }
          if (!__stxr(v20, v9))
          {
            int v27 = slots_by_size_class[v5] + ~v17;
            char v28 = 1;
            goto LABEL_37;
          }
        }

        __clrex();
      }

      else
      {
        if (!v10) {
          unint64_t v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
        }
        int v27 = v15 - 1;
        int v16 = (void *)(v10 + v27 * v13);
        if (v17) {
          __int16 v22 = *((_WORD *)v16 + 4);
        }
        else {
          __int16 v22 = 2044;
        }
        unsigned int v23 = v18 | v22 & 0x7FF | 0x80000000;
        while (1)
        {
          unsigned int v24 = __ldxr(v9);
          if (v24 != v11) {
            break;
          }
          if (!__stxr(v23, v9))
          {
            char v25 = 1;
            goto LABEL_31;
          }
        }

        char v25 = 0;
        __clrex();
LABEL_31:
        if ((v25 & 1) != 0)
        {
          if (v16) {
            goto LABEL_45;
          }
          char v28 = 0;
LABEL_37:
          if (!v10) {
            unint64_t v10 = v12;
          }
          int v16 = (void *)(v10 + v27 * v13);
          if ((v28 & 1) == 0)
          {
LABEL_45:
            if ((void *)(*(void *)(a1 + 28696) ^ *v16) != v16) {
              goto LABEL_41;
            }
          }

          else if (!v16)
          {
LABEL_41:
            int v14 = 0LL;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
          }

          if (malloc_zero_policy)
          {
            bzero(v16, v4);
          }

          else
          {
            *int v16 = 0LL;
            v16[1] = 0LL;
          }

          return v16;
        }

        unsigned int v21 = v24;
      }

      unsigned int v11 = v21;
      if ((v21 & 0x7FF) - 2045 < 3)
      {
        int v16 = 0LL;
        int v14 = v9;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
    }
  }

  int v14 = 0LL;
  int v16 = 0LL;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
}

void *nanov2_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (!a2)
  {
    unint64_t v10 = a3;
    return nanov2_malloc(a1, v10);
  }

  uint64_t v5 = (const void *)a2;
  uint64_t v6 = *(void *)(a1 + 28704);
  unint64_t v7 = nanov2_pointer_size(a1, a2, 0);
  if (!v7) {
    return (void *)(*(uint64_t (**)(uint64_t, const void *, unint64_t))(v6 + 56))(v6, v5, a3);
  }
  size_t v8 = v7;
  if (a3 >= 0x101)
  {
    unsigned int v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(v6 + 24))(v6, a3);
    goto LABEL_21;
  }

  if (!a3)
  {
    _nanov2_free(v4, (unint64_t)v5, 0);
    a1 = v4;
    unint64_t v10 = 0LL;
    return nanov2_malloc(a1, v10);
  }

  if (a3 <= 0x10) {
    unint64_t v12 = 16LL;
  }
  else {
    unint64_t v12 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v12 <= v7 && v12 > v7 >> 1)
  {
    if (v7 != a3)
    {
      if (v7 <= a3) {
        purgeable_ptr_in_use_enumerator_cold_1(v7, v12, v7 - a3);
      }
      if ((*(_BYTE *)(v4 + 28676) & 0x20) != 0) {
        _platform_memset();
      }
    }

    return v5;
  }

  unsigned int v9 = nanov2_malloc(v4, v12);
LABEL_21:
  int v13 = v9;
  if (!v9) {
    return 0LL;
  }
  if (v8 >= a3) {
    size_t v14 = a3;
  }
  else {
    size_t v14 = v8;
  }
  memcpy(v9, v5, v14);
  _nanov2_free(v4, (unint64_t)v5, 0);
  return v13;
}

void *nanov2_realloc_type(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a2) {
    return nanov2_malloc_type(a1, a3, a4);
  }
  unint64_t v7 = (const void *)a2;
  uint64_t v8 = *(void *)(a1 + 28704);
  unint64_t v9 = nanov2_pointer_size(a1, a2, 0);
  if (!v9) {
    return (void *)(*(uint64_t (**)(uint64_t, const void *, unint64_t, uint64_t))(v8 + 176))( v8,  v7,  a3,  a4);
  }
  size_t v10 = v9;
  if (a3 < 0x101)
  {
    if (!a3)
    {
      _nanov2_free(a1, (unint64_t)v7, 0);
      return nanov2_malloc(a1, 0LL);
    }

    if (a3 <= 0x10) {
      unint64_t v13 = 16LL;
    }
    else {
      unint64_t v13 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    }
    if (v13 <= v9 && v13 > v9 >> 1)
    {
      if (v9 != a3)
      {
        if (v9 <= a3) {
          purgeable_ptr_in_use_enumerator_cold_1(v9, v13, v9 - a3);
        }
        if ((*(_BYTE *)(a1 + 28676) & 0x20) != 0) {
          _platform_memset();
        }
      }

      return v7;
    }

    unsigned int v11 = nanov2_malloc_type(a1, v13, a4);
  }

  else
  {
    unsigned int v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v8 + 160))(v8, a3, a4);
  }

  size_t v14 = v11;
  if (!v11) {
    return 0LL;
  }
  if (v10 >= a3) {
    size_t v15 = a3;
  }
  else {
    size_t v15 = v10;
  }
  memcpy(v11, v7, v15);
  _nanov2_free(a1, (unint64_t)v7, 0);
  return v14;
}

BOOL nanov2_claimed_address(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 1LL;
  return v4;
}

unint64_t nanov2_pointer_size(uint64_t a1, unint64_t a2, int a3)
{
  if (a2 >> 29 != 24 || !a3 && (a2 & 0xF) != 0) {
    return 0LL;
  }
  if (*(void *)(a1 + 28720) > a2 || *(void *)(a1 + 28728) < a2) {
    return 0LL;
  }
  unint64_t v4 = 0LL;
  uint64_t v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  unsigned int v7 = *(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000LL)
                 + 4LL * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v7 > 0x7FD)
  {
    if (v7 - 2046 < 2) {
      return v4;
    }
  }

  else
  {
    if (!v7 || v7 == 2042) {
      return v4;
    }
    if (v7 == 2044) {
      goto LABEL_17;
    }
  }

  if (((*(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000LL) {
LABEL_17:
  }
  unint64_t v4 = 16 * (int)v6 + 16;
  if ((*(void *)(a1 + 28696) ^ *(void *)a2) == a2) {
    return 0LL;
  }
  return v4;
}

uint64_t nanov2_batch_malloc(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (a2 <= 0x10) {
    unint64_t v7 = 16LL;
  }
  else {
    unint64_t v7 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (v7 > 0x100)
  {
    int v8 = 0;
    return (*(unsigned int (**)(void))(*(void *)(a1 + 28704) + 80LL))() + v8;
  }

  int v8 = 0;
  if ((_DWORD)a4)
  {
    while (1)
    {
      unint64_t v9 = nanov2_malloc(a1, v7);
      if (!v9) {
        break;
      }
      *a3++ = v9;
      if ((_DWORD)v4 == ++v8) {
        return v4;
      }
    }
  }

  if (v8 != (_DWORD)v4) {
    return (*(unsigned int (**)(void))(*(void *)(a1 + 28704) + 80LL))() + v8;
  }
  return v4;
}

void nanov2_batch_free(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    unsigned int v5 = a3 - 1;
    do
    {
      unint64_t v6 = *(void *)(a2 + 8LL * v5);
      if (v6) {
        _nanov2_free(a1, v6, 0);
      }
    }

    while ((unint64_t)v5--);
  }

void *nanov2_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 112LL))();
  }
  else {
    return nanov2_malloc(a1, a3);
  }
}

void *nanov2_memalign_type(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 > 0x10) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 184LL))();
  }
  else {
    return nanov2_malloc_type(a1, a3, a4);
  }
}

unint64_t nanov2_pressure_relief(uint64_t a1, uint64_t a2)
{
  int v20 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  uint64_t v5 = *(void *)(a1 + 28720);
  unint64_t v6 = atomic_load((unint64_t *)(a1 + 28728));
  uint64_t v22 = v5;
  unint64_t v2 = 0LL;
  if (v5)
  {
    unint64_t v21 = v6;
    unint64_t v19 = (v6 - 1) & 0xFFFFFFFFE0000000LL;
    int v7 = ((*(_DWORD *)(a1 + 28680) >> 6) | (*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
    do
    {
      unint64_t v8 = v22;
      unint64_t v9 = v22 + 0x20000000;
      if (v22 == v19) {
        unint64_t v9 = v21;
      }
      unint64_t v23 = v9;
      while (1)
      {
        uint64_t v10 = *(void *)(a1 + 28688);
        if (v8 >= v23) {
          break;
        }
        unsigned int v11 = (unsigned int *)(v10 ^ v8 & 0xFFFFFFFFFC000000LL);
        os_unfair_lock_lock_with_options();
        unsigned __int16 v12 = 0;
        for (unsigned int i = 0; i != 4096; ++i)
        {
          if (v7 != i && (*v11 & 0x7FF) == 0x7FD)
          {
            uint64_t v14 = v8 + ((unint64_t)((v12 | (unsigned __int16)(i >> 6)) & 0xFFF) << 14);
            if (nanov2_madvise_block_locked( (os_unfair_lock_s *)a1,  v11,  v14,  ptr_offset_to_size_class[(*(_DWORD *)(a1 + 28680) ^ (v14 >> 14) & 0xFC0) >> 6],  2045)) {
              v2 += 0x4000LL;
            }
          }

          ++v11;
          v12 += 64;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28736));
        v8 += 0x4000000LL;
        if (a2 - 1 < v2) {
          goto LABEL_25;
        }
      }

      uint64_t v15 = *(unsigned __int16 *)((v10 ^ v22 & 0xFFFFFFFFFC000000LL)
                                + 4LL
                                * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
      unint64_t v16 = v22 + (v15 << 29);
      if (v16 >= v21) {
        unint64_t v16 = 0LL;
      }
      if ((_DWORD)v15) {
        unint64_t v17 = v16;
      }
      else {
        unint64_t v17 = 0LL;
      }
      uint64_t v22 = v17;
    }

    while (v17);
  }

uint64_t nanov2_madvise_block_locked(os_unfair_lock_s *a1, unsigned int *a2, uint64_t a3, int a4, int a5)
{
  unsigned int v10 = *a2;
  if ((*a2 & 0x7FF) != a5) {
    return 0LL;
  }
  unsigned int v11 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
  do
  {
    unsigned int v12 = __ldxr(a2);
    if (v12 != v10)
    {
      uint64_t v13 = 0LL;
      __clrex();
      ++*(void *)&a1[8 * a4 + 7194]._os_unfair_lock_opaque;
      return v13;
    }
  }

  while (__stxr(v11, a2));
  if (mvm_madvise_free(a1, a3 & 0xFFFFFFFFE0000000LL, a3, a3 + 0x4000, 0LL, 0LL))
  {
    __error();
    malloc_zone_error(0, 0, (uint64_t)"Failed to madvise block at blockp: %p, error: %d\n");
    uint64_t v13 = 0LL;
  }

  else
  {
    ++*(void *)&a1[8 * a4 + 7192]._os_unfair_lock_opaque;
    uint64_t v13 = 1LL;
  }

  while (1)
  {
    unsigned int v14 = __ldxr(a2);
    if (v14 != v11) {
      break;
    }
    if (!__stxr((v10 + 0x400000) & 0x7FE00000 | 0x7FF, a2)) {
      return v13;
    }
  }

  __clrex();
  malloc_zone_error( a1[7169]._os_unfair_lock_opaque,  0,  (uint64_t)"Failed when changing state from MADVISING to MADVISED, block_metap = %p, blockp = %p\n");
  return v13;
}

uint64_t nanov2_allocate_new_region()
{
  return 0LL;
}

unint64_t nanov2_find_block_and_allocate(uint64_t a1, unsigned int a2, unsigned int **a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = *a3;
  if (!*a3) {
    uint64_t v5 = *(unsigned int **)(a1 + 28720);
  }
  uint64_t v6 = a2;
  unint64_t v7 = (unint64_t)v5 & 0xFFFFFFFFFC000000LL;
  int v8 = ((slots_by_size_class[a2] << 11) + 2095104) & 0x1FF800 | 0x7FB;
  int v47 = 1 << a2;
  os_unfair_lock_t lock = (os_unfair_lock_s *)(a1 + 28716);
  unint64_t v44 = (_BYTE *)(a1 + 28676);
  BOOL v50 = (unint64_t *)(a1 + 28728);
  int v46 = *a3;
LABEL_4:
  while (2)
  {
    unint64_t v9 = v7 & 0xFFFFFFFFE0000000LL;
    unint64_t v10 = atomic_load(v50);
    unint64_t v11 = (v10 - 1) & 0xFFFFFFFFE0000000LL;
    unint64_t v12 = (v7 & 0xFFFFFFFFE0000000LL) + 0x20000000;
    unint64_t v51 = v10;
    unint64_t v52 = v7;
    if (v11 == (v7 & 0xFFFFFFFFE0000000LL)) {
      unint64_t v12 = v10;
    }
    int v13 = nanov2_policy_config;
    int v14 = unk_18C444A74;
LABEL_7:
    BOOL v15 = v4 == 0LL;
    unsigned int v16 = first_block_offset_by_size_class[v6] ^ *(_DWORD *)(a1 + 28680);
    unint64_t v17 = (*(void *)(a1 + 28688) ^ v7 & 0xFFFFFFFFFC000000LL)
        + 4LL * (((unsigned __int16)(v16 >> 6) | (unsigned __int16)((_WORD)v16 << 6)) & 0xFFF);
    if (v4) {
      unint64_t v17 = (unint64_t)v4;
    }
    if (!v13) {
      BOOL v15 = 1;
    }
    while (2)
    {
      int v18 = 0LL;
      unint64_t v19 = 0LL;
      BOOL v20 = 1;
      int v21 = v14;
      unint64_t v22 = v17;
      do
      {
        while (1)
        {
          if ((*(_DWORD *)v22 & 0x80000000) != 0) {
            goto LABEL_23;
          }
          switch(*(_DWORD *)v22 & 0x7FF)
          {
            case 0x7FC:
            case 0x7FE:
              goto LABEL_23;
            case 0x7FD:
              if (!v19) {
                unint64_t v19 = (unsigned int *)v22;
              }
              if (!v15) {
                goto LABEL_23;
              }
              break;
            default:
              if (!v18) {
                int v18 = (unsigned int *)v22;
              }
              if (!v15) {
                goto LABEL_23;
              }
              break;
          }

          int v18 = 0LL;
LABEL_23:
          unsigned int v23 = *(_DWORD *)(a1 + 28680);
          int v24 = ((16 * v22) & 0xFC0 | (v22 >> 8) & 0x3F) ^ v23;
          if (v20)
          {
            int v25 = first_block_offset_by_size_class[v6];
            if (v24 == v25)
            {
              int v26 = last_block_offset_by_size_class[v6];
              int v21 = v14;
            }

            else
            {
              int v26 = v24 - 1;
            }

            BOOL v37 = v24 == v25;
            BOOL v20 = v24 != v25;
            unint64_t v22 = v22 & 0xFFFFFFFFFFFFC000LL | (4LL
                                              * (((unsigned __int16)((v26 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v26 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v37) {
              unint64_t v22 = v17;
            }
          }

          else
          {
            if (v24 == last_block_offset_by_size_class[v6]) {
              int v27 = first_block_offset_by_size_class[v6];
            }
            else {
              int v27 = v24 + 1;
            }
            unint64_t v22 = v22 & 0xFFFFFFFFFFFFC000LL | (4LL
                                              * (((unsigned __int16)((v27 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v27 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v22 == v17) {
              break;
            }
            BOOL v20 = 0;
          }
        }

        uint64_t v4 = v18;
        if (!v18)
        {
          uint64_t v4 = v19;
          if (!v19)
          {
            v7 += 0x4000000LL;
            if (v7 >= v12)
            {
              uint64_t v35 = *(unsigned __int16 *)((*(void *)(a1 + 28688) ^ v9 & 0xFFFFFFFFFC000000LL)
                                        + 4LL
                                        * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
              unint64_t v7 = v9 + (v35 << 29);
              BOOL v37 = (_DWORD)v35 == 0;
              unint64_t v12 = v51;
              BOOL v37 = v37 || v7 >= v51 || v9 == 0;
              if (v37) {
                unint64_t v7 = *(void *)(a1 + 28720);
              }
              if (v7 != v11) {
                unint64_t v12 = v7 + 0x20000000;
              }
              unint64_t v9 = v7;
            }

            uint64_t v4 = 0LL;
            if (v7 != v52) {
              goto LABEL_7;
            }
            if (((unsigned __int16)v47 & (unsigned __int16)word_18C444A78) == 0)
            {
              os_unfair_lock_lock_with_options();
              uint64_t v38 = *(void *)(a1 + 28728);
              if (v38 != v51)
              {
                unint64_t v7 = v38 - 0x4000000;
LABEL_70:
                os_unfair_lock_unlock(lock);
                uint64_t v4 = 0LL;
                goto LABEL_4;
              }

              if ((v38 & 0xFFFFFFFFE0000000LL) != v51)
              {
                *(void *)(a1 + 28728) = v51 + 0x4000000;
                if ((*v44 & 7) != 0)
                {
                  int v53 = ((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
                  unint64_t v41 = v38 & 0xFFFFFFFFFC000000LL;
                  *(_DWORD *)((*(void *)(a1 + 28688) ^ v38 & 0xFFFFFFFFFC000000LL)
                            + ((unint64_t)(v53 == 0) << 8)) = -2147481606;
                  if (v53 == 4095) {
                    uint64_t v42 = 4094LL;
                  }
                  else {
                    uint64_t v42 = 4095LL;
                  }
                  *(_DWORD *)((*(void *)(a1 + 28688) ^ v41) + 4 * (((v42 & 0x3F) << 6) | 0x3F)) = -2147481606;
                  unint64_t v7 = v51;
                }

                else
                {
                  unint64_t v7 = v51;
                }

                goto LABEL_70;
              }

              os_unfair_lock_unlock(lock);
            }

            return 0LL;
          }
        }

        int v18 = 0LL;
        unint64_t v19 = 0LL;
        unsigned int v28 = *v4;
        int v29 = *v4 & 0x7FF;
        BOOL v20 = 1;
        int v21 = v14;
        unint64_t v22 = v17;
      }

      while (v29 == 2046);
      if (!v29 || v29 == 2045 || v29 == 2047)
      {
        int v30 = 0;
        int v31 = v8;
      }

      else
      {
        int v31 = v28 & 0x1FFFFF;
        int v30 = (v28 + 0x200000) & 0x7FE00000;
      }

      unsigned int v32 = v31 | v30 | 0x80000000;
      while (1)
      {
        unsigned int v33 = __ldxr(v4);
        if (v33 != v28) {
          break;
        }
        if (!__stxr(v32, v4))
        {
          int v34 = 1;
          goto LABEL_51;
        }
      }

      int v34 = 0;
      __clrex();
LABEL_51:
      int v13 = nanov2_policy_config;
      int v14 = unk_18C444A74;
      if (!v34) {
        continue;
      }
      break;
    }

    unint64_t result = nanov2_allocate_from_block(a1, v4, a2);
    if (!result)
    {
      do
        unsigned int v40 = __ldxr(v4);
      while (__stxr(v40 & 0x7FFFFFFF, v4));
      continue;
    }

    break;
  }

  *a3 = v4;
  if (v46)
  {
    do
      unsigned int v43 = __ldxr(v46);
    while (__stxr(v43 & 0x7FFFFFFF, v46));
  }

  return result;
}

unint64_t nanov2_allocate_from_block(uint64_t a1, unsigned int *a2, int a3)
{
  unint64_t v3 = 0LL;
  unsigned int v4 = *a2;
  int v5 = 16 * a3 + 16;
  while (1)
  {
    unint64_t v6 = 0LL;
    if ((v4 & 0x80000000) == 0) {
      return v6;
    }
    int v7 = v4 & 0x7FF;
    if (v7 == 2044) {
      return v6;
    }
    int v8 = (v4 >> 11) & 0x3FF;
    int v9 = (v4 + 2095104) & 0x1FF800 | (v4 + 0x200000) & 0x7FE00000;
    if (v7 != 2043 && v7 != 2045)
    {
      if (!v3) {
        unint64_t v3 = (unint64_t)a2 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
      }
      int v16 = v7 - 1;
      unint64_t v6 = v3 + v16 * v5;
      if (v8) {
        __int16 v13 = *(_WORD *)(v6 + 8);
      }
      else {
        __int16 v13 = 2044;
      }
      unsigned int v14 = v9 | v13 & 0x7FF | 0x80000000;
      do
      {
        unsigned int v15 = __ldxr(a2);
        if (v15 != v4)
        {
          __clrex();
          unsigned int v12 = v15;
          goto LABEL_24;
        }
      }

      while (__stxr(v14, a2));
      if (v6) {
        goto LABEL_32;
      }
      char v17 = 0;
LABEL_26:
      unint64_t v18 = v3
          ? v3
          : (unint64_t)a2 & 0xFFFFFFFFFC000000LL | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
      unint64_t v6 = v18 + v16 * v5;
      if ((v17 & 1) == 0)
      {
LABEL_32:
        if ((*(void *)(a1 + 28696) ^ *(void *)v6) != v6) {
          nanov2_guard_corruption_detected();
        }
      }

      return v6;
    }

    if (v8) {
      int v10 = 2043;
    }
    else {
      int v10 = 2044;
    }
    unsigned int v11 = v9 | v10 | 0x80000000;
    while (1)
    {
      unsigned int v12 = __ldxr(a2);
      if (v12 != v4) {
        break;
      }
      if (!__stxr(v11, a2))
      {
        int v16 = slots_by_size_class[a3] + ~v8;
        char v17 = 1;
        goto LABEL_26;
      }
    }

    __clrex();
LABEL_24:
    unsigned int v4 = v12;
    if ((v12 & 0x7FF) - 2045 < 3)
    {
      nanov2_madvise_block((os_unfair_lock_s *)a1, a2, a3, 2047);
      return 0LL;
    }
  }

mach_vm_address_t nanov2_create_zone(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_malloc_engaged_nano != 2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1, a2, a3);
  }
  int v3 = a2;
  int v5 = (_DWORD *)MEMORY[0x189600138];
  based_mach_vm_address_t pages = (_DWORD *)nano_common_allocate_based_pages( ~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 29264LL),  0,  0,  1,  0LL);
  mach_vm_address_t v7 = (mach_vm_address_t)based_pages;
  if (!based_pages)
  {
    _malloc_engaged_nano = 0;
    return v7;
  }

  based_pages[26] = 16;
  BOOL v8 = malloc_zero_policy == 2;
  if (malloc_zero_policy == 2) {
    int v9 = nanov2_malloc_zero_on_alloc;
  }
  else {
    int v9 = nanov2_malloc;
  }
  *((void *)based_pages + 2) = nanov2_size;
  *((void *)based_pages + 3) = v9;
  *((void *)based_pages + 4) = nanov2_calloc;
  *((void *)based_pages + 5) = nanov2_valloc;
  *((void *)based_pages + 6) = nanov2_free;
  *((void *)based_pages + 7) = nanov2_realloc;
  *((void *)based_pages + 8) = nanov2_destroy;
  *((void *)based_pages + 10) = nanov2_batch_malloc;
  *((void *)based_pages + 11) = nanov2_batch_free;
  *((void *)based_pages + 12) = nanov2_introspect;
  *((void *)based_pages + 14) = nanov2_memalign;
  *((void *)based_pages + 15) = nanov2_free_definite_size;
  *((void *)based_pages + 16) = nanov2_pressure_relief;
  *((void *)based_pages + 17) = nanov2_claimed_address;
  int v10 = nanov2_malloc_type;
  *((void *)based_pages + 18) = nanov2_try_free_default;
  if (v8) {
    int v10 = nanov2_malloc_type_zero_on_alloc;
  }
  *((void *)based_pages + 20) = v10;
  *((void *)based_pages + 21) = nanov2_calloc_type;
  *((void *)based_pages + 22) = nanov2_realloc_type;
  *((void *)based_pages + 23) = nanov2_memalign_type;
  *(void *)based_mach_vm_address_t pages = 0LL;
  *((void *)based_pages + 1) = 0LL;
  unsigned int v11 = based_pages + 7169;
  mprotect(based_pages, 0xC8uLL, 1);
  *unsigned int v11 = v3;
  *(void *)(v7 + 28704) = a1;
  unint64_t v12 = (unint64_t)*(unsigned int *)((char *)&malloc_entropy + 2) << 16;
  unint64_t v13 = qword_18C444C28;
  uint64_t v14 = qword_18C444C28 & 0xFFFFFFFF0000LL;
  if ((qword_18C444C28 & 0xFFFFFFFF0000LL) == 0) {
    uint64_t v14 = 0xDEADDEAD0000LL;
  }
  if (!v12) {
    unint64_t v12 = v14;
  }
  *(void *)(v7 + 28696) = v12;
  unint64_t v15 = v13 >> 52;
  *(void *)(v7 + 28680) = v15;
  *(void *)(v7 + 28688) = v15 << 14;
  *(void *)(v7 + 28712) = 0LL;
  *(_DWORD *)(v7 + 28736) = 0;
  if (!malloc_tracing_enabled)
  {
    if (nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL)) {
      goto LABEL_14;
    }
LABEL_24:
    nano_common_deallocate_pages(v7, ~*v5 & (unint64_t)(*(void *)v5 + 29264LL), 0);
    _malloc_engaged_nano = 0;
    malloc_report(5u, (uint64_t)"nano zone abandoned due to inability to reserve vm space.\n");
    return 0LL;
  }

  if (!nanov2_create_zone_cold_1()) {
    goto LABEL_24;
  }
LABEL_14:
  *(_WORD *)((*(void *)(v7 + 28688) ^ 0x300000000LL)
           + 4LL
           * (((unsigned __int16)(*(_DWORD *)(v7 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v7 + 28680) << 6)) & 0xFFF)) = 0;
  *(void *)(v7 + 28720) = 0x300000000LL;
  atomic_store(0x304000000uLL, (unint64_t *)(v7 + 28728));
  *(_DWORD *)(v7 + 28744) = 1;
  if ((*(_BYTE *)v11 & 7) != 0)
  {
    int v16 = ((unsigned __int16)(*(_DWORD *)(v7 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v7 + 28680) << 6)) & 0xFFF;
    *(_DWORD *)((*(void *)(v7 + 28688) ^ 0x300000000LL) + ((unint64_t)(v16 == 0) << 8)) = -2147481606;
    if (v16 == 4095) {
      uint64_t v17 = 4094LL;
    }
    else {
      uint64_t v17 = 4095LL;
    }
    *(_DWORD *)((*(void *)(v7 + 28688) ^ 0x300000000LL) + 4 * (((v17 & 0x3F) << 6) | 0x3F)) = -2147481606;
  }

  return v7;
}

uint64_t nanov2_valloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 40LL))();
}

void nanov2_destroy(mach_vm_address_t a1)
{
}

uint64_t nanov2_forked_malloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24LL))();
}

uint64_t nanov2_forked_malloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160LL))();
}

unint64_t nanov2_forked_free(unint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = result;
    unint64_t result = nanov2_pointer_size(result, a2, 0);
    if (a2 >> 29 != 24 && !result) {
      return (*(uint64_t (**)(void))(*(void *)(v3 + 28704) + 48LL))();
    }
  }

  return result;
}

uint64_t nanov2_forked_realloc(uint64_t a1, const void *a2, size_t a3)
{
  if (!a2)
  {
    BOOL v8 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24LL);
    return v8();
  }

  unint64_t v6 = nanov2_pointer_size(a1, (unint64_t)a2, 0);
  if (!v6) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 56LL))();
  }
  size_t v7 = v6;
  BOOL v8 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24LL);
  if (!a3) {
    return v8();
  }
  int v9 = (void *)v8();
  int v10 = v9;
  if (v9)
  {
    if (v7 >= a3) {
      size_t v11 = a3;
    }
    else {
      size_t v11 = v7;
    }
    memcpy(v9, a2, v11);
  }

  return (uint64_t)v10;
}

uint64_t nanov2_forked_realloc_type(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160LL))();
  }
  unint64_t v8 = nanov2_pointer_size(a1, (unint64_t)a2, 0);
  if (!v8) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 176LL))();
  }
  size_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 28704);
  if (!a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v10, 1LL);
  }
  size_t v11 = (void *)(*(uint64_t (**)(uint64_t, size_t, uint64_t))(v10 + 160))(v10, a3, a4);
  unint64_t v12 = v11;
  if (v11)
  {
    if (v9 >= a3) {
      size_t v13 = a3;
    }
    else {
      size_t v13 = v9;
    }
    memcpy(v11, a2, v13);
  }

  return (uint64_t)v12;
}

unint64_t nanov2_forked_batch_free(unint64_t result, uint64_t a2, int a3)
{
  if (a3)
  {
    unint64_t v4 = result;
    unsigned int v5 = a3 - 1;
    do
    {
      unint64_t v6 = *(void *)(a2 + 8LL * v5);
      if (v6) {
        unint64_t result = nanov2_forked_free(v4, v6);
      }
    }

    while ((unint64_t)v5--);
  }

  return result;
}

uint64_t nanov2_forked_zone(void *a1)
{
  a1[2] = nanov2_size;
  a1[3] = nanov2_forked_malloc;
  a1[4] = nanov2_forked_calloc;
  a1[5] = nanov2_valloc;
  a1[6] = nanov2_forked_free;
  a1[7] = nanov2_forked_realloc;
  a1[8] = nanov2_destroy;
  a1[10] = nanov2_forked_batch_malloc;
  a1[11] = nanov2_forked_batch_free;
  a1[12] = nanov2_introspect;
  a1[14] = nanov2_forked_memalign;
  a1[15] = nanov2_forked_free_definite_size;
  a1[20] = nanov2_forked_malloc_type;
  a1[21] = nanov2_forked_calloc_type;
  a1[17] = nanov2_forked_claimed_address;
  a1[18] = 0LL;
  a1[22] = nanov2_forked_realloc_type;
  a1[23] = nanov2_forked_memalign_type;
  return mprotect(a1, 0xC8uLL, 1);
}

uint64_t nanov2_forked_calloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 32LL))();
}

uint64_t nanov2_forked_batch_malloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 80LL))();
}

uint64_t nanov2_forked_memalign(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 112LL))();
}

uint64_t nanov2_forked_claimed_address()
{
  return 1LL;
}

uint64_t nanov2_forked_calloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 168LL))();
}

uint64_t nanov2_forked_memalign_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 184LL))();
}

void *nanov2_allocate_outlined( uint64_t a1, unsigned int **a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int *a6, uint64_t a7, char a8, char a9, uint64_t a10)
{
  if (a7) {
    nanov2_guard_corruption_detected();
  }
  if (a6) {
    nanov2_madvise_block((os_unfair_lock_s *)a1, a6, a4, 2047);
  }
  int v16 = (unsigned __int16 *)(a1 + 28672);
  if (((1 << a4) & *(unsigned __int16 *)(a1 + 28672)) != 0)
  {
LABEL_5:
    uint64_t v17 = *(void *)(a1 + 28704);
    if (a9) {
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 160))(v17, a3, a10);
    }
    else {
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v17, a3);
    }
    int v21 = (void *)v18;
    if (!v18)
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v21;
    }

    goto LABEL_12;
  }

  char v24 = a8;
  unint64_t v19 = (os_unfair_lock_s *)(a1 + ((unint64_t)a4 << 8) + 4LL * a5 + 24576);
  os_unfair_lock_lock_with_options();
  if (*a2)
  {
    unint64_t v20 = nanov2_allocate_from_block(a1, *a2, a4);
    if (v20)
    {
      int v21 = (void *)v20;
      os_unfair_lock_unlock(v19);
      a8 = v24;
      goto LABEL_12;
    }
  }

  int v21 = (void *)nanov2_find_block_and_allocate(a1, a4, a2);
  os_unfair_lock_unlock(v19);
  a8 = v24;
  if (!v21)
  {
    do
      unsigned __int16 v22 = __ldxr(v16);
    while (__stxr(v22 | (1 << a4), v16));
    goto LABEL_5;
  }

LABEL_12:
  switch(malloc_zero_policy)
  {
    case 2:
LABEL_17:
      _platform_memset();
      return v21;
    case 1:
      if ((a8 & 1) == 0)
      {
        *int v21 = 0LL;
        return v21;
      }

      goto LABEL_17;
    case 0:
      *int v21 = 0LL;
      v21[1] = 0LL;
      break;
  }

  return v21;
}

  int v16 = *(_BYTE *)(v15 + 32) & 0xF;
  if (v16 > 7) {
    xzm_segment_group_free_chunk_cold_3(v16);
  }
  unsigned __int16 v22 = (os_unfair_lock_s **)(v15 & 0xFFFFFFFFFFFFC000LL);
  unsigned int v23 = a2
      - *(void *)((v15 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v15 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v16 == 5 || v16 == 2)
  {
    int v25 = *(void *)(v6 + 216) + 88LL * *(unsigned __int8 *)(v15 + 33);
    uint64_t v17 = *(void *)(v25 + 48);
  }

  else
  {
    uint64_t v17 = (unint64_t)*(unsigned int *)(v15 + 40) << 14;
    if (v23 % v17) {
      goto LABEL_14;
    }
  }

  if (v16 == 5)
  {
    if (((*(_DWORD *)v15 >> (v23 / v17)) & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_14;
  }

  if (v16 != 2 || *(void *)a2 != (*(void *)(v6 + 272) ^ a2)) {
    goto LABEL_43;
  }
  int v31 = v15;
  unsigned int v32 = v15 & 0xFFFFFFFFFFFFC000LL;
  is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v6, v15, a2);
  unint64_t v15 = v31;
  unsigned __int16 v22 = (os_unfair_lock_s **)v32;
  if (is_free_slow)
  {
LABEL_14:
    uint64_t v17 = _xzm_ptr_size_outlined(v6, a2);
    goto LABEL_15;
  }

  unint64_t v12 = *(_BYTE *)(v11 + 32) & 0xF;
  if (v12 > 7) {
    xzm_segment_group_free_chunk_cold_3(v12);
  }
  char v24 = a2
      - (((0xAAAAAAAAAAAAC000LL * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
       + *(void *)((v11 & 0xFFFFFFFFFFFFC000LL) + 0x30));
  if (v12 == 5 || v12 == 2)
  {
    int v26 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v11 + 33);
    size_t v13 = *(void *)(v26 + 48);
  }

  else
  {
    size_t v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13) {
      goto LABEL_14;
    }
  }

  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0) {
      goto LABEL_15;
    }
LABEL_14:
    size_t v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }

  if (v12 == 2 && *(void *)a2 == (*(void *)(a1 + 272) ^ a2))
  {
    int v27 = v13;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    size_t v13 = v27;
    if (is_free_slow) {
      goto LABEL_14;
    }
  }

  uint64_t v14 = *(_BYTE *)(v13 + 32) & 0xF;
  if (v14 > 7) {
    xzm_segment_group_free_chunk_cold_3(v14);
  }
  int v26 = a2
      - (((0xAAAAAAAAAAAAC000LL * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
       + *(void *)((v13 & 0xFFFFFFFFFFFFC000LL) + 0x30));
  if (v14 == 5 || v14 == 2)
  {
    unsigned int v28 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v13 + 33);
    unint64_t v15 = *(void *)(v28 + 48);
  }

  else
  {
    unint64_t v15 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    if (v26 % v15) {
      goto LABEL_14;
    }
  }

  if (v14 == 5)
  {
    if (((*(_DWORD *)v13 >> (v26 / v15)) & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  if (v14 == 2
    && *(void *)a2 == (*(void *)(a1 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2))
  {
LABEL_14:
    unint64_t v15 = _xzm_ptr_size_outlined(a1, a2);
  }

  unint64_t v12 = *(_BYTE *)(v11 + 32) & 0xF;
  if (v12 > 7) {
    xzm_segment_group_free_chunk_cold_3(v12);
  }
  char v24 = a2
      - *(void *)((v11 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v12 == 5 || v12 == 2)
  {
    int v26 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v11 + 33);
    size_t v13 = *(void *)(v26 + 48);
  }

  else
  {
    size_t v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13) {
      goto LABEL_14;
    }
  }

  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0) {
      goto LABEL_15;
    }
LABEL_14:
    size_t v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }

  if (v12 == 2 && *(void *)a2 == (*(void *)(a1 + 272) ^ a2))
  {
    int v27 = v13;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    size_t v13 = v27;
    if (is_free_slow) {
      goto LABEL_14;
    }
  }

    uint64_t v17 = __ROR8__(*v8, 60);
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFFFF0LL;
    unint64_t v19 = v17 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(a1 + 632);
    if (((v17 ^ (HIDWORD(v19)
                              + (_DWORD)v19
                              + ((HIDWORD(v19) + v19) >> 16)
                              + ((HIDWORD(v19) + (_DWORD)v19 + ((HIDWORD(v19) + v19) >> 16)) >> 8))) & 0xFLL) == 0)
    {
      if (v18 == a3)
      {
        int v16 = 0;
        *unint64_t v8 = *(void *)a3;
        goto LABEL_15;
      }

      int v25 = *(_DWORD *)(a1 + 620);
      int v26 = "tiny_free_list_remove_ptr: Internal invariant broken (prev ptr of next): ptr=%p, next_prev=%p\n";
LABEL_31:
      malloc_zone_error(v25, 1, (uint64_t)v26);
      __break(1u);
      return;
    }

    goto LABEL_28;
  }

  uint64_t v14 = __ROR8__(*(void *)((v11 & 0xFFFFFFFFFFFFFFF0LL) + 8), 60);
  unint64_t v15 = v14 & 0xFFFFFFFFFFFFFFF0LL ^ v9;
  if (((v14 ^ (HIDWORD(v15)
                            + (_DWORD)v15
                            + ((HIDWORD(v15) + v15) >> 16)
                            + ((HIDWORD(v15) + (_DWORD)v15 + ((HIDWORD(v15) + v15) >> 16)) >> 8))) & 0xFLL) != 0)
  {
LABEL_28:
    free_list_checksum_botch(a1);
    __break(1u);
    goto LABEL_29;
  }

  if ((v14 & 0xFFFFFFFFFFFFFFF0LL) != a3)
  {
LABEL_29:
    int v25 = *(_DWORD *)(a1 + 620);
    int v26 = "tiny_free_list_remove_ptr: Internal invariant broken (next ptr of prev): ptr=%p, prev_next=%p\n";
    goto LABEL_31;
  }

  *(void *)((v11 & 0xFFFFFFFFFFFFFFF0LL) + 8) = v5;
  if (v8) {
    goto LABEL_12;
  }
  int v16 = 1;
LABEL_15:
  unint64_t v20 = (a3 & 0xFFFFFFFFFFF00000LL) + 4LL * v6 + 16168;
  int v21 = *(unsigned __int16 *)((a3 & 0xFFFFFFFFFFF00000LL) + 4LL * v6 + 0x3F28);
  unsigned __int16 v22 = (unsigned __int16)((a3 + 1032064) >> 4) + 1;
  unsigned int v23 = (_WORD *)(v20 | 2);
  char v24 = *(unsigned __int16 *)(v20 + 2);
  if (v22 == v21 && v22 == v24)
  {
    *unsigned int v23 = 0;
    *(_WORD *)unint64_t v20 = 0;
  }

  else if (v22 == v21)
  {
    if (v16) {
      purgeable_ptr_in_use_enumerator_cold_1(a1, v8, a3);
    }
    *(_WORD *)unint64_t v20 = ((v7 - 16512) >> 4) + 1;
  }

  else if (v22 == v24)
  {
    if (!v12) {
      purgeable_ptr_in_use_enumerator_cold_1(a1, v8, a3);
    }
    *unsigned int v23 = ((v11 - 16512) >> 4) + 1;
  }

void nanov2_guard_corruption_detected()
{
}

uint64_t nanov2_ptr_in_use_enumerator()
{
  task_name_t v0 = MEMORY[0x1895FE128]();
  unint64_t v2 = v1;
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  task_name_t task = v0;
  v72[3658] = *MEMORY[0x1895FEE08];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  if ((v8 & 3) == 0) {
    return 0LL;
  }
  if (!v4)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v12, v13);
      }
    }

    unint64_t v4 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, void **))_malloc_default_reader_4;
  }

  uint64_t result = v4(task, (uint64_t)v6, 29264LL, &__src);
  if ((_DWORD)result) {
    return result;
  }
  BOOL v15 = mach_task_is_self(task) && __src == v6;
  BOOL v16 = v15;
  BOOL v57 = v16;
  memcpy(v72, __src, 0x7250uLL);
  __src = v72;
  unint64_t v17 = v72[3590];
  unint64_t v18 = atomic_load(&v72[3591]);
  if (!v17) {
    return 0LL;
  }
  int v19 = ((unsigned __int16)(LODWORD(v72[3585]) >> 6) | (unsigned __int16)(LOWORD(v72[3585]) << 6)) & 0xFFF;
  unint64_t v50 = (v18 - 1) & 0xFFFFFFFFE0000000LL;
  unint64_t v51 = v18;
  uint64_t v54 = v10;
  uint64_t v20 = task;
  unsigned int v56 = v2;
  char v55 = v8;
  unint64_t v52 = v4;
  while (1)
  {
    uint64_t v68 = 0LL;
    uint64_t result = v4(v20, v17, 0x20000000LL, (void **)&v68);
    if ((_DWORD)result) {
      break;
    }
    uint64_t v60 = v17 - v68;
    unint64_t v21 = v17 + 0x20000000;
    if (v17 == v50) {
      unint64_t v21 = v18;
    }
    unint64_t v53 = v17;
    unint64_t v59 = v21;
    if (v17 < v21)
    {
      unint64_t v61 = v17;
      unint64_t v22 = v17;
      do
      {
        unsigned int v23 = 0;
        char v24 = (unsigned int *)((*((void *)__src + 3586) ^ v22 & 0xFFFFFFFFFC000000LL) - v60);
        unint64_t v62 = v22;
        do
        {
          if (v23 != v19)
          {
            unsigned int v25 = *v24;
            int v26 = *v24 & 0x7FF;
            BOOL v27 = (v26 - 2042) > 5 || ((1 << (*v24 + 6)) & 0x31) == 0;
            if (v27 && v26 != 0)
            {
              uint64_t v29 = ((unsigned __int16)(v23 >> 6) | (unsigned __int16)((_WORD)v23 << 6)) & 0xFFF;
              unint64_t v64 = v22 + (v29 << 14);
              if ((v8 & 2) != 0)
              {
                v67[0] = v22 + (v29 << 14);
                v67[1] = 0x4000LL;
                ((void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))v2)(v20, v10, 2LL, v67, 1LL);
                unint64_t v22 = v62;
              }

              if ((v8 & 1) != 0)
              {
                uint64_t v30 = ptr_offset_to_size_class[(*((_DWORD *)__src + 7170) ^ (v64 >> 14) & 0xFC0) >> 6];
                int v65 = 16 * v30 + 16;
                unint64_t v31 = (int)slots_by_size_class[v30];
                if ((v26 - 2043) > 1)
                {
                  int v63 = slots_by_size_class[v30];
                  unsigned int v37 = 64 - __clz(v31);
                  if (v57)
                  {
                    uint64_t v38 = *((void *)__src + 3588);
                    uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
                    uint64_t v40 = bitarray_size(v37);
                    unint64_t v41 = (void *)v39(v38, 1LL, v40);
                  }

                  else
                  {
                    unint64_t v41 = bitarray_create(v37);
                  }

                  uint64_t v42 = v41;
                  unsigned int v43 = 0;
                  if (v63 <= 1) {
                    int v44 = 1;
                  }
                  else {
                    int v44 = v63;
                  }
                  do
                    bitarray_set((uint64_t)v42, v37, v43++);
                  while (v44 != v43);
                  if (v26 == 2043)
                  {
                    int v45 = 0;
                  }

                  else
                  {
                    int v45 = 0;
                    do
                    {
                      if (!v26) {
                        break;
                      }
                      if (v26 > v63) {
                        break;
                      }
                      bitarray_zap((uint64_t)v42, v37, v26 - 1);
                      int v26 = *(unsigned __int16 *)(v64 - v60 + (v26 - 1) * v65 + 8);
                      ++v45;
                    }

                    while (v26 != 2043);
                  }

                  if (bitarray_zap_first_set((uint64_t)v42, v37, &v66))
                  {
                    int v46 = 0;
                    unsigned int v47 = v63 + v45 + (~(v25 >> 11) | 0xFFFFFC00);
                    uint64_t v48 = v71;
                    do
                    {
                      if (v66 >= v47) {
                        break;
                      }
                      *(v48 - 1) = v64 + (int)(v66 * v65);
                      *uint64_t v48 = v65;
                      ++v46;
                      v48 += 2;
                    }

                    while (bitarray_zap_first_set((uint64_t)v42, v37, &v66));
                  }

                  else
                  {
                    int v46 = 0;
                  }

                  uint64_t v10 = v54;
                  _free(v42);
                  int v33 = v46;
                  unint64_t v2 = v56;
                  char v8 = v55;
                  uint64_t v20 = task;
                }

                else
                {
                  unsigned int v32 = ~(v25 >> 11) | 0xFFFFFC00;
                  if (v26 != 2043) {
                    unsigned int v32 = 0;
                  }
                  int v33 = v31 + v32;
                  if ((int)(v31 + v32) >= 1)
                  {
                    uint64_t v34 = v31 + v32;
                    uint64_t v35 = v71;
                    unint64_t v36 = v61 + (v29 << 14);
                    do
                    {
                      *(v35 - 1) = v36;
                      *uint64_t v35 = v65;
                      v35 += 2;
                      v36 += v65;
                      --v34;
                    }

                    while (v34);
                  }
                }

                if (v33) {
                  v2(v20, v10, 1LL, v70);
                }
                unint64_t v22 = v62;
              }
            }
          }

          ++v23;
          ++v24;
        }

        while (v23 != 4096);
        v22 += 0x4000000LL;
        v61 += 0x4000000LL;
      }

      while (v22 < v59);
    }

    unint64_t v4 = v52;
    if (*(_WORD *)((*((void *)__src + 3586) ^ v53 & 0xFFFFFFFFFC000000LL)
                  + 4LL
                  * (((unsigned __int16)(*((_DWORD *)__src + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)__src + 7170) << 6)) & 0xFFF)
                  - v60))
      BOOL v49 = v53 == 0;
    else {
      BOOL v49 = 1;
    }
    unint64_t v17 = v53
        + ((unint64_t)*(unsigned __int16 *)((*((void *)__src + 3586) ^ v53 & 0xFFFFFFFFFC000000LL)
                                                 + 4LL
    unint64_t v18 = v51;
    if (v49) {
      return 0LL;
    }
  }

  return result;
}

unint64_t nanov2_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x100) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 28704) + 96LL) + 8LL))();
  }
  if (a2 <= 0x10) {
    return 16LL;
  }
  return (a2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
}

uint64_t nanov2_check()
{
  return 1LL;
}

void nanov2_print_self(void *a1, int a2)
{
  uint64_t v76 = *MEMORY[0x1895FEE08];
  task_name_t task = *MEMORY[0x1895FFD48];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  if (task)
  {
    is_self = mach_task_is_self(task);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v4, v5);
    }
  }

  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  _platform_memset();
  if (task)
  {
    uint64_t v6 = mach_task_is_self(task);
    if (!(_DWORD)v6) {
      purgeable_ptr_in_use_enumerator_cold_1(v6, v7, v8);
    }
  }

  unint64_t v9 = atomic_load(a1 + 3591);
  unint64_t v10 = a1[3590];
  if (v10)
  {
    uint64_t v11 = ((unsigned __int16)(a1[3585] >> 6) | (unsigned __int16)((unsigned __int16)a1[3585] << 6)) & 0xFFF;
    while (1)
    {
      if (task)
      {
        uint64_t v12 = mach_task_is_self(task);
        if (!(_DWORD)v12) {
          purgeable_ptr_in_use_enumerator_cold_1(v12, v13, v14);
        }
      }

      unint64_t v15 = v10 == ((v9 - 1) & 0xFFFFFFFFE0000000LL) ? v9 : v10 + 0x20000000;
      uint64_t v16 = a1[3586];
      if (v10 < v15) {
        break;
      }
LABEL_31:
      uint64_t v23 = *(unsigned __int16 *)((v16 ^ v10 & 0xFFFFFFFFFC000000LL)
                                + 4LL
                                * (((unsigned __int16)(*((_DWORD *)a1 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)a1 + 7170) << 6)) & 0xFFF));
      if ((_DWORD)v23) {
        BOOL v24 = v10 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      v10 += v23 << 29;
      if (v24 || v10 >= v9) {
        goto LABEL_39;
      }
    }

    unint64_t v17 = v10;
LABEL_18:
    unsigned __int16 v18 = 0;
    uint64_t v19 = 0LL;
    while (1)
    {
      if (v11 != v19)
      {
        uint64_t v20 = ptr_offset_to_size_class[((v18 | (unsigned __int16)(v19 >> 6)) & 0xFC0 ^ *((_DWORD *)a1 + 7170)) >> 6];
        unsigned int v21 = *(_DWORD *)((v17 & 0xFFFFFFFFFC000000LL ^ v16) + 4 * v19) & 0x7FF;
        if (v21 > 0x7FC)
        {
          if (v21 - 2045 < 3) {
            goto LABEL_29;
          }
        }

        else
        {
          if (!v21 || v21 == 2042) {
            goto LABEL_29;
          }
          if (v21 == 2044)
          {
            unsigned int v22 = slots_by_size_class[v20];
            if (!v22) {
              goto LABEL_29;
            }
LABEL_28:
            v72 += v22;
            v73 += (int)(v22 * (16 * v20 + 16));
            v74 += 0x4000LL;
            goto LABEL_29;
          }
        }

        unsigned int v22 = slots_by_size_class[v20]
            + (~(*(_DWORD *)((v17 & 0xFFFFFFFFFC000000LL ^ v16) + 4 * v19) >> 11) | 0xFFFFFC00);
        if (v22) {
          goto LABEL_28;
        }
      }

LABEL_29:
      ++v19;
      v18 += 64;
      if (v19 == 4096)
      {
        v17 += 0x4000000LL;
        if (v17 >= v15) {
          goto LABEL_31;
        }
        goto LABEL_18;
      }
    }
  }

  if (malloc_internal_security_policy)
  {
    unsigned int v22 = (const char *)_simple_getenv();
    if (v22)
    {
      uint64_t v23 = strtol(v22, 0LL, 10);
      if (v23 < 5) {
        uint64_t v16 = v23;
      }
    }
  }

  if (v16)
  {
    BOOL v24 = 40 * v16 + 81;
    if (v24 >= 0x100) {
      xzm_main_malloc_zone_create_cold_5();
    }
  }

  else
  {
    BOOL v24 = 201LL;
  }

  v106 = malloc_internal_security_policy && (unsigned int v25 = (const char *)_simple_getenv()) != 0LL && strtol(v25, 0LL, 10) == 1;
  if (_malloc_engaged_nano == 2) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = v21;
  }
  BOOL v27 = malloc_common_value_for_key_copy(a4, "malloc_xzone_slot_config", __dst, 0x100uLL);
  if (v27)
  {
    unsigned int v28 = strtol(v27, 0LL, 10);
    if (v28 < 3) {
      uint64_t v26 = v28;
    }
  }

  v108 = a1;
  uint64_t v29 = (const char *)_simple_getenv();
  if (v29)
  {
    unint64_t v30 = strtol(v29, 0LL, 10);
    if (v30 < 3) {
      uint64_t v26 = v30;
    }
  }

  if (!malloc_internal_security_policy)
  {
LABEL_56:
    v94 = 0;
LABEL_57:
    v110 = 1024;
    uint64_t v34 = 256;
    uint64_t v35 = 64;
    goto LABEL_82;
  }

  unint64_t v31 = (const char *)_simple_getenv();
  if (v31)
  {
    int v32 = strtol(v31, 0LL, 10);
    if (v32 >= 3) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = v32;
    }
  }

  else
  {
    uint64_t v33 = 0;
  }

  v94 = v33;
  uint64_t v36 = (const char *)_simple_getenv();
  uint64_t v35 = 64;
  uint64_t v34 = 256;
  if (v36)
  {
    unint64_t v37 = strtol(v36, 0LL, 10);
    if (v37 >= 0xFFFFFFFF) {
      uint64_t v34 = 256;
    }
    else {
      uint64_t v34 = v37;
    }
    if (v37 >= 0xFFFFFFFF) {
      uint64_t v35 = 64;
    }
    else {
      uint64_t v35 = v37;
    }
  }

  int v38 = (const char *)_simple_getenv();
  if (v38)
  {
    unint64_t v39 = strtol(v38, 0LL, 10);
    if (v39 < 0xFFFFFFFF) {
      uint64_t v35 = v39;
    }
  }

  uint64_t v40 = (const char *)_simple_getenv();
  if (v40)
  {
    int v41 = strtol(v40, 0LL, 10);
    if (v41 < 0xFFFFFFFF) {
      uint64_t v34 = v41;
    }
  }

  if (malloc_internal_security_policy && (int v42 = (const char *)_simple_getenv()) != 0LL)
  {
    int v43 = strtol(v42, 0LL, 10);
    if (v43 >= 0xFFFFFFFF) {
      int v44 = 1024;
    }
    else {
      int v44 = v43;
    }
    v110 = v44;
  }

  else
  {
LABEL_81:
    v110 = 1024;
  }

  unsigned int v22 = *(_BYTE *)(v21 + 32) & 0xF;
  if (v22 > 7) {
    xzm_segment_group_free_chunk_cold_3(v22);
  }
  uint64_t v29 = a2
      - (((0xAAAAAAAAAAAAC000LL * (((v21 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
       + *(void *)((v21 & 0xFFFFFFFFFFFFC000LL) + 0x30));
  if (v22 == 5 || v22 == 2)
  {
    unint64_t v31 = *(void *)(v14 + 216) + 88LL * *(unsigned __int8 *)(v21 + 33);
    uint64_t v13 = *(void *)(v31 + 48);
  }

  else
  {
    uint64_t v13 = (unint64_t)*(unsigned int *)(v21 + 40) << 14;
    if (v29 % v13) {
      goto LABEL_31;
    }
  }

  if (v22 == 5)
  {
    if (((*(_DWORD *)v21 >> (v29 / v13)) & 1) == 0) {
      goto LABEL_32;
    }
LABEL_31:
    uint64_t v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_32;
  }

  if (v22 == 2 && *(void *)a2 == (*(void *)(v14 + 272) ^ a2))
  {
    int v32 = v13;
    uint64_t v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v21, a2);
    uint64_t v13 = v32;
    if (v33) {
      goto LABEL_31;
    }
  }

  unsigned int v28 = *(_BYTE *)(v27 + 32) & 0xF;
  if (v28 > 7) {
    xzm_segment_group_free_chunk_cold_3(v28);
  }
  BOOL v61 = a2
      - *(void *)((v27 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v27 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v28 == 5 || v28 == 2)
  {
    unint64_t v63 = *(void *)(v20 + 216) + 88LL * *(unsigned __int8 *)(v27 + 33);
    uint64_t v19 = *(void *)(v63 + 48);
  }

  else
  {
    uint64_t v19 = (unint64_t)*(unsigned int *)(v27 + 40) << 14;
    if (v61 % v19) {
      goto LABEL_31;
    }
  }

  if (v28 == 5)
  {
    if (((*(_DWORD *)v27 >> (v61 / v19)) & 1) == 0) {
      goto LABEL_32;
    }
LABEL_31:
    uint64_t v19 = _xzm_ptr_size_outlined(v20, a2);
    goto LABEL_32;
  }

  if (v28 == 2
    && *(void *)a2 == (*(void *)(v20 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(v20, v27, a2))
  {
    goto LABEL_31;
  }

uint64_t nanov2_statistics_self(void *a1, uint64_t a2)
{
  task_name_t task = *MEMORY[0x1895FFD48];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  uint64_t result = _platform_memset();
  task_name_t v5 = task;
  if (task)
  {
    uint64_t result = mach_task_is_self(task);
    task_name_t v5 = task;
    if (!(_DWORD)result) {
      purgeable_ptr_in_use_enumerator_cold_1(result, v6, v7);
    }
  }

  unint64_t v8 = atomic_load(a1 + 3591);
  unint64_t v9 = a1[3590];
  if (v9)
  {
    uint64_t v10 = ((unsigned __int16)(a1[3585] >> 6) | (unsigned __int16)((unsigned __int16)a1[3585] << 6)) & 0xFFF;
    while (1)
    {
      if (v5)
      {
        uint64_t result = mach_task_is_self(v5);
        task_name_t v5 = task;
        if (!(_DWORD)result) {
          purgeable_ptr_in_use_enumerator_cold_1(result, v11, v12);
        }
      }

      unint64_t v13 = v9 == ((v8 - 1) & 0xFFFFFFFFE0000000LL) ? v8 : v9 + 0x20000000;
      uint64_t v14 = a1[3586];
      if (v9 < v13) {
        break;
      }
LABEL_27:
      uint64_t v21 = *(unsigned __int16 *)((v14 ^ v9 & 0xFFFFFFFFFC000000LL)
                                + 4LL
                                * (((unsigned __int16)(*((_DWORD *)a1 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)a1 + 7170) << 6)) & 0xFFF));
      if ((_DWORD)v21) {
        BOOL v22 = v9 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      v9 += v21 << 29;
      if (v22 || v9 >= v8) {
        return result;
      }
    }

    unint64_t v15 = v9;
LABEL_14:
    unsigned __int16 v16 = 0;
    uint64_t v17 = 0LL;
    while (1)
    {
      if (v10 != v17)
      {
        uint64_t v18 = ptr_offset_to_size_class[((v16 | (unsigned __int16)(v17 >> 6)) & 0xFC0 ^ *((_DWORD *)a1 + 7170)) >> 6];
        unsigned int v19 = *(_DWORD *)((v15 & 0xFFFFFFFFFC000000LL ^ v14) + 4 * v17) & 0x7FF;
        if (v19 > 0x7FC)
        {
          if (v19 - 2045 < 3) {
            goto LABEL_25;
          }
        }

        else
        {
          if (!v19 || v19 == 2042) {
            goto LABEL_25;
          }
          if (v19 == 2044)
          {
            unsigned int v20 = slots_by_size_class[v18];
            if (!v20) {
              goto LABEL_25;
            }
LABEL_24:
            *(_DWORD *)a2 += v20;
            *(void *)(a2 + 8) += (int)(v20 * (16 * v18 + 16));
            *(void *)(a2 + 24) += 0x4000LL;
            goto LABEL_25;
          }
        }

        unsigned int v20 = slots_by_size_class[v18]
            + (~(*(_DWORD *)((v15 & 0xFFFFFFFFFC000000LL ^ v14) + 4 * v17) >> 11) | 0xFFFFFC00);
        if (v20) {
          goto LABEL_24;
        }
      }

uint64_t nanov2_locked()
{
  return 0LL;
}

uint64_t nanov2_statistics_task( uint64_t a1, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a4)
{
  return nanov2_statistics(a1, a2, a3, 0LL, a4);
}

uint64_t _malloc_default_reader_4(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t nanov2_print( uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), void (*a5)(const char *, ...))
{
  uint64_t v71 = *MEMORY[0x1895FEE08];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  if (a4(a1, (uint64_t)a3, 29264LL, &v69))
  {
    unint64_t v9 = "Failed to map nanozonev2_s at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }

  nanov2_statistics(a1, a3, a4, a5, (uint64_t)&v66);
  a5( "Nanozonev2 %p: blocks in use: %llu, size in use: %llu allocated size: %llu, allocated regions: %d, region holes: %d\n",  a3,  v66,  v67,  v68,  *(_DWORD *)(v69 + 28744),  *(_DWORD *)(v69 + 28748));
  a5("Current Allocation Blocks By Size Class/Context [CPU]\n");
  uint64_t v11 = 0LL;
  uint64_t v12 = 0x4000LL;
  do
  {
    a5("  Class %d: ", v11);
    for (uint64_t i = 0LL; i != 64; ++i)
    {
      uint64_t v14 = *(const void **)(v69 + v12 + 8 * i);
      if (v14) {
        a5("%d: %p; ", i, v14);
      }
    }

    uint64_t result = ((uint64_t (*)(const char *))a5)("\n");
    ++v11;
    v12 += 512LL;
  }

  while (v11 != 16);
  unint64_t v15 = *(char **)(v69 + 28720);
  unint64_t v16 = atomic_load((unint64_t *)(v69 + 28728));
  if (v15)
  {
    int v17 = 0;
    uint64_t v18 = ((unsigned __int16)(*(void *)(v69 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(void *)(v69 + 28680) << 6)) & 0xFFF;
    unint64_t v51 = (v16 - 1) & 0xFFFFFFFFE0000000LL;
    unint64_t v52 = v16;
    unint64_t v63 = a5;
    __int16 v54 = a4;
    unsigned int v53 = a1;
    while (1)
    {
      a5("\nRegion %d: base address %p\n", v17, v15);
      uint64_t result = a4(a1, (uint64_t)v15, 0x20000000LL, &v65);
      if ((_DWORD)result) {
        break;
      }
      int v55 = v17;
      unint64_t v56 = (unint64_t)v15;
      uint64_t v59 = v65 - (void)v15;
      unsigned int v19 = v15 + 0x20000000;
      unint64_t v58 = (unint64_t)v19;
      if (v15 < v19)
      {
        int v20 = 0;
        unint64_t v21 = v56;
        while (1)
        {
          uint64_t v22 = 0LL;
          int v23 = 0;
          int v24 = 0;
          int v25 = 0;
          int v26 = 0;
          int v27 = 0;
          unsigned int v28 = (char *)(*(void *)(v69 + 28688) ^ v21 & 0xFFFFFFFFFC000000LL);
          uint64_t v29 = &v28[v59];
          do
          {
            if (4 * v18 != v22)
            {
              unsigned int v30 = *(_DWORD *)&v29[v22] & 0x7FF;
              if (v30 > 0x7FD)
              {
                if (v30 == 2046) {
                  ++v23;
                }
                else {
                  ++v24;
                }
              }

              else if (v30)
              {
                if (v30 == 2045) {
                  ++v26;
                }
                else {
                  ++v27;
                }
              }

              else
              {
                ++v25;
              }
            }

            v22 += 4LL;
          }

          while (v22 != 0x4000);
          unint64_t v64 = v21;
          a5( "Arena #%d: base address %p. Blocks - active: %d, madvisable: %d, madvising: %d, madvised: %d, unused: %d\n",  v20,  (const void *)v21,  v27,  v26,  v23,  v24,  v25);
          unsigned __int16 v31 = 0;
          uint64_t v32 = 0LL;
          memset(v70, 0, sizeof(v70));
          uint64_t v33 = v69;
          do
          {
            if (v18 != v32
              && (*(_DWORD *)&v29[4 * v32] & 0x7FFu) - 2045 >= 3
              && (*(_DWORD *)&v29[4 * v32] & 0x7FF) != 0)
            {
              uint64_t v35 = ptr_offset_to_size_class[((v31 | (unsigned __int16)(v32 >> 6)) & 0xFC0 ^ *(_DWORD *)(v33 + 28680)) >> 6];
              ++*((_DWORD *)v70 + v35);
            }

            ++v32;
            v31 += 64;
          }

          while (v32 != 4096);
          a5("Size classes with allocated blocks: ");
          for (uint64_t j = 0LL; j != 16; ++j)
          {
            if (*((_DWORD *)v70 + j)) {
              a5("%d ", j);
            }
          }

          int v60 = v20;
          uint64_t result = ((uint64_t (*)(const char *))a5)("\n");
          unint64_t v37 = v64;
          if (a2 >= 2) {
            break;
          }
LABEL_70:
          unint64_t v21 = v37 + 0x4000000;
          int v20 = v60 + 1;
          a5 = v63;
          if (v21 >= v58) {
            goto LABEL_71;
          }
        }

        unsigned __int16 v38 = 0;
        uint64_t v39 = 0LL;
        while (2)
        {
          if (v18 != v39)
          {
            unsigned int v40 = *(_DWORD *)&v29[4 * v39];
            int v41 = v40 & 0x7FF;
            BOOL v42 = (v41 - 2042) > 5 || ((1 << (v40 + 6)) & 0x31) == 0;
            if (v42 && v41 != 0)
            {
              if (v41 == 2044)
              {
                char v62 = 0;
                int v44 = "FULL";
LABEL_61:
                BOOL v61 = v44;
              }

              else
              {
                if (v41 == 2045)
                {
                  char v62 = 0;
                  int v44 = "CAN MADVISE";
                  goto LABEL_61;
                }

                BOOL v61 = 0LL;
                char v62 = 1;
              }

              uint64_t v45 = (v38 | (unsigned __int16)(v39 >> 6)) & 0xFFF;
              uint64_t v46 = ptr_offset_to_size_class[(int)(v45 ^ *(_DWORD *)(v69 + 28680)) >> 6];
              v63( "    Block %d: base %p; metadata: %p, size %d (class %d) in-use: %d ",
                v39,
                (const void *)(v37 + (v45 << 14)),
                v28,
                16 * v46 + 16,
                v46,
                v40 >> 31);
              if ((v62 & 1) != 0)
              {
                int v47 = slots_by_size_class[v46];
                if (v41 == 2043) {
                  unsigned __int16 v48 = "BUMP (free list empty)";
                }
                else {
                  unsigned __int16 v48 = "next_slot (1-based) = %d";
                }
                v63(v48);
                uint64_t result = ((uint64_t (*)(const char *, ...))v63)( ", allocated slots: %d, free slots = %d, occupancy: %d%%\n",  v47 + ~((v40 >> 11) & 0x3FF),  ((v40 >> 11) & 0x3FF) + 1,  (int)(100 * (v47 + ~((v40 >> 11) & 0x3FF))) / v47);
              }

              else
              {
                uint64_t result = ((uint64_t (*)(const char *, ...))v63)("%s\n", v61);
              }

              unint64_t v37 = v64;
            }
          }

          ++v39;
          v28 += 4;
          v38 += 64;
          if (v39 == 4096) {
            goto LABEL_70;
          }
          continue;
        }
      }

LABEL_71:
      uint64_t v49 = *(unsigned __int16 *)(v59
                                + (*(void *)(v69 + 28688) ^ v56 & 0xFFFFFFFFFC000000LL)
                                + 4LL
                                * (((unsigned __int16)(*(_DWORD *)(v69 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v69 + 28680) << 6)) & 0xFFF));
      unint64_t v16 = v52;
      if (v56 + (v49 << 29) >= v52) {
        unint64_t v15 = 0LL;
      }
      else {
        unint64_t v15 = (char *)(v56 + (v49 << 29));
      }
      int v17 = v55 + 1;
      if (*(_WORD *)(v59 {
                    + (*(void *)(v69 + 28688) ^ v56 & 0xFFFFFFFFFC000000LL)
      }
                    + 4LL
      else {
        BOOL v50 = 1;
      }
      a4 = v54;
      a1 = v53;
      if (v50) {
        return result;
      }
    }

    unint64_t v9 = "Failed to map nanov2 region at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }

  return result;
}

uint64_t nanov2_statistics( uint64_t task, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void (*a4)(const char *, ...), uint64_t a5)
{
  uint64_t v6 = a3;
  if (a4) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = (void (*)(const char *, ...))nanov2_null_printer;
  }
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v11, v12);
      }
    }

    uint64_t v6 = _malloc_default_reader_4;
  }

  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  _platform_memset();
  uint64_t v13 = v6(task, (uint64_t)a2, 29264LL, &v33);
  if (!(_DWORD)v13)
  {
    unint64_t v15 = atomic_load(v33 + 3591);
    uint64_t v16 = v33[3590];
    if (!v16) {
      return 0LL;
    }
    uint64_t v17 = ((unsigned __int16)(v33[3585] >> 6) | (unsigned __int16)((unsigned __int16)v33[3585] << 6)) & 0xFFF;
    while (1)
    {
      uint64_t v18 = v6(task, v16, 0x20000000LL, &v32);
      if ((_DWORD)v18)
      {
        uint64_t v14 = v18;
        v9("Failed to map nanov2 region at %p\n", (const void *)v16);
        return v14;
      }

      uint64_t v19 = v32 - v16;
      int v20 = (char *)(v16 == ((v15 - 1) & 0xFFFFFFFFE0000000LL) ? v15 : v16 + 0x20000000);
      unint64_t v21 = v33;
      uint64_t v22 = v33[3586];
LABEL_33:
      uint64_t v29 = *(unsigned __int16 *)(v19
                                + (v22 ^ v16 & 0xFFFFFFFFFC000000LL)
                                + 4LL
                                * (((unsigned __int16)(*((_DWORD *)v21 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v21 + 7170) << 6)) & 0xFFF));
      if (v16 + (v29 << 29) >= v15) {
        uint64_t v16 = 0LL;
      }
      else {
        v16 += v29 << 29;
      }
      if ((_DWORD)v29) {
        BOOL v30 = v16 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (v30) {
        return 0LL;
      }
    }

    unint64_t v23 = v16;
LABEL_20:
    unsigned __int16 v24 = 0;
    uint64_t v25 = 0LL;
    while (1)
    {
      if (v17 != v25)
      {
        uint64_t v26 = ptr_offset_to_size_class[((v24 | (unsigned __int16)(v25 >> 6)) & 0xFC0 ^ *((_DWORD *)v21 + 7170)) >> 6];
        unsigned int v27 = *(_DWORD *)((v22 ^ v23 & 0xFFFFFFFFFC000000LL) + v19 + 4 * v25) & 0x7FF;
        if (v27 > 0x7FC)
        {
          if (v27 - 2045 < 3) {
            goto LABEL_31;
          }
        }

        else
        {
          if (!v27 || v27 == 2042) {
            goto LABEL_31;
          }
          if (v27 == 2044)
          {
            unsigned int v28 = slots_by_size_class[v26];
            if (!v28) {
              goto LABEL_31;
            }
LABEL_30:
            *(_DWORD *)a5 += v28;
            *(void *)(a5 + 8) += (int)(v28 * (16 * v26 + 16));
            *(void *)(a5 + 24) += 0x4000LL;
            goto LABEL_31;
          }
        }

        unsigned int v28 = slots_by_size_class[v26]
            + (~(*(_DWORD *)((v22 ^ v23 & 0xFFFFFFFFFC000000LL) + v19 + 4 * v25) >> 11) | 0xFFFFFC00);
        if (v28) {
          goto LABEL_30;
        }
      }

uint64_t OUTLINED_FUNCTION_0_2()
{
  return kdebug_trace();
}

uint64_t get_zone_type( uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, _DWORD **), uint64_t a3, _DWORD *a4)
{
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  *a4 = 0;
  uint64_t result = a2(a1, a3, 200LL, (_DWORD **)&v9);
  if (!(_DWORD)result)
  {
    if (*(_DWORD *)(v9 + 104) >= 0xEu)
    {
      uint64_t result = a2(a1, *(void *)(v9 + 96) + 128LL, 4LL, &v8);
      if (!(_DWORD)result) {
        *a4 = *v8;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t malloc_get_wrapped_zone( uint64_t task, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  if (!a2)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
      }
    }

    uint64_t v6 = _malloc_default_reader_5;
  }

  *a4 = 0LL;
  uint64_t result = get_zone_type(task, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))v6, a3, &v13);
  if (!(_DWORD)result)
  {
    if ((v13 - 4) >= 0xFFFFFFFE)
    {
      uint64_t result = v6(task, a3 + 200, 8LL, &v12);
      if (!(_DWORD)result) {
        *a4 = *(void *)v12;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t get_wrapped_zone(uint64_t a1)
{
  task_name_t v2 = *MEMORY[0x1895FFD48];
  if (!*MEMORY[0x1895FFD48])
  {
    return 0LL;
  }

  is_self = mach_task_is_self(*MEMORY[0x1895FFD48]);
  if (!(_DWORD)is_self) {
    purgeable_ptr_in_use_enumerator_cold_1(is_self, v4, v5);
  }
  uint64_t v6 = mach_task_is_self(v2);
  if (!(_DWORD)v6) {
    purgeable_ptr_in_use_enumerator_cold_1(v6, v7, v8);
  }
  if (*(_DWORD *)(a1 + 104) < 0xEu) {
    return 0LL;
  }
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v10 = mach_task_is_self(v2);
  if (!(_DWORD)v10) {
    purgeable_ptr_in_use_enumerator_cold_1(v10, v11, v12);
  }
  uint64_t v13 = mach_task_is_self(v2);
  if (!(_DWORD)v13) {
    purgeable_ptr_in_use_enumerator_cold_1(v13, v14, v15);
  }
  return *(void *)(a1 + 200);
}

uint64_t _malloc_default_reader_5(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t _nano_common_init_pick_mode(int a1, int a2, unsigned __int8 *a3, int a4)
{
  if (!_platform_strncmp())
  {
    if (a4) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
  }

  else
  {
LABEL_5:
    uint64_t v5 = (_BYTE *)_simple_getenv();
    if (v5) {
      uint64_t v6 = 2 * (*v5 == 49);
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  uint64_t v7 = (unsigned __int8 *)_simple_getenv();
  if (v7)
  {
    unsigned int v8 = *v7;
    if (v8 > 0x55)
    {
      if (v8 == 86 || v8 == 118)
      {
        else {
          return 2LL;
        }
      }
    }

    else
    {
      if (v8 == 48) {
        return 0LL;
      }
      if (v8 == 49) {
        return 2LL;
      }
    }
  }

  return v6;
}

void nano_common_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  _malloc_engaged_nano = _nano_common_init_pick_mode(a1, a2, a3, malloc_space_efficient_enabled);
  if (_malloc_engaged_nano)
  {
    uint64_t v6 = malloc_common_value_for_key_copy(a3, "malloc_nano_max_magazines", v9, 0x100uLL);
    if (v6)
    {
      uint64_t v7 = malloc_common_convert_to_long(v6, &v8);
      if (*v8 || v7 < 0) {
        malloc_report(3u, (uint64_t)"malloc_nano_max_magazines must be positive - ignored.\n");
      }
      else {
        nano_common_max_magazines = v7;
      }
    }

    if (_malloc_engaged_nano == 2) {
      nanov2_init(a1, a2, a3);
    }
  }

uint64_t nano_common_configure()
{
  if (nano_common_max_magazines) {
    uint64_t v0 = nano_common_max_magazines;
  }
  else {
    uint64_t v0 = phys_ncpus;
  }
  int32x4_t v1 = getenv("MallocNanoMaxMagazines");
  if (v1 || (int32x4_t v1 = getenv("_MallocNanoMaxMagazines")) != 0LL)
  {
    uint64_t result = strtol(v1, 0LL, 0);
    char v3 = 0;
    if ((result & 0x80000000) == 0) {
      goto LABEL_10;
    }
    malloc_report(3u, (uint64_t)"MallocNanoMaxMagazines must be positive - ignored.\n");
    char v3 = 0;
  }

  else
  {
    char v3 = 1;
  }

  uint64_t result = v0;
LABEL_10:
  uint64_t v4 = phys_ncpus;
  if ((_DWORD)result)
  {
    malloc_report(3u, (uint64_t)"Nano maximum magazines limited to number of physical CPUs [%d]\n");
  }

  uint64_t result = v4;
LABEL_14:
  nano_common_max_magazines = result;
  if ((v3 & 1) == 0)
  {
    malloc_report(6u, (uint64_t)"Nano maximum magazines set to %d\n");
    uint64_t result = nano_common_max_magazines;
  }

  if (_os_cpu_number_override != -1 || (_DWORD)result != phys_ncpus) {
    nano_common_max_magazines_is_ncpu = 0;
  }
  if (_malloc_engaged_nano == 2) {
    return nanov2_configure();
  }
  return result;
}

void nano_common_cpu_number_override_set()
{
  if (_os_cpu_number_override != -1 || nano_common_max_magazines != phys_ncpus) {
    nano_common_max_magazines_is_ncpu = 0;
  }
}

mach_vm_address_t nano_common_allocate_based_pages( mach_vm_size_t a1, char a2, __int16 a3, int a4, uint64_t a5)
{
  kern_return_t v13;
  kern_return_t v14;
  mach_vm_address_t address;
  mach_vm_address_t result = 0LL;
  mach_vm_address_t v8 = *MEMORY[0x189600148];
  uint64_t v9 = *MEMORY[0x189600148] - 1LL;
  uint64_t v10 = -*MEMORY[0x189600148];
  if (((v9 + a1) & v10) != 0) {
    mach_vm_size_t v11 = (v9 + a1) & v10;
  }
  else {
    mach_vm_size_t v11 = *MEMORY[0x189600148];
  }
  if (v11 >= a1)
  {
    mach_vm_address_t v12 = (v9 + a5) & v10;
    if (v12) {
      mach_vm_address_t v8 = v12;
    }
    mach_vm_address_t address = v8;
    uint64_t v13 = mach_vm_map(*MEMORY[0x1895FFD48], &address, v11, ~(-1LL << a2), (a4 << 24) | 1, 0, 0LL, 0, 3, 7, 1u);
    if (v13)
    {
      uint64_t v14 = v13;
      mach_vm_address_t result = 0LL;
      if (v14 != 3)
      {
        malloc_zone_error(a3, 0, (uint64_t)"*** can't allocate pages: mach_vm_map(size=%lu) failed (error code=%d)\n");
        return 0LL;
      }
    }

    else
    {
      return address;
    }
  }

  return result;
}

BOOL nano_common_allocate_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 3) != 0;
}

uint64_t _nano_common_map_vm_space(mach_vm_address_t a1, mach_vm_size_t size, vm_prot_t cur_protection)
{
  kern_return_t v6;
  uint64_t result;
  mach_vm_address_t address;
  mach_vm_address_t address = a1;
  uint64_t v5 = (vm_map_t *)MEMORY[0x1895FFD48];
  uint64_t v6 = mach_vm_map(*MEMORY[0x1895FFD48], &address, size, 0LL, 184549376, 0, 0LL, 0, cur_protection, 7, 1u);
  mach_vm_address_t result = 0LL;
  if (!v6)
  {
    if (address == a1)
    {
      return 1LL;
    }

    else
    {
      mach_vm_deallocate(*v5, address, size);
      return 0LL;
    }
  }

  return result;
}

BOOL nano_common_reserve_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 0) != 0;
}

BOOL nano_common_unprotect_vm_space(mach_vm_address_t address, mach_vm_size_t size)
{
  kern_return_t v2;
  task_name_t v2 = mach_vm_protect(*MEMORY[0x1895FFD48], address, size, 0, 3);
  if (v2) {
    malloc_report(3u, (uint64_t)"mach_vm_protect ret: %d\n");
  }
  return v2 == 0;
}

void nano_common_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1895FFD48], address, size)) {
    malloc_zone_error(a3, 0, (uint64_t)"Can't deallocate_pages at %p\n");
  }
}

uint64_t nano_common_default_reader(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a4 = a2;
  return 0LL;
}

uint64_t _xzm_type_choose_ptr_bucket(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))((char *)sub_1803DE3AC + 4 * byte_1803F0FF0[a2 - 1]))();
}

uint64_t sub_1803DE3AC(_DWORD *a1, uint64_t a2, int a3)
{
  return (a1[1] + *a1 * a3) >> 31;
}

void xzm_malloc_inline(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0LL, a3, a4);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v4 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v4 = a1;
  }
  unint64_t v5 = __clz(a2 - 1);
  unint64_t v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a2 <= 0x80) {
    unint64_t v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  }
  if (!a2) {
    LOBYTE(v6) = 0;
  }
  uint64_t v7 = v6;
  char v8 = *(_BYTE *)(*(void *)(v4 + 368) + v6);
  if (HIWORD(a3) == 256)
  {
    char v9 = 0;
  }

  else
  {
    if ((a3 & 0xC0000000000LL) != 0x40000000000LL)
    {
      ((void (*)(void))((char *)&loc_1803DE4DC + 4
                                               * byte_1803F0FF4[*(unsigned __int8 *)(*(void *)(v4 + 360) + v7) - 3]))();
      return;
    }

    char v9 = 1;
  }

  _xzm_xzone_malloc(a1, a2, (v9 + v8), a4);
}

unint64_t _xzm_malloc_large_huge( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  unint64_t v6 = a2 + 0x3FFF;
  BOOL v8 = a3 > 0x100000 || ((a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) > 0x200000;
  if (v8) {
    unsigned __int8 v9 = 7;
  }
  else {
    unsigned __int8 v9 = 6;
  }
  if (v6 >> 46) {
    goto LABEL_13;
  }
  BOOL v12 = HIWORD(a4) == 256 || v8;
  if (v12 || *(_BYTE *)(v5 + 344) == 2) {
    unint64_t v13 = ((unint64_t)*(unsigned __int8 *)(v5 + 328) >> 3) & 1;
  }
  else {
    LODWORD(v13) = 3;
  }
  mach_vm_address_t v14 = xzm_segment_group_alloc_chunk( *(void *)(v5 + 392) + 496LL * v13,  v9,  0LL,  v6 >> 14,  0LL,  a3,  a5 & 1,  (*(void *)(a1 + 296) >> 7) & 1);
  if (!v14) {
    goto LABEL_13;
  }
  mach_vm_address_t v15 = v14;
  *(_WORD *)(v14 + 34) = *(_WORD *)(a1 + 208);
  os_unfair_lock_lock_with_options();
  uint64_t v16 = a1 + 288;
  uint64_t v17 = *(void *)(a1 + 288);
  *(void *)(v15 + 16) = v17;
  if (v17) {
    *(void *)(*(void *)v16 + 24LL) = v15 + 16;
  }
  *(void *)uint64_t v16 = v15;
  *(void *)(v15 + 24) = v16;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  unint64_t result = ((0xAAAAAAAAAAAAC000LL * (((v15 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
         + *(void *)((v15 & 0xFFFFFFFFFFFFC000LL) + 0x30);
  if (!result)
  {
LABEL_13:
    unint64_t result = 0LL;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }

  return result;
}

void _xzm_xzone_malloc(uint64_t a1, unint64_t a2, unsigned int a3, char a4)
{
  uint64_t v4 = *(void *)(a1 + 216);
  if ((a4 & 2) == 0 && !*(void *)(a1 + 232))
  {
    unint64_t v6 = (unsigned __int16 *)(v4 + 88LL * a3 + 32);
    unsigned __int16 v7 = *v6;
    while (v7)
    {
      while (1)
      {
        int v8 = __ldxr(v6);
        if (v8 != v7) {
          break;
        }
        if (!__stxr(v7 - 1, v6))
        {
          int v9 = 1;
          goto LABEL_12;
        }
      }

      int v9 = 0;
      __clrex();
LABEL_12:
      unsigned __int16 v7 = v8;
      if (v9)
      {
        mfm_alloc(*(void *)(v4 + 88LL * a3 + 48));
        return;
      }
    }
  }

  uint64_t v5 = v4 + 88LL * a3;
  if (a2 > 0x1000) {
    _xzm_xzone_malloc_small(a1, v5, a4);
  }
  else {
    _xzm_xzone_malloc_tiny(a1, v5, a4);
  }
}

void xzm_malloc(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0LL, a3, a4);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v4 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v4 = a1;
  }
  unint64_t v5 = __clz(a2 - 1);
  unint64_t v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a2 <= 0x80) {
    unint64_t v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  }
  if (!a2) {
    LOBYTE(v6) = 0;
  }
  uint64_t v7 = v6;
  char v8 = *(_BYTE *)(*(void *)(v4 + 368) + v6);
  if (HIWORD(a3) == 256)
  {
    char v9 = 0;
  }

  else
  {
    if ((a3 & 0xC0000000000LL) != 0x40000000000LL)
    {
      ((void (*)(void))((char *)&loc_1803DE7F8 + 4
                                               * byte_1803F0FF8[*(unsigned __int8 *)(*(void *)(v4 + 360) + v7) - 3]))();
      return;
    }

    char v9 = 1;
  }

  _xzm_xzone_malloc(a1, a2, (v9 + v8), a4);
}

void _xzm_memalign(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, char a5)
{
  unint64_t v5 = a2;
  char v6 = a5 | 2;
  if (a2 > 0x4000 || a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, a2, a4, v6);
  }

  else
  {
    if (a3 > a2)
    {
      a2 *= 2LL;
      if (2 * v5 < a3)
      {
        a2 = 4 * v5;
        if (4 * v5 <= a3) {
          a2 = a3;
        }
      }
    }

    xzm_malloc(a1, a2, a4, v6);
  }

void xzm_realloc(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6 = a1;
  if (!a2)
  {
    unint64_t v21 = a3;
LABEL_25:
    xzm_malloc(a1, v21, a4, 0);
    return;
  }

  if (!a3)
  {
    _xzm_free(a1, a2, 0);
    a1 = v6;
    unint64_t v21 = 0LL;
    goto LABEL_25;
  }

  unint64_t v8 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v8 = 0x4000LL;
  }
  if (v8 >> 14) {
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a1 + 232);
  if (!v9) {
    uint64_t v9 = a1;
  }
  uint64_t v10 = *(void *)(v9 + 408);
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = *(unsigned int *)(v10 + 4 * v8);
  if (!(_DWORD)v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11 << 14;
  unint64_t v13 = a2 - *(void *)(v12 + 48);
  unsigned int v14 = v13 >> 14;
  unint64_t v15 = v12 + 48LL * v14 + 2104;
  if ((*(_BYTE *)(v12 + 48LL * v14 + 2136) & 0xF) == 4)
  {
    unint64_t v27 = v15 - *(unsigned int *)(v12 + 48LL * v14 + 2140);
    unsigned int v28 = *(_BYTE *)(v27 + 32) & 0xF;
    if (v28 <= 8)
    {
      int v29 = 1 << v28;
      if ((v29 & 0x1E8) != 0)
      {
        goto LABEL_64;
      }

      if ((v29 & 6) != 0 && v15 == v27) {
LABEL_64:
      }
        unint64_t v15 = v27;
    }
  }

LABEL_43:
  if (a3 > 0x8000 && v17 > 0x8000)
  {
    if (a3 <= 0x200000 || v17 <= 0x200000)
    {
      if (a3 <= 0x200000
        && v17 < 0x200001
        && (*(_BYTE *)(v6 + 296) & 0x80) == 0
        && (xzm_segment_group_try_realloc_large_chunk(*v22, (uint64_t)v22, v15, (a3 + 0x3FFF) >> 14) & 1) != 0)
      {
        return;
      }
    }

    else if ((*(_BYTE *)(v6 + 296) & 0x80) == 0 {
           && (xzm_segment_group_try_realloc_huge_chunk( (uint64_t)*v22,  v6,  (unint64_t)v22,  v15,  (a3 + 0x3FFF) >> 14) & 1) != 0)
    }
    {
      return;
    }
  }

void _xzm_free(uint64_t a1, unint64_t a2, char a3)
{
  if (!a2) {
    return;
  }
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000LL;
  }
  if (v5 >> 14) {
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!(_DWORD)v8) {
    goto LABEL_13;
  }
  uint64_t v9 = v8 << 14;
  unint64_t v10 = a2 - *(void *)(v9 + 48);
  unsigned int v11 = v10 >> 14;
  uint64_t v12 = (int8x8_t *)(v9 + 48LL * v11 + 2104);
  if ((*(_BYTE *)(v9 + 48LL * v11 + 2136) & 0xF) != 4) {
    goto LABEL_11;
  }
  unint64_t v52 = (int8x8_t *)((char *)v12 - *(unsigned int *)(v9 + 48LL * v11 + 2140));
  unsigned int v53 = v52[4].i8[0] & 0xF;
  if (v53 > 8) {
    goto LABEL_11;
  }
  int v54 = 1 << v53;
  if ((v54 & 0x1E8) != 0)
  {
    if (&v52[6 * v52[5].u32[0]] <= v12) {
      goto LABEL_11;
    }
    goto LABEL_88;
  }

  if ((v54 & 6) != 0 && v12 == v52) {
LABEL_88:
  }
    uint64_t v12 = v52;
LABEL_11:
  __int8 v13 = v12[4].i8[0];
  unsigned int v14 = v13 & 0xF;
  if (v14 > 7) {
    xzm_segment_group_free_chunk_cold_3(v14);
  }
  unint64_t v15 = (0xAAAAAAAAAAAAC000LL * (((unint64_t)((unsigned __int16)v12 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL;
  unint64_t v16 = a2 - *(void *)(((unint64_t)v12 & 0xFFFFFFFFFFFFC000LL) + 0x30) - v15;
  if (v14 == 5 || v14 == 2)
  {
    uint64_t v18 = *(void *)(a1 + 216) + 88LL * v12[4].u8[1];
    unint64_t v19 = *(void *)(v18 + 48);
  }

  else
  {
    unint64_t v19 = (unint64_t)v12[5].u32[0] << 14;
    if (v16 % v19) {
      goto LABEL_13;
    }
    uint64_t v18 = 0LL;
  }

  if (v14 == 5)
  {
  }

  else if (v14 == 2 && *(void *)a2 == (*(void *)(a1 + 272) ^ a2))
  {
    char v20 = a3;
    uint64_t v21 = v18;
    char is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, (uint64_t)v12, a2);
    a3 = v20;
    if ((is_free_slow & 1) == 0)
    {
      uint64_t v18 = v21;
      __int8 v13 = v12[4].i8[0];
      goto LABEL_30;
    }

LABEL_30:
  int v23 = v13 & 0xF;
  if (v23 == 5)
  {
    _xzm_xzone_free_block_to_small_chunk(a1, v18, v12, a2);
    return;
  }

  if (v23 != 2)
  {
    _xzm_free_large_huge(a1, (unint64_t)v12);
    return;
  }

  size_t v24 = *(void *)(v18 + 48);
  if (v24 <= 0x400)
  {
    uint64_t v25 = v18;
    bzero((void *)a2, v24);
    uint64_t v18 = v25;
  }

  unint64_t v26 = 0LL;
  char v27 = 0;
  uint64_t v28 = 0LL;
  int v29 = *(_DWORD *)(v18 + 68);
  BOOL v30 = (char *)(a2 - *(void *)(((unint64_t)v12 & 0xFFFFFFFFFFFFC000LL) + 0x30) - v15);
  *(void *)a2 = *(void *)(a1 + 272) ^ a2;
  int8x8_t v31 = *v12;
  unint64_t v32 = ((unint64_t)&v30[(uint64_t)v30 < 0 ? 0xFuLL : 0] >> 4) & 0x7FF;
  char v33 = 1;
  unint64_t v56 = v32;
  do
  {
    if ((v31.i32[0] & 0x40000000) != 0)
    {
      do
      {
        _xzm_walk_lock_wait((os_unfair_lock_s *)a1);
        int8x8_t v31 = *v12;
      }

      while ((*(void *)v12 & 0x40000000) != 0);
    }

    uint64_t v34 = *(void *)&v31 + 0x8000000000000LL;
    unsigned int v35 = ((unsigned __int32)v31.i32[0] >> 11) & 0x7FF;
    if (v35 + 1 == v29)
    {
      if ((v27 & 1) != 0
        || ((unsigned int v36 = ((unsigned __int32)v31.i32[0] >> 22) & 0x3F, (*(void *)v18 & 0x7FFFFFFFFFFFLL) == 0)
          ? (BOOL v37 = v36 == 0)
          : (BOOL v37 = 1),
            v37))
      {
        if ((v33 & 1) != 0) {
          goto LABEL_44;
        }
        char v33 = 0;
        char v27 = 1;
      }

      else
      {
        uint64_t v42 = v18;
        uint64_t v43 = mach_absolute_time();
        uint64_t v18 = v42;
        uint64_t v28 = v43;
        unint64_t v26 = *(void *)(a1 + 224)
            + 32
        if (((v43 - *(void *)(v26 + 24) >= *(void *)(a1 + 264)) & v33) != 0)
        {
          unint64_t v32 = v56;
LABEL_44:
          BOOL v38 = 0;
          unint64_t v39 = v34 & 0xFFFFFFFFF0000000LL | 0x7FF;
          char v27 = 1;
          char v33 = 1;
          goto LABEL_48;
        }

        char v33 = 0;
        char v27 = 1;
        unint64_t v32 = v56;
      }
    }

    *(void *)(a2 + 8) = v31.i16[0] & 0x7FF | (((*(void *)&v31 >> 38) & 0x1FFFLL) << 11);
    unint64_t v39 = (v31.i32[0] + 2048) & 0x3FF800 | v32 | (*(void *)&v31 >> 51 << 38) | v34 & 0xFFF8003FFFC00000LL;
    BOOL v38 = (v31.i32[0] & 0xFC00000) == 0LL && v35 == 0;
    if (v38) {
      v39 |= 0x10000000uLL;
    }
LABEL_48:
    while (1)
    {
      unint64_t v40 = __ldxr((unint64_t *)v12);
      if (v40 != *(void *)&v31) {
        break;
      }
      if (!__stlxr(v39, (unint64_t *)v12))
      {
        int v41 = 1;
        goto LABEL_52;
      }
    }

    int v41 = 0;
    __clrex();
LABEL_52:
    int8x8_t v31 = (int8x8_t)v40;
  }

  while (!v41);
  if (v28) {
    *(void *)(v26 + 24) = v28;
  }
  if ((~(_WORD)v39 & 0x7FF) != 0)
  {
    if (v38)
    {
      unint64_t v51 = (os_unfair_lock_s *)a1;
      BOOL v50 = (unint64_t *)v18;
      goto LABEL_77;
    }
  }

  else
  {
    uint64_t v44 = v18;
    xzm_segment_group_segment_madvise_chunk(*(void *)(v18 + 40), (uint64_t)v12);
    unint64_t v45 = (unint64_t)*v12;
LABEL_65:
    unint64_t v46 = v45;
    unint64_t v47 = v45 & 0xFFFFFFFFFFFFF800LL;
    if ((v46 & 0x10000000) != 0) {
      uint64_t v48 = 2046LL;
    }
    else {
      uint64_t v48 = 536872958LL;
    }
    unint64_t v49 = v48 | v47;
    do
    {
      unint64_t v45 = __ldxr((unint64_t *)v12);
      if (v45 != v46)
      {
        __clrex();
        goto LABEL_65;
      }
    }

    while (__stlxr(v49, (unint64_t *)v12));
    if ((v46 & 0x10000000) == 0)
    {
      BOOL v50 = (unint64_t *)(v44 + 8);
      unint64_t v51 = (os_unfair_lock_s *)a1;
LABEL_77:
      _xzm_chunk_list_push(v51, v50, (uint64_t)v12, 0);
    }
  }

unint64_t xzm_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x8000)
  {
    if ((a2 & 0xFFFFFFFFFFFFC000LL) + 0x4000 <= a2 || (a2 & 0x3FFF) == 0) {
      return a2;
    }
    else {
      return (a2 & 0xFFFFFFFFFFFFC000LL) + 0x4000;
    }
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 232);
    if (!v2) {
      uint64_t v2 = a1;
    }
    unint64_t v3 = __clz(a2 - 1);
    unint64_t v4 = (((a2 - 1) >> (61 - v3)) & 3) - 4 * v3 + 488;
    if (a2 <= 0x80) {
      unint64_t v4 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v4) = 0;
    }
    return *(void *)(*(void *)(v2 + 352) + 8LL * v4);
  }

uint64_t xzm_check()
{
  return 1LL;
}

void xzm_force_lock(uint64_t a1)
{
}

void _xzm_foreach_lock(uint64_t a1, int a2)
{
  if (!a2)
  {
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    _xzm_allocation_slots_do_lock_action(a1, 0);
  }

  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    unint64_t v4 = 1LL;
    do
    {
      uint64_t v5 = *(void *)(a1 + 216) + 88 * v4;
      if (*(void *)(v5 + 48) > 0x1000uLL)
      {
        if (a2)
        {
          for (unint64_t i = *(void *)v5; i; unint64_t i = *(void *)(i + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(i + 8), a2);
          for (uint64_t j = *(void *)(v5 + 8); j; uint64_t j = *(void *)(j + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(j + 8), a2);
          _xzm_do_lock_action((os_unfair_lock_s *)(v5 + 24), a2);
        }

        else
        {
          while (1)
          {
            os_unfair_lock_lock_with_options();
            for (unint64_t k = *(void *)v5; k; unint64_t k = *(void *)(k + 16))
              os_unfair_lock_lock_with_options();
            uint64_t v22 = *(void *)(v5 + 8);
            if (!v22) {
              break;
            }
            while (os_unfair_lock_trylock((os_unfair_lock_t)(v22 + 8)))
            {
              uint64_t v22 = *(void *)(v22 + 16);
              if (!v22) {
                goto LABEL_34;
              }
            }

            for (unint64_t m = *(void *)v5; m; unint64_t m = *(void *)(m + 16))
              os_unfair_lock_unlock((os_unfair_lock_t)(m + 8));
            for (uint64_t n = *(void *)(v5 + 8); n && n != v22; uint64_t n = *(void *)(n + 16))
              os_unfair_lock_unlock((os_unfair_lock_t)(n + 8));
            os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
            MEMORY[0x186DFB0AC](0LL, 1LL, 1LL);
          }
        }
      }

      else
      {
        uint64_t v6 = (unint64_t *)(v5 + 8);
        uint64_t v7 = (unint64_t *)(v5 + 16);
        if (a2)
        {
          do
            unint64_t v8 = __ldxr((unint64_t *)v5);
          while (__stxr(v8 & 0x7FFFFFFFFFFFFFFFLL, (unint64_t *)v5));
          do
            unint64_t v9 = __ldxr(v6);
          while (__stxr(v9 & 0x7FFFFFFFFFFFFFFFLL, v6));
          do
            unint64_t v10 = __ldxr(v7);
          while (__stxr(v10 & 0x7FFFFFFFFFFFFFFFLL, v7));
        }

        else
        {
          do
            unint64_t v11 = __ldxr((unint64_t *)v5);
          while (__stxr(v11 | 0x8000000000000000LL, (unint64_t *)v5));
          do
            unint64_t v12 = __ldxr(v6);
          while (__stxr(v12 | 0x8000000000000000LL, v6));
          do
            unint64_t v13 = __ldxr(v7);
          while (__stxr(v13 | 0x8000000000000000LL, v7));
        }

        for (iunint64_t i = (unint64_t *)(*v7 & 0x7FFFFFFFFFFFLL); ii; iunint64_t i = (unint64_t *)ii[3])
        {
          unint64_t v15 = *ii;
          if (a2)
          {
            if ((~(_WORD)v15 & 0x7FE) != 0)
            {
              do
              {
                unint64_t v16 = __ldxr(ii);
                if (v16 != v15)
                {
                  __clrex();
                  _xzm_foreach_lock_cold_1();
                }
              }

              while (__stxr(v15 & 0xFFFFFFFFBFFFFFFFLL, ii));
            }
          }

          else
          {
            do
            {
              if ((~(_WORD)v15 & 0x7FE) == 0) {
                break;
              }
              while (1)
              {
                unint64_t v17 = __ldxr(ii);
                if (v17 != v15) {
                  break;
                }
                if (!__stxr(v15 | 0x40000000, ii))
                {
                  char v18 = 1;
                  goto LABEL_25;
                }
              }

              char v18 = 0;
              __clrex();
LABEL_25:
              unint64_t v15 = v17;
            }

            while ((v18 & 1) == 0);
          }
        }
      }

void xzm_force_unlock(uint64_t a1)
{
}

void xzm_reinit_lock(uint64_t a1)
{
}

void xzm_locked()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: xzm_locked not implemented";
  __break(1u);
}

void xzm_force_lock_global_state(uint64_t a1)
{
}

void _xzm_global_state_lock(uint64_t a1, int a2)
{
  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    unint64_t v4 = 1LL;
    uint64_t v5 = 24LL;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 376) + v5), a2);
      ++v4;
      v5 += 16LL;
    }

    while (v4 < *(unsigned __int8 *)(a1 + 210));
  }

  if (*(_BYTE *)(a1 + 344))
  {
    unint64_t v6 = 0LL;
    uint64_t v7 = 8LL;
    do
    {
      unint64_t v8 = (os_unfair_lock_s *)(*(void *)(a1 + 392) + v7);
      _xzm_do_lock_action(v8, a2);
      _xzm_do_lock_action(v8 - 1, a2);
      ++v6;
      v7 += 496LL;
    }

    while (v6 < *(unsigned __int8 *)(a1 + 344));
  }

  if (*(_BYTE *)(a1 + 329))
  {
    unint64_t v9 = 0LL;
    uint64_t v10 = 16LL;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 384) + v10), a2);
      ++v9;
      v10 += 56LL;
    }

    while (v9 < *(unsigned __int8 *)(a1 + 329));
  }

  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 432), a2);
  if (*(_BYTE *)(a1 + 330))
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 400) + v11), a2);
      ++v12;
      v11 += 64LL;
    }

    while (v12 < *(unsigned __int8 *)(a1 + 330));
  }

  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 448), a2);
}

void xzm_force_unlock_global_state(uint64_t a1)
{
}

void xzm_force_reinit_lock_global_state(uint64_t a1)
{
}

uint64_t xzm_ptr_lookup_4test(uint64_t a1, unint64_t a2, _BYTE *a3, _BYTE *a4, _BYTE *a5)
{
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000LL;
  }
  if (v5 >> 14) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!(_DWORD)v8) {
    return 0LL;
  }
  uint64_t v10 = v8 << 14;
  unint64_t v11 = a2 - *(void *)(v10 + 48);
  unsigned int v12 = v11 >> 14;
  unint64_t v13 = v10 + 48LL * v12 + 2104;
  if ((*(_BYTE *)(v10 + 48LL * v12 + 2136) & 0xF) == 4)
  {
    unint64_t v22 = v13 - *(unsigned int *)(v10 + 48LL * v12 + 2140);
    unsigned int v23 = *(_BYTE *)(v22 + 32) & 0xF;
    if (v23 <= 8)
    {
      int v24 = 1 << v23;
      if ((v24 & 0x1E8) != 0)
      {
        goto LABEL_48;
      }

      if ((v24 & 6) != 0 && v13 == v22) {
LABEL_48:
      }
        unint64_t v13 = v22;
    }
  }

LABEL_10:
  unsigned int v14 = *(_BYTE *)(v13 + 32) & 0xF;
  if (v14 > 7) {
    xzm_segment_group_free_chunk_cold_3(*(_BYTE *)(v13 + 32) & 0xF);
  }
  unint64_t v16 = (_BYTE **)(v13 & 0xFFFFFFFFFFFFC000LL);
  unint64_t v17 = a2
      - *(void *)((v13 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v14 == 5 || v14 == 2)
  {
    uint64_t v19 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v13 + 33);
    unint64_t v20 = *(void *)(v19 + 48);
  }

  else
  {
    unint64_t v20 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    uint64_t v19 = v17 % v20;
    if (v17 % v20) {
      return 0LL;
    }
  }

  if (v14 == 5)
  {
    if (((*(_DWORD *)v13 >> (v17 / v20)) & 1) != 0) {
      return 0LL;
    }
  }

  else
  {
    if (v14 != 2) {
      goto LABEL_26;
    }
    if (*(void *)a2 == (*(void *)(a1 + 272) ^ a2))
    {
      unint64_t v30 = v13 & 0xFFFFFFFFFFFFC000LL;
      uint64_t v31 = v19;
      uint64_t v28 = a4;
      int v29 = a3;
      unint64_t v26 = v13;
      char v27 = a5;
      if ((_xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2) & 1) == 0)
      {
        a5 = v27;
        unsigned int v14 = *(_BYTE *)(v26 + 32) & 0xF;
        a4 = v28;
        a3 = v29;
        unint64_t v16 = (_BYTE **)v30;
        uint64_t v19 = v31;
LABEL_26:
        *a3 = v14;
        *a4 = **v16;
        if (v14 != 5 && v14 != 2) {
          return 1LL;
        }
        goto LABEL_35;
      }

      return 0LL;
    }
  }

  *a3 = v14;
  *a4 = **v16;
LABEL_35:
  if (!v19) {
    xzm_ptr_lookup_4test_cold_2();
  }
  *a5 = *(_BYTE *)(v19 + 76);
  return 1LL;
}

  unint64_t v11 = *(_BYTE *)(v10 + 32) & 0xF;
  if (v11 > 7) {
    xzm_segment_group_free_chunk_cold_3(*(_BYTE *)(v10 + 32) & 0xF);
  }
  unint64_t v13 = v2
      - *(void *)((v10 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v10 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v11 == 5 || v11 == 2)
  {
    unint64_t v15 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v10 + 33);
    unint64_t v16 = *(void *)(v15 + 48);
  }

  else
  {
    unint64_t v16 = (unint64_t)*(unsigned int *)(v10 + 40) << 14;
    if (v13 % v16) {
      return _xzm_ptr_size_outlined(a1, v2);
    }
  }

  if (v11 == 5)
  {
    if (((*(_DWORD *)v10 >> (v13 / v16)) & 1) == 0) {
      return v16;
    }
    return _xzm_ptr_size_outlined(a1, v2);
  }

  if (v11 == 2 && *(void *)v2 == (*(void *)(a1 + 272) ^ v2))
  {
    uint64_t v25 = a1;
    unsigned int v23 = v16;
    int v24 = v2;
    char is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v10, v2);
    unint64_t v16 = v23;
    uint64_t v2 = v24;
    char v18 = is_free_slow;
    a1 = v25;
    if (v18) {
      return _xzm_ptr_size_outlined(a1, v2);
    }
  }

  return v16;
}

  os_unfair_lock_unlock(v9);
  return a4;
}

uint64_t xzm_type_choose_ptr_bucket_4test(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))((char *)sub_1803DF8E8 + 4 * byte_1803F0FFC[a2 - 1]))();
}

uint64_t sub_1803DF8E8(_DWORD *a1, uint64_t a2, int a3)
{
  return (a1[1] + *a1 * a3) >> 31;
}

uint64_t xzm_main_malloc_zone_create(unsigned int a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  kern_return_t v49;
  const char *v50;
  int v51;
  const char *v52;
  unint64_t v53;
  const char *v54;
  char v55;
  char v56;
  char v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  mach_vm_address_t plat;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  _DWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  _DWORD *v91;
  uint64_t v92;
  char v94;
  BOOL v95;
  char v96;
  char v97;
  char v98;
  char v99;
  uint64_t denom;
  uint64_t v101;
  unint64_t numer;
  unsigned int v103;
  uint64_t v104;
  char v105;
  BOOL v106;
  uint64_t v107;
  unsigned int v108;
  char v109;
  int v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  mach_timebase_info info;
  __int128 __buf;
  __int128 v116;
  char __dst[256];
  uint64_t v118;
  v118 = *MEMORY[0x1895FEE08];
  uint64_t v6 = (const char *)_simple_getenv();
  if (v6)
  {
    uint64_t v7 = v6;
    size_t v8 = strlen(v6);
    if (v8 <= 0x1F) {
      xzm_main_malloc_zone_create_cold_6(v8);
    }
    uint64_t v9 = 0LL;
    char v10 = 1;
    do
    {
      char v11 = v10;
      memcpy(__dst, &v7[16 * v9], 0x10uLL);
      __dst[16] = 0;
      unint64_t v12 = strtoull(__dst, 0LL, 16);
      unint64_t v13 = v12;
      if (v12 == -1LL)
      {
        if (*__error() == 34) {
          goto LABEL_171;
        }
      }

      else if (!v12 && *__error() == 22)
      {
LABEL_171:
        xzm_main_malloc_zone_create_cold_7();
      }

      char v10 = 0;
      *((void *)&__buf + v9) = v13;
      uint64_t v9 = 1LL;
    }

    while ((v11 & 1) != 0);
  }

  else
  {
    arc4random_buf(&__buf, 0x10uLL);
  }

  unsigned int v14 = malloc_common_value_for_key_copy(a4, "xzone_ptr_buckets", __dst, 0x100uLL);
  if (v14)
  {
    uint64_t v15 = malloc_common_convert_to_long(v14, &info);
    uint64_t v16 = v15;
    if (*(_BYTE *)info.numer) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v15 < 1;
    }
    if (!v17 && v15 < 5) {
      goto LABEL_22;
    }
    malloc_report(3u, (uint64_t)"Invalid xzone_ptr_buckets value %ld - ignored.\n");
  }

  uint64_t v16 = 0LL;
LABEL_22:
  uint64_t v19 = (const char *)_simple_getenv();
  if (!v19) {
    goto LABEL_27;
  }
  uint64_t v20 = strtol(v19, 0LL, 10);
  if (v20 == 1)
  {
    char v21 = 0;
    uint64_t v16 = 1LL;
    goto LABEL_29;
  }

  if (v20 == 0xFFFF || v20 == 2)
  {
    uint64_t v16 = 1LL;
    char v21 = 1;
  }

  else
  {
LABEL_27:
    char v21 = 2;
  }

LABEL_82:
  v111 = v35;
  if (v26)
  {
    if (v26 == 2)
    {
      unsigned __int8 v45 = logical_ncpus;
    }

    else
    {
      if (v26 != 1) {
        xzm_main_malloc_zone_create_cold_1();
      }
      else {
        unsigned __int8 v45 = logical_ncpus;
      }
    }
  }

  else
  {
    unsigned __int8 v45 = 1;
  }

  v112 = 1000000LL;
  if (malloc_internal_security_policy)
  {
    unint64_t v46 = (const char *)_simple_getenv();
    if (v46)
    {
      unint64_t v47 = strtol(v46, 0LL, 10);
      uint64_t v48 = 1000000LL;
      if (v47 < 0xFFFFFFFF) {
        uint64_t v48 = 1000000 * v47;
      }
      v112 = v48;
    }
  }

  unint64_t v49 = mach_timebase_info(&info);
  if (v49) {
    xzm_main_malloc_zone_create_cold_4(v49);
  }
  denounint64_t m = info.denom;
  numer = info.numer;
  v103 = v34;
  v104 = v16;
  v51 = malloc_internal_security_policy && (BOOL v50 = (const char *)_simple_getenv()) != 0LL && strtol(v50, 0LL, 10) == 1;
  unint64_t v52 = malloc_common_value_for_key_copy(a4, "xzone_guard_pages", __dst, 0x100uLL);
  v105 = v26;
  if (v52)
  {
    unsigned int v53 = strtol(v52, 0LL, 10);
    if (v53 > 1)
    {
      malloc_report(3u, (uint64_t)"%s must be 0 or 1.\n");
      if ((v51 & 1) == 0)
      {
LABEL_110:
        v109 = 0;
        LOBYTE(v51) = 0;
        goto LABEL_111;
      }
    }

    else if (!v53)
    {
      goto LABEL_110;
    }
  }

  else if (!v51)
  {
    v109 = 0;
LABEL_111:
    int v55 = 0;
    unint64_t v56 = 0;
    BOOL v57 = 0;
    v95 = 0;
    goto LABEL_112;
  }

  if (!malloc_internal_security_policy)
  {
    v99 = 8;
    unint64_t v51 = 1;
LABEL_142:
    unint64_t v56 = 64;
LABEL_143:
    int v55 = 3;
LABEL_144:
    v97 = v55;
    v98 = v56;
    v95 = v51 != 0;
    v96 = 32;
    v109 = 1;
    goto LABEL_145;
  }

  int v54 = (const char *)_simple_getenv();
  if (v54) {
    unint64_t v51 = strtol(v54, 0LL, 10) != 0;
  }
  else {
    unint64_t v51 = 1;
  }
  if (!malloc_internal_security_policy)
  {
    v99 = 8;
    goto LABEL_142;
  }

  BOOL v61 = (const char *)_simple_getenv();
  BOOL v57 = 8;
  if (v61)
  {
    char v62 = strtol(v61, 0LL, 10);
    if (v62 <= 0) {
      BOOL v57 = 8;
    }
    else {
      BOOL v57 = v62;
    }
  }

  if (!malloc_internal_security_policy)
  {
    v99 = v57;
    goto LABEL_142;
  }

  unint64_t v63 = (const char *)_simple_getenv();
  unint64_t v56 = 64;
  if (v63)
  {
    unint64_t v64 = strtol(v63, 0LL, 10);
    if (v64 <= 0) {
      unint64_t v56 = 64;
    }
    else {
      unint64_t v56 = v64;
    }
  }

  if (!malloc_internal_security_policy)
  {
    v99 = v57;
    goto LABEL_143;
  }

  uint64_t v65 = (const char *)_simple_getenv();
  int v55 = 3;
  if (v65)
  {
    unsigned int v66 = strtol(v65, 0LL, 10);
    if (v66 <= 0) {
      int v55 = 3;
    }
    else {
      int v55 = v66;
    }
  }

  if (!malloc_internal_security_policy)
  {
    v99 = v57;
    goto LABEL_144;
  }

  uint64_t v67 = (const char *)_simple_getenv();
  v95 = v51 != 0;
  LOBYTE(v51) = 32;
  if (v67)
  {
    uint64_t v68 = strtol(v67, 0LL, 10);
    if (v68 <= 0) {
      LOBYTE(v51) = 32;
    }
    else {
      LOBYTE(v51) = v68;
    }
  }

  v109 = 1;
LABEL_112:
  v98 = v56;
  v99 = v57;
  v96 = v51;
  v97 = v55;
  if (malloc_internal_security_policy)
  {
    unint64_t v58 = (const char *)_simple_getenv();
    if (v58)
    {
      uint64_t v59 = strtol(v58, 0LL, 10);
      if (v59)
      {
        if (v59 == 1)
        {
          int v60 = 2LL;
          goto LABEL_146;
        }

        malloc_report(3u, (uint64_t)"MallocXzoneDataOnly must be 0 or 1.\n");
      }
    }
  }

LABEL_145:
  int v60 = 4LL;
LABEL_146:
  uint64_t v69 = 88 * v24 + 472;
  uint64_t v70 = v69 + 32 * v24 * v45;
  uint64_t v71 = v70 + 400 + 16 * v24;
  int v72 = v71 + 112 + 496LL * v60;
  uint64_t v73 = v72 + 65792;
  plat = mvm_allocate_plat(0LL, v72 + 65792, 0, 1, 0, 1);
  if (!plat) {
    xzm_main_malloc_zone_create_cold_2();
  }
  uint64_t v75 = plat;
  uint64_t v76 = v112 * denom;
  v113 = plat + 472;
  v101 = plat + v69;
  v116 = __buf;
  if (v106) {
    uint64_t v77 = 2;
  }
  else {
    uint64_t v77 = 0;
  }
  v107 = v76 / numer;
  char v78 = mfm_zone_address();
  *(_OWORD *)uint64_t v75 = 0u;
  *(_OWORD *)(v75 + 16) = 0u;
  *(_OWORD *)(v75 + 32) = 0u;
  *(_OWORD *)(v75 + 48) = 0u;
  *(_OWORD *)(v75 + 64) = 0u;
  *(_OWORD *)(v75 + 80) = 0u;
  *(_OWORD *)(v75 + 96) = 0u;
  *(_OWORD *)(v75 + 112) = 0u;
  *(_OWORD *)(v75 + 128) = 0u;
  *(_OWORD *)(v75 + 144) = 0u;
  *(_OWORD *)(v75 + 160) = 0u;
  *(_OWORD *)(v75 + 176) = 0u;
  *(_OWORD *)(v75 + 192) = 0u;
  *(_OWORD *)(v75 + 208) = 0u;
  *(_OWORD *)(v75 + 224) = 0u;
  *(_OWORD *)(v75 + 240) = 0u;
  *(_OWORD *)(v75 + 256) = 0u;
  *(_OWORD *)(v75 + 272) = 0u;
  *(_OWORD *)(v75 + 288) = 0u;
  *(void *)(v75 + 304) = v73;
  *(_OWORD *)(v75 + 312) = v116;
  *(_BYTE *)(v75 + 328) = v77;
  *(_WORD *)(v75 + 329) = 1026;
  *(_DWORD *)(v75 + 331) = 0;
  *(_BYTE *)(v75 + 335) = 0;
  *(void *)(v75 + 336) = v78;
  *(_BYTE *)(v75 + 344) = v60;
  *(_BYTE *)(v75 + 345) = 40;
  *(_DWORD *)(v75 + 346) = 0;
  *(_WORD *)(v75 + 350) = 0;
  *(void *)(v75 + 352) = v70 + v75;
  *(void *)(v75 + 360) = v70 + v75 + 320;
  *(void *)(v75 + 368) = v70 + v75 + 360;
  *(void *)(v75 + 376) = v70 + 400 + v75;
  *(void *)(v75 + 384) = v71 + v75;
  *(void *)(v75 + 392) = v71 + 112 + v75;
  *(void *)(v75 + 400) = v72 + v75;
  *(void *)(v75 + 408) = v72 + v75 + 256;
  *(void *)(v75 + 416) = 0LL;
  *(void *)(v75 + 424) = 0LL;
  *(_DWORD *)(v75 + 432) = 0;
  *(_WORD *)(v75 + 436) = 1;
  *(void *)(v75 + 444) = 0LL;
  *(void *)(v75 + 438) = 0LL;
  *(_BYTE *)(v75 + 452) = v109;
  *(_BYTE *)(v75 + 453) = v95;
  *(_BYTE *)(v75 + 454) = v99;
  *(_BYTE *)(v75 + 455) = v98;
  *(_BYTE *)(v75 + 456) = v97;
  *(_BYTE *)(v75 + 457) = v96;
  *(void *)(v75 + 464) = 0LL;
  *(void *)(v75 + 458) = 0LL;
  _xzm_initialize_const_zone_data(v75, v73, 1, v24, v45, v113, v101, 0LL, v105, v111, v103, v110, v107, v108);
  memcpy(*(void **)(v75 + 352), &_xzm_bin_sizes, 0x140uLL);
  uint64_t v79 = 0LL;
  unsigned int v80 = v104 + 2;
  if (!v104) {
    unsigned int v80 = 5;
  }
  do
    *(_BYTE *)(*(void *)(v75 + 360) + v79++) = v80;
  while (v79 != 40);
  uint64_t v81 = (_DWORD *)(*(void *)(v75 + 376) + 8LL);
  do
  {
    *uint64_t v81 = 0;
    v81 += 4;
    --v24;
  }

  while (v24);
  uint64_t v82 = *(void *)(v75 + 384);
  *(_BYTE *)uint64_t v82 = 0;
  *(void *)(v82 + 8) = v75;
  *(_DWORD *)(v82 + 16) = 0;
  *(_BYTE *)(v82 + 56) = 1;
  *(void *)(v82 + 64) = v75;
  *(_DWORD *)(v82 + 72) = 0;
  xzm_main_malloc_zone_init_range_groups(v75);
  v83 = 0LL;
  uint64_t v84 = 40LL;
  do
  {
    uint64_t v85 = *(void *)(v75 + 392);
    uint64_t v86 = v85 + 496 * v83;
    *(_BYTE *)uint64_t v86 = v83;
    *(_DWORD *)(v86 + 4) = 0;
    *(_DWORD *)(v86 + 8) = 0;
    if (v83 < 2u)
    {
      uint64_t v88 = v85 + 496 * v83;
      *(void *)(v88 + 16) = *(void *)(v75 + 384);
      *(void *)(v88 + 24) = v75;
      if (v83 == 1)
      {
        uint64_t v89 = (void *)(v85 + 496 * v83);
        v89[60] = 0x3FFFF00000000LL;
        v89[61] = 0LL;
        v89[58] = 0LL;
        v89[59] = v89 + 58;
        *((_DWORD *)v89 + 122) = 0;
      }
    }

    else
    {
      v87 = v85 + 496 * v83;
      *(void *)(v87 + 16) = *(void *)(v75 + 384) + 56LL;
      *(void *)(v87 + 24) = v75;
    }

    unint64_t v90 = 0LL;
    uint64_t v91 = (_DWORD *)(v85 + v84);
    do
    {
      *uint64_t v91 = _xzm_span_queue_slice_counts[v90];
      v91 += 4;
      ++v90;
    }

    while (v90 != 27);
    ++v83;
    v84 += 496LL;
  }

  while (v83 != v60);
  uint64_t v92 = *(void *)(v75 + 400) + 192LL;
  xzm_metapool_init(v92, 3, 0x4000, 16, 16, 0LL);
  xzm_metapool_init(*(void *)(v75 + 400), 0, 0x80000, 0x4000, 0x4000, v92);
  xzm_metapool_init(*(void *)(v75 + 400) + 64LL, 1, 0x40000, 0x10000, 0x10000, v92);
  xzm_metapool_init(*(void *)(v75 + 400) + 128LL, 2, 0x4000, 16, 16, 0LL);
  _xzm_initialize_xzone_data(v75, v94, (char *)(v75 + 452), *(unsigned __int8 *)(v75 + 344) == 2);
  if (malloc_internal_security_policy && _simple_getenv()) {
    malloc_report( 6u,  (uint64_t)"XZM Config:\n \tData Only: %d\n \tGuards Enabled: %d\n \tScribble: %d\n \tRanges (ptr addr/size/data addr/size): 0x%llx/%lu/0x%llx/%lu\n \tInitial Slot Config: %s\n \tMax Slot Config: %s\n \tSlot Upgrade Thresholds: %d/%d, %d/%d\n \tPointer Bucket Count: %lu\n");
  }
  return v75;
}

uint64_t _xzm_initialize_const_zone_data( uint64_t result, uint64_t a2, __int16 a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, int a10, unsigned int a11, int a12, uint64_t a13, uint64_t a14)
{
  *(void *)unint64_t result = 0LL;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = xzm_malloc_zone_size;
  *(void *)(result + 24) = xzm_malloc_zone_malloc;
  *(void *)(result + 32) = xzm_malloc_zone_calloc;
  *(void *)(result + 40) = xzm_malloc_zone_valloc;
  *(void *)(result + 48) = xzm_malloc_zone_free;
  *(void *)(result + 56) = xzm_malloc_zone_realloc;
  *(void *)(result + 64) = xzm_malloc_zone_destroy;
  *(void *)(result + 72) = 0LL;
  *(void *)(result + 80) = malloc_zone_batch_malloc_fallback;
  *(void *)(result + 88) = malloc_zone_batch_free_fallback;
  *(void *)(result + 96) = &xzm_malloc_zone_introspect;
  *(_DWORD *)(result + 104) = 16;
  *(void *)(result + 112) = xzm_malloc_zone_memalign;
  *(void *)(result + 120) = xzm_malloc_zone_free_definite_size;
  *(void *)(result + 128) = malloc_zone_pressure_relief_fallback;
  *(void *)(result + 136) = xzm_malloc_zone_claimed_address;
  *(void *)(result + 144) = xzm_malloc_zone_try_free_default;
  *(void *)(result + 152) = xzm_malloc_zone_malloc_with_options;
  *(void *)(result + 160) = xzm_malloc_zone_malloc_type_malloc;
  *(void *)(result + 168) = xzm_malloc_zone_malloc_type_calloc;
  *(void *)(result + 176) = xzm_malloc_zone_malloc_type_realloc;
  *(void *)(result + 184) = xzm_malloc_zone_malloc_type_memalign;
  *(void *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options;
  *(void *)(result + 200) = a2;
  *(_WORD *)(result + 208) = a3;
  *(_BYTE *)(result + 210) = a4;
  *(_BYTE *)(result + 211) = a5;
  *(void *)(result + 216) = a6;
  *(void *)(result + 224) = a7;
  *(void *)(result + 232) = a8;
  *(_BYTE *)(result + 240) = a9 & 3;
  *(_DWORD *)(result + 244) = a10;
  *(void *)(result + 248) = a11;
  *(_DWORD *)(result + 256) = a12;
  *(void *)(result + 264) = a13;
  *(void *)(result + 272) = 0LL;
  *(void *)(result + 280) = 0LL;
  *(void *)(result + 288) = 0LL;
  *(void *)(result + 296) = a14;
  if ((a14 & 0xA0) != 0)
  {
    *(void *)(result + 24) = xzm_malloc_zone_malloc_slow;
    *(void *)(result + 32) = xzm_malloc_zone_calloc_slow;
    *(void *)(result + 40) = xzm_malloc_zone_valloc_slow;
    *(void *)(result + 48) = xzm_malloc_zone_free_slow;
    *(void *)(result + 56) = xzm_malloc_zone_realloc_slow;
    *(void *)(result + 112) = xzm_malloc_zone_memalign_slow;
    *(void *)(result + 120) = xzm_malloc_zone_free_definite_size_slow;
    *(void *)(result + 144) = xzm_malloc_zone_try_free_default_slow;
    *(void *)(result + 152) = xzm_malloc_zone_malloc_with_options_slow;
    *(void *)(result + 160) = xzm_malloc_zone_malloc_type_malloc_slow;
    *(void *)(result + 168) = xzm_malloc_zone_malloc_type_calloc_slow;
    *(void *)(result + 176) = xzm_malloc_zone_malloc_type_realloc_slow;
    *(void *)(result + 184) = xzm_malloc_zone_malloc_type_memalign_slow;
    *(void *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options_slow;
  }

  return result;
}

void _xzm_initialize_xzone_data(uint64_t a1, char a2, char *a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 232);
  if (v8) {
    uint64_t v9 = *(void **)(a1 + 232);
  }
  else {
    uint64_t v9 = (void *)a1;
  }
  unint64_t __buf = 0LL;
  arc4random_buf(&__buf, 8uLL);
  unint64_t v11 = __buf;
  if (!__buf)
  {
    unint64_t v11 = 0xDEADDEADDEADDEADLL;
    unint64_t __buf = 0xDEADDEADDEADDEADLL;
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = 1LL;
  *(void *)(a1 + 272) = v11;
  do
  {
    if (!v8) {
      *(_BYTE *)(*(void *)(a1 + 368) + v12) = v13;
    }
    if (*(_BYTE *)(v9[45] + v12))
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      int v16 = 88 * *(unsigned __int8 *)(v9[45] + v12);
      uint64_t v17 = 88 * v13;
      while (1)
      {
        unint64_t v18 = *(void *)(v9[44] + 8 * v12);
        if (v18 > 0x1000) {
          unint64_t v19 = 0x10000LL;
        }
        else {
          unint64_t v19 = 0x4000LL;
        }
        if (v8)
        {
          LOWORD(v20) = 0;
        }

        else
        {
          if (v18 > 0x100)
          {
            if (v18 > 0x200)
            {
              if (v18 > 0x800)
              {
                LOWORD(v20) = v18 <= 0x2000;
                goto LABEL_23;
              }

              unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
              unsigned int v22 = 0x2000;
            }

            else
            {
              unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
              unsigned int v22 = 4096;
            }
          }

          else
          {
            unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
            unsigned int v22 = 2048;
          }

          int v20 = v22 / v21;
        }

LABEL_23:
        if ((_DWORD)v15) {
          int v23 = a4;
        }
        else {
          int v23 = 1;
        }
        if (v23) {
          uint64_t v24 = 0LL;
        }
        else {
          uint64_t v24 = 992LL;
        }
        char v25 = *a3;
        if (*a3)
        {
          if (a3[1]) {
            LOBYTE(v23) = 0;
          }
          if ((v23 & 1) != 0)
          {
            char v26 = 0;
            char v25 = 0;
            int v27 = 0;
          }

          else
          {
            uint64_t v28 = 4LL;
            if (v18 > 0x1000)
            {
              uint64_t v29 = 5LL;
            }

            else
            {
              uint64_t v28 = 2LL;
              uint64_t v29 = 3LL;
            }

            char v25 = a3[v28];
            char v26 = a3[v29];
            int v27 = 1;
          }
        }

        else
        {
          char v26 = 0;
          int v27 = v23 ^ 1;
        }

        uint64_t v30 = *(void *)(a1 + 216);
        uint64_t v31 = (_OWORD *)(v30 + v17 + v15);
        uint64_t v32 = v9[49] + v24;
        __int16 v33 = *(_WORD *)(a1 + 208);
        _OWORD *v31 = 0uLL;
        v31[1] = 0uLL;
        uint64_t v34 = v30 + v17 + v15;
        *(_WORD *)(v34 + 32) = v20;
        *(void *)(v34 + 40) = v32;
        *(void *)(v34 + 48) = v18;
        *(void *)(v34 + 56) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 64) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 68) = v19 / v18;
        *(_BYTE *)(v34 + 72) = v13 + v14;
        *(_WORD *)(v34 + 74) = v33;
        *(_BYTE *)(v34 + 76) = v14;
        LOBYTE(v32) = v10 & 0xFE;
        unsigned int v10 = v10 & 0xFFFFFFFE | v27;
        *(_BYTE *)(v34 + 77) = a2;
        *(_BYTE *)(v34 + 78) = v32 | v27;
        *(_BYTE *)(v34 + 79) = v25;
        *(_BYTE *)(v34 + 80) = v26;
        v15 += 88LL;
        ++v14;
        if (v16 == (_DWORD)v15)
        {
          v13 += v14;
          break;
        }
      }
    }

    ++v12;
  }

  while (v12 != 40);
}

uint64_t xzm_malloc_zone_create(unsigned int a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 210);
  unsigned int v5 = *(unsigned __int8 *)(a2 + 211);
  uint64_t v6 = (os_unfair_lock_s *)(a2 + 448);
  os_unfair_lock_lock_with_options();
  uint64_t v7 = *(void **)(a2 + 440);
  if (v7)
  {
    *(void *)(a2 + 440) = v7[1];
    int v8 = *(unsigned __int16 *)v7;
    xzm_metapool_free(*(void *)(a2 + 400) + 128LL, v7);
    os_unfair_lock_unlock(v6);
    if (!v8) {
      return 0LL;
    }
  }

  else
  {
    int v9 = *(unsigned __int16 *)(a2 + 436);
    if (v9 == 0xFFFF)
    {
      os_unfair_lock_unlock(v6);
      return 0LL;
    }

    LOWORD(v8) = v9 + 1;
    *(_WORD *)(a2 + 436) = v9 + 1;
    os_unfair_lock_unlock(v6);
  }

  uint64_t v10 = 88LL * v4 + 304;
  mach_vm_address_t plat = mvm_allocate_plat(0LL, v10 + 32 * v4 * (unint64_t)v5, 0, 1, 0, 1);
  uint64_t v12 = plat;
  if (plat)
  {
    _xzm_initialize_const_zone_data( plat,  v10 + 32 * v4 * (unint64_t)v5,  v8,  v4,  v5,  plat + 304,  v10 + plat,  a2,  *(_BYTE *)(a2 + 240) & 3,  *(void *)(a2 + 244),  HIDWORD(*(void *)(a2 + 244)),  *(_DWORD *)(a2 + 256),  *(void *)(a2 + 264),  a1);
    _xzm_initialize_xzone_data(v12, 0, (char *)(a2 + 452), *(unsigned __int8 *)(a2 + 344) == 2);
    *(void *)(v12 + 288) = 0LL;
  }

  return v12;
}

uint64_t _xzm_xzone_malloc_tiny(uint64_t a1, uint64_t a2, char a3)
{
  int v3 = *(unsigned __int8 *)(a2 + 77);
  if (v3 == 1)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 1;
  }

  else if (v3 == 2)
  {
    LOBYTE(v4) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = *(void *)(a1 + 224);
  unint64_t v7 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v4;
  int v8 = (unint64_t *)(v6 + 32 * v7);
  unint64_t v9 = *v8;
  if ((*v8 & 1) == 0)
  {
    uint64_t v10 = (unint64_t *)((v9 >> 2) & 0x7FFFFFFFFFFFLL);
    if (v10)
    {
      uint64_t v11 = (v9 >> 2) & 0x7FFFFFFFC000LL;
      unint64_t v12 = *v10;
      if ((*v10 & 0x40000000) == 0)
      {
        int v13 = 0;
        uint64_t v14 = (unsigned __int8 *)(a2 + 77);
LABEL_10:
        while (((v12 >> 22) & 0x3F) == v4 + 1)
        {
          if ((v12 & 0x3FF800) != 0)
          {
            unint64_t v16 = ((_DWORD)v12 + 4192256) & 0x3FF800 | v12 & 0xFFFFFFFFFFC007FFLL;
            if ((v12 & 0x7FF) <= 0x3FF)
            {
              uint64_t v5 = v15 + 16 * (v12 & 0x7FF);
              uint64_t v17 = *(void *)v5;
              unint64_t v18 = *(void *)(v5 + 8);
              do
              {
                unint64_t v19 = __ldxr(v10);
                if (v19 != v12)
                {
                  __clrex();
                  int v13 = 1;
                  unint64_t v12 = v19;
                  if ((v19 & 0x40000000) == 0) {
                    goto LABEL_10;
                  }
                  goto LABEL_52;
                }
              }

              while (__stxr( ((int)v12 + 4192256) & 0x3FF800LL | v12 & 0xFFF8003FFFC00000LL | v18 & 0x7FF | (((v18 >> 11) & 0x1FFF) << 38),  v10));
              if ((*(void *)(a1 + 272) ^ v5) == v17 && v18 >> 24 == 0) {
                goto LABEL_39;
              }
              return _xzm_xzone_malloc_tiny_outlined(a1, a2, v4, v8, v5, a3);
            }

            if ((((_DWORD)v12 + 4192256) & 0x3FF800) == 0) {
              unint64_t v16 = ((int)v12 + 4192256) & 0x3FF800LL | v12 & 0xFFFFFFFFFFC00000LL | 0x7FD;
            }
            uint64_t v21 = *(unsigned int *)(a2 + 68);
            uint64_t v22 = *(void *)(a2 + 48);
            while (1)
            {
              unint64_t v23 = __ldxr(v10);
              if (v23 != v12) {
                break;
              }
              if (!__stxr(v16, v10))
              {
                if (!v15) {
                  goto LABEL_52;
                }
                uint64_t v5 = v15 + (v21 - ((v12 >> 11) & 0x7FF)) * v22;
LABEL_39:
                if ((*(_BYTE *)(a1 + 240) & 3) == v3) {
                  goto LABEL_49;
                }
                uint64_t v25 = v6 + 32 * v7;
                if (!v13 && (*(void *)(v25 + 16) & 0xFFFFFF00000000LL) == 0) {
                  goto LABEL_49;
                }
                char v26 = (unint64_t *)(v25 + 16);
                uint64_t v27 = v13 ? 0x100000001LL : 1LL;
                do
                {
                  unint64_t v28 = __ldxr(v26);
                  unint64_t v29 = v28 + v27;
                }

                while (__stxr(v29, v26));
                unint64_t v30 = HIBYTE(v29);
                if (HIBYTE(v29) == (*(_BYTE *)(a1 + 240) & 3)) {
                  goto LABEL_49;
                }
                if ((HIDWORD(v29) & 0xFFFFFFu) <= *(_DWORD *)(a1 + 4LL * v30 + 244))
                {
                  if (*(_DWORD *)(a1 + 256) < v29)
                  {
                    while (1)
                    {
                      unint64_t v36 = __ldxr(v26);
                      if (!__stxr(v29 & 0xFF00000000000000LL, v26)) {
                        goto LABEL_49;
                      }
                    }

                    __clrex();
                  }

                  goto LABEL_49;
                }

                if (HIBYTE(HIDWORD(v29)) <= 2u) {
                  char v32 = 0x20201u >> (8 * HIBYTE(v29));
                }
                else {
                  char v32 = 2;
                }
                unsigned int v33 = v32 & 3;
                while (1)
                {
                  unsigned int v34 = __ldxr(v14);
                  if (v34 >= v33) {
                    break;
                  }
                  if (!__stxr(v33, v14)) {
                    goto LABEL_61;
                  }
                }

                __clrex();
LABEL_61:
                if (v33 != 1)
                {
                  if (v33 == 2)
                  {
                    unsigned __int8 v35 = logical_ncpus;
LABEL_74:
                    if (!v35)
                    {
LABEL_49:
                      *(void *)uint64_t v5 = 0LL;
                      *(void *)(v5 + 8) = 0LL;
                      if ((a3 & 1) != 0 && *(void *)(a2 + 48) >= 0x401uLL) {
                        return _platform_memset();
                      }
                      else {
                        return v5;
                      }
                    }
                  }

                  else
                  {
                    unsigned __int8 v35 = 1;
                  }

                  for (uint64_t i = 0LL; i != v35; ++i)
                  {
                    unint64_t v39 = (unint64_t *)(*(void *)(a1 + 224)
                    while (1)
                    {
                      unint64_t v40 = __ldxr(v39);
                      if (HIBYTE(v40) >= v33) {
                        break;
                      }
                    }

                    __clrex();
LABEL_81:
                    ;
                  }

                  goto LABEL_49;
                }

                else {
                  unsigned __int8 v35 = logical_ncpus;
                }
                goto LABEL_74;
              }
            }

            __clrex();
            int v13 = 1;
            unint64_t v12 = v23;
            if ((v23 & 0x40000000) == 0) {
              continue;
            }
            break;
          }

          while (1)
          {
            unint64_t v20 = __ldxr(v10);
            if (v20 != v12) {
              break;
            }
            if (!__stxr(v12 & 0xFFFFFFFFF03FFFFFLL, v10)) {
              goto LABEL_52;
            }
          }

          __clrex();
          unint64_t v12 = v20;
          if ((v20 & 0x40000000) != 0) {
            break;
          }
        }
      }

LABEL_52:
      uint64_t v5 = 0LL;
    }
  }

  return _xzm_xzone_malloc_tiny_outlined(a1, a2, v4, v8, v5, a3);
}

void _xzm_xzone_malloc_small(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = (os_unfair_lock_s *)*(unsigned __int8 *)(a2 + 77);
  if ((_DWORD)v5 == 1)
  {
    unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 1;
  }

  else if ((_DWORD)v5 == 2)
  {
    LOBYTE(v6) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  uint64_t v7 = *(void *)(a1 + 224);
  unint64_t v8 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v6;
  uint64_t v9 = v7 + 32 * v8;
  os_unfair_lock_t lock = (os_unfair_lock_s *)(v9 + 8);
  if (v5 >= (*(_BYTE *)(a1 + 240) & 3u))
  {
    os_unfair_lock_lock_with_options();
    goto LABEL_31;
  }

  if (os_unfair_lock_trylock((os_unfair_lock_t)(v9 + 8))
    || (os_unfair_lock_lock_with_options(),
        unsigned int v12 = *(_DWORD *)(v9 + 20) + 1,
        *(_DWORD *)(v9 + 20) = v12,
        v12 <= *(_DWORD *)(a1 + 4LL * (void)v5 + 244)))
  {
LABEL_29:
    uint64_t v17 = v7 + 32 * v8;
    unsigned int v18 = *(_DWORD *)(v17 + 16) + 1;
    *(_DWORD *)(v17 + 16) = v18;
    if (!(v18 % *(_DWORD *)(a1 + 256))) {
      *(_DWORD *)(v9 + 20) = 0;
    }
LABEL_31:
    uint64_t v19 = *(void *)v9;
    if (!*(void *)v9)
    {
      uint64_t v5 = (os_unfair_lock_s *)(a2 + 24);
      os_unfair_lock_lock_with_options();
      goto LABEL_48;
    }

    uint64_t v20 = *(_BYTE *)(v19 + 32) & 0xF;
    if ((_DWORD)v20 == 2)
    {
    }

    else
    {
      if ((_DWORD)v20 != 5) {
        goto LABEL_140;
      }
      if (*(_DWORD *)(v19 + 4) != *(_DWORD *)(a2 + 68))
      {
LABEL_73:
        uint64_t v20 = *(_BYTE *)(v19 + 32) & 0xF;
        if ((v20 - 6) < 2)
        {
          uint64_t v34 = 0LL;
        }

        else
        {
          if ((_DWORD)v20 != 5 && (_DWORD)v20 != 2) {
            goto LABEL_141;
          }
          uint64_t v34 = *(void *)(*(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v19 + 33) + 48) & 0x3FFFLL;
        }

        if ((_DWORD)v20 == 5)
        {
          unint64_t v35 = (0xAAAAAAAAAAAAC000LL * (((unint64_t)(v19 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL;
          int v36 = *(_DWORD *)(v19 + 4);
          if (v36 && v34)
          {
            uint64_t v37 = *(unsigned int *)(v19 + 40);
            if ((_DWORD)v37)
            {
              uint64_t v38 = 0LL;
              uint64_t v39 = 0LL;
              unint64_t v40 = 0LL;
              uint64_t v41 = *(void *)(a1 + 216);
              uint64_t v42 = 48 * v37;
              unsigned int v43 = -1;
              while (1)
              {
                uint64_t v5 = (os_unfair_lock_s *)(v19 + v38);
                uint64_t v44 = v19 + v38;
                unsigned __int8 v45 = (char *)(v19 + v38);
                if ((*(_BYTE *)(v19 + v38 + 32) & 0xF) != 4) {
                  goto LABEL_84;
                }
                uint64_t os_unfair_lock_opaque = v5[9]._os_unfair_lock_opaque;
                int v55 = (os_unfair_lock_s *)((char *)v5 - os_unfair_lock_opaque);
                unsigned int v56 = *((_BYTE *)&v5[8]._os_unfair_lock_opaque - os_unfair_lock_opaque) & 0xF;
                uint64_t v44 = v19 + v38;
                unsigned __int8 v45 = (char *)(v19 + v38);
                if (v56 > 8) {
                  goto LABEL_84;
                }
                int v57 = 1 << v56;
                if ((v57 & 0x1E8) == 0) {
                  break;
                }
                uint64_t v44 = v19 + v38;
                unsigned __int8 v45 = (char *)(v19 + v38);
                if (&v55[12 * v55[10]._os_unfair_lock_opaque] > v5) {
                  goto LABEL_112;
                }
LABEL_84:
                uint64_t v20 = v45[32] & 0xF;
                if ((v20 - 6) < 2)
                {
                  unint64_t v46 = (unint64_t)*((unsigned int *)v45 + 10) << 14;
                }

                else
                {
                  if ((_DWORD)v20 != 5 && (_DWORD)v20 != 2)
                  {
                    qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
                    qword_18C528038 = v20;
                    __break(1u);
LABEL_138:
                    qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
                    qword_18C528038 = v20;
                    __break(1u);
                    goto LABEL_139;
                  }

                  unint64_t v46 = *(void *)(v41 + 88LL * v45[33] + 48);
                }

                unint64_t v49 = (v47 - v48) / v46;
                int v50 = *(_DWORD *)(v41 + 88LL * v45[33] + 68);
                if (v50 == (_DWORD)v49)
                {
                  LODWORD(v51) = 0;
                }

                else
                {
                  if ((v20 - 6) < 2)
                  {
                    unint64_t v52 = (unint64_t)*((unsigned int *)v45 + 10) << 14;
                  }

                  else
                  {
                    if ((_DWORD)v20 != 5 && (_DWORD)v20 != 2) {
                      goto LABEL_138;
                    }
                    unint64_t v52 = *(void *)(v41 + 88LL * v45[33] + 48);
                  }

                  unint64_t v51 = (unint64_t)~(-1 << ((v47 - v48 + 0x3FFF) / v52
                                                               - v49
                                                               - (v50 == ((v47 - v48 + 0x3FFF)
                                                                                      / v52))
                                                               + 1)) << v49;
                }

                unsigned int v53 = *(_DWORD *)v19;
                if ((*(_DWORD *)v19 & v51) != 0 && (*(_DWORD *)v19 & v51) != (_DWORD)v51)
                {
                  v11.i32[0] = *(_DWORD *)v19 & v51;
                  int8x8_t v11 = vcnt_s8(v11);
                  v11.i16[0] = vaddlv_u8((uint8x8_t)v11);
                  if (v11.i32[0] < v43)
                  {
                    unsigned int v10 = *(_DWORD *)v19 & v51;
                    unint64_t v40 = v19 + v38;
                    unsigned int v43 = v11.i32[0];
                  }
                }

                ++v39;
                v38 += 48LL;
                if (v42 == v38)
                {
                  if (!v40) {
                    goto LABEL_127;
                  }
                  unsigned int v61 = __clz(__rbit32(v10));
                  if (!v10)
                  {
                    unsigned int v61 = -1;
                    goto LABEL_117;
                  }

                  v11.i32[0] = v10;
                  uint8x8_t v63 = (uint8x8_t)vcnt_s8(v11);
                  v63.i16[0] = vaddlv_u8(v63);
                  if (v63.i32[0] >= 2u)
                  {
                    unint64_t v64 = (v35 + v61 + *(void *)(a2 + 48)) >> 14;
                    unint64_t v65 = (v19 & 0xFFFFFFFFFFFFC000LL) + 48LL * v64 + 2104;
                    if (v65 < v40)
                    {
                      BOOL v60 = (v10 & ~(1 << v61)) == 0;
                      unsigned int v59 = __clz(__rbit32(v10 & ~(1 << v61)));
                      goto LABEL_114;
                    }
                  }

                  goto LABEL_117;
                }
              }

              BOOL v58 = (v57 & 6) != 0 && v5 == v55;
              uint64_t v44 = v19 + v38;
              unsigned __int8 v45 = (char *)(v19 + v38);
              if (!v58) {
                goto LABEL_84;
              }
LABEL_112:
              uint64_t v44 = v19 + 48 * v39 - os_unfair_lock_opaque;
              unsigned __int8 v45 = (char *)v5 - os_unfair_lock_opaque;
              goto LABEL_84;
            }

            unsigned int v53 = *(_DWORD *)v19;
LABEL_127:
            char v62 = lock;
            unsigned int v66 = __clz(__rbit32(v53));
            if (v53) {
              unsigned int v61 = v66;
            }
            else {
              unsigned int v61 = -1;
            }
          }

          else
          {
            unsigned int v53 = *(_DWORD *)v19;
            unsigned int v59 = __clz(__rbit32(*(_DWORD *)v19));
            BOOL v60 = *(_DWORD *)v19 == 0;
LABEL_114:
            if (v60) {
              unsigned int v61 = -1;
            }
            else {
              unsigned int v61 = v59;
            }
LABEL_117:
            char v62 = lock;
          }

          uint64_t v67 = (void *)(v35 + *(void *)((v19 & 0xFFFFFFFFFFFFC000LL) + 0x30) + *(void *)(a2 + 48) * v61);
          *(_DWORD *)uint64_t v19 = v53 & ~(1 << v61);
          *(_DWORD *)(v19 + 4) = v36 + 1;
          os_unfair_lock_unlock(v62);
          if (v67)
          {
            v67[1] = 0LL;
            if ((a3 & 1) != 0)
            {
              size_t v68 = *(void *)(a2 + 48);
              if (v68 >= 0x401) {
                bzero(v67, v68);
              }
            }

            return;
          }

LABEL_135:
          **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
          return;
        }

LABEL_139:
        uint64_t v20 = v20;
        qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: attempting to allocate from chunk of bad kind";
        qword_18C528038 = v20;
        __break(1u);
LABEL_140:
        qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
        qword_18C528038 = v20;
        __break(1u);
LABEL_141:
        qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
        qword_18C528038 = v20;
        __break(1u);
        goto LABEL_142;
      }
    }

    uint64_t v5 = (os_unfair_lock_s *)(a2 + 24);
    os_unfair_lock_lock_with_options();
    uint64_t v22 = a2 + 8;
    uint64_t v23 = *(void *)(a2 + 8);
    *(void *)(v19 + 16) = v23;
    if (v23) {
      *(void *)(*(void *)v22 + 24LL) = v19 + 16;
    }
    *(void *)uint64_t v22 = v19;
    *(void *)(v19 + 24) = v22;
    atomic_store(0, (unsigned __int8 *)(v19 + 12));
LABEL_48:
    while (1)
    {
      uint64_t v19 = *(void *)a2;
      if (!*(void *)a2) {
        break;
      }
      os_unfair_lock_lock_with_options();
      uint64_t v24 = *(void *)(v19 + 16);
      if (v24)
      {
        *(void *)(v24 + 24) = *(void *)(v19 + 24);
        uint64_t v24 = *(void *)(v19 + 16);
      }

      **(void **)(v19 + 24) = v24;
      *(_BYTE *)(v19 + 32) &= ~0x20u;
      if (*(_DWORD *)(v19 + 4))
      {
        *(void *)uint64_t v9 = v19;
        *(_BYTE *)(v19 + 12) = v6 + 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 8));
        os_unfair_lock_unlock(v5);
        goto LABEL_73;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 8));
    }

    os_unfair_lock_unlock(v5);
    if ((*(_BYTE *)(a2 + 78) & 1) != 0)
    {
      uint64_t v25 = *(void *)(a1 + 232) ? *(void *)(a1 + 232) : a1;
      chunk_from_isolatiouint64_t n = _xzm_xzone_allocate_chunk_from_isolation(v25, a2);
      if (chunk_from_isolation)
      {
        uint64_t v19 = chunk_from_isolation;
LABEL_72:
        *(void *)uint64_t v9 = v19;
        *(_BYTE *)(v19 + 12) = v6 + 1;
        goto LABEL_73;
      }
    }

    uint64_t v27 = (uint64_t *)(a2 + 16);
    if (*(void *)(a2 + 16))
    {
      os_unfair_lock_lock_with_options();
      uint64_t v19 = *v27;
      if (*v27)
      {
        uint64_t v28 = *(void *)(v19 + 16);
        if (v28)
        {
          *(void *)(v28 + 24) = *(void *)(v19 + 24);
          uint64_t v28 = *(void *)(v19 + 16);
        }

        **(void **)(v19 + 24) = v28;
        goto LABEL_70;
      }

      os_unfair_lock_unlock(v5);
    }

    uint64_t v72 = 0LL;
    mach_vm_address_t v29 = xzm_segment_group_alloc_chunk(*(void *)(a2 + 40), 5, (unsigned __int8 *)(a2 + 79), 4u, &v72, 0LL, 0, 0);
    if (!v29)
    {
      *(void *)uint64_t v9 = 0LL;
      os_unfair_lock_unlock(lock);
      goto LABEL_135;
    }

    uint64_t v19 = v29;
    *(_BYTE *)(v29 + 33) = *(_BYTE *)(a2 + 72);
    if (!v72) {
      goto LABEL_71;
    }
    os_unfair_lock_lock_with_options();
    uint64_t v30 = v72;
    if (v72)
    {
      uint64_t v31 = v72;
      do
      {
        uint64_t v32 = *(void *)(v30 + 16);
        uint64_t v31 = *(void *)(v31 + 16);
        *(_BYTE *)(v30 + 33) = *(_BYTE *)(a2 + 72);
        *(_BYTE *)(v30 + 32) |= 0x40u;
        uint64_t v33 = *(void *)(a2 + 16);
        *(void *)(v30 + 16) = v33;
        if (v33) {
          *(void *)(*v27 + 24) = v30 + 16;
        }
        *uint64_t v27 = v30;
        *(void *)(v30 + 24) = v27;
        uint64_t v30 = v32;
      }

      while (v32);
      uint64_t v72 = v31;
    }

LABEL_70:
    os_unfair_lock_unlock(v5);
LABEL_71:
    _xzm_xzone_fresh_chunk_init(a2, v19, 5);
    *(_WORD *)(v19 + 34) = *(_WORD *)(a2 + 74);
    goto LABEL_72;
  }

  *(_DWORD *)(v9 + 20) = 0;
  if ((_DWORD)v5 == 1)
  {
    else {
      unsigned __int8 v13 = logical_ncpus;
    }
  }

  else
  {
    if ((_DWORD)v5 != 2) {
      goto LABEL_22;
    }
    unsigned __int8 v13 = logical_ncpus;
  }

  if ((v13 & 0xFE) != 0)
  {
    char v69 = v6;
    os_unfair_lock_unlock(lock);
    uint64_t v14 = 0LL;
    do
    {
      unint64_t v15 = (os_unfair_lock_s *)(*(void *)(a1 + 224)
                               + 32 * (*(unsigned __int8 *)(a2 + 72) + v14 * *(unsigned __int8 *)(a1 + 210)));
      if (v15 != (os_unfair_lock_s *)v9)
      {
        os_unfair_lock_lock_with_options();
        v15[5]._uint64_t os_unfair_lock_opaque = 0;
        os_unfair_lock_unlock(v15 + 2);
      }

      ++v14;
    }

    while (v13 != v14);
    os_unfair_lock_lock_with_options();
    LOBYTE(v6) = v69;
  }

LABEL_142:
  if ((_DWORD)v5 == 2)
  {
    qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Can't upgrade from XZM_SLOT_CPU";
    __break(1u);
  }

  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

uint64_t _xzm_xzone_malloc_tiny_outlined( uint64_t a1, uint64_t a2, int a3, unint64_t *a4, uint64_t a5, char a6)
{
  if (a5)
  {
    qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
    qword_18C528038 = a5;
    __break(1u);
LABEL_79:
    if (BYTE3(v7) <= 2u) {
      char v39 = 0x20201u >> (8 * BYTE3(v7));
    }
    else {
      char v39 = 2;
    }
    unsigned int v40 = v39 & 3;
    while (1)
    {
      unsigned int v41 = __ldxr(v6);
      if (v41 >= v40) {
        break;
      }
      if (!__stxr(v40, v6)) {
        goto LABEL_85;
      }
    }

    __clrex();
LABEL_85:
    if (v40 == 1)
    {
      else {
        unsigned __int8 v42 = logical_ncpus;
      }
    }

    else
    {
      if (v40 != 2)
      {
        unsigned __int8 v42 = 1;
LABEL_101:
        for (uint64_t i = 0LL; i != v42; ++i)
        {
          unint64_t v46 = (unint64_t *)(*(void *)(v10 + 224)
          while (1)
          {
            unint64_t v47 = __ldxr(v46);
            if (HIBYTE(v47) >= v40) {
              break;
            }
          }

          __clrex();
LABEL_105:
          ;
        }

        goto LABEL_74;
      }

      unsigned __int8 v42 = logical_ncpus;
    }

    if (!v42) {
      goto LABEL_74;
    }
    goto LABEL_101;
  }

  char v9 = a6;
  uint64_t v8 = a2;
  uint64_t v10 = a1;
  int v14 = 0;
  unint64_t v48 = *(void *)(a2 + 48);
  unint64_t v15 = *a4;
  char v51 = 0;
LABEL_3:
  unint64_t v16 = v15;
  while ((v16 & 1) != 0)
  {
    if ((v16 & 2) == 0)
    {
      while (1)
      {
        unint64_t v17 = __ldxr(a4);
        if (v17 != v16) {
          break;
        }
        if (!__stxr(v16 | 2, a4))
        {
          int v18 = 1;
          goto LABEL_12;
        }
      }

      int v18 = 0;
      __clrex();
LABEL_12:
      unint64_t v16 = v17;
      if (!v18) {
        continue;
      }
    }

    uint64_t result = __ulock_wait();
    if ((result & 0x80000000) != 0 && (_DWORD)result != -4)
    {
      uint64_t v20 = -(int)result;
      if ((_DWORD)v20 != 14) {
        goto LABEL_110;
      }
    }

LABEL_14:
    unint64_t v16 = *a4;
  }

  if ((v16 & 2) != 0)
  {
    _xzm_fork_lock_wait((os_unfair_lock_s *)v10);
    goto LABEL_14;
  }

  uint64_t v21 = (unint64_t *)((v16 >> 2) & 0x7FFFFFFFFFFFLL);
  if (v21 && (uint64_t v22 = _xzm_xzone_malloc_from_tiny_chunk(v10, v8, a3, v21, &v51, 0LL)) != 0)
  {
    int8x8_t v11 = (void *)v22;
  }

  else
  {
    if (!v14) {
      int v14 = _malloc_ulock_self_owner_value();
    }
    do
    {
      unint64_t v15 = __ldxr(a4);
      if (v15 != v16)
      {
        __clrex();
        goto LABEL_3;
      }
    }

    while (__stxr(v16 & 0xFFFE000000000000LL | (4 * v14) | 1u, a4));
    uint64_t v23 = _xzm_chunk_list_pop((os_unfair_lock_s *)v10, (unint64_t *)v8, 0);
    if (!v23) {
      goto LABEL_32;
    }
    uint64_t v24 = v23;
    do
    {
      char v50 = 0;
      unint64_t v25 = _xzm_xzone_malloc_from_tiny_chunk(v10, v8, a3, (unint64_t *)v24, &v51, &v50);
      if (v25)
      {
LABEL_34:
        int8x8_t v11 = (void *)v25;
        goto LABEL_59;
      }

      if (v50) {
        _xzm_chunk_list_push((os_unfair_lock_s *)v10, (unint64_t *)(v8 + 8), v24, 0);
      }
      uint64_t v24 = _xzm_chunk_list_pop((os_unfair_lock_s *)v10, (unint64_t *)v8, 0);
    }

    while (v24);
LABEL_32:
    while (1)
    {
      char v26 = (unint64_t *)_xzm_chunk_list_pop((os_unfair_lock_s *)v10, (unint64_t *)(v8 + 8), 0);
      if (!v26) {
        break;
      }
      uint64_t v24 = (uint64_t)v26;
      unint64_t v25 = _xzm_xzone_malloc_from_empty_tiny_chunk(v8, a3, v26);
      if (v25) {
        goto LABEL_34;
      }
    }

    if ((*(_BYTE *)(v8 + 78) & 1) != 0)
    {
      uint64_t v27 = *(void *)(v10 + 232) ? *(void *)(v10 + 232) : v10;
      chunk_from_isolatiouint64_t n = (unint64_t *)_xzm_xzone_allocate_chunk_from_isolation(v27, v8);
      if (chunk_from_isolation)
      {
        uint64_t v24 = (uint64_t)chunk_from_isolation;
        int8x8_t v11 = (void *)_xzm_xzone_malloc_from_empty_tiny_chunk(v8, a3, chunk_from_isolation);
        goto LABEL_58;
      }
    }

    uint64_t result = _xzm_chunk_list_pop((os_unfair_lock_s *)v10, (unint64_t *)(v8 + 24), 0);
    if (result)
    {
      uint64_t v24 = result;
      if (v48 <= 0x400 && (*(_BYTE *)(result + 32) & 0x10) == 0)
      {
        uint64_t v20 = *(_BYTE *)(result + 32) & 0xF;
        if ((v20 - 6) < 2)
        {
          size_t v29 = (unint64_t)*(unsigned int *)(result + 40) << 14;
        }

        else if ((_DWORD)v20 == 2)
        {
          size_t v29 = 0x4000LL;
        }

        else
        {
          if ((_DWORD)v20 != 5) {
            goto LABEL_111;
          }
          size_t v29 = 0x10000LL;
        }

        bzero( (void *)(((0xAAAAAAAAAAAAC000LL * (((unint64_t)(result & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL)
                 + *(void *)((result & 0xFFFFFFFFFFFFC000LL) + 0x30)),
          v29);
      }

      goto LABEL_57;
    }

    uint64_t v49 = 0LL;
    mach_vm_address_t v30 = xzm_segment_group_alloc_chunk( *(void *)(v8 + 40),  2,  (unsigned __int8 *)(v8 + 79),  1u,  &v49,  0LL,  v48 < 0x401,  0);
    uint64_t v24 = v30;
    if (v30)
    {
      *(_BYTE *)(v30 + 33) = *(_BYTE *)(v8 + 72);
      uint64_t v31 = v49;
      if (v49)
      {
        do
        {
          uint64_t v32 = *(void *)(v31 + 16);
          uint64_t v49 = *(void *)(v49 + 16);
          *(_BYTE *)(v31 + 33) = *(_BYTE *)(v8 + 72);
          *(_BYTE *)(v31 + 32) |= 0x40u;
          _xzm_chunk_list_push((os_unfair_lock_s *)v10, (unint64_t *)(v8 + 24), v31, 0);
          uint64_t v31 = v32;
        }

        while (v32);
      }

  int v18 = *(_BYTE *)(v17 + 32) & 0xF;
  if (v18 > 7) {
    xzm_segment_group_free_chunk_cold_3(v18);
  }
  unint64_t v52 = a2
      - *(void *)((v17 & 0xFFFFFFFFFFFFC000LL) + 0x30)
      - ((0xAAAAAAAAAAAAC000LL * (((v17 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
  if (v18 == 5 || v18 == 2)
  {
    int v54 = *(void *)(v7 + 216) + 88LL * *(unsigned __int8 *)(v17 + 33);
    uint64_t v19 = *(void *)(v54 + 48);
  }

  else
  {
    uint64_t v19 = (unint64_t)*(unsigned int *)(v17 + 40) << 14;
    if (v52 % v19) {
      goto LABEL_16;
    }
  }

  if (v18 == 5)
  {
    if (((*(_DWORD *)v17 >> (v52 / v19)) & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (v18 == 2
    && *(void *)a2 == (*(void *)(v7 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(v7, v17, a2))
  {
LABEL_16:
    uint64_t v19 = _xzm_ptr_size_outlined(v7, a2);
  }

LABEL_57:
      *(_BYTE *)(v24 + 32) &= ~0x40u;
      *(void *)uint64_t v24 = ((*(_DWORD *)(v8 + 68) << 11) + 4192256) & 0x3FF800 | 0x7FCu | ((unint64_t)(((_BYTE)a3 + 1) & 0x3F) << 22);
      *(_WORD *)(v24 + 34) = *(_WORD *)(v8 + 74);
LABEL_58:
      _xzm_chunk_list_push((os_unfair_lock_s *)v10, (unint64_t *)(v8 + 16), v24, 1u);
    }

    else
    {
      int8x8_t v11 = 0LL;
    }

    do
LABEL_59:
      char v33 = __ldxr(a4);
    while (__stlxr((v15 & 0xFFFE000000000000LL | (4 * (v24 & 0x7FFFFFFFFFFFLL))) + 0x2000000000000LL, a4));
    if ((v33 & 2) != 0)
    {
      uint64_t result = __ulock_wake();
      if ((_DWORD)result != -2)
      {
        if ((_DWORD)result)
        {
          uint64_t v20 = -(int)result;
          qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wake failure";
          qword_18C528038 = v20;
          __break(1u);
LABEL_110:
          qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
          qword_18C528038 = v20;
          __break(1u);
LABEL_111:
          qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
          qword_18C528038 = v20;
          __break(1u);
          return result;
        }
      }
    }

    if (!v11) {
      return (uint64_t)v11;
    }
  }

  if ((*(_BYTE *)(v10 + 240) & 3) != *(_BYTE *)(v8 + 77) && (v51 || (a4[2] & 0xFFFFFF00000000LL) != 0))
  {
    unint64_t v6 = (unsigned __int8 *)(v8 + 77);
    uint64_t v34 = a4 + 2;
    uint64_t v35 = v51 ? 0x100000001LL : 1LL;
    do
    {
      unint64_t v36 = __ldxr(v34);
      unint64_t v37 = v36 + v35;
    }

    while (__stxr(v37, v34));
    unint64_t v38 = HIBYTE(v37);
    if (HIBYTE(v37) != (*(_BYTE *)(v10 + 240) & 3))
    {
      unint64_t v7 = HIDWORD(v37);
      if (*(_DWORD *)(v10 + 256) < v37)
      {
        while (1)
        {
          unint64_t v43 = __ldxr(v34);
          if (!__stxr(v37 & 0xFF00000000000000LL, v34)) {
            goto LABEL_74;
          }
        }

        __clrex();
      }
    }
  }

LABEL_74:
  *int8x8_t v11 = 0LL;
  v11[1] = 0LL;
  if ((v9 & 1) != 0 && v48 >= 0x401) {
    bzero(v11, *(void *)(v8 + 48));
  }
  return (uint64_t)v11;
}

void _xzm_walk_lock_wait(os_unfair_lock_s *a1)
{
  int32x4_t v1 = a1 + 70;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_unlock(v1);
}

void _xzm_fork_lock_wait(os_unfair_lock_s *a1)
{
  int32x4_t v1 = a1 + 71;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_unlock(v1);
}

uint64_t _xzm_xzone_malloc_from_tiny_chunk( uint64_t a1, uint64_t a2, int a3, unint64_t *a4, _BYTE *a5, _BYTE *a6)
{
  unint64_t v6 = a6;
  unint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v9 = a2;
  uint64_t v10 = a1;
  unint64_t v12 = *a4;
  int v13 = a3 + 1;
  unint64_t v14 = (unint64_t)((a3 + 1) & 0x3F) << 22;
  while (1)
  {
    while (1)
    {
      if ((v12 & 0x40000000) != 0)
      {
        do
        {
          _xzm_walk_lock_wait((os_unfair_lock_s *)v10);
          unint64_t v12 = *v8;
        }

        while ((*v8 & 0x40000000) != 0);
      }

      if (!v6) {
        break;
      }
      if ((v12 & 0x3FF800) != 0)
      {
        unint64_t v15 = v12 & 0xFFFFFFFFE03FFFFFLL | v14;
        goto LABEL_8;
      }

      if ((v12 & 0x7FF) == 0x7FE)
      {
        unint64_t v25 = v12 & 0xFFFFFFFFCFFFFFFFLL | 0x20000000;
        *unint64_t v6 = 1;
      }

      else
      {
        unint64_t v25 = v12 & 0xFFFFFFFFEFFFFFFFLL;
      }

      while (1)
      {
        unint64_t v26 = __ldxr(v8);
        if (v26 != v12) {
          break;
        }
        if (!__stxr(v25, v8)) {
          return 0LL;
        }
      }

LABEL_8:
    unint64_t v16 = ((_DWORD)v15 + 4192256) & 0x3FF800 | v15 & 0xFFFFFFFFFFC007FFLL;
    if ((v12 & 0x7FF) <= 0x3FF) {
      break;
    }
    if ((((_DWORD)v15 + 4192256) & 0x3FF800) == 0) {
      unint64_t v16 = ((int)v15 + 4192256) & 0x3FF800LL | v15 & 0xFFFFFFFFFFC00000LL | 0x7FD;
    }
    uint64_t v22 = *(unsigned int *)(v9 + 68);
    uint64_t v23 = *(void *)(v9 + 48);
    while (1)
    {
      unint64_t v24 = __ldxr(v8);
      if (v24 != v12) {
        break;
      }
      if (!__stxr(v16, v8)) {
        return v11 + (v22 - ((v12 >> 11) & 0x7FF)) * v23;
      }
    }

    __clrex();
    unint64_t v12 = v24;
LABEL_23:
    *unint64_t v7 = 1;
  }

  uint64_t result = v11 + 16 * (v12 & 0x7FF);
  uint64_t v18 = *(void *)result;
  unint64_t v19 = *(void *)(result + 8);
  unint64_t v20 = v16 & 0xFFF8003FFFFFF800LL | v19 & 0x7FF | (((v19 >> 11) & 0x1FFF) << 38);
  do
  {
    unint64_t v21 = __ldxr(v8);
    if (v21 != v12)
    {
      __clrex();
      unint64_t v12 = v21;
      goto LABEL_23;
    }
  }

  while (__stxr(v20, v8));
  if ((*(void *)(v10 + 272) ^ result) != v18 || v19 >> 24 != 0) {
    _xzm_xzone_malloc_from_tiny_chunk_cold_1(result);
  }
  return result;
}

uint64_t _malloc_ulock_self_owner_value()
{
  return *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) >> 2;
}

uint64_t _xzm_chunk_list_pop(os_unfair_lock_s *a1, unint64_t *a2, unsigned int a3)
{
  unint64_t v5 = *a2;
  uint64_t v6 = a3;
  do
  {
    while ((v5 & 0x8000000000000000LL) != 0)
    {
      _xzm_fork_lock_wait(a1);
      unint64_t v5 = *a2;
    }

    uint64_t result = v5 & 0x7FFFFFFFFFFFLL;
    if ((v5 & 0x7FFFFFFFFFFFLL) == 0) {
      break;
    }
    unint64_t v8 = (v5 + 0x800000000000LL) & 0x7FFF800000000000LL | *(void *)((v5 & 0x7FFFFFFFFFFFLL) + 8 * v6 + 0x10) & 0x7FFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v9 = __ldxr(a2);
      if (v9 != v5) {
        break;
      }
      if (!__stxr(v8, a2))
      {
        int v10 = 1;
        goto LABEL_9;
      }
    }

    int v10 = 0;
    __clrex();
LABEL_9:
    unint64_t v5 = v9;
  }

  while (!v10);
  return result;
}

void _xzm_chunk_list_push(os_unfair_lock_s *a1, unint64_t *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v6 = *a2;
  uint64_t v7 = a3 + 16;
  uint64_t v8 = a3 & 0x7FFFFFFFFFFFLL;
  uint64_t v9 = a4;
  do
  {
    while ((v6 & 0x8000000000000000LL) != 0)
    {
      _xzm_fork_lock_wait(a1);
      unint64_t v6 = *a2;
    }

    *(void *)(v7 + 8 * v9) = v6 & 0x7FFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v10 = __ldxr(a2);
      if (v10 != v6) {
        break;
      }
      if (!__stlxr((v6 + 0x800000000000LL) & 0x7FFF800000000000LL | v8, a2))
      {
        int v11 = 1;
        goto LABEL_8;
      }
    }

    int v11 = 0;
    __clrex();
LABEL_8:
    unint64_t v6 = v10;
  }

  while (!v11);
}

unint64_t _xzm_xzone_malloc_from_empty_tiny_chunk(uint64_t a1, char a2, unint64_t *a3)
{
  unint64_t v3 = atomic_load(a3);
  unint64_t v4 = v3 & 0xFFFFFFFFD0000000LL | ((unint64_t)((a2 + 1) & 0x3F) << 22) | ((*(_DWORD *)(a1 + 68) << 11) + 4192256) & 0x3FF800 | 0x7FC;
  do
  {
    unint64_t v5 = __ldaxr(a3);
    if (v5 != v3)
    {
      __clrex();
      _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1();
    }
  }

  while (__stxr(v4, a3));
}

uint64_t _xzm_xzone_allocate_chunk_from_isolation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 376) + 16LL * *(unsigned __int8 *)(a2 + 72));
  if (!*(void *)&v2->_os_unfair_lock_opaque) {
    return 0LL;
  }
  unint64_t v4 = v2 + 2;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = *(void *)&v2->_os_unfair_lock_opaque;
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      *(void *)(v6 + 24) = *(void *)(v5 + 24);
      uint64_t v6 = *(void *)(v5 + 16);
    }

    **(void **)(v5 + 24) = v6;
    *(_WORD *)(v5 + 34) = *(_WORD *)(a2 + 74);
  }

  os_unfair_lock_unlock(v4);
  return v5;
}

uint64_t _xzm_xzone_fresh_chunk_init(uint64_t result, uint64_t a2, int a3)
{
  char v3 = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a2 + 32) = v3 & 0xBF;
  if (a3 != 2)
  {
    if (a3 != 5) {
      _xzm_xzone_fresh_chunk_init_cold_1();
    }
    int v4 = v3 & 0xF;
    if (v4 != 2)
    {
      if (v4 != 5) {
        xzm_segment_group_free_chunk_cold_3(v4);
      }
      *(void *)a2 = *(_DWORD *)a2 | ~(-1LL << *(_DWORD *)(result + 68));
    }
  }

  return result;
}

void _xzm_free_outlined(uint64_t a1, void *a2, char a3)
{
  if (*(void *)(a1 + 232) || !mfm_claimed_address((unint64_t)a2))
  {
    if ((a3 & 1) != 0)
    {
      find_zone_and_free(a2, 1u);
    }

    else
    {
      qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
      qword_18C528038 = (uint64_t)a2;
      __break(1u);
    }
  }

  else
  {
    mfm_free(a2);
  }

void _xzm_xzone_free_block_to_small_chunk(uint64_t a1, uint64_t a2, int8x8_t *a3, int a4)
{
  unsigned __int8 v8 = a3[1].u8[4];
  uint64_t v9 = (os_unfair_lock_s *)&a3[1];
  while (v8)
  {
    unint64_t v10 = (os_unfair_lock_s *)(*(void *)(a1 + 224)
                             + 32
    int v11 = v10 + 2;
    os_unfair_lock_lock_with_options();
    int v12 = a3[1].u8[4];
    if (v12 == v8)
    {
      _xzm_xzone_free_to_chunk(a1, a3, a4);
      _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
      uint64_t v13 = a3[4].i8[0] & 0xF;
      if ((_DWORD)v13 == 2)
      {
        if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68))
        {
LABEL_17:
          *(void *)&v10->_uint64_t os_unfair_lock_opaque = 0LL;
          a3[1].i8[4] = 0;
          unint64_t v16 = v10 + 2;
LABEL_40:
          os_unfair_lock_unlock(v16);
          _xzm_xzone_chunk_free(a1, a2, (unint64_t)a3);
          return;
        }
      }

      else
      {
        if ((_DWORD)v13 != 5)
        {
          qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
          qword_18C528038 = v13;
          __break(1u);
          goto LABEL_42;
        }

        if (!a3->i32[1]) {
          goto LABEL_17;
        }
      }

      unint64_t v15 = v10 + 2;
LABEL_34:
      os_unfair_lock_unlock(v15);
      return;
    }

LABEL_6:
    os_unfair_lock_unlock(v11);
    unsigned __int8 v8 = v12;
  }

  os_unfair_lock_lock_with_options();
  LOBYTE(v12) = a3[1].i8[4];
  int v11 = v9;
  if ((_BYTE)v12) {
    goto LABEL_6;
  }
  uint64_t v13 = a3[4].i8[0] & 0xF;
  if ((_DWORD)v13 == 2)
  {
    BOOL v14 = (*(void *)a3 & 0x3FF800LL) == 0 && (a3->u32[0] | 0xFFFFF800) < 0xFFFFFFFE;
LABEL_21:
    _xzm_xzone_free_to_chunk(a1, a3, a4);
    _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
    uint64_t v13 = a3[4].i8[0] & 0xF;
    if ((_DWORD)v13 == 2)
    {
      if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68))
      {
LABEL_35:
        os_unfair_lock_unlock(v9);
        os_unfair_lock_lock_with_options();
        if ((a3[4].i8[0] & 0x20) != 0)
        {
          unint64_t v19 = (int8x8_t *)a3[2];
          if (v19)
          {
            v19[3] = a3[3];
            unint64_t v19 = (int8x8_t *)a3[2];
          }

          **(void **)&a3[3] = v19;
          a3[4].i8[0] &= ~0x20u;
        }

        unint64_t v16 = (os_unfair_lock_s *)(a2 + 24);
        goto LABEL_40;
      }
    }

    else
    {
      if ((_DWORD)v13 != 5) {
        goto LABEL_43;
      }
      if (!a3->i32[1]) {
        goto LABEL_35;
      }
    }

    if (v14)
    {
      os_unfair_lock_lock_with_options();
      unint64_t v17 = (int8x8_t *)a3[2];
      if (v17)
      {
        v17[3] = a3[3];
        unint64_t v17 = (int8x8_t *)a3[2];
      }

      **(void **)&a3[3] = v17;
      int8x8_t v18 = *(int8x8_t *)a2;
      a3[2] = *(int8x8_t *)a2;
      if (v18) {
        *(void *)(*(void *)a2 + 24LL) = a3 + 2;
      }
      *(void *)a2 = a3;
      a3[3] = (int8x8_t)a2;
      a3[4].i8[0] |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
    }

    unint64_t v15 = v9;
    goto LABEL_34;
  }

  if ((_DWORD)v13 == 5)
  {
    BOOL v14 = a3->i32[1] == *(_DWORD *)(a2 + 68);
    goto LABEL_21;
  }

void _xzm_free_large_huge(uint64_t a1, unint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 280);
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a2 + 34) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5)
  {
    *(void *)(v5 + 24) = *(void *)(a2 + 24);
    uint64_t v5 = *(void *)(a2 + 16);
  }

  **(void **)(a2 + 24) = v5;
  os_unfair_lock_unlock(v4);
  xzm_segment_group_free_chunk(*(void *)(a2 & 0xFFFFFFFFFFFFC000LL), a2, (*(void *)(a1 + 296) & 0x80LL) != 0);
}

int32x2_t _xzm_xzone_free_to_chunk(uint64_t a1, int8x8_t *a2, int a3)
{
  if ((a2[4].i8[0] & 0xF) != 5) {
    _xzm_xzone_free_to_chunk_cold_1(a2[4].i8[0] & 0xF);
  }
  v3.i32[1] = -1;
  v3.i32[0] = 1 << ((unint64_t)(a3
                                     + 1431650304 * ((a2 - (a2 & 0xFFFFC000 | 0x838)) >> 4)
  v3.i32[0] = vorr_s8(v3, *a2).u32[0];
  int32x2_t result = vadd_s32((int32x2_t)*a2, (int32x2_t)-1LL);
  v3.i32[1] = result.i32[1];
  *a2 = v3;
  return result;
}

BOOL _xzm_xzone_chunk_madvise_free_slices(BOOL result, uint64_t a2, uint64_t a3, int a4)
{
  if ((*(_BYTE *)(a3 + 32) & 0xF) == 5)
  {
    uint64_t v4 = *(void *)((a3 & 0xFFFFFFFFFFFFC000LL) + 0x30);
    unint64_t v5 = 0xAAAAAAAAAAAAC000LL * ((a3 - (a3 & 0xFFFFFFFFFFFFC000LL) - 2104) >> 4);
    unint64_t v6 = *(void *)(*(void *)(result + 216) + 88LL * *(unsigned __int8 *)(a3 + 33) + 48);
    unint64_t v7 = (a4 - v4 - v5) / v6;
    unint64_t v8 = (v5 & 0x3FFFFFFFC000LL) + v6 * v7;
    unint64_t v9 = v8 >> 14;
    unint64_t v10 = (v6 + v8 - 1) >> 14;
    unint64_t v11 = (((_DWORD)v8 - (_DWORD)v5) & 0xFFFFC000) / v6;
    unint64_t v12 = (~(_DWORD)v5 + (((_DWORD)v10 + 1) << 14)) / v6;
    unint64_t v13 = (((unint64_t)~(-1 << (v7 - v11 + 1)) << v11) & ~*(_DWORD *)a3) != 0
    unsigned int v14 = (((unint64_t)~(-1 << (v12 - v7 - (*(_DWORD *)(a2 + 68) == (_DWORD)v12) + 1)) << v7) & ~*(_DWORD *)a3) != 0
        ? v10
        : (int)v10 + 1;
    BOOL v15 = v14 >= v13;
    unsigned int v16 = v14 - v13;
    if (v16 != 0 && v15)
    {
      uint64_t v17 = *(void *)(a3 & 0xFFFFFFFFFFFFC000LL);
      if (v15) {
        unsigned int v18 = v16;
      }
      else {
        unsigned int v18 = 0;
      }
      return xzm_segment_group_segment_madvise_span(v17, (void *)(v4 + (v13 << 14)), v18);
    }
  }

  return result;
}

void _xzm_xzone_chunk_free(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 40);
  *(_WORD *)(a3 + 34) = 0;
  if ((*(_BYTE *)(a2 + 78) & 1) != 0)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v8 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v8 = a1;
    }
    if ((*(_BYTE *)(v8 + 328) & 4) == 0)
    {
      int v9 = *(_BYTE *)(a3 + 32) & 0xF;
      if (v9 != 5)
      {
        if (v9 != 2) {
          _xzm_xzone_chunk_free_cold_2(*(_BYTE *)(a3 + 32) & 0xF);
        }
        if ((*(void *)a3 & 0x7FFLL) != 0x7FE)
        {
          *(void *)a3 = *(void *)a3 & 0xFFFFFFFFFFC00000LL | 0x7FE;
          xzm_segment_group_segment_madvise_chunk(v6, a3);
        }
      }
    }

    char v10 = *(_BYTE *)(a3 + 32);
    int v11 = v10 & 0xF;
    if (v11 != 2)
    {
      if (v11 != 5) {
        xzm_segment_group_free_chunk_cold_3(v11);
      }
      *(void *)a3 = *(_DWORD *)a3 | ~(-1LL << *(_DWORD *)(a2 + 68));
    }

    *(_BYTE *)(a3 + 32) = v10 & 0xEF;
    if (v11 == 2) {
      *(void *)a3 = *(void *)a3 & 0xFFFFFFFFC03FFFFFLL | 0x20000000;
    }
    unint64_t v12 = (os_unfair_lock_s *)(*(void *)(v8 + 376) + 16LL * *(unsigned __int8 *)(a2 + 72));
    os_unfair_lock_lock_with_options();
    uint64_t v13 = *(void *)&v12->_os_unfair_lock_opaque;
    *(void *)(a3 + 16) = *(void *)&v12->_os_unfair_lock_opaque;
    if (v13) {
      *(void *)(*(void *)&v12->_os_unfair_lock_opaque + 24LL) = a3 + 16;
    }
    *(void *)&v12->_uint64_t os_unfair_lock_opaque = a3;
    *(void *)(a3 + 24) = v12;
    os_unfair_lock_unlock(v12 + 2);
  }

  else
  {
    int v7 = *(_BYTE *)(a3 + 32) & 0xF;
    if (v7 == 5)
    {
      *(_DWORD *)a3 = 0;
    }

    else
    {
      if (v7 != 2) {
        xzm_segment_group_free_chunk_cold_3(v7);
      }
      *(void *)a3 &= 0xFFFFFFFFFFFFF800LL;
    }

    *(_DWORD *)(a3 + 4) = 0;
    *(_BYTE *)(a3 + 33) = 0;
    xzm_segment_group_free_chunk(*(void *)(a2 + 40), a3, 0);
  }

uint64_t _xzm_ptr_size_outlined(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 232) || !mfm_claimed_address(a2)) {
    return 0LL;
  }
  else {
    return mfm_alloc_size(a2);
  }
}

void _xzm_do_lock_action(os_unfair_lock_s *a1, int a2)
{
  switch(a2)
  {
    case 2:
      a1->_uint64_t os_unfair_lock_opaque = 0;
      break;
    case 1:
      os_unfair_lock_unlock(a1);
      break;
    case 0:
      os_unfair_lock_lock_with_options();
      break;
  }

void _xzm_allocation_slots_do_lock_action(uint64_t a1, int a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 210);
  if (v2 >= 2)
  {
    LODWORD(v5) = *(unsigned __int8 *)(a1 + 211);
    for (unint64_t i = 1LL; i < v2; ++i)
    {
      if ((_DWORD)v5)
      {
        unint64_t v7 = 0LL;
        unint64_t v8 = *(void *)(*(void *)(a1 + 216) + 88 * i + 48);
        do
        {
          unint64_t v9 = *(void *)(a1 + 224) + 32 * (i + v7 * *(unsigned __int8 *)(a1 + 210));
          if (v8 > 0x1000)
          {
            _xzm_do_lock_action((os_unfair_lock_s *)(v9 + 8), a2);
          }

          else
          {
            unint64_t v10 = *(void *)v9;
            if (a2)
            {
              do
                unint64_t v11 = __ldxr((unint64_t *)v9);
              while (__stlxr(v10 & 0xFFFFFFFFFFFFFFFDLL, (unint64_t *)v9));
              if (v11 != v10) {
                _xzm_allocation_slots_do_lock_action_cold_2();
              }
            }

            else
            {
              do
              {
                while ((v10 & 1) != 0)
                {
                  if ((v10 & 2) == 0)
                  {
                    do
                    {
                      unint64_t v17 = __ldxr((unint64_t *)v9);
                      if (v17 != v10)
                      {
                        int v12 = 0;
                        __clrex();
                        goto LABEL_11;
                      }
                    }

                    while (__stxr(v10 | 2, (unint64_t *)v9));
                    int v12 = 1;
LABEL_11:
                    unint64_t v10 = v17;
                    if (!v12) {
                      continue;
                    }
                  }

                  int v13 = __ulock_wait();
                  if (v13 < 0 && v13 != -4)
                  {
                    unsigned int v14 = -v13;
                    if (v14 != 14) {
                      _xzm_allocation_slots_do_lock_action_cold_1(v14);
                    }
                  }

                  unint64_t v10 = *(void *)v9;
                }

                while (1)
                {
                  unint64_t v15 = __ldxr((unint64_t *)v9);
                  if (v15 != v10) {
                    break;
                  }
                  if (!__stxr(v10 | 2, (unint64_t *)v9))
                  {
                    char v16 = 1;
                    goto LABEL_26;
                  }
                }

                char v16 = 0;
                __clrex();
LABEL_26:
                unint64_t v10 = v15;
              }

              while ((v16 & 1) == 0);
            }
          }

          ++v7;
          unint64_t v5 = *(unsigned __int8 *)(a1 + 211);
        }

        while (v7 < v5);
        unsigned int v2 = *(unsigned __int8 *)(a1 + 210);
      }
    }
  }

uint64_t _xzm_xzone_tiny_chunk_block_is_free_slow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 280);
  uint64_t result = os_unfair_lock_lock_with_options();
  unint64_t v8 = *(void *)a2;
LABEL_2:
  unint64_t v9 = v8;
  if ((~(_WORD)v8 & 0x7FE) != 0)
  {
    unint64_t v10 = v8 | 0x40000000;
    do
    {
      unint64_t v8 = __ldxr((unint64_t *)a2);
      if (v8 != v9)
      {
        __clrex();
        goto LABEL_2;
      }
    }

    while (__stxr(v10, (unint64_t *)a2));
    else {
      uint64_t v12 = a3 - v11 + 15;
    }
    unint64_t v13 = v9 & 0x7FF;
    if (v13 - 2046 > 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v14 = 0LL;
    }

    else
    {
      unint64_t v14 = 0LL;
      uint64_t v15 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(a2 + 33);
      unint64_t v16 = *(void *)(v15 + 48) >> 4;
      uint64_t v17 = v12 >> 4;
      unint64_t v18 = v16 * (*(_DWORD *)(v15 + 68) - 1);
      unint64_t v19 = v11 + 8;
      do
      {
        BOOL v20 = v13 % v16 || v13 > v18;
        if (v20 || v14 > 0x3FF) {
          break;
        }
        if (v13 == v17)
        {
          uint64_t v21 = 1LL;
          goto LABEL_28;
        }

        ++v14;
        unint64_t v13 = *(void *)(v19 + 16 * v13) & 0x7FFLL;
      }

      while (v13 - 2046 < 0xFFFFFFFFFFFFFFFELL);
    }

    unint64_t v22 = (v9 >> 11) & 0x7FF;
    if (v14 == v22 && v13 == 2045 || v14 < v22 && v13 == 2044)
    {
      uint64_t v21 = 0LL;
LABEL_28:
      unint64_t v23 = v9 & 0xFFFFFFFFBFFFFFFFLL;
      while (1)
      {
        unint64_t v24 = __ldxr((unint64_t *)a2);
        if (v24 != v10) {
          break;
        }
      }
    }

    else
    {
      qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: corrupt tiny freelist";
      qword_18C528038 = v14;
      __break(1u);
    }

    __clrex();
    qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion success failed (/Library/Caches/com.apple.xbs/Sour"
                               "ces/libmalloc/src/xzone/xzone_malloc.c:2724)";
    __break(1u);
  }

  else
  {
    uint64_t v21 = 1LL;
LABEL_31:
    os_unfair_lock_unlock(v6);
    return v21;
  }

  return result;
}

uint64_t xzm_malloc_zone_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v3 = 0x4000LL;
  }
  if (v3 >> 14) {
    return _xzm_ptr_size_outlined(a1, v2);
  }
  uint64_t v4 = *(void *)(a1 + 232);
  if (!v4) {
    uint64_t v4 = a1;
  }
  uint64_t v5 = *(void *)(v4 + 408);
  if (!v5) {
    return _xzm_ptr_size_outlined(a1, v2);
  }
  uint64_t v6 = *(unsigned int *)(v5 + 4 * v3);
  if (!(_DWORD)v6) {
    return _xzm_ptr_size_outlined(a1, v2);
  }
  uint64_t v7 = v6 << 14;
  unint64_t v8 = a2 - *(void *)(v7 + 48);
  unsigned int v9 = v8 >> 14;
  unint64_t v10 = v7 + 48LL * v9 + 2104;
  if ((*(_BYTE *)(v7 + 48LL * v9 + 2136) & 0xF) == 4)
  {
    unint64_t v19 = v10 - *(unsigned int *)(v7 + 48LL * v9 + 2140);
    unsigned int v20 = *(_BYTE *)(v19 + 32) & 0xF;
    if (v20 <= 8)
    {
      int v21 = 1 << v20;
      if ((v21 & 0x1E8) != 0)
      {
        goto LABEL_39;
      }

      if ((v21 & 6) != 0 && v10 == v19) {
LABEL_39:
      }
        unint64_t v10 = v19;
    }
  }

void xzm_malloc_zone_malloc(uint64_t a1, unint64_t a2)
{
}

void xzm_malloc_zone_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void xzm_malloc_zone_valloc(uint64_t a1, unint64_t a2)
{
}

void xzm_malloc_zone_free(uint64_t a1, unint64_t a2)
{
}

void xzm_malloc_zone_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void xzm_malloc_zone_destroy(mach_vm_address_t a1)
{
  if (*(void *)(a1 + 232))
  {
    unint64_t v2 = (os_unfair_lock_s *)(a1 + 280);
    os_unfair_lock_lock_with_options();
    unint64_t v40 = 0LL;
    if (*(unsigned __int8 *)(a1 + 210) >= 2u)
    {
      unint64_t v3 = 1LL;
      do
      {
        uint64_t v4 = *(void *)(a1 + 216);
        uint64_t v5 = (unint64_t *)(v4 + 88 * v3);
        if (v5[6] <= 0x1000)
        {
          while (1)
          {
            uint64_t v24 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v5 + 2, 1u);
            if (!v24) {
              break;
            }
            if ((*(_BYTE *)(v24 + 32) & 0x40) != 0) {
              xzm_malloc_zone_destroy_cold_2();
            }
            *(void *)v24 &= 0xFFFFFFFFC03FFFFFLL;
            unint64_t v25 = v40;
            *(void *)(v24 + 16) = v40;
            if (v25) {
              *(void *)(v25 + 24) = v24 + 16;
            }
            unint64_t v40 = v24;
            *(void *)(v24 + 24) = &v40;
          }

          unint64_t v26 = v5 + 3;
          while (1)
          {
            uint64_t v27 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v26, 0);
            if (!v27) {
              break;
            }
            unint64_t v28 = v40;
            *(void *)(v27 + 16) = v40;
            *(_BYTE *)(v27 + 32) &= ~0x40u;
            if (v28) {
              *(void *)(v28 + 24) = v27 + 16;
            }
            unint64_t v40 = v27;
            *(void *)(v27 + 24) = &v40;
          }
        }

        else
        {
          unint64_t v6 = *v5;
          if (*v5)
          {
            do
            {
              unint64_t v7 = *(void *)(v6 + 16);
              if (v7)
              {
                *(void *)(v7 + 24) = *(void *)(v6 + 24);
                uint64_t v8 = *(void *)(v6 + 16);
              }

              else
              {
                uint64_t v8 = 0LL;
              }

              **(void **)(v6 + 24) = v8;
              unint64_t v9 = v40;
              *(void *)(v6 + 16) = v40;
              if (v9) {
                *(void *)(v9 + 24) = v6 + 16;
              }
              unint64_t v40 = v6;
              *(void *)(v6 + 24) = &v40;
              unint64_t v6 = v7;
            }

            while (v7);
          }

          unint64_t v10 = v5[1];
          if (v10)
          {
            do
            {
              unint64_t v11 = *(void *)(v10 + 16);
              if (v11)
              {
                *(void *)(v11 + 24) = *(void *)(v10 + 24);
                uint64_t v12 = *(void *)(v10 + 16);
              }

              else
              {
                uint64_t v12 = 0LL;
              }

              **(void **)(v10 + 24) = v12;
              unint64_t v13 = v40;
              *(void *)(v10 + 16) = v40;
              if (v13) {
                *(void *)(v13 + 24) = v10 + 16;
              }
              unint64_t v40 = v10;
              *(void *)(v10 + 24) = &v40;
              unint64_t v10 = v11;
            }

            while (v11);
          }

          unsigned __int8 v14 = *(_BYTE *)(a1 + 211);
          if (v14)
          {
            unint64_t v15 = 0LL;
            unint64_t v16 = (unsigned __int8 *)(v4 + 88 * v3 + 72);
            do
            {
              uint64_t v17 = (unint64_t *)(*(void *)(a1 + 224) + 32 * (*v16 + v15 * *(unsigned __int8 *)(a1 + 210)));
              unint64_t v18 = *v17;
              if (*v17)
              {
                *uint64_t v17 = 0LL;
                unint64_t v19 = v40;
                *(void *)(v18 + 16) = v40;
                if (v19) {
                  *(void *)(v19 + 24) = v18 + 16;
                }
                unint64_t v40 = v18;
                *(void *)(v18 + 24) = &v40;
                unsigned __int8 v14 = *(_BYTE *)(a1 + 211);
              }

              ++v15;
            }

            while (v15 < v14);
          }

          uint64_t v20 = v5[2];
          if (v20)
          {
            do
            {
              uint64_t v21 = *(void *)(v20 + 16);
              if (v21)
              {
                *(void *)(v21 + 24) = *(void *)(v20 + 24);
                uint64_t v22 = *(void *)(v20 + 16);
              }

              else
              {
                uint64_t v22 = 0LL;
              }

              **(void **)(v20 + 24) = v22;
              _xzm_xzone_fresh_chunk_init((uint64_t)v5, v20, 5);
              unint64_t v23 = v40;
              *(void *)(v20 + 16) = v40;
              if (v23) {
                *(void *)(v23 + 24) = v20 + 16;
              }
              unint64_t v40 = v20;
              *(void *)(v20 + 24) = &v40;
              uint64_t v20 = v21;
            }

            while (v21);
          }
        }

        ++v3;
      }

      while (v3 < *(unsigned __int8 *)(a1 + 210));
    }

    os_unfair_lock_unlock(v2);
    uint64_t v29 = *(void *)(a1 + 232);
    unint64_t v30 = v40;
    if (v40)
    {
      do
      {
        unint64_t v31 = *(void *)(v30 + 16);
        char v32 = *(_BYTE *)(v30 + 32);
        int v33 = v32 & 0xF;
        if (v33 == 5)
        {
          xzm_segment_group_segment_madvise_chunk(*(void *)(v30 & 0xFFFFFFFFFFFFC000LL), v30);
          *(_BYTE *)(v30 + 32) &= ~0x20u;
          uint64_t v36 = *(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v30 + 33);
        }

        else
        {
          if (v33 != 2) {
            _xzm_xzone_chunk_free_cold_2(v33);
          }
          unsigned int v34 = *(unsigned __int8 *)(v30 + 33);
          if ((*(void *)v30 & 0x7FFLL) != 0x7FE)
          {
            uint64_t v35 = (uint64_t *)(v30 & 0xFFFFFFFFFFFFC000LL);
            if (*(void *)(*(void *)(a1 + 216) + 88LL * *(unsigned __int8 *)(v30 + 33) + 48) <= 0x400uLL) {
              bzero( (void *)(((0xAAAAAAAAAAAAC000LL * ((v30 - (unint64_t)v35 - 2104) >> 4)) & 0x3FFFFFFFC000LL)
            }
                       + *(void *)((v30 & 0xFFFFFFFFFFFFC000LL) + 0x30)),
                0x4000uLL);
            xzm_segment_group_segment_madvise_chunk(*v35, v30);
            *(void *)unint64_t v30 = *(void *)v30 & 0xFFFFFFFFFFC00000LL | 0x7FE;
            char v32 = *(_BYTE *)(v30 + 32);
            unsigned int v34 = *(unsigned __int8 *)(v30 + 33);
          }

          *(_BYTE *)(v30 + 32) = v32 & 0xDF;
          uint64_t v36 = *(void *)(a1 + 216) + 88LL * v34;
        }

        _xzm_xzone_chunk_free(a1, v36, v30);
        unint64_t v30 = v31;
      }

      while (v31);
    }

    unint64_t v37 = *(void *)(a1 + 288);
    if (v37)
    {
      do
      {
        unint64_t v38 = *(void *)(v37 + 16);
        _xzm_free_large_huge(a1, v37);
        unint64_t v37 = v38;
      }

      while (v38);
    }

    uint64_t v39 = xzm_metapool_alloc(*(void *)(v29 + 400) + 128LL);
    *(_WORD *)uint64_t v39 = *(_WORD *)(a1 + 208);
    os_unfair_lock_lock_with_options();
    *(void *)(v39 + 8) = *(void *)(v29 + 440);
    *(void *)(v29 + 440) = v39;
    os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 448));
    mvm_deallocate_plat(a1, *(void *)(a1 + 200), 0);
  }

void xzm_malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void xzm_malloc_zone_free_definite_size(uint64_t a1, unint64_t a2)
{
}

BOOL xzm_malloc_zone_claimed_address(uint64_t a1, unint64_t a2)
{
  if (mfm_claimed_address(a2)) {
    return 1LL;
  }
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000LL;
  }
  if (v5 >> 14) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  return v7 && *(_DWORD *)(v7 + 4 * v5) != 0;
}

void xzm_malloc_zone_try_free_default(uint64_t a1, unint64_t a2)
{
}

void xzm_malloc_zone_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
}

void xzm_malloc_zone_malloc_type_malloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0LL, a3, 0);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v3 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v3 = a1;
  }
  unint64_t v4 = __clz(a2 - 1);
  unint64_t v5 = (((a2 - 1) >> (61 - v4)) & 3) - 4 * v4 + 488;
  if (a2 <= 0x80) {
    unint64_t v5 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  }
  if (!a2) {
    LOBYTE(v5) = 0;
  }
  uint64_t v6 = v5;
  char v7 = *(_BYTE *)(*(void *)(v3 + 368) + v5);
  if (HIWORD(a3) == 256)
  {
    char v8 = 0;
  }

  else
  {
    if ((a3 & 0xC0000000000LL) != 0x40000000000LL)
    {
      ((void (*)(void))((char *)&loc_1803E362C + 4
                                               * byte_1803F1000[*(unsigned __int8 *)(*(void *)(v3 + 360) + v6) - 3]))();
      return;
    }

    char v8 = 1;
  }

  _xzm_xzone_malloc(a1, a2, (v8 + v7), 0);
}

void xzm_malloc_zone_malloc_type_calloc( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (a3 *= a2, a3 > malloc_absolute_max_size))
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return;
    }
  }

  if (a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, 0LL, a4, 1);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v4 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v4 = a1;
  }
  unint64_t v5 = __clz(a3 - 1);
  unint64_t v6 = (((a3 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a3 <= 0x80) {
    unint64_t v6 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
  }
  if (!a3) {
    LOBYTE(v6) = 0;
  }
  uint64_t v7 = v6;
  char v8 = *(_BYTE *)(*(void *)(v4 + 368) + v6);
  if (HIWORD(a4) == 256)
  {
    char v9 = 0;
  }

  else
  {
    if ((a4 & 0xC0000000000LL) != 0x40000000000LL)
    {
      ((void (*)(void))((char *)&loc_1803E3798 + dword_1803E380C[*(unsigned __int8 *)(*(void *)(v4 + 360) + v7) - 3]))();
      return;
    }

    char v9 = 1;
  }

  _xzm_xzone_malloc(a1, a3, (v9 + v8), 1);
}

void xzm_malloc_zone_malloc_type_memalign( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
}

void xzm_malloc_zone_malloc_type_malloc_with_options( uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5)
{
  if (a2)
  {
    _xzm_memalign(a1, a2, a3, a5, a4 & 1);
    return;
  }

  if (a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, 0LL, a5, a4 & 1);
    return;
  }

  if (*(void *)(a1 + 232)) {
    uint64_t v5 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v5 = a1;
  }
  unint64_t v6 = __clz(a3 - 1);
  unint64_t v7 = (((a3 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
  if (a3 <= 0x80) {
    unint64_t v7 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
  }
  if (!a3) {
    LOBYTE(v7) = 0;
  }
  uint64_t v8 = v7;
  char v9 = *(_BYTE *)(*(void *)(v5 + 368) + v7);
  if (HIWORD(a5) == 256)
  {
    char v10 = 0;
  }

  else
  {
    if ((a5 & 0xC0000000000LL) != 0x40000000000LL)
    {
      ((void (*)(void))((char *)&loc_1803E3920 + 4
                                               * byte_1803F1004[*(unsigned __int8 *)(*(void *)(v5 + 360) + v8) - 3]))();
      return;
    }

    char v10 = 1;
  }

  _xzm_xzone_malloc(a1, a3, (v10 + v9), a4 & 1);
}

unint64_t xzm_malloc_zone_malloc_slow(uint64_t a1, unint64_t a2)
{
  return xzm_malloc_zone_malloc_type_malloc_slow( a1,  a2,  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void xzm_malloc_zone_calloc_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t xzm_malloc_zone_valloc_slow(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = a1;
  if (a2 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  _xzm_memalign(a1, *MEMORY[0x189600148], a2, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), 0);
  uint64_t v4 = v3;
  if (v3 && (*(_BYTE *)(v2 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v4;
}

void xzm_malloc_zone_free_slow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v4 = 0x4000LL;
  }
  else {
    unint64_t v4 = a2 >> 22;
  }
  if (v4 >> 14) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(void *)(v5 + 408);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!(_DWORD)v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7 << 14;
  unint64_t v9 = a2 - *(void *)(v8 + 48);
  unsigned int v10 = v9 >> 14;
  unint64_t v11 = v8 + 48LL * v10 + 2104;
  if ((*(_BYTE *)(v8 + 48LL * v10 + 2136) & 0xF) == 4)
  {
    unint64_t v34 = v11 - *(unsigned int *)(v8 + 48LL * v10 + 2140);
    unsigned int v35 = *(_BYTE *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      int v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        goto LABEL_87;
      }

      if ((v36 & 6) != 0 && v11 == v34) {
LABEL_87:
      }
        unint64_t v11 = v34;
    }
  }

void xzm_malloc_zone_realloc_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t xzm_malloc_zone_memalign_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return xzm_malloc_zone_malloc_type_memalign_slow( a1,  a2,  a3,  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void xzm_malloc_zone_free_definite_size_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v6 = 0x4000LL;
  }
  else {
    unint64_t v6 = a2 >> 22;
  }
  if (v6 >> 14) {
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)(a1 + 232);
  if (!v7) {
    uint64_t v7 = a1;
  }
  uint64_t v8 = *(void *)(v7 + 408);
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = *(unsigned int *)(v8 + 4 * v6);
  if (!(_DWORD)v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9 << 14;
  unint64_t v11 = a2 - *(void *)(v10 + 48);
  unsigned int v12 = v11 >> 14;
  unint64_t v13 = v10 + 48LL * v12 + 2104;
  if ((*(_BYTE *)(v10 + 48LL * v12 + 2136) & 0xF) == 4)
  {
    unint64_t v33 = v13 - *(unsigned int *)(v10 + 48LL * v12 + 2140);
    unsigned int v34 = *(_BYTE *)(v33 + 32) & 0xF;
    if (v34 <= 8)
    {
      int v35 = 1 << v34;
      if ((v35 & 0x1E8) != 0)
      {
        goto LABEL_82;
      }

      if ((v35 & 6) != 0 && v13 == v33) {
LABEL_82:
      }
        unint64_t v13 = v33;
    }
  }

void xzm_malloc_zone_try_free_default_slow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v4 = 0x4000LL;
  }
  else {
    unint64_t v4 = a2 >> 22;
  }
  if (v4 >> 14) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(void *)(v5 + 408);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!(_DWORD)v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7 << 14;
  unint64_t v9 = a2 - *(void *)(v8 + 48);
  unsigned int v10 = v9 >> 14;
  unint64_t v11 = v8 + 48LL * v10 + 2104;
  if ((*(_BYTE *)(v8 + 48LL * v10 + 2136) & 0xF) == 4)
  {
    unint64_t v34 = v11 - *(unsigned int *)(v8 + 48LL * v10 + 2140);
    unsigned int v35 = *(_BYTE *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      int v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        goto LABEL_84;
      }

      if ((v36 & 6) != 0 && v11 == v34) {
LABEL_84:
      }
        unint64_t v11 = v34;
    }
  }

uint64_t xzm_malloc_zone_malloc_with_options_slow( uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  return xzm_malloc_zone_malloc_type_malloc_with_options_slow( a1,  a2,  a3,  a4,  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

unint64_t xzm_malloc_zone_malloc_type_malloc_slow( uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = a1;
  if (a2 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0)
  {
    if (*(void *)(a1 + 232)) {
      a1 = *(void *)(a1 + 232);
    }
    if (*(void *)(a1 + 232)) {
      uint64_t v4 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v4 = a1;
    }
    unint64_t v5 = __clz(a2 - 1);
    unint64_t v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
    if (a2 <= 0x80) {
      unint64_t v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v6) = 0;
    }
    uint64_t v7 = v6;
    char v8 = *(_BYTE *)(*(void *)(v4 + 368) + v6);
    if (HIWORD(a3) == 256)
    {
      char v9 = 0;
    }

    else
    {
      if ((a3 & 0xC0000000000LL) != 0x40000000000LL) {
        __asm { BR              X15 }
      }

      char v9 = 1;
    }

    unsigned int v17 = (v9 + v8);
LABEL_33:
    _xzm_xzone_malloc(a1, a2, v17, 0);
    goto LABEL_34;
  }

  if (a2 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v11 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v11 = a1;
    }
    unint64_t v12 = __clz(a2 - 1);
    unint64_t v13 = (((a2 - 1) >> (61 - v12)) & 3) - 4 * v12 + 488;
    if (a2 <= 0x80) {
      unint64_t v13 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v13) = 0;
    }
    uint64_t v14 = v13;
    char v15 = *(_BYTE *)(*(void *)(v11 + 368) + v13);
    if (HIWORD(a3) == 256)
    {
      char v16 = 0;
    }

    else
    {
      if ((a3 & 0xC0000000000LL) != 0x40000000000LL) {
        __asm { BR              X15 }
      }

      char v16 = 1;
    }

    unsigned int v17 = (v16 + v15);
    goto LABEL_33;
  }

  unint64_t v10 = _xzm_malloc_large_huge(a1, a2, 0LL, a3, 0);
LABEL_34:
  unint64_t v18 = v10;
  if (v10 && (*(_BYTE *)(v3 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v18;
}

void xzm_malloc_zone_malloc_type_calloc_slow( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (a3 *= a2, a3 > malloc_absolute_max_size))
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return;
    }
  }

  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0)
  {
    if (*(void *)(a1 + 232)) {
      a1 = *(void *)(a1 + 232);
    }
    if (*(void *)(a1 + 232)) {
      uint64_t v4 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v4 = a1;
    }
    unint64_t v5 = __clz(a3 - 1);
    unint64_t v6 = (((a3 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
    if (a3 <= 0x80) {
      unint64_t v6 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    if (!a3) {
      LOBYTE(v6) = 0;
    }
    uint64_t v7 = v6;
    char v8 = *(_BYTE *)(*(void *)(v4 + 368) + v6);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000LL) != 0x40000000000LL)
      {
        ((void (*)(void))((char *)&loc_1803E4B58
                        + *((int *)&qword_1803E4CC0[-1]
        return;
      }

void xzm_malloc_zone_malloc_type_realloc_slow( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = a1;
  uint64_t v8 = *(void *)(a1 + 296);
  if ((v8 & 0xA0) == 0)
  {
    xzm_realloc(a1, a2, a3, a4);
    return;
  }

  if (!a2)
  {
    unint64_t v43 = a3;
LABEL_72:
    xzm_malloc_zone_malloc_type_malloc_slow(a1, v43, a4);
    return;
  }

  if (!a3)
  {
    xzm_malloc_zone_free_slow(a1, a2);
    a1 = v7;
    unint64_t v43 = 0LL;
    goto LABEL_72;
  }

  if (a2 >> 36) {
    unint64_t v9 = 0x4000LL;
  }
  else {
    unint64_t v9 = a2 >> 22;
  }
  unint64_t v10 = v9 >> 14;
  if (v9 >> 14) {
    goto LABEL_16;
  }
  uint64_t v11 = *(void *)(a1 + 232);
  if (!v11) {
    uint64_t v11 = a1;
  }
  uint64_t v12 = *(void *)(v11 + 408);
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = *(unsigned int *)(v12 + 4 * v9);
  if (!(_DWORD)v13) {
    goto LABEL_16;
  }
  uint64_t v14 = v13 << 14;
  unint64_t v15 = a2 - *(void *)(v14 + 48);
  unsigned int v16 = v15 >> 14;
  unint64_t v17 = v14 + 48LL * v16 + 2104;
  if ((*(_BYTE *)(v14 + 48LL * v16 + 2136) & 0xF) == 4)
  {
    unint64_t v65 = v17 - *(unsigned int *)(v14 + 48LL * v16 + 2140);
    unsigned int v66 = *(_BYTE *)(v65 + 32) & 0xF;
    if (v66 <= 8)
    {
      int v67 = 1 << v66;
      if ((v67 & 0x1E8) != 0)
      {
        goto LABEL_176;
      }

      if ((v67 & 6) != 0 && v17 == v65) {
LABEL_176:
      }
        unint64_t v17 = v65;
    }
  }

LABEL_17:
  uint64_t v20 = 0LL;
  if ((v8 & 0x80) == 0 || v19) {
    goto LABEL_32;
  }
  if (*(void *)(v7 + 232)) {
    uint64_t v20 = *(void *)(v7 + 232);
  }
  else {
    uint64_t v20 = v7;
  }
  if (v10) {
    goto LABEL_31;
  }
  uint64_t v21 = *(void *)(v20 + 232);
  if (!v21) {
    uint64_t v21 = v20;
  }
  uint64_t v22 = *(void *)(v21 + 408);
  if (!v22) {
    goto LABEL_31;
  }
  uint64_t v23 = *(unsigned int *)(v22 + 4 * v9);
  if (!(_DWORD)v23) {
    goto LABEL_31;
  }
  uint64_t v24 = v23 << 14;
  unint64_t v25 = a2 - *(void *)(v24 + 48);
  unsigned int v26 = v25 >> 14;
  unint64_t v27 = v24 + 48LL * v26 + 2104;
  if ((*(_BYTE *)(v24 + 48LL * v26 + 2136) & 0xF) == 4)
  {
    unint64_t v71 = v27 - *(unsigned int *)(v24 + 48LL * v26 + 2140);
    unsigned int v72 = *(_BYTE *)(v71 + 32) & 0xF;
    if (v72 <= 8)
    {
      int v73 = 1 << v72;
      if ((v73 & 0x1E8) != 0)
      {
        goto LABEL_188;
      }

      if ((v73 & 6) != 0 && v27 == v71) {
LABEL_188:
      }
        unint64_t v27 = v71;
    }
  }

LABEL_51:
    unsigned int v37 = *(_BYTE *)(v36 + 32) & 0xF;
    if (v37 > 7) {
      xzm_segment_group_free_chunk_cold_3(v37);
    }
    int v55 = (os_unfair_lock_s **)(v36 & 0xFFFFFFFFFFFFC000LL);
    unint64_t v56 = a2
        - *(void *)((v36 & 0xFFFFFFFFFFFFC000LL) + 0x30)
        - ((0xAAAAAAAAAAAAC000LL * (((v36 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000LL);
    if (v37 == 5 || v37 == 2)
    {
      uint64_t v58 = *(void *)(v7 + 216) + 88LL * *(unsigned __int8 *)(v36 + 33);
      unint64_t v38 = *(void *)(v58 + 48);
    }

    else
    {
      unint64_t v38 = (unint64_t)*(unsigned int *)(v36 + 40) << 14;
      if (v56 % v38) {
        goto LABEL_53;
      }
    }

    if (v37 == 5)
    {
      if (((*(_DWORD *)v36 >> (v56 / v38)) & 1) == 0) {
        goto LABEL_139;
      }
    }

    else
    {
      if (v37 != 2 || *(void *)a2 != (*(void *)(v7 + 272) ^ a2)) {
        goto LABEL_139;
      }
      unint64_t v77 = v36 & 0xFFFFFFFFFFFFC000LL;
      unint64_t v59 = v36;
      int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v7, v36, a2);
      int v55 = (os_unfair_lock_s **)v77;
      if (!is_free_slow)
      {
        unint64_t v36 = v59;
LABEL_139:
        if (a3 > 0x8000 && v38 > 0x8000)
        {
          if (a3 <= 0x200000 || v38 <= 0x200000)
          {
            if (a3 <= 0x200000 && v38 < 0x200001 && (*(_BYTE *)(v7 + 296) & 0x80) == 0)
            {
              char v64 = xzm_segment_group_try_realloc_large_chunk(*v55, (uint64_t)v55, v36, (a3 + 0x3FFF) >> 14);
LABEL_149:
              unsigned int v39 = (void *)a2;
              if ((v64 & 1) != 0)
              {
LABEL_61:
                if ((v8 & 0x20) != 0 && v19 < a3) {
                  _platform_memset();
                }
                if (v39 != (void *)a2)
                {
                  if ((v8 & 0x20) != 0) {
                    _platform_memset();
                  }
                  if (v20) {
                    uint64_t v42 = v20;
                  }
                  else {
                    uint64_t v42 = v7;
                  }
                  _xzm_free(v42, a2, 0);
                }

                return;
              }
            }
          }

          else if ((*(_BYTE *)(v7 + 296) & 0x80) == 0)
          {
            char v64 = xzm_segment_group_try_realloc_huge_chunk( (uint64_t)*v55,  v7,  (unint64_t)v55,  v36,  (a3 + 0x3FFF) >> 14);
            goto LABEL_149;
          }
        }

LABEL_54:
        if (v38 >= a3)
        {
          unsigned int v39 = (void *)a2;
          if (v38 >> 1 <= a3) {
            goto LABEL_61;
          }
        }

        xzm_malloc(v7, a3, a4, 0);
        unsigned int v39 = v40;
        if (!v40) {
          return;
        }
LABEL_57:
        if (v38 >= a3) {
          size_t v41 = a3;
        }
        else {
          size_t v41 = v38;
        }
        memcpy(v39, (const void *)a2, v41);
        goto LABEL_61;
      }
    }

LABEL_53:
    unint64_t v38 = _xzm_ptr_size_outlined(v7, a2);
    goto LABEL_54;
  }

  if (a3 > 0x8000)
  {
    unint64_t v51 = _xzm_malloc_large_huge(v7, a3, 0LL, a4, 0);
  }

  else
  {
    if (*(void *)(v7 + 232)) {
      uint64_t v44 = *(void *)(v7 + 232);
    }
    else {
      uint64_t v44 = v7;
    }
    if (*(void *)(v44 + 232)) {
      uint64_t v45 = *(void *)(v44 + 232);
    }
    else {
      uint64_t v45 = v44;
    }
    unint64_t v46 = __clz(a3 - 1);
    unint64_t v47 = (((a3 - 1) >> (61 - v46)) & 3) - 4 * v46 + 488;
    if (a3 <= 0x80) {
      unint64_t v47 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    uint64_t v48 = v47;
    char v49 = *(_BYTE *)(*(void *)(v45 + 368) + v47);
    if (HIWORD(a4) == 256)
    {
      char v50 = 0;
    }

    else
    {
      if ((a4 & 0xC0000000000LL) != 0x40000000000LL) {
        __asm { BR              X15 }
      }

      char v50 = 1;
    }

    _xzm_xzone_malloc(v44, a3, (v50 + v49), 0);
  }

  unsigned int v39 = (void *)v51;
  unint64_t v38 = v19;
  if (v51) {
    goto LABEL_57;
  }
}

uint64_t xzm_malloc_zone_malloc_type_memalign_slow( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1;
  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  _xzm_memalign(a1, a2, a3, a4, 0);
  uint64_t v6 = v5;
  if (v5 && (*(_BYTE *)(v4 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v6;
}

uint64_t xzm_malloc_zone_malloc_type_malloc_with_options_slow( uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5)
{
  uint64_t v6 = a1;
  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  xzm_malloc_zone_malloc_type_malloc_with_options(a1, a2, a3, a4, a5);
  uint64_t v8 = v7;
  if ((a4 & 1) == 0 && v7 && (*(_BYTE *)(v6 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v8;
}

void malloc_slowpath_update()
{
  BOOL v3 = has_injected_zone0 != 1
    && malloc_num_zones != 0
    && malloc_check_start == 0
    && lite_zone == 0
    && malloc_tracing_enabled == 0;
  int v4 = !v3
    || (malloc_simple_stack_logging & 1) != 0
    || (malloc_debug_flags & 0x20) != 0
    || malloc_interposition_compat != 0;
}

void __malloc_init(uint64_t a1)
{
  uint64_t v110 = *MEMORY[0x1895FEE08];
  bzero(v108, 0x400uLL);
  int v2 = getpid();
  if (v2 != 1) {
    int v2 = _os_feature_enabled_simple_impl();
  }
  size_t v106 = 1023LL;
  if (v2 && MEMORY[0xFFFFF4084] && !sysctlbyname("kern.bootargs", v108, &v106, 0LL, 0LL) && v106) {
    v108[v106 + 1] = 0;
  }
  uint64_t v3 = *MEMORY[0x189600128];
  if (*MEMORY[0x189600128] <= *MEMORY[0x189600148]) {
    uint64_t v3 = *MEMORY[0x189600148];
  }
  malloc_absolute_max_size = ~(2 * v3);
  int v4 = _malloc_allow_internal_security_policy();
  int v5 = _os_feature_enabled_simple_impl();
  if (((v5 ^ (malloc_zero_policy != 0)) & 1) == 0) {
    malloc_zero_policy = v5 ^ 1;
  }
  else {
    int v6 = 0;
  }
  uint64_t v105 = a1;
  if (a1 && *(void *)a1)
  {
    uint64_t v7 = 0LL;
    do
    {
      if (_platform_strstr() == *(void *)a1)
      {
        if (_platform_strchr())
        {
          uint64_t v8 = 0LL;
          char v9 = 1;
          do
          {
            uint64_t v10 = v8;
            _platform_strlcpy();
            uint64_t v11 = (_BYTE *)_platform_strchr();
            if (v11) {
              *uint64_t v11 = 0;
            }
            malloc_entropy[v10] = strtoull_l(v109, 0LL, 0, 0LL);
            char v12 = v9 & (_platform_strchr() != 0);
            uint64_t v8 = 1LL;
            char v9 = 0;
          }

          while ((v12 & 1) != 0);
          int v13 = v10 + 1;
        }

        else
        {
          int v13 = 0;
        }

        size_t v14 = strlen(*(const char **)a1);
        bzero(*(void **)a1, v14);
        if (v13 == 2) {
          _malloc_entropy_initialized = 1;
        }
      }

      if (_platform_strstr() == *(void *)a1) {
        uint64_t v7 = *(const char **)a1;
      }
      uint64_t v15 = *(void *)(a1 + 8);
      a1 += 8LL;
    }

    while (v15);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if ((_malloc_entropy_initialized & 1) == 0)
  {
    getentropy(malloc_entropy, 0x10uLL);
    _malloc_entropy_initialized = 1;
  }

  if (v7)
  {
    uint64_t v16 = _platform_strchr();
    if (v16)
    {
    }
  }

  unint64_t v17 = malloc_common_value_for_key_copy(v108, "malloc_max_magazines", v109, 0x100uLL);
  if (v17)
  {
    uint64_t v18 = malloc_common_convert_to_long(v17, &v107);
    if (*v107 || v18 < 0) {
      malloc_report(3u, (uint64_t)"malloc_max_magazines must be positive - ignored.\n");
    }
    else {
      max_magazines = v18;
    }
  }

  unint64_t v19 = malloc_common_value_for_key_copy(v108, "malloc_large_expanded_cache_threshold", v109, 0x100uLL);
  if (v19)
  {
    uint64_t v20 = malloc_common_convert_to_long(v19, &v107);
    if (*v107 || v20 < 0) {
      malloc_report(3u, (uint64_t)"malloc_large_expanded_cache_threshold must be positive - ignored.\n");
    }
    else {
      magazine_large_expanded_cache_threshold = v20;
    }
  }

  uint64_t v21 = malloc_common_value_for_key_copy(v108, "malloc_zero_on_free_enabled", v109, 0x100uLL);
  if (v21)
  {
    unint64_t v22 = malloc_common_convert_to_long(v21, &v107);
    if (*v107 || v22 > 1) {
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_enabled must be 0 or 1 - ignored.\n");
    }
    else {
      malloc_zero_policy = v22 == 0;
    }
  }

  uint64_t v23 = malloc_common_value_for_key_copy(v108, "malloc_zero_on_free_sample_period", v109, 0x100uLL);
  if (v23)
  {
    uint64_t v24 = malloc_common_convert_to_long(v23, &v107);
    if (*v107 || v24 < 0) {
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
    }
    else {
      malloc_zero_on_free_sample_period = v24;
    }
  }

  unint64_t v25 = malloc_common_value_for_key_copy(v108, "malloc_secure_allocator", v109, 0x100uLL);
  if (v25)
  {
    unint64_t v26 = malloc_common_convert_to_long(v25, &v107);
    if (*v107 || v26 > 1) {
      malloc_report(3u, (uint64_t)"malloc_secure_allocator must be 0 or 1 - ignored.\n");
    }
    else {
      malloc_xzone_enabled = v26 != 0;
    }
  }

  mvm_aslr_init();
  j__malloc_default_zone();
  phys_ncpus = MEMORY[0xFFFFFC035];
  int v27 = MEMORY[0xFFFFFC036];
  logical_ncpus = MEMORY[0xFFFFFC036];
  unsigned int v28 = MEMORY[0xFFFFFC036] / MEMORY[0xFFFFFC035];
  if (MEMORY[0xFFFFFC036] % MEMORY[0xFFFFFC035]) {
    __malloc_init_cold_2();
  }
  switch(v28)
  {
    case 1u:
      int v29 = 0;
      break;
    case 4u:
      int v29 = 2;
      break;
    case 2u:
      int v29 = 1;
      break;
    default:
      __malloc_init_cold_1();
  }

  hyper_shift = v29;
  else {
    int v30 = max_magazines;
  }
  if (max_magazines) {
    int v31 = v30;
  }
  else {
    int v31 = MEMORY[0xFFFFFC036];
  }
  max_magazines = v31;
  if (!max_medium_magazines) {
    int v27 = v31;
  }
  max_medium_magazines = v27;
  _malloc_detect_interposition();
  uint64_t v32 = *_NSGetEnviron();
  malloc_debug_flags = 256;
  if (!*v32)
  {
LABEL_90:
    dyld_process_is_restricted();
    malloc_print_configure();
    goto LABEL_235;
  }

  uint64_t v33 = v32 + 1;
  while (_platform_strncmp() && _platform_strncmp())
  {
    if (!*v33++) {
      goto LABEL_90;
    }
  }

  if (!issetugid())
  {
    dyld_process_is_restricted();
    malloc_print_configure();
    if (!getenv("MallocGuardEdges")) {
      goto LABEL_100;
    }
    if (_platform_strcmp())
    {
      malloc_debug_flags = malloc_debug_flags & 0xFFFFFFF8 | 3;
      malloc_report(5u, (uint64_t)"adding guard pages for large allocator blocks\n");
      if (getenv("MallocDoNotProtectPrelude"))
      {
        malloc_debug_flags |= 8u;
        malloc_report(5u, (uint64_t)"... but not protecting prelude guard page\n");
      }

      if (!getenv("MallocDoNotProtectPostlude"))
      {
LABEL_100:
        if (getenv("MallocScribble"))
        {
          malloc_debug_flags |= 0x20u;
          malloc_report(5u, (uint64_t)"enabling scribbling to detect mods to free blocks\n");
        }

        if (getenv("MallocErrorAbort"))
        {
          malloc_debug_flags |= 0x40u;
          malloc_report(5u, (uint64_t)"enabling abort() on bad malloc or free\n");
        }

        if (getenv("MallocTracing")) {
          malloc_tracing_enabled = 1;
        }
        if (getenv("MallocSimpleStackLogging")) {
          malloc_simple_stack_logging = 1;
        }
        if (getenv("MallocReportConfig")) {
          malloc_report_config = 1;
        }
        unsigned int v37 = getenv("MallocCheckHeapStart");
        if (!v37)
        {
LABEL_137:
          uint64_t v48 = getenv("MallocMaxMagazines");
          if (!v48)
          {
            uint64_t v48 = getenv("_MallocMaxMagazines");
            if (!v48) {
              goto LABEL_148;
            }
          }

          unsigned int v49 = strtol(v48, 0LL, 0);
          if (v49)
          {
            if ((v49 & 0x80000000) != 0)
            {
              char v50 = "Maximum magazines must be positive - ignored.\n";
              unsigned int v51 = 3;
LABEL_147:
              malloc_report(v51, (uint64_t)v50);
LABEL_148:
              unint64_t v52 = getenv("MallocLargeExpandedCacheThreshold");
              if (v52)
              {
                unint64_t v53 = strtoull(v52, 0LL, 0);
                if (v53)
                {
                  magazine_large_expanded_cache_threshold = v53;
                  uint64_t v54 = "Large expanded cache threshold set to %lly\n";
                }

                else
                {
                  uint64_t v54 = "Large expanded cache threshold defaulted to %lly\n";
                }

                malloc_report(5u, (uint64_t)v54);
              }

              int v55 = getenv("MallocLargeDisableASLR");
              if (v55)
              {
                if (strtoull(v55, 0LL, 0))
                {
                  malloc_report(5u, (uint64_t)"Disabling ASLR slide on large allocations\n");
                  int v56 = malloc_debug_flags | 0x20000000;
                }

                else
                {
                  malloc_report(5u, (uint64_t)"Enabling ASLR slide on large allocations\n");
                  int v56 = malloc_debug_flags & 0xDFFFFFFF;
                }

                malloc_debug_flags = v56;
              }

              int v57 = getenv("MallocSpaceEfficient");
              if (v57)
              {
                uint64_t v58 = v57;
                unint64_t v59 = malloc_common_convert_to_long(v57, v109);
                if (*(char **)v109 == v58 || **(_BYTE **)v109 || v59 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSpaceEfficient must be 0 or 1.\n");
                }

                else
                {
                  aggressive_madvise_enabled = v59 == 1;
                  malloc_space_efficient_enabled = v59 == 1;
                }
              }

              BOOL v60 = getenv("MallocAggressiveMadvise");
              if (v60)
              {
                unint64_t v61 = v60;
                unint64_t v62 = malloc_common_convert_to_long(v60, v109);
                else {
                  aggressive_madvise_enabled = v62 == 1;
                }
              }

              uint64_t v63 = getenv("MallocRecircRetainedRegions");
              if (v63)
              {
                int v64 = strtol(v63, 0LL, 0);
                if (v64 < 1) {
                  malloc_report(3u, (uint64_t)"MallocRecircRetainedRegions must be positive - ignored.\n");
                }
                else {
                  recirc_retained_regions = v64;
                }
              }

              unint64_t v65 = getenv("MallocZeroOnFree");
              if (v65)
              {
                unsigned int v66 = v65;
                unint64_t v67 = malloc_common_convert_to_long(v65, v109);
                else {
                  malloc_zero_policy = v67 == 0;
                }
              }

              unint64_t v68 = getenv("MallocZeroOnAlloc");
              if (v68)
              {
                unsigned int v69 = v68;
                unint64_t v70 = malloc_common_convert_to_long(v68, v109);
                if (*(char **)v109 == v69 || **(_BYTE **)v109 || v70 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocZeroOnAlloc must be 0 or 1.\n");
                }

                else
                {
                  if (v70) {
                    int v71 = 2;
                  }
                  else {
                    int v71 = 1;
                  }
                  malloc_zero_policy = v71;
                }
              }

              unsigned int v72 = getenv("MallocCheckZeroOnFreeCorruption");
              if (v72)
              {
                int v73 = strtol(v72, 0LL, 0);
                if (v73 < 1) {
                  malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
                }
                else {
                  malloc_zero_on_free_sample_period = v73;
                }
              }

              uint64_t v74 = getenv("MallocSecureAllocator");
              if (v74 && malloc_internal_security_policy)
              {
                uint64_t v75 = v74;
                unint64_t v76 = malloc_common_convert_to_long(v74, v109);
                else {
                  malloc_xzone_enabled = v76 != 0;
                }
              }

              unint64_t v77 = getenv("MallocSecureAllocatorNano");
              if (v77)
              {
                char v78 = v77;
                unint64_t v79 = malloc_common_convert_to_long(v77, v109);
                if (*(char **)v109 == v78 || **(_BYTE **)v109 || v79 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorNano must be 0 or 1.\n");
                }

                else
                {
                  if (v79) {
                    int v80 = 2;
                  }
                  else {
                    int v80 = 1;
                  }
                  malloc_xzone_nano_override = v80;
                }
              }

              uint64_t v81 = getenv("MallocNanoOnXzone");
              if (v81)
              {
                uint64_t v82 = v81;
                unint64_t v83 = malloc_common_convert_to_long(v81, v109);
                if (*(char **)v109 == v82 || **(_BYTE **)v109 || v83 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocNanoOnXzone must be 0 or 1.\n");
                }

                else
                {
                  if (v83) {
                    int v84 = 2;
                  }
                  else {
                    int v84 = 1;
                  }
                  malloc_nano_on_xzone_override = v84;
                }
              }

              uint64_t v85 = getenv("MallocSecureAllocatorCreateMzones");
              int v86 = malloc_internal_security_policy;
              if (v85 && malloc_internal_security_policy)
              {
                v87 = v85;
                unint64_t v88 = malloc_common_convert_to_long(v85, v109);
                else {
                  xzm_create_mzones = v88 != 0;
                }
                int v86 = malloc_internal_security_policy;
              }

              uint64_t v89 = getenv("MallocSecureAllocatorPurgeableZone");
              if (v89 && v86)
              {
                unint64_t v90 = v89;
                unint64_t v91 = malloc_common_convert_to_long(v89, v109);
                else {
                  purgeable_zone_use_xzunint64_t m = v91 != 0;
                }
              }

              if (getenv("MallocHelp")) {
                malloc_report( 5u,  (uint64_t)"environment variables that can be set for debug:\n - MallocLogFile <f> to create/append messages to file <f> instead of stderr\n - MallocGuardEdges to add 2 guard pages for each large block\n - MallocDoNotProtectPrelude to disable protection (when previous flag set)\n - MallocDoNotProtectPostlude to disable protection (when previous flag set)\n - MallocStackLogging to record all stacks.  Tools like leaks can then be applied\n - MallocStackLoggingNoCompact to record all stacks.  Needed for malloc_history\n - MallocStackLoggingDirectory to set location of stack logs, which can grow large; default is"
              }
                           " /tmp\n"
                           "- MallocScribble to detect writing on free blocks and missing initializers:\n"
                           "  0x55 is written upon free and 0xaa is written on allocation\n"
                           "- MallocCheckHeapStart <n> to start checking the heap after <n> operations\n"
                           "- MallocCheckHeapEach <s> to repeat the checking of the heap after <s> operations\n"
                           "- MallocCheckHeapSleep <t> to sleep <t> seconds on heap corruption\n"
                           "- MallocCheckHeapAbort <b> to abort on heap corruption if <b> is non-zero\n"
                           "- MallocCorruptionAbort to abort on malloc errors, but not on out of memory for 32-bit proces"
                           "ses\n"
                           "  MallocCorruptionAbort is always set on 64-bit processes\n"
                           "- MallocErrorAbort to abort on any malloc error, including out of memory\n"
                           "- MallocTracing to emit kdebug trace points on malloc entry points\n"
                           "- MallocZeroOnFree to enable or disable zero-on-free behavior (for debugging only)\n"
                           "- MallocCheckZeroOnFreeCorruption to enable zero-on-free corruption detection\n"
                           "- MallocHelp - this help!\n");
              goto LABEL_235;
            }

            if (logical_ncpus >= v49)
            {
              max_magazines = v49;
              char v50 = "Maximum magazines set to %d\n";
            }

            else
            {
              max_magazines = logical_ncpus;
              char v50 = "Maximum magazines limited to number of logical CPUs (%d)\n";
            }
          }

          else
          {
            char v50 = "Maximum magazines defaulted to %d\n";
          }

          unsigned int v51 = 5;
          goto LABEL_147;
        }

        unsigned int v38 = strtoul(v37, 0LL, 0);
        if (v38 <= 1) {
          int v39 = 1;
        }
        else {
          int v39 = v38;
        }
        if (v39 == -1) {
          int v40 = 1;
        }
        else {
          int v40 = v39;
        }
        malloc_check_start = v40;
        size_t v41 = getenv("MallocCheckHeapEach");
        if (v41)
        {
          unsigned int v42 = strtoul(v41, 0LL, 0);
          if (v42 <= 1) {
            int v43 = 1;
          }
          else {
            int v43 = v42;
          }
          if (v43 == -1) {
            int v43 = 1;
          }
          malloc_check_each = v43;
        }

        malloc_report(5u, (uint64_t)"checks heap after operation #%d and each %d operations\n");
        uint64_t v44 = getenv("MallocCheckHeapAbort");
        if (v44)
        {
          malloc_check_abort = strtol(v44, 0LL, 0);
          if (malloc_check_abort)
          {
LABEL_126:
            uint64_t v45 = "will abort on heap corruption\n";
LABEL_136:
            malloc_report(5u, (uint64_t)v45);
            goto LABEL_137;
          }
        }

        else if (malloc_check_abort)
        {
          goto LABEL_126;
        }

        unint64_t v46 = getenv("MallocCheckHeapSleep");
        if (v46)
        {
          int v47 = strtol(v46, 0LL, 0);
          malloc_check_sleep = v47;
        }

        else
        {
          int v47 = malloc_check_sleep;
        }

        if (v47 < 1)
        {
          if (v47 < 0) {
            uint64_t v45 = "will sleep once for %d seconds on heap corruption\n";
          }
          else {
            uint64_t v45 = "no sleep on heap corruption\n";
          }
        }

        else
        {
          uint64_t v45 = "will sleep for %d seconds on heap corruption\n";
        }

        goto LABEL_136;
      }

      int v35 = malloc_debug_flags | 0x10;
      unint64_t v36 = "... but not protecting postlude guard page\n";
    }

    else
    {
      int v35 = malloc_debug_flags & 0xFFFFFFE0 | 7;
      unint64_t v36 = "adding guard pages to all regions\n";
    }

    malloc_debug_flags = v35;
    malloc_report(5u, (uint64_t)v36);
    goto LABEL_100;
  }

LABEL_235:
  malloc_sanitizer_enabled = sanitizer_should_enable();
  uint64_t v92 = (uint64_t *)_NSGetEnviron();
  uint64_t v93 = *v92;
  if (!malloc_sanitizer_enabled && !(malloc_debug_flags & 0x20 | malloc_zero_on_free_sample_period)) {
    nano_common_init(*v92, v105, v108);
  }
  char v94 = _os_feature_enabled_simple_impl();
  if (malloc_xzone_nano_override == 2)
  {
    char v94 = 1;
  }

  else if (malloc_xzone_nano_override == 1)
  {
    char v94 = 0;
  }

  if (malloc_nano_on_xzone_override == 2) {
    char v95 = 0;
  }
  else {
    char v95 = v94;
  }
  int v96 = malloc_xzone_enabled;
  if (malloc_xzone_enabled) {
    BOOL v97 = _malloc_engaged_nano == 2;
  }
  else {
    BOOL v97 = 0;
  }
  if (v97) {
    char v98 = v95;
  }
  else {
    char v98 = 1;
  }
  if ((v98 & 1) == 0)
  {
    int v99 = _os_feature_enabled_simple_impl();
    if (malloc_nano_on_xzone_override == 2)
    {
      int v99 = 1;
    }

    else if (malloc_nano_on_xzone_override == 1)
    {
      int v99 = 0;
    }

    if (!v99)
    {
      char v100 = 0;
      malloc_xzone_enabled = 0;
      goto LABEL_263;
    }

    int v96 = malloc_xzone_enabled;
  }

  char v100 = v98 ^ 1;
  if (v96)
  {
    mfm_initialize();
    initial_xzone_uint64_t zone = xzm_main_malloc_zone_create(malloc_debug_flags, v93, v105, v108);
    malloc_set_zone_name((malloc_zone_t *)initial_xzone_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_xzone_zone, 1);
  }

LABEL_263:
  if ((v100 & 1) == 0 && initial_xzone_zone) {
    goto LABEL_277;
  }
  if (!initial_xzone_zone)
  {
    initial_scalable_uint64_t zone = create_scalable_zone(0LL, malloc_debug_flags);
    malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_scalable_zone, 1);
  }

  nano_common_configure();
  if (initial_xzone_zone) {
    v102 = (malloc_zone_t *)initial_xzone_zone;
  }
  else {
    v102 = (malloc_zone_t *)initial_scalable_zone;
  }
  if (_malloc_engaged_nano != 2)
  {
    uint64_t zone = (malloc_zone_t *)initial_nano_zone;
    if (!initial_nano_zone) {
      goto LABEL_277;
    }
    goto LABEL_276;
  }

  if (malloc_report_config == 1) {
    malloc_report(5u, (uint64_t)"NanoV2 Config:\n\tNano On Xzone: %d\n");
  }
  uint64_t zone = (malloc_zone_t *)nanov2_create_zone((uint64_t)v102, malloc_debug_flags, v101);
  initial_nano_uint64_t zone = (uint64_t)zone;
  if (zone)
  {
LABEL_276:
    malloc_set_zone_name(zone, "DefaultMallocZone");
    malloc_set_zone_name(v102, "MallocHelperZone");
    malloc_zone_register_while_locked(initial_nano_zone, 1);
  }

LABEL_277:
  if (malloc_sanitizer_enabled)
  {
    mach_vm_address_t v104 = sanitizer_create_zone(*(void *)malloc_zones);
    malloc_zone_register_while_locked(v104, 1);
  }

  malloc_slowpath_update();
  initial_num_zones = malloc_num_zones;
  if (malloc_report_config == 1)
  {
    if (initial_scalable_zone) {
      malloc_report( 5u,  (uint64_t)"Magazine Config:\n \tMax Magazines: %d\n \tMedium Enabled: %d\n \tAggressive Madvise: %d\n \tScribble: %d\n");
    }
  }

uint64_t __malloc_late_init(uint64_t a1)
{
  if ((has_injected_zone0 & 1) == 0 && !malloc_sanitizer_enabled && pgm_should_enable())
  {
    uint64_t zone = pgm_create_zone(*(void *)malloc_zones, v2, v3);
    malloc_zone_register_while_locked(zone, 1);
  }

  unint64_t v5 = *(void *)a1;
  _dlopeuint64_t n = *(uint64_t (**)(void, void))(a1 + 8);
  _dlsyunint64_t m = *(uint64_t (**)(void, void))(a1 + 16);
  if (v5 >= 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      __int128 v7 = *(_OWORD *)v6;
      __int128 v8 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)&xmmword_18C528070 = *(_OWORD *)(v6 + 16);
      *(_OWORD *)&off_18C528080 = v8;
      msl = v7;
      __int128 v9 = *(_OWORD *)(v6 + 48);
      __int128 v10 = *(_OWORD *)(v6 + 64);
      __int128 v11 = *(_OWORD *)(v6 + 80);
      qword_18C5280C0 = *(void *)(v6 + 96);
      xmmword_18C5280A0 = v10;
      unk_18C5280B0 = v11;
      xmmword_18C528090 = v9;
    }
  }

  char v12 = _NSGetEnviron();
  int v13 = (uint64_t *)*v12;
  uint64_t result = (uint64_t)**v12;
  if (result)
  {
    uint64_t v15 = v13 + 1;
    while (_platform_strncmp())
    {
      uint64_t v16 = *v15++;
      uint64_t result = v16;
      if (!v16) {
        goto LABEL_15;
      }
    }

    uint64_t result = _malloc_register_stack_logger(1);
    unint64_t v17 = (uint64_t (*)(char **))xmmword_18C528090;
    if ((void)xmmword_18C528090)
    {
      uint64_t v18 = _NSGetEnviron();
      uint64_t result = v17(*v18);
    }
  }

BOOL has_default_zone0()
{
  return (has_injected_zone0 & 1) == 0;
}

void *find_registered_zone(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  if (malloc_num_zones)
  {
    if (lite_zone && (uint64_t v6 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
    {
      if (a2) {
        *a2 = v6;
      }
      return default_zone;
    }

    else if (initial_num_zones <= a3)
    {
LABEL_11:
      __int128 v10 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      uint64_t v11 = malloc_num_zones;
      uint64_t v12 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_14:
        uint64_t v7 = 0LL;
        uint64_t v13 = 0LL;
      }

      else
      {
        while (1)
        {
          uint64_t v7 = *((void *)malloc_zones + v12);
          uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
          if (v13) {
            break;
          }
          if (v11 == ++v12) {
            goto LABEL_14;
          }
        }
      }

      if (a2) {
        *a2 = v13;
      }
      OSAtomicDecrement32Barrier(v10);
    }

    else
    {
      uint64_t v8 = a3;
      while (1)
      {
        uint64_t v7 = *((void *)malloc_zones + v8);
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
        if (v9) {
          break;
        }
      }

      if (a2) {
        *a2 = v9;
      }
      if (!v8 && !has_injected_zone0) {
        return default_zone;
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    if (a2) {
      *a2 = 0LL;
    }
  }

  return (void *)v7;
}

  ;
}

uint64_t malloc_gdb_po_unsafe()
{
  uint64_t v1 = malloc_num_zones;
  if (malloc_num_zones)
  {
    for (unint64_t i = (char *)malloc_zones; ; i += 8)
    {
      if (*(_DWORD *)(*(void *)i + 104LL) >= 5u)
      {
        uint64_t v3 = *(unsigned int (**)(void))(*(void *)(*(void *)i + 96LL) + 64LL);
        if (v3)
        {
          if (v3()) {
            break;
          }
        }
      }

      if (!--v1) {
        return 0LL;
      }
    }

    return 1LL;
  }

  return 0LL;
}

void malloc_zone_register_while_locked(uint64_t a1, int a2)
{
  if (malloc_num_zones)
  {
    int v4 = malloc_zones;
    int v5 = malloc_num_zones;
    while (*v4 != a1)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_5;
      }
    }

    __int128 v10 = "Attempted to register zone more than once: %p\n";
    goto LABEL_10;
  }

LABEL_5:
  if (malloc_num_zones == malloc_num_zones_allocated)
  {
    size_t v6 = 8LL * malloc_num_zones;
    uint64_t v7 = (void *)MEMORY[0x189600148];
    mach_vm_size_t v8 = (v6 - 1 + 2LL * *MEMORY[0x189600148]) & -*MEMORY[0x189600148];
    mach_vm_address_t address = *MEMORY[0x189600148];
    uint64_t v9 = (vm_map_t *)MEMORY[0x1895FFD48];
    if (mach_vm_allocate(*MEMORY[0x1895FFD48], &address, v8, 16777217))
    {
      __int128 v10 = "malloc_zone_register allocation failed: %d\n";
LABEL_10:
      malloc_report(3u, (uint64_t)v10);
      return;
    }

    uint64_t v11 = (void *)address;
    if (malloc_zones)
    {
      mach_vm_address_t v13 = address;
      memcpy((void *)address, malloc_zones, v6);
      mach_vm_address_t address = (mach_vm_address_t)malloc_zones;
      mach_vm_deallocate(*v9, (mach_vm_address_t)malloc_zones, (v6 - 1 + *v7) & -*v7);
      uint64_t v11 = (void *)v13;
    }

    malloc_zones = v11;
    malloc_num_zones_allocated = v8 >> 3;
  }

  else
  {
    mach_vm_size_t v8 = 8LL * malloc_num_zones_allocated;
    mprotect(malloc_zones, v8, 3);
  }

  if (a2)
  {
    memcpy((char *)malloc_zones + 8, malloc_zones, 8LL * malloc_num_zones);
    uint64_t v12 = malloc_zones;
  }

  else
  {
    uint64_t v12 = (void *)((char *)malloc_zones + 8 * malloc_num_zones);
  }

  *uint64_t v12 = a1;
  OSAtomicIncrement32Barrier(&malloc_num_zones);
  mprotect(malloc_zones, v8, 1);
  if (a2)
  {
    if (*(void *)malloc_zones != a1)
    {
      has_injected_zone0 = 1;
      malloc_slowpath_update();
    }
  }

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)default_zone;
}

uint64_t zeroify_scalable_zone(uint64_t result)
{
  if (default_zone == (_UNKNOWN *)result)
  {
    *(void *)(result + 24) = legacy_zeroing_large_malloc;
    *(void *)(result + 40) = legacy_zeroing_large_valloc;
  }

  return result;
}

uint64_t legacy_zeroing_large_malloc(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (a2 < 0x1FC01)
  {
    if (!lite_zone) {
      uint64_t v2 = *(void *)malloc_zones;
    }
    return (*(uint64_t (**)(uint64_t, unint64_t))(v2 + 24))(v2, a2);
  }

  else
  {
    if (!lite_zone) {
      uint64_t v2 = *(void *)malloc_zones;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v2 + 32))(v2, 1LL, a2);
  }

uint64_t legacy_zeroing_large_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (!lite_zone) {
    uint64_t v2 = *(void *)malloc_zones;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v2, a2);
  _platform_memset();
  return v3;
}

uint64_t malloc_engaged_nano()
{
  if (initial_nano_zone | initial_xzone_zone) {
    return _malloc_engaged_nano;
  }
  else {
    return 0LL;
  }
}

BOOL malloc_engaged_secure_allocator()
{
  return initial_xzone_zone != 0;
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  if (malloc_absolute_max_size < start_size) {
    return 0LL;
  }
  if (initial_xzone_zone) {
    BOOL v5 = xzm_create_mzones == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5
    || (scalable_uint64_t zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | flags, initial_xzone_zone)) == 0LL)
  {
    scalable_uint64_t zone = (malloc_zone_t *)create_scalable_zone(start_size, malloc_debug_flags | flags);
  }

  if ((flags & 0x400) != 0 || has_injected_zone0 || malloc_sanitizer_enabled || !pgm_should_enable())
  {
    malloc_zone_register(scalable_zone);
  }

  else
  {
    uint64_t zone = (malloc_zone_t *)pgm_create_zone((uint64_t)scalable_zone, v6, v7);
    os_unfair_lock_lock_with_options();
    malloc_zone_register_while_locked((uint64_t)zone, 0);
    malloc_zone_register_while_locked((uint64_t)scalable_zone, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    return zone;
  }

  return scalable_zone;
}

void malloc_zone_register(malloc_zone_t *zone)
{
}

void malloc_create_legacy_default_zone()
{
  legacy_scalable_uint64_t zone = (malloc_zone_t *)create_legacy_scalable_zone(0LL, malloc_debug_flags);
  os_unfair_lock_lock_with_options();
  uint64_t v1 = *(malloc_zone_t **)malloc_zones;
  malloc_set_zone_name(legacy_scalable_zone, "DefaultMallocZone");
  malloc_zone_register_while_locked((uint64_t)legacy_scalable_zone, 1);
  os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  if (zone->version >= 0xE && LODWORD(zone->introspect[1].check) == 1)
  {
    char v4 = 1;
  }

  else
  {
    mprotect(zone, 0xC8uLL, 3);
    char v4 = 0;
  }

  zone_name = zone->zone_name;
  if (zone_name)
  {
    if (!malloc_num_zones)
    {
LABEL_24:
      zone->zone_name = 0LL;
      goto LABEL_25;
    }

    if (initial_num_zones)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        uint64_t v6 = (uint64_t (**)(void *, const char *))*((void *)malloc_zones + v7);
        if (v6[2](v6, zone_name)) {
          break;
        }
      }

      if (!v7 && (has_injected_zone0 & 1) == 0)
      {
LABEL_9:
        uint64_t v6 = (uint64_t (**)(void *, const char *))default_zone;
        if (!default_zone) {
          goto LABEL_24;
        }
      }
    }

    else
    {
LABEL_15:
      mach_vm_size_t v8 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      uint64_t v9 = malloc_num_zones;
      uint64_t v10 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_18:
        uint64_t v6 = 0LL;
      }

      else
      {
        while (1)
        {
          uint64_t v6 = (uint64_t (**)(void *, const char *))*((void *)malloc_zones + v10);
          if (v6[2](v6, zone_name)) {
            break;
          }
          if (v9 == ++v10) {
            goto LABEL_18;
          }
        }
      }

      OSAtomicDecrement32Barrier(v8);
      if (!v6) {
        goto LABEL_24;
      }
    }

    malloc_zone_free((malloc_zone_t *)v6, (void *)zone->zone_name);
    goto LABEL_24;
  }

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
  if (malloc_num_zones)
  {
    os_unfair_lock_lock_with_options();
    if (malloc_num_zones)
    {
      uint64_t v2 = 0LL;
      while (*(malloc_zone_t **)((char *)malloc_zones + v2) != zone)
      {
        v2 += 8LL;
      }

      size_t v3 = 8LL * malloc_num_zones_allocated;
      mprotect(malloc_zones, v3, 3);
      uint64_t v4 = malloc_num_zones - 1LL;
      *(void *)((char *)malloc_zones + v2) = *((void *)malloc_zones + v4);
      malloc_num_zones = v4;
      mprotect(malloc_zones, v3, 1);
      unsigned int v5 = malloc_num_zones;
      if (v5 <= 1) {
        unsigned int v5 = 1;
      }
      initial_num_zones = v5;
      uint64_t v6 = (int *)pFRZCounterLive;
      pFRZCounterLive = (uint64_t)pFRZCounterDrain;
      pFRZCounterDraiuint64_t n = v6;
      OSMemoryBarrier();
      while (*pFRZCounterDrain)
        MEMORY[0x186DFB0AC](0LL, 1LL, 1LL);
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    }

    else
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
      malloc_report(3u, (uint64_t)"*** malloc_zone_unregister() failed for %p\n");
    }
  }

void malloc_zone_check_fail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _simple_salloc();
  if (v4)
  {
    _simple_sprintf();
    if (!qword_18C52A160) {
      goto LABEL_13;
    }
    _simple_sappend();
    if (_MergedGlobals >= 2)
    {
      uint64_t v5 = 1LL;
      do
      {
        unint64_t v6 = v5 + 1;
        _simple_sprintf();
        uint64_t v5 = v6;
      }

      while (v6 < _MergedGlobals);
    }

    _simple_string();
    uint64_t v7 = "%s\n(Use 'atos' for a symbolic stack)\n";
  }

  else
  {
    malloc_report(0x10u, (uint64_t)"*** MallocCheckHeap: FAILED check at operation #%d\n");
    if (!qword_18C52A160) {
      goto LABEL_13;
    }
    malloc_report(0x10u, (uint64_t)"Stack for last operation where the malloc check succeeded: ");
    if (_MergedGlobals >= 2)
    {
      uint64_t v8 = 1LL;
      do
      {
        unint64_t v9 = v8 + 1;
        malloc_report(0x10u, (uint64_t)"%p ");
        uint64_t v8 = v9;
      }

      while (v9 < _MergedGlobals);
    }

    uint64_t v7 = "\n(Use 'atos' for a symbolic stack)\n";
  }

  malloc_report(0x10u, (uint64_t)v7);
LABEL_13:
  if (malloc_check_each >= 2) {
    malloc_report( 0x10u,  (uint64_t)"*** Recommend using 'setenv MallocCheckHeapStart %d; setenv MallocCheckHeapEach %d' to narrow down failure\n");
  }
  if (v4) {
    _simple_sfree();
  }
  if (malloc_check_abort)
  {
    unsigned int v10 = 0;
    unsigned int v11 = 211;
  }

  else
  {
    if (malloc_check_sleep < 1)
    {
      if (malloc_check_sleep < 0)
      {
        malloc_report(5u, (uint64_t)"*** Will sleep once for %d seconds to leave time to attach\n");
        unsigned int v10 = -malloc_check_sleep;
        malloc_check_sleep = 0;
      }

      else
      {
        unsigned int v10 = 0;
      }
    }

    else
    {
      malloc_report(5u, (uint64_t)"*** Will sleep for %d seconds to leave time to attach\n");
      unsigned int v10 = malloc_check_sleep;
    }

    unsigned int v11 = 147;
  }

  malloc_vreport(v11, v10, a1, 0LL, a2);
}

uint64_t _malloc_zone_malloc(uint64_t a1, unint64_t a2, char a3)
{
  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0) {
    a1 = *(void *)malloc_zones;
  }
  if (malloc_slowpath) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_logger == 0LL;
  }
  if (!v4) {
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  }
  unsigned int v5 = *(_DWORD *)(a1 + 104);
  if (v5 <= 0xC) {
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  }
  if (malloc_absolute_max_size < a2)
  {
    if ((a3 & 1) != 0) {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    }
    return 0LL;
  }

  else if (v5 < 0x10)
  {
    return (*(uint64_t (**)(void))(a1 + 24))();
  }

  else
  {
    return (*(uint64_t (**)(void))(a1 + 160))();
  }

uint64_t _malloc_zone_malloc_instrumented_or_legacy(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  if (!v8) {
    *(void *)(StatusReg + 904) = (v3 >> 2);
  }
  int v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {

  }
    internal_check();
  if (malloc_absolute_max_size >= a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, a2);
    if (malloc_logger) {
      malloc_logger(10LL, a1, a2, 0LL, v10, 0LL);
    }
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"malloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }

    else if (!v9)
    {
      goto LABEL_14;
    }

    kdebug_trace();
    if (!v8) {
      goto LABEL_19;
    }
LABEL_15:
    if (v10) {
      return v10;
    }
    goto LABEL_21;
  }

  uint64_t v10 = 0LL;
  if (v8) {
    goto LABEL_15;
  }
LABEL_19:
  *(void *)(StatusReg + 904) = 0LL;
  if (v10) {
    return v10;
  }
LABEL_21:
  if ((a3 & 1) != 0) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v10;
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_malloc((uint64_t)zone, size, 0);
}

uint64_t _malloc_zone_calloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0) {
    a1 = *(void *)malloc_zones;
  }
  if (malloc_slowpath) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_logger == 0LL;
  }
  if (!v6) {
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 104);
  if (v7 <= 0xC) {
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  }
  if (v7 < 0x10) {
    return (*(uint64_t (**)(void))(a1 + 32))();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 168))(a1, a2, a3, (v4 >> 2));
}

uint64_t _malloc_zone_calloc_instrumented_or_legacy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = a4;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v10 = *(void *)(StatusReg + 904);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = (v4 >> 2);
    *(void *)(StatusReg + 904) = v11;
  }

  int v12 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {

  }
    internal_check();
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a1, a2, a3, a4, v11);
  if (malloc_logger) {
    malloc_logger(74LL, a1, a3 * a2, 0LL, v13, 0LL);
  }
  if (malloc_simple_stack_logging == 1)
  {
    malloc_report(0x325u, (uint64_t)"calloc (%p/%llu*%llu): ");
    if (!v12)
    {
LABEL_11:
      if (v10) {
        goto LABEL_12;
      }
      goto LABEL_16;
    }
  }

  else if (!v12)
  {
    goto LABEL_11;
  }

  kdebug_trace();
  if (v10)
  {
LABEL_12:
    if (v13) {
      return v13;
    }
    goto LABEL_18;
  }

LABEL_16:
  *(void *)(StatusReg + 904) = 0LL;
  if (v13) {
    return v13;
  }
LABEL_18:
  if ((v5 & 1) != 0) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v13;
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)_malloc_zone_calloc((uint64_t)zone, num_items, size, 0LL);
}

uint64_t _malloc_zone_valloc(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  if (!v8) {
    *(void *)(StatusReg + 904) = (v3 >> 2);
  }
  int v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {

  }
    internal_check();
  if (malloc_absolute_max_size >= a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 40))(a1, a2);
    if (malloc_logger) {
      malloc_logger(10LL, a1, a2, 0LL, v10, 0LL);
    }
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"valloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }

    else if (!v9)
    {
      goto LABEL_14;
    }

    kdebug_trace();
    if (!v8) {
      goto LABEL_19;
    }
LABEL_15:
    if (v10) {
      return v10;
    }
    goto LABEL_21;
  }

  uint64_t v10 = 0LL;
  if (v8) {
    goto LABEL_15;
  }
LABEL_19:
  *(void *)(StatusReg + 904) = 0LL;
  if (v10) {
    return v10;
  }
LABEL_21:
  if ((a3 & 1) != 0) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v10;
}

void *__cdecl malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
}

uint64_t _malloc_zone_realloc(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  uint64_t v9 = v8;
  if (!v8)
  {
    *(void *)(StatusReg + 904) = a4;
    uint64_t v9 = a4;
  }

  int v10 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {

  }
    internal_check();
  if (malloc_absolute_max_size < a3)
  {
    uint64_t v11 = 0LL;
    if (!v8) {
      goto LABEL_15;
    }
    return v11;
  }

  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 56))(a1, a2, a3, a4, v9);
  if (malloc_logger) {
    malloc_logger(14LL, a1, a2, a3, v11, 0LL);
  }
  if (malloc_simple_stack_logging != 1)
  {
    if (!v10) {
      goto LABEL_14;
    }
LABEL_18:
    kdebug_trace();
    if (v8) {
      return v11;
    }
    goto LABEL_15;
  }

  malloc_report(0x325u, (uint64_t)"realloc (%p->%p/%llu): ");
  if (v10) {
    goto LABEL_18;
  }
LABEL_14:
  if (!v8) {
LABEL_15:
  }
    *(void *)(StatusReg + 904) = 0LL;
  return v11;
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, (v3 >> 2));
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_logger) {
    malloc_logger(12LL, zone, ptr, 0LL, 0LL, 0LL);
  }
  if (malloc_simple_stack_logging == 1) {
    malloc_report(0x325u, (uint64_t)"malloc_zone_free (%p): ");
  }
  if (malloc_check_start) {

  }
    internal_check();
  ((void (*)(malloc_zone_t *, void *))zone->free)(zone, ptr);
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  uint64_t v1 = 0LL;
  if (ptr && malloc_num_zones)
  {
    if (lite_zone && (*(uint64_t (**)(void))(lite_zone + 16))())
    {
      return (malloc_zone_t *)default_zone;
    }

    else if (initial_num_zones)
    {
      uint64_t v3 = 0LL;
      while (1)
      {
        uint64_t v1 = *((void *)malloc_zones + v3);
      }

      if (!v3 && !has_injected_zone0) {
        return (malloc_zone_t *)default_zone;
      }
    }

    else
    {
LABEL_10:
      unint64_t v4 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      uint64_t v5 = malloc_num_zones;
      uint64_t v6 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_13:
        uint64_t v1 = 0LL;
      }

      else
      {
        while (1)
        {
          uint64_t v1 = *((void *)malloc_zones + v6);
          if (v5 == ++v6) {
            goto LABEL_13;
          }
        }
      }

      OSAtomicDecrement32Barrier(v4);
    }
  }

  return (malloc_zone_t *)v1;
}

uint64_t _malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = a4;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(void *)(StatusReg + 904);
  uint64_t v12 = v11;
  if (!v11)
  {
    *(void *)(StatusReg + 904) = a5;
    uint64_t v12 = a5;
  }

  int v13 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (*(_DWORD *)(a1 + 104) < 5u) {
    goto LABEL_9;
  }
  if (malloc_check_start) {

  }
    internal_check();
  if (malloc_absolute_max_size < a3) {
    goto LABEL_9;
  }
  uint64_t v14 = 0LL;
  int v15 = 22;
  if (a2 >= 8)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] <= 1uLL)
    {
      if (((a2 - 1) & a3) == 0 || (v6 & 2) == 0)
      {
        uint64_t v18 = *(uint64_t (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(a1 + 112);
        if (v18)
        {
          uint64_t v14 = v18(a1, a2, a3, a4, v12);
          if (malloc_logger) {
            malloc_logger(10LL, a1, a3, 0LL, v14, 0LL);
          }
          if (malloc_simple_stack_logging == 1)
          {
            malloc_report(0x325u, (uint64_t)"memalign (%p/%llu,%llu): ");
            if (!v13) {
              goto LABEL_10;
            }
          }

          else if (!v13)
          {
            goto LABEL_10;
          }

          kdebug_trace();
          goto LABEL_10;
        }

void *__cdecl malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  return (void *)_malloc_zone_memalign((uint64_t)zone, alignment, size, 0LL, (v3 >> 2));
}

uint64_t malloc_zone_claimed_address(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (malloc_check_start) {

  }
    internal_check();
  else {
    return 1LL;
  }
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return zone->zone_name;
}

void find_zone_and_free(void *a1, unsigned int a2)
{
  if (!a1) {
    return;
  }
  if (!malloc_num_zones) {
    goto LABEL_32;
  }
  if (lite_zone && (uint64_t v4 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
  {
    uint64_t v5 = v4;
  }

  else
  {
    if (initial_num_zones <= a2)
    {
LABEL_12:
      uint64_t v9 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      uint64_t v10 = malloc_num_zones;
      uint64_t v11 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_15:
        char v6 = 0LL;
        uint64_t v5 = 0LL;
      }

      else
      {
        while (1)
        {
          char v6 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v11);
          uint64_t v12 = v6[2](v6, a1);
          if (v12) {
            break;
          }
          if (v10 == ++v11) {
            goto LABEL_15;
          }
        }

        uint64_t v5 = v12;
      }

      OSAtomicDecrement32Barrier(v9);
      if (!v6) {
        goto LABEL_32;
      }
      goto LABEL_21;
    }

    uint64_t v7 = a2;
    while (1)
    {
      char v6 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v7);
      uint64_t v8 = v6[2](v6, a1);
      if (v8) {
        break;
      }
    }

    uint64_t v5 = v8;
    if (v7 || (has_injected_zone0 & 1) != 0) {
      goto LABEL_21;
    }
  }

  char v6 = (uint64_t (**)(void *, void *))default_zone;
  if (!default_zone)
  {
LABEL_32:
    if ((malloc_debug_flags & 0x140) != 0) {
      unsigned int v13 = 80;
    }
    else {
      unsigned int v13 = 144;
    }
    malloc_report(v13, (uint64_t)"*** error for object %p: pointer being freed was not allocated\n");
    return;
  }

LABEL_21:
  if (*((_DWORD *)v6 + 26) >= 6u && v6[15])
  {
    if (malloc_tracing_enabled) {
      kdebug_trace();
    }
    if (malloc_logger) {
      malloc_logger(12LL, v6, a1, 0LL, 0LL, 0LL);
    }
    if (malloc_simple_stack_logging == 1) {
      malloc_report(0x325u, (uint64_t)"free (%p/%llu): ");
    }
    if (malloc_check_start) {

    }
      internal_check();
    ((void (*)(uint64_t (**)(void *, void *), void *, uint64_t))v6[15])(v6, a1, v5);
  }

  else
  {
    malloc_zone_free((malloc_zone_t *)v6, a1);
  }

void *__cdecl malloc(size_t __size)
{
  return (void *)_malloc_zone_malloc((uint64_t)default_zone, __size, 1);
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  return (void *)_malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3LL, (v2 >> 2));
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)_malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1LL);
}

void _free(void *a1)
{
  if (a1)
  {
    if (malloc_slowpath) {
      BOOL v1 = 0;
    }
    else {
      BOOL v1 = malloc_logger == 0LL;
    }
    if (v1
      && *(_DWORD *)(*(void *)malloc_zones + 104LL) > 0xCu
      && (unint64_t v2 = *(void (**)(void))(*(void *)malloc_zones + 144LL)) != 0LL)
    {
      v2();
    }

    else
    {
      find_zone_and_free(a1, 0);
    }
  }

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  uint64_t v4 = j__realloc(__ptr, __size);
  uint64_t v5 = v4;
  if (__size && __ptr && !v4)
  {
    int v6 = *__error();
    j__free(__ptr);
    *__error() = v6;
  }

  return v5;
}

void *__cdecl valloc(size_t a1)
{
  return (void *)_malloc_zone_valloc((uint64_t)default_zone, a1, 1);
}

size_t malloc_size(const void *ptr)
{
  size_t v1 = 0LL;
  if (ptr)
  {
    if (malloc_num_zones)
    {
      if (!lite_zone || (size_t v1 = (*(uint64_t (**)(void))(lite_zone + 16))()) == 0)
      {
        if (initial_num_zones)
        {
          uint64_t v2 = 0LL;
          while (1)
          {
            size_t v3 = (*(uint64_t (**)(void))(*((void *)malloc_zones + v2) + 16LL))();
            if (v3) {
              return v3;
            }
          }
        }

        else
        {
LABEL_9:
          uint64_t v4 = (int32_t *)pFRZCounterLive;
          OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
          uint64_t v5 = malloc_num_zones;
          uint64_t v6 = initial_num_zones;
          if (initial_num_zones >= malloc_num_zones)
          {
LABEL_12:
            size_t v1 = 0LL;
          }

          else
          {
            while (1)
            {
              uint64_t v7 = (*(uint64_t (**)(void))(*((void *)malloc_zones + v6) + 16LL))();
              if (v7) {
                break;
              }
              if (v5 == ++v6) {
                goto LABEL_12;
              }
            }

            size_t v1 = v7;
          }

          OSAtomicDecrement32Barrier(v4);
        }
      }
    }
  }

  return v1;
}

size_t malloc_good_size(size_t size)
{
  return (*(uint64_t (**)(void))(*((void *)default_zone + 12) + 8LL))();
}

uint64_t _posix_memalign(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = _malloc_zone_memalign((uint64_t)default_zone, a2, a3, 0LL, (v3 >> 2));
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = 0LL;
    *a1 = v7;
  }

  else if ((a2 & (a2 - 1)) == 0 && a2 > 7)
  {
    return 12LL;
  }

  else
  {
    return 22LL;
  }

  return result;
}

uint64_t malloc_claimed_address(uint64_t a1)
{
  if (!malloc_num_zones) {
    return 0LL;
  }
  if (initial_num_zones)
  {
    uint64_t v3 = 0LL;
    while (!malloc_zone_claimed_address(*((void *)malloc_zones + v3), a1))
    {
    }

    return 1LL;
  }

void *reallocarray_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3)) {
    return j__realloc(a1, a2 * a3);
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0LL;
}

void *reallocarrayf_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3)) {
    return reallocf(a1, a2 * a3);
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0LL;
}

uint64_t _malloc_zone_malloc_with_options_np_outlined( malloc_zone_t *zone, size_t alignment, size_t size, uint64_t a4)
{
  if (!zone || (uint64_t v8 = zone, default_zone == (_UNKNOWN *)zone))
  {
    uint64_t v8 = (malloc_zone_t *)lite_zone;
    if (!lite_zone) {
      uint64_t v8 = *(malloc_zone_t **)malloc_zones;
    }
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v10 = *(void *)(StatusReg + 904);
  if (!v10) {
    *(void *)(StatusReg + 904) = (v4 >> 2);
  }
  if (malloc_interposition_compat
    || v8->version < 0xF
    || (reserved2 = (uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved2) == 0LL)
  {
    if (alignment)
    {
      uint64_t v14 = (uint64_t)j__malloc_zone_memalign(v8, alignment, size);
      if (v14 && (a4 & 1) != 0) {
        _platform_memset();
      }
    }

    else
    {
      if ((a4 & 1) != 0) {
        int v15 = j__malloc_zone_calloc(v8, 1uLL, size);
      }
      else {
        int v15 = j__malloc_zone_malloc(v8, size);
      }
      uint64_t v14 = (uint64_t)v15;
    }
  }

  else
  {
    int v12 = malloc_tracing_enabled;
    if (malloc_tracing_enabled)
    {
      kdebug_trace();
      uint64_t v13 = ((uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved2)(v8, alignment, size, a4);
    }

    else
    {
      uint64_t v13 = reserved2(v8, alignment, size, a4);
    }

    uint64_t v14 = v13;
    if (malloc_logger)
    {
      if ((a4 & 1) != 0) {
        uint64_t v17 = 74LL;
      }
      else {
        uint64_t v17 = 10LL;
      }
      malloc_logger(v17, v8, size, 0LL, v14, 0LL);
    }

    if (malloc_simple_stack_logging != 1)
    {
      if (!v12) {
        goto LABEL_24;
      }
      goto LABEL_15;
    }

    malloc_report(0x325u, (uint64_t)"malloc_with_options (%p/%llu,%llu): ");
    if (v12) {
LABEL_15:
    }
      kdebug_trace();
  }

uint64_t malloc_zone_malloc_with_options_np(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4)
{
  if (a2 && ((a2 & (a2 - 1)) != 0 || ((a2 - 1) & a3) != 0)) {
    return 0LL;
  }
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4) {
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  }
  if (!a1 || default_zone == (_UNKNOWN *)a1) {
    a1 = *(malloc_zone_t **)malloc_zones;
  }
  else {
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  }
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  if (malloc_default_purgeable_zone_pred != -1) {
    _os_once();
  }
  return (malloc_zone_t *)default_purgeable_zone;
}

void _malloc_create_purgeable_zone()
{
  if (initial_xzone_zone) {
    BOOL v0 = purgeable_zone_use_xzm == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    uint64_t v1 = initial_scalable_zone;
    if (!initial_scalable_zone)
    {
      initial_scalable_uint64_t zone = create_scalable_zone(0LL, malloc_debug_flags);
      malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultScalableMallocZone");
      malloc_zone_register((malloc_zone_t *)initial_scalable_zone);
      uint64_t v1 = initial_scalable_zone;
    }

    purgeable_uint64_t zone = (malloc_zone_t *)create_purgeable_zone(0LL, v1, malloc_debug_flags);
  }

  else
  {
    purgeable_uint64_t zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | 0x80u, initial_xzone_zone);
  }

  default_purgeable_uint64_t zone = (uint64_t)purgeable_zone;
  malloc_zone_register(purgeable_zone);
  malloc_set_zone_name((malloc_zone_t *)default_purgeable_zone, "DefaultPurgeableMallocZone");
}

void malloc_make_purgeable(void *ptr)
{
  if (find_registered_purgeable_zone((uint64_t)ptr))
  {
    int v2 = 1;
    MEMORY[0x186DFB100](*MEMORY[0x1895FFD48], ptr, 0LL, &v2);
  }

uint64_t (**find_registered_purgeable_zone(uint64_t a1))(void *, void)
{
  uint64_t result = 0LL;
  if (!a1 || !malloc_num_zones) {
    return result;
  }
  if (lite_zone)
  {
    uint64_t v3 = (*(uint64_t (**)(void))(lite_zone + 16))();
    if (v3)
    {
      unint64_t v4 = v3;
      goto LABEL_6;
    }
  }

  if (initial_num_zones)
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v5 = (uint64_t (**)(void *, void))*((void *)malloc_zones + v6);
      uint64_t v7 = v5[2](v5, a1);
      if (v7) {
        break;
      }
    }

    unint64_t v4 = v7;
    if (!v6 && (has_injected_zone0 & 1) == 0)
    {
LABEL_6:
      uint64_t v5 = (uint64_t (**)(void *, void))default_zone;
      if (!default_zone) {
        return 0LL;
      }
    }
  }

  else
  {
LABEL_12:
    uint64_t v8 = (int32_t *)pFRZCounterLive;
    OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
    uint64_t v9 = malloc_num_zones;
    uint64_t v10 = initial_num_zones;
    if (initial_num_zones >= malloc_num_zones)
    {
LABEL_15:
      uint64_t v5 = 0LL;
      unint64_t v4 = 0LL;
    }

    else
    {
      while (1)
      {
        uint64_t v5 = (uint64_t (**)(void *, void))*((void *)malloc_zones + v10);
        uint64_t v11 = v5[2](v5, a1);
        if (v11) {
          break;
        }
        if (v9 == ++v10) {
          goto LABEL_15;
        }
      }

      unint64_t v4 = v11;
    }

    OSAtomicDecrement32Barrier(v8);
    if (!v5) {
      return 0LL;
    }
  }

  if (v4 < *MEMORY[0x189600148]) {
    return 0LL;
  }
  if (v4 % *MEMORY[0x189600148]) {
    return 0LL;
  }
  else {
    return v5;
  }
}

int malloc_make_nonpurgeable(void *ptr)
{
  registered_purgeable_uint64_t zone = find_registered_purgeable_zone((uint64_t)ptr);
  if (registered_purgeable_zone)
  {
    int v4 = 0;
    MEMORY[0x186DFB100](*MEMORY[0x1895FFD48], ptr, 0LL, &v4);
    if (v4 == 2) {
      LODWORD(registered_purgeable_zone) = 14;
    }
    else {
      LODWORD(registered_purgeable_zone) = 0;
    }
  }

  return (int)registered_purgeable_zone;
}

uint64_t malloc_memory_event_handler(uint64_t result)
{
  uint64_t v1 = result;
  if ((result & 0xF0000000) != 0 && (result & 0xFFFFFFF) == 0) {
    uint64_t result = _malloc_register_stack_logger(0);
  }
  if (*((void *)&msl + 1)) {
    return (*((uint64_t (**)(uint64_t))&msl + 1))(v1);
  }
  return result;
}

uint64_t malloc_register_stack_logger()
{
  return _malloc_register_stack_logger(0);
}

size_t malloc_zone_pressure_relief(malloc_zone_t *zone, size_t goal)
{
  if (zone)
  {
    if (zone->version >= 8)
    {
      pressure_relief = (uint64_t (*)(void))zone->pressure_relief;
      if (pressure_relief) {
        return pressure_relief();
      }
    }

    return 0LL;
  }

  else
  {
    os_unfair_lock_lock_with_options();
    unsigned int v6 = malloc_num_zones;
    if (malloc_num_zones)
    {
      size_t v5 = 0LL;
      unsigned int v7 = 0;
      do
      {
        unint64_t v8 = v7;
        unsigned int v9 = v7 + 1;
        while (1)
        {
          uint64_t v10 = *((void *)malloc_zones + v8);
          if (*(_DWORD *)(v10 + 104) > 7u)
          {
            uint64_t v11 = *(uint64_t (**)(void))(v10 + 128);
            if (v11) {
              break;
            }
          }

          ++v8;
          ++v9;
          if (v8 >= v6) {
            goto LABEL_18;
          }
        }

        if (goal && goal <= v5) {
          break;
        }
        unsigned int v7 = v8 + 1;
        v5 += v11();
        unsigned int v6 = malloc_num_zones;
      }

      while (malloc_num_zones > v9);
    }

    else
    {
      size_t v5 = 0LL;
    }

unsigned int malloc_zone_batch_malloc( malloc_zone_t *zone, size_t size, void **results, unsigned int num_requested)
{
  batch_malloc = zone->batch_malloc;
  if (!batch_malloc) {
    return 0;
  }
  uint64_t v5 = *(void *)&num_requested;
  unsigned int v6 = results;
  if (malloc_check_start)
  {
    internal_check();
    unsigned int v9 = ((uint64_t (*)(malloc_zone_t *, size_t, void **, uint64_t))zone->batch_malloc)(zone, size, v6, v5);
  }

  else
  {
    unsigned int v9 = ((uint64_t (*)(malloc_zone_t *, size_t, void **, void))batch_malloc)( zone,  size,  results,  *(void *)&num_requested);
  }

  unsigned int v10 = v9;
  if (malloc_logger && v9)
  {
    uint64_t v11 = v9;
    do
    {
      uint64_t v12 = (uint64_t)*v6++;
      malloc_logger(10LL, zone, size, 0LL, v12, 0LL);
      --v11;
    }

    while (v11);
  }

  return v10;
}

void malloc_zone_batch_free(malloc_zone_t *zone, void **to_be_freed, unsigned int num)
{
  uint64_t v3 = *(void *)&num;
  if (malloc_check_start) {

  }
    internal_check();
  if (malloc_logger)
  {
    if (!(_DWORD)v3)
    {
      batch_free = zone->batch_free;
      if (batch_free) {
        goto LABEL_5;
      }
      return;
    }

    uint64_t v9 = v3;
    unsigned int v10 = to_be_freed;
    do
    {
      uint64_t v11 = (uint64_t)*v10++;
      malloc_logger(12LL, zone, v11, 0LL, 0LL, 0LL);
      --v9;
    }

    while (v9);
  }

  batch_free = zone->batch_free;
  if (batch_free)
  {
LABEL_5:
    ((void (*)(malloc_zone_t *, void **, uint64_t))batch_free)(zone, to_be_freed, v3);
    return;
  }

  if ((_DWORD)v3)
  {
    free = zone->free;
    do
    {
      LODWORD(v3) = v3 - 1;
      uint64_t v8 = (uint64_t)*to_be_freed++;
      ((void (*)(malloc_zone_t *, uint64_t))free)(zone, v8);
    }

    while ((_DWORD)v3);
  }

uint64_t malloc_sanitizer_is_enabled()
{
  return malloc_sanitizer_enabled;
}

uint64_t malloc_sanitizer_get_functions()
{
  return sanitizer;
}

uint64_t malloc_sanitizer_set_functions(uint64_t result)
{
  sanitizer = result;
  return result;
}

uint64_t malloc_get_all_zones( uint64_t a1, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, unsigned int **a4), unsigned int **a3, _DWORD *a4)
{
  unsigned int v6 = a2;
  if (!a2)
  {
    if ((_DWORD)a1)
    {
      is_self = mach_task_is_self(a1);
      if (!(_DWORD)is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self, v9, v10);
      }
    }

    unsigned int v6 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, unsigned int **))_malloc_default_reader_6;
  }

  uint64_t v11 = v6(a1, (uint64_t)&malloc_zones, 8LL, (unsigned int **)v19);
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = "*** malloc_get_all_zones: error reading zones_address at %p\n";
LABEL_11:
    malloc_report(3u, (uint64_t)v13);
    return v12;
  }

  uint64_t v14 = *(void *)v19[0];
  v19[1] = *(void *)v19[0];
  uint64_t v15 = v6(a1, (uint64_t)&malloc_num_zones, 4LL, &v18);
  if ((_DWORD)v15)
  {
    uint64_t v12 = v15;
    uint64_t v13 = "*** malloc_get_all_zones: error reading num_zones at %p\n";
    goto LABEL_11;
  }

  uint64_t v16 = *v18;
  *a4 = v16;
  uint64_t v12 = v6(a1, v14, 8 * v16, a3);
  if ((_DWORD)v12)
  {
    uint64_t v13 = "*** malloc_get_all_zones: error reading zones at %p\n";
    goto LABEL_11;
  }

  return v12;
}

void malloc_zone_print_ptr_info(void *ptr)
{
  if (ptr)
  {
    if (malloc_zone_from_ptr(ptr)) {
      printf("ptr %p in registered zone %p\n");
    }
    else {
      printf("ptr %p not in heap\n");
    }
  }

BOOLean_t malloc_zone_check(malloc_zone_t *zone)
{
  if (zone) {
    return ((uint64_t (*)(void))zone->introspect->check)();
  }
  if (!malloc_num_zones) {
    return 1;
  }
  unint64_t v2 = 0LL;
  BOOLean_t v3 = 1;
  do
  {
    unint64_t v4 = v2 + 1;
    unint64_t v2 = v4;
  }

  while (v4 < malloc_num_zones);
  return v3;
}

void malloc_zone_print(malloc_zone_t *zone, BOOLean_t verbose)
{
  if (zone)
  {
    ((void (*)(void))zone->introspect->print)();
  }

  else if (malloc_num_zones)
  {
    unint64_t v2 = 0LL;
    do
    {
      unint64_t v3 = v2 + 1;
      (*(void (**)(void))(*(void *)(*((void *)malloc_zones + v2) + 96LL) + 24LL))();
      unint64_t v2 = v3;
    }

    while (v3 < malloc_num_zones);
  }

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  if (zone)
  {
    ((void (*)(void))zone->introspect->statistics)();
  }

  else
  {
    _platform_memset();
    if (malloc_num_zones)
    {
      unint64_t v3 = 0LL;
      do
      {
        unint64_t v4 = v3 + 1;
        (*(void (**)(void))(*(void *)(*((void *)malloc_zones + v3) + 96LL) + 56LL))();
        stats->blocks_in_use += v5;
        *(int64x2_t *)&stats->size_in_use = vaddq_s64(*(int64x2_t *)&stats->size_in_use, v6);
        stats->size_allocated += v7;
        unint64_t v3 = v4;
      }

      while (v4 < malloc_num_zones);
    }
  }

void malloc_zone_log(malloc_zone_t *zone, void *address)
{
  if (zone)
  {
    ((void (*)(void))zone->introspect->log)();
  }

  else if (malloc_num_zones)
  {
    unint64_t v2 = 0LL;
    do
    {
      unint64_t v3 = v2 + 1;
      (*(void (**)(void))(*(void *)(*((void *)malloc_zones + v2) + 96LL) + 32LL))();
      unint64_t v2 = v3;
    }

    while (v3 < malloc_num_zones);
  }

void mag_set_thread_index(int a1)
{
  _os_cpu_number_override = a1;
  nano_common_cpu_number_override_set();
}

void (*malloc_error())()
{
  return DefaultMallocError;
}

void DefaultMallocError()
{
  if (!_simple_salloc())
  {
    malloc_report(0x10u, (uint64_t)"*** error %d\n");
    qword_18C528008 = (uint64_t)"*** DefaultMallocError called";
    abort();
  }

  _simple_sprintf();
  _simple_string();
  malloc_report(0x10u, (uint64_t)"%s\n");
  qword_18C528008 = _simple_string();
  abort();
}

uint64_t _malloc_fork_prepare()
{
  unint64_t v3 = *(&xmmword_18C528070 + 1);
  os_unfair_lock_lock_with_options();
  mfm_lock();
  if (malloc_num_zones)
  {
    unint64_t v0 = 0LL;
    do
    {
      unint64_t v1 = v0 + 1;
      (*(void (**)(void))(*(void *)(*((void *)malloc_zones + v0) + 96LL) + 40LL))();
      unint64_t v0 = v1;
    }

    while (v1 < malloc_num_zones);
  }

  if (initial_xzone_zone) {
    xzm_force_lock_global_state(initial_xzone_zone);
  }
  uint64_t result = (uint64_t)v3;
  if (v3) {
    return v3();
  }
  return result;
}

void _malloc_fork_parent()
{
  unint64_t v0 = (void (*)(void))off_18C528080;
  if (initial_xzone_zone) {
    xzm_force_unlock_global_state(initial_xzone_zone);
  }
  if (v0) {
    v0();
  }
  if (malloc_num_zones)
  {
    unint64_t v1 = 0LL;
    do
    {
      unint64_t v2 = v1 + 1;
      (*(void (**)(void))(*(void *)(*((void *)malloc_zones + v1) + 96LL) + 48LL))();
      unint64_t v1 = v2;
    }

    while (v2 < malloc_num_zones);
  }

  mfm_unlock();
  os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
}

void _malloc_fork_child()
{
  if (_malloc_entropy_initialized == 1 && initial_nano_zone != 0) {
    nanov2_forked_zone((void *)initial_nano_zone);
  }
  unint64_t v1 = (void (*)(void))off_18C528088;
  if (initial_xzone_zone) {
    xzm_force_reinit_lock_global_state(initial_xzone_zone);
  }
  if (v1) {
    v1();
  }
  if (malloc_num_zones)
  {
    unint64_t v2 = 0LL;
    do
    {
      unint64_t v3 = v2 + 1;
      uint64_t v4 = *((void *)malloc_zones + v2);
      if (*(_DWORD *)(v4 + 104) >= 9u) {
        uint64_t v5 = 104LL;
      }
      else {
        uint64_t v5 = 48LL;
      }
      (*(void (**)(void))(*(void *)(v4 + 96) + v5))();
      unint64_t v2 = v3;
    }

    while (v3 < malloc_num_zones);
  }

  mfm_reinit_lock();
  _malloc_os_unfair_lock_t lock = 0;
}

mstats *mstats(mstats *__return_ptr retstr)
{
  size_t blocks_in_use = v6.blocks_in_use;
  size_t size_allocated = v6.size_allocated;
  size_t size_in_use = v6.size_in_use;
  retstr->bytes_total = v6.size_allocated;
  retstr->chunks_used = blocks_in_use;
  retstr->bytes_used = size_in_use;
  retstr->chunks_free = 0LL;
  retstr->bytes_free = size_allocated - size_in_use;
  return result;
}

BOOLean_t malloc_zone_enable_discharge_checking(malloc_zone_t *zone)
{
  if (zone->version >= 7
    && (enable_discharge_checking = (uint64_t (*)(void))zone->introspect->enable_discharge_checking) != 0LL)
  {
    return enable_discharge_checking();
  }

  else
  {
    return 0;
  }

void malloc_zone_disable_discharge_checking(malloc_zone_t *zone)
{
  if (zone->version >= 7)
  {
    disable_discharge_checking = (void (*)(void))zone->introspect->disable_discharge_checking;
  }

void malloc_zone_discharge(malloc_zone_t *zone, void *memory)
{
  if ((zone || (uint64_t zone = malloc_zone_from_ptr(memory)) != 0LL) && zone->version >= 7)
  {
    discharge = (void (*)(void))zone->introspect->discharge;
  }

void malloc_zone_enumerate_discharged_pointers(malloc_zone_t *zone, void *report_discharged)
{
  if (zone)
  {
    if (zone->version >= 7)
    {
      enumerate_discharged_pointers = (void (*)(void))zone->introspect->enumerate_discharged_pointers;
    }
  }

  else
  {
    unint64_t v3 = malloc_num_zones;
    if (malloc_num_zones)
    {
      unint64_t v4 = 0LL;
      uint64_t v5 = malloc_zones;
      do
      {
        uint64_t v6 = v5[v4];
        if (*(_DWORD *)(v6 + 104) >= 7u)
        {
          uint64_t v7 = *(void (**)(void))(*(void *)(v6 + 96) + 96LL);
          if (v7)
          {
            v7();
            uint64_t v5 = malloc_zones;
            unint64_t v3 = malloc_num_zones;
          }
        }

        ++v4;
      }

      while (v4 < v3);
    }
  }

void malloc_zero_on_free_disable()
{
  malloc_zero_policy = 1;
}

uint64_t malloc_variant_is_debug_4test()
{
  return 0LL;
}

void set_malloc_singlethreaded()
{
  if ((set_malloc_singlethreaded_warned & 1) == 0) {
    set_malloc_singlethreaded_warned = 1;
  }
}

void malloc_singlethreaded()
{
  if ((malloc_singlethreaded_warned & 1) == 0)
  {
    malloc_report(3u, (uint64_t)"*** OBSOLETE: malloc_singlethreaded()\n");
    malloc_singlethreaded_warned = 1;
  }

uint64_t malloc_debug()
{
  return 0LL;
}

uint64_t malloc_get_thread_options()
{
  return *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896);
}

uint64_t malloc_set_thread_options(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v4 = a1;
  unsigned int v2 = a1;
  if ((a1 & 1) != 0)
  {
    unsigned int v2 = a1 | 6;
    LOBYTE(v4) = a1 | 6;
    uint64_t v1 = v4;
  }

  uint64_t result = pgm_thread_set_disabled((v2 >> 1) & 1);
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896) = v1;
  return result;
}

uint64_t _malloc_register_stack_logger(int a1)
{
  if (malloc_sanitizer_enabled) {
    BOOL v1 = a1 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (!v1)
  {
    if (*((void *)&msl + 1)) {
      return 1LL;
    }
    if (_dlopen)
    {
      uint64_t result = _dlopen("/System/Library/PrivateFrameworks/MallocStackLogging.framework/MallocStackLogging", 8LL);
      if (!result) {
        return result;
      }
      if (_register_msl_dylib_pred != -1) {
        _os_once();
      }
      if (*((void *)&msl + 1)) {
        return 1LL;
      }
      malloc_report(4u, (uint64_t)"failed to load MallocStackLogging.framework\n");
    }
  }

  return 0LL;
}

uint64_t turn_on_stack_logging(uint64_t a1)
{
  if (xmmword_18C5280A0) {
    return xmmword_18C5280A0(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t turn_off_stack_logging()
{
  uint64_t result = (uint64_t)*(&xmmword_18C5280A0 + 1);
  if (*(&xmmword_18C5280A0 + 1)) {
    return ((uint64_t (*)(void))*(&xmmword_18C5280A0 + 1))();
  }
  return result;
}

uint64_t default_zone_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t default_zone_malloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t default_zone_calloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t default_zone_valloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t default_zone_free()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t default_zone_realloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t default_zone_destroy()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t default_zone_batch_malloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t default_zone_batch_free()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t default_zone_memalign()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t default_zone_free_definite_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t default_zone_pressure_relief()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t default_zone_malloc_claimed_address(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (!lite_zone) {
    uint64_t v2 = *(void *)malloc_zones;
  }
  return malloc_zone_claimed_address(v2, a2);
}

uint64_t default_zone_ptr_in_use_enumerator()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (**(uint64_t (***)(void))(v0 + 96))();
}

uint64_t default_zone_good_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 8LL))();
}

uint64_t default_zone_check()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 16LL))();
}

uint64_t default_zone_print()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 24LL))();
}

uint64_t default_zone_log()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 32LL))();
}

uint64_t default_zone_force_lock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 40LL))();
}

uint64_t default_zone_force_unlock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 48LL))();
}

uint64_t default_zone_statistics()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 56LL))();
}

uint64_t default_zone_locked()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 64LL))();
}

uint64_t default_zone_reinit_lock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 104LL))();
}

uint64_t _malloc_default_reader_6(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self, v7, v8);
    }
  }

  *a4 = a2;
  return 0LL;
}

uint64_t (*register_msl_dylib( uint64_t (*result)(uint64_t (**)(), uint64_t)))(uint64_t (**)(), uint64_t)
{
  if (result)
  {
    BOOL v1 = result;
    *((void *)&msl + 1) = _dlsym(result, "msl_handle_memory_event");
    xmmword_18C528070 = (uint64_t (*)(void))_dlsym(v1, "msl_stack_logging_locked");
    *(&xmmword_18C528070 + 1) = (uint64_t (*)(void))_dlsym(v1, "msl_fork_prepare");
    off_18C528088 = (_UNKNOWN *)_dlsym(v1, "msl_fork_child");
    off_18C528080 = (_UNKNOWN *)_dlsym(v1, "msl_fork_parent");
    *(void *)&xmmword_18C5280A0 = _dlsym(v1, "msl_turn_on_stack_logging");
    *((void *)&xmmword_18C5280A0 + 1) = _dlsym(v1, "msl_turn_off_stack_logging");
    *(void *)&xmmword_18C528090 = _dlsym(v1, "msl_set_flags_from_environment");
    *((void *)&xmmword_18C528090 + 1) = _dlsym(v1, "msl_initialize");
    uint64_t result = (uint64_t (*)(uint64_t (**)(), uint64_t))_dlsym(v1, "msl_copy_msl_lite_hooks");
    if (result) {
      return (uint64_t (*)(uint64_t (**)(), uint64_t))set_msl_lite_hooks(result);
    }
  }

  return result;
}

_DWORD *malloc_freezedry()
{
  uint64_t v0 = j__malloc(0x10uLL);
  size_t v1 = malloc_num_zones;
  *uint64_t v0 = 6;
  v0[1] = v1;
  *((void *)v0 + 1) = j__calloc(v1, 0x4A00uLL);
  if (malloc_num_zones)
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = 0LL;
    while (1)
    {
      int v4 = _platform_strcmp();
      uint64_t v5 = (char *)*((void *)v0 + 1);
      if (v4) {
        break;
      }
      memcpy(&v5[v2], *((const void **)malloc_zones + v3++), 0x4A00uLL);
      v2 += 18944LL;
    }

    _free(v5);
    _free(v0);
    return 0LL;
  }

  return v0;
}

uint64_t malloc_jumpstart(uint64_t a1)
{
  if (*(_DWORD *)a1 != 6) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 4))
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = 0LL;
    do
    {
      int v4 = (malloc_zone_t *)(*(void *)(a1 + 8) + v2);
      v4->size = (size_t (__cdecl *)(_malloc_zone_t *, const void *))szone_size;
      v4->malloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_malloc;
      v4->calloc = (void *(__cdecl *)(_malloc_zone_t *, size_t, size_t))frozen_calloc;
      v4->valloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_valloc;
      v4->free = (void (__cdecl *)(_malloc_zone_t *, void *))frozen_free;
      v4->realloc = (void *(__cdecl *)(_malloc_zone_t *, void *, size_t))frozen_realloc;
      v4->destroy = (void (__cdecl *)(_malloc_zone_t *))frozen_destroy;
      v4->introspect = (malloc_introspection_t *)&szone_introspect;
      malloc_zone_register(v4);
      ++v3;
      v2 += 18944LL;
    }

    while (v3 < *(unsigned int *)(a1 + 4));
  }

  return 0LL;
}

void *frozen_malloc(int a1, size_t __size)
{
  return j__malloc(__size);
}

void *frozen_calloc(int a1, size_t __count, size_t __size)
{
  return j__calloc(__count, __size);
}

void *frozen_valloc(int a1, size_t a2)
{
  return j__valloc(a2);
}

void *frozen_realloc(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v5 = szone_size(a1, (unint64_t)a2);
  if (v5 >= a3) {
    return (void *)a2;
  }
  size_t v6 = v5;
  uint64_t v7 = j__malloc(a3);
  uint64_t v8 = v7;
  if (v6) {
    memcpy(v7, a2, v6);
  }
  return v8;
}

void tiny_print_region_free_list(uint64_t a1, unsigned int a2)
{
  int v2 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000LL) + 4LL * a2 + 0x3F28);
  unint64_t v3 = a1 & 0xFFFFFFFFFFF00000LL | 0x4080;
  int v4 = (const void *)((16 * v2 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000LL) + 4LL * a2 + 0x3F28)) {
    int v4 = 0LL;
  }
  int v5 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000LL) + 4LL * a2 + 0x3F2A);
  size_t v6 = (const void *)((16 * v5 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000LL) + 4LL * a2 + 0x3F2A)) {
    size_t v6 = 0LL;
  }
  malloc_printf( "For region %p, first block: %d (%p), last block: %d (%p)\n",  (const void *)(a1 & 0xFFFFFFFFFFF00000LL),  v2,  v4,  v5,  v6);
}

void tiny_finalize_region(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 2128);
  if (v3)
  {
    uint64_t v5 = *(void *)(a2 + 2144) - v3 + 0x100000;
    unint64_t v6 = v3 >> 4;
    unint64_t v7 = v5 & 0xFFFFFFFFFFF00000LL | 0x4080;
    unint64_t v8 = v5 - v7;
    uint64_t v9 = (v5 - v7) & 0xFFFF0;
    unsigned int v10 = (v5 - v7) >> 4;
    if (v9 == 1032048
      || (unint64_t v11 = (v5 & 0xFFFFFFFFFFF00000LL) + 4LL * (((v10 + 1) >> 4) & 0xFFE),
          *(_DWORD *)(v11 + 40) &= ~(1 << (v10 + 1)),
          v9))
    {
      unsigned int tiny_previous_free_msize = get_tiny_previous_free_msize(v5);
      if (tiny_previous_free_msize <= (unsigned __int16)v10)
      {
        unsigned int v13 = tiny_previous_free_msize;
        uint64_t v14 = ((v10 - tiny_previous_free_msize) >> 4) & 0xFFE;
        int v15 = 1 << (v10 - tiny_previous_free_msize);
        if ((*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000LL) + 0x28 + 4LL * v14) & v15) != 0
          && (*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000LL) + 0x2C + 4 * v14) & v15) == 0)
        {
          unint64_t v16 = v7 + 16LL * (unsigned __int16)(v10 - tiny_previous_free_msize);
          if (v16 + 16 >= (v16 & 0xFFFFFFFFFFF00000LL | 0xFBF80) + 16512
            || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000LL | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                           + 0x28) >> (((((_DWORD)v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
          {
            int v17 = 1;
          }

          else
          {
            int v17 = *(unsigned __int16 *)(v16 + 16);
          }

          if (v17 == tiny_previous_free_msize && v16)
          {
            *(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000LL) + 0x28 + ((v8 >> 6) & 0x3FF8)) = vand_s8( *(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000LL) + 0x28 + ((v8 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(~(1 << v10)));
            tiny_free_list_remove_ptr(a1, a2, v16, tiny_previous_free_msize);
            if (v13 >= 2 && !malloc_zero_policy) {
              *(_WORD *)(v16 + 16LL * v13 - 2) = 0;
            }
            LOWORD(v6) = v13 + v6;
            uint64_t v5 = v16;
          }
        }
      }
    }

    tiny_free_list_add_ptr(a1, a2, v5, (unsigned __int16)v6);
    *(void *)(a2 + 2128) = 0LL;
  }

  *(void *)(a2 + 2144) = 0LL;
}

void tiny_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v5 = *(void *)(a3 + 8);
  else {
    unsigned int v6 = 63;
  }
  uint64_t v7 = __ROR8__(v5, 60);
  unint64_t v8 = (void *)(v7 & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(a1 + 632);
  unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFF0LL ^ v9;
  if (((v7 ^ (HIDWORD(v10) {
                           + (_DWORD)v10
  }
                           + ((HIDWORD(v10) + v10) >> 16)
  uint64_t v11 = __ROR8__(*(void *)a3, 60);
  unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v13 = v11 & 0xFFFFFFFFFFFFFFF0LL ^ v9;
  if (((v11 ^ (HIDWORD(v13) {
                            + (_DWORD)v13
  }
                            + ((HIDWORD(v13) + v13) >> 16)
  if (!v12)
  {
    *(void *)(a2 + 8LL * v6 + 32) = v8;
    if (!v8)
    {
      int v16 = 1;
      *(_DWORD *)(a2 + 4LL * (v6 >> 5) + 2088) &= ~(1 << v6);
      goto LABEL_15;
    }

void tiny_free_list_add_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a4 - 64 >= 0xFFFFFFC1) {
    uint64_t v4 = a4 - 1;
  }
  else {
    uint64_t v4 = 63LL;
  }
  uint64_t v5 = a2 + 8LL * v4;
  unint64_t v6 = a3 & 0xFFFFFFFFFFF00000LL;
  unint64_t v7 = a3 & 0xFFFFFFFFFFF00000LL | 0x4080;
  unint64_t v8 = a3 - v7;
  unint64_t v9 = a3 & 0xFFFFFFFFFFF00000LL | ((a3 - v7) >> 6) & 0x3FF8;
  int v10 = 1 << ((a3 - v7) >> 4);
  int v11 = *(_DWORD *)(v9 + 0x28) | v10;
  int v12 = *(_DWORD *)(v9 + 0x2C) & ~v10;
  uint64_t v15 = *(void *)(v5 + 32);
  uint64_t v14 = (unint64_t *)(v5 + 32);
  uint64_t v13 = v15;
  *(_DWORD *)(v9 + 4malloc_zone_register_while_locked((uint64_t)zone, 0) = v11;
  *(_DWORD *)(v9 + 44) = v12;
  if (a4 < 2)
  {
    if (a4) {
      goto LABEL_8;
    }
  }

  else
  {
    *(_WORD *)(a3 + 16LL * a4 - 2) = a4;
  }

  *(_WORD *)(a3 + 16) = a4;
LABEL_8:
  if (!v13) {
    *(_DWORD *)(a2 + 4LL * (v4 >> 5) + 2088) |= 1 << v4;
  }
  int v16 = (_WORD *)(v6 + 4 * v4 + 16168);
  if (!*v16)
  {
    unint64_t v23 = *v14;
    if (*(_DWORD *)((a3 & 0xFFFFFFFFFFF00000LL) + 0x18) == -1) {
      goto LABEL_33;
    }
    if (!v23) {
      goto LABEL_33;
    }
    uint64_t v24 = *(void *)(a2 + 2176);
    if (!v24 || v24 == v6) {
      goto LABEL_33;
    }
    unsigned int v25 = 0;
    int v26 = 0;
    uint64_t v27 = 0LL;
    do
    {
      if (*(_WORD *)((v24 & 0xFFFFFFFFFFF00000LL) + 4 * v4 + 0x3F2A))
      {
        uint64_t v27 = v24;
        int v26 = *(unsigned __int16 *)((v24 & 0xFFFFFFFFFFF00000LL) + 4 * v4 + 0x3F2A);
      }

      uint64_t v24 = *(void *)(v24 + 8);
      if (v24) {
        BOOL v28 = v24 == v6;
      }
      else {
        BOOL v28 = 1;
      }
    }

    while (!v28 && v25++ < 4);
    if (v26 && (unint64_t v30 = (v27 & 0xFFFFFFFFFFF00000LL) + 16512 + (16 * v26 - 16)) != 0)
    {
      uint64_t v31 = __ROR8__(*(void *)(v30 + 8), 60);
      unint64_t v23 = v31 & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v32 = *(void *)(a1 + 632);
      unint64_t v33 = v31 & 0xFFFFFFFFFFFFFFF0LL ^ v32;
      if (((v31 ^ (HIDWORD(v33) {
                                + (_DWORD)v33
      }
                                + ((HIDWORD(v33) + v33) >> 16)
      *((void *)&v34 + 1) = (((v32 ^ a3) >> 32)
                                           + (v32 ^ a3)
                                           + ((((v32 ^ a3) >> 32) + (v32 ^ a3)) >> 16)
                                           + ((((v32 ^ a3) >> 32)
                                                           + (v32 ^ a3)
                                                           + ((((v32 ^ a3) >> 32) + (v32 ^ a3)) >> 16)) >> 8));
      *(void *)&__int128 v34 = a3;
      *(void *)(v30 + 8) = v34 >> 4;
    }

    else
    {
LABEL_33:
      unint64_t v30 = 0LL;
      *uint64_t v14 = a3;
    }

    unint64_t v35 = *(void *)(a1 + 632) ^ v30;
    *((void *)&v36 + 1) = HIDWORD(v35)
                          + (_DWORD)v35
    *(void *)&__int128 v36 = v30;
    *(void *)a3 = v36 >> 4;
    if (v23)
    {
      unint64_t v37 = *(void *)(a1 + 632) ^ a3;
      *((void *)&v38 + 1) = HIDWORD(v37)
                            + (_DWORD)v37
      *(void *)&__int128 v38 = a3;
      *(void *)unint64_t v23 = v38 >> 4;
    }

    unint64_t v39 = v8 >> 4;
    unint64_t v40 = *(void *)(a1 + 632) ^ v23;
    *((void *)&v41 + 1) = HIDWORD(v40)
                          + (_DWORD)v40
    *(void *)&__int128 v41 = v23;
    *(void *)(a3 + 8) = v41 >> 4;
    __int16 v42 = v39 + 1;
    *(_WORD *)((a3 & 0xFFFFFFFFFFF00000LL) + 4 * v4 + 0x3F2A) = v42;
    goto LABEL_39;
  }

  unint64_t v17 = 16 * (unsigned __int16)*v16 - 16 + v7;
  uint64_t v18 = __ROR8__(*(void *)v17, 60);
  unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v20 = *(void *)(a1 + 632);
  unint64_t v21 = v18 & 0xFFFFFFFFFFFFFFF0LL ^ v20;
  if (((v18 ^ (HIDWORD(v21)
                            + (_DWORD)v21
                            + ((HIDWORD(v21) + v21) >> 16)
                            + ((HIDWORD(v21) + (_DWORD)v21 + ((HIDWORD(v21) + v21) >> 16)) >> 8))) & 0xFLL) == 0)
  {
    if (v19)
    {
      *((void *)&v22 + 1) = (((v20 ^ a3) >> 32)
                                           + (v20 ^ a3)
                                           + ((((v20 ^ a3) >> 32) + (v20 ^ a3)) >> 16)
                                           + ((((v20 ^ a3) >> 32)
                                                           + (v20 ^ a3)
                                                           + ((((v20 ^ a3) >> 32) + (v20 ^ a3)) >> 16)) >> 8));
      *(void *)&__int128 v22 = a3;
      *(void *)(v19 + 8) = v22 >> 4;
    }

    else
    {
      *uint64_t v14 = a3;
    }

    *(void *)a3 = *(void *)v17;
    unsigned int v43 = ((*(void *)(a1 + 632) ^ v17) >> 32) + (*(_DWORD *)(a1 + 632) ^ v17);
    *((void *)&v44 + 1) = v43 + HIWORD(v43) + ((v43 + HIWORD(v43)) >> 8);
    *(void *)&__int128 v44 = v17;
    *(void *)(a3 + 8) = v44 >> 4;
    unint64_t v45 = *(void *)(a1 + 632) ^ a3;
    *((void *)&v44 + 1) = HIDWORD(v45)
                          + (_DWORD)v45
    *(void *)&__int128 v44 = a3;
    *(void *)unint64_t v17 = v44 >> 4;
    __int16 v42 = (v8 >> 4) + 1;
LABEL_39:
    *int v16 = v42;
    return;
  }

LABEL_40:
  free_list_checksum_botch(a1);
  __break(1u);
}

    unsigned int v43 = os_unfair_lock_trylock(v22);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    if (!v43)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_unlock(v22);
      os_unfair_lock_lock_with_options();
      tiny_malloc_from_free_list(a1, v7 + 2560LL * v6, v44, a2);
      uint64_t v14 = v45;
      if (!v45) {
        continue;
      }
      goto LABEL_16;
    }

    break;
  }

  unint64_t v46 = *(_DWORD *)(a1 + 620);
  if ((v46 & 4) != 0) {
    int v47 = -2;
  }
  else {
    int v47 = -4;
  }
  mach_vm_address_t pages = mvm_allocate_pages(0x100000uLL, 20, v47 & v46, 7);
  os_unfair_lock_lock_with_options();
  if (pages)
  {
    *(_DWORD *)(pages + 16508) = *(unsigned __int16 *)((char *)&malloc_entropy + 1);
    unsigned int v49 = (void *)(v7 + 2560LL * v6 + 2128);
    if (*v49 || *(void *)(v7 + 2560LL * v6 + 2136)) {
      tiny_finalize_region(a1, v7 + 2560LL * v6);
    }
    *(void *)(pages + 1616malloc_zone_register_while_locked((uint64_t)zone, 0) = 4278190080LL;
    *(_DWORD *)(pages + 24) = v6;
    rack_region_insert(a1, pages);
    char v50 = v7 + 2560LL * v6;
    *(void *)(v50 + 2144) = pages;
    unsigned int v51 = (16 * a2);
    *(_DWORD *)(pages + 16) = v51;
    *(_DWORD *)(pages + 2malloc_zone_register_while_locked((uint64_t)zone, 0) = 1;
    uint64_t v14 = pages + 16512;
    set_tiny_meta_header_in_use(pages + 16512, a2);
    ++*v62;
    unint64_t v52 = vdupq_n_s64(0xFBF80uLL);
    v52.i64[0] = v51;
    unint64_t v53 = (pages + 16512 + v51) & 0xFFFFFFFFFFF00000LL | 0x28;
    uint64_t v54 = ((pages + 16512 + v51) & 0xFFFFF) - 16512;
    int v55 = vaddq_s64(*v63, v52);
    *(int8x8_t *)(v53 + ((v54 >> 6) & 0x3FF8)) = vorr_s8( *(int8x8_t *)(v53 + ((v54 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(1 << (v54 >> 4)));
    *(_DWORD *)(v53 + 4LL * ((((v54 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v54 >> 4) + 1);
    *uint64_t v63 = v55;
    *unsigned int v49 = 1032064 - 16 * (int)a2;
    *(void *)(v50 + 2136) = 0LL;
    int v56 = *v64;
    if (*v64) {
      *(void *)(v56 + 8) = pages;
    }
    else {
      *unint64_t v61 = pages;
    }
    *(void *)mach_vm_address_t pages = v56;
    *int v64 = pages;
    *(void *)(pages + 8) = 0LL;
    *(_BYTE *)(pages + 32) = 0;
    ++*v65;
    os_unfair_lock_unlock(v8);
    os_unfair_lock_unlock(v22);
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    os_unfair_lock_unlock(v22);
    return 0LL;
  }

  return v14;
}

uint64_t tiny_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a3 + 16512;
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    unint64_t v7 = a3 + 0x100000;
    do
    {
      unint64_t v8 = v4 & 0xFFFFFFFFFFF00000LL | 0x28;
      unint64_t v9 = v4 & 0xFFFFFFFFFFF00000LL | 0x4080;
      unsigned int v10 = ((v4 - v9) >> 8) & 0xFFE;
      int v11 = 1 << ((v4 - v9) >> 4);
      int v12 = (unsigned int *)(v8 + 4LL * v10);
      unint64_t v13 = *v12;
      if ((*(_DWORD *)(v8 + 4LL * (v10 | 1)) & v11) != 0)
      {
        unsigned int v14 = ((v4 - v9) >> 4) & 0x1F;
        unint64_t v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14) {
          v15 |= (unint64_t)v12[4] << -(char)v14;
        }
        if (v15 < 2) {
          return *(unsigned int *)(a3 + 20);
        }
        unsigned int v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }

      else
      {
        if (v4 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v4 + 16) & 0xFFFFFFFFFFF00000LL | ((((v4 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v4 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v16 = 1;
        }

        else
        {
          unsigned int v16 = *(unsigned __int16 *)(v4 + 16);
          if (!*(_WORD *)(v4 + 16)) {
            return *(unsigned int *)(a3 + 20);
          }
        }

        tiny_free_list_remove_ptr(a1, a2, v4, v16);
      }

      v4 += 16LL * v16;
    }

    while (v4 < v7);
  }

  return *(unsigned int *)(a3 + 20);
}

uint64_t get_tiny_meta_header(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = a1 & 0xFFFFFFFFFFF00000LL | 0x28;
  unint64_t v3 = a1 & 0xFFFFFFFFFFF00000LL | 0x4080;
  unsigned int v4 = a1 - v3;
  unsigned int v5 = ((a1 - v3) >> 8) & 0xFFE;
  int v6 = 1 << ((a1 - v3) >> 4);
  *a2 = 0;
  unint64_t v7 = (unsigned int *)(v2 + 4LL * v5);
  unint64_t v8 = *v7;
  if ((*(_DWORD *)(v2 + 4LL * (v5 | 1)) & v6) != 0)
  {
    int v9 = (v4 >> 4) & 0x1F;
    unint64_t v10 = ((unint64_t)v7[2] << (32 - v9)) | (v8 >> ((v4 >> 4) & 0x1F));
    if (v9) {
      v10 |= (unint64_t)v7[4] << -(char)v9;
    }
    int v11 = __clz(__rbit64(v10 >> 1));
    if (v10 >= 2) {
      return (v11 + 1);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v12 = 1LL;
    *a2 = 1;
    if (a1 + 16 < v3 + 1032064)
    {
      if (((*(_DWORD *)(((a1 + 16) & 0xFFFFFFFFFFF00000LL | ((((a1 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)a1 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0) {
        return 1LL;
      }
      else {
        return *(unsigned __int16 *)(a1 + 16);
      }
    }
  }

  return v12;
}

uint64_t tiny_free_reattach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 16512;
  uint64_t v4 = *(unsigned int *)(a3 + 16);
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    unint64_t v7 = a3 + 0x100000;
    do
    {
      unint64_t v8 = v3 & 0xFFFFFFFFFFF00000LL | 0x28;
      unint64_t v9 = v3 & 0xFFFFFFFFFFF00000LL | 0x4080;
      unsigned int v10 = ((v3 - v9) >> 8) & 0xFFE;
      int v11 = 1 << ((v3 - v9) >> 4);
      uint64_t v12 = (unsigned int *)(v8 + 4LL * v10);
      unint64_t v13 = *v12;
      if ((*(_DWORD *)(v8 + 4LL * (v10 | 1)) & v11) != 0)
      {
        unsigned int v14 = ((v3 - v9) >> 4) & 0x1F;
        unint64_t v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14) {
          v15 |= (unint64_t)v12[4] << -(char)v14;
        }
        if (v15 < 2) {
          return v4;
        }
        unsigned int v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }

      else
      {
        if (v3 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v3 + 16) & 0xFFFFFFFFFFF00000LL | ((((v3 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v3 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v16 = 1;
        }

        else
        {
          unsigned int v16 = *(unsigned __int16 *)(v3 + 16);
          if (!*(_WORD *)(v3 + 16)) {
            return v4;
          }
        }

        tiny_free_list_add_ptr(a1, a2, v3, v16);
      }

      v3 += 16LL * v16;
    }

    while (v3 < v7);
  }

  return v4;
}

uint64_t tiny_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  v40[1] = *MEMORY[0x1895FEE08];
  int v6 = (_DWORD *)MEMORY[0x189600120];
  uint64_t result = MEMORY[0x1895FE128]();
  uint64_t v12 = (char *)v40 - v11;
  if (v8 <= 0xFFFFFFFFFFF0407FLL)
  {
    LODWORD(v13) = 0;
    uint64_t v14 = *MEMORY[0x189600118];
    uint64_t v15 = ~*MEMORY[0x189600118];
    uint64_t result = 32LL;
    unint64_t v16 = v8;
    do
    {
      unint64_t v17 = v16 & 0xFFFFFFFFFFF00000LL | 0x28;
      unint64_t v18 = v16 & 0xFFFFFFFFFFF00000LL | 0x4080;
      unsigned int v19 = ((v16 - v18) >> 8) & 0xFFE;
      int v20 = 1 << ((v16 - v18) >> 4);
      unint64_t v21 = (unsigned int *)(v17 + 4LL * v19);
      unint64_t v22 = *v21;
      if ((*(_DWORD *)(v17 + 4LL * (v19 | 1)) & v20) != 0)
      {
        unsigned int v23 = ((v16 - v18) >> 4) & 0x1F;
        unint64_t v24 = ((unint64_t)v21[2] << (32 - v23)) | (v22 >> v23);
        if (v23) {
          v24 |= (unint64_t)v21[4] << -(char)v23;
        }
        if (v24 < 2) {
          break;
        }
        unint64_t v25 = 16 * __clz(__rbit64(v24 >> 1)) + 16;
      }

      else
      {
        if (v16 + 16 >= v18 + v10
          || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000LL | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v26 = 1;
        }

        else
        {
          unsigned int v26 = *(unsigned __int16 *)(v16 + 16);
          if (v16 == v8 && !*(_WORD *)(v16 + 16))
          {
            unint64_t v32 = (v8 + v14 + 18) & v15;
            unint64_t v33 = (v8 + 1048574) & v15;
            BOOL v29 = v33 > v32;
            unint64_t v34 = v33 - v32;
            if (v29)
            {
              unint64_t v35 = (v32 - v8) >> v9;
              __int128 v36 = &v12[2 * (int)v13];
              *__int128 v36 = v35;
              v36[1] = v34 >> v9;
              LODWORD(v13) = v13 + 1;
            }

            break;
          }

          if (!*(_WORD *)(v16 + 16)) {
            break;
          }
        }

        unint64_t v27 = (v16 + v14 + 18) & v15;
        unint64_t v25 = 16LL * v26;
        unint64_t v28 = (v16 + v25 - 2) & v15;
        BOOL v29 = v28 > v27;
        unint64_t v30 = v28 - v27;
        if (v29)
        {
          uint64_t v31 = &v12[2 * (int)v13];
          char *v31 = (v27 - a3) >> v9;
          v31[1] = v30 >> v9;
          LODWORD(v13) = v13 + 1;
        }
      }

      v16 += v25;
    }

    while (v16 < v8 + v10);
    if ((int)v13 >= 1)
    {
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      uint64_t v13 = v13;
      unint64_t v37 = (unsigned __int8 *)(v12 + 1);
      do
      {
        uint64_t v38 = a3 + (*(v37 - 1) << *v6);
        int v39 = *v37;
        v37 += 2;
        mvm_madvise_free(a1, a3, v38, v38 + (v39 << *v6), 0LL, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }

      while (v13);
      os_unfair_lock_lock_with_options();
      return OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
    }
  }

  return result;
}

void tiny_free_no_lock(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  unsigned __int16 v8 = a6;
  int v73 = (unsigned __int16 *)(a4 + 16420);
  uint64_t v11 = (16 * a6);
  unint64_t v12 = a5 + v11;
  unint64_t v13 = a5 & 0xFFFFFFFFFFF00000LL;
  unint64_t v14 = a5 & 0xFFFFFFFFFFF00000LL | 0x4080;
  unint64_t v15 = a5 - v14;
  unint64_t v16 = read_memory + 7944;
  if (((a5 - v14) & 0xFFFF0) == 0) {
    goto LABEL_7;
  }
  unsigned int tiny_previous_free_msize = get_tiny_previous_free_msize(a5);
  if (tiny_previous_free_msize > (unsigned __int16)(v15 >> 4))
  {
    unint64_t v18 = a5;
    unint64_t v16 = read_memory + 7944;
    goto LABEL_18;
  }

  unsigned int v19 = tiny_previous_free_msize;
  uint64_t v20 = v13 | 0x28;
  unsigned int v21 = (v15 >> 4) - tiny_previous_free_msize;
  uint64_t v22 = (v21 >> 4) & 0xFFE;
  int v23 = 1 << ((v15 >> 4) - tiny_previous_free_msize);
  unint64_t v16 = read_memory + 7944;
  if ((*(_DWORD *)((v13 | 0x28) + 4LL * v22) & v23) == 0)
  {
    unint64_t v18 = a5;
    goto LABEL_18;
  }

  if ((*(_DWORD *)((v13 | 0x2C) + 4 * v22) & v23) != 0
    || ((unint64_t v24 = v14 + 16LL * (unsigned __int16)v21, v24 + 16 < (v24 & 0xFFFFFFFFFFF00000LL | 0xFBF80) + 16512)
     && ((*(_DWORD *)(((v24 + 16) & 0xFFFFFFFFFFF00000LL | ((((v24 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v24 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) == 0
      ? (int v25 = *(unsigned __int16 *)(v24 + 16))
      : (int v25 = 1),
        v25 != tiny_previous_free_msize))
  {
LABEL_7:
    unint64_t v18 = a5;
    goto LABEL_18;
  }

  unint64_t v18 = a5;
  if (v24)
  {
    *(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)) = vand_s8( *(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(~(1 << (v15 >> 4))));
    tiny_free_list_remove_ptr(a1, a2, v24, tiny_previous_free_msize);
    unint64_t v16 = &read_memory[993];
    if (v19 >= 2 && !malloc_zero_policy) {
      *(_WORD *)(v24 + 16LL * v19 - 2) = 0;
    }
    v8 += v19;
    unint64_t v18 = v24;
  }

void tiny_madvise_free_range_no_lock( uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unsigned int a7)
{
  uint64_t v7 = *MEMORY[0x189600118];
  unint64_t v8 = (*MEMORY[0x189600118] + a6 + 18) & ~*MEMORY[0x189600118];
  unint64_t v9 = (a6 + 16LL * a7 - 2) & ~*MEMORY[0x189600118];
  if (v8 < v9)
  {
    unint64_t v10 = (a4 - 2) & ~v7;
    unint64_t v11 = (a5 + a4 + v7 + 18) & ~v7;
    unint64_t v12 = v8 <= v10 ? v10 : (*MEMORY[0x189600118] + a6 + 18) & ~*MEMORY[0x189600118];
    unint64_t v13 = v9 >= v11 ? v11 : (a6 + 16LL * a7 - 2) & ~*MEMORY[0x189600118];
    if (v12 < v13)
    {
      tiny_free_list_remove_ptr(a1, (uint64_t)a2, a6, a7);
      set_tiny_meta_header_in_use(a6, a7);
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      mvm_madvise_free(a1, a3, v12, v13, a1 + 640, *(_DWORD *)(a1 + 620) & 0x20);
      os_unfair_lock_lock_with_options();
      OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
      unint64_t v19 = (a6 & 0xFFFFF) - 16512;
      unint64_t v20 = a6 & 0xFFFFFFFFFFF00000LL | (v19 >> 6) & 0x3FF8;
      LODWORD(v19) = 1 << (v19 >> 4);
      int v21 = *(_DWORD *)(v20 + 40) | v19;
      LODWORD(v19) = *(_DWORD *)(v20 + 44) & ~(_DWORD)v19;
      *(_DWORD *)(v20 + 4malloc_zone_register_while_locked((uint64_t)zone, 0) = v21;
      *(_DWORD *)(v20 + 44) = v19;
      if (a7 < 2)
      {
        if (a7)
        {
LABEL_14:
          tiny_free_list_add_ptr(a1, (uint64_t)a2, a6, a7);
          return;
        }
      }

      else
      {
        *(_WORD *)(a6 + 16LL * a7 - 2) = a7;
      }

      *(_WORD *)(a6 + 16) = a7;
      goto LABEL_14;
    }
  }

uint64_t tiny_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a4 + 15;
  uint64_t v8 = a1 + 16512;
  uint64_t should_clear = tiny_malloc_should_clear(a1 + 16512, (unsigned __int16)((a4 + 15) >> 4), 0);
  uint64_t v10 = should_clear;
  if (!should_clear) {
    return v10;
  }
  uint64_t v34 = v8;
  unint64_t v11 = v7 >> 4;
  if (((a2 - 1) & should_clear) != 0) {
    uint64_t v12 = a2 - ((a2 - 1) & should_clear);
  }
  else {
    uint64_t v12 = 0LL;
  }
  int v13 = a3 + 15;
  unint64_t v14 = (unint64_t)(a3 + 15) >> 4;
  int v15 = (unsigned __int16)((v12 + 15) >> 4);
  int v16 = v11 - (v14 + ((v12 + 15) >> 4));
  if (!(unsigned __int16)((v12 + 15) >> 4))
  {
    int v22 = (unsigned __int16)(v11 - (v14 + ((v12 + 15) >> 4)));
    uint64_t v24 = v8;
    goto LABEL_14;
  }

  int v33 = v11 - (v14 + ((v12 + 15) >> 4));
  uint64_t v31 = v12 + should_clear;
  int v32 = a3 + 15;
  uint64_t v17 = *(void *)(a1 + 17136);
  int v18 = *(_DWORD *)((should_clear & 0xFFFFFFFFFFF00000LL) + 0x18);
  unint64_t v19 = (os_unfair_lock_s *)(v17 + 2560LL * v18);
  os_unfair_lock_lock_with_options();
  int v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
  if (v20 != v18)
  {
    do
    {
      os_unfair_lock_unlock(v19);
      unint64_t v19 = (os_unfair_lock_s *)(v17 + 2560LL * v20);
      os_unfair_lock_lock_with_options();
      BOOL v21 = v20 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
      int v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
    }

    while (!v21);
  }

  set_tiny_meta_header_in_use(v31, (unsigned __int16)v14);
  ++v19[542]._os_unfair_lock_opaque;
  LOWORD(v16) = v33;
  int v22 = (unsigned __int16)v33;
  if ((_WORD)v33) {
    *(_DWORD *)((v31 & 0xFFFFFFFFFFF00000LL | ((v14 + (((v31 & 0xFFFFFuLL) - 16512) >> 4)) >> 2) & 0x3FF8) + 0x2C) |= 1 << (v14 + (((v31 & 0xFFFFFuLL) - 16512) >> 4));
  }
  os_unfair_lock_unlock(v19);
  uint64_t v23 = (16 * v15);
  uint64_t v24 = v34;
  free_tiny(v34, v10, v10 & 0xFFFFFFFFFFF00000LL, v23, 1);
  uint64_t v10 = v31;
  int v13 = v32;
  if ((_WORD)v33)
  {
LABEL_14:
    int v35 = v22;
    uint64_t v25 = (*(void *)&v13 & 0xFFFF0LL) + v10;
    uint64_t v26 = *(void *)(a1 + 17136);
    int v27 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
    unint64_t v28 = (os_unfair_lock_s *)(v26 + 2560LL * v27);
    os_unfair_lock_lock_with_options();
    int v29 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
    if (v29 != v27)
    {
      do
      {
        os_unfair_lock_unlock(v28);
        unint64_t v28 = (os_unfair_lock_s *)(v26 + 2560LL * v29);
        os_unfair_lock_lock_with_options();
        BOOL v21 = v29 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
        int v29 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
      }

      while (!v21);
    }

    set_tiny_meta_header_in_use(v25, (unsigned __int16)v16);
    ++v28[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v28);
    free_tiny(v24, v25, v25 & 0xFFFFFFFFFFF00000LL, (16 * v35), 1);
  }

  return v10;
}

uint64_t tiny_malloc_should_clear(uint64_t a1, uint64_t a2, int a3)
{
  signed int v6 = rack_get_thread_index() % *(_DWORD *)(a1 + 608);
  uint64_t v7 = *(void *)(a1 + 624);
  uint64_t v8 = (os_unfair_lock_s *)(v7 + 2560LL * v6);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v10 = v7 + 2560LL * v6;
  int v12 = *(unsigned __int16 *)(v10 + 16);
  unint64_t v11 = (_WORD *)(v10 + 16);
  if (v12 == (_DWORD)a2)
  {
    uint64_t v13 = v7 + 2560LL * v6;
    uint64_t v14 = *(void *)(v13 + 8);
    *(void *)(v13 + 8) = 0LL;
    *unint64_t v11 = 0;
    *(void *)(v13 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)v13);
    if (malloc_zero_policy != 2)
    {
      if (malloc_zero_policy != 1)
      {
        if (!malloc_zero_policy)
        {
          uint64_t v15 = malloc_zero_on_free_sample_period;
          if (malloc_zero_on_free_sample_period)
          {
            unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v17 = *(void *)(StatusReg + 888);
            BOOL v18 = v17 + 1 == v15;
            if (v17 + 1 == v15) {
              uint64_t v19 = 0LL;
            }
            else {
              uint64_t v19 = v17 + 1;
            }
            *(void *)(StatusReg + 888) = v19;
            if (v18 && _platform_memcmp_zero_aligned8()) {
              tiny_zero_corruption_abort(v14);
            }
          }
        }

        return v14;
      }

      if (!a3) {
        return v14;
      }
    }

    _platform_memset();
    return v14;
  }

  tiny_malloc_from_free_list(a1, v7 + 2560LL * v6, v9, a2);
  uint64_t v14 = v20;
  if (v20)
  {
LABEL_16:
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560LL * v6));
    tiny_check_zero_or_clear(v14, a2, a3);
    return v14;
  }

  uint64_t v21 = v7 + 2560LL * v6;
  __int128 v62 = (_DWORD *)(v21 + 2168);
  unint64_t v63 = (int64x2_t *)(v21 + 2152);
  unint64_t v61 = (unint64_t *)(v21 + 2176);
  __int128 v64 = (unint64_t *)(v21 + 2184);
  unint64_t v65 = (_DWORD *)(v21 + 2172);
  int v22 = (os_unfair_lock_s *)(v21 + 4);
  int64x2_t v59 = vdupq_n_s64(0xFBF80uLL);
  int64x2_t v60 = vdupq_n_s64(0xFFFFFFFFFFF04080LL);
  while (2)
  {
    uint64_t v23 = *(void *)(a1 + 624);
    unint64_t v66 = (os_unfair_lock_s *)(v23 - 2560);
    os_unfair_lock_lock_with_options();
    uint64_t v24 = v23 - 2528;
    uint64_t v25 = (uint64_t *)(v23 - 2024);
    unsigned __int16 v26 = a2;
    while (1)
    {
      uint64_t v27 = v26 - 1;
      uint64_t v28 = *(void *)(v24 + 8 * v27);
      if (!v28
        && ((unint64_t v29 = *(void *)(v23 - 472) & (-1LL << v27)) == 0
         || ((v30 = (uint64_t *)(v24 + 8 * __clz(__rbit64(v29))), v30 >= v25) || (uint64_t v28 = *v30) == 0) && (uint64_t v28 = *v25) == 0)
        || (unint64_t v31 = v28 & 0xFFFFFFFFFFF00000LL, (v28 & 0xFFFFFFFFFFF00000LL) == 0))
      {
LABEL_29:
        os_unfair_lock_unlock(v66);
        goto LABEL_40;
      }

      if (!*(_DWORD *)((v28 & 0xFFFFFFFFFFF00000LL) + 0x1C)) {
        break;
      }
      if (++v26 > 0x3Fu) {
        goto LABEL_29;
      }
    }

    uint64_t v32 = *(void *)v31;
    int v33 = *(void **)((v28 & 0xFFFFFFFFFFF00000LL) + 8);
    uint64_t v58 = v22;
    if (*(void *)v31)
    {
      *(void *)(v32 + 8) = v33;
      int v33 = *(void **)((v28 & 0xFFFFFFFFFFF00000LL) + 8);
    }

    else
    {
      *(void *)(v23 - 384) = v33;
    }

    if (!v33) {
      int v33 = (void *)(v23 - 376);
    }
    *int v33 = v32;
    *(void *)unint64_t v31 = 0LL;
    *(void *)((v28 & 0xFFFFFFFFFFF00000LL) + 8) = 0LL;
    --*(_DWORD *)(v23 - 388);
    uint64_t v34 = tiny_free_detach_region(a1, (uint64_t)v66, v31);
    *(_DWORD *)(v31 + 24) = v6;
    if (*(_DWORD *)(v31 + 28)) {
      purgeable_ptr_in_use_enumerator_cold_1(v34, v35, v36);
    }
    int v37 = v34;
    uint64_t v38 = tiny_free_reattach_region(a1, v7 + 2560LL * v6, v31);
    int64x2_t v39 = *(int64x2_t *)(v23 - 408);
    v40.i64[1] = v60.i64[1];
    v40.i64[0] = v38;
    v40.i64[0] = vsubq_s64(v39, v40).u64[0];
    v40.i64[1] = vaddq_s64(v39, v60).i64[1];
    *(int64x2_t *)(v23 - 408) = v40;
    *(_DWORD *)(v23 - 392) -= v37;
    v40.i64[1] = v59.i64[1];
    v40.i64[0] = v38;
    *unint64_t v63 = vaddq_s64(*v63, v40);
    *v62 += v37;
    unint64_t v41 = *v64;
    if (*v64) {
      *(void *)(v41 + 8) = v31;
    }
    else {
      *unint64_t v61 = v31;
    }
    int v22 = v58;
    *(void *)unint64_t v31 = v41;
    *__int128 v64 = v31;
    *(void *)(v31 + 8) = 0LL;
    *(_BYTE *)(v31 + 32) = 0;
    ++*v65;
    os_unfair_lock_unlock(v66);
    tiny_malloc_from_free_list(a1, v7 + 2560LL * v6, v31, a2);
    if (v42)
    {
      uint64_t v14 = v42;
      goto LABEL_16;
    }

unint64_t set_tiny_meta_header_in_use(uint64_t a1, int a2)
{
  unint64_t v2 = a1 & 0xFFFFF;
  unint64_t result = a1 & 0xFFFFFFFFFFF00000LL | 0x28;
  v2 -= 16512LL;
  unint64_t v4 = v2 >> 4;
  *(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)) = vorr_s8( *(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(1 << (v2 >> 4)));
  int v5 = (v2 >> 4) + 1;
  int v6 = (unsigned __int16)(v4 + 1) >> 4;
  int v7 = v6 & 0xFFE;
  char v8 = v5 & 0x1F;
  unsigned int v9 = (v5 & 0x1F) + (unsigned __int16)(a2 - 1);
  if (v9 < 0x40)
  {
    unsigned int v12 = 0x7FFFFFFFu >> (v8 ^ 0x1F);
    if (v9 < 0x20)
    {
      int v10 = v12 | (-1 << v9);
      *(_DWORD *)(result + 4LL * (v6 & 0xFFE)) &= v10;
      uint64_t v11 = v6 | 1u;
    }

    else
    {
      int v10 = -1 << v9;
      *(int8x8_t *)(result + 4LL * (v6 & 0xFFE)) = vand_s8( *(int8x8_t *)(result + 4LL * (v6 & 0xFFE)),  (int8x8_t)vdup_n_s32(v12));
      *(_DWORD *)(result + 4LL * (v7 + 2)) &= v10;
      uint64_t v11 = (v7 + 3);
    }
  }

  else
  {
    *(int8x8_t *)(result + 4LL * (v6 & 0xFFE)) = vand_s8( *(int8x8_t *)(result + 4LL * (v6 & 0xFFE)),  (int8x8_t)vdup_n_s32(0x7FFFFFFFu >> (v8 ^ 0x1F)));
    int v10 = -1 << v9;
    *(void *)(result + 4LL * (v7 + 2)) = 0LL;
    *(_DWORD *)(result + 4LL * (v7 + 4)) &= v10;
    uint64_t v11 = (v7 + 5);
  }

  *(_DWORD *)(result + 4 * v11) &= v10;
  *(_DWORD *)(result + 4LL * (((a2 - 1 + v5) >> 4) & 0xFFE)) |= 1 << (a2 - 1 + v5);
  return result;
}

void free_tiny(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v7 = a3;
  int v10 = *(_DWORD *)(a3 + 24);
  uint64_t v11 = *(void *)(a1 + 624);
  unsigned int v12 = (os_unfair_lock_s *)(v11 + 2560LL * v10);
  if (malloc_tracing_enabled)
  {
    kdebug_trace();
    if (a4) {
      goto LABEL_3;
    }
  }

  else if (a4)
  {
LABEL_3:
    unint64_t v13 = (unint64_t)(a4 + 15) >> 4;
    goto LABEL_4;
  }

  unint64_t v23 = a2 & 0xFFFFFFFFFFF00000LL | 0x28;
  unsigned int v24 = a2 - (a2 & 0xFFF00000 | 0x4080);
  unsigned int v25 = (v24 >> 8) & 0xFFE;
  int v26 = 1 << (v24 >> 4);
  uint64_t v27 = (unsigned int *)(v23 + 4LL * v25);
  unint64_t v28 = *v27;
  if ((v28 & v26) != 0)
  {
    if ((*(_DWORD *)(v23 + 4LL * (v25 | 1)) & v26) == 0) {
      goto LABEL_31;
    }
    int v29 = (v24 >> 4) & 0x1F;
    unint64_t v30 = ((unint64_t)v27[2] << (32 - v29)) | (v28 >> v29);
    if (v29) {
      v30 |= (unint64_t)v27[4] << -(char)v29;
    }
    __int16 v31 = __clz(__rbit64(v30 >> 1));
    if (v30 >= 2) {
      LOWORD(v13) = v31 + 1;
    }
    else {
      LOWORD(v13) = 0;
    }
  }

  else
  {
    LOWORD(v13) = 0;
  }

LABEL_4:
  if (!malloc_zero_policy) {
    _platform_memset();
  }
  os_unfair_lock_lock_with_options();
  char v14 = 0;
  if (a5 || v10 == -1 || (unsigned __int16)v13 > 0xFu)
  {
    uint64_t v16 = a2;
    goto LABEL_17;
  }

  uint64_t v15 = v11 + 2560LL * v10;
  uint64_t v18 = *(void *)(v15 + 8);
  uint64_t v17 = v15 + 8;
  uint64_t v16 = v18;
  if (v18 == a2)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 2560LL * v10));
LABEL_31:
    free_tiny_botch(a1);
    return;
  }

  __int16 v19 = *(_WORD *)(v17 + 8);
  uint64_t v20 = *(void *)(v17 + 16);
  if (malloc_zero_policy && (*(_BYTE *)(a1 + 620) & 0x20) != 0 && (_WORD)v13)
  {
    __int16 v33 = *(_WORD *)(v17 + 8);
    uint64_t v32 = *(void *)(v17 + 16);
    _platform_memset();
    uint64_t v20 = v32;
    __int16 v19 = v33;
  }

  *(void *)uint64_t v17 = a2;
  *(_WORD *)(v17 + 8) = v13;
  *(void *)(v17 + 16) = v7;
  if (!v16) {
    goto LABEL_20;
  }
  char v14 = 2;
  LOWORD(v13) = v19;
  uint64_t v7 = v20;
LABEL_17:
  for (int i = *(_DWORD *)(v7 + 24); v10 != i; int i = *(_DWORD *)(v7 + 24))
  {
    int v10 = i;
    os_unfair_lock_unlock(v12);
    unsigned int v12 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560LL * v10);
    os_unfair_lock_lock_with_options();
  }

  tiny_free_no_lock(a1, (uint64_t)v12, v10, v7, v16, (unsigned __int16)v13, v14 | (a5 != 0));
  if (v22) {
LABEL_20:
  }
    os_unfair_lock_unlock(v12);
}

BOOL tiny_claimed_address(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFFF00000LL;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55LL * (a2 >> 20)) >> -*((_BYTE *)v2 + 8);
    unint64_t v7 = v6;
    do
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        break;
      }
      if (v8 == v4)
      {
        BOOL v10 = v4 + 16512 <= a2 && v4 + 0x100000 > a2;
        return v4 && v10;
      }

      if (v7 + 1 == v3) {
        unint64_t v7 = 0LL;
      }
      else {
        ++v7;
      }
    }

    while (v7 != v6);
  }

  return 0LL;
}

uint64_t tiny_try_shrink_in_place(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned __int16 v5 = (a3 >> 4) - (a4 >> 4);
  if (v5)
  {
    uint64_t v7 = (a4 & 0xFFFF0) + a2;
    uint64_t v8 = *(void *)(a1 + 624);
    int v9 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
    BOOL v10 = (os_unfair_lock_s *)(v8 + 2560LL * v9);
    os_unfair_lock_lock_with_options();
    int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
    if (v11 != v9)
    {
      do
      {
        os_unfair_lock_unlock(v10);
        BOOL v10 = (os_unfair_lock_s *)(v8 + 2560LL * v11);
        os_unfair_lock_lock_with_options();
        BOOL v12 = v11 == *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
        int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
      }

      while (!v12);
    }

    set_tiny_meta_header_in_use(v7, v5);
    ++v10[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v10);
    free_tiny(a1, v7, v7 & 0xFFFFFFFFFFF00000LL, 0LL, 1);
  }

  return a2;
}

uint64_t tiny_try_realloc_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = a3 >> 4;
  unint64_t v9 = a2 & 0xFFFFFFFFFFF00000LL;
  uint64_t v10 = *(void *)(a1 + 624);
  int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
  uint64_t v12 = v10 + 2560LL * v11;
  os_unfair_lock_lock_with_options();
  for (int i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18); v11 != i; int i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18))
  {
    int v11 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    uint64_t v12 = v10 + 2560LL * v11;
    os_unfair_lock_lock_with_options();
  }

  if (v11 == -1)
  {
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    return 0LL;
  }

  unint64_t v14 = a2 + a3;
  int v15 = (unsigned __int16)(a3 >> 4);
  unsigned int v16 = (unsigned __int16)((a4 + 15) >> 4);
  unsigned int v17 = ((a4 + 15) >> 4) - v5;
  if (*(void *)(v12 + 8) == v14 && (int v18 = *(unsigned __int16 *)(v12 + 16), v15 + v18 >= v16))
  {
    if (v18 == (unsigned __int16)v17)
    {
      *(void *)(v12 + 8) = 0LL;
      *(_WORD *)(v12 + 16) = 0;
      *(void *)(v12 + 24) = 0LL;
      --*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x14);
    }

    else
    {
      *(_WORD *)(v12 + 16) = v18 - v17;
      *(void *)(v12 + 8) = a2 + a4;
      set_tiny_meta_header_in_use(v14 + 16 * (unsigned __int16)v17, (unsigned __int16)(v18 - v17));
    }

    *(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000LL | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000LL | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v14 & 0xFFFFF) - 16512) >> 4))));
    if (malloc_zero_policy == 2)
    {
      _platform_memset();
    }

    else if (!malloc_zero_policy)
    {
      uint64_t v38 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v40 = *(void *)(StatusReg + 888);
        BOOL v41 = v40 + 1 == v38;
        uint64_t v42 = v40 + 1 == v38 ? 0LL : v40 + 1;
        *(void *)(StatusReg + 888) = v42;
        if (v41)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v14);
          }
        }
      }
    }

    LOWORD(v17) = 0;
  }

  else if (*(void *)(v12 + 2144) == v9 {
         && ((uint64_t v19 = *(void *)(v12 + 2128),
  }
              (unsigned __int16)v17 < (unsigned __int16)(v19 >> 4))
           ? (BOOL v20 = (v9 | 0x4080) - v19 + 1032064 == v14)
           : (BOOL v20 = 0),
             v20))
  {
    *(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000LL | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000LL | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v14 & 0xFFFFF) - 16512) >> 4))));
    uint64_t v27 = v19 - 16 * (unsigned __int16)v17;
    *(void *)(v12 + 2128) = v27;
    if (v27)
    {
      uint64_t v28 = a2 + 16 * v16;
      uint64_t v29 = v28 & 0xFFFFF;
      unint64_t v30 = v28 & 0xFFFFFFFFFFF00000LL | 0x28;
      unint64_t v31 = v29 - 16512;
      unint64_t v32 = (unint64_t)(v29 - 16512) >> 4;
      *(int8x8_t *)(v30 + ((v31 >> 6) & 0x3FF8)) = vorr_s8( *(int8x8_t *)(v30 + ((v31 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(1 << v32));
      *(_DWORD *)(v30 + 4LL * (((v32 + 1) >> 4) & 0xFFE)) |= 1 << (v32 + 1);
    }

    if (malloc_zero_policy == 2)
    {
      _platform_memset();
    }

    else if (!malloc_zero_policy)
    {
      uint64_t v33 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        unint64_t v34 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v35 = *(void *)(v34 + 888);
        BOOL v36 = v35 + 1 == v33;
        uint64_t v37 = v35 + 1 == v33 ? 0LL : v35 + 1;
        *(void *)(v34 + 888) = v37;
        if (v36)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v14);
          }
        }
      }
    }
  }

  else
  {
    unint64_t v21 = v14 & 0xFFFFFFFFFFF00000LL | 0x4080;
    unint64_t v22 = ((v14 - v21) >> 8) & 0xFFE;
    unint64_t v23 = (int8x8_t *)((v14 & 0xFFFFFFFFFFF00000LL | (8 * ((v22 >> 1) & 0x7FF))) + 40);
    int v24 = 1 << ((v14 - v21) >> 4);
    if ((*(_DWORD *)((v14 & 0xFFFFFFFFFFF00000LL | (8 * ((v22 >> 1) & 0x7FF))) + 0x28) & v24) == 0
      || (*(_DWORD *)((v14 & 0xFFFFFFFFFFF00000LL) + 4 * v22 + 0x2C) & v24) != 0)
    {
      goto LABEL_18;
    }

    int v25 = v14 + 16 >= v21 + 1032064
       || ((*(_DWORD *)(((v14 + 16) & 0xFFFFFFFFFFF00000LL | ((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v14 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0
        ? 1
        : *(unsigned __int16 *)(v14 + 16);
    if (v15 + v25 < v16) {
      goto LABEL_18;
    }
    tiny_free_list_remove_ptr(a1, v12, v14, v25);
    *unint64_t v23 = vand_s8(*v23, (int8x8_t)vdup_n_s32(~v24));
    int v43 = malloc_zero_policy;
    if (!malloc_zero_policy)
    {
      _tiny_check_and_zero_inline_meta_from_freelist(a1, v14, v25);
      int v43 = malloc_zero_policy;
    }

    if (v43 == 2)
    {
      _platform_memset();
    }

    else if (!v43)
    {
      uint64_t v44 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        unint64_t v45 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v46 = *(void *)(v45 + 888);
        BOOL v47 = v46 + 1 == v44;
        uint64_t v48 = v46 + 1 == v44 ? 0LL : v46 + 1;
        *(void *)(v45 + 888) = v48;
        if (v47)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v14);
          }
        }
      }
    }

    set_tiny_meta_header_in_use(a2, v16);
  }

  uint64_t v49 = 16 * (unsigned __int16)v17;
  *(void *)(v12 + 2152) += v49;
  LODWORD(v49) = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x10) + v49;
  *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x1malloc_zone_register_while_locked((uint64_t)zone, 0) = v49;
  os_unfair_lock_unlock((os_unfair_lock_t)v12);
  return 1LL;
}

void tiny_check_zero_or_clear(uint64_t a1, uint64_t a2, int a3)
{
  switch(malloc_zero_policy)
  {
    case 2:
LABEL_13:
      _platform_memset();
      return;
    case 1:
      if (!a3) {
        return;
      }
      goto LABEL_13;
    case 0:
      uint64_t v4 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v6 = *(void *)(StatusReg + 888);
        BOOL v7 = v6 + 1 == v4;
        if (v6 + 1 == v4) {
          uint64_t v8 = 0LL;
        }
        else {
          uint64_t v8 = v6 + 1;
        }
        *(void *)(StatusReg + 888) = v8;
        if (v7)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(a1);
          }
        }
      }

      break;
  }

void tiny_check_region(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a1 + 624);
  if (!*(_DWORD *)(a2 + 28)) {
    return;
  }
  uint64_t v6 = a2 + 16512;
  if (*(void *)(v3 + 2560LL * v2 + 2144) == a2)
  {
    uint64_t v9 = *(void *)(v3 + 2560LL * v2 + 2136);
    unint64_t v8 = v9 + v6;
    if (v9)
    {
      unint64_t v10 = (v8 - 16) & 0xFFFFFFFFFFF00000LL;
      uint64_t v11 = v10 | 0x28;
      unsigned int v12 = v8 - 16 - (v10 | 0x4080);
      unsigned int v13 = (v12 >> 8) & 0xFFE;
      int v14 = 1 << (v12 >> 4);
      int v15 = (unsigned int *)((v10 | 0x28) + 4LL * v13);
      unint64_t v16 = *v15;
      int v17 = (v12 >> 4) & 0x1F;
      unint64_t v18 = ((unint64_t)v15[2] << (32 - v17)) | (v16 >> ((v12 >> 4) & 0x1F));
      if (v17) {
        v18 |= (unint64_t)v15[4] << -(char)v17;
      }
      int v19 = __clz(__rbit64(v18 >> 1));
      int v20 = v18 >= 2 ? v19 + 1 : 0;
      if (v20 != 1)
      {
LABEL_54:
        uint64_t v50 = "%ld, counter=%d\n*** invariant broken for leader block %p - %d %d\n";
        goto LABEL_55;
      }
    }

    uint64_t v53 = *(void *)(v3 + 2560LL * v2 + 2144);
    unint64_t v7 = a2 + 0x100000 - *(void *)(v3 + 2560LL * v2 + 2128);
  }

  else
  {
    uint64_t v53 = *(void *)(v3 + 2560LL * v2 + 2144);
    unint64_t v7 = a2 + 0x100000;
    unint64_t v8 = a2 + 16512;
  }

  if (v8 >= v7)
  {
    int v31 = 0;
LABEL_43:
    int v54 = v31;
    if (v8 == v7)
    {
LABEL_44:
      if (v53 != a2) {
        return;
      }
      if (!*(void *)(v3 + 2560LL * v2 + 2128)) {
        return;
      }
      int tiny_meta_header = get_tiny_meta_header(v7, &v54);
      if (!v54 && tiny_meta_header == 1) {
        return;
      }
      uint64_t v50 = "%ld, counter=%d\n*** invariant broken for blocker block %p - %d %d\n";
    }

    else
    {
      uint64_t v50 = "%ld, counter=%d\n*** invariant broken for region end %p - %p\n";
    }

uint64_t get_tiny_previous_free_msize(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFF00000LL | 0x4080) == a1)
  {
    return 0;
  }

  else if (((*(_DWORD *)(((a1 - 16) & 0xFFFFFFFFFFF00000LL | ((((a1 - 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)a1 - 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    return 1;
  }

  else
  {
    return *(unsigned __int16 *)(a1 - 2);
  }

uint64_t tiny_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v47 = *MEMORY[0x1895FEE08];
  uint64_t v41 = 0LL;
  uint64_t result = v3(v0, *(void *)(v5 + 16536), 32LL, (uint64_t *)&v40);
  if (!(_DWORD)result)
  {
    uint64_t v39 = *v40;
    uint64_t result = v4(v11, v40[2], 8 * *v40, &v45);
    if (!(_DWORD)result)
    {
      if ((v8 & 1) == 0
        || (uint64_t result = v4(v11, *(void *)(v6 + 17136), 2560LL * *(int *)(v6 + 17120), &v41), !(_DWORD)result))
      {
        if (v39)
        {
          uint64_t v13 = 0LL;
          char v34 = v8;
          int v35 = v8 & 6;
          uint64_t v37 = v2;
          unint64_t v38 = (unsigned int *)(v6 + 17120);
          uint64_t v36 = v10;
          while (1)
          {
            uint64_t v14 = *(void *)(v45 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                v44[0] = *(void *)(v45 + 8 * v13);
                v44[1] = 16420LL;
                ((void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))v2)(v11, v10, 4LL, v44, 1LL);
              }

              uint64_t v15 = v14 + 16512;
              if (v35)
              {
                v43[0] = v14 + 16512;
                v43[1] = 1032064LL;
                ((void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))v2)(v11, v10, 2LL, v43, 1LL);
              }

              if ((v8 & 1) != 0) {
                break;
              }
            }

void tiny_malloc_from_free_list(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4 = a4;
  uint64_t v6 = a1;
  else {
    uint64_t v7 = 63LL;
  }
  uint64_t v8 = a2 + 32;
  uint64_t v9 = *(void *)(a2 + 32 + 8LL * v7);
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 8);
    uint64_t v11 = __ROR8__(v10, 60);
    unsigned int v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v13 = v11 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(a1 + 632);
    if (((v11 ^ (HIDWORD(v13)
                              + (_DWORD)v13
                              + ((HIDWORD(v13) + v13) >> 16)
                              + ((HIDWORD(v13) + (_DWORD)v13 + ((HIDWORD(v13) + v13) >> 16)) >> 8))) & 0xFLL) == 0)
    {
      if (v12) {
        *unsigned int v12 = *(void *)v9;
      }
      else {
        *(_DWORD *)(a2 + 4LL * (v7 >> 5) + 2088) &= ~(1 << v7);
      }
      *(void *)(v8 + 8 * v7) = v12;
      unint64_t v23 = v9 & 0xFFFFFFFFFFF00000LL;
      uint64_t v24 = (_WORD *)((v9 & 0xFFFFFFFFFFF00000LL) + 4 * v7 + 16168);
      int v25 = *(unsigned __int16 *)((v9 & 0xFFFFFFFFFFF00000LL) + 4 * v7 + 0x3F28);
      if (v12) {
        BOOL v26 = (v11 & 0xFFFFFFFFFFF00000LL) == v23;
      }
      else {
        BOOL v26 = 0;
      }
      if (v26)
      {
        unsigned int v27 = ((v11 - (v23 | 0x4080)) >> 4) + 1;
        unint64_t v28 = (_WORD *)(v23 + 4 * v7 + 16170);
      }

      else
      {
        LOWORD(v27) = 0;
        *(_WORD *)((v9 & 0xFFFFFFFFFFF00000LL) + 4 * v7 + 0x3F2A) = 0;
      }

      *uint64_t v24 = v27;
      if (!malloc_zero_policy) {
        _tiny_check_and_zero_inline_meta_from_freelist(a1, v9, a4);
      }
      goto LABEL_76;
    }

    while (1)
    {
LABEL_87:
      free_list_checksum_botch(a1);
      __break(1u);
LABEL_88:
      a1 = v6;
    }
  }

  unint64_t v14 = *(void *)(a2 + 2088) & (-1LL << v7);
  if (v14)
  {
    unint64_t v15 = __clz(__rbit64(v14));
    uint64_t v16 = (uint64_t *)(a2 + 536);
    int v17 = (uint64_t *)(v8 + 8 * v15);
    if ((unint64_t)v17 < a2 + 536)
    {
      uint64_t v9 = *v17;
      if (*v17)
      {
        uint64_t v18 = v9 + 8;
        uint64_t v19 = *(void *)(v9 + 8);
        uint64_t v20 = __ROR8__(v19, 60);
        unsigned int v21 = (void *)(v20 & 0xFFFFFFFFFFFFFFF0LL);
        unint64_t v22 = v20 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(a1 + 632);
        if (((v20 ^ (HIDWORD(v22) {
                                  + (_DWORD)v22
        }
                                  + ((HIDWORD(v22) + v22) >> 16)
        *int v17 = (uint64_t)v21;
        if (v21) {
          *unsigned int v21 = *(void *)v9;
        }
        else {
          *(_DWORD *)(a2 + ((v15 >> 3) & 0xC) + 2088) &= ~(1 << v15);
        }
        unint64_t v61 = v9 & 0xFFFFFFFFFFF00000LL;
        unint64_t v62 = v9 & 0xFFFFFFFFFFF00000LL | 0x4080;
        if (v9 + 16 >= v62 + 1032064
          || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000LL | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v31 = 1;
        }

        else
        {
          unsigned int v31 = *(unsigned __int16 *)(v9 + 16);
        }

        if (v31 < a4)
        {
          unint64_t v74 = v15;
          malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
          unint64_t v15 = v74;
        }

        unint64_t v63 = (_WORD *)(v61 + 4 * v15 + 16168);
        int v64 = (unsigned __int16)*v63;
        if (v21) {
          BOOL v65 = (v20 & 0xFFFFFFFFFFF00000LL) == v61;
        }
        else {
          BOOL v65 = 0;
        }
        if (v65)
        {
          unsigned int v66 = ((v20 - v62) >> 4) + 1;
          int v67 = (_WORD *)(v61 + 4 * v15 + 16170);
        }

        else
        {
          LOWORD(v66) = 0;
          *(_WORD *)((v9 & 0xFFFFFFFFFFF00000LL) + 4 * v15 + 0x3F2A) = 0;
        }

        *unint64_t v63 = v66;
LABEL_67:
        if (!malloc_zero_policy) {
          _tiny_check_and_zero_inline_meta_from_freelist(v6, v9, v31);
        }
        else {
          unsigned int v4 = v31;
        }
        goto LABEL_76;
      }
    }

    uint64_t v9 = *v16;
    if (*v16)
    {
      unint64_t v29 = v9 & 0xFFFFFFFFFFF00000LL;
      unint64_t v30 = v9 & 0xFFFFFFFFFFF00000LL | 0x4080;
      if (v9 + 16 >= v30 + 1032064
        || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000LL | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
      {
        unsigned int v31 = 1;
      }

      else
      {
        unsigned int v31 = *(unsigned __int16 *)(v9 + 16);
      }

      int v32 = v31 - a4;
      if (v31 < a4)
      {
        unint64_t v73 = v15;
        malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
        LODWORD(v3malloc_zone_register_while_locked((uint64_t)zone, 0) = v9 & 0xFFF00000 | 0x4080;
        unint64_t v29 = v9 & 0xFFFFFFFFFFF00000LL;
        unint64_t v15 = v73;
      }

      uint64_t v33 = v9 + 8;
      uint64_t v34 = *(void *)(v9 + 8);
      uint64_t v35 = __ROR8__(v34, 60);
      uint64_t v36 = (void *)(v35 & 0xFFFFFFFFFFFFFFF0LL);
      unint64_t v37 = v35 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(v6 + 632);
      if (((v35 ^ (HIDWORD(v37) {
                                + (_DWORD)v37
      }
                                + ((HIDWORD(v37) + v37) >> 16)
      if (v32 >= 64)
      {
        uint64_t v38 = v9 + 16 * v4;
        uint64_t v39 = *(void *)v9;
        if (!malloc_zero_policy)
        {
          unsigned int v40 = v31;
          uint64_t v75 = *(void *)v9;
          unint64_t v76 = v29;
          int v41 = v30;
          _tiny_check_and_zero_inline_meta_from_freelist(v6, v9, v40);
          uint64_t v39 = v75;
          unint64_t v29 = v76;
          LODWORD(v3malloc_zone_register_while_locked((uint64_t)zone, 0) = v41;
        }

        *uint64_t v16 = v38;
        if (v36)
        {
          uint64_t v42 = *(void *)(v6 + 632) ^ v38;
          *((void *)&v43 + 1) = HIDWORD(v42)
                                + (_DWORD)v42
          *(void *)&__int128 v43 = v9 + 16 * v4;
          *uint64_t v36 = v43 >> 4;
        }

        *(void *)uint64_t v38 = v39;
        *(void *)(v38 + 8) = v34;
        unint64_t v44 = (v38 & 0xFFFFF) - 16512;
        unint64_t v45 = v38 & 0xFFFFFFFFFFF00000LL | (v44 >> 6) & 0x3FF8;
        LODWORD(v44) = 1 << (v44 >> 4);
        int v46 = *(_DWORD *)(v45 + 40) | v44;
        LODWORD(v44) = *(_DWORD *)(v45 + 44) & ~(_DWORD)v44;
        *(_DWORD *)(v45 + 4malloc_zone_register_while_locked((uint64_t)zone, 0) = v46;
        *(_DWORD *)(v45 + 44) = v44;
        *(_WORD *)(v38 + 16 * (unsigned __int16)v32 - 2) = v32;
        *(_WORD *)(v38 + 16) = v32;
        int v47 = *(unsigned __int16 *)(v29 + 16420);
        if ((v38 & 0xFFFFFFFFFFF00000LL) == v29)
        {
          unsigned int v48 = ((v38 - v30) >> 4) + 1;
        }

        else
        {
          LOWORD(v48) = 0;
          *(_WORD *)(v29 + 16422) = 0;
        }

        *(_WORD *)(v29 + 1642malloc_zone_register_while_locked((uint64_t)zone, 0) = v48;
        goto LABEL_76;
      }

      if (v36) {
        *uint64_t v36 = *(void *)v9;
      }
      *uint64_t v16 = (uint64_t)v36;
      unint64_t v57 = (_WORD *)(v29 + 4 * v15 + 16168);
      int v58 = (unsigned __int16)*v57;
      if (v36 && (v35 & 0xFFFFFFFFFFF00000LL) == v29)
      {
        unsigned int v59 = ((v35 - v30) >> 4) + 1;
        int64x2_t v60 = (_WORD *)(v29 + 4 * v15 + 16170);
      }

      else
      {
        LOWORD(v59) = 0;
        *(_WORD *)(v29 + 4 * v15 + 1617malloc_zone_register_while_locked((uint64_t)zone, 0) = 0;
      }

      *unint64_t v57 = v59;
      goto LABEL_67;
    }
  }

  unint64_t v49 = *(void *)(a2 + 2128);
  uint64_t v50 = 16LL * a4;
  uint64_t v9 = *(void *)(a2 + 2144) - v49 + 0x100000;
  unint64_t v51 = v49 - v50;
  *(void *)(a2 + 2128) = v51;
  if (v51)
  {
    uint64_t v52 = v9 + v50;
    uint64_t v53 = v52 & 0xFFFFF;
    unint64_t v54 = v52 & 0xFFFFFFFFFFF00000LL | 0x28;
    unint64_t v55 = v53 - 16512;
    unint64_t v56 = (unint64_t)(v53 - 16512) >> 4;
    *(int8x8_t *)(v54 + ((v55 >> 6) & 0x3FF8)) = vorr_s8( *(int8x8_t *)(v54 + ((v55 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(1 << v56));
    *(_DWORD *)(v54 + 4LL * (((v56 + 1) >> 4) & 0xFFE)) |= 1 << (v56 + 1);
  }

LABEL_76:
  ++*(_DWORD *)(a2 + 2168);
  uint64_t v68 = 16 * v4;
  *(void *)(a2 + 2152) += v68;
  unint64_t v69 = v9 & 0xFFFFFFFFFFF00000LL;
  if (*(_DWORD *)(v9 & 0xFFFFFFFFFFF00000LL | 0x407C) == *(unsigned __int16 *)((char *)&malloc_entropy + 1))
  {
    int32x2_t v70 = vadd_s32(*(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000LL) + 0x10), (int32x2_t)(v68 | 0x100000000LL));
    *(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000LL) + 0x1malloc_zone_register_while_locked((uint64_t)zone, 0) = v70;
    if (v70.i32[0] >= 0xBCFA0u) {
      *(_BYTE *)((v9 & 0xFFFFFFFFFFF00000LL) + 0x2malloc_zone_register_while_locked((uint64_t)zone, 0) = 0;
    }
    if (v4 < 2)
    {
      unint64_t v71 = v69 + 40;
      unint64_t v72 = v9 - v69 - 16512;
      *(int8x8_t *)(v71 + ((v72 >> 6) & 0x3FF8)) = vorr_s8( *(int8x8_t *)(v71 + ((v72 >> 6) & 0x3FF8)),  (int8x8_t)vdup_n_s32(1 << (v72 >> 4)));
      *(_DWORD *)(v71 + 4LL * ((((v72 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v72 >> 4) + 1);
    }

    else
    {
      set_tiny_meta_header_in_use(v9, v4);
    }
  }

  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }

uint64_t tiny_size(uint64_t a1, unint64_t a2)
{
  int v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFFF00000LL;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55LL * (a2 >> 20)) >> -*((_BYTE *)v2 + 8);
    unint64_t v7 = v6;
    while (1)
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        return 0LL;
      }
      if (v8 == v4) {
        break;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0LL;
      }
      else {
        ++v7;
      }
      if (v7 == v6) {
        return 0LL;
      }
    }

    if (!v4) {
      return 0LL;
    }
    if ((((_DWORD)a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
    {
      malloc_printf("NO ZONE for ptr %p\n", (const void *)a2);
      return 0LL;
    }

    unsigned int v10 = a2 - v4 - 16512;
    unsigned int v11 = (v10 >> 8) & 0xFFE;
    int v12 = 1 << (v10 >> 4);
    unint64_t v13 = (unsigned int *)(v4 + 40 + 4LL * v11);
    unint64_t v14 = *v13;
    if ((v14 & v12) != 0)
    {
      if ((*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x28 + 4LL * (v11 | 1)) & v12) == 0) {
        return 0LL;
      }
      int v15 = (v10 >> 4) & 0x1F;
      unint64_t v16 = ((unint64_t)v13[2] << (32 - v15)) | (v14 >> v15);
      if (v15) {
        v16 |= (unint64_t)v13[4] << -(char)v15;
      }
      int v17 = __clz(__rbit64(v16 >> 1));
      if (v16 >= 2) {
        unsigned int v18 = v17 + 1;
      }
      else {
        unsigned int v18 = 0;
      }
      int v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
      if (v19 != -1)
      {
        if (v18 > 0xF)
        {
          unsigned int v18 = v17 + 1;
          return 16LL * v18;
        }

LABEL_26:
        if (*(void *)(*(void *)(a1 + 624) + 2560LL * v19 + 8) == a2) {
          return 0LL;
        }
        return 16LL * v18;
      }
    }

    else
    {
      unsigned int v18 = 0;
      int v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000LL) + 0x18);
      if (v19 != -1) {
        goto LABEL_26;
      }
    }

    uint64_t v20 = *(unsigned int *)(a1 + 608);
    uint64_t v21 = 0LL;
    uint64_t v22 = 2560 * v20;
    while (v18 > 0xF || *(void *)(*(void *)(a1 + 624) + v21 + 8) != a2)
    {
      v21 += 2560LL;
      if (v22 == v21) {
        return 16LL * v18;
      }
    }
  }

  return 0LL;
}

  uint64_t result = _simple_salloc();
  if (result)
  {
    unint64_t v37 = *(_DWORD *)(v43 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v44 | v4) {
      _simple_sprintf();
    }
    if (v37 != -1) {
      _simple_sprintf();
    }
    _simple_sprintf();
    if (v45 >= 2 && v17)
    {
      _simple_sappend();
      uint64_t v39 = 0LL;
      unsigned int v40 = v47;
      do
      {
        if (*v40++) {
          _simple_sprintf();
        }
        v39 += 16LL;
      }

      while (v39 != 0x4000);
    }

    uint64_t v42 = (const char *)_simple_string();
    v10("%s\n", v42);
    return _simple_sfree();
  }

  return result;
}

void free_tiny_botch(uint64_t a1)
{
}

uint64_t tiny_batch_malloc(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6 = a2 + 15;
  unsigned int v7 = (unsigned __int16)((a2 + 15) >> 4);
  uint64_t v8 = a1 + 16512;
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(a1 + 17136)
                          + 2560LL * (int)(rack_get_thread_index() % *(_DWORD *)(a1 + 17120)));
  if (((v6 >> 4) & 0xFFFE) != 0) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = 1;
  }
  os_unfair_lock_lock_with_options();
  if ((_DWORD)a4)
  {
    uint64_t v12 = 0LL;
    a4 = a4;
    while (1)
    {
      tiny_malloc_from_free_list(v8, (uint64_t)v9, v11, v10);
      if (!v13) {
        break;
      }
      *(void *)(a3 + 8 * v12++) = v13;
      if ((_DWORD)a4 == (_DWORD)v12) {
        goto LABEL_10;
      }
    }

    a4 = v12;
  }

void tiny_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a3) {
    return;
  }
  uint64_t v5 = 0LL;
  unsigned int v6 = 0LL;
  unint64_t v7 = 0LL;
  uint64_t v30 = a1 + 16512;
  int v8 = -1;
  uint64_t v9 = a3;
  while (1)
  {
    unint64_t v10 = *(void *)(a2 + 8 * v5);
    if (!v10) {
      goto LABEL_35;
    }
    unint64_t v11 = v10 & 0xFFFFFFFFFFF00000LL;
    if (!v7 || v7 != v11) {
      break;
    }
LABEL_21:
    if ((((_DWORD)v10 + 1032064) & 0xFFF80u) > 0xFBF70uLL) {
      goto LABEL_36;
    }
    unsigned int v20 = v10 - v11 - 16512;
    unsigned int v21 = (v20 >> 8) & 0xFFE;
    int v22 = 1 << (v20 >> 4);
    unint64_t v23 = (unsigned int *)(v11 + 40 + 4LL * v21);
    unint64_t v24 = *v23;
    if ((v24 & v22) != 0)
    {
      if ((*(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x28 + 4LL * (v21 | 1)) & v22) == 0) {
        goto LABEL_36;
      }
      int v25 = (v20 >> 4) & 0x1F;
      unint64_t v26 = ((unint64_t)v23[2] << (32 - ((v20 >> 4) & 0x1F))) | (v24 >> ((v20 >> 4) & 0x1F));
      if (v25) {
        v26 |= (unint64_t)v23[4] << -(char)v25;
      }
      int v27 = __clz(__rbit64(v26 >> 1));
      if (v26 >= 2) {
        int v28 = v27 + 1;
      }
      else {
        int v28 = 0;
      }
    }

    else
    {
      int v28 = 0;
    }

    if (!malloc_zero_policy) {
      _platform_memset();
    }
    tiny_free_no_lock(v30, (uint64_t)v6, v8, v7, v10, v28, 0);
    if (!v29)
    {
      unint64_t v7 = 0LL;
      unsigned int v6 = 0LL;
    }

    *(void *)(a2 + 8 * v5) = 0LL;
LABEL_35:
    if (++v5 == v9)
    {
LABEL_36:
      if (v6) {
        os_unfair_lock_unlock(v6);
      }
      return;
    }
  }

  if (v6) {
    os_unfair_lock_unlock(v6);
  }
  uint64_t v12 = *(uint64_t **)(a1 + 16536);
  uint64_t v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = v12[2];
    unint64_t v15 = (0x9E3779B97F4A7C55LL * (v10 >> 20)) >> -*((_BYTE *)v12 + 8);
    unint64_t v16 = v15;
    do
    {
      uint64_t v17 = *(void *)(v14 + 8 * v16);
      if (!v17) {
        break;
      }
      if (v17 == v11)
      {
        if (!v11) {
          return;
        }
        uint64_t v18 = *(void *)(a1 + 17136);
        int v8 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
        unsigned int v6 = (os_unfair_lock_s *)(v18 + 2560LL * v8);
        os_unfair_lock_lock_with_options();
        for (int i = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18);
              v8 != i;
              int i = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000LL) + 0x18))
        {
          int v8 = i;
          os_unfair_lock_unlock(v6);
          unsigned int v6 = (os_unfair_lock_s *)(v18 + 2560LL * v8);
          os_unfair_lock_lock_with_options();
        }

        unint64_t v7 = v10 & 0xFFFFFFFFFFF00000LL;
        goto LABEL_21;
      }

      if (v16 + 1 == v13) {
        unint64_t v16 = 0LL;
      }
      else {
        ++v16;
      }
    }

    while (v16 != v15);
  }

void print_tiny_free_list( uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  if (_simple_salloc())
  {
    if (a2(a1, a4, 768LL, &v18))
    {
      unint64_t v7 = "Failed to map tiny rack\n";
LABEL_6:
      a3(v7);
      return;
    }

    _simple_sappend();
    if (a2(a1, *(void *)(v18 + 624), 2560LL * *(int *)(v18 + 608), &v17))
    {
      unint64_t v7 = "Failed to map tiny rack magazines\n";
      goto LABEL_6;
    }

    if ((*(_DWORD *)(v18 + 608) & 0x80000000) == 0)
    {
      uint64_t v8 = -1LL;
      do
      {
        _simple_sprintf();
        for (uint64_t i = 0LL; i != 64; ++i)
        {
          unint64_t v10 = *(const void **)(v17 + 2560 * v8 + 8 * i + 32);
          if (v10)
          {
            int v11 = 0;
            uint64_t v12 = v18;
            while (v10)
            {
              if (a2(a1, (uint64_t)v10, 16LL, &v19))
              {
                a3("** invalid pointer in free list: %p\n", v10);
                break;
              }

              uint64_t v13 = __ROR8__(*(void *)(v19 + 8), 60);
              unint64_t v10 = (const void *)(v13 & 0xFFFFFFFFFFFFFFF0LL);
              unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(v12 + 632);
              ++v11;
              if (((v13 ^ (HIDWORD(v14)
                                        + (_DWORD)v14
                                        + ((HIDWORD(v14) + v14) >> 16)
                                        + ((HIDWORD(v14) + (_DWORD)v14 + ((HIDWORD(v14) + v14) >> 16)) >> 8))) & 0xFLL) != 0)
              {
                free_list_checksum_botch(v12);
                __break(1u);
                return;
              }
            }

            _simple_sprintf();
          }
        }

        _simple_sappend();
        ++v8;
      }

      while (v8 < *(int *)(v18 + 608));
    }

    unint64_t v15 = (const char *)_simple_string();
    a3("%s\n", v15);
    _simple_sfree();
  }

uint64_t print_tiny_region()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  unint64_t v10 = v9;
  uint64_t v48 = *MEMORY[0x1895FEE08];
  int v11 = (char *)(v5 + 16512);
  if (v12(v0, v5 + 16512, 0x100000LL, &v46)) {
    return v10("Failed to map tiny region at %p\n", v11);
  }
  if (v6 == -1)
  {
    uint64_t result = _simple_salloc();
    if (!result) {
      return result;
    }
    _simple_sprintf();
    uint64_t v38 = (const char *)_simple_string();
    v10("%s\n", v38);
    return _simple_sfree();
  }

  int v45 = v8;
  unint64_t v14 = (unint64_t)&v11[v4];
  uint64_t v44 = v2;
  unint64_t v15 = &v11[-v2 + 1032064];
  uint64_t v16 = v46;
  _platform_memset();
  uint64_t v43 = v16;
  int v17 = 0;
  uint64_t v18 = 0LL;
  if (&v11[v4] < v15)
  {
    uint64_t v19 = v16 - (void)v11;
    while (1)
    {
      unint64_t v20 = (v14 & 0xFFFFFFFFFFF00000LL) + v19 + 40;
      unint64_t v21 = v14 & 0xFFFFFFFFFFF00000LL | 0x4080;
      unsigned int v22 = ((v14 - v21) >> 8) & 0xFFE;
      int v23 = 1 << ((v14 - v21) >> 4);
      unint64_t v24 = (unsigned int *)(v20 + 4LL * v22);
      unint64_t v25 = *v24;
      if ((*(_DWORD *)(v20 + 4LL * (v22 | 1)) & v23) != 0)
      {
        unsigned int v26 = ((v14 - v21) >> 4) & 0x1F;
        unint64_t v27 = ((unint64_t)v24[2] << (32 - v26)) | (v25 >> v26);
        if (v26) {
          v27 |= (unint64_t)v24[4] << -(char)v26;
        }
        if (v27 < 2) {
          break;
        }
        int v28 = __clz(__rbit64(v27 >> 1));
        unsigned int v29 = v28 + 1;
        if (v28 == 63) {
          v10("*** error at %p msize for in_use is %d\n", (const void *)v14, v29);
        }
        ++v47[v29];
        ++v17;
        uint64_t v30 = 16LL * v29;
      }

      else
      {
        if (v14 + 16 >= v21 + 1032064
          || ((*(_DWORD *)(((v14 + 16) & 0xFFFFFFFFFFF00000LL)
                         + v19
                         + (((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                         + 40) >> (((((_DWORD)v14 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v31 = 1;
        }

        else
        {
          unsigned int v31 = *(unsigned __int16 *)(v14 + v19 + 16);
          if (!*(_WORD *)(v14 + v19 + 16)) {
            break;
          }
        }

        uint64_t v32 = -*MEMORY[0x189600148];
        unint64_t v33 = (v14 + *MEMORY[0x189600148] + 17) & v32;
        uint64_t v30 = 16LL * v31;
        unint64_t v34 = (v14 + v30 - 2) & v32;
        BOOL v35 = v34 >= v33;
        unint64_t v36 = v34 - v33;
        if (!v35) {
          unint64_t v36 = 0LL;
        }
        v18 += v36;
      }

      v14 += v30;
    }

    v10("*** error with %p: msize=%d\n", (const void *)v14, 0);
  }

void tiny_free_list_check(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 608) & 0x80000000) == 0)
  {
    uint64_t v3 = a2;
    uint64_t v4 = -1LL;
    uint64_t v5 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
    while (1)
    {
      uint64_t v6 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560 * v4);
      os_unfair_lock_lock_with_options();
      unint64_t v7 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
      if (v7) {
        break;
      }
LABEL_22:
      os_unfair_lock_unlock(v6);
    }

    unint64_t v8 = 0LL;
    int v9 = 0;
LABEL_5:
    unint64_t v10 = v7 & 0xFFFFFFFFFFF00000LL;
    unint64_t v11 = (v7 & 0xFFFFF) - 16512;
    unint64_t v12 = (v11 >> 8) & 0xFFE;
    int v13 = 1 << (v11 >> 4);
    if ((*(_DWORD *)((v7 & 0xFFFFFFFFFFF00000LL | (8 * ((v12 >> 1) & 0x7FF))) + 0x28) & v13) != 0
      && (*(_DWORD *)((v7 & 0xFFFFFFFFFFF00000LL) + 4 * v12 + 0x2C) & v13) == 0)
    {
      if ((v7 & 0xF) != 0)
      {
        uint64_t v5 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
      }

      else
      {
        unint64_t v14 = *(uint64_t **)(a1 + 24);
        uint64_t v15 = *v14;
        if (*v14)
        {
          uint64_t v16 = v14[2];
          unint64_t v17 = (0x9E3779B97F4A7C55LL * (v7 >> 20)) >> -*((_BYTE *)v14 + 8);
          unint64_t v18 = v17;
          do
          {
            uint64_t v19 = *(void *)(v16 + 8 * v18);
            if (!v19) {
              break;
            }
            if (v19 == v10)
            {
              if (!v10) {
                break;
              }
              uint64_t v20 = __ROR8__(*(void *)v7, 60);
              unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFF0LL;
              uint64_t v22 = *(void *)(a1 + 632);
              unint64_t v23 = v20 & 0xFFFFFFFFFFFFFFF0LL ^ v22;
              if (((v20 ^ (HIDWORD(v23) {
                                        + (_DWORD)v23
              }
                                        + ((HIDWORD(v23) + v23) >> 16)
              if (v8 != v21)
              {
                uint64_t v5 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
                goto LABEL_25;
              }

              uint64_t v24 = __ROR8__(*(void *)(v7 + 8), 60);
              unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFF0LL;
              unint64_t v26 = v24 & 0xFFFFFFFFFFFFFFF0LL ^ v22;
              if (((v24 ^ (HIDWORD(v26)
                                        + (_DWORD)v26
                                        + ((HIDWORD(v26) + v26) >> 16)
                                        + ((HIDWORD(v26) + (_DWORD)v26 + ((HIDWORD(v26) + v26) >> 16)) >> 8))) & 0xFLL) != 0)
              {
LABEL_29:
                free_list_checksum_botch(a1);
                __break(1u);
                return;
              }

              ++v9;
              unint64_t v8 = v7;
              unint64_t v7 = v25;
              if (v25) {
                goto LABEL_5;
              }
              goto LABEL_22;
            }

            if (v18 + 1 == v15) {
              unint64_t v18 = 0LL;
            }
            else {
              ++v18;
            }
          }

          while (v18 != v17);
        }

        uint64_t v5 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d  count=%u ptr=%p\n";
      }
    }

void tiny_check(uint64_t a1)
{
  uint64_t v2 = *(unint64_t **)(a1 + 24);
  unint64_t v3 = *v2;
  if (*v2)
  {
    for (unint64_t i = 0LL; i < v3; ++i)
    {
      uint64_t v5 = *(void *)(v2[2] + 8 * i);
      if ((unint64_t)(v5 + 1) >= 2)
      {
        uint64_t v6 = *(void *)(a1 + 624);
        int v7 = *(_DWORD *)(v5 + 24);
        unint64_t v8 = (os_unfair_lock_s *)(v6 + 2560LL * v7);
        os_unfair_lock_lock_with_options();
        int v9 = *(_DWORD *)(v5 + 24);
        if (v9 != v7)
        {
          do
          {
            os_unfair_lock_unlock(v8);
            unint64_t v8 = (os_unfair_lock_s *)(v6 + 2560LL * v9);
            os_unfair_lock_lock_with_options();
            BOOL v10 = v9 == *(_DWORD *)(v5 + 24);
            int v9 = *(_DWORD *)(v5 + 24);
          }

          while (!v10);
        }

        tiny_check_region(a1, v5);
        int v12 = v11;
        os_unfair_lock_unlock(v8);
        if (!v12) {
          return;
        }
        uint64_t v2 = *(unint64_t **)(a1 + 24);
        unint64_t v3 = *v2;
      }
    }
  }

  for (uint64_t j = 0LL; j != 63; ++j)
  {
    tiny_free_list_check(a1, j);
    if (!v14) {
      break;
    }
  }

unint64_t tiny_free_try_depot_unmap_no_lock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16)) {
    return 0LL;
  }
  unsigned int v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions) {
    return 0LL;
  }
  uint64_t v7 = *(void *)a3;
  unint64_t v8 = *(void **)(a3 + 8);
  if (*(void *)a3)
  {
    *(void *)(v7 + 8) = v8;
    unint64_t v8 = *(void **)(a3 + 8);
  }

  else
  {
    *(void *)(a2 + 2176) = v8;
  }

  if (!v8) {
    unint64_t v8 = (void *)(a2 + 2184);
  }
  *unint64_t v8 = v7;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  unint64_t v9 = a3 & 0xFFFFFFFFFFF00000LL;
  if (tiny_free_detach_region(a1, a2, a3 & 0xFFFFFFFFFFF00000LL))
  {
    malloc_zone_error( *(_DWORD *)(a1 + 620),  1,  (uint64_t)"tiny_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0LL;
  }

  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFFF00000LL, a3)) {
    return 0LL;
  }
  *(void *)(a2 + 2160) -= 1032064LL;
  return v9;
}

void _tiny_check_and_zero_inline_meta_from_freelist(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = __ROR8__(*(void *)a2, 60);
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFF0LL ^ *(void *)(a1 + 632);
  if (((v4 ^ (HIDWORD(v5)
                           + (_DWORD)v5
                           + ((HIDWORD(v5) + v5) >> 16)
                           + ((HIDWORD(v5) + (_DWORD)v5 + ((HIDWORD(v5) + v5) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    free_list_checksum_botch(a1);
    __break(1u);
    return;
  }

  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  if (a3 >= 2)
  {
    int v6 = *(unsigned __int16 *)(a2 + 16);
    uint64_t v7 = a2 + 16 * a3;
    if (v6 == *(unsigned __int16 *)(v7 - 2))
    {
      if (v6 == a3)
      {
LABEL_11:
        *(_WORD *)(a2 + 16) = 0;
        *(_WORD *)(v7 - 2) = 0;
        return;
      }

      unint64_t v8 = "Corruption at %p: unexpected msizes %u/%u\n";
    }

    else
    {
      unint64_t v8 = "Corruption of free object %p: msizes %u/%u disagree\n";
    }

    malloc_zone_error(256, 1, (uint64_t)v8);
    goto LABEL_11;
  }

  if (!a3)
  {
    if (*(_WORD *)(a2 + 16)) {
      malloc_zone_error(256, 1, (uint64_t)"Corruption at %p: unexpected nonzero msize %u\n");
    }
  }

uint64_t _malloc_default_debug_sleep_time()
{
  if (malloc_error_sleep) {
    return 3600LL;
  }
  else {
    return 0LL;
  }
}

char *malloc_print_configure()
{
  uint64_t v0 = getenv("MallocDebugReport");
  if (v0)
  {
    uint64_t v1 = v0;
    if (_platform_strcmp())
    {
      if (_platform_strcmp())
      {
        if (_platform_strcmp())
        {
          debug_mode = 2;
          malloc_printf("Unrecognized value for MallocDebugReport (%s) - using 'stderr'\n", v1);
        }

        else
        {
          debug_mode = 0;
        }

        goto LABEL_12;
      }

      uint64_t v2 = &gCRAnnotations;
      int v3 = 1;
    }

    else
    {
      uint64_t v2 = (_DWORD *)&gCRAnnotations;
      int v3 = 2;
    }

    v2[20] = v3;
    goto LABEL_12;
  }

  if (isatty(2)) {
    debug_mode = 2;
  }
LABEL_12:
  if (getenv("MallocErrorStop")) {
    malloc_error_stop = 1;
  }
  uint64_t result = getenv("MallocErrorSleep");
  if (result) {
    malloc_error_sleep = 1;
  }
  return result;
}

void malloc_printf(const char *format, ...)
{
}

void malloc_vreport(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  array[50] = *(void **)MEMORY[0x1895FEE08];
  if (_simple_salloc())
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }

    if (a3) {
      _simple_sprintf();
    }
    _simple_vsprintf();
    if ((a1 & 0x100) != 0)
    {
      int v9 = backtrace(array, 50);
      if (v9)
      {
        uint64_t v10 = v9;
        backtrace_image_offsets(array, &image_offsets, v9);
        if ((int)v10 >= 1)
        {
          uint64_t v11 = 0LL;
          p_image_offset image_offsets = &image_offsets;
          do
          {
            if (!v11 || uuid_compare(uu1, p_image_offsets->uuid))
            {
              uuid_copy(uu1, p_image_offsets->uuid);
              uuid_unparse(p_image_offsets->uuid, out);
            }

            _simple_sappend();
            _simple_sprintf();
            ++v11;
            ++p_image_offsets;
          }

          while (v10 != v11);
        }
      }
    }

    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if (!(_malloc_no_asl_log | a1 & 0x10))
    {
      _simple_string();
      _simple_asl_log();
    }

    if ((a1 & 0x40) != 0)
    {
      uint64_t v13 = _simple_string();
    }

    else
    {
      _simple_sfree();
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
    {
      if ((a1 & 0x20) == 0)
      {
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        getprogname();
        getpid();
        _simple_dprintf();
      }

      if (a3) {
        _simple_dprintf();
      }
      _simple_vdprintf();
    }

    if ((a1 & 0x40) != 0) {
      uint64_t v13 = a5;
    }
    else {
      uint64_t v13 = 0LL;
    }
  }

  if ((a1 & 0xC0) != 0)
  {
    _malloc_put(a1, "*** set a breakpoint in malloc_error_break to debug\n");
    malloc_error_break();
    if (malloc_error_stop == 1)
    {
      _malloc_put(5u, "*** sending SIGSTOP to help debug\n");
      pid_t v14 = getpid();
      kill(v14, 17);
    }

    else if (a2)
    {
      _malloc_put(5u, "*** sleeping to help debug\n");
      sleep(a2);
    }
  }

  if ((a1 & 0x40) != 0)
  {
    qword_18C528008 = v13;
    abort();
  }

ssize_t _malloc_put(unsigned int a1, const char *a2)
{
  ssize_t result = _simple_salloc();
  if (result)
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }

    _simple_sprintf();
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if ((_malloc_no_asl_log & ~(a1 >> 4) & 1) != 0)
    {
      _simple_string();
      _simple_asl_log();
    }

    return _simple_sfree();
  }

  else if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_dprintf();
    }

    size_t v5 = strlen(a2);
    return write(2, a2, v5);
  }

  return result;
}

void malloc_report(unsigned int a1, uint64_t a2)
{
  if (malloc_error_sleep) {
    unsigned int v3 = 3600;
  }
  else {
    unsigned int v3 = 0;
  }
  malloc_vreport(a1, v3, 0LL, 0LL, a2);
}

void malloc_report_simple(uint64_t a1)
{
  if (malloc_error_sleep) {
    unsigned int v1 = 3600;
  }
  else {
    unsigned int v1 = 0;
  }
  malloc_vreport(0x30u, v1, 0LL, 0LL, a1);
}

void malloc_zone_error(__int16 a1, char a2, uint64_t a3)
{
  char v3 = a2 ^ 1;
  if ((a1 & 0x100) == 0) {
    char v3 = 1;
  }
  else {
    unsigned int v4 = 67;
  }
  if (malloc_error_sleep) {
    unsigned int v5 = 3600;
  }
  else {
    unsigned int v5 = 0;
  }
  malloc_vreport(v4, v5, 0LL, 0LL, a3);
}

void bitarray_set_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_18C528038 = a1;
  __break(1u);
}

void bitarray_first_set_cold_1(unsigned int a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_1()
{
  uint64_t v0 = *__error();
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: sysctlbyname(vm.malloc_ranges) failed";
  qword_18C528038 = v0;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion left_void.min_address failed (/Library/Caches/com.ap"
                             "ple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:611)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_3()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion left_void.max_address >= left_void.min_address faile"
                             "d (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:612)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_4()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion right_void.min_address >= left_void.max_address fail"
                             "ed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:613)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_5()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion right_void.max_address >= right_void.min_address fai"
                             "led (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:614)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_6()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion candidate_span failed (/Library/Caches/com.apple.xbs"
                             "/Sources/libmalloc/src/xzone/xzone_segment.c:675)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_7()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion (start_address >= left_void.min_address && end_address"
                             " + XZM_RANGE_SEPARATION <= left_void.max_address) || (start_address >= right_void.min_addre"
                             "ss + XZM_RANGE_SEPARATION && start_address + XZM_POINTER_RANGE_SIZE <= right_void.max_addre"
                             "ss) failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:700)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_8(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: unexpected error from mach_vm_range_create()";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_9(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: pointer range initial overwrite failed";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_10()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion right_candidate_span % XZM_PAGE_TABLE_GRANULE == 0 f"
                             "ailed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:669)";
  __break(1u);
}

void xzm_segment_group_alloc_chunk_cold_1(unsigned __int8 a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_segment_group_alloc_chunk_cold_2(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: mach_vm_map() overwrite failed";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_segment_group_free_chunk_cold_3(unsigned __int8 a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_segment_group_free_chunk_cold_4(unsigned __int8 a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: unknown segment group id";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_segment_group_free_chunk_cold_5()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: attempting to coalesce slice of unexpected type";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Slice count too large in init_segment";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion (uintptr_t)body < XZM_LIMIT_ADDRESS failed (/Library"
                             "/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1766)";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_3()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion (uintptr_t)segment < XZM_LIMIT_ADDRESS failed (/Libr"
                             "ary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1765)";
  __break(1u);
}

void _xzm_segment_table_allocated_at_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion ((uintptr_t)segment >> XZM_METAPOOL_SEGMENT_BLOCK_SHIF"
                             "T) < UINT32_MAX failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/../xzon"
                             "e/xzone_inline_internal.h:190)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion (uintptr_t)segment_body < XZM_LIMIT_ADDRESS failed ("
                             "/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1870)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_2(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: pointer range mach_vm_map() overwrite failed";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_create_guard_cold_1()
{
  uint64_t v0 = *__error();
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Failed to mprotect guard page";
  qword_18C528038 = v0;
  __break(1u);
}

uint64_t szone_pressure_relief_cold_1()
{
  return kdebug_trace();
}

void small_free_list_remove_ptr_no_clear_cold_2( uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t ptr = small_free_list_get_ptr(a3);
  OUTLINED_FUNCTION_0_0( ptr,  v4,  (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (prev ptr of next) for %p, next_prev=%p\n");
  __break(1u);
}

void small_free_list_remove_ptr_no_clear_cold_3( uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t ptr = small_free_list_get_ptr(a3);
  OUTLINED_FUNCTION_0_0( ptr,  v4,  (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (next ptr of prev) for %p, prev_next=%p\n");
  __break(1u);
}

void free_small_cold_1()
{
  qword_18C528008 = (uint64_t)"small free list metadata inconsistency (headers[previous] != previous size)";
  __break(1u);
}

void xzm_metapool_alloc_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate malloc metadata";
  __break(1u);
}

void rack_init_cold_1()
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - unable to allocate magazine array";
  __break(1u);
}

void mfm_initialize_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: failed to allocate memory";
  qword_18C528038 = 0LL;
  __break(1u);
}

void mfm_initialize_cold_2(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: failed to overwrite mfm arena";
  qword_18C528038 = a1;
  __break(1u);
}

void mfm_free_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: not an allocated block";
  qword_18C528038 = a1;
  __break(1u);
}

void mfm_free_cold_2(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: double free detected";
  qword_18C528038 = a1;
  __break(1u);
}

void mfm_free_cold_3(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: invalid address";
  qword_18C528038 = a1;
  __break(1u);
}

void mfm_free_cold_4(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: not MFM owned";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_print_self_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion main_address failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc/src/xzone/xzone_introspect.c:559)";
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion zone failed (/Library/Caches/com.apple.xbs/Sources/l"
                             "ibmalloc/src/xzone/xzone_introspect.c:557)";
  __break(1u);
}

void pgm_create_zone_cold_2(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - ProbGuard: memory budget too small";
  __break(1u);
}

void pgm_create_zone_cold_3(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - ProbGuard: bad configuration";
  __break(1u);
}

void debug_zone_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - ProbGuard: zone integrity check failed";
  qword_18C528038 = a1;
  __break(1u);
}

void deallocate_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to free";
  qword_18C528038 = a1;
  __break(1u);
}

void reallocate_cold_2(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to realloc";
  qword_18C528038 = a1;
  __break(1u);
}

BOOL nanov2_create_zone_cold_1()
{
  BOOL vm_space = nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL);
  OUTLINED_FUNCTION_0_2();
  return vm_space;
}

void xzm_realloc_cold_2(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being reallocated with wrong zone";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_foreach_lock_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion success failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:2724)";
  __break(1u);
}

void xzm_ptr_lookup_4test_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion xz failed (/Library/Caches/com.apple.xbs/Sources/lib"
                             "malloc/src/xzone/xzone_malloc.c:4172)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate xzm zone";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_4(int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: mach_timebase_info failed";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_5()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion xzone_count <= UINT8_MAX failed (/Library/Caches/com"
                             ".apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4732)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_6(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash length";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_7()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash string";
  __break(1u);
}

void _xzm_xzone_malloc_from_tiny_chunk_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion success failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:805)";
  __break(1u);
}

void _xzm_xzone_fresh_chunk_init_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  __break(1u);
}

void _xzm_xzone_free_to_chunk_cold_1(unsigned __int8 a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Attempting to free to non-chunk slice";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_xzone_chunk_free_cold_2(unsigned __int8 a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_1(unsigned int a1)
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
  qword_18C528038 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion prev_slot_value == slot_meta.xasa_value failed (/Lib"
                             "rary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:1114)";
  __break(1u);
}

void xzm_malloc_zone_destroy_cold_2()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion !chunk->xzc_bits.xzcb_preallocated failed (/Library/"
                             "Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4039)";
  __break(1u);
}

void xzm_malloc_zone_free_slow_cold_1(uint64_t a1)
{
  qword_18C528008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
  qword_18C528038 = a1;
  __break(1u);
}

void xzm_malloc_zone_malloc_type_realloc_slow_cold_1()
{
  qword_18C528008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion old_size failed (/Library/Caches/com.apple.xbs/Sourc"
                             "es/libmalloc/src/xzone/xzone_malloc.c:3472)";
  __break(1u);
}

void internal_check()
{
  unsigned int v0 = malloc_check_counter++;
  if (v0 >= malloc_check_start)
  {
    if (!malloc_num_zones) {
      goto LABEL_8;
    }
    unint64_t v1 = 0LL;
    int v2 = 1;
    do
    {
      unint64_t v3 = v1 + 1;
      unint64_t v1 = v3;
    }

    while (v3 < malloc_num_zones);
    if (v2)
    {
LABEL_8:
      if (!qword_18C52A160) {
        vm_allocate(*MEMORY[0x1895FFD48], (vm_address_t *)&qword_18C52A160, *MEMORY[0x189600148], 1);
      }
      thread_stack_pcs();
    }

    malloc_check_start += malloc_check_each;
  }

void __malloc_init_cold_1()
{
  qword_18C528008 = (uint64_t)"FATAL ERROR - logical_ncpus / phys_ncpus not 1, 2, or 4";
  qword_18C528038 = logical_ncpus / phys_ncpus;
  __break(1u);
}

void __malloc_init_cold_2()
{
  malloc_report(3u, (uint64_t)"*** FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n.\n");
  qword_18C528008 = (uint64_t)"FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n";
  qword_18C528038 = logical_ncpus % phys_ncpus;
  __break(1u);
}

void tiny_zero_corruption_abort(uint64_t a1)
{
  uint64_t v1 = 0LL;
  malloc_zone_error( 256,  1,  (uint64_t)"Corruption detected in block %p of size %u at offset %u, first 32 bytes at that offset are %02X %02X %02X % 02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X\n");
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  return MEMORY[0x1896003B0](__oldValue, __newValue, __theValue);
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  return MEMORY[0x1896003B8](__theValue);
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  return MEMORY[0x1896003D0](__theValue);
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return MEMORY[0x1896003D8](__theValue);
}

void OSMemoryBarrier(void)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895FEDA0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1895FF888]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1895FF898]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895FEBE8](*(void *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1895FEBF8]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1895FEC38]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1895FF600]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x189600438]();
}

uint64_t _platform_memcmp_zero_aligned8()
{
  return MEMORY[0x189600458]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x189600460]();
}

uint64_t _platform_memset()
{
  return MEMORY[0x189600468]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x189600470]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x189600478]();
}

uint64_t _platform_strcpy()
{
  return MEMORY[0x189600480]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x189600490]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x189600498]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x1896004A0]();
}

uint64_t _platform_strstr()
{
  return MEMORY[0x1896004B8]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1896004D8]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1896004E0]();
}

uint64_t _simple_put()
{
  return MEMORY[0x1896004E8]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1896004F0]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1896004F8]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x189600500]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x189600508]();
}

uint64_t _simple_string()
{
  return MEMORY[0x189600518]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x189600520]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x189600528]();
}

void abort(void)
{
}

void *__cdecl j__aligned_alloc(size_t __alignment, size_t __size)
{
  return aligned_alloc(__alignment, __size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895FEF38]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895FEF48](*(void *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895FEF70](a1, *(void *)&a2);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl j__calloc(size_t __count, size_t __size)
{
  return calloc(__count, __size);
}

uint64_t csops()
{
  return MEMORY[0x1895FF980]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1895FECB0]();
}

void j__free(void *a1)
{
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x1895FFAA0](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FF100]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FF140](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FFB80]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FFB88]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FFBA8](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1895FFD40](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FFD60](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FFD70](*(void *)&target, address, size);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFD78]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

kern_return_t mach_vm_page_range_query( vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1895FFD80](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_protect( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1895FFD88]( *(void *)&target_task,  address,  size,  *(void *)&set_maximum,  *(void *)&new_protection);
}

kern_return_t mach_vm_range_create( vm_map_t target_task, mach_vm_range_flavor_t flavor, mach_vm_range_recipes_raw_t recipes, mach_msg_type_number_t recipesCnt)
{
  return MEMORY[0x1895FFD90](*(void *)&target_task, *(void *)&flavor, recipes, *(void *)&recipesCnt);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FFDD8](a1, a2, *(void *)&a3);
}

void *__cdecl j__malloc(size_t __size)
{
  return malloc(__size);
}

malloc_zone_t *j__malloc_default_zone(void)
{
  return malloc_default_zone();
}

void *__cdecl j__malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return malloc_zone_calloc(zone, num_items, size);
}

void *__cdecl j__malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return malloc_zone_malloc(zone, size);
}

void *__cdecl j__malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  return malloc_zone_memalign(zone, alignment, size);
}

void *__cdecl j__malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return malloc_zone_realloc(zone, ptr, size);
}

void *__cdecl j__malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return malloc_zone_valloc(zone, size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FFE38](a1, a2, *(void *)&a3);
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x189600570](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int j__posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  return posix_memalign(__memptr, __alignment, __size);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FF1D8](a1);
}

void *__cdecl j__realloc(void *__ptr, size_t __size)
{
  return realloc(__ptr, __size);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FF290](*(void *)&a1);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1895FF2D8](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3B0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3B8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1895FF3C0](a1, a2, *(void *)&a3, a4);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1895FF408]();
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1896000D8](*(void *)&thread_name, *(void *)&option, *(void *)&option_time);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1895FF420](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FF440](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl j__valloc(size_t a1)
{
  return valloc(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_purgable_control( vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x189600150](*(void *)&target_task, address, *(void *)&control, state);
}