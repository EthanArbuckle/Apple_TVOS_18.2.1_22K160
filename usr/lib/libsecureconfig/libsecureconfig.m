id get_shared_connection()
{
  if (get_shared_connection_once != -1) {
    dispatch_once(&get_shared_connection_once, &__block_literal_global);
  }
  return (id)get_shared_connection_connection;
}

uint64_t __get_shared_connection_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.secureconfigd" options:4096];
  v1 = (void *)get_shared_connection_connection;
  get_shared_connection_connection = v0;

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C74A1F0];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)get_shared_connection_connection setRemoteObjectInterface:v2];

  return [(id)get_shared_connection_connection resume];
}

uint64_t invoke_connection(void *a1)
{
  v1 = a1;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  int v12 = -1;
  get_shared_connection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1895F87A8];
    *((_DWORD *)v10 + 6) = 0;
    v8[0] = v4;
    v8[1] = 3221225472LL;
    v8[2] = __invoke_connection_block_invoke;
    v8[3] = &unk_18A2F9C30;
    v8[4] = &v9;
    [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1[2](v1, v5);
  }

  uint64_t v6 = *((unsigned int *)v10 + 6);

  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_188CCCC7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __invoke_connection_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __invoke_connection_block_invoke_cold_1((uint64_t)v3);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 57;
}

id create_metadata_dictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = (id)objc_opt_new();
  if (!v4) {
    create_metadata_dictionary_cold_1(&v10, v11);
  }
  v5 = v4;

  if (a1)
  {
    [NSString stringWithUTF8String:a1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v6 forKeyedSubscript:@"name"];
  }

  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v7 forKeyedSubscript:@"mime_type"];
  }

  v8 = (void *)[v5 copy];

  return v8;
}

uint64_t register_config_from_data(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = -1;
  create_metadata_dictionary(a2, a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __register_config_from_data_block_invoke;
  v11[3] = &unk_18A2F9C80;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  v14 = &v15;
  uint64_t v9 = invoke_connection(v11);
  if (!(_DWORD)v9) {
    uint64_t v9 = *((unsigned int *)v16 + 6);
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_188CCCED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __register_config_from_data_block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __register_config_from_data_block_invoke_2;
  v5[3] = &unk_18A2F9C58;
  v5[4] = a1[6];
  return [a2 registerConfigWithInputData:v2 metadata:v3 reply:v5];
}

uint64_t __register_config_from_data_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

uint64_t register_config_from_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6) {
    uint64_t v8 = register_config_from_data(v6, a3, a4);
  }
  else {
    uint64_t v8 = 22LL;
  }

  return v8;
}

uint64_t register_config_from_path(uint64_t a1, void *a2, size_t *a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [NSString stringWithUTF8String:a1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)MEMORY[0x189607898];
  [NSString stringWithUTF8String:a1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fileHandleForReadingAtPath:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    id v19 = 0LL;
    [v11 readDataToEndOfFileAndReturnError:&v19];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v19;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        register_config_from_path_cold_2((uint64_t)v8, v13);
      }
      uint64_t v14 = 22LL;
    }

    else
    {
      uint64_t v14 = 0xFFFFFFFFLL;
    }

    if (v12)
    {
      uint64_t v15 = register_config_from_data(v12, [v8 fileSystemRepresentation], a4);
      if ((_DWORD)v15)
      {
        uint64_t v14 = v15;
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_188CCB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "loading contents to buffer",  buf,  2u);
        }

        if (a2 && a3)
        {
          size_t v16 = [v12 length];
          *a3 = v16;
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              uint64_t v17 = malloc(v16);
              if (v17) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }

          else
          {
            uint64_t v17 = malloc(v16);
            if (!v17) {
              register_config_from_path_cold_1(&v20, buf);
            }
          }

          *a2 = v17;
          id v12 = v12;
          memcpy(a2, (const void *)[v12 bytes], *a3);
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188CCB000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "No out-pointer for config", buf, 2u);
        }

        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    id v12 = 0LL;
    uint64_t v14 = 2LL;
  }

  return v14;
}

uint64_t register_config_parameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = -1;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __register_config_parameters_block_invoke;
  v8[3] = &unk_18A2F9CA8;
  uint64_t v11 = a3;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v12;
  uint64_t v6 = invoke_connection(v8);
  if (!(_DWORD)v6) {
    uint64_t v6 = *((unsigned int *)v13 + 6);
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_188CCD2F0(_Unwind_Exception *a1)
{
}

void __register_config_parameters_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[6])
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __register_config_parameters_block_invoke_2;
  v6[3] = &unk_18A2F9C58;
  uint64_t v5 = a1[4];
  v6[4] = a1[5];
  [v3 registerParametersWithParametersJson:v5 securityPolicy:v4 reply:v6];
}

uint64_t __register_config_parameters_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

void __invoke_connection_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_188CCB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Synchronous proxy returned error %@",  (uint8_t *)&v1,  0xCu);
}

void create_metadata_dictionary_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void register_config_from_path_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void register_config_from_path_cold_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a2 localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl( &dword_188CCB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "File %@ couldn't be read with error %@",  (uint8_t *)&v4,  0x16u);
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

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x1895F8958]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895F8AD8]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}