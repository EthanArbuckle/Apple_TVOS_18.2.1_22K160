objc_object *sub_180019C00(objc_object *a1, double a2)
{
  uint64_t v2;
  char v3;
  __clrex();
  if ((v3 & 2) != 0 && (*(_DWORD *)((v2 & 0xFFFFFFFF8LL) + 0x28) & 2) != 0) {
    return (objc_object *)swiftRetain(a1, a2);
  }
  else {
    return -[objc_object retain](a1, sel_retain);
  }
}
}

id objc_msgSend(id result, SEL a2, ...)
{
  if ((uint64_t)result > 0)
  {
    uint64_t v16 = *(void *)result & 0xFFFFFFFF8LL;
    goto LABEL_3;
  }

  if (result)
  {
    else {
      uint64_t v28 = result & 7;
    }
    uint64_t v16 = objc_debug_taggedpointer_classes[v28];
LABEL_3:
    while (1)
    {
      unint64_t v17 = *(void *)(v16 + 16);
      unint64_t v18 = v17 & 0xFFFFFFFFFFFELL;
      if ((v17 & 1) == 0) {
        break;
      }
      unint64_t v27 = *(void *)(v18 + 8 * (((a2 - (SEL)&unk_18E7BB5A8) >> SBYTE6(v17)) & (v17 >> 53)));
      if (a2 - (SEL)&unk_18E7BB5A8 == v27 >> 38) {
        return (id)((uint64_t (*)(void))(v16 - ((uint64_t)(v27 << 26) >> 24)))();
      }
      v16 += *(void *)(v18 - 16);
    }

    unint64_t v19 = ((unint64_t)a2 ^ ((unint64_t)a2 >> 7)) & HIWORD(v17);
    v20 = (uint64_t *)(v18 + 16 * v19);
    while (1)
    {
      uint64_t v22 = *v20;
      v21 = (const char *)v20[1];
      v20 -= 2;
      if (v21 == a2) {
        return (id)((uint64_t (*)(void))(v22 ^ v16))();
      }
      if (!v21) {
        break;
      }
      if ((unint64_t)v20 < v18)
      {
        v23 = (uint64_t *)(v18 + (v17 >> 44));
        unint64_t v24 = v18 + 16 * v19;
        while (1)
        {
          uint64_t v22 = *v23;
          v25 = (const char *)v23[1];
          v23 -= 2;
          if (v25 == a2) {
            break;
          }
          if (v25) {
            BOOL v26 = (unint64_t)v23 > v24;
          }
          else {
            BOOL v26 = 0;
          }
          if (!v26) {
            return (id)_objc_msgSend_uncached( (objc_object *)result,  (objc_selector *)a2,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
          }
        }

        return (id)((uint64_t (*)(void))(v22 ^ v16))();
      }
    }

    return (id)_objc_msgSend_uncached( (objc_object *)result,  (objc_selector *)a2,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
  }

  return result;
}

objc_object *objc_msgLookup(objc_object *a1, objc_selector *a2)
{
  if ((uint64_t)a1 > 0)
  {
    uint64_t v2 = (uint64_t)a1->isa & 0xFFFFFFFF8LL;
    goto LABEL_3;
  }

  if (a1)
  {
    else {
      uint64_t v12 = a1 & 7;
    }
    uint64_t v2 = objc_debug_taggedpointer_classes[v12];
LABEL_3:
    while (1)
    {
      unint64_t v3 = *(void *)(v2 + 16);
      unint64_t v4 = v3 & 0xFFFFFFFFFFFELL;
      if ((v3 & 1) == 0) {
        break;
      }
      if (a2 - (objc_selector *)&unk_18E7BB5A8 == *(void *)(v4 {
                                                             + 8
      }
      v2 += *(void *)(v4 - 16);
    }

    unint64_t v5 = ((unint64_t)a2 ^ ((unint64_t)a2 >> 7)) & HIWORD(v3);
    unint64_t v6 = v4 + 16 * v5;
    while (1)
    {
      uint64_t v7 = *(objc_selector **)(v6 + 8);
      v6 -= 16LL;
      if (v7 == a2) {
        break;
      }
      if (!v7) {
        return _objc_msgLookup_uncached(a1, a2);
      }
      if (v6 < v4)
      {
        unint64_t v8 = v4 + (v3 >> 44);
        unint64_t v9 = v4 + 16 * v5;
        while (1)
        {
          __n128 v10 = *(objc_selector **)(v8 + 8);
          v8 -= 16LL;
          if (v10 == a2) {
            break;
          }
          if (v10) {
            BOOL v11 = v8 > v9;
          }
          else {
            BOOL v11 = 0;
          }
          if (!v11) {
            return _objc_msgLookup_uncached(a1, a2);
          }
        }

        return a1;
      }
    }
  }

  return a1;
}

double _objc_msgNil()
{
  return 0.0;
}

double _objc_returnNil()
{
  return _objc_msgNil();
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  receiver = (objc_object *)a1->receiver;
  for (Class i = a1->super_class[1].isa; ; Class i = (Class)((char *)i + *(void *)(v20 - 16)))
  {
    Class isa = i[2].isa;
    unint64_t v20 = (unint64_t)isa & 0xFFFFFFFFFFFELL;
    unint64_t v30 = *(void *)(v20
                    + 8 * (((a2 - (SEL)&unk_18E7BB5A8) >> SBYTE6(isa)) & ((unint64_t)isa >> 53)));
    if (a2 - (SEL)&unk_18E7BB5A8 == v30 >> 38) {
      return (id)((uint64_t (*)(objc_object *))((char *)i - ((uint64_t)(v30 << 26) >> 24)))(receiver);
    }
  }

  unint64_t v21 = ((unint64_t)a2 ^ ((unint64_t)a2 >> 7)) & ((unint64_t)isa >> 48);
  uint64_t v22 = (uint64_t *)(v20 + 16 * v21);
  while (1)
  {
    uint64_t v24 = *v22;
    v23 = (const char *)v22[1];
    v22 -= 2;
    if (v23 == a2) {
      return (id)((uint64_t (*)(objc_object *))(v24 ^ (unint64_t)i))(receiver);
    }
    if (!v23) {
      break;
    }
    if ((unint64_t)v22 < v20)
    {
      BOOL v26 = (uint64_t *)(v20 + ((unint64_t)isa >> 44));
      unint64_t v27 = v20 + 16 * v21;
      while (1)
      {
        uint64_t v24 = *v26;
        uint64_t v28 = (const char *)v26[1];
        v26 -= 2;
        if (v28 == a2) {
          break;
        }
        if (v28) {
          BOOL v29 = (unint64_t)v26 > v27;
        }
        else {
          BOOL v29 = 0;
        }
        if (!v29) {
          return (id)_objc_msgSend_uncached( receiver,  (objc_selector *)a2,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
        }
      }

      return (id)((uint64_t (*)(objc_object *))(v24 ^ (unint64_t)i))(receiver);
    }
  }

  return (id)_objc_msgSend_uncached( receiver,  (objc_selector *)a2,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
}

objc_object *objc_msgLookupSuper2(uint64_t a1, objc_selector *a2)
{
  result = *(objc_object **)a1;
  for (uint64_t i = *(void *)(*(void *)(a1 + 8) + 8LL); ; i += *(void *)(v6 - 16))
  {
    unint64_t v5 = *(void *)(i + 16);
    unint64_t v6 = v5 & 0xFFFFFFFFFFFELL;
    if ((v5 & 1) == 0) {
      break;
    }
    if (a2 - (objc_selector *)&unk_18E7BB5A8 == *(void *)(v6 {
                                                           + 8
    }
  }

  unint64_t v7 = ((unint64_t)a2 ^ ((unint64_t)a2 >> 7)) & HIWORD(v5);
  unint64_t v8 = v6 + 16 * v7;
  while (1)
  {
    __n128 v9 = *(objc_selector **)(v8 + 8);
    v8 -= 16LL;
    if (v9 == a2) {
      break;
    }
    if (!v9) {
      return _objc_msgLookup_uncached(result, a2);
    }
    if (v8 < v6)
    {
      unint64_t v10 = v6 + (v5 >> 44);
      unint64_t v11 = v6 + 16 * v7;
      while (1)
      {
        __n128 v12 = *(objc_selector **)(v10 + 8);
        v10 -= 16LL;
        if (v12 == a2) {
          break;
        }
        if (v12) {
          BOOL v13 = v10 > v11;
        }
        else {
          BOOL v13 = 0;
        }
        if (!v13) {
          return _objc_msgLookup_uncached(result, a2);
        }
      }

      return result;
    }
  }

  return result;
}

uint64_t _objc_msgSend_uncached( objc_object *a1, objc_selector *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, __n128 a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, ...)
{
  unint64_t v17 = lookUpImpOrForward(a1, a2, v16, (char *)3);
  return (uint64_t)v17(a1, (SEL)a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

objc_object *_objc_msgLookup_uncached(objc_object *a1, objc_selector *a2)
{
  return a1;
}

uint64_t cache_getImp(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = v4 & 0xFFFFFFFFFFFELL;
  if ((v4 & 1) != 0)
  {
    unint64_t v15 = *(void *)(v5 + 8 * (((a2 - (void)&unk_18E7BB5A8) >> SBYTE6(v4)) & (v4 >> 53)));
    if (a2 - (void)&unk_18E7BB5A8 == v15 >> 38) {
      return a1 - ((uint64_t)(v15 << 26) >> 24);
    }
    else {
      return a3;
    }
  }

  else
  {
    unint64_t v6 = (a2 ^ (a2 >> 7)) & HIWORD(v4);
    unint64_t v7 = (uint64_t *)(v5 + 16 * v6);
    while (1)
    {
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      v7 -= 2;
      if (v8 == a2) {
        break;
      }
      if (!v8) {
        return 0LL;
      }
      if ((unint64_t)v7 < v5)
      {
        unint64_t v11 = (uint64_t *)(v5 + (v4 >> 44));
        unint64_t v12 = v5 + 16 * v6;
        while (1)
        {
          uint64_t v9 = *v11;
          uint64_t v13 = v11[1];
          v11 -= 2;
          if (v13 == a2) {
            break;
          }
          if (v13) {
            BOOL v14 = (unint64_t)v11 > v12;
          }
          else {
            BOOL v14 = 0;
          }
          if (!v14) {
            return 0LL;
          }
        }

        break;
      }
    }

    uint64_t result = v9;
    if (v9) {
      return v9 ^ a1;
    }
  }

  return result;
}

id _objc_msgForward(id receiver, SEL sel, ...)
{
}

id method_invoke(id receiver, Method m, ...)
{
  if ((m & 1) == 0) {
    return (id)(*(uint64_t (**)(id, void))(((unint64_t)m & 0xFFFFFFFFFFFFFFFCLL) + 16))( receiver,  *(void *)((unint64_t)m & 0xFFFFFFFFFFFFFFFCLL));
  }
  __n128 v19 = v8;
  __n128 v20 = v9;
  __n128 v21 = v10;
  __n128 v22 = v11;
  __n128 v23 = v12;
  __n128 v24 = v13;
  __n128 v25 = v14;
  __n128 v26 = v15;
  uint64_t v28 = v2;
  uint64_t v29 = v3;
  uint64_t v30 = v4;
  uint64_t v31 = v5;
  uint64_t v32 = v6;
  uint64_t v33 = v7;
  ImplementationAndName = (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))_method_getImplementationAndName((unint64_t)m);
  return (id)ImplementationAndName(receiver, v18, v28, v29, v30, v31, v32, v33, v19, v20, v21, v22, v23, v24, v25, v26);
}

uintptr_t NXPtrHash(const void *info, const void *data)
{
  return (unint64_t)data ^ ((unint64_t)data >> 16);
}

int NXPtrIsEqual(const void *info, const void *data1, const void *data2)
{
  return data1 == data2;
}

uintptr_t NXStrHash(const void *info, const void *data)
{
  if (!data) {
    return 0LL;
  }
  unsigned int v2 = *(unsigned __int8 *)data;
  if (!*(_BYTE *)data) {
    return 0LL;
  }
  uintptr_t result = 0LL;
  uint64_t v4 = (unsigned __int8 *)data + 4;
  do
  {
    result ^= v2;
    if (!*(v4 - 3)) {
      break;
    }
    result ^= (unint64_t)*(v4 - 3) << 8;
    if (!*(v4 - 2)) {
      break;
    }
    result ^= (unint64_t)*(v4 - 2) << 16;
    if (!*(v4 - 1)) {
      break;
    }
    result ^= (unint64_t)*(v4 - 1) << 24;
    unsigned int v5 = *v4;
    v4 += 4;
    unsigned int v2 = v5;
  }

  while (v5);
  return result;
}

int NXStrIsEqual(const void *info, const void *data1, const void *data2)
{
  if (data1 == data2) {
    return 1;
  }
  if (!data1)
  {
    int v3 = *(unsigned __int8 *)data2;
    return v3 == 0;
  }

  int v3 = *(unsigned __int8 *)data1;
  if (!data2) {
    return v3 == 0;
  }
  return strcmp((const char *)data1, (const char *)data2) == 0;
}

uint64_t hashPtrStructKey(const void *a1, void *a2)
{
  return *a2 ^ (*a2 >> 16);
}

BOOL isEqualPtrStructKey(const void *a1, void *a2, void *a3)
{
  return *a2 == *a3;
}

void NXReallyFree(const void *info, void *data)
{
}

uintptr_t hashStrStructKey(const void *a1, const void **a2)
{
  return NXStrHash(a1, *a2);
}

uint64_t isEqualStrStructKey(const void *a1, const void **a2, const void **a3)
{
  return NXStrIsEqual(a1, *a2, *a3);
}

NXHashTable *__cdecl NXCreateHashTableFromZone( NXHashTablePrototype *prototype, unsigned int capacity, const void *info, void *zone)
{
  __int128 v4 = *(_OWORD *)&prototype->free;
  *(_OWORD *)&v6.hash = *(_OWORD *)&prototype->hash;
  *(_OWORD *)&v6.free = v4;
  return NXCreateHashTable(&v6, capacity, info);
}

NXHashTable *__cdecl NXCreateHashTable(NXHashTablePrototype *prototype, unsigned int capacity, const void *info)
{
  NXHashTablePrototype v6 = (NXHashTable *)malloc(0x20uLL);
  uint64_t v7 = (NXHashTable *)prototypes;
  if (!prototypes)
  {
    __n128 v8 = malloc(0x20uLL);
    prototypes = (uint64_t)v8;
    *__n128 v8 = &protoPrototype;
    v8[1] = 0x100000001LL;
    __n128 v9 = calloc(1uLL, 0x10uLL);
    uint64_t v7 = (NXHashTable *)prototypes;
    *(void *)(prototypes + 16) = v9;
    v7->info = 0LL;
    *(_DWORD *)__n128 v9 = 1;
    v9[1] = &protoPrototype;
  }

  if (!prototype->hash) {
    prototype->hash = NXPtrHash;
  }
  if (!prototype->isEqual) {
    prototype->isEqual = NXPtrIsEqual;
  }
  if (!prototype->free) {
    prototype->free = NXNoEffectFree;
  }
  if (prototype->style)
  {
    _objc_inform("*** NXCreateHashTable: invalid style\n");
    return 0LL;
  }

  __n128 v10 = (const NXHashTablePrototype *)NXHashGet(v7, prototype);
  if (!v10)
  {
    __n128 v11 = malloc(0x20uLL);
    __int128 v12 = *(_OWORD *)&prototype->free;
    *__n128 v11 = *(_OWORD *)&prototype->hash;
    v11[1] = v12;
    NXHashInsert((NXHashTable *)prototypes, v11);
    __n128 v10 = (const NXHashTablePrototype *)NXHashGet((NXHashTable *)prototypes, prototype);
    if (!v10)
    {
      _objc_inform("*** NXCreateHashTable: bug\n");
      return 0LL;
    }
  }

  v6->prototype = v10;
  v6->count = 0;
  v6->info = info;
  if (capacity >= 2)
  {
    char v14 = -1;
    do
    {
      ++v14;
      BOOL v15 = capacity > 3;
      capacity >>= 1;
    }

    while (v15);
    char v13 = v14 + 2;
  }

  else
  {
    char v13 = 1;
  }

  size_t v16 = ~(-1 << v13);
  v6->nbBuckets = v16;
  v6->buckets = calloc(v16, 0x10uLL);
  return v6;
}

void *__cdecl NXHashGet(NXHashTable *table, const void *data)
{
  buckets = table->buckets;
  unint64_t v5 = ((uint64_t (*)(const void *))table->prototype->hash)(table->info) % (unint64_t)table->nbBuckets;
  int v6 = buckets[4 * v5];
  if (!v6) {
    return 0LL;
  }
  if (v6 == 1)
  {
    uint64_t v7 = (char *)&buckets[4 * v5];
    __n128 v9 = (const void *)*((void *)v7 + 1);
    uint64_t i = (void **)(v7 + 8);
    if (v9 != data)
    {
      return 0LL;
    }
  }

  else
  {
    for (uint64_t i = *(void ***)&buckets[4 * v5 + 2]; *i != data; ++i)
    {
      if (!--v6) {
        return 0LL;
      }
    }
  }

  return (void *)data;
}

void *__cdecl NXHashInsert(NXHashTable *table, const void *data)
{
  buckets = table->buckets;
  unint64_t v5 = ((uint64_t (*)(const void *))table->prototype->hash)(table->info) % (unint64_t)table->nbBuckets;
  int v6 = (char *)&buckets[2 * v5];
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)v6;
  if (*(_DWORD *)v6 != 1)
  {
    if (!v8)
    {
      uintptr_t result = 0LL;
      *(_DWORD *)int v6 = 1;
      buckets[2 * v5 + 1] = data;
      ++table->count;
      return result;
    }

    __int128 v12 = (char *)&buckets[2 * v5];
    BOOL v15 = (void **)*((void *)v12 + 1);
    char v13 = (const void **)(v12 + 8);
    char v14 = v15;
    while (*v14 != data)
    {
      if (((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
      {
        uintptr_t result = *v14;
        goto LABEL_17;
      }

      ++v14;
      if (!--v8)
      {
        size_t v16 = (char *)calloc((*v7 + 2), 8uLL);
        unint64_t v17 = (const void **)(v16 + 8);
        uint64_t v18 = *v7;
        if ((_DWORD)v18) {
          memmove(v16 + 16, *v13, 8 * v18);
        }
        *unint64_t v17 = data;
        free((char *)*v13 - 8);
        ++*v7;
        *char v13 = v17;
LABEL_19:
        unsigned int nbBuckets = table->nbBuckets;
        unsigned int v22 = table->count + 1;
        table->count = v22;
        if (v22 > nbBuckets) {
          _NXHashRehashToCapacity(table, (2 * nbBuckets) | 1);
        }
        return 0LL;
      }
    }

    uintptr_t result = (void *)data;
LABEL_17:
    *char v14 = (void *)data;
    return result;
  }

  __n128 v11 = (const void *)*((void *)v6 + 1);
  __n128 v10 = (void **)(v6 + 8);
  uintptr_t result = (void *)data;
  if (v11 != data)
  {
    if (!((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
    {
      __n128 v19 = calloc(3uLL, 8uLL);
      __n128 v20 = *v10;
      v19[1] = data;
      v19[2] = v20;
      ++*v7;
      *__n128 v10 = v19 + 1;
      goto LABEL_19;
    }

    uintptr_t result = *v10;
  }

  *__n128 v10 = (void *)data;
  return result;
}

void _NXHashRehashToCapacity(NXHashTable *a1, size_t __count)
{
  unsigned int count = a1->count;
  unsigned int nbBuckets = a1->nbBuckets;
  buckets = (char *)a1->buckets;
  a1->unsigned int count = 0;
  a1->unsigned int nbBuckets = __count;
  a1->buckets = calloc(__count, 0x10uLL);
  signed int v6 = nbBuckets;
LABEL_2:
  uint64_t v7 = v6;
  uint64_t v8 = 16LL * v6 - 16;
  while (v7)
  {
    --v7;
    int v9 = *(_DWORD *)&buckets[v8];
    v8 -= 16LL;
    if (v9)
    {
      signed int v6 = v7;
      do
      {
        --v9;
        __n128 v10 = &buckets[16 * v6];
        int v12 = *(_DWORD *)v10;
        __n128 v11 = (const void **)(v10 + 8);
        if (v12 != 1) {
          __n128 v11 = (const void **)((char *)*v11 + 8 * v9);
        }
        NXHashInsert(a1, *v11);
      }

      while (v9);
      goto LABEL_2;
    }
  }

  if (nbBuckets)
  {
    char v13 = buckets;
    do
    {
      if (*(_DWORD *)v13)
      {
        if (*(_DWORD *)v13 != 1) {
          free((void *)(*((void *)v13 + 1) - 8LL));
        }
        *(_DWORD *)char v13 = 0;
        *((void *)v13 + 1) = 0LL;
      }

      v13 += 16;
      --nbBuckets;
    }

    while (nbBuckets);
  }

  if (count != a1->count) {
    _objc_inform( "*** hashtable: count differs after rehashing; probably indicates a broken invariant: there are x and y such as isE"
  }
      "qual(x, y) is TRUE but hash(x) != hash (y)\n");
  free(buckets);
}

uint64_t hashPrototype(const void *a1, int *a2)
{
  return a2[6] ^ ((*((void *)a2 + 1) ^ *(void *)a2 ^ *((void *)a2 + 2)) >> 16) ^ *(void *)a2 ^ *((void *)a2 + 1) ^ *((void *)a2 + 2);
}

BOOL isEqualPrototype(const void *a1, void *a2, void *a3)
{
  return *a2 == *a3 && a2[1] == a3[1] && a2[2] == a3[2] && *((_DWORD *)a2 + 6) == *((_DWORD *)a3 + 6);
}

void NXFreeHashTable(NXHashTable *table)
{
}

void freeBuckets(NXHashTable *a1)
{
  unsigned int nbBuckets = a1->nbBuckets;
  if (nbBuckets)
  {
    buckets = a1->buckets;
    do
    {
      if (*(_DWORD *)buckets)
      {
        int v4 = *(_DWORD *)buckets;
        uint64_t v5 = buckets[1];
        free = a1->prototype->free;
        info = a1->info;
        if (*(_DWORD *)buckets == 1)
        {
          ((void (*)(const void *, void))free)(a1->info, buckets[1]);
        }

        else
        {
          uint64_t v8 = (uint64_t *)buckets[1];
          do
          {
            --v4;
            uint64_t v9 = *v8++;
            ((void (*)(const void *, uint64_t))free)(info, v9);
          }

          while (v4);
          ::free((void *)(v5 - 8));
        }

        *(_DWORD *)buckets = 0;
        buckets[1] = 0LL;
      }

      buckets += 2;
      --nbBuckets;
    }

    while (nbBuckets);
  }

void NXEmptyHashTable(NXHashTable *table)
{
  unsigned int nbBuckets = table->nbBuckets;
  if (nbBuckets)
  {
    buckets = table->buckets;
    do
    {
      if (*(_DWORD *)buckets)
      {
        if (*(_DWORD *)buckets != 1) {
          free((void *)(buckets[1] - 8LL));
        }
        *(_DWORD *)buckets = 0;
        buckets[1] = 0LL;
      }

      buckets += 2;
      --nbBuckets;
    }

    while (nbBuckets);
  }

  table->unsigned int count = 0;
}

void NXResetHashTable(NXHashTable *table)
{
  table->unsigned int count = 0;
}

BOOL NXCompareHashTables(NXHashTable *table1, NXHashTable *table2)
{
  if (table1 == table2)
  {
    LOBYTE(v13) = 1;
  }

  else if (table1->count == table2->count)
  {
    int v4 = 0;
    signed int nbBuckets = table1->nbBuckets;
    while (1)
    {
      buckets = (char *)table1->buckets;
      if (!v4) {
        break;
      }
LABEL_9:
      --v4;
      __n128 v10 = &buckets[16 * nbBuckets];
      int v12 = *(_DWORD *)v10;
      __n128 v11 = (const void **)(v10 + 8);
      if (v12 != 1) {
        __n128 v11 = (const void **)((char *)*v11 + 8 * v4);
      }
      int v13 = NXHashMember(table2, *v11);
      if (!v13) {
        return v13;
      }
    }

    uint64_t v7 = nbBuckets;
    uint64_t v8 = &buckets[16 * nbBuckets - 16];
    while (v7)
    {
      --v7;
      int v9 = *(_DWORD *)v8;
      v8 -= 16;
      int v4 = v9;
      if (v9)
      {
        signed int nbBuckets = v7;
        goto LABEL_9;
      }
    }

    LOBYTE(v13) = 1;
  }

  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

int NXHashMember(NXHashTable *table, const void *data)
{
  buckets = table->buckets;
  unint64_t v5 = ((uint64_t (*)(const void *))table->prototype->hash)(table->info) % (unint64_t)table->nbBuckets;
  int v6 = buckets[4 * v5];
  if (v6)
  {
    uint64_t v7 = (char *)&buckets[4 * v5];
    if (v6 == 1)
    {
    }

    else
    {
      for (uint64_t i = (const void **)*((void *)v7 + 1);
            *i != data
         && !((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data);
            ++i)
      {
        if (!--v6) {
          return v6;
        }
      }
    }

    return 1;
  }

  return v6;
}

unsigned int NXCountHashTable(NXHashTable *table)
{
  return table->count;
}

NXHashState NXInitHashState(NXHashTable *table)
{
  return (NXHashState)table->nbBuckets;
}

int NXNextHashState(NXHashTable *table, NXHashState *state, void **data)
{
  buckets = (char *)table->buckets;
  int i = state->i;
  int j = state->j;
  if (j)
  {
LABEL_6:
    int v10 = j - 1;
    state->int j = v10;
    __n128 v11 = &buckets[16 * i];
    int v13 = *(_DWORD *)v11;
    int v12 = (void **)(v11 + 8);
    if (v13 != 1) {
      int v12 = (void **)((char *)*v12 + 8 * v10);
    }
    *data = *v12;
    return 1;
  }

  else
  {
    uint64_t v6 = i;
    uint64_t v7 = (int *)&buckets[16 * i - 16];
    while (v6)
    {
      int v8 = v6 - 1;
      int v9 = *v7;
      v7 -= 4;
      int j = v9;
      state->int i = v6 - 1;
      state->int j = v9;
      --v6;
      if (v9)
      {
        int i = v8;
        goto LABEL_6;
      }
    }

    return 0;
  }

NXHashTable *__cdecl NXCopyHashTable(NXHashTable *table)
{
  size_t nbBuckets = table->nbBuckets;
  int v3 = (NXHashTable *)malloc(0x20uLL);
  v3->prototype = table->prototype;
  v3->info = table->info;
  v3->unsigned int count = 0;
  v3->size_t nbBuckets = nbBuckets;
  int v4 = 0;
  v3->buckets = calloc(nbBuckets, 0x10uLL);
  while (1)
  {
    buckets = (char *)table->buckets;
    if (!v4) {
      break;
    }
LABEL_7:
    --v4;
    int v9 = &buckets[16 * (int)nbBuckets];
    int v11 = *(_DWORD *)v9;
    int v10 = (const void **)(v9 + 8);
    if (v11 != 1) {
      int v10 = (const void **)((char *)*v10 + 8 * v4);
    }
    NXHashInsert(v3, *v10);
  }

  uint64_t v6 = (int)nbBuckets;
  uint64_t v7 = &buckets[16 * (int)nbBuckets - 16];
  while (v6)
  {
    --v6;
    int v8 = *(_DWORD *)v7;
    v7 -= 16;
    int v4 = v8;
    if (v8)
    {
      LODWORD(nbBuckets) = v6;
      goto LABEL_7;
    }
  }

  return v3;
}

void *__cdecl NXHashInsertIfAbsent(NXHashTable *table, const void *data)
{
  buckets = table->buckets;
  unint64_t v5 = ((uint64_t (*)(const void *))table->prototype->hash)(table->info) % (unint64_t)table->nbBuckets;
  uint64_t v6 = (char *)&buckets[2 * v5];
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)v6;
  if (*(_DWORD *)v6 == 1)
  {
    int v10 = (const void *)*((void *)v6 + 1);
    int v9 = (void **)(v6 + 8);
    if (v10 != data)
    {
      if (((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
      {
        return *v9;
      }

      else
      {
        uint64_t v18 = calloc(3uLL, 8uLL);
        __n128 v19 = *v9;
        v18[1] = data;
        v18[2] = v19;
        ++*v7;
        *int v9 = v18 + 1;
LABEL_16:
        unsigned int nbBuckets = table->nbBuckets;
        unsigned int v21 = table->count + 1;
        table->unsigned int count = v21;
        if (v21 > nbBuckets) {
          _NXHashRehashToCapacity(table, (2 * nbBuckets) | 1);
        }
      }
    }
  }

  else if (v8)
  {
    int v11 = (char *)&buckets[2 * v5];
    char v14 = (void **)*((void *)v11 + 1);
    int v12 = (const void **)(v11 + 8);
    int v13 = v14;
    while (*v13 != data)
    {
      ++v13;
      if (!--v8)
      {
        BOOL v15 = (char *)calloc((*v7 + 2), 8uLL);
        size_t v16 = (const void **)(v15 + 8);
        uint64_t v17 = *v7;
        if ((_DWORD)v17) {
          memmove(v15 + 16, *v12, 8 * v17);
        }
        *size_t v16 = data;
        free((char *)*v12 - 8);
        ++*v7;
        *int v12 = v16;
        goto LABEL_16;
      }
    }
  }

  else
  {
    *(_DWORD *)uint64_t v6 = 1;
    buckets[2 * v5 + 1] = data;
    ++table->count;
  }

  return (void *)data;
}

void *__cdecl NXHashRemove(NXHashTable *table, const void *data)
{
  buckets = (char *)table->buckets;
  unint64_t v5 = ((uint64_t (*)(const void *))table->prototype->hash)(table->info) % (unint64_t)table->nbBuckets;
  uint64_t v6 = (int *)&buckets[16 * v5];
  int v7 = *v6;
  if (!*v6) {
    return 0LL;
  }
  if (v7 == 1)
  {
    int v8 = &buckets[16 * v5];
    int v10 = (const void *)*((void *)v8 + 1);
    int v9 = (const void **)(v8 + 8);
    if (v10 == data)
    {
      int v11 = 0;
      goto LABEL_16;
    }

    if (((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
    {
      data = *v9;
      int v11 = *v6 - 1;
LABEL_16:
      --table->count;
      *uint64_t v6 = v11;
      *int v9 = 0LL;
      return (void *)data;
    }

    return 0LL;
  }

  int v12 = &buckets[16 * v5];
  BOOL v15 = (const void **)*((void *)v12 + 1);
  char v14 = (const void **)(v12 + 8);
  int v13 = v15;
  if (v7 == 2)
  {
    if (*v13 == data
      || ((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
    {
      size_t v16 = v13 + 1;
      uint64_t v17 = v13;
      goto LABEL_10;
    }

    uint64_t v17 = v13 + 1;
    if (v13[1] == data)
    {
      size_t v16 = v13;
      goto LABEL_10;
    }

    int v25 = ((uint64_t (*)(const void *, const void *))table->prototype->isEqual)(table->info, data);
    size_t v16 = v13;
    if (v25)
    {
LABEL_10:
      *char v14 = *v16;
      data = *v17;
      free(v13 - 1);
      --table->count;
      --*v6;
      return (void *)data;
    }

    return 0LL;
  }

  while (1)
  {
    int v18 = v7 - 1;
    if (*v13 == data) {
      break;
    }
    if (((unsigned int (*)(const void *, const void *))table->prototype->isEqual)(table->info, data))
    {
      data = *v13;
      break;
    }

    ++v13;
    --v7;
    if (!v18) {
      return 0LL;
    }
  }

  size_t v19 = *v6;
  if ((_DWORD)v19 == 1)
  {
    __n128 v20 = 0LL;
    int v21 = 1;
  }

  else
  {
    __n128 v20 = (char *)calloc(v19, 8uLL) + 8;
    int v21 = *v6;
  }

  unsigned int v22 = (char *)*v14;
  unsigned int v23 = v21 - v7;
  if (v23)
  {
    memmove(v20, v22, 8LL * v23);
    unsigned int v22 = (char *)*v14;
  }

  if (v7 != 1)
  {
    memmove(&v20[8 * *v6 - 8 + -8 * (v7 - 1)], &v22[8 * *v6 + -8 * (v7 - 1)], 8LL * (v7 - 1));
    unsigned int v22 = (char *)*v14;
  }

  free(v22 - 8);
  --table->count;
  --*v6;
  *char v14 = v20;
  return (void *)data;
}

unint64_t _mapPtrHash(uint64_t a1, unint64_t a2)
{
  return a2 >> 3;
}

BOOL _mapPtrIsEqual(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

uint64_t _mapStrHash(uint64_t a1, _BYTE *a2)
{
  if (a2 && (int v2 = *a2, *a2))
  {
    unsigned int v3 = 0;
    int v4 = a2 + 4;
    do
    {
      v3 ^= v2;
      if (!*(v4 - 3)) {
        break;
      }
      v3 ^= *(v4 - 3) << 8;
      if (!*(v4 - 2)) {
        break;
      }
      v3 ^= *(v4 - 2) << 16;
      if (!*(v4 - 1)) {
        break;
      }
      v3 ^= *(v4 - 1) << 24;
      int v5 = *v4;
      v4 += 4;
      int v2 = v5;
    }

    while (v5);
  }

  else
  {
    unsigned int v3 = 0;
  }

  return v3 + 65521 * ((unsigned __int16)v3 ^ HIWORD(v3));
}

BOOL _mapStrIsEqual(int a1, char *__s1, char *__s2)
{
  if (__s1 == __s2) {
    return 1LL;
  }
  if (!__s1)
  {
    int v3 = *__s2;
    return v3 == 0;
  }

  int v3 = *__s1;
  if (!__s2) {
    return v3 == 0;
  }
  return strcmp(__s1, __s2) == 0;
}

_DWORD *NXCreateMapTable(_OWORD *a1, unsigned int a2)
{
  int v4 = malloc(0x18uLL);
  int v5 = (NXHashTable *)prototypes;
  if (!prototypes)
  {
    NXHashTablePrototype v15 = *(NXHashTablePrototype *)protoPrototype;
    int v5 = NXCreateHashTable(&v15, 0, 0LL);
    prototypes = (uint64_t)v5;
  }

  if (*(void *)a1 && *((void *)a1 + 1) && *((void *)a1 + 2) && !*((_DWORD *)a1 + 6))
  {
    uint64_t v6 = NXHashGet(v5, a1);
    if (!v6)
    {
      uint64_t v6 = malloc(0x20uLL);
      __int128 v7 = a1[1];
      *uint64_t v6 = *a1;
      v6[1] = v7;
      NXHashInsert((NXHashTable *)prototypes, v6);
    }

    *(void *)int v4 = v6;
    v4[2] = 0;
    char v8 = 1;
    if (a2 >= 2)
    {
      char v9 = -1;
      do
      {
        ++v9;
        BOOL v10 = a2 > 3;
        a2 >>= 1;
      }

      while (v10);
      char v8 = v9 + 2;
    }

    int v11 = 1 << v8;
    v4[3] = (1 << v8) - 1;
    int v12 = (char *)malloc(16LL * ((1 << v8) + 1));
    int v13 = v12 + 16;
    do
    {
      *int v13 = -1LL;
      v13[1] = 0LL;
      v13 += 2;
      --v11;
    }

    while (v11);
    *((void *)v4 + 2) = v12 + 16;
  }

  else
  {
    _objc_inform("*** NXCreateMapTable: invalid creation parameters\n");
    return 0LL;
  }

  return v4;
}

uint64_t hashPrototype(uint64_t a1, uint64_t a2)
{
  return *(void *)a2 ^ *(void *)(a2 + 8) ^ *(int *)(a2 + 24) ^ ((*(void *)a2 ^ *(void *)(a2 + 8) ^ *(void *)(a2 + 16)) >> 16) ^ *(void *)(a2 + 16);
}

BOOL isEqualPrototype(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)a2 == *(void *)a3
      && *(void *)(a2 + 8) == *(void *)(a3 + 8)
      && *(void *)(a2 + 16) == *(void *)(a3 + 16)
      && *(_DWORD *)(a2 + 24) == *(_DWORD *)(a3 + 24);
}

_DWORD *NXCreateMapTableFromZone(_OWORD *a1, unsigned int a2)
{
  __int128 v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  return NXCreateMapTable(v4, a2);
}

void NXFreeMapTable(void *a1)
{
}

uint64_t NXResetMapTable(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 12);
  if (v2 != -1)
  {
    int v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)result + 16LL);
    int v4 = v2 + 1;
    int v5 = (void *)(*(void *)(result + 16) + 8LL);
    do
    {
      uint64_t v6 = *(v5 - 1);
      if (v6 != -1)
      {
        uintptr_t result = v3(v1, v6, *v5);
        *(v5 - 1) = -1LL;
        *int v5 = 0LL;
      }

      v5 += 2;
      --v4;
    }

    while (v4);
  }

  *(_DWORD *)(v1 + 8) = 0;
  return result;
}

uint64_t NXCompareMapTables(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
    return 0LL;
  }
  int v4 = *(_DWORD *)(a1 + 12) + 1;
LABEL_4:
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t *)(*(void *)(a1 + 16) + 16LL * v4 - 16);
  while (1)
  {
    BOOL v7 = v5 == 0;
    if (!v5) {
      return v7;
    }
    --v5;
    uint64_t v9 = *v6;
    v6 -= 2;
    uint64_t v8 = v9;
    if (v9 != -1)
    {
      unsigned int v10 = (**(uint64_t (***)(uint64_t, uint64_t))a2)(a2, v8);
      uint64_t v11 = _NXMapMemberWithHash(a2, v8, v10, &v13);
      int v4 = v5;
      if (v11 != -1) {
        goto LABEL_4;
      }
      return v7;
    }
  }

uint64_t _NXMapMemberWithHash(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(_DWORD *)(a1 + 12) & a3;
  BOOL v7 = (uint64_t *)(v5 + 16LL * v6);
  uint64_t v8 = *v7;
  if (*v7 != -1)
  {
    if (v8 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v8, a2))
    {
LABEL_10:
      *a4 = *(void *)(v5 + 16 * v6 + 8);
      return *v7;
    }

    LODWORD(v11) = v6;
    while (1)
    {
      uint64_t v11 = *(_DWORD *)(a1 + 12) & (v11 + 1);
      if ((_DWORD)v11 == (_DWORD)v6) {
        break;
      }
      uint64_t v12 = *(void *)(v5 + 16LL * v11);
      if (v12 == -1) {
        break;
      }
      if (v12 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v12, a2))
      {
        BOOL v7 = (uint64_t *)(v5 + 16 * v11);
        uint64_t v6 = v11;
        goto LABEL_10;
      }
    }
  }

  return -1LL;
}

uint64_t NXInitMapState(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) + 1);
}

uint64_t NXNextMapState(uint64_t a1, int *a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *a2;
  uint64_t v6 = (uint64_t *)(v4 + 16 * v5 - 16);
  while (v5)
  {
    --v5;
    uint64_t v8 = *v6;
    v6 -= 2;
    uint64_t v7 = v8;
    if (v8 != -1)
    {
      *a2 = v5;
      *a3 = v7;
      *a4 = *(void *)(v4 + 16 * v5 + 8);
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  *a2 = -1;
  return result;
}

uint64_t NXMapMember(uint64_t (***a1)(void), uint64_t a2, void *a3)
{
  unsigned int v6 = (**a1)(a1);
  return _NXMapMemberWithHash((uint64_t)a1, a2, v6, a3);
}

uint64_t NXCountMapTable(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t NXMapGet(uint64_t (***a1)(void), uint64_t a2)
{
  unsigned int v4 = (**a1)(a1);
  else {
    return v6;
  }
}

uint64_t NXMapGetWithHash(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (_NXMapMemberWithHash(a1, a2, a3, &v4) == -1) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t NXMapInsert(uint64_t (***a1)(void), uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (**a1)(a1);
  return NXMapInsertWithHash((uint64_t)a1, a2, v6, a3);
}

uint64_t NXMapInsertWithHash(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  if (a2 == -1)
  {
    _objc_inform("*** NXMapInsert: invalid key: -1\n");
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 16);
    int v9 = *(_DWORD *)(a1 + 12);
    uint64_t v10 = v9 & a3;
    uint64_t v11 = (uint64_t *)(v8 + 16LL * v10);
    int v12 = v9 + 1;
    uint64_t v13 = *v11;
    if (*v11 == -1)
    {
LABEL_8:
      *uint64_t v11 = a2;
      NXHashTablePrototype v15 = (void *)(v8 + 16 * v10);
LABEL_9:
      v15[1] = a4;
      int v16 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v16;
    }

    else
    {
      while (1)
      {
        if (v13 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v13, a2))
        {
          uint64_t v17 = v8 + 16 * v10;
LABEL_19:
          uint64_t v22 = *(void *)(v17 + 8);
          __n128 v20 = (void *)(v17 + 8);
          uint64_t v21 = v22;
          if (v22 != a4)
          {
            void *v20 = a4;
            return v21;
          }

          return a4;
        }

        if (*(_DWORD *)(a1 + 8) != v12) {
          break;
        }
        _NXMapRehash(a1);
        uint64_t v8 = *(void *)(a1 + 16);
        int v14 = *(_DWORD *)(a1 + 12);
        uint64_t v10 = v14 & a3;
        int v12 = v14 + 1;
        uint64_t v13 = *(void *)(v8 + 16 * v10);
        if (v13 == -1)
        {
          uint64_t v11 = (uint64_t *)(v8 + 16 * v10);
          goto LABEL_8;
        }
      }

      LODWORD(v18) = v10;
      while (1)
      {
        uint64_t v18 = *(_DWORD *)(a1 + 12) & (v18 + 1);
        if ((_DWORD)v18 == (_DWORD)v10) {
          break;
        }
        uint64_t v19 = *(void *)(v8 + 16LL * v18);
        if (v19 == -1)
        {
          NXHashTablePrototype v15 = (void *)(v8 + 16 * v18);
          *NXHashTablePrototype v15 = a2;
          goto LABEL_9;
        }

        if (v19 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v19, a2))
        {
          uint64_t v17 = v8 + 16 * v18;
          goto LABEL_19;
        }
      }

      _objc_inform("**** NXMapInsert: bug\n");
    }
  }

  return 0LL;
}

void _NXMapRehash(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = *(_DWORD *)(a1 + 12) + 1;
  uint64_t v5 = (2 * v4);
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v5 - 1;
  unsigned int v6 = (char *)malloc(16LL * ((2 * v4) | 1u));
  if ((_DWORD)v5)
  {
    uint64_t v7 = v6 + 16;
    do
    {
      *uint64_t v7 = xmmword_180050850;
      v7[1] = xmmword_180050850;
      v7 += 2;
      v5 -= 2LL;
    }

    while (v5);
  }

  *(void *)(a1 + 16) = v6 + 16;
  if (v4)
  {
    uint64_t v8 = (uint64_t *)(v2 + 8);
    do
    {
      uint64_t v9 = *(v8 - 1);
      if (v9 != -1)
      {
        uint64_t v10 = *v8;
        uint64_t v11 = (**(uint64_t (***)(uint64_t, void))a1)(a1, *(v8 - 1));
        NXMapInsertWithHash(a1, v9, v11, v10);
      }

      v8 += 2;
      --v4;
    }

    while (v4);
    int v12 = *(_DWORD *)(a1 + 8);
  }

  else
  {
    int v12 = 0;
  }

  if (v3 != v12) {
    _objc_inform( "*** maptable: count differs after rehashing; probably indicates a broken invariant: there are x and y such as isEq"
  }
      "ual(x, y) is TRUE but hash(x) != hash (y)\n");
  free((void *)(v2 - 16));
}

uint64_t NXMapRemove(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(_DWORD *)(a1 + 12) & (**(unsigned int (***)(uint64_t))a1)(a1);
  uint64_t v6 = *(void *)(v4 + 16 * v5);
  if (v6 == -1) {
    return 0LL;
  }
  if (v6 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v6, a2))
  {
    uint64_t v7 = *(void *)(v4 + 16 * v5 + 8);
    int v8 = 1;
  }

  else
  {
    int v8 = 0;
    uint64_t v7 = 0LL;
  }

  unsigned int v9 = *(_DWORD *)(a1 + 12) & (v5 + 1);
  unsigned int v10 = 1;
  while (v9 != (_DWORD)v5)
  {
    uint64_t v11 = *(void *)(v4 + 16LL * v9);
    if (v11 == -1) {
      break;
    }
    uint64_t v12 = v9;
    if (v11 == a2 || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 8LL))(a1, v11, a2))
    {
      ++v8;
      uint64_t v7 = *(void *)(v4 + 16 * v12 + 8);
    }

    ++v10;
    unsigned int v9 = *(_DWORD *)(a1 + 12) & (v12 + 1);
  }

  if (!v8) {
    return 0LL;
  }
  if (v8 != 1) {
    _objc_inform("**** NXMapRemove: incorrect table\n");
  }
  if (v10 < 0x11)
  {
    uint64_t v13 = &v24;
    if (!v10)
    {
      int v15 = 0;
      goto LABEL_26;
    }
  }

  else
  {
    uint64_t v13 = (char *)malloc(16LL * (v10 - 1));
  }

  int v15 = 0;
  unsigned int v16 = v10;
  do
  {
    uint64_t v17 = (void *)(v4 + 16LL * v5);
    *uint64_t v17 = -1LL;
    *(void *)(v4 + 16LL * v5 + 8) = 0LL;
    LODWORD(v5) = *(_DWORD *)(a1 + 12) & (v5 + 1);
    --v16;
  }

  while (v16);
LABEL_26:
  *(_DWORD *)(a1 + 8) -= v10;
  if (v15 == v10 - 1)
  {
    if (!v15) {
      goto LABEL_30;
    }
  }

  else
  {
    _objc_inform("**** NXMapRemove: bug\n");
    if (!v15) {
      goto LABEL_30;
    }
  }

  unsigned int v18 = v15 - 1;
  do
  {
    uint64_t v19 = v18;
    __n128 v20 = (uint64_t *)&v13[16 * v18];
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unsigned int v23 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(a1, *v20);
    NXMapInsertWithHash(a1, v21, v23, v22);
    --v18;
  }

  while (v19);
LABEL_30:
  if (v10 >= 0x11) {
    free(v13);
  }
  return v7;
}

uint64_t NXMapKeyCopyingInsert(uint64_t (***a1)(void), const char *a2, uint64_t a3)
{
  unsigned int v6 = (**a1)(a1);
  uint64_t v7 = (void *)_NXMapMemberWithHash((uint64_t)a1, (uint64_t)a2, v6, &v11);
  if (v7 == (void *)-1LL)
  {
    size_t v8 = strlen(a2) + 1;
    if ((_dyld_is_memory_immutable() & 1) != 0)
    {
      uint64_t v7 = (void *)a2;
    }

    else
    {
      uint64_t v7 = malloc(v8);
      memcpy(v7, a2, v8);
    }
  }

  unsigned int v9 = ((uint64_t (*)(uint64_t (***)(void), void *))**a1)(a1, v7);
  return NXMapInsertWithHash((uint64_t)a1, (uint64_t)v7, v9, a3);
}

void cache_t::maybeConvertToPreoptimized(cache_t *this)
{
  uint64_t v1 = *(void *)this & 0xFFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 < 0)
  {
    if (*((_DWORD *)this + 2))
    {
      __break(1u);
    }

    else
    {
      int v4 = *(_DWORD *)(*((void *)this + 2) & 0xF00007FFFFFFFF8LL);
      if ((v4 & 2) != 0 || (v4 & 4) != 0 && (v2 & 0x40000000) != 0)
      {
        if (PrintCaches)
        {
          unsigned int v6 = (objc_class *)((char *)this - 16);
          if ((*((_WORD *)this + 7) & 4) != 0) {
            uint64_t v7 = "meta";
          }
          else {
            uint64_t v7 = "";
          }
          size_t v8 = (const char *)objc_class::nameForLogging(v6);
          _objc_inform("CACHES: %sclass %s: dropping cache (from %s)", v7, v8, "setInitialized");
        }

        __int16 v5 = 0;
        atomic_store((unint64_t)&_objc_empty_cache & 0xFFFFFFFFFFFLL, (unint64_t *)this);
      }

      else
      {
        *(void *)this = ((v1 | (v2 << 48)) + 16) | 1;
        __int16 v5 = *(_WORD *)(v1 + 10) & 0x3FFF;
      }

      *((_WORD *)this + 6) = v5;
    }
  }

BOOL cache_t::shouldFlush(BOOL this, objc_selector *a2, void (*a3)(void))
{
  if ((*(void *)this & 1) == 0 && (uint64_t v3 = *(void *)((*(void *)this & 0xFFFFFFFFFFFLL) + 8), v3 < 0))
  {
    if (*(_DWORD *)(this + 8))
    {
      __break(1u);
      return this;
    }

    unint64_t v5 = *(void *)((*(void *)this & 0xFFFFFFFFFFFLL)
                   + 8LL
    if (a2 - (objc_selector *)&unk_18E7BB5A8 != v5 >> 38) {
      return 0LL;
    }
    return this - ((uint64_t)(v5 << 26) >> 24) - 16 == (void)a3;
  }

  else
  {
    return cache_getImp(this - 16, (unint64_t)a2, 0LL) == (void)a3;
  }

uint64_t cache_t::allocateBuckets(cache_t *this)
{
  if (PrintCaches)
  {
    if (this >= 2)
    {
      unsigned int v2 = -1;
      unsigned int v3 = this;
      do
      {
        unsigned int v4 = v2++;
        BOOL v5 = v3 > 3;
        v3 >>= 1;
      }

      while (v5);
      if (v2 > 0xE) {
        goto LABEL_9;
      }
      unsigned int v1 = v4 + 2;
    }

    else
    {
      unsigned int v1 = 0;
    }

    ++cache_counts[v1];
LABEL_9:
    ++cache_allocations;
  }

  return malloc_zone_malloc_with_options_np();
}

BOOL cache_t::isConstantEmptyCache(cache_t *this)
{
  if (*((_WORD *)this + 6)) {
    return 0LL;
  }
  unint64_t v2 = (unint64_t)&_objc_empty_cache & 0xFFFFFFFFFFFLL;
  if (HIWORD(*(void *)this))
  {
    uint64_t v3 = HIWORD(*(void *)this);
    if (v3 >= 0x401)
    {
      unsigned int v4 = 0;
      unsigned int v5 = v3 + 1;
      do
      {
        ++v4;
        BOOL v6 = v5 > 3;
        v5 >>= 1;
      }

      while (v6);
      else {
        unint64_t v2 = *(void *)(cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsList + 8LL * v4);
      }
    }
  }

  return v2 == (*(void *)this & 0xFFFFFFFFFFFLL);
}

void cache_t::insert(objc_class *this, objc_selector *a2, unint64_t a3, objc_object *a4)
{
  size_t v8 = this - 2;
  int v9 = *(_DWORD *)((uint64_t)this[2].isa & 0xF00007FFFFFFFF8LL);
  if ((v9 & 1) == 0) {
    int v9 = *(_DWORD *)(*(void *)(((uint64_t)v8->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v9 & 0x20000000) != 0)
  {
    if (((uint64_t)this->isa & 1) != 0
      || ((objc_cache *)this->isa != &_objc_empty_cache ? (BOOL v10 = (unint64_t)this->isa >> 48 == 0) : (BOOL v10 = 0), v10))
    {
      unint64_t v22 = objc_class::nameForLogging(this - 2);
      _objc_fatal("cache_t::insert() called with a preoptimized cache for %s", v23, v24, v25, v22);
    }

    unsigned int v11 = WORD2(this[1].isa);
    else {
      LODWORD(v12) = 0;
    }
    if (cache_t::isConstantEmptyCache((cache_t *)this))
    {
      if ((_DWORD)v12) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = 2LL;
      }
      atomic_store( cache_t::allocateBuckets((cache_t *)v12) | ((unint64_t)(v12 - 1) << 48),  (unint64_t *)this);
      WORD2(this[1].isa) = 0;
    }

    else if (v11 >= (7 * v12) >> 3 && (v12 > 8 || v12 <= v11))
    {
      unsigned int v19 = 2 * v12;
      if ((_DWORD)v12) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 2LL;
      }
      uint64_t v21 = (uint64_t)this->isa & 0xFFFFFFFFFFFLL;
      atomic_store( cache_t::allocateBuckets((cache_t *)v20) | ((unint64_t)(v20 - 1) << 48),  (unint64_t *)this);
      WORD2(this[1].isa) = 0;
      cache_t::collect_free(v21, v12);
      LODWORD(v12) = v20;
    }

    uint64_t v13 = (uint64_t)this->isa & 0xFFFFFFFFFFFLL;
    unsigned int v14 = (v12 - 1) & (((unint64_t)a2 >> 7) ^ a2);
    while (1)
    {
      uint64_t v15 = v14;
      uint64_t v16 = v13 + 16LL * v14;
      if (!*(void *)(v16 + 8)) {
        break;
      }
      if (*(objc_selector **)(v16 + 8) == a2) {
        return;
      }
      unsigned int v14 = v15 - 1;
      if (!(_DWORD)v15) {
        unsigned int v14 = v12 - 1;
      }
    }

    uint64_t v17 = (unint64_t *)(v13 + 16 * v15);
    ++WORD2(this[1].isa);
    unint64_t v18 = (unint64_t)v8 ^ a3;
    if (!a3) {
      unint64_t v18 = 0LL;
    }
    *uint64_t v17 = v18;
    v17[1] = (unint64_t)a2;
  }

void cache_t::collect_free(uint64_t a1, unsigned int a2)
{
  if (PrintCaches)
  {
    if (a2 < 2)
    {
      unsigned int v4 = 0;
LABEL_8:
      --cache_counts[v4];
      goto LABEL_9;
    }

    unsigned int v5 = -1;
    unsigned int v6 = a2;
    do
    {
      unsigned int v7 = v5++;
      BOOL v8 = v6 > 3;
      v6 >>= 1;
    }

    while (v8);
    if (v5 <= 0xE)
    {
      unsigned int v4 = v7 + 2;
      goto LABEL_8;
    }
  }

LABEL_9:
  if ((_garbage_make_room(void)::first & 1) == 0)
  {
    _garbage_make_room(void)::first = 1;
    BOOL v10 = malloc(0x400uLL);
    garbage_refs = (uint64_t)v10;
    uint64_t v9 = garbage_count;
    uint64_t v11 = 128LL;
    goto LABEL_13;
  }

  uint64_t v9 = garbage_count;
  BOOL v10 = (void *)garbage_refs;
  if (garbage_count == garbage_max)
  {
    BOOL v10 = realloc((void *)garbage_refs, 16 * garbage_count);
    garbage_refs = (uint64_t)v10;
    uint64_t v11 = 2 * v9;
LABEL_13:
    garbage_max = v11;
  }

  garbage_byte_size += 16LL * a2;
  garbage_unsigned int count = v9 + 1;
  v10[v9] = a1;
  cache_t::collectNolock(0LL);
}

  BOOL v8 = v229;
  v228 = (header_info **)v229;
  uint64_t v9 = &OBJC_CLASS___Object;
  prog_image_header = _dyld_get_prog_image_header();
  if (v8)
  {
    unsigned int v14 = (const mach_header_64 *)prog_image_header;
    uint64_t v15 = 0;
    v225 = 0LL;
    v237 = 0LL;
    uint64_t v16 = 0;
    v231 = *(void *)algn_18C43FCB8;
    v232 = dataSegmentsRanges;
    uint64_t v17 = v228;
    v226 = prog_image_header;
    while (1)
    {
      uint64_t v17 = (header_info **)((char *)v17 - 1);
      v239 = v17;
      unint64_t v18 = v230 + 32LL * v17;
      unsigned int v19 = *(const mach_header_64 **)v18;
      uint64_t v20 = *(void *)(v18 + 16);
      if (headerInfoROs)
      {
        uint64_t v21 = *(_DWORD *)headerInfoROs;
        if ((*(_DWORD *)headerInfoROs & 0x80000000) == 0) {
          break;
        }
      }

void cache_t::collectNolock(cache_t *this)
{
  else {
    BOOL v1 = (_DWORD)this == 0;
  }
  if (v1) {
    return;
  }
  if ((_DWORD)this)
  {
LABEL_11:
    if (PrintCaches) {
      _objc_inform( "CACHES: COLLECTING %zu bytes (%zu allocations, %zu collections)",  garbage_byte_size,  cache_allocations,  ++cache_collections);
    }
    uint64_t v2 = garbage_count;
    if (DebugScribbleCaches)
    {
      if (!garbage_count)
      {
LABEL_23:
        garbage_unsigned int count = 0LL;
        garbage_byte_size = 0LL;
        if (PrintCaches)
        {
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t v11 = 0LL;
          do
          {
            uint64_t v12 = (int)cache_counts[v9];
            if ((_DWORD)v12)
            {
              _objc_inform("CACHES: %4d slots: %4d caches, %6zu bytes", 1 << v9, v12, 16LL * (int)((_DWORD)v12 << v9));
              v11 += v12;
              v10 += 16LL * (int)((_DWORD)v12 << v9);
            }

            ++v9;
          }

          while (v9 != 16);
          _objc_inform("CACHES:      total: %4zu caches, %6zu bytes", v11, v10);
        }

        return;
      }

      do
      {
        --v2;
        uint64_t v3 = *(const void **)(garbage_refs + 8 * v2);
        size_t v4 = malloc_size(v3);
        if (v4 >= 0x10)
        {
          size_t v5 = v4 >> 4;
          unsigned int v6 = v3;
          do
          {
            *unsigned int v6 = v3;
            v6 += 2;
            --v5;
          }

          while (v5);
        }
      }

      while (v2);
      uint64_t v2 = garbage_count;
    }

    if (v2)
    {
      uint64_t v7 = garbage_refs - 8;
      do
      {
        BOOL v8 = *(void **)(v7 + 8 * v2);
        *(void *)(v7 + 8 * v2) = 0LL;
        free(v8);
        --v2;
      }

      while (v2);
    }

    goto LABEL_23;
  }

uint64_t _collecting_in_critical(void)
{
  if ((shouldUseRestartableRanges & 1) != 0)
  {
    mach_port_t v0 = pthread_mach_thread_np(*(pthread_t *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)));
    BOOL v1 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    uint64_t v2 = task_threads(*MEMORY[0x1895FBBE0], &act_list, &act_listCnt);
    if ((_DWORD)v2) {
      _objc_fatal("task_threads failed (result 0x%x)\n", v3, v4, v5, v2);
    }
    if (act_listCnt)
    {
      uint64_t v6 = 0LL;
      while (1)
      {
        thread_act_t v7 = act_list[v6];
        if (v7 != v0)
        {
          mach_msg_type_number_t old_stateCnt = 68;
          if (thread_get_state(v7, 6, old_state, &old_stateCnt)) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v27 == 1;
          }
          if (v8) {
            goto LABEL_21;
          }
          unint64_t v9 = objc_restartableRanges;
          if (objc_restartableRanges) {
            break;
          }
        }

LABEL_16:
        if (++v6 >= (unint64_t)act_listCnt)
        {
          uint64_t v14 = 0LL;
          if (!act_listCnt) {
            goto LABEL_26;
          }
          goto LABEL_22;
        }
      }

      uint64_t v10 = &qword_18C43E0C0;
      while (1)
      {
        BOOL v11 = v27 >= v9;
        unint64_t v12 = v27 - v9;
        unint64_t v13 = *v10;
        v10 += 2;
        unint64_t v9 = v13;
        if (!v13) {
          goto LABEL_16;
        }
      }

  unint64_t v13 = result[4].isa;
  if (isa_high >= 0) {
    uint64_t v14 = (v13 & 4 | ((isa_high & 0x4000) == 0)) ^ 4 | 0x10;
  }
  else {
    uint64_t v14 = (v13 & 4 | ((isa_high & 0x4000) == 0)) ^ 4;
  }
  if ((HIWORD(this[3].isa) & 0x4000) == 0) {
    v14 &= 0xFFFFFFFC;
  }
  else {
    uint64_t v15 = v14 & 0xFFFFFFF3;
  }
  if (SHIWORD(this[3].isa) >= 0) {
    uint64_t v16 = v15 & 0xFFFFFFEF;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16)
  {
    uint64_t result = (objc_class *)objc::Scanner::propagateCustomFlags((uint64_t)this, v16, 1);
    unint64_t v13 = *(Class *)(v3 + 32);
  }

  uint64_t v17 = *(_DWORD *)((unint64_t)v13 & 0xF00007FFFFFFFF8LL);
  if ((v17 & 2) != 0)
  {
    uint64_t result = objc_class::setDisallowPreoptCachesRecursively(this, "addSubclass");
  }

  else if ((v17 & 4) != 0 && (*(_BYTE *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) & 4) == 0)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3321888768LL;
    v18[2] = ___ZN10objc_class39setDisallowPreoptInlinedSelsRecursivelyEPKc_block_invoke;
    v18[3] = &__block_descriptor_48_e8_32c69_ZTSKZN10objc_class39setDisallowPreoptInlinedSelsRecursivelyEPKcE3__0_e8_B16__0_8l;
    v18[4] = this;
    v18[5] = "addSubclass";
    uint64_t result = (objc_class *)foreach_realized_class_and_subclass((uint64_t)this, (uint64_t)v18);
  }

  if ((*(_WORD *)(v3 + 30) & 0x2000) != 0)
  {
    if (*(void *)(v3 + 8)) {
      return objc_class::setInstancesRequireRawIsaRecursively(this, 1);
    }
  }

  return result;
}

  uint64_t v15 = *(void *)(v5 + 32);
  if ((v15 & 1) != 0 && (*(_BYTE *)(v5 + 40) & 1) == 0) {
    *(void *)(v5 + 32) = v15 & 0xFFFFFFFFFFFFFFFCLL | 2;
  }
  if (v9)
  {
    uint64_t v16 = future_named_class_map;
    if (future_named_class_map)
    {
      uint64_t v17 = (**(uint64_t (***)(uint64_t, char *))future_named_class_map)(future_named_class_map, v9);
      unint64_t v18 = _NXMapMemberWithHash(v16, (uint64_t)v9, v17, &v53);
      if (v18 != -1)
      {
        unsigned int v19 = (char *)v18;
        uint64_t v14 = NXMapRemove(v16, v18);
        strlen(v19);
        if ((_dyld_is_memory_immutable() & 1) == 0) {
          free(v19);
        }
        if (v14)
        {
          if (!*(_DWORD *)(future_named_class_map + 8))
          {
            NXFreeMapTable((void *)future_named_class_map);
            future_named_class_map = 0LL;
          }

          char v24 = (unint64_t *)(v14 + 32);
          uint64_t v23 = *(void *)(v14 + 32);
          if ((v23 & 3) != 0)
          {
            v49 = objc_class::nameForLogging((objc_class *)v5);
            _objc_fatal( "Can't complete future class request for '%s' because the real class is too big.",  v50,  v51,  v52,  v49);
          }

          uint64_t v25 = v23 & 0xF00007FFFFFFFF8LL;
          __n128 v26 = *(void *)(v25 + 8);
          unint64_t v27 = (void *)(v26 & 0xFFFFFFFFFFFFFFFELL);
          if ((v26 & 1) != 0) {
            unint64_t v27 = (void *)*v27;
          }
          *(void *)(v14 + 8) = *(void *)(v5 + 8);
          if ((v5 & 0x8000000000000000LL) != 0)
          {
            uint64_t v28 = objc_debug_taggedpointer_classes[v5 & 7];
          }

          else
          {
            uint64_t v28 = *(void *)v5 & 0xFFFFFFFF8LL;
          }

          if ((v28 & 0xFFFFFFF000000007LL) != 0) {
            _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v20, v21, v22, v28);
          }
          *(void *)uint64_t v14 = v28 & 0xFFFFFFFF8LL;
          *(_OWORD *)(v14 + 16) = *(_OWORD *)(v5 + 16);
          uint64_t v29 = *(Class *)(v5 + 32);
          uint64_t v30 = __ldxr(v24);
          if ((v29 & 4) != 0)
          {
            while (1)
            {
              v36 = v30 ? v30 | 4 : 0x8000000000000004LL;
              if (!__stlxr(v36, v24)) {
                break;
              }
              uint64_t v30 = __ldxr(v24);
            }
          }

          else
          {
            uint64_t v31 = v30 & 0xFFFFFFFFFFFFFFFBLL;
            for (int j = v30 == 0; ; int j = v34 == 0)
            {
              uint64_t v33 = j ? 0x8000000000000000LL : v31;
              if (!__stlxr(v33, v24)) {
                break;
              }
              v34 = __ldxr(v24);
              uint64_t v31 = v34 & 0xFFFFFFFFFFFFFFFBLL;
            }
          }

          v37 = *(void *)(v5 + 32);
          v38 = (void *)(v37 & 0xF00007FFFFFFFF8LL);
          if ((v37 & 0x8000000000000000LL) != 0)
          {
            v39 = *(void *)((v37 & 0xF00007FFFFFFFF8LL) + 8);
            v38 = (void *)(v39 & 0xFFFFFFFFFFFFFFFELL);
            if ((v39 & 1) != 0) {
              v38 = (void *)*v38;
            }
          }

          v40 = *(void *)(v25 + 8);
          if ((v40 & 1) != 0) {
            *(void *)(v40 & 0xFFFFFFFFFFFFFFFELL) = v38;
          }
          else {
            *(void *)(v25 + 8) = v38;
          }
          v41 = (char *)atomic_load(v27 + 3);
          strlen(v41);
          if ((_dyld_is_memory_immutable() & 1) == 0) {
            free(v41);
          }
          free(v27);
          addRemappedClass((objc_class *)v5, (objc_class *)v14);
LABEL_42:
          addNamedClass((objc_class *)v14, v9, (objc_class *)v5);
          goto LABEL_57;
        }
      }
    }
  }

  uint64_t v14 = v5;
  if ((a3 & 1) != 0) {
    goto LABEL_58;
  }
  size_t v5 = 0LL;
  if (v9) {
    goto LABEL_42;
  }
LABEL_57:
  addClassTableEntry(v14, 1);
LABEL_58:
  if (a2)
  {
    v42 = *(void *)(v14 + 32);
    v43 = (void *)(v42 & 0xF00007FFFFFFFF8LL);
    if (v42 < 0)
    {
      v44 = *(void *)((v42 & 0xF00007FFFFFFFF8LL) + 8);
      v43 = (void *)(v44 & 0xFFFFFFFFFFFFFFFELL);
      if ((v44 & 1) != 0) {
        v43 = (void *)*v43;
      }
    }

    *(_DWORD *)v43 |= 0x20000000u;
    v45 = *(void *)((*(void *)v14 & 0xFFFFFFFF8LL) + 0x20);
    v46 = (void *)(v45 & 0xF00007FFFFFFFF8LL);
    if (v45 < 0)
    {
      v47 = *(void *)((v45 & 0xF00007FFFFFFFF8LL) + 8);
      v46 = (void *)(v47 & 0xFFFFFFFFFFFFFFFELL);
      if ((v47 & 1) != 0) {
        v46 = (void *)*v46;
      }
    }

    *(_DWORD *)v46 |= 0x20000000u;
  }

  return v14;
}

  unint64_t v9 = *(unsigned int **)(StatusReg + 320);
  if (!v9)
  {
    unint64_t v9 = (unsigned int *)malloc(0x48uLL);
    *(_OWORD *)unint64_t v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    *((_OWORD *)v9 + 3) = 0u;
    *((void *)v9 + 8) = 0LL;
    *(void *)(StatusReg + 320) = v9;
  }

  uint64_t v10 = v9[17];
  if (v10)
  {
    BOOL v11 = (const char **)*((void *)v9 + 7);
    unint64_t v12 = v9[17];
    while (strcmp(a1, *v11))
    {
      ++v11;
      if (!--v12) {
        goto LABEL_22;
      }
    }

    return 0LL;
  }

  if (objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::LookupBucketFor<objc_class *>( (uint64_t)&objc::allocatedClasses,  (unint64_t)a1,  &v19))
  {
    *(void *)unsigned int v19 = -2LL;
    qword_18C43F418 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F418, (int32x2_t)0x1FFFFFFFFLL);
    if ((_DWORD)qword_18C43F418)
    {
      if (qword_18C43F420 >= 0x401 && qword_18C43F420 >> 4 > qword_18C43F418) {
        objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::grow( (uint64_t)&objc::allocatedClasses,  2 * qword_18C43F418);
      }
    }

    else if ((_DWORD)qword_18C43F420)
    {
      free((void *)objc::allocatedClasses);
      objc::allocatedClasses = 0LL;
      qword_18C43F418 = 0LL;
      LODWORD(qword_18C43F420) = 0;
    }

    else
    {
      qword_18C43F418 = 0LL;
    }
  }

    *(_DWORD *)(v5 + 40) = version;
  }

LABEL_21:
      uint64_t v14 = 1LL;
      if (!act_listCnt) {
        goto LABEL_26;
      }
LABEL_22:
      for (unint64_t i = 0LL; i < act_listCnt; mach_port_deallocate(*v1, act_list[i++]))
        ;
      uint64_t v21 = 4LL * act_listCnt;
    }

    else
    {
      uint64_t v14 = 0LL;
LABEL_26:
      uint64_t v21 = 0LL;
    }

    MEMORY[0x186DF4564](*v1, act_list, v21);
  }

  else
  {
    uint64_t v15 = task_restartable_ranges_synchronize();
    uint64_t v14 = v15;
    if ((_DWORD)v15)
    {
      uint64_t v16 = mach_error_string(v15);
      _objc_fatal("task_restartable_ranges_synchronize failed (result 0x%x: %s)", v17, v18, v19, v14, v16);
    }
  }

  return v14;
}

    initializeNonMetaClass(v11, v8, v9, v10);
    if (v4)
    {
      uint64_t v17 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      while (!__ldaxr((unsigned int *)&runtimeLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
    }
  }

  return v5;
}

void cache_t::eraseNolock(cache_t *this, const char *a2)
{
  if ((*(void *)this & 1) != 0
    || (*(objc_cache **)this != &_objc_empty_cache ? (BOOL v4 = HIWORD(*(void *)this) == 0LL) : (BOOL v4 = 0), v4))
  {
    if (PrintCaches)
    {
      unsigned int v19 = (objc_class *)((char *)this - 16);
      if ((*((_WORD *)this + 7) & 4) != 0) {
        uint64_t v20 = "meta";
      }
      else {
        uint64_t v20 = "";
      }
      uint64_t v21 = (const char *)objc_class::nameForLogging(v19);
      _objc_inform("CACHES: %sclass %s: dropping and disallowing preopt cache (from %s)", v20, v21, a2);
    }

    atomic_store((unint64_t)&_objc_empty_cache & 0xFFFFFFFFFFFLL, (unint64_t *)this);
    *((_WORD *)this + 6) = 0;
    BOOL v8 = (unsigned int *)(*((void *)this + 2) & 0xF00007FFFFFFFF8LL);
    do
      unsigned int v9 = __ldxr(v8);
    while (__stxr(v9 | 6, v8));
  }

  else if (*((_WORD *)this + 6))
  {
    unint64_t v5 = (unint64_t)&_objc_empty_cache & 0xFFFFFFFFFFFLL;
    unint64_t v6 = *(void *)this;
    if (HIWORD(*(void *)this))
    {
      unint64_t v10 = HIWORD(v6);
      uint64_t v7 = HIWORD(v6) + 1;
      unint64_t v6 = *(void *)this;
      if (v10 >= 0x401)
      {
        uint64_t v11 = 0LL;
        unsigned int v12 = v7;
        do
        {
          ++v11;
          BOOL v13 = v12 > 3;
          v12 >>= 1;
        }

        while (v13);
        if (v11 >= cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsListCount)
        {
          uint64_t v14 = (const void *)malloc_zone_malloc_with_options_np();
          uint64_t v15 = (char *)realloc( (void *)cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsList,  8LL * (v11 + 1));
          cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsList = (uint64_t)v15;
          if (cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsListCount < (v11 + 1))
          {
            uint64_t v16 = ~v11 + cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsListCount;
            uint64_t v17 = &v15[8 * cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsListCount];
            do
            {
              *(void *)uint64_t v17 = v14;
              v17 += 8;
            }

            while (!__CFADD__(v16++, 1LL));
          }

          cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsListCount = v11 + 1;
        }

        unint64_t v5 = *(void *)(cache_t::emptyBucketsForCapacity(unsigned int,BOOL)::emptyBucketsList + 8LL * v11);
      }
    }

    else
    {
      LODWORD(v7) = 0;
    }

    atomic_store(v5 | ((unint64_t)(v7 - 1) << 48), (unint64_t *)this);
    *((_WORD *)this + 6) = 0;
    cache_t::collect_free(v6 & 0xFFFFFFFFFFFLL, v7);
  }

uint64_t objc_cache_buckets(void *a1)
{
  return *a1 & 0xFFFFFFFFFFFLL;
}

uint64_t objc_cache_preoptCache(void *a1)
{
  return (*a1 & 0xFFFFFFFFFFFELL) - 16;
}

BOOL objc_cache_isConstantOptimizedCache(uint64_t *a1, char a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  BOOL result = *a1 & 1;
  if ((v4 & 1) == 0 && (a2 & 1) == 0)
  {
    unint64_t v6 = HIWORD(*a1);
    return v4 != a3 && v6 == 0;
  }

  return result;
}

uint64_t objc_cache_preoptCapacity(void *a1)
{
  return (*(unsigned __int16 *)((*a1 & 0xFFFFFFFFFFFELL) - 8) >> 5) + 1;
}

uint64_t objc_cache_preoptFallbackClass(void *a1)
{
  return (uint64_t)a1 + *(void *)((*a1 & 0xFFFFFFFFFFFELL) - 16) - 16;
}

uint64_t objc_cache_bytesForCapacity(unsigned int a1)
{
  return 16LL * a1;
}

uint64_t objc_cache_occupied(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 12);
}

uint64_t objc_cache_capacity(void *a1)
{
  if (HIWORD(*a1)) {
    return HIWORD(*a1) + 1;
  }
  else {
    return 0LL;
  }
}

Class object_getClass(Class result)
{
  if (result)
  {
    Class v1 = result;
    if (((unint64_t)result & 0x8000000000000000LL) != 0)
    {
      BOOL result = (Class)objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      return (Class)((uint64_t)result->isa & 0xFFFFFFFF8LL);
    }
  }

  return result;
}

Class object_setClass(Class result, Class a2)
{
  if (result)
  {
    unint64_t v5 = (objc_object *)result;
    int v6 = *(_DWORD *)((uint64_t)a2[4].isa & 0xF00007FFFFFFFF8LL);
    if ((unint64_t)&a2->isa[-1].isa + 7 < 0xF || (v6 & 0x40000000) == 0)
    {
      if ((v6 & 1) == 0) {
        int v6 = *(_DWORD *)(*(void *)(((uint64_t)a2->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v6 & 0x20000000) == 0) {
        lookUpImpOrNilTryCache(0LL, (unint64_t)sel_initialize, a2);
      }
    }

    return (Class)objc_object::changeIsa(v5, (uint64_t)a2, v2, v3);
  }

  return result;
}

unint64_t objc_object::changeIsa(objc_object *this, uint64_t a2, const char *a3, char *a4)
{
  unint64_t v6 = 0LL;
  char v7 = 0;
  unint64_t v8 = __ldxr((unint64_t *)this);
  unint64_t v9 = a2 & 0xFFFFFFF000000007LL;
  unint64_t v10 = a2 & 0xFFFFFFFF8LL;
  if (v8) {
    goto LABEL_2;
  }
  while (1)
  {
LABEL_3:
    if ((unint64_t)(*(void *)a2 - 1LL) < 0xF
      || (*(_BYTE *)((*(void *)(a2 + 32) & 0xF00007FFFFFFFF8LL) + 3) & 0x40) == 0)
    {
      __int16 v11 = *(_WORD *)(a2 + 30);
      if ((v11 & 0x2000) == 0)
      {
        if (!v9)
        {
          unint64_t v12 = v8 & 0xFFFFFFF000000003LL;
          if (!v8) {
            unint64_t v12 = 0x21A000000001LL;
          }
          unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFBLL | (4LL * (v11 & 1));
          goto LABEL_13;
        }

LABEL_34:
        _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", a2, a3, a4, a2);
      }
    }

    if ((v8 & 1) != 0) {
      break;
    }
    while (1)
    {
      if (v9) {
        goto LABEL_34;
      }
      unint64_t v13 = v6 & 0xFFFFFFF000000007LL;
LABEL_13:
      unint64_t v6 = v13 | v10;
      if (!__stxr(v13 | v10, (unint64_t *)this))
      {
        if ((v7 & 1) == 0) {
          return v8 & 0xFFFFFFFF8LL;
        }
        uint64_t v14 = ((this >> 4) ^ (this >> 9)) & 7LL;
        goto LABEL_28;
      }

LABEL_14:
      unint64_t v8 = __ldxr((unint64_t *)this);
      if (!v8) {
        break;
      }
LABEL_2:
      if ((v8 & 1) != 0) {
        goto LABEL_3;
      }
    }
  }

  if ((v7 & 1) == 0) {
    objc_object::sidetable_lock(this);
  }
  if (v9) {
    goto LABEL_34;
  }
  unint64_t v6 = v6 & 0xFFFFFFF000000007LL | v10;
  if (__stxr(v6, (unint64_t *)this))
  {
    char v7 = 1;
    goto LABEL_14;
  }

  uint64_t v14 = ((this >> 4) ^ (this >> 9)) & 7;
  uint64_t v22 = -(uint64_t)this;
  uint64_t v16 = ((v8 >> 43) & 0x1FFFFC) - 4;
  unint64_t v17 = *v15 + v16;
  if (__CFADD__(*v15, v16)) {
    unint64_t v17 = 0x8000000000000000LL;
  }
  if (!(v8 >> 44)) {
    v17 |= 2uLL;
  }
  *uint64_t v15 = v17 | (v8 >> 42) & 1;
LABEL_28:
  int v19 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v20 = __ldxr(&v18->_os_unfair_lock_opaque);
    if (v20 != v19) {
      break;
    }
    if (!__stlxr(0, &v18->_os_unfair_lock_opaque)) {
      return v8 & 0xFFFFFFFF8LL;
    }
  }

  __clrex();
  os_unfair_lock_unlock(v18);
  return v8 & 0xFFFFFFFF8LL;
}

LABEL_19:
    if ((v4 & 3) == 2)
    {
      unint64_t v8 = result[3];
      unint64_t v9 = *((unsigned int *)result + 4);
      unint64_t v10 = *((_DWORD *)result + 5);
      result[3] = (uint64_t *)((char *)v8 + v9);
      __int16 v11 = (unsigned int *)result[1];
      unint64_t v12 = *v11;
      unint64_t v13 = v11[1];
      uint64_t v14 = v13 * (unint64_t)v12;
      uint64_t v15 = (char *)(v10 + 1);
      *((_DWORD *)result + 5) = (_DWORD)v15;
      if ((v14 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v12,  (const char *)v14,  v15,  v13,  v11,  v12);
      }
      uint64_t v16 = (unint64_t)v11 + v14 + 8;
      if ((unint64_t)v8 + v9 < v16)
      {
        unint64_t v17 = v10 + 2;
        do
        {
          result[3] = (uint64_t *)((char *)v8 + 2 * v9);
          *((_DWORD *)result + 5) = v17++;
          unint64_t v8 = (uint64_t *)((char *)v8 + v9);
        }

        while ((unint64_t)v8 + v9 < v16);
      }
    }
  }

  char v7 = result[1];
  if (v7 == result[5]) {
    return result;
  }
LABEL_17:
  if (!*(_DWORD *)(*v7 + 4))
  {
    result[1] = v7 + 1;
    uint64_t v4 = *v1;
    goto LABEL_19;
  }

  return result;
}

LABEL_19:
    if ((v4 & 3) == 2)
    {
      unint64_t v8 = result[3];
      unint64_t v9 = *((unsigned int *)result + 4);
      unint64_t v10 = *((_DWORD *)result + 5);
      result[3] = (uint64_t *)((char *)v8 + v9);
      __int16 v11 = (unsigned int *)result[1];
      unint64_t v12 = *v11;
      unint64_t v13 = v11[1];
      uint64_t v14 = v13 * (unint64_t)v12;
      uint64_t v15 = (char *)(v10 + 1);
      *((_DWORD *)result + 5) = (_DWORD)v15;
      if ((v14 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v12,  (const char *)v14,  v15,  v13,  v11,  v12);
      }
      uint64_t v16 = (unint64_t)v11 + v14 + 8;
      if ((unint64_t)v8 + v9 < v16)
      {
        unint64_t v17 = v10 + 2;
        do
        {
          result[3] = (uint64_t *)((char *)v8 + 2 * v9);
          *((_DWORD *)result + 5) = v17++;
          unint64_t v8 = (uint64_t *)((char *)v8 + v9);
        }

        while ((unint64_t)v8 + v9 < v16);
      }
    }
  }

  char v7 = result[1];
  if (v7 == result[5]) {
    return result;
  }
LABEL_17:
  if (!*(void *)*v7)
  {
    result[1] = v7 + 1;
    uint64_t v4 = *v1;
    goto LABEL_19;
  }

  return result;
}

    Class = (objc_class *)readClass(a1, 0, 0);
    if (Class != a1)
    {
      unint64_t v18 = Class;
      uint64_t v14 = objc_class::nameForLogging(Class);
      _objc_fatal("objc_readClassPair for class %s changed %p to %p", v15, v16, v17, v14, a1, v18);
    }

    unint64_t v9 = realizeClassWithoutSwift(a1, 0LL);
    goto LABEL_16;
  }

  if ((*(_BYTE *)v6 & 2) != 0) {
    goto LABEL_14;
  }
LABEL_12:
  unint64_t v9 = 0LL;
LABEL_16:
  __int16 v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unint64_t v12 = __ldxr(runtimeLock);
    if (v12 != v11) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v9;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v9;
}

BOOL object_isClass(id obj)
{
  else {
    return (*(unsigned __int16 *)((*(void *)obj & 0xFFFFFFFF8LL) + 0x1E) >> 2) & 1;
  }
  return v1;
}

const char *__cdecl object_getClassName(id a1)
{
  if (!a1) {
    return "nil";
  }
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = (__objc2_class *)objc_debug_taggedpointer_classes[a1 & 7];
  }

  else
  {
    uint64_t v4 = (__objc2_class *)(*(void *)a1 & 0xFFFFFFFF8LL);
  }

  if (v4) {
    return (const char *)objc_class::demangledName((objc_class *)v4, 1LL, v1, v2);
  }
  else {
    return "nil";
  }
}

unint64_t object_getMethodImplementation(unint64_t result, objc_selector *a2)
{
  if (result)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      uint64_t v3 = (__objc2_class *)objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      uint64_t v3 = (__objc2_class *)(*(void *)result & 0xFFFFFFFF8LL);
    }

    BOOL result = 0LL;
    if (a2 && v3)
    {
      int v4 = *(_DWORD *)((uint64_t)v3->info & 0xF00007FFFFFFFF8LL);
      if ((v4 & 1) == 0) {
        int v4 = *(_DWORD *)(*(void *)(((uint64_t)v3->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v4 & 0x20000000) != 0
        && ((BOOL result = cache_getImp((uint64_t)v3, (unint64_t)a2, 0LL)) != 0
         || ((uint64_t)v3->cache & 1) != 0
         && (BOOL result = cache_getImp( (uint64_t)v3 + *(void *)(((uint64_t)v3->cache & 0xFFFFFFFFFFFELL) - 16),  (unint64_t)a2,  0LL)) != 0))
      {
        if ((id (*)(id, SEL, ...))result == _objc_msgForward_impcache) {
          BOOL result = 0LL;
        }
      }

      else
      {
        BOOL result = (unint64_t)lookUpImpOrForward(0LL, a2, (objc_class *)v3, (char *)7);
      }

      if (!result) {
        return (unint64_t)_objc_msgForward;
      }
    }
  }

  return result;
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  IMP result = 0LL;
  if (cls && name)
  {
    int v5 = *(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL);
    if ((v5 & 1) == 0) {
      int v5 = *(_DWORD *)(*(void *)(((uint64_t)cls->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v5 & 0x20000000) != 0
      && ((IMP result = (IMP)cache_getImp((uint64_t)cls, (unint64_t)name, 0LL)) != 0LL
       || ((uint64_t)cls[2].isa & 1) != 0
       && (IMP result = (IMP)cache_getImp( (uint64_t)cls + *(void *)(((uint64_t)cls[2].isa & 0xFFFFFFFFFFFELL) - 16),  (unint64_t)name,  0LL)) != 0LL))
    {
      if (result == _objc_msgForward_impcache) {
        IMP result = 0LL;
      }
    }

    else
    {
      IMP result = lookUpImpOrForward(0LL, (objc_selector *)name, cls, (char *)7);
    }

    if (!result) {
      return _objc_msgForward;
    }
  }

  return result;
}

uint64_t _class_getIvarMemoryManagement(uint64_t a1, unsigned int *a2)
{
  return v3;
}

void _class_lookUpIvar(uint64_t a1, unsigned int *a2, char *a3, char *a4)
{
  uint64_t v7 = a1;
  if (a2) {
    uint64_t v8 = **(int **)a2;
  }
  else {
    uint64_t v8 = 0LL;
  }
  *(void *)a3 = v8;
  if (!a1) {
    goto LABEL_62;
  }
  uint64_t v9 = a1;
  while (1)
  {
    uint64_t v10 = *(void *)((*(void *)(v9 + 32) & 0xF00007FFFFFFFF8LL) + 8);
    __int16 v11 = (void *)(v10 & 0xFFFFFFFFFFFFFFFELL);
    if ((v10 & 1) != 0) {
      __int16 v11 = (void *)*v11;
    }
    if ((*(_WORD *)v11 & 0x280) != 0) {
      break;
    }
    uint64_t v9 = *(void *)(v9 + 8);
    if (!v9) {
      goto LABEL_62;
    }
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v13 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&runtimeLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
  do
  {
LABEL_16:
    uint64_t v15 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
    uint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
    if ((v15 & 1) != 0) {
      uint64_t v16 = (void *)*v16;
    }
    unint64_t v17 = (unsigned int *)v16[6];
    unint64_t v18 = v17 + 2;
    if (v17) {
      BOOL v19 = v18 > a2;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      uint64_t v21 = *v17;
      uint64_t v20 = v17[1];
      unint64_t v22 = v20 * (unint64_t)v21;
      if ((v22 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v20, v17, v21);
      }
    }

    uint64_t v7 = *(void *)(v7 + 8);
  }

  while (v7);
  int v23 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v24 = __ldxr((unsigned int *)&runtimeLock);
    if (v24 != v23) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_30:
  uint64_t v25 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
  __n128 v26 = (void *)(v25 & 0xFFFFFFFFFFFFFFFELL);
  if ((v25 & 1) != 0) {
    __n128 v26 = (void *)*v26;
  }
  if ((*(_WORD *)v26 & 0x280) == 0) {
    goto LABEL_62;
  }
  uint64_t v27 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFFELL;
  if ((v27 & 1) != 0) {
    unint64_t v28 = *(void *)v28;
  }
  uint64_t v29 = (*(_DWORD *)(v28 + 4) + 7) & 0xFFFFFFF8;
  uint64_t v30 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
  uint64_t v31 = (void *)(v30 & 0xFFFFFFFFFFFFFFFELL);
  if ((v30 & 1) != 0) {
    uint64_t v31 = (void *)*v31;
  }
  unint64_t v32 = *(void *)a3 - v29;
  if ((*(_BYTE *)v31 & 1) != 0) {
    goto LABEL_48;
  }
  uint64_t v33 = (unsigned __int8 *)v31[2];
  if (!v33) {
    goto LABEL_48;
  }
  uint64_t v34 = 0LL;
  int64_t v35 = v32 >> 3;
  do
  {
    unsigned int v37 = *v33++;
    char v36 = v37;
    uint64_t v38 = v34 + ((unint64_t)v37 >> 4);
    if (!v37 || v38 > v35) {
      break;
    }
    uint64_t v34 = v38 + (v36 & 0xF);
    int v40 = 1;
  }

  while (v34 <= v35);
  if (v7)
  {
LABEL_48:
    uint64_t v41 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
    v42 = (void *)(v41 & 0xFFFFFFFFFFFFFFFELL);
    if ((v41 & 1) != 0) {
      v42 = (void *)*v42;
    }
    v43 = (unsigned __int8 *)v42[7];
    if (v43)
    {
      uint64_t v44 = 0LL;
      int64_t v45 = v32 >> 3;
      while (1)
      {
        unsigned int v47 = *v43++;
        char v46 = v47;
        uint64_t v48 = v44 + ((unint64_t)v47 >> 4);
        if (!v47 || v48 > v45) {
          break;
        }
        uint64_t v44 = v48 + (v46 & 0xF);
        if (v44 > v45)
        {
          int v40 = 2;
          goto LABEL_63;
        }
      }
    }
  }

  uint64_t v50 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 8);
  v51 = (void *)(v50 & 0xFFFFFFFFFFFFFFFELL);
  if ((v50 & 1) != 0) {
    v51 = (void *)*v51;
  }
  if ((*(_BYTE *)v51 & 0x80) != 0) {
    int v40 = 3;
  }
  else {
LABEL_62:
  }
    int v40 = 0;
LABEL_63:
  *(_DWORD *)a4 = v40;
}

void sub_18001ED20(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void object_setIvar(id obj, Ivar ivar, id value)
{
  if ((uint64_t)obj >= 1 && ivar)
  {
    v9[3] = v3;
    v9[4] = v4;
    _class_lookUpIvar(*(void *)obj & 0xFFFFFFFF8LL, (unsigned int *)ivar, (char *)v9, (char *)&v8);
    uint64_t v7 = (id *)((char *)obj + v9[0]);
    switch(v8)
    {
      case 0:
      case 3:
        *uint64_t v7 = value;
        break;
      case 1:
        objc_storeStrong(v7, value);
        break;
      case 2:
        objc_storeWeak(v7, value);
        break;
      default:
        return;
    }
  }

void object_setIvarWithStrongDefault(id obj, Ivar ivar, id value)
{
  if ((uint64_t)obj >= 1 && ivar)
  {
    v9[3] = v3;
    v9[4] = v4;
    _class_lookUpIvar(*(void *)obj & 0xFFFFFFFF8LL, (unsigned int *)ivar, (char *)v9, (char *)&v8);
    uint64_t v7 = (id *)((char *)obj + v9[0]);
    if (v8 < 2)
    {
      objc_storeStrong(v7, value);
    }

    else if (v8 == 3)
    {
      *uint64_t v7 = value;
    }

    else if (v8 == 2)
    {
      objc_storeWeak(v7, value);
    }
  }

id object_getIvar(id a1, Ivar a2)
{
  id result = 0LL;
  if ((uint64_t)a1 >= 1 && a2)
  {
    _class_lookUpIvar(*(void *)a1 & 0xFFFFFFFF8LL, (unsigned int *)a2, (char *)&v6, (char *)&v5);
    uint64_t v4 = (id *)((char *)a1 + v6);
    if (v5 == 2) {
      return objc_loadWeak(v4);
    }
    else {
      return *v4;
    }
  }

  return result;
}

Ivar object_setInstanceVariable(id obj, const char *name, void *value)
{
  Variable = 0LL;
  if ((uint64_t)obj >= 1)
  {
    if (name)
    {
      Variable = (unsigned int *)_class_getVariable( (objc_class *)(*(void *)obj & 0xFFFFFFFF8LL),  name,  (const char *)value,  v3);
      if (Variable)
      {
        _class_lookUpIvar(*(void *)obj & 0xFFFFFFFF8LL, Variable, (char *)&v10, (char *)&v9);
        uint64_t v7 = (id *)((char *)obj + v10);
        switch(v9)
        {
          case 0:
          case 3:
            *uint64_t v7 = value;
            break;
          case 1:
            objc_storeStrong(v7, value);
            break;
          case 2:
            objc_storeWeak(v7, value);
            break;
          default:
            return (Ivar)Variable;
        }
      }
    }
  }

  return (Ivar)Variable;
}

Ivar object_setInstanceVariableWithStrongDefault(id obj, const char *name, void *value)
{
  Variable = 0LL;
  if ((uint64_t)obj >= 1)
  {
    if (name)
    {
      Variable = (unsigned int *)_class_getVariable( (objc_class *)(*(void *)obj & 0xFFFFFFFF8LL),  name,  (const char *)value,  v3);
      if (Variable)
      {
        _class_lookUpIvar(*(void *)obj & 0xFFFFFFFF8LL, Variable, (char *)&v10, (char *)&v9);
        uint64_t v7 = (id *)((char *)obj + v10);
        if (v9 < 2)
        {
          objc_storeStrong(v7, value);
        }

        else if (v9 == 3)
        {
          *uint64_t v7 = value;
        }

        else if (v9 == 2)
        {
          objc_storeWeak(v7, value);
        }
      }
    }
  }

  return (Ivar)Variable;
}

Ivar object_getInstanceVariable(id obj, const char *name, void **outValue)
{
  if (!name) {
    goto LABEL_8;
  }
  uint64_t v6 = (objc_class *)(*(void *)obj & 0xFFFFFFFF8LL);
  if (!v6) {
    goto LABEL_8;
  }
  Variable = (objc_ivar *)_class_getVariable(v6, name, (const char *)outValue, v3);
  unsigned int v8 = Variable;
  if (outValue && Variable)
  {
    id Ivar = object_getIvar(obj, Variable);
LABEL_9:
    *outValue = Ivar;
    return v8;
  }

  if (!Variable)
  {
LABEL_8:
    id Ivar = 0LL;
    unsigned int v8 = 0LL;
    if (outValue) {
      goto LABEL_9;
    }
  }

  return v8;
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  if (cls && name) {
    return (Ivar)_class_getVariable(cls, name, v2, v3);
  }
  else {
    return 0LL;
  }
}

id (*object_cxxDestructFromClass( id (*result)(id receiver, SEL sel, ...), objc_class *a2))(id receiver, SEL sel, ...)
{
  if (a2)
  {
    Class isa = a2;
    uint64_t v3 = result;
    do
    {
      if ((HIWORD(isa[3].isa) & 1) == 0) {
        break;
      }
      id result = (id (*)(id, SEL, ...))lookupMethodInClassAndLoadCache(isa, (objc_selector *)SEL_cxx_destruct);
      if (result != _objc_msgForward_impcache)
      {
        uint64_t v4 = result;
        if (PrintCxxCtors)
        {
          int v5 = (const char *)objc_class::nameForLogging(isa);
          _objc_inform("CXX: calling C++ destructors for class %s", v5);
        }

        id result = (id (*)(id, SEL, ...))((uint64_t (*)(id (*)(id, SEL, ...)))v4)(v3);
      }

      Class isa = isa[1].isa;
    }

    while (isa);
  }

  return result;
}

id (*object_cxxConstructFromClass( id (*a1)(id receiver, SEL sel, ...), objc_class *a2, char a3))(id receiver, SEL sel, ...)
{
  int v5 = a1;
  Class isa = a2[1].isa;
  Cache = (id (*)(id, SEL, ...))lookupMethodInClassAndLoadCache(a2, (objc_selector *)SEL_cxx_construct);
  if (Cache != _objc_msgForward_impcache)
  {
    unsigned int v8 = Cache;
    if (PrintCxxCtors)
    {
      uint64_t v10 = (const char *)objc_class::nameForLogging(a2);
      _objc_inform("CXX: calling C++ constructors for class %s", v10);
    }

    if (!((uint64_t (*)(id (*)(id, SEL, ...)))v8)(v5))
    {
      __int16 v11 = a2[1].isa;
      if (v11) {
        object_cxxDestructFromClass(v5, v11);
      }
      if ((a3 & 1) != 0) {
        free(v5);
      }
      if ((a3 & 2) != 0) {
        _objc_callBadAllocHandler(a2);
      }
      return 0LL;
    }
  }

  return v5;
}

Method class_getClassMethod(Class cls, SEL name)
{
  if (!cls || !name) {
    return 0LL;
  }
  return class_getInstanceMethod(cls, name);
}

Ivar class_getClassVariable(Class cls, const char *name)
{
  else {
    return 0LL;
  }
}

BOOL class_respondsToMethod(Class cls, SEL sel)
{
  if ((class_respondsToMethod::warned & 1) == 0)
  {
    class_respondsToMethod::warned = 1;
    _objc_inform_deprecated("class_respondsToMethod", sel);
  }

  return class_respondsToSelector_inst(0LL, (objc_selector *)sel, cls);
}

BOOL class_respondsToSelector_inst(objc_object *a1, objc_selector *a2, objc_class *a3)
{
  BOOL result = 0LL;
  if (a2 && a3)
  {
    int v7 = *(_DWORD *)((uint64_t)a3[4].isa & 0xF00007FFFFFFFF8LL);
    if ((v7 & 1) == 0) {
      int v7 = *(_DWORD *)(*(void *)(((uint64_t)a3->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v7 & 0x20000000) != 0
      && ((Imp = (id (*)(id, SEL, ...))cache_getImp((uint64_t)a3, (unint64_t)a2, 0LL)) != 0LL
       || ((uint64_t)a3[2].isa & 1) != 0
       && (Imp = (id (*)(id, SEL, ...))cache_getImp( (uint64_t)a3 + *(void *)(((uint64_t)a3[2].isa & 0xFFFFFFFFFFFELL) - 16),  (unint64_t)a2,  0LL)) != 0LL))
    {
      if (Imp == _objc_msgForward_impcache) {
        Imp = 0LL;
      }
    }

    else
    {
      Imp = lookUpImpOrForward(a1, a2, a3, (char *)6);
    }

    return Imp != 0LL;
  }

  return result;
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return class_respondsToSelector_inst(0LL, (objc_selector *)sel, cls);
}

IMP class_lookupMethod(Class cls, SEL sel)
{
  if ((class_lookupMethod::warned & 1) != 0)
  {
    if (sel) {
      goto LABEL_3;
    }
LABEL_17:
    __objc_error((objc_object *)cls, sel, v2);
  }

  class_lookupMethod::warned = 1;
  _objc_inform_deprecated("class_lookupMethod", sel);
  if (!sel) {
    goto LABEL_17;
  }
LABEL_3:
  if (!cls) {
    return 0LL;
  }
  int v5 = *(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v5 & 1) == 0) {
    int v5 = *(_DWORD *)(*(void *)(((uint64_t)cls->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v5 & 0x20000000) != 0
    && ((IMP result = (IMP)cache_getImp((uint64_t)cls, (unint64_t)sel, 0LL)) != 0LL
     || ((uint64_t)cls[2].isa & 1) != 0
     && (IMP result = (IMP)cache_getImp( (uint64_t)cls + *(void *)(((uint64_t)cls[2].isa & 0xFFFFFFFFFFFELL) - 16),  (unint64_t)sel,  0LL)) != 0LL))
  {
    if (result == _objc_msgForward_impcache) {
      IMP result = 0LL;
    }
  }

  else
  {
    IMP result = lookUpImpOrForward(0LL, (objc_selector *)sel, cls, (char *)7);
  }

  if (!result) {
    return _objc_msgForward;
  }
  return result;
}

Class class_getSuperclass(Class cls)
{
  if (cls) {
    return cls[1].isa;
  }
  return cls;
}

BOOL class_isMetaClass(Class cls)
{
  if (cls) {
    LODWORD(cls) = (HIWORD(cls[3].isa) >> 2) & 1;
  }
  return (char)cls;
}

size_t class_getInstanceSize(size_t cls)
{
  if (cls)
  {
    uint64_t v1 = *(void *)((*(void *)(cls + 32) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFELL;
    if ((v1 & 1) != 0) {
      unint64_t v2 = *(void *)v2;
    }
    return (*(_DWORD *)(v2 + 8) + 7) & 0xFFFFFFF8;
  }

  return cls;
}

unsigned int method_getNumberOfArguments(Method m)
{
  if (!m) {
    return 0;
  }
  unint64_t v2 = (char *)method_t::types((unint64_t)m, v1);
  uint64_t v6 = (char *)(SkipFirstType(v2, v3, v4, v5) - 1);
  do
  {
    int v11 = *++v6;
    int v10 = v11;
  }

  while ((v11 - 48) < 0xA);
  if (!v10) {
    return 0;
  }
  unsigned int v12 = 0;
  do
  {
    Type = SkipFirstType(v6, v7, v8, v9);
    uint64_t v14 = Type + 1;
    int v15 = *(unsigned __int8 *)Type;
    if (v15 != 43) {
      uint64_t v14 = Type;
    }
    uint64_t v16 = *(unsigned __int8 *)v14 == 45;
    if (v15 == 43) {
      ++v16;
    }
    uint64_t v6 = (char *)&Type[v16 - 1];
    do
    {
      int v18 = *++v6;
      int v17 = v18;
    }

    while ((v18 - 48) < 0xA);
    ++v12;
  }

  while (v17);
  return v12;
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
  if (!m)
  {
    if (!dst) {
      return;
    }
    goto LABEL_10;
  }

  uint64_t v6 = (char *)method_t::types((unint64_t)m, v3);
  if (!dst) {
    return;
  }
  int v10 = v6;
  if (!v6)
  {
LABEL_10:
    int v15 = dst;
    size_t v14 = dst_len;
    goto LABEL_11;
  }

  Type = SkipFirstType(v6, v7, v8, v9);
  unint64_t v12 = Type - v10;
  if (Type - v10 >= dst_len) {
    size_t v13 = dst_len;
  }
  else {
    size_t v13 = Type - v10;
  }
  strncpy(dst, v10, v13);
  size_t v14 = dst_len - v12;
  if (dst_len > v12)
  {
    int v15 = &dst[v12];
LABEL_11:
    bzero(v15, v14);
  }

char *__cdecl method_copyReturnType(char *m)
{
  if (m)
  {
    m = (char *)method_t::types((unint64_t)m, v1);
    if (m)
    {
      int v5 = m;
      size_t v6 = SkipFirstType(m, v2, v3, v4) - m;
      uint64_t v7 = (char *)malloc(v6 + 1);
      m = strncpy(v7, v5, v6);
      m[v6] = 0;
    }
  }

  return m;
}

void method_getArgumentType(Method m, unsigned int index, char *dst, size_t dst_len)
{
  if (!m)
  {
    if (!dst) {
      return;
    }
    goto LABEL_11;
  }

  uint64_t v7 = *(void *)&index;
  unsigned int v8 = (char *)method_t::types((unint64_t)m, v4);
  BOOL v19 = v8;
  if (!dst) {
    return;
  }
  if (!v8 || (encoding_getArgumentInfo(v8, v7, (char *)&v19, v18), (unint64_t v12 = v19) == 0LL))
  {
LABEL_11:
    int v17 = dst;
    size_t v16 = dst_len;
    goto LABEL_12;
  }

  Type = SkipFirstType(v19, v9, v10, v11);
  unint64_t v14 = Type - v12;
  if (Type - v12 >= dst_len) {
    size_t v15 = dst_len;
  }
  else {
    size_t v15 = Type - v12;
  }
  strncpy(dst, v12, v15);
  size_t v16 = dst_len - v14;
  if (dst_len > v14)
  {
    int v17 = &dst[v14];
LABEL_12:
    bzero(v17, v16);
  }

char *__cdecl method_copyArgumentType(char *m, unsigned int index)
{
  if (m)
  {
    uint64_t v3 = *(void *)&index;
    m = (char *)method_t::types((unint64_t)m, v2);
    int v11 = m;
    if (m)
    {
      encoding_getArgumentInfo(m, v3, (char *)&v11, v10);
      uint64_t v7 = v11;
      if (v11)
      {
        size_t v8 = SkipFirstType(v11, v4, v5, v6) - v7;
        uint64_t v9 = (char *)malloc(v8 + 1);
        m = strncpy(v9, v7, v8);
        m[v8] = 0;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return m;
}

char *copyPropertyAttributeString(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return strdup("");
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = a2;
  int v5 = (const char **)(a1 + 8);
  uint64_t v6 = a2;
  do
  {
    if (*v5)
    {
      size_t v7 = strlen(*(v5 - 1));
      if (v7 <= 1) {
        size_t v8 = v7;
      }
      else {
        size_t v8 = v7 + 2;
      }
      v3 += strlen(*v5) + v8 + 1;
    }

    v5 += 2;
    --v6;
  }

  while (v6);
  uint64_t v9 = (char *)malloc(v3 + 1);
  int v10 = &v9[v3 + 1];
  int v11 = (void *)(a1 + 8);
  int v18 = v9;
  unint64_t v12 = v9;
  do
  {
    if (*v11)
    {
      else {
        int v13 = snprintf(v12, v10 - v12, "%s%s,");
      }
      if (v10 - v12 < (unint64_t)v13) {
        _objc_fatal( "Incorrect buffer calculation for property string. Partial string is %s, calculated length is %zu.",  v14,  v15,  v16,  v18,  v3);
      }
      v12 += v13;
    }

    v11 += 2;
    --v4;
  }

  while (v4);
  IMP result = v18;
  if (v12 > v18) {
    *(v12 - 1) = 0;
  }
  return result;
}

uint64_t copyOneAttribute( unsigned int a1, void *a2, void **a3, const char *__src, size_t __n, const char *a6, size_t a7)
{
  unint64_t v12 = (void *)*a2;
  int v13 = (char *)*a3;
  *(void *)*a2 = *a3;
  memcpy(v13, __src, __n);
  uint64_t v14 = &v13[__n];
  *v14++ = 0;
  v12[1] = v14;
  memcpy(v14, a6, a7);
  v14[a7] = 0;
  *a2 = v12 + 2;
  *a3 = &v14[a7 + 1];
  return 1LL;
}

uint64_t iteratePropertyAttributes( const char *__s, uint64_t (*a2)(uint64_t, void *, void *, const char *, int64_t, uint64_t, const char *), void *a3, void *a4)
{
  if (!__s) {
    return 0LL;
  }
  uint64_t v4 = __s;
  int v5 = *(unsigned __int8 *)__s;
  if (!*__s) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  do
  {
    size_t v10 = strcspn(v4, ",");
    int v11 = &v4[v10];
    if (v4[v10]) {
      unint64_t v12 = &v4[v10 + 1];
    }
    else {
      unint64_t v12 = &v4[v10];
    }
    if (v10)
    {
      int v13 = v4 + 1;
      if (v5 == 34)
      {
        size_t v14 = strcspn(++v4, ",");
        v13 += v14;
        uint64_t v15 = (uint64_t)(*v13 == 34 ? v13 + 1 : v13);
      }

      else
      {
        uint64_t v15 = (uint64_t)(v4 + 1);
      }

      int v16 = a2(v9, a3, a4, v4, v13 - v4, v15, &v11[-v15]);
      uint64_t v9 = (v9 + 1);
      if (!v16) {
        break;
      }
    }

    int v5 = *(unsigned __int8 *)v12;
    uint64_t v4 = v12;
  }

  while (*v12);
  return v9;
}

uint64_t findOneAttribute( unsigned int a1, char *__s, void *a3, const char *a4, size_t a5, const char *a6, size_t a7)
{
  if (strlen(__s) != a5 || strncmp(a4, __s, a5)) {
    return 1LL;
  }
  size_t v14 = calloc(a7 + 1, 1uLL);
  memcpy(v14, a6, a7);
  uint64_t result = 0LL;
  *((_BYTE *)v14 + a7) = 0;
  *a3 = v14;
  return result;
}

ssize_t _objc_syslog(const char *a1)
{
  if (!sandbox_check()
    || (_simple_asl_log(), ssize_t result = fstat(2, &v5), (result & 0x80000000) == 0)
    && ((v5.st_mode & 0xB000) == 0x8000 || (int v3 = v5.st_mode & 0xF000, v3 == 0x2000) || v3 == 4096))
  {
    size_t v4 = strlen(a1);
    return write(2, a1, v4);
  }

  return result;
}

void _objc_crashlog(const char *__s1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&crashlog_lock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  stat v5 = (void *)__crashreporter_info__;
  if (__crashreporter_info__)
  {
    size_t v6 = strlen((const char *)__crashreporter_info__);
    if (v6 < 0x1F41)
    {
      asprintf(&v13, "%s\n%s", (const char *)__crashreporter_info__, __s1);
    }

    else
    {
      size_t v7 = (const char *)(v6 + __crashreporter_info__ - 8001);
      do
        char v8 = *++v7;
      while ((v8 & 0xC0) == 0x80);
      asprintf(&v13, "... %s\n%s", v7, __s1);
    }

    uint64_t v9 = v13;
    if (v13) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v9 = strdup(__s1);
    int v13 = v9;
    if (v9)
    {
LABEL_15:
      size_t v10 = strlen(v9) - 1;
      if (v9[v10] == 10) {
        v9[v10] = 0;
      }
      if (v5) {
        free(v5);
      }
      __crashreporter_info__ = (uint64_t)v13;
    }
  }

  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr((unsigned int *)&crashlog_lock);
    if (v12 != v11) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&crashlog_lock);
}

void sub_18001FD80(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&crashlog_lock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void _objc_exception_abort1(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
}

void _objc_exception_abort2(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
}

void _objc_exception_abort3(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
}

void _objc_exception_abort4(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
}

uint64_t _objc_exception_do_catch(uint64_t a1, uint64_t (***a2)(), objc_object ***a3)
{
  if (*a2 == off_18961D718)
  {
    int v4 = **a3;
    *a3 = (objc_object **)v4;
    if ((uint64_t (**)())a1 == &OBJC_EHTYPE_id)
    {
    }

    else
    {
      unint64_t v5 = *(void *)(a1 + 16);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v7 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v7, runtimeLock)) {
          goto LABEL_13;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_13:
      unint64_t v9 = remapClass(v5);
      size_t v10 = (objc_class *)v9;
      int v11 = *(_DWORD *)(StatusReg + 24);
      do
      {
        unsigned int v12 = __ldxr(runtimeLock);
        if (v12 != v11)
        {
          __clrex();
          os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
          if (!v10) {
            goto LABEL_23;
          }
          goto LABEL_19;
        }
      }

      while (__stlxr(0, runtimeLock));
      if (!v9)
      {
LABEL_23:
        if (PrintExceptions)
        {
          objc_class::nameForLogging(v10);
          _objc_inform("EXCEPTIONS: skipping catch(%s)");
        }

        return 0LL;
      }

LABEL_19:
      if (PrintExceptions)
      {
        objc_class::nameForLogging(v10);
        _objc_inform("EXCEPTIONS: catch(%s)");
      }
    }

    return 1LL;
  }

  else
  {
    return 0LL;
  }

  if ((v11 & 1) == 0) {
    os_unfair_lock_lock_with_options();
  }
  if (!previously) {
    Class = (objc_class *)readClass(Class, 0, 0);
  }
  int v16 = realizeClassWithoutSwift(Class, 0LL);
  BOOL v19 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    uint64_t v20 = __ldxr(runtimeLock);
    if (v20 != v19) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v16;
    }
  }
}

    __clrex();
    return (unsigned int *)os_unfair_lock_lock_with_options();
  }

  while (!__ldaxr(a2))
  {
    if (!__stxr(v5, a2)) {
      goto LABEL_14;
    }
  }

  __clrex();
  ssize_t result = (unsigned int *)os_unfair_lock_lock_with_options();
LABEL_14:
  if (v3 != a2)
  {
    size_t v10 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v3))
    {
      if (!__stxr(v10, v3)) {
        return result;
      }
    }

    goto LABEL_19;
  }

  return result;
}

void sub_18001FFBC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t _objc_exception_false()
{
  return 0LL;
}

uint64_t _objc_default_exception_matcher(__objc2_class *a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = (__objc2_class *)objc_debug_taggedpointer_classes[a2 & 7];
  }

  else
  {
    uint64_t v2 = (__objc2_class *)(*(void *)a2 & 0xFFFFFFFF8LL);
  }

  if (!v2) {
    return 0LL;
  }
  while (v2 != a1)
  {
    uint64_t v2 = v2->superclass;
    if (!v2) {
      return 0LL;
    }
  }

  return 1LL;
}

objc_exception_preprocessor objc_setExceptionPreprocessor(objc_exception_preprocessor fn)
{
  uint64_t v1 = (id (__cdecl *)(id))exception_preprocessor;
  exception_preprocessor = (uint64_t (*)(objc_object *))fn;
  return v1;
}

objc_exception_matcher objc_setExceptionMatcher(objc_exception_matcher fn)
{
  uint64_t v1 = (int (__cdecl *)(Class, id))exception_matcher;
  exception_matcher = (uint64_t (*)(objc_class *, objc_object *))fn;
  return v1;
}

objc_uncaught_exception_handler objc_setUncaughtExceptionHandler(objc_uncaught_exception_handler fn)
{
  uint64_t v1 = (void (__cdecl *)(id))uncaught_handler;
  uncaught_handler = (uint64_t (*)(objc_object *))fn;
  return v1;
}

int __objc_personality_v0( int version, int actions, uint64_t exceptionClass, _Unwind_Exception *exceptionObject, _Unwind_Context *context)
{
  if (PrintExceptions)
  {
    if ((actions & 0xA) != 0) {
      char v8 = "unwinding";
    }
    else {
      char v8 = "searching";
    }
    unint64_t v9 = (const void *)(_Unwind_GetIP(context) - 1);
    CFA = (const void *)_Unwind_GetCFA(context);
    _objc_inform("EXCEPTIONS: %s through frame [ip=%p sp=%p] for exception %p", v8, v9, CFA, exceptionObject);
  }

  return __gxx_personality_v0();
}

id _objc_exception_destructor(id *a1)
{
  id v1 = *a1;
  if (PrintExceptions)
  {
    ClassName = object_getClassName(*a1);
    _objc_inform("EXCEPTIONS: releasing completed exception %p (object %p, a %s)", a1, v1, ClassName);
  }

  return objc_msgSend(v1, sel_release);
}

id objc_begin_catch(void *exc_buf)
{
  return __cxa_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

uint64_t _objc_terminate(void)
{
  if (__cxa_current_exception_type()) {
    __cxa_rethrow();
  }
  return old_terminate();
}

void sub_18002029C(void *a1, int a2)
{
  unsigned int v3 = (objc_object *)objc_begin_catch(a1);
  if (a2 == 2) {
    unsigned int v3 = (objc_object *)uncaught_handler(v3);
  }
  ((void (*)(objc_object *))old_terminate)(v3);
  objc_end_catch();
}

void sub_1800202E0(_Unwind_Exception *a1)
{
}

void __clang_call_terminate(void *a1)
{
}

id CALLING_SOME__initialize_METHOD(void *a1)
{
  return objc_msgSend(a1, sel_initialize);
}

uint64_t WAITING_FOR_A_CLASS__initialize_LOCK(objc_class *this, uint64_t a2, uint64_t a3, char *a4)
{
  p_Class isa = &this->isa;
  if (PrintInitializing)
  {
    size_t v6 = *(const void **)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v7 = (const char *)objc_class::nameForLogging(this);
    _objc_inform("INITIALIZE: thread %p: acquiring lock for +[%s initialize]", v6, v7);
  }

  return _objc_sync_enter_kind((uint64_t)p_isa, 2LL, a3, a4);
}

unint64_t _thisThreadIsInitializingClass(void *a1)
{
  unint64_t result = (unint64_t)_fetchInitializingClassList(0);
  if (result)
  {
    uint64_t v3 = *(unsigned int *)result;
    if ((int)v3 < 1)
    {
      return 0LL;
    }

    else
    {
      int v4 = *(void **)(result + 8);
      uint64_t v5 = v3 - 1;
      do
      {
        size_t v6 = (void *)*v4++;
        unint64_t result = a1 == v6;
      }

      while (a1 != v6 && v5-- != 0);
    }
  }

  return result;
}

void *_fetchInitializingClassList(int a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v3 = *(_OWORD **)(StatusReg + 320);
  if (a1 && !v3)
  {
    uint64_t v3 = malloc(0x48uLL);
    *uint64_t v3 = 0u;
    v3[1] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    *((void *)v3 + 8) = 0LL;
    *(void *)(StatusReg + 320) = v3;
    goto LABEL_4;
  }

  if (!v3) {
    return 0LL;
  }
  int v4 = *(void **)v3;
  if (!*(void *)v3)
  {
LABEL_4:
    if (a1)
    {
      int v4 = calloc(1uLL, 0x10uLL);
      *(void *)uint64_t v3 = v4;
      goto LABEL_8;
    }

    return 0LL;
  }

LABEL_8:
  if (!v4[1])
  {
    *(_DWORD *)int v4 = 4;
    v4[1] = calloc(4uLL, 8uLL);
  }

  return v4;
}

  size_t v10 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    int v11 = __ldxr(runtimeLock);
    if (v11 != v10) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return Ivar;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return Ivar;
}

  if (v6 == 40)
  {
    unint64_t v9 = a1;
    size_t v10 = 41LL;
    goto LABEL_14;
  }

  if (v6 != 64) {
    return v5 + 1;
  }
  if (v5[1] == 63) {
    return v5 + 2;
  }
  return a1;
}

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v13 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v13, runtimeLock)) {
      goto LABEL_13;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_13:
  uint64_t v15 = (void *)HeadPageGroup;
  if (HeadPageGroup)
  {
    int v16 = *(void *)(HeadPageGroup + 16);
    if (v16 != 2048) {
      goto LABEL_23;
    }
    uint64_t v15 = *(void **)(HeadPageGroup + 8);
    if (v15)
    {
      int v16 = v15[2];
      goto LABEL_23;
    }
  }

  int v17 = *(void *)(Trampolines[0] + 16);
  int v18 = *(void *)(Trampolines[0] + 24);
  BOOL v19 = (vm_map_t *)MEMORY[0x1895FBBE0];
  uint64_t v20 = vm_allocate(*MEMORY[0x1895FBBE0], &size, v18 + 0x4000, 687865857);
  if ((_DWORD)v20)
  {
    uint64_t v31 = "vm_allocate trampolines failed (%d)";
    goto LABEL_41;
  }

  target_address = size + 0x4000;
  uint64_t v20 = vm_remap(*v19, &target_address, v18, 0LL, 0x4000, *v19, v17, 1, &cur_protection, &v36, 0);
  if ((_DWORD)v20)
  {
    uint64_t v31 = "vm_remap trampolines failed (%d)";
LABEL_41:
    _objc_fatal(v31, v1, v2, v3, v20);
  }

  uint64_t v15 = (void *)size;
  *(void *)size = 0LL;
  v15[1] = 0LL;
  int v16 = (*(void *)(Trampolines[0] + 8) - *(void *)Trampolines[0]) >> 3;
  v15[2] = v16;
  v15[3] = v15 + 2048;
  uint64_t v21 = &HeadPageGroup;
  unint64_t v22 = (void *)HeadPageGroup;
  if (HeadPageGroup)
  {
    do
    {
      int v23 = v22;
      unint64_t v22 = (void *)*v22;
    }

    while (v22);
    const char *v23 = v15;
    uint64_t v21 = (uint64_t *)(HeadPageGroup + 8);
  }

  const char *v21 = (uint64_t)v15;
LABEL_23:
  unsigned int v24 = v15[v16];
  if (!v24) {
    unsigned int v24 = v16 + 1;
  }
  v15[2] = v24;
  if (v24 == 2048)
  {
    uint64_t v25 = HeadPageGroup;
    while (v25)
    {
      __n128 v26 = v25;
      uint64_t v25 = *(void *)(v25 + 8);
      if ((void *)v25 == v15)
      {
        *(void *)(v26 + 8) = v15[1];
        v15[1] = 0LL;
        break;
      }
    }
  }

  v15[v16] = v4;
  if (v16 > 0x7FF || (*(void *)(Trampolines[0] + 8) - *(void *)Trampolines[0]) >> 3 > v16) {
    _objc_fatal("Trampoline block %p, requested invalid index %lu", v1, v2, v3, v15, v16);
  }
  uint64_t v27 = v16;
  unint64_t v28 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    uint64_t v29 = __ldxr(runtimeLock);
    if (v29 != v28) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return (IMP)&v15[v27 + 4096];
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return (IMP)&v15[v27 + 4096];
}

void performForkChildInitialize(objc_class *this, objc_class *a2, const char *a3, char *a4)
{
  if (this[1].isa)
  {
    size_t v6 = (objc_class *)((uint64_t)this->isa & 0xFFFFFFFF8LL);
    if (v6 != this)
    {
      unsigned int v7 = lookUpImpOrNilTryCache( *(objc_object **)(((uint64_t)v6->isa & 0xFFFFFFFF8LL) + 8),  (unint64_t)sel_initialize,  (objc_class *)(**(void **)(((uint64_t)v6->isa & 0xFFFFFFFF8LL) + 8) & 0xFFFFFFFF8LL));
      char v8 = lookUpImpOrNilTryCache( (objc_object *)this,  (unint64_t)sel_initialize,  (objc_class *)((uint64_t)this->isa & 0xFFFFFFFF8LL));
      BOOL v9 = !v8 || (char *)v8 == (char *)objc_noop_imp;
      if (!v9 && v8 != v7)
      {
        if (PrintInitializing)
        {
          unsigned int v12 = *(const void **)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          int v13 = (const char *)objc_class::nameForLogging(this);
          _objc_inform( "INITIALIZE: thread %p: refusing to call +[%s initialize] in fork() child process because it may have been in progress when fork() was called",  v12,  v13);
        }

        size_t v14 = (const char *)objc_class::nameForLogging(this);
        _objc_inform_now_and_on_crash( "+[%s initialize] may have been in progress in another thread when fork() was called.",  v14);
        gdb_objc_class_changed();
        unint64_t v15 = objc_class::nameForLogging(this);
        _objc_fatal( "+[%s initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.",  v16,  v17,  v18,  v15);
      }
    }
  }

  if (PrintInitializing)
  {
    size_t v10 = *(const void **)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v11 = (const char *)objc_class::nameForLogging(this);
    _objc_inform("INITIALIZE: thread %p: skipping trivial +[%s initialize] in fork() child process", v10, v11);
  }

  lockAndFinishInitializing(this, a2, a3, a4);
}

void lockAndFinishInitializing(objc_class *this, objc_class *a2, const char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&pendingInitializeMapLock))
  {
    if (!__stxr(v7, (unsigned int *)&pendingInitializeMapLock))
    {
      if (!a2) {
        goto LABEL_18;
      }
      goto LABEL_7;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
  if (!a2)
  {
LABEL_18:
    _finishInitializing(this, a2, a3, a4);
    goto LABEL_27;
  }

LABEL_7:
  int v9 = *(_DWORD *)((uint64_t)a2[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v9 & 1) == 0) {
    int v9 = *(_DWORD *)(*(void *)(((uint64_t)a2->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v9 & 0x20000000) != 0) {
    goto LABEL_18;
  }
  if (PrintInitializing)
  {
    size_t v10 = *(const void **)StatusReg;
    int v11 = (const char *)objc_class::nameForLogging(this);
    unsigned int v12 = (const char *)objc_class::nameForLogging(a2);
    _objc_inform( "INITIALIZE: thread %p: class %s will be marked as fully +initialized after superclass +[%s initialize] completes",  v10,  v11,  v12);
  }

  int v13 = (int32x2_t *)pendingInitializeMap;
  if (!pendingInitializeMap)
  {
    int v13 = (int32x2_t *)malloc(0x18uLL);
    v13[2].i32[0] = 16;
    size_t v14 = (char *)malloc(0x100uLL);
    uint64_t v15 = 0LL;
    *int v13 = (int32x2_t)v14;
    v13[1] = 0LL;
    do
    {
      *(void *)&v14[v15] = -1LL;
      v15 += 16LL;
    }

    while (v15 != 256);
    pendingInitializeMap = (uint64_t)v13;
  }

  uint64_t v16 = malloc(0x10uLL);
  *uint64_t v16 = this;
  v16[1] = 0LL;
  char v17 = objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::LookupBucketFor<objc_class *>( (uint64_t)v13,  (unint64_t)a2,  &v24);
  int v18 = v24;
  if ((v17 & 1) == 0)
  {
    __int32 v20 = v13[1].i32[0];
    unsigned int v21 = v13[2].u32[0];
    if (4 * v20 + 4 >= 3 * v21)
    {
      objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::grow( (uint64_t)v13,  2 * v21);
      objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::LookupBucketFor<objc_class *>( (uint64_t)v13,  (unint64_t)a2,  &v24);
    }

    else
    {
      if (v21 + ~v20 - v13[1].i32[1] > v21 >> 3)
      {
LABEL_21:
        if (*v18 == -2LL)
        {
          v13[1] = vadd_s32(v13[1], (int32x2_t)0xFFFFFFFF00000001LL);
        }

        else if (*v18 == -1LL)
        {
          ++v13[1].i32[0];
        }

        *int v18 = a2;
        BOOL v19 = v18 + 1;
        goto LABEL_26;
      }

      objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::grow( (uint64_t)v13,  v21);
      objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::LookupBucketFor<objc_class *>( (uint64_t)v13,  (unint64_t)a2,  &v24);
    }

    int v18 = v24;
    goto LABEL_21;
  }

  BOOL v19 = v24 + 1;
  v16[1] = v24[1];
LABEL_26:
  *BOOL v19 = v16;
LABEL_27:
  int v22 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v23 = __ldxr((unsigned int *)&pendingInitializeMapLock);
    if (v23 != v22) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&pendingInitializeMapLock);
}

  _Unwind_Resume(exception_object);
}

  uint64_t v16 = -(uint64_t)this;
  uint64_t v15 = 2LL;
  if (v18)
  {
    char v8 = 1;
  }

  else
  {
    int v9 = *(void *)(v17 + 8);
    char v8 = v9 < 2;
    if (v9 > 1)
    {
      if ((v9 & 0x8000000000000000LL) != 0)
      {
        char v8 = 0;
        goto LABEL_15;
      }

      size_t v10 = v9 - 4;
    }

    else
    {
      size_t v10 = v9 | 2;
    }

    *(void *)(v17 + 8) = v10;
  }

  size_t v10 = -(uint64_t)this;
  if ((*v6 & 0x8000000000000000LL) == 0) {
    *v6 += 4LL;
  }
  unsigned int v7 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    char v8 = __ldxr((unsigned int *)v3);
    if (v8 != v7) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v3);
  return this;
}

void sub_180020878(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&pendingInitializeMapLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void _finishInitializing(objc_class *a1, objc_class *a2, const char *a3, char *a4)
{
  if (PrintInitializing)
  {
    int v40 = *(const void **)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v41 = (const char *)objc_class::nameForLogging(a1);
    _objc_inform("INITIALIZE: thread %p: %s is fully +initialized", v40, v41);
  }

  uint64_t v5 = (uint64_t)a1->isa & 0xFFFFFFFF8LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&runtimeLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  objc::Scanner::scanAddedClassImpl(a1, 0LL, a3, a4);
  objc::Scanner::scanAddedClassImpl((objc_class *)v5, 1uLL, v9, v10);
  cache_t::maybeConvertToPreoptimized((cache_t *)&a1[2]);
  cache_t::maybeConvertToPreoptimized((cache_t *)(v5 + 16));
  if (PrintInitializing)
  {
    size_t v14 = (const char *)objc_class::nameForLogging(a1);
    _objc_inform("INITIALIZE: thread %p: setInitialized(%s)", *(const void **)StatusReg, v14);
  }

  uint64_t v15 = (unsigned int *)(*(void *)(v5 + 32) & 0xF00007FFFFFFFF8LL);
LABEL_11:
  unsigned int v16 = *v15;
  unsigned int v17 = *v15 & 0xCFFFFFFF | 0x20000000;
  do
  {
    unsigned int v18 = __ldaxr(v15);
    if (v18 != v16)
    {
      __clrex();
      goto LABEL_11;
    }
  }

  while (__stlxr(v17, v15));
  int v19 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v20 = __ldxr((unsigned int *)&runtimeLock);
    if (v20 != v19) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_20:
  unlockClass(a1, v11, v12, v13);
  InitializingClassList = _fetchInitializingClassList(0);
  if (!InitializingClassList) {
    goto LABEL_28;
  }
  if ((unint64_t)&a1->isa[-1].isa + 7 < 0xF
    || (uint64_t v25 = a1, (*(_BYTE *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 1) == 0))
  {
    uint64_t v25 = (objc_class *)((uint64_t)a1->isa & 0xFFFFFFFF8LL);
  }

  uint64_t v26 = *(unsigned int *)InitializingClassList;
  if ((int)v26 < 1) {
LABEL_28:
  }
    _objc_fatal("thread is not initializing this class!", v22, v23, v24);
  uint64_t v27 = 0LL;
  uint64_t v28 = InitializingClassList[1];
  while (v25 != *(objc_class **)(v28 + 8 * v27))
  {
    if (v26 == ++v27) {
      goto LABEL_28;
    }
  }

  *(void *)(v28 + 8 * v27) = 0LL;
  uint64_t v29 = (int32x2_t *)pendingInitializeMap;
  if (pendingInitializeMap)
  {
    uint64_t v30 = *(objc_class **)pendingInitializeMap;
    uint64_t v31 = *(unsigned int *)(pendingInitializeMap + 16);
    if ((_DWORD)v31)
    {
      LODWORD(v32) = (v31 - 1) & (bswap64(0x8A970BE7488FDA55LL * ((unint64_t)a1 ^ ((unint64_t)a1 >> 4))) ^ (1217387093 * (a1 ^ ((unint64_t)a1 >> 4))));
      uint64_t v33 = &v30[2 * v32];
      Class isa = v33->isa;
      if (v33->isa == a1) {
        goto LABEL_38;
      }
      unsigned int v35 = 1;
      while (isa != (objc_class *)-1LL)
      {
        if (v35 > v31) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( pendingInitializeMap,  v30,  v31);
        }
        int v36 = v32 + v35++;
        uint64_t v32 = v36 & (v31 - 1);
        Class isa = v30[2 * v32].isa;
        if (isa == a1)
        {
          uint64_t v33 = &v30[2 * v32];
          goto LABEL_38;
        }
      }
    }

    uint64_t v33 = &v30[2 * v31];
LABEL_38:
    if (v33 == &v30[2 * v31]) {
      return;
    }
    Class v37 = v33[1].isa;
    v33->Class isa = (Class)-2LL;
    int32x2_t v38 = vadd_s32(v29[1], (int32x2_t)0x1FFFFFFFFLL);
    v29[1] = v38;
    unsigned int v39 = v29[2].u32[0];
    if (v38.i32[0])
    {
      if (v39 < 0x401
        || v39 >> 4 <= v38.i32[0]
        || (objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::grow( (uint64_t)v29,  2 * v38.i32[0]),  uint64_t v29 = (int32x2_t *)pendingInitializeMap,  *(_DWORD *)(pendingInitializeMap + 8)))
      {
LABEL_48:
        if (v37)
        {
          do
          {
            v42 = v37[1].isa;
            if (v37->isa) {
              _finishInitializing(v37->isa, v30);
            }
            free(v37);
            Class v37 = v42;
          }

          while (v42);
        }

        return;
      }
    }

    else if (v39)
    {
      free(*(void **)v29);
      *uint64_t v29 = 0LL;
      v29[1] = 0LL;
      v29[2].i32[0] = 0;
    }

    else
    {
      v29[1] = 0LL;
    }

    free(*(void **)v29);
    free(v29);
    pendingInitializeMap = 0LL;
    goto LABEL_48;
  }

uint64_t objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::LookupBucketFor<objc_class *>( uint64_t a1, unint64_t a2, void *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    unsigned int v4 = v3 - 1;
    unsigned int v5 = (v3 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a2 ^ (a2 >> 4))) ^ (1217387093 * (a2 ^ (a2 >> 4))));
    size_t v6 = (void *)(*(void *)a1 + 16LL * v5);
    uint64_t v7 = *v6;
    if (*v6 == a2)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      size_t v10 = 0LL;
      unsigned int v11 = 1;
      while (v7 != -1)
      {
        if (v11 > v3) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  *(void **)a1,  *(unsigned int *)(a1 + 16));
        }
        if (v10) {
          BOOL v12 = 0;
        }
        else {
          BOOL v12 = v7 == -2;
        }
        if (v12) {
          size_t v10 = v6;
        }
        unsigned int v13 = v5 + v11++;
        unsigned int v5 = v13 & v4;
        size_t v6 = (void *)(*(void *)a1 + 16LL * (v13 & v4));
        uint64_t v7 = *v6;
        uint64_t v8 = 1LL;
        if (*v6 == a2) {
          goto LABEL_5;
        }
      }

      uint64_t v8 = 0LL;
      if (v10) {
        size_t v6 = v10;
      }
    }
  }

  else
  {
    size_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

LABEL_5:
  *a3 = v6;
  return v8;
}

  *a2 = v4;
  return v6;
}

  *a2 = v4;
  return v6;
}

  *a2 = v4;
  return v6;
}

  *a2 = v4;
  return v6;
}

  *a3 = v6;
  return v8;
}

  while (1)
  {
    id Ivar = getIvar(isa, a2, a3, a4);
    if (Ivar) {
      break;
    }
    Class isa = isa[1].isa;
    if (!isa) {
      goto LABEL_7;
    }
  }

  *a2 = v3;
  return v4;
}

  *a3 = v6;
  return v8;
}

  *a3 = v10;
  return v11;
}

void objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  unsigned int v4 = *(unint64_t **)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    uint64_t v8 = 4LL;
  }
  *(_DWORD *)(a1 + 16) = v8;
  int v9 = malloc(16LL * v8);
  *(void *)a1 = v9;
  if (v4)
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v10 = 16 * v8;
    do
    {
      *int v9 = -1LL;
      v9 += 2;
      v10 -= 16LL;
    }

    while (v10);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 16 * v3;
      BOOL v12 = v4;
      do
      {
        if (*v12 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::LookupBucketFor<objc_class *>( a1,  *v12,  &v15);
          unsigned int v13 = v15;
          *uint64_t v15 = *v12;
          v13[1] = v12[1];
          ++*(_DWORD *)(a1 + 8);
        }

        v12 += 2;
        v11 -= 16LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v14 = 16 * v8;
    do
    {
      *int v9 = -1LL;
      v9 += 2;
      v14 -= 16LL;
    }

    while (v14);
  }

uint64_t unlockClass(objc_class *a1, uint64_t a2, uint64_t a3, char *a4)
{
  return _objc_sync_exit_kind((uint64_t)a1, 2LL, a3, a4);
}

void initializeNonMetaClass(objc_class *a1, uint64_t a2, uint64_t a3, char *a4)
{
  Class isa = a1[1].isa;
  if (isa)
  {
    int v6 = *(_DWORD *)((uint64_t)isa[4].isa & 0xF00007FFFFFFFF8LL);
    if ((v6 & 1) == 0) {
      int v6 = *(_DWORD *)(*(void *)(((uint64_t)isa->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v6 & 0x20000000) == 0) {
      initializeNonMetaClass(a1[1].isa);
    }
  }

  WAITING_FOR_A_CLASS__initialize_LOCK(a1, a2, a3, a4);
  int v10 = *(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v10 & 1) == 0) {
    int v10 = *(_DWORD *)(*(void *)(((uint64_t)a1->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v10 & 0x20000000) != 0) {
    goto LABEL_16;
  }
  if ((v10 & 0x10000000) == 0) {
    goto LABEL_10;
  }
  if (MultithreadedForkChild != 1 || _thisThreadIsInitializingClass(a1))
  {
LABEL_16:
    unlockClass(a1, v7, v8, v9);
    return;
  }

  WAITING_FOR_A_CLASS__initialize_LOCK(a1, v7, v8, v9);
  _setThisThreadIsInitializingClass(a1);
  performForkChildInitialize(a1, isa, v29, v30);
LABEL_10:
  uint64_t v11 = v32;
  v32[0] = 0LL;
  unint64_t StatusReg = (const void **)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v13 = *((_DWORD *)StatusReg + 6);
  while (!__ldaxr((unsigned int *)&classInitLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_18:
  uint64_t v15 = (unsigned int *)(*(void *)(((uint64_t)a1->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  do
    unsigned int v16 = __ldxr(v15);
  while (__stxr(v16 | 0x10000000, v15));
  size_t v17 = 16LL * willInitializeFuncs;
  unsigned int v31 = willInitializeFuncs;
  if (willInitializeFuncs < 2)
  {
    memcpy(v32, &xmmword_18C509270, 16LL * willInitializeFuncs);
  }

  else
  {
    unsigned int v18 = (const void *)xmmword_18C509270;
    int v19 = malloc(16LL * willInitializeFuncs);
    memcpy(v19, v18, v17);
    v32[0] = v19;
  }

  int v20 = *((_DWORD *)StatusReg + 6);
  while (1)
  {
    unsigned int v21 = __ldxr((unsigned int *)&classInitLock);
    if (v21 != v20) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&classInitLock);
LABEL_28:
  _setThisThreadIsInitializingClass(a1);
  if (MultithreadedForkChild == 1)
  {
    performForkChildInitialize(a1, isa, v22, v23);
  }

  else
  {
    if (v31 >= 2uLL) {
      uint64_t v11 = (void **)v32[0];
    }
    if (v31)
    {
      unsigned int v24 = &v11[2 * v31];
      do
      {
        ((void (*)(void *, objc_class *))*v11)(v11[1], a1);
        v11 += 2;
      }

      while (v11 != v24);
    }

    if (PrintInitializing)
    {
      uint64_t v25 = (const char *)objc_class::nameForLogging(a1);
      _objc_inform("INITIALIZE: thread %p: calling +[%s initialize]", *StatusReg, v25);
    }

    CALLING_SOME__initialize_METHOD(a1);
    if (PrintInitializing)
    {
      uint64_t v28 = (const char *)objc_class::nameForLogging(a1);
      _objc_inform("INITIALIZE: thread %p: finished +[%s initialize]", *StatusReg, v28);
    }

    lockAndFinishInitializing(a1, isa, v26, v27);
  }

  if (v31 >= 2) {
    free(v32[0]);
  }
}

void sub_1800210E8( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, void *a13)
{
}

void sub_180021138(void *a1)
{
}

void sub_180021154()
{
}

void *_setThisThreadIsInitializingClass(objc_class *a1)
{
  InitializingClassList = (unsigned int *)_fetchInitializingClassList(1);
  int v6 = InitializingClassList;
  uint64_t v7 = *InitializingClassList;
  unint64_t result = (void *)*((void *)InitializingClassList + 1);
  if ((int)v7 < 1)
  {
    unsigned int v11 = 0;
  }

  else
  {
    uint64_t v9 = *v6;
    int v10 = (objc_class **)*((void *)v6 + 1);
    do
    {
      if (a1 == *v10) {
        _objc_fatal("thread is already initializing this class!", v3, v4, v5);
      }
      ++v10;
      --v9;
    }

    while (v9);
    do
    {
      if (!result[v9])
      {
        result[v9] = a1;
        return result;
      }

      ++v9;
    }

    while (v7 != v9);
    unsigned int v11 = *v6;
  }

  signed int v12 = (2 * v7) | 1;
  *int v6 = v12;
  unint64_t result = realloc(result, 8LL * v12);
  *((void *)v6 + 1) = result;
  result[v11] = a1;
  if ((int)(v11 + 1) < (int)*v6)
  {
    uint64_t v13 = v11 + 1LL;
    do
      *(void *)(*((void *)v6 + 1) + 8 * v13++) = 0LL;
    while ((int)*v6 > (int)v13);
  }

  return result;
}

void _objc_addWillInitializeClassFunc(void (*a1)(uint64_t), uint64_t a2, const char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&classInitLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v9 = objc_copyRealizedClassList(&v22, a2, a3, a4);
  int v10 = v9;
  uint64_t v11 = v22;
  if (v22)
  {
    signed int v12 = v9;
    do
    {
      int v13 = *(_DWORD *)(*(void *)(*v12 + 32LL) & 0xF00007FFFFFFFF8LL);
      if ((v13 & 1) == 0) {
        int v13 = *(_DWORD *)(*(void *)((*(void *)*v12 & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v13 & 0x10000000) == 0 && (v13 & 0x20000000) == 0) {
        *signed int v12 = 0LL;
      }
      ++v12;
      --v11;
    }

    while (v11);
  }

  if (willInitializeFuncs == 1)
  {
    uint64_t v15 = malloc(0x20uLL);
    *(_OWORD *)uint64_t v15 = xmmword_18C509270;
    v15[2] = a1;
    v15[3] = a2;
    *(void *)&xmmword_18C509270 = v15;
    int v14 = 2;
  }

  else if (willInitializeFuncs)
  {
    *(void *)&xmmword_18C509270 = realloc((void *)xmmword_18C509270, 16LL * (willInitializeFuncs + 1));
    int v16 = willInitializeFuncs;
    size_t v17 = (void (**)(uint64_t))(xmmword_18C509270 + 16LL * willInitializeFuncs);
    *size_t v17 = a1;
    v17[1] = (void (*)(uint64_t))a2;
    int v14 = v16 + 1;
  }

  else
  {
    *(void *)&xmmword_18C509270 = a1;
    *((void *)&xmmword_18C509270 + 1) = a2;
    int v14 = 1;
  }

  willInitializeFuncs = v14;
  int v18 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v19 = __ldxr((unsigned int *)&classInitLock);
    if (v19 != v18) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&classInitLock);
LABEL_24:
  unint64_t v20 = v22;
  if (v22)
  {
    unint64_t v21 = 0LL;
    do
    {
      if (v10[v21])
      {
        a1(a2);
        unint64_t v20 = v22;
      }

      ++v21;
    }

    while (v21 < v20);
  }

  free(v10);
}

void sub_180021440(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&classInitLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *objc_copyRealizedClassList_nolock(unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
  unsigned int v14 = 0;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3321888768LL;
  v13[2] = ___ZL33objc_copyRealizedClassList_nolockPj_block_invoke;
  v13[3] = &__block_descriptor_40_e8_32c49_ZTSKZL33objc_copyRealizedClassList_nolockPjE3__0_e8_B16__0_8l;
  v13[4] = &v14;
  foreach_realized_class((uint64_t)v13, a2, a3, a4);
  if (!v14)
  {
    int v6 = 0LL;
    if (!a1) {
      return v6;
    }
    goto LABEL_3;
  }

  int v12 = 0;
  int v6 = malloc(8LL * (v14 + 1));
  v11[0] = v5;
  v11[1] = 3321888768LL;
  v11[2] = ___ZL33objc_copyRealizedClassList_nolockPj_block_invoke_36;
  v11[3] = &__block_descriptor_48_e8_32c49_ZTSKZL33objc_copyRealizedClassList_nolockPjE3__1_e8_B16__0_8l;
  v11[4] = &v12;
  v11[5] = v6;
  foreach_realized_class((uint64_t)v11, v7, v8, v9);
  v6[v12] = 0LL;
  if (a1) {
LABEL_3:
  }
    *a1 = v14;
  return v6;
}

uint64_t ___ZL33objc_copyRealizedClassList_nolockPj_block_invoke(uint64_t a1)
{
  return 1LL;
}

uint64_t foreach_realized_class(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  int v5 = *(_DWORD *)(gdb_objc_realized_classes + 8);
  if (DisablePreopt) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = _dyld_objc_class_count();
  }
  uint64_t v7 = _firstRealizedClass;
  if (_firstRealizedClass)
  {
    int v8 = 16 * (result + v5) + 16;
    do
    {
      if (!--v8) {
LABEL_20:
      }
        _objc_fatal("Memory corruption in class list.", a2, a3, a4);
      uint64_t v9 = v7;
      while (1)
      {
        if ((*(_WORD *)(v9 + 30) & 4) != 0
          || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, v9), !(_DWORD)result)
          || (uint64_t v10 = *(void *)((*(void *)(v9 + 32) & 0xF00007FFFFFFFF8LL) + 0x10)) == 0)
        {
          while (1)
          {
            uint64_t v10 = *(void *)((*(void *)(v9 + 32) & 0xF00007FFFFFFFF8LL) + 0x18);
            if (v9 == v7 || v10) {
              break;
            }
            uint64_t v9 = *(void *)(v9 + 8);
            if (!--v8) {
              goto LABEL_20;
            }
          }

          if (v9 == v7) {
            break;
          }
        }

        uint64_t v9 = v10;
        if (!--v8) {
          goto LABEL_20;
        }
      }

      uint64_t v7 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 0x18);
    }

    while (v7);
  }

  return result;
}

uint64_t ___ZL33objc_copyRealizedClassList_nolockPj_block_invoke_36(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *v3;
  *uint64_t v3 = v4 + 1;
  *(void *)(v2 + 8 * v4) = a2;
  return 1LL;
}

__n128 __copy_helper_block_e8_32c49_ZTSKZL33objc_copyRealizedClassList_nolockPjE3__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t __copy_helper_block_e8_32c49_ZTSKZL33objc_copyRealizedClassList_nolockPjE3__0( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t method_t_remappedImp_nolock(const method_t *a1)
{
  if (!byte_18C43ED48) {
    return 0LL;
  }
  int v1 = objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::LookupBucketFor<method_t const*>( (unint64_t)a1,  &v3);
  uint64_t result = 0LL;
  if (v1)
  {
  }

  return result;
}

uint64_t objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::LookupBucketFor<method_t const*>( unint64_t a1, void *a2)
{
  if (dword_18C43ED40)
  {
    int v2 = dword_18C43ED40 - 1;
    unsigned int v3 = (dword_18C43ED40 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a1 ^ (a1 >> 4))) ^ (1217387093 * (a1 ^ (a1 >> 4))));
    uint64_t v4 = (void *)(objc::smallMethodIMPMap + 16LL * v3);
    uint64_t v5 = *v4;
    if (*v4 == a1)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      int v8 = 0LL;
      unsigned int v9 = 1;
      while (v5 != -1)
      {
        if (v9 > dword_18C43ED40) {
          objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::FatalCorruptHashTables( (void *)objc::smallMethodIMPMap,  dword_18C43ED40);
        }
        if (v8) {
          BOOL v10 = 0;
        }
        else {
          BOOL v10 = v5 == -2;
        }
        if (v10) {
          int v8 = v4;
        }
        unsigned int v11 = v3 + v9++;
        unsigned int v3 = v11 & v2;
        uint64_t v4 = (void *)(objc::smallMethodIMPMap + 16LL * (v11 & v2));
        uint64_t v5 = *v4;
        uint64_t v6 = 1LL;
        if (*v4 == a1) {
          goto LABEL_5;
        }
      }

      uint64_t v6 = 0LL;
      if (v8) {
        uint64_t v4 = v8;
      }
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

void objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::grow( int a1)
{
  uint64_t v1 = dword_18C43ED40;
  int v2 = (unint64_t *)objc::smallMethodIMPMap;
  unsigned int v3 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = v4 | HIWORD(v4);
  else {
    uint64_t v6 = 4LL;
  }
  dword_18C43ED40 = v6;
  uint64_t v7 = malloc(16LL * v6);
  objc::smallMethodIMPMap = (uint64_t)v7;
  if (v2)
  {
    qword_18C43ED38 = 0LL;
    uint64_t v8 = 16 * v6;
    do
    {
      *uint64_t v7 = -1LL;
      v7 += 2;
      v8 -= 16LL;
    }

    while (v8);
    if ((_DWORD)v1)
    {
      uint64_t v9 = 16 * v1;
      BOOL v10 = v2;
      do
      {
        if (*v10 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::LookupBucketFor<method_t const*>( *v10,  &v13);
          unsigned int v11 = v13;
          *int v13 = *v10;
          v11[1] = v10[1];
          LODWORD(qword_18C43ED38) = qword_18C43ED38 + 1;
        }

        v10 += 2;
        v9 -= 16LL;
      }

      while (v9);
    }

    free(v2);
  }

  else
  {
    qword_18C43ED38 = 0LL;
    uint64_t v12 = 16 * v6;
    do
    {
      *uint64_t v7 = -1LL;
      v7 += 2;
      v12 -= 16LL;
    }

    while (v12);
  }

unint64_t method_t::getCachedDescription(unint64_t this)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (!byte_18C43F068)
  {
    objc::methodDescriptionMap = 0LL;
    qword_18C43F058 = 0LL;
    dword_18C43F060 = 0;
    byte_18C43F068 = 1;
  }

  char v5 = objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( this,  &v16);
  uint64_t v6 = v16;
  if ((v5 & 1) == 0)
  {
    if (4 * (int)qword_18C43F058 + 4 >= (3 * dword_18C43F060))
    {
      objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::grow(2 * dword_18C43F060);
      objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( this,  &v16);
    }

    else
    {
      if (dword_18C43F060 + ~(_DWORD)qword_18C43F058 - HIDWORD(qword_18C43F058) > dword_18C43F060 >> 3)
      {
LABEL_13:
        if (*v6 == -2LL)
        {
          qword_18C43F058 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F058, (int32x2_t)0xFFFFFFFF00000001LL);
        }

        else if (*v6 == -1LL)
        {
          LODWORD(qword_18C43F058) = qword_18C43F058 + 1;
        }

        *uint64_t v6 = this;
        v6[1] = 0LL;
        uint64_t v8 = v6 + 1;
        goto LABEL_18;
      }

      objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::grow(dword_18C43F060);
      objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( this,  &v16);
    }

    uint64_t v6 = v16;
    goto LABEL_13;
  }

  uint64_t v8 = v16 + 1;
  unint64_t v7 = v16[1];
  if (!v7)
  {
LABEL_18:
    uint64_t v9 = malloc(0x10uLL);
    *uint64_t v8 = (unint64_t)v9;
    int v11 = this & 3;
    if ((this & 3) == 0 || v11 == 2)
    {
      BOOL v10 = *(char **)(this & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v11 == 1)
    {
      uint64_t v12 = (int *)(this & 0xFFFFFFFFFFFFFFFCLL);
      else {
        BOOL v10 = (char *)&unk_18E7BB5A8 + *v12;
      }
    }

    *uint64_t v9 = v10;
    *(void *)(*v8 + 8) = method_t::types(this, (uint64_t)v10);
    unint64_t v7 = *v8;
  }

  int v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(runtimeLock);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_180021B1C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t method_t::types@<X0>(unint64_t this@<X0>, uint64_t a2@<X8>)
{
  int v2 = this & 3;
  if ((this & 3) == 0 || v2 == 2) {
    return *(void *)((this & 0xFFFFFFFFFFFFFFFCLL) + 8);
  }
  if (v2 == 1)
  {
    uint64_t v3 = *(int *)((this & 0xFFFFFFFFFFFFFFFCLL) + 4);
    a2 = v3 + (this & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if (!(_DWORD)v3) {
      return 0LL;
    }
  }

  return a2;
}

uint64_t objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( unint64_t a1, void *a2)
{
  if (dword_18C43F060)
  {
    int v2 = dword_18C43F060 - 1;
    unsigned int v3 = (dword_18C43F060 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a1 ^ (a1 >> 4))) ^ (1217387093 * (a1 ^ (a1 >> 4))));
    int v4 = (void *)(objc::methodDescriptionMap + 16LL * v3);
    uint64_t v5 = *v4;
    if (*v4 == a1)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      uint64_t v8 = 0LL;
      unsigned int v9 = 1;
      while (v5 != -1)
      {
        if (v9 > dword_18C43F060) {
          objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::FatalCorruptHashTables( (void *)objc::methodDescriptionMap,  dword_18C43F060);
        }
        if (v8) {
          BOOL v10 = 0;
        }
        else {
          BOOL v10 = v5 == -2;
        }
        if (v10) {
          uint64_t v8 = v4;
        }
        unsigned int v11 = v3 + v9++;
        unsigned int v3 = v11 & v2;
        int v4 = (void *)(objc::methodDescriptionMap + 16LL * (v11 & v2));
        uint64_t v5 = *v4;
        uint64_t v6 = 1LL;
        if (*v4 == a1) {
          goto LABEL_5;
        }
      }

      uint64_t v6 = 0LL;
      if (v8) {
        int v4 = v8;
      }
    }
  }

  else
  {
    int v4 = 0LL;
    uint64_t v6 = 0LL;
  }

void objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::grow( int a1)
{
  uint64_t v1 = dword_18C43F060;
  int v2 = (unint64_t *)objc::methodDescriptionMap;
  unsigned int v3 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = v4 | HIWORD(v4);
  else {
    uint64_t v6 = 4LL;
  }
  dword_18C43F060 = v6;
  unint64_t v7 = malloc(16LL * v6);
  objc::methodDescriptionMap = (uint64_t)v7;
  if (v2)
  {
    qword_18C43F058 = 0LL;
    uint64_t v8 = 16 * v6;
    do
    {
      *unint64_t v7 = -1LL;
      v7 += 2;
      v8 -= 16LL;
    }

    while (v8);
    if ((_DWORD)v1)
    {
      uint64_t v9 = 16 * v1;
      BOOL v10 = v2;
      do
      {
        if (*v10 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( *v10,  &v13);
          unsigned int v11 = v13;
          *int v13 = *v10;
          v11[1] = v10[1];
          LODWORD(qword_18C43F058) = qword_18C43F058 + 1;
        }

        v10 += 2;
        v9 -= 16LL;
      }

      while (v9);
    }

    free(v2);
  }

  else
  {
    qword_18C43F058 = 0LL;
    uint64_t v12 = 16 * v6;
    do
    {
      *unint64_t v7 = -1LL;
      v7 += 2;
      v12 -= 16LL;
    }

    while (v12);
  }

void _objc_setClassCopyFixupHandler(uint64_t a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (classCopyFixupHandlers == 1)
  {
    uint64_t v6 = malloc(0x10uLL);
    *uint64_t v6 = qword_18C43F700;
    v6[1] = a1;
    qword_18C43F700 = (uint64_t)v6;
    int v5 = 2;
  }

  else if (classCopyFixupHandlers)
  {
    qword_18C43F700 = (uint64_t)realloc((void *)qword_18C43F700, 8LL * (classCopyFixupHandlers + 1));
    int v7 = classCopyFixupHandlers;
    *(void *)(qword_18C43F700 + 8LL * classCopyFixupHandlers) = a1;
    int v5 = v7 + 1;
  }

  else
  {
    qword_18C43F700 = a1;
    int v5 = 1;
  }

  classCopyFixupHandlers = v5;
  int v8 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v9 = __ldxr(runtimeLock);
    if (v9 != v8) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
  {
    if ((*((_BYTE *)a1 + 32) & 3) != 0) {
      return (char *)a1 + ((*((_DWORD *)a1 + 14) + 7) & 0xFFFFFFF8) - *((unsigned int *)a1 + 15);
    }
    else {
      return (char *)a1 + 40;
    }
  }

  else
  {
    uint64_t v1 = *(void *)((*(void *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFELL;
    if ((v1 & 1) != 0) {
      unint64_t v2 = *(void *)v2;
    }
    return (char *)a1 + ((*(_DWORD *)(v2 + 8) + 7) & 0xFFFFFFF8);
  }

unint64_t class_rw_t::extAlloc(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v8 = (unint64_t)calloc(0x30uLL, 1uLL);
  *(_DWORD *)(v8 + 40) = ((int)(*(_DWORD *)a2 << 31) >> 31) & 7;
  uint64_t v9 = *(void *)(a2 + 32);
  BOOL v10 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFFELL);
  if ((v9 & 1) != 0) {
    unsigned int v11 = 0LL;
  }
  else {
    unsigned int v11 = (method_list_t *)(v9 & 0xFFFFFFFFFFFFFFFELL);
  }
  unsigned int v39 = v11;
  if (v11)
  {
    if (a3) {
      unsigned int v39 = method_list_t::duplicate(v11, v5, v6, v7);
    }
    else {
      uint64_t v12 = 0LL;
    }
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v8 + 8),  (unint64_t *)&v39,  (const char *)1,  0LL,  v12);
    goto LABEL_11;
  }

  if ((v9 & 1) == 0 || !v10) {
    goto LABEL_11;
  }
  if (!a3)
  {
    *(void *)(v8 + 8) = v9 & 0xFFFFFFFFFFFFFFFCLL | 2;
    goto LABEL_11;
  }

  if (DisablePreattachedCategories)
  {
    uint64_t v18 = *v10;
    uint64_t v19 = v10[1];
    unint64_t v33 = v19 * (unint64_t)v18;
    if ((v33 & 0xFFFFFFFF00000000LL) != 0)
    {
      uint64_t v36 = *v10;
LABEL_65:
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v5, v6, v7, v19, v10, v36);
    }

    uint64_t v34 = (uint64_t)v10 + v33 + 8;
    BOOL v35 = (_DWORD)v19 == 0;
    if ((_DWORD)v19) {
      uint64_t v19 = v19;
    }
    else {
      uint64_t v19 = 0LL;
    }
    if (v35) {
      size_t v17 = (uint64_t *)v34;
    }
    else {
      size_t v17 = (uint64_t *)(v34 - v18);
    }
  }

  else
  {
    size_t v17 = (uint64_t *)(v10 + 2);
    uint64_t v18 = *v10;
    uint64_t v19 = v10[1];
  }

  unint64_t v20 = v19 * (unint64_t)v18;
  if ((v20 & 0xFFFFFFFF00000000LL) != 0)
  {
    uint64_t v36 = v18;
    goto LABEL_65;
  }

  unint64_t v21 = (unint64_t)v10 + v20 + 8;
  if ((unint64_t)v17 < v21)
  {
    while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v17 + 8) & 1) == 0)
    {
      size_t v17 = (uint64_t *)((char *)v17 + v18);
      unsigned int v22 = v18;
    }
  }

  unsigned int v22 = v18;
LABEL_46:
  while (v17 != (uint64_t *)v21)
  {
    int32x2_t v38 = method_list_t::duplicate((method_list_t *)((char *)v17 + (*v17 >> 16)), v5, v6, v7);
    else {
      uint64_t v27 = 0LL;
    }
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v8 + 8),  (unint64_t *)&v38,  (const char *)1,  0LL,  v27);
    uint64_t v29 = *v10;
    uint64_t v28 = v10[1];
    unint64_t v30 = v28 * (unint64_t)v29;
    if ((v30 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v5, v6, v7, v28, v10, v29);
    }
    unsigned int v31 = (uint64_t *)((char *)v17 + v22);
    do
    {
      size_t v17 = v31;
      uint64_t v32 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v31 + 8);
      unsigned int v31 = (uint64_t *)((char *)v31 + v22);
    }

    while ((v32 & 1) == 0);
  }

LABEL_11:
  uint64_t v13 = *(void *)(a2 + 64);
  if ((v13 & 1) != 0) {
    unint64_t v14 = 0LL;
  }
  else {
    unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
  }
  unsigned int v39 = (_DWORD *)v14;
  if (v14)
  {
    else {
      uint64_t v15 = 0LL;
    }
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v8 + 16),  (unint64_t *)&v39,  (const char *)1,  0LL,  v15);
    uint64_t v16 = a1;
  }

  else
  {
    uint64_t v16 = a1;
    if ((v13 & 1) != 0 && (v13 & 0xFFFFFFFFFFFFFFFELL) != 0) {
      *(void *)(v8 + 16) = v13 & 0xFFFFFFFFFFFFFFFCLL | 2;
    }
  }

  uint64_t v23 = *(void *)(a2 + 40);
  if ((v23 & 1) != 0) {
    unint64_t v24 = 0LL;
  }
  else {
    unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
  }
  unsigned int v39 = (_DWORD *)v24;
  if (v24)
  {
    else {
      uint64_t v25 = 0LL;
    }
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v8 + 24),  (unint64_t *)&v39,  (const char *)1,  0LL,  v25);
  }

  else if ((v23 & 1) != 0 && (v23 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    *(void *)(v8 + 24) = v23 & 0xFFFFFFFFFFFFFFFCLL | 2;
  }

  *(void *)unint64_t v8 = a2;
  atomic_store(v8 | 1, (unint64_t *)(v16 + 8));
  return v8;
}

_DWORD *method_list_t::duplicate(method_list_t *this, uint64_t a2, const char *a3, char *a4)
{
  unint64_t v5 = *(unsigned int *)this;
  unint64_t v6 = ((unint64_t)this + 8) & 0xFFFFFFFFFFFFFFFCLL | (v5 >> 31);
  entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd((int *)this, a2, a3, a4);
  uint64_t v10 = v9;
  else {
    uint64_t v11 = 0LL;
  }
  MethodList = method_list_t::allocateMethodList((method_list_t *)*((unsigned int *)this + 1), v11, v7, v8);
  if (v6 != v10)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    unint64_t v17 = *MethodList;
    uint64_t v18 = (unsigned __int16)v5 & 0xFFFC;
    uint64_t v19 = (unsigned __int16)v17 & 0xFFFC;
    unint64_t v20 = (unint64_t)(MethodList + 2) & 0xFFFFFFFFFFFFFFFCLL | (v17 >> 31);
    unint64_t v21 = dataSegmentsRanges;
    unint64_t v35 = *(void *)algn_18C43FCB8;
    do
    {
      uint64_t v22 = v20 + v16;
      uint64_t v23 = v6 + v15;
      int v24 = (v20 + v16) & 3;
      if (v24)
      {
        if (v24 != 2)
        {
          if (v24 == 1) {
            _objc_fatal("Cannot assign to small method %p from method %p", v12, v13, v14, v20 + v16, v6 + v15);
          }
          goto LABEL_25;
        }

        uint64_t v25 = (void *)(v22 & 0xFFFFFFFFFFFFFFFCLL);
        v25[2] = method_t::imp(v6 + v15, 0);
        uint64_t v29 = v6 + v15;
        int v30 = (v6 + v15) & 3;
        if (!v30 || v30 == 2)
        {
          uint64_t v32 = (char **)(v29 & 0xFFFFFFFFFFFFFFFCLL);
          goto LABEL_23;
        }

        if (v30 == 1)
        {
          uint64_t v28 = (int *)(v29 & 0xFFFFFFFFFFFFFFFCLL);
          goto LABEL_18;
        }
      }

      else
      {
        uint64_t v25 = (void *)(v22 & 0xFFFFFFFFFFFFFFFCLL);
        v25[2] = method_t::imp(v6 + v15, 0);
        int v27 = v23 & 3;
        if ((v23 & 3) == 0 || v27 == 2)
        {
          uint64_t v32 = (char **)(v23 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_23:
          uint64_t v26 = *v32;
          goto LABEL_24;
        }

        if (v27 == 1)
        {
          uint64_t v28 = (int *)(v23 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_18:
          uint64_t v31 = *v28;
          else {
            uint64_t v26 = (char *)&unk_18E7BB5A8 + v31;
          }
        }
      }

LABEL_24:
      void *v25 = v26;
      v25[1] = method_t::types(v6 + v15, (uint64_t)v26);
LABEL_25:
      v16 += v19;
      v15 += v18;
    }

    while (v6 + v15 != v10);
  }

  return MethodList;
}

    _objc_fatal("Lazily named class %p with no lazy name handler registered", a2, a3, a4, v4);
  }

  list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::skipEmptyLists((uint64_t **)a1);
  return a1;
}

        if ((v16 & 1) == 0) {
          os_unfair_lock_lock_with_options();
        }
        uint64_t v25 = (void *)*((void *)v12 + 1);
        *((void *)v12 + 1) = copyPropertyAttributeString((uint64_t)a3, a4);
        uint64_t v26 = *(_DWORD *)(StatusReg + 24);
        while (1)
        {
          int v27 = __ldxr(runtimeLock);
          if (v27 != v26) {
            break;
          }
          if (!__stlxr(0, runtimeLock)) {
            return 1LL;
          }
        }

    unint64_t v14 = 0;
    return (v4 - v14);
  }

  return result;
}

void list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( unint64_t *a1, unint64_t *a2, const char *a3, char *a4, const char *a5)
{
  if ((_DWORD)a3)
  {
    LODWORD(v6) = (_DWORD)a3;
    unint64_t v9 = *a1;
    if ((_DWORD)a4)
    {
      if ((*a1 & 3) == 2 && (v9 & 0xFFFFFFFFFFFFFFFCLL) != 0)
      {
        if (a5) {
          _objc_inform( "PREOPTIMIZATION: not attaching preoptimized category, class's %s list %p is still original.",  a5,  (const void *)(v9 & 0xFFFFFFFFFFFFFFFCLL));
        }
        return;
      }

      if (a5)
      {
        _objc_inform("PREOPTIMIZATION: copying preoptimized category, class's %s list has already been copied.", a5);
        unint64_t v9 = *a1;
      }
    }

    if ((_DWORD)v6 == 1 && v9 <= 3)
    {
      unint64_t v11 = *a2;
LABEL_13:
      *a1 = v11;
LABEL_36:
      list_array_tt<unsigned long,protocol_list_t,RawPtr>::validate(v11, (uint64_t)a2, a3, a4);
      return;
    }

    if (v9 < 4)
    {
      if (v9)
      {
        unint64_t v12 = 0LL;
LABEL_30:
        if (v12) {
          unsigned int v22 = v6 + 1;
        }
        else {
          unsigned int v22 = v6;
        }
        unint64_t v23 = (unint64_t)malloc(8LL * v22 + 8);
        uint64_t v24 = v23 | 1;
        *a1 = v23 | 1;
        *(_DWORD *)unint64_t v23 = v22;
        if (v12) {
          *(void *)(v23 + 8LL * v6 + 8) = v12;
        }
        memcpy((void *)(v23 + 8), a2, 8LL * v6);
        unint64_t v11 = v24;
        goto LABEL_36;
      }

LABEL_29:
      unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFCLL;
      goto LABEL_30;
    }

    unint64_t v13 = v9 & 3;
    if ((v9 & 3) == 0) {
      goto LABEL_29;
    }
    unint64_t v14 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
    if (v13 == 1 && v14)
    {
      unsigned int v15 = *v14;
      unsigned int v16 = *v14 + v6;
      unint64_t v17 = malloc(8LL * v16 + 8);
      unint64_t v18 = (unint64_t)v17;
      *unint64_t v17 = v16;
      uint64_t v19 = v15 - 1;
      if ((int)(v15 - 1) >= 0)
      {
        do
        {
          *(void *)&v17[2 * (v6 + v19) + 2] = *(void *)&v14[2 * v19 + 2];
          --v19;
        }

        while (v19 != -1);
      }

      unint64_t v20 = v17 + 2;
      else {
        unsigned int v21 = v6;
      }
      memcpy(v20, a2, 8LL * v21);
      free(v14);
      unint64_t v11 = v18 | 1;
      goto LABEL_13;
    }

    if (v13 == 2 && v14)
    {
      if (DisablePreattachedCategories)
      {
        uint64_t v26 = *v14;
        uint64_t v27 = v14[1];
        unint64_t v40 = v27 * (unint64_t)v26;
        if ((v40 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v27,  v14,  *v14);
        }
        uint64_t v41 = (uint64_t)v14 + v40 + 8;
        BOOL v42 = (_DWORD)v27 == 0;
        if ((_DWORD)v27) {
          uint64_t v27 = v27;
        }
        else {
          uint64_t v27 = 0LL;
        }
        if (v42) {
          uint64_t v25 = (unsigned __int16 *)v41;
        }
        else {
          uint64_t v25 = (unsigned __int16 *)(v41 - v26);
        }
      }

      else
      {
        uint64_t v25 = (unsigned __int16 *)(v14 + 2);
        uint64_t v26 = *v14;
        uint64_t v27 = v14[1];
      }

      unint64_t v28 = v27 * (unint64_t)v26;
      if ((v28 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v27, v14, v26);
      }
      unint64_t v29 = (unint64_t)v14 + v28 + 8;
      if ((unint64_t)v25 < v29)
      {
        while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v25 + 8) & 1) == 0)
        {
          uint64_t v25 = (unsigned __int16 *)((char *)v25 + v26);
          unsigned int v30 = v26;
        }
      }

      unsigned int v30 = v26;
LABEL_47:
      unsigned int v31 = relative_list_list_t<protocol_list_t>::countLists(v14, (uint64_t)a2, a3, a4) + v6;
      unint64_t v32 = (unint64_t)malloc(8LL * v31 + 8);
      *(_DWORD *)unint64_t v32 = v31;
      else {
        uint64_t v6 = v6;
      }
      memcpy((void *)(v32 + 8), a2, 8LL * v6);
      unint64_t v33 = &unk_18C43F000;
      if (v6 < v31)
      {
        do
        {
          uint64_t v34 = *(void *)v25;
          if (a5)
          {
            _objc_inform("PREOPTIMIZATION: copying preoptimized %s list %p", a5, (char *)v25 + (v34 >> 16));
            unint64_t v33 = (void *)&unk_18C43F000;
            uint64_t v34 = *(void *)v25;
          }

          *(void *)(v32 + 8 * v6 + 8) = (char *)v25 + (v34 >> 16);
          uint64_t v36 = *v14;
          uint64_t v35 = v14[1];
          unint64_t v37 = v35 * (unint64_t)v36;
          if ((v37 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v35,  v14,  v36);
          }
          int32x2_t v38 = (unsigned __int16 *)((char *)v25 + v30);
          do
          {
            uint64_t v25 = v38;
            uint64_t v39 = *(void *)(v33[424] + 8LL * *v38 + 8);
            int32x2_t v38 = (unsigned __int16 *)((char *)v38 + v30);
          }

          while ((v39 & 1) == 0);
          ++v6;
        }

        while (v31 != (_DWORD)v6);
      }

      unint64_t v11 = v32 | 1;
      goto LABEL_13;
    }
  }

unint64_t list_array_tt<unsigned long,protocol_list_t,RawPtr>::validate( unint64_t result, uint64_t a2, const char *a3, char *a4)
{
  unint64_t v6 = result & 3;
  int v7 = (unsigned int *)(result & 0xFFFFFFFFFFFFFFFCLL);
  BOOL v8 = (result & 0xFFFFFFFFFFFFFFFCLL) == 0 || (result & 3) != 0;
  if (!v8)
  {
    uint64_t v9 = 0LL;
    unint64_t v11 = 0LL;
    uint64_t v10 = (unsigned int *)(result & 0xFFFFFFFFFFFFFFFCLL);
LABEL_14:
    BOOL v12 = !v8;
    BOOL v13 = v6 != 2;
    goto LABEL_15;
  }

  if (result >= 4)
  {
    if (v6 == 1 && v7)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v7 + 2;
    }

    else
    {
      if (v6 == 2) {
        uint64_t v10 = (unsigned int *)(result & 0xFFFFFFFFFFFFFFFCLL);
      }
      else {
        uint64_t v10 = 0LL;
      }
      if (v10)
      {
        if (DisablePreattachedCategories)
        {
          uint64_t v23 = *v10;
          uint64_t v27 = v10[1];
          unint64_t v28 = v27 * (unint64_t)v23;
          if ((v28 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v27, v10, v23);
          }
          uint64_t v29 = (uint64_t)v10 + v28 + 8;
          if ((_DWORD)v27) {
            uint64_t v24 = v27;
          }
          else {
            uint64_t v24 = 0LL;
          }
          if ((_DWORD)v27) {
            unsigned int v4 = (unsigned __int16 *)(v29 - v23);
          }
          else {
            unsigned int v4 = (unsigned __int16 *)v29;
          }
        }

        else
        {
          unsigned int v4 = (unsigned __int16 *)(v10 + 2);
          uint64_t v23 = *v10;
          uint64_t v24 = v10[1];
        }

        unint64_t v25 = v24 * (unint64_t)v23;
        if ((v25 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v24, v10, v23);
        }
        unint64_t v26 = (unint64_t)v10 + v25 + 8;
        if ((unint64_t)v4 < v26)
        {
          while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v4 + 8) & 1) == 0)
          {
            unsigned int v4 = (unsigned __int16 *)((char *)v4 + v23);
            uint64_t v5 = v23 | 0x100000000LL;
            uint64_t v23 = v5;
          }
        }

        uint64_t v5 = v23;
LABEL_46:
        uint64_t v9 = v5;
      }

      else
      {
        uint64_t v9 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  BOOL v12 = v6 != 1;
  if (v6 == 1 && v7)
  {
    unint64_t v11 = (unint64_t)&v7[2 * *v7 + 2];
    goto LABEL_14;
  }

  unint64_t v11 = 0LL;
  BOOL v13 = v6 != 2;
  if (v6 == 2 && v7)
  {
    uint64_t v21 = *v7;
    uint64_t v20 = v7[1];
    unint64_t v22 = v20 * (unint64_t)v21;
    if ((v22 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  a3,  a4,  v20,  result & 0xFFFFFFFFFFFFFFFCLL,  v21);
    }
    BOOL v13 = 0;
    uint64_t v5 = (uint64_t)v7 + v22 + 8;
    unint64_t v11 = result & 0xFFFFFFFFFFFFFFFCLL;
  }

  while (1)
  {
    while (1)
    {
LABEL_15:
      while (!v6)
      {
        BOOL v19 = v10 == (unsigned int *)v11;
        uint64_t v10 = 0LL;
        if (v19) {
          return result;
        }
      }

      if (!v12) {
        break;
      }
      if (!v13)
      {
        uint64_t v14 = *v10;
        uint64_t v15 = v10[1];
        uint64_t v16 = v15 * (unint64_t)v14;
        if ((v16 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v16, a3, a4, v15, v10, v14);
        }
        unint64_t v17 = (unint64_t)v10 + v16 + 8;
        uint64_t result = (unint64_t)v4 + v9;
        do
        {
          unsigned int v4 = (unsigned __int16 *)result;
          if (result >= v17) {
            break;
          }
          uint64_t v18 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)result + 8);
          result += v9;
        }

        while ((v18 & 1) == 0);
      }
    }

    v10 += 2;
  }

  return result;
}

uint64_t relative_list_list_t<protocol_list_t>::countLists( unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = v5 * (unint64_t)v4;
  if ((v6 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v5, a1, v4);
  }
  int v7 = (unsigned __int16 *)(a1 + 2);
  unint64_t v8 = (unint64_t)a1 + v6 + 8;
  if (DisablePreattachedCategories)
  {
    if (!(_DWORD)v5) {
      return 0LL;
    }
    int v7 = (unsigned __int16 *)(v8 - v4);
  }

  for (; (unint64_t)v7 < v8; int v7 = (unsigned __int16 *)((char *)v7 + v4))
  {
    if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v7 + 8) & 1) != 0) {
      break;
    }
  }

  uint64_t result = 0LL;
  do
  {
    do
      int v7 = (unsigned __int16 *)((char *)v7 + v4);
    while ((unint64_t)v7 < v8 && (*(void *)(objc_debug_headerInfoRWs + 8LL * *v7 + 8) & 1) == 0);
    ++result;
  }

  while ((unint64_t)v7 < v8);
  return result;
}

unint64_t entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd( int *a1, uint64_t a2, const char *a3, char *a4)
{
  int v5 = *a1;
  uint64_t v4 = a1[1];
  return (unsigned __int16)v5 & 0xFFFC | (unint64_t)(v4 << 32);
}

_DWORD *method_list_t::allocateMethodList(method_list_t *this, uint64_t a2, const char *a3, char *a4)
{
  int v4 = (int)this;
  uint64_t v5 = 24LL * this;
  if ((v5 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: count %u with entsize %u", a2, a3, a4, 24LL, this);
  }
  int v6 = a2;
  uint64_t result = calloc(v5 + 8LL, 1uLL);
  _DWORD *result = v6 | 0x18;
  result[1] = v4;
  return result;
}

unint64_t method_t::imp(unint64_t this, int a2)
{
  unint64_t v2 = (const method_t *)this;
  int v3 = this & 3;
  if ((this & 3) == 0 || v3 == 2) {
    return *(void *)((this & 0xFFFFFFFFFFFFFFFCLL) + 16);
  }
  if (v3 == 1)
  {
    unint64_t v4 = *(int *)((this & 0xFFFFFFFFFFFFFFFCLL) + 8) + (this & 0xFFFFFFFFFFFFFFFCLL) + 8;
    if (a2)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v6 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)&runtimeLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_12:
      uint64_t v8 = method_t_remappedImp_nolock(v2);
      int v9 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v10 = __ldxr((unsigned int *)&runtimeLock);
        if (v10 != v9) {
          break;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
    }

    else
    {
      uint64_t v8 = method_t_remappedImp_nolock((const method_t *)this);
    }

LABEL_17:
    if (v8) {
      return v8;
    }
    else {
      return v4;
    }
  }

  return this;
}

  unint64_t v22 = (uint64_t (***)(void, uint64_t))nonMetaClasses();
  uint64_t v23 = (uint64_t)a1->isa & 0xFFFFFFFF8LL;
  BOOL v13 = (**v22)(v22, v23);
  uint64_t v14 = (uint64_t)v22;
  uint64_t v15 = (const char *)v23;
  return NXMapInsertWithHash(v14, (uint64_t)v15, v13, (uint64_t)a1);
}

    free((void *)((uint64_t)v6->isa & 0xFFFFFFFFFFFLL));
  }

  if (!v3) {
    goto LABEL_55;
  }
  uint64_t v15 = v3 + 1;
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::begin((uint64_t)v72, v3 + 1, v8, v9);
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::end((uint64_t)v71, v3 + 1, v16, v17);
  while (!list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v72,  v71))
  {
    BOOL v19 = v73;
    uint64_t v20 = (void *)method_t::types((unint64_t)v73, v18);
    if (v20)
    {
      uint64_t v24 = v20;
      if (malloc_size(v20)) {
        free(v24);
      }
    }

    if (byte_18C43F068
      && objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::LookupBucketFor<method_t const*>( (unint64_t)v19,  &v74))
    {
      *v74 = -2LL;
      unint64_t v25 = vadd_s32((int32x2_t)qword_18C43F058, (int32x2_t)0x1FFFFFFFFLL);
      qword_18C43F058 = (uint64_t)v25;
      if (v25.i32[0])
      {
      }

      else if (dword_18C43F060)
      {
        free((void *)objc::methodDescriptionMap);
        objc::methodDescriptionMap = 0LL;
        qword_18C43F058 = 0LL;
        dword_18C43F060 = 0;
      }

      else
      {
        qword_18C43F058 = 0LL;
      }
    }

    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator++(v72, v21, v22, v23);
  }

  unint64_t v26 = *v15;
  uint64_t v27 = *v15 & 3;
  unint64_t v28 = (_DWORD *)(*v15 & 0xFFFFFFFFFFFFFFFCLL);
  if (v27 != 1 || v28 == 0LL)
  {
    if (v27) {
      unsigned int v30 = 1;
    }
    else {
      unsigned int v30 = v28 == 0LL;
    }
    unint64_t v28 = (_DWORD *)(v26 & 0xFFFFFFFFFFFFFFCLL);
    if (v30 || v28 == 0LL) {
      goto LABEL_55;
    }
  }

  else if (*v28)
  {
    unint64_t v32 = 0LL;
    do
    {
      unint64_t v33 = *(void *)&v28[2 * v32 + 2];
      uint64_t v34 = (void *)(v33 & 0xFFFFFFFFFFFFFFFLL);
      ++v32;
    }

    while (v32 < *v28);
  }

  if (malloc_size(v28)) {
    free(v28);
  }
LABEL_55:
  uint64_t v35 = *(unsigned int **)(v5 + 48);
  if (v35)
  {
    unint64_t v37 = *v35;
    uint64_t v36 = v35[1];
    int32x2_t v38 = v36 * (unint64_t)v37;
    if ((v38 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v7,  v8,  v9,  v36,  *(void *)(v5 + 48),  v37);
    }
    if ((_DWORD)v38)
    {
      uint64_t v39 = 0LL;
      unint64_t v40 = v38;
      do
      {
        uint64_t v41 = *(void **)((char *)v35 + v39 + 8);
        BOOL v42 = *(void **)((char *)v35 + v39 + 16);
        v43 = *(void **)((char *)v35 + v39 + 24);
        v39 += v37;
      }

      while (v40 != v39);
    }

    if (malloc_size(v35)) {
      free(v35);
    }
  }

  if (!v3) {
    goto LABEL_119;
  }
  uint64_t v44 = v3 + 2;
  list_array_tt<property_t,property_list_t,RawPtr>::begin((uint64_t)v72, v3 + 2, v8, v9);
  list_array_tt<property_t,property_list_t,RawPtr>::end((uint64_t)v71, v3 + 2, v45, v46);
  while (!list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v72,  v71))
  {
    uint64_t v50 = v73;
    v51 = *(void **)v73;
    v52 = (void *)*((void *)v50 + 1);
    list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::operator++(v72, v47, v48, v49);
  }

  v53 = *v44;
  v54 = *v44 & 3;
  v55 = (_DWORD *)(*v44 & 0xFFFFFFFFFFFFFFFCLL);
  if (v54 != 1 || v55 == 0LL)
  {
    if (v54) {
      v57 = 1;
    }
    else {
      v57 = v55 == 0LL;
    }
    v55 = (_DWORD *)(v53 & 0xFFFFFFFFFFFFFFCLL);
    if (v57 || v55 == 0LL) {
      goto LABEL_102;
    }
  }

  else if (*v55)
  {
    v59 = 0LL;
    do
    {
      v60 = *(void *)&v55[2 * v59 + 2];
      v61 = (void *)(v60 & 0xFFFFFFFFFFFFFFFLL);
      ++v59;
    }

    while (v59 < *v55);
  }

  if (malloc_size(v55)) {
    free(v55);
  }
LABEL_102:
  v62 = v3[3];
  v63 = (_DWORD *)(v62 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v62 & 3) == 1 && v63 != 0LL)
  {
    if (*v63)
    {
      v65 = 0LL;
      do
      {
        v66 = *(void *)&v63[2 * v65 + 2];
        v67 = (void *)(v66 & 0xFFFFFFFFFFFFFFFLL);
        ++v65;
      }

      while (v65 < *v63);
    }

    goto LABEL_117;
  }

  if ((v62 & 3) == 0)
  {
    if (v63)
    {
      v63 = (_DWORD *)(v62 & 0xFFFFFFFFFFFFFFCLL);
      if ((v62 & 0xFFFFFFFFFFFFFFCLL) != 0)
      {
LABEL_117:
        if (malloc_size(v63)) {
          free(v63);
        }
      }
    }
  }

  int v9 = *v8;
  unsigned int v10 = *v8 & 0xF9F7FFFF | 0x2000000;
  do
  {
    unint64_t v11 = __ldaxr(v8);
    if (v11 != v9)
    {
      __clrex();
      goto LABEL_17;
    }
  }

  while (__stlxr(v10, v8));
  uint64_t v18 = (unsigned int *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL);
LABEL_29:
  BOOL v19 = *v18;
  uint64_t v20 = *v18 & 0xF9F7FFFF | 0x2000000;
  do
  {
    uint64_t v21 = __ldaxr(v18);
    if (v21 != v19)
    {
      __clrex();
      goto LABEL_29;
    }
  }

  while (__stlxr(v20, v18));
  unint64_t v22 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  uint64_t v23 = (void *)(v22 & 0xFFFFFFFFFFFFFFFELL);
  if ((v22 & 1) != 0) {
    uint64_t v23 = (void *)*v23;
  }
  uint64_t v24 = (char *)atomic_load(v23 + 3);
  addNamedClass(cls, v24, 0LL);
LABEL_24:
  uint64_t v16 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unint64_t v17 = __ldxr(runtimeLock);
    if (v17 != v16) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

    BOOL v13 = *a1;
    goto LABEL_18;
  }

  unsigned int v6 = *((unsigned __int8 *)a1 + 8);
  int v7 = &loadImageCallbacks[4 * loadImageCallbacks[0]];
  *((void *)v7 + 1) = *a1;
  *((_BYTE *)v7 + 16) = v6;
LABEL_15:
  loadImageCallbacks[0] = v5 + 1;
}

void sub_180022BB4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t remapClass(unint64_t result)
{
  if (result && byte_18C43F048 && dword_18C43F040)
  {
    LODWORD(v1) = (dword_18C43F040 - 1) & (bswap64(0x8A970BE7488FDA55LL * (result ^ (result >> 4))) ^ (1217387093 * (result ^ (result >> 4))));
    uint64_t v2 = (uint64_t *)(remappedClasses(BOOL)::remapped_class_map + 16LL * v1);
    uint64_t v3 = *v2;
    if (*v2 == result)
    {
LABEL_5:
    }

    else
    {
      unsigned int v4 = 1;
      while (v3 != -1)
      {
        if (v4 > dword_18C43F040) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::FatalCorruptHashTables( (void *)remappedClasses(BOOL)::remapped_class_map,  dword_18C43F040);
        }
        int v5 = v1 + v4++;
        uint64_t v1 = v5 & (dword_18C43F040 - 1);
        uint64_t v3 = *(void *)(remappedClasses(BOOL)::remapped_class_map + 16LL * v1);
        if (v3 == result)
        {
          uint64_t v2 = (uint64_t *)(remappedClasses(BOOL)::remapped_class_map + 16 * v1);
          goto LABEL_5;
        }
      }
    }
  }

  return result;
}

uint64_t objc_loadClassref(uint64_t *a1)
{
  uint64_t result = *a1;
  if ((result & 1) != 0)
  {
    uint64_t result = (*(uint64_t (**)(unint64_t, void))((result & 0xFFFFFFFFFFFFFFFELL) + 8))( result & 0xFFFFFFFFFFFFFFFELL,  0LL);
    *a1 = result;
  }

  return result;
}

__objc2_class *class_initialize(objc_class *a1, objc_object *a2, uint64_t a3, char *a4)
{
  unsigned int v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v6, runtimeLock)) {
      return initializeAndMaybeRelock(a1, a2, 0LL, a4);
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
  return initializeAndMaybeRelock(a1, a2, 0LL, a4);
}

__objc2_class *initializeAndMaybeRelock(objc_class *a1, objc_object *a2, const char *a3, char *a4)
{
  int v4 = (int)a3;
  int v5 = (__objc2_class *)a1;
  int v6 = *(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v6 & 1) == 0) {
    int v6 = *(_DWORD *)(*(void *)(((uint64_t)a1->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v6 & 0x20000000) != 0)
  {
    if ((a3 & 1) == 0)
    {
      int v13 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      while (1)
      {
        unsigned int v14 = __ldxr((unsigned int *)&runtimeLock);
        if (v14 != v13) {
          break;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
    }
  }

  else
  {
    MaybeUnrealizedNonMetaClass = getMaybeUnrealizedNonMetaClass(a1, a2, a3, a4);
    unint64_t v11 = MaybeUnrealizedNonMetaClass;
    if ((unint64_t)&MaybeUnrealizedNonMetaClass->isa[-1].isa + 7 >= 0xF
      && (*(_DWORD *)((uint64_t)MaybeUnrealizedNonMetaClass[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
    {
      int v15 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      while (1)
      {
        unsigned int v16 = __ldxr((unsigned int *)&runtimeLock);
        if (v16 != v15) {
          break;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
    }

    else
    {
      BOOL v12 = realizeClassMaybeSwiftMaybeRelock(MaybeUnrealizedNonMetaClass, 0);
      unint64_t v11 = v12;
      if (v12)
      {
        if (((unint64_t)v12 & 0x8000000000000000LL) != 0)
        {
          int v5 = (__objc2_class *)objc_debug_taggedpointer_classes[v12 & 7];
        }

        else
        {
          int v5 = (__objc2_class *)((uint64_t)v12->isa & 0xFFFFFFFF8LL);
        }
      }

      else
      {
        int v5 = 0LL;
      }
    }

objc_class *getMaybeUnrealizedNonMetaClass(objc_class *a1, objc_object *a2, const char *a3, char *a4)
{
  if ((HIWORD(a1[3].isa) & 4) == 0) {
    return a1;
  }
  if ((objc_class *)((uint64_t)a1->isa & 0xFFFFFFFF8LL) != a1
    || (Class v5 = a1[1].isa, (objc_class *)((uint64_t)v5->isa & 0xFFFFFFFF8LL) != a1))
  {
    if (!a2 || (unint64_t v6 = remapClass((unint64_t)a2)) == 0)
    {
LABEL_10:
      Class isa = a1[4].isa;
      uint64_t v8 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
      if (((unint64_t)isa & 0x8000000000000000LL) != 0)
      {
        uint64_t v9 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
        unsigned int v10 = (void *)(v9 & 0xFFFFFFFFFFFFFFFELL);
        if ((v9 & 1) != 0) {
          unsigned int v10 = (void *)*v10;
        }
        Class v5 = (Class)v10[2];
        if (v5) {
          return v5;
        }
        uint64_t v11 = v8[1];
        uint64_t v8 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
        if ((v11 & 1) != 0) {
          uint64_t v8 = (void *)*v8;
        }
      }

      else
      {
        Class v5 = *(Class *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 0x10);
        if (v5) {
          return v5;
        }
      }

      BOOL v12 = (char *)atomic_load(v8 + 3);
      if (!v12) {
        BOOL v12 = (char *)objc_class::installMangledNameForLazilyNamedClass(a1, (uint64_t)a2, a3, a4);
      }
      ClassExceptSomeSwift = getClassExceptSomeSwift(v12);
      if (ClassExceptSomeSwift
        && (Class v5 = (Class)ClassExceptSomeSwift, (objc_class *)(*(void *)ClassExceptSomeSwift & 0xFFFFFFFF8LL) == a1))
      {
        ++getMaybeUnrealizedNonMetaClass(objc_class *,objc_object *)::named;
      }

      else
      {
        unsigned int v14 = (uint64_t (***)(void, objc_class *))nonMetaClasses();
        unsigned int v15 = (**v14)(v14, a1);
        else {
          Class v5 = (Class)v20[0];
        }
        if (v5)
        {
          ++getMaybeUnrealizedNonMetaClass(objc_class *,objc_object *)::secondary;
        }

        else
        {
          if (DisablePreopt) {
            goto LABEL_39;
          }
          if ((preoptimized & 1) == 0) {
            goto LABEL_39;
          }
          unint64_t v21 = 0LL;
          objc_class::mangledName(a1, v16, v17, v18);
          v20[0] = MEMORY[0x1895F87A8];
          v20[1] = 3321888768LL;
          v20[2] = __getPreoptimizedClassesWithMetaClass_block_invoke;
          v20[3] = &__block_descriptor_48_e8_32c48_ZTSKZ35getPreoptimizedClassesWithMetaClassE3__0_e16_v28__0_v8B16_B20l;
          v20[4] = &v21;
          v20[5] = a1;
          _dyld_for_each_objc_class();
          Class v5 = (Class)v21;
          if (!v21) {
LABEL_39:
          }
            _objc_fatal("no class for metaclass %p", v16, v17, v18, a1);
          if (PrintInitializing)
          {
            if (dataSegmentsRanges > v21 || *(void *)algn_18C43FCB8 <= v21)
            {
              ++getMaybeUnrealizedNonMetaClass(objc_class *,objc_object *)::dyld3;
              _objc_inform("INITIALIZE: %d/%d (%g%%) successful dyld closure metaclass lookups");
            }

            else
            {
              ++getMaybeUnrealizedNonMetaClass(objc_class *,objc_object *)::sharedcache;
              _objc_inform("INITIALIZE: %d/%d (%g%%) successful shared cache metaclass lookups");
            }
          }
        }
      }

      return v5;
    }

    Class v5 = (Class)v6;
    while ((objc_class *)((uint64_t)v5->isa & 0xFFFFFFFF8LL) != a1)
    {
      Class v5 = v5[1].isa;
      if (!v5) {
        goto LABEL_10;
      }
    }
  }

  return v5;
}

objc_class *realizeClassMaybeSwiftMaybeRelock(objc_class *this, int a2)
{
  uint64_t v3 = this;
  if (((uint64_t)this[4].isa & 3) != 0)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v5 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v6 = __ldxr((unsigned int *)&runtimeLock);
      if (v6 != v5) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_12:
    Class isa = v3[4].isa;
    unsigned int v10 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
    if (((unint64_t)isa & 0x8000000000000000LL) != 0)
    {
      uint64_t v11 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
      unsigned int v10 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
      if ((v11 & 1) != 0) {
        unsigned int v10 = (void *)*v10;
      }
    }

    if ((*(_BYTE *)v10 & 0x40) != 0 && (BOOL v12 = (uint64_t (*)(objc_class *, void))v10[9]) != 0LL)
    {
      if (PrintConnecting)
      {
        unint64_t v26 = (const char *)objc_class::nameForLogging(v3);
        _objc_inform("CLASS: calling Swift metadata initializer for class '%s' (%p)", v26, v3);
      }

      uint64_t v13 = v12(v3, 0LL);
      if ((objc_class *)v13 == v3)
      {
LABEL_41:
        if (a2)
        {
          unsigned int v23 = *(_DWORD *)(StatusReg + 24);
          while (!__ldaxr((unsigned int *)&runtimeLock))
          {
          }

          __clrex();
          os_unfair_lock_lock_with_options();
        }

        return v3;
      }

      unsigned int v14 = (objc_class *)v13;
      unsigned int v15 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)&runtimeLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_35:
      addRemappedClass(v3, v14);
      int v21 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v22 = __ldxr((unsigned int *)&runtimeLock);
        if (v22 != v21) {
          break;
        }
      }
    }

    else
    {
      unsigned int v17 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)&runtimeLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_29:
      unsigned int v14 = realizeClassWithoutSwift(v3, 0LL);
      int v19 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v20 = __ldxr((unsigned int *)&runtimeLock);
        if (v20 != v19) {
          break;
        }
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_40:
    uint64_t v3 = v14;
    goto LABEL_41;
  }

  uint64_t v3 = realizeClassWithoutSwift(this, 0LL);
  if ((a2 & 1) == 0)
  {
    int v7 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (1)
    {
      unsigned int v8 = __ldxr((unsigned int *)&runtimeLock);
      if (v8 != v7) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
  }

  return v3;
}

void sub_180023430(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_class *realizeClassWithoutSwift(objc_class *a1, objc_class *a2)
{
  uint64_t v2 = a1;
  if (!a1) {
    return v2;
  }
  Class isa = a1[4].isa;
  uint64_t v4 = (unint64_t)isa & 0xF00007FFFFFFFF8LL;
  unsigned int v5 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)isa & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    unsigned int v5 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
    if ((v6 & 1) != 0) {
      unsigned int v5 = (void *)*v5;
    }
  }

  int v7 = *(_DWORD *)v5 & 1;
  if ((*(_DWORD *)v5 & 0x40000000) != 0)
  {
    uint64_t v11 = *(void *)(v4 + 8);
    unsigned int v8 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
    if ((v11 & 1) != 0) {
      unsigned int v8 = (void *)*v8;
    }
    while (1)
    {
      int v12 = *(_DWORD *)v4;
      unsigned int v13 = *(_DWORD *)v4 & 0x3FF7FFFF | 0x80080000;
      while (1)
      {
        unsigned int v14 = __ldaxr((unsigned int *)v4);
        if (v14 != v12) {
          break;
        }
      }

      __clrex();
    }
  }

  unsigned int v8 = v5;
  uint64_t v9 = (uint64_t)calloc(0x20uLL, 1uLL);
  uint64_t v4 = v9;
  uint64_t v10 = *(void *)(v9 + 8);
  if ((v10 & 1) != 0) {
    *(void *)(v10 & 0xFFFFFFFFFFFFFFFELL) = v8;
  }
  else {
    *(void *)(v9 + 8) = v8;
  }
  *(_DWORD *)uint64_t v9 = v7 | 0x80080000;
  unint64_t v15 = (uint64_t)v2[4].isa & 7 | v9 | 0x8000000000000000LL;
  __dmb(0xBu);
  v2[4].Class isa = (Class)v15;
LABEL_19:
  if (DisablePreoptCaches
    || (unint64_t v16 = dataSegmentsRanges, v17 = *(void *)algn_18C43FCB8, dataSegmentsRanges > (unint64_t)&v2[2])
    || *(void *)algn_18C43FCB8 <= (unint64_t)&v2[2]
    || (unint64_t v18 = (unint64_t)v2[3].isa) == 0)
  {
    v2[2].Class isa = (Class)&_objc_empty_cache;
    v2[3].Class isa = 0LL;
    if (!v7) {
      goto LABEL_51;
    }
    goto LABEL_49;
  }

  if (!dyld_shared_cache_some_image_overridden() || !*(void *)v18)
  {
LABEL_46:
    v2[3].Class isa = 0LL;
    atomic_store(v18, (unint64_t *)&v2[2]);
    WORD2(v2[3].isa) = 0;
    LODWORD(v2[3].isa) = 0;
    WORD2(v2[3].isa) = *(_WORD *)(v18 + 10) & 0x3FFF;
    if (!v7) {
      goto LABEL_51;
    }
    goto LABEL_49;
  }

  int v19 = v2;
  while (1)
  {
    int v19 = v19[1].isa;
    BOOL v20 = !v19 || v16 > (unint64_t)v19;
    Class v22 = v19[4].isa;
    unsigned int v23 = (void *)((unint64_t)v22 & 0xF00007FFFFFFFF8LL);
    if (((unint64_t)v22 & 0x8000000000000000LL) != 0)
    {
      uint64_t v24 = *(void *)(((unint64_t)v22 & 0xF00007FFFFFFFF8LL) + 8);
      unsigned int v23 = (void *)(v24 & 0xFFFFFFFFFFFFFFFELL);
      if ((v24 & 1) != 0) {
        unsigned int v23 = (void *)*v23;
      }
    }
  }

  v2[2].Class isa = (Class)&_objc_empty_cache;
  v2[3].Class isa = 0LL;
  objc_class::setDisallowPreoptCachesRecursively(v2, "roots");
  if (v7)
  {
LABEL_49:
    unint64_t v26 = (unsigned __int16 *)&v2[3].isa + 3;
    do
      unsigned __int16 v27 = __ldxr(v26);
    while (__stxr(v27 | 4, v26));
  }

LABEL_51:
  if (PrintConnecting)
  {
    v124 = (const char *)objc_class::nameForLogging(v2);
    v125 = "";
    v126 = " (meta)";
    if (!v7) {
      v126 = "";
    }
    Class v127 = v2[4].isa;
    v128 = "(swift)";
    _objc_inform("CLASS: realizing class '%s'%s %p %p #%u %s%s", v124, v126, v2, v8, 0, v128, v125);
  }

  unint64_t v28 = (objc_class *)remapClass((unint64_t)v2[1].isa);
  uint64_t v29 = realizeClassWithoutSwift(v28, 0LL);
  unsigned int v30 = (objc_class *)remapClass((uint64_t)v2->isa & 0xFFFFFFFF8LL);
  uint64_t v34 = realizeClassWithoutSwift(v30, 0LL);
  if (!v29)
  {
    Class v35 = v2[4].isa;
    uint64_t v36 = (void *)((unint64_t)v35 & 0xF00007FFFFFFFF8LL);
    if (((unint64_t)v35 & 0x8000000000000000LL) != 0)
    {
      uint64_t v37 = *(void *)(((unint64_t)v35 & 0xF00007FFFFFFFF8LL) + 8);
      uint64_t v36 = (void *)(v37 & 0xFFFFFFFFFFFFFFFELL);
      if ((v37 & 1) != 0) {
        uint64_t v36 = (void *)*v36;
      }
    }

    if ((*(_BYTE *)v36 & 2) == 0)
    {
      if (PrintConnecting)
      {
        v152 = (const char *)objc_class::nameForLogging(v2);
        v153 = "";
        if (v7) {
          v153 = " (meta)";
        }
        _objc_inform("CLASS: '%s'%s %p has missing weak superclass, disabling.", v152, v153, v2);
      }

      addRemappedClass(v2, 0LL);
      v2->Class isa = 0LL;
      return 0LL;
    }
  }

  int32x2_t v38 = (unsigned __int16 *)&v2[3].isa + 3;
  if (!v7)
  {
    if (!DisableNonpointerIsa)
    {
      int v70 = *v38;
      if ((realizeClassWithoutSwift(objc_class *,objc_class *)::hackedDispatch & 1) == 0)
      {
        v71 = (const char *)atomic_load(v8 + 3);
        if (v71)
        {
          if (!strcmp(v71, "OS_object"))
          {
            LOBYTE(v40) = 0;
            realizeClassWithoutSwift(objc_class *,objc_class *)::hackedDispatch = 1;
            goto LABEL_64;
          }
        }
      }

      if (v29 && *(void *)(v29 + 8))
      {
        unsigned int v72 = *(unsigned __int16 *)(v29 + 30);
        if (((v72 | v70) & 0x2000) == 0) {
          goto LABEL_65;
        }
        int v40 = (v72 >> 13) & 1;
        goto LABEL_64;
      }

      if ((v70 & 0x2000) == 0) {
        goto LABEL_65;
      }
    }

    LOBYTE(v40) = 0;
LABEL_64:
    objc_class::setInstancesRequireRawIsaRecursively(v2, v40);
    goto LABEL_65;
  }

  do
    unsigned __int16 v39 = __ldxr(v38);
  while (__stxr(v39 | 0x2000, v38));
LABEL_65:
  v2[1].Class isa = (Class)v29;
  if (DisableNonpointerIsa || (*(_WORD *)(v34 + 30) & 0x2000) != 0)
  {
    if ((v34 & 0xFFFFFFF000000007LL) == 0)
    {
      uint64_t v41 = v34 & 0xFFFFFFFF8LL;
      goto LABEL_71;
    }

LABEL_253:
    _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v31, v32, v33, v34);
  }

  if ((v34 & 0xFFFFFFF000000007LL) != 0) {
    goto LABEL_253;
  }
  uint64_t v41 = v34 & 0xFFFFFFFF8LL | 0x21A000000001LL;
LABEL_71:
  v2->Class isa = (Class)v41;
  if (v7 || !v29)
  {
    int64_t v45 = (int *)v8;
    goto LABEL_130;
  }

  uint64_t v42 = (uint64_t)v2[4].isa & 0xF00007FFFFFFFF8LL;
  uint64_t v43 = *(void *)((*(void *)(v29 + 32) & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v44 = v43 & 0xFFFFFFFFFFFFFFFELL;
  int64_t v45 = (int *)v8;
  if ((v43 & 1) != 0) {
    unint64_t v44 = *(void *)v44;
  }
  if (DebugNonFragileIvars)
  {
    char v46 = (const char *)objc_class::mangledName(v2, v31, v32, v33);
    if (!strstr(v46, "NSCF")
      && strncmp(v46, "__CF", 4uLL)
      && strcmp(v46, "NSConstantString")
      && strcmp(v46, "NSSimpleCString"))
    {
      uint64_t v73 = *((unsigned int *)v8 + 1);
      unint64_t ro_writeable_nolock = make_ro_writeable_nolock((int *)v42);
      uint64_t v78 = *(void *)(v42 + 8);
      unint64_t v79 = v78 & 0xFFFFFFFFFFFFFFFELL;
      if ((v78 & 1) != 0) {
        unint64_t v79 = *(void *)v79;
      }
      v80 = *(unsigned int **)(v79 + 48);
      if (!v80) {
        goto LABEL_223;
      }
      uint64_t v81 = *v80;
      uint64_t v82 = v80[1];
      unint64_t v83 = v82 * (unint64_t)v81;
      if ((v83 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_280;
      }
      if ((_DWORD)v83)
      {
        uint64_t v84 = (uint64_t)v80 + v83 + 8;
        v85 = v80 + 2;
        unsigned int v86 = 8;
        do
        {
          unsigned int v87 = v85[6];
          if (v87 == -1) {
            unsigned int v88 = 8;
          }
          else {
            unsigned int v88 = 1 << v87;
          }
          if (v88 > v86) {
            unsigned int v86 = v88;
          }
          v85 = (unsigned int *)((char *)v85 + v81);
        }

        while (v85 != (unsigned int *)v84);
      }

      else
      {
LABEL_223:
        unsigned int v86 = 8;
      }

      unsigned int v8 = (void *)v79;
      unsigned int v145 = *(_DWORD *)(v79 + 4);
      int v146 = v145 / v86 * v86;
      int v147 = *(_DWORD *)(ro_writeable_nolock + 8) - v146;
      *(_DWORD *)(ro_writeable_nolock + 4) = v145 - v146;
      *(_DWORD *)(ro_writeable_nolock + 8) = v147;
      if (PrintIvars)
      {
        v164 = (const char *)objc_class::nameForLogging(v2);
        _objc_inform( "IVARS: DEBUG: forcing ivars for class '%s' to slide (instanceStart %zu -> %zu)",  v164,  v73,  *((unsigned int *)v8 + 1));
        v80 = (unsigned int *)v8[6];
        if (v80)
        {
LABEL_226:
          uint64_t v81 = *v80;
          uint64_t v82 = v80[1];
          unint64_t v148 = v82 * (unint64_t)v81;
          if ((v148 & 0xFFFFFFFF00000000LL) == 0)
          {
            if ((_DWORD)v148)
            {
              uint64_t v149 = (uint64_t)v80 + v148 + 8;
              v150 = (_DWORD **)(v80 + 2);
              do
              {
                if (*v150) {
                  **v150 -= v146;
                }
                v150 = (_DWORD **)((char *)v150 + v81);
              }

              while (v150 != (_DWORD **)v149);
            }

            goto LABEL_77;
          }

LABEL_280:
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v75, v76, v77, v82, v80, v81);
        }
      }

      else if (v80)
      {
        goto LABEL_226;
      }
    }

LABEL_77:
    int64_t v45 = (int *)v8;
  }

  if (v45[1] < *(_DWORD *)(v44 + 8))
  {
    if (PrintIvars)
    {
      v151 = (const char *)objc_class::nameForLogging(v2);
      _objc_inform( "IVARS: sliding ivars for class %s (superclass was %u bytes, now %u)",  v151,  v45[1],  *(_DWORD *)(v44 + 8));
    }

    unint64_t v47 = make_ro_writeable_nolock((int *)v42);
    unint64_t v51 = v47;
    uint64_t v52 = *(void *)(v42 + 8);
    v176 = (void *)(v52 & 0xFFFFFFFFFFFFFFFELL);
    if ((v52 & 1) != 0) {
      v176 = (void *)*v176;
    }
    int v53 = *(_DWORD *)(v47 + 4);
    int v54 = *(_DWORD *)(v44 + 8) - v53;
    v55 = *(unsigned int **)(v47 + 48);
    if (v55)
    {
      uint64_t v57 = *v55;
      uint64_t v56 = v55[1];
      unint64_t v58 = v56 * (unint64_t)v57;
      if ((v58 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v48,  v49,  v50,  v56,  *(void *)(v47 + 48),  v57);
      }
      if ((_DWORD)v58)
      {
        uint64_t v59 = 0LL;
        unsigned int v60 = 1;
        uint64_t v61 = v58;
        do
        {
          if (*(void *)((char *)v55 + v59 + 8))
          {
            int v62 = *(unsigned int *)((char *)v55 + v59 + 32);
            unsigned int v63 = v62 == -1 ? 8 : 1 << v62;
            if (v63 > v60) {
              unsigned int v60 = v63;
            }
          }

          v59 += v57;
        }

        while (v61 != v59);
        uint64_t v64 = 0LL;
        int v54 = (v54 + v60 - 1) & -v60;
        v65 = &OBJC_CLASS___Object;
        do
        {
          v66 = *(int **)((char *)v55 + v64 + 8);
          if (v66)
          {
            int v67 = *v66;
            *v66 += v54;
            if (LODWORD(v65[22].superclass))
            {
              int v68 = *(unsigned int *)((char *)v55 + v64 + 32);
              if (v68 == -1) {
                int v69 = 8;
              }
              else {
                int v69 = 1 << v68;
              }
              _objc_inform( "IVARS:    offset %u -> %u for %s (size %u, align %u)",  v67,  v67 + v54,  *(const char **)((char *)v55 + v64 + 16),  *(unsigned int *)((char *)v55 + v64 + 36),  v69);
              v65 = &OBJC_CLASS___Object;
            }
          }

          v64 += v57;
        }

        while (v61 != v64);
        int v53 = *(_DWORD *)(v51 + 4);
      }
    }

    int v89 = *(_DWORD *)(v51 + 8) + v54;
    *(_DWORD *)(v51 + 4) = v54 + v53;
    *(_DWORD *)(v51 + 8) = v89;
    int64_t v45 = (int *)v176;
    atomic_load(v176 + 3);
    gdb_objc_class_changed();
  }

    if (!*(void *)(a1 + 24))
    {
LABEL_89:
      unint64_t StatusReg = v59;
      realizeClassMaybeSwiftMaybeRelock((objc_class *)v9, 1);
      goto LABEL_93;
    }

    for (unint64_t i = remapClass(v9[1]); i; unint64_t i = remapClass(*(void *)(i + 8)))
    {
      if (i == *(void *)(a1 + 24)) {
        goto LABEL_89;
      }
    }

LABEL_130:
  v90 = a2;
  objc_class::setInstanceSize(v2, v45[2]);
  int v95 = *v45;
  if ((*v45 & 4) != 0)
  {
    do
      unsigned __int16 v96 = __ldxr(v38);
    while (__stxr(v96 | 1, v38));
    int v95 = *v45;
    if ((*v45 & 0x100) == 0)
    {
      do
        unsigned __int16 v97 = __ldxr(v38);
      while (__stxr(v97 | 2, v38));
      int v95 = *v45;
    }
  }

  if ((v95 & 0x400) != 0)
  {
    *(_DWORD *)v4 |= 0x100000u;
    if (v29)
    {
LABEL_140:
      addSubclass((objc_class *)v29, v2);
      uint64_t v98 = (uint64_t)v2[4].isa & 0xF00007FFFFFFFF8LL;
      goto LABEL_142;
    }
  }

  else if (v29)
  {
    if ((*(_BYTE *)((*(void *)(v29 + 32) & 0xF00007FFFFFFFF8LL) + 2) & 0x10) != 0) {
      *(_DWORD *)v4 |= 0x100000u;
    }
    goto LABEL_140;
  }

  ++objc_debug_realized_class_generation_count;
  uint64_t v98 = (uint64_t)v2[4].isa & 0xF00007FFFFFFFF8LL;
  *(void *)(v98 + 0x18) = _firstRealizedClass;
  _firstRealizedClass = (uint64_t)v2;
LABEL_142:
  unsigned __int16 v99 = *v38;
  uint64_t v100 = *(void *)(v98 + 8);
  v101 = (void *)(v100 & 0xFFFFFFFFFFFFFFFELL);
  if ((v100 & 1) != 0) {
    v101 = (void *)*v101;
  }
  if (PrintConnecting)
  {
    v140 = (const char *)objc_class::nameForLogging(v2);
    v141 = "(meta)";
    if ((v99 & 4) == 0) {
      v141 = "";
    }
    _objc_inform("CLASS: methodizing class '%s' %s", v140, v141);
  }

  uint64_t v102 = v101[4];
  v103 = (unsigned int *)(v102 & 0xFFFFFFFFFFFFFFFELL);
  if ((v102 & 1) != 0) {
    v104 = 0LL;
  }
  else {
    v104 = (method_list_t *)(v102 & 0xFFFFFFFFFFFFFFFELL);
  }
  v179 = v104;
  if (v104)
  {
    uint64_t v105 = *(void *)(((uint64_t)v2[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    v106 = (void *)(v105 & 0xFFFFFFFFFFFFFFFELL);
    if ((v105 & 1) != 0) {
      v106 = (void *)*v106;
    }
    prepareMethodLists(v2, &v179, 1, (char *)1, (*(_DWORD *)v106 >> 29) & 1, 0LL, v94);
    goto LABEL_152;
  }

  if ((v102 & 1) != 0 && v103)
  {
    v110 = &OBJC_CLASS___Object;
    if (DisablePreattachedCategories)
    {
      uint64_t v113 = *v103;
      uint64_t v112 = v103[1];
      unint64_t v165 = v112 * (unint64_t)v113;
      if ((v165 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_269;
      }
      uint64_t v166 = (uint64_t)v103 + v165 + 8;
      BOOL v167 = (_DWORD)v112 == 0;
      if ((_DWORD)v112) {
        uint64_t v112 = v112;
      }
      else {
        uint64_t v112 = 0LL;
      }
      if (v167) {
        v111 = (uint64_t *)v166;
      }
      else {
        v111 = (uint64_t *)(v166 - v113);
      }
    }

    else
    {
      v111 = (uint64_t *)(v103 + 2);
      uint64_t v113 = *v103;
      uint64_t v112 = v103[1];
    }

    unint64_t v114 = v112 * (unint64_t)v113;
    if ((v114 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v112, v103, v113);
    }
    v115 = v103 + 2;
    unint64_t v116 = (unint64_t)v103 + v114 + 8;
    if ((unint64_t)v111 < v116)
    {
      while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v111 + 8) & 1) == 0)
      {
        v111 = (uint64_t *)((char *)v111 + v113);
        unsigned int v117 = v113;
      }
    }

    unsigned int v117 = v113;
LABEL_174:
    if (v111 == (uint64_t *)v116)
    {
      unsigned int v118 = 0;
    }

    else
    {
      unsigned int v118 = 0;
      do
      {
        v178 = (method_list_t *)((char *)v111 + (*v111 >> 16));
        uint64_t v113 = *v103;
        uint64_t v112 = v103[1];
        unint64_t v119 = v112 * (unint64_t)v113;
        if ((v119 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_269;
        }
        v120 = (uint64_t *)((char *)v111 + v117);
        do
        {
          v111 = v120;
          uint64_t v121 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v120 + 8);
          v120 = (uint64_t *)((char *)v120 + v117);
        }

        while ((v121 & 1) == 0);
        uint64_t v122 = *(void *)(((uint64_t)v2[4].isa & 0xF00007FFFFFFFF8LL) + 8);
        v123 = (void *)(v122 & 0xFFFFFFFFFFFFFFFELL);
        if ((v122 & 1) != 0) {
          v123 = (void *)*v123;
        }
        prepareMethodLists(v2, &v178, 1, (char *)(v111 == (uint64_t *)v116), (*(_DWORD *)v123 >> 29) & 1, 0LL, v94);
        ++v118;
      }

      while (v111 != (uint64_t *)v116);
      LODWORD(v112) = v103[1];
      v110 = &OBJC_CLASS___Object;
    }

    v90 = a2;
    v154 = (const char *)objc_class::nameForLogging(v2);
    v155 = "(meta)";
    if ((v99 & 4) == 0) {
      v155 = "";
    }
    _objc_inform( "CLASS: Copying preoptimized categories for sparsely loaded class '%s' %s - %u lists, %u loaded - loaded lists are:",  v154,  v155,  v103[1],  v118);
    v110 = &OBJC_CLASS___Object;
    if (DisablePreattachedCategories)
    {
      uint64_t v157 = *v103;
      uint64_t v156 = v103[1];
      unint64_t v173 = v156 * (unint64_t)v157;
      if ((v173 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v156, v103, *v103);
      }
      v174 = (char *)v115 + v173;
      BOOL v175 = (_DWORD)v156 == 0;
      uint64_t v156 = (_DWORD)v156 ? v156 : 0LL;
      v158 = (uint64_t *)(v175 ? v174 : &v174[-v157]);
    }

    else
    {
      uint64_t v157 = *v103;
      uint64_t v156 = v103[1];
      v158 = (uint64_t *)(v103 + 2);
    }

    unint64_t v159 = v156 * (unint64_t)v157;
    if ((v159 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v156, v103, v157);
    }
    for (unint64_t i = (uint64_t *)((char *)v115 + v159); v158 < i; v158 = (uint64_t *)((char *)v158 + v157))
    {
    }

    if (v158 == i)
    {
LABEL_195:
      uint64_t v129 = *(void *)(v98 + 8);
      unint64_t v130 = v129 & 0xFFFFFFFFFFFFFFFELL;
      if ((v129 & 1) == 0)
      {
        v168 = v110;
        unint64_t v169 = class_rw_t::extAlloc(v98, v129 & 0xFFFFFFFFFFFFFFFELL, 0);
        v110 = v168;
        unint64_t v130 = v169;
      }

      if ((*(void *)(v130 + 8) & 3LL) == 2) {
        v131 = (unsigned int *)(*(void *)(v130 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      }
      else {
        v131 = 0LL;
      }
      if (HIDWORD(v110[24].cache))
      {
        uint64_t v133 = *v131;
        uint64_t v134 = v131[1];
        unint64_t v170 = v134 * (unint64_t)v133;
        if ((v170 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v134, v131, *v131);
        }
        uint64_t v171 = (uint64_t)v131 + v170 + 8;
        BOOL v172 = (_DWORD)v134 == 0;
        if ((_DWORD)v134) {
          uint64_t v134 = v134;
        }
        else {
          uint64_t v134 = 0LL;
        }
        if (v172) {
          v132 = (uint64_t *)v171;
        }
        else {
          v132 = (uint64_t *)(v171 - v133);
        }
        v90 = a2;
      }

      else
      {
        v132 = (uint64_t *)(v131 + 2);
        uint64_t v133 = *v131;
        uint64_t v134 = v131[1];
        v90 = a2;
      }

      unint64_t v135 = v134 * (unint64_t)v133;
      if ((v135 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v134, v131, v133);
      }
      unint64_t v136 = (unint64_t)v131 + v135 + 8;
      uint64_t v137 = objc_debug_headerInfoRWs;
      if ((unint64_t)v132 < v136)
      {
        while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v132 + 8) & 1) == 0)
        {
          v132 = (uint64_t *)((char *)v132 + v133);
          unsigned int v138 = v133;
        }
      }

      unsigned int v138 = v133;
LABEL_208:
      if (v118 == 1)
      {
        unint64_t v139 = (unint64_t)v132 + (*v132 >> 16);
        *(void *)(v130 + 8) = v139;
      }

      else
      {
        unint64_t v142 = (unint64_t)malloc(8LL * v118 + 8);
        unint64_t v139 = v142 | 1;
        *(void *)(v130 + 8) = v142 | 1;
        *(_DWORD *)unint64_t v142 = v118;
        if (v118)
        {
          for (uint64_t j = 0LL; j != v118; ++j)
          {
            *(void *)(v142 + 8 * j + 8) = (char *)v132 + (*v132 >> 16);
            v132 = (uint64_t *)((char *)v132 + v138);
            unsigned int v144 = v138;
            if ((unint64_t)v132 < v136)
            {
              while ((*(void *)(v137 + 8LL * *(unsigned __int16 *)v132 + 8) & 1) == 0)
              {
                v132 = (uint64_t *)((char *)v132 + v144);
                unsigned int v138 = v144;
              }
            }

            unsigned int v138 = v144;
LABEL_220:
            ;
          }
        }
      }

      list_array_tt<unsigned long,protocol_list_t,RawPtr>::validate(v139, v91, v92, v93);
      goto LABEL_152;
    }

    while (1)
    {
      _objc_inform("    %p", (char *)v158 + (*v158 >> 16));
      uint64_t v113 = *v103;
      uint64_t v112 = v103[1];
      unint64_t v161 = v112 * (unint64_t)v113;
      if ((v161 & 0xFFFFFFFF00000000LL) != 0) {
        break;
      }
      v162 = (uint64_t *)((char *)v158 + v157);
      do
      {
        v158 = v162;
        uint64_t v163 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v162 + 8);
        v162 = (uint64_t *)((char *)v162 + v157);
      }

      while ((v163 & 1) == 0);
      v110 = &OBJC_CLASS___Object;
      if (v158 == i) {
        goto LABEL_195;
      }
    }

LABEL_269:
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v91, v92, v93, v112, v103, v113);
  }

LABEL_152:
  if (v90)
  {
    if ((v99 & 4) != 0) {
      uint64_t v107 = 2LL;
    }
    else {
      uint64_t v107 = 4LL;
    }
    objc::UnattachedCategories::attachToClass(v2, v90, (objc_class *)v107);
  }

  if ((v99 & 4) != 0) {
    uint64_t v108 = 2LL;
  }
  else {
    uint64_t v108 = 1LL;
  }
  objc::UnattachedCategories::attachToClass(v2, v2, (objc_class *)v108);
  return v2;
}

unint64_t objc_class::nameForLogging(objc_class *this)
{
  if ((unint64_t)&this->isa[-1].isa + 7 < 0xF)
  {
    asprintf(&v15, "<stub class %p>");
LABEL_17:
    uint64_t v9 = v15;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v11 = *(_OWORD **)(StatusReg + 320);
    if (!v11)
    {
      uint64_t v11 = malloc(0x48uLL);
      *uint64_t v11 = 0u;
      v11[1] = 0u;
      v11[2] = 0u;
      v11[3] = 0u;
      *((void *)v11 + 8) = 0LL;
      *(void *)(StatusReg + 320) = v11;
    }

    int v12 = (void *)*((void *)v11 + 3);
    unsigned int v8 = v9;
    if (v12)
    {
      free(v12);
      unsigned int v8 = v15;
    }

    __int128 v13 = v11[2];
    *((void *)v11 + 5) = *((void *)v11 + 6);
    *(_OWORD *)((char *)v11 + 24) = v13;
    *((void *)v11 + 6) = v9;
    return (unint64_t)v8;
  }

  Class isa = this[4].isa;
  uint64_t v2 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (!(*(_DWORD *)((unint64_t)isa & 0xF00007FFFFFFFF8LL) >> 30))
  {
LABEL_4:
    if (((unint64_t)isa & 0x8000000000000000LL) != 0)
    {
      uint64_t v3 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
      uint64_t v2 = (void *)(v3 & 0xFFFFFFFFFFFFFFFELL);
      if ((v3 & 1) != 0) {
        uint64_t v2 = (void *)*v2;
      }
    }

    uint64_t v4 = (char *)atomic_load(v2 + 3);
    if (v4)
    {
      unsigned int v5 = copySwiftV1DemangledName(v4, 0);
      if (!v5) {
        unsigned int v5 = strdup(v4);
      }
      unint64_t v15 = v5;
    }

    else
    {
      asprintf(&v15, "<lazily named class %p>");
    }

    goto LABEL_17;
  }

  uint64_t v6 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
  int v7 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  if ((isa & 3) != 0)
  {
    if ((v6 & 1) != 0)
    {
      if (v7)
      {
        unsigned int v8 = (char *)v7[4];
        if (v8) {
          return (unint64_t)v8;
        }
      }
    }

    goto LABEL_4;
  }

  if ((v6 & 1) != 0) {
    int v7 = (void *)*v7;
  }
  return atomic_load(v7 + 3);
}

uint64_t addRemappedClass(objc_class *this, objc_class *a2)
{
  if (PrintFuture)
  {
    unsigned int v8 = (const char *)objc_class::nameForLogging(this);
    _objc_inform("FUTURE: using %p instead of %p for %s", a2, this, v8);
  }

  if (!byte_18C43F048)
  {
    dword_18C43F040 = 64;
    uint64_t v4 = (char *)malloc(0x400uLL);
    uint64_t v5 = 0LL;
    remappedClasses(BOOL)::remapped_class_map = (uint64_t)v4;
    qword_18C43F038 = 0LL;
    do
    {
      *(void *)&v4[v5] = -1LL;
      v5 += 16LL;
    }

    while (v5 != 1024);
    byte_18C43F048 = 1;
  }

  uint64_t result = objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::LookupBucketFor<objc_class *>( (unint64_t)this,  &v9);
  if ((result & 1) == 0)
  {
    uint64_t result = dword_18C43F040;
    if (4 * (int)qword_18C43F038 + 4 >= (3 * dword_18C43F040))
    {
      LODWORD(result) = 2 * dword_18C43F040;
    }

    else if (dword_18C43F040 + ~(_DWORD)qword_18C43F038 - HIDWORD(qword_18C43F038) > dword_18C43F040 >> 3)
    {
LABEL_10:
      int v7 = v9;
      if (*v9 == (objc_class *)-2LL)
      {
        qword_18C43F038 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F038, (int32x2_t)0xFFFFFFFF00000001LL);
      }

      else if (*v9 == (objc_class *)-1LL)
      {
        LODWORD(qword_18C43F038) = qword_18C43F038 + 1;
      }

      *uint64_t v9 = this;
      v7[1] = a2;
      return result;
    }

    objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::grow(result);
    uint64_t result = objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::LookupBucketFor<objc_class *>( (unint64_t)this,  &v9);
    goto LABEL_10;
  }

  return result;
}

uint64_t objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::LookupBucketFor<objc_class *>( unint64_t a1, void *a2)
{
  if (dword_18C43F040)
  {
    int v2 = dword_18C43F040 - 1;
    unsigned int v3 = (dword_18C43F040 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a1 ^ (a1 >> 4))) ^ (1217387093 * (a1 ^ (a1 >> 4))));
    uint64_t v4 = (void *)(remappedClasses(BOOL)::remapped_class_map + 16LL * v3);
    uint64_t v5 = *v4;
    if (*v4 == a1)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      unsigned int v8 = 0LL;
      unsigned int v9 = 1;
      while (v5 != -1)
      {
        if (v9 > dword_18C43F040) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::FatalCorruptHashTables( (void *)remappedClasses(BOOL)::remapped_class_map,  dword_18C43F040);
        }
        if (v8) {
          BOOL v10 = 0;
        }
        else {
          BOOL v10 = v5 == -2;
        }
        if (v10) {
          unsigned int v8 = v4;
        }
        unsigned int v11 = v3 + v9++;
        unsigned int v3 = v11 & v2;
        uint64_t v4 = (void *)(remappedClasses(BOOL)::remapped_class_map + 16LL * (v11 & v2));
        uint64_t v5 = *v4;
        uint64_t v6 = 1LL;
        if (*v4 == a1) {
          goto LABEL_5;
        }
      }

      uint64_t v6 = 0LL;
      if (v8) {
        uint64_t v4 = v8;
      }
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

void objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::grow( int a1)
{
  uint64_t v1 = dword_18C43F040;
  int v2 = (unint64_t *)remappedClasses(BOOL)::remapped_class_map;
  unsigned int v3 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = v4 | HIWORD(v4);
  else {
    uint64_t v6 = 4LL;
  }
  dword_18C43F040 = v6;
  int v7 = malloc(16LL * v6);
  remappedClasses(BOOL)::remapped_class_map = (uint64_t)v7;
  if (v2)
  {
    qword_18C43F038 = 0LL;
    uint64_t v8 = 16 * v6;
    do
    {
      *int v7 = -1LL;
      v7 += 2;
      v8 -= 16LL;
    }

    while (v8);
    if ((_DWORD)v1)
    {
      uint64_t v9 = 16 * v1;
      BOOL v10 = v2;
      do
      {
        if (*v10 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::LookupBucketFor<objc_class *>( *v10,  &v13);
          unsigned int v11 = v13;
          *__int128 v13 = *v10;
          v11[1] = v10[1];
          LODWORD(qword_18C43F038) = qword_18C43F038 + 1;
        }

        v10 += 2;
        v9 -= 16LL;
      }

      while (v9);
    }

    free(v2);
  }

  else
  {
    qword_18C43F038 = 0LL;
    uint64_t v12 = 16 * v6;
    do
    {
      *int v7 = -1LL;
      v7 += 2;
      v12 -= 16LL;
    }

    while (v12);
  }

char *copySwiftV1DemangledName(char *result, int a2)
{
  if (result)
  {
    unsigned int v3 = result;
    if (a2) {
      unsigned int v4 = "_TtP";
    }
    else {
      unsigned int v4 = "_TtC";
    }
    if (strncmp(result, v4, 4uLL)) {
      return 0LL;
    }
    unsigned int v11 = v3 + 4;
    int v5 = &v3[strlen(v3 + 4) + 4];
    if (v3[4] == 115)
    {
      int v9 = 5;
      BOOL v10 = "Swift";
      unsigned int v11 = v3 + 5;
    }

    else if (!scanMangledField((const char **)&v11, v5, (const char **)&v10, &v9))
    {
      return 0LL;
    }

    if (scanMangledField((const char **)&v11, v5, (const char **)&v8, &v7))
    {
      if (a2)
      {
        if (!strcmp(v11, "_")) {
          goto LABEL_16;
        }
      }

      else if (v11 == v5)
      {
LABEL_16:
        asprintf(&v6, "%.*s.%.*s", v9, v10, v7, v8);
        return v6;
      }
    }

    return 0LL;
  }

  return result;
}

BOOL scanMangledField(const char **a1, const char *a2, const char **a3, int *a4)
{
  unsigned int v4 = *a1;
  if (**a1 == 48) {
    return 0LL;
  }
  int v6 = 0;
  *a4 = 0;
  *a3 = v4;
  uint64_t v7 = MEMORY[0x1895F8770];
  while (1)
  {
    uint64_t v8 = (char *)*a3;
    if (*a3 >= a2) {
      break;
    }
    unsigned int v9 = *v8;
    if ((v9 & 0x80000000) != 0 || (*(_DWORD *)(v7 + 4LL * v9 + 60) & 0x400) == 0) {
      break;
    }
    *a3 = v8 + 1;
    uint64_t v10 = 10LL * v6;
    *a4 = v10;
    if (v10 == (int)v10)
    {
      unsigned int v11 = v9 - 48;
      BOOL v12 = __OFADD__((_DWORD)v10, v11);
      int v6 = v10 + v11;
      *a4 = v6;
      if (!v12) {
        continue;
      }
    }

    return 0LL;
  }

  __int128 v13 = &v8[v6];
  *a1 = v13;
  return v6 > 0 && v13 <= a2;
}

objc_class *objc_class::setInstancesRequireRawIsaRecursively(objc_class *this, char a2)
{
  if ((HIWORD(this[3].isa) & 0x2000) == 0)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3321888768LL;
    v2[2] = ___ZN10objc_class36setInstancesRequireRawIsaRecursivelyEb_block_invoke;
    v2[3] = &__block_descriptor_48_e8_32c64_ZTSKZN10objc_class36setInstancesRequireRawIsaRecursivelyEbE3__0_e8_B16__0_8l;
    char v3 = a2;
    unsigned int v4 = this;
    return (objc_class *)foreach_realized_class_and_subclass((uint64_t)this, (uint64_t)v2);
  }

  return this;
}

void *objc_class::mangledName(objc_class *this, uint64_t a2, const char *a3, char *a4)
{
  Class isa = this[4].isa;
  int v5 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)isa & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    int v5 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
    if ((v6 & 1) != 0) {
      int v5 = (void *)*v5;
    }
  }

  unint64_t v7 = atomic_load(v5 + 3);
  if (v7) {
    return (void *)v7;
  }
  else {
    return objc_class::installMangledNameForLazilyNamedClass(this, a2, a3, a4);
  }
}

unint64_t make_ro_writeable_nolock(int *a1)
{
  int v2 = *a1;
  if ((*a1 & 0x8000000) == 0)
  {
    uint64_t v3 = *((void *)a1 + 1);
    unsigned int v4 = (void *)(v3 & 0xFFFFFFFFFFFFFFFELL);
    if ((v3 & 1) != 0) {
      unsigned int v4 = (void *)*v4;
    }
    int v5 = *(_DWORD *)v4;
    if ((*(_DWORD *)v4 & 0x40) != 0) {
      size_t v6 = 80LL;
    }
    else {
      size_t v6 = 72LL;
    }
    unint64_t v7 = malloc(v6);
    memcpy(v7, v4, v6);
    if ((v5 & 0x40) != 0) {
      v7[9] = v4[9];
    }
    uint64_t v8 = *((void *)a1 + 1);
    if ((v8 & 1) != 0) {
      *(void *)(v8 & 0xFFFFFFFFFFFFFFFELL) = v7;
    }
    else {
      *((void *)a1 + 1) = v7;
    }
    *a1 = v2 | 0x8000000;
  }

  uint64_t v9 = *((void *)a1 + 1);
  unint64_t result = v9 & 0xFFFFFFFFFFFFFFFELL;
  if ((v9 & 1) != 0) {
    return *(void *)result;
  }
  return result;
}

objc_class *objc_class::setInstanceSize(objc_class *this, unsigned int a2)
{
  uint64_t v2 = *(void *)(((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFFELL;
  if ((v2 & 1) != 0) {
    unint64_t v3 = *(void *)v3;
  }
  if (*(_DWORD *)(v3 + 8) != a2) {
    *(_DWORD *)(v3 + 8) = a2;
  }
  unsigned int v4 = ((_WORD)a2 + 15) & 0xFF8;
  if (v4 < a2) {
    LOWORD(v4) = 0;
  }
  HIWORD(this[3].isa) = HIWORD(this[3].isa) & 0xF007 | v4;
  return this;
}

objc_class *addSubclass(objc_class *result, objc_class *this)
{
  if (!result || !this) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  ++objc_debug_realized_class_generation_count;
  uint64_t v4 = (uint64_t)result[4].isa & 0xF00007FFFFFFFF8LL;
  Class isa = this[4].isa;
  *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 0x18) = *(void *)(v4 + 0x10);
  *(void *)(v4 + 16) = this;
  __int16 isa_high = HIWORD(result[3].isa);
  if ((isa_high & 2) != 0)
  {
    unint64_t v7 = (unsigned __int16 *)&this[3].isa + 3;
    do
      unsigned __int16 v8 = __ldxr(v7);
    while (__stxr(v8 | 2, v7));
    __int16 isa_high = HIWORD(result[3].isa);
    if ((isa_high & 1) == 0)
    {
LABEL_5:
      if ((isa_high & 0x1000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }

  else if ((isa_high & 1) == 0)
  {
    goto LABEL_5;
  }

  uint64_t v9 = (unsigned __int16 *)&this[3].isa + 3;
  do
    unsigned __int16 v10 = __ldxr(v9);
  while (__stxr(v10 | 1, v9));
  __int16 isa_high = HIWORD(result[3].isa);
  if ((isa_high & 0x1000) != 0)
  {
LABEL_13:
    unsigned int v11 = (unsigned __int16 *)&this[3].isa + 3;
    do
      unsigned __int16 v12 = __ldxr(v11);
    while (__stxr(v12 | 0x1000, v11));
    __int16 isa_high = HIWORD(result[3].isa);
  }

void prepareMethodLists( objc_class *a1, method_list_t **a2, int a3, char *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a3) {
    return;
  }
  if ((a4 & 1) == 0)
  {
    Class isa = (objc_cache *)a1[2].isa;
    if ((isa & 1) != 0
      || (isa != &_objc_empty_cache ? (BOOL v12 = (unint64_t)a1[2].isa >> 48 == 0) : (BOOL v12 = 0), v12))
    {
      objc_class::setDisallowPreoptCachesRecursively(a1, (const char *)a6);
    }

    else if ((*(_BYTE *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 4) == 0)
    {
      if (a3 <= 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }

  if (a3 < 1) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v13 = a3;
  unsigned int v14 = a2;
  do
  {
    if ((~*(_DWORD *)*v14 & 3) != 0) {
      fixupMethodList(*v14, a5, (const char *)1, a4);
    }
    ++v14;
    --v13;
  }

  while (v13);
LABEL_17:
  int v15 = *(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v15 & 1) == 0) {
    int v15 = *(_DWORD *)(*(void *)(((uint64_t)a1->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v15 & 0x20000000) != 0 && a3 >= 1)
  {
    uint64_t v16 = 0LL;
    int v17 = &a2[a3];
    do
    {
      int v19 = (unsigned int *)*a2++;
      unint64_t v18 = (unint64_t)v19;
      unint64_t v20 = *v19;
      unint64_t v21 = v20 >> 31;
      if ((v20 & 0x80000000) != 0)
      {
        uint64_t v42 = (unsigned __int16)v20 & 0xFFFC;
        uint64_t v43 = *(unsigned int *)(v18 + 4);
        uint64_t v44 = v43 * v42;
        if (dataSegmentsRanges <= v18 && *(void *)algn_18C43FCB8 > v18)
        {
          if ((v44 & 0xFFFFFFFF00000000LL) != 0) {
LABEL_203:
          }
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v16,  sel_retainCount,  sel_allowsWeakReference,  sel_retainWeakReference,  a6,  a7,  sel_isKindOfClass_,  v43,  v18,  v42);
          unint64_t v63 = (v18 + 8) & 0xFFFFFFFFFFFFFFFCLL | v21;
          unint64_t v64 = (v18 + 8 + v44) & 0xFFFFFFFFFFFFFFFCLL | v21;
          while (v63 != v64)
          {
            uint64_t v65 = 0LL;
            while (1)
            {
              v66 = (char *)&unk_18E7BB5A8 + *(int *)((v63 + v65) & 0xFFFFFFFFFFFFFFFCLL);
              a6 = (unint64_t)v66 & objc::InterestingSelectorZeroes;
              a7 = objc::InterestingSelectorOnes & (unint64_t)v66;
              v65 += v42;
              a6 = v63 + v65;
              if (v63 + v65 == v64) {
                goto LABEL_140;
              }
            }

            if (sel_alloc == v66 || sel_allocWithZone_ == v66)
            {
              uint64_t v16 = v16 | 1;
            }

            else
            {
              BOOL v69 = sel_retain == v66 || sel_release == v66;
              BOOL v70 = v69 || sel_autorelease == v66;
              BOOL v71 = v70 || sel__tryRetain == v66;
              BOOL v72 = v71 || sel__isDeallocating == v66;
              BOOL v73 = v72 || sel_retainCount == v66;
              BOOL v74 = v73 || sel_allowsWeakReference == v66;
              if (v74 || sel_retainWeakReference == v66)
              {
                uint64_t v16 = v16 | 4;
              }

              else
              {
                BOOL v76 = sel_respondsToSelector_ == v66 || sel_isKindOfClass_ == v66;
                BOOL v77 = v76 || sel_class == v66;
                BOOL v78 = v77 || sel_self == v66;
                BOOL v79 = v78 || &sel_new == (_UNKNOWN *)v66;
                uint64_t v16 = v79 ? v16 | 0x10 : v16;
              }
            }

            if ((_DWORD)v16 == 21) {
              break;
            }
            v63 += v65 + v42;
          }
        }

        else
        {
          if ((v44 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_203;
          }
          a6 = (v18 + 8) & 0xFFFFFFFFFFFFFFFCLL;
          a7 = v21;
          unint64_t v46 = a6 | v21;
          for (unint64_t i = (v18 + 8 + v44) & 0xFFFFFFFFFFFFFFFCLL | v21;
                v46 != i;
                v46 += v48 + v42)
          {
            uint64_t v48 = 0LL;
            while (1)
            {
              v49 = *(char **)(((v46 + v48) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v46 + v48) & 0xFFFFFFFFFFFFFFFCLL));
              a6 = objc::InterestingSelectorZeroes & (unint64_t)v49;
              a7 = objc::InterestingSelectorOnes & (unint64_t)v49;
              v48 += v42;
              a6 = v46 + v48;
              if (v46 + v48 == i) {
                goto LABEL_140;
              }
            }

            if (sel_alloc == v49 || sel_allocWithZone_ == v49)
            {
              uint64_t v16 = v16 | 1;
            }

            else if (sel_retain == v49 {
                   || sel_release == v49
            }
                   || sel_autorelease == v49
                   || sel__tryRetain == v49
                   || sel__isDeallocating == v49
                   || sel_retainCount == v49
                   || sel_allowsWeakReference == v49
                   || sel_retainWeakReference == v49)
            {
              uint64_t v16 = v16 | 4;
            }

            else if (sel_respondsToSelector_ == v49 {
                   || sel_isKindOfClass_ == v49
            }
                   || sel_class == v49
                   || sel_self == v49
                   || &sel_new == (_UNKNOWN *)v49)
            {
              uint64_t v16 = v16 | 0x10;
            }

            else
            {
              uint64_t v16 = v16;
            }

            if ((_DWORD)v16 == 21) {
              break;
            }
          }
        }
      }

      else
      {
        uint64_t v22 = (unsigned __int16)v20 & 0xFFFC;
        uint64_t v23 = *(unsigned int *)(v18 + 4);
        unint64_t v24 = v23 * (unint64_t)v22;
        if ((v24 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v16,  sel_retainCount,  sel_allowsWeakReference,  sel_retainWeakReference,  a6,  a7,  sel_isKindOfClass_,  v23,  v18,  v22);
        }
        a6 = (v18 + 8) & 0xFFFFFFFFFFFFFFFCLL;
        a7 = v21;
        unint64_t v25 = a6 | v21;
        unint64_t v26 = (v18 + 8 + v24) & 0xFFFFFFFFFFFFFFFCLL | v21;
        while (v25 != v26)
        {
          uint64_t v27 = 0LL;
          while (1)
          {
            unint64_t v28 = *(char **)((v25 + v27) & 0xFFFFFFFFFFFFFFFCLL);
            a6 = objc::InterestingSelectorZeroes & (unint64_t)v28;
            a7 = objc::InterestingSelectorOnes & (unint64_t)v28;
            v27 += v22;
            a6 = v25 + v27;
            if (v25 + v27 == v26) {
              goto LABEL_140;
            }
          }

          if (sel_alloc == v28 || sel_allocWithZone_ == v28)
          {
            uint64_t v16 = v16 | 1;
          }

          else
          {
            BOOL v31 = sel_retain == v28 || sel_release == v28;
            BOOL v32 = v31 || sel_autorelease == v28;
            BOOL v33 = v32 || sel__tryRetain == v28;
            BOOL v34 = v33 || sel__isDeallocating == v28;
            BOOL v35 = v34 || sel_retainCount == v28;
            BOOL v36 = v35 || sel_allowsWeakReference == v28;
            if (v36 || sel_retainWeakReference == v28)
            {
              uint64_t v16 = v16 | 4;
            }

            else
            {
              BOOL v38 = sel_respondsToSelector_ == v28 || sel_isKindOfClass_ == v28;
              BOOL v39 = v38 || sel_class == v28;
              BOOL v40 = v39 || sel_self == v28;
              BOOL v41 = v40 || &sel_new == (_UNKNOWN *)v28;
              uint64_t v16 = v41 ? v16 | 0x10 : v16;
            }
          }

          if ((_DWORD)v16 == 21) {
            break;
          }
          v25 += v27 + v22;
        }
      }

LABEL_140:
      ;
    }

    while (a2 < v17);
    if ((_DWORD)v16) {
      objc::Scanner::propagateCustomFlags((uint64_t)a1, v16, 0);
    }
  }

unint64_t addMethod(objc_class *a1, objc_selector *a2, void (*a3)(void), char *a4, char a5)
{
  size_t v6 = a4;
  if ((unint64_t)&a1->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v10 = *(unsigned __int16 *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 4), dword_18C43FCC8 <= v10)
    || (*(void *)(qword_18C43FCC0 + 16 * v10) <= (unint64_t)a1
      ? (BOOL v11 = *(void *)(qword_18C43FCC0 + 16 * v10 + 8) > (unint64_t)a1)
      : (BOOL v11 = 0),
        !v11))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)a1)
      && (dataSegmentsContain(a1, v23, (unsigned int *)a3) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v24, (const char *)a3, a4, a1);
    }
  }

  unint64_t MethodNoSuper_nolock = getMethodNoSuper_nolock(a1, a2, (const char *)a3, a4);
  if (MethodNoSuper_nolock)
  {
    if ((a5 & 1) != 0) {
      return _method_setImplementation(a1, MethodNoSuper_nolock, a3);
    }
    else {
      return method_t::imp(MethodNoSuper_nolock, 0);
    }
  }

  else
  {
    unsigned int v14 = (method_list_t *)calloc(0x20uLL, 1uLL);
    *(void *)unsigned int v14 = 0x10000001BLL;
    int v15 = (void *)(((unint64_t)v14 + 8) & 0xFFFFFFFFFFFFFFFCLL);
    *int v15 = a2;
    size_t v16 = strlen(v6) + 1;
    if ((_dyld_is_memory_immutable() & 1) == 0)
    {
      uint64_t v22 = malloc(v16);
      memcpy(v22, v6, v16);
      size_t v6 = (const char *)v22;
    }

    v15[1] = v6;
    v15[2] = a3;
    addMethods_finish(a1, v14, v17, v18, v19, v20, v21);
    return 0LL;
  }

void objc::UnattachedCategories::attachToClass(objc_class *this, objc_class *a2, objc_class *a3)
{
  if (objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( (unint64_t)a2,  &v20))
  {
    unsigned __int16 v8 = (void *)v20;
    if (v20 != objc::unattachedCategories + 24LL * dword_18C43F848)
    {
      uint64_t v9 = (void **)(v20 + 8);
      if ((a3 & 4) != 0)
      {
        unsigned int v15 = a3 & 0xFFFFFFFB;
        uint64_t v16 = *(void *)(v20 + 16);
        if ((v16 & 1) != 0) {
          uint64_t v17 = *(void *)(v20 + 8);
        }
        else {
          uint64_t v17 = v20 + 8;
        }
        if ((v16 & 1) != 0) {
          unint64_t v18 = v16 >> 1;
        }
        else {
          unint64_t v18 = *(void *)(v20 + 8) != 0LL;
        }
        attachCategories(this, v17, (const char *)v18, (char *)(v15 | 1), v5, v6, v7);
        uint64_t v13 = (objc_class *)((uint64_t)this->isa & 0xFFFFFFFF8LL);
        uint64_t v19 = v8[2];
        if ((v19 & 1) != 0) {
          uint64_t v11 = v8[1];
        }
        else {
          uint64_t v11 = (uint64_t)(v8 + 1);
        }
        if ((v19 & 1) != 0) {
          unint64_t v12 = v19 >> 1;
        }
        else {
          unint64_t v12 = v8[1] != 0LL;
        }
        unsigned int v14 = (char *)(v15 | 2);
      }

      else
      {
        uint64_t v10 = *(void *)(v20 + 16);
        if ((v10 & 1) != 0) {
          uint64_t v11 = *(void *)(v20 + 8);
        }
        else {
          uint64_t v11 = v20 + 8;
        }
        if ((v10 & 1) != 0) {
          unint64_t v12 = v10 >> 1;
        }
        else {
          unint64_t v12 = *(void *)(v20 + 8) != 0LL;
        }
        uint64_t v13 = this;
        unsigned int v14 = (char *)a3;
      }

      attachCategories(v13, v11, (const char *)v12, v14, v5, v6, v7);
      if ((v8[2] & 1) != 0) {
        free(*v9);
      }
      *unsigned __int16 v8 = -2LL;
      qword_18C43F840 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F840, (int32x2_t)0x1FFFFFFFFLL);
      objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::compact();
    }
  }

uint64_t objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( unint64_t a1, void *a2)
{
  if (dword_18C43F848)
  {
    int v2 = dword_18C43F848 - 1;
    unsigned int v3 = (dword_18C43F848 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a1 ^ (a1 >> 4))) ^ (1217387093 * (a1 ^ (a1 >> 4))));
    uint64_t v4 = (void *)(objc::unattachedCategories + 24LL * v3);
    uint64_t v5 = *v4;
    if (*v4 == a1)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      unsigned __int16 v8 = 0LL;
      unsigned int v9 = 1;
      while (v5 != -1)
      {
        if (v9 > dword_18C43F848) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::FatalCorruptHashTables( (void *)objc::unattachedCategories,  dword_18C43F848);
        }
        if (v8) {
          BOOL v10 = 0;
        }
        else {
          BOOL v10 = v5 == -2;
        }
        if (v10) {
          unsigned __int16 v8 = v4;
        }
        unsigned int v11 = v3 + v9++;
        unsigned int v3 = v11 & v2;
        uint64_t v4 = (void *)(objc::unattachedCategories + 24LL * (v11 & v2));
        uint64_t v5 = *v4;
        uint64_t v6 = 1LL;
        if (*v4 == a1) {
          goto LABEL_5;
        }
      }

      uint64_t v6 = 0LL;
      if (v8) {
        uint64_t v4 = v8;
      }
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

void attachCategories( objc_class *a1, uint64_t a2, const char *a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v7 = (char)a4;
  LODWORD(v8) = (_DWORD)a3;
  unsigned int v9 = (const char ***)a2;
  uint64_t v61 = a1;
  int v60 = (int)a4;
  if (PrintConnecting)
  {
    if ((v7 & 8) != 0) {
      uint64_t v42 = " existing";
    }
    else {
      uint64_t v42 = "";
    }
    uint64_t v43 = (const char *)objc_class::nameForLogging(a1);
    int v10 = v7 & 2;
    uint64_t v44 = " (meta)";
    if ((v7 & 2) == 0) {
      uint64_t v44 = "";
    }
    _objc_inform("CLASS: attaching %d categories to%s class '%s'%s", v8, v42, v43, v44);
    if ((_DWORD)v8)
    {
      uint64_t v45 = v8;
      unint64_t v46 = v9;
      do
      {
        unint64_t v47 = *v46;
        v46 += 2;
        _objc_inform("    category: (%s) %p", *v47, v47);
        --v45;
      }

      while (v45);
    }
  }

  else
  {
    int v10 = v7 & 2;
  }

  v57[128] = 0;
  v58[128] = 0;
  v59[128] = 0;
  v54[128] = 0;
  v55[128] = 0;
  v56[128] = 0;
  char v53 = 0;
  uint64_t v11 = *(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
  if ((v11 & 1) == 0) {
    unint64_t v12 = class_rw_t::extAlloc((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL, v12, 0);
  }
  unint64_t v50 = v12;
  unint64_t v52 = v12;
  if ((_DWORD)v8)
  {
    char v13 = 0;
    uint64_t v8 = v8;
    uint64_t v48 = (unint64_t *)(v12 + 24);
    while (1)
    {
      if (v10) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      unsigned int v15 = *v9;
      uint64_t v16 = v9[1];
      uint64_t v17 = (*v9)[v14];
      int v18 = *((unsigned __int8 *)v16 + (void)v16[1] + 12);
      BOOL v19 = DisablePreattachedCategories == 0;
      char v20 = v18 & v19;
      if ((v18 & v19) != 0) {
        uint64_t v21 = v57;
      }
      else {
        uint64_t v21 = v54;
      }
      if (v17)
      {
        else {
          uint64_t v22 = v54;
        }
        unsigned int v23 = v22[128];
        if (v23 >= 0x40)
        {
          prepareMethodLists(a1, (method_list_t **)v21, v23, 0LL, v13 != 0, (unint64_t)"attachCategories", a7);
          else {
            uint64_t v24 = 0LL;
          }
          list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v50 + 8),  (unint64_t *)v21,  (const char *)v22[128],  (char *)(v20 & 1),  v24);
          unsigned int v23 = 0;
          char v13 = v53;
          unsigned int v15 = *v9;
          uint64_t v16 = v9[1];
        }

        v22[128] = v23 + 1;
        *(void *)&v21[2 * (v23 ^ 0x3F)] = v17;
        v13 |= *(_DWORD *)((char *)v16 + (void)*v16 + 12) == 8;
        char v53 = v13;
      }

      if (!v10) {
        break;
      }
      if ((*((_BYTE *)v16 + (void)v16[1] + 12) & 0x40) != 0)
      {
        unint64_t v25 = (unint64_t *)(v15 + 6);
LABEL_29:
        unint64_t v26 = *v25;
        if (*v25)
        {
          if ((v20 & 1) != 0) {
            uint64_t v27 = (unint64_t *)v58;
          }
          else {
            uint64_t v27 = (unint64_t *)v55;
          }
          if ((v20 & 1) != 0) {
            unint64_t v28 = v57;
          }
          else {
            unint64_t v28 = v54;
          }
          unsigned int v29 = v28[258];
          if (v29 >= 0x40)
          {
            if ((v20 & 1) != 0) {
              unsigned int v30 = v57;
            }
            else {
              unsigned int v30 = v54;
            }
            else {
              BOOL v31 = 0LL;
            }
            list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v50 + 16),  v27,  (const char *)v30[258],  (char *)(v20 & 1),  v31);
            unsigned int v29 = 0;
          }

          v28[258] = v29 + 1;
          v27[v29 ^ 0x3F] = v26;
        }

        if (!v10)
        {
          unint64_t v32 = (unint64_t)(*v9)[4];
          if (v32)
          {
            if ((v20 & 1) != 0) {
              BOOL v33 = (unint64_t *)v59;
            }
            else {
              BOOL v33 = (unint64_t *)v56;
            }
            if ((v20 & 1) != 0) {
              BOOL v34 = v57;
            }
            else {
              BOOL v34 = v54;
            }
            unsigned int v35 = v34[388];
            if (v35 >= 0x40)
            {
              if ((v20 & 1) != 0) {
                BOOL v36 = v57;
              }
              else {
                BOOL v36 = v54;
              }
              else {
                uint64_t v37 = 0LL;
              }
              list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( v48,  v33,  (const char *)v36[388],  (char *)(v20 & 1),  v37);
              unsigned int v35 = 0;
            }

            v34[388] = v35 + 1;
            v33[v35 ^ 0x3F] = v32;
          }
        }
      }

      v9 += 2;
      if (!--v8) {
        goto LABEL_63;
      }
    }

    unint64_t v25 = (unint64_t *)(v15 + 5);
    goto LABEL_29;
  }

LABEL_63:
  v51[0] = (uint64_t *)&v61;
  v51[1] = (uint64_t *)&v53;
  v51[2] = (uint64_t *)&v52;
  v51[3] = (uint64_t *)&v60;
  attachCategories(objc_class *,locstamped_category_t const*,unsigned int,objc_class *,int)::$_0::operator()( v51,  v57,  (char *)1,  (uint64_t)a4,  a5,  a6,  a7);
  attachCategories(objc_class *,locstamped_category_t const*,unsigned int,objc_class *,int)::$_0::operator()( v51,  v54,  0LL,  v38,  v39,  v40,  v41);
}

        return;
      }

      if (4 * (int)qword_18C43F110 + 4 >= (3 * dword_18C43F118))
      {
        objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::grow(2 * dword_18C43F118);
        objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -(uint64_t)object,  &v40);
      }

      else
      {
        if (dword_18C43F118 + ~(_DWORD)qword_18C43F110 - HIDWORD(qword_18C43F110) > dword_18C43F118 >> 3)
        {
LABEL_19:
          if (*v14 == 2LL)
          {
            qword_18C43F110 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F110, (int32x2_t)0xFFFFFFFF00000001LL);
          }

          else if (-*(void *)v14 == -1LL)
          {
            LODWORD(qword_18C43F110) = qword_18C43F110 + 1;
          }

          else
          {
            free(*(void **)&v14[1]);
          }

          v14[1] = 0LL;
          v14[2] = 0LL;
          *uint64_t v14 = (int32x2_t)-(uint64_t)object;
          v14[3].i32[0] = 0;
          goto LABEL_46;
        }

        objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::grow(dword_18C43F118);
        objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -(uint64_t)object,  &v40);
      }

      uint64_t v14 = v40;
      goto LABEL_19;
    }
  }

  while (__stxr(v11, (unsigned int *)&AssociationsManagerLock));
  if (value) {
    goto LABEL_16;
  }
LABEL_23:
  unsigned int v15 = objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -(uint64_t)object,  &v40);
  uint64_t v16 = v40;
  else {
    uint64_t v17 = v15;
  }
  if (v17 == 1
    && ((int v18 = (void **)&v40[1],
         BOOL v19 = objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( (uint64_t)&v40[1],  (unint64_t)v39,  &v40),  v20 = v40,  v40 != (int32x2_t *)(*(void *)&v16[1] + 24LL * v16[3].u32[0]))
      ? (uint64_t v21 = v19)
      : (uint64_t v21 = 0),
        v21 == 1))
  {
    uint64_t v14 = (int32x2_t *)v40[1];
    uint64_t v22 = (void *)v40[2];
    v40[1] = (int32x2_t)policy;
    v20[2] = (int32x2_t)v8;
    void *v20 = (int32x2_t)-2LL;
    unsigned int v23 = vadd_s32(v16[2], (int32x2_t)0x1FFFFFFFFLL);
    v16[2] = v23;
    uint64_t v24 = v16[3].u32[0];
    if (v23.i32[0])
    {
      if (v24 >= 0x401 && v24 >> 4 > v23.i32[0])
      {
        objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::grow( (uint64_t)&v16[1],  2 * v23.i32[0]);
        if (!v16[2].i32[0]) {
          goto LABEL_70;
        }
      }
    }

    else
    {
      if (v24)
      {
        free(*v18);
        *int v18 = 0LL;
        v16[2] = 0LL;
        v16[3].i32[0] = 0;
      }

      else
      {
        v16[2] = 0LL;
      }

void objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::compact()
{
  if ((_DWORD)qword_18C43F840)
  {
  }

  else
  {
    if (!dword_18C43F848) {
      goto LABEL_16;
    }
    uint64_t v1 = 24LL * dword_18C43F848;
    uint64_t v2 = objc::unattachedCategories + 8;
    do
    {
      if (*(void *)(v2 - 8) <= 0xFFFFFFFFFFFFFFFDLL && (*(_BYTE *)(v2 + 8) & 1) != 0) {
        free(*(void **)v2);
      }
      v2 += 24LL;
      v1 -= 24LL;
    }

    while (v1);
    if (dword_18C43F848)
    {
      free((void *)objc::unattachedCategories);
      objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::init(0LL);
    }

    else
    {
LABEL_16:
      qword_18C43F840 = 0LL;
    }
  }

void objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::grow( int a1)
{
  uint64_t v1 = dword_18C43F848;
  uint64_t v2 = (char *)objc::unattachedCategories;
  unsigned int v3 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = v4 | HIWORD(v4);
  else {
    uint64_t v6 = 4LL;
  }
  dword_18C43F848 = v6;
  char v7 = malloc(8 * (v6 + 2LL * v6));
  objc::unattachedCategories = (uint64_t)v7;
  if (v2)
  {
    qword_18C43F840 = 0LL;
    uint64_t v8 = 24 * v6;
    do
    {
      *char v7 = -1LL;
      v7 += 3;
      v8 -= 24LL;
    }

    while (v8);
    if ((_DWORD)v1)
    {
      uint64_t v9 = 24 * v1;
      int v10 = v2 + 8;
      do
      {
        unint64_t v11 = *((void *)v10 - 1);
        if (v11 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( v11,  &v15);
          uint64_t v12 = v15;
          uint64_t v13 = *((void *)v10 - 1);
          *(void *)(v15 + 8) = 0LL;
          *(void *)(v12 + 16) = 0LL;
          *(void *)uint64_t v12 = v13;
          *(_OWORD *)(v12 + 8) = *(_OWORD *)v10;
          *(void *)int v10 = 0LL;
          *((void *)v10 + 1) = 0LL;
          LODWORD(qword_18C43F840) = qword_18C43F840 + 1;
        }

        v10 += 24;
        v9 -= 24LL;
      }

      while (v9);
    }

    free(v2);
  }

  else
  {
    qword_18C43F840 = 0LL;
    uint64_t v14 = 24 * v6;
    do
    {
      *char v7 = -1LL;
      v7 += 3;
      v14 -= 24LL;
    }

    while (v14);
  }

void *objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::init( void *result)
{
  if ((_DWORD)result)
  {
    unsigned int v1 = (4 * (int)result / 3u + 1) | ((4 * (int)result / 3u + 1) >> 1);
    unsigned int v2 = v1 | (v1 >> 2) | ((v1 | (v1 >> 2)) >> 4);
    unsigned int v3 = v2 | (v2 >> 8) | ((v2 | (v2 >> 8)) >> 16);
    dword_18C43F848 = v3 + 1;
    unint64_t result = malloc(24LL * (v3 + 1));
    objc::unattachedCategories = (uint64_t)result;
    qword_18C43F840 = 0LL;
    uint64_t v4 = 24LL * v3 + 24;
    do
    {
      _DWORD *result = -1LL;
      result += 3;
      v4 -= 24LL;
    }

    while (v4);
  }

  else
  {
    objc::unattachedCategories = 0LL;
    qword_18C43F840 = 0LL;
    dword_18C43F848 = 0;
  }

  return result;
}

void attachCategories(objc_class *,locstamped_category_t const*,unsigned int,objc_class *,int)::$_0::operator()( uint64_t **a1, unsigned int *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = a2[128];
  if ((_DWORD)v10)
  {
    unint64_t v11 = a2 + 128;
    prepareMethodLists( (objc_class *)**a1,  (method_list_t **)&a2[-2 * v10 + 128],  v10,  0LL,  *(unsigned __int8 *)a1[1],  (unint64_t)"operator()",  a7);
    uint64_t v12 = PrintPreopt ? "methods" : 0LL;
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(*a1[2] + 8),  (unint64_t *)&v11[-2 * *v11],  (const char *)*v11,  a3,  v12);
    if ((*(_BYTE *)a1[3] & 8) != 0)
    {
      uint64_t v14 = **a1;
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3321888768LL;
      v17[2] = ___ZZL16attachCategoriesP10objc_classPK21locstamped_category_tjS0_iENK3__0clEPZL16attachCategoriesS0_S3_jS0_iE5Listsb_block_invoke;
      v17[3] = &__block_descriptor_33_e8_32c127_ZTSKZZL16attachCategoriesP10objc_classPK21locstamped_category_tjS0_iENK3__0clEPZL16attachCategoriesS0_S3_jS0_iE5ListsbEUlS0_E__e8_B16__0_8l;
      flushCaches(v14, (uint64_t)"operator()", (const char *)v17, v13);
    }
  }

  else {
    uint64_t v15 = 0LL;
  }
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(*a1[2] + 16),  (unint64_t *)&a2[-2 * a2[258] + 258],  (const char *)a2[258],  a3,  v15);
  else {
    uint64_t v16 = 0LL;
  }
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(*a1[2] + 24),  (unint64_t *)&a2[-2 * a2[388] + 388],  (const char *)a2[388],  a3,  v16);
}

BOOL ___ZZL16attachCategoriesP10objc_classPK21locstamped_category_tjS0_iENK3__0clEPZL16attachCategoriesS0_S3_jS0_iE5Listsb_block_invoke( uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(objc_cache **)(a2 + 16);
  return v2 == &_objc_empty_cache || HIWORD(*(void *)(a2 + 16)) != 0LL;
}

uint64_t flushCaches(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = ___ZL11flushCachesP10objc_classPKcU13block_pointerFbS0_E_block_invoke;
  uint64_t v13 = &unk_18961DAB0;
  uint64_t v14 = a3;
  uint64_t v15 = a2;
  if (a1) {
    return foreach_realized_class_and_subclass(a1, (uint64_t)&v10);
  }
  int v5 = *(_DWORD *)(gdb_objc_realized_classes + 8);
  if (DisablePreopt) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = _dyld_objc_class_count();
  }
  uint64_t v6 = _firstRealizedClass;
  if (_firstRealizedClass)
  {
    int v7 = 16 * (result + v5) + 16;
    do
    {
      if (!--v7) {
LABEL_21:
      }
        _objc_fatal("Memory corruption in class list.", a2, a3, a4, v10, v11);
      uint64_t v8 = v6;
      while (1)
      {
        uint64_t result = v12((uint64_t)&v10, v8);
        if (!(_DWORD)result || (uint64_t v9 = *(void *)((*(void *)(v8 + 32) & 0xF00007FFFFFFFF8LL) + 0x10)) == 0)
        {
          while (1)
          {
            uint64_t v9 = *(void *)((*(void *)(v8 + 32) & 0xF00007FFFFFFFF8LL) + 0x18);
            if (v8 == v6 || v9) {
              break;
            }
            uint64_t v8 = *(void *)(v8 + 8);
            if (!--v7) {
              goto LABEL_21;
            }
          }

          if (v8 == v6) {
            break;
          }
        }

        uint64_t v8 = v9;
        if (!--v7) {
          goto LABEL_21;
        }
      }

      uint64_t v6 = *(void *)((*(void *)(v6 + 32) & 0xF00007FFFFFFFF8LL) + 0x18);
    }

    while (v6);
  }

  return result;
}

uint64_t ___ZL11flushCachesP10objc_classPKcU13block_pointerFbS0_E_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t foreach_realized_class_and_subclass(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(gdb_objc_realized_classes + 8);
  if (DisablePreopt) {
    int v5 = 0;
  }
  else {
    int v5 = _dyld_objc_class_count();
  }
  int v6 = (16 * (v5 + v4)) | 0xF;
  uint64_t v7 = a1;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
    if (!(_DWORD)result || (uint64_t v12 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 0x10)) == 0)
    {
      while (1)
      {
        uint64_t v12 = *(void *)((*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL) + 0x18);
        if (v7 == a1 || v12) {
          break;
        }
        uint64_t v7 = *(void *)(v7 + 8);
        if (!--v6) {
          goto LABEL_13;
        }
      }

      if (v7 == a1) {
        return result;
      }
    }

    uint64_t v7 = v12;
    if (!--v6) {
LABEL_13:
    }
      _objc_fatal("Memory corruption in class list.", v9, v10, v11);
  }

unint64_t method_t::impRaw(unint64_t this)
{
  unint64_t v1 = this;
  int v2 = this & 3;
  if ((this & 3) == 0 || v2 == 2) {
    return *(void *)((this & 0xFFFFFFFFFFFFFFFCLL) + 16);
  }
  if (v2 == 1)
  {
    this = method_t_remappedImp_nolock((const method_t *)this);
    if (!this) {
      return *(int *)((v1 & 0xFFFFFFFFFFFFFFFCLL) + 8) + (v1 & 0xFFFFFFFFFFFFFFFCLL) + 8;
    }
  }

  return this;
}

uint64_t list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::begin( uint64_t a1, void *a2, const char *a3, char *a4)
{
  unsigned int v30 = a2;
  uint64_t v4 = *a2 & 3LL;
  int v5 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (!v6)
  {
    unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v26 = a2;
LABEL_9:
    uint64_t v27 = 0LL;
    return list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26,  a4);
  }

  if (*a2 > 3uLL)
  {
    if (v4 == 1 && v5 != 0LL)
    {
      unint64_t v31 = (unint64_t)(v5 + 2);
      unint64_t v26 = a2;
      goto LABEL_26;
    }

    if (v4 == 2 && v5 != 0LL)
    {
      if (DisablePreattachedCategories)
      {
        unint64_t v12 = *v5;
        uint64_t v20 = v5[1];
        unint64_t v21 = v20 * (unint64_t)v12;
        if ((v21 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v20,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
        }
        unint64_t v22 = v12 | (v20 << 32);
        uint64_t v23 = (uint64_t)v5 + v21 + 8;
        unint64_t v24 = v12 | ((unint64_t)(v20 - 1) << 32);
        BOOL v25 = (_DWORD)v20 == 0;
        if ((_DWORD)v20) {
          uint64_t v10 = v20;
        }
        else {
          uint64_t v10 = 0LL;
        }
        if ((_DWORD)v20) {
          uint64_t v9 = (unsigned __int16 *)(v23 - v12);
        }
        else {
          uint64_t v9 = (unsigned __int16 *)v23;
        }
        if (v25) {
          unint64_t v11 = v22;
        }
        else {
          unint64_t v11 = v24;
        }
      }

      else
      {
        uint64_t v9 = (unsigned __int16 *)(v5 + 2);
        unint64_t v11 = *v5;
        uint64_t v10 = v5[1];
        unint64_t v12 = v11;
      }

      unint64_t v13 = v10 * (unint64_t)v12;
      if ((v13 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v10,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
      }
      unint64_t v14 = HIDWORD(v11);
      for (i = (unint64_t)v5 + v13 + 8; (unint64_t)v9 < i; unint64_t v14 = (v14 + 1))
      {
        if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v9 + 8) & 1) != 0) {
          break;
        }
        uint64_t v9 = (unsigned __int16 *)((char *)v9 + v11);
      }

      unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v32 = v11 | (v14 << 32);
      BOOL v33 = v9;
    }
  }

  else
  {
    unint64_t v31 = 0LL;
  }

  unint64_t v26 = a2;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_26:
  if (v4 == 1 && v5)
  {
    uint64_t v27 = (uint64_t)&v5[2 * *v5 + 2];
  }

  else if (v4 == 2 && v5)
  {
    uint64_t v17 = *v5;
    uint64_t v16 = v5[1];
    unint64_t v18 = v16 * (unint64_t)v17;
    if ((v18 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v16, v5, v17);
    }
    uint64_t v27 = (uint64_t)v5;
    uint64_t v28 = v17 | (v16 << 32);
    uint64_t v29 = (uint64_t)v5 + v18 + 8;
  }

  return list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26,  a4);
}

uint64_t list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::end( uint64_t a1, void *a2, const char *a3, char *a4)
{
  uint64_t v5 = *a2 & 3LL;
  BOOL v6 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v5 == 1 && v6 != 0LL)
  {
    v6 += 2 * *v6 + 2;
    uint64_t v17 = a2;
LABEL_15:
    unint64_t v18 = v6;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    return list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
  }

  if (v5 == 2 && v6 != 0LL)
  {
    uint64_t v10 = *v6;
    uint64_t v9 = v6[1];
    unint64_t v11 = v9 * (unint64_t)v10;
    if ((v11 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v9,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v10);
    }
    uint64_t v5 = (uint64_t)v6 + v11 + 8;
    uint64_t v4 = v10 | (v9 << 32);
    uint64_t v17 = a2;
    goto LABEL_18;
  }

  BOOL v6 = 0LL;
  uint64_t v17 = a2;
  if (v5 == 2)
  {
LABEL_18:
    unint64_t v18 = v6;
    uint64_t v19 = v4;
    uint64_t v20 = v5;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    return list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
  }

  if (v5 == 1) {
    goto LABEL_15;
  }
  if (v5)
  {
    unint64_t v13 = a2;
  }

  else
  {
    unint64_t v18 = 0LL;
    unint64_t v13 = a2;
    unint64_t v14 = 0LL;
  }

  return list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
}

BOOL list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( uint64_t a1, void *a2)
{
  int v2 = *(void **)a1;
  if (*(void *)a1 != *a2) {
    return 0LL;
  }
  unint64_t v3 = *v2 & 3LL;
  if (v3 == 2)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    uint64_t v5 = a2[3];
  }

  else
  {
    if (v3 > 1) {
      return 0LL;
    }
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = a2[1];
  }

  if (v4 != v5) {
    return 0LL;
  }
  if (v2 == *(void **)(a1 + 32)
    && (v3 == 2
      ? (uint64_t v7 = *(void *)(a1 + 24), v8 = *(void *)(a1 + 56))
      : (uint64_t v7 = *(void *)(a1 + 8), v8 = *(void *)(a1 + 40)),
        v7 == v8))
  {
    return 1LL;
  }

  else
  {
    return *(void *)(a1 + 72) == a2[9];
  }

uint64_t **list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator++( uint64_t **a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = a1[8];
  BOOL v6 = (uint64_t *)((char *)a1[9] + v5);
  a1[9] = v6;
  *((_DWORD *)a1 + 17) = HIDWORD(v5) + 1;
  if (v6 != a1[11]) {
    return a1;
  }
  uint64_t v7 = *a1;
  uint64_t v8 = **a1;
  if ((v8 & 3) == 1)
  {
    ++a1[1];
    uint64_t v8 = *v7;
  }

  else if ((v8 & 3) == 0)
  {
    a1[1] = 0LL;
  }

  if ((v8 & 3) == 2)
  {
    uint64_t v9 = a1[3];
    uint64_t v10 = *((unsigned int *)a1 + 4);
    int v11 = *((_DWORD *)a1 + 5);
    a1[3] = (uint64_t *)((char *)v9 + v10);
    unint64_t v12 = (unsigned int *)a1[1];
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    unint64_t v15 = v13 * (unint64_t)v14;
    *((_DWORD *)a1 + 5) = v11 + 1;
    if ((v15 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v13, v12, v14);
    }
    unint64_t v16 = (unint64_t)v12 + v15 + 8;
    if ((unint64_t)v9 + v10 < v16)
    {
      uint64_t v17 = objc_debug_headerInfoRWs;
      int v18 = v11 + 2;
      do
      {
        a1[3] = (uint64_t *)((char *)v9 + 2 * v10);
        *((_DWORD *)a1 + 5) = v18++;
        uint64_t v9 = (uint64_t *)((char *)v9 + v10);
      }

      while ((unint64_t)v9 + v10 < v16);
    }
  }

  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists(a1);
  unint64_t v22 = *a1;
  uint64_t v23 = **a1 & 3;
  if (*a1 == a1[4])
  {
    if (v23 != 2)
    {
      if (v23 != 1)
      {
        if (!v23)
        {
          unint64_t v24 = a1[1];
          if (v24 == a1[5]) {
            return a1;
          }
          goto LABEL_29;
        }

LABEL_22:
        unint64_t v24 = 0LL;
        goto LABEL_29;
      }

      unint64_t v26 = a1[1];
      if (v26 == a1[5]) {
        return a1;
      }
      goto LABEL_28;
    }

    BOOL v25 = a1[3];
    if (v25 == a1[7]) {
      return a1;
    }
LABEL_26:
    unint64_t v24 = (uint64_t *)((char *)v25 + (*v25 >> 16));
    goto LABEL_29;
  }

  if (v23 == 2)
  {
    BOOL v25 = a1[3];
    goto LABEL_26;
  }

  if (v23 != 1)
  {
    if (!v23)
    {
      unint64_t v24 = a1[1];
      goto LABEL_29;
    }

    goto LABEL_22;
  }

  unint64_t v26 = a1[1];
LABEL_28:
  unint64_t v24 = (uint64_t *)*v26;
LABEL_29:
  uint64_t v27 = (uint64_t *)((unsigned __int16)*(_DWORD *)v24 & 0xFFFC);
  unint64_t v28 = (unint64_t)(v24 + 1) & 0xFFFFFFFFFFFFFFFCLL | ((unint64_t)*(unsigned int *)v24 >> 31);
  a1[8] = v27;
  a1[9] = (uint64_t *)v28;
  uint64_t v29 = *v22 & 3;
  if (v29 == 2)
  {
    unsigned int v30 = (int *)((char *)a1[3] + (*a1[3] >> 16));
  }

  else if (v29 == 1)
  {
    unsigned int v30 = (int *)*a1[1];
  }

  else if (v29)
  {
    unsigned int v30 = 0LL;
  }

  else
  {
    unsigned int v30 = (int *)a1[1];
  }

  a1[10] = (uint64_t *)entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd( v30,  v19,  v20,  v21);
  a1[11] = (uint64_t *)v31;
  if (a1[9] == (uint64_t *)v31)
  {
    uint64_t v35 = **a1 & 3;
    if (v35 == 2)
    {
      uint64_t v36 = (uint64_t)a1[3] + (*a1[3] >> 16);
    }

    else if (v35 == 1)
    {
      uint64_t v36 = *a1[1];
    }

    else if (v35)
    {
      uint64_t v36 = 0LL;
    }

    else
    {
      uint64_t v36 = (uint64_t)a1[1];
    }

    _objc_fatal("Assertion failed: (%s) - empty list %p encountered during iteration", v31, v32, v33, "m != mEnd", v36);
  }

  return a1;
}

  if (v10 == v9[16])
  {
    uint64_t v13 = 2 * v10;
    if (2 * v10 <= 1) {
      uint64_t v13 = 1;
    }
    v9[16] = v13;
    uint64_t v14 = realloc(*((void **)v9 + 7), 8LL * v13);
    *((void *)v9 + 7) = v14;
    uint64_t v10 = v9[17];
  }

  else
  {
    uint64_t v14 = (void *)*((void *)v9 + 7);
  }

  v9[17] = v10 + 1;
  v14[v10] = a1;
  int v18 = 0LL;
  unint64_t v15 = (unsigned int (*)(char *, objc_class **))atomic_load((unint64_t *)&GetClassHook);
  if (v15(a1, &v18)) {
    BOOL v6 = v18;
  }
  else {
    BOOL v6 = 0LL;
  }
  unint64_t v16 = v9[17] - 1;
  v9[17] = v16;
  *(void *)(*((void *)v9 + 7) + 8LL * v16) = 0LL;
  return v6;
}

        unint64_t v24 = 0LL;
        goto LABEL_29;
      }

      unint64_t v26 = (unsigned int **)a1[1];
      goto LABEL_28;
    }

    BOOL v25 = a1[3];
    if (v25 == a1[7]) {
      return a1;
    }
LABEL_26:
    unint64_t v24 = (unsigned int *)((char *)v25 + (*v25 >> 16));
    goto LABEL_29;
  }

  if (v23 == 2)
  {
    BOOL v25 = a1[3];
    goto LABEL_26;
  }

  if (v23 != 1)
  {
    if (!v23)
    {
      unint64_t v24 = (unsigned int *)a1[1];
      goto LABEL_29;
    }

    goto LABEL_22;
  }

  unint64_t v26 = (unsigned int **)a1[1];
LABEL_28:
  unint64_t v24 = *v26;
LABEL_29:
  a1[8] = (uint64_t *)*v24;
  a1[9] = (uint64_t *)(v24 + 2);
  uint64_t v27 = *v22 & 3;
  if (v27 == 2)
  {
    unint64_t v28 = (unsigned int *)((char *)a1[3] + (*a1[3] >> 16));
  }

  else if (v27 == 1)
  {
    unint64_t v28 = (unsigned int *)*a1[1];
  }

  else if (v27)
  {
    unint64_t v28 = 0LL;
  }

  else
  {
    unint64_t v28 = (unsigned int *)a1[1];
  }

  a1[10] = (uint64_t *)entsize_list_tt<property_t,property_list_t,0u,PointerModifierNop>::end(v28, v19, v20, v21);
  a1[11] = (uint64_t *)v29;
  if (a1[9] == (uint64_t *)v29)
  {
    BOOL v33 = **a1 & 3;
    if (v33 == 2)
    {
      BOOL v34 = (uint64_t)a1[3] + (*a1[3] >> 16);
    }

    else if (v33 == 1)
    {
      BOOL v34 = *a1[1];
    }

    else if (v33)
    {
      BOOL v34 = 0LL;
    }

    else
    {
      BOOL v34 = (uint64_t)a1[1];
    }

    _objc_fatal("Assertion failed: (%s) - empty list %p encountered during iteration", v29, v30, v31, "m != mEnd", v34);
  }

  return a1;
}

    LOBYTE(anImp) = 0;
  }

  return (char)anImp;
}

uint64_t **list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists( uint64_t **result)
{
  unint64_t v1 = *result;
  int v2 = result[4];
  uint64_t v3 = objc_debug_headerInfoRWs;
  uint64_t v4 = **result;
  while (1)
  {
    uint64_t v5 = v4 & 3;
    if (v1 != v2)
    {
      if (v5 == 1)
      {
        uint64_t v7 = result[1];
        goto LABEL_17;
      }

      if ((v4 & 3) == 0)
      {
        BOOL v6 = result[1];
LABEL_10:
        if (*((_DWORD *)v6 + 1)) {
          return result;
        }
        result[1] = 0LL;
        goto LABEL_19;
      }

      goto LABEL_14;
    }

    if (v5 == 2)
    {
      if (result[3] == result[7]) {
        return result;
      }
      goto LABEL_14;
    }

    if (v5 == 1) {
      break;
    }
    if ((v4 & 3) == 0)
    {
      BOOL v6 = result[1];
      if (v6 == result[5]) {
        return result;
      }
      goto LABEL_10;
    }

uint64_t list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  unint64_t v6 = *v5 & 3LL;
  if (v6 == 2)
  {
    __int128 v7 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v7;
  }

  else if (v6 <= 1)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
  }

  uint64_t v8 = *(void **)a3;
  *(void *)(a1 + 32) = *(void *)a3;
  unint64_t v9 = *v8 & 3LL;
  if (v9 == 2)
  {
    __int128 v10 = *(_OWORD *)(a3 + 8);
    *(void *)(a1 + 56) = *(void *)(a3 + 24);
    *(_OWORD *)(a1 + 40) = v10;
  }

  else if (v9 <= 1)
  {
    *(void *)(a1 + 40) = *(void *)(a3 + 8);
  }

  uint64_t v11 = **(void **)a2 & 3LL;
  if (*(void *)a2 == *(void *)a3)
  {
    if (v11 != 2)
    {
      if (v11 != 1)
      {
        if (!v11)
        {
          uint64_t v12 = *(_DWORD **)(a2 + 8);
          if (v12 == *(_DWORD **)(a3 + 8)) {
            goto LABEL_34;
          }
          goto LABEL_26;
        }

        goto LABEL_19;
      }

      unint64_t v14 = *(_DWORD ***)(a2 + 8);
      if (v14 == *(_DWORD ***)(a3 + 8)) {
        goto LABEL_34;
      }
LABEL_25:
      uint64_t v12 = *v14;
      goto LABEL_26;
    }

    uint64_t v13 = *(uint64_t **)(a2 + 24);
LABEL_23:
    uint64_t v12 = (_DWORD *)((char *)v13 + (*v13 >> 16));
    goto LABEL_26;
  }

  if (v11 == 2)
  {
    uint64_t v13 = *(uint64_t **)(a2 + 24);
    goto LABEL_23;
  }

  if (v11 == 1)
  {
    unint64_t v14 = *(_DWORD ***)(a2 + 8);
    goto LABEL_25;
  }

  if (v11)
  {
LABEL_19:
    uint64_t v12 = 0LL;
    goto LABEL_26;
  }

  uint64_t v12 = *(_DWORD **)(a2 + 8);
LABEL_26:
  uint64_t v15 = (unsigned __int16)*v12 & 0xFFFC;
  unint64_t v16 = (unint64_t)(v12 + 2) & 0xFFFFFFFFFFFFFFFCLL | ((unint64_t)*v12 >> 31);
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v16;
  uint64_t v17 = **(void **)a2 & 3LL;
  if (v17 == 2)
  {
    int v18 = (int *)(*(void *)(a2 + 24) + (**(uint64_t **)(a2 + 24) >> 16));
  }

  else if (v17 == 1)
  {
    int v18 = **(int ***)(a2 + 8);
  }

  else if (v17)
  {
    int v18 = 0LL;
  }

  else
  {
    int v18 = *(int **)(a2 + 8);
  }

  *(void *)(a1 + 80) = entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd( v18,  a2,  (const char *)a3,  a4);
  *(void *)(a1 + 88) = v19;
LABEL_34:
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists((uint64_t **)a1);
  return a1;
}

uint64_t objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find( unint64_t a1)
{
  if (!(_DWORD)qword_18C43F420) {
    return objc::allocatedClasses + 8LL * qword_18C43F420;
  }
  LODWORD(v1) = (qword_18C43F420 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a1 ^ (a1 >> 4))) ^ (1217387093
                                                                                           * (a1 ^ (a1 >> 4))));
  int v2 = (uint64_t *)(objc::allocatedClasses + 8LL * v1);
  uint64_t v3 = *v2;
  if (*v2 != a1)
  {
    unsigned int v4 = 1;
    while (v3 != -1)
    {
      if (v4 > qword_18C43F420) {
        objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( (uint64_t)&objc::allocatedClasses,  (void *)objc::allocatedClasses,  qword_18C43F420);
      }
      int v5 = v1 + v4++;
      uint64_t v1 = v5 & (qword_18C43F420 - 1);
      uint64_t v3 = *(void *)(objc::allocatedClasses + 8LL * v1);
      if (v3 == a1) {
        return objc::allocatedClasses + 8 * v1;
      }
    }

    return objc::allocatedClasses + 8LL * qword_18C43F420;
  }

  return (uint64_t)v2;
}

uint64_t dataSegmentsContain(objc_class *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t result = objc::SafeRanges::find((objc::SafeRanges *)a1, &v5, a3);
  if ((_DWORD)result
    && (unint64_t)&a1->isa[-1].isa + 7 >= 0xF
    && (*(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
  {
    *(_WORD *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 4) = v5;
  }

  return result;
}

unint64_t getMethodNoSuper_nolock(objc_class *a1, objc_selector *a2, const char *a3, char *a4)
{
  uint64_t v4 = *(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = *(void *)(v5 + 32);
    __int128 v7 = (unsigned int *)(v6 & 0xFFFFFFFFFFFFFFFELL);
    if ((v6 & 1) != 0) {
      unint64_t v8 = 0LL;
    }
    else {
      unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
    if ((v6 & 1) != 0 && v7) {
      return getMethodFromRelativeList(v7, a2, a3, a4);
    }
    if (v8)
    {
      uint64_t v13 = (unsigned int *)v8;
      return getMethodFromListArray<method_list_t **>(v13, a2, a3, a4);
    }

    return 0LL;
  }

  uint64_t v10 = *(void *)(v5 + 8);
  uint64_t v11 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFFCLL);
  uint64_t v12 = v10 & 3;
  if ((v10 & 3) != 0) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFFCLL);
  }
  if (v12 == 2) {
    unint64_t v14 = v10 & 0xFFFFFFFFFFFFFFFCLL;
  }
  else {
    unint64_t v14 = 0LL;
  }
  if (v12 != 1 || v11 == 0LL)
  {
    if (v13) {
      return getMethodFromListArray<method_list_t **>(v13, a2, a3, a4);
    }
    if (v14)
    {
      __int128 v7 = (unsigned int *)v14;
      return getMethodFromRelativeList(v7, a2, a3, a4);
    }

    return 0LL;
  }

  if (v13) {
    return getMethodFromListArray<method_list_t **>(v13, a2, a3, a4);
  }
  unsigned int v18 = *v11;
  uint64_t v17 = v11 + 2;
  uint64_t v16 = v18;
  if (!v18) {
    return 0LL;
  }
  uint64_t v19 = 0LL;
  unint64_t v20 = a2 - (objc_selector *)&unk_18E7BB5A8;
  while (1)
  {
    unint64_t v21 = *(unsigned int **)&v17[2 * v19];
    unint64_t v22 = *v21;
    uint64_t v23 = (const char *)((unsigned __int16)v22 & 0xFFFC);
    int v24 = (v22 & 0x80000000) == 0LL ? 24 : 12;
    unint64_t v25 = v22 >> 31;
    if ((~(_DWORD)v22 & 3) == 0 && (_DWORD)v23 == v24) {
      break;
    }
    if ((v22 & 0x80000000) == 0)
    {
      BOOL v72 = (char *)v21[1];
      unint64_t v73 = v72 * (unint64_t)v23;
      if ((v73 & 0xFFFFFFFF00000000LL) == 0)
      {
        BOOL v74 = v21 + 2;
        unint64_t result = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        unint64_t v75 = ((unint64_t)v74 + v73) & 0xFFFFFFFFFFFFFFFCLL | v25;
        if (result == v75) {
          goto LABEL_111;
        }
        while (*(objc_selector **)(result & 0xFFFFFFFFFFFFFFFCLL) != a2)
        {
          result += v23;
          if (result == v75) {
            goto LABEL_111;
          }
        }

        goto LABEL_110;
      }

      goto LABEL_138;
    }

    if (dataSegmentsRanges > (unint64_t)v21 || *(void *)algn_18C43FCB8 <= (unint64_t)v21)
    {
      BOOL v72 = (char *)v21[1];
      unint64_t v77 = v72 * (unint64_t)v23;
      if ((v77 & 0xFFFFFFFF00000000LL) == 0)
      {
        BOOL v78 = v21 + 2;
        unint64_t result = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        unint64_t v79 = ((unint64_t)v78 + v77) & 0xFFFFFFFFFFFFFFFCLL | v25;
        if (result == v79) {
          goto LABEL_111;
        }
        while (*(objc_selector **)((result & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(result & 0xFFFFFFFFFFFFFFFCLL)) != a2)
        {
          result += v23;
          if (result == v79) {
            goto LABEL_111;
          }
        }

        goto LABEL_110;
      }

      goto LABEL_138;
    }

    if (dataSegmentsRanges <= (unint64_t)a2 && *(void *)algn_18C43FCB8 > (unint64_t)a2)
    {
      BOOL v72 = (char *)v21[1];
      unint64_t v80 = v72 * (unint64_t)v23;
      if ((v80 & 0xFFFFFFFF00000000LL) == 0)
      {
        uint64_t v81 = v21 + 2;
        unint64_t result = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        unint64_t v82 = ((unint64_t)v81 + v80) & 0xFFFFFFFFFFFFFFFCLL | v25;
        if (result == v82) {
          goto LABEL_111;
        }
        while ((objc_selector *)((char *)&unk_18E7BB5A8 + *(int *)(result & 0xFFFFFFFFFFFFFFFCLL)) != a2)
        {
          result += v23;
          if (result == v82) {
            goto LABEL_111;
          }
        }

        goto LABEL_110;
      }

LABEL_138:
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  v23,  v72,  v25,  v72,  *(void *)&v17[2 * v19],  v23);
    }

LABEL_111:
    if (++v19 == v16) {
      return 0LL;
    }
  }

  if ((v22 & 0x80000000) != 0)
  {
    if (dataSegmentsRanges > (unint64_t)v21 || *(void *)algn_18C43FCB8 <= (unint64_t)v21)
    {
      unint64_t v37 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
      uint64_t v38 = v21[1];
      if (v38 < 5)
      {
        unint64_t v40 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        if (!(_DWORD)v38) {
          goto LABEL_111;
        }
LABEL_82:
        uint64_t v61 = 0LL;
        int v62 = v38 - 1;
        while (1)
        {
          unint64_t result = v40 + v61;
          unint64_t v63 = *(objc_selector **)(((v40 + v61) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v40 + v61) & 0xFFFFFFFFFFFFFFFCLL));
          if (v63 == a2) {
            break;
          }
          BOOL v64 = v63 > a2 || v62-- == 0;
          v61 += v23;
          if (v64) {
            goto LABEL_111;
          }
        }
      }

      else
      {
        uint64_t v39 = (unsigned __int16)v22 & 0xFFFC;
        unint64_t v40 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        while (1)
        {
          unint64_t result = v40 + ((unsigned __int16)v22 & 0xFFFC) * (unint64_t)(v38 >> 1);
          uint64_t v41 = *(objc_selector **)((result & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(result & 0xFFFFFFFFFFFFFFFCLL));
          BOOL v42 = v41 >= a2;
          if (v41 == a2) {
            break;
          }
          BOOL v43 = v41 < a2;
          unint64_t v44 = result + ((unsigned __int16)v22 & 0xFFFC);
          if (!v42) {
            unint64_t v40 = v44;
          }
          unsigned int v45 = v38 - v43;
          uint64_t v38 = (v38 - v43) >> 1;
          if (v45 <= 9)
          {
            if (!(_DWORD)v38) {
              goto LABEL_111;
            }
            goto LABEL_82;
          }
        }

        if (result <= v37) {
          goto LABEL_110;
        }
        uint64_t v58 = 0LL;
        unint64_t v65 = v40 + ((unsigned __int16)v22 >> 2) * (((2 * v38) & 0x1FFFFFFFCLL) - 4);
        while (*(objc_selector **)(((v65 + v58) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v65 + v58) & 0xFFFFFFFFFFFFFFFCLL)) == a2)
        {
          v58 -= v39;
          unint64_t v60 = result + v58;
          if (result + v58 <= v37) {
            goto LABEL_109;
          }
        }

      uint64_t v17 = v238;
LABEL_112:
      if (!v239) {
        goto LABEL_115;
      }
    }

    unint64_t v22 = 0;
    uint64_t v23 = headerInfoROs + 8;
    int v24 = *(_DWORD *)(headerInfoROs + 4);
    while (1)
    {
      unint64_t v25 = v22 + v21;
      if (v22 + v21 < 0 != __OFADD__(v22, v21)) {
        ++v25;
      }
      unint64_t v26 = v25 >> 1;
      unint64_t v27 = v23 + (v24 * v26);
      uint64_t v28 = (const mach_header_64 *)(*(void *)v27 + v27);
      if (v19 == v28) {
        break;
      }
      if (v19 >= v28) {
        unint64_t v22 = v26 + 1;
      }
      else {
        unint64_t v21 = v26 - 1;
      }
      if (v22 > v21) {
        goto LABEL_23;
      }
    }

    uint64_t v39 = getPreoptimizedHeaderRW(v23 + (v24 * v26));
    unint64_t v40 = (uint64_t *)(v27 + 24);
    if (v39) {
      unint64_t v40 = (uint64_t *)v39;
    }
    uint64_t v41 = *v40;
    if ((*v40 & 1) != 0) {
      goto LABEL_112;
    }
    v238 = v17;
    *unint64_t v40 = v41 | 1;
    if (PrintPreopt)
    {
      BOOL v42 = (const char *)dyld_image_path_containing_address();
      _objc_inform("PREOPTIMIZATION: honoring preoptimized header info at %p for %s", (const void *)v27, v42);
    }

    uint64_t v38 = 0;
LABEL_46:
    size[0] = 0LL;
    BOOL v43 = header_info::classlist((header_info *)v27, size);
    unint64_t v44 = size[0];
    if (v38) {
      unsigned int v45 = size[0];
    }
    else {
      unsigned int v45 = 0;
    }
    if (!v43) {
      unsigned int v45 = 0;
    }
    LODWORD(v234) = v45;
    if (!v43) {
      unint64_t v44 = 0;
    }
    v236 = v44;
    uint64_t v46 = getPreoptimizedHeaderRW(v27);
    int v47 = (void *)(v27 + 24);
    if (v46) {
      int v47 = (void *)v46;
    }
    *v47 &= 3uLL;
    if (FirstHeader)
    {
      unint64_t i = LastHeader;
      BOOL v49 = v235;
      if (!LastHeader)
      {
        for (unint64_t i = FirstHeader; ; unint64_t i = v61 & 0xFFFFFFFFFFFFFFFCLL)
        {
          LastHeader = i;
          unint64_t v59 = getPreoptimizedHeaderRW(i);
          unint64_t v60 = (unint64_t *)(i + 24);
          if (v59) {
            unint64_t v60 = (unint64_t *)v59;
          }
          uint64_t v61 = *v60;
          if (v61 < 4) {
            break;
          }
        }
      }

      unint64_t v50 = getPreoptimizedHeaderRW(i);
      uint64_t v51 = (void *)(i + 24);
      if (v50) {
        uint64_t v51 = (void *)v50;
      }
      void *v51 = v27 & 0xFFFFFFFFFFFFFFFCLL | *v51 & 3LL;
      LastHeader = v27;
    }

    else
    {
      LastHeader = v27;
      FirstHeader = v27;
      BOOL v49 = v235;
    }

    unint64_t v52 = *(void *)v27 + v27;
    if (v232 <= v52 && v231 > v52)
    {
LABEL_91:
      *(_OWORD *)size = *(_OWORD *)v18;
      *((void *)&v64 + 1) = size[1];
      v246 = *(uint64_t (**)(uint64_t, unint64_t, int, _BYTE *))(v18 + 16);
      *(void *)&BOOL v64 = *(void *)(v18 + 24);
      v233 = v64;
      if (v19 != v14)
      {
LABEL_102:
        uint64_t v70 = &v49[40 * v15];
        *(void *)uint64_t v70 = v27;
        *(_OWORD *)(v70 + 8) = *(_OWORD *)size;
        *((void *)v70 + 3) = v246;
        *((void *)v70 + 4) = v233;
        if (HIDWORD(v9[26].info))
        {
          unint64_t v71 = (const char *)dyld_image_path_containing_address();
          BOOL v72 = " (bundle)";
          if (v19->filetype != 8) {
            BOOL v72 = "";
          }
          unint64_t v73 = " (has class properties)";
          if ((*(_DWORD *)(*(void *)(v27 + 8) + v27 + 8 + 4) & 0x40) == 0) {
            unint64_t v73 = "";
          }
          BOOL v74 = " (preoptimized)";
          if ((*(_DWORD *)(*(void *)(v27 + 8) + v27 + 8 + 4) & 8) == 0) {
            BOOL v74 = "";
          }
          _objc_inform("IMAGES: loading image for %s%s%s%s\n", v71, v72, v73, v74);
        }

        v16 += v234;
        v237 = v236 + v237;
        ++v15;
        goto LABEL_111;
      }

      if ((v64 & 1) != 0)
      {
        if ((preoptimized & 1) == 0)
        {
          BOOL v69 = *(void *)v27 + v27;
          goto LABEL_99;
        }

        header_info::selrefs((header_info *)v27, v241);
        unint64_t v65 = v241[0];
        uint64_t v66 = _dyld_lookup_section_info();
        unint64_t v68 = v67 >> 4;
        if (!v66) {
          unint64_t v68 = 0LL;
        }
        v225 += v65 + v68;
      }

      BOOL v69 = *(void *)v27 + v27;
LABEL_99:
      BOOL v49 = v235;
      goto LABEL_102;
    }

    BOOL v54 = size;
    size[0] = (unint64_t)&unk_18961E470;
    v247 = size;
    BOOL v55 = *(unsigned int *)(v52 + 16);
    if ((_DWORD)v55)
    {
      uint64_t v56 = v52 + 32;
      unsigned int v57 = *(unsigned int *)(v52 + 16);
      uint64_t v58 = v52 + 32;
      LODWORD(v227) = v16;
      while (*(_DWORD *)v58 != 25 || strncmp((const char *)(v58 + 8), "__TEXT", 0x10uLL))
      {
        v58 += *(unsigned int *)(v58 + 4);
        if (!--v57) {
          goto LABEL_78;
        }
      }

      unsigned int v57 = v52 - *(void *)(v58 + 24);
LABEL_78:
      for (uint64_t j = 0LL; j < v55; ++j)
      {
        if (*(_DWORD *)v56 == 25
          && (!strncmp((const char *)(v56 + 8), "__DATA", 6uLL) || !strncmp((const char *)(v56 + 8), "__AUTH", 6uLL)))
        {
          v241[0] = v56;
          v244 = v57;
          if (!v247)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
            return;
          }

          (*(void (**)(unint64_t *, unint64_t *, unint64_t *))(*v247 + 48))( v247,  v241,  &v244);
          BOOL v55 = *(unsigned int *)(v52 + 16);
        }

        v56 += *(unsigned int *)(v56 + 4);
      }

      BOOL v54 = v247;
      if (v247 != size)
      {
        BOOL v49 = v235;
        uint64_t v16 = v227;
        unint64_t v9 = &OBJC_CLASS___Object;
        unint64_t v14 = (const mach_header_64 *)v226;
        if (!v247) {
          goto LABEL_91;
        }
        int v62 = 5LL;
        goto LABEL_90;
      }

      BOOL v54 = size;
      int v62 = 4LL;
      BOOL v49 = v235;
      uint64_t v16 = v227;
      unint64_t v9 = &OBJC_CLASS___Object;
    }

    else
    {
      int v62 = 4LL;
    }

    unint64_t v14 = (const mach_header_64 *)v226;
LABEL_90:
    (*(void (**)(void))(*v54 + 8 * v62))();
    goto LABEL_91;
  }

  uint64_t v16 = 0;
  v237 = 0LL;
  v225 = 0LL;
  uint64_t v15 = 0;
LABEL_115:
  LODWORD(v232) = v15;
  if ((map_images_nolock::firstTime & 1) == 0)
  {
    if ((_DWORD)v225)
    {
      unint64_t v75 = (4 * (int)v225 / 3u + 1) | ((4 * (int)v225 / 3u + 1) >> 1);
      BOOL v76 = v75 | (v75 >> 2) | ((v75 | (v75 >> 2)) >> 4);
      unint64_t v77 = (v76 | (v76 >> 8) | ((v76 | (v76 >> 8)) >> 16)) + 1;
      BOOL v78 = malloc(8 * v77);
      memset(v78, 255, 8 * v77);
    }

    else
    {
      LODWORD(v77) = 0;
      BOOL v78 = 0LL;
    }

    dword_18C43F458 = v77;
    namedSelectors[0] = (int32x2_t)v78;
    unk_18C43F450 = 0LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v80 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)&selLock))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_131:
    SEL_cxx_construct = (uint64_t)__sel_registerName(".cxx_construct", 0, 0);
    SEL_cxx_destruct = (uint64_t)__sel_registerName(".cxx_destruct", 0, 0);
    unint64_t v82 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unint64_t v83 = __ldxr((unsigned int *)&selLock);
      if (v83 != v82) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_136:
    objc::AssociationsManager::_mapStorage = 0LL;
    qword_18C43F110 = 0LL;
    dword_18C43F118 = 0;
    pthread_key_init_np();
    pthread_key_init_np();
    if (DebugScanWeakTables)
    {
      _objc_inform("Starting background scan of weak references.");
      uint64_t v84 = pthread_create((pthread_t *)size, 0LL, (void *(__cdecl *)(void *))weakTableScan, 0LL);
      v85 = v84;
      if ((_DWORD)v84)
      {
        v219 = strerror(v84);
        _objc_fatal("pthread_create failed with error %d (%s)", v220, v221, v222, v85, v219);
      }

      pthread_detach((pthread_t)size[0]);
    }

    unsigned int v86 = _dyld_get_prog_image_header();
    if (v86)
    {
      if (*(_DWORD *)(v86 + 4) == 16777228 && (*(_DWORD *)(v86 + 8) & 0xFFFFFF) == 2)
      {
        map_images_nolock::executableIsARM64e = 1;
LABEL_144:
        if (DebugClassRXSigning) {
          unsigned int v87 = map_images_nolock::executableHasClassROSigning;
        }
        else {
          unsigned int v87 = 0;
        }
        if (!(_DWORD)v232) {
          goto LABEL_360;
        }
        unsigned int v88 = v232;
        int v89 = (void **)v235;
        while (1)
        {
          if ((hasSignedClassROPointers((unint64_t)*v89 + **v89) & 1) == 0)
          {
            if (objc::disableEnforceClassRXPtrAuth)
            {
              if (!v87) {
                goto LABEL_155;
              }
LABEL_154:
              v90 = (const char *)dyld_image_path_containing_address();
              _objc_inform( "%s has un-signed class_ro_t pointers, but the main executable was compiled with class_ro_t pointer signing enabled",  v90);
              goto LABEL_155;
            }

            *v224 = 1;
            objc::disableEnforceClassRXPtrAuth = 1LL;
            if (v87) {
              goto LABEL_154;
            }
          }

LABEL_95:
        result += v58;
      }

      goto LABEL_110;
    }

    if (dataSegmentsRanges <= (unint64_t)a2 && *(void *)algn_18C43FCB8 > (unint64_t)a2)
    {
      unint64_t v50 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
      uint64_t v51 = v21[1];
      if (v51 < 5)
      {
        unint64_t v52 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        if (!(_DWORD)v51) {
          goto LABEL_111;
        }
      }

      else
      {
        unint64_t v52 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
        do
        {
          unint64_t result = v52 + ((unsigned __int16)v22 & 0xFFFC) * (unint64_t)(v51 >> 1);
          unint64_t v53 = *(int *)(result & 0xFFFFFFFFFFFFFFFCLL);
          BOOL v54 = v20 > v53;
          if (v20 == v53)
          {
            if (result > v50)
            {
              uint64_t v70 = 0LL;
              unint64_t v71 = v52 + ((unsigned __int16)v22 >> 2) * (((2 * v51) & 0x1FFFFFFFCLL) - 4);
              while (v20 == *(_DWORD *)((v71 + v70) & 0xFFFFFFFFFFFFFFFCLL))
              {
                v70 -= (uint64_t)v23;
                unint64_t v60 = result + v70;
                if (result + v70 <= v50)
                {
LABEL_109:
                  unint64_t result = v60;
                  goto LABEL_110;
                }
              }

              result += v70;
            }

            goto LABEL_110;
          }

          BOOL v55 = v20 > v53;
          uint64_t v56 = &v23[result];
          if (v54) {
            unint64_t v52 = (unint64_t)v56;
          }
          unsigned int v57 = v51 - v55;
          uint64_t v51 = (v51 - v55) >> 1;
        }

        while (v57 > 9);
        if (!(_DWORD)v51) {
          goto LABEL_111;
        }
      }

      uint64_t v66 = 0LL;
      int v67 = v51 - 1;
      while (1)
      {
        unint64_t result = v52 + v66;
        unint64_t v68 = *(int *)((v52 + v66) & 0xFFFFFFFFFFFFFFFCLL);
        if (v20 == v68) {
          goto LABEL_110;
        }
        BOOL v69 = v20 < v68 || v67-- == 0;
        v66 += v23;
        if (v69) {
          goto LABEL_111;
        }
      }
    }

    goto LABEL_111;
  }

  unint64_t v27 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
  uint64_t v28 = v21[1];
  if (v28 >= 5)
  {
    uint64_t v29 = (unsigned __int16)v22 & 0xFFFC;
    unint64_t v30 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
    while (1)
    {
      unint64_t result = v30 + ((unsigned __int16)v22 & 0xFFFC) * (unint64_t)(v28 >> 1);
      uint64_t v31 = *(objc_selector **)(result & 0xFFFFFFFFFFFFFFFCLL);
      BOOL v32 = v31 >= a2;
      if (v31 == a2) {
        break;
      }
      BOOL v33 = v31 < a2;
      unint64_t v34 = result + ((unsigned __int16)v22 & 0xFFFC);
      if (!v32) {
        unint64_t v30 = v34;
      }
      unsigned int v35 = v28 - v33;
      uint64_t v28 = (v28 - v33) >> 1;
      if (v35 <= 9)
      {
        if (!(_DWORD)v28) {
          goto LABEL_111;
        }
        goto LABEL_58;
      }
    }

    if (result <= v27) {
      goto LABEL_110;
    }
    uint64_t v58 = 0LL;
    unint64_t v59 = v30 + ((unsigned __int16)v22 >> 2) * (((2 * v28) & 0x1FFFFFFFCLL) - 4);
    while (*(objc_selector **)((v59 + v58) & 0xFFFFFFFFFFFFFFFCLL) == a2)
    {
      v58 -= v29;
      unint64_t v60 = result + v58;
      if (result + v58 <= v27) {
        goto LABEL_109;
      }
    }

    goto LABEL_95;
  }

  unint64_t v30 = (unint64_t)(v21 + 2) & 0xFFFFFFFFFFFFFFFCLL | v25;
  if (!(_DWORD)v28) {
    goto LABEL_111;
  }
LABEL_58:
  uint64_t v46 = 0LL;
  int v47 = v28 - 1;
  while (1)
  {
    unint64_t result = v30 + v46;
    uint64_t v48 = *(objc_selector **)((v30 + v46) & 0xFFFFFFFFFFFFFFFCLL);
    if (v48 == a2) {
      break;
    }
    BOOL v49 = v48 > a2 || v47-- == 0;
    v46 += v23;
    if (v49) {
      goto LABEL_111;
    }
  }

LABEL_110:
  if (!result) {
    goto LABEL_111;
  }
  return result;
}

unint64_t _method_setImplementation(objc_class *a1, uint64_t this, void (*a3)(void))
{
  unint64_t v4 = 0LL;
  if (this && a3)
  {
    unint64_t v4 = method_t::imp(this, 0);
    int v8 = this & 3;
    if ((this & 3) == 0 || v8 == 2)
    {
      uint64_t v3 = *(char **)(this & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v8 == 1)
    {
      unint64_t v9 = (int *)(this & 0xFFFFFFFFFFFFFFFCLL);
      else {
        uint64_t v3 = (char *)&unk_18E7BB5A8 + *v9;
      }
    }

    method_t::setImp(this, a3);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3321888768LL;
    v14[2] = ___ZL25_method_setImplementationP10objc_classP8method_tPFvvE_block_invoke;
    v14[3] = &__block_descriptor_48_e8_32c67_ZTSKZL25_method_setImplementationP10objc_classP8method_tPFvvEE3__0_e8_B16__0_8l;
    v14[4] = v3;
    v14[5] = v4;
    flushCaches((uint64_t)a1, (uint64_t)"_method_setImplementation", (const char *)v14, v10);
    objc::Scanner::scanChangedMethod((uint64_t)a1, this, v11, v12);
  }

  return v4;
}

uint64_t addMethods_finish( objc_class *a1, method_list_t *a2, const char *a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v16 = a2;
  uint64_t v9 = (uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL;
  uint64_t v10 = *(void *)(v9 + 8);
  unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
  if ((v10 & 1) == 0) {
    unint64_t v11 = class_rw_t::extAlloc(v9, v10 & 0xFFFFFFFFFFFFFFFELL, 0);
  }
  if (*((_DWORD *)a2 + 1) >= 2u) {
    method_list_t::sortBySELAddress(a2, (uint64_t)a2, a3, a4);
  }
  prepareMethodLists(a1, &v16, 1, 0LL, 0LL, (unint64_t)"addMethods_finish", a7);
  else {
    uint64_t v12 = 0LL;
  }
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v11 + 8),  (unint64_t *)&v16,  (const char *)1,  0LL,  v12);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3321888768LL;
  v15[2] = ___ZL17addMethods_finishP10objc_classP13method_list_t_block_invoke;
  v15[3] = &__block_descriptor_33_e8_32c60_ZTSKZL17addMethods_finishP10objc_classP13method_list_tE3__0_e8_B16__0_8l;
  return flushCaches((uint64_t)a1, (uint64_t)"addMethods_finish", (const char *)v15, v13);
}

void method_list_t::sortBySELAddress(method_list_t *this, uint64_t a2, const char *a3, char *a4)
{
  if ((*(_DWORD *)this & 0x80000000) != 0) {
    _objc_fatal("Cannot sort small method list %p", a2, a3, a4, this);
  }
  unint64_t v4 = (__n128 *)(((unint64_t)this + 8) & 0xFFFFFFFFFFFFFFFCLL);
  entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd((int *)this, a2, a3, a4);
  __int128 v7 = (__n128 *)(v6 & 0xFFFFFFFFFFFFFFFCLL);
  uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFCLL) - (void)v4;
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
  if (v8 < 3073)
  {
LABEL_6:
    std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>(v4, v7, v9, 0LL, 0LL, v5);
  }

  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    while (1)
    {
      unint64_t v11 = malloc(24 * v10);
      if (v11) {
        break;
      }
      BOOL v12 = v10 > 1;
      v10 >>= 1;
      if (!v12) {
        goto LABEL_6;
      }
    }

    uint64_t v13 = v11;
    std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( v4,  v7,  v9,  (uint64_t)v11,  v10,  v5);
    free(v13);
  }

BOOL ___ZL17addMethods_finishP10objc_classP13method_list_t_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(objc_cache **)(a2 + 16);
  return v2 == &_objc_empty_cache || HIWORD(*(void *)(a2 + 16)) != 0LL;
}

__n128 std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( __n128 *a1, __n128 *a2, unint64_t a3, uint64_t a4, uint64_t a5, __n128 result)
{
  if (a3 >= 2)
  {
    __int128 v7 = a1;
    if (a3 == 2)
    {
      uint64_t v8 = (__n128 *)((char *)a2 - 24);
      if (a2[-2].n128_u64[1] < a1->n128_u64[0])
      {
        unint64_t v9 = a1[1].n128_u64[0];
        unint64_t result = *a1;
        unint64_t v10 = a2[-1].n128_u64[1];
        *a1 = *v8;
        a1[1].n128_u64[0] = v10;
        *uint64_t v8 = result;
        a2[-1].n128_u64[1] = v9;
      }
    }

    else if ((uint64_t)a3 > 128)
    {
      uint64_t v21 = a4;
      unint64_t v22 = a3 >> 1;
      uint64_t v23 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      unint64_t v24 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        __n128 v25 = std::__stable_sort_move<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( a1,  v23,  v24,  a4,  result);
        uint64_t v26 = v21 + 24 * v22;
        result.n128_u64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( (__n128 *)((char *)v7 + 24 * (a3 >> 1)),  a2,  a3 - (a3 >> 1),  v26,  v25).n128_u64[0];
        unint64_t v27 = (__n128 *)(v21 + 24 * a3);
        uint64_t v28 = (__n128 *)v26;
        while (v28 != v27)
        {
          if (v28->n128_u64[0] >= *(void *)v21)
          {
            unint64_t result = *(__n128 *)v21;
            v7[1].n128_u64[0] = *(void *)(v21 + 16);
            *__int128 v7 = result;
            v21 += 24LL;
          }

          else
          {
            unint64_t result = *v28;
            v7[1].n128_u64[0] = v28[1].n128_u64[0];
            *__int128 v7 = result;
            uint64_t v28 = (__n128 *)((char *)v28 + 24);
          }

          __int128 v7 = (__n128 *)((char *)v7 + 24);
          if (v21 == v26)
          {
            if (v28 != v27)
            {
              unint64_t v29 = 0LL;
              do
              {
                unint64_t v30 = (__n128 *)((char *)v7 + v29);
                unint64_t result = *(__n128 *)((char *)v28 + v29);
                v30[1].n128_u64[0] = v28[1].n128_u64[v29 / 8];
                *unint64_t v30 = result;
                v29 += 24LL;
              }

              while ((__n128 *)((char *)v28 + v29) != v27);
            }

            return result;
          }
        }

        if (v21 != v26)
        {
          uint64_t v31 = 0LL;
          do
          {
            BOOL v32 = (__n128 *)((char *)v7 + v31);
            unint64_t result = *(__n128 *)(v21 + v31);
            v32[1].n128_u64[0] = *(void *)(v21 + v31 + 16);
            *BOOL v32 = result;
            v31 += 24LL;
          }

          while (v21 + v31 != v26);
        }
      }

      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>(a1, v23, v24, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( (char *)v7 + 24 * (a3 >> 1),  a2,  a3 - (a3 >> 1),  v21,  a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( (char *)v7,  (char *)v7 + 24 * (a3 >> 1),  (char *)a2,  a3 >> 1,  a3 - (a3 >> 1),  (char *)v21,  a5);
      }
    }

    else if (a1 != a2)
    {
      BOOL v12 = &a1[1].n128_i8[8];
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v13 = 0LL;
        unint64_t v14 = a1;
        do
        {
          uint64_t v15 = (__n128 *)v12;
          unint64_t v16 = v14[1].n128_u64[1];
          if (v16 < v14->n128_u64[0])
          {
            __n128 v33 = v14[2];
            uint64_t v17 = v13;
            while (1)
            {
              unsigned int v18 = (char *)a1 + v17;
              *(__n128 *)(v18 + 24) = *(__n128 *)((char *)a1 + v17);
              *((void *)v18 + 5) = *(unint64_t *)((char *)a1[1].n128_u64 + v17);
              if (!v17) {
                break;
              }
              v17 -= 24LL;
              if (v16 >= *((void *)v18 - 3))
              {
                uint64_t v19 = (uint64_t)&a1[1].n128_i64[1] + v17;
                goto LABEL_15;
              }
            }

            uint64_t v19 = (uint64_t)a1;
LABEL_15:
            *(void *)uint64_t v19 = v16;
            unint64_t result = v33;
            *(__n128 *)(v19 + 8) = v33;
          }

          BOOL v12 = &v15[1].n128_i8[8];
          v13 += 24LL;
          unint64_t v14 = v15;
        }

        while (&v15[1].n128_i8[8] != (__int8 *)a2);
      }
    }
  }

  return result;
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( __n128 *a1, __n128 *a2, unint64_t a3, uint64_t a4, __n128 result)
{
  if (a3)
  {
    __n128 v5 = (__n128 *)a4;
    uint64_t v8 = a1;
    if (a3 == 2)
    {
      unint64_t v9 = (__n128 *)((char *)a2 - 24);
      if (a2[-2].n128_u64[1] >= a1->n128_u64[0])
      {
        __n128 v19 = *a1;
        *(void *)(a4 + 16) = a1[1].n128_u64[0];
        *(__n128 *)a4 = v19;
        unint64_t result = *v9;
        unint64_t v11 = a2[-1].n128_u64[1];
      }

      else
      {
        __n128 v10 = *v9;
        *(void *)(a4 + 16) = a2[-1].n128_u64[1];
        *(__n128 *)a4 = v10;
        unint64_t result = *a1;
        unint64_t v11 = a1[1].n128_u64[0];
      }

      *(void *)(a4 + 40) = v11;
      *(__n128 *)(a4 + 24) = result;
    }

    else if (a3 == 1)
    {
      unint64_t result = *a1;
      *(void *)(a4 + 16) = a1[1].n128_u64[0];
      *(__n128 *)a4 = result;
    }

    else if ((uint64_t)a3 > 8)
    {
      unint64_t v20 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( a1,  v20,  a3 >> 1,  a4,  a3 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( (char *)v8 + 24 * (a3 >> 1),  a2,  a3 - (a3 >> 1),  (char *)v5 + 24 * (a3 >> 1),  a3 - (a3 >> 1));
      uint64_t v21 = (__n128 *)((char *)v8 + 24 * (a3 >> 1));
      while (v21 != a2)
      {
        if (v21->n128_u64[0] >= v8->n128_u64[0])
        {
          unint64_t result = *v8;
          v5[1].n128_u64[0] = v8[1].n128_u64[0];
          *__n128 v5 = result;
          uint64_t v8 = (__n128 *)((char *)v8 + 24);
        }

        else
        {
          unint64_t result = *v21;
          v5[1].n128_u64[0] = v21[1].n128_u64[0];
          *__n128 v5 = result;
          uint64_t v21 = (__n128 *)((char *)v21 + 24);
        }

        __n128 v5 = (__n128 *)((char *)v5 + 24);
        if (v8 == v20)
        {
          if (v21 != a2)
          {
            unint64_t v22 = 0LL;
            do
            {
              uint64_t v23 = (__n128 *)((char *)v5 + v22);
              unint64_t result = *(__n128 *)((char *)v21 + v22);
              v23[1].n128_u64[0] = v21[1].n128_u64[v22 / 8];
              __n128 *v23 = result;
              v22 += 24LL;
            }

            while ((__n128 *)((char *)v21 + v22) != a2);
          }

          return result;
        }
      }

      if (v8 != v20)
      {
        unint64_t v24 = 0LL;
        do
        {
          __n128 v25 = (__n128 *)((char *)v5 + v24);
          unint64_t result = *(__n128 *)((char *)v8 + v24);
          v25[1].n128_u64[0] = v8[1].n128_u64[v24 / 8];
          __n128 *v25 = result;
          v24 += 24LL;
        }

        while ((__n128 *)((char *)v8 + v24) != v20);
      }
    }

    else if (a1 != a2)
    {
      unint64_t result = *a1;
      *(void *)(a4 + 16) = a1[1].n128_u64[0];
      *(__n128 *)a4 = result;
      BOOL v12 = (__n128 *)((char *)a1 + 24);
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v13 = 0LL;
        unint64_t v14 = (void *)a4;
        do
        {
          uint64_t v15 = v14;
          unint64_t v16 = *v14;
          v14 += 3;
          uint64_t v17 = v14;
          if (v12->n128_u64[0] < v16)
          {
            *(_OWORD *)unint64_t v14 = *(_OWORD *)v15;
            v14[2] = v15[2];
            uint64_t v17 = (void *)a4;
            if (v15 != (void *)a4)
            {
              uint64_t v18 = v13;
              while (1)
              {
                uint64_t v17 = (void *)(a4 + v18);
                if (v12->n128_u64[0] >= *(void *)(a4 + v18 - 24)) {
                  break;
                }
                *(_OWORD *)uint64_t v17 = *(_OWORD *)(a4 + v18 - 24);
                v17[2] = *(void *)(a4 + v18 - 8);
                v18 -= 24LL;
                if (!v18)
                {
                  uint64_t v17 = (void *)a4;
                  break;
                }
              }
            }
          }

          unint64_t result = *v12;
          v17[2] = v12[1].n128_u64[0];
          *(__n128 *)uint64_t v17 = result;
          BOOL v12 = (__n128 *)((char *)v12 + 24);
          v13 += 24LL;
        }

        while (v12 != a2);
      }
    }
  }

  return result;
}

char *std::__inplace_merge<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( char *result, char *a2, char *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  if (a5)
  {
    unint64_t v9 = result;
    while (a5 > a7 && a4 > a7)
    {
      if (!a4) {
        return result;
      }
      while (*(void *)a2 >= *(void *)v9)
      {
        v9 += 24;
        if (!--a4) {
          return result;
        }
      }

      if (a4 >= a5)
      {
        if (a4 == 1)
        {
          uint64_t v98 = *((void *)v9 + 2);
          __int128 v93 = *(_OWORD *)v9;
          __int128 v79 = *(_OWORD *)a2;
          *((void *)v9 + 2) = *((void *)a2 + 2);
          *(_OWORD *)unint64_t v9 = v79;
          *((void *)a2 + 2) = v98;
          *(_OWORD *)a2 = v93;
          return result;
        }

        if (a4 >= 0) {
          uint64_t v20 = a4;
        }
        else {
          uint64_t v20 = a4 + 1;
        }
        uint64_t v21 = v20 >> 1;
        unint64_t v14 = &v9[24 * (v20 >> 1)];
        if (a3 == a2)
        {
          BOOL v12 = a3;
          unint64_t v27 = a3;
        }

        else
        {
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 3);
          BOOL v12 = a2;
          do
          {
            unint64_t v23 = v22 >> 1;
            unint64_t v24 = &v12[24 * (v22 >> 1)];
            unint64_t v26 = *(void *)v24;
            __n128 v25 = v24 + 24;
            v22 += ~(v22 >> 1);
            if (v26 < *(void *)v14) {
              BOOL v12 = v25;
            }
            else {
              unint64_t v22 = v23;
            }
          }

          while (v22);
          unint64_t v27 = a2;
        }

        uint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v12 - v27) >> 3);
      }

      else
      {
        if (a5 >= 0) {
          uint64_t v10 = a5;
        }
        else {
          uint64_t v10 = a5 + 1;
        }
        uint64_t v11 = v10 >> 1;
        BOOL v12 = &a2[24 * (v10 >> 1)];
        if (a2 == v9)
        {
          unint64_t v14 = a2;
          __n128 v19 = a2;
        }

        else
        {
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v9) >> 3);
          unint64_t v14 = v9;
          do
          {
            unint64_t v15 = v13 >> 1;
            unint64_t v16 = &v14[24 * (v13 >> 1)];
            unint64_t v18 = *(void *)v16;
            uint64_t v17 = v16 + 24;
            v13 += ~(v13 >> 1);
            if (*(void *)v12 < v18) {
              unint64_t v13 = v15;
            }
            else {
              unint64_t v14 = v17;
            }
          }

          while (v13);
          __n128 v19 = v9;
        }

        uint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v19) >> 3);
      }

      uint64_t v28 = v12;
      if (v14 != a2)
      {
        uint64_t v28 = v14;
        if (a2 != v12)
        {
          if (v14 + 24 == a2)
          {
            uint64_t v95 = *((void *)v14 + 2);
            __int128 v90 = *(_OWORD *)v14;
            int64_t v34 = v12 - a2;
            uint64_t v85 = a5;
            unsigned int v87 = a6;
            unsigned int v35 = a3;
            uint64_t v83 = a7;
            uint64_t v36 = v11;
            memmove(v14, a2, v12 - a2);
            uint64_t v11 = v36;
            a7 = v83;
            a5 = v85;
            a3 = v35;
            a6 = v87;
            uint64_t v28 = &v14[v34];
            *(_OWORD *)uint64_t v28 = v90;
            *((void *)v28 + 2) = v95;
          }

          else if (a2 + 24 == v12)
          {
            uint64_t v28 = v14 + 24;
            uint64_t v96 = *((void *)v12 - 1);
            __int128 v91 = *(_OWORD *)(v12 - 24);
            if (v12 - 24 != v14)
            {
              uint64_t v86 = a5;
              unsigned int v88 = a6;
              unint64_t v37 = a3;
              uint64_t v84 = a7;
              uint64_t v38 = v11;
              memmove(v14 + 24, v14, v12 - 24 - v14);
              uint64_t v11 = v38;
              a7 = v84;
              a5 = v86;
              a3 = v37;
              a6 = v88;
            }

            *((void *)v14 + 2) = v96;
            *(_OWORD *)unint64_t v14 = v91;
          }

          else
          {
            unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v14) >> 3);
            if (v29 == 0xAAAAAAAAAAAAAAABLL * ((v12 - a2) >> 3))
            {
              uint64_t v30 = 0LL;
              do
              {
                uint64_t v31 = &a2[v30];
                BOOL v32 = &v14[v30];
                uint64_t v94 = *(void *)&v14[v30 + 16];
                __int128 v89 = *(_OWORD *)&v14[v30];
                __int128 v33 = *(_OWORD *)&a2[v30];
                *((void *)v32 + 2) = *(void *)&a2[v30 + 16];
                *(_OWORD *)BOOL v32 = v33;
                *((void *)v31 + 2) = v94;
                *(_OWORD *)uint64_t v31 = v89;
                if (&v14[v30 + 24] == a2) {
                  break;
                }
                v30 += 24LL;
              }

              while (v31 + 24 != v12);
              uint64_t v28 = a2;
            }

            else
            {
              uint64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((v12 - a2) >> 3);
              unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v14) >> 3);
              do
              {
                uint64_t v41 = v40;
                unint64_t v40 = v39;
                uint64_t v39 = v41 % v39;
              }

              while (v39);
              if (v40)
              {
                BOOL v42 = &v14[24 * v40];
                do
                {
                  __int128 v43 = *(_OWORD *)(v42 - 24);
                  uint64_t v44 = *((void *)v42 - 1);
                  v42 -= 24;
                  uint64_t v97 = v44;
                  __int128 v92 = v43;
                  unsigned int v45 = &v42[8 * ((a2 - v14) >> 3)];
                  uint64_t v46 = v42;
                  do
                  {
                    int v47 = v46;
                    uint64_t v46 = v45;
                    __int128 v48 = *(_OWORD *)v45;
                    *((void *)v47 + 2) = *((void *)v45 + 2);
                    *(_OWORD *)int v47 = v48;
                    unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * ((v12 - v45) >> 3);
                    BOOL v50 = __OFSUB__(v29, v49);
                    uint64_t v52 = v29 - v49;
                    char v51 = (v52 < 0) ^ v50;
                    unsigned int v45 = &v14[24 * v52];
                    if (v51) {
                      unsigned int v45 = &v46[8 * ((a2 - v14) >> 3)];
                    }
                  }

                  while (v45 != v42);
                  *((void *)v46 + 2) = v97;
                  *(_OWORD *)uint64_t v46 = v92;
                }

                while (v42 != v14);
              }

              uint64_t v28 = &v14[8 * ((v12 - a2) >> 3)];
            }
          }
        }
      }

      a4 -= v21;
      uint64_t v53 = a5 - v11;
      if (v21 + v11 >= a4 + v53)
      {
        uint64_t v60 = a4;
        unsigned int v57 = a6;
        uint64_t v58 = a7;
        uint64_t v61 = v11;
        unint64_t result = (char *)std::__inplace_merge<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( v28,  v12,  a3,  v60);
        BOOL v12 = v14;
        a5 = v61;
        a4 = v21;
        a3 = v28;
      }

      else
      {
        BOOL v54 = v9;
        uint64_t v55 = v21;
        uint64_t v56 = v53;
        unsigned int v57 = a6;
        uint64_t v58 = a7;
        unint64_t v59 = a3;
        unint64_t result = (char *)std::__inplace_merge<std::_ClassicAlgPolicy,method_t::SortBySELAddress &,method_t::big *>( v54,  v14,  v28,  v55);
        a5 = v56;
        a3 = v59;
        unint64_t v9 = v28;
      }

      a2 = v12;
      a6 = v57;
      a7 = v58;
      if (!a5) {
        return result;
      }
    }

    if (a4 <= a5)
    {
      if (v9 != a2)
      {
        uint64_t v73 = 0LL;
        do
        {
          BOOL v74 = &a6[v73];
          __int128 v75 = *(_OWORD *)&v9[v73];
          *((void *)v74 + 2) = *(void *)&v9[v73 + 16];
          *(_OWORD *)BOOL v74 = v75;
          v73 += 24LL;
        }

        while (&v9[v73] != a2);
        BOOL v76 = &a6[v73];
        if (v76 != a6)
        {
          while (a2 != a3)
          {
            if (*(void *)a2 >= *(void *)a6)
            {
              __int128 v78 = *(_OWORD *)a6;
              *((void *)v9 + 2) = *((void *)a6 + 2);
              *(_OWORD *)unint64_t v9 = v78;
              a6 += 24;
            }

            else
            {
              __int128 v77 = *(_OWORD *)a2;
              *((void *)v9 + 2) = *((void *)a2 + 2);
              *(_OWORD *)unint64_t v9 = v77;
              a2 += 24;
            }

            v9 += 24;
            if (a6 == v76) {
              return result;
            }
          }

          return (char *)memmove(v9, a6, v76 - a6);
        }
      }
    }

    else if (a2 != a3)
    {
      uint64_t v62 = 0LL;
      do
      {
        unint64_t v63 = &a6[v62];
        __int128 v64 = *(_OWORD *)&a2[v62];
        *((void *)v63 + 2) = *(void *)&a2[v62 + 16];
        *(_OWORD *)unint64_t v63 = v64;
        v62 += 24LL;
      }

      while (&a2[v62] != a3);
      unint64_t v65 = &a6[v62];
      if (v65 != a6)
      {
        uint64_t v66 = a3 - 24;
        while (a2 != v9)
        {
          unint64_t v67 = *((void *)v65 - 3);
          unint64_t v68 = *((void *)a2 - 3);
          BOOL v69 = v67 >= v68;
          if (v67 >= v68) {
            uint64_t v70 = v65 - 24;
          }
          else {
            uint64_t v70 = a2 - 24;
          }
          if (!v69) {
            a2 -= 24;
          }
          __int128 v71 = *(_OWORD *)v70;
          uint64_t v72 = *((void *)v70 + 2);
          if (v69) {
            v65 -= 24;
          }
          *((void *)v66 + 2) = v72;
          *(_OWORD *)uint64_t v66 = v71;
          v66 -= 24;
          if (v65 == a6) {
            return result;
          }
        }

        unint64_t v80 = 0LL;
        do
        {
          uint64_t v81 = &v66[v80];
          __int128 v82 = *(_OWORD *)&v65[v80 - 24];
          *((void *)v81 + 2) = *(void *)&v65[v80 - 8];
          *(_OWORD *)uint64_t v81 = v82;
          v80 -= 24LL;
        }

        while (&v65[v80] != a6);
      }
    }
  }

  return result;
}

uint64_t method_t::setImp(uint64_t this, void (*a2)(void))
{
  unint64_t v3 = this;
  int v4 = this & 3;
  if ((this & 3) != 0 && v4 != 2)
  {
    if (v4 != 1) {
      return this;
    }
    if (!byte_18C43ED48)
    {
      objc::smallMethodIMPMap = 0LL;
      qword_18C43ED38 = 0LL;
      dword_18C43ED40 = 0;
      byte_18C43ED48 = 1;
    }

    this = objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::LookupBucketFor<method_t const*>( this,  &v7);
    __n128 v5 = v7;
    if ((this & 1) != 0) {
      goto LABEL_15;
    }
    this = dword_18C43ED40;
    if (4 * (int)qword_18C43ED38 + 4 >= (3 * dword_18C43ED40))
    {
      LODWORD(this) = 2 * dword_18C43ED40;
    }

    else if (dword_18C43ED40 + ~(_DWORD)qword_18C43ED38 - HIDWORD(qword_18C43ED38) > dword_18C43ED40 >> 3)
    {
LABEL_9:
      if (*v5 == -2LL)
      {
        qword_18C43ED38 = (uint64_t)vadd_s32((int32x2_t)qword_18C43ED38, (int32x2_t)0xFFFFFFFF00000001LL);
      }

      else if (*v5 == -1LL)
      {
        LODWORD(qword_18C43ED38) = qword_18C43ED38 + 1;
      }

      *__n128 v5 = v3;
      v5[1] = 0LL;
LABEL_15:
      uint64_t v6 = v5 + 1;
      goto LABEL_16;
    }

    objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::grow(this);
    this = objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::LookupBucketFor<method_t const*>( v3,  &v7);
    __n128 v5 = v7;
    goto LABEL_9;
  }

  uint64_t v6 = (void *)((this & 0xFFFFFFFFFFFFFFFCLL) + 16);
LABEL_16:
  *uint64_t v6 = a2;
  return this;
}

BOOL ___ZL25_method_setImplementationP10objc_classP8method_tPFvvE_block_invoke(uint64_t a1, uint64_t a2)
{
  return cache_t::shouldFlush(a2 + 16, *(objc_selector **)(a1 + 32), *(void (**)(void))(a1 + 40));
}

uint64_t objc::Scanner::scanChangedMethod(uint64_t this, unint64_t a2, const method_t *a3, char *a4)
{
  int v5 = a2 & 3;
  if ((a2 & 3) == 0 || v5 == 2)
  {
    __int128 v7 = *(char **)(a2 & 0xFFFFFFFFFFFFFFFCLL);
  }

  else
  {
    if (v5 != 1) {
      goto LABEL_36;
    }
    uint64_t v6 = (int *)(a2 & 0xFFFFFFFFFFFFFFFCLL);
    else {
      __int128 v7 = (char *)&unk_18E7BB5A8 + *v6;
    }
  }

  if (sel_alloc != v7 && sel_allocWithZone_ != v7)
  {
    int v9 = 4;
    int v10 = 1;
    if (sel_retain != v7
      && sel_release != v7
      && sel_autorelease != v7
      && sel__tryRetain != v7
      && sel__isDeallocating != v7
      && sel_retainCount != v7
      && sel_allowsWeakReference != v7
      && sel_retainWeakReference != v7)
    {
      int v9 = 16;
      int v10 = 1;
      if (&sel_new != (_UNKNOWN *)v7 && sel_self != v7 && sel_class != v7 && sel_isKindOfClass_ != v7)
      {
        if (sel_respondsToSelector_ != v7) {
          return this;
        }
        int v10 = 1;
      }
    }

    if (this) {
      goto LABEL_27;
    }
    goto LABEL_37;
  }

LABEL_36:
  int v10 = 0;
  int v9 = 1;
  if (this)
  {
LABEL_27:
    if ((*(_WORD *)(this + 30) & 4) != 0)
    {
      if ((__objc2_class *)this == &OBJC_METACLASS___NSObject
        && (objc::NSObjectSwizzledMask & (2 * v9)) == 0)
      {
        return (uint64_t)objc::Scanner::setNSObjectSwizzled(&OBJC_METACLASS___NSObject, v9, 1);
      }
    }

    else
    {
      char v11 = v10 ^ 1;
      if ((__objc2_class *)this != &OBJC_CLASS___NSObject) {
        char v11 = 1;
      }
    }

    return this;
  }

    _objc_fatal("Assertion failed: (%s) - empty list %p encountered during iteration", v19, v20, v21, "m != mEnd", v23);
  }

  return a1;
}

LABEL_37:
  int v12 = objc::NSObjectSwizzledMask;
  if (v10 == 1)
  {
    uint64_t v13 = *(void *)(((uint64_t)OBJC_CLASS___NSObject.info & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
    if ((v13 & 1) != 0)
    {
      unint64_t v16 = *(void *)(v14 + 8);
    }

    else
    {
      uint64_t v15 = *(void *)(v14 + 32);
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
      if ((v15 & 1) != 0) {
        unint64_t v17 = v15 & 0xFFFFFFFFFFFFFFFELL;
      }
      else {
        unint64_t v17 = 0LL;
      }
      if ((v15 & 1) != 0 || !v16)
      {
        unint64_t v16 = v17 | 2;
        if (!v17) {
          unint64_t v16 = 0LL;
        }
      }
    }

    unint64_t v34 = v16;
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::begin((uint64_t)v32, &v34, (const char *)a3, a4);
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::end((uint64_t)v31, &v34, v18, v19);
    while (1)
    {
      this = list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v32,  v31);
      if ((this & 1) != 0) {
        break;
      }
      if (v33 == (objc_class *)a2)
      {
        this = (uint64_t)objc::Scanner::setNSObjectSwizzled(&OBJC_CLASS___NSObject, v9, 0);
        break;
      }

      list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator++( v32,  v20,  (const char *)a3,  a4);
    }

    int v12 = objc::NSObjectSwizzledMask;
  }

  if ((v12 & (2 * v9)) == 0)
  {
    uint64_t v21 = *(void *)(((uint64_t)OBJC_METACLASS___NSObject.info & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
    if ((v21 & 1) != 0)
    {
      unint64_t v24 = *(void *)(v22 + 8);
    }

    else
    {
      uint64_t v23 = *(void *)(v22 + 32);
      unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
      if ((v23 & 1) != 0) {
        unint64_t v25 = v23 & 0xFFFFFFFFFFFFFFFELL;
      }
      else {
        unint64_t v25 = 0LL;
      }
      if ((v23 & 1) != 0 || !v24)
      {
        unint64_t v24 = v25 | 2;
        if (!v25) {
          unint64_t v24 = 0LL;
        }
      }
    }

    unint64_t v34 = v24;
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::begin((uint64_t)v32, &v34, (const char *)a3, a4);
    list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::end((uint64_t)v31, &v34, v26, v27);
    while (1)
    {
      this = list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v32,  v31);
      if ((this & 1) != 0) {
        break;
      }
      if (v33 == (objc_class *)a2) {
        return (uint64_t)objc::Scanner::setNSObjectSwizzled(&OBJC_METACLASS___NSObject, v9, 1);
      }
      list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator++( v32,  v28,  v29,  v30);
    }
  }

  return this;
}

          ++v16;
        }

        while (v16 < v23);
      }

      LastHeaderRealizedAllClasses = (uint64_t)v0;
      uint64_t v21 = getPreoptimizedHeaderRW((uint64_t)v0);
      unint64_t v22 = (void *)((char *)v0 + 24);
      if (v21) {
        unint64_t v22 = (void *)v21;
      }
      mach_port_t v0 = (header_info *)(*v22 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v0);
  }

void *objc::Scanner::setNSObjectSwizzled(void *result, int a2, char a3)
{
  objc::NSObjectSwizzledMask |= (a2 << a3);
  int v3 = *(_DWORD *)(result[4] & 0xF00007FFFFFFFF8LL);
  if ((v3 & 1) == 0) {
    int v3 = *(_DWORD *)(*(void *)((*result & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v3 & 0x20000000) != 0)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3321888768LL;
    _OWORD v4[2] = ___ZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tE_block_invoke;
    v4[3] = &__block_descriptor_48_e8_32c83_ZTSKZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tEEUlS2_E__e8_B16__0_8l;
    v4[4] = result;
    int v5 = 0;
    char v6 = a2 & 1;
    BOOL v7 = (a2 & 4) != 0;
    BOOL v8 = (a2 & 0x10) != 0;
    return (void *)foreach_realized_class_and_subclass((uint64_t)result, (uint64_t)v4);
  }

  return result;
}

uint64_t objc::Scanner::propagateCustomFlags(uint64_t a1, char a2, int a3)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3321888768LL;
  _OWORD v4[2] = ___ZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tE_block_invoke;
  v4[3] = &__block_descriptor_48_e8_32c83_ZTSKZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tEEUlS2_E__e8_B16__0_8l;
  v4[4] = a1;
  int v5 = a3;
  char v6 = a2 & 1;
  BOOL v7 = (a2 & 4) != 0;
  BOOL v8 = (a2 & 0x10) != 0;
  return foreach_realized_class_and_subclass(a1, (uint64_t)v4);
}

uint64_t ___ZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tE_block_invoke( uint64_t a1, objc_class *this)
{
  if (*(objc_class **)(a1 + 32) == this)
  {
    int v6 = *(_DWORD *)(a1 + 40);
  }

  else
  {
    int v4 = *(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL);
    if ((v4 & 1) == 0) {
      int v4 = *(_DWORD *)(*(void *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v4 & 0x20000000) == 0) {
      return 0LL;
    }
    int v6 = 1;
  }

  if (*(_BYTE *)(a1 + 44) && (BOOL v7 = (unsigned __int16 *)&this[3].isa + 3, (HIWORD(this[3].isa) & 0x4000) != 0))
  {
    do
      unsigned __int16 v8 = __ldxr(v7);
    while (__stxr(v8 & 0xBFFF, v7));
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t result = 0LL;
  }

  if (*(_BYTE *)(a1 + 45))
  {
    int v9 = (unint64_t *)&this[4];
    if (((uint64_t)this[4].isa & 4) != 0)
    {
      unint64_t v10 = __ldxr(v9);
      unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFBLL;
      if (!v10) {
        unint64_t v11 = 0x8000000000000000LL;
      }
      while (__stlxr(v11, v9))
      {
        unint64_t v12 = __ldxr(v9);
        if (v12) {
          unint64_t v11 = v12 & 0xFFFFFFFFFFFFFFFBLL;
        }
        else {
          unint64_t v11 = 0x8000000000000000LL;
        }
      }

      uint64_t result = 1LL;
    }
  }

  if (*(_BYTE *)(a1 + 46))
  {
    uint64_t v13 = (unsigned __int16 *)&this[3].isa + 3;
    if (SHIWORD(this[3].isa) < 0)
    {
      do
        unsigned __int16 v14 = __ldxr(v13);
      while (__stxr(v14 & 0x7FFF, v13));
      return 1LL;
    }
  }

  return result;
}

uint64_t __copy_helper_block_e8_32c83_ZTSKZN4objc7Scanner20propagateCustomFlagsEP10objc_classjNS0_11inherited_tEEUlS2_E_( uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  *(void *)(result + 39) = *(void *)(a2 + 39);
  *(void *)(result + 32) = v2;
  return result;
}

void objc::Scanner::printCustom(const char *a1, objc_class *this, int a3)
{
  int v6 = (const char *)objc_class::nameForLogging(this);
  if ((HIWORD(this[3].isa) & 4) != 0) {
    BOOL v7 = " (meta)";
  }
  else {
    BOOL v7 = "";
  }
  unsigned __int16 v8 = " (inherited)";
  if (a3 != 1) {
    unsigned __int16 v8 = "";
  }
  _objc_inform("%s: %s%s%s", a1, v6, v7, v8);
}

__n128 __copy_helper_block_e8_32c67_ZTSKZL25_method_setImplementationP10objc_classP8method_tPFvvEE3__0( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

unint64_t getMethodFromRelativeList(unsigned int *a1, _BYTE *a2, const char *a3, char *a4)
{
  if (dataSegmentsRanges <= (unint64_t)a2 && *(void *)algn_18C43FCB8 > (unint64_t)a2)
  {
    if (DisablePreattachedCategories)
    {
      uint64_t v7 = *a1;
      uint64_t v78 = a1[1];
      unint64_t v79 = v78 * (unint64_t)v7;
      if ((v79 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v78, a1, v7);
      }
      uint64_t v80 = (uint64_t)a1 + v79 + 8;
      if ((_DWORD)v78) {
        uint64_t v6 = v78;
      }
      else {
        uint64_t v6 = 0LL;
      }
      if ((_DWORD)v78) {
        int v5 = (uint64_t *)(v80 - v7);
      }
      else {
        int v5 = (uint64_t *)v80;
      }
    }

    else
    {
      int v5 = (uint64_t *)(a1 + 2);
      uint64_t v7 = *a1;
      uint64_t v6 = a1[1];
    }

    unint64_t v8 = v6 * (unint64_t)v7;
    if ((v8 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v6, a1, v7);
    }
    unint64_t v9 = (unint64_t)a1 + v8 + 8;
    if ((unint64_t)v5 < v9)
    {
      while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v5 + 8) & 1) == 0)
      {
        int v5 = (uint64_t *)((char *)v5 + v7);
        unsigned int v10 = v7;
      }
    }

    unsigned int v10 = v7;
LABEL_14:
    if (v5 != (uint64_t *)v9)
    {
      unint64_t v11 = a2 - (_BYTE *)&unk_18E7BB5A8;
      do
      {
        unint64_t v12 = (unsigned int *)((char *)v5 + (*v5 >> 16));
        unint64_t v13 = *v12;
        unsigned __int16 v14 = (char *)((unsigned __int16)v13 & 0xFFFC);
        if ((v13 & 0x80000000) == 0LL) {
          int v15 = 24;
        }
        else {
          int v15 = 12;
        }
        unint64_t v16 = v13 >> 31;
        if ((~(_DWORD)v13 & 3) == 0 && (_DWORD)v14 == v15)
        {
          unint64_t v18 = (unint64_t)(v12 + 2) & 0xFFFFFFFFFFFFFFFCLL;
          if ((v13 & 0x80000000) != 0)
          {
            unint64_t v29 = v18 | v16;
            uint64_t v30 = v12[1];
            if (dataSegmentsRanges <= (unint64_t)v12 && *(void *)algn_18C43FCB8 > (unint64_t)v12)
            {
              if (v30 >= 5)
              {
                unint64_t v43 = v29;
                while (1)
                {
                  unint64_t result = v43 + ((unsigned __int16)v13 & 0xFFFC) * (unint64_t)(v30 >> 1);
                  unint64_t v44 = *(int *)(result & 0xFFFFFFFFFFFFFFFCLL);
                  BOOL v45 = v11 > v44;
                  if (v11 == v44) {
                    break;
                  }
                  BOOL v46 = v11 > v44;
                  int v47 = &v14[result];
                  if (v45) {
                    unint64_t v43 = (unint64_t)v47;
                  }
                  unsigned int v48 = v30 - v46;
                  uint64_t v30 = (v30 - v46) >> 1;
                  if (v48 <= 9)
                  {
                    if (!(_DWORD)v30) {
                      goto LABEL_98;
                    }
                    goto LABEL_77;
                  }
                }

                if (result > v29)
                {
                  uint64_t v61 = 0LL;
                  unint64_t v62 = v43 + ((unsigned __int16)v13 >> 2) * (((2 * v30) & 0x1FFFFFFFCLL) - 4);
                  while (v11 == *(_DWORD *)((v62 + v61) & 0xFFFFFFFFFFFFFFFCLL))
                  {
                    v61 -= (uint64_t)v14;
                    unint64_t v60 = result + v61;
                    if (result + v61 <= v29)
                    {
LABEL_95:
                      unint64_t result = v60;
                      goto LABEL_97;
                    }
                  }

                  result += v61;
                }

LABEL_97:
                if (result) {
                  return result;
                }
                goto LABEL_98;
              }

              unint64_t v43 = v29;
              if ((_DWORD)v30)
              {
LABEL_77:
                uint64_t v55 = 0LL;
                int v56 = v30 - 1;
                do
                {
                  unint64_t result = v43 + v55;
                  unint64_t v57 = *(int *)((v43 + v55) & 0xFFFFFFFFFFFFFFFCLL);
                  if (v11 == v57) {
                    goto LABEL_97;
                  }
                  BOOL v58 = v11 < v57 || v56-- == 0;
                  v55 += v14;
                }

                while (!v58);
              }
            }

            else
            {
              if (v30 >= 5)
              {
                uint64_t v32 = (unsigned __int16)v13 & 0xFFFC;
                unint64_t v33 = v29;
                while (1)
                {
                  unint64_t result = v33 + ((unsigned __int16)v13 & 0xFFFC) * (unint64_t)(v30 >> 1);
                  unint64_t v34 = *(_BYTE **)((result & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(result & 0xFFFFFFFFFFFFFFFCLL));
                  BOOL v35 = v34 >= a2;
                  if (v34 == a2) {
                    break;
                  }
                  BOOL v36 = v34 < a2;
                  unint64_t v37 = result + ((unsigned __int16)v13 & 0xFFFC);
                  if (!v35) {
                    unint64_t v33 = v37;
                  }
                  unsigned int v38 = v30 - v36;
                  uint64_t v30 = (v30 - v36) >> 1;
                  if (v38 <= 9)
                  {
                    if (!(_DWORD)v30) {
                      goto LABEL_98;
                    }
                    goto LABEL_68;
                  }
                }

                if (result <= v29) {
                  goto LABEL_97;
                }
                uint64_t v49 = 0LL;
                unint64_t v59 = v33 + ((unsigned __int16)v13 >> 2) * (((2 * v30) & 0x1FFFFFFFCLL) - 4);
                while (*(_BYTE **)(((v59 + v49) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v59 + v49) & 0xFFFFFFFFFFFFFFFCLL)) == a2)
                {
                  v49 -= v32;
                  unint64_t v60 = result + v49;
                  if (result + v49 <= v29) {
                    goto LABEL_95;
                  }
                }

                goto LABEL_90;
              }

              unint64_t v33 = v29;
              if ((_DWORD)v30)
              {
LABEL_68:
                uint64_t v51 = 0LL;
                int v52 = v30 - 1;
                do
                {
                  unint64_t result = v33 + v51;
                  uint64_t v53 = *(_BYTE **)(((v33 + v51) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v33 + v51) & 0xFFFFFFFFFFFFFFFCLL));
                  if (v53 == a2) {
                    goto LABEL_97;
                  }
                  BOOL v54 = v53 > a2 || v52-- == 0;
                  v51 += v14;
                }

                while (!v54);
              }
            }
          }

          else
          {
            unint64_t v19 = v18 | v16;
            uint64_t v20 = v12[1];
            if (v20 >= 5)
            {
              uint64_t v21 = (unsigned __int16)v13 & 0xFFFC;
              unint64_t v22 = v19;
              while (1)
              {
                unint64_t result = v22 + ((unsigned __int16)v13 & 0xFFFC) * (unint64_t)(v20 >> 1);
                unint64_t v24 = *(_BYTE **)(result & 0xFFFFFFFFFFFFFFFCLL);
                BOOL v25 = v24 >= a2;
                if (v24 == a2) {
                  break;
                }
                BOOL v26 = v24 < a2;
                unint64_t v27 = result + ((unsigned __int16)v13 & 0xFFFC);
                if (!v25) {
                  unint64_t v22 = v27;
                }
                unsigned int v28 = v20 - v26;
                uint64_t v20 = (v20 - v26) >> 1;
                if (v28 <= 9)
                {
                  if (!(_DWORD)v20) {
                    goto LABEL_98;
                  }
                  goto LABEL_46;
                }
              }

              if (result <= v19) {
                goto LABEL_97;
              }
              uint64_t v49 = 0LL;
              unint64_t v50 = v22 + ((unsigned __int16)v13 >> 2) * (((2 * v20) & 0x1FFFFFFFCLL) - 4);
              while (*(_BYTE **)((v50 + v49) & 0xFFFFFFFFFFFFFFFCLL) == a2)
              {
                v49 -= v21;
                if (result + v49 <= v19)
                {
                  result += v49;
                  goto LABEL_97;
                }
              }

LABEL_90:
              result += v49;
              goto LABEL_97;
            }

            unint64_t v22 = v19;
            if ((_DWORD)v20)
            {
LABEL_46:
              uint64_t v39 = 0LL;
              int v40 = v20 - 1;
              do
              {
                unint64_t result = v22 + v39;
                uint64_t v41 = *(_BYTE **)((v22 + v39) & 0xFFFFFFFFFFFFFFFCLL);
                if (v41 == a2) {
                  goto LABEL_97;
                }
                BOOL v42 = v41 > a2 || v40-- == 0;
                v39 += v14;
              }

              while (!v42);
            }
          }
        }

        else
        {
          if ((v13 & 0x80000000) != 0)
          {
            unsigned int v70 = *v12 & 0xFFFC;
            uint64_t v71 = v12[1];
            unint64_t v72 = v71 * (unint64_t)v14;
            if (dataSegmentsRanges <= (unint64_t)v12 && *(void *)algn_18C43FCB8 > (unint64_t)v12)
            {
              if ((v72 & 0xFFFFFFFF00000000LL) != 0) {
LABEL_134:
              }
                _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  (const char *)0xC,  v14,  v71,  (char *)v5 + (*v5 >> 16),  v14);
              BOOL v76 = v12 + 2;
              unint64_t result = (unint64_t)(v12 + 2) & 0xFFFFFFFFFFFFFFFCLL | v16;
              unint64_t v77 = ((unint64_t)v76 + v72) & 0xFFFFFFFFFFFFFFFCLL | v16;
              while (result != v77)
              {
                result += v70;
              }
            }

            else
            {
              if ((v72 & 0xFFFFFFFF00000000LL) != 0) {
                goto LABEL_134;
              }
              BOOL v74 = v12 + 2;
              unint64_t result = (unint64_t)(v12 + 2) & 0xFFFFFFFFFFFFFFFCLL | v16;
              unint64_t v75 = ((unint64_t)v74 + v72) & 0xFFFFFFFFFFFFFFFCLL | v16;
              while (result != v75)
              {
                result += v70;
              }
            }

            goto LABEL_98;
          }

          uint64_t v66 = v12[1];
          unint64_t v67 = v66 * (unint64_t)v14;
          if ((v67 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  (const char *)0xC,  v14,  v66,  (char *)v5 + (*v5 >> 16),  v14);
          }
          unint64_t v68 = v12 + 2;
          unint64_t result = (unint64_t)(v12 + 2) & 0xFFFFFFFFFFFFFFFCLL | v16;
          unint64_t v69 = ((unint64_t)v68 + v67) & 0xFFFFFFFFFFFFFFFCLL | v16;
          if (result != v69)
          {
            while (*(_BYTE **)(result & 0xFFFFFFFFFFFFFFFCLL) != a2)
            {
              result += v14;
              if (result == v69) {
                goto LABEL_98;
              }
            }

            goto LABEL_97;
          }
        }

LABEL_98:
        uint64_t v63 = v10;
        __int128 v64 = (uint64_t *)((char *)v5 + v10);
        do
        {
          int v5 = v64;
          uint64_t v65 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v64 + 8);
          __int128 v64 = (uint64_t *)((char *)v64 + v63);
        }

        while ((v65 & 1) == 0);
        unsigned int v10 = v63;
      }

      while (v5 != (uint64_t *)v9);
    }
  }

  return 0LL;
}

unint64_t getMethodFromListArray<method_list_t **>( unsigned int *a1, _BYTE *a2, const char *a3, char *a4)
{
  unint64_t v5 = *a1;
  uint64_t v6 = (unsigned __int16)v5 & 0xFFFC;
  if ((v5 & 0x80000000) == 0LL) {
    int v7 = 24;
  }
  else {
    int v7 = 12;
  }
  unint64_t v8 = v5 >> 31;
  if ((~(_DWORD)v5 & 3) == 0 && (_DWORD)v6 == v7)
  {
    if ((v5 & 0x80000000) != 0)
    {
      if (dataSegmentsRanges <= (unint64_t)a1 && *(void *)algn_18C43FCB8 > (unint64_t)a1)
      {
        unint64_t result = 0LL;
        unint64_t v19 = a2 - (_BYTE *)&unk_18E7BB5A8;
        unint64_t v20 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
        uint64_t v21 = a1[1];
        if (v21 < 5)
        {
          unint64_t v22 = v20;
LABEL_67:
          if (!(_DWORD)v21) {
            return 0LL;
          }
          uint64_t v47 = 0LL;
          int v48 = v21 - 1;
          do
          {
            unint64_t result = v22 + v47;
            unint64_t v49 = *(int *)((v22 + v47) & 0xFFFFFFFFFFFFFFFCLL);
            if (v19 == v49) {
              break;
            }
            unint64_t result = 0LL;
            BOOL v50 = v19 < v49 || v48-- == 0;
            v47 += v6;
          }

          while (!v50);
        }

        else
        {
          unint64_t v22 = v20;
          while (1)
          {
            unint64_t result = v22 + ((unsigned __int16)v5 & 0xFFFC) * (unint64_t)(v21 >> 1);
            unint64_t v23 = *(int *)(result & 0xFFFFFFFFFFFFFFFCLL);
            BOOL v24 = v19 > v23;
            if (v19 == v23) {
              break;
            }
            BOOL v25 = v19 > v23;
            if (v24) {
              unint64_t v22 = result + v6;
            }
            unsigned int v26 = v21 - v25;
            uint64_t v21 = v26 >> 1;
            if (v26 <= 9) {
              goto LABEL_67;
            }
          }

          if (result > v20)
          {
            uint64_t v51 = 0LL;
            unint64_t v52 = v22 + ((unsigned __int16)v5 >> 2) * (((2 * v21) & 0x1FFFFFFFCLL) - 4);
            while (v19 == *(_DWORD *)((v52 + v51) & 0xFFFFFFFFFFFFFFFCLL))
            {
              v51 -= v6;
              uint64_t v41 = result + v51;
              if (result + v51 <= v20) {
                return v41;
              }
            }

            result += v51;
          }
        }

        return result;
      }

      unint64_t v31 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
      uint64_t v32 = a1[1];
      if (v32 < 5)
      {
        unint64_t v34 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
        if (!(_DWORD)v32) {
          return 0LL;
        }
LABEL_52:
        uint64_t v42 = 0LL;
        int v43 = v32 - 1;
        while (1)
        {
          unint64_t result = v34 + v42;
          unint64_t v44 = *(_BYTE **)(((v34 + v42) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v34 + v42) & 0xFFFFFFFFFFFFFFFCLL));
          if (v44 == a2) {
            break;
          }
          BOOL v45 = v44 > a2 || v43-- == 0;
          v42 += v6;
          if (v45) {
            return 0LL;
          }
        }

        return result;
      }

      uint64_t v33 = (unsigned __int16)v5 & 0xFFFC;
      unint64_t v34 = v31;
      while (1)
      {
        unint64_t result = v34 + ((unsigned __int16)v5 & 0xFFFC) * (unint64_t)(v32 >> 1);
        BOOL v35 = *(_BYTE **)((result & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(result & 0xFFFFFFFFFFFFFFFCLL));
        BOOL v36 = v35 >= a2;
        if (v35 == a2) {
          break;
        }
        BOOL v37 = v35 < a2;
        if (!v36) {
          unint64_t v34 = result + ((unsigned __int16)v5 & 0xFFFC);
        }
        unsigned int v38 = v32 - v37;
        uint64_t v32 = v38 >> 1;
        if (v38 <= 9)
        {
          if ((_DWORD)v32) {
            goto LABEL_52;
          }
          return 0LL;
        }
      }

      if (result <= v31) {
        return result;
      }
      uint64_t v39 = 0LL;
      unint64_t v46 = v34 + ((unsigned __int16)v5 >> 2) * (((2 * v32) & 0x1FFFFFFFCLL) - 4);
      while (*(_BYTE **)(((v46 + v39) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v46 + v39) & 0xFFFFFFFFFFFFFFFCLL)) == a2)
      {
        v39 -= v33;
        uint64_t v41 = result + v39;
        if (result + v39 <= v31) {
          return v41;
        }
      }
    }

    else
    {
      unint64_t v10 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
      uint64_t v11 = a1[1];
      if (v11 < 5)
      {
        unint64_t v13 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
        if (!(_DWORD)v11) {
          return 0LL;
        }
LABEL_30:
        uint64_t v27 = 0LL;
        int v28 = v11 - 1;
        while (1)
        {
          unint64_t result = v13 + v27;
          unint64_t v29 = *(_BYTE **)((v13 + v27) & 0xFFFFFFFFFFFFFFFCLL);
          if (v29 == a2) {
            break;
          }
          BOOL v30 = v29 > a2 || v28-- == 0;
          v27 += v6;
          if (v30) {
            return 0LL;
          }
        }

        return result;
      }

      uint64_t v12 = (unsigned __int16)v5 & 0xFFFC;
      unint64_t v13 = v10;
      while (1)
      {
        unint64_t result = v13 + ((unsigned __int16)v5 & 0xFFFC) * (unint64_t)(v11 >> 1);
        int v15 = *(_BYTE **)(result & 0xFFFFFFFFFFFFFFFCLL);
        BOOL v16 = v15 >= a2;
        if (v15 == a2) {
          break;
        }
        BOOL v17 = v15 < a2;
        if (!v16) {
          unint64_t v13 = result + ((unsigned __int16)v5 & 0xFFFC);
        }
        unsigned int v18 = v11 - v17;
        uint64_t v11 = v18 >> 1;
        if (v18 <= 9)
        {
          if ((_DWORD)v11) {
            goto LABEL_30;
          }
          return 0LL;
        }
      }

      if (result <= v10) {
        return result;
      }
      uint64_t v39 = 0LL;
      unint64_t v40 = v13 + ((unsigned __int16)v5 >> 2) * (((2 * v11) & 0x1FFFFFFFCLL) - 4);
      while (*(_BYTE **)((v40 + v39) & 0xFFFFFFFFFFFFFFFCLL) == a2)
      {
        v39 -= v12;
        uint64_t v41 = result + v39;
        if (result + v39 <= v10) {
          return v41;
        }
      }
    }

    result += v39;
    return result;
  }

  if ((v5 & 0x80000000) == 0)
  {
    uint64_t v53 = a1[1];
    unint64_t v54 = v53 * (unint64_t)v6;
    if ((v54 & 0xFFFFFFFF00000000LL) == 0)
    {
      unint64_t v55 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
      unint64_t v56 = ((unint64_t)a1 + v54 + 8) & 0xFFFFFFFFFFFFFFFCLL | v8;
      if (v55 != v56)
      {
        uint64_t v57 = 0LL;
        do
        {
          unint64_t result = v55 + v57;
          if (*(_BYTE **)((v55 + v57) & 0xFFFFFFFFFFFFFFFCLL) == a2) {
            break;
          }
          unint64_t result = 0LL;
          v57 += v6;
        }

        while (v55 + v57 != v56);
        return result;
      }

      return 0LL;
    }

LABEL_107:
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v53, a1, v6);
  }

  if (dataSegmentsRanges > (unint64_t)a1 || *(void *)algn_18C43FCB8 <= (unint64_t)a1)
  {
    uint64_t v53 = a1[1];
    unint64_t v63 = v53 * (unint64_t)v6;
    if ((v63 & 0xFFFFFFFF00000000LL) != 0) {
      goto LABEL_107;
    }
    unint64_t v64 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
    unint64_t v65 = ((unint64_t)a1 + v63 + 8) & 0xFFFFFFFFFFFFFFFCLL | v8;
    if (v64 == v65) {
      return 0LL;
    }
    uint64_t v66 = 0LL;
    do
    {
      unint64_t result = v64 + v66;
      unint64_t result = 0LL;
      v66 += v6;
    }

    while (v64 + v66 != v65);
  }

  else
  {
    unint64_t result = 0LL;
    uint64_t v53 = a1[1];
    unint64_t v58 = v53 * (unint64_t)v6;
    if ((v58 & 0xFFFFFFFF00000000LL) != 0) {
      goto LABEL_107;
    }
    unint64_t v59 = a1 + 2;
    unint64_t v60 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v8;
    unint64_t v61 = ((unint64_t)v59 + v58) & 0xFFFFFFFFFFFFFFFCLL | v8;
    if (v60 == v61) {
      return 0LL;
    }
    uint64_t v62 = 0LL;
    do
    {
      unint64_t result = v60 + v62;
      unint64_t result = 0LL;
      v62 += v6;
    }

    while (v60 + v62 != v61);
  }

  return result;
}

objc_class *objc_class::setDisallowPreoptCachesRecursively(objc_class *this, const char *a2)
{
  if ((*(_BYTE *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) & 2) == 0)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3321888768LL;
    v2[2] = ___ZN10objc_class34setDisallowPreoptCachesRecursivelyEPKc_block_invoke;
    v2[3] = &__block_descriptor_48_e8_32c64_ZTSKZN10objc_class34setDisallowPreoptCachesRecursivelyEPKcE3__0_e8_B16__0_8l;
    void v2[4] = a2;
    v2[5] = this;
    return (objc_class *)foreach_realized_class_and_subclass((uint64_t)this, (uint64_t)v2);
  }

  return this;
}

void fixupMethodList(method_list_t *this, uint64_t a2, const char *a3, char *a4)
{
  if (*((_DWORD *)this + 1))
  {
    int v4 = (int)a3;
    if ((*(_DWORD *)this & 0x80000001) == 0)
    {
      int v6 = a2;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v7 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)&selLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_8:
      int v26 = v4;
      unint64_t v9 = *(unsigned int *)this;
      entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd((int *)this, a2, a3, a4);
      uint64_t v10 = a2;
      unint64_t v11 = ((unint64_t)this + 8) & 0xFFFFFFFFFFFFFFFCLL | (v9 >> 31);
      if (v11 != a2)
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = (unsigned __int16)v9 & 0xFFFC;
        unint64_t v14 = *(void *)algn_18C43FCB8;
        unint64_t v28 = dataSegmentsRanges;
        while (1)
        {
          uint64_t v15 = v11 + v12;
          int v16 = (v11 + v12) & 3;
          if (v16 && v16 != 2)
          {
            unint64_t v18 = v15 & 0xFFFFFFFFFFFFFFFCLL;
            uint64_t v19 = *(int *)(v15 & 0xFFFFFFFFFFFFFFFCLL);
            BOOL v20 = v28 <= (v15 & 0xFFFFFFFFFFFFFFFCLL) && v14 > v18;
            BOOL v17 = v20 ? (char *)&unk_18E7BB5A8 + v19 : *(char **)(v18 + v19);
          }

          else
          {
            BOOL v17 = *(char **)(v15 & 0xFFFFFFFFFFFFFFFCLL);
          }

          uint64_t v21 = __sel_registerName(v17, 0, v6);
          if (!v16 || v16 == 2) {
            break;
          }
          if (v16 == 1)
          {
            unint64_t v22 = (void *)((v15 & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(v15 & 0xFFFFFFFFFFFFFFFCLL));
LABEL_24:
            *unint64_t v22 = v21;
          }

          v12 += v13;
          if (v11 + v12 == v10) {
            goto LABEL_26;
          }
        }

        unint64_t v22 = (void *)(v15 & 0xFFFFFFFFFFFFFFFCLL);
        goto LABEL_24;
      }

LABEL_26:
      int v23 = *(_DWORD *)(StatusReg + 24);
      int v4 = v26;
      while (1)
      {
        unsigned int v24 = __ldxr((unsigned int *)&selLock);
        if (v24 != v23) {
          break;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
    }

    *location = (id)v4;
    BOOL v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unint64_t v18 = __ldxr((unsigned int *)v7);
      if (v18 != v17) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
LABEL_32:
    callSetWeaklyReferenced(v4);
  }

  else
  {
    *location = 0LL;
  }

  return (id)v4;
}

    *location = (id)v4;
    BOOL v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unint64_t v18 = __ldxr((unsigned int *)v7);
      if (v18 != v17) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
LABEL_32:
    callSetWeaklyReferenced(v4);
  }

  else
  {
    *location = 0LL;
  }

  return (id)v4;
}

LABEL_31:
    int v25 = *(_DWORD *)this;
    if (v4 && (v25 & 0x8000FFFC) == 0x18)
    {
      method_list_t::sortBySELAddress(this, a2, a3, a4);
      int v25 = *(_DWORD *)this;
    }

    if ((v25 & 0x80000000) == 0) {
      *(_DWORD *)this = v25 | 3;
    }
  }

void sub_1800291E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  int v12 = *(_DWORD *)(a10 + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(v10);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, v10)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL ___ZN10objc_class39setDisallowPreoptInlinedSelsRecursivelyEPKc_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned int *)(*(void *)(a2 + 32) & 0xF00007FFFFFFFF8LL);
  unsigned int v3 = *v2;
  if ((*v2 & 4) == 0)
  {
    if (PrintCaches)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if ((*(_WORD *)(v8 + 30) & 4) != 0) {
        unint64_t v9 = "meta";
      }
      else {
        unint64_t v9 = "";
      }
      uint64_t v10 = (const char *)objc_class::nameForLogging((objc_class *)v8);
      _objc_inform( "CACHES: %sclass %s: disallow sel-inlined preopt cache (from %s)",  v9,  v10,  *(const char **)(a1 + 40));
      uint64_t v2 = (unsigned int *)(*(void *)(a2 + 32) & 0xF00007FFFFFFFF8LL);
    }

    do
      unsigned int v6 = __ldxr(v2);
    while (__stxr(v6 | 4, v2));
    if ((*(void *)(a2 + 16) & 1) != 0 && (*(_DWORD *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFELL) - 6) & 0x4000) != 0) {
      cache_t::eraseNolock((cache_t *)(a2 + 16), *(const char **)(a1 + 40));
    }
  }

  return (v3 & 4) == 0;
}

__n128 __copy_helper_block_e8_32c69_ZTSKZN10objc_class39setDisallowPreoptInlinedSelsRecursivelyEPKcE3__0( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

BOOL ___ZN10objc_class34setDisallowPreoptCachesRecursivelyEPKc_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned int *)(*(void *)(a2 + 32) & 0xF00007FFFFFFFF8LL);
  unsigned int v3 = *v2;
  if ((*v2 & 2) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if ((*(void *)(a2 + 16) & 1) != 0)
    {
      cache_t::eraseNolock((cache_t *)(a2 + 16), *(const char **)(a1 + 32));
    }

    else
    {
      if (PrintCaches)
      {
        if ((*(_WORD *)(v6 + 30) & 4) != 0) {
          unint64_t v9 = "meta";
        }
        else {
          unint64_t v9 = "";
        }
        uint64_t v10 = (const char *)objc_class::nameForLogging((objc_class *)v6);
        _objc_inform("CACHES: %sclass %s: disallow preopt cache (from %s)", v9, v10, *(const char **)(a1 + 32));
        uint64_t v2 = (unsigned int *)(*(void *)(a2 + 32) & 0xF00007FFFFFFFF8LL);
      }

      do
        unsigned int v7 = __ldxr(v2);
      while (__stxr(v7 | 6, v2));
    }
  }

  return (v3 & 2) == 0;
}

__n128 __copy_helper_block_e8_32c64_ZTSKZN10objc_class34setDisallowPreoptCachesRecursivelyEPKcE3__0( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void *objc_class::installMangledNameForLazilyNamedClass( objc_class *this, uint64_t a2, const char *a3, char *a4)
{
  int v4 = this;
  unint64_t v5 = (uint64_t (*)(objc_class *))atomic_load((unint64_t *)&LazyClassNamerHook);
  if (!v5) {
    goto LABEL_24;
  }
  if ((HIWORD(this[3].isa) & 4) != 0)
  {
    while (1)
    {
      Class isa = v4[4].isa;
      uint64_t v19 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
      if (((unint64_t)isa & 0x8000000000000000LL) != 0)
      {
        uint64_t v20 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
        uint64_t v19 = (void *)(v20 & 0xFFFFFFFFFFFFFFFELL);
        if ((v20 & 1) != 0) {
          uint64_t v19 = (void *)*v19;
        }
      }

      int v4 = (objc_class *)v19[2];
      unint64_t v5 = (uint64_t (*)(objc_class *))atomic_load((unint64_t *)&LazyClassNamerHook);
      if (!v5) {
        break;
      }
      if ((HIWORD(v4[3].isa) & 4) == 0) {
        goto LABEL_3;
      }
    }

LABEL_3:
  v6.Class isa = v4->isa;
  uint64_t v7 = v5(v4);
  if (!v7) {
    _objc_fatal("Lazily named class %p wasn't named by lazy name handler", v8, v9, v10, v4);
  }
  unint64_t v11 = (void *)v7;
  int v12 = (objc_class *)((unint64_t)v6.isa & 0xFFFFFFFF8LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v14 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&runtimeLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  int v16 = (unint64_t *)(make_ro_writeable_nolock(v4) + 24);
  unint64_t v17 = atomic_load(v16);
  if (v17)
  {
    free(v11);
    unint64_t v11 = (void *)v17;
  }

  else
  {
    atomic_store((unint64_t)v11, v16);
    atomic_store((unint64_t)v11, (unint64_t *)(make_ro_writeable_nolock(v12) + 24));
    addNamedClass(v4, (char *)v11, 0LL);
  }

  int v21 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v22 = __ldxr((unsigned int *)&runtimeLock);
    if (v22 != v21) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
  return v11;
}

unint64_t make_ro_writeable_nolock(objc_class *a1)
{
  if ((unint64_t)&a1->isa[-1].isa + 7 < 0xF
    || (uint64_t v2 = (int *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL), (*v2 & 0x80000000) == 0))
  {
    realizeAndInitializeIfNeeded_locked(0LL, a1, 0);
    uint64_t v2 = (int *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL);
  }

  return make_ro_writeable_nolock(v2);
}

uint64_t addNamedClass(objc_class *a1, char *a2, objc_class *a3)
{
  ClassExceptSomeSwift = getClassExceptSomeSwift(a2);
  if (!ClassExceptSomeSwift || (uint64_t v7 = ClassExceptSomeSwift, ClassExceptSomeSwift == (char *)a3))
  {
    unsigned int v13 = _mapStrHash((uint64_t)ClassExceptSomeSwift, a2);
    uint64_t v14 = gdb_objc_realized_classes;
    uint64_t v15 = a2;
    return NXMapInsertWithHash(v14, (uint64_t)v15, v13, (uint64_t)a1);
  }

  uint64_t v8 = _headerForClass((unint64_t)ClassExceptSomeSwift);
  unint64_t v9 = _headerForClass((unint64_t)a1);
  uint64_t v10 = v9;
  if (v8)
  {
    unint64_t v11 = (const char *)dyld_image_path_containing_address();
    if (v10)
    {
LABEL_5:
      int v12 = (const char *)dyld_image_path_containing_address();
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t v11 = "??";
    if (v9) {
      goto LABEL_5;
    }
  }

  int v12 = "??";
LABEL_9:
  int v16 = _NSGetMachExecuteHeader();
  unint64_t v17 = getsectdatafromheader_64(v16, "__DATA_CONST", "__objc_dupclass", &size);
  unint64_t v18 = &v17[_dyld_get_image_slide()];
  while (1)
  {
    uint64_t v19 = _NSGetMachExecuteHeader();
    uint64_t v20 = getsectdatafromheader_64(v19, "__DATA_CONST", "__objc_dupclass", &size);
    if (v18 >= &v20[_dyld_get_image_slide() + size]) {
      break;
    }
    uint64_t v21 = *(void *)v18;
    v18 += 8;
  }

  if (DebugDuplicateClasses)
  {
    if (DebugDuplicateClasses == 2) {
      ((void (*)(const char *, ...))_objc_fatal)( "Class %s is implemented in both %s (%p) and %s (%p). One of the two will be used. Which one is undefined.",  a2,  v11,  v7,  v12,  a1);
    }
    _objc_inform( "Class %s is implemented in both %s (%p) and %s (%p). One of the two will be used. Which one is undefined.",  a2,  v11,  v7,  v12,  a1);
  }

char *getClassExceptSomeSwift(char *a1)
{
  __n128 result = (char *)getClass_impl(a1);
  if (!result)
  {
    __n128 result = copySwiftV1MangledName(a1, 0);
    if (result)
    {
      unsigned int v3 = result;
      uint64_t Class_impl = getClass_impl(result);
      free(v3);
      return (char *)Class_impl;
    }
  }

  return result;
}

uint64_t nonMetaClasses(void)
{
  uint64_t result = nonmeta_class_map[0];
  if (!nonmeta_class_map[0])
  {
    v3[0] = NXPtrValueMapPrototype;
    v3[1] = *(_OWORD *)&off_18961DA38;
    uint64_t v1 = NXCreateMapTable(v3, 0x20u);
    while (!nonmeta_class_map[0])
    {
      while (!__ldaxr(nonmeta_class_map))
      {
      }

      __clrex();
    }

    NXFreeMapTable(v1);
    return nonmeta_class_map[0];
  }

  return result;
}

uint64_t getClass_impl(char *a1)
{
  unsigned int v2 = _mapStrHash((uint64_t)a1, a1);
  else {
    uint64_t result = v4[0];
  }
  if (!result)
  {
    if (DisablePreopt || preoptimized != 1)
    {
      return 0LL;
    }

    else
    {
      uint64_t v5 = 0LL;
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3321888768LL;
      _OWORD v4[2] = __getPreoptimizedClass_block_invoke;
      v4[3] = &__block_descriptor_40_e8_32c33_ZTSKZ20getPreoptimizedClassE3__0_e16_v28__0_v8B16_B20l;
      v4[4] = &v5;
      _dyld_for_each_objc_class();
      return v5;
    }
  }

  return result;
}

char *copySwiftV1MangledName(const char *a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = &a1[v3];
    if (a1[v3] != 46) {
      break;
    }
    ++v4;
    unint64_t v2 = v3;
LABEL_7:
    ++v3;
  }

  if (a1[v3]) {
    goto LABEL_7;
  }
  uint64_t v6 = 0LL;
  if (v4 == 1 && v2 && v2 < v5 - a1 - 1)
  {
    if (v2 == 5 && (*(_DWORD *)a1 == 1718187859 ? (BOOL v7 = a1[4] == 116) : (BOOL v7 = 0), v7))
    {
      asprintf(&v10, "_Tt%cs%zu%.*s%s");
    }

    else
    {
      uint64_t v8 = 67LL;
      if (a2) {
        uint64_t v8 = 80LL;
      }
      asprintf(&v10, "_Tt%c%zu%.*s%zu%.*s%s", v8, v2);
    }

    return v10;
  }

  return (char *)v6;
}

__objc2_class *realizeAndInitializeIfNeeded_locked(objc_object *a1, objc_class *this, int a3, char *a4)
{
  v6.Class isa = this->isa;
  if ((unint64_t)&this->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0)
  {
    int v12 = realizeClassMaybeSwiftMaybeRelock(this, 1);
    this = v12;
    if (!v12) {
      return (__objc2_class *)this;
    }
    v6.Class isa = v12->isa;
  }

  uint64_t v7 = (unint64_t)v6.isa & 0xFFFFFFFF8LL;
  if (v7) {
    uint64_t v8 = this;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (v7) {
    BOOL v9 = a3 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return (__objc2_class *)v8;
  }
  int v10 = *(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v10 & 1) == 0) {
    int v10 = *(_DWORD *)(*(void *)(v7 + 32) & 0xF00007FFFFFFFF8LL);
  }
  if ((v10 & 0x20000000) != 0) {
    return (__objc2_class *)this;
  }
  return initializeAndMaybeRelock(this, a1, (const char *)1, a4);
}

uint64_t empty_lazyClassNamer(objc_class *a1)
{
  return 0LL;
}

BOOL ___ZN10objc_class36setInstancesRequireRawIsaRecursivelyEb_block_invoke(uint64_t a1, objc_class *this)
{
  unint64_t v2 = (unsigned __int16 *)&this[3].isa + 3;
  __int16 isa_high = HIWORD(this[3].isa);
  if ((isa_high & 0x2000) == 0)
  {
    do
      unsigned __int16 v5 = __ldxr(v2);
    while (__stxr(v5 | 0x2000, v2));
    if (PrintRawIsa)
    {
      uint64_t v7 = " (inherited)";
      if (!*(_BYTE *)(a1 + 32) && *(objc_class **)(a1 + 40) == this) {
        uint64_t v7 = "";
      }
      uint64_t v8 = (const char *)objc_class::nameForLogging(this);
      if ((HIWORD(this[3].isa) & 4) != 0) {
        BOOL v9 = " (meta)";
      }
      else {
        BOOL v9 = "";
      }
      _objc_inform("RAW ISA:  %s%s%s", v8, v9, v7);
    }
  }

  return (isa_high & 0x2000) == 0;
}

__n128 __copy_helper_block_e8_32c64_ZTSKZN10objc_class36setInstancesRequireRawIsaRecursivelyEbE3__0( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

Class _objc_realizeClassFromSwift(Class cls, void *previously)
{
  if (!cls) {
    _objc_fatal( "Swift requested that class %p be ignored, but libobjc does not support that.",  (uint64_t)previously,  v2,  v3,  previously);
  }
  Class = cls;
  if (previously) {
    BOOL v6 = previously == cls;
  }
  else {
    BOOL v6 = 1;
  }
  char v7 = v6;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock))
    {
      char v11 = 1;
      if ((v7 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }

  char v11 = 0;
  __clrex();
  if ((v7 & 1) == 0)
  {
LABEL_12:
    if ((v11 & 1) == 0) {
      os_unfair_lock_lock_with_options();
    }
    addRemappedClass((objc_class *)previously, Class);
    addClassTableEntry((uint64_t)Class, 1);
    uint64_t v15 = (char *)objc_class::mangledName(Class, v12, v13, v14);
    addNamedClass(Class, v15, 0LL);
    int v16 = realizeClassWithoutSwift(Class, (objc_class *)previously);
    int v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v18 = __ldxr(runtimeLock);
      if (v18 != v17) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return v16;
      }
    }

    goto LABEL_27;
  }

LABEL_27:
  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v16;
}

uint64_t addClassTableEntry(uint64_t result, char a2)
{
  for (unint64_t i = (objc_class *)result; ; unint64_t i = (objc_class *)((uint64_t)i->isa & 0xFFFFFFFF8LL))
  {
    uint64_t v8 = i;
    if ((unint64_t)&i->isa[-1].isa + 7 < 0xF
      || (*(_DWORD *)((uint64_t)i[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
      || (uint64_t v4 = *(unsigned __int16 *)(((uint64_t)i[4].isa & 0xF00007FFFFFFFF8LL) + 4), dword_18C43FCC8 <= v4)
      || (*(void *)(qword_18C43FCC0 + 16 * v4) <= (unint64_t)i
        ? (BOOL v5 = *(void *)(qword_18C43FCC0 + 16 * v4 + 8) > (unint64_t)i)
        : (BOOL v5 = 0),
          !v5))
    {
      __n128 result = objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)i);
      if (objc::allocatedClasses + 8LL * qword_18C43F420 == result)
      {
        __n128 result = dataSegmentsContain(i, v6, v7);
        if ((result & 1) == 0) {
          __n128 result = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::try_emplace<objc::detail::DenseSetEmpty&>( (uint64_t)v9,  (int32x2_t *)&objc::allocatedClasses,  (unint64_t *)&v8);
        }
      }
    }

    if ((a2 & 1) == 0) {
      break;
    }
    a2 = 0;
  }

  return result;
}

uint64_t readClass(objc_class *a1, int a2, char a3)
{
  unint64_t v5 = (unint64_t)a1;
  Class isa = a1[4].isa;
  char v7 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)isa & 0x8000000000000000LL) != 0)
  {
    uint64_t v8 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    char v7 = (void *)(v8 & 0xFFFFFFFFFFFFFFFELL);
    if ((v8 & 1) != 0) {
      char v7 = (void *)*v7;
    }
  }

  unsigned int v9 = (char *)atomic_load(v7 + 3);
  for (Class i = a1[1].isa; i; Class i = a1[1].isa)
  {
    a1 = (objc_class *)remapClass((unint64_t)i);
    if (!a1) {
      goto LABEL_13;
    }
    if ((unint64_t)&a1->isa[-1].isa + 7 >= 0xF
      && (*(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
    {
      goto LABEL_16;
    }
  }

  Class v11 = a1[4].isa;
  uint64_t v12 = (void *)((unint64_t)v11 & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)v11 & 0x8000000000000000LL) != 0)
  {
    uint64_t v13 = *(void *)(((unint64_t)v11 & 0xF00007FFFFFFFF8LL) + 8);
    uint64_t v12 = (void *)(v13 & 0xFFFFFFFFFFFFFFFELL);
    if ((v13 & 1) != 0) {
      uint64_t v12 = (void *)*v12;
    }
  }

  if ((*(_BYTE *)v12 & 2) == 0)
  {
LABEL_13:
    if (PrintConnecting)
    {
      BOOL v35 = (const char *)objc_class::nameForLogging((objc_class *)v5);
      _objc_inform("CLASS: IGNORING class '%s' with missing weak-linked superclass", v35);
    }

    addRemappedClass((objc_class *)v5, 0LL);
    uint64_t v14 = 0LL;
    *(void *)(v5 + 8) = 0LL;
    return v14;
  }

uint64_t objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::try_emplace<objc::detail::DenseSetEmpty&>( uint64_t a1, int32x2_t *a2, unint64_t *a3)
{
  uint64_t result = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::LookupBucketFor<objc_class *>( (uint64_t)a2,  *a3,  &v12);
  char v7 = v12;
  if ((result & 1) != 0)
  {
    char v8 = 0;
    goto LABEL_10;
  }

  __int32 v9 = a2[1].i32[0];
  unsigned int v10 = a2[2].u32[0];
  if (4 * v9 + 4 >= 3 * v10)
  {
    v10 *= 2;
    goto LABEL_12;
  }

  if (v10 + ~v9 - a2[1].i32[1] <= v10 >> 3)
  {
LABEL_12:
    objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::grow( (uint64_t)a2,  v10);
    uint64_t result = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::LookupBucketFor<objc_class *>( (uint64_t)a2,  *a3,  &v12);
    char v7 = v12;
  }

  if (*v7 == -2LL)
  {
    a2[1] = vadd_s32(a2[1], (int32x2_t)0xFFFFFFFF00000001LL);
  }

  else if (*v7 == -1LL)
  {
    ++a2[1].i32[0];
  }

  *char v7 = *a3;
  char v8 = 1;
LABEL_10:
  uint64_t v11 = *(void *)a2 + 8LL * a2[2].u32[0];
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = v8;
  return result;
}

uint64_t objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::LookupBucketFor<objc_class *>( uint64_t a1, unint64_t a2, void *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    unsigned int v4 = v3 - 1;
    unsigned int v5 = (v3 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a2 ^ (a2 >> 4))) ^ (1217387093 * (a2 ^ (a2 >> 4))));
    uint64_t v6 = (void *)(*(void *)a1 + 8LL * v5);
    uint64_t v7 = *v6;
    if (*v6 == a2)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      unsigned int v10 = 0LL;
      unsigned int v11 = 1;
      while (v7 != -1)
      {
        if (v11 > v3) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  *(void **)a1,  *(unsigned int *)(a1 + 16));
        }
        if (v10) {
          BOOL v12 = 0;
        }
        else {
          BOOL v12 = v7 == -2;
        }
        if (v12) {
          unsigned int v10 = v6;
        }
        unsigned int v13 = v5 + v11++;
        unsigned int v5 = v13 & v4;
        uint64_t v6 = (void *)(*(void *)a1 + 8LL * (v13 & v4));
        uint64_t v7 = *v6;
        uint64_t v8 = 1LL;
        if (*v6 == a2) {
          goto LABEL_5;
        }
      }

      uint64_t v8 = 0LL;
      if (v10) {
        uint64_t v6 = v10;
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

void objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  unsigned int v4 = *(unint64_t **)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    unsigned int v8 = 4;
  }
  *(_DWORD *)(a1 + 16) = v8;
  size_t v9 = 8LL * v8;
  unsigned int v10 = malloc(v9);
  *(void *)a1 = v10;
  if (v4)
  {
    *(void *)(a1 + 8) = 0LL;
    memset(v10, 255, v9);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 8 * v3;
      BOOL v12 = v4;
      do
      {
        if (*v12 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::LookupBucketFor<objc_class *>( a1,  *v12,  &v13);
          *unsigned int v13 = *v12;
          ++*(_DWORD *)(a1 + 8);
        }

        ++v12;
        v11 -= 8LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    memset(v10, 255, v9);
  }

Class objc_getFutureClass(const char *name)
{
  unint64_t v2 = look_up_class((char *)name);
  if (v2)
  {
    uint64_t v3 = v2;
  }

  else
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v5, runtimeLock)) {
        goto LABEL_9;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_9:
    int v7 = (_DWORD *)future_named_class_map;
    if (!future_named_class_map)
    {
      __int128 v20 = NXStrValueMapPrototype;
      __int128 v21 = *(_OWORD *)&off_18961D8C8;
      int v7 = NXCreateMapTable(&v20, 0x20u);
      future_named_class_map = (uint64_t)v7;
    }

    unsigned int v8 = (**(uint64_t (***)(_DWORD *, const char *))v7)(v7, name);
    else {
      uint64_t v3 = (objc_class *)v20;
    }
    if (!v3)
    {
      size_t v9 = (objc_class *)malloc_zone_malloc_with_options_np();
      uint64_t v3 = v9;
      unint64_t v10 = (unint64_t)calloc(0x20uLL, 1uLL);
      uint64_t v11 = calloc(0x48uLL, 1uLL);
      size_t v12 = strlen(name) + 1;
      unsigned int v13 = (void *)name;
      if ((_dyld_is_memory_immutable() & 1) == 0)
      {
        unsigned int v13 = malloc(v12);
        memcpy(v13, name, v12);
      }

      v11[3] = v13;
      uint64_t v14 = *(void *)(v10 + 8);
      if ((v14 & 1) != 0) {
        *(void *)(v14 & 0xFFFFFFFFFFFFFFFELL) = v11;
      }
      else {
        *(void *)(v10 + 8) = v11;
      }
      unint64_t v15 = (uint64_t)v3[4].isa & 7 | v10 | 0x8000000000000000LL;
      __dmb(0xBu);
      v3[4].Class isa = (Class)v15;
      *(_DWORD *)(v10 & 0xF00007FFFFFFFF8LL) = 0x40000000;
      uint64_t v16 = (_DWORD *)future_named_class_map;
      if (!future_named_class_map)
      {
        __int128 v20 = NXStrValueMapPrototype;
        __int128 v21 = *(_OWORD *)&off_18961D8C8;
        uint64_t v16 = NXCreateMapTable(&v20, 0x20u);
        future_named_class_map = (uint64_t)v16;
      }

      NXMapKeyCopyingInsert((uint64_t (***)(void))v16, name, (uint64_t)v3);
    }

    int v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v18 = __ldxr(runtimeLock);
      if (v18 != v17) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return v3;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  return v3;
}

void sub_18002A7C0(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_class *look_up_class(char *a1)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_7;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_7:
  ClassExceptSomeSwift = (objc_class *)getClassExceptSomeSwift(a1);
  unsigned int v6 = ClassExceptSomeSwift;
  if (!ClassExceptSomeSwift
    || (unint64_t)&ClassExceptSomeSwift->isa[-1].isa + 7 >= 0xF
    && (*(_DWORD *)((uint64_t)ClassExceptSomeSwift[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
  {
    int v7 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v8 = __ldxr(runtimeLock);
      if (v8 != v7) {
        break;
      }
      if (!__stlxr(0, runtimeLock))
      {
        if (ClassExceptSomeSwift) {
          return v6;
        }
        goto LABEL_16;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    if (v6) {
      return v6;
    }
  }

  else
  {
    unsigned int v6 = realizeClassMaybeSwiftMaybeRelock(ClassExceptSomeSwift, 0);
    if (v6) {
      return v6;
    }
  }

uint64_t empty_getClass(const char *a1, objc_class **a2)
{
  *a2 = 0LL;
  return 0LL;
}

void *_class_isFutureClass(void *result)
{
  if (result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _class_isSwift(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  }
  return result;
}

void _objc_flush_caches(Class cls)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v4, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v6 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3321888768LL;
  v18[2] = ___objc_flush_caches_block_invoke;
  v18[3] = &__block_descriptor_33_e8_32c31_ZTSKZ18_objc_flush_cachesE3__0_e8_B16__0_8l;
  flushCaches((uint64_t)cls, (uint64_t)"_objc_flush_caches", (const char *)v18, v1);
  if (cls)
  {
    if ((HIWORD(cls[3].isa) & 4) == 0)
    {
      if (cls[1].isa)
      {
        uint64_t v8 = (uint64_t)cls->isa & 0xFFFFFFFF8LL;
        v17[0] = v6;
        v17[1] = 3321888768LL;
        v17[2] = ___objc_flush_caches_block_invoke_7;
        v17[3] = &__block_descriptor_33_e8_32c31_ZTSKZ18_objc_flush_cachesE3__1_e8_B16__0_8l;
        flushCaches(v8, (uint64_t)"_objc_flush_caches", (const char *)v17, v7);
      }
    }

    int v9 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v10 = __ldxr(runtimeLock);
      if (v10 != v9) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }
  }

  else
  {
    int v11 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v12 = __ldxr(runtimeLock);
      if (v12 != v11) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        goto LABEL_19;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_19:
    unsigned int v13 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v13, runtimeLock)) {
        goto LABEL_24;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_24:
    cache_t::collectNolock((cache_t *)1);
    int v15 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v16 = __ldxr(runtimeLock);
      if (v16 != v15) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18002ABB4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL ___objc_flush_caches_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(objc_cache **)(a2 + 16);
  return v2 == &_objc_empty_cache || HIWORD(*(void *)(a2 + 16)) != 0LL;
}

BOOL ___objc_flush_caches_block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(objc_cache **)(a2 + 16);
  return v2 == &_objc_empty_cache || HIWORD(*(void *)(a2 + 16)) != 0LL;
}

uint64_t is_root_ramdisk()
{
  if ((os_parse_boot_arg_string() & 1) != 0 || (uint64_t result = os_parse_boot_arg_string(), (_DWORD)result))
  {
    uint64_t result = 0LL;
    if (v1 == 109 && v2 == 100) {
      return v3 == 0;
    }
  }

  return result;
}

void map_images(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v7, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  map_images_nolock(a1, a2, (uint64_t)&v14, a3);
  int v12 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(runtimeLock);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      goto LABEL_11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_11:
  if (v14)
  {
    if (DebugClassRXSigning == 2) {
      _objc_fatal("class_rx signing mismatch", v9, v10, v11);
    }
    if (!(DisableFaults | DisableClassROFaults) && getpid() != 1 && (is_root_ramdisk() & 1) == 0)
    {
    }
  }

void _objc_map_images(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    unsigned int v5 = 0LL;
    uint64_t v6 = 0LL;
    unsigned int v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = a1;
    do
    {
      uint64_t v10 = *(void *)(a3 + 8 * v8);
      uint64_t v11 = *(void *)(a2 + 8 * v8);
      if (v6 >= v7)
      {
        uint64_t v12 = (v6 - v5) >> 5;
        unint64_t v13 = v12 + 1;
        if ((v7 - v5) >> 4 > v13) {
          unint64_t v13 = (v7 - v5) >> 4;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14)
        {
          if (v14 >> 59) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          int v15 = (char *)malloc(32 * v14);
        }

        else
        {
          int v15 = 0LL;
        }

        unsigned int v16 = &v15[32 * v12];
        *(void *)unsigned int v16 = v10;
        *((void *)v16 + 1) = v11;
        *((void *)v16 + 2) = 0LL;
        *((_DWORD *)v16 + 6) = 0;
        if (v6 == v5)
        {
          int v19 = &v15[32 * v12];
        }

        else
        {
          int v17 = &v15[32 * v12];
          do
          {
            __int128 v18 = *((_OWORD *)v6 - 1);
            int v19 = v17 - 32;
            *((_OWORD *)v17 - 2) = *((_OWORD *)v6 - 2);
            *((_OWORD *)v17 - 1) = v18;
            v6 -= 32;
            v17 -= 32;
          }

          while (v6 != v5);
        }

        unsigned int v7 = &v15[32 * v14];
        uint64_t v6 = v16 + 32;
        if (v5) {
          free(v5);
        }
        unsigned int v5 = v19;
      }

      else
      {
        *(void *)uint64_t v6 = v10;
        *((void *)v6 + 1) = v11;
        *((void *)v6 + 2) = 0LL;
        *((_DWORD *)v6 + 6) = 0;
        v6 += 32;
      }

      ++v8;
    }

    while (v8 != v9);
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  map_images(a1, (uint64_t)v5, (uint64_t)&__block_literal_global);
  if (v5) {
    free(v5);
  }
}

void sub_18002B028(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void loadAllCategoriesIfNeeded()
{
  if ((didInitialAttachCategories & 1) == 0 && didCallDyldNotifyRegister)
  {
    mach_port_t v0 = (header_info *)FirstHeader;
    if (FirstHeader)
    {
      do
      {
        load_categories_nolock(v0);
        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v0);
        char v2 = (void *)((char *)v0 + 24);
        if (PreoptimizedHeaderRW) {
          char v2 = (void *)PreoptimizedHeaderRW;
        }
        mach_port_t v0 = (header_info *)(*v2 & 0xFFFFFFFFFFFFFFFCLL);
      }

      while (v0);
    }

    didInitialAttachCategories = 1;
  }

void load_categories_nolock(header_info *a1)
{
  char v1 = a1;
  __int128 v21 = a1;
  char v2 = (void *)((char *)a1 + 8);
  int v3 = *(_DWORD *)((char *)a1 + *((void *)a1 + 1) + 12);
  BOOL v4 = DisablePreattachedCategories == 0;
  int v5 = v3 & v4;
  char v20 = v3 & v4;
  int v6 = dyld_shared_cache_some_image_overridden();
  int v7 = v6;
  BOOL v19 = (*((_BYTE *)v2 + *v2 + 4) & 0x40) != 0;
  v17[0] = &v18;
  v17[1] = &v21;
  v17[2] = &v19;
  v17[3] = &v20;
  if ((didInitialAttachCategories & 1) == 0 && (v5 ? (BOOL v8 = v6 == 0) : (BOOL v8 = 0), v8))
  {
    if (PrintPreopt)
    {
      uint64_t v9 = (char *)v1 + *(void *)v1;
      uint64_t v10 = (const char *)dyld_image_path_containing_address();
      _objc_inform("PREOPTIMIZATION: IGNORING preoptimized categories in image %p %s", v9, v10);
    }
  }

  else
  {
    if (PrintPreopt)
    {
      int v15 = (char *)v1 + *(void *)v1;
      unsigned int v16 = (const char *)dyld_image_path_containing_address();
      _objc_inform( "PREOPTIMIZATION: SCANNING categories in image %p %s - didInitialAttachCategories=%d hi->info()->dyldCategoriesOp timized()=%d hasRoot=%d",  v15,  v16,  didInitialAttachCategories,  *(_DWORD *)((_BYTE *)v21 + *((void *)v21 + 1) + 12) & 1,  v7);
      char v1 = v21;
    }

    uint64_t v11 = header_info::catlist(v1, &v18);
    load_categories_nolock(header_info *)::$_0::operator()((uint64_t)v17, v11);
  }

  uint64_t v12 = _dyld_lookup_section_info();
  unint64_t v14 = v13 >> 3;
  if (!v12) {
    unint64_t v14 = 0LL;
  }
  unint64_t v18 = v14;
  load_categories_nolock(header_info *)::$_0::operator()((uint64_t)v17, v12);
}

void load_categories_nolock(header_info *)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  if (**(void **)a1)
  {
    uint64_t v4 = 0LL;
    unsigned int v5 = 1;
    unint64_t v6 = dataSegmentsRanges;
    unint64_t v7 = *(void *)algn_18C43FCB8;
    do
    {
      BOOL v8 = *(const char ***)(a2 + 8 * v4);
      uint64_t v9 = (objc_class *)remapClass((unint64_t)v8[1]);
      unint64_t v13 = **(const char ****)(a1 + 8);
      v32[0] = v8;
      v32[1] = v13;
      if (!v9)
      {
        goto LABEL_38;
      }

      unint64_t v14 = v9;
      if ((unint64_t)&v9->isa[-1].isa + 7 > 0xE)
      {
        if ((didInitialAttachCategories & 1) == 0)
        {
          BOOL v18 = !**(_BYTE **)(a1 + 24) || v6 > (unint64_t)v9;
          if (!v18 && v7 > (unint64_t)v9)
          {
            Class isa = v9[4].isa;
            __int128 v21 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
            if (((unint64_t)isa & 0x8000000000000000LL) != 0)
            {
              uint64_t v22 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
              __int128 v21 = (void *)(v22 & 0xFFFFFFFFFFFFFFFELL);
              if ((v22 & 1) != 0) {
                __int128 v21 = (void *)*v21;
              }
            }
          }
        }

        if (v8[2] || v8[4] || v8[5])
        {
          if ((*(_DWORD *)((uint64_t)v9[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
          {
            if (PrintConnecting)
            {
              unint64_t v31 = *v8;
              uint64_t v26 = (const char *)objc_class::nameForLogging(v9);
              _objc_inform("CLASS: Attaching category (%s) %p to class %s", v31, v8, v26);
            }

            attachCategories(v14, (uint64_t)v32, (const char *)1, (char *)8, v10, v11, v12);
          }

          else
          {
            if (PrintConnecting)
            {
              unint64_t v30 = *v8;
              uint64_t v25 = (const char *)objc_class::nameForLogging(v9);
              _objc_inform("CLASS: Adding unattached category (%s) %p for class %s", v30, v8, v25);
            }

            objc::UnattachedCategories::addForClass(v8, v13, v14);
          }
        }

        if (!v8[3] && !v8[4] && (!**(_BYTE **)(a1 + 16) || !v8[6])) {
          goto LABEL_38;
        }
        int v17 = (objc_class *)((uint64_t)v14->isa & 0xFFFFFFFF8LL);
        if ((unint64_t)&v17->isa[-1].isa + 7 >= 0xF
          && (*(_DWORD *)(*(void *)(((uint64_t)v14->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL) & 0x80000000) != 0)
        {
          if (PrintConnecting)
          {
            uint64_t v27 = *v8;
            uint64_t v28 = (const char *)objc_class::nameForLogging(v14);
            _objc_inform("CLASS: Attaching category (%s) %p to metaclass %s", v27, v8, v28);
            int v17 = (objc_class *)((uint64_t)v14->isa & 0xFFFFFFFF8LL);
          }

          attachCategories(v17, (uint64_t)v32, (const char *)1, (char *)0xA, v10, v11, v12);
          goto LABEL_38;
        }

        if (PrintConnecting)
        {
          Class v29 = *v8;
          unsigned int v24 = (const char *)objc_class::nameForLogging(v14);
          _objc_inform("CLASS: Adding unattached category (%s) %p for metaclass %s", v29, v8, v24);
          int v17 = (objc_class *)((uint64_t)v14->isa & 0xFFFFFFFF8LL);
        }

        int v15 = v8;
        unsigned int v16 = v13;
      }

      else
      {
        if (!v8[2] && !v8[4] && !v8[5] && !v8[3] && (!**(_BYTE **)(a1 + 16) || !v8[6])) {
          goto LABEL_38;
        }
        int v15 = v8;
        unsigned int v16 = v13;
        int v17 = v14;
      }

      objc::UnattachedCategories::addForClass(v15, v16, v17);
LABEL_38:
      uint64_t v4 = v5;
      BOOL v18 = **(void **)a1 > (unint64_t)v5++;
    }

    while (v18);
  }

void objc::UnattachedCategories::addForClass(const char **a1, const char **a2, objc_class *this)
{
  if (PrintConnecting)
  {
    uint64_t v18 = 45LL;
    if ((unint64_t)&this->isa[-1].isa + 7 >= 0xF)
    {
      else {
        uint64_t v18 = 45LL;
      }
    }

    BOOL v19 = (const char *)objc_class::nameForLogging(this);
    _objc_inform("CLASS: found category %c%s(%s)", v18, v19, *a1);
  }

  char v6 = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( (unint64_t)this,  &v21);
  uint64_t v7 = v21;
  if ((v6 & 1) != 0)
  {
    BOOL v8 = (void **)(v21 + 8);
    uint64_t v9 = *(void *)(v21 + 16);
    if ((v9 & 1) != 0)
    {
      unsigned int v13 = v9 >> 1;
      unint64_t v14 = (char *)*v8;
      if (v9 >> 1 == HIDWORD(v9))
      {
        int v15 = 1 << (30 - __clz(v13));
        unsigned int v16 = v15 + v13;
        *(void *)(v21 + 16) = *(void *)(v21 + 16) | ((unint64_t)v16 << 32);
        unint64_t v14 = (char *)reallocf(v14, 16 * v16);
        *(void *)(v7 + 8) = v14;
        uint64_t v9 = *(void *)(v7 + 16);
      }

      *(void *)(v7 + 16) = v9 & 0xFFFFFFFF00000001LL | (2
                                                        * (((unint64_t)(v9 + 2) >> 1) & 0x7FFFFFFF));
      int v17 = (const char ***)&v14[16 * (v9 >> 1)];
      *int v17 = a1;
      v17[1] = a2;
    }

    else if (*v8)
    {
      uint64_t v10 = malloc(0x20uLL);
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v8;
      v10[2] = a1;
      v10[3] = a2;
      *(void *)(v7 + 8) = v10;
      *(void *)(v7 + 16) = 0x200000005LL;
    }

    else
    {
      *(void *)(v21 + 8) = a1;
      *(void *)(v7 + 16) = a2;
    }

    return;
  }

  *(void *)&__int128 v11 = a1;
  int v12 = dword_18C43F848;
  if (4 * (int)qword_18C43F840 + 4 >= (3 * dword_18C43F848))
  {
    int v12 = 2 * dword_18C43F848;
    goto LABEL_28;
  }

  if (dword_18C43F848 + ~(_DWORD)qword_18C43F840 - HIDWORD(qword_18C43F840) <= dword_18C43F848 >> 3)
  {
LABEL_28:
    objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::grow(v12);
    objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( (unint64_t)this,  &v21);
    *(void *)&__int128 v11 = a1;
    uint64_t v7 = v21;
  }

  *((void *)&v11 + 1) = a2;
  if (*(void *)v7 == -2LL)
  {
    qword_18C43F840 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F840, (int32x2_t)0xFFFFFFFF00000001LL);
  }

  else if (*(void *)v7 == -1LL)
  {
    LODWORD(qword_18C43F840) = qword_18C43F840 + 1;
  }

  else if ((*(_BYTE *)(v7 + 16) & 1) != 0)
  {
    __int128 v20 = v11;
    free(*(void **)(v7 + 8));
    __int128 v11 = v20;
  }

  *(void *)uint64_t v7 = this;
  *(_OWORD *)(v7 + 8) = v11;
}

uint64_t load_images(uint64_t a1)
{
  if (PrintImages)
  {
    uint64_t v62 = *(const char **)(a1 + 8);
    if (!v62) {
      uint64_t v62 = "<null>";
    }
    _objc_inform("IMAGES: calling +load methods in %s\n", v62);
  }

  if (_dyld_lookup_section_info()) {
    BOOL v2 = v1 > 7;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    uint64_t result = _dyld_lookup_section_info();
    if (!result || v4 < 8) {
      return result;
    }
  }

  os_unfair_recursive_lock_lock_with_options();
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v6, runtimeLock)) {
      goto LABEL_16;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_16:
  loadAllCategoriesIfNeeded();
  uint64_t v9 = (unint64_t *)_dyld_lookup_section_info();
  if (v9 && v8 >= 8)
  {
    if (v8 >> 3 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v8 >> 3;
    }
    do
    {
      __int128 v11 = (objc_class *)remapClass(*v9);
      schedule_class_load(v11);
      ++v9;
      --v10;
    }

    while (v10);
  }

  uint64_t LoadMethod = _dyld_lookup_section_info();
  uint64_t v16 = LoadMethod;
  if (LoadMethod && v13 >= 8)
  {
    if (v13 >> 3 <= 1) {
      uint64_t v17 = 1LL;
    }
    else {
      uint64_t v17 = v13 >> 3;
    }
    do
    {
      uint64_t v18 = *(uint64_t **)v16;
      uint64_t LoadMethod = remapClass(*(void *)(*(void *)v16 + 8LL));
      if (LoadMethod)
      {
        if ((*(_BYTE *)(LoadMethod + 32) & 2) != 0)
        {
          uint64_t v63 = *v18;
          unint64_t v64 = objc_class::nameForLogging((objc_class *)LoadMethod);
          _objc_fatal( "Category %s on Swift class %s has +load method. Swift class extensions and categories on Swift classes are n ot allowed to have +load methods.",  v65,  v66,  v67,  v63,  v64);
        }

        realizeClassWithoutSwift((objc_class *)LoadMethod, 0LL);
        uint64_t LoadMethod = _category_getLoadMethod((unsigned int *)v18[3], v19, v20, v21);
        uint64_t v22 = LoadMethod;
        if (LoadMethod)
        {
          if (PrintLoading)
          {
            uint64_t v23 = (objc_class *)remapClass(v18[1]);
            unsigned int v24 = (const char *)objc_class::nameForLogging(v23);
            _objc_inform("LOAD: category '%s(%s)' scheduled for +load", v24, (const char *)*v18);
          }

          uint64_t v25 = loadable_categories_used;
          uint64_t LoadMethod = loadable_categories;
          if (loadable_categories_used == loadable_categories_allocated)
          {
            loadable_categories_allocated = 2 * loadable_categories_used + 16;
            uint64_t LoadMethod = (uint64_t)realloc((void *)loadable_categories, 16LL * loadable_categories_allocated);
            loadable_categories = LoadMethod;
          }

          uint64_t v26 = (uint64_t **)(LoadMethod + 16 * v25);
          *uint64_t v26 = v18;
          v26[1] = (uint64_t *)v22;
          loadable_categories_used = v25 + 1;
        }
      }

      v16 += 8LL;
      --v17;
    }

    while (v17);
  }

  int v27 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v28 = __ldxr(runtimeLock);
    if (v28 != v27) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      goto LABEL_41;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_41:
  if ((call_load_methods::loading & 1) != 0) {
    return os_unfair_recursive_lock_unlock();
  }
  call_load_methods::loading = 1;
  context = AutoreleasePoolPage::push((objc_object *)LoadMethod, v13, v14, v15);
  p_cache = &OBJC_METACLASS_____IncompleteProtocol.cache;
  uint64_t v30 = loadable_classes_used;
  do
  {
    if ((int)v30 >= 1)
    {
      do
      {
        uint64_t v31 = 0LL;
        uint64_t v32 = (char *)loadable_classes;
        loadable_classes = 0LL;
        loadable_classes_allocated = 0;
        *((_DWORD *)p_cache + 642) = 0;
        uint64_t v33 = 16 * v30;
        do
        {
          uint64_t v34 = *(void *)&v32[v31];
          if (v34)
          {
            BOOL v35 = *(void (**)(uint64_t, char *))&v32[v31 + 8];
            if (PrintLoading)
            {
              unint64_t v36 = (const char *)objc_class::nameForLogging(*(objc_class **)&v32[v31]);
              _objc_inform("LOAD: +[%s load]\n", v36);
            }

            v35(v34, sel_load);
          }

          v31 += 16LL;
        }

        while (v33 != v31);
        free(v32);
        uint64_t v30 = *((unsigned int *)p_cache + 642);
      }

      while ((int)v30 > 0);
    }

    unint64_t v37 = (char *)loadable_categories;
    uint64_t v38 = loadable_categories_used;
    int v70 = loadable_categories_allocated;
    loadable_categories = 0LL;
    loadable_categories_allocated = 0;
    loadable_categories_used = 0;
    if ((int)v38 < 1)
    {
      BOOL v53 = 0;
      goto LABEL_83;
    }

    for (uint64_t i = 0LL; i != v38; ++i)
    {
      uint64_t v40 = &v37[16 * i];
      uint64_t v41 = *(void *)v40;
      if (*(void *)v40)
      {
        uint64_t v42 = (void (*)(objc_class *, char *))*((void *)v40 + 1);
        unsigned int v43 = *(_DWORD *)(StatusReg + 24);
        while (!__ldaxr(runtimeLock))
        {
          if (!__stxr(v43, runtimeLock)) {
            goto LABEL_59;
          }
        }

        __clrex();
        os_unfair_lock_lock_with_options();
LABEL_59:
        unint64_t v45 = remapClass(*(void *)(v41 + 8));
        unint64_t v46 = (objc_class *)v45;
        int v47 = *(_DWORD *)(StatusReg + 24);
        while (1)
        {
          unsigned int v48 = __ldxr(runtimeLock);
          if (v48 != v47) {
            break;
          }
          if (!__stlxr(0, runtimeLock))
          {
            if (!v45) {
              goto LABEL_68;
            }
            goto LABEL_65;
          }
        }

        __clrex();
        os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
        if (!v46) {
          continue;
        }
LABEL_65:
        if (PrintLoading)
        {
          unint64_t v49 = (const char *)objc_class::nameForLogging(v46);
          _objc_inform("LOAD: +[%s(%s) load]\n", v49, *(const char **)v41);
        }

        v42(v46, sel_load);
        *(void *)uint64_t v40 = 0LL;
      }

LABEL_68:
      ;
    }

    uint64_t v50 = 0LL;
    int v51 = 0;
    p_cache = &OBJC_METACLASS_____IncompleteProtocol.cache;
    do
    {
      if (*(void *)&v37[v50]) {
        *(_OWORD *)&v37[v50 + -16 * v51] = *(_OWORD *)&v37[v50];
      }
      else {
        ++v51;
      }
      v50 += 16LL;
    }

    while (16 * v38 != v50);
    uint64_t v52 = loadable_categories_used;
    LODWORD(v38) = v38 - v51;
    BOOL v53 = loadable_categories_used > 0;
    unint64_t v54 = (void *)loadable_categories;
    if (loadable_categories_used >= 1)
    {
      BOOL v71 = loadable_categories_used > 0;
      int v55 = v38;
      uint64_t v56 = 16LL * (int)v38;
      uint64_t v69 = loadable_categories;
      uint64_t v57 = (__int128 *)loadable_categories;
      LODWORD(v38) = loadable_categories_used + v38;
      int v58 = v70;
      do
      {
        if (v55 == v58)
        {
          int v58 = 2 * v58 + 16;
          unint64_t v37 = (char *)realloc(v37, 16LL * v58);
        }

        ++v55;
        __int128 v59 = *v57++;
        *(_OWORD *)&v37[v56] = v59;
        v56 += 16LL;
        --v52;
      }

      while (v52);
      int v70 = v58;
      p_cache = (void **)(&OBJC_METACLASS_____IncompleteProtocol + 16);
      BOOL v53 = v71;
      unint64_t v54 = (void *)v69;
LABEL_82:
      free(v54);
LABEL_83:
      int v60 = v70;
      if ((_DWORD)v38) {
        goto LABEL_87;
      }
      goto LABEL_84;
    }

    int v60 = v70;
    if (loadable_categories) {
      goto LABEL_82;
    }
    BOOL v53 = 0;
    if ((_DWORD)v38) {
      goto LABEL_87;
    }
LABEL_84:
    if (v37)
    {
      free(v37);
      unint64_t v37 = 0LL;
    }

    int v60 = 0;
LABEL_87:
    loadable_categories = (uint64_t)v37;
    loadable_categories_used = v38;
    loadable_categories_allocated = v60;
    uint64_t v30 = *((unsigned int *)p_cache + 642);
    char v61 = (int)v30 > 0 || v53;
  }

  while ((v61 & 1) != 0);
  objc_autoreleasePoolPop(context);
  call_load_methods::loading = 0;
  return os_unfair_recursive_lock_unlock();
}

void sub_18002BD8C(_Unwind_Exception *a1)
{
}

objc_class *schedule_class_load(objc_class *result)
{
  if (result)
  {
    unint64_t v1 = result;
    if ((*(_BYTE *)(((uint64_t)result[4].isa & 0xF00007FFFFFFFF8LL) + 2) & 0x80) == 0)
    {
      schedule_class_load(result[1].isa);
      uint64_t result = (objc_class *)objc_class::getLoadMethod(v1, v2, v3, v4);
      if (result)
      {
        uint64_t v5 = (uint64_t)result;
        if (PrintLoading)
        {
          uint64_t v10 = (const char *)objc_class::nameForLogging(v1);
          _objc_inform("LOAD: class '%s' scheduled for +load", v10);
        }

        uint64_t v6 = loadable_classes_used;
        uint64_t result = (objc_class *)loadable_classes;
        if (loadable_classes_used == loadable_classes_allocated)
        {
          loadable_classes_allocated = 2 * loadable_classes_used + 16;
          uint64_t result = (objc_class *)realloc((void *)loadable_classes, 16LL * loadable_classes_allocated);
          loadable_classes = (uint64_t)result;
        }

        p_Class isa = &result[2 * v6].isa;
        *p_Class isa = v1;
        p_isa[1] = (objc_class *)v5;
        loadable_classes_used = v6 + 1;
      }

      unint64_t v8 = (unsigned int *)((uint64_t)v1[4].isa & 0xF00007FFFFFFFF8LL);
      do
        unsigned int v9 = __ldxr(v8);
      while (__stxr(v9 | 0x800000, v8));
    }
  }

  return result;
}

uint64_t _objc_load_image(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = a1;
  _OWORD v3[2] = 0LL;
  int v4 = 0;
  return load_images((uint64_t)v3);
}

void unmap_image(uint64_t a1, header_info *a2)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v4, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v6 = (header_info *)FirstHeader;
  if (FirstHeader)
  {
    while ((header_info *)((char *)v6 + *(void *)v6) != a2)
    {
      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v6);
      unint64_t v8 = (void *)((char *)v6 + 24);
      if (PreoptimizedHeaderRW) {
        unint64_t v8 = (void *)PreoptimizedHeaderRW;
      }
      uint64_t v6 = (header_info *)(*v8 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v6) {
        goto LABEL_144;
      }
    }

    if (PrintImages)
    {
      unsigned int v9 = (const char *)dyld_image_path_containing_address();
      else {
        uint64_t v10 = "";
      }
      _objc_inform("IMAGES: unloading image for %s%s\n", v9, v10);
    }

    uint64_t v11 = header_info::catlist(v6, &v75);
    unint64_t v70 = StatusReg;
    unint64_t v12 = v75;
    if (v75)
    {
      uint64_t v13 = v11;
      uint64_t v14 = 0LL;
      while (1)
      {
        int v15 = *(const char ***)(v13 + 8 * v14);
        unint64_t v16 = remapClass((unint64_t)v15[1]);
        if (v16) {
          break;
        }
LABEL_53:
        if (++v14 == v12) {
          goto LABEL_54;
        }
      }

      int v17 = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( v16,  v76);
      uint64_t v18 = (void *)v76[0];
      else {
        int v19 = v17;
      }
      if (v19 != 1)
      {
LABEL_45:
        if (loadable_categories && loadable_categories_used >= 1)
        {
          uint64_t v27 = 0LL;
          unsigned int v28 = (void **)loadable_categories;
          while (*v28 != v15)
          {
            ++v27;
            v28 += 2;
            if (loadable_categories_used == v27) {
              goto LABEL_53;
            }
          }

          *(void *)(loadable_categories + 16 * v27) = 0LL;
          if (PrintLoading)
          {
            Class v29 = (objc_class *)remapClass((unint64_t)v15[1]);
            uint64_t v30 = (const char *)objc_class::nameForLogging(v29);
            _objc_inform("LOAD: category '%s(%s)' unscheduled for +load", v30, *v15);
          }
        }

        goto LABEL_53;
      }

      __int128 v20 = (void **)(v76[0] + 8LL);
      unint64_t v21 = *(void *)(v76[0] + 16LL);
      if ((v21 & 1) != 0)
      {
        if (v21 >= 2)
        {
          uint64_t v23 = 0LL;
          unsigned int v24 = v21 >> 1;
          else {
            uint64_t v25 = v24;
          }
          uint64_t v26 = (void **)*v20;
          while (*v26 != v15)
          {
            ++v23;
            v26 += 2;
            if (v25 == v23) {
              goto LABEL_38;
            }
          }

          memmove((char *)*v20 + 16 * v23, (char *)*v20 + 16 * (v23 + 1), 16 * (v24 + ~(_DWORD)v23));
          unint64_t v21 = v18[2] & 0xFFFFFFFF00000001LL | (2 * (((unint64_t)(v18[2] - 2) >> 1) & 0x7FFFFFFF));
          v18[2] = v21;
        }
      }

      else if (*v20 == v15)
      {
        const char *v20 = 0LL;
        v18[2] = 0LL;
        BOOL v22 = 1;
        goto LABEL_39;
      }

LABEL_38:
      BOOL v22 = (v21 & 1) == 0;
      if ((v21 & 1) != 0)
      {
LABEL_42:
        if (!v22) {
          free(*v20);
        }
        *uint64_t v18 = -2LL;
        qword_18C43F840 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F840, (int32x2_t)0x1FFFFFFFFLL);
        objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::compact();
        goto LABEL_45;
      }

LABEL_39:
      if (*v20) {
        goto LABEL_45;
      }
      goto LABEL_42;
    }

LABEL_54:
    unint64_t v72 = 0LL;
    uint64_t v73 = 0LL;
    uint64_t v74 = 0LL;
    uint64_t v31 = header_info::classlist(v6, &v75);
    unint64_t v32 = v75;
    if (v75)
    {
      uint64_t v33 = (unint64_t *)v31;
      do
      {
        unint64_t v71 = remapClass(*v33);
        if (v71) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::try_emplace<objc::detail::DenseSetEmpty&>( (uint64_t)v76,  (int32x2_t *)&v72,  &v71);
        }
        ++v33;
        --v32;
      }

      while (v32);
    }

    uint64_t v34 = header_info::nlclslist(v6, &v75);
    unint64_t v35 = v75;
    if (v75)
    {
      unint64_t v36 = (unint64_t *)v34;
      do
      {
        unint64_t v71 = remapClass(*v36);
        if (v71) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>::try_emplace<objc::detail::DenseSetEmpty&>( (uint64_t)v76,  (int32x2_t *)&v72,  &v71);
        }
        ++v36;
        --v35;
      }

      while (v35);
    }

    unint64_t v37 = (objc_class **)v72;
    if ((_DWORD)v73)
    {
      int v38 = v74;
      uint64_t v39 = (objc_class **)((char *)v72 + 8 * v74);
      uint64_t v40 = (objc_class **)v72;
      if ((_DWORD)v74)
      {
        uint64_t v41 = 0LL;
        while (*(void *)((char *)v72 + v41) >= 0xFFFFFFFFFFFFFFFELL)
        {
          v41 += 8LL;
        }

        uint64_t v40 = (objc_class **)((char *)v72 + v41);
      }

      if (v40 != v39)
      {
        uint64_t v42 = *v40;
LABEL_73:
        if (loadable_classes && loadable_classes_used >= 1)
        {
          uint64_t v43 = 0LL;
          uint64_t v44 = (objc_class **)loadable_classes;
          while (*v44 != v42)
          {
            ++v43;
            v44 += 2;
            if (loadable_classes_used == v43) {
              goto LABEL_81;
            }
          }

          *(void *)(loadable_classes + 16 * v43) = 0LL;
          if (PrintLoading)
          {
            unint64_t v45 = (const char *)objc_class::nameForLogging(v42);
            _objc_inform("LOAD: class '%s' unscheduled for +load", v45);
          }
        }

  uint64_t v34 = 0;
  if (v20) {
    goto LABEL_57;
  }
LABEL_55:
  if (v22 != (unsigned int *)v23)
  {
    unint64_t v35 = v22[1];
    BOOL v22 = 0LL;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v34 += v35;
          if (!v20) {
            goto LABEL_55;
          }
LABEL_57:
          if ((v25 & 1) != 0) {
            break;
          }
          unint64_t v36 = *(void *)v22;
          v22 += 2;
          unint64_t v35 = *(_DWORD *)(v36 + 4);
        }

        if (!v24) {
          break;
        }
        unint64_t v35 = MEMORY[4];
      }

      uint64_t v2 = (char *)*v22;
      Class v29 = v22[1];
      int v3 = v29 * (unint64_t)v2;
      if ((v3 & 0xFFFFFFFF00000000LL) != 0) {
        break;
      }
      unint64_t v35 = *(_DWORD *)((char *)v4 + (*v4 >> 16) + 4);
      unint64_t v37 = (unint64_t)v22 + v3 + 8;
      int v38 = (uint64_t *)((char *)v4 + v21);
      do
      {
        unsigned int v4 = v38;
        uint64_t v39 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v38 + 8);
        int v38 = (uint64_t *)((char *)v38 + v21);
      }

      while ((v39 & 1) == 0);
    }

    uint64_t v30 = *v22;
LABEL_103:
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v29, v2, (char *)v3, v29, v22, v30);
  }

LABEL_81:
        detach_class((objc_class *)((uint64_t)v42->isa & 0xFFFFFFFF8LL), 1);
        detach_class(v42, 0);
        while (++v40 != v39)
        {
          uint64_t v42 = *v40;
          if ((unint64_t)*v40 < 0xFFFFFFFFFFFFFFFELL)
          {
            if (v40 != v39) {
              goto LABEL_73;
            }
            break;
          }
        }

        unint64_t v37 = (objc_class **)v72;
        if (!(_DWORD)v73) {
          goto LABEL_99;
        }
        int v38 = v74;
        uint64_t v39 = (objc_class **)((char *)v72 + 8 * v74);
      }

      unint64_t v46 = v37;
      if (v38)
      {
LABEL_88:
        unint64_t v46 = v37;
        while ((unint64_t)*v46 >= 0xFFFFFFFFFFFFFFFELL)
        {
          if (++v46 == v39) {
            goto LABEL_99;
          }
        }
      }

      if (v46 != v39)
      {
        int v47 = *v46;
LABEL_94:
        free_class((objc_class *)((uint64_t)v47->isa & 0xFFFFFFFF8LL));
        free_class(v47);
        while (++v46 != v39)
        {
          int v47 = *v46;
          if ((unint64_t)*v46 < 0xFFFFFFFFFFFFFFFELL)
          {
            if (v46 != v39) {
              goto LABEL_94;
            }
            break;
          }
        }

        unint64_t v37 = (objc_class **)v72;
      }
    }

LABEL_99:
    free(v37);
    uint64_t v48 = FirstHeader;
    unint64_t StatusReg = v70;
    if (!FirstHeader)
    {
LABEL_119:
      unint64_t v58 = (unint64_t)v6 + *(void *)v6;
      if (dataSegmentsRanges > v58 || *(void *)algn_18C43FCB8 <= v58)
      {
        int v60 = v76;
        v76[0] = &off_18961E4B8;
        unint64_t v77 = v76;
        unint64_t v61 = *(unsigned int *)(v58 + 16);
        if ((_DWORD)v61)
        {
          uint64_t v62 = (char *)(v58 + 32);
          uint64_t v63 = *(unsigned int *)(v58 + 16);
          unint64_t v64 = v58 + 32;
          while (*(_DWORD *)v64 != 25 || strncmp((const char *)(v64 + 8), "__TEXT", 0x10uLL))
          {
            v64 += *(unsigned int *)(v64 + 4);
            if (!--v63)
            {
              unint64_t v65 = 0LL;
              goto LABEL_131;
            }
          }

          unint64_t v65 = v58 - *(void *)(v64 + 24);
LABEL_131:
          for (unint64_t i = 0LL; i < v61; ++i)
          {
            if (*(_DWORD *)v62 == 25 && (!strncmp(v62 + 8, "__DATA", 6uLL) || !strncmp(v62 + 8, "__AUTH", 6uLL)))
            {
              unint64_t v72 = v62;
              unint64_t v75 = v65;
              if (!v77)
              {
                std::__throw_bad_function_call[abi:nn180100]();
                __break(1u);
                return;
              }

              (*(void (**)(void *, void **, unint64_t *))(*v77 + 48LL))(v77, &v72, &v75);
              unint64_t v61 = *(unsigned int *)(v58 + 16);
            }

            v62 += *((unsigned int *)v62 + 1);
          }

          int v60 = v77;
          if (v77 == v76)
          {
            uint64_t v66 = 4LL;
            int v60 = v76;
            unint64_t StatusReg = v70;
          }

          else
          {
            unint64_t StatusReg = v70;
            if (!v77) {
              goto LABEL_143;
            }
            uint64_t v66 = 5LL;
          }
        }

        else
        {
          uint64_t v66 = 4LL;
        }

        (*(void (**)(void))(*v60 + 8 * v66))();
      }

LABEL_143:
      free(v6);
      goto LABEL_144;
    }

    if ((header_info *)FirstHeader != v6)
    {
      while (1)
      {
        uint64_t v49 = getPreoptimizedHeaderRW(v48);
        uint64_t v50 = (void *)(v48 + 24);
        if (v49) {
          uint64_t v50 = (void *)v49;
        }
        unint64_t v51 = *v50 & 0xFFFFFFFFFFFFFFFCLL;
        if (!v51) {
          goto LABEL_119;
        }
        uint64_t v52 = v48;
        uint64_t v48 = v51;
        if (v6 == (header_info *)v51) {
          goto LABEL_107;
        }
      }
    }

    uint64_t v52 = 0LL;
LABEL_107:
    uint64_t v53 = getPreoptimizedHeaderRW((uint64_t)v6);
    unint64_t v54 = (void *)((char *)v6 + 24);
    if (v53) {
      unint64_t v54 = (void *)v53;
    }
    unint64_t v55 = *v54 & 0xFFFFFFFFFFFFFFFCLL;
    if (v52)
    {
      uint64_t v56 = getPreoptimizedHeaderRW(v52);
      uint64_t v57 = (void *)(v52 + 24);
      if (v56) {
        uint64_t v57 = (void *)v56;
      }
      *uint64_t v57 = *v57 & 3LL | v55;
      if ((header_info *)LastHeaderRealizedAllClasses != v6) {
        goto LABEL_117;
      }
    }

    else
    {
      FirstHeader = *v54 & 0xFFFFFFFFFFFFFFFCLL;
      if ((header_info *)LastHeaderRealizedAllClasses != v6) {
        goto LABEL_117;
      }
      uint64_t v52 = 0LL;
    }

    LastHeaderRealizedAllClasses = v52;
LABEL_117:
    if ((header_info *)LastHeader == v6) {
      LastHeader = 0LL;
    }
    goto LABEL_119;
  }

LABEL_144:
  int v68 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v69 = __ldxr(runtimeLock);
    if (v69 != v68) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      goto LABEL_149;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_149:
  os_unfair_recursive_lock_unlock();
}

void sub_18002C6EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  int v23 = *(_DWORD *)(a12 + 24);
  while (1)
  {
    unsigned int v24 = __ldxr(v21);
    if (v24 != v23) {
      break;
    }
    if (!__stlxr(0, v21)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

unint64_t protocols(void)
{
  if (!protocols(void)::protocol_map[0])
  {
    v3[0] = NXStrValueMapPrototype;
    v3[1] = *(_OWORD *)&off_18961D8C8;
    unint64_t v1 = NXCreateMapTable(v3, 0x10u);
    while (!protocols(void)::protocol_map[0])
    {
      while (!__ldaxr(protocols(void)::protocol_map))
      {
      }

      __clrex();
    }

    NXFreeMapTable(v1);
  }

  return protocols(void)::protocol_map[0];
}

uint64_t getProtocol(const char *a1)
{
  uint64_t v2 = (uint64_t (***)(void, const char *))protocols();
  unsigned int v3 = (**v2)(v2, a1);
  else {
    uint64_t PreoptimizedProtocol = v10;
  }
  if (!PreoptimizedProtocol)
  {
    uint64_t PreoptimizedProtocol = getPreoptimizedProtocol();
    if (!PreoptimizedProtocol)
    {
      uint64_t v5 = copySwiftV1MangledName(a1, 1);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = (uint64_t (***)(void, char *))protocols();
        unsigned int v8 = (**v7)(v7, v6);
        else {
          uint64_t PreoptimizedProtocol = v10;
        }
        if (!PreoptimizedProtocol) {
          uint64_t PreoptimizedProtocol = getPreoptimizedProtocol();
        }
        free(v6);
      }

      else
      {
        return 0LL;
      }
    }
  }

  return PreoptimizedProtocol;
}

unint64_t protocol_t::demangledName(char **this)
{
  uint64_t v2 = (unint64_t *)(this + 10);
  if ((char **)((char *)this + *((unsigned int *)this + 16)) <= this + 10)
  {
    uint64_t v2 = (unint64_t *)(this + 1);
  }

  else if (!*v2)
  {
    unsigned int v3 = copySwiftV1DemangledName(this[1], 1);
    if (v3)
    {
      while (!__ldaxr(v2))
      {
      }

      __clrex();
      free(v3);
    }

    else
    {
      unint64_t v6 = (unint64_t)this[1];
      while (!__ldaxr(v2))
      {
        if (!__stlxr(v6, v2)) {
          return *v2;
        }
      }

      __clrex();
    }
  }

  return *v2;
}

void fixupProtocol(protocol_t *a1)
{
  uint64_t v2 = (unint64_t *)*((void *)a1 + 2);
  if (v2 && *v2)
  {
    unint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = v2[v3 + 1];
      int v5 = *(_DWORD *)(v4 + 68);
      if (canonical_protocol) {
        int v6 = 0;
      }
      else {
        int v6 = 0x20000000;
      }
      if ((v6 & v5) == 0)
      {
        uint64_t Protocol = getProtocol(*(const char **)(v4 + 8));
        if (Protocol) {
          uint64_t v4 = Protocol;
        }
        int v5 = *(_DWORD *)(v4 + 68);
      }

      unsigned int v8 = v5 & 0xC0000000;
      if (fixed_up_protocol) {
        int v9 = -1073741824;
      }
      else {
        int v9 = 0x40000000;
      }
      if (v8 != v9) {
        fixupProtocol((protocol_t *)v4);
      }
      ++v3;
      uint64_t v2 = (unint64_t *)*((void *)a1 + 2);
    }

    while (v3 < *v2);
  }

  fixupProtocolMethodList(a1, *((method_list_t **)a1 + 3), 1, (char *)1);
  fixupProtocolMethodList(a1, *((method_list_t **)a1 + 4), 1, 0LL);
  fixupProtocolMethodList(a1, *((method_list_t **)a1 + 5), 0, (char *)1);
  fixupProtocolMethodList(a1, *((method_list_t **)a1 + 6), 0, 0LL);
  if (fixed_up_protocol) {
    int v10 = -1073741824;
  }
  else {
    int v10 = 0x40000000;
  }
  *((_DWORD *)a1 + 17) = v10 | *((_DWORD *)a1 + 17) & 0x3FFFFFFF;
}

void realizeAllClasses(void)
{
  mach_port_t v0 = (header_info *)FirstHeader;
  uint64_t v1 = LastHeaderRealizedAllClasses;
  if (LastHeaderRealizedAllClasses) {
    BOOL v2 = FirstHeader == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2 && FirstHeader != LastHeaderRealizedAllClasses)
  {
    do
    {
      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v0);
      int v5 = (void *)((char *)v0 + 24);
      if (PreoptimizedHeaderRW) {
        int v5 = (void *)PreoptimizedHeaderRW;
      }
      mach_port_t v0 = (header_info *)(*v5 & 0xFFFFFFFFFFFFFFFCLL);
      if (v0) {
        BOOL v6 = v1 == (void)v0;
      }
      else {
        BOOL v6 = 1;
      }
    }

    while (!v6);
  }

  if (v0)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      uint64_t v8 = header_info::classlist(v0, &v23);
      unint64_t v9 = v23;
      if (v23)
      {
        int v10 = (unint64_t *)v8;
        do
        {
          uint64_t v11 = (objc_class *)remapClass(*v10);
          if (v11) {
            realizeClassMaybeSwiftMaybeRelock(v11, 1);
          }
          ++v10;
          --v9;
        }

        while (v9);
      }

      uint64_t v12 = _dyld_lookup_section_info();
      unint64_t v14 = v13 >> 3;
      if (!v12) {
        unint64_t v14 = 0LL;
      }
      unint64_t v23 = v14;
      if (v14)
      {
        uint64_t v15 = v12;
        unint64_t v16 = 0LL;
        do
        {
          if (remapClass(*(void *)(v15 + 8 * v16)) == *(void *)(v15 + 8 * v16))
          {
            int v17 = *(_DWORD *)(StatusReg + 24);
            while (1)
            {
              unsigned int v18 = __ldxr(runtimeLock);
              if (v18 != v17) {
                break;
              }
              if (!__stlxr(0, runtimeLock)) {
                goto LABEL_32;
              }
            }

            __clrex();
            os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_32:
            (*(void (**)(void))(*(void *)(v15 + 8 * v16) + 8LL))();
            unsigned int v19 = *(_DWORD *)(StatusReg + 24);
            while (!__ldaxr(runtimeLock))
            {
              if (!__stxr(v19, runtimeLock)) {
                goto LABEL_37;
              }
            }

            __clrex();
            os_unfair_lock_lock_with_options();
          }

__objc2_class *_read_images::$_1::operator()(__objc2_class *result, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v4 = (void *)((unint64_t)result & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)result & 0x8000000000000000LL) != 0)
  {
    uint64_t v5 = *(void *)(((unint64_t)result & 0xF00007FFFFFFFF8LL) + 8);
    uint64_t v4 = (void *)(v5 & 0xFFFFFFFFFFFFFFFELL);
    if ((v5 & 1) != 0) {
      uint64_t v4 = (void *)*v4;
    }
  }

  uint64_t v6 = v4[4];
  uint64_t v7 = (unsigned int *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  if ((v6 & 1) != 0 || !v7)
  {
    uint64_t v8 = v6 & 1;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      if (DisablePreattachedCategories)
      {
        uint64_t v12 = *v7;
        uint64_t v11 = v7[1];
        unint64_t v23 = v11 * (unint64_t)v12;
        if ((v23 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v11, v7, *v7);
        }
        int v10 = (uint64_t *)((char *)v7 + v23 + 8);
        BOOL v24 = (_DWORD)v11 == 0;
        if ((_DWORD)v11) {
          uint64_t v11 = v11;
        }
        else {
          uint64_t v11 = 0LL;
        }
        if (!v24) {
          int v10 = (uint64_t *)((char *)v10 - v12);
        }
      }

      else
      {
        int v10 = (uint64_t *)(v7 + 2);
        uint64_t v12 = *v7;
        uint64_t v11 = v7[1];
      }

      unint64_t v13 = v11 * (unint64_t)v12;
      if ((v13 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v11, v7, v12);
      }
      unint64_t v14 = (unint64_t)v7 + v13 + 8;
      if ((unint64_t)v10 < v14)
      {
        while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v10 + 8) & 1) == 0)
        {
          int v10 = (uint64_t *)((char *)v10 + v12);
          unsigned int v15 = v12;
        }
      }

      unsigned int v15 = v12;
LABEL_20:
      if (v10 != (uint64_t *)v14)
      {
        int v16 = _read_images::PreoptTotalMethodLists;
        uint64_t result = &OBJC_CLASS___Object;
        do
        {
          uint64_t v17 = *v10 >> 16;
          _read_images::PreoptTotalMethodLists = ++v16;
          uint64_t v18 = *v7;
          unint64_t v19 = v18 * (unint64_t)v11;
          if ((v19 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v18,  (const char *)v19,  a4,  v11,  v7,  *v7);
          }
          uint64_t v20 = v15;
          unint64_t v21 = (unint64_t)v7 + v19 + 8;
          BOOL v22 = (uint64_t *)((char *)v10 + v15);
          do
          {
            int v10 = v22;
            a4 = *(char **)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v22 + 8);
            BOOL v22 = (uint64_t *)((char *)v22 + v20);
          }

          while ((a4 & 1) == 0);
          unsigned int v15 = v20;
        }

        while (v10 != (uint64_t *)v14);
      }
    }
  }

  else
  {
    ++_read_images::PreoptTotalMethodLists;
    if ((~*v7 & 3) == 0) {
      ++_read_images::PreoptOptimizedMethodLists;
    }
  }

  return result;
}

void fixupProtocolMethodList(protocol_t *a1, method_list_t *this, int a3, char *a4)
{
  if (this && (~*(_DWORD *)this & 3) != 0)
  {
    uint64_t v6 = (uint64_t *)((char *)a1 + 72);
    if ((char *)a1 + *((unsigned int *)a1 + 16) <= (char *)a1 + 72)
    {
      fixupMethodList(this, 1LL, (const char *)1, a4);
    }

    else
    {
      int v7 = (int)a4;
      uint64_t v9 = *v6;
      fixupMethodList(this, 1LL, (const char *)(*v6 == 0), a4);
      if (v9)
      {
        if ((*(_DWORD *)this & 0x80000000) == 0)
        {
          unint64_t v10 = *((unsigned int *)this + 1);
          uint64_t v11 = (char *)this + 8;
          getExtendedTypesIndexesForMethod(a1, ((unint64_t)this + 8) & 0xFFFFFFFFFFFFFFFCLL, a3, v7, v31, &v30);
          if ((_DWORD)v10)
          {
            uint64_t v15 = 0LL;
            uint64_t v16 = 1LL;
            int v17 = v31[0];
            do
            {
              uint64_t v18 = v15 + 1;
              if (v15 + 1 < v10)
              {
                uint64_t v19 = (v17 + v15);
                uint64_t v20 = v16;
                do
                {
                  uint64_t v21 = (unsigned __int16)*(_DWORD *)this & 0xFFFC;
                  uint64_t v22 = v15 * v21;
                  if ((v22 & 0xFFFFFFFF00000000LL) != 0) {
                    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v12,  v13,  v14,  v15,  this,  v21);
                  }
                  unint64_t v23 = v20 * (unint64_t)v21;
                  if ((v23 & 0xFFFFFFFF00000000LL) != 0) {
                    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v12,  v13,  v14,  v20,  this,  v21);
                  }
                  unint64_t v24 = (unint64_t)&v11[v22] & 0xFFFFFFFFFFFFFFFCLL;
                  unint64_t v25 = (unint64_t)&v11[v23] & 0xFFFFFFFFFFFFFFFCLL;
                  if (*(void *)v24 > *(void *)v25)
                  {
                    uint64_t v26 = *(void *)(v24 + 16);
                    __int128 v27 = *(_OWORD *)v24;
                    uint64_t v28 = *(void *)(v25 + 16);
                    *(_OWORD *)unint64_t v24 = *(_OWORD *)v25;
                    *(void *)(v24 + 16) = v28;
                    *(_OWORD *)unint64_t v25 = v27;
                    *(void *)(v25 + 16) = v26;
                    uint64_t v29 = *(void *)(v9 + 8 * v19);
                    *(void *)(v9 + 8 * v19) = *(void *)(v9 + 8LL * (v17 + v20));
                    *(void *)(v9 + 8LL * (v17 + v20)) = v29;
                  }

                  uint64_t v20 = (v20 + 1);
                }

                while ((_DWORD)v10 != (_DWORD)v20);
              }

              uint64_t v16 = (v16 + 1);
              ++v15;
            }

            while (v18 != v10);
          }
        }
      }
    }
  }

void *getExtendedTypesIndexesForMethod(void *result, uint64_t a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  *a5 = 0;
  uint64_t v6 = (_DWORD *)result[3];
  if (v6)
  {
    if (a3 && a4)
    {
      unint64_t v7 = (a2 - (uint64_t)v6) / (unint64_t)((unsigned __int16)*v6 & 0xFFFC);
LABEL_18:
      *a6 = v7;
      return result;
    }

    LODWORD(v6) = v6[1];
    *a5 = (_DWORD)v6;
  }

  uint64_t v8 = (_DWORD *)result[4];
  if (v8)
  {
    if (a3 && (a4 & 1) == 0) {
      goto LABEL_17;
    }
    LODWORD(v6) = (_DWORD)v6 + v8[1];
    *a5 = (_DWORD)v6;
  }

  uint64_t v8 = (_DWORD *)result[5];
  if (!v8) {
    goto LABEL_14;
  }
  if (a4 && (a3 & 1) == 0)
  {
LABEL_17:
    unint64_t v7 = (a2 - (uint64_t)v8) / (unint64_t)((unsigned __int16)*v8 & 0xFFFC);
    goto LABEL_18;
  }

  LODWORD(v6) = (_DWORD)v6 + v8[1];
  *a5 = (_DWORD)v6;
LABEL_14:
  uint64_t v8 = (_DWORD *)result[6];
  if (!v8) {
    return result;
  }
  if ((a3 & 1) == 0 && (a4 & 1) == 0) {
    goto LABEL_17;
  }
  *a5 = (_DWORD)v6 + v8[1];
  return result;
}

void detach_class(objc_class *a1, char a2)
{
  if (objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( (unint64_t)a1,  &v19))
  {
    unint64_t v7 = (void *)v19;
    if ((*(_BYTE *)(v19 + 16) & 1) != 0) {
      free(*(void **)(v19 + 8));
    }
    *unint64_t v7 = -2LL;
    qword_18C43F840 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F840, (int32x2_t)0x1FFFFFFFFLL);
    objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::compact();
  }

  if ((unint64_t)&a1->isa[-1].isa + 7 < 0xF
    || (uint64_t v8 = (uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL, (*(_DWORD *)v8 & 0x80000000) == 0))
  {
LABEL_9:
    if ((a2 & 1) != 0) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }

  Class isa = a1[1].isa;
  if (isa)
  {
    removeSubclass((uint64_t)isa[4].isa, a1);
    goto LABEL_9;
  }

  ++objc_debug_realized_class_generation_count;
  uint64_t v16 = &_firstRealizedClass;
  int v17 = (objc_class *)_firstRealizedClass;
  if ((objc_class *)_firstRealizedClass != a1)
  {
    do
    {
      uint64_t v18 = (uint64_t)v17[4].isa & 0xF00007FFFFFFFF8LL;
      int v17 = *(objc_class **)(v18 + 0x18);
    }

    while (v17 != a1);
    uint64_t v16 = (uint64_t *)(v18 + 24);
  }

  *uint64_t v16 = *(void *)(v8 + 24);
  if ((a2 & 1) == 0)
  {
LABEL_10:
    unint64_t v10 = objc_class::mangledName(a1, v4, v5, v6);
    unsigned int v11 = _mapStrHash((uint64_t)v10, v10);
    uint64_t v12 = _NXMapMemberWithHash(gdb_objc_realized_classes, (uint64_t)v10, v11, &v19);
    unint64_t v13 = (objc_class *)v19;
    if (v12 == -1) {
      unint64_t v13 = 0LL;
    }
    if (v13 == a1)
    {
      uint64_t v14 = gdb_objc_realized_classes;
      uint64_t v15 = (uint64_t)v10;
    }

    else
    {
      uint64_t v14 = nonMetaClasses();
      uint64_t v15 = (uint64_t)a1->isa & 0xFFFFFFFF8LL;
    }

    NXMapRemove(v14, v15);
  }

void free_class(objc_class *a1)
{
  uint64_t v1 = a1;
  BOOL v2 = (_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL);
  if ((*v2 & 0x80000000) == 0) {
    return;
  }
  unint64_t v3 = (uint64_t *)(*(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8) & ((uint64_t)(*(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8) << 63) >> 63) & 0xFFFFFFFFFFFFFFFELL);
  uint64_t v4 = *(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if ((v4 & 1) != 0) {
    unint64_t v5 = *(void *)v5;
  }
  uint64_t v6 = a1 + 2;
  if (!cache_t::isConstantEmptyCache((cache_t *)&a1[2])
    && ((uint64_t)v6->isa & 1) == 0
    && ((objc_cache *)v6->isa == &_objc_empty_cache || (unint64_t)v6->isa >> 48))
  {
    if (PrintCaches)
    {
      unint64_t v10 = (unint64_t)v6->isa >> 48;
      if (v10)
      {
        unint64_t v10 = (unint64_t)v6->isa >> 48;
        if ((_DWORD)v10)
        {
          unsigned int v11 = v10 + 1;
          unsigned int v12 = -1;
          do
          {
            unsigned int v13 = v12++;
            BOOL v14 = v11 > 3;
            v11 >>= 1;
          }

          while (v14);
          if (v12 > 0xE) {
            goto LABEL_17;
          }
          LODWORD(v10) = v13 + 2;
        }
      }

      --cache_counts[v10];
    }

LABEL_119:
  if ((*(_BYTE *)v5 & 1) == 0)
  {
    int v68 = *(void **)(v5 + 16);
    if (v68)
    {
    }
  }

  unsigned int v69 = *(void **)(v5 + 56);
  if ((HIWORD(v1[3].isa) & 4) == 0)
  {
    unint64_t v70 = (void *)atomic_load((unint64_t *)(v5 + 24));
    if (v70)
    {
      if (malloc_size(v70)) {
        free(v70);
      }
    }
  }

  free(v3);
  free(v2);
  if (malloc_size(v1)) {
    free(v1);
  }
}

uint64_t list_array_tt<property_t,property_list_t,RawPtr>::begin( uint64_t a1, void *a2, const char *a3, char *a4)
{
  BOOL v30 = a2;
  uint64_t v4 = *a2 & 3LL;
  unint64_t v5 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (!v6)
  {
    unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v26 = a2;
LABEL_9:
    uint64_t v27 = 0LL;
    return list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26,  a4);
  }

  if (*a2 > 3uLL)
  {
    if (v4 == 1 && v5 != 0LL)
    {
      unint64_t v31 = (unint64_t)(v5 + 2);
      uint64_t v26 = a2;
      goto LABEL_26;
    }

    if (v4 == 2 && v5 != 0LL)
    {
      if (DisablePreattachedCategories)
      {
        unint64_t v12 = *v5;
        uint64_t v20 = v5[1];
        unint64_t v21 = v20 * (unint64_t)v12;
        if ((v21 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v20,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
        }
        unint64_t v22 = v12 | (v20 << 32);
        uint64_t v23 = (uint64_t)v5 + v21 + 8;
        unint64_t v24 = v12 | ((unint64_t)(v20 - 1) << 32);
        BOOL v25 = (_DWORD)v20 == 0;
        if ((_DWORD)v20) {
          uint64_t v10 = v20;
        }
        else {
          uint64_t v10 = 0LL;
        }
        if ((_DWORD)v20) {
          uint64_t v9 = (unsigned __int16 *)(v23 - v12);
        }
        else {
          uint64_t v9 = (unsigned __int16 *)v23;
        }
        if (v25) {
          unint64_t v11 = v22;
        }
        else {
          unint64_t v11 = v24;
        }
      }

      else
      {
        uint64_t v9 = (unsigned __int16 *)(v5 + 2);
        unint64_t v11 = *v5;
        uint64_t v10 = v5[1];
        unint64_t v12 = v11;
      }

      unint64_t v13 = v10 * (unint64_t)v12;
      if ((v13 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v10,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
      }
      unint64_t v14 = HIDWORD(v11);
      for (i = (unint64_t)v5 + v13 + 8; (unint64_t)v9 < i; unint64_t v14 = (v14 + 1))
      {
        if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v9 + 8) & 1) != 0) {
          break;
        }
        uint64_t v9 = (unsigned __int16 *)((char *)v9 + v11);
      }

      unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v32 = v11 | (v14 << 32);
      uint64_t v33 = v9;
    }
  }

  else
  {
    unint64_t v31 = 0LL;
  }

  uint64_t v26 = a2;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_26:
  if (v4 == 1 && v5)
  {
    uint64_t v27 = (uint64_t)&v5[2 * *v5 + 2];
  }

  else if (v4 == 2 && v5)
  {
    uint64_t v17 = *v5;
    uint64_t v16 = v5[1];
    unint64_t v18 = v16 * (unint64_t)v17;
    if ((v18 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v16, v5, v17);
    }
    uint64_t v27 = (uint64_t)v5;
    uint64_t v28 = v17 | (v16 << 32);
    uint64_t v29 = (uint64_t)v5 + v18 + 8;
  }

  return list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26,  a4);
}

uint64_t list_array_tt<property_t,property_list_t,RawPtr>::end( uint64_t a1, void *a2, const char *a3, char *a4)
{
  uint64_t v5 = *a2 & 3LL;
  BOOL v6 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v5 == 1 && v6 != 0LL)
  {
    v6 += 2 * *v6 + 2;
    uint64_t v17 = a2;
LABEL_15:
    unint64_t v18 = v6;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    return list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
  }

  if (v5 == 2 && v6 != 0LL)
  {
    uint64_t v10 = *v6;
    uint64_t v9 = v6[1];
    unint64_t v11 = v9 * (unint64_t)v10;
    if ((v11 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v9,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v10);
    }
    uint64_t v5 = (uint64_t)v6 + v11 + 8;
    uint64_t v4 = v10 | (v9 << 32);
    uint64_t v17 = a2;
    goto LABEL_18;
  }

  BOOL v6 = 0LL;
  uint64_t v17 = a2;
  if (v5 == 2)
  {
LABEL_18:
    unint64_t v18 = v6;
    uint64_t v19 = v4;
    uint64_t v20 = v5;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    return list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
  }

  if (v5 == 1) {
    goto LABEL_15;
  }
  if (v5)
  {
    unint64_t v13 = a2;
  }

  else
  {
    unint64_t v18 = 0LL;
    unint64_t v13 = a2;
    unint64_t v14 = 0LL;
  }

  return list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13,  a4);
}

uint64_t **list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::operator++( uint64_t **a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = a1[8];
  BOOL v6 = (uint64_t *)((char *)a1[9] + v5);
  a1[9] = v6;
  *((_DWORD *)a1 + 17) = HIDWORD(v5) + 1;
  if (v6 != a1[11]) {
    return a1;
  }
  uint64_t v7 = *a1;
  uint64_t v8 = **a1;
  if ((v8 & 3) == 1)
  {
    ++a1[1];
    uint64_t v8 = *v7;
  }

  else if ((v8 & 3) == 0)
  {
    a1[1] = 0LL;
  }

  if ((v8 & 3) == 2)
  {
    uint64_t v9 = a1[3];
    uint64_t v10 = *((unsigned int *)a1 + 4);
    int v11 = *((_DWORD *)a1 + 5);
    a1[3] = (uint64_t *)((char *)v9 + v10);
    unint64_t v12 = (unsigned int *)a1[1];
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    unint64_t v15 = v13 * (unint64_t)v14;
    *((_DWORD *)a1 + 5) = v11 + 1;
    if ((v15 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v13, v12, v14);
    }
    unint64_t v16 = (unint64_t)v12 + v15 + 8;
    if ((unint64_t)v9 + v10 < v16)
    {
      uint64_t v17 = objc_debug_headerInfoRWs;
      int v18 = v11 + 2;
      do
      {
        a1[3] = (uint64_t *)((char *)v9 + 2 * v10);
        *((_DWORD *)a1 + 5) = v18++;
        uint64_t v9 = (uint64_t *)((char *)v9 + v10);
      }

      while ((unint64_t)v9 + v10 < v16);
    }
  }

  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists(a1);
  unint64_t v22 = *a1;
  uint64_t v23 = **a1 & 3;
  if (*a1 == a1[4])
  {
    if (v23 != 2)
    {
      if (v23 != 1)
      {
        if (!v23)
        {
          unint64_t v24 = (unsigned int *)a1[1];
          goto LABEL_29;
        }

uint64_t entsize_list_tt<property_t,property_list_t,0u,PointerModifierNop>::end( unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  return v5 | (v4 << 32);
}

uint64_t list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  unint64_t v6 = *v5 & 3LL;
  if (v6 == 2)
  {
    __int128 v7 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v7;
  }

  else if (v6 <= 1)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
  }

  uint64_t v8 = *(void **)a3;
  *(void *)(a1 + 32) = *(void *)a3;
  unint64_t v9 = *v8 & 3LL;
  if (v9 == 2)
  {
    __int128 v10 = *(_OWORD *)(a3 + 8);
    *(void *)(a1 + 56) = *(void *)(a3 + 24);
    *(_OWORD *)(a1 + 40) = v10;
  }

  else if (v9 <= 1)
  {
    *(void *)(a1 + 40) = *(void *)(a3 + 8);
  }

  uint64_t v11 = **(void **)a2 & 3LL;
  if (*(void *)a2 == *(void *)a3)
  {
    if (v11 != 2)
    {
      if (v11 != 1)
      {
        if (!v11)
        {
          unint64_t v12 = *(unsigned int **)(a2 + 8);
          goto LABEL_26;
        }

        goto LABEL_19;
      }

      uint64_t v14 = *(unsigned int ***)(a2 + 8);
LABEL_25:
      unint64_t v12 = *v14;
      goto LABEL_26;
    }

    uint64_t v13 = *(uint64_t **)(a2 + 24);
LABEL_23:
    unint64_t v12 = (unsigned int *)((char *)v13 + (*v13 >> 16));
    goto LABEL_26;
  }

  if (v11 == 2)
  {
    uint64_t v13 = *(uint64_t **)(a2 + 24);
    goto LABEL_23;
  }

  if (v11 == 1)
  {
    uint64_t v14 = *(unsigned int ***)(a2 + 8);
    goto LABEL_25;
  }

  if (v11)
  {
LABEL_19:
    unint64_t v12 = 0LL;
    goto LABEL_26;
  }

  unint64_t v12 = *(unsigned int **)(a2 + 8);
LABEL_26:
  *(void *)(a1 + 64) = *v12;
  *(void *)(a1 + 72) = v12 + 2;
  uint64_t v15 = **(void **)a2 & 3LL;
  if (v15 == 2)
  {
    unint64_t v16 = (unsigned int *)(*(void *)(a2 + 24) + (**(uint64_t **)(a2 + 24) >> 16));
  }

  else if (v15 == 1)
  {
    unint64_t v16 = **(unsigned int ***)(a2 + 8);
  }

  else if (v15)
  {
    unint64_t v16 = 0LL;
  }

  else
  {
    unint64_t v16 = *(unsigned int **)(a2 + 8);
  }

  *(void *)(a1 + 80) = entsize_list_tt<property_t,property_list_t,0u,PointerModifierNop>::end( v16,  a2,  (const char *)a3,  a4);
  *(void *)(a1 + 88) = v17;
LABEL_34:
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists((uint64_t **)a1);
  return a1;
}

uint64_t removeSubclass(uint64_t result, objc_class *a2)
{
  BOOL v2 = (void *)((result & 0xF00007FFFFFFFF8LL) + 16);
  unint64_t v3 = *(objc_class **)((result & 0xF00007FFFFFFFF8LL) + 0x10);
  if (v3) {
    BOOL v4 = v3 == a2;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    do
    {
      uint64_t v5 = (uint64_t)v3[4].isa & 0xF00007FFFFFFFF8LL;
      unint64_t v3 = *(objc_class **)(v5 + 0x18);
      if (v3) {
        BOOL v6 = v3 == a2;
      }
      else {
        BOOL v6 = 1;
      }
    }

    while (!v6);
    BOOL v2 = (void *)(v5 + 24);
  }

  *BOOL v2 = *(void *)(((uint64_t)a2[4].isa & 0xF00007FFFFFFFF8LL) + 0x18);
  return result;
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  if (!m) {
    return 0LL;
  }
  int v2 = m & 3;
  if (v2 == 2 || v2 == 1) {
    return (objc_method_description *)method_t::getCachedDescription((unint64_t)m);
  }
  return v1;
}

IMP method_getImplementation(IMP m)
{
  if (m) {
    return (IMP)method_t::imp((unint64_t)m, 1);
  }
  return m;
}

unint64_t _method_getImplementationAndName(unint64_t a1)
{
  return method_t::imp(a1, 1);
}

SEL method_getName(SEL m)
{
  if (m)
  {
    int v1 = m & 3;
    if ((m & 3) == 0 || v1 == 2)
    {
      return *(SEL *)((unint64_t)m & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v1 == 1)
    {
      int v2 = (int *)((unint64_t)m & 0xFFFFFFFFFFFFFFFCLL);
      if (dataSegmentsRanges > ((unint64_t)m & 0xFFFFFFFFFFFFFFFCLL)
        || *(void *)algn_18C43FCB8 <= (unint64_t)v2)
      {
        return *(SEL *)((char *)v2 + *v2);
      }

      else
      {
        return (char *)&unk_18E7BB5A8 + *v2;
      }
    }
  }

  return m;
}

const char *__cdecl method_getTypeEncoding(const char *m)
{
  if (m) {
    return (const char *)method_t::types((unint64_t)m, v1);
  }
  return m;
}

IMP method_setImplementation(Method m, IMP imp)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  __int128 v7 = (id (*)(id, SEL, ...))_method_setImplementation(0LL, (uint64_t)m, (void (*)(void))imp);
  int v8 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v9 = __ldxr(runtimeLock);
    if (v9 != v8) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_18002E1B0(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void _method_setImplementationRawUnsafe(method_t *this, void (*a2)(void))
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  method_t::setImp((uint64_t)this, a2);
  int v7 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v8 = __ldxr(runtimeLock);
    if (v8 != v7) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18002E288(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  if (m1 && m2)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v7 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v7, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    unsigned int v9 = (void (*)(void))method_t::imp((unint64_t)m1, 0);
    __int128 v10 = (void (*)(void))method_t::imp((unint64_t)m2, 0);
    int v11 = m1 & 3;
    if ((m1 & 3) == 0 || v11 == 2)
    {
      uint64_t v2 = *(char **)((unint64_t)m1 & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v11 == 1)
    {
      unint64_t v12 = (int *)((unint64_t)m1 & 0xFFFFFFFFFFFFFFFCLL);
      if (dataSegmentsRanges > ((unint64_t)m1 & 0xFFFFFFFFFFFFFFFCLL)
        || *(void *)algn_18C43FCB8 <= (unint64_t)v12)
      {
        uint64_t v2 = *(char **)((char *)v12 + *v12);
      }

      else
      {
        uint64_t v2 = (char *)&unk_18E7BB5A8 + *v12;
      }
    }

    int v13 = m2 & 3;
    if ((m2 & 3) == 0 || v13 == 2)
    {
      unint64_t v3 = *(char **)((unint64_t)m2 & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v13 == 1)
    {
      uint64_t v14 = (int *)((unint64_t)m2 & 0xFFFFFFFFFFFFFFFCLL);
      if (dataSegmentsRanges > ((unint64_t)m2 & 0xFFFFFFFFFFFFFFFCLL)
        || *(void *)algn_18C43FCB8 <= (unint64_t)v14)
      {
        unint64_t v3 = *(char **)((char *)v14 + *v14);
      }

      else
      {
        unint64_t v3 = (char *)&unk_18E7BB5A8 + *v14;
      }
    }

    method_t::setImp((uint64_t)m1, v10);
    method_t::setImp((uint64_t)m2, v9);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3321888768LL;
    v22[2] = __method_exchangeImplementations_block_invoke;
    v22[3] = &__block_descriptor_64_e8_32c43_ZTSKZ30method_exchangeImplementationsE3__0_e8_B16__0_8l;
    v22[4] = v2;
    v22[5] = v3;
    v22[6] = v9;
    v22[7] = v10;
    flushCaches(0LL, (uint64_t)"method_exchangeImplementations", (const char *)v22, v15);
    objc::Scanner::scanChangedMethod(0LL, (unint64_t)m1, v16, v17);
    objc::Scanner::scanChangedMethod(0LL, (unint64_t)m2, v18, v19);
    int v20 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v21 = __ldxr(runtimeLock);
      if (v21 != v20) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_18002E4C4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL __method_exchangeImplementations_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
}

__n128 __copy_helper_block_e8_32c43_ZTSKZ30method_exchangeImplementationsE3__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

ptrdiff_t ivar_getOffset(ptrdiff_t v)
{
  if (v) {
    return **(int **)v;
  }
  return v;
}

const char *__cdecl ivar_getName(const char *v)
{
  if (v) {
    return (const char *)*((void *)v + 1);
  }
  return v;
}

const char *__cdecl ivar_getTypeEncoding(const char *v)
{
  if (v) {
    return (const char *)*((void *)v + 2);
  }
  return v;
}

const char *__cdecl property_getName(objc_property_t property)
{
  return *(const char **)property;
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)*((void *)property + 1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  if (!property)
  {
    unsigned int v7 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v7;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  unsigned int v8 = (const char *)*((void *)property + 1);
  if (!v8)
  {
    unsigned int v7 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    goto LABEL_22;
  }

  unsigned int v9 = 1;
  for (unint64_t i = (_BYTE *)*((void *)property + 1); *i == 44; ++i)
  {
    ++v9;
LABEL_15:
    ;
  }

  if (*i) {
    goto LABEL_15;
  }
  size_t v11 = strlen(v8);
  unsigned int v7 = (objc_property_attribute_t *)calloc(2 * v9 + 16LL * v9 + v11 + 16, 1uLL);
  uint64_t v17 = (uint64_t)&v7[v9 + 1];
  int v18 = v7;
  unsigned int v12 = iteratePropertyAttributes( v8,  (uint64_t (*)(uint64_t, void *, void *, const char *, int64_t, uint64_t, const char *))copyOneAttribute,  &v18,  &v17);
  unsigned int v13 = v12;
  if (!v12)
  {
    free(v7);
    unsigned int v7 = 0LL;
  }

  if (outCount) {
    *outCount = v13;
  }
LABEL_22:
  int v14 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v15 = __ldxr(runtimeLock);
    if (v15 != v14) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_18002E6F8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  uint64_t v2 = 0LL;
  if (property && attributeName)
  {
    if (*attributeName)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v6 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v6, runtimeLock)) {
          goto LABEL_10;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_10:
      unsigned int v8 = (const char *)*((void *)property + 1);
      unsigned int v12 = 0LL;
      iteratePropertyAttributes( v8,  (uint64_t (*)(uint64_t, void *, void *, const char *, int64_t, uint64_t, const char *))findOneAttribute,  (void *)attributeName,  &v12);
      uint64_t v2 = v12;
      int v9 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v10 = __ldxr(runtimeLock);
        if (v10 != v9) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          return v2;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

void sub_18002E80C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t protocol_getMethod(protocol_t *a1, objc_selector *a2, const char *a3, char *a4, BOOL a5)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v10 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v10, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (fixed_up_protocol) {
    int v13 = -1073741824;
  }
  else {
    int v13 = 0x40000000;
  }
  if ((*((_DWORD *)a1 + 17) & 0xC0000000) != v13) {
    fixupProtocol(a1);
  }
  unint64_t Method_nolock = protocol_getMethod_nolock(a1, a2, a3, a4, a5);
  int v14 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v15 = __ldxr(runtimeLock);
    if (v15 != v14) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return Method_nolock;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return Method_nolock;
}

void sub_18002E934(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t protocol_getMethod_nolock( protocol_t *a1, objc_selector *a2, const char *a3, char *a4, BOOL a5)
{
  unint64_t result = 0LL;
  if (a1 && a2)
  {
    BOOL v8 = (char)a4;
    BOOL v9 = (char)a3;
    unsigned int v10 = (unsigned int **)((char *)a1 + 48);
    if ((_DWORD)a4) {
      unsigned int v10 = (unsigned int **)((char *)a1 + 40);
    }
    size_t v11 = (unsigned int **)((char *)a1 + 32);
    if ((_DWORD)a4) {
      size_t v11 = (unsigned int **)((char *)a1 + 24);
    }
    if ((_DWORD)a3) {
      unsigned int v10 = v11;
    }
    if (!*v10 || (unint64_t result = getMethodFromListArray<method_list_t **>(*v10, a2, a3, a4)) == 0)
    {
      unsigned int v12 = (void *)*((void *)a1 + 2);
      if (v12 && *v12)
      {
        uint64_t v13 = 0LL;
        unsigned int v14 = 1;
        while (1)
        {
          uint64_t v15 = v12[v13 + 1];
          int v16 = canonical_protocol ? 0 : 0x20000000;
          if ((v16 & *(_DWORD *)(v15 + 68)) == 0)
          {
            uint64_t Protocol = getProtocol(*(const char **)(v15 + 8));
            if (Protocol) {
              uint64_t v15 = Protocol;
            }
          }

          unint64_t result = protocol_getMethod_nolock((protocol_t *)v15, a2, v9, v8, a5);
          if (result) {
            break;
          }
          uint64_t v13 = v14;
          unsigned int v12 = (void *)*((void *)a1 + 2);
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t protocol_getMethodTypeEncoding_nolock(uint64_t result, objc_selector *a2, const char *a3, char *a4)
{
  if (result)
  {
    int v4 = (int)a4;
    int v5 = (int)a3;
    unsigned int v7 = (void *)result;
    BOOL v8 = (unsigned int **)(result + 48);
    if ((_DWORD)a4) {
      BOOL v8 = (unsigned int **)(result + 40);
    }
    BOOL v9 = (unsigned int **)(result + 32);
    if ((_DWORD)a4) {
      BOOL v9 = (unsigned int **)(result + 24);
    }
    if ((_DWORD)a3) {
      BOOL v8 = v9;
    }
    if (*v8 && (unint64_t MethodFromList = getMethodFromListArray<method_list_t **>(*v8, a2, a3, a4)) != 0)
    {
      getExtendedTypesIndexesForMethod(v7, MethodFromList, v5, v4, &v17, &v16);
      return *(void *)(v7[9] + 8LL * (v16 + v17));
    }

    else
    {
LABEL_14:
      size_t v11 = (unint64_t *)v7[2];
      if (v11 && *v11)
      {
        unint64_t v12 = 0LL;
        while (1)
        {
          uint64_t v13 = v11[v12 + 1];
          int v14 = canonical_protocol ? 0 : 0x20000000;
          if ((v14 & *(_DWORD *)(v13 + 68)) == 0)
          {
            uint64_t Protocol = getProtocol(*(const char **)(v13 + 8));
            if (Protocol) {
              uint64_t v13 = Protocol;
            }
          }

          unint64_t result = protocol_getMethodTypeEncoding_nolock((protocol_t *)v13, a2, v5, v4);
          if (result) {
            break;
          }
          ++v12;
          size_t v11 = (unint64_t *)v7[2];
          if (v12 >= *v11) {
            return 0LL;
          }
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t _protocol_getMethodTypeEncoding(protocol_t *a1, objc_selector *a2, const char *a3, char *a4)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (fixed_up_protocol) {
    int v12 = -1073741824;
  }
  else {
    int v12 = 0x40000000;
  }
  if ((*((_DWORD *)a1 + 17) & 0xC0000000) != v12) {
    fixupProtocol(a1);
  }
  uint64_t MethodTypeEncoding_nolock = protocol_getMethodTypeEncoding_nolock((uint64_t)a1, a2, a3, a4);
  int v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(runtimeLock);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return MethodTypeEncoding_nolock;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return MethodTypeEncoding_nolock;
}

void sub_18002ECBC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  if (p) {
    return (const char *)protocol_t::demangledName((char **)p);
  }
  else {
    return "nil";
  }
}

objc_method_description protocol_getMethodDescription( Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  unint64_t Method = protocol_getMethod( (protocol_t *)p,  (objc_selector *)aSel,  (const char *)isRequiredMethod,  (char *)isInstanceMethod,  v4);
  if (Method)
  {
    unint64_t v7 = Method & 3;
    if ((Method & 3) == 0 || (_DWORD)v7 == 2)
    {
      unint64_t v7 = Method & 0xFFFFFFFFFFFFFFFCLL;
      unsigned int v5 = *(const char **)(Method & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if ((_DWORD)v7 == 1)
    {
      unint64_t v7 = Method & 0xFFFFFFFFFFFFFFFCLL;
      if (dataSegmentsRanges > (Method & 0xFFFFFFFFFFFFFFFCLL) || *(void *)algn_18C43FCB8 <= v7)
      {
        unsigned int v5 = *(const char **)(v7 + *(int *)v7);
      }

      else
      {
        unint64_t v7 = *(int *)v7;
        unsigned int v5 = (char *)&unk_18E7BB5A8 + v7;
      }
    }

    BOOL v8 = (char *)method_t::types(Method, v7);
  }

  else
  {
    unsigned int v5 = 0LL;
    BOOL v8 = 0LL;
  }

  unsigned int v9 = v5;
  result.types = v8;
  result.name = v9;
  return result;
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  char v7 = protocol_conformsToProtocol_nolock((protocol_t *)proto, (const char **)other);
  int v8 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v9 = __ldxr(runtimeLock);
    if (v9 != v8) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_18002EE40(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t protocol_conformsToProtocol_nolock(protocol_t *a1, const char **a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (strcmp(*((const char **)a1 + 1), a2[1]))
    {
      unsigned int v5 = (unint64_t *)*((void *)a1 + 2);
      if (!v5 || !*v5) {
        return 0LL;
      }
      unint64_t v6 = 0LL;
      while (1)
      {
        uint64_t v7 = v5[v6 + 1];
        int v8 = canonical_protocol ? 0 : 0x20000000;
        if ((v8 & *(_DWORD *)(v7 + 68)) == 0)
        {
          uint64_t Protocol = getProtocol(*(const char **)(v7 + 8));
          if (Protocol) {
            uint64_t v7 = Protocol;
          }
        }

        if ((const char **)v7 == a2
          || !strcmp(a2[1], *(const char **)(v7 + 8))
          || protocol_conformsToProtocol_nolock((protocol_t *)v7, (protocol_t *)a2))
        {
          break;
        }

        ++v6;
        unsigned int v5 = (unint64_t *)*((void *)a1 + 2);
        if (v6 >= *v5) {
          return 0LL;
        }
      }
    }

    return 1LL;
  }

  return result;
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  if (proto == other)
  {
    LOBYTE(proto) = 1;
  }

  else
  {
    uint64_t v2 = proto;
    LOBYTE(proto) = 0;
    if (v2)
    {
      if (other)
      {
        LODWORD(proto) = protocol_conformsToProtocol(v2, other);
        if ((_DWORD)proto) {
          LOBYTE(proto) = protocol_conformsToProtocol(other, v2);
        }
      }
    }
  }

  return (char)proto;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList( Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  int v4 = outCount;
  if (!p)
  {
    size_t v11 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v11;
  }

  BOOL v5 = isInstanceMethod;
  BOOL v6 = isRequiredMethod;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  if (fixed_up_protocol) {
    int v12 = -1073741824;
  }
  else {
    int v12 = 0x40000000;
  }
  if ((HIDWORD(p[8].super.isa) & 0xC0000000) != v12) {
    fixupProtocol((protocol_t *)p);
  }
  int v13 = p + 6;
  if (v5) {
    int v13 = p + 5;
  }
  unsigned int v14 = p + 4;
  if (v5) {
    unsigned int v14 = p + 3;
  }
  if (v6) {
    int v13 = v14;
  }
  Class isa = (int *)v13->super.isa;
  if (!v13->super.isa)
  {
    size_t v11 = 0LL;
    if (!v4) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  size_t v11 = (objc_method_description *)calloc((isa[1] + 1), 0x10uLL);
  unint64_t v16 = *isa;
  entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd(isa, v17, v18, v19);
  uint64_t v21 = v20;
  unint64_t v22 = (unint64_t)(isa + 2) & 0xFFFFFFFFFFFFFFFCLL | (v16 >> 31);
  if (v22 == v20)
  {
    LODWORD(isa) = 0;
    if (!v4) {
      goto LABEL_37;
    }
LABEL_36:
    *int v4 = isa;
    goto LABEL_37;
  }

  uint64_t v36 = v4;
  unint64_t v37 = StatusReg;
  uint64_t v23 = 0LL;
  LODWORD(isa) = 0;
  uint64_t v24 = (unsigned __int16)v16 & 0xFFFC;
  BOOL v25 = &dataSegmentsRanges;
  unint64_t v27 = dataSegmentsRanges;
  unint64_t v26 = *(void *)algn_18C43FCB8;
  do
  {
    unint64_t v28 = v22 + v23;
    int v29 = (v22 + v23) & 3;
    if (!v29 || v29 == 2)
    {
      BOOL v25 = *(uint64_t **)(v28 & 0xFFFFFFFFFFFFFFFCLL);
    }

    else if (v29 == 1)
    {
      unint64_t v30 = v28 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v31 = *(int *)(v28 & 0xFFFFFFFFFFFFFFFCLL);
      if (v27 > (v28 & 0xFFFFFFFFFFFFFFFCLL) || v26 <= v30) {
        BOOL v25 = *(uint64_t **)(v30 + v31);
      }
      else {
        BOOL v25 = (uint64_t *)((char *)&unk_18E7BB5A8 + v31);
      }
    }

    p_name = &v11[isa].name;
    void *p_name = v25;
    p_name[1] = method_t::types(v28, (uint64_t)v25);
    LODWORD(isa) = (_DWORD)isa + 1;
    v23 += v24;
    BOOL v25 = (uint64_t *)(v22 + v23);
  }

  while (v22 + v23 != v21);
  int v4 = v36;
  unint64_t StatusReg = v37;
  if (v36) {
    goto LABEL_36;
  }
LABEL_37:
  int v33 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v34 = __ldxr(runtimeLock);
    if (v34 != v33) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v11;
}

void sub_18002F1D8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_property_t protocol_getProperty( Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  Property_nolock = 0LL;
  if (proto && name)
  {
    BOOL v6 = isInstanceProperty;
    BOOL v7 = isRequiredProperty;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v10 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v10, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    Property_nolock = protocol_getProperty_nolock((protocol_t *)proto, name, (const char *)v7, (char *)v6);
    int v12 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v13 = __ldxr(runtimeLock);
      if (v13 != v12) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return (objc_property_t)Property_nolock;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  return (objc_property_t)Property_nolock;
}

void sub_18002F2E4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

const char **protocol_getProperty_nolock(protocol_t *a1, const char *a2, const char *a3, char *a4)
{
  if (!(_DWORD)a3) {
    return 0LL;
  }
  BOOL v4 = (char)a4;
  if ((_DWORD)a4)
  {
    BOOL v7 = (unsigned int **)((char *)a1 + 56);
  }

  else
  {
    BOOL v7 = (unsigned int **)((char *)a1 + 88);
  }

  int v8 = *v7;
  if (!*v7
    || (unsigned int v9 = (const char **)(v8 + 2),
        uint64_t v10 = *v8,
        entsize_list_tt<property_t,property_list_t,0u,PointerModifierNop>::end(v8, (uint64_t)a2, a3, a4),
        v9 == v11))
  {
LABEL_10:
    unsigned int v13 = (unint64_t *)*((void *)a1 + 2);
    if (v13 && *v13)
    {
      unint64_t v14 = 0LL;
      while (1)
      {
        uint64_t v15 = v13[v14 + 1];
        int v16 = canonical_protocol ? 0 : 0x20000000;
        if ((v16 & *(_DWORD *)(v15 + 68)) == 0)
        {
          uint64_t Protocol = getProtocol(*(const char **)(v15 + 8));
          if (Protocol) {
            uint64_t v15 = Protocol;
          }
        }

        uint64_t Property_nolock = protocol_getProperty_nolock((protocol_t *)v15, a2, 1, v4);
        if (Property_nolock) {
          break;
        }
        ++v14;
        unsigned int v13 = (unint64_t *)*((void *)a1 + 2);
        if (v14 >= *v13) {
          return 0LL;
        }
      }

      return (const char **)Property_nolock;
    }

    return 0LL;
  }

  int v12 = v11;
  while (strcmp(a2, *v9))
  {
    unsigned int v9 = (const char **)((char *)v9 + v10);
    if (v9 == v12) {
      goto LABEL_10;
    }
  }

  return v9;
}

objc_property_t *__cdecl protocol_copyPropertyList2( Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  if (!proto || !isRequiredProperty)
  {
    size_t v11 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v11;
  }

  BOOL v5 = isInstanceProperty;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v8, runtimeLock))
    {
      if (isInstanceProperty) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v10 = proto + 11;
      goto LABEL_18;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
  if (!v5) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v10 = proto + 7;
LABEL_12:
  Class isa = (unsigned int *)v10->super.isa;
  if (!v10->super.isa)
  {
LABEL_18:
    unsigned int v13 = 0;
LABEL_19:
    size_t v11 = 0LL;
    if (!outCount) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  unsigned int v13 = isa[1];
  if (!v13) {
    goto LABEL_19;
  }
  size_t v11 = (objc_property_t *)malloc(8LL * (v13 + 1));
  unint64_t v14 = (objc_property *)(isa + 2);
  uint64_t v15 = *isa;
  entsize_list_tt<property_t,property_list_t,0u,PointerModifierNop>::end(isa, v16, v17, v18);
  if (isa + 2 == v19)
  {
    unsigned int v13 = 0;
  }

  else
  {
    int v20 = 0;
    do
    {
      unsigned int v13 = v20 + 1;
      v11[v20] = v14;
      unint64_t v14 = (objc_property *)((char *)v14 + v15);
      ++v20;
    }

    while (v14 != (objc_property *)v19);
  }

  v11[v13] = 0LL;
  if (outCount) {
LABEL_20:
  }
    *outCount = v13;
LABEL_21:
  int v21 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v22 = __ldxr(runtimeLock);
    if (v22 != v21) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v11;
}

void sub_18002F594(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return protocol_copyPropertyList2(proto, outCount, 1, 1);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  if (!proto)
  {
    BOOL v7 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v7;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  Class isa = proto[2].super.isa;
  if (!isa)
  {
    LODWORD(v9) = 0;
LABEL_22:
    BOOL v7 = 0LL;
    if (!outCount) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  Class v9 = isa->isa;
  unint64_t v17 = StatusReg;
  BOOL v7 = (Protocol **)malloc((8LL * (void)v9 + 8) & 0x7FFFFFFF8LL);
  uint64_t v10 = 0LL;
  do
  {
    Class v11 = proto[2].super.isa[v10 + 1].isa;
    if (canonical_protocol) {
      int v12 = 0;
    }
    else {
      int v12 = 0x20000000;
    }
    if ((v12 & HIDWORD(v11[8].isa)) == 0)
    {
      uint64_t Protocol = getProtocol((const char *)v11[1].isa);
      if (Protocol) {
        Class v11 = (Class)Protocol;
      }
    }

    v7[v10++] = (Protocol *)v11;
  }

  while (v9 != v10);
  unint64_t StatusReg = v17;
  v7[v9] = 0LL;
  if (outCount) {
LABEL_23:
  }
    *outCount = v9;
LABEL_24:
  int v14 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v15 = __ldxr(runtimeLock);
    if (v15 != v14) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_18002F740( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  int v12 = *(_DWORD *)(a10 + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(v10);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, v10)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (!getProtocol(name))
  {
    BOOL v6 = (Protocol *)calloc(0x60uLL, 1uLL);
    unsigned int v5 = v6;
    if (DisableNonpointerIsa || (HIWORD(OBJC_CLASS_____IncompleteProtocol.vtable) & 0x2000) != 0)
    {
      if (((unint64_t)&OBJC_CLASS_____IncompleteProtocol & 0xFFFFFFF000000007LL) == 0)
      {
        unint64_t v10 = (unint64_t)&OBJC_CLASS_____IncompleteProtocol & 0xFFFFFFFF8LL;
        goto LABEL_14;
      }
    }

    else if (((unint64_t)&OBJC_CLASS_____IncompleteProtocol & 0xFFFFFFF000000007LL) == 0)
    {
      unint64_t v10 = (unint64_t)&OBJC_CLASS_____IncompleteProtocol & 0xFFFFFFFF8LL | 0x21A000000001LL;
LABEL_14:
      v6->super.Class isa = (Class)v10;
      LODWORD(v6[8].super.isa) = 96;
      size_t v11 = strlen(name) + 1;
      if ((_dyld_is_memory_immutable() & 1) == 0)
      {
        int v12 = malloc(v11);
        memcpy(v12, name, v11);
        name = (const char *)v12;
      }

      v5[1].super.Class isa = (Class)name;
      goto LABEL_17;
    }

    _objc_fatal( "Invalid class pointer %p has bits set outside of ISA_MASK",  v7,  v8,  v9,  &OBJC_CLASS_____IncompleteProtocol);
  }

  unsigned int v5 = 0LL;
LABEL_17:
  int v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(runtimeLock);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v5;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v5;
}

void sub_18002F8E8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void objc_registerProtocol(Protocol *proto)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v7 = (__objc2_class *)((uint64_t)proto->super.isa & 0xFFFFFFFF8LL);
  if (v7 == &OBJC_CLASS___Protocol)
  {
    protocol_t::demangledName((char **)proto);
    _objc_inform("objc_registerProtocol: protocol '%s' was already registered!");
  }

  else if (v7 == &OBJC_CLASS_____IncompleteProtocol)
  {
    objc_object::changeIsa((objc_object *)proto, (uint64_t)&OBJC_CLASS___Protocol, v1, v2);
    if (!getProtocol((const char *)proto[1].super.isa))
    {
      unint64_t v10 = (uint64_t (***)(void))protocols();
      NXMapKeyCopyingInsert(v10, (const char *)proto[1].super.isa, (uint64_t)proto);
    }
  }

  else
  {
    protocol_t::demangledName((char **)proto);
    _objc_inform("objc_registerProtocol: protocol '%s' was not allocated with objc_allocateProtocol!");
  }

  int v8 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v9 = __ldxr(runtimeLock);
    if (v9 != v8) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18002FA4C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
  if (proto && addition)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v5, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    if ((__objc2_class *)((uint64_t)proto->super.isa & 0xFFFFFFFF8LL) == &OBJC_CLASS_____IncompleteProtocol)
    {
      if ((__objc2_class *)((uint64_t)addition->super.isa & 0xFFFFFFFF8LL) == &OBJC_CLASS_____IncompleteProtocol)
      {
        protocol_t::demangledName((char **)addition);
        _objc_inform("protocol_addProtocol: added protocol '%s' is still under construction!");
      }

      else
      {
        Class isa = proto[2].super.isa;
        if (isa) {
          int v8 = (objc_class *)realloc(isa, 8 * (uint64_t)isa->isa + 16);
        }
        else {
          int v8 = (objc_class *)calloc(1uLL, 0x10uLL);
        }
        Class v9 = v8->isa++;
        v8[(void)v9 + 1].Class isa = (Class)addition;
        proto[2].super.Class isa = v8;
      }
    }

    else
    {
      protocol_t::demangledName((char **)proto);
      _objc_inform("protocol_addProtocol: modified protocol '%s' is not under construction!");
    }

    int v10 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v11 = __ldxr(runtimeLock);
      if (v11 != v10) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_18002FBC8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void protocol_addMethodDescription( Protocol *proto, SEL name, const char *types, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  if (proto)
  {
    BOOL v6 = isRequiredMethod;
    uint64_t v7 = types;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v11 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v11, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    if ((__objc2_class *)((uint64_t)proto->super.isa & 0xFFFFFFFF8LL) == &OBJC_CLASS_____IncompleteProtocol)
    {
      if (!v6 || !isInstanceMethod)
      {
        if (!isInstanceMethod || v6) {
          unsigned int v15 = proto + 6;
        }
        else {
          unsigned int v15 = proto + 5;
        }
        if (!v6 || isInstanceMethod) {
          unsigned int v14 = v15;
        }
        else {
          unsigned int v14 = proto + 4;
        }
      }

      else
      {
        unsigned int v14 = proto + 3;
      }

      Class isa = v14->super.isa;
      if (v14->super.isa)
      {
        uint64_t v17 = *isa & 0xFFFCLL;
        unint64_t v18 = isa[1] * (unint64_t)v17;
        if ((v18 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: count %u with entsize %u",  (uint64_t)name,  types,  (char *)isRequiredMethod,  isa[1],  v17);
        }
        uint64_t v19 = (objc_class *)realloc(isa, v17 + v18 + 8);
        v14->super.Class isa = v19;
        uint64_t v23 = (unsigned __int16)LODWORD(v19->isa) & 0xFFFC;
      }

      else
      {
        uint64_t v19 = (objc_class *)calloc(0x20uLL, 1uLL);
        v14->super.Class isa = v19;
        uint64_t v23 = 24LL;
        LODWORD(v19->isa) = 24;
      }

      uint64_t isa_high = HIDWORD(v19->isa);
      HIDWORD(v19->isa) = isa_high + 1;
      unint64_t v25 = isa_high * (unint64_t)v23;
      if ((v25 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v20, v21, v22, isa_high, v19, v23);
      }
      unint64_t v26 = (void *)(((unint64_t)&v19[1] + v25) & 0xFFFFFFFFFFFFFFFCLL);
      *unint64_t v26 = name;
      if (v7)
      {
        size_t v27 = strlen(v7) + 1;
        if ((_dyld_is_memory_immutable() & 1) == 0)
        {
          unint64_t v28 = malloc(v27);
          memcpy(v28, v7, v27);
          uint64_t v7 = (const char *)v28;
        }
      }

      else
      {
        uint64_t v7 = "";
      }

      v26[1] = v7;
      v26[2] = 0LL;
    }

    else
    {
      int v13 = (const char *)protocol_t::demangledName((char **)proto);
      _objc_inform("protocol_addMethodDescription: protocol '%s' is not under construction!", v13);
    }

    int v29 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v30 = __ldxr(runtimeLock);
      if (v30 != v29) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_18002FE2C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void protocol_addProperty( Protocol *proto, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  if (!proto) {
    return;
  }
  BOOL v6 = name;
  if (!name) {
    return;
  }
  BOOL v7 = isInstanceProperty;
  BOOL v8 = isRequiredProperty;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v13 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v13, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if ((__objc2_class *)((uint64_t)proto->super.isa & 0xFFFFFFFF8LL) != &OBJC_CLASS_____IncompleteProtocol)
  {
    unsigned int v15 = (const char *)protocol_t::demangledName((char **)proto);
    _objc_inform("protocol_addProperty: protocol '%s' is not under construction!", v15);
    goto LABEL_24;
  }

  if (v8 && v7)
  {
    uint64_t v16 = proto + 7;
  }

  else
  {
    if (!v8 || v7) {
      goto LABEL_24;
    }
    uint64_t v16 = proto + 11;
  }

  Class isa = (unsigned int *)v16->super.isa;
  if (v16->super.isa)
  {
    uint64_t v18 = *isa;
    uint64_t v19 = isa[1] + 1;
    isa[1] = v19;
    unint64_t v20 = v18 * (unint64_t)v19;
    if ((v20 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: count %u with entsize %u",  (uint64_t)name,  (const char *)attributes,  *(char **)&attributeCount,  v19,  v18);
    }
    uint64_t v24 = (objc_class *)realloc(isa, v20 + 8LL);
    v16->super.Class isa = v24;
    uint64_t isa_low = LODWORD(v24->isa);
    uint64_t v26 = (HIDWORD(v24->isa) - 1);
  }

  else
  {
    uint64_t v24 = (objc_class *)calloc(0x18uLL, 1uLL);
    uint64_t v26 = 0LL;
    v16->super.Class isa = v24;
    v24->Class isa = (Class)0x100000010LL;
    uint64_t isa_low = 16LL;
  }

  unint64_t v27 = v26 * (unint64_t)isa_low;
  if ((v27 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v21, v22, v23, v26, v24, isa_low);
  }
  size_t v28 = strlen(v6) + 1;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    int v29 = malloc(v28);
    memcpy(v29, v6, v28);
    BOOL v6 = (const char *)v29;
  }

  unsigned int v30 = (char *)v24 + v27;
  *((void *)v30 + 1) = v6;
  *((void *)v30 + 2) = copyPropertyAttributeString((uint64_t)attributes, attributeCount);
LABEL_24:
  int v31 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v32 = __ldxr(runtimeLock);
    if (v32 != v31) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_180030080(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t _objc_getRealizedClassList_trylock(objc_class **a1, uint64_t a2)
{
  if (!os_unfair_lock_trylock((os_unfair_lock_t)runtimeLock)) {
    return -1LL;
  }
  uint64_t RealizedClassList_nolock = objc_getRealizedClassList_nolock(a1, a2, v4, v5);
  int v7 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v8 = __ldxr(runtimeLock);
    if (v8 != v7) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return RealizedClassList_nolock;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return RealizedClassList_nolock;
}

uint64_t objc_getRealizedClassList_nolock(objc_class **a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v9 = 0LL;
  if (a1)
  {
    uint64_t v8 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3321888768LL;
    v7[2] = ___ZL32objc_getRealizedClassList_nolockPP10objc_classm_block_invoke;
    v7[3] = &__block_descriptor_64_e8_32c61_ZTSKZL32objc_getRealizedClassList_nolockPP10objc_classmE3__0_e8_B16__0_8l;
    v7[4] = &v9;
    v7[5] = &v8;
    v7[6] = a2;
    v7[7] = a1;
    int v4 = v7;
  }

  else
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3321888768LL;
    v6[2] = ___ZL32objc_getRealizedClassList_nolockPP10objc_classm_block_invoke_161;
    v6[3] = &__block_descriptor_40_e8_32c61_ZTSKZL32objc_getRealizedClassList_nolockPP10objc_classmE3__1_e8_B16__0_8l;
    v6[4] = &v9;
    int v4 = v6;
  }

  foreach_realized_class((uint64_t)v4, a2, a3, a4);
  return v9;
}

uint64_t ___ZL32objc_getRealizedClassList_nolockPP10objc_classm_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  ++**(void **)(a1 + 32);
  uint64_t v3 = *v2;
  if ((unint64_t)*v2 < *(void *)(a1 + 48))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    *uint64_t v2 = v3 + 1;
    *(void *)(v4 + 8 * v3) = a2;
  }

  return 1LL;
}

uint64_t ___ZL32objc_getRealizedClassList_nolockPP10objc_classm_block_invoke_161(uint64_t a1)
{
  return 1LL;
}

uint64_t __copy_helper_block_e8_32c61_ZTSKZL32objc_getRealizedClassList_nolockPP10objc_classmE3__1( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_e8_32c61_ZTSKZL32objc_getRealizedClassList_nolockPP10objc_classmE3__0( uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  realizeAllClasses();
  int RealizedClassList_nolock = objc_getRealizedClassList_nolock(buffer, bufferCount, v7, v8);
  int v10 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v11 = __ldxr(runtimeLock);
    if (v11 != v10) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return RealizedClassList_nolock;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return RealizedClassList_nolock;
}

void sub_1800302F4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *objc_copyRealizedClassList(unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v6, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v8 = objc_copyRealizedClassList_nolock(a1, a2, a3, a4);
  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr(runtimeLock);
    if (v10 != v9) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v8;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v8;
}

void sub_1800303C4(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  realizeAllClasses();
  uint64_t v8 = (Class *)objc_copyRealizedClassList_nolock(outCount, v5, v6, v7);
  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr(runtimeLock);
    if (v10 != v9) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v8;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v8;
}

void sub_180030498(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void _objc_beginClassEnumeration(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = __s;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  if (__s) {
    *(void *)(a5 + 32) = strlen(__s);
  }
  if (a1 == -1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v8 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v8, runtimeLock)) {
        goto LABEL_9;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_9:
    uint64_t v10 = qword_18C43F420;
    if ((_DWORD)qword_18C43F420)
    {
      unsigned int v11 = (char *)malloc(8LL * qword_18C43F420);
      unsigned int v25 = qword_18C43F418;
      memcpy(v11, (const void *)objc::allocatedClasses, 8 * v10);
      unsigned int v12 = v25;
    }

    else
    {
      unsigned int v11 = 0LL;
      unsigned int v12 = 0;
    }

    unsigned int v13 = v12;
    unsigned int v14 = calloc(8uLL, v12);
    unsigned int v15 = v14;
    if (!v13) {
      goto LABEL_26;
    }
    uint64_t v16 = v11;
    if ((_DWORD)v10)
    {
      uint64_t v17 = 8 * v10;
      uint64_t v16 = v11;
      while (*(void *)v16 >= 0xFFFFFFFFFFFFFFFELL)
      {
        v16 += 8;
        v17 -= 8LL;
        if (!v17) {
          goto LABEL_26;
        }
      }
    }

    uint64_t v18 = &v11[8 * v10];
    if (v16 == v18)
    {
LABEL_26:
      uint64_t v19 = 0LL;
    }

    else
    {
      uint64_t v19 = 0LL;
      uint64_t v20 = *(void *)v16;
LABEL_20:
      if ((*(_DWORD *)(*(void *)(v20 + 32) & 0xF00007FFFFFFFF8LL) & 0x2000001) == 0x2000000) {
        v14[v19++] = v20;
      }
      while (1)
      {
        v16 += 8;
        if (v16 == v18) {
          break;
        }
        uint64_t v20 = *(void *)v16;
        if (*(void *)v16 < 0xFFFFFFFFFFFFFFFELL)
        {
          if (v16 != v18) {
            goto LABEL_20;
          }
          break;
        }
      }
    }

    uint64_t v21 = realloc(v14, 8 * v19);
    if (v21) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v15;
    }
    *(void *)(a5 + 40) = v22;
    *(void *)(a5 + 48) = 0LL;
    *(void *)(a5 + 56) = v19;
    free(v11);
    int v23 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v24 = __ldxr(runtimeLock);
      if (v24 != v23) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_1800306D8(_Unwind_Exception *a1)
{
  int v5 = *(_DWORD *)(v3 + 24);
  while (1)
  {
    unsigned int v6 = __ldxr(v2);
    if (v6 != v5) {
      break;
    }
    if (!__stlxr(0, v2)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(a1);
}

uint64_t list_array_tt<unsigned long,protocol_list_t,RawPtr>::begin( uint64_t a1, void *a2, const char *a3, char *a4)
{
  unsigned int v30 = a2;
  uint64_t v4 = *a2 & 3LL;
  int v5 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (!v6)
  {
    unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v26 = a2;
LABEL_9:
    uint64_t v27 = 0LL;
    return list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26);
  }

  if (*a2 > 3uLL)
  {
    if (v4 == 1 && v5 != 0LL)
    {
      unint64_t v31 = (unint64_t)(v5 + 2);
      uint64_t v26 = a2;
      goto LABEL_26;
    }

    if (v4 == 2 && v5 != 0LL)
    {
      if (DisablePreattachedCategories)
      {
        unint64_t v12 = *v5;
        uint64_t v20 = v5[1];
        unint64_t v21 = v20 * (unint64_t)v12;
        if ((v21 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v20,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
        }
        unint64_t v22 = v12 | (v20 << 32);
        uint64_t v23 = (uint64_t)v5 + v21 + 8;
        unint64_t v24 = v12 | ((unint64_t)(v20 - 1) << 32);
        BOOL v25 = (_DWORD)v20 == 0;
        if ((_DWORD)v20) {
          uint64_t v10 = v20;
        }
        else {
          uint64_t v10 = 0LL;
        }
        if ((_DWORD)v20) {
          int v9 = (unsigned __int16 *)(v23 - v12);
        }
        else {
          int v9 = (unsigned __int16 *)v23;
        }
        if (v25) {
          unint64_t v11 = v22;
        }
        else {
          unint64_t v11 = v24;
        }
      }

      else
      {
        int v9 = (unsigned __int16 *)(v5 + 2);
        unint64_t v11 = *v5;
        uint64_t v10 = v5[1];
        unint64_t v12 = v11;
      }

      unint64_t v13 = v10 * (unint64_t)v12;
      if ((v13 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v10,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v12);
      }
      unint64_t v14 = HIDWORD(v11);
      for (i = (unint64_t)v5 + v13 + 8; (unint64_t)v9 < i; unint64_t v14 = (v14 + 1))
      {
        if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v9 + 8) & 1) != 0) {
          break;
        }
        int v9 = (unsigned __int16 *)((char *)v9 + v11);
      }

      unint64_t v31 = *a2 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v32 = v11 | (v14 << 32);
      int v33 = v9;
    }
  }

  else
  {
    unint64_t v31 = 0LL;
  }

  uint64_t v26 = a2;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_26:
  if (v4 == 1 && v5)
  {
    uint64_t v27 = (uint64_t)&v5[2 * *v5 + 2];
  }

  else if (v4 == 2 && v5)
  {
    uint64_t v17 = *v5;
    uint64_t v16 = v5[1];
    unint64_t v18 = v16 * (unint64_t)v17;
    if ((v18 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)a2, a3, a4, v16, v5, v17);
    }
    uint64_t v27 = (uint64_t)v5;
    uint64_t v28 = v17 | (v16 << 32);
    uint64_t v29 = (uint64_t)v5 + v18 + 8;
  }

  return list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v30,  (uint64_t)&v26);
}

uint64_t list_array_tt<unsigned long,protocol_list_t,RawPtr>::end( uint64_t a1, void *a2, const char *a3, char *a4)
{
  uint64_t v5 = *a2 & 3LL;
  BOOL v6 = (unsigned int *)(*a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (v5 == 1 && v6 != 0LL)
  {
    v6 += 2 * *v6 + 2;
    uint64_t v17 = a2;
LABEL_15:
    unint64_t v18 = v6;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    return list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13);
  }

  if (v5 == 2 && v6 != 0LL)
  {
    uint64_t v10 = *v6;
    uint64_t v9 = v6[1];
    unint64_t v11 = v9 * (unint64_t)v10;
    if ((v11 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)a2,  a3,  a4,  v9,  *a2 & 0xFFFFFFFFFFFFFFFCLL,  v10);
    }
    uint64_t v5 = (uint64_t)v6 + v11 + 8;
    uint64_t v4 = v10 | (v9 << 32);
    uint64_t v17 = a2;
    goto LABEL_18;
  }

  BOOL v6 = 0LL;
  uint64_t v17 = a2;
  if (v5 == 2)
  {
LABEL_18:
    unint64_t v18 = v6;
    uint64_t v19 = v4;
    uint64_t v20 = v5;
    unint64_t v13 = a2;
    unint64_t v14 = v6;
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    return list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13);
  }

  if (v5 == 1) {
    goto LABEL_15;
  }
  if (v5)
  {
    unint64_t v13 = a2;
  }

  else
  {
    unint64_t v18 = 0LL;
    unint64_t v13 = a2;
    unint64_t v14 = 0LL;
  }

  return list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( a1,  (uint64_t)&v17,  (uint64_t)&v13);
}

BOOL list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator==( uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1 != *a2) {
    return 0LL;
  }
  unint64_t v3 = *v2 & 3LL;
  if (v3 == 2)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    uint64_t v5 = a2[3];
  }

  else
  {
    if (v3 > 1) {
      return 0LL;
    }
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = a2[1];
  }

  if (v4 != v5) {
    return 0LL;
  }
  if (v2 == *(void **)(a1 + 32)
    && (v3 == 2
      ? (uint64_t v7 = *(void *)(a1 + 24), v8 = *(void *)(a1 + 56))
      : (uint64_t v7 = *(void *)(a1 + 8), v8 = *(void *)(a1 + 40)),
        v7 == v8))
  {
    return 1LL;
  }

  else
  {
    return *(void *)(a1 + 64) == a2[8];
  }

uint64_t **list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator++( uint64_t **a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = a1[9];
  uint64_t v6 = (uint64_t)(a1[8] + 1);
  a1[8] = (uint64_t *)v6;
  uint64_t v7 = *a1;
  uint64_t v8 = **a1;
  if ((v8 & 3) == 1)
  {
    ++a1[1];
    uint64_t v8 = *v7;
  }

  else if ((v8 & 3) == 0)
  {
    a1[1] = 0LL;
  }

  if ((v8 & 3) == 2)
  {
    uint64_t v9 = a1[3];
    uint64_t v10 = *((unsigned int *)a1 + 4);
    int v11 = *((_DWORD *)a1 + 5);
    a1[3] = (uint64_t *)((char *)v9 + v10);
    unint64_t v12 = (unsigned int *)a1[1];
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    unint64_t v15 = v13 * (unint64_t)v14;
    *((_DWORD *)a1 + 5) = v11 + 1;
    if ((v15 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v13, v12, v14);
    }
    unint64_t v16 = (unint64_t)v12 + v15 + 8;
    if ((unint64_t)v9 + v10 < v16)
    {
      uint64_t v17 = objc_debug_headerInfoRWs;
      int v18 = v11 + 2;
      do
      {
        a1[3] = (uint64_t *)((char *)v9 + 2 * v10);
        *((_DWORD *)a1 + 5) = v18++;
        uint64_t v9 = (uint64_t *)((char *)v9 + v10);
      }

      while ((unint64_t)v9 + v10 < v16);
    }
  }

  list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::skipEmptyLists(a1);
  uint64_t v22 = **a1 & 3;
  if (*a1 != a1[4])
  {
    if (v22 != 1)
    {
      if (!v22)
      {
        uint64_t v23 = a1[1];
LABEL_20:
        uint64_t v24 = *v23;
        uint64_t v25 = (uint64_t)&v23[*v23 + 1];
        a1[8] = v23 + 1;
        a1[9] = (uint64_t *)v25;
        if (!v24) {
          goto LABEL_36;
        }
        return a1;
      }

      goto LABEL_28;
    }

    uint64_t v26 = a1[1];
LABEL_26:
    uint64_t v27 = (void *)*v26;
    uint64_t v28 = *v26 + 8;
    a1[8] = (uint64_t *)v28;
    uint64_t v22 = 1LL;
    goto LABEL_29;
  }

  if (v22 != 2)
  {
    if (v22 != 1)
    {
      if (!v22)
      {
        uint64_t v23 = a1[1];
        if (v23 == a1[5]) {
          return a1;
        }
        goto LABEL_20;
      }

      uint64_t v22 = 3LL;
      goto LABEL_28;
    }

    uint64_t v26 = a1[1];
    if (v26 == a1[5]) {
      return a1;
    }
    goto LABEL_26;
  }

  if (a1[3] == a1[7]) {
    return a1;
  }
  uint64_t v22 = 2LL;
LABEL_28:
  uint64_t v29 = a1[3];
  uint64_t v28 = (uint64_t)v29 + (*v29 >> 16) + 8;
  a1[8] = (uint64_t *)v28;
  uint64_t v27 = (uint64_t *)((char *)v29 + (*v29 >> 16));
LABEL_29:
  uint64_t v30 = (uint64_t)&v27[*v27 + 1];
  a1[9] = (uint64_t *)v30;
  if (v28 == v30)
  {
    if (v22 == 2)
    {
      uint64_t v23 = (uint64_t *)((char *)a1[3] + (*a1[3] >> 16));
    }

    else if (v22 == 1)
    {
      uint64_t v23 = (uint64_t *)*a1[1];
    }

    else
    {
      uint64_t v23 = 0LL;
    }

uint64_t **list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::skipEmptyLists( uint64_t **result)
{
  uint64_t v1 = *result;
  uint64_t v2 = result[4];
  uint64_t v3 = objc_debug_headerInfoRWs;
  uint64_t v4 = **result;
  while (1)
  {
    uint64_t v5 = v4 & 3;
    if (v1 != v2)
    {
      if (v5 == 1)
      {
        uint64_t v7 = result[1];
        goto LABEL_17;
      }

      if ((v4 & 3) == 0)
      {
        uint64_t v6 = result[1];
LABEL_10:
        if (*v6) {
          return result;
        }
        result[1] = 0LL;
        goto LABEL_19;
      }

      goto LABEL_14;
    }

    if (v5 == 2)
    {
      if (result[3] == result[7]) {
        return result;
      }
      goto LABEL_14;
    }

    if (v5 == 1) {
      break;
    }
    if ((v4 & 3) == 0)
    {
      uint64_t v6 = result[1];
      if (v6 == result[5]) {
        return result;
      }
      goto LABEL_10;
    }

uint64_t list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::iteratorImpl( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  unint64_t v5 = *v4 & 3LL;
  if (v5 == 2)
  {
    __int128 v6 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v6;
  }

  else if (v5 <= 1)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
  }

  uint64_t v7 = *(void **)a3;
  *(void *)(a1 + 32) = *(void *)a3;
  unint64_t v8 = *v7 & 3LL;
  if (v8 == 2)
  {
    __int128 v9 = *(_OWORD *)(a3 + 8);
    *(void *)(a1 + 56) = *(void *)(a3 + 24);
    *(_OWORD *)(a1 + 40) = v9;
  }

  else if (v8 <= 1)
  {
    *(void *)(a1 + 40) = *(void *)(a3 + 8);
  }

  uint64_t v10 = **(void **)a2 & 3LL;
  if (*(void *)a2 != *(void *)a3)
  {
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        int v11 = *(void **)(a2 + 8);
LABEL_16:
        *(void *)(a1 + 64) = *v11 + 8LL;
        uint64_t v12 = **(void ***)(a2 + 8);
LABEL_23:
        *(void *)(a1 + 72) = &v12[*v12 + 1];
        goto LABEL_24;
      }

      uint64_t v12 = *(void **)(a2 + 8);
LABEL_22:
      *(void *)(a1 + 64) = v12 + 1;
      goto LABEL_23;
    }

    uint64_t v13 = *(uint64_t **)(a2 + 24);
LABEL_20:
    *(void *)(a1 + 64) = (char *)v13 + (*v13 >> 16) + 8;
    uint64_t v12 = (uint64_t *)((char *)v13 + (*v13 >> 16));
    goto LABEL_23;
  }

  if (v10 == 2)
  {
    uint64_t v13 = *(uint64_t **)(a2 + 24);
  }

  else if (v10 == 1)
  {
    int v11 = *(void **)(a2 + 8);
    if (v11 != *(void **)(a3 + 8)) {
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v12 = *(void **)(a2 + 8);
    if (v12 != *(void **)(a3 + 8)) {
      goto LABEL_22;
    }
  }

unint64_t *_objc_enumerateNextClass(uint64_t a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (*(void *)(a1 + 40))
  {
    unint64_t v5 = *(void *)(a1 + 48);
  }

  else
  {
    __int128 v9 = (unint64_t *)FirstHeader;
    if (!FirstHeader) {
      goto LABEL_93;
    }
    uint64_t v49 = *(unint64_t **)a1;
    while (v49 != (unint64_t *)((char *)v9 + *v9))
    {
      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v9);
      unint64_t v51 = v9 + 3;
      if (PreoptimizedHeaderRW) {
        unint64_t v51 = (void *)PreoptimizedHeaderRW;
      }
      __int128 v9 = (unint64_t *)(*v51 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v9) {
        goto LABEL_93;
      }
    }

    uint64_t v52 = header_info::classlist((header_info *)v9, (unint64_t *)(a1 + 56));
    *(void *)(a1 + 40) = v52;
    if (!v52)
    {
LABEL_92:
      __int128 v9 = 0LL;
      goto LABEL_93;
    }

    unint64_t v5 = 0LL;
    *(void *)(a1 + 48) = 0LL;
  }

  if (v5 >= *(void *)(a1 + 56)) {
    goto LABEL_92;
  }
  unint64_t v59 = StatusReg;
  do
  {
    *(void *)(a1 + 48) = v5 + 1;
    __int128 v6 = (objc_class *)remapClass(*(void *)(*(void *)(a1 + 40) + 8 * v5));
    __int128 v9 = (unint64_t *)v6;
    if (!v6) {
      goto LABEL_13;
    }
    if (*(void *)(a1 + 8))
    {
      uint64_t v10 = (const void *)objc_class::demangledName(v6, 0LL, v7, v8);
    }

    int v11 = *(const char ***)(a1 + 16);
    if (!v11) {
      goto LABEL_77;
    }
    uint64_t v12 = v9;
    while (1)
    {
      v63[0] = 0LL;
      uint64_t v13 = v12[4];
      unint64_t v14 = (void *)(v13 & 0xF00007FFFFFFFF8LL);
      if ((unint64_t)(*v12 - 1LL) >= 0xF && (*(_DWORD *)v14 & 0x80000000) != 0)
      {
        uint64_t v28 = *(void *)((v13 & 0xF00007FFFFFFFF8LL) + 8);
        unint64_t v29 = v28 & 0xFFFFFFFFFFFFFFFELL;
        if ((v28 & 1) != 0)
        {
          unint64_t v19 = *(void *)(v29 + 24);
        }

        else
        {
          uint64_t v30 = *(void *)(v29 + 40);
          unint64_t v19 = v30 & 0xFFFFFFFFFFFFFFFELL;
          if ((v30 & 1) != 0 || !v19)
          {
            BOOL v31 = v19 != 0;
            unint64_t v19 = v30 & 0xFFFFFFFFFFFFFFFCLL | 2;
          }
        }
      }

      else
      {
        if (v13 < 0)
        {
          uint64_t v15 = *(void *)((v13 & 0xF00007FFFFFFFF8LL) + 8);
          unint64_t v14 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
          if ((v15 & 1) != 0) {
            unint64_t v14 = (void *)*v14;
          }
        }

        uint64_t v16 = v14[5];
        unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
        char v18 = v16 | ((v16 & 0xFFFFFFFFFFFFFFFELL) == 0);
        else {
          unint64_t v19 = 0LL;
        }
        if ((v18 & 1) == 0) {
          unint64_t v19 = v17;
        }
      }

      v63[0] = v19;
      list_array_tt<unsigned long,protocol_list_t,RawPtr>::begin((uint64_t)v61, v63, v7, v8);
      list_array_tt<unsigned long,protocol_list_t,RawPtr>::end((uint64_t)v60, v63, v20, v21);
      while (!list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator==((uint64_t)v61, v60))
      {
        uint64_t v22 = *v62;
        if (canonical_protocol) {
          int v23 = 0;
        }
        else {
          int v23 = 0x20000000;
        }
        if ((v23 & *((_DWORD *)*v62 + 17)) == 0)
        {
          uint64_t Protocol = getProtocol(v22[1]);
          if (Protocol) {
            uint64_t v22 = (const char **)Protocol;
          }
        }

        if (v22 == v11 || (protocol_conformsToProtocol_nolock((protocol_t *)v22, v11) & 1) != 0) {
          goto LABEL_77;
        }
        list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator++(v61, v25, v26, v27);
      }

      if ((unint64_t)(*v12 - 1LL) < 0xF)
      {
        char v58 = 0;
        goto LABEL_48;
      }

      int v32 = *(_DWORD *)(v12[4] & 0xF00007FFFFFFFF8LL);
      if ((v32 & 0x80000000) == 0) {
        break;
      }
LABEL_74:
      uint64_t v12 = (void *)remapClass(v12[1]);
      if (!v12) {
        goto LABEL_13;
      }
    }

    char v58 = v32 & 1;
LABEL_48:
    int v33 = objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::LookupBucketFor<objc_class const*>( (unint64_t)v12,  v61);
    else {
      int v34 = v33;
    }
    if (v34 != 1) {
      goto LABEL_74;
    }
    uint64_t v35 = v61[0][2];
    unsigned int v36 = v35 >> 1;
    unint64_t v37 = (v35 & 1) != 0 ? (uint64_t *)v61[0][1] : v61[0] + 1;
    uint64_t v38 = (v61[0][2] & 1) != 0 ? v36 : (v61[0][1] != 0);
    uint64_t v56 = v37;
    uint64_t v57 = v38;
    if (!(_DWORD)v38) {
      goto LABEL_74;
    }
    uint64_t v39 = 0LL;
    while (1)
    {
      if ((v58 & 1) == 0)
      {
        uint64_t v40 = *(void **)(v56[2 * v39] + 32);
        if (v40)
        {
          uint64_t v43 = *v40;
          uint64_t v42 = (const char ***)(v40 + 1);
          uint64_t v41 = v43;
          if (v43) {
            break;
          }
        }
      }

LABEL_73:
      if (++v39 == v57) {
        goto LABEL_74;
      }
    }

    uint64_t v44 = 8 * v41;
    while (1)
    {
      unint64_t v45 = *v42;
      if (canonical_protocol) {
        int v46 = 0;
      }
      else {
        int v46 = 0x20000000;
      }
      if ((v46 & *((_DWORD *)*v42 + 17)) == 0)
      {
        uint64_t v47 = getProtocol(v45[1]);
        if (v47) {
          unint64_t v45 = (const char **)v47;
        }
      }

      if (v45 == v11 || (protocol_conformsToProtocol_nolock((protocol_t *)v45, v11) & 1) != 0) {
        break;
      }
      ++v42;
      v44 -= 8LL;
      if (!v44) {
        goto LABEL_73;
      }
    }

LABEL_13:
    unint64_t v5 = *(void *)(a1 + 48);
  }

  while (v5 < *(void *)(a1 + 56));
  __int128 v9 = 0LL;
  unint64_t StatusReg = v59;
LABEL_93:
  int v53 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v54 = __ldxr(runtimeLock);
    if (v54 != v53) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v9;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v9;
}

      --v5;
      goto LABEL_15;
    }

    switch(v4)
    {
      case '}':
        goto LABEL_13;
      case '{':
        goto LABEL_14;
      case ']':
        goto LABEL_13;
    }

void sub_1800313B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v15 = *(_DWORD *)(v12 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v13);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v13)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t objc_class::demangledName(objc_class *this, uint64_t a2, const char *a3, char *a4)
{
  int v4 = a2;
  if ((unint64_t)&this->isa[-1].isa + 7 >= 0xF)
  {
    Class isa = this[4].isa;
    int v7 = *(_DWORD *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
    if (v7 < 0)
    {
      if ((v7 & 0x40000000) == 0 && ((HIWORD(this[3].isa) & 4) != 0 || (isa & 3) != 0))
      {
        uint64_t v24 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
        if ((v24 & 1) != 0)
        {
          unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
          if (v25)
          {
            unint64_t v8 = *(char **)(v25 + 32);
            if (v8) {
              return (unint64_t)v8;
            }
          }
        }

        goto LABEL_4;
      }
    }

    else if ((v7 & 0x40000000) == 0)
    {
      goto LABEL_4;
    }

    uint64_t v14 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    int v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
    if ((v14 & 1) != 0) {
      int v15 = (void *)*v15;
    }
    return atomic_load(v15 + 3);
  }

LABEL_4:
  unint64_t v8 = (char *)objc_class::mangledName(this, a2, a3, a4);
  __int128 v9 = copySwiftV1DemangledName(v8, 0);
  int v34 = v9;
  if ((unint64_t)&this->isa[-1].isa + 7 >= 0xF
    && (uint64_t v10 = (_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL), *v10 >> 30))
  {
    if (v4)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v17 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v17, runtimeLock)) {
          goto LABEL_39;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_39:
      uint64_t v26 = (uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL;
      uint64_t v27 = *(void *)(v26 + 8);
      unint64_t v23 = v27 & 0xFFFFFFFFFFFFFFFELL;
      if ((v27 & 1) == 0) {
        unint64_t v23 = class_rw_t::extAlloc(v26, v27 & 0xFFFFFFFFFFFFFFFELL, 0);
      }
      int v28 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v29 = __ldxr(runtimeLock);
        if (v29 != v28) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          goto LABEL_46;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    }

    else
    {
      uint64_t v22 = *(void *)(((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) + 8);
      unint64_t v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
      if ((v22 & 1) == 0) {
        unint64_t v23 = class_rw_t::extAlloc((uint64_t)v10, v22 & 0xFFFFFFFFFFFFFFFELL, 0);
      }
    }

LABEL_46:
    uint64_t v30 = v34;
    if (!v34) {
      uint64_t v30 = v8;
    }
    BOOL v31 = (unint64_t *)(v23 + 32);
    while (!__ldaxr(v31))
    {
    }

    __clrex();
    if (v34) {
      free(v34);
    }
    return *v31;
  }

  else if (v9)
  {
    unint64_t v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v12 = *(_DWORD *)(v11 + 24);
    while (!__ldaxr((unsigned int *)&DemangleCacheLock))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_23:
    unint64_t v19 = (int32x2_t *)DemangleCache;
    if (!DemangleCache)
    {
      unint64_t v19 = (int32x2_t *)malloc(0x18uLL);
      v19[1] = 0LL;
      v19[2] = 0LL;
      *unint64_t v19 = 0LL;
      DemangleCache = (uint64_t)v19;
    }

    objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::try_emplace<objc::detail::DenseSetEmpty&>( (uint64_t)&v35,  v19,  (char **)&v34);
    unint64_t v8 = *v35;
    int v20 = *(_DWORD *)(v11 + 24);
    while (1)
    {
      unsigned int v21 = __ldxr((unsigned int *)&DemangleCacheLock);
      if (v21 != v20) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&DemangleCacheLock);
LABEL_30:
    if (v8 != v34) {
      free(v34);
    }
  }

  return (unint64_t)v8;
}

    if (v6) {
      free(v6);
    }
  }

  while (!v23);
  outCount = v34;
  if (!v34) {
    return v35;
  }
  __n128 result = v35;
  if (!v35) {
    goto LABEL_78;
  }
  return result;
}

    if (v6) {
      free(v6);
    }
  }

  while (!v23);
  a2 = v42;
  if (!v42) {
    return v43;
  }
  __n128 result = v43;
  if (!v43) {
    goto LABEL_88;
  }
  return result;
}

  if (!v20) {
    uint64_t v1 = 0LL;
  }
LABEL_48:
  unsigned int v21 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    uint64_t v22 = __ldxr(&v4->_os_unfair_lock_opaque);
    if (v22 != v21) {
      break;
    }
    if (!__stlxr(0, &v4->_os_unfair_lock_opaque)) {
      return v1;
    }
  }

  __clrex();
  os_unfair_lock_unlock(v4);
  return v1;
}

void sub_1800316BC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(&v1->_os_unfair_lock_opaque);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, &v1->_os_unfair_lock_opaque)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock(v1);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::try_emplace<objc::detail::DenseSetEmpty&>( uint64_t a1, int32x2_t *a2, char **a3)
{
  BOOL result = objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( (uint64_t)a2,  *a3,  &v13);
  int v7 = v13;
  if (result)
  {
    char v8 = 0;
    goto LABEL_10;
  }

  __int32 v9 = a2[1].i32[0];
  unsigned int v10 = a2[2].u32[0];
  if (4 * v9 + 4 >= 3 * v10)
  {
    v10 *= 2;
    goto LABEL_12;
  }

  if (v10 + ~v9 - a2[1].i32[1] <= v10 >> 3)
  {
LABEL_12:
    objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::grow( (uint64_t)a2,  v10);
    objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( (uint64_t)a2,  *a3,  &v13);
    int v7 = v13;
  }

  unint64_t v11 = *v7;
  BOOL result = objc::DenseMapInfo<char const*>::isEqual(*v7, (char *)0xFFFFFFFFFFFFFFFFLL);
  if (result)
  {
    ++a2[1].i32[0];
  }

  else
  {
    BOOL result = objc::DenseMapInfo<char const*>::isEqual(v11, (char *)0xFFFFFFFFFFFFFFFELL);
    if (result) {
      a2[1] = vadd_s32(a2[1], (int32x2_t)0xFFFFFFFF00000001LL);
    }
  }

  *int v7 = *a3;
  char v8 = 1;
LABEL_10:
  uint64_t v12 = *(void *)a2 + 8LL * a2[2].u32[0];
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = v8;
  return result;
}

BOOL objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( uint64_t a1, char *__s1, char ***a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 16);
  if ((_DWORD)v4)
  {
    unsigned int v7 = 0;
    char v8 = *(void **)a1;
    __int32 v9 = __s1;
    do
    {
      unsigned int v10 = v7;
      int v11 = *v9++;
      unsigned int v7 = 257 * v7 + v11;
    }

    while (v11);
    uint64_t v22 = 0LL;
    int v12 = v4 - 1;
    for (int i = 1; ; int i = v21 + 1)
    {
      unsigned int v21 = i;
      unsigned int v14 = v10 & v12;
      int v15 = (char **)&v8[v10 & v12];
      unsigned int v16 = *v15;
      BOOL isEqual = objc::DenseMapInfo<char const*>::isEqual(__s1, *v15);
      if (isEqual) {
        break;
      }
      if (objc::DenseMapInfo<char const*>::isEqual(v16, (char *)0xFFFFFFFFFFFFFFFFLL))
      {
        if (v22) {
          int v15 = v22;
        }
        break;
      }

      if (v21 > v4) {
        objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  v8,  v4);
      }
      BOOL v18 = objc::DenseMapInfo<char const*>::isEqual(v16, (char *)0xFFFFFFFFFFFFFFFELL);
      unint64_t v19 = v22;
      if (v18 && v22 == 0LL) {
        unint64_t v19 = (char **)&v8[v14];
      }
      uint64_t v22 = v19;
      unsigned int v10 = v14 + v21;
    }
  }

  else
  {
    int v15 = 0LL;
    BOOL isEqual = 0LL;
  }

  *a3 = v15;
  return isEqual;
}

void objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  uint64_t v4 = *(char ***)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    unsigned int v8 = 4;
  }
  *(_DWORD *)(a1 + 16) = v8;
  size_t v9 = 8LL * v8;
  unsigned int v10 = malloc(v9);
  *(void *)a1 = v10;
  if (v4)
  {
    *(void *)(a1 + 8) = 0LL;
    memset(v10, 255, v9);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 8 * v3;
      int v12 = v4;
      do
      {
        uint64_t v13 = *v12;
        if (!objc::DenseMapInfo<char const*>::isEqual(*v12, (char *)0xFFFFFFFFFFFFFFFFLL)
          && !objc::DenseMapInfo<char const*>::isEqual(v13, (char *)0xFFFFFFFFFFFFFFFELL))
        {
          objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( a1,  v13,  &v14);
          *unsigned int v14 = *v12;
          ++*(_DWORD *)(a1 + 8);
        }

        ++v12;
        v11 -= 8LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    memset(v10, 255, v9);
  }

BOOL objc::DenseMapInfo<char const*>::isEqual(char *__s1, char *a2)
{
  if (__s1 == a2) {
    return 1LL;
  }
  BOOL result = 0LL;
  return result;
}

void _objc_endClassEnumeration(uint64_t a1)
{
  if (*(void *)a1 == -1LL) {
    free(*(void **)(a1 + 40));
  }
}

void objc_enumerateClasses( const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
  if (image != (const void *)-1LL)
  {
    size_t v9 = image;
    if (image)
    {
      image = (const void *)_dyld_get_dlopen_image_header();
      if (!image)
      {
        uint64_t v10 = dyld_image_header_containing_address();
        if (!v9 || (uint64_t v11 = (const void *)v10, image = v9, v11 != v9))
        {
          _objc_inform("unable to find mach header for image");
          return;
        }
      }
    }

    else
    {
      image = (const void *)dyld_image_header_containing_address();
      if (!image)
      {
        _objc_inform("unable to find caller's image");
        return;
      }
    }
  }

  _objc_beginClassEnumeration( (uint64_t)image,  (char *)namePrefix,  (uint64_t)conformingTo,  (uint64_t)subclassing,  (uint64_t)v14);
  char v13 = 0;
  do
  {
    Class = _objc_enumerateNextClass((uint64_t)v14);
    if (!Class) {
      break;
    }
    (*((void (**)(void *, unint64_t *, char *))block + 2))(block, Class, &v13);
  }

  while (!v13);
  if (v14[0] == -1LL) {
    free((void *)v14[5]);
  }
}

void _class_setCustomDeallocInitiation(uint64_t a1)
{
  if ((*(_WORD *)(a1 + 30) & 0x1000) == 0)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v3 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v3, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3321888768LL;
    v7[2] = ___class_setCustomDeallocInitiation_block_invoke;
    v7[3] = &__block_descriptor_33_e8_32c46_ZTSKZ33_class_setCustomDeallocInitiationE3__0_e8_B16__0_8l;
    foreach_realized_class_and_subclass(a1, (uint64_t)v7);
    int v5 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v6 = __ldxr(runtimeLock);
      if (v6 != v5) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_180031CBC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ___class_setCustomDeallocInitiation_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int16 *)(a2 + 30);
  do
    unsigned __int16 v3 = __ldxr(v2);
  while (__stxr(v3 | 0x1000, v2));
  return 1LL;
}

unint64_t _objc_setHook_msgSendCacheMiss(unint64_t result, unint64_t *a2)
{
  uint64_t v2 = msgSendCacheMissHook;
  *a2 = msgSendCacheMissHook;
  unint64_t v3 = __ldxr((unint64_t *)&msgSendCacheMissHook);
  if (v3 != v2)
  {
    __clrex();
LABEL_5:
    while (1)
    {
      *a2 = v3;
      unint64_t v4 = __ldxr((unint64_t *)&msgSendCacheMissHook);
      if (v4 != v3) {
        break;
      }
      int v5 = 1;
LABEL_10:
      unint64_t v3 = v4;
      if (v5) {
        return result;
      }
    }

    __clrex();
LABEL_9:
    int v5 = 0;
    goto LABEL_10;
  }

  return result;
}

char *class_copyImpCache(uint64_t a1, _DWORD *a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v7 = *(unsigned __int16 *)(a1 + 28);
  if (*(_WORD *)(a1 + 28))
  {
    unsigned int v8 = (char *)calloc(v7 + 1, 0x10uLL);
    size_t v9 = v8;
    uint64_t v10 = (void *)(a1 + 16);
    uint64_t v11 = *(objc_cache **)(a1 + 16);
    if ((v11 & 1) == 0 && (v11 == &_objc_empty_cache || HIWORD(*v10)))
    {
      if (HIWORD(*v10))
      {
        unint64_t v22 = 0LL;
        int v23 = 0;
        unint64_t v24 = HIWORD(*v10);
        unint64_t v25 = (void *)((*v10 & 0xFFFFFFFFFFFLL) + 8);
        do
        {
          if (*v25)
          {
            uint64_t v26 = *(v25 - 1);
            if (v26) {
              uint64_t v27 = v26 ^ a1;
            }
            else {
              uint64_t v27 = 0LL;
            }
            int v28 = &v8[16 * v23];
            *((void *)v28 + 1) = v27;
            *(void *)int v28 = *v25;
            ++v23;
          }

          if (v22 >= v24) {
            break;
          }
          ++v22;
          v25 += 2;
        }

        while (v23 < (int)v7);
      }
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = *v10 & 0xFFFFFFFFFFFELL;
      unint64_t v14 = (unint64_t)*(unsigned __int16 *)(v13 - 8) >> 5;
      uint64_t v15 = 16 * v14 + 16;
      unsigned int v16 = (uint64_t *)(*v10 & 0xFFFFFFFFFFFELL);
      do
      {
        unsigned int v17 = &v8[v12];
        *(void *)unsigned int v17 = (unint64_t)*v16 >> 38;
        uint64_t v18 = *v16++;
        *((void *)v17 + 1) = v13 - (v18 << 26 >> 24);
        v12 += 16LL;
      }

      while (v15 != v12);
    }
  }

  else
  {
    size_t v9 = 0LL;
  }

  if (a2) {
    *a2 = v7;
  }
  int v19 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v20 = __ldxr(runtimeLock);
    if (v20 != v19) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v9;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v9;
}

void sub_180031F34(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Protocol **__cdecl objc_copyProtocolList(unsigned int *outCount)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  unint64_t v5 = protocols();
  uint64_t v38 = 0LL;
  int32x2_t v39 = 0LL;
  unsigned int v40 = 0;
  unsigned int v6 = (header_info *)FirstHeader;
  if (FirstHeader)
  {
    unsigned int v36 = outCount;
    do
    {
      uint64_t v7 = header_info::protocollist(v6, &v37);
      unint64_t v8 = v37;
      if (v37)
      {
        uint64_t v9 = v7;
        do
        {
          uint64_t v10 = *(void *)v9;
          uint64_t v11 = *(void *)(*(void *)v9 + 8LL);
          unsigned int v12 = (**(uint64_t (***)(unint64_t, uint64_t))v5)(v5, v11);
          if (_NXMapMemberWithHash(v5, v11, v12, &v41) == -1 || v41.i64[0] == 0)
          {
            uint64_t PreoptimizedProtocol = getPreoptimizedProtocol();
            uint64_t v15 = *(char **)(v10 + 8);
            if (!objc::DenseMapBase<objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>,char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::LookupBucketFor<char const*>( (uint64_t)&v38,  v15,  (char ***)&v41))
            {
              if (4 * v39.i32[0] + 4 >= 3 * v40)
              {
                objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::grow( (uint64_t)&v38,  2 * v40);
                objc::DenseMapBase<objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>,char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::LookupBucketFor<char const*>( (uint64_t)&v38,  v15,  (char ***)&v41);
              }

              else if (v40 + ~v39.i32[0] - v39.i32[1] <= v40 >> 3)
              {
                objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::grow( (uint64_t)&v38,  v40);
                objc::DenseMapBase<objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>,char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::LookupBucketFor<char const*>( (uint64_t)&v38,  v15,  (char ***)&v41);
              }

              unsigned int v16 = (char **)v41.i64[0];
              unsigned int v17 = *(char **)v41.i64[0];
              if (objc::DenseMapInfo<char const*>::isEqual(*(char **)v41.i64[0], (char *)0xFFFFFFFFFFFFFFFFLL))
              {
                ++v39.i32[0];
              }

              else if (objc::DenseMapInfo<char const*>::isEqual(v17, (char *)0xFFFFFFFFFFFFFFFELL))
              {
                int32x2_t v39 = vadd_s32(v39, (int32x2_t)0xFFFFFFFF00000001LL);
              }

              *unsigned int v16 = v15;
              v16[1] = (char *)PreoptimizedProtocol;
            }
          }

          v9 += 8LL;
          --v8;
        }

        while (v8);
      }

      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v6);
      int v19 = (void *)((char *)v6 + 24);
      if (PreoptimizedHeaderRW) {
        int v19 = (void *)PreoptimizedHeaderRW;
      }
      unsigned int v6 = (header_info *)(*v19 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v6);
    __int32 v20 = v39.i32[0];
    outCount = v36;
  }

  else
  {
    __int32 v20 = 0;
  }

  unsigned int v21 = v20 + *(_DWORD *)(v5 + 8);
  if (v21)
  {
    unint64_t v22 = (Protocol **)malloc(8LL * (v21 + 1));
    int v23 = v22;
    int v24 = 0;
    int v25 = *(_DWORD *)(v5 + 12) + 1;
    uint64_t v26 = *(void *)(v5 + 16);
LABEL_34:
    uint64_t v27 = v25;
    int v28 = (uint64_t *)(v26 - 16 + 16LL * v25);
    while (v27)
    {
      --v27;
      uint64_t v29 = *v28;
      v28 -= 2;
      if (v29 != -1)
      {
        v22[v24++] = *(Protocol **)(v26 + 16 * v27 + 8);
        int v25 = v27;
        goto LABEL_34;
      }
    }

    uint64_t v30 = (char *)v38 + 16 * v40;
    if (v39.i32[0])
    {
      v41.i64[0] = (uint64_t)v38;
      v41.i64[1] = (uint64_t)v38 + 16 * v40;
      objc::DenseMapIterator<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>,false>::AdvancePastEmptyBuckets((char ***)&v41);
      int64x2_t v31 = v41;
    }

    else
    {
      int64x2_t v31 = vdupq_n_s64((unint64_t)v30);
    }

    int64x2_t v41 = v31;
    uint64_t v32 = v31.i64[0];
    while ((char *)v32 != v30)
    {
      v23[v24] = *(Protocol **)(v32 + 8);
      v41.i64[0] = v32 + 16;
      objc::DenseMapIterator<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>,false>::AdvancePastEmptyBuckets((char ***)&v41);
      uint64_t v32 = v41.i64[0];
      ++v24;
    }

    v23[v24] = 0LL;
    if (outCount) {
      goto LABEL_47;
    }
  }

  else
  {
    int v23 = 0LL;
    if (outCount)
    {
      unsigned int v21 = 0;
LABEL_47:
      *outCount = v21;
    }
  }

  free(v38);
  int v33 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v34 = __ldxr(runtimeLock);
    if (v34 != v33) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v23;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v23;
}

void sub_1800322A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  int v15 = *(_DWORD *)(v13 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v12);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v12)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

char ***objc::DenseMapIterator<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>,false>::AdvancePastEmptyBuckets( char ***result)
{
  uint64_t v1 = *result;
  uint64_t v2 = result[1];
  if (*result != v2)
  {
    unsigned int v3 = result;
    do
    {
      int v4 = *v1;
      BOOL result = (char ***)objc::DenseMapInfo<char const*>::isEqual(*v1, (char *)0xFFFFFFFFFFFFFFFFLL);
      if ((result & 1) == 0)
      {
        BOOL result = (char ***)objc::DenseMapInfo<char const*>::isEqual(v4, (char *)0xFFFFFFFFFFFFFFFELL);
        if (!(_DWORD)result) {
          break;
        }
      }

      v1 += 2;
      *unsigned int v3 = v1;
    }

    while (v1 != v2);
  }

  return result;
}

BOOL objc::DenseMapBase<objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>,char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::LookupBucketFor<char const*>( uint64_t a1, char *__s1, char ***a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 16);
  if ((_DWORD)v4)
  {
    unsigned int v7 = 0;
    unint64_t v8 = *(void **)a1;
    uint64_t v9 = __s1;
    do
    {
      unsigned int v10 = v7;
      int v11 = *v9++;
      unsigned int v7 = 257 * v7 + v11;
    }

    while (v11);
    unint64_t v22 = 0LL;
    int v12 = v4 - 1;
    for (int i = 1; ; int i = v21 + 1)
    {
      unsigned int v21 = i;
      unsigned int v14 = v10 & v12;
      int v15 = (char **)&v8[2 * (v10 & v12)];
      unsigned int v16 = *v15;
      BOOL isEqual = objc::DenseMapInfo<char const*>::isEqual(__s1, *v15);
      if (isEqual) {
        break;
      }
      if (objc::DenseMapInfo<char const*>::isEqual(v16, (char *)0xFFFFFFFFFFFFFFFFLL))
      {
        if (v22) {
          int v15 = v22;
        }
        break;
      }

      if (v21 > v4) {
        objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  v8,  v4);
      }
      BOOL v18 = objc::DenseMapInfo<char const*>::isEqual(v16, (char *)0xFFFFFFFFFFFFFFFELL);
      int v19 = v22;
      if (v18 && v22 == 0LL) {
        int v19 = (char **)&v8[2 * v14];
      }
      unint64_t v22 = v19;
      unsigned int v10 = v14 + v21;
    }
  }

  else
  {
    int v15 = 0LL;
    BOOL isEqual = 0LL;
  }

  *a3 = v15;
  return isEqual;
}

void objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  uint64_t v4 = *(char ***)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    uint64_t v8 = 4LL;
  }
  *(_DWORD *)(a1 + 16) = v8;
  uint64_t v9 = malloc(16LL * v8);
  *(void *)a1 = v9;
  if (v4)
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v10 = 16 * v8;
    do
    {
      *uint64_t v9 = -1LL;
      v9 += 2;
      v10 -= 16LL;
    }

    while (v10);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 16 * v3;
      int v12 = v4;
      do
      {
        uint64_t v13 = *v12;
        if (!objc::DenseMapInfo<char const*>::isEqual(*v12, (char *)0xFFFFFFFFFFFFFFFFLL)
          && !objc::DenseMapInfo<char const*>::isEqual(v13, (char *)0xFFFFFFFFFFFFFFFELL))
        {
          objc::DenseMapBase<objc::DenseMap<char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>,char const*,Protocol *,objc::DenseMapValueInfo<Protocol *>,objc::DenseMapInfo<char const*>,objc::detail::DenseMapPair<char const*,Protocol *>>::LookupBucketFor<char const*>( a1,  v13,  &v16);
          unsigned int v14 = v16;
          *unsigned int v16 = *v12;
          v14[1] = v12[1];
          ++*(_DWORD *)(a1 + 8);
        }

        v12 += 2;
        v11 -= 16LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v15 = 16 * v8;
    do
    {
      *uint64_t v9 = -1LL;
      v9 += 2;
      v15 -= 16LL;
    }

    while (v15);
  }

Protocol *__cdecl objc_getProtocol(const char *name)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t Protocol = (Protocol *)getProtocol(name);
  int v6 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v7 = __ldxr(runtimeLock);
    if (v7 != v6) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return Protocol;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return Protocol;
}

void sub_180032650(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  unsigned int v5 = outCount;
  if (!cls)
  {
    uint64_t v10 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v10;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v8, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  uint64_t v11 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
  if ((v11 & 1) != 0)
  {
    unint64_t v14 = *(void *)(v12 + 8);
  }

  else
  {
    uint64_t v13 = *(void *)(v12 + 32);
    unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
    if ((v13 & 1) != 0) {
      unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFELL;
    }
    else {
      unint64_t v15 = 0LL;
    }
    if ((v13 & 1) != 0 || !v14)
    {
      if (v15) {
        unint64_t v14 = v15 | 2;
      }
      else {
        unint64_t v14 = 0LL;
      }
    }
  }

  unint64_t v111 = v14;
  unint64_t v16 = v14 & 3;
  BOOL v17 = v16 != 0;
  BOOL v18 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v14 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    uint64_t v19 = 0LL;
    unint64_t v21 = 0LL;
    __int32 v20 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_44:
    BOOL v27 = !v17;
    BOOL v28 = v16 != 2;
    goto LABEL_45;
  }

  if (v14 >= 4)
  {
    if (v16 != 1 || v18 == 0LL)
    {
      if (v16 == 2) {
        __int32 v20 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
      }
      else {
        __int32 v20 = 0LL;
      }
      if (v20)
      {
        if (DisablePreattachedCategories)
        {
          uint64_t v23 = *v20;
          unint64_t v3 = v20[1];
          unint64_t v89 = v3 * (unint64_t)v23;
          if ((v89 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_194;
          }
          int v4 = (unsigned int *)((char *)v20 + v89 + 8);
          BOOL v90 = (_DWORD)v3 == 0;
          if ((_DWORD)v3) {
            unint64_t v3 = v3;
          }
          else {
            unint64_t v3 = 0LL;
          }
          if (!v90) {
            int v4 = (unsigned int *)((char *)v4 - v23);
          }
        }

        else
        {
          int v4 = v20 + 2;
          uint64_t v23 = *v20;
          unint64_t v3 = v20[1];
        }

        unint64_t v24 = v3 * (unint64_t)v23;
        if ((v24 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_194;
        }
        unint64_t v25 = (unint64_t)v20 + v24 + 8;
        if ((unint64_t)v4 < v25)
        {
          while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v4 + 8) & 1) == 0)
          {
            int v4 = (unsigned int *)((char *)v4 + v23);
            unsigned int v26 = v23;
          }
        }

        unsigned int v26 = v23;
LABEL_109:
        uint64_t v19 = v26;
      }

      else
      {
        uint64_t v19 = 0LL;
      }
    }

    else
    {
      uint64_t v19 = 0LL;
      __int32 v20 = v18 + 2;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    __int32 v20 = 0LL;
  }

  BOOL v27 = v16 != 1;
  if (v16 == 1 && v18)
  {
    unint64_t v21 = (unint64_t)&v18[2 * *v18 + 2];
    goto LABEL_44;
  }

  unint64_t v21 = 0LL;
  BOOL v28 = v16 != 2;
  if (v16 == 2 && v18)
  {
    uint64_t v23 = *v18;
    unint64_t v3 = v18[1];
    unint64_t v36 = v3 * (unint64_t)v23;
    if ((v36 & 0xFFFFFFFF00000000LL) != 0)
    {
      __int32 v20 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
      goto LABEL_194;
    }

    BOOL v28 = 0;
    outCount = (unsigned int *)((char *)v18 + v36 + 8);
    unint64_t v21 = v14 & 0xFFFFFFFFFFFFFFFCLL;
  }

LABEL_45:
  int v29 = 0;
  uint64_t v2 = 4LL;
  if ((v14 & 3) != 0) {
    goto LABEL_48;
  }
LABEL_46:
  if (v20 != (unsigned int *)v21)
  {
    unint64_t v3 = v20[1];
    __int32 v20 = 0LL;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v29 += v3;
          if ((v14 & 3) == 0) {
            goto LABEL_46;
          }
LABEL_48:
          if (v27) {
            break;
          }
          uint64_t v30 = *(void *)v20;
          v20 += 2;
          unint64_t v3 = *(unsigned int *)(v30 + 4);
        }

        if (!v28) {
          break;
        }
        unint64_t v3 = MEMORY[4];
      }

      if (v4 == outCount) {
        goto LABEL_61;
      }
      unint64_t v3 = v20[1];
      unint64_t v31 = v3 * (unint64_t)*v20;
      if ((v31 & 0xFFFFFFFF00000000LL) != 0) {
        break;
      }
      unint64_t v3 = *(unsigned int *)((char *)v4 + (*(uint64_t *)v4 >> 16) + 4);
      unint64_t v32 = (unint64_t)v20 + v31 + 8;
      int v33 = (unsigned int *)((char *)v4 + v19);
      do
      {
        int v4 = v33;
        uint64_t v34 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v33 + 8);
        int v33 = (unsigned int *)((char *)v33 + v19);
      }

      while ((v34 & 1) == 0);
    }

    uint64_t v23 = *v20;
LABEL_194:
    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)outCount,  (const char *)v2,  (char *)v3,  v3,  v20,  v23);
  }

LABEL_61:
  if (!v29)
  {
    unsigned int v35 = 0;
    uint64_t v10 = 0LL;
    if (v5) {
      goto LABEL_167;
    }
    goto LABEL_168;
  }

  uint64_t v94 = (uint64_t *)&v111;
  if (!v17)
  {
    unint64_t v95 = v14 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v116 = &v111;
LABEL_70:
    uint64_t v117 = 0LL;
    goto LABEL_85;
  }

  if (v14 > 3)
  {
    if (v16 == 1 && v18)
    {
      unint64_t v95 = (unint64_t)(v18 + 2);
      unint64_t v116 = &v111;
      goto LABEL_78;
    }

    if (v16 == 2 && v18)
    {
      if (DisablePreattachedCategories)
      {
        unint64_t v37 = *v18;
        uint64_t v38 = v18[1];
        unint64_t v91 = v38 * (unint64_t)v37;
        if ((v91 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_197;
        }
        unint64_t v51 = v37 | (v38 << 32);
        uint64_t v50 = (unsigned __int16 *)((char *)v18 + v91 + 8);
        unint64_t v92 = v37 | ((unint64_t)(v38 - 1) << 32);
        BOOL v93 = (_DWORD)v38 == 0;
        if ((_DWORD)v38) {
          uint64_t v38 = v38;
        }
        else {
          uint64_t v38 = 0LL;
        }
        if (!v93)
        {
          uint64_t v50 = (unsigned __int16 *)((char *)v50 - v37);
          unint64_t v51 = v92;
        }
      }

      else
      {
        uint64_t v50 = (unsigned __int16 *)(v18 + 2);
        unint64_t v51 = *v18;
        uint64_t v38 = v18[1];
        unint64_t v37 = v51;
      }

      unint64_t v52 = v38 * (unint64_t)v37;
      if ((v52 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_197;
      }
      unint64_t v53 = HIDWORD(v51);
      unint64_t v54 = (unint64_t)v18 + v52 + 8;
      while ((unint64_t)v50 < v54 && (*(void *)(objc_debug_headerInfoRWs + 8LL * *v50 + 8) & 1) == 0)
      {
        uint64_t v50 = (unsigned __int16 *)((char *)v50 + v51);
        unint64_t v53 = (v53 + 1);
      }

      unint64_t v95 = (unint64_t)v18;
      unint64_t v96 = v51 | (v53 << 32);
      uint64_t v97 = v50;
    }
  }

  else
  {
    unint64_t v95 = 0LL;
  }

  unint64_t v116 = &v111;
  if (!v16) {
    goto LABEL_70;
  }
LABEL_78:
  if (v16 == 1 && v18)
  {
    uint64_t v117 = (uint64_t)&v18[2 * *v18 + 2];
    goto LABEL_85;
  }

  if (v16 != 2 || !v18) {
    goto LABEL_85;
  }
  unint64_t v37 = *v18;
  uint64_t v38 = v18[1];
  unint64_t v39 = v38 * (unint64_t)v37;
  if ((v39 & 0xFFFFFFFF00000000LL) != 0) {
LABEL_197:
  }
    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)outCount,  (const char *)4,  (char *)v3,  v38,  v18,  v37);
  uint64_t v117 = (uint64_t)v18;
  unsigned int v118 = (void *)(v37 | (v38 << 32));
  uint64_t v119 = (uint64_t)v18 + v39 + 8;
LABEL_85:
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( (uint64_t)&v99,  (uint64_t)&v94,  (uint64_t)&v116,  (char *)v3);
  uint64_t v43 = v111 & 3;
  uint64_t v44 = (unsigned int *)(v111 & 0xFFFFFFFFFFFFFFFCLL);
  if (v43 != 1 || v44 == 0LL)
  {
    if (v43 == 2 && v44)
    {
      uint64_t v47 = *v44;
      uint64_t v46 = v44[1];
      unint64_t v48 = v46 * (unint64_t)v47;
      if ((v48 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v40,  v41,  v42,  v46,  v111 & 0xFFFFFFFFFFFFFFFCLL,  v47);
      }
      uint64_t v43 = (uint64_t)v44 + v48 + 8;
      uint64_t v49 = (unint64_t *)(v47 | (v46 << 32));
      unint64_t v116 = &v111;
    }

    else
    {
      uint64_t v44 = 0LL;
      uint64_t v49 = &v111;
      unint64_t v116 = &v111;
      if (v43 != 2)
      {
        if (v43 != 1)
        {
          if ((v111 & 3) != 0)
          {
            uint64_t v112 = &v111;
          }

          else
          {
            uint64_t v117 = 0LL;
            uint64_t v112 = &v111;
            uint64_t v113 = 0LL;
          }

          goto LABEL_113;
        }

        goto LABEL_94;
      }
    }

    uint64_t v117 = (uint64_t)v44;
    unsigned int v118 = v49;
    uint64_t v119 = v43;
    uint64_t v112 = &v111;
    uint64_t v113 = v44;
    unint64_t v114 = v49;
    uint64_t v115 = v43;
    goto LABEL_113;
  }

  v44 += 2 * *v44 + 2;
  unint64_t v116 = &v111;
LABEL_94:
  uint64_t v117 = (uint64_t)v44;
  uint64_t v112 = &v111;
  uint64_t v113 = v44;
LABEL_113:
  list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::iteratorImpl( (uint64_t)&v94,  (uint64_t)&v116,  (uint64_t)&v112,  v42);
  uint64_t v10 = (Method *)malloc(8LL * (v29 + 1));
  unsigned int v35 = 0;
  while (1)
  {
    char v58 = v99;
    if (v99 != v94) {
      goto LABEL_126;
    }
    unint64_t v59 = *v99 & 3;
    if (v59 == 2) {
      break;
    }
    if (v59 <= 1)
    {
      uint64_t v60 = (uint64_t *)v100;
      unint64_t v61 = v95;
      goto LABEL_119;
    }

LABEL_126:
    unsigned int v64 = v35 + 1;
    uint64_t v66 = v107;
    unint64_t v65 = v108;
    v10[v35] = (Method)v108;
    unint64_t v108 = v65 + v66;
    HIDWORD(v107) = HIDWORD(v66) + 1;
    ++v35;
    if (v108 == v110)
    {
      uint64_t v67 = *v58;
      uint64_t v68 = *v58 & 3;
      if (v68 == 1)
      {
        v100 += 2;
        uint64_t v67 = *v58;
      }

      else if (!v68)
      {
        uint64_t v100 = 0LL;
      }

      if ((v67 & 3) == 2)
      {
        unsigned int v69 = v103;
        int v70 = v102;
        unint64_t v71 = (uint64_t *)((char *)v103 + v101);
        v103 = v71;
        uint64_t v73 = *v100;
        uint64_t v72 = v100[1];
        unint64_t v74 = v72 * (unint64_t)v73;
        ++v102;
        if ((v74 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v55, v56, v57, v72, v100, v73);
        }
        unint64_t v75 = (unint64_t)v100 + v74 + 8;
        if ((unint64_t)v71 < v75)
        {
          int v76 = v70 + 2;
          do
          {
            v103 = (uint64_t *)((char *)v69 + 2 * v101);
            int v102 = v76++;
            unsigned int v69 = (uint64_t *)((char *)v69 + v101);
          }

          while ((unint64_t)v69 + v101 < v75);
        }
      }

      list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::skipEmptyLists(&v99);
      uint64_t v77 = *v99 & 3;
      if (v99 == v104)
      {
        if (v77 == 2)
        {
          uint64_t v80 = v103;
          unsigned int v35 = v64;
          if (v103 != v106) {
            goto LABEL_153;
          }
        }

        else if (v77 == 1)
        {
          unint64_t v79 = v100;
          unsigned int v35 = v64;
          if (v100 != v105) {
            goto LABEL_151;
          }
        }

        else
        {
          if (v77) {
            goto LABEL_147;
          }
          uint64_t v78 = v100;
          unsigned int v35 = v64;
          if (v100 != v105) {
            goto LABEL_154;
          }
        }
      }

      else
      {
        if (v77 == 2)
        {
          uint64_t v80 = v103;
LABEL_153:
          uint64_t v78 = (unsigned int *)((char *)v80 + (*v80 >> 16));
          goto LABEL_154;
        }

        if (v77 == 1)
        {
          unint64_t v79 = v100;
LABEL_151:
          uint64_t v78 = *(unsigned int **)v79;
          goto LABEL_154;
        }

        if (v77)
        {
LABEL_147:
          uint64_t v78 = 0LL;
          goto LABEL_154;
        }

        uint64_t v78 = v100;
LABEL_154:
        unsigned int v81 = *v78;
        uint64_t v107 = (unsigned __int16)*v78 & 0xFFFC;
        unint64_t v108 = (unint64_t)(v78 + 2) & 0xFFFFFFFFFFFFFFFCLL | ((unint64_t)v81 >> 31);
        uint64_t v82 = *v99 & 3;
        if (v82 == 2)
        {
          uint64_t v83 = (int *)((char *)v103 + (*v103 >> 16));
        }

        else if (v82 == 1)
        {
          uint64_t v83 = *(int **)v100;
        }

        else if (v82)
        {
          uint64_t v83 = 0LL;
        }

        else
        {
          uint64_t v83 = (int *)v100;
        }

        unint64_t v109 = entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd( v83,  v55,  v56,  v57);
        uint64_t v110 = v55;
        unsigned int v35 = v64;
        if (v108 == v55)
        {
          uint64_t v84 = *v99 & 3;
          if (v84 == 2)
          {
            uint64_t v85 = (unsigned int *)((char *)v103 + (*v103 >> 16));
          }

          else if (v84 == 1)
          {
            uint64_t v85 = *(unsigned int **)v100;
          }

          else if (v84)
          {
            uint64_t v85 = 0LL;
          }

          else
          {
            uint64_t v85 = v100;
          }

          _objc_fatal( "Assertion failed: (%s) - empty list %p encountered during iteration",  v55,  v56,  v57,  "m != mEnd",  v85);
        }
      }
    }
  }

  uint64_t v60 = v103;
  unint64_t v61 = (unint64_t)v97;
LABEL_119:
  if (v99 != v104 || (v59 == 2 ? (uint64_t v62 = v103, v63 = v106) : (uint64_t v62 = (uint64_t *)v100, v63 = (uint64_t *)v105), v62 != v63))
  {
    if (v108 != v98) {
      goto LABEL_126;
    }
  }

  v10[v35] = 0LL;
  if (v5) {
LABEL_167:
  }
    *unsigned int v5 = v35;
LABEL_168:
  int v86 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v87 = __ldxr(runtimeLock);
    if (v87 != v86) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v10;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v10;
}

void sub_180032F68(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  if (!cls)
  {
    unsigned int v7 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v7;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  uint64_t v8 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  uint64_t v9 = (void *)(v8 & 0xFFFFFFFFFFFFFFFELL);
  if ((v8 & 1) != 0) {
    uint64_t v9 = (void *)*v9;
  }
  uint64_t v10 = (unsigned int *)v9[6];
  if (!v10 || (uint64_t v11 = v10[1], !(_DWORD)v11))
  {
    unsigned int v19 = 0;
    unsigned int v7 = 0LL;
    if (!outCount) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  unint64_t v12 = (Ivar *)malloc(8LL * (v11 + 1));
  uint64_t v16 = *v10;
  unint64_t v17 = v16 * (unint64_t)v11;
  if ((v17 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v13, v14, v15, v11, v10, v16);
  }
  unsigned int v7 = v12;
  if ((_DWORD)v17)
  {
    uint64_t v18 = 0LL;
    unsigned int v19 = 0;
    __int32 v20 = v10 + 2;
    do
    {
      v18 += v16;
    }

    while (v17 != v18);
  }

  else
  {
    unsigned int v19 = 0;
  }

  v12[v19] = 0LL;
  if (outCount) {
LABEL_21:
  }
    *outCount = v19;
LABEL_22:
  int v21 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v22 = __ldxr(runtimeLock);
    if (v22 != v21) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v7;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v7;
}

void sub_180033124(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  if (!cls)
  {
    uint64_t v11 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v11;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v12 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v12)
    || (*(void *)(qword_18C43FCC0 + 16 * v12) <= (unint64_t)cls
      ? (BOOL v13 = *(void *)(qword_18C43FCC0 + 16 * v12 + 8) > (unint64_t)cls)
      : (BOOL v13 = 0),
        !v13))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, v54, (unsigned int *)v2) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v55, v2, (char *)v3, cls);
    }
  }

  uint64_t v14 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
  if ((v14 & 1) != 0)
  {
    unint64_t v17 = *(void *)(v15 + 16);
  }

  else
  {
    unint64_t v60 = 0LL;
    uint64_t v16 = *(void *)(v15 + 64);
    unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
    if ((v16 & 1) != 0 || !v17)
    {
      uint64_t v18 = v16 & 1;
      if (v17) {
        BOOL v19 = v18 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19)
      {
        BOOL v20 = 0;
        uint64_t v21 = 0LL;
        unsigned int v22 = 0LL;
        uint64_t v23 = 0LL;
        BOOL v24 = 1;
        char v25 = 1;
        goto LABEL_54;
      }

      v17 |= 2uLL;
    }
  }

  unint64_t v60 = v17;
  unint64_t v26 = v17 & 3;
  BOOL v20 = v26 != 0;
  BOOL v27 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
  uint64_t v5 = (v17 & 0xFFFFFFFFFFFFFFFCLL) == 0 || (v17 & 3) != 0;
  if ((_DWORD)v5 != 1)
  {
    uint64_t v21 = 0LL;
    uint64_t v23 = 0LL;
    unsigned int v22 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_53:
    char v25 = v5 ^ 1;
    BOOL v24 = v26 != 2;
    goto LABEL_54;
  }

  if (v17 >= 4)
  {
    if (v26 != 1 || v27 == 0LL)
    {
      if (v26 == 2) {
        unsigned int v22 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
      }
      else {
        unsigned int v22 = 0LL;
      }
      if (v22)
      {
        if (DisablePreattachedCategories)
        {
          uint64_t v30 = *v22;
          uint64_t v29 = v22[1];
          unint64_t v56 = v29 * (unint64_t)v30;
          if ((v56 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_103;
          }
          int v4 = (uint64_t *)((char *)v22 + v56 + 8);
          BOOL v57 = (_DWORD)v29 == 0;
          if ((_DWORD)v29) {
            uint64_t v29 = v29;
          }
          else {
            uint64_t v29 = 0LL;
          }
          if (!v57) {
            int v4 = (uint64_t *)((char *)v4 - v30);
          }
        }

        else
        {
          int v4 = (uint64_t *)(v22 + 2);
          uint64_t v30 = *v22;
          uint64_t v29 = v22[1];
        }

        unint64_t v31 = v29 * (unint64_t)v30;
        if ((v31 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_103;
        }
        unint64_t v32 = (unint64_t)v22 + v31 + 8;
        if ((unint64_t)v4 < v32)
        {
          while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v4 + 8) & 1) == 0)
          {
            int v4 = (uint64_t *)((char *)v4 + v30);
            unsigned int v33 = v30;
          }
        }

        unsigned int v33 = v30;
LABEL_90:
        uint64_t v21 = v33;
      }

      else
      {
        uint64_t v21 = 0LL;
      }
    }

    else
    {
      uint64_t v21 = 0LL;
      unsigned int v22 = v27 + 2;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
    unsigned int v22 = 0LL;
  }

  char v25 = v26 != 1;
  if (v26 == 1 && v27)
  {
    uint64_t v23 = (uint64_t)&v27[2 * *v27 + 2];
    goto LABEL_53;
  }

  uint64_t v23 = 0LL;
  BOOL v19 = v26 == 2;
  BOOL v24 = v26 != 2;
  if (v19 && v27)
  {
    uint64_t v30 = *v27;
    uint64_t v29 = v27[1];
    unint64_t v53 = v29 * (unint64_t)v30;
    if ((v53 & 0xFFFFFFFF00000000LL) != 0)
    {
      unsigned int v22 = v27;
      goto LABEL_103;
    }

    BOOL v24 = 0;
    uint64_t v5 = (uint64_t)v27 + v53 + 8;
    uint64_t v23 = (uint64_t)v27;
  }

LABEL_70:
  if (v34)
  {
    uint64_t v11 = (objc_property_t *)malloc(8LL * (v34 + 1));
    list_array_tt<property_t,property_list_t,RawPtr>::begin((uint64_t)v59, &v60, v40, v41);
    list_array_tt<property_t,property_list_t,RawPtr>::end((uint64_t)v58, &v60, v42, v43);
    for (unsigned int i = 0; ; ++i)
    {
      BOOL v45 = list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v59,  v58);
      uint64_t v49 = i;
      if (v45) {
        break;
      }
      v11[v49] = (objc_property_t)v59[9];
      list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::operator++(v59, v46, v47, v48);
    }

    v11[i] = 0LL;
    if (outCount) {
      goto LABEL_75;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    unsigned int i = 0;
    if (outCount) {
LABEL_75:
    }
      *outCount = i;
  }

  int v50 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v51 = __ldxr(runtimeLock);
    if (v51 != v50) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v11;
}

      free(*(void **)&v16[1]);
      *uint64_t v16 = (int32x2_t)2LL;
      qword_18C43F110 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F110, (int32x2_t)0x1FFFFFFFFLL);
      objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::compact();
    }
  }

  else
  {
    LOBYTE(v14) = (_BYTE)policy;
    unsigned int v22 = v8;
  }

  char v25 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unint64_t v26 = __ldxr((unsigned int *)&AssociationsManagerLock);
    if (v26 != v25) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
  if (v22) {
    goto LABEL_63;
  }
}

void sub_1800335B0(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  int v4 = outCount;
  if (!cls)
  {
    unsigned int v9 = 0LL;
    if (outCount) {
      *outCount = 0;
    }
    return v9;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v7, runtimeLock)) {
      goto LABEL_9;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_9:
  uint64_t v10 = (uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL;
  unint64_t v11 = *(void *)(v10 + 8);
  unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
  if ((v11 & 1) != 0)
  {
    unint64_t v14 = *(void *)(v12 + 24);
    goto LABEL_19;
  }

  unint64_t v57 = 0LL;
  uint64_t v13 = *(void *)(v12 + 40);
  unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
  if ((v13 & 1) == 0 && v14) {
    goto LABEL_19;
  }
  uint64_t v15 = v13 & 1;
  if (v14) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v14 |= 2uLL;
LABEL_19:
    unint64_t v57 = v14;
    goto LABEL_20;
  }

  unint64_t v14 = 0LL;
LABEL_20:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)v10 & 0x80000000) == 0
    || (uint64_t v17 = *(unsigned __int16 *)(v10 + 4), qword_18C43FCC8 <= v17)
    || (*(void *)(qword_18C43FCC0 + 16 * v17) <= (unint64_t)cls
      ? (BOOL v18 = *(void *)(qword_18C43FCC0 + 16 * v17 + 8) > (unint64_t)cls)
      : (BOOL v18 = 0),
        !v18))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, (uint64_t)outCount, (unsigned int *)v2) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", (uint64_t)outCount, v2, v3, cls);
    }
  }

  unint64_t v19 = v14 & 3;
  BOOL v20 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
  uint64_t v21 = (v14 & 0xFFFFFFFFFFFFFFFCLL) == 0 || (v14 & 3) != 0;
  if ((_DWORD)v21 != 1)
  {
    uint64_t v22 = 0LL;
    unint64_t v24 = 0LL;
    uint64_t v23 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_54:
    char v31 = v21 ^ 1;
    goto LABEL_55;
  }

  if (v14 >= 4)
  {
    if (v19 != 1 || v20 == 0LL)
    {
      if (v19 == 2) {
        uint64_t v23 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
      }
      else {
        uint64_t v23 = 0LL;
      }
      if (v23)
      {
        if (DisablePreattachedCategories)
        {
          uint64_t v26 = *v23;
          uint64_t v27 = v23[1];
          unint64_t v52 = v27 * (unint64_t)v26;
          if ((v52 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_107;
          }
          unint64_t v11 = (unint64_t)v23 + v52 + 8;
          BOOL v53 = (_DWORD)v27 == 0;
          if ((_DWORD)v27) {
            uint64_t v27 = v27;
          }
          else {
            uint64_t v27 = 0LL;
          }
          if (!v53) {
            v11 -= v26;
          }
        }

        else
        {
          unint64_t v11 = (unint64_t)(v23 + 2);
          uint64_t v26 = *v23;
          uint64_t v27 = v23[1];
        }

        unint64_t v28 = v27 * (unint64_t)v26;
        if ((v28 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_107;
        }
        unint64_t v29 = (unint64_t)v23 + v28 + 8;
        if (v11 < v29)
        {
          while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v11 + 8) & 1) == 0)
          {
            v11 += v26;
            unsigned int v30 = v26;
            if (v11 >= v29) {
              goto LABEL_94;
            }
          }
        }

        unsigned int v30 = v26;
LABEL_94:
        uint64_t v22 = v30;
      }

      else
      {
        uint64_t v22 = 0LL;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = v20 + 2;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
  }

  char v31 = v19 != 1;
  if (v19 == 1 && v20)
  {
    unint64_t v24 = (unint64_t)&v20[2 * *v20 + 2];
    goto LABEL_54;
  }

  unint64_t v24 = 0LL;
  if (v20 && v19 == 2)
  {
    uint64_t v26 = *v20;
    uint64_t v27 = v20[1];
    unint64_t v51 = v27 * (unint64_t)v26;
    if ((v51 & 0xFFFFFFFF00000000LL) != 0)
    {
      uint64_t v23 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFFCLL);
      goto LABEL_107;
    }

    uint64_t v21 = (uint64_t)v20 + v51 + 8;
    unint64_t v24 = v14 & 0xFFFFFFFFFFFFFFFCLL;
  }

LABEL_55:
  int v32 = 0;
  if ((v14 & 3) != 0) {
    goto LABEL_58;
  }
LABEL_56:
  if (v23 != (unsigned int *)v24)
  {
    unsigned int v33 = *(void **)v23;
    uint64_t v23 = 0LL;
    while (1)
    {
      while (1)
      {
        v32 += (int)v33;
        if ((v14 & 3) == 0) {
          goto LABEL_56;
        }
LABEL_58:
        if ((v31 & 1) != 0) {
          break;
        }
        uint64_t v36 = *(void **)v23;
        v23 += 2;
        unsigned int v33 = (void *)*v36;
      }

      if (v11 == v21) {
        goto LABEL_69;
      }
      uint64_t v27 = v23[1];
      outCount = (unsigned int *)(v27 * (unint64_t)*v23);
      unsigned int v33 = *(void **)((*(uint64_t *)v11 >> 16) + v11);
      unint64_t v34 = (unint64_t)v23 + outCount + 8;
      unsigned int v35 = (uint64_t *)(v11 + v22);
      do
      {
        unint64_t v11 = (unint64_t)v35;
        uint64_t v2 = *(char **)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v35 + 8);
        unsigned int v35 = (uint64_t *)((char *)v35 + v22);
      }

      while ((v2 & 1) == 0);
    }

    uint64_t v26 = *v23;
LABEL_107:
    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)outCount,  v2,  v3,  v27,  v23,  v26);
  }

LABEL_69:
  if (v32)
  {
    unsigned int v9 = (Protocol **)malloc(8LL * (v32 + 1));
    list_array_tt<unsigned long,protocol_list_t,RawPtr>::begin((uint64_t)v55, &v57, v37, v38);
    list_array_tt<unsigned long,protocol_list_t,RawPtr>::end((uint64_t)v54, &v57, v39, v40);
    unsigned int v41 = 0;
    while (!list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator==((uint64_t)v55, v54))
    {
      uint64_t v45 = *v56;
      if (canonical_protocol) {
        int v46 = 0;
      }
      else {
        int v46 = 0x20000000;
      }
      if ((v46 & *(_DWORD *)(*v56 + 68)) == 0)
      {
        uint64_t Protocol = getProtocol(*(const char **)(v45 + 8));
        if (Protocol) {
          uint64_t v45 = Protocol;
        }
      }

      v9[v41] = (Protocol *)v45;
      list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator++(v55, v42, v43, v44);
      ++v41;
    }

    v9[v41] = 0LL;
    if (v4) {
      goto LABEL_80;
    }
  }

  else
  {
    unsigned int v9 = 0LL;
    unsigned int v41 = 0;
    if (v4) {
LABEL_80:
    }
      *int v4 = v41;
  }

  int v48 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v49 = __ldxr(runtimeLock);
    if (v49 != v48) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v9;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v9;
}

  free(v11);
}

void sub_180033A50(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

const char **__cdecl objc_copyImageNames(unsigned int *outCount)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v1 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v1, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  unint64_t v3 = (void *)FirstHeader;
  if (FirstHeader)
  {
    int v4 = 0LL;
    unsigned int v5 = 0LL;
    int v6 = 0LL;
    do
    {
      unsigned int v7 = (char *)v3 + *v3;
      if (v5 >= v6)
      {
        uint64_t v9 = (v5 - v4) >> 3;
        unint64_t v10 = v9 + 1;
        if ((v6 - v4) >> 2 > v10) {
          unint64_t v10 = (v6 - v4) >> 2;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11)
        {
          if (v11 >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v12 = (char *)malloc(8 * v11);
        }

        else
        {
          unint64_t v12 = 0LL;
        }

        uint64_t v13 = &v12[8 * v9];
        *(void *)uint64_t v13 = v7;
        uint64_t v8 = v13 + 8;
        while (v5 != v4)
        {
          uint64_t v14 = *((void *)v5 - 1);
          v5 -= 8;
          *((void *)v13 - 1) = v14;
          v13 -= 8;
        }

        int v6 = &v12[8 * v11];
        if (v4) {
          free(v4);
        }
        int v4 = v13;
      }

      else
      {
        *(void *)unsigned int v5 = v7;
        uint64_t v8 = v5 + 8;
      }

      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v3);
      BOOL v16 = v3 + 3;
      if (PreoptimizedHeaderRW) {
        BOOL v16 = (void *)PreoptimizedHeaderRW;
      }
      unsigned int v5 = v8;
      unint64_t v3 = (void *)(*v16 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v3);
  }

  else
  {
    int v4 = 0LL;
    uint64_t v8 = 0LL;
  }

  int v17 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v18 = __ldxr(runtimeLock);
    if (v18 != v17) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      goto LABEL_36;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_36:
  unint64_t v19 = malloc(v8 - v4 + 8);
  if (v4 == v8) {
    goto LABEL_42;
  }
  unsigned int v20 = 0;
  uint64_t v21 = v4;
  do
  {
    uint64_t v22 = dyld_image_path_containing_address();
    if (v22) {
      v19[v20++] = v22;
    }
    v21 += 8;
  }

  while (v21 != v8);
  v19[v20] = 0LL;
  if (!v20)
  {
LABEL_42:
    free(v19);
    unsigned int v20 = 0;
    unint64_t v19 = 0LL;
  }

  if (outCount) {
    *outCount = v20;
  }
  if (v4) {
    free(v4);
  }
  return (const char **)v19;
}

void sub_180033CB0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  int v13 = *(_DWORD *)(a10 + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(v10);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, v10)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  if (v11) {
    free(v11);
  }
  _Unwind_Resume(exception_object);
}

void *copyClassNamesForImage_nolock(header_info *a1, unsigned int *a2)
{
  unint64_t v3 = (unint64_t *)header_info::classlist(a1, &v15);
  unint64_t v4 = v15;
  unsigned int v5 = malloc(8 * v15 + 8);
  int v6 = v5;
  if (v4)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = v5;
    unint64_t v9 = v4;
    do
    {
      unint64_t v10 = (objc_class *)remapClass(*v3);
      if (v10) {
        v8[-v7] = objc_class::demangledName(v10, 0LL, v11, v12);
      }
      else {
        ++v7;
      }
      ++v8;
      ++v3;
      --v9;
    }

    while (v9);
    uint64_t v13 = v4 - v7;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  v6[v13] = 0LL;
  if (a2) {
    *a2 = v13;
  }
  return v6;
}

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  if (!image)
  {
    if (!outCount) {
      return 0LL;
    }
LABEL_78:
    BOOL result = 0LL;
    *outCount = 0;
    return result;
  }

  unint64_t v34 = outCount;
  unsigned int v35 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
    unsigned int v3 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v3, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    unsigned int v5 = (void *)FirstHeader;
    if (FirstHeader)
    {
      int v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      do
      {
        if (_dyld_get_image_uuid())
        {
          unint64_t v9 = (header_info *)((char *)v5 + *v5);
          if (v7 >= (header_info **)v8)
          {
            unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v7 - v6) + 1;
            if (v10 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            else {
              unint64_t v11 = v10;
            }
            if (v11)
            {
              if (v11 > 0xAAAAAAAAAAAAAAALL) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              unint64_t v12 = (char *)malloc(24 * v11);
            }

            else
            {
              unint64_t v12 = 0LL;
            }

            uint64_t v13 = &v12[8 * (v7 - v6)];
            *(void *)uint64_t v13 = v9;
            *(_OWORD *)(v13 + 8) = v37;
            if (v7 == v6)
            {
              unint64_t v15 = &v12[8 * (v7 - v6)];
            }

            else
            {
              unsigned int v14 = &v12[8 * (v7 - v6)];
              do
              {
                unint64_t v15 = v14 - 24;
                __int128 v16 = *(_OWORD *)(v7 - 3);
                *((void *)v14 - 1) = *(v7 - 1);
                *(_OWORD *)(v14 - 24) = v16;
                v7 -= 3;
                v14 -= 24;
              }

              while (v7 != v6);
            }

            uint64_t v8 = &v12[24 * v11];
            uint64_t v7 = (header_info **)(v13 + 24);
            if (v6) {
              free(v6);
            }
            int v6 = (header_info **)v15;
          }

          else
          {
            *uint64_t v7 = v9;
            *(_OWORD *)(v7 + 1) = v37;
            v7 += 3;
          }
        }

        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v5);
        unsigned int v18 = v5 + 3;
        if (PreoptimizedHeaderRW) {
          unsigned int v18 = (void *)PreoptimizedHeaderRW;
        }
        unsigned int v5 = (void *)(*v18 & 0xFFFFFFFFFFFFFFFCLL);
      }

      while (v5);
    }

    else
    {
      uint64_t v7 = 0LL;
      int v6 = 0LL;
    }

    int v19 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v20 = __ldxr(runtimeLock);
      if (v20 != v19) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        goto LABEL_41;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_41:
    uint64_t v21 = v6;
    if (v6 == v7) {
      goto LABEL_45;
    }
    while (1)
    {
      uint64_t v22 = (const char *)dyld_image_path_containing_address();
      if (v22)
      {
        if (!strcmp(v22, image)) {
          break;
        }
      }

      v21 += 3;
      if (v21 == v7) {
        goto LABEL_45;
      }
    }

    if (v21 == v7)
    {
LABEL_45:
      int v23 = 1;
    }

    else
    {
      unint64_t v24 = *v21;
      unsigned int v25 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v25, runtimeLock)) {
          goto LABEL_56;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_56:
      uint64_t v27 = (header_info *)FirstHeader;
      if (!FirstHeader) {
        goto LABEL_67;
      }
      while (v24 != (header_info *)((char *)v27 + *(void *)v27))
      {
        uint64_t v28 = getPreoptimizedHeaderRW((uint64_t)v27);
        unint64_t v29 = (void *)((char *)v27 + 24);
        if (v28) {
          unint64_t v29 = (void *)v28;
        }
        uint64_t v27 = (header_info *)(*v29 & 0xFFFFFFFFFFFFFFFCLL);
        if (!v27) {
          goto LABEL_67;
        }
      }

      if (_dyld_get_image_uuid()
        && ((header_info *)v37 == v21[1] ? (BOOL v30 = *((void *)&v37 + 1) == (void)v21[2]) : (BOOL v30 = 0), v30))
      {
        unsigned int v35 = (const char **)copyClassNamesForImage_nolock(v27, v34);
        int v23 = 1;
      }

      else
      {
LABEL_67:
        int v23 = 0;
      }

      int v31 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v32 = __ldxr(runtimeLock);
        if (v32 != v31) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          goto LABEL_46;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    }

void sub_18003416C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v15 = *(_DWORD *)(a12 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v12);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v12)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  if (v13) {
    free(v13);
  }
  _Unwind_Resume(exception_object);
}

void *objc_copyClassesForImage(const char *a1, _DWORD *a2)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!a2) {
      return 0LL;
    }
LABEL_88:
    BOOL result = 0LL;
    *a2 = 0;
    return result;
  }

  uint64_t v42 = a2;
  uint64_t v43 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
    unsigned int v3 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v3, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    unsigned int v5 = (void *)FirstHeader;
    if (FirstHeader)
    {
      int v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      do
      {
        if (_dyld_get_image_uuid())
        {
          unint64_t v9 = (header_info *)((char *)v5 + *v5);
          *(_OWORD *)uint64_t v45 = v46;
          if (v7 >= (header_info **)v8)
          {
            unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v7 - v6) + 1;
            if (v10 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            else {
              unint64_t v11 = v10;
            }
            if (v11)
            {
              if (v11 > 0xAAAAAAAAAAAAAAALL) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              unint64_t v12 = (char *)malloc(24 * v11);
            }

            else
            {
              unint64_t v12 = 0LL;
            }

            uint64_t v13 = &v12[8 * (v7 - v6)];
            *(void *)uint64_t v13 = v9;
            *(_OWORD *)(v13 + 8) = v46;
            if (v7 == v6)
            {
              int v15 = &v12[8 * (v7 - v6)];
            }

            else
            {
              unsigned int v14 = &v12[8 * (v7 - v6)];
              do
              {
                int v15 = v14 - 24;
                __int128 v16 = *(_OWORD *)(v7 - 3);
                *((void *)v14 - 1) = *(v7 - 1);
                *(_OWORD *)(v14 - 24) = v16;
                v7 -= 3;
                v14 -= 24;
              }

              while (v7 != v6);
            }

            uint64_t v8 = &v12[24 * v11];
            uint64_t v7 = (header_info **)(v13 + 24);
            if (v6) {
              free(v6);
            }
            int v6 = (header_info **)v15;
          }

          else
          {
            *uint64_t v7 = v9;
            *(_OWORD *)(v7 + 1) = *(_OWORD *)v45;
            v7 += 3;
          }
        }

        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v5);
        unsigned int v18 = v5 + 3;
        if (PreoptimizedHeaderRW) {
          unsigned int v18 = (void *)PreoptimizedHeaderRW;
        }
        unsigned int v5 = (void *)(*v18 & 0xFFFFFFFFFFFFFFFCLL);
      }

      while (v5);
    }

    else
    {
      uint64_t v7 = 0LL;
      int v6 = 0LL;
    }

    int v19 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v20 = __ldxr(runtimeLock);
      if (v20 != v19) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        goto LABEL_41;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_41:
    uint64_t v21 = v6;
    if (v6 == v7) {
      goto LABEL_45;
    }
    while (1)
    {
      uint64_t v22 = (const char *)dyld_image_path_containing_address();
      if (v22)
      {
        if (!strcmp(v22, a1)) {
          break;
        }
      }

      v21 += 3;
      if (v21 == v7) {
        goto LABEL_45;
      }
    }

    if (v21 == v7)
    {
LABEL_45:
      int v23 = 1;
    }

    else
    {
      unint64_t v24 = *v21;
      unsigned int v25 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v25, runtimeLock)) {
          goto LABEL_56;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_56:
      uint64_t v27 = (header_info *)FirstHeader;
      if (!FirstHeader) {
        goto LABEL_67;
      }
      while (v24 != (header_info *)((char *)v27 + *(void *)v27))
      {
        uint64_t v28 = getPreoptimizedHeaderRW((uint64_t)v27);
        unint64_t v29 = (void *)((char *)v27 + 24);
        if (v28) {
          unint64_t v29 = (void *)v28;
        }
        uint64_t v27 = (header_info *)(*v29 & 0xFFFFFFFFFFFFFFFCLL);
        if (!v27) {
          goto LABEL_67;
        }
      }

      if (_dyld_get_image_uuid()
        && ((header_info *)v46 == v21[1] ? (BOOL v30 = *((void *)&v46 + 1) == (void)v21[2]) : (BOOL v30 = 0), v30))
      {
        unsigned int v33 = (unint64_t *)header_info::classlist(v27, v45);
        unint64_t v34 = v45[0];
        unsigned int v35 = malloc(8 * v45[0] + 8);
        uint64_t v43 = v35;
        if (v34)
        {
          uint64_t v36 = 0LL;
          __int128 v37 = v35;
          unint64_t v38 = v34;
          do
          {
            unint64_t v39 = remapClass(*v33);
            if (v39) {
              v37[-v36] = v39;
            }
            else {
              ++v36;
            }
            ++v37;
            ++v33;
            --v34;
          }

          while (v34);
          uint64_t v40 = v38 - v36;
          unsigned int v35 = v43;
        }

        else
        {
          uint64_t v40 = 0LL;
        }

        v35[v40] = 0LL;
        if (v42) {
          _DWORD *v42 = v40;
        }
        int v23 = 1;
      }

      else
      {
LABEL_67:
        int v23 = 0;
      }

      int v31 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v32 = __ldxr(runtimeLock);
        if (v32 != v31) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          goto LABEL_46;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    }

void sub_180034600( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v15 = *(_DWORD *)(a12 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v12);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v12)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  if (v13) {
    free(v13);
  }
  _Unwind_Resume(exception_object);
}

void *objc_copyClassNamesForImageHeader(header_info *a1, unsigned int *a2)
{
  if (a1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v5, runtimeLock)) {
        goto LABEL_9;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_9:
    uint64_t v8 = (header_info *)FirstHeader;
    if (FirstHeader)
    {
      while ((header_info *)((char *)v8 + *(void *)v8) != a1)
      {
        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v8);
        unint64_t v10 = (void *)((char *)v8 + 24);
        if (PreoptimizedHeaderRW) {
          unint64_t v10 = (void *)PreoptimizedHeaderRW;
        }
        uint64_t v8 = (header_info *)(*v10 & 0xFFFFFFFFFFFFFFFCLL);
        if (!v8) {
          goto LABEL_14;
        }
      }

      uint64_t v7 = copyClassNamesForImage_nolock(v8, a2);
    }

    else
    {
LABEL_14:
      uint64_t v7 = 0LL;
      if (a2) {
        *a2 = 0;
      }
    }

    int v11 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v12 = __ldxr(runtimeLock);
      if (v12 != v11) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return v7;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  else
  {
    uint64_t v7 = 0LL;
    if (a2) {
      *a2 = 0;
    }
  }

  return v7;
}

void sub_180034784(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

const char *__cdecl class_getName(Class cls)
{
  if (cls) {
    return (const char *)objc_class::demangledName(cls, 1LL, v1, v2);
  }
  else {
    return "nil";
  }
}

const char *objc_debug_class_getNameRaw(objc_class *a1, uint64_t a2, const char *a3, char *a4)
{
  if (!a1) {
    return "nil";
  }
  Class isa = a1[4].isa;
  unsigned int v5 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)isa & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    unsigned int v5 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
    if ((v6 & 1) != 0) {
      unsigned int v5 = (void *)*v5;
    }
  }

  unint64_t v7 = atomic_load(v5 + 3);
  if (!v7) {
    return (const char *)objc_class::installMangledNameForLazilyNamedClass(a1, a2, a3, a4);
  }
  return (const char *)v7;
}

int class_getVersion(Class cls)
{
  if (cls)
  {
    uint64_t v1 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    if ((v1 & 1) != 0 && (unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFELL) != 0) {
      LODWORD(cls) = *(_DWORD *)(v2 + 40);
    }
    else {
      LODWORD(cls) = (HIWORD(cls[3].isa) << 29 >> 31) & 7;
    }
  }

  return (int)cls;
}

void class_setVersion(Class cls, int version)
{
  if (cls)
  {
    uint64_t v4 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    if ((v4 & 1) == 0 || (unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL, (v4 & 0xFFFFFFFFFFFFFFFELL) == 0))
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v7 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v7, runtimeLock)) {
          goto LABEL_9;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_9:
      uint64_t v9 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
      unint64_t v5 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((v9 & 1) == 0) {
        unint64_t v5 = class_rw_t::extAlloc((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL, v9 & 0xFFFFFFFFFFFFFFFELL, 0);
      }
      int v10 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v11 = __ldxr(runtimeLock);
        if (v11 != v10) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          goto LABEL_16;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
    }

void sub_180034938(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t objc_class::getLoadMethod(objc_class *this, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v4 = *(void *)((*(void *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL) + 8);
  unsigned int v5 = (void *)(v4 & 0xFFFFFFFFFFFFFFFELL);
  if ((v4 & 1) != 0) {
    unsigned int v5 = (void *)*v5;
  }
  uint64_t v6 = v5[4];
  unsigned int v7 = (unsigned int *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  if ((v6 & 1) != 0 || !v7)
  {
    uint64_t v22 = v6 & 1;
    if (v7) {
      BOOL v23 = v22 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23) {
      return 0LL;
    }
    uint64_t v24 = *v7;
    uint64_t v25 = v7[1];
    unint64_t v26 = v25 * (unint64_t)v24;
    if ((v26 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v25, v7, v24);
    }
    uint64_t v27 = (unsigned __int16 *)(v7 + 2);
    uint64_t v28 = (unsigned __int16 *)((char *)v7 + v26 + 8);
    if (DisablePreattachedCategories)
    {
      if (!(_DWORD)v25) {
        return 0LL;
      }
      uint64_t v27 = (unsigned __int16 *)((char *)v28 - v24);
    }

    for (; v27 < v28; uint64_t v27 = (unsigned __int16 *)((char *)v27 + v24))
    {
      if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v27 + 8) & 1) != 0) {
        break;
      }
    }

    if (v28 == v27) {
      return 0LL;
    }
    uint64_t v29 = -v24;
    do
      uint64_t v28 = (unsigned __int16 *)((char *)v28 + v29);
    while ((*(void *)(objc_debug_headerInfoRWs + 8LL * (unsigned __int16)*(void *)v28 + 8) & 1) == 0);
    unsigned int v7 = (unsigned int *)((char *)v28 + (*(uint64_t *)v28 >> 16));
    if (!v7) {
      return 0LL;
    }
    unint64_t v30 = *v7;
    uint64_t v9 = (unsigned __int16)v30 & 0xFFFC;
    if ((v30 & 0x80000000) == 0LL) {
      int v31 = 24;
    }
    else {
      int v31 = 12;
    }
    unint64_t v32 = v30 >> 31;
    if ((~(_DWORD)v30 & 3) != 0 || (_DWORD)v9 != v31)
    {
      if ((v30 & 0x80000000) != 0)
      {
        if (dataSegmentsRanges <= (unint64_t)v7 && *(void *)algn_18C43FCB8 > (unint64_t)v7)
        {
          if (dataSegmentsRanges > (unint64_t)sel_load
            || *(void *)algn_18C43FCB8 <= (unint64_t)sel_load)
          {
            return 0LL;
          }

          uint64_t v110 = v7[1];
          unint64_t v138 = v110 * (unint64_t)v9;
          if ((v138 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_237;
          }
          unint64_t v139 = (unint64_t)(v7 + 2);
          unint64_t v140 = v139 & 0xFFFFFFFFFFFFFFFCLL | v32;
          unint64_t v141 = (v139 + v138) & 0xFFFFFFFFFFFFFFFCLL | v32;
          if (v140 == v141) {
            return 0LL;
          }
          uint64_t v142 = 0LL;
          while (1)
          {
            unint64_t v17 = v140 + v142;
            v142 += v9;
            if (v140 + v142 == v141) {
              return 0LL;
            }
          }
        }

        else
        {
          uint64_t v110 = v7[1];
          unint64_t v133 = v110 * (unint64_t)v9;
          if ((v133 & 0xFFFFFFFF00000000LL) != 0) {
            goto LABEL_237;
          }
          unint64_t v134 = (unint64_t)(v7 + 2);
          unint64_t v135 = v134 & 0xFFFFFFFFFFFFFFFCLL | v32;
          unint64_t v136 = (v134 + v133) & 0xFFFFFFFFFFFFFFFCLL | v32;
          if (v135 == v136) {
            return 0LL;
          }
          uint64_t v137 = 0LL;
          while (1)
          {
            unint64_t v17 = v135 + v137;
            v137 += v9;
            if (v135 + v137 == v136) {
              return 0LL;
            }
          }
        }
      }

      else
      {
        uint64_t v110 = v7[1];
        unint64_t v122 = v110 * (unint64_t)v9;
        if ((v122 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_237;
        }
        unint64_t v123 = (unint64_t)(v7 + 2);
        unint64_t v124 = v123 & 0xFFFFFFFFFFFFFFFCLL | v32;
        unint64_t v125 = (v123 + v122) & 0xFFFFFFFFFFFFFFFCLL | v32;
        if (v124 == v125) {
          return 0LL;
        }
        uint64_t v126 = 0LL;
        while (1)
        {
          unint64_t v17 = v124 + v126;
          v126 += v9;
          if (v124 + v126 == v125) {
            return 0LL;
          }
        }
      }

      goto LABEL_181;
    }

    if ((v30 & 0x80000000) == 0)
    {
      unint64_t v34 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v32;
      uint64_t v35 = v7[1];
      if (v35 < 5)
      {
        unint64_t v37 = v34;
LABEL_107:
        if (!(_DWORD)v35) {
          return 0LL;
        }
        uint64_t v79 = 0LL;
        int v80 = v35 - 1;
        while (1)
        {
          unint64_t v17 = v37 + v79;
          unsigned int v81 = *(char **)((v37 + v79) & 0xFFFFFFFFFFFFFFFCLL);
          if (sel_load == v81) {
            break;
          }
          BOOL v82 = sel_load < v81 || v80-- == 0;
          v79 += v9;
          if (v82) {
            return 0LL;
          }
        }

        goto LABEL_181;
      }

      uint64_t v36 = (unsigned __int16)v30 & 0xFFFC;
      unint64_t v37 = v34;
      while (1)
      {
        unint64_t v17 = v37 + ((unsigned __int16)v30 & 0xFFFC) * (unint64_t)(v35 >> 1);
        unint64_t v38 = *(char **)(v17 & 0xFFFFFFFFFFFFFFFCLL);
        BOOL v39 = sel_load > v38;
        if (sel_load == v38) {
          break;
        }
        BOOL v40 = sel_load > v38;
        if (v39) {
          unint64_t v37 = v17 + ((unsigned __int16)v30 & 0xFFFC);
        }
        unsigned int v41 = v35 - v40;
        uint64_t v35 = v41 >> 1;
        if (v41 <= 9) {
          goto LABEL_107;
        }
      }

      if (v17 > v34)
      {
        uint64_t v63 = 0LL;
        unint64_t v96 = v37 + ((unsigned __int16)v30 >> 2) * (((2 * v35) & 0x1FFFFFFFCLL) - 4);
        while (sel_load == *(char **)((v96 + v63) & 0xFFFFFFFFFFFFFFFCLL))
        {
          v63 -= v36;
          unint64_t v65 = v17 + v63;
          if (v17 + v63 <= v34) {
            goto LABEL_180;
          }
        }

        goto LABEL_165;
      }

      goto LABEL_181;
    }

    if (dataSegmentsRanges > (unint64_t)v7 || *(void *)algn_18C43FCB8 <= (unint64_t)v7)
    {
      unint64_t v71 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v32;
      uint64_t v72 = v7[1];
      if (v72 < 5)
      {
        unint64_t v74 = v71;
LABEL_151:
        if (!(_DWORD)v72) {
          return 0LL;
        }
        uint64_t v99 = 0LL;
        int v100 = v72 - 1;
        while (1)
        {
          unint64_t v17 = v74 + v99;
          unsigned int v101 = *(char **)(((v74 + v99) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v74 + v99) & 0xFFFFFFFFFFFFFFFCLL));
          if (sel_load == v101) {
            break;
          }
          BOOL v102 = sel_load < v101 || v100-- == 0;
          v99 += v9;
          if (v102) {
            return 0LL;
          }
        }

        goto LABEL_181;
      }

      uint64_t v73 = (unsigned __int16)v30 & 0xFFFC;
      unint64_t v74 = v71;
      while (1)
      {
        unint64_t v17 = v74 + ((unsigned __int16)v30 & 0xFFFC) * (unint64_t)(v72 >> 1);
        unint64_t v75 = *(char **)((v17 & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(v17 & 0xFFFFFFFFFFFFFFFCLL));
        BOOL v76 = sel_load > v75;
        if (sel_load == v75) {
          break;
        }
        BOOL v77 = sel_load > v75;
        if (v76) {
          unint64_t v74 = v17 + ((unsigned __int16)v30 & 0xFFFC);
        }
        unsigned int v78 = v72 - v77;
        uint64_t v72 = v78 >> 1;
        if (v78 <= 9) {
          goto LABEL_151;
        }
      }

      if (v17 > v71)
      {
        uint64_t v63 = 0LL;
        unint64_t v103 = v74 + ((unsigned __int16)v30 >> 2) * (((2 * v72) & 0x1FFFFFFFCLL) - 4);
        while (sel_load == *(char **)(((v103 + v63) & 0xFFFFFFFFFFFFFFFCLL)
                                     + *(int *)((v103 + v63) & 0xFFFFFFFFFFFFFFFCLL)))
        {
          v63 -= v73;
          unint64_t v65 = v17 + v63;
          if (v17 + v63 <= v71) {
            goto LABEL_180;
          }
        }

        goto LABEL_165;
      }

      goto LABEL_181;
    }

    unint64_t v88 = sel_load - (char *)&unk_18E7BB5A8;
    unint64_t v89 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v32;
    uint64_t v90 = v7[1];
    if (v90 < 5)
    {
      unint64_t v91 = v89;
LABEL_167:
      if (!(_DWORD)v90) {
        return 0LL;
      }
      uint64_t v104 = 0LL;
      int v105 = v90 - 1;
      while (1)
      {
        unint64_t v17 = v91 + v104;
        unint64_t v106 = *(int *)((v91 + v104) & 0xFFFFFFFFFFFFFFFCLL);
        if (v88 == v106) {
          break;
        }
        BOOL v107 = v88 < v106 || v105-- == 0;
        v104 += v9;
        if (v107) {
          return 0LL;
        }
      }

      goto LABEL_181;
    }

    unint64_t v91 = v89;
    while (1)
    {
      unint64_t v17 = v91 + ((unsigned __int16)v30 & 0xFFFC) * (unint64_t)(v90 >> 1);
      unint64_t v92 = *(int *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
      BOOL v93 = v88 > v92;
      if (v88 == v92) {
        break;
      }
      BOOL v94 = v88 > v92;
      if (v93) {
        unint64_t v91 = v17 + v9;
      }
      unsigned int v95 = v90 - v94;
      uint64_t v90 = v95 >> 1;
      if (v95 <= 9) {
        goto LABEL_167;
      }
    }

    if (v17 <= v89) {
      goto LABEL_181;
    }
    uint64_t v97 = 0LL;
    unint64_t v108 = v91 + ((unsigned __int16)v30 >> 2) * (((2 * v90) & 0x1FFFFFFFCLL) - 4);
    while (v88 == *(_DWORD *)((v108 + v97) & 0xFFFFFFFFFFFFFFFCLL))
    {
      v97 -= v9;
      unint64_t v65 = v17 + v97;
      if (v17 + v97 <= v89)
      {
LABEL_180:
        unint64_t v17 = v65;
        goto LABEL_181;
      }
    }

LABEL_183:
    v17 += v97;
    goto LABEL_181;
  }

  unint64_t v8 = *v7;
  uint64_t v9 = (unsigned __int16)v8 & 0xFFFC;
  if ((v8 & 0x80000000) == 0LL) {
    int v10 = 24;
  }
  else {
    int v10 = 12;
  }
  unint64_t v11 = v8 >> 31;
  if ((~(_DWORD)v8 & 3) != 0 || (_DWORD)v9 != v10)
  {
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t v110 = v7[1];
      unint64_t v111 = v110 * (unint64_t)v9;
      if ((v111 & 0xFFFFFFFF00000000LL) == 0)
      {
        unint64_t v112 = (unint64_t)(v7 + 2);
        unint64_t v113 = v112 & 0xFFFFFFFFFFFFFFFCLL | v11;
        unint64_t v114 = (v112 + v111) & 0xFFFFFFFFFFFFFFFCLL | v11;
        if (v113 == v114) {
          return 0LL;
        }
        uint64_t v115 = 0LL;
        while (1)
        {
          unint64_t v17 = v113 + v115;
          v115 += v9;
          if (v113 + v115 == v114) {
            return 0LL;
          }
        }

        goto LABEL_181;
      }

LABEL_237:
      _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v110, v7, v9);
    }

    if (dataSegmentsRanges <= (unint64_t)v7 && *(void *)algn_18C43FCB8 > (unint64_t)v7)
    {
      uint64_t v110 = v7[1];
      unint64_t v127 = v110 * (unint64_t)v9;
      if ((v127 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_237;
      }
      unint64_t v128 = (unint64_t)(v7 + 2);
      unint64_t v129 = v128 & 0xFFFFFFFFFFFFFFFCLL | v11;
      unint64_t v130 = (v128 + v127) & 0xFFFFFFFFFFFFFFFCLL | v11;
      if (v129 == v130) {
        return 0LL;
      }
      uint64_t v131 = 0LL;
      while (1)
      {
        unint64_t v17 = v129 + v131;
        v131 += v9;
        if (v129 + v131 == v130) {
          return 0LL;
        }
      }
    }

    else
    {
      uint64_t v110 = v7[1];
      unint64_t v117 = v110 * (unint64_t)v9;
      if ((v117 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_237;
      }
      unint64_t v118 = (unint64_t)(v7 + 2);
      unint64_t v119 = v118 & 0xFFFFFFFFFFFFFFFCLL | v11;
      unint64_t v120 = (v118 + v117) & 0xFFFFFFFFFFFFFFFCLL | v11;
      if (v119 == v120) {
        return 0LL;
      }
      uint64_t v121 = 0LL;
      while (1)
      {
        unint64_t v17 = v119 + v121;
        v121 += v9;
        if (v119 + v121 == v120) {
          return 0LL;
        }
      }
    }

    goto LABEL_181;
  }

  if ((v8 & 0x80000000) == 0)
  {
    unint64_t v13 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v11;
    uint64_t v14 = v7[1];
    if (v14 < 5)
    {
      unint64_t v16 = v13;
      if (!(_DWORD)v14) {
        return 0LL;
      }
LABEL_63:
      uint64_t v51 = 0LL;
      int v52 = v14 - 1;
      while (1)
      {
        unint64_t v17 = v16 + v51;
        BOOL v53 = *(char **)((v16 + v51) & 0xFFFFFFFFFFFFFFFCLL);
        if (sel_load == v53) {
          break;
        }
        BOOL v54 = sel_load < v53 || v52-- == 0;
        v51 += v9;
        if (v54) {
          return 0LL;
        }
      }

      goto LABEL_181;
    }

    uint64_t v15 = (unsigned __int16)v8 & 0xFFFC;
    unint64_t v16 = v13;
    while (1)
    {
      unint64_t v17 = v16 + ((unsigned __int16)v8 & 0xFFFC) * (unint64_t)(v14 >> 1);
      unsigned int v18 = *(char **)(v17 & 0xFFFFFFFFFFFFFFFCLL);
      BOOL v19 = sel_load > v18;
      if (sel_load == v18) {
        break;
      }
      BOOL v20 = sel_load > v18;
      if (v19) {
        unint64_t v16 = v17 + ((unsigned __int16)v8 & 0xFFFC);
      }
      unsigned int v21 = v14 - v20;
      uint64_t v14 = v21 >> 1;
      if (v21 <= 9)
      {
        if ((_DWORD)v14) {
          goto LABEL_63;
        }
        return 0LL;
      }
    }

    if (v17 <= v13) {
      goto LABEL_181;
    }
    uint64_t v63 = 0LL;
    unint64_t v64 = v16 + ((unsigned __int16)v8 >> 2) * (((2 * v14) & 0x1FFFFFFFCLL) - 4);
    while (sel_load == *(char **)((v64 + v63) & 0xFFFFFFFFFFFFFFFCLL))
    {
      v63 -= v15;
      unint64_t v65 = v17 + v63;
      if (v17 + v63 <= v13) {
        goto LABEL_180;
      }
    }

LABEL_165:
    v17 += v63;
    goto LABEL_181;
  }

  if (dataSegmentsRanges <= (unint64_t)v7 && *(void *)algn_18C43FCB8 > (unint64_t)v7)
  {
    unint64_t v55 = sel_load - (char *)&unk_18E7BB5A8;
    unint64_t v56 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v11;
    uint64_t v57 = v7[1];
    if (v57 < 5)
    {
      unint64_t v58 = v56;
LABEL_122:
      if (!(_DWORD)v57) {
        return 0LL;
      }
      uint64_t v84 = 0LL;
      int v85 = v57 - 1;
      while (1)
      {
        unint64_t v17 = v58 + v84;
        unint64_t v86 = *(int *)((v58 + v84) & 0xFFFFFFFFFFFFFFFCLL);
        if (v55 == v86) {
          break;
        }
        BOOL v87 = v55 < v86 || v85-- == 0;
        v84 += v9;
        if (v87) {
          return 0LL;
        }
      }

      goto LABEL_181;
    }

    unint64_t v58 = v56;
    while (1)
    {
      unint64_t v17 = v58 + ((unsigned __int16)v8 & 0xFFFC) * (unint64_t)(v57 >> 1);
      unint64_t v59 = *(int *)(v17 & 0xFFFFFFFFFFFFFFFCLL);
      BOOL v60 = v55 > v59;
      if (v55 == v59) {
        break;
      }
      BOOL v61 = v55 > v59;
      if (v60) {
        unint64_t v58 = v17 + v9;
      }
      unsigned int v62 = v57 - v61;
      uint64_t v57 = v62 >> 1;
      if (v62 <= 9) {
        goto LABEL_122;
      }
    }

    if (v17 <= v56) {
      goto LABEL_181;
    }
    uint64_t v97 = 0LL;
    unint64_t v98 = v58 + ((unsigned __int16)v8 >> 2) * (((2 * v57) & 0x1FFFFFFFCLL) - 4);
    while (v55 == *(_DWORD *)((v98 + v97) & 0xFFFFFFFFFFFFFFFCLL))
    {
      v97 -= v9;
      unint64_t v65 = v17 + v97;
      if (v17 + v97 <= v56) {
        goto LABEL_180;
      }
    }

    goto LABEL_183;
  }

  unint64_t v43 = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFFFFCLL | v11;
  uint64_t v44 = v7[1];
  if (v44 < 5)
  {
    unint64_t v46 = v43;
LABEL_86:
    if (!(_DWORD)v44) {
      return 0LL;
    }
    uint64_t v66 = 0LL;
    int v67 = v44 - 1;
    while (1)
    {
      unint64_t v17 = v46 + v66;
      uint64_t v68 = *(char **)(((v46 + v66) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v46 + v66) & 0xFFFFFFFFFFFFFFFCLL));
      if (sel_load == v68) {
        break;
      }
      BOOL v69 = sel_load < v68 || v67-- == 0;
      v66 += v9;
      if (v69) {
        return 0LL;
      }
    }

    goto LABEL_181;
  }

  uint64_t v45 = (unsigned __int16)v8 & 0xFFFC;
  unint64_t v46 = v43;
  while (1)
  {
    unint64_t v17 = v46 + ((unsigned __int16)v8 & 0xFFFC) * (unint64_t)(v44 >> 1);
    uint64_t v47 = *(char **)((v17 & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(v17 & 0xFFFFFFFFFFFFFFFCLL));
    BOOL v48 = sel_load > v47;
    if (sel_load == v47) {
      break;
    }
    BOOL v49 = sel_load > v47;
    if (v48) {
      unint64_t v46 = v17 + ((unsigned __int16)v8 & 0xFFFC);
    }
    unsigned int v50 = v44 - v49;
    uint64_t v44 = v50 >> 1;
    if (v50 <= 9) {
      goto LABEL_86;
    }
  }

  if (v17 > v43)
  {
    uint64_t v63 = 0LL;
    unint64_t v83 = v46 + ((unsigned __int16)v8 >> 2) * (((2 * v44) & 0x1FFFFFFFCLL) - 4);
    while (sel_load == *(char **)(((v83 + v63) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v83 + v63) & 0xFFFFFFFFFFFFFFFCLL)))
    {
      v63 -= v45;
      unint64_t v65 = v17 + v63;
      if (v17 + v63 <= v43) {
        goto LABEL_180;
      }
    }

    goto LABEL_165;
  }

LABEL_181:
  if (v17) {
    return method_t::imp(v17, 0);
  }
  return 0LL;
}

unint64_t _category_getLoadMethod(unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v4 = *a1;
  uint64_t v5 = (unsigned __int16)v4 & 0xFFFC;
  if ((v4 & 0x80000000) == 0LL) {
    int v6 = 24;
  }
  else {
    int v6 = 12;
  }
  unint64_t v7 = v4 >> 31;
  if ((~(_DWORD)v4 & 3) == 0 && (_DWORD)v5 == v6)
  {
    if ((v4 & 0x80000000) != 0)
    {
      if (dataSegmentsRanges <= (unint64_t)a1 && *(void *)algn_18C43FCB8 > (unint64_t)a1)
      {
        unint64_t v18 = sel_load - (char *)&unk_18E7BB5A8;
        unint64_t v19 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
        uint64_t v20 = a1[1];
        if (v20 < 5)
        {
          unint64_t v21 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
LABEL_68:
          if (!(_DWORD)v20) {
            return 0LL;
          }
          uint64_t v46 = 0LL;
          int v47 = v20 - 1;
          while (1)
          {
            unint64_t v13 = v21 + v46;
            unint64_t v48 = *(int *)((v21 + v46) & 0xFFFFFFFFFFFFFFFCLL);
            if (v18 == v48) {
              break;
            }
            BOOL v49 = v18 < v48 || v47-- == 0;
            v46 += v5;
            if (v49) {
              return 0LL;
            }
          }
        }

        else
        {
          unint64_t v21 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
          while (1)
          {
            unint64_t v13 = v21 + ((unsigned __int16)v4 & 0xFFFC) * (unint64_t)(v20 >> 1);
            unint64_t v22 = *(int *)(v13 & 0xFFFFFFFFFFFFFFFCLL);
            BOOL v23 = v18 > v22;
            if (v18 == v22) {
              break;
            }
            BOOL v24 = v18 > v22;
            if (v23) {
              unint64_t v21 = v13 + v5;
            }
            unsigned int v25 = v20 - v24;
            uint64_t v20 = v25 >> 1;
            if (v25 <= 9) {
              goto LABEL_68;
            }
          }

          if (v13 > v19)
          {
            uint64_t v50 = 0LL;
            unint64_t v51 = v21 + ((unsigned __int16)v4 >> 2) * (((2 * v20) & 0x1FFFFFFFCLL) - 4);
            while (v18 == *(_DWORD *)((v51 + v50) & 0xFFFFFFFFFFFFFFFCLL))
            {
              v50 -= v5;
              unint64_t v40 = v13 + v50;
              if (v13 + v50 <= v19) {
                goto LABEL_81;
              }
            }

            v13 += v50;
          }
        }

        goto LABEL_82;
      }

      unint64_t v30 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
      uint64_t v31 = a1[1];
      if (v31 < 5)
      {
        unint64_t v33 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
        if (!(_DWORD)v31) {
          return 0LL;
        }
LABEL_53:
        uint64_t v41 = 0LL;
        int v42 = v31 - 1;
        while (1)
        {
          unint64_t v13 = v33 + v41;
          unint64_t v43 = *(char **)(((v33 + v41) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v33 + v41) & 0xFFFFFFFFFFFFFFFCLL));
          if (sel_load == v43) {
            break;
          }
          BOOL v44 = sel_load < v43 || v42-- == 0;
          v41 += v5;
          if (v44) {
            return 0LL;
          }
        }

        goto LABEL_82;
      }

      uint64_t v32 = (unsigned __int16)v4 & 0xFFFC;
      unint64_t v33 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
      while (1)
      {
        unint64_t v13 = v33 + ((unsigned __int16)v4 & 0xFFFC) * (unint64_t)(v31 >> 1);
        unint64_t v34 = *(char **)((v13 & 0xFFFFFFFFFFFFFFFCLL) + *(int *)(v13 & 0xFFFFFFFFFFFFFFFCLL));
        BOOL v35 = sel_load > v34;
        if (sel_load == v34) {
          break;
        }
        BOOL v36 = sel_load > v34;
        if (v35) {
          unint64_t v33 = v13 + ((unsigned __int16)v4 & 0xFFFC);
        }
        unsigned int v37 = v31 - v36;
        uint64_t v31 = v37 >> 1;
        if (v37 <= 9)
        {
          if ((_DWORD)v31) {
            goto LABEL_53;
          }
          return 0LL;
        }
      }

      if (v13 <= v30) {
        goto LABEL_82;
      }
      uint64_t v38 = 0LL;
      unint64_t v45 = v33 + ((unsigned __int16)v4 >> 2) * (((2 * v31) & 0x1FFFFFFFCLL) - 4);
      while (sel_load == *(char **)(((v45 + v38) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v45 + v38) & 0xFFFFFFFFFFFFFFFCLL)))
      {
        v38 -= v32;
        unint64_t v40 = v13 + v38;
        if (v13 + v38 <= v30)
        {
LABEL_81:
          unint64_t v13 = v40;
          goto LABEL_82;
        }
      }
    }

    else
    {
      unint64_t v9 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
      uint64_t v10 = a1[1];
      if (v10 < 5)
      {
        unint64_t v12 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
        if (!(_DWORD)v10) {
          return 0LL;
        }
LABEL_31:
        uint64_t v26 = 0LL;
        int v27 = v10 - 1;
        while (1)
        {
          unint64_t v13 = v12 + v26;
          uint64_t v28 = *(char **)((v12 + v26) & 0xFFFFFFFFFFFFFFFCLL);
          if (sel_load == v28) {
            break;
          }
          BOOL v29 = sel_load < v28 || v27-- == 0;
          v26 += v5;
          if (v29) {
            return 0LL;
          }
        }

        goto LABEL_82;
      }

      uint64_t v11 = (unsigned __int16)v4 & 0xFFFC;
      unint64_t v12 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
      while (1)
      {
        unint64_t v13 = v12 + ((unsigned __int16)v4 & 0xFFFC) * (unint64_t)(v10 >> 1);
        uint64_t v14 = *(char **)(v13 & 0xFFFFFFFFFFFFFFFCLL);
        BOOL v15 = sel_load > v14;
        if (sel_load == v14) {
          break;
        }
        BOOL v16 = sel_load > v14;
        if (v15) {
          unint64_t v12 = v13 + ((unsigned __int16)v4 & 0xFFFC);
        }
        unsigned int v17 = v10 - v16;
        uint64_t v10 = v17 >> 1;
        if (v17 <= 9)
        {
          if ((_DWORD)v10) {
            goto LABEL_31;
          }
          return 0LL;
        }
      }

      if (v13 <= v9) {
        goto LABEL_82;
      }
      uint64_t v38 = 0LL;
      unint64_t v39 = v12 + ((unsigned __int16)v4 >> 2) * (((2 * v10) & 0x1FFFFFFFCLL) - 4);
      while (sel_load == *(char **)((v39 + v38) & 0xFFFFFFFFFFFFFFFCLL))
      {
        v38 -= v11;
        unint64_t v40 = v13 + v38;
        if (v13 + v38 <= v9) {
          goto LABEL_81;
        }
      }
    }

    v13 += v38;
    goto LABEL_82;
  }

  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v53 = a1[1];
    unint64_t v54 = v53 * (unint64_t)v5;
    if ((v54 & 0xFFFFFFFF00000000LL) == 0)
    {
      unint64_t v55 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
      unint64_t v56 = ((unint64_t)a1 + v54 + 8) & 0xFFFFFFFFFFFFFFFCLL | v7;
      if (v55 == v56) {
        return 0LL;
      }
      uint64_t v57 = 0LL;
      while (1)
      {
        unint64_t v13 = v55 + v57;
        v57 += v5;
        if (v55 + v57 == v56) {
          return 0LL;
        }
      }

      goto LABEL_82;
    }

LABEL_108:
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", a2, a3, a4, v53, a1, v5);
  }

  if (dataSegmentsRanges > (unint64_t)a1 || *(void *)algn_18C43FCB8 <= (unint64_t)a1)
  {
    uint64_t v53 = a1[1];
    unint64_t v62 = v53 * (unint64_t)v5;
    if ((v62 & 0xFFFFFFFF00000000LL) != 0) {
      goto LABEL_108;
    }
    unint64_t v63 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
    unint64_t v64 = ((unint64_t)a1 + v62 + 8) & 0xFFFFFFFFFFFFFFFCLL | v7;
    if (v63 == v64) {
      return 0LL;
    }
    uint64_t v65 = 0LL;
    while (1)
    {
      unint64_t v13 = v63 + v65;
      v65 += v5;
      if (v63 + v65 == v64) {
        return 0LL;
      }
    }
  }

  else
  {
    uint64_t v53 = a1[1];
    unint64_t v58 = v53 * (unint64_t)v5;
    if ((v58 & 0xFFFFFFFF00000000LL) != 0) {
      goto LABEL_108;
    }
    unint64_t v59 = (unint64_t)(a1 + 2) & 0xFFFFFFFFFFFFFFFCLL | v7;
    unint64_t v60 = ((unint64_t)a1 + v58 + 8) & 0xFFFFFFFFFFFFFFFCLL | v7;
    if (v59 == v60) {
      return 0LL;
    }
    uint64_t v61 = 0LL;
    while (1)
    {
      unint64_t v13 = v59 + v61;
      v61 += v5;
      if (v59 + v61 == v60) {
        return 0LL;
      }
    }
  }

LABEL_82:
  if (v13) {
    return method_t::imp(v13, 0);
  }
  return 0LL;
}

      if ((_os_feature_enabled_simple_impl() & 1) == 0) {
        DisablePreoptCaches = 1;
      }
      if (((v18 | v19) & 1) != 0)
      {
        if ((v18 & 1) != 0)
        {
          _objc_inform("Objective-C runtime debugging. Set variable=YES to enable.");
          _objc_inform("OBJC_HELP: describe available environment variables");
          if ((v19 & 1) != 0) {
            _objc_inform("OBJC_HELP is set");
          }
          _objc_inform("OBJC_PRINT_OPTIONS: list which options are set");
          if ((v19 & 1) == 0) {
            goto LABEL_87;
          }
        }

        else if ((v19 & 1) == 0)
        {
LABEL_87:
          uint64_t v31 = 0LL;
          uint64_t v32 = (const char **)off_18961DC70;
          while (1)
          {
            if (v31 < 0x30 || os_variant_allows_internal_security_policies())
            {
              if ((v18 & 1) != 0)
              {
                _objc_inform("%s: %s", *v32, v32[1]);
                if ((v19 & 1) != 0)
                {
LABEL_92:
                  unint64_t v33 = *(_DWORD *)*(v32 - 1);
                  if (v33 == 1)
                  {
                    _objc_inform("%s is set");
                  }

                  else if (v33 == 2)
                  {
                    _objc_inform("%s is fatal");
                  }
                }
              }

              else if ((v19 & 1) != 0)
              {
                goto LABEL_92;
              }
            }

            ++v31;
            v32 += 5;
            if (v31 == 51) {
              goto LABEL_6;
            }
          }
        }

        _objc_inform("OBJC_PRINT_OPTIONS is set");
        goto LABEL_87;
      }
    }
  }

Method class_getInstanceMethod(Class cls, SEL name)
{
  unint64_t MethodNoSuper_nolock = 0LL;
  if (cls && name)
  {
    Class isa = cls;
    lookUpImpOrForward(0LL, (objc_selector *)name, cls, (char *)2);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v8 = *(_DWORD *)(StatusReg + 24);
    do
    {
      if (__ldaxr(runtimeLock))
      {
        __clrex();
        os_unfair_lock_lock_with_options();
        break;
      }
    }

    while (__stxr(v8, runtimeLock));
    while (1)
    {
      unint64_t MethodNoSuper_nolock = (objc_method *)getMethodNoSuper_nolock(isa, (objc_selector *)name, v5, v6);
      if (MethodNoSuper_nolock) {
        break;
      }
      Class isa = isa[1].isa;
      if (!isa)
      {
        unint64_t MethodNoSuper_nolock = 0LL;
        break;
      }
    }

    int v10 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v11 = __ldxr(runtimeLock);
      if (v11 != v10) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return MethodNoSuper_nolock;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  return MethodNoSuper_nolock;
}

void sub_180035974(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

id (*lookUpImpOrForward( objc_object *a1, objc_selector *a2, objc_class *this, char *a4))(id receiver, SEL sel, ...)
{
  int v7 = *(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v7 & 1) == 0) {
    int v7 = *(_DWORD *)(*(void *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v7 & 0x20000000) != 0) {
    unsigned int v8 = a4;
  }
  else {
    unsigned int v8 = a4 | 8;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v10 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&runtimeLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_11:
  if ((unint64_t)&this->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v12 = *(unsigned __int16 *)(((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        dword_18C43FCC8 <= v12)
    || (*(void *)(qword_18C43FCC0 + 16 * v12) <= (unint64_t)this
      ? (BOOL v13 = *(void *)(qword_18C43FCC0 + 16 * v12 + 8) > (unint64_t)this)
      : (BOOL v13 = 0),
        !v13))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)this)
      && (dataSegmentsContain(this, v33, v34) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v35, v36, a4, this);
    }
  }

  uint64_t v14 = realizeAndInitializeIfNeeded_locked(a1, this, v8 & 1, a4);
  unsigned int v17 = (objc_class *)v14;
  if (!v14 || ((uint64_t)v14->isa & 0xFFFFFFFF8LL) == 0)
  {
    uint64_t v20 = (id (*)(id, SEL, ...))_objc_returnNil;
    goto LABEL_35;
  }

  int v18 = *(_DWORD *)(gdb_objc_realized_classes + 8);
  if (DisablePreopt) {
    int v19 = 0;
  }
  else {
    int v19 = _dyld_objc_class_count();
  }
  int v21 = 16 * ~(v19 + v18);
  Class isa = v17;
  while (((uint64_t)isa[2].isa & 1) != 0)
  {
    uint64_t Imp = cache_getImp((uint64_t)isa, (unint64_t)a2, 0LL);
    if (Imp)
    {
      uint64_t v20 = (id (*)(id, SEL, ...))Imp;
      goto LABEL_42;
    }

    Class isa = (objc_class *)((char *)isa + *(void *)(((uint64_t)isa[2].isa & 0xFFFFFFFFFFFELL) - 16));
LABEL_32:
    if (__CFADD__(v21++, 1)) {
      _objc_fatal("Memory corruption in class list.", v24, v25, v26);
    }
    BOOL v29 = (id (*)(id, SEL, ...))cache_getImp((uint64_t)isa, (unint64_t)a2, 0LL);
    if (v29 == _objc_msgForward_impcache) {
      goto LABEL_52;
    }
    uint64_t v20 = v29;
    if (v29) {
      goto LABEL_35;
    }
  }

  unint64_t MethodNoSuper_nolock = getMethodNoSuper_nolock(isa, a2, v15, v16);
  if (MethodNoSuper_nolock)
  {
    uint64_t v20 = (id (*)(id, SEL, ...))method_t::imp(MethodNoSuper_nolock, 0);
    goto LABEL_35;
  }

  Class isa = isa[1].isa;
  if (isa) {
    goto LABEL_32;
  }
LABEL_52:
  if ((v8 & 2) != 0) {
    return resolveMethod_locked(a1, a2, v17, v8 ^ 2);
  }
  uint64_t v20 = _objc_msgForward_impcache;
LABEL_35:
  if ((v8 & 8) == 0)
  {
    if (msgSendCacheMissHook)
    {
      unsigned int v37 = (void (*)(objc_class *, objc_object *, objc_selector *, id (*)(id, SEL, ...)))atomic_load((unint64_t *)&msgSendCacheMissHook);
      v37(v17, a1, a2, v20);
    }

    cache_t::insert(v17 + 2, a2, (unint64_t)v20, a1);
  }

LABEL_42:
  int v30 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v31 = __ldxr((unsigned int *)&runtimeLock);
    if (v31 != v30) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_47:
  if (((v20 == _objc_msgForward_impcache) & (v8 >> 2)) != 0) {
    return 0LL;
  }
  else {
    return v20;
  }
}

id (*resolveMethod_locked( objc_object *a1, objc_selector *a2, objc_class *a3, unsigned int a4))(id receiver, SEL sel, ...)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr((unsigned int *)&runtimeLock);
    if (v10 != v9) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_6:
  if ((HIWORD(a3[3].isa) & 4) == 0) {
    goto LABEL_25;
  }
  if (lookUpImpOrNilTryCache(a1, (unint64_t)sel_resolveClassMethod_, a3))
  {
    unsigned int v13 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)&runtimeLock))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_13:
    MaybeUnrealizedNonMetaClass = getMaybeUnrealizedNonMetaClass(a3, a1, v11, v12);
    BOOL v16 = MaybeUnrealizedNonMetaClass;
    if ((unint64_t)&MaybeUnrealizedNonMetaClass->isa[-1].isa + 7 < 0xF
      || (*(_DWORD *)((uint64_t)MaybeUnrealizedNonMetaClass[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0)
    {
      unint64_t v24 = objc_class::nameForLogging(MaybeUnrealizedNonMetaClass);
      _objc_fatal("nonmeta class %s (%p) unexpectedly not realized", v25, v26, v27, v24, v16);
    }

    int v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v18 = __ldxr((unsigned int *)&runtimeLock);
      if (v18 != v17) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&runtimeLock);
LABEL_20:
    unsigned int v19 = -[objc_class resolveClassMethod:](v16, sel_resolveClassMethod_, a2);
    uint64_t v20 = lookUpImpOrNilTryCache(a1, (unint64_t)a2, a3);
    if (v19 && PrintResolving)
    {
      if (v20)
      {
        objc_class::nameForLogging(a3);
        _objc_inform("RESOLVE: method %c[%s %s] dynamically resolved to %p");
      }

      else
      {
        objc_class::nameForLogging(a3);
        objc_class::nameForLogging(a3);
        _objc_inform("RESOLVE: +[%s resolveClassMethod:%s] returned YES, but no new implementation of %c[%s %s] was found");
      }
    }
  }

  if (!lookUpImpOrNilTryCache(a1, (unint64_t)a2, a3))
  {
LABEL_25:
    if (lookUpImpOrNilTryCache( (objc_object *)a3,  (unint64_t)sel_resolveInstanceMethod_,  (objc_class *)((uint64_t)a3->isa & 0xFFFFFFFF8LL)))
    {
      unsigned int v21 = -[objc_class resolveInstanceMethod:](a3, sel_resolveInstanceMethod_, a2);
      unint64_t v22 = lookUpImpOrNilTryCache(a1, (unint64_t)a2, a3);
      if (v21)
      {
        if (PrintResolving)
        {
          if (v22)
          {
            objc_class::nameForLogging(a3);
            _objc_inform("RESOLVE: method %c[%s %s] dynamically resolved to %p");
          }

          else
          {
            objc_class::nameForLogging(a3);
            objc_class::nameForLogging(a3);
            _objc_inform("RESOLVE: +[%s resolveInstanceMethod:%s] returned YES, but no new implementation of %c[%s %s] was found");
          }
        }
      }
    }
  }

  return lookUpImpOrForwardTryCache(a1, (unint64_t)a2, a3, a4);
}

void sub_18003602C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

id (*lookUpImpOrNilTryCache( objc_object *a1, unint64_t a2, objc_class *this))(id receiver, SEL sel, ...)
{
  int v6 = *(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v6 & 1) == 0) {
    int v6 = *(_DWORD *)(*(void *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v6 & 0x20000000) == 0) {
    return (id (*)(id, SEL, ...))lookUpImpOrForward(a1, a2, this);
  }
  BOOL result = (id (*)(id, SEL, ...))cache_getImp((uint64_t)this, a2, 0LL);
  if (!result)
  {
    BOOL result = (id (*)(id, SEL, ...))cache_getImp( (uint64_t)this + *(void *)(((uint64_t)this[2].isa & 0xFFFFFFFFFFFELL) - 16),  a2,  0LL);
    if (!result) {
      return (id (*)(id, SEL, ...))lookUpImpOrForward(a1, a2, this);
    }
  }

  if (result == _objc_msgForward_impcache) {
    return 0LL;
  }
  return result;
}

id (*lookUpImpOrForwardTryCache( objc_object *a1, unint64_t a2, objc_class *this, unsigned int a4))(id receiver, SEL sel, ...)
{
  int v8 = *(_DWORD *)((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL);
  if ((v8 & 1) == 0) {
    int v8 = *(_DWORD *)(*(void *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v8 & 0x20000000) == 0) {
    return (id (*)(id, SEL, ...))lookUpImpOrForward(a1, a2, this);
  }
  BOOL result = (id (*)(id, SEL, ...))cache_getImp((uint64_t)this, a2, 0LL);
  if (!result)
  {
    BOOL result = (id (*)(id, SEL, ...))cache_getImp( (uint64_t)this + *(void *)(((uint64_t)this[2].isa & 0xFFFFFFFFFFFELL) - 16),  a2,  0LL);
    if (!result) {
      return (id (*)(id, SEL, ...))lookUpImpOrForward(a1, a2, this);
    }
  }

  if (((result == _objc_msgForward_impcache) & (a4 >> 2)) != 0) {
    return 0LL;
  }
  return result;
}

unint64_t lookupMethodInClassAndLoadCache(objc_class *a1, objc_selector *a2)
{
  unint64_t Imp = cache_getImp((uint64_t)a1, (unint64_t)a2, (uint64_t)_objc_msgForward_impcache);
  if (!Imp)
  {
    int v7 = (const char *)a1;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v9 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v9, runtimeLock)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    unint64_t MethodNoSuper_nolock = getMethodNoSuper_nolock(a1, a2, v7, v4);
    if (MethodNoSuper_nolock) {
      unint64_t Imp = method_t::imp(MethodNoSuper_nolock, 0);
    }
    else {
      unint64_t Imp = (unint64_t)_objc_msgForward_impcache;
    }
    int v12 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v13 = __ldxr(runtimeLock);
      if (v13 != v12) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return Imp;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  return Imp;
}

void sub_180036334(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  int v4 = 0LL;
  if (!cls || !name) {
    return v4;
  }
  Class isa = cls;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v8, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if ((unint64_t)&isa->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)isa[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v10 = *(unsigned __int16 *)(((uint64_t)isa[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v10)
    || (*(void *)(qword_18C43FCC0 + 16 * v10) <= (unint64_t)isa
      ? (BOOL v11 = *(void *)(qword_18C43FCC0 + 16 * v10 + 8) > (unint64_t)isa)
      : (BOOL v11 = 0),
        !v11))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)isa)
      && (dataSegmentsContain(isa, v26, (unsigned int *)v2) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v27, v2, v3, isa);
    }
  }

  do
  {
    uint64_t v12 = *(void *)(((uint64_t)isa[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if ((v12 & 1) != 0)
    {
      unint64_t v15 = *(void *)(v13 + 16);
    }

    else
    {
      unint64_t v31 = 0LL;
      uint64_t v14 = *(void *)(v13 + 64);
      unint64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
      if ((v14 & 1) != 0 || !v15)
      {
        uint64_t v16 = v14 & 1;
        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17) {
          goto LABEL_26;
        }
        v15 |= 2uLL;
      }
    }

    unint64_t v31 = v15;
LABEL_26:
    list_array_tt<property_t,property_list_t,RawPtr>::begin((uint64_t)v29, &v31, v2, v3);
    list_array_tt<property_t,property_list_t,RawPtr>::end((uint64_t)v28, &v31, v18, v19);
    while (!list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v29,  v28))
    {
      int v4 = (objc_property *)v30;
      if (!strcmp(name, *v30)) {
        goto LABEL_32;
      }
      list_array_tt<property_t,property_list_t,RawPtr>::iteratorImpl<false>::operator++(v29, v20, v21, v22);
    }

    Class isa = isa[1].isa;
  }

  while (isa);
  int v4 = 0LL;
LABEL_32:
  int v23 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v24 = __ldxr(runtimeLock);
    if (v24 != v23) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v4;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v4;
}

void sub_18003655C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_class *gdb_class_getClass(objc_class *a1, uint64_t a2, const char *a3, char *a4)
{
  int v4 = (char *)objc_class::mangledName(a1, a2, a3, a4);
  if (v4 && *v4) {
    return look_up_class(v4);
  }
  else {
    return 0LL;
  }
}

objc_class *gdb_object_getClass(objc_class *result, uint64_t a2, const char *a3, char *a4)
{
  if (result)
  {
    if (((unint64_t)result & 0x8000000000000000LL) != 0)
    {
      int v4 = (__objc2_class *)objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      int v4 = (__objc2_class *)((uint64_t)result->isa & 0xFFFFFFFF8LL);
    }

    return gdb_class_getClass((objc_class *)v4, a2, a3, a4);
  }

  return result;
}

void objc::Scanner::scanAddedClassImpl(objc_class *this, unint64_t a2, const char *a3, char *a4)
{
  unint64_t v7 = ((unint64_t)objc::NSObjectSwizzledMask >> a2) & 0x15;
  unsigned int v8 = &OBJC_CLASS___NSObject;
  if ((_DWORD)a2) {
    unsigned int v8 = &OBJC_METACLASS___NSObject;
  }
  if (v8 != (__objc2_class *)this)
  {
    Class isa = this[1].isa;
    if (!isa)
    {
      BOOL v11 = 0;
      int v12 = 0;
      int v14 = 0;
      LOBYTE(v7) = 21;
      goto LABEL_30;
    }

    unsigned int isa_high = HIWORD(isa[3].isa);
    BOOL v11 = (isa_high & 0x4000) == 0;
    BOOL v35 = ((uint64_t)isa[4].isa & 4) == 0;
    int v12 = v35;
    int v13 = v7 | v11 | 4;
    if (!v35) {
      int v13 = v7 | v11;
    }
    int v14 = (isa_high >> 15) ^ 1;
    if ((isa_high & 0x8000u) != 0) {
      LODWORD(v7) = v13;
    }
    else {
      LODWORD(v7) = v13 | 0x10;
    }
    if ((_DWORD)v7 == 21) {
      goto LABEL_30;
    }
    uint64_t v15 = *(void *)(((uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
    if ((v15 & 1) != 0)
    {
      unint64_t v18 = *(void *)(v16 + 8);
    }

    else
    {
      uint64_t v17 = *(void *)(v16 + 32);
      unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFFELL;
      if ((v17 & 1) != 0) {
        unint64_t v19 = v17 & 0xFFFFFFFFFFFFFFFELL;
      }
      else {
        unint64_t v19 = 0LL;
      }
      if ((v17 & 1) != 0 || !v18)
      {
        unint64_t v18 = v19 | 2;
        if (!v19) {
          unint64_t v18 = 0LL;
        }
      }
    }

    unint64_t v101 = v18;
    BOOL v93 = &v101;
    unint64_t v33 = v18 & 3;
    unint64_t v34 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFFCLL);
    BOOL v35 = (v18 & 3) != 0 || v34 == 0LL;
    if (!v35)
    {
      unint64_t v94 = v18 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v34 = 0LL;
LABEL_101:
      char v56 = objc::Scanner::scanMethodLists<list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::ListIterator>( (uint64_t)&v93,  (unint64_t)v34,  (unint64_t)a3);
      goto LABEL_139;
    }

    if (v18 > 3)
    {
      if (v33 == 1 && v34 != 0LL)
      {
        unint64_t v94 = (unint64_t)(v34 + 2);
        goto LABEL_94;
      }

      if (v33 == 2 && v34 != 0LL)
      {
        if (DisablePreattachedCategories)
        {
          unint64_t v48 = *v34;
          uint64_t v87 = v34[1];
          unint64_t v88 = v87 * (unint64_t)v48;
          if ((v88 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)v34,  a3,  a4,  v87,  v34,  v48,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
          }
          unint64_t v89 = v48 | (v87 << 32);
          uint64_t v90 = (uint64_t)v34 + v88 + 8;
          unint64_t v91 = v48 | ((unint64_t)(v87 - 1) << 32);
          BOOL v92 = (_DWORD)v87 == 0;
          if ((_DWORD)v87) {
            uint64_t v46 = v87;
          }
          else {
            uint64_t v46 = 0LL;
          }
          if ((_DWORD)v87) {
            unint64_t v45 = (unsigned __int16 *)(v90 - v48);
          }
          else {
            unint64_t v45 = (unsigned __int16 *)v90;
          }
          if (v92) {
            unint64_t v47 = v89;
          }
          else {
            unint64_t v47 = v91;
          }
        }

        else
        {
          unint64_t v45 = (unsigned __int16 *)(v34 + 2);
          unint64_t v47 = *v34;
          uint64_t v46 = v34[1];
          unint64_t v48 = v47;
        }

        unint64_t v49 = v46 * (unint64_t)v48;
        if ((v49 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)v34,  a3,  a4,  v46,  v34,  v48,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
        }
        unint64_t v50 = HIDWORD(v47);
        for (unint64_t i = (unint64_t)v34 + v49 + 8; (unint64_t)v45 < i; v50 = (v50 + 1))
        {
          if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v45 + 8) & 1) != 0) {
            break;
          }
          unint64_t v45 = (unsigned __int16 *)((char *)v45 + v47);
        }

        unint64_t v94 = (unint64_t)v34;
        unint64_t v95 = v47 | (v50 << 32);
        unint64_t v96 = v45;
      }
    }

    else
    {
      unint64_t v94 = 0LL;
    }

    if (!v33)
    {
      unint64_t v34 = 0LL;
      goto LABEL_101;
    }

LABEL_94:
    if (v33 == 1 && v34)
    {
      v34 += 2 * *v34 + 2;
    }

    else if (v33 == 2 && v34)
    {
      uint64_t v54 = *v34;
      uint64_t v53 = v34[1];
      unint64_t v55 = v53 * (unint64_t)v54;
      if ((v55 & 0xFFFFFFFF00000000LL) != 0) {
        _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  (uint64_t)v34,  a3,  a4,  v53,  v34,  v54,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
      }
      a3 = (char *)v34 + v55 + 8;
    }

    goto LABEL_101;
  }

  uint64_t v20 = (uint64_t)this[4].isa & 0xF00007FFFFFFFF8LL;
  uint64_t v21 = *(void *)(v20 + 8);
  unint64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
  if ((v21 & 1) != 0)
  {
    unint64_t v24 = *(void *)(v22 + 8);
  }

  else
  {
    uint64_t v23 = *(void *)(v22 + 32);
    unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
    if ((v23 & 1) != 0) {
      unint64_t v25 = v23 & 0xFFFFFFFFFFFFFFFELL;
    }
    else {
      unint64_t v25 = 0LL;
    }
    if ((v23 & 1) != 0 || !v24)
    {
      if (v25) {
        unint64_t v24 = v25 | 2;
      }
      else {
        unint64_t v24 = 0LL;
      }
    }
  }

  unint64_t v101 = v24;
  uint64_t v97 = &v101;
  unint64_t v28 = v24 & 3;
  BOOL v29 = v28 != 0;
  int v30 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v24 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
    BOOL v29 = 1;
  }
  if (!v29)
  {
    unint64_t v98 = v24 & 0xFFFFFFFFFFFFFFFCLL;
    int v4 = (unsigned __int16 *)(v24 & 0xFFFFFFFFFFFFFFFCLL);
    goto LABEL_43;
  }

  if (v24 > 3)
  {
    if (v28 != 1 || v30 == 0LL)
    {
      if (v28 == 2 && v30 != 0LL)
      {
        if (DisablePreattachedCategories)
        {
          unint64_t v40 = *v30;
          uint64_t v82 = v30[1];
          unint64_t v83 = v82 * (unint64_t)v40;
          if ((v83 & 0xFFFFFFFF00000000LL) != 0) {
            _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  a3,  a4,  v82,  v24 & 0xFFFFFFFFFFFFFFFCLL,  v40,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
          }
          unint64_t v84 = v40 | (v82 << 32);
          uint64_t v85 = (uint64_t)v30 + v83 + 8;
          a2 = v40 | ((unint64_t)(v82 - 1) << 32);
          BOOL v86 = (_DWORD)v82 == 0;
          if ((_DWORD)v82) {
            uint64_t v38 = v82;
          }
          else {
            uint64_t v38 = 0LL;
          }
          if ((_DWORD)v82) {
            int v4 = (unsigned __int16 *)(v85 - v40);
          }
          else {
            int v4 = (unsigned __int16 *)v85;
          }
          if (v86) {
            unint64_t v39 = v84;
          }
          else {
            unint64_t v39 = a2;
          }
        }

        else
        {
          int v4 = (unsigned __int16 *)(v30 + 2);
          unint64_t v39 = *v30;
          uint64_t v38 = v30[1];
          unint64_t v40 = v39;
        }

        unint64_t v41 = v38 * (unint64_t)v40;
        if ((v41 & 0xFFFFFFFF00000000LL) != 0) {
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  a3,  a4,  v38,  v24 & 0xFFFFFFFFFFFFFFFCLL,  v40,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
        }
        unint64_t v5 = HIDWORD(v39);
        unint64_t v42 = (unint64_t)v30 + v41 + 8;
        if ((unint64_t)v4 >= v42)
        {
          unint64_t v24 = v39 | (v5 << 32);
          unint64_t v98 = (unint64_t)v30;
          unint64_t v99 = v24;
          int v100 = v4;
LABEL_103:
          if (v28 == 2 && v30)
          {
            if (DisablePreattachedCategories)
            {
              uint64_t v57 = *v30;
              uint64_t v79 = v30[1];
              unint64_t v80 = v79 * (unint64_t)v57;
              if ((v80 & 0xFFFFFFFF00000000LL) != 0) {
                _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  a3,  a4,  v79,  v30,  v57,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
              }
              uint64_t v81 = (uint64_t)v30 + v80 + 8;
              if ((_DWORD)v79) {
                uint64_t v58 = v79;
              }
              else {
                uint64_t v58 = 0LL;
              }
              if ((_DWORD)v79) {
                unint64_t v24 = v81 - v57;
              }
              else {
                unint64_t v24 = v81;
              }
            }

            else
            {
              unint64_t v24 = (unint64_t)(v30 + 2);
              uint64_t v57 = *v30;
              uint64_t v58 = v30[1];
            }

            unint64_t v59 = v58 * (unint64_t)v57;
            if ((v59 & 0xFFFFFFFF00000000LL) != 0) {
              _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  a3,  a4,  v58,  v30,  v57,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
            }
            unint64_t v5 = (unint64_t)v30 + v59 + 8;
            if (v24 >= v5)
            {
              BOOL v52 = 1;
              int v4 = (unsigned __int16 *)v30;
              goto LABEL_113;
            }

            do
            {
              v24 += v57;
            }

            while (v24 < v5);
            int v4 = (unsigned __int16 *)v30;
          }

          goto LABEL_40;
        }

        do
        {
          if ((*(void *)(objc_debug_headerInfoRWs + 8LL * *v4 + 8) & 1) != 0) {
            break;
          }
          int v4 = (unsigned __int16 *)((char *)v4 + v39);
          unint64_t v5 = (v5 + 1);
        }

        while ((unint64_t)v4 < v42);
        unint64_t v5 = v39 | (v5 << 32);
        unint64_t v98 = v24 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v99 = v5;
        int v100 = v4;
        int v4 = (unsigned __int16 *)(v24 & 0xFFFFFFFFFFFFFFFCLL);
        if (!v29)
        {
LABEL_43:
          uint64_t v31 = 0LL;
          unint64_t v32 = 0LL;
          if (!v4) {
            goto LABEL_138;
          }
          goto LABEL_123;
        }
      }
    }

    else
    {
      unint64_t v24 = (unint64_t)(v30 + 2);
      unint64_t v98 = (unint64_t)(v30 + 2);
    }

    if (v28 == 1 && v30)
    {
      int v4 = (unsigned __int16 *)(v30 + 2);
      goto LABEL_91;
    }

    goto LABEL_103;
  }

  int v4 = 0LL;
  unint64_t v98 = 0LL;
LABEL_40:
  if (!v28) {
    goto LABEL_43;
  }
LABEL_91:
  BOOL v52 = v28 != 1;
  if (v28 == 1 && v30)
  {
    uint64_t v31 = (uint64_t)&v30[2 * *v30 + 2];
    unint64_t v32 = v31;
    goto LABEL_122;
  }

LABEL_113:
  unint64_t v32 = 0LL;
  if (v30 && v28 == 2)
  {
    unint64_t v5 = *v30;
    uint64_t v60 = v30[1];
    unint64_t v61 = v60 * (unint64_t)v5;
    if ((v61 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  0LL,  a3,  a4,  v60,  v30,  v5,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101);
    }
    a3 = (char *)v30 + v61 + 8;
    unint64_t v32 = (unint64_t)v30;
  }

  if (!v52)
  {
    uint64_t v31 = (uint64_t)v30;
LABEL_122:
    if (v4 == (unsigned __int16 *)v32)
    {
      unint64_t v32 = (unint64_t)v4;
      goto LABEL_138;
    }

    goto LABEL_123;
  }

  uint64_t v31 = (uint64_t)v30;
  if (v28 == 2 && (const char *)v24 == a3)
  {
LABEL_136:
    unint64_t v32 = (unint64_t)v30;
    goto LABEL_138;
  }

LABEL_123:
  uint64_t v62 = *(void *)(v20 + 8);
  unint64_t v63 = (void *)(v62 & 0xFFFFFFFFFFFFFFFELL);
  if ((v62 & 1) != 0) {
    unint64_t v63 = (void *)*v63;
  }
  if (v63[4] > 1uLL)
  {
    if (v28 == 1) {
      uint64_t v64 = -1LL;
    }
    else {
      uint64_t v64 = 0LL;
    }
    unint64_t v65 = v31 + 8 * v64;
    if (v29) {
      unint64_t v32 = v65;
    }
    else {
      unint64_t v32 = (unint64_t)v30;
    }
    if (v28 == 2)
    {
      do
        a3 -= v5;
      while ((*(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)a3 + 8) & 1) == 0);
    }

    goto LABEL_138;
  }

  int v30 = (unsigned int *)v31;
  if (v28 == 2) {
    goto LABEL_136;
  }
LABEL_138:
  char v56 = objc::Scanner::scanMethodLists<list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::ListIterator>( (uint64_t)&v97,  v32,  (unint64_t)a3);
  int v14 = 0;
  int v12 = 0;
  BOOL v11 = 0;
LABEL_139:
  LOBYTE(v7) = v56 | v7;
  if ((v7 & 1) == 0)
  {
    uint64_t v66 = (unsigned __int16 *)&this[3].isa + 3;
    do
      unsigned __int16 v67 = __ldxr(v66);
    while (__stxr(v67 | 0x4000, v66));
    goto LABEL_142;
  }

LABEL_30:
  uint64_t v26 = (unsigned __int16 *)&this[3].isa + 3;
  do
    unsigned __int16 v27 = __ldxr(v26);
  while (__stxr(v27 & 0xBFFF, v26));
LABEL_142:
  uint64_t v68 = (unint64_t *)&this[4];
  unint64_t v69 = __ldxr((unint64_t *)&this[4]);
  if ((v7 & 4) != 0)
  {
    unint64_t v71 = v69 & 0xFFFFFFFFFFFFFFFBLL;
    for (BOOL j = v69 == 0; ; BOOL j = v74 == 0)
    {
      unint64_t v73 = j ? 0x8000000000000000LL : v71;
      if (!__stlxr(v73, v68)) {
        break;
      }
      unint64_t v74 = __ldxr(v68);
      unint64_t v71 = v74 & 0xFFFFFFFFFFFFFFFBLL;
    }
  }

  else
  {
    while (1)
    {
      unint64_t v70 = v69 ? v69 | 4 : 0x8000000000000004LL;
      if (!__stlxr(v70, v68)) {
        break;
      }
      unint64_t v69 = __ldxr(v68);
    }
  }

  if ((v7 & 0x10) == 0 || objc::Scanner::isSwiftObject(this, (objc_class *)a2, a3, a4))
  {
    unint64_t v75 = (unsigned __int16 *)&this[3].isa + 3;
    do
      unsigned __int16 v76 = __ldxr(v75);
    while (__stxr(v76 | 0x8000, v75));
  }

  else
  {
    BOOL v77 = (unsigned __int16 *)&this[3].isa + 3;
    do
      unsigned __int16 v78 = __ldxr(v77);
    while (__stxr(v78 & 0x7FFF, v77));
  }

uint64_t objc::Scanner::scanMethodLists<list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::ListIterator>( uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v5 = **(void **)a1 & 3LL;
  if (v5 == 2)
  {
    int v4 = *(unsigned int **)(a1 + 8);
    uint64_t v6 = *(unsigned int *)(a1 + 16);
    unsigned int v3 = *(uint64_t **)(a1 + 24);
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v5 <= 1) {
      int v4 = *(unsigned int **)(a1 + 8);
    }
  }

  uint64_t result = 0LL;
  while (v5 == 2)
  {
    uint64_t v10 = *v4;
    uint64_t v9 = v4[1];
    unint64_t v11 = v9 * (unint64_t)v10;
    if ((v11 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  sel_retain,  sel_release,  sel_autorelease,  sel__tryRetain,  sel__isDeallocating,  sel_retainCount,  v9,  v4,  v10);
    }
    int v12 = (unsigned int *)((char *)v3 + (*v3 >> 16));
    unint64_t v13 = (unint64_t)v4 + v11 + 8;
    int v14 = (uint64_t *)((char *)v3 + v6);
    do
    {
      unsigned int v3 = v14;
      uint64_t v15 = *(void *)(objc_debug_headerInfoRWs + 8LL * *(unsigned __int16 *)v14 + 8);
      int v14 = (uint64_t *)((char *)v14 + v6);
    }

    while ((v15 & 1) == 0);
LABEL_20:
    unsigned int v8 = v4;
    int v4 = v12;
LABEL_21:
    unint64_t v17 = *v4;
    unint64_t v18 = v17 >> 31;
    if ((v17 & 0x80000000) != 0)
    {
      uint64_t v19 = (unsigned __int16)v17 & 0xFFFC;
      uint64_t v20 = v4[1];
      unint64_t v40 = v20 * (unint64_t)v19;
      if (dataSegmentsRanges > (unint64_t)v4 || *(void *)algn_18C43FCB8 <= (unint64_t)v4)
      {
        if ((v40 & 0xFFFFFFFF00000000LL) != 0) {
LABEL_198:
        }
          _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  a2,  sel_retain,  sel_release,  sel_autorelease,  sel__tryRetain,  sel__isDeallocating,  sel_retainCount,  v20,  v4,  v19);
        unint64_t v59 = (unint64_t)(v4 + 2) & 0xFFFFFFFFFFFFFFFCLL | v18;
        unint64_t v60 = ((unint64_t)v4 + v40 + 8) & 0xFFFFFFFFFFFFFFFCLL | v18;
        int v4 = v8;
        if (v59 != v60)
        {
          do
          {
            uint64_t v61 = 0LL;
            while (1)
            {
              uint64_t v62 = *(char **)(((v59 + v61) & 0xFFFFFFFFFFFFFFFCLL) + *(int *)((v59 + v61) & 0xFFFFFFFFFFFFFFFCLL));
              if ((objc::InterestingSelectorZeroes & (unint64_t)v62) == 0
                && (objc::InterestingSelectorOnes & (unint64_t)v62) == objc::InterestingSelectorOnes)
              {
                break;
              }

              v61 += v19;
              if (v59 + v61 == v60) {
                goto LABEL_194;
              }
            }

            if (sel_alloc == v62 || sel_allocWithZone_ == v62)
            {
              uint64_t result = result | 1;
            }

            else if (sel_retain == v62 {
                   || sel_release == v62
            }
                   || sel_autorelease == v62
                   || sel__tryRetain == v62
                   || sel__isDeallocating == v62
                   || sel_retainCount == v62
                   || sel_allowsWeakReference == v62
                   || sel_retainWeakReference == v62)
            {
              uint64_t result = result | 4;
            }

            else if (sel_respondsToSelector_ == v62 {
                   || sel_isKindOfClass_ == v62
            }
                   || sel_class == v62
                   || sel_self == v62
                   || &sel_new == (_UNKNOWN *)v62)
            {
              uint64_t result = result | 0x10;
            }

            else
            {
              uint64_t result = result;
            }

            if ((_DWORD)result == 21) {
              break;
            }
            v59 += v61 + v19;
          }

          while (v59 != v60);
LABEL_194:
          int v4 = v8;
        }
      }

      else
      {
        if ((v40 & 0xFFFFFFFF00000000LL) != 0) {
          goto LABEL_198;
        }
        unint64_t v41 = (unint64_t)(v4 + 2) & 0xFFFFFFFFFFFFFFFCLL | v18;
        unint64_t v42 = ((unint64_t)v4 + v40 + 8) & 0xFFFFFFFFFFFFFFFCLL | v18;
        int v4 = v8;
        if (v41 != v42)
        {
          do
          {
            uint64_t v43 = 0LL;
            while (1)
            {
              uint64_t v44 = v41 + v43;
              unint64_t v45 = (char *)&unk_18E7BB5A8 + *(int *)((v41 + v43) & 0xFFFFFFFFFFFFFFFCLL);
              if (((unint64_t)v45 & objc::InterestingSelectorZeroes) == 0
                && (objc::InterestingSelectorOnes & (unint64_t)v45) == objc::InterestingSelectorOnes)
              {
                break;
              }

              v43 += v19;
              if (v41 + v43 == v42) {
                goto LABEL_194;
              }
            }

            if (sel_alloc == v45 || sel_allocWithZone_ == v45)
            {
              uint64_t result = result | 1;
            }

            else if (sel_retain == v45 {
                   || sel_release == v45
            }
                   || sel_autorelease == v45
                   || sel__tryRetain == v45
                   || sel__isDeallocating == v45
                   || sel_retainCount == v45
                   || sel_allowsWeakReference == v45
                   || sel_retainWeakReference == v45)
            {
              uint64_t result = result | 4;
            }

            else if (sel_respondsToSelector_ == v45 {
                   || sel_isKindOfClass_ == v45
            }
                   || sel_class == v45
                   || sel_self == v45
                   || &sel_new == (_UNKNOWN *)v45)
            {
              uint64_t result = result | 0x10;
            }

            else
            {
              uint64_t result = result;
            }

            if ((_DWORD)result == 21) {
              break;
            }
            unint64_t v41 = v44 + v19;
          }

          while (v44 + v19 != v42);
          goto LABEL_194;
        }
      }
    }

    else
    {
      uint64_t v19 = (unsigned __int16)v17 & 0xFFFC;
      uint64_t v20 = v4[1];
      unint64_t v21 = v20 * (unint64_t)v19;
      if ((v21 & 0xFFFFFFFF00000000LL) != 0) {
        goto LABEL_198;
      }
      unint64_t v22 = (unint64_t)(v4 + 2) & 0xFFFFFFFFFFFFFFFCLL | v18;
      unint64_t v23 = ((unint64_t)v4 + v21 + 8) & 0xFFFFFFFFFFFFFFFCLL | v18;
      int v4 = v8;
      if (v22 != v23)
      {
        do
        {
          uint64_t v24 = 0LL;
          while (1)
          {
            uint64_t v25 = v22 + v24;
            uint64_t v26 = *(char **)((v22 + v24) & 0xFFFFFFFFFFFFFFFCLL);
            if ((objc::InterestingSelectorZeroes & (unint64_t)v26) == 0
              && (objc::InterestingSelectorOnes & (unint64_t)v26) == objc::InterestingSelectorOnes)
            {
              break;
            }

            v24 += v19;
            if (v22 + v24 == v23) {
              goto LABEL_194;
            }
          }

          if (sel_alloc == v26 || sel_allocWithZone_ == v26)
          {
            uint64_t result = result | 1;
          }

          else if (sel_retain == v26 {
                 || sel_release == v26
          }
                 || sel_autorelease == v26
                 || sel__tryRetain == v26
                 || sel__isDeallocating == v26
                 || sel_retainCount == v26
                 || sel_allowsWeakReference == v26
                 || sel_retainWeakReference == v26)
          {
            uint64_t result = result | 4;
          }

          else if (sel_respondsToSelector_ == v26 {
                 || sel_isKindOfClass_ == v26
          }
                 || sel_class == v26
                 || sel_self == v26
                 || &sel_new == (_UNKNOWN *)v26)
          {
            uint64_t result = result | 0x10;
          }

          else
          {
            uint64_t result = result;
          }

          if ((_DWORD)result == 21) {
            break;
          }
          unint64_t v22 = v25 + v19;
        }

        while (v25 + v19 != v23);
        goto LABEL_194;
      }
    }
  }

  if (v5 == 1)
  {
    unint64_t v16 = *(unsigned int **)v4;
    v4 += 2;
    int v12 = v16;
    goto LABEL_20;
  }

  if (!v5)
  {
    if (!v4 || a2) {
      return result;
    }
    unsigned int v8 = 0LL;
    goto LABEL_21;
  }

  return 0LL;
}

BOOL objc::Scanner::isSwiftObject(objc_class *this, objc_class *a2, const char *a3, char *a4)
{
  BOOL result = 0;
  if (!this[1].isa || (objc_class *)((uint64_t)this->isa & 0xFFFFFFFF8LL) == this)
  {
    int v4 = (const char *)objc_class::mangledName(this, (uint64_t)a2, a3, a4);
    if (!strcmp(v4, "_TtCs12_SwiftObject")) {
      return 1;
    }
  }

  return result;
}

void objc_setHook_lazyClassNamer(objc_hook_lazyClassNamer newValue, objc_hook_lazyClassNamer *oldOutValue)
{
  uint64_t v2 = LazyClassNamerHook;
  *oldOutValue = (objc_hook_lazyClassNamer)LazyClassNamerHook;
  unsigned int v3 = (const char *(__cdecl *)(Class))__ldxr((unint64_t *)&LazyClassNamerHook);
  if ((char *)v3 != (char *)v2)
  {
    __clrex();
LABEL_5:
    while (1)
    {
      *oldOutValue = v3;
      unint64_t v4 = __ldxr((unint64_t *)&LazyClassNamerHook);
      int v5 = 1;
LABEL_10:
      unsigned int v3 = (const char *(__cdecl *)(Class))v4;
      if (v5) {
        return;
      }
    }

    __clrex();
LABEL_9:
    int v5 = 0;
    goto LABEL_10;
  }

const uint8_t *__cdecl class_getIvarLayout(const uint8_t *cls)
{
  if (cls)
  {
    uint64_t v1 = *(void *)((*((void *)cls + 4) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFELL;
    if ((v1 & 1) != 0) {
      unint64_t v2 = *(void *)v2;
    }
    if ((*(_BYTE *)v2 & 1) != 0) {
      return 0LL;
    }
    else {
      return *(const uint8_t **)(v2 + 16);
    }
  }

  return cls;
}

const uint8_t *__cdecl class_getWeakIvarLayout(const uint8_t *cls)
{
  if (cls)
  {
    uint64_t v1 = *(void *)((*((void *)cls + 4) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFELL;
    if ((v1 & 1) != 0) {
      unint64_t v2 = *(void *)v2;
    }
    return *(const uint8_t **)(v2 + 56);
  }

  return cls;
}

void class_setIvarLayout(Class cls, const uint8_t *layout)
{
  if (cls)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v5, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
      || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
      || (uint64_t v7 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
          qword_18C43FCC8 <= v7)
      || (*(void *)(qword_18C43FCC0 + 16 * v7) <= (unint64_t)cls
        ? (BOOL v8 = *(void *)(qword_18C43FCC0 + 16 * v7 + 8) > (unint64_t)cls)
        : (BOOL v8 = 0),
          !v8))
    {
      if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
        && (dataSegmentsContain(cls, v17, v18) & 1) == 0)
      {
        _objc_fatal("Attempt to use unknown class %p.", v19, v20, v21, cls);
      }
    }

    if ((*(_BYTE *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 3) & 4) != 0)
    {
      unint64_t ro_writeable_nolock = make_ro_writeable_nolock((int *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL));
      unint64_t v11 = ro_writeable_nolock;
      if ((*(_BYTE *)ro_writeable_nolock & 1) == 0)
      {
        int v12 = *(void **)(ro_writeable_nolock + 16);
        if (v12)
        {
        }
      }

      if (layout)
      {
        size_t v13 = strlen((const char *)layout) + 1;
        if ((_dyld_is_memory_immutable() & 1) == 0)
        {
          int v14 = malloc(v13);
          memcpy(v14, layout, v13);
          layout = (const uint8_t *)v14;
        }
      }

      *(void *)(v11 + 16) = layout;
    }

    else
    {
      uint64_t v9 = (const char *)objc_class::nameForLogging(cls);
      _objc_inform("*** Can't set ivar layout for already-registered class '%s'", v9);
    }

    int v15 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v16 = __ldxr(runtimeLock);
      if (v16 != v15) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_180037564(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void class_setWeakIvarLayout(Class cls, const uint8_t *layout)
{
  if (cls)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v5, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
      || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
      || (uint64_t v7 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
          qword_18C43FCC8 <= v7)
      || (*(void *)(qword_18C43FCC0 + 16 * v7) <= (unint64_t)cls
        ? (BOOL v8 = *(void *)(qword_18C43FCC0 + 16 * v7 + 8) > (unint64_t)cls)
        : (BOOL v8 = 0),
          !v8))
    {
      if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
        && (dataSegmentsContain(cls, v17, v18) & 1) == 0)
      {
        _objc_fatal("Attempt to use unknown class %p.", v19, v20, v21, cls);
      }
    }

    if ((*(_BYTE *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 3) & 4) != 0)
    {
      unint64_t ro_writeable_nolock = make_ro_writeable_nolock((int *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL));
      unint64_t v11 = ro_writeable_nolock;
      int v12 = *(void **)(ro_writeable_nolock + 56);
      if (layout)
      {
        size_t v13 = strlen((const char *)layout) + 1;
        if ((_dyld_is_memory_immutable() & 1) == 0)
        {
          int v14 = malloc(v13);
          memcpy(v14, layout, v13);
          layout = (const uint8_t *)v14;
        }
      }

      *(void *)(v11 + 56) = layout;
    }

    else
    {
      uint64_t v9 = (const char *)objc_class::nameForLogging(cls);
      _objc_inform("*** Can't set weak ivar layout for already-registered class '%s'", v9);
    }

    int v15 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v16 = __ldxr(runtimeLock);
      if (v16 != v15) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_18003777C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t _class_getVariable(objc_class *a1, const char *a2, const char *a3, char *a4)
{
  Class isa = a1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v7, runtimeLock))
    {
      if (a1) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
  if (!isa)
  {
LABEL_7:
    uint64_t Ivar = 0LL;
    goto LABEL_8;
  }

void sub_180037878(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t getIvar(objc_class *a1, const char *__s1, const char *a3, char *a4)
{
  uint64_t v5 = *(void *)(((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  uint64_t v6 = (void *)(v5 & 0xFFFFFFFFFFFFFFFELL);
  if ((v5 & 1) != 0) {
    uint64_t v6 = (void *)*v6;
  }
  unsigned int v7 = (unsigned int *)v6[6];
  if (!v7) {
    return 0LL;
  }
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  unint64_t v10 = v8 * (unint64_t)v9;
  if ((v10 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", (uint64_t)__s1, a3, a4, v8, v7, v9);
  }
  if (!(_DWORD)v10) {
    return 0LL;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = v10;
  while (1)
  {
    if (*(void *)((char *)v7 + v11 + 8))
    {
      size_t v13 = *(const char **)((char *)v7 + v11 + 16);
      if (v13)
      {
        if (!strcmp(__s1, v13)) {
          break;
        }
      }
    }

    v11 += v9;
    if (v12 == v11) {
      return 0LL;
    }
  }

  return (uint64_t)v7 + v11 + 8;
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  BOOL v4 = 0;
  if (!cls || !protocol) {
    return v4;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v8, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v10 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v10)
    || (*(void *)(qword_18C43FCC0 + 16 * v10) <= (unint64_t)cls
      ? (BOOL v11 = *(void *)(qword_18C43FCC0 + 16 * v10 + 8) > (unint64_t)cls)
      : (BOOL v11 = 0),
        !v11))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, v30, (unsigned int *)v2) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v31, v2, v3, cls);
    }
  }

  uint64_t v12 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
  if ((v12 & 1) != 0)
  {
    unint64_t v15 = *(void *)(v13 + 24);
  }

  else
  {
    unint64_t v35 = 0LL;
    uint64_t v14 = *(void *)(v13 + 40);
    unint64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
    if ((v14 & 1) != 0 || !v15)
    {
      uint64_t v16 = v14 & 1;
      if (v15) {
        BOOL v17 = v16 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        goto LABEL_26;
      }
      v15 |= 2uLL;
    }
  }

  unint64_t v35 = v15;
LABEL_26:
  list_array_tt<unsigned long,protocol_list_t,RawPtr>::begin((uint64_t)v33, &v35, v2, v3);
  list_array_tt<unsigned long,protocol_list_t,RawPtr>::end((uint64_t)v32, &v35, v18, v19);
  while (1)
  {
    BOOL v20 = list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator==((uint64_t)v33, v32);
    if (v20) {
      break;
    }
    uint64_t v21 = *v34;
    int v22 = canonical_protocol ? 0 : 0x20000000;
    if ((v22 & *(_DWORD *)(*v34 + 68)) == 0)
    {
      uint64_t v23 = getProtocol(*(const char **)(v21 + 8));
      if (v23) {
        uint64_t v21 = v23;
      }
    }

    if ((Protocol *)v21 == protocol
      || (protocol_conformsToProtocol_nolock((protocol_t *)v21, (const char **)protocol) & 1) != 0)
    {
      break;
    }

    list_array_tt<unsigned long,protocol_list_t,RawPtr>::iteratorImpl<false>::operator++(v33, v24, v25, v26);
  }

  BOOL v4 = !v20;
  int v27 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v28 = __ldxr(runtimeLock);
    if (v28 != v27) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v4;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v4;
}

void sub_180037B9C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  if (!cls) {
    return 0;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (types) {
    uint64_t v12 = (char *)types;
  }
  else {
    uint64_t v12 = "";
  }
  BOOL v11 = addMethod(cls, (objc_selector *)name, (void (*)(void))imp, v12, 0) == 0;
  int v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(runtimeLock);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v11;
}

void sub_180037CBC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  if (!cls) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (types) {
    uint64_t v12 = (char *)types;
  }
  else {
    uint64_t v12 = "";
  }
  BOOL v11 = (id (*)(id, SEL, ...))addMethod(cls, (objc_selector *)name, (void (*)(void))imp, v12, 1);
  int v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v14 = __ldxr(runtimeLock);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v11;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v11;
}

void sub_180037DC8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *class_addMethodsBulk( objc_class *a1, objc_selector **a2, void (**a3)(void), const char **a4, method_list_t *a5, unsigned int *a6)
{
  if (a1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v13 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v13, runtimeLock)) {
        goto LABEL_10;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    uint64_t v16 = addMethods(a1, a2, a3, a4, a5, 0, a6);
    int v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v18 = __ldxr(runtimeLock);
      if (v18 != v17) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return v16;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  else
  {
    if (a6) {
      *a6 = a5;
    }
    size_t v15 = 8LL * a5;
    uint64_t v16 = malloc(v15);
    memcpy(v16, a2, v15);
  }

  return v16;
}

void sub_180037F00(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *addMethods( objc_class *a1, objc_selector **a2, void (**a3)(void), const char **a4, method_list_t *this, unsigned int a6, unsigned int *a7)
{
  unsigned int v8 = this;
  unsigned int v9 = a4;
  uint64_t v10 = a3;
  MethodList = method_list_t::allocateMethodList(this, 3LL, (const char *)a3, (char *)a4);
  uint64_t v16 = MethodList;
  MethodList[1] = 0;
  if (v8)
  {
    int v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = v8;
    uint64_t v38 = a7;
    unint64_t v39 = *(void *)algn_18C43FCB8;
    unint64_t v40 = dataSegmentsRanges;
    __uint64_t size = v8 + 1;
    unint64_t v42 = MethodList;
    uint64_t v43 = a1;
    do
    {
      unint64_t MethodNoSuper_nolock = getMethodNoSuper_nolock(a1, *a2, v14, v15);
      if (MethodNoSuper_nolock)
      {
        unint64_t v25 = MethodNoSuper_nolock;
        unint64_t v26 = a6;
        if ((a6 & 1) != 0)
        {
          _method_setImplementation(a1, MethodNoSuper_nolock, *v10);
        }

        else
        {
          if (!v17) {
            int v17 = calloc(8uLL, __size);
          }
          int v34 = v25 & 3;
          if ((v25 & 3) == 0 || v34 == 2)
          {
            unint64_t v26 = *(void *)(v25 & 0xFFFFFFFFFFFFFFFCLL);
          }

          else if (v34 == 1)
          {
            unint64_t v35 = v25 & 0xFFFFFFFFFFFFFFFCLL;
            uint64_t v36 = *(int *)(v25 & 0xFFFFFFFFFFFFFFFCLL);
            if (v40 > (v25 & 0xFFFFFFFFFFFFFFFCLL) || v39 <= v35) {
              unint64_t v26 = *(void *)(v35 + v36);
            }
            else {
              unint64_t v26 = (unint64_t)&unk_18E7BB5A8 + v36;
            }
          }

          v17[v18] = v26;
          uint64_t v18 = (v18 + 1);
        }
      }

      else
      {
        entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd(v16, v21, v14, v15);
        unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFFCLL;
        *(void *)(v27 & 0xFFFFFFFFFFFFFFFCLL) = *a2;
        BOOL v29 = *v9;
        size_t v30 = strlen(*v9) + 1;
        if ((_dyld_is_memory_immutable() & 1) == 0)
        {
          uint64_t v31 = v17;
          uint64_t v32 = v18;
          unint64_t v33 = malloc(v30);
          memcpy(v33, v29, v30);
          BOOL v29 = (const char *)v33;
          uint64_t v18 = v32;
          int v17 = v31;
          uint64_t v16 = v42;
        }

        *(void *)(v28 + 8) = v29;
        *(void *)(v28 + 16) = *v10;
        ++v16[1];
        a1 = v43;
      }

      ++v10;
      ++v9;
      ++a2;
      --v19;
    }

    while (v19);
    if (v16[1])
    {
      addMethods_finish(a1, (method_list_t *)v16, v14, v15, v22, v23, v24);
      a7 = v38;
      if (!v38) {
        return v17;
      }
      goto LABEL_28;
    }

    a7 = v38;
  }

  else
  {
    int v17 = 0LL;
    LODWORD(v18) = 0;
  }

  free((void *)((unint64_t)v16 & 0xFFFFFFFFFFFFFFFLL));
  if (a7) {
LABEL_28:
  }
    *a7 = v18;
  return v17;
}

void class_replaceMethodsBulk( objc_class *a1, objc_selector **a2, void (**a3)(void), const char **a4, method_list_t *this)
{
  if (a1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v11 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v11, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    addMethods(a1, a2, a3, a4, this, 1u, 0LL);
    int v13 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v14 = __ldxr(runtimeLock);
      if (v14 != v13) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

void sub_18003823C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL class_addIvar(Class cls, const char *name, size_t size, uint8_t alignment, const char *types)
{
  if (!cls) {
    return 0;
  }
  int v5 = alignment;
  if (types) {
    unsigned int v8 = types;
  }
  else {
    unsigned int v8 = "";
  }
  if (name)
  {
    if (*name) {
      unsigned int v9 = name;
    }
    else {
      unsigned int v9 = 0LL;
    }
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v12 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v12, runtimeLock)) {
      goto LABEL_16;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_16:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v14 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v14)
    || (*(void *)(qword_18C43FCC0 + 16 * v14) <= (unint64_t)cls
      ? (BOOL v15 = *(void *)(qword_18C43FCC0 + 16 * v14 + 8) > (unint64_t)cls)
      : (BOOL v15 = 0),
        !v15))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, v48, (unsigned int *)size) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v49, (const char *)size, (char *)alignment, cls);
    }
  }

  if ((HIWORD(cls[3].isa) & 4) != 0) {
    goto LABEL_26;
  }
  uint64_t v16 = (uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL;
  if ((*(_BYTE *)(v16 + 3) & 4) == 0) {
    goto LABEL_26;
  }
  if (v9)
  {
    uint64_t Ivar = getIvar(cls, v9, (const char *)size, (char *)alignment);
    BOOL v10 = 0;
    if (HIDWORD(size) || Ivar) {
      goto LABEL_27;
    }
    uint64_t v16 = (uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL;
  }

  else if (HIDWORD(size))
  {
LABEL_26:
    BOOL v10 = 0;
    goto LABEL_27;
  }

  unint64_t ro_writeable_nolock = make_ro_writeable_nolock((int *)v16);
  uint64_t v24 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v25 = (void *)(v24 & 0xFFFFFFFFFFFFFFFELL);
  if ((v24 & 1) != 0) {
    unint64_t v25 = (void *)*v25;
  }
  unint64_t v26 = (unsigned int *)v25[6];
  unint64_t v50 = v8;
  if (v26)
  {
    uint64_t v27 = *v26;
    unint64_t v28 = v26[1] * (unint64_t)v27;
    if ((v28 & 0xFFFFFFFF00000000LL) != 0) {
      _objc_fatal("entsize_list_tt overflow: count %u with entsize %u", v21, v22, v23, v26[1], v27);
    }
    size_t v29 = v28 + 8LL;
    size_t v30 = (unsigned int *)calloc(v29 + v27, 1uLL);
    memcpy(v30, v26, v29);
    free(v26);
    unsigned int v8 = v50;
  }

  else
  {
    size_t v30 = (unsigned int *)calloc(0x28uLL, 1uLL);
    *size_t v30 = 32;
  }

  uint64_t v34 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
  unint64_t v35 = v34 & 0xFFFFFFFFFFFFFFFELL;
  if ((v34 & 1) != 0) {
    unint64_t v35 = *(void *)v35;
  }
  int v36 = *(_DWORD *)(v35 + 8);
  uint64_t v38 = *v30;
  uint64_t v37 = v30[1];
  v30[1] = v37 + 1;
  unint64_t v39 = v37 * (unint64_t)v38;
  if ((v39 & 0xFFFFFFFF00000000LL) != 0) {
    _objc_fatal("entsize_list_tt overflow: index %u in list %p with entsize %u", v31, v32, v33, v37, v30, v38);
  }
  int v40 = (v36 + ~(-1 << v5)) & (-1 << v5);
  unint64_t v41 = (char *)v30 + v39;
  unint64_t v42 = malloc(4uLL);
  *((void *)v41 + 1) = v42;
  uint64_t v43 = v41 + 8;
  int v51 = v40;
  _DWORD *v42 = v40;
  if (v9)
  {
    size_t v44 = strlen(v9) + 1;
    if ((_dyld_is_memory_immutable() & 1) == 0)
    {
      unint64_t v45 = malloc(v44);
      memcpy(v45, v9, v44);
      unsigned int v9 = (const char *)v45;
      unsigned int v8 = v50;
    }
  }

  *((void *)v43 + 1) = v9;
  size_t v46 = strlen(v8) + 1;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    unint64_t v47 = malloc(v46);
    memcpy(v47, v8, v46);
    unsigned int v8 = (const char *)v47;
  }

  *((void *)v43 + 2) = v8;
  *((_DWORD *)v43 + 6) = v5;
  *((_DWORD *)v43 + 7) = size;
  *(void *)(ro_writeable_nolock + 48) = v30;
  objc_class::setInstanceSize(cls, v51 + size);
  BOOL v10 = 1;
LABEL_27:
  int v17 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v18 = __ldxr(runtimeLock);
    if (v18 != v17) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v10;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v10;
}

void sub_180038608(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v1 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v2);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v2)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  if (cls)
  {
    Class v3 = cls;
    if (class_conformsToProtocol(cls, protocol))
    {
      LOBYTE(cls) = 0;
    }

    else
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v5 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(runtimeLock))
      {
        if (!__stxr(v5, runtimeLock)) {
          goto LABEL_9;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_9:
      uint64_t v7 = (uint64_t)v3[4].isa & 0xF00007FFFFFFFF8LL;
      uint64_t v8 = *(void *)(v7 + 8);
      unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((v8 & 1) == 0) {
        unint64_t v9 = class_rw_t::extAlloc(v7, v8 & 0xFFFFFFFFFFFFFFFELL, 0);
      }
      BOOL v10 = malloc(0x10uLL);
      BOOL v15 = v10;
      *BOOL v10 = 1LL;
      v10[1] = protocol;
      else {
        unsigned int v11 = 0LL;
      }
      list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v9 + 24),  (unint64_t *)&v15,  (const char *)1,  0LL,  v11);
      int v12 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v13 = __ldxr(runtimeLock);
        if (v13 != v12) {
          break;
        }
        if (!__stlxr(0, runtimeLock)) {
          goto LABEL_19;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_19:
      LOBYTE(cls) = 1;
    }
  }

  return (char)cls;
}

void sub_180038764(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL class_addProperty( Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
  return _class_addProperty(cls, name, attributes, attributeCount, 0);
}

uint64_t _class_addProperty( Class cls, const char *name, const objc_property_attribute_t *a3, unsigned int a4, int a5)
{
  uint64_t result = 0LL;
  if (cls)
  {
    uint64_t v7 = name;
    if (name)
    {
      objc_property_t Property = class_getProperty(cls, name);
      objc_property_t v12 = Property;
      if (!Property || a5)
      {
        unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        unsigned int v14 = *(_DWORD *)(StatusReg + 24);
        while (!__ldaxr(runtimeLock))
        {
          if (!__stxr(v14, runtimeLock))
          {
            char v16 = 1;
            if (!Property) {
              goto LABEL_10;
            }
            goto LABEL_24;
          }
        }

        char v16 = 0;
        __clrex();
        if (!Property)
        {
LABEL_10:
          if ((v16 & 1) == 0) {
            os_unfair_lock_lock_with_options();
          }
          uint64_t v17 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
          unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFFELL;
          if ((v17 & 1) == 0) {
            unint64_t v18 = class_rw_t::extAlloc((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL, v17 & 0xFFFFFFFFFFFFFFFELL, 0);
          }
          uint64_t v19 = malloc(0x18uLL);
          unint64_t v28 = v19;
          *uint64_t v19 = 0x100000010LL;
          size_t v20 = strlen(v7) + 1;
          if ((_dyld_is_memory_immutable() & 1) == 0)
          {
            uint64_t v21 = malloc(v20);
            memcpy(v21, v7, v20);
            uint64_t v7 = (const char *)v21;
          }

          v19[1] = v7;
          v19[2] = copyPropertyAttributeString((uint64_t)a3, a4);
          else {
            uint64_t v22 = 0LL;
          }
          list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::attachLists( (unint64_t *)(v18 + 16),  (unint64_t *)&v28,  (const char *)1,  0LL,  v22);
          int v23 = *(_DWORD *)(StatusReg + 24);
          while (1)
          {
            unsigned int v24 = __ldxr(runtimeLock);
            if (v24 != v23) {
              break;
            }
            if (!__stlxr(0, runtimeLock)) {
              return 1LL;
            }
          }

          goto LABEL_33;
        }

LABEL_33:
        __clrex();
        os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
        return 1LL;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

void sub_1800389BC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void class_replaceProperty( Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
}

void objc_setHook_getClass(objc_hook_getClass newValue, objc_hook_getClass *outOldValue)
{
  uint64_t v2 = GetClassHook;
  *outOldValue = (objc_hook_getClass)GetClassHook;
  Class v3 = (BOOL (__cdecl *)(const char *, Class *))__ldxr((unint64_t *)&GetClassHook);
  if ((char *)v3 != (char *)v2)
  {
    __clrex();
LABEL_5:
    while (1)
    {
      *outOldValue = v3;
      unint64_t v4 = __ldxr((unint64_t *)&GetClassHook);
      int v5 = 1;
LABEL_10:
      Class v3 = (BOOL (__cdecl *)(const char *, Class *))v4;
      if (v5) {
        return;
      }
    }

    __clrex();
LABEL_9:
    int v5 = 0;
    goto LABEL_10;
  }

Class objc_duplicateClass(Class original, const char *name, size_t extraBytes)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  unint64_t v53 = StatusReg;
  if ((unint64_t)&original->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)original[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v7 = *(unsigned __int16 *)(((uint64_t)original[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v7)
    || (*(void *)(qword_18C43FCC0 + 16 * v7) <= (unint64_t)original
      ? (BOOL v8 = *(void *)(qword_18C43FCC0 + 16 * v7 + 8) > (unint64_t)original)
      : (BOOL v8 = 0),
        !v8))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)original)
      && (dataSegmentsContain(original, v48, v49) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v50, v51, v52, original);
    }
  }

  uint64_t v9 = (uint64_t)original[4].isa & 0xF00007FFFFFFFF8LL;
  uint64_t v10 = *(void *)(v9 + 8);
  unsigned int v11 = (void *)(v10 & 0xFFFFFFFFFFFFFFFELL);
  if ((v10 & 1) != 0) {
    unsigned int v11 = (void *)*v11;
  }
  objc_property_t v12 = (objc_class *)alloc_class_for_subclass(original);
  unsigned int v13 = v12;
  uint64_t v14 = (uint64_t)original->isa & 0xFFFFFFFF8LL;
  v12->Class isa = (Class)v14;
  v12[1].Class isa = original[1].isa;
  v12[2].Class isa = (Class)&_objc_empty_cache;
  v12[3].Class isa = 0LL;
  uint64_t v15 = (uint64_t)calloc(0x20uLL, 1uLL);
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v9 | 0x8080000;
  *(void *)(v15 + 16) = 0LL;
  *(void *)(v15 + 24) = 0LL;
  Class isa = original[4].isa;
  v13[4].Class isa = isa;
  __dmb(0xBu);
  v13[4].Class isa = (Class)(isa & 7 | (unint64_t)v15 | 0x8000000000000000LL);
  int v17 = *(_DWORD *)v11;
  if ((*(_DWORD *)v11 & 0x40) != 0) {
    size_t v18 = 80LL;
  }
  else {
    size_t v18 = 72LL;
  }
  uint64_t v19 = (unint64_t *)malloc(v18);
  memcpy(v19, v11, v18);
  size_t v20 = name;
  if ((v17 & 0x40) != 0) {
    v19[9] = v11[9];
  }
  size_t v21 = strlen(name) + 1;
  unint64_t v25 = v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL;
  int v26 = (void *)name;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    int v26 = malloc(v21);
    memcpy(v26, name, v21);
  }

  v19[3] = (unint64_t)v26;
  uint64_t v27 = *(void *)(v15 + 8);
  if ((v27 & 1) != 0)
  {
    *(void *)(v27 & 0xFFFFFFFFFFFFFFFELL) = v19;
    if (v25) {
      goto LABEL_28;
    }
LABEL_38:
    if (v19[4] >= 2) {
      class_rw_t::extAlloc(v15, (uint64_t)v19, 1);
    }
    goto LABEL_45;
  }

  *(void *)(v15 + 8) = v19;
  if (!v25) {
    goto LABEL_38;
  }
LABEL_28:
  uint64_t v28 = *(void *)(v15 + 8);
  unint64_t v29 = v28 & 0xFFFFFFFFFFFFFFFELL;
  if ((v28 & 1) == 0) {
    unint64_t v29 = class_rw_t::extAlloc(v15, v28 & 0xFFFFFFFFFFFFFFFELL, 0);
  }
  *(_DWORD *)(v29 + 40) = *(_DWORD *)((v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL) + 0x28);
  uint64_t v30 = *(void *)((v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL) + 8);
  uint64_t v31 = (unsigned int *)(v30 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v30 & 3) == 1 && v31)
  {
    uint64_t v32 = *v31;
    unint64_t v33 = (unint64_t)malloc(8 * v32 + 8);
    memcpy((void *)v33, v31, 8 * v32 + 8);
    *(void *)(v29 + 8) = v33 | 1;
    if ((_DWORD)v32)
    {
      unint64_t v37 = 1LL;
      do
        *(void *)(v33 + 8 * v37) = method_list_t::duplicate(*(method_list_t **)&v31[2 * v37], v34, v35, v36);
      while (v37++ < *v31);
    }
  }

  else
  {
    unint64_t v39 = 0LL;
    if ((v30 & 3) == 0 && v31) {
      unint64_t v39 = method_list_t::duplicate((method_list_t *)(v30 & 0xFFFFFFFFFFFFFFFCLL), v22, v23, v24);
    }
    *(void *)(v29 + 8) = v39;
  }

  *(void *)(v29 + 16) = *(void *)(v25 + 16);
  *(void *)(v29 + 24) = *(void *)(v25 + 24);
  size_t v20 = name;
LABEL_45:
  int v40 = v13[1].isa;
  if (v40)
  {
    addSubclass(v40, v13);
  }

  else
  {
    ++objc_debug_realized_class_generation_count;
    *(void *)(((uint64_t)v13[4].isa & 0xF00007FFFFFFFF8LL) + 0x18) = _firstRealizedClass;
    _firstRealizedClass = (uint64_t)v13;
  }

  unint64_t v41 = (char *)atomic_load(v19 + 3);
  addNamedClass(v13, v41, 0LL);
  addClassTableEntry((uint64_t)v13, 0);
  if (PrintConnecting)
  {
    unint64_t v42 = (const char *)objc_class::nameForLogging(original);
    _objc_inform("CLASS: realizing class '%s' (duplicate of %s) %p %p", v20, v42, v13, v19);
  }

  uint64_t v43 = (unsigned int *)((uint64_t)v13[4].isa & 0xF00007FFFFFFFF8LL);
  do
    unsigned int v44 = __ldxr(v43);
  while (__stxr(v44 & 0xFFF7FFFF, v43));
  int v45 = *(_DWORD *)(v53 + 24);
  while (1)
  {
    unsigned int v46 = __ldxr(runtimeLock);
    if (v46 != v45) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return v13;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return v13;
}

void sub_180038EDC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v15 = *(_DWORD *)(a13 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v13);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v13)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

char *alloc_class_for_subclass(objc_class *a1)
{
  size_t isa_low = LODWORD(a1[7].isa);
  Class v3 = (char *)a1 - HIDWORD(a1[7].isa);
  unint64_t v4 = (char *)malloc_zone_malloc_with_options_np();
  memcpy(v4, v3, isa_low);
  unsigned int v5 = &v4[HIDWORD(a1[7].isa)];
  *((void *)v5 + 4) = 0LL;
  *(_OWORD *)unsigned int v5 = 0u;
  *((_OWORD *)v5 + _class_addProperty(cls, name, attributes, attributeCount, 1) = 0u;
  *((void *)v5 + 8) = 0LL;
  else {
    uint64_t v6 = &qword_18C43F700;
  }
  if (classCopyFixupHandlers)
  {
    uint64_t v7 = 8LL * classCopyFixupHandlers;
    do
    {
      BOOL v8 = (void (*)(objc_class *, char *))*v6++;
      v8(a1, v5);
      v7 -= 8LL;
    }

    while (v7);
  }

  return v5;
}

objc_class *objc_initializeClassPair(objc_class *a1, char *a2, objc_class *a3, objc_class *a4)
{
  if (look_up_class(a2)) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v9, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (getClassExceptSomeSwift(a2)
    || a1
    && ((unint64_t)&a1->isa[-1].isa + 7 < 0xF
     || (*(_DWORD *)((uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL) & 0x84000000) != 0x80000000))
  {
    a3 = 0LL;
  }

  else
  {
    objc_initializeClassPair_internal(a1, a2, a3, a4);
  }

  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr(runtimeLock);
    if (v12 != v11) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return a3;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return a3;
}

void sub_180039114(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t objc_initializeClassPair_internal(objc_class *a1, const char *a2, objc_class *a3, objc_class *a4)
{
  unint64_t v8 = (unint64_t)calloc(0x20uLL, 1uLL);
  unint64_t v9 = (unint64_t)calloc(0x20uLL, 1uLL);
  uint64_t v10 = calloc(0x48uLL, 1uLL);
  int v11 = (unint64_t *)calloc(0x48uLL, 1uLL);
  unsigned int v12 = v11;
  *(_DWORD *)unint64_t v8 = -1945632768;
  *(_DWORD *)unint64_t v9 = -1945632767;
  *(_DWORD *)uint64_t v10 = 0;
  *(_DWORD *)int v11 = 1;
  unsigned int v13 = (unint64_t *)&a3[4];
  uint64_t v14 = (objc_class *)((uint64_t)a3[4].isa & 7 | v8 | 0x8000000000000000LL);
  __dmb(0xBu);
  a3[4].Class isa = v14;
  uint64_t v15 = *(void *)(v8 + 8);
  if ((v15 & 1) != 0) {
    *(void *)(v15 & 0xFFFFFFFFFFFFFFFELL) = v10;
  }
  else {
    *(void *)(v8 + 8) = v10;
  }
  unsigned int v16 = (unint64_t *)&a4[4];
  int v17 = (objc_class *)((uint64_t)a4[4].isa & 7 | v9 | 0x8000000000000000LL);
  __dmb(0xBu);
  a4[4].Class isa = v17;
  uint64_t v18 = *(void *)(v9 + 8);
  if ((v18 & 1) != 0) {
    *(void *)(v18 & 0xFFFFFFFFFFFFFFFELL) = v11;
  }
  else {
    *(void *)(v9 + 8) = v11;
  }
  if (a1)
  {
    uint64_t v19 = (uint64_t)a1[4].isa & 0xF00007FFFFFFFF8LL;
    *(_DWORD *)v8 |= *(_DWORD *)v19 & 0x100000;
    uint64_t v20 = *(void *)(v19 + 8);
    unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
    if ((v20 & 1) != 0) {
      unint64_t v21 = *(void *)v21;
    }
    *((_DWORD *)v10 + _class_addProperty(cls, name, attributes, attributeCount, 1) = *(_DWORD *)(v21 + 8);
    uint64_t v22 = *(void *)((*(void *)(((uint64_t)a1->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
    if ((v22 & 1) != 0) {
      unint64_t v23 = *(void *)v23;
    }
    *((_DWORD *)v11 + _class_addProperty(cls, name, attributes, attributeCount, 1) = *(_DWORD *)(v23 + 8);
    objc_class::setInstanceSize(a3, *((_DWORD *)v10 + 1));
    objc_class::setInstanceSize(a4, *((_DWORD *)v12 + 1));
    if (((uint64_t)a1[4].isa & 2) != 0)
    {
      do
      {
        unint64_t v24 = __ldxr(v13);
        if (v24) {
          unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFFCLL | 2;
        }
        else {
          unint64_t v25 = 0x8000000000000002LL;
        }
      }

      while (__stlxr(v25, v13));
      do
      {
        unint64_t v26 = __ldxr(v16);
        if (v26) {
          unint64_t v27 = v26 & 0xFFFFFFFFFFFFFFFCLL | 2;
        }
        else {
          unint64_t v27 = 0x8000000000000002LL;
        }
      }

      while (__stlxr(v27, v16));
    }

    if (((uint64_t)a1[4].isa & 1) != 0)
    {
      unint64_t v28 = __ldxr(v13);
      unint64_t v29 = v28 & 0xFFFFFFFFFFFFFFFCLL | 1;
      BOOL v30 = v28 == 0;
      unint64_t v31 = 0x8000000000000001LL;
      if (v30) {
        unint64_t v29 = 0x8000000000000001LL;
      }
      while (__stlxr(v29, v13))
      {
        unint64_t v32 = __ldxr(v13);
        if (v32) {
          unint64_t v29 = v32 & 0xFFFFFFFFFFFFFFFCLL | 1;
        }
        else {
          unint64_t v29 = 0x8000000000000001LL;
        }
      }

      unint64_t v36 = __ldxr(v16);
      if (v36) {
        unint64_t v31 = v36 & 0xFFFFFFFFFFFFFFFCLL | 1;
      }
      if (__stlxr(v31, v16))
      {
        do
        {
          unint64_t v50 = __ldxr(v16);
          if (v50) {
            unint64_t v51 = v50 & 0xFFFFFFFFFFFFFFFCLL | 1;
          }
          else {
            unint64_t v51 = 0x8000000000000001LL;
          }
        }

        while (__stlxr(v51, v16));
      }
    }
  }

  else
  {
    *(_DWORD *)v10 |= 2u;
    int v33 = *(_DWORD *)v11 | 2;
    *((_DWORD *)v10 + _class_addProperty(cls, name, attributes, attributeCount, 1) = 0;
    *(_DWORD *)int v11 = v33;
    *((_DWORD *)v11 + _class_addProperty(cls, name, attributes, attributeCount, 1) = 40;
    uint64_t v34 = *(void *)((*v13 & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v35 = v34 & 0xFFFFFFFFFFFFFFFELL;
    if ((v34 & 1) != 0) {
      unint64_t v35 = *(void *)v35;
    }
    if (*(_DWORD *)(v35 + 8) != 8) {
      *(_DWORD *)(v35 + 8) = 8;
    }
    HIWORD(a3[3].isa) = HIWORD(a3[3].isa) & 0xF007 | 0x10;
    objc_class::setInstanceSize(a4, *((_DWORD *)v11 + 1));
  }

  size_t v37 = strlen(a2) + 1;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    unint64_t v41 = malloc(v37);
    memcpy(v41, a2, v37);
    a2 = (const char *)v41;
  }

  atomic_store((unint64_t)a2, (unint64_t *)v10 + 3);
  atomic_store((unint64_t)a2, v12 + 3);
  *((void *)v10 + 2) = &UnsetLayout;
  *((void *)v10 + 7) = &UnsetLayout;
  a3[2].Class isa = (Class)&_objc_empty_cache;
  a3[3].Class isa = 0LL;
  a4[2].Class isa = (Class)&_objc_empty_cache;
  a4[3].Class isa = 0LL;
  unint64_t v42 = (unsigned __int16 *)&a4[3].isa + 3;
  do
    unsigned __int16 v43 = __ldxr(v42);
  while (__stxr(v43 | 4, v42));
  do
    unsigned __int16 v44 = __ldxr(v42);
  while (__stxr(v44 | 0x2000, v42));
  int v45 = DisableNonpointerIsa;
  if (!DisableNonpointerIsa && (*v42 & 0x2000) == 0)
  {
    a3->Class isa = (Class)((unint64_t)a4 & 0xFFFFFFFF8LL | 0x21A000000001LL);
    if (a1)
    {
      uint64_t v46 = *(void *)((uint64_t)a1->isa & 0xFFFFFFFF8LL) & 0xFFFFFFFF8LL;
      goto LABEL_49;
    }

LABEL_53:
    if ((*v42 & 0x2000) == 0)
    {
      if (((unint64_t)a4 & 0xFFFFFFF000000007LL) == 0)
      {
        uint64_t v48 = (objc_class *)((unint64_t)a4 & 0xFFFFFFFF8LL | 0x21A000000001LL);
LABEL_58:
        a4->Class isa = v48;
        a3[1].Class isa = 0LL;
        a4[1].Class isa = a3;
        ++objc_debug_realized_class_generation_count;
        *(void *)(((uint64_t)a3[4].isa & 0xF00007FFFFFFFF8LL) + 0x18) = _firstRealizedClass;
        _firstRealizedClass = (uint64_t)a3;
        unint64_t v47 = a3;
        goto LABEL_59;
      }

      goto LABEL_60;
    }

LABEL_56:
    if (((unint64_t)a4 & 0xFFFFFFF000000007LL) == 0)
    {
      uint64_t v48 = (objc_class *)((unint64_t)a4 & 0xFFFFFFFF8LL);
      goto LABEL_58;
    }

LABEL_60:
    _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v38, v39, v40, a4);
  }

  a3->Class isa = (Class)((unint64_t)a4 & 0xFFFFFFFF8LL);
  if (!a1)
  {
    if (v45) {
      goto LABEL_56;
    }
    goto LABEL_53;
  }

  uint64_t v46 = *(void *)((uint64_t)a1->isa & 0xFFFFFFFF8LL) & 0xFFFFFFFF8LL;
  if (!v45)
  {
LABEL_49:
    if ((*(_WORD *)(v46 + 30) & 0x2000) == 0) {
      v46 |= 0x21A000000001uLL;
    }
  }

  a4->Class isa = (Class)v46;
  a3[1].Class isa = a1;
  a4[1].Class isa = (Class)((uint64_t)a1->isa & 0xFFFFFFFF8LL);
  addSubclass(a1, a3);
  unint64_t v47 = (objc_class *)((uint64_t)a1->isa & 0xFFFFFFFF8LL);
LABEL_59:
  addSubclass(v47, a4);
  return addClassTableEntry((uint64_t)a3, 1);
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v7, runtimeLock)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if (getClassExceptSomeSwift((char *)name)
    || superclass
    && ((unint64_t)&superclass->isa[-1].isa + 7 < 0xF
     || (*(_DWORD *)((uint64_t)superclass[4].isa & 0xF00007FFFFFFFF8LL) & 0x84000000) != 0x80000000))
  {
    unsigned int v5 = 0LL;
  }

  else
  {
    unsigned int v5 = alloc_class_for_subclass(superclass);
    unsigned int v12 = alloc_class_for_subclass(superclass);
    objc_initializeClassPair_internal(superclass, name, (objc_class *)v5, (objc_class *)v12);
  }

  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr(runtimeLock);
    if (v10 != v9) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return (Class)v5;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return (Class)v5;
}

void sub_18003972C(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void objc_registerClassPair(Class cls)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v5 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v5)
    || (*(void *)(qword_18C43FCC0 + 16 * v5) <= (unint64_t)cls
      ? (BOOL v6 = *(void *)(qword_18C43FCC0 + 16 * v5 + 8) > (unint64_t)cls)
      : (BOOL v6 = 0),
        !v6))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, v26, v27) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v28, v29, v30, cls);
    }
  }

  unsigned int v7 = (_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL);
  if ((*v7 & 0x2000000) != 0
    || (unint64_t v8 = (unsigned int *)(*(void *)(((uint64_t)cls->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL),
        (*v8 & 0x2000000) != 0))
  {
    uint64_t v12 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    unsigned int v13 = (void *)(v12 & 0xFFFFFFFFFFFFFFFELL);
    uint64_t v14 = "objc_registerClassPair: class '%s' was already registered!";
    if ((v12 & 1) != 0) {
LABEL_38:
    }
      unsigned int v13 = (void *)*v13;
LABEL_23:
    unint64_t v15 = atomic_load(v13 + 3);
    _objc_inform(v14, v15);
    goto LABEL_24;
  }

  if ((*v7 & *v8 & 0x4000000) == 0)
  {
    uint64_t v25 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    unsigned int v13 = (void *)(v25 & 0xFFFFFFFFFFFFFFFELL);
    uint64_t v14 = "objc_registerClassPair: class '%s' was not allocated with objc_allocateClassPair!";
    if ((v25 & 1) != 0) {
      goto LABEL_38;
    }
    goto LABEL_23;
  }

void sub_1800399A8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

objc_class *objc_readClassPair(objc_class *a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  Class isa = a1[4].isa;
  BOOL v6 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  if (((unint64_t)isa & 0x8000000000000000LL) != 0)
  {
    uint64_t v7 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
    BOOL v6 = (void *)(v7 & 0xFFFFFFFFFFFFFFFELL);
    if ((v7 & 1) != 0) {
      BOOL v6 = (void *)*v6;
    }
  }

  Class v8 = a1[1].isa;
  if (v8)
  {
    if ((unint64_t)&v8->isa[-1].isa + 7 < 0xF
      || (*(_DWORD *)((uint64_t)v8[4].isa & 0xF00007FFFFFFFF8LL) & 0x84000000) != 0x80000000)
    {
      goto LABEL_12;
    }

void sub_180039B30(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void objc_disposeClassPair(Class cls)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v3, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if ((unint64_t)&cls->isa[-1].isa + 7 < 0xF
    || (*(_DWORD *)((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) & 0x80000000) == 0
    || (uint64_t v5 = *(unsigned __int16 *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 4),
        qword_18C43FCC8 <= v5)
    || (*(void *)(qword_18C43FCC0 + 16 * v5) <= (unint64_t)cls
      ? (BOOL v6 = *(void *)(qword_18C43FCC0 + 16 * v5 + 8) > (unint64_t)cls)
      : (BOOL v6 = 0),
        !v6))
  {
    if (objc::allocatedClasses + 8LL * qword_18C43F420 == objc::detail::DenseSetImpl<objc_class *,objc::DenseMap<objc_class *,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseSetPair<objc_class *>>,objc::DenseMapInfo<objc_class *>>::find((unint64_t)cls)
      && (dataSegmentsContain(cls, v24, v25) & 1) == 0)
    {
      _objc_fatal("Attempt to use unknown class %p.", v26, v27, v28, cls);
    }
  }

  if ((*(_BYTE *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 3) & 6) != 0
    && (uint64_t v7 = (objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL),
        uint64_t v8 = (uint64_t)v7[4].isa & 0xF00007FFFFFFFF8LL,
        (*(_BYTE *)(v8 + 3) & 6) != 0))
  {
    if ((HIWORD(cls[3].isa) & 4) == 0)
    {
      if (*(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 0x10))
      {
        uint64_t v9 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
        unsigned int v10 = (void *)(v9 & 0xFFFFFFFFFFFFFFFELL);
        if ((v9 & 1) != 0) {
          unsigned int v10 = (void *)*v10;
        }
        int v11 = (const char *)atomic_load(v10 + 3);
        _objc_inform("objc_disposeClassPair: class '%s' still has subclasses, including '%s'!", v11, v12);
        uint64_t v7 = (objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL);
        uint64_t v8 = (uint64_t)v7[4].isa & 0xF00007FFFFFFFF8LL;
      }

      if (*(void *)(v8 + 16))
      {
        uint64_t v13 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
        unint64_t v14 = (void *)(v13 & 0xFFFFFFFFFFFFFFFELL);
        if ((v13 & 1) != 0) {
          unint64_t v14 = (void *)*v14;
        }
        uint64_t v15 = (const char *)atomic_load(v14 + 3);
        int v16 = (const char *)objc_class::nameForLogging(*(objc_class **)((*(void *)(((uint64_t)cls->isa & 0xFFFFFFFF8LL)
                                                                                   + 0x20) & 0xF00007FFFFFFFF8LL)
                                                                      + 0x10));
        _objc_inform("objc_disposeClassPair: class '%s' still has subclasses, including '%s'!", v15, v16);
        uint64_t v7 = (objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL);
      }

      detach_class(v7, 1);
      detach_class(cls, 0);
      free_class((objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL));
      free_class(cls);
      goto LABEL_28;
    }

    uint64_t v23 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    uint64_t v18 = (void *)(v23 & 0xFFFFFFFFFFFFFFFELL);
    unsigned int v19 = "objc_disposeClassPair: class '%s' is a metaclass, not a class!";
    if ((v23 & 1) != 0) {
      goto LABEL_34;
    }
  }

  else
  {
    uint64_t v17 = *(void *)(((uint64_t)cls[4].isa & 0xF00007FFFFFFFF8LL) + 8);
    uint64_t v18 = (void *)(v17 & 0xFFFFFFFFFFFFFFFELL);
    unsigned int v19 = "objc_disposeClassPair: class '%s' was not allocated with objc_allocateClassPair!";
    if ((v17 & 1) != 0) {
LABEL_34:
    }
      uint64_t v18 = (void *)*v18;
  }

  unint64_t v20 = atomic_load(v18 + 3);
  _objc_inform(v19, v20);
LABEL_28:
  int v21 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v22 = __ldxr(runtimeLock);
    if (v22 != v21) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_180039E00(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

id objc_constructInstance(Class cls, void *bytes)
{
  id result = 0LL;
  if (cls && bytes)
  {
    __int16 isa_high = HIWORD(cls[3].isa);
    unint64_t v7 = (unint64_t)cls & 0xFFFFFFF000000007LL;
    if ((isa_high & 0x2000) != 0)
    {
      if (!v7)
      {
        unint64_t v9 = (unint64_t)cls & 0xFFFFFFFF8LL;
LABEL_10:
        *(void *)bytes = v9;
        id result = bytes;
        if ((isa_high & 2) != 0) {
          return object_cxxConstructFromClass((id (*)(id, SEL, ...))bytes, cls, 0);
        }
        return result;
      }
    }

    else if (!v7)
    {
      uint64_t v8 = 0x21A000000001LL;
      if ((isa_high & 1) != 0) {
        uint64_t v8 = 0x21A000000005LL;
      }
      unint64_t v9 = v8 | (unint64_t)cls & 0xFFFFFFFF8LL;
      goto LABEL_10;
    }

    _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", (uint64_t)bytes, v2, v3, cls);
  }

  return result;
}

id class_createInstance(id cls, size_t extraBytes)
{
  if (cls)
  {
    uint64_t v2 = (objc_class *)cls;
    __int16 v3 = *((_WORD *)cls + 15);
    if ((v3 & 0xFF8) != 0)
    {
      uint64_t v4 = (extraBytes + (v3 & 0xFF8) + 7) & 0xFFFFFFFFFFFFFFF0LL;
    }

    else
    {
      uint64_t v11 = *(void *)((*((void *)cls + 4) & 0xF00007FFFFFFFF8LL) + 8);
      unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((v11 & 1) != 0) {
        unint64_t v12 = *(void *)v12;
      }
      size_t v13 = ((*(_DWORD *)(v12 + 8) + 7) & 0xFFFFFFF8) + extraBytes;
      uint64_t v4 = v13 <= 0x10 ? 16LL : v13;
    }

    cls = calloc(1uLL, v4);
    if (cls)
    {
      unint64_t v8 = (unint64_t)v2 & 0xFFFFFFF000000007LL;
      if ((v3 & 0x2000) != 0)
      {
        if (!v8)
        {
          uint64_t v10 = (unint64_t)v2 & 0xFFFFFFFF8LL;
LABEL_12:
          *(void *)cls = v10;
          if ((v3 & 2) != 0) {
            return object_cxxConstructFromClass((id (*)(id, SEL, ...))cls, v2, 1);
          }
          return cls;
        }
      }

      else if (!v8)
      {
        uint64_t v9 = 0x21A000000001LL;
        if ((v3 & 1) != 0) {
          uint64_t v9 = 0x21A000000005LL;
        }
        uint64_t v10 = v9 | (unint64_t)v2 & 0xFFFFFFFF8LL;
        goto LABEL_12;
      }

      _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v5, v6, v7, v2);
    }
  }

  return cls;
}

id (*_objc_rootAllocWithZone(uint64_t a1))(id receiver, SEL sel, ...)
{
  __int16 v2 = *(_WORD *)(a1 + 30);
  size_t v3 = v2 & 0xFF0;
  if ((v2 & 0xFF0) == 0)
  {
    uint64_t v11 = *(void *)((*(void *)(a1 + 32) & 0xF00007FFFFFFFF8LL) + 8);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
    if ((v11 & 1) != 0) {
      unint64_t v12 = *(void *)v12;
    }
    unsigned int v13 = (*(_DWORD *)(v12 + 8) + 7) & 0xFFFFFFF8;
    if (v13 <= 0x10) {
      size_t v3 = 16LL;
    }
    else {
      size_t v3 = v13;
    }
  }

  id result = (id (*)(id, SEL, ...))calloc(1uLL, v3);
  if (!result) {
    _objc_callBadAllocHandler((objc_class *)a1);
  }
  unint64_t v8 = a1 & 0xFFFFFFF000000007LL;
  if ((v2 & 0x2000) != 0)
  {
    if (!v8)
    {
      uint64_t v10 = a1 & 0xFFFFFFFF8LL;
      goto LABEL_10;
    }

LABEL_18:
    _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v5, v6, v7, a1);
  }

  if (v8) {
    goto LABEL_18;
  }
  uint64_t v9 = 0x21A000000001LL;
  if ((v2 & 1) != 0) {
    uint64_t v9 = 0x21A000000005LL;
  }
  uint64_t v10 = v9 | a1 & 0xFFFFFFFF8LL;
LABEL_10:
  *(void *)id result = v10;
  if ((v2 & 2) != 0) {
    return object_cxxConstructFromClass(result, (objc_class *)a1, 3);
  }
  return result;
}

      _objc_fatal("Corrupt load image callback, unknown kind %u, func %p", a2, a3, a4, v6, v13);
    }

    unint64_t v14 = (char *)malloc(16LL * (loadImageCallbacks[0] + 1));
    uint64_t v15 = 0LL;
    int v16 = (unsigned __int8 *)qword_18C43F6A8;
    do
    {
      uint64_t v10 = v16[v15 + 8];
      uint64_t v11 = *(void *)&v16[v15];
      if ((v10 - 1) >= 2) {
LABEL_16:
      }
        _objc_fatal("Corrupt load image callback, unknown kind %u, func %p", a2, a3, a4, v10, v11);
      uint64_t v17 = &v14[v15];
      *(void *)uint64_t v17 = v11;
      v17[8] = v10;
      v15 += 16LL;
    }

    while (16 * v5 != v15);
    free(v16);
    qword_18C43F6A8 = (uint64_t)v14;
    BOOL v6 = *((unsigned __int8 *)a1 + 8);
    if ((v6 - 1) < 2)
    {
      LODWORD(v5) = loadImageCallbacks[0];
      uint64_t v18 = &v14[16 * loadImageCallbacks[0]];
      *(void *)uint64_t v18 = *a1;
      v18[8] = v6;
      goto LABEL_15;
    }

  *location = v15;
  locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
  callSetWeaklyReferenced((uint64_t)v15);
  return v15;
}

  *location = v15;
  locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
  callSetWeaklyReferenced((uint64_t)v15);
  return v15;
}

uint64_t class_createInstances(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (result)
  {
    int v4 = a4;
    uint64_t v6 = result;
    if ((*(_WORD *)(result + 30) & 0xFF8) != 0)
    {
      size_t v7 = (a2 + (*(_WORD *)(result + 30) & 0xFF8) + 7) & 0xFFFFFFFFFFFFFFF0LL;
      if (a4) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v17 = *(void *)((*(void *)(result + 32) & 0xF00007FFFFFFFF8LL) + 8);
      unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFFELL;
      if ((v17 & 1) != 0) {
        unint64_t v18 = *(void *)v18;
      }
      unint64_t v19 = ((*(_DWORD *)(v18 + 8) + 7) & 0xFFFFFFF8) + a2;
      if (v19 <= 0x10) {
        size_t v7 = 16LL;
      }
      else {
        size_t v7 = v19;
      }
      if (a4)
      {
LABEL_4:
        uint64_t v8 = 0LL;
        while (1)
        {
          uint64_t v9 = calloc(1uLL, v7);
          *(void *)(a3 + 8 * v8) = v9;
          if (!v9) {
            break;
          }
          if (v4 == ++v8)
          {
            if (!v4) {
              goto LABEL_24;
            }
            goto LABEL_10;
          }
        }

        int v4 = v8;
        if (!(_DWORD)v8) {
          goto LABEL_24;
        }
LABEL_10:
        if ((v6 & 0xFFFFFFF000000007LL) != 0) {
          _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", v10, v11, v12, v6);
        }
        uint64_t v13 = 0LL;
        int v14 = 0;
        __int16 v15 = *(_WORD *)(v6 + 30);
        do
        {
          int v16 = *(id (**)(id, SEL, ...))(a3 + 8 * v13);
          *(void *)int v16 = v6 & 0xFFFFFFFF8LL;
          else {
            *(void *)(a3 + 8LL * (v13 - v14)) = v16;
          }
          ++v13;
        }

        while (v4 != v13);
        return (v4 - v14);
      }
    }

id object_copy(id a1, size_t a2)
{
  __int16 v2 = a1;
  if ((uint64_t)a1 >= 1)
  {
    uint64_t v3 = *(void *)a1 & 0xFFFFFFFF8LL;
    __int16 v4 = *(_WORD *)(v3 + 0x1E);
    if ((v4 & 0xFF8) != 0)
    {
      size_t v5 = (a2 + (v4 & 0xFF8) + 7) & 0xFFFFFFFFFFFFFFF0LL;
    }

    else
    {
      uint64_t v37 = *(void *)((*(void *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL) + 8);
      unint64_t v38 = v37 & 0xFFFFFFFFFFFFFFFELL;
      if ((v37 & 1) != 0) {
        unint64_t v38 = *(void *)v38;
      }
      size_t v39 = ((*(_DWORD *)(v38 + 8) + 7) & 0xFFFFFFF8) + a2;
      if (v39 <= 0x10) {
        size_t v5 = 16LL;
      }
      else {
        size_t v5 = v39;
      }
    }

    uint64_t v6 = (char *)calloc(1uLL, v5);
    if (v6)
    {
      size_t v7 = v6;
      uint64_t v8 = 0x21A000000001LL;
      if ((v4 & 1) != 0) {
        uint64_t v8 = 0x21A000000005LL;
      }
      if ((v4 & 0x2000) != 0) {
        uint64_t v8 = 0LL;
      }
      *(void *)uint64_t v6 = v3 | v8;
      memmove(v6 + 8, v2 + 1, v5 - 8);
      for (uint64_t i = *v2 & 0xFFFFFFFF8LL; i; uint64_t i = *(void *)(i + 8))
      {
        uint64_t v10 = *(void *)(i + 32) & 0xF00007FFFFFFFF8LL;
        uint64_t v11 = *(void *)(v10 + 8);
        unint64_t v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
        if ((v11 & 1) != 0) {
          unint64_t v12 = (void *)*v12;
        }
        if ((*(_WORD *)v12 & 0x280) != 0)
        {
          uint64_t v13 = *(void *)((*(void *)(i + 32) & 0xF00007FFFFFFFF8LL) + 8);
          unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
          if ((v13 & 1) != 0) {
            unint64_t v14 = *(void *)v14;
          }
          int v15 = *(_DWORD *)(v14 + 4);
          uint64_t v16 = *(void *)((*(void *)(i + 32) & 0xF00007FFFFFFFF8LL) + 8);
          uint64_t v17 = (void *)(v16 & 0xFFFFFFFFFFFFFFFELL);
          if ((v16 & 1) != 0) {
            uint64_t v17 = (void *)*v17;
          }
          uint64_t v18 = (v15 + 7) & 0xFFFFFFF8;
          if ((*(_BYTE *)v17 & 1) == 0)
          {
            unint64_t v19 = (_BYTE *)v17[2];
            if (v19)
            {
              unsigned int v20 = *v19;
              if (*v19)
              {
                int v21 = (void **)&v7[v18];
                do
                {
                  v21 += v20 >> 4;
                  int v22 = v20 & 0xF;
                  if ((v20 & 0xF) != 0)
                  {
                    do
                    {
                      uint64_t v24 = *v21++;
                      uint64_t v23 = v24;
                      if (v24) {
                        id v25 = v23;
                      }
                      --v22;
                    }

                    while (v22);
                  }

                  unsigned int v26 = *++v19;
                  unsigned int v20 = v26;
                }

                while (v26);
                uint64_t v10 = *(void *)(i + 32) & 0xF00007FFFFFFFF8LL;
              }
            }
          }

          uint64_t v27 = *(void *)(v10 + 8);
          uint64_t v28 = (void *)(v27 & 0xFFFFFFFFFFFFFFFELL);
          if ((v27 & 1) != 0) {
            uint64_t v28 = (void *)*v28;
          }
          unint64_t v29 = (_BYTE *)v28[7];
          if (v29)
          {
            unsigned int v30 = *v29;
            if (*v29)
            {
              unint64_t v31 = (id *)((char *)v2 + v18);
              unint64_t v32 = (id *)&v7[v18];
              do
              {
                v32 += v30 >> 4;
                v31 += v30 >> 4;
                int v33 = v30 & 0xF;
                if ((v30 & 0xF) != 0)
                {
                  do
                  {
                    --v33;
                    id WeakRetained = objc_loadWeakRetained(v31);
                    objc_initWeak(v32, WeakRetained);

                    ++v32;
                    ++v31;
                  }

                  while (v33);
                }

                unsigned int v35 = *++v29;
                unsigned int v30 = v35;
              }

              while (v35);
            }
          }
        }
      }

      return v7;
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

void *__cdecl objc_destructInstance(id obj)
{
  if (!obj) {
    return obj;
  }
  uint64_t v5 = *(void *)obj;
  if ((*(void *)obj & 1) != 0)
  {
    if (((unint64_t)obj & 0x8000000000000000LL) == 0)
    {
      if ((v5 & 2) == 0) {
        goto LABEL_12;
      }
    }
  }

  else if ((*(_WORD *)((v5 & 0xFFFFFFFF8LL) + 0x1E) & 1) != 0 && (uint64_t)obj > 0)
  {
    object_cxxDestructFromClass((id (*)(id, SEL, ...))obj, (objc_class *)(v5 & 0xFFFFFFFF8LL));
  }

  _object_remove_associations((uint64_t)obj, 1);
LABEL_12:
  if ((*(void *)obj & 1) != 0)
  {
    if ((*(void *)obj & 0x140000000000LL) != 0) {
      objc_object::clearDeallocating_slow((objc_object *)obj, v1, v2, v3);
    }
  }

  else
  {
    objc_object::sidetable_clearDeallocating((objc_object *)obj);
  }

  return obj;
}

id object_dispose(id a1)
{
  if (a1)
  {
    uint64_t v1 = objc_destructInstance(a1);
    free(v1);
  }

  return 0LL;
}

uint64_t _objc_getFreedObjectClass()
{
  return 0LL;
}

objc_class **_objc_registerTaggedPointerClass(unsigned int a1, objc_class *a2, const char *a3, char *a4)
{
  id result = (objc_class **)classSlotForTagIndex(a1);
  if (!result) {
    _objc_fatal("tag index %u is invalid", v7, v8, v9, a1);
  }
  if (a2)
  {
    uint64_t v10 = *result;
    if (*result)
    {
      if (v10 != a2)
      {
        unint64_t v11 = objc_class::nameForLogging(*result);
        unint64_t v12 = objc_class::nameForLogging(a2);
        _objc_fatal( "tag index %u used for two different classes (was %p %s, now %p %s)",  v13,  v14,  v15,  a1,  v10,  v11,  a2,  v12);
      }
    }
  }

  void *result = a2;
  return result;
}

void *classSlotForTagIndex(unsigned int a1)
{
  if (a1 <= 6)
  {
    uint64_t v1 = objc_debug_tag60_permutations[a1];
    __int16 v2 = objc_debug_taggedpointer_classes;
    return &v2[v1];
  }

  uint64_t v3 = 0LL;
  if (a1 != 7 && a1 <= 0x107)
  {
    uint64_t v4 = ((unint64_t)objc_debug_taggedpointer_obfuscator >> 55);
    if (a1 > 0x87) {
      uint64_t v4 = 0LL;
    }
    uint64_t v1 = v4 ^ (a1 - 8);
    __int16 v2 = objc_debug_taggedpointer_ext_classes;
    return &v2[v1];
  }

  return (void *)v3;
}

void *_objc_getClassForTag(unsigned int a1)
{
  id result = classSlotForTagIndex(a1);
  if (result) {
    return (void *)*result;
  }
  return result;
}

Class class_setSuperclass(Class cls, Class newSuper)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v5, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  Class isa = cls[1].isa;
  removeSubclass((uint64_t)isa[4].isa, cls);
  removeSubclass( *(void *)(((uint64_t)isa->isa & 0xFFFFFFFF8LL) + 0x20),  (objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL));
  cls[1].Class isa = newSuper;
  *(void *)(((uint64_t)cls->isa & 0xFFFFFFFF8LL) + 8) = (uint64_t)newSuper->isa & 0xFFFFFFFF8LL;
  addSubclass(newSuper, cls);
  addSubclass((objc_class *)((uint64_t)newSuper->isa & 0xFFFFFFFF8LL), (objc_class *)((uint64_t)cls->isa & 0xFFFFFFFF8LL));
  uint64_t v8 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3321888768LL;
  v16[2] = ___ZL13setSuperclassP10objc_classS0__block_invoke;
  v16[3] = &__block_descriptor_33_e8_32c43_ZTSKZL13setSuperclassP10objc_classS0_E3__0_e8_B16__0_8l;
  flushCaches((uint64_t)cls, (uint64_t)"setSuperclass", (const char *)v16, v9);
  uint64_t v10 = (uint64_t)cls->isa & 0xFFFFFFFF8LL;
  v15[0] = v8;
  v15[1] = 3321888768LL;
  v15[2] = ___ZL13setSuperclassP10objc_classS0__block_invoke_182;
  v15[3] = &__block_descriptor_33_e8_32c43_ZTSKZL13setSuperclassP10objc_classS0_E3__1_e8_B16__0_8l;
  flushCaches(v10, (uint64_t)"setSuperclass", (const char *)v15, v11);
  int v12 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(runtimeLock);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return isa;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  return isa;
}

void sub_18003A7DC(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL13setSuperclassP10objc_classS0__block_invoke()
{
  return 1LL;
}

uint64_t ___ZL13setSuperclassP10objc_classS0__block_invoke_182()
{
  return 1LL;
}

void tls_autoptr_direct_impl<_objc_pthread_data,(tls_key)0>::dtor_(char *a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)a1;
    if (*(void *)a1)
    {
      uint64_t v3 = (void *)v2[1];
      if (v3) {
        free(v3);
      }
      free(v2);
    }

    int v4 = (void *)*((void *)a1 + 1);
    if (v4) {
      free(v4);
    }
    for (uint64_t i = 24LL; i != 56; i += 8LL)
    {
      uint64_t v6 = *(void **)&a1[i];
      if (v6) {
        free(v6);
      }
    }

    free(*((void **)a1 + 7));
    free(a1);
  }

Class objc_getClass(Class name)
{
  if (name) {
    return look_up_class((char *)name);
  }
  return name;
}

Class objc_getRequiredClass(const char *name)
{
  if (!name) {
    _objc_fatal("link error: class '%s' not found.", v1, v2, v3, 0LL);
  }
  Class result = look_up_class((char *)name);
  if (!result) {
    _objc_fatal("link error: class '%s' not found.", v6, v7, v8, name);
  }
  return result;
}

Class objc_lookUpClass(Class name)
{
  if (name) {
    return look_up_class((char *)name);
  }
  return name;
}

Class objc_getMetaClass(Class name)
{
  if (name)
  {
    uint64_t v1 = (const char *)name;
    uint64_t v2 = look_up_class((char *)name);
    if (v2)
    {
      return (Class)((uint64_t)v2->isa & 0xFFFFFFFF8LL);
    }

    else
    {
      return 0LL;
    }
  }

  return name;
}

uint64_t objc::SafeRanges::find(objc::SafeRanges *this, _DWORD *a2, unsigned int *a3)
{
  if ((dword_18C43FCCC & 0x80000000) == 0)
  {
    unint64_t v5 = 126 - 2 * __clz(dword_18C43FCC8);
    if (dword_18C43FCC8) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0LL;
    }
    std::__introsort<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *,false>( qword_18C43FCC0,  (unint64_t *)(qword_18C43FCC0 + 16LL * dword_18C43FCC8),  v6,  1);
    dword_18C43FCCC |= 0x80000000;
  }

  unsigned int v7 = dword_18C43FCC8;
  if (dword_18C43FCC8)
  {
    unsigned int v8 = 0;
    do
    {
      uint64_t v9 = (v7 + v8) >> 1;
      if (*(void *)(qword_18C43FCC0 + 16 * v9) <= (unint64_t)this)
      {
        if (*(void *)(qword_18C43FCC0 + 16 * v9 + 8) > (unint64_t)this)
        {
          uint64_t result = 1LL;
          goto LABEL_15;
        }

        unsigned int v8 = v9 + 1;
      }

      else
      {
        unsigned int v7 = (v7 + v8) >> 1;
      }
    }

    while (v8 < v7);
  }

  uint64_t result = 0LL;
  LODWORD(v9) = -1;
LABEL_15:
  *a2 = v9;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *,false>( uint64_t a1, unint64_t *a2, uint64_t a3, char a4)
{
LABEL_1:
  unsigned int v8 = (__int128 *)(a2 - 2);
  unint64_t v9 = a1;
  while (2)
  {
    a1 = v9;
    uint64_t v10 = (uint64_t)a2 - v9;
    unint64_t v11 = (uint64_t)((uint64_t)a2 - v9) >> 4;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (*(void *)v8 < *(void *)v9)
        {
          __int128 v85 = *(_OWORD *)v9;
          *(_OWORD *)unint64_t v9 = *v8;
          *unsigned int v8 = v85;
        }

        return;
      case 3uLL:
        std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)v9,  (unint64_t *)(v9 + 16),  a2 - 2);
        return;
      case 4uLL:
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)v9,  (unint64_t *)(v9 + 16),  (unint64_t *)(v9 + 32),  (_OWORD *)a2 - 1);
        return;
      case 5uLL:
        uint64_t v34 = (__int128 *)(v9 + 16);
        unsigned int v35 = (__int128 *)(v9 + 32);
        unint64_t v36 = (__int128 *)(v9 + 48);
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)v9,  (unint64_t *)(v9 + 16),  (unint64_t *)(v9 + 32),  (_OWORD *)(v9 + 48));
        if (*(void *)v8 < *(void *)(v9 + 48))
        {
          __int128 v37 = *v36;
          *unint64_t v36 = *v8;
          *unsigned int v8 = v37;
          if (*(void *)v36 < *(void *)v35)
          {
            __int128 v38 = *v35;
            *unsigned int v35 = *v36;
            *unint64_t v36 = v38;
            if (*(void *)v35 < *(void *)v34)
            {
              __int128 v39 = *v34;
              *uint64_t v34 = *v35;
              *unsigned int v35 = v39;
              if (*(void *)(v9 + 16) < *(void *)v9)
              {
                __int128 v86 = *(_OWORD *)v9;
                *(_OWORD *)unint64_t v9 = *v34;
                *uint64_t v34 = v86;
              }
            }
          }
        }

        return;
      default:
        if (v10 <= 383)
        {
          int v40 = (unint64_t *)(v9 + 16);
          BOOL v42 = (unint64_t *)v9 == a2 || v40 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v42)
            {
              uint64_t v43 = 0LL;
              unsigned __int16 v44 = (unint64_t *)v9;
              do
              {
                int v45 = v40;
                unint64_t v46 = v44[2];
                if (v46 < *v44)
                {
                  unint64_t v47 = v44[3];
                  uint64_t v48 = v43;
                  while (1)
                  {
                    *(_OWORD *)(v9 + v48 + 16) = *(_OWORD *)(v9 + v48);
                    if (!v48) {
                      break;
                    }
                    unint64_t v49 = *(void *)(v9 + v48 - 16);
                    v48 -= 16LL;
                    if (v46 >= v49)
                    {
                      unint64_t v50 = (void *)(v9 + v48 + 16);
                      goto LABEL_76;
                    }
                  }

                  unint64_t v50 = (void *)v9;
LABEL_76:
                  *unint64_t v50 = v46;
                  v50[1] = v47;
                }

                int v40 = v45 + 2;
                v43 += 16LL;
                unsigned __int16 v44 = v45;
              }

              while (v45 + 2 != a2);
            }
          }

          else if (!v42)
          {
            do
            {
              uint64_t v78 = (uint64_t)v40;
              unint64_t v79 = *(void *)(a1 + 16);
              if (v79 < *(void *)a1)
              {
                uint64_t v80 = *(void *)(a1 + 24);
                uint64_t v81 = v78;
                do
                {
                  *(_OWORD *)uint64_t v81 = *(_OWORD *)(v81 - 16);
                  unint64_t v82 = *(void *)(v81 - 32);
                  v81 -= 16LL;
                }

                while (v79 < v82);
                *(void *)uint64_t v81 = v79;
                *(void *)(v81 + 8) = v80;
              }

              int v40 = (unint64_t *)(v78 + 16);
              a1 = v78;
            }

            while ((unint64_t *)(v78 + 16) != a2);
          }

          return;
        }

        if (!a3)
        {
          if ((unint64_t *)v9 != a2)
          {
            int64_t v51 = (v11 - 2) >> 1;
            int64_t v52 = v51;
            do
            {
              int64_t v53 = v52;
              if (v51 >= v52)
              {
                uint64_t v54 = (2 * v52) | 1;
                unint64_t v55 = (unint64_t *)(v9 + 16 * v54);
                if (2 * v53 + 2 >= (uint64_t)v11)
                {
                  unint64_t v56 = *v55;
                }

                else
                {
                  unint64_t v56 = v55[2];
                  BOOL v57 = *v55 >= v56;
                  if (*v55 > v56) {
                    unint64_t v56 = *v55;
                  }
                  if (!v57)
                  {
                    v55 += 2;
                    uint64_t v54 = 2 * v53 + 2;
                  }
                }

                uint64_t v58 = (unint64_t *)(v9 + 16 * v53);
                unint64_t v59 = *v58;
                if (v56 >= *v58)
                {
                  unint64_t v60 = v58[1];
                  do
                  {
                    uint64_t v61 = v58;
                    uint64_t v58 = v55;
                    *(_OWORD *)uint64_t v61 = *(_OWORD *)v55;
                    if (v51 < v54) {
                      break;
                    }
                    uint64_t v62 = (2 * v54) | 1;
                    unint64_t v55 = (unint64_t *)(v9 + 16 * v62);
                    uint64_t v54 = 2 * v54 + 2;
                    if (v54 >= (uint64_t)v11)
                    {
                      unint64_t v63 = *v55;
                      uint64_t v54 = v62;
                    }

                    else
                    {
                      unint64_t v63 = *v55;
                      unint64_t v64 = v55[2];
                      if (*v55 <= v64) {
                        unint64_t v63 = v55[2];
                      }
                      if (*v55 >= v64) {
                        uint64_t v54 = v62;
                      }
                      else {
                        v55 += 2;
                      }
                    }
                  }

                  while (v63 >= v59);
                  *uint64_t v58 = v59;
                  v58[1] = v60;
                }
              }

              int64_t v52 = v53 - 1;
            }

            while (v53);
            uint64_t v65 = (unint64_t)v10 >> 4;
            do
            {
              uint64_t v66 = 0LL;
              __int128 v87 = *(_OWORD *)v9;
              unsigned __int16 v67 = (_OWORD *)v9;
              do
              {
                uint64_t v68 = (unint64_t *)&v67[v66 + 1];
                uint64_t v69 = (2 * v66) | 1;
                uint64_t v70 = 2 * v66 + 2;
                if (v70 < v65 && *v68 < v68[2])
                {
                  v68 += 2;
                  uint64_t v69 = v70;
                }

                *unsigned __int16 v67 = *(_OWORD *)v68;
                unsigned __int16 v67 = v68;
                uint64_t v66 = v69;
              }

              while (v69 <= (uint64_t)((unint64_t)(v65 - 2) >> 1));
              a2 -= 2;
              if (v68 == a2)
              {
                *(_OWORD *)uint64_t v68 = v87;
              }

              else
              {
                *(_OWORD *)uint64_t v68 = *(_OWORD *)a2;
                *(_OWORD *)a2 = v87;
                uint64_t v71 = (uint64_t)v68 - v9 + 16;
                if (v71 >= 17)
                {
                  unint64_t v72 = (((unint64_t)v71 >> 4) - 2) >> 1;
                  unint64_t v73 = (unint64_t *)(v9 + 16 * v72);
                  unint64_t v74 = *v68;
                  if (*v73 < *v68)
                  {
                    unint64_t v75 = v68[1];
                    do
                    {
                      unsigned __int16 v76 = v68;
                      uint64_t v68 = v73;
                      *(_OWORD *)unsigned __int16 v76 = *(_OWORD *)v73;
                      if (!v72) {
                        break;
                      }
                      unint64_t v72 = (v72 - 1) >> 1;
                      unint64_t v73 = (unint64_t *)(v9 + 16 * v72);
                    }

                    while (*v73 < v74);
                    *uint64_t v68 = v74;
                    v68[1] = v75;
                  }
                }
              }
            }

            while (v65-- > 2);
          }

          return;
        }

        unint64_t v12 = v11 >> 1;
        unsigned int v13 = (unint64_t *)(v9 + 16 * (v11 >> 1));
        if ((unint64_t)v10 < 0x801)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)(a1 + 16 * (v11 >> 1)),  (unint64_t *)a1,  a2 - 2);
        }

        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)a1,  (unint64_t *)(a1 + 16 * (v11 >> 1)),  a2 - 2);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)(a1 + 16),  v13 - 2,  a2 - 4);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)(a1 + 32),  (unint64_t *)(a1 + 16 + 16 * v12),  a2 - 6);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)v13 - 1,  v13,  (unint64_t *)(a1 + 16 + 16 * v12));
          __int128 v83 = *(_OWORD *)a1;
          *(_OWORD *)a1 = *(_OWORD *)v13;
          *(_OWORD *)unsigned int v13 = v83;
        }

        --a3;
        unint64_t v14 = *(void *)a1;
        if ((a4 & 1) == 0 && *(void *)(a1 - 16) >= v14)
        {
          if (v14 >= *(void *)v8)
          {
            unint64_t v28 = a1 + 16;
            do
            {
              unint64_t v9 = v28;
              v28 += 16LL;
            }

            while (v14 >= *(void *)v9);
          }

          else
          {
            unint64_t v9 = a1;
            do
            {
              unint64_t v27 = *(void *)(v9 + 16);
              v9 += 16LL;
            }

            while (v14 >= v27);
          }

          unint64_t v29 = a2;
          if (v9 < (unint64_t)a2)
          {
            unint64_t v29 = a2;
            do
              unint64_t v30 = *((void *)v29-- - 2);
            while (v14 < v30);
          }

          uint64_t v31 = *(void *)(a1 + 8);
          while (v9 < (unint64_t)v29)
          {
            __int128 v84 = *(_OWORD *)v9;
            *(_OWORD *)unint64_t v9 = *v29;
            *unint64_t v29 = v84;
            do
            {
              unint64_t v32 = *(void *)(v9 + 16);
              v9 += 16LL;
            }

            while (v14 >= v32);
            do
              unint64_t v33 = *((void *)v29-- - 2);
            while (v14 < v33);
          }

          if (v9 - 16 != a1) {
            *(_OWORD *)a1 = *(_OWORD *)(v9 - 16);
          }
          a4 = 0;
          *(void *)(v9 - 16) = v14;
          *(void *)(v9 - 8) = v31;
          continue;
        }

        uint64_t v15 = *(void *)(a1 + 8);
        unint64_t v16 = a1;
        do
        {
          unint64_t v17 = v16;
          unint64_t v18 = *(void *)(v16 + 16);
          v16 += 16LL;
        }

        while (v18 < v14);
        unint64_t v19 = a2;
        if (v17 == a1)
        {
          unint64_t v19 = a2;
          do
          {
            unint64_t v21 = *(v19 - 2);
            v19 -= 2;
          }

          while (v21 >= v14);
        }

        else
        {
          do
          {
            unint64_t v20 = *(v19 - 2);
            v19 -= 2;
          }

          while (v20 >= v14);
        }

        unint64_t v9 = v16;
        if (v16 < (unint64_t)v19)
        {
          int v22 = (__int128 *)v19;
          do
          {
            __int128 v23 = *(_OWORD *)v9;
            *(_OWORD *)unint64_t v9 = *v22;
            *int v22 = v23;
            do
            {
              unint64_t v24 = *(void *)(v9 + 16);
              v9 += 16LL;
            }

            while (v24 < v14);
            do
              unint64_t v25 = *((void *)v22-- - 2);
            while (v25 >= v14);
          }

          while (v9 < (unint64_t)v22);
        }

        if (v9 - 16 != a1) {
          *(_OWORD *)a1 = *(_OWORD *)(v9 - 16);
        }
        *(void *)(v9 - 16) = v14;
        *(void *)(v9 - 8) = v15;
        if (v16 < (unint64_t)v19)
        {
LABEL_29:
          std::__introsort<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *,false>( a1,  v9 - 16,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v26 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( a1,  (unint64_t *)(v9 - 16));
        if (!std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( v9,  a2))
        {
          if (v26) {
            continue;
          }
          goto LABEL_29;
        }

        a2 = (unint64_t *)(v9 - 16);
        if (!v26) {
          goto LABEL_1;
        }
        return;
    }
  }

__int128 *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( __int128 *result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  if (*a2 >= *(void *)result)
  {
    if (v4 < v3)
    {
      __int128 v6 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v6;
      if (*a2 < *(void *)result)
      {
        __int128 v7 = *result;
        void *result = *(_OWORD *)a2;
        *(_OWORD *)a2 = v7;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      __int128 v8 = *result;
      void *result = *(_OWORD *)a2;
      *(_OWORD *)a2 = v8;
      if (*a3 >= *a2) {
        return result;
      }
      __int128 v5 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
    }

    else
    {
      __int128 v5 = *result;
      void *result = *(_OWORD *)a3;
    }

    *(_OWORD *)a3 = v5;
  }

  return result;
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( __int128 *a1, unint64_t *a2, unint64_t *a3, _OWORD *a4)
{
  if (*(void *)a4 < *a3)
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *a4;
    *a4 = result;
    if (*a3 < *a2)
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      if (*a2 < *(void *)a1)
      {
        __n128 result = (__n128)*a1;
        *a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }

  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( uint64_t a1, unint64_t *a2)
{
  uint64_t v4 = ((uint64_t)a2 - a1) >> 4;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      __int128 v6 = (__int128 *)(a2 - 2);
      if (*(a2 - 2) < *(void *)a1)
      {
        __int128 v7 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *v6;
        *__int128 v6 = v7;
      }

      return result;
    case 3LL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)a1,  (unint64_t *)(a1 + 16),  a2 - 2);
      return 1LL;
    case 4LL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)a1,  (unint64_t *)(a1 + 16),  (unint64_t *)(a1 + 32),  (_OWORD *)a2 - 1);
      return 1LL;
    case 5LL:
      unint64_t v17 = (__int128 *)(a1 + 16);
      unint64_t v18 = (__int128 *)(a1 + 32);
      unint64_t v19 = (__int128 *)(a1 + 48);
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)a1,  (unint64_t *)(a1 + 16),  (unint64_t *)(a1 + 32),  (_OWORD *)(a1 + 48));
      unint64_t v21 = *(a2 - 2);
      unint64_t v20 = (__int128 *)(a2 - 2);
      if (v21 < *(void *)(a1 + 48))
      {
        __int128 v22 = *v19;
        *unint64_t v19 = *v20;
        __int128 *v20 = v22;
        if (*(void *)v19 < *(void *)v18)
        {
          __int128 v23 = *v18;
          *unint64_t v18 = *v19;
          *unint64_t v19 = v23;
          if (*(void *)v18 < *(void *)v17)
          {
            __int128 v24 = *v17;
            *unint64_t v17 = *v18;
            *unint64_t v18 = v24;
            if (*(void *)(a1 + 16) < *(void *)a1)
            {
              __int128 v25 = *(_OWORD *)a1;
              *(_OWORD *)a1 = *v17;
              *unint64_t v17 = v25;
            }
          }
        }
      }

      return 1LL;
    default:
      __int128 v8 = (unint64_t *)(a1 + 32);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,objc::SafeRanges::find(unsigned long,unsigned int &)::$_0 &,objc::SafeRanges::Range *>( (__int128 *)a1,  (unint64_t *)(a1 + 16),  (unint64_t *)(a1 + 32));
      unint64_t v9 = (unint64_t *)(a1 + 48);
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while (1)
  {
    unint64_t v12 = *v9;
    if (*v9 < *v8)
    {
      unint64_t v13 = v9[1];
      uint64_t v14 = v10;
      while (1)
      {
        *(_OWORD *)(a1 + v14 + 48) = *(_OWORD *)(a1 + v14 + 32);
        if (v14 == -32) {
          break;
        }
        unint64_t v15 = *(void *)(a1 + v14 + 16);
        v14 -= 16LL;
        if (v12 >= v15)
        {
          unint64_t v16 = (unint64_t *)(a1 + v14 + 48);
          goto LABEL_13;
        }
      }

      unint64_t v16 = (unint64_t *)a1;
LABEL_13:
      *unint64_t v16 = v12;
      v16[1] = v13;
      if (++v11 == 8) {
        return v9 + 2 == a2;
      }
    }

    __int128 v8 = v9;
    v10 += 16LL;
    v9 += 2;
    if (v9 == a2) {
      return 1LL;
    }
  }

char *objc::SafeRanges::add(objc::SafeRanges *this, uint64_t a2)
{
  int v4 = qword_18C43FCC8;
  if ((_DWORD)qword_18C43FCC8 == (HIDWORD(qword_18C43FCC8) & 0x7FFFFFFF))
  {
    int v5 = 1 << (29 - __clz(qword_18C43FCC8));
    else {
      int v6 = 4;
    }
    int v7 = v6 + HIDWORD(qword_18C43FCC8);
    HIDWORD(qword_18C43FCC8) = HIDWORD(qword_18C43FCC8) & 0x80000000 | v7 & 0x7FFFFFFF;
    BOOL result = (char *)realloc((void *)qword_18C43FCC0, 16LL * (v7 & 0x7FFFFFFF));
    qword_18C43FCC0 = (uint64_t)result;
    int v4 = qword_18C43FCC8;
  }

  else
  {
    BOOL result = (char *)qword_18C43FCC0;
  }

  unsigned int v9 = v4 + 1;
  uint64_t v10 = &result[16 * v4];
  *(void *)uint64_t v10 = this;
  *((void *)v10 + _class_addProperty(cls, name, attributes, attributeCount, 1) = a2;
  qword_18C43FCC8 = __PAIR64__(HIDWORD(qword_18C43FCC8), v9) & 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

void std::__throw_bad_function_call[abi:nn180100]()
{
}

void *std::__function::__func<appendHeader::$_0,std::allocator<appendHeader::$_0>,void ()(segment_command_64 const*,long)>::__clone()
{
  BOOL result = malloc(0x10uLL);
  void *result = &unk_18961E470;
  return result;
}

void std::__function::__func<appendHeader::$_0,std::allocator<appendHeader::$_0>,void ()(segment_command_64 const*,long)>::__clone( uint64_t a1, void *a2)
{
  *a2 = &unk_18961E470;
}

char *std::__function::__func<appendHeader::$_0,std::allocator<appendHeader::$_0>,void ()(segment_command_64 const*,long)>::operator()( uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = (objc::SafeRanges *)(*(void *)(*(void *)a2 + 24LL) + *a3);
  return objc::SafeRanges::add(v3, (uint64_t)v3 + *(void *)(*(void *)a2 + 32LL));
}

void *std::__function::__func<removeHeader::$_0,std::allocator<removeHeader::$_0>,void ()(segment_command_64 const*,long)>::__clone()
{
  BOOL result = malloc(0x10uLL);
  void *result = &off_18961E4B8;
  return result;
}

void std::__function::__func<removeHeader::$_0,std::allocator<removeHeader::$_0>,void ()(segment_command_64 const*,long)>::__clone( uint64_t a1, void *a2)
{
  *a2 = &off_18961E4B8;
}

__n128 std::__function::__func<removeHeader::$_0,std::allocator<removeHeader::$_0>,void ()(segment_command_64 const*,long)>::operator()( uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unint64_t v3 = (objc::SafeRanges *)(*(void *)(*(void *)a2 + 24LL) + *(void *)a3);
  int v4 = (char *)v3 + *(void *)(*(void *)a2 + 32LL);
  unsigned int v9 = qword_18C43FCC8 - 1;
  LODWORD(qword_18C43FCC8) = v9;
  if (v10 < v9)
  {
    __n128 result = *(__n128 *)(qword_18C43FCC0 + 16LL * v9);
    *(__n128 *)(qword_18C43FCC0 + 16LL * v10) = result;
    HIDWORD(qword_18C43FCC8) &= ~0x80000000;
  }

  return result;
}

void logReplacedMethod(const char *a1, char *a2, int a3, const char *a4, void *a5, const void *a6)
{
  if (sel_load != a2)
  {
    int v12 = dladdr(a5, &v23);
    if (v23.dli_fname) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      dli_fname = "??";
    }
    else {
      dli_fname = v23.dli_fname;
    }
    int v15 = dladdr(a6, &v23);
    unint64_t v16 = v23.dli_fname;
    if (v23.dli_fname) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      unint64_t v16 = "??";
    }
    unint64_t v18 = "<null selector>";
    unint64_t v19 = "by category ";
    if (a2) {
      unint64_t v18 = a2;
    }
    unint64_t v20 = "";
    if (a4) {
      unint64_t v20 = a4;
    }
    else {
      unint64_t v19 = "";
    }
    __int128 v22 = v18;
    uint64_t v21 = 45LL;
    if (a3) {
      uint64_t v21 = 43LL;
    }
    _objc_inform( "REPLACED: %c[%s %s]  %s%s  (IMP was %p (%s), now %p (%s))",  v21,  a1,  v22,  v19,  v20,  a5,  dli_fname,  a6,  v16);
  }

void objc_setForwardHandler(void *fwd, void *fwd_stret)
{
  _objc_forward_handler = (void (*)(objc_object *, objc_selector *))fwd;
}

void objc_setHook_getImageName(objc_hook_getImageName newValue, objc_hook_getImageName *outOldValue)
{
  uint64_t v2 = GetImageNameHook;
  *outOldValue = (objc_hook_getImageName)GetImageNameHook;
  unint64_t v3 = (BOOL (__cdecl *)(Class, const char **))__ldxr((unint64_t *)&GetImageNameHook);
  if ((char *)v3 != (char *)v2)
  {
    __clrex();
LABEL_5:
    while (1)
    {
      *outOldValue = v3;
      unint64_t v4 = __ldxr((unint64_t *)&GetImageNameHook);
      int v5 = 1;
LABEL_10:
      unint64_t v3 = (BOOL (__cdecl *)(Class, const char **))v4;
      if (v5) {
        return;
      }
    }

    __clrex();
LABEL_9:
    int v5 = 0;
    goto LABEL_10;
  }

BOOL internal_class_getImageName(objc_class *a1, const char **a2)
{
  unint64_t v3 = (const char *)dyld_image_path_containing_address();
  *a2 = v3;
  return v3 != 0LL;
}

const char *__cdecl class_getImageName(const char *cls)
{
  if (cls)
  {
    uint64_t v1 = (unsigned int (*)(const char *, const char **))atomic_load((unint64_t *)&GetImageNameHook);
    if (v1(cls, &v2)) {
      return v2;
    }
    else {
      return 0LL;
    }
  }

  return cls;
}

void objc_enumerationMutation(id obj)
{
  if (!enumerationMutationHandler) {
    _objc_fatal("mutation detected during 'for (... in ...)'  enumeration of object %p.", 0LL, v1, v2, obj);
  }
  enumerationMutationHandler(obj);
}

void objc_setEnumerationMutationHandler(void (__cdecl *handler)(id))
{
  enumerationMutationHandler = handler;
}

id objc_getAssociatedObject(id object, const void *key)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&AssociationsManagerLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  int v7 = objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -(uint64_t)object,  &v18);
  uint64_t v8 = v18;
  else {
    int v9 = v7;
  }
  if (v9 == 1
    && ((int v10 = objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( v18 + 8,  (unint64_t)key,  &v18),  v18 != *(void *)(v8 + 8) + 24LL * *(unsigned int *)(v8 + 24))
      ? (int v11 = v10)
      : (int v11 = 0),
        v11 == 1))
  {
    uint64_t v13 = *(void *)(v18 + 8);
    int v12 = *(void **)(v18 + 16);
    if (v12)
    {
      if ((v13 & 0x100) != 0) {
        id v14 = v12;
      }
    }
  }

  else
  {
    int v12 = 0LL;
    LOWORD(v13) = 0;
  }

  int v15 = *(_DWORD *)(StatusReg + 24);
  do
  {
    unsigned int v16 = __ldxr((unsigned int *)&AssociationsManagerLock);
    if (v16 != v15)
    {
      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
      if (v12) {
        goto LABEL_24;
      }
      return v12;
    }
  }

  while (__stlxr(0, (unsigned int *)&AssociationsManagerLock));
  if (!v12) {
    return v12;
  }
LABEL_24:
  if ((v13 & 0x200) == 0) {
    return v12;
  }
  return v12;
}

void sub_18003B9D8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  __int128 v39 = key;
  if (((unint64_t)object & 0x8000000000000000LL) != 0)
  {
    int v7 = (__objc2_class *)objc_debug_taggedpointer_classes[object & 7];
  }

  else
  {
    int v7 = (__objc2_class *)(*(void *)object & 0xFFFFFFFF8LL);
  }

  if ((*(_BYTE *)(((uint64_t)v7->info & 0xF00007FFFFFFFF8LL) + 2) & 0x10) != 0)
  {
    ClassName = object_getClassName(object);
    _objc_fatal( "objc_setAssociatedObject called on instance (%p) of class %s which does not allow associated objects",  v36,  v37,  v38,  object,  ClassName);
  }

  if (value)
  {
    if (policy == 3)
    {
      id v9 = objc_msgSend(value, sel_copy);
      goto LABEL_11;
    }

    id v8 = value;
    if (policy == 1)
    {
      id v9 = value;
LABEL_11:
      id v8 = v9;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v11 = *(_DWORD *)(StatusReg + 24);
  do
  {
    if (__ldaxr((unsigned int *)&AssociationsManagerLock))
    {
      __clrex();
      os_unfair_lock_lock_with_options();
      if (!value) {
        goto LABEL_23;
      }
LABEL_16:
      char v13 = objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -(uint64_t)object,  &v40);
      id v14 = v40;
      if ((v13 & 1) != 0)
      {
LABEL_46:
        if ((objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( (uint64_t)&v14[1],  (unint64_t)v39,  &v40) & 1) != 0)
        {
          unint64_t v27 = v40 + 2;
          __int128 v22 = (void *)v40[2];
          id v14 = (int32x2_t *)v40[1];
          v40[1] = (int32x2_t)policy;
        }

        else
        {
          inserted = (int32x2_t *)objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::InsertIntoBucketImpl<void const*>( v14 + 1,  (unint64_t *)&v39,  v40);
          LOBYTE(v14) = 0;
          __int128 v22 = 0LL;
          int32x2_t *inserted = (int32x2_t)v39;
          inserted[1] = (int32x2_t)policy;
          unint64_t v27 = inserted + 2;
        }

        *unint64_t v27 = (int32x2_t)v8;
        int v29 = *(_DWORD *)(StatusReg + 24);
        while (1)
        {
          unsigned int v30 = __ldxr((unsigned int *)&AssociationsManagerLock);
          if (v30 != v29) {
            break;
          }
        }

        __clrex();
        os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
LABEL_54:
        else {
          char v31 = v13;
        }
        if ((v31 & 1) != 0)
        {
LABEL_62:
          if (!v22) {
            return;
          }
        }

        else
        {
          if ((*(void *)object & 1) == 0)
          {
            uint64_t v32 = *(void *)((*(void *)object & 0xFFFFFFFF8LL) + 0x20);
            if ((v32 & 4) == 0
              && ((unint64_t)(*(void *)(*(void *)object & 0xFFFFFFFF8LL) - 1LL) < 0xF
               || (*(_BYTE *)((v32 & 0xF00007FFFFFFFF8LL) + 3) & 0x40) == 0)
              && (*(_WORD *)((*(void *)object & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0)
            {
              MethodImplementation = (id (*)(id, SEL, ...))object_getMethodImplementation( (unint64_t)object,  (objc_selector *)sel__noteAssociatedObjects);
              if (MethodImplementation != _objc_msgForward) {
                MethodImplementation(object, sel__noteAssociatedObjects);
              }
            }
          }

          while (1)
          {
            unint64_t v33 = __ldxr((unint64_t *)object);
            if ((v33 & 3) != 1) {
              break;
            }
          }

          __clrex();
          if (!v22) {
            return;
          }
        }

void objc_removeAssociatedObjects(id object)
{
}

const void *__sel_registerName(char *a1, int a2, int a3)
{
  __s = a1;
  if (!a1) {
    return 0LL;
  }
  objc_selector = (const void *)_dyld_get_objc_selector();
  if (!objc_selector)
  {
    if (a2)
    {
      unsigned int v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      while (!__ldaxr((unsigned int *)&selLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
    }

LABEL_10:
    objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::try_emplace<objc::detail::DenseSetEmpty&>( (uint64_t)&v15,  namedSelectors,  &__s);
    id v8 = v15;
    if (v16)
    {
      objc_selector = __s;
      if (a3)
      {
        size_t v9 = strlen(__s) + 1;
        if ((_dyld_is_memory_immutable() & 1) == 0)
        {
          int v10 = malloc(v9);
          memcpy(v10, objc_selector, v9);
          objc_selector = v10;
        }
      }

      *id v8 = objc_selector;
      if (!a2) {
        return objc_selector;
      }
    }

    else
    {
      objc_selector = *v15;
      if (!a2) {
        return objc_selector;
      }
    }

    int v11 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (1)
    {
      unsigned int v12 = __ldxr((unsigned int *)&selLock);
      if (v12 != v11) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
  }

  return objc_selector;
}

void sub_18003C088(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (1)
    {
      unsigned int v4 = __ldxr((unsigned int *)&selLock);
      if (v4 != v3) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
  }

const char *__cdecl sel_getName(const char *sel)
{
  if (!sel) {
    return "<null selector>";
  }
  return sel;
}

unint64_t sel_hash(unint64_t a1)
{
  return a1 ^ (a1 >> 7);
}

BOOL sel_isMapped(SEL sel)
{
  int v1 = (char *)sel;
  if (sel)
  {
    if ((SEL)_dyld_get_objc_selector() == sel)
    {
      LOBYTE(v_class_addProperty(cls, name, attributes, attributeCount, 1) = 1;
    }

    else
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v3 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)&selLock))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_9:
      BOOL v5 = objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( (uint64_t)namedSelectors,  v1,  &v10);
      BOOL v6 = v10 != (char **)(*(void *)namedSelectors + 8LL * dword_18C43F458) && v5;
      LOBYTE(v_class_addProperty(cls, name, attributes, attributeCount, 1) = v6 && *v10 == v1;
      int v7 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v8 = __ldxr((unsigned int *)&selLock);
        if (v8 != v7) {
          break;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
    }
  }

  return (char)v1;
}

void sub_18003C1E8(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

SEL sel_registerName(const char *str)
{
  return (SEL)__sel_registerName((char *)str, 1, 1);
}

SEL sel_getUid(const char *str)
{
  return (SEL)__sel_registerName((char *)str, 1, 1);
}

uint64_t sel_lookUpByName(char *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t objc_selector = _dyld_get_objc_selector();
  if (!objc_selector)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)&selLock))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_9:
    BOOL v6 = objc::DenseMapBase<objc::DenseMap<char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>,char const*,objc::detail::DenseSetEmpty,objc::DenseMapValueInfo<objc::detail::DenseSetEmpty>,objc::DenseMapInfo<char const*>,objc::detail::DenseSetPair<char const*>>::LookupBucketFor<char const*>( (uint64_t)namedSelectors,  a1,  &v11);
    else {
      uint64_t objc_selector = 0LL;
    }
    int v8 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v9 = __ldxr((unsigned int *)&selLock);
      if (v9 != v8) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
  }

  return objc_selector;
}

void sub_18003C324(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return lhs == rhs;
}

int objc_sync_enter(id obj)
{
  return 0;
}

uint64_t _objc_sync_enter_kind(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  if (a1)
  {
    id2data(a1, a2, 0LL, a4);
    return os_unfair_recursive_lock_lock_with_options();
  }

  else
  {
    if (DebugNilSync) {
      _objc_inform("NIL SYNC DEBUG: @synchronized(nil); set a breakpoint on objc_sync_nil to debug");
    }
    uint64_t result = gdb_objc_class_changed();
    if (DebugNilSync == 2) {
      _objc_fatal("@synchronized(nil) is fatal", v5, v6, v7);
    }
  }

  return result;
}

_DWORD *id2data(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  int v4 = (int)a3;
  unsigned int v5 = a2;
  __memptr = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(_DWORD **)(StatusReg + 328);
  if (v8 && !(*((void *)v8 + 1) + a1) && v8[4] == (_DWORD)a2)
  {
    __memptr = *(void **)(StatusReg + 328);
    unsigned int v9 = v8 + 5;
    if ((_DWORD)a3 != 1)
    {
      if (!(_DWORD)a3) {
        *(void *)(StatusReg + 336) = v10 + 1;
      }
      return v8;
    }

    uint64_t v40 = v10 - 1;
    *(void *)(StatusReg + 336) = v40;
    if (v40) {
      return v8;
    }
    *(void *)(StatusReg + 328) = 0LL;
    do
      unsigned int v41 = __ldaxr(v9);
    while (__stlxr(v41 - 1, v9));
    return __memptr;
  }

  cache = fetch_cache(0);
  int v15 = cache;
  if (!cache || (uint64_t v16 = cache[1], !(_DWORD)v16))
  {
LABEL_15:
    unint64_t v20 = (os_unfair_lock_s *)((char *)&sDataLists
                             + 64
                             * (unint64_t)(((a1 >> 4) ^ (a1 >> 9)) & 7));
    p_os_unfair_lock_opaque = &v20[2]._os_unfair_lock_opaque;
    unsigned int v22 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(p_os_unfair_lock_opaque))
    {
      if (!__stxr(v22, p_os_unfair_lock_opaque)) {
        goto LABEL_20;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_20:
    unsigned int v24 = *(unsigned int **)&v20->_os_unfair_lock_opaque;
    if (*(void *)&v20->_os_unfair_lock_opaque)
    {
      int v25 = 0LL;
      do
      {
        if (!(*((void *)v24 + 1) + a1) && v24[4] == v5)
        {
          __memptr = v24;
          unint64_t v27 = v24 + 5;
          do
            unsigned int v28 = __ldaxr(v27);
          while (__stlxr(v28 + 1, v27));
          goto LABEL_36;
        }

        if (!v25)
        {
          if (v24[5]) {
            int v25 = 0LL;
          }
          else {
            int v25 = v24;
          }
        }

        unsigned int v24 = *(unsigned int **)v24;
      }

      while (v24);
      if (v4 == 1) {
        goto LABEL_36;
      }
      if (v25)
      {
        __memptr = v25;
        *((void *)v25 + _class_addProperty(cls, name, attributes, attributeCount, 1) = -a1;
        v25[4] = v5;
        v25[5] = 1;
        goto LABEL_36;
      }
    }

    else if (v4 == 1)
    {
      goto LABEL_36;
    }

    posix_memalign(&__memptr, 0x40uLL, 0x40uLL);
    unsigned int v26 = (char *)__memptr;
    *((void *)__memptr + _class_addProperty(cls, name, attributes, attributeCount, 1) = -a1;
    *((_DWORD *)v26 + 4) = v5;
    *(void *)(v26 + 20) = 1LL;
    *((_DWORD *)v26 + 7) = 0;
    *(void *)unsigned int v26 = *(void *)&v20->_os_unfair_lock_opaque;
    *(void *)&v20->_os_unfair_lock_opaque = __memptr;
LABEL_36:
    int v29 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v30 = __ldxr(p_os_unfair_lock_opaque);
      if (v30 != v29) {
        break;
      }
      if (!__stlxr(0, p_os_unfair_lock_opaque)) {
        goto LABEL_41;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v20 + 2);
LABEL_41:
    char v31 = __memptr;
    if (__memptr) {
      BOOL v32 = v4 == 1;
    }
    else {
      BOOL v32 = 1;
    }
    if (v32) {
      return 0LL;
    }
    if (*((void *)__memptr + 1) + a1 || *((_DWORD *)__memptr + 4) != v5) {
      _objc_fatal("id2data is buggy", v12, v13, v14);
    }
    if (!v8)
    {
      *(void *)(StatusReg + 328) = __memptr;
      *(void *)(StatusReg + 336) = 1LL;
      return v31;
    }

    if (!v15)
    {
      int v15 = fetch_cache(1);
      char v31 = __memptr;
    }

    uint64_t v33 = v15[1];
    uint64_t v34 = &v15[4 * v33];
    *((void *)v34 + _class_addProperty(cls, name, attributes, attributeCount, 1) = v31;
    v34[4] = 1;
    v15[1] = v33 + 1;
    return __memptr;
  }

  uint64_t v17 = 0LL;
  uint64_t v18 = (void **)(cache + 2);
  while (1)
  {
    int v19 = *v18;
    if (!(*((void *)*v18 + 1) + a1) && v19[4] == v5) {
      break;
    }
    ++v17;
    v18 += 2;
    if (v16 == v17) {
      goto LABEL_15;
    }
  }

  __memptr = *v18;
  unsigned int v35 = v19 + 5;
  if (v4 == 1)
  {
    int v8 = v19;
    *__int128 v37 = v38 - 1;
    if (v38 != 1) {
      return v8;
    }
    int v43 = v16 - 1;
    cache[1] = v43;
    *(_OWORD *)uint64_t v18 = *(_OWORD *)&cache[4 * v43 + 2];
    do
      unsigned int v44 = __ldaxr(v35);
    while (__stlxr(v44 - 1, v35));
    return __memptr;
  }

  if (!v4) {
    *__int128 v37 = v38 + 1;
  }
  return v19;
}

int *fetch_cache(int a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v3 = *(_OWORD **)(StatusReg + 320);
  if (!a1 || v3)
  {
    if (!v3) {
      return 0LL;
    }
  }

  else
  {
    unsigned int v3 = malloc(0x48uLL);
    *unsigned int v3 = 0u;
    v3[1] = 0u;
    _OWORD v3[2] = 0u;
    void v3[3] = 0u;
    *((void *)v3 + 8) = 0LL;
    *(void *)(StatusReg + 320) = v3;
  }

  uint64_t result = (int *)*((void *)v3 + 1);
  if (result)
  {
    int v5 = *result;
    goto LABEL_9;
  }

  if (!a1) {
    return 0LL;
  }
  uint64_t result = (int *)calloc(1uLL, 0x48uLL);
  *((void *)v3 + _class_addProperty(cls, name, attributes, attributeCount, 1) = result;
  int v5 = 4;
  int *result = 4;
LABEL_9:
  if (v5 == result[1])
  {
    unsigned int v6 = 2 * v5;
    int *result = v6;
    uint64_t result = (int *)realloc(result, (32LL * (v6 >> 1)) | 8);
    *((void *)v3 + _class_addProperty(cls, name, attributes, attributeCount, 1) = result;
  }

  return result;
}

uint64_t objc_sync_try_enter(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  if (a1)
  {
    id2data(a1, 1LL, 0LL, a4);
    return os_unfair_recursive_lock_trylock();
  }

  else
  {
    if (DebugNilSync) {
      _objc_inform("NIL SYNC DEBUG: @synchronized(nil); set a breakpoint on objc_sync_nil to debug");
    }
    gdb_objc_class_changed(a1);
    if (DebugNilSync == 2) {
      _objc_fatal("@synchronized(nil) is fatal", v5, v6, v7);
    }
    return 1LL;
  }

int objc_sync_exit(id obj)
{
  int v4 = _objc_sync_exit_kind((uint64_t)obj, 1LL, v1, v2);
  if (v4 && DebugSyncErrors)
  {
    if (DebugSyncErrors == 2) {
      ((void (*)(const char *, ...))_objc_fatal)("objc_sync_exit(%p) returned error %d", obj, -1);
    }
    _objc_inform("objc_sync_exit(%p) returned error %d", obj, -1);
  }

  return v4;
}

uint64_t _objc_sync_exit_kind(uint64_t result, uint64_t a2, uint64_t a3, char *a4)
{
  if (result)
  {
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

const char *SkipFirstType(char *a1, uint64_t a2, const char *a3, char *a4)
{
  do
  {
    uint64_t v5 = a1;
    int v7 = *a1++;
    int v6 = v7;
    uint64_t v8 = (v7 - 78);
  }

  while (((1LL << v8) & 0x1300010103LL) != 0);
  if (v8 == 13)
  {
    do
      int v11 = *++v5;
    while ((v11 - 48) < 0xA);
    uint64_t v12 = &v5[(int)SubtypeUntil(v5, 93LL, a3, a4)];
    return v12 + 1;
  }

  if (v8 == 45)
  {
    unsigned int v9 = a1;
    uint64_t v10 = 125LL;
LABEL_14:
    uint64_t v12 = &a1[(int)SubtypeUntil(v9, v10, a3, a4)];
    return v12 + 1;
  }

uint64_t SubtypeUntil(char *a1, uint64_t a2, const char *a3, char *a4)
{
  char v4 = *a1;
  if (!*a1) {
LABEL_16:
  }
    _objc_fatal("Object: SubtypeUntil: end of type encountered prematurely\n", a2, a3, a4);
  int v5 = 0;
  int v6 = a1;
  while (v5 || v4 != a2)
  {
    if (v4 <= 92)
    {
      if (v4 == 40) {
        goto LABEL_14;
      }
      if (v4 != 41)
      {
        if (v4 != 91) {
          goto LABEL_15;
        }
LABEL_14:
        ++v5;
        goto LABEL_15;
      }

LABEL_15:
    int v7 = *(unsigned __int8 *)++v6;
    char v4 = v7;
    if (!v7) {
      goto LABEL_16;
    }
  }

  return ((_DWORD)v6 - (_DWORD)a1);
}

  int v11 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    uint64_t v12 = __ldxr((unsigned int *)v5);
    if (v12 != v11) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
LABEL_20:
  if ((v8 & a3) == 1)
  {
    else {
      char v13 = &selRef_dealloc;
    }
    [this *v13];
  }

  return v8;
}

  __clrex();
  return objc_object::sidetable_release((objc_object *)a1, 0, 0);
}

char *encoding_getArgumentInfo(char *a1, uint64_t a2, char *a3, char *a4)
{
  int v6 = a2;
  uint64_t result = (char *)(SkipFirstType(a1, a2, a3, a4) - 1);
  do
  {
    int v12 = *++result;
    int v11 = v12;
  }

  while ((v12 - 48) < 0xA);
  BOOL v15 = v11 == 0;
  int v13 = v11 != 0;
  int v14 = 0;
  BOOL v15 = v15 || v6 == 0;
  if (!v15)
  {
    int v16 = 0;
    do
    {
      Type = SkipFirstType(result, v8, v9, v10);
      uint64_t v18 = Type;
      BOOL v19 = *(unsigned __int8 *)Type == 43;
      if (*Type == 43) {
        unint64_t v20 = (char *)(Type + 1);
      }
      else {
        unint64_t v20 = (char *)Type;
      }
      int v21 = *v20;
      if (v21 == 45) {
        uint64_t result = v20 + 1;
      }
      else {
        uint64_t result = v20;
      }
      if (v16)
      {
        uint64_t result = (char *)&v18[(v21 == 45) - 1 + v19];
        do
        {
          int v23 = *++result;
          int v22 = v23;
        }

        while ((v23 - 48) < 0xA);
      }

      else
      {
        int v24 = *result;
        if ((v24 - 48) > 9)
        {
          int v22 = *result;
        }

        else
        {
          do
          {
            int v25 = *++result;
            int v22 = v25;
            int v14 = v24 + 10 * v14 - 48;
            int v24 = v25;
          }

          while ((v25 - 48) < 0xA);
        }

        if (v21 == 45) {
          int v14 = -v14;
        }
      }

      ++v16;
      BOOL v15 = v22 == 0;
      int v13 = v22 != 0;
    }

    while (!v15 && v16 != v6);
  }

  if (v13)
  {
    *(void *)a3 = result;
    uint64_t result = (char *)SkipFirstType(result, v8, v9, v10);
    if (v6)
    {
      int v27 = *result;
      BOOL v28 = v27 == 43;
      if (v27 == 43) {
        int v29 = result + 1;
      }
      else {
        int v29 = result;
      }
      int v30 = *v29;
      if (v30 == 45) {
        ++v29;
      }
      int v31 = *v29;
      if ((v31 - 48) > 9)
      {
        int v32 = 0;
      }

      else
      {
        int v32 = 0;
        uint64_t v33 = &result[(v30 == 45) + 1 + v28];
        do
        {
          int v32 = v31 + 10 * v32 - 48;
          int v34 = *v33++;
          int v31 = v34;
        }

        while ((v34 - 48) < 0xA);
      }

      if (v30 == 45) {
        int v35 = -v32;
      }
      else {
        int v35 = v32;
      }
      int v13 = v35 - v14;
    }

    else
    {
      int v13 = 0;
    }
  }

  else
  {
    *(void *)a3 = 0LL;
  }

  *(_DWORD *)a4 = v13;
  return result;
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  if (offset)
  {
    int v5 = (id *)((char *)self + offset);
    if (atomic)
    {
      int v6 = (os_unfair_lock_s *)&PropertyLocks[16
                                            * (unint64_t)(((v5 >> 4) ^ (v5 >> 9)) & 7)];
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v8 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(&v6->_os_unfair_lock_opaque))
      {
        if (!__stxr(v8, &v6->_os_unfair_lock_opaque)) {
          goto LABEL_12;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_12:
      id v11 = *v5;
      int v12 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v13 = __ldxr(&v6->_os_unfair_lock_opaque);
        if (v13 != v12) {
          break;
        }
        if (!__stlxr(0, &v6->_os_unfair_lock_opaque)) {
          return v11;
        }
      }

      __clrex();
      os_unfair_lock_unlock(v6);
      return v11;
    }

    else
    {
      return *v5;
    }
  }

  else if (self)
  {
    if (((unint64_t)self & 0x8000000000000000LL) != 0)
    {
      id result = (id)objc_debug_taggedpointer_classes[self & 7];
    }

    else
    {
      return (id)(*(void *)self & 0xFFFFFFFF8LL);
    }
  }

  else
  {
    return 0LL;
  }

  return result;
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
{
  if (!offset)
  {
    object_setClass(self, (Class)newValue);
    return;
  }

  int v7 = (id *)((char *)self + offset);
  if ((shouldCopy & 0xFD) != 0)
  {
    id v8 = objc_msgSend(newValue, sel_copyWithZone_, 0);
  }

  else if (shouldCopy == 2)
  {
    id v8 = objc_msgSend(newValue, sel_mutableCopyWithZone_, 0);
  }

  else
  {
    if (*v7 == newValue) {
      return;
    }
    id v8 = newValue;
  }

  id v9 = v8;
  if (atomic)
  {
    uint64_t v10 = (unsigned int *)&PropertyLocks[16
                                       * (unint64_t)(((v7 >> 4) ^ (v7 >> 9)) & 7)];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v12 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v10))
    {
      if (!__stxr(v12, v10)) {
        goto LABEL_14;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_14:
    id v14 = *v7;
    *int v7 = v9;
    int v15 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v16 = __ldxr(v10);
      if (v16 != v15) {
        break;
      }
      if (!__stlxr(0, v10)) {
        goto LABEL_19;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&PropertyLocks[16
                                                         * (unint64_t)(((v7 >> 4) ^ (v7 >> 9)) & 7)]);
  }

  else
  {
    id v14 = *v7;
    *int v7 = v8;
  }

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  if (offset)
  {
    char v4 = (void **)((char *)self + offset);
    if (*(id *)((char *)self + offset) != newValue)
    {
      id v5 = newValue;
      int v6 = (unsigned int *)&PropertyLocks[16
                                        * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)];
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unsigned int v8 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr(v6))
      {
        if (!__stxr(v8, v6)) {
          goto LABEL_10;
        }
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_10:
      uint64_t v10 = *v4;
      *char v4 = v5;
      int v11 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v12 = __ldxr(v6);
        if (v12 != v11) {
          break;
        }
        if (!__stlxr(0, v6)) {
          goto LABEL_15;
        }
      }

      __clrex();
      os_unfair_lock_unlock((os_unfair_lock_t)&PropertyLocks[16
                                                           * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
LABEL_15:
    }
  }

  else
  {
    object_setClass(self, (Class)newValue);
  }

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  if (offset)
  {
    if (*(id *)((char *)self + offset) != newValue)
    {
      id v6 = newValue;
      int v7 = *(void **)((char *)self + offset);
      *(void *)((char *)self + offset) = v6;
    }
  }

  else
  {
    object_setClass(self, (Class)newValue);
  }

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  if (offset)
  {
    char v4 = (void **)((char *)self + offset);
    id v5 = objc_msgSend(newValue, sel_copyWithZone_, 0);
    id v6 = (unsigned int *)&PropertyLocks[16
                                      * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v8 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v6))
    {
      if (!__stxr(v8, v6)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    uint64_t v10 = *v4;
    *char v4 = v5;
    int v11 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v12 = __ldxr(v6);
      if (v12 != v11) {
        break;
      }
      if (!__stlxr(0, v6)) {
        goto LABEL_13;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&PropertyLocks[16
                                                         * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
LABEL_13:
  }

  else
  {
    object_setClass(self, (Class)newValue);
  }

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  if (offset)
  {
    id v6 = objc_msgSend(newValue, sel_copyWithZone_, 0);
    int v7 = *(void **)((char *)self + offset);
    *(void *)((char *)self + offset) = v6;
  }

  else
  {
    object_setClass(self, (Class)newValue);
  }

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  if (atomic)
  {
    unsigned int v8 = (os_unfair_lock_s *)&StructLocks[16
                                        * (unint64_t)(((dest >> 4) ^ (dest >> 9)) & 7)];
    locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::lockWith( (unsigned int *)&StructLocks[16 * (unint64_t)(((src >> 4) ^ (src >> 9)) & 7)],  &v8->_os_unfair_lock_opaque);
    memmove(dest, src, size);
    locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith( (os_unfair_lock_t)&StructLocks[16 * (unint64_t)(((src >> 4) ^ (src >> 9)) & 7)],  v8);
  }

  else
  {
    memmove(dest, src, size);
  }

unsigned int *locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::lockWith( unsigned int *result, unsigned int *a2)
{
  unsigned int v3 = result;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  if (result < a2)
  {
    while (!__ldaxr(result))
    {
      if (!__stxr(v5, result)) {
        goto LABEL_9;
      }
    }

    __clrex();
    id result = (unsigned int *)os_unfair_lock_lock_with_options();
LABEL_9:
    unsigned int v8 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(a2))
    {
      if (!__stxr(v8, a2)) {
        return result;
      }
    }

void locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith( os_unfair_lock_t lock, os_unfair_lock_t a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v5 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v6 = __ldxr(&lock->_os_unfair_lock_opaque);
    if (v6 != v5) {
      break;
    }
    if (!__stlxr(0, &lock->_os_unfair_lock_opaque)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock(lock);
LABEL_6:
  if (lock != a2)
  {
    int v7 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v8 = __ldxr(&a2->_os_unfair_lock_opaque);
      if (v8 != v7) {
        break;
      }
      if (!__stlxr(0, &a2->_os_unfair_lock_opaque)) {
        return;
      }
    }

    __clrex();
    os_unfair_lock_unlock(a2);
  }

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  unsigned int v6 = (os_unfair_lock_s *)&CppObjectLocks[16
                                         * (unint64_t)(((src >> 4) ^ (src >> 9)) & 7)];
  int v7 = (os_unfair_lock_s *)&CppObjectLocks[16
                                         * (unint64_t)(((dest >> 4) ^ (dest >> 9)) & 7)];
  locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::lockWith( &v6->_os_unfair_lock_opaque,  &v7->_os_unfair_lock_opaque);
  ((void (*)(void *, const void *))copyHelper)(dest, src);
  locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith(v6, v7);
}

uint64_t objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( uint64_t a1, void *a2)
{
  if (dword_18C43F118)
  {
    uint64_t v2 = (dword_18C43F118 - 1) & (bswap64(0x8A970BE7488FDA55LL * (-a1 ^ ((unint64_t)-a1 >> 4))) ^ (1217387093 * (-(int)a1 ^ ((unint64_t)-a1 >> 4))));
    unsigned int v3 = (void *)(objc::AssociationsManager::_mapStorage + 32 * v2);
    if (a1 == *v3)
    {
      uint64_t v4 = 1LL;
    }

    else
    {
      unsigned int v6 = 0LL;
      uint64_t v7 = -*v3;
      unsigned int v8 = 1;
      while (v7 != -1)
      {
        if (v8 > dword_18C43F118) {
          objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::FatalCorruptHashTables( (void *)objc::AssociationsManager::_mapStorage,  dword_18C43F118);
        }
        if (v6) {
          BOOL v9 = 0;
        }
        else {
          BOOL v9 = v7 == -2;
        }
        if (v9) {
          unsigned int v6 = v3;
        }
        int v10 = v2 + v8++;
        uint64_t v2 = v10 & (dword_18C43F118 - 1);
        unsigned int v3 = (void *)(objc::AssociationsManager::_mapStorage + 32 * v2);
        uint64_t v7 = -*v3;
        uint64_t v4 = 1LL;
        if (*v3 == a1) {
          goto LABEL_5;
        }
      }

      uint64_t v4 = 0LL;
      if (v6) {
        unsigned int v3 = v6;
      }
    }
  }

  else
  {
    unsigned int v3 = 0LL;
    uint64_t v4 = 0LL;
  }

uint64_t objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( uint64_t a1, unint64_t a2, void *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    unsigned int v4 = v3 - 1;
    unsigned int v5 = (v3 - 1) & (bswap64(0x8A970BE7488FDA55LL * (a2 ^ (a2 >> 4))) ^ (1217387093 * (a2 ^ (a2 >> 4))));
    unsigned int v6 = (void *)(*(void *)a1 + 24LL * v5);
    uint64_t v7 = *v6;
    if (*v6 == a2)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      int v10 = 0LL;
      unsigned int v11 = 1;
      while (v7 != -1)
      {
        if (v11 > v3) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  *(void **)a1,  *(unsigned int *)(a1 + 16));
        }
        if (v10) {
          BOOL v12 = 0;
        }
        else {
          BOOL v12 = v7 == -2;
        }
        if (v12) {
          int v10 = v6;
        }
        unsigned int v13 = v5 + v11++;
        unsigned int v5 = v13 & v4;
        unsigned int v6 = (void *)(*(void *)a1 + 24LL * (v13 & v4));
        uint64_t v7 = *v6;
        uint64_t v8 = 1LL;
        if (*v6 == a2) {
          goto LABEL_5;
        }
      }

      uint64_t v8 = 0LL;
      if (v10) {
        unsigned int v6 = v10;
      }
    }
  }

  else
  {
    unsigned int v6 = 0LL;
    uint64_t v8 = 0LL;
  }

void objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::compact()
{
  if ((_DWORD)qword_18C43F110)
  {
  }

  else
  {
    if (!dword_18C43F118) {
      goto LABEL_15;
    }
    uint64_t v1 = 32LL * dword_18C43F118;
    uint64_t v2 = (void **)(objc::AssociationsManager::_mapStorage + 8);
    do
    {
      v2 += 4;
      v1 -= 32LL;
    }

    while (v1);
    if (dword_18C43F118)
    {
      free((void *)objc::AssociationsManager::_mapStorage);
      objc::AssociationsManager::_mapStorage = 0LL;
      qword_18C43F110 = 0LL;
      dword_18C43F118 = 0;
    }

    else
    {
LABEL_15:
      qword_18C43F110 = 0LL;
    }
  }

void objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::grow( int a1)
{
  uint64_t v1 = dword_18C43F118;
  uint64_t v2 = (_DWORD *)objc::AssociationsManager::_mapStorage;
  unsigned int v3 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = v4 | HIWORD(v4);
  else {
    uint64_t v6 = 4LL;
  }
  dword_18C43F118 = v6;
  uint64_t v7 = malloc(32LL * v6);
  objc::AssociationsManager::_mapStorage = (uint64_t)v7;
  if (v2)
  {
    qword_18C43F110 = 0LL;
    uint64_t v8 = 32 * v6;
    do
    {
      *uint64_t v7 = 1LL;
      v7 += 4;
      v8 -= 32LL;
    }

    while (v8);
    if ((_DWORD)v1)
    {
      uint64_t v9 = 32 * v1;
      int v10 = v2 + 6;
      do
      {
        uint64_t v11 = *((void *)v10 - 3);
        if ((unint64_t)(v11 - 1) >= 2)
        {
          objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( v11,  &v15);
          uint64_t v12 = v15;
          uint64_t v13 = *((void *)v10 - 3);
          *(_DWORD *)(v15 + 24) = 0;
          *(void *)(v12 + 8) = 0LL;
          *(void *)(v12 + 16) = 0LL;
          *(void *)uint64_t v12 = v13;
          *(void *)(v12 + 8) = *((void *)v10 - 2);
          *((void *)v10 - 2) = 0LL;
          *(_DWORD *)(v12 + 16) = *(v10 - 2);
          *(v10 - 2) = 0;
          LODWORD(v13) = *(_DWORD *)(v12 + 20);
          *(_DWORD *)(v12 + 20) = *(v10 - 1);
          *(v10 - _class_addProperty(cls, name, attributes, attributeCount, 1) = v13;
          LODWORD(v13) = *(_DWORD *)(v12 + 24);
          *(_DWORD *)(v12 + 24) = *v10;
          *int v10 = v13;
          LODWORD(qword_18C43F110) = qword_18C43F110 + 1;
        }

        v10 += 8;
        v9 -= 32LL;
      }

      while (v9);
    }

    free(v2);
  }

  else
  {
    qword_18C43F110 = 0LL;
    uint64_t v14 = 32 * v6;
    do
    {
      *uint64_t v7 = 1LL;
      v7 += 4;
      v14 -= 32LL;
    }

    while (v14);
  }

void objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  unsigned int v4 = *(void **)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    uint64_t v8 = 4LL;
  }
  *(_DWORD *)(a1 + 16) = v8;
  uint64_t v9 = malloc(8 * (v8 + 2LL * v8));
  *(void *)a1 = v9;
  if (v4)
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v10 = 24 * v8;
    do
    {
      *uint64_t v9 = -1LL;
      v9 += 3;
      v10 -= 24LL;
    }

    while (v10);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 24 * v3;
      uint64_t v12 = v4 + 2;
      do
      {
        unint64_t v13 = *(v12 - 2);
        if (v13 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( a1,  v13,  &v18);
          uint64_t v14 = v18;
          uint64_t v15 = *(v12 - 2);
          v18[1] = 0LL;
          v14[2] = 0LL;
          *uint64_t v14 = v15;
          v14[1] = *(v12 - 1);
          *(v12 - _class_addProperty(cls, name, attributes, attributeCount, 1) = 0LL;
          uint64_t v16 = v14[2];
          v14[2] = *v12;
          *uint64_t v12 = v16;
          ++*(_DWORD *)(a1 + 8);
        }

        v12 += 3;
        v11 -= 24LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    uint64_t v17 = 24 * v8;
    do
    {
      *uint64_t v9 = -1LL;
      v9 += 3;
      v17 -= 24LL;
    }

    while (v17);
  }

void *objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::InsertIntoBucketImpl<void const*>( int32x2_t *a1, unint64_t *a2, void *a3)
{
  __int32 v5 = a1[1].i32[0];
  unsigned int v6 = a1[2].u32[0];
  if (4 * v5 + 4 >= 3 * v6)
  {
    v6 *= 2;
  }

  else if (v6 + ~v5 - a1[1].i32[1] > v6 >> 3)
  {
    goto LABEL_3;
  }

  objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::grow( (uint64_t)a1,  v6);
  objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( (uint64_t)a1,  *a2,  &v8);
  a3 = v8;
LABEL_3:
  if (*a3 == -2LL)
  {
    a1[1] = vadd_s32(a1[1], (int32x2_t)0xFFFFFFFF00000001LL);
  }

  else if (*a3 == -1LL)
  {
    ++a1[1].i32[0];
  }

  return a3;
}

void _object_remove_associations(uint64_t a1, int a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&AssociationsManagerLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  int v7 = objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::LookupBucketFor<DisguisedPtr<objc_object>>( -a1,  &v34);
  uint64_t v8 = v34;
  else {
    int v9 = v7;
  }
  if (v9 == 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v12 = (void **)&v34[1];
    uint64_t v11 = (char *)v34[1];
    int v13 = v34[2].i32[0];
    v34[1] = 0LL;
    v8[2] = 0LL;
    uint64_t v14 = v8[3].u32[0];
    v8[3].i32[0] = 0;
    if ((a2 & 1) == 0)
    {
      if (!v13) {
        goto LABEL_29;
      }
      uint64_t v15 = v11;
      if ((_DWORD)v14)
      {
        uint64_t v16 = 24 * v14;
        uint64_t v15 = v11;
        while (*(void *)v15 >= 0xFFFFFFFFFFFFFFFELL)
        {
          v15 += 24;
          v16 -= 24LL;
          if (!v16) {
            goto LABEL_29;
          }
        }
      }

      uint64_t v17 = &v11[24 * v14];
      if (v15 == v17)
      {
LABEL_29:
        uint64_t v10 = 0LL;
      }

      else
      {
        char v18 = 0;
LABEL_20:
        if ((v15[10] & 1) != 0)
        {
          if ((objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::LookupBucketFor<void const*>( (uint64_t)&v8[1],  *(void *)v15,  &v34) & 1) == 0)
          {
            inserted = objc::DenseMapBase<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>::InsertIntoBucketImpl<void const*>( v8 + 1,  (unint64_t *)v15,  v34);
            void *inserted = *(void *)v15;
            *(_OWORD *)(inserted + _class_addProperty(cls, name, attributes, attributeCount, 1) = *(_OWORD *)(v15 + 8);
          }

          char v18 = 1;
        }

        while (1)
        {
          v15 += 24;
          if (v15 == v17) {
            break;
          }
          if (*(void *)v15 < 0xFFFFFFFFFFFFFFFELL)
          {
            if (v15 != v17) {
              goto LABEL_20;
            }
            break;
          }
        }

        if ((v18 & 1) != 0)
        {
          int v13 = 1;
          goto LABEL_31;
        }

        uint64_t v10 = *v12;
      }
    }

    free(v10);
    *uint64_t v8 = (int32x2_t)2LL;
    qword_18C43F110 = (uint64_t)vadd_s32((int32x2_t)qword_18C43F110, (int32x2_t)0x1FFFFFFFFLL);
    objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::compact();
    goto LABEL_31;
  }

  LODWORD(v14) = 0;
  int v13 = 0;
  uint64_t v11 = 0LL;
LABEL_31:
  int v20 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v21 = __ldxr((unsigned int *)&AssociationsManagerLock);
    if (v21 != v20) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
LABEL_36:
  LODWORD(v34) = 0;
  __ptr[0] = 0LL;
  if (v13)
  {
    int v22 = v11;
    if ((_DWORD)v14)
    {
      uint64_t v23 = 24LL * v14;
      int v22 = v11;
      while (*(void *)v22 >= 0xFFFFFFFFFFFFFFFELL)
      {
        v22 += 24;
        v23 -= 24LL;
        if (!v23) {
          goto LABEL_69;
        }
      }
    }

    int v24 = &v11[24 * v14];
    if (v22 != v24)
    {
      unsigned int v25 = 0;
      unsigned int v26 = __ptr;
LABEL_44:
      BOOL v28 = v22 + 8;
      uint64_t v27 = *((void *)v22 + 1);
      if ((v27 & 0x10000) != 0)
      {
        if (a2)
        {
          if (v25 > 3)
          {
            if (v25 == 4)
            {
              int v30 = malloc(0x28uLL);
              __int128 v31 = v36;
              *int v30 = *(_OWORD *)__ptr;
              v30[1] = v31;
              *((void *)v30 + 4) = v28;
              __ptr[0] = v30;
            }

            else
            {
              __ptr[0] = realloc(__ptr[0], 8LL * (v25 + 1));
              *((void *)__ptr[0] + v25) = v28;
            }
          }

          else
          {
            __ptr[v25] = v28;
          }

          LODWORD(v34) = ++v25;
        }
      }

      else if ((v27 & 1) != 0)
      {
        int v29 = (void *)*((void *)v22 + 2);
        if (v29) {
      }
        }

      while (1)
      {
        v22 += 24;
        if (v22 == v24) {
          break;
        }
        if (*(void *)v22 < 0xFFFFFFFFFFFFFFFELL)
        {
          if (v22 != v24) {
            goto LABEL_44;
          }
          break;
        }
      }

      if (v25 >= 5)
      {
        unsigned int v26 = (void **)__ptr[0];
      }

      else if (!v25)
      {
        goto LABEL_69;
      }

      int v32 = &v26[v25];
      do
      {
        uint64_t v33 = (void *)*((void *)*v26 + 1);
        if (v33 && (*(_BYTE *)*v26 & 1) != 0) {

        }
        ++v26;
      }

      while (v26 != v32);
    }
  }

void sub_18003DD9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, void *a11)
{
  int v15 = *(_DWORD *)(v13 + 24);
  while (1)
  {
    unsigned int v16 = __ldxr(v12);
    if (v16 != v15) {
      break;
    }
    if (!__stlxr(0, v12)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
LABEL_6:
  free(v11);
  _Unwind_Resume(a1);
}

void objc_addLoadImageFunc(objc_func_loadImage func)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v6, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v8 = (void *)FirstHeader;
  if (FirstHeader)
  {
    do
    {
      ((void (*)(char *))func)((char *)v8 + *v8);
      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v8);
      uint64_t v10 = v8 + 3;
      if (PreoptimizedHeaderRW) {
        uint64_t v10 = (void *)PreoptimizedHeaderRW;
      }
      uint64_t v8 = (void *)(*v10 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v8);
  }

  objc_func_loadImage v13 = func;
  char v14 = 1;
  GlobalSmallVector<loadImageCallback,4u>::append((uint64_t *)&v13, v1, v2, v3);
  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr(runtimeLock);
    if (v12 != v11) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18003DF00(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void GlobalSmallVector<loadImageCallback,4u>::append(uint64_t *a1, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = loadImageCallbacks[0];
  if (loadImageCallbacks[0] > 3u)
  {
    if (loadImageCallbacks[0] == 4)
    {
      uint64_t v8 = malloc(0x50uLL);
      for (unint64_t i = 0LL; i != 64; i += 16LL)
      {
        uint64_t v10 = LOBYTE(loadImageCallbacks[i / 4 + 4]);
        uint64_t v11 = *(void *)&loadImageCallbacks[i / 4 + 2];
        unsigned int v12 = (char *)&v8[i / 8];
        *(void *)unsigned int v12 = v11;
        v12[8] = v10;
      }

      uint64_t v6 = *((unsigned __int8 *)a1 + 8);
      uint64_t v13 = *a1;
      if ((v6 - 1) < 2)
      {
        v8[8] = v13;
        *((_BYTE *)v8 + 72) = v6;
        qword_18C43F6A8 = (uint64_t)v8;
        LODWORD(v5) = 4;
        goto LABEL_15;
      }

void objc_addLoadImageFunc2(void (*a1)(char *, uint64_t), uint64_t a2, const char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v6, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  uint64_t v8 = (void *)FirstHeader;
  if (FirstHeader)
  {
    do
    {
      if (preoptimized == 1 && (*((_BYTE *)v8 + v8[1] + 12) & 8) != 0 && *(_DWORD *)(headerInfoROs + 4) < 0x18u) {
        uint64_t v9 = 0LL;
      }
      else {
        uint64_t v9 = (uint64_t)v8 + v8[2] + 16;
      }
      a1((char *)v8 + *v8, v9);
      uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v8);
      uint64_t v11 = v8 + 3;
      if (PreoptimizedHeaderRW) {
        uint64_t v11 = (void *)PreoptimizedHeaderRW;
      }
      uint64_t v8 = (void *)(*v11 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v8);
  }

  char v14 = a1;
  char v15 = 2;
  GlobalSmallVector<loadImageCallback,4u>::append((uint64_t *)&v14, a2, a3, a4);
  int v12 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(runtimeLock);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18003E208(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void map_images_nolock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v240 = a4;
  uint64_t v230 = a2;
  uint64_t v249 = *MEMORY[0x1895F89C0];
  uint64_t v229 = a1;
  MEMORY[0x1895F8858]();
  v235 = (char *)&v223 - v4;
  v224 = v5;
  *unsigned int v5 = 0;
  if ((map_images_nolock::firstTime & 1) != 0)
  {
    loadAllCategoriesIfNeeded();
  }

  else
  {
    shared_cache_range = (objc::SafeRanges *)_dyld_get_shared_cache_range();
    if (shared_cache_range)
    {
      dataSegmentsRanges = (uint64_t)shared_cache_range;
      *(void *)algn_18C43FCB8 = (char *)shared_cache_range + size[0];
      objc::SafeRanges::add(shared_cache_range, (uint64_t)shared_cache_range + size[0]);
    }

    headerInfoROs = _dyld_for_objc_header_opt_ro();
    objc_debug_headerInfoRWs = _dyld_for_objc_header_opt_rw();
    opt = &_objc_opt_data;
    if (DisablePreopt)
    {
      int v7 = "(by OBJC_DISABLE_PREOPTIMIZATION)";
    }

    else if (headerInfoROs)
    {
      int v7 = "libobjc is not in the shared cache";
      if (dataSegmentsRanges <= (unint64_t)&_objc_empty_cache
        && *(void *)algn_18C43FCB8 > (unint64_t)&_objc_empty_cache)
      {
        preoptimized = 1;
        goto LABEL_9;
      }
    }

    else
    {
      int v7 = "(dyld shared cache is absent or out of date)";
    }

    preoptimized = 0;
    opt = 0LL;
    fixed_up_protocol = 1;
    canonical_protocol = 1;
  }

LABEL_23:
      uint32_t magic = v19->magic;
      if (v19->magic + 17958194 >= 2 && magic != -805638658 && magic != -822415874) {
        goto LABEL_112;
      }
      v238 = v17;
      uint64_t v32 = _dyld_lookup_section_info();
      if (getsegmentdata(v19, "__OBJC", size)) {
        BOOL v33 = 0;
      }
      else {
        BOOL v33 = v32 == 0;
      }
      if (!v33)
      {
        int v34 = (char *)calloc(0x20uLL, 1uLL);
        uint64_t v27 = (uint64_t)v34;
        int v35 = &addHeader(mach_header_64 const*,char const*,_dyld_section_location_info_s *,int &,int &)::emptyInfo;
        if (v32) {
          int v35 = (_BYTE *)v32;
        }
        *(void *)int v34 = (char *)v19 - v34;
        *((void *)v34 + _class_addProperty(cls, name, attributes, attributeCount, 1) = v35 - (v34 + 8);
        *((void *)v34 + 2) = v20 - (void)(v34 + 16);
        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v34);
        __int128 v37 = (void *)(v27 + 24);
        if (PreoptimizedHeaderRW) {
          __int128 v37 = (void *)PreoptimizedHeaderRW;
        }
        *v37 |= 1uLL;
        int v38 = 1;
        goto LABEL_46;
      }

LABEL_155:
          v89 += 5;
          if (!--v88) {
            goto LABEL_156;
          }
        }
      }
    }
  }

  if (map_images_nolock::executableIsARM64e == 1) {
    goto LABEL_144;
  }
LABEL_156:
  if (!(_DWORD)v232) {
    goto LABEL_360;
  }
  LODWORD(v23_class_addProperty(cls, name, attributes, attributeCount, 1) = _read_images::doneOnce;
  if ((_read_images::doneOnce & 1) == 0)
  {
    _read_images::doneOnce = 1;
    if (DisableTaggedPointers)
    {
      objc_debug_taggedpointer_masuint64_t k = 0LL;
      objc_debug_taggedpointer_slot_shift = 0;
      objc_debug_taggedpointer_slot_masuint64_t k = 0LL;
      objc_debug_taggedpointer_payload_lshift = 0;
      objc_debug_taggedpointer_payload_rshift = 0;
      objc_debug_taggedpointer_ext_masuint64_t k = 0LL;
      objc_debug_taggedpointer_ext_slot_shift = 0;
      objc_debug_taggedpointer_ext_slot_masuint64_t k = 0LL;
      objc_debug_taggedpointer_ext_payload_lshift = 0;
      objc_debug_taggedpointer_ext_payload_rshift = 0;
    }

    if (DisableTaggedPointerObfuscation || !dyld_program_sdk_at_least())
    {
      objc_debug_taggedpointer_obfuscator = 0LL;
    }

    else
    {
      arc4random_buf(&objc_debug_taggedpointer_obfuscator, 8uLL);
      objc_debug_taggedpointer_obfuscator &= 0x3FFFFFFFFFFFFFF8uLL;
      for (uint64_t k = 6u; k != -1; --k)
      {
        uint32_t v92 = arc4random_uniform(k + 1);
        unsigned __int8 v93 = objc_debug_tag60_permutations[k];
        objc_debug_tag60_permutations[k] = objc_debug_tag60_permutations[v92];
        objc_debug_tag60_permutations[v92] = v93;
      }
    }

    if (preoptimized) {
      int v94 = v16;
    }
    else {
      int v94 = v237;
    }
    *(_OWORD *)v241 = NXStrValueMapPrototype;
    __int128 v242 = *(_OWORD *)&off_18961D8C8;
    gdb_objc_realized_classes = (uint64_t)NXCreateMapTable(v241, 4 * v94 / 3);
  }

  uint64_t v95 = v232;
  unint64_t v96 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v97 = *(_DWORD *)(v96 + 24);
  unint64_t v98 = (header_info **)v235;
  while (!__ldaxr((unsigned int *)&selLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_177:
  uint64_t v227 = v95;
  v238 = &v98[5 * v95];
  do
  {
    int v100 = *v98;
    if (((_BYTE)v98[4] & 1) == 0 || (preoptimized & 1) == 0)
    {
      int v101 = *(_DWORD *)((char *)v100 + *(void *)v100 + 12);
      uint64_t v102 = header_info::selrefs(v100, &v243);
      unint64_t v103 = v243;
      _read_images::UnfixedSelectors += v243;
      if (v243)
      {
        uint64_t v104 = (char **)v102;
        do
        {
          int v105 = (char *)__sel_registerName(*v104, 0, v101 == 8);
          if (*v104 != v105) {
            uint64_t *v104 = v105;
          }
          ++v104;
          --v103;
        }

        while (v103);
      }
    }

    v98 += 5;
  }

  while (v98 != v238);
  int v106 = *(_DWORD *)(v96 + 24);
  while (1)
  {
    unsigned int v107 = __ldxr((unsigned int *)&selLock);
    if (v107 != v106) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_191:
  LODWORD(v237) = dyld_shared_cache_some_image_overridden();
  unint64_t v239 = 0LL;
  uint64_t v108 = 0LL;
  unint64_t v109 = (header_info **)v235;
  do
  {
    uint64_t v110 = *v109;
    int v111 = *((_DWORD *)v109 + 8);
    if ((v111 & 1) == 0 || preoptimized != 1) {
      goto LABEL_201;
    }
    char v112 = v237;
    if ((*((_BYTE *)opt + 4) & 2) == 0) {
      char v112 = 1;
    }
    unint64_t v113 = "the image may contain classes with missing weak superclasses";
    if ((v112 & 1) != 0
      || future_named_class_map
      && (unint64_t v113 = "there are unresolved future classes pending", *(_DWORD *)(future_named_class_map + 8)))
    {
      if (PrintPreopt)
      {
        unint64_t v114 = (const char *)dyld_image_path_containing_address();
        _objc_inform("PREOPTIMIZATION: reading classes manually from %s because %s", v114, v113);
      }

LABEL_201:
      uint64_t v115 = header_info::classlist(v110, &v243);
      unint64_t v116 = v243;
      if (v243)
      {
        uint64_t v117 = v115;
        unint64_t v118 = 0LL;
        int v119 = *(_DWORD *)((char *)v110 + *(void *)v110 + 12);
        char v120 = v111 & 1 & preoptimized;
        do
        {
          uint64_t v121 = *(objc_class **)(v117 + 8 * v118);
          uint64_t Class = readClass(v121, v119 == 8, v120);
          uint64_t v123 = Class;
          if ((objc_class *)Class != v121 && Class != 0)
          {
            unint64_t v239 = (unint64_t)realloc((void *)v239, 8 * (v108 + 1));
            *(void *)(v239 + 8 * v108) = v123;
            unint64_t v116 = v243;
            ++v108;
          }

          ++v118;
        }

        while (v118 < v116);
      }
    }

    v109 += 5;
  }

  while (v109 != v238);
  if (byte_18C43F048)
  {
    unint64_t v125 = (header_info **)v235;
    do
    {
      unint64_t v127 = (unint64_t *)_dyld_lookup_section_info();
      uint64_t v128 = v232 + ~(-858993459 * ((unint64_t)((char *)v125 - v235) >> 3));
      if (v127) {
        BOOL v129 = v126 >= 8;
      }
      else {
        BOOL v129 = 0;
      }
      if (v129)
      {
        unint64_t v130 = v126 >> 3;
        do
        {
          unint64_t v131 = remapClass(*v127);
          if (*v127 != v131)
          {
            (*(void (**)(uint64_t, uint64_t))(v240 + 16))(v240, v128);
            *unint64_t v127 = v131;
          }

          ++v127;
          --v130;
        }

        while (v130);
      }

      unint64_t v133 = (unint64_t *)_dyld_lookup_section_info();
      if (v133) {
        unint64_t v134 = v132 >> 3;
      }
      else {
        unint64_t v134 = 0LL;
      }
      if (v134)
      {
        unint64_t v135 = v134;
        do
        {
          unint64_t v136 = remapClass(*v133);
          if (*v133 != v136)
          {
            (*(void (**)(uint64_t, uint64_t))(v240 + 16))(v240, v128);
            *unint64_t v133 = v136;
          }

          ++v133;
          --v135;
        }

        while (v135);
      }

      v125 += 5;
    }

    while (v125 != v238);
    unint64_t v243 = v134;
  }

  *(void *)&__int128 v233 = *(void *)algn_18C43FCB8;
  unint64_t v234 = dataSegmentsRanges;
  uint64_t v137 = (header_info **)v235;
  while (2)
  {
    unint64_t v138 = protocols();
    if (((_BYTE)v137[4] & 1) != 0)
    {
      int v139 = preoptimized;
      if (PrintProtocols)
      {
        unint64_t v165 = (const char *)dyld_image_path_containing_address();
        _objc_inform("PROTOCOLS: Skipping reading protocols in image: %s", v165);
      }
    }

    else
    {
      int v139 = 0;
LABEL_235:
      int v140 = *(_DWORD *)((char *)*v137 + *(void *)*v137 + 12);
      uint64_t v141 = header_info::protocollist(*v137, &v243);
      unint64_t v142 = v243;
      if (v243)
      {
        uint64_t v143 = v141;
        unsigned int v236 = v232 + ~(-858993459 * ((unint64_t)((char *)v137 - v235) >> 3));
        unsigned int v144 = NXMapInsert;
        if (v140 == 8) {
          unsigned int v144 = NXMapKeyCopyingInsert;
        }
        unint64_t v237 = (unint64_t)v144;
        do
        {
          unsigned int v145 = *(unint64_t **)v143;
          uint64_t Protocol = (char **)getProtocol(*(const char **)(*(void *)v143 + 8LL));
          int v147 = Protocol;
          if (Protocol)
          {
            if (Protocol != (char **)v145)
            {
              if (PrintProtocols)
              {
                unint64_t v148 = (const char *)protocol_t::demangledName(Protocol);
                _objc_inform("PROTOCOLS: protocol at %p is %s  (duplicate of %p)", v145, v148, v147);
              }

              if (v139)
              {
                int v149 = canonical_protocol ? 0 : 0x20000000;
                if ((v149 & *((_DWORD *)v147 + 17)) == 0 && !DisablePreopt && (preoptimized & 1) != 0)
                {
                  unint64_t v244 = 0LL;
                  size[0] = MEMORY[0x1895F87A8];
                  size[1] = 3321888768LL;
                  v246 = __getSharedCachePreoptimizedProtocol_block_invoke;
                  v247 = (unint64_t *)&__block_descriptor_40_e8_32c47_ZTSKZ34getSharedCachePreoptimizedProtocolE3__0_e16_v28__0_v8B16_B20l;
                  v248 = &v244;
                  _dyld_for_each_objc_protocol();
                  if (v244)
                  {
                    int v150 = *(_DWORD *)(v244 + 68);
                    int v151 = canonical_protocol ? 0 : 0x20000000;
                    if ((v151 & v150) != 0)
                    {
                      if (canonical_protocol) {
                        int v152 = -1;
                      }
                      else {
                        int v152 = -536870913;
                      }
                      *(_DWORD *)(v244 + 68) = v152 & v150;
                    }
                  }
                }
              }
            }
          }

          else if (v139)
          {
            uint64_t PreoptimizedProtocol = getPreoptimizedProtocol();
            v154 = (char **)PreoptimizedProtocol;
            if (PreoptimizedProtocol) {
              BOOL v155 = PreoptimizedProtocol == (void)v145;
            }
            else {
              BOOL v155 = 1;
            }
            char v156 = v155;
            if (v155) {
              uint64_t v157 = v145;
            }
            else {
              uint64_t v157 = (unint64_t *)PreoptimizedProtocol;
            }
            ((void (*)(unint64_t, unint64_t, unint64_t *))v237)(v138, v157[1], v157);
            if (PrintProtocols)
            {
              v158 = (const char *)protocol_t::demangledName((char **)v157);
              _objc_inform("PROTOCOLS: protocol at %p is %s", v157, v158);
              if ((v156 & 1) == 0)
              {
                unint64_t v159 = (const char *)protocol_t::demangledName(v154);
                _objc_inform("PROTOCOLS: protocol at %p is %s  (duplicate of %p)", v145, v159, v154);
              }
            }
          }

          else
          {
            (*(void (**)(uint64_t, void))(v240 + 16))(v240, v236);
            if (((unint64_t)&OBJC_CLASS___Protocol & 0xFFFFFFF000000007LL) != 0) {
              _objc_fatal( "Invalid class pointer %p has bits set outside of ISA_MASK",  v160,  v161,  v162,  &OBJC_CLASS___Protocol);
            }
            *unsigned int v145 = (unint64_t)&OBJC_CLASS___Protocol & 0xFFFFFFFF8LL;
            if (v234 <= (unint64_t)v145
              && (unint64_t)v233 > (unint64_t)v145
              && (preoptimized & 1) == 0)
            {
              if (fixed_up_protocol) {
                int v163 = -1073741824;
              }
              else {
                int v163 = 0x40000000;
              }
              if ((*((_DWORD *)v145 + 17) & 0xC0000000) != v163) {
                fixupProtocol((protocol_t *)v145);
              }
              protocol_t::demangledName((char **)v145);
            }

            ((void (*)(unint64_t, unint64_t, unint64_t *))v237)(v138, v145[1], v145);
            if (PrintProtocols)
            {
              v164 = (const char *)protocol_t::demangledName((char **)v145);
              _objc_inform("PROTOCOLS: protocol at %p is %s", v145, v164);
            }
          }

          v143 += 8LL;
          --v142;
        }

        while (v142);
      }
    }

    v137 += 5;
    if (v137 != v238) {
      continue;
    }
    break;
  }

  unint64_t v166 = v243;
  BOOL v167 = (header_info **)v235;
  do
  {
    if ((v231 & 1) != 0 || !preoptimized || (*((_BYTE *)*v167 + *((void *)*v167 + 1) + 12) & 8) == 0)
    {
      uint64_t v169 = _dyld_lookup_section_info();
      unint64_t v166 = v169 ? v168 >> 3 : 0LL;
      if (v166)
      {
        uint64_t v170 = 0LL;
        uint64_t v171 = v232 + ~(-858993459 * ((unint64_t)((char *)v167 - v235) >> 3));
        do
        {
          uint64_t v172 = *(void *)(v169 + 8 * v170);
          if (canonical_protocol) {
            int v173 = 0;
          }
          else {
            int v173 = 0x20000000;
          }
          if ((v173 & *(_DWORD *)(v172 + 68)) == 0)
          {
            uint64_t v174 = getProtocol(*(const char **)(v172 + 8));
            if (v174) {
              uint64_t v172 = v174;
            }
            if (*(void *)(v169 + 8 * v170) != v172)
            {
              (*(void (**)(uint64_t, uint64_t))(v240 + 16))(v240, v171);
              *(void *)(v169 + 8 * v170) = v172;
              ++UnfixedProtocolReferences;
            }
          }

          ++v170;
        }

        while (v166 != v170);
      }
    }

    v167 += 5;
  }

  while (v167 != v238);
  unint64_t v243 = v166;
  if (didInitialAttachCategories == 1)
  {
    uint64_t v175 = 40 * v227;
    v176 = (header_info **)v235;
    do
    {
      if ((*((_BYTE *)*v176 + *((void *)*v176 + 1) + 12) & 1) != 0) {
        load_categories_nolock(*v176);
      }
      v176 += 5;
      v175 -= 40LL;
    }

    while (v175);
    uint64_t v177 = 40 * v227;
    v178 = (header_info **)v235;
    do
    {
      if ((*((_BYTE *)*v178 + *((void *)*v178 + 1) + 12) & 1) == 0) {
        load_categories_nolock(*v178);
      }
      v178 += 5;
      v177 -= 40LL;
    }

    while (v177);
  }

  v179 = (header_info **)v235;
  do
  {
    uint64_t v180 = header_info::nlclslist(*v179, &v243);
    unint64_t v181 = v243;
    if (v243)
    {
      v182 = (unint64_t *)v180;
      do
      {
        unint64_t v183 = remapClass(*v182);
        v184 = (objc_class *)v183;
        if (v183)
        {
          addClassTableEntry(v183, 1);
          Class isa = v184[4].isa;
          if ((isa & 2) != 0)
          {
            v186 = (void *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
            if (((unint64_t)isa & 0x8000000000000000LL) != 0)
            {
              uint64_t v187 = *(void *)(((unint64_t)isa & 0xF00007FFFFFFFF8LL) + 8);
              v186 = (void *)(v187 & 0xFFFFFFFFFFFFFFFELL);
              if ((v187 & 1) != 0) {
                v186 = (void *)*v186;
              }
            }

            if ((*(_BYTE *)v186 & 0x40) != 0 && v186[9])
            {
              unint64_t v215 = objc_class::nameForLogging(v184);
              _objc_fatal( "Swift class %s with a metadata initializer is not allowed to be non-lazy",  v216,  v217,  v218,  v215);
            }
          }

          realizeClassWithoutSwift(v184, 0LL);
        }

        ++v182;
        --v181;
      }

      while (v181);
    }

    v179 += 5;
  }

  while (v179 != v238);
  if (v239)
  {
    if (v108)
    {
      v188 = (objc_class **)v239;
      do
      {
        v189 = *v188;
        realizeClassWithoutSwift(*v188, 0LL);
        objc_class::setInstancesRequireRawIsaRecursively(v189, 0);
        ++v188;
        --v108;
      }

      while (v108);
    }

    free((void *)v239);
  }

  if (DebugNonFragileIvars) {
    realizeAllClasses();
  }
  if (PrintPreopt)
  {
    v190 = v235;
    do
    {
      v191 = *(void **)v190;
      v192 = v190;
      int v193 = *((_DWORD *)v190 + 8);
      if ((v193 & 1) != 0 && (v194 = "PREOPTIMIZATION: honoring preoptimized selectors in %s", (preoptimized & 1) != 0)
        || (v194 = "PREOPTIMIZATION: IGNORING preoptimized selectors in %s", (*((_BYTE *)v191 + v191[1] + 12) & 8) != 0))
      {
        uint64_t v195 = dyld_image_path_containing_address();
        _objc_inform(v194, v195);
      }

      uint64_t v196 = header_info::classlist((header_info *)v191, &v243);
      unint64_t v197 = v243;
      if (v243)
      {
        v198 = (unint64_t *)v196;
        do
        {
          unint64_t v199 = remapClass(*v198);
          v203 = (void *)v199;
          if (v199)
          {
            ++_read_images::PreoptTotalClasses;
            if ((v193 & 1) != 0 && preoptimized == 1) {
              ++_read_images::PreoptOptimizedClasses;
            }
            _read_images::$_1::operator()(*(__objc2_class **)(v199 + 32), v200, v201, v202);
            _read_images::$_1::operator()(*(__objc2_class **)((*v203 & 0xFFFFFFFF8LL) + 0x20), v204, v205, v206);
          }

          ++v198;
          --v197;
        }

        while (v197);
      }

      v190 = v192 + 40;
    }

    while (v192 + 40 != (char *)v238);
    _objc_inform("PREOPTIMIZATION: %zu selector references not pre-optimized", _read_images::UnfixedSelectors);
    if (_read_images::PreoptTotalMethodLists) {
      _objc_inform( "PREOPTIMIZATION: %u/%u (%.3g%%) method lists pre-sorted",  _read_images::PreoptOptimizedMethodLists,  _read_images::PreoptTotalMethodLists,  (double)_read_images::PreoptOptimizedMethodLists * 100.0 / (double)_read_images::PreoptTotalMethodLists);
    }
    else {
      _objc_inform( "PREOPTIMIZATION: %u/%u (%.3g%%) method lists pre-sorted",  _read_images::PreoptOptimizedMethodLists,  0,  0.0);
    }
    if (_read_images::PreoptTotalClasses) {
      _objc_inform( "PREOPTIMIZATION: %u/%u (%.3g%%) classes pre-registered",  _read_images::PreoptOptimizedClasses,  _read_images::PreoptTotalClasses,  (double)_read_images::PreoptOptimizedClasses * 100.0 / (double)_read_images::PreoptTotalClasses);
    }
    else {
      _objc_inform( "PREOPTIMIZATION: %u/%u (%.3g%%) classes pre-registered",  _read_images::PreoptOptimizedClasses,  0,  0.0);
    }
    _objc_inform("PREOPTIMIZATION: %zu protocol references not pre-optimized", UnfixedProtocolReferences);
  }

LABEL_360:
  map_images_nolock::firstTime = 1;
  else {
    v207 = &qword_18C43F6A8;
  }
  if (loadImageCallbacks)
  {
    v208 = &v207[2 * loadImageCallbacks];
    v209 = (void *)(v230 + 16);
    do
    {
      int v210 = *((unsigned __int8 *)v207 + 8);
      if ((v210 - 1) >= 2) {
        _objc_fatal( "Corrupt load image callback, unknown kind %u, func %p",  v11,  v12,  v13,  *((unsigned __int8 *)v207 + 8),  *v207);
      }
      if ((_DWORD)v229)
      {
        v211 = (void (*)(uint64_t))*v207;
        v212 = v209;
        v213 = v228;
        do
        {
          uint64_t v214 = *(v212 - 2);
          if (v210 == 1) {
            v211(v214);
          }
          else {
            ((void (*)(uint64_t, void))v211)(v214, *v212);
          }
          v212 += 4;
          v213 = (header_info **)((char *)v213 - 1);
        }

        while (v213);
      }

      v207 += 2;
    }

    while (v207 != v208);
  }

void sub_18003FD30(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t hasSignedClassROPointers(unint64_t a1)
{
  if (dataSegmentsRanges <= a1 && *(void *)algn_18C43FCB8 > a1) {
    return 1LL;
  }
  uint64_t v2 = _dyld_lookup_section_info();
  if (v2) {
    return (*(unsigned __int8 *)(v2 + 4) >> 4) & 1;
  }
  else {
    return 1LL;
  }
}

void _objc_patch_root_of_class(int a1, objc_class *this, const char *a3, Class *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v8, runtimeLock)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (PrintConnecting)
  {
    uint64_t v10 = (const char *)objc_class::nameForLogging(this);
    _objc_inform("CLASS: patching class '%s' (%p) to point to body of %p", v10, this, a4);
  }

  if (((unint64_t)a4 & 0x8000000000000000LL) != 0)
  {
    uint64_t v11 = objc_debug_taggedpointer_classes[a4 & 7];
  }

  else
  {
    uint64_t v11 = (unint64_t)*a4 & 0xFFFFFFFF8LL;
  }

  if ((v11 & 0xFFFFFFF000000007LL) != 0) {
    _objc_fatal("Invalid class pointer %p has bits set outside of ISA_MASK", (uint64_t)this, a3, (char *)a4, v11);
  }
  this->Class isa = (Class)(v11 & 0xFFFFFFFF8LL);
  this[1].Class isa = a4[1];
  this[2].Class isa = (Class)&_objc_empty_cache;
  this[3].Class isa = 0LL;
  hasSignedClassROPointers((unint64_t)a3);
  this[4].Class isa = a4[4];
  int v12 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v13 = __ldxr(runtimeLock);
    if (v13 != v12) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
}

void sub_18003FF84(_Unwind_Exception *exception_object)
{
  int v4 = *(_DWORD *)(v2 + 24);
  while (1)
  {
    unsigned int v5 = __ldxr(v1);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0, v1)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_6:
  _Unwind_Resume(exception_object);
}

int *_objc_atfork_prepare()
{
  ForkIsMultithreaded = pthread_is_threaded_np() != 0;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v0 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
    uint64_t v2 = (unsigned int *)&PropertyLocks[16 * v0];
    unsigned int v3 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v2))
    {
      if (!__stxr(v3, v2)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    ++v0;
  }

  while (v0 != 8);
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    unsigned int v6 = (unsigned int *)&StructLocks[16 * i];
    unsigned int v7 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v6))
    {
      if (!__stxr(v7, v6)) {
        goto LABEL_14;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_14:
    ;
  }

  for (uint64_t j = 0LL; j != 8; ++j)
  {
    uint64_t v10 = (unsigned int *)&CppObjectLocks[16 * j];
    unsigned int v11 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v10))
    {
      if (!__stxr(v11, v10)) {
        goto LABEL_21;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_21:
    ;
  }

  unint64_t v13 = 0LL;
  char v14 = (unsigned int *)&dword_18C43F888;
  do
  {
    unsigned int v15 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(v14))
    {
      if (!__stxr(v15, v14)) {
        goto LABEL_28;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_28:
    unint64_t v17 = v13 + 1;
    uint64_t v18 = (char *)&sDataLists + 64 * v13 + 64;
    if (v13 > 6) {
      uint64_t v18 = 0LL;
    }
    BOOL v19 = (unsigned int *)(v18 + 8);
    if (v13 <= 6) {
      char v14 = v19;
    }
    else {
      char v14 = 0LL;
    }
    ++v13;
  }

  while (v17 != 8);
  unsigned int v20 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&AssociationsManagerLock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_39:
  unint64_t v22 = 0LL;
  do
  {
    unsigned int v24 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)result))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_45:
    unint64_t v26 = v22 + 1;
    if (v22 <= 6) {
    else
    }
      id result = 0LL;
    ++v22;
  }

  while (v26 != 8);
  unsigned int v27 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(classInitLock))
  {
    if (!__stxr(v27, classInitLock)) {
      goto LABEL_54;
    }
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_54:
  unsigned int v29 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(pendingInitializeMapLock))
  {
    if (!__stxr(v29, pendingInitializeMapLock)) {
      goto LABEL_59;
    }
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_59:
  unsigned int v31 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(runtimeLock))
  {
    if (!__stxr(v31, runtimeLock)) {
      goto LABEL_64;
    }
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_64:
  unsigned int v33 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&DemangleCacheLock))
  {
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_69:
  unsigned int v35 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&selLock))
  {
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_74:
  unsigned int v37 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(objcMsgLogLock))
  {
    if (!__stxr(v37, objcMsgLogLock)) {
      goto LABEL_79;
    }
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_79:
  unsigned int v39 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&AltHandlerDebugLock))
  {
  }

  __clrex();
  id result = (int *)os_unfair_lock_lock_with_options();
LABEL_84:
  unsigned int v41 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&crashlog_lock))
  {
  }

  __clrex();
  return (int *)os_unfair_lock_lock_with_options();
}

void _objc_atfork_parent()
{
  uint64_t v0 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
    uint64_t v2 = (os_unfair_lock_s *)&PropertyLocks[16 * v0];
    int v3 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v4 = __ldxr(&v2->_os_unfair_lock_opaque);
      if (v4 != v3) {
        break;
      }
      if (!__stlxr(0, &v2->_os_unfair_lock_opaque)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v2);
LABEL_7:
    ++v0;
  }

  while (v0 != 8);
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    unsigned int v6 = (os_unfair_lock_s *)&StructLocks[16 * i];
    int v7 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v8 = __ldxr(&v6->_os_unfair_lock_opaque);
      if (v8 != v7) {
        break;
      }
      if (!__stlxr(0, &v6->_os_unfair_lock_opaque)) {
        goto LABEL_14;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v6);
LABEL_14:
    ;
  }

  for (uint64_t j = 0LL; j != 8; ++j)
  {
    uint64_t v10 = (os_unfair_lock_s *)&CppObjectLocks[16 * j];
    int v11 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v12 = __ldxr(&v10->_os_unfair_lock_opaque);
      if (v12 != v11) {
        break;
      }
      if (!__stlxr(0, &v10->_os_unfair_lock_opaque)) {
        goto LABEL_21;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v10);
LABEL_21:
    ;
  }

  unint64_t v13 = 0LL;
  char v14 = (os_unfair_lock_s *)&dword_18C43F888;
  do
  {
    int v15 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v16 = __ldxr(&v14->_os_unfair_lock_opaque);
      if (v16 != v15) {
        break;
      }
      if (!__stlxr(0, &v14->_os_unfair_lock_opaque)) {
        goto LABEL_28;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v14);
LABEL_28:
    unint64_t v17 = v13 + 1;
    uint64_t v18 = (os_unfair_lock_s *)((char *)&sDataLists + 64 * v13 + 64);
    if (v13 > 6) {
      uint64_t v18 = 0LL;
    }
    BOOL v19 = v18 + 2;
    if (v13 <= 6) {
      char v14 = v19;
    }
    else {
      char v14 = 0LL;
    }
    ++v13;
  }

  while (v17 != 8);
  int v20 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v21 = __ldxr((unsigned int *)&AssociationsManagerLock);
    if (v21 != v20) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AssociationsManagerLock);
LABEL_39:
  unint64_t v22 = 0LL;
  do
  {
    int v24 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v25 = __ldxr(&v23->_os_unfair_lock_opaque);
      if (v25 != v24) {
        break;
      }
      if (!__stlxr(0, &v23->_os_unfair_lock_opaque)) {
        goto LABEL_45;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v23);
LABEL_45:
    unint64_t v26 = v22 + 1;
    if (v22 <= 6) {
    else
    }
      uint64_t v23 = 0LL;
    ++v22;
  }

  while (v26 != 8);
  int v27 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v28 = __ldxr(classInitLock);
    if (v28 != v27) {
      break;
    }
    if (!__stlxr(0, classInitLock)) {
      goto LABEL_54;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)classInitLock);
LABEL_54:
  int v29 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v30 = __ldxr(pendingInitializeMapLock);
    if (v30 != v29) {
      break;
    }
    if (!__stlxr(0, pendingInitializeMapLock)) {
      goto LABEL_59;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)pendingInitializeMapLock);
LABEL_59:
  int v31 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v32 = __ldxr(runtimeLock);
    if (v32 != v31) {
      break;
    }
    if (!__stlxr(0, runtimeLock)) {
      goto LABEL_64;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
LABEL_64:
  int v33 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v34 = __ldxr((unsigned int *)&DemangleCacheLock);
    if (v34 != v33) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&DemangleCacheLock);
LABEL_69:
  int v35 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v36 = __ldxr((unsigned int *)&selLock);
    if (v36 != v35) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&selLock);
LABEL_74:
  int v37 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v38 = __ldxr(objcMsgLogLock);
    if (v38 != v37) {
      break;
    }
    if (!__stlxr(0, objcMsgLogLock)) {
      goto LABEL_79;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)objcMsgLogLock);
LABEL_79:
  int v39 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v40 = __ldxr((unsigned int *)&AltHandlerDebugLock);
    if (v40 != v39) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&AltHandlerDebugLock);
LABEL_84:
  int v41 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v42 = __ldxr((unsigned int *)&crashlog_lock);
    if (v42 != v41) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&crashlog_lock);
}

objc_class *_objc_atfork_child()
{
  if (ForkIsMultithreaded) {
    BOOL v0 = DisableInitializeForkSafety == 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (v0) {
    MultithreadedForkChild = 1;
  }
  uint64_t v1 = 0LL;
  loadMethodLocuint64_t k = 0LL;
  do
  {
    PropertyLocks[v1] = 0;
    v1 += 16LL;
  }

  while (v1 != 128);
  for (uint64_t i = 0LL; i != 128; i += 16LL)
    StructLocks[i] = 0;
  for (uint64_t j = 0LL; j != 128; j += 16LL)
    CppObjectLocks[j] = 0;
  unint64_t v4 = 0LL;
  unsigned int v5 = &dword_18C43F888;
  unsigned int v6 = (char *)&unk_18C43F8C0;
  do
  {
    *unsigned int v5 = 0;
    unint64_t v7 = v4 + 1;
    if (v4 <= 6) {
      unsigned int v8 = v6;
    }
    else {
      unsigned int v8 = 0LL;
    }
    unsigned int v5 = (int *)(v8 + 8);
    if (v4 > 6) {
      unsigned int v5 = 0LL;
    }
    v6 += 64;
    ++v4;
  }

  while (v7 != 8);
  unint64_t v9 = 0LL;
  AssociationsManagerLocuint64_t k = 0;
  int v11 = (int *)&unk_18C43F4C0;
  do
  {
    unint64_t v12 = v9 + 1;
    *uint64_t v10 = 0;
    if (v9 <= 6) {
      uint64_t v10 = v11;
    }
    else {
      uint64_t v10 = 0LL;
    }
    v11 += 16;
    ++v9;
  }

  while (v12 != 8);
  classInitLock[0] = 0;
  pendingInitializeMapLock[0] = 0;
  runtimeLock[0] = 0;
  DemangleCacheLocuint64_t k = 0;
  selLocuint64_t k = 0;
  objcMsgLogLock[0] = 0;
  AltHandlerDebugLocuint64_t k = 0;
  crashlog_locuint64_t k = 0;
  unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v14 = StatusReg[40];
  if (v14)
  {
    int v15 = *(void **)(v14 + 8);
    if (v15) {
      free(v15);
    }
    *(void *)(v14 + 8) = 0LL;
  }

  uint64_t v16 = 0LL;
  StatusReg[41] = 0LL;
  StatusReg[42] = 0LL;
  do
  {
    unint64_t v17 = (void **)((char *)&sDataLists + 64 * v16);
    uint64_t v18 = *v17;
    if (*v17)
    {
      do
      {
        BOOL v19 = (void *)*v18;
        free(v18);
        uint64_t v18 = v19;
      }

      while (v19);
    }

    *unint64_t v17 = 0LL;
    ++v16;
  }

  while (v16 != 8);
  id result = (objc_class *)_fetchInitializingClassList(0);
  if (result)
  {
    int v24 = result;
    int isa = (int)result->isa;
    if (SLODWORD(result->isa) >= 1)
    {
      uint64_t v26 = 0LL;
      do
      {
        id result = v24[1].isa[v26].isa;
        if (result)
        {
          id result = (objc_class *)WAITING_FOR_A_CLASS__initialize_LOCK(result, v21, v22, v23);
          int isa = (int)v24->isa;
        }

        ++v26;
      }

      while (v26 < isa);
    }
  }

  return result;
}

void _objc_init()
{
  if ((_objc_init::initialized & 1) != 0) {
    return;
  }
  _objc_init::initialized = 1;
  if (MEMORY[0x1895FC240] && getpid() == 1) {
    objc_bp_assist_cfg_np();
  }
  classInitLock[0] = 0;
  pendingInitializeMapLock[0] = 0;
  selLocuint64_t k = 0;
  loadMethodLocuint64_t k = 0LL;
  crashlog_locuint64_t k = 0;
  objcMsgLogLock[0] = 0;
  AltHandlerDebugLocuint64_t k = 0;
  AssociationsManagerLocuint64_t k = 0;
  runtimeLock[0] = 0;
  DemangleCacheLocuint64_t k = 0;
  BOOL v0 = &OBJC_CLASS___Object;
  if (!issetugid())
  {
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      DisableAutoreleaseCoalescingLRU = 1;
    }
    if ((_os_feature_enabled_simple_impl() & 1) == 0) {
      DisableClassRXSigningEnforcement = 1;
    }
    if ((_os_feature_enabled_simple_impl() & 1) == 0) {
      DisableClassROFaults = 1;
    }
    uint64_t v16 = *_NSGetEnviron();
    if (v16)
    {
      unint64_t v17 = *v16;
      if (*v16)
      {
        int v18 = 0;
        int v19 = 0;
        char v20 = 0;
        do
        {
          if (!strncmp(v17, "Malloc", 6uLL)
            || !strncmp(v17, "DYLD", 4uLL)
            || !strncmp(v17, "NSZombiesEnabled", 0x10uLL))
          {
            char v20 = 1;
          }

          if (!strncmp(v17, "OBJC_", 5uLL))
          {
            if (!strncmp(v17, "OBJC_HELP=", 0xAuLL))
            {
              int v18 = 1;
            }

            else if (!strncmp(v17, "OBJC_PRINT_OPTIONS=", 0x13uLL))
            {
              int v19 = 1;
            }

            else if (!strncmp(v17, "OBJC_DEBUG_POOL_DEPTH=", 0x16uLL))
            {
              uint64_t v26 = strtol(v17 + 22, 0LL, 10);
            }

            else
            {
              uint64_t v22 = strchr(v17, 61);
              if (*v22)
              {
                unint64_t v23 = 0LL;
                int v24 = v22 + 1;
                unsigned int v25 = (size_t *)&qword_18961DC80;
                while (v23 >= 0x30 && !os_variant_allows_internal_security_policies()
                     || v24 - *v16 != *v25 + 1
                     || strncmp(*v16, (const char *)*(v25 - 2), *v25))
                {
                  ++v23;
                  v25 += 5;
                  if (v23 == 51) {
                    goto LABEL_44;
                  }
                }

                int v27 = (_DWORD **)((char *)&Settings + 40 * v23);
                if (!strcasecmp(v24, "fatal") || !strcasecmp(v24, "halt")) {
                  **int v27 = 2;
                }
                else {
                  **int v27 = !strcasecmp(v24, "yes")
                }
                       || !strcasecmp(v24, "warn")
                       || !strcasecmp(v24, "true")
                       || !strcasecmp(v24, "on")
                       || !strcasecmp(v24, "y")
                       || !strcmp(v24, "1");
              }
            }
          }

LABEL_44:
          uint64_t v21 = v16[1];
          ++v16;
          unint64_t v17 = v21;
        }

        while (v21);
        if ((v20 & 1) != 0)
        {
          unsigned int v28 = getenv("DYLD_INSERT_LIBRARIES");
          int v29 = getenv("NSZombiesEnabled");
          unsigned int v30 = getenv("OBJC_DEBUG_POOL_ALLOCATION");
          if (getenv("MallocStackLogging")
            || getenv("MallocStackLoggingNoCompact")
            || v29 && (*v29 | 0x20) == 0x79)
          {
            BOOL v0 = &OBJC_CLASS___Object;
            if (v30) {
              goto LABEL_82;
            }
            goto LABEL_79;
          }

          BOOL v0 = &OBJC_CLASS___Object;
          if (v28)
          {
            unsigned int v34 = strstr(v28, "libgmalloc");
            if (!v30)
            {
              if (v34) {
LABEL_79:
              }
                DebugPoolAllocation = 1;
            }
          }
        }

        else
        {
          BOOL v0 = &OBJC_CLASS___Object;
        }
      }

      else
      {
        int v18 = 0;
        int v19 = 0;
      }

LABEL_6:
  pthread_key_init_np();
  for (uint64_t i = 0LL; i != 512; i += 64LL)
  {
    uint64_t v2 = (char *)&sDataLists + i;
    *(void *)uint64_t v2 = 0LL;
    *((_DWORD *)v2 + 2) = 0;
  }

  for (uint64_t j = 0LL; j != 128; j += 16LL)
    PropertyLocks[j] = 0;
  for (uint64_t k = 0LL; k != 128; k += 16LL)
    StructLocks[k] = 0;
  for (uint64_t m = 0LL; m != 128; m += 16LL)
    CppObjectLocks[m] = 0;
  do
  {
    *unsigned int v6 = 0;
    *((void *)v6 + _class_addProperty(cls, name, attributes, attributeCount, 1) = 0LL;
    *((void *)v6 + 2) = 0LL;
    v6[6] = 0;
    *((_OWORD *)v6 + 2) = 0uLL;
    *((_OWORD *)v6 + 3) = 0uLL;
    v6 += 16;
  }

  while (v6 != (int *)&unk_18C43F680);
  static_init();
  uint64_t v7 = 0LL;
  uint64_t v8 = -1LL;
  uint64_t v9 = -1LL;
  while (1)
  {
    uint64_t objc_selector = _dyld_get_objc_selector();
    if (!objc_selector) {
      break;
    }
    v9 &= ~objc_selector;
    v8 &= objc_selector;
    v7 += 8LL;
    if (v7 == 120) {
      goto LABEL_21;
    }
  }

  uint64_t v9 = 0LL;
  uint64_t v8 = 0LL;
LABEL_21:
  objc::InterestingSelectorOnes = v8;
  objc::InterestingSelectorZeroes = v9;
  objc::disableEnforceClassRXPtrAuth = LODWORD(v0[9].isa);
  dword_18C43F848 = 64;
  int v11 = (char *)malloc(0x600uLL);
  uint64_t v12 = 0LL;
  objc::unattachedCategories = (uint64_t)v11;
  qword_18C43F840 = 0LL;
  do
  {
    *(void *)&v11[v12] = -1LL;
    v12 += 24LL;
  }

  while (v12 != 1536);
  objc::allocatedClasses = 0LL;
  qword_18C43F418 = 0LL;
  qword_18C43F420 = 0LL;
  old_terminate = (uint64_t (*)(void))std::set_terminate((std::terminate_handler)_objc_terminate);
  unsigned int v13 = -1;
  do
    ++v13;
  while (objc_restartableRanges[2 * v13]);
  uint64_t v14 = task_restartable_ranges_register();
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    if ((_DWORD)v14 != 6)
    {
      int v35 = mach_error_string(v14);
      _objc_fatal("task_restartable_ranges_register failed (result 0x%x: %s)", v36, v37, v38, v15, v35);
    }

    shouldUseRestartableRanges = 1;
  }

  _dyld_objc_register_callbacks();
  didCallDyldNotifyRegister = 1;
}

  ;
}

  uint64_t v10 = weak_entry_for_referent(a1, v4, (const char *)a3, a4);
  if (v10)
  {
    append_referrer(v10, v6, v11, v12);
  }

  else
  {
    v21[0] = -(uint64_t)v4;
    v21[1] = -(uint64_t)v6;
    memset(&v21[2], 0, 24);
    unsigned int v13 = a1[2];
    if (v13) {
      uint64_t v14 = v13 + 1;
    }
    else {
      uint64_t v14 = 0LL;
    }
    if ((unint64_t)a1[1] >= (unint64_t)(3LL * (void)v14) >> 2)
    {
      if (v14) {
        uint64_t v15 = 2LL * (void)v14;
      }
      else {
        uint64_t v15 = 64LL;
      }
      weak_resize(a1, v15);
    }

    weak_entry_insert(a1, (uint64_t)v21, v11, v12);
  }

  return v4;
}

void *_headerForClass(unint64_t a1)
{
  uint64_t v1 = (void *)FirstHeader;
  if (FirstHeader)
  {
LABEL_2:
    uint64_t v3 = 0LL;
    while (1)
    {
      unint64_t v4 = getsegmentdata((const mach_header_64 *)((char *)v1 + *v1), off_18961E518[v3], &size);
      if (v4)
      {
      }

      if (++v3 == 4)
      {
        uint64_t PreoptimizedHeaderRW = getPreoptimizedHeaderRW((uint64_t)v1);
        uint64_t v7 = v1 + 3;
        if (PreoptimizedHeaderRW) {
          uint64_t v7 = (void *)PreoptimizedHeaderRW;
        }
        uint64_t v1 = (void *)(*v7 & 0xFFFFFFFFFFFFFFFCLL);
        if (v1) {
          goto LABEL_2;
        }
        return v1;
      }
    }
  }

  return v1;
}

IMP imp_implementationWithBlock(id block)
{
  unint64_t v4 = _Block_copy(block);
  if (!Trampolines[0])
  {
    unsigned int v5 = dlopen("/usr/lib/libobjc-trampolines.dylib", 262);
    if (!v5)
    {
      unsigned int v32 = dlerror();
      _objc_fatal("couldn't dlopen libobjc-trampolines.dylib: %s", v33, v34, v35, v32);
    }

    unsigned int v6 = v5;
    uint64_t v7 = malloc(0x20uLL);
    TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress::TrampolineAddress( (TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress *)v7,  v6,  "Impl");
    TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress::TrampolineAddress( (TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress *)(v7 + 1),  v6,  "Start");
    uint64_t v8 = (const mach_header_64 *)dyld_image_header_containing_address();
    unint64_t size = 0LL;
    uint64_t v9 = getsegmentdata(v8, "__TEXT", &size);
    unint64_t v10 = size;
    v7[2] = v9;
    v7[3] = v10;
    while (!__ldxr(Trampolines))
    {
    }

    __clrex();
    free(v7);
  }

void sub_18004150C(_Unwind_Exception *a1)
{
}

TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress *TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress::TrampolineAddress( TrampolinePointerWrapper::TrampolinePointers::TrampolineAddress *this, void *a2, const char *__s)
{
  v12[1] = *MEMORY[0x1895F89C0];
  strlen(__s);
  unsigned int v6 = (char *)v12 - ((MEMORY[0x1895F8858]() + 37) & 0xFFFFFFFFFFFFFFF0LL);
  strcpy(v6, "_objc_blockTrampoline");
  strcat(v6, __s);
  uint64_t v7 = dlsym(a2, v6);
  *(void *)this = v7;
  if (!v7) {
    _objc_fatal("couldn't dlsym %s", v8, v9, v10, v6);
  }
  return this;
}

id imp_getBlock(IMP anImp)
{
  uint64_t v1 = (void (*)(void))anImp;
  if (anImp)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v3 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v3, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    unsigned int v5 = pageAndIndexContainingIMP(v1, &v9);
    if (v5)
    {
      else {
        uint64_t v1 = (void (*)(void))v5[v9];
      }
    }

    else
    {
      uint64_t v1 = 0LL;
    }

    int v6 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v7 = __ldxr(runtimeLock);
      if (v7 != v6) {
        break;
      }
      if (!__stlxr(0, runtimeLock)) {
        return v1;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
  }

  return v1;
}

uint64_t *pageAndIndexContainingIMP(void (*a1)(void), unint64_t *a2)
{
  id result = &HeadPageGroup;
  while (1)
  {
    id result = (uint64_t *)*result;
    if (!result) {
      break;
    }
    unint64_t v4 = (char *)a1 - (char *)(result + 4096);
    if (v4 >= 8
      && result + 6144 > (uint64_t *)a1
      && (char *)result + ((*(void *)(Trampolines + 8) - *(void *)Trampolines) & 0xFFFFFFFFFFFFFFF8LL) + 0x8000 <= (char *)a1)
    {
      if (a2) {
        *a2 = v4 >> 3;
      }
      return result;
    }
  }

  return result;
}

BOOL imp_removeBlock(IMP anImp)
{
  if (anImp)
  {
    uint64_t v2 = (void (*)(void))anImp;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(runtimeLock))
    {
      if (!__stxr(v4, runtimeLock)) {
        goto LABEL_7;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    int v6 = pageAndIndexContainingIMP(v2, &v14);
    unsigned int v7 = v6;
    if (v6)
    {
      uint64_t v1 = (const void *)v6[v14];
      v6[v14] = v6[2];
      v6[2] = v14;
      uint64_t v8 = HeadPageGroup;
      do
      {
        uint64_t v9 = v8;
        uint64_t v8 = *(void *)(v8 + 8);
        if (v8) {
          BOOL v10 = v8 == (void)v6;
        }
        else {
          BOOL v10 = 1;
        }
      }

      while (!v10);
      if (!v8)
      {
        *(void *)(v9 + 8) = v6;
        v6[1] = 0LL;
      }
    }

    int v11 = *(_DWORD *)(StatusReg + 24);
    do
    {
      unsigned int v12 = __ldxr(runtimeLock);
      if (v12 != v11)
      {
        __clrex();
        os_unfair_lock_unlock((os_unfair_lock_t)runtimeLock);
        if (v7) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
    }

    while (__stlxr(0, runtimeLock));
    if (v6)
    {
LABEL_20:
      _Block_release(v1);
      LOBYTE(anImp) = 1;
      return (char)anImp;
    }

void grow_refs_and_insert(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[3];
  if (v4) {
    unint64_t v5 = v4 + 1;
  }
  else {
    unint64_t v5 = 0LL;
  }
  if (v5) {
    size_t v6 = 2 * v5;
  }
  else {
    size_t v6 = 8LL;
  }
  unsigned int v7 = (void *)a1[1];
  unint64_t v8 = a1[2];
  a1[3] = v6 - 1;
  uint64_t v9 = calloc(v6, 8uLL);
  uint64_t v10 = a1[2] & 3LL;
  a1[1] = v9;
  a1[2] = v10;
  a1[4] = 0LL;
  if (v5) {
    BOOL v11 = v8 >= 4;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = v8 >> 2;
    do
    {
      uint64_t v14 = v7[v12];
      if (v14)
      {
        append_referrer(a1, -v14);
        --v13;
      }

      ++v12;
    }

    while (v12 < v5 && v13);
    append_referrer(a1, a2);
    goto LABEL_19;
  }

  append_referrer(a1, a2);
  if (v7) {
LABEL_19:
  }
    free(v7);
}

void append_referrer(void *a1, unint64_t a2, const char *a3, char *a4)
{
  if ((a1[2] & 3LL) == 2)
  {
    uint64_t v6 = a1[3];
    unint64_t v7 = a1[2] >> 2;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a1 + 1;
    do
    {
      if (!v9[v8])
      {
        v9[v8] = -(uint64_t)a2;
        return;
      }

      ++v8;
    }

    while (v8 != 4);
    uint64_t v10 = (char *)calloc(4uLL, 8uLL);
    for (uint64_t i = 0LL; i != 4; ++i)
      *(void *)&v10[i * 8] = v9[i];
    a1[1] = v10;
    *((_OWORD *)a1 + _class_addProperty(cls, name, attributes, attributeCount, 1) = xmmword_180050860;
    a1[4] = 0LL;
    unint64_t v7 = 4LL;
    uint64_t v6 = 3LL;
  }

  if (v7 >= (unint64_t)(3 * v6 + 3) >> 2)
  {
    grow_refs_and_insert(a1, a2);
  }

  else
  {
    unint64_t v12 = 0LL;
    uint64_t v13 = (bswap64(0x8A970BE7488FDA55LL * (a2 ^ (a2 >> 4))) ^ (1217387093
                                                                           * (a2 ^ (a2 >> 4)))) & v6;
    uint64_t v14 = a1[1];
    uint64_t v15 = v13;
    while (*(void *)(v14 + 8 * v15))
    {
      ++v12;
      uint64_t v15 = (v15 + 1) & v6;
      if (v15 == v13) {
        _objc_fatal("bad weak table at %p. This may be a runtime bug or a memory error somewhere else.", a2, a3, a4, a1);
      }
    }

    if (v12 > a1[4]) {
      a1[4] = v12;
    }
    *(void *)(v14 + 8 * v15) = -(uint64_t)a2;
    a1[2] += 4LL;
  }

void weak_unregister_no_lock(void *a1, unint64_t a2, const char *a3, char *a4)
{
  if (a2)
  {
    uint64_t v6 = weak_entry_for_referent(a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v10 = (uint64_t)v6;
      if ((v6[2] & 3LL) == 2)
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = v6[3];
        uint64_t v13 = (bswap64(0x8A970BE7488FDA55LL * ((unint64_t)a3 ^ ((unint64_t)a3 >> 4))) ^ (1217387093 * (a3 ^ ((unint64_t)a3 >> 4)))) & v12;
        uint64_t v14 = v6[1];
        uint64_t v15 = v13;
        while (&a3[*(void *)(v14 + 8 * v15)])
        {
          uint64_t v15 = (v15 + 1) & v12;
          if (v15 == v13) {
            _objc_fatal( "bad weak table at %p. This may be a runtime bug or a memory error somewhere else.",  v7,  v8,  v9,  v6);
          }
        }

        *(void *)(v14 + 8 * v15) = 0LL;
        unint64_t v20 = v6[2] - 4LL;
        v6[2] = v20;
      }

      else
      {
        uint64_t v16 = 0LL;
        vm_address_t v17 = v6 + 1;
        do
        {
          if (!&a3[v17[v16]])
          {
            v17[v16] = 0LL;
            goto LABEL_21;
          }

          ++v16;
        }

        while (v16 != 4);
LABEL_12:
        if (DebugWeakErrors)
        {
          if (DebugWeakErrors == 2) {
            vm_size_t v18 = "";
          }
          else {
            vm_size_t v18 = " Break on objc_weak_error to debug.";
          }
          int v19 = (uint64_t (*)(const char *, ...))_objc_inform;
          if (DebugWeakErrors == 2) {
            int v19 = (uint64_t (*)(const char *, ...))_objc_fatal;
          }
          uint64_t v6 = (void *)v19( "Attempted to unregister unknown __weak variable at %p. This is probably incorrect use of objc _storeWeak() and objc_loadWeak().%s",  a3,  v18);
        }

        gdb_objc_class_changed(v6);
LABEL_21:
        unint64_t v20 = *(void *)(v10 + 16);
      }

      if (v20 < 4 || (v20 & 3) != 2)
      {
        uint64_t v22 = 8LL;
        while (!*(void *)(v10 + v22))
        {
          v22 += 8LL;
          if (v22 == 40)
          {
            weak_entry_remove((uint64_t)a1, v10);
            return;
          }
        }
      }
    }
  }

void *weak_entry_for_referent(void *a1, unint64_t a2, const char *a3, char *a4)
{
  if (!*a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = a1[2];
  uint64_t v6 = (bswap64(0x8A970BE7488FDA55LL * (a2 ^ (a2 >> 4))) ^ (1217387093
                                                                        * (a2 ^ (a2 >> 4)))) & v5;
  uint64_t v7 = v6;
  while (1)
  {
    uint64_t v8 = (void *)(*a1 + 40 * v7);
    if (!(*v8 + a2)) {
      break;
    }
    uint64_t v7 = (v7 + 1) & v5;
    if (v7 == v6) {
      _objc_fatal("bad weak table at %p. This may be a runtime bug or a memory error somewhere else.", a2, a3, a4, *a1);
    }
  }

  return v8;
}

void weak_entry_remove(uint64_t a1, uint64_t a2)
{
  if ((*(void *)(a2 + 16) & 3LL) == 2) {
    free(*(void **)(a2 + 8));
  }
  *(void *)(a2 + 32) = 0LL;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 8) - 1LL;
  *(void *)(a1 + 8) = v5;
  if (v4) {
    unint64_t v6 = v4 + 1;
  }
  else {
    unint64_t v6 = 0LL;
  }
  if (v6 >= 0x400 && v6 >> 4 >= v5) {
    weak_resize((char **)a1, v6 >> 3);
  }
}

void weak_resize(char **a1, size_t __count)
{
  uint64_t v4 = a1[2];
  unint64_t v5 = *a1;
  unint64_t v6 = (char *)calloc(__count, 0x28uLL);
  a1[2] = (char *)(__count - 1);
  a1[3] = 0LL;
  *a1 = v6;
  a1[1] = 0LL;
  if (v5)
  {
    if (v4) {
      uint64_t v9 = (uint64_t)(v4 + 1);
    }
    else {
      uint64_t v9 = 0LL;
    }
    if (v9 >= 1)
    {
      uint64_t v10 = &v5[40 * v9];
      uint64_t v11 = v5;
      do
      {
        if (*(void *)v11) {
          weak_entry_insert(a1, (uint64_t)v11, v7, v8);
        }
        v11 += 40;
      }

      while (v11 < v10);
    }

    free(v5);
  }

void *weak_entry_insert(void *result, uint64_t a2, const char *a3, char *a4)
{
  unint64_t v4 = 0x8A970BE7488FDA55LL * (-*(void *)a2 ^ (-*(void *)a2 >> 4));
  uint64_t v5 = result[2];
  uint64_t v6 = v5 & (bswap64(v4) ^ v4);
  uint64_t v7 = *result + 40LL * v6;
  unint64_t v8 = *(void *)v7;
  if (*(void *)v7)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = v6;
    do
    {
      uint64_t v9 = (v9 + 1) & v5;
      if (v9 == v6) {
        _objc_fatal( "bad weak table at %p. This may be a runtime bug or a memory error somewhere else.",  a2,  a3,  a4,  *result);
      }
      ++v8;
      uint64_t v7 = *result + 40 * v9;
    }

    while (*(void *)v7);
  }

  __int128 v10 = *(_OWORD *)a2;
  __int128 v11 = *(_OWORD *)(a2 + 16);
  *(void *)(v7 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)uint64_t v7 = v10;
  *(_OWORD *)(v7 + 16) = v11;
  ++result[1];
  if (v8 > result[3]) {
    result[3] = v8;
  }
  return result;
}

unint64_t weak_register_no_lock(char **a1, int64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = a2;
  if (a2 < 1) {
    return v4;
  }
  int v5 = (int)a4;
  unint64_t v6 = a3;
  if (a4 <= 1)
  {
    unint64_t v8 = *(void *)a2;
    a3 = *(void *)a2 & 0xFFFFFFFF8LL;
    if ((*(_BYTE *)(a3 + 0x20) & 4) == 0)
    {
      uint64_t v9 = lookUpImpOrForwardTryCache((objc_object *)a2, (unint64_t)sel_allowsWeakReference, (objc_class *)a3, 0);
      if (v9 == _objc_msgForward) {
        return 0LL;
      }
LABEL_21:
      if (v5 == 1)
      {
        ClassName = object_getClassName((id)v4);
        _objc_fatal( "Cannot form weak reference to instance (%p) of class %s. It is possible that this object was over-released, or is in the process of deallocation.",  v18,  v19,  v20,  v4,  ClassName);
      }

      return 0LL;
    }

    if ((v8 & 1) != 0)
    {
      if (!(v8 >> 44)) {
        goto LABEL_21;
      }
    }

    else if (objc_object::sidetable_isDeallocating((objc_object *)a2))
    {
      goto LABEL_21;
    }
  }

void weak_clear_no_lock(void *a1, const void *a2, const char *a3, char *a4)
{
  unint64_t v6 = weak_entry_for_referent(a1, (unint64_t)a2, a3, a4);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if ((v6[2] & 3LL) == 2)
    {
      unint64_t v8 = v6[3] + 1LL;
      if (v8 < 2)
      {
LABEL_17:
        weak_entry_remove((uint64_t)a1, v7);
        return;
      }

      uint64_t v9 = (void *)v6[1];
    }

    else
    {
      uint64_t v9 = v6 + 1;
      unint64_t v8 = 4LL;
    }

    do
    {
      if (*v9)
      {
        __int128 v10 = (const void **)-*v9;
        __int128 v11 = *v10;
        if (*v10 == a2)
        {
          *__int128 v10 = 0LL;
        }

        else if (v11)
        {
          if (DebugWeakErrors)
          {
            if (DebugWeakErrors == 2) {
              ((void (*)(const char *, ...))_objc_fatal)( "__weak variable at %p holds %p instead of %p. This is probably incorrect use of objc_storeWeak() and objc_loadWeak().%s",  v10,  v11,  a2,  "");
            }
            unint64_t v6 = (void *)((uint64_t (*)(const char *, ...))_objc_inform)( "__weak variable at %p holds %p instead of %p. This is probably incorrect use of objc_storeW eak() and objc_loadWeak().%s",  v10,  v11,  a2,  " Break on objc_weak_error to debug.");
          }

          unint64_t v6 = (void *)gdb_objc_class_changed(v6);
        }
      }

      ++v9;
      --v8;
    }

    while (v8);
    goto LABEL_17;
  }

void defaultBadAllocHandler(objc_class *a1)
{
  unint64_t v1 = objc_class::nameForLogging(a1);
  _objc_fatal("attempt to allocate object of class '%s' failed", v2, v3, v4, v1);
}

uint64_t _initializeSwiftRefcountingThenCallRetain(objc_object *a1, double a2)
{
  double Helper_x9__swift_retain = gotLoadHelper_x9__swift_retain(a2);
  *(void *)(v4 + 144) = *(void *)(v3 + 992);
  double Helper_x10__swift_release = gotLoadHelper_x10__swift_release(Helper_x9__swift_retain);
  *(void *)(v7 + 136) = *(void *)(v6 + 968);
  return (*(uint64_t (**)(double))(v8 + 144))(Helper_x10__swift_release);
}

uint64_t _initializeSwiftRefcountingThenCallRelease(objc_object *a1, double a2)
{
  double Helper_x9__swift_retain = gotLoadHelper_x9__swift_retain(a2);
  *(void *)(v4 + 144) = *(void *)(v3 + 992);
  double Helper_x9__swift_release = gotLoadHelper_x9__swift_release(Helper_x9__swift_retain);
  *(void *)(v7 + 136) = *(void *)(v6 + 968);
  return (*(uint64_t (**)(double))(v7 + 136))(Helper_x9__swift_release);
}

id (*_objc_rootAlloc(uint64_t a1))(id receiver, SEL sel, ...)
{
  if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E) & 0x4000) != 0) {
    return _objc_rootAllocWithZone(a1);
  }
  else {
    return (id (*)(id, SEL, ...))objc_msgSend((id)a1, sel_allocWithZone_, 0);
  }
}

void _objc_rootDealloc(unint64_t a1)
{
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    if ((*(void *)a1 & 0x140000000007LL) != 1) {
      a1 = (unint64_t)objc_destructInstance((id)a1);
    }
    free((void *)a1);
  }

objc_object *_objc_rootRetainCount(objc_object *this)
{
  Class isa = this->isa;
  if (((uint64_t)this->isa & 1) != 0)
  {
    unint64_t v2 = (unint64_t)isa >> 45;
                                                                 * (unint64_t)(((this >> 4) ^ (this >> 9)) & 7)];
    int v8 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (1)
    {
      unsigned int v9 = __ldxr(&v7->_os_unfair_lock_opaque);
      if (v9 != v8) {
        break;
      }
      if (!__stlxr(0, &v7->_os_unfair_lock_opaque)) {
        return (objc_object *)v2;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v7);
    return (objc_object *)v2;
  }

                                                               * (unint64_t)(((this >> 4) ^ (this >> 9)) & 7)];
  int v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v6 = __ldxr(&v4->_os_unfair_lock_opaque);
    if (v6 != v5) {
      break;
    }
    if (!__stlxr(0, &v4->_os_unfair_lock_opaque)) {
      return (objc_object *)objc_object::sidetable_retainCount(this);
    }
  }

  __clrex();
  os_unfair_lock_unlock(v4);
  return (objc_object *)objc_object::sidetable_retainCount(this);
}

unsigned int *objc_object::sidetable_lock(objc_object *this)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)os_unfair_lock_lock_with_options();
}

uint64_t objc_object::sidetable_getExtraRC_nolock(objc_object *this)
{
  unsigned int v2 = (uint64_t *)(v1 + 2);
  {
    uint64_t v3 = v7;
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
  }

  else
  {
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
    uint64_t v3 = *v2 + 16 * v5;
  }

  if (v4 + 16 * v5 == v3) {
    return 0LL;
  }
  else {
    return *(void *)(v3 + 8) >> 2;
  }
}

uint64_t objc_object::sidetable_retainCount(objc_object *this)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)v2))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  {
    uint64_t v6 = v13;
    uint64_t v7 = *((void *)v2 + 1);
    uint64_t v8 = v2[6];
  }

  else
  {
    uint64_t v7 = *((void *)v2 + 1);
    uint64_t v8 = v2[6];
    uint64_t v6 = v7 + 16 * v8;
  }

  if (v7 + 16 * v8 == v6) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = (*(void *)(v6 + 8) >> 2) + 1LL;
  }
  int v10 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v11 = __ldxr((unsigned int *)v2);
    if (v11 != v10) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v2);
  return v9;
}

uint64_t objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::LookupBucketFor<DisguisedPtr<objc_object const>>( uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = *(void **)a1;
    uint64_t v6 = -a2;
    unint64_t v7 = 0x8A970BE7488FDA55LL * (-a2 ^ ((unint64_t)-a2 >> 4));
    unsigned int v8 = v3 - 1;
    unsigned int v9 = (v3 - 1) & (bswap64(v7) ^ v7);
    int v10 = (void *)(*(void *)a1 + 16LL * v9);
    if (a2 == *v10)
    {
      uint64_t v11 = 1LL;
    }

    else
    {
      unint64_t v13 = 0LL;
      uint64_t v14 = -*v10;
      unsigned int v15 = 1;
      while (v14 != -1)
      {
        if (v15 > v3) {
          objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( a1,  v5,  *(unsigned int *)(a1 + 16));
        }
        if (v13) {
          BOOL v16 = 0;
        }
        else {
          BOOL v16 = v14 == -2;
        }
        if (v16) {
          unint64_t v13 = (unint64_t)v10;
        }
        if (!(v10[1] | v13)) {
          unint64_t v13 = (unint64_t)v10;
        }
        unsigned int v17 = v9 + v15++;
        unsigned int v9 = v17 & v8;
        int v10 = &v5[2 * (v17 & v8)];
        uint64_t v14 = -*v10;
        uint64_t v11 = 1LL;
        if (!(v6 + *v10)) {
          goto LABEL_5;
        }
      }

      uint64_t v11 = 0LL;
      if (v13) {
        int v10 = (void *)v13;
      }
    }
  }

  else
  {
    int v10 = 0LL;
    uint64_t v11 = 0LL;
  }

uint64_t _objc_rootAutorelease(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  if (a1 < 0) {
    return a1;
  }
  v7.Class isa = *(Class *)a1;
  if ((*(void *)a1 & 1) != 0)
  {
  }

  else if ((*(_WORD *)(((unint64_t)v7.isa & 0xFFFFFFFF8LL) + 0x1E) & 0x1000) != 0 {
         && (objc_object::sidetable_isDeallocating((objc_object *)a1) & 1) != 0)
  }
  {
    return a1;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v9 = *(uint64_t **)(StatusReg + 352);
  if (v9 == (uint64_t *)-1LL)
  {
    uint64_t v10 = *(void *)a1 & 0xFFFFFFFF8LL;
  }

  else
  {
    moveTLSAutoreleaseToPool(v9, *(void *)(StatusReg + 360), a3, a4);
    if (a1 <= 0)
    {
      *(void *)(StatusReg + 352) = 0LL;
      *(void *)(StatusReg + 360) = 0LL;
      return a1;
    }

    uint64_t v10 = *(void *)a1 & 0xFFFFFFFF8LL;
    int v11 = *(_DWORD *)(*(void *)(v10 + 0x20) & 0xF00007FFFFFFFF8LL);
    int v12 = v11;
    if ((v11 & 1) == 0) {
      int v12 = *(_DWORD *)(*(void *)((*(void *)v10 & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v12 & 0x20000000) != 0) {
      goto LABEL_13;
    }
    if (v11 < 0 && (unint64_t)(*(void *)v10 - 16LL) <= 0xFFFFFFFFFFFFFFF0LL)
    {
      class_initialize((objc_class *)v10, (objc_object *)a1, (uint64_t)a3, a4);
LABEL_13:
      *(void *)(StatusReg + 352) = a1 | 3;
      *(void *)(StatusReg + 360) = v4;
      return a1;
    }
  }

  if ((*(_WORD *)(v10 + 30) & 4) == 0) {
    objc_object::rootAutorelease2((objc_object *)a1, a2, a3, a4);
  }
  return a1;
}

uint64_t objc_object::sidetable_isDeallocating(objc_object *this)
{
  unsigned int v2 = (uint64_t *)(v1 + 2);
  {
    uint64_t v3 = v7;
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
  }

  else
  {
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
    uint64_t v3 = *v2 + 16 * v5;
  }

  if (v4 + 16 * v5 == v3) {
    return 0LL;
  }
  else {
    return (*(unsigned __int8 *)(v3 + 8) >> 1) & 1;
  }
}

uint64_t *moveTLSAutoreleaseToPool(uint64_t *result, uint64_t a2, char *a3, char *a4)
{
  uint64_t v4 = (objc_object *)((unint64_t)result & 0xFFFFFFFFFFFFFFFCLL);
  if (((unint64_t)result & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    if ((result & 2) != 0)
    {
      uint64_t v6 = (AutoreleasePoolPage *)StatusReg[43];
      if ((unint64_t)v6 >= 2)
      {
        if (*(_DWORD *)v6 != -1583242847) {
          AutoreleasePoolPage::busted_die(v6, (uint64_t)v4, a3, a4);
        }
        if (*((AutoreleasePoolPage **)v6 + 2) == (AutoreleasePoolPage *)((char *)v6 + 4096)) {
          id result = AutoreleasePoolPage::autoreleaseFullPage( (objc_object *)((unint64_t)result & 0xFFFFFFFFFFFFFFFCLL),  (objc_object *)v6,  (AutoreleasePoolPage *)a3,  a4);
        }
        else {
          id result = AutoreleasePoolPage::add(v6, (uint64_t)v4);
        }
      }

      else
      {
        id result = (uint64_t *)AutoreleasePoolPage::autoreleaseNoPage( (id)((unint64_t)result & 0xFFFFFFFFFFFFFFFCLL),  v4);
      }
    }

    else
    {
      StatusReg[44] = -1LL;
      StatusReg[45] = 0LL;
      id result = v4;
    }
  }

  unint64_t v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(v7 + 352) = 0LL;
  *(void *)(v7 + 360) = 0LL;
  return result;
}

objc_object *objc_object::rootAutorelease2(objc_object *this, uint64_t a2, char *a3, char *a4)
{
  uint64_t v5 = *(AutoreleasePoolPage **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 344);
  if ((unint64_t)v5 >= 2)
  {
    if (*(_DWORD *)v5 != -1583242847) {
      AutoreleasePoolPage::busted_die(v5, (uint64_t)v5, a3, a4);
    }
    else {
      AutoreleasePoolPage::add(v5, (uint64_t)this);
    }
  }

  else
  {
    AutoreleasePoolPage::autoreleaseNoPage(this, (objc_object *)v5);
  }

  return this;
}

uint64_t *AutoreleasePoolPage::add(AutoreleasePoolPage *this, uint64_t a2)
{
  uint64_t v2 = a2;
  id result = (uint64_t *)*((void *)this + 2);
  if (DisableAutoreleaseCoalescing) {
    BOOL v5 = DisableAutoreleaseCoalescingLRU == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = (uint64_t *)((char *)this + 56);
    if (a2) {
      BOOL v7 = result == v6;
    }
    else {
      BOOL v7 = 1;
    }
    char v8 = v7;
    if (DisableAutoreleaseCoalescingLRU)
    {
      if ((v8 & 1) == 0)
      {
        unint64_t v9 = *(result - 1);
        if ((v9 & 0xF00FFFFFFFFFFFFLL) == a2)
        {
          uint64_t v10 = (v9 >> 44) & 0xFF0 | (v9 >> 60);
          if (v10 != 4095)
          {
            *--id result = ((v10 + 1) << 44) & 0xFF000000000000LL | ((v10 + 1) << 60) | a2;
            return result;
          }
        }
      }
    }

    else if ((v8 & 1) == 0)
    {
      uint64_t v11 = 0LL;
      int v12 = result - 1;
      unint64_t v13 = result - 1;
      do
      {
        if (v13 <= v6) {
          break;
        }
        unint64_t v14 = *v13;
        if (!*v13) {
          break;
        }
        if ((v14 & 0xF00FFFFFFFFFFFFLL) == a2)
        {
          uint64_t v15 = (v14 >> 44) & 0xFF0 | (v14 >> 60);
          if (v15 != 4095)
          {
            if (v11)
            {
              memmove(v13, v13 + 1, 8 * v11);
            }

            else
            {
              uint64_t v15 = ((unint64_t)*v12 >> 44) & 0xFF0 | ((unint64_t)*v12 >> 60);
              uint64_t v2 = *v12 & 0xF00FFFFFFFFFFFFLL;
            }

            *int v12 = v2 | ((v15 + 1) << 44) & 0xFF000000000000LL | ((v15 + 1) << 60);
            return v12;
          }
        }

        ++v11;
        --v13;
      }

      while (v11 != 4);
    }
  }

  *((void *)this + 2) = result + 1;
  uint64_t *result = a2;
  return result;
}

uint64_t *AutoreleasePoolPage::autoreleaseFullPage( objc_object *this, objc_object *a2, AutoreleasePoolPage *a3, char *a4)
{
  uint64_t v4 = a2;
  do
  {
    Class isa = (objc_object *)v4[5].isa;
    if (!isa)
    {
      __memptr = 0LL;
      posix_memalign(&__memptr, 0x1000uLL, 0x1000uLL);
      Class isa = (objc_object *)__memptr;
      AutoreleasePoolPage::AutoreleasePoolPage((AutoreleasePoolPage *)__memptr, (AutoreleasePoolPage *)v4, v7, v8);
    }

    uint64_t v4 = isa;
  }

  while ((objc_object *)isa[2].isa == &isa[512]);
  if (LODWORD(isa->isa) != -1583242847) {
    AutoreleasePoolPage::busted_die((AutoreleasePoolPage *)isa, (uint64_t)a2, (const char *)a3, a4);
  }
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 344) = isa;
  return AutoreleasePoolPage::add((AutoreleasePoolPage *)isa, (uint64_t)this);
}

void sub_180043234(_Unwind_Exception *a1)
{
}

uint64_t AutoreleasePoolPage::autoreleaseNoPage(id this, objc_object *a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 344);
  if (v4 == 1)
  {
LABEL_7:
    __memptr = 0LL;
    posix_memalign(&__memptr, 0x1000uLL, 0x1000uLL);
    uint64_t v6 = (AutoreleasePoolPage *)__memptr;
    AutoreleasePoolPage::AutoreleasePoolPage((AutoreleasePoolPage *)__memptr, 0LL, v7, v8);
    if (v6 && *(_DWORD *)v6 != -1583242847) {
      AutoreleasePoolPage::busted_die(v6, v9, v10, v11);
    }
    *(void *)(StatusReg + 344) = v6;
    if (v4 == 1)
    {
      int v12 = (void *)*((void *)v6 + 2);
      *((void *)v6 + 2) = v12 + 1;
      *int v12 = 0LL;
    }

    return (uint64_t)AutoreleasePoolPage::add(v6, (uint64_t)this);
  }

  if (!this || !DebugMissingPools)
  {
    if (!this && !DebugPoolAllocation)
    {
      uint64_t result = 1LL;
      *(void *)(StatusReg + 344) = 1LL;
      return result;
    }

    goto LABEL_7;
  }

  unint64_t v13 = *(const void **)StatusReg;
  ClassName = object_getClassName(this);
  _objc_inform( "MISSING POOLS: (%p) Object %p of class %s autoreleased with no pool in place - just leaking - break on objc_autorele aseNoPool() to debug",  v13,  this,  ClassName);
  gdb_objc_class_changed(v15);
  if (DebugMissingPools == 2) {
    _objc_fatal("Missing pools are a fatal error", v16, v17, v18);
  }
  return 0LL;
}

void sub_180043368(_Unwind_Exception *a1)
{
}

void AutoreleasePoolPage::AutoreleasePoolPage( AutoreleasePoolPage *this, AutoreleasePoolPage *a2, const char *a3, char *a4)
{
  uint64_t v4 = a2;
  unint64_t StatusReg = (uint64_t *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v7 = *StatusReg;
  if (a2)
  {
    int v8 = *((_DWORD *)a2 + 13);
    int v9 = *((_DWORD *)a2 + 12) + 1;
  }

  else
  {
    int v9 = 0;
    int v8 = 0;
  }

  *((_DWORD *)this + 3) = 558191425;
  *(_DWORD *)this = -1583242847;
  *(void *)((char *)this + 4) = *(void *)"AUTORELEASE!";
  *((void *)this + 2) = (char *)this + 56;
  *((void *)this + 3) = v7;
  *((void *)this + 4) = a2;
  *((void *)this + 5) = 0LL;
  *((_DWORD *)this + 12) = v9;
  *((_DWORD *)this + 13) = v8;
  if (objc::PageCountWarning != -1)
  {
    {
      if (DisableFaults
        || getpid() == 1
        || (is_root_ramdisk() & 1) != 0
        || !os_variant_has_internal_diagnostics())
      {
        _dyld_get_image_uuid();
        if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
          _dyld_get_shared_cache_range();
        }
        _os_log_simple();
      }

      else
      {
        os_fault_with_payload();
      }

      do
    }

    uint64_t v4 = (AutoreleasePoolPage *)*((void *)this + 4);
  }

  if (v4)
  {
    if (*(_DWORD *)v4 != -1583242847
      || strncmp((const char *)v4 + 4, "AUTORELEASE!", 0xCuLL)
      || *((void *)v4 + 3) != *StatusReg)
    {
      AutoreleasePoolPage::busted_die(v4, (uint64_t)a2, a3, a4);
    }

    *((void *)v4 + 5) = this;
  }

void sub_180043574(_Unwind_Exception *a1)
{
  *unint64_t v1 = 0LL;
  v1[1] = 0LL;
  _Unwind_Resume(a1);
}

void AutoreleasePoolPage::busted<void (*)(char const*,...)>( unsigned int *a1, uint64_t a2, const char *a3, char *a4)
{
}

void sub_1800435EC(_Unwind_Exception *a1)
{
  *(void *)(v1 - 8) = 0LL;
  *(void *)(v1 - 16) = 0LL;
  _Unwind_Resume(a1);
}

id objc_autorelease(id a1)
{
  unint64_t v6 = *(void *)a1;
  if ((*(_BYTE *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x20) & 4) != 0)
  {
    if ((v6 & 1) != 0)
    {
      if (!(v6 >> 44)) {
        return a1;
      }
    }

    else if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E) & 0x1000) != 0 {
           && (objc_object::sidetable_isDeallocating((objc_object *)a1) & 1) != 0)
    }
    {
      return a1;
    }

    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = *(void *)(StatusReg + 352);
    if (v8 == -1)
    {
      uint64_t v10 = *(void *)a1 & 0xFFFFFFFF8LL;
    }

    else
    {
      uint64_t v1 = (objc_object *)(v8 & 0xFFFFFFFFFFFFFFFCLL);
      if ((v8 & 0xFFFFFFFFFFFFFFFCLL) != 0)
      {
        if ((v8 & 2) != 0)
        {
          unint64_t v11 = *(void *)(StatusReg + 344);
          if (v11 >= 2)
          {
            if (*(_DWORD *)v11 != -1583242847) {
              AutoreleasePoolPage::busted_die(*(AutoreleasePoolPage **)(StatusReg + 344), (uint64_t)v1, v2, v3);
            }
            if (*(void *)(v11 + 16) == v11 + 4096) {
              AutoreleasePoolPage::autoreleaseFullPage( v1,  *(objc_object **)(StatusReg + 344),  (AutoreleasePoolPage *)v2,  v3);
            }
            else {
              AutoreleasePoolPage::add(*(AutoreleasePoolPage **)(StatusReg + 344), (uint64_t)v1);
            }
          }

          else
          {
            AutoreleasePoolPage::autoreleaseNoPage(v1, v1);
          }
        }

        else
        {
          *(void *)(StatusReg + 352) = -1LL;
          *(void *)(StatusReg + 360) = 0LL;
          int v9 = v1;
        }
      }

      *(void *)(StatusReg + 352) = 0LL;
      *(void *)(StatusReg + 360) = 0LL;
      uint64_t v10 = *(void *)a1 & 0xFFFFFFFF8LL;
      int v12 = *(_DWORD *)(*(void *)(v10 + 0x20) & 0xF00007FFFFFFFF8LL);
      int v13 = v12;
      if ((v12 & 1) == 0) {
        int v13 = *(_DWORD *)(*(void *)((*(void *)v10 & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v13 & 0x20000000) != 0) {
        goto LABEL_24;
      }
      if (v12 < 0 && (unint64_t)(*(void *)v10 - 16LL) <= 0xFFFFFFFFFFFFFFF0LL)
      {
        class_initialize((objc_class *)v10, (objc_object *)a1, (uint64_t)v2, v3);
LABEL_24:
        *(void *)(StatusReg + 352) = (unint64_t)a1 | 3;
        *(void *)(StatusReg + 360) = v4;
        return a1;
      }
    }

    if ((*(_WORD *)(v10 + 30) & 4) == 0) {
      objc_object::rootAutorelease2((objc_object *)a1, (uint64_t)v1, v2, v3);
    }
    return a1;
  }

  return objc_msgSend(a1, sel_autorelease);
}

uint64_t _objc_rootRelease(uint64_t result)
{
  if ((result & 0x8000000000000000LL) == 0)
  {
    unint64_t v1 = __ldxr((unint64_t *)result);
    if ((v1 & 1) != 0)
    {
      while (v1 >> 44)
      {
        BOOL v2 = v1 >= 0x200000000000LL;
        unint64_t v3 = v1 - 0x200000000000LL;
        if (!v2)
        {
          __clrex();
          return objc_object::rootRelease_underflow((objc_object *)result, 1);
        }

        if (!__stlxr(v3, (unint64_t *)result))
        {
          if (!(v3 >> 44))
          {
            __dmb(9u);
            if ((*(_WORD *)((*(void *)result & 0xFFFFFFFF8LL) + 0x1E) & 0x1000) != 0) {
              uint64_t v4 = &selRef__objc_initiateDealloc;
            }
            else {
              uint64_t v4 = &selRef_dealloc;
            }
            return (uint64_t)[(id)result *v4];
          }

          return result;
        }

        unint64_t v1 = __ldxr((unint64_t *)result);
        if ((v1 & 1) == 0) {
          goto LABEL_12;
        }
      }
    }

    else if ((*(_WORD *)((v1 & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0)
    {
LABEL_12:
      __clrex();
      return objc_object::sidetable_release((objc_object *)result, 0, 1);
    }

    __clrex();
  }

  return result;
}

BOOL objc_object::sidetable_release(objc_object *this, char a2, int a3)
{
  if ((a2 & 1) == 0)
  {
    unsigned int v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr((unsigned int *)v5))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
  }

BOOL objc_object::rootRelease_underflow(objc_object *this, int a2)
{
  unint64_t v4 = __ldxr((unint64_t *)this);
  if ((v4 & 1) != 0)
  {
    char v5 = 0;
    while (v4 >> 44)
    {
      unint64_t v6 = v4 - 0x200000000000LL;
      if (v4 < 0x200000000000LL)
      {
        if ((v5 & 1) != 0)
        {
          uint64_t v7 = objc_object::sidetable_subExtraRC_nolock(this);
          if (!v7) {
            goto LABEL_38;
          }
          uint64_t v9 = (v7 << 45) - 0x200000000000LL;
          if (!__stlxr( v9 & 0xFFFFE00000000000LL | v4 & 0xFFFFFFFFFFFLL | ((unint64_t)(v8 != 0) << 44),  (unint64_t *)this))
          {
            if (!v8) {
              objc_object::sidetable_clearExtraRC_nolock(this);
            }
            goto LABEL_26;
          }

          unint64_t v10 = __ldxr((unint64_t *)this);
          if ((v10 & 1) != 0)
          {
            BOOL v11 = __CFADD__(v10, v9);
            unint64_t v12 = v10 + v9;
            if (!v11)
            {
              unint64_t v13 = v12 & 0xFFFFEFFFFFFFFFFFLL | ((unint64_t)(v8 != 0) << 44);
              if (!__stlxr(v13, (unint64_t *)this))
              {
                if (!v8) {
                  objc_object::sidetable_clearExtraRC_nolock(this);
                }
                if (!(v13 >> 44)) {
                  goto LABEL_38;
                }
LABEL_26:
                objc_object::sidetable_unlock(this);
                return 0LL;
              }

              __ldxr((unint64_t *)this);
            }
          }

          __clrex();
          objc_object::sidetable_addExtraRC_nolock(this, v7);
        }

        else
        {
          __clrex();
          objc_object::sidetable_lock(this);
        }

        unint64_t v4 = __ldxr((unint64_t *)this);
        char v5 = 1;
        if ((v4 & 1) == 0) {
          goto LABEL_31;
        }
      }

      else
      {
        if (!__stlxr(v6, (unint64_t *)this))
        {
          if (v6 >> 44)
          {
            if ((v5 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_26;
          }

          if ((v5 & 1) != 0) {
LABEL_38:
          }
            objc_object::sidetable_unlock(this);
          __dmb(9u);
          if (a2)
          {
            else {
              uint64_t v15 = &selRef_dealloc;
            }
            [this *v15];
          }

          return 1LL;
        }

        unint64_t v4 = __ldxr((unint64_t *)this);
        if ((v4 & 1) == 0) {
          goto LABEL_31;
        }
      }
    }

    __clrex();
    if ((v5 & 1) != 0) {
      goto LABEL_26;
    }
    return 0LL;
  }

  if ((*(_WORD *)((v4 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
  {
    BOOL result = 0LL;
    __clrex();
  }

  else
  {
    char v5 = 0;
LABEL_31:
    __clrex();
    return objc_object::sidetable_release(this, v5 & 1, a2);
  }

  return result;
}

void objc_object::sidetable_unlock(objc_object *this)
{
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v3 = __ldxr(&v1->_os_unfair_lock_opaque);
    if (v3 != v2) {
      break;
    }
    if (!__stlxr(0, &v1->_os_unfair_lock_opaque)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock(v1);
}

uint64_t objc_object::sidetable_subExtraRC_nolock(objc_object *this)
{
  int v2 = (uint64_t *)(v1 + 2);
  {
    uint64_t v3 = v8;
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
  }

  else
  {
    uint64_t v4 = *v2;
    uint64_t v5 = v1[6];
    uint64_t v3 = *v2 + 16 * v5;
  }

  if (v4 + 16 * v5 == v3) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(v3 + 8);
  if (!v6) {
    return 0LL;
  }
  *(void *)(v3 + 8) = v6 - 0x100000;
  return 0x40000LL;
}

void objc_object::sidetable_clearExtraRC_nolock(objc_object *this)
{
  uint64_t v1 = ((this >> 4) ^ (this >> 9)) & 7LL;
    uint64_t v3 = v4;
  else {
    uint64_t v3 = (void *)(*((void *)v2 + 1) + 16LL * v2[6]);
  }
  *uint64_t v3 = 2LL;
}

uint64_t *objc_object::sidetable_addExtraRC_nolock(objc_object *this, uint64_t a2)
{
  uint64_t v6 = -(uint64_t)this;
                                                              + 2],
             &v6);
  uint64_t v4 = *result;
  if ((*result & 0x8000000000000000LL) == 0)
  {
    if (__CFADD__(v4, 4 * a2)) {
      unint64_t v5 = *result & 3 | 0x8000000000000000LL;
    }
    else {
      unint64_t v5 = v4 + 4 * a2;
    }
    uint64_t *result = v5;
  }

  return result;
}

void *objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::operator[]( int32x2_t *a1, uint64_t *a2)
{
  inserted = v7;
  if ((v4 & 1) == 0)
  {
    void *inserted = *a2;
    inserted[1] = 0LL;
  }

  return inserted + 1;
}

void *objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::InsertIntoBucketImpl<DisguisedPtr<objc_object const>>( int32x2_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v8 = a3;
  __int32 v5 = a1[1].i32[0];
  unsigned int v6 = a1[2].u32[0];
  if (4 * v5 + 4 >= 3 * v6)
  {
    v6 *= 2;
  }

  else if (v6 + ~v5 - a1[1].i32[1] > v6 >> 3)
  {
    goto LABEL_3;
  }

  a3 = v8;
LABEL_3:
  if (*a3 == 2LL)
  {
    a1[1] = vadd_s32(a1[1], (int32x2_t)0xFFFFFFFF00000001LL);
  }

  else if (-*a3 == -1LL)
  {
    ++a1[1].i32[0];
  }

  return a3;
}

void objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::grow( uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  char v4 = *(uint64_t **)a1;
  unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
  int v7 = v6 | HIWORD(v6);
  else {
    uint64_t v8 = 4LL;
  }
  *(_DWORD *)(a1 + 16) = v8;
  uint64_t v9 = malloc(16LL * v8);
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v10 = 16 * v8;
  if (v4)
  {
    do
    {
      *uint64_t v9 = 1LL;
      v9 += 2;
      v10 -= 16LL;
    }

    while (v10);
    if ((_DWORD)v3)
    {
      uint64_t v11 = 16 * v3;
      unint64_t v12 = v4 + 1;
      do
      {
        if (*v12)
        {
          uint64_t v13 = *(v12 - 1);
          if ((unint64_t)(v13 - 1) >= 2)
          {
            unint64_t v14 = v16;
            uint64_t v15 = *v12;
            *uint64_t v16 = *(v12 - 1);
            v14[1] = v15;
            ++*(_DWORD *)(a1 + 8);
          }
        }

        v12 += 2;
        v11 -= 16LL;
      }

      while (v11);
    }

    free(v4);
  }

  else
  {
    do
    {
      *uint64_t v9 = 1LL;
      v9 += 2;
      v10 -= 16LL;
    }

    while (v10);
  }

void objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::compact( uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    if (v3 >= 0x401 && v3 >> 4 > v2) {
  }
    }

  else if (v3)
  {
    free(*(void **)a1);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(_DWORD *)(a1 + 16) = 0;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
  }

uint64_t objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>,DisguisedPtr<objc_object const>,unsigned long,anonymous namespace'::RefcountMapValuePurgeable,objc::DenseMapInfo<DisguisedPtr<objc_object const>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object const>,unsigned long>>::try_emplace<unsigned long>( uint64_t a1, int32x2_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v9 = v13;
  if ((result & 1) != 0)
  {
    char v10 = 0;
  }

  else
  {
    uint64_t v9 = (void *)result;
    uint64_t v11 = *a4;
    *(void *)uint64_t result = *a3;
    *(void *)(result + 8) = v11;
    char v10 = 1;
  }

  uint64_t v12 = *(void *)a2 + 16LL * a2[2].u32[0];
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = v10;
  return result;
}

BOOL _objc_rootTryRetain(objc_object *a1)
{
  uint64_t v1 = a1;
  if (((unint64_t)a1 & 0x8000000000000000LL) == 0)
  {
    unint64_t v2 = __ldxr((unint64_t *)a1);
    if ((v2 & 1) != 0)
    {
      while (1)
      {
        if (!(v2 >> 44))
        {
          uint64_t v1 = 0LL;
          goto LABEL_13;
        }

        BOOL v3 = __CFADD__(v2, 0x200000000000LL);
        unint64_t v4 = v2 + 0x200000000000LL;
        if (v3) {
          break;
        }
        unint64_t v2 = __ldxr((unint64_t *)a1);
        if ((v2 & 1) == 0) {
          goto LABEL_9;
        }
      }

      __clrex();
      uint64_t v1 = objc_object::rootRetain_overflow(a1, 1);
    }

    else if ((*(_WORD *)((v2 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
    {
LABEL_13:
      __clrex();
    }

    else
    {
LABEL_9:
      __clrex();
    }
  }

  return v1 != 0LL;
}

uint64_t objc_object::sidetable_tryRetain(objc_object *this)
{
  uint64_t v4 = -(uint64_t)this;
  uint64_t v3 = 4LL;
                                                     + 2],
    &v4,
    &v3);
  if (!v6)
  {
    uint64_t v2 = *(void *)(v5 + 8);
    if ((v2 & 2) != 0) {
      return 0LL;
    }
    if ((v2 & 0x8000000000000000LL) == 0) {
      *(void *)(v5 + 8) = v2 + 4;
    }
  }

  return 1LL;
}

objc_object *objc_object::rootRetain_overflow(objc_object *this, int a2)
{
  uint64_t v2 = this;
  if (((unint64_t)this & 0x8000000000000000LL) == 0)
  {
    unint64_t v4 = __ldxr((unint64_t *)this);
    if ((v4 & 1) != 0)
    {
      int v5 = 0;
      while (v4 >> 44)
      {
        unint64_t v6 = v4 + 0x200000000000LL;
        if (v4 >= 0xFFFFE00000000000LL)
        {
          if (((a2 | v5) & 1) == 0) {
            objc_object::sidetable_lock(v2);
          }
          if (!__stxr(v6 & 0xFFFFFFFFFFFLL | 0x8000100000000000LL, (unint64_t *)v2))
          {
            objc_object::sidetable_addExtraRC_nolock(v2, 0x40000LL);
            LOBYTE(v5) = 1;
LABEL_25:
            if (!a2 && (v5 & 1) != 0) {
              objc_object::sidetable_unlock(v2);
            }
            return v2;
          }

          int v5 = 1;
        }

        else if (!__stxr(v6, (unint64_t *)v2))
        {
          goto LABEL_25;
        }

        unint64_t v4 = __ldxr((unint64_t *)v2);
        if ((v4 & 1) == 0) {
          goto LABEL_15;
        }
      }

      __clrex();
      if ((v5 & 1) != 0) {
        objc_object::sidetable_unlock(v2);
      }
      if (a2) {
        return 0LL;
      }
    }

    else if ((*(_WORD *)((v4 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
    {
      __clrex();
    }

    else
    {
      LOBYTE(v5) = 0;
LABEL_15:
      __clrex();
      if (a2)
      {
      }

      else
      {
        objc_object::sidetable_retain(v2, v5 & 1);
      }
    }
  }

  return v2;
}

objc_object *objc_object::sidetable_retain(objc_object *this, char a2)
{
  if ((a2 & 1) == 0)
  {
    unsigned int v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr((unsigned int *)v3))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
  }

objc_object *_objc_rootRetain(objc_object *result)
{
  if (((unint64_t)result & 0x8000000000000000LL) == 0)
  {
    unint64_t v1 = __ldxr((unint64_t *)result);
    if ((v1 & 1) != 0)
    {
      while (v1 >> 44)
      {
        BOOL v2 = __CFADD__(v1, 0x200000000000LL);
        unint64_t v3 = v1 + 0x200000000000LL;
        if (v2)
        {
          __clrex();
          return objc_object::rootRetain_overflow(result, 0);
        }

        unint64_t v1 = __ldxr((unint64_t *)result);
        if ((v1 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }

    else if ((*(_WORD *)((v1 & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0)
    {
LABEL_9:
      __clrex();
      return objc_object::sidetable_retain(result, 0);
    }

    __clrex();
  }

  return result;
}

void (*_objc_setBadAllocHandler( void (*result)(objc_class *)))(objc_class *)
{
  badAllocHandler = result;
  return result;
}

uint64_t objc_should_deallocate()
{
  return 1LL;
}

id objc_retain_autorelease(id a1)
{
  return a1;
}

void objc_storeStrong(id *location, id obj)
{
  id v2 = *location;
  if (*location != obj)
  {
    id v5 = obj;
    *location = obj;
  }

id objc_storeWeak(id *location, id obj)
{
  unsigned int v4 = 0LL;
                                           * (unint64_t)(((obj >> 4) ^ (obj >> 9)) & 7)];
  uint64_t v19 = obj & 7;
  uint64_t v6 = ((unint64_t)obj >> 55);
  while (1)
  {
    while (1)
    {
      id v7 = *location;
                                               * (unint64_t)(((*location >> 4) ^ (*location >> 9)) & 7)];
      locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::lockWith((unsigned int *)v8, (unsigned int *)v5);
      if (*location == v7) {
        break;
      }
      locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
    }

    if (!obj) {
      break;
    }
    if (((unint64_t)obj & 0x8000000000000000LL) != 0)
    {
      uint64_t v10 = (__objc2_class *)objc_debug_taggedpointer_classes[v19];
    }

    else
    {
      uint64_t v10 = (__objc2_class *)(*(void *)obj & 0xFFFFFFFF8LL);
    }

    if (v10 == v4) {
      break;
    }
    int v11 = *(_DWORD *)((uint64_t)v10->info & 0xF00007FFFFFFFF8LL);
    if ((v11 & 1) == 0) {
      int v11 = *(_DWORD *)(*(void *)(((uint64_t)v10->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v11 & 0x20000000) != 0) {
      break;
    }
    locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
    class_initialize((objc_class *)v10, (objc_object *)obj, v12, v13);
    unsigned int v4 = v10;
  }

  weak_unregister_no_lock((void *)v8 + 4, (unint64_t)v7, (const char *)location, v9);
  int64_t v14 = weak_register_no_lock((char **)v5 + 4, (int64_t)obj, (uint64_t)location, (char *)1);
  uint64_t v15 = (void *)v14;
  if (v14 >= 1)
  {
    while (1)
    {
      unint64_t v16 = __ldxr((unint64_t *)v14);
      if ((v16 & 1) == 0) {
        break;
      }
      if ((v16 & 0x40000000000LL) != 0)
      {
        __clrex();
        goto LABEL_18;
      }
    }

    __clrex();
    uint64_t v20 = -v14;
                                                             + 2],
            &v20);
    *v18 |= 1uLL;
  }

uint64_t callSetWeaklyReferenced(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (result < 0)
    {
      uint64_t result = objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      uint64_t result = *(void *)result & 0xFFFFFFFF8LL;
    }

    if ((*(_BYTE *)(result + 32) & 4) == 0 && (v1 < 1 || (*(_WORD *)((*(void *)v1 & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0))
    {
      uint64_t result = (uint64_t)class_getMethodImplementation((Class)result, sel__setWeaklyReferenced);
      if ((id (*)(id, SEL, ...))result != _objc_msgForward) {
        return ((uint64_t (*)(uint64_t, char *))result)(v1, sel__setWeaklyReferenced);
      }
    }
  }

  return result;
}

id objc_storeWeakOrNil(id *location, id obj)
{
  unsigned int v4 = 0LL;
                                           * (unint64_t)(((obj >> 4) ^ (obj >> 9)) & 7)];
  uint64_t v19 = obj & 7;
  uint64_t v6 = ((unint64_t)obj >> 55);
  while (1)
  {
    while (1)
    {
      id v7 = *location;
                                               * (unint64_t)(((*location >> 4) ^ (*location >> 9)) & 7)];
      locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::lockWith((unsigned int *)v8, (unsigned int *)v5);
      if (*location == v7) {
        break;
      }
      locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
    }

    if (!obj) {
      break;
    }
    if (((unint64_t)obj & 0x8000000000000000LL) != 0)
    {
      uint64_t v10 = (__objc2_class *)objc_debug_taggedpointer_classes[v19];
    }

    else
    {
      uint64_t v10 = (__objc2_class *)(*(void *)obj & 0xFFFFFFFF8LL);
    }

    if (v10 == v4) {
      break;
    }
    int v11 = *(_DWORD *)((uint64_t)v10->info & 0xF00007FFFFFFFF8LL);
    if ((v11 & 1) == 0) {
      int v11 = *(_DWORD *)(*(void *)(((uint64_t)v10->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v11 & 0x20000000) != 0) {
      break;
    }
    locker_mixin<lockdebug::lock_mixin<objc_lock_base_t>>::unlockWith((os_unfair_lock_t)v8, (os_unfair_lock_t)v5);
    class_initialize((objc_class *)v10, (objc_object *)obj, v12, v13);
    unsigned int v4 = v10;
  }

  weak_unregister_no_lock((void *)v8 + 4, (unint64_t)v7, (const char *)location, v9);
  int64_t v14 = weak_register_no_lock((char **)v5 + 4, (int64_t)obj, (uint64_t)location, 0LL);
  uint64_t v15 = (void *)v14;
  if (v14 >= 1)
  {
    while (1)
    {
      unint64_t v16 = __ldxr((unint64_t *)v14);
      if ((v16 & 1) == 0) {
        break;
      }
      if ((v16 & 0x40000000000LL) != 0)
      {
        __clrex();
        goto LABEL_18;
      }
    }

    __clrex();
    uint64_t v20 = -v14;
                                                             + 2],
            &v20);
    *v18 |= 1uLL;
  }

id objc_initWeak(id *location, id val)
{
  uint64_t v4 = (uint64_t)val;
  if (val)
  {
    uint64_t v6 = 0LL;
                                             * (unint64_t)(((val >> 4) ^ (val >> 9)) & 7)];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    while (1)
    {
      unsigned int v9 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)v7))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_8:
      if (v4 < 0)
      {
        int v11 = (__objc2_class *)objc_debug_taggedpointer_classes[v4 & 7];
      }

      else
      {
        int v11 = (__objc2_class *)(*(void *)v4 & 0xFFFFFFFF8LL);
      }

      if (v11 == v6) {
        break;
      }
      int v12 = *(_DWORD *)((uint64_t)v11->info & 0xF00007FFFFFFFF8LL);
      if ((v12 & 1) == 0) {
        int v12 = *(_DWORD *)(*(void *)(((uint64_t)v11->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v12 & 0x20000000) != 0) {
        break;
      }
      int v13 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v14 = __ldxr((unsigned int *)v7);
        if (v14 != v13) {
          break;
        }
      }

      __clrex();
                                                                                  * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
LABEL_19:
      class_initialize((objc_class *)v11, (objc_object *)v4, v2, v3);
      uint64_t v6 = v11;
    }

    int64_t v15 = weak_register_no_lock((char **)v7 + 4, v4, (uint64_t)location, (char *)1);
    uint64_t v4 = v15;
    if (v15 >= 1)
    {
      while (1)
      {
        unint64_t v16 = __ldxr((unint64_t *)v15);
        if ((v16 & 1) == 0) {
          break;
        }
        if ((v16 & 0x40000000000LL) != 0)
        {
          __clrex();
          goto LABEL_26;
        }
      }

      __clrex();
      uint64_t v21 = -v15;
                                                               + 2],
              &v21);
      *v20 |= 1uLL;
    }

id objc_initWeakOrNil(id *location, id val)
{
  uint64_t v4 = (uint64_t)val;
  if (val)
  {
    uint64_t v6 = 0LL;
                                             * (unint64_t)(((val >> 4) ^ (val >> 9)) & 7)];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    while (1)
    {
      unsigned int v9 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)v7))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_8:
      if (v4 < 0)
      {
        int v11 = (__objc2_class *)objc_debug_taggedpointer_classes[v4 & 7];
      }

      else
      {
        int v11 = (__objc2_class *)(*(void *)v4 & 0xFFFFFFFF8LL);
      }

      if (v11 == v6) {
        break;
      }
      int v12 = *(_DWORD *)((uint64_t)v11->info & 0xF00007FFFFFFFF8LL);
      if ((v12 & 1) == 0) {
        int v12 = *(_DWORD *)(*(void *)(((uint64_t)v11->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
      }
      if ((v12 & 0x20000000) != 0) {
        break;
      }
      int v13 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v14 = __ldxr((unsigned int *)v7);
        if (v14 != v13) {
          break;
        }
      }

      __clrex();
                                                                                  * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
LABEL_19:
      class_initialize((objc_class *)v11, (objc_object *)v4, v2, v3);
      uint64_t v6 = v11;
    }

    int64_t v15 = weak_register_no_lock((char **)v7 + 4, v4, (uint64_t)location, 0LL);
    uint64_t v4 = v15;
    if (v15 >= 1)
    {
      while (1)
      {
        unint64_t v16 = __ldxr((unint64_t *)v15);
        if ((v16 & 1) == 0) {
          break;
        }
        if ((v16 & 0x40000000000LL) != 0)
        {
          __clrex();
          goto LABEL_26;
        }
      }

      __clrex();
      uint64_t v21 = -v15;
                                                               + 2],
              &v21);
      *v20 |= 1uLL;
    }

void objc_destroyWeak(id *location)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
LABEL_2:
  while (1)
  {
    id v4 = *location;
                                             * (unint64_t)(((*location >> 4) ^ (*location >> 9)) & 7)];
    unsigned int v6 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)v5))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_7:
    if (*location == v4) {
      break;
    }
    int v8 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v9 = __ldxr((unsigned int *)v5);
      if (v9 != v8) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)v5);
  }

  weak_unregister_no_lock((void *)v5 + 4, (unint64_t)v4, (const char *)location, v1);
  int v10 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v11 = __ldxr((unsigned int *)v5);
    if (v11 != v10) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
}

id objc_loadWeakRetained(id *location)
{
  uint64_t v1 = (objc_object *)*location;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
                                                                 * (unint64_t)(((v1 >> 4) ^ (v1 >> 9)) & 7)];
    unsigned int v5 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(&v4->_os_unfair_lock_opaque))
    {
      if (!__stxr(v5, &v4->_os_unfair_lock_opaque)) {
        goto LABEL_8;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_8:
    if (*location != v1)
    {
      int v7 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v8 = __ldxr(&v4->_os_unfair_lock_opaque);
        if (v8 != v7) {
          break;
        }
        if (!__stlxr(0, &v4->_os_unfair_lock_opaque)) {
          goto LABEL_25;
        }
      }

      __clrex();
                                                                                  * (unint64_t)(((v1 >> 4) ^ (v1 >> 9)) & 7)]);
      goto LABEL_25;
    }

    unsigned int v9 = (objc_class *)((uint64_t)v1->isa & 0xFFFFFFFF8LL);
    Class isa = v9[4].isa;
    int v11 = *(_DWORD *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
    if ((v11 & 1) == 0) {
      int v11 = *(_DWORD *)(*(void *)(((uint64_t)v9->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
    }
    if ((v11 & 0x20000000) != 0
      || _thisThreadIsInitializingClass((void *)((uint64_t)v1->isa & 0xFFFFFFFF8LL)))
    {
      unint64_t v16 = lookUpImpOrForwardTryCache(v1, (unint64_t)sel_retainWeakReference, v9, 0);
      if (v16 == _objc_msgForward)
      {
        uint64_t v1 = 0LL;
      }

      else if (!v16(v1, sel_retainWeakReference))
      {
        uint64_t v1 = 0LL;
      }

      goto LABEL_48;
    }

    int v14 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v15 = __ldxr(&v4->_os_unfair_lock_opaque);
      if (v15 != v14) {
        break;
      }
      if (!__stlxr(0, &v4->_os_unfair_lock_opaque)) {
        goto LABEL_24;
      }
    }

    __clrex();
                                                                                * (unint64_t)(((v1 >> 4) ^ (v1 >> 9)) & 7)]);
LABEL_24:
    class_initialize(v9, v1, v12, v13);
LABEL_25:
    uint64_t v1 = (objc_object *)*location;
  }

  unint64_t v17 = __ldxr((unint64_t *)v1);
  if ((v17 & 1) != 0)
  {
    while (1)
    {
      if (!(v17 >> 44))
      {
        uint64_t v20 = 0LL;
        __clrex();
        goto LABEL_46;
      }

      BOOL v18 = __CFADD__(v17, 0x200000000000LL);
      unint64_t v19 = v17 + 0x200000000000LL;
      if (v18) {
        break;
      }
      unint64_t v17 = __ldxr((unint64_t *)v1);
      if ((v17 & 1) == 0) {
        goto LABEL_39;
      }
    }

    __clrex();
    uint64_t v20 = objc_object::rootRetain_overflow(v1, 1);
  }

  else if ((*(_WORD *)((v17 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
  {
    __clrex();
LABEL_45:
    uint64_t v20 = v1;
  }

  else
  {
LABEL_39:
    __clrex();
    else {
      uint64_t v20 = 0LL;
    }
  }

id objc_loadWeak(id *location)
{
  if (*location) {
    return objc_loadWeakRetained(location);
  }
  else {
    return 0LL;
  }
}

void objc_copyWeak(id *to, id *from)
{
  id WeakRetained = objc_loadWeakRetained(from);
  objc_initWeak(to, WeakRetained);
}

void objc_moveWeak(id *to, id *from)
{
  unint64_t v4 = (unint64_t)*from;
  if (*from)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    while (1)
    {
                                               * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)];
      unsigned int v8 = *(_DWORD *)(StatusReg + 24);
      while (!__ldaxr((unsigned int *)v7))
      {
      }

      __clrex();
      os_unfair_lock_lock_with_options();
LABEL_8:
      if (*from == (id)v4) {
        break;
      }
      int v10 = *(_DWORD *)(StatusReg + 24);
      while (1)
      {
        unsigned int v11 = __ldxr((unsigned int *)v7);
        if (v11 != v10) {
          break;
        }
      }

      __clrex();
                                                                                  * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
LABEL_14:
      unint64_t v4 = (unint64_t)*from;
      if (!*from) {
        goto LABEL_15;
      }
    }

    weak_unregister_no_lock((void *)v7 + 4, v4, (const char *)from, v2);
    weak_register_no_lock((char **)v7 + 4, v4, (uint64_t)to, (char *)2);
    *to = (id)v4;
    *frouint64_t m = 0LL;
    int v12 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v13 = __ldxr((unsigned int *)v7);
      if (v13 != v12) {
        break;
      }
    }

    __clrex();
                                                                                * (unint64_t)(((v4 >> 4) ^ (v4 >> 9)) & 7)]);
  }

  else
  {
LABEL_15:
    *to = 0LL;
  }

void objc_object::clearDeallocating_slow(objc_object *this, uint64_t a2, const char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v7 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)v5))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  Class isa = this->isa;
  if (((uint64_t)this->isa & 0x40000000000LL) != 0)
  {
    weak_clear_no_lock((void *)v5 + 4, this, a3, a4);
    Class isa = this->isa;
  }

  if (((unint64_t)isa & 0x100000000000LL) != 0)
  {
    {
      *int v12 = 2LL;
      *((int32x2_t *)v5 + 2) = vadd_s32(*(int32x2_t *)(v5 + 4), (int32x2_t)0x1FFFFFFFFLL);
    }
  }

  int v10 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v11 = __ldxr((unsigned int *)v5);
    if (v11 != v10) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
}

void objc_object::sidetable_clearDeallocating(objc_object *this)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)v2))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  {
    uint64_t v8 = v13;
    uint64_t v9 = *((void *)v2 + 1);
    uint64_t v10 = v2[6];
  }

  else
  {
    uint64_t v9 = *((void *)v2 + 1);
    uint64_t v10 = v2[6];
    uint64_t v8 = v9 + 16 * v10;
  }

  if (v9 + 16 * v10 != v8)
  {
    if ((*(_BYTE *)(v8 + 8) & 1) != 0) {
      weak_clear_no_lock((void *)v2 + 4, this, v6, v7);
    }
    *(void *)uint64_t v8 = 2LL;
    *((int32x2_t *)v2 + 2) = vadd_s32(*(int32x2_t *)(v2 + 4), (int32x2_t)0x1FFFFFFFFLL);
  }

  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr((unsigned int *)v2);
    if (v12 != v11) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

objc_object *objc_retain_full(objc_object *result, double a2)
{
  if (((unint64_t)result & 0x8000000000000000LL) == 0)
  {
    unint64_t v2 = __ldxr((unint64_t *)result);
    if ((*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x20) & 4) != 0)
    {
      if ((v2 & 1) != 0)
      {
        while (v2 >> 44)
        {
          BOOL v3 = __CFADD__(v2, 0x200000000000LL);
          unint64_t v4 = v2 + 0x200000000000LL;
          if (v3)
          {
            __clrex();
            return objc_object::rootRetain_overflow(result, 0);
          }

          unint64_t v2 = __ldxr((unint64_t *)result);
          if ((v2 & 1) == 0) {
            goto LABEL_14;
          }
        }
      }

      else if ((*(_WORD *)((v2 & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0)
      {
LABEL_14:
        __clrex();
        return objc_object::sidetable_retain(result, 0);
      }

      __clrex();
    }

    else
    {
      __clrex();
      if (*(__int16 *)((v2 & 0xFFFFFFFF8LL) + 0x1E) < 0
        && (*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x20) & 2) != 0
        && (*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x28) & 2) != 0)
      {
        return (objc_object *)swiftRetain(result, a2);
      }

      else
      {
        return -[objc_object retain](result, sel_retain);
      }
    }
  }

  return result;
}

uint64_t objc_release_full(uint64_t result, double a2)
{
  if ((result & 0x8000000000000000LL) == 0)
  {
    unint64_t v2 = __ldxr((unint64_t *)result);
    if ((*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x20) & 4) != 0)
    {
      if ((v2 & 1) != 0)
      {
        while (v2 >> 44)
        {
          BOOL v3 = v2 >= 0x200000000000LL;
          unint64_t v4 = v2 - 0x200000000000LL;
          if (!v3)
          {
            __clrex();
            return objc_object::rootRelease_underflow((objc_object *)result, 1);
          }

          if (!__stlxr(v4, (unint64_t *)result))
          {
            if (!(v4 >> 44))
            {
              __dmb(9u);
              if ((*(_WORD *)((*(void *)result & 0xFFFFFFFF8LL) + 0x1E) & 0x1000) != 0) {
                unsigned int v5 = &selRef__objc_initiateDealloc;
              }
              else {
                unsigned int v5 = &selRef_dealloc;
              }
              return (uint64_t)[(id)result *v5];
            }

            return result;
          }

          unint64_t v2 = __ldxr((unint64_t *)result);
          if ((v2 & 1) == 0) {
            goto LABEL_18;
          }
        }
      }

      else if ((*(_WORD *)((v2 & 0xFFFFFFFF8LL) + 0x1E) & 4) == 0)
      {
LABEL_18:
        __clrex();
        return objc_object::sidetable_release((objc_object *)result, 0, 1);
      }

      __clrex();
    }

    else
    {
      __clrex();
      if (*(__int16 *)((v2 & 0xFFFFFFFF8LL) + 0x1E) < 0
        && (*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x20) & 2) != 0
        && (*(_BYTE *)((v2 & 0xFFFFFFFF8LL) + 0x28) & 2) != 0)
      {
        return swiftRelease((objc_object *)result, a2);
      }

      else
      {
        return (uint64_t)objc_msgSend((id)result, sel_release);
      }
    }
  }

  return result;
}

BOOL objc_isUniquelyReferenced(objc_object *this)
{
  if ((*(_BYTE *)(((uint64_t)this->isa & 0xFFFFFFFF8LL) + 0x20) & 4) != 0)
  {
    objc_object::sidetable_lock(this);
    Class isa = this->isa;
    if (((uint64_t)this->isa & 1) != 0)
    {
      unsigned int v7 = (char *)((unint64_t)isa >> 45);
                                                                   * (unint64_t)(((this >> 4) ^ (this >> 9)) & 7)];
      int v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      while (1)
      {
        unsigned int v10 = __ldxr(&v8->_os_unfair_lock_opaque);
        if (v10 != v9) {
          break;
        }
        if (!__stlxr(0, &v8->_os_unfair_lock_opaque)) {
          return v7 == (char *)1;
        }
      }

      __clrex();
      os_unfair_lock_unlock(v8);
      return v7 == (char *)1;
    }

                                                                 * (unint64_t)(((this >> 4) ^ (this >> 9)) & 7)];
    int v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (1)
    {
      unsigned int v5 = __ldxr(&v3->_os_unfair_lock_opaque);
      if (v5 != v4) {
        break;
      }
      if (!__stlxr(0, &v3->_os_unfair_lock_opaque)) {
        goto LABEL_16;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v3);
LABEL_16:
    int v11 = (char *)objc_object::sidetable_retainCount(this);
  }

  else
  {
    int v11 = (char *)-[objc_object retainCount](this, sel_retainCount);
  }

  unsigned int v7 = v11;
  return v7 == (char *)1;
}

uint64_t _objc_rootIsDeallocating(objc_object *a1)
{
  return objc_object::sidetable_isDeallocating(a1);
}

void objc_clear_deallocating(objc_object *this, uint64_t a2, const char *a3, char *a4)
{
  if (((unint64_t)this & 0x8000000000000000LL) == 0)
  {
    if (((uint64_t)this->isa & 1) != 0)
    {
    }

    else
    {
      objc_object::sidetable_clearDeallocating(this);
    }
  }

uint64_t _objc_rootReleaseWasZero(unint64_t *a1)
{
  unint64_t v1 = __ldxr(a1);
  if ((v1 & 1) != 0)
  {
    while (v1 >> 44)
    {
      BOOL v2 = v1 >= 0x200000000000LL;
      unint64_t v3 = v1 - 0x200000000000LL;
      if (!v2)
      {
        __clrex();
        return objc_object::rootRelease_underflow((objc_object *)a1, 0);
      }

      if (!__stlxr(v3, a1))
      {
        if (v3 >> 44) {
          return 0LL;
        }
        __dmb(9u);
        return 1LL;
      }

      unint64_t v1 = __ldxr(a1);
      if ((v1 & 1) == 0) {
        goto LABEL_15;
      }
    }

    goto LABEL_16;
  }

  if ((*(_WORD *)((v1 & 0xFFFFFFFF8LL) + 0x1E) & 4) != 0)
  {
LABEL_16:
    uint64_t result = 0LL;
    __clrex();
    return result;
  }

id objc_alloc(id result)
{
  if (result)
  {
    if ((*(_WORD *)((*(void *)result & 0xFFFFFFFF8LL) + 0x1E) & 0x4000) != 0) {
      return _objc_rootAllocWithZone((uint64_t)result);
    }
    else {
      return objc_msgSend(result, sel_alloc);
    }
  }

  return result;
}

id objc_allocWithZone(id result)
{
  if (result)
  {
    if ((*(_WORD *)((*(void *)result & 0xFFFFFFFF8LL) + 0x1E) & 0x4000) != 0) {
      return _objc_rootAllocWithZone((uint64_t)result);
    }
    else {
      return objc_msgSend(result, sel_allocWithZone_, 0);
    }
  }

  return result;
}

id objc_alloc_init(id (*a1)(id receiver, SEL sel, ...))
{
  if (a1)
  {
    if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E) & 0x4000) != 0) {
      a1 = _objc_rootAllocWithZone((uint64_t)a1);
    }
    else {
      a1 = (id (*)(id, SEL, ...))objc_msgSend(a1, sel_alloc);
    }
  }

  return objc_msgSend(a1, sel_init);
}

id objc_opt_new(id (*a1)(id receiver, SEL sel, ...))
{
  if (a1 && (int v1 = *(__int16 *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E), v1 < 0))
  {
    if ((v1 & 0x4000) != 0) {
      a1 = _objc_rootAllocWithZone((uint64_t)a1);
    }
    else {
      a1 = (id (*)(id, SEL, ...))objc_msgSend(a1, sel_alloc);
    }
    BOOL v2 = (SEL *)&selRef_init;
  }

  else
  {
    BOOL v2 = (SEL *)&selRef_new;
  }

  return [a1 *v2];
}

uint64_t objc_opt_self(uint64_t result)
{
  return result;
}

unint64_t objc_opt_class(unint64_t result)
{
  if (result)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      uint64_t v1 = objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      uint64_t v1 = *(void *)result & 0xFFFFFFFF8LL;
    }

    int v2 = *(__int16 *)(v1 + 30);
    if (v2 < 0)
    {
      if ((v2 & 4) == 0) {
        return v1;
      }
    }

    else
    {
      return (unint64_t)objc_msgSend((id)result, sel_class);
    }
  }

  return result;
}

unint64_t objc_opt_isKindOfClass(unint64_t result, uint64_t a2)
{
  if (result)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      uint64_t v2 = objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      uint64_t v2 = *(void *)result & 0xFFFFFFFF8LL;
    }

    if (*(__int16 *)(v2 + 30) < 0)
    {
      if (v2 == a2)
      {
        return 1LL;
      }

      else
      {
        do
        {
          uint64_t v2 = *(void *)(v2 + 8);
          if (v2) {
            BOOL v3 = v2 == a2;
          }
          else {
            BOOL v3 = 1;
          }
        }

        while (!v3);
        return v2 != 0;
      }
    }

    else
    {
      return (unint64_t)objc_msgSend((id)result, sel_isKindOfClass_, a2);
    }
  }

  return result;
}

objc_object *objc_opt_respondsToSelector(objc_object *result, objc_selector *a2)
{
  if (result)
  {
    if (((unint64_t)result & 0x8000000000000000LL) != 0)
    {
      uint64_t v2 = objc_debug_taggedpointer_classes[result & 7];
    }

    else
    {
      uint64_t v2 = (uint64_t)result->isa & 0xFFFFFFFF8LL;
    }

    else {
      return (objc_object *)-[objc_object respondsToSelector:](result, sel_respondsToSelector_, a2);
    }
  }

  return result;
}

void _objc_rootFinalize(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
}

uint64_t _objc_rootZone()
{
  return 0LL;
}

uint64_t *AutoreleasePoolPage::push(objc_object *this, uint64_t a2, char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 352);
  unsigned int v6 = (objc_object *)(v5 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v5 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    if ((v5 & 2) != 0)
    {
      unint64_t v7 = *(void *)(StatusReg + 344);
      if (v7 >= 2)
      {
        if (*(_DWORD *)v7 != -1583242847) {
          AutoreleasePoolPage::busted_die(*(AutoreleasePoolPage **)(StatusReg + 344), (uint64_t)v6, a3, a4);
        }
        if (*(void *)(v7 + 16) == v7 + 4096) {
          this = (objc_object *)AutoreleasePoolPage::autoreleaseFullPage( v6,  *(objc_object **)(StatusReg + 344),  (AutoreleasePoolPage *)a3,  a4);
        }
        else {
          this = (objc_object *)AutoreleasePoolPage::add(*(AutoreleasePoolPage **)(StatusReg + 344), (uint64_t)v6);
        }
      }

      else
      {
        this = (objc_object *)AutoreleasePoolPage::autoreleaseNoPage(v6, v6);
      }
    }

    else
    {
      *(void *)(StatusReg + 352) = -1LL;
      *(void *)(StatusReg + 360) = 0LL;
      this = v6;
    }
  }

  *(void *)(StatusReg + 352) = 0LL;
  *(void *)(StatusReg + 360) = 0LL;
  if (DebugPoolAllocation) {
    return AutoreleasePoolPage::autoreleaseNewPage((AutoreleasePoolPage *)this, v6, a3, a4);
  }
  uint64_t v8 = *(objc_object **)(StatusReg + 344);
  if (LODWORD(v8->isa) != -1583242847) {
    AutoreleasePoolPage::busted_die(*(AutoreleasePoolPage **)(StatusReg + 344), (uint64_t)v8, a3, a4);
  }
  Class isa = v8[2].isa;
  if (isa == (objc_class *)&v8[512]) {
    return AutoreleasePoolPage::autoreleaseFullPage(0LL, v8, (AutoreleasePoolPage *)a3, a4);
  }
  v8[2].Class isa = isa + 1;
  isa->Class isa = 0LL;
  return (uint64_t *)isa;
}

uint64_t *AutoreleasePoolPage::autoreleaseNewPage( AutoreleasePoolPage *this, objc_object *a2, char *a3, char *a4)
{
  int v4 = *(objc_object **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 344);
  if (LODWORD(v4->isa) != -1583242847) {
    AutoreleasePoolPage::busted_die((AutoreleasePoolPage *)v4, (uint64_t)v4, a3, a4);
  }
  return AutoreleasePoolPage::autoreleaseFullPage(0LL, v4, (AutoreleasePoolPage *)a3, a4);
}

void objc_autoreleasePoolPop(void *context)
{
  unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = (void *)(StatusReg[44] & 0xFFFFFFFFFFFFFFFCLL);
  if (v6)
  {
    unint64_t v7 = StatusReg + 44;
    do
    {
      *unint64_t v7 = 0LL;
      StatusReg[45] = 0LL;

      unsigned int v6 = (void *)(*v7 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v6);
  }

  if (context == (void *)1)
  {
    uint64_t v8 = (void *)StatusReg[43];
    if ((unint64_t)v8 < 2)
    {
      StatusReg[43] = 0LL;
      return;
    }

    if (*(_DWORD *)v8 != -1583242847) {
LABEL_6:
    }
      AutoreleasePoolPage::busted_die((AutoreleasePoolPage *)v8, (uint64_t)v1, v2, v3);
    while (1)
    {
      int v9 = (AutoreleasePoolPage *)v8[4];
      if (!v9) {
        break;
      }
      uint64_t v8 = (void *)v8[4];
      if (*(_DWORD *)v9 != -1583242847) {
        AutoreleasePoolPage::busted_die(v9, (uint64_t)v1, v2, v3);
      }
    }

    context = v8 + 7;
  }

  else
  {
    uint64_t v8 = (void *)((unint64_t)context & 0xFFFFFFFFFFFFF000LL);
  }

  if (*(void *)context && (context != v8 + 7 || v8[4]))
  {
    AutoreleasePoolPage::badPop((AutoreleasePoolPage *)context, v1);
  }

  else
  {
    else {
      BOOL v10 = DebugPoolAllocation == 0;
    }
    if (v10 && DebugMissingPools == 0)
    {
      AutoreleasePoolPage::releaseUntil((objc_object ***)v8, (objc_object **)context, v2, v3);
      unsigned int v15 = (AutoreleasePoolPage *)v8[5];
      if (v15)
      {
        if (v8[2] - (void)v8 - 56LL < 2016 || (unsigned int v15 = (AutoreleasePoolPage *)*((void *)v15 + 5)) != 0LL) {
          AutoreleasePoolPage::kill(v15, v12, v13, v14);
        }
      }
    }

    else
    {
      AutoreleasePoolPage::popPageDebug( (AutoreleasePoolPage **)v8,  (objc_object **)context,  (AutoreleasePoolPage *)v2,  (objc_object **)v3);
    }
  }

void *AutoreleasePoolPage::releaseUntil(objc_object ***this, objc_object **a2, const char *a3, char *a4)
{
  unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    while (this[2] != a2)
    {
      unint64_t v7 = (AutoreleasePoolPage *)StatusReg[43];
      if (!v7) {
        goto LABEL_11;
      }
      if (v7 == (AutoreleasePoolPage *)1)
      {
        unint64_t v7 = 0LL;
        goto LABEL_11;
      }

      if (*(_DWORD *)v7 != -1583242847) {
LABEL_20:
      }
        AutoreleasePoolPage::busted_die(v7, (uint64_t)a2, a3, a4);
LABEL_11:
      while (1)
      {
        uint64_t v8 = (void *)*((void *)v7 + 2);
        unint64_t v7 = (AutoreleasePoolPage *)*((void *)v7 + 4);
        if (v7 && *(_DWORD *)v7 != -1583242847) {
          goto LABEL_20;
        }
        StatusReg[43] = v7;
      }

      *((void *)v7 + 2) = v8 - 1;
      unint64_t v9 = *(v8 - 1);
      *(v8 - _class_addProperty(cls, name, attributes, attributeCount, 1) = 0xA3A3A3A3A3A3A3A3LL;
      BOOL v10 = (void *)(v9 & 0xF00FFFFFFFFFFFFLL);
      if ((v9 & 0xF00FFFFFFFFFFFFLL) != 0)
      {
        int v11 = ((v9 >> 60) | (v9 >> 44) & 0xFF0) + 1;
        do
        {

          --v11;
        }

        while (v11);
      }
    }

    uint64_t result = (void *)(StatusReg[44] & 0xFFFFFFFFFFFFFFFCLL);
    if (!result) {
      break;
    }
    StatusReg[44] = 0LL;
    StatusReg[45] = 0LL;
  }

  if (*(_DWORD *)this != -1583242847) {
    AutoreleasePoolPage::busted_die((AutoreleasePoolPage *)this, (uint64_t)a2, a3, a4);
  }
  StatusReg[43] = this;
  return result;
}

void AutoreleasePoolPage::kill(AutoreleasePoolPage *this, uint64_t a2, const char *a3, char *a4)
{
  uint64_t v5 = this;
  do
  {
    unsigned int v6 = v5;
    uint64_t v5 = (AutoreleasePoolPage *)*((void *)v5 + 5);
  }

  while (v5);
  unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
    uint64_t v8 = (AutoreleasePoolPage *)*((void *)v6 + 4);
    if (v8) {
      *((void *)v8 + 5) = 0LL;
    }
    if (*(_DWORD *)v6 != -1583242847
      || strncmp((const char *)v6 + 4, "AUTORELEASE!", 0xCuLL)
      || *((void *)v6 + 3) != *StatusReg)
    {
      AutoreleasePoolPage::busted_die(v6, a2, a3, a4);
    }

    *(void *)unsigned int v6 = 0LL;
    *((void *)v6 + _class_addProperty(cls, name, attributes, attributeCount, 1) = 0LL;
    free(v6);
    BOOL v9 = v6 == this;
    unsigned int v6 = v8;
  }

  while (!v9);
}

void sub_180045E98(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  v1[1] = 0LL;
  _Unwind_Resume(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(uint64_t **)(StatusReg + 352);
  moveTLSAutoreleaseToPool(v6, *(void *)(StatusReg + 360), v1, v2);
  if ((uint64_t)a1 <= 0)
  {
    *(void *)(StatusReg + 352) = 0LL;
    *(void *)(StatusReg + 360) = 0LL;
    return a1;
  }

  BOOL v9 = (objc_class *)(*(void *)a1 & 0xFFFFFFFF8LL);
  Class isa = v9[4].isa;
  int v11 = *(_DWORD *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  int v12 = v11;
  if ((v11 & 1) == 0) {
    int v12 = *(_DWORD *)(*(void *)(((uint64_t)v9->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v12 & 0x20000000) != 0)
  {
    if ((isa & 4) != 0)
    {
LABEL_8:
      *(void *)(StatusReg + 352) = (unint64_t)a1 & 0xFFFFFFFFFFFFFFFCLL | 1;
      *(void *)(StatusReg + 360) = v3;
      return a1;
    }
  }

  else
  {
    class_initialize(v9, (objc_object *)a1, v7, v8);
    if ((*(void *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x20) & 4) != 0) {
      goto LABEL_8;
    }
  }

  if (*v3 == -1440939011) {
    goto LABEL_8;
  }
  return a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(uint64_t **)(StatusReg + 352);
  uint64_t v7 = v3;
  moveTLSAutoreleaseToPool(v6, *(void *)(StatusReg + 360), v1, v2);
  if ((uint64_t)a1 < 1)
  {
    unint64_t v14 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_10;
  }

  BOOL v10 = (objc_class *)(*(void *)a1 & 0xFFFFFFFF8LL);
  Class isa = v10[4].isa;
  int v12 = *(_DWORD *)((unint64_t)isa & 0xF00007FFFFFFFF8LL);
  int v13 = v12;
  if ((v12 & 1) == 0) {
    int v13 = *(_DWORD *)(*(void *)(((uint64_t)v10->isa & 0xFFFFFFFF8LL) + 0x20) & 0xF00007FFFFFFFF8LL);
  }
  if ((v13 & 0x20000000) != 0)
  {
    if ((isa & 4) != 0)
    {
LABEL_8:
      unint64_t v14 = (unint64_t)a1 & 0xFFFFFFFFFFFFFFFCLL | 1;
LABEL_10:
      *(void *)(StatusReg + 352) = v14;
      *(void *)(StatusReg + 360) = v7;
      return a1;
    }
  }

  else
  {
    class_initialize(v10, (objc_object *)a1, v8, v9);
    if ((*(void *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x20) & 4) != 0) {
      goto LABEL_8;
    }
  }

  if (*v3 == -1440939011) {
    goto LABEL_8;
  }
  return (objc_object *)a1;
}

objc_object *objc_object *a1
{
  return a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(uint64_t **)(StatusReg + 352);
  if (v6 != (uint64_t *)-1LL)
  {
    uint64_t v7 = *(_DWORD **)(StatusReg + 360);
    if ((unint64_t)v6 > 3 || v7 != 0LL)
    {
      *(void *)(StatusReg + 352) = 0LL;
      *(void *)(StatusReg + 360) = 0LL;
      if (v3 - (void)v7 == 8 || *v7 == -1440939011)
      {
      }

      else if ((v6 & 1) != 0)
      {
        moveTLSAutoreleaseToPool(v6, (uint64_t)v7, v1, v2);
      }
    }
  }

  return a1;
}

id objc_claimAutoreleasedReturnValue(id a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v7 = *(uint64_t **)(StatusReg + 352);
  if (v7 != (uint64_t *)-1LL)
  {
    uint64_t v8 = *(void *)(StatusReg + 360);
    if ((unint64_t)v7 > 3 || v8 != 0)
    {
      *(void *)(StatusReg + 352) = 0LL;
      *(void *)(StatusReg + 360) = 0LL;
      if (v4 - v8 == 4)
      {
      }

      else if ((v7 & 1) != 0)
      {
        moveTLSAutoreleaseToPool(v7, v8, a3, a4);
      }
    }
  }

  return a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(uint64_t **)(StatusReg + 352);
  if (v6 != (uint64_t *)-1LL)
  {
    uint64_t v7 = *(_DWORD **)(StatusReg + 360);
    if ((unint64_t)v6 > 3 || v7 != 0LL)
    {
      *(void *)(StatusReg + 352) = 0LL;
      *(void *)(StatusReg + 360) = 0LL;
      if (v3 - (void)v7 == 8 || *v7 == -1440939011)
      {
      }

      else if ((v6 & 1) != 0)
      {
        moveTLSAutoreleaseToPool(v6, (uint64_t)v7, v1, v2);
      }
    }
  }

  return a1;
}

objc_object *objc_releaseAndReturn(objc_object *a1)
{
  return a1;
}

id objc_retainAutorelease(id a1)
{
  return a1;
}

id _objc_deallocOnMainThreadHelper(void *a1)
{
  return objc_msgSend(a1, sel_dealloc);
}

void *objc_tls_direct_base<unsigned long,(tls_key)4,ReturnAutoreleaseInfo::TlsDealloc>::dtor_(uint64_t a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t result = (void *)(*(void *)(StatusReg + 352) & 0xFFFFFFFFFFFFFFFCLL);
  if (result)
  {
    uint64_t v3 = (void *)(StatusReg + 352);
    do
    {
      *uint64_t v3 = 0LL;
      v3[1] = 0LL;

      uint64_t result = (void *)(*v3 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (result);
  }

  return result;
}

void objc_tls_direct_base<AutoreleasePoolPage *,(tls_key)3,AutoreleasePoolPage::HotPageDealloc>::dtor_( AutoreleasePoolPage **this, uint64_t a2, const char *a3, char *a4)
{
  unint64_t StatusReg = (void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = (void *)(StatusReg[44] & 0xFFFFFFFFFFFFFFFCLL);
  if (v6)
  {
    uint64_t v7 = StatusReg + 44;
    do
    {
      *uint64_t v7 = 0LL;
      StatusReg[45] = 0LL;

      unsigned int v6 = (void *)(*v7 & 0xFFFFFFFFFFFFFFFCLL);
    }

    while (v6);
  }

  if (this != (AutoreleasePoolPage **)1)
  {
    if (this)
    {
      if (*(_DWORD *)this != -1583242847) {
        AutoreleasePoolPage::busted_die((AutoreleasePoolPage *)this, a2, a3, a4);
      }
      uint64_t v8 = StatusReg + 43;
      StatusReg[43] = this;
      while (1)
      {
        BOOL v9 = this[4];
        if (!v9) {
          break;
        }
        this = (AutoreleasePoolPage **)this[4];
        if (*(_DWORD *)v9 != -1583242847) {
          AutoreleasePoolPage::busted_die(v9, a2, a3, a4);
        }
      }

      if (this[2] != (AutoreleasePoolPage *)(this + 7)) {
        objc_autoreleasePoolPop(this + 7);
      }
      if (!(DebugMissingPools | DebugPoolAllocation)) {
        AutoreleasePoolPage::kill((AutoreleasePoolPage *)this, a2, a3, a4);
      }
    }

    else
    {
      uint64_t v8 = StatusReg + 43;
    }

    *uint64_t v8 = 0LL;
  }

void weakTableScan(void *a1)
{
  timespec __rqtp = (timespec)xmmword_180050870;
  uint64_t v1 = getenv("OBJC_DEBUG_SCAN_WEAK_TABLES_INTERVAL_NANOSECONDS");
  if (v1)
  {
    unint64_t v2 = strtoull(v1, 0LL, 10);
    __rqtp.tv_sec = v2 / 0x3B9ACA00;
    __rqtp.tv_nsec = v2 % 0x3B9ACA00;
  }

  uint64_t v3 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    nanosleep(&__rqtp, 0LL);
    unsigned int v9 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr((unsigned int *)v5))
    {
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_9:
    unint64_t v11 = *((void *)v5 + 6);
    if (v11)
    {
      unint64_t v12 = 0LL;
      uint64_t v13 = *((void *)v5 + 4);
      do
      {
        unint64_t v14 = (uint64_t *)(v13 + 40 * v12);
        unsigned int v15 = v14 + 1;
        if ((v14[2] & 3) == 2)
        {
          unsigned int v15 = (void *)*v15;
          uint64_t v16 = *(void *)(v13 + 40 * v12 + 24) + 1LL;
        }

        else
        {
          uint64_t v16 = 4LL;
        }

        uint64_t v17 = *v14;
        if (v17) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          uint64_t v19 = -v17;
          do
          {
            if (*v15)
            {
              uint64_t v20 = (void *)-*v15;
              if (*v20 != v19) {
                _objc_fatal("Weak reference at %p contains %p, should contain %p", v6, v7, v8, v20, *v20, v19);
              }
            }

            ++v15;
            --v16;
          }

          while (v16);
        }

        ++v12;
      }

      while (v12 <= v11);
    }

    int v21 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v22 = __ldxr((unsigned int *)v5);
      if (v22 != v21) {
        break;
      }
    }

    __clrex();
LABEL_28:
    if (v3 == 7) {
      uint64_t v3 = 0LL;
    }
    else {
      ++v3;
    }
  }

uint64_t header_info::selrefs(header_info *this, unint64_t *a2)
{
  uint64_t result = _dyld_lookup_section_info();
  unint64_t v5 = v4 >> 3;
  if (!result) {
    unint64_t v5 = 0LL;
  }
  *a2 = v5;
  return result;
}

uint64_t header_info::classlist(header_info *this, unint64_t *a2)
{
  uint64_t result = _dyld_lookup_section_info();
  unint64_t v5 = v4 >> 3;
  if (!result) {
    unint64_t v5 = 0LL;
  }
  *a2 = v5;
  return result;
}

uint64_t header_info::nlclslist(header_info *this, unint64_t *a2)
{
  uint64_t result = _dyld_lookup_section_info();
  unint64_t v5 = v4 >> 3;
  if (!result) {
    unint64_t v5 = 0LL;
  }
  *a2 = v5;
  return result;
}

uint64_t header_info::catlist(header_info *this, unint64_t *a2)
{
  uint64_t result = _dyld_lookup_section_info();
  unint64_t v5 = v4 >> 3;
  if (!result) {
    unint64_t v5 = 0LL;
  }
  *a2 = v5;
  return result;
}

uint64_t header_info::protocollist(header_info *this, unint64_t *a2)
{
  uint64_t result = _dyld_lookup_section_info();
  unint64_t v5 = v4 >> 3;
  if (!result) {
    unint64_t v5 = 0LL;
  }
  *a2 = v5;
  return result;
}

uint64_t __getSharedCachePreoptimizedProtocol_block_invoke( uint64_t result, unint64_t a2, int a3, _BYTE *a4)
{
  if (a3)
  {
    if (dataSegmentsRanges <= a2 && *(void *)algn_18C43FCB8 > a2)
    {
      **(void **)(result + 32) = a2;
      *a4 = 1;
    }
  }

  return result;
}

uint64_t __copy_helper_block_e8_32c47_ZTSKZ34getSharedCachePreoptimizedProtocolE3__0( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t getPreoptimizedProtocol()
{
  if (DisablePreopt || preoptimized != 1) {
    return 0LL;
  }
  _dyld_for_each_objc_protocol();
  return 0LL;
}

uint64_t __getPreoptimizedProtocol_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  if (a3)
  {
    **(void **)(result + 32) = a2;
    *a4 = 1;
  }

  return result;
}

uint64_t __copy_helper_block_e8_32c36_ZTSKZ23getPreoptimizedProtocolE3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t __getPreoptimizedClass_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  if (a3)
  {
    **(void **)(result + 32) = a2;
    *a4 = 1;
  }

  return result;
}

uint64_t __copy_helper_block_e8_32c33_ZTSKZ20getPreoptimizedClassE3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t __getPreoptimizedClassesWithMetaClass_block_invoke(uint64_t result, void *a2, int a3, _BYTE *a4)
{
  if (a3)
  {
    if (*(void *)(result + 40) == (*a2 & 0xFFFFFFFF8LL))
    {
      **(void **)(result + 32) = a2;
      *a4 = 1;
    }
  }

  return result;
}

__n128 __copy_helper_block_e8_32c48_ZTSKZ35getPreoptimizedClassesWithMetaClassE3__0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t getPreoptimizedHeaderRW(uint64_t a1)
{
  if ((*(_BYTE *)(*(void *)(a1 + 8) + a1 + 8 + 4) & 8) == 0) {
    return 0LL;
  }
  if (!headerInfoROs || objc_debug_headerInfoRWs == 0) {
    return 0LL;
  }
  else {
    return objc_debug_headerInfoRWs
  }
}

void cache_t::bad_cache(objc_class *this, objc_object *a2, objc_selector *a3)
{
  if (a2) {
    uint64_t v6 = "receiver";
  }
  else {
    uint64_t v6 = "unused";
  }
  _objc_inform_now_and_on_crash( "%s %p, SEL %p, isa %p, cache %p, buckets and mask 0x%lx, occupied 0x%x",  v6,  a2,  a3,  &this[-2],  this,  this->isa,  WORD2(this[1].isa));
  size_t v7 = malloc_size(a2);
  size_t v8 = malloc_size((const void *)((uint64_t)this->isa & 0xFFFFFFFFFFFLL));
  _objc_inform_now_and_on_crash("%s %zu bytes, buckets %zu bytes", v6, v7, v8);
  unsigned int v9 = "<null selector>";
  if (a3) {
    unsigned int v9 = (const char *)a3;
  }
  _objc_inform_now_and_on_crash("selector '%s'", v9);
  BOOL v10 = (const char *)objc_class::nameForLogging(this - 2);
  _objc_inform_now_and_on_crash("isa '%s'", v10);
  _objc_fatal( "Method cache corrupted. This may be a message to an invalid object, or a memory error somewhere else.",  v11,  v12,  v13);
}

void _objc_error(objc_object *a1, va_list a2, char *a3)
{
  ClassName = object_getClassName(a1);
  _objc_fatal("%s: %s", v5, v6, v7, ClassName, v8);
}

void _objc_fatal(char *a1, uint64_t a2, const char *a3, char *a4, ...)
{
}

void _objc_fatalv(char *a1, va_list a2, const char *a3, char *a4)
{
  pid_t v4 = getpid();
  asprintf(&v7, "objc[%d]: %s\n", v4, v8);
  _objc_syslog(v7);
  if (!DebugDontCrash)
  {
    _objc_crashlog(v8);
    abort_with_reason();
  }

  pid_t v5 = getpid();
  asprintf(&v6, "objc[%d]: HALTED\n", v5);
  _objc_syslog(v6);
  _Exit(1);
}

void __objc_error(objc_object *a1, const char *a2, char *a3, ...)
{
}

void _objc_inform(const char *a1, ...)
{
  pid_t v1 = getpid();
  asprintf(&v2, "objc[%d]: %s\n", v1, v3[0]);
  _objc_syslog(v2);
  free(v2);
  free(v3[0]);
}

void _objc_inform_now_and_on_crash(const char *a1, ...)
{
  pid_t v1 = getpid();
  asprintf(&__s1, "objc[%d]: %s\n", v1, v3[0]);
  _objc_crashlog(__s1);
  _objc_syslog(__s1);
  free(__s1);
  free(v3[0]);
}

uint64_t _objc_inform_deprecated(const char *a1, const char *a2)
{
  if (PrintDeprecation) {
    _objc_inform( "The function %s is obsolete. Do not use it. Set a breakpoint on _objc_warn_deprecated to find the culprit.",  a1);
  }
  return gdb_objc_class_changed(a1);
}

void objc_exception_throw(id exception)
{
  v9[500] = *(void **)MEMORY[0x1895F89C0];
  unint64_t v2 = __cxa_allocate_exception(0x20uLL);
  unint64_t v3 = exception_preprocessor((objc_object *)exception);
  objc_msgSend((id)v3, sel_retain);
  *unint64_t v2 = v3;
  v2[1] = off_18961D718;
  v2[2] = object_getClassName((id)v3);
  if (v3)
  {
    if ((v3 & 0x8000000000000000LL) != 0)
    {
      pid_t v4 = (__objc2_class *)objc_debug_taggedpointer_classes[v3 & 7];
    }

    else
    {
      pid_t v4 = (__objc2_class *)(*(void *)v3 & 0xFFFFFFFF8LL);
    }
  }

  else
  {
    pid_t v4 = 0LL;
  }

  v2[3] = v4;
  if (PrintExceptions)
  {
    ClassName = object_getClassName((id)v3);
    _objc_inform("EXCEPTIONS: throwing %p (object %p, a %s)", v2, (const void *)v3, ClassName);
  }

  if (PrintExceptionThrow)
  {
    if (!PrintExceptions)
    {
      uint64_t v6 = object_getClassName((id)v3);
      _objc_inform("EXCEPTIONS: throwing %p (object %p, a %s)", v2, (const void *)v3, v6);
    }

    int v7 = backtrace(v9, 500);
    int v8 = fileno((FILE *)*MEMORY[0x1895F89D0]);
    backtrace_symbols_fd(v9, v7, v8);
  }

  __cxa_throw(v2, (struct type_info *)(v2 + 1), (void (*)(void *))_objc_exception_destructor);
}

void objc_exception_rethrow(void)
{
}

void objc_terminate(void)
{
}

void objc::DenseMapBase<objc::DenseMap<objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>,objc_class *,PendingInitialize *,objc::DenseMapValueInfo<PendingInitialize *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,PendingInitialize *>>::FatalCorruptHashTables( uint64_t a1, void *ptr, uint64_t a3)
{
  size_t v6 = malloc_size(ptr);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v7,  v8,  v9,  a1,  ptr,  v6,  a3,  *(unsigned int *)(a1 + 8),  *(unsigned int *)(a1 + 12),  *ptr,  ptr[1],  ptr[2],  ptr[3]);
}

void objc::DenseMapBase<objc::DenseMap<method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>,method_t const*,void *,objc::DenseMapValueInfo<void *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,void *>>::FatalCorruptHashTables( void *a1, uint64_t a2)
{
  size_t v4 = malloc_size(a1);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v5,  v6,  v7,  &objc::smallMethodIMPMap,  a1,  v4,  a2,  qword_18C43ED38,  HIDWORD(qword_18C43ED38),  *a1,  a1[1],  a1[2],  a1[3]);
}

void objc::DenseMapBase<objc::DenseMap<method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>,method_t const*,objc_method_description *,objc::DenseMapValueInfo<objc_method_description *>,objc::DenseMapInfo<method_t const*>,objc::detail::DenseMapPair<method_t const*,objc_method_description *>>::FatalCorruptHashTables( void *a1, uint64_t a2)
{
  size_t v4 = malloc_size(a1);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v5,  v6,  v7,  &objc::methodDescriptionMap,  a1,  v4,  a2,  qword_18C43F058,  HIDWORD(qword_18C43F058),  *a1,  a1[1],  a1[2],  a1[3]);
}

void objc::DenseMapBase<objc::DenseMap<objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>,objc_class *,objc_class *,objc::DenseMapValueInfo<objc_class *>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc_class *>>::FatalCorruptHashTables( void *a1, uint64_t a2)
{
  size_t v4 = malloc_size(a1);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v5,  v6,  v7,  &remappedClasses(BOOL)::remapped_class_map,  a1,  v4,  a2,  qword_18C43F038,  HIDWORD(qword_18C43F038),  *a1,  a1[1],  a1[2],  a1[3]);
}

void objc::DenseMapBase<objc::DenseMap<objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>,objc_class *,objc::category_list,objc::DenseMapValueInfo<objc::category_list>,objc::DenseMapInfo<objc_class *>,objc::detail::DenseMapPair<objc_class *,objc::category_list>>::FatalCorruptHashTables( void *a1, uint64_t a2)
{
  size_t v4 = malloc_size(a1);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v5,  v6,  v7,  &objc::unattachedCategories,  a1,  v4,  a2,  qword_18C43F840,  HIDWORD(qword_18C43F840),  *a1,  a1[1],  a1[2],  a1[3]);
}

void printReplacements(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  if ((_DWORD)a3)
  {
    uint64_t v4 = 0LL;
    __int16 v65 = *(_WORD *)(a1 + 30);
    uint64_t v60 = a3;
    unint64_t v6 = dataSegmentsRanges;
    unint64_t v5 = *(void *)algn_18C43FCB8;
    do
    {
      uint64_t v7 = 3LL;
      if ((v65 & 4) == 0) {
        uint64_t v7 = 2LL;
      }
      unint64_t v61 = *(const char ***)(a2 + 16 * v4);
      int v8 = (int *)v61[v7];
      if (v8)
      {
        unint64_t v9 = *v8;
        unint64_t v10 = (unint64_t)(v8 + 2) & 0xFFFFFFFFFFFFFFFCLL | (v9 >> 31);
        entsize_list_tt<method_t,method_list_t,4294901763u,method_t::pointer_modifier>::signedEnd(v8, a2, a3, a4);
        uint64_t v62 = a2;
        if (v10 != a2)
        {
          unsigned int v11 = v9 & 0xFFFC;
          do
          {
            unsigned int v64 = v11;
            if ((v10 & 3) != 0 && (v10 & 3) != 2)
            {
              unint64_t v13 = v10 & 0xFFFFFFFFFFFFFFFCLL;
              uint64_t v14 = *(int *)(v10 & 0xFFFFFFFFFFFFFFFCLL);
              if (v6 <= (v10 & 0xFFFFFFFFFFFFFFFCLL) && v5 > v13) {
                unint64_t v12 = (char *)&unk_18E7BB5A8 + v14;
              }
              else {
                unint64_t v12 = *(char **)(v13 + v14);
              }
            }

            else
            {
              unint64_t v12 = *(char **)(v10 & 0xFFFFFFFFFFFFFFFCLL);
            }

            uint64_t v19 = (char *)__sel_registerName(v12, 1, 1);
            if (v4)
            {
              uint64_t v20 = 0LL;
              while (1)
              {
                uint64_t v21 = 24LL;
                if ((v65 & 4) == 0) {
                  uint64_t v21 = 16LL;
                }
                unsigned int v22 = *(unsigned int **)(*(void *)(a2 + 16 * v20) + v21);
                if (v22)
                {
                  unint64_t v23 = *v22;
                  uint64_t v24 = v22[1];
                  unsigned int v25 = *v22 & 0xFFFC;
                  unint64_t v26 = v24 * (unint64_t)((unsigned __int16)v23 & 0xFFFC);
                  if ((v26 & 0xFFFFFFFF00000000LL) != 0) {
                    _objc_fatal( "entsize_list_tt overflow: index %u in list %p with entsize %u",  v16,  v17,  v18,  v24,  v22,  v23 & 0xFFFC);
                  }
                  unint64_t v27 = (unint64_t)(v22 + 2);
                  unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFFCLL | (v23 >> 31);
                  unint64_t v29 = (v27 + v26) & 0xFFFFFFFFFFFFFFFCLL | (v23 >> 31);
                  if (v28 != v29) {
                    break;
                  }
                }

LABEL_35:
                if (++v20 == v4) {
                  goto LABEL_36;
                }
              }

              while (1)
              {
                if ((v28 & 3) != 0 && (v28 & 3) != 2)
                {
                  unint64_t v31 = v28 & 0xFFFFFFFFFFFFFFFCLL;
                  uint64_t v32 = *(int *)(v28 & 0xFFFFFFFFFFFFFFFCLL);
                  BOOL v33 = v6 <= (v28 & 0xFFFFFFFFFFFFFFFCLL) && v5 > v31;
                  unsigned int v30 = v33 ? (char *)&unk_18E7BB5A8 + v32 : *(char **)(v31 + v32);
                }

                else
                {
                  unsigned int v30 = *(char **)(v28 & 0xFFFFFFFFFFFFFFFCLL);
                }

                if (v19 == __sel_registerName(v30, 1, 1)) {
                  break;
                }
                v28 += v25;
                if (v28 == v29) {
                  goto LABEL_35;
                }
              }

              unsigned int v40 = (const char *)objc_class::nameForLogging((objc_class *)a1);
              int v41 = (*(unsigned __int16 *)(a1 + 30) >> 2) & 1;
              unsigned int v42 = *v61;
              uint64_t v43 = (void *)method_t::impRaw(v28);
              unsigned int v44 = (const void *)method_t::impRaw(v10);
              logReplacedMethod(v40, v19, v41, v42, v43, v44);
              unsigned int v39 = v64;
            }

            else
            {
LABEL_36:
              uint64_t v34 = *(void *)((*(void *)(a1 + 32) & 0xF00007FFFFFFFF8LL) + 8);
              unint64_t v35 = v34 & 0xFFFFFFFFFFFFFFFELL;
              if ((v34 & 1) != 0)
              {
                unint64_t v37 = *(void *)(v35 + 8);
                unsigned int v39 = v64;
              }

              else
              {
                uint64_t v36 = *(void *)(v35 + 32);
                unint64_t v37 = v36 & 0xFFFFFFFFFFFFFFFELL;
                if ((v36 & 1) != 0) {
                  unint64_t v38 = v36 & 0xFFFFFFFFFFFFFFFELL;
                }
                else {
                  unint64_t v38 = 0LL;
                }
                unsigned int v39 = v64;
                if ((v36 & 1) != 0 || !v37)
                {
                  unint64_t v37 = v38 | 2;
                  if (!v38) {
                    unint64_t v37 = 0LL;
                  }
                }
              }

              v70[0] = v37;
              list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::begin((uint64_t)v68, v70, v17, v18);
              list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::end((uint64_t)v67, v70, v45, v46);
              while (!list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator==( (uint64_t)v68,  v67))
              {
                unint64_t v47 = v69;
                if ((v69 & 3) != 0 && (v69 & 3) != 2)
                {
                  unint64_t v52 = v69 & 0xFFFFFFFFFFFFFFFCLL;
                  uint64_t v53 = *(int *)(v69 & 0xFFFFFFFFFFFFFFFCLL);
                  if (v6 <= (v69 & 0xFFFFFFFFFFFFFFFCLL) && v5 > v52) {
                    uint64_t v48 = (char *)&unk_18E7BB5A8 + v53;
                  }
                  else {
                    uint64_t v48 = *(char **)(v52 + v53);
                  }
                }

                else
                {
                  uint64_t v48 = *(char **)(v69 & 0xFFFFFFFFFFFFFFFCLL);
                }

                if (v19 == __sel_registerName(v48, 1, 1))
                {
                  unint64_t v55 = (const char *)objc_class::nameForLogging((objc_class *)a1);
                  int v56 = (*(unsigned __int16 *)(a1 + 30) >> 2) & 1;
                  unint64_t v57 = *v61;
                  unint64_t v58 = (void *)method_t::impRaw(v47);
                  uint64_t v59 = (const void *)method_t::impRaw(v10);
                  logReplacedMethod(v55, v19, v56, v57, v58, v59);
                  break;
                }

                list_array_tt<method_t,method_list_t,method_list_t_authed_ptr>::iteratorImpl<false>::operator++( v68,  v49,  v50,  v51);
              }
            }

            v10 += v39;
            unsigned int v11 = v39;
          }

          while (v10 != v62);
        }
      }

      ++v4;
    }

    while (v4 != v60);
  }

void objc_defaultForwardHandler(objc_object *a1, objc_selector *a2)
{
  Class Class = object_getClass(a1);
  uint64_t v5 = 45LL;
  if (Class)
  {
    if ((HIWORD(Class[3].isa) & 4) != 0) {
      uint64_t v5 = 43LL;
    }
    else {
      uint64_t v5 = 45LL;
    }
  }

  ClassName = object_getClassName(a1);
  unint64_t v10 = "<null selector>";
  if (a2) {
    unint64_t v10 = (const char *)a2;
  }
  _objc_fatal( "%c[%s %s]: unrecognized selector sent to instance %p (no message forward handler is installed)",  v7,  v8,  v9,  v5,  ClassName,  v10,  a1);
}

void objc::DenseMapBase<objc::DenseMap<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>,DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>,objc::DenseMapValueInfo<objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>,objc::DenseMapInfo<DisguisedPtr<objc_object>>,objc::detail::DenseMapPair<DisguisedPtr<objc_object>,objc::DenseMap<void const*,objc::ObjcAssociation,objc::DenseMapValueInfo<objc::ObjcAssociation>,objc::DenseMapInfo<void const*>,objc::detail::DenseMapPair<void const*,objc::ObjcAssociation>>>>::FatalCorruptHashTables( void *a1, uint64_t a2)
{
  size_t v4 = malloc_size(a1);
  _objc_fatal( "Hash table corrupted. This is probably a memory error somewhere. (table at %p, buckets at %p (%zu bytes), %u buckets , %u entries, %u tombstones, data %p %p %p %p)",  v5,  v6,  v7,  &objc::AssociationsManager::_mapStorage,  a1,  v4,  a2,  qword_18C43F110,  HIDWORD(qword_18C43F110),  *a1,  a1[1],  a1[2],  a1[3]);
}

void AutoreleasePoolPage::busted_die( AutoreleasePoolPage *this, uint64_t a2, const char *a3, char *a4)
{
}

void _objc_callBadAllocHandler(objc_class *a1)
{
}

uint64_t AutoreleasePoolPage::badPop(AutoreleasePoolPage *this, void *a2)
{
  unint64_t v2 = this;
  if (DebugPoolAllocation == 2
    || (this = (AutoreleasePoolPage *)dyld_program_sdk_at_least(), (this & 1) != 0)
    || (this = (AutoreleasePoolPage *)dyld_program_sdk_at_least(), (this & 1) != 0)
    || (this = (AutoreleasePoolPage *)dyld_program_sdk_at_least(), (this & 1) != 0)
    || (this = (AutoreleasePoolPage *)dyld_program_sdk_at_least(), (this & 1) != 0))
  {
    char v3 = 1;
  }

  else
  {
    this = (AutoreleasePoolPage *)dyld_program_sdk_at_least();
    char v3 = (char)this;
  }

  if ((AutoreleasePoolPage::badPop(void *)::complained & 1) == 0)
  {
    AutoreleasePoolPage::badPop(void *)::complained = 1;
    _objc_inform_now_and_on_crash( "Invalid or prematurely-freed autorelease pool %p. Set a breakpoint on objc_autoreleasePoolInvalid to debug. ",  v2);
    if ((v3 & 1) == 0)
    {
      _objc_inform("Proceeding anyway.  Memory errors are likely.");
      return gdb_objc_class_changed(v9);
    }

    gdb_objc_class_changed(v8);
LABEL_14:
    _objc_fatal("Invalid autorelease pools are a fatal error", v5, v6, v7);
  }

  uint64_t result = gdb_objc_class_changed(this);
  if ((v3 & 1) != 0) {
    goto LABEL_14;
  }
  return result;
}

void AutoreleasePoolPage::popPageDebug( AutoreleasePoolPage **this, objc_object **a2, AutoreleasePoolPage *a3, objc_object **a4)
{
  if (DebugPoolAllocation && this[2] == (AutoreleasePoolPage *)(this + 7))
  {
    unint64_t v10 = this[4];
    AutoreleasePoolPage::kill((AutoreleasePoolPage *)this, v6, v7, v8);
    if (v10 && *(_DWORD *)v10 != -1583242847) {
      AutoreleasePoolPage::busted_die(v10, v11, v12, v13);
    }
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 344) = v10;
  }

  else if (DebugMissingPools && this[2] == (AutoreleasePoolPage *)(this + 7) && !this[4])
  {
    AutoreleasePoolPage::kill((AutoreleasePoolPage *)this, v6, v7, v8);
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 344) = 0LL;
  }

  else
  {
    uint64_t v9 = this[5];
    if (v9)
    {
      if (this[2] - (AutoreleasePoolPage *)this - 56 <= 2015
        || (uint64_t v9 = (AutoreleasePoolPage *)*((void *)v9 + 5)) != 0LL)
      {
        AutoreleasePoolPage::kill(v9, v6, v7, v8);
      }
    }
  }

void AutoreleasePoolPage::printHiwat(AutoreleasePoolPage *this, uint64_t a2, const char *a3, char *a4)
{
  v14[128] = *(void **)MEMORY[0x1895F89C0];
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 344);
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v5 = 0LL;
    }

    else if (*(_DWORD *)v5 != -1583242847)
    {
      AutoreleasePoolPage::busted_die(*(AutoreleasePoolPage **)(StatusReg + 344), a2, a3, a4);
    }
  }

  unsigned int v6 = ((unint64_t)(*(void *)(v5 + 16) - v5 - 56) >> 3) + (*(_DWORD *)(v5 + 48) << 9);
  if (*(_DWORD *)(v5 + 52) + 256 < v6)
  {
    int v7 = 0;
    do
    {
      *(_DWORD *)(v5 + 52) = v6;
      v7 += AutoreleasePoolPage::sumOfExtraReleases((AutoreleasePoolPage *)v5);
      uint64_t v5 = *(void *)(v5 + 32);
    }

    while (v5);
    _objc_inform( "POOL HIGHWATER: new high water mark of %u pending releases for thread %p:",  v6,  *(const void **)StatusReg);
    if (v7) {
      _objc_inform("POOL HIGHWATER: extra sequential autoreleases of objects: %u", v7);
    }
    int v8 = backtrace(v14, 128);
    uint64_t v9 = backtrace_symbols(v14, v8);
    unint64_t v10 = v9;
    if (v8 >= 1)
    {
      uint64_t v11 = v8;
      unint64_t v12 = (const char **)v9;
      do
      {
        unint64_t v13 = *v12++;
        _objc_inform("POOL HIGHWATER:     %s", v13);
        --v11;
      }

      while (v11);
    }

    free(v10);
  }

uint64_t AutoreleasePoolPage::sumOfExtraReleases(AutoreleasePoolPage *this)
{
  pid_t v1 = (unint64_t *)((char *)this + 56);
  unint64_t v2 = *((void *)this + 2);
  LODWORD(result) = 0;
  do
  {
    unint64_t v4 = *v1++;
    unsigned int v5 = result + ((v4 >> 44) & 0xFF0 | (v4 >> 60));
    if (v4) {
      uint64_t result = v5;
    }
    else {
      uint64_t result = result;
    }
  }

  while ((unint64_t)v1 < v2);
  return result;
}

void AutoreleasePoolPage::printAll(AutoreleasePoolPage *this)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  _objc_inform("AUTORELEASE POOLS for thread %p", *(const void **)StatusReg);
  unsigned int v5 = *(AutoreleasePoolPage **)(StatusReg + 344);
  if ((unint64_t)v5 >= 2)
  {
    if (*(_DWORD *)v5 != -1583242847) {
LABEL_14:
    }
      AutoreleasePoolPage::busted_die(v5, v2, v3, v4);
    while (1)
    {
      unsigned int v6 = (AutoreleasePoolPage *)*((void *)v5 + 4);
      if (!v6) {
        break;
      }
      unsigned int v5 = (AutoreleasePoolPage *)*((void *)v5 + 4);
      if (*(_DWORD *)v6 != -1583242847) {
        AutoreleasePoolPage::busted_die(v6, v2, v3, v4);
      }
    }

    do
    {
      unsigned int v6 = (AutoreleasePoolPage *)((char *)v6 + ((*((void *)v5 + 2) - (void)v5 - 56LL) >> 3));
      unsigned int v5 = (AutoreleasePoolPage *)*((void *)v5 + 5);
    }

    while (v5);
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  _objc_inform("%llu releases pending.", v6);
  int v7 = *(AutoreleasePoolPage **)(StatusReg + 344);
  if (v7 == (AutoreleasePoolPage *)1)
  {
    _objc_inform("[%p]  ................  PAGE (placeholder)", (const void *)1);
    _objc_inform("[%p]  ################  POOL (placeholder)", (const void *)1);
  }

  else if ((unint64_t)v7 >= 2)
  {
    if (*(_DWORD *)v7 != -1583242847) {
      AutoreleasePoolPage::busted_die(v7, v2, v3, v4);
    }
    while (1)
    {
      unsigned int v5 = (AutoreleasePoolPage *)*((void *)v7 + 4);
      if (!v5) {
        break;
      }
      int v7 = (AutoreleasePoolPage *)*((void *)v7 + 4);
      if (*(_DWORD *)v5 != -1583242847) {
        goto LABEL_14;
      }
    }

    do
    {
      AutoreleasePoolPage::print(v7, v2, v3, v4);
      int v7 = (AutoreleasePoolPage *)*((void *)v7 + 5);
    }

    while (v7);
  }

  _objc_inform("##############");
}

void AutoreleasePoolPage::print(AutoreleasePoolPage *this, uint64_t a2, const char *a3, char *a4)
{
  unsigned int v5 = "";
  else {
    unsigned int v6 = "";
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v8 = *(AutoreleasePoolPage **)(StatusReg + 344);
  if (v8)
  {
    if (v8 == (AutoreleasePoolPage *)1)
    {
      uint64_t v9 = 0LL;
      goto LABEL_9;
    }

    if (*(_DWORD *)v8 != -1583242847) {
      goto LABEL_32;
    }
  }

  uint64_t v9 = *(AutoreleasePoolPage **)(StatusReg + 344);
LABEL_9:
  if (v9 == this) {
    unint64_t v10 = "(hot)";
  }
  else {
    unint64_t v10 = "";
  }
  if ((unint64_t)v8 >= 2)
  {
    while (*(_DWORD *)v8 == -1583242847)
    {
      uint64_t v11 = v8;
      int v8 = (AutoreleasePoolPage *)*((void *)v8 + 4);
      if (!v8) {
        goto LABEL_16;
      }
    }

LABEL_32:
    AutoreleasePoolPage::busted_die(v8, a2, a3, a4);
  }

  uint64_t v11 = 0LL;
LABEL_16:
  if (v11 == this) {
    unsigned int v5 = "(cold)";
  }
  _objc_inform("[%p]  ................  PAGE %s %s %s", this, v6, v10, v5);
  int v12 = *(_DWORD *)this;
  if (*(_DWORD *)this != -1583242847)
  {
    uint64_t v14 = *(const void **)StatusReg;
LABEL_23:
    _objc_inform( "autorelease pool page %p corrupted\n magic     0x%08x 0x%08x 0x%08x 0x%08x\n should be 0x%08x 0x%08x 0x%08x 0x%08x\n pthread   %p\n should be %p\n",  this,  v12,  *((_DWORD *)this + 1),  *((_DWORD *)this + 2),  *((_DWORD *)this + 3),  -1583242847,  1330926913,  1162626386,  558191425,  *((const void **)this + 3),  v14);
    goto LABEL_24;
  }

  int v13 = strncmp((const char *)this + 4, "AUTORELEASE!", 0xCuLL);
  uint64_t v14 = *(const void **)StatusReg;
LABEL_24:
  unsigned int v15 = (id *)((char *)this + 56);
  if ((unint64_t)this + 56 < *((void *)this + 2))
  {
    do
    {
      unint64_t v16 = (unint64_t)*v15;
      if (*v15)
      {
        if ((v16 >> 44) & 0xFF0 | (v16 >> 60))
        {
          object_getClassName((id)(v16 & 0xF00FFFFFFFFFFFFLL));
          _objc_inform("[%p]  %#16lx  %s  autorelease count %lu");
        }

        else
        {
          object_getClassName(*v15);
          _objc_inform("[%p]  %#16lx  %s");
        }
      }

      else
      {
        _objc_inform("[%p]  ################  POOL %p");
      }

      ++v15;
    }

    while ((unint64_t)v15 < *((void *)this + 2));
  }

void sub_180047C04(_Unwind_Exception *a1)
{
  *(void *)(v1 - 72) = 0LL;
  *(void *)(v1 - 80) = 0LL;
  _Unwind_Resume(a1);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Exit(int a1)
{
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895F87C8]();
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1895F87D8]();
}

uintptr_t _Unwind_GetCFA(_Unwind_Context *a1)
{
  return MEMORY[0x1895F87E8](a1);
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x1895F87F0](context);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  return (std::terminate_handler)MEMORY[0x1896148A0](a1);
}

void std::terminate(void)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x189614900](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x189614908](a1);
}

struct type_info *__cxa_current_exception_type(void)
{
  return (struct type_info *)MEMORY[0x189614910]();
}

void __cxa_end_catch(void)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __gxx_personality_v0()
{
  return MEMORY[0x189614988]();
}

uint64_t _dyld_for_each_objc_class()
{
  return MEMORY[0x1895F8BD8]();
}

uint64_t _dyld_for_each_objc_protocol()
{
  return MEMORY[0x1895F8BE0]();
}

uint64_t _dyld_for_objc_header_opt_ro()
{
  return MEMORY[0x1895F8BE8]();
}

uint64_t _dyld_for_objc_header_opt_rw()
{
  return MEMORY[0x1895F8BF0]();
}

uint64_t _dyld_get_dlopen_image_header()
{
  return MEMORY[0x1895F8BF8]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1895F8C10]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895F8C18]();
}

uint64_t _dyld_get_objc_selector()
{
  return MEMORY[0x1895F8C28]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1895F8C30]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895F8C38]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895F8C40]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1895F8C60]();
}

uint64_t _dyld_lookup_section_info()
{
  return MEMORY[0x1895F8C70]();
}

uint64_t _dyld_objc_class_count()
{
  return MEMORY[0x1895F8C80]();
}

uint64_t _dyld_objc_register_callbacks()
{
  return MEMORY[0x1895F8C88]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1895F8D90]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x1895F8DF0]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1895F9150]();
}

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895F9318]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

void backtrace_symbols_fd(void *const *a1, int a2, int a3)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FAF48](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1895FB028]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1895FB030]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1895FB0D8]();
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

char *__cdecl getsectdatafromheader_64( const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x1895FB698](mhp, segname, sectname, size);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FB6B0](mhp, segname, size);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

uint64_t malloc_zone_malloc_with_options_np()
{
  return MEMORY[0x1895FBD38]();
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

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1895FBFB0](__rqtp, __rmtp);
}

uint64_t objc_bp_assist_cfg_np()
{
  return MEMORY[0x1895FC240]();
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1895FC410]();
}

uint64_t os_parse_boot_arg_string()
{
  return MEMORY[0x1895FC5E8]();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1895FC670](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1895FC690]();
}

uint64_t os_unfair_recursive_lock_tryunlock4objc()
{
  return MEMORY[0x1895FC698]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  return MEMORY[0x1895FC7D8](__memptr, __alignment, __size);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x1895FC9F8](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1895FCA50]();
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1895FCA68]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1895FCA70](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1895FCB38](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1895FD040](__s1, __s2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

uint64_t task_restartable_ranges_register()
{
  return MEMORY[0x1895FD348]();
}

uint64_t task_restartable_ranges_synchronize()
{
  return MEMORY[0x1895FD350]();
}

kern_return_t task_threads( task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1895FD370](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1895FD3A8](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_remap( vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FD5B0]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libswiftCore_dylib( double a1)
{
  return a1;
}

double gotLoadHelper_x9__swift_retain(double result)
{
  return result;
}

double gotLoadHelper_x10__swift_release(double result)
{
  return result;
}

double gotLoadHelper_x9__swift_release(double result)
{
  return result;
}