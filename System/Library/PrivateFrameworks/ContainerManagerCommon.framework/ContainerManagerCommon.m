void *sb_packbuff_new(unint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  v2 = calloc(1uLL, 0x38uLL);
  v3 = v2;
  if (v2)
  {
    v4 = 256LL;
    if (a1 >= 8) {
      v4 = a1;
    }
    v2[1] = v4;
    *(_DWORD *)v2 = 1;
    if (sb_packbuff_realloc((uint64_t)v2, 0LL))
    {
      free(v3);
      return 0LL;
    }

    else
    {
      *((void *)v3 + 3) -= 8LL;
      *((void *)v3 + 4) = 8LL;
      **((void **)v3 + 6) = 0LL;
    }
  }

  return v3;
}

uint64_t sb_packbuff_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2 || *(_DWORD *)a1 != 1) {
    return 45LL;
  }
  unsigned int v5 = 8 - (a2 & 7);
  BOOL v6 = (a2 & 7) == 0;
  size_t v7 = *(void *)(a1 + 16) + v2;
  *(void *)(a1 + 16) = v7;
  if (v6) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = v5;
  }
  size_t v9 = v8 + a2;
  if (v9 > v7 - *(void *)(a1 + 32))
  {
    v7 += v9;
    *(void *)(a1 + 16) = v7;
  }

  v10 = reallocf(*(void **)(a1 + 40), v7);
  *(void *)(a1 + 40) = v10;
  if (!v10) {
    return 12LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t result = 0LL;
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a1 + 16) - v13;
  if (v13) {
    uint64_t v11 = v11 + v13 - 8;
  }
  *(void *)(a1 + 48) = v11;
  return result;
}

void *sb_packbuff_init_with_buffer(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t result = calloc(1uLL, 0x38uLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = a4;
    result[1] = 0LL;
    result[2] = a2;
    uint64_t v9 = a2;
    result[5] = a1;
    result[6] = a1;
    if (!a3)
    {
      *a1 = 0LL;
      a2 = result[2];
      uint64_t v9 = 8LL;
    }

    result[3] = a2 - v9;
    result[4] = v9;
  }

  return result;
}

void sb_packbuff_free(uint64_t *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 2)
    {
      if (MEMORY[0x1895CEA20](*MEMORY[0x1895FBBE0], a1[5], a1[2])
        && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        sb_packbuff_free_cold_1(a1 + 5, a1 + 2);
      }
    }

    else if (*(_DWORD *)a1 == 1)
    {
      free((void *)a1[5]);
    }

    free(a1);
  }
}

uint64_t sb_packbuff_get_bytes(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sb_packbuff_get_size(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sb_packbuff_get_item_value_type(void *a1, _WORD *a2)
{
  unint64_t v3 = a1[5];
  uint64_t v2 = (_WORD *)a1[6];
  *a2 = v2[1];
  return 1LL;
}

uint64_t sb_packbuff_unpack_uint32(void *a1, int *a2)
{
  unint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  if (v3 < v2 || (unint64_t v5 = v3 + 8, v3 + 8 > v2 + a1[4]))
  {
    uint64_t result = 0LL;
LABEL_4:
    int v7 = 34;
    goto LABEL_5;
  }

  if (*(_WORD *)v3 == 1)
  {
    uint64_t result = *(unsigned int *)(v3 + 4);
    if (v5 >= v2 + a1[2]) {
      goto LABEL_4;
    }
    int v7 = 0;
    a1[6] = v5;
  }

  else
  {
    uint64_t result = 0LL;
    int v7 = 22;
  }

LABEL_5:
  if (a2) {
    *a2 = v7;
  }
  return result;
}

  [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.DataContainerClass"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setDataContainerClass:", objc_msgSend(v18, "unsignedLongLongValue"));

  [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.ParentBundleID"];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v85) {
    goto LABEL_30;
  }
  v19 = -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v92 = v17;
  [v19 codeSigningEntryWithIdentifier:v85 error:&v92];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v92;

  if (v20)
  {
    v17 = v21;
    goto LABEL_8;
  }

  [v21 domain];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v34 isEqualToString:@"MCMErrorDomain"])
  {

LABEL_45:
    container_log_handle_for_category();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v95 = v83;
      v96 = 2112;
      v97 = (uint64_t)v21;
      _os_log_error_impl( &dword_188846000,  v56,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
    }

    v26 = 0LL;
    v27 = 0LL;
    v28 = 0LL;
    v29 = 0LL;
    v33 = 0;
    v17 = v21;
    if (!v21) {
      goto LABEL_73;
    }
    goto LABEL_67;
  }

  v35 = [v21 code] == 67;

  if (!v35) {
    goto LABEL_45;
  }

  v17 = 0LL;
LABEL_8:
  [v20 childBundleIdentifiers];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)[v22 mutableCopy];

  if (v23)
  {
    if (!v20) {
      goto LABEL_24;
    }
  }

  else
  {
    v23 = (void *)objc_opt_new();
    if (!v20) {
LABEL_24:
    }
      v20 = (void *)objc_opt_new();
  }

  if (([v23 containsObject:v83] & 1) == 0)
  {
    [v23 addObject:v83];
    v36 = (void *)[v23 copy];
    [v20 setChildBundleIdentifiers:v36];

    container_log_handle_for_category();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v95 = v23;
      v96 = 2112;
      v97 = (uint64_t)v85;
      v98 = 2112;
      v99 = (uint64_t)v83;
      _os_log_debug_impl( &dword_188846000,  v37,  OS_LOG_TYPE_DEBUG,  "Staging Child Bundles: %@ for parent ID: %@ by appending: %@",  buf,  0x20u);
    }

    [v79 addObject:v20];
    [v81 addObject:v85];
  }

LABEL_30:
  [v84 objectForKeyedSubscript:@"RegByCaller"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = [v38 BOOLValue];

  if (v39) {
    [v82 setRegisteredByCaller:1];
  }
  [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = [v40 BOOLValue];

  if (v41) {
    [v82 setPlaceholder:1];
  }
  [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.AdvanceCopy"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = [v42 BOOLValue];

  if (v43) {
    [v82 setAdvanceCopy:1];
  }
  [v82 setCodeSigningInfo:v80];
  if (v16 && ([v16 isEqual:v82] & 1) != 0)
  {
    v26 = 0LL;
    v27 = 0LL;
    v28 = 0LL;
    v29 = 0LL;
  }

  else
  {
    [v80 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
    v46 = containermanager_copy_global_configuration();
    [v46 classIterator];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v45,  "initWithEntitlements:clientIdentifier:classIterator:",  v44,  v83,  v47);

    v49 = containermanager_copy_global_configuration();
    v50 = [v49 systemContainerMode] == 0;

    if (!v50
      && [v78 hasSystemContainer]
      && !-[MCMEntitlements hasSystemContainer](v48, "hasSystemContainer"))
    {
      v51 = containermanager_copy_global_configuration();
      [v51 staticConfig];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      [v52 configForContainerClass:12];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[MCMCodeSigningMapping userIdentityCache](v77, "userIdentityCache");
      v55 = +[MCMContainerIdentity containerIdentityWithIdentifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithIdentifier:containerConfig:platform:userIdentityCache:error:",  v83,  v53,  0LL,  v54,  0LL);
      if (v55)
      {
        [v76 addObject:v55];
      }

      else
      {
        container_log_handle_for_category();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v95 = v83;
          v96 = 2112;
          v97 = (uint64_t)v17;
          _os_log_error_impl( &dword_188846000,  v57,  OS_LOG_TYPE_ERROR,  "Failed to create system container identity for %@: %@",  buf,  0x16u);
        }

        v17 = 0LL;
      }
    }

    v29 = -[MCMEntitlements appGroupIdentifiers](v48, "appGroupIdentifiers");
    v27 = [v78 appGroupIdentifiers];
    if (v27 | v29)
    {
      v89[0] = MEMORY[0x1895F87A8];
      v89[1] = 3221225472LL;
      v89[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke;
      v89[3] = &unk_18A29D4F8;
      v90 = v76;
      v91 = v75;
      -[MCMCodeSigningMapping _onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:]( v77,  "_onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:",  v27,  v29,  7LL,  v89);
    }

    v58 = containermanager_copy_global_configuration();
    v59 = [v58 systemContainerMode] == 0;

    if (v59
      || (-[MCMEntitlements systemGroupIdentifiers](v48, "systemGroupIdentifiers"),
          v60 = objc_claimAutoreleasedReturnValue(),
          [v78 systemGroupIdentifiers],
          v61 = objc_claimAutoreleasedReturnValue(),
          !(v61 | v60)))
    {
      v26 = 0LL;
      v28 = 0LL;
    }

    else
    {
      v86[0] = MEMORY[0x1895F87A8];
      v86[1] = 3221225472LL;
      v86[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2;
      v86[3] = &unk_18A29D4F8;
      v87 = v76;
      v88 = v75;
      -[MCMCodeSigningMapping _onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:]( v77,  "_onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:",  v61,  v60,  13LL,  v86);

      v26 = (void *)v61;
      v28 = (void *)v60;
    }

    container_log_handle_for_category();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v95 = v83;
      v96 = 2112;
      v97 = v27;
      v98 = 2112;
      v99 = v29;
      v100 = 2112;
      v101 = v26;
      v102 = 2112;
      v103 = v28;
      _os_log_impl( &dword_188846000,  v62,  OS_LOG_TYPE_DEFAULT,  "Reconciled [%@]; old app groups: %@, new app groups: %@, old system groups: %@, new system groups: %@",
        buf,
        0x34u);
    }

    if (v80)
    {
      v63 = v82;
    }

    else
    {
      v64 = objc_opt_new();

      v63 = (void *)v64;
    }

    v82 = v63;
    objc_msgSend(v79, "addObject:");
    [v81 addObject:v83];
  }

  if (![v81 count])
  {
    v33 = 1;
    if (!v17) {
      goto LABEL_73;
    }
LABEL_67:
    v24 = v16;
    [v17 domain];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = [v66 isEqual:@"MCMErrorDomain"];

    if (v67)
    {
      v68 = -[MCMError initWithErrorType:]( [MCMError alloc],  "initWithErrorType:",  [v17 code]);
    }

    else
    {
      [v17 domain];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = [v69 isEqual:*MEMORY[0x189607688]];

      if (!v70)
      {
        v25 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 40LL);
LABEL_79:
        v33 = 0;
        if (v73 && v25)
        {
          v25 = v25;
          v33 = 0;
          *v73 = v25;
        }

        v16 = v24;
        goto LABEL_83;
      }

      v68 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( [MCMError alloc],  "initWithErrorType:category:path:POSIXerrno:",  40,  1,  0,  [v17 code]);
    }

    v25 = v68;
    goto LABEL_79;
  }

  v65 = -[MCMCodeSigningMapping _onQueue_setCodeSigningDictionaryValues:forIdentifiers:]( v77,  "_onQueue_setCodeSigningDictionaryValues:forIdentifiers:",  v79,  v81);

  v33 = 1;
  v17 = (id)v65;
  if (v65) {
    goto LABEL_67;
  }
LABEL_73:
  v71 = !v33;
  if (!v74) {
    v71 = 1;
  }
  if ((v71 & 1) != 0)
  {
    v25 = 0LL;
    v17 = 0LL;
  }

  else
  {
    v74[2]();
    v25 = 0LL;
    v17 = 0LL;
    v33 = 1;
  }

  return v20;
}

uint64_t sb_packbuff_unpack_item(void *a1, int a2, _DWORD *a3, unsigned __int16 **a4, _DWORD *a5)
{
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
  if (v6 < v5) {
    return 34LL;
  }
  int v7 = (unsigned __int16 *)(v6 + 8);
  if (v6 + 8 > v5 + a1[4]) {
    return 34LL;
  }
  if ((a2 - 2) >= 2)
  {
    if (a2 == 1 && a3)
    {
      *a3 = *(_DWORD *)(v6 + 4);
      uint64_t v11 = 8LL;
      goto LABEL_16;
    }

    return 22LL;
  }

  uint64_t v8 = 22LL;
  if (!a4 || !a5) {
    return v8;
  }
  uint64_t v10 = *(unsigned int *)(v6 + 4);
  LODWORD(v6) = 8 - (*(_DWORD *)(v6 + 4) & 7);
  *a4 = v7;
  *a5 = v10;
  if ((v10 & 7) != 0) {
    unint64_t v6 = v6;
  }
  else {
    unint64_t v6 = 0LL;
  }
  uint64_t v11 = v10 + v6 + 8;
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
LABEL_16:
  v12 = (char *)(v6 + v11);
  if ((v11 & 7) != 0) {
    sb_packbuff_unpack_item_cold_1();
  }
  uint64_t v8 = 0LL;
  a1[6] = v12;
  return v8;
}

unsigned __int16 *sb_packbuff_unpack_string(void *a1, void *a2, int *a3)
{
  int v9 = 0;
  uint64_t v8 = 0LL;
  int v5 = sb_packbuff_unpack_item(a1, 2, 0LL, &v8, &v9);
  if (!v5)
  {
    if (v9 && (uint64_t v6 = (v9 - 1), !*((_BYTE *)v8 + v6)))
    {
      int v5 = 0;
      if (a2) {
        *a2 = v6;
      }
    }

    else
    {
      int v5 = 22;
    }
  }

  if (a3) {
    *a3 = v5;
  }
  return v8;
}

uint64_t sb_packbuff_pack_uint32(void *a1, __int16 a2, int a3)
{
  return sb_packbuff_pack_item(a1, 1u, a2, a3, 0LL, 0LL);
}

uint64_t sb_packbuff_pack_item(void *a1, unsigned int a2, __int16 a3, int a4, void *__src, size_t __n)
{
  unsigned int v6 = __n;
  unint64_t v12 = 8LL;
  if ((_DWORD)__n)
  {
    if ((__n & 7) != 0) {
      unsigned int v13 = 8 - (__n & 7);
    }
    else {
      unsigned int v13 = 0;
    }
    uint64_t result = 34LL;
    unsigned int v15 = __n + v13;
    if (__CFADD__((_DWORD)__n, v13) || v15 > 0xFFFFFFF7) {
      return result;
    }
    unint64_t v12 = v15 + 8;
  }

  else
  {
    unsigned int v15 = 0;
    unsigned int v13 = 0;
  }

  if (a1[3] >= v12 || (uint64_t result = sb_packbuff_realloc((uint64_t)a1, v12), !(_DWORD)result))
  {
    uint64_t v16 = a1[6];
    *(_WORD *)uint64_t v16 = a2;
    *(_WORD *)(v16 + 2) = a3;
    if (a2 - 2 < 2)
    {
      if (!__src) {
        sb_packbuff_pack_item_cold_2();
      }
      *(_DWORD *)(v16 + 4) = v6;
      v17 = (char *)(a1[6] + 8LL);
      memcpy(v17, __src, v6);
      if (v13) {
        bzero(&v17[v6], v13);
      }
      goto LABEL_18;
    }

    if (a2 <= 1)
    {
      if (v15) {
        sb_packbuff_pack_item_cold_1();
      }
      *(_DWORD *)(v16 + 4) = a4;
LABEL_18:
      uint64_t result = 0LL;
      unint64_t v18 = a1[4] + v12;
      a1[3] -= v12;
      a1[4] = v18;
      v19 = (void *)(a1[6] + v12);
      a1[6] = v19;
      void *v19 = 0LL;
      return result;
    }

    return 22LL;
  }

  return result;
}

uint64_t sb_packbuff_pack_string(void *a1, __int16 a2, void *__src, unint64_t a4)
{
  if (a4 > 0xFFFFFFFE || *((_BYTE *)__src + a4)) {
    return 22LL;
  }
  else {
    return sb_packbuff_pack_item(a1, 2u, a2, 0, __src, (a4 + 1));
  }
}

void sub_188848E90( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

LABEL_9:
  }

  v4->_enabled = v3;
  objc_sync_exit(v4);
}

  return v16;
}

  return v11;
}

    v17 = 0LL;
    unint64_t v18 = 0LL;
    goto LABEL_10;
  }

  v17 = v28;
  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v30 = v5;
    v31 = 2048;
    *(void *)v32 = v17;
    *(_WORD *)&v32[8] = 2048;
    *(void *)&v32[10] = v18;
    _os_log_impl( &dword_188846000,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}s]: descendants: %llu, total size: %llu, using fallback",  buf,  0x20u);
  }

  return v10;
}

  unsigned int v15 = v24;

  return v15;
}
}

  return self;
}

  return v20;
}

  return v13;
}

  return v9;
}

    uint64_t v16 = 0LL;
    v17 = 0LL;
    unint64_t v18 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_71;
  }

  uint64_t v10 = v9;
  [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  unint64_t v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0LL;
  }

  if (!v13)
  {
    v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [v10 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 path];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = (uint64_t)v63;
      v70 = 2112;
      v71 = v64;
      _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Invalid update info Identifier: %@ at %@",  buf,  0x16u);
    }

    goto LABEL_44;
  }

  [v10 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v21 = v20;
  }
  else {
    v21 = 0LL;
  }

  if (v21)
  {
    v23 = 0LL;
    goto LABEL_21;
  }

  [v10 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [v24 unsignedLongLongValue];

  if ((unint64_t)(v23 - 1) >= 0xE)
  {
    v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      [v7 path];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v69 = v23;
      v70 = 2112;
      v71 = v65;
      _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Invalid update info container class: %ld at %@",  buf,  0x16u);
    }

LABEL_44:
    uint64_t v16 = 0LL;
    v17 = 0LL;
LABEL_70:
    unint64_t v18 = 0LL;
    goto LABEL_71;
  }

  return v4;
}

  return v6;
}

  return v16;
}

  _Block_object_dispose(&v26, 8);
  return v16;
}

void sub_188848FBC(_Unwind_Exception *a1)
{
}

LABEL_35:
  unsigned int v6 = v14;
  if (v14)
  {
LABEL_36:
    v19 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultOperationDelete), "initWithError:", v6);
    v20 = 0;
    goto LABEL_55;
  }

LABEL_36:
  if (-[MCMError category](v19, "category") != 1 || -[MCMError POSIXerrno](v19, "POSIXerrno") != 2)
  {
    container_log_handle_for_category();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      [v12 path];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = v45;
      v76 = 2112;
      v77 = v19;
      _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to read container metadata [%@]: %@",  buf,  0x16u);
    }
  }

  if (a8)
  {
    v19 = v19;
    unsigned int v15 = 0LL;
    *a8 = v19;
  }

  else
  {
    unsigned int v15 = 0LL;
  }

              v36 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( v32,  "initWithCodeSigningInfo:andDataContainerClass:",  v30,  v33);
              v37 = -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
              [v15 identifier];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v25;
              v39 = [v37 addCodeSigningEntry:v36 withIdentifier:v38 error:&v52];
              v35 = v52;

              uint64_t v8 = v44;
              if ((v39 & 1) == 0)
              {
                container_log_handle_for_category();
                v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  [v15 identifier];
                  v41 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v43;
                  v56 = v41;
                  v57 = 2112;
                  v58 = v35;
                  _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Failed to write migrated cached cs info from bundle container to DB for %@ : %@",  buf,  0x16u);
                }
              }

              self = v45;
              a4 = v46;
LABEL_40:
              v17 = v50;
              v14 = v51;

              uint64_t v11 = v47;
              goto LABEL_41;
            }

            container_log_handle_for_category();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_30:
              v35 = v25;
              goto LABEL_40;
            }

            [v15 identifier];
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v43;
            v56 = v34;
            v57 = 2112;
            v58 = v25;
            _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
          }

          goto LABEL_30;
        }

        container_log_handle_for_category();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v56 = "-[MCMCodeSigningMapping _onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainers"
                "Legacy:containerClass:]";
          v57 = 2112;
          v58 = v13;
          v59 = 2112;
          v60 = v17;
          _os_log_error_impl( &dword_188846000,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "%s: Could not fetch metadata for %@; error = %@",
            buf,
            0x20u);
        }

LABEL_45:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  int v9 = v9;
  v25 = [v9 countByEnumeratingWithState:&v57 objects:v56 count:16];
  if (v25)
  {
    v26 = *(void *)v58;
    do
    {
      for (i = 0LL; i != v25; ++i)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v9);
        }
        v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        [v28 containerPath];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 addObject:v29];

        [v28 containerIdentity];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 addObject:v30];
      }

      v25 = [v9 countByEnumeratingWithState:&v57 objects:v56 count:16];
    }

    while (v25);
  }

  v31 = objc_alloc(&OBJC_CLASS___MCMResultOperationDelete);
  v32 = -[MCMCommand context](self, "context");
  [v32 clientIdentity];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MCMResultWithContainersArrayBase initWithContainerPaths:containerIdentities:includePath:clientIdentity:skipSandboxExtensions:]( v31,  "initWithContainerPaths:containerIdentities:includePath:clientIdentity:skipSandboxExtensions:",  v23,  v24,  1LL,  v33,  1LL);

  -[MCMCommandOperationDelete _relayContainerIdentities:andAmendResult:]( self,  "_relayContainerIdentities:andAmendResult:",  v47,  v34);
  v35 = objc_alloc(&OBJC_CLASS___MCMResultPromise);
  v49[0] = MEMORY[0x1895F87A8];
  v49[1] = 3221225472LL;
  v49[2] = __36__MCMCommandOperationDelete_execute__block_invoke;
  v49[3] = &unk_18A29C8B0;
  v49[4] = self;
  v19 = v34;
  v50 = v19;
  v36 = -[MCMResultPromise initWithCompletion:](v35, "initWithCompletion:", v49);
  v37 = objc_alloc(&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace);
  v38 = -[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim");
  v39 = -[MCMCommand context](self, "context");
  v40 = -[MCMCommand reply](self, "reply");
  v41 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:handoffForReply:]( v37,  "initWithAsynchronously:context:resultPromise:handoffForReply:",  !v38,  v39,  v36,  v40);

  container_log_handle_for_category();
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v45 = [(id)objc_opt_class() command];
    *(_DWORD *)buf = 134218240;
    v62 = v41;
    v63 = 2048;
    v64 = v45;
    _os_log_debug_impl( &dword_188846000,  v42,  OS_LOG_TYPE_DEBUG,  "Completed delete, executing command <%p; %llu>...",
      buf,
      0x16u);
  }

  -[MCMCommandOperationReclaimDiskSpace execute](v41, "execute");
  unsigned int v6 = 0LL;
  v20 = 1;
LABEL_55:
  v43 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  [v43 waitOnLock:11];

  if (!v20 || !-[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim"))
  {
    v44 = -[MCMCommand resultPromise](self, "resultPromise");
    [v44 completeWithResult:v19];
  }

  objc_autoreleasePoolPop(context);
}

          goto LABEL_46;
        }

void sub_18884ACFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  if (a12) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_18884AD4C(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x18884AD50LL);
  }
  objc_terminate();
  -[MCMCommandOperationDelete _relayContainerIdentities:andAmendResult:](v2, v3, v4, v5);
}

LABEL_29:
  v37 = (void *)[v12 copy];
  return v37;
}

  return v24;
}

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

  v36 = self;
  MEMORY[0x1895CDD90](v17);
  if (v71)
  {
    v37 = objc_alloc(&OBJC_CLASS___MCMError);
    v38 = -[MCMError initWithLibsystemError:](v37, "initWithLibsystemError:", v71);

    container_error_free();
    v27 = (MCMError *)v38;
  }

  if (v70)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      free(v70);
      memset_s(&v70, 8uLL, 0, 8uLL);
    }
  }

  else
  {
    v39 = 0LL;
  }

  container_log_handle_for_category();
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v73 = v19;
    v74 = 2048;
    v75 = v32;
    v76 = 2112;
    v77 = v27;
    _os_log_impl( &dword_188846000,  v40,  OS_LOG_TYPE_DEFAULT,  "Container from path result: %@(%llu), error = %@",  buf,  0x20u);
  }

  v41 = objc_alloc(&OBJC_CLASS___MCMResultContainerFromPath);
  if (v35)
  {
    LOBYTE(v60) = v31;
    v42 = v32;
    v44 = v62;
    v43 = v63;
    LOBYTE(v59) = 1;
    v45 = v66;
    v46 = -[MCMResultContainerFromPath initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:relativePath:]( v41,  "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:ex isted:url:info:transient:userManagedAssetsRelPath:creator:relativePath:",  v62,  v24,  v19,  v42,  v66,  v26,  0LL,  v59,  v63,  0LL,  v60,  0LL,  0LL,  v39);
  }

  else
  {
    v46 = -[MCMResultBase initWithError:](v41, "initWithError:", v27);
    v45 = v66;
    v44 = v62;
    v43 = v63;
  }
  v47 = -[MCMCommand resultPromise](v36, "resultPromise");
  [v47 completeWithResult:v46];

  objc_autoreleasePoolPop(context);
}
}

LABEL_11:
  return v6;
}

  return v16;
}

  return v18;
}

  return v13;
}

  return v20;
}

  return v11;
}

  return v13;
}

  if (!*(_BYTE *)(a1 + 64) || *(_WORD *)(a2 + 86))
  {
    if (lchmod(*(const char **)(a2 + 48), 0) == -1)
    {
      container_log_handle_for_category();
      unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a2 + 48);
        v17 = __error();
        unint64_t v18 = strerror(*v17);
        v22 = 136315394;
        v23 = v16;
        v24 = 2080;
        v25 = v18;
        _os_log_error_impl(&dword_188846000, v6, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", (uint8_t *)&v22, 0x16u);
      }
    }

    if (lchown(*(const char **)(a2 + 48), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60)) == -1)
    {
      container_log_handle_for_category();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v19 = *(void *)(a2 + 48);
        v20 = __error();
        v21 = strerror(*v20);
        v22 = 136315394;
        v23 = v19;
        v24 = 2080;
        v25 = v21;
        _os_log_error_impl(&dword_188846000, v7, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", (uint8_t *)&v22, 0x16u);
      }
    }
  }

  return 1LL;
}

  return v6;
}

  return v8;
}

    goto LABEL_12;
  }
  v32 = -[MCMCommand context](self, "context");
  v33 = [v32 clientIdentity];
  [(id)v33 codeSignInfo];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 entitlements];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 systemGroupIdentifiers];
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  [v13 identifier];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v36;
  LOBYTE(v33) = [v36 containsObject:v37];

  if ((v33 & 1) == 0)
  {
    unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 55LL);
    container_log_handle_for_category();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v73 = -[MCMCommand context](self, "context");
      [v73 clientIdentity];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 identifier];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v74;
      v93 = 2112;
      v94 = (uint64_t)v75;
      _os_log_error_impl( &dword_188846000,  v62,  OS_LOG_TYPE_ERROR,  "%@ not entitled for system group container %@",  buf,  0x16u);
    }

    v22 = 0LL;
    v23 = 0LL;
    goto LABEL_13;
  }
  v38 = -[MCMCommand context](self, "context");
  [v38 containerCache];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0LL;
  [v39 entryForContainerIdentity:v13 error:&v89];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (MCMError *)v89;

  v83 = v40;
  [v40 metadataMinimal];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);

    container_log_handle_for_category();
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      [v13 identifier];
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v76;
      v93 = 2112;
      v94 = (uint64_t)v18;
      _os_log_error_impl( &dword_188846000,  v63,  OS_LOG_TYPE_ERROR,  "System group container with identifier %@ not found: %@",  buf,  0x16u);
    }

    v22 = 0LL;
    v23 = 0LL;
    v24 = 0LL;
    v25 = 0LL;
    goto LABEL_14;
  }

  v25 = v42;
  v80 = v41;
  [v42 containerPath];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 containerDataURL];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
  [v44 URLByAppendingPathComponent:v45 isDirectory:0];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  [v25 containerPath];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v46 containerDataURL];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
  [v47 URLByAppendingPathComponent:v48 isDirectory:0];
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v49 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  [v25 containerPath];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 containerDataURL];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 realPathForURL:v23 ifChildOfURL:v51];
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR))
    {
LABEL_37:

      v24 = 0LL;
      goto LABEL_14;
    }

    [v13 identifier];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 containerPath];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 containerDataURL];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v92 = v23;
    v93 = 2112;
    v94 = (uint64_t)v67;
    v95 = 2112;
    v96 = (uint64_t)v68;
    v69 = "Invalid source URL %@ for %@ at %@";
LABEL_43:
    _os_log_error_impl(&dword_188846000, (os_log_t)v66, OS_LOG_TYPE_ERROR, v69, buf, 0x20u);

    goto LABEL_37;
  }
  v53 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  [v25 containerPath];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 containerDataURL];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 realPathForURL:v22 ifChildOfURL:v55];
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
  {
    unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    [v13 identifier];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 containerPath];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 containerDataURL];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v92 = v22;
    v93 = 2112;
    v94 = (uint64_t)v67;
    v95 = 2112;
    v96 = (uint64_t)v68;
    v69 = "Invalid dest URL %@ for %@ at %@";
    goto LABEL_43;
  }
  v57 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v88 = 0LL;
  v58 = [v57 standardizeACLsAtURL:v23 isSystemContainer:0 error:&v88];
  v26 = v88;

  if ((v58 & 1) == 0)
  {
    unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 63LL);

    container_log_handle_for_category();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    [v13 identifier];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = [v23 path];
    *(_DWORD *)buf = 138412802;
    v92 = v82;
    v93 = 2112;
    v94 = v71;
    v72 = (void *)v71;
    v95 = 2112;
    v96 = (uint64_t)v26;
    _os_log_error_impl( &dword_188846000,  v70,  OS_LOG_TYPE_ERROR,  "Failed to standardize ACLs for %@ at %@: %@",  buf,  0x20u);

LABEL_45:
    goto LABEL_41;
  }
  v59 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v87 = v26;
  v60 = [v59 moveItemAtURL:v23 toURL:v22 error:&v87];
  v61 = v87;

  if ((v60 & 1) != 0)
  {
    v22 = v22;
    v24 = v22;
    v26 = v61;
    unint64_t v18 = v80;
    goto LABEL_15;
  }

  v26 = v61;
  unint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 64LL);

  container_log_handle_for_category();
  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    [v13 identifier];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 path];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = [v22 path];
    *(_DWORD *)buf = 138413058;
    v92 = v82;
    v93 = 2112;
    v94 = (uint64_t)v79;
    v95 = 2112;
    v96 = v77;
    v78 = (void *)v77;
    v97 = 2112;
    v98 = v26;
    _os_log_error_impl(&dword_188846000, v70, OS_LOG_TYPE_ERROR, "Failed move for %@ from %@ to: %@: %@", buf, 0x2Au);

    goto LABEL_45;
  }

  return v9;
}

  return v13;
}

  if (!v22) {
    *a5 = v27[0];
  }
LABEL_13:
  v24 = v22;

  return v24;
}

    id v5 = 1;
LABEL_12:

    goto LABEL_9;
  }

  container_log_handle_for_category();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v17 = 136446466;
    unint64_t v18 = "-[MCMEntitlements isAllowedToLookupContainerIdentity:]";
    v19 = 1024;
    v20 = 227;
    _os_log_fault_impl( &dword_188846000,  v6,  OS_LOG_TYPE_FAULT,  "Invalid nil parameter passed to %{public}s; %d",
      (uint8_t *)&v17,
      0x12u);
  }

  id v5 = 0;
LABEL_9:

  return v5;
}

    uint64_t v16 = [MEMORY[0x189604010] setWithArray:v11];
  }

  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      container_log_handle_for_category();
      unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        v17 = 0LL;
        goto LABEL_20;
      }

      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v7;
      v19 = "Entitlement %@ for %@ does not contain supported types; ignoring.";
LABEL_22:
      _os_log_error_impl(&dword_188846000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x16u);
      goto LABEL_18;
    }

    uint64_t v16 = [MEMORY[0x189604010] setWithObject:v9];
  }

  v17 = (void *)v16;
LABEL_20:

  return v17;
}

  log = 0LL;
  v17 = 0LL;
LABEL_12:
  container_log_handle_for_category();
  unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v103;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v144 = obj;
    _os_log_fault_impl(&dword_188846000, v18, OS_LOG_TYPE_FAULT, "Expected to find a personal persona in %@", buf, 0xCu);
  }

  v20 = 0;
LABEL_116:

  objc_autoreleasePoolPop(v19);
  return v20;
}

  unint64_t v18 = 0LL;
LABEL_20:

  return v18;
}

  return v10;
}

LABEL_13:
    if (v26 && v8)
    {
      uint64_t v8 = v8;
      *v26 = v8;
    }
  }

  else
  {

    uint64_t v8 = 0LL;
    v21 = 1;
  }

  return v21;
}

      uint64_t v10 = 0;
      goto LABEL_14;
    }

    v14 = [v12 systemContainerMode];

    int v9 = v14 - 1;
  }

  if (v9 >= 3) {
    goto LABEL_13;
  }
  uint64_t v10 = dword_188918DCC[v9];
LABEL_14:

  return v10;
}

  return v8;
}

  uint64_t result = (MCMPlistReadOnly *)_os_crash();
  __break(1u);
  return result;
}

  if (a6 && !v20) {
    *a6 = v21;
  }

  return v20;
}

    v14 = 0LL;
    goto LABEL_14;
  }

  v14 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  38LL,  3LL);
LABEL_14:
  container_log_handle_for_category();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v14;
    _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Set test locks; error = %@", (uint8_t *)&v28, 0xCu);
  }

  v17 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v14);
  if (!v14 && v10)
  {
    unint64_t v18 = v10;

    v17 = v18;
  }
  v19 = -[MCMCommand resultPromise](self, "resultPromise");
  [v19 completeWithResult:v17];

  objc_autoreleasePoolPop(v3);
}

  return v4;
}

  if (a4)
  {
    v29 = v29;
    v28 = 0LL;
    *a4 = v29;
  }

  else
  {
    v28 = 0LL;
  }

  v26 = v20;
LABEL_17:

  return v28;
}

LABEL_18:
  v42 = v26;
  v32 = [v15 removeItemAtURL:v12 error:&v42];
  v30 = v42;

  if ((v32 & 1) != 0) {
    goto LABEL_19;
  }
  container_log_handle_for_category();
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    [v12 path];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v38;
    v48 = 2112;
    v49 = v30;
    _os_log_error_impl(&dword_188846000, v35, OS_LOG_TYPE_ERROR, "Failed to delete container at %@: %@", buf, 0x16u);
  }

  v36 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v30,  v12,  28LL);
  v33 = v36;
  if (a8)
  {
    v33 = v36;
    v34 = 0;
    *a8 = v33;
  }

  else
  {
    v34 = 0;
  }

    closedir(v14);

    a4 = v31;
  }

  else
  {
    if (*__error() != 2)
    {
      container_log_handle_for_category();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = __error();
        v30 = strerror(*v29);
        v40.st_dev = 136315394;
        *(void *)&v40.st_mode = v8;
        WORD2(v40.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v30;
        _os_log_error_impl(&dword_188846000, v24, OS_LOG_TYPE_ERROR, "opendir of %s failed: %s", (uint8_t *)&v40, 0x16u);
      }
    }

    v25 = *__error();

    if (v25)
    {
      v32[0] = v9;
      v32[1] = 3221225472LL;
      v32[2] = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2;
      v32[3] = &unk_18A29CD90;
      v33 = v11;
      v34 = v25;
      __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2((uint64_t)v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0LL;
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }

  v22 = v10;
  v23 = 0LL;
  if (!a4) {
    goto LABEL_29;
  }
LABEL_27:
  if (!v22) {
    *a4 = v23;
  }
LABEL_29:
  v26 = v39;
  v27 = v22;

  return v27;
}

      v34 = 0;
LABEL_19:

LABEL_20:
      v19 = v24;
      goto LABEL_21;
    }

    v63 = v19;
    v37 = -[MCMFileManager _fixFlagsOnFD:FTSENT:stat:error:]( v57,  "_fixFlagsOnFD:FTSENT:stat:error:",  v23,  v21,  v76,  &v63);
    v24 = v63;

    if (!v37)
    {
      v34 = 0;
      goto LABEL_20;
    }

    if ((WORD2(v76[0]) & 0xF000) != 0x4000 && WORD3(v76[0]) >= 2u)
    {
      container_log_handle_for_category();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v47 = *(void *)(v21 + 48);
        *(_DWORD *)buf = 136315394;
        *(void *)v71 = v47;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = WORD3(v76[0]);
        _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "path [%s] is hardlinked [nlink: %d], skipping",  buf,  0x12u);
      }

      v34 = 1;
      goto LABEL_19;
    }

    if ((v8 & 3) != 0)
    {
      v41 = *(void *)(v21 + 48);
      v62 = v24;
      v42 = -[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]( v57,  "_fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:",  v23,  v13,  v58,  __s,  v41,  &v62);
      v19 = v62;

      if (!v42) {
        goto LABEL_45;
      }
      v24 = v19;
    }

    v61 = v24;
    v43 = -[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:]( v57,  "_fixPOSIXPermsOnFD:FTSENT:stat:error:",  v23,  v21,  v76,  &v61);
    v19 = v61;

    if (!v43)
    {
LABEL_45:
      v34 = 0;
      goto LABEL_21;
    }

    v60 = v19;
    v44 = -[MCMFileManager _fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:]( v57,  "_fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:",  v23,  v21,  v76,  v72,  v55,  v54,  &v60);
    v25 = v60;

    if (v44)
    {
      v59 = v25;
      v34 = -[MCMFileManager _fixPOSIXBitsOnFD:FTSENT:stat:error:]( v57,  "_fixPOSIXBitsOnFD:FTSENT:stat:error:",  v23,  v21,  v76,  &v59);
      v24 = v59;
      goto LABEL_19;
    }

    v34 = 0;
    v19 = v25;
LABEL_21:
    v35 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 152LL))(v23);
    v17 = MEMORY[0x1895F87A8];
    if (v35)
    {
      container_log_handle_for_category();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v38 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v71 = v38;
        _os_log_error_impl( &dword_188846000,  v36,  OS_LOG_TYPE_ERROR,  "close() failed (%{darwin.errno}d) on file descriptor.",  buf,  8u);
      }

      if ((v34 & 1) == 0)
      {
LABEL_27:
        v33 = 2;
        goto LABEL_28;
      }
    }

    else if (!v34)
    {
      goto LABEL_27;
    }

    v33 = 0;
LABEL_28:
    if ((v8 & 0x100) == 0) {
      v33 = 4;
    }
    if (v33)
    {
      if (v33 != 4)
      {
        a7 = v56;
        v48 = 0;
        goto LABEL_55;
      }

      break;
    }
  }

  v48 = 1;
  a7 = v56;
LABEL_55:
  (*(void (**)(uint64_t))(*(void *)v14 + 376LL))(v18);
LABEL_56:
  if (v58) {
    (*(void (**)(void))(*(void *)v14 + 272LL))();
  }
  if (v13) {
LABEL_59:
  }
    (*(void (**)(_filesec *))(*(void *)v14 + 272LL))(v13);
LABEL_62:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  if (a7)
  {
    v19 = v19;
    *a7 = v19;
  }

  return v48 & 1;
}

  return v21;
}

  a3 = v37;
LABEL_19:

  if (a3)
  {
    v30 = v30;
    v31 = 0;
    *a3 = v30;
  }

  else
  {
    v31 = 0;
  }

  if (!v8)
  {
    v41 = objc_alloc(&OBJC_CLASS___MCMResultQuery);
    v40 = (void *)[v6 copy];
    v42 = -[MCMCommand context](self, "context");
    [v42 clientIdentity];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCMCommandQuery issueSandboxExtensions](self, "issueSandboxExtensions");
    v38 = -[MCMCommandQuery includePathInResult](self, "includePathInResult");
    v37 = -[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult");
    v22 = v7;
    v23 = -[MCMCommandQuery legacyPersonaPolicy](self, "legacyPersonaPolicy");
    v24 = -[MCMCommandQuery legacyExtensionPolicy](self, "legacyExtensionPolicy");
    v25 = v6;
    v26 = -[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
    v27 = -[MCMCommandQuery includeCreator](self, "includeCreator");
    v28 = -[MCMCommandQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient");
    BYTE4(v36) = -[MCMCommandQuery extensionsPolicyUsesProxiedClient](self, "extensionsPolicyUsesProxiedClient");
    BYTE3(v36) = v28;
    BYTE2(v36) = v27;
    BYTE1(v36) = v26;
    unsigned int v6 = v25;
    LOBYTE(v36) = v24;
    v29 = v23;
    int v7 = v22;
    v20 = -[MCMResultQuery initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyExtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:]( v41,  "initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyE xtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:",  v40,  v21,  v39,  v38,  v37,  v29,  v36);

    goto LABEL_21;
  }

LABEL_25:
  return v34;
}

          uint64_t v8 = 0;
          goto LABEL_21;
        }
      }
    }

    else
    {
      container_log_handle_for_category();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 identifier];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = [v6 containerClass];
        [v6 identifier];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[MCMClientIdentity userIdentity](self, "userIdentity");
        [v6 userIdentity];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544386;
        v29 = v19;
        v30 = 2048;
        v31 = v20;
        v32 = 2114;
        v33 = v21;
        v34 = 2114;
        v35 = v22;
        v36 = 2114;
        v37 = v23;
        _os_log_fault_impl( &dword_188846000,  v11,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ with ambiguous user identity (client: %{public}@ ; container: %{public}@)",
          (uint8_t *)&v28,
          0x34u);
      }

      if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
      }
      if (!MCMRequirePersonaTelemetryOnly_result)
      {
        if (a4)
        {
          unint64_t v12 = 115LL;
LABEL_24:
          uint64_t v8 = 0;
          *a4 = v12;
          goto LABEL_21;
        }

        goto LABEL_25;
      }
    }

    goto LABEL_20;
  }

    v35 = [v12 ownerIssuedSandboxExtension];
    if (v33) {
      v27 = 1;
    }
    else {
      v27 = v35;
    }
    goto LABEL_29;
  }

  v27 = 1;
  unint64_t v12 = v40;
LABEL_29:
  -[MCMFileHandle close](v19, "close");
  v31 = 0LL;
  if (a6) {
    *a6 = v27;
  }
  v32 = 1;
  v21 = (__CFString *)v39;
LABEL_32:

  return v32;
}

  if (a4 && !v24) {
    *a4 = v23;
  }

  return v24;
}

  return v42;
}

  v31 = v29;

  return v31;
}

        if (!-[MCMEntitlements isEntitledForLookupWithClass:identifier:]( self,  "isEntitledForLookupWithClass:identifier:",  v9,  v8))
        {
          +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          id v5 = [v16 isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:v10 forContainerClass:v9 containerIdentifier:v8];

          goto LABEL_12;
        }
      }
    }

    else
    {
      if (([v8 isEqualToString:v10] & 1) == 0) {
        goto LABEL_25;
      }
      if (v9 == 10)
      {
        unsigned int v13 = -[MCMEntitlements hasDaemonContainer](self, "hasDaemonContainer");
        goto LABEL_24;
      }
    }

    v25 = 0LL;
    v23 = 0LL;
    v26 = 0LL;
    v28 = 0LL;
    v24 = v12;
    goto LABEL_26;
  }

  v23 = (void *)v22;
  v24 = +[MCMContainerPath containerPathForContainerIdentity:containerPathIdentifier:]( &OBJC_CLASS___MCMContainerPath,  "containerPathForContainerIdentity:containerPathIdentifier:",  v22,  v45);
  if (v24)
  {
    v25 = -[MCMContainerCacheEntry _findUserManagedAssetsDirectoryAtContainerRootURL:]( self,  "_findUserManagedAssetsDirectoryAtContainerRootURL:",  v46);
    v26 = -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:]( objc_alloc(&OBJC_CLASS___MCMMetadata),  "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:crea tor:userIdentityCache:",  v23,  0LL,  v24,  v25,  v41,  0xFFFFFFFFLL,  0LL,  v42);
    v47 = 0LL;
    v27 = -[MCMMetadata writeMetadataToDiskWithError:](v26, "writeMetadataToDiskWithError:", &v47);
    v28 = v47;
    if (v27)
    {
      container_log_handle_for_category();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        v51 = 2112;
        v52 = (uint64_t)v13;
        v53 = 2048;
        v54 = v17;
        _os_log_impl(&dword_188846000, v29, OS_LOG_TYPE_DEFAULT, "Fabricated metadata for [%@:%@(%llu)]", buf, 0x20u);
      }
    }

    else
    {
      container_log_handle_for_category();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        v51 = 2048;
        v52 = v17;
        v53 = 2112;
        v54 = (uint64_t)v28;
        _os_log_impl( &dword_188846000,  v34,  OS_LOG_TYPE_DEFAULT,  "Unable to write generated metadata for [%@(%llu)]: error = %@",  buf,  0x20u);
      }

      v29 = (os_log_s *)v26;
      v26 = 0LL;
    }
  }

  else
  {
    container_log_handle_for_category();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v23;
      v51 = 2112;
      v52 = (uint64_t)v45;
      _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Could not construct containerPath; identity = %@, containerPathIdentifier = %@",
        buf,
        0x16u);
    }

    v25 = 0LL;
    v26 = 0LL;
    v28 = 0LL;
    v24 = 0LL;
  }

void sub_18884E8F4(_Unwind_Exception *exception_object)
{
}

LABEL_21:
  return v8;
}

    v25 = 0;
    goto LABEL_22;
  }

  v29 = 0LL;
  v17 = -[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:error:",  v12,  v14,  1LL,  &v29);
  unint64_t v18 = v29;
  v19 = v18;
  if (!v17)
  {
    v21 = v18;
    if (a6) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  v28 = v18;
  v20 = -[MCMFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v12, &v28);
  v21 = v28;

  if (!v20)
  {
    container_log_handle_for_category();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [v12 path];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32.st_dev = 138412546;
      *(void *)&v32.st_mode = v27;
      WORD2(v32.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v32.st_ino + 6) = (__darwin_ino64_t)v21;
      _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Failed to remove move source after copy at %@ : %@",  (uint8_t *)&v32,  0x16u);
    }
  }

  v23 = "(using copy-delete) ";
LABEL_14:
  container_log_handle_for_category();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v32.st_dev = 136315650;
    *(void *)&v32.st_mode = v23;
    WORD2(v32.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v32.st_ino + 6) = (__darwin_ino64_t)v13;
    HIWORD(v32.st_gid) = 2080;
    *(void *)&v32.st_rdev = v15;
    _os_log_impl(&dword_188846000, v24, OS_LOG_TYPE_INFO, "Moved %s[%s] → [%s].", (uint8_t *)&v32, 0x20u);
  }

  v25 = 1;
LABEL_22:

  return v25;
}

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v30;
}

  v27 = v25;

  return v27;
}

    goto LABEL_22;
  }

  uint64_t v16 = v13;
LABEL_23:
  v27 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v14);
  v28 = -[MCMCommand resultPromise](self, "resultPromise");
  [v28 completeWithResult:v27];

  objc_autoreleasePoolPop(v3);
}

  if (v37)
  {
    uint64_t v16 = v16;
    v20 = 0;
    *v37 = v16;
  }

  else
  {
    v20 = 0;
  }

  if (!+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  v23))
  {
    uint64_t v16 = 0LL;
    v17 = 0LL;
    goto LABEL_29;
  }

  v67 = 1LL;
  [v10 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v17 = v26;
  }
  else {
    v17 = 0LL;
  }

  if (!v17)
  {
    [v10 objectForKeyedSubscript:@"MCMDataOperationUserId"];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v43 = v42;
    }
    else {
      v43 = 0LL;
    }

    if (!v43)
    {
      v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
      container_log_handle_for_category();
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        [v10 objectForKeyedSubscript:@"MCMDataOperationUserId"];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 path];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v69 = (uint64_t)v53;
        v70 = 2112;
        v71 = v54;
        v55 = "Invalid update info user id: %@ at %@";
        v56 = v52;
        v57 = 22;
        goto LABEL_83;
      }

  return v12;
}

  return v24;
}

  v20 = a5;
  if ((explicitFlags & 4) == 0)
  {
    if ((explicitFlags & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v10,  "nsObjectFromXPCObject:key:error:",  v8,  "GroupIdentifiers",  &v79);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v79 != 1) {
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v79 = 110LL;
    goto LABEL_45;
  }

  v71 = v9;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v21 = v21;
  v29 = [v21 countByEnumeratingWithState:&v90 objects:v89 count:16];
  if (v29)
  {
    v30 = v29;
    v31 = *(void *)v91;
LABEL_34:
    v32 = 0LL;
    while (1)
    {
      if (*(void *)v91 != v31) {
        objc_enumerationMutation(v21);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v30 == ++v32)
      {
        v30 = [v21 countByEnumeratingWithState:&v90 objects:v89 count:16];
        if (v30) {
          goto LABEL_34;
        }
        goto LABEL_40;
      }
    }

LABEL_2:
  v17 = 0LL;
  v26 = 1;
LABEL_3:
  if (a6) {
    *a6 = v26;
  }
  unint64_t v18 = 1;
LABEL_15:

  return v18;
}

LABEL_10:
  return v21;
}

  return v21;
}
}
}

  return v9;
}

  container_log_handle_for_category();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138478339;
    v30 = (uint64_t)v4;
    v31 = 2050;
    *(void *)v32 = v17;
    *(_WORD *)&v32[8] = 2049;
    *(void *)&v32[10] = v18;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v20,  OS_SIGNPOST_INTERVAL_END,  v7,  "CalculatingDiskUsage",  " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu  size=%{p rivate, signpost.description:attribute}llu ",  buf,  0x20u);
  }

  v21 = v18;
  v22 = v17;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}
  }

  return v5;
}

        goto LABEL_11;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Could not load runtime state to restore; error = %@",
        buf,
        0xCu);
    }

    goto LABEL_10;
  }

  -[MCMRuntimeState _restoreFromPlist:](self, "_restoreFromPlist:", v7);
LABEL_11:

  objc_autoreleasePoolPop(v3);
}

  return v5;
}

  objc_msgSend( (id)objc_opt_class(),  "_identifierForPOSIXUID:personaUniqueString:personaType:",  objc_msgSend(v13, "UID"),  v15,  v8);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___MCMUserIdentity;
    v19 = -[MCMUserIdentity init](&v24, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_posixUser, a3);
      objc_storeStrong((id *)&v20->_personaUniqueString, a5);
      v20->_personaType = v8;
      objc_storeStrong((id *)&v20->_identifier, v18);
      objc_storeStrong((id *)&v20->_homeDirectoryURL, a4);
      v20->_kernelPersonaID = a7;
      v20->_extensionHandle = -1LL;
    }

    self = v20;
    v21 = self;
  }

  else
  {
    container_log_handle_for_category();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_fault_impl(&dword_188846000, v22, OS_LOG_TYPE_FAULT, "Computed nil identifier, user '%@'", buf, 0xCu);
    }

    v21 = 0LL;
  }

  return v21;
}

  return v13;
}

  v17 = v15;

  return v17;
}

  return v13;
}

  return v9;
}

  return v16;
}

  return v7;
}
}

  return v6;
}

LABEL_22:
  v24 = 11LL;
LABEL_23:

LABEL_24:
  v19 = 0LL;
  if (a8) {
    *a8 = v24;
  }
LABEL_26:

  return v19;
}

  v22 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( v19,  "initWithCodeSigningInfo:andDataContainerClass:",  v17,  v20);
  v23 = -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v26 = v13;
  v24 = [v23 addCodeSigningEntry:v22 withIdentifier:v9 error:&v26];
  v21 = v26;

  if ((v24 & 1) == 0)
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v21;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to write migrated cached cs info from bundle container to DB for %@ : %@",  buf,  0x16u);
    }
  }

LABEL_27:
}

LABEL_26:
    unsigned int v15 = 0LL;
LABEL_27:
    v19 = 0LL;
    v20 = 75LL;
    v17 = v8;
LABEL_28:
    unint64_t v18 = (void *)v34;
    goto LABEL_29;
  }

  unsigned int v15 = (void *)v14;
  if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"type";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      v32 = *(id *)v38;
      _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected number for %@, got %@. Data: %@",  buf,  0x20u);
    }

    goto LABEL_27;
  }

  uint64_t v16 = [v35 unsignedIntegerValue];
  if (v16 >= 4)
  {
    container_log_handle_for_category();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"type";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = v35;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl( &dword_188846000,  v31,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected persona type for %@, got %@. Data: %@",  buf,  0x20u);
    }

    v19 = 0LL;
    v20 = 75LL;
    goto LABEL_28;
  }

  v17 = v8;
  unint64_t v18 = (void *)v34;
  if (!v34 || v16 != 1)
  {
    [v8 userIdentityForPersonalPersonaWithPOSIXUser:v15];
    v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
    v20 = 1LL;
    if (!a5) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }

  [v8 userIdentityForPersonaUniqueString:v34 POSIXUser:v15];
  v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  if (MCMPersonasAreSupported_onceToken != -1) {
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8246);
  }
  v20 = 1LL;
  if (!MCMPersonasAreSupported_staticPersonasSupported || !v19)
  {
LABEL_29:
    if (!a5) {
      goto LABEL_32;
    }
LABEL_30:
    if (!v19) {
      *a5 = v20;
    }
    goto LABEL_32;
  }

  if (-[MCMUserIdentity isDataSeparated](v19, "isDataSeparated"))
  {
LABEL_32:
    v24 = self;
    goto LABEL_33;
  }

  v21 = containermanager_copy_global_configuration();
  v22 = [v21 dispositionForContainerClass:2];

  if (v22 == 1)
  {
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v24 = self;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = v34;
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected %@ to be data separated, but it was not: %@; Data: %@",
        buf,
        0x20u);
    }

    unint64_t v18 = (void *)v34;
  }

  else
  {
    v24 = self;
    unint64_t v18 = (void *)v34;
  }

  return v35;
}

      unsigned int v13 = v9;
      goto LABEL_23;
    }

  return v31;
}

  if (a5 && !v21) {
    *a5 = v22;
  }

  return v21;
}

      uint64_t v11 = 0;
LABEL_23:

      goto LABEL_24;
    }

    uint64_t v11 = 0;
  }

    unint64_t v12 = 0;
LABEL_31:

    goto LABEL_32;
  }

  unint64_t v12 = 0;
LABEL_32:

  return v12;
}

LABEL_6:
  return v6;
}

  int v7 = (void *)[v6 copy];

  return v7;
}

  if (a4) {
    *a4 = v13;
  }

  return 0LL;
}

  container_client_get_audit_token();
  persona_unique_string = container_client_get_persona_unique_string();
  if (persona_unique_string)
  {
    [NSString stringWithUTF8String:persona_unique_string];
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v15 = 0LL;
  }

  if (container_client_is_test_client())
  {
    v29 = 0LL;
    v21 = -[MCMClientFactory _clientIdentityWithClient:proximateClient:error:]( self,  "_clientIdentityWithClient:proximateClient:error:",  v11,  v8,  &v29);
    uint64_t v16 = (MCMError *)v29;
  }

  else
  {
    v24 = -[MCMClientFactory clientIdentityCache](self, "clientIdentityCache");
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v32, 0, sizeof(v32));
    }
    v28 = 0LL;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke;
    v25[3] = &unk_18A29D340;
    v25[4] = self;
    v27 = v11;
    v26 = v8;
    v31[0] = *(_OWORD *)buf;
    v31[1] = v34;
    [v24 clientIdentityWithAuditToken:v31 proximateAuditToken:v32 personaUniqueString:v15 error:&v28 generator:v25];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (MCMError *)v28;
  }

  container_free_client();

  if (a5)
  {
LABEL_15:
    if (!v21) {
      *a5 = v16;
    }
  }

  return v5;
}

  -[MCMCommandSetTestLock message](self, "message");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMCommand relayToPrivilegedDaemonMessage:context:]( &OBJC_CLASS___MCMCommand,  "relayToPrivilegedDaemonMessage:context:",  v8,  v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  uint64_t v11 = -[MCMCommandSetTestLock requestedLocks](self, "requestedLocks");
  unint64_t v12 = -[MCMCommandSetTestLock enable](self, "enable");
  if (v11 == 15 && !v12)
  {
    +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setEnabled:0];

    v14 = 0LL;
    execute_gLocksEnabled = 0LL;
    goto LABEL_14;
  }

  if (v11 < 0xF)
  {
    v22 = (1 << v11);
    v23 = execute_gLocksEnabled & v22;
    if (v12)
    {
      if (!v23)
      {
        execute_gLocksEnabled |= v22;
        v24 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
        [v24 setEnabled:1];
        v25 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
        [v25 acquireLock:v11];
      }
    }

    else if (v23)
    {
      if (v11 < 2) {
        v22 |= 3uLL;
      }
      execute_gLocksEnabled &= ~v22;
      v26 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
      [v26 releaseLock:v11];

      if (!execute_gLocksEnabled)
      {
        v27 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
        [v27 setEnabled:0];
      }
    }

  uint64_t v10 = 0LL;
LABEL_10:

  return v10;
}

  -[MCMUserIdentityCache setPreviousUserIdentities:](self, "setPreviousUserIdentities:", v13);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v8;
  v41 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
  if (v41)
  {
    v38 = *(void *)v61;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v61 != v38)
        {
          v17 = v16;
          objc_enumerationMutation(obj);
          uint64_t v16 = v17;
        }

        v42 = v16;
        unint64_t v18 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v19 = v39;
        v20 = [v19 countByEnumeratingWithState:&v55 objects:v54 count:16];
        if (v20)
        {
          v21 = *(void *)v56;
          do
          {
            for (i = 0LL; i != v20; ++i)
            {
              if (*(void *)v56 != v21) {
                objc_enumerationMutation(v19);
              }
              v23 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              container_log_handle_for_category();
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                v50 = 2112;
                v51 = v26;
                v52 = 2112;
                v53 = v23;
                _os_log_impl( &dword_188846000,  v24,  OS_LOG_TYPE_DEFAULT,  "Notifying observer <0x%p; %@> about an invalid user identity: %@",
                  buf,
                  0x20u);
              }

              [v18 userIdentityCache:self didInvalidateUserIdentity:v23];
            }

            v20 = [v19 countByEnumeratingWithState:&v55 objects:v54 count:16];
          }

          while (v20);
        }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v27 = v40;
        v28 = [v27 countByEnumeratingWithState:&v44 objects:v43 count:16];
        if (v28)
        {
          v29 = *(void *)v45;
          do
          {
            for (j = 0LL; j != v28; ++j)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              container_log_handle_for_category();
              v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (objc_class *)objc_opt_class();
                NSStringFromClass(v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                v50 = 2112;
                v51 = v34;
                v52 = 2112;
                v53 = v31;
                _os_log_impl( &dword_188846000,  v32,  OS_LOG_TYPE_DEFAULT,  "Notifying observer <0x%p; %@> about a new user identity: %@",
                  buf,
                  0x20u);
              }

              [v18 userIdentityCache:self didAddUserIdentity:v31];
            }

            v28 = [v27 countByEnumeratingWithState:&v44 objects:v43 count:16];
          }

          while (v28);
        }

        uint64_t v16 = v42 + 1;
      }

      while (v42 + 1 != v41);
      v41 = [obj countByEnumeratingWithState:&v60 objects:v59 count:16];
    }

    while (v41);
  }

  objc_autoreleasePoolPop(context);
}

  return v5;
}

LABEL_17:
  v22 = v18;
  return v22;
}

  [v13 containerPath];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = [v27 containerDataURL];
  [v28 fileSystemRepresentation];
  container_object_set_path();

  if ([v13 conformsToProtocol:v16[388]])
  {
    v25 = v13;
    if (-[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath"))
    {
      v29 = -[os_log_s userManagedAssetsDirName](v25, "userManagedAssetsDirName");
      if (v29)
      {
        v30 = [@"Library" stringByAppendingPathComponent:v29];
        [v30 fileSystemRepresentation];
        container_object_set_user_managed_assets_relative_path();
      }
    }

    if (-[MCMResultQuery includeCreator](self, "includeCreator"))
    {
      v31 = -[os_log_s creator](v25, "creator");
      v32 = v31;
      if (v31)
      {
        [v31 UTF8String];
        container_object_set_creator_codesign_identifier();
      }
    }

  v22 = v21;

  return v22;
}

    v21 = v13;
    goto LABEL_27;
  }

    goto LABEL_18;
  }

  [v5 domain];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v17 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_14;
  }

  unint64_t v18 = [v6 code];

  if (v18 != 2)
  {
LABEL_14:
    container_log_handle_for_category();
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR))
    {
      [v3 path];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v20;
      v31 = 2112;
      v32 = v6;
      _os_log_error_impl( &dword_188846000,  (os_log_t)obj,  OS_LOG_TYPE_ERROR,  "Failed to read code signing mapping file at %@ : %@",  buf,  0x16u);
    }

    int v7 = 0LL;
    goto LABEL_17;
  }

  int v7 = 0LL;
LABEL_18:

  return v7;
}

  return v25;
}

                    v42 = 0;
                    goto LABEL_36;
                  }

                  container_log_handle_for_category();
                  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v74;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    v102 = 2112;
                    v103 = v25;
                    _os_log_error_impl( &dword_188846000,  v55,  OS_LOG_TYPE_ERROR,  "%s: Failed to generate new metadata for listed container %@",  buf,  0x16u);
                  }
                }

                else
                {
                  container_log_handle_for_category();
                  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  v29 = v86;
                  v33 = v84;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    [v28 containerPath];
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    [v82 containerRootURL];
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    [v76 path];
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    [v34 path];
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    [v80 domain];
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = [v80 code];
                    *(_DWORD *)buf = 136316418;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    v102 = 2112;
                    v103 = v25;
                    v104 = 2112;
                    v105 = v61;
                    v106 = 2112;
                    v107 = v62;
                    v108 = 2112;
                    v109 = v63;
                    v110 = 2048;
                    v111 = v64;
                    _os_log_error_impl( &dword_188846000,  v54,  OS_LOG_TYPE_ERROR,  "%s: Failed to move system container %@ from %@ to listed location %@: (error= %@: %lld)",  buf,  0x3Eu);

                    v29 = v86;
                    v33 = v84;
                  }
                }

                v46 = v79;
                v53 = (os_log_s *)v80;
              }

              else
              {
                container_log_handle_for_category();
                v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                unsigned int v13 = &OBJC_CLASS___MCMContainerStagingPath;
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                  v102 = 2112;
                  v103 = v25;
                  v104 = 2112;
                  v105 = v46;
                  _os_log_error_impl( &dword_188846000,  v53,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove cache for listed container %@: %@",  buf,  0x20u);
                }

                v33 = v84;
              }

              v41 = 0LL;
              v81 = 0;
              v42 = 2;
              goto LABEL_36;
            }

            v41 = 0LL;
LABEL_16:
            v24 = v88;
            goto LABEL_17;
          }
        }

  unsigned int v13 = (void *)objc_msgSend(v11, "copy", v23, v24, v25, v26);

  return v13;
}

  return v11;
}

LABEL_61:
  v45 = -[MCMClientConnection context](self, "context");
  v64 = 0LL;
  v46 = +[MCMCommandReplaceContainer recoverFromReplaceOperationsWithContext:error:]( &OBJC_CLASS___MCMCommandReplaceContainer,  "recoverFromReplaceOperationsWithContext:error:",  v45,  &v64);
  v47 = v64;

  if (!v46)
  {
    container_log_handle_for_category();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v83 = v47;
      _os_log_error_impl( &dword_188846000,  v48,  OS_LOG_TYPE_ERROR,  "Failed recovering from replace operations: %@",  buf,  0xCu);
    }
  }

  v49 = containermanager_copy_global_configuration();
  v50 = [v49 runmode];

  if (v50)
  {
    v51 = +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
    [v51 restartPendingDataProtectionOperations];
  }
}

  return v25;
}
      }

      unsigned int v13 = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
      if (!v13)
      {
LABEL_63:

        return;
      }
    }
  }

  _os_crash();
  __break(1u);
}

  return v68 & 1;
}

void sub_18885CC0C(_Unwind_Exception *a1)
{
}

void sub_18885DC24(_Unwind_Exception *a1)
{
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

void _containermanagerd_main(int a1, char *const *a2, uint64_t a3)
{
  uint64_t v138 = *MEMORY[0x1895F89C0];
  uint64_t v109 = 91LL;
  [MEMORY[0x189607870] _setFileNameLocalizationEnabled:0];
  objc_setExceptionPreprocessor((objc_exception_preprocessor)_containermanagerd_exception_preprocessor);
  _CFPrefsSetDirectModeEnabled();
  v100 = (dispatch_queue_s *)MCMSharedFastWorkloop();
  id v102 = MCMSharedSlowWorkloop();
  dispatch_queue_t v104 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.listener", 0LL, v100);
  context = (void *)MEMORY[0x1895CE3A8]();
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___MCMRuntimeState);
  -[MCMRuntimeState restore](v6, "restore");
  -[MCMRuntimeState reset](v6, "reset");
  +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = geteuid();
      _os_log_fault_impl( &dword_188846000,  v11,  OS_LOG_TYPE_FAULT,  "Could not get user details for current uid: %d",  (uint8_t *)&buf,  8u);
    }

    id v12 = 0LL;
    id v13 = 0LL;
    v14 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    int v17 = 2;
    goto LABEL_115;
  }

  if (!_containermanagerd_posix_user_has_home_dir(v7, (uint64_t)"current", &v109))
  {
    id v12 = 0LL;
    id v13 = 0LL;
    v14 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    int v17 = 2;
    goto LABEL_116;
  }

  getpid();
  int v9 = memorystatus_control();
  if (v9)
  {
    container_log_handle_for_category();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v40 = strerror(v9);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v40;
      _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Error elevating inactive jetsam priority: %{public}s",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v130 = 0x3032000000LL;
    v131 = __Block_byref_object_copy__958;
    v132 = __Block_byref_object_dispose__959;
    v133 = 0LL;
    dispatch_get_global_queue(17LL, 0LL);
    unint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v18);
    v20 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v19;

    dispatch_time_t v21 = dispatch_time(0LL, 240000000000LL);
    dispatch_source_set_timer( *(dispatch_source_t *)(*((void *)&buf + 1) + 40LL),  v21,  0xFFFFFFFFFFFFFFFFLL,  0x4A817C800uLL);
    v22 = *(dispatch_source_s **)(*((void *)&buf + 1) + 40LL);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = ___containermanagerd_main_block_invoke;
    handler[3] = &unk_18A29E028;
    handler[4] = &buf;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_activate(*(dispatch_object_t *)(*((void *)&buf + 1) + 40LL));
    _Block_object_dispose(&buf, 8);
  }

  [NSString stringWithUTF8String:a3];
  v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v97 = @"fixed";
  v98 = @"normal";
  v92 = @"root";
  v93 = @"_installd";
  v94 = @"no";
  v23 = (void *)MEMORY[0x1895FC290];
  v95 = @"global";
  v96 = @"global";
  while (1)
  {
    while (1)
    {
      while (1)
      {
        int v24 = getopt_long_only(a1, a2, "r:u:b:B:s:S:c:", (const option *)&_containermanagerd_main_opts, 0LL);
        if (v24 != 99) {
          break;
        }
        if (os_variant_has_internal_content())
        {
          [NSString stringWithUTF8String:*v23];
          v25 = v99;
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }

      if (v24 <= 106) {
        break;
      }
      if (v24 > 114)
      {
        if (v24 == 115)
        {
          [NSString stringWithUTF8String:*v23];
          v25 = v95;
          v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          if (v24 != 117)
          {
LABEL_47:
            uint64_t v109 = 148LL;
            _containermanagerd_usage();
            id v12 = 0LL;
            id v13 = 0LL;
            v14 = 0LL;
            id v15 = 0LL;
            id v16 = 0LL;
            goto LABEL_113;
          }

          [NSString stringWithUTF8String:*v23];
          v25 = v97;
          v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }

      else if (v24 == 107)
      {
        [NSString stringWithUTF8String:*v23];
        v25 = v94;
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        if (v24 != 114) {
          goto LABEL_47;
        }
        [NSString stringWithUTF8String:*v23];
        v25 = v98;
        v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

LABEL_36:
    }

    if (v24 > 82)
    {
      if (v24 != 83)
      {
        if (v24 != 98) {
          goto LABEL_47;
        }
        [NSString stringWithUTF8String:*v23];
        v25 = v96;
        v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }

      [NSString stringWithUTF8String:*v23];
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v92 = v25;
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", @"-") & 1) != 0)
      {
        v92 = 0LL;
        goto LABEL_36;
      }
    }

    else
    {
      if (v24 == -1)
      {
        v26 = objc_alloc(&OBJC_CLASS___MCMStaticConfiguration);
        v27 = +[MCMStaticConfiguration defaultPlistDirectoryURL]( &OBJC_CLASS___MCMStaticConfiguration,  "defaultPlistDirectoryURL");
        id v15 = -[MCMStaticConfiguration initFromPlistAtPathOrName:defaultPlistDirectoryURL:]( v26,  "initFromPlistAtPathOrName:defaultPlistDirectoryURL:",  v99,  v27);

        container_log_handle_for_category();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, v15);

        container_log_handle_for_category();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          LODWORD(buf) = 138477827;
          *(void *)((char *)&buf + 4) = v99;
          _os_signpost_emit_with_name_impl( &dword_188846000,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "LoadConfiguration",  " path=%{private, signpost.description:attribute}@ ",  (uint8_t *)&buf,  0xCu);
        }

        id v107 = 0LL;
        char v32 = [v15 loadWithError:&v107];
        id v16 = v107;
        container_log_handle_for_category();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v29 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
        {
          [v15 sourceFileURL];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 path];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138477827;
          *(void *)((char *)&buf + 4) = v36;
          _os_signpost_emit_with_name_impl( &dword_188846000,  v34,  OS_SIGNPOST_INTERVAL_END,  v29,  "LoadConfiguration",  " path=%{private, signpost.description:attribute}@ ",  (uint8_t *)&buf,  0xCu);
        }

        if ((v32 & 1) == 0)
        {
          id v12 = 0LL;
          id v13 = 0LL;
          v14 = 0LL;
          uint64_t v109 = [v16 type];
          goto LABEL_113;
        }

        if (-[__CFString isEqualToString:](v98, "isEqualToString:", @"privileged"))
        {
          if (geteuid())
          {
            v37 = (FILE *)*MEMORY[0x1895F89D0];
            v38 = getprogname();
            fprintf(v37, "ERROR: %s must be run as root when in privileged mode\n", v38);
            goto LABEL_111;
          }

          uint64_t v39 = 0LL;
LABEL_61:
          if ((-[__CFString isEqualToString:](v97, "isEqualToString:", @"none") & 1) != 0)
          {
            unsigned int v91 = 0;
            goto LABEL_68;
          }

          if ((-[__CFString isEqualToString:](v97, "isEqualToString:", @"current") & 1) != 0)
          {
            int v41 = 1;
LABEL_67:
            unsigned int v91 = v41;
LABEL_68:
            if ((-[__CFString isEqualToString:](v96, "isEqualToString:", @"none") & 1) != 0)
            {
              uint64_t v42 = 0LL;
              goto LABEL_77;
            }

            if ((-[__CFString isEqualToString:](v96, "isEqualToString:", @"global") & 1) != 0)
            {
              uint64_t v42 = 1LL;
              goto LABEL_77;
            }

            if ((-[__CFString isEqualToString:](v96, "isEqualToString:", @"per-user") & 1) != 0)
            {
              uint64_t v42 = 2LL;
              goto LABEL_77;
            }

            if ((-[__CFString isEqualToString:](v96, "isEqualToString:", @"proxy") & 1) != 0)
            {
              uint64_t v42 = 3LL;
LABEL_77:
              if (v93)
              {
                +[MCMPOSIXUser posixUserWithName:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithName:");
                id v44 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v44 = v8;
              }

              id v13 = v44;
              if (!v44)
              {
                id v13 = v8;
                container_log_handle_for_category();
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v93;
                  _os_log_error_impl( &dword_188846000,  v45,  OS_LOG_TYPE_ERROR,  "Cannot find user [%{public}@] specified for bundle container owner, continuing without bundle container support",  (uint8_t *)&buf,  0xCu);
                }

                uint64_t v42 = 0LL;
              }

              if ((-[__CFString isEqualToString:](v95, "isEqualToString:", @"none") & 1) != 0)
              {
                uint64_t v46 = 0LL;
                goto LABEL_92;
              }

              if ((-[__CFString isEqualToString:](v95, "isEqualToString:", @"global") & 1) != 0)
              {
                uint64_t v46 = 1LL;
                goto LABEL_92;
              }

              if ((-[__CFString isEqualToString:](v95, "isEqualToString:", @"per-user") & 1) != 0)
              {
                uint64_t v46 = 2LL;
                goto LABEL_92;
              }

              if ((-[__CFString isEqualToString:](v95, "isEqualToString:", @"proxy") & 1) != 0)
              {
                uint64_t v46 = 3LL;
LABEL_92:
                if (v92)
                {
                  +[MCMPOSIXUser posixUserWithName:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithName:");
                  id v47 = (id)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v47 = v8;
                }

                id v12 = v47;
                v48 = v94;
                if (!v12)
                {
                  id v12 = v8;
                  container_log_handle_for_category();
                  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138543362;
                    *(void *)((char *)&buf + 4) = v92;
                    _os_log_error_impl( &dword_188846000,  v49,  OS_LOG_TYPE_ERROR,  "Cannot find user [%{public}@] specified for system container owner, continuing without system container support",  (uint8_t *)&buf,  0xCu);
                  }

                  uint64_t v46 = 0LL;
                  v48 = v94;
                }

                if (v48) {
                  char v50 = -[__CFString isEqualToString:](v48, "isEqualToString:", @"yes");
                }
                else {
                  char v50 = 0;
                }
                LOBYTE(v90) = v50;
                v14 = -[MCMGlobalConfiguration initWithStaticConfig:runMode:userContainerMode:bundleContainerMode:bundleContainerOwner:systemContainerMode:systemContainerOwner:kernelUpcallEnabled:]( objc_alloc(&OBJC_CLASS___MCMGlobalConfiguration),  "initWithStaticConfig:runMode:userContainerMode:bundleContainerMode:bundleContainerOwner:systemCo ntainerMode:systemContainerOwner:kernelUpcallEnabled:",  v15,  v39,  v91,  v42,  v13,  v46,  v12,  v90);
                objc_storeStrong((id *)&_gGlobalConfiguration, v14);
                [v15 defaultUser];
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                int has_home_dir = _containermanagerd_posix_user_has_home_dir(v51, (uint64_t)"default", &v109);

                if (has_home_dir) {
                  int v17 = 0;
                }
                else {
                  int v17 = 2;
                }
LABEL_114:

                uint64_t v11 = (os_log_s *)v98;
LABEL_115:

LABEL_116:
                objc_autoreleasePoolPop(context);
                if (v17 != 2)
                {
                  v57 = v100;
                  id v58 = v102;
                  v59 = v104;
                  v127[0] = 0LL;
                  v127[1] = v127;
                  v127[2] = 0x3032000000LL;
                  v127[3] = __Block_byref_object_copy__958;
                  v127[4] = __Block_byref_object_dispose__959;
                  id v128 = 0LL;
                  v60 = (void *)MEMORY[0x1895CE3A8]();
                  if (_os_feature_enabled_impl())
                  {
                    id v61 = containermanager_copy_global_configuration();
                    if ([v61 runmode])
                    {
                    }

                    else
                    {
                      id v62 = containermanager_copy_global_configuration();
                      int v63 = [v62 isInternalImage];

                      if (v63 && _containermanagerd_setup_log_replication_onceToken != -1) {
                        dispatch_once(&_containermanagerd_setup_log_replication_onceToken, &__block_literal_global_963);
                      }
                    }
                  }
                  v64 = +[MCMUserIdentitySharedCache sharedInstance]( &OBJC_CLASS___MCMUserIdentitySharedCache,  "sharedInstance");
                  container_log_handle_for_category();
                  v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  os_signpost_id_t v66 = os_signpost_id_make_with_pointer(v65, &_containermanagerd_start_xpc_userListener);

                  id v67 = containermanager_copy_global_configuration();
                  BOOL v68 = [v67 runmode] == 3;

                  if (!v68)
                  {
                    uint64_t v110 = 0LL;
                    uint64_t v111 = (uint64_t)&v110;
                    uint64_t v112 = 0x3032000000LL;
                    v113 = __Block_byref_object_copy__958;
                    v114 = __Block_byref_object_dispose__959;
                    id v115 = (id)os_transaction_create();
                    *(void *)&__int128 buf = MEMORY[0x1895F87A8];
                    *((void *)&buf + 1) = 3221225472LL;
                    uint64_t v130 = (uint64_t)___containermanagerd_start_xpc_block_invoke;
                    v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_18A29CB38;
                    v86 = v59;
                    v132 = (void (*)(uint64_t))v86;
                    v133 = v57;
                    os_signpost_id_t v137 = v66;
                    id v103 = v64;
                    id v134 = v103;
                    v135 = v127;
                    v136 = &v110;
                    dispatch_block_t contexta = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &buf);
                    dispatch_async(v86, contexta);
                    id v87 = containermanager_copy_global_configuration();
                    BOOL v101 = [v87 runmode] == 4;

                    if (!v101)
                    {
                      v125[0] = 0LL;
                      v125[1] = v125;
                      v125[2] = 0x3032000000LL;
                      v125[3] = __Block_byref_object_copy__958;
                      v125[4] = __Block_byref_object_dispose__959;
                      id v126 = (id)os_transaction_create();
                      block[0] = MEMORY[0x1895F87A8];
                      block[1] = 3221225472LL;
                      block[2] = ___containermanagerd_start_xpc_block_invoke_2;
                      block[3] = &unk_18A29CB60;
                      os_signpost_id_t v124 = v66;
                      id v120 = v103;
                      v122 = v127;
                      v88 = v86;
                      v121 = v88;
                      v123 = v125;
                      dispatch_block_t v89 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
                      dispatch_async(v88, v89);

                      _Block_object_dispose(v125, 8);
                    }

                    _Block_object_dispose(&v110, 8);
                  }

                  uint64_t v110 = MEMORY[0x1895F87A8];
                  uint64_t v111 = 3221225472LL;
                  uint64_t v112 = (uint64_t)___containermanagerd_start_xpc_block_invoke_3;
                  v113 = (uint64_t (*)(uint64_t, uint64_t))&unk_18A29CBB0;
                  v69 = v59;
                  v114 = v69;
                  v118 = v127;
                  v70 = v57;
                  id v115 = v70;
                  id v71 = v58;
                  id v116 = v71;
                  id v72 = v64;
                  id v117 = v72;
                  v73 = (void (**)(void, void))MEMORY[0x1895CE54C](&v110);
                  uint64_t v74 = ((void (**)(void, const char *))v73)[2](v73, "com.apple.containermanagerd.system");
                  v75 = (void *)_containermanagerd_start_xpc_systemListener;
                  _containermanagerd_start_xpc_systemListener = v74;

                  uint64_t v76 = ((void (**)(void, const char *))v73)[2](v73, "com.apple.containermanagerd");
                  v77 = (void *)_containermanagerd_start_xpc_userListener;
                  _containermanagerd_start_xpc_userListener = v76;

                  objc_autoreleasePoolPop(v60);
                  CFRunLoopRun();
                  _Block_object_dispose(v127, 8);
                }

                v78 = (dispatch_queue_s *)v109;
                v79 = v104;
                *(void *)&__int128 buf = MEMORY[0x1895F87A8];
                *((void *)&buf + 1) = 3221225472LL;
                uint64_t v130 = (uint64_t)___containermanagerd_start_xpc_with_permanent_error_block_invoke;
                v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_18A29CD08;
                v133 = v78;
                v80 = v79;
                v132 = v80;
                uint64_t v81 = MEMORY[0x1895CE54C](&buf);
                uint64_t v82 = (*(void (**)(uint64_t, const char *))(v81 + 16))(v81, "com.apple.containermanagerd.system");
                v83 = (void *)_containermanagerd_start_xpc_with_permanent_error_systemListener;
                _containermanagerd_start_xpc_with_permanent_error_systemListener = v82;

                uint64_t v84 = (*(void (**)(uint64_t, const char *))(v81 + 16))(v81, "com.apple.containermanagerd");
                v85 = (void *)_containermanagerd_start_xpc_with_permanent_error_userListener;
                _containermanagerd_start_xpc_with_permanent_error_userListener = v84;

                _containermanagerd_self_destruct(v80);
                dispatch_main();
              }

              v54 = (FILE *)*MEMORY[0x1895F89D0];
              v95 = v95;
              fprintf( v54,  "ERROR: Unrecognized system container mode: [%s]\n",  (const char *)-[__CFString UTF8String](v95, "UTF8String"));
              _containermanagerd_usage();
              id v12 = 0LL;
LABEL_112:
              v14 = 0LL;
LABEL_113:
              int v17 = 2;
              goto LABEL_114;
            }

            v53 = (FILE *)*MEMORY[0x1895F89D0];
            v96 = v96;
            fprintf( v53,  "ERROR: Unrecognized bundle container mode: [%s]\n",  (const char *)-[__CFString UTF8String](v96, "UTF8String"));
            _containermanagerd_usage();
          }

          else
          {
            if ((-[__CFString isEqualToString:](v97, "isEqualToString:", @"fixed") & 1) != 0)
            {
              int v41 = 2;
              goto LABEL_67;
            }

            v43 = (FILE *)*MEMORY[0x1895F89D0];
            v97 = v97;
            fprintf( v43,  "ERROR: Unrecognized user container mode: [%s]\n",  (const char *)-[__CFString UTF8String](v97, "UTF8String"));
            _containermanagerd_usage();
          }

    id v16 = v14;
    goto LABEL_37;
  }

  os_signpost_id_t v29 = 0LL;
  v30 = 1;
LABEL_37:

  return v30;
}

LABEL_111:
          id v12 = 0LL;
          id v13 = 0LL;
          goto LABEL_112;
        }

        if (-[__CFString isEqualToString:](v98, "isEqualToString:", @"agent"))
        {
          if (![v8 isRoleUser]
            || ([v8 hasUseableHomeDirectory] & 1) != 0
            || ([v8 isRoot] & 1) != 0)
          {
            uint64_t v39 = 2LL;
            goto LABEL_61;
          }

          container_log_handle_for_category();
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl( &dword_188846000,  v55,  OS_LOG_TYPE_DEFAULT,  "Starting up in PROXY mode because current user %@ does not have a home directory.",  (uint8_t *)&buf,  0xCu);
          }
        }

        else if ((-[__CFString isEqualToString:](v98, "isEqualToString:", @"proxy") & 1) == 0)
        {
          if ((-[__CFString isEqualToString:](v98, "isEqualToString:", @"sync") & 1) != 0)
          {
            uint64_t v39 = 4LL;
            goto LABEL_61;
          }

          if ((-[__CFString isEqualToString:](v98, "isEqualToString:", @"normal") & 1) != 0)
          {
            uint64_t v39 = 1LL;
            goto LABEL_61;
          }

          v56 = (FILE *)*MEMORY[0x1895F89D0];
          v98 = v98;
          fprintf( v56,  "ERROR: Unrecognized run mode: [%s]\n",  (const char *)-[__CFString UTF8String](v98, "UTF8String"));
          _containermanagerd_usage();
          goto LABEL_111;
        }

        uint64_t v39 = 3LL;
        goto LABEL_61;
      }

      if (v24 != 66) {
        goto LABEL_47;
      }
      [NSString stringWithUTF8String:*v23];
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v93 = v25;
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", @"-") & 1) != 0)
      {
        v93 = 0LL;
        goto LABEL_36;
      }
    }
  }

void sub_188860CD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t _containermanagerd_exception_preprocessor(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    id v2 = [v1 reason];
    [v2 UTF8String];
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }

  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _containermanagerd_posix_user_has_home_dir(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  __int16 v23 = 0;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unvalidatedHomeDirectoryURL];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = 0LL;
  char v8 = [v6 itemAtURL:v7 followSymlinks:1 exists:(char *)&v23 + 1 isDirectory:&v23 error:&v22];
  id v9 = v22;

  if ((v8 & 1) != 0)
  {
    if (!HIBYTE(v23) || !(_BYTE)v23)
    {
      container_log_handle_for_category();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [v5 unvalidatedHomeDirectoryURL];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 path];
        dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v25 = a2;
        __int16 v26 = 2112;
        v27 = v21;
        _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "%s user home directory [%@] not found or not a directory.",  buf,  0x16u);
      }

      uint64_t v13 = 102LL;
      goto LABEL_11;
    }

    [v5 homeDirectoryURL];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      uint64_t v11 = 1LL;
      goto LABEL_13;
    }

    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v5 unvalidatedHomeDirectoryURL];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v25 = a2;
      __int16 v26 = 2112;
      v27 = v16;
      int v17 = "Could not realpath %s home directory [%@]";
      unint64_t v18 = v12;
      uint32_t v19 = 22;
LABEL_17:
      _os_log_error_impl(&dword_188846000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    }
  }

  else
  {
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v5 unvalidatedHomeDirectoryURL];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v25 = a2;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2114;
      id v29 = v9;
      int v17 = "Failed to check for existence of %s user home directory [%@]: %{public}@";
      unint64_t v18 = v12;
      uint32_t v19 = 32;
      goto LABEL_17;
    }
  }

  uint64_t v13 = 103LL;
LABEL_11:

  uint64_t v11 = 0LL;
  if (a3) {
    *a3 = v13;
  }
LABEL_13:

  return v11;
}

uint64_t __Block_byref_object_copy__958(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__959(uint64_t a1)
{
}

void ___containermanagerd_main_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  getpid();
  int v2 = memorystatus_control();
  if (v2)
  {
    int v3 = v2;
    container_log_handle_for_category();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446210;
      char v8 = strerror(v3);
      _os_log_error_impl( &dword_188846000,  v4,  OS_LOG_TYPE_ERROR,  "Error de-elevating inactive jetsam priority: %{public}s",  (uint8_t *)&v7,  0xCu);
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unsigned int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;
}

uint64_t _containermanagerd_usage()
{
  v0 = getprogname();
  printf("usage:\n%s <options>\n", v0);
  puts("\tOptions:\n");
  printf( "\t\t[--runmode <%s|%s|%s|%s|%s>]\n",  (const char *)[@"privileged" UTF8String],  (const char *)objc_msgSend(@"normal", "UTF8String"),  (const char *)objc_msgSend(@"agent", "UTF8String"),  (const char *)objc_msgSend(@"proxy", "UTF8String"),  (const char *)objc_msgSend(@"sync", "UTF8String"));
  printf( "\t\t\tSets the daemon run mode. Default is [%s].\n\n",  (const char *)[@"normal" UTF8String]);
  printf( "\t\t[--user-container-mode <%s|%s|%s>]\n",  (const char *)[@"none" UTF8String],  (const char *)objc_msgSend(@"current", "UTF8String"),  (const char *)objc_msgSend(@"fixed", "UTF8String"));
  printf( "\t\t\tSets the user container mode. Default is [%s].\n\n",  (const char *)[@"fixed" UTF8String]);
  printf( "\t\t[--bundle-container-mode <%s|%s|%s|%s>]\n",  (const char *)[@"none" UTF8String],  (const char *)objc_msgSend(@"global", "UTF8String"),  (const char *)objc_msgSend(@"per-user", "UTF8String"),  (const char *)objc_msgSend(@"proxy", "UTF8String"));
  printf( "\t\t\tSets the bundle container mode. Default is [%s].\n\n",  (const char *)[@"global" UTF8String]);
  puts("\t\t[--bundle-container-owner <username>]");
  uint64_t v1 = [@"_installd" UTF8String];
  if (v1) {
    int v2 = (const char *)v1;
  }
  else {
    int v2 = "<current user>";
  }
  printf("\t\t\tSets the bundle container owner when mode is global. Default is [%s].\n\n", v2);
  printf( "\t\t[--system-container-mode <%s|%s|%s|%s>]\n",  (const char *)[@"none" UTF8String],  (const char *)objc_msgSend(@"global", "UTF8String"),  (const char *)objc_msgSend(@"per-user", "UTF8String"),  (const char *)objc_msgSend(@"proxy", "UTF8String"));
  printf( "\t\t\tSets the system container mode. Default is [%s].\n\n",  (const char *)[@"global" UTF8String]);
  puts("\t\t[--system-container-owner <username>]");
  uint64_t v3 = [@"root" UTF8String];
  if (v3) {
    id v4 = (const char *)v3;
  }
  else {
    id v4 = "<current user>";
  }
  printf("\t\t\tSets the system container owner when mode is global. Default is [%s].\n\n", v4);
  return printf( "\t\t[--kernel-upcall <%s|%s>]\n",  (const char *)[@"no" UTF8String],  (const char *)objc_msgSend(@"yes", "UTF8String"));
}

void ___containermanagerd_start_xpc_block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  int v2 = *(void **)(a1 + 40);
  os_signpost_id_t v3 = *(void *)(a1 + 72);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v66 = v2;
  id v6 = v4;
  container_log_handle_for_category();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  char v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188846000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StartingUp", "", buf, 2u);
  }

  uint64_t v9 = (void *)MEMORY[0x1895CE3A8]();
  if (setiopolicy_np(9, 0, 1))
  {
    container_log_handle_for_category();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v63 = *__error();
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v63;
      _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Unable to set low disk space io policy: %{darwin.errno}d",  buf,  8u);
    }
  }

  container_log_handle_for_category();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136446722;
    *(void *)&uint8_t buf[4] = "MobileContainerManager-689~6508";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "Nov 10 2024";
    *(_WORD *)&buf[22] = 2082;
    v75 = "01:32:04";
    _os_log_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEFAULT,  "containermanagerd (%{public}s) built at %{public}s %{public}s started",  buf,  0x20u);
  }

  id v12 = (void *)_CFCopySystemVersionDictionary();
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 objectForKeyedSubscript:*MEMORY[0x189604B60]];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      [v13 objectForKeyedSubscript:@"ReleaseType"];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Current build version (%@ / %@)", buf, 0x16u);
      }
    }

    else
    {
      container_log_handle_for_category();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "Could not get current build string", buf, 2u);
      }
    }
  }

  else
  {
    container_log_handle_for_category();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "Could not get current build info", buf, 2u);
    }
  }

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.containermanagerd.lockstate", 0LL);
  unint64_t v18 = (void *)gLockStateQueue;
  gLockStateQueue = (uint64_t)v17;

  if (!gLockStateQueue)
  {
    _os_crash();
    __break(1u);
  }

  id v19 = containermanager_copy_global_configuration();
  int v20 = [v19 kernelUpcallEnabled];

  if (v20)
  {
    id v21 = v5;
    id v70 = 0LL;
    id v71 = &v70;
    uint64_t v72 = 0x2020000000LL;
    char v73 = 0;
    *(void *)__int128 buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __MCMKernServerStart_block_invoke;
    v75 = (const char *)&unk_18A29DC28;
    id v76 = v21;
    v77 = &v70;
    uint64_t v22 = MCMKernServerStart_onceToken;
    id v23 = v21;
    int v24 = v23;
    if (v22 == -1)
    {
      uint64_t v25 = v23;
    }

    else
    {
      dispatch_once(&MCMKernServerStart_onceToken, buf);
      uint64_t v25 = v76;
    }

    int v26 = *((unsigned __int8 *)v71 + 24);

    _Block_object_dispose(&v70, 8);
    if (!v26)
    {
      _os_crash();
      __break(1u);
      return;
    }
  }

  id v27 = containermanager_copy_global_configuration();
  [v27 libraryRepair];
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v70 = 0LL;
  char v29 = [v28 createPathsIfNecessaryWithError:&v70];
  id v30 = v70;

  if ((v29 & 1) == 0)
  {
    container_log_handle_for_category();
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed creating working directories: %{public}@",  buf,  0xCu);
    }

    char v43 = 0;
    goto LABEL_45;
  }

  id v31 = containermanager_copy_global_configuration();
  int v32 = [v31 dispositionForContainerClass:2];

  if (v32 == 1)
  {
    id v33 = v5;
    [v6 defaultUserIdentity];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 libraryRepairForUserIdentity:v34];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    id v69 = v30;
    char v36 = [v35 createPathsIfNecessaryWithError:&v69];
    id v37 = v69;

    if ((v36 & 1) == 0)
    {
      container_log_handle_for_category();
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed creating working directories: %{public}@",  buf,  0xCu);
      }

      char v43 = 0;
      id v30 = v37;
      id v5 = v33;
      goto LABEL_45;
    }

    id v30 = v37;
    id v5 = v33;
  }

  id v38 = containermanager_copy_global_configuration();
  int v39 = [v38 dispositionForContainerClass:2];

  if (v39 == 1)
  {
    id v68 = v30;
    v40 = +[MCMCodeSigningMapping codeSignMappingWithError:]( &OBJC_CLASS___MCMCodeSigningMapping,  "codeSignMappingWithError:",  &v68);
    id v41 = v68;

    if (!v40)
    {
      container_log_handle_for_category();
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138543362;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to connect codesign mapping database: %{public}@",  buf,  0xCu);
      }

      char v43 = 0;
      id v30 = v41;
      goto LABEL_45;
    }

    id v65 = v5;
    objc_storeStrong((id *)&gCodeSigningMapping, v40);
    id v30 = v41;
  }

  else
  {
    id v65 = v5;
    v40 = 0LL;
  }

  id v44 = objc_alloc(&OBJC_CLASS___MCMContainerCache);
  [v40 childParentMapCache];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = objc_opt_class();
  id v67 = 0LL;
  id v47 = -[MCMContainerCache initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:error:]( v44,  "initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:error:",  v6,  v45,  v46,  objc_opt_class(),  &v67);
  uint64_t v42 = (os_log_s *)v67;

  if (v47)
  {
    v48 = (void *)gContainerCache;
    gContainerCache = (uint64_t)v47;
    v64 = v47;

    v49 = objc_alloc(&OBJC_CLASS___MCMSystemChangeMonitor);
    *(void *)__int128 buf = gContainerCache;
    char v50 = v6;
    v51 = v9;
    id v52 = containermanager_copy_global_configuration();
    [v52 classPathCache];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&buf[8] = v53;
    [MEMORY[0x189603F18] arrayWithObjects:buf count:2];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = -[MCMSystemChangeMonitor initWithQueue:flushables:](v49, "initWithQueue:flushables:", v66, v54);
    v56 = (void *)gMCMChangeMonitor;
    gMCMChangeMonitor = v55;

    uint64_t v9 = v51;
    id v6 = v50;
    [v50 addObserver:gMCMChangeMonitor];

    char v43 = 1;
  }

  else
  {
    container_log_handle_for_category();
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_error_impl( &dword_188846000,  v57,  OS_LOG_TYPE_ERROR,  "Failed to connect container cache database: %{public}@",  buf,  0xCu);
    }

    char v43 = 0;
  }

  id v5 = v65;
LABEL_45:

  objc_autoreleasePoolPop(v9);
  if ((v43 & 1) == 0)
  {
    id v58 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 91LL);
    uint64_t v59 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = v58;

    _containermanagerd_self_destruct(*(void **)(a1 + 32));
  }

  uint64_t v61 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v62 = *(void **)(v61 + 40);
  *(void *)(v61 + 40) = 0LL;
}

void ___containermanagerd_start_xpc_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v110 = *MEMORY[0x1895F89C0];
  os_signpost_id_t v2 = *(void *)(a1 + 64);
  id v3 = *(id *)(a1 + 32);
  uint64_t v84 = MEMORY[0x1895CE3A8]();
  v85 = +[MCMClientConnection sharedClientConnection](&OBJC_CLASS___MCMClientConnection, "sharedClientConnection");
  id v4 = v3;
  id v5 = containermanager_copy_global_configuration();
  [v5 managedPathRegistry];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containermanagerLibrary];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = containermanager_copy_global_configuration();
  LODWORD(v6) = [v8 runmode];

  if ((_DWORD)v6)
  {
    [v4 defaultUserIdentity];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 managedUserPathRegistryForUserIdentity:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 containermanagerUserLibrary];

    int v7 = (void *)v11;
  }

  [v7 url];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 URLByAppendingPathComponent:@"boot.txt" isDirectory:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  id v14 = v13;
  *(void *)&__int128 out_token = 0LL;
  [MEMORY[0x189603F48] dataWithBytes:container_internal_get_first_boot_uuid() length:0];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)uint64_t v90 = 0LL;
  v86 = v14;
  [v16 readDataFromURL:v14 options:2 error:v90];
  dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = *(id *)v90;

  container_log_handle_for_category();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138413058;
    id v99 = v86;
    __int16 v100 = 2112;
    id v101 = v15;
    __int16 v102 = 2112;
    id v103 = v17;
    __int16 v104 = 2112;
    id v105 = v18;
    _os_log_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEFAULT,  "First boot check with [%@]; uuid = [%@], marker = [%@], error = %@",
      buf,
      0x2Au);
  }

  if (v17) {
    int v20 = [v15 isEqualToData:v17] ^ 1;
  }
  else {
    int v20 = 1;
  }
  id v21 = v85;

  int v83 = v20;
  if (v20)
  {
    container_log_handle_for_category();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_188846000,  v22,  OS_LOG_TYPE_DEFAULT,  "containermanagerd performing first boot initialization",  buf,  2u);
    }

    container_log_handle_for_category();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FirstBootSetup",  "",  buf,  2u);
    }

    [v85 rebootContainerManagerSetup];
    container_log_handle_for_category();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v24,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FirstBootSetup",  "",  buf,  2u);
    }

    id v25 = v86;
    *(void *)&__int128 out_token = 0LL;
    [MEMORY[0x189603F48] dataWithBytes:container_internal_get_first_boot_uuid() length:0];
    int v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 dataWritingOptionsForFileAtURL:v25];

    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)uint64_t v90 = 0LL;
    char v30 = [v29 writeData:v26 toURL:v25 options:v28 mode:384 error:v90];
    id v31 = *(id *)v90;

    container_log_handle_for_category();
    int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v33 = v32;
    if ((v30 & 1) != 0)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v99 = v25;
        __int16 v100 = 2112;
        id v101 = v26;
        _os_log_impl( &dword_188846000,  v33,  OS_LOG_TYPE_DEFAULT,  "First boot set complete with [%@]; uuid = [%@]",
          buf,
          0x16u);
      }
    }

    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v99 = v25;
      __int16 v100 = 2112;
      id v101 = v31;
      _os_log_error_impl( &dword_188846000,  v33,  OS_LOG_TYPE_ERROR,  "Could not write boot marker at [%@]; error = %@",
        buf,
        0x16u);
    }

    id v21 = v85;
  }

  container_log_handle_for_category();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "BootSetup",  "",  buf,  2u);
  }

  [v21 containerManagerSetup];
  id v35 = containermanager_copy_global_configuration();
  int v36 = [v35 dispositionForContainerClass:2];

  int v37 = v20;
  os_signpost_id_t v38 = v2;
  int v39 = (void *)v84;
  if (v36 != 1) {
    goto LABEL_41;
  }
  [(id)gContainerCache userIdentityCache];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v40 userIdentityForPersonalPersona];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    v79 = v40;
    id v80 = v4;
    os_signpost_id_t v81 = v38;
    uint64_t v82 = v1;
    uint64_t v43 = +[MCMClientIdentity privilegedClientIdentityWithUserIdentity:kernel:]( &OBJC_CLASS___MCMClientIdentity,  "privilegedClientIdentityWithUserIdentity:kernel:",  v41,  1LL);
    +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
    id v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(&OBJC_CLASS___MCMContainerFactory);
    uint64_t v78 = (void *)v43;
    v88 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:]( v45,  "initWithContainerCache:clientIdentity:userIdentityCache:",  gContainerCache,  v43,  v44);
    id v46 = containermanager_copy_global_configuration();
    [v46 staticConfig];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 configForContainerClass:2];
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 out_token = 0u;
    __int128 v107 = 0u;
    v49 = +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
    [v49 wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet];
    char v50 = (void *)objc_claimAutoreleasedReturnValue();

    id obj = v50;
    uint64_t v51 = [v50 countByEnumeratingWithState:&out_token objects:buf count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v107;
      do
      {
        for (uint64_t i = 0LL; i != v52; ++i)
        {
          if (*(void *)v107 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = *(void *)(*((void *)&out_token + 1) + 8 * i);
          uint64_t v95 = 1LL;
          v56 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v42,  v55,  v48,  dyld_get_active_platform(),  v44,  &v95);
          if (v56)
          {
            id v89 = 0LL;
            v57 = -[MCMContainerFactory containerForContainerIdentity:createIfNecessary:error:]( v88,  "containerForContainerIdentity:createIfNecessary:error:",  v56,  1LL,  &v89);
            id v58 = v89;
            uint64_t v59 = v58;
            if (!v57) {
              uint64_t v95 = [v58 type];
            }
          }

          if (v95 != 1)
          {
            container_log_handle_for_category();
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v90 = 138543618;
              *(void *)&v90[4] = v55;
              __int16 v91 = 2048;
              uint64_t v92 = v95;
              _os_log_impl( &dword_188846000,  v60,  OS_LOG_TYPE_DEFAULT,  "_create_well_known_containers: Failed for bundleID '%{public}@' with error: %llu",  v90,  0x16u);
            }
          }
        }

        uint64_t v52 = [obj countByEnumeratingWithState:&out_token objects:buf count:16];
      }

      while (v52);
    }

    os_signpost_id_t v38 = v81;
    uint64_t v1 = v82;
    id v4 = v80;
    int v39 = (void *)v84;
    id v21 = v85;
    int v37 = v83;
LABEL_41:
    id v61 = containermanager_copy_global_configuration();
    int v62 = [v61 dispositionForContainerClass:13];

    if (v62 == 1)
    {
      uint64_t v95 = (uint64_t)"systemgroup.com.apple.installcoordinationd";
      v96 = "/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.installcoordinationd";
      uint64_t v97 = 0LL;
      int v63 = sandbox_set_user_state_item_with_persona();
      if (v63)
      {
        int v64 = v63;
        container_log_handle_for_category();
        id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v90 = 136315650;
          *(void *)&v90[4] = v95;
          __int16 v91 = 2080;
          uint64_t v92 = (uint64_t)v96;
          __int16 v93 = 1024;
          int v94 = v64;
          _os_log_error_impl( &dword_188846000,  v65,  OS_LOG_TYPE_ERROR,  "Failed to set systemgroup mapping for identifier %s, path: %s : %d",  v90,  0x1Cu);
        }
      }
    }

    goto LABEL_49;
  }

  container_log_handle_for_category();
  id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v39 = (void *)v84;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_188846000,  v66,  OS_LOG_TYPE_DEFAULT,  "_create_well_known_containers: Unable to find user identity!",  buf,  2u);
  }

LABEL_49:
  container_log_handle_for_category();
  id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v67))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v67,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "BootSetup",  "",  buf,  2u);
  }

  LODWORD(out_token) = 0;
  id v68 = (void *)*MEMORY[0x189611578];
  uint32_t v69 = notify_register_dispatch( (const char *)*MEMORY[0x189611578],  (int *)&out_token,  MEMORY[0x1895F8AE0],  &__block_literal_global_163);
  if (v69)
  {
    uint32_t v70 = v69;
    container_log_handle_for_category();
    id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v99 = v68;
      __int16 v100 = 1024;
      LODWORD(v101) = v70;
      _os_log_error_impl( &dword_188846000,  v71,  OS_LOG_TYPE_ERROR,  "notify_register_dispatch for notification %s failed; returned %d\n",
        buf,
        0x12u);
    }
  }

  _containermanagerd_keybagd_notification_callback();
  if (v37)
  {
    container_log_handle_for_category();
    uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v72))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v72,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FirstBootCleanup",  "",  buf,  2u);
    }

    [v21 rebootContainerManagerCleanupWithCompletion:&__block_literal_global_165];
  }

  container_log_handle_for_category();
  char v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v73))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v73,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "BootCleanup",  "",  buf,  2u);
  }

  [v21 containerManagerCleanupWithCompletion:&__block_literal_global_167];
  objc_autoreleasePoolPop(v39);
  container_log_handle_for_category();
  uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188846000, v75, OS_SIGNPOST_INTERVAL_END, v38, "StartingUp", "", buf, 2u);
  }

  uint64_t v76 = *(void *)(*(void *)(v1 + 56) + 8LL);
  v77 = *(void **)(v76 + 40);
  *(void *)(v76 + 40) = 0LL;
}

_xpc_connection_s *___containermanagerd_start_xpc_block_invoke_3(uint64_t a1, char *name)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  xpc_connection_t mach_service = xpc_connection_create_mach_service(name, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (!mach_service)
  {
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_188846000, v6, OS_LOG_TYPE_ERROR, "unable to start xpc service!", buf, 2u);
    }

    exit(100);
  }

  id v4 = mach_service;
  __xpc_connection_set_logging();
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = ___containermanagerd_start_xpc_block_invoke_134;
  handler[3] = &unk_18A29CB88;
  uint64_t v12 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume(v4);

  return v4;
}

_xpc_connection_s *___containermanagerd_start_xpc_with_permanent_error_block_invoke( uint64_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", *(void *)(a1 + 40));
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a2, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (mach_service)
  {
    __xpc_connection_set_logging();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2;
    handler[3] = &unk_18A29CC78;
    id v8 = *(id *)(a1 + 32);
    id v9 = v4;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
  }

  return mach_service;
}

void _containermanagerd_self_destruct(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___containermanagerd_self_destruct_block_invoke;
  block[3] = &unk_18A29E378;
  id v7 = v1;
  uint64_t v2 = _containermanagerd_self_destruct_onceToken;
  id v3 = v1;
  id v5 = v3;
  if (v2 == -1)
  {
    id v4 = v3;
  }

  else
  {
    dispatch_once(&_containermanagerd_self_destruct_onceToken, block);
    id v4 = v7;
  }
}

void ___containermanagerd_self_destruct_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3032000000LL;
  v5[3] = __Block_byref_object_copy__958;
  v5[4] = __Block_byref_object_dispose__959;
  id v6 = (id)os_transaction_create();
  dispatch_time_t v2 = dispatch_time(0LL, 2000000000LL);
  id v3 = *(dispatch_queue_s **)(a1 + 32);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___containermanagerd_self_destruct_block_invoke_2;
  v4[3] = &unk_18A29E028;
  v4[4] = v5;
  dispatch_after(v2, v3, v4);
  _Block_object_dispose(v5, 8);
}

void ___containermanagerd_self_destruct_block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  dispatch_time_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl(&dword_188846000, v2, OS_LOG_TYPE_ERROR, "Exiting when clean.", v5, 2u);
  }

  xpc_transaction_exit_clean();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;
}

void ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2(uint64_t a1, void *a2)
{
}

void _containermanagerd_listener_handler_for_permanent_error(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (MEMORY[0x1895CEBDC](v6) == MEMORY[0x1895F9238])
  {
    xpc_connection_set_target_queue(v6, v5);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = ___containermanagerd_listener_handler_for_permanent_error_block_invoke;
    handler[3] = &unk_18A29CC78;
    uint64_t v8 = v6;
    uint64_t v10 = v8;
    id v11 = v7;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_resume(v8);
  }
}

void ___containermanagerd_listener_handler_for_permanent_error_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (MEMORY[0x1895CEBDC]() != MEMORY[0x1895F9268])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v6 = v3;
    id v7 = v4;
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
      [v7 libsystemError];
      container_xpc_encode_error();
      xpc_dictionary_set_value(reply, "ReplyErrorExtended", v9);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Command");
      xpc_dictionary_get_audit_token();
      uint64_t v15 = container_audit_token_copy_codesign_identifier();
      int euid = container_audit_token_get_euid();
      *(_OWORD *)__int128 buf = v26;
      *(_OWORD *)&buf[16] = v27;
      int pid = container_audit_token_get_pid();
      uid_t v12 = geteuid();
      container_log_handle_for_category();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v7 type];
        [v7 type];
        *(_DWORD *)__int128 buf = 67110914;
        *(_DWORD *)&uint8_t buf[4] = v12;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = " EXITING AFTER REPLYING TO:";
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = uint64;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v15;
        __int16 v18 = 1024;
        int v19 = euid;
        __int16 v20 = 1024;
        int v21 = pid;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        uint64_t error_description = container_get_error_description();
        _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "[%u]%{public}s command=%llu, client=%s(uid: %d, pid: %d), error=%llu (%s)",  buf,  0x46u);
      }

      xpc_connection_send_message(v5, reply);
      xpc_connection_send_barrier(v5, &__block_literal_global_180);
    }

    else
    {
      xpc_connection_cancel(v5);
    }
  }
}

void ___containermanagerd_reply_with_error_block_invoke()
{
}

void ___containermanagerd_start_xpc_block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    _containermanagerd_listener_handler_for_permanent_error(v5, v3, v4);
    _containermanagerd_self_destruct(*(void **)(a1 + 40));
  }

  else
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = *(void **)(a1 + 56);
    uint64_t v8 = v5;
    id v9 = v6;
    id v10 = v7;
    id v11 = (_xpc_connection_s *)v3;
    if (MEMORY[0x1895CEBDC]() == MEMORY[0x1895F9238])
    {
      xpc_connection_set_target_queue(v11, v8);
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = ___containermanagerd_listener_handler_block_invoke;
      handler[3] = &unk_18A29CCC0;
      uint64_t v14 = v8;
      id v15 = v9;
      id v16 = v10;
      uid_t v12 = v11;
      dispatch_queue_t v17 = v12;
      xpc_connection_set_event_handler(v12, handler);
      xpc_connection_resume(v12);
    }
  }
}

void ___containermanagerd_listener_handler_block_invoke(void *a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = (void *)a1[5];
  id v7 = (void *)a1[6];
  id v6 = (void *)a1[7];
  id v65 = v4;
  id v8 = v5;
  id v9 = v7;
  connection = v6;
  id v66 = v3;
  if (_containermanagerd_connection_handler_onceToken != -1) {
    dispatch_once(&_containermanagerd_connection_handler_onceToken, &__block_literal_global_181);
  }
  BOOL v10 = MEMORY[0x1895CEBDC](v66) == MEMORY[0x1895F9268];
  id v11 = v66;
  if (!v10)
  {
    uid_t v12 = (void *)_containermanagerd_connection_handler_dispatcher;
    id v13 = v66;
    id v62 = v65;
    id v63 = v8;
    id v14 = v9;
    id v61 = v12;
    xpc_object_t reply = xpc_dictionary_create_reply(v13);
    id v58 = v14;
    if (!reply)
    {
      container_log_handle_for_category();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, "Dictionary does not have reply context", buf, 2u);
      }

      goto LABEL_41;
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v13, "Command");
    v54 = (void *)MEMORY[0x1895CE3A8]();
    uint64_t v70 = 0LL;
    id v71 = &v70;
    uint64_t v72 = 0x3032000000LL;
    char v73 = __Block_byref_object_copy__8554;
    uint64_t v74 = __Block_byref_object_dispose__8555;
    id v75 = 0LL;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __MCMProcessXPCEvent_block_invoke;
    block[3] = &unk_18A29E378;
    id v16 = v14;
    id v69 = v16;
    if (MCMProcessXPCEvent_onceToken != -1) {
      dispatch_once(&MCMProcessXPCEvent_onceToken, block);
    }
    container_log_handle_for_category();
    dispatch_queue_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v17, v13);

    container_log_handle_for_category();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v19 = v18;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)__int128 buf = 134349056;
      *(void *)&uint8_t buf[4] = uint64;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v59,  "XPCEventProcessing",  " command=%{public, signpost.description:attribute}llu ",  buf,  0xCu);
    }

    if (uint64 >= 0x32)
    {
      container_log_handle_for_category();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = uint64;
        _os_log_error_impl(&dword_188846000, v20, OS_LOG_TYPE_ERROR, "Invalid command index: %lld", buf, 0xCu);
      }

      v56 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  49LL,  3LL);
      int v21 = 0;
      id v57 = 0LL;
LABEL_30:
      char v29 = 0LL;
      uint64_t v55 = 0LL;
      uint64_t v23 = 0LL;
LABEL_37:
      uint64_t v41 = os_transaction_create();
      uint64_t v42 = (void *)v71[5];
      v71[5] = v41;

      uint64_t v43 = objc_alloc(&OBJC_CLASS___MCMResultPromise);
      *(void *)__int128 buf = MEMORY[0x1895F87A8];
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&buf[16] = __MCMProcessXPCEvent_block_invoke_10;
      uint64_t v78 = &unk_18A29DD40;
      os_signpost_id_t v81 = v59;
      uint64_t v82 = uint64;
      id v44 = v23;
      id v79 = v44;
      id v80 = &v70;
      v45 = -[MCMResultPromise initWithCompletion:](v43, "initWithCompletion:", buf);

      __int16 v22 = -[MCMReply initWithXpcReply:slowWorkloop:fastWorkloop:resultPromise:]( objc_alloc(&OBJC_CLASS___MCMReply),  "initWithXpcReply:slowWorkloop:fastWorkloop:resultPromise:",  reply,  v63,  v62,  v45);
      if (v21)
      {
        [v61 dispatchMessage:v13 context:v29 reply:v22];
      }

      else
      {
        id v46 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v56);
        -[MCMResultPromise completeWithResult:](v45, "completeWithResult:", v46);
      }

      _Block_object_dispose(&v70, 8);
      objc_autoreleasePoolPop(v54);
      -[os_log_s send](v22, "send");

LABEL_41:
      id v11 = v66;
      if (!reply)
      {
        xpc_connection_cancel(connection);
        id v11 = v66;
      }

      goto LABEL_43;
    }

    id v57 = -[MCMClientMessageContext initForCurrentThreadContextWithXPCMessage:userIdentityCache:]( objc_alloc(&OBJC_CLASS___MCMClientMessageContext),  "initForCurrentThreadContextWithXPCMessage:userIdentityCache:",  v13,  v16);
    id v67 = 0LL;
    [(id)MCMProcessXPCEvent_clientFactory clientIdentityWithClientMessageContext:v57 xpcMessage:v13 error:&v67];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (MCMError *)v67;
    if (!v23)
    {
      container_log_handle_for_category();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        int v47 = [v57 pid];
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v47;
        *(_WORD *)&uint8_t buf[8] = 2112;
        *(void *)&buf[10] = v56;
        _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Error creating client identity for pid %d; error = %@",
          buf,
          0x12u);
      }

      int v21 = 0;
      goto LABEL_30;
    }

    __int16 v24 = objc_alloc(&OBJC_CLASS___MCMContainerFactory);
    uint64_t v55 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:]( v24,  "initWithContainerCache:clientIdentity:userIdentityCache:",  gContainerCache,  v23,  v16);
    uint64_t current_persona = voucher_get_current_persona();
    __int128 v26 = objc_alloc(&OBJC_CLASS___MCMCommandContext);
    uint64_t v27 = gContainerCache;
    id v28 = containermanager_copy_global_configuration();
    char v29 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:]( v26,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:",  v23,  v27,  v55,  v16,  current_persona,  v28);

    id v30 = containermanager_copy_global_configuration();
    LODWORD(v27) = [v30 dispositionForContainerClass:2] == 1;

    if (!(_DWORD)v27)
    {
LABEL_36:
      int v21 = 1;
      goto LABEL_37;
    }

    char v29 = v29;
    -[MCMCommandContext clientIdentity](v29, "clientIdentity");
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 codeSignInfo];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v31 cached] & 1) != 0 || (objc_msgSend(v53, "cached"))
    {
LABEL_35:

      goto LABEL_36;
    }

    context = (void *)MEMORY[0x1895CE3A8]();
    int v32 = (void *)gCodeSigningMapping;
    [v53 entitlements];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 identifier];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    id v76 = 0LL;
    [v32 processCallerRegisteredEntitlements:v33 identifier:v34 error:&v76];
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    id v50 = v76;

    if (v52)
    {
      if (![v52 count])
      {
LABEL_34:

        objc_autoreleasePoolPop(context);
        goto LABEL_35;
      }

      oslog = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
      [v52 allObjects];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v35,  0LL,  v29,  oslog);
      int v36 = (void *)objc_claimAutoreleasedReturnValue();

      [v36 execute];
      -[MCMResultPromise result](oslog, "result");
      int v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 error];
      os_signpost_id_t v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        container_log_handle_for_category();
        int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v38;
          _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to destroy container(s) when processing codesign entitlements; error = %@",
            buf,
            0xCu);
        }
      }
    }

    else
    {
      container_log_handle_for_category();
      oslog = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      {
        [v53 identifier];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_error_impl( &dword_188846000,  (os_log_t)oslog,  OS_LOG_TYPE_ERROR,  "Error processing entitlements for %@ : %@",  buf,  0x16u);
      }
    }

    goto LABEL_34;
  }

LABEL_43:
}

    id v79 = 110LL;

    id v9 = v71;
    goto LABEL_44;
  }

void sub_188863B7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

void ___containermanagerd_connection_handler_block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MCMCommandDispatcher);
  id v1 = (void *)_containermanagerd_connection_handler_dispatcher;
  _containermanagerd_connection_handler_dispatcher = (uint64_t)v0;

  id v3 = (id)_containermanagerd_connection_handler_dispatcher;
  int has_internal_content = os_variant_has_internal_content();
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
}

void _containermanagerd_keybagd_notification_callback()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v0 = MKBGetDeviceLockState();
  container_log_handle_for_category();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = v0;
    _os_log_debug_impl(&dword_188846000, v1, OS_LOG_TYPE_DEBUG, "LockState=%d", (uint8_t *)v2, 8u);
  }

  if (v0 == 1)
  {
    if (_containermanagerd_keybagd_notification_callback_previousState != 1) {
      dispatch_suspend((dispatch_object_t)gLockStateQueue);
    }
  }

  else
  {
    if (v0) {
      return;
    }
    if (_containermanagerd_keybagd_notification_callback_previousState == 1) {
      dispatch_resume((dispatch_object_t)gLockStateQueue);
    }
  }

  _containermanagerd_keybagd_notification_callback_previousState = v0;
}

void ___containermanagerd_perform_launch_tasks_block_invoke_166()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  int v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_188846000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd cleanup complete", buf, 2u);
  }

  container_log_handle_for_category();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v1,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "BootCleanup",  "",  v2,  2u);
  }
}

void ___containermanagerd_perform_launch_tasks_block_invoke_164()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  int v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_188846000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd first boot cleanup complete", buf, 2u);
  }

  container_log_handle_for_category();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v1,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FirstBootCleanup",  "",  v2,  2u);
  }
}

void ___containermanagerd_perform_launch_tasks_block_invoke()
{
}

void ___containermanagerd_setup_log_replication_block_invoke()
{
  int v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.containermanagerd.volume-notification", v0);

  id v1 = MCMSharedFastWorkloop();
  id v2 = containermanager_copy_global_configuration();
  [v2 defaultUser];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 UID];
  container_log_replication_prune_for_uid();

  [MEMORY[0x189604030] fileURLWithPath:@"/private/var" isDirectory:1 relativeToURL:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[MCMLogReplicator initWithWorkloop:](objc_alloc(&OBJC_CLASS___MCMLogReplicator), "initWithWorkloop:", v1);
  id v6 = (void *)_containermanagerd_setup_log_replication_logReplicator;
  _containermanagerd_setup_log_replication_logReplicator = (uint64_t)v5;

  id v7 = -[MCMVolumeChangeMonitor initWithWorkloop:mountPointURL:]( objc_alloc(&OBJC_CLASS___MCMVolumeChangeMonitor),  "initWithWorkloop:mountPointURL:",  v9,  v4);
  id v8 = (void *)gMCMVolumeMonitor;
  gMCMVolumeMonitor = (uint64_t)v7;

  [(id)gMCMVolumeMonitor addObserver:_containermanagerd_setup_log_replication_logReplicator];
  [(id)gMCMVolumeMonitor start];
}

LABEL_16:
  return v18;
}

  id v33 = 0LL;
  v34 = 0LL;
LABEL_17:
  id v35 = 0LL;
LABEL_18:
  int v36 = 0LL;
LABEL_19:
  int v37 = 0LL;
LABEL_20:
  os_signpost_id_t v38 = v37;

  return v38;
}

  return v27;
}

  id v31 = 0;
  id v30 = 1;
LABEL_17:

  _Block_object_dispose(buf, 8);
  if ((v31 & 1) != 0) {
    goto LABEL_18;
  }

  if ((v30 & 1) == 0) {
    goto LABEL_23;
  }
  int v21 = 0LL;
LABEL_20:
  if (a5 && !v21)
  {
    int v21 = 0LL;
    *a5 = (id) v60[5];
  }

  MEMORY[0x1895CDD90](v13);
  MEMORY[0x1895CDD90](v22);
  if (v38 != 1)
  {
    if (a5) {
      *a5 = v38;
    }

    BOOL v10 = 0LL;
  }

LABEL_21:
  return v10;
}

  return v12;
}

      goto LABEL_17;
    }

    goto LABEL_17;
  }

  uint64_t v112 = v11;
  if (!v4)
  {
    id v105 = v12;
    id v57 = (void *)objc_opt_new();
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    id v134 = 0u;
    id obj = v6;
    id v58 = v113;
    id v116 = [obj countByEnumeratingWithState:&v131 objects:v130 count:16];
    if (v116)
    {
      id v115 = *(void *)v132;
      do
      {
        os_signpost_id_t v59 = 0LL;
        do
        {
          if (*(void *)v132 != v115) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v131 + 1) + 8 * v59);
          v119 = 1LL;
          -[MCMCommandQuery containerConfig](v11, "containerConfig");
          id v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:]( MCMXPCMessageBase,  "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:",  v60,  v58,  [v61 containerClass],  &v119);
          id v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
            dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
          }
          if (MCMRequirePersonaTelemetryOnly_result
            && v119 != 1
            && [v62 isNoSpecificPersona])
          {
            container_log_handle_for_category();
            id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
            {
              [v58 codeSignInfo];
              uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
              [v110 identifier];
              __int128 v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCMCommandQuery containerConfig](v11, "containerConfig");
              __int128 v108 = (void *)objc_claimAutoreleasedReturnValue();
              id v71 = [v108 name];
              multiuser_flags = 138544386;
              v136 = v107;
              os_signpost_id_t v137 = 2112;
              uint64_t v138 = v71;
              uint64_t v72 = (void *)v71;
              v139 = 2114;
              v140 = v60;
              v141 = 2114;
              v142 = v58;
              v143 = 2114;
              v144 = v62;
              _os_log_fault_impl( &dword_188846000,  v63,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no pe rsona (%{public}@ / %{public}@)",  (uint8_t *)&multiuser_flags,  0x34u);
            }

            v119 = 1LL;
          }

          else
          {
            if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
              dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_15);
            }
            if (MCMRequirePersonaAndConvertSystemToPersonal_result
              && v119 != 1
              && [v62 isNoSpecificPersona])
            {
              container_log_handle_for_category();
              int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                [v58 codeSignInfo];
                uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue();
                [v111 identifier];
                char v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCMCommandQuery containerConfig](v11, "containerConfig");
                __int128 v109 = (void *)objc_claimAutoreleasedReturnValue();
                [v109 name];
                uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
                multiuser_flags = 138543874;
                v136 = v73;
                os_signpost_id_t v137 = 2112;
                uint64_t v138 = (uint64_t)v74;
                v139 = 2114;
                v140 = v60;
                _os_log_fault_impl( &dword_188846000,  v64,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona - converting to Personal",  (uint8_t *)&multiuser_flags,  0x20u);
              }

              v119 = 1LL;
              -[MCMCommand context](v11, "context");
              id v65 = (void *)objc_claimAutoreleasedReturnValue();
              [v65 userIdentityCache];
              id v66 = (void *)objc_claimAutoreleasedReturnValue();
              [v62 posixUser];
              id v67 = (void *)objc_claimAutoreleasedReturnValue();
              id v68 = [v66 userIdentityForPersonalPersonaWithPOSIXUser:v67];

              id v58 = v113;
              id v62 = (void *)v68;
              id v11 = v112;
            }
          }

          [v57 objectForKeyedSubscript:v62];
          id v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v69)
          {
            id v69 = (void *)objc_opt_new();
            [v57 setObject:v69 forKeyedSubscript:v62];
          }

          [v57 objectForKeyedSubscript:v62];
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
          [v70 addObject:v60];

          ++v59;
        }

        while (v116 != v59);
        id v116 = [obj countByEnumeratingWithState:&v131 objects:v130 count:16];
      }

      while (v116);
    }

    id v128 = 0u;
    v129 = 0u;
    id v126 = 0u;
    v127 = 0u;
    __int16 v24 = v57;
    id v75 = [v24 countByEnumeratingWithState:&v126 objects:v125 count:16];
    uid_t v12 = v105;
    if (v75)
    {
      id v76 = v75;
      v77 = *(void *)v127;
      do
      {
        for (j = 0LL; j != v76; ++j)
        {
          if (*(void *)v127 != v77) {
            objc_enumerationMutation(v24);
          }
          id v79 = *(void *)(*((void *)&v126 + 1) + 8 * j);
          [v24 objectForKeyedSubscript:v79];
          id v80 = (void *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v81 = (void *)[v80 copy];
          [v7 setObject:v81 forKeyedSubscript:v79];
        }

        id v76 = [v24 countByEnumeratingWithState:&v126 objects:v125 count:16];
      }

      while (v76);
    }

    goto LABEL_16;
  }

  v119 = 1LL;
  if (-[MCMCommandQuery includeUnowned](v11, "includeUnowned"))
  {
    -[MCMCommandQuery identifiers](v11, "identifiers");
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 anyObject];
    id v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[MCMCommand context](v11, "context");
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 clientIdentity];
    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
    [v82 codeSignInfo];
    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
    [v83 identifier];
    id v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[MCMCommand context](v11, "context");
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  [v84 userIdentityCache];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [v85 userIdentityForPersonalPersona];
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[MCMCommandQuery containerConfig](v11, "containerConfig");
    id v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:]( MCMXPCMessageBase,  "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:",  v44,  v113,  [v87 containerClass],  &v119);
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
    }
    if (MCMRequirePersonaTelemetryOnly_result && v119 != 1 && [v88 isNoSpecificPersona])
    {
      container_log_handle_for_category();
      id v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        [v113 codeSignInfo];
        id v117 = (void *)objc_claimAutoreleasedReturnValue();
        [v117 identifier];
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCommandQuery containerConfig](v11, "containerConfig");
        id v99 = (void *)objc_claimAutoreleasedReturnValue();
        [v99 name];
        v106 = v12;
        __int16 v100 = (void *)objc_claimAutoreleasedReturnValue();
        multiuser_flags = 138544386;
        v136 = v98;
        os_signpost_id_t v137 = 2112;
        uint64_t v138 = (uint64_t)v100;
        v139 = 2114;
        v140 = v44;
        v141 = 2114;
        v142 = v113;
        v143 = 2114;
        v144 = v88;
        _os_log_fault_impl( &dword_188846000,  v89,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona (%{public}@ / %{public}@)",  (uint8_t *)&multiuser_flags,  0x34u);

        uid_t v12 = v106;
      }

      v119 = 1LL;
    }

    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_15);
      }
      if (MCMRequirePersonaAndConvertSystemToPersonal_result
        && v119 != 1
        && [v88 isNoSpecificPersona])
      {
        container_log_handle_for_category();
        uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
        {
          [v113 codeSignInfo];
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          [v118 identifier];
          id v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandQuery containerConfig](v11, "containerConfig");
          __int16 v102 = v12;
          id v103 = (void *)objc_claimAutoreleasedReturnValue();
          [v103 name];
          __int16 v104 = (void *)objc_claimAutoreleasedReturnValue();
          multiuser_flags = 138543874;
          v136 = v101;
          os_signpost_id_t v137 = 2112;
          uint64_t v138 = (uint64_t)v104;
          v139 = 2114;
          v140 = v44;
          _os_log_fault_impl( &dword_188846000,  v90,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no person a - converting to Personal",  (uint8_t *)&multiuser_flags,  0x20u);

          uid_t v12 = v102;
        }

        v119 = 1LL;
        -[MCMCommand context](v11, "context");
        __int16 v91 = (void *)objc_claimAutoreleasedReturnValue();
        [v91 userIdentityCache];
        uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
        [v88 posixUser];
        __int16 v93 = (void *)objc_claimAutoreleasedReturnValue();
        int v94 = [v92 userIdentityForPersonalPersonaWithPOSIXUser:v93];

        v88 = (void *)v94;
      }
    }
  }

  else
  {
    v88 = v86;
  }

  [v7 setObject:v6 forKeyedSubscript:v88];

LABEL_17:
  char v29 = (void *)[v7 copy];

  return v29;
}

        if (!v16) {
          goto LABEL_22;
        }
        if (v12)
        {
LABEL_21:
          int v21 = (void *)[v16 mutableCopy];
          [v21 unionSet:v12];
          __int16 v22 = [v21 copy];

          uid_t v12 = (void *)v22;
LABEL_22:
          if (v12)
          {
            id v14 = 0;
            id v13 = 0LL;
            goto LABEL_25;
          }

  return v12;
}

  return v13;
}

  return v18;
}

  return v27;
}

      +[MCMCommandContext privileged](&OBJC_CLASS___MCMCommandContext, "privileged");
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 containerFactory];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      id v63 = v19;
      __int128 v26 = [v25 deleteURL:v17 forUserIdentity:0 error:&v63];
      id v14 = v63;

      if ((v26 & 1) == 0)
      {
        container_log_handle_for_category();
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          [v17 path];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138412546;
          id v68 = v49;
          id v69 = 2112;
          uint64_t v70 = v14;
          _os_log_error_impl( &dword_188846000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to remove replace file at %@; error = %@",
            buf,
            0x16u);
        }

        uid_t v12 = v60;
LABEL_39:
        id v8 = v55;
        id v5 = v56;
        dispatch_queue_t v9 = v54;

        v40 = 0;
        goto LABEL_47;
      }

      ++v16;
    }

    while (v62 != v16);
    os_signpost_id_t v38 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v74,  v73,  16LL);
    id v62 = v38;
  }

  while (v38);

  if ((v57 & 1) != 0)
  {
    id v5 = v56;
    [v56 containerCache];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s flush](v13, "flush");
    dispatch_queue_t v9 = v54;
    id v8 = v55;
    uid_t v12 = v60;
    id v11 = v52;
    a4 = v53;
LABEL_44:

    if (!a4) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  id v8 = v55;
  id v5 = v56;
  a4 = v53;
  dispatch_queue_t v9 = v54;
  uid_t v12 = v60;
  id v11 = v52;
  if (v53) {
    goto LABEL_45;
  }
LABEL_46:
  v40 = 1;
  id v13 = (os_log_s *)v11;
LABEL_47:

  return v40;
}

LABEL_14:
  return v13;
}

    dispatch_queue_t v9 = 0;
    goto LABEL_15;
  }

  dispatch_queue_t v9 = v3[2](v3, v15);
LABEL_15:
  if (v15) {
    (*(void (**)(void))(*(void *)v5 + 32LL))();
  }

  return v9;
}

  __int16 v22 = 0LL;
LABEL_15:

  if (a3) {
    *a3 = v14;
  }
  uint64_t v23 = v22;

  _Block_object_dispose(&v33, 8);
  return v23;
}

    goto LABEL_15;
  }

  dispatch_queue_t v17 = (void *)v16;
  if (v12)
  {
    uint64_t v18 = [v9 userIdentityForPersonaUniqueString:v12 POSIXUser:v16];
    if (v18)
    {
      int v19 = (MCMUserIdentity *)v18;
      goto LABEL_18;
    }
  }

  [v9 userIdentityForPersonalPersonaWithPOSIXUser:v17];
  int v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  __int16 v22 = 1LL;
  if (!a5) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v19) {
    *a5 = v22;
  }
LABEL_18:

  return v19;
}

  return v15;
}

  return v9;
}

  return v13;
}

        homeDirectoryURL = v18;
        uint64_t v18 = 0LL;
LABEL_15:

        goto LABEL_16;
      }

      container_log_handle_for_category();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      *(_WORD *)__int128 buf = 0;
      __int16 v24 = "Attempted to create a class path with no userIdentity.";
    }

    else
    {
      container_log_handle_for_category();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      *(_WORD *)__int128 buf = 0;
      __int16 v24 = "Attempted to create a class path with no baseURL.";
    }

    _os_log_fault_impl(&dword_188846000, v22, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_14;
  }

  id v15 = v11;
  id v16 = v13;
  result.tv_nsec = v16;
  result.tv_sec = v15;
  return result;
}

LABEL_8:
  if (a5 && !v13) {
    *a5 = v14;
  }
  id v15 = v13;

  return v15;
}

    dispatch_queue_t v9 = (void *)v15;

    id v11 = 0;
    goto LABEL_9;
  }

  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_113;
  v37[3] = &unk_18A29E6D8;
  os_signpost_id_t v38 = 0LL;
  __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_113((uint64_t)v37);
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v38;
LABEL_3:

  id v11 = 0;
  if (!a6) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v11) {
    *a6 = v9;
  }
LABEL_12:

  return v11;
}

  objc_msgSend(*(id *)(a1 + 40), "completeWithResult:", v13, v13);
}

  return v10;
}

  container_log_handle_for_category();
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v48 = v18;
    __int16 v20 = v15;
    if ((_DWORD)v16) {
      int v21 = @"Fetched";
    }
    else {
      int v21 = @"Created";
    }
    -[MCMCommand context](v2, "context");
    int v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 clientIdentity];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 codeSignInfo];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 identifier];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    v49 = v16;
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 identifier];
    __int128 v26 = v2;
    uint64_t v27 = v17;
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138544130;
    *(void *)uint64_t v55 = v21;
    id v15 = v20;
    uint64_t v18 = v48;
    *(_WORD *)&v55[8] = 2114;
    v56 = (uint64_t)v24;
    id v57 = 2114;
    id v58 = v28;
    os_signpost_id_t v59 = 2112;
    v60 = (const char *)v15;
    _os_log_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ primordial container for '%{public}@' with identifier '%{public}@': error = %@",  buf,  0x2Au);

    dispatch_queue_t v17 = v27;
    id v2 = v26;

    id v16 = v49;
  }

  char v29 = objc_alloc(&OBJC_CLASS___MCMResultWithURLBase);
  if (v18) {
    id v30 = -[MCMResultWithURLBase initWithURL:existed:sandboxToken:]( v29,  "initWithURL:existed:sandboxToken:",  v18,  v16,  0LL);
  }
  else {
    id v30 = -[MCMResultBase initWithError:](v29, "initWithError:", v15);
  }
  uint64_t v41 = (void *)v30;
  -[MCMCommand resultPromise](v2, "resultPromise");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 completeWithResult:v41];

  objc_autoreleasePoolPop(context);
}

    if (v23)
    {
      v123 = 0u;
      os_signpost_id_t v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      __int16 v24 = v23;
      id v25 = [v24 countByEnumeratingWithState:&v121 objects:v120 count:16];
      if (v25)
      {
        __int128 v26 = v25;
        uint64_t v27 = *(void *)v122;
        do
        {
          for (uint64_t i = 0LL; i != v26; ++i)
          {
            if (*(void *)v122 != v27) {
              objc_enumerationMutation(v24);
            }
            [v7 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v121 + 1) + 8 * i)];
          }

          __int128 v26 = [v24 countByEnumeratingWithState:&v121 objects:v120 count:16];
        }

        while (v26);
      }

  v34 = 0LL;
LABEL_9:
  [v13 uuid];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 containerPath];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 containerPathIdentifier];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 identifier];
  int v32 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = [v13 containerClass];
  [v13 userIdentity];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 posixUser];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 userIdentity];
  dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 personaUniqueString];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v13 existed];
  id v31 = v11;
  if (v11)
  {
    [v13 containerPath];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 containerDataURL];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_16;
    }
  }

  else
  {
    __int16 v20 = 0LL;
    if (!v10) {
      goto LABEL_16;
    }
  }

  if ([v13 conformsToProtocol:&unk_18C735DA0])
  {
    [v13 info];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = 1;
    goto LABEL_17;
  }

  BOOL v10 = 0;
LABEL_16:
  int v21 = 0LL;
LABEL_17:
  LOBYTE(v25) = [v13 transient];
  LOBYTE(v24) = v19;
  __int16 v22 =  -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:]( self,  "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:ex isted:url:info:transient:userManagedAssetsRelPath:creator:",  v28,  v33,  v32,  v14,  v16,  v18,  a4,  v24,  v20,  v21,  v25,  v35,  v34);
  if (v10) {

  }
  if (v31)
  {
  }

  return v22;
}

      uint64_t v23 = 0;
      goto LABEL_27;
    }

    container_log_handle_for_category();
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      os_signpost_id_t v38 = v13;
      int v39 = 2112;
      v40 = v8;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to materialize identity from manifest; error = %@, url = [%@]",
        buf,
        0x16u);
    }

    id v14 = 0LL;
LABEL_25:

    if (a5) {
      goto LABEL_26;
    }
    goto LABEL_8;
  }

  id v33 = a5;
  [v12 concreteContainerIdentity];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = containermanager_copy_global_configuration();
  id v16 = [v14 containerClass];
  [v14 userIdentity];
  dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 posixUser];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v15 dispositionForContainerClass:v16 forUser:v18] != 1)
  {

LABEL_10:
    uint64_t v23 = 1;
    goto LABEL_27;
  }

  int v32 = v8;
  int v19 = v9;
  [v12 readURL];
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 writeURL];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    container_log_handle_for_category();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v9 = v19;
    id v8 = v32;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [v12 writeURL];
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      os_signpost_id_t v38 = v32;
      int v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_188846000, v25, OS_LOG_TYPE_DEFAULT, "Migrating delete manifest [%@] --> [%@]", buf, 0x16u);
    }

    id v35 = v13;
    [v12 deleteManifestAfterWritingUsingLibraryRepairForUser:v9 error:&v35];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = v35;

    if (v27)
    {
      v34 = v28;
      [v12 deleteManifestAfterRemovingUsingLibraryRepairForUser:v9 error:&v34];
      char v29 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = v34;

      if (v29)
      {

        goto LABEL_10;
      }

      container_log_handle_for_category();
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412546;
        os_signpost_id_t v38 = v32;
        int v39 = 2112;
        v40 = v13;
        _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to remove delete manifest at old location [%@], error = %@",  buf,  0x16u);
      }
    }

    else
    {
      container_log_handle_for_category();
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        [v12 writeURL];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412546;
        os_signpost_id_t v38 = v31;
        int v39 = 2112;
        v40 = v28;
        _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to write delete manifest at new location [%@], error = %@",  buf,  0x16u);
      }

      id v13 = v28;
    }

    a5 = v33;
    goto LABEL_25;
  }

  uint64_t v23 = 1;
  dispatch_queue_t v9 = v19;
  id v8 = v32;
LABEL_27:

  return v23;
}

LABEL_19:
  return v14;
}

      a4 = v23;
      id v5 = v24;
    }

    else
    {
      id v11 = 0LL;
    }

    if (a4) {
      goto LABEL_22;
    }
  }

  else
  {

    container_log_handle_for_category();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v28 = v22;
      char v29 = 2112;
      id v30 = v5;
      _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Team ID container ID map is not in a valid format; expected = NSDictionary, got = %@, value = %@",
        buf,
        0x16u);
    }

    id v11 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  149LL,  3LL);
    id v6 = 0LL;
    if (a4)
    {
LABEL_22:
      if (!v6) {
        *a4 = v11;
      }
    }
  }

    uint64_t v23 = 0LL;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  container_log_handle_for_category();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v17 = a1[6];
    id v16 = a1[7];
    *(_DWORD *)__int128 buf = 138412546;
    v45 = v16;
    id v46 = 2112;
    int v47 = v17;
    _os_log_impl( &dword_188846000,  v15,  OS_LOG_TYPE_INFO,  "not moving: [%@] because it is a symlink to [%@]",  buf,  0x16u);
  }

LABEL_12:
  uint64_t v23 = 1LL;
LABEL_23:
  _Block_object_dispose(&v38, 8);

  return v23;
}

  __int16 v20 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultQuery), "initWithError:", v8);
LABEL_21:
  -[MCMCommand resultPromise](self, "resultPromise");
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 completeWithResult:v20];
}

  return v7;
}

void sub_188866F98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

LABEL_24:
  return v21;
}

  int v19 = (void *)[v6 copy];

  return v19;
}
}

          id v13 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);
          id v14 = 0;
          uid_t v12 = 0LL;
          goto LABEL_25;
        }

  if ((explicitFlags & 0x10) == 0)
  {
    id v28 = 1;
    if ((explicitFlags & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  [v9 clientIdentity];
  int v36 = (void *)objc_claimAutoreleasedReturnValue();
  int v37 = [v36 userIdentity];
  os_signpost_id_t v38 = v10->_userIdentity;
  v10->_userIdentity = (MCMUserIdentity *)v37;

  string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v40 = 0LL;
  }

  [NSString stringWithUTF8String:*MEMORY[0x1895F8378]];
  id v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = [v40 isEqualToString:v44];

  id v28 = v45;
  if ((v45 & 1) == 0)
  {
    if (v40)
    {
      -[MCMXPCMessageWithContainerClassBase containerConfig](v10, "containerConfig");
      id v46 = (void *)objc_claimAutoreleasedReturnValue();
      int v47 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  [v46 containerClass]);

      if (v47)
      {
        [v9 clientIdentity];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[MCMXPCMessageBase userIdentityFromClientPersonaUniqueString:clientIdentity:error:]( v10,  "userIdentityFromClientPersonaUniqueString:clientIdentity:error:",  v40,  v48,  &v79);
        id v50 = v10->_userIdentity;
        v10->_userIdentity = (MCMUserIdentity *)v49;
      }
    }
  }

  uint64_t v51 = v10->_userIdentity;

  if (v51)
  {
    explicitFlags = v10->_explicitFlags;
    if ((explicitFlags & 0x20) == 0)
    {
LABEL_27:
      if ((explicitFlags & 0x40) != 0)
      {
        v10->_includeUnowned = xpc_dictionary_get_BOOL(v8, "IncludeUnowned");
        if ((v10->_explicitFlags & 0x80) == 0) {
          goto LABEL_66;
        }
      }

      else if ((explicitFlags & 0x80) == 0)
      {
        goto LABEL_66;
      }

      uuid = xpc_dictionary_get_uuid(v8, "UUID");
      if (uuid)
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
        internalUUID = v10->_internalUUID;
        v10->_internalUUID = (NSUUID *)v42;
      }

      if (!v10->_internalUUID)
      {
        container_log_handle_for_category();
        id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl(&dword_188846000, v61, OS_LOG_TYPE_ERROR, "Invalid UUID parameter", buf, 2u);
        }

        int v19 = 38LL;
        id v79 = 38LL;
        if (!v20) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
}

  return v11;
}

LABEL_47:
      goto LABEL_17;
    }

  return v46;
}

LABEL_31:
    int v47 = -[MCMFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v7,  0LL);
    if (v47)
    {
      id v35 = (void *)v47;
      v48 = -[MCMFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v6,  1LL);
      if (!v48)
      {
        container_log_handle_for_category();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          [v6 path];
          id v71 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138412290;
          id v87 = v71;
          _os_log_error_impl( &dword_188846000,  v54,  OS_LOG_TYPE_ERROR,  "Failed to retrieve realpath for suspicious path %@",  buf,  0xCu);
        }

        goto LABEL_18;
      }

      int v36 = v48;
      if (v40 != -1)
      {
LABEL_34:
        int v36 = v36;
        int v37 = v36;
        goto LABEL_20;
      }

      [v48 pathComponents];
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 pathComponents];
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = [v83 count];
      uint64_t v84 = v55;
      id v57 = [v55 count];
      if (v57 < 2 || v56 <= 1)
      {
        container_log_handle_for_category();
        id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          [v6 path];
          os_signpost_id_t v81 = (char *)objc_claimAutoreleasedReturnValue();
          [v7 path];
          int v64 = (char *)objc_claimAutoreleasedReturnValue();
          [v36 path];
          id v65 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = [v35 path];
          *(_DWORD *)__int128 buf = 138413058;
          id v87 = v81;
          v88 = 2112;
          id v89 = v64;
          uint64_t v90 = 2112;
          __int16 v91 = v65;
          uint64_t v92 = 2112;
          __int16 v93 = v77;
          id v67 = (void *)v77;
          id v68 = "Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)";
          goto LABEL_69;
        }
      }

      else
      {
        id v58 = v57;
        os_signpost_id_t v59 = 1LL;
        [v83 objectAtIndexedSubscript:1];
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        [v84 objectAtIndexedSubscript:1];
        id v79 = v56;
        id v61 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          id v62 = 1LL;
        }

        if (v79 - v59 <= v58 - v62)
        {
          if (v79 <= v59)
          {
LABEL_63:

            goto LABEL_34;
          }

          while (1)
          {
            [v83 objectAtIndexedSubscript:v59];
            id v69 = (void *)objc_claimAutoreleasedReturnValue();
            [v84 objectAtIndexedSubscript:v62];
            uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v82 = [v69 isEqualToString:v70];

            if ((v82 & 1) == 0) {
              break;
            }
            ++v59;
            ++v62;
            if (v79 == v59) {
              goto LABEL_63;
            }
          }

          char v73 = v62;
          container_log_handle_for_category();
          id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            [v6 path];
            os_signpost_id_t v81 = (char *)objc_claimAutoreleasedReturnValue();
            [v7 path];
            id v80 = (char *)objc_claimAutoreleasedReturnValue();
            [v36 path];
            uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
            [v35 path];
            uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
            [v83 objectAtIndexedSubscript:v59];
            id v75 = (void *)objc_claimAutoreleasedReturnValue();
            [v84 objectAtIndexedSubscript:v73];
            id v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138413570;
            id v87 = v81;
            v88 = 2112;
            id v89 = v80;
            uint64_t v90 = 2112;
            __int16 v91 = v78;
            uint64_t v92 = 2112;
            __int16 v93 = (uint64_t)v74;
            int v94 = 2112;
            uint64_t v95 = v75;
            v96 = 2112;
            uint64_t v97 = v76;
            _os_log_error_impl( &dword_188846000,  v63,  OS_LOG_TYPE_ERROR,  "Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
              buf,
              0x3Eu);

LABEL_70:
          }
        }

        else
        {
          container_log_handle_for_category();
          id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            [v6 path];
            os_signpost_id_t v81 = (char *)objc_claimAutoreleasedReturnValue();
            [v7 path];
            int v64 = (char *)objc_claimAutoreleasedReturnValue();
            [v36 path];
            id v65 = (void *)objc_claimAutoreleasedReturnValue();
            id v66 = [v35 path];
            *(_DWORD *)__int128 buf = 138413058;
            id v87 = v81;
            v88 = 2112;
            id v89 = v64;
            uint64_t v90 = 2112;
            __int16 v91 = v65;
            uint64_t v92 = 2112;
            __int16 v93 = v66;
            id v67 = (void *)v66;
            id v68 = "Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)";
LABEL_69:
            _os_log_error_impl(&dword_188846000, v63, OS_LOG_TYPE_ERROR, v68, buf, 0x2Au);

            goto LABEL_70;
          }
        }
      }

      goto LABEL_19;
    }

    container_log_handle_for_category();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      [v7 path];
      id v50 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      id v87 = v50;
      _os_log_error_impl( &dword_188846000,  v49,  OS_LOG_TYPE_ERROR,  "Failed to retrieve realpath for base path %@ ",  buf,  0xCu);
LABEL_65:

      goto LABEL_47;
    }

    goto LABEL_47;
  }

  container_log_handle_for_category();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    [v7 path];
    __int128 v26 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    id v87 = v26;
    uint64_t v27 = "Failed to retrieve depth of %@";
    goto LABEL_11;
  }

  _Block_object_dispose(&v45, 8);

  return v14;
}

  return v29;
}

LABEL_20:
  return v13;
}

  return v17;
}

    __int16 v20 = 0LL;
  }

    objc_autoreleasePoolPop(v5);
    if (a3)
    {
      dispatch_queue_t v9 = v9;
      uint64_t v27 = 0;
      *a3 = v9;
    }

    else
    {
      uint64_t v27 = 0;
    }

    id v16 = 0LL;
    dispatch_queue_t v17 = 0LL;
    uint64_t v18 = 0LL;
    int v19 = 0LL;
    BOOL v10 = v33;
    id v7 = v32;
    goto LABEL_21;
  }

  [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v63,  v25,  v15,  0LL,  v8,  &v67);
  dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v62 context];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 containerFactory];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v65 = v10;
    [v27 containerForContainerIdentity:v17 createIfNecessary:0 error:&v65];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = v65;

    if (v16)
    {
      id v58 = v7;
      int v64 = v28;
      [v16 metadataWithError:&v64];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = v64;

      if (v18)
      {
        id v57 = objc_alloc((Class)a1);
        [v9 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v56 = -[os_log_s intValue](v14, "intValue");
        [v9 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = [v52 BOOLValue];
        [v9 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v53 = [v55 intValue];
        char v29 = objc_alloc(MEMORY[0x189607AB8]);
        [v9 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        id v31 = (void *)[v29 initWithUUIDString:v30];
        int v19 = (void *)[v57 initWithContainerMetadata:v18 newClass:v56 retryingIfLocked:v54 changeType:v53 internalChangeID:v31 queue:v61 userIdentityCache:v60];
      }

      else
      {
        container_log_handle_for_category();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          [v9 objectForKeyedSubscript:@"MCMDataOperationUserId"];
          int v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = [v47 unsignedIntValue];
          [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
          id v50 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v51 = [v50 unsignedLongLongValue];
          *(_DWORD *)__int128 buf = 67110146;
          *(_DWORD *)id v69 = v48;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v49;
          *(_WORD *)&v69[14] = 2048;
          *(void *)&v69[16] = v51;
          uint64_t v70 = 2048;
          id v71 = v67;
          uint64_t v72 = 2112;
          char v73 = v10;
          _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to get metadata for container from file userId: %u, identifier: %@, Class: %llu : %llu, %@",  buf,  0x30u);
        }

        uint64_t v18 = 0LL;
        int v19 = 0LL;
      }

      id v7 = v58;
      goto LABEL_21;
    }

    BOOL v10 = v28;
    container_log_handle_for_category();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [v9 objectForKeyedSubscript:@"MCMDataOperationUserId"];
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = [v41 unsignedIntValue];
      [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
      uint64_t v43 = v7;
      id v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      id v46 = [v45 unsignedLongLongValue];
      *(_DWORD *)__int128 buf = 67110146;
      *(_DWORD *)id v69 = v42;
      *(_WORD *)&v69[4] = 2112;
      *(void *)&v69[6] = v44;
      *(_WORD *)&v69[14] = 2048;
      *(void *)&v69[16] = v46;
      uint64_t v70 = 2048;
      id v71 = v67;
      uint64_t v72 = 2112;
      char v73 = v10;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to lookup container metadata from file userId: %u, identifier: %@, Class: %llu : %llu, %@",  buf,  0x30u);

      id v7 = v43;
    }

    id v16 = 0LL;
LABEL_7:
    uint64_t v18 = 0LL;
    int v19 = 0LL;
    goto LABEL_21;
  }

  int v36 = objc_alloc(&OBJC_CLASS___MCMError);
  int v37 = -[MCMError initWithErrorType:](v36, "initWithErrorType:", v67);

  container_log_handle_for_category();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v39 = v67;
    uint64_t error_description = container_get_error_description();
    *(_DWORD *)__int128 buf = 134218242;
    *(void *)id v69 = v39;
    *(_WORD *)&v69[8] = 2080;
    *(void *)&v69[10] = error_description;
    _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Could not create user identity; error = (%llu)%s",
      buf,
      0x16u);
  }

  id v16 = 0LL;
  dispatch_queue_t v17 = 0LL;
  uint64_t v18 = 0LL;
  int v19 = 0LL;
  BOOL v10 = (id)v37;
LABEL_21:

  if (a5 && !v19) {
    *a5 = v10;
  }
  v34 = v19;

  return v34;
}

        [MEMORY[0x189604010] set];
        uid_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
    }

    int v19 = (void *)MEMORY[0x189604010];
    [v10 identifier];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setWithObject:v20];
    uid_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }

  [MEMORY[0x189604010] set];
  uid_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  id v14 = 1;
LABEL_26:
  *a4 = v14;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

void sub_18886CCB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_18886CE44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t __Block_byref_object_copy__1031(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1032(uint64_t a1)
{
}

uint64_t _fix_permissions_on_path(const char *a1, const char *a2, char *a3, int *a4)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  char v45 = 0;
  memset(&v49, 0, sizeof(v49));
  int v44 = 0;
  uint64_t v43 = 0LL;
  if (a2)
  {
    size_t v8 = strlen(a2);
    if (strncmp(a1, a2, v8))
    {
      int v44 = 62;
      container_log_handle_for_category();
      dispatch_queue_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)int v47 = a1;
        *(_WORD *)&v47[8] = 2080;
        v48[0] = a2;
        _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Path [%s] does not have accepted path prefix [%s] when trying to fix permissions",  buf,  0x16u);
      }

      uint64_t v10 = 0LL;
      goto LABEL_44;
    }
  }

  if (lstat(a1, &v49))
  {
    int v44 = *__error();
    id v11 = strdup(a1);
    uint64_t v43 = v11;
    uid_t v12 = rindex(v11, 47);
    container_log_handle_for_category();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!v12 || v11 == v12)
    {
      if (v14)
      {
        int v23 = *__error();
        __int16 v24 = __error();
        id v25 = strerror(*v24);
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)int v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v23;
        WORD2(v48[0]) = 2080;
        *(void *)((char *)v48 + 6) = v25;
        int v19 = "Failed to stat [%s] when trying to fix permissions, could not recover: (%d) %s";
        goto LABEL_39;
      }

      goto LABEL_40;
    }

    if (v14)
    {
      int v37 = *__error();
      os_signpost_id_t v38 = __error();
      int v39 = strerror(*v38);
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)int v47 = a1;
      *(_WORD *)&v47[8] = 1024;
      LODWORD(v48[0]) = v37;
      WORD2(v48[0]) = 2080;
      *(void *)((char *)v48 + 6) = v39;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to stat [%s] when trying to fix permissions, attempting to recover: (%d) %s",  buf,  0x1Cu);
    }

    char *v12 = 0;
    if (!_fix_permissions_on_path(v11, a2, &v45, &v44))
    {
      uint64_t v10 = 0LL;
      goto LABEL_42;
    }

    if (lstat(a1, &v49))
    {
      int v15 = *__error();
      int v44 = v15;
      if (v15 != 13 && v15 != 1)
      {
        container_log_handle_for_category();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v40 = *__error();
          uint64_t v41 = __error();
          uint64_t v42 = strerror(*v41);
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)int v47 = a1;
          *(_WORD *)&v47[8] = 1024;
          LODWORD(v48[0]) = v40;
          WORD2(v48[0]) = 2080;
          *(void *)((char *)v48 + 6) = v42;
          _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to stat [%s] when trying to fix permissions, but no longer a permission error: (%d) %s",  buf,  0x1Cu);
        }

        uint64_t v10 = 1LL;
        goto LABEL_41;
      }

      container_log_handle_for_category();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = *__error();
        dispatch_queue_t v17 = __error();
        uint64_t v18 = strerror(*v17);
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)int v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v16;
        WORD2(v48[0]) = 2080;
        *(void *)((char *)v48 + 6) = v18;
        int v19 = "Failed to stat [%s] when trying to fix permissions, gave up: (%d) %s";
LABEL_39:
        _os_log_error_impl(&dword_188846000, v13, OS_LOG_TYPE_ERROR, v19, buf, 0x1Cu);
        goto LABEL_40;
      }

      goto LABEL_40;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  if ((v49.st_flags & 6) == 0)
  {
LABEL_28:
    int v27 = v49.st_mode & 0xF000;
    if (v27 == 40960 || v27 == 0x4000) {
      int v29 = 448;
    }
    else {
      int v29 = 384;
    }
    if ((v49.st_mode & 0x1C0) == v29)
    {
      uint64_t v10 = 1LL;
      goto LABEL_42;
    }

    int v30 = v49.st_mode & 0xFE3F;
    int v31 = v29 | v30;
    if (!lchmod(a1, v29 | v30))
    {
      uint64_t v10 = 1LL;
      char v45 = 1;
      container_log_handle_for_category();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109634;
        *(_DWORD *)int v47 = v49.st_mode;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v31;
        LOWORD(v48[0]) = 2080;
        *(void *)((char *)v48 + 2) = a1;
        _os_log_impl(&dword_188846000, v13, OS_LOG_TYPE_DEFAULT, "lchmod u+rw(x) (0%o → 0%o) on [%s]", buf, 0x18u);
      }

      goto LABEL_41;
    }

    int v44 = *__error();
    container_log_handle_for_category();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    int v32 = *__error();
    id v33 = __error();
    v34 = strerror(*v33);
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)int v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v32;
    WORD2(v48[0]) = 2080;
    *(void *)((char *)v48 + 6) = v34;
    int v19 = "lchmod() for [%s] failed during permissions repair: (%d) %s";
    goto LABEL_39;
  }

  if (!lchflags(a1, v49.st_flags & 0xFFFFFFF9))
  {
    char v45 = 1;
    container_log_handle_for_category();
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)int v47 = a1;
      _os_log_impl(&dword_188846000, v26, OS_LOG_TYPE_DEFAULT, "Unset UF_IMMUTABLE | UF_APPEND on [%s]", buf, 0xCu);
    }

    goto LABEL_28;
  }

  int v44 = *__error();
  container_log_handle_for_category();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v20 = *__error();
    int v21 = __error();
    __int16 v22 = strerror(*v21);
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)int v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v20;
    WORD2(v48[0]) = 2080;
    *(void *)((char *)v48 + 6) = v22;
    int v19 = "Failed to lchflags [%s]: (%d) %s";
    goto LABEL_39;
  }

LABEL_40:
  uint64_t v10 = 0LL;
LABEL_41:

LABEL_42:
  if (v11)
  {
    free(v11);
    memset_s(&v43, 8uLL, 0, 8uLL);
  }

  id v33 = [MEMORY[0x189604010] setWithArray:v21];
  v34 = v10->_groupIdentifiers;
  v10->_groupIdentifiers = (NSSet *)v33;

  int v20 = a5;
  explicitFlags = v10->_explicitFlags;
  dispatch_queue_t v9 = v71;
  if ((explicitFlags & 8) != 0)
  {
LABEL_23:
    v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    explicitFlags = v10->_explicitFlags;
  }

  if (v69)
  {
    int v15 = v15;
    *id v69 = v15;
  }

LABEL_44:
  if (a4 && (v10 & 1) == 0) {
    *a4 = v44;
  }
  char v35 = v10 ^ 1;
  if (!a3) {
    char v35 = 1;
  }
  if ((v35 & 1) == 0) {
    *a3 = v45;
  }
  return v10;
}

  uint64_t v43 = v15;
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(&v68, 8);
  return v43;
}
    }

    else
    {
      container_log_handle_for_category();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v97 = (uint64_t)v79;
        v98 = 2112;
        id v99 = (uint64_t)v21;
        _os_log_error_impl( &dword_188846000,  log,  OS_LOG_TYPE_ERROR,  "Failed to create system container %@: %@",  buf,  0x16u);
      }
    }

    uint64_t v55 = v77;
  }

  else
  {
    container_log_handle_for_category();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = v54;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v97 = v10;
      v98 = 2048;
      id v99 = v93;
      _os_log_error_impl( &dword_188846000,  v54,  OS_LOG_TYPE_ERROR,  "Failed to create container identity %@: %llu",  buf,  0x16u);
    }

    int v21 = 0LL;
    uint64_t v55 = v77;
  }
}

LABEL_7:
  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

  container_log_handle_for_category();
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    int v29 = v9;
    _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Migrating code signing info for %@", buf, 0xCu);
  }

  dispatch_queue_t v17 = (os_log_s *)[v8 mutableCopy];
  [v8 objectForKeyedSubscript:@"Entitlements"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_log_s setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"com.apple.MobileContainerManager.Entitlements");

  int v19 = objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry);
  int v20 = 2LL;
  if ((uint64_t)a5 > 4)
  {
    if (a5 == 5)
    {
      int v20 = 6LL;
      goto LABEL_22;
    }

    if (a5 != 14) {
      goto LABEL_20;
    }
  }

  else if (a5 != 1)
  {
    if (a5 == 3)
    {
      int v20 = 4LL;
      goto LABEL_22;
    }

    uint64_t v10 = (void *)objc_opt_new();
    goto LABEL_8;
  }

  size_t v8 = containermanager_copy_global_configuration();
  dispatch_queue_t v9 = [v8 systemContainerMode];

  if (!v9) {
    goto LABEL_7;
  }
  id v7 = [v6 systemGroupIdentifiers];
LABEL_6:
  uint64_t v10 = (void *)v7;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  return v12;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:6 userInfo:v10];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

  return v14;
}

    BOOL v14 = v16;
    goto LABEL_8;
  }

  int v15 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v13);
  [v11 completeWithResult:v15];
LABEL_8:
}

  if (v12 && v49[3] != 1) {
    ((void (*)(void (**)(id, uint64_t)))v12[2])(v12);
  }

  _Block_object_dispose(&v48, 8);
}

  -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = v15;
  if (!v15)
  {
    int v16 = 0;
    goto LABEL_12;
  }

  if (![v15 count]) {
    goto LABEL_10;
  }
  int v16 = [v14 containsObject:v6];
LABEL_12:

  return v16;
}

  container_log_handle_for_category();
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    int v47 = v11;
    _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Set data protection (start); error = %@", buf, 0xCu);
  }

  if (v12)
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 completeWithResult:v12];
  }

  objc_autoreleasePoolPop(v3);
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

    dispatch_queue_t v17 = v17;
    uint64_t v18 = 0;
    *a7 = v17;
    goto LABEL_10;
  }

  int v16 = (id)[v15 setCacheEntry:0 forIdentifier:v13];
  dispatch_queue_t v17 = 0LL;
  uint64_t v18 = 1;
LABEL_10:
  _Block_object_dispose(&v26, 8);

  return v18;
}

  int v19 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 containerRootURL];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 identifierForURL:v21];
  __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v22
    && (objc_msgSend(v58, "MCM_isEqualToString:caseSensitive:", v22, objc_msgSend(v4, "isCaseSensitive")) & 1) == 0)
  {
    container_log_handle_for_category();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v78 = self;
      id v79 = 2112;
      id v80 = v22;
      _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Cache entry failed verification, identifier doesn't match; cacheEntry = %@, current identifier = %@",
        buf,
        0x16u);
    }

    __int128 v26 = 0LL;
  }

  else
  {
    int v23 = (void *)objc_opt_class();
    -[MCMContainerCacheEntry containerPath](self, "containerPath");
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 containerRootURL];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 UUIDForURL:v25];
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v26
      || (-[MCMContainerCacheEntry uuid](self, "uuid"),
          int v27 = (void *)objc_claimAutoreleasedReturnValue(),
          id v28 = [v27 isEqual:v26],
          v27,
          (v28 & 1) != 0))
    {
      int v29 = (void *)objc_opt_class();
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 containerRootURL];
      int v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 schemaVersionForURL:v31];
      int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = [v33 isEqual:v32];

        if ((v34 & 1) == 0)
        {
          container_log_handle_for_category();
          uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v78 = self;
            id v79 = 2112;
            id v80 = v32;
            _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Cache entry failed verification, schemaVersion doesn't match; cacheEntry = %@, current schemaVersion = %@",
              buf,
              0x16u);
          }

          goto LABEL_30;
        }
      }
      v54 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
      [v54 containerRootURL];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      char v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 containerDataURL];
      int v36 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = [v52 isEqual:v36];

      if ((v51 & 1) == 0)
      {
        id v61 = 0;
        -[MCMContainerCacheEntry containerPath](self, "containerPath");
        int v37 = (void *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v38 = [v37 containerDataURL];
        os_signpost_id_t v59 = 0LL;
        v60 = 0LL;
        uint64_t v53 = [v9 itemAtURL:v38 followSymlinks:0 exists:&v61 isDirectory:0 fsNode:&v60 error:&v59];
        uint64_t v55 = v60;
        int v39 = (os_log_s *)v59;
        int v40 = (void *)v38;
        uint64_t v41 = v39;

        if ((v53 & 1) == 0)
        {
          container_log_handle_for_category();
          uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v78 = self;
            id v79 = 2112;
            id v80 = v41;
            uint64_t v43 = "Cache entry failed verification, could not stat Data subdirectory; cacheEntry = %@, error = [%@]";
            goto LABEL_46;
          }

uint64_t _removefile_error_callback(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int dst = 0;
  if (!removefile_state_get(a1, 5u, &dst))
  {
    if (dst == 2) {
      goto LABEL_15;
    }
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = dst;
      BOOL v14 = strerror(dst);
      v26.st_dev = 136315650;
      *(void *)&v26.st_mode = a2;
      WORD2(v26.st_ino) = 1024;
      *(_DWORD *)((char *)&v26.st_ino + 6) = v13;
      HIWORD(v26.st_uid) = 2080;
      *(void *)&v26.st_gid = v14;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "removefile hit error for [%s]: (%d) %s",  (uint8_t *)&v26,  0x1Cu);
    }

    if ((v7, dst != 13) && dst != 1 || (char v18 = 0, _fix_permissions_on_path(a2, 0LL, &v18, 0LL), !v18))
    {
LABEL_15:
      uint64_t result = 0LL;
      if (!a3) {
        return result;
      }
      goto LABEL_16;
    }

    memset(&v26, 0, sizeof(v26));
    if (lstat(a2, &v26))
    {
      container_log_handle_for_category();
      size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_15;
      }

      int v15 = *__error();
      int v16 = __error();
      dispatch_queue_t v17 = strerror(*v16);
      *(_DWORD *)__int128 buf = 136315650;
      int v21 = a2;
      __int16 v22 = 1024;
      int v23 = v15;
      __int16 v24 = 2080;
      id v25 = v17;
      uid_t v12 = "lstat of [%s] failed when trying to figure out why unlink failed: (%d) %s";
    }

    else
    {
      if ((v26.st_mode & 0xF000) == 0x4000)
      {
        int dst = 35;
        uint64_t result = 2LL;
        if (!a3) {
          return result;
        }
        goto LABEL_16;
      }

      uint64_t result = unlink(a2);
      if (!(_DWORD)result) {
        return result;
      }
      container_log_handle_for_category();
      size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v9 = *__error();
      uint64_t v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)__int128 buf = 136315650;
      int v21 = a2;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2080;
      id v25 = v11;
      uid_t v12 = "unlink of [%s] failed: (%d) %s";
    }

    _os_log_error_impl(&dword_188846000, (os_log_t)v8, OS_LOG_TYPE_ERROR, v12, buf, 0x1Cu);
    goto LABEL_14;
  }

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v26.st_dev = 136315138;
    *(void *)&v26.st_mode = a2;
    _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "removefile hit error for [%s] but we failed to get the error number",  (uint8_t *)&v26,  0xCu);
  }

  uint64_t result = 0LL;
  int dst = 2;
  if (a3)
  {
LABEL_16:
    if (!*a3) {
      *a3 = dst;
    }
  }

  return result;
}

void __containermanager_copy_default_file_manager_block_invoke()
{
  int v0 = objc_alloc_init(&OBJC_CLASS___MCMFileManager);
  id v1 = (void *)gMCMDefaultFileManager;
  gMCMDefaultFileManager = (uint64_t)v0;
}

LABEL_4:
  id v6 = v4[4] == 0LL;
LABEL_7:
  if (self->_type == v4[2] && self->_category == v4[3])
  {
    id v7 = path | v6;
    if (self->_POSIXerrno == *((_DWORD *)v4 + 2)) {
      size_t v8 = v7;
    }
    else {
      size_t v8 = 0;
    }
  }

  else
  {
    size_t v8 = 0;
  }

  return v8;
}

  return v5;
}

LABEL_38:
  container_log_handle_for_category();
  int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMResultBase error](v32, "error");
    os_signpost_id_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v52 = v38;
    _os_log_impl(&dword_188846000, v37, OS_LOG_TYPE_DEFAULT, "References remove; error = %@", buf, 0xCu);
  }

  -[MCMCommand resultPromise](self, "resultPromise");
  int v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 completeWithResult:v32];

  objc_autoreleasePoolPop(v3);
}

        ++v22;
      }

      while (v91 != v22);
      id v65 = [obj countByEnumeratingWithState:&v113 objects:v112 count:16];
      __int16 v91 = v65;
    }

    while (v65);
LABEL_46:

    BOOL v14 = 0;
    uint64_t v10 = 1LL;
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
    uid_t v12 = 0x189604000LL;
  }

  while ((v78 & 1) != 0);
LABEL_54:
  if (v9)
  {
    int v20 = v9;
    id v71 = v77;
    id v68 = v81;
    goto LABEL_56;
  }

  id v67 = 0LL;
  id v66 = 0LL;
  id v71 = v77;
  id v68 = v81;
  if (v77)
  {
LABEL_59:
    if ((v68 & 1) == 0)
    {
      id v66 = v66;
      id v68 = 0;
      *id v71 = v66;
    }
  }

void sub_18887C574(_Unwind_Exception *a1)
{
}

void sub_18887C71C(_Unwind_Exception *a1)
{
}

id containermanager_copy_global_configuration()
{
  if (!_gGlobalConfiguration)
  {
    _os_crash();
    __break(1u);
  }

  return (id)_gGlobalConfiguration;
}

void containermanager_set_global_configuration(id obj)
{
}

void sub_18887F7DC(_Unwind_Exception *a1)
{
}

void sub_18887F8C0(_Unwind_Exception *exception_object)
{
}

void sub_1888819C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

uint64_t __Block_byref_object_copy__2217(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2218(uint64_t a1)
{
}

void sub_1888856D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_188888BE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

LABEL_103:
LABEL_104:
LABEL_105:
        int v15 = v119;
        goto LABEL_52;
      }

LABEL_77:
      goto LABEL_80;
    }

    id v99 = containermanager_copy_global_configuration();
    if ([v99 runmode] == 2)
    {
      id v117 = containermanager_copy_global_configuration();
      [v117 currentUser];
      __int16 v100 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = containermanager_copy_global_configuration();
      [v113 defaultUser];
      id v101 = (void *)objc_claimAutoreleasedReturnValue();
      id v115 = [v100 isEqual:v101];

      if (v115)
      {
        container_log_handle_for_category();
        __int16 v102 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v128 = (unint64_t)v32;
          v129 = 2048;
          *(void *)uint64_t v130 = a6;
          _os_log_impl( &dword_188846000,  v102,  OS_LOG_TYPE_DEFAULT,  "Could not reconstruct user identity from metadata for [%@(%llu)], assuming the current user identity.",  buf,  0x16u);
        }

        uint64_t v41 = v122;
        goto LABEL_67;
      }
    }

    else
    {
    }

    id v103 = objc_alloc(&OBJC_CLASS___MCMError);
    [v121 path];
    __int16 v104 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v103,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v104,  0LL);

    container_log_handle_for_category();
    id v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];
      __int128 v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412802;
      id v128 = (unint64_t)v109;
      v129 = 2112;
      *(void *)uint64_t v130 = v32;
      *(_WORD *)&v130[8] = 2048;
      *(void *)&v130[10] = v126;
      _os_log_error_impl( &dword_188846000,  v105,  OS_LOG_TYPE_ERROR,  "Invalid metadata User Identity: %@ for %@: %llu",  buf,  0x20u);
    }

    uint64_t v41 = 0LL;
    goto LABEL_103;
  }

  if ([v40 usesGlobalBundleUserIdentity])
  {
    id v75 = [v123 globalBundleUserIdentity];
  }

  else
  {
    else {
    id v75 = [v123 defaultUserIdentity];
    }
  }

  uint64_t v41 = (id)v75;
LABEL_80:
  -[MCMContainerPath containerClassPath](self->_containerPath, "containerClassPath");
  id v89 = (void *)objc_claimAutoreleasedReturnValue();
  [v89 setExists:1];

  -[MCMContainerPath setExists:](self->_containerPath, "setExists:", 1LL);
  v125 = 1LL;
  LOBYTE(v89) = [v119 transient];
  [v119 containerPathIdentifier];
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v110) = (_BYTE)v89;
  LOBYTE(v110) = 1;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient :userIdentityCache:error:",  v42,  v41,  v32,  v40,  0LL,  v90,  v110,  v123,  &v125);
  __int16 v91 = (MCMConcreteContainerIdentityForLibsystem *)objc_claimAutoreleasedReturnValue();
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v91;

  if (!self->_containerIdentity)
  {
    v96 = objc_alloc(&OBJC_CLASS___MCMError);
    [v121 path];
    uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v96,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v97,  0LL);

    container_log_handle_for_category();
    int v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134217984;
      id v128 = v125;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Could not create container identity: %llu",  buf,  0xCu);
    }

    goto LABEL_105;
  }

  [v14 objectForKeyedSubscript:@"MCMMetadataSchemaVersion"];
  __int16 v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  int v94 = v93;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v95 = (NSNumber *)v94;
  }
  else {
    uint64_t v95 = 0LL;
  }
  uint64_t v72 = v123;
  char v73 = v124;

  schemaVersion = self->_schemaVersion;
  self->_schemaVersion = v95;

  if (!self->_schemaVersion) {
    self->_schemaVersion = (NSNumber *)&unk_18A2BDE70;
  }
  __int16 v24 = 0LL;
  id v71 = 1;
  int v15 = v119;
LABEL_56:

  return v71;
}

  ;
}

        v10->_extensionsUseProxiedClient = 1;
        goto LABEL_78;
      }

uint64_t __Block_byref_object_copy__2872(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2873(uint64_t a1)
{
}

LABEL_32:
      int v20 = (id)v38;
LABEL_33:
      if (a10)
      {
        int v20 = v20;
        uint64_t v50 = 0;
        *a10 = v20;
      }

      else
      {
        uint64_t v50 = 0;
      }

      goto LABEL_36;
    }
  }

  self->_dataProtectionClass = -1;
  [v16 objectForKeyedSubscript:@"MCMMetadataActiveDPClass"];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  uint64_t v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v44 = v43;
  }
  else {
    int v44 = 0LL;
  }

  if (v44)
  {
    self->_dataProtectionClass = [v44 intValue];
  }

  else
  {
    [v17 containerClassPath];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    stat v49 = [v48 supportsDataProtection];

    if (v49) {
      self->_dataProtectionClass = 0;
    }
  }

  uint64_t v50 = 1;
LABEL_36:

  return v50;
}

  int v40 = v13;
  BOOL v14 = v21;
  uint64_t v41 = v72;
LABEL_33:
  container_log_handle_for_category();
  id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v82 = v14;
    _os_log_impl(&dword_188846000, v63, OS_LOG_TYPE_DEFAULT, "Recreate container structure; error = %@", buf, 0xCu);
  }

  int v64 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v14);
  -[MCMCommand resultPromise](v71, "resultPromise");
  id v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 completeWithResult:v64];

  objc_autoreleasePoolPop(v3);
}

  _Block_object_dispose(&v50, 8);
  return v34;
}

void sub_18888BD18(_Unwind_Exception *a1)
{
}

void sub_18888C434( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

LABEL_12:
  uint64_t v53 = 0u;
  v54 = 0u;
  uint64_t v51 = 0u;
  uint64_t v52 = 0u;
  id obj = v6;
  v34 = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
  if (v34)
  {
    id v33 = *(void *)v52;
    do
    {
      dispatch_queue_t v17 = 0LL;
      do
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(obj);
        }
        char v35 = v17;
        char v18 = *(void **)(*((void *)&v51 + 1) + 8 * v17);
        id v46 = 0u;
        int v47 = 0u;
        v48 = 0u;
        stat v49 = 0u;
        v44[0] = objc_opt_class();
        v44[1] = objc_opt_class();
        [MEMORY[0x189603F18] arrayWithObjects:v44 count:2];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = [v19 countByEnumeratingWithState:&v46 objects:v45 count:16];
        if (v20)
        {
          int v21 = v20;
          __int16 v22 = *(void *)v47;
          do
          {
            for (uint64_t i = 0LL; i != v21; ++i)
            {
              if (*(void *)v47 != v22) {
                objc_enumerationMutation(v19);
              }
              __int16 v24 = *(objc_class **)(*((void *)&v46 + 1) + 8 * i);
              [a1[5] containerClassPathForUserIdentity:v18 containerConfig:v3 typeClass:v24];
              id v25 = (void *)objc_claimAutoreleasedReturnValue();
              stat v26 = v25;
              if (v25)
              {
                [v25 classURL];
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v27 path];
                id v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v28 stringByAppendingString:@"/"];
                int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                uint64_t v3 = v37;
                [a1[6] setObject:v26 forKeyedSubscript:v29];
              }

              else
              {
                container_log_handle_for_category();
                int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  [v18 shortDescription];
                  int v36 = (void *)objc_claimAutoreleasedReturnValue();
                  int v30 = [v3 containerClass];
                  NSStringFromClass(v24);
                  int v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)__int128 buf = 138412802;
                  int v39 = v36;
                  int v40 = 2048;
                  uint64_t v41 = v30;
                  uint64_t v3 = v37;
                  uint64_t v42 = 2112;
                  uint64_t v43 = v31;
                  _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Could not fetch a class path; userIdentity = %@, class = %llu, type = %@",
                    buf,
                    0x20u);
                }
              }
            }

            int v21 = [v19 countByEnumeratingWithState:&v46 objects:v45 count:16];
          }

          while (v21);
        }

        dispatch_queue_t v17 = v35 + 1;
      }

      while (v35 + 1 != v34);
      v34 = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
    }

    while (v34);
  }
}

      -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 concreteContainerIdentity];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 isEqualToContainerIdentity:v10])
      {
        -[MCMDeleteManifest readURL](self, "readURL");
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 readURL];
        uid_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v11 isEqual:v12])
        {
          -[MCMDeleteManifest writeURL](self, "writeURL");
          int v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 writeURL];
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
          id v7 = [v13 isEqual:v14];
        }

        else
        {
          id v7 = 0;
        }
      }

      else
      {
        id v7 = 0;
      }

      goto LABEL_19;
    }

    [v5 readURL];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
    }

    if (!v9) {
      goto LABEL_12;
    }
  }

  id v7 = 0;
LABEL_20:

  return v7;
}

    uint64_t v3 = (id)MEMORY[0x189604A58];
    id v5 = MEMORY[0x189604A58];
    return v3;
  }

  id v2 = (void *)MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition;
LABEL_10:
  uint64_t v3 = v2;
  return v3;
}

  return v10;
}

  __int16 v24 = objc_alloc(&OBJC_CLASS___MCMError);
  id v25 = 96LL;
LABEL_34:
  id v46 = -[MCMError initWithErrorType:](v24, "initWithErrorType:", v25);
  int v47 = self->_error;
  self->_error = v46;

LABEL_35:
  if ((v5 & 0x8000000000000000LL) == 0) {
    sandbox_extension_release();
  }
LABEL_37:
}

LABEL_41:
  __int16 v24 = 0LL;
LABEL_15:
  container_log_handle_for_category();
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v92 = v24;
    __int16 v93 = 2112;
    int v94 = (uint64_t)v18;
    _os_log_impl(&dword_188846000, v27, OS_LOG_TYPE_DEFAULT, "Stage shared content result: %@, error = %@", buf, 0x16u);
  }

  id v28 = objc_alloc(&OBJC_CLASS___MCMResultWithURLBase);
  if (v24) {
    int v29 = -[MCMResultWithURLBase initWithURL:existed:sandboxToken:]( v28,  "initWithURL:existed:sandboxToken:",  v24,  1LL,  0LL);
  }
  else {
    int v29 = -[MCMResultBase initWithError:](v28, "initWithError:", v18);
  }
  int v30 = (void *)v29;
  -[MCMCommand resultPromise](self, "resultPromise");
  int v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 completeWithResult:v30];

  objc_autoreleasePoolPop(context);
}

        objc_autoreleasePoolPop(v14);
        ++v12;
      }

      while (v11 != v12);
      uint64_t v42 = [v8 countByEnumeratingWithState:&v62 objects:v61 count:16];
      id v11 = v42;
    }

    while (v42);
  }
}

          goto LABEL_30;
        }

        if (v61 && (![v55 isDirectory] || objc_msgSend(v55, "isSymlink")))
        {
          container_log_handle_for_category();
          uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v78 = self;
            id v79 = 2112;
            id v80 = (os_log_s *)v55;
            uint64_t v43 = "Cache entry failed verification, Data subdirectory doesn't target expectation; cacheEntry = %@, node = %@";
LABEL_46:
            _os_log_error_impl(&dword_188846000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
            goto LABEL_41;
          }

          goto LABEL_41;
        }
      }

      -[MCMContainerCacheEntry setFsNode:](self, "setFsNode:", v68[5]);
      v48 = 1;
      goto LABEL_31;
    }

    container_log_handle_for_category();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v78 = self;
      id v79 = 2112;
      id v80 = v26;
      _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Cache entry failed verification, UUID doesn't match; cacheEntry = %@, current uuid = %@",
        buf,
        0x16u);
    }
  }

  int v32 = 0LL;
LABEL_30:

  -[MCMContainerCacheEntry setCorrupt:](self, "setCorrupt:", 1LL);
  v48 = 0;
LABEL_31:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v48;
}

LABEL_30:
      if (a5) {
        *a5 = v23;
      }

      uint64_t v10 = 0LL;
      goto LABEL_33;
    }

    goto LABEL_28;
  }

  uint64_t v27 = 0LL;
LABEL_32:

  return v27;
}

LABEL_34:
  return v10;
}

LABEL_26:
  }
}

  stat v26 = v30;
LABEL_27:
  uid_t v12 = v34;
LABEL_28:

  int v30 = v26;
  v34 = v12;
LABEL_29:
  container_log_handle_for_category();
  char v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommandDeleteUserManagedAsset sourceRelativePath](self, "sourceRelativePath");
    id v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    int v64 = (uint64_t)v46;
    id v65 = 2112;
    id v66 = v34;
    _os_log_impl(&dword_188846000, v45, OS_LOG_TYPE_DEFAULT, "Delete user managed asset [%@], error = %@", buf, 0x16u);
  }

  int v47 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v34);
  v48 = -[MCMCommand resultPromise](self, "resultPromise");
  [v48 completeWithResult:v47];

  objc_autoreleasePoolPop(context);
}

    v10->_transient = xpc_dictionary_get_BOOL(v8, "Transient");
    explicitFlags = v10->_explicitFlags;
    goto LABEL_27;
  }

          int v23 = 0;
          goto LABEL_27;
        }

        id v25 = [v10 personaType];
LABEL_25:
        int v16 = 0LL;
        if (!v25) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }

      if (a6 == 7)
      {
        int v16 = 0LL;
        goto LABEL_30;
      }
    }

    id v25 = [v10 isDataSeparated];
    goto LABEL_25;
  }

  LOBYTE(v23) = 0;
LABEL_32:

  return v23;
}

  char v35 = v26;
  return v35;
}

void sub_18888FF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_188891410( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_188891640( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t __Block_byref_object_copy__3495(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3496(uint64_t a1)
{
}

void sub_1888939A4(_Unwind_Exception *a1)
{
}

void sub_188893A74(_Unwind_Exception *a1)
{
}

void sub_188894368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_28:
          id v25 = (os_log_s *)v22;
LABEL_29:

          int v9 = v40;
          id v6 = v41;
          goto LABEL_30;
        }

        id v25 = 0LL;
LABEL_30:

LABEL_31:
LABEL_32:

        objc_autoreleasePoolPop(v12);
        ++v10;
      }

      while (v8 != v10);
      v34 = [v6 countByEnumeratingWithState:&v57 objects:v56 count:16];
      size_t v8 = v34;
    }

    while (v34);
  }
}

  return v18;
}

  if (v15)
  {
LABEL_31:

    uid_t v12 = 0LL;
    if (a6) {
      *a6 = v15;
    }
  }

  if (a3)
  {
    int v21 = v21;
    int v29 = 0;
    *a3 = v21;
  }

  else
  {
    int v29 = 0;
  }

void sub_1888952E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

LABEL_33:
                id v33 = 0LL;
              }

  return v19;
}

  os_signpost_id_t v38 = 1;
LABEL_43:
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  return v38;
}

  return v21;
}

  int v40 = v12;

  return v40;
}

    __int16 v24 = objc_alloc(&OBJC_CLASS___MCMError);
    id v25 = v59;
    goto LABEL_34;
  }

    if (a5)
    {
      uint64_t v15 = v15;
      int v30 = 0;
      int v29 = 0LL;
      *a5 = v15;
    }

    else
    {
      int v30 = 0;
      int v29 = 0LL;
    }

void sub_1888962EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

LABEL_83:
  return v33;
}

void sub_188898394(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1888983A0LL);
}

void sub_188898AA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_188898BCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_188898D54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

LABEL_23:
        id v25 = 40LL;
        goto LABEL_24;
      }
    }

    stat v26 = objc_alloc(&OBJC_CLASS___MCMError);
    goto LABEL_23;
  }

  _Block_object_dispose(&v59, 8);
  return v21;
}

    return v27;
  }

  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

    uint64_t v17 = 0LL;
    int v31 = 0;
    stat v26 = 0LL;
    __int16 v24 = 0LL;
    int v32 = 0LL;
    id v62 = 0LL;
    id v63 = 0LL;
    int v19 = 0LL;
LABEL_28:
    char v35 = 0;
    goto LABEL_29;
  }

  identifier = container_get_identifier();
  if (!identifier)
  {
    container_log_handle_for_category();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 path];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      char v73 = v52;
      _os_log_fault_impl( &dword_188846000,  v30,  OS_LOG_TYPE_FAULT,  "[%@] produced a container object with a NULL identifier.",  buf,  0xCu);
    }

    int v31 = 0;
    stat v26 = 0LL;
    __int16 v24 = 0LL;
    int v32 = 0LL;
    id v62 = 0LL;
    id v63 = 0LL;
    int v19 = 0LL;
    goto LABEL_27;
  }

  [NSString stringWithUTF8String:identifier];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:container_object_get_uuid()];
  path = container_object_get_path();
  id v62 = (void *)v20;
  if (!path)
  {
    container_log_handle_for_category();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v55 path];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      char v73 = v56;
      _os_log_fault_impl( &dword_188846000,  v34,  OS_LOG_TYPE_FAULT,  "[%@] produced a container object with a NULL path.",  buf,  0xCu);
    }

    int v31 = 0;
    stat v26 = 0LL;
    __int16 v24 = 0LL;
    int v32 = 0LL;
    id v63 = 0LL;
LABEL_27:
    uint64_t v27 = 0LL;
    goto LABEL_28;
  }

  __int16 v22 = [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
  id v61 = container_get_class();
  int v23 = MEMORY[0x1895CDDF0](v17);
  id v63 = (void *)v22;
  if (v23)
  {
    [NSString stringWithUTF8String:v23];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    persona_unique_string = container_get_persona_unique_string();
    if (persona_unique_string)
    {
      [NSString stringWithUTF8String:persona_unique_string];
      stat v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      stat v26 = 0LL;
    }

    int v32 = v61;
    buf[0] = 0;
    container_is_transient();
    uint64_t v27 = 0LL;
    int v31 = buf[0] != 0;
    char v35 = 1;
  }

  else
  {
    container_log_handle_for_category();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      id v57 = (void *)objc_claimAutoreleasedReturnValue();
      [v57 path];
      id v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      char v73 = v58;
      _os_log_fault_impl( &dword_188846000,  v48,  OS_LOG_TYPE_FAULT,  "[%@] produced a container object with a NULL path identifier.",  buf,  0xCu);
    }

    int v31 = 0;
    stat v26 = 0LL;
    __int16 v24 = 0LL;
    uint64_t v27 = 0LL;
    char v35 = 0;
    int v32 = v61;
  }

  if (a5)
  {
    int v19 = v19;
    *a5 = v19;
  }

  int v20 = 0;
LABEL_26:

  return v20;
}

  __int16 v22 = 0LL;
  int v23 = 0LL;
  __int16 v24 = 0LL;
  id v25 = 0LL;
LABEL_24:

  if (a4)
  {
    uint64_t v10 = v10;
    size_t v8 = 0LL;
    *a4 = v10;
  }

  else
  {
    size_t v8 = 0LL;
  }

  stat v26 = v22;
  uint64_t v27 = v23;
  id v28 = v24;
LABEL_28:
  int v29 = (void *)[v8 copy];

  return v29;
}

LABEL_3:
  [v10 codeSigningInfo];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    [v10 codeSigningInfo];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 rawEntitlements];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v15 isEqualToDictionary:v16];

    if (v17)
    {
LABEL_6:
      char v18 = (void *)objc_opt_new();
      int v19 = 0LL;
      goto LABEL_28;
    }

    container_log_handle_for_category();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      int v39 = v9;
      _os_log_impl( &dword_188846000,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ has changed entitlements. Re-registering.",  buf,  0xCu);
    }
  }

  int v36 = @"com.apple.MobileContainerManager.Entitlements";
  [v8 rawEntitlements];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  int v37 = v28;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0LL;
  -[MCMCodeSigningMapping processCodeSigningInfo:identifier:options:error:]( self,  "processCodeSigningInfo:identifier:options:error:",  v29,  v9,  &unk_18A2BD428,  &v34);
  char v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = (MCMError *)v34;

  if (!a5) {
    goto LABEL_28;
  }
LABEL_26:
  if (v19)
  {
    int v19 = v19;
    *a5 = v19;
  }

  return 1LL;
}

void sub_1888993D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_18889953C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_18889995C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_188899FAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_18889A154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_18889A35C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_18889A490( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_18889A5AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_18889A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_18889AECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_18889AFC8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_18889B160( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_18889B39C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18889B684( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_18889B81C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

uint64_t __Block_byref_object_copy__3872(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3873(uint64_t a1)
{
}

void sub_18889F09C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18889F728( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void _moveSystemContainerIntoPlace(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 lastPathComponent];
  [v7 URLByDeletingLastPathComponent];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 URLByAppendingPathExtension:@"failed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 URLByAppendingPathComponent:v10 isDirectory:1];
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v93 = 1LL;
  id v12 = containermanager_copy_global_configuration();
  [v12 staticConfig];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 configForContainerClass:a2];

  uint64_t v15 = (void *)v14;
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v79 = (void *)v10;
  uint64_t v17 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v9,  v10,  v14,  0LL,  v16,  &v93);

  char v18 = (void *)v17;
  if (v17)
  {
    [v8 containerFactory];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v92 = 0LL;
    [v19 containerForContainerIdentity:v18 createIfNecessary:1 error:&v92];
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v21 = v92;

    uint64_t v78 = v20;
    if (v20)
    {
      -[os_log_s metadataMinimal](v20, "metadataMinimal");
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      os_log_t log = v22;
      -[os_log_s containerPath](v22, "containerPath");
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 containerRootURL];
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        [v7 path];
        id v65 = v18;
        id v66 = (void *)objc_claimAutoreleasedReturnValue();
        [v84 path];
        id v67 = v15;
        id v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v97 = (uint64_t)v79;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v66;
        __int16 v100 = 2112;
        id v101 = v68;
        _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Restoring container for %@ at %@ to %@",  buf,  0x20u);

        uint64_t v15 = v67;
        char v18 = v65;
      }

      id v91 = 0LL;
      [v23 urlsForItemsInDirectoryAtURL:v7 error:&v91];
      stat v26 = (void *)objc_claimAutoreleasedReturnValue();
      id v27 = v91;
      id v75 = v26;
      if (v26 && !v21)
      {
        id v72 = v9;
        id v73 = v8;
        id v74 = v7;
        __int128 v107 = 0u;
        __int128 v108 = 0u;
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        id obj = v26;
        uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v104 count:16];
        uint64_t v70 = v18;
        id v71 = v15;
        if (!v85)
        {
          id v28 = v27;
          goto LABEL_39;
        }

        uint64_t v83 = *(void *)v106;
        os_signpost_id_t v81 = v23;
        id v28 = v27;
        int v29 = &OBJC_CLASS___MCMContainerStagingPath;
        while (1)
        {
          for (uint64_t i = 0LL; i != v85; ++i)
          {
            if (*(void *)v106 != v83) {
              objc_enumerationMutation(obj);
            }
            int v31 = *(void **)(*((void *)&v105 + 1) + 8 * i);
            [v31 lastPathComponent];
            int v32 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = [v84 URLByAppendingPathComponent:v32 isDirectory:0];
            id v90 = v28;
            char v34 = [v23 removeItemAtURL:v33 error:&v90];
            id v35 = v90;

            v86 = (void *)v33;
            if ((v34 & 1) != 0)
            {
              [&v29[11] defaultManager];
              int v36 = (void *)objc_claimAutoreleasedReturnValue();
              id v89 = v35;
              char v37 = [v36 moveItemAtURL:v31 toURL:v33 error:&v89];
              id v28 = v89;

              if ((v37 & 1) != 0) {
                goto LABEL_28;
              }
              container_log_handle_for_category();
              os_signpost_id_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                [v31 path];
                int v39 = (void *)objc_claimAutoreleasedReturnValue();
                [v86 path];
                int v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 buf = 138413058;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v39;
                __int16 v100 = 2112;
                id v101 = v40;
                __int16 v102 = 2112;
                id v103 = v28;
                _os_log_error_impl( &dword_188846000,  v38,  OS_LOG_TYPE_ERROR,  "Failed to move file in restored system container %@:%@ to destination %@: %@",  buf,  0x2Au);
              }
            }

            else
            {
              container_log_handle_for_category();
              os_signpost_id_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412802;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v86;
                __int16 v100 = 2112;
                id v101 = v35;
                _os_log_error_impl( &dword_188846000,  v38,  OS_LOG_TYPE_ERROR,  "Failed to remove destination %@:%@: %@",  buf,  0x20u);
              }

              id v28 = v35;
            }

            id v87 = v31;
            id v41 = v82;
            id v42 = v32;
            [&v29[11] defaultManager];
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
            id v95 = 0LL;
            char v44 = [v43 createDirectoryAtURL:v41 withIntermediateDirectories:1 mode:511 error:&v95];
            id v45 = v95;

            if ((v44 & 1) == 0)
            {
              container_log_handle_for_category();
              id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412546;
                uint64_t v97 = (uint64_t)v82;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v45;
                _os_log_error_impl(&dword_188846000, v46, OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);
              }
            }

            int v47 = v32;
            id v48 = v28;
            [v41 URLByAppendingPathComponent:v42 isDirectory:0];
            stat v49 = (void *)objc_claimAutoreleasedReturnValue();
            [&v29[11] defaultManager];
            uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
            id v94 = v45;
            char v51 = [v50 moveItemAtURL:v87 toURL:v49 error:&v94];
            id v52 = v94;

            if ((v51 & 1) == 0)
            {
              container_log_handle_for_category();
              uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412802;
                uint64_t v97 = (uint64_t)v87;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v49;
                __int16 v100 = 2112;
                id v101 = v52;
                _os_log_error_impl(&dword_188846000, v53, OS_LOG_TYPE_ERROR, "Failed to move %@ to %@: %@", buf, 0x20u);
              }
            }

            int v23 = v81;
            id v21 = 0LL;
            id v28 = v48;
            int v29 = &OBJC_CLASS___MCMContainerStagingPath;
            int v32 = v47;
LABEL_28:
          }

          uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v104 count:16];
          if (!v85)
          {
LABEL_39:
            id v27 = v28;

            v56 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
            os_signpost_id_t v59 = objc_alloc(&OBJC_CLASS___MCMCommandProcessRestoredContainer);
            v60 = -[os_log_s containerIdentity](log, "containerIdentity");
            id v8 = v73;
            id v61 = -[MCMCommandProcessRestoredContainer initWithConcreteContainerIdentity:context:resultPromise:]( v59,  "initWithConcreteContainerIdentity:context:resultPromise:",  v60,  v73,  v56);

            -[MCMCommandProcessRestoredContainer execute](v61, "execute");
            -[MCMResultPromise result](v56, "result");
            id v62 = (void *)objc_claimAutoreleasedReturnValue();
            [v62 error];
            id v63 = (void *)objc_claimAutoreleasedReturnValue();

            id v7 = v74;
            id v9 = v72;
            if (v63)
            {
              container_log_handle_for_category();
              int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                v88 = -[MCMResultPromise result](v56, "result");
                [v88 error];
                id v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 buf = 138412546;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v69;
                _os_log_error_impl( &dword_188846000,  v64,  OS_LOG_TYPE_ERROR,  "Error processing restored system container %@: %@",  buf,  0x16u);
              }
            }

            char v18 = v70;
            uint64_t v15 = v71;
            goto LABEL_44;
          }
        }
      }

      container_log_handle_for_category();
      v56 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
      {
        [v7 path];
        id v57 = v18;
        id v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v97 = (uint64_t)v79;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v58;
        __int16 v100 = 2112;
        id v101 = v27;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v56,  OS_LOG_TYPE_ERROR,  "Failed to enumerate contents of restored system container %@ at %@: %@",  buf,  0x20u);

        char v18 = v57;
      }

void sub_1888A2404( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1888A2A3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4513(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4514(uint64_t a1)
{
}

void sub_1888A53F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__4731(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4732(uint64_t a1)
{
}

void sub_1888A67AC(_Unwind_Exception *exception_object)
{
}

void sub_1888A6860(_Unwind_Exception *exception_object)
{
}

void sub_1888A6E0C(_Unwind_Exception *a1)
{
}

void sub_1888A7038(_Unwind_Exception *a1)
{
}

void *_MCMVolumeChangeMonitorCallback(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    return (void *)[a1 _callbackWithVolume:a2 notificationType:a3 margs:a4];
  }
  return a1;
}

uint64_t server_get_process_containers( void *a1, unsigned int a2, vm_offset_t *a3, mach_msg_type_number_t *a4, _DWORD *a5, _OWORD *a6)
{
  uint64_t v149 = *MEMORY[0x1895F89C0];
  if (_os_feature_enabled_impl())
  {
    __int128 v12 = a6[1];
    *(_OWORD *)atoken = *a6;
    *(_OWORD *)&atoken[16] = v12;
    audit_token_to_au32((audit_token_t *)atoken, 0LL, 0LL, 0LL, 0LL, 0LL, pidp, 0LL, 0LL);
    if (pidp[0]) {
      return 5LL;
    }
    __int16 v22 = (void *)MEMORY[0x1895CE3A8]();
    int v23 = (uint64_t *)sb_packbuff_new(0x1000uLL);
    if (v23)
    {
      __int16 v24 = v23;
      sb_packbuff_pack_uint32(v23, 0, 1);
      vm_address_t bytes = sb_packbuff_get_bytes((uint64_t)v24);
      uint64_t size = sb_packbuff_get_size((uint64_t)v24);
      uint64_t v13 = vm_read(*MEMORY[0x1895FBBE0], bytes, size, a3, a4);
      if ((_DWORD)v13)
      {
        container_log_handle_for_category();
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)atoken = 134218496;
          *(void *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(void *)&atoken[14] = size;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v13;
          _os_log_error_impl(&dword_188846000, v27, OS_LOG_TYPE_ERROR, "vm_read(%p, %lu) fails: %d", atoken, 0x1Cu);
        }

        *a5 = 0;
        *a4 = 0;
      }

      else
      {
        *a5 = 1;
        container_log_handle_for_category();
        uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          mach_msg_type_number_t v71 = *a4;
          *(_DWORD *)atoken = 134218496;
          *(void *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(void *)&atoken[14] = a3;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v71;
          _os_log_debug_impl( &dword_188846000,  v53,  OS_LOG_TYPE_DEBUG,  "packbuff bytes: %p, reply bytes: %p, reply size: %u",  atoken,  0x1Cu);
        }
      }

      sb_packbuff_free(v24);
    }

    else
    {
      uint64_t v13 = 9LL;
    }

    objc_autoreleasePoolPop(v22);
    return v13;
  }

  unsigned int active_platform = dyld_get_active_platform();
  container_log_handle_for_category();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, a1);

  container_log_handle_for_category();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  char v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)atoken = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "KernelUpcall",  "",  atoken,  2u);
  }

  container_log_handle_for_category();
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)atoken = 134217984;
    *(void *)&atoken[4] = v16;
    _os_log_impl(&dword_188846000, v19, OS_LOG_TYPE_DEFAULT, "<%llx> upcall start ~~~~~~~~~~~~~~~~", atoken, 0xCu);
  }

  __int128 v20 = a6[1];
  *(_OWORD *)atoken = *a6;
  *(_OWORD *)&atoken[16] = v20;
  audit_token_to_au32((audit_token_t *)atoken, 0LL, 0LL, 0LL, 0LL, 0LL, pidp, 0LL, 0LL);
  if (pidp[0])
  {
    id v21 = 0LL;
    uint64_t v13 = 5LL;
    goto LABEL_170;
  }

  unsigned int v112 = active_platform;
  id v28 = (void *)MEMORY[0x1895CE3A8]();
  unsigned __int16 v126 = 0;
  int v125 = 0;
  container_log_handle_for_category();
  int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)atoken = 67109376;
    *(_DWORD *)&atoken[4] = a2;
    *(_WORD *)&atoken[8] = 2048;
    *(void *)&atoken[10] = a1;
    _os_log_debug_impl(&dword_188846000, v29, OS_LOG_TYPE_DEBUG, "request size: %u (%p)", atoken, 0x12u);
  }

  int v30 = sb_packbuff_init_with_buffer(a1, a2, 1, 0);
  container_log_handle_for_category();
  int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = sb_packbuff_get_bytes((uint64_t)v30);
    *(_DWORD *)atoken = 134217984;
    *(void *)&atoken[4] = v55;
    _os_log_debug_impl(&dword_188846000, v31, OS_LOG_TYPE_DEBUG, "request packbuff byte address:%p", atoken, 0xCu);
  }

  if (!v30)
  {
    container_log_handle_for_category();
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)atoken = 0;
      _os_log_error_impl( &dword_188846000,  v65,  OS_LOG_TYPE_ERROR,  "sb_packbuff_init() of request data fails",  atoken,  2u);
    }

    int v64 = 0LL;
    id v63 = 0LL;
    uint64_t v32 = 0LL;
    id v21 = 0LL;
    uint64_t v13 = 9LL;
    goto LABEL_168;
  }

  uint64_t v110 = a5;
  data = a3;
  id v115 = v28;
  uint64_t v119 = 0LL;
  id v120 = 0LL;
  unsigned int v116 = 0;
  uint64_t v121 = 0LL;
  uint64_t v32 = 0LL;
  while (2)
  {
    if (sb_packbuff_get_item_value_type(v30, &v126))
    {
      switch(v126)
      {
        case 0u:
          uint64_t v33 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CODE_SIGNATURE_ID");

          container_log_handle_for_category();
          char v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v33;
            _os_log_impl(&dword_188846000, v34, OS_LOG_TYPE_DEFAULT, "<%llx> code signature: [%@]", atoken, 0x16u);
          }

          uint64_t v32 = v33;
          if (v33) {
            continue;
          }
          goto LABEL_73;
        case 1u:
          uint64_t v35 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");

          container_log_handle_for_category();
          int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v35;
            _os_log_impl(&dword_188846000, v36, OS_LOG_TYPE_DEFAULT, "<%llx> container id: [%@]", atoken, 0x16u);
          }

          uint64_t v121 = v35;
          if (v35) {
            continue;
          }
          id v63 = 0LL;
          id v21 = 0LL;
          uint64_t v13 = 5LL;
          int v64 = v120;
          goto LABEL_169;
        case 2u:
          uint64_t v37 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APPLICATION_ID");

          container_log_handle_for_category();
          os_signpost_id_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v37;
            _os_log_impl(&dword_188846000, v38, OS_LOG_TYPE_DEFAULT, "<%llx> application id: [%@]", atoken, 0x16u);
          }

          id v120 = (void *)v37;
          if (v37) {
            continue;
          }
          int v64 = 0LL;
          id v21 = 0LL;
          uint64_t v13 = 5LL;
          id v63 = (void *)v121;
          goto LABEL_169;
        case 3u:
          unsigned int v39 = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v39;
            _os_log_impl(&dword_188846000, v40, OS_LOG_TYPE_DEFAULT, "<%llx> uid: [%u]", atoken, 0x12u);
          }

          unsigned int v116 = v39;

          if (!v125) {
            continue;
          }
          container_log_handle_for_category();
          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_98;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          int v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_UID. error: %d\n";
          goto LABEL_176;
        case 4u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APP_GROUP_ID");
          id v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v41;
          uint64_t v43 = v42;
          char v44 = "<%llx> app group id: [%@]";
          goto LABEL_50;
        case 5u:
          LODWORD(v119) = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v119;
            _os_log_impl(&dword_188846000, v45, OS_LOG_TYPE_DEFAULT, "<%llx> container type: [%u]", atoken, 0x12u);
          }

          if (!v125) {
            continue;
          }
          container_log_handle_for_category();
          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_98;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          int v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_CONTAINER_TYPE. error: %d\n";
          goto LABEL_176;
        case 6u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");
          id v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v41;
          uint64_t v43 = v42;
          char v44 = "<%llx> system container id: [%@]";
          goto LABEL_50;
        case 7u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_SYSTEM_GROUP_CONTAINER_ID");
          id v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v41;
          uint64_t v43 = v42;
          char v44 = "<%llx> system group id: [%@]";
LABEL_50:
          _os_log_impl(&dword_188846000, v43, OS_LOG_TYPE_DEFAULT, v44, atoken, 0x16u);
LABEL_51:

          if (v41) {
            continue;
          }
LABEL_73:
          id v21 = 0LL;
          uint64_t v13 = 5LL;
          break;
        case 8u:
          HIDWORD(v119) = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = HIDWORD(v119);
            _os_log_impl(&dword_188846000, v46, OS_LOG_TYPE_DEFAULT, "<%llx> persona id: [%u]", atoken, 0x12u);
          }

          if (!v125) {
            continue;
          }
          container_log_handle_for_category();
          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_98;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          int v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_PERSONA_ID. error: %d\n";
LABEL_176:
          _os_log_error_impl(&dword_188846000, v65, OS_LOG_TYPE_ERROR, v47, atoken, 8u);
LABEL_98:
          id v21 = 0LL;
          uint64_t v13 = 5LL;
          int v64 = v120;
          id v63 = (void *)v121;
          goto LABEL_168;
        default:
          container_log_handle_for_category();
          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          id v63 = (void *)v121;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)atoken = 67109120;
            *(_DWORD *)&atoken[4] = v126;
            _os_log_error_impl(&dword_188846000, v65, OS_LOG_TYPE_ERROR, "unexpected value: %u\n", atoken, 8u);
          }

          id v21 = 0LL;
          uint64_t v13 = 4LL;
          goto LABEL_111;
      }

      goto LABEL_75;
    }

    break;
  }

  sb_packbuff_free(v30);
  id v48 = (uint64_t *)sb_packbuff_new(0x1000uLL);
  if (v48)
  {
    uint64_t v109 = v48;
    uint64_t v32 = (uint64_t)(id)v32;
    id v21 = (id)v32;
    id v63 = (void *)v121;
    if (v121)
    {
      id v21 = (id)v121;
    }

    uint64_t v124 = 1LL;
    [(id)gContainerCache userIdentityCache];
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)atoken = 0;
    host_t v49 = MEMORY[0x1895CE2D0]();
    if (host_get_multiuser_config_flags(v49, (uint32_t *)atoken) || (*(_DWORD *)atoken & 0x80000000) == 0)
    {
      uint64_t v148 = 0LL;
      __int128 v146 = 0u;
      __int128 v147 = 0u;
      __int128 v144 = 0u;
      __int128 v145 = 0u;
      __int128 v143 = 0u;
      __int128 v142 = 0u;
      __int128 v141 = 0u;
      __int128 v140 = 0u;
      __int128 v139 = 0u;
      __int128 v138 = 0u;
      __int128 v137 = 0u;
      __int128 v136 = 0u;
      __int128 v135 = 0u;
      __int128 v134 = 0u;
      __int128 v133 = 0u;
      __int128 v132 = 0u;
      __int128 v131 = 0u;
      __int128 v130 = 0u;
      __int128 v129 = 0u;
      memset(&atoken[4], 0, 32);
      *(_DWORD *)atoken = 1;
      if (HIDWORD(v119) != -1)
      {
        if ((kpersona_info() & 0x80000000) != 0)
        {
          container_log_handle_for_category();
          id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_110;
          }
          pidp[0] = 67109120;
          pidp[1] = HIDWORD(v119);
          id v69 = "Could not look up info for persona id %u";
          uint64_t v70 = (uint8_t *)pidp;
          goto LABEL_109;
        }

        if (*(_DWORD *)&atoken[8] == 5 || *(_DWORD *)&atoken[8] == 2)
        {
          uint64_t v54 = -[os_log_s userIdentityWithPersonaID:](v65, "userIdentityWithPersonaID:", HIDWORD(v119));
        }

        else
        {
          uint64_t v54 = -[os_log_s userIdentityForPersonalPersona](v65, "userIdentityForPersonalPersona");
        }

        uint64_t v52 = v54;
        if (v54)
        {
LABEL_83:
          id v56 = (id)(v121 | v32);
          BOOL v57 = 1;
          __int128 v108 = (void *)v52;
          +[MCMClientConnection privilegedClientConnectionWithUserIdentity:kernel:]( &OBJC_CLASS___MCMClientConnection,  "privilegedClientConnectionWithUserIdentity:kernel:",  v52,  1LL);
          __int128 v106 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v107 = v65;
          if (!(v121 | v32))
          {
            __int16 v104 = 0LL;
            id v62 = 0LL;
LABEL_136:
            container_log_handle_for_category();
            id v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              [v62 path];
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)atoken = 134218498;
              *(void *)&atoken[4] = v16;
              *(_WORD *)&atoken[12] = 1024;
              *(_DWORD *)&atoken[14] = v57;
              *(_WORD *)&atoken[18] = 2112;
              *(void *)&atoken[20] = v88;
              _os_log_impl( &dword_188846000,  v87,  OS_LOG_TYPE_DEFAULT,  "<%llx> upcall result %d; data container [%@]",
                atoken,
                0x1Cu);
            }

            v122 = v62;
            v114 = v56;

            id v89 = (void *)objc_opt_new();
            id v90 = v89;
            if (v120) {
              [v89 appendFormat:@"appID[%@]", v120];
            }
            v118 = v90;
            if (v121)
            {
              if ([v90 length]) {
                id v91 = @", ";
              }
              else {
                id v91 = &stru_18A29E970;
              }
              [v90 appendFormat:@"%@conID[%@]", v91, v121, v104];
            }

            if (v32)
            {
              if ([v90 length]) {
                id v92 = @", ";
              }
              else {
                id v92 = &stru_18A29E970;
              }
              [v90 appendFormat:@"%@codID[%@]", v92, v32];
            }

            container_log_handle_for_category();
            uint64_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            id v28 = v115;
            id v94 = v109;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              if (v62)
              {
                [v62 path];
                id v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v95 = &stru_18A29E970;
              }

              *(_DWORD *)atoken = 67110402;
              *(_DWORD *)&atoken[4] = v119;
              *(_WORD *)&atoken[8] = 1024;
              *(_DWORD *)&atoken[10] = v116;
              *(_WORD *)&atoken[14] = 1024;
              *(_DWORD *)&atoken[16] = HIDWORD(v119);
              *(_WORD *)&atoken[20] = 2114;
              *(void *)&atoken[22] = v118;
              *(_WORD *)&atoken[30] = 1024;
              *(_DWORD *)&atoken[32] = v57;
              LOWORD(v129) = 2114;
              *(void *)((char *)&v129 + 2) = v95;
              _os_log_impl( &dword_188846000,  v93,  OS_LOG_TYPE_DEFAULT,  "kernel_upcall {%d; %u.%u; %{public}@} -> {%d; [%{public}@]}",
                atoken,
                0x2Eu);
              if (v122) {

              }
              id v62 = v122;
            }

            if (v57 && v62) {
              BOOL v57 = __server_get_process_containers_block_invoke(v109, v62) == 0;
            }
            __server_get_process_containers_block_invoke_11(v109, v57);
            vm_address_t v96 = sb_packbuff_get_bytes((uint64_t)v109);
            uint64_t v97 = sb_packbuff_get_size((uint64_t)v109);
            uint64_t v13 = vm_read(*MEMORY[0x1895FBBE0], v96, v97, data, a4);
            if ((_DWORD)v13)
            {
              container_log_handle_for_category();
              __int16 v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)atoken = 134218496;
                *(void *)&atoken[4] = v96;
                *(_WORD *)&atoken[12] = 2048;
                *(void *)&atoken[14] = v97;
                *(_WORD *)&atoken[22] = 1024;
                *(_DWORD *)&atoken[24] = v13;
                _os_log_error_impl( &dword_188846000,  v98,  OS_LOG_TYPE_ERROR,  "vm_read(%p, %lu) fails: %d",  atoken,  0x1Cu);
              }

              id v94 = v109;
              *uint64_t v110 = 0;
              *a4 = 0;
            }

            else
            {
              *uint64_t v110 = 1;
              container_log_handle_for_category();
              uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
              {
                mach_msg_type_number_t v103 = *a4;
                *(_DWORD *)atoken = 134218496;
                *(void *)&atoken[4] = v96;
                *(_WORD *)&atoken[12] = 2048;
                *(void *)&atoken[14] = data;
                *(_WORD *)&atoken[22] = 1024;
                *(_DWORD *)&atoken[24] = v103;
                _os_log_debug_impl( &dword_188846000,  v99,  OS_LOG_TYPE_DEBUG,  "packbuff bytes: %p, reply bytes: %p, reply size: %u",  atoken,  0x1Cu);
              }
            }

            sb_packbuff_free(v94);

            int v64 = v120;
            id v63 = (void *)v121;
            id v65 = v107;
            goto LABEL_168;
          }

          unint64_t v58 = [(id)gCodeSigningMapping dataContainerTypeForIdentifier:v21];
          uint64_t v59 = v58;
          if (v58 <= 0xB && ((1LL << v58) & 0xED4) != 0)
          {
            if ((_DWORD)v119 != 1 || v58 == 4)
            {
              uint64_t v61 = v112;
              if ((_DWORD)v119 || v58 == 2)
              {
LABEL_121:
                [v108 posixUser];
                id v73 = (void *)objc_claimAutoreleasedReturnValue();
                +[MCMContainerClassPath posixOwnerForContainerClass:user:]( &OBJC_CLASS___MCMContainerClassPath,  "posixOwnerForContainerClass:user:",  v59,  v73);
                id v74 = (void *)objc_claimAutoreleasedReturnValue();

                id v117 = v74;
                if (v116 != [v74 UID])
                {
                  container_log_handle_for_category();
                  id v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    int v76 = [v117 UID];
                    *(_DWORD *)atoken = 67109376;
                    *(_DWORD *)&atoken[4] = v116;
                    *(_WORD *)&atoken[8] = 1024;
                    *(_DWORD *)&atoken[10] = v76;
                    _os_log_impl( &dword_188846000,  v75,  OS_LOG_TYPE_DEFAULT,  "Invalid UID from kernel: %u, expected: %u",  atoken,  0xEu);
                  }
                }

                id v77 = containermanager_copy_global_configuration();
                [v77 staticConfig];
                uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v79 = [v78 configForContainerClass:v59];

                v113 = (void *)v79;
                +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v108,  v21,  v79,  v61,  v107,  &v124);
                id v80 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                {
                  [v106 context];
                  os_signpost_id_t v81 = (void *)objc_claimAutoreleasedReturnValue();
                  [v81 containerFactory];
                  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
                  id v123 = 0LL;
                  BOOL v57 = 1;
                  __int128 v105 = v80;
                  [v82 containerForContainerIdentity:v80 createIfNecessary:1 error:&v123];
                  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
                  id v56 = v123;

                  [v83 metadataMinimal];
                  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v84)
                  {
                    id v80 = v105;
LABEL_133:

                    id v62 = 0LL;
                    __int16 v104 = v84;
                    if (v57 && v84)
                    {
                      [v84 containerPath];
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      [v86 containerDataURL];
                      id v62 = (void *)objc_claimAutoreleasedReturnValue();

                      BOOL v57 = 1;
                    }

                    goto LABEL_136;
                  }

                  id v80 = v105;
                }

                else
                {
                  id v56 = 0LL;
                }

                container_log_handle_for_category();
                uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)atoken = 134218242;
                  *(void *)&atoken[4] = v124;
                  *(_WORD *)&atoken[12] = 2112;
                  *(void *)&atoken[14] = v56;
                  _os_log_impl( &dword_188846000,  v85,  OS_LOG_TYPE_DEFAULT,  "createOrLookupContainerForUser: Failed with error: (%llu) %@",  atoken,  0x16u);
                }

                uint64_t v84 = 0LL;
                BOOL v57 = 0;
                goto LABEL_133;
              }

              container_log_handle_for_category();
              v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)atoken = 134217984;
                *(void *)&atoken[4] = v59;
                _os_log_impl( &dword_188846000,  v60,  OS_LOG_TYPE_DEFAULT,  "SB type is app, but MI type is %llu",  atoken,  0xCu);
              }
            }

            else
            {
              container_log_handle_for_category();
              v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              uint64_t v61 = v112;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)atoken = 67109376;
                *(_DWORD *)&atoken[4] = 1;
                *(_WORD *)&atoken[8] = 2048;
                *(void *)&atoken[10] = v59;
                _os_log_impl( &dword_188846000,  v60,  OS_LOG_TYPE_DEFAULT,  "SB Type: %u, MI Type: %llu.  Declaring this a plugin",  atoken,  0x12u);
              }

              uint64_t v59 = 4LL;
            }
          }

          else
          {
            container_log_handle_for_category();
            id v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)atoken = 138412546;
              *(void *)&atoken[4] = v21;
              *(_WORD *)&atoken[12] = 2048;
              *(void *)&atoken[14] = v59;
              _os_log_impl( &dword_188846000,  v72,  OS_LOG_TYPE_DEFAULT,  "Invalid data container class for %@: %llu",  atoken,  0x16u);
            }

            if ((_DWORD)v119 == 1) {
              uint64_t v59 = 4LL;
            }
            else {
              uint64_t v59 = 2LL;
            }
            container_log_handle_for_category();
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)atoken = 67109376;
              *(_DWORD *)&atoken[4] = v119;
              *(_WORD *)&atoken[8] = 2048;
              *(void *)&atoken[10] = v59;
              _os_log_impl( &dword_188846000,  v60,  OS_LOG_TYPE_DEFAULT,  "SB Type: %u, falling back to class: %llu",  atoken,  0x12u);
            }

            uint64_t v61 = v112;
          }

          goto LABEL_121;
        }

LABEL_107:
        container_log_handle_for_category();
        id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_110;
        }
        *(_DWORD *)atoken = 67109120;
        *(_DWORD *)&atoken[4] = HIDWORD(v119);
        id v69 = "Unable to find user identity for persona id %u";
        uint64_t v70 = atoken;
LABEL_109:
        _os_log_impl(&dword_188846000, v68, OS_LOG_TYPE_DEFAULT, v69, v70, 8u);
LABEL_110:

        uint64_t v13 = 4LL;
LABEL_111:
        int v64 = v120;
LABEL_168:

        goto LABEL_169;
      }

      uint64_t v52 = -[os_log_s userIdentityForPersonalPersona](v65, "userIdentityForPersonalPersona");
    }

    else
    {
      +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", v116);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = -[os_log_s userIdentityForPersonalPersonaWithPOSIXUser:](v65, "userIdentityForPersonalPersonaWithPOSIXUser:", v50);

      uint64_t v52 = v51;
    }

    id v28 = v115;
    if (v52) {
      goto LABEL_83;
    }
    goto LABEL_107;
  }

  id v21 = 0LL;
  uint64_t v13 = 9LL;
LABEL_75:
  int v64 = v120;
  id v63 = (void *)v121;
LABEL_169:

  objc_autoreleasePoolPop(v28);
LABEL_170:
  container_log_handle_for_category();
  __int16 v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v101 = v100;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
  {
    *(_DWORD *)atoken = 138477827;
    *(void *)&atoken[4] = v21;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v101,  OS_SIGNPOST_INTERVAL_END,  v16,  "KernelUpcall",  " identifier=%{private, signpost.description:attribute}@ ",  atoken,  0xCu);
  }

  return v13;
}

id unpackToNSString(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  int v7 = 0;
  uint64_t v3 = sb_packbuff_unpack_string(a1, &v8, &v7);
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(NSString) initWithUTF8String:v3];
  }

  else
  {
    container_log_handle_for_category();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "failed: to unpack string for %s. error: %d\n",  buf,  0x12u);
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t __server_get_process_containers_block_invoke(void *a1, id a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (char *)[a2 fileSystemRepresentation];
  size_t v4 = strlen(v3);
  uint64_t v5 = sb_packbuff_pack_string(a1, 1, v3, v4);
  if ((_DWORD)v5)
  {
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109634;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = 1;
      __int16 v11 = 2080;
      int v12 = v3;
      _os_log_impl( &dword_188846000,  v6,  OS_LOG_TYPE_DEFAULT,  "sb_packbuff_pack_string() fails: %d; type: %u, path: %s\n",
        (uint8_t *)v8,
        0x18u);
    }
  }

  return v5;
}

void __server_get_process_containers_block_invoke_11(void *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v3 = sb_packbuff_pack_uint32(a1, 0, a2);
  if (v3)
  {
    int v4 = v3;
    container_log_handle_for_category();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109632;
      v6[1] = v4;
      __int16 v7 = 1024;
      int v8 = 0;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl( &dword_188846000,  v5,  OS_LOG_TYPE_DEFAULT,  "sb_packbuff_pack_uint32() fails: %d; type: %u, value: %u\n",
        (uint8_t *)v6,
        0x14u);
    }
  }

void __MCMKernServerStart_block_invoke(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  os_log_s *v4;
  char *v5;
  dispatch_queue_s *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  os_log_s *v11;
  mach_port_t sp;
  uint8_t buf[4];
  char *v14;
  uint64_t v15;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  sp = 0;
  id v2 = bootstrap_check_in(*MEMORY[0x1895F9630], "com.apple.containermanagerd.upcall", &sp);
  if (v2)
  {
    int v3 = v2;
    container_log_handle_for_category();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = mach_error_string(v3);
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_188846000, v4, OS_LOG_TYPE_ERROR, "bootstrap_check_in: %s", buf, 0xCu);
    }
  }

  else
  {
    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v6 = *(dispatch_queue_s **)(a1 + 32);
    if (v6) {
      __int16 v7 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.upcall", (dispatch_queue_attr_t)v4, v6);
    }
    else {
      __int16 v7 = dispatch_queue_create("com.apple.containermanagerd.upcall", (dispatch_queue_attr_t)v4);
    }
    int v8 = (void *)MCMKernServerStart_upcallQueue;
    MCMKernServerStart_upcallQueue = (uint64_t)v7;

    __int16 v9 = dispatch_mach_create();
    int v10 = (void *)MCMKernServerStart_channel;
    MCMKernServerStart_channel = v9;

    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_188846000, v11, OS_LOG_TYPE_DEFAULT, "Starting kernel upcall mach channel", buf, 2u);
    }

    dispatch_mach_connect();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void __MCMKernServerStart_block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  switch(a2)
  {
    case 1LL:
      container_log_handle_for_category();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Mach channel connected", (uint8_t *)&v11, 2u);
      }

      goto LABEL_14;
    case 2LL:
      if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        container_log_handle_for_category();
        __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          mach_msg_id_t msgh_id = msg->msgh_id;
          int v11 = 67109120;
          LODWORD(v12) = msgh_id;
          _os_log_fault_impl( &dword_188846000,  v7,  OS_LOG_TYPE_FAULT,  "Got mach message we didn't understand; mach_msg_id_t msgh_id = %d",
            (uint8_t *)&v11,
            8u);
        }

        mach_msg_destroy(msg);
      }

      goto LABEL_15;
    case 7LL:
      container_log_handle_for_category();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      LOWORD(v11) = 0;
      __int16 v9 = "Mach channel disconnected, this is probably very bad";
      break;
    case 8LL:
      container_log_handle_for_category();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      LOWORD(v11) = 0;
      __int16 v9 = "Mach channel canceled, this is probably very bad";
      break;
    default:
      container_log_handle_for_category();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134217984;
        uint64_t v12 = a2;
        _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Unhandled message type; reason = %lu",
          (uint8_t *)&v11,
          0xCu);
      }

      goto LABEL_15;
  }

  _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v11, 2u);
LABEL_14:

LABEL_15:
}

void sub_1888B19A0(_Unwind_Exception *a1)
{
}

LABEL_15:
  if (v12)
  {
    free(v12);
    memset_s(__s, 8uLL, 0, 8uLL);
  }

  return v17;
}

  return v10;
}

void sub_1888B69CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t __Block_byref_object_copy__6398(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6399(uint64_t a1)
{
}

void sub_1888BB060( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t __Block_byref_object_copy__6837(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6838(uint64_t a1)
{
}

id MCMContainerSchemaDefinitionForClass(unint64_t a1)
{
  if (MCMContainerSchemaDefinitionForClass_onceToken != -1) {
    dispatch_once(&MCMContainerSchemaDefinitionForClass_onceToken, &__block_literal_global_7309);
  }
  if (a1 > 0xD) {
    goto LABEL_12;
  }
  if (((1LL << a1) & 0xE54) == 0)
  {
    if (((1LL << a1) & 0x2080) != 0)
    {
      id v2 = (void *)MCMContainerSchemaDefinitionForClass_groupSchemaDefinition;
      goto LABEL_10;
    }

    if (a1 == 12)
    {
      id v2 = (void *)MCMContainerSchemaDefinitionForClass_systemSchemaDefinition;
      goto LABEL_10;
    }

void __MCMContainerSchemaDefinitionForClass_block_invoke()
{
  v75[1] = *MEMORY[0x1895F89C0];
  id v73 = @"script";
  host_t v49 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v71[0] = v49;
  int v47 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library");
  v71[1] = v47;
  [MEMORY[0x189603F18] arrayWithObjects:v71 count:2];
  id v45 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v45;
  uint64_t v43 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v70[0] = v43;
  id v41 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library/Preferences");
  v70[1] = v41;
  [MEMORY[0x189603F18] arrayWithObjects:v70 count:2];
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v39;
  uint64_t v37 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v69[0] = v37;
  uint64_t v35 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library/Caches");
  v69[1] = v35;
  [MEMORY[0x189603F18] arrayWithObjects:v69 count:2];
  char v34 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v34;
  uint64_t v33 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v68[0] = v33;
  uint64_t v32 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Documents");
  v68[1] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v68 count:2];
  int v0 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v0;
  id v1 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v67[0] = v1;
  id v2 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"SystemData");
  v67[1] = v2;
  [MEMORY[0x189603F18] arrayWithObjects:v67 count:2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v3;
  id v4 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v66[0] = v4;
  id v5 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"tmp");
  v66[1] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v66 count:2];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v6;
  [MEMORY[0x189603F18] arrayWithObjects:v72 count:6];
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v74 = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v8;
  uint64_t v9 = [MEMORY[0x189603F18] arrayWithObjects:v75 count:1];
  int v10 = (void *)MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition = v9;

  id v63 = @"script";
  uint64_t v50 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v61[0] = v50;
  id v48 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library");
  v61[1] = v48;
  [MEMORY[0x189603F18] arrayWithObjects:v61 count:2];
  id v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v46;
  char v44 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v60[0] = v44;
  id v42 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library/Preferences");
  v60[1] = v42;
  [MEMORY[0x189603F18] arrayWithObjects:v60 count:2];
  int v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v40;
  os_signpost_id_t v38 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v59[0] = v38;
  int v36 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library/Caches");
  v59[1] = v36;
  [MEMORY[0x189603F18] arrayWithObjects:v59 count:2];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v11;
  uint64_t v12 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v58[0] = v12;
  uint64_t v13 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Documents");
  v58[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v58 count:2];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v14;
  uint64_t v15 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v57[0] = v15;
  os_signpost_id_t v16 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"tmp");
  v57[1] = v16;
  [MEMORY[0x189603F18] arrayWithObjects:v57 count:2];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v62 count:5];
  char v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v64 = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v65 = v19;
  uint64_t v20 = [MEMORY[0x189603F18] arrayWithObjects:&v65 count:1];
  id v21 = (void *)MCMContainerSchemaDefinitionForClass_systemSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_systemSchemaDefinition = v20;

  uint64_t v54 = @"script";
  __int16 v22 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v52[0] = v22;
  int v23 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library");
  v52[1] = v23;
  [MEMORY[0x189603F18] arrayWithObjects:v52 count:2];
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v24;
  id v25 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentCommand),  "initWithString:",  @"mkdir");
  v51[0] = v25;
  stat v26 = -[MCMActionArgumentBase initWithString:]( objc_alloc(&OBJC_CLASS___MCMActionArgumentRelativeDirectory),  "initWithString:",  @"Library/Caches");
  v51[1] = v26;
  [MEMORY[0x189603F18] arrayWithObjects:v51 count:2];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v53 count:2];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = v28;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  id v56 = v29;
  uint64_t v30 = [MEMORY[0x189603F18] arrayWithObjects:&v56 count:1];
  int v31 = (void *)MCMContainerSchemaDefinitionForClass_groupSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_groupSchemaDefinition = v30;
}

id MCMSharedBackgroundQueue()
{
  if (MCMSharedBackgroundQueue_onceToken != -1) {
    dispatch_once(&MCMSharedBackgroundQueue_onceToken, &__block_literal_global_7552);
  }
  return (id)MCMSharedBackgroundQueue_queue;
}

void __MCMSharedBackgroundQueue_block_invoke()
{
  int v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.containermanagerd.background", attr);
  id v2 = (void *)MCMSharedBackgroundQueue_queue;
  MCMSharedBackgroundQueue_queue = (uint64_t)v1;
}

id MCMSharedDeathrowQueue()
{
  if (MCMSharedDeathrowQueue_onceToken != -1) {
    dispatch_once(&MCMSharedDeathrowQueue_onceToken, &__block_literal_global_2);
  }
  return (id)MCMSharedDeathrowQueue_queue;
}

void __MCMSharedDeathrowQueue_block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.containermanagerd.deathrow", v2);
  dispatch_queue_t v1 = (void *)MCMSharedDeathrowQueue_queue;
  MCMSharedDeathrowQueue_queue = (uint64_t)v0;
}

id MCMSharedFastWorkloop()
{
  if (MCMSharedFastWorkloop_onceToken != -1) {
    dispatch_once(&MCMSharedFastWorkloop_onceToken, &__block_literal_global_4);
  }
  return (id)MCMSharedFastWorkloop_fastWorkloop;
}

void __MCMSharedFastWorkloop_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.containermanagerd.fast");
  dispatch_queue_t v1 = (void *)MCMSharedFastWorkloop_fastWorkloop;
  MCMSharedFastWorkloop_fastWorkloop = (uint64_t)v0;
}

id MCMSharedSlowWorkloop()
{
  if (MCMSharedSlowWorkloop_onceToken != -1) {
    dispatch_once(&MCMSharedSlowWorkloop_onceToken, &__block_literal_global_6);
  }
  return (id)MCMSharedSlowWorkloop_slowWorkloop;
}

void __MCMSharedSlowWorkloop_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.containermanagerd.slow");
  dispatch_queue_t v1 = (void *)MCMSharedSlowWorkloop_slowWorkloop;
  MCMSharedSlowWorkloop_slowWorkloop = (uint64_t)v0;
}

id MCMDataProtectionQueue()
{
  if (MCMDataProtectionQueue_onceToken != -1) {
    dispatch_once(&MCMDataProtectionQueue_onceToken, &__block_literal_global_8);
  }
  return (id)MCMDataProtectionQueue_dataProtQueue;
}

void __MCMDataProtectionQueue_block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.containermanagerd.dataprot", v2);
  dispatch_queue_t v1 = (void *)MCMDataProtectionQueue_dataProtQueue;
  MCMDataProtectionQueue_dataProtQueue = (uint64_t)v0;
}

void sub_1888C2A68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__7864(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7865(uint64_t a1)
{
}

void sub_1888C3D7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1888C408C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1888C4340( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

LABEL_39:
    uint64_t v52 = 0LL;
    id obj = 0LL;
LABEL_40:

    os_signpost_id_t v38 = 0;
    if (a4) {
      *a4 = (id) v72[5];
    }
    uint64_t v61 = v52;
    goto LABEL_43;
  }

  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerPath];
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)v66[5] containerPath];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    int v47 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);
    id v48 = (void *)v72[5];
    v72[5] = (uint64_t)v47;

    container_log_handle_for_category();
    unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)__int128 buf = 0;
    host_t v49 = "Cancelling data protection operation because container path changed on disk. This indicates the app may have b"
          "een updated and changed its protection level.";
LABEL_48:
    _os_log_error_impl(&dword_188846000, v39, OS_LOG_TYPE_ERROR, v49, buf, 2u);
    goto LABEL_39;
  }

  if (!-[MCMDataProtectionChangeOperation _stillMostCurrentUpdate](self, "_stillMostCurrentUpdate"))
  {
    uint64_t v50 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 69LL);
    uint64_t v51 = (void *)v72[5];
    v72[5] = (uint64_t)v50;

    container_log_handle_for_category();
    unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)__int128 buf = 0;
    host_t v49 = "Cancelling data protection operation because another more current operation on this container has taken precedence";
    goto LABEL_48;
  }

  int v10 = containermanager_copy_global_configuration();
  [v10 appUserDataItemNames];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v85 = 0u;
  v86 = 0u;
  uint64_t v83 = 0u;
  uint64_t v84 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v84;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v84 != v14) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v16 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 containerPath];
        char v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 containerDataURL];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 URLByAppendingPathComponent:v16 isDirectory:1];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          [v12 addObject:v20];
        }

        else
        {
          container_log_handle_for_category();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v88 = v16;
            _os_log_error_impl(&dword_188846000, v21, OS_LOG_TYPE_ERROR, "itemURL is nil for item: %@", buf, 0xCu);
          }
        }
      }

      uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
    }

    while (v13);
  }

  +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 waitOnLock:10];

  v60 = -[MCMDataProtectionChangeOperation changeType](self, "changeType");
  id v80 = 0u;
  os_signpost_id_t v81 = 0u;
  uint64_t v78 = 0u;
  uint64_t v79 = 0u;
  int v23 = v12;
  __int16 v24 = [v23 countByEnumeratingWithState:&v78 objects:v77 count:16];
  uint64_t v61 = v23;
  if (!v24) {
    goto LABEL_33;
  }
  id v25 = *(void *)v79;
  stat v26 = *MEMORY[0x189607688];
  while (2)
  {
    for (j = 0LL; j != v24; ++j)
    {
      if (*(void *)v79 != v25) {
        objc_enumerationMutation(v61);
      }
      id v28 = *(void *)(*((void *)&v78 + 1) + 8 * j);
      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      int v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      id v63 = 0LL;
      int v31 = [v29 setDataProtectionAtURL:v28 toDataProtectionClass:v30 directoriesOnly:(v60 & 2) == 0 recursive:1 error:&v63];
      uint64_t v32 = v63;

      if ((v31 & 1) == 0)
      {
        [v32 domain];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v33 isEqualToString:v26])
        {
          char v34 = [v32 code] == 1;

          if (v34)
          {
            id v56 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v32,  v28,  61LL);
            BOOL v57 = (void *)v72[5];
            v72[5] = (uint64_t)v56;

            *a3 = 1;
            goto LABEL_46;
          }
        }

        else
        {
        }

        [v32 domain];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v35 isEqualToString:v26] && objc_msgSend(v32, "code") == 2)
        {
        }

        else
        {
          [v32 domain];
          int v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (([v36 isEqualToString:v26] & 1) == 0)
          {

LABEL_45:
            uint64_t v54 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v32,  v28,  152LL);
            uint64_t v55 = (void *)v72[5];
            v72[5] = (uint64_t)v54;

LABEL_46:
            unsigned int v39 = (os_log_s *)v61;
            uint64_t v52 = v61;
            goto LABEL_40;
          }

          uint64_t v37 = [v32 code] == 9;

          if (!v37) {
            goto LABEL_45;
          }
        }
      }
    }

    int v23 = v61;
    __int16 v24 = [v61 countByEnumeratingWithState:&v78 objects:v77 count:16];
    if (v24) {
      continue;
    }
    break;
  }

    stat v26 = v67;
    uint64_t v43 = v59;
    if (!v42) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 containerRootURL];
  int v47 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v79 = v67;
  id v48 = [v46 setTopLevelSystemContainerACLAtURL:v47 error:&v79];
  stat v26 = v79;

  host_t v49 = v64;
  if (v48)
  {
    uint64_t v15 = v65;
    uint64_t v13 = v66;
    goto LABEL_32;
  }

  uint64_t v52 = 0LL;
  uint64_t v51 = 0LL;
  uint64_t v15 = v65;
  uint64_t v13 = v66;
LABEL_43:
  uint64_t v50 = (void *)v72;
  if (!v42)
  {
LABEL_44:
    uint64_t v17 = v43;
    if (!a6) {
      goto LABEL_20;
    }
LABEL_26:
    uint64_t v43 = v17;
    id v42 = 0LL;
    *a6 = v43;
    goto LABEL_27;
  }

LABEL_40:
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:75 userInfo:0];
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = 0;
    if (!a5) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }

  uint64_t v61 = 0LL;
  int v19 = -[MCMLibraryRepair performGenericRepairWithError:](self, "performGenericRepairWithError:", &v61);
  uint64_t v20 = v61;
  if (!v19)
  {
    container_log_handle_for_category();
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v63 = v20;
      _os_log_error_impl(&dword_188846000, v48, OS_LOG_TYPE_ERROR, "Failed to repair generic paths: %@", buf, 0xCu);
    }

    uint64_t v37 = 0;
    id v41 = v56;
    if (!a5) {
      goto LABEL_43;
    }
LABEL_41:
    if (!v37) {
      *a5 = v20;
    }
    goto LABEL_43;
  }

  uint64_t v55 = v11;
  [v9 orderedPathsFromPaths:v8];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v67 = 0u;
  id v68 = 0u;
  id v69 = 0u;
  uint64_t v70 = 0u;
  id obj = v21;
  __int16 v22 = [obj countByEnumeratingWithState:&v67 objects:v66 count:16];
  if (v22)
  {
    int v23 = v22;
    uint64_t v51 = v9;
    uint64_t v52 = a5;
    uint64_t v53 = v8;
    uint64_t v54 = v7;
    __int16 v24 = *(void *)v68;
    unint64_t v58 = *MEMORY[0x189607688];
    while (2)
    {
      id v25 = 0LL;
      stat v26 = v20;
      do
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v67 + 1) + 8 * v25);
        container_log_handle_for_category();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v63 = v27;
          _os_log_impl(&dword_188846000, v28, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        [v27 owner];
        int v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v29 UID];
        [v27 owner];
        int v31 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [v31 primaryGID];
        v60 = v26;
        uint64_t v33 = -[MCMLibraryRepair fixPermissionsWithManagedPath:uid:gid:error:]( self,  "fixPermissionsWithManagedPath:uid:gid:error:",  v27,  v30,  v32,  &v60);
        uint64_t v20 = v60;

        if (!v33)
        {
          [v20 domain];
          char v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (![v34 isEqualToString:v58])
          {

LABEL_32:
            container_log_handle_for_category();
            host_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412546;
              id v63 = v27;
              int v64 = 2112;
              id v65 = v20;
              _os_log_error_impl(&dword_188846000, v49, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            uint64_t v37 = 0;
            goto LABEL_35;
          }

          uint64_t v35 = [v20 code];

          if (v35 != 2) {
            goto LABEL_32;
          }
          container_log_handle_for_category();
          int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v63 = v27;
            _os_log_impl( &dword_188846000,  v36,  OS_LOG_TYPE_DEFAULT,  "Expected path [%@] does not exist, moving on",  buf,  0xCu);
          }
        }

        ++v25;
        stat v26 = v20;
      }

      while (v23 != v25);
      int v23 = [obj countByEnumeratingWithState:&v67 objects:v66 count:16];
      if (v23) {
        continue;
      }
      break;
    }

    uint64_t v37 = 1;
LABEL_35:
    int v8 = v53;
    __int16 v7 = v54;
    uint64_t v9 = v51;
    a5 = v52;
  }

  else
  {
    uint64_t v37 = 1;
  }

  int v11 = v55;
  id v41 = v56;

  if (a5) {
    goto LABEL_41;
  }
LABEL_43:

  return v37;
}

void sub_1888C4AC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__8019(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8020(uint64_t a1)
{
}

LABEL_69:
      os_signpost_id_t v16 = 0LL;
      goto LABEL_70;
    }

    +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", [v43 intValue]);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 userIdentityForPersonalPersonaWithPOSIXUser:v51];
    os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16) {
      goto LABEL_28;
    }
LABEL_62:
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      [v10 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 path];
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412802;
      id v69 = (uint64_t)v53;
      uint64_t v70 = 2112;
      mach_msg_type_number_t v71 = v54;
      id v72 = 2048;
      id v73 = v67;
      uint64_t v55 = "Invalid update info user identity: %@ at %@: %llu";
      id v56 = v52;
      BOOL v57 = 32;
LABEL_83:
      _os_log_error_impl(&dword_188846000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);

      goto LABEL_69;
    }

    goto LABEL_69;
  }

  +[MCMUserIdentity userIdentityWithPlist:cache:error:]( &OBJC_CLASS___MCMUserIdentity,  "userIdentityWithPlist:cache:error:",  v17,  v8,  &v67);
  os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16) {
    goto LABEL_62;
  }
LABEL_28:
  [v10 setObject:v16 forKeyedSubscript:@"MCMDataOperationUserIdentity"];
LABEL_29:
  [v10 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v28 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v29 = v28;
  }
  else {
    int v29 = 0LL;
  }

  if (!v29)
  {
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    [v10 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
    char v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    id v69 = (uint64_t)v34;
    uint64_t v70 = 2112;
    mach_msg_type_number_t v71 = v35;
    int v36 = "Invalid update info protection class: %@ at %@";
LABEL_66:
    _os_log_error_impl(&dword_188846000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

    goto LABEL_67;
  }

  [v10 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  int v31 = v30;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v32 = v31;
  }
  else {
    uint64_t v32 = 0LL;
  }

  if (!v32)
  {
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    [v10 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
    char v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    id v69 = (uint64_t)v34;
    uint64_t v70 = 2112;
    mach_msg_type_number_t v71 = v35;
    int v36 = "Invalid update info change type: %@ at %@";
    goto LABEL_66;
  }

  [v10 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  os_signpost_id_t v38 = v37;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    unsigned int v39 = v38;
  }
  else {
    unsigned int v39 = 0LL;
  }

  if (!v39)
  {
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    [v10 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
    char v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    id v69 = (uint64_t)v34;
    uint64_t v70 = 2112;
    mach_msg_type_number_t v71 = v35;
    int v36 = "Invalid update info retry: %@ at %@";
    goto LABEL_66;
  }

  [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  char v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v45 = v44;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v46 = v45;
  }
  else {
    id v46 = 0LL;
  }

  if (!v46)
  {
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
      char v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 path];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v69 = (uint64_t)v34;
      uint64_t v70 = 2112;
      mach_msg_type_number_t v71 = v35;
      int v36 = "Invalid update info UUID String: %@ at %@";
      goto LABEL_66;
    }

LABEL_67:
    goto LABEL_70;
  }

  int v47 = objc_alloc(MEMORY[0x189607AB8]);
  [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  id v48 = (void *)objc_claimAutoreleasedReturnValue();
  host_t v49 = (void *)[v47 initWithUUIDString:v48];

  objc_opt_class();
  char v18 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v50 = v18;
  }
  else {
    uint64_t v50 = 0LL;
  }

  if (!v50)
  {
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 29LL);
    container_log_handle_for_category();
    id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      [v7 path];
      id v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v69 = (uint64_t)v18;
      uint64_t v70 = 2112;
      mach_msg_type_number_t v71 = v66;
      _os_log_error_impl(&dword_188846000, v62, OS_LOG_TYPE_ERROR, "Invalid update info UUID: %@ at %@", buf, 0x16u);
    }

LABEL_71:
    unint64_t v58 = 0LL;
    if (!a5) {
      goto LABEL_74;
    }
    goto LABEL_72;
  }

  unint64_t v58 = (void *)[v10 copy];
  uint64_t v14 = 0LL;
  if (!a5) {
    goto LABEL_74;
  }
LABEL_72:
  if (!v58) {
    *a5 = v14;
  }
LABEL_74:
  uint64_t v59 = v58;

  return v59;
}

void sub_1888C7440( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location, char a24)
{
}

void sub_1888C8060( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__8125(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8126(uint64_t a1)
{
}

void *__MCMPersonasAreSupported_block_invoke()
{
  kern_return_t multiuser_config_flags;
  int v3;
  int v4;
  int v5;
  BOOL v6;
  int v7;
  BOOL v8;
  os_log_s *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uid_t v14;
  pid_t v15;
  uid_t v16;
  au_asid_t v17;
  pid_t v19;
  void *__s;
  audit_token_t multiuser_flags;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  pid_t v33;
  __int16 v34;
  uid_t v35;
  __int16 v36;
  pid_t v37;
  __int16 v38;
  uid_t v39;
  __int16 v40;
  au_asid_t v41;
  __int16 v42;
  void *v43;
  audit_token_t v44;
  uint64_t v45;
  id v45 = *MEMORY[0x1895F89C0];
  uint64_t v0 = objc_opt_class();
  multiuser_flags.val[0] = 0;
  host_t v1 = MEMORY[0x1895CE2D0]();
  multiuser_config_flags = host_get_multiuser_config_flags(v1, multiuser_flags.val);
  id v3 = multiuser_flags.val[0];
  id v4 = os_variant_uses_ephemeral_storage();
  id v5 = v4;
  if (multiuser_config_flags) {
    id v6 = 0;
  }
  else {
    id v6 = v3 < 0;
  }
  __int16 v7 = !v6;
  int v8 = !v6 && v0 != 0;
  MCMPersonasAreSupported_staticPersonasSupported = v8 & (v4 ^ 1);
  memset(&v44, 0, sizeof(v44));
  container_codesign_get_self_audit_token();
  __s = 0LL;
  vproc_swap_string();
  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (MCMPersonasAreSupported_staticPersonasSupported) {
      int v10 = "YES";
    }
    else {
      int v10 = "NO";
    }
    if (v0) {
      int v11 = "";
    }
    else {
      int v11 = "!hasUserManager ";
    }
    if (v7) {
      uint64_t v12 = "";
    }
    else {
      uint64_t v12 = "configuredForMultiUser ";
    }
    if (v5) {
      uint64_t v13 = "usesEphemeralStorage ";
    }
    else {
      uint64_t v13 = "";
    }
    int v19 = getpid();
    uint64_t v14 = getuid();
    multiuser_flags = v44;
    uint64_t v15 = audit_token_to_pid(&multiuser_flags);
    multiuser_flags = v44;
    os_signpost_id_t v16 = audit_token_to_auid(&multiuser_flags);
    multiuser_flags = v44;
    uint64_t v17 = audit_token_to_asid(&multiuser_flags);
    multiuser_flags.val[0] = 136318466;
    *(void *)&multiuser_flags.val[1] = v10;
    LOWORD(multiuser_flags.val[3]) = 2080;
    *(void *)((char *)&multiuser_flags.val[3] + 2) = v11;
    HIWORD(multiuser_flags.val[5]) = 2080;
    *(void *)&multiuser_flags.val[6] = v12;
    __int16 v22 = 2080;
    int v23 = "";
    __int16 v24 = 2080;
    id v25 = v13;
    stat v26 = 2080;
    id v27 = "";
    id v28 = 2080;
    int v29 = "";
    uint64_t v30 = 2080;
    int v31 = "";
    uint64_t v32 = 1024;
    uint64_t v33 = v19;
    char v34 = 1024;
    uint64_t v35 = v14;
    int v36 = 1024;
    uint64_t v37 = v15;
    os_signpost_id_t v38 = 1024;
    unsigned int v39 = v16;
    int v40 = 1024;
    id v41 = v17;
    id v42 = 2082;
    uint64_t v43 = __s;
    _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Personas are supported (static): %s (%s%s%s%s%s%s%s) {pid: %d, uid: %d, apid: %d, auid: %d, asid: %d, session: %{public}s}",  (uint8_t *)&multiuser_flags,  0x7Au);
  }

  return __s;
}

uint64_t __MCMRequirePersona_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MCMRequirePersona_uint64_t result = result;
  return result;
}

uint64_t __MCMRequirePersonaAndConvertSystemToPersonal_block_invoke()
{
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 0LL;
  }
  MCMRequirePersonaAndConvertSystemToPersonal_uint64_t result = result;
  return result;
}

uint64_t __MCMRequirePersonaTelemetryOnly_block_invoke()
{
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 0LL;
  }
  MCMRequirePersonaTelemetryOnly_uint64_t result = result;
  return result;
}

void sub_1888CAD9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1888CB0EC(_Unwind_Exception *a1)
{
}

LABEL_48:
  return v12;
}

    os_log_s *v20 = v19;
    goto LABEL_49;
  }

uint64_t __Block_byref_object_copy__8554(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8555(uint64_t a1)
{
}

void __MCMProcessXPCEvent_block_invoke(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  id v2 = (void *)objc_opt_new();
  id v3 = -[MCMClientFactory initWithUserIdentityCache:clientCodeSignInfoCache:clientIdentityCache:]( objc_alloc(&OBJC_CLASS___MCMClientFactory),  "initWithUserIdentityCache:clientCodeSignInfoCache:clientIdentityCache:",  *(void *)(a1 + 32),  v5,  v2);
  id v4 = (void *)MCMProcessXPCEvent_clientFactory;
  MCMProcessXPCEvent_clientFactory = (uint64_t)v3;
}

id __MCMProcessXPCEvent_block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) codeSignInfo];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 identifier];
    int v10 = (void *)v9;
    int v11 = @"<unknown>";
    if (v9) {
      int v11 = (const __CFString *)v9;
    }
    int v26 = 134349315;
    *(void *)id v27 = v7;
    *(_WORD *)&v27[8] = 2113;
    *(void *)&v27[10] = v11;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v5,  OS_SIGNPOST_INTERVAL_END,  v6,  "XPCEventProcessing",  " command=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ",  (uint8_t *)&v26,  0x16u);
  }

  [v3 error];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = containermanager_copy_global_configuration();
      [v15 currentUser];
      os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 UID];
      uint64_t v18 = *(void *)(a1 + 56);
      [*(id *)(a1 + 32) shortDescription];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 error];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v26 = 67109890;
      *(_DWORD *)id v27 = v17;
      *(_WORD *)&v27[4] = 2048;
      *(void *)&v27[6] = v18;
      *(_WORD *)&v27[14] = 2112;
      *(void *)&v27[16] = v19;
      __int16 v28 = 2112;
      int v29 = v20;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "[%u] command=%llu, client=%@, error=%@",  (uint8_t *)&v26,  0x26u);

LABEL_11:
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = containermanager_copy_global_configuration();
    [v15 currentUser];
    os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v21 = [v16 UID];
    uint64_t v22 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) shortDescription];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = 67109634;
    *(_DWORD *)id v27 = v21;
    *(_WORD *)&v27[4] = 2048;
    *(void *)&v27[6] = v22;
    *(_WORD *)&v27[14] = 2112;
    *(void *)&v27[16] = v19;
    _os_log_impl( &dword_188846000,  v14,  OS_LOG_TYPE_DEFAULT,  "[%u] command=%llu, client=%@, error=(null)",  (uint8_t *)&v26,  0x1Cu);
    goto LABEL_11;
  }

  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
  __int16 v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0LL;

  return v3;
}

void sub_1888CD194( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t __Block_byref_object_copy__8749(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8750(uint64_t a1)
{
}

void sub_1888D033C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

LABEL_66:
      uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Flags");
      if ((uint64 & 2) != 0)
      {
        v10->_expectSingleResult = 1;
        if ((uint64 & 0x10000) == 0)
        {
LABEL_70:
          goto LABEL_91;
        }
      }

      else if ((uint64 & 0x10000) == 0)
      {
        goto LABEL_70;
      }

      v10->_fuzzyMatchTransient = 1;
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x20000) == 0)
      {
LABEL_71:
        goto LABEL_92;
      }

LABEL_91:
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x200000000LL) == 0)
      {
LABEL_72:
        goto LABEL_93;
      }

LABEL_92:
      v10->_includeInfoInResult = 1;
      if ((uint64 & 0x100000000LL) == 0)
      {
LABEL_73:
        goto LABEL_94;
      }

LABEL_93:
      v10->_includePathInResult = 1;
      if ((uint64 & 0x800000000LL) == 0)
      {
LABEL_74:
        goto LABEL_95;
      }

LABEL_94:
      v10->_issueSandboxExtensions = 1;
      if ((uint64 & 0x1000000000LL) == 0)
      {
LABEL_75:
        goto LABEL_96;
      }

LABEL_95:
      v10->_includeUserManagedAssetsRelPath = 1;
      if ((uint64 & 0x2000000000LL) == 0)
      {
LABEL_76:
        if ((uint64 & 0x1000000000000LL) == 0)
        {
LABEL_78:
          v10->_expectedPersonaKernelID = -1;
          if (v28)
          {
            -[MCMXPCMessageBase context](v10, "context");
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
            [v53 userIdentityCache];
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v55 = [(id)objc_opt_class() personasAreSupported];

            if (v55)
            {
              id v56 = containermanager_copy_global_configuration();
              [v56 staticConfig];
              int v21 = (id)objc_claimAutoreleasedReturnValue();

              BOOL v57 = xpc_dictionary_get_value(v8, "PersonaKernelID");
              unint64_t v58 = (void *)v57;
              if (v57 && MEMORY[0x1895CEBDC](v57) == MEMORY[0x1895F92F0])
              {
                v10->_expectedPersonaKernelID = xpc_uint64_get_value(v58);
                if ([v9 kernelPersonaID] != v10->_expectedPersonaKernelID)
                {
                  container_log_handle_for_category();
                  id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    [v9 clientIdentity];
                    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
                    [v78 codeSignInfo];
                    id v74 = (void *)objc_claimAutoreleasedReturnValue();
                    [v74 identifier];
                    id v73 = (void *)objc_claimAutoreleasedReturnValue();
                    [v9 clientIdentity];
                    id v72 = v9;
                    id v67 = (void *)objc_claimAutoreleasedReturnValue();
                    id v68 = [v67 posixPID];
                    expectedPersonaKernelID = v10->_expectedPersonaKernelID;
                    uint64_t v70 = [v72 kernelPersonaID];
                    *(_DWORD *)__int128 buf = 138413058;
                    uint64_t v82 = v73;
                    uint64_t v83 = 1024;
                    uint64_t v84 = v68;
                    uint64_t v85 = 1024;
                    v86 = expectedPersonaKernelID;
                    id v87 = 1024;
                    v88 = v70;
                    _os_log_error_impl( &dword_188846000,  v62,  OS_LOG_TYPE_ERROR,  "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
                      buf,
                      0x1Eu);

                    uint64_t v9 = v72;
                    uint64_t v20 = v75;
                  }

                  if ([v21 errorOnPersonaPropagationFailure])
                  {
                    v60 = 151LL;
                    goto LABEL_88;
                  }
                }
              }

              else
              {
                container_log_handle_for_category();
                uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  [v9 clientIdentity];
                  id v77 = (void *)objc_claimAutoreleasedReturnValue();
                  [v77 codeSignInfo];
                  int v76 = (void *)objc_claimAutoreleasedReturnValue();
                  [v76 identifier];
                  id v63 = (void *)objc_claimAutoreleasedReturnValue();
                  [v9 clientIdentity];
                  int v64 = v9;
                  id v65 = (void *)objc_claimAutoreleasedReturnValue();
                  id v66 = [v65 posixPID];
                  *(_DWORD *)__int128 buf = 138412546;
                  uint64_t v82 = v63;
                  uint64_t v83 = 1024;
                  uint64_t v84 = v66;
                  _os_log_error_impl( &dword_188846000,  v59,  OS_LOG_TYPE_ERROR,  "Kernel persona ID is invalid; client[%@(%d)]",
                    buf,
                    0x12u);

                  uint64_t v9 = v64;
                }

                if ([v21 errorOnPersonaPropagationFailure])
                {
                  v60 = 38LL;
LABEL_88:
                  uint64_t v79 = v60;
LABEL_110:

                  goto LABEL_45;
                }
              }
            }
          }

          container_log_handle_for_category();
          int v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
          {
            -[MCMUserIdentity debugDescription](v10->_userIdentity, "debugDescription");
            unint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v82 = v58;
            _os_log_debug_impl( &dword_188846000,  (os_log_t)v21,  OS_LOG_TYPE_DEBUG,  "message userIdentity: %@",  buf,  0xCu);
            goto LABEL_110;
          }

LABEL_96:
      v10->_includeCreator = 1;
      goto LABEL_77;
    }

LABEL_46:
  int v19 = v79;
  if (v79 != 1)
  {
    if (!v20)
    {
LABEL_49:

      int v10 = 0LL;
      goto LABEL_50;
    }

LABEL_50:
  return v10;
}

void sub_1888D3E8C(_Unwind_Exception *a1)
{
}

void sub_1888D4D1C(_Unwind_Exception *a1)
{
}

void sub_1888DB9A4(_Unwind_Exception *exception_object)
{
}

void sub_1888DBA58(_Unwind_Exception *exception_object)
{
}

void sub_1888DDDCC(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__10299(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__10300(uint64_t a1)
{
}

void sub_1888E17B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_1888E527C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1888E52A0LL);
  }

  JUMPOUT(0x1888E52B8LL);
}

void sub_1888E6820( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t __Block_byref_object_copy__10901(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__10902(uint64_t a1)
{
}

void sub_1888E6F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

Class __getRBSProcessPredicateClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("RBSProcessPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    abort_report_np();
  }
  getRBSProcessPredicateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class __getRBSTerminateContextClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("RBSTerminateContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    abort_report_np();
  }
  getRBSTerminateContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class __getRBSTerminationAssertionClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("RBSTerminationAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    abort_report_np();
  }
  getRBSTerminationAssertionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void RunningBoardServicesLibrary()
{
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      uint64_t v0 = (void *)abort_report_np();
      free(v0);
    }
  }

void sub_1888E944C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id (*a24)(uint64_t a1), void *a25, void *a26)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v27 = objc_begin_catch(exception_object);
      a22 = MEMORY[0x1895F87A8];
      a23 = 3221225472LL;
      a24 = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126;
      a25 = &unk_18A29E6D8;
      id v28 = v27;
      a26 = v28;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126((uint64_t)&a22);
      objc_claimAutoreleasedReturnValue();

      id v29 = containermanager_copy_global_configuration();
      int v30 = [v29 isInternalImage];

      if (v30) {
        MCMCrashOnException(v28);
      }

      objc_end_catch();
    }

    else
    {
      objc_begin_catch(exception_object);
    }

    JUMPOUT(0x1888E934CLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1888E9F28( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id (*a20)(uint64_t a1), void *a21, id a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id (*a32)(uint64_t a1), void *a33, void *a34)
{
  if (a2)
  {
    int v36 = v35;
    if (a2 == 2)
    {
      id v37 = objc_begin_catch(exception_object);
      a30 = MEMORY[0x1895F87A8];
      a31 = 3221225472LL;
      a32 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158;
      a33 = &unk_18A29E6D8;
      id v38 = v37;
      a34 = v38;
      uint64_t v39 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158((uint64_t)&a30);

      id v40 = containermanager_copy_global_configuration();
      int v41 = [v40 isInternalImage];

      if (v41) {
        MCMCrashOnException(v38);
      }

      objc_end_catch();
      int v36 = (void *)v39;
    }

    else
    {
      objc_begin_catch(exception_object);
    }

    a23 = v36;
    char v42 = [v34 _sqliteExec:@"ROLLBACK;" error:&a23];
    id v43 = a23;

    if ((v42 & 1) == 0)
    {
      a18 = MEMORY[0x1895F87A8];
      a19 = 3221225472LL;
      a20 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162;
      a21 = &unk_18A29E6D8;
      a22 = v43;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162((uint64_t)&a18);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x1888E9E88LL);
    }

    JUMPOUT(0x1888E9E94LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_27:
  return v42;
}

LABEL_57:
  return v24;
}

void sub_1888F52C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

uint64_t __Block_byref_object_copy__11260(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__11261(uint64_t a1)
{
}

void sub_1888F7018( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1888F94D8(_Unwind_Exception *a1)
{
}

void sub_1888FB6E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_1888FBB58(_Unwind_Exception *a1)
{
}

void sub_1888FBE08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1888FC050( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1888FD0B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__11791(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__11792(uint64_t a1)
{
}

void __MCMRunTransactionalTask_block_invoke(uint64_t a1)
{
}

void __MCMRunTransactionalTaskWithDelay_block_invoke(uint64_t a1)
{
}

void MCMCrashOnException(void *a1)
{
  id v1 = a1;
  [MEMORY[0x189607A40] currentThread];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 name];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  id v4 = (void *)[objc_allocWithZone(MEMORY[0x189607940]) initWithString:@"** INTERNAL ERROR: Uncaught Exception **\n"];
  [v4 appendString:@"Exception: "];
  if (v3)
  {
    [v4 appendString:@"<"];
    [v4 appendString:v3];
    [v4 appendString:@"> "];
  }

  [v1 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v1 name];
    os_signpost_id_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 appendString:v6];

    [v4 appendString:@": "];
  }

  [v1 reason];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v1 reason];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 appendString:v8];
  }

  [v4 appendString:@"\nStack:\n"];
  [v1 callStackSymbols];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 componentsJoinedByString:@"\n"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendString:v10];

  if (MCMCrashOnException_onceToken != -1) {
    dispatch_once(&MCMCrashOnException_onceToken, &__block_literal_global_12036);
  }
  pthread_mutex_lock(&MCMCrashOnException_crashLock);
  if (v4) {
    qword_18C72D2E0 = (uint64_t)strdup((const char *)[v4 UTF8String]);
  }
  abort();
}

uint64_t __MCMCrashOnException_block_invoke()
{
  return pthread_mutex_init(&MCMCrashOnException_crashLock, 0LL);
}

void sub_188900100(_Unwind_Exception *a1)
{
}

void sub_188905A2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__12530(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__12531(uint64_t a1)
{
}

LABEL_42:
              }
            }

            goto LABEL_44;
          }

          goto LABEL_22;
        }
      }

      else
      {
      }
    }

    goto LABEL_20;
  }

  uint64_t v10 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v7,  v5,  35LL);
  container_log_handle_for_category();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    [v5 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v54 = v12;
    _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, "Failed to read replace file at URL %@", buf, 0xCu);
    goto LABEL_30;
  }

void sub_18890AE9C(_Unwind_Exception *a1)
{
}

void sub_18890CC54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy__13075(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__13076(uint64_t a1)
{
}

void (*container_manager_kern_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 322514900) {
    return _Xget_process_containers;
  }
  else {
    return 0LL;
  }
}

void _Xget_process_containers(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 52) = 0;
  id v5 = (mach_msg_type_number_t *)(a2 + 52);
  os_signpost_id_t v6 = (vm_offset_t *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  uint64_t v7 = *(void **)(a1 + 28);
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  __int128 v9 = *(_OWORD *)(a1 + 92);
  v12[0] = *(_OWORD *)(a1 + 76);
  v12[1] = v9;
  int process_containers = server_get_process_containers(v7, v8, v6, v5, &v11, v12);
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose((const void *)(v27 - 160), 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  if (!process_containers)
  {
    *(_BYTE *)(a2 + 36) = v11;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }

  *(_DWORD *)(a2 + 32) = process_containers;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
}

void sb_packbuff_free_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_188846000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed: vm_deallocate(%p, %zu)",  (uint8_t *)&v4,  0x16u);
}

void sb_packbuff_unpack_item_cold_1()
{
  __assert_rtn("sb_packbuff_unpack_item", "packbuff.c", 369, "(bytes_to_advance % BYTE_ALIGNMENT) == 0");
}

void sb_packbuff_pack_item_cold_1()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 267, "extra_bytes_needed == 0");
}

void sb_packbuff_pack_item_cold_2()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 273, "additional_bytes != NULL");
}

uint64_t APFSContainerGetBootDevice()
{
  return MEMORY[0x18960CC48]();
}

uint64_t APFSVolumeRoleFind()
{
  return MEMORY[0x18960CCB8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void CFRunLoopRun(void)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x189611510]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x189604238]();
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return MEMORY[0x1896044A0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _NSDefaultFileSystemEncoding()
{
  return MEMORY[0x189607B68]();
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

double __exp10(double a1)
{
  return result;
}

uint64_t __xpc_connection_set_logging()
{
  return MEMORY[0x1895F8A60]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t _sqlite3_db_copy_compact()
{
  return MEMORY[0x1896170B0]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895F9318]();
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895F9338](flagset_d, *(void *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F9340](permset_d, *(void *)&perm);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F9378](acl_p, entry_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F9380](permset_d, *(void *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895F9390](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F93A0](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93B8](path_p, *(void *)&type);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1895F93C8](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1895F93E0](entry_d, permset_p);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1895F93F8](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895F9400](*(void *)&count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1895F9418](path_p, *(void *)&type, acl);
}

int acl_set_flagset_np(void *obj_p, acl_flagset_t flagset_d)
{
  return MEMORY[0x1895F9420](obj_p, flagset_d);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1895F9430](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1895F9440](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1895F9448](entry_d, *(void *)&tag_type);
}

uint64_t amfi_launch_constraint_matches_process()
{
  return MEMORY[0x1895F94B8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1895F95A8](a1);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1896140D8](atoken);
}

void audit_token_to_au32( audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1896140E8](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x189614100](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9610](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

uint64_t container_audit_token_copy_codesign_hash()
{
  return MEMORY[0x1895FA600]();
}

uint64_t container_audit_token_copy_codesign_identifier()
{
  return MEMORY[0x1895FA608]();
}

uint64_t container_audit_token_copy_entitlement()
{
  return MEMORY[0x1895FA610]();
}

uint64_t container_audit_token_get_codesign_status()
{
  return MEMORY[0x1895FA618]();
}

uint64_t container_audit_token_get_euid()
{
  return MEMORY[0x1895FA620]();
}

uint64_t container_audit_token_get_pid()
{
  return MEMORY[0x1895FA628]();
}

uint64_t container_audit_token_get_platform()
{
  return MEMORY[0x1895FA630]();
}

uint64_t container_class_for_each_normalized_class()
{
  return MEMORY[0x1895FA638]();
}

uint64_t container_class_normalized()
{
  return MEMORY[0x1895FA640]();
}

uint64_t container_class_supports_data_subdirectory()
{
  return MEMORY[0x1895FA648]();
}

uint64_t container_class_supports_randomized_path()
{
  return MEMORY[0x1895FA650]();
}

uint64_t container_client_copy_decoded_from_xpc_object()
{
  return MEMORY[0x1895FA658]();
}

uint64_t container_client_copy_encoded_xpc_object()
{
  return MEMORY[0x1895FA660]();
}

uint64_t container_client_copy_entitlement()
{
  return MEMORY[0x1895FA668]();
}

uint64_t container_client_create_from_audit_token()
{
  return MEMORY[0x1895FA670]();
}

uint64_t container_client_get_audit_token()
{
  return MEMORY[0x1895FA678]();
}

uint64_t container_client_get_codesign_identifier()
{
  return MEMORY[0x1895FA680]();
}

uint64_t container_client_get_codesign_team_identifier()
{
  return MEMORY[0x1895FA688]();
}

uint64_t container_client_get_euid()
{
  return MEMORY[0x1895FA690]();
}

uint64_t container_client_get_persona_unique_string()
{
  return MEMORY[0x1895FA698]();
}

uint64_t container_client_get_pid()
{
  return MEMORY[0x1895FA6A0]();
}

uint64_t container_client_get_platform()
{
  return MEMORY[0x1895FA6A8]();
}

uint64_t container_client_initializer()
{
  return MEMORY[0x1895FA6B0]();
}

uint64_t container_client_is_alive()
{
  return MEMORY[0x1895FA6B8]();
}

uint64_t container_client_is_sandboxed()
{
  return MEMORY[0x1895FA6C0]();
}

uint64_t container_client_is_signed()
{
  return MEMORY[0x1895FA6C8]();
}

uint64_t container_client_is_test_client()
{
  return MEMORY[0x1895FA6D0]();
}

uint64_t container_codesign_copy_current_identifier()
{
  return MEMORY[0x1895FA6D8]();
}

uint64_t container_codesign_get_self_audit_token()
{
  return MEMORY[0x1895FA6E0]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1895FA788]();
}

uint64_t container_error_create()
{
  return MEMORY[0x1895FA790]();
}

uint64_t container_error_free()
{
  return MEMORY[0x1895FA798]();
}

uint64_t container_error_get_category()
{
  return MEMORY[0x1895FA7A0]();
}

uint64_t container_error_get_path()
{
  return MEMORY[0x1895FA7A8]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1895FA7B0]();
}

uint64_t container_error_get_type()
{
  return MEMORY[0x1895FA7B8]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1895FA7C0]();
}

uint64_t container_free_client()
{
  return MEMORY[0x1895FA7C8]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1895FA7D0]();
}

uint64_t container_frozenset_create()
{
  return MEMORY[0x1895FA7D8]();
}

uint64_t container_frozenset_destroy()
{
  return MEMORY[0x1895FA7E0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1895FA7F0]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1895FA7F8]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1895FA800]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1895FA818]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x1895FA820]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x1895FA828]();
}

uint64_t container_internal_get_first_boot_uuid()
{
  return MEMORY[0x1895FA838]();
}

uint64_t container_is_new()
{
  return MEMORY[0x1895FA850]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1895FA858]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x1895FA860]();
}

uint64_t container_log_replication_disable()
{
  return MEMORY[0x1895FA868]();
}

uint64_t container_log_replication_enable_to_uid_relative_path()
{
  return MEMORY[0x1895FA870]();
}

uint64_t container_log_replication_prune_for_uid()
{
  return MEMORY[0x1895FA878]();
}

uint64_t container_object_create()
{
  return MEMORY[0x1895FA880]();
}

uint64_t container_object_get_info()
{
  return MEMORY[0x1895FA898]();
}

uint64_t container_object_get_path()
{
  return MEMORY[0x1895FA8A0]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x1895FA8A8]();
}

uint64_t container_object_set_creator_codesign_identifier()
{
  return MEMORY[0x1895FA8B8]();
}

uint64_t container_object_set_path()
{
  return MEMORY[0x1895FA8C0]();
}

uint64_t container_object_set_user_managed_assets_relative_path()
{
  return MEMORY[0x1895FA8C8]();
}

uint64_t container_paths_copy_container_from_path()
{
  return MEMORY[0x1895FA8E0]();
}

uint64_t container_perform_with_client_context()
{
  return MEMORY[0x1895FA8E8]();
}

uint64_t container_query_count_results()
{
  return MEMORY[0x1895FA8F0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1895FA8F8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1895FA908]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1895FA910]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1895FA920]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1895FA930]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1895FA940]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1895FA950]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1895FA958]();
}

uint64_t container_realpath()
{
  return MEMORY[0x1895FA978]();
}

uint64_t container_sandbox_issue_custom_extension()
{
  return MEMORY[0x1895FA998]();
}

uint64_t container_seam_fs_ensure_lazy_loaded()
{
  return MEMORY[0x1895FA9A0]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1895FA9C8]();
}

uint64_t container_traverse_directory()
{
  return MEMORY[0x1895FA9E8]();
}

uint64_t container_traverse_node_get_name()
{
  return MEMORY[0x1895FA9F0]();
}

uint64_t container_traverse_node_get_optional_dp_class()
{
  return MEMORY[0x1895FA9F8]();
}

uint64_t container_traverse_node_get_optional_parent_fd()
{
  return MEMORY[0x1895FAA00]();
}

uint64_t container_traverse_node_get_path()
{
  return MEMORY[0x1895FAA08]();
}

uint64_t container_traverse_node_is_directory()
{
  return MEMORY[0x1895FAA10]();
}

uint64_t container_xpc_decode_container_object()
{
  return MEMORY[0x1895FAA20]();
}

uint64_t container_xpc_decode_create_container_object_array()
{
  return MEMORY[0x1895FAA28]();
}

uint64_t container_xpc_encode_container_as_object()
{
  return MEMORY[0x1895FAA30]();
}

uint64_t container_xpc_encode_container_metadata_as_object()
{
  return MEMORY[0x1895FAA38]();
}

uint64_t container_xpc_encode_container_object()
{
  return MEMORY[0x1895FAA40]();
}

uint64_t container_xpc_encode_error()
{
  return MEMORY[0x1895FAA48]();
}

uint64_t container_xpc_send_sync_message()
{
  return MEMORY[0x1895FAA50]();
}

uint64_t container_xpc_set_use_shared_connection()
{
  return MEMORY[0x1895FAA58]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FACF8]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1895FAD00]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1895FAD10]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FAD20]();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
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

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1895FAF00](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FAFD8]();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

char *__cdecl fflagstostr(unint64_t a1)
{
  return (char *)MEMORY[0x1895FB260](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
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

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FB530]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1895FB600](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB668](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB678](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1895FB778](*(void *)&host, multiuser_flags);
}

uint64_t kpersona_info()
{
  return MEMORY[0x1895FB908]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FB9A8](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

double log10(double a1)
{
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FBC00](*(void *)&target, address, size, *(void *)&flags);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return MEMORY[0x1895FBD88](*(void *)&id_type, identifier, identifier_size, uu);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1895FBE40]();
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
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

void objc_exception_rethrow(void)
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

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

objc_exception_preprocessor objc_setExceptionPreprocessor(objc_exception_preprocessor fn)
{
  return (objc_exception_preprocessor)MEMORY[0x189616910](fn);
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1895FC6E8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1896169F8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x189616A00](property);
}

objc_property_t *__cdecl protocol_copyPropertyList2( Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x189616A28](proto, outCount, isRequiredProperty, isInstanceProperty);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FCD78](a1, *(void *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1895FCDA0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

uint64_t sandbox_set_container_path_for_audit_token()
{
  return MEMORY[0x1895FCDF0]();
}

uint64_t sandbox_set_user_state_item_with_persona()
{
  return MEMORY[0x189617088]();
}

uint64_t sandbox_user_state_iterate_items()
{
  return MEMORY[0x189617090]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCE80](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sqlite3_bind_blob64( sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170C8](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1896170E0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x189617110](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x189617130](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617138](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617150](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x189617178](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1896171E8](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_read( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1895FD5A8](*(void *)&target_task, address, size, data, dataCnt);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1895FD5D0]();
}

uint64_t voucher_get_current_persona_originator_info()
{
  return MEMORY[0x1895FD5D8]();
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return MEMORY[0x1895FD5E0]();
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1895FD608]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC10](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
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

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1895FDC70]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1895FDED0]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1895FE0A8]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

uint64_t objc_msgSend__checkIsAllowedToHaveSandboxExtensionForIdentity_containerPath_containerConfig_allowed_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkIsAllowedToHaveSandboxExtensionForIdentity_containerPath_containerConfig_allowed_error_);
}

uint64_t objc_msgSend__checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath_identifier_containerConfig_allowed_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath_identifier_containerConfig_allowed_error_);
}

uint64_t objc_msgSend__checkShouldIssueExtensionForIdentity_containerPath_legacyExtensionPolicy_extensionsPolicyUsesProxiedClient_issueExtension_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkShouldIssueExtensionForIdentity_containerPath_legacyExtensionPolicy_extensionsPolicyUsesProxiedClient_issueExtension_error_);
}

uint64_t objc_msgSend__cleanupUnreferencedGroupContainersForUserIdentity_containerClass_referenceCounts_context_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__cleanupUnreferencedGroupContainersForUserIdentity_containerClass_referenceCounts_context_);
}

uint64_t objc_msgSend__concurrent_generateCacheEntryWithURL_identifier_containerPath_schemaVersion_uuid_metadata_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__concurrent_generateCacheEntryWithURL_identifier_containerPath_schemaVersion_uuid_metadata_);
}

uint64_t objc_msgSend__concurrent_setSandboxContainerMappingForUserIdentity_identifier_containerClass_url_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__concurrent_setSandboxContainerMappingForUserIdentity_identifier_containerClass_url_);
}

uint64_t objc_msgSend__concurrent_shouldRegisterSandboxMappingWithUserIdentity_identifier_childParentMapCache_containerClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__concurrent_shouldRegisterSandboxMappingWithUserIdentity_identifier_childParentMapCache_containerClass_);
}

uint64_t objc_msgSend__concurrent_slowGenerateCacheEntryWithFileHandle_URL_identifier_uuid_schemaVersion_containerPath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__concurrent_slowGenerateCacheEntryWithFileHandle_URL_identifier_uuid_schemaVersion_containerPath_);
}

uint64_t objc_msgSend__containerIdentifiersIncludingUnownedForContainerClass_canAccessAllContainers_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__containerIdentifiersIncludingUnownedForContainerClass_canAccessAllContainers_error_);
}

uint64_t objc_msgSend__containersToDeleteRecursivelyStartingWithContainerIdentities_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__containersToDeleteRecursivelyStartingWithContainerIdentities_error_);
}

uint64_t objc_msgSend__fabricateMetadataForContainerPath_identifier_uuid_schemaVersion_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__fabricateMetadataForContainerPath_identifier_uuid_schemaVersion_userIdentityCache_);
}

uint64_t objc_msgSend__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error_);
}

uint64_t objc_msgSend__inLibraryRepairBlock_createURLIfNecessary_mode_owner_dataProtectionClass_exists_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__inLibraryRepairBlock_createURLIfNecessary_mode_owner_dataProtectionClass_exists_error_);
}

uint64_t objc_msgSend__initFromMetadataInDictionary_containerPath_userIdentity_containerClass_fsNode_fileURL_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initFromMetadataInDictionary_containerPath_userIdentity_containerClass_fsNode_fileURL_userIdentityCache_error_);
}

uint64_t objc_msgSend__initWithContainerIdentities_manifests_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithContainerIdentities_manifests_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_);
}

uint64_t objc_msgSend__isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier_clientIdentifier_containerConfig_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier_clientIdentifier_containerConfig_);
}

uint64_t objc_msgSend__materializeContainerIdentityFromManifestPlist_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__materializeContainerIdentityFromManifestPlist_userIdentityCache_error_);
}

uint64_t objc_msgSend__materializeContainerIdentityFromManifestPlistV1_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__materializeContainerIdentityFromManifestPlistV1_userIdentityCache_error_);
}

uint64_t objc_msgSend__metadataFromContainerPath_identifier_uuid_schemaVersion_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__metadataFromContainerPath_identifier_uuid_schemaVersion_userIdentityCache_);
}

uint64_t objc_msgSend__onQueue_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__onQueue_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_);
}

uint64_t objc_msgSend__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler_);
}

uint64_t objc_msgSend__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock_);
}

uint64_t objc_msgSend__onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo_identifier_containerClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo_identifier_containerClass_);
}

uint64_t objc_msgSend__onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy_containerClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy_containerClass_);
}

uint64_t objc_msgSend__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler_);
}

uint64_t objc_msgSend__onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error_);
}

uint64_t objc_msgSend__onQueue_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__onQueue_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_);
}

uint64_t objc_msgSend__overlayValueAtKey_intoTargetDictionary_fromSourceDictionary_targetTakePrecedent_nestedDictionaryHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__overlayValueAtKey_intoTargetDictionary_fromSourceDictionary_targetTakePrecedent_nestedDictionaryHandler_);
}

uint64_t objc_msgSend__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error_);
}

uint64_t objc_msgSend__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error_);
}

uint64_t objc_msgSend__resolveArguments_toSourcePathArgument_destPathArgument_destFinalPathArgument_context_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__resolveArguments_toSourcePathArgument_destPathArgument_destFinalPathArgument_context_);
}

uint64_t objc_msgSend__shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig_identifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig_identifier_);
}

uint64_t objc_msgSend_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_);
}

uint64_t objc_msgSend_clientIdentityWithAuditToken_proximateAuditToken_personaUniqueString_error_generator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_clientIdentityWithAuditToken_proximateAuditToken_personaUniqueString_error_generator_);
}

uint64_t objc_msgSend_commandForOperationDeleteWithContainerIdentities_removeAllCodeSignInfo_context_resultPromise_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_commandForOperationDeleteWithContainerIdentities_removeAllCodeSignInfo_context_resultPromise_);
}

uint64_t objc_msgSend_containerIdentityWithIdentifier_containerConfig_platform_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containerIdentityWithIdentifier_containerConfig_platform_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_containerPathIdentifier_existed_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_containerPathIdentifier_existed_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containerIdentityWithUUID_userIdentity_identifier_containerConfig_platform_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerIdentityWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containerIdentityWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerIdentityWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containerIdentityWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_);
}

uint64_t objc_msgSend_containerPathForUserIdentity_containerClass_containerPathIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containerPathForUserIdentity_containerClass_containerPathIdentifier_);
}

uint64_t objc_msgSend_containerSchemaWithMetadata_finalContainerPath_dataProtectionClass_libraryRepair_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containerSchemaWithMetadata_finalContainerPath_dataProtectionClass_libraryRepair_);
}

uint64_t objc_msgSend_contextWithHomeDirectoryURL_containerPath_finalContainerPath_POSIXMode_POSIXOwner_containerClass_dataProtectionClass_libraryRepair_identifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_contextWithHomeDirectoryURL_containerPath_finalContainerPath_POSIXMode_POSIXOwner_containerClass_dataProtectionClass_libraryRepair_identifier_);
}

uint64_t objc_msgSend_copyEntitlementsDictionaryByAddingGroupContainerOfClass_groupIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_copyEntitlementsDictionaryByAddingGroupContainerOfClass_groupIdentifier_);
}

uint64_t objc_msgSend_copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier_);
}

uint64_t objc_msgSend_copyEntitlementsDictionaryByRemovingGroupContainerOfClass_groupIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_copyEntitlementsDictionaryByRemovingGroupContainerOfClass_groupIdentifier_);
}

uint64_t objc_msgSend_copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier_);
}

uint64_t objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_error_);
}

uint64_t objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error_);
}

uint64_t objc_msgSend_createStagedContainerForContainerIdentity_finalContainerPath_dataProtectionClass_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createStagedContainerForContainerIdentity_finalContainerPath_dataProtectionClass_error_);
}

uint64_t objc_msgSend_dataProtectionChangeOperationWithContainerMetadata_settingClass_retryingIfLocked_changeType_queue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_dataProtectionChangeOperationWithContainerMetadata_settingClass_retryingIfLocked_changeType_queue_);
}

uint64_t objc_msgSend_deleteContainerRootURL_userIdentity_containerClass_containerPathIdentifier_preferDirectDelete_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_deleteContainerRootURL_userIdentity_containerClass_containerPathIdentifier_preferDirectDelete_error_);
}

uint64_t objc_msgSend_fixAndRetryIfPermissionsErrorWithURL_containerPath_containerIdentifier_error_duringBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_fixAndRetryIfPermissionsErrorWithURL_containerPath_containerIdentifier_error_duringBlock_);
}

uint64_t objc_msgSend_fixAndRetryIfPermissionsErrorWithURL_containerRootURL_error_duringBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fixAndRetryIfPermissionsErrorWithURL_containerRootURL_error_duringBlock_);
}

uint64_t objc_msgSend_groupContainerIdentifiersForOwnerIdentifier_groupContainerClass_codeSignInfo_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_groupContainerIdentifiersForOwnerIdentifier_groupContainerClass_codeSignInfo_withError_);
}

uint64_t objc_msgSend_initByReadingAndValidatingMetadataAtContainerPath_userIdentity_containerClass_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initByReadingAndValidatingMetadataAtContainerPath_userIdentity_containerClass_userIdentityCache_error_);
}

uint64_t objc_msgSend_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error_);
}

uint64_t objc_msgSend_initFromContainerPath_identifier_uuid_schemaVersion_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initFromContainerPath_identifier_uuid_schemaVersion_userIdentityCache_);
}

uint64_t objc_msgSend_initWithBaseURL_categoryComponent_classComponent_containerClass_POSIXOwner_POSIXMode_userIdentity_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithBaseURL_categoryComponent_classComponent_containerClass_POSIXOwner_POSIXMode_userIdentity_);
}

uint64_t objc_msgSend_initWithClientIdentity_containerCache_containerFactory_userIdentityCache_kernelPersonaID_globalConfiguration_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithClientIdentity_containerCache_containerFactory_userIdentityCache_kernelPersonaID_globalConfiguration_);
}

uint64_t objc_msgSend_initWithClientIdentity_containerCache_containerFactory_userIdentityCache_kernelPersonaID_globalConfiguration_classIterator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithClientIdentity_containerCache_containerFactory_userIdentityCache_kernelPersonaID_globalConfiguration_classIterator_);
}

uint64_t objc_msgSend_initWithContainerClassPath_cacheEntryClass_targetQueue_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContainerClassPath_cacheEntryClass_targetQueue_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerClassPath_containerPathIdentifier_containerRootComponent_containerDataComponent_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerClassPath_containerPathIdentifier_containerRootComponent_containerDataComponent_);
}

uint64_t objc_msgSend_initWithContainerIdentities_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerIdentities_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_);
}

uint64_t objc_msgSend_initWithContainerIdentity_containerPath_schemaVersion_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContainerIdentity_containerPath_schemaVersion_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerIdentity_info_containerPath_userManagedAssetsDirName_schemaVersion_dataProtectionClass_creator_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerIdentity_info_containerPath_userManagedAssetsDirName_schemaVersion_dataProtectionClass_creator_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerIdentity_info_containerPath_userManagedAssetsDirName_schemaVersion_dataProtectionClass_fsNode_creator_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerIdentity_info_containerPath_userManagedAssetsDirName_schemaVersion_dataProtectionClass_fsNode_creator_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerIdentity_thirdParty_dataProtectionClass_retryIfLocked_skipIfUnchanged_context_resultPromise_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerIdentity_thirdParty_dataProtectionClass_retryIfLocked_skipIfUnchanged_context_resultPromise_);
}

uint64_t objc_msgSend_initWithContainerMetadata_newClass_retryingIfLocked_changeType_internalChangeID_queue_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerMetadata_newClass_retryingIfLocked_changeType_internalChangeID_queue_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerMetadata_newClass_retryingIfLocked_changeType_queue_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerMetadata_newClass_retryingIfLocked_changeType_queue_userIdentityCache_);
}

uint64_t objc_msgSend_initWithContainerPath_containerIdentity_uuid_sandboxToken_includePath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContainerPath_containerIdentity_uuid_sandboxToken_includePath_);
}

uint64_t objc_msgSend_initWithContainerPaths_containerIdentities_includePath_clientIdentity_skipSandboxExtensions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainerPaths_containerIdentities_includePath_clientIdentity_skipSandboxExtensions_);
}

uint64_t objc_msgSend_initWithContainers_clientIdentity_issueSandboxExtensions_includePath_includeInfo_legacyPersonaPolicy_legacyExtensionPolicy_includeUserManagedAssetsRelPath_includeCreator_extensionsUseProxiedClient_extensionsPolicyUsesProxiedClient_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainers_clientIdentity_issueSandboxExtensions_includePath_includeInfo_legacyPersonaPolicy_legacyExtensionPolicy_includeUserManagedAssetsRelPath_includeCreator_extensionsUseProxiedClient_extensionsPolicyUsesProxiedClient_);
}

uint64_t objc_msgSend_initWithContainers_includePath_includeInfo_includeUserManagedAssetsRelPath_includeCreator_clientIdentity_skipSandboxExtensions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContainers_includePath_includeInfo_includeUserManagedAssetsRelPath_includeCreator_clientIdentity_skipSandboxExtensions_);
}

uint64_t objc_msgSend_initWithHomeDirectoryURL_containerPath_finalContainerPath_POSIXMode_POSIXOwner_containerClass_dataProtectionClass_libraryRepair_identifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithHomeDirectoryURL_containerPath_finalContainerPath_POSIXMode_POSIXOwner_containerClass_dataProtectionClass_libraryRepair_identifier_);
}

uint64_t objc_msgSend_initWithIdentifier_containerPath_schemaVersion_uuid_metadata_userIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithIdentifier_containerPath_schemaVersion_uuid_metadata_userIdentityCache_);
}

uint64_t objc_msgSend_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
}

uint64_t objc_msgSend_initWithManifests_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithManifests_waitForDiskSpaceReclaim_removeAllCodeSignInfo_context_resultPromise_);
}

uint64_t objc_msgSend_initWithMetadata_finalContainerPath_dataProtectionClass_libraryRepair_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithMetadata_finalContainerPath_dataProtectionClass_libraryRepair_);
}

uint64_t objc_msgSend_initWithMetadata_sandboxToken_includePath_includeInfo_includeUserManagedAssetsRelPath_includeCreator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithMetadata_sandboxToken_includePath_includeInfo_includeUserManagedAssetsRelPath_includeCreator_);
}

uint64_t objc_msgSend_initWithPOSIXUser_POSIXPID_platform_userIdentity_proximateClient_auditToken_codeSignInfo_sandboxed_sandboxContainerURL_testClient_kernel_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPOSIXUser_POSIXPID_platform_userIdentity_proximateClient_auditToken_codeSignInfo_sandboxed_sandboxContainerURL_testClient_kernel_);
}

uint64_t objc_msgSend_initWithPOSIXUser_homeDirectoryURL_personaUniqueString_personaType_kernelPersonaID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPOSIXUser_homeDirectoryURL_personaUniqueString_personaType_kernelPersonaID_);
}

uint64_t objc_msgSend_initWithPath_relativeToFileHandle_direction_symlinks_createMode_createDPClass_openLazily_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPath_relativeToFileHandle_direction_symlinks_createMode_createDPClass_openLazily_);
}

uint64_t objc_msgSend_initWithRawPlist_preprocessedPlist_pathOrName_protocol_defaultPlistDirectoryURL_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithRawPlist_preprocessedPlist_pathOrName_protocol_defaultPlistDirectoryURL_);
}

uint64_t objc_msgSend_initWithSourcePathArgument_destinationPathArgument_destFinalPathArgument_context_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSourcePathArgument_destinationPathArgument_destFinalPathArgument_context_);
}

uint64_t objc_msgSend_initWithStaticConfig_runMode_userContainerMode_bundleContainerMode_bundleContainerOwner_systemContainerMode_systemContainerOwner_kernelUpcallEnabled_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithStaticConfig_runMode_userContainerMode_bundleContainerMode_bundleContainerOwner_systemContainerMode_systemContainerOwner_kernelUpcallEnabled_);
}

uint64_t objc_msgSend_initWithSystemContainerMapping_systemGroupContainerMapping_bypassListedCodeSignIdentifierMapping_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSystemContainerMapping_systemGroupContainerMapping_bypassListedCodeSignIdentifierMapping_);
}

uint64_t objc_msgSend_initWithUID_primaryGID_homeDirectoryURL_unvalidatedHomeDirectoryURL_name_roleUser_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUID_primaryGID_homeDirectoryURL_unvalidatedHomeDirectoryURL_name_roleUser_);
}

uint64_t objc_msgSend_initWithUUID_containerPathIdentifier_identifier_containerClass_POSIXUser_personaUniqueString_sandboxToken_existed_url_info_transient_userManagedAssetsRelPath_creator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUUID_containerPathIdentifier_identifier_containerClass_POSIXUser_personaUniqueString_sandboxToken_existed_url_info_transient_userManagedAssetsRelPath_creator_);
}

uint64_t objc_msgSend_initWithUUID_containerPathIdentifier_identifier_containerClass_POSIXUser_personaUniqueString_sandboxToken_existed_url_info_transient_userManagedAssetsRelPath_creator_relativePath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUUID_containerPathIdentifier_identifier_containerClass_POSIXUser_personaUniqueString_sandboxToken_existed_url_info_transient_userManagedAssetsRelPath_creator_relativePath_);
}

uint64_t objc_msgSend_initWithUUID_userIdentity_identifier_containerConfig_platform_containerPathIdentifier_existed_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUUID_userIdentity_identifier_containerConfig_platform_containerPathIdentifier_existed_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_initWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_initWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_);
}

uint64_t objc_msgSend_initWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_);
}

uint64_t objc_msgSend_initWithUserIdentityCache_childParentMapCache_classCacheClass_cacheEntryClass_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUserIdentityCache_childParentMapCache_classCacheClass_cacheEntryClass_error_);
}

uint64_t objc_msgSend_initWithUserIdentityCache_childParentMapCache_classCacheClass_cacheEntryClass_queue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUserIdentityCache_childParentMapCache_classCacheClass_cacheEntryClass_queue_);
}

uint64_t objc_msgSend_initWithUserIdentityCache_clientCodeSignInfoCache_clientIdentityCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUserIdentityCache_clientCodeSignInfoCache_clientIdentityCache_);
}

uint64_t objc_msgSend_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library_);
}

uint64_t objc_msgSend_intendedDataProtectionClassBasedOnEntitlementsForIdentifier_clientIdentity_containerClass_info_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_intendedDataProtectionClassBasedOnEntitlementsForIdentifier_clientIdentity_containerClass_info_);
}

uint64_t objc_msgSend_isLookupAllowedToBypassEntitlementFromCodeSignIdentifier_forContainerClass_containerIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_isLookupAllowedToBypassEntitlementFromCodeSignIdentifier_forContainerClass_containerIdentifier_);
}

uint64_t objc_msgSend_issueSandboxExtensionWithIdentity_containerPath_legacyExtensionPolicy_extensionsUseProxiedClient_extensionsPolicyUsesProxiedClient_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_issueSandboxExtensionWithIdentity_containerPath_legacyExtensionPolicy_extensionsUseProxiedClient_extensionsPolicyUsesProxiedClient_error_);
}

uint64_t objc_msgSend_managedPathByAppendingPathComponent_flags_ACLConfig_mode_dpClass_owner_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_managedPathByAppendingPathComponent_flags_ACLConfig_mode_dpClass_owner_);
}

uint64_t objc_msgSend_removeContainerForUserIdentity_contentClass_identifier_transient_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removeContainerForUserIdentity_contentClass_identifier_transient_error_);
}

uint64_t objc_msgSend_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler_);
}

uint64_t objc_msgSend_schemaIsUpToDateForIdentifier_containerClass_currentSchemaVersion_latestSchemaVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_schemaIsUpToDateForIdentifier_containerClass_currentSchemaVersion_latestSchemaVersion_);
}

uint64_t objc_msgSend_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error_);
}

uint64_t objc_msgSend_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion_);
}

uint64_t objc_msgSend_signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig_teamID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig_teamID_);
}

uint64_t objc_msgSend_stagingContainerPathForDestinationContainerPath_stagingPathIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_stagingContainerPathForDestinationContainerPath_stagingPathIdentifier_);
}

uint64_t objc_msgSend_userIdentityForContainerIdentifier_clientIdentity_containerClass_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_userIdentityForContainerIdentifier_clientIdentity_containerClass_error_);
}