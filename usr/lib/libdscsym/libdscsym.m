uint64_t dscsym_iterate_buffer(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  id v24;
  v11 = a6;
  if (a4) {
    *a4 = -1LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a3) {
    uuid_clear(a3);
  }
  if (a1 && a2)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:a1 length:a2 freeWhenDone:0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v12 options:0 format:0 error:&v24];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    if (!isValidDict(v13))
    {
      v21 = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        dscsym_iterate_buffer_cold_3(v14);
      }
      *__error() = v21;
      v19 = 9LL;
      goto LABEL_26;
    }

    if (a3)
    {
      [v13 objectForKeyedSubscript:@"Cache_UUID_String"];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isValidString(v15) & 1) == 0)
      {
        v22 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          dscsym_iterate_buffer_cold_2();
        }
        *__error() = v22;

        v19 = 22LL;
        goto LABEL_26;
      }

      v16 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v15];
      [v16 getUUIDBytes:a3];
    }

    if (a4)
    {
      [v13 objectForKeyedSubscript:@"Unslid_Base_Address"];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v13 objectForKeyedSubscript:@"Unslid_Base_Address"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = [v18 longLongValue];
      }
    }

    v19 = _dscsym_dict_iterate(v13, v11);
LABEL_26:

    goto LABEL_27;
  }

  v20 = *__error();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    dscsym_iterate_buffer_cold_1();
  }
  *__error() = v20;
  v19 = 22LL;
LABEL_27:

  return v19;
}

BOOL isValidDict(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 count] != 0;

  return v2;
}

uint64_t isValidString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 isEqualToString:&stru_189F52B40] ^ 1;
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t _dscsym_dict_iterate(void *a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  v68 = a2;
  [a1 objectForKeyedSubscript:@"Binaries"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isValidArray(v3))
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    v58 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (!v5)
    {
      int v29 = 0;
      goto LABEL_80;
    }

    uint64_t v7 = v5;
    unint64_t v8 = 0x189607000uLL;
    uint64_t v9 = *(void *)v76;
    *(void *)&__int128 v6 = 68157954LL;
    __int128 v57 = v6;
    uint64_t v59 = *(void *)v76;
    id v60 = v4;
    while (1)
    {
      uint64_t v10 = 0LL;
      uint64_t v61 = v7;
      do
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v75 + 1) + 8 * v10);
        if (!isValidDict(v11))
        {
          int v54 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_3();
          }
          *__error() = v54;
          goto LABEL_79;
        }

        [v11 objectForKeyedSubscript:@"UUID_String"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isValidString(v12) & 1) == 0)
        {
          int v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_2();
          }
          goto LABEL_78;
        }

        v13 = (void *)[objc_alloc(*(Class *)(v8 + 2744)) initWithUUIDString:v12];
        if (!v13)
        {
          int v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_1();
          }
LABEL_78:
          *__error() = v55;

LABEL_79:
          int v29 = 1;
          goto LABEL_80;
        }

        v64 = v13;
        [v13 getUUIDBytes:v88];
        [v11 objectForKeyedSubscript:@"Path"];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v14;
        if (isValidString(v14))
        {
          uint64_t v69 = [v14 UTF8String];
        }

        else
        {
          int v15 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2112;
            v84 = v65;
            _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "binary %{uuid_t}.16P has no path %@",  buf,  0x1Cu);
          }

          uint64_t v69 = 0LL;
          *__error() = v15;
        }

        objc_msgSend(v11, "objectForKeyedSubscript:", @"Segments", v57);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        uint64_t v63 = v10;
        if (v16 && !isValidArray(v16))
        {
          v18 = v17;
          int v19 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2048;
            v84 = v18;
            _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P segments_array invalid %p",  buf,  0x1Cu);
          }

          *__error() = v19;

          v17 = 0LL;
        }

        [v11 objectForKeyedSubscript:@"Load_Address"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        int valid = isValidNumber(v20);
        v70 = v20;
        v67 = v17;
        if (valid)
        {
          v22 = v20;
          v23 = v12;
          uint64_t v24 = [v22 unsignedLongLongValue];
          [v11 objectForKeyedSubscript:@"Text_Segment_Size"];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (isValidNumber(v25))
          {
            uint64_t v26 = [v25 unsignedLongLongValue];
          }

          else
          {
            int v30 = *__error();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 68158210;
              int v80 = 16;
              __int16 v81 = 2096;
              v82 = v88;
              __int16 v83 = 2112;
              v84 = v25;
              _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "binary %{uuid_t}.16P has no text size %@",  buf,  0x1Cu);
            }

            v31 = __error();
            uint64_t v26 = 0LL;
            int *v31 = v30;
          }

          int v32 = v68[2](v68, v88, v69, "__TEXT", v24, v26);

          v12 = v23;
          v20 = v70;
          if (v32)
          {
            int v28 = 0;
            int v29 = 2;
            goto LABEL_62;
          }
        }

        else if (!v17)
        {
          int v27 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2112;
            v84 = v20;
            _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P has no load address %@",  buf,  0x1Cu);
          }

          int v28 = 0;
          *__error() = v27;
          int v29 = 1;
          goto LABEL_62;
        }

        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        id obj = v67;
        uint64_t v33 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (!v33) {
          goto LABEL_46;
        }
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v72;
        v62 = v12;
        while (2)
        {
          for (uint64_t i = 0LL; i != v34; ++i)
          {
            if (*(void *)v72 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (!isValidDict(v37))
            {
              int v47 = *__error();
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 68158210;
                int v80 = 16;
                __int16 v81 = 2096;
                v82 = v88;
                __int16 v83 = 2048;
                v84 = v37;
                _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P segment dict invalid %p",  buf,  0x1Cu);
              }

              *__error() = v47;
              goto LABEL_57;
            }

            [v37 objectForKeyedSubscript:@"Name"];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isValidString(v38) & 1) == 0)
            {
              int v48 = *__error();
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                int v80 = 16;
                __int16 v81 = 2096;
                v82 = v88;
                _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P segment has no name",  buf,  0x12u);
              }

              *__error() = v48;
              goto LABEL_56;
            }

            if (!valid || ([v38 isEqualToString:@"__TEXT"] & 1) == 0)
            {
              [v37 objectForKeyedSubscript:@"Load_Address"];
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isValidNumber(v39) & 1) == 0)
              {
                int v49 = *__error();
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  int v80 = 16;
                  __int16 v81 = 2096;
                  v82 = v88;
                  __int16 v83 = 2112;
                  v84 = v38;
                  __int16 v85 = 2112;
                  v86 = v39;
                  _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P segment %@ has no load address %@",  buf,  0x26u);
                }

                *__error() = v49;

LABEL_56:
LABEL_57:
                uint64_t v9 = v59;
                id v4 = v60;
                unint64_t v8 = 0x189607000LL;
                uint64_t v7 = v61;
                v12 = v62;
                uint64_t v50 = v63;

                int v28 = 0;
                int v29 = 1;
                goto LABEL_63;
              }

              uint64_t v40 = [v39 unsignedLongLongValue];
              [v37 objectForKeyedSubscript:@"Size"];
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isValidNumber(v39) & 1) == 0)
              {
                int v51 = *__error();
                unint64_t v8 = 0x189607000LL;
                uint64_t v7 = v61;
                uint64_t v50 = v63;
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  int v80 = 16;
                  __int16 v81 = 2096;
                  v82 = v88;
                  __int16 v83 = 2112;
                  v84 = v38;
                  __int16 v85 = 2112;
                  v86 = v41;
                  _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "binary %{uuid_t}.16P segment %@ has no size %@",  buf,  0x26u);
                }

                *__error() = v51;

                int v28 = 0;
                int v29 = 1;
                uint64_t v9 = v59;
                id v4 = v60;
                v12 = v62;
                goto LABEL_63;
              }

              uint64_t v42 = [v41 unsignedLongLongValue];
              id v43 = v38;
              uint64_t v44 = [v43 UTF8String];
              uint64_t v45 = v42;
              v20 = v70;
              int v46 = v68[2](v68, v88, v69, (const char *)v44, v40, v45);

              if (v46)
              {

                int v29 = 0;
                int v28 = 1;
                uint64_t v9 = v59;
                id v4 = v60;
                unint64_t v8 = 0x189607000LL;
                uint64_t v7 = v61;
                v12 = v62;
                goto LABEL_62;
              }
            }
          }

          uint64_t v34 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
          uint64_t v9 = v59;
          id v4 = v60;
          unint64_t v8 = 0x189607000LL;
          v12 = v62;
          if (v34) {
            continue;
          }
          break;
        }

LABEL_46:
        int v29 = 0;
        int v28 = 1;
        uint64_t v7 = v61;
LABEL_62:
        uint64_t v50 = v63;
LABEL_63:

        if (!v28)
        {
LABEL_80:

          uint64_t v53 = (v29 << 31 >> 31) & 0x16;
          v3 = v58;
          goto LABEL_81;
        }

        uint64_t v10 = v50 + 1;
      }

      while (v10 != v7);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v75 objects:v89 count:16];
      int v29 = 0;
      if (!v7) {
        goto LABEL_80;
      }
    }
  }

  int v52 = *__error();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    _dscsym_dict_iterate_cold_4();
  }
  *__error() = v52;
  uint64_t v53 = 22LL;
LABEL_81:

  return v53;
}

uint64_t dscsym_iterate(const char *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (a3) {
    *a3 = -1LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  int is_null = uuid_is_null(a2);
  if (!v9 || is_null)
  {
    int v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      dscsym_iterate_cold_1((uint64_t)a2, (uint64_t)v9);
    }
    *__error() = v15;
    uint64_t v14 = 22LL;
  }

  else
  {
    if (a1) {
      goto LABEL_15;
    }
    id v11 = v9;
    v38[0] = 0LL;
    v38[1] = v38;
    v38[2] = 0x2020000000LL;
    v38[3] = a3;
    if (a3) {
      *a3 = -1LL;
    }
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&__int128 v40 = 3221225472LL;
    *((void *)&v40 + 1) = ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke;
    v41 = &unk_189F529C0;
    id v43 = v38;
    id v12 = v11;
    id v42 = v12;
    char v13 = _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, buf);

    _Block_object_dispose(v38, 8);
    if ((v13 & 1) == 0)
    {
LABEL_15:
      v16 = _dscsym_copy_dscsym_path_for_uuid(a1, a2);
      uint64_t v17 = access(v16, 4);
      if ((_DWORD)v17)
      {
        uint64_t v14 = *__error();
        free(v16);
        int v21 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&uint8_t buf[4] = 16;
          LOWORD(v40) = 2096;
          *(void *)((char *)&v40 + 2) = a2;
          WORD5(v40) = 1024;
          HIDWORD(v40) = v14;
          _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unable to read dscsym %{uuid_t}.16P: %{errno}d",  buf,  0x18u);
        }

        *__error() = v21;
      }

      else
      {
        v22 = (void *)MEMORY[0x186E43E7C](v17, v18, v19, v20);
        [NSString stringWithUTF8String:v16];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          free(v16);
          [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v23];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            [v24 objectForKeyedSubscript:@"Cache_UUID_String"];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isValidString(v26) & 1) != 0)
            {
              int v27 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v26];
              uint64_t v28 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2];
              int v29 = (void *)v28;
              if (v27 && v28 && ([v27 isEqual:v28] & 1) != 0)
              {
                if (a3)
                {
                  [v25 objectForKeyedSubscript:@"Unslid_Base_Address"];
                  int v30 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v31 = v30 == 0LL;

                  if (!v31)
                  {
                    [v25 objectForKeyedSubscript:@"Unslid_Base_Address"];
                    int v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *a3 = [v32 longLongValue];
                  }
                }

                uint64_t v14 = _dscsym_dict_iterate(v25, v9);
              }

              else
              {
                int v36 = *__error();
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                  dscsym_iterate_cold_4();
                }
                *__error() = v36;
                uint64_t v14 = 22LL;
              }
            }

            else
            {
              int v35 = *__error();
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                dscsym_iterate_cold_5();
              }
              *__error() = v35;
              uint64_t v14 = 22LL;
            }
          }

          else
          {
            int v34 = *__error();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              dscsym_iterate_cold_3();
            }
            *__error() = v34;
            uint64_t v14 = 22LL;
          }
        }

        else
        {
          int v33 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            dscsym_iterate_cold_2();
          }
          *__error() = v33;
          free(v16);
          uint64_t v14 = 22LL;
        }

        objc_autoreleasePoolPop(v22);
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  return v14;
}

void sub_186B98D10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

char *_dscsym_copy_dscsym_path_for_uuid(const char *a1, unsigned __int8 *uu)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v4 = 0LL;
  uuid_unparse(uu, out);
  if (a1) {
    asprintf(&v4, "%s/%s%s", a1, "DSCSYM-", out);
  }
  else {
    asprintf(&v4, "%s/%s%s", "/private/var/db/dscsym", "DSCSYM-", out);
  }
  result = v4;
  if (!v4) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  return result;
}

uint64_t dscsym_copy_dscsym_files(const char *a1, uint64_t a2)
{
  id v4 = (char *)_dscsym_directory_copy(a1, 1);
  dscsym_save_dscsyms_for_current_caches(a1);
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __dscsym_copy_dscsym_files_block_invoke;
  v7[3] = &unk_189F52820;
  v7[4] = &v8;
  v7[5] = a2;
  _dscsym_foreach_dscsym_file(v4, v7);
  if (v4 != "/private/var/db/dscsym") {
    free(v4);
  }
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_186B98EAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

const char *_dscsym_directory_copy(const char *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  if (!a1 || !strcmp(a1, "/"))
  {
    result = "/private/var/db/dscsym";
    uint64_t v10 = "/private/var/db/dscsym";
    if (!a2) {
      return result;
    }
LABEL_7:
    if (stat(result, &v9))
    {
      uid_t v5 = geteuid();
      int v6 = *__error();
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v12 = v10;
          _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "dscsym unable to create directory %s: not root",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = v10;
          int v8 = *__error();
          *(_DWORD *)buf = 136315394;
          id v12 = v7;
          __int16 v13 = 1024;
          int v14 = v8;
          _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "creating dscsym directory %s (stat said: %{errno}d)",  buf,  0x12u);
        }

        *__error() = v6;
        if (!mkdir(v10, 0x1EDu)) {
          return v10;
        }
        int v6 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          _dscsym_directory_copy_cold_1();
        }
      }

      *__error() = v6;
    }

    return v10;
  }

  asprintf(&v10, "%s%s", a1, "/private/var/db/dscsym");
  result = v10;
  if (!v10) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  if (a2) {
    goto LABEL_7;
  }
  return result;
}

uint64_t dscsym_save_dscsyms_for_current_caches(const char *a1)
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  id v1 = (char *)_dscsym_directory_copy(a1, 1);
  uint64_t v2 = MEMORY[0x1895F87A8];
  dyld_for_each_installed_shared_cache_with_system_path();
  uint64_t v3 = v12[3];
  int v4 = *((_DWORD *)v8 + 6);
  time_t v5 = time(0LL);
  v15[0] = v2;
  v15[1] = 3221225472LL;
  v15[2] = ___dscsym_remove_obsolete_caches_block_invoke;
  v15[3] = &__block_descriptor_52_e9_i16__0r_8l;
  int v16 = v4;
  v15[4] = v3;
  v15[5] = v5 - 1209600;
  _dscsym_foreach_dscsym_file(v1, v15);
  free((void *)v12[3]);
  if (v1 != "/private/var/db/dscsym") {
    free(v1);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return 0LL;
}

void sub_186B991D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void _dscsym_foreach_dscsym_file(const char *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  int v4 = opendir(a1);
  time_t v5 = __error();
  if (v4)
  {
    *time_t v5 = 0;
    int v6 = readdir(v4);
    if (v6)
    {
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        d_name = v6->d_name;
        if (!strncmp(v6->d_name, "DSCSYM-", 7uLL))
        {
          snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
          if (v3[2](v3, __str)) {
            goto LABEL_14;
          }
          int v9 = 0;
        }

        else
        {
          int v9 = *__error();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            _dscsym_foreach_dscsym_file_cold_3(buf, (uint64_t)d_name, &v13);
          }
        }

        *__error() = v9;
        int v6 = readdir(v4);
      }

      while (v6);
    }

    if (*__error())
    {
      int v10 = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _dscsym_foreach_dscsym_file_cold_2();
      }
      *__error() = v10;
    }

LABEL_14:
    closedir(v4);
  }

  else
  {
    int v11 = *v5;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _dscsym_foreach_dscsym_file_cold_1();
    }
    *__error() = v11;
  }
}

uint64_t __dscsym_copy_dscsym_files_block_invoke(uint64_t a1, char *__s1)
{
  int v4 = strdup(__s1);
  time_t v5 = basename(v4);
  to = 0LL;
  int v6 = asprintf(&to, "%s/%s", *(const char **)(a1 + 40), v5);
  free(v4);
  if (v6 == -1)
  {
    int v9 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __dscsym_copy_dscsym_files_block_invoke_cold_1();
    }
    *__error() = v9;
    uint64_t result = 12LL;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 12;
  }

  else
  {
    if (copyfile(__s1, to, 0LL, 0x100000Au))
    {
      int v7 = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __dscsym_copy_dscsym_files_block_invoke_cold_2();
      }
      *__error() = v7;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
    }

    free(to);
    return 0LL;
  }

  return result;
}

uint64_t dscsym_mmap_dscsym_for_uuid(const char *a1, unsigned __int8 *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  off_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  *a3 = 0LL;
  *a4 = 0LL;
  int v8 = (void *)MEMORY[0x186E43E7C]();
  int v9 = (char *)_dscsym_directory_copy(a1, a1 == 0LL);
  int v10 = _dscsym_copy_dscsym_path_for_uuid(v9, a2);
  if (v9 != "/private/var/db/dscsym") {
    free(v9);
  }
  int v11 = _dscsym_mmap_file(v10, &v23, &v22);
  uint64_t v12 = v20;
  *((_DWORD *)v20 + 6) = v11;
  if (!v11)
  {
    *a3 = v23;
    *a4 = v22;
    int v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68158210;
      int v25 = 16;
      __int16 v26 = 2096;
      int v27 = a2;
      __int16 v28 = 2080;
      int v29 = v10;
      _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "dscsym %{uuid_t}.16P mapped from file %s",  buf,  0x1Cu);
    }

    int v16 = __error();
    goto LABEL_13;
  }

  uint64_t v13 = 2LL;
  if (!a1)
  {
    *((_DWORD *)v12 + 6) = 2;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __dscsym_mmap_dscsym_for_uuid_block_invoke;
    v18[3] = &unk_189F52848;
    v18[4] = &v19;
    v18[5] = v10;
    _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, v18);
    if (!*((_DWORD *)v20 + 6))
    {
      int v14 = _dscsym_mmap_file(v10, &v23, &v22);
      *((_DWORD *)v20 + 6) = v14;
      if (!v14)
      {
        *a3 = v23;
        *a4 = v22;
        int v15 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68158210;
          int v25 = 16;
          __int16 v26 = 2096;
          int v27 = a2;
          __int16 v28 = 2080;
          int v29 = v10;
          _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "dscsym %{uuid_t}.16P mapped from file %s",  buf,  0x1Cu);
        }

        int v16 = __error();
LABEL_13:
        uint64_t v13 = 0LL;
        int *v16 = v15;
      }
    }
  }

  free(v10);
  objc_autoreleasePoolPop(v8);
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_186B9976C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t _dscsym_mmap_file(const char *a1, void *a2, off_t *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v6 = open(a1, 0);
  if (v6 == -1)
  {
    int v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v9 = *__error();
      v14.st_dev = 136315394;
      *(void *)&v14.st_mode = a1;
      WORD2(v14.st_ino) = 1024;
      *(_DWORD *)((char *)&v14.st_ino + 6) = v9;
      _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "dscsym unable to open %s: %{errno}d",  (uint8_t *)&v14,  0x12u);
    }

    goto LABEL_7;
  }

  int v7 = v6;
  if (fstat(v6, &v14))
  {
    int v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _dscsym_mmap_file_cold_3();
    }
LABEL_7:
    *__error() = v8;
    return *__error();
  }

  if (v14.st_size < 0x7FFFFFFFFFFFFFFFuLL)
  {
    uint64_t v12 = mmap(0LL, v14.st_size, 1, 1, v7, 0LL);
    if (v12 == (void *)-1LL)
    {
      int v8 = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _dscsym_mmap_file_cold_2();
      }
      goto LABEL_7;
    }

    uint64_t v13 = v12;
    close(v7);
    uint64_t result = 0LL;
    *a2 = v13;
    *a3 = v14.st_size;
  }

  else
  {
    int v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _dscsym_mmap_file_cold_1();
    }
    *__error() = v11;
    return 27LL;
  }

  return result;
}

uint64_t _dscsym_dyld_shared_cache_with_uuid(uint64_t a1, void *a2)
{
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  id v4 = a2;
  dyld_for_each_installed_shared_cache_with_system_path();

  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_186B99A28(_Unwind_Exception *a1)
{
}

uint64_t __dscsym_mmap_dscsym_for_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = _dscsym_create_dsc_file_for_shared_cache(a2, *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t _dscsym_create_dsc_file_for_shared_cache(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x186E43E7C]();
  id v18 = 0LL;
  _dscsym_iterate_dyld_shared_cache(a1, (unint64_t)&v18, 0LL);
  id v5 = v18;
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
    char v8 = (void *)[objc_alloc(NSString) initWithUTF8String:a2];
    if (v8)
    {
      int v9 = (void *)[objc_alloc(MEMORY[0x189603FF8]) initToFileAtPath:v8 append:0];
      int v10 = v9;
      if (v9)
      {
        [v9 open];
        id v19 = 0LL;
        uint64_t v11 = [MEMORY[0x1896079E8] writePropertyList:v7 toStream:v10 format:200 options:0 error:&v19];
        id v12 = v19;
        [v10 close];
        int v13 = *__error();
        if (v11)
        {
          uint64_t v14 = 0LL;
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v21 = a2;
            __int16 v22 = 2048;
            uint64_t v23 = v11;
            _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Wrote out new dscsym for shared cache to %s (%{bytes}ld)",  buf,  0x16u);
            uint64_t v14 = 0LL;
          }
        }

        else
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            _dscsym_create_dsc_file_for_shared_cache_cold_3(a2, v12);
          }
          uint64_t v14 = 9LL;
        }

        *__error() = v13;
      }

      else
      {
        int v16 = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          _dscsym_create_dsc_file_for_shared_cache_cold_2();
        }
        *__error() = v16;
        uint64_t v14 = 12LL;
      }
    }

    else
    {
      int v15 = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _dscsym_create_dsc_file_for_shared_cache_cold_1();
      }
      *__error() = v15;
      uint64_t v14 = 12LL;
    }
  }

  else
  {
    uint64_t v14 = 2LL;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

uint64_t dscsym_generate_dscsym_file()
{
  uint64_t v2 = 0LL;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000LL;
  int v5 = 2;
  dyld_shared_cache_for_file();
  uint64_t v0 = *((unsigned int *)v3 + 6);
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_186B99D60(_Unwind_Exception *a1)
{
}

uint64_t __dscsym_generate_dscsym_file_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = _dscsym_generate_dscsym_file(a2, *(const char **)(a1 + 40), *(char ***)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t _dscsym_generate_dscsym_file(uint64_t a1, const char *a2, char **a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3) {
    *a3 = 0LL;
  }
  dyld_shared_cache_copy_uuid();
  int v6 = *__error();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    _dscsym_generate_dscsym_file_cold_2();
  }
  *__error() = v6;
  id v7 = _dscsym_copy_dscsym_path_for_uuid(a2, uu);
  if (!v7) {
    return 12LL;
  }
  char v8 = v7;
  if (!access(v7, 0))
  {
    int v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      _dscsym_generate_dscsym_file_cold_1();
    }
    *__error() = v11;
    if (!a3)
    {
      free(v8);
      return 0LL;
    }

    uint64_t v10 = 0LL;
    goto LABEL_15;
  }

  uint64_t dsc_file_for_shared_cache = _dscsym_create_dsc_file_for_shared_cache(a1, (uint64_t)v8);
  uint64_t v10 = dsc_file_for_shared_cache;
  if (a3 && !(_DWORD)dsc_file_for_shared_cache)
  {
LABEL_15:
    *a3 = v8;
    return v10;
  }

  free(v8);
  return v10;
}

uint64_t __dscsym_save_dscsyms_for_current_caches_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = realloc( *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL)
                                                                           + 24LL),
                                                                  16LL
                                                                * (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                                           + 24LL)
                                                                               + 1));
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  dyld_shared_cache_copy_uuid();
  return _dscsym_generate_dscsym_file(a2, *(const char **)(a1 + 48), 0LL);
}

uint64_t dscsym_buffer_iterate_binaries(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4)
{
  return dscsym_buffer_iterate(a1, a2, a3, 0LL, a4);
}

uint64_t dscsym_buffer_iterate(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, void *a5)
{
  id v9 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __dscsym_buffer_iterate_block_invoke;
  v13[3] = &unk_189F528C0;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = dscsym_iterate_buffer(a1, a2, a3, a4, 0LL, v13);

  return v11;
}

uint64_t __dscsym_buffer_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (!strcmp(__s1, "__TEXT")) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  else {
    return 0LL;
  }
}

uint64_t dscsym_iterate_binaries(const char *a1, unsigned __int8 *a2, void *a3)
{
  return dscsym_uuid_iterate(a1, a2, 0LL, a3);
}

uint64_t dscsym_uuid_iterate(const char *a1, unsigned __int8 *a2, void *a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __dscsym_uuid_iterate_block_invoke;
  v11[3] = &unk_189F528C0;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = dscsym_iterate(a1, a2, a3, 0LL, v11);

  return v9;
}

uint64_t __dscsym_uuid_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (!strcmp(__s1, "__TEXT")) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  else {
    return 0LL;
  }
}

BOOL isValidArray(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 count] != 0;

  return v2;
}

uint64_t isValidNumber(void *a1)
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

void _dscsym_iterate_dyld_shared_cache(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  unint64_t v5 = a3;
  if (!(a2 | v5)) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  int v6 = (void *)v5;
  if (a2)
  {
    id v7 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
    *(void *)a2 = v7;
    dyld_shared_cache_copy_uuid();
    id v8 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v13];
    [v8 UUIDString];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v9 forKeyedSubscript:@"Cache_UUID_String"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:MEMORY[0x186E43E10](a1)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v10 forKeyedSubscript:@"Unslid_Base_Address"];
  }

  else
  {
    id v7 = 0LL;
  }

  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 0;
  id v11 = v7;
  id v12 = v6;
  dyld_shared_cache_for_each_image();

  _Block_object_dispose(v13, 8);
}

void sub_186B9A46C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32) || !*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *(void *)uu = 0LL;
    uint64_t v22 = 0LL;
    if (dyld_image_copy_uuid())
    {
      if (!uuid_is_null(uu))
      {
        uint64_t v4 = MEMORY[0x186E43DE0](a2);
        if (*(void *)(a1 + 32))
        {
          unint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:5];
          int v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
          [v6 UUIDString];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v7 forKeyedSubscript:@"UUID_String"];

          if (v4)
          {
            [NSString stringWithUTF8String:v4];
            id v8 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v8 forKeyedSubscript:@"Path"];
          }

          id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
          [v5 setObject:v9 forKeyedSubscript:@"Segments"];
          [*(id *)(a1 + 32) objectForKeyedSubscript:@"Binaries"];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            id v10 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2300];
            [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"Binaries"];
          }

          [v10 addObject:v5];
        }

        else
        {
          unint64_t v5 = 0LL;
          id v9 = 0LL;
        }

        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = ___dscsym_iterate_dyld_shared_cache_block_invoke_2;
        v15[3] = &unk_189F528E8;
        id v16 = v5;
        id v17 = v9;
        __int128 v14 = *(_OWORD *)(a1 + 40);
        id v11 = (id)v14;
        __int128 v18 = v14;
        id v19 = uu;
        uint64_t v20 = v4;
        id v12 = v9;
        id v13 = v5;
        MEMORY[0x186E43DD4](a2, v15);
      }
    }
  }
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke_2(uint64_t a1, char *__s2, uint64_t a3, uint64_t a4)
{
  if (__s2)
  {
    if (*(void *)(a1 + 32))
    {
      if (!strcmp("__TEXT", __s2))
      {
        [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"Load_Address"];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"Text_Segment_Size"];
      }

      else
      {
        id v8 = *(void **)(a1 + 40);
        id v9 = objc_alloc(MEMORY[0x189603F68]);
        if (CachedNSStringForCString_onceToken != -1) {
          dispatch_once(&CachedNSStringForCString_onceToken, &__block_literal_global);
        }
        id v10 = (void *)[objc_alloc(NSString) initWithUTF8String:__s2];
        if (v10)
        {
          [(id)CachedNSStringForCString_cachedStrings member:v10];
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            id v11 = v10;
            [(id)CachedNSStringForCString_cachedStrings addObject:v11];
          }
        }

        else
        {
          id v11 = 0LL;
        }

        [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = (void *)objc_msgSend( v9,  "initWithObjectsAndKeys:",  v11,  @"Name",  v13,  @"Load_Address",  v14,  @"Size",  0);
        [v8 addObject:v15];
      }
    }

    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (v16)
      {
        if ((*(unsigned int (**)(uint64_t, void, void, char *, uint64_t, uint64_t))(v16 + 16))( v16,  *(void *)(a1 + 64),  *(void *)(a1 + 72),  __s2,  a3,  a4))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
        }
      }
    }
  }

void __CachedNSStringForCString_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:8];
  id v1 = (void *)CachedNSStringForCString_cachedStrings;
  CachedNSStringForCString_cachedStrings = v0;
}

uint64_t ___dscsym_remove_obsolete_caches_block_invoke(uint64_t a1, char *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (stat(a2, &v12))
  {
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_4();
    }
    *__error() = v4;
    return 0LL;
  }

  __darwin_time_t tv_sec = v12.st_birthtimespec.tv_sec;
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    while (1)
    {
      uuid_unparse((const unsigned __int8 *)(*(void *)(a1 + 32) + v6), out);
      if (strstr(a2, out)) {
        break;
      }
      ++v7;
      v6 += 16LL;
    }

    int v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_3();
    }
    goto LABEL_17;
  }

LABEL_9:
  if (tv_sec >= *(void *)(a1 + 40))
  {
    int v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_2();
    }
LABEL_17:
    *__error() = v10;
    return 0LL;
  }

  int v8 = unlink(a2);
  int v9 = *__error();
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uuid_string_t out = 136315394;
    *(void *)&out[4] = a2;
    *(_WORD *)&out[12] = 2048;
    *(void *)&out[14] = tv_sec;
    _os_log_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Unlinked old dscsym %s created at %{time_t}ld",  (uint8_t *)out,  0x16u);
  }

  *__error() = v9;
  return 0LL;
}

uint64_t ___dscsym_dyld_shared_cache_with_uuid_block_invoke(uint64_t result)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    *(void *)uu2 = 0LL;
    uint64_t v3 = 0LL;
    dyld_shared_cache_copy_uuid();
    uint64_t result = uuid_compare(*(const unsigned __int8 **)(v1 + 48), uu2);
    if (!(_DWORD)result)
    {
      *(_BYTE *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 24LL) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
    }
  }

  return result;
}

void ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    **(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = MEMORY[0x186E43E10](a2);
  }
  _dscsym_iterate_dyld_shared_cache(a2, 0LL, *(void **)(a1 + 32));
}

  ;
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_12()
{
  return __error();
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_15( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t OUTLINED_FUNCTION_16()
{
  return _os_assert_log();
}

void dscsym_iterate_buffer_cold_1()
{
}

void dscsym_iterate_buffer_cold_2()
{
}

void dscsym_iterate_buffer_cold_3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2( &dword_186B97000,  MEMORY[0x1895F8DA0],  v2,  "dscsym deserialization failed: %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_3();
}

void _dscsym_dict_iterate_cold_1()
{
}

void _dscsym_dict_iterate_cold_2()
{
}

void _dscsym_dict_iterate_cold_3()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_186B97000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "binary_dict invalid", v0, 2u);
}

void _dscsym_dict_iterate_cold_4()
{
}

void dscsym_iterate_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)MEMORY[0x186E43F6C](a2);
  v4[0] = 68158210;
  v4[1] = 16;
  __int16 v5 = 2096;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  int v8 = v3;
  _os_log_fault_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "uuid %{uuid_t}.16P callback %p",  (uint8_t *)v4,  0x1Cu);

  OUTLINED_FUNCTION_14();
}

void dscsym_iterate_cold_2()
{
}

void dscsym_iterate_cold_3()
{
}

void dscsym_iterate_cold_4()
{
}

void dscsym_iterate_cold_5()
{
}

void _dscsym_copy_dscsym_path_for_uuid_cold_1()
{
}

void _dscsym_directory_copy_cold_1()
{
}

void _dscsym_foreach_dscsym_file_cold_1()
{
}

void _dscsym_foreach_dscsym_file_cold_2()
{
}

void _dscsym_foreach_dscsym_file_cold_3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 136315138;
  *a3 = a2;
  _os_log_debug_impl(&dword_186B97000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG, "File %s isn't a dscsym file", buf, 0xCu);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "dscsym unable to asprintf copy destination path: %{errno}d",  (uint8_t *)v1,  8u);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_2()
{
}

void _dscsym_mmap_file_cold_1()
{
}

void _dscsym_mmap_file_cold_2()
{
}

void _dscsym_mmap_file_cold_3()
{
}

void _dscsym_create_dsc_file_for_shared_cache_cold_1()
{
}

void _dscsym_create_dsc_file_for_shared_cache_cold_2()
{
}

void _dscsym_create_dsc_file_for_shared_cache_cold_3(uint64_t a1, void *a2)
{
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10( &dword_186B97000,  MEMORY[0x1895F8DA0],  v2,  "Unable to save shared cache dscsym %s: %@",  v3,  v4,  v5,  v6,  2u);

  OUTLINED_FUNCTION_3();
}

void _dscsym_generate_dscsym_file_cold_1()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "dscsym already exists for %{uuid_t}.16P: %s",  v0,  0x1Cu);
  OUTLINED_FUNCTION_6();
}

void _dscsym_generate_dscsym_file_cold_2()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl( &dword_186B97000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "checking cache file %{uuid_t}.16P",  v0,  0x12u);
  OUTLINED_FUNCTION_5();
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_1()
{
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_2()
{
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_3()
{
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_4()
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1895F95F0](a1);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_for_each_installed_shared_cache_with_system_path()
{
  return MEMORY[0x1895FAFD0]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1895FB008]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1895FB010]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1895FB020]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1895FB090]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1895FB0A8]();
}

uint64_t dyld_shared_cache_for_file()
{
  return MEMORY[0x1895FB0B0]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1895FB0B8]();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
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

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}