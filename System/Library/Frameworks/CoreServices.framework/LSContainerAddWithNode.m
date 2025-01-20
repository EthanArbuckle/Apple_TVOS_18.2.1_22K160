@interface LSContainerAddWithNode
@end

@implementation LSContainerAddWithNode

void ___LSContainerAddWithNode_block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  v45 = 0LL;
  id v46 = 0LL;
  __int16 v44 = 0;
  v2 = *(void **)(a1 + 32);
  id v43 = 0LL;
  BOOL v3 = _LSCreateContainerNodesAndFlagsForNode(v2, &v46, &v45, &v44, &v43);
  id v4 = v43;
  if (v46) {
    BOOL v5 = v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v42 = v4;
    [v46 bookmarkDataRelativeToNode:0 error:&v42];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v42;

    BOOL v3 = v38 != 0LL;
    id v4 = v6;
  }

  else
  {
    v38 = 0LL;
  }

  if (!v3 || v45 == 0LL)
  {
    v8 = 0LL;
  }

  else
  {
    id v41 = v4;
    [v45 bookmarkDataRelativeToNode:0 error:&v41];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v41;

    if (!v8)
    {
      _LSDefaultLog();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v45;
        _os_log_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_INFO,  "_LSContainerAddWithNode(%{private}@, failed to get bookmarkData for diskImageNode %{private}@ but registering this container anyway.",  buf,  0x16u);
      }

      v8 = 0LL;
    }

    id v4 = v9;
  }

  uint64_t v40 = 0LL;
  id v12 = v46;
  if (v46) {
    BOOL v13 = v3;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    id v39 = v4;
    int v14 = [v46 getVolumeIdentifier:&v40 error:&v39];
    id v36 = v39;

    if (v14)
    {
      id v12 = v46;
      uint64_t v15 = v40;
LABEL_26:
      __int16 v16 = v44;
      int v17 = *(unsigned __int8 *)(a1 + 56);
      __int128 v37 = *(_OWORD *)(a1 + 40);
      id v18 = v12;
      id v19 = v38;
      id v20 = v8;
      id v35 = (id)v37;
      MEMORY[0x186E2AFD4](v35, v21, v22);
      uint64_t v23 = MEMORY[0x1895F87A8];
      *(void *)buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke;
      v50 = &unk_189D74EC0;
      id v24 = v18;
      __int16 v56 = v16;
      id v51 = v24;
      uint64_t v55 = v15;
      id v25 = v35;
      __int128 v54 = v37;
      id v26 = v19;
      id v52 = v26;
      id v27 = v20;
      id v53 = v27;
      uint64_t v28 = MEMORY[0x186E2A7B8](buf);
      v29 = (void *)v28;
      if (v17)
      {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
      }

      else
      {
        v34 = +[LSDBExecutionContext sharedServerInstance]();
        v47[0] = v23;
        v47[1] = 3221225472LL;
        v47[2] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_30;
        v47[3] = &unk_189D73FA8;
        id v48 = v29;
        -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v34, v47);
      }

      id v4 = v36;
      goto LABEL_34;
    }

    id v4 = v36;
  }

  else if (v3)
  {
    uint64_t v15 = 0LL;
    id v36 = v4;
    goto LABEL_26;
  }

  _LSDefaultLog();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    int v32 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v32;
    _os_log_impl( &dword_183E58000,  v30,  OS_LOG_TYPE_INFO,  "_LSContainerAddWithNode(%{private}@ sync=%{BOOL}d) failed to add container.",  buf,  0x12u);
  }

  uint64_t v33 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_34:
  MEMORY[0x186E2AFE0](v33);
}

uint64_t ___LSContainerAddWithNode_block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t ___LSContainerAddWithNode_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end