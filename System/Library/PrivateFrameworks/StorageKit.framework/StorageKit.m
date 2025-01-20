}

SKStateTransitionEntry *transitionEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:action:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:action:nextState:",  a1,  a2,  a3,  a4);
}

SKStateTransitionEntry *transitionEntrySEL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:nextState:",  a1,  a2,  a3,  a4);
}

SKStateTransitionEntry *endTransitionEntrySEL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:",  a1,  a2,  a3);
}

SKStateTransitionEntry *endTransitionEntry(uint64_t a1, uint64_t a2)
{
  return +[SKStateTransitionEntry entryWithState:event:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:",  a1,  a2);
}

void sub_188F7A8D8(_Unwind_Exception *a1)
{
}

void sub_188F7A944(_Unwind_Exception *a1)
{
}

void sub_188F7AA00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7AAD4(_Unwind_Exception *a1)
{
}

void sub_188F7AC58(_Unwind_Exception *a1)
{
}

LABEL_12:
    objc_sync_exit(v5);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

    v10 = v7;
    goto LABEL_13;
  }

  SKGetOSLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
  }

  [v8 mountParams];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [v7 mountWithParams:v12 error:a5];

  if ((v13 & 1) != 0) {
    goto LABEL_12;
  }
  [v7 ejectWithError:0];
  v14 = 0LL;
LABEL_14:

  return v14;
}

  v22 = 1;
LABEL_15:

  return v22;
}

void sub_188F7AE70(_Unwind_Exception *a1)
{
}

LABEL_14:
  objc_sync_exit(obj);
  return v13;
}

  return v14;
}

    v22 = 0;
    goto LABEL_15;
  }

void sub_188F7B044( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_188F7B1D4(_Unwind_Exception *a1)
{
}

LABEL_16:
  objc_sync_exit(v8);
  return v10;
}

void sub_188F7B740(_Unwind_Exception *a1)
{
}

void sub_188F7B898( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_188F7BA00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7BB74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7BD18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7C234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7C354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F7CD78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_11:
  if (*(_BYTE *)(a1 + 72) && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    v8 = objc_alloc_init(&OBJC_CLASS___SKWaitingForDiskElement);
    -[SKWaitingForDiskElement setDiskDictionary:](v8, "setDiskDictionary:", *(void *)(a1 + 40));
    v9 = MEMORY[0x1895F87A8];
    v10 = 3221225472LL;
    v11 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2;
    v12 = &unk_18A3232A8;
    v14 = *(void *)(a1 + 64);
    v13 = *(id *)(a1 + 48);
    -[SKWaitingForDiskElement setBlock:](v8, "setBlock:", &v9);
    objc_msgSend(*(id *)(*(void *)(a1 + 56) + 64), "addObject:", v8, v9, v10, v11, v12);
  }

  objc_sync_exit(v2);
}

void sub_188F7CF74(_Unwind_Exception *a1)
{
}

void sub_188F7D3A8(_Unwind_Exception *a1)
{
}

void sub_188F7D4BC(_Unwind_Exception *a1)
{
}

void sub_188F7D5EC(_Unwind_Exception *a1)
{
}

void sub_188F7DA48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_188F7DD20(_Unwind_Exception *a1)
{
}

void sub_188F7E494( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_188F7EBEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_188F7EE2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_188F7F248( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_188F7F3E8(_Unwind_Exception *a1)
{
}

id SKHelperConnectionInterface()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x189604010];
  uint64_t v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setClasses:v3 forSelector:sel_eraseWithEraser_reply_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x189604010];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setClasses:v12 forSelector:sel_eraseWithEraser_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

id SKHelperClientInterface()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x189604010];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setClasses:v10 forSelector:sel_requestWithUUID_didCompleteWithResult_ argumentIndex:1 ofReply:0];

  return v0;
}

uint64_t schemeToFormat(uint64_t a1)
{
  if (a1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 16;
  }
  if (a1 == 1) {
    return 8LL;
  }
  else {
    return v1;
  }
}

uint64_t diskTypeToScheme(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kSKDiskTypeGPTWholeDisk[0]])
  {
    uint64_t v2 = 16LL;
  }

  else if ([v1 isEqualToString:kSKDiskTypeMBRWholeDisk[0]])
  {
    uint64_t v2 = 8LL;
  }

  else if ([v1 isEqualToString:kSKDiskTypeAPMWholeDisk[0]])
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = 512LL;
  }

  return v2;
}

void sub_188F83138(_Unwind_Exception *a1)
{
}

void sub_188F83204(_Unwind_Exception *a1)
{
}

void sub_188F83A1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id getPersonalityDict(void *a1, void *a2)
{
  id v3 = a2;
  [a1 infoDictionary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:kExtensionAttributesKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

    uint64_t v4 = (void *)v6;
  }

  [v4 objectForKeyedSubscript:@"FSPersonalities"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:v3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t getCaseSensitive(void *a1, void *a2)
{
  id v3 = a2;
  [a1 objectForKeyedSubscript:@"FSfileObjectsAreCaseSensitive"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v5 = [v3 isEqualToString:@"NTFS"];
  }
  uint64_t v6 = v5;

  return v6;
}

void sub_188F86C60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188F87114(_Unwind_Exception *a1)
{
}

void sub_188F87848(_Unwind_Exception *a1)
{
}

void sub_188F87A00(_Unwind_Exception *a1)
{
}

void sub_188F88724(_Unwind_Exception *exception_object)
{
}

LABEL_27:
      }

      goto LABEL_29;
    }

    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v9 = -1LL;
  }

LABEL_29:
  return v9;
}

void sub_188F89214(_Unwind_Exception *a1)
{
}

void sub_188F89318(_Unwind_Exception *a1)
{
}

id eraseDisk(void *a1, void *a2, void *a3)
{
  v63[1] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  +[SKEraseDisk eraseDiskWithRootDisk:error:](&OBJC_CLASS___SKEraseDisk, "eraseDiskWithRootDisk:error:", v5, a3);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 formattableFilesystems];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_4];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 filteredArrayUsingPredicate:v11];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v10 count])
      {
        [v12 firstObject];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 volumeName];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[SKVolumeDescriptor descriptorWithName:filesystem:]( &OBJC_CLASS___SKVolumeDescriptor,  "descriptorWithName:filesystem:",  v13,  v45);
        if (v14)
        {
          uint64_t v15 = +[SKPartitionDescriptor descriptorWithVolume:]( &OBJC_CLASS___SKPartitionDescriptor,  "descriptorWithVolume:",  v14);
          v44 = (void *)v15;
          if (v15)
          {
            v63[0] = v15;
            [MEMORY[0x189603F18] arrayWithObjects:v63 count:1];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = +[SKEraseDisk eraseDiskWithRootDisk:descriptors:error:]( &OBJC_CLASS___SKEraseDisk,  "eraseDiskWithRootDisk:descriptors:error:",  v5,  v16,  a3);
            if (v43)
            {
              *(void *)&__int128 v58 = 0LL;
              *((void *)&v58 + 1) = &v58;
              uint64_t v59 = 0x3032000000LL;
              v60 = __Block_byref_object_copy__1;
              v61 = __Block_byref_object_dispose__1;
              id v62 = 0LL;
              uint64_t v50 = 0LL;
              v51 = &v50;
              uint64_t v52 = 0x3032000000LL;
              v53 = __Block_byref_object_copy__1;
              v54 = __Block_byref_object_dispose__1;
              id v55 = 0LL;
              SKGetOSLog();
              v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v57 = v5;
                _os_log_impl(&dword_188F75000, v17, OS_LOG_TYPE_DEFAULT, "Submitting erase on %@", buf, 0xCu);
              }

              v46[0] = MEMORY[0x1895F87A8];
              v46[1] = 3221225472LL;
              v46[2] = __eraseDisk_block_invoke_24;
              v46[3] = &unk_18A323700;
              v48 = &v50;
              v49 = &v58;
              v18 = v7;
              v47 = v18;
              uint64_t v19 = [v43 eraseProgressReportingWithCompletionBlock:v46];
              v42 = -[SKProgressObserver initWithProgress:]( objc_alloc(&OBJC_CLASS___SKProgressObserver),  "initWithProgress:",  v19);
              dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
              uint64_t v20 = *((void *)&v58 + 1);
              v41 = (void *)v19;
              if (*(void *)(*((void *)&v58 + 1) + 40LL))
              {
                v21 = -[SKProgressObserver messages](v42, "messages");
                BOOL v22 = [v21 count] == 0;

                uint64_t v20 = *((void *)&v58 + 1);
                if (!v22)
                {
                  [*(id *)(*((void *)&v58 + 1) + 40) userInfo];
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = (void *)[v23 mutableCopy];

                  v24 = (void *)NSString;
                  v39 = -[SKProgressObserver messages](v42, "messages");
                  [v39 componentsJoinedByString:@"\n"];
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  [v24 stringWithFormat:@"%@", v25];
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  [v40 setObject:v26 forKey:*MEMORY[0x189607490]];

                  v27 = (void *)MEMORY[0x189607870];
                  [*(id *)(*((void *)&v58 + 1) + 40) domain];
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v29 = objc_msgSend( v27,  "errorWithDomain:code:userInfo:",  v28,  objc_msgSend(*(id *)(*((void *)&v58 + 1) + 40), "code"),  v40);
                  v30 = *(void **)(*((void *)&v58 + 1) + 40LL);
                  *(void *)(*((void *)&v58 + 1) + 40LL) = v29;

                  uint64_t v20 = *((void *)&v58 + 1);
                }
              }

              if (a3)
              {
                v31 = *(void **)(v20 + 40);
                if (v31) {
                  *a3 = v31;
                }
              }

              id v32 = (id)v51[5];

              _Block_object_dispose(&v50, 8);
              _Block_object_dispose(&v58, 8);

              uint64_t v9 = v43;
            }

            else
            {
              SKGetOSLog();
              v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v5_Block_object_dispose(va, 8) = 136315138;
                *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * "
                                                "_Nonnull __strong, NSError *__autoreleasing * _Nullable)";
                _os_log_impl( &dword_188F75000,  v37,  OS_LOG_TYPE_ERROR,  "%s: Failed to initialize disk eraser",  (uint8_t *)&v58,  0xCu);
              }

              uint64_t v9 = 0LL;
              id v32 = 0LL;
            }
          }

          else
          {
            SKGetOSLog();
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v5_Block_object_dispose(va, 8) = 0;
              _os_log_impl( &dword_188F75000,  v36,  OS_LOG_TYPE_ERROR,  "Failed to create volume partition descriptor",  (uint8_t *)&v58,  2u);
            }

            +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 255LL, a3);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        else
        {
          SKGetOSLog();
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v5_Block_object_dispose(va, 8) = 0;
            _os_log_impl( &dword_188F75000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to create volume descriptor",  (uint8_t *)&v58,  2u);
          }

          +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 255LL, a3);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      else
      {
        v33 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
        [v33 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_15];

        SKGetOSLog();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v5_Block_object_dispose(va, 8) = 0;
          _os_log_impl( &dword_188F75000,  v34,  OS_LOG_TYPE_FAULT,  "Failed to find supported file systems",  (uint8_t *)&v58,  2u);
        }

        +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 255LL, a3);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      SKGetOSLog();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v5_Block_object_dispose(va, 8) = 136315138;
        *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * _Nonnull"
                                        " __strong, NSError *__autoreleasing * _Nullable)";
        _os_log_impl( &dword_188F75000,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to get formattable filesystems",  (uint8_t *)&v58,  0xCu);
      }

      id v32 = 0LL;
    }
  }

  else
  {
    SKGetOSLog();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v5_Block_object_dispose(va, 8) = 136315138;
      *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * _Nonnull _"
                                      "_strong, NSError *__autoreleasing * _Nullable)";
      _os_log_impl( &dword_188F75000,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to initialize disk eraser",  (uint8_t *)&v58,  0xCu);
    }

    id v32 = 0LL;
  }

  return v32;
}

void sub_188F8A758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __eraseDisk_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEncrypted]) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = [v2 isExtension] ^ 1;
  }

  return v3;
}

id __eraseDisk_block_invoke_2()
{
  v4[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = @"faultCode";
  base64Encode((uint64_t)"SKDiskImage.m", 44LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __eraseDisk_block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  SKGetOSLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_DEFAULT, "Erase on %@ done", (uint8_t *)&v12, 0xCu);
  }
}

void sub_188F8AA7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_33];

    SKGetOSLog();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v10;
      _os_log_impl( &dword_188F75000,  v12,  OS_LOG_TYPE_FAULT,  "Unhandled exception during create: %@",  (uint8_t *)&a9,  0xCu);
    }

    +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 255LL, v9);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x188F8AA3CLL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_45:
      int v12 = 0LL;
LABEL_47:

      goto LABEL_48;
    }

    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___SKDiskImageAttachParams);
    -[SKDiskImageAttachParams setPolicy:](v17, "setPolicy:", 0LL);
    -[SKDiskImageAttachParams setIsManagedAttach:](v17, "setIsManagedAttach:", 1LL);
    [v16 attachWithParams:v17 error:a5];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    if (v18)
    {
      eraseDisk(v18, v9, a5);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        [v19 ejectWithError:0];
        SKGetOSLog();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 138412290;
          v34 = v8;
          _os_log_impl( &dword_188F75000,  v21,  OS_LOG_TYPE_DEFAULT,  "Created disk image successfully at %@",  (uint8_t *)&v33,  0xCu);
        }

        BOOL v22 = v16;
        v23 = 0;
LABEL_42:

        if (v22) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }

      SKGetOSLog();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = 138412290;
        v34 = (const char *)v19;
        _os_log_impl(&dword_188F75000, v30, OS_LOG_TYPE_ERROR, "Failed to erase %@", (uint8_t *)&v33, 0xCu);
      }

      [v19 ejectWithError:0];
    }

    else
    {
      SKGetOSLog();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          uint64_t v29 = (const __CFString *)*a5;
        }
        else {
          uint64_t v29 = &stru_18A323F58;
        }
        v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        v35 = 2112;
        v36 = v29;
        _os_log_impl( &dword_188F75000,  v28,  OS_LOG_TYPE_ERROR,  "%s: Failed to attach after create %@",  (uint8_t *)&v33,  0x16u);
      }
    }

    BOOL v22 = 0LL;
    v23 = 1;
    goto LABEL_42;
  }

  [v9 diConvertParamsWithOutputURL:v8 error:a5];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [a1 diskImageConvertFromParamsAt:v8 params:v11 error:a5];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    SKGetOSLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        uint64_t v14 = (const __CFString *)*a5;
      }
      else {
        uint64_t v14 = &stru_18A323F58;
      }
      v33 = 136315394;
      v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
      v35 = 2112;
      v36 = v14;
      _os_log_impl( &dword_188F75000,  v13,  OS_LOG_TYPE_ERROR,  "%s: Could not create 'convert params' %@",  (uint8_t *)&v33,  0x16u);
    }

    int v12 = 0LL;
  }

LABEL_48:
  return v12;
}

void sub_188F8B0E4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x188F8B04CLL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_15:
    id v7 = 0LL;
    goto LABEL_16;
  }

  if (([MEMORY[0x18960F238] createBlankWithParams:v6 error:a5] & 1) == 0)
  {
    SKGetOSLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        id v10 = (const __CFString *)*a5;
      }
      else {
        id v10 = &stru_18A323F58;
      }
      uint64_t v15 = 138412290;
      v16 = (const char *)v10;
      uint64_t v11 = "Failed to create disk image %@";
      int v12 = v8;
      id v13 = 12;
LABEL_14:
      _os_log_impl(&dword_188F75000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  id v7 = v6;
LABEL_16:

  return v7;
}

void sub_188F8BA08( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_46];

    SKGetOSLog();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v10;
      _os_log_impl( &dword_188F75000,  v12,  OS_LOG_TYPE_FAULT,  "Unhandled exception during attach: %@",  (uint8_t *)&a9,  0xCu);
    }

    +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 251LL, v9);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x188F8B9CCLL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_13:
  if (a4 && v13) {
    *a4 = v13;
  }
  SKGetOSLog();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = v21;
  if (!v12)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SKDiskImage diAttachWithParams:error:]";
      _os_log_impl(&dword_188F75000, v22, OS_LOG_TYPE_ERROR, "%s: Failed to create attach params", buf, 0xCu);
    }

    goto LABEL_36;
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v23;
    v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_188F75000, v22, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", buf, 0x16u);
  }

  if (![v6 isManagedAttach])
  {
    v31 = 0LL;
    uint64_t v19 = [MEMORY[0x18960F200] diskImageAttach:v12 BSDName:&v31 error:a4];
    uint64_t v20 = v31;
    goto LABEL_26;
  }

  [v6 mountParams];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 mountPoint];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setUniqueDevice:v25 != 0];

  if (![MEMORY[0x18960F238] managedAttachWithParams:v12 handle:&obj error:a4])
  {
LABEL_33:
    SKGetOSLog();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188F75000, v29, OS_LOG_TYPE_ERROR, "Failed to attach disk image", buf, 2u);
    }

LABEL_36:
    v28 = 0LL;
    goto LABEL_37;
  }

  v26 = obj;
LABEL_30:
  objc_storeStrong((id *)&self->_deviceHandle, v26);
  SKGetOSLog();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (const char *)obj;
    _os_log_impl(&dword_188F75000, v27, OS_LOG_TYPE_DEFAULT, "Attached device %@", buf, 0xCu);
  }
  v28 = -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
LABEL_37:

  return v28;
}

    return 512;
  }

  uint64_t v4 = (void *)NSString;
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = [v4 stringWithFormat:@"/dev/r%@", v5];
  id v7 = open((const char *)[v6 fileSystemRepresentation], 0);

  if (v7 < 0)
  {
    SKGetOSLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *__error();
      *(_DWORD *)buf = 136315650;
      v18 = "-[SKDisk(Erase) getSectorSize]";
      uint64_t v19 = 2112;
      uint64_t v20 = self;
      v21 = 1024;
      BOOL v22 = v15;
      int v12 = "%s: Failed to get block size of %@, open err %d";
      id v13 = v11;
      uint64_t v14 = 28;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  if (ioctl(v7, 0x40046418uLL, &v16))
  {
    SKGetOSLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *__error();
      *(_DWORD *)buf = 136315650;
      v18 = "-[SKDisk(Erase) getSectorSize]";
      uint64_t v19 = 2112;
      uint64_t v20 = self;
      v21 = 1024;
      BOOL v22 = v9;
      _os_log_impl( &dword_188F75000,  v8,  OS_LOG_TYPE_ERROR,  "%s: Failed to get block size of %@, ioctl err %d",  buf,  0x1Cu);
    }
  }

  close(v7);
  return v16;
}

void sub_188F8CBB8(_Unwind_Exception *a1)
{
}

void sub_188F8CCFC(_Unwind_Exception *a1)
{
}

void sub_188F8CE40(_Unwind_Exception *a1)
{
}

void sub_188F8DC44(_Unwind_Exception *a1)
{
}

void sub_188F8DE5C(_Unwind_Exception *a1)
{
}

void sub_188F8E1EC(_Unwind_Exception *a1)
{
}

void sub_188F8F1D4(_Unwind_Exception *a1)
{
}

void sub_188F8F290(_Unwind_Exception *a1)
{
}

void sub_188F8F304(_Unwind_Exception *a1)
{
}

id base64Encode(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 dataUsingEncoding:4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 base64EncodedStringWithOptions:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id SKGetOSLog()
{
  if (SKGetOSLog_onceToken != -1) {
    dispatch_once(&SKGetOSLog_onceToken, &__block_literal_global_5);
  }
  if (logToSys) {
    v0 = &osLogInstallObject;
  }
  else {
    v0 = &osLogObject;
  }
  return (id)*v0;
}

void __SKGetOSLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.storagekit", "general");
  id v1 = (void *)osLogObject;
  osLogObject = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.storagekit", "storagekit-install");
  uint64_t v3 = (void *)osLogInstallObject;
  osLogInstallObject = (uint64_t)v2;
}

void SKLogSetLogsToConsole()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( &dword_188F75000,  v0,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToConsole/Std is deprecated. Please remove this call",  v1,  2u);
  }
}

void SKLogSetLogsToStd()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( &dword_188F75000,  v0,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToStd is deprecated. Please remove this call",  v1,  2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  logToSys = result;
  return result;
}

void SKLogArrayRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  SKGetOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = a2;
    _os_log_impl(&dword_188F75000, v6, a1, "%s", buf, 0xCu);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        SKGetOSLog();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl(&dword_188F75000, v13, a1, "%@", buf, 0xCu);
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

void sub_188F9010C(_Unwind_Exception *a1)
{
}

void sub_188F901D8(_Unwind_Exception *a1)
{
}

LABEL_8:
  return v13;
}

LABEL_18:
    return 0;
  }

  return 1;
}

LABEL_33:
  v18 = self;
LABEL_37:
  v25 = v18;
LABEL_38:
  _Block_object_dispose(v61, 8);
  return v25;
}

void sub_188F9448C(_Unwind_Exception *a1)
{
}

id alignResizeLimits(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 minBytes] & 0xFFF;
  unint64_t v3 = [v1 minBytes];
  if (v2) {
    unint64_t v3 = v3 - ([v1 minBytes] & 0xFFF) + 4096;
  }
  if (v3 <= [v1 currentBytes]) {
    [v1 setMinBytes:v3];
  }
  uint64_t v4 = [v1 maxBytes];
  unint64_t v5 = v4 - ([v1 maxBytes] & 0xFFF);
  if (v5 >= [v1 currentBytes]) {
    [v1 setMaxBytes:v5];
  }
  return v1;
}

void sub_188F96770( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void tagQueue(void *a1, const void *a2)
{
  queue = a1;
  unint64_t v3 = calloc(8uLL, 1uLL);
  void *v3 = 1LL;
  dispatch_queue_set_specific(queue, a2, v3, MEMORY[0x1895FB398]);
}

void *currentQueueIsMainQueue()
{
  if (currentQueueIsMainQueue_once != -1) {
    dispatch_once(&currentQueueIsMainQueue_once, &__block_literal_global_8);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0LL);
  }
  return result;
}

void __currentQueueIsMainQueue_block_invoke()
{
}

uint64_t isValidNSNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

BOOL isValidNSString(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 length] != 0;

  return v2;
}

uint64_t isValidNSDictionary(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t isValidNSArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t isValidNSData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t NSNumberToBool(void *a1)
{
  id v1 = a1;
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t NSNumberToULongLong(void *a1)
{
  id v1 = a1;
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

__CFString *NSStringOrEmpty(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1)) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = &stru_18A323F58;
  }
  unint64_t v3 = v2;

  return v3;
}

BOOL isStringValidUUID(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v1];
    BOOL v3 = v2 != 0LL;
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return v3;
}

uint64_t isOptionalString(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalDict(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isOptionalNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t isEqualOrBothNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1LL;
  }
}

id commaSeparatedDiskListFromArray(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x189607940]);
  if ([v1 count])
  {
    unint64_t v3 = 0LL;
    do
    {
      [v1 objectAtIndex:v3];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 volumeName];
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5) {
        [v4 volumeName];
      }
      else {
        [v4 diskIdentifier];
      }
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 appendString:v6];

      if (v3 != [v1 count] - 1) {
        objc_msgSend(v2, "appendString:", @", ");
      }
      if (v3 == [v1 count] - 2) {
        [v2 appendString:@"and "];
      }

      ++v3;
    }

    while ([v1 count] > v3);
  }

  return v2;
}

id userInfoWithDebugDescription(void *a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = *MEMORY[0x189607490];
  v6[0] = a1;
  id v1 = (void *)MEMORY[0x189603F68];
  id v2 = a1;
  [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_188F9B9F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_188F9BB70(_Unwind_Exception *a1)
{
}

void sub_188F9C1D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_188F9C32C(_Unwind_Exception *a1)
{
}

void sub_188F9CEB0(_Unwind_Exception *a1)
{
}

void sub_188F9E948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (void *)sub_188F9F2FC();
  v8[4] = a3;
  v8[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 1107296256LL;
  v8[2] = sub_188F9E9E8;
  v8[3] = &block_descriptor;
  id v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v7);
}

id sub_188F9E9E8(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_188F9F178();
    uint64_t v4 = (void *)sub_188F9F2E4();
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_188F9EB80(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  sub_188F9F178();
  uint64_t v3 = sub_188F9F2F0();

  return v3;
}

id SKCoreAnalyticsSink.init()()
{
  return sub_188F9EE80(type metadata accessor for SKCoreAnalyticsSink);
}

uint64_t type metadata accessor for SKCoreAnalyticsSink()
{
  return objc_opt_self();
}

id SKCoreAnalyticsSink.__deallocating_deinit()
{
  return sub_188F9EF04(type metadata accessor for SKCoreAnalyticsSink);
}

void sub_188F9EC2C()
{
  qword_18C4FDF28 = MEMORY[0x18961AFE8];
}

uint64_t static SKAnalyticsHub.addSink(_:)()
{
  if (qword_18C4FDF30 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_unknownObjectRetain();
  MEMORY[0x1895DB490](v0);
  if (*(void *)((qword_18C4FDF28 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((qword_18C4FDF28 & 0xFFFFFFFFFFFFFF8LL)
                                                                                + 0x18) >> 1)
    sub_188F9F32C();
  sub_188F9F338();
  sub_188F9F320();
  return swift_endAccess();
}

id SKAnalyticsHub.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SKAnalyticsHub.init()()
{
  return sub_188F9EE80(type metadata accessor for SKAnalyticsHub);
}

id sub_188F9EE80(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_188F9EEBC(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id SKAnalyticsHub.__deallocating_deinit()
{
  return sub_188F9EF04(type metadata accessor for SKAnalyticsHub);
}

id sub_188F9EF04(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t _s10StorageKit14SKAnalyticsHubC9sendEvent4name19eventPayloadBuilderySS_SDySSSo8NSObjectCGSgyctFZ_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_18C4FDF30 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = qword_18C4FDF28;
  if (!((unint64_t)qword_18C4FDF28 >> 62))
  {
    uint64_t v6 = *(void *)((qword_18C4FDF28 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v6) {
      goto LABEL_5;
    }
    return swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain_n();
  uint64_t result = sub_188F9F350();
  uint64_t v6 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_5:
  if (v6 >= 1)
  {
    uint64_t v8 = 0LL;
    do
    {
      if ((v5 & 0xC000000000000001LL) != 0)
      {
        uint64_t v9 = (void *)MEMORY[0x1895DB4C0](v8, v5);
      }

      else
      {
        uint64_t v9 = *(void **)(v5 + 8 * v8 + 32);
        swift_unknownObjectRetain();
      }

      ++v8;
      uint64_t v10 = (void *)sub_188F9F2FC();
      aBlock[4] = a3;
      aBlock[5] = a4;
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_188F9E9E8;
      aBlock[3] = &block_descriptor_11;
      uint64_t v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v9, sel_sendEventWithName_eventPayloadBuilder_, v10, v11);
      _Block_release(v11);
      swift_unknownObjectRelease();
    }

    while (v6 != v8);
    return swift_bridgeObjectRelease_n();
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for SKAnalyticsHub()
{
  return objc_opt_self();
}

uint64_t method lookup function for SKCoreAnalyticsSink()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKCoreAnalyticsSink.sendEvent(name:eventPayloadBuilder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x50LL))();
}

uint64_t sub_188F9F14C()
{
  return swift_deallocObject();
}

uint64_t sub_188F9F170()
{
  return sub_188F9EB80(*(void *)(v0 + 16));
}

unint64_t sub_188F9F178()
{
  unint64_t result = qword_18C75E898;
  if (!qword_18C75E898)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C75E898);
  }

  return result;
}

uint64_t sub_188F9F2E4()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_188F9F2F0()
{
  return MEMORY[0x189607078]();
}

uint64_t sub_188F9F2FC()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_188F9F308()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_188F9F314()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_188F9F320()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_188F9F32C()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_188F9F338()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_188F9F344()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_188F9F350()
{
  return MEMORY[0x189619930]();
}

uint64_t APFSContainerGetMinimalSize()
{
  return MEMORY[0x18960CC58]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFArrayRef CFBundleCreateBundlesFromDirectory( CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x1896028A8](allocator, directoryURL, bundleType);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  return MEMORY[0x18960F188](disk);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1896082E8](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

uint64_t IOJobDispose()
{
  return MEMORY[0x189610C48]();
}

uint64_t IOJobInitiate()
{
  return MEMORY[0x189610C50]();
}

uint64_t IOJobSetup()
{
  return MEMORY[0x189610C58]();
}

kern_return_t IOKitWaitQuiet(mach_port_t mainPort, mach_timespec_t *waitTime)
{
  return MEMORY[0x189608310](*(void *)&mainPort, waitTime);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x189608368](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator( io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x189608480](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x1896085A0](*(void *)&service, waitTime);
}

uint64_t MKCFBuildPartition()
{
  return MEMORY[0x189610C60]();
}

uint64_t MKCFCreateFSInfo()
{
  return MEMORY[0x189610C68]();
}

uint64_t MKCFCreateMap()
{
  return MEMORY[0x189610C70]();
}

uint64_t MKCFCreateMedia()
{
  return MEMORY[0x189610C78]();
}

uint64_t MKCFDisposeMedia()
{
  return MEMORY[0x189610C80]();
}

uint64_t MKCFReadMedia()
{
  return MEMORY[0x189610C88]();
}

uint64_t MKCFUpdateScheme()
{
  return MEMORY[0x189610C90]();
}

uint64_t MKCFWriteMedia()
{
  return MEMORY[0x189610C98]();
}

uint64_t MKCFWriteScheme()
{
  return MEMORY[0x189610CA0]();
}

uint64_t MKHFSGetResizeLimits()
{
  return MEMORY[0x189610CB0]();
}

uint64_t MKMediaCreateWithPath()
{
  return MEMORY[0x189610CD0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x189604228]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1895FAC48](key);
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

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_queue_set_specific( dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

void syslog(int a1, const char *a2, ...)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

uint64_t wipefs_alloc()
{
  return MEMORY[0x1896173E0]();
}

uint64_t wipefs_free()
{
  return MEMORY[0x1896173E8]();
}

uint64_t wipefs_wipe()
{
  return MEMORY[0x1896173F0]();
}

uint64_t objc_msgSend_initWithSKFilesystem_bundle_localizedName_localizedKey_caseSensitive_encrypted_personalityKey_sortPriority_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSKFilesystem_bundle_localizedName_localizedKey_caseSensitive_encrypted_personalityKey_sortPriority_);
}

uint64_t objc_msgSend_initWithSKFilesystem_bundle_localizedName_localizedKey_encrypted_personalityKey_sortPriority_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSKFilesystem_bundle_localizedName_localizedKey_encrypted_personalityKey_sortPriority_);
}