os_log_t __eligibility_log_handle_block_invoke()
{
  os_log_t result;
  result = os_log_create("com.apple.os_eligibility", "library");
  eligibility_log_handle_log_handle = (uint64_t)result;
  return result;
}

void eligibility_xpc_set_message_type(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (MEMORY[0x1895E8EDC](a2) == MEMORY[0x189600980])
  {
    xpc_dictionary_set_uint64(a2, "eligibility_message_type", a1);
  }

  else
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v4 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      v6 = "eligibility_xpc_set_message_type";
      _os_log_error_impl( &dword_18950F000,  v4,  OS_LOG_TYPE_ERROR,  "%s: xpc message type must be a dictionary",  (uint8_t *)&v5,  0xCu);
    }
  }
}

int64_t eligibility_xpc_send_message_with_reply(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  mach_service = xpc_connection_create_mach_service("com.apple.eligibilityd", 0LL, 0LL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_7);
  xpc_connection_activate(mach_service);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(mach_service, a1);
  uint64_t v6 = MEMORY[0x1895E8EDC]();
  if (v6) {
    BOOL v7 = v6 == MEMORY[0x189600998];
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (v6 == MEMORY[0x189600980])
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, "errorNum");
      if (!v5) {
        return int64;
      }
    }

    else
    {
      int64_t int64 = 0xFFFFFFFFLL;
      if (!v5) {
        return int64;
      }
    }

    goto LABEL_15;
  }

  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x189600940]);
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = (os_log_s *)eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    if (!string) {
      string = "unknown error";
    }
    if (MEMORY[0x1895E8EDC](a1) == MEMORY[0x189600980])
    {
      uint64_t int64 = xpc_dictionary_get_uint64(a1, "eligibility_message_type");
    }

    else
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      v13 = (os_log_s *)eligibility_log_handle_log_handle;
      if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        v15 = "eligibility_xpc_get_message_type";
        _os_log_error_impl( &dword_18950F000,  v13,  OS_LOG_TYPE_ERROR,  "%s: xpc message type must be a dictionary",  (uint8_t *)&v14,  0xCu);
      }

      uint64_t int64 = 0LL;
    }

    int v14 = 136315650;
    v15 = "eligibility_xpc_send_message_with_reply";
    __int16 v16 = 2048;
    uint64_t v17 = uint64;
    __int16 v18 = 2080;
    v19 = string;
    _os_log_error_impl( &dword_18950F000,  v9,  OS_LOG_TYPE_ERROR,  "%s: Error returned trying to send xpc message %llu: %s",  (uint8_t *)&v14,  0x20u);
  }

  int64_t int64 = 54LL;
  if (v5)
  {
LABEL_15:
    else {
      *a2 = v5;
    }
  }

  return int64;
}

int64_t os_eligibility_set_input(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(1uLL, v6);
  xpc_dictionary_set_uint64(v6, "input", a1);
  if (a2) {
    xpc_dictionary_set_value(v6, "value", a2);
  }
  xpc_dictionary_set_uint64(v6, "status", a3);
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0LL);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_reset_domain(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(2uLL, v2);
  xpc_dictionary_set_uint64(v2, "domain", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0LL);
  xpc_release(v2);
  return v3;
}

int64_t os_eligibility_reset_all_domains()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(5uLL, v0);
  int64_t v1 = eligibility_xpc_send_message_with_reply(v0, 0LL);
  xpc_release(v0);
  return v1;
}

int64_t os_eligibility_force_domain_answer(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(3uLL, v6);
  xpc_dictionary_set_uint64(v6, "domain", a1);
  xpc_dictionary_set_uint64(v6, "answer", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "context", a3);
  }
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0LL);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_force_domain_set_answers(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(6uLL, v6);
  xpc_dictionary_set_uint64(v6, "domainSet", a1);
  xpc_dictionary_set_uint64(v6, "answer", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "context", a3);
  }
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0LL);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_set_test_mode(BOOL a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(9uLL, v2);
  xpc_dictionary_set_BOOL(v2, "enabled", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0LL);
  xpc_release(v2);
  return v3;
}

uint64_t load_eligibility_plist(const char *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895FEE08];
  int v4 = open(a1, 0x20000000);
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    if (fstat(v4, &v35))
    {
      uint64_t v6 = *__error();
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v7 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      int v27 = 136315906;
      v28 = "load_eligibility_plist";
      __int16 v29 = 2080;
      name = a1;
      __int16 v31 = 2080;
      v32 = strerror(v6);
      __int16 v33 = 1024;
      int v34 = v6;
      v22 = "%s: Failed to stat %s: %s(%d)";
      v23 = (os_log_s *)v7;
      uint32_t v24 = 38;
LABEL_33:
      _os_log_error_impl(&dword_18950F000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v27, v24);
LABEL_6:
      v8 = 0LL;
LABEL_36:
      close(v5);
      if (v8 && a2 && !(_DWORD)v6)
      {
        *a2 = v8;
      }

      else if (v8)
      {
        xpc_release(v8);
      }

      return v6;
    }

    size_t st_size = v35.st_size;
    if ((unint64_t)v35.st_size >> 31)
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      v11 = (os_log_s *)eligibility_log_handle_log_handle;
      if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315394;
        v28 = "load_eligibility_plist";
        __int16 v29 = 2048;
        name = (const char *)st_size;
        _os_log_error_impl( &dword_18950F000,  v11,  OS_LOG_TYPE_ERROR,  "%s: eligibility plist is too large (%zu)",  (uint8_t *)&v27,  0x16u);
      }

      v8 = 0LL;
      uint64_t v6 = 27LL;
      goto LABEL_36;
    }

    v12 = mmap(0LL, v35.st_size, 1, 1026, v5, 0LL);
    if (v12 == (void *)-1LL)
    {
      uint64_t v6 = *__error();
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v21 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      int v27 = 136315650;
      v28 = "load_eligibility_plist";
      __int16 v29 = 2080;
      name = a1;
      __int16 v31 = 2080;
      v32 = strerror(v6);
      v22 = "%s: Failed to map file at %s; error: %s";
      v23 = (os_log_s *)v21;
      uint32_t v24 = 32;
      goto LABEL_33;
    }

    v13 = v12;
    uint64_t v14 = xpc_create_from_plist();
    v8 = (void *)v14;
    if (v14)
    {
      uint64_t v15 = MEMORY[0x1895E8EDC](v14);
      if (v15 == MEMORY[0x189600980])
      {
        uint64_t v6 = 0LL;
        goto LABEL_35;
      }

      __int16 v16 = (const _xpc_type_s *)v15;
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v17 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        uint64_t v6 = 0xFFFFFFFFLL;
LABEL_35:
        munmap(v13, st_size);
        goto LABEL_36;
      }

      int v27 = 136315394;
      v28 = "load_eligibility_plist";
      __int16 v29 = 2080;
      name = xpc_type_get_name(v16);
      __int16 v18 = "%s: Expected plist to be a dictionary but instead was a %s";
      v19 = (os_log_s *)v17;
      uint32_t v20 = 22;
    }

    else
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v25 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      int v27 = 136315138;
      v28 = "load_eligibility_plist";
      __int16 v18 = "%s: Failed to parse property list";
      v19 = (os_log_s *)v25;
      uint32_t v20 = 12;
    }

    _os_log_error_impl(&dword_18950F000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, v20);
    goto LABEL_31;
  }

  uint64_t v6 = *__error();
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = (os_log_s *)eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    v35.st_dev = 136315906;
    *(void *)&v35.st_mode = "load_eligibility_plist";
    WORD2(v35.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v35.st_ino + 6) = (__darwin_ino64_t)a1;
    HIWORD(v35.st_gid) = 2080;
    *(void *)&v35.st_rdev = strerror(v6);
    LOWORD(v35.st_atimespec.tv_sec) = 1024;
    *(_DWORD *)((char *)&v35.st_atimespec.tv_sec + 2) = v6;
    _os_log_error_impl(&dword_18950F000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to open %s: %s(%d)", (uint8_t *)&v35, 0x26u);
  }

  return v6;
}

char *copy_eligibility_domain_public_answer_plist_path()
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = 0LL;
  if (asprintf(&v2, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    xpc_object_t v0 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v4 = "copy_eligibility_domain_public_answer_plist_path";
      __int16 v5 = 2080;
      uint64_t v6 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl( &dword_18950F000,  v0,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  return v2;
}

uint64_t os_eligibility_get_domain_answer(uint64_t a1, int64_t *a2, int64_t *a3, void *a4, xpc_object_t *a5)
{
  uint64_t v41 = *MEMORY[0x1895FEE08];
  xpc_object_t object = 0LL;
  if ((unint64_t)(a1 - 22) >= 0x64)
  {
    if (a1 > 20)
    {
      if (a1 == 21 || a1 == 122)
      {
        v11 = copy_eligibility_domain_public_answer_plist_path();
        if (v11) {
          goto LABEL_8;
        }
      }
    }

    else if ((unint64_t)(a1 - 1) < 0x14)
    {
      goto LABEL_2;
    }

LABEL_19:
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    __int16 v16 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2048;
      v38 = (const char *)a1;
      uint64_t v14 = 22LL;
      _os_log_error_impl(&dword_18950F000, v16, OS_LOG_TYPE_ERROR, "%s: Unknown plist for domain %llu", buf, 0x16u);
      v11 = 0LL;
LABEL_46:
      int64_t v12 = 0LL;
      xpc_object_t v13 = 0LL;
    }

    else
    {
      v11 = 0LL;
LABEL_23:
      int64_t v12 = 0LL;
      xpc_object_t v13 = 0LL;
      uint64_t v14 = 22LL;
    }

    goto LABEL_24;
  }

LABEL_2:
  int v34 = 0LL;
  if (asprintf(&v34, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v10 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "copy_eligibility_domain_answer_plist_path";
      __int16 v37 = 2080;
      v38 = "/private/var/db/os_eligibility/eligibility.plist";
      _os_log_error_impl( &dword_18950F000,  v10,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  v11 = v34;
  if (!v34) {
    goto LABEL_19;
  }
LABEL_8:
  if (load_eligibility_plist(v11, &object))
  {
    int64_t v12 = 0LL;
    xpc_object_t v13 = 0LL;
    uint64_t v14 = 0LL;
LABEL_24:
    int64_t int64 = 1LL;
    goto LABEL_25;
  }

  switch(a1)
  {
    case 1LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_LOTX";
      break;
    case 2LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_HYDROGEN";
      break;
    case 3LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_HELIUM";
      break;
    case 4LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_LITHIUM";
      break;
    case 5LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
      break;
    case 6LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_BORON";
      break;
    case 7LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_CARBON";
      break;
    case 8LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_NITROGEN";
      break;
    case 9LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_OXYGEN";
      break;
    case 10LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_FLUORINE";
      break;
    case 11LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_NEON";
      break;
    case 12LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SODIUM";
      break;
    case 13LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
      break;
    case 14LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_ALUMINUM";
      break;
    case 15LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SILICON";
      break;
    case 16LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
      break;
    case 17LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SULFUR";
      break;
    case 18LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_CHLORINE";
      break;
    case 19LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_ARGON";
      break;
    case 20LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_POTASSIUM";
      break;
    case 21LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_CALCIUM";
      break;
    case 22LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SCANDIUM";
      break;
    case 23LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_TITANIUM";
      break;
    case 24LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_VANADIUM";
      break;
    case 25LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_CHROMIUM";
      break;
    case 26LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_MANGANESE";
      break;
    case 27LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_IRON";
      break;
    case 28LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_COBALT";
      break;
    case 29LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_NICKEL";
      break;
    case 30LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_COPPER";
      break;
    case 31LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_ZINC";
      break;
    case 32LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_GALLIUM";
      break;
    case 33LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_GERMANIUM";
      break;
    case 34LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_ARSENIC";
      break;
    case 35LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SELENIUM";
      break;
    case 36LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_BROMINE";
      break;
    case 37LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_KRYPTON";
      break;
    case 38LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
      break;
    case 39LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_STRONTIUM";
      break;
    case 40LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_YTTRIUM";
      break;
    case 41LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
      break;
    case 42LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_NIOBIUM";
      break;
    case 43LL:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
      break;
    default:
      uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_TEST";
      switch(a1)
      {
        case 'x':
          goto LABEL_109;
        case 'y':
          uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
          goto LABEL_109;
        case 'z':
          uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_GREYMATTER";
          goto LABEL_109;
        case '{':
          uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
          goto LABEL_109;
        case '|':
          uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
          goto LABEL_109;
        case '}':
          uint64_t v15 = "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
          goto LABEL_109;
        default:
          if (eligibility_log_handle_once_token != -1) {
            dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
          }
          uint32_t v24 = (os_log_s *)eligibility_log_handle_log_handle;
          if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v36 = "os_eligibility_get_domain_answer";
          __int16 v37 = 2048;
          v38 = (const char *)a1;
          uint64_t v14 = 22LL;
          _os_log_error_impl(&dword_18950F000, v24, OS_LOG_TYPE_ERROR, "%s: Invalid domain %llu", buf, 0x16u);
          break;
      }

      goto LABEL_46;
  }

LABEL_109:
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(object, v15);
  if (!dictionary)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v28 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = a1;
      _os_log_error_impl(&dword_18950F000, v28, OS_LOG_TYPE_ERROR, "%s: Domain %s(%llu) missing from plist", buf, 0x20u);
    }

    int64_t v12 = 0LL;
    xpc_object_t v13 = 0LL;
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }

  v26 = dictionary;
  int64_t int64 = xpc_dictionary_get_int64(dictionary, "os_eligibility_answer_t");
  if (int64 < 0)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    __int16 v29 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      _os_log_error_impl( &dword_18950F000,  v29,  OS_LOG_TYPE_ERROR,  "%s: Unable to read eligibility answer for domain: %s",  buf,  0x16u);
    }

    int64_t v12 = 0LL;
    goto LABEL_137;
  }

  if (a3)
  {
    int64_t v27 = xpc_dictionary_get_int64(v26, "os_eligibility_answer_source_t");
    int64_t v12 = v27;
    if (v27 >= 0)
    {
      *a3 = v27;
      goto LABEL_125;
    }

    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v32 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      _os_log_error_impl( &dword_18950F000,  v32,  OS_LOG_TYPE_ERROR,  "%s: Unable to read eligibility source for domain: %s",  buf,  0x16u);
    }

LABEL_137:
    xpc_object_t v13 = 0LL;
    uint64_t v14 = 33LL;
    goto LABEL_25;
  }

  int64_t v12 = 0LL;
LABEL_125:
  if (a4 && (xpc_object_t value = xpc_dictionary_get_value(v26, "status")) != 0LL) {
    xpc_object_t v13 = xpc_retain(value);
  }
  else {
    xpc_object_t v13 = 0LL;
  }
  if (a5 && (xpc_object_t v31 = xpc_dictionary_get_dictionary(v26, "context")) != 0LL)
  {
    uint64_t v14 = 0LL;
    *a5 = xpc_retain(v31);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

LABEL_25:
  free(v11);
  if (a2) {
    *a2 = int64;
  }
  if (a4)
  {
    if (v12 != 2 && !v13)
    {
      xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_object_t v13 = v18;
      v19 = "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION";
      switch(a1)
      {
        case 1LL:
          goto LABEL_34;
        case 2LL:
        case 3LL:
        case 4LL:
        case 5LL:
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
        case 11LL:
        case 12LL:
        case 14LL:
        case 16LL:
        case 17LL:
        case 19LL:
        case 20LL:
        case 22LL:
        case 23LL:
        case 24LL:
        case 27LL:
        case 32LL:
        case 33LL:
        case 34LL:
        case 35LL:
        case 36LL:
        case 40LL:
LABEL_31:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1LL);
          goto LABEL_32;
        case 10LL:
        case 13LL:
        case 15LL:
        case 25LL:
        case 26LL:
LABEL_32:
          uint32_t v20 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
          goto LABEL_33;
        case 18LL:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1LL);
          goto LABEL_49;
        case 21LL:
          v19 = "OS_ELIGIBILITY_INPUT_CHINA_CELLULAR";
          goto LABEL_34;
        case 28LL:
        case 37LL:
LABEL_47:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1LL);
          v19 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
          goto LABEL_34;
        case 29LL:
LABEL_49:
          v22 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
          goto LABEL_53;
        case 30LL:
        case 41LL:
        case 42LL:
          break;
        case 31LL:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1LL);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE";
          goto LABEL_34;
        case 38LL:
          v22 = "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE";
LABEL_53:
          xpc_dictionary_set_int64(v13, v22, 1LL);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_LOCALE";
          goto LABEL_34;
        case 39LL:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1LL);
          xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1LL);
          v23 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
LABEL_57:
          xpc_dictionary_set_int64(v13, v23, 1LL);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE";
          goto LABEL_34;
        case 43LL:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_INITIAL_SETUP_LOCATION", 1LL);
          uint32_t v20 = "OS_ELIGIBILITY_INPUT_BIRTHDATE";
LABEL_33:
          xpc_dictionary_set_int64(v13, v20, 1LL);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
LABEL_34:
          xpc_dictionary_set_int64(v13, v19, 1LL);
          break;
        default:
          switch(a1)
          {
            case 'x':
              goto LABEL_47;
            case 'y':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1LL);
              v23 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
              goto LABEL_57;
            case 'z':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_GENERATIVE_MODEL_SYSTEM", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_SIRI_LANGUAGE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_LOCALE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_SHARED_IPAD", 1LL);
              v19 = "OS_ELIGIBILITY_INPUT_DEVICE_AND_SIRI_LANGUAGE_MATCH";
              goto LABEL_34;
            case '{':
            case '}':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE", 1LL);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_CLASS", 1LL);
              v19 = "OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE";
              goto LABEL_34;
            case '|':
              goto LABEL_31;
            default:
              goto LABEL_35;
          }
      }
    }

LABEL_35:
    *a4 = v13;
  }

  else if (v13)
  {
    xpc_release(v13);
  }

  if (object) {
    xpc_release(object);
  }
  return v14;
}

uint64_t os_eligibility_get_all_domain_answers(void *a1)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v11 = 0LL;
  if (asprintf(&v11, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    int64_t v3 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      xpc_object_t v13 = "copy_eligibility_domain_answer_plist_path";
      __int16 v14 = 2080;
      uint64_t v15 = "/private/var/db/os_eligibility/eligibility.plist";
      _os_log_error_impl( &dword_18950F000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  int v4 = v11;
  v11 = 0LL;
  if (asprintf(&v11, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    __int16 v5 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      xpc_object_t v13 = "copy_eligibility_domain_public_answer_plist_path";
      __int16 v14 = 2080;
      uint64_t v15 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl( &dword_18950F000,  v5,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  uint64_t v6 = v11;
  uint64_t appended = _append_plist_keys_to_dictionary(v4, (uint64_t)v2);
  if ((_DWORD)appended)
  {
    uint64_t v8 = appended;
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v9 = (os_log_s *)eligibility_log_handle_log_handle;
    if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315650;
    xpc_object_t v13 = "os_eligibility_get_all_domain_answers";
    __int16 v14 = 2080;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    int v17 = v8;
    goto LABEL_25;
  }

  uint64_t v8 = _append_plist_keys_to_dictionary(v6, (uint64_t)v2);
  if (!(_DWORD)v8) {
    goto LABEL_21;
  }
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = (os_log_s *)eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    xpc_object_t v13 = "os_eligibility_get_all_domain_answers";
    __int16 v14 = 2080;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v8;
LABEL_25:
    _os_log_error_impl(&dword_18950F000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to load in plist %s: error=%d", buf, 0x1Cu);
  }

LABEL_20:
  xpc_object_t v2 = 0LL;
LABEL_21:
  free(v4);
  free(v6);
  if (a1) {
    *a1 = v2;
  }
  return v8;
}

uint64_t _append_plist_keys_to_dictionary(const char *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  xpc_object_t xdict = 0LL;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = load_eligibility_plist(a1, &xdict);
  if (*((_DWORD *)v10 + 6))
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    int v4 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v5 = *((_DWORD *)v10 + 6);
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "_append_plist_keys_to_dictionary";
      __int16 v16 = 2080;
      int v17 = a1;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_error_impl( &dword_18950F000,  v4,  OS_LOG_TYPE_ERROR,  "%s: Failed to read in plist %s: error=%d",  buf,  0x1Cu);
    }
  }

  else
  {
    applier[0] = MEMORY[0x1895FED80];
    applier[1] = 0x40000000LL;
    applier[2] = ___append_plist_keys_to_dictionary_block_invoke;
    applier[3] = &unk_18A3BDEC0;
    applier[4] = &v9;
    applier[5] = a2;
    xpc_dictionary_apply(xdict, applier);
  }

  if (xdict)
  {
    xpc_release(xdict);
    xpc_object_t xdict = 0LL;
  }

  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL ___append_plist_keys_to_dictionary_block_invoke(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  int64_t int64 = xpc_dictionary_get_int64(xdict, "os_eligibility_answer_t");
  if (int64 < 0)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    uint64_t v6 = (os_log_s *)eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "_append_plist_keys_to_dictionary_block_invoke";
      __int16 v10 = 2080;
      uint64_t v11 = a2;
      _os_log_error_impl( &dword_18950F000,  v6,  OS_LOG_TYPE_ERROR,  "%s: Unable to read eligibility answer for domain: %s",  (uint8_t *)&v8,  0x16u);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 33;
  }

  else
  {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), a2, int64);
  }

  return ((int64 >> 63) & 1) == 0;
}

uint64_t os_eligibility_get_internal_state(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  xpc_object_t xdict = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(4uLL, v2);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, &xdict);
  if (!(_DWORD)v3)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "internalStateDictionary");
    xpc_object_t v5 = dictionary;
    if (dictionary) {
      xpc_retain(dictionary);
    }
    *a1 = v5;
  }

  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v2);
  return v3;
}

uint64_t os_eligibility_get_state_dump(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  xpc_object_t xdict = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(7uLL, v2);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, &xdict);
  if (!(_DWORD)v3)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "stateDumpDictionary");
    xpc_object_t v5 = dictionary;
    if (dictionary) {
      xpc_retain(dictionary);
    }
    *a1 = v5;
  }

  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v2);
  return v3;
}

uint64_t os_eligibility_dump_sysdiagnose_data_to_dir(const char *a1)
{
  if (!a1) {
    return 22LL;
  }
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  eligibility_xpc_set_message_type(8uLL, v2);
  xpc_dictionary_set_string(v2, "dirPath", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0LL);
  xpc_release(v2);
  return v3;
}

char *os_eligibility_get_domain_notification_name(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  int64_t v3 = (os_log_s *)eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    xpc_object_t v5 = "os_eligibility_get_domain_notification_name";
    __int16 v6 = 2048;
    uint64_t v7 = a1;
    _os_log_error_impl( &dword_18950F000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Unable to convert domain to notification string: %llu",  (uint8_t *)&v4,  0x16u);
  }

  return 0LL;
}

uint64_t os_eligibility_domain_for_name(uint64_t result)
{
  if (result)
  {
    int64_t v1 = (const char *)result;
    if (!strcmp((const char *)result, "OS_ELIGIBILITY_DOMAIN_INVALID"))
    {
      return 0LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TEST"))
    {
      return 120LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LOTX"))
    {
      return 1LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS"))
    {
      return 121LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GREYMATTER"))
    {
      return 122LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_XCODE_LLM"))
    {
      return 123LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES"))
    {
      return 124LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST"))
    {
      return 125LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HYDROGEN"))
    {
      return 2LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HELIUM"))
    {
      return 3LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LITHIUM"))
    {
      return 4LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BERYLLIUM"))
    {
      return 5LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BORON"))
    {
      return 6LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CARBON"))
    {
      return 7LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NITROGEN"))
    {
      return 8LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OXYGEN"))
    {
      return 9LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FLUORINE"))
    {
      return 10LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEON"))
    {
      return 11LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SODIUM"))
    {
      return 12LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MAGNESIUM"))
    {
      return 13LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ALUMINUM"))
    {
      return 14LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SILICON"))
    {
      return 15LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS"))
    {
      return 16LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SULFUR"))
    {
      return 17LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CHLORINE"))
    {
      return 18LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ARGON"))
    {
      return 19LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_POTASSIUM"))
    {
      return 20LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CALCIUM"))
    {
      return 21LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SCANDIUM"))
    {
      return 22LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TITANIUM"))
    {
      return 23LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_VANADIUM"))
    {
      return 24LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CHROMIUM"))
    {
      return 25LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MANGANESE"))
    {
      return 26LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IRON"))
    {
      return 27LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COBALT"))
    {
      return 28LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NICKEL"))
    {
      return 29LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COPPER"))
    {
      return 30LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ZINC"))
    {
      return 31LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GALLIUM"))
    {
      return 32LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GERMANIUM"))
    {
      return 33LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ARSENIC"))
    {
      return 34LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SELENIUM"))
    {
      return 35LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BROMINE"))
    {
      return 36LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_KRYPTON"))
    {
      return 37LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUBIDIUM"))
    {
      return 38LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_STRONTIUM"))
    {
      return 39LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_YTTRIUM"))
    {
      return 40LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM"))
    {
      return 41LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NIOBIUM"))
    {
      return 42LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM"))
    {
      return 43LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TECHNETIUM"))
    {
      return 44LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUTHENIUM"))
    {
      return 45LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RHODIUM"))
    {
      return 46LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PALLADIUM"))
    {
      return 47LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SILVER"))
    {
      return 48LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CADMIUM"))
    {
      return 49LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_INDIUM"))
    {
      return 50LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TIN"))
    {
      return 51LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ANTIMONY"))
    {
      return 52LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TELLURIUM"))
    {
      return 53LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IODINE"))
    {
      return 54LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_XENON"))
    {
      return 55LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CESIUM"))
    {
      return 56LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BARIUM"))
    {
      return 57LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LANTHANUM"))
    {
      return 58LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CERIUM"))
    {
      return 59LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PRASEODYMIUM"))
    {
      return 60LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEODYMIUM"))
    {
      return 61LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PROMETHIUM"))
    {
      return 62LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SAMARIUM"))
    {
      return 63LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_EUROPIUM"))
    {
      return 64LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GADOLINIUM"))
    {
      return 65LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TERBIUM"))
    {
      return 66LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DYSPROSIUM"))
    {
      return 67LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HOLMIUM"))
    {
      return 68LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ERBIUM"))
    {
      return 69LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THULIUM"))
    {
      return 70LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_YTTERBIUM"))
    {
      return 71LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LUTETIUM"))
    {
      return 72LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HAFNIUM"))
    {
      return 73LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TANTALUM"))
    {
      return 74LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TUNGSTEN"))
    {
      return 75LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RHENIUM"))
    {
      return 76LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OSMIUM"))
    {
      return 77LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IRIDIUM"))
    {
      return 78LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PLATINUM"))
    {
      return 79LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GOLD"))
    {
      return 80LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MERCURY"))
    {
      return 81LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THALLIUM"))
    {
      return 82LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LEAD"))
    {
      return 83LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BISMUTH"))
    {
      return 84LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_POLONIUM"))
    {
      return 85LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ASTATINE"))
    {
      return 86LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RADON"))
    {
      return 87LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FRANCIUM"))
    {
      return 88LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RADIUM"))
    {
      return 89LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ACTINIUM"))
    {
      return 90LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THORIUM"))
    {
      return 91LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PROTACTINIUM"))
    {
      return 92LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_URANIUM"))
    {
      return 93LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEPTUNIUM"))
    {
      return 94LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PLUTONIUM"))
    {
      return 95LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_AMERICIUM"))
    {
      return 96LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CURIUM"))
    {
      return 97LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BERKELIUM"))
    {
      return 98LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CALIFORNIUM"))
    {
      return 99LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_EINSTEINIUM"))
    {
      return 100LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FERMIUM"))
    {
      return 101LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MENDELEVIUM"))
    {
      return 102LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NOBELIUM"))
    {
      return 103LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LAWRENCIUM"))
    {
      return 104LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUTHERFORDIUM"))
    {
      return 105LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DUBNIUM"))
    {
      return 106LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SEABORGIUM"))
    {
      return 107LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BOHRIUM"))
    {
      return 108LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HASSIUM"))
    {
      return 109LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MEITNERIUM"))
    {
      return 110LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DARMSTADTIUM"))
    {
      return 111LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ROENTGENIUM"))
    {
      return 112LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COPERNICIUM"))
    {
      return 113LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NIHONIUM"))
    {
      return 114LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FLEROVIUM"))
    {
      return 115LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MOSCOVIUM"))
    {
      return 116LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LIVERMORIUM"))
    {
      return 117LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TENNESSINE"))
    {
      return 118LL;
    }

    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OGANESSON"))
    {
      return 119LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x189600890](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x189600A80](name, targetq, flags);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x189600AB0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
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

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600B78](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x189600B88](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B90](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600BA0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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
  return (xpc_type_t)MEMORY[0x189600C10](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x189600C68](object);
}