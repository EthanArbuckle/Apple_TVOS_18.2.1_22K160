@interface CacheDeleteEnumerateRemovedFiles
@end

@implementation CacheDeleteEnumerateRemovedFiles

double ___CacheDeleteEnumerateRemovedFiles_block_invoke()
{
  v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.CacheDeleteEnumerateRemovedFiles", v0);
  v2 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v1;

  if (mach_timebase_info(&info))
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1874E4000, v5, OS_LOG_TYPE_ERROR, "Failed to get timebase info\n", v7, 2u);
    }
  }

  else
  {
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    double result = (double)v3 / (double)v4;
    gTimebaseConversion = *(void *)&result;
  }

  return result;
}

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_82(uint64_t a1)
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  q = dispatch_queue_create("com.apple.CacheDeleteFSEvents", v2);

  unint64_t v3 = (void *)objc_opt_new();
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  uint64_t v95 = a1;
  FSEventStreamEventId sinceWhen = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v104 objects:v125 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v105;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v105 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        bzero(v117, 0x400uLL);
        id v9 = v8;
        if (!realpath_DARWIN_EXTSN((const char *)[v9 UTF8String], v117))
        {
          CDGetLogHandle((uint64_t)"client");
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = [v9 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v109 = v17;
            _os_log_error_impl( &dword_1874E4000,  v10,  OS_LOG_TYPE_ERROR,  "_CacheDeleteEnumerateRemovedFiles: Unable to realpath \"%{public}s\"",  buf,  0xCu);
          }
        }

        normalizePath(v9, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          mapVolume(v11, 0);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          [v3 objectForKeyedSubscript:v13];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = (void *)objc_opt_new();
            [v3 setObject:v14 forKeyedSubscript:v13];
          }

          mapVolume(v9, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 addObject:v15];

          CDGetLogHandle((uint64_t)"client");
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v109 = (uint64_t)v9;
            __int16 v110 = 2114;
            FSEventStreamEventId v111 = (FSEventStreamEventId)v13;
            _os_log_impl( &dword_1874E4000,  v16,  OS_LOG_TYPE_DEFAULT,  "_CacheDeleteEnumerateRemovedFiles: validated \"%{public}@\" on \"%{public}@\"",  buf,  0x16u);
          }
        }

        else
        {
          CDGetLogHandle((uint64_t)"client");
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v109 = (uint64_t)v9;
            _os_log_error_impl( &dword_1874E4000,  v13,  OS_LOG_TYPE_ERROR,  "_CacheDeleteEnumerateRemovedFiles: unable to associate directory: %{public}@ with a volume",  buf,  0xCu);
          }
        }
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v104 objects:v125 count:16];
    }

    while (v5);
  }

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  obuint64_t j = v3;
  uint64_t v91 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v101;
    do
    {
      for (uint64_t j = 0LL; j != v91; ++j)
      {
        if (*(void *)v101 != v90) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        [obj objectForKeyedSubscript:v19];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 =  -[CDRemoveEventsConsumer initWithConsumer:identifier:]( objc_alloc(&OBJC_CLASS___CDRemoveEventsConsumer),  "initWithConsumer:identifier:",  *(void *)(v95 + 32),  *(void *)(v95 + 56));
        *(void *)v117 = 0LL;
        v118 = v117;
        uint64_t v119 = 0x4810000000LL;
        uint64_t v121 = 0LL;
        __int128 v123 = 0u;
        uint64_t v124 = 0LL;
        v120 = &unk_187520606;
        v122 = v21;
        FSEventStreamEventId v22 = sinceWhen;
        if (sinceWhen)
        {
LABEL_26:
          FSEventStreamEventId sinceWhen = v22;
          if (v22 == -1LL)
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"_CacheDeleteEnumerateRemovedFiles: Invalid _since parameter: %llu (0x%032llx)",  -1,  -1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            CDSimulateCrash(195890385LL, v23);

            FSEventStreamEventId sinceWhen = FSEventsGetCurrentEventId();
            CDGetLogHandle((uint64_t)"client");
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v109 = -1LL;
              __int16 v110 = 2048;
              FSEventStreamEventId v111 = sinceWhen;
              _os_log_error_impl( &dword_1874E4000,  v24,  OS_LOG_TYPE_ERROR,  "_CacheDeleteEnumerateRemovedFiles: reset _since from %llu to current event id: %llu",  buf,  0x16u);
            }
          }

          v25 = v118;
          [v20 allObjects];
          v26 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          v27 = FSEventStreamCreate( 0LL,  (FSEventStreamCallback)fsEventStreamCallback,  (FSEventStreamContext *)(v25 + 32),  v26,  sinceWhen,  0.0,  0x53u);

          if (v27)
          {
            if (q)
            {
              CDGetLogHandle((uint64_t)"client");
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( &dword_1874E4000,  v28,  OS_LOG_TYPE_DEFAULT,  "_CacheDeleteEnumerateRemovedFiles: dispatching queue..",  buf,  2u);
              }
            }

            FSEventStreamSetDispatchQueue(v27, q);
            -[CDRemoveEventsConsumer setSince:](v21, "setSince:", sinceWhen);
            CDGetLogHandle((uint64_t)"client");
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              [v20 allObjects];
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              uint64_t v109 = (uint64_t)v21;
              __int16 v110 = 2048;
              FSEventStreamEventId v111 = (FSEventStreamEventId)q;
              __int16 v112 = 2048;
              FSEventStreamEventId v113 = sinceWhen;
              __int16 v114 = 2112;
              v115 = v30;
              _os_log_impl( &dword_1874E4000,  v29,  OS_LOG_TYPE_DEFAULT,  "_CacheDeleteEnumerateRemovedFiles: CDConsumer %@ consuming stream (queue: %p) from ID: %llu for dirs: %@",  buf,  0x2Au);
            }

            -[CDRemoveEventsConsumer consumeStream:forVolume:](v21, "consumeStream:forVolume:", v27, v19);
          }

          else
          {
            CDGetLogHandle((uint64_t)"client");
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v53 = __error();
              v54 = strerror(*v53);
              *(_DWORD *)buf = 138543618;
              uint64_t v109 = (uint64_t)v19;
              __int16 v110 = 2080;
              FSEventStreamEventId v111 = (FSEventStreamEventId)v54;
              _os_log_error_impl( &dword_1874E4000,  v46,  OS_LOG_TYPE_ERROR,  "_CacheDeleteEnumerateRemovedFiles: Unable to create FSEventsStream for volume %{public}@: %s",  buf,  0x16u);
            }
          }

          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = ___CacheDeleteEnumerateRemovedFiles_block_invoke_94;
          block[3] = &unk_18A066370;
          block[4] = v117;
          block[5] = v21;
          dispatch_sync(q, block);
          CDGetLogHandle((uint64_t)"client");
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v109 = (uint64_t)v19;
            _os_log_impl( &dword_1874E4000,  v47,  OS_LOG_TYPE_DEFAULT,  "_CacheDeleteEnumerateRemovedFiles: Finished streaming events for %@",  buf,  0xCu);
          }

          char v48 = 0;
          goto LABEL_103;
        }

        id v88 = *(id *)(v95 + 56);
        id sinceWhena = v19;
        v31 = +[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:");
        if (v31)
        {
          domain(v88);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v33 = (os_log_s *)objc_alloc_init(MEMORY[0x189604038]);
          os_log_t log = v33;
          if (v33)
          {
            -[os_log_s objectForKey:](v33, "objectForKey:", v32);
            osos_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (oslog)
            {
              [v31 uuid];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v34 UUIDString];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = -[os_log_s objectForKeyedSubscript:](oslog, "objectForKeyedSubscript:", v35);
              if (v83)
              {
                [v83 objectAtIndexedSubscript:0];
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                [v31 FSEventsUUID];
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                [v37 UUIDString];
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                char v39 = [v36 isEqualToString:v38];

                if ((v39 & 1) != 0)
                {
                  [v83 objectAtIndexedSubscript:0];
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    [v83 objectAtIndexedSubscript:1];
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = calloc(0x28uLL, 1uLL);
                    v92[4] = [v41 unsignedLongLongValue];
                    v42 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v40];
                    [v42 getUUIDBytes:v92 + 2];

                    [v31 uuid];
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    [v43 getUUIDBytes:v92];

                    CDGetLogHandle((uint64_t)"client");
                    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      CDPurgeMarkerDescription((uint64_t)v92);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      uint64_t v109 = (uint64_t)v32;
                      __int16 v110 = 2114;
                      FSEventStreamEventId v111 = (FSEventStreamEventId)v45;
                      _os_log_impl( &dword_1874E4000,  v44,  OS_LOG_TYPE_DEFAULT,  "copyPurgeMarker(%{public}@): returning %{public}@",  buf,  0x16u);
                    }

                    goto LABEL_71;
                  }

                  CDGetLogHandle((uint64_t)"client");
                  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v109 = (uint64_t)v83;
                    _os_log_error_impl( &dword_1874E4000,  v52,  OS_LOG_TYPE_ERROR,  "copyPurgeMarker: Unable to get FSEventsUUISStr from: %{public}@",  buf,  0xCu);
                  }
                }

                else
                {
                  CDGetLogHandle((uint64_t)"client");
                  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    [v31 FSEventsUUID];
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    [v93 UUIDString];
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    [v83 objectAtIndexedSubscript:0];
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    [v31 mountPoint];
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    uint64_t v109 = (uint64_t)v79;
                    __int16 v110 = 2114;
                    FSEventStreamEventId v111 = (FSEventStreamEventId)v80;
                    __int16 v112 = 2114;
                    FSEventStreamEventId v113 = (FSEventStreamEventId)v81;
                    _os_log_error_impl( &dword_1874E4000,  v52,  OS_LOG_TYPE_ERROR,  "copyPurgeMarker: Current FSEventsUUID (%{public}@) does not match saved UUID (%{public}@) for volume %{public}@",  buf,  0x20u);
                  }
                }
              }

              else
              {
                CDGetLogHandle((uint64_t)"client");
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  [v31 mountPoint];
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  [v31 uuid];
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  [v77 UUIDString];
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v109 = (uint64_t)v76;
                  __int16 v110 = 2114;
                  FSEventStreamEventId v111 = (FSEventStreamEventId)v78;
                  _os_log_error_impl( &dword_1874E4000,  v51,  OS_LOG_TYPE_ERROR,  "copyPurgeMarker: Unable to get volume defaults for %{public}@ : %{public}@",  buf,  0x16u);
                }
              }

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_94(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = 0LL;
}

@end