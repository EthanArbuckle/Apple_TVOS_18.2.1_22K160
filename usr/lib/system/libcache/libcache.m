int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  int result;
  int8x16_t *v7;
  int8x16_t *v8;
  char *v9;
  uint64_t v10;
  int8x16_t v11;
  uint64_t i;
  uint64_t v13;
  result = 22;
  if (!name || !attrs || !cache_out) {
    return result;
  }
  v7 = (int8x16_t *)calloc(1uLL, 0x110uLL);
  if (!v7) {
    return 12;
  }
  v8 = v7;
  v9 = strdup(name);
  v8[12].i64[1] = (uint64_t)v9;
  if (!v9)
  {
    free(v8);
    return 12;
  }

  v10 = MEMORY[0x1895FF8E0];
  if (*(void *)(MEMORY[0x1895FF8E0] + 80LL) != -1LL) {
    _os_alloc_once();
  }
  v11.i64[0] = (uint64_t)cache_key_hash_cb_integer;
  v11.i64[1] = (uint64_t)cache_key_is_equal_cb_integer;
  v8[1] = vbslq_s8((int8x16_t)vceqzq_s64(*(int64x2_t *)&attrs->key_hash_cb), v11, *(int8x16_t *)&attrs->key_hash_cb);
  v8[2] = *(int8x16_t *)&attrs->key_retain_cb;
  v8[3].i64[1] = (uint64_t)attrs->value_release_cb;
  v8[4] = vextq_s8( *(int8x16_t *)&attrs->value_make_nonpurgeable_cb,  *(int8x16_t *)&attrs->value_make_nonpurgeable_cb,  8uLL);
  v8[13].i64[0] = (uint64_t)attrs->user_data;
  if (attrs->version >= 2) {
    v8[3].i64[0] = (uint64_t)attrs->value_retain_cb;
  }
  for (i = 144LL; i != 192; i += 12LL)
    *(int8x8_t *)&v8->i8[i] = vorr_s8(*(int8x8_t *)&v8->i8[i], (int8x8_t)0xFFFFFF00FFFFFFLL);
  v8[13].i64[1] = 0x1400000000LL;
  _entry_table_resize(v8);
  _value_entry_table_resize(v8);
  v8[5].i32[0] = 0;
  v8->i32[0] = 1;
  if (*(void *)(v10 + 80) == -1LL) {
    v13 = *(void *)(v10 + 88);
  }
  else {
    v13 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  v8->i64[1] = *(void *)v13;
  *(void *)v13 = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 8));
  *cache_out = (cache_t *)v8;
  return 0;
}

_DWORD *_entry_table_resize(_DWORD *result)
{
  uint64_t v1 = (uint64_t)result;
  int v2 = result[26];
  size_t v3 = *(void *)&v2 & 0xFFFFFFLL;
  if ((v2 & 0xFFFFFF) != 0)
  {
    unsigned int v4 = result[29] & 0xFFFFFF;
    unsigned int v5 = v3;
    if ((result[27] & 0xFFFFFFu) > v4)
    {
      if (v3 < 0x7FFFFF)
      {
        unsigned int v5 = (2 * v3) | 1;
      }

      else
      {
        unsigned int v5 = 0xFFFFFF;
        if ((_DWORD)v3 == 0xFFFFFF && v4 < 0x28F5C) {
          return result;
        }
      }
    }
  }

  else
  {
    unsigned int v5 = 3;
  }

  v7 = calloc(v5, 0x13uLL);
  if (!v7) {
    return (_DWORD *)v1;
  }
  v8 = *(char **)(v1 + 88);
  *(void *)(v1 + 88) = v7;
  *(_DWORD *)(v1 + 104) = v5 | (*(unsigned __int8 *)(v1 + 107) << 24);
  int v9 = *(unsigned __int8 *)(v1 + 119) << 24;
  *(_DWORD *)(v1 + 112) = (75 * v5 / 0x64) | (*(unsigned __int8 *)(v1 + 115) << 24);
  *(_DWORD *)(v1 + 116) = v9;
  if ((_DWORD)v3)
  {
    v10 = calloc(v3, 8uLL);
    uint64_t v11 = 0LL;
    v12 = v8;
    do
    {
      if (*(void *)v12 && ((*((unsigned __int16 *)v12 + 8) | (v12[18] << 16)) & 0x10000) == 0)
      {
        uint64_t optionally_checking_collisions = _entry_get_optionally_checking_collisions(v1, *(void *)v12, 0);
        if (optionally_checking_collisions)
        {
          __int128 v14 = *(_OWORD *)v12;
          *(_DWORD *)(optionally_checking_collisions + 15) = *(_DWORD *)(v12 + 15);
          *(_OWORD *)uint64_t optionally_checking_collisions = v14;
        }

        v10[v11] = optionally_checking_collisions;
      }

      v12 += 19;
      ++v11;
    }

    while (v3 != v11);
  }

  else
  {
    v10 = 0LL;
  }

  for (uint64_t i = 0LL; i != 4; ++i)
  {
    uint64_t v16 = v1 + 12 * i;
    *(_DWORD *)(v16 + 144) |= 0xFFFFFFu;
    int8x8_t v17 = *(int8x8_t *)(v16 + 148);
    LODWORD(v18) = vorr_s8(v17, (int8x8_t)0xFFFFFF00FFFFFFLL).u32[0];
    LOWORD(v19) = 0;
    BYTE2(v19) = 0;
    HIBYTE(v19) = v17.i8[7];
    HIDWORD(v18) = v19;
    *(void *)(v16 + 148) = v18;
    for (__int32 j = v17.i32[0]; ; __int32 j = *(_DWORD *)&v8[19 * v21 + 11])
    {
      unsigned int v21 = j & 0xFFFFFF;
      if ((j & 0xFFFFFF) == 0xFFFFFF) {
        break;
      }
      _entry_add_to_list(v1, v10[v21], i);
    }
  }

  free(v10);
  free(v8);
  return (_DWORD *)v1;
}

_DWORD *_value_entry_table_resize(_DWORD *result)
{
  uint64_t v1 = result;
  int v2 = result[30];
  unsigned int v3 = v2 & 0xFFFFFF;
  if ((v2 & 0xFFFFFF) != 0)
  {
    unsigned int v4 = result[33] & 0xFFFFFF;
    unsigned int v5 = v2 & 0xFFFFFF;
    if ((result[31] & 0xFFFFFFu) > v4)
    {
      if (v3 < 0x7FFFFF)
      {
        unsigned int v5 = (2 * v3) | 1;
      }

      else
      {
        unsigned int v5 = 0xFFFFFF;
        if (v3 == 0xFFFFFF && v4 < 0x28F5C) {
          return result;
        }
      }
    }
  }

  else
  {
    unsigned int v5 = 3;
  }

  v7 = calloc(v5, 0x16uLL);
  if (!v7) {
    return v1;
  }
  uint64_t v8 = (uint64_t)v7;
  if (v3)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 22LL * (v2 & 0xFFFFFF);
    do
    {
      uint64_t v11 = *((void *)v1 + 12) + v9;
      unint64_t v12 = *(unsigned int *)(v11 + 16) | ((unint64_t)*(unsigned __int16 *)(v11 + 20) << 32);
      if ((v12 & 0x1FFFFFFFFFFLL) != 0)
      {
        if ((v12 & 0x10000000000LL) != 0)
        {
          v1[33] = v1[33] & 0xFF000000 | (v1[33] - 1) & 0xFFFFFF;
        }

        else
        {
          uint64_t v13 = _value_entry_table_get(v8, v5, *(void *)v11);
          uint64_t v14 = *(void *)(v11 + 14);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)v11;
          *(void *)(v13 + 14) = v14;
        }
      }

      v9 += 22LL;
    }

    while (v10 != v9);
  }

  v15 = (char *)*((void *)v1 + 12);
  *((void *)v1 + 12) = v8;
  v1[30] = v5 | (*((unsigned __int8 *)v1 + 123) << 24);
  v1[32] = (75 * v5 / 0x64) & 0xFFFFFF | (*((unsigned __int8 *)v1 + 131) << 24);
  int v16 = v1[26];
  if ((v16 & 0xFFFFFF) != 0)
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = 0LL;
    do
    {
      uint64_t v19 = *((void *)v1 + 11);
      if (*(void *)(v19 + v17))
      {
        uint64_t v20 = v19 + v17;
        int v21 = *(_DWORD *)(v19 + v17 + 14) & 0xFFFFFF;
        if (v21)
        {
          unsigned int v22 = 1
              - 1171354717
              * ((_value_entry_table_get(v8, v5, *(void *)&v15[22 * (v21 - 1)]) - v1[24]) >> 1);
          __int16 v23 = *(_WORD *)(v20 + 17);
          *(_BYTE *)(v20 + 18) = HIBYTE(v23);
          *(_WORD *)(v20 + 14) = v22;
          *(_WORD *)(v20 + 16) = (v23 << 8) | BYTE2(v22);
          int v16 = v1[26];
        }
      }

      ++v18;
      v17 += 19LL;
    }

    while (v18 < (v16 & 0xFFFFFFu));
  }

  free(v15);
  return v1;
}

os_unfair_lock_s *cache_get(os_unfair_lock_s *result, uint64_t a2, uint64_t a3)
{
  if (result && a2 && a3)
  {
    uint64_t v5 = (uint64_t)result;
    v6 = result + 20;
    os_unfair_lock_lock_with_options();
    ++*(_DWORD *)(v5 + 248);
    uint64_t optionally_checking_collisions = _entry_get_optionally_checking_collisions(v5, a2, 1);
    if (optionally_checking_collisions)
    {
      uint64_t v8 = optionally_checking_collisions;
      if (*(void *)optionally_checking_collisions)
      {
        unsigned int v9 = *(unsigned __int16 *)(optionally_checking_collisions + 16) | (*(unsigned __int8 *)(optionally_checking_collisions
                                                                                              + 18) << 16);
        if ((v9 & 0x10000) == 0)
        {
          unint64_t v10 = *(void *)(optionally_checking_collisions + 8);
          if ((~*(_WORD *)(optionally_checking_collisions + 16) & 0xFF00) != 0)
          {
            char v11 = *(_BYTE *)(optionally_checking_collisions + 18);
            unsigned int v9 = v9 & 0xFFFF00FF | ((BYTE1(v9) + 1) << 8);
            *(void *)(optionally_checking_collisions + 8) = v10;
            *(_BYTE *)(optionally_checking_collisions + 18) = v11;
            *(_WORD *)(optionally_checking_collisions + 16) = v9;
          }

          int v12 = (HIWORD(v10) | (v9 << 16)) & 0xFFFFFF;
          if (v12)
          {
            uint64_t v13 = *(void *)(v5 + 96) + 22LL * (v12 - 1);
            if (((*(unsigned int *)(v13 + 16) | ((unint64_t)*(unsigned __int16 *)(v13 + 20) << 32)) & 0x10000000000LL) == 0)
            {
              if ((v9 & 0x80000) != 0
                || (_entry_remove_from_list(v5, optionally_checking_collisions),
                    (int v12 = *(_DWORD *)(v8 + 14) & 0xFFFFFF) != 0))
              {
                uint64_t v14 = *(void *)(v5 + 96) + 22LL * (v12 - 1);
              }

              else
              {
                uint64_t v14 = 0LL;
              }

              if (*(_WORD *)(v14 + 16)
                || (int v16 = *(uint64_t (**)(void, void))(v5 + 72)) == 0LL
                || (v16(*(void *)v14, *(void *)(v5 + 208)) & 1) != 0)
              {
                ++*(_DWORD *)(v5 + 252);
                _entry_add_to_list(v5, v8, (*(_WORD *)(v8 + 16) & 0xFE00) != 0LL);
                uint64_t v15 = *(void *)v14;
                char v17 = 0;
                (*(void (**)(uint64_t, uint64_t, char *))(a3 + 16))(a3, v15, &v17);
                if (v17) {
                  _entry_remove(v5, v8);
                }
              }

              else
              {
                _entry_evict(v5, v8);
              }
            }
          }
        }
      }
    }

    os_unfair_lock_unlock(v6);
    return (os_unfair_lock_s *)v5;
  }

  return result;
}

uint64_t _entry_remove_from_list(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  unint64_t v3 = ((unint64_t)*(unsigned __int8 *)(a2 + 18) >> 1) & 7;
  if ((v2 & 0xFFFFFF) == 0xFFFFFF || (uint64_t v4 = *(void *)(result + 88)) == 0) {
    *(_DWORD *)(result + 12LL * v3 + 148) = (v2 >> 24) & 0xFFFFFF | (*(unsigned __int8 *)(result + 12LL * v3 + 151) << 24);
  }
  else {
    *(void *)(v4 + 19 * (v2 & 0xFFFFFF) + 8) = *(void *)(v4 + 19 * (v2 & 0xFFFFFF) + 8) & 0xFFFF000000FFFFFFLL | (((v2 >> 24) & 0xFFFFFF) << 24);
  }
  unint64_t v5 = *(void *)(a2 + 8);
  if (((v5 >> 24) & 0xFFFFFF) == 0xFFFFFF || (uint64_t v6 = *(void *)(result + 88)) == 0)
  {
    *(_DWORD *)(result + 12LL * v3 + 144) = v5 & 0xFFFFFF | (*(unsigned __int8 *)(result
                                                                                              + 12LL * v3
                                                                                              + 147) << 24);
  }

  else
  {
    uint64_t v7 = v6 + 19 * ((v5 >> 24) & 0xFFFFFF);
    uint64_t v8 = *(void *)(v7 + 11);
    *(void *)(v7 + 8) = v5 & 0xFFFFFF | (v8 << 24);
    *(_BYTE *)(v7 + 18) = HIBYTE(v8);
    *(_WORD *)(v7 + 16) = HIDWORD(v8) >> 8;
  }

  int v10 = *(unsigned __int16 *)(a2 + 16);
  uint64_t v9 = a2 + 16;
  unsigned int v11 = (v10 | (*(unsigned __int8 *)(v9 + 2) << 16)) & 0xFFF1FFFF;
  *(void *)(v9 - 8) |= 0xFFFFFFFFFFFFuLL;
  *(_WORD *)uint64_t v9 = v11;
  *(_BYTE *)(v9 + 2) = (v11 | 0x80000) >> 16;
  *(_DWORD *)(result + 12LL * v3 + 152) = *(_DWORD *)(result + 12LL * v3 + 152) & 0xFF000000 | (*(_DWORD *)(result + 12LL * v3 + 152) - 1) & 0xFFFFFF;
  return result;
}

uint64_t _entry_evict(uint64_t a1, uint64_t a2)
{
  int v4 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
  if ((v4 & 0x80000) == 0)
  {
    _entry_remove_from_list(a1, a2);
    int v4 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
  }

  unint64_t v5 = *(void *)(a2 + 8);
  int v6 = (HIWORD(v5) | (v4 << 16)) & 0xFFFFFF;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 96);
    unsigned int v8 = v6 - 1;
    if (((*(unsigned int *)(v7 + 22LL * v8 + 16) | ((unint64_t)*(unsigned __int16 *)(v7 + 22LL * v8 + 20) << 32)) & 0x10000000000LL) == 0)
    {
      *(_WORD *)(a2 + 16) = v4 & 0xFF00;
      *(_BYTE *)(a2 + 18) = BYTE2(v4);
      *(void *)(a2 + 8) = v5 & 0xFFFFFFFFFFFFLL;
      _value_entry_unmap(a1, v7 + 22LL * v8);
      LOWORD(v4) = *(_WORD *)(a2 + 16);
    }
  }

  if ((v4 & 0xFE00) != 0) {
    unsigned int v9 = 3;
  }
  else {
    unsigned int v9 = 2;
  }
  uint64_t result = _entry_add_to_list(a1, a2, v9);
  ++*(_DWORD *)(a1 + 264);
  return result;
}

uint64_t _entry_remove(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  *(_DWORD *)(result + 108) = *(_DWORD *)(result + 108) & 0xFF000000 | (*(_DWORD *)(result + 108) - 1) & 0xFFFFFF;
  int v4 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
  if ((v4 & 0x80000) == 0)
  {
    uint64_t result = _entry_remove_from_list(result, a2);
    int v4 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
  }

  unint64_t v5 = *(void *)(a2 + 8);
  int v6 = (HIWORD(v5) | (v4 << 16)) & 0xFFFFFF;
  if (!v6
    || (uint64_t v7 = *(void *)(v3 + 96),
        unsigned int v8 = v6 - 1,
        ((*(unsigned int *)(v7 + 22LL * v8 + 16) | ((unint64_t)*(unsigned __int16 *)(v7 + 22LL * v8 + 20) << 32)) & 0x10000000000LL) != 0))
  {
    --*(_DWORD *)(v3 + 264);
  }

  else
  {
    *(void *)(a2 + 8) = v5 & 0xFFFFFFFFFFFFLL;
    *(_BYTE *)(a2 + 18) = BYTE2(v4);
    *(_WORD *)(a2 + 16) = v4 & 0xFF00;
    uint64_t result = _value_entry_unmap(v3, v7 + 22LL * v8);
  }

  unsigned int v9 = *(uint64_t (**)(void, void))(v3 + 40);
  if (v9) {
    uint64_t result = v9(*(void *)a2, *(void *)(v3 + 208));
  }
  uint64_t v10 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFLL;
  *(_WORD *)(a2 + 16) = 0;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = v10;
  uint64_t v11 = a2 + 19;
  if (a2 + 19 == *(void *)(v3 + 88) + 19LL * (*(_DWORD *)(v3 + 104) & 0xFFFFFF)) {
    uint64_t v11 = *(void *)(v3 + 88);
  }
  if (*(void *)v11 || ((*(unsigned __int16 *)(v11 + 16) | (*(unsigned __int8 *)(v11 + 18) << 16)) & 0x10000) != 0)
  {
    *(_DWORD *)(v3 + 116) = *(_DWORD *)(v3 + 116) & 0xFF000000 | (*(_DWORD *)(v3 + 116) + 1) & 0xFFFFFF;
    int v13 = *(unsigned __int16 *)(a2 + 16);
    uint64_t v12 = a2 + 16;
    unsigned int v14 = (v13 | (*(unsigned __int8 *)(v12 + 2) << 16) | 0x10000u) >> 16;
    *(_WORD *)uint64_t v12 = v13;
    *(_BYTE *)(v12 + 2) = v14;
  }

  else
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(_DWORD *)(a2 + 15) = 0;
  }

  return result;
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  int v3 = 22;
  if (cache && key && value_out)
  {
    do
      unsigned int v7 = __ldxr((unsigned int *)cache);
    while (__stxr(v7 + 1, (unsigned int *)cache));
    os_unfair_lock_lock_with_options();
    ++*((_DWORD *)cache + 62);
    uint64_t optionally_checking_collisions = _entry_get_optionally_checking_collisions((uint64_t)cache, (uint64_t)key, 1);
    *value_out = 0LL;
    if (optionally_checking_collisions)
    {
      uint64_t v9 = optionally_checking_collisions;
      if (*(void *)optionally_checking_collisions)
      {
        unsigned int v10 = *(unsigned __int16 *)(optionally_checking_collisions + 16) | (*(unsigned __int8 *)(optionally_checking_collisions
                                                                                               + 18) << 16);
        if ((v10 & 0x10000) == 0)
        {
          unint64_t v11 = *(void *)(optionally_checking_collisions + 8);
          if ((~*(_WORD *)(optionally_checking_collisions + 16) & 0xFF00) != 0)
          {
            char v12 = *(_BYTE *)(optionally_checking_collisions + 18);
            unsigned int v10 = v10 & 0xFFFF00FF | ((BYTE1(v10) + 1) << 8);
            *(void *)(optionally_checking_collisions + 8) = v11;
            *(_BYTE *)(optionally_checking_collisions + 18) = v12;
            *(_WORD *)(optionally_checking_collisions + 16) = v10;
          }

          int v13 = (HIWORD(v11) | (v10 << 16)) & 0xFFFFFF;
          if (v13)
          {
            uint64_t v14 = *((void *)cache + 12) + 22LL * (v13 - 1);
            if (((*(unsigned int *)(v14 + 16) | ((unint64_t)*(unsigned __int16 *)(v14 + 20) << 32)) & 0x10000000000LL) == 0)
            {
              if ((v10 & 0x80000) != 0
                || (_entry_remove_from_list((uint64_t)cache, optionally_checking_collisions),
                    (int v13 = *(_DWORD *)(v9 + 14) & 0xFFFFFF) != 0))
              {
                uint64_t v15 = (void *)(*((void *)cache + 12) + 22LL * (v13 - 1));
              }

              else
              {
                uint64_t v15 = 0LL;
              }

              unint64_t v16 = *((unsigned int *)v15 + 4) | ((unint64_t)*((unsigned __int16 *)v15 + 10) << 32);
              uint64_t v17 = (unsigned __int16)*((_DWORD *)v15 + 4);
              if ((unsigned __int16)*((_DWORD *)v15 + 4))
              {
LABEL_16:
                if (v17 == 0xFFFF)
                {
                  int v3 = 84;
LABEL_25:
                  _cache_update_limits(cache);
                  os_unfair_lock_unlock((os_unfair_lock_t)cache + 20);
                  cache_release((uint64_t)cache);
                  return v3;
                }

LABEL_21:
                *((_WORD *)v15 + 10) = WORD2(v16);
                *((_DWORD *)v15 + 4) = v16 & 0xFFFF0000 | (unsigned __int16)(v16 + 1);
                *value_out = (void *)*v15;
                ++*((_DWORD *)cache + 63);
                _entry_add_to_list((uint64_t)cache, v9, (*(_WORD *)(v9 + 16) & 0xFE00) != 0LL);
                int v3 = 0;
                goto LABEL_25;
              }

              unint64_t v18 = (unsigned int (*)(void, void))*((void *)cache + 9);
              if (!v18) {
                goto LABEL_21;
              }
              if (v18(*v15, *((void *)cache + 26)))
              {
                unint64_t v16 = *((unsigned int *)v15 + 4) | ((unint64_t)*((unsigned __int16 *)v15 + 10) << 32);
                uint64_t v17 = (unsigned __int16)*((_DWORD *)v15 + 4);
                goto LABEL_16;
              }

              _entry_evict((uint64_t)cache, v9);
            }
          }
        }
      }
    }

    int v3 = 2;
    goto LABEL_25;
  }

  return v3;
}

unsigned int *cache_retain(unsigned int *result)
{
  do
    unsigned int v1 = __ldxr(result);
  while (__stxr(v1 + 1, result));
  return result;
}

uint64_t _cache_update_limits(_DWORD *a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 80LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 88LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  uint64_t v3 = (mach_absolute_time() - *(void *)(v2 + 40)) * *(unsigned int *)(v2 + 48) / *(unsigned int *)(v2 + 52) / 0xF4240;
  uint64_t v4 = *(void *)(v2 + 56);
  *(_BYTE *)(v2 + 32) = v3 < v4;
  unsigned int v5 = a1[55];
  if ((a1[31] & 0xFFFFFFu) > v5 && v3 >= v4)
  {
    if (v5 >= 0xFFFFFE) {
      int v6 = 16777214;
    }
    else {
      int v6 = a1[55];
    }
    if (v5 >= 0x14) {
      unsigned int v5 = v6 + 1;
    }
    else {
      unsigned int v5 = 20;
    }
    a1[55] = v5;
  }

  unsigned int v7 = a1[58];
  if (v7)
  {
    if (v5 >= v7) {
      unsigned int v5 = a1[58];
    }
    a1[55] = v5;
  }

  return _cache_enforce_limits((uint64_t)a1);
}

void cache_release(uint64_t a1)
{
  do
  {
    unsigned int v2 = __ldxr((unsigned int *)a1);
    BOOL v3 = __OFSUB__(v2, 1);
    signed int v4 = v2 - 1;
  }

  while (__stlxr(v4, (unsigned int *)a1));
  if ((v4 < 0) ^ v3 | (v4 == 0))
  {
    __dmb(9u);
    if (*(void *)(MEMORY[0x1895FF8E0] + 80LL) == -1LL) {
      unsigned int v5 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 88LL);
    }
    else {
      unsigned int v5 = (os_unfair_lock_s *)_os_alloc_once();
    }
    int v6 = v5 + 2;
    os_unfair_lock_lock_with_options();
    unsigned int v7 = *(os_unfair_lock_s **)&v5->_os_unfair_lock_opaque;
    if (*(void *)&v5->_os_unfair_lock_opaque != a1)
    {
      do
      {
        unsigned int v8 = v7;
        unsigned int v7 = *(os_unfair_lock_s **)&v7[2]._os_unfair_lock_opaque;
      }

      while (v7 != (os_unfair_lock_s *)a1);
      unsigned int v5 = v8 + 2;
    }

    *(void *)&v5->_os_unfair_lock_opaque = *(void *)(a1 + 8);
    os_unfair_lock_unlock(v6);
    _cache_remove_all_locked(a1);
    uint64_t v9 = *(void **)(a1 + 200);
    if (v9) {
      free(v9);
    }
    unsigned int v10 = *(void **)(a1 + 88);
    if (v10) {
      free(v10);
    }
    unint64_t v11 = *(void **)(a1 + 96);
    if (v11) {
      free(v11);
    }
    free((void *)a1);
  }
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  v64 = key;
  int v4 = 22;
  if (cache)
  {
    if (key)
    {
      unsigned int v8 = (void (*)(void *, void **, void))*((void *)cache + 4);
      if (!v8 || (v8(key, &v64, *((void *)cache + 26)), v64))
      {
        do
          unsigned int v9 = __ldxr((unsigned int *)cache);
        while (__stxr(v9 + 1, (unsigned int *)cache));
        os_unfair_lock_lock_with_options();
        uint64_t v10 = _value_entry_table_get(*((void *)cache + 12), *((_DWORD *)cache + 30) & 0xFFFFFF, (uint64_t)value);
        uint64_t v11 = v10;
        if (v10
          && (unint64_t v12 = *(unsigned int *)(v10 + 16) | ((unint64_t)*(unsigned __int16 *)(v10 + 20) << 32),
              (v12 & 0x10000000000LL) == 0)
          && (v12 & 0xFFFFFFFFFFLL) != 0)
        {
          uint64_t v13 = v12 & 0xFFFFFF0000LL;
          if ((v12 & 0xFFFFFF0000LL) == 0xFFFFFF0000LL)
          {
            if ((*((_DWORD *)cache + 38) & 0xFFFFFF) == 0
              || (*((_DWORD *)cache + 38) & 0xFFFFFFu) <= *((_DWORD *)cache + 48)
              && (*((_DWORD *)cache + 41) & 0xFFFFFF) != 0
              || (unsigned int v14 = *((_DWORD *)cache + 37) & 0xFFFFFF, v14 == 0xFFFFFF)
              || (uint64_t v15 = *((void *)cache + 11)) == 0
              || (uint64_t v16 = *(_DWORD *)(v15 + 19LL * v14 + 11) & 0xFFFFFF, v16 == 0xFFFFFF))
            {
LABEL_20:
              if ((*((_DWORD *)cache + 41) & 0xFFFFFF) == 0) {
                goto LABEL_49;
              }
              unsigned int v23 = *((_DWORD *)cache + 40) & 0xFFFFFF;
              if (v23 == 0xFFFFFF) {
                goto LABEL_49;
              }
              uint64_t v15 = *((void *)cache + 11);
              if (!v15) {
                goto LABEL_49;
              }
              uint64_t v16 = *(_DWORD *)(v15 + 19LL * v23 + 11) & 0xFFFFFF;
              if (v16 == 0xFFFFFF) {
                goto LABEL_49;
              }
              while (1)
              {
                uint64_t v24 = v15 + 19 * v16;
                int v25 = *(unsigned __int16 *)(v24 + 16);
                unint64_t v26 = *(void *)(v24 + 8);
                int v27 = (HIWORD(v26) | (v25 << 16)) & 0xFFFFFF;
                if (v27)
                {
                  uint64_t v28 = *((void *)cache + 12);
                  unsigned int v29 = v27 - 1;
                  if (((*(unsigned int *)(v28 + 22LL * v29 + 16) | ((unint64_t)*(unsigned __int16 *)(v28 + 22LL * v29 + 20) << 32)) & 0x10000000000LL) == 0
                    && *(void **)(v28 + 22LL * v29) == value)
                  {
                    break;
                  }
                }

                uint64_t v16 = (v26 >> 24) & 0xFFFFFF;
                if (v16 == 0xFFFFFF) {
                  goto LABEL_49;
                }
              }
            }

            else
            {
              while (1)
              {
                uint64_t v17 = v15 + 19 * v16;
                int v18 = *(unsigned __int16 *)(v17 + 16);
                unint64_t v19 = *(void *)(v17 + 8);
                int v20 = (HIWORD(v19) | (v18 << 16)) & 0xFFFFFF;
                if (v20)
                {
                  uint64_t v21 = *((void *)cache + 12);
                  unsigned int v22 = v20 - 1;
                  if (((*(unsigned int *)(v21 + 22LL * v22 + 16) | ((unint64_t)*(unsigned __int16 *)(v21 + 22LL * v22 + 20) << 32)) & 0x10000000000LL) == 0
                    && *(void **)(v21 + 22LL * v22) == value)
                  {
                    break;
                  }
                }

                uint64_t v16 = (v19 >> 24) & 0xFFFFFF;
                if (v16 == 0xFFFFFF) {
                  goto LABEL_20;
                }
              }
            }

            _entry_evict((uint64_t)cache, v15 + 19 * v16);
            unint64_t v12 = *(unsigned int *)(v11 + 16) | ((unint64_t)*(unsigned __int16 *)(v11 + 20) << 32);
            uint64_t v13 = v12 & 0xFFFFFF0000LL;
          }

          if (v13 == 0xFFFFFF0000LL || (unsigned __int16)v12 == 0xFFFFLL)
          {
LABEL_49:
            v44 = (void (*)(void *, void))*((void *)cache + 5);
            if (v44) {
              v44(v64, *((void *)cache + 26));
            }
            int v4 = 84;
LABEL_82:
            _cache_update_limits(cache);
            os_unfair_lock_unlock((os_unfair_lock_t)cache + 20);
            cache_release((uint64_t)cache);
            return v4;
          }
        }

        else
        {
          if ((*((_DWORD *)cache + 33) & 0xFFFFFF) + (*((_DWORD *)cache + 31) & 0xFFFFFFu) >= (*((_DWORD *)cache + 32) & 0xFFFFFFu))
          {
            _value_entry_table_resize(cache);
            uint64_t v11 = _value_entry_table_get(*((void *)cache + 12), *((_DWORD *)cache + 30) & 0xFFFFFF, (uint64_t)value);
          }

          if (!v11)
          {
            _evict_last((uint64_t)cache);
            goto LABEL_49;
          }

          unsigned int v30 = *((_DWORD *)cache + 31) & 0xFF000000 | (*((_DWORD *)cache + 31) + 1) & 0xFFFFFF;
          *((_DWORD *)cache + 31) = v30;
          uint64_t v31 = v30 & 0xFFFFFF;
          *((void *)cache + 17) += cost;
          *(void *)uint64_t v11 = value;
          *(void *)(v11 + 8) = cost;
          v32 = (void (*)(void *, void, uint64_t))*((void *)cache + 6);
          if (v32) {
            v32(value, *((void *)cache + 26), v31);
          }
        }

        uint64_t v33 = *(unsigned int *)(v11 + 16);
        unint64_t v34 = v33 | ((unint64_t)*(unsigned __int16 *)(v11 + 20) << 32);
        if ((_WORD)v33 != 0xFFFF)
        {
          unint64_t v35 = HIDWORD(v34);
          unint64_t v34 = v34 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v34 + 1);
          *(_WORD *)(v11 + 20) = v35;
          *(_DWORD *)(v11 + 16) = v34;
        }

        if ((~(v34 >> 16) & 0xFFFFFF) != 0)
        {
          unint64_t v36 = v34 & 0xFF000000FFFFLL | ((unint64_t)(((v34 >> 16) + 1) & 0xFFFFFF) << 16);
          *(_DWORD *)(v11 + 16) = v36;
          *(_WORD *)(v11 + 20) = WORD2(v36);
        }

        uint64_t v37 = (uint64_t)v64;
        if ((*((_DWORD *)cache + 29) & 0xFFFFFF) + (*((_DWORD *)cache + 27) & 0xFFFFFFu) >= (*((_DWORD *)cache + 28) & 0xFFFFFFu)) {
          _entry_table_resize(cache);
        }
        uint64_t optionally_checking_collisions = _entry_get_optionally_checking_collisions((uint64_t)cache, v37, 1);
        if (optionally_checking_collisions)
        {
          uint64_t v39 = optionally_checking_collisions;
          unint64_t v40 = *(unsigned __int16 *)(optionally_checking_collisions + 16) | ((unint64_t)*(unsigned __int8 *)(optionally_checking_collisions + 18) << 16);
          if (*(void *)optionally_checking_collisions)
          {
            uint64_t v41 = (v40 >> 17) & 0x7F;
          }

          else
          {
            if ((v40 & 0x10000) == 0)
            {
              *((_DWORD *)cache + 27) = *((_DWORD *)cache + 27) & 0xFF000000 | (*((_DWORD *)cache + 27) + 1) & 0xFFFFFF;
LABEL_76:
              *(void *)uint64_t v39 = v37;
              uint64_t v53 = *(unsigned __int16 *)(v39 + 16);
              unint64_t v54 = v53 | ((unint64_t)*(unsigned __int8 *)(v39 + 18) << 16);
              unint64_t v55 = *(void *)(v39 + 8);
              int v56 = HIWORD(v55) | ((_DWORD)v53 << 16);
              uint64_t v57 = *((void *)cache + 12);
              int v58 = v56 & 0xFFFFFF;
              if (v58)
              {
                unsigned int v59 = v58 - 1;
                if (((*(unsigned int *)(v57 + 22LL * v59 + 16) | ((unint64_t)*(unsigned __int16 *)(v57 + 22LL * v59 + 20) << 32)) & 0x10000000000LL) != 0
                  || (_value_entry_unmap((uint64_t)cache, v57 + 22LL * v59),
                      uint64_t v60 = *(unsigned __int16 *)(v39 + 16),
                      unint64_t v54 = v60 | ((unint64_t)*(unsigned __int8 *)(v39 + 18) << 16),
                      unint64_t v55 = *(void *)(v39 + 8),
                      uint64_t v57 = *((void *)cache + 12),
                      (int v58 = (HIWORD(v55) | ((_DWORD)v60 << 16)) & 0xFFFFFF) != 0))
                {
                  if (((*(unsigned int *)(v57 + 22LL * (v58 - 1) + 16) | ((unint64_t)*(unsigned __int16 *)(v57 + 22LL * (v58 - 1) + 20) << 32)) & 0x10000000000LL) == 0)
                  {
                    unint64_t v61 = v54 >> 16;
                    LODWORD(v54) = v54 & 0xFFFFFF00;
                    v55 &= 0xFFFFFFFFFFFFuLL;
                    *(void *)(v39 + 8) = v55;
                    *(_BYTE *)(v39 + 18) = v61;
                    *(_WORD *)(v39 + 16) = v54;
                    uint64_t v57 = *((void *)cache + 12);
                  }
                }
              }

              unsigned int v62 = -1171354717 * ((v11 - v57) >> 1) + 1;
              *(_BYTE *)(v39 + 18) = BYTE2(v54);
              *(void *)(v39 + 8) = v55 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v62 << 48);
              *(_WORD *)(v39 + 16) = v54 & 0xFF00 | BYTE2(v62);
              _entry_add_to_list((uint64_t)cache, v39, (v54 & 0xFE00) != 0);
              int v4 = 0;
              goto LABEL_82;
            }

            uint64_t v41 = (v40 >> 17) & 0x7F;
          }

          int v45 = v41 & 7;
          int v46 = *((_DWORD *)cache + 47) & 0xFFFFFF;
          unsigned int v47 = *((_DWORD *)cache + 44) & 0xFFFFFF;
          switch(v45)
          {
            case 0:
            case 2:
              if (v47) {
                v46 /= v47;
              }
              if (v46 <= 1) {
                int v46 = 1;
              }
              unsigned int v48 = *((_DWORD *)cache + 48) + v46;
              if (v48 >= *((_DWORD *)cache + 55)) {
                unsigned int v48 = *((_DWORD *)cache + 55);
              }
              goto LABEL_70;
            case 1:
            case 3:
              if (v46) {
                v47 /= v46;
              }
              unsigned int v49 = *((_DWORD *)cache + 48);
              if (v47 <= 1) {
                int v50 = 1;
              }
              else {
                int v50 = v47;
              }
              unsigned int v51 = v49 - v50;
              if (v47 <= v49) {
                unsigned int v48 = v51;
              }
              else {
                unsigned int v48 = 0;
              }
LABEL_70:
              *((_DWORD *)cache + 48) = v48;
              break;
            default:
              break;
          }

          if (((*(unsigned __int16 *)(optionally_checking_collisions + 16) | (*(unsigned __int8 *)(optionally_checking_collisions
                                                                                                  + 18) << 16)) & 0x80000) == 0)
            _entry_remove_from_list((uint64_t)cache, optionally_checking_collisions);
          v52 = (void (*)(void, void))*((void *)cache + 5);
          if (v52) {
            v52(*(void *)v39, *((void *)cache + 26));
          }
          *(void *)uint64_t v39 = 0LL;
          goto LABEL_76;
        }

        _evict_last((uint64_t)cache);
        _value_entry_release((uint64_t)cache, v11);
        unint64_t v42 = *(unsigned int *)(v11 + 16) | ((unint64_t)*(unsigned __int16 *)(v11 + 20) << 32);
        if ((v42 & 0x10000000000LL) != 0)
        {
          unint64_t v43 = v42 & 0xFFFFFEFFFFFFFFFFLL;
          *(_DWORD *)(v11 + 16) = v43;
          *(_WORD *)(v11 + 20) = WORD2(v43);
          *((_DWORD *)cache + 33) = *((_DWORD *)cache + 33) & 0xFF000000 | (*((_DWORD *)cache + 33) - 1) & 0xFFFFFF;
        }

        goto LABEL_49;
      }
    }
  }

  return v4;
}

uint64_t _value_entry_unmap(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(a2 + 16) | ((unint64_t)*(unsigned __int16 *)(a2 + 20) << 32);
  uint64_t v3 = ((v2 >> 16) - 1) & 0xFFFFFF;
  unint64_t v4 = v2 & 0xFFFFFF000000FFFFLL | (v3 << 16);
  *(_DWORD *)(a2 + 16) = v4;
  *(_WORD *)(a2 + 20) = WORD2(v4);
  if ((_WORD)v2) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = (_DWORD)v3 == 0;
  }
  if (v5) {
    return _value_entry_remove(result, a2);
  }
  return result;
}

uint64_t _value_entry_release(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 16);
  unint64_t v3 = v2 | ((unint64_t)*(unsigned __int16 *)(a2 + 20) << 32);
  if (!(_WORD)v2) {
    return 84LL;
  }
  *(_WORD *)(a2 + 20) = WORD2(v3);
  *(_DWORD *)(a2 + 16) = v3 & 0xFFFF0000 | (unsigned __int16)(v3 - 1);
  if ((_WORD)v3 == 1)
  {
    if ((v3 & 0xFFFFFF0000LL) != 0)
    {
      BOOL v5 = *(void (**)(void, void))(a1 + 64);
      if (v5) {
        v5(*(void *)a2, *(void *)(a1 + 208));
      }
    }

    else
    {
      _value_entry_remove(a1, a2);
    }
  }

  return 0LL;
}

int cache_release_value(cache_t *cache, void *value)
{
  if (!cache) {
    return 22;
  }
  do
    unsigned int v4 = __ldxr((unsigned int *)cache);
  while (__stxr(v4 + 1, (unsigned int *)cache));
  os_unfair_lock_lock_with_options();
  uint64_t v5 = _value_entry_table_get(*((void *)cache + 12), *((_DWORD *)cache + 30) & 0xFFFFFF, (uint64_t)value);
  if (v5
    && ((*(unsigned int *)(v5 + 16) | ((unint64_t)*(unsigned __int16 *)(v5 + 20) << 32)) & 0x1FFFFFFFFFFLL) != 0)
  {
    int v6 = _value_entry_release((uint64_t)cache, v5);
  }

  else
  {
    int v6 = 2;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)cache + 20);
  cache_release((uint64_t)cache);
  return v6;
}

int cache_remove(cache_t *cache, void *key)
{
  int v2 = 22;
  if (cache && key)
  {
    do
      unsigned int v5 = __ldxr((unsigned int *)cache);
    while (__stxr(v5 + 1, (unsigned int *)cache));
    os_unfair_lock_lock_with_options();
    uint64_t optionally_checking_collisions = _entry_get_optionally_checking_collisions((uint64_t)cache, (uint64_t)key, 1);
    if (optionally_checking_collisions
      && *(void *)optionally_checking_collisions
      && ((*(unsigned __int16 *)(optionally_checking_collisions + 16) | (*(unsigned __int8 *)(optionally_checking_collisions
                                                                                            + 18) << 16)) & 0x10000) == 0)
    {
      _entry_remove((uint64_t)cache, optionally_checking_collisions);
      int v2 = 0;
    }

    else
    {
      int v2 = 2;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)cache + 20);
    cache_release((uint64_t)cache);
  }

  return v2;
}

int cache_remove_all(cache_t *cache)
{
  if (!cache) {
    return 22;
  }
  do
    unsigned int v2 = __ldxr((unsigned int *)cache);
  while (__stxr(v2 + 1, (unsigned int *)cache));
  os_unfair_lock_lock_with_options();
  _cache_remove_all_locked((uint64_t)cache);
  os_unfair_lock_unlock((os_unfair_lock_t)cache + 20);
  cache_release((uint64_t)cache);
  return 0;
}

uint64_t _cache_remove_all_locked(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 104);
  if ((v1 & 0xFFFFFF) != 0)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(v2 + 88) + v3;
      if (*(void *)v5)
      {
        if (((*(unsigned __int16 *)(v5 + 16) | (*(unsigned __int8 *)(v5 + 18) << 16)) & 0x10000) == 0)
        {
          uint64_t result = _entry_remove(v2, v5);
          int v1 = *(_DWORD *)(v2 + 104);
        }
      }

      ++v4;
      v3 += 19LL;
    }

    while (v4 < (v1 & 0xFFFFFFu));
  }

  return result;
}

uint64_t cache_remove_with_block(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  do
    unsigned int v4 = __ldxr((unsigned int *)a1);
  while (__stxr(v4 + 1, (unsigned int *)a1));
  os_unfair_lock_lock_with_options();
  if ((*(_DWORD *)(a1 + 104) & 0xFFFFFF) != 0)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = *(void *)(a1 + 88) + v5;
      if (*(void *)v7)
      {
        int v8 = *(unsigned __int16 *)(v7 + 16) | (*(unsigned __int8 *)(v7 + 18) << 16);
        if ((v8 & 0x10000) == 0)
        {
          int v9 = (HIWORD(*(void *)(v7 + 8)) | (v8 << 16)) & 0xFFFFFF;
          if (v9) {
            uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 22LL * (v9 - 1));
          }
          else {
            uint64_t v10 = 0LL;
          }
        }
      }

      ++v6;
      v5 += 19LL;
    }

    while (v6 < (*(_DWORD *)(a1 + 104) & 0xFFFFFFu));
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  cache_release(a1);
  return 0LL;
}

int cache_destroy(cache_t *cache)
{
  return 0;
}

void cache_set_count_hint(os_unfair_lock_s *a1, uint32_t a2)
{
  do
    unsigned int v3 = __ldxr(&a1->_os_unfair_lock_opaque);
  while (__stxr(v3 + 1, &a1->_os_unfair_lock_opaque));
  a1[55]._os_unfair_lock_opaque = a2;
  a1[58]._os_unfair_lock_opaque = a2;
  os_unfair_lock_lock_with_options();
  _cache_update_limits(a1);
  os_unfair_lock_unlock(a1 + 20);
  cache_release((uint64_t)a1);
}

void cache_set_cost_hint(uint64_t a1, uint64_t a2)
{
  do
    unsigned int v3 = __ldxr((unsigned int *)a1);
  while (__stxr(v3 + 1, (unsigned int *)a1));
  *(void *)(a1 + 240) = a2;
  *(void *)(a1 + 224) = a2;
  os_unfair_lock_lock_with_options();
  _cache_update_limits((_DWORD *)a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  cache_release(a1);
}

uint64_t cache_get_count_hint(uint64_t a1)
{
  return *(unsigned int *)(a1 + 232);
}

uint64_t cache_get_cost_hint(uint64_t a1)
{
  return *(void *)(a1 + 240);
}

uint64_t cache_set_minimum_values_hint(uint64_t result, int a2)
{
  *(_DWORD *)(result + 216) = a2;
  return result;
}

uint64_t cache_get_minimum_values_hint(uint64_t a1)
{
  return *(unsigned int *)(a1 + 216);
}

uint64_t cache_get_name(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

char *cache_set_name(uint64_t a1, char *__s1)
{
  unsigned int v4 = *(void **)(a1 + 200);
  if (v4) {
    free(v4);
  }
  uint64_t result = strdup(__s1);
  *(void *)(a1 + 200) = result;
  return result;
}

void cache_print(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    lock = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock_with_options();
    unsigned int v3 = *(_DWORD *)(a1 + 248);
    int v2 = *(_DWORD *)(a1 + 252);
    if (v3) {
      unsigned int v4 = 100 * v2 / v3;
    }
    else {
      unsigned int v4 = 0;
    }
    printf("Hits: %u/%u (%2d%%)\n", v2, *(_DWORD *)(a1 + 248), v4);
    printf( "Keys: %u (+%u) / %u ",  *(_DWORD *)(a1 + 108) & 0xFFFFFF,  *(_DWORD *)(a1 + 116) & 0xFFFFFF,  *(_DWORD *)(a1 + 104) & 0xFFFFFF);
    if ((*(_DWORD *)(a1 + 104) & 0xFFFFFF) != 0)
    {
      uint64_t v5 = 0LL;
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = *(void *)(a1 + 88);
        uint64_t v8 = v7 + v5;
        if (((*(unsigned __int16 *)(v7 + v5 + 16) | (*(unsigned __int8 *)(v7 + v5 + 18) << 16)) & 0x10000) != 0)
        {
          snprintf(__str, 0x20uLL, "-%p-");
        }

        else if (*(void *)(v7 + v5))
        {
          snprintf(__str, 0x20uLL, " %p ");
        }

        else
        {
          strcpy(__str, "                    ");
        }

        unint64_t v9 = *(unsigned __int16 *)(v8 + 16) | ((unint64_t)*(unsigned __int8 *)(v8 + 18) << 16);
        unint64_t v10 = *(void *)(v8 + 8);
        if ((v9 & 0x10000) != 0 || *(void *)(v7 + v5))
        {
          uint64_t v11 = off_18A2FE1E8[(v9 >> 17) & 7];
          unsigned int v12 = WORD1(v9) & 1;
          int v13 = (HIWORD(v10) | ((_DWORD)v9 << 16)) & 0xFFFFFF;
          printf( "    %5s %7u %7u [%5u]    key: %s removed %u access %u valid: %1u idx: %7u\n",  v11,  (v10 >> 24) & 0xFFFFFF,  *(_DWORD *)(v8 + 8) & 0xFFFFFF,  v6,  __str,  v12,  HIBYTE(*(_WORD *)(v8 + 16)),  v13 != 0,  v13);
        }

        ++v6;
        v5 += 19LL;
      }

      while (v6 < (*(_DWORD *)(a1 + 104) & 0xFFFFFFu));
    }

    printf( "Values: %u (+%u) / %u\n",  *(_DWORD *)(a1 + 124) & 0xFFFFFF,  *(_DWORD *)(a1 + 132) & 0xFFFFFF,  *(_DWORD *)(a1 + 120) & 0xFFFFFF);
    if ((*(_DWORD *)(a1 + 120) & 0xFFFFFF) != 0)
    {
      uint64_t v14 = 0LL;
      unint64_t v15 = 0LL;
      do
      {
        uint64_t v16 = *(void *)(a1 + 96) + v14;
        if (((*(unsigned int *)(v16 + 16) | ((unint64_t)*(unsigned __int16 *)(v16 + 20) << 32)) & 0xFFFFFFFFFFLL) == 0
          && *(void *)v16 == 0LL)
        {
          strcpy(__str, "                  ");
        }

        else
        {
          snprintf(__str, 0x20uLL, "%p", *(const void **)v16);
        }

        unint64_t v18 = *(unsigned int *)(v16 + 16) | ((unint64_t)*(unsigned __int16 *)(v16 + 20) << 32);
        if ((v18 & 0x1FFFFFFFFFFLL) != 0)
        {
          if ((v18 & 0x10000000000LL) != 0) {
            unint64_t v19 = "-";
          }
          else {
            unint64_t v19 = " ";
          }
          printf( "[%5u] value: %s%s%s removed: %u retain: %u entries: %d\n",  v15 + 1,  v19,  __str,  v19,  (v18 & 0x10000000000LL) >> 40,  (unsigned __int16)*(_DWORD *)(v16 + 16),  (v18 >> 16) & 0xFFFFFF);
        }

        ++v15;
        v14 += 22LL;
      }

      while (v15 < (*(_DWORD *)(a1 + 120) & 0xFFFFFFu));
    }

    uint64_t v20 = 0LL;
    uint64_t v21 = (_DWORD *)(a1 + 152);
    do
    {
      if ((*v21 & 0xFFFFFF) != 0) {
        printf( "%5s Size: %5u Front: %7u Back: %7u\n",  off_18A2FE1E8[v20],  *v21 & 0xFFFFFF,  *(v21 - 2) & 0xFFFFFF,  *(v21 - 1) & 0xFFFFFF);
      }
      ++v20;
      v21 += 3;
    }

    while (v20 != 4);
    putchar(10);
    os_unfair_lock_unlock(lock);
  }

void cache_print_stats(os_unfair_lock_s *a1)
{
  if (a1)
  {
    int v2 = a1 + 20;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = a1[62]._os_unfair_lock_opaque;
    uint32_t v3 = a1[63]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque) {
      unsigned int v5 = 100 * v3 / os_unfair_lock_opaque;
    }
    else {
      unsigned int v5 = 0;
    }
    printf("Hits: %u/%u (%2d%%)\n", v3, a1[62]._os_unfair_lock_opaque, v5);
    printf( "Keys: %u (+%u) / %u ",  a1[27]._os_unfair_lock_opaque & 0xFFFFFF,  a1[29]._os_unfair_lock_opaque & 0xFFFFFF,  a1[26]._os_unfair_lock_opaque & 0xFFFFFF);
    printf( "Values: %u (+%u) / %u\n",  a1[31]._os_unfair_lock_opaque & 0xFFFFFF,  a1[33]._os_unfair_lock_opaque & 0xFFFFFF,  a1[30]._os_unfair_lock_opaque & 0xFFFFFF);
    os_unfair_lock_unlock(v2);
  }

uint64_t cache_invoke(uint64_t a1, void (*a2)(void))
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    os_unfair_lock_lock_with_options();
    int v5 = *(_DWORD *)(a1 + 104);
    if ((v5 & 0xFFFFFF) != 0)
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = *(void *)(a1 + 88);
        if (*(void *)(v8 + v6))
        {
          uint64_t v9 = v8 + v6;
          int v10 = *(unsigned __int16 *)(v9 + 16) | (*(unsigned __int8 *)(v9 + 18) << 16);
          if ((v10 & 0x10000) == 0)
          {
            int v11 = (HIWORD(*(void *)(v9 + 8)) | (v10 << 16)) & 0xFFFFFF;
            if (v11)
            {
              if (((*(unsigned int *)(*(void *)(a1 + 96) + 22LL * (v11 - 1) + 16) | ((unint64_t)*(unsigned __int16 *)(*(void *)(a1 + 96) + 22LL * (v11 - 1) + 20) << 32)) & 0x10000000000LL) == 0)
              {
                a2();
                int v5 = *(_DWORD *)(a1 + 104);
              }
            }
          }
        }

        ++v7;
        v6 += 19LL;
      }

      while (v7 < (v5 & 0xFFFFFFu));
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    return 0LL;
  }

  return result;
}

void cache_get_info(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      unsigned int v4 = (os_unfair_lock_s *)(a1 + 80);
      os_unfair_lock_lock_with_options();
      *(void *)(a2 + 12) = *(void *)(a1 + 248);
      *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 108) & 0xFFFFFF;
      *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 124) & 0xFFFFFF;
      *(void *)(a2 + 24) = *(void *)(a1 + 136);
      *(_DWORD *)a2 = 1;
      os_unfair_lock_unlock(v4);
    }
  }

uint64_t cache_get_info_for_keys(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v8 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock_with_options();
  if (a2)
  {
    unint64_t v9 = 0LL;
    unsigned int v10 = 1;
    do
    {
      _cache_get_info_for_key(a1, *(void *)(a3 + 8 * v9), (char *)(a4 + 2 * v9));
      unint64_t v9 = v10++;
    }

    while (v9 < a2);
  }

  os_unfair_lock_unlock(v8);
  return 0LL;
}

uint64_t _cache_get_info_for_key(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t result = _entry_get_optionally_checking_collisions(a1, a2, 1);
  if (!result)
  {
    a3[1] = 0;
LABEL_8:
    char v9 = 0;
    goto LABEL_9;
  }

  a3[1] = *(_BYTE *)(result + 17);
  if (!*(void *)result) {
    goto LABEL_8;
  }
  int v6 = *(unsigned __int16 *)(result + 16) | (*(unsigned __int8 *)(result + 18) << 16);
  if ((v6 & 0x10000) != 0) {
    goto LABEL_8;
  }
  int v7 = (HIWORD(*(void *)(result + 8)) | (v6 << 16)) & 0xFFFFFF;
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 96) + 22LL * (v7 - 1);
  char v9 = 1;
LABEL_9:
  *a3 = v9;
  return result;
}

uint64_t cache_get_info_for_key(uint64_t a1, uint64_t a2, char *a3)
{
  if (!a1) {
    return 22LL;
  }
  int v6 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock_with_options();
  _cache_get_info_for_key(a1, a2, a3);
  os_unfair_lock_unlock(v6);
  return 0LL;
}

void cache_simulate_memory_warning_event(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 80LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 88LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  uint32_t v3 = *(dispatch_queue_s **)(v2 + 16);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __cache_simulate_memory_warning_event_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  dispatch_async_and_wait(v3, block);
}

void __cache_simulate_memory_warning_event_block_invoke(uint64_t a1)
{
}

void _cache_handle_memory_pressure_event(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 80LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 88LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  *(_BYTE *)(v2 + 32) = a1 != 1;
  if (a1 != 1)
  {
    os_unfair_lock_lock_with_options();
    *(void *)(v2 + 40) = mach_absolute_time();
    uint64_t v3 = *(void *)v2;
    if (*(void *)v2)
    {
      if (a1 == 4) {
        dispatch_qos_class_t v4 = QOS_CLASS_USER_INITIATED;
      }
      else {
        dispatch_qos_class_t v4 = QOS_CLASS_UTILITY;
      }
      uint64_t v5 = MEMORY[0x1895FED80];
      do
      {
        do
          unsigned int v6 = __ldxr((unsigned int *)v3);
        while (__stxr(v6 + 1, (unsigned int *)v3));
        if (v6)
        {
          v9[0] = v5;
          v9[1] = 0x40000000LL;
          v9[2] = ___cache_handle_memory_pressure_event_block_invoke;
          v9[3] = &__block_descriptor_tmp_23;
          v9[4] = v3;
          v9[5] = a1;
          dispatch_block_t v7 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v4, 0, v9);
          dispatch_async(*(dispatch_queue_t *)(v2 + 16), v7);
          _Block_release(v7);
        }

        else
        {
          do
            unsigned int v8 = __ldxr((unsigned int *)v3);
          while (__stxr(v8 - 1, (unsigned int *)v3));
        }

        uint64_t v3 = *(void *)(v3 + 8);
      }

      while (v3);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  }

const char *_cache_init_globals(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 40) = 0LL;
  mach_timebase_info((mach_timebase_info_t)(a1 + 48));
  *(_BYTE *)(a1 + 32) = 0;
  dispatch_workloop_t v2 = dispatch_workloop_create("com.apple.libcache.memorypressure");
  *(void *)(a1 + 16) = v2;
  uint64_t v3 = dispatch_source_create(MEMORY[0x1895FE818], 0LL, 7uLL, v2);
  uint64_t v4 = MEMORY[0x1895FED80];
  *(void *)(a1 + 24) = v3;
  handler[0] = v4;
  handler[1] = 0x40000000LL;
  handler[2] = ___cache_enable_memory_pressure_event_block_invoke;
  handler[3] = &__block_descriptor_tmp_3;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_set_qos_class();
  dispatch_resume(*(dispatch_object_t *)(a1 + 24));
  uint64_t result = getenv("LIBCACHE_JETSAM_WINDOW");
  if (result)
  {
    uint64_t result = (const char *)atoi(result);
    uint64_t v6 = (int)result;
  }

  else
  {
    uint64_t v6 = 4000LL;
  }

  *(void *)(a1 + 56) = v6;
  return result;
}

void ___cache_enable_memory_pressure_event_block_invoke(uint64_t a1)
{
  unint64_t data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24LL));
  _cache_handle_memory_pressure_event(data);
}

uint64_t _cache_enforce_limits(uint64_t a1)
{
  do
  {
    uint64_t result = a1;
    if ((*(_DWORD *)(a1 + 124) & 0xFFFFFFu) <= *(_DWORD *)(a1 + 220))
    {
      unint64_t v3 = *(void *)(a1 + 224);
      if (!v3 || *(void *)(a1 + 136) <= v3) {
        break;
      }
    }

    uint64_t result = _evict_last(a1);
  }

  while ((result & 1) != 0);
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 264);
    if (v4 <= (*(_DWORD *)(a1 + 108) & 0xFFFFFF) - v4 && v4 <= *(_DWORD *)(a1 + 220)) {
      return result;
    }
    if ((*(_DWORD *)(a1 + 176) & 0xFFFFFF) == 0)
    {
      if ((*(_DWORD *)(a1 + 188) & 0xFFFFFF) == 0) {
        return result;
      }
LABEL_12:
      int v5 = *(_DWORD *)(a1 + 184);
      goto LABEL_13;
    }

    if ((*(_DWORD *)(a1 + 176) & 0xFFFFFFu) <= *(_DWORD *)(a1 + 192) && (*(_DWORD *)(a1 + 188) & 0xFFFFFF) != 0) {
      goto LABEL_12;
    }
    int v5 = *(_DWORD *)(a1 + 172);
LABEL_13:
    uint64_t v6 = *(void *)&v5 & 0xFFFFFFLL;
    if (v6 == 0xFFFFFF) {
      return result;
    }
    uint64_t v7 = *(void *)(a1 + 88);
    if (!v7) {
      return result;
    }
    uint64_t result = _entry_remove(a1, v7 + 19LL * v6);
  }

uint64_t _evict_last(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 152) & 0xFFFFFF) == 0)
  {
    if ((*(_DWORD *)(a1 + 164) & 0xFFFFFF) == 0) {
      return 0LL;
    }
    goto LABEL_6;
  }

  if ((*(_DWORD *)(a1 + 152) & 0xFFFFFFu) <= *(_DWORD *)(a1 + 192) && (*(_DWORD *)(a1 + 164) & 0xFFFFFF) != 0)
  {
LABEL_6:
    int v1 = *(_DWORD *)(a1 + 160);
    goto LABEL_7;
  }

  int v1 = *(_DWORD *)(a1 + 148);
LABEL_7:
  unsigned int v2 = v1 & 0xFFFFFF;
  if (v2 != 0xFFFFFF)
  {
    uint64_t v3 = *(void *)(a1 + 88);
    if (v3)
    {
      _entry_evict(a1, v3 + 19LL * v2);
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t _entry_get_optionally_checking_collisions(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v5 = (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a2, *(void *)(a1 + 208));
  unint64_t v6 = *(_DWORD *)(a1 + 104) & 0xFFFFFF;
  unint64_t v7 = v5 % v6;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = v8 + 19 * (v5 % v6);
  if (a3)
  {
    uint64_t v10 = (v6 - v7);
    if ((_DWORD)v6 != (_DWORD)v7)
    {
      uint64_t v11 = 0LL;
      do
      {
        uint64_t v8 = v9 + 19 * v11;
        int v12 = *(unsigned __int16 *)(v8 + 16) | (*(unsigned __int8 *)(v8 + 18) << 16);
        if (*(void *)v8)
        {
        }

        else if ((v12 & 0x10000) == 0)
        {
          return v8;
        }

        ++v11;
        --v10;
      }

      while (v10);
      uint64_t v8 = *(void *)(a1 + 88);
    }

    if ((_DWORD)v7)
    {
      uint64_t v13 = 0LL;
      for (uint64_t i = v8; ; i += 19LL)
      {
        int v15 = *(unsigned __int16 *)(i + 16) | (*(unsigned __int8 *)(i + 18) << 16);
        if (*(void *)i)
        {
          if ((v15 & 0x10000) == 0 && ((*(uint64_t (**)(void))(a1 + 24))() & 1) != 0)
          {
            v8 += 19 * v13;
            return v8;
          }
        }

        else if ((v15 & 0x10000) == 0)
        {
          return i;
        }

        ++v13;
        if (!--v7) {
          return 0LL;
        }
      }
    }

    return 0LL;
  }

  uint64_t v16 = (v6 - v7);
  if ((_DWORD)v16)
  {
    uint64_t v17 = 0LL;
    while (*(void *)(v9 + 19 * v17)
         || ((*(unsigned __int16 *)(v9 + 19 * v17 + 16) | (*(unsigned __int8 *)(v9 + 19 * v17 + 18) << 16)) & 0x10000) != 0)
    {
      ++v17;
      if (!--v16) {
        goto LABEL_25;
      }
    }

    return v9 + 19 * v17;
  }

  else
  {
LABEL_25:
    if (!(_DWORD)v7) {
      return 0LL;
    }
    while (*(void *)v8 || ((*(unsigned __int16 *)(v8 + 16) | (*(unsigned __int8 *)(v8 + 18) << 16)) & 0x10000) != 0)
    {
      v8 += 19LL;
      if (!--v7) {
        return 0LL;
      }
    }
  }

  return v8;
}

uint64_t _entry_add_to_list(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = result + 12LL * a3;
  int v5 = *(_DWORD *)(v3 + 144);
  unsigned int v4 = (int *)(v3 + 144);
  uint64_t v6 = *(void *)(result + 88);
  int v7 = 678152731 * (a2 - v6);
  unsigned int v8 = v5 & 0xFFFFFF;
  if ((v5 & 0xFFFFFF) == 0xFFFFFF || v6 == 0)
  {
    int v12 = v7 & 0xFFFFFF;
    *(_DWORD *)(result + 12LL * a3 + 148) = v7 & 0xFFFFFF | (*(unsigned __int8 *)(result + 12LL * a3 + 151) << 24);
    int v10 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
    unint64_t v11 = *(void *)(a2 + 8) | 0xFFFFFFFFFFFFLL;
  }

  else
  {
    *(void *)(v6 + 19LL * v8 + 8) = *(void *)(v6 + 19LL * v8 + 8) & 0xFFFF000000FFFFFFLL | ((*(void *)&v7 & 0xFFFFFFLL) << 24);
    int v10 = *(unsigned __int16 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 18) << 16);
    unint64_t v11 = *v4 | ((unint64_t)*(unsigned __int16 *)(a2 + 14) << 48) | 0xFFFFFF000000LL;
    int v12 = v7 & 0xFFFFFF;
  }

  *(void *)(a2 + 8) = v11;
  *(_WORD *)(a2 + 16) = v10;
  *(_BYTE *)(a2 + 18) = (v10 & 0xFFF1FFFF | ((a3 & 7) << 17)) >> 16;
  *unsigned int v4 = v12 | (*((unsigned __int8 *)v4 + 3) << 24);
  *(_DWORD *)(result + 12LL * a3 + 152) = *(_DWORD *)(result + 12LL * a3 + 152) & 0xFF000000 | (*(_DWORD *)(result + 12LL * a3 + 152)
                                                                                              + 1) & 0xFFFFFF;
  return result;
}

uint64_t _value_entry_table_get(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = os_simple_hash() % (unint64_t)a2;
  uint64_t v6 = a2 - v5;
  if (a2 == (_DWORD)v5)
  {
LABEL_6:
    if ((_DWORD)v5)
    {
      uint64_t v10 = 0LL;
      for (uint64_t result = a1; *(void *)result != a3; result += 22LL)
      {
        ++v10;
        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a1 + 22 * v5;
    while (1)
    {
      uint64_t result = v8 + 22 * v7;
      if (*(void *)result == a3
        || ((*(unsigned int *)(v8 + 22 * v7 + 16) | ((unint64_t)*(unsigned __int16 *)(v8 + 22 * v7 + 20) << 32)) & 0x1FFFFFFFFFFLL) == 0)
      {
        break;
      }

      ++v7;
      if (!--v6) {
        goto LABEL_6;
      }
    }
  }

  return result;
}

uint64_t _value_entry_remove(uint64_t result, uint64_t a2)
{
  if (((*(unsigned int *)(a2 + 16) | ((unint64_t)*(unsigned __int16 *)(a2 + 20) << 32)) & 0x10000000000LL) == 0)
  {
    uint64_t v3 = result;
    unsigned int v4 = *(_DWORD *)(result + 124) & 0xFF000000 | (*(_DWORD *)(result + 124) - 1) & 0xFFFFFF;
    *(_DWORD *)(result + 124) = v4;
    uint64_t v5 = v4 & 0xFFFFFF;
    *(void *)(result + 136) -= *(void *)(a2 + 8);
    uint64_t v6 = *(void (**)(void, void, uint64_t))(result + 56);
    if (v6) {
      v6(*(void *)a2, *(void *)(result + 208), v5);
    }
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(void *)(a2 + 14) = 0LL;
    uint64_t v7 = a2 + 22;
    if (a2 + 22 == *(void *)(v3 + 96) + 22LL * (*(_DWORD *)(v3 + 120) & 0xFFFFFF)) {
      uint64_t v7 = *(void *)(v3 + 96);
    }
    if (((*(unsigned int *)(v7 + 16) | ((unint64_t)*(unsigned __int16 *)(v7 + 20) << 32)) & 0x1FFFFFFFFFFLL) != 0)
    {
      unsigned int v9 = *(_DWORD *)(a2 + 16);
      uint64_t v8 = a2 + 16;
      unint64_t v10 = v9 | ((unint64_t)*(unsigned __int16 *)(v8 + 4) << 32) | 0x10000000000LL;
      *(_DWORD *)uint64_t v8 = v9;
      *(_WORD *)(v8 + 4) = WORD2(v10);
      *(_DWORD *)(v3 + 132) = *(_DWORD *)(v3 + 132) & 0xFF000000 | (*(_DWORD *)(v3 + 132) + 1) & 0xFFFFFF;
    }

    return v3;
  }

  return result;
}

void ___cache_handle_memory_pressure_event_block_invoke(uint64_t a1)
{
  unsigned int v2 = *(_DWORD **)(a1 + 32);
  if (*(void *)(a1 + 40) == 4LL)
  {
    unsigned int v3 = 0;
  }

  else
  {
    unsigned int v3 = (v2[31] >> 1) & 0x7FFFFF;
    unsigned int v4 = v2[54];
    if (v4 <= v3) {
      int v5 = (v2[31] >> 1) & 0x7FFFFF;
    }
    else {
      int v5 = v2[54];
    }
    if (v4) {
      unsigned int v3 = v5;
    }
  }

  v2[55] = v3;
  _cache_enforce_limits((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80LL));
  cache_release(*(void *)(a1 + 32));
}

BOOL cache_key_is_equal_cb_cstring(void *key1, void *key2, void *unused)
{
  return strcmp((const char *)key1, (const char *)key2) == 0;
}

uintptr_t cache_key_hash_cb_integer(void *key, void *unused)
{
  return os_simple_hash();
}

BOOL cache_key_is_equal_cb_integer(void *key1, void *key2, void *unused)
{
  return key1 == key2;
}

BOOL cache_value_make_nonpurgeable_cb(void *value, void *unused)
{
  return malloc_make_nonpurgeable(value) == 0;
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1895FEF60](a1);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FE8D0](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_resume(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class()
{
  return MEMORY[0x1895FEAA0]();
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FEAC8](type, handle, mask, queue);
}

unint64_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1895FEAD0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1895FEB38](label);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x1896002A0](ptr);
}

void malloc_make_purgeable(void *ptr)
{
}

uint64_t os_simple_hash()
{
  return MEMORY[0x1895FF5A0]();
}

uint64_t os_simple_hash_string()
{
  return MEMORY[0x1895FF5A8]();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FF1D8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1895FF1E0](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}