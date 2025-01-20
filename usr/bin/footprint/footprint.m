LABEL_30:
    v35 = v14->super.super._sharedCache;
    v14->super.super._sharedCache = (FPSharedCache *)v25;

LABEL_31:
    v7 = v14;
    p_isa = (id *)&v7->super.super.super.isa;
    goto LABEL_32;
  }

  if (p_isa)
  {
    if (!*p_isa)
    {
      v39 = NSLocalizedDescriptionKey;
      *(void *)&v37[0] = @"memgraph initialization failed with unknown error";
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  &v39,  1LL));
      *p_isa = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FootprintErrorDomain",  1LL,  v26));
    }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v17 = v43;
        v22 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v22)
        {
          v23 = v22;
          v24 = *(void *)v45;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v45 != v24) {
                objc_enumerationMutation(v17);
              }
              v26 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)j);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v26]);

              if (!v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v26]);
                [v7 setObject:v28 forKeyedSubscript:v26];
              }
            }

            v23 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }

          while (v23);
        }

  return v15;
}

LABEL_13:
    p_isa = 0LL;
  }

LABEL_32:
LABEL_33:
  return p_isa;
}

void sub_10000551C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100005534(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005544(uint64_t a1)
{
}

void sub_10000554C(uint64_t a1, void *a2, _BYTE *a3)
{
  v5 = a2;
  if (([v5 isKernelPageTableMemory] & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24LL);
    id v7 = [v5 address];
    BOOL v9 = v6
    v41[0] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_prot];
    v41[1] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_maxProt];
    v41[2] = 0;
    uint64_t v42 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_offset];
    int v43 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag];
    if (v9)
    {
      int v44 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      int v45 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      int v46 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      unint64_t v11 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
    }

    else
    {
      unint64_t v10 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      int v44 = v10 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v12 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      int v45 = v12 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v13 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      int v46 = v13 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v14 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
      unint64_t v11 = v14 / (unint64_t)[*(id *)(a1 + 32) pageSize];
    }

    int v47 = v11;
    int v48 = *(unsigned __int16 *)&v5[OBJC_IVAR___VMUVMRegion_ref_count];
    __int16 v49 = 0;
    char v50 = v5[OBJC_IVAR___VMUVMRegion_external_pager];
    char v51 = v5[OBJC_IVAR___VMUVMRegion_share_mode];
    int v52 = v5[OBJC_IVAR___VMUVMRegion_is_submap] & 1;
    int v53 = 0;
    uint64_t v15 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
    int v54 = v15;
    __int16 v55 = (v5[OBJC_IVAR___VMUVMRegion_is_wired] & 0x10) != 0;
    unint64_t v16 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_reusable_size];
    if (!v9)
    {
      unint64_t v17 = (unint64_t)[*(id *)(a1 + 32) pageSize];
      uint64_t v15 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
      v16 /= v17;
    }

    int v56 = v16;
    uint64_t v57 = v15;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      v18 = objc_alloc_init(&OBJC_CLASS___FPImage);
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
    sub_10000DD40(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v21);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (v22 && *(_BYTE *)(v22 + 8))
    {
      id v23 = [v5 address];
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (v24) {
        *(void *)(v24 + 16) = v23;
      }
      id v25 = [v5 length];
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (v27) {
        *(void *)(v27 + 24) = v25;
      }
      if (v9 && (v28 = *(_BYTE **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) != 0LL && v28[8] == 4)
      {
        objc_setProperty_nonatomic_copy(v28, v26, @"dyld shared cache", 40LL);
      }

      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
        v31 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        if (v31) {
          objc_setProperty_nonatomic_copy(v31, v29, v30, 40LL);
        }
      }

      [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = 0LL;
    }

    if (([v21 isEqualToString:@"commpage (reserved)"] & 1) != 0
      || ([v21 isEqualToString:@"GPU Carveout (reserved)"] & 1) != 0
      || *(int *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] <= -2)
    {
      id v34 = v21;
      uint64_t v35 = 1LL;
    }

    else
    {
      id v34 = 0LL;
      uint64_t v35 = 0LL;
    }

    if (v5[OBJC_IVAR___VMUVMRegion_external_pager]) {
      BOOL v36 = 1;
    }
    else {
      BOOL v36 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] == 88;
    }
    uint64_t v37 = *(void *)(a1 + 40);
    id v38 = [v5 address];
    id v39 = [v5 length];
    if (v36) {
      uint64_t v40 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_path];
    }
    else {
      uint64_t v40 = 0LL;
    }
    *a3 = (*(uint64_t (**)(uint64_t, id, id, _DWORD *, void, uint64_t, id, uint64_t))(v37 + 16))( v37,  v38,  v39,  v41,  *(unsigned int *)&v5[OBJC_IVAR___VMUVMRegion_purgeable],  v40,  v34,  v35);
  }
}

int64x2_t *sub_100005BF4(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (result)
  {
    BOOL v9 = result;
    unint64_t v10 = (int64x2_t *)result[6].i64[1];
    if (!v10)
    {
      unint64_t v11 = objc_alloc_init(&OBJC_CLASS___FPRangeList);
      unint64_t v12 = (void *)v9[6].i64[1];
      v9[6].i64[1] = (uint64_t)v11;

      unint64_t v10 = (int64x2_t *)v9[6].i64[1];
    }

    return sub_10000D88C(v10, a2, a3, a5, a4);
  }

  return result;
}

__CFString *sub_100005C6C(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFF0) == 0xF0)
  {
    if (qword_100034918 != -1) {
      dispatch_once(&qword_100034918, &stru_1000290B8);
    }
    v3 = (__CFString *)*((id *)&unk_100034910 + (a2 - 240) + 4);
    goto LABEL_5;
  }

  if (a2 > 0xFF)
  {
    if ((_DWORD)a2 == -1)
    {
      v3 = @"Owned physical footprint (unmapped)";
      return v3;
    }
  }

  else
  {
    v4 = off_100028868[a2];
    if (v4)
    {
      v3 = v4;
      return v3;
    }

    uint64_t v5 = VMURegionTypeDescriptionForTagShareProtAndPager(a2, 0LL, 0LL, 0LL);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
    if (!-[__CFString hasPrefix:](v3, "hasPrefix:", @"Memory Tag"))
    {
LABEL_5:
      if (v3) {
        return v3;
      }
      goto LABEL_14;
    }
  }

LABEL_14:
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"tag %d", a2));
  id v7 = (void *)v6;
  unint64_t v8 = @"unknown";
  if (v6) {
    unint64_t v8 = (__CFString *)v6;
  }
  v3 = v8;

  return v3;
}

void sub_100005D94(id a1)
{
  for (uint64_t i = 0LL; i != 16; ++i)
  {
    v2 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"app-specific tag %d",  i + 1);
    v3 = (char *)&unk_100034910 + 8 * i;
    v4 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v2;
  }
}

NSString *sub_100005E10(uint64_t a1, unint64_t a2)
{
  if (a2 > 5) {
    v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"VM ledger tag %llu",  a2);
  }
  else {
    v3 = (NSString *)qword_100029068[a2];
  }
  return v3;
}

BOOL sub_100005EE8(uint64_t a1, unint64_t a2)
{
  if (!a1 || *(_DWORD *)(a1 + 12) == -1 || (*(_BYTE *)(a1 + 8) & 2) != 0) {
    return 0LL;
  }
  unsigned int v2 = *(unsigned __int8 *)(a1 + 10);
  BOOL v3 = v2 > 6;
  int v4 = (1 << v2) & 0x4C;
  BOOL v5 = v3 || v4 == 0;
  uint64_t v6 = 0LL;
  if ((*(_BYTE *)(a1 + 8) & 8) == 0)
  {
    unint64_t v8 = *(void *)(a1 + 88);
    if (v8 > a2)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      if (v9 != v8)
      {
        uint64_t v10 = *(void *)(a1 + 24);
        if (v10 != v8)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          if (v11 != v8)
          {
            uint64_t v12 = *(void *)(a1 + 40);
            if (v12 != v8) {
              return (v10 | v9 | v11 | v12) != 0;
            }
          }
        }
      }

      return 0LL;
    }
  }

  return v6;
}

BOOL sub_100005F98(BOOL result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 8) & 2) == 0) {
      return 0LL;
    }
    int v1 = *(unsigned __int8 *)(result + 9);
    if (v1 == 2 || v1 == 4) {
      return 0LL;
    }
    else {
      return *(void *)(result + 16) || *(void *)(result + 24) != 0LL;
    }
  }

  return result;
}

void sub_100006330(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
  unsigned int v2 = (void *)qword_100034920;
  qword_100034920 = v1;
}

id *sub_10000635C(uint64_t a1, uint64_t a2)
{
  uint64_t shared_cache = dyld_process_snapshot_get_shared_cache(a2);
  if (!shared_cache) {
    return (id *)0LL;
  }
  uint64_t v4 = shared_cache;
  if ((dyld_shared_cache_is_mapped_private() & 1) != 0) {
    return (id *)0LL;
  }
  dyld_shared_cache_copy_uuid(v4, v25);
  uint64_t v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v25);
  unint64_t base_address = dyld_shared_cache_get_base_address(v4);
  mapped_size = (void *)dyld_shared_cache_get_mapped_size(v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)-[NSUUID hash](v6, "hash") ^ base_address));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000349B8);
  id v10 = sub_100006590();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (id *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);

  if (!v12)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    uint64_t v24 = 0LL;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000065D4;
    v20[3] = &unk_100029128;
    v20[4] = &v21;
    dyld_shared_cache_for_each_file(v4, v20);
    unint64_t v15 = v22[3];
    if (base_address < v15)
    {
      uint64_t v19 = _os_assert_log(0LL, v13, v14);
      _os_crash(v19);
      __break(1u);
    }

    if (v15) {
      unint64_t v16 = (void *)(base_address - v15);
    }
    else {
      unint64_t v16 = 0LL;
    }
    id v17 = sub_100006590();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v12 = sub_10000666C((id *)objc_alloc(&OBJC_CLASS___FPSharedCache), v6, (void *)base_address, mapped_size, v16);
    [v18 setObject:v12 forKeyedSubscript:v9];

    _Block_object_dispose(&v21, 8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000349B8);

  return v12;
}

void sub_100006568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

id sub_100006590()
{
  v0 = (void *)qword_1000349B0;
  if (!qword_1000349B0)
  {
    uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v2 = (void *)qword_1000349B0;
    qword_1000349B0 = (uint64_t)v1;

    v0 = (void *)qword_1000349B0;
  }

  return v0;
}

uint64_t sub_1000065D4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (!*(void *)(*(void *)(v2 + 8) + 24LL))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000663C;
    v3[3] = &unk_100029100;
    v3[4] = v2;
    return dyld_shared_cache_for_file(a2, v3);
  }

  return result;
}

uint64_t sub_10000663C(uint64_t a1, uint64_t a2)
{
  uint64_t result = dyld_shared_cache_get_base_address(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

id *sub_10000666C(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___FPSharedCache;
    uint64_t v11 = (id *)[super init];
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      a1[3] = a3;
      a1[4] = a4;
      a1[5] = a5;
      *((_DWORD *)a1 + 2) = 4096;
    }
  }

  return a1;
}

void sub_10000677C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  unint64_t v8 = v5;
  if (!a1) {
    goto LABEL_4;
  }
  if (v5)
  {
    sub_1000067F0(a1, v10, (uint64_t)[v5 pageSize], v5);
LABEL_4:

    return;
  }

  uint64_t v9 = _os_assert_log(0LL, v6, v7);
  _os_crash(v9);
  __break(1u);
}

void sub_1000067F0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = a2;
  id v9 = a4;
  if (!a1)
  {
LABEL_19:

    return;
  }

  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    [*(id *)(a1 + 16) addObject:v23];
    id v10 = v23;
    if (v23 && *((void *)v23 + 12))
    {
      if (v9)
      {
        objc_opt_self(&OBJC_CLASS___FPFootprint);
        id v10 = v23;
        if (!byte_100038A50)
        {
          if (*(void *)(a1 + 64)
            || (v23[8] & 2) == 0
            && ((unsigned int v17 = v23[10], v17 > 6) || ((1 << v17) & 0x4C) == 0)
            && v23[9] - 5 <= 0xFFFFFFFC)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v9 pid]));
            uint64_t v12 = *(void **)(a1 + 64);
            if (!v12)
            {
              objc_super v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              uint64_t v14 = *(void **)(a1 + 64);
              *(void *)(a1 + 64) = v13;

              uint64_t v12 = *(void **)(a1 + 64);
            }

            unint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
            if (!v15)
            {
              unint64_t v16 = *(void **)(a1 + 64);
              unint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              [v16 setObject:v15 forKeyedSubscript:v11];
            }

            -[NSMutableArray addObject:](v15, "addObject:", v23);

            id v10 = v23;
          }
        }
      }

      uint64_t v18 = *(void *)(a1 + 72);
      if (!v18)
      {
        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___FPRangeList);
        v20 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v19;

        id v10 = v23;
        uint64_t v18 = *(void *)(a1 + 72);
      }

      sub_10000DB8C(v18, v10, a3);
      uint64_t v21 = (void *)*((void *)v23 + 13);
      *((void *)v23 + 13) = 0LL;
    }

    goto LABEL_19;
  }

  uint64_t v22 = _os_assert_log(0LL, v7, v8);
  _os_crash(v22);
  __break(1u);
}

void sub_100006A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    uint64_t v40 = _os_assert_log(0LL, a2, a3);
    _os_crash(v40);
    __break(1u);
  }

  int v4 = a2;
  sub_10000DC94(*(void *)(a1 + 72), v63);
  if (v4)
  {
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v5 = *(id *)(a1 + 16);
    id v6 = [v5 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v60;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          *(void *)(a1 + 24) += [v10 dirtySize];
          *(void *)(a1 + 32) += [v10 swappedSize];
        }

        id v7 = [v5 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }

      while (v7);
    }

LABEL_34:
    goto LABEL_35;
  }

  *(int64x2_t *)(a1 + 24) = v63[0];
  if (*(void *)(a1 + 64) && sub_100011D3C())
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectEnumerator]);
    id v42 = [v5 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v56;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v14)
          {
            id v15 = v14;
            unint64_t v16 = 0LL;
            unint64_t v17 = 0LL;
            uint64_t v18 = *(void *)v52;
            do
            {
              for (k = 0LL; k != v15; k = (char *)k + 1)
              {
                if (*(void *)v52 != v18) {
                  objc_enumerationMutation(v13);
                }
                v20 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)k);
                v17 += (unint64_t)[v20 dirtySize];
                v16 += (unint64_t)[v20 swappedSize];
              }

              id v15 = [v13 countByEnumeratingWithState:&v51 objects:v67 count:16];
            }

            while (v15);

            if (v17 > *(void *)(a1 + 24)) {
              *(void *)(a1 + 24) = v17;
            }
            if (v16 > *(void *)(a1 + 32)) {
              *(void *)(a1 + 32) = v16;
            }
          }

          else
          {
          }
        }

        id v42 = [v5 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }

      while (v42);
      LOBYTE(v4) = 0;
    }

    goto LABEL_34;
  }

LABEL_35:
  *(int64x2_t *)(a1 + 40) = v63[1];
  *(void *)(a1 + 56) = v64;
  uint64_t v21 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0LL;

  if ((v4 & 1) == 0 && (unint64_t)[*(id *)(a1 + 64) count] >= 2)
  {
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectEnumerator]);
    id v23 = [v22 countByEnumeratingWithState:&v47 objects:v66 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v48;
LABEL_39:
      uint64_t v26 = 0LL;
      while (1)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v47 + 1) + 8 * v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);
        if ([v28 dirtySize] != *(id *)(a1 + 24)
          || [v28 swappedSize] != *(id *)(a1 + 32)
          || [v28 cleanSize] != *(id *)(a1 + 40)
          || [v28 reclaimableSize] != *(id *)(a1 + 48)
          || [v28 wiredSize] != *(id *)(a1 + 56))
        {

          goto LABEL_52;
        }

        if (v24 == (id)++v26)
        {
          id v24 = [v22 countByEnumeratingWithState:&v47 objects:v66 count:16];
          if (v24) {
            goto LABEL_39;
          }
          break;
        }
      }
    }

    *(_BYTE *)(a1 + 8) |= 2u;
  }

  uint64_t v22 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0LL;
LABEL_52:

  if ((v4 & 1) == 0 && [(id)a1 containsFakeRegion])
  {
    id v29 = sub_100006FCC(a1);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)v30;
    if (!v30 || *(_DWORD *)(v30 + 12) != -1)
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v32 = *(id *)(a1 + 16);
      id v33 = [v32 countByEnumeratingWithState:&v43 objects:v65 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v44;
        do
        {
          for (m = 0LL; m != v34; m = (char *)m + 1)
          {
            if (*(void *)v44 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(_DWORD **)(*((void *)&v43 + 1) + 8LL * (void)m);
            if (v37)
            {
              if (v37[3] == -1)
              {
                id v38 = (void *)objc_claimAutoreleasedReturnValue([v31 name]);
                [v37 setName:v38];

                id v39 = (void *)objc_claimAutoreleasedReturnValue([v31 detailedName]);
                [v37 setDetailedName:v39];
              }
            }
          }

          id v34 = [v32 countByEnumeratingWithState:&v43 objects:v65 count:16];
        }

        while (v34);
      }
    }
  }

  *(_BYTE *)(a1 + 8) |= 1u;
}

id sub_100006FCC(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 16) firstObject]);
  BOOL v3 = (void *)v2;
  if (v2 && (*(_BYTE *)(v2 + 8) & 2) != 0)
  {
    int v4 = 1;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 12) != -1)
  {
    int v4 = 0;
LABEL_7:
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = *(id *)(a1 + 16);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9);
          if (v4)
          {
            if (!v10 || (*(_BYTE *)(v10 + 8) & 4) == 0) {
              goto LABEL_22;
            }
          }

          else if (!v10 || *(_DWORD *)(v10 + 12) != -1)
          {
LABEL_22:
            id v11 = (id)v10;

            goto LABEL_23;
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  id v11 = v3;
LABEL_23:

  return v11;
}

LABEL_12:
  return (char)v3;
}

uint64_t sub_100007A84(int a1, _OWORD *buffer)
{
  if (proc_pidinfo(a1, 3, 0LL, buffer, 136) == 136) {
    return 1LL;
  }
  if (a1) {
    return 0LL;
  }
  *((void *)buffer + 16) = 0LL;
  buffer[4] = xmmword_100021508;
  buffer[5] = unk_100021518;
  buffer[6] = xmmword_100021528;
  buffer[7] = unk_100021538;
  *buffer = xmmword_1000214C8;
  buffer[1] = unk_1000214D8;
  uint64_t result = 1LL;
  buffer[2] = xmmword_1000214E8;
  buffer[3] = unk_1000214F8;
  return result;
}

__CFString *sub_100007B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 64;
  if (*(_BYTE *)(a2 + 64))
  {
    uint64_t v4 = 32LL;
  }

  else
  {
    int v6 = *(unsigned __int8 *)(a2 + 48);
    uint64_t v5 = a2 + 48;
    if (!v6)
    {
      id v7 = @"Unknown";
      return v7;
    }

    uint64_t v4 = 16LL;
    uint64_t v3 = v5;
  }

  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%.*s", v4, v3);
  return v7;
}

void *sub_100007EBC(void *a1)
{
  *a1 = 0LL;
  int v2 = proc_listallpids(0LL, 0);
  if (v2 < 0) {
    return 0LL;
  }
  int v3 = 4 * (v2 + 20);
  uint64_t v4 = (char *)malloc(4LL * (v2 + 20));
  unsigned int v5 = proc_listallpids(v4, v3);
  if ((v5 & 0x80000000) != 0)
  {
    __int128 v14 = v4;
LABEL_11:
    free(v14);
    return 0LL;
  }

  unsigned int v6 = v5;
  id v7 = malloc(136LL * v5);
  uint64_t v8 = v7;
  if (!v6)
  {
    free(v4);
LABEL_10:
    __int128 v14 = v8;
    goto LABEL_11;
  }

  uint64_t v9 = 0LL;
  LODWORD(v10) = 0;
  uint64_t v11 = 4LL * v6;
  uint64_t v12 = v7;
  do
  {
    unsigned int v13 = sub_100007A84(*(_DWORD *)&v4[v9], v12);
    uint64_t v12 = (_OWORD *)((char *)v12 + 136 * v13);
    uint64_t v10 = v10 + v13;
    v9 += 4LL;
  }

  while (v11 != v9);
  free(v4);
  if (!(_DWORD)v10) {
    goto LABEL_10;
  }
  *a1 = v10;
  return v8;
}

LABEL_41:
LABEL_42:
        objc_autoreleasePoolPop(context);

        uint64_t v8 = v37;
      }

      id v39 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (!v39)
      {
LABEL_44:

        if (v36 && -[NSMutableArray count](v33, "count")) {
          *BOOL v36 = -[NSMutableArray copy](v33, "copy");
        }
        free(v35);

        unsigned int v6 = v32;
        goto LABEL_48;
      }
    }
  }

  id v7 = 0LL;
  if (a4) {
    *a4 = &off_10002C170;
  }
LABEL_48:

  return v7;
}

LABEL_19:
          }
        }

        [v19 addObjectsFromArray:v18];
        -[NSMutableArray removeAllObjects](v6, "removeAllObjects");
        unsigned int v5 = v18;

        uint64_t v18 = v6;
        if (!v5)
        {
          uint64_t v18 = v6;
          goto LABEL_22;
        }
      }
    }

    else
    {
LABEL_22:
      unsigned int v6 = 0LL;
    }

    free(v4);
    uint64_t v4 = v19;
  }

  return v4;
}

      ++a2;
      if (!--v3) {
        return;
      }
    }

    if (v7) {
      __int128 v14 = *(void *)(a1 + 40) == 0LL;
    }
    else {
      __int128 v14 = 1;
    }
    if (!v14 && (v7[8] & 2) != 0 && !sub_100005F98((BOOL)v7))
    {
      sub_100018ECC(*(void *)(a1 + 48), v10);
      goto LABEL_19;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v10));
    __int128 v15 = (FPProcessGroupMinimal *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:v12]);
    if (!v15)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___FPProcessGroupMinimal);
      [*(id *)(a1 + 56) setObject:v15 forKeyedSubscript:v12];
    }

    -[FPProcessGroupMinimal addProcess:](v15, "addProcess:", *(void *)(a1 + 64));

LABEL_18:
    goto LABEL_19;
  }

uint64_t sub_100008964(uint64_t a1, void *a2)
{
  int v3 = a2;
  if (!(_DWORD)a1) {
    goto LABEL_12;
  }
  if (task_map_corpse_info_64(mach_task_self_, a1, &kcd_addr_begin, &v8))
  {
LABEL_11:
    a1 = 0LL;
    goto LABEL_12;
  }

  uint64_t v4 = (_DWORD *)kcd_addr_begin;
  unint64_t v5 = v8 + kcd_addr_begin;
  mach_vm_address_t v6 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v8 + kcd_addr_begin
    || v6 + *(unsigned int *)(kcd_addr_begin + 4) > v5
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
    goto LABEL_11;
  }

  do
  {
    if (*v4 == -242132755) {
      break;
    }
    v3[2](v3, v4, v5);
    uint64_t v4 = (_DWORD *)(v6 + v4[1]);
    mach_vm_address_t v6 = (mach_vm_address_t)(v4 + 4);
  }

  while ((unint64_t)(v4 + 4) <= v5);
  vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
  a1 = 1LL;
LABEL_12:

  return a1;
}

LABEL_63:
}

void sub_100009360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

LABEL_17:
  id v7 = 0LL;
  return v7;
}

void sub_1000095C0(id *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %s",  v3,  __strerrbuf));

    mach_vm_address_t v6 = __stderrp;
    id v7 = objc_claimAutoreleasedReturnValue([a1 displayString]);
    mach_vm_size_t v8 = (const char *)[v7 UTF8String];
    id v9 = v5;
    fprintf(v6, "%s: %s\n", v8, (const char *)[v9 UTF8String]);

    [a1[5] addObject:v9];
  }

void sub_1000099BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_1000099F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v7 = 0LL;
    uint64_t v41 = a3 - 1;
    uint64_t v42 = a5 - 1;
    do
    {
      BOOL v8 = !(v7 | a4) && !*(_BYTE *)(a1 + 80) && *(_BYTE *)(a1 + 81) != 0;
      BOOL v9 = 0;
      if (v42 == a4 && v41 == v7) {
        BOOL v9 = *(_BYTE *)(a1 + 82) != 0;
      }
      int v10 = *(_DWORD *)(a2 + 4 * v7);
      unint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
      __int128 v14 = *(id *)(a1 + 32);
      if (v8)
      {
        if (v14)
        {
          uint64_t v15 = v14[10];
          unint64_t v16 = v14[11];
          uint64_t v17 = v15 & -(uint64_t)v11;
        }

        else
        {
          uint64_t v17 = 0LL;
          uint64_t v15 = 0LL;
          unint64_t v16 = 0LL;
        }

        unint64_t v11 = v11 - v15 + v17;
        if (v16 < v11) {
          goto LABEL_21;
        }
      }

      else if (v9)
      {
        if (v14)
        {
          uint64_t v19 = v14[10];
          unint64_t v18 = v14[11];
          uint64_t v20 = v19 == -1 ? -1LL : v18 + v19;
          uint64_t v21 = (v11 + v20 - 1) & -(uint64_t)v11;
        }

        else
        {
          uint64_t v21 = 0LL;
          uint64_t v20 = 0LL;
          unint64_t v18 = 0LL;
        }

        unint64_t v11 = v11 - v21 + v20;
        if (v18 < v11)
        {
LABEL_21:
          if (v14) {
            unint64_t v11 = v14[11];
          }
          else {
            unint64_t v11 = 0LL;
          }
        }
      }

      BOOL v22 = (v10 & 0x81) == 1 || (v10 & 8) != 0;
      if (v22)
      {
        id v23 = (void *)(v12 + 24);
LABEL_30:
        *v23 += v11;
        goto LABEL_31;
      }

      if ((v10 & 0x10) != 0)
      {
        id v23 = (void *)(v13 + 24);
        goto LABEL_30;
      }

LABEL_31:
      if (v8)
      {
        uint64_t v26 = *(void **)(*(void *)(a1 + 40) + 168LL);
        if (v26)
        {
          uint64_t v27 = *(void *)(a1 + 32);
          if (v27) {
            uint64_t v27 = *(void *)(v27 + 80);
          }
          uint64_t v28 = v26[10];
          if (v28 != -1) {
            v28 += v26[11];
          }
          if (v27 != v28)
          {
            uint64_t v40 = _os_assert_log(0LL, v24, v25);
            _os_crash(v40);
            __break(1u);
            return;
          }

          uint64_t v45 = 0LL;
          uint64_t v46 = 0LL;
          uint64_t v29 = *(void *)(a1 + 64);
          uint64_t v30 = v26;
          uint64_t v31 = v26[10];
          unint64_t v32 = v30[11];
          if (v31 == -1) {
            uint64_t v33 = -1LL;
          }
          else {
            uint64_t v33 = v32 + v31;
          }
          unint64_t v34 = v29 - ((v29 + v33 - 1) & -v29) + v33;
          if (v32 < v34) {
            unint64_t v34 = v30[11];
          }
          if (v22)
          {
            uint64_t v35 = (unint64_t *)&v46;
            goto LABEL_49;
          }

          if ((v10 & 0x10) != 0)
          {
            uint64_t v35 = (unint64_t *)&v45;
LABEL_49:
            *uint64_t v35 = v34;
            uint64_t v36 = v45;
            uint64_t v37 = v46;
          }

          else
          {
            uint64_t v36 = 0LL;
            uint64_t v37 = 0LL;
          }

          [ *(id *)(*(void *)(a1 + 40) + 168) setDirtySize: *(char *)(*(id *)(*(void *)(a1 + 40) + 168) dirtySize) + v37];
          [ *(id *)(*(void *)(a1 + 40) + 168) setSwappedSize: (char *)[ *(id *)(*(void *)(a1 + 40) + 168) swappedSize] + v36];
          uint64_t v38 = *(void *)(a1 + 40);
          id v39 = *(void **)(v38 + 168);
          *(void *)(v38 + 16_Block_object_dispose((const void *)(v26 - 120), 8) = 0LL;
        }
      }

      if (v9)
      {
        *(void *)(*(void *)(a1 + 40) + 152LL) = *(void *)(a1 + 72) - *(void *)(a1 + 64);
        *(_DWORD *)(*(void *)(a1 + 40) + 160LL) = v10;
      }

      ++v7;
    }

    while (a3 != v7);
  }

uint64_t sub_100009CD0(void *a1, mach_vm_offset_t a2, unint64_t a3, void *a4)
{
  uint64_t v7 = a4;
  if (a1)
  {
    id v8 = [a1 pageSize];
    if (a3 >= 0x1000) {
      unint64_t v9 = 4096LL;
    }
    else {
      unint64_t v9 = a3;
    }
    unint64_t v10 = a3 + 4095;
    if (a3 + 4095 >= 0x1000)
    {
      id v12 = v8;
      uint64_t v21 = (uint64_t)&v21;
      BOOL v22 = a1;
      uint64_t v13 = 0LL;
      unint64_t v14 = v10 >> 12;
      if (v10 >> 12 <= 1) {
        uint64_t v15 = 1LL;
      }
      else {
        uint64_t v15 = v10 >> 12;
      }
      uint64_t v16 = (void)v8 << 12;
      while (1)
      {
        mach_vm_size_t v17 = a3 >= v9 ? v9 : a3;
        mach_vm_size_t dispositions_count = v17;
        id v18 = v12;
        mach_error_t v19 = mach_vm_page_range_query( *((_DWORD *)v22 + 24),  a2,  v17 * (void)v12,  (mach_vm_address_t)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0),  &dispositions_count);
        if (v19) {
          break;
        }
        v7[2](v7, (char *)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count, v13++, v14);
        a2 += v16;
        a3 -= 4096LL;
        id v12 = v18;
        if (v15 == v13)
        {
          uint64_t v11 = 1LL;
          goto LABEL_18;
        }
      }

      sub_10000A258(v22, v19, @"mach_vm_page_range_query");
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v11 = 1LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

LABEL_18:
  return v11;
}

void sub_10000A258(_BYTE *a1, mach_error_t a2, void *a3)
{
  id v5 = a3;
  if (a1 && !a1[176])
  {
    a1[176] = 1;
    mach_vm_address_t v6 = "";
    if ([a1 _isAlive])
    {
      else {
        int v7 = *__error();
      }
      BOOL v10 = v7 == 0;
      BOOL v11 = v20 == 5;
      BOOL v8 = v10 && v11;
      BOOL v12 = !v10 || !v11;
      uint64_t v13 = " (zombie)";
      if (v12) {
        uint64_t v13 = "";
      }
      BOOL v9 = v7 == 3;
      if (v7 == 3) {
        mach_vm_address_t v6 = " (process exited)";
      }
      else {
        mach_vm_address_t v6 = v13;
      }
    }

    else
    {
      BOOL v8 = 0;
      BOOL v9 = 0;
    }

    unint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %s%s",  v5,  mach_error_string(a2),  v6);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = &OBJC_IVAR___FPProcess__warnings;
    if (!v8 && !v9)
    {
      mach_vm_size_t v17 = __stderrp;
      id v18 = objc_claimAutoreleasedReturnValue([a1 displayString]);
      fprintf( v17, "%s: bailing out due to error: %s\n", (const char *)[v18 UTF8String], (const char *)[v15 UTF8String]);

      uint64_t v16 = &OBJC_IVAR___FPProcess__errors;
    }

    [*(id *)&a1[*v16] addObject:v15];
  }
}

void sub_10000A5B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

int64x2_t *sub_10000A5D4(int64x2_t *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 - 1 == a4) {
    unint64_t v5 = a3 + 1;
  }
  else {
    unint64_t v5 = a3;
  }
  if (v5)
  {
    BOOL v8 = result;
    for (unint64_t i = 0LL; i != v5; ++i)
    {
      if (i >= a3)
      {
        uint64_t v11 = 0LL;
      }

      else
      {
        int v10 = *(_DWORD *)(a2 + 4 * i);
        if ((v10 & 0x10) != 0)
        {
          uint64_t v11 = 2LL;
        }

        else if ((v8[4].i32[0] & v10) != 0)
        {
          uint64_t v11 = 1LL;
        }

        else
        {
          BOOL v17 = (v8[4].i32[1] & v10) == 0;
          uint64_t v12 = 4LL * (v10 & 1);
          if (v17) {
            uint64_t v11 = v12;
          }
          else {
            uint64_t v11 = 3LL;
          }
        }
      }

      uint64_t v13 = v8[2].i64[1];
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v15 = *(void *)(v14 + 24);
      if (v15 != v11)
      {
        uint64_t v16 = v8[3].i64[0];
        BOOL v17 = !v15 || *(void *)(*(void *)(v16 + 8) + 40LL) == 0LL;
        if (!v17)
        {
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v21 = 0u;
          switch(*(void *)(*(void *)(v13 + 8) + 24LL))
          {
            case 0LL:
              _os_crash("Tried to add an empty subrange");
              __break(1u);
              JUMPOUT(0x10000A7B0LL);
            case 1LL:
              *(void *)&__int128 v21 = *(void *)(*(void *)(v16 + 8) + 40LL);
              break;
            case 2LL:
              *((void *)&v21 + 1) = *(void *)(*(void *)(v16 + 8) + 40LL);
              break;
            case 3LL:
              *((void *)&v22 + 1) = *(void *)(*(void *)(v16 + 8) + 40LL);
              break;
            case 4LL:
              *(void *)&__int128 v22 = *(void *)(*(void *)(v16 + 8) + 40LL);
              break;
            default:
              break;
          }

          uint64_t v18 = *(void *)(v16 + 8);
          if (v8[4].i8[8])
          {
            *(void *)&__int128 v23 = *(void *)(v18 + 40);
            uint64_t v18 = *(void *)(v16 + 8);
          }

          uint64_t result = sub_100005BF4( (int64x2_t *)v8[2].i64[0],  *(void *)(v18 + 32),  *(void *)(v18 + 40),  (uint64_t *)&v21,  v8[3].i64[1]);
          uint64_t v19 = *(void *)(v8[3].i64[0] + 8);
          *(void *)(v19 + 32) += *(void *)(v19 + 40);
          *(void *)(v19 + 40) = 0LL;
          uint64_t v14 = *(void *)(v8[2].i64[1] + 8);
        }
      }

      *(void *)(v14 + 24) = v11;
      if (*(void *)(*(void *)(v8[2].i64[1] + 8) + 24LL)) {
        uint64_t v20 = 40LL;
      }
      else {
        uint64_t v20 = 32LL;
      }
      *(void *)(*(void *)(v8[3].i64[0] + 8) + v20) += v8[3].i64[1];
    }
  }

  return result;
}

uint64_t sub_10000A7C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A7D8(uint64_t a1)
{
}

uint64_t sub_10000A7E0( uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, int a8)
{
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = *(void *)(a1 + 80);
  unint64_t v17 = a3 + a2;
  BOOL v18 = v16 < a3 + a2 && *(void *)(a1 + 88) + v16 > a2;
  unint64_t v109 = a2;
  if (!v18)
  {
    id v106 = v15;
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
    uint64_t v20 = (uint64_t)v19;
    if (v19)
    {
      v19->_unint64_t start = a2;
      v19->_size = a3;
      __int128 v22 = (void *)(a4 + 68);
      unint64_t v21 = *(void *)(a4 + 68);
      __int128 v23 = (int *)(a4 + 20);
      v19->_user_tag = *(_DWORD *)(a4 + 20);
      v19->_object_id = v21;
      v19->_share_mode = *(_BYTE *)(a4 + 47);
      v19->_offset = *(void *)(a4 + 12);
      LOBYTE(v21) = *((_BYTE *)v19 + 8);
      *((_BYTE *)v19 + _Block_object_dispose((const void *)(v11 - 96), 8) = v21 & 0xFD;
      *((_BYTE *)v19 + _Block_object_dispose((const void *)(v11 - 96), 8) = v21 & 0xFC | (*(_WORD *)(a4 + 60) != 0);
    }

    else
    {
      __int128 v23 = (int *)(a4 + 20);
      __int128 v22 = (void *)(a4 + 68);
    }

    if (a5 == 2)
    {
      -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", 0LL);
      uint64_t v26 = (void *)v20;
      unint64_t v25 = a3;
    }

    else
    {
      if (a5 != 1)
      {
        if (*(_BYTE *)(a4 + 46) || *(_BYTE *)(a1 + 97)) {
          unsigned int v69 = *(_DWORD *)(a4 + 36);
        }
        else {
          unsigned int v69 = *(_DWORD *)(a4 + 24) - *(_DWORD *)(a4 + 64);
        }
        -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", (void)[*(id *)(a1 + 32) pageSize] * v69);
        [v20 setReclaimableSize:[*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 64)];
        [v20 setSwappedSize:[*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 32)];
        unsigned int v70 = *(_DWORD *)(a4 + 24);
        unsigned int v71 = *(_DWORD *)(a4 + 64) + v69;
        if (*(_BYTE *)(a1 + 97) && v70 < v71) {
          uint64_t v72 = 0LL;
        }
        else {
          uint64_t v72 = (void)[*(id *)(a1 + 32) pageSize] * (v70 - v71);
        }
        a2 = v109;
        [(id)v20 setCleanSize:v72];
        if (*v23 == -1)
        {
          if (*(void *)(*(void *)(a1 + 32) + 144LL))
          {
LABEL_184:

            uint64_t v27 = 0LL;
LABEL_185:
            id v15 = v106;
            goto LABEL_186;
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), (id)v20);
          if (v20 && !*v22) {
            *(void *)(v20 + 96) = *(unsigned int *)(a4 + 56);
          }
        }

LABEL_114:
        v73 = sub_10000DEA0(*(void *)(a1 + 48), a2, v17);
        uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);
        if (v20) {
          *(_BYTE *)(v20 + 9) = 1;
        }
        if (a8) {
          [(id)v20 setVerbose:1];
        }
        if (v74)
        {
          id v75 = *(id *)(v74 + 32);
          [(id)v20 setName:v75];

          id v76 = *(id *)(v74 + 40);
          [(id)v20 setDetailedName:v76];

          if (v20) {
            *(_BYTE *)(v20 + 9) = *(_BYTE *)(v74 + 8);
          }
          goto LABEL_176;
        }

        if (v106)
        {
          [v20 setName:];
          goto LABEL_176;
        }

        if ((v14 || *(_BYTE *)(a4 + 46)) && *v23 != 88)
        {
          [(id)v20 setName:@"mapped file"];
          [(id)v20 setDetailedName:v14];
          goto LABEL_176;
        }

        if (a2 == 0xFC0000000LL && a3 == 0x40000000)
        {
          v77 = @"commpage (reserved)";
LABEL_136:
          [(id)v20 setName:v77];
          [(id)v20 setVerbose:1];
          goto LABEL_176;
        }

        if (a2 == 0x1000000000LL && a3 == 0x6000000000LL)
        {
          v77 = @"GPU Carveout (reserved)";
          goto LABEL_136;
        }

        v78 = sub_100005C6C((uint64_t)&OBJC_CLASS___FPMemoryRegion, *v23);
        v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        [(id)v20 setName:v79];

        if (*(_BYTE *)(a1 + 98))
        {
          int v80 = *v23;
          if (*v23 == 100 || v80 == 88)
          {
            if (v14)
            {
              [(id)v20 setExtendedInfo:v14];
            }

            else if (v80 != 100 || *(_BYTE *)(a1 + 99))
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extendedInfoForRegionType:at:extendedInfoProvider:]);
              [(id)v20 setExtendedInfo:v81];
            }
          }
        }

        if (!*(_BYTE *)(a1 + 100)) {
          goto LABEL_176;
        }
        v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *v22));
        v83 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:v82]);
        v84 = *(void **)(*(void *)(a1 + 32) + 144LL);
        if (v83)
        {
          [v84 removeObjectForKey:v82];
          if (v20) {
            *(_BYTE *)(v20 + 8) |= 8u;
          }
          v117 = 0LL;
          [v83 getBytes:v111 length:56];
          unint64_t v85 = v116;
          int v86 = (v116 >> 4) & 3;
          if (v86 != 3 && v86)
          {
            v89 = 0LL;
            v118 = 0LL;
            v88 = v113;
            uint64_t v87 = v112 - (void)v113;
          }

          else
          {
            uint64_t v87 = v114;
            v88 = (char *)(v112 - v114);
            v89 = v115;
            v118 = v115;
          }

          if ((v116 & 1) != 0)
          {
            v117 = &v89[(void)v88];
            v93 = &v118;
            v88 = 0LL;
          }

          else
          {
            v93 = &v117;
          }

          *v93 = 0LL;
          v94 = sub_100005E10((uint64_t)&OBJC_CLASS___FPMemoryRegion, (v85 >> 1) & 7);
          v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
          if (v95)
          {
            v96 = objc_alloc(&OBJC_CLASS___NSString);
            v110 = v83;
            uint64_t v97 = v87;
            v98 = v82;
            v99 = (void *)objc_claimAutoreleasedReturnValue([(id)v20 name]);
            v100 = -[NSString initWithFormat:](v96, "initWithFormat:", @"%@ (%@)", v99, v95);
            [(id)v20 setName:v100];

            v82 = v98;
            uint64_t v87 = v97;
            v83 = v110;
          }

          v92 = v117;
          v91 = v118;
        }

        else
        {
          if (v84 || a5 == 3 || *v23 == 87 || !*(_DWORD *)(a4 + 24)) {
            goto LABEL_175;
          }
          [0 removeObjectForKey:v82];
          if (v20) {
            *(_BYTE *)(v20 + 8) |= 8u;
          }
          v90 = (char *)[(id)v20 dirtySize];
          v88 = &v90[(void)[(id)v20 cleanSize]];
          v91 = (char *)[(id)v20 swappedSize];
          v92 = 0LL;
          uint64_t v87 = 0LL;
        }

        *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) += &v91[(void)v88];
        [(id)v20 setDirtySize:v88];
        [(id)v20 setCleanSize:v92];
        [(id)v20 setSwappedSize:v91];
        [(id)v20 setReclaimableSize:v87];
LABEL_175:

LABEL_176:
        if (*(_BYTE *)(a1 + 97)
          && !*(_BYTE *)(a1 + 101)
          && !*(_BYTE *)(a1 + 96)
          && sub_100005EE8(v20, (unint64_t)[*(id *)(a1 + 32) pageSize]))
        {
          [*(id *)(a1 + 32) _addSubrangesForRegion:v20 purgeState:a5];
        }

        if (v20 != *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
          [*(id *)(a1 + 40) addObject:v20];
        }

        goto LABEL_184;
      }

      -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", 0LL);
      uint64_t v24 = *(unsigned int *)(a4 + 24);
      unint64_t v25 = (void)[*(id *)(a1 + 32) pageSize] * v24;
      a2 = v109;
      uint64_t v26 = (void *)v20;
    }

    [v26 setReclaimableSize:v25];
    [(id)v20 setSwappedSize:0];
    [(id)v20 setCleanSize:0];
    goto LABEL_114;
  }

  if (!*(_BYTE *)(a1 + 96))
  {
    id v106 = v15;
    uint64_t v28 = *(void **)(a1 + 32);
    uint64_t v29 = *(void **)(a1 + 48);
    id v30 = *(id *)(a1 + 40);
    id v108 = v29;
    if (!v28)
    {

      uint64_t v27 = 1LL;
      goto LABEL_185;
    }

    uint64_t v31 = v28[3];
    if (v31) {
      uint64_t v32 = *(unsigned int *)(v31 + 8);
    }
    else {
      uint64_t v32 = 0LL;
    }
    id v104 = v14;
    uint64_t v33 = (char *)[v28 pageSize];
    unint64_t v34 = (void *)v28[21];
    v28[21] = 0LL;

    uint64_t v35 = sub_10000DEA0((uint64_t)v108, v109, v17);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    if (v17 <= v109)
    {
      v68 = 0LL;
LABEL_140:

      uint64_t v27 = 0LL;
LABEL_141:
      id v14 = v104;
      goto LABEL_185;
    }

    uint64_t v37 = 0LL;
    uint64_t v105 = v32 - 1;
    uint64_t v102 = -v32;
    v103 = v33 - 1;
    unint64_t v38 = v109;
    while (1)
    {
      uint64_t v39 = v36;
      if (v36 && v38 >= *(void *)(v36 + 16)) {
        goto LABEL_60;
      }
      uint64_t v40 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
      uint64_t v36 = (uint64_t)v40;
      if (v40) {
        v40->_unint64_t start = v38;
      }
      unint64_t v41 = v17;
      if (v39)
      {
        if (*(void *)(v39 + 16) >= v17) {
          unint64_t v41 = v17;
        }
        else {
          unint64_t v41 = *(void *)(v39 + 16);
        }
      }

      if (v40)
      {
        unint64_t start = v40->_start;
        BOOL v43 = v41 >= start;
        unint64_t v44 = v41 - start;
        if (!v43) {
          goto LABEL_187;
        }
        v40->_size = v44;
        v40->_user_tag = *(_DWORD *)(a4 + 20);
        v40->_object_id = *(void *)(a4 + 68);
        v40->_share_mode = *(_BYTE *)(a4 + 47);
        v40->_offset = start - v109 + *(void *)(a4 + 12);
        *((_BYTE *)v40 + 8) |= 2u;
        -[FPMemoryRegion setName:](v40, "setName:", @"unused dyld shared cache area");
        char v45 = *(_BYTE *)(v36 + 8) | 4;
        *(_BYTE *)(v36 + _Block_object_dispose((const void *)(v11 - 96), 8) = v45;
        *(_BYTE *)(v36 + _Block_object_dispose((const void *)(v11 - 96), 8) = v45 & 0xFE | (*(_WORD *)(a4 + 60) != 0);
        if (!v37)
        {
LABEL_36:
          if (!v39)
          {
            if (!v36) {
              goto LABEL_102;
            }
            *(_BYTE *)(v36 + 9) = 0;
            goto LABEL_51;
          }

          goto LABEL_37;
        }
      }

      else
      {
        [0 setName:@"unused dyld shared cache area"];
        if (!v37) {
          goto LABEL_36;
        }
      }

      int v46 = v37[8];
      if (v46 == 2)
      {
        if (!v39)
        {
          int v46 = 2;
          goto LABEL_43;
        }
      }

      else if (!v39 || v46 != 4)
      {
        goto LABEL_43;
      }

LABEL_37:
      int v46 = *(unsigned __int8 *)(v39 + 8);
      if (v46 == 4 || v46 == 2)
      {
        if (v37) {
          uint64_t v47 = v37;
        }
        else {
          uint64_t v47 = (unsigned __int8 *)v39;
        }
        int v46 = v47[8];
      }

LABEL_43:
      if (v36) {
        *(_BYTE *)(v36 + 9) = v46;
      }
      if (v46 != 2 && v46 != 4)
      {
        if (!v36)
        {
LABEL_102:
          uint64_t v48 = 0LL;
          goto LABEL_53;
        }

LABEL_51:
        uint64_t v48 = *(void *)(v36 + 80);
        if (v48 != -1) {
          v48 += *(void *)(v36 + 88);
        }
LABEL_53:
        if (((v48 | v38) & (unint64_t)v103) != 0
          && ![v28 _populateMemoryRegionWithPageQueries:v36 regionInfo:a4])
        {
          goto LABEL_149;
        }
      }

      [v30 addObject:v36];
      if (v36)
      {
        uint64_t v49 = *(void *)(v36 + 80);
        if (v49 == -1)
        {

LABEL_139:
          uint64_t v36 = v39;
          v68 = v37;
          goto LABEL_140;
        }

        unint64_t v38 = *(void *)(v36 + 88) + v49;
      }

      else
      {
        unint64_t v38 = 0LL;
      }

      if (!v39 || v38 >= v17) {
        goto LABEL_139;
      }
LABEL_60:
      __int128 v50 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
      __int128 v51 = v50;
      if (v50)
      {
        unint64_t v52 = *(void *)(v39 + 16);
        if (v52 <= v38) {
          unint64_t v52 = v38;
        }
        v50->_unint64_t start = v52;
        unint64_t v53 = *(void *)(v39 + 24) + *(void *)(v39 + 16);
        if (v53 >= v17) {
          unint64_t v53 = v17;
        }
        if (v53 < v52) {
LABEL_187:
        }
          __assert_rtn("-[FPMemoryRegion setEnd:]", "FPMemoryRegion.m", 185, "end >= self.start");
        v50->_size = v53 - v52;
        if (v52 == -1LL) {
          unint64_t v54 = -1LL;
        }
        else {
          unint64_t v54 = v53;
        }
      }

      else
      {
        unint64_t v54 = 0LL;
      }

      __int128 v55 = sub_10000DEA0((uint64_t)v108, v54, v17);
      uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
      uint64_t v36 = v56;
      if (v39 == v56)
      {
LABEL_74:
        if (!v51) {
          goto LABEL_84;
        }
        unint64_t v59 = v51->_start;
        goto LABEL_83;
      }

      if (v51)
      {
        unint64_t v57 = v51->_start;
        if (v56) {
          goto LABEL_72;
        }
      }

      else
      {
        unint64_t v57 = 0LL;
        if (v56)
        {
LABEL_72:
          uint64_t v58 = *(void *)(v56 + 16);
          goto LABEL_73;
        }
      }

      uint64_t v58 = 0LL;
LABEL_73:
      if (((v58 | v57) & v105) != 0) {
        goto LABEL_74;
      }
      if (!v51) {
        goto LABEL_84;
      }
      unint64_t v59 = v51->_start;
      if (v59 == -1LL) {
        uint64_t v60 = -1LL;
      }
      else {
        uint64_t v60 = v51->_size + v59;
      }
      unint64_t v61 = (v60 + v105) & v102;
      BOOL v43 = v61 >= v59;
      unint64_t v62 = v61 - v59;
      if (!v43) {
        goto LABEL_187;
      }
      v51->_size = v62;
LABEL_83:
      v51->_user_tag = *(_DWORD *)(a4 + 20);
      v51->_object_id = *(void *)(a4 + 68);
      v51->_share_mode = *(_BYTE *)(a4 + 47);
      v51->_offset = v59 - v109 + *(void *)(a4 + 12);
      *((_BYTE *)v51 + 8) |= 2u;
LABEL_84:
      id v63 = *(id *)(v39 + 32);
      -[FPMemoryRegion setName:](v51, "setName:", v63);

      id v64 = *(id *)(v39 + 40);
      -[FPMemoryRegion setDetailedName:](v51, "setDetailedName:", v64);

      int v65 = *(unsigned __int8 *)(v39 + 8);
      if (v51)
      {
        v51->_segment = v65;
        *((_BYTE *)v51 + _Block_object_dispose((const void *)(v11 - 96), 8) = *((_BYTE *)v51 + 8) & 0xFE | (*(_WORD *)(a4 + 60) != 0);
      }

      if (v65 == 2 || v65 == 4)
      {
        v66 = (void *)v28[21];
        if (v66)
        {
          v28[21] = 0LL;
        }
      }

      else if (([v28 _populateMemoryRegionWithPageQueries:v51 regionInfo:a4] & 1) == 0)
      {

LABEL_149:
        uint64_t v27 = 1LL;
        goto LABEL_141;
      }

      [v30 addObject:v51];
      if (v51)
      {
        unint64_t v67 = v51->_start;
        if (v67 == -1LL) {
          unint64_t v38 = -1LL;
        }
        else {
          unint64_t v38 = v51->_size + v67;
        }
      }

      else
      {
        unint64_t v38 = 0LL;
      }

      v68 = (unsigned __int8 *)(id)v39;

      uint64_t v37 = v68;
      if (v38 >= v17) {
        goto LABEL_140;
      }
    }
  }

  uint64_t v27 = 0LL;
LABEL_186:

  return v27;
}

void sub_10000B934(_Unwind_Exception *a1)
{
}

void sub_10000B960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = sub_10000A7C8;
  v14[4] = sub_10000A7D8;
  id v15 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000BAEC;
  v10[3] = &unk_1000291C8;
  __int128 v11 = *(_OWORD *)(a1 + 32);
  uint64_t v12 = v14;
  uint64_t v13 = a2;
  if ((dyld_image_for_each_segment_info(a2, v10) & 1) == 0
    && !*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to iterate over image segments"));
    mach_vm_address_t v6 = __stderrp;
    id v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayString]);
    BOOL v8 = (const char *)[v7 UTF8String];
    id v9 = v5;
    fprintf(v6, "%s: %s\n", v8, (const char *)[v9 UTF8String]);

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v9];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  _Block_object_dispose(v14, 8);

  objc_autoreleasePoolPop(v4);
}

void sub_10000BAD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000BAEC(void *a1, char *__s, unint64_t a3, unint64_t a4)
{
  if (a4)
  {
    id v6 = (id)strlen(__s);
    uint64_t v7 = 0LL;
    BOOL v8 = 0LL;
    id v9 = 0LL;
    do
    {
      int v10 = (unint64_t *)((char *)&unk_1000349C0 + 8 * v7);
      __int128 v11 = (void *)atomic_load(v10);
      uint64_t v12 = v11;

      if (v11)
      {
        BOOL v8 = v12;
      }

      else
      {
        if (!v9) {
          id v9 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  __s,  v6,  4LL);
        }
        while (1)
        {
          BOOL v8 = (NSString *)__ldaxr(v10);
          if (v8) {
            break;
          }
          if (!__stlxr((unint64_t)v9, v10))
          {
            id v15 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
            BOOL v8 = v9;
            goto LABEL_19;
          }
        }

        __clrex();
        id v13 = v8;
      }

      if ((id)-[NSString length](v8, "length") == v6)
      {
        id v14 = v53;
        if (!-[NSString getCString:maxLength:encoding:](v8, "getCString:maxLength:encoding:", v53, 32LL, 4LL)) {
          id v14 = -[NSString UTF8String](v8, "UTF8String");
        }
        if (!strncmp(v14, __s, (size_t)v6))
        {
          BOOL v8 = v8;

          id v9 = v8;
          goto LABEL_20;
        }
      }

      ++v7;
    }

    while (v7 != 16);
    if (!v9)
    {
      id v15 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  __s,  v6,  4LL);
LABEL_19:
      id v9 = v15;
    }

LABEL_20:
    unint64_t v16 = a3;
    uint64_t v17 = *(void *)(a1[4] + 24LL);
    if (v17 && (unint64_t v18 = *(void *)(v17 + 24), v18 <= a3) && *(void *)(v17 + 32) + v18 > a3)
    {
      if (-[NSString isEqualToString:](v9, "isEqualToString:", @"__LINKEDIT"))
      {
        uint64_t v19 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
        LOBYTE(v19) = [v19 containsObject:v20];

        if ((v19 & 1) != 0)
        {
LABEL_64:

          return;
        }

        unint64_t v21 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
        [v21 addObject:v22];

        __int128 v23 = @"dyld shared cache";
LABEL_58:
        int v46 = objc_alloc_init(&OBJC_CLASS___FPImage);
        uint64_t v47 = v46;
        if (v46)
        {
          v46->_unint64_t start = v16;
          v46->_size = a4;
          if (v9) {
            uint64_t v48 = (__CFString *)v9;
          }
          else {
            uint64_t v48 = @"unknown";
          }
          sub_10000DD40((uint64_t)v46, v48);
          objc_setProperty_nonatomic_copy(v47, v49, v23, 40LL);
        }

        else
        {
          if (v9) {
            __int128 v50 = (__CFString *)v9;
          }
          else {
            __int128 v50 = @"unknown";
          }
          sub_10000DD40(0LL, v50);
        }

        [*(id *)(a1[4] + 136) addObject:v47];

        goto LABEL_64;
      }

      int v24 = 1;
    }

    else
    {
      int v24 = 0;
    }

    unint64_t v25 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
    if (!v25)
    {
      file_path = (const char *)dyld_image_get_file_path(a1[7]);
      if (file_path || (file_path = (const char *)dyld_image_get_installname(a1[7])) != 0LL)
      {
        if (v24)
        {
          uint64_t v27 = 0LL;
          unsigned int v28 = 0;
          uint64_t v29 = 0LL;
          unint64_t v30 = ((a3 >> 16) ^ (a3 >> 8) ^ (a3 >> 24) ^ a3) % 0x7FF;
          do
          {
            uint64_t v31 = (unint64_t *)((char *)&unk_100034A40 + 8 * v30);
            uint64_t v32 = (void *)atomic_load(v31);
            uint64_t v33 = v32;

            if (v32)
            {
              uint64_t v27 = v33;
            }

            else
            {
              if (!v29) {
                uint64_t v29 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  file_path);
              }
              while (1)
              {
                uint64_t v27 = (NSString *)__ldaxr(v31);
                if (v27) {
                  break;
                }
                if (!__stlxr((unint64_t)v29, v31))
                {
                  int v34 = 1;
                  goto LABEL_40;
                }
              }

              int v34 = 0;
              __clrex();
LABEL_40:
              if (v34)
              {
                uint64_t v39 = (NSString *)objc_claimAutoreleasedReturnValue(v29);
                uint64_t v27 = v29;
                goto LABEL_54;
              }

              id v35 = v27;
            }

            uint64_t v36 = v53;
            if (!-[NSString getCString:maxLength:encoding:](v27, "getCString:maxLength:encoding:", v53, 1025LL, 4LL)) {
              uint64_t v36 = -[NSString UTF8String](v27, "UTF8String");
            }
            if (!strcmp(v36, file_path))
            {
              uint64_t v27 = v27;

              uint64_t v29 = v27;
              goto LABEL_55;
            }

            uint64_t v37 = ((v30 + 1) * (unsigned __int128)0x20040080100201uLL) >> 64;
            unint64_t v30 = v30 + 1 - 2047 * ((v37 + ((v30 + 1 - v37) >> 1)) >> 10);
          }

          while (v28++ < 0x11);
          if (v29) {
            goto LABEL_55;
          }
          uint64_t v39 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", file_path);
LABEL_54:
          uint64_t v29 = v39;
LABEL_55:
          unint64_t v16 = a3;

          uint64_t v45 = *(void *)(a1[6] + 8LL);
          uint64_t v40 = *(NSString **)(v45 + 40);
          *(void *)(v45 + 40) = v29;
        }

        else
        {
          uint64_t v40 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", file_path);
          uint64_t v41 = objc_claimAutoreleasedReturnValue(-[NSString stringByResolvingSymlinksInPath](v40, "stringByResolvingSymlinksInPath"));
          uint64_t v42 = *(void *)(a1[6] + 8LL);
          BOOL v43 = *(void **)(v42 + 40);
          *(void *)(v42 + 40) = v41;
        }
      }

      else
      {
        uint64_t v44 = *(void *)(a1[6] + 8LL);
        uint64_t v40 = *(NSString **)(v44 + 40);
        *(void *)(v44 + 40) = @"unknown dylib";
      }

      unint64_t v25 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
    }

    __int128 v23 = v25;
    goto LABEL_58;
  }

int64_t sub_10000C024(id a1, id a2, id a3)
{
  uint64_t v4 = a2;
  unint64_t v5 = a3;
  if (v4)
  {
    unint64_t v6 = v4[2];
    if (v5)
    {
LABEL_3:
      unint64_t v7 = v5[2];
      goto LABEL_4;
    }
  }

  else
  {
    unint64_t v6 = 0LL;
    if (v5) {
      goto LABEL_3;
    }
  }

  unint64_t v7 = 0LL;
LABEL_4:
  if (v6 >= v7)
  {
    if (v4)
    {
      unint64_t v9 = v4[2];
      if (v5)
      {
LABEL_8:
        unint64_t v10 = v5[2];
LABEL_9:
        int64_t v8 = v9 > v10;
        goto LABEL_10;
      }
    }

    else
    {
      unint64_t v9 = 0LL;
      if (v5) {
        goto LABEL_8;
      }
    }

    unint64_t v10 = 0LL;
    goto LABEL_9;
  }

  int64_t v8 = -1LL;
LABEL_10:

  return v8;
}

const char *__cdecl sub_10000C240(id a1, int64_t a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  id v3 = objc_claimAutoreleasedReturnValue([v2 stringValue]);
  uint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

const char *__cdecl sub_10000C29C(id a1, int64_t a2)
{
  int v2 = "-";
  id v3 = "N";
  if ((_DWORD)a2 == 3) {
    id v3 = "Y";
  }
  if ((_DWORD)a2 != 1) {
    int v2 = v3;
  }
  if ((_DWORD)a2) {
    return v2;
  }
  else {
    return 0LL;
  }
}

LABEL_38:
  return v16;
}

LABEL_53:
        ++v57;
        ++v37;
        if (v38 == v57) {
          goto LABEL_57;
        }
      }

      unint64_t v62 = sub_10000D364((uint64_t)(p_vtable + 62), (uint64_t *)v37, v47, v105, v104, 0LL, 0);
      id v63 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue(v62);
      id v64 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  v61,  0LL);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v40->_mapsAuxData, "setObject:forKeyedSubscript:", v64, v63);

      goto LABEL_52;
    }

LABEL_57:
    CSRelease(v105, v104);
    id v15 = v102;
  }

  v79 = vm_deallocate(mach_task_self_, (vm_address_t)names, 80LL * infoCnt[1]);
  if (v79)
  {
    int v80 = v79;
    v81 = __stderrp;
    v82 = objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v40, "displayString"));
    v83 = (const char *)[v82 UTF8String];
    v84 = mach_error_string(v80);
    fprintf(v81, "%s: vm_deallocate: %s\n", v83, v84);
  }

  unint64_t v85 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176LL * memory_infoCnt);
  if (v85)
  {
    int v86 = v85;
    uint64_t v87 = __stderrp;
    v88 = objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v40, "displayString"));
    v89 = (const char *)[v88 UTF8String];
    v90 = mach_error_string(v86);
    fprintf(v87, "%s: vm_deallocate: %s\n", v89, v90);
  }

  -[FPProcess setMemoryRegions:](v40, "setMemoryRegions:", v15);
  if (v40)
  {
    if (qword_100038A80 != -1) {
      dispatch_once(&qword_100038A80, &stru_100029EE0);
    }
    *(void *)&v111 = qword_100038A78;
    if ((qword_100038A78 & 0x8000000000000000LL) == 0)
    {
      v91 = *((void *)&xmmword_100038A58 + 1);
      if ((*((void *)&xmmword_100038A58 + 1) & 0x8000000000000000LL) == 0)
      {
        v92 = malloc(48 * qword_100038A78);
        if ((ledger(1LL, -[FPProcess pid](v40, "pid"), v92, &v111) & 0x80000000) != 0)
        {
          free(v92);
        }

        else
        {
          if (v91 >= (uint64_t)v111)
          {
            v98 = _os_assert_log(0LL, v93, v94);
            _os_crash(v98);
            __break(1u);
          }

          v95 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  *((void *)v92 + 6 * v91) & ~(*((uint64_t *)v92 + 6 * v91) >> 63),  0LL);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40->_otherAuxData,  "setObject:forKeyedSubscript:",  v95,  @"billed footprint");

          free(v92);
          if (!proc_pid_rusage(v40->super._pid, 6, buffer))
          {
            v96 = objc_alloc(&OBJC_CLASS___FPAuxData);
            uint64_t v97 = -[FPAuxData initWithValue:shouldAggregate:](v96, "initWithValue:shouldAggregate:", buffer[30], 0LL);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v40->_otherAuxData,  "setObject:forKeyedSubscript:",  v97,  @"billed footprint peak");
          }
        }
      }
    }
  }

LABEL_3:
}

__CFString *sub_10000D364( uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  id v13 = a3;
  objc_opt_self(a1);
  uint64_t v14 = *a2;
  if ((*a2 & 0x400) == 0
    || (id v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  a2 + 12))) == 0LL)
  {
    switch((char)v14)
    {
      case 0:
        unint64_t v16 = a2[1];
        if (v16 > 0xFF) {
          goto LABEL_7;
        }
        id v15 = off_1000292B0[v16];
        if (v15) {
          break;
        }
        unint64_t v16 = a2[1];
LABEL_7:
        uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VM_KERN_MEMORY_%llu",  v16,  v28);
        goto LABEL_23;
      case 1:
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a2[1]));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v18]);

        if (!v19
          || (id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kCFBundleIdentifierKey])) == 0)
        {
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unloaded kmod %llu",  a2[1]));
        }

        if (!v15) {
          goto LABEL_29;
        }
        break;
      case 2:
        uint64_t v20 = a2[1];
        if (v20)
        {
          uint64_t SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime(a4, a5, v20, 0x8000000000000000LL);
          uint64_t Name = CSSymbolGetName(SymbolWithAddressAtTime);
          if (Name)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", Name));
            goto LABEL_24;
          }
        }

        if (a2[2])
        {
          uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"site 0x%qx",  a2[1],  v28);
          goto LABEL_23;
        }

        id v15 = 0LL;
        goto LABEL_30;
      case 3:
        unint64_t v24 = a2[1];
        if (v24 > 0xE) {
          goto LABEL_20;
        }
        unint64_t v25 = off_100029AB0[v24];
        if (v24 != 14)
        {
          id v15 = v25;
          if (a6) {
            goto LABEL_26;
          }
          goto LABEL_30;
        }

        unint64_t v24 = a2[1];
LABEL_20:
        uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VM_KERN_COUNT_%llu",  v24,  v28);
LABEL_23:
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v17);
LABEL_24:
        id v15 = (__CFString *)v23;
        if (!v23) {
          goto LABEL_29;
        }
        break;
      default:
        uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown site (0x%x, 0x%qx)",  v14,  a2[1]);
        goto LABEL_23;
    }
  }

  if (a6)
  {
LABEL_26:
    if ((*a2 & 0x800) != 0 && *((unsigned __int16 *)a2 + 33) < a7)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%.*s]",  v15,  80LL,  a6 + 80LL * *((unsigned __int16 *)a2 + 33)));

      id v15 = (__CFString *)v26;
      if (!v26) {
LABEL_29:
      }
        id v15 = @"unknown";
    }
  }

int64x2_t *sub_10000D88C(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (result)
  {
    unint64_t v5 = result;
    uint64_t result = sub_10000D8D4((int64x2_t *)result->i64[1], a2, a3, a4, *a5, a5[1], a5[2], a5[3], a5[4]);
    v5->i64[1] = (uint64_t)result;
  }

  return result;
}

int64x2_t *sub_10000D8D4( int64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = (int64x2_t *)malloc(0x40uLL);
  unint64_t v18 = v17;
  if (!a1)
  {
    v17->i64[0] = a2;
    v17->i64[1] = a3;
    v17[1].i64[0] = a7;
    v17[1].i64[1] = a5;
    v17[2].i64[0] = a6;
    v17[2].i64[1] = a8;
    a1 = v17;
    v17[3].i64[0] = a9;
    v17[3].i64[1] = 0LL;
    return a1;
  }

  uint64_t v19 = 0LL;
  v18->i64[0] = a2;
  v18->i64[1] = a3;
  v18[1].i64[0] = a7;
  v18[1].i64[1] = a5;
  uint64_t v20 = a4 - 1;
  uint64_t v21 = -a4;
  v18[2].i64[0] = a6;
  v18[2].i64[1] = a8;
  unint64_t v22 = a2 & -a4;
  unint64_t v23 = (a2 + a3 + a4 - 1) & -a4;
  unint64_t v24 = a1;
  v18[3].i64[0] = a9;
  v18[3].i64[1] = 0LL;
  do
  {
    unint64_t v25 = (uint64_t *)v24;
    if (((v24->i64[0] + v20 + v24->i64[1]) & (unint64_t)v21) >= v22)
    {
      unint64_t v25 = v19;
      if ((v24->i64[0] & (unint64_t)v21) > v23)
      {
        unint64_t v25 = v19;
        if (!v19) {
          goto LABEL_12;
        }
LABEL_7:
        uint64_t v26 = (int64x2_t *)v25[7];
        if (v26 == v24)
        {
          v25[7] = (uint64_t)v18;
          v18[3].i64[1] = (uint64_t)v24;
          return a1;
        }

        uint64_t v27 = a1;
        if (v26) {
          goto LABEL_14;
        }
        return v27;
      }
    }

    unint64_t v24 = (int64x2_t *)v24[3].i64[1];
    uint64_t v19 = v25;
  }

  while (v24);
  if (v25) {
    goto LABEL_7;
  }
LABEL_12:
  if (v24 == a1)
  {
    v18[3].i64[1] = (uint64_t)a1;
    return v18;
  }

  v18[3].i64[1] = a1[3].i64[1];
  uint64_t v26 = a1;
  uint64_t v27 = v18;
LABEL_14:
  if (v26 == v24) {
    return v27;
  }
  do
  {
    uint64_t v28 = v26;
    unint64_t v29 = v26->i64[0];
    unint64_t v30 = v26->i64[0] & v21;
    unint64_t v31 = v26->i64[1] + v26->i64[0];
    unint64_t v32 = (v31 + v20) & v21;
    if (v22 > v30) {
      unint64_t v30 = v22;
    }
    if (v23 < v32) {
      unint64_t v32 = v23;
    }
    BOOL v33 = v32 >= v30;
    unint64_t v34 = v32 - v30;
    if (!v33) {
      unint64_t v34 = 0LL;
    }
    int64x2_t v35 = v26[1];
    uint64x2_t v36 = (uint64x2_t)vdupq_n_s64(v34);
    int64x2_t v37 = v18[1];
    int64x2_t v38 = v18[2];
    int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v35), (int8x16_t)v37, (int8x16_t)v35);
    int8x16_t v40 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v35, v37), v36);
    v18[1] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v40, v39);
    int64x2_t v41 = v26[2];
    int8x16_t v42 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v41, v38), v36);
    int8x16_t v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v41), (int8x16_t)v38, (int8x16_t)v41);
    v18[2] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v42, (uint64x2_t)v43), v42, v43);
    unint64_t v44 = v18[3].u64[0];
    unint64_t v45 = v26[3].u64[0];
    uint64_t v46 = v26[3].i64[1];
    BOOL v33 = v45 + v44 >= v34;
    unint64_t v47 = v45 + v44 - v34;
    if (!v33) {
      unint64_t v47 = 0LL;
    }
    if (v44 <= v45) {
      unint64_t v44 = v26[3].u64[0];
    }
    if (v47 <= v44) {
      unint64_t v47 = v44;
    }
    if (v29 >= v18->i64[0]) {
      unint64_t v29 = v18->i64[0];
    }
    if (v18->i64[1] + v18->i64[0] > v31) {
      unint64_t v31 = v18->i64[1] + v18->i64[0];
    }
    v18->i64[0] = v29;
    v18->i64[1] = v31 - v29;
    v18[3].i64[0] = v47;
    v18[3].i64[1] = v46;
    uint64_t v26 = (int64x2_t *)v26[3].i64[1];
    free(v28);
    a1 = v18;
    if (v25)
    {
      v25[7] = (uint64_t)v18;
      a1 = v27;
    }

    if (!v26) {
      break;
    }
    uint64_t v27 = a1;
  }

  while (v26 != v24);
  return a1;
}

void sub_10000DB14(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = a2;
  if (a1)
  {
    unint64_t v6 = *(int64x2_t **)(a1 + 8);
    int64_t v8 = v5;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v6;
    unint64_t v5 = v8;
  }
}

void sub_10000DB8C(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = a2;
  if (a1)
  {
    uint64_t v12 = v5;
    if (v5)
    {
      id v6 = v5[13];
      if (v6)
      {
        unint64_t v7 = v6;
        sub_10000DB14(a1, v6, a3);
LABEL_7:

        unint64_t v5 = v12;
        goto LABEL_8;
      }

      int64_t v8 = v12;
      uint64_t v9 = (uint64_t)v12[9];
      uint64_t v10 = (uint64_t)v12[11];
    }

    else
    {
      int64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
    }

    __int128 v11 = sub_10000D8D4( *(int64x2_t **)(a1 + 8),  v9,  v10,  a3,  (uint64_t)[v8 dirtySize],  (uint64_t)[v12 swappedSize],  (uint64_t)[v12 cleanSize],  (uint64_t)[v12 reclaimableSize],  (uint64_t)[v12 wiredSize]);
    unint64_t v7 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v11;
    goto LABEL_7;
  }

LABEL_8:
}

  unint64_t v18 = -[NSString initWithCString:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithCString:encoding:", v13, 4LL);
LABEL_11:
  if (v12) {
    uint64_t v19 = a3;
  }
  else {
    uint64_t v19 = 2;
  }
  sub_10001D2D0((void *)a1, v12, v19, v18);

LABEL_15:
}

uint64_t sub_10000DC94@<X0>(uint64_t result@<X0>, int64x2_t *a2@<X8>)
{
  int64x2_t v2 = 0uLL;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (result)
  {
    uint64_t v3 = *(void *)(result + 8);
    if (v3)
    {
      uint64_t v4 = 0LL;
      int64x2_t v5 = 0uLL;
      do
      {
        v4 += *(void *)(v3 + 16);
        int64x2_t v2 = vaddq_s64(*(int64x2_t *)(v3 + 24), v2);
        int64x2_t v5 = vaddq_s64(*(int64x2_t *)(v3 + 40), v5);
        uint64_t v3 = *(void *)(v3 + 56);
      }

      while (v3);
      a2[1].i64[0] = v4;
      *a2 = v2;
      *(int64x2_t *)((char *)a2 + 24) = v5;
    }
  }

  return result;
}

void sub_10000DD40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v9 = v3;
    id v5 = [v3 copy];
    id v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    if (([v9 hasPrefix:@"__TEXT"] & 1) != 0
      || ([v9 hasPrefix:@"__OBJC_RO"] & 1) != 0)
    {
      char v7 = 2;
    }

    else
    {
      if (([v9 hasPrefix:@"__LINKEDIT"] & 1) == 0)
      {
        unsigned int v8 = [v9 hasPrefix:@"__"];
        uint64_t v4 = v9;
        if (!v8) {
          goto LABEL_7;
        }
        char v7 = 3;
        goto LABEL_6;
      }

      char v7 = 4;
    }

    uint64_t v4 = v9;
LABEL_6:
    *(_BYTE *)(a1 + _Block_object_dispose(va, 8) = v7;
  }

LABEL_7:
}

    uint64_t v14 = -1LL;
    goto LABEL_8;
  }

id *sub_10000DE28(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___FPImageEnumerator;
    id v5 = [super init];
    a1 = v5;
    if (v5)
    {
      v5[2] = 0LL;
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

void *sub_10000DEA0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v6 = *(void *)(a1 + 16);
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) objectAtIndexedSubscript:*(void *)(a1 + 16)]);
      unsigned int v8 = v7;
      if (v7)
      {
        unint64_t v9 = v7[2];
        unint64_t v10 = v7[3] + v9;
        if (v9 <= a2 && v10 > a2)
        {
LABEL_16:
          uint64_t v12 = v7;
LABEL_18:

          return v12;
        }
      }

      else
      {
        unint64_t v10 = 0LL;
        unint64_t v9 = 0LL;
      }

      if (v9 < a3 && v10 >= a3 || v9 >= a2 && v10 <= a3) {
        goto LABEL_16;
      }
      if (v9 >= a2)
      {
        uint64_t v12 = 0LL;
        goto LABEL_18;
      }

      ++*(void *)(a1 + 16);
    }
  }

  uint64_t v12 = 0LL;
  return v12;
}

NSMapTable *sub_10000E688(uint64_t a1, void *a2)
{
  kern_return_t corpse;
  FPCorpseProcess *v84;
  id v85;
  mach_error_t v86;
  id v87;
  const char *v88;
  unsigned int v89;
  char *v90;
  id v91;
  void *v92;
  NSMapTable *v93;
  NSArray *v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  void *i;
  uint64_t v100;
  void *v101;
  int v103;
  const char *v104;
  NSMapTable *v106;
  NSMutableSet *v107;
  NSMutableSet *v108;
  NSMapTable *obj;
  id obja;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  id v131;
  stat v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  NSErrorUserInfoKey v141;
  void *v142;
  NSErrorUserInfoKey v143;
  CFStringRef v144;
  NSErrorUserInfoKey v145;
  void *v146;
  id v147;
  NSErrorUserInfoKey v148;
  void *v149;
  NSErrorUserInfoKey v150;
  void *v151;
  _BYTE v152[128];
  if (a2) {
    *a2 = 0LL;
  }
  id v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  id v4 = (NSMutableSet *)[*(id *)(a1 + 96) copy];
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v133,  v152,  16LL);
  v113 = a1;
  if (!v5)
  {
LABEL_19:

    NSUInteger v21 = -[NSMapTable count](v3, "count");
    id v22 = *(id *)(a1 + 88);
    if ([v22 count] || objc_msgSend(*(id *)(a1 + 96), "count"))
    {
    }

    else
    {
      v103 = *(unsigned __int8 *)(a1 + 9);

      if (!v103 && !v21)
      {
        if (a2)
        {
          v143 = NSLocalizedDescriptionKey;
          v144 = @"Must specify at least one process or memgraph";
          BOOL v33 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v144,  &v143,  1LL));
          int8x16_t v39 = 0LL;
          *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  8LL,  v33));
          goto LABEL_103;
        }

        int8x16_t v39 = 0LL;
        goto LABEL_104;
      }
    }

    if (*(_BYTE *)(a1 + 11)) {
      sub_100011DD8((uint64_t)&OBJC_CLASS___FPFootprint, 1);
    }
    unint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (*(_BYTE *)(a1 + 16))
    {
      unint64_t v24 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
      unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      -[NSMutableSet addObject:](v23, "addObject:", v25);
    }

    id v108 = v23;
    if ([*(id *)(a1 + 104) count])
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 104) allObjects]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[FPProcess pidsForStringDescriptions:errors:]( &OBJC_CLASS___FPProcess,  "pidsForStringDescriptions:errors:",  v26,  0LL));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 allKeys]);
      -[NSMutableSet addObjectsFromArray:](v23, "addObjectsFromArray:", v28);
    }

    if (*(_BYTE *)(a1 + 9))
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue(+[FPProcess allProcessesExcludingPids:](&OBJC_CLASS___FPProcess, "allProcessesExcludingPids:", v23));
      unint64_t v30 = v3;
      id v3 = (NSMapTable *)v29;
LABEL_88:

      if (*(_BYTE *)(a1 + 10))
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue( +[FPProcess removeIdleExitCleanProcessesFrom:]( &OBJC_CLASS___FPProcess,  "removeIdleExitCleanProcessesFrom:",  v3));
        v93 = (NSMapTable *)[v92 mutableCopy];

        id v3 = v93;
      }

      if (*(void *)(a1 + 24))
      {
        unsigned __int8 v116 = 0u;
        v117 = 0u;
        uint64_t v114 = 0u;
        v115 = 0u;
        v94 = NSAllMapTableKeys(v3);
        v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
        v96 = [v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
        if (v96)
        {
          uint64_t v97 = v96;
          v98 = *(void *)v115;
          do
          {
            for (unint64_t i = 0LL; i != v97; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v115 != v98) {
                objc_enumerationMutation(v95);
              }
              v100 = *(void *)(*((void *)&v114 + 1) + 8LL * (void)i);
              v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v3, "objectForKey:", v100));
              if ((objc_opt_respondsToSelector(v101, "physFootprint") & 1) != 0
                && (unint64_t)[v101 physFootprint] < *(void *)(a1 + 24) << 20)
              {
                -[NSMapTable removeObjectForKey:](v3, "removeObjectForKey:", v100);
              }
            }

            uint64_t v97 = [v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
          }

          while (v97);
        }
      }

      id v3 = v3;
      int8x16_t v39 = v3;
      BOOL v33 = v108;
      goto LABEL_103;
    }

    p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    int64x2_t v41 = *(void **)(a1 + 88);
    id v42 = *(id *)(a1 + 96);
    id v43 = v41;
    unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v42 allObjects]);
    v130 = 0LL;
    unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[FPProcess pidsForStringDescriptions:errors:]( &OBJC_CLASS___FPProcess,  "pidsForStringDescriptions:errors:",  v44,  &v130));
    uint64_t v46 = (NSMapTable *)v130;
    [v43 addEntriesFromDictionary:v45];

    if (a2 && v46)
    {
      unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable componentsJoinedByString:](v46, "componentsJoinedByString:", @"\n"));
      v141 = NSLocalizedDescriptionKey;
      v142 = v47;
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  4LL,  v48));
    }

    id v106 = v46;
    id v49 = *(id *)(a1 + 88);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v108, "allObjects"));
    [v49 removeObjectsForKeys:v50];

    if (*(_BYTE *)(a1 + 8))
    {
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 88) allKeys]);
      unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess childPidsForPids:](&OBJC_CLASS___FPProcess, "childPidsForPids:", v51));

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      id v53 = v52;
      id v54 = [v53 countByEnumeratingWithState:&v126 objects:v140 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v127;
        do
        {
          for (j = 0LL; j != v55; j = (char *)j + 1)
          {
            if (*(void *)v127 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v126 + 1) + 8LL * (void)j);
            unint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [*(id *)(a1 + 88) setObject:v59 forKeyedSubscript:v58];
          }

          id v55 = [v53 countByEnumeratingWithState:&v126 objects:v140 count:16];
        }

        while (v55);
      }

      p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    }

    if (*(_BYTE *)(a1 + 13))
    {
      uint64_t v60 = objc_alloc(&OBJC_CLASS___NSMutableSet);
      unint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 88) allKeys]);
      unint64_t v62 = -[NSMutableSet initWithArray:](v60, "initWithArray:", v61);

      -[NSMutableSet unionSet:](v62, "unionSet:", v108);
      -[NSMutableSet addObject:](v62, "addObject:", &off_10002C188);
      id v63 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[FPProcess allProcessesExcludingPids:]( &OBJC_CLASS___FPProcess,  "allProcessesExcludingPids:",  v62));
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      id v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v63, "objectEnumerator"));
      id v65 = [v64 countByEnumeratingWithState:&v122 objects:v139 count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v123;
        do
        {
          for (k = 0LL; k != v66; k = (char *)k + 1)
          {
            if (*(void *)v123 != v67) {
              objc_enumerationMutation(v64);
            }
            [*(id *)(*((void *)&v122 + 1) + 8 * (void)k) setHiddenFromDisplay:1];
          }

          id v66 = [v64 countByEnumeratingWithState:&v122 objects:v139 count:16];
        }

        while (v66);
      }

      id v3 = v63;
      p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    }

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obja = *(id *)(a1 + 88);
    id v69 = [obja countByEnumeratingWithState:&v118 objects:v138 count:16];
    if (!v69)
    {
LABEL_87:

      unint64_t v30 = v106;
      goto LABEL_88;
    }

    id v70 = v69;
    uint64_t v112 = *(void *)v119;
LABEL_63:
    uint64_t v71 = 0LL;
    while (1)
    {
      if (*(void *)v119 != v112) {
        objc_enumerationMutation(obja);
      }
      uint64_t v72 = *(void **)(*((void *)&v118 + 1) + 8 * v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 88) objectForKeyedSubscript:v72]);
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([p_vtable + 27 processWithPid:[v72 longValue]]);
      id v75 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      unsigned __int8 v76 = [v73 isEqual:v75];
      unsigned __int8 v77 = v76;
      if (!v74)
      {

        if ((v77 & 1) != 0)
        {
          [v72 longValue];
          warnx("Unable to analyze process with pid %ld (try as root?)");
        }

        else
        {
          [v73 UTF8String];
          [v72 longValue];
          warnx("Unable to analyze process %s [%ld] (try as root?)");
        }

        goto LABEL_79;
      }

      v78 = v3;
      if ((v76 & 1) == 0)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue([v74 name]);
        unsigned __int8 v80 = [v79 isEqualToString:v73];

        if ((v80 & 1) != 0) {
          goto LABEL_71;
        }
        v81 = __stderrp;
        id v75 = objc_claimAutoreleasedReturnValue([v74 name]);
        p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
        fprintf( v81, "Found process %s [%d] from partial name %s\n", (const char *)[v75 UTF8String], [v74 pid], (const char *)[v73 UTF8String]);
      }

LABEL_71:
      if (!*(_BYTE *)(v113 + 14))
      {
        id v3 = v78;
LABEL_76:
        a1 = v113;
        goto LABEL_77;
      }

      uint64_t v82 = objc_opt_class(&OBJC_CLASS___FPUserProcess);
      id v3 = v78;
      if ((objc_opt_isKindOfClass(v74, v82) & 1) == 0) {
        goto LABEL_76;
      }
      corpse = task_generate_corpse((task_t)[v74 task], (mach_port_t *)&v132);
      a1 = v113;
      if (corpse)
      {
        int v86 = corpse;
        uint64_t v87 = objc_claimAutoreleasedReturnValue([v74 name]);
        v88 = (const char *)[v87 UTF8String];
        v89 = [v74 pid];
        v90 = mach_error_string(v86);
        id v104 = v88;
        p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
        warnx("Unable to fork a corpse of process %s [%d]: %s", v104, v89, v90);

        goto LABEL_78;
      }

      v84 = objc_alloc(&OBJC_CLASS___FPCorpseProcess);
      unint64_t v85 = sub_100011884(v84, v132.st_dev);

      mach_port_deallocate(mach_task_self_, v132.st_dev);
      uint64_t v74 = v85;
LABEL_77:
      -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v74, v72);
LABEL_78:

LABEL_79:
      if (v70 == (id)++v71)
      {
        v91 = [obja countByEnumeratingWithState:&v118 objects:v138 count:16];
        id v70 = v91;
        if (!v91) {
          goto LABEL_87;
        }
        goto LABEL_63;
      }
    }
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v134;
  v107 = v4;
  obj = v3;
  v111 = *(void *)v134;
LABEL_5:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v134 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(id *)(*((void *)&v133 + 1) + 8 * v8);
    unint64_t v10 = v4;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));
    v131 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[FPMemgraphProcess processWithMemgraph:error:]( &OBJC_CLASS___FPMemgraphProcess,  "processWithMemgraph:error:",  v11,  &v131));
    id v13 = v131;

    if (v12)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 hash]));
      -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v12, v14);

      if (*(_BYTE *)(a1 + 12))
      {
        int v15 = *(_BYTE *)(a1 + 11) != 0;
        if (v15 != [v12 breakDownPhysFootprint])
        {
          unint64_t v31 = a2;
          unint64_t v32 = v13;
          BOOL v33 = v10;
          if (a2)
          {
            v150 = NSLocalizedDescriptionKey;
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Memgraph was gathered with an analysis mode that conflicts with other memgraphs or command line arguments: %@",  v9));
            v151 = v17;
            unint64_t v34 = &v151;
            int64x2_t v35 = &v150;
LABEL_34:
            uint64x2_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v35,  1LL));
            BOOL v33 = v10;
            void *v31 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  6LL,  v36));
LABEL_37:

            goto LABEL_38;
          }

          goto LABEL_39;
        }
      }

      if (*(_BYTE *)(a1 + 13))
      {
        unint64_t v31 = a2;
        unint64_t v32 = v13;
        BOOL v33 = v10;
        if (a2)
        {
          v148 = NSLocalizedDescriptionKey;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"--unmapped is not compatible with memgraphs (%@).\nRemove the flag for best effort 'unmapped' analysis (which may be more than other tools such as vmmap(1) but less than footprint(1) analyzing a running process).",  v9));
          v149 = v17;
          unint64_t v34 = &v149;
          int64x2_t v35 = &v148;
          goto LABEL_34;
        }

        goto LABEL_39;
      }

      *(_BYTE *)(a1 + 11) = [v12 breakDownPhysFootprint];
      *(_BYTE *)(a1 + 12) = 1;
      id v4 = v10;
      goto LABEL_16;
    }

    v147 = v9;
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v147, 1LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[FPProcess pidsForStringDescriptions:errors:]( &OBJC_CLASS___FPProcess,  "pidsForStringDescriptions:errors:",  v16,  0LL));

    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

    if (!v19) {
      break;
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v19]);
    a1 = v113;
    [*(id *)(v113 + 88) setObject:v20 forKeyedSubscript:v19];

    id v4 = v107;
    id v3 = obj;
LABEL_16:
    [*(id *)(a1 + 96) removeObject:v9];

    uint64_t v7 = v111;
LABEL_17:
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v133,  v152,  16LL);
      if (!v6) {
        goto LABEL_19;
      }
      goto LABEL_5;
    }
  }

  if (a2)
  {
    v145 = NSLocalizedDescriptionKey;
    unint64_t v32 = v13;
    uint64x2_t v36 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    int64x2_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error opening memgraph %@: %@",  v9,  v36));
    v146 = v37;
    int64x2_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v146,  &v145,  1LL));
    *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  7LL,  v38));

    BOOL v33 = v107;
    id v3 = obj;
    goto LABEL_37;
  }

  BOOL v33 = v107;
  id v3 = obj;
  unint64_t v32 = v13;
LABEL_38:

LABEL_39:
  int8x16_t v39 = 0LL;
LABEL_103:

LABEL_104:
  return v39;
}

uint64_t start(int a1, char *const *a2)
{
  v150 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  context = objc_autoreleasePoolPush();
  id v4 = objc_alloc(&OBJC_CLASS___FPFootprintArgs);
  if (!v4) {
    goto LABEL_64;
  }
  v163.receiver = v4;
  v163.super_class = (Class)&OBJC_CLASS___FPFootprintArgs;
  id v5 = (int64x2_t *)objc_msgSendSuper2(&v163, "init");
  id v6 = v5;
  if (!v5)
  {
    id v4 = (FPFootprintArgs *)(id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  0LL,  0LL));
LABEL_64:
    unint64_t v44 = v4;
    goto LABEL_98;
  }

  v5->i16[4] = 0;
  v5->i8[10] = 0;
  v5[2] = vdupq_n_s64(1uLL);
  uint64_t v7 = (void *)v5[4].i64[1];
  v5[4].i64[1] = 0LL;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = (void *)v6[5].i64[1];
  v6[5].i64[1] = v8;

  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = (void *)v6[6].i64[0];
  v6[6].i64[0] = v10;

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v13 = (void *)v6[6].i64[1];
  v6[6].i64[1] = v12;

  *(__int16 *)((char *)&v6->i16[5] + 1) = 1;
  v6[3].i64[0] = 0LL;
  objc_storeStrong((id *)&v6[4], @"Dirty");
  v6[7].i64[0] = 0LL;
  *(__int16 *)((char *)&v6->i16[7] + 1) = 256;
  v6[3].i64[1] = 0LL;
  uint64_t v167 = 0LL;
  v205.name = "all";
  v205.has_arg = 0;
  v205.flag = 0LL;
  v205.val = 97;
  v206 = "json";
  int v207 = 1;
  uint64_t v208 = 0LL;
  int v209 = 106;
  v210 = "perfdata";
  int v211 = 1;
  uint64_t v212 = 0LL;
  int v213 = 262;
  v214 = "help";
  int v215 = 0;
  uint64_t v216 = 0LL;
  int v217 = 104;
  v218 = "targetChildren";
  int v219 = 0;
  uint64_t v220 = 0LL;
  int v221 = 116;
  v222 = "";
  int v223 = 1;
  uint64_t v224 = 0LL;
  int v225 = 112;
  v226 = "proc";
  int v227 = 1;
  v228 = (char *)&v167 + 4;
  int v229 = 1;
  v230 = "exclude";
  int v231 = 1;
  uint64_t v232 = 0LL;
  int v233 = 120;
  v234 = "pid";
  int v235 = 1;
  v236 = &v167;
  int v237 = 1;
  v238 = "skip";
  int v239 = 0;
  uint64_t v240 = 0LL;
  int v241 = 115;
  v242 = "minFootprint";
  int v243 = 1;
  uint64_t v244 = 0LL;
  int v245 = 267;
  v246 = "forkCorpse";
  int v247 = 0;
  uint64_t v248 = 0LL;
  int v249 = 265;
  v250 = "";
  int v251 = 0;
  uint64_t v252 = 0LL;
  int v253 = 118;
  v254 = "format";
  int v255 = 1;
  uint64_t v256 = 0LL;
  int v257 = 102;
  v258 = "sort";
  int v259 = 1;
  uint64_t v260 = 0LL;
  int v261 = 260;
  v262 = "summary";
  int v263 = 0;
  uint64_t v264 = 0LL;
  int v265 = 121;
  v266 = "physFootprint";
  int v267 = 0;
  uint64_t v268 = 0LL;
  int v269 = 256;
  v270 = "vmObjectDirty";
  int v271 = 0;
  uint64_t v272 = 0LL;
  int v273 = 257;
  v274 = "wide";
  int v275 = 0;
  uint64_t v276 = 0LL;
  int v277 = 119;
  v278 = "swapped";
  int v279 = 0;
  uint64_t v280 = 0LL;
  int v281 = 258;
  v282 = "wired";
  int v283 = 0;
  uint64_t v284 = 0LL;
  int v285 = 259;
  v286 = "unmapped";
  int v287 = 0;
  uint64_t v288 = 0LL;
  int v289 = 261;
  v290 = "sample";
  int v291 = 1;
  uint64_t v292 = 0LL;
  int v293 = 263;
  v294 = "sample-duration";
  int v295 = 1;
  uint64_t v296 = 0LL;
  int v297 = 264;
  v298 = "noCategories";
  int v299 = 0;
  uint64_t v300 = 0LL;
  int v301 = 266;
  v302 = "layout";
  int v303 = 1;
  uint64_t v304 = 0LL;
  int v305 = 108;
  v306 = "ioaccel";
  int v307 = 0;
  uint64_t v308 = 0LL;
  int v309 = 268;
  __int128 v310 = 0u;
  __int128 v311 = 0u;
  optreset = 1;
  optind = 1;
  optarg = 0LL;
  while (2)
  {
    while (1)
    {
      int v14 = getopt_long_only(a1, a2, "aj:htp:x:svf:yw", &v205, 0LL);
      int v15 = v14;
      if (v14 <= 255) {
        break;
      }
      switch(v14)
      {
        case 256:
          warnx("WARNING: --physFootprint option is deprecated because it is the default mode");
          continue;
        case 257:
          *(__int16 *)((char *)&v6->i16[5] + 1) = 256;
          continue;
        case 258:
          v6[3].i64[0] |= 2uLL;
          continue;
        case 259:
          v6[3].i64[0] |= 1uLL;
          continue;
        case 260:
          __int128 v158 = 0u;
          __int128 v159 = 0u;
          __int128 v156 = 0u;
          __int128 v157 = 0u;
          id v29 = sub_10001A164();
          unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          id v31 = [v30 countByEnumeratingWithState:&v156 objects:&handler count:16];
          if (!v31) {
            goto LABEL_68;
          }
          uint64_t v32 = *(void *)v157;
LABEL_34:
          uint64_t v33 = 0LL;
          while (1)
          {
            if (*(void *)v157 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = *(id *)(*((void *)&v156 + 1) + 8 * v33);
            int64x2_t v35 = (const char *)[v34 UTF8String];
            if (!strcasecmp(v35, optarg)) {
              break;
            }
            if (v31 == (id)++v33)
            {
              id v31 = [v30 countByEnumeratingWithState:&v156 objects:&handler count:16];
              if (!v31)
              {
LABEL_68:

                id v49 = sub_10001A164();
                __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                __int128 v51 = (void *)[v50 componentsJoinedByString:@", "];
                unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 lowercaseString]);

                id v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unrecognized argument '%s' to --sort.\nAccepted arguments: %@",  optarg,  v52));
                v171[0] = NSLocalizedDescriptionKey;
                v172 = v53;
                id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v172,  v171,  1LL));
                id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  3LL,  v54));

                goto LABEL_92;
              }

              goto LABEL_34;
            }
          }

          objc_storeStrong((id *)&v6[4], v34);

          continue;
        case 261:
          v6->i8[13] = 1;
          continue;
        case 262:
          uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
          int64x2_t v38 = (void *)v6[5].i64[0];
          v6[5].i64[0] = v37;

          continue;
        case 263:
        case 264:
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
          [v16 doubleValue];
          double v18 = v17;

          if (v18 < 0.0 || ((*(void *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 >= 0x3FF)
          {
            unint64_t v45 = "duration";
            if (v15 == 263) {
              unint64_t v45 = "interval";
            }
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid sampling %s '%s'",  v45,  optarg));
            NSErrorUserInfoKey v192 = NSLocalizedDescriptionKey;
            v193 = v46;
            unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v193,  &v192,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  9LL,  v47));

            goto LABEL_92;
          }

          if (v15 == 263) {
            *(double *)v6[7].i64 = v18;
          }
          else {
            *(double *)&v6[7].i64[1] = v18;
          }
          break;
        case 265:
          v6->i8[14] = 1;
          continue;
        case 266:
          v6->i8[15] = 1;
          continue;
        case 267:
          __endptr[0] = 0LL;
          uint64_t v36 = strtoll(optarg, __endptr, 10);
          if (*__endptr[0] || v36 < 0 || optarg == __endptr[0])
          {
            unint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid non-negative number '%s' provided to --minFootprint.",  optarg));
            v178[0] = NSLocalizedDescriptionKey;
            v180[0] = v59;
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v180,  v178,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  12LL,  v60));

            goto LABEL_92;
          }

          v6[1].i64[1] = v36;
          continue;
        case 268:
          if (!sub_1000151EC((uint64_t)&OBJC_CLASS___FPFootprint))
          {
            NSErrorUserInfoKey v186 = NSLocalizedDescriptionKey;
            v187 = @"--ioaccel is not available on this device";
            unint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v187,  &v186,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  5LL,  v61));

            goto LABEL_92;
          }

          v6[2].i64[0] = 6LL;
          continue;
        default:
          goto LABEL_76;
      }
    }

    switch(v14)
    {
      case 'a':
        v6->i8[9] = 1;
        continue;
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'g':
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
      case 'r':
      case 'u':
        goto LABEL_76;
      case 'f':
        NSUInteger v21 = optarg;
        if (!optarg) {
          goto LABEL_75;
        }
        if (!strcmp("bytes", optarg))
        {
          v6[2].i64[1] = 0LL;
        }

        else if (!strcmp("formatted", v21))
        {
          v6[2].i64[1] = 1LL;
        }

        else
        {
          if (strcmp("pages", v21))
          {
LABEL_75:
            v176[0] = NSLocalizedDescriptionKey;
            v169[0] = @"Unrecognized argument to -f / --format.\nAccepted arguments: 'bytes', 'formatted', 'pages'.";
            unint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v169,  v176,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  2LL,  v57));

            goto LABEL_92;
          }

          v6[2].i64[1] = 2LL;
        }

        continue;
      case 'h':
        id v58 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  1LL,  0LL));
        goto LABEL_78;
      case 'j':
        uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
        unint64_t v23 = (void *)v6[4].i64[1];
        v6[4].i64[1] = v22;

        continue;
      case 'l':
        unint64_t v24 = optarg;
        if (!optarg) {
          goto LABEL_69;
        }
        if (!strcmp("v", optarg))
        {
          v6[3].i64[1] = 0LL;
        }

        else
        {
          if (strcmp("h", v24))
          {
LABEL_69:
            NSErrorUserInfoKey v188 = NSLocalizedDescriptionKey;
            v189 = @"Unrecognized argument to -l / --layout.\nAccepted arguments: 'v', 'h'.";
            id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v189,  &v188,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  11LL,  v55));

            goto LABEL_92;
          }

          v6[3].i64[1] = 1LL;
        }

        continue;
      case 'p':
        unint64_t v25 = (void *)v6[6].i64[0];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
        [v25 addObject:v26];

        continue;
      case 's':
        v6->i8[10] = 1;
        continue;
      case 't':
        v6->i8[8] = 1;
        continue;
      case 'v':
        v6[2].i64[0] = 2LL;
        continue;
      case 'w':
        v6[3].i64[0] |= 7uLL;
        continue;
      case 'x':
        uint64_t v27 = (void *)v6[6].i64[1];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
        [v27 addObject:v28];

        continue;
      case 'y':
        warnx("WARNING: -y/--summary options are deprecated because summary is the default mode");
        continue;
      default:
        if (!v14)
        {
          if (HIDWORD(v167))
          {
            uint64_t v19 = (void *)v6[6].i64[0];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
            [v19 addObject:v20];

            HIDWORD(v167) = 0;
          }

          else if ((_DWORD)v167)
          {
            __endptr[0] = 0LL;
            uint64_t v39 = strtol(optarg, __endptr, 10);
            if (optarg == __endptr[0])
            {
              NSErrorUserInfoKey v190 = NSLocalizedDescriptionKey;
              uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%s' is not a valid integer for --pid.\n\nUse -p / --proc if you meant to specify a process name.",  optarg));
              v191 = v67;
              v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v191,  &v190,  1LL));
              id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  4LL,  v68));

              goto LABEL_92;
            }

            uint64_t v40 = v39;
            int64x2_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            id v42 = (void *)v6[5].i64[1];
            id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v40));
            [v42 setObject:v41 forKeyedSubscript:v43];

            LODWORD(v167) = 0;
          }

          continue;
        }

        if (v14 == -1)
        {
          if (v6[3].i64[1] == 1)
          {
            if ((v6[2].i8[0] & 2) != 0)
            {
              uint64_t v56 = @"--layout is not compatible with -v";
              goto LABEL_82;
            }

            if (v6->i8[9])
            {
              uint64_t v56 = @"--layout is not compatible with -a";
LABEL_82:
              uint64_t v62 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v56));
              id v63 = (void *)v62;
              if (v62)
              {
                NSErrorUserInfoKey v184 = NSLocalizedDescriptionKey;
                uint64_t v185 = v62;
                id v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v185,  &v184,  1LL));
                id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  10LL,  v64));

                goto LABEL_92;
              }
            }
          }

          if (v6->i8[14] && v6->i8[9])
          {
            id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"--forkCorpse is not compatible with -a/--all due to corpse resource limits"));
            NSErrorUserInfoKey v182 = NSLocalizedDescriptionKey;
            v183 = v65;
            id v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v183,  &v182,  1LL));
            id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  10LL,  v66));

            goto LABEL_92;
          }

          if (v6->i8[11] || !v6->i8[13])
          {
            if (v6->i8[9] && v6->i8[13])
            {
              warnx("NOTICE: '--unmapped' is redundant when using -a/--all");
              goto LABEL_160;
            }
          }

          else
          {
            warnx( "WARNING: ignoring '--unmapped' because the requested analysis mode '--vmObjectDirty' does not support unma pped owned VM objects");
LABEL_160:
            v6->i8[13] = 0;
          }

          double v120 = *(double *)&v6[7].i64[1];
          if (v120 > 0.0)
          {
            double v121 = *(double *)v6[7].i64;
            if (v121 == 0.0)
            {
              warnx("WARNING: ignoring '--sample-duration' because sampling was not enabled via '--sample'");
            }

            else if (v121 > v120)
            {
              warnx("WARNING: sample interval greater than duration effectively disables sampling mode");
            }
          }

          if (a1 - optind >= 1)
          {
            v136 = &a2[optind];
            unsigned int v137 = a1 - optind + 1;
            do
            {
              v138 = *v136;
              id v139 = (id)v6[6].i64[0];
              v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v138));
              [v139 addObject:v140];

              ++v136;
              --v137;
            }

            while (v137 > 1);
          }

          id v69 = v6;
          id v48 = 0LL;
        }

        else
        {
LABEL_76:
          id v58 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FPFootprintError",  5LL,  0LL));
LABEL_78:
          id v48 = v58;
LABEL_92:
          id v69 = 0LL;
        }

        unint64_t v44 = (FPFootprintArgs *)v48;
        if (!v69)
        {
LABEL_98:
          if (v44)
          {
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs userInfo](v44, "userInfo"));
            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

            if (v72) {
              warnx("%s", (const char *)[v72 UTF8String]);
            }
          }

          sub_1000110B4();
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs domain](v44, "domain"));
          if (v73 == @"FPFootprintError")
          {
            if (-[FPFootprintArgs code](v44, "code") == (id)1)
            {
              id v69 = 0LL;
              uint64_t v70 = 0LL;
LABEL_107:

              objc_autoreleasePoolPop(context);
              uint64_t v74 = 0LL;
              goto LABEL_108;
            }
          }

          else
          {
          }

          id v69 = 0LL;
          uint64_t v70 = 64LL;
          goto LABEL_107;
        }

        if ((v69->i8[9] || v69->i8[13]) && geteuid())
        {
          warnx("Must run as root.");
          uint64_t v70 = 77LL;
          goto LABEL_107;
        }

        unsigned __int8 v76 = sub_10001A208( (id *)objc_alloc(&OBJC_CLASS___FPOutputFormatterText),  (void *)v69[2].i64[1],  (void *)v69[3].i64[0],  (void *)v69[4].i64[0],  (void *)v69[3].i64[1]);
        if (!v76)
        {
          warnx("Unable to initialize text output");

          objc_autoreleasePoolPop(context);
          uint64_t v74 = 0LL;
          uint64_t v70 = 73LL;
          goto LABEL_108;
        }

        -[NSMutableArray addObject:](v150, "addObject:", v76);
        if (!v69[4].i64[1])
        {
          id v77 = v76;
LABEL_115:
          if (v69[5].i64[0])
          {
            v78 = sub_10001929C(objc_alloc(&OBJC_CLASS___FPOutputFormatterPerfdata), (void *)v69[5].i64[0]);

            if (!v78)
            {
              warnx("Unable to create perfdata output");
              goto LABEL_131;
            }

            -[NSMutableArray addObject:](v150, "addObject:", v78);
          }

          else
          {
            v78 = v77;
          }

          v155 = v44;
          v79 = sub_10000E688((uint64_t)v69, &v155);
          uint64_t v74 = (NSMapTable *)objc_claimAutoreleasedReturnValue(v79);
          unsigned __int8 v80 = v155;

          if (v74)
          {
            if (-[NSMapTable count](v74, "count"))
            {
              if (v80)
              {
                id v81 = objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription"));
                warnx("%s", (const char *)[v81 UTF8String]);
              }

              objc_autoreleasePoolPop(context);
              if (qword_100038A38 != -1) {
                dispatch_once(&qword_100038A38, &stru_100029B28);
              }
              sub_100011E50((uint64_t)&OBJC_CLASS___FPFootprint, 1);
              location = (id *)objc_autoreleasePoolPush();
              if (*(double *)v69[7].i64 == 0.0)
              {
                BOOL v82 = (id)-[NSMapTable count](v74, "count") == (id)1;
                objc_opt_self(&OBJC_CLASS___FPFootprint);
                byte_100038A50 = v82;
                v83 = NSAllMapTableValues(v74);
                id contexta = (id)objc_claimAutoreleasedReturnValue(v83);
                v84 = v150;
                unint64_t v85 = v69;
                int v86 = sub_100011EB0((id *)objc_alloc(&OBJC_CLASS___FPFootprint), contexta);
                if (isatty(1))
                {
                  uint64_t v87 = 0LL;
                }

                else
                {
                  *(void *)&__int128 v156 = _NSConcreteStackBlock;
                  *((void *)&v156 + 1) = 3221225472LL;
                  *(void *)&__int128 v157 = sub_100011220;
                  *((void *)&v157 + 1) = &unk_100029B50;
                  *(void *)&__int128 v158 = v86;
                  v122 = sub_100011FC0((uint64_t)&OBJC_CLASS___FPFootprint, &v156);
                  uint64_t v87 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(v122);
                }

                unint64_t v123 = v85[2].u64[0];
                v124 = objc_autoreleasePoolPush();
                sub_10001202C((uint64_t)v86, v123);
                objc_autoreleasePoolPop(v124);
                v125 = objc_autoreleasePoolPush();
                sub_10001228C((uint64_t)v86);
                objc_autoreleasePoolPop(v125);
                if (v87)
                {
                  dispatch_source_cancel(v87);
                  signal(2, 0LL);
                }

                __int128 v196 = 0u;
                __int128 v197 = 0u;
                __int128 handler = 0u;
                __int128 v195 = 0u;
                v126 = v84;
                id v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v126,  "countByEnumeratingWithState:objects:count:",  &handler,  &v205,  16LL);
                if (v127)
                {
                  uint64_t v128 = *(void *)v195;
                  do
                  {
                    for (unint64_t i = 0LL; i != v127; unint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v195 != v128) {
                        objc_enumerationMutation(v126);
                      }
                      if (v86) {
                        [v86[11] addObject:*(void *)(*((void *)&handler + 1) + 8 * (void)i)];
                      }
                    }

                    id v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v126,  "countByEnumeratingWithState:objects:count:",  &handler,  &v205,  16LL);
                  }

                  while (v127);
                }

                sub_100012EC4((uint64_t)v86, (v123 >> 1) & 1, v123 & 1, v85->u8[15]);
              }

              else
              {
                v92 = v150;
                contextb = v69;
                objc_super v163 = (objc_super)0;
                __int128 v164 = 0u;
                __int128 v165 = 0u;
                __int128 v166 = 0u;
                v93 = v92;
                id v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v163,  &v205,  16LL);
                if (v94)
                {
                  uint64_t v95 = *(void *)v164;
                  do
                  {
                    for (j = 0LL; j != v94; j = (char *)j + 1)
                    {
                      if (*(void *)v164 != v95) {
                        objc_enumerationMutation(v93);
                      }
                      Class isa = v163.super_class[(void)j].isa;
                      if ((objc_opt_respondsToSelector(isa, "configureForMultipleOutputs") & 1) == 0)
                      {
                        v98 = (objc_class *)objc_opt_class(isa);
                        v99 = NSStringFromClass(v98);
                        id v100 = objc_claimAutoreleasedReturnValue(v99);
                        warnx( "Selected output format (%s) does not support sampling mode",  (const char *)[v100 UTF8String]);
                      }

                      -[objc_class configureForMultipleOutputs](isa, "configureForMultipleOutputs");
                    }

                    id v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v163,  &v205,  16LL);
                  }

                  while (v94);
                }

                dispatch_semaphore_t v144 = dispatch_semaphore_create(0LL);
                __endptr[0] = 0LL;
                __endptr[1] = (char *)__endptr;
                __endptr[2] = (char *)0x3042000000LL;
                __endptr[3] = (char *)sub_100011250;
                __endptr[4] = (char *)sub_10001125C;
                id v162 = 0LL;
                v180[0] = 0LL;
                v180[1] = v180;
                v180[2] = 0x3032000000LL;
                v180[3] = sub_100011264;
                v180[4] = sub_100011274;
                id v181 = 0LL;
                v178[0] = 0LL;
                v178[1] = v178;
                v178[2] = 0x3032000000LL;
                v178[3] = sub_100011264;
                v178[4] = sub_100011274;
                id v179 = 0LL;
                dispatch_queue_attr_t v101 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
                v142 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v101);
                dispatch_queue_t v102 = dispatch_queue_create("com.apple.footprint.sample-analysis", v142);
                v103 = dispatch_queue_create("com.apple.footprint.sample-timer", 0LL);
                id v104 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v103);
                v176[0] = 0LL;
                v176[1] = v176;
                v176[2] = 0x2020000000LL;
                char v177 = 1;
                v172 = 0LL;
                v173 = &v172;
                double v105 = *(double *)v69[7].i64 * 1000000000.0;
                uint64_t v174 = 0x2020000000LL;
                unint64_t v175 = (unint64_t)v105;
                v171[0] = 0LL;
                v171[1] = v171;
                v171[2] = 0x2020000000LL;
                v171[3] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
                uint64_t v106 = (uint64_t)v173[3];
                unint64_t v107 = 1000000000LL;
                if (v106 < 0x3B9ACA00) {
                  unint64_t v107 = (unint64_t)v173[3];
                }
                unint64_t v108 = v107 >> 1;
                dispatch_source_set_timer(v104, 0LL, v106, v107 >> 1);
                *(void *)&__int128 handler = _NSConcreteStackBlock;
                *((void *)&handler + 1) = 3221225472LL;
                *(void *)&__int128 v195 = sub_10001127C;
                *((void *)&v195 + 1) = &unk_100029BA0;
                unint64_t v109 = v104;
                *(void *)&__int128 v196 = v109;
                v198 = v176;
                v199 = v171;
                v200 = &v172;
                unint64_t v204 = v108;
                v201 = v178;
                v110 = contextb;
                *((void *)&v196 + 1) = v110;
                v202 = v180;
                v203 = __endptr;
                v111 = v102;
                *(void *)&__int128 v197 = v111;
                v141 = v93;
                *((void *)&v197 + 1) = v141;
                dispatch_source_set_event_handler(v109, &handler);
                v169[0] = 0LL;
                v169[1] = v169;
                v169[2] = 0x3020000000LL;
                char v170 = 0;
                *(void *)&__int128 v156 = _NSConcreteStackBlock;
                *((void *)&v156 + 1) = 3221225472LL;
                *(void *)&__int128 v157 = sub_1000117D4;
                *((void *)&v157 + 1) = &unk_100029BE8;
                *((void *)&v159 + 1) = v169;
                uint64_t v112 = v109;
                *(void *)&__int128 v158 = v112;
                v160 = __endptr;
                v143 = v103;
                *((void *)&v158 + 1) = v143;
                contextc = v144;
                *(void *)&__int128 v159 = contextc;
                v113 = objc_retainBlock(&v156);
                uint64_t v114 = sub_100011FC0((uint64_t)&OBJC_CLASS___FPFootprint, v113);
                v115 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(v114);
                fprintf(__stderrp, "Sampling at %.3gs interval", *(double *)v69[7].i64);
                if (v110[15] > 0.0) {
                  fprintf(__stderrp, " for %.1fs", v110[15]);
                }
                fwrite("... (<ctrl-c> to stop)\n", 0x17uLL, 1uLL, __stderrp);
                double v116 = v110[15];
                if (v116 > 0.0)
                {
                  dispatch_time_t v117 = dispatch_time(0LL, (uint64_t)(v116 * 1000000000.0));
                  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
                  v119 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
                  dispatch_after(v117, v119, v113);
                }

                dispatch_resume(v112);
                dispatch_semaphore_wait(contextc, 0xFFFFFFFFFFFFFFFFLL);
                fwrite("Analyzing and writing output...\n", 0x20uLL, 1uLL, __stderrp);
                if (v115)
                {
                  dispatch_source_cancel(v115);
                  signal(2, 0LL);
                }

                dispatch_sync(v111, &stru_100029C08);

                _Block_object_dispose(v169, 8);
                _Block_object_dispose(v171, 8);
                _Block_object_dispose(&v172, 8);
                _Block_object_dispose(v176, 8);

                _Block_object_dispose(v178, 8);
                _Block_object_dispose(v180, 8);

                _Block_object_dispose(__endptr, 8);
                objc_destroyWeak(&v162);
              }

              objc_autoreleasePoolPop(location);
              v130 = objc_autoreleasePoolPush();
              __int128 v153 = 0u;
              __int128 v154 = 0u;
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              v131 = v150;
              id v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v131,  "countByEnumeratingWithState:objects:count:",  &v151,  v168,  16LL);
              if (v132)
              {
                uint64_t v133 = *(void *)v152;
                do
                {
                  for (k = 0LL; k != v132; k = (char *)k + 1)
                  {
                    if (*(void *)v152 != v133) {
                      objc_enumerationMutation(v131);
                    }
                    v135 = *(void **)(*((void *)&v151 + 1) + 8LL * (void)k);
                    if ((objc_opt_respondsToSelector(v135, "close") & 1) != 0) {
                      [v135 close];
                    }
                  }

                  id v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v131,  "countByEnumeratingWithState:objects:count:",  &v151,  v168,  16LL);
                }

                while (v132);
              }

              objc_autoreleasePoolPop(v130);
              uint64_t v70 = 0LL;
              goto LABEL_108;
            }

            warnx("Unable to find any processes matching the supplied process names or pids (try as root?)");
            if (!v80)
            {
              uint64_t v70 = 66LL;
              goto LABEL_136;
            }

            id v89 = objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription"));
            warnx("%s", (const char *)[v89 UTF8String]);

            uint64_t v70 = 66LL;
          }

          else
          {
            id v88 = objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription"));
            warnx("%s", (const char *)[v88 UTF8String]);

            sub_1000110B4();
            uint64_t v74 = 0LL;
            uint64_t v70 = 64LL;
          }

          unint64_t v44 = v80;
          goto LABEL_135;
        }

        id v77 = sub_100015B1C(objc_alloc(&OBJC_CLASS___FPOutputFormatterJSON), (void *)v69[4].i64[1]);

        if (v77)
        {
          -[NSMutableArray addObject:](v150, "addObject:", v77);
          goto LABEL_115;
        }

        warnx("Unable to create JSON output");
LABEL_131:
        uint64_t v74 = 0LL;
        v78 = 0LL;
        uint64_t v70 = 73LL;
LABEL_135:

LABEL_136:
        objc_autoreleasePoolPop(context);
        v90 = (void *)v69[4].i64[1];
        if (v90) {
          unlink((const char *)[v90 UTF8String]);
        }
        v91 = (void *)v69[5].i64[0];
        if (v91) {
          unlink((const char *)[v91 UTF8String]);
        }
LABEL_108:

        return v70;
    }
  }

void sub_100010FA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

size_t sub_1000110B4()
{
  v0 = __stdoutp;
  id v1 = objc_claimAutoreleasedReturnValue([@"Dirty" lowercaseString]);
  fprintf( v0,  "    --sort <column>                       change the column used for sorting (default: %s)\n",  (const char *)[v1 UTF8String]);

  fwrite( "    -w, --wide                            show wide output with all columns and full paths (implies --swapped --wire d)\n --swapped                             show swapped/compressed column\n --wired                               show wired column\n --vmObjectDirty                       interpret dirty memory as viewed by VM objects in the kernel\n --unmapped                            search all processes for unmapped memory owned by the target processes\n --sample <interval>                   repeatedly gather footprint at the given sampling interval in seconds (can be fractional — e.g. 0.5)\n --sample-duration <duration>          how long to sample in seconds (default and 0 is unlimited)\n --noCategories                        exclude categories\n",  0x307uLL,  1uLL,  __stdoutp);
  size_t result = os_variant_has_internal_content("com.apple.footprint");
  if ((_DWORD)result)
  {
    fwrite("\nAppleInternal:\n", 0x10uLL, 1uLL, __stdoutp);
    fwrite("    --perfdata <file.pdj>                 print perfdata(1) output to a file\n", 0x4DuLL, 1uLL, __stdoutp);
    fwrite( "    --layout (v|h)                        layout style for text formatter v:vertical h:horizontal (default: v)\n",  0x6FuLL,  1uLL,  __stdoutp);
    size_t result = sub_1000151EC((uint64_t)&OBJC_CLASS___FPFootprint);
    if ((_DWORD)result) {
      return fwrite( "    --ioaccel                             print IOAccelMemory region descriptions, implies -v\n",  0x5EuLL,  1uLL,  __stdoutp);
    }
  }

  return result;
}

void sub_1000111DC(id a1)
{
  rlim_t rlim_max = 16 * v2.rlim_cur;
  if (16 * v2.rlim_cur >= v2.rlim_max) {
    rlim_t rlim_max = v2.rlim_max;
  }
  v2.rlim_cur = rlim_max;
  setrlimit(8, &v2);
}

size_t sub_100011220(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    *(_BYTE *)(v1 + 96) = 1;
  }
  return fwrite("Exiting early due to SIGINT\n", 0x1CuLL, 1uLL, __stderrp);
}

void sub_100011250(uint64_t a1, uint64_t a2)
{
}

void sub_10001125C(uint64_t a1)
{
}

uint64_t sub_100011264(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011274(uint64_t a1)
{
}

void sub_10001127C(uint64_t a1)
{
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  if (dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)) >= 2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
    if (*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 0;
    }

    else
    {
      __uint64_t v4 = v2 - *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
      uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8LL);
      __uint64_t v6 = *(void *)(v5 + 24);
      BOOL v7 = v4 > v6;
      unint64_t v8 = v4 - v6;
      if (v7)
      {
        *(void *)(v5 + 24) = v6 + (unint64_t)((double)v8 * 1.1);
        warnx( "WARNING: Unable to keep up with sampling interval. Increasing interval to %.3gs.",  (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) / 1000000000.0);
        uint64_t v37 = *(dispatch_source_s **)(a1 + 32);
        dispatch_time_t v38 = dispatch_time(0LL, *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL));
        dispatch_source_set_timer( v37,  v38,  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL),  *(void *)(a1 + 112));
      }
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v2;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
  if (v9)
  {
    __int128 v11 = sub_10000E688((uint64_t)v9, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v9)
    {
      if ([v10 count])
      {
        uint64_t v39 = a1;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v46;
          do
          {
            for (unint64_t i = 0LL; i != v14; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v46 != v15) {
                objc_enumerationMutation(v12);
              }
              double v17 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
              if ((objc_opt_respondsToSelector(v17, "physFootprint") & 1) != 0)
              {
                double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 asNumber]);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v18]);

                if (v19)
                {
                  id v20 = [v19 physFootprint];
                  if (v20 == [v17 physFootprint])
                  {
                    NSUInteger v21 = (void *)objc_claimAutoreleasedReturnValue([v17 asNumber]);
                    [v9 setObject:v17 forKey:v21];
                  }
                }
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }

          while (v14);
        }

        a1 = v39;
      }
    }
  }

  uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8LL);
  unint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v9;

  uint64_t v24 = *(void *)(*(void *)(a1 + 96) + 8LL);
  unint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = 0LL;

  uint64_t v26 = objc_alloc(&OBJC_CLASS___FPFootprint);
  uint64_t v27 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  id v29 = sub_100011EB0((id *)&v26->super.isa, v28);

  if (v29) {
    *((_DWORD *)v29 + 25) = 25;
  }
  uint64_t v30 = *(void *)(a1 + 40);
  if (v30) {
    uint64_t v31 = *(void *)(v30 + 32);
  }
  else {
    uint64_t v31 = 0LL;
  }
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL), v29);
  uint64_t v32 = objc_autoreleasePoolPush();
  char v33 = sub_10001202C((uint64_t)v29, v31);
  objc_autoreleasePoolPop(v32);
  if ((v33 & 1) == 0)
  {
    id v34 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011680;
    block[3] = &unk_100029B78;
    int64x2_t v35 = v29;
    int64x2_t v41 = v35;
    id v42 = *(id *)(a1 + 56);
    uint64_t v44 = v31;
    id v43 = *(id *)(a1 + 40);
    dispatch_async(v34, block);
    if (v29) {
      id v36 = v35[1];
    }
    else {
      id v36 = 0LL;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL), v36);
  }
}

void sub_100011680(uint64_t a1)
{
  __uint64_t v2 = objc_autoreleasePoolPush();
  sub_10001228C(*(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = objc_autoreleasePoolPush();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          [ *(id *)(v9 + 88) addObject: *(void *)(*((void *)&v12 + 1) + 8 * (void)i)  (void)v12];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    BOOL v11 = *(unsigned __int8 *)(v10 + 15) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  sub_100012EC4(*(void *)(a1 + 32), (*(void *)(a1 + 56) >> 1) & 1, *(_BYTE *)(a1 + 56) & 1, v11);
  objc_autoreleasePoolPop(v3);
}

uint64_t sub_1000117D4(uint64_t result)
{
  uint64_t v1 = result;
  __uint64_t v2 = (unsigned __int8 *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL);
  do
  {
    if (__ldxr(v2))
    {
      __clrex();
      return result;
    }
  }

  while (__stxr(1u, v2));
  dispatch_source_cancel(*(dispatch_source_t *)(result + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 40LL));
  if (WeakRetained) {
    WeakRetained[96] = 1;
  }

  fwrite("\nStopping...\n", 0xDuLL, 1uLL, __stderrp);
  dispatch_sync(*(dispatch_queue_t *)(v1 + 40), &stru_100029BC0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
}

id sub_100011884(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  int v41 = -1;
  uint64_t v34 = 0LL;
  int64x2_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  int v37 = -1;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  int v33 = 0;
  uint64_t v24 = 0LL;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100011B84;
  uint64_t v28 = sub_100011B94;
  id v29 = 0LL;
  memset(v42, 0, sizeof(v42));
  __int128 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  unint64_t v16 = sub_100011B9C;
  double v17 = &unk_100029C30;
  uint64_t v19 = &v38;
  id v20 = &v34;
  uint64_t v22 = &v24;
  unint64_t v23 = v42;
  NSUInteger v21 = &v30;
  id v3 = a1;
  id v18 = v3;
  if ((sub_100008964(a2, &v14) & 1) != 0)
  {
    uint64_t v4 = *((unsigned int *)v39 + 6);
    uint64_t v5 = *((unsigned int *)v35 + 6);
    unsigned int v6 = *((_DWORD *)v31 + 6);
    id v7 = (id)v25[5];
    mach_error_t v8 = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
    if (v8)
    {
      mach_error("initWithCorpse:mach_port_mod_refs", v8);
    }

    else
    {
      *((_DWORD *)v3 + 24) = a2;
      v43[3] = v4;
      v43[0] = v6 & 0x4000 | (v6 >> 9) & 1 | (16 * ((v6 >> 2) & 1)) & 0xFFFFDF7F | (((v6 >> 1) & 1) << 7) & 0xFFFFDFFF | HIWORD(v6) & 0x100 | (((v6 >> 8) & 1) << 13);
      *((_BYTE *)v3 + 13) = (v6 & 0x20000) != 0;
      id v11 = [v3 initWithBsdInfo:v43];
      __int128 v12 = v11;
      if (v11)
      {
        [v11 setName:v7];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%d] (corpse)",  v7,  v4,  v14,  v15,  v16,  v17));
        [v12 setDisplayString:v13];

        [v12 _setIdleExitStatusFromDirtyFlags:v5];
        [v12 addLedgerData:v42 count:4];
        id v3 = v12;
        id v9 = v3;
        goto LABEL_7;
      }
    }

    id v3 = 0LL;
  }

  id v9 = 0LL;
LABEL_7:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v9;
}

void sub_100011B40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

uint64_t sub_100011B84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011B94(uint64_t a1)
{
}

void sub_100011B9C(void *a1, int *a2)
{
  int v3 = *a2;
  if ((*a2 & 0xFFFFFFF0) == 0x20) {
    int v3 = 17;
  }
  if (v3 <= 2084)
  {
    if (v3 > 2068)
    {
      if (v3 == 2069)
      {
        int v8 = a2[4];
        uint64_t v9 = a1[7];
      }

      else
      {
        if (v3 != 2073) {
          return;
        }
        int v8 = a2[4];
        uint64_t v9 = a1[6];
      }
    }

    else
    {
      if (v3 != 2053)
      {
        if (v3 == 2063)
        {
          __strlcpy_chk(v10, a2 + 4, 1024LL, 1024LL);
          uint64_t v4 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v10);
          uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v4, "lastPathComponent"));
          uint64_t v6 = *(void *)(a1[8] + 8LL);
          id v7 = *(void **)(v6 + 40);
          *(void *)(v6 + 40) = v5;
        }

        return;
      }

      int v8 = a2[4];
      uint64_t v9 = a1[5];
    }

    *(_DWORD *)(*(void *)(v9 + 8) + 24LL) = v8;
    return;
  }

  if (v3 > 2086)
  {
    if (v3 == 2087)
    {
      *(void *)(a1[9] + 16LL) = *((void *)a2 + 2);
    }

    else if (v3 == 2101)
    {
      *(_DWORD *)(a1[4] + 20LL) = a2[4];
    }
  }

  else if (v3 == 2085)
  {
    *(void *)a1[9] = *((void *)a2 + 2);
  }

  else
  {
    *(void *)(a1[9] + 8LL) = *((void *)a2 + 2);
  }

BOOL sub_100011D3C()
{
  int v0 = byte_100034848;
  if (byte_100034848 == 2)
  {
    int v3 = 0;
    size_t v2 = 4LL;
    if (sysctlbyname("vm.self_region_footprint", &v3, &v2, 0LL, 0LL) && *__error() != 2)
    {
      perror("Unable to retrieve status of physical footprint data collection");
      int v3 = 0;
    }

    int v0 = v3 != 0;
    byte_100034848 = v3 != 0;
  }

  return v0 == 1;
}

void sub_100011DD8(uint64_t a1, int a2)
{
  int v3 = a2;
  byte_100034848 = 2;
}

void sub_100011E50(uint64_t a1, int a2)
{
  int v2 = a2;
  objc_opt_self();
  if (sysctlbyname("vm.self_region_info_flags", 0LL, 0LL, &v2, 4uLL))
  {
    if (*__error() != 2) {
      perror("Unable to configure VM region info flags");
    }
  }

id *sub_100011EB0(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___FPFootprint;
    uint64_t v5 = (id *)[super init];
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      *((_BYTE *)a1 + 96) = 0;
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v7 = a1[11];
      a1[11] = v6;

      *((_DWORD *)a1 + 25) = 17;
      *((_DWORD *)a1 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      *((_DWORD *)a1 + 12) = 0;
    }
  }

  return a1;
}

dispatch_source_s *sub_100011FC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0LL, 0LL);
  dispatch_source_set_event_handler(v4, v3);

  signal(2, (void (__cdecl *)(int))1);
  dispatch_resume(v4);
  return v4;
}

uint64_t sub_10001202C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)*(_DWORD *)(v2 + 100), 0);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);

    int v8 = dispatch_queue_create("com.apple.footprint.gatherdata", v7);
    id v9 = *(id *)(v2 + 8);
    objc_opt_self(&OBJC_CLASS___FPFootprint);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingComparator:&stru_100029CF0]);

    id v11 = sub_10001918C((uint64_t)&OBJC_CLASS___FPTime);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    __int128 v13 = *(void **)(v2 + 104);
    *(void *)(v2 + 104) = v12;

    uint64_t v29 = 0LL;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 0;
    id v14 = [v10 count];
    NSUInteger v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    unint64_t v23 = sub_100012218;
    uint64_t v24 = &unk_100029C58;
    uint64_t v25 = v2;
    uint64_t v27 = &v29;
    id v15 = v10;
    id v26 = v15;
    uint64_t v28 = a2;
    dispatch_apply((size_t)v14, v8, &v21);
    if (*((_BYTE *)v30 + 24))
    {
      unint64_t v16 = (void *)[v15 lastObject:v21, v22, v23, v24, v25];
      [v16 _addGlobalError:@"Footprint exited early due to SIGINT and did not finish gathering all data"];
    }

    double v17 = sub_10001918C((uint64_t)&OBJC_CLASS___FPTime);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = *(void **)(v2 + 112);
    *(void *)(v2 + 112) = v18;

    uint64_t v2 = *((_BYTE *)v30 + 24) != 0;
    _Block_object_dispose(&v29, 8);
  }

  return v2;
}

void sub_100012200( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100012218(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 96LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a2]);
    [v3 gatherData:*(void *)(a1 + 56) extendedInfoProvider:*(void *)(a1 + 32)];
  }

void sub_10001228C(uint64_t a1)
{
  if (!a1) {
    return;
  }
  uint64_t v1 = a1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;

  *(void *)(v1 + 56) = CFDictionaryCreateMutable( kCFAllocatorDefault,  100 * (void)[*(id *)(v1 + 8) count],  (const CFDictionaryKeyCallBacks *)&unk_100029C78,  &kCFTypeDictionaryValueCallBacks);
  dispatch_queue_attr_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = v4;

  *(void *)(v1 + 72) = CFDictionaryCreateMutable( kCFAllocatorDefault,  2 * (void)[*(id *)(v1 + 8) count],  (const CFDictionaryKeyCallBacks *)&unk_100029C78,  &kCFTypeDictionaryValueCallBacks);
  *(void *)(v1 + 80) = CFDictionaryCreateMutable( kCFAllocatorDefault,  2 * (void)[*(id *)(v1 + 8) count],  (const CFDictionaryKeyCallBacks *)&unk_100029C78,  &kCFTypeDictionaryValueCallBacks);
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  id obj = *(id *)(v1 + 8);
  uint64_t v107 = v1;
  id v92 = [obj countByEnumeratingWithState:&v110 objects:v126 count:16];
  if (!v92) {
    goto LABEL_72;
  }
  uint64_t v93 = *(void *)v111;
  do
  {
    uint64_t v6 = 0LL;
    do
    {
      if (*(void *)v111 != v93) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(id *)(*((void *)&v110 + 1) + 8 * v6);
      BOOL v104 = sub_100011D3C();
      id v96 = [v7 pageSize];
      vm_size_t v95 = vm_kernel_page_size;
      id v100 = v7;
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sharedCache]);
      id v9 = (id *)v8;
      uint64_t v94 = v6;
      if (v8)
      {
        uint64_t v10 = *(void **)(v1 + 64);
        uint64_t v97 = *(void *)(v8 + 24);
        id v11 = *(id *)(v8 + 16);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

        context = (const __CFDictionary *)v12;
        if (!v12)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  (const CFDictionaryKeyCallBacks *)&unk_100029C78,  &kCFTypeDictionaryValueCallBacks);
          id v14 = *(void **)(v1 + 64);
          id v15 = v9[2];
          [v14 setObject:Mutable forKeyedSubscript:v15];

          context = Mutable;
        }
      }

      else
      {
        uint64_t v97 = 0LL;
        context = 0LL;
      }

      __int128 v134 = 0u;
      __int128 v135 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      id v108 = (id)objc_claimAutoreleasedReturnValue([v100 memoryRegions]);
      id v16 = [v108 countByEnumeratingWithState:&v132 objects:v136 count:16];
      if (v16)
      {
        id v19 = v16;
        id v20 = *(id *)v133;
        id v102 = *(id *)v133;
        do
        {
          NSUInteger v21 = 0LL;
          do
          {
            if (*(id *)v133 != v20) {
              objc_enumerationMutation(v108);
            }
            uint64_t v22 = *(void *)(*((void *)&v132 + 1) + 8LL * (void)v21);
            if (!v22)
            {
              unint64_t v23 = 0LL;
LABEL_32:
              uint64_t v25 = *(const __CFDictionary **)(v1 + 56);
              goto LABEL_33;
            }

            if ((*(_BYTE *)(v22 + 8) & 2) == 0)
            {
              unint64_t v23 = *(const void **)(v22 + 96);
              int v24 = *(unsigned __int8 *)(v22 + 9);
              if (v24 == 4)
              {
                uint64_t v25 = *(const __CFDictionary **)(v1 + 80);
                goto LABEL_33;
              }

              if (v24 == 2)
              {
                uint64_t v25 = *(const __CFDictionary **)(v1 + 72);
                goto LABEL_33;
              }

              goto LABEL_32;
            }

            if (!v9)
            {
              uint64_t v90 = _os_assert_log(0LL, v17, v18);
              _os_crash(v90);
              __break(1u);
            }

            int v26 = *(unsigned __int8 *)(v22 + 9);
            BOOL v27 = v26 == 2 || v26 == 4;
            if (!v27 && (*(void *)(v22 + 16) || *(void *)(v22 + 24))) {
              goto LABEL_35;
            }
            uint64_t v25 = context;
            unint64_t v23 = (const void *)(*(void *)(v22 + 80) - v97 + 1);
LABEL_33:
            if ((unint64_t)v23 + 1 <= 1)
            {
              if (!v22) {
                goto LABEL_63;
              }
LABEL_35:
              *(void *)(v22 + 64) = v22;
              goto LABEL_63;
            }

            char v28 = !v104;
            if (!v22) {
              char v28 = 1;
            }
            if ((v28 & 1) != 0) {
              int v29 = 0;
            }
            else {
              int v29 = (*(unsigned __int8 *)(v22 + 8) >> 3) & 1;
            }
            Value = CFDictionaryGetValue(v25, v23);
            uint64_t v31 = (FPMemoryObject *)objc_claimAutoreleasedReturnValue(Value);
            if (!v31)
            {
              if ((v29 & 1) != 0
                || v22
                && (*(_BYTE *)(v22 + 8) & 2) == 0
                && ((v33 = *(unsigned __int8 *)(v22 + 10), BOOL v34 = v33 > 6, v35 = (1 << v33) & 0x4C, !v34)
                  ? (BOOL v36 = v35 == 0)
                  : (BOOL v36 = 1),
                    v36 && *(unsigned __int8 *)(v22 + 9) - 5 < 0xFFFFFFFD)
                || v96 != (id)v95)
              {
                char v32 = objc_alloc_init(&OBJC_CLASS___FPMemoryObject);
              }

              else
              {
                char v32 = (FPMemoryObject *)(id)v22;
              }

              uint64_t v31 = v32;
              CFDictionaryAddValue(v25, v23, v32);
            }

            int v37 = (FPMemoryObject *)v22;
            if (v31 != (FPMemoryObject *)v22)
            {
              uint64_t v38 = (FPMemoryObject *)objc_claimAutoreleasedReturnValue(-[FPMemoryObject ensureMemoryObject](v31, "ensureMemoryObject"));
              uint64_t v39 = v38;
              if (v38 == v31)
              {
                int v37 = v31;
              }

              else
              {
                int v37 = v38;

                CFDictionaryReplaceValue(v25, v23, v37);
              }

              sub_10000677C((uint64_t)v39, (void *)v22, v100);
              if (v29) {
                -[FPMemoryObject setOwnerPid:](v39, "setOwnerPid:", [v100 pid]);
              }

              uint64_t v1 = v107;
            }

            if (v22) {
              *(void *)(v22 + 64) = v37;
            }

            id v20 = v102;
LABEL_63:
            NSUInteger v21 = (char *)v21 + 1;
          }

          while (v19 != v21);
          id v40 = [v108 countByEnumeratingWithState:&v132 objects:v136 count:16];
          id v19 = v40;
        }

        while (v40);
      }

      uint64_t v6 = v94 + 1;
    }

    while ((id)(v94 + 1) != v92);
    id v41 = [obj countByEnumeratingWithState:&v110 objects:v126 count:16];
    id v92 = v41;
  }

  while (v41);
LABEL_72:

  id contexta = objc_autoreleasePoolPush();
  uint64_t v42 = *(void *)(v1 + 72);
  uint64_t v43 = *(void *)(v1 + 80);
  v131[0] = *(void *)(v1 + 56);
  v131[1] = v42;
  v131[2] = v43;
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v131, 3LL));
  id v45 = [v44 mutableCopy];

  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 64) objectEnumerator]);
  id v47 = [v46 countByEnumeratingWithState:&v122 objects:v136 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v123;
    do
    {
      for (unint64_t i = 0LL; i != v48; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v123 != v49) {
          objc_enumerationMutation(v46);
        }
        [v45 addObject:*(void *)(*((void *)&v122 + 1) + 8 * (void)i)];
      }

      id v48 = [v46 countByEnumeratingWithState:&v122 objects:v136 count:16];
    }

    while (v48);
  }

  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id v105 = v45;
  id v51 = [v105 countByEnumeratingWithState:&v118 objects:&v132 count:16];
  if (v51)
  {
    id v52 = v51;
    id v109 = *(id *)v119;
    do
    {
      for (j = 0LL; j != v52; j = (char *)j + 1)
      {
        if (*(id *)v119 != v109) {
          objc_enumerationMutation(v105);
        }
        id v54 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)j);
        id v55 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
        uint64_t v56 = objc_autoreleasePoolPush();
        __int128 v114 = 0u;
        __int128 v115 = 0u;
        __int128 v116 = 0u;
        __int128 v117 = 0u;
        id v57 = v54;
        id v58 = [v57 countByEnumeratingWithState:&v114 objects:&v127 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v115;
          do
          {
            for (k = 0LL; k != v59; k = (char *)k + 1)
            {
              if (*(void *)v115 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = *(const void **)(*((void *)&v114 + 1) + 8LL * (void)k);
              id v63 = CFDictionaryGetValue((CFDictionaryRef)v57, v62);
              id v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            }

            id v59 = [v57 countByEnumeratingWithState:&v114 objects:&v127 count:16];
          }

          while (v59);
        }

        objc_autoreleasePoolPop(v56);
        [v57 removeObjectsForKeys:v55];
        if (v55) {
          CFRelease(v55);
        }
        uint64_t v1 = v107;
      }

      id v52 = [v105 countByEnumeratingWithState:&v118 objects:&v132 count:16];
    }

    while (v52);
  }

  [*(id *)(v1 + 16) removeAllObjects];
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v65 = sub_1000149C8(v1);
  id v103 = (id)objc_claimAutoreleasedReturnValue(v65);
  id v106 = [v103 countByEnumeratingWithState:&v122 objects:&v132 count:16];
  if (v106)
  {
    uint64_t v66 = *(void *)v123;
    uint64_t v101 = *(void *)v123;
    do
    {
      for (m = 0LL; m != v106; m = (char *)m + 1)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(v103);
        }
        id v68 = *(id *)(*((void *)&v122 + 1) + 8LL * (void)m);
        if (sub_100011D3C())
        {
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          __int128 v127 = 0u;
          __int128 v128 = 0u;
          id v69 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v68 memoryRegions]);
          id v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v69,  "countByEnumeratingWithState:objects:count:",  &v127,  v136,  16LL);
          if (v70)
          {
            id v71 = v70;
            uint64_t v72 = 0LL;
            uint64_t v73 = *(void *)v128;
            do
            {
              for (n = 0LL; n != v71; n = (char *)n + 1)
              {
                if (*(void *)v128 != v73) {
                  objc_enumerationMutation(v69);
                }
                id v75 = *(void **)(*((void *)&v127 + 1) + 8LL * (void)n);
                id v76 = [v75 dirtySize];
                v72 += (uint64_t)[v75 swappedSize] + (void)v76;
              }

              id v71 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v69,  "countByEnumeratingWithState:objects:count:",  &v127,  v136,  16LL);
            }

            while (v71);
          }

          else
          {
            uint64_t v72 = 0LL;
          }
        }

        else
        {
          id v77 = objc_alloc(&OBJC_CLASS___NSMutableSet);
          v78 = (void *)objc_claimAutoreleasedReturnValue([v68 memoryRegions]);
          id v69 = -[NSMutableSet initWithCapacity:](v77, "initWithCapacity:", [v78 count]);

          __int128 v129 = 0u;
          __int128 v130 = 0u;
          __int128 v127 = 0u;
          __int128 v128 = 0u;
          v79 = (void *)objc_claimAutoreleasedReturnValue([v68 memoryRegions]);
          id v80 = [v79 countByEnumeratingWithState:&v127 objects:v136 count:16];
          if (v80)
          {
            id v81 = v80;
            uint64_t v72 = 0LL;
            uint64_t v82 = *(void *)v128;
            do
            {
              for (iunint64_t i = 0LL; ii != v81; iunint64_t i = (char *)ii + 1)
              {
                if (*(void *)v128 != v82) {
                  objc_enumerationMutation(v79);
                }
                v84 = *(void **)(*((void *)&v127 + 1) + 8LL * (void)ii);
                if (v84) {
                  v84 = (void *)v84[8];
                }
                unint64_t v85 = v84;
                if ((-[NSMutableSet containsObject:](v69, "containsObject:", v85) & 1) == 0)
                {
                  id v86 = [v85 dirtySize];
                  v72 += (uint64_t)[v85 swappedSize] + (void)v86;
                  -[NSMutableSet addObject:](v69, "addObject:", v85);
                }
              }

              id v81 = [v79 countByEnumeratingWithState:&v127 objects:v136 count:16];
            }

            while (v81);
          }

          else
          {
            uint64_t v72 = 0LL;
          }

          uint64_t v66 = v101;
        }

        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v72));
        id v88 = *(void **)(v107 + 16);
        id v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v68 pid]));
        [v88 setObject:v87 forKeyedSubscript:v89];
      }

      id v106 = [v103 countByEnumeratingWithState:&v122 objects:&v132 count:16];
    }

    while (v106);
  }

  objc_autoreleasePoolPop(contexta);
}

void sub_100012D24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = (void *)[v5 objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v10);
        *(void *)a3 += [v11 totalDirtySize];
        *(void *)(a3 + 8) += [v11 totalSwappedSize];
        *(void *)(a3 + 16) += [v11 totalCleanSize];
        *(void *)(a3 + 24) += [v11 totalReclaimableSize];
        *(void *)(a3 + 32) += [v11 totalWiredSize];
        unsigned int v12 = [v11 totalRegions];

        *(_DWORD *)(a3 + 40) += v12;
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

void sub_100012EC4(uint64_t a1, int a2, char a3, int a4)
{
  if (a1)
  {
    uint64_t v5 = a1;
    id v6 = sub_1000149C8(a1);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(void *)&__int128 v383 = _NSConcreteStackBlock;
    *((void *)&v383 + 1) = 3221225472LL;
    *(void *)&__int128 v384 = sub_100014DFC;
    *((void *)&v384 + 1) = &unk_100029D18;
    *(void *)&__int128 v385 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingComparator:&v383]);

    __int128 v320 = 0u;
    __int128 v321 = 0u;
    __int128 v318 = 0u;
    __int128 v319 = 0u;
    id v9 = *(id *)(v5 + 88);
    id v10 = [v9 countByEnumeratingWithState:&v318 objects:v365 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v319;
      do
      {
        for (unint64_t i = 0LL; i != v11; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v319 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v318 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v14, "startAtTime:") & 1) != 0) {
            [v14 startAtTime:*(void *)(v5 + 104)];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v318 objects:v365 count:16];
      }

      while (v11);
    }

    uint64_t v249 = v5;
    if (a2)
    {
      id v250 = v8;
      int v265 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v374 = 0u;
      __int128 v375 = 0u;
      __int128 v376 = 0u;
      __int128 v377 = 0u;
      id v15 = *(id *)(v5 + 88);
      id v16 = [v15 countByEnumeratingWithState:&v374 objects:&v383 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v375;
        do
        {
          for (j = 0LL; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v375 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v374 + 1) + 8LL * (void)j);
          }

          id v17 = [v15 countByEnumeratingWithState:&v374 objects:&v383 count:16];
        }

        while (v17);
      }

      if (-[NSMutableArray count](v265, "count"))
      {
        v236 = v8;
        __int128 v373 = 0u;
        __int128 v372 = 0u;
        __int128 v371 = 0u;
        __int128 v370 = 0u;
        id obj = v250;
        id v21 = [obj countByEnumeratingWithState:&v370 objects:v382 count:16];
        if (v21)
        {
          id v22 = v21;
          id v258 = *(id *)v371;
          do
          {
            for (k = 0LL; k != v22; k = (char *)k + 1)
            {
              if (*(id *)v371 != v258) {
                objc_enumerationMutation(obj);
              }
              int v24 = *(void **)(*((void *)&v370 + 1) + 8LL * (void)k);
              __int128 v366 = 0u;
              __int128 v367 = 0u;
              __int128 v368 = 0u;
              __int128 v369 = 0u;
              uint64_t v25 = v265;
              id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v366,  &v378,  16LL);
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v367;
                do
                {
                  for (m = 0LL; m != v27; m = (char *)m + 1)
                  {
                    if (*(void *)v367 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v30 = *(void **)(*((void *)&v366 + 1) + 8LL * (void)m);
                    uint64_t v31 = objc_autoreleasePoolPush();
                    char v32 = (void *)objc_claimAutoreleasedReturnValue([v24 memoryRegions]);
                    [v30 printVmmapLikeOutputForProcess:v24 regions:v32];

                    objc_autoreleasePoolPop(v31);
                  }

                  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v366,  &v378,  16LL);
                }

                while (v27);
              }
            }

            id v22 = [obj countByEnumeratingWithState:&v370 objects:v382 count:16];
          }

          while (v22);
        }

        uint64_t v5 = v249;
        id v8 = v236;
      }
    }

    int v235 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v234 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v226 = 0LL;
    if ((unint64_t)[v8 count] >= 2 && (a4 & 1) == 0)
    {
      unsigned int v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v378 = 0u;
      __int128 v379 = 0u;
      __int128 v380 = 0u;
      __int128 v381 = 0u;
      id v34 = *(id *)(v5 + 8);
      id v35 = [v34 countByEnumeratingWithState:&v378 objects:&v383 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v379;
        do
        {
          for (n = 0LL; n != v36; n = (char *)n + 1)
          {
            if (*(void *)v379 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void **)(*((void *)&v378 + 1) + 8LL * (void)n);
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 sharedCache]);
            if (v40)
            {
              id v41 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v40));
              if (!v41)
              {
                id v41 = -[FPProcessGroupMinimal initUniqueProcessGroup]( objc_alloc(&OBJC_CLASS___FPProcessGroupMinimal),  "initUniqueProcessGroup");
                -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v41, v40);
              }

              [v41 addProcess:v39];
            }
          }

          id v36 = [v34 countByEnumeratingWithState:&v378 objects:&v383 count:16];
        }

        while (v36);
      }

      uint64_t v42 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](v33, "count"));
      __int128 v374 = 0u;
      __int128 v375 = 0u;
      __int128 v376 = 0u;
      __int128 v377 = 0u;
      uint64_t v43 = v33;
      id v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v374,  v382,  16LL);
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v375;
        do
        {
          for (iunint64_t i = 0LL; ii != v45; iunint64_t i = (char *)ii + 1)
          {
            if (*(void *)v375 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v374 + 1) + 8LL * (void)ii);
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v43, "objectForKeyedSubscript:", v48));
            __int128 v50 = sub_100018CD0((uint64_t)v49);
            id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v51, v48);
          }

          id v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v374,  v382,  16LL);
        }

        while (v45);
      }

      v226 = v42;

      uint64_t v5 = v249;
    }

    if ((a4 & 1) != 0)
    {
      id v227 = 0LL;
    }

    else
    {
      int v251 = v226;
      id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v53 = sub_1000149C8(v5);
      id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v266 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v54 count]);
      __int128 v349 = 0u;
      __int128 v350 = 0u;
      __int128 v351 = 0u;
      __int128 v352 = 0u;
      id v243 = v54;
      id v55 = [v243 countByEnumeratingWithState:&v349 objects:&v383 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v350;
        do
        {
          for (jj = 0LL; jj != v56; jj = (char *)jj + 1)
          {
            if (*(void *)v350 != v57) {
              objc_enumerationMutation(v243);
            }
            id v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*((void *)&v349 + 1) + 8 * (void)jj) pid]));
            -[NSMutableSet addObject:](v266, "addObject:", v59);
          }

          id v56 = [v243 countByEnumeratingWithState:&v349 objects:&v383 count:16];
        }

        while (v56);
      }

      int v237 = v8;

      __int128 v348 = 0u;
      __int128 v347 = 0u;
      __int128 v346 = 0u;
      __int128 v345 = 0u;
      id v259 = *(id *)(v5 + 8);
      id v60 = [v259 countByEnumeratingWithState:&v345 objects:v382 count:16];
      if (v60)
      {
        id v61 = v60;
        uint64_t v62 = *(void *)v346;
        do
        {
          for (kk = 0LL; kk != v61; kk = (char *)kk + 1)
          {
            if (*(void *)v346 != v62) {
              objc_enumerationMutation(v259);
            }
            id v64 = *(void **)(*((void *)&v345 + 1) + 8LL * (void)kk);
            unsigned __int8 v65 = [v64 hiddenFromDisplay];
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v64 sharedCache]);
            if (v66)
            {
              uint64_t v67 = v251;
              id v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v251, "objectForKeyedSubscript:", v66));
            }

            else
            {
              id v68 = 0LL;
              uint64_t v67 = v251;
            }

            id v69 = (void *)objc_claimAutoreleasedReturnValue([v64 memoryRegions]);
            v338[0] = _NSConcreteStackBlock;
            v338[1] = 3221225472LL;
            v338[2] = sub_100014C28;
            v338[3] = &unk_100029CB0;
            unsigned __int8 v344 = v65;
            v339 = v266;
            v340 = v67;
            id v341 = v68;
            id v342 = v52;
            v343 = v64;
            id v70 = v68;
            [v69 fp_enumerateObjectsWithBatchSize:256 usingBlock:v338];
          }

          id v61 = [v259 countByEnumeratingWithState:&v345 objects:v382 count:16];
        }

        while (v61);
      }

      id v71 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  3LL * (void)-[NSMutableSet count](v266, "count"));
      __int128 v334 = 0u;
      __int128 v335 = 0u;
      __int128 v336 = 0u;
      __int128 v337 = 0u;
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v52 allKeys]);
      id v73 = [v72 countByEnumeratingWithState:&v334 objects:&v378 count:16];
      if (v73)
      {
        id v74 = v73;
        uint64_t v75 = *(void *)v335;
        do
        {
          for (mm = 0LL; mm != v74; mm = (char *)mm + 1)
          {
            if (*(void *)v335 != v75) {
              objc_enumerationMutation(v72);
            }
            uint64_t v77 = *(void *)(*((void *)&v334 + 1) + 8LL * (void)mm);
            v78 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v77]);
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](v71, "member:", v78));
            if (!v79)
            {
              id v80 = sub_100018CD0((uint64_t)v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue(v80);
              -[NSMutableSet addObject:](v71, "addObject:", v79);
            }

            [v52 setObject:v79 forKeyedSubscript:v77];
          }

          id v74 = [v72 countByEnumeratingWithState:&v334 objects:&v378 count:16];
        }

        while (v74);
      }

      __int128 v333 = 0u;
      __int128 v332 = 0u;
      __int128 v331 = 0u;
      __int128 v330 = 0u;
      id v81 = v52;
      id v82 = [v81 countByEnumeratingWithState:&v330 objects:&v374 count:16];
      if (v82)
      {
        id v83 = v82;
        uint64_t v84 = *(void *)v331;
        do
        {
          for (nn = 0LL; nn != v83; nn = (char *)nn + 1)
          {
            if (*(void *)v331 != v84) {
              objc_enumerationMutation(v81);
            }
            id v86 = *(void **)(*((void *)&v330 + 1) + 8LL * (void)nn);
            uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:v86]);
            id v88 = (void *)objc_claimAutoreleasedReturnValue([v86 nonretainedObjectValue]);
            sub_100018ECC((uint64_t)v87, v88);
          }

          id v83 = [v81 countByEnumeratingWithState:&v330 objects:&v374 count:16];
        }

        while (v83);
      }

      id v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v326 = 0u;
      __int128 v327 = 0u;
      __int128 v328 = 0u;
      __int128 v329 = 0u;
      uint64_t v240 = v71;
      obja = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v240,  "countByEnumeratingWithState:objects:count:",  &v326,  &v370,  16LL);
      if (obja)
      {
        uint64_t v246 = *(void *)v327;
        do
        {
          uint64_t v90 = 0LL;
          do
          {
            if (*(void *)v327 != v246) {
              objc_enumerationMutation(v240);
            }
            uint64_t v260 = v90;
            v91 = *(void **)(*((void *)&v326 + 1) + 8LL * (void)v90);
            id v92 = (void *)objc_claimAutoreleasedReturnValue([v91 processes]);
            id v93 = [v92 count];

            __int128 v325 = 0u;
            __int128 v324 = 0u;
            __int128 v322 = 0u;
            __int128 v323 = 0u;
            uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v91 processes]);
            id v95 = [v94 countByEnumeratingWithState:&v322 objects:&v366 count:16];
            if (v95)
            {
              id v96 = v95;
              uint64_t v97 = *(void *)v323;
              do
              {
                for (i1 = 0LL; i1 != v96; i1 = (char *)i1 + 1)
                {
                  if (*(void *)v323 != v97) {
                    objc_enumerationMutation(v94);
                  }
                  v99 = *(void **)(*((void *)&v322 + 1) + 8LL * (void)i1);
                  id v100 = (void *)objc_claimAutoreleasedReturnValue([v99 asNumber]);
                  uint64_t v101 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v89 objectForKeyedSubscript:v100]);

                  if (!v101)
                  {
                    uint64_t v101 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                    id v102 = (void *)objc_claimAutoreleasedReturnValue([v99 asNumber]);
                    [v89 setObject:v101 forKeyedSubscript:v102];
                  }

                  if (v93 == (id)1) {
                    -[NSMutableArray insertObject:atIndex:](v101, "insertObject:atIndex:", v91, 0LL);
                  }
                  else {
                    -[NSMutableArray addObject:](v101, "addObject:", v91);
                  }
                }

                id v96 = [v94 countByEnumeratingWithState:&v322 objects:&v366 count:16];
              }

              while (v96);
            }

            uint64_t v90 = v260 + 1;
          }

          while (v260 + 1 != obja);
          obja = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v240,  "countByEnumeratingWithState:objects:count:",  &v326,  &v370,  16LL);
        }

        while (obja);
      }

      id v227 = v89;
      uint64_t v5 = v249;
      id v103 = *(const void **)(v249 + 56);
      if (v103)
      {
        CFRelease(v103);
        *(void *)(v249 + 56) = 0LL;
      }

      BOOL v104 = *(void **)(v249 + 64);
      *(void *)(v249 + 64) = 0LL;

      id v105 = *(const void **)(v249 + 72);
      id v8 = v237;
      if (v105)
      {
        CFRelease(v105);
        *(void *)(v249 + 72) = 0LL;
      }

      id v106 = *(const void **)(v249 + 80);
      if (v106)
      {
        CFRelease(v106);
        *(void *)(v249 + 80) = 0LL;
      }
    }

    context = objc_autoreleasePoolPush();
    __int128 v314 = 0u;
    __int128 v315 = 0u;
    __int128 v316 = 0u;
    __int128 v317 = 0u;
    id v107 = *(id *)(v5 + 88);
    id v108 = [v107 countByEnumeratingWithState:&v314 objects:v364 count:16];
    if (v108)
    {
      id v109 = v108;
      uint64_t v110 = *(void *)v315;
      do
      {
        for (i2 = 0LL; i2 != v109; i2 = (char *)i2 + 1)
        {
          if (*(void *)v315 != v110) {
            objc_enumerationMutation(v107);
          }
          __int128 v112 = *(void **)(*((void *)&v314 + 1) + 8LL * (void)i2);
          __int128 v113 = objc_autoreleasePoolPush();
          objc_autoreleasePoolPop(v113);
        }

        id v109 = [v107 countByEnumeratingWithState:&v314 objects:v364 count:16];
      }

      while (v109);
    }

    __int128 v312 = 0u;
    __int128 v313 = 0u;
    __int128 v310 = 0u;
    __int128 v311 = 0u;
    id v228 = v8;
    uint64_t v232 = (char *)[v228 countByEnumeratingWithState:&v310 objects:v363 count:16];
    if (v232)
    {
      uint64_t v230 = *(void *)v311;
      int v233 = &__NSDictionary0__struct;
      do
      {
        __int128 v114 = 0LL;
        do
        {
          if (*(void *)v311 != v230) {
            objc_enumerationMutation(v228);
          }
          __int128 v115 = *(void **)(*((void *)&v310 + 1) + 8LL * (void)v114);
          __int128 v116 = (void *)objc_claimAutoreleasedReturnValue([v115 errors]);
          id v267 = [v116 count];

          __int128 v117 = (void *)objc_claimAutoreleasedReturnValue([v115 warnings]);
          id v118 = [v117 count];

          if (v118) {
            -[NSMutableArray addObject:](v234, "addObject:", v115);
          }
          int v241 = v114;
          if (v267)
          {
            -[NSMutableArray addObject:](v235, "addObject:", v115);
          }

          else
          {
            __int128 v119 = (void *)objc_claimAutoreleasedReturnValue([v115 auxData]);
            __int128 v120 = v119;
            if (v119)
            {
              uint64_t v121 = [v119 fp_mergeWithData:v233];

              int v233 = (void *)v121;
            }
          }

          __int128 v122 = *(void **)(v5 + 16);
          __int128 v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v115 pid]));
          uint64_t v124 = objc_claimAutoreleasedReturnValue([v122 objectForKeyedSubscript:v123]);

          __int128 v308 = 0u;
          __int128 v309 = 0u;
          __int128 v306 = 0u;
          __int128 v307 = 0u;
          id v125 = *(id *)(v5 + 88);
          id v126 = [v125 countByEnumeratingWithState:&v306 objects:v362 count:16];
          if (v126)
          {
            id v127 = v126;
            uint64_t v128 = *(void *)v307;
            do
            {
              for (i3 = 0LL; i3 != v127; i3 = (char *)i3 + 1)
              {
                if (*(void *)v307 != v128) {
                  objc_enumerationMutation(v125);
                }
                __int128 v130 = *(void **)(*((void *)&v306 + 1) + 8LL * (void)i3);
                v131 = objc_autoreleasePoolPush();
                [v130 printProcessHeader:v115];
                if (!v267) {
                  [v130 printProcessTotal:v124 forProcess:v115];
                }
                [v130 endProcessHeader:v115];
                objc_autoreleasePoolPop(v131);
              }

              id v127 = [v125 countByEnumeratingWithState:&v306 objects:v362 count:16];
            }

            while (v127);
          }

          v238 = (void *)v124;

          if ((a4 & 1) == 0)
          {
            __int128 v132 = (void *)objc_claimAutoreleasedReturnValue([v115 asNumber]);
            __int128 v133 = (void *)objc_claimAutoreleasedReturnValue([v227 objectForKeyedSubscript:v132]);

            if (v133)
            {
              __int128 v300 = 0uLL;
              __int128 v301 = 0uLL;
              __int128 v298 = 0uLL;
              __int128 v299 = 0uLL;
              int v229 = v133;
              id v244 = v133;
              uint64_t v252 = (char *)[v244 countByEnumeratingWithState:&v298 objects:v360 count:16];
              if (v252)
              {
                uint64_t v247 = *(void *)v299;
                do
                {
                  __int128 v134 = 0LL;
                  do
                  {
                    if (*(void *)v299 != v247) {
                      objc_enumerationMutation(v244);
                    }
                    int v261 = v134;
                    __int128 v135 = *(void **)(*((void *)&v298 + 1) + 8LL * (void)v134);
                    id v136 = sub_100018FD4((uint64_t)v135);
                    unsigned int v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
                    __int128 v384 = 0u;
                    __int128 v385 = 0u;
                    __int128 v383 = 0u;
                    v382[0] = 0;
                    if (!v137)
                    {
                      if (v135) {
                        v138 = (void *)v135[4];
                      }
                      else {
                        v138 = 0LL;
                      }
                      id v139 = v138;
                      v140 = objc_autoreleasePoolPush();
                      v141 = (void *)objc_claimAutoreleasedReturnValue([v139 objectEnumerator]);
                      id v142 = sub_100014A1C(v141, v115, v382, a3);
                      unsigned int v137 = (void *)objc_claimAutoreleasedReturnValue(v142);

                      objc_autoreleasePoolPop(v140);
                      if (!v382[0])
                      {
                        v143 = (void *)objc_claimAutoreleasedReturnValue([v135 processes]);
                        id v144 = [v143 count];

                        if ((unint64_t)v144 >= 0x1A)
                        {
                          v145 = (void *)objc_claimAutoreleasedReturnValue([v135 processes]);
                          sub_100018F5C((uint64_t)v135, v137, [v145 count] - 1);
                        }
                      }
                    }

                    if (!v267) {
                      sub_100012D24((uint64_t)&OBJC_CLASS___FPFootprint, v137, (uint64_t)&v383);
                    }
                    id objb = objc_autoreleasePoolPush();
                    __int128 v294 = 0u;
                    __int128 v295 = 0u;
                    __int128 v296 = 0u;
                    __int128 v297 = 0u;
                    id v146 = *(id *)(v249 + 88);
                    id v147 = [v146 countByEnumeratingWithState:&v294 objects:v359 count:16];
                    if (v147)
                    {
                      id v148 = v147;
                      uint64_t v149 = *(void *)v295;
                      do
                      {
                        for (i4 = 0LL; i4 != v148; i4 = (char *)i4 + 1)
                        {
                          if (*(void *)v295 != v149) {
                            objc_enumerationMutation(v146);
                          }
                          __int128 v151 = *(void **)(*((void *)&v294 + 1) + 8LL * (void)i4);
                          __int128 v152 = (void *)objc_claimAutoreleasedReturnValue([v135 processes]);
                          id v153 = [v152 count];

                          if (v153 == (id)1) {
                            [v151 printProcessCategories:v137 total:&v383 forProcess:v115];
                          }
                          else {
                            [v151 printSharedCategories:v137 sharedWith:v135 forProcess:v115 hasProcessView:v382[0] == 2 total:&v383];
                          }
                        }

                        id v148 = [v146 countByEnumeratingWithState:&v294 objects:v359 count:16];
                      }

                      while (v148);
                    }

                    objc_autoreleasePoolPop(objb);
                    __int128 v134 = v261 + 1;
                  }

                  while (v261 + 1 != v252);
                  __int128 v154 = (char *)[v244 countByEnumeratingWithState:&v298 objects:v360 count:16];
                  uint64_t v252 = v154;
                }

                while (v154);
              }

              uint64_t v5 = v249;
              __int128 v133 = v229;
            }

            else
            {
              __int128 v384 = 0uLL;
              __int128 v385 = 0uLL;
              __int128 v383 = 0uLL;
              __int128 v302 = 0uLL;
              __int128 v303 = 0uLL;
              __int128 v304 = 0uLL;
              __int128 v305 = 0uLL;
              id v155 = *(id *)(v5 + 88);
              id v156 = [v155 countByEnumeratingWithState:&v302 objects:v361 count:16];
              if (v156)
              {
                id v157 = v156;
                uint64_t v158 = *(void *)v303;
                do
                {
                  for (i5 = 0LL; i5 != v157; i5 = (char *)i5 + 1)
                  {
                    if (*(void *)v303 != v158) {
                      objc_enumerationMutation(v155);
                    }
                    [*(id *)(*((void *)&v302 + 1) + 8 * (void)i5) printProcessCategories:&__NSDictionary0__struct total:&v383 forProcess:v115];
                  }

                  id v157 = [v155 countByEnumeratingWithState:&v302 objects:v361 count:16];
                }

                while (v157);
              }
            }
          }

          v160 = objc_autoreleasePoolPush();
          __int128 v290 = 0u;
          __int128 v291 = 0u;
          __int128 v292 = 0u;
          __int128 v293 = 0u;
          id v161 = *(id *)(v5 + 88);
          id v162 = [v161 countByEnumeratingWithState:&v290 objects:v358 count:16];
          if (v162)
          {
            id v163 = v162;
            uint64_t v164 = *(void *)v291;
            do
            {
              for (i6 = 0LL; i6 != v163; i6 = (char *)i6 + 1)
              {
                if (*(void *)v291 != v164) {
                  objc_enumerationMutation(v161);
                }
                __int128 v166 = *(void **)(*((void *)&v290 + 1) + 8LL * (void)i6);
                uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue([v115 auxData]);
                [v166 printProcessAuxData:v167 forProcess:v115];
              }

              id v163 = [v161 countByEnumeratingWithState:&v290 objects:v358 count:16];
            }

            while (v163);
          }

          objc_autoreleasePoolPop(v160);
          __int128 v114 = v241 + 1;
        }

        while (v241 + 1 != v232);
        uint64_t v232 = (char *)[v228 countByEnumeratingWithState:&v310 objects:v363 count:16];
      }

      while (v232);
    }

    else
    {
      int v233 = &__NSDictionary0__struct;
    }

    objc_autoreleasePoolPop(context);
    id v262 = objc_autoreleasePoolPush();
    __int128 v286 = 0u;
    __int128 v287 = 0u;
    __int128 v288 = 0u;
    __int128 v289 = 0u;
    objc = v226;
    id v168 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objc,  "countByEnumeratingWithState:objects:count:",  &v286,  v357,  16LL);
    if (v168)
    {
      id v169 = v168;
      uint64_t v268 = *(void *)v287;
      do
      {
        char v170 = 0LL;
        do
        {
          if (*(void *)v287 != v268) {
            objc_enumerationMutation(objc);
          }
          uint64_t v171 = *(void *)(*((void *)&v286 + 1) + 8LL * (void)v170);
          uint64_t v172 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](objc, "objectForKeyedSubscript:", v171));
          v173 = (void *)v172;
          if (v172) {
            uint64_t v174 = *(void **)(v172 + 32);
          }
          else {
            uint64_t v174 = 0LL;
          }
          id v175 = v174;
          v176 = objc_autoreleasePoolPush();
          char v177 = (void *)objc_claimAutoreleasedReturnValue([v175 objectEnumerator]);
          id v178 = sub_100014A1C(v177, 0LL, 0LL, a3);
          id v179 = (void *)objc_claimAutoreleasedReturnValue(v178);

          objc_autoreleasePoolPop(v176);
          sub_100012D24((uint64_t)&OBJC_CLASS___FPFootprint, v179, (uint64_t)&v383);
          __int128 v284 = 0u;
          __int128 v285 = 0u;
          __int128 v282 = 0u;
          __int128 v283 = 0u;
          id v180 = *(id *)(v249 + 88);
          id v181 = [v180 countByEnumeratingWithState:&v282 objects:v356 count:16];
          if (v181)
          {
            id v182 = v181;
            uint64_t v183 = *(void *)v283;
            do
            {
              for (i7 = 0LL; i7 != v182; i7 = (char *)i7 + 1)
              {
                if (*(void *)v283 != v183) {
                  objc_enumerationMutation(v180);
                }
                [*(id *)(*((void *)&v282 + 1) + 8 * (void)i7) printSharedCache:v171 categories:v179 sharedWith:v173 total:&v383];
              }

              id v182 = [v180 countByEnumeratingWithState:&v282 objects:v356 count:16];
            }

            while (v182);
          }

          char v170 = (char *)v170 + 1;
        }

        while (v170 != v169);
        id v185 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objc,  "countByEnumeratingWithState:objects:count:",  &v286,  v357,  16LL);
        id v169 = v185;
      }

      while (v185);
    }

    objc_autoreleasePoolPop(v262);
    NSErrorUserInfoKey v186 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v278 = 0u;
    __int128 v279 = 0u;
    __int128 v280 = 0u;
    __int128 v281 = 0u;
    id v187 = v228;
    id v188 = [v187 countByEnumeratingWithState:&v278 objects:v355 count:16];
    if (v188)
    {
      id v189 = v188;
      uint64_t v190 = *(void *)v279;
      do
      {
        for (i8 = 0LL; i8 != v189; i8 = (char *)i8 + 1)
        {
          if (*(void *)v279 != v190) {
            objc_enumerationMutation(v187);
          }
          NSErrorUserInfoKey v192 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v278 + 1) + 8 * (void)i8) globalErrors]);
          -[NSMutableArray addObjectsFromArray:](v186, "addObjectsFromArray:", v192);
        }

        id v189 = [v187 countByEnumeratingWithState:&v278 objects:v355 count:16];
      }

      while (v189);
    }

    id v242 = v187;

    v193 = objc_autoreleasePoolPush();
    __int128 v274 = 0u;
    __int128 v275 = 0u;
    __int128 v276 = 0u;
    __int128 v277 = 0u;
    id v194 = *(id *)(v249 + 88);
    id v195 = [v194 countByEnumeratingWithState:&v274 objects:v354 count:16];
    if (v195)
    {
      id v196 = v195;
      uint64_t v197 = *(void *)v275;
      do
      {
        for (i9 = 0LL; i9 != v196; i9 = (char *)i9 + 1)
        {
          if (*(void *)v275 != v197) {
            objc_enumerationMutation(v194);
          }
          [*(id *)(*((void *)&v274 + 1) + 8 * (void)i9) printProcessesWithWarnings:v234 processesWithErrors:v235 globalErrors:v186];
        }

        id v196 = [v194 countByEnumeratingWithState:&v274 objects:v354 count:16];
      }

      while (v196);
    }

    int v239 = v186;

    objc_autoreleasePoolPop(v193);
    v199 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v378 = 0u;
    __int128 v379 = 0u;
    __int128 v380 = 0u;
    __int128 v381 = 0u;
    id v201 = sub_1000149C8(v249);
    id v245 = (id)objc_claimAutoreleasedReturnValue(v201);
    id v253 = [v245 countByEnumeratingWithState:&v378 objects:&v383 count:16];
    if (v253)
    {
      uint64_t v248 = *(void *)v379;
      do
      {
        uint64_t v202 = 0LL;
        do
        {
          if (*(void *)v379 != v248) {
            objc_enumerationMutation(v245);
          }
          uint64_t v269 = v202;
          v203 = *(void **)(*((void *)&v378 + 1) + 8 * v202);
          id v263 = objc_autoreleasePoolPush();
          __int128 v374 = 0u;
          __int128 v375 = 0u;
          __int128 v376 = 0u;
          __int128 v377 = 0u;
          unint64_t v204 = (void *)objc_claimAutoreleasedReturnValue([v203 memoryRegions]);
          id v205 = [v204 countByEnumeratingWithState:&v374 objects:v382 count:16];
          if (v205)
          {
            id v206 = v205;
            uint64_t v207 = *(void *)v375;
            do
            {
              for (i10 = 0LL; i10 != v206; i10 = (char *)i10 + 1)
              {
                if (*(void *)v375 != v207) {
                  objc_enumerationMutation(v204);
                }
                int v209 = *(void **)(*((void *)&v374 + 1) + 8LL * (void)i10);
                if (v209) {
                  int v209 = (void *)v209[8];
                }
                v210 = v209;
                if ((-[NSMutableSet containsObject:](v199, "containsObject:", v210) & 1) == 0)
                {
                  -[NSMutableSet addObject:](v199, "addObject:", v210);
                  if ((a3 & 1) != 0) {
                    uint64_t v211 = objc_claimAutoreleasedReturnValue([v210 name]);
                  }
                  else {
                    uint64_t v211 = objc_claimAutoreleasedReturnValue([v210 fullName]);
                  }
                  uint64_t v212 = (void *)v211;
                  int v213 = (void *)objc_claimAutoreleasedReturnValue([v200 objectForKeyedSubscript:v211]);
                  if (!v213)
                  {
                    double v214 = sub_10001D74C(objc_alloc(&OBJC_CLASS___FPMemoryCategory), a3);
                    int v213 = v215;
                    [v200 setObject:v215 forKeyedSubscript:v212];
                  }

                  sub_10001D980((uint64_t)v213, v210);
                }
              }

              id v206 = [v204 countByEnumeratingWithState:&v374 objects:v382 count:16];
            }

            while (v206);
          }

          objc_autoreleasePoolPop(v263);
          uint64_t v202 = v269 + 1;
        }

        while ((id)(v269 + 1) != v253);
        id v253 = [v245 countByEnumeratingWithState:&v378 objects:&v383 count:16];
      }

      while (v253);
    }

    sub_100012D24((uint64_t)&OBJC_CLASS___FPFootprint, v200, (uint64_t)&v383);
    if (-[NSMutableArray count](v186, "count")) {
      BOOL v216 = 1LL;
    }
    else {
      BOOL v216 = -[NSMutableArray count](v235, "count") != 0LL;
    }
    __int128 v272 = 0u;
    __int128 v273 = 0u;
    __int128 v270 = 0u;
    __int128 v271 = 0u;
    id v217 = *(id *)(v249 + 88);
    id v218 = [v217 countByEnumeratingWithState:&v270 objects:v353 count:16];
    if (v218)
    {
      id v219 = v218;
      uint64_t v220 = *(void *)v271;
      if (a4) {
        int v221 = 0LL;
      }
      else {
        int v221 = v200;
      }
      do
      {
        for (i11 = 0LL; i11 != v219; i11 = (char *)i11 + 1)
        {
          if (*(void *)v271 != v220) {
            objc_enumerationMutation(v217);
          }
          int v223 = *(void **)(*((void *)&v270 + 1) + 8LL * (void)i11);
          uint64_t v224 = objc_autoreleasePoolPush();
          [v223 printSummaryCategories:v221 total:&v383 hadErrors:v216];
          [v223 printGlobalAuxData:v233];
          [v223 endAtTime:*(void *)(v249 + 112)];
          objc_autoreleasePoolPop(v224);
        }

        id v219 = [v217 countByEnumeratingWithState:&v270 objects:v353 count:16];
      }

      while (v219);
    }
  }

id sub_1000149C8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"hiddenFromDisplay == NO"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) filteredArrayUsingPredicate:v2]);

  return v3;
}

id sub_100014A1C(void *a1, void *a2, unsigned __int8 *a3, char a4)
{
  id v6 = a1;
  id v23 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    unsigned __int8 v10 = 0;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        __int128 v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((a4 & 1) != 0) {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 name]);
        }
        else {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 fullName]);
        }
        id v15 = (void *)v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
        if (!v16)
        {
          double v17 = sub_10001D74C(objc_alloc(&OBJC_CLASS___FPMemoryCategory), a4);
          id v16 = v18;
          [v7 setObject:v18 forKeyedSubscript:v15];
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 viewForProcess:v23]);
        sub_10001D980((uint64_t)v16, v19);
        if (v10 == 2 || v19 == v13)
        {
          if (!v10) {
            unsigned __int8 v10 = [v13 couldHaveProcessView];
          }
        }

        else
        {
          unsigned __int8 v10 = 2;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v9);
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  if (a3) {
    *a3 = v10;
  }

  return v7;
}

void sub_100014C28(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    while (1)
    {
      id v6 = *a2;
      id v7 = v6;
      id v8 = v6 ? (void *)*((void *)v6 + 8) : 0LL;
      id v9 = v8;
      unsigned __int8 v10 = v9;
      if (!*(_BYTE *)(a1 + 72)) {
        break;
      }
      if ([v9 ownerPid] != -1)
      {
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v10 ownerPid]));
        unsigned int v13 = [v10 containsFakeRegion];

        if (v13) {
          break;
        }
      }

int64_t sub_100014DA8(id a1, FPProcess *a2, FPProcess *a3)
{
  dispatch_queue_attr_t v4 = a3;
  LODWORD(a2) = -[FPProcess pid](a2, "pid");
  int v5 = -[FPProcess pid](v4, "pid");

  else {
    return 1LL;
  }
}

uint64_t sub_100014DFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 pid]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  unsigned __int8 v10 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  uint64_t v13 = (uint64_t)[v12 compare:v9];
  if (!v13)
  {
    int v14 = [v5 pid];
    else {
      uint64_t v13 = 1LL;
    }
  }

  return v13;
}

BOOL sub_1000151BC(uint64_t a1, void *a2)
{
  return [a2 virtualAddress] == *(id *)(a1 + 32);
}

BOOL sub_1000151EC(uint64_t a1)
{
  return objc_opt_class(&OBJC_CLASS___IOAccelMemoryInfo) != 0;
}

LABEL_21:
      }

      id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  char v32 = 0LL;
  uint64_t v31 = v21;
LABEL_28:

  return v32;
}

void sub_100015848( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_100015874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015884(uint64_t a1)
{
}

void sub_10001588C(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v3;
  id v15 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (unint64_t i = 0LL; i != v15; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processIDs]);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)j);
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v11]);
              if (!v12)
              {
                uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
              }

              [v12 addObject:v5];
            }

            id v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v8);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v15);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_100015B08(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t sub_100015B14(unint64_t a1)
{
  return a1 >> 8;
}

id sub_100015B1C(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___FPOutputFormatterJSON;
    a1 = [super init];
    if (a1)
    {
      dispatch_queue_attr_t v4 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
      id v5 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v4;

      [*((id *)a1 + 6) setFormatOptions:3955];
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
      [*((id *)a1 + 6) setTimeZone:v6];

      id v7 = (const char *)[v3 UTF8String];
      id v8 = malloc(0x10uLL);
      uint64_t v9 = fopen(v7, "w+");
      *(void *)id v8 = v9;
      if (v9)
      {
        v8[8] = 0;
        *((void *)a1 + 5) = v8;
        fputc(123, v9);
        uint64_t v10 = *((void *)a1 + 5);
        *(_BYTE *)(v10 + _Block_object_dispose(va, 8) = 0;
        fwrite("unit:", 7uLL, 1uLL, *(FILE **)v10);
        uint64_t v11 = *((void *)a1 + 5);
        *(_BYTE *)(v11 + _Block_object_dispose(va, 8) = 0;
        fwrite("byte", 6uLL, 1uLL, *(FILE **)v11);
        uint64_t v12 = *((void *)a1 + 5);
        *(_BYTE *)(v12 + _Block_object_dispose(va, 8) = 1;
        fputc(44, *(FILE **)v12);
        fwrite("bytes per unit:", 0x11uLL, 1uLL, **((FILE ***)a1 + 5));
        uint64_t v13 = *((void *)a1 + 5);
        *(_BYTE *)(v13 + _Block_object_dispose(va, 8) = 0;
        fprintf(*(FILE **)v13, "%d", 1);
        *(_BYTE *)(*((void *)a1 + 5) + 8LL) = 1;
        if (!sub_100011D3C())
        {
          uint64_t v14 = *((void *)a1 + 5);
          if (v14)
          {
            if (*(_BYTE *)(v14 + 8))
            {
              fputc(44, *(FILE **)v14);
              uint64_t v14 = *((void *)a1 + 5);
            }

            fwrite("vm_object_dirty_analysis:", 0x1BuLL, 1uLL, *(FILE **)v14);
            uint64_t v15 = *((void *)a1 + 5);
            *(_BYTE *)(v15 + _Block_object_dispose(va, 8) = 0;
            fputs("true", *(FILE **)v15);
            *(_BYTE *)(*((void *)a1 + 5) + 8LL) = 1;
          }
        }
      }

      else
      {
        free(v8);
        *((void *)a1 + 5) = 0LL;
        perror("Unable to open JSON writer");

        a1 = 0LL;
      }
    }
  }

  return a1;
}

void sub_100015F10(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      __int128 v27 = v5;
      if (*(_BYTE *)(v6 + 8))
      {
        fputc(44, *(FILE **)v6);
        uint64_t v6 = *(void *)(a1 + 40);
      }

      fprintf(*(FILE **)v6, "%s:", a3);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_BYTE *)(v7 + _Block_object_dispose(va, 8) = 0;
      fputc(123, *(FILE **)v7);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_BYTE *)(v8 + _Block_object_dispose(va, 8) = 0;
      fwrite("mach_absolute_time_ns:", 0x18uLL, 1uLL, *(FILE **)v8);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_BYTE *)(v9 + _Block_object_dispose(va, 8) = 0;
      uint64_t v10 = *(FILE **)v9;
      unint64_t v11 = sub_1000191AC((unint64_t)v27);
      fprintf(v10, "%llu", v11);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_BYTE *)(v12 + _Block_object_dispose(va, 8) = 1;
      fputc(44, *(FILE **)v12);
      fwrite("mach_continuous_time_ns:", 0x1AuLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v13 = *(void *)(a1 + 40);
      *(_BYTE *)(v13 + _Block_object_dispose(va, 8) = 0;
      uint64_t v14 = *(FILE **)v13;
      unint64_t v15 = sub_100019208((unint64_t)v27);
      fprintf(v14, "%llu", v15);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_BYTE *)(v16 + _Block_object_dispose(va, 8) = 1;
      fputc(44, *(FILE **)v16);
      fwrite("wall_time_s:", 0xEuLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v17 = *(void *)(a1 + 40);
      *(_BYTE *)(v17 + _Block_object_dispose(va, 8) = 0;
      if (v27) {
        double v18 = v27[3];
      }
      else {
        double v18 = 0.0;
      }
      fprintf(*(FILE **)v17, "%f", v18);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_BYTE *)(v19 + _Block_object_dispose(va, 8) = 1;
      fputc(44, *(FILE **)v19);
      fwrite("date:", 7uLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v20 = *(void *)(a1 + 40);
      *(_BYTE *)(v20 + _Block_object_dispose(va, 8) = 0;
      __int128 v21 = *(FILE **)v20;
      __int128 v22 = *(void **)(a1 + 48);
      __int128 v23 = sub_100019264(v27);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = objc_claimAutoreleasedReturnValue([v22 stringFromDate:v24]);
      fprintf(v21, "%s", (const char *)[v25 UTF8String]);

      uint64_t v26 = *(void *)(a1 + 40);
      *(_BYTE *)(v26 + _Block_object_dispose(va, 8) = 1;
      fputc(125, *(FILE **)v26);
      *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = 1;
      id v5 = v27;
    }
  }
}

void sub_10001676C(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v6 = "addr:";
    uint64_t v7 = "%llu";
    uint64_t v8 = "wired:";
    while (1)
    {
      uint64_t v9 = *a2;
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40LL);
      if (v10)
      {
        if (*(_BYTE *)(v10 + 8))
        {
          fputc(44, *(FILE **)v10);
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40LL);
        }

        fputc(123, *(FILE **)v10);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v11)
        {
          if (*(_BYTE *)(v11 + 8))
          {
            fputc(44, *(FILE **)v11);
            uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite("id:", 5uLL, 1uLL, *(FILE **)v11);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v12 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
          if (v12)
          {
            uint64_t v13 = v9 ? v9[12] : 0LL;
            fprintf(*v12, v7, v13);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40LL);
            if (v14)
            {
              if (*(_BYTE *)(v14 + 8))
              {
                fputc(44, *(FILE **)v14);
                uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40LL);
              }

              fwrite("name:", 7uLL, 1uLL, *(FILE **)v14);
              *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
              unint64_t v15 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
              if (v15)
              {
                uint64_t v16 = *v15;
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 fullName]);
                double v18 = v7;
                uint64_t v19 = v8;
                uint64_t v20 = v6;
                id v21 = objc_claimAutoreleasedReturnValue( [v17 stringByReplacingOccurrencesOfString:@"" withString:@"\\"]);
                fprintf(v16, "%s", (const char *)[v21 UTF8String]);

                uint64_t v6 = v20;
                uint64_t v8 = v19;
                uint64_t v7 = v18;

                *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
              }
            }
          }
        }
      }

      if (!v9) {
        break;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      if (v9[10] != -1LL) {
        goto LABEL_19;
      }
LABEL_26:
      uint64_t v26 = *(void *)(v22 + 40);
      if (v26)
      {
        if (*(_BYTE *)(v26 + 8))
        {
          fputc(44, *(FILE **)v26);
          uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 40LL);
        }

        fwrite("vsize:", 8uLL, 1uLL, *(FILE **)v26);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
        __int128 v27 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
        if (v27)
        {
          if (v9) {
            uint64_t v28 = v9[11];
          }
          else {
            uint64_t v28 = 0LL;
          }
          fprintf(*v27, v7, v28);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
        }
      }

      if (v9)
      {
        if (v9[9])
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40LL);
          if (v29)
          {
            if (*(_BYTE *)(v29 + 8))
            {
              fputc(44, *(FILE **)v29);
              uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40LL);
            }

            fwrite("offset:", 9uLL, 1uLL, *(FILE **)v29);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
            uint64_t v30 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
            if (v30)
            {
              fprintf(*v30, v7, v9[9]);
              *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
            }
          }
        }
      }

      id v31 = [v9 dirtySize];
      if (v31)
      {
        uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v32)
        {
          id v33 = v31;
          if (*(_BYTE *)(v32 + 8))
          {
            fputc(44, *(FILE **)v32);
            uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite("dirty:", 8uLL, 1uLL, *(FILE **)v32);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          id v34 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
          if (v34)
          {
            fprintf(*v34, v7, v33);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
          }
        }
      }

      id v35 = [v9 swappedSize];
      if (v35)
      {
        uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v36)
        {
          id v37 = v35;
          if (*(_BYTE *)(v36 + 8))
          {
            fputc(44, *(FILE **)v36);
            uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite("swapped:", 0xAuLL, 1uLL, *(FILE **)v36);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v38 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
          if (v38)
          {
            fprintf(*v38, v7, v37);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
          }
        }
      }

      id v39 = [v9 cleanSize];
      if (v39)
      {
        uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v40)
        {
          id v41 = v39;
          if (*(_BYTE *)(v40 + 8))
          {
            fputc(44, *(FILE **)v40);
            uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite("clean:", 8uLL, 1uLL, *(FILE **)v40);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v42 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
          if (v42)
          {
            fprintf(*v42, v7, v41);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
          }
        }
      }

      id v43 = [v9 reclaimableSize];
      if (v43)
      {
        uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v44)
        {
          id v45 = v43;
          if (*(_BYTE *)(v44 + 8))
          {
            fputc(44, *(FILE **)v44);
            uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite("reclaimable:", 0xEuLL, 1uLL, *(FILE **)v44);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v46 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
          if (v46)
          {
            fprintf(*v46, v7, v45);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
          }
        }
      }

      id v47 = [v9 wiredSize];
      uint64_t v48 = *(void *)(a1 + 32);
      if (v47)
      {
        uint64_t v49 = *(void *)(v48 + 40);
        if (v49)
        {
          id v50 = v47;
          if (*(_BYTE *)(v49 + 8))
          {
            fputc(44, *(FILE **)v49);
            uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fwrite(v8, 8uLL, 1uLL, *(FILE **)v49);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v48 = *(void *)(a1 + 32);
          id v51 = *(FILE ***)(v48 + 40);
          if (v51)
          {
            fprintf(*v51, v7, v50);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
            uint64_t v48 = *(void *)(a1 + 32);
          }
        }
      }

      id v52 = *(FILE ***)(v48 + 40);
      if (v52)
      {
        fputc(125, *v52);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
      }

      ++a2;
      if (!--v3) {
        return;
      }
    }

    uint64_t v22 = *(void *)(a1 + 32);
LABEL_19:
    uint64_t v23 = *(void *)(v22 + 40);
    if (v23)
    {
      if (*(_BYTE *)(v23 + 8))
      {
        fputc(44, *(FILE **)v23);
        uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40LL);
      }

      fwrite(v6, 7uLL, 1uLL, *(FILE **)v23);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
      uint64_t v22 = *(void *)(a1 + 32);
      __int128 v24 = *(FILE ***)(v22 + 40);
      if (v24)
      {
        if (v9) {
          uint64_t v25 = v9[10];
        }
        else {
          uint64_t v25 = 0LL;
        }
        fprintf(*v24, v7, v25);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
        uint64_t v22 = *(void *)(a1 + 32);
      }
    }

    goto LABEL_26;
  }

void sub_100016F68(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectEnumerator]);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100018574;
    v4[3] = &unk_100029DE8;
    v4[4] = a1;
    [v3 fp_enumerateObjectsWithBatchSize:16 usingBlock:v4];
  }

void sub_1000174B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_attr_t v4 = v3;
  if (!a1) {
    goto LABEL_27;
  }
  if (!v3)
  {
    uint64_t v16 = *(FILE ***)(a1 + 40);
    if (!v16) {
      goto LABEL_27;
    }
    fputs("null", *v16);
LABEL_26:
    *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = 1;
    goto LABEL_27;
  }

  if (!objc_msgSend(v3, "fp_isContainer"))
  {
    uint64_t v17 = *(FILE ***)(a1 + 40);
    if (!v17) {
      goto LABEL_27;
    }
    fprintf(*v17, "%lld", [v4 value]);
    goto LABEL_26;
  }

  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (*(_BYTE *)(v6 + 8))
    {
      fputc(44, *(FILE **)v6);
      uint64_t v6 = *(void *)(a1 + 40);
    }

    fputc(123, *(FILE **)v6);
    *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = 0;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v13 = *(void *)(a1 + 40);
        if (v13)
        {
          if (*(_BYTE *)(v13 + 8))
          {
            fputc(44, *(FILE **)v13);
            uint64_t v13 = *(void *)(a1 + 40);
          }

          fprintf(*(FILE **)v13, "%s:", (const char *)[v12 UTF8String]);
          *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = 0;
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);
        sub_1000174B8(a1, v14);
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  unint64_t v15 = *(FILE ***)(a1 + 40);
  if (v15)
  {
    fputc(125, *v15);
    *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = 1;
  }

LABEL_27:
}

void sub_100018574(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      id v6 = *a2;
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40LL);
      if (v7)
      {
        if (*(_BYTE *)(v7 + 8))
        {
          fputc(44, *(FILE **)v7);
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40LL);
        }

        id v8 = *(FILE **)v7;
        id v9 = sub_10001D81C((uint64_t)v6);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = objc_claimAutoreleasedReturnValue( [v10 stringByReplacingOccurrencesOfString:@"" withString:@"\\"]);
        fprintf(v8, "%s:", (const char *)[v11 UTF8String]);

        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40LL);
        if (v12)
        {
          if (*(_BYTE *)(v12 + 8))
          {
            fputc(44, *(FILE **)v12);
            uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40LL);
          }

          fputc(123, *(FILE **)v12);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
          uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 40LL);
          if (v13)
          {
            if (*(_BYTE *)(v13 + 8))
            {
              fputc(44, *(FILE **)v13);
              uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 40LL);
            }

            fwrite("dirty:", 8uLL, 1uLL, *(FILE **)v13);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
            uint64_t v14 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
            if (v14)
            {
              fprintf( *v14,  "%llu",  (char *)[v6 totalDirtySize] + (void)[v6 totalSwappedSize]);
              *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
              uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 40LL);
              if (v15)
              {
                if (*(_BYTE *)(v15 + 8))
                {
                  fputc(44, *(FILE **)v15);
                  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 40LL);
                }

                fwrite("swapped:", 0xAuLL, 1uLL, *(FILE **)v15);
                *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
                uint64_t v16 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                if (v16)
                {
                  fprintf(*v16, "%llu", [v6 totalSwappedSize]);
                  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
                  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 40LL);
                  if (v17)
                  {
                    if (*(_BYTE *)(v17 + 8))
                    {
                      fputc(44, *(FILE **)v17);
                      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 40LL);
                    }

                    fwrite("clean:", 8uLL, 1uLL, *(FILE **)v17);
                    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
                    __int128 v18 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                    if (v18)
                    {
                      fprintf(*v18, "%llu", [v6 totalCleanSize]);
                      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
                      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 40LL);
                      if (v19)
                      {
                        if (*(_BYTE *)(v19 + 8))
                        {
                          fputc(44, *(FILE **)v19);
                          uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 40LL);
                        }

                        fwrite("reclaimable:", 0xEuLL, 1uLL, *(FILE **)v19);
                        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
                        __int128 v20 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                        if (v20)
                        {
                          fprintf(*v20, "%llu", [v6 totalReclaimableSize]);
                          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
                          uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 40LL);
                          if (v21)
                          {
                            if (*(_BYTE *)(v21 + 8))
                            {
                              fputc(44, *(FILE **)v21);
                              uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 40LL);
                            }

                            fwrite("wired:", 8uLL, 1uLL, *(FILE **)v21);
                            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
                            uint64_t v22 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                            if (v22)
                            {
                              fprintf(*v22, "%llu", [v6 totalWiredSize]);
                              *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
                              uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40LL);
                              if (v23)
                              {
                                if (*(_BYTE *)(v23 + 8))
                                {
                                  fputc(44, *(FILE **)v23);
                                  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40LL);
                                }

                                fwrite("regions:", 0xAuLL, 1uLL, *(FILE **)v23);
                                *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 0;
                                __int128 v24 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                                if (v24)
                                {
                                  fprintf(*v24, "%u", [v6 totalRegions]);
                                  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
                                  uint64_t v25 = *(FILE ***)(*(void *)(a1 + 32) + 40LL);
                                  if (v25)
                                  {
                                    fputc(125, *v25);
                                    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 40LL) + 8LL) = 1;
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

      ++a2;
      --v3;
    }

    while (v3);
  }

void sub_100018A64(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  if (a2 <= 1) {
    a2 = 1LL;
  }
  uint64_t v7 = malloc(8 * a2);
  id v8 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v7 count:a2];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    char v11 = 1;
    do
    {
      uint64_t v12 = (uint64_t *)v17;
      if ((v11 & 1) == 0 && v10 != *(void *)v17)
      {
        objc_enumerationMutation(v5);
        uint64_t v12 = (uint64_t *)v17;
      }

      uint64_t v10 = *v12;
      uint64_t v13 = *((void *)&v16 + 1);
      do
      {
        else {
          unint64_t v14 = a2;
        }
        uint64_t v15 = objc_autoreleasePoolPush();
        v6[2](v6, v13, v14);
        objc_autoreleasePoolPop(v15);
        v13 += 8 * v14;
        v9 -= v14;
      }

      while (v9);
      id v9 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v7 count:a2];
      char v11 = 0;
    }

    while (v9);
  }

  free(v7);
}

void *sub_100018BA4(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_CLASS___FPProcessGroupMinimal;
  uint64_t v3 = [super init];
  if (v3)
  {
    dispatch_queue_attr_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = (void *)v3[1];
    v3[1] = v4;

    v3[2] = a2;
  }

  return v3;
}

FPProcessGroup *sub_100018CD0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___FPProcessGroup);
    v2->super._hashValue = *(void *)(a1 + 16);
    objc_storeStrong((id *)&v2->super._processes, *(id *)(a1 + 8));
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_100018ECC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_queue_attr_t v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      dispatch_queue_attr_t v4 = *(void **)(a1 + 32);
    }

    [v4 addObject:v7];
    id v3 = v7;
  }
}

void sub_100018F5C(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (!a1) {
    goto LABEL_4;
  }
  if (a3)
  {
    *(_DWORD *)(a1 + 24) = a3;
    id v10 = v6;
    objc_storeStrong((id *)(a1 + 40), a2);
    id v6 = v10;
LABEL_4:

    return;
  }

  uint64_t v9 = _os_assert_log(0LL, v7, v8);
  _os_crash(v9);
  __break(1u);
}

id sub_100018FD4(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 40);
    if (v2)
    {
      if (!--*(_DWORD *)(a1 + 24))
      {
        id v3 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0LL;
      }

      id v4 = v2;
    }
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

FPTime *sub_10001918C(uint64_t a1)
{
  return objc_alloc_init(&OBJC_CLASS___FPTime);
}

unint64_t sub_1000191AC(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 8);
    if (qword_100038A48 != -1) {
      dispatch_once(&qword_100038A48, &stru_100029E08);
    }
    return v1 * (unint64_t)dword_100038A40 / *(unsigned int *)algn_100038A44;
  }

  return result;
}

unint64_t sub_100019208(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 16);
    if (qword_100038A48 != -1) {
      dispatch_once(&qword_100038A48, &stru_100029E08);
    }
    return v1 * (unint64_t)dword_100038A40 / *(unsigned int *)algn_100038A44;
  }

  return result;
}

double *sub_100019264(double *a1)
{
  if (a1) {
    a1 = (double *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a1[3]));
  }
  return a1;
}

void sub_100019290(id a1)
{
}

void *sub_10001929C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___FPOutputFormatterPerfdata;
    a1 = [super init];
    if (a1)
    {
      if (sub_100011D3C()) {
        id v4 = "footprint.phys_footprint";
      }
      else {
        id v4 = "footprint.vm_object_dirty";
      }
      uint64_t v5 = pdwriter_open([v3 UTF8String], v4, 1, 0);
      a1[1] = v5;
      if (v5)
      {
        pdwriter_set_description(v5, "Memory measurements gathered by the footprint(1) tool");
        pdwriter_set_primary_metric(a1[1], "total_memory,procname=ALL_PROCESSES");
      }

      else
      {
        perror("Unable to open pdwriter");

        a1 = 0LL;
      }
    }
  }

  return a1;
}

void sub_100019560(uint64_t a1, void *a2)
{
  if (a1)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectEnumerator]);
    id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v21 = *(void *)v23;
      __int128 v20 = v3;
      do
      {
        for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v21) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v8 = sub_10001D81C((uint64_t)v7);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 16) objectForKeyedSubscript:v9]);
          char v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v7 totalSwappedSize]
                          + (void)[v7 totalDirtySize]
                          + (unint64_t)[v10 unsignedLongLongValue]));
          [*(id *)(a1 + 16) setObject:v11 forKeyedSubscript:v9];

          if (!v10)
          {
            uint64_t v12 = sub_10001D850((id *)v7);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            if (v13)
            {
              unint64_t v14 = objc_alloc(&OBJC_CLASS___FPAuxDataInfo);
              uint64_t v15 = sub_10001D8D8((uint64_t)v7);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              id v17 = v13;
              id v18 = v16;
              if (v14)
              {
                v26.receiver = v14;
                v26.super_class = (Class)&OBJC_CLASS___FPAuxDataInfo;
                __int128 v19 = (FPAuxDataInfo *)objc_msgSendSuper2(&v26, "init");
                unint64_t v14 = v19;
                if (v19)
                {
                  objc_storeStrong((id *)&v19->_dictionary, v13);
                  objc_storeStrong((id *)&v14->_fullName, v16);
                }
              }

              [*(id *)(a1 + 24) setObject:v14 forKeyedSubscript:v9];
              id v3 = v20;
            }
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v5);
    }
  }

void sub_1000199FC(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "fp_isContainer"))
    {
      id v9 = v6;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (unint64_t i = 0LL; i != v11; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v21 + 1) + 8LL * (void)i);
            uint64_t v15 = (const char *)[v14 UTF8String];
            __int128 v16 = (char *)v15;
            if (a3)
            {
              __int128 v16 = __str;
              snprintf(__str, 0x400uLL, "%s.%s", a3, v15);
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
            sub_1000199FC(a1, v17, v16);
          }

          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }

        while (v11);
      }
    }

    else
    {
      if (!a3)
      {
        uint64_t v20 = _os_assert_log(0LL, v7, v8);
        _os_crash(v20);
        __break(1u);
      }

      id v9 = v6;
      unsigned int v18 = [v9 supportsFormattedValue];
      uint64_t v19 = *(void *)(a1 + 8);
      if (v18) {
        pdwriter_record_variable_str(v19, a3, [v9 formattedValue]);
      }
      else {
        pdwriter_record_variable_dbl(v19, a3, (double)(uint64_t)[v9 value]);
      }
    }
  }
}

void sub_100019BCC(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a1)
  {
    if (objc_msgSend(v7, "fp_isContainer"))
    {
      id v9 = v8;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v16 + 1) + 8LL * (void)v13);
            snprintf(__str, 0x400uLL, "%s.%s", a3, (const char *)[v14 UTF8String]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
            sub_100019BCC(a1, v15, __str, a4);

            uint64_t v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }

        while (v11);
      }
    }

    else
    {
      pdwriter_new_value(*(void *)(a1 + 8), a3, pdunit_B, (double)(uint64_t)[v8 value]);
      pdwriter_record_variable_str(*(void *)(a1 + 8), "process", a4);
      pdwriter_record_variable_str(*(void *)(a1 + 8), "procname", a4);
      pdwriter_record_tag(*(void *)(a1 + 8), pdtag_context);
    }
  }
}

id sub_10001A164()
{
  v1[0] = @"Dirty";
  v1[1] = @"Swapped";
  v1[2] = @"Clean";
  v1[3] = @"Reclaimable";
  v1[4] = @"Wired";
  v1[5] = @"Regions";
  v1[6] = @"Category";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v1,  7LL));
}

id *sub_10001A208(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a4;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)&OBJC_CLASS___FPOutputFormatterText;
    id v11 = [super init];
    a1 = v11;
    if (v11)
    {
      v11[17] = __stdoutp;
      v11[14] = a2;
      v11[15] = a3;
      objc_storeStrong(v11 + 16, a4);
      a1[8] = a5;
      if ((a3 & 2) != 0)
      {
        uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"(%@)",  @"Swapped");
        id v12 = a1[3];
        a1[3] = v13;
      }

      else
      {
        id v12 = a1[3];
        a1[3] = 0LL;
      }

      if ((a3 & 1) != 0)
      {
        uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"(%@)",  @"Wired");
        id v14 = a1[4];
        a1[4] = v15;
      }

      else
      {
        id v14 = a1[4];
        a1[4] = 0LL;
      }

      __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
      id v17 = a1[6];
      a1[6] = v16;

      [a1[6] setFormatOptions:4083];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
      [a1[6] setTimeZone:v18];

      if (a5 == (void *)1)
      {
        __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v20 = a1[9];
        a1[9] = v19;

        __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v22 = a1[10];
        a1[10] = v21;

        __int128 v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v24 = a1[11];
        a1[11] = v23;

        __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        id v26 = a1[12];
        a1[12] = v25;

        __int128 v27 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        id v28 = a1[13];
        a1[13] = v27;
      }
    }
  }

  return a1;
}

void sub_10001A484( uint64_t a1, void *a2, int a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  va_list v22 = &a9;
  if (!*(void *)(a1 + 64))
  {
    v21[1] = &a9;
    vfprintf(*(FILE **)(a1 + 136), a4, &a9);
    goto LABEL_15;
  }

  uint64_t v13 = v20;
  unsigned int v14 = vsnprintf(v20, 0xC8uLL, a4, v22);
  if ((v14 & 0x80000000) != 0) {
    goto LABEL_10;
  }
  if (v14 >= 0xC9)
  {
    uint64_t v15 = 200LL;
    while (1)
    {
      unint64_t v16 = v15 + 200;
      uint64_t v13 = (char *)v21 - ((v15 + 215) & 0xFFFFFFFFFFFFFFF0LL);
      unsigned int v17 = vsnprintf(v13, v15 + 200, a4, v22);
      if ((v17 & 0x80000000) != 0) {
        break;
      }
      uint64_t v15 = v16;
      if (v16 >= v17) {
        goto LABEL_8;
      }
    }

LABEL_10:
    __int128 v18 = 0LL;
    goto LABEL_11;
  }

void sub_10001A750(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      id v6 = *a2;
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = v6[10];
        id v9 = *(FILE **)(*(void *)(a1 + 32) + 136LL);
        if (v8 == -1)
        {
          fprintf(v9, "        unmapped -         unmapped [%010llx]", v7[12] & 0xFFFFFFFFFFLL);
          id v12 = [v7 swappedSize];
          uint64_t v13 = *(FILE **)(*(void *)(a1 + 32) + 136LL);
          goto LABEL_9;
        }

        uint64_t v10 = v7[12];
        uint64_t v11 = v7[11] + v8;
      }

      else
      {
        uint64_t v11 = 0LL;
        uint64_t v8 = 0LL;
        uint64_t v10 = 0LL;
        id v9 = *(FILE **)(*(void *)(a1 + 32) + 136LL);
      }

      fprintf(v9, "%16llx - %16llx [%010llx]", v8, v11, v10 & 0xFFFFFFFFFFLL);
      id v12 = [v7 swappedSize];
      uint64_t v13 = *(FILE **)(*(void *)(a1 + 32) + 136LL);
      if (!v7)
      {
        uint64_t v14 = 0LL;
        goto LABEL_10;
      }

LABEL_9:
      uint64_t v14 = v7[11];
LABEL_10:
      fprintf( v13,  " %7llu %7llu",  (unint64_t)(v14 + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40),  ((unint64_t)v12 + (void)[v7 dirtySize] + *(void *)(a1 + 40) - 1)
      / *(void *)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 32);
      if ((*(_BYTE *)(v15 + 120) & 2) != 0)
      {
        fprintf( *(FILE **)(v15 + 136),  " %7llu",  ((unint64_t)v12 + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
        uint64_t v15 = *(void *)(a1 + 32);
      }

      fprintf( *(FILE **)(v15 + 136),  " %7llu %7llu",  ((unint64_t)[v7 cleanSize] + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40),  ((unint64_t)objc_msgSend(v7, "reclaimableSize") + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v29 = a2;
      uint64_t v30 = v3;
      if ((*(_BYTE *)(v16 + 120) & 1) != 0)
      {
        fprintf( *(FILE **)(v16 + 136),  " %7llu",  ((unint64_t)[v7 wiredSize] + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
        uint64_t v16 = *(void *)(a1 + 32);
      }

      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 detailedName]);
      __int128 v18 = sub_10001AA4C(v16, v17);
      int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      id v20 = v19;
      __int128 v21 = (const char *)[v20 UTF8String];
      id v22 = objc_claimAutoreleasedReturnValue([v7 extendedInfo]);
      __int128 v23 = (const char *)[v22 UTF8String];
      id v24 = *(FILE **)(*(void *)(a1 + 32) + 136LL);
      id v25 = objc_claimAutoreleasedReturnValue([v7 name]);
      id v26 = (const char *)[v25 UTF8String];
      if (v21)
      {
        unsigned int v27 = [v20 length] + 1;
        if (!v23) {
          goto LABEL_18;
        }
      }

      else
      {
        unsigned int v27 = 0;
        __int128 v21 = "";
        if (!v23)
        {
LABEL_18:
          unsigned int v28 = 0;
          __int128 v23 = "";
          goto LABEL_19;
        }
      }

      unsigned int v28 = [v22 length] + 1;
LABEL_19:
      fprintf(v24, "   %s%*s%*s\n", v26, v27, v21, v28, v23);

      a2 = v29 + 1;
      uint64_t v3 = v30 - 1;
    }

    while (v30 != 1);
  }

NSString *sub_10001AA4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
    id v7 = 0LL;
    goto LABEL_7;
  }

  if ((*(_BYTE *)(a1 + 120) & 4) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
    id v6 = [v5 length];
    if (v6 != [v4 length])
    {
      id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @".../%@", v5);

      goto LABEL_7;
    }
  }

  id v7 = v4;
LABEL_7:

  return v7;
}

NSString *sub_10001AF64(NSString *a1, uint64_t a2)
{
  if (a1)
  {
    NSString v2 = a1[14];
    if (v2 == (NSString)2)
    {
      a1 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%llu pages",  ((unint64_t)a1[2] + a2 - 1) / (unint64_t)a1[2]);
    }

    else if (v2 == (NSString)1)
    {
      humanize_number(v4, 8LL, a2, "B", 32LL, 0LL);
      a1 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4);
    }

    else if (!v2)
    {
      a1 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%lld B", a2);
    }
  }

  return a1;
}

void sub_10001B308(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (!a1) {
    goto LABEL_19;
  }
  id v6 = v15;
  id v7 = v6;
  uint64_t v8 = *(__CFString **)(a1 + 128);
  if (v8 == @"Dirty")
  {
    uint64_t v10 = &stru_100029EA0;
LABEL_17:
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 keysSortedByValueUsingComparator:v10, v15]);
    goto LABEL_18;
  }

  if (v8 == @"Category")
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingSelector:"compare:"]);

LABEL_18:
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001C918;
    v16[3] = &unk_100029E60;
    id v17 = v7;
    uint64_t v18 = a1;
    id v19 = v5;
    [v12 fp_enumerateObjectsWithBatchSize:32 usingBlock:v16];

LABEL_19:
    return;
  }

  if (v8 == @"Swapped")
  {
    id v9 = &selRef_totalSwappedSize;
    goto LABEL_16;
  }

  if (v8 == @"Clean")
  {
    id v9 = &selRef_totalCleanSize;
    goto LABEL_16;
  }

  if (v8 == @"Reclaimable")
  {
    id v9 = &selRef_totalReclaimableSize;
    goto LABEL_16;
  }

  if (v8 == @"Wired")
  {
    id v9 = &selRef_totalWiredSize;
    goto LABEL_16;
  }

  if (v8 == @"Regions")
  {
    id v9 = &selRef_totalRegions;
LABEL_16:
    uint64_t v13 = *v9;
    id v14 = +[FPMemoryCategory instanceMethodForSelector:]( &OBJC_CLASS___FPMemoryCategory,  "instanceMethodForSelector:",  *v9,  v15);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001D264;
    v20[3] = &unk_100029EC0;
    v20[4] = v14;
    void v20[5] = v13;
    uint64_t v10 = (Block_layout *)v20;
    goto LABEL_17;
  }

  _os_crash("Unhandled text sort column");
  __break(1u);
}

void sub_10001B514(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    if (*(void *)(a1 + 112) == 1LL) {
      char v10 = 7;
    }
    else {
      char v10 = 11;
    }
    uint64_t v32 = v5;
    sub_10001A484(a1, v5, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v6, v7, v8, v9, v10);
    if (*(void *)(a1 + 112) == 1LL) {
      char v11 = 7;
    }
    else {
      char v11 = 11;
    }
    char v31 = v11;
    id v12 = sub_10001AF64((NSString *)a1, a2[1] + *a2);
    id v13 = objc_claimAutoreleasedReturnValue(v12);
    [v13 UTF8String];
    uint64_t v14 = *(void *)(a1 + 120);
    if ((v14 & 2) != 0)
    {
      id v15 = sub_10001AF64((NSString *)a1, a2[1]);
      id v30 = objc_claimAutoreleasedReturnValue(v15);
      [v30 UTF8String];
    }

    uint64_t v16 = sub_10001AF64((NSString *)a1, a2[2]);
    id v17 = objc_claimAutoreleasedReturnValue(v16);
    [v17 UTF8String];
    uint64_t v18 = sub_10001AF64((NSString *)a1, a2[3]);
    id v19 = objc_claimAutoreleasedReturnValue(v18);
    [v19 UTF8String];
    if ((*(_BYTE *)(a1 + 120) & 1) != 0)
    {
      id v24 = sub_10001AF64((NSString *)a1, a2[4]);
      id v25 = objc_claimAutoreleasedReturnValue(v24);
      [v25 UTF8String];
      sub_10001A484(a1, v32, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v26, v27, v28, v29, v31);
    }

    else
    {
      sub_10001A484(a1, v32, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v20, v21, v22, v23, v31);
    }

    if ((v14 & 2) != 0) {
    id v5 = v32;
    }
  }
}

void sub_10001BD68( uint64_t a1, char *__format, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    va_list v18 = (va_list)&a9;
    if (!*(void *)(a1 + 64))
    {
      vfprintf(*(FILE **)(a1 + 136), __format, v18);
      return;
    }

    char v11 = v17;
    unsigned int v12 = vsnprintf(v17, 0xC8uLL, __format, v18);
    if ((v12 & 0x80000000) == 0)
    {
      if (v12 < 0xC9)
      {
LABEL_8:
        uint64_t v16 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v11,  4LL);
LABEL_11:
        sub_10001D2D0((void *)a1, 0LL, 2, v16);

        return;
      }

      uint64_t v13 = 200LL;
      while (1)
      {
        unint64_t v14 = v13 + 200;
        char v11 = (char *)&v18 - ((v13 + 215) & 0xFFFFFFFFFFFFFFF0LL);
        unsigned int v15 = vsnprintf(v11, v13 + 200, __format, v18);
        if ((v15 & 0x80000000) != 0) {
          break;
        }
        uint64_t v13 = v14;
        if (v14 >= v15) {
          goto LABEL_8;
        }
      }
    }

    uint64_t v16 = 0LL;
    goto LABEL_11;
  }

void sub_10001BF0C(NSString *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v11 = a2;
    sub_10001A484((uint64_t)a1, v5, 1, "Auxiliary data:\n", v6, v7, v8, v9, v10);
    sub_10001C684(a1, v11, 1, v5);
  }

void sub_10001C684(NSString *a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);

  id obj = v10;
  id v45 = [v10 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v45)
  {
    uint64_t v11 = *(void *)v47;
    unsigned int v42 = a3 + 1;
    int v43 = a3;
    do
    {
      for (unint64_t i = 0LL; i != v45; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        va_list v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
        for (int j = a3; j; --j)
          sub_10001A484((uint64_t)a1, v8, 1, "    ", v14, v15, v16, v17, v41);
        if (objc_msgSend(v18, "fp_isContainer"))
        {
          char v20 = [v13 UTF8String];
          sub_10001A484((uint64_t)a1, v8, 1, "%s:\n", v21, v22, v23, v24, v20);
          sub_10001C684(a1, v18, v42, v8);
        }

        else
        {
          uint64_t v25 = v11;
          id v26 = v7;
          id v27 = v18;
          if ([v27 supportsFormattedValue])
          {
            char v28 = [v13 UTF8String];
            [v27 formattedValue];
            sub_10001A484((uint64_t)a1, v8, 1, "%s: %s\n", v29, v30, v31, v32, v28);
          }

          else
          {
            id v33 = [v27 value];
            char v34 = [v13 UTF8String];
            id v35 = sub_10001AF64(a1, (uint64_t)v33);
            id v36 = objc_claimAutoreleasedReturnValue(v35);
            [v36 UTF8String];
            sub_10001A484((uint64_t)a1, v8, 1, "%s: %s\n", v37, v38, v39, v40, v34);
          }

          id v7 = v26;
          uint64_t v11 = v25;
          a3 = v43;
        }
      }

      id v45 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }

    while (v45);
  }
}

void sub_10001C918(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    while (1)
    {
      id v6 = *a2;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);
      id v8 = (void *)v7;
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(_BYTE *)(v9 + 56)) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v7 == 0;
      }
      if (v10) {
        goto LABEL_9;
      }
LABEL_25:

      ++a2;
      if (!--v3) {
        return;
      }
    }

    uint64_t v9 = *(void *)(a1 + 40);
LABEL_9:
    id v11 = sub_10001D7EC((uint64_t)v8);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = sub_10001AA4C(v9, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    id v43 = v14;
    id v42 = [v43 UTF8String];
    uint64_t v15 = sub_10001D7A4((id *)v8);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (!v16) {
      id v16 = v6;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    if (*(void *)(v17 + 112) == 1LL) {
      char v18 = 7;
    }
    else {
      char v18 = 11;
    }
    char v37 = v18;
    uint64_t v38 = *(void **)(a1 + 48);
    uint64_t v39 = *(void *)(a1 + 40);
    id v19 = sub_10001AF64( (NSString *)v17,  (uint64_t)[v8 totalDirtySize] + (void)objc_msgSend(v8, "totalSwappedSize"));
    id v40 = objc_claimAutoreleasedReturnValue(v19);
    [v40 UTF8String];
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v36 = *(void *)(v20 + 120);
    id v41 = v6;
    if ((v36 & 2) != 0)
    {
      uint64_t v21 = sub_10001AF64((NSString *)v20, (uint64_t)[v8 totalSwappedSize]);
      id v34 = objc_claimAutoreleasedReturnValue(v21);
      [v34 UTF8String];
      uint64_t v20 = *(void *)(a1 + 40);
    }

    uint64_t v22 = sub_10001AF64((NSString *)v20, (uint64_t)[v8 totalCleanSize]);
    id v35 = objc_claimAutoreleasedReturnValue(v22);
    [v35 UTF8String];
    uint64_t v23 = sub_10001AF64(*(NSString **)(a1 + 40), (uint64_t)[v8 totalReclaimableSize]);
    id v24 = objc_claimAutoreleasedReturnValue(v23);
    [v24 UTF8String];
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(v25 + 120);
    if ((v26 & 1) != 0)
    {
      id v27 = sub_10001AF64((NSString *)v25, (uint64_t)[v8 totalWiredSize]);
      id v33 = objc_claimAutoreleasedReturnValue(v27);
      [v33 UTF8String];
    }

    [v8 totalRegions];
    id v28 = v16;
    [v28 UTF8String];
    if (v42) {
      [v43 length];
    }
    sub_10001A484(v39, v38, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v29, v30, v31, v32, v37);
    if ((v26 & 1) != 0) {

    }
    if ((v36 & 2) != 0) {
    id v6 = v41;
    }
    goto LABEL_25;
  }

int64_t sub_10001D134(id a1, FPMemoryCategory *a2, FPMemoryCategory *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = -[FPMemoryCategory totalDirtySize](v4, "totalDirtySize");
  uint64_t v7 = &v6[-[FPMemoryCategory totalSwappedSize](v4, "totalSwappedSize")];
  id v8 = -[FPMemoryCategory totalDirtySize](v5, "totalDirtySize");
  if (v7 > &v8[-[FPMemoryCategory totalSwappedSize](v5, "totalSwappedSize")]) {
    goto LABEL_7;
  }
  uint64_t v9 = -[FPMemoryCategory totalDirtySize](v4, "totalDirtySize");
  BOOL v10 = &v9[-[FPMemoryCategory totalSwappedSize](v4, "totalSwappedSize")];
  id v11 = -[FPMemoryCategory totalDirtySize](v5, "totalDirtySize");
  if (v10 >= &v11[-[FPMemoryCategory totalSwappedSize](v5, "totalSwappedSize")])
  {
    id v12 = -[FPMemoryCategory totalReclaimableSize](v4, "totalReclaimableSize");
    if (v12 <= (id)-[FPMemoryCategory totalReclaimableSize](v5, "totalReclaimableSize"))
    {
      id v13 = -[FPMemoryCategory totalReclaimableSize](v4, "totalReclaimableSize");
      if (v13 < (id)-[FPMemoryCategory totalReclaimableSize](v5, "totalReclaimableSize")) {
        goto LABEL_5;
      }
      id v15 = -[FPMemoryCategory totalCleanSize](v4, "totalCleanSize");
      if (v15 <= (id)-[FPMemoryCategory totalCleanSize](v5, "totalCleanSize"))
      {
        id v17 = -[FPMemoryCategory totalCleanSize](v4, "totalCleanSize");
        int64_t v14 = v17 < (id)-[FPMemoryCategory totalCleanSize](v5, "totalCleanSize");
        goto LABEL_8;
      }
    }

LABEL_5:
  int64_t v14 = 1LL;
LABEL_8:

  return v14;
}

uint64_t sub_10001D264(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  unint64_t v8 = v6(a2, v5);
  unint64_t v9 = (*(uint64_t (**)(id, void))(a1 + 32))(v7, *(void *)(a1 + 40));

  if (v8 > v9) {
    return -1LL;
  }
  else {
    return v8 < v9;
  }
}

void sub_10001D2D0(void *a1, void *a2, int a3, void *a4)
{
  id v25 = a2;
  id v7 = a4;
  if (v7)
  {
    switch(a3)
    {
      case 2:
        unint64_t v8 = (void *)a1[13];
        goto LABEL_7;
      case 1:
        unint64_t v9 = (void *)a1[11];
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]));
        id v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

        if (!v11)
        {
          id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          id v12 = (void *)a1[11];
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]));
          [v12 setObject:v11 forKeyedSubscript:v13];
        }

        int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v11, "lastObject"));
        id v15 = v14;
        if (v14 && ![v14 hasSuffix:@"\n"])
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:v7]);
          -[NSMutableArray setObject:atIndexedSubscript:]( v11,  "setObject:atIndexedSubscript:",  v16,  (char *)-[NSMutableArray count](v11, "count") - 1);
        }

        else
        {
          -[NSMutableArray addObject:](v11, "addObject:", v7);
        }

        id v17 = [v7 length];
        char v18 = (void *)a1[9];
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);
        id v21 = [v20 integerValue];

        if (v17 > v21)
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v17));
          uint64_t v23 = (void *)a1[9];
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]));
          [v23 setObject:v22 forKeyedSubscript:v24];
        }

        break;
      case 0:
        unint64_t v8 = (void *)a1[12];
LABEL_7:
        [v8 appendString:v7];
        break;
    }
  }
}

void sub_10001D590(id a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = 40LL;
  do
  {
    uint64_t v3 = 2 * v2;
    uint64_t v12 = 2 * v2;
    uint64_t v1 = realloc(v1, 192 * v2);
    if ((ledger(2LL, v1, &v12, 0LL) & 0x80000000) != 0)
    {
      free(v1);
      qword_100038A78 = -1LL;
      perror("Unable to retrieve ledger template info");
      return;
    }

    uint64_t v2 = v3;
  }

  while (v3 == v12);
  qword_100038A78 = v12;
  *(void *)&__int128 v6 = -1LL;
  *((void *)&v6 + 1) = -1LL;
  xmmword_100038A58 = v6;
  *(_OWORD *)algn_100038A68 = v6;
  if (v12 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      unsigned __int8 v9 = 0;
      while (1)
      {
        unsigned int v10 = v9;
        id v11 = sub_10001D6CC(v9, v4, v5);
        if (v11)
        {
        }

        ++v9;
        if (v10 >= 3) {
          goto LABEL_12;
        }
      }

      *((void *)&xmmword_100038A58 + v9) = v7;
      if (++v8 == 4) {
        break;
      }
LABEL_12:
      ++v7;
    }

    while (v7 < qword_100038A78);
  }

  free(v1);
}

char *sub_10001D6CC(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 4) {
    return off_100029F00[a1];
  }
  uint64_t v4 = _os_assert_log(0LL, a2, a3);
  size_t result = (char *)_os_crash(v4);
  __break(1u);
  return result;
}

double sub_10001D74C(void *a1, char a2)
{
  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_CLASS___FPMemoryCategory;
    uint64_t v3 = [super init];
    if (v3)
    {
      v3[8] = a2;
      double result = 0.0;
      *((_OWORD *)v3 + 2) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((void *)v3 + _Block_object_dispose(va, 8) = 0LL;
    }
  }

  return result;
}

id *sub_10001D7A4(id *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    id v2 = a1[2];
    if (!v2)
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue([a1[3] name]);
      id v4 = v1[2];
      v1[2] = (id)v3;

      id v2 = v1[2];
    }

    a1 = (id *)v2;
  }

  return a1;
}

id sub_10001D7EC(uint64_t a1)
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8)) {
      return 0LL;
    }
    a1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) detailedName]);
  }

  return (id)a1;
}

id sub_10001D81C(uint64_t a1)
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      uint64_t v1 = sub_10001D7A4((id *)a1);
      a1 = objc_claimAutoreleasedReturnValue(v1);
    }

    else
    {
      a1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) fullName]);
    }
  }

  return (id)a1;
}

id *sub_10001D850(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[3] auxData]);
    uint64_t v3 = v2;
    if (*((_BYTE *)v1 + 8))
    {
      uint64_t v1 = v2;
    }

    else
    {
      uint64_t v1 = (id *)objc_claimAutoreleasedReturnValue([v1[3] detailedAuxData]);
      if (v3)
      {
        uint64_t v4 = [v3 fp_mergeWithData:v1 forceAggregate:1];

        uint64_t v1 = (id *)v4;
      }
    }
  }

  return v1;
}

NSString *sub_10001D8D8(uint64_t a1)
{
  if (a1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) auxDataName]);
    uint64_t v3 = v2;
    if (*(_BYTE *)(a1 + 8))
    {
      uint64_t v4 = v2;
    }

    else
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) detailedAuxDataName]);
      if ([v5 length]) {
        __int128 v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@ %@", v3, v5);
      }
      else {
        __int128 v6 = v3;
      }
      uint64_t v4 = v6;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

void sub_10001D980(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    __int128 v6 = v4;
    if (!*(void *)(a1 + 24))
    {
      objc_storeStrong((id *)(a1 + 24), a2);
      id v4 = v6;
    }

    *(void *)(a1 + 32) += [v4 dirtySize];
    *(void *)(a1 + 40) += [v6 swappedSize];
    *(void *)(a1 + 48) += [v6 cleanSize];
    *(void *)(a1 + 56) += [v6 reclaimableSize];
    *(void *)(a1 + 64) += [v6 wiredSize];
    unsigned int v5 = [v6 totalRegions];
    id v4 = v6;
    *(_DWORD *)(a1 + 12) += v5;
  }
}

id objc_msgSend_wiredSize(void *a1, const char *a2, ...)
{
  return [a1 wiredSize];
}