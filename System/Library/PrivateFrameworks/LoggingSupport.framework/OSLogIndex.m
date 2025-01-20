@interface OSLogIndex
@end

@implementation OSLogIndex

uint64_t __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke( uint64_t a1,  uint64_t *a2,  uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v5 = *(void **)(a1 + 48);
  v6 = a2 + 1;
  uint64_t v7 = *a2;
  [*(id *)(a1 + 32) tracepoints];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 fileNames];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectAtIndexedSubscript:*(unsigned __int16 *)(a3 + 16)];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _setLogEvent:a3 rangeUUIDIndex:v7 machTimebase:v6 traceFilename:v10];

  if (*(_DWORD *)a3 == 3
    && [*(id *)(a1 + 48) type] == 1024
    && [*(id *)(a1 + 48) _oversizeIdentifier])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0LL;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        uint64_t v16 = 0LL;
        v17 = v14;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          id v14 = *(id *)(*((void *)&v22 + 1) + 8 * v16);

          if (objc_msgSend( v14,  "matches:procinfo:",  objc_msgSend(*(id *)(a1 + 48), "_oversizeIdentifier"),  *(void *)(a3 + 88)))
          {
            [v14 fillProxy:*(void *)(a1 + 48)];
            [*(id *)(a1 + 32) oversizeChunks];
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 removeObject:v14];
            goto LABEL_18;
          }

          ++v16;
          v17 = v14;
        }

        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }

      v18 = v14;
    }

    else
    {
      v18 = 0LL;
    }

    id v14 = 0LL;
LABEL_18:
  }

  else
  {
    id v14 = 0LL;
  }

  v19 = (void *)MEMORY[0x186E40118]();
  uint64_t v20 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v19);
  [*(id *)(a1 + 48) _assertBalanced];

  return v20;
}

uint64_t __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke( uint64_t a1,  uint64_t a2,  int *a3)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  v6 = (void *)MEMORY[0x186E40118]();
  int v7 = *a3;
  if (*a3 == 3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 56LL) = *((void *)a3 + 5) + 16LL;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 72LL) = *((void *)a3 + 6);
    uint64_t v11 = *((void *)a3 + 12);
    _chunk_support_context_update((void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL), *((int **)a3 + 7));
    _chunk_support_convert_tracepoint(v11, (uint64_t)&v31, *(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
    id v12 = 0LL;
    if ((_DWORD)v31 == 1024 && DWORD2(v42))
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v12 = 0LL;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          uint64_t v17 = 0LL;
          v18 = v12;
          do
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v12 = *(id *)(*((void *)&v27 + 1) + 8 * v17);

            if ([v12 matches:DWORD2(v42) procinfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 88)])
            {
              [v12 fillMessage:(char *)&v34 + 8];
              [*(id *)(a1 + 32) oversizeChunks];
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              [v19 removeObject:v12];
              goto LABEL_25;
            }

            ++v17;
            v18 = v12;
          }

          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v45 count:16];
          if (v15) {
            continue;
          }
          break;
        }

        v19 = v12;
      }

      else
      {
        v19 = 0LL;
      }

      id v12 = 0LL;
LABEL_25:
    }

    char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    if ((_DWORD)v31 == 2560)
    {
      free(*(void **)&v39[1]);
      *(void *)&v39[1] = 0LL;
    }
  }

  else
  {
    if (v7 == 2)
    {
      unint64_t v20 = *((void *)a3 + 1);
      char v21 = *((_BYTE *)a3 + 56);
      int v22 = *((unsigned __int8 *)a3 + 57);
      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8LL);
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      memset(v39, 0, sizeof(v39));
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)(a3 + 10);
      LODWORD(v31) = 1280;
      *(void *)&__int128 v40 = 1LL;
      BYTE8(v41) = v21;
      if (v22) {
        *(void *)&__int128 v40 = 3LL;
      }
      uint64_t v24 = *(void *)(v23 + 120);
      if (!v24) {
        goto LABEL_21;
      }
      unint64_t v25 = _timesync_continuous_to_wall_time(v24, (_OWORD *)((char *)v39 + 12), v20, &v38);
      unint64_t v9 = v25 / 0x3B9ACA00;
      unsigned int v10 = v25 % 0x3B9ACA00;
LABEL_20:
      *(void *)&__int128 v37 = v9;
      DWORD2(v37) = v10 / 0x3E8;
LABEL_21:
      char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
      goto LABEL_29;
    }

    if (v7 == 1)
    {
      memset(v39, 0, sizeof(v39));
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)(a3 + 10);
      LODWORD(v31) = 1280;
      unint64_t v8 = *((void *)a3 + 9);
      *((void *)&v40 + 1) = *((void *)a3 + 8);
      *(void *)&__int128 v41 = v8;
      *(void *)&__int128 v35 = *((void *)&v40 + 1);
      *(void *)&__int128 v38 = *((void *)a3 + 10);
      unint64_t v9 = v8 / 0x3B9ACA00;
      unsigned int v10 = v8 % 0x3B9ACA00;
      goto LABEL_20;
    }
  }

uint64_t __36___OSLogIndex__readArchiveMetadata___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end