char **_os_feature_search_paths()
{
  return _os_feature_search_paths_paths;
}

const char *_os_feature_internal_search_path()
{
  return "/System/AppleInternal/Library/FeatureFlags";
}

BOOL _os_feature_enabled_SLOWPATH(const char *a1, const char *a2)
{
  uint64_t v81 = *MEMORY[0x1895FEE08];
  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  unint64_t v3 = 0x18C52A000uLL;
  if (_slow_cache)
  {
    uint64_t v4 = xpc_dictionary_get_value((xpc_object_t)_slow_cache, a1);
    xpc_object_t v5 = (xpc_object_t)v4;
    if (v4)
    {
      if (MEMORY[0x186DFB3C0](v4) != MEMORY[0x189600980]) {
        goto LABEL_19;
      }
      xpc_dictionary_get_value(v5, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      BOOL v8 = v6 == (void *)MEMORY[0x189600928];
      if (v6 == (void *)MEMORY[0x189600928] || v6 == (void *)MEMORY[0x189600920])
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);

        goto LABEL_22;
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
  v10 = _os_feature_search_paths();
  if ((unint64_t)__strlcpy_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    uint64_t v17 = MEMORY[0x1895FED80];
    __stringp[0] = (char *)MEMORY[0x1895FED80];
    __stringp[1] = (char *)3221225472LL;
    __stringp[2] = (char *)___os_featureenabled_slow_load_disclosures_block_invoke;
    __stringp[3] = (char *)&unk_189654BF8;
    id v18 = empty;
    id v80 = v18;
    xpc_dictionary_applier_t applier = (xpc_dictionary_applier_t)MEMORY[0x186DFB270](__stringp);
    v77[0] = v17;
    v77[1] = 3221225472LL;
    v77[2] = ___os_featureenabled_slow_load_disclosures_block_invoke_2;
    v77[3] = &unk_189654BF8;
    id v70 = v18;
    id v78 = v70;
    xpc_dictionary_applier_t v71 = (xpc_dictionary_applier_t)MEMORY[0x186DFB270](v77);
    v19 = _os_feature_search_paths();
    if (*v19)
    {
      uint64_t v20 = MEMORY[0x189600980];
      do
      {
        uint64_t v21 = _os_feature_enabled_load();
        v22 = (void *)v21;
        if (v21 && MEMORY[0x186DFB3C0](v21) == v20) {
          xpc_dictionary_apply(v22, applier);
        }
        _os_feature_internal_search_path();
        uint64_t v23 = _os_feature_enabled_load();
        v24 = (void *)v23;
        if (v23 && MEMORY[0x186DFB3C0](v23) == v20) {
          xpc_dictionary_apply(v24, v71);
        }
        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          uint64_t v25 = _os_feature_enabled_load();
          v26 = (void *)v25;
          if (v25 && MEMORY[0x186DFB3C0](v25) == v20) {
            xpc_dictionary_apply(v26, applier);
          }
          uint64_t v27 = _os_feature_enabled_load();
          v28 = (void *)v27;
          if (v27 && MEMORY[0x186DFB3C0](v27) == v20) {
            xpc_dictionary_apply(v28, applier);
          }
        }

        v29 = v19[1];
        ++v19;
      }

      while (v29);
    }

    id v30 = v70;

    if (*v10)
    {
      LOBYTE(v8) = 0;
      v31 = "/Global.plist";
      do
      {
        _os_feature_enabled_load();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        id v33 = v30;
        if (v32 && MEMORY[0x186DFB3C0](v32) == MEMORY[0x189600980])
        {
          uint64_t v34 = xpc_dictionary_get_value(v32, a2);
          v35 = (void *)v34;
          if (v34 && MEMORY[0x186DFB3C0](v34) == MEMORY[0x189600980])
          {
            uint64_t v36 = xpc_dictionary_get_value(v35, "DisclosureRequired");
            v37 = (void *)v36;
            if (!v36
              || MEMORY[0x186DFB3C0](v36) != MEMORY[0x1896009B8]
              || (v38 = xpc_string_get_string_ptr(v37), xpc_dictionary_get_BOOL(v33, v38)))
            {
              xpc_dictionary_applier_t appliera = v33;
              xpc_dictionary_get_value(v35, "Enabled");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v40 = xpc_dictionary_get_value(v35, "DevelopmentPhase");
              v41 = (void *)v40;
              if (!v39 || !v40)
              {
                if (v39 && MEMORY[0x186DFB3C0](v39) == MEMORY[0x189600960])
                {
                  LOBYTE(v8) = xpc_BOOL_get_value(v39);
                }

                else if (v41 && MEMORY[0x186DFB3C0](v41) == MEMORY[0x1896009B8])
                {
                  string_ptr = xpc_string_get_string_ptr(v41);
                  LOBYTE(v8) = strcmp(string_ptr, "FeatureComplete") == 0;
                }
              }

              id v33 = appliera;
            }
          }
        }

        _os_feature_enabled_load();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_extract_domain(v43, a1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = _os_feature_enabled_extract(v44, a2, v8, v33);

        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          _os_feature_enabled_load();
          xpc_dictionary_applier_t applierb = (xpc_dictionary_applier_t)objc_claimAutoreleasedReturnValue();
          _os_feature_enabled_extract_domain(applierb, a1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v46 = v8;
          v47 = v33;
          v48 = v45;
          BOOL v72 = _os_feature_enabled_extract(v45, a2, v46, v47);

          _os_feature_enabled_load();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _os_feature_enabled_extract_domain(v49, a1);
          id v50 = v32;
          v51 = v31;
          v52 = v10;
          v53 = a1;
          id v54 = v30;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v8 = _os_feature_enabled_extract(v55, a2, v72, v47);

          id v30 = v54;
          a1 = v53;
          v10 = v52;
          v31 = v51;
          id v32 = v50;
        }

        v56 = v10[1];
        ++v10;
      }

      while (v56);
    }

    else
    {
      BOOL v8 = 0LL;
    }

    xpc_object_t v57 = xpc_dictionary_create_empty();
    v58 = getenv("FEATUREFLAGS_ENABLED");
    v59 = getenv("FEATUREFLAGS_DISABLED");
    if (v58)
    {
      v60 = strdup(v58);
      __stringp[0] = v60;
      v61 = strsep(__stringp, ":");
      if (v61)
      {
        v62 = v61;
        v63 = (void *)MEMORY[0x189600928];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v57, v62, v63);
          v62 = strsep(__stringp, ":");
        }

        while (v62);
      }

      free(v60);
    }

    if (v59)
    {
      v64 = strdup(v59);
      __stringp[0] = v64;
      v65 = strsep(__stringp, ":");
      if (v65)
      {
        v66 = v65;
        v67 = (void *)MEMORY[0x189600920];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v57, v66, v67);
          v66 = strsep(__stringp, ":");
        }

        while (v66);
      }

      free(v64);
    }

    if (v57)
    {
      xpc_dictionary_get_dictionary(v57, a1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      unint64_t v3 = 0x18C52A000LL;
      if (v68) {
        BOOL v8 = _os_feature_enabled_extract(v68, a2, v8, v30);
      }
    }

    else
    {
      unint64_t v3 = 0x18C52A000LL;
    }
  }

  else
  {
    BOOL v8 = 0LL;
  }

  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  v11 = *(void **)(v3 + 480);
  if (!v11)
  {
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    v13 = *(void **)(v3 + 480);
    *(void *)(v3 + 480) = v12;

    v11 = *(void **)(v3 + 480);
  }

  uint64_t v14 = xpc_dictionary_get_value(v11, a1);
  if (v14)
  {
    xpc_object_t v5 = (xpc_object_t)v14;
    if (MEMORY[0x186DFB3C0]() != MEMORY[0x189600980]) {
LABEL_19:
    }
      abort();
  }

  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_value(*(xpc_object_t *)(v3 + 480), a1, v5);
  }

  xpc_dictionary_set_BOOL(v5, a2, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
LABEL_22:

  return v8;
}

id _os_feature_enabled_load()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if ((unint64_t)__strlcpy_chk() > 0x3FF || (unint64_t)__strlcat_chk() > 0x3FF)
  {
    v0 = 0LL;
    return v0;
  }

  int v2 = open(v10, 16777476);
  if (v2 < 0)
  {
    v0 = 0LL;
    int v8 = *__error();
    if (!v8) {
      return v0;
    }
    goto LABEL_24;
  }

  int v3 = v2;
  size_t v4 = lseek(v2, 0LL, 2);
  if ((v4 & 0x8000000000000000LL) != 0)
  {
    v0 = 0LL;
    int v8 = *__error();
  }

  else
  {
    int64_t v5 = v4;
    v6 = (char *)malloc(v4);
    if (v5)
    {
      off_t v7 = 0LL;
      int v8 = 0;
      while (1)
      {
        ssize_t v9 = pread(v3, &v6[v7], v5 - v7, v7);
        if (v9 < 0)
        {
          int v8 = *__error();
          if (v8 != 4)
          {
            v0 = 0LL;
            goto LABEL_22;
          }
        }

        else
        {
          if (!v9)
          {
            v0 = 0LL;
            int v8 = 70;
            goto LABEL_22;
          }

          v7 += v9;
        }

        if (v7 >= v5) {
          goto LABEL_19;
        }
      }
    }

    int v8 = 0;
LABEL_19:
    v0 = (void *)xpc_create_from_plist();
LABEL_22:
    free(v6);
  }

  close(v3);
  if (v8) {
LABEL_24:
  }
    *__error() = v8;
  return v0;
}

BOOL _os_feature_enabled_extract(void *a1, const char *a2, BOOL value, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = MEMORY[0x186DFB3C0](v7);
    uint64_t v10 = MEMORY[0x189600980];
    if (v9 == MEMORY[0x189600980])
    {
      uint64_t v11 = xpc_dictionary_get_value(v7, a2);
      xpc_object_t v12 = (void *)v11;
      if (v11 && MEMORY[0x186DFB3C0](v11) == v10)
      {
        uint64_t v13 = xpc_dictionary_get_value(v12, "DisclosureRequired");
        uint64_t v14 = (void *)v13;
        if (!v13
          || MEMORY[0x186DFB3C0](v13) != MEMORY[0x1896009B8]
          || (string_ptr = xpc_string_get_string_ptr(v14), xpc_dictionary_get_BOOL(v8, string_ptr)))
        {
          uint64_t v16 = xpc_dictionary_get_value(v12, "Enabled");
          uint64_t v17 = (void *)v16;
          if (v16 && MEMORY[0x186DFB3C0](v16) == MEMORY[0x189600960]) {
            value = xpc_BOOL_get_value(v17);
          }
        }
      }
    }
  }

  return value;
}

id _os_feature_enabled_extract_domain(void *a1, const char *a2)
{
  if (a1)
  {
    uint64_t v2 = xpc_dictionary_get_value(a1, a2);
    int v3 = (void *)v2;
    if (v2 && MEMORY[0x186DFB3C0](v2) == MEMORY[0x189600980]) {
      id v4 = v3;
    }
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x186DFB3C0]() == MEMORY[0x189600980] && xpc_dictionary_get_BOOL(v5, "Disclosed")) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, 1);
  }

  return 1LL;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x186DFB3C0]() == MEMORY[0x189600980])
  {
    xpc_dictionary_get_value(v5, "Disclosed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      BOOL v7 = xpc_dictionary_get_BOOL(v5, "Disclosed");
      xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, v7);
    }
  }

  return 1LL;
}

void _os_feature_enabled_write_nested_value_into_plist(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  BOOL v7 = strdup(a2);
  __stringp = v7;
  id v8 = strsep(&__stringp, "/");
  if (v8 && (uint64_t v9 = v8, (v10 = strsep(&__stringp, "/")) != 0LL) && (v11 = v10, !strsep(&__stringp, "/")))
  {
    xpc_dictionary_get_dictionary(v5, v9);
    xpc_object_t empty = (void *)objc_claimAutoreleasedReturnValue();
    if (!empty)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v5, v9, empty);
    }

    xpc_dictionary_get_value(empty, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13) {
      _os_feature_enabled_write_nested_value_into_plist_cold_1();
    }
    xpc_object_t v14 = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v14, "Enabled", v6);
    xpc_dictionary_set_value(empty, v11, v14);
    free(v7);
  }

  else
  {
    free(v7);
  }
}

uint64_t _os_feature_enabled_is_safe_mode()
{
  return 0LL;
}

BOOL _os_feature_enabled_simple_impl(const char *a1, const char *a2, BOOL a3)
{
  uint64_t v6 = _os_feature_table();
  if (!v6) {
    return a3;
  }
  uint64_t v7 = v6;
  size_t v8 = strlen(a1);
  size_t v9 = strlen(a2);
  unint64_t v10 = v8 + v9 + 1;
  unint64_t v11 = (0xC6A4A7935BD1E995LL * v10) ^ *(void *)(v7 + 24);
  unint64_t v55 = v10;
  unint64_t v56 = v11;
  uint64_t v57 = 0LL;
  unsigned int v58 = 0;
  if (v10 < v8) {
    uint64_t v12 = v8 + v9 + 1;
  }
  else {
    uint64_t v12 = v8;
  }
  unint64_t v13 = (unint64_t)&a1[v12];
  if (v12 >= 16)
  {
    v15 = a1;
    do
    {
      unint64_t v11 = 0xC6A4A7935BD1E995LL
          * ((0xC6A4A7935BD1E995LL
            * ((0xC6A4A7935BD1E995LL
              * ((0xC6A4A7935BD1E995LL * *(void *)v15) ^ ((0xC6A4A7935BD1E995LL * *(void *)v15) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v15 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v15 + 1)) >> 47))));
      xpc_object_t v14 = v15 + 16;
      uint64_t v16 = v15 + 32;
      v15 += 16;
    }

    while ((unint64_t)v16 <= v13);
  }

  else
  {
    xpc_object_t v14 = a1;
  }

  if ((unint64_t)(v14 + 8) <= v13)
  {
    do
    {
      uint64_t v17 = v14 + 8;
      unint64_t v11 = 0xC6A4A7935BD1E995LL
          * ((0xC6A4A7935BD1E995LL
            * ((0xC6A4A7935BD1E995LL * *(void *)v14) ^ ((0xC6A4A7935BD1E995LL * *(void *)v14) >> 47))) ^ v11);
      BOOL v18 = (unint64_t)(v14 + 16) > v13;
      v14 += 8;
    }

    while (!v18);
  }

  else
  {
    uint64_t v17 = v14;
  }

  if ((unint64_t)v17 >= v13)
  {
    uint64_t v20 = 0LL;
    unsigned int v19 = 0;
  }

  else
  {
    unsigned int v19 = 0;
    uint64_t v20 = 0LL;
    int64_t v21 = &a1[v12] - v17;
    do
    {
      unsigned int v22 = *(unsigned __int8 *)v17++;
      v20 |= (unint64_t)v22 << v19;
      v19 += 8;
      --v21;
    }

    while (v21);
  }

  unint64_t v23 = v10 - v12;
  unint64_t v55 = v23;
  unint64_t v56 = v11;
  uint64_t v57 = v20;
  unsigned int v58 = v19;
  BOOL v24 = v10 > v8;
  if (v10 <= v8) {
    uint64_t v25 = &sep;
  }
  else {
    uint64_t v25 = (uint64_t *)((char *)&sep + 1);
  }
  if (v19)
  {
    if (v10 <= v8 || v19 > 0x3F)
    {
      if (v19 < 0x40) {
        goto LABEL_45;
      }
      uint64_t v27 = &sep;
    }

    else
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = &sep;
      do
      {
        unint64_t v28 = v19 + v26;
        unsigned int v29 = *(unsigned __int8 *)v27;
        uint64_t v27 = (uint64_t *)((char *)v27 + 1);
        v20 |= (unint64_t)v29 << (v19 + v26);
        v26 += 8LL;
      }

      while (v27 < v25 && v28 < 0x38);
      if (v28 <= 0x37)
      {
        v19 += v26;
        goto LABEL_45;
      }
    }

    unint64_t v30 = 0xC6A4A7935BD1E995LL * v20;
    uint64_t v20 = 0LL;
    unint64_t v11 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v30 ^ (v30 >> 47))) ^ v11);
  }

  else
  {
    uint64_t v27 = &sep;
  }

  if (v27 + 2 <= v25)
  {
    do
    {
      unint64_t v11 = 0xC6A4A7935BD1E995LL
          * ((0xC6A4A7935BD1E995LL
            * ((0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *v27) ^ ((0xC6A4A7935BD1E995LL * *v27) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * v27[1]) ^ ((0xC6A4A7935BD1E995LL * v27[1]) >> 47))));
      v31 = v27 + 2;
      id v32 = v27 + 4;
      v27 += 2;
    }

    while (v32 <= v25);
  }

  else
  {
    v31 = v27;
  }

  if (v31 + 1 <= v25)
  {
    do
    {
      id v33 = (char *)(v31 + 1);
      unint64_t v11 = 0xC6A4A7935BD1E995LL
          * ((0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *v31) ^ ((0xC6A4A7935BD1E995LL * *v31) >> 47))) ^ v11);
      BOOL v18 = v31 + 2 > v25;
      ++v31;
    }

    while (!v18);
  }

  else
  {
    id v33 = (char *)v31;
  }

  if (v33 >= (char *)v25)
  {
    unsigned int v19 = 0;
  }

  else
  {
    unsigned int v19 = 0;
    uint64_t v34 = (char *)((char *)&sep + v24 - v33);
    do
    {
      unsigned int v35 = *v33++;
      v20 |= (unint64_t)v35 << v19;
      v19 += 8;
      --v34;
    }

    while (v34);
  }

LABEL_45:
  size_t v36 = v23 - v24;
  unint64_t v55 = v36;
  unint64_t v56 = v11;
  uint64_t v57 = v20;
  unsigned int v58 = v19;
  if (v36 >= v9) {
    uint64_t v37 = v9;
  }
  else {
    uint64_t v37 = v36;
  }
  unint64_t v38 = (unint64_t)&a2[v37];
  if (!v19)
  {
    uint64_t v40 = a2;
LABEL_59:
    if ((unint64_t)(v40 + 16) <= v38)
    {
      do
      {
        unint64_t v11 = 0xC6A4A7935BD1E995LL
            * ((0xC6A4A7935BD1E995LL
              * ((0xC6A4A7935BD1E995LL
                * ((0xC6A4A7935BD1E995LL * *(void *)v40) ^ ((0xC6A4A7935BD1E995LL * *(void *)v40) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v40 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v40 + 1)) >> 47))));
        v44 = v40 + 16;
        v45 = v40 + 32;
        v40 += 16;
      }

      while ((unint64_t)v45 <= v38);
    }

    else
    {
      v44 = v40;
    }

    if ((unint64_t)(v44 + 8) <= v38)
    {
      do
      {
        BOOL v46 = v44 + 8;
        unint64_t v11 = 0xC6A4A7935BD1E995LL
            * ((0xC6A4A7935BD1E995LL
              * ((0xC6A4A7935BD1E995LL * *(void *)v44) ^ ((0xC6A4A7935BD1E995LL * *(void *)v44) >> 47))) ^ v11);
        BOOL v18 = (unint64_t)(v44 + 16) > v38;
        v44 += 8;
      }

      while (!v18);
    }

    else
    {
      BOOL v46 = v44;
    }

    if ((unint64_t)v46 >= v38)
    {
      unsigned int v19 = 0;
    }

    else
    {
      unsigned int v19 = 0;
      int64_t v47 = v46 - a2 - v37;
      do
      {
        unsigned int v48 = *(unsigned __int8 *)v46++;
        v20 |= (unint64_t)v48 << v19;
        v19 += 8;
        ++v47;
      }

      while (v47);
    }

    goto LABEL_71;
  }

  if (v37 < 1 || v19 > 0x3F)
  {
    uint64_t v40 = a2;
    if (v19 < 0x40) {
      goto LABEL_71;
    }
    goto LABEL_58;
  }

  uint64_t v39 = 0LL;
  uint64_t v40 = a2;
  do
  {
    unint64_t v41 = v19 + v39;
    unsigned int v42 = *(unsigned __int8 *)v40++;
    v20 |= (unint64_t)v42 << (v19 + v39);
    v39 += 8LL;
  }

  while ((unint64_t)v40 < v38 && v41 < 0x38);
  if (v41 > 0x37)
  {
LABEL_58:
    unint64_t v43 = 0xC6A4A7935BD1E995LL * v20;
    uint64_t v20 = 0LL;
    unint64_t v11 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v43 ^ (v43 >> 47))) ^ v11);
    goto LABEL_59;
  }

  v19 += v39;
LABEL_71:
  unint64_t v55 = v36 - v37;
  unint64_t v56 = v11;
  uint64_t v57 = v20;
  unsigned int v58 = v19;
  unint64_t v49 = simple_hash_final((uint64_t)&v55);
  uint64_t v50 = *(void *)(v7 + 16);
  if (v50)
  {
    uint64_t v51 = 0LL;
    while (1)
    {
      uint64_t v52 = v50 - 1;
      a3 = v51 <= v50 - 1;
      if (v51 > v50 - 1) {
        break;
      }
      while (1)
      {
        uint64_t v50 = (v51 + v52) >> 1;
        unint64_t v53 = *(void *)(v7 + 32 + 8 * v50);
        if (v53 >= v49) {
          break;
        }
        uint64_t v51 = v50 + 1;
        if (v50 >= v52) {
          return 0LL;
        }
      }

      if (v53 <= v49) {
        return a3;
      }
    }
  }

  return 0LL;
}

BOOL _os_feature_enabled_impl(const char *a1, const char *a2)
{
  if (_os_feature_enabled_impl_envvar_once != -1) {
    _os_once();
  }
  uint64_t v4 = _os_feature_table();
  if (!v4 || _os_feature_enabled_impl__os_feature_enabled_envvar_present) {
    return _os_feature_enabled_SLOWPATH(a1, a2);
  }
  uint64_t v5 = v4;
  size_t v6 = strlen(a1);
  size_t v7 = strlen(a2);
  unint64_t v8 = v6 + v7 + 1;
  unint64_t v9 = (0xC6A4A7935BD1E995LL * v8) ^ *(void *)(v5 + 24);
  unint64_t v54 = v8;
  unint64_t v55 = v9;
  uint64_t v56 = 0LL;
  unsigned int v57 = 0;
  if (v8 < v6) {
    uint64_t v10 = v6 + v7 + 1;
  }
  else {
    uint64_t v10 = v6;
  }
  unint64_t v11 = (unint64_t)&a1[v10];
  if (v10 >= 16)
  {
    unint64_t v13 = a1;
    do
    {
      unint64_t v9 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * *(void *)v13) ^ ((0xC6A4A7935BD1E995LL * *(void *)v13) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v13 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v13 + 1)) >> 47))));
      uint64_t v12 = v13 + 16;
      xpc_object_t v14 = v13 + 32;
      v13 += 16;
    }

    while ((unint64_t)v14 <= v11);
  }

  else
  {
    uint64_t v12 = a1;
  }

  if ((unint64_t)(v12 + 8) <= v11)
  {
    do
    {
      v15 = v12 + 8;
      unint64_t v9 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL * *(void *)v12) ^ ((0xC6A4A7935BD1E995LL * *(void *)v12) >> 47))) ^ v9);
      BOOL v16 = (unint64_t)(v12 + 16) > v11;
      v12 += 8;
    }

    while (!v16);
  }

  else
  {
    v15 = v12;
  }

  if ((unint64_t)v15 >= v11)
  {
    uint64_t v18 = 0LL;
    unsigned int v17 = 0;
  }

  else
  {
    unsigned int v17 = 0;
    uint64_t v18 = 0LL;
    int64_t v19 = &a1[v10] - v15;
    do
    {
      unsigned int v20 = *(unsigned __int8 *)v15++;
      v18 |= (unint64_t)v20 << v17;
      v17 += 8;
      --v19;
    }

    while (v19);
  }

  unint64_t v21 = v8 - v10;
  unint64_t v54 = v21;
  unint64_t v55 = v9;
  uint64_t v56 = v18;
  unsigned int v57 = v17;
  BOOL v22 = v8 > v6;
  if (v8 <= v6) {
    unint64_t v23 = &sep;
  }
  else {
    unint64_t v23 = (uint64_t *)((char *)&sep + 1);
  }
  if (v17)
  {
    if (v8 <= v6 || v17 > 0x3F)
    {
      if (v17 < 0x40) {
        goto LABEL_48;
      }
      uint64_t v25 = &sep;
    }

    else
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = &sep;
      do
      {
        unint64_t v26 = v17 + v24;
        unsigned int v27 = *(unsigned __int8 *)v25;
        uint64_t v25 = (uint64_t *)((char *)v25 + 1);
        v18 |= (unint64_t)v27 << (v17 + v24);
        v24 += 8LL;
      }

      while (v25 < v23 && v26 < 0x38);
      if (v26 <= 0x37)
      {
        v17 += v24;
        goto LABEL_48;
      }
    }

    unint64_t v28 = 0xC6A4A7935BD1E995LL * v18;
    uint64_t v18 = 0LL;
    unint64_t v9 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v28 ^ (v28 >> 47))) ^ v9);
  }

  else
  {
    uint64_t v25 = &sep;
  }

  if (v25 + 2 <= v23)
  {
    do
    {
      unint64_t v9 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *v25) ^ ((0xC6A4A7935BD1E995LL * *v25) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * v25[1]) ^ ((0xC6A4A7935BD1E995LL * v25[1]) >> 47))));
      unsigned int v29 = v25 + 2;
      unint64_t v30 = v25 + 4;
      v25 += 2;
    }

    while (v30 <= v23);
  }

  else
  {
    unsigned int v29 = v25;
  }

  if (v29 + 1 <= v23)
  {
    do
    {
      v31 = (char *)(v29 + 1);
      unint64_t v9 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *v29) ^ ((0xC6A4A7935BD1E995LL * *v29) >> 47))) ^ v9);
      BOOL v16 = v29 + 2 > v23;
      ++v29;
    }

    while (!v16);
  }

  else
  {
    v31 = (char *)v29;
  }

  if (v31 >= (char *)v23)
  {
    unsigned int v17 = 0;
  }

  else
  {
    unsigned int v17 = 0;
    id v32 = (char *)((char *)&sep + v22 - v31);
    do
    {
      unsigned int v33 = *v31++;
      v18 |= (unint64_t)v33 << v17;
      v17 += 8;
      --v32;
    }

    while (v32);
  }

LABEL_48:
  size_t v34 = v21 - v22;
  unint64_t v54 = v34;
  unint64_t v55 = v9;
  uint64_t v56 = v18;
  unsigned int v57 = v17;
  if (v34 >= v7) {
    uint64_t v35 = v7;
  }
  else {
    uint64_t v35 = v34;
  }
  unint64_t v36 = (unint64_t)&a2[v35];
  if (!v17)
  {
    unint64_t v38 = a2;
LABEL_62:
    if ((unint64_t)(v38 + 16) <= v36)
    {
      do
      {
        unint64_t v9 = 0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL
               * ((0xC6A4A7935BD1E995LL * *(void *)v38) ^ ((0xC6A4A7935BD1E995LL * *(void *)v38) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v38 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v38 + 1)) >> 47))));
        unsigned int v42 = v38 + 16;
        unint64_t v43 = v38 + 32;
        v38 += 16;
      }

      while ((unint64_t)v43 <= v36);
    }

    else
    {
      unsigned int v42 = v38;
    }

    if ((unint64_t)(v42 + 8) <= v36)
    {
      do
      {
        v44 = v42 + 8;
        unint64_t v9 = 0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * *(void *)v42) ^ ((0xC6A4A7935BD1E995LL * *(void *)v42) >> 47))) ^ v9);
        BOOL v16 = (unint64_t)(v42 + 16) > v36;
        v42 += 8;
      }

      while (!v16);
    }

    else
    {
      v44 = v42;
    }

    if ((unint64_t)v44 >= v36)
    {
      unsigned int v17 = 0;
    }

    else
    {
      unsigned int v17 = 0;
      int64_t v45 = v44 - a2 - v35;
      do
      {
        unsigned int v46 = *(unsigned __int8 *)v44++;
        v18 |= (unint64_t)v46 << v17;
        v17 += 8;
        ++v45;
      }

      while (v45);
    }

    goto LABEL_74;
  }

  if (v35 < 1 || v17 > 0x3F)
  {
    unint64_t v38 = a2;
    if (v17 < 0x40) {
      goto LABEL_74;
    }
    goto LABEL_61;
  }

  uint64_t v37 = 0LL;
  unint64_t v38 = a2;
  do
  {
    unint64_t v39 = v17 + v37;
    unsigned int v40 = *(unsigned __int8 *)v38++;
    v18 |= (unint64_t)v40 << (v17 + v37);
    v37 += 8LL;
  }

  while ((unint64_t)v38 < v36 && v39 < 0x38);
  if (v39 > 0x37)
  {
LABEL_61:
    unint64_t v41 = 0xC6A4A7935BD1E995LL * v18;
    uint64_t v18 = 0LL;
    unint64_t v9 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v41 ^ (v41 >> 47))) ^ v9);
    goto LABEL_62;
  }

  v17 += v37;
LABEL_74:
  unint64_t v54 = v34 - v35;
  unint64_t v55 = v9;
  uint64_t v56 = v18;
  unsigned int v57 = v17;
  unint64_t v47 = simple_hash_final((uint64_t)&v54);
  uint64_t v48 = *(void *)(v5 + 16);
  if (v48)
  {
    uint64_t v49 = 0LL;
    while (1)
    {
      uint64_t v50 = v48 - 1;
      BOOL v51 = v49 <= v48 - 1;
      if (v49 > v48 - 1) {
        break;
      }
      while (1)
      {
        uint64_t v48 = (v49 + v50) >> 1;
        unint64_t v52 = *(void *)(v5 + 32 + 8 * v48);
        if (v52 >= v47) {
          break;
        }
        uint64_t v49 = v48 + 1;
        if (v48 >= v50) {
          return 0LL;
        }
      }

      if (v52 <= v47) {
        return v51;
      }
    }
  }

  return 0LL;
}

char *_os_feature_enabled_envvar_check_once(_BYTE *a1)
{
  result = getenv("FEATUREFLAGS_ENABLED");
  if (result || (result = getenv("FEATUREFLAGS_DISABLED")) != 0LL) {
    *a1 = 1;
  }
  return result;
}

unint64_t simple_hash_final(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895FEE08];
  unint64_t v1 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24)) {
      return (0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) >> 47);
    }
    goto LABEL_61;
  }

  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(a1 + 16);
    unint64_t v4 = v1;
    unsigned int v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      uint64_t v6 = v1 >= 0x20 ? 32LL : v1;
      size_t v7 = (char *)v29 + v6;
      if (!v5) {
        break;
      }
      if (v6 && v5 <= 0x3F)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = (char *)v29;
        do
        {
          unint64_t v10 = v5 + v8;
          unsigned int v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8LL;
        }

        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37) {
          goto LABEL_18;
        }
        v5 += v8;
      }

      else if (v5 >= 0x40)
      {
        unint64_t v9 = (char *)v29;
LABEL_18:
        unint64_t v12 = 0xC6A4A7935BD1E995LL * v3;
        uint64_t v3 = 0LL;
        unint64_t v2 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        unint64_t v13 = v9 + 16;
        while (v13 <= v7)
        {
          unint64_t v2 = 0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL
               * ((0xC6A4A7935BD1E995LL
                 * ((0xC6A4A7935BD1E995LL * *(void *)v9) ^ ((0xC6A4A7935BD1E995LL * *(void *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v9 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v9 + 1)) >> 47))));
          unint64_t v13 = v9 + 32;
          v9 += 16;
        }

        if (v9 + 8 <= v7)
        {
          do
          {
            unint64_t v2 = 0xC6A4A7935BD1E995LL
               * ((0xC6A4A7935BD1E995LL
                 * ((0xC6A4A7935BD1E995LL * *(void *)v9) ^ ((0xC6A4A7935BD1E995LL * *(void *)v9) >> 47))) ^ v2);
            BOOL v14 = v9 + 16 > v7;
            v9 += 8;
          }

          while (!v14);
        }

        if (v9 >= v7)
        {
          unsigned int v5 = 0;
        }

        else
        {
          unsigned int v5 = 0;
          v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            unsigned int v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }

          while (v15);
        }
      }

      v1 -= v6;
      v4 -= 32LL;
      if (v4 <= 0x1F)
      {
        *(void *)a1 = v1;
        *(void *)(a1 + 8) = v2;
        *(void *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }

    unint64_t v9 = (char *)v29;
    goto LABEL_19;
  }

  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = v1;
  unsigned int v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4) {
    unint64_t v4 = v1;
  }
  unsigned int v17 = (unsigned __int8 *)v29;
  uint64_t v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      uint64_t v19 = 0LL;
      unsigned int v17 = (unsigned __int8 *)v29;
      do
      {
        unint64_t v20 = v5 + v19;
        unsigned int v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8LL;
      }

      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }

    else
    {
      if (v5 < 0x40) {
        goto LABEL_60;
      }
      unsigned int v17 = (unsigned __int8 *)v29;
    }

    unint64_t v22 = 0xC6A4A7935BD1E995LL * v3;
    uint64_t v3 = 0LL;
    unint64_t v2 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v22 ^ (v22 >> 47))) ^ v2);
  }

  if (v17 + 16 <= v18)
  {
    do
    {
      unint64_t v2 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * *(void *)v17) ^ ((0xC6A4A7935BD1E995LL * *(void *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v17 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v17 + 1)) >> 47))));
      unint64_t v23 = (char *)(v17 + 16);
      uint64_t v24 = v17 + 32;
      v17 += 16;
    }

    while (v24 <= v18);
  }

  else
  {
    unint64_t v23 = (char *)v17;
  }

  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      uint64_t v25 = v23 + 8;
      unint64_t v2 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL * *(void *)v23) ^ ((0xC6A4A7935BD1E995LL * *(void *)v23) >> 47))) ^ v2);
      BOOL v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }

    while (!v14);
  }

  else
  {
    uint64_t v25 = v23;
  }

  if (v25 >= (char *)v18)
  {
    unsigned int v5 = 0;
  }

  else
  {
    unsigned int v5 = 0;
    unint64_t v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      unsigned int v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }

    while (v26);
  }

LABEL_60:
  *(void *)a1 = v1 - v4;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5) {
LABEL_61:
  }
    unint64_t v2 = 0xC6A4A7935BD1E995LL * (*(void *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) >> 47);
}

uint64_t _os_feature_table()
{
  if (_os_feature_table_table_once != -1) {
    _os_once();
  }
  return _os_feature_table_table;
}

uint64_t _os_feature_table_once(void *a1)
{
  uint64_t result = shm_open("com.apple.featureflags.shm", 0);
  if ((result & 0x80000000) == 0)
  {
    int v3 = result;
    if ((fstat(result, &v5) & 0x80000000) == 0)
    {
      unint64_t v4 = mmap(0LL, v5.st_size, 1, 1, v3, 0LL);
      if (v4 != (void *)-1LL)
      {
        else {
          munmap(v4, v5.st_size);
        }
      }
    }

    return close(v3);
  }

  return result;
}

void _os_feature_enabled_write_nested_value_into_plist_cold_1()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895FEE30]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

void abort(void)
{
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1895FF598]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFEF8](*(void *)&__fd, __buf, __nbyte, a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x189600008](a1, *(void *)&a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FF378](__stringp, __delim);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x189600A40](xBOOL);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x189600AF8]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x189600B30](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x189600B48]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B60](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600B78](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600BA0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x189600C10](object);
}