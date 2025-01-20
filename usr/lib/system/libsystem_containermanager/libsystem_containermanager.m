void container_xpc_encode_client_onto_message(void *a1, uint64_t a2)
{
  xpc_object_t v3;
  void *v4;
  v3 = container_client_copy_encoded_xpc_object(a2, 0LL);
  if (v3)
  {
    v4 = v3;
    xpc_dictionary_set_value(a1, "ProxyForClient", v3);
    xpc_release(v4);
  }
}

void container_xpc_encode_container_metadata_as_object( xpc_object_t xdict, BOOL value, char *string, char *a4, xpc_object_t a5, BOOL a6, char *a7, char *a8)
{
  if (a5) {
    xpc_dictionary_set_value(xdict, "ContainerMetadataInfo", a5);
  }
  if (string) {
    xpc_dictionary_set_string(xdict, "ContainerMetadataPath", string);
  }
  if (a7) {
    xpc_dictionary_set_string(xdict, "ContainerMetadataUMARelativePath", a7);
  }
  if (a8) {
    xpc_dictionary_set_string(xdict, "ContainerMetadataCreator", a8);
  }
  if (a4) {
    xpc_dictionary_set_string(xdict, "ContainerMetadataSandboxToken", a4);
  }
  xpc_dictionary_set_BOOL(xdict, "ContainerMetadataExisted", value);
  xpc_dictionary_set_BOOL(xdict, "ContainerMetadataTransient", a6);
}

void container_xpc_encode_container_as_object( void *a1, char *string, uint64_t a3, unsigned int a4, const unsigned __int8 *a5, const char *a6, const char *a7, void *a8)
{
  if (a6) {
    xpc_dictionary_set_string(a1, "ContainerUniquePathComponent", a6);
  }
  if (a7) {
    xpc_dictionary_set_string(a1, "ContainerPersonaUniqueString", a7);
  }
  if (a8) {
    xpc_dictionary_set_value(a1, "ContainerMetadata", a8);
  }
}

void container_xpc_encode_container_object(void *a1, uint64_t a2, char *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  char v7 = container_object_is_new(a2) ^ 1;
  path = (char *)container_object_get_path(a2);
  uint64_t v9 = *(void *)(a2 + 88);
  else {
    xpc_object_t dictionary = *(xpc_object_t *)(a2 + 80);
  }
  unsigned __int8 v12 = container_object_is_transient(a2);
  user_managed_assets_relative_path = (char *)container_object_get_user_managed_assets_relative_path(a2);
  creator_codesign_identifier = (char *)container_object_get_creator_codesign_identifier(a2);
  container_xpc_encode_container_metadata_as_object( v6,  v7,  path,  a3,  dictionary,  v12,  user_managed_assets_relative_path,  creator_codesign_identifier);
  identifier = (char *)container_object_get_identifier(a2);
  v16 = container_object_get_class(a2);
  unsigned int uid = container_object_get_uid(a2);
  uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(a2);
  unique_path_component = (const char *)container_object_get_unique_path_component(a2);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a2);
  container_xpc_encode_container_as_object( a1,  identifier,  (uint64_t)v16,  uid,  uuid,  unique_path_component,  persona_unique_string,  v6);
  if (v6) {
    xpc_release(v6);
  }
}

void container_xpc_encode_container_array(void *a1, uint64_t *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      uint64_t v6 = *a2++;
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      container_xpc_encode_container_object(v7, v6, 0LL);
      xpc_array_append_value(a1, v7);
      xpc_release(v7);
      --v3;
    }

    while (v3);
  }

unsigned __int8 *container_xpc_decode_container_object(void *a1, uint64_t *a2)
{
  uint64_t v36 = *MEMORY[0x1895FEE08];
  if (MEMORY[0x186DF9184]() != MEMORY[0x189600980])
  {
    uint64_t v4 = 53LL;
    goto LABEL_6;
  }

  string = xpc_dictionary_get_string(a1, "ContainerPersonaUniqueString");
  uunsigned int uid = xpc_dictionary_get_uuid(a1, "ContainerUUID");
  if (!uuid
    || (xpc_object_t v7 = uuid, uuid_is_null(uuid))
    || (unsigned __int8 v12 = xpc_dictionary_get_string(a1, "ContainerUniquePathComponent")) == 0LL
    || (v13 = v12, (v14 = xpc_dictionary_get_string(a1, "ContainerIdentifier")) == 0LL)
    || (v15 = v14, uint64_t uint64 = xpc_dictionary_get_uint64(a1, "ContainerClass"), uint64 - 1 > 0xD))
  {
    uint64_t v4 = 54LL;
    goto LABEL_6;
  }

  uint64_t v17 = uint64;
  int v31 = xpc_dictionary_get_uint64(a1, "ContainerUID");
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "ContainerMetadata");
  if (dictionary)
  {
    v19 = dictionary;
    BOOL v30 = xpc_dictionary_get_BOOL(dictionary, "ContainerMetadataExisted");
    v29 = xpc_dictionary_get_string(v19, "ContainerMetadataPath");
    xpc_object_t value = xpc_dictionary_get_value(v19, "ContainerMetadataInfo");
    BOOL v27 = xpc_dictionary_get_BOOL(v19, "ContainerMetadataTransient");
    v20 = xpc_dictionary_get_string(v19, "ContainerMetadataUMARelativePath");
    v21 = xpc_dictionary_get_string(v19, "ContainerMetadataCreator");
    xpc_object_t dictionary = (void *)xpc_dictionary_get_string(v19, "ContainerMetadataSandboxToken");
    v22 = v20;
    unsigned __int8 v23 = v27;
    v25 = value;
    v24 = v29;
    unsigned __int8 v26 = !v30;
  }

  else
  {
    v25 = 0LL;
    unsigned __int8 v23 = 0;
    v22 = 0LL;
    v21 = 0LL;
    v24 = 0LL;
    unsigned __int8 v26 = 1;
  }

  uint64_t v4 = 1LL;
  uint64_t v33 = 1LL;
  result = container_object_create( v7,  v15,  v17,  v31,  v24,  v13,  string,  v25,  (const char *)dictionary,  v26,  v23,  v22,  v21,  &v33);
  if (!result)
  {
LABEL_6:
    if (!a1)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      v10 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_ERROR,  "Could not decode message into container object: NULL",  buf,  2u);
      }

      goto LABEL_16;
    }

    v8 = (void *)MEMORY[0x186DF907C](a1);
    __s = v8;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v9 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v35 = v8;
      _os_log_error_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_ERROR,  "Could not decode message into container object: %{public}s",  buf,  0xCu);
      if (!v8)
      {
LABEL_16:
        result = 0LL;
        if (a2) {
          *a2 = v4;
        }
        return result;
      }
    }

    else if (!v8)
    {
      goto LABEL_16;
    }

    free(v8);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_16;
  }

  return result;
}

void *container_xpc_decode_create_container_object_array(void *a1, void *a2, void *a3)
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 1LL;
  if (MEMORY[0x186DF9184]() == MEMORY[0x189600958])
  {
    size_t count = xpc_array_get_count(a1);
    if (count <= 1) {
      size_t count = 1LL;
    }
    v11 = calloc(count, 8uLL);
    uint64_t v6 = v11;
    if (!v11)
    {
      xpc_object_t v7 = v15;
      uint64_t v8 = 73LL;
      goto LABEL_4;
    }

    applier[0] = MEMORY[0x1895FED80];
    applier[1] = 0x40000000LL;
    applier[2] = __container_xpc_decode_create_container_object_array_block_invoke;
    applier[3] = &unk_189639460;
    applier[4] = &v14;
    applier[5] = &v18;
    applier[6] = v11;
    BOOL v12 = xpc_array_apply(a1, applier);
    xpc_object_t v7 = v15;
    if (v12)
    {
      if (v15[3] == 1) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    xpc_object_t v7 = v15;
  }

  uint64_t v8 = 53LL;
LABEL_4:
  v7[3] = v8;
LABEL_5:
  container_free_array_of_containers(v6, v19[3]);
  v19[3] = 0LL;
  uint64_t v6 = 0LL;
  if (a3) {
    *a3 = v15[3];
  }
LABEL_7:
  if (a2) {
    *a2 = v19[3];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

unsigned __int8 *__container_xpc_decode_create_container_object_array_block_invoke( void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = 1LL;
  result = container_xpc_decode_container_object(a3, &v7);
  if (result)
  {
    *(void *)(a1[6] + 8LL * *(void *)(*(void *)(a1[5] + 8LL) + 24LL)) = result;
    uint64_t v5 = *(void *)(a1[5] + 8LL);
    uint64_t v6 = *(void *)(v5 + 24);
    if (*(void *)(a1[6] + 8 * v6))
    {
      *(void *)(v5 + 24) = v6 + 1;
      return (unsigned __int8 *)1;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v7;
  }

  return result;
}

uint64_t container_xpc_encode_error_as_object(void *a1, uint64_t value, uint64_t a3, const char *a4, int a5)
{
  if (a4) {
    xpc_dictionary_set_string(a1, "ErrorPath", a4);
  }
  xpc_dictionary_set_uint64(a1, "ErrorPOSIXErrno", a5);
  return 1LL;
}

uint64_t container_xpc_encode_error(void *a1, uint64_t a2)
{
  return 1LL;
}

void *container_xpc_decode_error(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  if (MEMORY[0x186DF9184]() != MEMORY[0x189600980]
    || (uint64_t uint64 = xpc_dictionary_get_uint64(a1, "ErrorType"),
        uint64_t v8 = xpc_dictionary_get_uint64(a1, "ErrorCategory"),
        string = (char *)xpc_dictionary_get_string(a1, "ErrorPath"),
        int v10 = xpc_dictionary_get_uint64(a1, "ErrorPOSIXErrno"),
        !uint64)
    || (result = container_error_create(v8, uint64, string, v10)) == 0LL)
  {
    uint64_t v4 = (void *)MEMORY[0x186DF907C](a1);
    __s = v4;
    if (!a2) {
      goto LABEL_6;
    }
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v5 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v13 = v4;
      _os_log_error_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_ERROR,  "Could not decode message into error: %{public}s",  buf,  0xCu);
      if (!v4) {
        return 0LL;
      }
    }

    else
    {
LABEL_6:
      if (!v4) {
        return 0LL;
      }
    }

    free(v4);
    memset_s(&__s, 8uLL, 0, 8uLL);
    return 0LL;
  }

  return result;
}

uint64_t container_error_is_fatal()
{
  return 0LL;
}

void *container_error_create(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t v8 = calloc(1uLL, 0x30uLL);
  uint64_t v9 = v8;
  if (v8) {
    container_error_reinitialize((uint64_t)v8, a1, a2, a3, a4);
  }
  return v9;
}

char *container_error_reinitialize(uint64_t a1, uint64_t a2, uint64_t a3, char *__s1, int a5)
{
  v11 = (void *)(a1 + 16);
  int v10 = *(void **)(a1 + 16);
  if (v10)
  {
    free(v10);
    memset_s(v11, 8uLL, 0, 8uLL);
  }

  *(void *)a1 = a3;
  *(void *)(a1 + 8) = a2;
  if (__s1) {
    result = strndup(__s1, 0x400uLL);
  }
  else {
    result = 0LL;
  }
  *(void *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 24) = a5;
  return result;
}

uint64_t container_error_get_path(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t container_error_get_type(uint64_t a1)
{
  if (a1) {
    return *(void *)a1;
  }
  else {
    return 1LL;
  }
}

uint64_t container_error_get_category(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t container_error_get_posix_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void *container_error_copy(uint64_t a1)
{
  return container_error_create(*(void *)(a1 + 8), *(void *)a1, *(char **)(a1 + 16), *(_DWORD *)(a1 + 24));
}

void container_error_free(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  __s = a1;
  if (a1)
  {
    if (a1[4])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      v2 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v7 = "container_error_free";
        uint64_t v3 = "%s: SPI MISUSE: Attempt to free container_error_extended_t that is owned by a container_query_t. Ignoring.";
LABEL_12:
        _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, v3, buf, 0xCu);
      }
    }

    else if (a1[5])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      v2 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v7 = "container_error_free";
        uint64_t v3 = "%s: SPI MISUSE: Attempt to free container_error_extended_t that is owned by a container_references_t. Ignoring.";
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v4 = (void *)a1[2];
      if (v4)
      {
        free(v4);
        memset_s(a1 + 2, 8uLL, 0, 8uLL);
      }

      free(a1);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

char *container_error_copy_unlocalized_description(uint64_t a1)
{
  uint64_t v3 = 0LL;
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 24);
    if (v1 < 1)
    {
      asprintf(&v3, "%llu→(%llu) %s");
    }

    else
    {
      strerror(v1);
      asprintf(&v3, "%llu→(%llu) %s at path [%s] with errno (%d) %s");
    }
  }

  return v3;
}

const char *container_get_error_description(unint64_t a1)
{
  if (a1 > 0x99) {
    return "UNKNOWN";
  }
  else {
    return off_189639480[a1];
  }
}

uint64_t container_error_is_file_system_error(uint64_t a1)
{
  uint64_t result = 0LL;
  switch(a1)
  {
    case 2LL:
    case 3LL:
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 12LL:
    case 13LL:
    case 14LL:
    case 15LL:
    case 17LL:
    case 22LL:
    case 23LL:
    case 25LL:
    case 26LL:
    case 27LL:
    case 28LL:
    case 30LL:
    case 32LL:
    case 33LL:
    case 34LL:
    case 35LL:
    case 36LL:
    case 37LL:
    case 41LL:
    case 42LL:
    case 43LL:
    case 48LL:
    case 56LL:
    case 61LL:
    case 62LL:
    case 63LL:
    case 64LL:
    case 66LL:
    case 70LL:
    case 71LL:
    case 82LL:
    case 84LL:
    case 85LL:
    case 86LL:
    case 87LL:
    case 92LL:
    case 102LL:
    case 103LL:
    case 104LL:
    case 105LL:
    case 106LL:
    case 109LL:
    case 122LL:
    case 123LL:
    case 125LL:
    case 127LL:
    case 129LL:
    case 130LL:
    case 132LL:
    case 144LL:
    case 145LL:
    case 146LL:
    case 152LL:
    case 153LL:
      uint64_t result = 1LL;
      break;
    default:
      return result;
  }

  return result;
}

char *container_frozenset_create(int a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6, uint64_t a7)
{
  uint64_t v80 = *MEMORY[0x1895FEE08];
  uint64_t v72 = 0LL;
  uint64_t v73 = 0LL;
  uint64_t v74 = 8LL;
  v75 = 0LL;
  uint64_t v68 = 0LL;
  unint64_t v69 = 0LL;
  uint64_t v70 = 24LL;
  v71 = 0LL;
  v65[0] = 0LL;
  v65[1] = 0LL;
  uint64_t v66 = 8LL;
  uint64_t v67 = 0LL;
  if (!a2)
  {
LABEL_78:
    v41 = 0LL;
    goto LABEL_79;
  }

  uint64_t v7 = a7;
  int v8 = a1;
  if (!a3)
  {
    size_t v44 = 0LL;
    v43 = 0LL;
LABEL_82:
    v46 = container_string_rom_create(v43, v44, 1);
    v41 = (char *)v46;
    if (v46)
    {
      size_t v47 = *((void *)v46 + 2);
      size_t v48 = v47 + 24LL * v69;
      size_t v49 = v48 + 24;
      if (v7)
      {
        uint64_t v50 = v7;
        v51 = (char *)(*(uint64_t (**)(uint64_t, size_t))(v7 + 16))(v7, v49);
      }

      else
      {
        uint64_t v50 = 0LL;
        v51 = (char *)calloc(1uLL, v48 + 24);
      }

      v42 = v51;
      if (v51)
      {
        *(_DWORD *)v51 = 1952797507;
        v51[4] = 1;
        v51[5] = v50 != 0;
        unint64_t v52 = v69;
        *((_DWORD *)v51 + 2) = v69;
        *((_DWORD *)v51 + 3) = v8;
        *((void *)v51 + 2) = v49;
        memcpy(v51 + 24, v71, v70 * v52);
        int v53 = *((_DWORD *)v42 + 2);
        uint64_t v54 = (uint64_t)&v42[24 * v53 + 24];
        size_t v55 = *((void *)v41 + 2);
        if (v54) {
          BOOL v56 = v55 > v47;
        }
        else {
          BOOL v56 = 1;
        }
        if (!v56)
        {
          memcpy(&v42[24 * v53 + 24], v41, v55);
          *(_BYTE *)(v54 + 5) = 1;
        }
      }

      goto LABEL_80;
    }

LABEL_79:
    v42 = 0LL;
    goto LABEL_80;
  }

  uint64_t v9 = a2;
  uint64_t v10 = 0LL;
  uint64_t v60 = a3;
  do
  {
    uint64_t v11 = *(void *)(v9 + 8 * v10);
    if (!v11)
    {
      uint64_t v17 = 0LL;
      goto LABEL_21;
    }

    uunsigned int uid = container_object_get_uuid(v11);
    unint64_t v13 = v69;
    if (!v69) {
      goto LABEL_20;
    }
    uint64_t v14 = uuid;
    uint64_t v15 = 0LL;
    while (!v70)
    {
      uint64_t v16 = 0LL;
LABEL_14:
      unint64_t v13 = v69;
LABEL_16:
      if (++v15 >= v13) {
        goto LABEL_20;
      }
    }

    uint64_t v16 = (const unsigned __int8 *)&v71[v70 * v15];
    if (!v14 || !v16) {
      goto LABEL_14;
    }
    if (*(void *)v14 != *(void *)v16 || *(void *)(v14 + 8) != *((void *)v16 + 1)) {
      goto LABEL_16;
    }
LABEL_19:
    if ((v15 & 0x8000000000000000LL) == 0) {
      goto LABEL_73;
    }
LABEL_20:
    uint64_t v17 = *(void *)(v9 + 8 * v10);
LABEL_21:
    uint64_t v76 = v17;
    memset(dst, 0, sizeof(dst));
    uint64_t v79 = 0LL;
    uint64_t v18 = (const unsigned __int8 *)container_object_get_uuid(v17);
    uuid_copy(dst, v18);
    if (v17)
    {
      unint64_t identifier = container_object_get_identifier(v17);
      persona_unique_string = (void *)container_object_get_persona_unique_string(v17);
    }

    else
    {
      unint64_t identifier = 0LL;
      persona_unique_string = 0LL;
    }

    unint64_t unique_path_component = container_object_get_unique_path_component(v17);
    if (a4) {
      unint64_t path = container_object_get_path(v17);
    }
    else {
      unint64_t path = 0LL;
    }
    if (a5) {
      user_managed_assets_relative_unint64_t path = container_object_get_user_managed_assets_relative_path(v17);
    }
    else {
      user_managed_assets_relative_unint64_t path = 0LL;
    }
    if (a6) {
      creator_codesign_unint64_t identifier = container_object_get_creator_codesign_identifier(v17);
    }
    else {
      creator_codesign_unint64_t identifier = 0LL;
    }
    if (identifier) {
      v25 = (void *)identifier;
    }
    else {
      v25 = &unk_1802B435E;
    }
    v77 = v25;
    unsigned __int8 v26 = persona_unique_string ? persona_unique_string : &unk_1802B435E;
    v77 = v26;
    if (c_array_append((uint64_t)&v72, &v77)
      && (unique_path_component ? (BOOL v27 = (void *)unique_path_component) : (BOOL v27 = &unk_1802B435E),
          (v77 = v27, c_array_append((uint64_t)&v72, &v77))
       && (path ? (v28 = (void *)path) : (v28 = &unk_1802B435E),
           (v77 = v28, c_array_append((uint64_t)&v72, &v77))
        && (user_managed_assets_relative_path
          ? (v29 = (void *)user_managed_assets_relative_path)
          : (v29 = &unk_1802B435E),
            v77 = v29,
            c_array_append((uint64_t)&v72, &v77)))))
    {
      if (creator_codesign_identifier) {
        BOOL v30 = (void *)creator_codesign_identifier;
      }
      else {
        BOOL v30 = &unk_1802B435E;
      }
      v77 = v30;
      int v64 = c_array_append((uint64_t)&v72, &v77);
    }

    else
    {
LABEL_57:
      int v64 = 0;
    }

    unint64_t v31 = creator_codesign_identifier;
    unint64_t v32 = user_managed_assets_relative_path;
    unint64_t v33 = path;
    if (v17) {
      unsigned __int8 v34 = container_object_get_class(v17);
    }
    else {
      unsigned __int8 v34 = 0;
    }
    int v35 = identifier == 0;
    unsigned int v36 = container_object_is_new(v17);
    unsigned int v37 = container_object_is_transient(v17);
    if (v36) {
      int v38 = 128;
    }
    else {
      int v38 = 0;
    }
    if (v37) {
      int v39 = 64;
    }
    else {
      int v39 = 0;
    }
    LODWORD(v79) = (v35 << 8) | ((persona_unique_string == 0LL) << 9) | ((unique_path_component == 0) << 10) | ((v33 == 0) << 11) | ((v32 == 0) << 12) | ((v31 == 0) << 13) | v34 & 0x3F | v38 | v39;
    if (v17) {
      unsigned int uid = container_object_get_uid(v17);
    }
    else {
      unsigned int uid = 0;
    }
    HIDWORD(v79) = uid;
    if (!v64) {
      goto LABEL_78;
    }
    uint64_t v9 = a2;
LABEL_73:
    ++v10;
  }

  while (v10 != v60);
  v41 = 0LL;
  if (v74 && v70)
  {
    v42 = 0LL;
    if (v66)
    {
      v43 = v75;
      size_t v44 = v73;
      int v8 = a1;
      uint64_t v7 = a7;
      goto LABEL_82;
    }
  }

  else
  {
    v42 = 0LL;
  }

LABEL_80:
  c_array_deinit(&v72);
  c_array_deinit(&v68);
  c_array_deinit(v65);
  container_string_rom_destroy(v41);
  return v42;
}

      __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  104,  "((void)container_bitvector_get(): index too large for array, 0)");
    }

    uint64_t v50 = v48 + 8;
    v29 = __CFADD__(v50, v6);
    v51 = (void *)(v50 + v6);
    if (!v29 && (unint64_t)v51 + 7 >= 8)
    {
      size_t v47 = (*v51 >> -(char)v47) | (*(v51 - 1) << v47);
      goto LABEL_73;
    }

uint64_t c_array_append(uint64_t a1, const void *a2)
{
  if (!a2) {
    return 0LL;
  }
  size_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5 != *(void *)a1)
    {
      uint64_t v9 = *(char **)(a1 + 24);
LABEL_16:
      memcpy(&v9[v3 * v5], a2, v3);
      ++*(void *)(a1 + 8);
      return 1LL;
    }

    if (v5) {
      unint64_t v6 = 2 * v5;
    }
    else {
      unint64_t v6 = 16LL;
    }
    if (v6 <= 1) {
      size_t v7 = 1LL;
    }
    else {
      size_t v7 = v6;
    }
    int v8 = (char *)calloc(v7, v3);
    if (v8)
    {
      uint64_t v9 = v8;
      memcpy(v8, *(const void **)(a1 + 24), *(void *)(a1 + 16) * *(void *)a1);
      uint64_t v10 = *(void **)(a1 + 24);
      if (v10)
      {
        free(v10);
        memset_s((void *)(a1 + 24), 8uLL, 0, 8uLL);
      }

      *(void *)(a1 + 24) = v9;
      *(void *)a1 = v6;
      uint64_t v5 = *(void *)(a1 + 8);
      size_t v3 = *(void *)(a1 + 16);
      goto LABEL_16;
    }

    c_array_deinit((void *)a1);
  }

  return 0LL;
}

void *c_array_deinit(void *a1)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  v2 = a1 + 3;
  uint64_t result = (void *)a1[3];
  if (result)
  {
    free(result);
    return (void *)memset_s(v2, 8uLL, 0, 8uLL);
  }

  return result;
}

_BYTE *container_frozenset_destroy(_BYTE *result)
{
  __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

  return result;
}

size_t container_frozenset_copyout_external_bytes(void *__src, void *__dst, size_t a3)
{
  size_t v3 = __src[2];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[2];
  }

  return v3;
}

_BYTE *container_frozenset_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v5 = calloc(1uLL, a2);
    memcpy(v5, a1, a2);
    v5[5] = 0;
    return v5;
  }

  return a1;
}

uint64_t container_frozenset_get_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t container_frozenset_get_generation(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

uint64_t container_frozenset_get_uuid_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) > a2) {
      result += 24LL * a2 + 24;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t container_frozenset_get_is_new_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2) {
      return 0LL;
    }
    else {
      return *(unsigned __int8 *)(result + 24LL * a2 + 40) >> 7;
    }
  }

  return result;
}

uint64_t container_frozenset_get_is_transient_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2) {
      return 0LL;
    }
    else {
      return (*(unsigned __int8 *)(result + 24LL * a2 + 40) >> 6) & 1;
    }
  }

  return result;
}

uint64_t container_frozenset_get_container_class_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2) {
      return 0LL;
    }
    else {
      return *(_DWORD *)(result + 24LL * a2 + 40) & 0x3FLL;
    }
  }

  return result;
}

uint64_t container_frozenset_get_uid_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2) {
      return 0LL;
    }
    else {
      return *(unsigned int *)(result + 24LL * a2 + 44);
    }
  }

  return result;
}

unint64_t container_frozenset_get_identifier_of_container_at_index(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 1) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, 6 * a2);
  }
}

unint64_t container_frozenset_get_persona_unique_string_of_container_at_index( uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 2) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, (6 * a2) | 1);
  }
}

unint64_t container_frozenset_get_path_of_container_at_index(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 8) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, 6 * a2 + 3);
  }
}

unint64_t container_frozenset_get_uma_relative_path_of_container_at_index( uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 0x10) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, 6 * a2 + 4);
  }
}

unint64_t container_frozenset_get_creator_of_container_at_index(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 0x20) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, 6 * a2 + 5);
  }
}

unint64_t container_frozenset_get_unique_path_component_of_container_at_index( uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24LL * a2 + 17) & 4) != 0) {
    return 0LL;
  }
  else {
    return container_string_rom_string_at_index(a1 + 24 + 24LL * v2, 6 * a2 + 2);
  }
}

unint64_t container_frozenset_get_stored_string(uint64_t a1, const char *a2)
{
  if (a1
    && a2
    && (uint64_t v2 = a1 + 24LL * *(unsigned int *)(a1 + 8) + 24,
        unint64_t v3 = container_string_rom_index_of(v2, a2),
        (v3 & 0x8000000000000000LL) == 0))
  {
    return container_string_rom_string_at_index(v2, v3);
  }

  else
  {
    return 0LL;
  }

uint64_t container_frozenset_enumerate_matches(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = a1 + 24;
  uint64_t v7 = a1 + 24 + 24LL * *(unsigned int *)(a1 + 8);
  unint64_t v8 = container_string_rom_index_of(v7, *(const char **)(a2 + 16));
  if (*(void *)(a2 + 16))
  {
    if ((v8 & 0x8000000000000000LL) != 0) {
      return 0LL;
    }
  }

  unint64_t v9 = container_string_rom_string_at_index(v7, v8);
  __s = 0LL;
  uint64_t v10 = *(void **)(a2 + 24);
  if (v10)
  {
    size_t count = xpc_array_get_count(v10);
    unint64_t v13 = (xpc_object_t *)(a2 + 32);
    BOOL v12 = *(void **)(a2 + 32);
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  size_t count = 0LL;
  unint64_t v13 = (xpc_object_t *)(a2 + 32);
  BOOL v12 = *(void **)(a2 + 32);
  if (v12)
  {
LABEL_8:
    BOOL v12 = (void *)xpc_array_get_count(v12);
LABEL_9:
    else {
      size_t v14 = (size_t)v12 + count;
    }
    __s = calloc(v14, 8uLL);
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2000000000LL;
    uint64_t v31 = 0LL;
    v27[0] = MEMORY[0x1895FED80];
    v27[1] = 0x40000000LL;
    v27[2] = __container_frozenset_enumerate_matches_block_invoke;
    v27[3] = &unk_189639958;
    v27[5] = v7;
    v27[6] = __s;
    v27[4] = &v28;
    uint64_t v15 = *(void **)(a2 + 24);
    if (v15) {
      xpc_array_apply(v15, v27);
    }
    if (*v13) {
      xpc_array_apply(*v13, v27);
    }
    size_t count = v29[3];
    if (count)
    {
      _Block_object_dispose(&v28, 8);
      goto LABEL_18;
    }

    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

    _Block_object_dispose(&v28, 8);
    return 0LL;
  }

LABEL_18:
  unsigned int v16 = *(_DWORD *)(a1 + 8);
  unint64_t v18 = *(unsigned int *)(a2 + 40);
  unsigned int v17 = *(_DWORD *)(a2 + 44);
  if (v16 < v17) {
    unsigned int v17 = *(_DWORD *)(a1 + 8);
  }
  if (v18 < v17)
  {
    do
    {
      if (*(_BYTE *)(a2 + 13) && *(void *)a2 != (*(_DWORD *)(v6 + 24 * v18 + 16) & 0x3F)) {
        goto LABEL_43;
      }
      if (*(_BYTE *)(a2 + 14) && *(_DWORD *)(a2 + 8) != (*(_DWORD *)(v6 + 24 * v18 + 20) != 0)) {
        goto LABEL_43;
      }
      if (*(_BYTE *)(a2 + 15) && *(_BYTE *)(a2 + 12) != ((*(_DWORD *)(v6 + 24 * v18 + 16) >> 6) & 1)) {
        goto LABEL_43;
      }
      if (*(void *)(a2 + 16))
      {
        unint64_t v19 = (*(_BYTE *)(v6 + 24 * v18 + 17) & 2) != 0
            ? 0LL
            : container_string_rom_string_at_index(v6 + 24LL * v16, (6 * v18) | 1LL);
        if (v19 != v9) {
          goto LABEL_43;
        }
      }

      if (__s)
      {
        unint64_t v20 = *(unsigned int *)(a1 + 8);
        if (v18 >= v20 || (*(_BYTE *)(v6 + 24 * v18 + 17) & 1) != 0)
        {
          unint64_t v21 = 0LL;
          if (!count) {
            goto LABEL_43;
          }
        }

        else
        {
          unint64_t v21 = container_string_rom_string_at_index(v6 + 24LL * v20, (6 * v18));
          if (!count) {
            goto LABEL_43;
          }
        }

        v22 = __s;
        size_t v23 = count;
        while (v21 != *v22)
        {
          ++v22;
          if (!--v23) {
            goto LABEL_43;
          }
        }
      }

      if (!(*(unsigned int (**)(uint64_t, unint64_t))(a3 + 16))(a3, v18))
      {
        uint64_t v25 = 0LL;
        goto LABEL_48;
      }

  if (*((_DWORD *)__s + 9) == 2)
  {
    unint64_t v21 = *((_DWORD *)__s + 3);
    if ((v21 & 2) != 0)
    {
      v22 = *(_DWORD *)v16;
      unsigned int v16 = (uint64_t *)((char *)v16 + 4);
      *((_DWORD *)__s + 20) = v22;
      if (!v22) {
        *a7 = 1;
      }
    }

    if ((v21 & 4) != 0)
    {
      size_t v23 = *(_DWORD *)v16;
      *((_DWORD *)__s + 21) = v23;
      if (*(_BYTE *)(a1 + 1051))
      {
        if ((v23 & 3) != 0)
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          unint64_t v24 = (os_log_s *)qword_18C438D80;
          if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v37 = 136315394;
            int v38 = a1 + 24;
            int v39 = 2080;
            v40 = v18;
            _os_log_debug_impl( &dword_18028C000,  v24,  OS_LOG_TYPE_DEBUG,  "skipping mount point or trigger at [%s]/[%s]",  (uint8_t *)&v37,  0x16u);
          }

          *a7 = 1;
        }
      }
    }
  }

  else
  {
    int v35 = *((_DWORD *)__s + 4);
    if ((v35 & 1) != 0)
    {
      unsigned int v36 = *(_DWORD *)v16;
      unsigned int v16 = (uint64_t *)((char *)v16 + 4);
      *((_DWORD *)__s + 20) = v36;
    }

    if ((v35 & 4) != 0) {
      *((void *)__s + 11) = *v16;
    }
  }

  if (a6) {
    *a6 = v18;
  }
}

LABEL_43:
      ++v18;
      unsigned int v16 = *(_DWORD *)(a1 + 8);
      LODWORD(v24) = *(_DWORD *)(a2 + 44);
      else {
        unint64_t v24 = v16;
      }
    }

    while (v18 < v24);
  }

  uint64_t v25 = 1LL;
LABEL_48:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return v25;
}

uint64_t __container_frozenset_enumerate_matches_block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (MEMORY[0x186DF9184](a3) == MEMORY[0x1896009B8]) {
    string_ptr = xpc_string_get_string_ptr(a3);
  }
  else {
    string_ptr = 0LL;
  }
  unint64_t v6 = container_string_rom_index_of(a1[5], string_ptr);
  if ((v6 & 0x8000000000000000LL) == 0) {
    *(void *)(a1[6] + 8LL * (*(void *)(*(void *)(a1[4] + 8LL) + 24LL))++) = container_string_rom_string_at_index( a1[5],  v6);
  }
  return 1LL;
}

BOOL container_fs_item_exists_at(int a1, const char *a2, int *a3)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  memset(&v9, 0, sizeof(v9));
  int v5 = fstatat(a1, a2, &v9, 32);
  if (a3) {
    *a3 = *__error();
  }
  if (v5 && *__error() != 2 && *__error() != 20)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unint64_t v6 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)buf = 136380931;
      uint64_t v11 = a2;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_error_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to determine if %{private}s exists: %{darwin.errno}d",  buf,  0x12u);
    }
  }

  return v5 == 0;
}

BOOL container_fs_item_exists(const char *a1, int *a2)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  memset(&v8, 0, sizeof(v8));
  int v4 = lstat(a1, &v8);
  if (a2) {
    *a2 = *__error();
  }
  if (v4 && *__error() != 2 && *__error() != 20)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v5 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 136380931;
      uint64_t v10 = a1;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_error_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to determine if %{private}s exists: %{darwin.errno}d",  buf,  0x12u);
    }
  }

  return v4 == 0;
}

uint64_t container_fs_load_plist_at(int a1, const char *a2)
{
  __s = 0LL;
  int v2 = openat(a1, a2, 0x1000000);
  if ((v2 & 0x80000000) == 0)
  {
    int v3 = v2;
    size_t v4 = lseek(v2, 0LL, 2);
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      int64_t v5 = v4;
      if (v4 > 0xA00000)
      {
        uint64_t v6 = 0LL;
        int v7 = 27;
LABEL_21:
        close(v3);
        goto LABEL_22;
      }

      stat v8 = (char *)calloc(1uLL, v4);
      __s = v8;
      if (v8)
      {
        stat v9 = v8;
        if (v5)
        {
          off_t v10 = 0LL;
          int v7 = 0;
          while (1)
          {
            ssize_t v11 = pread(v3, &v9[v10], v5 - v10, v10);
            if (v11 < 0)
            {
              int v7 = *__error();
              if (v7 != 4)
              {
                uint64_t v6 = 0LL;
                goto LABEL_20;
              }
            }

            else
            {
              if (!v11)
              {
                uint64_t v6 = 0LL;
                int v7 = 70;
                goto LABEL_20;
              }

              v10 += v11;
            }

            if (v10 >= v5) {
              goto LABEL_17;
            }
          }
        }

        int v7 = 0;
LABEL_17:
        uint64_t v6 = xpc_create_from_plist();
LABEL_20:
        free(v9);
        memset_s(&__s, 8uLL, 0, 8uLL);
        goto LABEL_21;
      }
    }

    uint64_t v6 = 0LL;
    int v7 = *__error();
    goto LABEL_21;
  }

  uint64_t v6 = 0LL;
  int v7 = *__error();
LABEL_22:
  *__error() = v7;
  return v6;
}

uint64_t container_realpath(uint64_t a1, char *a2, size_t a3)
{
  return container_realpathat(4294967294LL, a1, a2, a3);
}

uint64_t container_realpathat(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  if (a2 && a3)
  {
    uint64_t v11 = 0LL;
    __int128 v10 = xmmword_1802B1D30;
    bzero(v12, 0x410uLL);
    if ((_DWORD)a1 == -2) {
      uint64_t result = (*((uint64_t (**)(uint64_t, __int128 *, _BYTE *, uint64_t, uint64_t))gCMFSSeam + 50))( a2,  &v10,  v12,  1039LL,  32LL);
    }
    else {
      uint64_t result = (*((uint64_t (**)(uint64_t, uint64_t, __int128 *, _BYTE *, uint64_t, uint64_t))gCMFSSeam + 51))( a1,  a2,  &v10,  v12,  1039LL,  32LL);
    }
    v13[1024] = 0;
    if (!(_DWORD)result)
    {
      if (strlcpy(a3, v13, a4) <= a4)
      {
        return 0LL;
      }

      else
      {
        *a3 = 0;
        stat v9 = __error();
        uint64_t result = 0LL;
        *stat v9 = 63;
      }
    }
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  return result;
}

const char *container_fs_add_path_component(const char *result, uint64_t a2, size_t __n)
{
  if (result)
  {
    int64_t v5 = result;
    uint64_t result = (const char *)strnlen(result, __n);
    if (*(_BYTE *)a2 == 47 && *(_BYTE *)(a2 + 1)) {
      ++a2;
    }
  }

  return result;
}

uint64_t container_fs_resolve_dirent_type_at(int a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 20);
  if (!*(_BYTE *)(a2 + 20))
  {
    memset(&v7, 0, sizeof(v7));
    int v3 = fstatat(a1, (const char *)(a2 + 21), &v7, 0);
    uint64_t v2 = 0LL;
    if (!v3)
    {
      int v4 = v7.st_mode & 0xF000;
      if (v4 == 0x4000)
      {
        return 4LL;
      }

      else
      {
        if (v4 == 40960) {
          unsigned int v5 = 10;
        }
        else {
          unsigned int v5 = 0;
        }
        if (v4 == 0x8000) {
          return 8LL;
        }
        else {
          return v5;
        }
      }
    }
  }

  return v2;
}

void *container_fs_path_at(int a1, uint64_t a2)
{
  int v4 = calloc(0x401uLL, 1uLL);
  unsigned int v5 = v4;
  __s = v4;
  if (v4)
  {
    if (fcntl(a1, 50, v4, __s))
    {
      free(v5);
      memset_s(&__s, 8uLL, 0, 8uLL);
      return 0LL;
    }

    else if (a2)
    {
      container_fs_add_path_component((const char *)v5, a2, 0x400uLL);
    }
  }

  return v5;
}

size_t container_fs_append_trailing_slash(const char *a1, size_t a2)
{
  size_t result = strnlen(a1, a2);
  if (!result || result < a2 - 1 && a1[result - 1] != 47) {
    *(_WORD *)&a1[result] = 47;
  }
  return result;
}

uint64_t container_retry_test(uint64_t a1, char a2)
{
  return container_test_set_locks_and_restart(a1, a2, 0LL);
}

uint64_t container_test_set_locks_and_restart(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 1LL;
  uint64_t v6 = _os_activity_create(&dword_18028C000, "container_retry_test", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_test_set_locks_and_restart_block_invoke;
  v9[3] = &unk_189639980;
  v9[5] = a1;
  v9[6] = a3;
  char v10 = a2;
  v9[4] = &v11;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error( (uint64_t)"container_test_set_locks_and_restart",  gClientFaultLoggingEnabled,  v12[3]);
  uint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __container_test_set_locks_and_restart_block_invoke(uint64_t a1)
{
  uint64_t v7 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x19uLL);
  xpc_dictionary_set_uint64(v2, "NumRetryCrashes", *(void *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "TestLock", *(void *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56)) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  int v4 = (void *)container_xpc_send_sync_message(v3, (void *)4, v2, 1, 0, 0LL, (uint64_t)&v7);
  unsigned int v5 = v7;
  if (!v4)
  {
    if (v7) {
      uint64_t v6 = *(void *)v7;
    }
    else {
      uint64_t v6 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  }

  container_error_free(v5);
  if (v2) {
    xpc_release(v2);
  }
  if (v4) {
    xpc_release(v4);
  }
}

uint64_t container_set_test_lock(uint64_t a1, char a2)
{
  uint64_t v9 = 0LL;
  char v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 1LL;
  int v4 = _os_activity_create(&dword_18028C000, "container_set_test_lock", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_set_test_lock_block_invoke;
  block[3] = &unk_1896399A8;
  char v8 = a2;
  block[4] = &v9;
  block[5] = a1;
  os_activity_apply(v4, block);
  os_release(v4);
  container_log_error((uint64_t)"container_set_test_lock", gClientFaultLoggingEnabled, v10[3]);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_set_test_lock_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x1FuLL);
  xpc_dictionary_set_uint64(v2, "TestLock", *(void *)(a1 + 40));
  xpc_dictionary_set_BOOL(v2, "Enable", *(_BYTE *)(a1 + 48));
  int v3 = (void *)container_xpc_send_sync_message(2, (void *)4, v2, 1, 0, 0LL, (uint64_t)&v6);
  int v4 = v6;
  if (!v3)
  {
    if (v6) {
      uint64_t v5 = *(void *)v6;
    }
    else {
      uint64_t v5 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  }

  container_error_free(v4);
  if (v2) {
    xpc_release(v2);
  }
  if (v3) {
    xpc_release(v3);
  }
}

BOOL container_codesign_get_self_audit_token(task_info_t task_info_out)
{
  kern_return_t v1;
  os_log_s *v2;
  uint8_t v4[12];
  mach_msg_type_number_t task_info_outCnt;
  task_info_outCnt = 8;
  int v1 = task_info(*MEMORY[0x1895FFD48], 0xFu, task_info_out, &task_info_outCnt);
  if (v1)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v2 = (os_log_s *)qword_18C438D40;
    if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v4 = 0;
      _os_log_error_impl(&dword_18028C000, v2, OS_LOG_TYPE_ERROR, "Failed to fetch our own audit token", v4, 2u);
    }
  }

  return v1 == 0;
}

char *container_codesign_copy_cs_identity()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  int v0 = csops_audittoken();
  uint64_t v1 = bswap32(0);
  unsigned int __size = bswap32(0);
  unsigned int __size_4 = v1;
  if ((v0 & 0x80000000) == 0)
  {
    if (!v0) {
      return strndup(v10, v1 - 8);
    }
    return 0LL;
  }

  if (*__error() != 34) {
    return 0LL;
  }
  int v3 = (char *)calloc(1uLL, __size_4);
  __s = v3;
  int v4 = csops_audittoken();
  uint64_t v5 = bswap32(*((_DWORD *)v3 + 1));
  *(_DWORD *)int v3 = bswap32(*(_DWORD *)v3);
  *((_DWORD *)v3 + 1) = v5;
  if (v4) {
    xpc_object_t v2 = 0LL;
  }
  else {
    xpc_object_t v2 = strndup(v3 + 8, v5 - 8);
  }
  free(v3);
  memset_s(&__s, 8uLL, 0, 8uLL);
  return v2;
}

char *container_codesign_copy_cs_team_identifier()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  int v0 = csops_audittoken();
  uint64_t v1 = bswap32(0);
  unsigned int __size = bswap32(0);
  unsigned int __size_4 = v1;
  if ((v0 & 0x80000000) == 0)
  {
    if (!v0) {
      return strndup(v10, v1 - 8);
    }
    return 0LL;
  }

  if (*__error() != 34) {
    return 0LL;
  }
  int v3 = (char *)calloc(1uLL, __size_4);
  __s = v3;
  int v4 = csops_audittoken();
  uint64_t v5 = bswap32(*((_DWORD *)v3 + 1));
  *(_DWORD *)int v3 = bswap32(*(_DWORD *)v3);
  *((_DWORD *)v3 + 1) = v5;
  if (v4) {
    xpc_object_t v2 = 0LL;
  }
  else {
    xpc_object_t v2 = strndup(v3 + 8, v5 - 8);
  }
  free(v3);
  memset_s(&__s, 8uLL, 0, 8uLL);
  return v2;
}

void *container_codesign_copy_cdhash(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = calloc(0x14uLL, 1uLL);
  __s = v4;
  if (csops_audittoken())
  {
    if (v4)
    {
      free(v4);
      memset_s(&__s, 8uLL, 0, 8uLL);
      return 0LL;
    }
  }

  else if (a3)
  {
    *a3 = 20LL;
  }

  return v4;
}

char *container_codesign_copy_current_identifier()
{
  *(_OWORD *)task_info_out = 0u;
  __int128 v2 = 0u;
  if (!container_codesign_get_self_audit_token(task_info_out)) {
    return 0LL;
  }
  getpid();
  return container_codesign_copy_cs_identity();
}

unint64_t container_codesign_get_status()
{
  if ((csops_audittoken() & 0x80000000) != 0) {
    return 0x8000000000000000LL;
  }
  uint64_t v0 = 0LL;
  os_variant_has_internal_content();
  return v0;
}

void *container_client_initializer( uint64_t a1, const char *a2, const char *a3, int a4, const char *a5, int a6, int a7, _OWORD *a8, int a9, char a10, char a11, char a12, xpc_object_t object, uint64_t *a14)
{
  if (!a2)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v25 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v36 = 0;
    unsigned __int8 v26 = "Missing a codesign identifier when trying to initialize a client object.";
    BOOL v27 = (uint8_t *)&v36;
    goto LABEL_30;
  }

  if (!a4)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v25 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    unsigned __int8 v26 = "Missing platform when trying to initialize a client object.";
    BOOL v27 = buf;
LABEL_30:
    _os_log_error_impl(&dword_18028C000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
LABEL_13:
    uint64_t v28 = 80LL;
    goto LABEL_14;
  }

  v22 = calloc(1uLL, 0x60uLL);
  if (v22)
  {
    size_t v23 = v22;
    void *v22 = a1;
    v22[1] = strdup(a2);
    if (a3) {
      unint64_t v24 = strdup(a3);
    }
    else {
      unint64_t v24 = 0LL;
    }
    char v30 = a12;
    v23[2] = v24;
    *((_DWORD *)v23 + 6) = a4;
    if (a5)
    {
      uint64_t v31 = strdup(a5);
      char v30 = a12;
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    v23[4] = v31;
    *((_DWORD *)v23 + 10) = a6;
    *((_DWORD *)v23 + 11) = a7;
    __int128 v32 = a8[1];
    *((_OWORD *)v23 + 3) = *a8;
    *((_OWORD *)v23 + 4) = v32;
    *((_DWORD *)v23 + 20) = a9;
    *((_BYTE *)v23 + 84) = a10;
    *((_BYTE *)v23 + 85) = a11;
    *((_BYTE *)v23 + 86) = v30;
    v23[11] = 0LL;
    if ((a1 & 1) != 0 && object) {
      v23[11] = xpc_retain(object);
    }
    return v23;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  v29 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
  {
    v34[0] = 0;
    _os_log_error_impl( &dword_18028C000,  v29,  OS_LOG_TYPE_ERROR,  "Could not allocate memory to initialize a client object.",  (uint8_t *)v34,  2u);
  }

  uint64_t v28 = 73LL;
LABEL_14:
  size_t v23 = 0LL;
  if (a14) {
    *a14 = v28;
  }
  return v23;
}

xpc_object_t container_client_copy_encoded_xpc_object(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    xpc_object_t v3 = xpc_uint64_create(*(void *)a1);
    xpc_object_t object = xpc_string_create(*(const char **)(a1 + 8));
    int v4 = *(const char **)(a1 + 16);
    if (v4) {
      xpc_object_t v5 = xpc_string_create(v4);
    }
    else {
      xpc_object_t v5 = 0LL;
    }
    xpc_object_t v9 = xpc_uint64_create(*(unsigned int *)(a1 + 24));
    char v10 = *(const char **)(a1 + 32);
    if (v10) {
      xpc_object_t v11 = xpc_string_create(v10);
    }
    else {
      xpc_object_t v11 = 0LL;
    }
    xpc_object_t v12 = xpc_uint64_create(*(unsigned int *)(a1 + 40));
    xpc_object_t v13 = xpc_uint64_create(*(unsigned int *)(a1 + 44));
    xpc_object_t v14 = xpc_data_create((const void *)(a1 + 48), 0x20uLL);
    xpc_object_t v15 = xpc_int64_create(*(int *)(a1 + 80));
    unsigned int v16 = *(void **)(a1 + 88);
    if (v16) {
      xpc_object_t v17 = xpc_retain(v16);
    }
    else {
      xpc_object_t v17 = 0LL;
    }
    __int128 v24 = xmmword_1896399E8;
    __int128 v25 = *(_OWORD *)&off_1896399F8;
    __int128 v26 = xmmword_189639A08;
    *(_OWORD *)keys = xmmword_1896399C8;
    __int128 v23 = *(_OWORD *)&off_1896399D8;
    values[0] = v3;
    values[1] = object;
    values[2] = v5;
    values[3] = v9;
    values[4] = v11;
    values[5] = v12;
    values[6] = v13;
    values[7] = v14;
    values[8] = v15;
    values[9] = v17;
    xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, values, 0xAuLL);
    if (v3) {
      xpc_release(v3);
    }
    if (object) {
      xpc_release(object);
    }
    if (v5) {
      xpc_release(v5);
    }
    if (v9) {
      xpc_release(v9);
    }
    if (v11) {
      xpc_release(v11);
    }
    if (v12) {
      xpc_release(v12);
    }
    if (v13) {
      xpc_release(v13);
    }
    if (v14) {
      xpc_release(v14);
    }
    if (v15) {
      xpc_release(v15);
    }
    if (v17) {
      xpc_release(v17);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18028C000, v7, OS_LOG_TYPE_ERROR, "No client object to encode.", buf, 2u);
    }

    xpc_object_t v8 = 0LL;
    if (a2) {
      *a2 = 80LL;
    }
  }

  return v8;
}

void *container_client_copy_decoded_from_xpc_object(void *a1, uint64_t *a2)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  uint64_t v28 = 1LL;
  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "No client xpc object to decode.";
    goto LABEL_23;
  }

  uint64_t v4 = MEMORY[0x186DF9184]();
  uint64_t v5 = MEMORY[0x189600980];
  if (v4 != MEMORY[0x189600980])
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "Client xpc object is not a dictionary.";
LABEL_23:
    _os_log_error_impl(&dword_18028C000, v6, OS_LOG_TYPE_ERROR, v7, buf, 2u);
LABEL_24:
    size_t result = 0LL;
    uint64_t v19 = 80LL;
    goto LABEL_25;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(a1, "PrivateFlags");
  string = xpc_dictionary_get_string(a1, "CodesignIdentifier");
  xpc_object_t v9 = xpc_dictionary_get_string(a1, "CodesignTeamIdentifier");
  int v10 = xpc_dictionary_get_uint64(a1, "Platform");
  xpc_object_t v11 = xpc_dictionary_get_string(a1, "PersonaUniqueString");
  int v12 = xpc_dictionary_get_uint64(a1, "EUID");
  int v13 = xpc_dictionary_get_uint64(a1, "EGID");
  size_t length = 0LL;
  data = xpc_dictionary_get_data(a1, "AuditToken", &length);
  if (length != 32 || (xpc_object_t v15 = data) == 0LL)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "Client xpc object has a malformed audit token.";
    goto LABEL_23;
  }

  int int64 = xpc_dictionary_get_int64(a1, "PID");
  xpc_object_t value = xpc_dictionary_get_value(a1, "Entitlements");
  xpc_object_t object = value;
  if (value)
  {
    if (MEMORY[0x186DF9184](value) != v5)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v6 = (os_log_s *)qword_18C438D48;
      if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v7 = "Client xpc object has a malformed entitlements.";
      goto LABEL_23;
    }

    if ((uint64 & 1) == 0)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v6 = (os_log_s *)qword_18C438D48;
      if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v7 = "Client xpc object cannot set entitlements.";
      goto LABEL_23;
    }
  }

  __int128 v29 = *(_OWORD *)v15;
  int v20 = v15[5];
  int v30 = v15[4];
  uint64_t v21 = *((void *)v15 + 3);
  *(_OWORD *)buf = v29;
  *(_DWORD *)&uint8_t buf[16] = v30;
  *(_DWORD *)&buf[20] = v20;
  *(void *)&buf[24] = v21;
  unint64_t status = container_codesign_get_status();
  if ((status & 0x8000000000000000LL) != 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v23 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      int v24 = *__error();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = int64;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = string;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v24;
      _os_log_error_impl( &dword_18028C000,  v23,  OS_LOG_TYPE_ERROR,  "Could not get code sign status from audit token for pid [%d] identifier [%s]: %{darwin.errno}d",  buf,  0x18u);
    }

    size_t result = 0LL;
    uint64_t v19 = 128LL;
  }

  else
  {
    *(_OWORD *)buf = *(_OWORD *)v15;
    *(_OWORD *)&uint8_t buf[16] = *((_OWORD *)v15 + 1);
    size_t result = container_client_initializer( uint64,  string,  v9,  v10,  v11,  v12,  v13,  buf,  int64,  status & 1,  (status & 2) != 0,  (status & 4) != 0,  object,  &v28);
    uint64_t v19 = v28;
  }

LABEL_25:
  if (a2)
  {
    if (v19 != 1) {
      *a2 = v19;
    }
  }

  return result;
}

const char *container_client_get_codesign_identifier(uint64_t a1)
{
  if (a1) {
    return *(const char **)(a1 + 8);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "NULL client when fetching code sign identifier",  v3,  2u);
  }

  return "unknown";
}

uint64_t container_client_get_codesign_team_identifier(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 16);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "NULL client when fetching code sign team identifier",  v3,  2u);
  }

  return 0LL;
}

xpc_object_t container_client_copy_entitlement(char *key, uint64_t a2)
{
  if (a2)
  {
    if ((*(_BYTE *)a2 & 1) != 0 && (xpc_object_t value = *(xpc_object_t *)(a2 + 88)) != 0LL)
    {
      if (key) {
        xpc_object_t value = xpc_dictionary_get_value(value, key);
      }
      return xpc_retain(value);
    }

    else
    {
      __int128 v5 = *(_OWORD *)(a2 + 64);
      v7[0] = *(_OWORD *)(a2 + 48);
      v7[1] = v5;
      return container_audit_token_copy_entitlement((uint64_t)v7, (uint64_t)key);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "NULL client when fetching entitlements",  (uint8_t *)v7,  2u);
    }

    return 0LL;
  }

uint64_t container_client_get_platform(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 24);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching platform", v3, 2u);
  }

  return dyld_get_active_platform();
}

uint64_t container_client_get_persona_unique_string(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 32);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "NULL client when fetching persona unique string",  v3,  2u);
  }

  return 0LL;
}

uint64_t container_client_get_euid(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 40);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching euid", v3, 2u);
  }

  return geteuid();
}

uint64_t container_client_get_egid(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 44);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching egid", v3, 2u);
  }

  return getegid();
}

double container_client_get_audit_token@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (a1)
  {
    __int128 v3 = *(_OWORD *)(a1 + 48);
    __int128 v4 = *(_OWORD *)(a1 + 64);
    *a2 = v3;
    a2[1] = v4;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v5 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_18028C000, v5, OS_LOG_TYPE_FAULT, "NULL client when fetching audit token", v7, 2u);
    }

    *(void *)&__int128 v3 = 0LL;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return *(double *)&v3;
}

uint64_t container_client_get_pid(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 80);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int128 v3 = 0;
    _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching pid", v3, 2u);
  }

  return getpid();
}

BOOL container_client_is_sandboxed(uint64_t a1)
{
  if (a1)
  {
    __int128 v1 = *(_OWORD *)(a1 + 64);
    v4[0] = *(_OWORD *)(a1 + 48);
    v4[1] = v1;
    return sandbox_check_by_audit_token() != 0;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v4[0]) = 0;
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "NULL client when fetching sandbox state",  (uint8_t *)v4,  2u);
    }

    return 1LL;
  }

_BYTE *container_client_is_test_client(_BYTE *result)
{
  if (result) {
    return (_BYTE *)(*result & 1);
  }
  return result;
}

BOOL container_client_is_signed(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 84) != 0;
  }
  return result;
}

BOOL container_client_is_signature_valid(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 85) != 0;
  }
  return result;
}

BOOL container_client_is_platform_binary(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 86) != 0;
  }
  return result;
}

BOOL container_client_is_alive(uint64_t a1)
{
  return container_audit_token_copy_executable_name(&v2, 0LL) != 3;
}

void *container_client_create_from_audit_token(uint64_t a1, const char *a2, uint64_t *a3)
{
  uint64_t v31 = *MEMORY[0x1895FEE08];
  int v6 = *(_DWORD *)(a1 + 20);
  uint64_t v7 = calloc(1uLL, 0x60uLL);
  __s = v7;
  if (v7)
  {
    xpc_object_t v8 = v7;
    __int128 v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)buf = *(_OWORD *)a1;
    *(_OWORD *)&uint8_t buf[16] = v9;
    int platform = container_audit_token_get_platform((uint64_t)buf);
    v8[6] = platform;
    if (platform)
    {
      *(_OWORD *)buf = *(_OWORD *)a1;
      int v11 = *(_DWORD *)(a1 + 20);
      uint64_t v12 = *(void *)(a1 + 24);
      *(_DWORD *)&uint8_t buf[16] = *(_DWORD *)(a1 + 16);
      *(_DWORD *)&buf[20] = v11;
      *(void *)&buf[24] = v12;
      int v13 = container_codesign_copy_cs_identity();
      *((void *)v8 + 1) = v13;
      if (v13)
      {
        *(void *)xpc_object_t v8 = 0LL;
        *(_OWORD *)buf = *(_OWORD *)a1;
        int v14 = *(_DWORD *)(a1 + 20);
        uint64_t v15 = *(void *)(a1 + 24);
        *(_DWORD *)&uint8_t buf[16] = *(_DWORD *)(a1 + 16);
        *(_DWORD *)&buf[20] = v14;
        *(void *)&buf[24] = v15;
        *((void *)v8 + 2) = container_codesign_copy_cs_team_identifier();
        if (a2) {
          unsigned int v16 = strdup(a2);
        }
        else {
          unsigned int v16 = 0LL;
        }
        *((void *)v8 + 4) = v16;
        v8[10] = *(_DWORD *)(a1 + 4);
        v8[11] = *(_DWORD *)(a1 + 8);
        __int128 v21 = *(_OWORD *)(a1 + 16);
        *((_OWORD *)v8 + 3) = *(_OWORD *)a1;
        *((_OWORD *)v8 + 4) = v21;
        v8[20] = *(_DWORD *)(a1 + 20);
        *((void *)v8 + 11) = 0LL;
        *(_OWORD *)buf = *(_OWORD *)a1;
        int v22 = *(_DWORD *)(a1 + 20);
        uint64_t v23 = *(void *)(a1 + 24);
        *(_DWORD *)&uint8_t buf[16] = *(_DWORD *)(a1 + 16);
        *(_DWORD *)&buf[20] = v22;
        *(void *)&buf[24] = v23;
        unint64_t status = container_codesign_get_status();
        *((_WORD *)v8 + 42) = 0;
        *((_BYTE *)v8 + 86) = 0;
        if ((status & 0x8000000000000000LL) == 0)
        {
          if ((status & 1) != 0) {
            *((_BYTE *)v8 + 84) = 1;
          }
          if ((status & 2) != 0) {
            *((_BYTE *)v8 + 85) = 1;
          }
          uint64_t v18 = 1LL;
          if ((status & 4) != 0) {
            *((_BYTE *)v8 + 86) = 1;
          }
          goto LABEL_35;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        __int128 v25 = (os_log_s *)qword_18C438D48;
        if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = *((void *)v8 + 1);
          int v28 = *__error();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v27;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v28;
          _os_log_error_impl( &dword_18028C000,  v25,  OS_LOG_TYPE_ERROR,  "Could not get code sign status from audit token for pid [%d] identifier [%s]: %{darwin.errno}d",  buf,  0x18u);
        }

        uint64_t v18 = 128LL;
      }

      else
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        int v20 = (os_log_s *)qword_18C438D48;
        if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v6;
          _os_log_error_impl( &dword_18028C000,  v20,  OS_LOG_TYPE_ERROR,  "Could not get code sign identifier from audit token to initialize a client object for pid [%d].",  buf,  8u);
        }

        uint64_t v18 = 98LL;
      }
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v19 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v6;
        _os_log_error_impl( &dword_18028C000,  v19,  OS_LOG_TYPE_ERROR,  "Could not get platform from audit token to initialize a client object for pid [%d].",  buf,  8u);
      }

      uint64_t v18 = 80LL;
    }

    free(v8);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_35;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  xpc_object_t v17 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6;
    _os_log_error_impl( &dword_18028C000,  v17,  OS_LOG_TYPE_ERROR,  "Could not allocate memory to initialize a client object for pid [%d].",  buf,  8u);
  }

  uint64_t v18 = 73LL;
LABEL_35:
  if (a3) {
    *a3 = v18;
  }
  return __s;
}

char *container_copy_client(uint64_t a1, uint64_t *a2)
{
  if (a1)
  {
    __int128 v4 = (char *)calloc(1uLL, 0x60uLL);
    if (v4)
    {
      __int128 v5 = v4;
      int v6 = *(const char **)(a1 + 8);
      *(void *)__int128 v5 = *(void *)a1;
      *((void *)v5 + 1) = strdup(v6);
      uint64_t v7 = *(char **)(a1 + 16);
      if (v7) {
        uint64_t v7 = strdup(v7);
      }
      *((void *)v5 + 2) = v7;
      *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 24);
      xpc_object_t v8 = *(char **)(a1 + 32);
      if (v8) {
        xpc_object_t v8 = strdup(v8);
      }
      *((void *)v5 + 4) = v8;
      *((void *)v5 + 5) = *(void *)(a1 + 40);
      __int128 v9 = *(_OWORD *)(a1 + 64);
      *((_OWORD *)v5 + 3) = *(_OWORD *)(a1 + 48);
      *((_OWORD *)v5 + 4) = v9;
      *((_DWORD *)v5 + 20) = *(_DWORD *)(a1 + 80);
      v5[84] = *(_BYTE *)(a1 + 84);
      *(_WORD *)(v5 + 85) = *(_WORD *)(a1 + 85);
      xpc_object_t v10 = *(xpc_object_t *)(a1 + 88);
      if (v10) {
        xpc_object_t v10 = xpc_retain(v10);
      }
      *((void *)v5 + 11) = v10;
      return v5;
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v13 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl( &dword_18028C000,  v13,  OS_LOG_TYPE_ERROR,  "Could not allocate memory to initialize a client object.",  (uint8_t *)v15,  2u);
    }

    uint64_t v12 = 73LL;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v11 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18028C000, v11, OS_LOG_TYPE_ERROR, "NULL client when copying", buf, 2u);
    }

    uint64_t v12 = 80LL;
  }

  __int128 v5 = 0LL;
  if (a2) {
    *a2 = v12;
  }
  return v5;
}

void *container_free_client(void *result)
{
  uint64_t __s = (uint64_t)result;
  if (result)
  {
    __int128 v1 = result;
    __int128 v3 = result + 1;
    audit_token_t v2 = (void *)result[1];
    if (v2)
    {
      free(v2);
      memset_s(v3, 8uLL, 0, 8uLL);
    }

    __int128 v4 = (void *)v1[2];
    if (v4)
    {
      free(v4);
      memset_s(v1 + 2, 8uLL, 0, 8uLL);
    }

    __int128 v5 = (void *)v1[11];
    if (v5) {
      xpc_release(v5);
    }
    int v6 = (void *)v1[4];
    v1[11] = 0LL;
    if (v6)
    {
      free(v6);
      memset_s(v1 + 4, 8uLL, 0, 8uLL);
    }

    free(v1);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

void *container_paths_context_create()
{
  uint64_t v0 = calloc(1uLL, 0x30uLL);
  v0[5] = _os_activity_create( &dword_18028C000,  "container_paths_context_t",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t __s = 0LL;
  int64_t v1 = sysconf(71);
  if (v1 < 1)
  {
    pw_unsigned int uid = 0;
    int v4 = *__error();
    goto LABEL_9;
  }

  size_t v2 = v1;
  __int128 v3 = (char *)calloc(v1, 1uLL);
  uint64_t __s = v3;
  memset(&v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  if (getpwnam_r("mobile", &v8, v3, v2, &v7) || !v7)
  {
    pw_unsigned int uid = 0;
    int v4 = *__error();
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  int v4 = 0;
  pw_unsigned int uid = v8.pw_uid;
  if (v3)
  {
LABEL_8:
    free(v3);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

LABEL_9:
  if (v4 >= 1) {
    *__error() = v4;
  }
  *((_DWORD *)v0 + 8) = pw_uid;
  *uint64_t v0 = 2LL;
  v0[2] = 0LL;
  v0[3] = strdup("com.apple.containermanager.current-persona");
  *((_BYTE *)v0 + 8) = 0;
  return v0;
}

  container_error_free((void *)a1[5]);
  int v6 = (void *)a1[7];
  __int128 v5 = a1 + 7;
  size_t result = v6;
  if (v6)
  {
    free(result);
    return (void *)memset_s(v5, 8uLL, 0, 8uLL);
  }

  return result;
}

void container_paths_context_set_class(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    size_t v2 = *(os_activity_s **)(a1 + 40);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    _OWORD v4[2] = __container_paths_context_set_class_block_invoke;
    v4[3] = &__block_descriptor_tmp_184;
    v4[4] = a1;
    v4[5] = a2;
    os_activity_apply(v2, v4);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v6 = "container_paths_context_set_class";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }
  }

uint64_t __container_paths_context_set_class_block_invoke(uint64_t result)
{
  **(void **)(result + 32) = *(void *)(result + 40);
  return result;
}

void container_paths_context_set_transient(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    size_t v2 = *(os_activity_s **)(a1 + 40);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    _OWORD v4[2] = __container_paths_context_set_transient_block_invoke;
    v4[3] = &__block_descriptor_tmp_1;
    v4[4] = a1;
    char v5 = a2;
    os_activity_apply(v2, v4);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "container_paths_context_set_transient";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }
  }

uint64_t __container_paths_context_set_transient_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

void container_paths_context_set_flags(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    size_t v2 = *(os_activity_s **)(a1 + 40);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    _OWORD v4[2] = __container_paths_context_set_flags_block_invoke;
    v4[3] = &__block_descriptor_tmp_2;
    v4[4] = a1;
    void v4[5] = a2;
    os_activity_apply(v2, v4);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v6 = "container_paths_context_set_flags";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }
  }

uint64_t __container_paths_context_set_flags_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  return result;
}

void container_paths_context_set_persona_unique_string(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    size_t v2 = *(os_activity_s **)(a1 + 40);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    _OWORD v4[2] = __container_paths_context_set_persona_unique_string_block_invoke;
    v4[3] = &__block_descriptor_tmp_3;
    v4[4] = a1;
    void v4[5] = a2;
    os_activity_apply(v2, v4);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v6 = "container_paths_context_set_persona_unique_string";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }
  }

char *__container_paths_context_set_persona_unique_string_block_invoke(uint64_t a1)
{
  size_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (v2)
  {
    free(v2);
    memset_s((void *)(*(void *)(a1 + 32) + 24LL), 8uLL, 0, 8uLL);
  }

  size_t result = *(char **)(a1 + 40);
  if (result) {
    size_t result = strndup(result, 0x400uLL);
  }
  *(void *)(*(void *)(a1 + 32) + 24LL) = result;
  return result;
}

void container_paths_context_set_uid(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    size_t v2 = *(os_activity_s **)(a1 + 40);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    _OWORD v4[2] = __container_paths_context_set_uid_block_invoke;
    v4[3] = &__block_descriptor_tmp_4;
    v4[4] = a1;
    int v5 = a2;
    os_activity_apply(v2, v4);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v3 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "container_paths_context_set_uid";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }
  }

uint64_t __container_paths_context_set_uid_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32LL) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t container_paths_context_free(uint64_t result)
{
  uint64_t __s = result;
  if (result)
  {
    uint64_t v1 = result;
    os_release(*(void **)(result + 40));
    size_t v2 = *(void **)(v1 + 24);
    if (v2)
    {
      free(v2);
      memset_s((void *)(v1 + 24), 8uLL, 0, 8uLL);
    }

    free((void *)v1);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

unsigned __int8 *container_paths_copy_container_from_path(char *a1, char **a2, void **a3)
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  int v24 = 0LL;
  bzero(__s1, 0x401uLL);
  uint64_t v23 = 0LL;
  if (!a1)
  {
    uint64_t v7 = 3LL;
    uint64_t v8 = 38LL;
    __int128 v9 = 0LL;
    int v6 = 0;
    goto LABEL_5;
  }

  if (container_realpathat(4294967294LL, (uint64_t)a1, __s1, 0x400uLL))
  {
    int v6 = *__error();
    uint64_t v7 = 1LL;
    uint64_t v8 = 127LL;
    __int128 v9 = a1;
LABEL_5:
    xpc_object_t v10 = (int *)container_error_create(v7, v8, v9, v6);
    int v11 = 0LL;
    uint64_t v12 = 0LL;
    int v13 = 0LL;
    int v24 = v10;
    int v14 = -1;
    goto LABEL_6;
  }

  int v11 = strndup(__s1, 0x400uLL);
  uint64_t v23 = v11;
  uint64_t v12 = &v11[strnlen(v11, 0x400uLL)];
  while (1)
  {
    int v14 = open(v11, 0x1000000, v23);
    unsigned int v16 = __error();
    if (v14 < 0)
    {
      int v18 = *v16;
    }

    else
    {
      xpc_object_t v17 = container_paths_copy_container_at(v14, 0, 0, &v24);
      if (v17)
      {
        int v13 = v17;
        container_object_get_class((uint64_t)v17);
        xpc_object_t v10 = (int *)v24;
        goto LABEL_6;
      }

      if (v24) {
        int v18 = *((_DWORD *)v24 + 6);
      }
      else {
        int v18 = 14;
      }
      container_error_free(v24);
      int v24 = 0LL;
    }

    if (v18 != 2 && v18 != 20)
    {
      uint64_t v21 = 1LL;
      uint64_t v22 = 127LL;
      goto LABEL_37;
    }

    int v20 = rindex(v11, 47);
    if (!v20) {
      break;
    }
    char *v20 = 0;
    uint64_t v12 = &__s1[v20 - v11 + 1];
    if ((v14 & 0x80000000) == 0) {
      close(v14);
    }
  }

  uint64_t v21 = 3LL;
  uint64_t v22 = 21LL;
LABEL_37:
  xpc_object_t v10 = (int *)container_error_create(v21, v22, a1, v18);
  int v13 = 0LL;
  int v24 = v10;
LABEL_6:
  if (a3 && v10)
  {
    *a3 = container_error_create(*((void *)v10 + 1), *(void *)v10, *((char **)v10 + 2), v10[6]);
    xpc_object_t v10 = (int *)v24;
  }

  container_log_ext_error( (uint64_t)"container_paths_copy_container_from_path",  gClientFaultLoggingEnabled,  (uint64_t *)v10);
  if ((v14 & 0x80000000) == 0) {
    close(v14);
  }
  if (v13 && a2 && v12) {
    *a2 = strndup(v12, 0x400uLL);
  }
  if (v11)
  {
    free(v11);
    memset_s(&v23, 8uLL, 0, 8uLL);
  }

  container_error_free(v24);
  return v13;
}

unsigned __int8 *container_paths_copy_container_at(int a1, int a2, unsigned __int8 a3, void **a4)
{
  uint64_t v47 = *MEMORY[0x1895FEE08];
  v43 = 0LL;
  uint64_t __s = 0LL;
  memset(uu, 0, sizeof(uu));
  plist_at = (void *)container_fs_load_plist_at(a1, ".com.apple.mobile_container_manager.metadata.plist");
  int v9 = *__error();
  if (plist_at)
  {
    uint64_t v10 = MEMORY[0x186DF9184](plist_at);
    uint64_t v11 = MEMORY[0x189600980];
    if (v10 == MEMORY[0x189600980])
    {
      string = xpc_dictionary_get_string(plist_at, "MCMMetadataUUID");
      if (!string)
      {
        uint64_t v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
        uint64_t __s = v12;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v24 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        buf.st_dev = 136380675;
        *(void *)&buf.st_mode = v12;
        uint64_t v21 = "Metadata plist [%{private}s] is missing a UUID.";
        uint64_t v22 = (os_log_s *)v24;
        uint32_t v23 = 12;
        goto LABEL_45;
      }

      __darwin_ino64_t v19 = (__darwin_ino64_t)string;
      if (uuid_parse(string, uu))
      {
        uint64_t v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
        uint64_t __s = v12;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v20 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        buf.st_dev = 136380931;
        *(void *)&buf.st_mode = v12;
        WORD2(buf.st_ino) = 2082;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v19;
        uint64_t v21 = "Metadata plist [%{private}s] is has a corrupt UUID [%{public}s].";
        uint64_t v22 = (os_log_s *)v20;
        uint32_t v23 = 22;
LABEL_45:
        _os_log_error_impl(&dword_18028C000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&buf, v23);
LABEL_26:
        int v14 = container_error_create(1LL, 108LL, v12, 0);
        uint64_t v15 = 0LL;
        goto LABEL_27;
      }

      int64_t int64 = xpc_dictionary_get_int64(plist_at, "MCMMetadataContentClass");
      uint64_t v26 = xpc_dictionary_get_string(plist_at, "MCMMetadataIdentifier");
      if (!v26)
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        unsigned __int8 v34 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          buf.st_dev = 136380675;
          *(void *)&buf.st_mode = 0LL;
          _os_log_error_impl( &dword_18028C000,  v34,  OS_LOG_TYPE_ERROR,  "Metadata plist [%{private}s] is missing an identifier.",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v12 = 0LL;
        goto LABEL_26;
      }

      uint64_t v27 = v26;
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(plist_at, "MCMMetadataUserIdentity");
      uint64_t v41 = int64;
      if (dictionary && (__int128 v29 = dictionary, MEMORY[0x186DF9184]() == v11))
      {
        uint64_t v32 = xpc_dictionary_get_string(v29, "personaUniqueString");
        st_unsigned int uid = xpc_dictionary_get_int64(v29, "posixUID");
      }

      else
      {
        xpc_object_t value = xpc_dictionary_get_value(plist_at, "MCMMetadataPersona");
        if (value)
        {
          int v31 = xpc_uint64_get_value(value);
          uint64_t v32 = 0LL;
          if (v31 == 499) {
            st_unsigned int uid = 0;
          }
          else {
            st_unsigned int uid = v31;
          }
        }

        else if ((int64 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          st_unsigned int uid = 0;
          uint64_t v32 = 0LL;
        }

        else
        {
          memset(&buf, 0, sizeof(buf));
          uint64_t v32 = 0LL;
          if (fstat(a1, &buf)) {
            st_unsigned int uid = 0;
          }
          else {
            st_unsigned int uid = buf.st_uid;
          }
        }
      }

      int v35 = (const char *)container_fs_path_at(a1, 0LL);
      uint64_t v12 = (char *)v35;
      uint64_t __s = (void *)v35;
      if (v35)
      {
        __int16 v36 = rindex(v35, 47);
        unsigned int v37 = strndup(v36 + 1, 0x400uLL);
        v43 = v37;
        if (a2)
        {
LABEL_51:
          xpc_object_t v38 = xpc_dictionary_get_dictionary(plist_at, "MCMMetadataInfo");
          if (!v38)
          {
            xpc_object_t v39 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_object_t v40 = v39;
LABEL_56:
            uint64_t v42 = 1LL;
            uint64_t v15 = container_object_create(uu, v27, v41, st_uid, v12, v37, v32, v39, 0LL, 0, a3, 0LL, 0LL, &v42);
            xpc_release(plist_at);
            int v14 = 0LL;
            unsigned int v16 = 0LL;
            plist_at = v40;
            if (!v40) {
              goto LABEL_8;
            }
LABEL_27:
            xpc_release(plist_at);
            unsigned int v16 = v14;
            if (!v12) {
              goto LABEL_10;
            }
            goto LABEL_9;
          }

          xpc_object_t v39 = v38;
LABEL_55:
          xpc_object_t v40 = 0LL;
          goto LABEL_56;
        }
      }

      else
      {
        unsigned int v37 = 0LL;
        if (a2) {
          goto LABEL_51;
        }
      }

      xpc_object_t v39 = 0LL;
      goto LABEL_55;
    }
  }

  uint64_t v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
  uint64_t __s = v12;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  int v13 = (os_log_s *)container_log_handle_for_category_logHandles;
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
  {
    buf.st_dev = 136380931;
    *(void *)&buf.st_mode = v12;
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = v9;
    _os_log_error_impl( &dword_18028C000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to read metadata plist [%{private}s]: %{darwin.errno}d",  (uint8_t *)&buf,  0x12u);
  }

  int v14 = container_error_create(1LL, 12LL, v12, v9);
  uint64_t v15 = 0LL;
  unsigned int v16 = v14;
  if (plist_at) {
    goto LABEL_27;
  }
LABEL_8:
  if (v12)
  {
LABEL_9:
    free(v12);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

LABEL_10:
  if (!v15 && a4 && v16) {
    *a4 = container_error_create(v16[1], *v16, (char *)v16[2], *((_DWORD *)v16 + 6));
  }
  if (v43)
  {
    free(v43);
    memset_s(&v43, 8uLL, 0, 8uLL);
  }

  container_error_free(v16);
  return v15;
}

  int v13 = (int *)v26;
LABEL_30:
  *(void *)(v4 + 24) = v27;
  if (v13)
  {
    *(void *)(v5 + 24) = container_error_create(*((void *)v13 + 1), *(void *)v13, *((char **)v13 + 2), v13[6]);
    int v13 = (int *)v26;
  }

  container_error_free(v13);
  if (v7) {
    xpc_release(v7);
  }
  if (v6) {
    xpc_release(v6);
  }
  if (v12) {
    xpc_release(v12);
  }
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v11;
}

  if ((v15 & 0x8000) != 0)
  {
    __int128 v25 = *(_DWORD *)v16;
    unsigned int v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 10) = v25;
    if ((v15 & 0x10000) == 0)
    {
LABEL_12:
      if ((v15 & 0x20000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_32;
    }
  }

  else if ((v15 & 0x10000) == 0)
  {
    goto LABEL_12;
  }

  uint64_t v26 = *(_DWORD *)v16;
  unsigned int v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 11) = v26;
  if ((v15 & 0x20000) == 0)
  {
LABEL_13:
    if ((v15 & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }

BOOL container_paths_enumerate_containers_at(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  uint64_t v18 = 0LL;
  __darwin_ino64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2000000000LL;
  v17[3] = a2;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  if (a3)
  {
    int v4 = *(os_activity_s **)(a3 + 40);
    v11[0] = MEMORY[0x1895FED80];
    v11[1] = 0x40000000LL;
    v11[2] = __container_paths_enumerate_containers_at_block_invoke;
    v11[3] = &unk_189639B78;
    v11[4] = a4;
    v11[5] = &v13;
    v11[7] = &v18;
    v11[8] = a3;
    int v12 = a1;
    v11[6] = v17;
    os_activity_apply(v4, v11);
    if (*((_BYTE *)v19 + 24))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v5 = (os_log_s *)container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136446210;
        uint32_t v23 = "container_paths_enumerate_containers_at";
        _os_log_impl(&dword_18028C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: success", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v8 = (uint64_t *)v14[3];
      if (v8)
      {
        container_log_ext_error( (uint64_t)"container_paths_enumerate_containers_at",  gClientFaultLoggingEnabled,  v8);
      }

      else
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        int v9 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136446210;
          uint32_t v23 = "container_paths_enumerate_containers_at";
          _os_log_error_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s: failed (errors during enumeration)",  buf,  0xCu);
        }
      }
    }

    container_error_free((void *)v14[3]);
    BOOL v7 = *((_BYTE *)v19 + 24) != 0;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v6 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint32_t v23 = "container_paths_enumerate_containers_at";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: context parameter is NULL",  buf,  0xCu);
    }

    BOOL v7 = 0LL;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  return v7;
}

void __container_paths_enumerate_containers_at_block_invoke(uint64_t a1)
{
  uint64_t v122 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = xpc_array_create(0LL, 0LL);
  unint64_t v77 = 0LL;
  uint64_t __s = 0LL;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x2000000000LL;
  atomic_store(0LL, &v77);
  if (!*(void *)(a1 + 32))
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v13 = (os_log_s *)qword_18C438D58;
    if (!os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)stat buf = 136315138;
    *(void *)&uint8_t buf[4] = "container_paths_enumerate_containers_at_block_invoke";
    int v14 = "%s: SPI MISUSE: enumerator cannot be NULL";
    goto LABEL_53;
  }

  uint64_t v3 = *(void *)(a1 + 64);
  if (!v3)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v13 = (os_log_s *)qword_18C438D58;
    if (!os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)stat buf = 136315138;
    *(void *)&uint8_t buf[4] = "container_paths_enumerate_containers_at_block_invoke";
    int v14 = "%s: SPI MISUSE: context cannot be NULL";
LABEL_53:
    _os_log_fault_impl(&dword_18028C000, v13, OS_LOG_TYPE_FAULT, v14, buf, 0xCu);
LABEL_30:
    uint64_t v16 = 38LL;
LABEL_31:
    os_signpost_id_t v17 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = container_error_create(3LL, v16, 0LL, 0);
    int v18 = -1;
    goto LABEL_32;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    int v4 = MEMORY[0x1895FE8A8];
  }
  else {
    int v4 = _container_paths_passthru_dispatch_async;
  }
  if ((unint64_t)(*(void *)v3 - 1LL) > 0xD
    || (*(_BYTE *)(v3 + 8)
      ? (int v5 = &_container_paths_get_volume_relative_path__transient_relative_paths)
      : (int v5 = &_container_paths_get_volume_relative_path__relative_paths),
        (int v6 = (const char *)v5[*(void *)v3]) == 0LL))
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v15 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&uint8_t buf[4] = "container_paths_enumerate_containers_at_block_invoke";
      _os_log_fault_impl(&dword_18028C000, v15, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: Unknown container class", buf, 0xCu);
    }

    uint64_t v16 = 20LL;
    goto LABEL_31;
  }

  uint64_t v70 = v4;
  char v7 = *(_BYTE *)(v3 + 16);
  uint64_t v8 = container_fs_path_at(*(_DWORD *)(a1 + 72), (uint64_t)v6);
  uint64_t __s = v8;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_DEFAULT))
  {
    char v69 = v7;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v119 = 0u;
    int current_persona_originator_info = voucher_get_current_persona_originator_info();
    int v64 = DWORD1(v120);
    int v66 = DWORD2(v119);
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v116 = 0u;
    int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    int v61 = DWORD2(v116);
    int v62 = current_persona_proximate_info;
    int v60 = DWORD1(v117);
    uint64_t v115 = 0LL;
    memset(v114, 0, sizeof(v114));
    __int128 v113 = 0u;
    __int128 v112 = 0u;
    __int128 v111 = 0u;
    __int128 v110 = 0u;
    *(_OWORD *)&uint8_t buf[4] = 0u;
    *(_DWORD *)stat buf = 2;
    int current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      int v12 = "NOPERSONA";
      uint32_t v23 = "<unknown>";
    }

    else
    {
      else {
        int v12 = (&off_18963AFA8)[*(_DWORD *)&buf[8] - 2];
      }
      uint32_t v23 = &v114[4];
    }

    uint64_t v68 = v8;
    v59 = v23;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v24 = (os_log_s *)qword_18C438D58;
    if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = v64 & ~(current_persona_originator_info >> 31);
      int v58 = v66 & ~(current_persona_originator_info >> 31);
      int v26 = v60 & ~(v62 >> 31);
      int v65 = v25;
      int v67 = v61 & ~(v62 >> 31);
      uid_t v63 = geteuid();
      uid_t v27 = getuid();
      int v28 = *(uint64_t **)(a1 + 64);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[2];
      uint64_t v31 = v28[3];
      int v32 = *((_DWORD *)v28 + 8);
      LODWORD(v28) = *((unsigned __int8 *)v28 + 8);
      *(_DWORD *)uint64_t v79 = 67112706;
      int v80 = current_persona;
      __int16 v81 = 2082;
      v82 = v12;
      __int16 v83 = 2082;
      v84 = v59;
      __int16 v85 = 1024;
      int v86 = v58;
      __int16 v87 = 1024;
      int v88 = v65;
      __int16 v89 = 1024;
      int v90 = v67;
      __int16 v91 = 1024;
      int v92 = v26;
      __int16 v93 = 1024;
      uid_t v94 = v63;
      __int16 v95 = 1024;
      uid_t v96 = v27;
      __int16 v97 = 2080;
      v98 = v68;
      __int16 v99 = 2048;
      uint64_t v100 = v29;
      __int16 v101 = 2048;
      uint64_t v102 = v30;
      __int16 v103 = 2082;
      uint64_t v104 = v31;
      __int16 v105 = 1024;
      int v106 = v32;
      __int16 v107 = 1024;
      int v108 = (int)v28;
      _os_log_impl( &dword_18028C000,  v24,  OS_LOG_TYPE_DEFAULT,  "Enumerate; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proximate [p"
        "id = %d, personaid = %d], eunsigned int uid = %d, unsigned int uid = %d, context<path = [%s], class = %llu, flags = 0x%llx, persona = [%{p"
        "ublic}s], unsigned int uid = %d, transient = %d>",
        v79,
        0x74u);
    }

    char v7 = v69;
  }

  int v33 = openat(*(_DWORD *)(a1 + 72), v6, 0x1000000);
  int v18 = v33;
  if (v33 < 0)
  {
    int v45 = *__error();
    if (v45 == 2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      v46 = (os_log_s *)qword_18C438D58;
      if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        *(void *)&uint8_t buf[4] = __s;
        _os_log_impl( &dword_18028C000,  v46,  OS_LOG_TYPE_DEFAULT,  "[%s] does not exist, assuming no containers.",  buf,  0xCu);
      }

      os_signpost_id_t v17 = 0LL;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    else
    {
      os_signpost_id_t v17 = 0LL;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = container_error_create(1LL, 127LL, (char *)__s, v45);
    }
  }

  else
  {
    uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v35 = dup(v33);
    if (v35 < 0)
    {
      int v52 = *__error();
      int v53 = (char *)container_fs_path_at(v18, 0LL);
      *(void *)stat buf = v53;
      uint64_t v54 = v53;
      int v55 = v52;
    }

    else
    {
      int v36 = v35;
      unsigned int v37 = fdopendir(v35);
      if (v37)
      {
        xpc_object_t v38 = v37;
        char v39 = v7 & 1;
        while (1)
        {
          xpc_object_t v40 = readdir(v38);
          if (!v40) {
            break;
          }
          uint64_t v41 = v40;
          if (container_fs_resolve_dirent_type_at(v18, (uint64_t)v40) == 4)
          {
            int v43 = v41->d_name[0];
            d_name = v41->d_name;
            if (v43 != 46)
            {
              xpc_object_t v44 = xpc_string_create(d_name);
              xpc_array_append_value(v2, v44);
              if (v44) {
                xpc_release(v44);
              }
            }
          }
        }

        closedir(v38);
        size_t count = xpc_array_get_count(v2);
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        os_signpost_id_t v17 = os_signpost_id_make_with_pointer((os_log_t)qword_18C438D58, *(const void **)(a1 + 64));
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          size_t v48 = (os_log_s *)qword_18C438D58;
          if (os_signpost_enabled((os_log_t)qword_18C438D58))
          {
            uint64_t v49 = **(void **)(a1 + 64);
            *(_DWORD *)stat buf = 134349056;
            *(void *)&uint8_t buf[4] = v49;
            _os_signpost_emit_with_name_impl( &dword_18028C000,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "Enumerate",  " class=%{public, signpost.description:attribute}llu ",  buf,  0xCu);
          }
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
        block[0] = MEMORY[0x1895FED80];
        block[1] = 0x40000000LL;
        block[2] = __container_paths_enumerate_containers_at_block_invoke_23;
        block[3] = &unk_189639B10;
        int v72 = v18;
        char v73 = v39;
        uint64_t v50 = *(void *)(a1 + 64);
        block[8] = __s;
        block[9] = v50;
        block[10] = v70;
        uint64_t v51 = *(void *)(a1 + 48);
        block[4] = *(void *)(a1 + 32);
        block[5] = v51;
        void block[6] = &v74;
        block[7] = v2;
        dispatch_apply(count, 0LL, block);
        goto LABEL_32;
      }

      int v56 = *__error();
      int v53 = (char *)container_fs_path_at(v36, 0LL);
      *(void *)stat buf = v53;
      uint64_t v54 = v53;
      int v55 = v56;
    }

    v57 = container_error_create(1LL, 127LL, v54, v55);
    if (v53)
    {
      free(v53);
      memset_s(buf, 8uLL, 0, 8uLL);
    }

    os_signpost_id_t v17 = 0LL;
    *(void *)(v34 + 24) = v57;
  }

LABEL_32:
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  __darwin_ino64_t v19 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v19) {
    dispatch_barrier_async_and_wait(v19, &__block_literal_global);
  }
  if (v17)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    if (v17 != -1LL)
    {
      uint64_t v20 = (os_log_s *)qword_18C438D58;
      if (os_signpost_enabled((os_log_t)qword_18C438D58))
      {
        uint64_t v21 = **(void **)(a1 + 64);
        *(_DWORD *)stat buf = 134349056;
        *(void *)&uint8_t buf[4] = v21;
        _os_signpost_emit_with_name_impl( &dword_18028C000,  v20,  OS_SIGNPOST_INTERVAL_END,  v17,  "Enumerate",  " class=%{public, signpost.description:attribute}llu ",  buf,  0xCu);
      }
    }
  }

  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  if (v2) {
    xpc_release(v2);
  }
  if ((v18 & 0x80000000) == 0) {
    close(v18);
  }
  _Block_object_dispose(&v74, 8);
}

  if (v21) {
    goto LABEL_33;
  }
LABEL_47:
  if (v8) {
    goto LABEL_48;
  }
LABEL_49:
  (*(void (**)(uint64_t, xpc_object_t, uint64_t, void))(v6 + 16))(v6, xdict, a3, 0LL);
LABEL_50:
  if (v9) {
    xpc_release(xdict);
  }
}

  uid_t v27 = *(_DWORD *)v16;
  uint64_t v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 12) = v27;
  if ((v15 & 0x40000) == 0)
  {
LABEL_14:
    if ((v15 & 0x400000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }

uint64_t _container_paths_passthru_dispatch_async(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t __container_paths_enumerate_containers_at_block_invoke_23(uint64_t a1, size_t a2)
{
  uint64_t v21 = 0LL;
  string = xpc_array_get_string(*(xpc_object_t *)(a1 + 56), a2);
  int v4 = openat(*(_DWORD *)(a1 + 88), string, 0x1000000);
  if ((v4 & 0x80000000) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEBUG)
      && !os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      int v5 = 0LL;
      goto LABEL_11;
    }
  }

  int v5 = (char *)calloc(0x401uLL, 1uLL);
  __strlcpy_chk();
  container_fs_add_path_component(v5, (uint64_t)string, 0x400uLL);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_11:
    int v14 = container_paths_copy_container_at( v4,  *(unsigned __int8 *)(a1 + 92),  *(_BYTE *)(*(void *)(a1 + 72) + 8LL),  &v21);
    close(v4);
    uint64_t v15 = *(uint64_t (**)(uint64_t, void *))(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    v20[0] = MEMORY[0x1895FED80];
    v20[1] = 0x40000000LL;
    v20[2] = __container_paths_enumerate_containers_at_block_invoke_2;
    v20[3] = &unk_189639AC0;
    v20[6] = v14;
    v20[7] = v21;
    v20[8] = v5;
    uint64_t v18 = *(void *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v18;
    return v15(v17, v20);
  }

  int v6 = __error();
  char v7 = container_error_create(1LL, 127LL, v5, *v6);
  uint64_t v8 = (unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  do
    unint64_t v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v19[0] = MEMORY[0x1895FED80];
  v19[1] = 0x40000000LL;
  v19[2] = __container_paths_enumerate_containers_at_block_invoke_25;
  v19[3] = &unk_189639AE8;
  v19[4] = v11;
  v19[5] = v7;
  v19[6] = v9;
  v19[7] = v5;
  return v10(v12, v19);
}

void *__container_paths_enumerate_containers_at_block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  int v2 = (*(uint64_t (**)(void))(a1[4] + 16LL))();
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[8];
    BOOL v12 = a1[6] != 0LL;
    *(_DWORD *)stat buf = 136446978;
    uint64_t v16 = "container_paths_enumerate_containers_at";
    __int16 v17 = 2080;
    uint64_t v18 = v11;
    __int16 v19 = 1024;
    *(_DWORD *)uint64_t v20 = v2;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v12;
    _os_log_debug_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_DEBUG,  "%{public}s: enumeration of path [%s]: success = %d, found container = %d",  buf,  0x22u);
    if (!v2) {
      goto LABEL_6;
    }
  }

  else if (!v2)
  {
    goto LABEL_6;
  }

  if (a1[6]) {
    goto LABEL_16;
  }
LABEL_6:
  int v4 = (unint64_t *)(*(void *)(a1[5] + 8LL) + 24LL);
  do
    unint64_t v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
  {
    int v6 = container_error_copy_unlocalized_description(a1[7]);
    uint64_t __s = v6;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    char v7 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      if (!v6) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    uint64_t v13 = a1[8];
    *(_DWORD *)stat buf = 136446978;
    uint64_t v16 = "container_paths_enumerate_containers_at";
    __int16 v17 = 2080;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    *(void *)uint64_t v20 = v5 + 1;
    *(_WORD *)&v20[8] = 2080;
    uint64_t v21 = v6;
    _os_log_error_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s: enumeration failure processing container [%s][%llu]: %s",  buf,  0x2Au);
    if (v6)
    {
LABEL_15:
      free(v6);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

LABEL_16:
  container_error_free((void *)a1[7]);
  container_object_free((void *)a1[6]);
  uint64_t v10 = (void *)a1[8];
  unint64_t v9 = a1 + 8;
  uint64_t result = v10;
  if (v10)
  {
    free(result);
    return (void *)memset_s(v9, 8uLL, 0, 8uLL);
  }

  return result;
}

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  int v14 = (os_log_s *)container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = 136315394;
    unint64_t identifier = container_object_get_identifier(a1);
    __int16 v17 = 2080;
    uint64_t v18 = container_object_get_identifier(a2);
    _os_log_impl( &dword_18028C000,  v14,  OS_LOG_TYPE_DEFAULT,  "Skipping update of [%s] from [%s] since UUIDs don't match.",  (uint8_t *)&v15,  0x16u);
  }

void *__container_paths_enumerate_containers_at_block_invoke_25(void *a1)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  (*(void (**)(void))(a1[4] + 16LL))();
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
  {
    int v2 = container_error_copy_unlocalized_description(a1[5]);
    uint64_t __s = v2;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      if (!v2) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    uint64_t v7 = a1[6] + 1LL;
    *(_DWORD *)stat buf = 136446722;
    uint64_t v10 = "container_paths_enumerate_containers_at";
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    int v14 = v2;
    _os_log_error_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s: enumeration failure opening container dir [%llu]: %s",  buf,  0x20u);
    if (v2)
    {
LABEL_8:
      free(v2);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

uint64_t container_paths_copy_container_root_path_for_context(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  if (!a3)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unint64_t v5 = (os_log_s *)qword_18C438D58;
    if (!os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)stat buf = 136315138;
    int v14 = "container_paths_copy_container_root_path_for_context";
    int v6 = "%s: SPI MISUSE: context parameter is NULL";
    goto LABEL_14;
  }

  if ((unint64_t)(*a3 - 1LL) >= 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unint64_t v5 = (os_log_s *)qword_18C438D58;
    if (!os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)stat buf = 136315138;
    int v14 = "container_paths_copy_container_root_path_for_context";
    int v6 = "%s: SPI MISUSE: Unknown container class";
LABEL_14:
    _os_log_fault_impl(&dword_18028C000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
LABEL_11:
    uint64_t v4 = 0LL;
    goto LABEL_12;
  }

  uint64_t v3 = (os_activity_s *)a3[5];
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_paths_copy_container_root_path_for_context_block_invoke;
  block[3] = &unk_189639BA0;
  block[4] = &v9;
  block[5] = a2;
  void block[6] = a3;
  block[7] = "container_paths_copy_container_root_path_for_context";
  block[8] = a1;
  os_activity_apply(v3, block);
  uint64_t v4 = v10[3];
LABEL_12:
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __container_paths_copy_container_root_path_for_context_block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  switch(*(void *)(a1 + 40))
  {
    case 0LL:
      int v2 = *(unint64_t **)(a1 + 48);
      unint64_t v3 = *v2;
      if ((*v2 & 0xFFFFFFFFFFFFFFFELL) == 0xC
        || ((v4 = v3 > 8, v5 = (1LL << v3) & 0x12A, !v4) ? (BOOL v6 = v5 == 0) : (BOOL v6 = 1), !v6))
      {
        uint64_t v7 = strdup("/private/var");
        goto LABEL_8;
      }

      if (!v2[3]) {
        goto LABEL_63;
      }
      *(_DWORD *)stat buf = 0;
      host_t v26 = MEMORY[0x186DF8C2C]();
      uid_t v27 = *(const char **)(*(void *)(a1 + 48) + 24LL);
      uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 8LL);
      if (!v27) {
        goto LABEL_61;
      }
      uint64_t v37 = 0LL;
      memset(v36, 0, sizeof(v36));
      *(_DWORD *)stat buf = 2;
      if (!strncmp(v27, "com.apple.containermanager.current-persona", 0x2AuLL))
      {
      }

      else if (container_persona_convert_unique_string_to_persona_uid((uint64_t)v27) == -1)
      {
        *(void *)(v28 + 24) = 0LL;
        return;
      }

      int v32 = kpersona_info();
      if (!v32 && DWORD1(v36[0]) == 2)
      {
        int v33 = calloc(0x401uLL, 1uLL);
        uint64_t __s = v33;
        free(v33);
        memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_61:
        int v33 = 0LL;
LABEL_62:
        *(void *)(v28 + 24) = v33;
        goto LABEL_63;
      }

      *(void *)(v28 + 24) = 0LL;
      if (v32) {
        return;
      }
LABEL_63:
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
      {
        uint64_t v7 = container_pwd_copy_user_home_path(*(_DWORD *)(*(void *)(a1 + 48) + 32LL), 1, 0, 0LL);
        goto LABEL_8;
      }

      return;
    case 1LL:
      if (*(void *)(a1 + 64))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        unint64_t v9 = *(void *)v8;
        if ((*(void *)v8 & 0xFFFFFFFFFFFFFFFELL) != 0xC
          && ((BOOL v4 = v9 > 8, v10 = (1LL << v9) & 0x12A, !v4) ? (v11 = v10 == 0) : (v11 = 1), v11))
        {
          if (*(_DWORD *)(v8 + 32) == 501)
          {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = calloc(0x401uLL, 1uLL);
            strlcpy(*(char **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), *(const char **)(a1 + 64), 0x400uLL);
            container_fs_add_path_component( *(const char **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  (uint64_t)"mobile",  0x400uLL);
          }

          else
          {
            if (container_log_handle_for_category_onceToken != -1) {
              dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
            }
            uint64_t v29 = qword_18C438D58;
            if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
            {
              uint64_t v30 = *(void *)(a1 + 56);
              int v31 = *(_DWORD *)(*(void *)(a1 + 48) + 32LL);
              *(_DWORD *)stat buf = 136315394;
              *(void *)&v36[0] = v30;
              WORD4(v36[0]) = 1024;
              *(_DWORD *)((char *)v36 + 10) = v31;
              __int16 v19 = "%s: SPI MISUSE: Cannot use CONTAINER_PATHS_PREFIX_TYPE_DATA_VOLUME_MOUNT_POINT with edu mode user %d";
              uint64_t v20 = (os_log_s *)v29;
              uint32_t v21 = 18;
              goto LABEL_40;
            }
          }
        }

        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = calloc(0x401uLL, 1uLL);
          strlcpy(*(char **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), *(const char **)(a1 + 64), 0x400uLL);
        }
      }

      else
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v22 = qword_18C438D58;
        if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
        {
          uint64_t v24 = *(void *)(a1 + 56);
          *(_DWORD *)stat buf = 136315138;
          *(void *)&v36[0] = v24;
          __int16 v19 = "%s: SPI MISUSE: prefix parameter is NULL";
          goto LABEL_39;
        }
      }

      return;
    case 2LL:
      if (*(void *)(*(void *)(a1 + 48) + 24LL)) {
        goto LABEL_17;
      }
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v22 = qword_18C438D58;
      if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = *(void *)(a1 + 56);
        *(_DWORD *)stat buf = 136315138;
        *(void *)&v36[0] = v25;
        __int16 v19 = "%s: SPI MISUSE: persona_unique_string is NULL but is required for data separated mount point";
        goto LABEL_39;
      }

      return;
    case 3LL:
LABEL_17:
      uint64_t v12 = *(const char **)(a1 + 64);
      if (v12)
      {
        unint64_t v13 = **(void **)(a1 + 48);
        if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 0xC
          && ((BOOL v4 = v13 > 8, v14 = (1LL << v13) & 0x12A, !v4) ? (v15 = v14 == 0) : (v15 = 1), v15))
        {
          uint64_t v7 = strndup(v12, 0x400uLL);
LABEL_8:
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
        }

        else
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v16 = qword_18C438D58;
          if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
          {
            uint64_t v17 = *(void *)(a1 + 56);
            uint64_t v18 = **(void **)(a1 + 48);
            *(_DWORD *)stat buf = 136315394;
            *(void *)&v36[0] = v17;
            WORD4(v36[0]) = 2048;
            *(void *)((char *)v36 + 10) = v18;
            __int16 v19 = "%s: SPI MISUSE: Cannot use CONTAINER_PATHS_PREFIX_TYPE_USER_HOME with global container class %llu";
            uint64_t v20 = (os_log_s *)v16;
            uint32_t v21 = 22;
LABEL_40:
            _os_log_fault_impl(&dword_18028C000, v20, OS_LOG_TYPE_FAULT, v19, buf, v21);
          }
        }
      }

      else
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v22 = qword_18C438D58;
        if (os_log_type_enabled((os_log_t)qword_18C438D58, OS_LOG_TYPE_FAULT))
        {
          uint64_t v23 = *(void *)(a1 + 56);
          *(_DWORD *)stat buf = 136315138;
          *(void *)&v36[0] = v23;
          __int16 v19 = "%s: SPI MISUSE: prefix parameter is NULL";
LABEL_39:
          uint64_t v20 = (os_log_s *)v22;
          uint32_t v21 = 12;
          goto LABEL_40;
        }
      }

      return;
    default:
      return;
  }

BOOL container_paths_create_uid_home_relative(int a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = 0LL;
  int v32 = &v31;
  uint64_t v33 = 0x2000000000LL;
  uint64_t v34 = 0LL;
  uint64_t v30 = 1LL;
  uint64_t v7 = container_pwd_copy_user_home_path(a1, 1, 0, &v30);
  uint64_t v26 = 0LL;
  uid_t v27 = &v26;
  uint64_t v28 = 0x2000000000LL;
  uint64_t v29 = v7;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  int v25 = -1;
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = (*((uint64_t (**)(char *, uint64_t))gCMFSSeam + 64))(v7, 1611694080LL);
    *((_DWORD *)v23 + 6) = v9;
    if ((v9 & 0x80000000) == 0)
    {
      v21[0] = MEMORY[0x1895FED80];
      v21[1] = 0x40000000LL;
      v21[2] = __container_paths_create_uid_home_relative_block_invoke;
      v21[3] = &unk_189639BC8;
      v21[4] = &v22;
      v21[5] = &v26;
      v21[6] = &v31;
      BOOL v10 = _container_paths_in_reverse_order_from_type_do(a2, (uint64_t)v21);
      goto LABEL_7;
    }

    int v14 = *__error();
    uint64_t v12 = 1LL;
    uint64_t v11 = 127LL;
    unint64_t v13 = v8;
  }

  else
  {
    uint64_t v11 = v30;
    uint64_t v12 = 3LL;
    unint64_t v13 = 0LL;
    int v14 = 0;
  }

  BOOL v15 = container_error_create(v12, v11, v13, v14);
  BOOL v10 = 0LL;
  v32[3] = (uint64_t)v15;
LABEL_7:
  if ((v23[3] & 0x80000000) == 0) {
    (*((void (**)(void))gCMFSSeam + 19))();
  }
  if (a4) {
    char v16 = v10;
  }
  else {
    char v16 = 1;
  }
  uint64_t v17 = (void *)v32[3];
  if ((v16 & 1) != 0) {
    container_error_free(v17);
  }
  else {
    *a4 = v17;
  }
  char v18 = !v10;
  __int16 v19 = (void *)v27[3];
  if (!a3) {
    char v18 = 1;
  }
  if ((v18 & 1) != 0)
  {
    if (v19)
    {
      free(v19);
      memset_s(v27 + 3, 8uLL, 0, 8uLL);
    }
  }

  else
  {
    *a3 = v19;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  return v10;
}

uint64_t __container_paths_create_uid_home_relative_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1[4] + 8LL);
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  uint64_t v5 = *(unsigned __int16 *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  BOOL v6 = *(const char **)(a2 + 32);
  uint64_t v8 = *(const char **)(a2 + 40);
  int v9 = *(unsigned __int8 *)(a2 + 48);
  uint64_t v11 = *(const char **)(v3 + 24);
  BOOL v10 = (void **)(v3 + 24);
  uint64_t __s = 0LL;
  asprintf(&__s, "%s/%s", v11, v8);
  if (!__s)
  {
    _os_crash();
    __break(1u);
    JUMPOUT(0x180294348LL);
  }

  if (v9
    && ((*((uint64_t (**)(void, const char *, uint64_t))gCMFSSeam + 59))(*(unsigned int *)(v2 + 24), v8, v5) & 0x80000000) != 0
    && *__error() != 17
    || (int v12 = (*((uint64_t (**)(void, const char *, uint64_t))gCMFSSeam + 66))( *(unsigned int *)(v2 + 24),  v8,  1611694080LL),  v12 < 0))
  {
    char v18 = __error();
    BOOL v15 = container_error_create(1LL, 127LL, __s, *v18);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

LABEL_21:
    uint64_t result = 0LL;
    *(void *)(v4 + 24) = v15;
  }

  else
  {
    int v13 = v12;
    int v14 = __s;
    uint64_t v31 = 0LL;
    int v32 = &v31;
    uint64_t v33 = 0x2000000000LL;
    uid_t v34 = geteuid();
    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2000000000LL;
    gid_t v30 = getegid();
    BOOL v15 = 0LL;
    char v16 = "mobile";
    int v17 = 1;
    switch(v7)
    {
      case 0LL:
        goto LABEL_17;
      case 1LL:
        goto LABEL_11;
      case 3LL:
        *((_DWORD *)v32 + 6) = (_DWORD)v6;
        *((_DWORD *)v28 + 6) = HIDWORD(v6);
        goto LABEL_12;
      case 4LL:
        char v16 = v6;
LABEL_11:
        uint64_t v26 = 1LL;
        v25[0] = MEMORY[0x1895FED80];
        v25[1] = 0x40000000LL;
        v25[2] = ___container_paths_chown_component_block_invoke;
        v25[3] = &unk_189639DE8;
        v25[4] = &v31;
        v25[5] = &v27;
        uint64_t v21 = v26;
        uint64_t v20 = 3LL;
        uint64_t v22 = 0LL;
        int v19 = 0;
        goto LABEL_16;
      default:
LABEL_12:
        if (fchown(v13, *((_DWORD *)v32 + 6), *((_DWORD *)v32 + 6)) < 0)
        {
          int v19 = *__error();
          uint64_t v20 = 1LL;
          uint64_t v21 = 127LL;
          uint64_t v22 = v14;
LABEL_16:
          BOOL v15 = container_error_create(v20, v21, v22, v19);
          int v17 = 0;
        }

        else
        {
          BOOL v15 = 0LL;
          int v17 = 1;
        }

    int v9 = 73LL;
LABEL_22:
    int v17 = v9;
    goto LABEL_23;
  }

  uint64_t v11 = strndup(__s1, 0x400uLL);
  uint64_t __s = v11;
  if (!v11) {
    goto LABEL_21;
  }
LABEL_19:
  if (v17 == 1) {
    return v11;
  }
  free(v11);
  memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_23:
  uint64_t v11 = 0LL;
  if (a4)
  {
    uint64_t v11 = 0LL;
    *a4 = v17;
  }

  return v11;
}

LABEL_17:
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);
        if (!v17) {
          goto LABEL_21;
        }
        if (*v10)
        {
          free(*v10);
          memset_s(v10, 8uLL, 0, 8uLL);
        }

        uint64_t *v10 = __s;
        (*((void (**)(void))gCMFSSeam + 19))(*(unsigned int *)(v2 + 24));
        *(_DWORD *)(v2 + 24) = v13;
        uint64_t result = 1LL;
        break;
    }
  }

  return result;
}

  container_error_free(v5);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) != 1LL)
  {
    int v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }

  if (v6) {
    xpc_release(v6);
  }
  if (v2) {
    xpc_release(v2);
  }
}

BOOL _container_paths_in_reverse_order_from_type_do(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (char *)&_container_paths_definition_from_type_definitions[7 * a1];
  uint64_t v4 = *((void *)v3 + 1);
  if (v4)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = *((void *)v3 + 1);
    do
    {
      uint64_t v6 = _container_paths_definition_from_type_definitions[7 * v6 + 1];
      ++v5;
    }

    while (v6);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v7 = v5 + 1;
  do
  {
    uint64_t v8 = v7;
    if (!v7) {
      break;
    }
    uint64_t v9 = *(void *)v3;
    __int128 v10 = *((_OWORD *)v3 + 2);
    __int128 v21 = *((_OWORD *)v3 + 1);
    __int128 v22 = v10;
    uint64_t v23 = *((void *)v3 + 6);
    uint64_t v11 = v5;
    uint64_t v12 = v4;
    --v7;
    if (v8 == 1)
    {
      uint64_t v12 = v4;
    }

    else
    {
      do
      {
        int v13 = (char *)&_container_paths_definition_from_type_definitions[7 * v12];
        uint64_t v12 = *((void *)v13 + 1);
        __int128 v14 = *((_OWORD *)v13 + 2);
        __int128 v21 = *((_OWORD *)v13 + 1);
        __int128 v22 = v14;
        uint64_t v23 = *((void *)v13 + 6);
        --v11;
      }

      while (v11);
      uint64_t v9 = *(void *)v13;
    }

    BOOL v15 = *(uint64_t (**)(uint64_t, void *))(a2 + 16);
    v17[0] = v9;
    v17[1] = v12;
    __int128 v18 = v21;
    __int128 v19 = v22;
    uint64_t v20 = v23;
    --v5;
  }

  while ((v15(a2, v17) & 1) != 0);
  return v8 == 0;
}

uint64_t ___container_paths_chown_component_block_invoke(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2[1];
  return 1LL;
}

uint64_t container_paths_copy_uid_home_relative(int a1, uint64_t a2, void *a3)
{
  uint64_t v16 = 1LL;
  uint64_t v5 = container_pwd_copy_user_home_path(a1, 1, 0, &v16);
  uint64_t __s = v5;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  __int128 v14 = calloc(0x401uLL, 1uLL);
  __strlcpy_chk();
  if (v5)
  {
    v10[0] = MEMORY[0x1895FED80];
    v10[1] = 0x40000000LL;
    v10[2] = __container_paths_copy_uid_home_relative_block_invoke;
    v10[3] = &unk_189639BF0;
    v10[4] = &v11;
    _container_paths_in_reverse_order_from_type_do(a2, (uint64_t)v10);
    uint64_t v6 = 0LL;
    if (a3)
    {
LABEL_3:
      *a3 = v6;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v6 = container_error_create(3LL, v16, 0LL, 0);
    if (a3) {
      goto LABEL_3;
    }
  }

  container_error_free(v6);
LABEL_6:
  uint64_t v7 = (void *)v12[3];
  if (v7)
  {
    free(v7);
    memset_s(v12 + 3, 8uLL, 0, 8uLL);
  }

  if (v5)
  {
    free(v5);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  uint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __container_paths_copy_uid_home_relative_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = (const char *)calloc(0x401uLL, 1uLL);
  uint64_t v5 = (void **)(v3 + 24);
  __strlcpy_chk();
  container_fs_add_path_component(v4, v2, 0x400uLL);
  if (*v5)
  {
    free(*v5);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  *uint64_t v5 = (void *)v4;
  return 1LL;
}

char *container_serialize_copy_serialized_reference(char *result, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    unint64_t identifier = (const char *)container_object_get_identifier((uint64_t)result);
    persona_unique_string = (char *)container_object_get_persona_unique_string(v3);
    unint64_t unique_path_component = (const char *)container_object_get_unique_path_component(v3);
    uint64_t v7 = (char *)container_base64_encode_string(identifier);
    __int128 v19 = v7;
    if (persona_unique_string)
    {
      size_t v8 = strlen(persona_unique_string);
      persona_unique_string = container_base64_encode((uint64_t)persona_unique_string, v8);
    }

    __int128 v18 = persona_unique_string;
    uint64_t v9 = (char *)container_base64_encode_string(unique_path_component);
    int v17 = v9;
    memset(out, 0, 37);
    uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(v3);
    uuid_unparse(uuid, out);
    unsigned int v11 = container_object_is_transient(v3);
    uint64_t __s = 0LL;
    uint64_t v12 = container_object_get_class(v3);
    unsigned int uid = container_object_get_uid(v3);
    __int128 v14 = (const char *)&unk_1802B435E;
    BOOL v15 = "T";
    if (!v11) {
      BOOL v15 = (const char *)&unk_1802B435E;
    }
    if (persona_unique_string) {
      __int128 v14 = persona_unique_string;
    }
    asprintf(&__s, "CmCo:1:%llu:%u:%s:%s:%s:%s:%s", v12, uid, out, v15, v7, v9, v14);
    if (a2 && __s) {
      *a2 = strlen(__s) + 1;
    }
    if (v7)
    {
      free(v7);
      memset_s(&v19, 8uLL, 0, 8uLL);
    }

    if (persona_unique_string)
    {
      free(persona_unique_string);
      memset_s(&v18, 8uLL, 0, 8uLL);
    }

    if (v9)
    {
      free(v9);
      memset_s(&v17, 8uLL, 0, 8uLL);
    }

    return __s;
  }

  return result;
}

unsigned __int8 *container_serialize_copy_deserialized_reference(const char *a1, size_t a2, void **a3)
{
  int v25 = 0LL;
  uint64_t v26 = 1LL;
  if (a1)
  {
    if (strnlen(a1, a2) <= 4)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 133LL;
LABEL_7:
      uint64_t v26 = v7;
      goto LABEL_8;
    }

    if (strncmp("CmCo", a1, 4uLL))
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 134LL;
      goto LABEL_7;
    }

    uint64_t v9 = strndup(a1, a2);
    __int128 v10 = v9;
    int v25 = v9;
    if (v9 < &v9[a2 - 1])
    {
      size_t v11 = a2 - 1;
      uint64_t v12 = v9;
      do
      {
        if (*v12 == 58)
        {
          *uint64_t v12 = 0;
        }

        else if (!*v12)
        {
          uint64_t v6 = 0LL;
          uint64_t v24 = 142LL;
          goto LABEL_29;
        }

        ++v12;
        --v11;
      }

      while (v11);
    }

    uint64_t v13 = (unsigned __int8 *)(v9 + 5);
    size_t v14 = a2 - 5;
    size_t v15 = strnlen(v9 + 5, v14);
    unint64_t v16 = 0LL;
    size_t v17 = v15 + 1;
    __int128 v18 = (char *)&v13[v15 + 1];
    __int128 v19 = &v13[v15];
    while (v13 < v19)
    {
      if (is_mul_ok(v16, 0xAuLL))
      {
        int v20 = *v13;
        if ((v20 - 48) <= 9)
        {
          uint64_t v21 = 10 * v16;
          uint64_t v22 = (v20 - 48);
          ++v13;
          BOOL v23 = __CFADD__(v21, v22);
          unint64_t v16 = v21 + v22;
          if (!v23) {
            continue;
          }
        }
      }

      goto LABEL_28;
    }

    if (v16 == 1)
    {
      uint64_t v6 = _container_serialize_copy_deserialized_reference_v1(v18, v14 - v17, &v26);
      goto LABEL_30;
    }

LABEL_28:
    uint64_t v6 = 0LL;
    uint64_t v24 = 135LL;
LABEL_29:
    uint64_t v26 = v24;
LABEL_30:
    if (v10)
    {
      free(v10);
      memset_s(&v25, 8uLL, 0, 8uLL);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

    os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  }

  return 1LL;
}

LABEL_8:
  if (a3 && v26 != 1) {
    *a3 = container_error_create(5LL, v26, 0LL, 0);
  }
  return v6;
}

unsigned __int8 *_container_serialize_copy_deserialized_reference_v1(char *__s, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = a3;
  uint64_t v34 = *MEMORY[0x1895FEE08];
  uint64_t v32 = 1LL;
  memset(uu, 0, sizeof(uu));
  gid_t v30 = 0LL;
  __sa = 0LL;
  uint64_t v29 = 0LL;
  if (a2 < 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v5 = 0LL;
LABEL_40:
    uint64_t v24 = 0LL;
    uint64_t v32 = 141LL;
    if (v5) {
      goto LABEL_46;
    }
    goto LABEL_47;
  }

  uint64_t v4 = __s;
  uint64_t v26 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  LODWORD(v7) = 0;
  char v8 = 0;
  unint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  uint64_t v28 = &__s[a2];
  while (2)
  {
    size_t v11 = strlen(v4);
    unint64_t v12 = v11 + 1;
    switch(v9)
    {
      case 0uLL:
        unint64_t v10 = 0LL;
        uint64_t v13 = v4;
        while (v13 < &v4[v11])
        {
          if (is_mul_ok(v10, 0xAuLL))
          {
            int v14 = *v13;
            if ((v14 - 48) <= 9)
            {
              uint64_t v15 = (v14 - 48);
              ++v13;
              BOOL v16 = __CFADD__(10 * v10, v15);
              unint64_t v10 = 10 * v10 + v15;
              if (!v16) {
                continue;
              }
            }
          }

          goto LABEL_42;
        }

        if (v10 - 1 < 0xE) {
          goto LABEL_36;
        }
LABEL_42:
        uint64_t v24 = 0LL;
        uint64_t v25 = 20LL;
        goto LABEL_44;
      case 1uLL:
        unint64_t v7 = 0LL;
        size_t v17 = v4;
        while (v17 < &v4[v11])
        {
          if (is_mul_ok(v7, 0xAuLL))
          {
            int v18 = *v17;
            if ((v18 - 48) <= 9)
            {
              uint64_t v19 = (v18 - 48);
              ++v17;
              BOOL v16 = __CFADD__(10 * v7, v19);
              unint64_t v7 = 10 * v7 + v19;
              if (!v16) {
                continue;
              }
            }
          }

          goto LABEL_43;
        }

        if (v7 <= 0x7FFFFFFE) {
          goto LABEL_36;
        }
LABEL_43:
        uint64_t v24 = 0LL;
        uint64_t v25 = 136LL;
LABEL_44:
        uint64_t v32 = v25;
        goto LABEL_45;
      case 2uLL:
        if (v11 == 36 && !uuid_parse(v4, uu)) {
          goto LABEL_36;
        }
        uint64_t v24 = 0LL;
        uint64_t v25 = 137LL;
        goto LABEL_44;
      case 3uLL:
        for (i = v4; v11; --v11)
        {
          int v21 = *i++;
          v8 |= v21 == 84;
        }

        goto LABEL_36;
      case 4uLL:
        uint64_t v22 = _container_base64_decode(v4, 0LL, 1u);
        __sa = v22;
        if (!v22)
        {
          uint64_t v24 = 0LL;
          uint64_t v32 = 138LL;
          uint64_t v3 = a3;
          if (v6) {
            goto LABEL_48;
          }
          goto LABEL_49;
        }

        uint64_t v5 = v22;
LABEL_36:
        v4 += v12;
        ++v9;
        if (v4 < v28) {
          continue;
        }
        if (v9 <= 5)
        {
          uint64_t v3 = a3;
          goto LABEL_40;
        }

        uint64_t v24 = container_object_create(uu, v5, v10, v7, 0LL, v6, v26, 0LL, 0LL, 0, v8 & 1, 0LL, 0LL, &v32);
LABEL_45:
        uint64_t v3 = a3;
        if (v5)
        {
LABEL_46:
          free(v5);
          memset_s(&__sa, 8uLL, 0, 8uLL);
          uint64_t v6 = v30;
        }

LABEL_47:
        if (v6)
        {
LABEL_48:
          free(v6);
          memset_s(&v30, 8uLL, 0, 8uLL);
        }

LABEL_49:
        if (v29)
        {
          free(v29);
          memset_s(&v29, 8uLL, 0, 8uLL);
        }

        if (v3 && !v24) {
          *uint64_t v3 = v32;
        }
        return v24;
      case 5uLL:
        if (v12 >= 2)
        {
          uint64_t v6 = _container_base64_decode(v4, 0LL, 1u);
          gid_t v30 = v6;
        }

        if (v6) {
          goto LABEL_36;
        }
        uint64_t v24 = 0LL;
        uint64_t v25 = 139LL;
        goto LABEL_44;
      case 6uLL:
        if (v12 < 2) {
          goto LABEL_36;
        }
        uint64_t v29 = _container_base64_decode(v4, 0LL, 1u);
        uint64_t v26 = (const char *)v29;
        if (v29) {
          goto LABEL_36;
        }
        uint64_t v24 = 0LL;
        uint64_t v25 = 76LL;
        goto LABEL_44;
      default:
        goto LABEL_36;
    }
  }

uint64_t container_operation_delete(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  uint64_t v20 = 0LL;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  char v8 = _os_activity_create( &dword_18028C000,  "container_operation_delete",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_operation_delete_block_invoke;
  block[3] = &unk_189639E10;
  void block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[4] = &v17;
  block[5] = &v13;
  os_activity_apply(v8, block);
  os_release(v8);
  uint64_t v9 = v14[3];
  if (a4 && v9)
  {
    *a4 = container_error_create(*(void *)(v9 + 8), *(void *)v9, *(char **)(v9 + 16), *(_DWORD *)(v9 + 24));
    uint64_t v9 = v14[3];
  }

  container_log_ext_error( (uint64_t)"container_operation_delete",  gClientFaultLoggingEnabled,  (uint64_t *)v9);
  container_error_free((void *)v14[3]);
  uint64_t v10 = v18[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __container_operation_delete_block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = *(void *)(a1 + 48);
  uint64_t result = container_operation_delete_array( (uint64_t)v4,  1LL,  *(void *)(a1 + 56),  *(void **)(a1 + 64),  (void **)(*(void *)(v2 + 8) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_operation_delete_array(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void **a5)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  uint64_t v26 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 0LL;
  uint64_t v10 = _os_activity_create( &dword_18028C000,  "container_operation_delete_array",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1895FED80];
  v14[1] = 0x40000000LL;
  v14[2] = __container_operation_delete_array_block_invoke;
  v14[3] = &unk_189639E38;
  v14[8] = a2;
  v14[9] = a3;
  v14[4] = &v23;
  v14[5] = &v19;
  v14[6] = &v15;
  v14[7] = a1;
  os_activity_apply(v10, v14);
  os_release(v10);
  if (a4) {
    *a4 = v20[3];
  }
  uint64_t v11 = v16[3];
  if (a5 && v11)
  {
    *a5 = container_error_create(*(void *)(v11 + 8), *(void *)v11, *(char **)(v11 + 16), *(_DWORD *)(v11 + 24));
    uint64_t v11 = v16[3];
  }

  container_log_ext_error( (uint64_t)"container_operation_delete_array",  gClientFaultLoggingEnabled,  (uint64_t *)v11);
  container_error_free((void *)v16[3]);
  uint64_t v12 = v24[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __container_operation_delete_array_block_invoke(void *a1)
{
  uint64_t v63 = *MEMORY[0x1895FEE08];
  uint64_t v2 = (uint64_t *)a1[7];
  uint64_t v3 = a1[8];
  uint64_t value = a1[9];
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  uint64_t v27 = 0LL;
  uint64_t v28 = 1LL;
  uint64_t v26 = 0LL;
  int v25 = 0;
  if (v3)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "Command", 3uLL);
    xpc_dictionary_set_uint64(v6, "Flags", value);
    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    container_xpc_encode_container_array(v7, v2, v3);
    xpc_dictionary_set_value(v6, "ContainersArray", v7);
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v4;
      uint64_t v22 = v5;
      char v8 = (void *)MEMORY[0x186DF907C](v6);
      uint64_t __s = v8;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v60 = 0u;
      voucher_get_current_persona_originator_info();
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v57 = 0u;
      voucher_get_current_persona_proximate_info();
      uint64_t v56 = 0LL;
      memset(v55, 0, sizeof(v55));
      __int128 v54 = 0u;
      __int128 v53 = 0u;
      __int128 v52 = 0u;
      __int128 v51 = 0u;
      __int128 v50 = 0u;
      int v49 = 2;
      int current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        int v14 = "<unknown>";
        uint64_t v10 = "NOPERSONA";
      }

      else
      {
        else {
          uint64_t v10 = (&off_18963AFA8)[DWORD1(v50) - 2];
        }
        int v14 = &v55[4];
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v15 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67111427;
        int v30 = current_persona;
        __int16 v31 = 2082;
        uint64_t v32 = v10;
        __int16 v33 = 2082;
        uint64_t v34 = v14;
        __int16 v35 = 1024;
        int v36 = 0;
        __int16 v37 = 1024;
        int v38 = 0;
        __int16 v39 = 1024;
        int v40 = 0;
        __int16 v41 = 1024;
        int v42 = 0;
        __int16 v43 = 1024;
        uid_t v44 = geteuid();
        __int16 v45 = 1024;
        uid_t v46 = getuid();
        __int16 v47 = 2081;
        size_t v48 = v8;
        _os_log_impl( &dword_18028C000,  v15,  OS_LOG_TYPE_DEFAULT,  "Container delete; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], pro"
          "ximate [pid = %d, personaid = %d], eunsigned int uid = %d, unsigned int uid = %d, manifest = %{private}s",
          buf,
          0x4Au);
      }

      if (v8)
      {
        free(v8);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }

      uint64_t v4 = v21;
      uint64_t v5 = v22;
    }

    for (uint64_t i = 0LL; i != v3; ++i)
    {
      uint64_t v17 = v2[i];
      if (!v17 || (unint64_t)container_object_get_class(v17) - 1 >= 0xE)
      {
        uint64_t v13 = (int *)container_error_create(3LL, 11LL, 0LL, 0);
        uint64_t v11 = 0LL;
        uint64_t v12 = 0LL;
LABEL_29:
        uint64_t v26 = v13;
        goto LABEL_30;
      }
    }

    int v18 = container_disposition_for_array(v2, v3, &v25);
    uint64_t v19 = (void *)container_xpc_send_sync_message(v18, (void *)(2 * (value & 1)), v6, 1, v25, 0LL, (uint64_t)&v26);
    uint64_t v12 = v19;
    if (v19)
    {
      xpc_object_t v20 = xpc_dictionary_get_value(v19, "ReplyContainersArray");
      uint64_t v11 = container_xpc_decode_create_container_object_array(v20, &v27, &v28);
      if (v11) {
        goto LABEL_10;
      }
      uint64_t v13 = (int *)container_error_create(2LL, v28, 0LL, 0);
      goto LABEL_29;
    }

    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = calloc(1uLL, 8uLL);
    xpc_object_t v7 = 0LL;
    xpc_object_t v6 = 0LL;
    uint64_t v12 = 0LL;
  }

uint64_t container_operation_delete_reclaim_disk_space()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  uint64_t v0 = _os_activity_create( &dword_18028C000,  "container_operation_delete_reclaim_disk_space",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_operation_delete_reclaim_disk_space_block_invoke;
  block[3] = &unk_189639E60;
  block[4] = &v4;
  os_activity_apply(v0, block);
  os_release(v0);
  container_log_ext_error( (uint64_t)"container_operation_delete_reclaim_disk_space",  gClientFaultLoggingEnabled,  (uint64_t *)v5[3]);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __container_operation_delete_reclaim_disk_space_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 4uLL);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v37 = 0u;
  voucher_get_current_persona_originator_info();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v34 = 0u;
  voucher_get_current_persona_proximate_info();
  uint64_t v33 = 0LL;
  memset(v32, 0, sizeof(v32));
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v27 = 0u;
  int v26 = 2;
  int current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v4 = "NOPERSONA";
  }

  else
  {
    else {
      uint64_t v4 = (&off_18963AFA8)[DWORD1(v27) - 2];
    }
    uint64_t v5 = &v32[4];
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v6 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67111170;
    int v9 = current_persona;
    __int16 v10 = 2082;
    uint64_t v11 = v4;
    __int16 v12 = 2082;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 1024;
    int v17 = 0;
    __int16 v18 = 1024;
    int v19 = 0;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 1024;
    uid_t v23 = geteuid();
    __int16 v24 = 1024;
    uid_t v25 = getuid();
    _os_log_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_DEFAULT,  "Wait for obliteration; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], pr"
      "oximate [pid = %d, personaid = %d], eunsigned int uid = %d, unsigned int uid = %d",
      buf,
      0x40u);
  }

  uint64_t v7 = (void *)container_xpc_send_sync_message( 2,  (void *)2,  v2,  1,  0,  0LL,  *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2) {
    xpc_release(v2);
  }
  if (v7) {
    xpc_release(v7);
  }
}

uint64_t container_operation_complete_background_tasks(int a1)
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  xpc_object_t v2 = _os_activity_create( &dword_18028C000,  "container_operation_complete_background_tasks",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __container_operation_complete_background_tasks_block_invoke;
  v5[3] = &unk_189639E88;
  int v6 = a1;
  v5[4] = &v7;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_ext_error( (uint64_t)"container_operation_complete_background_tasks",  gClientFaultLoggingEnabled,  (uint64_t *)v8[3]);
  uint64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __container_operation_complete_background_tasks_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x2EuLL);
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v3 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_DEFAULT,  "Wait for background task completion; disposition = 0x%x",
      (uint8_t *)v8,
      8u);
  }

  int v5 = *(_DWORD *)(a1 + 40);
  if ((v5 & 0xFFFFFFFE) == 2)
  {
    int v6 = (void *)container_xpc_send_sync_message( 2,  (void *)5,  v2,  1,  0,  0LL,  *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (!v6) {
      goto LABEL_11;
    }
    xpc_release(v6);
    int v5 = *(_DWORD *)(a1 + 40);
  }

  if ((v5 | 2) == 3)
  {
    uint64_t v7 = (void *)container_xpc_send_sync_message( 1,  (void *)5,  v2,  1,  0,  0LL,  *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (v7) {
      xpc_release(v7);
    }
  }

LABEL_11:
  if (v2) {
    xpc_release(v2);
  }
}

char *container_audit_token_copy_codesign_identifier()
{
  return container_codesign_copy_cs_identity();
}

uint64_t container_audit_token_get_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

char *container_audit_token_copy_codesign_team_identifier()
{
  return container_codesign_copy_cs_team_identifier();
}

unint64_t container_audit_token_get_codesign_status()
{
  return container_codesign_get_status();
}

void *container_audit_token_copy_codesign_hash(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 20);
  __int128 v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  return container_codesign_copy_cdhash(v2, (uint64_t)v5, a2);
}

uint64_t container_audit_token_copy_executable_name(audit_token_t *a1, char **a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  unsigned int v4 = a1->val[5];
  bzero(buffer, 0x401uLL);
  if (proc_pidpath_audittoken(a1, buffer, 0x400u) >= 2)
  {
    int v5 = rindex(buffer, 47);
    uint64_t v6 = 0LL;
    if (v5) {
      uint64_t v7 = v5 + 1;
    }
    else {
      uint64_t v7 = buffer;
    }
    if (!a2) {
      return v6;
    }
LABEL_12:
    if (!(_DWORD)v6) {
      *a2 = strndup(v7, 0x400uLL);
    }
    return v6;
  }

  uint64_t v6 = *__error();
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  char v8 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_error_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_ERROR,  "Unable to fetch executable path from client for pid [%d]: %{darwin.errno}d",  (uint8_t *)v10,  0xEu);
  }

  uint64_t v7 = 0LL;
  if (a2) {
    goto LABEL_12;
  }
  return v6;
}

void *container_audit_token_copy_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = xpc_copy_entitlement_for_token();
  unsigned int v4 = (void *)v3;
  if (!a2 && v3 && MEMORY[0x186DF9184](v3) != MEMORY[0x189600980])
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v5 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_18028C000, v5, OS_LOG_TYPE_ERROR, "Could not get entitlements for client", v7, 2u);
    }

    xpc_release(v4);
    return 0LL;
  }

  return v4;
}

uint64_t container_audit_token_get_platform(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  active_int platform = dyld_get_active_platform();
  unsigned int buffer = 0;
  int v3 = *(_DWORD *)(a1 + 20);
  if (proc_pidinfo(v3, 30, 0LL, &buffer, 4) == 4) {
    return buffer;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  unsigned int v4 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
  {
    int v6 = *__error();
    *(_DWORD *)stat buf = 67109376;
    int v9 = v3;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_error_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_ERROR,  "Unable to fetch platform from client for pid [%d]: %{darwin.errno}d",  buf,  0xEu);
  }

  return active_platform;
}

uint64_t container_audit_token_get_euid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t container_audit_token_get_egid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

BOOL container_audit_token_for_pid(int pid, _OWORD *a2)
{
  kern_return_t v5;
  mach_error_t v6;
  os_log_s *v7;
  BOOL v8;
  kern_return_t v9;
  mach_error_t v10;
  os_log_s *v11;
  char *v12;
  __int128 v13;
  char *v15;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  integer_t task_info_out[4];
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  mach_error_t v25;
  uint64_t v26;
  int v26 = *MEMORY[0x1895FEE08];
  if (!a2) {
    return 0LL;
  }
  *(_OWORD *)task_info_out = 0u;
  int v19 = 0u;
  tn = 0;
  unsigned int v4 = (mach_port_name_t *)MEMORY[0x1895FFD48];
  if (task_name_for_pid(*MEMORY[0x1895FFD48], pid, &tn))
  {
    int v5 = task_name_for_pid(*v4, pid, &tn);
    if (v5)
    {
      int v6 = v5;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v7 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
      {
        int v15 = mach_error_string(v6);
        *(_DWORD *)stat buf = 67109634;
        int v21 = pid;
        __int16 v22 = 2082;
        uid_t v23 = v15;
        __int16 v24 = 1024;
        uid_t v25 = v6;
        _os_log_error_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_ERROR,  "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)",  buf,  0x18u);
      }

      return 0LL;
    }
  }

  task_info_outCnt = 8;
  int v9 = task_info(tn, 0xFu, task_info_out, &task_info_outCnt);
  char v8 = v9 == 0;
  if (v9)
  {
    __int16 v10 = v9;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v11 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = mach_error_string(v10);
      *(_DWORD *)stat buf = 67109634;
      int v21 = pid;
      __int16 v22 = 2082;
      uid_t v23 = v12;
      __int16 v24 = 1024;
      uid_t v25 = v10;
      _os_log_error_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_ERROR,  "Unable to obtain a task info for pid %i: %{public}s (0x%x)",  buf,  0x18u);
    }
  }

  else
  {
    uint64_t v13 = v19;
    *a2 = *(_OWORD *)task_info_out;
    a2[1] = v13;
  }

  return v8;
}

BOOL container_audit_token_is_valid(_OWORD *a1)
{
  __int128 v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return container_audit_token_copy_executable_name(&v3, 0LL) != 3;
}

xpc_object_t *container_xpc_shared_copy_connection(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  uint64_t v12 = 1LL;
  os_unfair_lock_lock((os_unfair_lock_t)&gSharedClientConnectionLock);
  int v6 = (xpc_object_t **)&gSharedClientConnection[6 * a1 + a2];
  uint64_t v7 = *v6;
  if (*v6 || (v7 = container_xpc_create_connection((void *)a1, (void *)a2, 0, &v12), (*int v6 = v7) != 0LL))
  {
    v7[5] = (char *)v7[5] + 1;
    *((_BYTE *)v7 + 24) = 1;
    v7[4] = (xpc_object_t)mach_absolute_time();
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    char v8 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      xpc_object_t v11 = v7[5];
      *(_DWORD *)stat buf = 134218752;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = a1;
      __int16 v17 = 2048;
      uint64_t v18 = a2;
      __int16 v19 = 2048;
      xpc_object_t v20 = v11;
      _os_log_debug_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> shared; cnt = %lld",
        buf,
        0x2Au);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int16 v10 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 134218496;
      uint64_t v14 = (xpc_object_t *)a1;
      __int16 v15 = 2048;
      uint64_t v16 = a2;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      _os_log_error_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_ERROR,  "failed to generate connection for sharing of type %lld, purpose %lld: %lld",  buf,  0x20u);
    }

    uint64_t v7 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  if (a3) {
    *a3 = v12;
  }
  return v7;
}

xpc_object_t *container_xpc_create_connection(void *a1, void *a2, int a3, uint64_t *a4)
{
  uint64_t v30 = *MEMORY[0x1895FEE08];
  else {
    char v8 = "com.apple.containermanagerd";
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v8, 0LL, 0LL);
  if (!mach_service)
  {
    uint64_t v12 = 0LL;
    BOOL v13 = 1;
    uint64_t v16 = 19LL;
    if (!a4) {
      return v12;
    }
    goto LABEL_19;
  }

  xpc_connection_t v10 = mach_service;
  __xpc_connection_set_logging();
  xpc_object_t v11 = (xpc_object_t *)calloc(1uLL, 0x30uLL);
  uint64_t v12 = v11;
  BOOL v13 = v11 == 0LL;
  if (v11)
  {
    v11[1] = a1;
    v11[2] = a2;
    *((_WORD *)v11 + 12) = 0;
    v11[4] = (xpc_object_t)mach_absolute_time();
    v12[5] = (xpc_object_t)2;
    *uint64_t v12 = xpc_retain(v10);
    xpc_connection_set_context(v10, v12);
    int v14 = xpc_user_sessions_enabled();
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int16 v15 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      xpc_object_t v18 = v12[1];
      xpc_object_t v19 = v12[2];
      xpc_object_t v20 = v12[5];
      *(_DWORD *)stat buf = 134218752;
      uid_t v23 = v12;
      __int16 v24 = 2048;
      xpc_object_t v25 = v18;
      __int16 v26 = 2048;
      xpc_object_t v27 = v19;
      __int16 v28 = 2048;
      xpc_object_t v29 = v20;
      _os_log_debug_impl( &dword_18028C000,  v15,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> created; cnt = %lld",
        buf,
        0x2Au);
    }

    v21[0] = MEMORY[0x1895FED80];
    v21[1] = 0x40000000LL;
    v21[2] = __container_xpc_create_connection_block_invoke;
    v21[3] = &__block_descriptor_tmp_6;
    v21[4] = v10;
    v21[5] = v12;
    xpc_connection_set_event_handler(v10, v21);
    xpc_connection_resume(v10);
    uint64_t v16 = 1LL;
  }

  else
  {
    uint64_t v16 = 73LL;
  }

  xpc_release(v10);
  if (a4)
  {
LABEL_19:
    if (v13) {
      *a4 = v16;
    }
  }

  return v12;
}

void __container_xpc_create_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  if (a2 == MEMORY[0x189600938])
  {
    xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &__block_literal_global_312);
    os_unfair_lock_lock_with_options();
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    audit_token_t v3 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = v7[1];
      uint64_t v9 = v7[2];
      uint64_t v10 = gSharedClientConnection[6 * v8 + v9];
      int v15 = 134218752;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      _os_log_debug_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld; %p> invalidated",
        (uint8_t *)&v15,
        0x2Au);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    *(_BYTE *)(v4 + 25) = 1;
    if (*(_BYTE *)(v4 + 24))
    {
      int v5 = &gSharedClientConnection[6 * *(void *)(v4 + 8) + *(void *)(v4 + 16)];
      if (v4 == *v5)
      {
        *int v5 = 0LL;
        --*(void *)(v4 + 40);
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        int v6 = (os_log_s *)qword_18C438D48;
        if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
        {
          xpc_object_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = v11[1];
          uint64_t v13 = v11[2];
          uint64_t v14 = v11[5];
          int v15 = 134218752;
          uint64_t v16 = v11;
          __int16 v17 = 2048;
          uint64_t v18 = v12;
          __int16 v19 = 2048;
          uint64_t v20 = v13;
          __int16 v21 = 2048;
          uint64_t v22 = v14;
          _os_log_debug_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> released (shared; handler); cnt = %lld",
            (uint8_t *)&v15,
            0x2Au);
        }
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
    container_xpc_release(*(void *)(a1 + 40));
  }

void container_xpc_release(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  uint64_t __s = a1;
  if (!a1) {
    return;
  }
  os_unfair_lock_lock_with_options();
  --*(void *)(a1 + 40);
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v2 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v10 = *(void **)(a1 + 16);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)block = 134218752;
    *(void *)&block[4] = a1;
    *(_WORD *)&block[12] = 2048;
    *(void *)&block[14] = v9;
    *(_WORD *)&block[22] = 2048;
    uint64_t v20 = v10;
    *(_WORD *)__int16 v21 = 2048;
    *(void *)&v21[2] = v11;
    _os_log_debug_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> released; cnt = %lld",
      block,
      0x2Au);
  }

  if (!*(_BYTE *)(a1 + 25))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(_BYTE *)(a1 + 24))
    {
      if (v3 != 2) {
        goto LABEL_8;
      }
      if (_container_xpc_invalidate_shared_connection_after_timeout_onceToken != -1) {
        dispatch_once(&_container_xpc_invalidate_shared_connection_after_timeout_onceToken, &__block_literal_global_9);
      }
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v5 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 8);
        uint64_t v16 = *(void **)(a1 + 16);
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)block = 134219008;
        *(void *)&block[4] = a1;
        *(_WORD *)&block[12] = 2048;
        *(void *)&block[14] = v15;
        *(_WORD *)&block[22] = 2048;
        uint64_t v20 = v16;
        *(_WORD *)__int16 v21 = 2048;
        *(void *)&v21[2] = 2LL;
        *(_WORD *)&v21[10] = 2048;
        *(void *)&v21[12] = v17;
        _os_log_debug_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> will be canceled in %lld seconds; cnt = %lld",
          block,
          0x34u);
      }

      uint64_t v6 = mach_absolute_time();
      uint64_t v7 = *(void *)(a1 + 40) + 1LL;
      *(void *)(a1 + 32) = v6;
      *(void *)(a1 + 40) = v7;
      *(void *)block = MEMORY[0x1895FED80];
      *(void *)&block[8] = 0x40000000LL;
      *(void *)&block[16] = ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke_11;
      uint64_t v20 = &__block_descriptor_tmp_12;
      *(void *)__int16 v21 = a1;
      *(void *)&v21[8] = v6;
      dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
      dispatch_after(v8, (dispatch_queue_t)_container_xpc_invalidate_shared_connection_after_timeout_queue, block);
    }

    else
    {
      if (v3 != 1) {
        goto LABEL_8;
      }
      xpc_connection_cancel(*(xpc_connection_t *)a1);
    }
  }

  uint64_t v3 = *(void *)(a1 + 40);
LABEL_8:
  if (v3 <= 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 8);
      uint64_t v13 = *(void **)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)block = 134218752;
      *(void *)&block[4] = a1;
      *(_WORD *)&block[12] = 2048;
      *(void *)&block[14] = v12;
      *(_WORD *)&block[22] = 2048;
      uint64_t v20 = v13;
      *(_WORD *)__int16 v21 = 2048;
      *(void *)&v21[2] = v14;
      _os_log_debug_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> freed; cnt = %lld",
        block,
        0x2Au);
    }

    xpc_release(*(xpc_object_t *)a1);
    free((void *)a1);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
}

uint64_t ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke_11(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  os_unfair_lock_lock_with_options();
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) == *(void *)(a1 + 40) && !*(_BYTE *)(v2 + 25))
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = v9[1];
      uint64_t v11 = v9[2];
      uint64_t v12 = gSharedClientConnection[6 * v10 + v11];
      uint64_t v13 = v9[5];
      int v17 = 134219008;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      _os_log_debug_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld; %p> canceled after timeout; cnt = %lld",
        (uint8_t *)&v17,
        0x34u);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    *(_BYTE *)(v4 + 25) = 1;
    if (*(_BYTE *)(v4 + 24))
    {
      int v5 = &gSharedClientConnection[6 * *(void *)(v4 + 8) + *(void *)(v4 + 16)];
      if (v4 == *v5)
      {
        *int v5 = 0LL;
        --*(void *)(v4 + 40);
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v6 = (os_log_s *)qword_18C438D48;
        BOOL v7 = os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG);
        uint64_t v4 = *(void *)(a1 + 32);
        if (v7)
        {
          uint64_t v14 = *(void *)(v4 + 8);
          uint64_t v15 = *(void *)(v4 + 16);
          uint64_t v16 = *(void *)(v4 + 40);
          int v17 = 134218752;
          uint64_t v18 = (void *)v4;
          __int16 v19 = 2048;
          uint64_t v20 = v14;
          __int16 v21 = 2048;
          uint64_t v22 = v15;
          __int16 v23 = 2048;
          uint64_t v24 = v16;
          _os_log_debug_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_DEBUG,  "connection <%p/%lld/%lld> released (shared; canceler); cnt = %lld",
            (uint8_t *)&v17,
            0x2Au);
          uint64_t v4 = *(void *)(a1 + 32);
        }
      }
    }

    xpc_connection_cancel(*(xpc_connection_t *)v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  return container_xpc_release(*(void *)(a1 + 32));
}

dispatch_queue_t ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.containermanager connection release hysteresis", 0LL);
  _container_xpc_invalidate_shared_connection_after_timeout_queue = (uint64_t)result;
  return result;
}

void __container_xpc_create_connection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v3 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
  {
    if (a2 == MEMORY[0x189600930]) {
      uint64_t v4 = " interrupted";
    }
    else {
      uint64_t v4 = (const char *)&unk_1802B435E;
    }
    if (a2 == MEMORY[0x189600938]) {
      int v5 = " invalidation";
    }
    else {
      int v5 = v4;
    }
    int v6 = 136446210;
    BOOL v7 = v5;
    _os_log_debug_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_DEBUG,  "received superfluous connection%{public}s event, ignoring",  (uint8_t *)&v6,  0xCu);
  }

void container_xpc_invalidate_connection(uint64_t a1)
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    if (!*(_BYTE *)(a1 + 25)) {
      xpc_connection_cancel(*(xpc_connection_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  }

uint64_t container_xpc_get_raw_connection(uint64_t a1)
{
  return *(void *)a1;
}

void *container_references_create()
{
  uint64_t v0 = calloc(1uLL, 0x50uLL);
  v0[1] = _os_activity_create(&dword_18028C000, "container_references_t", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  *((_DWORD *)v0 + 18) = -1;
  return v0;
}

void container_references_set_class(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __container_references_set_class_block_invoke;
    block[3] = &__block_descriptor_tmp_328;
    block[4] = a2;
    void block[5] = "container_references_set_class";
    void block[6] = a1;
    os_activity_apply(v2, block);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      int v6 = "container_references_set_class";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }
  }

void __container_references_set_class_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  if ((unint64_t)(*(void *)(a1 + 32) - 1LL) >= 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 136315138;
      uint64_t v9 = v7;
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: invalid container class",  (uint8_t *)&v8,  0xCu);
    }

    int v5 = *(uint64_t **)(a1 + 48);
    int v6 = container_error_create(3LL, 20LL, 0LL, 0);
    _container_references_replace_error(v5, (uint64_t)v6);
  }

  else
  {
    _container_references_log_if_error(*(uint64_t **)(a1 + 48), *(void *)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
    *(void *)(v3 + 16) |= 1uLL;
    *(void *)(v3 + 24) = v2;
  }

void *_container_references_replace_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    container_error_reinitialize(v4, v5, *(void *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    dispatch_queue_t result = (void *)*a1;
  }

  else
  {
    dispatch_queue_t result = container_error_create(v5, *(void *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    *a1 = (uint64_t)result;
  }

  result[5] = a1;
  return result;
}

void _container_references_log_if_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      uint64_t v4 = container_error_copy_unlocalized_description(v2);
      uint64_t __s = v4;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v5 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136315394;
        uint64_t v8 = a2;
        __int16 v9 = 2080;
        uint64_t v10 = v4;
        _os_log_error_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_ERROR,  "WARNING: Calling %s with a references that has a previous error: %s",  buf,  0x16u);
        if (!v4) {
          return;
        }
      }

      else if (!v4)
      {
        return;
      }

      free(v4);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

void container_references_set_uid(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __container_references_set_uid_block_invoke;
    block[3] = &__block_descriptor_tmp_1_333;
    block[4] = a1;
    void block[5] = "container_references_set_uid";
    int v5 = a2;
    os_activity_apply(v2, block);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v7 = "container_references_set_uid";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }
  }

void __container_references_set_uid_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 32) = *(_DWORD *)(a1 + 48);
  *(void *)(v2 + 16) |= 2uLL;
}

void container_references_set_persona_unique_string(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __container_references_set_persona_unique_string_block_invoke;
    block[3] = &__block_descriptor_tmp_2_335;
    block[4] = a2;
    void block[5] = "container_references_set_persona_unique_string";
    void block[6] = a1;
    os_activity_apply(v2, block);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      int v6 = "container_references_set_persona_unique_string";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }
  }

char *__container_references_set_persona_unique_string_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (*(void *)(a1 + 32))
  {
    _container_references_log_if_error( *(uint64_t **)(a1 + 48),  (uint64_t)"container_references_set_persona_unique_string_block_invoke");
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void **)(v2 + 40);
    if (v3)
    {
      free(v3);
      memset_s((void *)(*(void *)(a1 + 48) + 40LL), 8uLL, 0, 8uLL);
      uint64_t v2 = *(void *)(a1 + 48);
    }

    dispatch_queue_t result = strndup(*(const char **)(a1 + 32), 0x400uLL);
    *(void *)(v2 + 40) = result;
    *(void *)(*(void *)(a1 + 48) + 16LL) |= 4uLL;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v5 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315138;
      uint64_t v10 = v8;
      _os_log_fault_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: persona_unique_string parameter is NULL",  (uint8_t *)&v9,  0xCu);
    }

    int v6 = *(uint64_t **)(a1 + 48);
    uint64_t v7 = container_error_create(3LL, 38LL, 0LL, 0);
    return (char *)_container_references_replace_error(v6, (uint64_t)v7);
  }

  return result;
}

void container_references_operation_set_flags(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __container_references_operation_set_flags_block_invoke;
    block[3] = &__block_descriptor_tmp_3_338;
    block[4] = a1;
    void block[5] = "container_references_operation_set_flags";
    void block[6] = a2;
    os_activity_apply(v2, block);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      int v6 = "container_references_operation_set_flags";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }
  }

void __container_references_operation_set_flags_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48LL) = *(void *)(a1 + 48);
}

void *container_references_free(void *result)
{
  uint64_t __s = (uint64_t)result;
  if (result)
  {
    __int128 v1 = result;
    uint64_t v3 = result + 5;
    uint64_t v2 = (void *)result[5];
    if (v2)
    {
      free(v2);
      memset_s(v3, 8uLL, 0, 8uLL);
    }

    uint64_t v4 = (void *)*v1;
    if (*v1)
    {
      void v4[5] = 0LL;
      container_error_free(v4);
      *__int128 v1 = 0LL;
    }

    int v5 = (void *)v1[8];
    if (v5)
    {
      container_free_client(v5);
      v1[8] = 0LL;
    }

    int v6 = (void *)v1[1];
    if (v6) {
      os_release(v6);
    }
    free(v1);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

uint64_t container_references_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  if (a1)
  {
    int v5 = *(os_activity_s **)(a1 + 8);
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 0x40000000LL;
    v9[2] = __container_references_add_block_invoke;
    v9[3] = &unk_189639FF0;
    v9[4] = &v10;
    v9[5] = a1;
    v9[6] = "container_references_add";
    void v9[7] = a2;
    v9[8] = a3;
    v9[9] = a4;
    os_activity_apply(v5, v9);
    container_log_ext_error( (uint64_t)"container_references_add",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    uint64_t v6 = v11[3];
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v15 = "container_references_add";
      _os_log_fault_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }

    uint64_t v6 = 0LL;
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

void *__container_references_add_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = _container_add_remove( *(void *)(a1 + 40),  0x30uLL,  *(xpc_object_t *)(a1 + 56),  *(void **)(a1 + 64),  *(void **)(a1 + 72),  *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void *_container_add_remove(uint64_t a1, uint64_t a2, xpc_object_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v100 = *MEMORY[0x1895FEE08];
  uint64_t v65 = 0LL;
  int v66 = 0LL;
  xpc_object_t object = 0LL;
  xpc_object_t objects = 0LL;
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v12, "Command", a2);
  xpc_dictionary_set_uint64(v12, "Flags", *(void *)(a1 + 48));
  xpc_dictionary_set_uint64(v12, "PrivateFlags", *(void *)(a1 + 56));
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13) {
    container_xpc_encode_client_onto_message(v12, v13);
  }
  xpc_dictionary_set_uint64(v12, "Explicit", *(void *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v14 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      v88[0] = a6;
      _os_log_fault_impl( &dword_18028C000,  v14,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container_query_set_class() is required",  buf,  0xCu);
    }

    uint64_t v15 = container_error_create(3LL, 38LL, 0LL, 0);
    uint64_t v16 = v15;
    BOOL v17 = 0;
    BOOL v18 = 0;
LABEL_22:
    uint64_t v27 = 0LL;
    __int16 v28 = 0LL;
LABEL_23:
    int v66 = v15;
    goto LABEL_24;
  }

  xpc_dictionary_set_uint64(v12, "ContainerClass", *(void *)(a1 + 24));
  uint64_t v19 = MEMORY[0x1896009B8];
  uint64_t v20 = MEMORY[0x189600958];
  if (a3)
  {
    xpc_object_t objects = a3;
    uint64_t v21 = MEMORY[0x186DF9184](a3);
    BOOL v18 = v21 == v19;
    if (v21 == v19)
    {
      int v22 = 1;
      a3 = xpc_array_create(&objects, 1uLL);
      xpc_object_t objects = a3;
    }

    else
    {
      int v22 = 0;
    }

    if (MEMORY[0x186DF9184](a3) != v20)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v26 = (os_log_s *)container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        v88[0] = a6;
        _os_log_fault_impl( &dword_18028C000,  v26,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: owner_identifiers is not an array or string",  buf,  0xCu);
      }

      uint64_t v15 = container_error_create(3LL, 38LL, 0LL, 0);
      uint64_t v16 = v15;
      BOOL v17 = 0;
      goto LABEL_22;
    }

    xpc_dictionary_set_value(v12, "OwnerIdentifiersArray", objects);
    if (!a4) {
      goto LABEL_42;
    }
  }

  else
  {
    int v22 = 0;
    if (!a4)
    {
LABEL_42:
      int v24 = 0;
      goto LABEL_51;
    }
  }

  xpc_object_t object = a4;
  uint64_t v23 = MEMORY[0x186DF9184](a4);
  BOOL v17 = v23 == v19;
  if (v23 == v19)
  {
    int v24 = 1;
    xpc_object_t v25 = xpc_array_create(&object, 1uLL);
    xpc_object_t object = v25;
  }

  else
  {
    int v24 = 0;
    xpc_object_t v25 = object;
  }

  if (MEMORY[0x186DF9184](v25) != v20)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v31 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      v88[0] = a6;
      _os_log_fault_impl( &dword_18028C000,  v31,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: group_identifiers is not an array or string",  buf,  0xCu);
    }

    uint64_t v16 = container_error_create(3LL, 38LL, 0LL, 0);
    uint64_t v27 = 0LL;
    __int16 v28 = 0LL;
    int v66 = v16;
    BOOL v18 = v22 != 0;
    goto LABEL_24;
  }

  xpc_dictionary_set_value(v12, "GroupIdentifiers", object);
LABEL_51:
  int v32 = 0;
  unint64_t v33 = *(void *)(a1 + 24);
  if (v33 <= 0xE && ((1LL << v33) & 0x4ED4) != 0)
  {
    if ((*(_BYTE *)(a1 + 16) & 2) != 0)
    {
      xpc_dictionary_set_uint64(v12, "UID", *(unsigned int *)(a1 + 32));
      int v32 = *(_DWORD *)(a1 + 32);
    }

    else
    {
      int v32 = 0;
    }
  }

  if ((*(_BYTE *)(a1 + 16) & 4) != 0)
  {
    __int128 v34 = *(const char **)(a1 + 40);
    if (v34) {
      xpc_dictionary_set_string(v12, "PersonaUniqueString", v34);
    }
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (!os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_71;
  }
  __int128 v35 = (void *)MEMORY[0x186DF907C](v12);
  uint64_t __s = v35;
  unint64_t v36 = *(void *)(a1 + 24);
  if ((v36 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v36 <= 8 && ((1LL << v36) & 0x12A) != 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v37 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
    {
      uid_t v38 = geteuid();
      uid_t v39 = getuid();
      *(_DWORD *)stat buf = 67109634;
      LODWORD(v88[0]) = v38;
      WORD2(v88[0]) = 1024;
      *(_DWORD *)((char *)v88 + 6) = v39;
      WORD1(v88[1]) = 2080;
      *(void *)((char *)&v88[1] + 4) = v35;
      _os_log_impl( &dword_18028C000,  v37,  OS_LOG_TYPE_DEFAULT,  "References query; eunsigned int uid = %d, unsigned int uid = %d, query = %s",
        buf,
        0x18u);
    }

    if (!v35) {
      goto LABEL_71;
    }
  }

  else
  {
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v97 = 0u;
    int current_persona_originator_info = voucher_get_current_persona_originator_info();
    int v59 = DWORD2(v97);
    int v60 = current_persona_originator_info;
    int v58 = DWORD1(v98);
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    __int128 v94 = 0u;
    int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    int v56 = DWORD2(v94);
    int v57 = current_persona_proximate_info;
    int v55 = DWORD1(v95);
    uint64_t v93 = 0LL;
    memset(v92, 0, sizeof(v92));
    __int128 v91 = 0u;
    __int128 v90 = 0u;
    __int128 v89 = 0u;
    memset(v88, 0, sizeof(v88));
    *(_DWORD *)stat buf = 2;
    int current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      __int128 v52 = "NOPERSONA";
      __int128 v53 = "<unknown>";
    }

    else
    {
      else {
        __int16 v47 = (&off_18963AFA8)[HIDWORD(v88[0]) - 2];
      }
      __int128 v52 = v47;
      __int128 v53 = &v92[4];
    }

    int v48 = v24;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v49 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT))
    {
      uid_t v50 = geteuid();
      uid_t v51 = getuid();
      *(_DWORD *)int v67 = 67111426;
      int v68 = current_persona;
      __int16 v69 = 2082;
      uint64_t v70 = v52;
      __int16 v71 = 2082;
      int v72 = v53;
      __int16 v73 = 1024;
      int v74 = v59 & ~(v60 >> 31);
      __int16 v75 = 1024;
      int v76 = v58 & ~(v60 >> 31);
      __int16 v77 = 1024;
      int v78 = v56 & ~(v57 >> 31);
      __int16 v79 = 1024;
      int v80 = v55 & ~(v57 >> 31);
      __int16 v81 = 1024;
      uid_t v82 = v50;
      __int16 v83 = 1024;
      uid_t v84 = v51;
      __int16 v85 = 2080;
      int v86 = v35;
      _os_log_impl( &dword_18028C000,  v49,  OS_LOG_TYPE_DEFAULT,  "References query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proxi"
        "mate [pid = %d, personaid = %d], eunsigned int uid = %d, unsigned int uid = %d, query = %s",
        v67,
        0x4Au);
    }

    int v24 = v48;
    if (!v35) {
      goto LABEL_71;
    }
  }

  free(v35);
  memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_71:
  uint64_t v40 = *(void *)(a1 + 24);
  if ((v40 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    int v41 = 1;
  }

  else
  {
    unint64_t v42 = v40 - 1;
    if (v42 > 0xD) {
      int v41 = 0;
    }
    else {
      int v41 = dword_1802B1D74[v42];
    }
  }

  __int16 v43 = (void *)container_xpc_send_sync_message(v41, 0LL, v12, 1, v32, a1 + 72, (uint64_t)&v66);
  uint64_t v27 = v43;
  BOOL v17 = v24 != 0;
  BOOL v18 = v22 != 0;
  if (v43)
  {
    xpc_object_t value = xpc_dictionary_get_value(v43, "ReplyContainersArray");
    uint64_t v61 = 1LL;
    __int16 v28 = container_xpc_decode_create_container_object_array(value, &v65, &v61);
    if (!v28)
    {
      uint64_t v15 = container_error_create(2LL, v61, 0LL, 0);
      uint64_t v16 = v15;
      goto LABEL_23;
    }
  }

  else
  {
    __int16 v28 = 0LL;
  }

  uint64_t v16 = v66;
LABEL_24:
  if (v16)
  {
    _container_references_replace_error((uint64_t *)a1, (uint64_t)v16);
    xpc_object_t v29 = v66;
  }

  else
  {
    xpc_object_t v29 = 0LL;
  }

  container_error_free(v29);
  if (a5) {
    *a5 = v65;
  }
  if (v12) {
    xpc_release(v12);
  }
  if (v27) {
    xpc_release(v27);
  }
  if (v18)
  {
    if (objects) {
      xpc_release(objects);
    }
    xpc_object_t objects = 0LL;
  }

  if (v17 && object) {
    xpc_release(object);
  }
  return v28;
}

uint64_t container_references_remove(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  if (a1)
  {
    int v5 = *(os_activity_s **)(a1 + 8);
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 0x40000000LL;
    v9[2] = __container_references_remove_block_invoke;
    v9[3] = &unk_18963A018;
    v9[4] = &v10;
    v9[5] = a1;
    v9[6] = "container_references_remove";
    void v9[7] = a2;
    v9[8] = a3;
    v9[9] = a4;
    os_activity_apply(v5, v9);
    container_log_ext_error( (uint64_t)"container_references_remove",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    uint64_t v6 = v11[3];
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v15 = "container_references_remove";
      _os_log_fault_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }

    uint64_t v6 = 0LL;
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

void *__container_references_remove_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = _container_add_remove( *(void *)(a1 + 40),  0x31uLL,  *(xpc_object_t *)(a1 + 56),  *(void **)(a1 + 64),  *(void **)(a1 + 72),  *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

BOOL container_references_iterate_by_owner_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  if (a1)
  {
    uint64_t v4 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[2] = __container_references_iterate_by_owner_sync_block_invoke;
    block[3] = &unk_18963A040;
    block[1] = 0x40000000LL;
    void block[6] = a1;
    void block[7] = "container_references_iterate_by_owner_sync";
    block[8] = a2;
    block[4] = a3;
    void block[5] = &v9;
    os_activity_apply(v4, block);
    container_log_ext_error( (uint64_t)"container_references_iterate_by_owner_sync",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    BOOL v5 = *((_BYTE *)v10 + 24) != 0;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v14 = "container_references_iterate_by_owner_sync";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }

    BOOL v5 = 0LL;
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_references_iterate_by_owner_sync_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  *(void *)(v2 + 56) = 1LL;
  uint64_t result = _container_references_query_execute(v2, *(xpc_object_t *)(a1 + 64), 0LL, v3, *(void *)(a1 + 32));
  if ((_DWORD)result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t _container_references_query_execute(uint64_t a1, xpc_object_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v111 = *MEMORY[0x1895FEE08];
  xpc_object_t objects = 0LL;
  __int16 v79 = 0LL;
  xpc_object_t value = 0LL;
  if (!a1) {
    return 0LL;
  }
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "Command", 0x2FuLL);
  xpc_dictionary_set_uint64(v10, "Flags", *(void *)(a1 + 48));
  xpc_dictionary_set_uint64(v10, "PrivateFlags", *(void *)(a1 + 56));
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11) {
    container_xpc_encode_client_onto_message(v10, v11);
  }
  xpc_dictionary_set_uint64(v10, "Explicit", *(void *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    char v12 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_fault_impl( &dword_18028C000,  v12,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container_query_set_class() is required",  buf,  0xCu);
    }

    uint64_t v13 = container_error_create(3LL, 38LL, 0LL, 0);
    uint64_t v14 = v13;
    BOOL v15 = 0;
    BOOL v16 = 0;
    goto LABEL_24;
  }

  xpc_dictionary_set_uint64(v10, "ContainerClass", *(void *)(a1 + 24));
  uint64_t v18 = MEMORY[0x1896009B8];
  uint64_t v19 = MEMORY[0x189600958];
  if (!a2)
  {
    int v21 = 0;
    if (!a3)
    {
LABEL_27:
      int v23 = 0;
      goto LABEL_37;
    }

LABEL_15:
    xpc_object_t value = a3;
    uint64_t v22 = MEMORY[0x186DF9184](a3);
    BOOL v15 = v22 == v18;
    if (v22 == v18)
    {
      int v23 = 1;
      xpc_object_t v24 = xpc_array_create(&value, 1uLL);
      xpc_object_t value = v24;
    }

    else
    {
      int v23 = 0;
      xpc_object_t v24 = value;
    }

    if (MEMORY[0x186DF9184](v24) != v19)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v27 = (os_log_s *)container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        *(void *)&uint8_t buf[4] = a4;
        _os_log_fault_impl( &dword_18028C000,  v27,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: group_identifiers is not an array or string",  buf,  0xCu);
      }

      uint64_t v14 = container_error_create(3LL, 38LL, 0LL, 0);
      uint64_t v26 = 0LL;
      uint64_t v17 = 0LL;
      __int16 v79 = v14;
      BOOL v16 = v21 != 0;
      if (!v14) {
        goto LABEL_35;
      }
      goto LABEL_76;
    }

    xpc_dictionary_set_value(v10, "GroupIdentifiers", value);
LABEL_37:
    int v29 = 0;
    unint64_t v30 = *(void *)(a1 + 24);
    if (v30 <= 0xE && ((1LL << v30) & 0x4ED4) != 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 2) != 0)
      {
        xpc_dictionary_set_uint64(v10, "UID", *(unsigned int *)(a1 + 32));
        int v29 = *(_DWORD *)(a1 + 32);
      }

      else
      {
        int v29 = 0;
      }
    }

    if ((*(_BYTE *)(a1 + 16) & 4) != 0)
    {
      __int128 v31 = *(const char **)(a1 + 40);
      if (v31) {
        xpc_dictionary_set_string(v10, "PersonaUniqueString", v31);
      }
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    if (!os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT))
    {
LABEL_58:
      uint64_t v40 = *(void *)(a1 + 24);
      if ((v40 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        int v41 = 1;
      }

      else
      {
        unint64_t v42 = v40 - 1;
        if (v42 > 0xD) {
          int v41 = 0;
        }
        else {
          int v41 = dword_1802B1D74[v42];
        }
      }

      __int16 v43 = (void *)container_xpc_send_sync_message(v41, 0LL, v10, 1, v29, a1 + 72, (uint64_t)&v79);
      uint64_t v26 = v43;
      BOOL v15 = v23 != 0;
      BOOL v16 = v21 != 0;
      if (v43)
      {
        xpc_object_t object = xpc_retain(v43);
        xpc_object_t array = xpc_dictionary_get_array(v26, "ReplyOwnerIdentifiers");
        BOOL v73 = v21 != 0;
        BOOL v75 = v23 != 0;
        if (array
          && (__int16 v45 = array, (v46 = xpc_dictionary_get_array(v26, "ReplyGroupIdentifiers")) != 0LL)
          && (__int16 v47 = v46,
              *(void *)stat buf = 0LL,
              (data = (char *)xpc_dictionary_get_data(v26, "ReplyFacts", (size_t *)buf)) != 0LL))
        {
          if (*(void *)buf >= 0x10uLL)
          {
            uint64_t v51 = a5;
            uint64_t v52 = (*(void *)buf >> 4) - 1LL;
            __int128 v53 = (size_t *)(data + 8);
            int v49 = 0LL;
            do
            {
              string = xpc_array_get_string(v45, *(v53 - 1));
              int v55 = xpc_array_get_string(v47, *v53);
              uint64_t v56 = (*(uint64_t (**)(uint64_t, const char *, const char *))(v51 + 16))(v51, string, v55);
              uint64_t v17 = v56;
              BOOL v58 = v52-- != 0;
              if (!(_DWORD)v56) {
                break;
              }
              v53 += 2;
            }

            while (v58);
          }

          else
          {
            int v49 = 0LL;
            uint64_t v17 = 1LL;
          }
        }

        else
        {
          int v49 = container_error_create(2LL, 53LL, 0LL, 0);
          uint64_t v17 = 0LL;
        }

        if (object) {
          xpc_release(object);
        }
        BOOL v16 = v73;
        BOOL v15 = v75;
        if ((v17 & 1) == 0) {
          __int16 v79 = v49;
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      uint64_t v14 = v79;
      if (!v79) {
        goto LABEL_35;
      }
LABEL_76:
      _container_references_replace_error((uint64_t *)a1, (uint64_t)v14);
      uint64_t v17 = 0LL;
      __int16 v28 = v79;
      goto LABEL_77;
    }

    uint64_t __s = (void *)MEMORY[0x186DF907C](v10);
    unint64_t v32 = *(void *)(a1 + 24);
    if ((v32 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v32 <= 8 && ((1LL << v32) & 0x12A) != 0)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v33 = qword_18C438D48;
      if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_56;
      }
      uid_t v34 = geteuid();
      uid_t v35 = getuid();
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v35;
      *(_WORD *)&buf[14] = 2080;
      *(void *)&uint8_t buf[16] = __s;
      v36 = "References query; eunsigned int uid = %d, unsigned int uid = %d, query = %s";
      __int128 v37 = buf;
      uid_t v38 = (os_log_s *)v33;
      uint32_t v39 = 24;
    }

    else
    {
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v108 = 0u;
      int current_persona_originator_info = voucher_get_current_persona_originator_info();
      int v74 = DWORD2(v108);
      int objecta = DWORD1(v109);
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      __int128 v105 = 0u;
      int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
      int v69 = DWORD2(v105);
      int v70 = current_persona_proximate_info;
      int v68 = DWORD1(v106);
      uint64_t v104 = 0LL;
      memset(v103, 0, sizeof(v103));
      __int128 v102 = 0u;
      __int128 v101 = 0u;
      __int128 v100 = 0u;
      memset(&buf[4], 0, 32);
      *(_DWORD *)stat buf = 2;
      int current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        int v66 = "<unknown>";
        int v67 = "NOPERSONA";
      }

      else
      {
        else {
          __int128 v62 = (&off_18963AFA8)[*(_DWORD *)&buf[8] - 2];
        }
        int v67 = v62;
        int v66 = &v103[4];
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v63 = qword_18C438D50;
      if (!os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_56;
      }
      uid_t v64 = geteuid();
      uid_t v65 = getuid();
      v80[0] = 67111426;
      v80[1] = current_persona;
      __int16 v81 = 2082;
      uid_t v82 = v67;
      __int16 v83 = 2082;
      uid_t v84 = v66;
      __int16 v85 = 1024;
      int v86 = v74 & ~(current_persona_originator_info >> 31);
      __int16 v87 = 1024;
      int v88 = objecta & ~(current_persona_originator_info >> 31);
      __int16 v89 = 1024;
      int v90 = v69 & ~(v70 >> 31);
      __int16 v91 = 1024;
      int v92 = v68 & ~(v70 >> 31);
      __int16 v93 = 1024;
      uid_t v94 = v64;
      __int16 v95 = 1024;
      uid_t v96 = v65;
      __int16 v97 = 2080;
      __int128 v98 = __s;
      unint64_t v36 = "References query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], p"
            "roximate [pid = %d, personaid = %d], eunsigned int uid = %d, unsigned int uid = %d, query = %s";
      __int128 v37 = (uint8_t *)v80;
      uid_t v38 = (os_log_s *)v63;
      uint32_t v39 = 74;
    }

    _os_log_impl(&dword_18028C000, v38, OS_LOG_TYPE_DEFAULT, v36, v37, v39);
LABEL_56:
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

    goto LABEL_58;
  }

  xpc_object_t objects = a2;
  uint64_t v20 = MEMORY[0x186DF9184](a2);
  BOOL v16 = v20 == v18;
  if (v20 == v18)
  {
    int v21 = 1;
    a2 = xpc_array_create(&objects, 1uLL);
    xpc_object_t objects = a2;
  }

  else
  {
    int v21 = 0;
  }

  if (MEMORY[0x186DF9184](a2) == v19)
  {
    xpc_dictionary_set_value(v10, "OwnerIdentifiersArray", objects);
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_15;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  xpc_object_t v25 = (os_log_s *)container_log_handle_for_category_logHandles;
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    *(void *)&uint8_t buf[4] = a4;
    _os_log_fault_impl( &dword_18028C000,  v25,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: owner_identifiers is not an array or string",  buf,  0xCu);
  }

  uint64_t v13 = container_error_create(3LL, 38LL, 0LL, 0);
  uint64_t v14 = v13;
  BOOL v15 = 0;
LABEL_24:
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  __int16 v79 = v13;
  if (v14) {
    goto LABEL_76;
  }
LABEL_35:
  __int16 v28 = 0LL;
LABEL_77:
  container_error_free(v28);
  if (v10) {
    xpc_release(v10);
  }
  if (v26) {
    xpc_release(v26);
  }
  if (v16)
  {
    if (objects) {
      xpc_release(objects);
    }
    xpc_object_t objects = 0LL;
  }

  if (v15 && value) {
    xpc_release(value);
  }
  return v17;
}

  if (*(void *)(*(void *)(a1[5] + 8) + 24LL) != 1LL)
  {
    uint64_t v11 = a1[4];
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }

  if (v7) {
    xpc_release(v7);
  }
  if (v8) {
    xpc_release(v8);
  }
  if (v9) {
    xpc_release(v9);
  }
  if (v10) {
    xpc_release(v10);
  }
}

BOOL container_references_iterate_by_group_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v9 = 0LL;
  xpc_object_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  if (a1)
  {
    uint64_t v4 = *(os_activity_s **)(a1 + 8);
    block[0] = MEMORY[0x1895FED80];
    block[2] = __container_references_iterate_by_group_sync_block_invoke;
    block[3] = &unk_18963A068;
    block[1] = 0x40000000LL;
    void block[6] = a1;
    void block[7] = "container_references_iterate_by_group_sync";
    block[8] = a2;
    block[4] = a3;
    void block[5] = &v9;
    os_activity_apply(v4, block);
    container_log_ext_error( (uint64_t)"container_references_iterate_by_group_sync",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    BOOL v5 = *((_BYTE *)v10 + 24) != 0;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v14 = "container_references_iterate_by_group_sync";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: references parameter is NULL",  buf,  0xCu);
    }

    BOOL v5 = 0LL;
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_references_iterate_by_group_sync_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  *(void *)(v2 + 56) = *(void *)(v2 + 56) & 0xFFFFFFFFFFFFFFFCLL | 2;
  uint64_t result = _container_references_query_execute(v2, 0LL, *(void **)(a1 + 64), v3, *(void *)(a1 + 32));
  if ((_DWORD)result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t container_references_get_last_error(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _container_references_get_servicing_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

void container_xpc_send_message(int a1, void *a2, xpc_object_t xdict, int a4, char a5, uint64_t a6)
{
  if (!xpc_dictionary_get_value(xdict, "ProxyForClient"))
  {
    if (_container_xpc_pthread_key_for_client_context_key)
    {
      char v12 = pthread_getspecific(_container_xpc_pthread_key_for_client_context_key);
      if (v12) {
        container_xpc_encode_client_onto_message(xdict, (uint64_t)v12);
      }
    }
  }

  if (_outgoingPostprocessor) {
    (*(void (**)(void))(_outgoingPostprocessor + 16))();
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3800000000LL;
  BOOL v19 = (a5 & 3) == 2LL;
  __int128 v20 = xmmword_1802B1DB0;
  uint64_t v21 = 0x600000000LL;
  uint64_t v13 = (void (**)(uint64_t, int, void *, void *, int, char, uint64_t))_outgoingSender;
  uint64_t v14 = MEMORY[0x1895FED80];
  do
  {
    v15[0] = v14;
    v15[1] = 0x40000000LL;
    v15[2] = __container_xpc_send_message_block_invoke;
    v15[3] = &unk_18963A090;
    v15[4] = a6;
    v15[5] = &v16;
    v13[2]((uint64_t)v13, a1, a2, xdict, a4, a5, (uint64_t)v15);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
}

void __container_xpc_send_message_block_invoke(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    return;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  xpc_object_t xdict = object;
  int v8 = *(unsigned __int8 *)(v7 + 24);
  if (*(_BYTE *)(v7 + 24)) {
    *(_BYTE *)(v7 + 24) = 0;
  }
  uint64_t v9 = _incomingPreprocessor;
  if (_incomingPreprocessor)
  {
    xpc_retain(object);
    (*(void (**)(uint64_t, xpc_object_t *))(v9 + 16))(v9, &xdict);
    xpc_object_t object = xdict;
  }

  uint64_t v10 = MEMORY[0x186DF9184](object);
  if (v10 == MEMORY[0x189600998] && xdict == (xpc_object_t)MEMORY[0x189600938])
  {
    if (v8)
    {
      unsigned int v17 = *(_DWORD *)(v7 + 36);
      if (v17 < *(_DWORD *)(v7 + 40))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 36) = v17 + 1;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v13 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          int v18 = *(_DWORD *)(v7 + 36);
          int v19 = *(_DWORD *)(v7 + 40);
          *(_DWORD *)stat buf = 67109376;
          int v30 = v18;
          __int16 v31 = 1024;
          int v32 = v19;
          uint64_t v16 = "XPC connection to containermanagerd invalidated. Retry attempt %d of %d";
          goto LABEL_25;
        }

LABEL_48:
        if (*(_BYTE *)(v7 + 24)) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }
    }

    uint64_t v20 = 51LL;
    goto LABEL_31;
  }

  if (v10 == MEMORY[0x189600998] && xdict == (xpc_object_t)MEMORY[0x189600930])
  {
    if (v8)
    {
      unsigned int v12 = *(_DWORD *)(v7 + 28);
      if (v12 < *(_DWORD *)(v7 + 32))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 28) = v12 + 1;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v13 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          int v14 = *(_DWORD *)(v7 + 28);
          int v15 = *(_DWORD *)(v7 + 32);
          *(_DWORD *)stat buf = 67109376;
          int v30 = v14;
          __int16 v31 = 1024;
          int v32 = v15;
          uint64_t v16 = "XPC connection to containermanagerd interrupted. Retry attempt %d of %d";
LABEL_25:
          _os_log_error_impl(&dword_18028C000, v13, OS_LOG_TYPE_ERROR, v16, buf, 0xEu);
          goto LABEL_48;
        }

        goto LABEL_48;
      }
    }

    uint64_t v20 = 52LL;
    goto LABEL_31;
  }

  if (v10 == MEMORY[0x189600998] && xdict == (xpc_object_t)MEMORY[0x189600948])
  {
    uint64_t v20 = 101LL;
LABEL_31:
    uint64_t v21 = container_error_create(2LL, v20, 0LL, 0);
    goto LABEL_32;
  }

  uint64_t v20 = 50LL;
  if (v10 != MEMORY[0x189600980] || MEMORY[0x189600998] == MEMORY[0x189600980]) {
    goto LABEL_31;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "ReplyErrorExtended");
  if (!dictionary) {
    goto LABEL_47;
  }
  int v23 = container_xpc_decode_error(dictionary, 1);
  uint64_t v21 = v23;
  if (v8 && v23)
  {
    if (*v23 == 107LL)
    {
      unsigned int v24 = *(_DWORD *)(v7 + 44);
      if (v24 < *(_DWORD *)(v7 + 48))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 44) = v24 + 1;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        xpc_object_t v25 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          int v26 = *(_DWORD *)(v7 + 44);
          int v27 = *(_DWORD *)(v7 + 48);
          *(_DWORD *)stat buf = 67109376;
          int v30 = v26;
          __int16 v31 = 1024;
          int v32 = v27;
          _os_log_error_impl( &dword_18028C000,  v25,  OS_LOG_TYPE_ERROR,  "containermanagerd state reset, retry requested. Retry attempt %d of %d",  buf,  0xEu);
        }

        container_error_free(v21);
        goto LABEL_48;
      }
    }

LABEL_33:
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0LL, 0LL, v21);
    container_error_free(v21);
    if (v8) {
      *(_BYTE *)(v7 + 24) = 0;
    }
    goto LABEL_50;
  }

  __int16 v28 = *(_DWORD *)v16;
  uint64_t v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 13) = v28;
  if ((v15 & 0x400000) == 0)
  {
LABEL_15:
    if ((v15 & 0x2000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }

void _block_invoke(uint64_t a1, int a2, void *a3, void *a4, int a5, char a6, uint64_t a7)
{
  if ((a2 - 2) >= 2)
  {
    if (a2)
    {
      if (a2 == 1)
      {
        uint64_t v12 = 1LL;
LABEL_23:
        int v15 = 1;
        goto LABEL_24;
      }

      uint64_t v16 = container_error_create(3LL, 38LL, 0LL, 0);
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned int v17 = (os_log_s *)qword_18C438D48;
      if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        if (v16)
        {
LABEL_19:
          (*(void (**)(uint64_t, void, void, void *))(a7 + 16))(a7, 0LL, 0LL, v16);
          int v19 = v16;
LABEL_35:
          container_error_free(v19);
          return;
        }

LABEL_22:
        uint64_t v12 = 0LL;
        goto LABEL_23;
      }

      LOWORD(v28[0]) = 0;
      int v18 = "Undefined disposition value.";
    }

    else
    {
      uint64_t v16 = container_error_create(3LL, 74LL, 0LL, 0);
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned int v17 = (os_log_s *)qword_18C438D48;
      if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      LOWORD(v28[0]) = 0;
      int v18 = "Disposition unsupported.";
    }

    _os_log_error_impl(&dword_18028C000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)v28, 2u);
    if (v16) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }

  uid_t v13 = getuid();
  uint64_t v12 = 0LL;
  if (a5) {
    BOOL v14 = v13 == a5;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = v14;
LABEL_24:
  uint64_t v29 = 1LL;
  if (gContainerXPCUsesSharedConnection) {
    BOOL v20 = v15 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20) {
    uint64_t v21 = (xpc_connection_t *)container_xpc_create_connection((void *)v12, a3, a5, &v29);
  }
  else {
    uint64_t v21 = (xpc_connection_t *)container_xpc_shared_copy_connection(v12, (uint64_t)a3, &v29);
  }
  uint64_t v22 = (uint64_t)v21;
  if (!v21)
  {
    int v26 = container_error_create(2LL, v29, 0LL, 0);
    (*(void (**)(uint64_t, void, void, void *))(a7 + 16))(a7, 0LL, 0LL, v26);
    int v19 = v26;
    goto LABEL_35;
  }

  int v23 = *v21;
  if ((a6 & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v28[0] = MEMORY[0x1895FED80];
    v28[1] = 0x40000000LL;
    v28[2] = ___container_xpc_default_sender_block_invoke;
    v28[3] = &unk_18963A160;
    v28[4] = a7;
    v28[5] = v22;
    xpc_connection_send_message_with_reply(v23, a4, global_queue, v28);
  }

  else
  {
    xpc_object_t v24 = xpc_connection_send_message_with_reply_sync(*v21, a4);
    uint64_t pid = xpc_connection_get_pid(v23);
    (*(void (**)(uint64_t, xpc_object_t, uint64_t, void))(a7 + 16))(a7, v24, pid, 0LL);
    container_xpc_release(v22);
    if (v24) {
      xpc_release(v24);
    }
  }

        if (_container_log_replication_enable_to_uid_relative_path_onceToken != -1) {
          dispatch_once(&_container_log_replication_enable_to_uid_relative_path_onceToken, &__block_literal_global_30);
        }
        do
          uint64_t v12 = __ldaxr(_container_log_replication_enable_to_uid_relative_path_enabled);
        while (__stlxr(v12 | 1, _container_log_replication_enable_to_uid_relative_path_enabled));
        os_trace_get_mode();
        os_trace_set_mode();
        goto LABEL_26;
      }
    }

    else if (!v10)
    {
      goto LABEL_21;
    }

    free(v10);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_21;
  }

  asprintf(&v14, "%s/%s.log", (const char *)v15, a2);
  if (v14)
  {
    _container_log_replication_enable_to_uid_relative_path_log_fd = (*((uint64_t (**)(char *, uint64_t, uint64_t, void))gCMFSSeam
                                                                     + 65))( v14,  521LL,  4LL,  0LL);
    uint64_t v7 = __error();
    if (_container_log_replication_enable_to_uid_relative_path_log_fd < 0)
    {
      int v8 = *v7;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v9 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v18) = v8;
        _os_log_fault_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_FAULT,  "Log replication failed to open output stream; error = %{darwin.errno}d",
          buf,
          8u);
      }

      goto LABEL_26;
    }

    goto LABEL_22;
  }

    container_log_ext_error( (uint64_t)"container_query_iterate_results_sync",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v10 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "container_query_iterate_results_sync";
      _os_log_fault_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&buf,  0xCu);
    }

    return 0;
  }

  return v7;
}

void ___container_xpc_default_sender_block_invoke(uint64_t a1)
{
}

uint64_t container_xpc_get_outgoing_message_postprocess_block()
{
  return _outgoingPostprocessor;
}

void *container_xpc_get_outgoing_message_send_block()
{
  return _outgoingSender;
}

uint64_t container_xpc_send_sync_message(int a1, void *a2, void *a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = 0LL;
  uid_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  if (a4) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  v11[2] = __container_xpc_send_sync_message_block_invoke;
  v11[3] = &unk_18963A0B8;
  v11[5] = a6;
  v11[6] = a7;
  v11[4] = &v12;
  container_xpc_send_message(a1, a2, a3, a5, v8, (uint64_t)v11);
  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

xpc_object_t __container_xpc_send_sync_message_block_invoke( uint64_t a1, xpc_object_t object, int a3, uint64_t a4)
{
  uint64_t v6 = *(_DWORD **)(a1 + 40);
  if (v6) {
    *uint64_t v6 = a3;
  }
  if (a4 && *(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = container_error_create( *(void *)(a4 + 8),  *(void *)a4,  *(char **)(a4 + 16),  *(_DWORD *)(a4 + 24));
  }
  if (object) {
    xpc_object_t result = xpc_retain(object);
  }
  else {
    xpc_object_t result = 0LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_xpc_send_sync_message_with_object(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  int v9 = 0;
  int v7 = container_disposition(a1, &v9);
  return container_xpc_send_sync_message(v7, 0LL, a2, a3, v9, 0LL, a4);
}

uint64_t container_xpc_set_client_context_during_block(void *a1, uint64_t a2)
{
  if (_container_xpc_pthread_key_for_client_context_onceToken != -1) {
    dispatch_once(&_container_xpc_pthread_key_for_client_context_onceToken, &__block_literal_global_8);
  }
  pthread_key_t v4 = _container_xpc_pthread_key_for_client_context_key;
  if (!_container_xpc_pthread_key_for_client_context_key) {
    return 147LL;
  }
  pthread_setspecific(_container_xpc_pthread_key_for_client_context_key, a1);
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  pthread_setspecific(v4, 0LL);
  return 1LL;
}

void ___container_xpc_pthread_key_for_client_context_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  int v0 = pthread_key_create((pthread_key_t *)&_container_xpc_pthread_key_for_client_context_key, 0LL);
  if (v0)
  {
    int v1 = v0;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v2 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_FAULT))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "Failed to create pthread key. container_perform_with_client_context() cannot continue; errno = %{darwin.errno}d",
        (uint8_t *)v3,
        8u);
    }
  }

void container_xpc_set_outgoing_message_postprocess_block(const void *a1)
{
  if (a1) {
    int v1 = _Block_copy(a1);
  }
  else {
    int v1 = 0LL;
  }
  if (_outgoingPostprocessor) {
    _Block_release((const void *)_outgoingPostprocessor);
  }
  _outgoingPostprocessor = (uint64_t)v1;
}

uint64_t container_xpc_get_incoming_reply_preprocess_block()
{
  return _incomingPreprocessor;
}

void container_xpc_set_incoming_reply_preprocess_block(const void *a1)
{
  if (a1) {
    int v1 = _Block_copy(a1);
  }
  else {
    int v1 = 0LL;
  }
  if (_incomingPreprocessor) {
    _Block_release((const void *)_incomingPreprocessor);
  }
  _incomingPreprocessor = (uint64_t)v1;
}

void container_xpc_set_outgoing_message_send_block(const void *a1)
{
  int v1 = &__block_literal_global_382;
  if (a1 && a1 != &__block_literal_global_382) {
    int v1 = _Block_copy(a1);
  }
  if (_outgoingSender != &__block_literal_global_382) {
    _Block_release(_outgoingSender);
  }
  _outgoingSender = v1;
}

xpc_object_t container_entitlements_copy_container_identifiers( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  xpc_object_t v8 = xpc_array_create(0LL, 0LL);
  if (a4)
  {
    if (!a3)
    {
      switch(a2)
      {
        case 1LL:
        case 2LL:
        case 4LL:
        case 14LL:
          xpc_object_t v14 = xpc_string_create(a1);
          xpc_array_append_value(v8, v14);
          if (v14) {
            goto LABEL_34;
          }
          return v8;
        case 7LL:
          uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.security.application-groups");
          if (v15)
          {
            uint64_t v16 = v15;
            _container_entitlements_append_strings_to_array(v8, v15);
            xpc_release(v16);
          }

          unsigned int v17 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.private.security.restricted-application-groups");
          goto LABEL_32;
        case 10LL:
          int v18 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.private.security.daemon-container");
          goto LABEL_25;
        case 12LL:
          int v18 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.security.system-container");
LABEL_25:
          if (!v18) {
            return v8;
          }
          xpc_object_t v14 = v18;
          if (!xpc_BOOL_get_value(v18)) {
            return v8;
          }
          xpc_object_t v19 = xpc_string_create(a1);
          xpc_array_append_value(v8, v19);
          if (v19) {
            xpc_release(v19);
          }
          goto LABEL_34;
        case 13LL:
          BOOL v20 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.security.system-groups");
          if (v20)
          {
            uint64_t v21 = v20;
            _container_entitlements_append_strings_to_array(v8, v20);
            uint64_t v22 = v21;
          }

          else
          {
            unsigned int v17 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))( a4,  "com.apple.security.system-group-containers");
LABEL_32:
            if (!v17) {
              return v8;
            }
            xpc_object_t v14 = v17;
            _container_entitlements_append_strings_to_array(v8, v17);
LABEL_34:
            uint64_t v22 = v14;
          }

          xpc_release(v22);
          return v8;
        default:
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v9 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT)) {
            return v8;
          }
          int v24 = 136315394;
          xpc_object_t v25 = "container_entitlements_copy_container_identifiers";
          __int16 v26 = 2048;
          uint64_t v27 = a2;
          uint64_t v10 = "%s: SPI MISUSE: Provided container class is not a valid container class: %llu";
          goto LABEL_7;
      }
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v9 = container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136315394;
      xpc_object_t v25 = "container_entitlements_copy_container_identifiers";
      __int16 v26 = 2048;
      uint64_t v27 = a3;
      uint64_t v10 = "%s: SPI MISUSE: Invalid flags specified: 0x%08llx";
LABEL_7:
      uint64_t v11 = (os_log_s *)v9;
      uint32_t v12 = 22;
      goto LABEL_12;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v13 = container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136315138;
      xpc_object_t v25 = "container_entitlements_copy_container_identifiers";
      uint64_t v10 = "%s: SPI MISUSE: entitlement_read_handler block is required";
      uint64_t v11 = (os_log_s *)v13;
      uint32_t v12 = 12;
LABEL_12:
      _os_log_fault_impl(&dword_18028C000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v24, v12);
    }
  }

  return v8;
}

size_t _container_entitlements_append_strings_to_array(void *a1, void *a2)
{
  size_t result = MEMORY[0x186DF9184](a2);
  if (result == MEMORY[0x189600958])
  {
    size_t v5 = 0LL;
    uint64_t v6 = MEMORY[0x1896009B8];
    while (1)
    {
      size_t result = xpc_array_get_count(a2);
      if (v5 >= result) {
        break;
      }
      xpc_object_t value = xpc_array_get_value(a2, v5);
      if (MEMORY[0x186DF9184]() == v6) {
        xpc_array_append_value(a1, value);
      }
      ++v5;
    }
  }

  return result;
}

void _container_init()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  _os_feature_enabled_impl();
  bzero(__value, 0x410uLL);
  int container_expected = sandbox_get_container_expected();
  if (container_expected)
  {
    int v1 = container_expected;
    uint64_t v3 = 0LL;
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    __int128 v4 = 0u;
    os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_ERROR);
    int v9 = 67109120;
    int v10 = v1;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }

void _container_traverse_state_init(void *a1)
{
}

uint64_t *_container_traverse_state_deinit(uint64_t **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    do
    {
      uint64_t v3 = (uint64_t *)*v2;
      *a1 = (uint64_t *)*v2;
      --*((_BYTE *)a1 + 1051);
      __int128 v4 = (uint64_t *)v2[1];
      if (v4)
      {
        *__int128 v4 = (uint64_t)a1[1];
        a1[1] = v4;
      }

      if ((v2[3] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        *((_DWORD *)v2 + 6) = -1;
        uint64_t v3 = *a1;
      }

      uint64_t *v2 = (uint64_t)a1[2];
      a1[2] = v2;
      uint64_t v2 = v3;
    }

    while (v3);
  }

  while (1)
  {
    __int128 v5 = a1[1];
    if (!v5) {
      break;
    }
    a1[1] = (uint64_t *)*v5;
    uint64_t __s = v5;
    free(v5);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  while (1)
  {
    size_t result = a1[2];
    if (!result) {
      break;
    }
    a1[2] = (uint64_t *)*result;
    uint64_t __s = result;
    free(result);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

void *_container_traverse_continuation_pop(uint64_t a1)
{
  size_t result = *(void **)a1;
  if (result)
  {
    *(void *)a1 = *result;
    --*(_BYTE *)(a1 + 1051);
  }

  return result;
}

uint64_t _container_traverse_continuation_free(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(void **)(a2 + 8);
  if (v4)
  {
    *__int128 v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v4;
  }

  uint64_t result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = (*((uint64_t (**)(void))gCMFSSeam + 19))();
    *(_DWORD *)(a2 + 24) = -1;
  }

  *(void *)a2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  return result;
}

void *_container_traverse_continuation_create(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 16) = *v2;
    uint64_t __s = v2;
  }

  else
  {
    uint64_t v2 = calloc(1uLL, 0x20uLL);
    uint64_t __s = v2;
    if (!v2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      __int128 v5 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)stat buf = 0;
        _os_log_error_impl(&dword_18028C000, v5, OS_LOG_TYPE_ERROR, "Failed to allocate a continuation!", buf, 2u);
      }

      return 0LL;
    }
  }

  attr_stat buf = _container_traverse_get_attr_buf(a1);
  v2[1] = attr_buf;
  if (!attr_buf)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v4 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 v7 = 0;
      _os_log_error_impl(&dword_18028C000, v4, OS_LOG_TYPE_ERROR, "Failed to allocate an attribute buffer!", v7, 2u);
    }

    free(v2);
    memset_s(&__s, 8uLL, 0, 8uLL);
    return 0LL;
  }

  v2[2] = 0LL;
  v2[3] = 0xFFFFFFFFLL;
  void *v2 = *(void *)a1;
  *(void *)a1 = v2;
  ++*(_BYTE *)(a1 + 1051);
  return v2;
}

void *_container_traverse_get_attr_buf(uint64_t a1)
{
  int v1 = *(void **)(a1 + 8);
  if (v1)
  {
    *(void *)(a1 + 8) = *v1;
    return v1;
  }

  unsigned int v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    __int128 v4 = *(void **)a1;
    if (*(void *)a1 && v4[1])
    {
      do
      {
        __int128 v5 = v4;
        __int128 v4 = (void *)*v4;
      }

      while (v4 && v4[1]);
      int v1 = (void *)v5[1];
      v5[1] = 0LL;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      if ((v5[3] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        *((_DWORD *)v5 + 6) = -1;
      }
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      __int128 v6 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 v7 = 0;
        _os_log_error_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to find a candidate buffer to scavenge!",  v7,  2u);
      }

      return 0LL;
    }

    return v1;
  }

  *(_BYTE *)(a1 + 1050) = v3 + 1;
  return malloc(0x4000uLL);
}

uint64_t _container_traverse_continuation_push(uint64_t result, void *a2)
{
  *a2 = *(void *)result;
  *(void *)uint64_t result = a2;
  ++*(_BYTE *)(result + 1051);
  return result;
}

BOOL _container_traverse_path_push(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 1048);
  unint64_t v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    uint64_t v6 = a1 + 24;
    *(_BYTE *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 1048) = v4;
    *(_BYTE *)(v6 + v4) = 0;
  }

  return v4 < 0x400;
}

uint64_t _container_traverse_path_pop(uint64_t result)
{
  uint64_t v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      BOOL v2 = *(_BYTE *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }

    while (!v2);
  }

  *(_BYTE *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 1048) = v1;
  return result;
}

unsigned __int8 *_container_traverse_get_last_path_component(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + a2;
  unint64_t v4 = (unsigned __int8 *)(a1 + a2 - 1);
  while (1)
  {
    __int128 v5 = v4;
    int v6 = *v4;
    --v4;
    if (v6 == 47) {
      goto LABEL_6;
    }
  }

  if (v6 == 47)
  {
LABEL_6:
    uint64_t result = v5 + 1;
    *a3 = v3 - (void)(v5 + 1);
    return result;
  }

  return 0LL;
}

BOOL container_traverse_directory(uint64_t a1, char a2, unsigned int a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v107 = *MEMORY[0x1895FEE08];
  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v16 = (os_log_s *)qword_18C438D80;
    BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "container_traverse_directory";
    int v18 = "%s: SPI MISUSE: path parameter is NULL";
LABEL_24:
    _os_log_fault_impl(&dword_18028C000, v16, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&buf, 0xCu);
    return 0LL;
  }

  if (!a5)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v16 = (os_log_s *)qword_18C438D80;
    BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "container_traverse_directory";
    int v18 = "%s: SPI MISUSE: node_handler parameter is NULL";
    goto LABEL_24;
  }

  uint64_t __s = 0LL;
  uint64_t v78 = 0LL;
  uint64_t v79 = 0LL;
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  LOWORD(__s) = 5;
  if ((a3 & 1) != 0) {
    int v12 = -1610579959;
  }
  else {
    int v12 = -1610612727;
  }
  HIDWORD(__s) = v12 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  if ((a3 & 0x80) != 0) {
    LODWORD(v79) = v79 | 1;
  }
  if ((a3 & 0x100) != 0) {
    LODWORD(v79) = v79 | 4;
  }
  HIDWORD(v78) = 6;
  bzero(&buf, 0x420uLL);
  unint64_t v13 = __strlcpy_chk();
  if (v13 >= 0x400)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v14 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 v102 = 136315138;
      *(void *)&v102[4] = a1;
      _os_log_error_impl( &dword_18028C000,  v14,  OS_LOG_TYPE_ERROR,  "Attempted to iterate directories starting at a path that was too long: [%s]",  v102,  0xCu);
    }

    int v15 = 22;
    goto LABEL_154;
  }

  unsigned __int16 v92 = v13;
  xpc_object_t v19 = _container_traverse_continuation_create((uint64_t)&buf);
  if (!v19)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v25 = (os_log_s *)qword_18C438D80;
    if (!os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)__int128 v102 = 0;
    BOOL v58 = "Failed to create a continuation";
    goto LABEL_128;
  }

  if ((a2 & 1) != 0) {
    goto LABEL_50;
  }
  BOOL v20 = v19;
  LODWORD(__src) = 0;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  memset(v102, 0, sizeof(v102));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  int v101 = 0;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  LOBYTE(v88) = 0;
  HIBYTE(v80) = 0;
  uint64_t continuation_fd = _container_traverse_get_continuation_fd((uint64_t)&buf, (uint64_t)v19, 0, (int *)&__src);
  if ((_DWORD)continuation_fd == -1)
  {
LABEL_126:
    int v15 = (int)__src;
    goto LABEL_154;
  }

  if ((*((unsigned int (**)(uint64_t, uint64_t *, void, uint64_t, void))gCMFSSeam + 32))( continuation_fd,  &__s,  v20[1],  0x4000LL,  0LL) == -1)
  {
    LODWORD(__src) = *__error();
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int16 v26 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uid_t v94 = 136315394;
      *(void *)__int16 v95 = v91;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = (_DWORD)__src;
      _os_log_error_impl( &dword_18028C000,  v26,  OS_LOG_TYPE_ERROR,  "fgetattrlist for [%s] failed; error = %{darwin.errno}d",
        v94,
        0x12u);
    }

    goto LABEL_126;
  }

  _container_traverse_parse_attr_buf((uint64_t)&buf, v20[1], (char *)v102, (uint64_t)&v97, &v88, 0LL, (_BYTE *)&v80 + 1);
  if (DWORD1(v103) != 2 && (v20[3] & 0x80000000) == 0)
  {
    (*((void (**)(void))gCMFSSeam + 19))();
    *((_DWORD *)v20 + 6) = -1;
  }

  uint64_t v22 = (unsigned __int8 *)&buf + v92 + 23;
  while (1)
  {
    int v23 = v22;
    int v24 = *v22;
    if (v22 <= v91) {
      break;
    }
    --v22;
    if (v24 == 47) {
      goto LABEL_45;
    }
  }

  if (v24 != 47)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v57 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uid_t v94 = 136315138;
      *(void *)__int16 v95 = v91;
      _os_log_error_impl( &dword_18028C000,  v57,  OS_LOG_TYPE_ERROR,  "Failed to locate last path element in [%s]",  v94,  0xCu);
    }

    LODWORD(__src) = 40;
    goto LABEL_126;
  }

LABEL_45:
  uint64_t v27 = &v97;
  if (!(_BYTE)v88) {
    uint64_t v27 = 0LL;
  }
  unint64_t v28 = _container_traverse_call_node_handler( -1,  a2,  (uint64_t)v91,  v92,  (uint64_t)(v23 + 1),  &v91[v92] - (v23 + 1),  0,  (uint64_t)v102,  (uint64_t)&v82,  (uint64_t)v27,  a5);
  if (HIBYTE(v80) || DWORD1(v103) != 2 || v28 > 1) {
    goto LABEL_174;
  }
LABEL_50:
  uint64_t v29 = (int32x2_t *)buf;
  if (!(void)buf)
  {
LABEL_174:
    _container_traverse_state_deinit((uint64_t **)&buf);
    return 1LL;
  }

  BOOL v73 = a4;
  uint64_t v74 = a6;
  char v75 = a2;
  while (1)
  {
    *(int32x2_t *)&__int128 buf = *v29;
    --v93;
    if (!*(void *)&v29[1])
    {
      attr___int128 buf = _container_traverse_get_attr_buf((uint64_t)&buf);
      v29[1] = (int32x2_t)attr_buf;
      if (!attr_buf)
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        xpc_object_t v25 = (os_log_s *)qword_18C438D80;
        if (!os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_WORD *)__int128 v102 = 0;
        BOOL v58 = "Failed to locate an attr buf";
LABEL_128:
        _os_log_error_impl(&dword_18028C000, v25, OS_LOG_TYPE_ERROR, v58, v102, 2u);
LABEL_39:
        int v15 = 12;
        goto LABEL_154;
      }
    }

    uint64_t v76 = (uint64_t)v29;
LABEL_55:
    int v88 = 0;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    memset(v102, 0, sizeof(v102));
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    unsigned int v31 = v29[3].u16[2];
    if (!v29[3].i16[2]) {
      goto LABEL_93;
    }
    unsigned __int32 v32 = v29[2].u32[0];
    unsigned __int32 v33 = v29[2].u32[1];
    unsigned int v34 = v32 - v33;
    if (v32 < v33)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      a4 = v73;
      uint64_t v56 = (os_log_s *)qword_18C438D80;
      if (!os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR)) {
        goto LABEL_120;
      }
      __int32 v67 = v29[2].i32[0];
      __int32 v68 = v29[2].i32[1];
      LODWORD(v97) = 67109376;
      DWORD1(v97) = v67;
      WORD4(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 10) = v68;
      int v60 = "Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)";
      goto LABEL_176;
    }

    if (v32 == v33)
    {
      unsigned int v35 = v29[3].u16[3];
    }

    else
    {
      if (v34 >= v31)
      {
        v29[2].i32[1] = v33 + v31;
        v29[3].i16[3] = v31;
        goto LABEL_93;
      }

      unsigned int v35 = (unsigned __int16)(v32 - v33);
      v29[3].i16[3] = v34;
      v29[2].i32[1] = v32;
    }

    int32x2_t v36 = v29[1];
    unint64_t v37 = 0LL;
    if (v35)
    {
      int v38 = 0;
      while (1)
      {
        uint64_t v39 = *(unsigned int *)(*(void *)&v36 + v37);
        v37 += v39;
        if (v37 > 0x4000) {
          break;
        }
        if (++v38 >= v35) {
          goto LABEL_65;
        }
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      a4 = v73;
      uint64_t v56 = (os_log_s *)qword_18C438D80;
      if (!os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
LABEL_120:
        int v15 = 40;
        goto LABEL_149;
      }

      LODWORD(v97) = 67109376;
      DWORD1(v97) = v39;
      WORD4(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 10) = v38;
      int v60 = "Read entry length %u for entry %hu but that put us off the end of the buffer";
LABEL_176:
      uint64_t v61 = (uint8_t *)&v97;
LABEL_177:
      _os_log_error_impl(&dword_18028C000, v56, OS_LOG_TYPE_ERROR, v60, v61, 0xEu);
      goto LABEL_120;
    }

LABEL_65:
    if (v35 < v31) {
      break;
    }
LABEL_93:
    LODWORD(v82) = 0;
    uint64_t v50 = _container_traverse_get_continuation_fd((uint64_t)&buf, (uint64_t)v29, 1, (int *)&v82);
    if ((_DWORD)v50 == -1) {
      goto LABEL_161;
    }
    int v51 = (*((uint64_t (**)(uint64_t, uint64_t *, void, uint64_t, void))gCMFSSeam + 52))( v50,  &__s,  *(void *)&v29[1],  0x4000LL,  0LL);
    if (v51)
    {
      if (v51 == -1)
      {
        LODWORD(v82) = *__error();
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uid_t v65 = (os_log_s *)qword_18C438D80;
        if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
        {
          __int32 v70 = v29[2].i32[0];
          *(_DWORD *)__int128 v102 = 67109634;
          *(_DWORD *)&v102[4] = v70;
          *(_WORD *)&v102[8] = 2080;
          *(void *)&v102[10] = v91;
          *(_WORD *)&v102[18] = 1024;
          *(_DWORD *)&v102[20] = v82;
          _os_log_error_impl( &dword_18028C000,  v65,  OS_LOG_TYPE_ERROR,  "getattrlistbulk failed on entry %u in [%s]; error = %{darwin.errno}d",
            v102,
            0x18u);
        }

LABEL_161:
        int v15 = v82;
        int v66 = (void *)v29[1];
        if (v66)
        {
          *int v66 = *((void *)&buf + 1);
          *((void *)&buf + 1) = v66;
        }

        a4 = v73;
        if ((v29[3].i32[0] & 0x80000000) == 0) {
          goto LABEL_152;
        }
        goto LABEL_153;
      }

      v29[3].i16[2] = v51;
      v29[3].i16[3] = 0;
      goto LABEL_55;
    }

    if (v74
      && ((v75 & 1) == 0 || (void)buf)
      && ((*(uint64_t (**)(uint64_t, _BYTE *))(v74 + 16))(v74, v91) & 1) == 0)
    {
      int v72 = (void *)v29[1];
      if (v72)
      {
        *int v72 = *((void *)&buf + 1);
        *((void *)&buf + 1) = v72;
      }

      uint64_t v29 = (int32x2_t *)v76;
LABEL_171:
      if ((v29[3].i32[0] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        v29[3].i32[0] = -1;
      }

      int32x2_t *v29 = (int32x2_t)v90;
      int v90 = v29;
      goto LABEL_174;
    }

    uint64_t v52 = v92;
    a4 = v73;
    if (v92)
    {
      do
      {
        unsigned __int16 v53 = v52 - 1;
        BOOL v54 = v91[v52 - 1] == 47 || v52 == 1;
        --v52;
      }

      while (!v54);
      uint64_t v52 = v53;
    }

    v91[v52] = 0;
    unsigned __int16 v92 = v52;
    int v55 = (void *)v29[1];
    if (v55)
    {
      *int v55 = *((void *)&buf + 1);
      *((void *)&buf + 1) = v55;
    }

    if ((v29[3].i32[0] & 0x80000000) == 0)
    {
      (*((void (**)(void))gCMFSSeam + 19))();
      v29[3].i32[0] = -1;
    }

    int32x2_t *v29 = (int32x2_t)v90;
    int v90 = v29;
LABEL_115:
    uint64_t v29 = (int32x2_t *)buf;
    if (!(void)buf) {
      goto LABEL_174;
    }
  }

  while (1)
  {
    __src = 0LL;
    int v101 = 0;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int16 v80 = 0;
    _container_traverse_parse_attr_buf( (uint64_t)&buf,  *(void *)&v36 + v37,  (char *)&v82,  (uint64_t)&v97,  &v80,  &__src,  (_BYTE *)&v80 + 1);
    uint64_t v40 = __src;
    if (!__src)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v59 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uid_t v94 = 67109378;
        *(_DWORD *)__int16 v95 = v35;
        *(_WORD *)&v95[4] = 2080;
        *(void *)&v95[6] = v91;
        _os_log_error_impl( &dword_18028C000,  v59,  OS_LOG_TYPE_ERROR,  "Entry %hu in %s did not include name information even though we requested it.",  v94,  0x12u);
      }

      int v15 = 40;
      goto LABEL_148;
    }

    v37 += v82;
    if (v37 > 0x4000)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      a4 = v73;
      uint64_t v56 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uid_t v94 = 67109376;
        *(_DWORD *)__int16 v95 = v82;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v35;
        int v60 = "Read entry length %u for entry %hu but that put us off the end of the buffer";
        uint64_t v61 = v94;
        goto LABEL_177;
      }

      goto LABEL_120;
    }

    if (DWORD2(v83))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      __int128 v62 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uid_t v94 = 67109634;
        *(_DWORD *)__int16 v95 = v35;
        *(_WORD *)&v95[4] = 2080;
        *(void *)&v95[6] = v91;
        *(_WORD *)&v95[14] = 1024;
        *(_DWORD *)&v95[16] = DWORD2(v83);
        _os_log_error_impl( &dword_18028C000,  v62,  OS_LOG_TYPE_ERROR,  "got error while processing entry %hu in [%s]; error = %{darwin.errno}d",
          v94,
          0x18u);
      }

      int v15 = DWORD2(v83);
      goto LABEL_148;
    }

    size_t v41 = (v84 - 1);
    unint64_t v42 = v41 + v92 + 1;
    if (v42 >= 0x400)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v63 = (os_log_s *)qword_18C438D80;
      if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uid_t v94 = 136315650;
        *(void *)__int16 v95 = __src;
        *(_WORD *)&v95[8] = 2048;
        *(void *)&v95[10] = v41;
        *(_WORD *)&v95[18] = 2080;
        uid_t v96 = v91;
        _os_log_error_impl( &dword_18028C000,  v63,  OS_LOG_TYPE_ERROR,  "Could not append element [%s] of length %zd to path [%s] because it would make the path longer than MAXPATHLEN",  v94,  0x20u);
      }

      int v15 = 63;
LABEL_148:
      a4 = v73;
      goto LABEL_149;
    }

    v91[v92] = 47;
    memcpy(&v91[v92 + 1], v40, v41);
    unsigned __int16 v92 = v42;
    v91[v42] = 0;
    char v43 = v93;
    if ((a3 & 0x200) != 0)
    {
      uint64_t v29 = (int32x2_t *)v76;
      int v44 = _container_traverse_get_continuation_fd((uint64_t)&buf, v76, 1, &v88);
      uint64_t v40 = __src;
    }

    else
    {
      int v44 = -1;
      uint64_t v29 = (int32x2_t *)v76;
    }

    __int16 v45 = &v97;
    if (!(_BYTE)v80) {
      __int16 v45 = 0LL;
    }
    uint64_t v46 = _container_traverse_call_node_handler( v44,  v75,  (uint64_t)v91,  v92,  (uint64_t)v40,  v41,  v43 + 1,  (uint64_t)&v82,  (uint64_t)v102,  (uint64_t)v45,  a5);
    if (v46 == 3)
    {
      HIBYTE(v80) = 1;
    }

    else if (v46 == 2)
    {
      goto LABEL_169;
    }

    ++v29[3].i16[3];
    v29[2] = vadd_s32(v29[2], (int32x2_t)0x100000001LL);
    if (DWORD1(v84) != 2) {
      goto LABEL_83;
    }
    if (!HIBYTE(v80)) {
      break;
    }
    if (v74 && !(*(unsigned int (**)(uint64_t, _BYTE *))(v74 + 16))(v74, v91))
    {
LABEL_169:
      int v69 = (void *)v29[1];
      if (v69)
      {
        *int v69 = *((void *)&buf + 1);
        *((void *)&buf + 1) = v69;
      }

      goto LABEL_171;
    }

LABEL_83:
    uint64_t v47 = v92;
    if (v92)
    {
      do
      {
        unsigned __int16 v48 = v47 - 1;
        BOOL v49 = v91[v47 - 1] == 47 || v47 == 1;
        --v47;
      }

      while (!v49);
      uint64_t v47 = v48;
    }

    ++v35;
    v91[v47] = 0;
    unsigned __int16 v92 = v47;
    if (v35 >= v29[3].u16[2]) {
      goto LABEL_93;
    }
  }

  int32x2_t *v29 = (int32x2_t)buf;
  *(void *)&__int128 buf = v29;
  ++v93;
  if (_container_traverse_continuation_create((uint64_t)&buf))
  {
    a4 = v73;
    goto LABEL_115;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int16 v71 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uid_t v94 = 0;
    _os_log_error_impl(&dword_18028C000, v71, OS_LOG_TYPE_ERROR, "Failed to create a continuation", v94, 2u);
  }

  int v15 = 12;
  a4 = v73;
  uint64_t v29 = (int32x2_t *)v76;
LABEL_149:
  uid_t v64 = (void *)v29[1];
  if (v64)
  {
    *uid_t v64 = *((void *)&buf + 1);
    *((void *)&buf + 1) = v64;
  }

  if ((v29[3].i32[0] & 0x80000000) == 0)
  {
LABEL_152:
    (*((void (**)(void))gCMFSSeam + 19))();
    v29[3].i32[0] = -1;
  }

LABEL_153:
  int32x2_t *v29 = (int32x2_t)v90;
  int v90 = v29;
LABEL_154:
  _container_traverse_state_deinit((uint64_t **)&buf);
  BOOL result = 0LL;
  if (a4) {
    *a4 = v15;
  }
  return result;
}

uint64_t _container_traverse_get_continuation_fd(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  uint64_t result = *(unsigned int *)(a2 + 24);
  if ((_DWORD)result == -1)
  {
    if (a3) {
      uint64_t v8 = 1081600LL;
    }
    else {
      uint64_t v8 = 2129920LL;
    }
    uint64_t v9 = a1 + 24;
    uint64_t result = (*((uint64_t (**)(uint64_t, uint64_t))gCMFSSeam + 64))(a1 + 24, v8);
    if ((result & 0x80000000) == 0)
    {
      *(_DWORD *)(a2 + 24) = result;
      return result;
    }

    int v10 = *__error();
    if (v10 == 2) {
      goto LABEL_11;
    }
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v11 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      _os_log_error_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to open [%s]; error = %{darwin.errno}d",
        (uint8_t *)&v12,
        0x12u);
      if (!a4) {
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
LABEL_11:
      if (!a4) {
        return 0xFFFFFFFFLL;
      }
    }

    *a4 = v10;
    return 0xFFFFFFFFLL;
  }

  return result;
}

void _container_traverse_parse_attr_buf( uint64_t a1, uint64_t a2, char *__s, uint64_t a4, _BYTE *a5, void *a6, _BYTE *a7)
{
  uint64_t v41 = *MEMORY[0x1895FEE08];
  if (__s) {
    memset_s(__s, 0x60uLL, 0, 0x60uLL);
  }
  *(_DWORD *)uint64_t __s = *(_DWORD *)a2;
  int v14 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(__s + 4) = *(_OWORD *)(a2 + 4);
  *((_DWORD *)__s + 5) = v14;
  int v15 = *((_DWORD *)__s + 1);
  if ((v15 & 0x20000000) == 0)
  {
    uint64_t v16 = (uint64_t *)(a2 + 24);
    if ((v15 & 1) != 0) {
      goto LABEL_5;
    }
LABEL_8:
    int v18 = 0LL;
    if ((v15 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  *((_DWORD *)__s + 6) = *(_DWORD *)(a2 + 24);
  uint64_t v16 = (uint64_t *)(a2 + 28);
  if ((v15 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v17 = *v16;
  *(void *)(__s + 28) = *v16;
  int v18 = (char *)v16++ + (int)v17;
  if ((v15 & 8) != 0)
  {
LABEL_9:
    int v19 = *(_DWORD *)v16;
    uint64_t v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 9) = v19;
  }

LABEL_34:
  uint64_t v29 = *v16;
  *((void *)__s + 7) = *v16;
  int v30 = (char *)v16 + (int)v29;
  *(_OWORD *)a4 = *(_OWORD *)v30;
  __int128 v31 = *((_OWORD *)v30 + 1);
  __int128 v32 = *((_OWORD *)v30 + 2);
  __int128 v33 = *((_OWORD *)v30 + 3);
  *(_DWORD *)(a4 + 64) = *((_DWORD *)v30 + 16);
  *(_OWORD *)(a4 + 32) = v32;
  *(_OWORD *)(a4 + 48) = v33;
  *(_OWORD *)(a4 + 16) = v31;
  *a5 = 1;
  ++v16;
  int v15 = *((_DWORD *)__s + 1);
  if ((v15 & 0x2000000) == 0)
  {
LABEL_16:
    if ((v15 & 0x40000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  container_query_free(v27);
  if (v9 && v32 != 1) {
    *uint64_t v9 = v32;
  }
  __int128 v33 = v58[3];
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v33;
}

LABEL_35:
  uint64_t v34 = *v16++;
  *((void *)__s + 8) = v34;
  if ((v15 & 0x40000000) != 0)
  {
LABEL_17:
    int v20 = *(_DWORD *)v16;
    uint64_t v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 18) = v20;
  }

uint64_t _container_traverse_call_node_handler( int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v17 = *(_DWORD *)(a8 + 36);
  if ((a2 & 2) != 0 && v17 == 2) {
    return 1LL;
  }
  if (a1 < 0)
  {
    uint64_t v19 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v19 = (*((uint64_t (**)(void))gCMFSSeam + 24))();
    int v17 = *(_DWORD *)(a8 + 36);
  }

  *(_DWORD *)(a9 + 80) = v19;
  *(void *)a9 = *(void *)(a8 + 64);
  *(void *)(a9 + 8) = *(void *)(a8 + 88);
  *(void *)(a9 + 16) = a3;
  *(_WORD *)(a9 + 88) = 0;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  uint64_t v20 = *(unsigned int *)(a8 + 52);
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = v20;
  *(_DWORD *)(a9 + 56) = v17;
  int v21 = *(_DWORD *)(a8 + 72);
  *(_DWORD *)(a9 + 60) = *(_DWORD *)(a8 + 80);
  *(_DWORD *)(a9 + 64) = v21;
  *(void *)(a9 + 68) = *(void *)(a8 + 40);
  *(_DWORD *)(a9 + 76) = *(_DWORD *)(a8 + 80);
  __int16 v22 = *(_WORD *)(a8 + 48) & 0xFFF;
  *(_WORD *)(a9 + 84) = v22;
  unsigned int v23 = v17 - 1;
  if (v23 <= 6) {
    *(_WORD *)(a9 + 84) = word_1802B1D48[v23] | v22;
  }
  if (a10) {
    BOOL v24 = *(_DWORD *)(a10 + 36) != -1;
  }
  else {
    BOOL v24 = 0;
  }
  *(_BYTE *)(a9 + 86) = v24;
  *(_BYTE *)(a9 + 87) = a7;
  char v28 = 1;
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a11 + 16))(a11, a9, &v28);
  uint64_t v26 = 3LL;
  if (v28) {
    uint64_t v26 = 1LL;
  }
  if (v25) {
    uint64_t v18 = v26;
  }
  else {
    uint64_t v18 = 2LL;
  }
  if ((v19 & 0x80000000) == 0) {
    (*((void (**)(uint64_t))gCMFSSeam + 19))(v19);
  }
  return v18;
}

const char *container_traverse_node_get_path(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (a2) {
      *a2 = *(void *)(a1 + 24);
    }
    return *(const char **)(a1 + 16);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
    {
      int v4 = 136315138;
      __int128 v5 = "container_traverse_node_get_path";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v4,  0xCu);
    }

    return "<NULL>";
  }

const char *container_traverse_node_get_name(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (a2) {
      *a2 = *(void *)(a1 + 40);
    }
    return *(const char **)(a1 + 32);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v3 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
    {
      int v4 = 136315138;
      __int128 v5 = "container_traverse_node_get_name";
      _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v4,  0xCu);
    }

    return "<NULL>";
  }

uint64_t container_traverse_node_get_subordinate_count(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned int *)(a1 + 60);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  uint64_t result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_subordinate_count";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

uint64_t container_traverse_node_get_depth_from_origin(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned __int8 *)(a1 + 87);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  uint64_t result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_depth_from_origin";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

BOOL container_traverse_node_is_directory(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(_DWORD *)(a1 + 56) == 2;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_is_directory";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

BOOL container_traverse_node_is_symlink(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(_DWORD *)(a1 + 56) == 5;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_is_symlink";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

BOOL container_traverse_node_is_regular_file(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(_DWORD *)(a1 + 56) == 1;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_is_regular_file";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

uint64_t container_traverse_node_get_optional_file_id(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(void *)a1;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_file_id";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return 0LL;
}

uint64_t container_traverse_node_get_optional_alloc_size(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(void *)(a1 + 8);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_alloc_size";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return -1LL;
}

uint64_t container_traverse_node_get_optional_flags(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(void *)(a1 + 48);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_flags";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return 0LL;
}

uint64_t container_traverse_node_get_optional_dp_class(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned int *)(a1 + 64);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_dp_class";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return 0xFFFFFFFFLL;
}

uint64_t container_traverse_node_get_optional_uid(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned int *)(a1 + 68);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_uid";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return 4294967294LL;
}

uint64_t container_traverse_node_get_optional_gid(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned int *)(a1 + 72);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_gid";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
  }

  return 4294967294LL;
}

uint64_t container_traverse_node_get_optional_link_count(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    unsigned int v1 = *(_DWORD *)(a1 + 76);
    if (v1 < 0x10000) {
      return (unsigned __int16)v1;
    }
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    *(_OWORD *)__int128 buf = 0u;
    os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = "container_traverse_node_get_optional_link_count";
    _os_log_fault_impl(&dword_18028C000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", buf, 0xCu);
  }

  LOWORD(v1) = 0;
  return (unsigned __int16)v1;
}

uint64_t container_traverse_node_get_optional_mode(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned __int16 *)(a1 + 84);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  uint64_t result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_mode";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

BOOL container_traverse_node_optional_has_acl(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(_BYTE *)(a1 + 86) != 0;
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  BOOL result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_optional_has_acl";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

uint64_t container_traverse_node_get_optional_parent_fd(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (a1) {
    return *(unsigned int *)(a1 + 80);
  }
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  BOOL v2 = (os_log_s *)qword_18C438D80;
  uint64_t result = os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    int v3 = 136315138;
    int v4 = "container_traverse_node_get_optional_parent_fd";
    _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: node parameter is NULL",  (uint8_t *)&v3,  0xCu);
    return 0LL;
  }

  return result;
}

char *container_traverse_node_copy_unlocalized_description(uint64_t a1)
{
  int v17 = 0LL;
  if (!a1) {
    return strdup("<NULL>");
  }
  BOOL v2 = *(const char **)(a1 + 32);
  int v3 = *(const char **)(a1 + 16);
  __int128 v16 = *(_OWORD *)a1;
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = *(_DWORD *)(a1 + 60);
  int v6 = *(_DWORD *)(a1 + 64);
  int v7 = *(_DWORD *)(a1 + 68);
  int v8 = *(_DWORD *)(a1 + 72);
  optional_link_size_t count = container_traverse_node_get_optional_link_count(a1);
  int v10 = (const char *)&unk_1802B435E;
  uint64_t v11 = "DIR";
  int v12 = *(_DWORD *)(a1 + 56);
  if (v12 != 2) {
    uint64_t v11 = (const char *)&unk_1802B435E;
  }
  uint64_t v13 = "REG";
  if (v12 != 1) {
    uint64_t v13 = (const char *)&unk_1802B435E;
  }
  if (v12 == 5) {
    int v10 = "LNK";
  }
  if (*(_BYTE *)(a1 + 86)) {
    int v14 = " true";
  }
  else {
    int v14 = "false";
  }
  asprintf( &v17,  "(%04d:0x%08llx:0x%08llx:0x%04lx:%02d:%04d:%04d:%04d:O%06o:%03d:%s%s%s:%s:%03d)[%s][%s]",  v5,  (void)v16,  *((void *)&v16 + 1),  v4,  v6,  v7,  v8,  optional_link_count,  *(unsigned __int16 *)(a1 + 84),  *(unsigned __int8 *)(a1 + 87),  v11,  v13,  v10,  v14,  *(_DWORD *)(a1 + 80),  v2,  v3);
  return v17;
}

char **container_traverse_node_copy(_OWORD *a1)
{
  if (!a1) {
    return 0LL;
  }
  BOOL v2 = (char **)calloc(1uLL, 0x60uLL);
  int v3 = v2;
  if (v2)
  {
    __int128 v4 = a1[1];
    *(_OWORD *)BOOL v2 = *a1;
    *((_OWORD *)v2 + 1) = v4;
    __int128 v5 = a1[2];
    __int128 v6 = a1[3];
    __int128 v7 = a1[5];
    *((_OWORD *)v2 + 4) = a1[4];
    *((_OWORD *)v2 + 5) = v7;
    *((_OWORD *)v2 + 2) = v5;
    *((_OWORD *)v2 + 3) = v6;
    asprintf(v2 + 2, "%s", *((const char **)a1 + 2));
    *((_BYTE *)v3 + 88) = 1;
    asprintf(v3 + 4, "%s", *((const char **)a1 + 4));
    *((_BYTE *)v3 + 89) = 1;
    *((_DWORD *)v3 + 20) = -1;
    int v8 = *((_DWORD *)a1 + 20);
    if (v8 != -1) {
      *((_DWORD *)v3 + 20) = dup(v8);
    }
  }

  return v3;
}

uint64_t container_traverse_node_free(uint64_t result)
{
  uint64_t __s = result;
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(_DWORD *)(result + 80);
    if (v2 != -1)
    {
      close(v2);
      *(_DWORD *)(v1 + 80) = -1;
    }

    if (*(_BYTE *)(v1 + 88))
    {
      int v3 = *(void **)(v1 + 16);
      if (v3)
      {
        free(v3);
        memset_s((void *)(v1 + 16), 8uLL, 0, 8uLL);
      }
    }

    if (*(_BYTE *)(v1 + 89))
    {
      __int128 v4 = *(void **)(v1 + 32);
      if (v4)
      {
        free(v4);
        memset_s((void *)(v1 + 32), 8uLL, 0, 8uLL);
      }
    }

    free((void *)v1);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

uint64_t container_log_client_fault_logging_is_enabled()
{
  return gClientFaultLoggingEnabled;
}

uint64_t container_log_set_client_fault_logging(uint64_t result)
{
  gClientFaultLoggingEnabled = result;
  return result;
}

uint64_t container_xpc_connection_is_shared()
{
  return gContainerXPCUsesSharedConnection;
}

void container_xpc_set_use_shared_connection(int a1)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  if (gContainerXPCUsesSharedConnection != a1)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v2 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = "Disabling";
      if (a1) {
        int v3 = "Enabling";
      }
      int v4 = 136446210;
      __int128 v5 = v3;
      _os_log_impl(&dword_18028C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s connection sharing", (uint8_t *)&v4, 0xCu);
    }

    gContainerXPCUsesSharedConnection = a1;
  }

uint64_t container_internal_get_first_boot_uuid(void *a1)
{
  if (container_internal_get_first_boot_uuid_once != -1)
  {
    dispatch_once(&container_internal_get_first_boot_uuid_once, &__block_literal_global_468);
    if (!a1) {
      return container_internal_get_first_boot_uuid_uuid;
    }
    goto LABEL_3;
  }

  if (a1) {
LABEL_3:
  }
    *a1 = container_internal_get_first_boot_uuid_length;
  return container_internal_get_first_boot_uuid_uuid;
}

uint64_t __container_internal_get_first_boot_uuid_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  memset(v1, 0, sizeof(v1));
  container_internal_get_first_boot_uuid_size_t length = 38LL;
  if ((sysctlbyname("kern.bootsessionuuid", v1, (size_t *)&container_internal_get_first_boot_uuid_length, 0LL, 0LL) & 0x80000000) == 0)
  {
    uint64_t result = (uint64_t)strndup(v1, container_internal_get_first_boot_uuid_length);
LABEL_3:
    container_internal_get_first_boot_uuid_uunsigned int uid = result;
    return result;
  }

  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 12)
  {
    container_internal_get_first_boot_uuid_size_t length = 0LL;
    uint64_t result = sysctlbyname( "kern.bootsessionuuid",  0LL,  (size_t *)&container_internal_get_first_boot_uuid_length,  0LL,  0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = (uint64_t)calloc(container_internal_get_first_boot_uuid_length, 1uLL);
      container_internal_get_first_boot_uuid_uunsigned int uid = result;
      if (result)
      {
        uint64_t result = sysctlbyname( "kern.bootsessionuuid",  (void *)result,  (size_t *)&container_internal_get_first_boot_uuid_length,  0LL,  0LL);
        if ((result & 0x80000000) != 0)
        {
          uint64_t result = container_internal_get_first_boot_uuid_uuid;
          if (container_internal_get_first_boot_uuid_uuid)
          {
            free((void *)container_internal_get_first_boot_uuid_uuid);
            memset_s(&container_internal_get_first_boot_uuid_uuid, 8uLL, 0, 8uLL);
            uint64_t result = 0LL;
          }

          goto LABEL_3;
        }
      }
    }
  }

  return result;
}

BOOL container_class_supports_randomized_path(int a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0 || a1 != 6 && a1 != 1) {
    return 1LL;
  }
  return a2 != 2 && a2 != 7;
}

BOOL container_class_supports_randomized_path_on_current_platform(uint64_t a1, char a2)
{
  active_int platform = dyld_get_active_platform();
  if ((a2 & 1) != 0 || active_platform != 6 && active_platform != 1) {
    return 1LL;
  }
  return a1 != 2 && a1 != 7;
}

uint64_t container_class_supports_data_subdirectory()
{
  return 0LL;
}

uint64_t container_class_for_each_normalized_class(uint64_t result)
{
  uint64_t v1 = result;
  for (uint64_t i = 0LL; i != 15; ++i)
  {
    if (i) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, i);
    }
  }

  return result;
}

uint64_t container_persona_collect_all_ids(void *a1, uint64_t a2, void **a3, size_t *a4)
{
  size_t v7 = 0LL;
  __src = a1;
  for (int i = 1; i != 8; ++i)
  {
    if ((kpersona_find_by_type() & 0x80000000) != 0) {
      size_t v9 = 0LL;
    }
    else {
      size_t v9 = a2 - v7;
    }
    v7 += v9;
  }

  qsort_b(__src, v7, 4uLL, &__block_literal_global_476);
  *a3 = __src;
  *a4 = v7;
  return 1LL;
}

uint64_t __container_persona_collect_all_ids_block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a3 < *a2;
  }
}

uint64_t container_persona_foreach(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895FEE08];
  size_t v8 = 0LL;
  uint64_t __s = 0LL;
  uint64_t result = container_persona_collect_all_ids(v33, 64LL, (void **)&__s, &v8);
  size_t v4 = v8;
  int v3 = __s;
  if (v8)
  {
    __int128 v5 = __s;
    do
    {
      uint64_t v32 = 0LL;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v11 = 0u;
      int v10 = 2;
      int v6 = kpersona_info();
      if (v6) {
        LODWORD(v11) = *v5;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, BOOL, int *))(a1 + 16))(a1, v6 == 0, &v10);
      ++v5;
      --v4;
    }

    while (v4);
  }

  if (v3 != v33 && v3 != 0LL)
  {
    free(v3);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

uint64_t container_persona_convert_unique_string_to_persona_uid(uint64_t a1)
{
  if (a1) {
    kpersona_find();
  }
  return 0xFFFFFFFFLL;
}

uint64_t container_log_handle_for_category(unsigned int a1)
{
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (a1 > 0x16) {
    return MEMORY[0x189600838];
  }
  else {
    return container_log_handle_for_category_logHandles[a1];
  }
}

os_log_t __container_log_handle_for_category_block_invoke()
{
  container_log_handle_for_category_logHandles[0] = (uint64_t)os_log_create("com.apple.containermanager", "unspecified");
  qword_18C438D38 = (uint64_t)os_log_create("com.apple.containermanager", "cache");
  qword_18C438D40 = (uint64_t)os_log_create("com.apple.containermanager", "sandbox");
  qword_18C438D48 = (uint64_t)os_log_create("com.apple.containermanager", "xpc");
  qword_18C438D50 = (uint64_t)os_log_create("com.apple.containermanager", "query");
  qword_18C438D58 = (uint64_t)os_log_create("com.apple.containermanager", "paths");
  qword_18C438D60 = (uint64_t)os_log_create("com.apple.containermanager", "locking");
  qword_18C438D68 = (uint64_t)os_log_create("com.apple.containermanager", "database");
  qword_18C438D70 = (uint64_t)os_log_create("com.apple.containermanager", "upcall");
  qword_18C438D78 = (uint64_t)os_log_create("com.apple.containermanager", "lifecycle");
  qword_18C438D80 = (uint64_t)os_log_create("com.apple.containermanager", "fs");
  qword_18C438D88 = (uint64_t)os_log_create("com.apple.containermanager", "startup");
  qword_18C438D90 = (uint64_t)os_log_create("com.apple.containermanager", "test");
  qword_18C438D98 = (uint64_t)os_log_create("com.apple.containermanager", "metadata");
  qword_18C438DA0 = (uint64_t)os_log_create("com.apple.containermanager", "codesignmapping");
  qword_18C438DA8 = (uint64_t)os_log_create("com.apple.containermanager", "longterm");
  qword_18C438DB0 = (uint64_t)os_log_create("com.apple.containermanager", "schema");
  qword_18C438DB8 = (uint64_t)os_log_create("com.apple.containermanager", "codesign");
  qword_18C438DC0 = (uint64_t)os_log_create("com.apple.containermanager", "repair");
  qword_18C438DC8 = (uint64_t)os_log_create("com.apple.containermanager", "disk");
  qword_18C438DD0 = (uint64_t)os_log_create("com.apple.containermanager", "persona");
  qword_18C438DD8 = (uint64_t)os_log_create("com.apple.containermanager", "command");
  os_log_t result = os_log_create("com.apple.containermanager", "telemetry");
  qword_18C438DE0 = (uint64_t)result;
  return result;
}

void container_log_error(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1895FEE08];
  if (a3 <= 70)
  {
    if (a3 > 23)
    {
      if (a3 != 24)
      {
        if (a3 != 38)
        {
          if (a3 == 55)
          {
            if (a2)
            {
              if (container_log_handle_for_category_onceToken != -1) {
                dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
              }
              uint64_t v5 = container_log_handle_for_category_logHandles;
              if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
              {
                int v23 = 136446210;
                uint64_t v24 = a1;
                int v6 = "%{public}s: client is not entitled";
LABEL_49:
                size_t v8 = (os_log_s *)v5;
                uint32_t v9 = 12;
                goto LABEL_50;
              }

              return;
            }

            if (container_log_handle_for_category_onceToken != -1) {
              dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
            }
            uint64_t v15 = container_log_handle_for_category_logHandles;
            if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
              return;
            }
            int v23 = 136446210;
            uint64_t v24 = a1;
            __int128 v16 = "%{public}s: client is not entitled";
            goto LABEL_85;
          }

          goto LABEL_56;
        }

        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v15 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
            return;
          }
          int v23 = 136446210;
          uint64_t v24 = a1;
          __int128 v16 = "%{public}s: client sent invalid parameters";
        }

        else
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v15 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
            return;
          }
          int v23 = 136446210;
          uint64_t v24 = a1;
          __int128 v16 = "%{public}s: client sent invalid parameters";
        }

LABEL_85:
        __int128 v21 = (os_log_s *)v15;
        uint32_t v22 = 12;
        goto LABEL_88;
      }

      goto LABEL_30;
    }

    if (a3 == 1)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v17 = container_log_handle_for_category_logHandles;
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v23 = 136446210;
      uint64_t v24 = a1;
      __int128 v12 = "%{public}s: success";
      __int128 v13 = (os_log_s *)v17;
      uint32_t v14 = 12;
LABEL_55:
      _os_log_impl(&dword_18028C000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
      return;
    }

    if (a3 != 21)
    {
LABEL_56:
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v18 = container_log_handle_for_category_logHandles;
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
        return;
      }
      else {
        __int128 v19 = off_189639480[a3];
      }
      int v23 = 136446722;
      uint64_t v24 = a1;
      __int16 v25 = 2050;
      uint64_t v26 = a3;
      __int16 v27 = 2082;
      __int128 v28 = (void *)v19;
      __int128 v16 = "%{public}s: error = ((container_error_t)%{public}llu) %{public}s";
      __int128 v21 = (os_log_s *)v18;
      uint32_t v22 = 32;
      goto LABEL_88;
    }

LABEL_30:
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v10 = container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int128 v11 = off_189639480[a3];
    int v23 = 136446722;
    uint64_t v24 = a1;
    __int16 v25 = 2050;
    uint64_t v26 = a3;
    __int16 v27 = 2082;
    __int128 v28 = v11;
    __int128 v12 = "%{public}s: error = ((container_error_t)%{public}llu) %{public}s";
    __int128 v13 = (os_log_s *)v10;
    uint32_t v14 = 32;
    goto LABEL_55;
  }

  if (a3 <= 75)
  {
    if (a3 != 71)
    {
      if (a3 == 74)
      {
        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v7 = container_log_handle_for_category_logHandles;
          if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
          {
            int v23 = 136446466;
            uint64_t v24 = a1;
            __int16 v25 = 1026;
            LODWORD(v26) = geteuid();
            int v6 = "%{public}s: client uid is not permitted, uid = %{public}u";
            size_t v8 = (os_log_s *)v7;
            uint32_t v9 = 18;
LABEL_50:
            _os_log_fault_impl(&dword_18028C000, v8, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v23, v9);
            return;
          }

          return;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v20 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
          return;
        }
        int v23 = 136446466;
        uint64_t v24 = a1;
        __int16 v25 = 1026;
        LODWORD(v26) = geteuid();
        v16 = "%{public}s: client uid is not permitted, unsigned int uid = %{public}u";
        __int128 v21 = (os_log_s *)v20;
        uint32_t v22 = 18;
LABEL_88:
        _os_log_error_impl(&dword_18028C000, v21, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, v22);
        return;
      }

      goto LABEL_56;
    }

    goto LABEL_30;
  }

  if (a3 == 76)
  {
    if (a2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v5 = container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136446210;
        uint64_t v24 = a1;
        int v6 = "%{public}s: client had incorrect persona during request";
        goto LABEL_49;
      }

      return;
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v15 = container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v23 = 136446210;
    uint64_t v24 = a1;
    __int128 v16 = "%{public}s: client had incorrect persona during request";
    goto LABEL_85;
  }

  if (a3 == 115)
  {
    if (a2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v5 = container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136446210;
        uint64_t v24 = a1;
        int v6 = "%{public}s: client had ambiguous persona during request";
        goto LABEL_49;
      }

      return;
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v15 = container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v23 = 136446210;
    uint64_t v24 = a1;
    __int128 v16 = "%{public}s: client had ambiguous persona during request";
    goto LABEL_85;
  }

  if (a3 != 151) {
    goto LABEL_56;
  }
  if (!a2)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v15 = container_log_handle_for_category_logHandles;
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v23 = 136446210;
    uint64_t v24 = a1;
    __int128 v16 = "%{public}s: client persona did not propagate to container manager";
    goto LABEL_85;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v5 = container_log_handle_for_category_logHandles;
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT))
  {
    int v23 = 136446210;
    uint64_t v24 = a1;
    int v6 = "%{public}s: client persona did not propagate to container manager";
    goto LABEL_49;
  }

    xpc_dictionary_set_uuid(v4, "UUID", (const unsigned __int8 *)(a1 + 66));
    goto LABEL_31;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  size_t v8 = (os_log_s *)qword_18C438D50;
  if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v89[0] = a2;
    _os_log_fault_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container_query_set_class() is required",  buf,  0xCu);
  }

  uint32_t v9 = container_error_create(3LL, 38LL, 0LL, 0);
  uint64_t v10 = (uint64_t)v9;
  __int128 v11 = 0LL;
LABEL_13:
  __int128 v12 = 0LL;
  __int128 v62 = v9;
  if (!v10) {
    goto LABEL_70;
  }
LABEL_14:
  _container_query_replace_error((uint64_t *)a1, v10);
  __int128 v12 = 0LL;
  __int128 v13 = v62;
LABEL_71:
  container_error_free(v13);
  if (v4) {
    xpc_release(v4);
  }
  if (v11) {
    xpc_release(v11);
  }
  return v12;
}

void container_log_ext_error(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  if (a3)
  {
    uint64_t v4 = *a3;
    if (*a3 <= 54)
    {
      if (v4 <= 23)
      {
        if (v4 != 1)
        {
          if (v4 != 21) {
            goto LABEL_51;
          }
LABEL_23:
          size_t v8 = container_error_copy_unlocalized_description((uint64_t)a3);
          uint64_t __s = v8;
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint32_t v9 = (os_log_s *)container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT))
          {
LABEL_54:
            if (!v8) {
              return;
            }
            goto LABEL_55;
          }

          *(_DWORD *)__int128 buf = 136446466;
          uint64_t v21 = a1;
          __int16 v22 = 2082;
          int v23 = v8;
          _os_log_impl(&dword_18028C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: error = %{public}s", buf, 0x16u);
          if (!v8) {
            return;
          }
LABEL_55:
          free(v8);
          memset_s(&__s, 8uLL, 0, 8uLL);
          return;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v5 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136446210;
          uint64_t v21 = a1;
          goto LABEL_11;
        }

        return;
      }

      if (v4 == 24) {
        goto LABEL_23;
      }
      if (v4 == 38)
      {
        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v6 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_DWORD *)__int128 buf = 136446210;
          uint64_t v21 = a1;
          uint64_t v7 = "%{public}s: client sent invalid parameters";
        }

        else
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v6 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_DWORD *)__int128 buf = 136446210;
          uint64_t v21 = a1;
          uint64_t v7 = "%{public}s: client sent invalid parameters";
        }

LABEL_69:
        __int128 v16 = (os_log_s *)v6;
        uint32_t v17 = 12;
        goto LABEL_74;
      }

LABEL_51:
      size_t v8 = container_error_copy_unlocalized_description((uint64_t)a3);
      uint64_t __s = v8;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v15 = (os_log_s *)container_log_handle_for_category_logHandles;
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      *(_DWORD *)__int128 buf = 136446466;
      uint64_t v21 = a1;
      __int16 v22 = 2082;
      int v23 = v8;
      _os_log_error_impl(&dword_18028C000, v15, OS_LOG_TYPE_ERROR, "%{public}s: error = %{public}s", buf, 0x16u);
      if (!v8) {
        return;
      }
      goto LABEL_55;
    }

    if (v4 > 73)
    {
      if (v4 == 74)
      {
        if (!a2)
        {
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v18 = container_log_handle_for_category_logHandles;
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_DWORD *)__int128 buf = 136446466;
          uint64_t v21 = a1;
          __int16 v22 = 1026;
          LODWORD(v23) = geteuid();
          uint64_t v7 = "%{public}s: client uid is not permitted, uid = %{public}u";
          __int128 v16 = (os_log_s *)v18;
          uint32_t v17 = 18;
LABEL_74:
          _os_log_error_impl(&dword_18028C000, v16, OS_LOG_TYPE_ERROR, v7, buf, v17);
          return;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v14 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT)) {
          return;
        }
        *(_DWORD *)__int128 buf = 136446466;
        uint64_t v21 = a1;
        __int16 v22 = 1026;
        LODWORD(v23) = geteuid();
        v11 = "%{public}s: client uid is not permitted, unsigned int uid = %{public}u";
        __int128 v12 = (os_log_s *)v14;
        uint32_t v13 = 18;
LABEL_50:
        _os_log_fault_impl(&dword_18028C000, v12, OS_LOG_TYPE_FAULT, v11, buf, v13);
        return;
      }

      if (v4 != 151) {
        goto LABEL_51;
      }
      if (!a2)
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v6 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)__int128 buf = 136446210;
        uint64_t v21 = a1;
        uint64_t v7 = "%{public}s: client persona did not propagate to container manager";
        goto LABEL_69;
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v10 = container_log_handle_for_category_logHandles;
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT)) {
        return;
      }
      *(_DWORD *)__int128 buf = 136446210;
      uint64_t v21 = a1;
      __int128 v11 = "%{public}s: client persona did not propagate to container manager";
    }

    else
    {
      if (v4 != 55)
      {
        if (v4 != 71) {
          goto LABEL_51;
        }
        goto LABEL_23;
      }

      if (!a2)
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v6 = container_log_handle_for_category_logHandles;
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)__int128 buf = 136446210;
        uint64_t v21 = a1;
        uint64_t v7 = "%{public}s: client is not entitled";
        goto LABEL_69;
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v10 = container_log_handle_for_category_logHandles;
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_FAULT)) {
        return;
      }
      *(_DWORD *)__int128 buf = 136446210;
      uint64_t v21 = a1;
      __int128 v11 = "%{public}s: client is not entitled";
    }

    __int128 v12 = (os_log_s *)v10;
    uint32_t v13 = 12;
    goto LABEL_50;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v5 = (os_log_s *)container_log_handle_for_category_logHandles;
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136446210;
    uint64_t v21 = a1;
LABEL_11:
    _os_log_impl(&dword_18028C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: success", buf, 0xCu);
  }

void container_log_error_with_faults(uint64_t a1, uint64_t a2)
{
}

void container_log_ext_error_with_faults(uint64_t a1, uint64_t *a2)
{
}

void container_log_replication_enable_to_uid_relative_path(const char *a1, int a2)
{
}

void _container_log_replication_enable_to_uid_relative_path(int a1, const char *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  os_unfair_lock_lock(&_container_log_replication_enable_to_uid_relative_path_lock);
  unsigned __int8 v6 = atomic_load(_container_log_replication_enable_to_uid_relative_path_enabled);
  if (!a1)
  {
    if ((v6 & 1) != 0)
    {
      os_trace_get_mode();
      os_trace_set_mode();
      do
        __ldaxr(_container_log_replication_enable_to_uid_relative_path_enabled);
      while (__stlxr(0, _container_log_replication_enable_to_uid_relative_path_enabled));
      (*((void (**)(void))gCMFSSeam + 19))(_container_log_replication_enable_to_uid_relative_path_log_fd);
      _container_log_replication_enable_to_uid_relative_path_log_fd = -1;
    }

    goto LABEL_31;
  }

  if ((v6 & 1) != 0)
  {
LABEL_31:
    os_unfair_lock_unlock(&_container_log_replication_enable_to_uid_relative_path_lock);
    return;
  }

  if (!a2)
  {
    _os_crash();
    __break(1u);
    goto LABEL_35;
  }

  if (a3 == -1)
  {
LABEL_35:
    _os_crash();
    __break(1u);
    goto LABEL_36;
  }

  uint64_t v15 = 0LL;
  __int128 v16 = 0LL;
  uint64_t v14 = 0LL;
  if (!container_paths_create_uid_home_relative(a3, 3LL, &v15, &v16))
  {
    uint64_t v10 = container_error_copy_unlocalized_description((uint64_t)v16);
    uint64_t __s = v10;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v11 = (os_log_s *)qword_18C438D80;
    if (os_log_type_enabled((os_log_t)qword_18C438D80, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v18 = v10;
      _os_log_fault_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_FAULT,  "Log replication failed to create directory; error = %s",
        buf,
        0xCu);
      if (!v10)
      {
LABEL_21:
        if (_container_log_replication_enable_to_uid_relative_path_log_fd < 0)
        {
LABEL_26:
          if (v15)
          {
            free(v15);
            memset_s(&v15, 8uLL, 0, 8uLL);
          }

          if (v14)
          {
            free(v14);
            memset_s(&v14, 8uLL, 0, 8uLL);
          }

          container_error_free(v16);
          goto LABEL_31;
        }

LABEL_36:
  _os_crash();
  __break(1u);
}

uint64_t ___container_log_replication_enable_to_uid_relative_path_block_invoke()
{
  uint64_t result = os_log_set_hook();
  _container_log_replication_enable_to_uid_relative_path_g_log_hook = result;
  return result;
}

uint64_t ___container_log_replication_enable_to_uid_relative_path_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v3 = atomic_load(_container_log_replication_enable_to_uid_relative_path_enabled);
  if ((v3 & 1) != 0)
  {
    uint64_t v4 = *(const char **)(a3 + 128);
    if (v4)
    {
      int v5 = _container_log_replication_enable_to_uid_relative_path_log_fd;
      if (!strcmp("com.apple.containermanager", v4))
      {
        unsigned __int8 v6 = (char *)os_log_copy_decorated_message();
        size_t v7 = strlen(v6);
        write(v5, v6, v7);
        free(v6);
        fsync(v5);
      }
    }
  }

  uint64_t result = _container_log_replication_enable_to_uid_relative_path_g_log_hook;
  if (_container_log_replication_enable_to_uid_relative_path_g_log_hook) {
    return (*(uint64_t (**)(void))(_container_log_replication_enable_to_uid_relative_path_g_log_hook + 16))();
  }
  return result;
}

void container_log_replication_disable()
{
}

void *container_seam_fs_set_common(void *__src)
{
  uint64_t result = memcpy(&gCMFSCustomSeamStore, __src, 0x2D0uLL);
  gCMFSSeam = &gCMFSCustomSeamStore;
  return result;
}

void container_seam_fs_reset()
{
  gCMFSSeam = &CMFSSEAM_DEFAULT;
}

void *container_query_create()
{
  int v0 = calloc(1uLL, 0xA8uLL);
  v0[1] = _os_activity_create(&dword_18028C000, "container_query_t", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  *((_DWORD *)v0 + 40) = -1;
  *((_DWORD *)v0 + 41) = voucher_get_current_persona();
  return v0;
}

void *container_query_create_from_container(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v2 = container_query_create();
    unsigned __int8 v3 = container_object_get_class(a1);
    container_query_set_class(v2, (uint64_t)v3);
    unint64_t identifier = (const char *)container_object_get_identifier(a1);
    xpc_object_t v5 = xpc_string_create(identifier);
    container_query_set_identifiers(v2, v5);
    int uid = container_object_get_uid(a1);
    container_query_set_uid((uint64_t)v2, uid);
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    if (persona_unique_string) {
      container_query_set_persona_unique_string(v2, persona_unique_string);
    }
    char v8 = container_object_is_transient(a1);
    container_query_set_transient((uint64_t)v2, v8);
    uint uid = container_object_get_uuid(a1);
    if (v2)
    {
      if (v2[15])
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v10 = (os_log_s *)qword_18C438D50;
        if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
        {
          int v15 = 136315138;
          __int128 v16 = "_container_query_set_internal_uuid";
          _os_log_fault_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v15,  0xCu);
        }

        _container_query_set_usage_error(v2, 111LL);
      }

      else
      {
        uint32_t v13 = (const unsigned __int8 *)uuid;
        _container_query_log_if_error(*v2, (uint64_t)"_container_query_set_internal_uuid");
        uuid_copy((unsigned __int8 *)v2 + 66, v13);
        v2[2] |= 0x80uLL;
      }
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v12 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315138;
        __int128 v16 = "_container_query_set_internal_uuid";
        _os_log_fault_impl( &dword_18028C000,  v12,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v15,  0xCu);
      }
    }

    *((_DWORD *)v2 + 41) = voucher_get_current_persona();
    if (v5) {
      xpc_release(v5);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    __int128 v11 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136315138;
      __int128 v16 = "container_query_create_from_container";
      _os_log_fault_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container parameter is NULL",  (uint8_t *)&v15,  0xCu);
    }

    return 0LL;
  }

  return v2;
}

void container_query_set_class(uint64_t *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "container_query_set_class";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v9,  0xCu);
      }

      uint64_t v4 = a1;
      uint64_t v5 = 111LL;
    }

    else
    {
      if ((unint64_t)(a2 - 1) < 0xE)
      {
        _container_query_log_if_error(*a1, (uint64_t)"container_query_set_class");
        a1[4] = a2;
        a1[2] |= 2uLL;
        return;
      }

      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      char v8 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "container_query_set_class";
        _os_log_fault_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: invalid container class",  (uint8_t *)&v9,  0xCu);
      }

      uint64_t v4 = a1;
      uint64_t v5 = 20LL;
    }

    _container_query_set_usage_error(v4, v5);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unsigned __int8 v6 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "container_query_set_class";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v9,  0xCu);
    }
  }

void container_query_set_identifiers(uint64_t *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  xpc_object_t objects = a2;
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v15 = "container_query_set_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  buf,  0xCu);
      }

      uint64_t v4 = 111LL;
LABEL_8:
      _container_query_set_usage_error(a1, v4);
      return;
    }

    xpc_object_t v6 = a2;
    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v10 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v15 = "container_query_set_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: identifiers parameter is NULL",  buf,  0xCu);
      }

      uint64_t v4 = 38LL;
      goto LABEL_8;
    }

    uint64_t v7 = MEMORY[0x186DF9184](a2);
    uint64_t v8 = MEMORY[0x1896009B8];
    if (v7 == MEMORY[0x1896009B8])
    {
      xpc_object_t v6 = xpc_array_create(&objects, 1uLL);
      xpc_object_t objects = v6;
    }

    if (MEMORY[0x186DF9184](v6) == MEMORY[0x189600958])
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_set_identifiers");
      uint64_t v11 = (void *)a1[3];
      if (v11) {
        xpc_release(v11);
      }
      a1[3] = 0LL;
      xpc_object_t v12 = xpc_retain(objects);
      a1[2] |= 1uLL;
      a1[3] = (uint64_t)v12;
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v9 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v15 = "container_query_set_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: identifiers is not an array or string",  buf,  0xCu);
      }

      _container_query_set_usage_error(a1, 38LL);
    }

    if (v7 == v8 && objects) {
      xpc_release(objects);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v5 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int v15 = "container_query_set_identifiers";
      _os_log_fault_impl(&dword_18028C000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }

void container_query_set_uid(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_set_uid";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error((uint64_t *)a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_set_uid");
      *(_DWORD *)(a1 + 48) = a2;
      *(void *)(a1 + 16) |= 8uLL;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_set_uid";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

void container_query_set_persona_unique_string(uint64_t *a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "container_query_set_persona_unique_string";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v10,  0xCu);
      }

      uint64_t v4 = a1;
      uint64_t v5 = 111LL;
LABEL_8:
      _container_query_set_usage_error(v4, v5);
      return;
    }

    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v9 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "container_query_set_persona_unique_string";
        _os_log_fault_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: persona_unique_string parameter is NULL",  (uint8_t *)&v10,  0xCu);
      }

      uint64_t v4 = a1;
      uint64_t v5 = 38LL;
      goto LABEL_8;
    }

    _container_query_log_if_error(*a1, (uint64_t)"container_query_set_persona_unique_string");
    uint64_t v8 = (void *)a1[7];
    if (v8)
    {
      free(v8);
      memset_s(a1 + 7, 8uLL, 0, 8uLL);
    }

    a1[7] = (uint64_t)strndup(a2, 0x400uLL);
    a1[2] |= 0x10uLL;
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v6 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "container_query_set_persona_unique_string";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v10,  0xCu);
    }
  }

void container_query_set_transient(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_set_transient";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error((uint64_t *)a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_set_transient");
      *(_BYTE *)(a1 + 64) = a2;
      *(void *)(a1 + 16) |= 0x20uLL;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_set_transient";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

void _container_query_set_usage_error(uint64_t *a1, uint64_t a2)
{
  unsigned __int8 v3 = container_error_create(3LL, a2, 0LL, 0);
  _container_query_replace_error(a1, (uint64_t)v3);
  container_error_free(v3);
}

void _container_query_log_if_error(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    unsigned __int8 v3 = container_error_copy_unlocalized_description(a1);
    uint64_t __s = v3;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v7 = a2;
      __int16 v8 = 2080;
      int v9 = v3;
      _os_log_error_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_ERROR,  "WARNING: Calling %s with a query that has a previous error: %s",  buf,  0x16u);
      if (!v3) {
        return;
      }
    }

    else if (!v3)
    {
      return;
    }

    free(v3);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

void *_container_query_replace_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    container_error_reinitialize(v4, v5, *(void *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    uint64_t result = (void *)*a1;
  }

  else
  {
    uint64_t result = container_error_create(v5, *(void *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    *a1 = (uint64_t)result;
  }

  result[4] = a1;
  return result;
}

void container_query_set_group_identifiers(uint64_t *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  xpc_object_t objects = a2;
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  buf,  0xCu);
      }

      uint64_t v4 = 111LL;
LABEL_8:
      _container_query_set_usage_error(a1, v4);
      return;
    }

    xpc_object_t v6 = a2;
    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v10 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: identifiers parameter is NULL",  buf,  0xCu);
      }

      uint64_t v4 = 38LL;
      goto LABEL_8;
    }

    uint64_t v7 = MEMORY[0x186DF9184](a2);
    uint64_t v8 = MEMORY[0x1896009B8];
    if (v7 == MEMORY[0x1896009B8])
    {
      xpc_object_t v6 = xpc_array_create(&objects, 1uLL);
      xpc_object_t objects = v6;
    }

    if (MEMORY[0x186DF9184](v6) == MEMORY[0x189600958])
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_set_group_identifiers");
      uint64_t v11 = (void *)a1[5];
      if (v11) {
        xpc_release(v11);
      }
      a1[5] = 0LL;
      a1[5] = (uint64_t)xpc_retain(objects);
      a1[2] |= 4uLL;
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v9 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: identifiers is not an array or string",  buf,  0xCu);
      }

      _container_query_set_usage_error(a1, 38LL);
    }

    if (v7 == v8 && objects) {
      xpc_release(objects);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v5 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v14 = "container_query_set_group_identifiers";
      _os_log_fault_impl(&dword_18028C000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }

void container_query_set_include_other_owners(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_set_include_other_owners";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error((uint64_t *)a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_set_include_other_owners");
      *(_BYTE *)(a1 + 65) = a2;
      *(void *)(a1 + 16) |= 0x40uLL;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_set_include_other_owners";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

void container_query_operation_set_platform(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_operation_set_platform";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error((uint64_t *)a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_operation_set_platform");
      *(_DWORD *)(a1 + 88) = a2;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_operation_set_platform";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

void container_query_operation_set_flags(uint64_t *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_operation_set_flags";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error(a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_operation_set_flags");
      a1[12] = a2;
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_operation_set_flags";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

void container_query_operation_set_client(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      unsigned __int8 v3 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "container_query_operation_set_client";
        _os_log_fault_impl( &dword_18028C000,  v3,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query has already been executed",  (uint8_t *)&v6,  0xCu);
      }

      _container_query_set_usage_error((uint64_t *)a1, 111LL);
    }

    else
    {
      _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_operation_set_client");
      container_free_client(*(void **)(a1 + 112));
      *(void *)(a1 + 112) = container_copy_client(a2, 0LL);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "container_query_operation_set_client";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&v6,  0xCu);
    }
  }

uint64_t container_query_count_results(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x2000000000LL;
    char v10 = 1;
    _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_count_results");
    if (!*(void *)(a1 + 120))
    {
      uint64_t v2 = *(os_activity_s **)(a1 + 8);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_count_results_block_invoke;
      block[3] = &unk_18963A2C8;
      block[4] = &buf;
      void block[5] = a1;
      void block[6] = "container_query_count_results";
      os_activity_apply(v2, block);
    }

    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      bytes_ptr = (unsigned int *)xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr) {
        uint64_t v4 = bytes_ptr[2];
      }
      else {
        uint64_t v4 = 0LL;
      }
    }

    else
    {
      uint64_t v4 = -1LL;
    }

    container_log_ext_error( (uint64_t)"container_query_count_results",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v5 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "container_query_count_results";
      _os_log_fault_impl( &dword_18028C000,  v5,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&buf,  0xCu);
    }

    return 0LL;
  }

  return v4;
}

BOOL __container_query_count_results_block_invoke(void *a1)
{
  BOOL result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

BOOL _container_query_execute(uint64_t a1, uint64_t a2)
{
  uint64_t v115 = *MEMORY[0x1895FEE08];
  __int128 v62 = 0LL;
  if (!a1) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "Command", 0x27uLL);
  xpc_dictionary_set_uint64(v4, "Flags", *(void *)(a1 + 96));
  xpc_dictionary_set_uint64(v4, "PrivateFlags", *(void *)(a1 + 104));
  xpc_dictionary_set_uint64(v4, "Platform", *(unsigned int *)(a1 + 88));
  uint64_t v5 = *(void *)(a1 + 112);
  if (v5) {
    container_xpc_encode_client_onto_message(v4, v5);
  }
  xpc_dictionary_set_uint64(v4, "Explicit", *(void *)(a1 + 16));
  uint64_t v6 = *(void *)(a1 + 16);
  if ((v6 & 1) != 0)
  {
    uint64_t v7 = *(void **)(a1 + 24);
    if (v7)
    {
      xpc_dictionary_set_value(v4, "IdentifiersArray", v7);
      uint64_t v6 = *(void *)(a1 + 16);
    }
  }

  if ((v6 & 2) != 0)
  {
    xpc_dictionary_set_uint64(v4, "ContainerClass", *(void *)(a1 + 32));
    if ((*(_BYTE *)(a1 + 16) & 4) != 0)
    {
      uint64_t v14 = *(void **)(a1 + 40);
      if (v14) {
        xpc_dictionary_set_value(v4, "GroupIdentifiers", v14);
      }
    }

    xpc_dictionary_set_uint64(v4, "PersonaKernelID", *(unsigned int *)(a1 + 164));
    if ((*(_BYTE *)(a1 + 16) & 0x10) != 0)
    {
      uint64_t v15 = *(const char **)(a1 + 56);
      if (v15) {
        xpc_dictionary_set_string(v4, "PersonaUniqueString", v15);
      }
    }

    int v16 = 0;
    unint64_t v17 = *(void *)(a1 + 32);
    if (v17 <= 0xE && ((1LL << v17) & 0x4ED4) != 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 8) != 0)
      {
        xpc_dictionary_set_uint64(v4, "UID", *(unsigned int *)(a1 + 48));
        int v16 = *(_DWORD *)(a1 + 48);
      }

      else
      {
        int v16 = 0;
      }
    }

    uint64_t v18 = *(void *)(a1 + 16);
    if ((v18 & 0x20) != 0)
    {
      xpc_dictionary_set_BOOL(v4, "Transient", *(_BYTE *)(a1 + 64));
      uint64_t v18 = *(void *)(a1 + 16);
      if ((v18 & 0x40) == 0)
      {
LABEL_29:
        if ((v18 & 0x80) == 0) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }

    else if ((v18 & 0x40) == 0)
    {
      goto LABEL_29;
    }

    xpc_dictionary_set_BOOL(v4, "IncludeUnowned", *(_BYTE *)(a1 + 65));
    if ((*(void *)(a1 + 16) & 0x80) == 0)
    {
LABEL_31:
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      if (!os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      unint64_t v19 = *(void *)(a1 + 32);
      if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v19 <= 8 && ((1LL << v19) & 0x12A) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = (void *)MEMORY[0x186DF907C](v4);
          uint64_t __s = v20;
          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v21 = (os_log_s *)qword_18C438D48;
          if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
          {
            if (!v20) {
              goto LABEL_57;
            }
            goto LABEL_42;
          }

          *(_DWORD *)__int128 buf = 67109634;
          LODWORD(v89[0]) = geteuid();
          WORD2(v89[0]) = 1024;
          *(_DWORD *)((char *)v89 + 6) = getuid();
          WORD1(v89[1]) = 2080;
          *(void *)((char *)&v89[1] + 4) = v20;
          _os_log_debug_impl( &dword_18028C000,  v21,  OS_LOG_TYPE_DEBUG,  "Query; eint uid = %d, int uid = %d, query = %s",
            buf,
            0x18u);
          if (v20)
          {
LABEL_42:
            free(v20);
            p_s = &__s;
LABEL_43:
            memset_s(p_s, 8uLL, 0, 8uLL);
            goto LABEL_57;
          }

          goto LABEL_57;
        }

        int v23 = *(void **)(a1 + 24);
        if (v23)
        {
          size_t count = xpc_array_get_count(v23);
          if (count) {
            string = xpc_array_get_string(*(xpc_object_t *)(a1 + 24), 0LL);
          }
          else {
            string = 0LL;
          }
        }

        else
        {
          string = 0LL;
          size_t count = 0LL;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v26 = qword_18C438D48;
        if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        uid_t v27 = geteuid();
        uid_t v28 = getuid();
        uint64_t v29 = *(void *)(a1 + 32);
        uint64_t v30 = *(void *)(a1 + 96);
        *(_DWORD *)__int128 buf = 67110402;
        LODWORD(v89[0]) = v27;
        WORD2(v89[0]) = 1024;
        *(_DWORD *)((char *)v89 + 6) = v28;
        WORD1(v89[1]) = 2048;
        *(void *)((char *)&v89[1] + 4) = v29;
        WORD2(v89[2]) = 2080;
        *(void *)((char *)&v89[2] + 6) = string;
        HIWORD(v89[3]) = 2048;
        v90[0] = count;
        LOWORD(v90[1]) = 2048;
        *(void *)((char *)&v90[1] + 2) = v30;
        v31 = "Query; eint uid = %d, int uid = %d, class = %llu, identifier = [%s](%zd), flags = %llx";
        uint64_t v32 = buf;
        __int128 v33 = (os_log_s *)v26;
        uint32_t v34 = 54;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEBUG))
        {
          char v43 = (void *)MEMORY[0x186DF907C](v4);
          uint64_t v61 = v43;
          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v112 = 0u;
          voucher_get_current_persona_originator_info();
          __int128 v110 = 0u;
          __int128 v111 = 0u;
          __int128 v109 = 0u;
          voucher_get_current_persona_proximate_info();
          uint64_t v108 = 0LL;
          __int128 v106 = 0u;
          __int128 v107 = 0u;
          __int128 v104 = 0u;
          __int128 v105 = 0u;
          __int128 v103 = 0u;
          __int128 v102 = 0u;
          __int128 v101 = 0u;
          __int128 v100 = 0u;
          __int128 v99 = 0u;
          __int128 v98 = 0u;
          __int128 v97 = 0u;
          __int128 v96 = 0u;
          __int128 v95 = 0u;
          __int128 v94 = 0u;
          __int128 v93 = 0u;
          __int128 v92 = 0u;
          __int128 v91 = 0u;
          memset(v90, 0, sizeof(v90));
          memset(v89, 0, sizeof(v89));
          *(_DWORD *)__int128 buf = 2;
          int current_persona = voucher_get_current_persona();
          if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
          {
            BOOL v49 = "<unknown>";
            BOOL v58 = "NOPERSONA";
          }

          else
          {
            else {
              __int16 v45 = (&off_18963AFA8)[HIDWORD(v89[0]) - 2];
            }
            BOOL v58 = v45;
            BOOL v49 = (char *)&v92 + 4;
          }

          if (container_log_handle_for_category_onceToken != -1) {
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          }
          uint64_t v52 = (os_log_s *)qword_18C438D50;
          if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(__s) = 67111426;
            HIDWORD(__s) = current_persona;
            __int16 v64 = 2082;
            uid_t v65 = v58;
            __int16 v66 = 2082;
            __int32 v67 = v49;
            __int16 v68 = 1024;
            int v69 = 0;
            __int16 v70 = 1024;
            int v71 = 0;
            __int16 v72 = 1024;
            int v73 = 0;
            __int16 v74 = 1024;
            int v75 = 0;
            __int16 v76 = 1024;
            uid_t v77 = geteuid();
            __int16 v78 = 1024;
            uid_t v79 = getuid();
            __int16 v80 = 2080;
            __int16 v81 = v43;
            _os_log_debug_impl( &dword_18028C000,  v52,  OS_LOG_TYPE_DEBUG,  "Query; personaid = %d, type = %{public}s, name = %{public}s, origin [uint64_t pid = %d, personaid = %d], proximate "
              "[pid = %d, personaid = %d], eint uid = %d, int uid = %d, query = %s",
              (uint8_t *)&__s,
              0x4Au);
            if (!v43) {
              goto LABEL_57;
            }
          }

          else if (!v43)
          {
            goto LABEL_57;
          }

          free(v43);
          p_s = &v61;
          goto LABEL_43;
        }

        uint64_t v46 = *(void **)(a1 + 24);
        if (v46)
        {
          size_t v47 = xpc_array_get_count(v46);
          if (v47) {
            unsigned __int16 v48 = xpc_array_get_string(*(xpc_object_t *)(a1 + 24), 0LL);
          }
          else {
            unsigned __int16 v48 = 0LL;
          }
        }

        else
        {
          unsigned __int16 v48 = 0LL;
          size_t v47 = 0LL;
        }

        __int128 v113 = 0u;
        __int128 v114 = 0u;
        __int128 v112 = 0u;
        voucher_get_current_persona_originator_info();
        __int128 v110 = 0u;
        __int128 v111 = 0u;
        __int128 v109 = 0u;
        voucher_get_current_persona_proximate_info();
        uint64_t v108 = 0LL;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        __int128 v103 = 0u;
        __int128 v102 = 0u;
        __int128 v101 = 0u;
        __int128 v100 = 0u;
        __int128 v99 = 0u;
        __int128 v98 = 0u;
        __int128 v97 = 0u;
        __int128 v96 = 0u;
        __int128 v95 = 0u;
        __int128 v94 = 0u;
        __int128 v93 = 0u;
        __int128 v92 = 0u;
        __int128 v91 = 0u;
        memset(v90, 0, sizeof(v90));
        memset(v89, 0, sizeof(v89));
        *(_DWORD *)__int128 buf = 2;
        int v50 = voucher_get_current_persona();
        if (v50 == -1 || (kpersona_info() & 0x80000000) != 0)
        {
          int v59 = "NOPERSONA";
          int v60 = "<unknown>";
        }

        else
        {
          else {
            int v51 = (&off_18963AFA8)[HIDWORD(v89[0]) - 2];
          }
          int v59 = v51;
          int v60 = (char *)&v92 + 4;
        }

        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v53 = qword_18C438D50;
        if (!os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          uint64_t v35 = *(void *)(a1 + 32);
          if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
          {
            int v36 = 1;
          }

          else
          {
            unint64_t v37 = v35 - 1;
            if (v37 > 0xD) {
              int v36 = 0;
            }
            else {
              int v36 = dword_1802B1D74[v37];
            }
          }

          uint64_t v38 = (void *)container_xpc_send_sync_message(v36, 0LL, v4, 1, v16, a1 + 160, (uint64_t)&v62);
          uint64_t v11 = v38;
          BOOL v12 = v38 != 0LL;
          if (v38)
          {
            xpc_object_t value = xpc_dictionary_get_value(v38, "ReplyContainerSet");
            *(void *)(a1 + 120) = value;
            if (!value)
            {
              uint64_t v9 = container_error_create(2LL, 53LL, 0LL, 0);
              uint64_t v10 = (uint64_t)v9;
              goto LABEL_13;
            }

            xpc_retain(value);
            xpc_object_t v40 = xpc_dictionary_get_value(v11, "ReplyContainerInfos");
            *(void *)(a1 + 136) = v40;
            if (v40) {
              xpc_retain(v40);
            }
            xpc_object_t v41 = xpc_dictionary_get_value(v11, "ReplyContainerTokens");
            *(void *)(a1 + 128) = v41;
            if (v41) {
              xpc_retain(v41);
            }
            *(void *)(a1 + 144) = xpc_dictionary_get_uint64(v11, "ReplyFlags");
          }

          uint64_t v10 = (uint64_t)v62;
          if (v62) {
            goto LABEL_14;
          }
LABEL_70:
          uint32_t v13 = 0LL;
          goto LABEL_71;
        }

        uid_t v54 = geteuid();
        uid_t v55 = getuid();
        uint64_t v56 = *(void **)(a1 + 32);
        uint64_t v57 = *(void *)(a1 + 96);
        LODWORD(__s) = 67112194;
        HIDWORD(__s) = v50;
        __int16 v64 = 2082;
        uid_t v65 = v59;
        __int16 v66 = 2082;
        __int32 v67 = v60;
        __int16 v68 = 1024;
        int v69 = 0;
        __int16 v70 = 1024;
        int v71 = 0;
        __int16 v72 = 1024;
        int v73 = 0;
        __int16 v74 = 1024;
        int v75 = 0;
        __int16 v76 = 1024;
        uid_t v77 = v54;
        __int16 v78 = 1024;
        uid_t v79 = v55;
        __int16 v80 = 2048;
        __int16 v81 = v56;
        __int16 v82 = 2080;
        __int128 v83 = v48;
        __int16 v84 = 2048;
        size_t v85 = v47;
        __int16 v86 = 2048;
        uint64_t v87 = v57;
        __int128 v31 = "Query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proximate "
              "[pid = %d, personaid = %d], eint uid = %d, int uid = %d, class = %llu, identifier = [%s](%zd), flags = %llx";
        uint64_t v32 = (uint8_t *)&__s;
        __int128 v33 = (os_log_s *)v53;
        uint32_t v34 = 104;
      }

      _os_log_impl(&dword_18028C000, v33, OS_LOG_TYPE_DEFAULT, v31, v32, v34);
      goto LABEL_57;
    }

BOOL container_query_iterate_results_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x2000000000LL;
    char v15 = 1;
    _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_iterate_results_sync");
    if (!*(void *)(a1 + 120))
    {
      xpc_object_t v4 = *(os_activity_s **)(a1 + 8);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_iterate_results_sync_block_invoke;
      block[3] = &unk_18963A2F0;
      block[4] = &buf;
      void block[5] = a1;
      void block[6] = "container_query_iterate_results_sync";
      os_activity_apply(v4, block);
    }

    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr)
      {
        unsigned int v6 = bytes_ptr[2];
        if (v6)
        {
          BOOL v7 = 0;
          int v8 = 0;
          uint64_t v9 = 0LL;
          while (1)
          {
            if (v9)
            {
              if (v9[11]) {
                goto LABEL_12;
              }
              container_object_free(v9);
            }

            uint64_t v9 = calloc(1uLL, 0x70uLL);
LABEL_12:
            v9[11] = a1;
            *((_DWORD *)v9 + 24) = v8;
            if (((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v9) & 1) != 0)
            {
              BOOL v7 = ++v8 >= v6;
              if (v6 != v8) {
                continue;
              }
            }

            v9[11] = 0LL;
            *((_DWORD *)v9 + 24) = 0;
            container_object_free(v9);
            goto LABEL_22;
          }
        }
      }

      BOOL v7 = 1;
    }

    else
    {
      BOOL v7 = 0;
    }

BOOL __container_query_iterate_results_sync_block_invoke(void *a1)
{
  BOOL result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

void *container_query_get_single_result(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x2000000000LL;
    char v12 = 1;
    _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_get_single_result");
    if (!*(void *)(a1 + 120))
    {
      uint64_t v2 = *(os_activity_s **)(a1 + 8);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_get_single_result_block_invoke;
      block[3] = &unk_18963A318;
      block[4] = &buf;
      void block[5] = a1;
      void block[6] = "container_query_get_single_result";
      os_activity_apply(v2, block);
    }

    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr)
      {
        int v4 = bytes_ptr[2];
        if (v4)
        {
          if (v4 == 1)
          {
            uint64_t v5 = *(void **)(a1 + 152);
            if (!v5)
            {
              uint64_t v5 = calloc(1uLL, 0x70uLL);
              *(void *)(a1 + 152) = v5;
              v5[11] = a1;
              *((_DWORD *)v5 + 24) = 0;
            }

            goto LABEL_17;
          }

          BOOL v7 = container_error_create(3LL, 114LL, 0LL, 0);
          v7[4] = a1;
          _container_query_replace_error((uint64_t *)a1, (uint64_t)v7);
        }
      }
    }

    uint64_t v5 = 0LL;
LABEL_17:
    container_log_ext_error( (uint64_t)"container_query_get_single_result",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
    return v5;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  unsigned int v6 = (os_log_s *)qword_18C438D50;
  if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "container_query_get_single_result";
    _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&buf,  0xCu);
  }

  return 0LL;
}

BOOL __container_query_get_single_result_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  *(void *)(v2 + 96) |= 2uLL;
  BOOL result = _container_query_execute(v2, v3);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

BOOL container_query_iterate_results_with_identifier_sync(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2000000000LL;
    char v19 = 1;
    _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_iterate_results_with_identifier_sync");
    if (!*(void *)(a1 + 120))
    {
      unsigned int v6 = *(os_activity_s **)(a1 + 8);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_iterate_results_with_identifier_sync_block_invoke;
      block[3] = &unk_18963A340;
      block[4] = &buf;
      void block[5] = a1;
      void block[6] = "container_query_iterate_results_with_identifier_sync";
      os_activity_apply(v6, block);
    }

    if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      BOOL v9 = 0;
      goto LABEL_24;
    }

    bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
    unint64_t stored_string = container_frozenset_get_stored_string((uint64_t)bytes_ptr, a2);
    BOOL v9 = 1;
    if (stored_string)
    {
      if (bytes_ptr)
      {
        unsigned int v10 = bytes_ptr[2];
        if (v10)
        {
          unint64_t v11 = stored_string;
          BOOL v9 = 0;
          unsigned int v12 = 0;
          uint64_t v13 = 0LL;
          while (v11 != container_frozenset_get_identifier_of_container_at_index((uint64_t)bytes_ptr, v12))
          {
LABEL_15:
            BOOL v9 = ++v12 >= v10;
            if (v10 == v12)
            {
              if (!v13) {
                goto LABEL_24;
              }
LABEL_17:
              v13[11] = 0LL;
              *((_DWORD *)v13 + 24) = 0;
              container_object_free(v13);
              goto LABEL_24;
            }
          }

          if (v13)
          {
            if (v13[11]) {
              goto LABEL_14;
            }
            container_object_free(v13);
          }

          uint64_t v13 = calloc(1uLL, 0x70uLL);
LABEL_14:
          v13[11] = a1;
          *((_DWORD *)v13 + 24) = v12;
          goto LABEL_15;
        }
      }
    }

LABEL_24:
    container_log_ext_error( (uint64_t)"container_query_iterate_results_with_identifier_sync",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v14 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "container_query_iterate_results_with_identifier_sync";
      _os_log_fault_impl( &dword_18028C000,  v14,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&buf,  0xCu);
    }

    return 0;
  }

  return v9;
}

BOOL __container_query_iterate_results_with_identifier_sync_block_invoke(void *a1)
{
  BOOL result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

BOOL container_query_iterate_results_with_subquery_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1895FEE08];
  uint64_t v36 = 0LL;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000LL;
  char v39 = 0;
  if (a1)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v41 = 0x2000000000LL;
    char v42 = 1;
    uint64_t v32 = 0LL;
    __int128 v33 = &v32;
    uint64_t v34 = 0x2000000000LL;
    uint64_t v35 = 0LL;
    _container_query_log_if_error(*(void *)a1, (uint64_t)"container_query_iterate_results_with_subquery_sync");
    uint64_t v6 = MEMORY[0x1895FED80];
    if (!*(void *)(a1 + 120))
    {
      BOOL v7 = *(os_activity_s **)(a1 + 8);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_iterate_results_with_subquery_sync_block_invoke;
      block[3] = &unk_18963A368;
      block[4] = &buf;
      void block[5] = a1;
      void block[6] = "container_query_iterate_results_with_subquery_sync";
      os_activity_apply(v7, block);
    }

    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      uint64_t v20 = *(unsigned int *)(a2 + 32);
      int v21 = *(_DWORD *)(a2 + 48);
      char v22 = *(_BYTE *)(a2 + 64);
      uint64_t v9 = *(void *)(a2 + 16);
      BOOL v23 = (v9 & 2) != 0;
      BOOL v24 = (v9 & 8) != 0;
      BOOL v25 = (v9 & 0x20) != 0;
      if ((v9 & 0x10) != 0) {
        uint64_t v10 = *(void *)(a2 + 56);
      }
      else {
        uint64_t v10 = 0LL;
      }
      uint64_t v26 = v10;
      if ((v9 & 1) != 0) {
        uint64_t v13 = *(void *)(a2 + 24);
      }
      else {
        uint64_t v13 = 0LL;
      }
      uint64_t v27 = v13;
      if ((v9 & 4) != 0) {
        uint64_t v14 = *(void *)(a2 + 40);
      }
      else {
        uint64_t v14 = 0LL;
      }
      uint64_t v28 = v14;
      int v29 = 0;
      if (bytes_ptr) {
        int v15 = bytes_ptr[2];
      }
      else {
        int v15 = 0;
      }
      int v30 = v15;
      *((_BYTE *)v37 + 24) = 1;
      v19[0] = v6;
      v19[1] = 0x40000000LL;
      v19[2] = __container_query_iterate_results_with_subquery_sync_block_invoke_2;
      v19[3] = &unk_18963A390;
      v19[4] = a3;
      v19[5] = &v32;
      v19[6] = &v36;
      v19[7] = a1;
      container_frozenset_enumerate_matches((uint64_t)bytes_ptr, (uint64_t)&v20, (uint64_t)v19);
      uint64_t v16 = v33;
      uint64_t v17 = v33[3];
      if (v17)
      {
        *(void *)(v17 + 88) = 0LL;
        *(_DWORD *)(v17 + 96) = 0;
        container_object_free((void *)v16[3]);
      }
    }

    container_log_ext_error( (uint64_t)"container_query_iterate_results_with_subquery_sync",  gClientFaultLoggingEnabled,  *(uint64_t **)a1);
    BOOL v12 = *((_BYTE *)v37 + 24) != 0;
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unint64_t v11 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "container_query_iterate_results_with_subquery_sync";
      _os_log_fault_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: query parameter is NULL",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v12 = 0LL;
  }

  _Block_object_dispose(&v36, 8);
  return v12;
}

BOOL __container_query_iterate_results_with_subquery_sync_block_invoke(void *a1)
{
  BOOL result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

uint64_t __container_query_iterate_results_with_subquery_sync_block_invoke_2(void *a1, int a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  if (!v4 || !*(void *)(v4 + 88))
  {
    container_object_free((void *)v4);
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = calloc(1uLL, 0x70uLL);
    uint64_t v4 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  }

  uint64_t v5 = a1[7];
  *(void *)(v4 + 88) = v5;
  if (v5) {
    int v6 = a2;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)(v4 + 96) = v6;
  uint64_t result = (*(uint64_t (**)(void))(a1[4] + 16LL))();
  if ((result & 1) == 0) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }
  return result;
}

uint64_t container_query_get_last_error(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _container_query_get_servicing_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 160);
}

uint64_t container_query_copy(uint64_t *a1)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  if (a1)
  {
    os_activity_t v2 = _os_activity_create(&dword_18028C000, "container_query_t", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
    _container_query_log_if_error(*a1, (uint64_t)"container_query_copy");
    uint64_t v3 = calloc(1uLL, 0xA8uLL);
    v10[3] = (uint64_t)v3;
    if (v3)
    {
      *(_DWORD *)(v10[3] + 164) = voucher_get_current_persona();
      uint64_t v4 = (os_activity_s *)a1[1];
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_query_copy_block_invoke;
      block[3] = &unk_18963A3B8;
      block[4] = &v9;
      void block[5] = a1;
      void block[6] = v2;
      os_activity_apply(v4, block);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v5 = (os_log_s *)qword_18C438D50;
    if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v14 = "container_query_copy";
      _os_log_fault_impl(&dword_18028C000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }

  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

char *__container_query_copy_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  xpc_object_t v4 = *(xpc_object_t *)(v2 + 24);
  *(void *)(v3 + 32) = *(void *)(v2 + 32);
  if (v4) {
    xpc_object_t v4 = xpc_retain(v4);
  }
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 24LL) = v4;
  xpc_object_t v5 = *(xpc_object_t *)(a1[5] + 40LL);
  if (v5) {
    xpc_object_t v5 = xpc_retain(v5);
  }
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 40LL) = v5;
  uint64_t v6 = a1[5];
  *(_DWORD *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 48LL) = *(_DWORD *)(v6 + 48);
  *(_BYTE *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 64LL) = *(_BYTE *)(v6 + 64);
  BOOL v7 = *(char **)(v6 + 56);
  if (v7) {
    BOOL v7 = strndup(v7, 0x400uLL);
  }
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 56LL) = v7;
  uint64_t v8 = a1[5];
  *(_BYTE *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 65LL) = *(_BYTE *)(v8 + 65);
  *(_BYTE *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 64LL) = *(_BYTE *)(v8 + 64);
  uuid_copy( (unsigned __int8 *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 66LL),  (const unsigned __int8 *)(v8 + 66));
  uint64_t v9 = a1[5];
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 16LL) = *(void *)(v9 + 16);
  *(_DWORD *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 88LL) = *(_DWORD *)(v9 + 88);
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 96LL) = *(void *)(v9 + 96);
  uint64_t result = container_copy_client(*(void *)(v9 + 112), 0LL);
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 112LL) = result;
  **(void **)(*(void *)(a1[4] + 8LL) + 24LL) = 0LL;
  *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL) + 8LL) = a1[6];
  return result;
}

void *container_query_free(void *result)
{
  uint64_t __s = (uint64_t)result;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)result[3];
    if (v2) {
      xpc_release(v2);
    }
    v1[3] = 0LL;
    uint64_t v3 = (void *)v1[5];
    if (v3) {
      xpc_release(v3);
    }
    xpc_object_t v4 = (void *)v1[7];
    v1[5] = 0LL;
    if (v4)
    {
      free(v4);
      memset_s(v1 + 7, 8uLL, 0, 8uLL);
    }

    xpc_object_t v5 = (void *)v1[15];
    if (v5) {
      xpc_release(v5);
    }
    v1[15] = 0LL;
    uint64_t v6 = (void *)v1[17];
    if (v6) {
      xpc_release(v6);
    }
    v1[17] = 0LL;
    BOOL v7 = (void *)v1[16];
    if (v7) {
      xpc_release(v7);
    }
    v1[16] = 0LL;
    uint64_t v8 = v1[19];
    if (v8)
    {
      *(void *)(v8 + 88) = 0LL;
      *(_DWORD *)(v8 + 96) = 0;
      container_object_free((void *)v8);
    }

    uint64_t v9 = (void *)*v1;
    if (*v1)
    {
      v9[4] = 0LL;
      container_error_free(v9);
      *uint64_t v1 = 0LL;
    }

    uint64_t v10 = (void *)v1[14];
    if (v10)
    {
      container_free_client(v10);
      v1[14] = 0LL;
    }

    uint64_t v11 = (void *)v1[1];
    if (v11) {
      os_release(v11);
    }
    free(v1);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

uint64_t container_disposition(uint64_t a1, _DWORD *a2)
{
  if (!a1)
  {
LABEL_12:
    uint64_t v5 = 0LL;
    if (!a2) {
      return v5;
    }
    goto LABEL_9;
  }

  uint64_t v3 = a1;
  unint64_t v4 = (unint64_t)container_object_get_class(a1);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
  {
    if (v4 > 0xE) {
      goto LABEL_11;
    }
    if (((1LL << v4) & 0x4ED4) != 0)
    {
      LODWORD(a1) = container_object_get_uid(v3);
      uint64_t v5 = 2LL;
      if (!a2) {
        return v5;
      }
      goto LABEL_9;
    }

    if (((1LL << v4) & 0x12A) == 0)
    {
LABEL_11:
      LODWORD(a1) = 0;
      goto LABEL_12;
    }
  }

  LODWORD(a1) = 0;
  uint64_t v5 = 1LL;
  if (a2) {
LABEL_9:
  }
    *a2 = a1;
  return v5;
}

uint64_t container_get_class(uint64_t a1)
{
  if (a1) {
    return (uint64_t)container_object_get_class(a1);
  }
  return a1;
}

uint64_t container_get_uid(uint64_t a1)
{
  if (a1) {
    return (uint64_t)container_object_get_uid(a1);
  }
  return a1;
}

uint64_t container_disposition_for_array(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  if (a2)
  {
    uint64_t v4 = a2;
    int v6 = 0;
    uint64_t v7 = 0LL;
    while (1)
    {
      uint64_t v8 = v7;
      unsigned int v10 = 0;
      uint64_t result = container_disposition(*a1, &v10);
      if ((_DWORD)result != 2) {
        break;
      }
      uint64_t v7 = v10;
      if ((_DWORD)v8 && (_DWORD)v8 != v10)
      {
        uint64_t result = 0LL;
        LODWORD(v7) = v8;
        if (a3) {
          goto LABEL_16;
        }
        return result;
      }

      if (v6) {
        goto LABEL_9;
      }
LABEL_10:
      ++a1;
      int v6 = result;
      if (!--v4) {
        goto LABEL_15;
      }
    }

    uint64_t v7 = v8;
    if (!v6) {
      goto LABEL_10;
    }
LABEL_9:
    if (v6 != (_DWORD)result)
    {
      uint64_t result = 3LL;
LABEL_15:
      if (!a3) {
        return result;
      }
      goto LABEL_16;
    }

    goto LABEL_10;
  }

  LODWORD(v7) = 0;
  uint64_t result = 0LL;
  if (a3) {
LABEL_16:
  }
    *a3 = v7;
  return result;
}

BOOL container_object_update_metadata(uint64_t a1, int a2, const char **a3, uint64_t *a4)
{
  if (a1
    && (uint uid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 <= 0xD)
  {
    uint64_t v12 = container_query_create();
    uint64_t v13 = container_object_get_class(a1);
    container_query_set_class(v12, (uint64_t)v13);
    int uid = container_object_get_uid(a1);
    container_query_set_uid((uint64_t)v12, uid);
    char v15 = container_object_is_transient(a1);
    container_query_set_transient((uint64_t)v12, v15);
    unint64_t identifier = (const char *)container_object_get_identifier(a1);
    xpc_object_t v17 = xpc_string_create(identifier);
    uint64_t v18 = container_object_get_class(a1);
    if (v18 == (_DWORD *)13 || v18 == (_DWORD *)7) {
      container_query_set_group_identifiers(v12, v17);
    }
    else {
      container_query_set_identifiers(v12, v17);
    }
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    if (persona_unique_string) {
      container_query_set_persona_unique_string(v12, persona_unique_string);
    }
    if (a2) {
      uint64_t v20 = 0x300000000LL;
    }
    else {
      uint64_t v20 = 0x100000000LL;
    }
    container_query_operation_set_flags(v12, v20);
    v12[13] |= 3uLL;
    single_uint64_t result = container_query_get_single_result((uint64_t)v12);
    BOOL v9 = single_result != 0LL;
    if (single_result)
    {
      char v22 = single_result;
      container_update_with_container(a1, (uint64_t)single_result);
      if (a3)
      {
        uint64_t v23 = v22[11];
        else {
          string = (const char *)v22[6];
        }
        if (string) {
          string = strndup(string, 0x800uLL);
        }
        *a3 = string;
      }

      uint64_t v10 = 1LL;
    }

    else if (*v12)
    {
      uint64_t v10 = *(void *)*v12;
    }

    else
    {
      uint64_t v10 = 21LL;
    }

    container_query_free(v12);
    if (v17) {
      xpc_release(v17);
    }
  }

  else
  {
    BOOL v9 = 0LL;
    uint64_t v10 = 11LL;
  }

  if (a4 && v10 != 1) {
    *a4 = v10;
  }
  return v9;
}

void container_update_with_container(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  uint uid = (const unsigned __int8 *)container_object_get_uuid(a1);
  if (uuid_is_null(uuid)) {
    goto LABEL_3;
  }
  uint64_t v5 = (const unsigned __int8 *)container_object_get_uuid(a2);
  if (uuid_is_null(v5)) {
    goto LABEL_3;
  }
  uint64_t v12 = container_object_get_uuid(a1);
  uint64_t v13 = container_object_get_uuid(a2);
  if (v12 && v13)
  {
    if (*(void *)v12 != *(void *)v13 || *(void *)(v12 + 8) != *(void *)(v13 + 8)) {
      goto LABEL_16;
    }
LABEL_3:
    unsigned __int8 v6 = container_object_is_transient(a2);
    __container_object_separate_from_query((void *)a1);
    *(_BYTE *)(a1 + 109) = v6;
    uint64_t v7 = *(void *)(a2 + 88);
    else {
      xpc_object_t dictionary = *(xpc_object_t *)(a2 + 80);
    }
    container_object_set_info((void *)a1, dictionary);
    if (container_object_get_path(a2))
    {
      unint64_t path = (const char *)container_object_get_path(a2);
      container_object_set_path((void *)a1, path);
    }

    unint64_t unique_path_component = (const char *)container_object_get_unique_path_component(a2);
    container_object_set_unique_path_component((void *)a1, unique_path_component);
    return;
  }

uint64_t container_get_identifier(uint64_t a1)
{
  if (a1) {
    return container_object_get_identifier(a1);
  }
  return a1;
}

uint64_t container_get_persona_unique_string(uint64_t a1)
{
  if (a1) {
    return container_object_get_persona_unique_string(a1);
  }
  return a1;
}

uint64_t container_get_path(uint64_t a1)
{
  if (a1) {
    return container_object_get_path(a1);
  }
  return a1;
}

uint64_t container_get_user_managed_assets_relative_path(uint64_t a1)
{
  if (a1) {
    return container_object_get_user_managed_assets_relative_path(a1);
  }
  return a1;
}

uint64_t container_get_creator_codesign_identifier(uint64_t a1)
{
  if (a1) {
    return container_object_get_creator_codesign_identifier(a1);
  }
  return a1;
}

uint64_t container_copy_path(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v4 = _os_activity_create(&dword_18028C000, "container_copy_path", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_copy_path_block_invoke;
  block[3] = &unk_18963A3E0;
  void block[5] = &v14;
  void block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error((uint64_t)"container_copy_path", gClientFaultLoggingEnabled, v6);
  uint64_t v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void *__container_copy_path_block_invoke(void *a1)
{
  uint64_t __s = 0LL;
  uint64_t v2 = a1[6];
  if (!v2
    || (uint uid = (const unsigned __int8 *)container_object_get_uuid(a1[6]), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 11LL;
    goto LABEL_4;
  }

  unint64_t path = container_object_get_path(a1[6]);
  uint64_t v6 = a1[6];
  if (path)
  {
    container_object_sandbox_extension_activate(v6, 1);
    uint64_t v7 = (const char *)container_object_get_path(a1[6]);
    if (container_fs_item_exists(v7, 0LL))
    {
      uint64_t v8 = (const char *)container_object_get_path(a1[6]);
      goto LABEL_20;
    }
  }

  else if (*(void *)(v6 + 88))
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    BOOL v9 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_DEFAULT,  "Retrieving the path from a container which was fetched by a query without the CONTAINER_QUERY_FLAGS_RESULT_INCLU DE_PATH option. If you want the path from queried containers, set that option on the query. That will be much fa ster than what is about to happen...",  v10,  2u);
    }
  }

  uint64_t v8 = (const char *)container_object_get_path(a1[6]);
  if (__s)
  {
    container_object_set_sandbox_token((void *)a1[6], (const char *)__s);
    container_object_sandbox_extension_activate(a1[6], 1);
  }

LABEL_20:
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = strdup(v8);
LABEL_4:
  uint64_t result = __s;
  if (__s)
  {
    free(__s);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

  if (v34 <= v39)
  {
    _os_crash();
    __break(1u);
    JUMPOUT(0x1802A8410LL);
  }

  if ((*(_BYTE *)(a1 + 6) & 1) != 0) {
    __asm { BR              X0 }
  }

  return v39;
}

uint64_t container_is_transient(uint64_t a1, _BYTE *a2)
{
  if (a1 && a2) {
    *a2 = container_object_is_transient(a1);
  }
  return 1LL;
}

uint64_t container_copy_info(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 1LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  uint64_t v4 = _os_activity_create(&dword_18028C000, "container_copy_info", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_copy_info_block_invoke;
  block[3] = &unk_18963A408;
  void block[5] = &v14;
  void block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v15;
  uint64_t v6 = v15[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error((uint64_t)"container_copy_info", gClientFaultLoggingEnabled, v6);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

xpc_object_t __container_copy_info_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(v2 + 88);
  if (v3 && (uint64_t v4 = *(void **)(v3 + 136)) != 0LL)
  {
    xpc_object_t dictionary = xpc_array_get_dictionary(v4, *(unsigned int *)(v2 + 96));
    uint64_t v2 = a1[6];
  }

  else
  {
    xpc_object_t dictionary = *(xpc_object_t *)(v2 + 80);
  }

  uint64_t v6 = *(void *)(v2 + 88);
  if (dictionary)
  {
    else {
      xpc_object_t v8 = *(xpc_object_t *)(v2 + 80);
    }
    xpc_object_t result = xpc_retain(v8);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  }

  else
  {
    if (v6)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v10 = (os_log_s *)container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v18 = 0;
        _os_log_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_DEFAULT,  "Retrieving the info from a container which was fetched by a query without the CONTAINER_QUERY_FLAGS_RESULT_INC LUDE_INFO option. If you want the info from queried containers, set that option on the query. That will be muc h faster than what is about to happen...",  v18,  2u);
      }
    }

    xpc_object_t result = (xpc_object_t)container_object_update_metadata(a1[6], 1, 0LL, (uint64_t *)(*(void *)(a1[5] + 8LL) + 24LL));
    if ((_DWORD)result)
    {
      uint64_t v11 = a1[6];
      uint64_t v12 = *(void *)(v11 + 88);
      if (v12 && (uint64_t v13 = *(void **)(v12 + 136)) != 0LL)
      {
        xpc_object_t result = xpc_array_get_dictionary(v13, *(unsigned int *)(v11 + 96));
        if (!result) {
          return result;
        }
      }

      else
      {
        xpc_object_t result = *(xpc_object_t *)(v11 + 80);
        if (!result) {
          return result;
        }
      }

      uint64_t v14 = a1[6];
      uint64_t v15 = *(void *)(v14 + 88);
      else {
        xpc_object_t v17 = *(xpc_object_t *)(v14 + 80);
      }
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_retain(v17);
      return container_object_set_info((void *)a1[6], 0LL);
    }
  }

  return result;
}

xpc_object_t container_get_info(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 88);
    else {
      return *(xpc_object_t *)(a1 + 80);
    }
  }

  else
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "container_get_info";
      _os_log_fault_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container parameter is NULL",  (uint8_t *)&v5,  0xCu);
    }

    return 0LL;
  }

xpc_object_t container_get_info_value_for_key(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (!a1 || !a2)
  {
    if (a1) {
      goto LABEL_11;
    }
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v6 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "container_get_info_value_for_key";
      _os_log_fault_impl( &dword_18028C000,  v6,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: container parameter is NULL",  (uint8_t *)&v9,  0xCu);
      if (a2) {
        return 0LL;
      }
    }

    else
    {
LABEL_11:
      if (a2) {
        return 0LL;
      }
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "container_get_info_value_for_key";
      _os_log_fault_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: key parameter is NULL",  (uint8_t *)&v9,  0xCu);
    }

    return 0LL;
  }

  uint64_t v3 = *(void *)(a1 + 88);
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 136);
    if (v4)
    {
      xpc_object_t dictionary = xpc_array_get_dictionary(v4, *(unsigned int *)(a1 + 96));
      if (!dictionary) {
        return 0LL;
      }
      return xpc_dictionary_get_value(dictionary, a2);
    }
  }

  xpc_object_t dictionary = *(xpc_object_t *)(a1 + 80);
  if (dictionary) {
    return xpc_dictionary_get_value(dictionary, a2);
  }
  return 0LL;
}

_DWORD *container_is_new(uint64_t a1)
{
  if (a1
    && (uint uid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 <= 0xD)
  {
    return container_object_is_new(a1);
  }

  else
  {
    return 0LL;
  }

uint64_t container_copy_sandbox_token(uint64_t a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  uint64_t v2 = _os_activity_create( &dword_18028C000,  "container_copy_sandbox_token",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_copy_sandbox_token_block_invoke;
  v5[3] = &unk_18963A430;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __container_copy_sandbox_token_block_invoke(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    unint64_t v2 = result;
    uint uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(result + 40));
    xpc_object_t result = uuid_is_null(uuid);
    if (!(_DWORD)result)
    {
      xpc_object_t result = container_object_get_identifier(v1);
      if (result)
      {
        xpc_object_t result = (unint64_t)container_object_get_class(v1);
        if (result - 1 <= 0xD)
        {
          uint64_t v4 = *(void *)(v2 + 40);
          uint64_t v5 = *(void *)(v4 + 88);
          else {
            xpc_object_t result = *(void *)(v4 + 48);
          }
          if (result) {
            xpc_object_t result = (unint64_t)strndup((const char *)result, 0x800uLL);
          }
          *(void *)(*(void *)(*(void *)(v2 + 32) + 8LL) + 24LL) = result;
        }
      }
    }
  }

  return result;
}

uint64_t container_copy_object(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2000000000LL;
    uint64_t v8 = 0LL;
    unint64_t v2 = _os_activity_create(&dword_18028C000, "container_copy_object", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
    v4[0] = MEMORY[0x1895FED80];
    v4[1] = 0x40000000LL;
    void v4[2] = __container_copy_object_block_invoke;
    v4[3] = &unk_18963A458;
    v4[4] = &v5;
    void v4[5] = v1;
    os_activity_apply(v2, v4);
    os_release(v2);
    uint64_t v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

unsigned __int8 *__container_copy_object_block_invoke(uint64_t a1)
{
  xpc_object_t result = container_object_copy(*(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void *container_free_array_of_containers(void *result, uint64_t a2)
{
  uint64_t __s = (uint64_t)result;
  if (result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    if (a2)
    {
      uint64_t v4 = (void **)result;
      do
      {
        uint64_t v5 = *v4++;
        container_object_free(v5);
        --v2;
      }

      while (v2);
    }

    free(v3);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return result;
}

char *container_copy_unlocalized_description(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  uint64_t v11 = 0LL;
  if (!a1) {
    return strdup("<NULL>");
  }
  unint64_t identifier = (const char *)container_object_get_identifier(a1);
  uint64_t v3 = container_object_get_class(a1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
  creator_codesign_unint64_t identifier = (const char *)container_object_get_creator_codesign_identifier(a1);
  unsigned int uid = container_object_get_uid(a1);
  else {
    uint64_t v7 = (const char *)&unk_1802B435E;
  }
  if (!persona_unique_string) {
    persona_unique_string = (const char *)&unk_1802B435E;
  }
  if (creator_codesign_identifier)
  {
    uint64_t v8 = "|";
  }

  else
  {
    creator_codesign_unint64_t identifier = (const char *)&unk_1802B435E;
    uint64_t v8 = (const char *)&unk_1802B435E;
  }

  memset(out, 0, 37);
  uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(a1);
  uuid_unparse_upper(uuid, out);
  asprintf( &v11,  "[%s%s:%s:%u:%s:(%s%s%s)]",  v7,  *((const char **)&_CONTAINER_NAMES + (void)v3),  identifier,  uid,  persona_unique_string,  out,  v8,  creator_codesign_identifier);
  return v11;
}

void *container_create_merged_array(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = a4;
  uint64_t v8 = a2;
  uint64_t v22 = *MEMORY[0x1895FEE08];
  else {
    size_t v10 = a4 + a2;
  }
  uint64_t v11 = calloc(v10, 8uLL);
  if (!v11)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v16 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218240;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      _os_log_error_impl( &dword_18028C000,  v16,  OS_LOG_TYPE_ERROR,  "Could not allocate memory to merge container arrays: %zu + %zu",  (uint8_t *)&v18,  0x16u);
    }

    return 0LL;
  }

  uint64_t v12 = v11;
  if (v8)
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = container_copy_object(*(void *)(a1 + 8 * v13));
      v12[v13] = v14;
      if (!v14) {
        goto LABEL_19;
      }
    }

    while (v8 != ++v13);
  }

  if (v6)
  {
    while (1)
    {
      uint64_t v15 = container_copy_object(*a3);
      v12[v8] = v15;
      if (!v15) {
        break;
      }
      ++v8;
      ++a3;
      if (!--v6) {
        goto LABEL_12;
      }
    }

    uint64_t v13 = v8;
LABEL_19:
    container_free_array_of_containers(v12, v13);
    return 0LL;
  }

LABEL_12:
  if (a5) {
    *a5 = v8;
  }
  return v12;
}

BOOL container_is_equal(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    if (a1 == a2) {
      return 1LL;
    }
    uunsigned int uid = container_object_get_uuid(a1);
    uint64_t v6 = container_object_get_uuid(a2);
    if (uuid && v6)
    {
      if (*(void *)uuid != *(void *)v6 || *(void *)(uuid + 8) != *(void *)(v6 + 8)) {
        return 0LL;
      }
    }

    else if (uuid_compare((const unsigned __int8 *)uuid, (const unsigned __int8 *)v6))
    {
      return 0LL;
    }

    uint64_t v7 = container_object_get_class(a1);
    if (v7 == container_object_get_class(a2))
    {
      unsigned int uid = container_object_get_uid(a1);
      if (uid == container_object_get_uid(a2))
      {
        unsigned int v9 = container_object_is_transient(a1);
        if (v9 == container_object_is_transient(a2))
        {
          persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
          uint64_t v11 = (const char *)container_object_get_persona_unique_string(a2);
          if ((persona_unique_string != 0LL) == (v11 != 0LL)
            && (!persona_unique_string || !v11 || !strncmp(persona_unique_string, v11, 0x400uLL)))
          {
            unint64_t identifier = (const char *)container_object_get_identifier(a1);
            uint64_t v13 = (const char *)container_object_get_identifier(a2);
            return strncmp(identifier, v13, 0x400uLL) == 0;
          }
        }
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t container_sandbox_extension_revoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    int v2 = a2;
    if (__initialize_container_sandbox_extensions_onceToken != -1) {
      dispatch_once(&__initialize_container_sandbox_extensions_onceToken, &__block_literal_global_674);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    if (v2)
    {
      uint64_t v3 = os_map_str_find();
      if (v3)
      {
        uint64_t v4 = *(void *)(v3 + 24);
        if (v4)
        {
          uint64_t v5 = 0LL;
          uint64_t v6 = (int *)(v3 + 40);
          while (1)
          {
            int v7 = *v6;
            if (*v6)
            {
              if (v6[1] == v2) {
                break;
              }
            }

            ++v5;
            v6 += 4;
            if (v4 == v5) {
              goto LABEL_28;
            }
          }

          if (v7 == 1)
          {
            uint64_t v8 = (uint64_t *)(v3 + 32 + 16 * v5);
            uint64_t v16 = 0LL;
            xpc_object_t v17 = &v16;
            uint64_t v18 = 0x2000000000LL;
            uint64_t v19 = 0LL;
            os_map_str_foreach();
            if (v17[3])
            {
              os_map_str_delete();
              unsigned int v9 = (void *)v17[3];
              if (v9)
              {
                free(v9);
                memset_s(v17 + 3, 8uLL, 0, 8uLL);
              }
            }

            int v10 = sandbox_extension_release();
            if (v10)
            {
              if (v10 < 0)
              {
                if (container_log_handle_for_category_onceToken != -1) {
                  dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
                }
                uint64_t v11 = (os_log_s *)qword_18C438D40;
                if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
                {
                  int v12 = *__error();
                  *(_DWORD *)__int128 buf = 67109120;
                  LODWORD(v21) = v12;
                  _os_log_error_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_ERROR,  "container_sandbox_extension_revoke(): error %d releasing sandbox extension",  buf,  8u);
                }
              }
            }

            else
            {
              if (container_log_handle_for_category_onceToken != -1) {
                dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
              }
              uint64_t v13 = (os_log_s *)qword_18C438D40;
              if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v14 = *v8;
                *(_DWORD *)__int128 buf = 134217984;
                uint64_t v21 = v14;
                _os_log_impl( &dword_18028C000,  v13,  OS_LOG_TYPE_DEFAULT,  "Revoked sandbox extension; handle = %lld",
                  buf,
                  0xCu);
              }
            }

            uint64_t *v8 = 0LL;
            v8[1] = 0LL;
            _Block_object_dispose(&v16, 8);
          }

          else
          {
            *uint64_t v6 = v7 - 1;
          }
        }
      }
    }

BOOL ____locked_revoke_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40) + 1LL;
  if (v3 == a3) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return v3 != a3;
}

void ____initialize_container_sandbox_extensions_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  os_map_str_init();
  __initialize_container_sandbox_extensions_queue = (uint64_t)dispatch_queue_create( "com.apple.containermanager.sandbox-extensions",  0LL);
  uint32_t v0 = notify_register_dispatch( "com.apple.containermanagerd.user-invalidated",  (int *)&__initialize_container_sandbox_extensions_notify_token,  (dispatch_queue_t)__initialize_container_sandbox_extensions_queue,  &__block_literal_global_4);
  if (v0)
  {
    uint32_t v1 = v0;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    int v2 = (os_log_s *)qword_18C438D40;
    if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_error_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_ERROR,  "Could not register for user invalidated notifications; unint64_t status = %u",
        (uint8_t *)v3,
        8u);
    }
  }

void ____initialize_container_sandbox_extensions_block_invoke_2()
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  uint64_t v14 = 1LL;
  uint64_t v0 = container_copy_persona_unique_strings(&v14);
  if (v0 && v14 == 1)
  {
    uint32_t v1 = (void *)v0;
    os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    size_t v2 = os_map_str_count();
    if (v2 <= 1) {
      size_t v2 = 1LL;
    }
    uint64_t v3 = calloc(v2, 8uLL);
    uint64_t v21 = v3;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v4 = MEMORY[0x1895FED80];
    v16[6] = MEMORY[0x1895FED80];
    v16[7] = 0x40000000LL;
    v16[8] = ____locked_clear_dead_personas_block_invoke;
    v16[9] = &unk_18963A580;
    v16[10] = &v17;
    v16[11] = v3;
    os_map_str_foreach();
    v16[0] = v4;
    v16[1] = 0x40000000LL;
    v16[2] = ____locked_clear_dead_personas_block_invoke_2;
    v16[3] = &unk_18963A5A8;
    v16[4] = &v17;
    v16[5] = v3;
    ____locked_clear_dead_personas_block_invoke_2((uint64_t)v16, "default");
    applier[0] = v4;
    applier[1] = 0x40000000LL;
    applier[2] = ____locked_clear_dead_personas_block_invoke_3;
    applier[3] = &unk_18963A5D0;
    applier[4] = v16;
    xpc_array_apply(v1, applier);
    uint64_t v5 = v18;
    if (v18[3])
    {
      unint64_t v6 = 0LL;
      do
      {
        if (v3[v6])
        {
          uint64_t v7 = os_map_str_find();
          uint64_t v23 = v7;
          if (v7)
          {
            uint64_t v8 = (void *)v7;
            unsigned int v9 = (void *)os_map_str_entry();
            uint64_t __s = v9;
            os_map_str_delete();
            if (v9)
            {
              free(v9);
              memset_s(&__s, 8uLL, 0, 8uLL);
            }

            if (v8[3])
            {
              unint64_t v10 = 0LL;
              uint64_t v11 = v8 + 5;
              do
              {
                if (*v11 && (sandbox_extension_release() & 0x80000000) != 0)
                {
                  if (container_log_handle_for_category_onceToken != -1) {
                    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
                  }
                  int v12 = (os_log_s *)qword_18C438D40;
                  if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
                  {
                    int v13 = *__error();
                    *(_DWORD *)__int128 buf = 67109120;
                    int v25 = v13;
                    _os_log_error_impl( &dword_18028C000,  v12,  OS_LOG_TYPE_ERROR,  "container_sandbox_extension_revoke_all(): error %d releasing sandbox extension",  buf,  8u);
                  }
                }

                ++v10;
                v11 += 4;
              }

              while (v10 < v8[3]);
            }

            os_map_str_clear();
            os_map_str_destroy();
            free(v8);
            memset_s(&v23, 8uLL, 0, 8uLL);
          }

          uint64_t v5 = v18;
        }

        ++v6;
      }

      while (v6 < v5[3]);
    }

    if (v3)
    {
      free(v3);
      memset_s(&v21, 8uLL, 0, 8uLL);
    }

    _Block_object_dispose(&v17, 8);
    os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    xpc_release(v1);
  }

uint64_t ____locked_clear_dead_personas_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 40) + 8LL * (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))++) = a2;
  return 1LL;
}

uint64_t ____locked_clear_dead_personas_block_invoke_2(uint64_t result, char *__s2)
{
  if (__s2)
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
    if (v2)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = *(void *)(result + 40);
      while (1)
      {
        BOOL result = *(void *)(v5 + 8 * v4);
        if (result)
        {
          BOOL result = strcmp((const char *)result, __s2);
          if (!(_DWORD)result) {
            break;
          }
        }

        if (v2 == ++v4) {
          return result;
        }
      }

      *(void *)(v5 + 8 * v4) = 0LL;
    }
  }

  return result;
}

uint64_t ____locked_clear_dead_personas_block_invoke_3(uint64_t a1, int a2, xpc_object_t xstring)
{
  uint64_t v3 = *(void *)(a1 + 32);
  string_ptr = xpc_string_get_string_ptr(xstring);
  (*(void (**)(uint64_t, const char *))(v3 + 16))(v3, string_ptr);
  return 1LL;
}

uint64_t ____locked_clear_per_persona_data_block_invoke(int a1, void *a2)
{
  uint64_t __s = a2;
  if (a2)
  {
    free(a2);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  return 1LL;
}

uint64_t container_sandbox_extension_consume(uint64_t a1, const char *a2, const char *a3, int a4)
{
  uint64_t v34 = *MEMORY[0x1895FEE08];
  if (__initialize_container_sandbox_extensions_onceToken != -1) {
    dispatch_once(&__initialize_container_sandbox_extensions_onceToken, &__block_literal_global_674);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  if (!a3) {
    a3 = "default";
  }
  uint64_t v7 = (void *)os_map_str_find();
  uint64_t __s = v7;
  if (!v7)
  {
    uint64_t v7 = calloc(1uLL, 0x3E0uLL);
    uint64_t __s = v7;
    os_map_str_init();
    v7[3] = 60LL;
    strdup(a3);
    os_map_str_insert();
  }

  uint64_t v8 = os_map_str_find();
  if (v8)
  {
    unsigned int v9 = &v7[2 * v8];
    unint64_t v10 = v9 + 4;
    int v11 = *((_DWORD *)v9 + 6);
    if (v11 != -1)
    {
      if (a4) {
        *(v10 - 1) = 0xFFFFFFFFLL;
      }
      else {
        *((_DWORD *)v10 - 2) = v11 + 1;
      }
    }

    unsigned int v23 = *((_DWORD *)v10 - 1);
  }

  else
  {
    uint64_t v12 = v7[3];
    if (v12)
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 5LL;
      while (LODWORD(v7[v14]))
      {
        ++v13;
        v14 += 2LL;
        if (v12 == v13) {
          goto LABEL_15;
        }
      }
    }

    else
    {
LABEL_15:
      uint64_t v15 = calloc(1uLL, 32 * v12 + 32);
      memcpy(v15, v7, 16 * v12 + 32);
      v15[3] = 2LL * v7[3];
      free(v7);
      memset_s(&__s, 8uLL, 0, 8uLL);
      uint64_t __s = v15;
      os_map_str_entry();
      os_map_str_delete();
      os_map_str_insert();
      uint64_t v7 = __s;
      uint64_t v13 = v12;
    }

    uint64_t v16 = sandbox_extension_consume();
    if (v16 < 0)
    {
      int v26 = *__error();
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v27 = (os_log_s *)qword_18C438D40;
      if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
      {
        int v28 = *__error();
        *(_DWORD *)__int128 buf = 67109120;
        LODWORD(v31) = v28;
        _os_log_error_impl( &dword_18028C000,  v27,  OS_LOG_TYPE_ERROR,  "container_sandbox_extension_consume(): error %d consuming sandbox extension",  buf,  8u);
      }

      *__error() = v26;
      unsigned int v23 = -1;
    }

    else
    {
      uint64_t v17 = v16;
      uint64_t v18 = v7 + 4;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v19 = (os_log_s *)qword_18C438D40;
      if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int128 v31 = a2;
        __int16 v32 = 2048;
        uint64_t v33 = v17;
        _os_log_impl( &dword_18028C000,  v19,  OS_LOG_TYPE_DEFAULT,  "Consumed sandbox extension; unint64_t path = [%s], handle = %lld",
          buf,
          0x16u);
      }

      v18[2 * v13] = v17;
      if (a4) {
        int v20 = -1;
      }
      else {
        int v20 = 1;
      }
      uint64_t v21 = &v18[2 * v13];
      *((_DWORD *)v21 + 2) = v20;
      int v22 = next_temp_key;
      if (a4) {
        int v22 = 0;
      }
      *((_DWORD *)v21 + 3) = v22;
      ++next_temp_key;
      strndup(a2, 0x400uLL);
      os_map_str_insert();
      unsigned int v23 = *((_DWORD *)v21 + 3);
    }
  }

  int v24 = *__error();
  os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  *__error() = v24;
  return v23;
}

uint64_t container_sandbox_issue_extension(_OWORD *a1, uint64_t a2)
{
  return container_sandbox_issue_custom_extension(*MEMORY[0x189600790], a1, a2);
}

uint64_t container_sandbox_issue_custom_extension(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  if (a2)
  {
    __int128 v5 = a2[1];
    *(_OWORD *)int v11 = *a2;
    *(_OWORD *)&v11[16] = v5;
    uint64_t v6 = sandbox_extension_issue_file_to_process();
  }

  else
  {
    uint64_t v6 = sandbox_extension_issue_file();
  }

  uint64_t v7 = v6;
  if (!v6)
  {
    int v8 = *__error();
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unsigned int v9 = (os_log_s *)qword_18C438D40;
    if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v11 = 136446722;
      *(void *)&v11[4] = a1;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = a3;
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = v8;
      _os_log_error_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_ERROR,  "sandbox_extension_issue_file failed for class %{public}s at path [%s]: %d",  v11,  0x1Cu);
    }

    *__error() = v8;
  }

  return v7;
}

unsigned __int8 *container_object_create( const unsigned __int8 *a1, const char *a2, uint64_t a3, int a4, const char *a5, const char *a6, const char *a7, void *a8, const char *a9, unsigned __int8 a10, unsigned __int8 a11, const char *a12, const char *a13, void *a14)
{
  if (a1 && a2 && a6 && (int is_null = uuid_is_null(a1), (unint64_t)(a3 - 1) <= 0xD) && !is_null)
  {
    unsigned int v23 = (unsigned __int8 *)calloc(1uLL, 0x70uLL);
    uuid_copy(v23, a1);
    *((void *)v23 + 3) = strdup(a2);
    if (a5) {
      int v24 = strdup(a5);
    }
    else {
      int v24 = 0LL;
    }
    *((void *)v23 + 4) = v24;
    *((void *)v23 + 7) = strdup(a6);
    if (a7) {
      int v25 = strdup(a7);
    }
    else {
      int v25 = 0LL;
    }
    *((void *)v23 + 5) = v25;
    *((void *)v23 + 2) = a3;
    *((_DWORD *)v23 + 26) = a4;
    if (a8) {
      xpc_object_t v26 = xpc_retain(a8);
    }
    else {
      xpc_object_t v26 = 0LL;
    }
    *((void *)v23 + 10) = v26;
    *((_DWORD *)v23 + 25) = 0;
    *((_WORD *)v23 + 55) = 0;
    if (a9) {
      uint64_t v27 = strndup(a9, 0x800uLL);
    }
    else {
      uint64_t v27 = 0LL;
    }
    *((void *)v23 + 6) = v27;
    v23[108] = a10;
    v23[109] = a11;
    *((void *)v23 + 11) = 0LL;
    *((_DWORD *)v23 + 24) = -1;
    if (a12) {
      int v28 = strdup(a12);
    }
    else {
      int v28 = 0LL;
    }
    *((void *)v23 + 8) = v28;
    if (a13) {
      int v29 = strdup(a13);
    }
    else {
      int v29 = 0LL;
    }
    *((void *)v23 + 9) = v29;
  }

  else
  {
    unsigned int v23 = 0LL;
    if (a14) {
      *a14 = 11LL;
    }
  }

  return v23;
}

void *container_object_create_blank()
{
  return calloc(1uLL, 0x70uLL);
}

void container_object_free(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  uint64_t __s = a1;
  if (a1)
  {
    if (a1[11])
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      uint64_t v2 = (os_log_s *)qword_18C438D50;
      if (os_log_type_enabled((os_log_t)qword_18C438D50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v13 = "container_object_free";
        _os_log_fault_impl( &dword_18028C000,  v2,  OS_LOG_TYPE_FAULT,  "%s: SPI MISUSE: Attempt to free container_object_t that is owned by a container_query_t. Ignoring.",  buf,  0xCu);
      }
    }

    else
    {
      if (*((_BYTE *)a1 + 110)) {
        container_sandbox_extension_revoke(a1[5], *((unsigned int *)a1 + 25));
      }
      uint64_t v3 = (void *)a1[3];
      if (v3)
      {
        free(v3);
        memset_s(a1 + 3, 8uLL, 0, 8uLL);
      }

      uint64_t v4 = (void *)a1[4];
      if (v4)
      {
        free(v4);
        memset_s(a1 + 4, 8uLL, 0, 8uLL);
      }

      __int128 v5 = (void *)a1[7];
      if (v5)
      {
        free(v5);
        memset_s(a1 + 7, 8uLL, 0, 8uLL);
      }

      uint64_t v6 = (void *)a1[5];
      if (v6)
      {
        free(v6);
        memset_s(a1 + 5, 8uLL, 0, 8uLL);
      }

      uint64_t v7 = (void *)a1[6];
      if (v7)
      {
        free(v7);
        memset_s(a1 + 6, 8uLL, 0, 8uLL);
      }

      int v8 = (void *)a1[10];
      if (v8) {
        xpc_release(v8);
      }
      unsigned int v9 = (void *)a1[8];
      a1[10] = 0LL;
      if (v9)
      {
        free(v9);
        memset_s(a1 + 8, 8uLL, 0, 8uLL);
      }

      unint64_t v10 = (void *)a1[9];
      if (v10)
      {
        free(v10);
        memset_s(a1 + 9, 8uLL, 0, 8uLL);
      }

      free(a1);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

unsigned __int8 *container_object_copy(uint64_t a1)
{
  uint uid = (const unsigned __int8 *)container_object_get_uuid(a1);
  unint64_t identifier = (const char *)container_object_get_identifier(a1);
  uint64_t v18 = container_object_get_class(a1);
  int uid = container_object_get_uid(a1);
  unint64_t path = (const char *)container_object_get_path(a1);
  unint64_t unique_path_component = (const char *)container_object_get_unique_path_component(a1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
  uint64_t v6 = *(void *)(a1 + 88);
  if (v6 && (uint64_t v7 = *(void **)(v6 + 136)) != 0LL)
  {
    xpc_object_t dictionary = xpc_array_get_dictionary(v7, *(unsigned int *)(a1 + 96));
    uint64_t v6 = *(void *)(a1 + 88);
    if (!v6) {
      goto LABEL_8;
    }
  }

  else
  {
    xpc_object_t dictionary = *(xpc_object_t *)(a1 + 80);
    if (!v6)
    {
LABEL_8:
      string = *(const char **)(a1 + 48);
      goto LABEL_9;
    }
  }

  unsigned int v9 = *(void **)(v6 + 128);
  if (!v9) {
    goto LABEL_8;
  }
  string = xpc_array_get_string(v9, *(unsigned int *)(a1 + 96));
LABEL_9:
  unsigned __int8 v11 = container_object_is_new(a1);
  unsigned __int8 v12 = container_object_is_transient(a1);
  user_managed_assets_relative_unint64_t path = (const char *)container_object_get_user_managed_assets_relative_path(a1);
  creator_codesign_unint64_t identifier = (const char *)container_object_get_creator_codesign_identifier(a1);
  uint64_t v15 = container_object_create( uuid,  identifier,  (uint64_t)v18,  uid,  path,  unique_path_component,  persona_unique_string,  dictionary,  string,  v11,  v12,  user_managed_assets_relative_path,  creator_codesign_identifier,  0LL);
  uint64_t v16 = v15;
  if (v15 && *(_BYTE *)(a1 + 110)) {
    container_object_sandbox_extension_activate((uint64_t)v15, *(unsigned __int8 *)(a1 + 111));
  }
  return v16;
}

uint64_t container_object_get_uuid(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2)
  {
    uint64_t v3 = *(void **)(v2 + 120);
    if (v3)
    {
      bytes_ptr = xpc_data_get_bytes_ptr(v3);
      if (bytes_ptr && (unsigned int v5 = *(_DWORD *)(v1 + 96), bytes_ptr[2] > v5)) {
        return (uint64_t)&bytes_ptr[6 * v5 + 6];
      }
      else {
        return 0LL;
      }
    }
  }

  return v1;
}

unint64_t container_object_get_identifier(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 24);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 24);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_identifier_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

_DWORD *container_object_get_class(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(_DWORD **)(a1 + 16);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(_DWORD **)(a1 + 16);
  }
  BOOL result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5) {
      return 0LL;
    }
    else {
      return (_DWORD *)(result[6 * v5 + 10] & 0x3FLL);
    }
  }

  return result;
}

_DWORD *container_object_get_uid(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return (_DWORD *)*(unsigned int *)(a1 + 104);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return (_DWORD *)*(unsigned int *)(a1 + 104);
  }
  BOOL result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5) {
      return 0LL;
    }
    else {
      return (_DWORD *)result[6 * v5 + 11];
    }
  }

  return result;
}

unint64_t container_object_get_path(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 32);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 32);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_path_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

unint64_t container_object_get_unique_path_component(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 56);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 56);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_unique_path_component_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

unint64_t container_object_get_persona_unique_string(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 40);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 40);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_persona_unique_string_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

_DWORD *container_object_is_new(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return (_DWORD *)(*(_BYTE *)(a1 + 108) != 0);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return (_DWORD *)(*(_BYTE *)(a1 + 108) != 0);
  }
  BOOL result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5) {
      return 0LL;
    }
    else {
      return (_DWORD *)(LOBYTE(result[6 * v5 + 10]) >> 7);
    }
  }

  return result;
}

_DWORD *container_object_is_transient(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return (_DWORD *)(*(_BYTE *)(a1 + 109) != 0);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return (_DWORD *)(*(_BYTE *)(a1 + 109) != 0);
  }
  BOOL result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5) {
      return 0LL;
    }
    else {
      return (_DWORD *)((LOBYTE(result[6 * v5 + 10]) >> 6) & 1);
    }
  }

  return result;
}

unint64_t container_object_get_user_managed_assets_relative_path(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 64);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 64);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_uma_relative_path_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

unint64_t container_object_get_creator_codesign_identifier(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2) {
    return *(void *)(a1 + 72);
  }
  uint64_t v3 = *(void **)(v2 + 120);
  if (!v3) {
    return *(void *)(a1 + 72);
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_creator_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

uint64_t container_object_sandbox_extension_activate(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v4 = (os_log_s *)qword_18C438D40;
  if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = "false";
    if (a2) {
      uint64_t v14 = "true";
    }
    int v18 = 136446466;
    uint64_t v19 = "container_object_sandbox_extension_activate";
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    _os_log_debug_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s(container, %{public}s)",  (uint8_t *)&v18,  0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 88);
  if (v5 && (uint64_t v6 = *(void **)(v5 + 128)) != 0LL)
  {
    string = xpc_array_get_string(v6, *(unsigned int *)(a1 + 96));
    if (!string)
    {
LABEL_7:
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v8 = (os_log_s *)qword_18C438D40;
      if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v9 = "false";
        if (a2) {
          unsigned int v9 = "true";
        }
        int v18 = 136446466;
        uint64_t v19 = "container_object_sandbox_extension_activate";
        __int16 v20 = 2082;
        uint64_t v21 = v9;
        _os_log_debug_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s(container, %{public}s): no sandbox token in container",  (uint8_t *)&v18,  0x16u);
      }

      return 1LL;
    }
  }

  else
  {
    string = *(const char **)(a1 + 48);
    if (!string) {
      goto LABEL_7;
    }
  }

  if (!*(_BYTE *)(a1 + 110) || !*(_BYTE *)(a1 + 111) && a2)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    unint64_t v10 = (os_log_s *)qword_18C438D40;
    if (os_log_type_enabled((os_log_t)qword_18C438D40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = "false";
      if (a2) {
        uint64_t v15 = "true";
      }
      int v16 = *(unsigned __int8 *)(a1 + 110);
      uint64_t v19 = "container_object_sandbox_extension_activate";
      int v18 = 136446722;
      __int16 v20 = 2082;
      uint64_t v21 = v15;
      if (v16) {
        uint64_t v17 = "upgrading";
      }
      else {
        uint64_t v17 = "consuming";
      }
      __int16 v22 = 2082;
      unsigned int v23 = v17;
      _os_log_debug_impl( &dword_18028C000,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s(container, %{public}s): %{public}s container extension",  (uint8_t *)&v18,  0x20u);
    }

    unint64_t path = (const char *)container_object_get_path(a1);
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    *(_DWORD *)(a1 + 100) = container_sandbox_extension_consume((uint64_t)string, path, persona_unique_string, a2);
    *(_BYTE *)(a1 + 111) = a2;
    *(_BYTE *)(a1 + 110) = 1;
  }

  return 1LL;
}

xpc_object_t container_object_get_info(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  else {
    return *(xpc_object_t *)(a1 + 80);
  }
}

const char *container_object_get_sandbox_token(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  else {
    return *(const char **)(a1 + 48);
  }
}

uint64_t container_object_get_query(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

void *container_object_set_class(void *a1, uint64_t a2)
{
  BOOL result = __container_object_separate_from_query(a1);
  a1[2] = a2;
  return result;
}

void *__container_object_separate_from_query(void *result)
{
  if (!result[11]) {
    return result;
  }
  uint64_t v1 = (uint64_t)result;
  uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid((uint64_t)result);
  unint64_t identifier = (const char *)container_object_get_identifier(v1);
  uint64_t v17 = container_object_get_class(v1);
  unsigned int uid = container_object_get_uid(v1);
  unint64_t path = (const char *)container_object_get_path(v1);
  unint64_t unique_path_component = (const char *)container_object_get_unique_path_component(v1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(v1);
  uint64_t v7 = *(void *)(v1 + 88);
  if (v7 && (int v8 = *(void **)(v7 + 136)) != 0LL)
  {
    xpc_object_t dictionary = xpc_array_get_dictionary(v8, *(unsigned int *)(v1 + 96));
    uint64_t v7 = *(void *)(v1 + 88);
    if (!v7) {
      goto LABEL_9;
    }
  }

  else
  {
    xpc_object_t dictionary = *(xpc_object_t *)(v1 + 80);
    if (!v7)
    {
LABEL_9:
      string = *(const char **)(v1 + 48);
      goto LABEL_10;
    }
  }

  unint64_t v10 = *(void **)(v7 + 128);
  if (!v10) {
    goto LABEL_9;
  }
  string = xpc_array_get_string(v10, *(unsigned int *)(v1 + 96));
LABEL_10:
  unsigned __int8 v12 = container_object_is_new(v1);
  unsigned __int8 v13 = container_object_is_transient(v1);
  uuid_copy((unsigned __int8 *)v1, uuid);
  *(void *)(v1 + 24) = strdup(identifier);
  if (path) {
    uint64_t v14 = strdup(path);
  }
  else {
    uint64_t v14 = 0LL;
  }
  *(void *)(v1 + 32) = v14;
  *(void *)(v1 + 56) = strdup(unique_path_component);
  if (persona_unique_string) {
    uint64_t v15 = strdup(persona_unique_string);
  }
  else {
    uint64_t v15 = 0LL;
  }
  *(void *)(v1 + 40) = v15;
  *(void *)(v1 + 16) = v17;
  *(_DWORD *)(v1 + 104) = uid;
  if (dictionary) {
    BOOL result = xpc_retain(dictionary);
  }
  else {
    BOOL result = 0LL;
  }
  *(void *)(v1 + 80) = result;
  if (!*(void *)(v1 + 48))
  {
    if (string) {
      BOOL result = strndup(string, 0x800uLL);
    }
    else {
      BOOL result = 0LL;
    }
    *(void *)(v1 + 48) = result;
  }

  *(_BYTE *)(v1 + 108) = v12;
  *(_BYTE *)(v1 + 109) = v13;
  *(void *)(v1 + 88) = 0LL;
  *(_DWORD *)(v1 + 96) = -1;
  return result;
}

char *container_object_set_path(void *a1, const char *a2)
{
  uint64_t v6 = (void *)a1[4];
  uint64_t v5 = (char **)(a1 + 4);
  uint64_t v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  BOOL result = strndup(a2, 0x400uLL);
  *uint64_t v5 = result;
  return result;
}

char *container_object_set_unique_path_component(void *a1, const char *a2)
{
  uint64_t v6 = (void *)a1[7];
  uint64_t v5 = (char **)(a1 + 7);
  uint64_t v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  BOOL result = strndup(a2, 0x400uLL);
  *uint64_t v5 = result;
  return result;
}

xpc_object_t container_object_set_info(void *a1, void *a2)
{
  uint64_t v4 = (void *)a1[10];
  if (v4) {
    xpc_release(v4);
  }
  if (a2) {
    xpc_object_t result = xpc_retain(a2);
  }
  else {
    xpc_object_t result = 0LL;
  }
  a1[10] = result;
  return result;
}

char *container_object_set_sandbox_token(void *a1, const char *a2)
{
  uint64_t v6 = (void *)a1[6];
  uint64_t v5 = (char **)(a1 + 6);
  uint64_t v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  if (a2) {
    xpc_object_t result = strndup(a2, 0x800uLL);
  }
  else {
    xpc_object_t result = 0LL;
  }
  *uint64_t v5 = result;
  return result;
}

void *container_object_set_transient(uint64_t a1, char a2)
{
  xpc_object_t result = __container_object_separate_from_query((void *)a1);
  *(_BYTE *)(a1 + 109) = a2;
  return result;
}

void *container_object_set_is_new(uint64_t a1, char a2)
{
  xpc_object_t result = __container_object_separate_from_query((void *)a1);
  *(_BYTE *)(a1 + 108) = a2;
  return result;
}

void container_object_set_uuid(unsigned __int8 *a1, const unsigned __int8 *a2)
{
}

char *container_object_set_user_managed_assets_relative_path(void *a1, const char *a2)
{
  uint64_t v6 = (void *)a1[8];
  uint64_t v5 = (char **)(a1 + 8);
  uint64_t v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  xpc_object_t result = strndup(a2, 0x400uLL);
  *uint64_t v5 = result;
  return result;
}

char *container_object_set_creator_codesign_identifier(void *a1, const char *a2)
{
  uint64_t v6 = (void *)a1[9];
  uint64_t v5 = (char **)(a1 + 9);
  uint64_t v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }

  xpc_object_t result = strndup(a2, 0x400uLL);
  *uint64_t v5 = result;
  return result;
}

uint64_t container_object_set_backing_store_from_query(uint64_t result, uint64_t a2, int a3)
{
  *(void *)(result + 88) = a2;
  if (a2) {
    int v3 = a3;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 96) = v3;
  return result;
}

_BYTE *container_base64_encode(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  if (a2 % 3) {
    size_t v3 = (a2 % 3) ^ 3;
  }
  else {
    size_t v3 = 0LL;
  }
  unint64_t v4 = v3 + a2;
  unint64_t v5 = (v3 + a2) / 3;
  uint64_t v6 = calloc((4 * v5) | 1, 1uLL);
  uint64_t v7 = v6;
  if (v4 >= 3)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    unint64_t v10 = v5 - 1;
    if (v5 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v5;
    }
    do
    {
      unsigned int v12 = *(unsigned __int8 *)(a1 + 3 * v9) << 16;
      if (v3 >= 2 && v10 == v9)
      {
        uint64_t v13 = 2LL;
      }

      else
      {
        uint64_t v14 = 3 * v9 + a1;
        v12 |= *(unsigned __int8 *)(v14 + 1) << 8;
        if (v3 && v10 == v9)
        {
          uint64_t v13 = 3LL;
        }

        else
        {
          v12 |= *(unsigned __int8 *)(v14 + 2);
          uint64_t v13 = 4LL;
        }
      }

      uint64_t v15 = 0LL;
      uint64_t v16 = 6 * v13;
      do
      {
        unsigned int v17 = (v12 >> (v15 + 18)) & 0x3F;
        if (v17 <= 0x19)
        {
          char v18 = v17 + 65;
LABEL_23:
          v6[v8] = v18;
          goto LABEL_24;
        }

        if (v17 <= 0x33)
        {
          char v18 = v17 + 71;
          goto LABEL_23;
        }

        if (v17 <= 0x3D)
        {
          char v18 = v17 - 4;
          goto LABEL_23;
        }

        if (v17 == 62) {
          v6[v8] = 43;
        }
        else {
          v6[v8] = 47;
        }
LABEL_24:
        ++v8;
        v15 -= 6LL;
      }

      while (v16 + v15);
      ++v9;
    }

    while (v9 != v11);
  }

  if (v3) {
    memset(&v6[4 * v5 - v3], 61, v3);
  }
  return v7;
}

const char *container_base64_encode_string(const char *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    size_t v2 = strlen(result);
    return container_base64_encode(v1, v2);
  }

  return result;
}

char *container_base64_decode(char *a1, unint64_t *a2)
{
  return _container_base64_decode(a1, a2, 0);
}

char *_container_base64_decode(char *result, unint64_t *a2, unsigned int a3)
{
  if (result)
  {
    unint64_t v5 = result;
    size_t v6 = strlen(result);
    if ((v6 & 3) != 0)
    {
      return 0LL;
    }

    else
    {
      unint64_t v7 = v6;
      unint64_t v8 = v6 >> 2;
      uint64_t v9 = 3 * (v6 >> 2);
      if (v6)
      {
        size_t v10 = v6 - 1;
        uint64_t v11 = -1LL;
        do
        {
          int v12 = v5[v10];
          ++v11;
          BOOL v13 = v10-- != 0;
          unsigned int v14 = v13;
        }

        while (v13 && v12 == 61);
        if ((v12 & 0x3F) != 0) {
          uint64_t v15 = 0LL;
        }
        else {
          uint64_t v15 = v14;
        }
        uint64_t v16 = v11 + v15;
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      unint64_t v17 = v9 - v16;
      unint64_t v18 = v9 - v16 + a3;
      if (v18 <= 1) {
        size_t v19 = 1LL;
      }
      else {
        size_t v19 = v18;
      }
      xpc_object_t result = (char *)calloc(v19, 1uLL);
      uint64_t __s = result;
      if (v7 >= 4)
      {
        uint64_t v20 = 0LL;
        uint64_t v21 = 0LL;
        if (v8 <= 1) {
          uint64_t v22 = 1LL;
        }
        else {
          uint64_t v22 = v8;
        }
        while (2)
        {
          int v23 = 0;
          uint64_t v24 = v5;
          uint64_t v25 = 24LL;
          do
          {
            int v27 = *v24++;
            int v26 = v27;
            int v28 = v27 - 65;
            if ((v27 - 65) > 0x19)
            {
              if ((v26 - 97) > 0x19)
              {
                if ((v26 - 48) > 9)
                {
                  if (v26 == 43)
                  {
                    int v28 = 62;
                  }

                  else if (v26 == 61)
                  {
                    int v28 = 0;
                  }

                  else
                  {
                    if (v26 != 47)
                    {
                      if (!result) {
                        return result;
                      }
                      free(result);
                      memset_s(&__s, 8uLL, 0, 8uLL);
                      return 0LL;
                    }

                    int v28 = 63;
                  }
                }

                else
                {
                  int v28 = v26 + 4;
                }
              }

              else
              {
                int v28 = v26 - 71;
              }
            }

            v25 -= 6LL;
            v23 |= v28 << v25;
          }

          while (v25);
          uint64_t v29 = v21 + 1;
          result[v21] = BYTE2(v23);
          if (v21 + 1 < v17)
          {
            result[v29] = BYTE1(v23);
            if (v21 + 2 >= v17)
            {
              uint64_t v29 = v21 + 2;
            }

            else
            {
              uint64_t v29 = v21 + 3;
              result[v21 + 2] = v23;
            }
          }

          ++v20;
          v5 += 4;
          uint64_t v21 = v29;
          if (v20 != v22) {
            continue;
          }
          break;
        }
      }

      if (a2)
      {
        if (result) {
          *a2 = v18;
        }
      }
    }
  }

  return result;
}

char *container_base64_decode_string(char *a1)
{
  return _container_base64_decode(a1, 0LL, 1u);
}

const char *container_string_rom_create(const char **a1, size_t __count, int a3)
{
  size_t v3 = 0LL;
  v137 = 0LL;
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = (_DWORD)__count == 0;
  }
  char v5 = !v4;
  size_t v6 = 0LL;
  if ((_DWORD)__count == -1 || (v5 & 1) != 0) {
    goto LABEL_174;
  }
  unsigned int v7 = __count;
  else {
    int v8 = 0;
  }
  if ((_DWORD)__count)
  {
    uint64_t v9 = a1;
    size_t v10 = __count;
    size_t v3 = (char *)calloc(__count, 0x20uLL);
    v137 = v3;
    if (v3)
    {
      uint64_t v11 = 0LL;
      while (1)
      {
        size_t v6 = *v9;
        if (!*v9) {
          break;
        }
        size_t v12 = strlen(*v9);
        BOOL v13 = (const char **)&v3[v11];
        const char *v13 = v6;
        v13[1] = (const char *)(v12 + 1);
        v11 += 32LL;
        ++v9;
        if (32LL * v7 == v11) {
          goto LABEL_19;
        }
      }

      size_t v3 = 0LL;
    }

    else
    {
LABEL_53:
      size_t v6 = 0LL;
    }

    goto LABEL_174;
  }

  size_t v10 = 0LL;
  size_t v3 = 0LL;
LABEL_19:
  uint64_t v14 = 0LL;
  uint64_t v15 = MEMORY[0x1895FED80];
  while (v7)
  {
    uint64_t v16 = 0LL;
    do
    {
      if (v8)
      {
        unint64_t v17 = &v3[32 * v16];
        uint64_t v18 = *((void *)v17 + 1);
        uint64_t v19 = v18 + (v14 << 7);
        if (v18 >= 1)
        {
          uint64_t v20 = *(unsigned __int8 **)v17;
          do
          {
            unsigned int v21 = *v20++;
            uint64_t v19 = 257 * v19 + v21;
          }

          while ((unint64_t)v20 < *(void *)v17 + v18);
        }

        *((void *)v17 + 2) = (v19 << (v18 & 0x1F)) + v19;
      }

      *(_DWORD *)&v3[32 * v16++ + 24] = -1;
    }

    while (v16 != v10);
    if (v7 <= 1) {
      break;
    }
    uint64_t v22 = calloc(v10, 4uLL);
    uint64_t __s = v22;
    if (!v22) {
      goto LABEL_52;
    }
    uint64_t v23 = 0LL;
    do
    {
      *((_DWORD *)v22 + v23) = v23;
      ++v23;
    }

    while (v10 != v23);
    char v135 = 0;
    __compar[0] = v15;
    __compar[1] = 0x40000000LL;
    __compar[2] = __container_string_rom_create_block_invoke;
    __compar[3] = &__block_descriptor_tmp_758;
    size_t v3 = v137;
    __compar[4] = v137;
    __compar[5] = &v135;
    qsort_b(v22, v10, 4uLL, __compar);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

    if (v135) {
      char v24 = v8;
    }
    else {
      char v24 = 0;
    }
    if ((v24 & 1) == 0) {
      goto LABEL_41;
    }
    if (++v14 == 1024) {
      goto LABEL_52;
    }
  }

  LOWORD(v14) = 0;
LABEL_41:
  if (v8)
  {
    uint64_t v25 = calloc(v10, 8uLL);
    uint64_t __s = v25;
    if (!v25) {
      goto LABEL_52;
    }
    unsigned int v26 = 0;
    int v27 = v137 + 24;
    size_t v28 = v10;
    do
    {
      if (*v27 == -1) {
        *((void *)v25 + v26++) = *((void *)v27 - 1);
      }
      v27 += 8;
      --v28;
    }

    while (v28);
    BOOL v131 = v26 > 2;
    if (v26 <= 2)
    {
      free(v25);
      memset_s(&__s, 8uLL, 0, 8uLL);
      size_t v3 = 0LL;
      if (!v7) {
        goto LABEL_63;
      }
      goto LABEL_57;
    }

    size_t v3 = (char *)container_perfect_hash_create((uint64_t)v25, v26, 2uLL);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

    if (!v3)
    {
LABEL_52:
      size_t v3 = 0LL;
      goto LABEL_53;
    }
  }

  else
  {
    size_t v3 = 0LL;
    BOOL v131 = 0;
  }

  if (!v7)
  {
LABEL_63:
    uint64_t v30 = 0LL;
    uint64_t v29 = 0LL;
    goto LABEL_64;
  }

LABEL_57:
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  __int128 v31 = v137 + 24;
  size_t v32 = v10;
  do
  {
    if (*v31 == -1)
    {
      uint64_t v30 = v29;
      v29 += *((void *)v31 - 2);
    }

    v31 += 8;
    --v32;
  }

  while (v32);
LABEL_64:
  unsigned __int8 v33 = flsl(v30);
  unsigned __int8 v34 = v33;
  v132[6] = 0;
  v132[7] = v33;
  unsigned int v133 = v7;
  if (v3)
  {
    uint64_t v35 = *((void *)v3 + 5);
    int v36 = flsl(v7 - 1LL);
    unint64_t v37 = *((unsigned int *)v3 + 2);
    if ((v3[6] & 1) == 0)
    {
      v37 += (v37 + 3) >> 2;
    }

    unint64_t v38 = ((v35 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8 * (((unint64_t)v37 * v36 + 63) >> 6);
    char v39 = &v132[((v7 * (unint64_t)v34 + 63) >> 3) & 0x3FFFFFFFF8LL];
  }

  else
  {
    unint64_t v38 = ((v7 * (unint64_t)v33 + 63) >> 3) & 0x3FFFFFFFF8LL;
    char v39 = v132;
  }

  size_t v40 = &v39[v38 + 24] - v132 + v29;
  uint64_t v41 = (char *)calloc(1uLL, v40);
  size_t v6 = v41;
  if (v41)
  {
    *(_DWORD *)uint64_t v41 = 1297044051;
    v41[4] = 1;
    v41[6] = v131;
    v41[7] = v34;
    *((_DWORD *)v41 + 2) = v7;
    *((_WORD *)v41 + 6) = v14 & 0x3FF;
    *((void *)v41 + 2) = v40;
    if (v131
      && ((char v42 = v41 + 24, v6 == (const char *)-24LL)
       || (memcpy(v42, v3, *((void *)v3 + 5)), *((_BYTE *)v6 + 29) = 1, v6[6]))
      && v6 != (const char *)-24LL)
    {
      unint64_t v123 = (unint64_t)&v6[((*((void *)v6 + 8) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 24];
    }

    else
    {
      unint64_t v123 = 0LL;
    }

    int v43 = flsl(*((unsigned int *)v6 + 2) - 1LL);
    int v44 = v6 + 24;
    unsigned __int8 v129 = v34;
    if (!v6[6] || v6 == (const char *)-24LL)
    {
      unint64_t v56 = 0LL;
      LODWORD(v50) = *((_DWORD *)v6 + 2);
      unsigned int v51 = *((unsigned __int8 *)v6 + 7);
      BOOL v49 = v6 + 24;
      if (!v7) {
        goto LABEL_174;
      }
    }

    else
    {
      int v127 = v43;
      unint64_t v45 = (*((void *)v6 + 8) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
      int v46 = flsl(*((unsigned int *)v6 + 2) - 1LL);
      unint64_t v47 = *((unsigned int *)v6 + 8);
      if ((v6[30] & 1) == 0)
      {
        v47 += (v47 + 3) >> 2;
      }

      unint64_t v48 = v45 + 8 * (((unint64_t)v47 * v46 + 63) >> 6);
      BOOL v49 = &v44[v48];
      uint64_t v50 = *((unsigned int *)v6 + 2);
      unsigned int v51 = *((unsigned __int8 *)v6 + 7);
      if (v6[6])
      {
        uint64_t v52 = &v44[v48];
        unint64_t v53 = (*((void *)v6 + 8) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
        int v54 = flsl(v50 - 1);
        unint64_t v55 = *((unsigned int *)v6 + 8);
        if ((v6[30] & 1) == 0)
        {
          v55 += (v55 + 3) >> 2;
        }

        unint64_t v56 = v53 + 8 * (((unint64_t)v55 * v54 + 63) >> 6);
        BOOL v49 = v52;
      }

      else
      {
        unint64_t v56 = 0LL;
      }

      int v43 = v127;
      if (!v7) {
        goto LABEL_174;
      }
    }

    uint64_t v126 = (uint64_t)v3;
    uint64_t v57 = 0LL;
    unint64_t v58 = 0LL;
    uint64_t v59 = 0LL;
    int v60 = (char *)&v44[v56 + (((v50 * (unint64_t)v51 + 63) >> 3) & 0x3FFFFFFFF8LL)];
    uint64_t v61 = v129;
    BOOL v62 = v129 != 0;
    if (v49) {
      BOOL v62 = 0;
    }
    if (v43 == 64) {
      uint64_t v63 = -1LL;
    }
    else {
      uint64_t v63 = ~(-1LL << v43);
    }
    if (v129 == 64) {
      unint64_t v64 = -1LL;
    }
    else {
      unint64_t v64 = ~(-1LL << v129);
    }
    v128 = v60;
    unint64_t v130 = ~v64;
    int v65 = v61 > 0x40 || v62;
    unint64_t v125 = v43;
    if (v123) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = v43 == 0;
    }
    uint64_t v121 = ~v63;
    unint64_t v122 = v63;
    BOOL v67 = !v66 || v43 > 0x40;
    BOOL v124 = v67;
    do
    {
      __int16 v68 = v137;
      unsigned int v69 = *(_DWORD *)&v137[v57 + 24];
      if (v69 == -1)
      {
        if (v65) {
          goto LABEL_180;
        }
        unint64_t v76 = (v58 & 0x3F) + v61;
        if (v76)
        {
          unint64_t v77 = v60 - v128;
          uint64_t v78 = (v58 >> 3) & 0xFFFFFFFFFFFFFF8LL;
          if (v76 > 0x40)
          {
            uint64_t v100 = v78 + 8;
            BOOL v73 = __CFADD__(v100, v49);
            __int128 v101 = &v49[v100];
            if (v73 || (unint64_t)(v101 + 7) < 8) {
LABEL_178:
            }
              __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  180,  "((void)container_bitvector_set(): index too large for array, 0)");
            unint64_t v102 = v77 & v64;
            unint64_t v103 = __ROR8__(v102, v76);
            if (((v76 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              unint64_t v102 = v103;
            }
            v104.i64[0] = v64 >> v76;
            v104.i64[1] = v64 << -(char)v76;
            *(int8x16_t *)(v101 - 8) = vbslq_s8(v104, (int8x16_t)vdupq_n_s64(v102), *(int8x16_t *)(v101 - 8));
          }

          else
          {
            BOOL v73 = __CFADD__(v78, v49);
            uid_t v79 = (char *)&v49[v78];
            if (v73 || (unint64_t)(v79 + 7) < 8) {
LABEL_177:
            }
              __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  165,  "((void)container_bitvector_set(): index too large for array, 0)");
            uint64_t v80 = *(void *)v79;
            uint64_t v81 = __ROR8__(*(void *)v79, -(char)v76);
            if (((64 - v76) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              uint64_t v80 = v81;
            }
            unint64_t v82 = v80 & v130 | v77 & v64;
            unint64_t v83 = __ROR8__(v82, v76);
            if ((v76 & 0x1BF) != 0) {
              unint64_t v84 = v83;
            }
            else {
              unint64_t v84 = v82;
            }
            *(void *)uid_t v79 = v84;
          }
        }

        __int128 v105 = v49;
        memcpy(v60, *(const void **)&v68[v57], *(void *)&v68[v57 + 8]);
        v60 += *(void *)&v137[v57 + 8];
        if (!v131) {
          goto LABEL_165;
        }
        unint64_t v106 = container_perfect_hash_index_of(v126, *(void *)&v137[v57 + 16]);
        if ((v106 & 0x8000000000000000LL) != 0)
        {
          _os_crash();
          __break(1u);
LABEL_184:
          __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  144,  "((void)container_bitvector_set(): index too large for element width, 0)");
        }

        if (v124) {
LABEL_180:
        }
          __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  139,  "((void)container_bitvector_set(): bad argument, 0)");
        if (!is_mul_ok(v106, v125)) {
          goto LABEL_184;
        }
        unint64_t v107 = ((v106 * v125) & 0x3F) + v125;
        if (v107)
        {
          uint64_t v108 = ((v106 * v125) >> 3) & 0x1FFFFFFFFFFFFFF8LL;
          BOOL v49 = v105;
          if (v107 > 0x40)
          {
            uint64_t v115 = v108 + 8;
            BOOL v73 = __CFADD__(v115, v123);
            unint64_t v116 = v115 + v123;
            if (v73 || v116 + 7 < 8) {
              goto LABEL_178;
            }
            unint64_t v117 = __ROR8__(v122 & v59, v107);
            if (((v107 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              unint64_t v118 = v117;
            }
            else {
              unint64_t v118 = v122 & v59;
            }
            v119.i64[0] = v122 >> v107;
            v119.i64[1] = v122 << -(char)v107;
            *(int8x16_t *)(v116 - 8) = vbslq_s8(v119, (int8x16_t)vdupq_n_s64(v118), *(int8x16_t *)(v116 - 8));
          }

          else
          {
            BOOL v73 = __CFADD__(v108, v123);
            __int128 v109 = (unint64_t *)(v108 + v123);
            unint64_t v110 = *v109;
            unint64_t v111 = __ROR8__(*v109, -(char)v107);
            if (((64 - v107) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              unint64_t v110 = v111;
            }
            unint64_t v112 = v110 & v121 | v122 & v59;
            unint64_t v113 = __ROR8__(v112, v107);
            if ((v107 & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              unint64_t v114 = v113;
            }
            else {
              unint64_t v114 = v112;
            }
            *__int128 v109 = v114;
          }
        }

        else
        {
LABEL_165:
          BOOL v49 = v105;
        }
      }

      else
      {
        if (v65) {
          __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  80,  "((void)container_bitvector_get(): bad argument, 0)");
        }
        unint64_t v70 = v69 * (unint64_t)v61;
        unint64_t v71 = (v70 & 0x3F) + v61;
        if (v71)
        {
          uint64_t v72 = (v70 >> 3) & 0x1FFFFFFFF8LL;
          if (v71 > 0x40)
          {
            uint64_t v85 = v72 + 8;
            BOOL v73 = __CFADD__(v85, v49);
            __int16 v86 = &v49[v85];
            if (v73 || (unint64_t)(v86 + 7) < 8) {
              __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  113,  "((void)container_bitvector_get(): index too large for array, 0)");
            }
            uint64_t v75 = (*(void *)v86 >> -(char)v71) | (*((void *)v86 - 1) << v71);
          }

          else
          {
            BOOL v73 = __CFADD__(v72, v49);
            __int16 v74 = &v49[v72];
            if (v73 || (unint64_t)(v74 + 7) < 8) {
              __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  104,  "((void)container_bitvector_get(): index too large for array, 0)");
            }
            uint64_t v75 = *(void *)v74 >> -(char)v71;
          }
        }

        else
        {
          uint64_t v75 = 0LL;
        }

        unint64_t v87 = (v58 & 0x3F) + v61;
        if (v87)
        {
          unint64_t v88 = v75 & v64;
          uint64_t v89 = (v58 >> 3) & 0xFFFFFFFFFFFFFF8LL;
          if (v87 > 0x40)
          {
            uint64_t v96 = v89 + 8;
            BOOL v73 = __CFADD__(v96, v49);
            __int128 v97 = &v49[v96];
            unint64_t v98 = __ROR8__(v88, v87);
            if (((v87 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              unint64_t v88 = v98;
            }
            v99.i64[0] = v64 >> v87;
            v99.i64[1] = v64 << -(char)v87;
            *(int8x16_t *)(v97 - 8) = vbslq_s8(v99, (int8x16_t)vdupq_n_s64(v88), *(int8x16_t *)(v97 - 8));
          }

          else
          {
            BOOL v73 = __CFADD__(v89, v49);
            int v90 = (char *)&v49[v89];
            uint64_t v91 = *(void *)v90;
            uint64_t v92 = __ROR8__(*(void *)v90, -(char)v87);
            if (((64 - v87) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
              uint64_t v91 = v92;
            }
            unint64_t v93 = v91 & v130 | v88;
            unint64_t v94 = __ROR8__(v93, v87);
            if ((v87 & 0x1BF) != 0) {
              unint64_t v95 = v94;
            }
            else {
              unint64_t v95 = v93;
            }
            *(void *)int v90 = v95;
          }
        }
      }

      ++v59;
      v58 += v61;
      v57 += 32LL;
    }

    while (v10 != v59);
    size_t v3 = (char *)v126;
  }

LABEL_174:
  container_perfect_hash_destroy(v3);
  if (v137)
  {
    free(v137);
    memset_s(&v137, 8uLL, 0, 8uLL);
  }

  return v6;
}

uint64_t __container_string_rom_create_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  if ((_DWORD)v3 == (_DWORD)v4) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = v6 + 32 * v3;
  uint64_t v8 = v6 + 32 * v4;
  unint64_t v9 = *(void *)(v7 + 16);
  unint64_t v10 = *(void *)(v8 + 16);
  if (v9 < v10) {
    return 0xFFFFFFFFLL;
  }
  if (v9 > v10) {
    return 1LL;
  }
  uint64_t v11 = v6 + 32 * v3;
  unsigned int v14 = *(_DWORD *)(v11 + 24);
  BOOL v13 = (unsigned int *)(v11 + 24);
  uint64_t v12 = v14;
  if (v14 == (_DWORD)v4) {
    return 0LL;
  }
  uint64_t v15 = v6 + 32 * v4;
  unsigned int v18 = *(_DWORD *)(v15 + 24);
  unint64_t v17 = (unsigned int *)(v15 + 24);
  uint64_t v16 = v18;
  if (v18 == (_DWORD)v3) {
    return 0LL;
  }
  uint64_t v19 = *(const char **)v7;
  if (v19 == *(const char **)v8
    || (uint64_t v20 = *(_BYTE **)(a1 + 40), result = strcmp(v19, *(const char **)v8), !(_DWORD)result))
  {
    else {
      unsigned int v21 = v3;
    }
    else {
      unsigned int v22 = v12;
    }
    if (v21 >= v22) {
      unsigned int v21 = v22;
    }
    if (v21 != (_DWORD)v3) {
      unsigned int *v13 = v21;
    }
    if (v21 != (_DWORD)v4) {
      *unint64_t v17 = v21;
    }
    if ((_DWORD)v12 != -1 && v21 != (_DWORD)v12) {
      *(_DWORD *)(v6 + 32 * v12 + 24) = v21;
    }
    uint64_t result = 0LL;
    if ((_DWORD)v16 != -1 && v21 != (_DWORD)v16)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(v6 + 32 * v16 + 24) = v21;
    }
  }

  else
  {
    _BYTE *v20 = 1;
  }

  return result;
}

_BYTE *container_string_rom_destroy(_BYTE *result)
{
  uint64_t __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

  return result;
}

size_t container_string_rom_copyout_external_bytes(void *__src, void *__dst, size_t a3)
{
  size_t v3 = __src[2];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[2];
  }

  return v3;
}

_BYTE *container_string_rom_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    char v5 = calloc(1uLL, a2);
    memcpy(v5, a1, a2);
    void v5[5] = 0;
    return v5;
  }

  return a1;
}

uint64_t container_string_rom_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

unint64_t container_string_rom_string_at_index(uint64_t a1, unint64_t a2)
{
  unint64_t result = 0LL;
  if (!a1 || (a2 & 0x8000000000000000LL) != 0) {
    return result;
  }
  unint64_t v5 = *(unsigned int *)(a1 + 8);
  if (v5 <= a2) {
    return 0LL;
  }
  uint64_t v6 = a1 + 24;
  if (*(_BYTE *)(a1 + 6))
  {
    if (a1 == -24)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      unint64_t v7 = (*(void *)(a1 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
      int v8 = flsl(v5 - 1);
      unint64_t v9 = *(unsigned int *)(a1 + 32);
      if ((*(_BYTE *)(a1 + 30) & 1) == 0)
      {
        v9 += (v9 + 3) >> 2;
      }

      uint64_t v10 = v7 + 8 * (((unint64_t)v9 * v8 + 63) >> 6) + v6;
      unint64_t v5 = *(unsigned int *)(a1 + 8);
      if (*(_BYTE *)(a1 + 6))
      {
        unsigned int v11 = *(unsigned __int8 *)(a1 + 7);
        unint64_t v12 = (*(void *)(a1 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
        int v13 = flsl(v5 - 1);
        unint64_t v14 = *(unsigned int *)(a1 + 32);
        if ((*(_BYTE *)(a1 + 30) & 1) == 0)
        {
          v14 += (v14 + 3) >> 2;
        }

        unint64_t v15 = v12 + 8 * (((unint64_t)v14 * v13 + 63) >> 6);
        unsigned int v16 = *(unsigned __int8 *)(a1 + 7);
        goto LABEL_18;
      }
    }
  }

  else
  {
    uint64_t v10 = a1 + 24;
  }

  unint64_t v15 = 0LL;
  unsigned int v16 = *(unsigned __int8 *)(a1 + 7);
  unsigned int v11 = v16;
LABEL_18:
  if (v16 > 0x40 || !v10 && v16) {
    __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  80,  "((void)container_bitvector_get(): bad argument, 0)");
  }
  unint64_t v17 = ((v16 * a2) & 0x3F) + v16;
  if (v17)
  {
    unint64_t v18 = ((v16 * a2) >> 3) & 0x1FFFFFFFFFFFFFF8LL;
    if (v17 > 0x40)
    {
      unint64_t v21 = v18 + 8;
      BOOL v19 = __CFADD__(v21, v10);
      unsigned int v22 = (void *)(v21 + v10);
      if (v19 || (unint64_t)v22 + 7 < 8) {
        __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  113,  "((void)container_bitvector_get(): index too large for array, 0)");
      }
      unint64_t v17 = (*v22 >> -(char)v17) | (*(v22 - 1) << v17);
    }

    else
    {
      BOOL v19 = __CFADD__(v18, v10);
      uint64_t v20 = (void *)(v18 + v10);
      if (v19 || (unint64_t)v20 + 7 < 8) {
        __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  104,  "((void)container_bitvector_get(): index too large for array, 0)");
      }
      unint64_t v17 = *v20 >> -(char)v17;
    }
  }

  unint64_t v23 = v15 + v6 + (((v5 * (unint64_t)v11 + 63) >> 3) & 0x3FFFFFFFF8LL);
  if (v16 == 64) {
    uint64_t v24 = -1LL;
  }
  else {
    uint64_t v24 = ~(-1LL << v16);
  }
  return v23 + (v17 & v24);
}

uint64_t container_string_rom_index_of(uint64_t a1, const char *a2)
{
  uint64_t i = -1LL;
  if (!a1 || !a2) {
    return i;
  }
  uint64_t v5 = a1 + 24;
  unint64_t v6 = a1 + 24;
  if (!*(_BYTE *)(a1 + 6)) {
    goto LABEL_13;
  }
  if (a1 == -24)
  {
    unint64_t v6 = 0LL;
    unint64_t v15 = 0LL;
    LODWORD(v10) = MEMORY[0xFFFFFFFFFFFFFFF0];
    unsigned int v11 = MEMORY[0xFFFFFFFFFFFFFFEF];
    int v16 = 1;
    goto LABEL_15;
  }

  unint64_t v7 = (*(void *)(a1 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
  int v8 = flsl(*(unsigned int *)(a1 + 8) - 1LL);
  unint64_t v9 = *(unsigned int *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 30) & 1) == 0)
  {
    v9 += (v9 + 3) >> 2;
  }

  unint64_t v6 = v7 + 8 * (((unint64_t)v9 * v8 + 63) >> 6) + v5;
  if (!*(_BYTE *)(a1 + 6))
  {
LABEL_13:
    int v16 = 0;
    unint64_t v15 = 0LL;
    LODWORD(v10) = *(_DWORD *)(a1 + 8);
    unsigned int v11 = *(unsigned __int8 *)(a1 + 7);
    goto LABEL_15;
  }

  uint64_t v10 = *(unsigned int *)(a1 + 8);
  unsigned int v11 = *(unsigned __int8 *)(a1 + 7);
  unint64_t v12 = (*(void *)(a1 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
  int v13 = flsl(v10 - 1);
  unint64_t v14 = *(unsigned int *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 30) & 1) == 0)
  {
    v14 += (v14 + 3) >> 2;
  }

  unint64_t v15 = v12 + 8 * (((unint64_t)v14 * v13 + 63) >> 6);
  int v16 = *(unsigned __int8 *)(a1 + 6);
LABEL_15:
  unint64_t v17 = v15 + v5 + (((v10 * (unint64_t)v11 + 63) >> 3) & 0x3FFFFFFFF8LL);
  if (!v16)
  {
    uint64_t v31 = *(unsigned int *)(a1 + 8);
    uint64_t i = -1LL;
    if (!(_DWORD)v31) {
      return i;
    }
    uint64_t v32 = *(unsigned __int8 *)(a1 + 7);
    if (v6) {
      BOOL v33 = 1;
    }
    else {
      BOOL v33 = v32 == 0;
    }
    char v34 = !v33;
    if ((_DWORD)v32 == 64) {
      uint64_t v35 = -1LL;
    }
    else {
      uint64_t v35 = ~(-1LL << v32);
    }
    unint64_t v36 = 0LL;
    for (uint64_t i = 0LL; i != v31; ++i)
    {
      unint64_t v37 = (v36 & 0x3F) + v32;
      if (v37)
      {
        uint64_t v38 = (v36 >> 3) & 0xFFFFFFFFFFFFFF8LL;
        if (v37 > 0x40)
        {
          uint64_t v40 = v38 + 8;
          BOOL v29 = __CFADD__(v40, v6);
          uint64_t v41 = (void *)(v40 + v6);
          unint64_t v37 = (*v41 >> -(char)v37) | (*(v41 - 1) << v37);
        }

        else
        {
          BOOL v29 = __CFADD__(v38, v6);
          char v39 = (void *)(v38 + v6);
          unint64_t v37 = *v39 >> -(char)v37;
        }
      }

      v36 += v32;
    }

    return -1LL;
  }

  size_t v18 = strlen(a2);
  size_t v19 = v18 + 1;
  uint64_t v20 = v18 + 1 + ((unint64_t)*(unsigned __int16 *)(a1 + 12) << 7);
  if (v18 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v21 = a2;
    do
    {
      unsigned int v22 = *(unsigned __int8 *)v21++;
      uint64_t v20 = 257 * v20 + v22;
    }

    while (v21 < &a2[v19]);
  }

  uint64_t v23 = container_perfect_hash_index_of(v5, (v20 << (v19 & 0x1F)) + v20);
  if (v23 < 0) {
    return -1LL;
  }
  unint64_t v24 = v23;
  unint64_t v25 = 0LL;
  if (v5 && *(_BYTE *)(a1 + 6)) {
    unint64_t v25 = ((*(void *)(v5 + 40) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + v5;
  }
  int v26 = flsl(*(unsigned int *)(a1 + 8) - 1LL);
  if (!is_mul_ok(v24, v26)) {
    goto LABEL_83;
  }
  unint64_t v27 = ((v24 * v26) & 0x3F) + v26;
  if (v27)
  {
    unint64_t v28 = ((v24 * v26) >> 3) & 0x1FFFFFFFFFFFFFF8LL;
    if (v27 > 0x40)
    {
      unint64_t v42 = v28 + 8;
      BOOL v29 = __CFADD__(v42, v25);
      int v43 = (void *)(v42 + v25);
      unint64_t v27 = (*v43 >> -(char)v27) | (*(v43 - 1) << v27);
    }

    else
    {
      BOOL v29 = __CFADD__(v28, v25);
      uint64_t v30 = (void *)(v28 + v25);
      unint64_t v27 = *v30 >> -(char)v27;
    }
  }

  uint64_t v44 = -1LL;
  if (v26 != 64) {
    uint64_t v44 = ~(-1LL << v26);
  }
  unint64_t v45 = *(unsigned __int8 *)(a1 + 7);
  if (v45 > 0x40 || !v6 && *(_BYTE *)(a1 + 7)) {
LABEL_82:
  }
    __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  80,  "((void)container_bitvector_get(): bad argument, 0)");
  unint64_t v46 = v27 & v44;
  if (!is_mul_ok(v27 & v44, v45)) {
LABEL_83:
  }
    __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  85,  "((void)container_bitvector_get(): index too large for element width, 0)");
  unint64_t v47 = ((v46 * v45) & 0x3F) + v45;
  if (v47)
  {
    uint64_t v48 = ((v46 * v45) >> 3) & 0x1FFFFFFFFFFFFFF8LL;
    if (v47 <= 0x40)
    {
      BOOL v29 = __CFADD__(v48, v6);
      BOOL v49 = (void *)(v48 + v6);
      if (!v29 && (unint64_t)v49 + 7 >= 8)
      {
        unint64_t v47 = *v49 >> -(char)v47;
        goto LABEL_73;
      }

LABEL_81:
    __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  113,  "((void)container_bitvector_get(): index too large for array, 0)");
  }

LABEL_73:
  if ((_DWORD)v45 == 64) {
    uint64_t v52 = -1LL;
  }
  else {
    uint64_t v52 = ~(-1LL << v45);
  }
  else {
    return -1LL;
  }
}

void *container_perfect_hash_create(uint64_t a1, unsigned int a2, unint64_t a3)
{
  unint64_t v3 = 4LL;
  if (a3 < 4) {
    unint64_t v3 = a3;
  }
  if (!a3) {
    unint64_t v3 = 3LL;
  }
  if (a2 < 3) {
    return 0LL;
  }
  size_t v5 = a2;
  unint64_t v6 = (((unint64_t)a2 + 3) >> 2) + a2;
  uint64_t v7 = 3 * ((v6 * (unsigned __int128)0x5555555555555556uLL) >> 64);
  BOOL v8 = v6 == v7;
  int v9 = v7 + 3;
  if (v8) {
    unint64_t v10 = (((unint64_t)a2 + 3) >> 2) + a2;
  }
  else {
    LODWORD(v10) = v9;
  }
  unint64_t v12 = (2 * (unint64_t)v10 + 63) >> 6;
  BOOL v13 = v12 < 3 && v3 > 3;
  uint64_t v14 = 3LL;
  if (!v13) {
    uint64_t v14 = v3;
  }
  else {
    unint64_t v16 = v14;
  }
  unsigned int v17 = (v12 - 1) >> (v16 - 2);
  if (v16 <= 1) {
    unsigned int v17 = 0;
  }
  int v18 = 1;
  if ((_DWORD)v10 != a2)
  {
    unsigned int v19 = v17;
    int v20 = fls(v10 - a2);
    unsigned int v17 = v19;
    int v18 = v20;
  }

  unsigned int v161 = v17;
  size_t v21 = 8 * v12 + 48 + ((((unint64_t)(v18 * v17) + 63) >> 3) & 0x3FFFFFF8);
  v173[0] = calloc(1uLL, v21);
  *(_BYTE *)v173[0] = 80;
  *((_BYTE *)v173[0] + 1) = 72;
  *((_BYTE *)v173[0] + 2) = 115;
  *((_BYTE *)v173[0] + 3) = 104;
  unsigned int v22 = v173[0];
  *((_BYTE *)v173[0] + 4) = 1;
  v22[6] = (v16 > 1) | 2;
  char v23 = (32 * v16 + 64) & 0x60;
  if (v16 <= 1) {
    char v23 = 0;
  }
  v22[7] = v23 & 0xE0 | v18 & 0x1F;
  *((_DWORD *)v22 + 2) = a2;
  *((void *)v22 + 5) = v21;
  unint64_t v24 = (unsigned int *)calloc(v5, 0x10uLL);
  uint64_t __s = v24;
  unint64_t v25 = calloc(v10, 1uLL);
  v171 = v25;
  if (!v24 || !v25)
  {
    if (v24)
    {
      free(v24);
      memset_s(&__s, 8uLL, 0, 8uLL);
      unint64_t v25 = v171;
    }

    if (v25)
    {
      free(v25);
      memset_s(&v171, 8uLL, 0, 8uLL);
    }

    unint64_t result = v173[0];
    if (!v173[0]) {
      return result;
    }
    free(v173[0]);
    memset_s(v173, 8uLL, 0, 8uLL);
    return 0LL;
  }

  unint64_t v26 = v10 / 3uLL;
  do
  {
LABEL_30:
    bzero(v25, v10);
    uint64_t v27 = arc4random();
    unint64_t v28 = arc4random() | (unint64_t)(v27 << 32);
    uint64_t v29 = arc4random();
    unint64_t v30 = arc4random() | (unint64_t)(v29 << 32);
    uint64_t v31 = arc4random();
    uint32_t v32 = arc4random();
    uint64_t v33 = 0LL;
    size_t v34 = 0LL;
    unint64_t v35 = v32 | (unint64_t)(v31 << 32);
    BOOL v36 = 1;
    while (1)
    {
      uint64_t v37 = *(void *)(a1 + 8 * v34);
      if ((*((_BYTE *)v173[0] + 6) & 2) != 0)
      {
        unint64_t v39 = ((v37 - 0x2152411021524111LL) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v37 - 0x2152411021524111LL, 49);
        unint64_t v40 = (v39 ^ v28) + __ROR8__(v39, 12);
        unint64_t v41 = (v40 ^ v28) + __ROR8__(v40, 38);
        unint64_t v42 = (v41 ^ __ROR8__(v37 - 0x2152411021524111LL, 49)) + __ROR8__(v41, 13);
        uint64_t v43 = (v42 ^ __ROR8__(v39, 12)) + __ROR8__(v42, 36);
        uint64_t v44 = (v43 ^ __ROR8__(v40, 38)) + __ROR8__(v43, 55);
        uint64_t v45 = (v44 ^ __ROR8__(v41, 13)) + __ROR8__(v44, 17);
        uint64_t v46 = (v45 ^ __ROR8__(v42, 36)) + __ROR8__(v45, 10);
        uint64_t v47 = (v46 ^ __ROR8__(v43, 55)) + __ROR8__(v46, 32);
        unint64_t v38 = __ROR8__((v47 ^ __ROR8__(v44, 17)) + __ROR8__(v47, 39), 1);
      }

      else
      {
        unint64_t v38 = v37 ^ v28;
      }

      unint64_t v48 = v38 % v26;
      __s[v33 + 1] = v48;
      ++v171[v48];
      unint64_t v25 = v171;
      if ((*((_BYTE *)v173[0] + 6) & 2) != 0)
      {
        unint64_t v50 = ((v37 - 0x2152411021524111LL) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v37 - 0x2152411021524111LL, 49);
        unint64_t v51 = (v50 ^ v30) + __ROR8__(v50, 12);
        unint64_t v52 = (v51 ^ v30) + __ROR8__(v51, 38);
        unint64_t v53 = (v52 ^ __ROR8__(v37 - 0x2152411021524111LL, 49)) + __ROR8__(v52, 13);
        uint64_t v54 = (v53 ^ __ROR8__(v50, 12)) + __ROR8__(v53, 36);
        uint64_t v55 = (v54 ^ __ROR8__(v51, 38)) + __ROR8__(v54, 55);
        uint64_t v56 = (v55 ^ __ROR8__(v52, 13)) + __ROR8__(v55, 17);
        uint64_t v57 = (v56 ^ __ROR8__(v53, 36)) + __ROR8__(v56, 10);
        uint64_t v58 = (v57 ^ __ROR8__(v54, 55)) + __ROR8__(v57, 32);
        unint64_t v49 = __ROR8__((v58 ^ __ROR8__(v55, 17)) + __ROR8__(v58, 39), 1);
      }

      else
      {
        unint64_t v49 = v37 ^ v30;
      }

      unint64_t v59 = v49 % v26 + v26;
      __s[v33 + 2] = v59;
      ++v25[v59];
      unint64_t v25 = v171;
      if ((*((_BYTE *)v173[0] + 6) & 2) != 0)
      {
        uint64_t v61 = v37 - 0x2152411021524111LL;
        unint64_t v62 = (v61 ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v61, 49);
        unint64_t v63 = (v62 ^ v35) + __ROR8__(v62, 12);
        unint64_t v64 = (v63 ^ v35) + __ROR8__(v63, 38);
        unint64_t v65 = (v64 ^ __ROR8__(v61, 49)) + __ROR8__(v64, 13);
        uint64_t v66 = (v65 ^ __ROR8__(v62, 12)) + __ROR8__(v65, 36);
        uint64_t v67 = (v66 ^ __ROR8__(v63, 38)) + __ROR8__(v66, 55);
        uint64_t v68 = (v67 ^ __ROR8__(v64, 13)) + __ROR8__(v67, 17);
        uint64_t v69 = (v68 ^ __ROR8__(v65, 36)) + __ROR8__(v68, 10);
        uint64_t v70 = (v69 ^ __ROR8__(v66, 55)) + __ROR8__(v69, 32);
        unint64_t v60 = __ROR8__((v70 ^ __ROR8__(v67, 17)) + __ROR8__(v70, 39), 1);
      }

      else
      {
        unint64_t v60 = v37 ^ v35;
      }

      uint64_t v71 = v60 % v26 + 2 * v26;
      __s[v33 + 3] = v71;
      ++v25[v71];
      unint64_t v25 = v171;
      __s[v33] = v34++;
      BOOL v36 = v34 < v5;
      v33 += 4LL;
      if (v5 == v34) {
        goto LABEL_46;
      }
    }
  }

  while (v36);
LABEL_46:
  unsigned int v72 = v5;
  do
  {
    if (!v72) {
      goto LABEL_68;
    }
    char v73 = 0;
    for (unsigned int i = 0; i < v72; ++i)
    {
      uint64_t v75 = (char *)&__s[4 * i];
      int v77 = *(_DWORD *)v75;
      uint64_t v76 = *((unsigned int *)v75 + 1);
      uint64_t v79 = *((unsigned int *)v75 + 2);
      uint64_t v78 = *((unsigned int *)v75 + 3);
      if (v171[v76] == 1 || v171[v79] == 1 || v171[v78] == 1)
      {
        v171[v76] = v171[v76] - 1;
        --v171[v79];
        --v171[v78];
        if (i != --v72)
        {
          uint64_t v80 = __s;
          uint64_t v81 = (char *)&__s[4 * v72];
          __int128 v82 = *(_OWORD *)v81;
          *(_DWORD *)uint64_t v81 = v77;
          *((_DWORD *)v81 + 1) = v76;
          *((_DWORD *)v81 + 2) = v79;
          *((_DWORD *)v81 + 3) = v78;
          *(_OWORD *)&v80[4 * i] = v82;
        }

        --i;
        char v73 = 1;
      }
    }
  }

  while ((v73 & 1) != 0);
  if (v72)
  {
    uint64_t v167 = 0LL;
    v168 = &v167;
    uint64_t v169 = 0x2000000000LL;
    char v170 = 0;
    v166[0] = 0LL;
    v166[1] = v166;
    v166[2] = 0x2000000000LL;
    v165[0] = 0LL;
    v165[1] = v165;
    v165[2] = 0x2000000000LL;
    __compar[0] = MEMORY[0x1895FED80];
    __compar[1] = 0x40000000LL;
    __compar[2] = __container_perfect_hash_create_block_invoke;
    __compar[3] = &unk_18963A688;
    __compar[4] = &v167;
    __compar[5] = v166;
    void __compar[6] = v165;
    __compar[7] = a1;
    qsort_b(__s, v72, 0x10uLL, __compar);
    if (!*((_BYTE *)v168 + 24))
    {
      _Block_object_dispose(v165, 8);
      _Block_object_dispose(v166, 8);
      _Block_object_dispose(&v167, 8);
      unint64_t v25 = v171;
      goto LABEL_30;
    }

    goto LABEL_153;
  }

LABEL_68:
  unint64_t v84 = v173[0];
  *((void *)v173[0] + 2) = v28;
  v84[3] = v30;
  v84[4] = v35;
  uint64_t v85 = v171;
  size_t v162 = (size_t)v84;
  v163 = v171;
  __int16 v86 = v84 + 6;
  memset(v84 + 6, 255, 8 * v12);
  unint64_t v87 = __s + 3;
  do
  {
    unint64_t v88 = *(v87 - 2);
    uint64_t v89 = (v88 >> 2) & 0x3FFFFFF8;
    int v90 = (void *)((char *)v86 + v89);
    if (__CFADD__(v89, v86)
      || (unint64_t)v90 + 7 < 8
      || (unint64_t v91 = *(v87 - 1), v92 = (v91 >> 2) & 0x3FFFFFF8, v93 = (void *)((char *)v86 + v92), __CFADD__(v92, v86))
      || (unint64_t)v93 + 7 < 8
      || (unint64_t v94 = *v87, v95 = (v94 >> 2) & 0x3FFFFFF8, v96 = (void *)((char *)v86 + v95), __CFADD__(v95, v86))
      || (unint64_t)v96 + 7 < 8)
    {
      __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  104,  "((void)container_bitvector_get(): index too large for array, 0)");
    }

    uint64_t v97 = 2 * (v88 & 0x1F);
    unint64_t v98 = *v90 >> (62 - v97);
    uint64_t v99 = 2 * (v91 & 0x1F);
    unint64_t v100 = *v93 >> (62 - v99);
    uint64_t v101 = 2 * (v94 & 0x1F);
    unint64_t v102 = *v96 >> (62 - v101);
    char v103 = (v100 & 3) + (v98 & 3) + (v102 & 3);
    if (v85[v88])
    {
      if (v85[v91])
      {
        if (v85[v94])
        {
          _os_crash();
          __break(1u);
LABEL_162:
          __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  139,  "((void)container_bitvector_set(): bad argument, 0)");
        }

        uint64_t v104 = (11 - v103) % 3u;
        unint64_t v105 = v102 | (*v96 << (v101 + 2));
        if (v101 == 62) {
          unint64_t v105 = *v96;
        }
        unint64_t v106 = v105 & 0xFFFFFFFFFFFFFFFCLL | v104;
        if ((((_BYTE)v101 + 2) & 0x3E) != 0) {
          unint64_t v107 = (v106 >> (v101 + 2)) | (v106 << (62 - v101));
        }
        else {
          unint64_t v107 = v106;
        }
        *uint64_t v96 = v107;
      }

      else
      {
        uint64_t v112 = (10 - v103) % 3u;
        unint64_t v113 = v100 | (*v93 << (v99 + 2));
        if (v99 == 62) {
          unint64_t v113 = *v93;
        }
        unint64_t v114 = v113 & 0xFFFFFFFFFFFFFFFCLL | v112;
        if ((((_BYTE)v99 + 2) & 0x3E) != 0) {
          unint64_t v115 = (v114 >> (v99 + 2)) | (v114 << (62 - v99));
        }
        else {
          unint64_t v115 = v114;
        }
        *unint64_t v93 = v115;
      }
    }

    else
    {
      uint64_t v108 = (9 - v103) % 3u;
      unint64_t v109 = v98 | (*v90 << (v97 + 2));
      if (v97 == 62) {
        unint64_t v109 = *v90;
      }
      unint64_t v110 = v109 & 0xFFFFFFFFFFFFFFFCLL | v108;
      if ((((_BYTE)v97 + 2) & 0x3E) != 0) {
        unint64_t v111 = (v110 >> (v97 + 2)) | (v110 << (62 - v97));
      }
      else {
        unint64_t v111 = v110;
      }
      *int v90 = v111;
    }

    v85[v88] = 1;
    v87 += 4;
    v85[v91] = 1;
    v85[v94] = 1;
    --v5;
  }

  while (v5);
  free(v85);
  memset_s(&v163, 8uLL, 0, 8uLL);
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  unint64_t result = v173[0];
  if ((*((_BYTE *)v173[0] + 6) & 1) != 0)
  {
    if ((_DWORD)v12)
    {
      unint64_t v116 = 0LL;
      LODWORD(v117) = 0;
      unsigned int v118 = 0;
      unint64_t v119 = *((unsigned __int8 *)v173[0] + 7);
      uint64_t v120 = (v119 >> 5) & 3;
      uint64_t v121 = 1LL << v120;
      uint64_t v122 = *((unsigned int *)v173[0] + 2);
      unint64_t v123 = v122 + ((unint64_t)(v122 + 3) >> 2);
      unint64_t v124 = (2 * (unint64_t)v123 + 63) >> 6;
      unsigned int v125 = (v124 - 1) >> v120;
      uint64_t v126 = (char *)v173[0] + 8 * v124 + 48;
      uint64_t v127 = v119 & 0x1F;
      BOOL v128 = v127 != 0;
      if (v125) {
        BOOL v128 = 0;
      }
      unint64_t v129 = ~(-1LL << v127);
      if (!v125) {
        uint64_t v126 = 0LL;
      }
      unint64_t v130 = (void *)(v162 + 56);
      do
      {
        __int32 v131 = 0;
        if ((_DWORD)v120 && v116 + 1 < v12)
        {
          uint8x8_t v132 = (uint8x8_t)vcnt_s8((int8x8_t)(*v130 & (*v130 >> 1) & 0x5555555555555555LL));
          v132.i16[0] = vaddlv_u8(v132);
          __int32 v131 = v132.i32[0];
        }

        __int32 v133 = 0;
        if (v120 >= 2 && v116 + 2 < v12)
        {
          uint8x8_t v134 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[1] & (v130[1] >> 1) & 0x5555555555555555LL));
          v134.i16[0] = vaddlv_u8(v134);
          __int32 v133 = v134.i32[0];
        }

        __int32 v135 = 0;
        if (v120 >= 2 && v116 + 3 < v12)
        {
          uint8x8_t v136 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[2] & (v130[2] >> 1) & 0x5555555555555555LL));
          v136.i16[0] = vaddlv_u8(v136);
          __int32 v135 = v136.i32[0];
        }

        __int32 v137 = 0;
        if ((_DWORD)v120 == 3 && v116 + 4 < v12)
        {
          uint8x8_t v138 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[3] & (v130[3] >> 1) & 0x5555555555555555LL));
          v138.i16[0] = vaddlv_u8(v138);
          __int32 v137 = v138.i32[0];
        }

        __int32 v139 = 0;
        if ((_DWORD)v120 == 3 && v116 + 5 < v12)
        {
          uint8x8_t v140 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[4] & (v130[4] >> 1) & 0x5555555555555555LL));
          v140.i16[0] = vaddlv_u8(v140);
          __int32 v139 = v140.i32[0];
        }

        __int32 v141 = 0;
        if ((_DWORD)v120 == 3 && v116 + 6 < v12)
        {
          uint8x8_t v142 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[5] & (v130[5] >> 1) & 0x5555555555555555LL));
          v142.i16[0] = vaddlv_u8(v142);
          __int32 v141 = v142.i32[0];
        }

        __int32 v143 = 0;
        if ((_DWORD)v120 == 3 && v116 + 7 < v12)
        {
          uint8x8_t v144 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[6] & (v130[6] >> 1) & 0x5555555555555555LL));
          v144.i16[0] = vaddlv_u8(v144);
          __int32 v143 = v144.i32[0];
        }

        uint8x8_t v145 = (uint8x8_t)vcnt_s8((int8x8_t)(*(v130 - 1) & (*(v130 - 1) >> 1) & 0x5555555555555555LL));
        v145.i16[0] = vaddlv_u8(v145);
        uint64_t v117 = (v117 + v145.i32[0] + v131 + v133 + v135 + v137 + v139 + v141 + v143);
        if (v118 < v161)
        {
          if (v128) {
            goto LABEL_162;
          }
          unint64_t v146 = v127 * (unint64_t)v118;
          unint64_t v147 = (v146 & 0x3F) + v127;
          if (v147)
          {
            uint64_t v148 = (v146 >> 3) & 0x3FFFFFFF8LL;
            if (v147 > 0x40)
            {
              uint64_t v156 = v148 + 8;
              BOOL v149 = __CFADD__(v156, v126);
              v157 = &v126[v156];
              if (v149 || (unint64_t)(v157 + 7) < 8) {
                __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  180,  "((void)container_bitvector_set(): index too large for array, 0)");
              }
              unint64_t v158 = __ROR8__(v117 & v129, v147);
              if (((v147 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
                unint64_t v159 = v158;
              }
              else {
                unint64_t v159 = v117 & v129;
              }
              v160.i64[0] = v129 >> v147;
              v160.i64[1] = v129 << -(char)v147;
              *(int8x16_t *)(v157 - 8) = vbslq_s8(v160, (int8x16_t)vdupq_n_s64(v159), *(int8x16_t *)(v157 - 8));
            }

            else
            {
              BOOL v149 = __CFADD__(v148, v126);
              v150 = &v126[v148];
              if (v149 || (unint64_t)(v150 + 7) < 8) {
                __assert_rtn( "container_bitvector_set",  "container_bitvector.h",  165,  "((void)container_bitvector_set(): index too large for array, 0)");
              }
              uint64_t v151 = *(void *)v150;
              uint64_t v152 = __ROR8__(*(void *)v150, -(char)v147);
              if (((64 - v147) & 0xFFFFFFFFFFFFFFBFLL) != 0) {
                uint64_t v151 = v152;
              }
              uint64_t v153 = v151 & (-1LL << v127) | v117 & v129;
              uint64_t v154 = __ROR8__(v153, v147);
              if ((v147 & 0x3F) != 0) {
                uint64_t v155 = v154;
              }
              else {
                uint64_t v155 = v153;
              }
              *(void *)v150 = v155;
            }
          }

          ++v118;
        }

        v116 += v121;
        v130 += v121;
      }

      while (v116 < v12);
    }

    else
    {
      LODWORD(v117) = 0;
      LODWORD(v122) = *((_DWORD *)v173[0] + 2);
    }

    if ((_DWORD)v117 != 32 * (_DWORD)v12 - (_DWORD)v122)
    {
      _os_crash();
      __break(1u);
LABEL_153:
      if (__s)
      {
        free(__s);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }

      if (v171)
      {
        free(v171);
        memset_s(&v171, 8uLL, 0, 8uLL);
      }

      if (v173[0])
      {
        free(v173[0]);
        memset_s(v173, 8uLL, 0, 8uLL);
      }

      _Block_object_dispose(v165, 8);
      _Block_object_dispose(v166, 8);
      _Block_object_dispose(&v167, 8);
      return 0LL;
    }
  }

  return result;
}

uint64_t __container_perfect_hash_create_block_invoke(void *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3 = a2[1];
  unsigned int v4 = a3[1];
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  if (v3 > v4) {
    return 1LL;
  }
  unsigned int v5 = a2[2];
  unsigned int v6 = a3[2];
  if (v5 < v6) {
    return 0xFFFFFFFFLL;
  }
  if (v5 > v6) {
    return 1LL;
  }
  unsigned int v7 = a2[3];
  unsigned int v8 = a3[3];
  if (v7 < v8) {
    return 0xFFFFFFFFLL;
  }
  if (v7 > v8) {
    return 1LL;
  }
  uint64_t v11 = *a2;
  if (*(void *)(a1[7] + 8 * v11) != *(void *)(a1[7] + 8LL * *a3)) {
    return 0LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = v11;
  *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = *a3;
  return result;
}

_BYTE *container_perfect_hash_destroy(_BYTE *result)
{
  uint64_t __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

  return result;
}

size_t container_perfect_hash_copyout_external_bytes(void *__src, void *__dst, size_t a3)
{
  size_t v3 = __src[5];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[5];
  }

  return v3;
}

_BYTE *container_perfect_hash_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    unsigned int v5 = calloc(1uLL, a2);
    memcpy(v5, a1, a2);
    void v5[5] = 0;
    return v5;
  }

  return a1;
}

uint64_t container_perfect_hash_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t container_perfect_hash_num_indexes(uint64_t a1)
{
  char v1 = *(_BYTE *)(a1 + 6);
  uint64_t result = *(unsigned int *)(a1 + 8);
  if ((v1 & 1) == 0)
  {
    unint64_t v3 = result + ((unint64_t)(result + 3) >> 2);
    else {
      return 3 * ((v3 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
    }
  }

  return result;
}

uint64_t container_perfect_hash_index_of(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if ((*(_BYTE *)(a1 + 6) & 2) != 0)
  {
    unint64_t v6 = ((a2 - 0x2152411021524111LL) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(a2 - 0x2152411021524111LL, 49);
    uint64_t v7 = __ROR8__(v6, 12);
    uint64_t v8 = (v2 ^ v6) + v7;
    uint64_t v9 = (v8 ^ v2) + __ROR8__(v8, 38);
    uint64_t v10 = (v9 ^ __ROR8__(a2 - 0x2152411021524111LL, 49)) + __ROR8__(v9, 13);
    uint64_t v11 = (v10 ^ v7) + __ROR8__(v10, 36);
    uint64_t v12 = (v11 ^ __ROR8__(v8, 38)) + __ROR8__(v11, 55);
    uint64_t v13 = (v12 ^ __ROR8__(v9, 13)) + __ROR8__(v12, 17);
    uint64_t v14 = (v13 ^ __ROR8__(v10, 36)) + __ROR8__(v13, 10);
    uint64_t v15 = (v14 ^ __ROR8__(v11, 55)) + __ROR8__(v14, 32);
    unint64_t v3 = __ROR8__((v15 ^ __ROR8__(v12, 17)) + __ROR8__(v15, 39), 1);
    uint64_t v16 = *(void *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = (v16 ^ v6) + v7;
    uint64_t v19 = (v18 ^ v16) + __ROR8__(v18, 38);
    uint64_t v20 = (v19 ^ __ROR8__(a2 - 0x2152411021524111LL, 49)) + __ROR8__(v19, 13);
    uint64_t v21 = (v20 ^ v7) + __ROR8__(v20, 36);
    uint64_t v22 = (v21 ^ __ROR8__(v18, 38)) + __ROR8__(v21, 55);
    uint64_t v23 = (v22 ^ __ROR8__(v19, 13)) + __ROR8__(v22, 17);
    uint64_t v24 = (v23 ^ __ROR8__(v20, 36)) + __ROR8__(v23, 10);
    uint64_t v25 = (v24 ^ __ROR8__(v21, 55)) + __ROR8__(v24, 32);
    unint64_t v4 = __ROR8__((v25 ^ __ROR8__(v22, 17)) + __ROR8__(v25, 39), 1);
    uint64_t v26 = (v17 ^ v6) + v7;
    uint64_t v27 = (v26 ^ v17) + __ROR8__(v26, 38);
    uint64_t v28 = (v27 ^ __ROR8__(a2 - 0x2152411021524111LL, 49)) + __ROR8__(v27, 13);
    uint64_t v29 = (v28 ^ __ROR8__(v6, 12)) + __ROR8__(v28, 36);
    uint64_t v30 = (v29 ^ __ROR8__(v26, 38)) + __ROR8__(v29, 55);
    uint64_t v31 = (v30 ^ __ROR8__(v27, 13)) + __ROR8__(v30, 17);
    uint64_t v32 = (v31 ^ __ROR8__(v28, 36)) + __ROR8__(v31, 10);
    uint64_t v33 = (v32 ^ __ROR8__(v29, 55)) + __ROR8__(v32, 32);
    unint64_t v5 = __ROR8__((v33 ^ __ROR8__(v30, 17)) + __ROR8__(v33, 39), 1);
  }

  else
  {
    unint64_t v3 = v2 ^ a2;
    unint64_t v4 = *(void *)(a1 + 24) ^ a2;
    unint64_t v5 = *(void *)(a1 + 32) ^ a2;
  }

  unint64_t v34 = *(unsigned int *)(a1 + 8) + (((unint64_t)*(unsigned int *)(a1 + 8) + 3) >> 2);
  uint64_t v35 = 3 * ((v34 * (unsigned __int128)0x5555555555555556uLL) >> 64);
  BOOL v36 = v34 == v35;
  int v37 = v35 + 3;
  if (!v36) {
    LODWORD(v34) = v37;
  }
  unint64_t v38 = v34 / 3uLL;
  unint64_t v39 = v3 % v38;
  uint64_t v40 = a1 + 48;
  uint64_t v41 = (v39 >> 2) & 0x1FFFFFF8;
  BOOL v42 = __CFADD__(v41, a1 + 48);
  uint64_t v43 = (void *)(v41 + a1 + 48);
  if (v42) {
    goto LABEL_24;
  }
  unint64_t v44 = v4 % (v34 / 3uLL) + v34 / 3uLL;
  uint64_t v45 = (v44 >> 2) & 0x3FFFFFF8;
  BOOL v42 = __CFADD__(v45, v40);
  uint64_t v46 = (void *)(v45 + v40);
  if (v42
    || (unint64_t)v46 + 7 < 8
    || (unint64_t v47 = v5 % v38 + 2 * v38,
        uint64_t v48 = (v47 >> 2) & 0x7FFFFFF8,
        BOOL v42 = __CFADD__(v48, v40),
        unint64_t v49 = (void *)(v48 + v40),
        v42)
    || (unint64_t)v49 + 7 < 8)
  {
LABEL_24:
    __assert_rtn( "container_bitvector_get",  "container_bitvector.h",  104,  "((void)container_bitvector_get(): index too large for array, 0)");
  }

  uint64_t v50 = (*v43 >> (~(2 * v39) & 0x3E)) & 3LL;
  uint64_t v51 = (*v46 >> (~(2 * v44) & 0x3E)) & 3LL;
  uint64_t v52 = (*v49 >> (~(2 * v47) & 0x3E)) & 3LL;
  unint64_t v53 = v51 + v50 + v52;
  if (v53 > 8) {
    return -1LL;
  }
  if (((1LL << v53) & 0x49) != 0)
  {
    if (v50 == 3) {
      return -1LL;
    }
  }

  else
  {
    if (((1LL << v53) & 0x92) != 0)
    {
      LODWORD(v39) = v44;
      if (v51 != 3) {
        goto LABEL_20;
      }
      return -1LL;
    }

    LODWORD(v39) = v47;
    if (v52 == 3) {
      return -1LL;
    }
  }

void sub_1802A8440()
{
}

uint64_t container_pwd_for_name(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 1LL;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_pwd_for_name_block_invoke;
  v7[3] = &unk_18963A6B0;
  v7[5] = &v8;
  v7[6] = a1;
  v7[4] = a3;
  uint64_t v4 = _container_pwd(&v11, (uint64_t)v7);
  uint64_t v5 = v4;
  if (a2 && (v4 & 1) == 0) {
    *a2 = v9[3];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __container_pwd_for_name_block_invoke(uint64_t a1, char *a2, size_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  memset(&v13, 0, sizeof(v13));
  uint64_t v12 = 0LL;
  else {
    BOOL v6 = v12 == 0LL;
  }
  if (v6)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = *__error();
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v11;
      _os_log_error_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_ERROR,  "getpwnam_r(%s) returned %{public, darwin.errno}d",  buf,  0x12u);
    }

    uint64_t result = 0LL;
    *a4 = 99LL;
  }

  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
    *(void *)__int128 buf = *(void *)&v13.pw_uid;
    *(void *)&uint8_t buf[8] = v13.pw_dir;
    *(void *)&uint8_t buf[16] = v13.pw_name;
    return v8();
  }

  return result;
}

uint64_t _container_pwd(uint64_t *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  uint64_t v12 = 1LL;
  int64_t v4 = sysconf(71);
  int64_t v5 = v4;
  if (v4 <= 0)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v9 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t __s = 134349056;
      *(void *)&__s[4] = v5;
      _os_log_error_impl( &dword_18028C000,  v9,  OS_LOG_TYPE_ERROR,  "sysconf(_SC_GETPW_R_SIZE_MAX) <= 0: %{public}ld",  __s,  0xCu);
    }

    uint64_t v8 = 0LL;
    uint64_t v10 = 99LL;
LABEL_11:
    uint64_t v12 = v10;
    if (!a1) {
      return v8;
    }
    goto LABEL_12;
  }

  BOOL v6 = calloc(v4, 1uLL);
  *(void *)uint64_t __s = v6;
  if (!v6)
  {
    uint64_t v8 = 0LL;
    uint64_t v10 = 73LL;
    goto LABEL_11;
  }

  uint64_t v7 = v6;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, int64_t, uint64_t *))(a2 + 16))(a2, v6, v5, &v12);
  free(v7);
  memset_s(__s, 8uLL, 0, 8uLL);
  if (!a1) {
    return v8;
  }
LABEL_12:
  if ((v8 & 1) == 0) {
    *a1 = v12;
  }
  return v8;
}

uint64_t container_pwd_for_uid(int a1, void *a2, uint64_t a3)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 1LL;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_pwd_for_uid_block_invoke;
  v7[3] = &unk_18963A6D8;
  int v8 = a1;
  v7[4] = a3;
  v7[5] = &v9;
  uint64_t v4 = _container_pwd(&v12, (uint64_t)v7);
  uint64_t v5 = v4;
  if (a2 && (v4 & 1) == 0) {
    *a2 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_pwd_for_uid_block_invoke(uint64_t a1, char *a2, size_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  memset(&v13, 0, sizeof(v13));
  uint64_t v12 = 0LL;
  if (getpwuid_r(*(_DWORD *)(a1 + 48), &v13, a2, a3, &v12)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v12 == 0LL;
  }
  if (v6)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v7 = (os_log_s *)container_log_handle_for_category_logHandles;
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(_DWORD *)(a1 + 48);
      int v11 = *__error();
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v10;
      LOWORD(pw_dir) = 1026;
      *(_DWORD *)((char *)&pw_dir + 2) = v11;
      _os_log_error_impl( &dword_18028C000,  v7,  OS_LOG_TYPE_ERROR,  "getpwuid_r(%d) returned %{public, darwin.errno}d",  buf,  0xEu);
    }

    uint64_t result = 0LL;
    *a4 = 99LL;
  }

  else
  {
    int v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
    *(void *)__int128 buf = *(void *)&v13.pw_uid;
    pw_dir = v13.pw_dir;
    pw_name = v13.pw_name;
    return v8();
  }

  return result;
}

char *container_pwd_copy_user_home_path(int a1, int a2, int a3, uint64_t *a4)
{
  uint64_t v45 = *MEMORY[0x1895FEE08];
  uint64_t v17 = 1LL;
  bzero(__s1, 0x401uLL);
  if (!a3) {
    goto LABEL_10;
  }
  uint64_t v43 = 0LL;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v38 = 0u;
  __int128 v37 = 0u;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  *(_DWORD *)__int128 buf = 2;
  if (DWORD1(v22) == 2)
  {
    if (kpersona_getpath())
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v8 = (os_log_s *)container_log_handle_for_category_logHandles;
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
      {
        int v15 = *__error();
        LODWORD(__s) = 67109376;
        HIDWORD(__s) = v22;
        __int16 v19 = 1026;
        int v20 = v15;
        _os_log_error_impl( &dword_18028C000,  v8,  OS_LOG_TYPE_ERROR,  "kpersona_getpath(%d) returned %{public, darwin.errno}d",  (uint8_t *)&__s,  0xEu);
      }

      uint64_t v9 = 76LL;
      goto LABEL_22;
    }
  }

  else
  {
LABEL_10:
    v16[0] = MEMORY[0x1895FED80];
    v16[1] = 0x40000000LL;
    v16[2] = __container_pwd_copy_user_home_path_block_invoke;
    v16[3] = &__block_descriptor_tmp_3_813;
    v16[4] = __s1;
  }

  if (a2)
  {
    int v10 = (char *)calloc(0x401uLL, 1uLL);
    uint64_t __s = v10;
    if (v10)
    {
      int v11 = v10;
      if (container_realpathat(4294967294LL, (uint64_t)__s1, v10, 0x400uLL))
      {
        uint64_t v17 = 99LL;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        uint64_t v12 = (os_log_s *)container_log_handle_for_category_logHandles;
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles, OS_LOG_TYPE_ERROR))
        {
          int v13 = *__error();
          *(_DWORD *)__int128 buf = 136380931;
          *(void *)&__int128 v22 = __s1;
          WORD4(v22) = 1026;
          *(_DWORD *)((char *)&v22 + 10) = v13;
          _os_log_error_impl( &dword_18028C000,  v12,  OS_LOG_TYPE_ERROR,  "realpath_np([%{private}s]) failed: %{public, darwin.errno}d",  buf,  0x12u);
        }
      }

      goto LABEL_19;
    }

BOOL __container_pwd_copy_user_home_path_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3) {
    strlcpy(*(char **)(a1 + 32), *(const char **)(a2 + 8), 0x400uLL);
  }
  else {
    *a3 = 100LL;
  }
  return v3 != 0;
}

uint64_t container_create_or_lookup_path( uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = 0LL;
  int v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  int v13 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x1895FED80];
  v16[1] = 0x40000000LL;
  v16[2] = __container_create_or_lookup_path_block_invoke;
  v16[3] = &unk_18963A738;
  v16[4] = &v19;
  void v16[5] = a2;
  char v17 = a4;
  char v18 = a5;
  v16[6] = a3;
  v16[7] = a6;
  v16[8] = a7;
  os_activity_apply(v13, v16);
  os_release(v13);
  uint64_t v14 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __container_create_or_lookup_path_block_invoke(uint64_t a1)
{
  uint64_t result = container_create_or_lookup_path_for_current_user( *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(_BYTE *)(a1 + 72),  *(_BYTE *)(a1 + 73),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_path_for_current_user( uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  uint64_t v12 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_path_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1895FED80];
  v15[1] = 0x40000000LL;
  v15[2] = __container_create_or_lookup_path_for_current_user_block_invoke;
  v15[3] = &unk_18963A788;
  v15[4] = &v18;
  v15[5] = a1;
  char v16 = a3;
  char v17 = a4;
  void v15[6] = a2;
  v15[7] = a5;
  __int16 v15[8] = a6;
  os_activity_apply(v12, v15);
  os_release(v12);
  uint64_t v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __container_create_or_lookup_path_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t result = container_create_or_lookup_path_for_platform( *(void *)(a1 + 40),  *(void *)(a1 + 48),  0,  *(_BYTE *)(a1 + 72),  *(_BYTE *)(a1 + 73),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_path_for_platform( uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  uint64_t v25 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2000000000LL;
  v21[3] = 1LL;
  uint64_t v14 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_path_for_platform",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x1895FED80];
  v17[1] = 0x40000000LL;
  void v17[2] = __container_create_or_lookup_path_for_platform_block_invoke;
  v17[3] = &unk_18963A760;
  v17[6] = a1;
  v17[7] = a2;
  int v18 = a3;
  char v19 = a4;
  char v20 = a5;
  void v17[4] = v21;
  v17[5] = &v22;
  v17[8] = a6;
  v17[9] = a7;
  os_activity_apply(v14, v17);
  os_release(v14);
  uint64_t v15 = v23[3];
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void __container_create_or_lookup_path_for_platform_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 7 || v2 == 13)
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = *(const char **)(a1 + 56);
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = *(const char **)(a1 + 56);
  }

  uint64_t v6 = _container_legacy_lookup( v2,  v5,  v4,  *(_DWORD *)(a1 + 80),  *(unsigned __int8 *)(a1 + 84),  *(unsigned __int8 *)(a1 + 85),  *(_BYTE **)(a1 + 64),  (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    unint64_t path = (const char *)container_object_get_path(v6);
    if (path) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = strndup(path, 0x400uLL);
    }
    else {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 53LL;
    }
  }

  container_object_free(v7);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v9 != 1)
  {
    int v10 = *(uint64_t **)(a1 + 72);
    if (v10)
    {
      uint64_t *v10 = v9;
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_create_or_lookup_path_for_platform",  gClientFaultLoggingEnabled,  v9);
}

uint64_t _container_legacy_lookup( unint64_t a1, const char *a2, const char *a3, int a4, int a5, int a6, _BYTE *a7, uint64_t *a8)
{
  uint64_t v76 = *MEMORY[0x1895FEE08];
  if (a1 - 1 > 0xD)
  {
    char v17 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 20LL;
  }

  else
  {
    uint64_t v14 = a2;
    if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xC || a1 <= 8 && ((1LL << a1) & 0x12A) != 0)
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      char v16 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134219523;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2081;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2081;
        *(void *)&_BYTE buf[24] = a3;
        *(_WORD *)&_BYTE buf[32] = 1024;
        *(_DWORD *)&buf[34] = a5;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a6;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = geteuid();
        *(_WORD *)&buf[50] = 1024;
        LODWORD(v66) = getuid();
        _os_log_impl( &dword_18028C000,  v16,  OS_LOG_TYPE_DEFAULT,  "Requesting container lookup; class = %llu, unint64_t identifier = %{private}s, group_unint64_t identifier = %{private}s, create = "
          "%d, temp = %d, eunsigned int uid = %d, unsigned int uid = %d",
          buf,
          0x38u);
      }
    }

    else
    {
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v73 = 0u;
      voucher_get_current_persona_originator_info();
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v70 = 0u;
      voucher_get_current_persona_proximate_info();
      uint64_t v69 = 0LL;
      memset(v68, 0, sizeof(v68));
      __int128 v67 = 0u;
      __int128 v66 = 0u;
      memset(&buf[4], 0, 48);
      *(_DWORD *)__int128 buf = 2;
      int current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        __int128 v34 = "NOPERSONA";
        __int128 v35 = "<unknown>";
        uint64_t v14 = a2;
      }

      else
      {
        else {
          __int128 v32 = (&off_18963AFA8)[*(_DWORD *)&buf[8] - 2];
        }
        __int128 v34 = v32;
        uint64_t v14 = a2;
        __int128 v35 = &v68[4];
      }

      __int128 v36 = a7;
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      __int128 v33 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v37 = 67112451;
        int v38 = current_persona;
        __int16 v39 = 2082;
        __int128 v40 = v34;
        __int16 v41 = 2082;
        __int128 v42 = v35;
        __int16 v43 = 1024;
        int v44 = 0;
        __int16 v45 = 1024;
        int v46 = 0;
        __int16 v47 = 1024;
        int v48 = 0;
        __int16 v49 = 1024;
        int v50 = 0;
        __int16 v51 = 2048;
        unint64_t v52 = a1;
        __int16 v53 = 2081;
        uint64_t v54 = v14;
        __int16 v55 = 2081;
        uint64_t v56 = a3;
        __int16 v57 = 1024;
        int v58 = a5;
        __int16 v59 = 1024;
        int v60 = a6;
        __int16 v61 = 1024;
        uid_t v62 = geteuid();
        __int16 v63 = 1024;
        uid_t v64 = getuid();
        _os_log_impl( &dword_18028C000,  v33,  OS_LOG_TYPE_DEFAULT,  "Requesting container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [uint64_t pid = %d, personaid"
          " = %d], proximate [pid = %d, personaid = %d], class = %llu, unint64_t identifier = %{private}s, group_unint64_t identifier = %{pri"
          "vate}s, create = %d, temp = %d, eunsigned int uid = %d, unsigned int uid = %d",
          v37,
          0x6Au);
      }

      a7 = v36;
    }

    char v17 = container_query_create();
    container_query_set_class(v17, a1);
    container_query_set_transient((uint64_t)v17, a6);
    if (v14)
    {
      xpc_object_t v18 = xpc_string_create(v14);
      container_query_set_identifiers(v17, v18);
      if (v18) {
        xpc_release(v18);
      }
    }

    if (a1 == 13 || a1 == 7)
    {
      if (a3)
      {
        xpc_object_t v19 = xpc_string_create(a3);
        container_query_set_group_identifiers(v17, v19);
        if (v19) {
          xpc_release(v19);
        }
      }

      else
      {
        uint64_t v22 = container_codesign_copy_current_identifier();
        *(void *)__int128 buf = v22;
        if (v22)
        {
          __int128 v23 = v22;
          xpc_object_t v24 = xpc_string_create(v22);
          container_query_set_group_identifiers(v17, v24);
          if (v24) {
            xpc_release(v24);
          }
          free(v23);
          memset_s(buf, 8uLL, 0, 8uLL);
        }
      }
    }

    container_query_operation_set_platform((uint64_t)v17, a4);
    if (a5) {
      uint64_t v25 = 0x900000001LL;
    }
    else {
      uint64_t v25 = 0x900000000LL;
    }
    container_query_operation_set_flags(v17, v25);
    v17[13] = 3LL;
    single_uint64_t result = container_query_get_single_result((uint64_t)v17);
    if (single_result)
    {
      uint64_t v27 = (uint64_t)single_result;
      unsigned __int8 v28 = container_object_is_new((uint64_t)single_result);
      container_object_sandbox_extension_activate(v27, 1);
      if (a7) {
        *a7 = v28 ^ 1;
      }
      uint64_t v20 = container_copy_object(v27);
      uint64_t v21 = 1LL;
    }

    else
    {
      uint64_t v20 = 0LL;
      if (*v17) {
        uint64_t v21 = *(void *)*v17;
      }
      else {
        uint64_t v21 = 21LL;
      }
    }
  }

  container_query_free(v17);
  if (a8 && v21 != 1) {
    *a8 = v21;
  }
  return v20;
}

uint64_t container_bundle_copy_data_container_path(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2000000000LL;
  v12[3] = 1LL;
  int v8 = _os_activity_create( &dword_18028C000,  "container_bundle_copy_data_container_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = __container_bundle_copy_data_container_path_block_invoke;
  v11[3] = &unk_18963A7B0;
  v11[6] = a1;
  void v11[7] = a2;
  v11[4] = v12;
  v11[5] = &v13;
  v11[8] = a3;
  void v11[9] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  uint64_t v9 = v14[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_bundle_copy_data_container_path_block_invoke(uint64_t a1)
{
  uint64_t v7 = 0LL;
  unint64_t v2 = _common_bundle_lookup( *(void *)(a1 + 48),  *(void *)(a1 + 56),  (uint64_t *)&v7,  *(_BYTE **)(a1 + 64),  (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 1LL && v7 != 0LL)
  {
    unint64_t path = (const char *)container_object_get_path((uint64_t)v7);
    if (path) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = strndup(path, 0x400uLL);
    }
  }

  container_object_free(v7);
  if (v2) {
    xpc_release(v2);
  }
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v5 != 1)
  {
    uint64_t v6 = *(uint64_t **)(a1 + 72);
    if (v6)
    {
      *uint64_t v6 = v5;
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_bundle_copy_data_container_path",  gClientFaultLoggingEnabled,  v5);
}

void *_common_bundle_lookup(uint64_t a1, uint64_t a2, uint64_t *a3, _BYTE *a4, void *a5)
{
  uint64_t v86 = *MEMORY[0x1895FEE08];
  uint64_t __s = 0LL;
  uint64_t v45 = 1LL;
  __int16 v43 = 0LL;
  if (!a3)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v18 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_18028C000,  v18,  OS_LOG_TYPE_ERROR,  "Could not allocate return container object.",  buf,  2u);
    }

    uint64_t v19 = 73LL;
    goto LABEL_26;
  }

  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v20 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_18028C000,  v20,  OS_LOG_TYPE_ERROR,  "Client passed NULL path_to_bundle parameter.",  buf,  2u);
    }

    uint64_t v19 = 38LL;
    goto LABEL_26;
  }

  uint64_t v10 = xpc_bundle_create();
  if (!v10)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v21 = (os_log_s *)qword_18C438D48;
    if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      *(void *)&__int128 v73 = a1;
      _os_log_error_impl(&dword_18028C000, v21, OS_LOG_TYPE_ERROR, "Unable to get bundle from [%{public}s]", buf, 0xCu);
    }

    uint64_t v19 = 94LL;
    if ((a2 & 4) != 0) {
      uint64_t v19 = 95LL;
    }
LABEL_26:
    uint64_t v45 = v19;
    container_error_free(0LL);
    uint64_t v22 = 0LL;
    goto LABEL_27;
  }

  int v11 = (void *)v10;
  uint64_t property = xpc_bundle_get_property();
  if (!property)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v24 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)__int128 buf = 136446466;
    *(void *)&__int128 v73 = a1;
    WORD4(v73) = 1026;
    *(_DWORD *)((char *)&v73 + 10) = xpc_bundle_get_error();
    uint64_t v25 = "Unable to get bundle root path from bundle at [%{public}s]: %{public}d";
    goto LABEL_74;
  }

  uint64_t v13 = (const char *)property;
  uint64_t v14 = xpc_bundle_get_property();
  if (!v14)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v24 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)__int128 buf = 136446466;
    *(void *)&__int128 v73 = a1;
    WORD4(v73) = 1026;
    *(_DWORD *)((char *)&v73 + 10) = xpc_bundle_get_error();
    uint64_t v25 = "Unable to get executable path from bundle at [%{public}s]: %{public}d";
LABEL_74:
    _os_log_error_impl(&dword_18028C000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
LABEL_39:
    xpc_object_t v27 = 0LL;
    uint64_t v28 = 94LL;
    if ((a2 & 4) != 0) {
      uint64_t v28 = 95LL;
    }
    goto LABEL_41;
  }

  uint64_t v15 = (char *)v14;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v83 = 0u;
  voucher_get_current_persona_originator_info();
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v80 = 0u;
  voucher_get_current_persona_proximate_info();
  uint64_t v79 = 0LL;
  memset(v78, 0, sizeof(v78));
  __int128 v77 = 0u;
  __int128 v76 = 0u;
  __int128 v75 = 0u;
  __int128 v74 = 0u;
  __int128 v73 = 0u;
  *(_DWORD *)__int128 buf = 2;
  int current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    __int128 v26 = "<unknown>";
    char v17 = "NOPERSONA";
  }

  else
  {
    else {
      char v17 = (&off_18963AFA8)[DWORD1(v73) - 2];
    }
    __int128 v26 = &v78[4];
  }

  string = v15;
  __int128 v40 = v26;
  __int16 v41 = v17;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  __int128 v29 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v46 = 67112194;
    int v47 = current_persona;
    __int16 v48 = 2082;
    __int16 v49 = v41;
    __int16 v50 = 2082;
    __int16 v51 = v40;
    __int16 v52 = 1024;
    int v53 = 0;
    __int16 v54 = 1024;
    int v55 = 0;
    __int16 v56 = 1024;
    int v57 = 0;
    __int16 v58 = 1024;
    int v59 = 0;
    __int16 v60 = 2082;
    uint64_t v61 = a1;
    __int16 v62 = 2082;
    __int16 v63 = v13;
    __int16 v64 = 2082;
    unint64_t v65 = string;
    __int16 v66 = 2048;
    uint64_t v67 = a2;
    __int16 v68 = 1024;
    uid_t v69 = geteuid();
    __int16 v70 = 1024;
    uid_t v71 = getuid();
    _os_log_impl( &dword_18028C000,  v29,  OS_LOG_TYPE_DEFAULT,  "Requesting container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [uint64_t pid = %d, personaid = %"
      "d], proximate [uint64_t pid = %d, personaid = %d], bundle = [%{public}s], root = [%{public}s], executable = [%{public}s], f"
      "lags = %llu, eunsigned int uid = %d, unsigned int uid = %d",
      v46,
      0x68u);
  }

  xpc_object_t v27 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v27, "Command", 0x24uLL);
  xpc_dictionary_set_string(v27, "BundlePath", v13);
  xpc_dictionary_set_string(v27, "ExecutablePath", string);
  xpc_dictionary_set_uint64(v27, "Flags", a2);
  __int128 v30 = (const char *)container_sandbox_issue_custom_extension(*MEMORY[0x189600790], 0LL, (uint64_t)v13);
  uint64_t __s = v30;
  if (v30)
  {
    __int128 v31 = (char *)v30;
    BOOL v33 = (a2 & 1) == 0 || a4 == 0LL;
    xpc_dictionary_set_string(v27, "SandboxToken", v30);
    __int128 v34 = (void *)container_xpc_send_sync_message(3, 0LL, v27, v33, 0, 0LL, (uint64_t)&v43);
    if (v34)
    {
      uint64_t v22 = v34;
      __int128 v35 = container_xpc_decode_container_object(v34, &v45);
      if (v35)
      {
        uint64_t v36 = (uint64_t)v35;
        if (a4) {
          *a4 = container_is_new((uint64_t)v35) ^ 1;
        }
        container_object_sandbox_extension_activate(v36, 1);
        *a3 = v36;
      }

      __int128 v37 = v43;
    }

    else
    {
      __int128 v37 = v43;
      if (v43) {
        uint64_t v39 = *(void *)v43;
      }
      else {
        uint64_t v39 = 1LL;
      }
      uint64_t v22 = 0LL;
      uint64_t v45 = v39;
    }

    container_error_free(v37);
    free(v31);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_71;
  }

  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  int v38 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136446210;
    *(void *)&__int128 v73 = v13;
    _os_log_error_impl( &dword_18028C000,  v38,  OS_LOG_TYPE_ERROR,  "Failed to issue sandbox extension to [%{public}s] for containermanagerd",  buf,  0xCu);
  }

  uint64_t v28 = 90LL;
LABEL_41:
  uint64_t v45 = v28;
  container_error_free(0LL);
  uint64_t v22 = 0LL;
LABEL_71:
  xpc_release(v11);
  if (v27) {
    xpc_release(v27);
  }
LABEL_27:
  if (a5 && v45 != 1) {
    *a5 = v45;
  }
  return v22;
}

uint64_t container_bundle_copy_data_container(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2000000000LL;
  v12[3] = 1LL;
  int v8 = _os_activity_create( &dword_18028C000,  "container_bundle_copy_data_container",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = __container_bundle_copy_data_container_block_invoke;
  v11[3] = &unk_18963A7D8;
  v11[6] = a1;
  void v11[7] = a2;
  v11[4] = v12;
  v11[5] = &v13;
  v11[8] = a3;
  void v11[9] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  uint64_t v9 = v14[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_bundle_copy_data_container_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0LL;
  unint64_t v2 = _common_bundle_lookup( *(void *)(a1 + 48),  *(void *)(a1 + 56),  (uint64_t *)&v6,  *(_BYTE **)(a1 + 64),  (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 1LL || v6 == 0LL)
  {
    container_object_free(v6);
    if (!v2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v6;
  if (v2) {
LABEL_9:
  }
    xpc_release(v2);
LABEL_10:
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v4 != 1)
  {
    uint64_t v5 = *(uint64_t **)(a1 + 72);
    if (v5)
    {
      *uint64_t v5 = v4;
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }
  }

  container_log_error((uint64_t)"container_bundle_copy_data_container", gClientFaultLoggingEnabled, v4);
}

uint64_t container_create_or_lookup( uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  return container_create_or_lookup_for_current_user(a2, a3, a4, a5, a6, a7);
}

uint64_t container_create_or_lookup_for_current_user( uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  uint64_t v12 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1895FED80];
  v15[1] = 0x40000000LL;
  v15[2] = __container_create_or_lookup_for_current_user_block_invoke;
  v15[3] = &unk_18963A828;
  v15[4] = &v18;
  v15[5] = a1;
  char v16 = a3;
  char v17 = a4;
  void v15[6] = a2;
  v15[7] = a5;
  __int16 v15[8] = a6;
  os_activity_apply(v12, v15);
  os_release(v12);
  uint64_t v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __container_create_or_lookup_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t result = container_create_or_lookup_for_platform( *(void *)(a1 + 40),  *(void *)(a1 + 48),  0,  *(_BYTE *)(a1 + 72),  *(_BYTE *)(a1 + 73),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_for_platform( uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  uint64_t v25 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2000000000LL;
  v21[3] = 1LL;
  uint64_t v14 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_for_platform",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x1895FED80];
  v17[1] = 0x40000000LL;
  void v17[2] = __container_create_or_lookup_for_platform_block_invoke;
  v17[3] = &unk_18963A800;
  v17[6] = a1;
  v17[7] = a2;
  int v18 = a3;
  char v19 = a4;
  char v20 = a5;
  void v17[4] = &v22;
  v17[5] = v21;
  v17[8] = a6;
  v17[9] = a7;
  os_activity_apply(v14, v17);
  os_release(v14);
  uint64_t v15 = v23[3];
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void __container_create_or_lookup_for_platform_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 7 || v2 == 13)
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = *(const char **)(a1 + 56);
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = *(const char **)(a1 + 56);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _container_legacy_lookup( v2,  v5,  v4,  *(_DWORD *)(a1 + 80),  *(unsigned __int8 *)(a1 + 84),  *(unsigned __int8 *)(a1 + 85),  *(_BYTE **)(a1 + 64),  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                            + 24LL));
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v6 != 1)
  {
    uint64_t v7 = *(uint64_t **)(a1 + 72);
    if (v7)
    {
      *uint64_t v7 = v6;
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_create_or_lookup_for_platform",  gClientFaultLoggingEnabled,  v6);
}

uint64_t container_system_path_for_identifier(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  v8[0] = 0LL;
  v8[1] = v8;
  _DWORD v8[2] = 0x2000000000LL;
  v8[3] = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_system_path_for_identifier",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_system_path_for_identifier_block_invoke;
  v7[3] = &unk_18963A850;
  v7[4] = v8;
  v7[5] = &v9;
  void v7[6] = a1;
  void v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  uint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_system_path_for_identifier_block_invoke(void *a1)
{
  unint64_t v2 = (const char *)a1[6];
  active_int platform = dyld_get_active_platform();
  uint64_t v4 = _container_legacy_lookup( 0xCuLL,  v2,  0LL,  active_platform,  1,  0,  0LL,  (uint64_t *)(*(void *)(a1[4] + 8LL) + 24LL));
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    unint64_t path = (const char *)container_object_get_path(v4);
    if (path) {
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = strndup(path, 0x400uLL);
    }
    else {
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 53LL;
    }
  }

  container_object_free(v5);
  uint64_t v7 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v7 != 1)
  {
    int v8 = (uint64_t *)a1[7];
    if (v8)
    {
      uint64_t *v8 = v7;
      uint64_t v7 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    }
  }

  container_log_error((uint64_t)"container_system_path_for_identifier", gClientFaultLoggingEnabled, v7);
}

uint64_t container_system_group_path_for_identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  v10[0] = 0LL;
  v10[1] = v10;
  _DWORD v10[2] = 0x2000000000LL;
  v10[3] = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_system_group_path_for_identifier",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_system_group_path_for_identifier_block_invoke;
  block[3] = &unk_18963A878;
  void block[6] = a1;
  void block[7] = a2;
  block[4] = v10;
  void block[5] = &v11;
  block[8] = a3;
  os_activity_apply(v6, block);
  os_release(v6);
  uint64_t v7 = v12[3];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __container_system_group_path_for_identifier_block_invoke(void *a1)
{
  unint64_t v2 = (const char *)a1[6];
  uint64_t v3 = (const char *)a1[7];
  active_int platform = dyld_get_active_platform();
  uint64_t v5 = _container_legacy_lookup( 0xDuLL,  v2,  v3,  active_platform,  1,  0,  0LL,  (uint64_t *)(*(void *)(a1[4] + 8LL) + 24LL));
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    unint64_t path = (const char *)container_object_get_path(v5);
    if (path) {
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = strndup(path, 0x400uLL);
    }
    else {
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 53LL;
    }
  }

  container_object_free(v6);
  uint64_t v8 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v8 != 1)
  {
    uint64_t v9 = (uint64_t *)a1[8];
    if (v9)
    {
      *uint64_t v9 = v8;
      uint64_t v8 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_system_group_path_for_identifier",  gClientFaultLoggingEnabled,  v8);
}

uint64_t container_create_or_lookup_system_group_paths(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  v8[0] = 0LL;
  v8[1] = v8;
  _DWORD v8[2] = 0x2000000000LL;
  v8[3] = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_system_group_paths",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_create_or_lookup_system_group_paths_block_invoke;
  v7[3] = &unk_18963A8A0;
  v7[4] = v8;
  v7[5] = &v9;
  void v7[6] = a1;
  void v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  uint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_create_or_lookup_system_group_paths_block_invoke(void *a1)
{
  unint64_t v15 = 0LL;
  unint64_t v2 = (const char *)a1[6];
  if (v2) {
    xpc_object_t v3 = xpc_string_create(v2);
  }
  else {
    xpc_object_t v3 = 0LL;
  }
  active_int platform = dyld_get_active_platform();
  uint64_t v5 = (void *)_container_legacy_lookup_multiple( 0xDuLL,  v3,  0LL,  0,  1,  0,  active_platform,  &v15,  (uint64_t *)(*(void *)(a1[4] + 8LL) + 24LL));
  if (v5)
  {
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v15)
    {
      for (unint64_t i = 0LL; i < v15; ++i)
      {
        uint64_t v7 = v5[i];
        unint64_t identifier = (const char *)container_object_get_identifier(v7);
        unint64_t path = (const char *)container_object_get_path(v7);
        uint64_t v10 = *(void *)(v7 + 88);
        else {
          string = *(const char **)(v7 + 48);
        }
        xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), identifier, path);
        if (string) {
          container_sandbox_extension_consume((uint64_t)string, path, 0LL, 1);
        }
      }
    }
  }

  if (v3) {
    xpc_release(v3);
  }
  container_free_array_of_containers(v5, v15);
  uint64_t v13 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v13 != 1)
  {
    uint64_t v14 = (uint64_t *)a1[7];
    if (v14)
    {
      uint64_t *v14 = v13;
      uint64_t v13 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_create_or_lookup_system_group_paths",  gClientFaultLoggingEnabled,  v13);
}

uint64_t _container_legacy_lookup_multiple( unint64_t a1, void *a2, void *a3, int a4, int a5, int a6, int a7, void *a8, uint64_t *a9)
{
  uint64_t v9 = a9;
  uint64_t v97 = *MEMORY[0x1895FEE08];
  uint64_t v57 = 0LL;
  __int16 v58 = &v57;
  uint64_t v59 = 0x2000000000LL;
  uint64_t v60 = 0LL;
  uint64_t v53 = 0LL;
  __int16 v54 = &v53;
  uint64_t v55 = 0x2000000000LL;
  uint64_t v56 = 0LL;
  if (a1 - 1 > 0xD)
  {
    xpc_object_t v27 = 0LL;
    uint64_t v32 = 20LL;
  }

  else
  {
    uint64_t v10 = a8;
    if (a8)
    {
      if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xC || a1 <= 8 && ((1LL << a1) & 0x12A) != 0)
      {
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        int v18 = (os_log_s *)qword_18C438D48;
        if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
        {
          char v19 = a2;
          char v20 = a3;
          uint64_t v21 = v10;
          int v22 = a7;
          int v23 = a5;
          int v24 = a6;
          uid_t v25 = geteuid();
          uid_t v26 = getuid();
          *(_DWORD *)__int128 buf = 134218752;
          *(void *)&__int128 v84 = a1;
          WORD4(v84) = 1024;
          *(_DWORD *)((char *)&v84 + 10) = a4;
          HIWORD(v84) = 1024;
          LODWORD(v85) = v25;
          a6 = v24;
          a5 = v23;
          a7 = v22;
          uint64_t v10 = v21;
          a3 = v20;
          a2 = v19;
          uint64_t v9 = a9;
          WORD2(v85) = 1024;
          *(_DWORD *)((char *)&v85 + 6) = v26;
          _os_log_impl( &dword_18028C000,  v18,  OS_LOG_TYPE_DEFAULT,  "Requesting multiple containers; class = %llu, temp = %d, eunsigned int uid = %d, unsigned int uid = %d",
            buf,
            0x1Eu);
        }
      }

      else
      {
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v94 = 0u;
        int current_persona_originator_info = voucher_get_current_persona_originator_info();
        int v47 = DWORD1(v95);
        int v48 = DWORD2(v94);
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v91 = 0u;
        int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
        int v45 = DWORD2(v91);
        int v46 = current_persona_proximate_info;
        int v44 = DWORD1(v92);
        uint64_t v90 = 0LL;
        memset(v89, 0, sizeof(v89));
        __int128 v88 = 0u;
        __int128 v87 = 0u;
        __int128 v86 = 0u;
        __int128 v85 = 0u;
        __int128 v84 = 0u;
        *(_DWORD *)__int128 buf = 2;
        int current_persona = voucher_get_current_persona();
        if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
        {
          __int128 v42 = "NOPERSONA";
          __int16 v43 = "<unknown>";
        }

        else
        {
          else {
            __int128 v37 = (&off_18963AFA8)[DWORD1(v84) - 2];
          }
          __int128 v42 = v37;
          __int16 v43 = &v89[4];
        }

        int v49 = a6;
        if (container_log_handle_for_category_onceToken != -1) {
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        }
        int v38 = (os_log_s *)qword_18C438D48;
        if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = v48 & ~(current_persona_originator_info >> 31);
          int v41 = v47 & ~(current_persona_originator_info >> 31);
          uid_t v51 = geteuid();
          uid_t v39 = getuid();
          *(_DWORD *)uint64_t v61 = 67111682;
          int v62 = current_persona;
          __int16 v63 = 2082;
          __int16 v64 = v42;
          __int16 v65 = 2082;
          __int16 v66 = v43;
          __int16 v67 = 1024;
          int v68 = v40;
          __int16 v69 = 1024;
          int v70 = v41;
          __int16 v71 = 1024;
          int v72 = v45 & ~(v46 >> 31);
          __int16 v73 = 1024;
          int v74 = v44 & ~(v46 >> 31);
          __int16 v75 = 2048;
          unint64_t v76 = a1;
          __int16 v77 = 1024;
          int v78 = a4;
          __int16 v79 = 1024;
          uid_t v80 = v51;
          __int16 v81 = 1024;
          uid_t v82 = v39;
          _os_log_impl( &dword_18028C000,  v38,  OS_LOG_TYPE_DEFAULT,  "Requesting multiple containers; personaid = %d, type = %{public}s, name = %{public}s, origin [uint64_t pid = %d, pers"
            "onaid = %d], proximate [pid = %d, personaid = %d], class = %llu, temp = %d, eunsigned int uid = %d, unsigned int uid = %d",
            v61,
            0x50u);
        }

        a6 = v49;
      }

      xpc_object_t v27 = container_query_create();
      container_query_set_class(v27, a1);
      container_query_set_transient((uint64_t)v27, a4);
      if (a2) {
        container_query_set_identifiers(v27, a2);
      }
      BOOL v28 = a1 == 13 || a1 == 7;
      if (v28 && a3) {
        container_query_set_group_identifiers(v27, a3);
      }
      container_query_operation_set_platform((uint64_t)v27, a7);
      if (a5) {
        uint64_t v29 = 0x900000001LL;
      }
      else {
        uint64_t v29 = 0x900000000LL;
      }
      container_query_operation_set_flags(v27, v29);
      if (a6) {
        container_query_set_include_other_owners((uint64_t)v27, 1);
      }
      v27[13] = 3LL;
      size_t count_results = container_query_count_results((uint64_t)v27);
      if ((count_results & 0x8000000000000000LL) != 0) {
        goto LABEL_52;
      }
      __int128 v31 = calloc(count_results, 8uLL);
      v58[3] = (uint64_t)v31;
      if (!v31)
      {
        uint64_t v32 = 73LL;
        goto LABEL_34;
      }

      v52[0] = MEMORY[0x1895FED80];
      v52[1] = 0x40000000LL;
      v52[2] = ___container_legacy_lookup_multiple_block_invoke;
      v52[3] = &unk_18963AF20;
      v52[4] = &v57;
      v52[5] = &v53;
      if (!container_query_iterate_results_sync((uint64_t)v27, (uint64_t)v52))
      {
LABEL_52:
        if (*v27) {
          uint64_t v32 = *(void *)*v27;
        }
        else {
          uint64_t v32 = 53LL;
        }
      }

      else
      {
        void *v10 = v54[3];
        uint64_t v32 = 1LL;
      }
    }

    else
    {
      xpc_object_t v27 = 0LL;
      uint64_t v32 = 38LL;
    }
  }

uint64_t ___container_legacy_lookup_multiple_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = container_copy_object(a2);
  if (v3) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
  }
              + 8LL * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))++) = v3;
  return 1LL;
}

uint64_t container_create_or_lookup_app_group_paths(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_for_current_user(a2, a3);
}

uint64_t container_create_or_lookup_app_group_paths_for_current_user(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 0LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_app_group_paths_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_create_or_lookup_app_group_paths_for_current_user_block_invoke;
  block[3] = &unk_18963A8F0;
  block[4] = &v8;
  void block[5] = a1;
  void block[6] = a2;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __container_create_or_lookup_app_group_paths_for_current_user_block_invoke(void *a1)
{
  uint64_t result = container_create_or_lookup_app_group_paths_for_platform(a1[5], 0, a1[6]);
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_app_group_paths_for_platform(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2000000000LL;
  v11[3] = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_app_group_paths_for_platform",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_create_or_lookup_app_group_paths_for_platform_block_invoke;
  block[3] = &unk_18963A8C8;
  int v10 = a2;
  block[4] = v11;
  void block[5] = &v12;
  void block[6] = a1;
  void block[7] = a3;
  os_activity_apply(v6, block);
  os_release(v6);
  uint64_t v7 = v13[3];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __container_create_or_lookup_app_group_paths_for_platform_block_invoke(uint64_t a1)
{
  unint64_t v14 = 0LL;
  unint64_t v2 = *(const char **)(a1 + 48);
  if (v2) {
    xpc_object_t v3 = xpc_string_create(v2);
  }
  else {
    xpc_object_t v3 = 0LL;
  }
  uint64_t v4 = (void *)_container_legacy_lookup_multiple( 7uLL,  v3,  0LL,  0,  1,  0,  *(_DWORD *)(a1 + 64),  &v14,  (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v14)
    {
      for (unint64_t i = 0LL; i < v14; ++i)
      {
        uint64_t v6 = v4[i];
        unint64_t identifier = (const char *)container_object_get_identifier(v6);
        unint64_t path = (const char *)container_object_get_path(v6);
        uint64_t v9 = *(void *)(v6 + 88);
        else {
          string = *(const char **)(v6 + 48);
        }
        xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), identifier, path);
        if (string) {
          container_sandbox_extension_consume((uint64_t)string, path, 0LL, 1);
        }
      }
    }
  }

  if (v3) {
    xpc_release(v3);
  }
  container_free_array_of_containers(v4, v14);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v12 != 1)
  {
    uint64_t v13 = *(uint64_t **)(a1 + 56);
    if (v13)
    {
      uint64_t *v13 = v12;
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_create_or_lookup_app_group_paths_for_platform",  gClientFaultLoggingEnabled,  v12);
}

uint64_t container_create_or_lookup_group_container_paths_for_current_user( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_for_current_user(a1, a3);
}

uint64_t container_create_or_lookup_app_group_paths_from_entitlements(uint64_t a1, int a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_from_entitlements_4ls(a1, 1, a2, a3);
}

uint64_t container_create_or_lookup_app_group_paths_from_entitlements_4ls( uint64_t a1, char a2, int a3, uint64_t a4)
{
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2000000000LL;
  v18[3] = 1LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v8 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_app_group_paths_from_entitlements",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_create_or_lookup_app_group_paths_from_entitlements_4ls_block_invoke;
  block[3] = &unk_18963A918;
  char v13 = a2;
  int v12 = a3;
  block[4] = v18;
  void block[5] = &v14;
  void block[6] = a1;
  void block[7] = a4;
  os_activity_apply(v8, block);
  os_release(v8);
  uint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  return v9;
}

void __container_create_or_lookup_app_group_paths_from_entitlements_4ls_block_invoke(uint64_t a1)
{
  unint64_t v14 = 0LL;
  xpc_object_t array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 48), "com.apple.security.application-groups");
  if (array)
  {
    xpc_object_t v3 = xpc_retain(array);
    uint64_t v4 = (void *)_container_legacy_lookup_multiple( 7uLL,  0LL,  v3,  0,  *(unsigned __int8 *)(a1 + 68),  0,  *(_DWORD *)(a1 + 64),  &v14,  (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    if (v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v14)
      {
        for (unint64_t i = 0LL; i < v14; ++i)
        {
          uint64_t v6 = v4[i];
          unint64_t identifier = (const char *)container_object_get_identifier(v6);
          unint64_t path = (const char *)container_object_get_path(v6);
          uint64_t v9 = *(void *)(v6 + 88);
          else {
            string = *(const char **)(v6 + 48);
          }
          xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), identifier, path);
          if (string) {
            container_sandbox_extension_consume((uint64_t)string, path, 0LL, 1);
          }
        }
      }
    }

    if (v3) {
      xpc_release(v3);
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 143LL;
  }

  container_free_array_of_containers(v4, v14);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v12 != 1)
  {
    char v13 = *(uint64_t **)(a1 + 56);
    if (v13)
    {
      uint64_t *v13 = v12;
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_create_or_lookup_app_group_paths_from_entitlements_4ls",  gClientFaultLoggingEnabled,  v12);
}

uint64_t container_group_container_identifiers_for_current_user(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  v8[0] = 0LL;
  v8[1] = v8;
  _DWORD v8[2] = 0x2000000000LL;
  v8[3] = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_group_container_identifiers_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_group_container_identifiers_for_current_user_block_invoke;
  v7[3] = &unk_18963A940;
  v7[4] = v8;
  v7[5] = &v9;
  void v7[6] = a1;
  void v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  uint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_group_container_identifiers_for_current_user_block_invoke(void *a1)
{
  unint64_t v11 = 0LL;
  unint64_t v2 = (const char *)a1[6];
  if (v2) {
    xpc_object_t v3 = xpc_string_create(v2);
  }
  else {
    xpc_object_t v3 = 0LL;
  }
  active_int platform = dyld_get_active_platform();
  uint64_t v5 = (void *)_container_legacy_lookup_multiple( 7uLL,  v3,  0LL,  0,  1,  0,  active_platform,  &v11,  (uint64_t *)(*(void *)(a1[4] + 8LL) + 24LL));
  if (v5)
  {
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_array_create(0LL, 0LL);
    if (v11)
    {
      for (unint64_t i = 0LL; i < v11; ++i)
      {
        unint64_t identifier = (const char *)container_object_get_identifier(v5[i]);
        xpc_object_t v8 = xpc_string_create(identifier);
        xpc_array_append_value(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), v8);
        if (v8) {
          xpc_release(v8);
        }
      }
    }
  }

  if (v3) {
    xpc_release(v3);
  }
  container_free_array_of_containers(v5, v11);
  uint64_t v9 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v9 != 1)
  {
    int v10 = (uint64_t *)a1[7];
    if (v10)
    {
      uint64_t *v10 = v9;
      uint64_t v9 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_group_container_identifiers_for_current_user",  gClientFaultLoggingEnabled,  v9);
}

uint64_t container_get_all_with_class(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return container_get_all_with_class_for_current_user(a2, a3, a4, a5);
}

uint64_t container_get_all_with_class_for_current_user(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2000000000LL;
  v13[3] = 1LL;
  xpc_object_t v8 = _os_activity_create( &dword_18028C000,  "container_get_all_with_class_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = __container_get_all_with_class_for_current_user_block_invoke;
  v11[3] = &unk_18963A968;
  char v12 = a2;
  v11[6] = a1;
  void v11[7] = a3;
  void v11[4] = &v14;
  v11[5] = v13;
  v11[8] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  uint64_t v9 = v15[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  return v9;
}

void __container_get_all_with_class_for_current_user_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(unsigned __int8 *)(a1 + 72);
  active_int platform = dyld_get_active_platform();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _container_legacy_lookup_multiple( v2,  0LL,  0LL,  v3,  0,  1,  active_platform,  *(void **)(a1 + 56),  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                            + 24LL));
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v5 != 1)
  {
    uint64_t v6 = *(uint64_t **)(a1 + 64);
    if (v6)
    {
      *uint64_t v6 = v5;
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
  }

  container_log_error( (uint64_t)"container_get_all_with_class_for_current_user",  gClientFaultLoggingEnabled,  v5);
}

uint64_t container_replace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v6 = _os_activity_create(&dword_18028C000, "container_replace", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_replace_block_invoke;
  v9[3] = &unk_18963A990;
  v9[6] = a1;
  void v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_replace", gClientFaultLoggingEnabled, v11[3]);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_replace_block_invoke(uint64_t *a1)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  BOOL v28 = 0LL;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v2 = container_copy_unlocalized_description(a1[6]);
    uint64_t __s = v2;
    int v3 = container_copy_unlocalized_description(a1[7]);
    uid_t v26 = v3;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v4 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v30 = v2;
      __int16 v31 = 2080;
      uint64_t v32 = v3;
      _os_log_impl(&dword_18028C000, v4, OS_LOG_TYPE_DEFAULT, "Replace; old = %s, new = %s", buf, 0x16u);
      unint64_t v2 = __s;
    }

    if (v2)
    {
      free(v2);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

    if (v26)
    {
      free(v26);
      memset_s(&v26, 8uLL, 0, 8uLL);
    }
  }

  uint64_t v5 = a1[7];
  if (!v5
    || (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(a1[7]), uuid_is_null(uuid))
    || !container_object_get_identifier(v5)
    || (unint64_t)container_object_get_class(v5) - 1 >= 0xE
    || (uint64_t v12 = a1[6]) != 0
    && ((uint64_t v13 = (const unsigned __int8 *)container_object_get_uuid(a1[6]), uuid_is_null(v13))
     || !container_object_get_identifier(v12)
     || (unint64_t)container_object_get_class(v12) - 1 >= 0xE))
  {
    xpc_object_t v7 = 0LL;
    xpc_object_t v8 = 0LL;
    uint64_t v9 = 0LL;
    xpc_object_t v10 = 0LL;
    *(void *)(*(void *)(a1[5] + 8) + 24LL) = 11LL;
    goto LABEL_15;
  }

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "Command", 2uLL);
  if (a1[6])
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    container_xpc_encode_container_object(v7, a1[6], 0LL);
    xpc_dictionary_set_value(v10, "OldContainer", v7);
  }

  else
  {
    xpc_object_t v7 = 0LL;
  }

  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  container_xpc_encode_container_object(v8, a1[7], 0LL);
  xpc_dictionary_set_value(v10, "NewContainer", v8);
  LODWORD(v26) = 0;
  int v14 = container_disposition(a1[7], &v26);
  uint64_t v15 = (void *)container_xpc_send_sync_message(v14, 0LL, v10, 0, (int)v26, 0LL, (uint64_t)&v28);
  if (!v15)
  {
    int v24 = v28;
    if (v28) {
      uint64_t v25 = *(void *)v28;
    }
    else {
      uint64_t v25 = 1LL;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24LL) = v25;
    container_error_free(v24);
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  uint64_t v9 = v15;
  uint64_t v16 = *(void *)(a1[5] + 8);
  uint64_t v18 = *(void *)(v16 + 24);
  uint64_t v17 = (uint64_t *)(v16 + 24);
  if (v18 != 1) {
    goto LABEL_15;
  }
  char v19 = container_xpc_decode_container_object(v15, v17);
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
  {
    char v20 = (char *)MEMORY[0x186DF907C](v9);
    uint64_t __s = v20;
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v21 = (os_log_s *)qword_18C438D48;
    if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
    {
      if (!v20) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }

    *(_DWORD *)__int128 buf = 136315138;
    __int128 v30 = v20;
    _os_log_debug_impl(&dword_18028C000, v21, OS_LOG_TYPE_DEBUG, "Updated container during replace: %s", buf, 0xCu);
    if (v20)
    {
LABEL_45:
      free(v20);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }

LABEL_46:
  if (v19)
  {
    container_update_with_container(a1[7], (uint64_t)v19);
    uint64_t v22 = a1[7];
    __container_object_separate_from_query((void *)v22);
    *(_BYTE *)(v22 + 108) = 0;
    container_object_free(v19);
    uint64_t v23 = a1[6];
    if (v23)
    {
      __container_object_separate_from_query((void *)a1[6]);
      *(void *)(v23 + 16) = 0LL;
    }

    _container_async_reclaim_disk_space(a1[4]);
  }

void _container_async_reclaim_disk_space(uint64_t a1)
{
  if (a1)
  {
    if (_container_async_reclaim_disk_space_onceToken != -1) {
      dispatch_once(&_container_async_reclaim_disk_space_onceToken, &__block_literal_global_103);
    }
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___container_async_reclaim_disk_space_block_invoke_2;
    block[3] = &unk_18963AF88;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_container_async_reclaim_disk_space_queue, block);
  }

void ___container_async_reclaim_disk_space_block_invoke_2(uint64_t a1)
{
  unint64_t v2 = (uint64_t *)container_operation_delete_reclaim_disk_space();
  container_log_ext_error( (uint64_t)"_container_async_reclaim_disk_space_block_invoke_2",  gClientFaultLoggingEnabled,  v2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  container_error_free(v2);
}

dispatch_queue_t ___container_async_reclaim_disk_space_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("container_delete_array_of_containers async obliteration", 0LL);
  _container_async_reclaim_disk_space_queue = (uint64_t)result;
  return result;
}

uint64_t container_set_code_signing_info_for_identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_set_code_signing_info_for_identifier",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_set_code_signing_info_for_identifier_block_invoke;
  v9[3] = &unk_18963AB70;
  v9[4] = &v10;
  v9[5] = a1;
  v9[6] = a2;
  void v9[7] = a3;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error( (uint64_t)"container_set_code_signing_info_for_identifier",  gClientFaultLoggingEnabled,  v11[3]);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_set_code_signing_info_for_identifier_block_invoke(uint64_t a1)
{
  xpc_object_t v8 = 0LL;
  if (!*(void *)(a1 + 40))
  {
    uint64_t v6 = 0LL;
    xpc_object_t v2 = 0LL;
    uint64_t v7 = 18LL;
    goto LABEL_13;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x12uLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
  int v3 = *(void **)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_value(v2, "CodeSigningInfo", v3);
  }
  uint64_t v4 = *(void **)(a1 + 56);
  if (v4) {
    xpc_dictionary_set_value(v2, "OptionsDictionary", v4);
  }
  uint64_t v5 = (void *)container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v8);
  uint64_t v6 = v8;
  if (!v5)
  {
    if (v8) {
      uint64_t v7 = *(void *)v8;
    }
    else {
      uint64_t v7 = 1LL;
    }
LABEL_13:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
    container_error_free(v6);
    if (!v2) {
      return;
    }
    goto LABEL_14;
  }

  container_error_free(v8);
  xpc_release(v5);
  if (v2) {
LABEL_14:
  }
    xpc_release(v2);
}

uint64_t container_delete_with_uid_class_and_identifier( uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return container_delete_with_class_and_identifier_for_current_user(a2, a3, a4, a5);
}

uint64_t container_delete_with_class_and_identifier_for_current_user( uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 1LL;
  xpc_object_t v8 = _os_activity_create( &dword_18028C000,  "container_delete_with_class_and_identifier_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_delete_with_class_and_identifier_for_current_user_block_invoke;
  block[3] = &unk_18963A9B8;
  void block[6] = a2;
  void block[7] = a1;
  char v12 = a3;
  block[4] = a4;
  void block[5] = &v13;
  os_activity_apply(v8, block);
  os_release(v8);
  container_log_error( (uint64_t)"container_delete_with_class_and_identifier_for_current_user",  gClientFaultLoggingEnabled,  v14[3]);
  uint64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_delete_with_class_and_identifier_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t v13 = 0LL;
  if (!*(void *)(a1 + 48))
  {
    uint64_t v5 = 0LL;
    xpc_object_t v2 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v8 = 18LL;
LABEL_7:
    *(void *)(v7 + 24) = v8;
    goto LABEL_17;
  }

  if ((unint64_t)(*(void *)(a1 + 56) - 1LL) >= 0xE)
  {
    uint64_t v5 = 0LL;
    xpc_object_t v2 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v8 = 20LL;
    goto LABEL_7;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0xAuLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
  xpc_dictionary_set_uint64(v2, "ContainerClass", *(void *)(a1 + 56));
  xpc_dictionary_set_BOOL(v2, "Transient", *(_BYTE *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 56);
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    int v4 = 1;
  }

  else
  {
    unint64_t v9 = v3 - 1;
    if (v9 > 0xD) {
      int v4 = 0;
    }
    else {
      int v4 = dword_1802B1D74[v9];
    }
  }

  uint64_t v10 = container_xpc_send_sync_message(v4, 0LL, v2, 0, 0, 0LL, (uint64_t)&v13);
  if (v10)
  {
    uint64_t v6 = (void *)v10;
    _container_async_reclaim_disk_space(*(void *)(a1 + 32));
    uint64_t v5 = v13;
  }

  else
  {
    uint64_t v5 = v13;
    if (v13) {
      uint64_t v11 = *(void *)v13;
    }
    else {
      uint64_t v11 = 1LL;
    }
    uint64_t v6 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11;
  }

uint64_t container_delete(uint64_t a1, uint64_t a2)
{
  if (a1
    && (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 < 0xE)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    uint64_t v12 = 1LL;
    uint64_t v7 = _os_activity_create(&dword_18028C000, "container_delete", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __container_delete_block_invoke;
    block[3] = &unk_18963A9E0;
    void block[5] = &v9;
    void block[6] = a1;
    block[4] = a2;
    os_activity_apply(v7, block);
    os_release(v7);
    container_log_error((uint64_t)"container_delete", gClientFaultLoggingEnabled, v10[3]);
    uint64_t v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    uint64_t v5 = 11LL;
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 11LL);
  }

  return v5;
}

uint64_t __container_delete_block_invoke(uint64_t *a1)
{
  v3[1] = *MEMORY[0x1895FEE08];
  v3[0] = a1[6];
  uint64_t result = container_delete_array_of_containers((uint64_t)v3, 1LL, a1[4]);
  *(void *)(*(void *)(a1[5] + 8) + 24LL) = result;
  return result;
}

uint64_t container_delete_array_of_containers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_delete_array_of_containers",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_delete_array_of_containers_block_invoke;
  v9[3] = &unk_18963AA08;
  v9[6] = a1;
  void v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error( (uint64_t)"container_delete_array_of_containers",  gClientFaultLoggingEnabled,  v11[3]);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_delete_array_of_containers_block_invoke(uint64_t *a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  xpc_object_t v2 = (void *)container_operation_delete_array(a1[6], a1[7], 0LL, &v5, &v6);
  if (!v2)
  {
    if (v6) {
      uint64_t v3 = *(void *)v6;
    }
    else {
      uint64_t v3 = 1LL;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24LL) = v3;
  }

  if (*(void *)(*(void *)(a1[5] + 8) + 24LL) != 1LL
    || (_container_async_reclaim_disk_space(a1[4]), *(void *)(*(void *)(a1[5] + 8) + 24LL) != 1LL))
  {
    uint64_t v4 = a1[4];
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }

  container_free_array_of_containers(v2, v5);
  container_error_free(v6);
}

uint64_t container_set_info_value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v6 = _os_activity_create(&dword_18028C000, "container_set_info_value", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_set_info_value_block_invoke;
  v9[3] = &unk_18963AA30;
  v9[4] = &v10;
  v9[5] = a1;
  v9[6] = a2;
  void v9[7] = a3;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_set_info_value", gClientFaultLoggingEnabled, v11[3]);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_set_info_value_block_invoke(uint64_t a1)
{
  uint64_t v12 = 0LL;
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2
    || (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 40)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 > 0xD)
  {
    uint64_t v4 = 11LL;
LABEL_4:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
    return;
  }

  if (!*(void *)(a1 + 48))
  {
    uint64_t v4 = 38LL;
    goto LABEL_4;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  container_xpc_encode_container_object(v5, *(void *)(a1 + 40), 0LL);
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "Command", 5uLL);
  xpc_dictionary_set_value(v6, "Container", v5);
  xpc_dictionary_set_string(v6, "Key", *(const char **)(a1 + 48));
  xpc_dictionary_set_value(v6, "Value", *(xpc_object_t *)(a1 + 56));
  uint64_t v7 = *(void *)(a1 + 40);
  int v13 = 0;
  int v8 = container_disposition(v7, &v13);
  uint64_t v9 = (void *)container_xpc_send_sync_message(v8, 0LL, v6, 1, v13, 0LL, (uint64_t)&v12);
  uint64_t v10 = v12;
  if (!v9)
  {
    if (v12) {
      uint64_t v11 = *(void *)v12;
    }
    else {
      uint64_t v11 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v11;
  }

  container_error_free(v10);
  if (v5) {
    xpc_release(v5);
  }
  if (v9) {
    xpc_release(v9);
  }
  if (v6) {
    xpc_release(v6);
  }
}

uint64_t container_copy_info_value_for_key(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 1LL;
  xpc_object_t v6 = _os_activity_create( &dword_18028C000,  "container_copy_info_value_for_key",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = __container_copy_info_value_for_key_block_invoke;
  v11[3] = &unk_18963AA58;
  v11[6] = a1;
  void v11[7] = a2;
  void v11[4] = &v12;
  v11[5] = &v16;
  os_activity_apply(v6, v11);
  os_release(v6);
  uint64_t v7 = v13;
  uint64_t v8 = v13[3];
  if (a3 && v8 != 1)
  {
    *a3 = v8;
    uint64_t v8 = v7[3];
  }

  container_log_error((uint64_t)"container_copy_info_value_for_key", gClientFaultLoggingEnabled, v8);
  uint64_t v9 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __container_copy_info_value_for_key_block_invoke(uint64_t a1)
{
  int v13 = 0LL;
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2
    || (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 48)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 > 0xD)
  {
    uint64_t v4 = 11LL;
LABEL_4:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
    return;
  }

  if (!*(void *)(a1 + 56))
  {
    uint64_t v4 = 38LL;
    goto LABEL_4;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  container_xpc_encode_container_object(v5, *(void *)(a1 + 48), 0LL);
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "Command", 6uLL);
  xpc_dictionary_set_value(v6, "Container", v5);
  xpc_dictionary_set_string(v6, "Key", *(const char **)(a1 + 56));
  uint64_t v7 = *(void *)(a1 + 48);
  int v14 = 0;
  int v8 = container_disposition(v7, &v14);
  uint64_t v9 = (void *)container_xpc_send_sync_message(v8, 0LL, v6, 1, v14, 0LL, (uint64_t)&v13);
  uint64_t v10 = v9;
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_value(v9, "ReplyInfoValue");
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v11) {
      xpc_retain(v11);
    }
    else {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 53LL;
    }
  }

  else
  {
    if (v13) {
      uint64_t v12 = *(void *)v13;
    }
    else {
      uint64_t v12 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v12;
  }

  container_error_free(v13);
  if (v5) {
    xpc_release(v5);
  }
  if (v10) {
    xpc_release(v10);
  }
  if (v6) {
    xpc_release(v6);
  }
}

uint64_t container_recreate_structure(uint64_t a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 1LL;
  uint64_t v2 = _os_activity_create( &dword_18028C000,  "container_recreate_structure",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_recreate_structure_block_invoke;
  v5[3] = &unk_18963AA80;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_recreate_structure", gClientFaultLoggingEnabled, v7[3]);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_recreate_structure_block_invoke(uint64_t a1)
{
  uint64_t v11 = 0LL;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2
    && (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 40)), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    container_xpc_encode_container_object(v4, *(void *)(a1 + 40), 0LL);
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "Command", 8uLL);
    xpc_dictionary_set_value(v5, "Container", v4);
    uint64_t v6 = *(void *)(a1 + 40);
    int v12 = 0;
    int v7 = container_disposition(v6, &v12);
    uint64_t v8 = (void *)container_xpc_send_sync_message(v7, 0LL, v5, 1, v12, 0LL, (uint64_t)&v11);
    uint64_t v9 = v11;
    if (!v8)
    {
      if (v11) {
        uint64_t v10 = *(void *)v11;
      }
      else {
        uint64_t v10 = 1LL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v10;
    }

    container_error_free(v9);
    if (v4) {
      xpc_release(v4);
    }
    if (v8) {
      xpc_release(v8);
    }
    if (v5) {
      xpc_release(v5);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 11LL;
  }

uint64_t container_regenerate_uuid(uint64_t a1)
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 1LL;
  uint64_t v2 = _os_activity_create(&dword_18028C000, "container_regenerate_uuid", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_regenerate_uuid_block_invoke;
  v5[3] = &unk_18963AAA8;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_regenerate_uuid", gClientFaultLoggingEnabled, v7[3]);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_regenerate_uuid_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  uint64_t v15 = 0LL;
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2
    || (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 40)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    xpc_object_t v4 = 0LL;
    xpc_object_t v5 = 0LL;
    xpc_object_t v6 = 0LL;
    int v7 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 11LL;
    goto LABEL_4;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  container_xpc_encode_container_object(v5, *(void *)(a1 + 40), 0LL);
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "Command", 9uLL);
  xpc_dictionary_set_value(v6, "Container", v5);
  uint64_t v8 = *(void *)(a1 + 40);
  *(_DWORD *)__int128 buf = 0;
  int v9 = container_disposition(v8, buf);
  uint64_t v10 = (void *)container_xpc_send_sync_message(v9, 0LL, v6, 1, *(int *)buf, 0LL, (uint64_t)&v15);
  if (!v10)
  {
    if (v15) {
      uint64_t v13 = *(void *)v15;
    }
    else {
      uint64_t v13 = 1LL;
    }
    xpc_object_t v4 = 0LL;
    int v7 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v13;
    goto LABEL_4;
  }

  int v7 = v10;
  xpc_object_t v4 = container_xpc_decode_container_object(v10, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  uint64_t v11 = (void *)MEMORY[0x186DF907C](v7);
  int v14 = v11;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  int v12 = (os_log_s *)qword_18C438D48;
  if (!os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEBUG))
  {
    if (!v11) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  *(_DWORD *)__int128 buf = 136315394;
  uint64_t v17 = "container_error_t container_regenerate_uuid(container_object_t _Nonnull)_block_invoke";
  __int16 v18 = 2080;
  uint64_t v19 = v11;
  _os_log_debug_impl(&dword_18028C000, v12, OS_LOG_TYPE_DEBUG, "Updated container during %s: %s", buf, 0x16u);
  if (v11)
  {
LABEL_18:
    free(v11);
    memset_s(&v14, 8uLL, 0, 8uLL);
  }

LABEL_19:
  if (v4) {
    container_update_with_container(*(void *)(a1 + 40), (uint64_t)v4);
  }
LABEL_4:
  container_error_free(v15);
  container_object_free(v4);
  if (v5) {
    xpc_release(v5);
  }
  if (v7) {
    xpc_release(v7);
  }
  if (v6) {
    xpc_release(v6);
  }
}

uint64_t container_process_restored_container(uint64_t a1)
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 1LL;
  uint64_t v2 = _os_activity_create( &dword_18028C000,  "container_process_restored_container",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_process_restored_container_block_invoke;
  v5[3] = &unk_18963AAD0;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error( (uint64_t)"container_process_restored_container",  gClientFaultLoggingEnabled,  v7[3]);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_process_restored_container_block_invoke(uint64_t a1)
{
  uint64_t v11 = 0LL;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2
    && (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 40)), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    container_xpc_encode_container_object(v4, *(void *)(a1 + 40), 0LL);
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "Command", 0x16uLL);
    xpc_dictionary_set_value(v5, "Container", v4);
    uint64_t v6 = *(void *)(a1 + 40);
    int v12 = 0;
    int v7 = container_disposition(v6, &v12);
    uint64_t v8 = (void *)container_xpc_send_sync_message(v7, 0LL, v5, 1, v12, 0LL, (uint64_t)&v11);
    uint64_t v9 = v11;
    if (!v8)
    {
      if (v11) {
        uint64_t v10 = *(void *)v11;
      }
      else {
        uint64_t v10 = 1LL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v10;
    }

    container_error_free(v9);
    if (v4) {
      xpc_release(v4);
    }
    if (v8) {
      xpc_release(v8);
    }
    if (v5) {
      xpc_release(v5);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 11LL;
  }

uint64_t container_disk_usage(uint64_t a1, void *a2)
{
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 1LL;
  xpc_object_t v4 = _os_activity_create(&dword_18028C000, "container_disk_usage", MEMORY[0x189600820], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_disk_usage_block_invoke;
  block[3] = &unk_18963AAF8;
  void block[5] = &v13;
  void block[6] = a1;
  block[4] = &v9;
  os_activity_apply(v4, block);
  os_release(v4);
  xpc_object_t v5 = v10;
  if (a2) {
    *a2 = v10[3];
  }
  container_log_error((uint64_t)"container_disk_usage", gClientFaultLoggingEnabled, v5[3]);
  uint64_t v6 = v14[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void __container_disk_usage_block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  int v14 = 0LL;
  uint64_t v2 = a1[6];
  if (v2
    && (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(a1[6]), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    xpc_object_t v4 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v5 = container_object_get_class(a1[6]);
      unint64_t identifier = container_object_get_identifier(a1[6]);
      *(_DWORD *)__int128 buf = 134218243;
      uint64_t v16 = v5;
      __int16 v17 = 2081;
      unint64_t v18 = identifier;
      _os_log_impl( &dword_18028C000,  v4,  OS_LOG_TYPE_DEFAULT,  "Requesting disk usage; class = %llu, unint64_t identifier = %{private}s",
        buf,
        0x16u);
    }

    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    container_xpc_encode_container_object(v7, a1[6], 0LL);
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "Command", 0x17uLL);
    xpc_dictionary_set_value(v8, "Container", v7);
    *(_DWORD *)__int128 buf = 0;
    int v9 = container_disposition(a1[6], buf);
    uint64_t v10 = (void *)container_xpc_send_sync_message(v9, (void *)1, v8, 1, *(int *)buf, 0LL, (uint64_t)&v14);
    uint64_t v11 = v10;
    if (v10)
    {
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(v10, "ReplyDiskUsage");
      uint64_t v12 = v14;
    }

    else
    {
      uint64_t v12 = v14;
      if (v14) {
        uint64_t v13 = *(void *)v14;
      }
      else {
        uint64_t v13 = 1LL;
      }
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v13;
    }

    container_error_free(v12);
    if (v7) {
      xpc_release(v7);
    }
    if (v11) {
      xpc_release(v11);
    }
    if (v8) {
      xpc_release(v8);
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 11LL;
  }

uint64_t container_delete_all_data_container_content(uint64_t a1, uint64_t a2)
{
  return container_delete_all_data_container_content_for_current_user(a2);
}

uint64_t container_delete_all_data_container_content_for_current_user(uint64_t a1)
{
  uint64_t v6 = 0LL;
  xpc_object_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 1LL;
  uint64_t v2 = _os_activity_create( &dword_18028C000,  "container_delete_all_data_container_content_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_delete_all_data_container_content_for_current_user_block_invoke;
  v5[3] = &unk_18963AB20;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error( (uint64_t)"container_delete_all_data_container_content_for_current_user",  gClientFaultLoggingEnabled,  v7[3]);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_delete_all_data_container_content_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0LL;
  if (!*(void *)(a1 + 40))
  {
    xpc_object_t v4 = 0LL;
    xpc_object_t v2 = 0LL;
    uint64_t v5 = 18LL;
    goto LABEL_9;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0xBuLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
  uint64_t v3 = (void *)container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v6);
  xpc_object_t v4 = v6;
  if (!v3)
  {
    if (v6) {
      uint64_t v5 = *(void *)v6;
    }
    else {
      uint64_t v5 = 1LL;
    }
LABEL_9:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
    container_error_free(v4);
    if (!v2) {
      return;
    }
    goto LABEL_10;
  }

  container_error_free(v6);
  xpc_release(v3);
  if (v2) {
LABEL_10:
  }
    xpc_release(v2);
}

uint64_t container_delete_all_container_content(uint64_t a1)
{
  uint64_t v6 = 0LL;
  xpc_object_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 1LL;
  xpc_object_t v2 = _os_activity_create( &dword_18028C000,  "container_delete_all_container_content",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_delete_all_container_content_block_invoke;
  v5[3] = &unk_18963AB48;
  v5[4] = &v6;
  void v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error( (uint64_t)"container_delete_all_container_content",  gClientFaultLoggingEnabled,  v7[3]);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_delete_all_container_content_block_invoke(uint64_t a1)
{
  uint64_t v12 = 0LL;
  xpc_object_t v2 = *(xpc_object_t *)(a1 + 40);
  if (!v2)
  {
    unint64_t identifier = 0LL;
    goto LABEL_6;
  }

  uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 40));
  if (uuid_is_null(uuid)) {
    goto LABEL_3;
  }
  unint64_t identifier = (void *)container_object_get_identifier((uint64_t)v2);
  if (!identifier) {
    goto LABEL_4;
  }
  if ((unint64_t)container_object_get_class((uint64_t)v2) - 1 > 0xD)
  {
LABEL_3:
    unint64_t identifier = 0LL;
LABEL_4:
    xpc_object_t v2 = 0LL;
LABEL_6:
    uint64_t v5 = 11LL;
    goto LABEL_7;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0xCuLL);
  if (container_object_get_persona_unique_string(*(void *)(a1 + 40)))
  {
    persona_unique_string = (const char *)container_object_get_persona_unique_string(*(void *)(a1 + 40));
    xpc_dictionary_set_string(v2, "PersonaUniqueString", persona_unique_string);
  }

  xpc_object_t v7 = (const char *)container_object_get_identifier(*(void *)(a1 + 40));
  xpc_dictionary_set_string(v2, "Identifier", v7);
  uint64_t v8 = container_object_get_class(*(void *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "ContainerClass", (uint64_t)v8);
  uint64_t v9 = *(void *)(a1 + 40);
  int v13 = 0;
  int v10 = container_disposition(v9, &v13);
  uint64_t v11 = (void *)container_xpc_send_sync_message(v10, 0LL, v2, 1, v13, 0LL, (uint64_t)&v12);
  unint64_t identifier = v12;
  if (!v11)
  {
    if (v12) {
      uint64_t v5 = *(void *)v12;
    }
    else {
      uint64_t v5 = 1LL;
    }
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
    container_error_free(identifier);
    if (!v2) {
      return;
    }
    goto LABEL_8;
  }

  container_error_free(v12);
  xpc_release(v11);
  if (v2) {
LABEL_8:
  }
    xpc_release(v2);
}

uint64_t container_copy_code_signing_info_for_identifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  xpc_object_t v4 = _os_activity_create( &dword_18028C000,  "container_copy_code_signing_info_for_identifier",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_copy_code_signing_info_for_identifier_block_invoke;
  block[3] = &unk_18963AB98;
  void block[5] = &v14;
  void block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error( (uint64_t)"container_copy_code_signing_info_for_identifier",  gClientFaultLoggingEnabled,  v6);
  uint64_t v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_copy_code_signing_info_for_identifier_block_invoke(uint64_t a1)
{
  uint64_t v8 = 0LL;
  if (!*(void *)(a1 + 48))
  {
    uint64_t v6 = 0LL;
    xpc_object_t v2 = 0LL;
    uint64_t v7 = 18LL;
    goto LABEL_12;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x13uLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
  uint64_t v3 = (void *)container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v8);
  if (!v3)
  {
    uint64_t v6 = v8;
    if (v8) {
      uint64_t v7 = *(void *)v8;
    }
    else {
      uint64_t v7 = 1LL;
    }
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
    container_error_free(v6);
    if (!v2) {
      return;
    }
    goto LABEL_13;
  }

  xpc_object_t v4 = v3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_value(v3, "ReplyInfoDictionary");
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v5) {
    xpc_retain(v5);
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 53LL;
  }
  container_error_free(v8);
  xpc_release(v4);
  if (v2) {
LABEL_13:
  }
    xpc_release(v2);
}

uint64_t container_invalidate_code_signing_cache(uint64_t *a1)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 1LL;
  xpc_object_t v2 = _os_activity_create( &dword_18028C000,  "container_invalidate_code_signing_cache",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_invalidate_code_signing_cache_block_invoke;
  v7[3] = &unk_18963ABC0;
  v7[4] = &v8;
  v7[5] = &v12;
  os_activity_apply(v2, v7);
  os_release(v2);
  uint64_t v3 = v9;
  uint64_t v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    uint64_t v4 = v3[3];
  }

  container_log_error( (uint64_t)"container_invalidate_code_signing_cache",  gClientFaultLoggingEnabled,  v4);
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __container_invalidate_code_signing_cache_block_invoke(uint64_t a1)
{
  uint64_t v7 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x14uLL);
  uint64_t v3 = container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v7);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    container_error_free(v7);
    xpc_release(v4);
    if (!v2) {
      return;
    }
    goto LABEL_3;
  }

  uint64_t v5 = v7;
  if (v7) {
    uint64_t v6 = *(void *)v7;
  }
  else {
    uint64_t v6 = 1LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  container_error_free(v5);
  if (v2) {
LABEL_3:
  }
    xpc_release(v2);
}

void container_set_data_protection_for_current_user( uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6)
{
  uint64_t v12 = _os_activity_create( &dword_18028C000,  "container_set_data_protection_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v13[0] = MEMORY[0x1895FED80];
  v13[1] = 0x40000000LL;
  v13[2] = __container_set_data_protection_for_current_user_block_invoke;
  v13[3] = &unk_18963AC10;
  v13[5] = a2;
  v13[6] = a1;
  int v14 = a3;
  char v15 = a4;
  char v16 = a5;
  void v13[4] = a6;
  os_activity_apply(v12, v13);
  os_release(v12);
}

void __container_set_data_protection_for_current_user_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v2, "Command", 0x15uLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
    xpc_dictionary_set_uint64(v2, "ContainerClass", *(void *)(a1 + 48));
    xpc_dictionary_set_int64(v2, "DataProtectionClass", *(int *)(a1 + 56));
    xpc_dictionary_set_BOOL(v2, "IsThirdParty", *(_BYTE *)(a1 + 60));
    xpc_dictionary_set_BOOL(v2, "RetryIfLocked", *(_BYTE *)(a1 + 61));
    uint64_t v3 = *(void *)(a1 + 48);
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      int v4 = 1;
    }

    else
    {
      unint64_t v5 = v3 - 1;
      if (v5 >= 0xE) {
        int v4 = 0;
      }
      else {
        int v4 = dword_1802B1D74[v5];
      }
    }

    v6[0] = MEMORY[0x1895FED80];
    v6[1] = 0x40000000LL;
    v6[2] = __container_set_data_protection_for_current_user_block_invoke_2;
    v6[3] = &unk_18963ABE8;
    v6[4] = *(void *)(a1 + 32);
    container_xpc_send_message(v4, (void *)3, v2, 0, 1, (uint64_t)v6);
    if (v2) {
      xpc_release(v2);
    }
  }

  else if (*(void *)(a1 + 32))
  {
    container_log_error( (uint64_t)"container_set_data_protection_for_current_user",  gClientFaultLoggingEnabled,  18LL);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

uint64_t __container_set_data_protection_for_current_user_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t container_perform_data_migration(uint64_t *a1)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 1LL;
  xpc_object_t v2 = _os_activity_create( &dword_18028C000,  "container_perform_data_migration",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_perform_data_migration_block_invoke;
  v7[3] = &unk_18963AC38;
  v7[4] = &v12;
  v7[5] = &v8;
  os_activity_apply(v2, v7);
  os_release(v2);
  uint64_t v3 = v9;
  uint64_t v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    uint64_t v4 = v3[3];
  }

  container_log_error((uint64_t)"container_perform_data_migration", gClientFaultLoggingEnabled, v4);
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

BOOL __container_perform_data_migration_block_invoke(uint64_t a1)
{
  BOOL result = _common_perform_data_migration(0, (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

BOOL _common_perform_data_migration(int a1, uint64_t *a2)
{
  uint64_t v11 = 0LL;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v5 = v4;
  if (a1) {
    uint64_t v6 = 30LL;
  }
  else {
    uint64_t v6 = 24LL;
  }
  if (a1) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  xpc_dictionary_set_uint64(v4, "Command", v6);
  uint64_t v8 = (void *)container_xpc_send_sync_message(v7, 0LL, v5, 1, 0, 0LL, (uint64_t)&v11);
  if (!v8)
  {
    if (v11) {
      uint64_t v9 = *(void *)v11;
    }
    else {
      uint64_t v9 = 1LL;
    }
    container_error_free(v11);
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  container_error_free(v11);
  xpc_release(v8);
  uint64_t v9 = 1LL;
  if (v5) {
LABEL_9:
  }
    xpc_release(v5);
LABEL_10:
  if (a2 && v9 != 1) {
    *a2 = v9;
  }
  return v9 != 0;
}

uint64_t container_perform_data_migration_for_current_user(uint64_t *a1)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 1LL;
  xpc_object_t v2 = _os_activity_create( &dword_18028C000,  "container_perform_data_migration_for_current_user",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_perform_data_migration_for_current_user_block_invoke;
  v7[3] = &unk_18963AC60;
  v7[4] = &v12;
  v7[5] = &v8;
  os_activity_apply(v2, v7);
  os_release(v2);
  uint64_t v3 = v9;
  uint64_t v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    uint64_t v4 = v3[3];
  }

  container_log_error( (uint64_t)"container_perform_data_migration_for_current_user",  gClientFaultLoggingEnabled,  v4);
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

BOOL __container_perform_data_migration_for_current_user_block_invoke(uint64_t a1)
{
  BOOL result = _common_perform_data_migration(1, (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_stage_shared_system_content(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 1LL;
  uint64_t v8 = _os_activity_create( &dword_18028C000,  "container_stage_shared_system_content",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_stage_shared_system_content_block_invoke;
  block[3] = &unk_18963AC88;
  void block[6] = a1;
  void block[7] = a2;
  void block[8] = a3;
  block[4] = &v14;
  void block[5] = &v18;
  os_activity_apply(v8, block);
  os_release(v8);
  uint64_t v9 = v15;
  uint64_t v10 = v15[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    uint64_t v10 = v9[3];
  }

  container_log_error( (uint64_t)"container_stage_shared_system_content",  gClientFaultLoggingEnabled,  v10);
  uint64_t v11 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __container_stage_shared_system_content_block_invoke(uint64_t a1)
{
  int v7 = 0LL;
  if (*(void *)(a1 + 48) && *(void *)(a1 + 56) && *(void *)(a1 + 64))
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v2, "Command", 0x1AuLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
    xpc_dictionary_set_string(v2, "SourcePath", *(const char **)(a1 + 56));
    xpc_dictionary_set_string(v2, "DestPath", *(const char **)(a1 + 64));
    uint64_t v3 = (void *)container_xpc_send_sync_message(1, 0LL, v2, 1, 0, 0LL, (uint64_t)&v7);
    uint64_t v4 = v3;
    if (v3)
    {
      string = xpc_dictionary_get_string(v3, "ReplyPath");
      if (string) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = strdup(string);
      }
      else {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 53LL;
      }
    }

    else
    {
      if (v7) {
        uint64_t v6 = *(void *)v7;
      }
      else {
        uint64_t v6 = 1LL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
    }

    container_error_free(v7);
    if (v2) {
      xpc_release(v2);
    }
    if (v4) {
      xpc_release(v4);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 38LL;
  }

uint64_t container_user_managed_assets_path(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_user_managed_assets_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_user_managed_assets_path_block_invoke;
  block[3] = &unk_18963ACB0;
  void block[5] = &v10;
  void block[6] = a1;
  block[4] = &v14;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error((uint64_t)"container_user_managed_assets_path", gClientFaultLoggingEnabled, v6);
  uint64_t v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

char *__container_user_managed_assets_path_block_invoke(uint64_t a1)
{
  BOOL result = _common_user_managed_assets_path( *(char **)(a1 + 48),  0,  1,  0LL,  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

char *_common_user_managed_assets_path(char *a1, BOOL a2, BOOL a3, BOOL *a4, uint64_t *a5)
{
  uint64_t v19 = 0LL;
  if (!a1)
  {
    xpc_object_t v10 = 0LL;
    uint64_t v17 = 18LL;
    goto LABEL_17;
  }

  uint64_t v9 = a1;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "Command", 0x1CuLL);
  xpc_dictionary_set_string(v10, "Identifier", v9);
  xpc_dictionary_set_BOOL(v10, "IsRelative", a2);
  xpc_dictionary_set_BOOL(v10, "CreateIfNecessary", a3);
  if (a4) {
    int v11 = !a3;
  }
  else {
    int v11 = 1;
  }
  uint64_t v12 = (void *)container_xpc_send_sync_message(2, 0LL, v10, v11, 0, 0LL, (uint64_t)&v19);
  if (!v12)
  {
    a1 = (char *)v19;
    if (v19) {
      uint64_t v17 = *(void *)v19;
    }
    else {
      uint64_t v17 = 1LL;
    }
LABEL_17:
    container_error_free(a1);
    uint64_t v16 = 0LL;
    if (!v10) {
      goto LABEL_19;
    }
LABEL_18:
    xpc_release(v10);
    goto LABEL_19;
  }

  uint64_t v13 = v12;
  string = xpc_dictionary_get_string(v12, "ReplyPath");
  if (string)
  {
    char v15 = string;
    if (a4) {
      *a4 = xpc_dictionary_get_BOOL(v13, "ReplyExisted");
    }
    uint64_t v16 = strdup(v15);
    uint64_t v17 = 1LL;
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 53LL;
  }

  container_error_free(v19);
  xpc_release(v13);
  if (v10) {
    goto LABEL_18;
  }
LABEL_19:
  if (a5 && v17 != 1) {
    *a5 = v17;
  }
  return v16;
}

uint64_t container_user_managed_assets_relative_path(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_user_managed_assets_relative_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_user_managed_assets_relative_path_block_invoke;
  block[3] = &unk_18963ACD8;
  void block[5] = &v10;
  void block[6] = a1;
  block[4] = &v14;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error( (uint64_t)"container_user_managed_assets_relative_path",  gClientFaultLoggingEnabled,  v6);
  uint64_t v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

char *__container_user_managed_assets_relative_path_block_invoke(uint64_t a1)
{
  BOOL result = _common_user_managed_assets_path( *(char **)(a1 + 48),  1,  1,  0LL,  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_user_managed_assets_path(uint64_t a1, char a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 1LL;
  uint64_t v8 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_user_managed_assets_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_create_or_lookup_user_managed_assets_path_block_invoke;
  block[3] = &unk_18963AD00;
  char v14 = a2;
  void block[6] = a1;
  void block[7] = a3;
  block[4] = &v19;
  void block[5] = &v15;
  os_activity_apply(v8, block);
  os_release(v8);
  uint64_t v9 = v16;
  uint64_t v10 = v16[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    uint64_t v10 = v9[3];
  }

  container_log_error( (uint64_t)"container_create_or_lookup_user_managed_assets_path",  gClientFaultLoggingEnabled,  v10);
  uint64_t v11 = v20[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

char *__container_create_or_lookup_user_managed_assets_path_block_invoke(uint64_t a1)
{
  BOOL result = _common_user_managed_assets_path( *(char **)(a1 + 48),  0,  *(unsigned __int8 *)(a1 + 64),  *(BOOL **)(a1 + 56),  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_create_or_lookup_user_managed_assets_relative_path( uint64_t a1, char a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 1LL;
  uint64_t v8 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_user_managed_assets_relative_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_create_or_lookup_user_managed_assets_relative_path_block_invoke;
  block[3] = &unk_18963AD28;
  char v14 = a2;
  void block[6] = a1;
  void block[7] = a3;
  block[4] = &v19;
  void block[5] = &v15;
  os_activity_apply(v8, block);
  os_release(v8);
  uint64_t v9 = v16;
  uint64_t v10 = v16[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    uint64_t v10 = v9[3];
  }

  container_log_error( (uint64_t)"container_create_or_lookup_user_managed_assets_relative_path",  gClientFaultLoggingEnabled,  v10);
  uint64_t v11 = v20[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

char *__container_create_or_lookup_user_managed_assets_relative_path_block_invoke(uint64_t a1)
{
  BOOL result = _common_user_managed_assets_path( *(char **)(a1 + 48),  1,  *(unsigned __int8 *)(a1 + 64),  *(BOOL **)(a1 + 56),  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t container_delete_user_managed_assets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_delete_user_managed_assets",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __container_delete_user_managed_assets_block_invoke;
  v9[3] = &unk_18963AD50;
  v9[6] = a1;
  void v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error( (uint64_t)"container_delete_user_managed_assets",  gClientFaultLoggingEnabled,  v11[3]);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_delete_user_managed_assets_block_invoke(uint64_t a1)
{
  uint64_t v8 = 0LL;
  if (*(void *)(a1 + 48))
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v2, "Command", 0x1DuLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
    xpc_dictionary_set_string(v2, "SourcePath", *(const char **)(a1 + 56));
    uint64_t v3 = container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v8);
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      _container_async_reclaim_disk_space(*(void *)(a1 + 32));
      uint64_t v5 = v8;
    }

    else
    {
      uint64_t v5 = v8;
      if (v8) {
        uint64_t v6 = *(void *)v8;
      }
      else {
        uint64_t v6 = 1LL;
      }
      uint64_t v4 = 0LL;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v6;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
    xpc_object_t v2 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 18LL;
  }

  container_error_free(v5);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) != 1LL)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }

  if (v4) {
    xpc_release(v4);
  }
  if (v2) {
    xpc_release(v2);
  }
}

uint64_t container_subdirectories_for_class(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_subdirectories_for_class",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_subdirectories_for_class_block_invoke;
  block[3] = &unk_18963AD78;
  void block[5] = &v14;
  void block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error((uint64_t)"container_subdirectories_for_class", gClientFaultLoggingEnabled, v6);
  uint64_t v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_subdirectories_for_class_block_invoke(void *a1)
{
  if ((unint64_t)(a1[6] - 1LL) >= 0xE)
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 20LL;
    return;
  }

  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_array_create(0LL, 0LL);
  unint64_t v2 = a1[6];
  if (v2 > 0xE) {
    goto LABEL_13;
  }
  if (((1LL << v2) & 0x1E54) == 0)
  {
    if (((1LL << v2) & 0x412A) != 0) {
      return;
    }
    if (((1LL << v2) & 0x2080) != 0)
    {
      xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "Library");
      uint64_t v3 = *(void **)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v4 = "Library/Caches";
LABEL_12:
      xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, v4);
      return;
    }

LABEL_13:
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 70LL;
    uint64_t v6 = *(void *)(a1[5] + 8LL);
    uint64_t v7 = *(void **)(v6 + 24);
    if (v7)
    {
      xpc_release(v7);
      uint64_t v6 = *(void *)(a1[5] + 8LL);
    }

    *(void *)(v6 + 24) = 0LL;
    return;
  }

  xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "Documents");
  xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "Library");
  xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "Library/Caches");
  xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "Library/Preferences");
  xpc_array_set_string(*(xpc_object_t *)(*(void *)(a1[5] + 8LL) + 24LL), 0xFFFFFFFFFFFFFFFFLL, "tmp");
  unint64_t v5 = a1[6];
  if (v5 <= 0xB && ((1LL << v5) & 0xED4) != 0)
  {
    uint64_t v3 = *(void **)(*(void *)(a1[5] + 8LL) + 24LL);
    uint64_t v4 = "SystemData";
    goto LABEL_12;
  }

uint64_t container_copy_persona_unique_strings(uint64_t *a1)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 1LL;
  unint64_t v2 = _os_activity_create( &dword_18028C000,  "container_copy_persona_unique_strings",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __container_copy_persona_unique_strings_block_invoke;
  v7[3] = &unk_18963ADA0;
  v7[4] = &v8;
  v7[5] = &v12;
  os_activity_apply(v2, v7);
  os_release(v2);
  uint64_t v3 = v9;
  uint64_t v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    uint64_t v4 = v3[3];
  }

  container_log_error((uint64_t)"container_copy_persona_unique_strings", gClientFaultLoggingEnabled, v4);
  uint64_t v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __container_copy_persona_unique_strings_block_invoke(uint64_t a1)
{
  uint64_t v9 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x20uLL);
  uint64_t v3 = (void *)container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v9);
  if (v3)
  {
    uint64_t v4 = v3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_value( v3,  "ReplyPersonaUniqueStringsArray");
    uint64_t v5 = MEMORY[0x186DF9184](*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v5 == MEMORY[0x189600958])
    {
      xpc_retain(*(xpc_object_t *)(v6 + 24));
    }

    else
    {
      *(void *)(v6 + 24) = 0LL;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 53LL;
    }

    container_error_free(v9);
    xpc_release(v4);
    if (v2) {
LABEL_8:
    }
      xpc_release(v2);
  }

  else
  {
    uint64_t v7 = v9;
    if (v9) {
      uint64_t v8 = *(void *)v9;
    }
    else {
      uint64_t v8 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
    container_error_free(v7);
    if (v2) {
      goto LABEL_8;
    }
  }

uint64_t container_flush_container_cache(uint64_t a1, char a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_flush_container_cache",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_flush_container_cache_block_invoke;
  block[3] = &unk_18963ADC8;
  char v8 = a2;
  block[4] = &v9;
  void block[5] = a1;
  os_activity_apply(v4, block);
  os_release(v4);
  container_log_error((uint64_t)"container_flush_container_cache", gClientFaultLoggingEnabled, v10[3]);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_flush_container_cache_block_invoke(uint64_t a1)
{
  uint64_t v9 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x21uLL);
  xpc_dictionary_set_uint64(v2, "ContainerClass", *(void *)(a1 + 40));
  xpc_dictionary_set_BOOL(v2, "Transient", *(_BYTE *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    int v4 = 1;
  }

  else
  {
    unint64_t v5 = v3 - 1;
    if (v5 > 0xD) {
      int v4 = 0;
    }
    else {
      int v4 = dword_1802B1D74[v5];
    }
  }

  uint64_t v6 = (void *)container_xpc_send_sync_message(v4, 0LL, v2, 1, 0, 0LL, (uint64_t)&v9);
  uint64_t v7 = v9;
  if (v6)
  {
    container_error_free(v9);
    xpc_release(v6);
    if (!v2) {
      return;
    }
    goto LABEL_8;
  }

  if (v9) {
    uint64_t v8 = *(void *)v9;
  }
  else {
    uint64_t v8 = 1LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
  container_error_free(v7);
  if (v2) {
LABEL_8:
  }
    xpc_release(v2);
}

uint64_t container_flush_persona_cache()
{
  uint64_t v4 = 0LL;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 1LL;
  uint64_t v0 = _os_activity_create( &dword_18028C000,  "container_flush_persona_cache",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_flush_persona_cache_block_invoke;
  block[3] = &unk_18963ADF0;
  block[4] = &v4;
  os_activity_apply(v0, block);
  os_release(v0);
  container_log_error((uint64_t)"container_flush_persona_cache", gClientFaultLoggingEnabled, v5[3]);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __container_flush_persona_cache_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x22uLL);
  uint64_t v3 = (void *)container_xpc_send_sync_message(2, 0LL, v2, 1, 0, 0LL, (uint64_t)&v6);
  uint64_t v4 = v6;
  if (v3)
  {
    container_error_free(v6);
    xpc_release(v3);
    if (!v2) {
      return;
    }
    goto LABEL_3;
  }

  if (v6) {
    uint64_t v5 = *(void *)v6;
  }
  else {
    uint64_t v5 = 1LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  container_error_free(v4);
  if (v2) {
LABEL_3:
  }
    xpc_release(v2);
}

void container_perform_with_client_context(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_perform_with_client_context",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __container_perform_with_client_context_block_invoke;
  v5[3] = &unk_18963AE18;
  v5[4] = a2;
  void v5[5] = a1;
  os_activity_apply(v4, v5);
  os_release(v4);
}

uint64_t __container_perform_with_client_context_block_invoke(uint64_t a1)
{
  return container_xpc_set_client_context_during_block(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t container_copy_from_path(char *a1, char **a2, uint64_t *a3)
{
  uint64_t v4 = &v24;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  uint64_t v27 = 0LL;
  uint64_t v5 = (void **)&v20;
  uint64_t v20 = 0LL;
  uint64_t v21 = (void **)&v20;
  uint64_t v22 = 0x2000000000LL;
  uint64_t v23 = 0LL;
  if (a1)
  {
    getpid();
    int v8 = sandbox_check();
    if (v8)
    {
      uint64_t v4 = v25;
      uint64_t v9 = (unsigned __int8 *)v25[3];
    }

    else
    {
      uint64_t v9 = container_paths_copy_container_from_path(a1, a2, v21 + 3);
      uint64_t v4 = v25;
      v25[3] = (uint64_t)v9;
    }

    uint64_t v5 = v21;
    if (!v9
      && ((v11 = v21[3]) == 0LL ? (int v12 = 0) : (int v12 = v11[6]),
          !v8 ? (BOOL v13 = v12 == 13) : (BOOL v13 = 1),
          !v13 ? (BOOL v14 = v12 == 1) : (BOOL v14 = 1),
          v14))
    {
      container_error_free(v11);
      v21[3] = 0LL;
      uint64_t v15 = _os_activity_create( &dword_18028C000,  "container_copy_from_path",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __container_copy_from_path_block_invoke;
      block[3] = &unk_18963AE40;
      block[4] = &v20;
      void block[5] = &v24;
      void block[6] = a1;
      void block[7] = a2;
      os_activity_apply(v15, block);
      os_release(v15);
      uint64_t v4 = v25;
      uint64_t v10 = 1LL;
      uint64_t v5 = v21;
      if (!a3) {
        goto LABEL_26;
      }
    }

    else
    {
      uint64_t v10 = 1LL;
      if (!a3) {
        goto LABEL_26;
      }
    }
  }

  else
  {
    uint64_t v10 = 38LL;
    if (!a3) {
      goto LABEL_26;
    }
  }

  if (!v4[3])
  {
    uint64_t v16 = (uint64_t *)v5[3];
    if (v16) {
      uint64_t v10 = *v16;
    }
    *a3 = v10;
  }

LABEL_26:
  container_error_free(v5[3]);
  uint64_t v17 = v25[3];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v17;
}

void __container_copy_from_path_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x2CuLL);
  xpc_dictionary_set_string(v2, "Path", *(const char **)(a1 + 48));
  uint64_t v3 = (void *)container_xpc_send_sync_message(3, 0LL, v2, 1, 0, 0LL, *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = container_xpc_decode_container_object(v3, 0LL);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      string = xpc_dictionary_get_string(v4, "ReplyRelativePath");
      if (string)
      {
        uint64_t v6 = *(char ***)(a1 + 56);
        if (v6) {
          *uint64_t v6 = strndup(string, 0x400uLL);
        }
      }
    }
  }

  if (v2) {
    xpc_release(v2);
  }
  if (v4) {
    xpc_release(v4);
  }
}

uint64_t container_acquire_sandbox_extension(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  char v20 = 0;
  uint64_t v13 = 0LL;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 1LL;
  uint64_t v6 = _os_activity_create( &dword_18028C000,  "container_acquire_sandbox_extension",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = __container_acquire_sandbox_extension_block_invoke;
  v11[3] = &unk_18963AE68;
  v11[5] = &v17;
  v11[6] = a1;
  char v12 = a2;
  void v11[4] = &v13;
  os_activity_apply(v6, v11);
  os_release(v6);
  uint64_t v7 = v14;
  uint64_t v8 = v14[3];
  if (a3 && v8 != 1)
  {
    *a3 = v8;
    uint64_t v8 = v7[3];
  }

  container_log_error((uint64_t)"container_acquire_sandbox_extension", gClientFaultLoggingEnabled, v8);
  uint64_t v9 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

void __container_acquire_sandbox_extension_block_invoke(uint64_t a1)
{
  uint64_t v16 = 0LL;
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2
    || (uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid(*(void *)(a1 + 48)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 11LL;
    return;
  }

  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(v4 + 88);
  if (!v5 || (uint64_t v6 = *(void **)(v5 + 128)) == 0LL)
  {
    string = *(const char **)(v4 + 48);
    if (!string) {
      goto LABEL_10;
    }
LABEL_14:
    container_object_sandbox_extension_activate(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    return;
  }

  string = xpc_array_get_string(v6, *(unsigned int *)(v4 + 96));
  if (string) {
    goto LABEL_14;
  }
LABEL_10:
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)string, 0LL, 0LL);
  container_xpc_encode_container_object(v8, *(void *)(a1 + 48), 0LL);
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v9, "Command", 0x23uLL);
  xpc_dictionary_set_value(v9, "Container", v8);
  uint64_t v10 = *(void *)(a1 + 48);
  int v17 = 0;
  int v11 = container_disposition(v10, &v17);
  char v12 = (void *)container_xpc_send_sync_message(v11, 0LL, v9, 1, v17, 0LL, (uint64_t)&v16);
  uint64_t v13 = v12;
  if (v12)
  {
    BOOL v14 = xpc_dictionary_get_string(v12, "ReplySandboxToken");
    if (v14)
    {
      container_object_set_sandbox_token(*(void **)(a1 + 48), v14);
      container_object_sandbox_extension_activate(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }
  }

  else
  {
    if (v16) {
      uint64_t v15 = *(void *)v16;
    }
    else {
      uint64_t v15 = 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v15;
  }

  container_error_free(v16);
  if (v8) {
    xpc_release(v8);
  }
  if (v9) {
    xpc_release(v9);
  }
  if (v13) {
    xpc_release(v13);
  }
}

uint64_t container_create_or_lookup_app_group_path_by_app_group_identifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v16 = 0LL;
  int v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 1LL;
  int current_persona = voucher_get_current_persona();
  uint64_t v5 = _os_activity_create( &dword_18028C000,  "container_create_or_lookup_app_group_path_by_app_group_identifier",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  v10[0] = MEMORY[0x1895FED80];
  v10[1] = 0x40000000LL;
  _DWORD v10[2] = __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke;
  v10[3] = &unk_18963AED0;
  void v10[5] = &v16;
  v10[6] = a1;
  void v10[4] = &v12;
  int v11 = current_persona;
  os_activity_apply(v5, v10);
  os_release(v5);
  uint64_t v6 = v13;
  uint64_t v7 = v13[3];
  if (a2 && v7 != 1)
  {
    *a2 = v7;
    uint64_t v7 = v6[3];
  }

  container_log_error((uint64_t)"container_create_or_lookup_app_group_path_by_app_group_identifier", 0, v7);
  uint64_t v8 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v8;
}

void __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke(uint64_t a1)
{
  uint64_t v90 = *MEMORY[0x1895FEE08];
  if (CONTAINER_PERSONA_CURRENT_block_invoke_once_token != -1) {
    dispatch_once(&CONTAINER_PERSONA_CURRENT_block_invoke_once_token, &__block_literal_global_914);
  }
  *(void *)&value[1] = 0LL;
  uint64_t v2 = (const char **)(a1 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v10 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)int v62 = 0;
    int v11 = "A NULL string is not a valid group container identifier.";
    goto LABEL_43;
  }

  os_unfair_lock_lock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  unint64_t v3 = 0x18C438000uLL;
  if (CONTAINER_PERSONA_CURRENT_block_invoke_cache)
  {
    uint64_t v83 = 0LL;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v78 = 0u;
    __int128 v77 = 0u;
    __int128 v76 = 0u;
    __int128 v75 = 0u;
    __int128 v74 = 0u;
    __int128 v73 = 0u;
    __int128 v72 = 0u;
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    __int128 v69 = 0u;
    __int128 v68 = 0u;
    __int128 v67 = 0u;
    __int128 v66 = 0u;
    __int128 v65 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    *(_OWORD *)&v62[4] = 0u;
    *(_DWORD *)int v62 = 2;
    kpersona_info();
    xpc_object_t dictionary = xpc_dictionary_get_dictionary((xpc_object_t)CONTAINER_PERSONA_CURRENT_block_invoke_cache, "default");
    if (dictionary)
    {
      string = xpc_dictionary_get_string(dictionary, *v2);
      if (string) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = strndup(string, 0x400uLL);
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
  uint64_t v6 = *v2;
  if (!**v2)
  {
    if (!dyld_program_sdk_at_least())
    {
      uid_t v12 = geteuid();
      uint64_t v13 = container_pwd_copy_user_home_path(v12, 1, 1, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      *(void *)&value[1] = v13;
      if (!v13) {
        return;
      }
      uint64_t v14 = v13;
      int v15 = asprintf((char **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), "%s/%s/%s", v13, "Library", "AppGroup");
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
      int v17 = *(void **)(v16 + 24);
      if (!v17 || v15 < 0)
      {
        if (v17)
        {
          free(v17);
          memset_s((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), 8uLL, 0, 8uLL);
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
        }

        *(void *)(v16 + 24) = 0LL;
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 73LL;
        goto LABEL_70;
      }

      BOOL v18 = 0;
      goto LABEL_55;
    }

    if (container_log_handle_for_category_onceToken != -1) {
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    }
    uint64_t v10 = (os_log_s *)container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 38LL;
      return;
    }

    *(_WORD *)int v62 = 0;
    int v11 = "An empty string is not a valid group container identifier.";
LABEL_43:
    _os_log_error_impl(&dword_18028C000, v10, OS_LOG_TYPE_ERROR, v11, v62, 2u);
    goto LABEL_17;
  }

  uint64_t v36 = *(unsigned int *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v39 = 1LL;
  value[0] = dyld_get_active_platform();
  int v38 = 0LL;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v87 = 0u;
  voucher_get_current_persona_originator_info();
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v84 = 0u;
  voucher_get_current_persona_proximate_info();
  uint64_t v83 = 0LL;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v78 = 0u;
  __int128 v77 = 0u;
  __int128 v76 = 0u;
  __int128 v75 = 0u;
  __int128 v74 = 0u;
  __int128 v73 = 0u;
  __int128 v72 = 0u;
  __int128 v71 = 0u;
  __int128 v70 = 0u;
  __int128 v69 = 0u;
  __int128 v68 = 0u;
  __int128 v67 = 0u;
  __int128 v66 = 0u;
  __int128 v65 = 0u;
  __int128 v64 = 0u;
  __int128 v63 = 0u;
  *(_OWORD *)&v62[4] = 0u;
  *(_DWORD *)int v62 = 2;
  int current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    uint64_t v33 = "<unknown>";
    __int128 v34 = "NOPERSONA";
  }

  else
  {
    else {
      xpc_object_t v9 = (&off_18963AFA8)[*(_DWORD *)&v62[8] - 2];
    }
    __int128 v34 = v9;
    uint64_t v33 = (char *)&v67 + 4;
  }

  uint64_t v35 = v7;
  if (container_log_handle_for_category_onceToken != -1) {
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  }
  uint64_t v19 = (os_log_s *)qword_18C438D48;
  if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67111683;
    int v41 = current_persona;
    __int16 v42 = 2082;
    __int16 v43 = v34;
    __int16 v44 = 2082;
    int v45 = v33;
    __int16 v46 = 1024;
    int v47 = 0;
    __int16 v48 = 1024;
    int v49 = 0;
    __int16 v50 = 1024;
    int v51 = 0;
    __int16 v52 = 1024;
    int v53 = 0;
    __int16 v54 = 2081;
    uint64_t v55 = v6;
    __int16 v56 = 1024;
    uid_t v57 = geteuid();
    __int16 v58 = 1024;
    uid_t v59 = getuid();
    __int16 v60 = 1024;
    int v61 = value[0];
    _os_log_impl( &dword_18028C000,  v19,  OS_LOG_TYPE_DEFAULT,  "Requesting app group container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [uint64_t pid = %d, per"
      "sonaid = %d], proximate [pid = %d, personaid = %d], identifier = %{private}s, eunsigned int uid = %d, unsigned int uid = %d, platform = %d",
      buf,
      0x50u);
  }

  xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v20, "Command", 0x26uLL);
  xpc_dictionary_set_string(v20, "Identifier", v6);
  xpc_dictionary_set_uint64(v20, "Platform", value[0]);
  xpc_dictionary_set_uint64(v20, "PersonaKernelID", v36);
  uint64_t v21 = (void *)container_xpc_send_sync_message(2, 0LL, v20, 1, 0, 0LL, (uint64_t)&v38);
  uint64_t v22 = v21;
  if (v21)
  {
    uint64_t v23 = container_xpc_decode_container_object(v21, &v39);
    uint64_t v24 = v23;
    unint64_t v3 = 0x18C438000uLL;
    if (v23)
    {
      if (container_object_get_path((uint64_t)v23))
      {
        unint64_t path = (const char *)container_object_get_path((uint64_t)v24);
        BOOL v18 = xpc_dictionary_get_BOOL(v22, "ReplyCacheable");
        container_object_sandbox_extension_activate((uint64_t)v24, 1);
        if (path) {
          unint64_t path = strndup(path, 0x400uLL);
        }
      }

      else
      {
        BOOL v18 = 0;
        unint64_t path = 0LL;
        uint64_t v39 = 54LL;
      }
    }

    else
    {
      BOOL v18 = 0;
      unint64_t path = 0LL;
    }
  }

  else
  {
    uint64_t v24 = 0LL;
    BOOL v18 = 0;
    unint64_t path = 0LL;
    unint64_t v3 = 0x18C438000LL;
  }

  if (v38) {
    uint64_t v39 = *(void *)v38;
  }
  container_error_free(v38);
  container_object_free(v24);
  if (v20) {
    xpc_release(v20);
  }
  if (v22) {
    xpc_release(v22);
  }
  if (v39 != 1) {
    *(void *)(v35 + 24) = v39;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = path;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
  uint64_t v14 = 0LL;
LABEL_55:
  os_unfair_lock_lock_with_options();
  uint64_t v26 = *(void **)(v3 + 3184);
  if (!v26 || !v18) {
    goto LABEL_69;
  }
  xpc_object_t v27 = xpc_dictionary_get_dictionary(v26, "default");
  if (v27)
  {
    BOOL v28 = v27;
    if (xpc_dictionary_get_count(v27) >= 0xA)
    {
      uint64_t v29 = *(void **)(v3 + 3184);
      if (v29) {
        xpc_release(v29);
      }
      *(void *)(v3 + 3184) = 0LL;
      goto LABEL_69;
    }

    xpc_object_t v32 = xpc_string_create(*(const char **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    xpc_dictionary_set_value(v28, *(const char **)(a1 + 48), v32);
    if (!v32) {
      goto LABEL_69;
    }
    __int16 v31 = v32;
LABEL_68:
    xpc_release(v31);
    goto LABEL_69;
  }

  *(void *)int v62 = xpc_string_create(*(const char **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  xpc_object_t v30 = xpc_dictionary_create((const char *const *)(a1 + 48), (xpc_object_t *)v62, 1uLL);
  xpc_dictionary_set_value(*(xpc_object_t *)(v3 + 3184), "default", v30);
  if (v30) {
    xpc_release(v30);
  }
  __int16 v31 = *(void **)v62;
  if (*(void *)v62) {
    goto LABEL_68;
  }
LABEL_69:
  os_unfair_lock_unlock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  if (v14)
  {
LABEL_70:
    free(v14);
    memset_s(&value[1], 8uLL, 0, 8uLL);
  }

xpc_object_t __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke_2()
{
  xpc_object_t result = xpc_dictionary_create(0LL, 0LL, 0LL);
  CONTAINER_PERSONA_CURRENT_block_invoke_cache = (uint64_t)result;
  return result;
}

uint64_t container_repair_user_data(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 1LL;
  uint64_t v4 = _os_activity_create( &dword_18028C000,  "container_repair_user_data",  MEMORY[0x189600820],  OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __container_repair_user_data_block_invoke;
  block[3] = &unk_18963AEF8;
  void block[5] = &v14;
  void block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  uint64_t v5 = v11;
  uint64_t v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    uint64_t v6 = v5[3];
  }

  container_log_error((uint64_t)"container_repair_user_data", gClientFaultLoggingEnabled, v6);
  uint64_t v7 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_repair_user_data_block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "Command", 0x25uLL);
  unint64_t v3 = (const char *)a1[6];
  if (v3) {
    xpc_dictionary_set_string(v2, "Path", v3);
  }
  uid_t v4 = geteuid();
  uint64_t v5 = container_pwd_copy_user_home_path(v4, 1, 1, (uint64_t *)(*(void *)(a1[4] + 8LL) + 24LL));
  uint64_t __s = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (char *)container_sandbox_issue_custom_extension( (uint64_t)"com.apple.containermanagerd.home-repair",  0LL,  (uint64_t)v5);
    uint64_t v14 = v7;
    if (v7)
    {
      xpc_dictionary_set_string(v2, "SandboxToken", v7);
      uint64_t v8 = container_xpc_send_sync_message(1, 0LL, v2, 1, 0, 0LL, (uint64_t)&v13);
      if (v8)
      {
        xpc_object_t v9 = (void *)v8;
        *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
        uint64_t v10 = v13;
      }

      else
      {
        uint64_t v10 = v13;
        if (v13) {
          uint64_t v12 = *(void *)v13;
        }
        else {
          uint64_t v12 = 1LL;
        }
        xpc_object_t v9 = 0LL;
        *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v12;
      }
    }

    else
    {
      if (container_log_handle_for_category_onceToken != -1) {
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      }
      int v11 = (os_log_s *)qword_18C438D48;
      if (os_log_type_enabled((os_log_t)qword_18C438D48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136380675;
        char v17 = v6;
        _os_log_error_impl( &dword_18028C000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to issue sandbox extension to [%{private}s] for containermanagerd",  buf,  0xCu);
      }

      uint64_t v10 = 0LL;
      xpc_object_t v9 = 0LL;
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = 90LL;
    }

    container_error_free(v10);
    free(v6);
    memset_s(&__s, 8uLL, 0, 8uLL);
    if (v7)
    {
      free(v7);
      memset_s(&v14, 8uLL, 0, 8uLL);
    }
  }

  else
  {
    container_error_free(0LL);
    xpc_object_t v9 = 0LL;
  }

  if (v2) {
    xpc_release(v2);
  }
  if (v9) {
    xpc_release(v9);
  }
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t __xpc_connection_set_logging()
{
  return MEMORY[0x189600918]();
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x189600818](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895FEE80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895FF5F8]();
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
  return MEMORY[0x189600858]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895FEF38]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FF988]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FE940](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FEB30](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1895FF998](*(void *)&a1);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FEC90]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FECB8]();
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FF9D0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FF9D8](*(void *)&a1, *(void *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1895FF010](*(void *)&a1);
}

int fls(int a1)
{
  return MEMORY[0x189600530](*(void *)&a1);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x189600538](a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FFA58](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x1895FFA68](*(void *)&a1);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FFA98]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FF640](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FF650](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1895FFB48](*(void *)&host, multiuser_flags);
}

uint64_t kpersona_find()
{
  return MEMORY[0x1895FFBB0]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1895FFBB8]();
}

uint64_t kpersona_getpath()
{
  return MEMORY[0x1895FFBC8]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1895FFBD0]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FFBF8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FFC28](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FF180](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FF190](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x189600390](name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FFE70](*(void *)&a1, a2, *(void *)&a3);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

uint64_t os_log_copy_decorated_message()
{
  return MEMORY[0x189600888]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x189600890](subsystem, category);
}

uint64_t os_log_set_hook()
{
  return MEMORY[0x1896008A0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

uint64_t os_map_str_clear()
{
  return MEMORY[0x1895FF4D8]();
}

uint64_t os_map_str_count()
{
  return MEMORY[0x1895FF4E0]();
}

uint64_t os_map_str_delete()
{
  return MEMORY[0x1895FF4E8]();
}

uint64_t os_map_str_destroy()
{
  return MEMORY[0x1895FF4F0]();
}

uint64_t os_map_str_entry()
{
  return MEMORY[0x1895FF4F8]();
}

uint64_t os_map_str_find()
{
  return MEMORY[0x1895FF500]();
}

uint64_t os_map_str_foreach()
{
  return MEMORY[0x1895FF508]();
}

uint64_t os_map_str_init()
{
  return MEMORY[0x1895FF510]();
}

uint64_t os_map_str_insert()
{
  return MEMORY[0x1895FF518]();
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1896008C0](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1896008C8](log, ptr);
}

uint64_t os_trace_get_mode()
{
  return MEMORY[0x1896008D0]();
}

uint64_t os_trace_set_mode()
{
  return MEMORY[0x1896008D8]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FF5B8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFEF8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FFF10](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FFF18](audittoken, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FF210](a1);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FF258](a1, *(void *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1896007A8]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1896007B0]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1896007B8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1896007C0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1896007C8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1896007D0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1896007D8]();
}

uint64_t sandbox_get_container_expected()
{
  return MEMORY[0x1896007E0]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1895FF268](__name, __value, *(void *)&__overwrite);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FF350](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FF358](__s1, __n);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FF3E0](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x189600080](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x189600090](*(void *)&target_tport, *(void *)&pid, tn);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FF440](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FF458](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FF460](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1895FEBB8]();
}

uint64_t voucher_get_current_persona_originator_info()
{
  return MEMORY[0x1895FEBC0]();
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return MEMORY[0x1895FEBC8]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x189600208](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1896009F8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600A00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x189600A08](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x189600A18](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x189600A20](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x189600A28](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x189600A40](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x189600A48]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x189600A58]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x189600A68]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x189600A80](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x189600A88](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x189600AB0](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x189600AD8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x189600AE8](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x189600AF0]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x189600AF8]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x189600B00](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x189600B18](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600B58](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B60](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x189600B68](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x189600B70](xdict, key, length);
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

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x189600B98](xdict, key);
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

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x189600C10](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x189600C18](value);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x189600C28]();
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x189600C38]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x189600C50]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x189600C68](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x189600C78](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x189600C88](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x189600C98](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x189600CA0](xuint);
}