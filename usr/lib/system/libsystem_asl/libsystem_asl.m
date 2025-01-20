uint64_t asl_client_open(const char *a1, char *a2, unsigned int a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char ***v9;
  char *v10;
  int *v11;
  char *v12;
  int *v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  v6 = calloc(1uLL, 0x68uLL);
  v7 = (uint64_t)v6;
  if (!v6)
  {
    v13 = __error();
LABEL_12:
    *v13 = 12;
    return v7;
  }

  *v6 = 0x100000005LL;
  v8 = asl_msg_new(0);
  *(void *)(v7 + 32) = v8;
  if (!v8)
  {
    asl_release((asl_object_t)v7);
    v13 = __error();
    v7 = 0LL;
    goto LABEL_12;
  }

  *(_DWORD *)(v7 + 12) = a3;
  *(_DWORD *)(v7 + 16) = getpid();
  *(_DWORD *)(v7 + 20) = getuid();
  *(_DWORD *)(v7 + 24) = getgid();
  if (a1)
  {
LABEL_7:
    asl_msg_set_key_val(*(int **)(v7 + 32), "Sender", a1);
    goto LABEL_8;
  }

  v9 = _NSGetArgv();
  a1 = **v9;
  if (a1)
  {
    v10 = strrchr(**v9, 47);
    if (v10) {
      a1 = v10 + 1;
    }
    goto LABEL_7;
  }

LABEL_8:
  if (a2)
  {
    v11 = *(int **)(v7 + 32);
    v12 = a2;
  }

  else
  {
    v14 = *(int **)(v7 + 32);
    if (*(_DWORD *)(v7 + 20)) {
      v15 = 8;
    }
    else {
      v15 = 24;
    }
    v12 = asl_syslog_faciliy_num_to_name(v15);
    v11 = v14;
  }

  asl_msg_set_key_val(v11, "Facility", v12);
  if ((a3 & 0x10000000) != 0) {
    v16 = 65599;
  }
  else {
    v16 = 196671;
  }
  *(_DWORD *)(v7 + 40) = ((a3 >> 11) & 0x40000 | v16) ^ 0x40000;
  if ((*(_BYTE *)(v7 + 12) & 1) != 0)
  {
    if (fcntl(2, 1) < 0)
    {
      *(_DWORD *)(v7 + 12) &= ~1u;
    }

    else
    {
      v17 = fileno((FILE *)*MEMORY[0x1895FEE10]);
      asl_client_add_output_file(v7, v17, "std", "lcl", 255, 1);
    }
  }

  return v7;
}

  if (matched) {
    return v8;
  }
  else {
    return -1LL;
  }
}

void asl_client_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_client_add_output_file(uint64_t a1, int a2, const char *a3, const char *a4, int a5, int a6)
{
  if (!a1) {
    return 9999LL;
  }
  uint64_t v12 = *(unsigned int *)(a1 + 52);
  if ((_DWORD)v12)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)(a1 + 56);
    while (*(_DWORD *)(v14 + v13) != a2)
    {
      v13 += 32LL;
      if (32 * v12 == v13)
      {
        v15 = *(void **)(a1 + 56);
        goto LABEL_9;
      }
    }

    free(*(void **)(v14 + v13 + 16));
    uint64_t v21 = *(void *)(a1 + 56) + v13;
    *(void *)(v21 + 16) = 0LL;
    if (a3) {
      *(void *)(v21 + 16) = strdup(a3);
    }
    free(*(void **)(v21 + 24));
    uint64_t v22 = *(void *)(a1 + 56) + v13;
    *(void *)(v22 + 24) = 0LL;
    if (a4) {
      *(void *)(v22 + 24) = strdup(a4);
    }
    uint64_t result = 0LL;
    *(_DWORD *)(v22 + 4) = a6;
    *(_DWORD *)(v22 + 8) = a5;
  }

  else
  {
    v15 = 0LL;
    *(void *)(a1 + 56) = 0LL;
LABEL_9:
    v17 = (char *)reallocf(v15, 32LL * (v12 + 1));
    *(void *)(a1 + 56) = v17;
    if (v17)
    {
      uint64_t v18 = *(unsigned int *)(a1 + 52);
      v19 = &v17[32 * v18];
      *(_DWORD *)v19 = a2;
      *((_DWORD *)v19 + 1) = a6;
      *((_DWORD *)v19 + 2) = a5;
      *((void *)v19 + 2) = 0LL;
      if (a3) {
        *((void *)v19 + 2) = strdup(a3);
      }
      *((void *)v19 + 3) = 0LL;
      v20 = (char **)(v19 + 24);
      if (a4) {
        *v20 = strdup(a4);
      }
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 52) = v18 + 1;
    }

    else
    {
      return 9999LL;
    }
  }

  return result;
}

uint64_t asl_client_open_from_file(int a1, const char *a2, char *a3)
{
  uint64_t v4 = asl_client_open(a2, a3, 0);
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 40) = 196863;
    if (asl_file_open_write_fd(a1, (void *)(v4 + 64)))
    {
      _asl_client_free_internal(v5);
      return 0LL;
    }

    else
    {
      *(void *)(v5 + 72) = 1LL;
    }
  }

  return v5;
}

void _asl_client_free_internal(uint64_t a1)
{
  if (a1)
  {
    v2 = *(__asl_object_s **)(a1 + 32);
    if (v2) {
      asl_msg_release(v2);
    }
    *(void *)(a1 + 32) = 0LL;
    v3 = *(__asl_object_s **)(a1 + 64);
    if (v3) {
      asl_file_close(v3);
    }
    *(void *)(a1 + 64) = 0LL;
    if (*(_DWORD *)(a1 + 52))
    {
      uint64_t v4 = 0LL;
      unint64_t v5 = 0LL;
      do
      {
        free(*(void **)(*(void *)(a1 + 56) + v4 + 16));
        free(*(void **)(*(void *)(a1 + 56) + v4 + 24));
        ++v5;
        v4 += 32LL;
      }

      while (v5 < *(unsigned int *)(a1 + 52));
    }

    free(*(void **)(a1 + 56));
    free((void *)a1);
  }
}

asl_object_t asl_client_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

uint64_t asl_client_send(__asl_object_s *a1, __asl_object_s *a2)
{
  return asl_client_internal_send(a1, a2);
}

uint64_t asl_client_match( uint64_t a1, char *a2, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  if (!asl_store_location())
  {
    *(void *)&size[1] = 0LL;
    v26 = 0LL;
    v15 = asl_msg_list_to_string(a2, &v22);
    free(v15);
    uint64_t v16 = 0LL;
    if (*(void *)&size[1])
    {
      uint64_t v16 = asl_store_match(*(uint64_t *)&size[1], (uint64_t)a2, &v26, a4, a5, a6, a7);
      v17 = *(__asl_object_s **)&size[1];
      *a3 = v26;
      asl_store_close(v17);
      return v16;
    }

    return 0LL;
  }

  *(void *)&size[1] = 0LL;
  mach_port_t service_port = asl_core_get_service_port();
  if (!service_port) {
    return 0LL;
  }
  mach_port_t v14 = service_port;
  v26 = 0LL;
  if (a2)
  {
    v26 = asl_msg_list_to_string(a2, size);
    if (!v26) {
      return 0LL;
    }
    goto LABEL_10;
  }

  asprintf(&v26, "0\n");
  size[0] = 3;
  if (!v26) {
    return 0LL;
  }
LABEL_10:
  uint64_t v18 = (unsigned int *)MEMORY[0x1895FFD48];
  memmove((void *)address, v26, size[0]);
  free(v26);
  uint64_t v22 = 0LL;
  int v20 = _asl_server_match(v14, address, size[0], a4, a5, a6, a7, &size[1], &v24, &v22, &v23);
  uint64_t v16 = 0LL;
  if (!v20)
  {
    *a3 = v22;
    uint64_t v16 = (uint64_t)asl_msg_list_from_string(*(const char **)&size[1]);
    MEMORY[0x186DF5A28](*v18, *(void *)&size[1], v24);
  }

  return v16;
}

uint64_t asl_client_search(uint64_t a1, __asl_object_s *a2)
{
  if (asl_store_location())
  {
    *(void *)&size[1] = 0LL;
    int v18 = 0;
    unsigned int v19 = 0;
    v17 = 0LL;
    mach_port_t service_port = asl_core_get_service_port();
    if (!service_port) {
      return 0LL;
    }
    mach_port_t v4 = service_port;
    size[0] = 0;
    unint64_t v5 = asl_msg_to_string(a2, size);
    uint64_t v21 = 0LL;
    if (v5)
    {
      v6 = v5;
      asprintf(&v21, "1\n%s\n", v5);
      size[0] += 3;
      free(v6);
    }

    else
    {
      asprintf(&v21, "0\n");
      size[0] = 3;
    }

    if (v21
      && (v9 = (unsigned int *)MEMORY[0x1895FFD48],
          !vm_allocate(*MEMORY[0x1895FFD48], &address, size[0], 1358954497)))
    {
      memmove((void *)address, v21, size[0]);
      free(v21);
      uint64_t v10 = 0LL;
      if (!_asl_server_query_2(v4, address, size[0], 0LL, 0, 0, &size[1], &v19, &v17, &v18))
      {
        uint64_t v10 = (uint64_t)asl_msg_list_from_string(*(const char **)&size[1]);
        MEMORY[0x186DF5A28](*v9, *(void *)&size[1], v19);
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
    *(void *)&size[1] = 0LL;
    v17 = 0LL;
    unint64_t v7 = 0LL;
    if (!asl_msg_lookup(a2, "ASLMessageID", (int **)&v17, &address) && v17)
    {
      char v8 = address;
      if ((address & 2) != 0)
      {
        uint64_t v11 = atoll(v17);
        if ((v8 & 1) != 0) {
          unint64_t v7 = v11;
        }
        else {
          unint64_t v7 = v11 + 1;
        }
      }

      else
      {
        unint64_t v7 = 0LL;
      }
    }

    uint64_t v10 = 0LL;
    if (!asl_store_open_read(0LL, &size[1]))
    {
      uint64_t v12 = *(void *)&size[1];
      if (*(void *)&size[1])
      {
        if (a2)
        {
          asl_msg_list_new();
          mach_port_t v14 = (__asl_object_s *)v13;
          asl_msg_list_append(v13, a2);
          uint64_t v12 = *(void *)&size[1];
        }

        else
        {
          mach_port_t v14 = 0LL;
        }

        uint64_t v10 = asl_store_match(v12, (uint64_t)v14, &v21, v7, 0, 0, 1);
        asl_store_close(*(__asl_object_s **)&size[1]);
        asl_msg_list_release(v14);
      }
    }
  }

  return v10;
}

uint64_t asl_client_set_filter(uint64_t a1, __int16 a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = *(unsigned __int16 *)(a1 + 40);
  *(_WORD *)(a1 + 40) = a2;
  return result;
}

uint64_t asl_client_set_control(uint64_t a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = *(unsigned int *)(a1 + 40);
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t asl_client_get_control(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 40);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t asl_client_set_output_file_filter(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 52);
  if (!(_DWORD)v3) {
    return 0LL;
  }
  for (i = (_DWORD *)(*(void *)(a1 + 56) + 8LL); *(i - 2) != a2; i += 8)
  {
    if (!--v3) {
      return 0LL;
    }
  }

  uint64_t result = *i;
  _DWORD *i = a3;
  return result;
}

uint64_t asl_client_remove_output_file(uint64_t a1, int a2)
{
  if (!a1) {
    return 1LL;
  }
  int v3 = *(_DWORD *)(a1 + 52);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = *(void *)(a1 + 56);
  while (*(_DWORD *)(v6 + v5) != a2)
  {
    v5 += 32LL;
    if (v3 == (_DWORD)++v4) {
      return 0LL;
    }
  }

  free(*(void **)(v6 + 32LL * (int)v4 + 16));
  free(*(void **)(*(void *)(a1 + 56) + 32LL * (int)v4 + 24));
  unint64_t v8 = v4 + 1;
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  if ((int)v4 + 1 < v9)
  {
    uint64_t v10 = v5 + 32;
    uint64_t v11 = 32LL * (int)v4;
    do
    {
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = (_OWORD *)(v12 + v11);
      mach_port_t v14 = (_OWORD *)(v12 + v10);
      __int128 v15 = v14[1];
      *uint64_t v13 = *v14;
      v13[1] = v15;
      ++v8;
      unint64_t v9 = *(unsigned int *)(a1 + 52);
      v11 += 32LL;
      v10 += 32LL;
    }

    while (v8 < v9);
  }

  uint64_t v16 = *(void **)(a1 + 56);
  *(_DWORD *)(a1 + 52) = v9 - 1;
  if ((_DWORD)v9 == 1)
  {
    free(v16);
    uint64_t result = 0LL;
    *(void *)(a1 + 56) = 0LL;
  }

  else
  {
    v17 = reallocf(v16, 32LL * (v9 - 1));
    *(void *)(a1 + 56) = v17;
    if (v17) {
      return 0LL;
    }
    *(_DWORD *)(a1 + 52) = 0;
    return 9999LL;
  }

  return result;
}

uint64_t asl_client_kvdict(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

void *asl_client_jump_table()
{
  return &asl_client_jump_table_jump;
}

uint64_t _jump_append(__asl_object_s *a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if ((_DWORD)result == 2)
  {
    asl_msg_list_reset_iteration((uint64_t)obj, 0LL);
    do
    {
      uint64_t result = asl_msg_list_next((uint64_t)obj);
      if (!result) {
        break;
      }
      uint64_t result = asl_client_internal_send(a1, (__asl_object_s *)result);
    }

    while (!(_DWORD)result);
  }

  else if (result <= 1)
  {
    return asl_client_internal_send(a1, obj);
  }

  return result;
}

uint64_t _jump_search(int a1, asl_object_t obj)
{
  uint64_t type = asl_get_type(obj);
  else {
    return asl_client_search(type, obj);
  }
}

uint64_t _jump_match( int a1, asl_object_t obj, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t type = asl_get_type(obj);
  if (!obj || (_DWORD)type == 2) {
    return asl_client_match(type, (char *)obj, a3, a4, a5, a6, a7);
  }
  else {
    return 0LL;
  }
}

void _asl_fork_child()
{
  _asl_global = xmmword_18013A9E0;
  qword_18C43C918 = 0LL;
  dword_18C43C920 = 0;
  qword_18C43C900 = 0LL;
  qword_18C43C908 = 0LL;
  dword_18C43C910 = 0;
  pthread_mutex_init(&stru_18C43C930, 0LL);
  _asl_redirect_fork_child();
}

char *asl_remote_notify_name()
{
  v1 = 0LL;
  if (geteuid()) {
    asprintf(&v1, "user.uid.%d.syslog.%d");
  }
  else {
    asprintf(&v1, "%s.%d");
  }
  return v1;
}

uint64_t asl_core_get_service_port()
{
  if (qword_18C43C918 != -1) {
    dispatch_once(&qword_18C43C918, &__block_literal_global_27);
  }
  return dword_18C43C920;
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  char v3 = opts;
  uint64_t v4 = asl_client_open(ident, (char *)facility, opts);
  uint64_t v5 = (__asl_object_s *)v4;
  if ((v3 & 4) == 0 && v4) {
    _asl_notify_open(1);
  }
  return v5;
}

void _asl_notify_open(int a1)
{
  if (a1)
  {
    pthread_mutex_lock(&stru_18C43C930);
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1)
    {
LABEL_15:
      pthread_mutex_unlock(&stru_18C43C930);
      return;
    }
  }

  else
  {
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1) {
      return;
    }
  }

  v2 = asl_remote_notify_name();
  if (v2)
  {
    char v3 = v2;
    int v4 = notify_register_plain();
    free(v3);
    if (v4) {
      DWORD2(_asl_global) = -1;
    }
  }

  if (a1) {
    goto LABEL_15;
  }
}

void *_asl_open_default()
{
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  return off_18C43C980;
}

void ___asl_open_default_block_invoke()
{
  uint64_t v0 = asl_client_open(0LL, 0LL, 4u);
  off_18C43C980 = (_UNKNOWN *)v0;
  if (v0) {
    *(_DWORD *)(v0 + 12) = 0;
  }
  _asl_notify_open(0);
}

int asl_add_output_file( asl_object_t client, int fd, const char *mfmt, const char *tfmt, int filter, int text_encoding)
{
  if (client)
  {
    if (asl_get_type(client) == 5)
    {
      int v12 = asl_client_add_output_file((uint64_t)client, fd, mfmt, tfmt, filter, text_encoding);
      goto LABEL_8;
    }

    return -1;
  }

  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  uint64_t v13 = off_18C43C980;
  if (!off_18C43C980) {
    return -1;
  }
  pthread_mutex_lock(&stru_18C43C930);
  int v12 = asl_client_add_output_file((uint64_t)v13, fd, mfmt, tfmt, filter, text_encoding);
  pthread_mutex_unlock(&stru_18C43C930);
LABEL_8:
  if (v12) {
    return -1;
  }
  else {
    return 0;
  }
}

int asl_set_output_file_filter(asl_object_t client, int fd, int filter)
{
  if (client)
  {
    if (asl_get_type(client) == 5) {
      return asl_client_set_output_file_filter((uint64_t)client, fd, filter);
    }
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    unint64_t v7 = off_18C43C980;
    if (off_18C43C980)
    {
      pthread_mutex_lock(&stru_18C43C930);
      int v8 = asl_client_set_output_file_filter((uint64_t)v7, fd, filter);
      pthread_mutex_unlock(&stru_18C43C930);
      return v8;
    }
  }

  return -1;
}

uint64_t asl_add_output(__asl_object_s *a1, int a2, const char *a3, const char *a4, int text_encoding)
{
  return asl_add_output_file(a1, a2, a3, a4, 255, text_encoding);
}

int asl_add_log_file(asl_object_t client, int descriptor)
{
  return asl_add_output_file(client, descriptor, "std", "lcl", 255, 1);
}

uint64_t asl_remove_output_file(__asl_object_s *a1, int a2)
{
  if (a1)
  {
    if (asl_get_type(a1) == 5)
    {
      int v4 = asl_client_remove_output_file((uint64_t)a1, a2);
      goto LABEL_8;
    }

    return 0xFFFFFFFFLL;
  }

  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  uint64_t v5 = off_18C43C980;
  if (!off_18C43C980) {
    return 0xFFFFFFFFLL;
  }
  pthread_mutex_lock(&stru_18C43C930);
  int v4 = asl_client_remove_output_file((uint64_t)v5, a2);
  pthread_mutex_unlock(&stru_18C43C930);
LABEL_8:
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

int asl_set_filter(asl_object_t client, int f)
{
  __int16 v2 = f;
  if (client)
  {
    if (asl_get_type(client) == 5) {
      return asl_client_set_filter((uint64_t)client, v2);
    }
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    uint64_t v5 = off_18C43C980;
    if (off_18C43C980)
    {
      pthread_mutex_lock(&stru_18C43C930);
      int v6 = asl_client_set_filter((uint64_t)v5, v2);
      pthread_mutex_unlock(&stru_18C43C930);
      return v6;
    }
  }

  return -1;
}

uint32_t _asl_evaluate_send(asl_object_t client, asl_object_t msg, int level)
{
  if (level < 0) {
    unsigned int v5 = 7;
  }
  else {
    unsigned int v5 = level;
  }
  __s1 = 0LL;
  else {
    BOOL v6 = __s1 == 0LL;
  }
  if (!v6) {
    unsigned int v5 = atoi(__s1);
  }
  if (v5 >= 7) {
    unsigned int v5 = 7;
  }
  if (client)
  {
    if (asl_get_type(client) != 5) {
      return v5 | 0x30000;
    }
    if (*((void *)client + 8)) {
      return v5 | 0x100000;
    }
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    client = (asl_object_t)off_18C43C980;
    if (!off_18C43C980) {
      return v5 | 0x50000;
    }
  }

  int control = asl_client_get_control((uint64_t)client);
  unsigned int v9 = *((_DWORD *)client + 10);
  unsigned int v10 = control & 0xFFFF0000 | v5 | (*((_DWORD *)client + 10) << 13) & 0x200000;
  if ((*((_BYTE *)client + 12) & 4) == 0)
  {
    pthread_mutex_lock(&stru_18C43C930);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      int check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            uint64_t state64 = 0LL;
            if (!notify_get_state(SHIDWORD(_asl_global), &state64)) {
              qword_18C43C8F8 = state64;
            }
          }

          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            uint64_t state64 = 0LL;
            if (!notify_get_state(SDWORD2(_asl_global), &state64)) {
              qword_18C43C8F0 = state64;
            }
          }
        }
      }
    }

    if ((qword_18C43C8F8 & 0x10000) != 0)
    {
      unsigned int v10 = v10 & 0xFFD90007 | qword_18C43C8F8 & 0x60000 | 0x200000;
      int v11 = qword_18C43C8F0;
      if ((_BYTE)qword_18C43C8F8) {
        unsigned int v9 = qword_18C43C8F0;
      }
    }

    else
    {
      int v11 = qword_18C43C8F0;
    }

    if ((v11 & 0x10000) != 0)
    {
      unsigned int v10 = v10 & 0xFFF1FFFF | v11 & 0xE0000 | 0x200000;
      if ((_BYTE)v11) {
        unsigned int v9 = v11;
      }
    }

    pthread_mutex_unlock(&stru_18C43C930);
  }

  unsigned int v12 = v10 & 0xFFFDFFFF;
  if (((v9 >> v5) & 1) != 0) {
    unsigned int v12 = v10;
  }
  if (!v9) {
    unsigned int v12 = v10;
  }
  if (*((_DWORD *)client + 13)) {
    int v13 = v12 | 0x80000;
  }
  else {
    int v13 = v12;
  }
  __s1 = 0LL;
  int v14 = asl_msg_lookup(msg, "com.apple.message.domain", (int **)&__s1, 0LL);
  if (__s1) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    unsigned int v16 = v13 & 0xFF7BFFFF | 0x800000;
  }
  else {
    unsigned int v16 = v13;
  }
  __s1 = 0LL;
  int v17 = asl_msg_lookup(msg, "com.apple.iokit.domain", (int **)&__s1, 0LL);
  int v18 = __s1;
  __s1 = 0LL;
  int v19 = asl_msg_lookup(msg, "ASLOption", (int **)&__s1, 0LL);
  int v20 = __s1;
  __s1 = 0LL;
  else {
    BOOL v21 = __s1 == 0LL;
  }
  int v22 = !v21;
  if (v19) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v20 == 0LL;
  }
  if (!v23) {
    int v22 = 1;
  }
  if (v17) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v18 == 0LL;
  }
  if (!v24) {
    int v22 = 1;
  }
  if (v22) {
    uint32_t v7 = v16 & 0xFFFBFFFF;
  }
  else {
    uint32_t v7 = v16;
  }
  __s1 = 0LL;
  if (!asl_msg_lookup(msg, "Facility", (int **)&__s1, 0LL) && (v25 = __s1) != 0LL
    || !asl_msg_lookup(*((_DWORD **)client + 4), "Facility", (int **)&__s1, 0LL) && (v25 = __s1) != 0LL)
  {
    if (!strcmp(v25, "com.apple.system.lastlog") || !strcmp(v25, "com.apple.system.utmpx")) {
      uint32_t v7 = v16 & 0xFFFBFFFF;
    }
    v26 = asl_syslog_faciliy_num_to_name(112);
    if (!strcmp(v25, v26)) {
      return v16 & 0xFFFBFFFF;
    }
  }

  return v7;
}

uint64_t _asl_lib_vlog_text(__asl_object_s *a1, uint64_t a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  unsigned int v10 = __error();
  if (!a4) {
    return 1LL;
  }
  int v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  int v14 = 0;
  int v15 = *v10;
  while (a4[v11] == 37)
  {
    int v16 = v11 + 1;
    if (!a4[v11 + 1]) {
      goto LABEL_9;
    }
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      int v17 = strlen(__strerrbuf);
      int v14 = 1;
      int v11 = v16;
      unsigned int v13 = v17;
    }

    else
    {
      int v17 = 2;
      ++v11;
    }

LABEL_10:
    v12 += v17;
    ++v11;
  }

  if (a4[v11])
  {
LABEL_9:
    int v17 = 1;
    goto LABEL_10;
  }

  if (v14)
  {
    int v18 = (char *)malloc((v12 + 1));
    if (v18)
    {
      int v19 = v18;
      v29 = a3;
      int v20 = 0;
      int v21 = 0;
      while (1)
      {
        int v22 = a4[v20];
        if (v22 != 37) {
          break;
        }
        int v23 = v20 + 1;
        int v24 = a4[v20 + 1];
        if (!a4[v20 + 1]) {
          goto LABEL_25;
        }
        if (v24 != 109 || v13 == 0)
        {
          int v26 = v21 + 1;
          v19[v21] = 37;
          v21 += 2;
          v19[v26] = v24;
        }

        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }

    v12 += v17;
    ++v11;
  }

  if (a4[v11])
  {
LABEL_9:
    int v17 = 1;
    goto LABEL_10;
  }

  if (v14)
  {
    int v18 = (char *)malloc((v12 + 1));
    if (v18)
    {
      int v19 = v18;
      v29 = a3;
      int v20 = 0;
      int v21 = 0;
      while (1)
      {
        int v22 = a4[v20];
        if (v22 != 37) {
          break;
        }
        int v23 = v20 + 1;
        int v24 = a4[v20 + 1];
        if (!a4[v20 + 1]) {
          goto LABEL_25;
        }
        if (v24 != 109 || v13 == 0)
        {
          int v26 = v21 + 1;
          v19[v21] = 37;
          v21 += 2;
          v19[v26] = v24;
        }

        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }

LABEL_26:
        int v20 = v23 + 1;
      }

      if (!a4[v20])
      {
        v19[v21] = 0;
        v30 = 0LL;
        vasprintf(&v30, v19, a5);
        free(v19);
        a3 = v29;
        goto LABEL_30;
      }

      v19[v21++] = v22;
LABEL_25:
      int v23 = v20;
      goto LABEL_26;
    }

    return 9LL;
  }

  else
  {
    v30 = 0LL;
    vasprintf(&v30, a4, a5);
LABEL_30:
    if (!v30) {
      return 9LL;
    }
    uint64_t v27 = _asl_send_message_text(0LL, 0LL, a1, a2, a3, v30, 1);
    free(v30);
  }

  return v27;
}

        int v20 = v23 + 1;
      }

      if (!a4[v20])
      {
        v19[v21] = 0;
        v30 = 0LL;
        vasprintf(&v30, v19, a5);
        free(v19);
        a3 = v29;
        goto LABEL_30;
      }

      v19[v21++] = v22;
LABEL_25:
      int v23 = v20;
      goto LABEL_26;
    }

    return 9LL;
  }

  else
  {
    v30 = 0LL;
    vasprintf(&v30, a4, a5);
LABEL_30:
    if (!v30) {
      return 9LL;
    }
    uint64_t v27 = _asl_send_message(a1, a2, a3, v30);
    free(v30);
  }

  return v27;
}

      int v14 = asl_msg_fetch(v9, v14, (char **)__str, (int **)&__s, 0LL);
      if (v14 == -1) {
        goto LABEL_27;
      }
    }
  }

  if (strcmp(__s1, "msg"))
  {
    if (!strncmp(__s1, "raw", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        int v11 = __s1[4];
        unsigned int v10 = __s1 + 4;
        if (v11)
        {
          a3 = __str;
          snprintf(__str, 0x10uLL, "sec.%s", v10);
        }

        else
        {
          a3 = 0LL;
        }
      }

      goto LABEL_171;
    }

    if (!strncmp(__s1, "std", 3uLL) && __s1[3] == 46)
    {
      if (a3)
      {
LABEL_31:
        int v23 = 1;
        goto LABEL_36;
      }

      v73 = __s1[4];
      v72 = __s1 + 4;
      int v23 = 1;
      if (v73) {
        goto LABEL_167;
      }
      goto LABEL_169;
    }

    if (!strncmp(__s1, "bsd", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        int v23 = 0;
        v74 = __s1[4];
        v72 = __s1 + 4;
        if (v74)
        {
LABEL_167:
          a3 = __str;
          snprintf(__str, 0x10uLL, "lcl.%s", v72);
          goto LABEL_36;
        }

uint64_t _asl_send_message_text( __asl_object_s *a1, char *a2, asl_object_t obj, uint64_t a4, __asl_object_s *a5, const char *a6, int a7)
{
  asl_object_t v12 = a1;
  if (!a1)
  {
    if (obj)
    {
      if (asl_get_type(obj) == 5) {
        asl_object_t v12 = obj;
      }
      else {
        asl_object_t v12 = 0LL;
      }
    }

    else
    {
      if (_asl_open_default_once != -1) {
        dispatch_once(&_asl_open_default_once, &__block_literal_global);
      }
      asl_object_t v12 = (asl_object_t)off_18C43C980;
      if (!off_18C43C980) {
        return 9999LL;
      }
    }
  }

  else {
    unsigned int v14 = a4;
  }
  if (!a2)
  {
    v34.tv_sec = 0LL;
    *(void *)&v34.tv_usec = 0LL;
    if (gettimeofday(&v34, 0LL))
    {
      v34.tv_sec = time(0LL);
      v34.tv_usec = 0;
    }

    v33 = 0LL;
    uint64_t v32 = 0LL;
    a4 = asl_msg_lookup(a5, "Facility", &v32, 0LL);
    if ((_DWORD)a4)
    {
      int v16 = 0LL;
      uint64_t v32 = 0LL;
    }

    else
    {
      int v16 = v32;
    }

    int v17 = asl_base_msg((uint64_t)v12, v14, (uint64_t)&v34, v33, v16, a6);
    if (v17)
    {
      int v15 = asl_msg_merge(v17, a5);
      a2 = (char *)v15;
      goto LABEL_23;
    }

    return 9999LL;
  }

  int v15 = 0LL;
LABEL_23:
  unint64_t v18 = *((unsigned int *)v12 + 13);
  if ((_DWORD)v18)
  {
    uint64_t v19 = 0LL;
    unint64_t v20 = 0LL;
    int v21 = 1 << v14;
    do
    {
      uint64_t v22 = *((void *)v12 + 7);
      int v23 = *(_DWORD *)(v22 + v19);
      if (a7)
      {
      }

      else if ((v23 & 0x80000000) == 0)
      {
LABEL_29:
        uint64_t v24 = v22 + v19;
        int v25 = *(_DWORD *)(v24 + 8);
        if (v25) {
          BOOL v26 = (v25 & v21) == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          LODWORD(v34.tv_sec) = 0;
          uint64_t v27 = asl_format_message(a2, *(char **)(v24 + 16), *(char **)(v24 + 24), *(_DWORD *)(v24 + 4), &v34);
          if (v27)
          {
            v28 = v27;
            unsigned int v29 = write(*(_DWORD *)(*((void *)v12 + 7) + v19), v27, (LODWORD(v34.tv_sec) - 1));
            if ((v29 & 0x80000000) != 0)
            {
              uint64_t v30 = *((void *)v12 + 7);
              if (*(_DWORD *)(v30 + v19) == 2) {
                a4 = 0LL;
              }
              else {
                a4 = v29;
              }
              *(_DWORD *)(v30 + v19) = -1;
            }

            else
            {
              a4 = 0LL;
            }

            free(v28);
          }

          unint64_t v18 = *((unsigned int *)v12 + 13);
        }
      }

      ++v20;
      v19 += 32LL;
    }

    while (v20 < v18);
  }

  if (v15) {
    asl_msg_release((asl_object_t)v15);
  }
  return a4;
}

uint64_t _asl_lib_vlog(__asl_object_s *a1, uint64_t a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  unsigned int v10 = __error();
  if (!a4) {
    return 1LL;
  }
  int v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  int v14 = 0;
  int v15 = *v10;
  while (a4[v11] == 37)
  {
    int v16 = v11 + 1;
    if (!a4[v11 + 1]) {
      goto LABEL_9;
    }
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      int v17 = strlen(__strerrbuf);
      int v14 = 1;
      int v11 = v16;
      unsigned int v13 = v17;
    }

    else
    {
      int v17 = 2;
      ++v11;
    }

uint64_t _asl_send_message(asl_object_t obj, uint64_t a2, __asl_object_s *a3, const char *a4)
{
  uint64_t v55 = *MEMORY[0x1895FEE08];
  v51.__darwin_time_t tv_sec = 0LL;
  *(void *)&v51.tv_usec = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2000000000LL;
  int v50 = 0;
  if ((a2 & 0x1A0000) == 0)
  {
    uint64_t v12 = 0LL;
    goto LABEL_40;
  }

  uint64_t v6 = a2;
  if (obj)
  {
    uint32_t type = asl_get_type(obj);
    else {
      unsigned int v9 = v6;
    }
    if (type != 5)
    {
      char v14 = 0;
      asl_object_t v11 = 0LL;
      int v13 = 0;
      goto LABEL_21;
    }

    int v10 = 0;
    asl_object_t v11 = obj;
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    asl_object_t v11 = (asl_object_t)off_18C43C980;
    if (!off_18C43C980) {
      goto LABEL_37;
    }
    else {
      unsigned int v9 = v6;
    }
    int v10 = 1;
  }

  if (*((void *)v11 + 8)) {
    int v13 = 1;
  }
  else {
    int v13 = v10;
  }
  char v14 = 1;
LABEL_21:
  if (gettimeofday(&v51, 0LL))
  {
    v51.__darwin_time_t tv_sec = time(0LL);
    v51.tv_usec = 0;
  }

  v53 = 0LL;
  v52 = 0LL;
  if (asl_msg_lookup(a3, "Facility", &v52, 0LL))
  {
    int v15 = 0LL;
    v52 = 0LL;
  }

  else
  {
    int v15 = v52;
  }

  int v16 = asl_base_msg((uint64_t)v11, v9, (uint64_t)&v51, v53, v15, a4);
  if (!v16)
  {
LABEL_37:
    uint64_t v12 = 9999LL;
    goto LABEL_40;
  }

  int v17 = v16;
  if ((v6 & 0x200000) != 0) {
    _asl_set_option(v16);
  }
  if (v13) {
    pthread_mutex_lock(&stru_18C43C930);
  }
  unint64_t v18 = asl_msg_merge(v17, a3);
  if ((v14 & 1) != 0)
  {
    uint64_t v19 = *((void *)v11 + 8);
    if (v19)
    {
      if (v18)
      {
        uint64_t v12 = asl_file_save(v19, v18, (uint64_t *)v11 + 9);
        ++*((void *)v11 + 9);
      }

      else
      {
        uint64_t v12 = 9999LL;
      }

      goto LABEL_100;
    }

    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___asl_send_message_block_invoke;
    block[3] = &unk_189625900;
    block[4] = &v47;
    if (_asl_send_message_noquota_once != -1) {
      dispatch_once(&_asl_send_message_noquota_once, block);
    }
    if (*((_DWORD *)v48 + 6))
    {
      int v21 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v51, v53, v52, "*** MESSAGE QUOTA DISABLED FOR THIS PROCESS ***");
      asl_msg_set_key_val(v21, "ASLOption", "store");
      if ((v6 & 0x200000) != 0)
      {
LABEL_71:
        if (qword_18C43C918 != -1) {
          dispatch_once(&qword_18C43C918, &__block_literal_global_27);
        }
        uint64_t v12 = 0LL;
        if ((v6 & 0x20000) == 0 || !dword_18C43C920) {
          goto LABEL_97;
        }
        if ((v6 & 0x400000) != 0)
        {
          asl_msg_set_key_val(v18, "Level", "Critical");
          asl_msg_set_key_val( v18,  "Message",  "*** LOG MESSAGE QUOTA EXCEEDED - SOME MESSAGES FROM THIS PROCESS HAVE BEEN DISCARDED ***");
        }

        if (!v21)
        {
LABEL_82:
          v38 = (char *)asl_msg_to_string_raw(-1073741822, v18, "raw");
          uint64_t v39 = asl_string_length((uint64_t)v38);
          uint64_t v12 = v39;
          if (v39 > 0x1F4000)
          {
            snprintf( __str,  0x100uLL,  "*** ASL MESSAGE SIZE (%u bytes) EXCEEDED MAXIMIMUM SIZE (%u bytes) ***",  v39,  2048000);
            v40 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v51, v53, v52, __str);
            asl_string_release((uint64_t)v38);
            if (v40)
            {
              if ((v6 & 0x200000) != 0) {
                _asl_set_option(v40);
              }
              v38 = (char *)asl_msg_to_string_raw(-1073741822, v40, "raw");
              uint64_t v41 = asl_string_length((uint64_t)v38);
              asl_msg_release((asl_object_t)v40);
            }

            else
            {
              uint64_t v41 = 0LL;
            }

            uint64_t v12 = v41;
          }

          uint64_t v42 = asl_string_allocated_size((uint64_t)v38);
          v43 = asl_string_release_return_bytes(v38);
          if ((_DWORD)v12)
          {
            if (!_asl_server_message(dword_18C43C920, (uint64_t)v43, v12))
            {
              uint64_t v12 = 0LL;
              goto LABEL_97;
            }

            uint64_t v44 = 0xFFFFFFFFLL;
          }

          else
          {
            uint64_t v44 = 0LL;
            if (!v42)
            {
LABEL_97:
              if (v18 && *((_DWORD *)v11 + 13)) {
                _asl_send_message_text(v11, (char *)v18, obj, v6, a3, a4, 0);
              }
LABEL_100:
              asl_msg_release((asl_object_t)v18);
              if (!v13) {
                goto LABEL_40;
              }
              goto LABEL_39;
            }
          }

          uint64_t v12 = v44;
          MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], v43, v42);
          goto LABEL_97;
        }

        v45 = (__asl_object_s *)v21;
        timeval v34 = (char *)asl_msg_to_string_raw(-1073741822, v21, "raw");
        int v35 = asl_string_length((uint64_t)v34);
        uint64_t v36 = asl_string_allocated_size((uint64_t)v34);
        v37 = asl_string_release_return_bytes(v34);
        if (v35)
        {
          if (!_asl_server_message(dword_18C43C920, (uint64_t)v37, v35))
          {
LABEL_81:
            asl_msg_release(v45);
            goto LABEL_82;
          }
        }

        else if (!v36)
        {
          goto LABEL_81;
        }

        MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], v37, v36);
        goto LABEL_81;
      }
    }

    else
    {
      int v21 = 0LL;
      if ((v6 & 0x200000) != 0) {
        goto LABEL_71;
      }
    }

    int v22 = dword_18C43C910;
    if (dword_18C43C910 == -1) {
      goto LABEL_71;
    }
    uint64_t v24 = qword_18C43C900;
    unint64_t v23 = qword_18C43C908;
    __darwin_time_t tv_sec = v51.tv_sec;
    __darwin_time_t v26 = v51.tv_sec - qword_18C43C900;
    if (v51.tv_sec <= qword_18C43C900)
    {
      int v29 = dword_18C43C910;
    }

    else
    {
      int v27 = 10 * v26;
      if (v26 >= 3600) {
        int v27 = 36000;
      }
      unsigned int v28 = v27 + dword_18C43C910;
      if (v28 >= 0x8CA0) {
        int v29 = 36000;
      }
      else {
        int v29 = v28;
      }
      while (1)
      {
        unint64_t v30 = __ldaxr((unint64_t *)&qword_18C43C900);
        if (v30 != v24) {
          break;
        }
      }

      __clrex();
    }

LABEL_60:
    if (v29)
    {
      while (1)
      {
        unsigned int v31 = __ldaxr((unsigned int *)&dword_18C43C910);
        if (v31 != v22) {
          break;
        }
      }
    }

    else
    {
      __darwin_time_t v32 = v51.tv_sec;
      if ((uint64_t)(v51.tv_sec - v23) < 61)
      {
        uint64_t v6 = v6 & 0xFFFDFFFF;
        goto LABEL_71;
      }

      uint64_t v6 = v6 | 0x400000;
      while (1)
      {
        unint64_t v33 = __ldaxr(&qword_18C43C908);
        if (v33 != v23) {
          break;
        }
        if (!__stlxr(v32, &qword_18C43C908)) {
          goto LABEL_71;
        }
      }
    }

    __clrex();
    goto LABEL_71;
  }

  asl_append(obj, (asl_object_t)v18);
  asl_msg_release((asl_object_t)v18);
  uint64_t v12 = 0LL;
  if (v13) {
LABEL_39:
  }
    pthread_mutex_unlock(&stru_18C43C930);
LABEL_40:
  _Block_object_dispose(&v47, 8);
  return v12;
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  uint64_t v9 = _asl_evaluate_send(obj, msg, level);
  if ((v9 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v9 & 0x80000) != 0)
    {
      int v10 = _asl_lib_vlog_text(obj, v9, msg, format, ap);
      goto LABEL_8;
    }
  }

  else if ((v9 & 0x1A0000) != 0)
  {
    int v10 = _asl_lib_vlog(obj, v9, msg, format, ap);
    goto LABEL_8;
  }

  int v10 = 0;
LABEL_8:
  if (v10) {
    return -1;
  }
  else {
    return 0;
  }
}

int _asl_lib_log(asl_object_t client, uint32_t eval, asl_object_t msg, const char *format, ...)
{
  if ((eval & 0x1A0000) != 0) {
    return _asl_lib_vlog(client, *(uint64_t *)&eval, msg, format, va);
  }
  else {
    return 0;
  }
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  uint64_t v7 = _asl_evaluate_send(client, msg, level);
  if ((v7 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v7 & 0x80000) != 0)
    {
      int v8 = _asl_lib_vlog_text(client, v7, msg, format, va);
      goto LABEL_8;
    }
  }

  else if ((v7 & 0x1A0000) != 0)
  {
    int v8 = _asl_lib_vlog(client, v7, msg, format, va);
    goto LABEL_8;
  }

  int v8 = 0;
LABEL_8:
  if (v8) {
    return -1;
  }
  else {
    return 0;
  }
}

int asl_log_message(int level, const char *format, ...)
{
  uint64_t v3 = _asl_evaluate_send(0LL, 0LL, level);
  if ((v3 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v3 & 0x80000) != 0)
    {
      int v4 = _asl_lib_vlog_text(0LL, v3, 0LL, format, va);
      goto LABEL_8;
    }
  }

  else if ((v3 & 0x1A0000) != 0)
  {
    int v4 = _asl_lib_vlog(0LL, v3, 0LL, format, va);
    goto LABEL_8;
  }

  int v4 = 0;
LABEL_8:
  if (v4) {
    return -1;
  }
  else {
    return 0;
  }
}

uint64_t asl_get_filter(asl_object_t obj, _DWORD *a2, _DWORD *a3, _DWORD *a4, int *a5)
{
  if (obj && asl_get_type(obj) != 5) {
    return 0xFFFFFFFFLL;
  }
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  if (obj) {
    asl_object_t v10 = obj;
  }
  else {
    asl_object_t v10 = (asl_object_t)off_18C43C980;
  }
  if (v10)
  {
    int v11 = *((unsigned __int8 *)v10 + 40);
    if (!off_18C43C980) {
      goto LABEL_28;
    }
  }

  else
  {
    int v11 = 0;
    if (!off_18C43C980) {
      goto LABEL_28;
    }
  }

  if ((*((_BYTE *)off_18C43C980 + 12) & 4) == 0)
  {
    pthread_mutex_lock(&stru_18C43C930);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      int check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            uint64_t v16 = 0LL;
            if (!notify_get_state(SHIDWORD(_asl_global), &v16)) {
              qword_18C43C8F8 = v16;
            }
          }

          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            uint64_t v16 = 0LL;
            if (!notify_get_state(SDWORD2(_asl_global), &v16)) {
              qword_18C43C8F0 = v16;
            }
          }
        }
      }
    }

    int v13 = qword_18C43C8F8;
    int v14 = qword_18C43C8F0;
    if ((_DWORD)qword_18C43C8F0) {
      int v15 = 2;
    }
    else {
      int v15 = qword_18C43C8F8 != 0;
    }
    pthread_mutex_unlock(&stru_18C43C930);
    if (!a2) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

LABEL_28:
  int v13 = 0;
  int v14 = 0;
  int v15 = 0;
  if (a2) {
LABEL_29:
  }
    *a2 = v11;
LABEL_30:
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v14;
  }
  uint64_t result = 0LL;
  if (a5) {
    *a5 = v15;
  }
  return result;
}

      __darwin_time_t tv_sec = v32.tv_sec;
      if (v32.tv_sec
        && !gettimeofday(&v33, 0LL)
        && (v33.tv_sec > tv_sec || v33.tv_sec == tv_sec && v33.tv_usec > v32.tv_usec))
      {
        if (!v15) {
          return v7;
        }
        do
        {
LABEL_40:
          unint64_t v30 = (uint64_t *)v15[1];
          free(v15);
          int v15 = v30;
        }

        while (v30);
        return v7;
      }
    }

    while (v15);
  }

  return v7;
}

            int v11 = *a1;
            if (*a1)
            {
              if (a2 > 9 || v11 != 1)
              {
LABEL_35:
                if (a2 <= 9 && v11 == 1) {
                  *((_WORD *)a1 + a2 + 36) = 0;
                }
                goto LABEL_38;
              }

              uint64_t v12 = 10;
            }

            else
            {
              if (a2 >= 0xF)
              {
LABEL_38:
                --a1[2];
                return;
              }

              uint64_t v12 = 15;
            }

            *((_WORD *)a1 + a2 + 16) = -1;
            *((_WORD *)a1 + v12 + a2 + 16) = -1;
            goto LABEL_35;
          }

          int v8 = 0;
          goto LABEL_23;
        }

        if (a2 >= 0xF) {
          goto LABEL_28;
        }
      }

      uint64_t v6 = *((unsigned __int16 *)a1 + a2 + 16);
      goto LABEL_15;
    }
  }

uint64_t asl_set_local_control(__asl_object_s *a1, int a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    if (asl_get_type(a1) != 5) {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    uint64_t v3 = (__asl_object_s *)off_18C43C980;
    if (!off_18C43C980) {
      return 0xFFFFFFFFLL;
    }
  }

  return asl_client_set_control((uint64_t)v3, a2);
}

uint64_t asl_get_local_control(__asl_object_s *a1)
{
  if (a1)
  {
    v1 = a1;
    if (asl_get_type(a1) != 5) {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    v1 = (__asl_object_s *)off_18C43C980;
    if (!off_18C43C980) {
      return 0xFFFFFFFFLL;
    }
  }

  return asl_client_get_control((uint64_t)v1);
}

int *asl_base_msg(uint64_t a1, unsigned int a2, uint64_t a3, int *a4, int *a5, const char *a6)
{
  uint64_t v7 = (const char *)a5;
  int v8 = (const char *)a4;
  uint64_t v25 = *MEMORY[0x1895FEE08];
  int v22 = a5;
  unint64_t v23 = a4;
  uint64_t v12 = (int *)asl_msg_new(0);
  int v13 = v12;
  if (!v12) {
    return v13;
  }
  if (a2 <= 7) {
    asl_msg_set_key_val(v12, "Level", level_to_number_string[a2]);
  }
  if (a3)
  {
    snprintf(__str, 0x40uLL, "%llu", *(void *)a3);
    asl_msg_set_key_val(v13, "Time", __str);
    snprintf(__str, 0x40uLL, "%d", 1000 * *(_DWORD *)(a3 + 8));
    asl_msg_set_key_val(v13, "TimeNanoSec", __str);
  }

  if (a6) {
    asl_msg_set_key_val(v13, "Message", a6);
  }
  pid_t v14 = getpid();
  snprintf(__str, 0x40uLL, "%u", v14);
  asl_msg_set_key_val(v13, "PID", __str);
  os_activity_id_t identifier = os_activity_get_identifier(MEMORY[0x189600820], 0LL);
  if (identifier)
  {
    snprintf(__str, 0x40uLL, "0x%016llx", identifier);
    asl_msg_set_key_val(v13, "OSActivityID", __str);
  }

  if (!a1 || v8)
  {
LABEL_26:
    if (!v8) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  if (asl_msg_lookup(*(_DWORD **)(a1 + 32), "Sender", &v23, 0LL) || (int v8 = (const char *)v23) == 0LL)
  {
    unint64_t v23 = 0LL;
    uint64_t v16 = (const char *)qword_18C43C928;
    if (!qword_18C43C928)
    {
      int v17 = _NSGetArgv();
      unint64_t v18 = **v17;
      if (v18)
      {
        uint64_t v19 = strrchr(**v17, 47);
        pthread_mutex_lock(&stru_18C43C930);
        if (!qword_18C43C928)
        {
          if (v19) {
            int v20 = v19 + 1;
          }
          else {
            int v20 = v18;
          }
          qword_18C43C928 = (uint64_t)strdup(v20);
        }

        pthread_mutex_unlock(&stru_18C43C930);
      }

      if (qword_18C43C928) {
        uint64_t v16 = (const char *)qword_18C43C928;
      }
      else {
        uint64_t v16 = "Unknown";
      }
    }

    asl_msg_set_key_val(v13, "Sender", v16);
    int v8 = (const char *)v23;
    goto LABEL_26;
  }

LABEL_27:
  asl_msg_set_key_val(v13, "Sender", v8);
  uint64_t v7 = (const char *)v22;
LABEL_28:
  if (a1 && !v7)
  {
    uint64_t v7 = (const char *)v22;
  }

  if (v7) {
    asl_msg_set_key_val(v13, "Facility", v7);
  }
  return v13;
}

      int v4 = uint64;
      fclose(*(FILE **)(v11 + 104));
      free((void *)v11);
    }
  }

  else if (*__error() == 13)
  {
    return 10LL;
  }

  else
  {
    return 9999LL;
  }

  return v4;
}

uint64_t asl_client_internal_send(__asl_object_s *a1, __asl_object_s *a2)
{
  uint64_t v4 = _asl_evaluate_send(a1, a2, -1);
  val_for_key = asl_msg_get_val_for_key((int *)a2, "Message");
  if ((v4 & 0x40000) != 0 && val_for_key && *(_BYTE *)val_for_key && os_log_shim_enabled())
  {
    uint64_t v6 = asl_msg_get_val_for_key((int *)a2, "Level");
    if (v6) {
      atoi((const char *)v6);
    }
    os_log_with_args_wrapper();
    uint64_t result = 0LL;
    if ((v4 & 0x80000) != 0) {
      return _asl_send_message_text(0LL, 0LL, a1, v4, a2, 0LL, 1);
    }
  }

  else if ((v4 & 0x1A0000) != 0)
  {
    return _asl_send_message(a1, v4, a2, 0LL);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t os_log_with_args_wrapper()
{
  return os_log_with_args();
}

int asl_create_auxiliary_file(asl_object_t msg, const char *title, const char *uti, int *out_descriptor)
{
  if (!out_descriptor) {
    return -1;
  }
  return 0;
}

uint64_t _asl_auxiliary(__asl_object_s *a1, const char *a2, const char *a3, const char *a4, _DWORD *a5)
{
  uint64_t v37 = *MEMORY[0x1895FEE08];
  asl_object_t v10 = (int *)asl_msg_new(0);
  int v11 = v10;
  if (a4) {
    asl_msg_set_key_val(v10, "ASLAuxURL", a4);
  }
  if (a2) {
    asl_msg_set_key_val(v11, "ASLAuxTitle", a2);
  }
  if (a3) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = "public.data";
  }
  asl_msg_set_key_val(v11, "ASLAuxUTI", v12);
  int v13 = asl_msg_merge(v11, a1);
  if (!a5)
  {
    uint64_t v18 = _asl_evaluate_send(0LL, (asl_object_t)v13, -1);
    uint64_t v19 = _asl_send_message(0LL, v18, (__asl_object_s *)v13, 0LL);
    asl_msg_release((asl_object_t)v13);
    return v19;
  }

  if (asl_store_location())
  {
    pid_t v14 = calloc(1uLL, 0x18uLL);
    if (v14)
    {
      int v15 = v14;
      if ((pipe(v36) & 0x80000000) == 0)
      {
        dispatch_fd_t v16 = v36[0];
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
        v15[2] = v17;
        *(_DWORD *)int v15 = v36[1];
        if (!_asl_aux_save_context((uint64_t)v15))
        {
          uint64_t v25 = dispatch_queue_create("ASL_AUX_PIPE_Q", 0LL);
          uint64_t v26 = MEMORY[0x1895FED80];
          cleanup_handler[0] = MEMORY[0x1895FED80];
          cleanup_handler[1] = 0x40000000LL;
          cleanup_handler[2] = ___asl_auxiliary_block_invoke;
          cleanup_handler[3] = &__block_descriptor_tmp_56;
          dispatch_fd_t v32 = v16;
          int v27 = dispatch_io_create(0LL, v16, v25, cleanup_handler);
          *a5 = v36[1];
          dispatch_io_set_low_water(v27, 0xFFFFFFFFFFFFFFFFLL);
          v30[0] = v26;
          v30[1] = 0x40000000LL;
          v30[2] = ___asl_auxiliary_block_invoke_2;
          v30[3] = &__block_descriptor_tmp_59;
          v30[4] = v13;
          v30[5] = v17;
          v30[6] = v27;
          v30[7] = v25;
          dispatch_io_read(v27, 0LL, 0xFFFFFFFFFFFFFFFFLL, v25, v30);
          return 0LL;
        }

        close(v36[0]);
        close(v36[1]);
        dispatch_release(v17);
      }

      free(v15);
    }

    return 9999LL;
  }

  if (qword_18C43C918 != -1) {
    dispatch_once(&qword_18C43C918, &__block_literal_global_27);
  }
  if (!dword_18C43C920) {
    return 9999LL;
  }
  int v21 = (char *)asl_msg_to_string_raw(-1073741822, v13, "raw");
  uint64_t v22 = asl_string_length((uint64_t)v21);
  uint64_t v23 = asl_string_allocated_size((uint64_t)v21);
  uint64_t v24 = asl_string_release_return_bytes(v21);
  if (!v22)
  {
    asl_msg_release((asl_object_t)v13);
    MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], v24, v23);
    return 9999LL;
  }

  mach_port_name_t v35 = 0;
  unsigned int v33 = 0;
  if (_asl_server_create_aux_link(dword_18C43C920, (uint64_t)v24, v22, &v35, v36, &v34, &v33))
  {
    MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], v24, v23);
LABEL_22:
    asl_msg_release((asl_object_t)v13);
    return 9999LL;
  }

  if (v33)
  {
    asl_msg_release((asl_object_t)v13);
    return v33;
  }

  if (*(void *)v36)
  {
    asl_msg_set_key_val(v13, "ASLAuxURL", *(const char **)v36);
    MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], *(void *)v36, v34);
  }

  if (!v35) {
    goto LABEL_22;
  }
  int v28 = fileport_makefd();
  mach_port_deallocate(*MEMORY[0x1895FFD48], v35);
  if (v28 < 0)
  {
    asl_msg_release((asl_object_t)v13);
  }

  else
  {
    int v29 = calloc(1uLL, 0x18uLL);
    if (v29)
    {
      *a5 = v28;
      *(_DWORD *)int v29 = v28;
      v29[1] = v13;
      return _asl_aux_save_context((uint64_t)v29);
    }
  }

  return 0xFFFFFFFFLL;
}

int asl_log_auxiliary_location(asl_object_t msg, const char *title, const char *uti, const char *url)
{
  else {
    return 0;
  }
}

int asl_close_auxiliary_file(int descriptor)
{
  if (dword_18C43C970 < 1)
  {
LABEL_5:
    uint64_t v4 = 0LL;
    unsigned int v5 = 0LL;
    goto LABEL_6;
  }

  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(void **)(qword_18C43C978 + 8 * v2);
    if (*(_DWORD *)v3 == descriptor) {
      break;
    }
    if (dword_18C43C970 == ++v2) {
      goto LABEL_5;
    }
  }

  uint64_t v4 = (__asl_object_s *)*((void *)v3 + 1);
  unsigned int v5 = (dispatch_semaphore_s *)*((void *)v3 + 2);
  free(v3);
  uint64_t v9 = (dword_18C43C970 - 1);
  if ((int)v2 + 1 < dword_18C43C970)
  {
    do
    {
      *(void *)(qword_18C43C978 + 8 * v2) = *(void *)(qword_18C43C978 + 8 * v2 + 8);
      ++v2;
    }

    while (v9 != v2);
  }

  dword_18C43C970 = v9;
  if ((_DWORD)v9)
  {
    qword_18C43C978 = (uint64_t)reallocf((void *)qword_18C43C978, 8LL * (int)v9);
    if (qword_18C43C978)
    {
      int v6 = 0;
      goto LABEL_7;
    }

    dword_18C43C970 = 0;
LABEL_6:
    int v6 = -1;
    goto LABEL_7;
  }

  free((void *)qword_18C43C978);
  int v6 = 0;
  qword_18C43C978 = 0LL;
LABEL_7:
  pthread_mutex_unlock(&stru_18C43C930);
  close(descriptor);
  if (v4)
  {
    uint64_t v7 = _asl_evaluate_send(0LL, v4, -1);
    asl_msg_release(v4);
  }

  if (v5)
  {
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }

  return v6;
}

asl_object_t _asl_server_control_query()
{
  if (qword_18C43C918 != -1) {
    dispatch_once(&qword_18C43C918, &__block_literal_global_27);
  }
  if (!dword_18C43C920) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v9 = 0LL;
  unsigned int v8 = 0;
  uint64_t v0 = (unsigned int *)MEMORY[0x1895FFD48];
  asl_object_t v1 = 0LL;
  if (vm_allocate(*MEMORY[0x1895FFD48], &address, 0x1BuLL, 1358954497)) {
    return v1;
  }
  vm_address_t v2 = address;
  *(_OWORD *)vm_address_t address = *(_OWORD *)"1\nQ [= ASLOption control]\n";
  strcpy((char *)(v2 + 11), "ption control]\n");
  int v7 = 0;
  asl_object_t v1 = 0LL;
  uint64_t v3 = asl_msg_list_from_string(v9);
  MEMORY[0x186DF5A28](*v0, v9, v8);
  if (!v3) {
    return 0LL;
  }
  if (*((_DWORD *)v3 + 2)) {
    asl_object_t v1 = asl_msg_retain(**((asl_object_t **)v3 + 2));
  }
  else {
    asl_object_t v1 = 0LL;
  }
  asl_msg_list_release(v3);
  return v1;
}

uint64_t asl_store_location()
{
  if (qword_18C43C918 != -1) {
    dispatch_once(&qword_18C43C918, &__block_literal_global_27);
  }
  uint64_t result = dword_18C43C920;
  if (dword_18C43C920)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    uint64_t v2 = 0LL;
    int v1 = _asl_server_query_2(dword_18C43C920, 0LL, 0, 0LL, -1, 0, &v4, (_DWORD *)&v3 + 1, &v2, &v3);
    uint64_t result = 0LL;
    if (!v1)
    {
      if (v4) {
        MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], v4, HIDWORD(v3));
      }
      return (_DWORD)v3 == 0;
    }
  }

  return result;
}

asl_object_t asl_open_path(const char *path, uint32_t opts)
{
  asl_object_t v10 = 0LL;
  int v11 = 0LL;
  if (opts) {
    uint32_t v3 = opts;
  }
  else {
    uint32_t v3 = 0x80000000;
  }
  if ((v3 & 0x80000000) != 0)
  {
    if (path)
    {
      memset(&v12, 0, sizeof(v12));
      if (stat(path, &v12) < 0) {
        return 0LL;
      }
      if ((__int16)v12.st_mode < 0)
      {
        int v6 = asl_file_open_read(path, (uint64_t *)&v11);
        goto LABEL_25;
      }

      if ((v12.st_mode & 0x4000) == 0) {
        return 0LL;
      }
      unsigned int v5 = (char *)path;
    }

    else
    {
      unsigned int v5 = "/var/log/asl";
    }

    int v6 = asl_store_open_read(v5, &v10);
LABEL_23:
    uint64_t v9 = v10;
    goto LABEL_26;
  }

  asl_object_t result = 0LL;
  if (path && (v3 & 1) != 0)
  {
    memset(&v12, 0, sizeof(v12));
    if (stat(path, &v12) < 0)
    {
      if (*__error() != 2) {
        return 0LL;
      }
      if ((v3 & 2) != 0)
      {
LABEL_22:
        int v6 = asl_store_open_write(path, &v10);
        goto LABEL_23;
      }
    }

    else if (((__int16)v12.st_mode & 0x80000000) == 0)
    {
      if ((v12.st_mode & 0x4000) != 0) {
        goto LABEL_22;
      }
      return 0LL;
    }

    uint64_t v7 = geteuid();
    uint64_t v8 = getegid();
    int v6 = asl_file_open_write(path, 0x1A4u, v7, v8, (uint64_t *)&v11);
LABEL_25:
    uint64_t v9 = v11;
LABEL_26:
    if (v6) {
      return 0LL;
    }
    else {
      return v9;
    }
  }

  return result;
}

uint64_t ___asl_global_init_block_invoke()
{
  uint64_t v0 = getenv("ASL_DISABLE");
  if (!v0 || (uint64_t result = strcmp(v0, "1"), (_DWORD)result))
  {
    uint64_t result = bootstrap_look_up2();
    if ((_DWORD)result) {
      dword_18C43C920 = 0;
    }
  }

  return result;
}

void _asl_set_option(int *a1)
{
  uint64_t v4 = 0LL;
  else {
    BOOL v2 = v4 == 0LL;
  }
  if (v2)
  {
    asl_msg_set_key_val(a1, "ASLOption", "store");
  }

  else
  {
    uint32_t v3 = 0LL;
    asprintf(&v3, "%s %s", "store", v4);
    asl_msg_set_key_val(a1, "ASLOption", v3);
    free(v3);
  }

int *___asl_send_message_block_invoke(uint64_t a1)
{
  int v2 = *__error();
  if (stat("/etc/asl/.noquota", &v5))
  {
    uint32_t v3 = getenv("ASL_QUOTA_DISABLED");
    if (v3 && !strcmp(v3, "1"))
    {
      dword_18C43C910 = -1;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  else
  {
    dword_18C43C910 = -1;
  }

  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

uint64_t _asl_aux_save_context(uint64_t a1)
{
  int v2 = reallocf((void *)qword_18C43C978, 8LL * dword_18C43C970 + 8);
  qword_18C43C978 = (uint64_t)v2;
  if (v2)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = dword_18C43C970++;
    v2[v4] = a1;
  }

  else
  {
    dword_18C43C970 = 0;
    uint64_t v3 = 9999LL;
  }

  pthread_mutex_unlock(&stru_18C43C930);
  return v3;
}

uint64_t ___asl_auxiliary_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void ___asl_auxiliary_block_invoke_2(uint64_t a1, int a2, dispatch_data_t data, int a4)
{
  if (!a4)
  {
    size_t size_ptr = dispatch_data_get_size(data);
    if (size_ptr)
    {
      asl_object_t v10 = 0LL;
      dispatch_data_t v7 = dispatch_data_create_map(data, (const void **)&v10, &size_ptr);
      uint64_t v8 = asl_core_encode_buffer(v10, size_ptr);
      asl_msg_set_key_val(*(int **)(a1 + 32), "ASLAuxData", v8);
      free(v8);
      uint64_t v9 = _asl_evaluate_send(0LL, *(asl_object_t *)(a1 + 32), -1);
      _asl_send_message(0LL, v9, *(__asl_object_s **)(a1 + 32), 0LL);
      asl_msg_release(*(asl_object_t *)(a1 + 32));
      dispatch_release(v7);
    }
  }

  if (a2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }

uint64_t asl_core_string_hash(char *__s, unsigned int a2)
{
  if (!__s) {
    return 0LL;
  }
  int v2 = __s;
  if (!a2)
  {
    if (*__s)
    {
      a2 = strlen(__s);
      goto LABEL_5;
    }

    return 0LL;
  }

LABEL_5:
  int v3 = -1640531527;
  if (a2 < 0xC)
  {
    int v4 = 0;
    unsigned int v6 = -1640531527;
    unsigned int v5 = a2;
  }

  else
  {
    int v4 = 0;
    unsigned int v5 = a2;
    unsigned int v6 = -1640531527;
    do
    {
      int v7 = v6 + v2[4] + (v2[5] << 8) + (v2[6] << 16) + (v2[7] << 24);
      unsigned int v8 = v4 + v2[8] + (v2[9] << 8) + (v2[10] << 16) + (v2[11] << 24);
      int v9 = (v3 + *v2 + (v2[1] << 8) + (v2[2] << 16) + (v2[3] << 24) - (v7 + v8)) ^ (v8 >> 13);
      unsigned int v10 = (v7 - v8 - v9) ^ (v9 << 8);
      unsigned int v11 = (v8 - v9 - v10) ^ (v10 >> 13);
      int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
      unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
      unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
      int v3 = (v12 - v13 - v14) ^ (v14 >> 3);
      unsigned int v6 = (v13 - v14 - v3) ^ (v3 << 10);
      int v4 = (v14 - v3 - v6) ^ (v6 >> 15);
      v2 += 12;
      v5 -= 12;
    }

    while (v5 > 0xB);
  }

  unsigned int v16 = v4 + a2;
  switch(v5)
  {
    case 1u:
      goto LABEL_22;
    case 2u:
      goto LABEL_21;
    case 3u:
      goto LABEL_20;
    case 4u:
      goto LABEL_19;
    case 5u:
      goto LABEL_18;
    case 6u:
      goto LABEL_17;
    case 7u:
      goto LABEL_16;
    case 8u:
      goto LABEL_15;
    case 9u:
      goto LABEL_14;
    case 0xAu:
      goto LABEL_13;
    case 0xBu:
      v16 += v2[10] << 24;
LABEL_13:
      v16 += v2[9] << 16;
LABEL_14:
      v16 += v2[8] << 8;
LABEL_15:
      v6 += v2[7] << 24;
LABEL_16:
      v6 += v2[6] << 16;
LABEL_17:
      v6 += v2[5] << 8;
LABEL_18:
      v6 += v2[4];
LABEL_19:
      v3 += v2[3] << 24;
LABEL_20:
      v3 += v2[2] << 16;
LABEL_21:
      v3 += v2[1] << 8;
LABEL_22:
      v3 += *v2;
      break;
    default:
      break;
  }

  int v17 = (v3 - v6 - v16) ^ (v16 >> 13);
  unsigned int v18 = (v6 - v16 - v17) ^ (v17 << 8);
  unsigned int v19 = (v16 - v17 - v18) ^ (v18 >> 13);
  int v20 = (v17 - v18 - v19) ^ (v19 >> 12);
  unsigned int v21 = (v18 - v19 - v20) ^ (v20 << 16);
  unsigned int v22 = (v19 - v20 - v21) ^ (v21 >> 5);
  int v23 = (v20 - v21 - v22) ^ (v22 >> 3);
  unsigned int v24 = (v22 - v23 - ((v21 - v22 - v23) ^ (v23 << 10))) ^ (((v21 - v22 - v23) ^ (v23 << 10)) >> 15);
  if (v24 <= 1) {
    return 1LL;
  }
  else {
    return v24;
  }
}

  int v1 = 0LL;
  int v2 = redirect_descriptors;
  int v3 = 40LL;
  do
  {
    int v4 = *(dispatch_source_s **)(v2 + v3);
    if (v4)
    {
      dispatch_source_cancel(v4);
      int v2 = redirect_descriptors;
      uint64_t v0 = n_redirect_descriptors;
    }

    ++v1;
    v3 += 48LL;
  }

  while (v1 < v0);
LABEL_9:
  unsigned int v5 = (dispatch_group_s *)read_source_group;
  unsigned int v6 = dispatch_time(0LL, 3000000000LL);
  return dispatch_group_wait(v5, v6);
}

  int v23 = 0LL;
  if (__s) {
    int v23 = asl_core_parse_time(__s, 0LL);
  }
  if (!strcasecmp(__str, "lcl") || !strcasecmp(__str, "local"))
  {
    uint64_t result = ctime_r(&v23, (char *)&v27);
    if (!result) {
      return result;
    }
    result[19] = 0;
    asprintf(&v22, "%s%s");
    return v22;
  }

  if (!strcasecmp(__str, "jz") || !strcasecmp(__str, "iso8601") || !strcasecmp(__str, "iso8601e"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    uint64_t result = (char *)localtime_r(&v23, &v27);
    if (!result) {
      return result;
    }
    if (v27.tm_gmtoff >= 0) {
      tm_gmtoff = v27.tm_gmtoff;
    }
    else {
      tm_gmtoff = -v27.tm_gmtoff;
    }
    if (tm_gmtoff % 0xE10 > 0x3B) {
      snprintf(v24, 8uLL, "%c%02lld:%02lld");
    }
    else {
      snprintf(v24, 8uLL, "%c%02lld");
    }
    asprintf( &v22,  "%d-%02d-%02d%c%02d:%02d:%02d%s%s",  (v27.tm_year + 1900),  (v27.tm_mon + 1),  v27.tm_mday);
    return v22;
  }

  if (!strcasecmp(__str, "iso8601b"))
  {
    uint64_t result = (char *)localtime_r(&v23, &v27);
    if (result)
    {
      if (v27.tm_gmtoff >= 0) {
        int v17 = v27.tm_gmtoff;
      }
      else {
        int v17 = -v27.tm_gmtoff;
      }
      if (v17 % 0xE10 > 0x3B) {
        snprintf(v24, 8uLL, "%c%02lld:%02lld");
      }
      else {
        snprintf(v24, 8uLL, "%c%02lld");
      }
      asprintf(&v22, "%d%02d%02dT%02d%02d%02d%s%s", (v27.tm_year + 1900), (v27.tm_mon + 1));
      return v22;
    }

    return result;
  }

  if (!strcasecmp(__str, "sec") || !strcasecmp(__str, "raw"))
  {
    asprintf(&v22, "%llu%s");
    return v22;
  }

  if (!strcasecmp(__str, "j"))
  {
    uint64_t result = (char *)localtime_r(&v23, &v27);
    if (!result) {
      return result;
    }
    asprintf(&v22, "%d-%02d-%02d %02d:%02d:%02d%s", (v27.tm_year + 1900));
    return v22;
  }

  if (!strcasecmp(__str, "utc")
    || !strcasecmp(__str, "zulu")
    || !strcasecmp(__str, "iso8601z")
    || !strcasecmp(__str, "iso8601ez"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    uint64_t result = (char *)gmtime_r(&v23, &v27);
    if (!result) {
      return result;
    }
    asprintf( &v22,  "%d-%02d-%02d%c%02d:%02d:%02d%sZ",  (v27.tm_year + 1900),  (v27.tm_mon + 1));
    return v22;
  }

  if (!strcasecmp(__str, "iso8601bz"))
  {
    uint64_t result = (char *)gmtime_r(&v23, &v27);
    if (!result) {
      return result;
    }
    asprintf(&v22, "%d%02d%02dT%02d%02d%02d%sZ", (v27.tm_year + 1900));
    return v22;
  }

  unsigned int v6 = __str[1];
  int v7 = __str[0];
  if (!__str[1] && ((__str[0] & 0xDF) - 65) <= 0x19u)
  {
    unsigned int v8 = __str[0] - 32;
    if (v8 == 90)
    {
      int v9 = 0LL;
      goto LABEL_78;
    }

    if (v8 - 65 <= 8)
    {
      int v9 = 3600 * v8 - 230400;
      goto LABEL_78;
    }

    if (v8 - 75 <= 2)
    {
      int v9 = 3600 * v8 - 234000;
      goto LABEL_78;
    }

    if (v8 - 78 <= 0xB)
    {
      int v9 = 3600 * (77 - v8);
      goto LABEL_78;
    }

    return 0LL;
  }

  if (__str[0] == 45 || __str[0] == 43)
  {
    unsigned int v18 = &__str[1];
  }

  else
  {
    unsigned int v18 = __str;
    unsigned int v6 = __str[0];
  }

  unsigned int v19 = atoi(v18);
  int v20 = strchr(v18, 58);
  if (v20)
  {
    unsigned int v21 = atoi(v20 + 1);
    if (v7 == 45) {
      int v9 = -(3600LL * v19 + 60LL * v21);
    }
    else {
      int v9 = 3600LL * v19 + 60LL * v21;
    }
    if (v21)
    {
      snprintf(v24, 8uLL, "%c%02lld:%02lld");
      goto LABEL_78;
    }
  }

  else if (v7 == 45)
  {
    int v9 = -3600LL * v19;
  }

  else
  {
    int v9 = 3600LL * v19;
  }

  snprintf(v24, 8uLL, "%c%02lld");
LABEL_78:
  v23 += v9;
  memset(&v27, 0, sizeof(v27));
  uint64_t result = (char *)gmtime_r(&v23, &v27);
  if (result)
  {
    if ((__str[0] - 65) > 0x19)
    {
      if ((__str[0] - 97) > 0x19) {
        asprintf( &v22,  "%d-%02d-%02d %02d:%02d:%02d%s%s",  (v27.tm_year + 1900),  (v27.tm_mon + 1));
      }
      else {
        asprintf( &v22,  "%d-%02d-%02d %02d:%02d:%02d%s%c",  (v27.tm_year + 1900),  (v27.tm_mon + 1));
      }
    }

    else
    {
      asprintf( &v22,  "%d-%02d-%02d %02d:%02d:%02d%s%c",  (v27.tm_year + 1900),  (v27.tm_mon + 1));
    }

    return v22;
  }

  return result;
}

const char *asl_core_error(unsigned int a1)
{
  if (a1 > 0xE) {
    return "Operation Failed";
  }
  else {
    return off_1896259A0[a1];
  }
}

const char *asl_core_level_to_string(unsigned int a1)
{
  if (a1 <= 7) {
    return ASL_LEVEL_TO_STRING[a1];
  }
  else {
    return "invalid";
  }
}

uint64_t asl_core_check_access(int a1, gid_t a2, uid_t uid, int a4, char a5)
{
  uint64_t result = 0LL;
  if (!uid) {
    return result;
  }
  int v7 = a5 & 3;
  if ((a5 & 3) == 0) {
    return result;
  }
  if (v7 == 2) {
    return asl_core_check_group_access(a2, uid, a4);
  }
  if (v7 != 1)
  {
    uint64_t result = 0LL;
    if (a1 == -1 || a1 == uid) {
      return result;
    }
    return asl_core_check_group_access(a2, uid, a4);
  }

  if (a1 == uid || a1 == -1) {
    return 0LL;
  }
  else {
    return 10LL;
  }
}

uint64_t asl_core_check_group_access(gid_t a1, uid_t uid, int a3)
{
  uint64_t result = 0LL;
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (a1 != -1 && a1 != a3)
  {
    mbr_uid_to_uuid(uid, uu);
    mbr_gid_to_uuid(a1, group);
    int ismember = 0;
    mbr_check_membership(uu, group, &ismember);
    if (ismember) {
      return 0LL;
    }
    else {
      return 10LL;
    }
  }

  return result;
}

unint64_t asl_core_htonq(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t asl_core_ntohq(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t asl_core_new_msg_id(uint64_t a1)
{
  if (!a1) {
    a1 = _asl_core_msg_next_id;
  }
  _asl_core_msg_next_id = a1 + 1;
  pthread_mutex_unlock(&core_lock);
  return a1;
}

uint64_t asl_filesystem_path(int a1)
{
  if (asl_filesystem_path_once != -1) {
    dispatch_once(&asl_filesystem_path_once, &__block_literal_global_0);
  }
  if (a1 == 1) {
    return asl_filesystem_path_asl_filesystem_path_archive;
  }
  if (a1) {
    return 0LL;
  }
  return asl_filesystem_path_asl_filesystem_path_database;
}

uint64_t __asl_filesystem_path_block_invoke()
{
  return asprintf((char **)&asl_filesystem_path_asl_filesystem_path_archive, "%s/asl.archive", "/var/log");
}

_BYTE *asl_core_encode_buffer(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t result = 0LL;
  uint64_t v33 = *MEMORY[0x1895FEE08];
  if (!a1 || !a2) {
    return result;
  }
  bzero(v31, 0x400uLL);
  uint64_t v28 = 0LL;
  uint64_t v5 = a2;
  uint64_t v6 = a2;
  int v7 = a1;
  do
  {
    int v8 = *v7++;
    ++v31[v8];
    --v6;
  }

  while (v6);
  char v9 = 0;
  uint64_t v10 = 0LL;
  char v11 = 1;
  do
  {
    char v12 = v11;
    *(_DWORD *)&v29[4 * v10] = 1;
    unsigned int v13 = v32;
    uint64_t v14 = 1LL;
    uint64_t v15 = 2LL;
    int v16 = v28;
    while (1)
    {
      unsigned int v17 = v31[v15];
      if (v17 < v13) {
        break;
      }
LABEL_11:
      if (++v15 == 256) {
        goto LABEL_14;
      }
    }

    *(_DWORD *)&v29[4 * v10] = v15;
    if (v17 && (v9 & (v17 == v16)) == 0)
    {
      uint64_t v14 = v15;
      unsigned int v13 = v17;
      goto LABEL_11;
    }

    uint64_t v14 = v15;
LABEL_14:
    char v11 = 0;
    *(_DWORD *)&v29[4 * v10 - 8] = v31[v14];
    v31[v14] = -1;
    char v9 = 1;
    uint64_t v10 = 1LL;
  }

  while ((v12 & 1) != 0);
  int v18 = a2 + v28 + HIDWORD(v28);
  uint64_t result = malloc((v18 + 3));
  if (result)
  {
    uint64_t v19 = 0LL;
    result[v18 + 2] = 0;
    char v20 = v29[0];
    *uint64_t result = v29[0];
    char v21 = v30;
    result[1] = v30;
    unsigned int v22 = 2;
    do
    {
      int v23 = a1[v19];
      if (a1[v19])
      {
        uint64_t v24 = 0LL;
        char v25 = 1;
        while (1)
        {
          char v26 = v25;
          if (*(_DWORD *)&v29[4 * v24] == v23) {
            break;
          }
          char v25 = 0;
          uint64_t v24 = 1LL;
          if ((v26 & 1) == 0)
          {
            unsigned int v27 = v22;
            goto LABEL_24;
          }
        }

        unsigned int v27 = v22 + 1;
        result[v22] = v21;
        LOBYTE(v23) = v24 + 1;
        LODWORD(v24) = 2;
      }

      else
      {
        LODWORD(v24) = 1;
        unsigned int v27 = v22;
        LOBYTE(v23) = v20;
      }

LABEL_24:
      v22 += v24;
      result[v27] = v23;
      ++v19;
    }

    while (v19 != v5);
  }

  return result;
}

uint64_t asl_core_decode_buffer(const char *a1, void *a2, int *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a3)
  {
    int v7 = *(unsigned __int8 *)a1;
    v19[0] = *a1;
    int v8 = *((unsigned __int8 *)a1 + 1);
    v19[1] = a1[1];
    unsigned int v9 = strlen(a1);
    unsigned int v10 = v9;
    if (v9 >= 3)
    {
      int v11 = 0;
      LODWORD(v12) = 2;
      while (1)
      {
        if (a1[v12] == v8)
        {
          uint64_t v12 = v12 + 1LL;
        }

        LODWORD(v12) = v12 + 1;
        --v11;
        if (v12 >= v9)
        {
          if (!v11) {
            return 0xFFFFFFFFLL;
          }
          int v13 = -v11;
          uint64_t v14 = malloc(-v11);
          if (!v14) {
            return 0xFFFFFFFFLL;
          }
          if (v10 >= 3)
          {
            int v15 = 0;
            LODWORD(v16) = 2;
            do
            {
              int v17 = a1[v16];
              if (v17 == v7)
              {
                LOBYTE(v17) = 0;
              }

              else if (v17 == v8)
              {
                uint64_t v16 = v16 + 1LL;
                LOBYTE(v17) = v19[a1[v16] - 1];
              }

              v14[v15++] = v17;
              LODWORD(v16) = v16 + 1;
            }

            while (v16 < v10);
          }

          uint64_t v3 = 0LL;
          *a3 = v13;
          *a2 = v14;
          return v3;
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

  return v3;
}

BOOL asl_core_str_match(char *a1, char *__s, unsigned int a3, int a4, unsigned int a5, unsigned int *a6)
{
  if (!a1) {
    return a3 == 0;
  }
  uint64_t v12 = a1;
  unsigned int v13 = 0;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  *a6 = v13;
  char v14 = *v12;
  if (*v12)
  {
    while (1)
    {
      if (a4 && v13 == a4) {
        return 1LL;
      }
      if (__s)
      {
        int v15 = strchr(__s, v14);
        BOOL v16 = !v15 || (a5 & 1) == 0;
        if (((v15 == 0LL) & (a5 >> 1)) == 0 && v16) {
          break;
        }
      }

      unsigned int v17 = v6;
      if (a6) {
        unsigned int v17 = *a6;
      }
      ++v12;
      unsigned int v13 = v17 + 1;
      if (a6) {
        goto LABEL_3;
      }
LABEL_5:
      char v14 = *v12;
      unsigned int v6 = v13;
      if (!*v12) {
        goto LABEL_19;
      }
    }

    if (a6) {
      unsigned int v6 = *a6;
    }
  }

  else
  {
LABEL_19:
    unsigned int v6 = v13;
  }

  return v6 >= a3;
}

BOOL asl_core_str_match_char( unsigned __int8 *a1, unsigned __int8 a2, unsigned int a3, char a4, unsigned int *a5)
{
  if (a5) {
    *a5 = 0;
  }
  if (!a1) {
    return a3 == 0;
  }
  int v5 = *a1;
  if ((a4 & 1) != 0 && v5 == a2)
  {
    unsigned int v6 = 1;
    if (!a5) {
      return v6 >= a3;
    }
    *a5 = 1;
    if ((a4 & 2) == 0 || *a1 == a2) {
      return v6 >= a3;
    }
  }

  else
  {
    if ((a4 & 2) == 0 || v5 == a2)
    {
      if (a5) {
        unsigned int v6 = *a5;
      }
      else {
        unsigned int v6 = 0;
      }
      return v6 >= a3;
    }

    if (!a5)
    {
      unsigned int v6 = 1;
      return v6 >= a3;
    }
  }

  unsigned int v6 = 1;
  *a5 = 1;
  return v6 >= a3;
}

unint64_t asl_core_str_to_uint32(unint64_t result, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  int v2 = (char *)result;
  LODWORD(result) = 0;
  uint64_t v3 = a2;
  do
  {
    int v4 = *v2++;
    uint64_t result = (v4 + 10 * result - 48);
    --v3;
  }

  while (v3);
  return result;
}

const char *asl_core_str_to_size(const char *result)
{
  if (result)
  {
    int v1 = result;
    uint64_t result = (const char *)strlen(result);
    if (result)
    {
      int v2 = v1[(void)result - 1];
      if (v2 > 90) {
        LOBYTE(v2) = v2 - 32;
      }
      unsigned __int8 v3 = v2 - 71;
      if (v3 > 6u) {
        uint64_t v4 = 1LL;
      }
      else {
        uint64_t v4 = qword_18013AA38[(char)v3];
      }
      return (const char *)(atoll(v1) * v4);
    }
  }

  return result;
}

const char *asl_core_str_to_time(const char *result, int a2)
{
  if (result)
  {
    LODWORD(v2) = a2;
    unsigned __int8 v3 = result;
    uint64_t result = (const char *)strlen(result);
    if (result)
    {
      int v4 = v3[(void)result - 1];
      if (v4 > 90) {
        LOBYTE(v4) = v4 - 32;
      }
      if (v4 > 0x4Cu)
      {
        if (v4 == 83)
        {
          uint64_t v2 = 1LL;
          return (const char *)(atoll(v3) * v2);
        }

        if (v4 == 77)
        {
          uint64_t v2 = 60LL;
          return (const char *)(atoll(v3) * v2);
        }
      }

      else
      {
        if (v4 == 68)
        {
          uint64_t v2 = 86400LL;
          return (const char *)(atoll(v3) * v2);
        }

        if (v4 == 72)
        {
          uint64_t v2 = 3600LL;
          return (const char *)(atoll(v3) * v2);
        }
      }

      uint64_t v2 = v2;
      return (const char *)(atoll(v3) * v2);
    }
  }

  return result;
}

uint64_t asl_core_time_to_str(int a1, char *a2, size_t a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  __int128 v5 = 0uLL;
  *(_OWORD *)__str = 0u;
  __int128 v16 = 0u;
  int v6 = a1 / 86400;
  int v7 = a1 % 86400 / 3600;
  int v8 = a1 % 86400 % 3600;
  uint64_t v10 = (__int16)(v8
                - 60
  if (a1 / 86400)
  {
    int v11 = "s";
    if (v6 == 1) {
      int v11 = (const char *)&unk_18013B015;
    }
    snprintf(__str, 0x20uLL, "%u day%s", a1 / 86400, v11);
    __int128 v5 = 0uLL;
  }

  *(_OWORD *)unsigned int v13 = v5;
  __int128 v14 = v5;
  snprintf(v13, 0x20uLL, "%02u:%02u:%02lld", v7, v9, v10);
  if (v7 + v9 + v10)
  {
    if (v6) {
      return snprintf(a2, a3, "%s %s");
    }
    return snprintf(a2, a3, "%s");
  }

  if (v6) {
    return snprintf(a2, a3, "%s");
  }
  return snprintf(a2, a3, "0");
}

uint64_t asl_core_str_match_c_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    memset(&v59, 0, sizeof(v59));
    time_t v58 = time(0LL);
    localtime_r(&v58, &v59);
    int tm_year = v59.tm_year;
    memset(&v59, 0, sizeof(v59));
    v59.int tm_year = tm_year;
    if (!strncasecmp((const char *)v5, "jan", 3uLL))
    {
      int v7 = 0;
    }

    else if (!strncasecmp((const char *)v5, "feb", 3uLL))
    {
      int v7 = 1;
    }

    else if (!strncasecmp((const char *)v5, "mar", 3uLL))
    {
      int v7 = 2;
    }

    else
    {
      int v7 = 3;
      if (strncasecmp((const char *)v5, "apr", 3uLL))
      {
        if (!strncasecmp((const char *)v5, "may", 3uLL))
        {
          int v7 = 4;
        }

        else if (!strncasecmp((const char *)v5, "jun", 3uLL))
        {
          int v7 = 5;
        }

        else if (!strncasecmp((const char *)v5, "jul", 3uLL))
        {
          int v7 = 6;
        }

        else if (!strncasecmp((const char *)v5, "aug", 3uLL))
        {
          int v7 = 7;
        }

        else if (!strncasecmp((const char *)v5, "sep", 3uLL))
        {
          int v7 = 8;
        }

        else if (!strncasecmp((const char *)v5, "oct", 3uLL))
        {
          int v7 = 9;
        }

        else if (!strncasecmp((const char *)v5, "nov", 3uLL))
        {
          int v7 = 10;
        }

        else
        {
          int v7 = 11;
        }
      }
    }

    v59.tm_mon = v7;
    LOBYTE(v8) = *(_BYTE *)(v5 + 3);
    if (!(_BYTE)v8) {
      return 0LL;
    }
    uint64_t v9 = 0LL;
    do
    {
      int v8 = *(unsigned __int8 *)(v5 + 4 + v9++);
    }

    while (v8);
    if (!(_DWORD)v9) {
      return 0LL;
    }
    uint64_t v10 = (_BYTE *)(v5 + 3 + v9);
    LOBYTE(v11) = *v10;
    if (!*v10) {
      return 0LL;
    }
    uint64_t v12 = 0LL;
    unsigned int v13 = (char *)(v5 + 3 + v9);
    while (1)
    {
      if ((_DWORD)v12 == 2)
      {
        LODWORD(v12) = 2;
        goto LABEL_38;
      }

      int v11 = *(unsigned __int8 *)(v9 + v5 + 4 + v12++);
      if (!v11) {
        goto LABEL_38;
      }
    }

    if (!(_DWORD)v12) {
      return 0LL;
    }
LABEL_38:
    int v14 = 0;
    uint64_t v15 = v12;
    do
    {
      int v16 = *v13++;
      int v14 = v16 + 10 * v14 - 48;
      --v15;
    }

    while (v15);
    v59.tm_mday = v14;
    if (v14 > 31) {
      return 0LL;
    }
    uint64_t v17 = &v10[v12];
    LOBYTE(v18) = *v17;
    if (!*v17) {
      return 0LL;
    }
    uint64_t v19 = 0LL;
    do
    {
      int v18 = *(unsigned __int8 *)(v9 + (unint64_t)v12 + v5 + 4 + v19++);
    }

    while (v18);
    if (!(_DWORD)v19) {
      return 0LL;
    }
    char v20 = &v17[v19];
    LOBYTE(v21) = *v20;
    if (!*v20) {
      return 0LL;
    }
    uint64_t v22 = 0LL;
    int v23 = v20;
    uint64_t v57 = v19;
    unint64_t v24 = v9 + (unint64_t)v19 + v12 + v5 + 4;
    while (1)
    {
      if ((_DWORD)v22 == 2)
      {
        LODWORD(v22) = 2;
        goto LABEL_54;
      }

      int v21 = *(unsigned __int8 *)(v24 + v22++);
      if (!v21) {
        goto LABEL_54;
      }
    }

    if (!(_DWORD)v22) {
      return 0LL;
    }
LABEL_54:
    int v25 = 0;
    uint64_t v26 = v22;
    uint64_t v27 = v22;
    do
    {
      int v28 = *v23++;
      int v25 = v28 + 10 * v25 - 48;
      --v27;
    }

    while (v27);
    v59.tm_hour = v25;
    if (v25 > 23) {
      return 0LL;
    }
    int v29 = &v20[v22];
    if (*v29 != 58) {
      return 0LL;
    }
    int v32 = v29[1];
    unsigned int v31 = v29 + 1;
    LOBYTE(v30) = v32;
    if (!v32) {
      return 0LL;
    }
    uint64_t v33 = 0LL;
    unsigned int v34 = v31;
    uint64_t v55 = v26;
    uint64_t v35 = v9 + v26 + v57 + v12 + v5 + 5;
    do
    {
      if ((_DWORD)v33 == 2)
      {
        LODWORD(v33) = 2;
        uint64_t v36 = v55;
        goto LABEL_66;
      }

      int v30 = *(unsigned __int8 *)(v35 + v33++);
    }

    while (v30);
    uint64_t v36 = v55;
LABEL_66:
    int v37 = 0;
    uint64_t v38 = v33;
    do
    {
      int v39 = *v34++;
      int v37 = v39 + 10 * v37 - 48;
      --v38;
    }

    while (v38);
    v59.tm_min = v37;
    if (v37 > 59) {
      return 0LL;
    }
    v40 = &v31[v33];
    if (*v40 != 58) {
      return 0LL;
    }
    int v43 = v40[1];
    uint64_t v42 = v40 + 1;
    LOBYTE(v41) = v43;
    if (!v43) {
      return 0LL;
    }
    uint64_t v44 = 0LL;
    uint64_t v54 = v33;
    v56 = v42;
    unint64_t v45 = v9 + (unint64_t)v33 + v36 + v57 + v12 + v5 + 6;
    do
    {
      if ((_DWORD)v44 == 2)
      {
        LODWORD(v44) = 2;
        goto LABEL_78;
      }

      int v41 = *(unsigned __int8 *)(v45 + v44++);
    }

    while (v41);
LABEL_78:
    int v46 = 0;
    uint64_t v47 = v44;
    uint64_t v48 = v44;
    do
    {
      int v49 = *v42++;
      int v46 = v49 + 10 * v46 - 48;
      --v48;
    }

    while (v48);
    v59.tm_sec = v46;
    if (v46 > 59) {
      return 0LL;
    }
    int v50 = (_DWORD)v56 + v44;
    LOBYTE(v51) = v56[v47];
    if ((_BYTE)v51)
    {
      uint64_t v52 = 0LL;
      uint64_t v53 = v9 + v47 + v54 + v36 + v57 + v12 + v5 + 6;
      while ((_DWORD)v52 != 1)
      {
        if (!memchr(" \t\n", (char)v51, 4uLL))
        {
          if (!(_DWORD)v52) {
            return 0LL;
          }
          break;
        }

        int v51 = *(unsigned __int8 *)(v53 + v52++);
        if (!v51) {
          break;
        }
      }
    }

    v59.tm_isdst = -1;
    if (a3) {
      *a3 = v50 - v5;
    }
    if (a2) {
      *a2 = mktime(&v59);
    }
    return 1LL;
  }

  return result;
}

time_t asl_core_parse_time(char *__s, int *a2)
{
  time_t v8 = 0LL;
  if (a2) {
    *a2 = 0;
  }
  if (!__s) {
    return -1LL;
  }
  unsigned int v4 = strlen(__s);
  if (!v4) {
    return -1LL;
  }
  int v5 = *__s;
  if (v5 == 45 || v5 == 43) {
    goto LABEL_7;
  }
  if ((v5 & 0xFFFFFFDF) - 65 > 0x19)
  {
    if (v4 <= 4)
    {
LABEL_7:
      int matched = asl_core_str_match_absolute_or_relative_time(__s, &v8, a2);
      goto LABEL_8;
    }

    if (__s[4] == 46)
    {
      int matched = asl_core_str_match_dotted_time((uint64_t)__s, &v8, a2);
    }

    else
    {
      int matched = asl_core_str_match_iso_8601_time((uint64_t)__s, &v8, a2);
    }
  }

  else
  {
    int matched = asl_core_str_match_c_time((uint64_t)__s, &v8, a2);
  }

uint64_t asl_core_str_match_absolute_or_relative_time(_BYTE *a1, void *a2, _DWORD *a3)
{
  if (!a1)
  {
LABEL_8:
    time_t v8 = time(0LL);
    if (*a1 == 45) {
      int v9 = -1;
    }
    else {
      int v9 = 1;
    }
    LODWORD(v7) = 1;
    goto LABEL_14;
  }

  LOBYTE(v6) = *a1;
  if (*a1)
  {
    uint64_t v7 = 0LL;
    while ((_DWORD)v7 != 1)
    {
      int v6 = a1[++v7];
      if (!v6)
      {
        if ((_DWORD)v7 != 1) {
          goto LABEL_13;
        }
        goto LABEL_8;
      }
    }

    goto LABEL_8;
  }

  LODWORD(v7) = 0;
LABEL_13:
  time_t v8 = 0LL;
  int v9 = 1;
LABEL_14:
  uint64_t v10 = &a1[v7];
  LOBYTE(v11) = *v10;
  if (!*v10) {
    return 0LL;
  }
  uint64_t v12 = 0LL;
  do
  {
    int v11 = a1[v7 + 1 + v12++];
  }

  while (v11);
  if (!(_DWORD)v12) {
    return 0LL;
  }
  int v28 = v9;
  time_t v29 = v8;
  int v30 = a2;
  int v13 = 0;
  uint64_t v14 = v12;
  uint64_t v15 = &a1[v7];
  uint64_t v16 = v12;
  do
  {
    int v17 = *v15++;
    int v13 = v17 + 10 * v13 - 48;
    --v16;
  }

  while (v16);
  int v18 = &v10[v12];
  int v19 = *v18;
  if (v10[v14])
  {
    uint64_t v20 = 0LL;
    LOBYTE(v21) = *v18;
    while ((_DWORD)v20 != 1)
    {
      if (memchr("SsMmHhDdWw", (char)v21, 0xBuLL))
      {
        int v21 = a1[v7 + 1 + v14 + v20++];
        if (v21) {
          continue;
        }
      }

      goto LABEL_29;
    }

    LODWORD(v20) = 1;
LABEL_29:
    if (v19 <= 99)
    {
      if (v19 <= 76)
      {
        if (v19 != 68)
        {
          if (v19 != 72) {
            goto LABEL_47;
          }
          goto LABEL_37;
        }

LABEL_44:
        int v22 = 86400;
        goto LABEL_46;
      }

      if (v19 != 77)
      {
        if (v19 != 87) {
          goto LABEL_47;
        }
        goto LABEL_45;
      }

      uint64_t v7 = asl_msg_fetch(a2, v7, &__s1, (int **)&__s, 0LL);
      if (v7 == -1)
      {
        int v21 = DWORD2(v42);
        int v22 = __ptr;
        goto LABEL_80;
      }
    }

    uint64_t v12 = __s;
    if (!__s) {
      goto LABEL_44;
    }
    int v13 = a1;
    uint64_t v14 = (unint64_t *)&v45;
    goto LABEL_43;
  }

  int v21 = 0;
  int v22 = 0LL;
  time_t v8 = (unint64_t *)__src;
LABEL_80:
  int v23 = 8 * v21;
  int v24 = *(_OWORD **)(a1 + 120);
  if (!v24 || 8 * v21 + 122 > 0x11A)
  {
    uint64_t v25 = (char *)calloc(1uLL, (v23 + 122));
    if (v25) {
      goto LABEL_83;
    }
    return 9LL;
  }

  v24[15] = 0u;
  v24[16] = 0u;
  v24[13] = 0u;
  v24[14] = 0u;
  v24[11] = 0u;
  v24[12] = 0u;
  v24[9] = 0u;
  v24[10] = 0u;
  v24[7] = 0u;
  v24[8] = 0u;
  v24[5] = 0u;
  v24[6] = 0u;
  v24[3] = 0u;
  v24[4] = 0u;
  v24[1] = 0u;
  v24[2] = 0u;
  *int v24 = 0u;
  *(_OWORD *)((char *)v24 + 266) = 0u;
  uint64_t v25 = *(char **)(a1 + 120);
  if (!v25) {
    return 9LL;
  }
LABEL_83:
  unint64_t v26 = v39;
  if (v39 == -1)
  {
    unint64_t v26 = *(void *)(a1 + 56) + 1LL;
    *(void *)(a1 + 56) = v26;
    int v39 = v26;
  }

  *(_WORD *)uint64_t v25 = 0;
  *(_DWORD *)(v25 + 2) = bswap32(v23 + 116);
  *(void *)(v25 + 6) = asl_core_htonq(v38);
  *(void *)(v25 + 14) = asl_core_htonq(v26);
  *(void *)(v25 + 22) = asl_core_htonq(v40);
  *(_DWORD *)(v25 + 30) = bswap32(DWORD2(v40));
  *((_WORD *)v25 + 17) = bswap32(WORD6(v40)) >> 16;
  *((_WORD *)v25 + 18) = bswap32(HIWORD(v40)) >> 16;
  *(int8x16_t *)(v25 + 38) = vrev32q_s8(v41);
  *(int8x8_t *)(v25 + 54) = vrev32_s8(*(int8x8_t *)&v42);
  *(_DWORD *)(v25 + 62) = bswap32(v21);
  *(void *)(v25 + 66) = asl_core_htonq(v43);
  *(void *)(v25 + 74) = asl_core_htonq(*((unint64_t *)&v43 + 1));
  *(void *)(v25 + 82) = asl_core_htonq(v44);
  *(void *)(v25 + 90) = asl_core_htonq(*((unint64_t *)&v44 + 1));
  *(void *)(v25 + 98) = asl_core_htonq(v45);
  *(void *)(v25 + 106) = asl_core_htonq(*((unint64_t *)&v45 + 1));
  uint64_t v27 = (unint64_t *)(v25 + 114);
  int v28 = DWORD2(v42);
  if (DWORD2(v42))
  {
    do
    {
      time_t v29 = *v8++;
      *v27++ = asl_core_htonq(v29);
      --v28;
    }

    while (v28);
  }

  *uint64_t v27 = asl_core_htonq(v46);
  free(v22);
  if (!fseeko(*(FILE **)(a1 + 104), 0LL, 2))
  {
    int v30 = ftello(*(FILE **)(a1 + 104));
    *(void *)(a1 + 48) = v30;
    uint64_t v36 = asl_core_htonq(v30);
    fwrite(v25, (v23 + 122), 1uLL, *(FILE **)(a1 + 104));
    fflush(*(FILE **)(a1 + 104));
    unsigned int v31 = *(void *)(a1 + 64);
    int v32 = v31 ? v31 + 6 : 16LL;
    if (!fseeko(*(FILE **)(a1 + 104), v32, 0))
    {
      int v19 = 8LL;
      if (!fseeko(*(FILE **)(a1 + 104), 37LL, 0))
      {
        int v19 = 8LL;
        if (!fseeko(*(FILE **)(a1 + 104), 0LL, 2))
        {
          fflush(*(FILE **)(a1 + 104));
          int v19 = 0LL;
          *(void *)(a1 + 96) = ftello(*(FILE **)(a1 + 104));
          *(void *)(a1 + 64) = *(void *)(a1 + 48);
          return v19;
        }
      }
    }
  }

  return 8LL;
}

LABEL_43:
      v13 *= 60;
      goto LABEL_47;
    }

    if (v19 > 108)
    {
      if (v19 == 119)
      {
LABEL_45:
        int v22 = 604800;
        goto LABEL_46;
      }

      if (v19 == 109) {
        goto LABEL_43;
      }
    }

    else
    {
      if (v19 == 100) {
        goto LABEL_44;
      }
      if (v19 == 104)
      {
LABEL_37:
        int v22 = 3600;
LABEL_46:
        v13 *= v22;
      }
    }
  }

  else
  {
    LODWORD(v20) = 0;
  }

  uint64_t v10 = &v3[v11];
  *uint64_t result = &v3[v11];
  if (v12)
  {
    uint64_t v15 = 0;
LABEL_50:
    *a2 = 4;
    uint64_t result = malloc((v9 + 1));
    if (result)
    {
      if ((v15 & 1) == 0)
      {
        LODWORD(v16) = 0;
        int v17 = 0;
        while (1)
        {
          int v18 = v3[v17];
          if (v18 == 92)
          {
            *a2 = 3;
            int v19 = v17 + 1LL;
            uint64_t v20 = v3[v19];
            LOBYTE(v18) = 7;
            switch(v3[v19])
            {
              case '[':
              case '\\':
              case ']':
                LOBYTE(v18) = v3[v19];
                break;
              case '^':
                LODWORD(v19) = v17 + 2;
                int v18 = v3[v17 + 2];
                if (v18 == 63) {
                  LOBYTE(v18) = 127;
                }
                else {
                  LOBYTE(v18) = v18 - 64;
                }
                break;
              case '_':
              case 'c':
              case 'd':
              case 'e':
              case 'g':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'o':
              case 'p':
              case 'q':
              case 'u':
                goto LABEL_69;
              case 'a':
                break;
              case 'b':
                LOBYTE(v18) = 8;
                break;
              case 'f':
                LOBYTE(v18) = 12;
                break;
              case 'n':
                LOBYTE(v18) = 10;
                break;
              case 'r':
                LOBYTE(v18) = 13;
                break;
              case 's':
                LOBYTE(v18) = 32;
                break;
              case 't':
                LOBYTE(v18) = 9;
                break;
              case 'v':
                LOBYTE(v18) = 11;
                break;
              default:
                if (v20 == 77)
                {
                  int v21 = v3[v17 + 2];
                  if (v21 == 45)
                  {
                    LODWORD(v19) = v17 + 3;
                    LOBYTE(v18) = v3[v17 + 3] ^ 0x80;
                  }

                  else
                  {
                    if (v21 != 94) {
                      goto LABEL_84;
                    }
                    LODWORD(v19) = v17 + 3;
                    int v18 = v3[v17 + 3];
                    if (v18 == 63) {
                      LOBYTE(v18) = -1;
                    }
                    else {
                      LOBYTE(v18) = v18 + 64;
                    }
                  }
                }

                else
                {
LABEL_69:
                  if ((v20 & 0xFC) != 0x30
                    || (int v22 = v3[v17 + 2], (v22 - 56) <= 0xF7u)
                    || (LODWORD(v19) = v17 + 3, int v23 = v3[v17 + 3], (v23 - 56) <= 0xF7u))
                  {
LABEL_84:
                    *a2 = 0;
                    free(result);
                    return 0LL;
                  }

                  LOBYTE(v18) = ((_BYTE)v20 << 6) + 8 * v22 + v23 + 80;
                }

                break;
            }
          }

          else
          {
            LODWORD(v19) = v17;
          }

          *((_BYTE *)result + v16) = v18;
          uint64_t v16 = (v16 + 1);
          int v17 = v19 + 1;
        }
      }

      uint64_t v16 = 0LL;
LABEL_53:
      *((_BYTE *)result + v16) = 0;
    }

    return result;
  }

LABEL_47:
  int v23 = &v18[v20];
  LOBYTE(v24) = *v23;
  if (*v23)
  {
    uint64_t v25 = 0LL;
    unint64_t v26 = (unint64_t)&a1[v14 + 1 + v20 + v7];
    while ((_DWORD)v25 != 1)
    {
      if (!memchr(" \t\n", (char)v24, 4uLL))
      {
        if (!(_DWORD)v25) {
          return 0LL;
        }
        break;
      }

      int v24 = *(unsigned __int8 *)(v26 + v25++);
      if (!v24) {
        break;
      }
    }
  }

  if (a3) {
    *a3 = (_DWORD)v23 - (_DWORD)a1;
  }
  if (v30) {
    void *v30 = v29 + v13 * v28;
  }
  return 1LL;
}

uint64_t asl_core_str_match_dotted_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  if (result)
  {
    unsigned __int8 v3 = (char *)result;
    LOBYTE(v4) = *(_BYTE *)result;
    if (!*(_BYTE *)result) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    do
    {
      if ((_DWORD)v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }

      int v4 = v3[++v7];
    }

    while (v4);
    int v8 = 0;
    int v9 = v3;
    uint64_t v10 = v7;
    do
    {
      int v11 = *v9++;
      int v8 = v11 + 10 * v8 - 48;
      --v10;
    }

    while (v10);
    v74.int tm_year = v8 - 1900;
    uint64_t v12 = &v3[v7];
    if (*v12 != 46) {
      return 0LL;
    }
    int v15 = v12[1];
    uint64_t v14 = v12 + 1;
    LOBYTE(v13) = v15;
    if (!v15) {
      return 0LL;
    }
LABEL_10:
    uint64_t v16 = 0LL;
    int v17 = v14;
    while (1)
    {
      if ((_DWORD)v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_21;
      }

      int v13 = v3[v7 + 2 + v16++];
      if (!v13) {
        goto LABEL_21;
      }
    }

    if (!(_DWORD)v16) {
      return 0LL;
    }
    int v18 = 0;
    uint64_t v19 = v16;
    do
    {
      int v20 = *v17++;
      int v18 = v20 + 10 * v18 - 48;
      --v19;
    }

    while (v19);
    v74.tm_mon = v18 - 1;
    int v21 = &v14[v16];
    if (*v21 != 46) {
      return 0LL;
    }
    int v24 = v21[1];
    int v23 = v21 + 1;
    LOBYTE(v22) = v24;
    if (!v24) {
      return 0LL;
    }
LABEL_21:
    uint64_t v25 = 0LL;
    unint64_t v26 = v23;
    while (1)
    {
      if ((_DWORD)v25 == 2)
      {
        LODWORD(v25) = 2;
        goto LABEL_33;
      }

      int v22 = v3[v7 + 3 + (unint64_t)v16 + v25++];
      if (!v22) {
        goto LABEL_33;
      }
    }

    if (!(_DWORD)v25) {
      return 0LL;
    }
    int v27 = 0;
    uint64_t v28 = v25;
    do
    {
      int v29 = *v26++;
      int v27 = v29 + 10 * v27 - 48;
      --v28;
    }

    while (v28);
    v74.tm_mday = v27;
    if (v27 > 31) {
      return 0LL;
    }
    int v30 = &v23[v25];
    LOBYTE(v31) = *v30;
    if (!*v30) {
      return 0LL;
    }
    uint64_t v32 = 0LL;
    do
    {
      int v31 = v3[v16 + 3 + v7 + (unint64_t)v25 + v32++];
    }

    while (v31);
    if (!(_DWORD)v32) {
      return 0LL;
    }
    uint64_t v33 = &v30[v32];
    LOBYTE(v34) = *v33;
    if (!*v33) {
      return 0LL;
    }
LABEL_33:
    uint64_t v35 = 0LL;
    uint64_t v69 = v32;
    v70 = v33;
    uint64_t v36 = v33;
    while (1)
    {
      if ((_DWORD)v35 == 2)
      {
        LODWORD(v35) = 2;
        goto LABEL_49;
      }

      int v34 = v3[v25
                              + 3
                              + (unint64_t)v16
                              + v7
                              + v69
                              + v35++];
      if (!v34) {
        goto LABEL_49;
      }
    }

    if (!(_DWORD)v35) {
      return 0LL;
    }
    int v37 = 0;
    uint64_t v38 = v35;
    uint64_t v39 = v35;
    do
    {
      int v40 = *v36++;
      int v37 = v40 + 10 * v37 - 48;
      --v39;
    }

    while (v39);
    v74.tm_hour = v37;
    if (v37 > 23) {
      return 0LL;
    }
    int v41 = &v70[v35];
    if (*v41 != 58) {
      return 0LL;
    }
    int v44 = v41[1];
    int v43 = v41 + 1;
    LOBYTE(v42) = v44;
    if (!v44) {
      return 0LL;
    }
LABEL_49:
    uint64_t v45 = 0LL;
    v71 = v43;
    uint64_t v67 = v38;
    unint64_t v46 = (unint64_t)&v3[v25
                              + 4
                              + (unint64_t)v16
                              + v7
                              + v38
                              + v69];
    do
    {
      if ((_DWORD)v45 == 2)
      {
        LODWORD(v45) = 2;
        goto LABEL_61;
      }

      int v42 = *(unsigned __int8 *)(v46 + v45++);
    }

    while (v42);
    int v47 = 0;
    uint64_t v48 = v45;
    uint64_t v68 = v45;
    do
    {
      int v49 = *v43++;
      int v47 = v49 + 10 * v47 - 48;
      --v48;
    }

    while (v48);
    v74.tm_min = v47;
    if (v47 > 59) {
      return 0LL;
    }
    v72 = &v71[v45];
    if (*v72 != 58) {
      return 0LL;
    }
    int v50 = v72[1];
    v73 = v72 + 1;
    if (!v50) {
      return 0LL;
    }
LABEL_61:
    uint64_t v51 = 0LL;
    uint64_t v52 = v73;
    unint64_t v53 = (unint64_t)&v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v45
                              + v67
                              + v69];
    do
    {
      if ((_DWORD)v51 == 2)
      {
        LODWORD(v51) = 2;
        goto LABEL_73;
      }

      int v50 = *(unsigned __int8 *)(v53 + v51++);
    }

    while (v50);
    int v54 = 0;
    uint64_t v55 = v51;
    uint64_t v66 = v51;
    do
    {
      int v56 = *v52++;
      int v54 = v56 + 10 * v54 - 48;
      --v55;
    }

    while (v55);
    v74.tm_sec = v54;
    if (v54 > 59) {
      return 0LL;
    }
    uint64_t v57 = &v73[v51];
    LOBYTE(v58) = *v57;
    if (!*v57) {
      return 0LL;
    }
LABEL_73:
    uint64_t v59 = 0LL;
    do
    {
      int v58 = v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v66
                              + v68
                              + v67
                              + v69
                              + v59++];
    }

    while (v58);
    if ((_DWORD)v59 && (v60 = &v57[v59], !strncmp(v60, "UTC", 3uLL)))
    {
      int v63 = *((unsigned __int8 *)v60 + 3);
      int v62 = (_DWORD)v60 + 3;
      LOBYTE(v61) = v63;
      if (v63)
      {
        uint64_t v64 = 0LL;
        unint64_t v65 = (unint64_t)&v3[v25
                                  + 8
                                  + (unint64_t)v16
                                  + v7
                                  + v59
                                  + v66
                                  + v68
                                  + v67
                                  + v69];
        while ((_DWORD)v64 != 1)
        {
          if (!memchr(" \t\n", (char)v61, 4uLL))
          {
            if (!(_DWORD)v64) {
              return 0LL;
            }
            break;
          }

          int v61 = *(unsigned __int8 *)(v65 + v64++);
          if (!v61) {
            break;
          }
        }
      }

      if (a3) {
        *a3 = v62 - (_DWORD)v3;
      }
      if (a2) {
        *a2 = timegm(&v74);
      }
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t asl_core_str_match_iso_8601_time(uint64_t result, time_t *a2, int *a3)
{
  if (result)
  {
    unsigned __int8 v3 = (char *)result;
    LOBYTE(v4) = *(_BYTE *)result;
    if (!*(_BYTE *)result) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    do
    {
      if ((_DWORD)v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }

      int v4 = v3[++v7];
    }

    while (v4);
LABEL_10:
    int v8 = 0;
    int v9 = v3;
    uint64_t v10 = v7;
    do
    {
      int v11 = *v9++;
      int v8 = v11 + 10 * v8 - 48;
      --v10;
    }

    while (v10);
    v99.int tm_year = v8 - 1900;
    int v12 = v3[v7];
    BOOL v13 = v12 == 45;
    uint64_t v14 = v12 == 45 ? &v3[v7 + 1] : &v3[v7];
    LOBYTE(v15) = *v14;
    if (!*v14) {
      return 0LL;
    }
    uint64_t v16 = 0LL;
    int v17 = v14;
    do
    {
      if ((_DWORD)v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_23;
      }

      int v15 = v3[v7 + 1 + v13 + v16++];
    }

    while (v15);
LABEL_23:
    int v18 = 0;
    uint64_t v19 = v16;
    do
    {
      int v20 = *v17++;
      int v18 = v20 + 10 * v18 - 48;
      --v19;
    }

    while (v19);
    v99.tm_mon = v18 - 1;
    BOOL v21 = v14[v16] == 45;
    int v22 = v14[v16] == 45 ? &v14[v16 + 1] : &v14[v16];
    LOBYTE(v23) = *v22;
    if (!*v22) {
      return 0LL;
    }
    uint64_t v24 = 0LL;
    uint64_t v25 = v22;
    BOOL v97 = v21;
    uint64_t v98 = v16;
    unint64_t v26 = (unint64_t)&v3[v7 + 1 + (unint64_t)v16 + v13 + v21];
    do
    {
      if ((_DWORD)v24 == 2)
      {
        LODWORD(v24) = 2;
        v100[0] = 2;
        goto LABEL_37;
      }

      int v23 = *(unsigned __int8 *)(v26 + v24++);
    }

    while (v23);
    v100[0] = v24;
LABEL_37:
    int v27 = 0;
    uint64_t v28 = v24;
    uint64_t v29 = v24;
    do
    {
      int v30 = *v25++;
      int v27 = v30 + 10 * v27 - 48;
      --v29;
    }

    while (v29);
    v99.tm_mday = v27;
    if (v27 > 31) {
      return 0LL;
    }
    uint64_t result = asl_core_str_match(&v22[v24], "Tt", 1u, 1, 1u, v100);
    if ((_DWORD)result)
    {
      uint64_t v31 = v100[0];
      uint64_t v32 = &v22[v28 + v100[0]];
      uint64_t result = asl_core_str_match(v32, "0123456789", 2u, 2, 1u, v100);
      if ((_DWORD)result)
      {
        uint64_t v33 = v100[0];
        if (v100[0])
        {
          int v34 = 0;
          uint64_t v35 = v32;
          uint64_t v36 = v100[0];
          do
          {
            int v37 = *v35++;
            int v34 = v37 + 10 * v34 - 48;
            --v36;
          }

          while (v36);
          v99.tm_hour = v34;
          if (v34 > 23) {
            return 0LL;
          }
        }

        else
        {
          uint64_t v33 = 0LL;
          v99.tm_hour = 0;
        }

        int v38 = v32[v33];
        BOOL v39 = v38 == 58;
        v100[0] = v38 == 58;
        int v40 = v38 == 58 ? &v32[v33 + 1] : &v32[v33];
        uint64_t result = asl_core_str_match(v40, "0123456789", 2u, 2, 1u, v100);
        if ((_DWORD)result)
        {
          uint64_t v41 = v100[0];
          if (v100[0])
          {
            int v42 = 0;
            int v43 = v40;
            uint64_t v44 = v100[0];
            do
            {
              int v45 = *v43++;
              int v42 = v45 + 10 * v42 - 48;
              --v44;
            }

            while (v44);
            v99.tm_min = v42;
            if (v42 > 59) {
              return 0LL;
            }
          }

          else
          {
            uint64_t v41 = 0LL;
            v99.tm_min = 0;
          }

          BOOL v53 = v40[v41] == 58;
          BOOL v95 = v53;
          uint64_t v96 = v41;
          v100[0] = v53;
          unint64_t v46 = v53 ? &v40[v41 + 1] : &v40[v41];
          uint64_t result = asl_core_str_match(v46, "0123456789", 2u, 2, 1u, v100);
          if ((_DWORD)result)
          {
            BOOL v94 = v39;
            uint64_t v47 = v100[0];
            if (v100[0])
            {
              int v48 = 0;
              int v49 = v46;
              uint64_t v50 = v100[0];
              do
              {
                int v51 = *v49++;
                int v48 = v51 + 10 * v48 - 48;
                --v50;
              }

              while (v50);
              v99.tm_sec = v48;
              if (v48 > 59) {
                return 0LL;
              }
            }

            else
            {
              uint64_t v47 = 0LL;
              int v48 = 0;
              v99.tm_sec = 0;
            }

            unsigned int v52 = v46[v47];
            BOOL v53 = v52 > 0x20 || ((1LL << v52) & 0x100000601LL) == 0;
            if (!v53)
            {
              v99.tm_isdst = -1;
              if (a3) {
                *a3 = (_DWORD)v46 + v47 - (_DWORD)v3;
              }
              if (!a2) {
                return 1LL;
              }
              time_t v54 = mktime(&v99);
              goto LABEL_78;
            }

            uint64_t v90 = v31;
            v91 = &v46[v47];
            uint64_t v55 = 0LL;
            v100[0] = 0;
            uint64_t v88 = v47;
            uint64_t v89 = v33;
            uint64_t v56 = (uint64_t)&v3[v98 + 1 + v7 + v28 + v95 + v94 + v97 + v13 + v47 + v96 + v33 + v31];
            unsigned int v57 = v52;
            LOBYTE(v58) = v52;
            while (1)
            {
              if ((_DWORD)v55 == 1)
              {
                LODWORD(v55) = 1;
                goto LABEL_87;
              }

              int v58 = *(unsigned __int8 *)(v56 + v55++);
              v100[0] = v55;
              if (!v58) {
                goto LABEL_87;
              }
            }

            if (!(_DWORD)v55) {
              return 0LL;
            }
LABEL_87:
            v92 = &v91[v55];
            if (v57 == 45)
            {
              int v62 = 3600;
            }

            else
            {
              if (v57 == 122 || v57 == 90)
              {
                LOBYTE(v59) = *v92;
                if (*v92)
                {
                  uint64_t v60 = 0LL;
                  v100[0] = 0;
                  uint64_t v61 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v98
                                   + v7
                                   + v28
                                   + v95
                                   + v55
                                   + v94
                                   + v97];
                  while ((_DWORD)v60 != 1)
                  {
                    if (!memchr(" \t\n", (char)v59, 4uLL))
                    {
                      if (!(_DWORD)v60) {
                        return 0LL;
                      }
                      break;
                    }

                    int v59 = *(unsigned __int8 *)(v61 + v60++);
                    v100[0] = v60;
                    if (!v59) {
                      break;
                    }
                  }
                }

                if (!a3) {
                  goto LABEL_109;
                }
                int v67 = (_DWORD)v92 - (_DWORD)v3;
                goto LABEL_108;
              }

              int v62 = -3600;
            }

            int v87 = v62;
            v100[0] = 0;
            LOBYTE(v62) = *v92;
            if (*v92)
            {
              uint64_t v63 = 0LL;
              uint64_t v85 = v55;
              uint64_t v64 = v98 + v7 + v28 + v95 + v55;
              unint64_t v65 = v92;
              uint64_t v66 = (uint64_t)&v3[v13 + 1 + v88 + v96 + v89 + v90 + v64 + v94 + v97];
              while (1)
              {
                if ((_DWORD)v63 == 2)
                {
                  LODWORD(v63) = 2;
                  goto LABEL_112;
                }

                int v62 = *(unsigned __int8 *)(v66 + v63++);
                v100[0] = v63;
                if (!v62) {
                  goto LABEL_112;
                }
              }

              if (!(_DWORD)v63) {
                return 0LL;
              }
LABEL_112:
              int v68 = 0;
              uint64_t v69 = v63;
              uint64_t v86 = v63;
              do
              {
                int v70 = *v65++;
                int v68 = v70 + 10 * v68 - 48;
                --v69;
              }

              while (v69);
              if (v68 <= 23)
              {
                int v71 = v68;
                v72 = &v92[v86];
                v100[0] = 0;
                BOOL v84 = v92[v86] == 58;
                if (v92[v86] == 58) {
                  ++v72;
                }
                v93 = v72;
                int v73 = *v72;
                if (v73)
                {
                  uint64_t v74 = 0LL;
                  while (1)
                  {
                    if ((_DWORD)v74 == 2)
                    {
                      LODWORD(v74) = 2;
                      goto LABEL_125;
                    }

                    int v73 = v3[v97
                                            + 1
                                            + v13
                                            + v88
                                            + v96
                                            + v89
                                            + v90
                                            + v7
                                            + v86
                                            + v85
                                            + v28
                                            + v98
                                            + v95
                                            + v94
                                            + v84
                                            + v74++];
                    v100[0] = v74;
                    if (!v73) {
                      goto LABEL_125;
                    }
                  }

                  if (!(_DWORD)v74) {
                    goto LABEL_129;
                  }
LABEL_125:
                  int v75 = 0;
                  uint64_t v76 = v74;
                  uint64_t v77 = v74;
                  v78 = v93;
                  do
                  {
                    int v79 = *v78++;
                    int v75 = v79 + 10 * v75 - 48;
                    --v77;
                  }

                  while (v77);
                  if (v75 > 59) {
                    return 0LL;
                  }
                }

                else
                {
LABEL_129:
                  uint64_t v76 = 0LL;
                  int v75 = 0;
                }

                v99.tm_sec = v48 + v87 * v71 + 60 * v75;
                v80 = &v93[v76];
                if (!v93[v76])
                {
LABEL_138:
                  if (!a3) {
                    goto LABEL_109;
                  }
                  int v67 = (_DWORD)v80 - (_DWORD)v3;
LABEL_108:
                  *a3 = v67;
LABEL_109:
                  if (!a2) {
                    return 1LL;
                  }
                  time_t v54 = timegm(&v99);
LABEL_78:
                  *a2 = v54;
                  return 1LL;
                }

                v100[0] = 0;
                LOBYTE(v81) = *v80;
                if (*v80)
                {
                  uint64_t v82 = 0LL;
                  uint64_t v83 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v76
                                   + v7
                                   + v86
                                   + v85
                                   + v28
                                   + v98
                                   + v84
                                   + v95
                                   + v94
                                   + v97];
                  while ((_DWORD)v82 != 1)
                  {
                    if (!memchr(" \t\n", (char)v81, 4uLL))
                    {
                      if (!(_DWORD)v82) {
                        return 0LL;
                      }
                      goto LABEL_138;
                    }

                    int v81 = *(unsigned __int8 *)(v83 + v82++);
                    v100[0] = v82;
                    if (!v81) {
                      goto LABEL_138;
                    }
                  }

                  goto LABEL_138;
                }
              }
            }

            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

time_t asl_parse_time(char *a1)
{
  return asl_core_parse_time(a1, 0LL);
}

void *asl_string_new(int a1)
{
  uint64_t result = calloc(1uLL, 0x30uLL);
  if (result)
  {
    *uint64_t result = 0x100000006LL;
    *((_DWORD *)result + 2) = a1;
    result[2] = 256LL;
    if (a1 < 0) {
      result[2] = *MEMORY[0x189600148];
    }
    result[3] = 0LL;
    result[4] = 0LL;
    if ((a1 & 0x40000000) != 0) {
      return asl_string_append_no_encoding_len(result, "         0 ", 0xBuLL);
    }
  }

  return result;
}

void *asl_string_append_no_encoding_len(void *a1, char *__s, size_t a3)
{
  if (a1 && __s)
  {
    size_t v5 = a3;
    if (!a3) {
      size_t v5 = strlen(__s);
    }
    if (a1[3]) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v5 + 1;
    }
    if ((_asl_string_grow((uint64_t)a1, v6) & 0x80000000) == 0)
    {
      memcpy((void *)(a1[5] + a1[4]), __s, v5);
      uint64_t v7 = a1[5];
      size_t v8 = a1[4] + v5;
      a1[4] = v8;
      *(_BYTE *)(v7 + v8) = 0;
    }
  }

  return a1;
}

uint64_t asl_string_retain(uint64_t result)
{
  if (result)
  {
    int v1 = (unsigned int *)(result + 4);
    do
      unsigned int v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }

  return result;
}

void asl_string_release(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = (unsigned int *)(a1 + 4);
    do
    {
      unsigned int v3 = __ldaxr(v2);
      unsigned int v4 = v3 - 1;
    }

    while (__stlxr(v4, v2));
    if (!v4)
    {
      if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0) {
        MEMORY[0x186DF5A28](*MEMORY[0x1895FFD48], *(void *)(a1 + 40), *(void *)(a1 + 24));
      }
      else {
        free(*(void **)(a1 + 40));
      }
      free((void *)a1);
    }
  }

char *asl_string_release_return_bytes(char *a1)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 0LL;
  }
  if ((a1[11] & 0x40) != 0)
  {
    snprintf(__str, 0xBuLL, "%10lu", *((void *)a1 + 4) - 10LL);
    uint64_t v2 = *((void *)a1 + 5);
    *(void *)uint64_t v2 = *(void *)__str;
    *(_WORD *)(v2 + 8) = v10;
  }

  unsigned int v3 = (unsigned int *)(a1 + 4);
  do
  {
    unsigned int v4 = __ldaxr(v3);
    unsigned int v5 = v4 - 1;
  }

  while (__stlxr(v5, v3));
  if (v5)
  {
    if ((*((_DWORD *)a1 + 2) & 0x80000000) != 0)
    {
      vm_size_t v8 = *((void *)a1 + 3);
      if (v8)
      {
        *(void *)__str = 0LL;
        uint64_t v6 = 0LL;
        if (!vm_allocate(*MEMORY[0x1895FFD48], (vm_address_t *)__str, v8, 1358954497))
        {
          memcpy(*(void **)__str, *((const void **)a1 + 5), *((void *)a1 + 3));
          return *(char **)__str;
        }

        return (char *)v6;
      }
    }

    else if (*((void *)a1 + 4))
    {
      return strdup(*((const char **)a1 + 5));
    }

    return 0LL;
  }

  uint64_t v6 = *((void *)a1 + 5);
  free(a1);
  return (char *)v6;
}

uint64_t asl_string_bytes(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 11) & 0x40) != 0)
    {
      snprintf(__str, 0xBuLL, "%10lu", *(void *)(result + 32) - 10LL);
      uint64_t v2 = *(void *)(v1 + 40);
      *(void *)uint64_t v2 = *(void *)__str;
      *(_WORD *)(v2 + 8) = v4;
    }

    return *(void *)(v1 + 40);
  }

  return result;
}

uint64_t asl_string_length(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1) {
      return v1 + 1;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t asl_string_allocated_size(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void *asl_string_append_char_no_encoding(void *a1, char a2)
{
  if (a1)
  {
    if (a1[3]) {
      unint64_t v4 = 1LL;
    }
    else {
      unint64_t v4 = 2LL;
    }
    if ((_asl_string_grow((uint64_t)a1, v4) & 0x80000000) == 0)
    {
      *(_BYTE *)(a1[5] + a1[4]) = a2;
      uint64_t v5 = a1[5];
      uint64_t v6 = a1[4] + 1LL;
      a1[4] = v6;
      *(_BYTE *)(v5 + v6) = 0;
    }
  }

  return a1;
}

uint64_t _asl_string_grow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v4 = (size_t *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v3 + ~v5 >= a2) {
      return 0LL;
    }
    size_t v6 = (v5 + a2 + *(void *)(a1 + 16)) / *(void *)(a1 + 16) * *(void *)(a1 + 16);
  }

  else
  {
    size_t v6 = (a2 + *(void *)(a1 + 16) - 1) / *(void *)(a1 + 16) * *(void *)(a1 + 16);
  }

  if ((*(_DWORD *)(a1 + 8) & 0x80000000) == 0)
  {
    vm_size_t v8 = reallocf(*(void **)(a1 + 40), v6);
    *(void *)(a1 + 40) = v8;
    if (v8)
    {
      uint64_t result = 0LL;
      *unint64_t v4 = v6;
      return result;
    }

    *unint64_t v4 = 0LL;
    v4[1] = 0LL;
    return 0xFFFFFFFFLL;
  }

  vm_address_t address = 0LL;
  int v9 = (unsigned int *)MEMORY[0x1895FFD48];
  if (vm_allocate(*MEMORY[0x1895FFD48], &address, v6, 1358954497)) {
    return 0xFFFFFFFFLL;
  }
  __int16 v10 = *(const void **)(a1 + 40);
  if (v10)
  {
    memcpy((void *)address, v10, *(void *)(a1 + 24));
    MEMORY[0x186DF5A28](*v9, *(void *)(a1 + 40), *(void *)(a1 + 24));
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 40) = address;
  *(void *)(a1 + 24) = v6;
  return result;
}

void *asl_string_append_no_encoding(void *a1, char *a2)
{
  return asl_string_append_no_encoding_len(a1, a2, 0LL);
}

uint64_t asl_string_append(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 0);
}

uint64_t asl_string_append_internal(uint64_t a1, char *a2, int a3)
{
  uint64_t v3 = a1;
  uint64_t v33 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return v3;
  }
  unint64_t v4 = a2;
  if (!a2) {
    return v3;
  }
  switch(*(_DWORD *)(a1 + 8) & 0xF)
  {
    case 0:
      size_t v5 = 0LL;
      goto LABEL_143;
    case 1:
      int v6 = *a2;
      if (!*a2) {
        return v3;
      }
      size_t v5 = 0LL;
      uint64_t v7 = 0LL;
      while (1)
      {
        int v8 = v4[1];
        if (v4[1]) {
          unsigned __int8 v9 = v4[2];
        }
        else {
          unsigned __int8 v9 = 0;
        }
        if (v6 == 8)
        {
          if (v5)
          {
            asl_string_append_no_encoding_len((void *)v3, v7, v5);
            uint64_t v7 = 0LL;
          }

          __int16 v10 = (void *)v3;
          uint64_t v11 = "^H";
        }

        else
        {
          if (v6 == 13 || v6 == 10)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v7, v5);
              uint64_t v7 = 0LL;
            }
          }

          else
          {
            if (v6 == 194 && v8 == 133)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v7, v5);
                uint64_t v7 = 0LL;
              }

              asl_string_append_no_encoding_len((void *)v3, "\n\t", 2uLL);
              size_t v5 = 0LL;
              ++v4;
              goto LABEL_20;
            }

            if (v6 != 226 || v8 != 128 || (v9 & 0xFE) != 0xA8)
            {
              if (!v7) {
                uint64_t v7 = v4;
              }
              ++v5;
              goto LABEL_20;
            }

            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v7, v5);
              uint64_t v7 = 0LL;
            }

            v4 += 3;
          }

          __int16 v10 = (void *)v3;
          uint64_t v11 = "\n\t";
        }

        asl_string_append_no_encoding_len(v10, v11, 2uLL);
        size_t v5 = 0LL;
LABEL_20:
        int v12 = *++v4;
        int v6 = v12;
        if (!v12)
        {
          if (v5)
          {
            a1 = v3;
            a2 = v7;
            goto LABEL_143;
          }

          return v3;
        }
      }

    case 2:
      unsigned __int8 v13 = *a2;
      if (!*a2) {
        return v3;
      }
      size_t v5 = 0LL;
      int v15 = 0LL;
      do
      {
        if ((v13 & 0x80) != 0)
        {
          if (v13 == 160)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0LL;
            }

            int v17 = (void *)v3;
            int v18 = "\\240";
            size_t v19 = 4LL;
            goto LABEL_85;
          }

          if (v5)
          {
            asl_string_append_no_encoding_len((void *)v3, v15, v5);
            int v15 = 0LL;
          }

          asl_string_append_no_encoding_len((void *)v3, "\\M", 2uLL);
          size_t v5 = 0LL;
          unsigned __int8 v16 = v13 & 0x7F;
        }

        else
        {
          unsigned __int8 v16 = v13;
        }

        if (v16 == 32)
        {
          if (a3)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0LL;
            }

            int v17 = (void *)v3;
            int v18 = "\\s";
LABEL_84:
            size_t v19 = 2LL;
LABEL_85:
            asl_string_append_no_encoding_len(v17, v18, v19);
LABEL_86:
            size_t v5 = 0LL;
            goto LABEL_87;
          }
        }

        else
        {
          unsigned int v20 = v16;
          if ((v13 & 0x80) == 0 && v16 == 92)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0LL;
            }

            int v17 = (void *)v3;
            int v18 = "\\\\"";
            goto LABEL_84;
          }

          if ((v13 & 0x80) == 0 && (*(_DWORD *)(v3 + 8) & 2) != 0)
          {
            int v21 = *v4;
            if (v21 == 93 || v21 == 91)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0LL;
                int v21 = *v4;
              }

              int v17 = (void *)v3;
              if (v21 == 91) {
                int v18 = "\\[";
              }
              else {
                int v18 = "\\]";
              }
              goto LABEL_84;
            }
          }

          if (v20 == 127)
          {
            if ((v13 & 0x80) != 0)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0LL;
              }
            }

            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0LL;
              }

              asl_string_append_char_no_encoding((void *)v3, 92);
            }

            int v17 = (void *)v3;
            int v18 = "^?";
            goto LABEL_84;
          }

          if ((v20 - 33) > 0x5Du)
          {
            if ((v13 & 0x80) != 0 || (v20 - 7) > 6u)
            {
              if (v20 > 0x1F) {
                goto LABEL_94;
              }
              if ((v13 & 0x80) != 0)
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((void *)v3, v15, v5);
                  int v15 = 0LL;
                }
              }

              else
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((void *)v3, v15, v5);
                  int v15 = 0LL;
                }

                asl_string_append_char_no_encoding((void *)v3, 92);
              }

              appended = asl_string_append_char_no_encoding((void *)v3, 94);
              char v23 = v20 + 64;
            }

            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0LL;
              }

              appended = asl_string_append_char_no_encoding((void *)v3, 92);
              char v23 = aAbtnvfr[v20 - 7];
            }

LABEL_100:
            asl_string_append_char_no_encoding(appended, v23);
            goto LABEL_86;
          }

          if ((v13 & 0x80) != 0)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0LL;
            }

            appended = asl_string_append_char_no_encoding((void *)v3, 45);
            char v23 = v20;
            goto LABEL_100;
          }
        }

LABEL_94:
        if (!v15) {
          int v15 = v4;
        }
        ++v5;
LABEL_87:
        int v24 = *++v4;
        unsigned __int8 v13 = v24;
      }

      while (v24);
      if (v5)
      {
        a1 = v3;
        a2 = v15;
LABEL_143:
        asl_string_append_no_encoding_len((void *)a1, a2, v5);
      }

      return v3;
    case 3:
      uint64_t v25 = 0LL;
      size_t v26 = 0LL;
      while (2)
      {
        unsigned int v27 = *v4;
        if (v27 <= 0x26)
        {
          if (v27 == 34)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((void *)v3, v25, v26);
              uint64_t v25 = 0LL;
            }

            uint64_t v28 = (void *)v3;
            uint64_t v29 = "&quot;";
            goto LABEL_130;
          }

          if (v27 == 38)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((void *)v3, v25, v26);
              uint64_t v25 = 0LL;
            }

            uint64_t v28 = (void *)v3;
            uint64_t v29 = "&amp;";
            size_t v30 = 5LL;
            goto LABEL_131;
          }

          if (!*v4)
          {
            if (v26)
            {
              a1 = v3;
              a2 = v25;
              size_t v5 = v26;
              goto LABEL_143;
            }

            return v3;
          }
        }

        else
        {
          switch(v27)
          {
            case '\'':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0LL;
              }

              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&apos;";
              goto LABEL_130;
            case '<':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0LL;
              }

              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&lt;";
              goto LABEL_120;
            case '>':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0LL;
              }

              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&gt;";
LABEL_120:
              size_t v30 = 4LL;
LABEL_131:
              asl_string_append_no_encoding_len(v28, v29, v30);
              size_t v26 = 0LL;
LABEL_132:
              ++v4;
              continue;
          }
        }

        break;
      }

      if ((v27 & 0x80) != 0)
      {
      }

      else if ((*(_DWORD *)(MEMORY[0x1895FED88] + 4LL * *v4 + 60) & 0x200) != 0)
      {
LABEL_127:
        if (v26)
        {
          asl_string_append_no_encoding_len((void *)v3, v25, v26);
          uint64_t v25 = 0LL;
        }

        snprintf(__str, 8uLL, "&#x%02hhx;", v27);
        uint64_t v29 = __str;
        uint64_t v28 = (void *)v3;
LABEL_130:
        size_t v30 = 6LL;
        goto LABEL_131;
      }

      if (!v25) {
        uint64_t v25 = v4;
      }
      ++v26;
      goto LABEL_132;
    default:
      return v3;
  }

        if (v44 == 9 && v40 == 0) {
          goto LABEL_106;
        }
        goto LABEL_98;
      }

      v40 -= v40 > 0;
      if (!v40)
      {
        ++v41;
LABEL_106:
        int v49 = v41 - v42;
        memcpy(v34, v36 + 1, v49);
        uint64_t v50 = 0;
        int v51 = 0;
        unsigned int v52 = 0LL;
        BOOL v53 = 0LL;
        v34[v49] = 0;
        while (2)
        {
          time_t v54 = &v34[v50];
          uint64_t v55 = *v54;
          if (v55 == 40) {
            goto LABEL_120;
          }
          if (v55 == 41)
          {
            *time_t v54 = 0;
            int v51 = 1;
LABEL_120:
            ++v50;
            continue;
          }

          break;
        }

        if (*v54)
        {
          uint64_t v56 = v51 == 1;
          unsigned int v57 = v53 == 0LL;
          int v58 = !v56 || !v57;
          if (v56 && v57) {
            int v59 = 1;
          }
          else {
            int v59 = v51;
          }
          if (v58) {
            uint64_t v60 = (char *)v53;
          }
          else {
            uint64_t v60 = &v34[v50];
          }
          if (v52)
          {
            int v51 = v59;
            BOOL v53 = v60;
          }

          else
          {
            unsigned int v52 = &v34[v50];
          }

          goto LABEL_120;
        }

        if (v52)
        {
          __s1a = 0LL;
          asl_msg_lookup(v9, "TimeNanoSec", (int **)&__s1a, 0LL);
          if (!asl_msg_lookup(v9, v52, (int **)&__s, 0LL))
          {
            uint64_t v61 = __s;
            if (__s)
            {
              if (!strcmp(v52, "Time"))
              {
                if (v53) {
                  int v62 = v53;
                }
                else {
                  int v62 = a3;
                }
                uint64_t v69 = _asl_time_string(v62, v61, __s1a);
                if (v69)
                {
                  asl_string_append_no_encoding(v32, v69);
                  free(v69);
                }

                else
                {
                  asl_string_append_char_no_encoding(v32, 48);
                }
              }

              else
              {
                if (strcmp(v52, "Level"))
                {
                  asl_string_append((uint64_t)v32, v61);
                  goto LABEL_161;
                }

                if (v53)
                {
                  if (!strcmp(v53, "str"))
                  {
                    int v70 = atoi(v61);
                    uint64_t v64 = "unknown";
                    if (v70 <= 7)
                    {
                      int v71 = off_189625CC0;
                      goto LABEL_158;
                    }
                  }

                  else
                  {
                    int v70 = atoi(v61);
                    uint64_t v64 = "?";
                    if (v70 <= 7)
                    {
                      int v71 = off_189625D00;
LABEL_158:
                      uint64_t v64 = v71[v70];
                    }
                  }

                  __s = v64;
                  uint64_t v63 = v32;
                }

                else
                {
LABEL_142:
                  uint64_t v63 = v32;
                  uint64_t v64 = v61;
                }

                asl_string_append_no_encoding(v63, v64);
              }
            }
          }
        }

uint64_t asl_string_append_asl_key(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 1);
}

void *asl_string_append_op(void *result, int a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (!result) {
    return result;
  }
  if (!a2) {
    return asl_string_append_char_no_encoding(result, 46);
  }
  if ((a2 & 0x10) != 0)
  {
    v7[0] = 67;
    int v2 = 1;
    if ((a2 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  int v2 = 0;
  if ((a2 & 0x100) != 0) {
LABEL_7:
  }
    v7[v2++] = 82;
LABEL_8:
  if ((a2 & 0x80) != 0)
  {
    v7[v2++] = 78;
    if ((a2 & 0x20) == 0)
    {
LABEL_10:
      if ((a2 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }

  else if ((a2 & 0x20) == 0)
  {
    goto LABEL_10;
  }

  if ((a2 & 0x40) != 0)
  {
    v7[v2++] = 83;
LABEL_16:
    v7[v2++] = 90;
    goto LABEL_17;
  }

  v7[v2++] = 65;
LABEL_17:
  int v3 = a2 & 7;
  char v4 = 61;
  int v5 = v2;
  switch(a2 & 7)
  {
    case 1:
      goto LABEL_28;
    case 2:
      char v4 = 62;
      goto LABEL_27;
    case 3:
      int v5 = v2 + 1;
      char v6 = 62;
      goto LABEL_24;
    case 4:
      char v4 = 60;
      goto LABEL_27;
    case 5:
      int v5 = v2 + 1;
      char v6 = 60;
LABEL_24:
      v7[v2] = v6;
      char v4 = 61;
      int v3 = 2;
      goto LABEL_28;
    case 6:
      char v4 = 33;
      goto LABEL_27;
    case 7:
      char v4 = 84;
LABEL_27:
      int v3 = 1;
      int v5 = v2;
LABEL_28:
      v2 += v3;
      v7[v5] = v4;
      break;
    default:
      if (!v2) {
        return asl_string_append_char_no_encoding(result, 46);
      }
      break;
  }

  v7[v2] = 0;
  return asl_string_append_no_encoding_len(result, v7, 0LL);
}

void *asl_string_append_xml_tag(void *a1, char *a2, char *a3)
{
  appended = asl_string_append_no_encoding_len(a1, "\t\t<", 3uLL);
  char v6 = asl_string_append_no_encoding_len(appended, a2, 0LL);
  uint64_t v7 = asl_string_append_char_no_encoding(v6, 62);
  uint64_t v8 = (void *)asl_string_append_internal((uint64_t)v7, a3, 0);
  unsigned __int8 v9 = asl_string_append_no_encoding_len(v8, "</", 2uLL);
  __int16 v10 = asl_string_append_no_encoding_len(v9, a2, 0LL);
  return asl_string_append_no_encoding_len(v10, ">\n", 2uLL);
}

void _asl_redirect_fork_child()
{
  if (redirect_descriptors)
  {
    free((void *)redirect_descriptors);
    n_redirect_descriptors = 0;
    redirect_descriptors = 0LL;
  }

int asl_log_descriptor(asl_object_t asl, asl_object_t msg, int level, int descriptor, uint32_t fd_type)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int16 v10 = __error();
  if (fd_type == 1) {
    return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, descriptor);
  }
  if (fd_type != 2) {
    asl_log_descriptor_cold_1();
  }
  int v12 = *v10;
  if (pipe(v14) != -1 && fcntl(v14[0], 2, 1LL) != -1)
  {
    if (dup2(v14[1], descriptor) != -1)
    {
      if (descriptor == 1) {
        setlinebuf((FILE *)*MEMORY[0x1895FEE18]);
      }
      close(v14[1]);
      return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, v14[0]);
    }

    close(v14[0]);
    close(v14[1]);
  }

  int v13 = *__error();
  *__error() = v12;
  return v13;
}

uint64_t asl_log_from_descriptor(uint64_t a1, int *obj, int a3, int a4)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  int v16 = 0;
  if (asl_log_from_descriptor_once_control != -1)
  {
    dispatch_once_f(&asl_log_from_descriptor_once_control, 0LL, (dispatch_function_t)asl_descriptor_init);
    if ((a4 & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v8 = 9LL;
    goto LABEL_11;
  }

  if (a4 < 0) {
    goto LABEL_10;
  }
LABEL_3:
  if (obj && (obj = asl_msg_copy((asl_object_t)obj)) == 0LL)
  {
    uint64_t v8 = 12LL;
  }

  else
  {
    v10[0] = MEMORY[0x1895FED80];
    v10[1] = 0x40000000LL;
    v10[2] = __asl_log_from_descriptor_block_invoke;
    v10[3] = &unk_189625A20;
    int v11 = a4;
    int v12 = a3;
    v10[4] = &v13;
    v10[5] = a1;
    v10[6] = obj;
    dispatch_sync((dispatch_queue_t)redirect_serial_q, v10);
    if (*((_DWORD *)v14 + 6))
    {
      asl_msg_release((asl_object_t)obj);
      uint64_t v8 = *((unsigned int *)v14 + 6);
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

LABEL_11:
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t asl_descriptor_init()
{
  redirect_descriptors = (uint64_t)calloc(0x10uLL, 0x30uLL);
  if (!redirect_descriptors) {
    asl_descriptor_init_cold_1();
  }
  n_redirect_descriptors = 16;
  redirect_serial_q = (uint64_t)dispatch_queue_create("com.apple.asl-redirect", 0LL);
  if (!redirect_serial_q) {
    asl_descriptor_init_cold_2();
  }
  read_source_uuid_t group = (uint64_t)dispatch_group_create();
  if (!read_source_group) {
    asl_descriptor_init_cold_3();
  }
  return atexit((void (*)(void))redirect_atexit);
}

void __asl_log_from_descriptor_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= n_redirect_descriptors)
  {
    int v4 = 1 << (fls(*(_DWORD *)(a1 + 56)) + 1);
    int v5 = (char *)realloc((void *)redirect_descriptors, 48LL * v4);
    if (!v5) {
      goto LABEL_9;
    }
    uint64_t v3 = (uint64_t)v5;
    redirect_descriptors = (uint64_t)v5;
    bzero(&v5[48 * n_redirect_descriptors], 48 * (v4 - (uint64_t)n_redirect_descriptors));
    n_redirect_descriptors = v4;
    int v2 = *(_DWORD *)(a1 + 56);
  }

  else
  {
    uint64_t v3 = redirect_descriptors;
  }

  uint64_t v6 = v3 + 48LL * v2;
  uint64_t v8 = *(void *)(v6 + 24);
  uint64_t v7 = (void *)(v6 + 24);
  if (v8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 9;
    return;
  }

  unsigned __int8 v9 = malloc(0x200uLL);
  *uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = v3 + 48LL * v2;
    *(void *)(v10 + 32) = v9;
    *(_DWORD *)uint64_t v10 = *(_DWORD *)(a1 + 60);
    asl_object_t v11 = asl_client_retain(*(asl_object_t *)(a1 + 40));
    int v12 = *(_DWORD *)(a1 + 56);
    uint64_t v13 = redirect_descriptors + 48LL * v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(v13 + 16) = *(void *)(a1 + 48);
    fcntl(v12, 4, 4LL);
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1895FE828], *(int *)(a1 + 56), 0LL, (dispatch_queue_t)redirect_serial_q);
    *(void *)(redirect_descriptors + 48LL * *(int *)(a1 + 56) + 40) = v14;
    dispatch_set_context(v14, v14);
    dispatch_source_set_event_handler_f(v14, (dispatch_function_t)read_from_source);
    dispatch_source_set_cancel_handler_f(v14, (dispatch_function_t)cancel_source);
    dispatch_group_enter((dispatch_group_t)read_source_group);
    dispatch_resume(v14);
    return;
  }

LABEL_9:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
}

void read_from_source(dispatch_source_s *a1)
{
  int handle = dispatch_source_get_handle(a1);
}

void cancel_source(dispatch_source_s *a1)
{
  int handle = dispatch_source_get_handle(a1);
  uint64_t v3 = redirect_descriptors + 48LL * handle;
  _read_redirect(handle, 1);
  close(handle);
  asl_client_release(*(asl_object_t *)(v3 + 8));
  asl_msg_release(*(asl_object_t *)(v3 + 16));
  free(*(void **)(v3 + 24));
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  dispatch_release(a1);
  dispatch_group_leave((dispatch_group_t)read_source_group);
}

uint64_t redirect_atexit()
{
  int v0 = n_redirect_descriptors;
  if (n_redirect_descriptors <= 1)
  {
LABEL_4:
    if (v0 < 1) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }

  if (*(void *)(redirect_descriptors + 72))
  {
    fflush((FILE *)*MEMORY[0x1895FEE18]);
    int v0 = n_redirect_descriptors;
    goto LABEL_4;
  }

uint64_t _read_redirect(int a1, int a2)
{
  uint64_t v3 = redirect_descriptors;
  uint64_t v4 = redirect_descriptors + 48LL * a1;
  int v5 = (const char **)(v4 + 32);
  uint64_t v7 = (void **)(v4 + 24);
  ssize_t v8 = read(a1, *(void **)(v4 + 32), *(void *)(v4 + 24) - *(void *)(v4 + 32) + 511LL);
  int v20 = a1;
  uint64_t v21 = v3;
  if (v8 < 1)
  {
    unsigned int v10 = 0;
  }

  else
  {
    uint64_t v9 = v3 + 48LL * a1;
    unsigned int v10 = 0;
    asl_object_t v11 = (asl_object_t *)(v9 + 8);
    int v12 = (asl_object_t *)(v9 + 16);
    do
    {
      uint64_t v13 = &(*v5)[v8];
      *int v5 = v13;
      *uint64_t v13 = 0;
      dispatch_source_t v14 = (const char *)*v7;
      uint64_t v15 = (char *)*v5;
      if (*v7 >= *v5)
      {
        int v17 = (char *)*v7;
      }

      else
      {
        unsigned int v22 = v10;
        while (1)
        {
          uint64_t v16 = 0LL;
          int v17 = (char *)v14;
          while (v14[v16])
          {
            if (v14[v16] == 10)
            {
              v14[v16] = 0;
              uint64_t v15 = (char *)*v5;
              break;
            }

            ++v16;
          }

          int v18 = &v14[v16];
          if (&v14[v16] >= v15 && *v7 != v14) {
            break;
          }
          asl_log(*v11, *v12, *(_DWORD *)v4, "%s", v14);
          dispatch_source_t v14 = v18 + 1;
          uint64_t v15 = (char *)*v5;
          if (v18 + 1 >= *v5)
          {
            dispatch_source_t v14 = (const char *)*v7;
            v17 += v16 + 1;
            goto LABEL_16;
          }
        }

        memmove(*v7, v14, (_BYTE *)*v7 - v14 + 512);
        dispatch_source_t v14 = (const char *)*v7;
        uint64_t v15 = (char *)*v7 + v16;
        *int v5 = v15;
LABEL_16:
        unsigned int v10 = v22;
      }

      if (v17 == v15)
      {
        *int v5 = v14;
        uint64_t v15 = (char *)v14;
      }

      v10 += v8;
      ssize_t v8 = read(a1, v15, v14 - v15 + 511);
    }

    while (v8 > 0);
  }

  if ((a2 || !v8) && *v5 > *v7)
  {
    **int v5 = 0;
    asl_log( *(asl_object_t *)(v21 + 48LL * v20 + 8),  *(asl_object_t *)(v21 + 48LL * v20 + 16),  *(_DWORD *)v4,  "%s",  (const char *)*v7);
  }

  if (v8) {
    return v10;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

double asl_msg_list_new()
{
  int v0 = calloc(1uLL, 0x18uLL);
  if (v0)
  {
    *(void *)&double result = 0x100000002LL;
    *int v0 = 0x100000002LL;
  }

  return result;
}

void *asl_msg_list_new_count(unsigned int a1)
{
  uint64_t v2 = calloc(1uLL, 0x18uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)uint64_t v2 = 0x100000002LL;
    *((_DWORD *)v2 + 2) = a1;
    uint64_t v4 = reallocf(*((void **)v2 + 2), 8LL * a1);
    v3[2] = v4;
    if (!v4)
    {
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

asl_object_t asl_msg_list_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_msg_list_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

char *asl_msg_list_to_string(char *result, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (result)
  {
    uint64_t v2 = result;
    if (*((_DWORD *)result + 2) && *((void *)result + 2))
    {
      double result = (char *)asl_string_new(2);
      if (result)
      {
        uint64_t v4 = result;
        snprintf(__str, 0x10uLL, "%u", *((_DWORD *)v2 + 2));
        asl_string_append((uint64_t)v4, __str);
        asl_string_append_char_no_encoding(v4, 10);
        if (*((_DWORD *)v2 + 2))
        {
          unint64_t v5 = 0LL;
          do
          {
            asl_string_append_asl_msg(v4, *(_DWORD **)(*((void *)v2 + 2) + 8 * v5));
            asl_string_append_char_no_encoding(v4, 10);
            ++v5;
          }

          while (v5 < *((unsigned int *)v2 + 2));
        }

        *a2 = asl_string_length((uint64_t)v4);
        return asl_string_release_return_bytes(v4);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void *asl_msg_list_to_asl_string(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (!a1 || !*(_DWORD *)(a1 + 8) || !*(void *)(a1 + 16)) {
    return 0LL;
  }
  uint64_t v3 = asl_string_new(a2);
  if (v3)
  {
    snprintf(__str, 0x10uLL, "%u", *(_DWORD *)(a1 + 8));
    asl_string_append((uint64_t)v3, __str);
    asl_string_append_char_no_encoding(v3, 10);
    if (*(_DWORD *)(a1 + 8))
    {
      unint64_t v4 = 0LL;
      do
      {
        asl_string_append_asl_msg(v3, *(_DWORD **)(*(void *)(a1 + 16) + 8 * v4));
        asl_string_append_char_no_encoding(v3, 10);
        ++v4;
      }

      while (v4 < *(unsigned int *)(a1 + 8));
    }
  }

  return v3;
}

__asl_object_s *asl_msg_list_from_string(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  int v2 = atoi(a1);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  unint64_t v4 = (__asl_object_s *)calloc(1uLL, 0x18uLL);
  unint64_t v5 = v4;
  if (v4)
  {
    *(void *)unint64_t v4 = 0x100000002LL;
    while (1)
    {
      dispatch_time_t v6 = strchr(v1, 10);
      if (!v6) {
        break;
      }
      uint64_t v1 = v6 + 1;
      uint64_t v7 = asl_msg_from_string((uint64_t)(v6 + 1));
      if (!v7) {
        break;
      }
      ssize_t v8 = v7;
      asl_msg_list_insert((uint64_t)v5, 0xFFFFFFFF, v7);
      asl_msg_release(v8);
      if (!--v3) {
        return v5;
      }
    }

    asl_release(v5);
    return 0LL;
  }

  return v5;
}

void asl_msg_list_append(uint64_t a1, asl_object_t obj)
{
}

void asl_msg_list_insert(uint64_t a1, unsigned int a2, asl_object_t obj)
{
  if (a1)
  {
    if (obj)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 8);
      if (v5 != -1)
      {
        if (v5 >= a2) {
          unsigned int v6 = a2;
        }
        else {
          unsigned int v6 = *(_DWORD *)(a1 + 8);
        }
        uint32_t type = asl_get_type(obj);
        if (type >= 2)
        {
          unsigned int v8 = asl_object_count(obj);
          if (!v8) {
            return;
          }
        }

        else
        {
          unsigned int v8 = 1;
        }

        uint64_t v9 = *(unsigned int *)(a1 + 8);
        if (!((v9 + (unint64_t)v8) >> 32))
        {
          unsigned int v10 = reallocf(*(void **)(a1 + 16), 8LL * (v9 + v8));
          *(void *)(a1 + 16) = v10;
          if (v10)
          {
            uint64_t v11 = *(unsigned int *)(a1 + 8);
            if (v11 > v6)
            {
              uint64_t v12 = 8 * v11;
              uint64_t v13 = 8LL * (v11 - 1);
              do
              {
                *(void *)(*(void *)(a1 + 16) + v12) = *(void *)(*(void *)(a1 + 16) + v13);
                v12 -= 8LL;
                v13 -= 8LL;
                LODWORD(v11) = v11 - 1;
              }

              while (v6 < v11);
            }

            asl_object_set_iteration_index(obj, 0LL);
            if (type >= 2)
            {
              unsigned int v14 = v8;
              do
              {
                *(void *)(*(void *)(a1 + 16) + 8LL * v6++) = asl_object_next(obj);
                --v14;
              }

              while (v14);
            }

            else
            {
              *(void *)(*(void *)(a1 + 16) + 8LL * v6) = asl_retain(obj);
            }

            asl_object_set_iteration_index(obj, 0LL);
            *(_DWORD *)(a1 + 8) += v8;
          }

          else
          {
            *(void *)(a1 + 8) = 0LL;
          }
        }
      }
    }
  }

void asl_msg_list_prepend(uint64_t a1, asl_object_t obj)
{
}

uint64_t asl_msg_list_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t asl_msg_list_get_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0LL;
    }

    else
    {
      uint64_t v3 = *(void *)(result + 16);
      if (v3)
      {
        return *(void *)(v3 + 8 * a2);
      }

      else
      {
        double result = 0LL;
        *(void *)(v2 + 8) = 0LL;
      }
    }
  }

  return result;
}

void *asl_msg_list_remove_index(void *result, unint64_t a2)
{
  if (result)
  {
    unsigned int v2 = a2;
    uint64_t v3 = result;
    if (*((unsigned int *)result + 2) > a2)
    {
      uint64_t v4 = result[2];
      if (!v4) {
        goto LABEL_8;
      }
      asl_msg_release(*(asl_object_t *)(v4 + 8 * a2));
      unsigned int v5 = *((_DWORD *)v3 + 2);
      if (v2 + 1 < v5)
      {
        uint64_t v6 = 8LL * (v2 + 1);
        unsigned int v7 = ~v2 + v5;
        do
        {
          *(void *)(v3[2] + 8LL * v2) = *(void *)(v3[2] + v6);
          v6 += 8LL;
          --v7;
        }

        while (v7);
      }

      unsigned int v8 = v5 - 1;
      *((_DWORD *)v3 + 2) = v8;
      double result = reallocf((void *)v3[2], 8LL * v8);
      v3[2] = result;
      if (!result) {
LABEL_8:
      }
        v3[1] = 0LL;
    }
  }

  return result;
}

uint64_t asl_msg_list_next(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(unsigned int *)(a1 + 12);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
  }

  return v2;
}

uint64_t asl_msg_list_prev(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 12);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8)) {
      unsigned int v1 = *(_DWORD *)(a1 + 8);
    }
    unsigned int v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(void *)(v2 + 8LL * v3);
  }

  else
  {
    uint64_t v4 = 0LL;
    *(void *)(a1 + 8) = 0LL;
  }

  return v4;
}

uint64_t asl_msg_list_reset_iteration(uint64_t result, unint64_t a2)
{
  if (result)
  {
    else {
      int v2 = a2;
    }
    *(_DWORD *)(result + 12) = v2;
  }

  return result;
}

uint64_t asl_msg_list_search(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 0LL;
  }
  if (!*(void *)(a1 + 16))
  {
    uint64_t v5 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    return v5;
  }

  if (!*(_DWORD *)(a1 + 8)) {
    return 0LL;
  }
  unint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    if (!a2 || asl_msg_cmp(a2, *(_DWORD **)(*(void *)(a1 + 16) + 8 * v4)))
    {
      if (!v5)
      {
        uint64_t v6 = calloc(1uLL, 0x18uLL);
        uint64_t v5 = (uint64_t)v6;
        if (!v6) {
          return v5;
        }
        void *v6 = 0x100000002LL;
      }

      asl_msg_list_insert(v5, 0xFFFFFFFF, *(asl_object_t *)(*(void *)(a1 + 16) + 8 * v4));
    }

    ++v4;
  }

  while (v4 < *(unsigned int *)(a1 + 8));
  return v5;
}

uint64_t asl_msg_list_match( uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  if (!a1) {
    return 0LL;
  }
  if (*(void *)(a1 + 16))
  {
    v26.__darwin_time_t tv_sec = 0LL;
    *(void *)&v26.tv_usec = 0LL;
    if (a6 && !gettimeofday(&v26, 0LL))
    {
      unsigned int v15 = v26.tv_usec + a6 % 0xF4240;
      BOOL v16 = v15 > 0xF4240;
      if (v15 > 0xF4240) {
        v15 -= 1000000;
      }
      __darwin_suseconds_t v24 = v15;
      if (v16) {
        __darwin_time_t v13 = v26.tv_sec + a6 / 0xF4240uLL + 1;
      }
      else {
        __darwin_time_t v13 = v26.tv_sec + a6 / 0xF4240uLL;
      }
    }

    else
    {
      __darwin_suseconds_t v24 = 0;
      __darwin_time_t v13 = 0LL;
    }

    unint64_t v17 = *(unsigned int *)(a1 + 8);
    int v18 = v17 - 1;
    if (a7 < 0)
    {
      if (v17 <= a4) {
        LODWORD(a4) = v17 - 1;
      }
      int v19 = -1;
      int v18 = 0;
      goto LABEL_18;
    }

    if (v17 > a4)
    {
      int v19 = 1;
LABEL_18:
      unsigned int v20 = 0;
      uint64_t v14 = 0LL;
      while (!a2)
      {
        int v21 = 1;
        if (a3) {
          goto LABEL_21;
        }
LABEL_22:
        if (v21)
        {
          if (!v14)
          {
            unsigned int v22 = calloc(1uLL, 0x18uLL);
            uint64_t v14 = (uint64_t)v22;
            if (!v22) {
              return v14;
            }
            *unsigned int v22 = 0x100000002LL;
          }

          asl_msg_list_insert(v14, 0xFFFFFFFF, *(asl_object_t *)(*(void *)(a1 + 16) + 8LL * a4));
          ++v20;
        }

        if (v20 >= a5
          || v13 && !gettimeofday(&v27, 0LL) && (v27.tv_sec > v13 || v27.tv_sec == v13 && v27.tv_usec > v24))
        {
          return v20;
        }

        LODWORD(a4) = a4 + v19;
        if (v18 == (_DWORD)a4) {
          return v14;
        }
      }

      int v21 = asl_msg_cmp_list(*(void *)(*(void *)(a1 + 16) + 8LL * a4), a2);
      if (!a3) {
        goto LABEL_22;
      }
LABEL_21:
      *a3 = a4;
      goto LABEL_22;
    }

    if (a3)
    {
      uint64_t v14 = 0LL;
      *a3 = v17;
      return v14;
    }

    return 0LL;
  }

  uint64_t v14 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  return v14;
}

uint64_t (**asl_msg_list_jump_table())()
{
  return &asl_msg_list_jump_table_jump;
}

double _jump_alloc()
{
  int v0 = calloc(1uLL, 0x18uLL);
  if (v0)
  {
    *(void *)&double result = 0x100000002LL;
    *int v0 = 0x100000002LL;
  }

  return result;
}

void _jump_dealloc_0(void *a1)
{
  if (a1)
  {
    int v2 = (void *)a1[2];
    if (v2)
    {
      if (*((_DWORD *)a1 + 2))
      {
        unint64_t v3 = 0LL;
        do
          asl_msg_release(*(asl_object_t *)(a1[2] + 8 * v3++));
        while (v3 < *((unsigned int *)a1 + 2));
        int v2 = (void *)a1[2];
      }

      free(v2);
    }

    free(a1);
  }

uint64_t _jump_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t _jump_next(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(unsigned int *)(a1 + 12);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
  }

  return v2;
}

uint64_t _jump_prev(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 12);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8)) {
      unsigned int v1 = *(_DWORD *)(a1 + 8);
    }
    unsigned int v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(void *)(v2 + 8LL * v3);
  }

  else
  {
    uint64_t v4 = 0LL;
    *(void *)(a1 + 8) = 0LL;
  }

  return v4;
}

uint64_t _jump_get_object_at_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0LL;
    }

    else
    {
      uint64_t v3 = *(void *)(result + 16);
      if (v3)
      {
        return *(void *)(v3 + 8 * a2);
      }

      else
      {
        double result = 0LL;
        *(void *)(v2 + 8) = 0LL;
      }
    }
  }

  return result;
}

uint64_t _jump_set_iteration_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    else {
      int v2 = a2;
    }
    *(_DWORD *)(result + 12) = v2;
  }

  return result;
}

void _jump_append_0(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1) {
    asl_msg_list_insert(a1, 0xFFFFFFFF, obj);
  }
}

void _jump_prepend(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1) {
    asl_msg_list_insert(a1, 0, obj);
  }
}

uint64_t _jump_search_0(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  if (obj && type >= 2) {
    return 0LL;
  }
  else {
    return asl_msg_list_search(a1, obj);
  }
}

uint64_t _jump_match_0( uint64_t a1, asl_object_t obj, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  uint32_t type = asl_get_type(obj);
  if (!obj || type == 2) {
    return asl_msg_list_match(a1, (uint64_t)obj, a3, a4, a5, a6, a7);
  }
  else {
    return 0LL;
  }
}

asl_object_t asl_file_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_file_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_file_close(__asl_object_s *a1)
{
  if (a1) {
    asl_release(a1);
  }
  return 0LL;
}

uint64_t asl_file_open_write_fd(int a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  uint64_t result = 9999LL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uint64_t v5 = calloc(1uLL, 0x80uLL);
    if (v5)
    {
      uint64_t v6 = v5;
      *uint64_t v5 = 0x100000003LL;
      unsigned int v7 = fdopen(a1, "w+");
      v6[13] = v7;
      if (v7)
      {
        __int128 v13 = 0u;
        memset(v16, 0, sizeof(v16));
        __int128 v15 = 0u;
        __int128 v14 = 0u;
        qmemcpy(__ptr, "ASL DB", sizeof(__ptr));
        *(_DWORD *)((char *)&v13 + 6) = 0x2000000;
        time_t v8 = time(0LL);
        v6[11] = v8;
        *(void *)((char *)&v14 + 2) = asl_core_htonq(v8);
        *(_DWORD *)((char *)&v14 + 10) = 0x80000000;
        int v9 = fwrite(__ptr, 0x50uLL, 1uLL, (FILE *)v6[13]);
        unsigned int v10 = (FILE *)v6[13];
        if (v9 == 1)
        {
          fflush(v10);
          v6[12] = 80LL;
          uint64_t v11 = malloc(0x11AuLL);
          uint64_t result = 0LL;
          v6[15] = v11;
          *a2 = v6;
          return result;
        }

        fclose(v10);
      }

      free(v6);
      return 9999LL;
    }

    else
    {
      return 9LL;
    }
  }

  return result;
}

uint64_t asl_file_create(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return open(a1, 2562, a4);
}

uint64_t asl_file_open_write(const char *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  memset(&v21, 0, sizeof(v21));
  if (!stat(a1, &v21))
  {
    if ((v21.st_mode & 0xF000) != 0x8000) {
      return 2LL;
    }
    if (v21.st_size)
    {
      unsigned int v10 = calloc(1uLL, 0x80uLL);
      if (!v10) {
        return 9LL;
      }
      uint64_t v11 = (uint64_t)v10;
      *unsigned int v10 = 0x100000003LL;
      uint64_t v12 = fopen(a1, "r+");
      *(void *)(v11 + 104) = v12;
      if (v12)
      {
        BOOL v13 = __ptr == 541872961 && v23 == 16964;
        if (v13 && v24 == 0x2000000)
        {
          *(void *)(v11 + 88) = asl_core_ntohq(v26);
          *(void *)(v11 + 40) = asl_core_ntohq(v25);
          unint64_t v14 = asl_core_ntohq(v27);
          *(void *)(v11 + 48) = v14;
          unint64_t st_size = v21.st_size;
          *(void *)(v11 + 96) = v21.st_size;
          if (v14 + 122 > st_size)
          {
LABEL_18:
            *(void *)(v11 + 48) = 0LL;
LABEL_19:
            if (*(_DWORD *)(v11 + 12) == 1)
            {
              uint64_t set_position_last = 9999LL;
LABEL_32:
              asl_release((asl_object_t)v11);
              return set_position_last;
            }

            uint64_t set_position_last = asl_file_read_set_position_last(v11, 0);
            if ((_DWORD)set_position_last) {
              goto LABEL_32;
            }
            *(void *)(v11 + 64) = *(void *)(v11 + 72);
            if (!fseeko(*(FILE **)(v11 + 104), 0LL, 2))
            {
              *(void *)(v11 + 96) = ftello(*(FILE **)(v11 + 104));
              uint64_t set_position_last = 0LL;
              *(void *)(v11 + 120) = malloc(0x11AuLL);
              *a5 = v11;
              return set_position_last;
            }

LABEL_38:
            asl_release((asl_object_t)v11);
            return 7LL;
          }

          uint64_t uint64 = asl_file_read_uint32(v11, v14 + 2, &v20);
          if (!(_DWORD)uint64)
          {
            uint64_t v19 = *(void *)(v11 + 48);
            if (!v19) {
              goto LABEL_19;
            }
            uint64_t uint64 = asl_file_read_uint64(v11, v19 + 14, (unint64_t *)(v11 + 56));
          }

          uint64_t set_position_last = uint64;
          goto LABEL_32;
        }

        asl_release((asl_object_t)v11);
        return 2LL;
      }

      free((void *)v11);
    }

    else
    {
      int v16 = open(a1, 2050, a2);
      if ((v16 & 0x80000000) == 0) {
        return asl_file_open_write_fd(v16, a5);
      }
    }

    return 9999LL;
  }

  if (*__error() != 2) {
    return 9999LL;
  }
  int v8 = open(a1, 2562, a2);
  if (v8 < 0) {
    return 9999LL;
  }
  uint64_t set_position_last = asl_file_open_write_fd(v8, a5);
  if ((_DWORD)set_position_last) {
    unlink(a1);
  }
  return set_position_last;
}

uint64_t asl_file_read_uint32(uint64_t a1, off_t a2, _DWORD *a3)
{
  uint64_t v4 = *(FILE **)(a1 + 104);
  if (!v4) {
    return 2LL;
  }
  if (fseeko(v4, a2, 0)) {
    return 7LL;
  }
  unsigned int __ptr = 0;
  uint64_t result = 0LL;
  if (a3) {
    *a3 = bswap32(__ptr);
  }
  return result;
}

uint64_t asl_file_read_uint64(uint64_t a1, off_t a2, unint64_t *a3)
{
  uint64_t v4 = *(FILE **)(a1 + 104);
  if (!v4) {
    return 2LL;
  }
  if (fseeko(v4, a2, 0)) {
    return 7LL;
  }
  unint64_t __ptr = 0LL;
  if (!a3) {
    return 0LL;
  }
  unint64_t v6 = asl_core_ntohq(__ptr);
  uint64_t result = 0LL;
  *a3 = v6;
  return result;
}

uint64_t asl_file_read_set_position(uint64_t a1, int a2)
{
  if (!a1) {
    return 2LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  switch(a2)
  {
    case 3:
      return asl_file_read_set_position_last(a1, 0);
    case 0:
      *(void *)(a1 + 80) = 0LL;
      uint64_t v5 = *(void *)(a1 + 40);
      *(void *)(a1 + 72) = v5;
      if (v5) {
        return asl_file_read_uint64(a1, v5 + 14, (unint64_t *)(a1 + 80));
      }
      else {
        return 0LL;
      }
    case 1:
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t result = 14LL;
      if (v6)
      {
        if (v6 != *(void *)(a1 + 40))
        {
          uint64_t result = asl_file_read_uint32(a1, v6 + 2, &v11);
          if (!(_DWORD)result)
          {
            off_t v7 = *(void *)(a1 + 72) + v11 - 2LL;
            goto LABEL_20;
          }
        }
      }

      break;
    case 2:
      uint64_t v8 = *(void *)(a1 + 72);
      uint64_t result = 14LL;
      if (v8 && v8 != *(void *)(a1 + 48))
      {
        off_t v7 = v8 + 6;
LABEL_20:
        *(void *)(a1 + 80) = 0LL;
        unint64_t v12 = 0LL;
        unint64_t v9 = v12;
        if (v12 + 122 > *(void *)(a1 + 96)) {
          goto LABEL_25;
        }
        unint64_t v10 = *(void *)(a1 + 72);
        if (a2 == 1)
        {
          if (v12 < v10)
          {
            *(void *)(a1 + 72) = v12;
            if (!v9) {
              return 14LL;
            }
            return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
          }
        }

        else if (v12 > v10)
        {
          *(void *)(a1 + 72) = v12;
          return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
        }

LABEL_25:
        *(void *)(a1 + 72) = 0LL;
        return 14LL;
      }

      break;
    default:
      return 1LL;
  }

  return result;
}

uint64_t asl_file_compact(uint64_t a1, char *a2, unsigned int a3)
{
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  memset(&v14, 0, sizeof(v14));
  if (!stat(a2, &v14) || *__error() != 2) {
    return 9999LL;
  }
  uint64_t set_position = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)set_position)
  {
    __int128 v15 = 0LL;
    uint64_t set_position = asl_file_open_write(a2, a3, v6, v7, (uint64_t *)&v15);
    if (!(_DWORD)set_position)
    {
      *((_DWORD *)v15 + 2) = 12;
      while (1)
      {
        unint64_t v9 = *(void *)(a1 + 72);
        if (!v9)
        {
          uint64_t set_position = 0LL;
          goto LABEL_21;
        }

        BOOL v13 = 0LL;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          uint64_t set_position = 9999LL;
          goto LABEL_21;
        }

        uint64_t pos = asl_file_fetch_pos(a1, v9, 1, (int **)&v13);
        if ((_DWORD)pos) {
          break;
        }
        uint64_t v12 = 0LL;
        uint64_t set_position = asl_file_save((uint64_t)v15, v13, &v12);
        asl_msg_release(v13);
        if ((_DWORD)set_position) {
          goto LABEL_21;
        }
      }

      uint64_t set_position = pos;
LABEL_21:
      if (v15) {
        asl_release(v15);
      }
    }
  }

  return set_position;
}

uint64_t asl_file_fetch_next(uint64_t a1, int **a2)
{
  if (!a1) {
    return 2LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  return asl_file_fetch_pos(a1, *(void *)(a1 + 72), 1, a2);
}

uint64_t asl_file_save(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  uint64_t v48 = *MEMORY[0x1895FEE08];
  if (!a1 || !*(void *)(a1 + 104)) {
    return 2LL;
  }
  if (!a2) {
    return 5LL;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) != 0) {
    return 11LL;
  }
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  int8x16_t v41 = 0u;
  unint64_t v38 = 0LL;
  uint64_t v39 = -1LL;
  if (a3 && *a3) {
    uint64_t v39 = *a3;
  }
  int8x16_t v41 = (int8x16_t)xmmword_18013AAA0;
  LODWORD(v42) = -1;
  *(void *)&__int128 v40 = 0LL;
  *((void *)&v40 + 1) = 0x700000000LL;
  unint64_t v46 = *(void *)(a1 + 64);
  __s = 0LL;
  __s1 = 0LL;
  unsigned int v6 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0LL);
  if (v6 != -1)
  {
    unsigned int v7 = v6;
    unint64_t __ptr = 0LL;
    uint64_t v8 = (unint64_t *)__src;
    while (1)
    {
      unint64_t v9 = __s1;
      if (!__s1) {
        goto LABEL_44;
      }
      if (!strcmp(__s1, "Time"))
      {
        if (__s) {
          *(void *)&__int128 v40 = asl_core_parse_time(__s, 0LL);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "TimeNanoSec"))
      {
        if (__s) {
          DWORD2(v40) = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "Host"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v43;
        goto LABEL_43;
      }

      if (!strcmp(v9, "Sender"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v43 + 1;
        goto LABEL_43;
      }

      if (!strcmp(v9, "PID"))
      {
        if (__s) {
          v41.i32[0] = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "RefPID"))
      {
        if (__s) {
          DWORD1(v42) = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "UID"))
      {
        if (__s) {
          v41.i32[1] = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "GID"))
      {
        if (__s) {
          v41.i32[2] = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "Level"))
      {
        if (__s) {
          WORD6(v40) = atoi(__s);
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "Message"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v44 + 1;
        goto LABEL_43;
      }

      if (!strcmp(v9, "Facility"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v44;
        goto LABEL_43;
      }

      if (!strcmp(v9, "RefProc")) {
        break;
      }
      if (!strcmp(v9, "Session"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v45 + 1;
LABEL_43:
        uint64_t v10 = asl_file_string_encode(v13, v12, v14);
        if ((_DWORD)v10) {
          goto LABEL_102;
        }
        goto LABEL_44;
      }

      if (!strcmp(v9, "ReadUID"))
      {
        __int16 v15 = HIWORD(v40);
        if ((BYTE14(v40) & 1) != 0 || !__s) {
          goto LABEL_44;
        }
        v41.i32[3] = atoi(__s);
        __int16 v16 = v15 | 1;
LABEL_70:
        HIWORD(v40) = v16;
        goto LABEL_44;
      }

      if (!strcmp(v9, "ReadGID"))
      {
        __int16 v17 = HIWORD(v40);
        if ((BYTE14(v40) & 2) != 0 || !__s) {
          goto LABEL_44;
        }
        LODWORD(v42) = atoi(__s);
        __int16 v16 = v17 | 2;
        goto LABEL_70;
      }

      if (!strcmp(v9, "ASLMessageID"))
      {
        if ((*(_BYTE *)(a1 + 8) & 8) != 0)
        {
          uint64_t v18 = atoll(__s);
          uint64_t v39 = v18;
          if (a3) {
            *a3 = v18;
          }
        }
      }

      else if (strcmp(v9, "ASLOption"))
      {
        uint64_t v10 = asl_file_string_encode(a1, v9, &v37);
        if ((_DWORD)v10 || (v36 = 0LL, __s) && (uint64_t v10 = asl_file_string_encode(a1, __s, &v36), (_DWORD)v10))
        {
LABEL_102:
          uint64_t v19 = v10;
          free(__ptr);
          return v19;
        }

        unsigned int v11 = DWORD2(v42);
        if (DWORD2(v42) >= 0x80)
        {
          unint64_t __ptr = reallocf(__ptr, 8LL * (DWORD2(v42) + 2));
          if (!__ptr) {
            return 9LL;
          }
          unsigned int v11 = DWORD2(v42);
          uint64_t v8 = (unint64_t *)__ptr;
          if (DWORD2(v42) == 128)
          {
            memcpy(__ptr, __src, 0x400uLL);
            unsigned int v11 = 128;
          }
        }

        v8[v11] = v37;
        DWORD2(v42) = v11 + 2;
        v8[v11 + 1] = v36;
      }

uint64_t asl_file_filter( uint64_t a1, char *a2, uint64_t a3, char a4, unsigned int a5, int a6, int a7, _DWORD *a8, void (*a9)(int *))
{
  uint64_t v23 = 0LL;
  if (a8) {
    *a8 = 0;
  }
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2) {
    return 9999LL;
  }
  uint64_t set_position = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)set_position)
  {
    unint64_t v26 = 0LL;
    uint64_t set_position = asl_file_open_write(a2, a5, v15, v16, (uint64_t *)&v26);
    if (!(_DWORD)set_position)
    {
      int v18 = 0;
      *((_DWORD *)v26 + 2) = 12;
      while (1)
      {
        unint64_t v19 = *(void *)(a1 + 72);
        if (!v19)
        {
          uint64_t set_position = 0LL;
          goto LABEL_31;
        }

        int v24 = 0LL;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          uint64_t set_position = 9999LL;
          goto LABEL_31;
        }

        uint64_t pos = asl_file_fetch_pos(a1, v19, 1, &v24);
        if ((_DWORD)pos) {
          break;
        }
        if ((a4 & 1) == (asl_msg_cmp_list((uint64_t)v24, a3) == 0))
        {
          if (a9)
          {
            val_for_key = asl_msg_get_val_for_key(v24, "ASLAuxURL");
            if (val_for_key) {
              a9(val_for_key);
            }
          }

          uint64_t set_position = 0LL;
        }

        else
        {
          uint64_t set_position = asl_file_save((uint64_t)v26, v24, &v23);
          if (!(_DWORD)set_position) {
            ++v18;
          }
        }

        asl_msg_release((asl_object_t)v24);
        if ((_DWORD)set_position) {
          goto LABEL_31;
        }
      }

      uint64_t set_position = pos;
LABEL_31:
      if (v26) {
        asl_release(v26);
      }
      if (a8) {
        *a8 = v18;
      }
    }
  }

  return set_position;
}

uint64_t asl_file_filter_level( uint64_t a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, void (*a8)(void))
{
  uint64_t v23 = 0LL;
  if (a7) {
    *a7 = 0;
  }
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2) {
    return 9999LL;
  }
  if (fseeko(*(FILE **)(a1 + 104), 36LL, 0)) {
    return 7LL;
  }
  fread(&__ptr, 1uLL, 1uLL, *(FILE **)(a1 + 104));
  uint64_t result = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)result)
  {
    uint64_t v26 = 0LL;
    uint64_t result = asl_file_open_write(a2, a4, v15, v16, &v26);
    if (!(_DWORD)result)
    {
      int v17 = 0;
      int v18 = 0;
      *(_DWORD *)(v26 + 8) = 12;
      while (!v18)
      {
        unint64_t v19 = *(void *)(a1 + 72);
        if (!v19) {
          break;
        }
        int v24 = 0LL;
        int v18 = 0;
        if (v24)
        {
          val_for_key = asl_msg_get_val_for_key(v24, "Level");
          int v18 = 0;
          if (val_for_key)
          {
            if (((a3 >> atoi((const char *)val_for_key)) & 1) != 0)
            {
              int v18 = asl_file_save(v26, v24, &v23);
              if (!v18) {
                ++v17;
              }
            }

            else
            {
              if (a8 && asl_msg_get_val_for_key(v24, "ASLAuxURL")) {
                a8();
              }
              int v18 = 0;
            }

            asl_msg_release((asl_object_t)v24);
          }
        }
      }

      char v21 = __ptr & a3;
      if (fseeko(*(FILE **)(v26 + 104), 36LL, 0)) {
        return 7LL;
      }
      fwrite(&v21, 1uLL, 1uLL, *(FILE **)(v26 + 104));
      if (v26) {
        asl_release((asl_object_t)v26);
      }
      uint64_t result = 0LL;
      if (a7) {
        *a7 = v17;
      }
    }
  }

  return result;
}

uint64_t asl_file_string_encode(uint64_t a1, char *__s, unint64_t *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 2LL;
  }
  unsigned int v7 = strlen(__s);
  if (v7 <= 7)
  {
    unint64_t v21 = v7 | 0x80u;
    __memcpy_chk();
    unint64_t v8 = asl_core_ntohq(v21);
LABEL_4:
    uint64_t result = 0LL;
    *a3 = v8;
    return result;
  }

  size_t v10 = v7 + 1;
  if (v10 <= 0x6C)
  {
    int v3 = asl_core_string_hash(__s, v10);
    unint64_t v11 = *(void *)(a1 + 24);
    if (v11)
    {
      uint64_t v12 = 0LL;
      unint64_t v13 = *(void *)(a1 + 24);
      while (1)
      {
        stat v14 = (unint64_t *)v13;
        unint64_t v13 = v14[2];
        uint64_t v12 = v14;
        if (!v13) {
          goto LABEL_12;
        }
      }

      if (v12)
      {
        v12[2] = v14[2];
        int v14[2] = v11;
        *(void *)(a1 + 24) = v14;
      }

      unint64_t v8 = *v14;
      goto LABEL_4;
    }
  }

LABEL_12:
  unint64_t v8 = ftello(*(FILE **)(a1 + 104));
  __int16 __ptr = 256;
  unsigned int v22 = bswap32(v10);
  if (fwrite(&v22, 4uLL, 1uLL, *(FILE **)(a1 + 104)) != 1
    || fwrite(__s, v10, 1uLL, *(FILE **)(a1 + 104)) != 1)
  {
    return 8LL;
  }

  fflush(*(FILE **)(a1 + 104));
  uint64_t v15 = *(_DWORD **)(a1 + 32);
  if (v15)
  {
    *(void *)(a1 + 32) = 0LL;
LABEL_23:
    *(void *)uint64_t v15 = v8;
    v15[2] = v3;
    uint64_t v16 = *(void *)(a1 + 24);
    *((void *)v15 + 2) = v16;
    memcpy(v15 + 6, __s, v10);
    *(void *)(a1 + 24) = v15;
    int v17 = *(_DWORD *)(a1 + 16);
    if ((*(_BYTE *)(a1 + 8) & 4) != 0 || v17 != 128)
    {
      *(_DWORD *)(a1 + 16) = v17 + 1;
    }

    else
    {
      do
      {
        int v18 = (_OWORD *)v16;
        unint64_t v19 = v15;
        uint64_t v16 = *(void *)(v16 + 16);
        uint64_t v15 = v18;
      }

      while (v16);
      *((void *)v19 + 2) = 0LL;
      file_string_dispose(a1, v18);
    }

    goto LABEL_4;
  }

  uint64_t v15 = calloc(1uLL, 0x88uLL);
  if (v15) {
    goto LABEL_23;
  }
  return 9LL;
}

uint64_t asl_file_open_read(const char *a1, uint64_t *a2)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  memset(&v17, 0, sizeof(v17));
  if (stat(a1, &v17)) {
    return 9999LL;
  }
  uint64_t v5 = fopen(a1, "r");
  if (v5)
  {
    unsigned int v6 = v5;
    if ((int)fread(&__ptr, 0x50uLL, 1uLL, v5) <= 0 || (__ptr == 541872961 ? (BOOL v7 = v21 == 16964) : (BOOL v7 = 0), !v7))
    {
      fclose(v6);
      return 2LL;
    }

    int v18 = 0LL;
    unsigned int v9 = v22;
    if (v22 != 0x1000000 || (fclose(v6), uint64_t v4 = asl_legacy1_open(a1, &v18), !(_DWORD)v4))
    {
      size_t v10 = calloc(1uLL, 0x80uLL);
      if (!v10)
      {
        fclose(v6);
        return 9LL;
      }

      uint64_t v11 = (uint64_t)v10;
      *size_t v10 = 0x100000003LL;
      v10[13] = v6;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = bswap32(v9);
      uint64_t v12 = v18;
      if (v18)
      {
        uint64_t v4 = 0LL;
        *((_DWORD *)v10 + 2) = 17;
        v10[14] = v12;
LABEL_25:
        *a2 = v11;
        return v4;
      }

      v10[5] = asl_core_ntohq(v23);
      unint64_t v13 = asl_core_ntohq(v24);
      *(void *)(v11 + 48) = v13;
      unint64_t st_size = v17.st_size;
      *(void *)(v11 + 96) = v17.st_size;
      if (v13 + 122 > st_size) {
        goto LABEL_21;
      }
      uint64_t uint64 = asl_file_read_uint32(v11, v13 + 2, &v19);
      if (*(void *)(v11 + 48) + (unint64_t)v19 > *(void *)(v11 + 96)) {
LABEL_21:
      }
        *(void *)(v11 + 48) = 0LL;
      uint64_t v15 = *(void *)(v11 + 40);
      *(void *)(v11 + 72) = v15;
      if (!v15 || (uint64_t uint64 = asl_file_read_uint64(v11, v15 + 14, (unint64_t *)(v11 + 80)), !(_DWORD)uint64))
      {
        uint64_t v4 = 0LL;
        goto LABEL_25;
      }

uint64_t asl_file_read_set_position_last(uint64_t a1, int a2)
{
  if (a2 || (uint64_t v3 = *(void *)(a1 + 48)) == 0)
  {
    unint64_t v5 = *(void *)(a1 + 40);
    *(void *)(a1 + 72) = v5;
    *(void *)(a1 + 80) = 0LL;
    *(_DWORD *)(a1 + 20) = 0;
    while (1)
    {
      unint64_t v8 = 0LL;
      uint64_t result = asl_file_read_uint64(a1, v5 + 6, &v8);
      if ((_DWORD)result) {
        break;
      }
      unint64_t v5 = v8;
      unint64_t v6 = *(void *)(a1 + 72);
      if (v8 + 122 > *(void *)(a1 + 96) || v8 <= v6)
      {
        unint64_t v8 = 0LL;
        ++*(_DWORD *)(a1 + 20);
        if (v6) {
          asl_file_read_uint64(a1, v6 + 14, (unint64_t *)(a1 + 80));
        }
        return 0LL;
      }

      ++*(_DWORD *)(a1 + 20);
      *(void *)(a1 + 72) = v5;
    }
  }

  else
  {
    *(void *)(a1 + 72) = v3;
    return asl_file_read_uint64(a1, v3 + 14, (unint64_t *)(a1 + 80));
  }

  return result;
}

uint64_t asl_file_fetch_pos(uint64_t a1, unint64_t a2, int a3, int **a4)
{
  if (!*(void *)(a1 + 104)) {
    return 2LL;
  }
  if (!a4) {
    return 1LL;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
    return 12LL;
  }
  uint64_t v31 = 0LL;
  unsigned int v25 = 0;
  uint64_t result = asl_file_fetch_object(a1, 0, a2, (const void **)&v31, &v25);
  if (!(_DWORD)result && v31)
  {
    if (v25 <= 0x73 || 8 * (unint64_t)bswap32(*((_DWORD *)v31 + 14)) + 116 > v25)
    {
      free(v31);
      *(void *)(a1 + 72) = 0LL;
      *(void *)(a1 + 80) = 0LL;
      return 7LL;
    }

    unint64_t v8 = asl_msg_new(0);
    unsigned int v9 = (char *)v31;
    if (!v8)
    {
      free(v31);
      return 9LL;
    }

    size_t v10 = (int *)v8;
    unint64_t v11 = asl_core_ntohq(*(void *)v31);
    off_t v30 = (unint64_t *)(v9 + 8);
    asl_file_fetch_helper_64(&v30, v10, "ASLMessageID");
    asl_file_fetch_helper_64(&v30, v10, "Time");
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "TimeNanoSec", 0, 0);
    asl_file_fetch_helper_16(&v30, v10, "Level");
    off_t v30 = (unint64_t *)((char *)v30 + 2);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "PID", 0, 0);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "UID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "GID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadUID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadGID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "RefPID", 1, 0);
    unsigned int v12 = *(_DWORD *)v30;
    off_t v30 = (unint64_t *)((char *)v30 + 4);
    unsigned int object = 0;
    asl_file_fetch_helper_str(a1, &v30, v10, "Host", &object);
    if (object
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Sender", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Facility", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Message", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "RefProc", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Session", &object), object))
    {
LABEL_22:
      asl_msg_release((asl_object_t)v10);
      free(v31);
      *(void *)(a1 + 72) = 0LL;
      *(void *)(a1 + 80) = 0LL;
      return object;
    }

    unsigned int v13 = bswap32(v12);
    stat v14 = v30;
    if (v13 >= 2)
    {
      unsigned int v15 = v13 >> 1;
      while (1)
      {
        uint64_t v16 = v14;
        uint64_t v28 = 0LL;
        unint64_t v29 = 0LL;
        unsigned int v26 = 0;
        unint64_t v17 = asl_core_ntohq(*v14);
        unsigned int object = asl_file_fetch_object(a1, 1, v17, (const void **)&v29, &v26);
        if (object) {
          goto LABEL_22;
        }
        unint64_t v18 = asl_core_ntohq(v16[1]);
        unsigned int v26 = 0;
        if (v18)
        {
          unsigned int object = asl_file_fetch_object(a1, 1, v18, (const void **)&v28, &v26);
          if (object)
          {
            free(v29);
            goto LABEL_22;
          }

          unsigned int v19 = 0;
        }

        else
        {
          unsigned int v19 = object;
        }

        unsigned int v20 = v29;
        if (!v19 && v29)
        {
          asl_msg_set_key_val(v10, (char *)v29, (const char *)v28);
          unsigned int v20 = v29;
        }

        free(v20);
        free(v28);
        stat v14 = v16 + 2;
        if (!--v15)
        {
          stat v14 = v16 + 2;
          break;
        }
      }
    }

    unint64_t v21 = asl_core_ntohq(*v14);
    free(v31);
    if (a3 < 0)
    {
      if (!v21)
      {
        unint64_t v11 = 0LL;
        goto LABEL_45;
      }

      unsigned int v22 = (void *)(a1 + 72);
      unint64_t v11 = v21;
      if (v21 < *(void *)(a1 + 72)) {
        goto LABEL_45;
      }
    }

    else if (!v11 || (unsigned int v22 = (void *)(a1 + 72), v11 > *(void *)(a1 + 72)))
    {
LABEL_45:
      *(void *)(a1 + 72) = v11;
      *(void *)(a1 + 80) = 0LL;
      unint64_t v23 = (void *)(a1 + 72);
      if (v11)
      {
        if (v11 + 14 > *(void *)(a1 + 96))
        {
          uint64_t result = 0LL;
          *unint64_t v23 = 0LL;
          *(void *)(a1 + 80) = 0LL;
LABEL_52:
          *a4 = v10;
          return result;
        }

        unsigned int object = fseeko(*(FILE **)(a1 + 104), v11 + 14, 0);
        if (object || (unsigned int object = fread(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 104)), object != 1))
        {
          asl_msg_release((asl_object_t)v10);
          *unint64_t v23 = 0LL;
          *(void *)(a1 + 80) = 0LL;
          return 7LL;
        }

        *(void *)(a1 + 80) = asl_core_ntohq(__ptr);
      }

      uint64_t result = 0LL;
      goto LABEL_52;
    }

    uint64_t result = 0LL;
    *unsigned int v22 = 0LL;
    v22[1] = 0LL;
    return result;
  }

  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  return result;
}

uint64_t asl_file_fetch_previous(uint64_t a1, int **a2)
{
  if (!a1) {
    return 2LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999LL;
  }
  return asl_file_fetch_pos(a1, *(void *)(a1 + 72), -1, a2);
}

uint64_t asl_file_fetch(uint64_t a1, unint64_t a2, int **a3)
{
  if (!a1) {
    return 2LL;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
    return 12LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    if (a3) {
      return asl_legacy1_fetch(*(uint64_t **)(a1 + 112), a2, a3);
    }
    return 0LL;
  }

  unint64_t v7 = *(void *)(a1 + 80);
  if (v7) {
    goto LABEL_10;
  }
  uint64_t result = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)result)
  {
    unint64_t v7 = *(void *)(a1 + 80);
    if (v7)
    {
LABEL_10:
      while (v7 < a2)
      {
        uint64_t result = asl_file_read_set_position(a1, 2);
        if ((_DWORD)result) {
          return result;
        }
        unint64_t v7 = *(void *)(a1 + 80);
        if (v7 - 1 >= a2) {
          return 4LL;
        }
      }

      while (v7 > a2)
      {
        uint64_t result = asl_file_read_set_position(a1, 1);
        if (!(_DWORD)result)
        {
          unint64_t v7 = *(void *)(a1 + 80);
          uint64_t result = 4LL;
          if (v7 >= a2 && v7 != 0) {
            continue;
          }
        }

        return result;
      }

      if (v7 == a2)
      {
        if (a3) {
          return asl_file_fetch_pos(a1, *(void *)(a1 + 72), 1, a3);
        }
        return 0LL;
      }
    }

    return 4LL;
  }

  return result;
}

uint64_t asl_file_cursor(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 8) & 1) != 0 && *(_DWORD *)(result + 12) != 1) {
      return *(void *)(result + 80);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t asl_file_match_start(uint64_t a1, unint64_t a2, int a3)
{
  if (!a1) {
    return 2LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 2LL;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
    return 12LL;
  }
  if (a3 < 0) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t result = asl_file_read_set_position(a1, 0);
    if ((_DWORD)result) {
      return result;
    }
    while (1)
    {
LABEL_14:
      unint64_t v8 = *(void *)(a1 + 80);
      if (a3 < 0)
      {
        if (v8 <= a2) {
          return 0LL;
        }
      }

      else if (v8 >= a2)
      {
        return 0LL;
      }

      uint64_t result = asl_file_read_set_position(a1, v7);
      if ((_DWORD)result) {
        return result;
      }
    }
  }

  uint64_t result = asl_file_read_set_position_last(a1, 0);
  if (!(_DWORD)result) {
    goto LABEL_14;
  }
  return result;
}

uint64_t asl_file_match_next(uint64_t a1, uint64_t a2, __asl_object_s **a3, void *a4, int a5)
{
  if (!a1) {
    return 2LL;
  }
  if (!a3) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 2LL;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
    return 12LL;
  }
  if (!*(void *)(a1 + 72)) {
    return 14LL;
  }
  *a3 = 0LL;
  if (a2) {
    BOOL v9 = *(_DWORD *)(a2 + 8) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  unsigned int v13 = 0LL;
  *a4 = *(void *)(a1 + 80);
  uint64_t result = asl_file_fetch_pos(a1, *(void *)(a1 + 72), a5, (int **)&v13);
  switch((_DWORD)result)
  {
    case 0:
      if (v9) {
        goto LABEL_28;
      }
      if (*(_DWORD *)(a2 + 8))
      {
        unint64_t v10 = 0LL;
        do
          int v11 = asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v10++), v13);
        while (v10 < *(unsigned int *)(a2 + 8) && v11 == 0);
        if (v11)
        {
LABEL_28:
          uint64_t result = 0LL;
          *a3 = v13;
          return result;
        }
      }

      *a3 = 0LL;
      asl_msg_release(v13);
      return 13LL;
    case 0xA:
      return 13LL;
    case 1:
      if (*(void *)(a1 + 72)) {
        return 1LL;
      }
      else {
        return 14LL;
      }
  }

  return result;
}

uint64_t asl_file_match( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t v33 = 0LL;
  if (!a1 || (*(_BYTE *)(a1 + 8) & 1) == 0) {
    return 0LL;
  }
  int v9 = a5;
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    asl_legacy1_match(*(void *)(a1 + 112), a2, &v33, a3, a4, a5, a7);
    return v33;
  }

  if (a2) {
    BOOL v15 = *(_DWORD *)(a2 + 8) == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (a7 < 0) {
    int v16 = 1;
  }
  else {
    int v16 = 2;
  }
  if ((a7 & 0x80000000) == 0)
  {
    return 0LL;
  }

  do
  {
LABEL_16:
    unint64_t v18 = *(void *)(a1 + 80);
    if (a7 < 0)
    {
      if (v18 <= a4) {
        break;
      }
    }

    else if (v18 >= a4)
    {
      break;
    }
  }

  while (!asl_file_read_set_position(a1, v16));
  v34.__darwin_time_t tv_sec = 0LL;
  *(void *)&v34.tv_usec = 0LL;
  if (a6)
  {
    if (gettimeofday(&v34, 0LL))
    {
      __darwin_suseconds_t v32 = 0;
      __darwin_time_t v19 = 0LL;
      v34.__darwin_time_t tv_sec = 0LL;
      *(void *)&v34.tv_usec = 0LL;
    }

    else
    {
      __darwin_time_t v19 = v34.tv_sec + a6 / 0xF4240uLL;
      v34.__darwin_time_t tv_sec = v19;
      unsigned int v20 = v34.tv_usec + a6 % 0xF4240;
      v34.tv_usec = v20;
      if (v20 <= 0xF4240)
      {
        __darwin_suseconds_t v32 = v20;
      }

      else
      {
        __darwin_suseconds_t v32 = v20 - 1000000;
        v34.tv_usec = v20 - 1000000;
        v34.__darwin_time_t tv_sec = ++v19;
      }
    }
  }

  else
  {
    __darwin_suseconds_t v32 = 0;
    __darwin_time_t v19 = 0LL;
  }

  uint64_t v13 = 0LL;
  uint64_t v21 = 0LL;
  int v22 = 0;
  uint64_t v23 = (v9 - 1);
  while (1)
  {
    do
    {
      asl_object_t obj = 0LL;
      int pos = asl_file_fetch_pos(a1, *(void *)(a1 + 72), a7, (int **)&obj);
    }

    while (pos == 10);
    if (pos) {
      return v13;
    }
    *a3 = *(void *)(a1 + 80);
    if (v15) {
      goto LABEL_52;
    }
    if (*(_DWORD *)(a2 + 8))
    {
      BOOL v31 = v15;
      __darwin_time_t v25 = v19;
      uint64_t v26 = v23;
      unint64_t v27 = 0LL;
      do
        int v28 = asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v27++), obj);
      while (v27 < *(unsigned int *)(a2 + 8) && v28 == 0);
      uint64_t v23 = v26;
      __darwin_time_t v19 = v25;
      BOOL v15 = v31;
      if (v28 == 1)
      {
LABEL_52:
        if (!v21)
        {
          asl_msg_list_new();
          uint64_t v13 = v30;
          uint64_t v33 = v30;
          if (!v30) {
            return v13;
          }
        }

        asl_msg_list_append(v13, obj);
        if (!v19 || gettimeofday(&v35, 0LL)) {
          goto LABEL_48;
        }
        if (v35.tv_sec > v19) {
          return v13;
        }
        if (v35.tv_sec == v19)
        {
          uint64_t v21 = v13;
          if (v35.tv_usec > v32) {
            return v13;
          }
        }

        else
        {
LABEL_48:
          uint64_t v21 = v13;
        }
      }
    }

    asl_msg_release(obj);
  }

uint64_t asl_file_size(uint64_t result)
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

uint64_t asl_file_ctime(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

void asl_file_list_close(asl_object_t *a1)
{
  if (a1)
  {
    unsigned int v1 = a1;
    do
    {
      int v2 = (asl_object_t *)v1[1];
      if (*v1) {
        asl_release(*v1);
      }
      free(v1);
      unsigned int v1 = v2;
    }

    while (v2);
  }

void *asl_file_list_add(uint64_t a1, uint64_t a2)
{
  if (a2 && *(_DWORD *)(a2 + 12) != 1)
  {
    uint64_t v4 = calloc(1uLL, 0x10uLL);
    if (v4)
    {
      *uint64_t v4 = a2;
      v4[1] = a1;
      return v4;
    }

    else
    {
      return 0LL;
    }
  }

  return (void *)a1;
}

void **asl_file_list_match_start(uint64_t *a1, unint64_t a2, int a3)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v5 = a1;
  unint64_t v6 = (void **)calloc(1uLL, 0x10uLL);
  if (v6)
  {
    do
    {
      unint64_t v5 = (uint64_t *)v5[1];
    }

    while (v5);
    *((_DWORD *)v6 + 2) = a3;
  }

  return v6;
}

void *asl_file_list_insert(void *a1, uint64_t a2, int a3)
{
  if (!a2) {
    return a1;
  }
  uint64_t result = calloc(1uLL, 0x10uLL);
  if (result)
  {
    *uint64_t result = a2;
    if (a1)
    {
      unint64_t v7 = *(void *)(a2 + 80);
      unint64_t v8 = *(void *)(*a1 + 80LL);
      if (a3 < 0)
      {
        if (v7 > v8) {
          goto LABEL_6;
        }
      }

      else if (v7 < v8)
      {
LABEL_6:
        result[1] = a1;
        return result;
      }

      int v9 = (void *)a1[1];
      unint64_t v10 = a1;
      if (!v9)
      {
LABEL_15:
        v10[1] = result;
        return a1;
      }

      int v11 = a1;
      while (1)
      {
        unint64_t v10 = v9;
        unint64_t v12 = *(void *)(*v9 + 80LL);
        if (a3 < 0)
        {
          if (v7 > v12)
          {
LABEL_16:
            result[1] = v10;
            v11[1] = result;
            return a1;
          }
        }

        else if (v7 < v12)
        {
          goto LABEL_16;
        }

        int v9 = (void *)v10[1];
        int v11 = v10;
        if (!v9) {
          goto LABEL_15;
        }
      }
    }
  }

  return result;
}

uint64_t asl_file_list_match_next(uint64_t result, uint64_t a2, uint64_t *a3, int a4)
{
  if (!result) {
    return result;
  }
  if (!a3) {
    return 1LL;
  }
  uint64_t v5 = result;
  unint64_t v6 = *(uint64_t **)result;
  if (!*(void *)result) {
    return 0LL;
  }
  unsigned int v8 = 0;
  unsigned int v9 = a4 - 1;
  while (1)
  {
    asl_object_t obj = 0LL;
    int matched = asl_file_match_next(*v6, a2, &obj, &v21, *(_DWORD *)(v5 + 8));
    int v11 = obj;
    if (!obj) {
      goto LABEL_10;
    }
    uint64_t v12 = *a3;
    if (!*a3) {
      break;
    }
LABEL_9:
    asl_msg_list_append(v12, v11);
    asl_msg_release(obj);
    ++v8;
LABEL_10:
    unint64_t v6 = *(uint64_t **)v5;
    if (matched || !*(void *)(*v6 + 80))
    {
      uint64_t v13 = (uint64_t *)v6[1];
      free(*(void **)v5);
      *(void *)uint64_t v5 = v13;
      unint64_t v6 = v13;
      if (!v13) {
        return 0LL;
      }
    }

    stat v14 = (void *)v6[1];
    if (v14)
    {
      int v15 = *(_DWORD *)(v5 + 8);
      uint64_t v16 = *v6;
      unint64_t v17 = *(void *)(*v6 + 80);
      unint64_t v18 = *(void *)(*v14 + 80LL);
      if ((v15 & 0x80000000) == 0)
      {
        if (v17 <= v18) {
          goto LABEL_18;
        }
LABEL_17:
        *(void *)uint64_t v5 = v14;
        v6[1] = 0LL;
        *(void *)uint64_t v5 = asl_file_list_insert(v14, v16, v15);
        free(v6);
        unint64_t v6 = *(uint64_t **)v5;
        goto LABEL_18;
      }

      if (v17 <= v18) {
        goto LABEL_17;
      }
    }

LABEL_18:
    uint64_t result = 0LL;
    if (!v6 || v9 < v8) {
      return result;
    }
  }

  asl_msg_list_new();
  *a3 = v12;
  if (v12)
  {
    int v11 = obj;
    goto LABEL_9;
  }

  __darwin_time_t v19 = *(uint64_t **)v5;
  if (*(void *)v5)
  {
    do
    {
      unsigned int v20 = (uint64_t *)v19[1];
      free(v19);
      __darwin_time_t v19 = v20;
    }

    while (v20);
  }

  *(void *)uint64_t v5 = 0LL;
  return 9LL;
}

void asl_file_list_match_end(void *a1)
{
  if (a1)
  {
    int v2 = (void *)*a1;
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)v2[1];
        free(v2);
        int v2 = v3;
      }

      while (v3);
    }

    free(a1);
  }

uint64_t asl_file_list_match( uint64_t *a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7 = 0LL;
  if (a1 && a3)
  {
    stat v14 = a1;
    int v15 = 0LL;
    do
    {
      stat v14 = (uint64_t *)v14[1];
    }

    while (v14);
    if (!v15) {
      return 0LL;
    }
    v32.__darwin_time_t tv_sec = 0LL;
    *(void *)&v32.tv_usec = 0LL;
    if (a6)
    {
      if (gettimeofday(&v32, 0LL))
      {
        v32.__darwin_time_t tv_sec = 0LL;
        *(void *)&v32.tv_usec = 0LL;
      }

      else
      {
        __darwin_time_t v16 = v32.tv_sec + a6 / 0xF4240uLL;
        v32.__darwin_time_t tv_sec = v16;
        unsigned int v17 = v32.tv_usec + a6 % 0xF4240;
        v32.tv_usec = v17;
        if (v17 > 0xF4240)
        {
          v32.tv_usec = v17 - 1000000;
          v32.__darwin_time_t tv_sec = v16 + 1;
        }
      }
    }

    uint64_t v7 = 0LL;
    unsigned int v18 = 0;
    unsigned int v19 = a5 - 1;
    do
    {
      if (v19 < v18) {
        goto LABEL_40;
      }
      asl_object_t obj = 0LL;
      asl_file_match_next(*v15, a2, &obj, a3, a7);
      unsigned int v20 = obj;
      if (obj)
      {
        if (!v7)
        {
          asl_msg_list_new();
          uint64_t v7 = v21;
          if (!v21)
          {
            do
            {
              unint64_t v29 = (uint64_t *)v15[1];
              free(v15);
              int v15 = v29;
            }

            while (v29);
            return v7;
          }

          unsigned int v20 = obj;
        }

        asl_msg_list_append(v7, v20);
        asl_msg_release(obj);
        ++v18;
      }

      if (*(void *)(*v15 + 80) || (int v22 = (uint64_t *)v15[1], free(v15), (v15 = v22) != 0LL))
      {
        uint64_t v23 = (void *)v15[1];
        if (v23)
        {
          uint64_t v24 = *v15;
          unint64_t v25 = *(void *)(*v15 + 80);
          unint64_t v26 = *(void *)(*v23 + 80LL);
          if (a7 < 0)
          {
            if (v25 > v26) {
              goto LABEL_28;
            }
LABEL_27:
            v15[1] = 0LL;
            unint64_t v27 = asl_file_list_insert(v23, v24, a7);
            free(v15);
            int v15 = v27;
            goto LABEL_28;
          }

          if (v25 > v26) {
            goto LABEL_27;
          }
        }
      }

void *asl_file_jump_table()
{
  return &asl_file_jump_table_jump;
}

void _jump_dealloc_1(_DWORD *a1)
{
  if (a1)
  {
    if (a1[3] == 1)
    {
      asl_legacy1_close(*((void ***)a1 + 14));
    }

    else
    {
      int v2 = (void *)*((void *)a1 + 3);
      if (v2)
      {
        do
        {
          uint64_t v3 = (void *)v2[2];
          free(v2);
          *((void *)a1 + 3) = v3;
          int v2 = v3;
        }

        while (v3);
      }

      free(*((void **)a1 + 4));
      uint64_t v4 = (FILE *)*((void *)a1 + 13);
      if (v4) {
        fclose(v4);
      }
      uint64_t v5 = (void *)*((void *)a1 + 15);
      if (v5) {
        free(v5);
      }
      *((_OWORD *)a1 + 6) = 0u;
      *((_OWORD *)a1 + 7) = 0u;
      *((_OWORD *)a1 + 4) = 0u;
      *((_OWORD *)a1 + 5) = 0u;
      *((_OWORD *)a1 + 2) = 0u;
      *((_OWORD *)a1 + 3) = 0u;
      *(_OWORD *)a1 = 0u;
      *((_OWORD *)a1 + 1) = 0u;
      free(a1);
    }
  }

uint64_t _jump_count_0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 8) & 1) != 0
      && (uint64_t v2 = *(void *)(result + 72),
          uint64_t v3 = *(void *)(result + 80),
          !asl_file_read_set_position_last(result, 1)))
    {
      *(void *)(v1 + 72) = v2;
      *(void *)(v1 + 80) = v3;
      return *(unsigned int *)(v1 + 20);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

int *_jump_next_0(int *result)
{
  uint64_t v1 = 0LL;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0LL;
    }

    else if (asl_file_fetch_pos((uint64_t)result, *((void *)result + 9), 1, &v1))
    {
      return 0LL;
    }

    else
    {
      return v1;
    }
  }

  return result;
}

int *_jump_prev_0(int *result)
{
  uint64_t v1 = 0LL;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0LL;
    }

    else if (asl_file_fetch_pos((uint64_t)result, *((void *)result + 9), -1, &v1))
    {
      return 0LL;
    }

    else
    {
      return v1;
    }
  }

  return result;
}

int *_jump_get_object_at_index_0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = 0LL;
  else {
    return v3;
  }
}

uint64_t _jump_set_iteration_index_0(uint64_t result, unint64_t a2)
{
  if (result && (*(_BYTE *)(result + 8) & 1) != 0)
  {
    if (a2 == -1LL)
    {
      return asl_file_read_set_position_last(result, 0);
    }

    else if (a2)
    {
      return asl_file_fetch(result, a2, 0LL);
    }

    else
    {
      *(void *)(result + 80) = 0LL;
      uint64_t v2 = *(void *)(result + 40);
      *(void *)(result + 72) = v2;
      if (v2) {
        return asl_file_read_uint64(result, v2 + 14, (unint64_t *)(result + 80));
      }
    }
  }

  return result;
}

uint64_t _jump_append_1(uint64_t a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if (a1 && (*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if ((_DWORD)result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0LL);
      do
      {
        uint64_t result = asl_msg_list_next((uint64_t)obj);
        if (!result) {
          break;
        }
        uint64_t result = asl_file_save(a1, (_DWORD *)result, &v5);
      }

      while (!(_DWORD)result);
    }

    else if (result <= 1)
    {
      return asl_file_save(a1, obj, &v5);
    }
  }

  return result;
}

uint64_t _jump_search_1(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  if (!obj)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = 0LL;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0LL, 0LL, 0, 1);
  }

  if (type == 2)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = obj;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0LL, 0LL, 0, 1);
  }

  if (type > 1) {
    return 0LL;
  }
  asl_msg_list_new();
  unint64_t v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  uint64_t v7 = asl_file_match(a1, (uint64_t)v10, &v11, 0LL, 0LL, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_1( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t result = asl_file_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

double file_string_dispose(uint64_t a1, _OWORD *a2)
{
  if (*(void *)(a1 + 32))
  {
    free(a2);
  }

  else
  {
    *(void *)(a1 + 32) = a2;
    *((void *)a2 + 16) = 0LL;
    double result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

uint64_t asl_file_fetch_object(uint64_t a1, int a2, unint64_t a3, const void **a4, unsigned int *a5)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  if (!*(void *)(a1 + 104)) {
    return 2LL;
  }
  uint64_t v6 = 1LL;
  if (a3 && a4 && a5)
  {
    *a4 = 0LL;
    *a5 = 0;
    unint64_t v11 = asl_core_htonq(a3);
    unint64_t v29 = v11;
    if ((v11 & 0x80) == 0)
    {
      if (a2 == 1)
      {
        uint64_t v12 = *(void *)(a1 + 24);
        if (v12)
        {
          if (*(void *)v12 == a3)
          {
            uint64_t v13 = 0LL;
LABEL_16:
            __darwin_time_t v16 = strdup((const char *)(v12 + 24));
            *a4 = v16;
            if (v16)
            {
              *a5 = *(_DWORD *)(v12 + 8);
              if (v13)
              {
                uint64_t v6 = 0LL;
                uint64_t v17 = *(void *)(a1 + 24);
                *(void *)(v13 + 16) = *(void *)(v12 + 16);
                *(void *)(v12 + 16) = v17;
                *(void *)(a1 + 24) = v12;
                return v6;
              }

              return 0LL;
            }

            return 9LL;
          }

          uint64_t v15 = *(void *)(a1 + 24);
          while (1)
          {
            uint64_t v12 = *(void *)(v15 + 16);
            if (!v12) {
              break;
            }
            uint64_t v13 = v15;
            uint64_t v15 = *(void *)(v15 + 16);
            if (*(void *)v12 == a3) {
              goto LABEL_16;
            }
          }
        }
      }

      if (a3 + 6 > *(void *)(a1 + 96)
        || fseeko(*(FILE **)(a1 + 104), a3, 0)
        || fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
      {
        return 7LL;
      }

      if (a2 == bswap32(__ptr) >> 16)
      {
        *(_DWORD *)__s1 = 0;
        if (fread(__s1, 4uLL, 1uLL, *(FILE **)(a1 + 104)) == 1)
        {
          if (*(_DWORD *)__s1)
          {
            size_t v18 = bswap32(*(unsigned int *)__s1);
            if (a3 + 6 + v18 <= *(void *)(a1 + 96))
            {
              unsigned int v19 = calloc(1uLL, v18);
              *a4 = v19;
              if (!v19) {
                return 9LL;
              }
              if (fread(v19, v18, 1uLL, *(FILE **)(a1 + 104)) == 1)
              {
                if (a2 != 1)
                {
                  uint64_t v6 = 0LL;
                  *a5 = v18;
                  return v6;
                }

                unsigned int v20 = (void *)*a4;
                uint64_t v21 = (v18 - 1);
                if (!*((_BYTE *)*a4 + v21) && strlen((const char *)*a4) == v21)
                {
                  *a5 = v18;
                  if (v18 <= 0x6C)
                  {
                    int v22 = *(_DWORD **)(a1 + 32);
                    if (v22)
                    {
                      *(void *)(a1 + 32) = 0LL;
                    }

                    else
                    {
                      int v22 = calloc(1uLL, 0x88uLL);
                      if (!v22) {
                        return 0LL;
                      }
                    }

                    *(void *)int v22 = a3;
                    v22[2] = v18;
                    unint64_t v25 = *(void **)(a1 + 24);
                    *((void *)v22 + 2) = v25;
                    memcpy(v22 + 6, *a4, v18);
                    *(void *)(a1 + 24) = v22;
                    int v26 = *(_DWORD *)(a1 + 16);
                    if ((*(_BYTE *)(a1 + 8) & 4) != 0 || v26 != 128)
                    {
                      uint64_t v6 = 0LL;
                      *(_DWORD *)(a1 + 16) = v26 + 1;
                      return v6;
                    }

                    do
                    {
                      unint64_t v27 = v22;
                      int v22 = v25;
                      unint64_t v25 = (void *)v25[2];
                    }

                    while (v25);
                    *((void *)v27 + 2) = 0LL;
                    file_string_dispose(a1, v22);
                  }

                  return 0LL;
                }
              }

              else
              {
                unsigned int v20 = (void *)*a4;
              }

              free(v20);
              *a4 = 0LL;
            }
          }
        }

        return 7LL;
      }

      return 2LL;
    }

    if (a2 != 1) {
      return 2LL;
    }
    unsigned int v14 = v11 & 0xF;
    if (v14 > 7) {
      return 2LL;
    }
    char v31 = 0;
    *(void *)__s1 = 0LL;
    uint64_t v6 = 9LL;
    __memcpy_chk();
    uint64_t v23 = strdup(__s1);
    *a4 = v23;
    if (v23)
    {
      uint64_t v6 = 0LL;
      *a5 = v14;
    }
  }

  return v6;
}

unint64_t asl_file_fetch_helper_64(unint64_t **a1, int *a2, char *a3)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  unint64_t result = asl_core_ntohq(**a1);
  ++*a1;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%llu", result);
      return asl_msg_set_key_val(a2, a3, __str);
    }
  }

  return result;
}

unsigned int **asl_file_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  unsigned int v5 = *(*result)++;
  if (a2)
  {
    if (a3)
    {
      unsigned int v8 = bswap32(v5);
      if (!a4 || v8 != a5)
      {
        snprintf(__str, 0x100uLL, "%u", v8);
        return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
      }
    }
  }

  return result;
}

void *asl_file_fetch_helper_16(void *result, int *a2, char *a3)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  unsigned int v3 = *(unsigned __int16 *)*result;
  *result += 2LL;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%hu", __rev16(v3));
      return (void *)asl_msg_set_key_val(a2, a3, __str);
    }
  }

  return result;
}

void asl_file_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v10 = asl_core_ntohq(**a2);
  ++*a2;
  uint64_t v12 = 0LL;
  unsigned int v11 = 0;
  if (v10) {
    LODWORD(v10) = asl_file_fetch_object(a1, 1, v10, (const void **)&v12, &v11);
  }
  if (a5) {
    *a5 = v10;
  }
  if (!(_DWORD)v10)
  {
    if (v12)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v12);
      free(v12);
    }
  }

uint64_t asl_legacy1_open(const char *a1, void ***a2)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  memset(&v18, 0, sizeof(v18));
  if (stat(a1, &v18) < 0) {
    return 9999LL;
  }
  off_t st_size = v18.st_size;
  unsigned int v5 = (void **)calloc(1uLL, 0x18uLL);
  if (!v5) {
    return 9LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = fopen(a1, "r");
  v6[2] = v7;
  if (!v7)
  {
LABEL_10:
    free(v6);
    return 2LL;
  }

  memset(__ptr, 0, sizeof(__ptr));
  if (fread(__ptr, 0x50uLL, 1uLL, v7) == 1)
  {
    if (LODWORD(__ptr[0]) != 541872961 || WORD2(__ptr[0]) != 16964)
    {
      fclose((FILE *)v6[2]);
      goto LABEL_10;
    }

    if (!fseek((FILE *)v6[2], 80LL, 0))
    {
      uint64_t v10 = st_size / 80;
      unsigned int v11 = calloc(v10, 0x18uLL);
      uint64_t *v6 = v11;
      if (v11)
      {
        if (v10 >= 2)
        {
          unsigned int v12 = 0;
          int v13 = 1;
          while (1)
          {
            if (fread(v20, 0x50uLL, 1uLL, (FILE *)v6[2]) != 1) {
              goto LABEL_15;
            }
            if (!v20[0]) {
              break;
            }
            if (v20[0] == 2)
            {
              unsigned int v15 = 0;
              unint64_t v14 = bswap64(v21);
              goto LABEL_27;
            }

            if (v20[0] == 4)
            {
              unint64_t v14 = bswap64(v21);
              unsigned int v15 = bswap32(v22);
LABEL_27:
              uint64_t v16 = (uint64_t)*v6 + 24 * v12;
              *(_BYTE *)uint64_t v16 = v20[0];
              *(_DWORD *)(v16 + 4) = v13;
              *(void *)(v16 + 8) = v14;
              *(_DWORD *)(v16 + 16) = v15;
              ++v12;
            }

            if ((_DWORD)v10 == ++v13)
            {
              unsigned int v11 = *v6;
              goto LABEL_31;
            }
          }

          unint64_t v14 = 0LL;
          unsigned int v15 = 0;
          goto LABEL_27;
        }

        unsigned int v12 = 0;
LABEL_31:
        uint64_t v17 = reallocf(v11, 24LL * v12);
        uint64_t *v6 = v17;
        if (v17)
        {
          *((_DWORD *)v6 + 2) = v12;
          qsort(v17, v12, 0x18uLL, (int (__cdecl *)(const void *, const void *))slot_comp);
        }
      }
    }

LABEL_15:
    uint64_t result = 0LL;
    *a2 = v6;
  }

  else
  {
    fclose((FILE *)v6[2]);
    free(v6);
    return 7LL;
  }

  return result;
}

        if (v7 == 1 && v5 <= 9)
        {
          uint64_t v9 = 10LL;
          goto LABEL_21;
        }

        uint64_t v10 = 0;
LABEL_22:
        if (v8 == 32787)
        {
          unsigned int v11 = _asl_msg_slot_val((int *)v1, v5);
          if (v11) {
            notify_post((const char *)v11);
          }
        }

        else if ((v8 & 0xC000) == 0x4000)
        {
          free(*(void **)&v6[v8 & 0x3FFF]);
        }

        if ((v10 & 0xC000) == 0x4000) {
          free(*(void **)&v6[v10 & 0x3FFF]);
        }
        goto LABEL_29;
      }

      if (v5 <= 9) {
        break;
      }
LABEL_29:
      if (v4 == ++v5) {
        goto LABEL_30;
      }
    }

    unsigned int v8 = *(unsigned __int16 *)&v1[2 * v5 + 32];
    if (!v7) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }

uint64_t asl_legacy1_close(void **a1)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (FILE *)a1[2];
  if (v3) {
    fclose(v3);
  }
  free(a1);
  return 0LL;
}

uint64_t asl_legacy1_fetch(uint64_t *a1, unint64_t a2, int **a3)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t result = 1LL;
  if (a2 != -1LL && a3)
  {
    unsigned int v6 = slotlist_find(a1, a2, 0);
    if (v6 == -1)
    {
      return 4LL;
    }

    else
    {
      uint64_t result = msg_fetch((uint64_t)a1, *(_DWORD *)(*a1 + 24LL * v6 + 4), a3);
      if (!(_DWORD)result)
      {
        if (*a3) {
          return 0LL;
        }
        else {
          return 9999LL;
        }
      }
    }
  }

  return result;
}

uint64_t slotlist_find(uint64_t *a1, unint64_t a2, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2)
  {
    int v5 = *((_DWORD *)a1 + 2);
    if (v5)
    {
      uint64_t v6 = (v5 - 1);
      uint64_t v7 = *a1;
      if (v6 < 2)
      {
        uint64_t v8 = 0LL;
LABEL_15:
        uint64_t result = v6;
        if (*(void *)(v7 + 24LL * v6 + 8) != a2)
        {
          if (*(void *)(v7 + 24LL * v8 + 8) == a2)
          {
            return v8;
          }

          else if (a3 >= 0)
          {
            return 0xFFFFFFFFLL;
          }

          else
          {
            return v8;
          }
        }
      }

      else
      {
        LODWORD(v8) = 0;
        uint64_t result = v6 >> 1;
        while (1)
        {
          unint64_t v9 = *(void *)(v7 + 24LL * result + 8);
          if (v9 == a2) {
            break;
          }
          if (v9 <= a2) {
            uint64_t v6 = v6;
          }
          else {
            uint64_t v6 = result;
          }
          if (v9 <= a2) {
            uint64_t v8 = result;
          }
          else {
            uint64_t v8 = v8;
          }
          uint64_t result = v8 + ((v6 - v8) >> 1);
        }
      }
    }
  }

  return result;
}

uint64_t msg_fetch(uint64_t a1, int a2, int **a3)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  if (!a3) {
    return 1LL;
  }
  *a3 = 0LL;
  if ((fseek(*(FILE **)(a1 + 16), (80 * a2), 0) & 0x80000000) == 0
    && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
  {
    int v5 = (int *)asl_msg_new(0);
    if (!v5) {
      return 9LL;
    }
    uint64_t v6 = v5;
    unsigned int v20 = &v24;
    asl_legacy1_fetch_helper_64((unint64_t **)&v20, v5, "ASLMessageID");
    asl_legacy1_fetch_helper_32(&v20, v6, "ReadUID", 1, -1);
    asl_legacy1_fetch_helper_32(&v20, v6, "ReadGID", 1, -1);
    asl_legacy1_fetch_helper_64((unint64_t **)&v20, v6, "Time");
    asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v20, v6, "Host", &sid);
    asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v20, v6, "Sender", &sid);
    asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v20, v6, "Facility", &sid);
    uint64_t v7 = (unint64_t *)v20;
    snprintf(__str, 0x100uLL, "%u", bswap32(*v20));
    asl_msg_set_key_val(v6, "Level", __str);
    snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 1)));
    asl_msg_set_key_val(v6, "PID", __str);
    snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 2)));
    asl_msg_set_key_val(v6, "UID", __str);
    unsigned int v8 = bswap32(*((_DWORD *)v7 + 3));
    unsigned int v20 = (unsigned int *)(v7 + 2);
    snprintf(__str, 0x100uLL, "%u", v8);
    asl_msg_set_key_val(v6, "GID", __str);
    asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v20, v6, "Message", &sid);
    if (!v23)
    {
LABEL_28:
      uint64_t result = 0LL;
      *a3 = v6;
      return result;
    }

    unsigned int v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = bswap32(v23);
    while ((fseek(*(FILE **)(a1 + 16), 80 * v11, 0) & 0x80000000) == 0
         && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      unsigned int v12 = bswap32(v24);
      if (!v9) {
        unsigned int v9 = v12;
      }
      if (v10 < v9)
      {
        unsigned int v13 = 0;
        unint64_t v14 = (unint64_t *)v25;
        while (1)
        {
          *(void *)__str = 0LL;
          int sid = string_fetch_sid(a1, bswap64(*(v14 - 1)), __str);
          unsigned int v19 = 0LL;
          if (!sid)
          {
            int sid = string_fetch_sid(a1, bswap64(*v14), &v19);
            unsigned int v15 = *(char **)__str;
            if (sid) {
              BOOL v16 = 1;
            }
            else {
              BOOL v16 = *(void *)__str == 0LL;
            }
            if (v16) {
              goto LABEL_20;
            }
            asl_msg_set_key_val(v6, *(char **)__str, (const char *)v19);
          }

          unsigned int v15 = *(char **)__str;
LABEL_20:
          if (v15) {
            free(v15);
          }
          if (v19) {
            free(v19);
          }
          unsigned int v17 = v13 + 1;
          if (v13 <= 2)
          {
            v14 += 2;
            ++v13;
            if (v17 + v10 < v9) {
              continue;
            }
          }

          v10 += v17;
          break;
        }
      }

      unsigned int v11 = bswap32(v23);
      if (!v23) {
        goto LABEL_28;
      }
    }

    asl_msg_release((asl_object_t)v6);
  }

  return 7LL;
}

uint64_t asl_legacy1_match( uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, int a7)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t v8 = 1LL;
  if (a3 && a4)
  {
    *a3 = 0LL;
    if (a7 < 0) {
      int v12 = -1;
    }
    else {
      int v12 = 1;
    }
    if (a5 == -1LL && a7 < 0) {
      uint64_t v13 = *(unsigned int *)(a1 + 8);
    }
    else {
      uint64_t v13 = slotlist_find((uint64_t *)a1, a5, v12);
    }
    uint64_t search_slot = next_search_slot(a1, v13, v12);
    if ((_DWORD)search_slot == -1) {
      return 0LL;
    }
    uint64_t v15 = search_slot;
    if (search_slot < *(_DWORD *)(a1 + 8))
    {
      if (a2)
      {
        unsigned int v22 = *(_DWORD *)(a2 + 8);
        BOOL v16 = v22 == 0;
      }

      else
      {
        unsigned int v22 = 0;
        BOOL v16 = 1;
      }

      asl_msg_list_new();
      *a3 = v17;
      if (!v17) {
        return 9LL;
      }
      if ((_DWORD)v15 != -1)
      {
        uint64_t v8 = 0LL;
        while (1)
        {
          uint64_t v18 = *(void *)a1 + 24LL * v15;
          int v19 = *(_DWORD *)(v18 + 4);
          *a4 = *(void *)(v18 + 8);
          uint64_t v8 = msg_fetch(a1, v19, (int **)&obj);
          if (!v16)
          {
            if (!v22) {
              goto LABEL_28;
            }
            uint64_t v20 = 0LL;
            while (asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + v20), obj) != 1)
            {
              v20 += 8LL;
              if (8LL * v22 == v20) {
                goto LABEL_28;
              }
            }
          }

          asl_msg_list_append(*a3, obj);
LABEL_28:
          asl_msg_release(obj);
          uint64_t v15 = next_search_slot(a1, v15, v12);
          if ((_DWORD)v15 == -1) {
            return v8;
          }
        }
      }

      return 0LL;
    }

    return 9999LL;
  }

  return v8;
}

uint64_t slot_comp(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (!a2) {
      return 1LL;
    }
    unint64_t v2 = *(void *)(a1 + 8);
    unint64_t v3 = *(void *)(a2 + 8);
    if (v2 < v3) {
      return 0xFFFFFFFFLL;
    }
    if (v2 == v3)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 4);
      unsigned int v6 = *(_DWORD *)(a2 + 4);
      BOOL v7 = v5 >= v6;
      BOOL v8 = v5 != v6;
      if (v7) {
        return v8;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 0LL;
  }

unint64_t **asl_legacy1_fetch_helper_64(unint64_t **result, int *a2, char *a3)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  unint64_t v3 = *(*result)++;
  if (a3)
  {
    snprintf(__str, 0x100uLL, "%llu", bswap64(v3));
    return (unint64_t **)asl_msg_set_key_val(a2, a3, __str);
  }

  return result;
}

unsigned int **asl_legacy1_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  unsigned int v5 = *(*result)++;
  if (a3)
  {
    unsigned int v8 = bswap32(v5);
    if (!a4 || v8 != a5)
    {
      snprintf(__str, 0x100uLL, "%u", v8);
      return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
    }
  }

  return result;
}

void asl_legacy1_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v8 = *(*a2)++;
  uint64_t v10 = 0LL;
  if (v8)
  {
    int sid = string_fetch_sid(a1, bswap64(v8), &v10);
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int sid = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = sid;
LABEL_4:
  if (!sid)
  {
    if (v10)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v10);
      free(v10);
    }
  }

uint64_t string_fetch_sid(uint64_t a1, unint64_t a2, void *a3)
{
  *(void *)&v30[55] = *MEMORY[0x1895FEE08];
  if (!a3) {
    return 1LL;
  }
  *a3 = 0LL;
  if (a2 == -1LL) {
    return 0LL;
  }
  unint64_t v4 = bswap64(a2);
  char v25 = HIBYTE(v4);
  __int16 v24 = HIDWORD(v4) >> 8;
  int v23 = v4 >> 8;
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    size_t v21 = HIBYTE(a2) & 0xF;
    unsigned int v22 = calloc(1uLL, v21);
    *a3 = v22;
    if (!v22) {
      return 9LL;
    }
    memcpy(v22, &v23, v21);
    return 0LL;
  }

  unsigned int v6 = slotlist_find((uint64_t *)a1, a2, 0);
  if (v6 == -1) {
    return 6LL;
  }
  int v7 = *(_DWORD *)(*(void *)a1 + 24LL * v6 + 4);
  *a3 = 0LL;
  if (fseek(*(FILE **)(a1 + 16), (80 * v7), 0) < 0
    || fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) != 1)
  {
    return 7LL;
  }

  if (__ptr != 4) {
    return 3LL;
  }
  if (!v29) {
    return 0LL;
  }
  size_t v8 = bswap32(v29);
  unsigned int v9 = v27;
  uint64_t v10 = (char *)calloc(1uLL, v8);
  if (!v10) {
    return 9LL;
  }
  unsigned int v11 = v10;
  else {
    size_t v12 = v8;
  }
  memcpy(v10, v30, v12);
  BOOL v13 = v9 != 0;
  unsigned int v14 = v8 - v12;
  BOOL v15 = v8 != v12;
  if ((_DWORD)v8 == (_DWORD)v12 || !v9)
  {
LABEL_23:
    if (!v13 && !v15)
    {
      uint64_t result = 0LL;
      *a3 = v11;
      return result;
    }
  }

  else
  {
    unsigned int v16 = bswap32(v9);
    uint64_t v17 = &v11[v12];
    while ((fseek(*(FILE **)(a1 + 16), 80 * v16, 0) & 0x80000000) == 0
         && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      unsigned int v18 = v27;
      if (v14 >= 0x4B) {
        size_t v19 = 75LL;
      }
      else {
        size_t v19 = v14;
      }
      memcpy(v17, v28, v19);
      v14 -= v19;
      BOOL v13 = v18 != 0;
      BOOL v15 = v14 != 0;
      if (v18)
      {
        unsigned int v16 = bswap32(v18);
        v17 += v19;
        if (v14) {
          continue;
        }
      }

      goto LABEL_23;
    }
  }

  free(v11);
  return 7LL;
}

uint64_t next_search_slot(uint64_t a1, uint64_t a2, int a3)
{
  if ((a3 & 0x80000000) == 0)
  {
    while (1)
    {
      a2 = (a2 + 1);
    }

    return 0xFFFFFFFFLL;
  }

  unint64_t v4 = *(_BYTE **)a1;
  for (uint64_t i = 24LL * a2 - 24; i; i -= 24LL)
  {
    int v6 = v4[i];
    a2 = (a2 - 1);
    if (v6 == 2) {
      return a2;
    }
  }

  if (*v4 == 2) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

asl_object_t asl_msg_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_msg_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

char *asl_msg_new(int a1)
{
  uint64_t result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)uint64_t result = a1;
    *((_DWORD *)result + 1) = 1;
  }

  return result;
}

char *_asl_msg_make_page(int a1)
{
  unint64_t v2 = (char *)calloc(1uLL, 0x138uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    if (a1 == 1) {
      int v4 = 20;
    }
    else {
      int v4 = 0;
    }
    if (!a1) {
      int v4 = 30;
    }
    if (v4) {
      memset(v2 + 32, 255, (2 * v4));
    }
    *((void *)v3 + 2) = 312LL;
    *(_DWORD *)unint64_t v3 = a1;
  }

  return v3;
}

unsigned int *asl_msg_type(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t asl_msg_count(uint64_t a1)
{
  for (uint64_t i = 0LL; a1; a1 = *(void *)(a1 + 24))
    uint64_t i = (*(_DWORD *)(a1 + 8) + i);
  return i;
}

uint64_t _asl_msg_dump(uint64_t result, const char *a2, _DWORD *a3)
{
  if (result)
  {
    unint64_t v3 = a3;
    unsigned int v5 = (FILE *)result;
    if (a3)
    {
      if (*a3 == 1) {
        unsigned int v6 = 10;
      }
      else {
        unsigned int v6 = 0;
      }
      if (*a3) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 15LL;
      }
      for (char i = 1; ; char i = 0)
      {
        if ((i & 1) != 0)
        {
          fprintf(v5, "asl_msg %s: %p\n", a2, v3);
          fprintf(v5, "    refcount: %u\n", v3[1]);
          fprintf(v5, "    asl_type: %u\n");
        }

        else
        {
          fprintf(v5, "  page: %p\n");
        }

        fprintf(v5, "    count: %u\n", v3[2]);
        fprintf(v5, "    data_size: %u\n", v3[3]);
        fprintf(v5, "    mem_size: %llu\n", *((void *)v3 + 2));
        uint64_t result = fprintf(v5, "    next: %p\n", *((const void **)v3 + 3));
        if ((_DWORD)v7) {
          break;
        }
LABEL_33:
        unint64_t v3 = (_DWORD *)*((void *)v3 + 3);
        if (!v3) {
          return result;
        }
      }

      unint64_t v9 = 0LL;
      while (1)
      {
        fprintf(v5, "    slot[%d]: ", v9);
        if (*v3 && (*v3 != 1 || v9 > 9)) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = *((unsigned __int16 *)v3 + v9 + 16);
        }
        _asl_msg_dump_kv(v5, (uint64_t)v3, v10);
        fputc(32, v5);
        if (!*v3) {
          break;
        }
        if (*v3 == 1 && v9 <= 9)
        {
          uint64_t v11 = 10LL;
LABEL_26:
          unsigned int v12 = *((unsigned __int16 *)v3 + v9 + v11 + 16);
          goto LABEL_27;
        }

        unsigned int v12 = 0;
LABEL_27:
        uint64_t result = _asl_msg_dump_kv(v5, (uint64_t)v3, v12);
        if (*v3 == 1)
        {
          if (v9 > 9) {
            int v13 = 0;
          }
          else {
            int v13 = *((unsigned __int16 *)v3 + v9 + 36);
          }
          uint64_t result = fprintf(v5, " 0x%04x\n", v13);
        }

        if (v7 == ++v9) {
          goto LABEL_33;
        }
      }

      uint64_t v11 = 15LL;
      goto LABEL_26;
    }

    return fprintf((FILE *)result, "asl_msg %s: NULL\n", a2);
  }

  return result;
}

size_t _asl_msg_dump_kv(FILE *__stream, uint64_t a2, unsigned int a3)
{
  if (a3 == 0xFFFF)
  {
    int v4 = "-free-";
    size_t v5 = 6LL;
    return fwrite(v4, v5, 1uLL, __stream);
  }

  if ((a3 & 0xC000) == 0x4000) {
    return fprintf(__stream, "(extern: %s)", *(const char **)(a2 + (a3 & 0x3FFF) + 92));
  }
  if ((a3 & 0xC000) == 0x8000)
  {
    switch(a3)
    {
      case 0x8001u:
        int v4 = "(dict: Time)";
        goto LABEL_15;
      case 0x8002u:
        int v4 = "(dict: Nano)";
        goto LABEL_15;
      case 0x8003u:
        int v4 = "(dict: Host)";
LABEL_15:
        size_t v5 = 12LL;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8004u:
        int v4 = "(dict: Sender)";
        goto LABEL_30;
      case 0x8005u:
        int v4 = "(dict: Facility)";
        size_t v5 = 16LL;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8006u:
      case 0x800Eu:
        int v4 = "(dict: PID)";
        goto LABEL_20;
      case 0x8007u:
        int v4 = "(dict: UID)";
        goto LABEL_20;
      case 0x8008u:
        int v4 = "(dict: GID)";
LABEL_20:
        size_t v5 = 11LL;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8009u:
        int v4 = "(dict: Level)";
        size_t v5 = 13LL;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x800Au:
        int v4 = "(dict: Message)";
        goto LABEL_27;
      case 0x800Bu:
        int v4 = "(dict: ReadUID)";
        goto LABEL_27;
      case 0x800Cu:
        int v4 = "(dict: ReadGID)";
        goto LABEL_27;
      case 0x800Du:
        int v4 = "(dict: Session)";
        goto LABEL_27;
      case 0x800Fu:
        int v4 = "(dict: RefProc)";
LABEL_27:
        size_t v5 = 15LL;
        break;
      case 0x8010u:
        int v4 = "(dict: ASLMessageID)";
        size_t v5 = 20LL;
        break;
      case 0x8011u:
        int v4 = "(dict: Expire)";
LABEL_30:
        size_t v5 = 14LL;
        break;
      case 0x8012u:
        int v4 = "(dict: ASLOption)";
LABEL_33:
        size_t v5 = 17LL;
        break;
      default:
        switch(a3)
        {
          case 0x8101u:
            int v4 = "(dict: com.apple.message.domain)";
            goto LABEL_47;
          case 0x8102u:
            int v4 = "(dict: com.apple.message.domain_scope)";
            size_t v5 = 38LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8103u:
            int v4 = "(dict: com.apple.message.result)";
            goto LABEL_47;
          case 0x8104u:
            int v4 = "(dict: com.apple.message.signature)";
            size_t v5 = 35LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8105u:
            int v4 = "(dict: com.apple.message.signature2)";
            goto LABEL_39;
          case 0x8106u:
            int v4 = "(dict: com.apple.message.signature3)";
LABEL_39:
            size_t v5 = 36LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8107u:
            int v4 = "(dict: com.apple.message.success)";
            size_t v5 = 33LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8108u:
            int v4 = "(dict: com.apple.message.uuid)";
            size_t v5 = 30LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8109u:
            int v4 = "(dict: com.apple.message.value)";
            size_t v5 = 31LL;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x810Au:
            int v4 = "(dict: com.apple.message.value2)";
            goto LABEL_47;
          case 0x810Bu:
            int v4 = "(dict: com.apple.message.value3)";
            goto LABEL_47;
          case 0x810Cu:
            int v4 = "(dict: com.apple.message.value4)";
            goto LABEL_47;
          case 0x810Du:
            int v4 = "(dict: com.apple.message.value5)";
LABEL_47:
            size_t v5 = 32LL;
            break;
          default:
            int v4 = "(dict: -unknown-)";
            goto LABEL_33;
        }

        break;
    }

    return fwrite(v4, v5, 1uLL, __stream);
  }

  return fputs((const char *)(a2 + a3 + 92), __stream);
}

uint64_t asl_msg_fetch(_DWORD *a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = a1;
  if (*a1 == 1) {
    int v7 = 10;
  }
  else {
    int v7 = 0;
  }
  if (*a1) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 15;
  }
  unsigned int v9 = HIBYTE(a2);
  if (HIBYTE(a2) == 255) {
    return 0xFFFFFFFFLL;
  }
  int v13 = a2 & 0xFFFFFF;
  if ((a2 & 0xFFFFFF) != 0)
  {
    int v14 = a2 & 0xFFFFFF;
    do
    {
      unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
      if (!v6) {
        return 0xFFFFFFFFLL;
      }
    }

    while (--v14);
  }

  if (a3) {
    *a3 = _asl_msg_slot_key((char *)v6, HIBYTE(a2));
  }
  if (a4) {
    *a4 = _asl_msg_slot_val(v6, v9);
  }
  if (a5)
  {
    __int16 v15 = 0;
    if (a2 >> 25 <= 4 && *v6 == 1) {
      __int16 v15 = *((_WORD *)v6 + v9 + 36);
    }
    *a5 = v15;
  }

  while (++v9 < v8)
  {
LABEL_27:
  }

  unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
  if (v6)
  {
    unsigned int v9 = 0;
    ++v13;
    goto LABEL_27;
  }

  return 4278190080LL;
}

char *_asl_msg_slot_key(char *result, unsigned int a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)result;
    if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1) {
      return 0LL;
    }
    if (v2 == 1)
    {
      if (a2 > 9)
      {
LABEL_10:
        LODWORD(v3) = 0;
LABEL_11:
        result += v3 + 92;
        return result;
      }
    }

    else if (v2 || a2 >= 0xF)
    {
      goto LABEL_10;
    }

    uint64_t v3 = *(unsigned __int16 *)&result[2 * a2 + 32];
    if (v3 == 0xFFFF) {
      return 0LL;
    }
    switch(v3 & 0xC000)
    {
      case 0x8000LL:
        if ((unsigned __int16)(v3 + 0x7FFF) > 0x12u)
        {
          LOWORD(v3) = v3 + 32511;
          uint64_t v3 = (unsigned __int16)v3;
          int v4 = MTStandardKey;
        }

        else
        {
          uint64_t v3 = (unsigned __int16)(v3 + 0x7FFF);
          int v4 = ASLStandardKey;
        }

        return v4[v3];
      case 0x4000LL:
        return *(char **)&result[(v3 & 0x3FFF) + 92];
      case 0LL:
        goto LABEL_11;
      default:
        return 0LL;
    }
  }

  return result;
}

int *_asl_msg_slot_val(int *result, unsigned int a2)
{
  if (!result) {
    return result;
  }
  int v2 = *result;
  if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1) {
    return 0LL;
  }
  if (v2 == 1)
  {
    if (a2 <= 9)
    {
      int v3 = 10;
      goto LABEL_13;
    }

LABEL_17:
    unsigned int v4 = 0;
    return (int *)((char *)result + v4 + 92);
  }

  if (v2 || a2 >= 0xF) {
    goto LABEL_17;
  }
  int v3 = 15;
LABEL_13:
  unsigned int v4 = *((unsigned __int16 *)result + v3 + a2 + 16);
  if (v4 == 0xFFFF) {
    return 0LL;
  }
  if ((v4 & 0xC000) != 0x4000)
  {
    if ((v4 & 0xC000) != 0) {
      return 0LL;
    }
    return (int *)((char *)result + v4 + 92);
  }

  return *(int **)((char *)result + (v4 & 0x3FFF) + 92);
}

      a1 = *(void *)(a1 + 24);
      size_t v5 = v8;
    }

    while (a1);
    return 0xFFFFFFFFLL;
  }

  return v4;
}

uint64_t asl_msg_lookup(_DWORD *a1, char *a2, int **a3, _WORD *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t v6 = 0xFFFFFFFFLL;
  unsigned int v10 = -1;
  unsigned int v9 = 0LL;
  if (_asl_msg_index(a1, a2, &v10, &v9) != -1)
  {
    if (a3) {
      *a3 = _asl_msg_slot_val(v9, v10);
    }
    if (a4)
    {
      if (v9)
      {
        __int16 v7 = 0;
        if (v10 <= 9 && *v9 == 1) {
          __int16 v7 = *((_WORD *)v9 + v10 + 36);
        }
      }

      else
      {
        __int16 v7 = 0;
      }

      uint64_t v6 = 0LL;
      *a4 = v7;
    }

    else
    {
      return 0LL;
    }
  }

  return v6;
}

uint64_t _asl_msg_index(_DWORD *a1, char *__s, _DWORD *a3, void *a4)
{
  if (!__s) {
    return 0xFFFFFFFFLL;
  }
  __int16 v7 = a1;
  if (*a1 == 1) {
    int v8 = 10;
  }
  else {
    int v8 = 0;
  }
  if (*a1) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 15;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = a1;
  }
  unsigned int v10 = strlen(__s);
  int v11 = _asl_msg_std_key(__s, v10);
  int v12 = 0;
  while (2)
  {
    uint64_t v13 = 0LL;
    int v14 = v7 + 23;
    do
    {
      int v15 = *v7;
      if (*v7 == 1)
      {
      }

      else
      {
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v13 >= 0xF;
        }
        if (v16) {
          goto LABEL_22;
        }
      }

LABEL_22:
      if (v11)
      {
        if (v15 == 1)
        {
          if (v13 > 9)
          {
LABEL_26:
            int v17 = 0;
            goto LABEL_33;
          }
        }

        else if (v15 || v13 >= 0xF)
        {
          goto LABEL_26;
        }

        int v17 = *((unsigned __int16 *)v7 + v13 + 16);
LABEL_33:
        if (v17 == v11) {
          return (v12 + v13);
        }
        goto LABEL_49;
      }

      if (v15 == 1)
      {
      }

      else if (v15 || v13 >= 0xF)
      {
        goto LABEL_46;
      }

      unsigned int v18 = (char *)v7 + 2 * v13;
      if ((*((_WORD *)v18 + 16) & 0xC000) == 0x8000) {
        goto LABEL_49;
      }
      __int16 v19 = *((_WORD *)v18 + 16);
      if ((v19 & 0xC000) != 0x4000)
      {
        if (v15 == 1 && v13 > 9) {
LABEL_46:
        }
          uint64_t v21 = 0LL;
        else {
          uint64_t v21 = *((unsigned __int16 *)v18 + 16);
        }
        uint64_t v20 = (char *)v14 + v21;
        goto LABEL_48;
      }

      uint64_t v20 = *(const char **)((char *)v14 + (v19 & 0x3FFF));
LABEL_48:
      if (!strcmp(__s, v20)) {
        return (v12 + v13);
      }
LABEL_49:
      ++v13;
      if (a3) {
        *a3 = v13;
      }
    }

    while (v13 < v9);
    __int16 v7 = (_DWORD *)*((void *)v7 + 3);
    if (v7)
    {
      if (a3) {
        *a3 = 0;
      }
      if (a4) {
        *a4 = v7;
      }
      v12 += v13;
      continue;
    }

    return 0xFFFFFFFFLL;
  }

          uint64_t result = (_DWORD *)asl_msg_fetch(v3, v4, &__s, (int **)&v14, 0LL);
          unsigned int v4 = result;
        }

        while ((_DWORD)result != -1);
      }
    }
  }

  return result;
}

int *asl_msg_get_val_for_key(int *result, char *a2)
{
  if (result)
  {
    unsigned int v3 = -1;
    int v2 = 0LL;
    else {
      return _asl_msg_slot_val(v2, v3);
    }
  }

  return result;
}

char *asl_msg_key(int *a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = 0;
  if (*a1 == 1) {
    LODWORD(v3) = 10;
  }
  else {
    LODWORD(v3) = 0;
  }
  if (*a1) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 15LL;
  }
  while (!(_DWORD)v3)
  {
LABEL_17:
    a1 = (int *)*((void *)a1 + 3);
    if (!a1) {
      return 0LL;
    }
  }

  unint64_t v4 = 0LL;
  int v5 = *a1;
  while (1)
  {
    if (v2 == a2) {
      return _asl_msg_slot_key((char *)a1, v4);
    }
    ++v2;
LABEL_16:
    if (v3 == ++v4) {
      goto LABEL_17;
    }
  }

uint64_t asl_msg_set_key_val_op(int *a1, char *__s1, const char *a3, int a4)
{
  uint64_t v65 = *MEMORY[0x1895FEE08];
  uint64_t v4 = 0xFFFFFFFFLL;
  if (!a1 || !__s1) {
    return v4;
  }
  if (a4) {
    int v8 = ((a4 & 7) == 0) | a4;
  }
  else {
    int v8 = 0;
  }
  if (!strcmp(__s1, "Level"))
  {
    if (a3)
    {
      if ((*a3 & 0xF8) != 0x30 || a3[1])
      {
        if (!strcasecmp(a3, "Emergency"))
        {
          a3 = "0";
        }

        else if (!strcasecmp(a3, "Alert"))
        {
          a3 = "1";
        }

        else if (!strcasecmp(a3, "Critical"))
        {
          a3 = "2";
        }

        else if (!strcasecmp(a3, "Error"))
        {
          a3 = "3";
        }

        else if (!strcasecmp(a3, "Warning"))
        {
          a3 = "4";
        }

        else if (!strcasecmp(a3, "Notice"))
        {
          a3 = "5";
        }

        else if (!strcasecmp(a3, "Info"))
        {
          a3 = "6";
        }

        else
        {
          a3 = "7";
        }
      }
    }

    else
    {
      a3 = "7";
    }
  }

  int v9 = strcmp(__s1, "Message");
  unsigned int v10 = 0LL;
  if (a3 && !v9)
  {
    unsigned int v11 = strlen(a3);
    uint64_t v12 = 0LL;
    do
    {
      if (!(v11 + v12))
      {
        unsigned int v10 = 0LL;
        a3 = 0LL;
        goto LABEL_34;
      }

      int v13 = a3[v11 - 1 + v12--];
    }

    while (v13 == 10);
    unsigned int v14 = v11 + v12 + 1;
    if (v14 >= v11)
    {
      unsigned int v10 = 0LL;
    }

    else
    {
      size_t v15 = v11 + v12 + 1;
      if (v14 > 0x1FF)
      {
        BOOL v16 = (char *)malloc(v11 + v12 + 2);
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        unsigned int v10 = v16;
        memcpy(v16, a3, v15);
        a3 = v10;
      }

      else
      {
        __memcpy_chk();
        unsigned int v10 = 0LL;
        a3 = &v64;
      }

      a3[v15] = 0;
    }
  }

LABEL_34:
  int v17 = *a1;
  unsigned int v63 = -1;
  int v62 = 0LL;
  if (v17 == 1 || _asl_msg_index(a1, __s1, &v63, &v62) == -1)
  {
    uint64_t v20 = a1;
    uint64_t v21 = __s1;
    unsigned int v22 = a3;
    __int16 v23 = v8;
LABEL_42:
    uint64_t v4 = _asl_msg_new_key_val_op(v20, v21, v22, v23);
    goto LABEL_43;
  }

  unsigned int v18 = v62;
  int v61 = v8;
  uint64_t v60 = v63;
  if (!v62) {
    goto LABEL_52;
  }
  if (*v62 != 1)
  {
    if (!*v62 && v63 < 0xF)
    {
      int v19 = 15;
      goto LABEL_48;
    }

LABEL_52:
    LODWORD(v25) = 0;
    __int16 v29 = 0;
    goto LABEL_53;
  }

  if (v63 > 9) {
    goto LABEL_52;
  }
  int v19 = 10;
LABEL_48:
  uint64_t v25 = *((unsigned __int16 *)v62 + v19 + v63 + 16);
  if (v25 == 0xFFFF)
  {
    unsigned int v59 = 0;
    unsigned int v28 = 0;
    int v26 = 0LL;
    unsigned int v27 = 0LL;
    LOWORD(v25) = -1;
    if (!a3) {
      goto LABEL_78;
    }
LABEL_54:
    if (v26 && !strcmp(a3, v26) || v27 && !strcmp(a3, v27))
    {
      uint64_t v4 = 0LL;
      if (v61 != -1)
      {
        if (v18)
        {
          uint64_t v4 = 0LL;
          if (v60 <= 9 && *v18 == 1)
          {
            uint64_t v4 = 0LL;
            *((_WORD *)v18 + v60 + 36) = v61;
          }
        }
      }

      goto LABEL_43;
    }

    uint64_t v30 = v25 & 0x3FFF;
    if (v26 && (_DWORD)v30 + v59 == v18[3])
    {
      if (*v18)
      {
        int v31 = 10;
      }

      else
      {
        if (v60 >= 0xF)
        {
LABEL_99:
          unsigned int v59 = 0;
          v18[3] = v30;
          goto LABEL_105;
        }

        int v31 = 15;
      }

      *((_WORD *)v18 + (v31 + v60) + 16) = -1;
      goto LABEL_99;
    }

    if (!v27 || v28 + (_DWORD)v30 != v18[3]) {
      goto LABEL_105;
    }
    if (*v18)
    {
      int v32 = v60;
      int v33 = 10;
    }

    else
    {
      int v32 = v60;
      if (v60 >= 0xF)
      {
LABEL_104:
        v18[3] = v30;
        *((void *)v18 + 2) += ~strlen(v27);
        free(v27);
        unsigned int v28 = 0;
        unsigned int v27 = 0LL;
LABEL_105:
        int v38 = strlen(a3);
        size_t v39 = (v38 + 1);
        else {
          unsigned int v40 = 8;
        }
        if (v27 && v40 <= v28)
        {
          *((void *)v62 + 2) += ~strlen(v27);
          free(v27);
          goto LABEL_113;
        }

        if (!v27 && v40 <= v59)
        {
LABEL_113:
          if (v39 >= 0xDD)
          {
            int8x16_t v41 = strdup(a3);
            if (v41)
            {
              __int128 v42 = v41;
              size_t v43 = strlen(v41);
              __int128 v44 = v62;
              *((void *)v62 + 2) += v43 + 1;
              if (*v44)
              {
                int v45 = v61;
                if (v63 > 9 || *v44 != 1) {
                  goto LABEL_141;
                }
                int v46 = 10;
              }

              else
              {
                int v45 = v61;
                if (v63 >= 0xF)
                {
LABEL_141:
                  *(void *)((char *)v44 + v30 + 92) = v42;
LABEL_146:
                  if (v45 != -1 && v62)
                  {
                    uint64_t v4 = 0LL;
                    if (v63 <= 9 && *v62 == 1)
                    {
                      uint64_t v4 = 0LL;
                      *((_WORD *)v62 + v63 + 36) = v45;
                    }

                    goto LABEL_43;
                  }

                  goto LABEL_176;
                }

                int v46 = 15;
              }

              *((_WORD *)v44 + v46 + v63 + 16) = v30 | 0x4000;
              goto LABEL_141;
            }

LABEL_137:
            uint64_t v4 = 0xFFFFFFFFLL;
            goto LABEL_43;
          }

          uint64_t v47 = v62;
          if (v62)
          {
            if (*v62)
            {
              if (v63 > 9 || *v62 != 1) {
                goto LABEL_145;
              }
              int v48 = 10;
              goto LABEL_144;
            }

            if (v63 < 0xF)
            {
              int v48 = 15;
LABEL_144:
              *((_WORD *)v62 + v48 + v63 + 16) = v30;
            }
          }

LABEL_145:
          memcpy((char *)v47 + v30 + 92, a3, v39);
          int v45 = v61;
          goto LABEL_146;
        }

        int v49 = v62;
        if (v27)
        {
          *((void *)v62 + 2) += ~strlen(v27);
          free(v27);
          int v49 = v62;
        }

        uint64_t v50 = v49[3];
        if (v40 > 220 - (int)v50)
        {
          uint64_t v51 = v63;
          int v52 = *v49;
          if (*v49)
          {
            __int16 v23 = v61;
            if (v63 > 9 || v52 != 1)
            {
LABEL_159:
              goto LABEL_162;
            }

            int v53 = 10;
          }

          else
          {
            __int16 v23 = v61;
            if (v63 >= 0xF)
            {
LABEL_162:
              uint64_t v20 = a1;
              uint64_t v21 = __s1;
              unsigned int v22 = a3;
              goto LABEL_42;
            }

            int v53 = 15;
          }

          *((_WORD *)v49 + v63 + 16) = -1;
          *((_WORD *)v49 + (v53 + v51) + 16) = -1;
          goto LABEL_159;
        }

        v49[3] = v50 + v40;
        if (v39 >= 0xDD)
        {
          time_t v54 = strdup(a3);
          if (!v54) {
            goto LABEL_137;
          }
          uint64_t v55 = v54;
          *((void *)v49 + 2) += strlen(v54) + 1;
          if (*v49)
          {
            int v56 = v61;
            if (v63 > 9 || *v49 != 1) {
              goto LABEL_170;
            }
            int v57 = 10;
          }

          else
          {
            int v56 = v61;
            if (v63 >= 0xF)
            {
LABEL_170:
              *(void *)((char *)v49 + v50 + 92) = v55;
              goto LABEL_171;
            }

            int v57 = 15;
          }

          *((_WORD *)v49 + v57 + v63 + 16) = v50 | 0x4000;
          goto LABEL_170;
        }

        if (*v49)
        {
          if (v63 > 9 || *v49 != 1) {
            goto LABEL_166;
          }
          int v58 = 10;
        }

        else
        {
          if (v63 >= 0xF)
          {
LABEL_166:
            memcpy((char *)v49 + v50 + 92, a3, v39);
            int v56 = v61;
LABEL_171:
            if (v56 != -1 && v62)
            {
              uint64_t v4 = 0LL;
              if (v63 <= 9 && *v62 == 1)
              {
                uint64_t v4 = 0LL;
                *((_WORD *)v62 + v63 + 36) = v56;
              }

              goto LABEL_43;
            }

            goto LABEL_176;
          }

          int v58 = 15;
        }

        *((_WORD *)v49 + v58 + v63 + 16) = v50;
        goto LABEL_166;
      }

      int v33 = 15;
    }

    *((_WORD *)v18 + (v33 + v32) + 16) = -1;
    goto LABEL_104;
  }

  if ((v25 & 0xC000) != 0x4000)
  {
    __int16 v29 = *((_WORD *)v62 + v19 + v63 + 16);
LABEL_53:
    int v26 = (char *)v62 + v25 + 92;
    unsigned int v28 = 0;
    unsigned int v27 = 0LL;
    unsigned int v59 = strlen(v26) + 1;
    LOWORD(v25) = v29;
    if (!a3) {
      goto LABEL_78;
    }
    goto LABEL_54;
  }

  unsigned int v59 = 0;
  int v26 = 0LL;
  unsigned int v27 = *(char **)((char *)v62 + (v25 & 0x3FFF) + 92);
  unsigned int v28 = 8;
  if (a3) {
    goto LABEL_54;
  }
LABEL_78:
  if (v27)
  {
    *((void *)v62 + 2) += ~strlen(v27);
    free(v27);
    unsigned int v18 = v62;
    unsigned int v34 = v63;
    int v35 = v61;
    if (!v62) {
      goto LABEL_176;
    }
LABEL_82:
    int v36 = *v18;
    if (*v18)
    {
      if (v34 > 9 || v36 != 1)
      {
LABEL_89:
        if (v35 != -1)
        {
          uint64_t v4 = 0LL;
          if (v34 <= 9 && v36 == 1)
          {
            uint64_t v4 = 0LL;
            *((_WORD *)v18 + v34 + 36) = v35;
          }

          goto LABEL_43;
        }

        goto LABEL_176;
      }

      int v37 = 10;
    }

    else
    {
      if (v34 >= 0xF) {
        goto LABEL_89;
      }
      int v37 = 15;
    }

    *((_WORD *)v18 + v37 + v34 + 16) = -1;
    goto LABEL_89;
  }

  int v35 = v61;
  unsigned int v34 = v63;
  if (v62) {
    goto LABEL_82;
  }
LABEL_176:
  uint64_t v4 = 0LL;
LABEL_43:
  if (v10) {
    free(v10);
  }
  return v4;
}

uint64_t asl_msg_set_key_val(int *a1, char *a2, const char *a3)
{
  return asl_msg_set_key_val_op(a1, a2, a3, 0);
}

void asl_msg_unset(_DWORD *a1, char *a2)
{
  if (a1 && a2)
  {
    unsigned int v3 = -1;
    int v2 = 0LL;
  }

void _asl_msg_unset_page_slot(int *a1, unsigned int a2)
{
  if (a1)
  {
    int v4 = *a1;
    if (*a1 == 1) {
      unsigned int v5 = 10;
    }
    else {
      unsigned int v5 = 0;
    }
    if (!v4) {
      unsigned int v5 = 15;
    }
    if (v5 > a2)
    {
      if (v4 == 1)
      {
        if (a2 > 9) {
          goto LABEL_28;
        }
      }

      else
      {
        if (v4)
        {
          int v6 = 0;
LABEL_15:
          if (v4 == 1)
          {
            if (a2 <= 9)
            {
              int v7 = 10;
              goto LABEL_21;
            }
          }

          else if (!v4 && a2 < 0xF)
          {
            int v7 = 15;
LABEL_21:
            __int16 v8 = *((_WORD *)a1 + v7 + a2 + 16);
LABEL_23:
            if (v6 == 0xFFFF) {
              return;
            }
            if ((v6 & 0xC000) == 0x4000)
            {
              int v9 = *(char **)((char *)a1 + (v6 & 0x3FFF) + 92);
              *((void *)a1 + 2) += ~strlen(v9);
              free(v9);
            }

            if ((v8 & 0xC000) == 0x4000)
            {
              unsigned int v10 = *(char **)((char *)a1 + (v8 & 0x3FFF) + 92);
              *((void *)a1 + 2) += ~strlen(v10);
              free(v10);
            }

void asl_msg_unset_index(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = -1;
  int v2 = 0LL;
  if (a1)
  {
  }

uint64_t _asl_msg_resolve_index(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v5 = 0LL;
    *a4 = -1;
    *a3 = 0LL;
    if (*(_DWORD *)a1 == 1) {
      unsigned int v6 = 10;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*(_DWORD *)a1) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 15LL;
    }
    do
    {
      uint64_t v8 = (*(_DWORD *)(a1 + 8) + v5);
      if (v8 >= a2)
      {
        *a3 = a1;
        if ((_DWORD)v7)
        {
          uint64_t v9 = 0LL;
          uint64_t v8 = v5;
          while (1)
          {
            if (*(__int16 *)(a1 + 32 + 2 * v9) != -1)
            {
              if ((_DWORD)v8 == a2)
              {
                uint64_t v4 = 0LL;
                *a4 = v9;
                return v4;
              }

              uint64_t v8 = (v8 + 1);
            }

            if (v7 == ++v9) {
              goto LABEL_17;
            }
          }
        }

        uint64_t v8 = v5;
      }

int *asl_msg_merge(int *a1, asl_object_t obj)
{
  if (obj)
  {
    uint32_t type = asl_get_type(obj);
    uint32_t v5 = type;
    unsigned int v6 = a1;
    if (!a1)
    {
      page = _asl_msg_make_page(type);
      unsigned int v6 = (int *)page;
      if (page)
      {
        *(_DWORD *)page = v5;
        *((_DWORD *)page + 1) = 1;
      }
    }

    unsigned int v8 = asl_msg_fetch(obj, 0, &v15, (int **)&v14, &v16);
    if (v8 != -1)
    {
      for (unsigned int i = v8; i != -1; unsigned int i = asl_msg_fetch(obj, i, &v15, (int **)&v14, &v16))
      {
        if (!v5) {
          unsigned __int16 v16 = 0;
        }
        unsigned int v10 = v14;
        int v11 = v15;
        int v12 = v16;
        if (a1)
        {
          if (!v6) {
            continue;
          }
          if (!v15) {
            continue;
          }
          int v18 = -1;
          uint64_t v17 = 0LL;
        }

        asl_msg_set_key_val_op(v6, v11, v10, v12);
      }
    }

    return v6;
  }

  return a1;
}

int *asl_msg_copy(asl_object_t obj)
{
  return asl_msg_merge(0LL, obj);
}

uint64_t _asl_msg_test(_DWORD *a1, _DWORD *a2)
{
  int v13 = 0LL;
  __s1 = 0LL;
  __int16 v15 = 0;
  unsigned int v4 = asl_msg_fetch(a1, 0, &__s1, (int **)&v13, &v15);
  if (v4 == -1) {
    return 1LL;
  }
  unsigned int v5 = v4;
  while (1)
  {
    int v12 = 0LL;
    uint64_t result = asl_msg_lookup(a2, __s1, (int **)&v12, 0LL);
    __int16 v7 = v15;
    int v8 = v15 & 7;
    if (!v8) {
      goto LABEL_13;
    }
    if (v8 == 7)
    {
      if ((_DWORD)result) {
        return 0LL;
      }
      goto LABEL_14;
    }

    if (!(_DWORD)result)
    {
      int v9 = strcmp(__s1, "Time");
      unsigned int v10 = v12;
      int v11 = v13;
      if (!v9
        && (v7 & 0x160) == 0
        && v13
        && v12
        && (asl_core_parse_time(v13, 0LL) & 0x8000000000000000LL) == 0
        && (asl_core_parse_time(v10, 0LL) & 0x8000000000000000LL) == 0)
      {
        __asm { BR              X9; loc_180133D14 }
      }

      uint64_t result = _asl_msg_test_expression(v7, v11, v10);
LABEL_13:
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_14;
    }

    if (v8 != 6) {
      return 0LL;
    }
LABEL_14:
    unsigned int v5 = asl_msg_fetch(a1, v5, &__s1, (int **)&v13, &v15);
    if (v5 == -1) {
      return 1LL;
    }
  }

uint64_t _asl_msg_test_expression(__int16 a1, char *a2, char *__s)
{
  int v3 = a1 & 7;
  if (v3 == 7) {
    return 1LL;
  }
  unsigned int v5 = __s;
  unsigned int v6 = a2;
  __int16 v7 = a1;
  if ((a1 & 0x20) == 0)
  {
    if ((a1 & 0x40) == 0)
    {
      size_t v8 = 0LL;
      return _asl_msg_basic_test(a1, a2, __s, v8);
    }

    if (__s)
    {
      unsigned int v10 = strlen(__s);
      if (!v6) {
        return v7 & 1;
      }
    }

    else
    {
      unsigned int v10 = 0;
      if (!a2) {
        return v7 & 1;
      }
    }

    size_t v13 = strlen(v6);
    size_t v8 = v13;
    if ((_DWORD)v13)
    {
      if (v10 >= v13)
      {
        __s = &v5[v10 - v13];
        a1 = v7;
        a2 = v6;
        return _asl_msg_basic_test(a1, a2, __s, v8);
      }

      return v3 == 6;
    }

    return v7 & 1;
  }

  if ((a1 & 0x40) == 0)
  {
    if (__s)
    {
      unsigned int v9 = strlen(__s);
      if (!v6) {
        return v7 & 1;
      }
    }

    else
    {
      unsigned int v9 = 0;
      if (!a2) {
        return v7 & 1;
      }
    }

    size_t v12 = strlen(v6);
    size_t v8 = v12;
    if ((_DWORD)v12)
    {
      if (v9 >= v12)
      {
        a1 = v7;
        a2 = v6;
        __s = v5;
        return _asl_msg_basic_test(a1, a2, __s, v8);
      }

      return v3 == 6;
    }

    return v7 & 1;
  }

  if (__s)
  {
    unsigned int v11 = strlen(__s);
    if (!v6) {
      return v7 & 1;
    }
  }

  else
  {
    unsigned int v11 = 0;
    if (!a2) {
      return v7 & 1;
    }
  }

  size_t v14 = strlen(v6);
  size_t v15 = v14;
  if (!(_DWORD)v14) {
    return v7 & 1;
  }
  unsigned int v16 = v11 - v14;
  uint64_t result = 0LL;
  if (v3 != 2 && v3 != 4)
  {
    int v18 = 0;
    unsigned int v19 = 0;
    do
    {
      while (_asl_msg_basic_test(v7 & 0xFF0 | 1u, v6, &v5[v19], v15))
      {
        if ((v7 & 1) != 0) {
          return 1LL;
        }
        ++v18;
        if (++v19 > v16) {
          return v18 == 0;
        }
      }

      ++v19;
    }

    while (v19 <= v16);
    if ((v7 & 1) == 0) {
      return v18 == 0;
    }
    return 0LL;
  }

  return result;
}

uint64_t asl_msg_cmp(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 0LL;
  if (a1)
  {
    unsigned int v4 = a2;
    if (a2)
    {
      if (*a1 == *a2)
      {
        int v5 = 0;
        unsigned int v6 = a1;
        do
        {
          v5 += v6[2];
          unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
        }

        while (v6);
        __int16 v7 = a2;
        do
        {
          LODWORD(v6) = v7[2] + (_DWORD)v6;
          __int16 v7 = (_DWORD *)*((void *)v7 + 3);
        }

        while (v7);
        if (v5 == (_DWORD)v6)
        {
          size_t v12 = 0LL;
          size_t v13 = 0LL;
          __int16 v15 = 0;
          unsigned int v8 = asl_msg_fetch(a1, 0, &v13, (int **)&v12, &v15);
          if (v8 == -1) {
            return 1LL;
          }
          unsigned int v9 = v8;
          while (!asl_msg_lookup(v4, v13, (int **)&v11, &v14)
               && !strcmp(v12, v11)
               && (*a1 != 1 || v15 == v14))
          {
            unsigned int v9 = asl_msg_fetch(a1, v9, &v13, (int **)&v12, &v15);
            if (v9 == -1) {
              return 1LL;
            }
          }
        }

        return 0LL;
      }

      else
      {
        if (*a1 == 1)
        {
          unsigned int v10 = a1;
        }

        else
        {
          unsigned int v10 = a2;
          a2 = a1;
        }

        return _asl_msg_test(v10, a2);
      }
    }
  }

  return result;
}

uint64_t asl_msg_cmp_list(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2 && *(_DWORD *)(a2 + 8))
    {
      int v3 = (_DWORD *)result;
      uint64_t v4 = 0LL;
      while (!_asl_msg_test(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v4), v3))
      {
      }
    }

    return 1LL;
  }

  return result;
}

void *asl_msg_to_string_raw(int a1, _DWORD *a2, const char *a3)
{
  if (!a2) {
    return 0LL;
  }
  int v5 = 0;
  unsigned int v6 = a2;
  do
  {
    v5 += v6[2];
    unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
  }

  while (v6);
  if (!v5) {
    return 0LL;
  }
  __int16 v7 = asl_string_new(a1);
  if (v7)
  {
    __s = 0LL;
    __s1 = 0LL;
    __int16 v14 = 0LL;
    asl_msg_lookup(a2, "TimeNanoSec", (int **)&v14, 0LL);
    unsigned int v8 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0LL);
    if (v8 != -1)
    {
      unsigned int v9 = v8;
      int v10 = 0;
      do
      {
        if (__s1)
        {
          if (v10) {
            asl_string_append_char_no_encoding(v7, 32);
          }
          asl_string_append_char_no_encoding(v7, 91);
          asl_string_append_asl_key((uint64_t)v7, __s1);
          if (!strcmp(__s1, "Time"))
          {
            asl_string_append_char_no_encoding(v7, 32);
            if (__s && (unsigned int v11 = _asl_time_string(a3, __s, v14)) != 0LL)
            {
              size_t v12 = v11;
              asl_string_append_no_encoding(v7, v11);
              free(v12);
            }

            else
            {
              asl_string_append_char_no_encoding(v7, 48);
            }
          }

          else if (__s)
          {
            asl_string_append_char_no_encoding(v7, 32);
            asl_string_append((uint64_t)v7, __s);
          }

          asl_string_append_char_no_encoding(v7, 93);
          ++v10;
        }

        unsigned int v9 = asl_msg_fetch(a2, v9, &__s1, (int **)&__s, 0LL);
      }

      while (v9 != -1);
    }
  }

  return v7;
}

char *_asl_time_string(const char *a1, char *__s, const char *a3)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  unsigned int v22 = 0LL;
  *(void *)__int16 v24 = 0LL;
  if (!a1 || strlen(a1) > 0x1F)
  {
    strcpy(__str, "local");
LABEL_4:
    v26[0] = 0;
    goto LABEL_5;
  }

  snprintf(__str, 0x20uLL, "%s", a1);
  unsigned int v11 = strchr(__str, 46);
  if (!v11) {
    goto LABEL_4;
  }
  *unsigned int v11 = 0;
  int v12 = atoi(v11 + 1);
  v26[0] = 0;
  if (v12)
  {
    unsigned int v13 = v12;
    if (a3) {
      int v14 = atoi(a3);
    }
    else {
      int v14 = 0;
    }
    snprintf(v26, 0x10uLL, ".%09u", v14);
    if (v13 >= 9) {
      uint64_t v16 = 9LL;
    }
    else {
      uint64_t v16 = v13;
    }
    v26[v16 + 1] = 0;
  }

void *asl_string_append_asl_msg(void *a1, _DWORD *a2)
{
  if (a2)
  {
    if (*a2 == 1) {
      asl_string_append((uint64_t)a1, "Q ");
    }
    unsigned int v4 = asl_msg_fetch(a2, 0, &v10, (int **)&v9, &v8);
    if (v4 != -1)
    {
      unsigned int v5 = v4;
      int v6 = 0;
      do
      {
        if (v6) {
          asl_string_append_char_no_encoding(a1, 32);
        }
        asl_string_append_char_no_encoding(a1, 91);
        if (*a2 == 1)
        {
          asl_string_append_op(a1, v8);
          asl_string_append_char_no_encoding(a1, 32);
        }

        asl_string_append_asl_key((uint64_t)a1, v10);
        if (v9)
        {
          asl_string_append_char_no_encoding(a1, 32);
          asl_string_append((uint64_t)a1, v9);
        }

        asl_string_append_char_no_encoding(a1, 93);
        unsigned int v5 = asl_msg_fetch(a2, v5, &v10, (int **)&v9, &v8);
        --v6;
      }

      while (v5 != -1);
    }
  }

  return a1;
}

char *asl_msg_to_string(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = (char *)asl_string_new(2);
  if (result)
  {
    unsigned int v5 = result;
    appended = asl_string_append_asl_msg(result, a1);
    *a2 = asl_string_length((uint64_t)appended);
    return asl_string_release_return_bytes(v5);
  }

  return result;
}

__asl_object_s *asl_msg_from_string(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v25 = a1;
  next_word = (const char *)_asl_msg_get_next_word(&v25, &v26, 1);
  if (!next_word) {
    return 0LL;
  }
  int v2 = next_word;
  int v3 = strcmp(next_word, "Q");
  if (v3)
  {
    if (v26 == 4)
    {
      free(v2);
      unsigned int v4 = _asl_msg_get_next_word(&v25, &v26, 1);
      if (!v4) {
        return 0LL;
      }
      int v2 = v4;
    }

    int v5 = 0;
  }

  else
  {
    free(v2);
    int v5 = 1;
    int v2 = _asl_msg_get_next_word(&v25, &v26, 1);
  }

  int v6 = (char *)calloc(1uLL, 0x138uLL);
  int v7 = (__asl_object_s *)v6;
  if (!v6) {
    return v7;
  }
  *(void *)&__int128 v8 = -1LL;
  *((void *)&v8 + 1) = -1LL;
  *(_OWORD *)(v6 + 76) = v8;
  *((_OWORD *)v6 + 3) = v8;
  *((_OWORD *)v6 + 4) = v8;
  *((_OWORD *)v6 + 2) = v8;
  *((void *)v6 + 2) = 312LL;
  *(_DWORD *)int v6 = v5;
  *((_DWORD *)v6 + 1) = 1;
  if (!v2) {
    return v7;
  }
  while (2)
  {
    if (v26 != 1) {
      goto LABEL_67;
    }
    free(v2);
    if (v3)
    {
      int v9 = 0;
      goto LABEL_43;
    }

    int v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    if (!v10 || v26 != 3)
    {
      if (v10) {
        goto LABEL_66;
      }
      goto LABEL_67;
    }

    int v9 = 0;
    for (unsigned int i = 0; ; ++i)
    {
      int v12 = *((unsigned __int8 *)v10 + i);
      if (v12 == 67)
      {
        v9 |= 0x10u;
        goto LABEL_22;
      }

      if (!*((_BYTE *)v10 + i)) {
        goto LABEL_42;
      }
      if (v12 == 46) {
        break;
      }
LABEL_22:
      int v13 = v9 | 0x100;
      if (v12 != 82) {
        int v13 = v9;
      }
      if (v12 == 78) {
        v13 |= 0x80u;
      }
      if (v12 == 83) {
        v13 |= 0x60u;
      }
      if (v12 == 65) {
        v13 |= 0x20u;
      }
      if (v12 == 90) {
        v13 |= 0x40u;
      }
      if (v12 == 60) {
        v13 |= 4u;
      }
      if (v12 == 62) {
        v13 |= 2u;
      }
      int v14 = v13 | (v12 == 61);
      if (v12 == 33) {
        v14 |= 6u;
      }
      if (v12 == 84) {
        int v9 = v14 | 7;
      }
      else {
        int v9 = v14;
      }
    }

    int v9 = 0;
LABEL_42:
    free(v10);
LABEL_43:
    int v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    __int16 v15 = (char *)v10;
    int v16 = v26;
    if (v26 == 4) {
      int v16 = 3;
    }
    int v26 = v16;
    if (!v10 || v16 != 3)
    {
      if (v10) {
        goto LABEL_66;
      }
      goto LABEL_67;
    }

    unint64_t v17 = (char *)_asl_msg_get_next_word(&v25, &v26, 0);
    if (v26 == 4) {
      int v18 = 3;
    }
    else {
      int v18 = v26;
    }
    int v26 = v18;
    if (v17)
    {
      int v19 = v17;
      if (v18 == 3)
      {
        uint64_t v20 = (int *)v7;
        int v21 = v15;
        unsigned int v22 = v19;
LABEL_55:
        asl_msg_set_key_val_op(v20, v21, v22, v9);
        free(v15);
        free(v19);
        if (v18 == 2) {
          goto LABEL_59;
        }
        time_t v23 = _asl_msg_get_next_word(&v25, &v26, 1);
        if (v23)
        {
          if (v26 != 2) {
            goto LABEL_67;
          }
          free(v23);
LABEL_59:
          int v2 = _asl_msg_get_next_word(&v25, &v26, 1);
          if (!v2) {
            return v7;
          }
          continue;
        }
      }

      else
      {
        if (v18 == 2)
        {
          uint64_t v20 = (int *)v7;
          int v21 = v15;
          unsigned int v22 = 0LL;
          goto LABEL_55;
        }

        free(v15);
        int v10 = v19;
LABEL_66:
        free(v10);
LABEL_67:
        asl_release(v7);
        return 0LL;
      }
    }

    else
    {
      asl_msg_set_key_val_op((int *)v7, v15, 0LL, v9);
      free(v15);
    }

    return v7;
  }

void *_asl_msg_get_next_word(void *result, _DWORD *a2, int a3)
{
  *a2 = 0;
  if (!result) {
    return result;
  }
  int v3 = (_BYTE *)*result;
  if (!*result || !*v3) {
    return 0LL;
  }
  if (*v3 == 32) {
    *uint64_t result = ++v3;
  }
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *v3;
      if (v5 != 32 && v5 != 9) {
        break;
      }
      *uint64_t result = ++v3;
    }
  }

  else
  {
    unsigned int v5 = *v3;
  }

  if (!v5 || v5 == 10) {
    return 0LL;
  }
  if (v5 == 91)
  {
    *a2 = 1;
    *uint64_t result = v3 + 1;
    uint64_t result = malloc(2uLL);
    if (!result) {
      return result;
    }
    __int16 v8 = 91;
LABEL_48:
    *(_WORD *)uint64_t result = v8;
    return result;
  }

  if (a3 && v5 == 32)
  {
    int v9 = 0;
    *uint64_t result = v3;
    int v10 = v3;
    goto LABEL_45;
  }

  uint64_t v11 = 0LL;
  int v9 = 0;
  unsigned int v12 = 0;
  while (v5 == 92)
  {
    unsigned int v5 = v12 + 1;
    int v13 = v3[v12 + 1];
    uint64_t v14 = (v13 - 77);
    if (((1LL << (v13 - 77)) & 0x2E20231C000LL) == 0)
    {
      if (v13 != 77)
      {
        if (v14 == 17)
        {
          unsigned int v5 = v12 + 2;
          goto LABEL_40;
        }

LABEL_37:
        if ((v13 & 0xFC) != 0x30) {
          return 0LL;
        }
      }

      if (!v3[v12 + 2]) {
        return 0LL;
      }
      unsigned int v5 = v12 + 3;
LABEL_40:
      if (!v3[v5]) {
        return 0LL;
      }
    }

LABEL_41:
    uint64_t v11 = v5 + 1;
    unsigned int v12 = v11;
    ++v9;
    LOBYTE(v5) = v3[v11];
  }

  if ((_BYTE)v5 && v5 != 93)
  {
    unsigned int v5 = v12;
    goto LABEL_41;
  }

LABEL_45:
  if (*v10 != 93)
  {
    unsigned int v12 = 0;
    char v15 = 1;
    goto LABEL_50;
  }

  *a2 = 2;
  *uint64_t result = v10 + 1;
  uint64_t result = malloc(2uLL);
  if (result)
  {
    __int16 v8 = 93;
    goto LABEL_48;
  }

  return result;
}

char *asl_format_message(char *result, char *__s1, char *a3, int a4, _DWORD *a5)
{
  uint64_t v84 = *MEMORY[0x1895FEE08];
  *a5 = 0;
  if (!result) {
    return result;
  }
  int v9 = result;
  if (!__s1 || !strcmp(__s1, "raw"))
  {
LABEL_171:
    int v75 = 0LL;
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0LL);
    uint64_t v30 = (char *)asl_msg_to_string_raw(a4, v9, a3);
    int v26 = v30;
    goto LABEL_172;
  }

  if (!strcmp(__s1, "std")) {
    goto LABEL_31;
  }
  if (!strcmp(__s1, "bsd")) {
    goto LABEL_35;
  }
  if (!strcmp(__s1, "xml"))
  {
    int v75 = 0LL;
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0LL);
    uint64_t result = (char *)asl_string_new(a4);
    if (!result) {
      return result;
    }
    unsigned int v12 = result;
    asl_string_append_char_no_encoding(result, 9);
    asl_string_append_no_encoding(v12, "<dict>");
    asl_string_append_char_no_encoding(v12, 10);
    unsigned int v13 = asl_msg_fetch(v9, 0, (char **)__str, (int **)&__s, 0LL);
    if (v13 == -1)
    {
LABEL_27:
      asl_string_append_char_no_encoding(v12, 9);
      asl_string_append_no_encoding(v12, "</dict>");
      asl_string_append_char_no_encoding(v12, 10);
      *a5 = asl_string_length((uint64_t)v12);
      char v22 = v12;
      return asl_string_release_return_bytes(v22);
    }

    unsigned int v14 = v13;
    while (1)
    {
      if (asl_is_utf8(*(unsigned __int8 **)__str) == 1)
      {
        asl_string_append_xml_tag(v12, "key", *(char **)__str);
        if (!strcmp(*(const char **)__str, "Time"))
        {
          unsigned int v17 = _asl_time_string(a3, __s, v75);
          if (!v17)
          {
            char v15 = v12;
            uint64_t v16 = "0";
            goto LABEL_25;
          }

          int v18 = v17;
          uint64_t v19 = v12;
          int v20 = "string";
        }

        else
        {
          if (asl_is_utf8((unsigned __int8 *)__s) == 1)
          {
            char v15 = v12;
            uint64_t v16 = __s;
LABEL_25:
            asl_string_append_xml_tag(v15, "string", v16);
            goto LABEL_26;
          }

          size_t v21 = strlen(__s);
          int v18 = asl_b64_encode((uint64_t)__s, v21);
          uint64_t v19 = v12;
          int v20 = "data";
        }

        asl_string_append_xml_tag(v19, v20, v18);
        free(v18);
      }

LABEL_169:
        a3 = 0LL;
LABEL_36:
        int v75 = 0LL;
        asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0LL);
        uint64_t v76 = 0LL;
        __int128 v77 = 0uLL;
        __s1a = 0LL;
        __s = 0LL;
        int v79 = 0LL;
        v80 = 0LL;
        v78 = 0LL;
        __int16 v24 = 0LL;
        unsigned int v25 = 7;
        asl_msg_lookup(v9, "PID", (int **)&__s1a, 0LL);
        asl_msg_lookup(v9, "Message", (int **)&v79, 0LL);
        asl_msg_lookup(v9, "RefProc", (int **)&v77 + 1, 0LL);
        asl_msg_lookup(v9, "RefPID", (int **)&v77, 0LL);
        uint64_t result = (char *)asl_string_new(a4);
        if (result)
        {
          int v26 = result;
          if (v24)
          {
            asl_string_append((uint64_t)result, v24);
            free(v24);
          }

          else
          {
            asl_string_append_char_no_encoding(result, 48);
          }

          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, __s);
          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, v80);
          if (__s1a && strcmp(__s1a, "-1"))
          {
            asl_string_append_char_no_encoding(v26, 91);
            asl_string_append((uint64_t)v26, __s1a);
            asl_string_append_char_no_encoding(v26, 93);
          }

          int v27 = DWORD2(v77) | v77;
          if (v77 != 0)
          {
            asl_string_append_no_encoding(v26, " (");
            if (*((void *)&v77 + 1)) {
              asl_string_append((uint64_t)v26, *((char **)&v77 + 1));
            }
            int v27 = v77;
            if ((void)v77)
            {
              asl_string_append_char_no_encoding(v26, 91);
              asl_string_append((uint64_t)v26, (char *)v77);
              asl_string_append_char_no_encoding(v26, 93);
              int v27 = (void)v77 != 0LL;
            }
          }

          if (*((void *)&v77 + 1) || v27) {
            asl_string_append_char_no_encoding(v26, 41);
          }
          if (v23)
          {
            asl_string_append_no_encoding(v26, " <");
            if (v25 > 7) {
              uint64_t v28 = "unknown";
            }
            else {
              uint64_t v28 = off_189625CC0[v25];
            }
            asl_string_append((uint64_t)v26, v28);
            asl_string_append_char_no_encoding(v26, 62);
          }

          asl_string_append_no_encoding(v26, ": ");
          __int16 v29 = v79;
          if (!v79) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }

        return result;
      }

LABEL_35:
      int v23 = 0;
      goto LABEL_36;
    }

    int v75 = 0LL;
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0LL);
    uint64_t result = (char *)asl_string_new(a4);
    if (!result) {
      return result;
    }
    int v32 = result;
    size_t v33 = strlen(__s1);
    if (v33 >= 0x201)
    {
      uint64_t result = (char *)malloc(v33);
      unsigned int v34 = result;
      if (!result) {
        return result;
      }
    }

    else
    {
      unsigned int v34 = __str;
    }

    LODWORD(v35) = 0;
LABEL_78:
    int v36 = &__s1[(int)v35];
    unsigned int v37 = *v36;
    if (v37 != 36)
    {
      if (v37 == 92)
      {
        uint64_t v47 = (int)v35;
        uint64_t v35 = (int)v35 + 1LL;
        unsigned int v48 = __s1[v35];
        if (v48 > 0x60)
        {
          switch(__s1[v35])
          {
            case 'a':
              size_t v39 = v32;
              char v38 = 7;
              goto LABEL_82;
            case 'b':
              size_t v39 = v32;
              char v38 = 8;
              goto LABEL_82;
            case 'e':
              size_t v39 = v32;
              char v38 = 27;
              goto LABEL_82;
            case 'f':
              size_t v39 = v32;
              char v38 = 12;
              goto LABEL_82;
            case 'n':
              size_t v39 = v32;
              char v38 = 10;
              goto LABEL_82;
            case 'r':
              size_t v39 = v32;
              char v38 = 13;
              goto LABEL_82;
            case 's':
              size_t v39 = v32;
              char v38 = 32;
              goto LABEL_82;
            case 't':
              size_t v39 = v32;
              char v38 = 9;
              goto LABEL_82;
            case 'v':
              size_t v39 = v32;
              char v38 = 11;
              goto LABEL_82;
            default:
              goto LABEL_143;
          }
        }

        switch(v48)
        {
          case '$':
            size_t v39 = v32;
            char v38 = 36;
            break;
          case '\'':
            size_t v39 = v32;
            char v38 = 39;
            break;
          case '\\':
            size_t v39 = v32;
            char v38 = 92;
            break;
          default:
LABEL_143:
            unsigned int v37 = (char)v48 - 48;
            if (v37 > 9) {
              goto LABEL_162;
            }
            int v65 = v47 + 2;
            unsigned int v66 = __s1[v47 + 2] - 48;
            if (v66 <= 9)
            {
              uint64_t v67 = v47 + 3;
              int v68 = __s1[v67];
              LOBYTE(v37) = v66 + 8 * v37;
              LODWORD(v35) = (v68 - 48) <= 9 ? v67 : v65;
            }

LABEL_81:
            char v38 = v37;
            size_t v39 = v32;
            break;
        }

LABEL_82:
        asl_string_append_char_no_encoding(v39, v38);
        goto LABEL_162;
      }

      if (*v36) {
        goto LABEL_81;
      }
      if (v34 != __str) {
        free(v34);
      }
      asl_string_append_char_no_encoding(v32, 10);
      *a5 = asl_string_length((uint64_t)v32);
      char v22 = v32;
      return asl_string_release_return_bytes(v22);
    }

    int v40 = 0;
    int v41 = v35 + 1;
    uint64_t v42 = v41;
    size_t v43 = &__s1[v41];
    while (1)
    {
      int v45 = *v43++;
      int v44 = v45;
      if (v45 <= 39) {
        break;
      }
      if (v44 != 41)
      {
        if (v44 == 40)
        {
          ++v40;
          goto LABEL_98;
        }

LABEL_161:
        LODWORD(v35) = v41 - 1;
LABEL_162:
        LODWORD(v35) = v35 + 1;
        goto LABEL_78;
      }

LABEL_98:
      ++v41;
    }

    if (v44 == 32)
    {
      if (!v40) {
        goto LABEL_106;
      }
      goto LABEL_98;
    }

    if (!v44) {
      goto LABEL_106;
    }
    goto LABEL_94;
  }

  int v75 = 0LL;
  asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0LL);
  int v79 = 0LL;
  int v31 = asl_msg_lookup(v9, "Message", (int **)&v79, 0LL);
  uint64_t result = 0LL;
  if (!v31)
  {
    uint64_t result = (char *)asl_string_new(a4);
    if (result)
    {
      int v26 = result;
      __int16 v29 = v79;
LABEL_68:
      asl_string_append((uint64_t)v26, v29);
LABEL_69:
      uint64_t v30 = v26;
LABEL_172:
      asl_string_append_char_no_encoding(v30, 10);
      *a5 = asl_string_length((uint64_t)v26);
      char v22 = v26;
      return asl_string_release_return_bytes(v22);
    }
  }

  return result;
}

_DWORD *_asl_log_args_to_xpc(uint64_t a1, _DWORD *a2, void *a3)
{
  unsigned int v5 = (_DWORD *)asl_client_kvdict(a1);
  _asl_msg_to_xpc(v5, a3);
  return _asl_msg_to_xpc(a2, a3);
}

_DWORD *_asl_msg_to_xpc(_DWORD *result, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (result)
  {
    if (a2)
    {
      int v3 = result;
      unsigned int v13 = 0LL;
      asl_msg_lookup(result, "TimeNanoSec", (int **)&v13, 0LL);
      uint64_t result = (_DWORD *)asl_msg_fetch(v3, 0, &__s, (int **)&v14, 0LL);
      if ((_DWORD)result != -1)
      {
        unsigned int v4 = result;
        do
        {
          unsigned int v5 = __s;
          if (__s)
          {
            unsigned int v6 = strlen(__s);
            int v7 = _asl_msg_std_key(__s, v6);
            __int16 v8 = v14;
            if (!v14)
            {
              xpc_object_t v9 = xpc_null_create();
              goto LABEL_21;
            }

            if (v7 != 32770)
            {
              if (v7 == 32769)
              {
                int64_t v10 = 1000000000 * asl_core_parse_time(v14, 0LL);
                if (v13) {
                  v10 += atoll(v13);
                }
                xpc_object_t v9 = xpc_date_create(v10);
              }

              else if (v7)
              {
                if ((v7 & 0xFFFFFFF7) == 0x8006
                  || (unsigned __int16)(v7 + 32761) <= 1u
                  || v7 == 32777
                  || (unsigned __int16)(v7 + 32757) <= 1u)
                {
                  int64_t v11 = atoll(v14);
                  xpc_object_t v9 = xpc_int64_create(v11);
                }

                else
                {
                  if (v7 == 32784) {
                    goto LABEL_22;
                  }
LABEL_11:
                  xpc_object_t v9 = xpc_string_create(v8);
                }
              }

              else
              {
                if (strcmp(v5, "SenderMachUUID")) {
                  goto LABEL_11;
                }
                if (uuid_parse(v8, uu)) {
                  goto LABEL_22;
                }
                xpc_object_t v9 = xpc_uuid_create(uu);
              }

LABEL_21:
              unsigned int v12 = v9;
              xpc_dictionary_set_value(a2, __s, v9);
              xpc_release(v12);
            }
          }

uint64_t (**asl_msg_jump_table())()
{
  return &asl_msg_jump_table_jump;
}

char *_jump_alloc_0(int a1)
{
  uint64_t result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)uint64_t result = a1;
    *((_DWORD *)result + 1) = 1;
  }

  return result;
}

void _jump_dealloc_2(char *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    while (1)
    {
      int v2 = (char *)*((void *)v1 + 3);
      unsigned int v3 = *(_DWORD *)v1 == 1 ? 10 : 0;
      uint64_t v4 = *(_DWORD *)v1 ? v3 : 15LL;
      if ((_DWORD)v4) {
        break;
      }
LABEL_30:
      free(v1);
      uint64_t v1 = v2;
      if (!v2) {
        return;
      }
    }

    unint64_t v5 = 0LL;
    unsigned int v6 = v1 + 92;
    while (1)
    {
      int v7 = *(_DWORD *)v1;
      if (!*(_DWORD *)v1) {
        break;
      }
      if (v7 != 1)
      {
        int v8 = 0;
        if (!v7)
        {
LABEL_20:
          uint64_t v9 = 15LL;
LABEL_21:
          __int16 v10 = *(_WORD *)&v1[2 * v5 + 32 + 2 * v9];
          goto LABEL_22;
        }

uint64_t _jump_set_key_val_op(int *a1, char *a2, const char *a3, int a4)
{
  else {
    return 0LL;
  }
}

uint64_t _jump_get_key_val_op_at_index(uint64_t a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  uint64_t v8 = 0xFFFFFFFFLL;
  unsigned int v12 = -1;
  int64_t v11 = 0LL;
  if (!_asl_msg_resolve_index(a1, a2, &v11, &v12))
  {
    if (a3) {
      *a3 = _asl_msg_slot_key(v11, v12);
    }
    if (a4) {
      *a4 = _asl_msg_slot_val((int *)v11, v12);
    }
    if (a5)
    {
      if (v11)
      {
        __int16 v9 = 0;
        if (v12 <= 9 && *(_DWORD *)v11 == 1) {
          __int16 v9 = *(_WORD *)&v11[2 * v12 + 72];
        }
      }

      else
      {
        __int16 v9 = 0;
      }

      uint64_t v8 = 0LL;
      *a5 = v9;
    }

    else
    {
      return 0LL;
    }
  }

  return v8;
}

uint64_t _jump_count_1(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    LODWORD(result) = 0;
    do
    {
      uint64_t result = (*(_DWORD *)(v1 + 8) + result);
      uint64_t v1 = *(void *)(v1 + 24);
    }

    while (v1);
  }

  return result;
}

int *_jump_append_2(int *a1, asl_object_t obj)
{
  uint64_t result = (int *)asl_get_type(obj);
  return result;
}

uint64_t _jump_prepend_0(uint64_t result, asl_object_t obj)
{
  if (result)
  {
    unsigned int v3 = (int *)result;
    uint64_t result = asl_get_type(obj);
    if (result <= 1)
    {
      if (obj)
      {
        uint32_t type = asl_get_type(obj);
        uint64_t result = asl_msg_fetch(obj, 0, &v8, (int **)&v7, &v9);
        if ((_DWORD)result != -1)
        {
          unsigned int v5 = result;
          do
          {
            if (type)
            {
              int v6 = v9;
            }

            else
            {
              int v6 = 0;
              unsigned __int16 v9 = 0;
            }

            asl_msg_set_key_val_op(v3, v8, v7, v6);
            uint64_t result = asl_msg_fetch(obj, v5, &v8, (int **)&v7, &v9);
            unsigned int v5 = result;
          }

          while ((_DWORD)result != -1);
        }
      }
    }
  }

  return result;
}

uint64_t _jump_search_2(__asl_object_s *a1, _DWORD *a2)
{
  uint64_t v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _jump_match_2(__asl_object_s *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _asl_msg_std_key(char *__s1, unsigned int a2)
{
  if (a2 >= 0x13 && !strncmp(__s1, "com.apple.message.", 0x12uLL))
  {
    unsigned int v5 = __s1 + 18;
    if (!strcmp(v5, "domain"))
    {
      return (unsigned __int16)-32511;
    }

    else if (!strcmp(v5, "domain_scope"))
    {
      return (unsigned __int16)-32510;
    }

    else if (!strcmp(v5, "result"))
    {
      return (unsigned __int16)-32509;
    }

    else if (!strcmp(v5, "signature"))
    {
      return (unsigned __int16)-32508;
    }

    else if (!strcmp(v5, "signature2"))
    {
      return (unsigned __int16)-32507;
    }

    else if (!strcmp(v5, "signature3"))
    {
      return (unsigned __int16)-32506;
    }

    else if (!strcmp(v5, "success"))
    {
      return (unsigned __int16)-32505;
    }

    else if (!strcmp(v5, "uuid"))
    {
      return (unsigned __int16)-32504;
    }

    else if (!strcmp(v5, "value"))
    {
      return (unsigned __int16)-32503;
    }

    else if (!strcmp(v5, "value2"))
    {
      return (unsigned __int16)-32502;
    }

    else if (!strcmp(v5, "value3"))
    {
      return (unsigned __int16)-32501;
    }

    else if (!strcmp(v5, "value4"))
    {
      return (unsigned __int16)-32500;
    }

    else if (!strcmp(v5, "value5"))
    {
      return (unsigned __int16)-32499;
    }

    else
    {
      return 0;
    }
  }

  else
  {
    switch(a2)
    {
      case 3u:
        if (!strcmp(__s1, "PID"))
        {
          unsigned __int16 v4 = -32762;
        }

        else if (!strcmp(__s1, "UID"))
        {
          unsigned __int16 v4 = -32761;
        }

        else
        {
          if (strcmp(__s1, "GID")) {
            goto LABEL_7;
          }
          unsigned __int16 v4 = -32760;
        }

        break;
      case 4u:
LABEL_7:
        if (!strcmp(__s1, "Time"))
        {
          unsigned __int16 v4 = -32767;
        }

        else
        {
          if (strcmp(__s1, "Host")) {
            goto LABEL_9;
          }
          unsigned __int16 v4 = -32765;
        }

        break;
      case 5u:
LABEL_9:
        if (strcmp(__s1, "Level")) {
          goto LABEL_10;
        }
        unsigned __int16 v4 = -32759;
        break;
      case 6u:
LABEL_10:
        if (!strcmp(__s1, "Sender"))
        {
          unsigned __int16 v4 = -32764;
        }

        else
        {
          if (strcmp(__s1, "RefPID")) {
            goto LABEL_12;
          }
          unsigned __int16 v4 = -32754;
        }

        break;
      case 7u:
LABEL_12:
        if (!strcmp(__s1, "Message"))
        {
          unsigned __int16 v4 = -32758;
        }

        else if (!strcmp(__s1, "Session"))
        {
          unsigned __int16 v4 = -32755;
        }

        else if (!strcmp(__s1, "ReadUID"))
        {
          unsigned __int16 v4 = -32757;
        }

        else if (!strcmp(__s1, "ReadGID"))
        {
          unsigned __int16 v4 = -32756;
        }

        else
        {
          if (strcmp(__s1, "RefProc")) {
            goto LABEL_17;
          }
          unsigned __int16 v4 = -32753;
        }

        break;
      case 8u:
LABEL_17:
        if (strcmp(__s1, "Facility")) {
          goto LABEL_18;
        }
        unsigned __int16 v4 = -32763;
        break;
      case 9u:
LABEL_18:
        if (strcmp(__s1, "ASLOption")) {
          goto LABEL_19;
        }
        unsigned __int16 v4 = -32750;
        break;
      case 0xBu:
LABEL_19:
        if (strcmp(__s1, "TimeNanoSec")) {
          goto LABEL_20;
        }
        unsigned __int16 v4 = -32766;
        break;
      case 0xCu:
LABEL_20:
        if (strcmp(__s1, "ASLMessageID")) {
          goto LABEL_21;
        }
        unsigned __int16 v4 = -32752;
        break;
      case 0xDu:
LABEL_21:
        if (strcmp(__s1, "ASLExpireTime")) {
          goto LABEL_22;
        }
        unsigned __int16 v4 = -32751;
        break;
      case 0xEu:
LABEL_22:
        if (strcmp(__s1, "ASLFreeNotify")) {
          goto LABEL_23;
        }
        unsigned __int16 v4 = -32749;
        break;
      default:
LABEL_23:
        unsigned __int16 v4 = 0;
        break;
    }
  }

  return v4;
}

uint64_t _asl_msg_new_key_val_op(int *a1, char *__s, const char *a3, __int16 a4)
{
  int v6 = a1;
  int v7 = *a1;
  if (*a1 == 1) {
    unsigned int v8 = 10;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v7) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 15LL;
  }
  size_t v33 = 0LL;
  __src = 0LL;
  unsigned int v10 = strlen(__s);
  int v11 = _asl_msg_std_key(__s, v10);
  if (v11) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = v10 + 1;
  }
  if (a3)
  {
    unsigned int v13 = strlen(a3) + 1;
    uint64_t v30 = v13;
  }

  else
  {
    unsigned int v13 = 0;
  }

  if (v12 < 0xDD)
  {
    unsigned int v14 = 0LL;
  }

  else
  {
    unsigned int v14 = strdup(__s);
    __src = v14;
    unsigned int v12 = 8;
  }

  int v32 = v11;
  if (v13 < 0xDD)
  {
    char v15 = 0LL;
  }

  else
  {
    char v15 = strdup(a3);
    size_t v33 = v15;
    unsigned int v13 = 8;
  }

  unsigned int v16 = v13 + v12;
  if (v12 && v16 >= 0xDD && !v15)
  {
    char v15 = strdup(a3);
    size_t v33 = v15;
    unsigned int v16 = v12 + 8;
    unsigned int v13 = 8;
  }

  if (v16 >= 0xDD && !v14)
  {
    unsigned int v14 = strdup(__s);
    __src = v14;
    unsigned int v16 = v13 + 8;
    unsigned int v12 = 8;
  }

  if (v16 > 0xDC)
  {
LABEL_27:
    if (v14) {
      free(v14);
    }
    if (v15) {
      free(v15);
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t v18 = v10;
  while (1)
  {
    uint64_t v19 = (char *)v6;
    if (v16 <= 220 - v6[3] && (_DWORD)v9 != 0) {
      break;
    }
LABEL_43:
    int v6 = (int *)*((void *)v19 + 3);
    if (!v6)
    {
      uint64_t v23 = v18;
      page = _asl_msg_make_page(v7);
      if (!page) {
        goto LABEL_27;
      }
      LODWORD(v21) = 0;
      *((void *)v19 + 3) = page;
      uint64_t v19 = page;
      LOWORD(v25) = v32;
      uint64_t v18 = v23;
      if (!v32) {
        goto LABEL_48;
      }
      goto LABEL_51;
    }
  }

  unint64_t v21 = 0LL;
  int v22 = *(_DWORD *)v19;
  while (v22 && (v22 != 1 || v21 > 9) || *(__int16 *)&v19[2 * v21 + 32] != -1)
  {
    if (v9 == ++v21) {
      goto LABEL_43;
    }
  }

  LOWORD(v25) = v32;
  if (!v32)
  {
LABEL_48:
    uint64_t v25 = *((unsigned int *)v19 + 3);
    if (v14)
    {
      uint64_t v26 = v18;
      memcpy(&v19[v25 + 92], &__src, v12);
      *((void *)v19 + 2) += v26;
      LOWORD(v25) = v25 | 0x4000;
    }

    else
    {
      memcpy(&v19[v25 + 92], __s, v12);
    }
  }

LABEL_51:
  int v27 = *(_DWORD *)v19;
  unsigned int v28 = *((_DWORD *)v19 + 3) + v12;
  *((_DWORD *)v19 + 3) = v28;
  if (a3)
  {
    if (v33)
    {
      memcpy(&v19[v28 + 92], &v33, v13);
      *((void *)v19 + 2) += v30;
      LOWORD(v28) = v28 | 0x4000;
    }

    else
    {
      memcpy(&v19[v28 + 92], a3, v13);
    }

    int v27 = *(_DWORD *)v19;
    if (*(_DWORD *)v19)
    {
      int v29 = 10;
    }

    else
    {
      int v29 = 15;
    }

    *(_WORD *)&v19[2 * (v29 + v21) + 32] = v28;
LABEL_65:
    *((_DWORD *)v19 + 3) += v13;
  }

  uint64_t result = 0LL;
  ++*((_DWORD *)v19 + 2);
  return result;
}

uint64_t _asl_msg_basic_test(__int16 a1, char *a2, char *__s1, size_t __n)
{
  char v4 = a1;
  if (!a2 || !__s1) {
    return v4 & 6;
  }
  int v6 = a1 & 7;
  if ((a1 & 0x100) != 0)
  {
    uint64_t result = 0LL;
    if (v6 == 2 || v6 == 4) {
      return result;
    }
    memset(&v23, 0, sizeof(v23));
    if ((v4 & 0x10) != 0) {
      int v9 = 7;
    }
    else {
      int v9 = 5;
    }
    if (!regcomp(&v23, a2, v9))
    {
      int v19 = regexec(&v23, __s1, 0LL, 0LL, 0);
      MEMORY[0x186DF5938](&v23);
      if (v6 == 6) {
        return v19 != 0;
      }
      else {
        return v19 == 0;
      }
    }

    return v4 & 6;
  }

  if ((a1 & 0x80) != 0)
  {
    unsigned int v10 = a2 + 1;
    if (((*a2 - 43) & 0xFD) != 0) {
      unsigned int v10 = a2;
    }
    int v11 = *v10;
    if (v11)
    {
      uint64_t v12 = (((*a2 - 43) & 0xFD) == 0) + 1LL;
      while (((char)v11 - 48) < 0xA)
      {
        int v11 = a2[v12++];
        if (!v11)
        {
          unsigned int v13 = __s1 + 1;
          if (((*__s1 - 43) & 0xFD) != 0) {
            unsigned int v13 = __s1;
          }
          int v14 = *v13;
          if (v14)
          {
            uint64_t v15 = (((*__s1 - 43) & 0xFD) == 0) + 1LL;
            while (((char)v14 - 48) < 0xA)
            {
              int v14 = __s1[v15++];
              if (!v14)
              {
                uint64_t v16 = atoll(a2);
                uint64_t v17 = atoll(__s1);
                switch(v6)
                {
                  case 1:
                    return v17 == v16;
                  case 2:
                    BOOL v20 = v17 <= v16;
LABEL_44:
                    uint64_t result = !v20;
                    break;
                  case 3:
                    uint64_t result = v17 >= v16;
                    break;
                  case 4:
                    BOOL v21 = v17 < v16;
LABEL_50:
                    uint64_t result = v21;
                    break;
                  case 5:
                    uint64_t result = v17 <= v16;
                    break;
                  case 6:
                    BOOL v22 = v17 == v16;
LABEL_54:
                    uint64_t result = !v22;
                    break;
                  default:
                    uint64_t result = 0LL;
                    break;
                }

                return result;
              }
            }
          }

          break;
        }
      }
    }

    return v6 == 6;
  }

  else
  {
    if ((a1 & 0x10) != 0)
    {
      if ((_DWORD)__n) {
        int v7 = strncasecmp(__s1, a2, __n);
      }
      else {
        int v7 = strcasecmp(__s1, a2);
      }
    }

    else if ((_DWORD)__n)
    {
      int v7 = strncmp(__s1, a2, __n);
    }

    else
    {
      int v7 = strcmp(__s1, a2);
    }

    switch(v6)
    {
      case 1:
        return v7 == 0;
      case 2:
        BOOL v20 = v7 <= 0;
        goto LABEL_44;
      case 3:
        uint64_t result = v7 >= 0;
        break;
      case 4:
        uint64_t result = v7 >> 31;
        break;
      case 5:
        BOOL v21 = v7 < 1;
        goto LABEL_50;
      case 6:
        BOOL v22 = v7 == 0;
        goto LABEL_54;
      default:
        return v6 == 6;
    }
  }

  return result;
}

uint64_t asl_store_open_write(const char *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  if (!a2) {
    return 1LL;
  }
  started = _asl_start_today();
  if (!started) {
    return 9999LL;
  }
  unsigned int v5 = started;
  if (!a1) {
    a1 = (const char *)asl_filesystem_path(0);
  }
  memset(&v19, 0, sizeof(v19));
  if (!stat(a1, &v19))
  {
    if ((v19.st_mode & 0xF000) == 0x4000) {
      goto LABEL_11;
    }
    return 2LL;
  }

  if (*__error() != 2) {
    return 2LL;
  }
  if (mkdir(a1, 0x1EDu)) {
    return 8LL;
  }
LABEL_11:
  snprintf(__str, 0x400uLL, "%s/%s", a1, "StoreData");
  memset(&v19, 0, sizeof(v19));
  if (stat(__str, &v19))
  {
    if (*__error() == 2)
    {
      int v7 = fopen(__str, "w+");
      if (v7)
      {
        unsigned int v8 = v7;
        unint64_t __ptr = 0LL;
        if (fwrite(&__ptr, 8uLL, 1uLL, v7) != 1 || (int v18 = 0, fwrite(&v18, 4uLL, 1uLL, v8) != 1))
        {
          fclose(v8);
          return 8LL;
        }

        fflush(v8);
        goto LABEL_21;
      }
    }

    return 9999LL;
  }

  int v9 = fopen(__str, "r+");
  if (!v9) {
    return 9999LL;
  }
  unsigned int v8 = v9;
  if (fread(&__ptr, 8uLL, 1uLL, v9) != 1)
  {
    fclose(v8);
    return 7LL;
  }

  unint64_t __ptr = asl_core_ntohq(__ptr);
LABEL_21:
  unsigned int v10 = calloc(1uLL, 0xA58uLL);
  if (!v10)
  {
    fclose(v8);
    return 9LL;
  }

  int v11 = v10;
  *unsigned int v10 = 0x100000004LL;
  if (a1) {
    uint64_t v12 = a1;
  }
  else {
    uint64_t v12 = (const char *)asl_filesystem_path(0);
  }
  unsigned int v13 = strdup(v12);
  v11[2] = v13;
  if (!v13)
  {
    fclose(v8);
    free(v11);
    return 9LL;
  }

  uint64_t v14 = 0LL;
  v11[326] = v5;
  v11[327] = (char *)v5 + 86400;
  uint64_t v15 = __ptr + 1;
  v11[3] = v8;
  v11[4] = v15;
  do
  {
    uint64_t v16 = &v11[v14];
    *(_OWORD *)(v16 + 5) = 0uLL;
    v16[9] = 0LL;
    *(_OWORD *)(v16 + 7) = 0uLL;
    v16[6] = -1LL;
    v14 += 5LL;
  }

  while (v14 != 320);
  uint64_t result = 0LL;
  *a2 = v11;
  return result;
}

uint64_t asl_store_set_flags(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t result = *(unsigned int *)(result + 2640);
    *(_DWORD *)(v2 + 2640) = a2;
  }

  return result;
}

uint64_t asl_store_statistics(uint64_t a1, char **a2)
{
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  uint64_t v3 = asl_msg_new(0);
  if (!v3) {
    return 9LL;
  }
  char v4 = v3;
  uint64_t result = 0LL;
  *a2 = v4;
  return result;
}

uint64_t asl_store_open_read(char *a1, void *a2)
{
  if (!a2) {
    return 1LL;
  }
  uint64_t v3 = a1;
  if (!a1) {
    uint64_t v3 = (const char *)asl_filesystem_path(0);
  }
  memset(&v9, 0, sizeof(v9));
  if (stat(v3, &v9) || (v9.st_mode & 0xF000) != 0x4000) {
    return 2LL;
  }
  char v4 = calloc(1uLL, 0xA58uLL);
  if (v4)
  {
    unsigned int v5 = v4;
    *char v4 = 0x100000004LL;
    if (v3) {
      int v6 = v3;
    }
    else {
      int v6 = (const char *)asl_filesystem_path(0);
    }
    unsigned int v8 = strdup(v6);
    v5[2] = v8;
    if (v8)
    {
      uint64_t result = 0LL;
      *a2 = v5;
      return result;
    }

    free(v5);
  }

  return 9LL;
}

uint64_t asl_store_max_file_size(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 2632) = a2;
  return result;
}

double asl_store_file_closeall(uint64_t a1)
{
  if (a1)
  {
    for (uint64_t i = 0LL; i != 2560; i += 40LL)
    {
      uint64_t v3 = (void *)(a1 + i);
      char v4 = *(__asl_object_s **)(a1 + i + 72);
      if (v4) {
        asl_file_close(v4);
      }
      v3[9] = 0LL;
      unsigned int v5 = (void *)v3[8];
      if (v5) {
        free(v5);
      }
      v3[8] = 0LL;
      uint64_t v6 = a1 + i;
      double result = NAN;
      *(void *)(v6 + 48) = -1LL;
      *(void *)(v6 + 56) = 0LL;
      v3[5] = 0LL;
    }
  }

  return result;
}

asl_object_t asl_store_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_store_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_store_close(__asl_object_s *a1)
{
  if (a1) {
    asl_release(a1);
  }
  return 0LL;
}

uint64_t asl_store_sweep_file_cache(uint64_t a1)
{
  if (!a1) {
    return 2LL;
  }
  time_t v2 = time(0LL);
  asl_store_file_cache_lru(a1, v2, 0x40u);
  return 0LL;
}

uint64_t asl_store_file_cache_lru(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = 0LL;
  LODWORD(v5) = 0;
  uint64_t v6 = a2 - 300;
  uint64_t v7 = a3;
  unsigned int v8 = (uint64_t *)(a1 + 40LL * a3 + 40);
  stat v9 = (__asl_object_s **)(a1 + 72);
  do
  {
    if (v7 == v4)
    {
      uint64_t v10 = *v8;
    }

    else
    {
      uint64_t v10 = (uint64_t)*(v9 - 4);
      if (v10 < v6)
      {
        asl_file_close(*v9);
        FILE *v9 = 0LL;
        int v11 = *(v9 - 1);
        if (v11) {
          free(v11);
        }
        uint64_t v10 = 0LL;
        *(v9 - 3) = (__asl_object_s *)-1LL;
        *(v9 - 2) = 0LL;
        *(v9 - 1) = 0LL;
        *(v9 - 4) = 0LL;
      }
    }

    else {
      uint64_t v5 = v4;
    }
    ++v4;
    v9 += 5;
  }

  while (v4 != 64);
  return v5;
}

char *asl_store_file_path(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  while (*(void *)(a1 + v2 + 72) != a2)
  {
    v2 += 40LL;
    if (v2 == 2560) {
      return 0LL;
    }
  }

  uint64_t v3 = *(const char **)(a1 + v2 + 64);
  if (v3) {
    return strdup(v3);
  }
  else {
    return 0LL;
  }
}

double asl_store_file_close(uint64_t a1, __asl_object_s *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      uint64_t v4 = (void *)(a1 + v3);
      if (*(__asl_object_s **)(a1 + v3 + 72) == a2) {
        break;
      }
      v3 += 40LL;
      if (v3 == 2560) {
        return result;
      }
    }

    asl_file_close(a2);
    v4[9] = 0LL;
    uint64_t v5 = (void *)v4[8];
    if (v5) {
      free(v5);
    }
    v4[8] = 0LL;
    uint64_t v6 = a1 + v3;
    double result = NAN;
    *(void *)(v6 + 48) = -1LL;
    *(void *)(v6 + 56) = 0LL;
    v4[5] = 0LL;
  }

  return result;
}

uint64_t asl_store_save(uint64_t a1, _DWORD *a2)
{
  uint64_t v46 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  uint64_t v4 = time(0LL);
  BOOL v5 = *(void *)(a1 + 2624) + 300LL <= v4;
  __s = 0LL;
  if (asl_msg_lookup(a2, "Time", (int **)&__s, 0LL) || !__s)
  {
    time_t v39 = v4;
    time_t v6 = v4;
  }

  else
  {
    time_t v6 = asl_core_parse_time(__s, 0LL);
    time_t v39 = v6;
  }

  time_t v8 = *(void *)(a1 + 2616);
  if (v6 >= v8 && v4 >= v8)
  {
    asl_store_file_closeall(a1);
    started = _asl_start_today();
    *(void *)(a1 + 2608) = started;
    if (!started)
    {
      started = *(tm **)(a1 + 2616);
      *(void *)(a1 + 2608) = started;
    }

    BOOL v5 = 0;
    *(void *)(a1 + 2616) = (char *)started + 86400;
  }

  if ((*(_BYTE *)(a1 + 2640) & 1) != 0)
  {
    int v11 = -1;
    int v10 = -1;
  }

  else
  {
    __s = 0LL;
    int v10 = -1;
    __s = 0LL;
    int v11 = -1;
  }

  time_t v38 = 0LL;
  if ((*(_BYTE *)(a1 + 2640) & 2) != 0)
  {
    int v13 = 0;
    time_t v12 = 0LL;
  }

  else
  {
    __s = 0LL;
    time_t v12 = 0LL;
    int v13 = 0;
    if (!asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0LL) && __s)
    {
      int v13 = 1;
      time_t v38 = 1LL;
      time_t v39 = asl_core_parse_time(__s, 0LL);
      time_t v12 = 1LL;
    }
  }

  if (fseeko(*(FILE **)(a1 + 24), 0LL, 0)) {
    return 8LL;
  }
  unint64_t __ptr = asl_core_htonq(*(void *)(a1 + 32));
  uint64_t v7 = 8LL;
  if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 24)) != 1) {
    return v7;
  }
  fflush(*(FILE **)(a1 + 24));
  unint64_t __ptr = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = __ptr + 1;
  *(void *)(a1 + 2624) = v4;
  if (!localtime_r(&v39, &v40)) {
    return 9999LL;
  }
  if (v13)
  {
    *(void *)&v40.tm_sec = 0LL;
    *(void *)&v40.tm_hour = 0LL;
    ++v40.tm_mon;
    time_t v38 = mktime(&v40);
    if (localtime_r(&v38, &v40))
    {
      snprintf(__str, 0x80uLL, "BB.%d.%02d.%02d", v40.tm_year + 1900, v40.tm_mon + 1, v40.tm_mday);
      time_t v12 = v38;
      goto LABEL_36;
    }

    return 9999LL;
  }

  snprintf(__str, 0x80uLL, "%d.%02d.%02d", v40.tm_year + 1900, v40.tm_mon + 1, v40.tm_mday);
LABEL_36:
  uint64_t v14 = 0LL;
  for (uint64_t i = 0LL; i != 64; ++i)
  {
    if (*(_DWORD *)(a1 + v14 + 48) == v10 && *(_DWORD *)(a1 + v14 + 52) == v11 && *(void *)(a1 + v14 + 56) == v12)
    {
      uint64_t v16 = *(__asl_object_s **)(a1 + v14 + 72);
      if (v16)
      {
        *(void *)(a1 + v14 + 40) = v4;
        if (v5) {
          asl_store_file_cache_lru(a1, v4, i);
        }
        goto LABEL_53;
      }
    }

    v14 += 40LL;
  }

  *(_DWORD *)size_t v43 = 0;
  unsigned int v41 = 0;
  unsigned __int16 v42 = 420;
  ug_path = asl_store_make_ug_path(*(void *)(a1 + 16), (uint64_t)__str, (uint64_t)"asl", v10, v11, v43, &v41, &v42);
  if (!ug_path) {
    return 9LL;
  }
  int v18 = ug_path;
  *(void *)__new = 0LL;
  uint64_t v19 = asl_file_open_write(ug_path, v42, *(unsigned int *)v43, v41, (uint64_t *)__new);
  if ((_DWORD)v19)
  {
    uint64_t v7 = v19;
    free(v18);
    return v7;
  }

  int v20 = asl_store_file_cache_lru(a1, v4, 0x40u);
  uint64_t v21 = a1 + 40LL * v20;
  __int16 v24 = *(__asl_object_s **)(v21 + 72);
  regex_t v23 = (void *)(v21 + 72);
  BOOL v22 = v24;
  if (v24) {
    asl_file_close(v22);
  }
  uint64_t v25 = a1 + 40LL * v20;
  unsigned int v28 = *(void **)(v25 + 64);
  int v27 = (char **)(v25 + 64);
  uint64_t v26 = v28;
  if (v28) {
    free(v26);
  }
  *regex_t v23 = *(void *)__new;
  *int v27 = v18;
  uint64_t v29 = a1 + 40LL * v20;
  *(_DWORD *)(v29 + 48) = v10;
  *(_DWORD *)(v29 + 52) = v11;
  *(void *)(v29 + 56) = v12;
  *(v23 - 4) = time(0LL);
  uint64_t v16 = *(__asl_object_s **)__new;
LABEL_53:
  uint64_t v7 = asl_file_save((uint64_t)v16, a2, (uint64_t *)&__ptr);
  if (!(_DWORD)v7)
  {
    unint64_t v30 = asl_file_size((uint64_t)v16);
    asl_file_ctime((uint64_t)v16);
    unint64_t v31 = *(void *)(a1 + 2632);
    if (v31)
    {
      if (v30 > v31)
      {
        int v32 = asl_store_file_path(a1, (uint64_t)v16);
        asl_store_file_close(a1, v16);
        if (v32)
        {
          int v33 = strlen(v32);
          if ((v33 & 0xFFFFFFFC) != 0 && (int v34 = v33, !strcmp(&v32[v33 - 4], ".asl")))
          {
            snprintf(v43, 0x400uLL, "%s", v32);
            v43[v34 - 4] = 0;
            snprintf(__new, 0x400uLL, "%s.%llu.asl");
          }

          else
          {
            snprintf(__new, 0x400uLL, "%s.%llu");
          }

          if (rename(v32, __new)) {
            uint64_t v7 = 9999LL;
          }
          else {
            uint64_t v7 = 0LL;
          }
          free(v32);
        }

        else
        {
          uint64_t v7 = 0LL;
        }

        asl_trigger_aslmanager();
      }
    }
  }

  return v7;
}

uint64_t asl_store_open_aux(uint64_t a1, _DWORD *a2, _DWORD *a3, char **a4)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 2LL;
  }
  uint64_t result = 1LL;
  if (a2 && a3 && a4)
  {
    time_t v20 = time(0LL);
    if ((*(_BYTE *)(a1 + 2640) & 1) != 0)
    {
      int v10 = -1;
      int v9 = -1;
    }

    else
    {
      __s = 0LL;
      int v9 = -1;
      __s = 0LL;
      int v10 = -1;
    }

    time_t v19 = 0LL;
    if ((*(_BYTE *)(a1 + 2640) & 2) != 0
      || (__s = 0LL, asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0LL))
      || !__s)
    {
      if (!localtime_r(&v20, &v21)) {
        return 9999LL;
      }
      snprintf(__str, 0x80uLL, "AUX.%d.%02d.%02d");
    }

    else
    {
      time_t v20 = asl_core_parse_time(__s, 0LL);
      if (!localtime_r(&v20, &v21)) {
        return 9999LL;
      }
      *(void *)&v21.tm_sec = 0LL;
      *(void *)&v21.tm_hour = 0LL;
      ++v21.tm_mon;
      time_t v19 = mktime(&v21);
      if (!localtime_r(&v19, &v21)) {
        return 9999LL;
      }
      snprintf(__str, 0x80uLL, "BB.AUX.%d.%02d.%02d");
    }

    snprintf(v24, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), __str);
    memset(&v22, 0, sizeof(v22));
    if (stat(v24, &v22))
    {
      if (*__error() == 2)
      {
        if (mkdir(v24, 0x1EDu)) {
          return 8LL;
        }
LABEL_27:
        uint64_t v11 = *(void *)(a1 + 32);
        *(void *)(a1 + 32) = v11 + 1;
        snprintf(v24, 0x80uLL, "%s/%llu", __str, v11);
        v22.st_dev = 0;
        unsigned int v17 = 0;
        unsigned __int16 v16 = 420;
        ug_path = asl_store_make_ug_path(*(void *)(a1 + 16), (uint64_t)v24, 0LL, v9, v10, &v22, &v17, &v16);
        if (!ug_path) {
          return 9LL;
        }
        int v13 = ug_path;
        int v14 = asl_file_create(ug_path, v22.st_dev, v17, v16);
        if ((v14 & 0x80000000) == 0)
        {
          int v15 = v14;
          *a4 = 0LL;
          asprintf(a4, "file://%s", v13);
          free(v13);
          uint64_t result = 0LL;
          *a3 = v15;
          return result;
        }

        free(v13);
        *a3 = -1;
        return 8LL;
      }

      return 9999LL;
    }

    if ((v22.st_mode & 0xF000) == 0x4000) {
      goto LABEL_27;
    }
    return 2LL;
  }

  return result;
}

char *asl_store_make_ug_path( uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, _DWORD *a6, _DWORD *a7, _WORD *a8)
{
  int v9 = 0LL;
  *a6 = 0;
  *a7 = 0;
  *a8 = 420;
  if (a4 == -1)
  {
    if (a5 == -1)
    {
      if (a3) {
        asprintf(&v9, "%s/%s.%s");
      }
      else {
        asprintf(&v9, "%s/%s");
      }
    }

    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.G%d.%s");
      }
      else {
        asprintf(&v9, "%s/%s.G%d");
      }
    }
  }

  else
  {
    *a6 = a4;
    if (a5 == -1)
    {
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.U%d.%s");
      }
      else {
        asprintf(&v9, "%s/%s.U%d");
      }
    }

    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.U%d.G%u.%s");
      }
      else {
        asprintf(&v9, "%s/%s.U%d.G%d");
      }
    }
  }

  return v9;
}

uint64_t asl_store_match( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 0LL;
  }
  int v14 = opendir(*(const char **)(a1 + 16));
  if (!v14) {
    return 0LL;
  }
  int v15 = v14;
  unsigned __int16 v16 = readdir(v14);
  for (i = 0LL; v16; unsigned __int16 v16 = readdir(v15))
  {
    int v19 = v16->d_name[0];
    d_name = v16->d_name;
    if (v19 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v22))
      {
        if (v22) {
          uint64_t i = asl_file_list_add((uint64_t)i, v22);
        }
      }
    }
  }

  closedir(v15);
  uint64_t v20 = asl_file_list_match(i, a2, a3, a4, a5, a6, a7);
  asl_file_list_close((asl_object_t *)i);
  return v20;
}

uint64_t asl_store_match_timeout( uint64_t a1, uint64_t a2, unsigned int **a3, void *a4, unint64_t a5, int a6, int a7, unsigned int a8)
{
  asl_object_t obj = 0LL;
  if (!a3) {
    return 9999LL;
  }
  *a3 = 0LL;
  uint64_t v15 = asl_store_open_read(0LL, &obj);
  if (!(_DWORD)v15)
  {
    if (a2)
    {
      if (*(_DWORD *)a2)
      {
        unsigned __int16 v16 = asl_new(2u);
        unsigned int v17 = *(_DWORD *)a2;
        *(_DWORD *)(a2 + 4) = 0;
        if (v17)
        {
          unsigned int v18 = 0;
          do
          {
            asl_append(v16, *(asl_object_t *)(*(void *)(a2 + 8) + 8LL * v18));
            unsigned int v19 = *(_DWORD *)a2;
            unsigned int v18 = *(_DWORD *)(a2 + 4) + 1;
            *(_DWORD *)(a2 + 4) = v18;
          }

          while (v18 < v19);
        }
      }

      else
      {
        unsigned __int16 v16 = 0LL;
        *(_DWORD *)(a2 + 4) = 0;
      }
    }

    else
    {
      unsigned __int16 v16 = 0LL;
    }

    uint64_t v20 = (__asl_object_s *)asl_store_match((uint64_t)obj, (uint64_t)v16, a4, a5, a6, a8, a7);
    asl_release(obj);
    asl_release(v16);
    if (v20)
    {
      unsigned int v21 = asl_count(v20);
      if (v21)
      {
        uint64_t v22 = (unsigned int *)calloc(1uLL, 0x10uLL);
        if (v22)
        {
          regex_t v23 = v22;
          *uint64_t v22 = v21;
          *((void *)v22 + 1) = calloc(v21, 8uLL);
          v23[1] = 0;
          if (*v23)
          {
            do
            {
              uint64_t v24 = asl_next(v20);
              asl_object_t v25 = asl_retain(v24);
              unsigned int v27 = *v23;
              uint64_t v26 = v23[1];
              *(void *)(*((void *)v23 + 1) + 8 * v26) = v25;
              v23[1] = v26 + 1;
            }

            while ((int)v26 + 1 < v27);
          }

          uint64_t v15 = 0LL;
          v23[1] = 0;
          *a3 = v23;
        }

        else
        {
          uint64_t v15 = 9LL;
        }
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      asl_release(v20);
    }

    else
    {
      return 0LL;
    }
  }

  return v15;
}

uint64_t asl_store_match_start(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 2LL;
  }
  time_t v6 = *(void **)(a1 + 2600);
  if (v6) {
    asl_file_list_match_end(v6);
  }
  *(void *)(a1 + 2600) = 0LL;
  uint64_t v7 = opendir(*(const char **)(a1 + 16));
  if (!v7) {
    return 7LL;
  }
  time_t v8 = v7;
  int v9 = readdir(v7);
  for (i = 0LL; v9; int v9 = readdir(v8))
  {
    int v12 = v9->d_name[0];
    d_name = v9->d_name;
    if (v12 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v15))
      {
        if (v15) {
          uint64_t i = asl_file_list_add((uint64_t)i, v15);
        }
      }
    }
  }

  closedir(v8);
  int matched = asl_file_list_match_start(i, a2, a3);
  *(void *)(a1 + 2600) = matched;
  if (matched) {
    return 0LL;
  }
  else {
    return 9999LL;
  }
}

uint64_t asl_store_match_next(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t result = *(void *)(a1 + 2600);
  if (result) {
    return asl_file_list_match_next(result, a2, a3, a4);
  }
  return result;
}

void *asl_store_jump_table()
{
  return &asl_store_jump_table_jump;
}

void _jump_dealloc_3(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[2];
    if (v2) {
      free(v2);
    }
    a1[2] = 0LL;
    asl_store_file_closeall((uint64_t)a1);
    uint64_t v3 = (FILE *)a1[3];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }

uint64_t _jump_next_1(uint64_t a1)
{
  uint64_t v7 = 0LL;
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2 == -1) {
    return 0LL;
  }
  *(void *)(a1 + 8) = v2 + 1;
  uint64_t v3 = asl_store_match(a1, 0LL, &v7, v2 + 1, 1, 0, 1);
  if (v3)
  {
    uint64_t v4 = (__asl_object_s *)v3;
    *(void *)(a1 + 8) = v7;
    uint64_t index = asl_msg_list_get_index(v3, 0LL);
    asl_msg_list_release(v4);
  }

  else
  {
    uint64_t index = 0LL;
    *(void *)(a1 + 8) = -1LL;
  }

  return index;
}

uint64_t _jump_prev_1(uint64_t a1)
{
  uint64_t v7 = 0LL;
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  *(void *)(a1 + 8) = v2 - 1;
  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v3 = asl_store_match(a1, 0LL, &v7, v2 - 1, 1, 0, -1);
  if (v3)
  {
    uint64_t v4 = (__asl_object_s *)v3;
    *(void *)(a1 + 8) = v7;
    uint64_t index = asl_msg_list_get_index(v3, 0LL);
    asl_msg_list_release(v4);
  }

  else
  {
    uint64_t index = 0LL;
    *(void *)(a1 + 8) = 0LL;
  }

  return index;
}

uint64_t _jump_set_iteration_index_1(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t _jump_append_3(uint64_t a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if (a1 && (*(_BYTE *)(a1 + 2640) & 1) == 0)
  {
    if ((_DWORD)result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0LL);
      do
      {
        uint64_t result = asl_msg_list_next((uint64_t)obj);
        if (!result) {
          break;
        }
        uint64_t result = asl_store_save(a1, (_DWORD *)result);
      }

      while (!(_DWORD)result);
    }

    else if (result <= 1)
    {
      return asl_store_save(a1, obj);
    }
  }

  return result;
}

uint64_t _jump_search_3(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  if (!obj)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = 0LL;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0LL, 0, 0, 1);
  }

  if (type == 2)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = obj;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0LL, 0, 0, 1);
  }

  if (type > 1) {
    return 0LL;
  }
  asl_msg_list_new();
  int v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  uint64_t v7 = asl_store_match(a1, (uint64_t)v10, &v11, 0LL, 0, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_3( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t result = asl_store_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

tm *_asl_start_today()
{
  time_t v2 = time(0LL);
  uint64_t result = localtime_r(&v2, &v1);
  if (result)
  {
    *(void *)&v1.tm_sec = 0LL;
    v1.tm_hour = 0;
    return (tm *)mktime(&v1);
  }

  return result;
}

uint64_t asl_is_utf8(unsigned __int8 *a1)
{
  if (!a1) {
    return 1LL;
  }
  int v2 = *a1;
  uint64_t result = 1LL;
  if (v2)
  {
    int v4 = 0;
    int v5 = 0;
    asl_object_t v6 = a1 + 1;
    while (1)
    {
      switch(v5)
      {
        case 0:
          if ((v2 & 0x80) == 0)
          {
            int v5 = 0;
            int v4 = 0;
LABEL_51:
            BOOL v7 = 1;
            goto LABEL_52;
          }

          if ((v2 + 62) < 0x1Eu)
          {
            int v5 = 1;
            int v4 = 1;
            goto LABEL_51;
          }

          if (v2 == 224)
          {
            int v5 = 1;
            int v4 = 2;
            goto LABEL_51;
          }

          if ((v2 + 31) < 0xFu)
          {
            int v5 = 1;
            int v4 = 3;
            goto LABEL_51;
          }

          if (v2 == 240)
          {
            int v5 = 1;
            int v4 = 4;
            goto LABEL_51;
          }

          if ((v2 + 15) < 3u)
          {
            int v5 = 1;
            int v4 = 5;
            goto LABEL_51;
          }

          BOOL v7 = v2 == 244;
          else {
            int v4 = 0;
          }
          int v5 = 1;
LABEL_52:
          int v14 = *v6++;
          LOBYTE(v2) = v14;
          if (!v14 || !v7) {
            return v7;
          }
          break;
        case 1:
          switch(v4)
          {
            case 1:
              int v5 = (char)v2 > -65;
              BOOL v7 = (char)v2 < -64;
              int v4 = 1;
              goto LABEL_52;
            case 2:
              BOOL v7 = (v2 & 0xE0) == 160;
              if ((v2 & 0xE0) == 0xA0) {
                int v5 = 2;
              }
              else {
                int v5 = 1;
              }
              int v4 = 2;
              goto LABEL_52;
            case 3:
              BOOL v7 = (char)v2 < -64;
              else {
                int v5 = 2;
              }
              int v4 = 3;
              goto LABEL_52;
            case 4:
              unsigned int v13 = (v2 + 112);
              BOOL v7 = v13 < 0x30;
              if (v13 >= 0x30) {
                int v5 = 1;
              }
              else {
                int v5 = 2;
              }
              int v4 = 4;
              goto LABEL_52;
            case 5:
              BOOL v7 = (char)v2 < -64;
              else {
                int v5 = 2;
              }
              int v4 = 5;
              goto LABEL_52;
            case 6:
              BOOL v7 = (char)v2 < -112;
              else {
                int v5 = 2;
              }
              int v4 = 6;
              goto LABEL_52;
            default:
              return 0;
          }

        case 2:
          unsigned int v8 = v4 & 0xFFFFFFFE;
          BOOL v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7) {
            int v9 = 3;
          }
          else {
            int v9 = 2;
          }
          BOOL v10 = (char)v2 < -64;
          int v11 = 2 * ((char)v2 > -65);
          BOOL v12 = v8 == 2;
          if (v8 == 2) {
            int v5 = v11;
          }
          else {
            int v5 = v9;
          }
          if (v12) {
            BOOL v7 = v10;
          }
          goto LABEL_52;
        case 3:
          BOOL v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7) {
            int v5 = 0;
          }
          else {
            int v5 = 3;
          }
          goto LABEL_52;
        default:
          return 0;
      }
    }
  }

  return result;
}

_BYTE *asl_b64_encode(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t result = malloc((4 * ((a2 + 2) / 3)) | 1);
    if (result)
    {
      result[(2 * (((a2 + 2) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL] = 0;
      if (a2 < 3)
      {
        unint64_t v12 = 0LL;
        uint64_t v5 = 0LL;
        unint64_t v6 = 1LL;
      }

      else
      {
        uint64_t v5 = 0LL;
        unint64_t v6 = 1LL;
        do
        {
          unint64_t v7 = *(unsigned __int8 *)(a1 + v6 - 1);
          unsigned int v8 = &result[v5 + 1];
          *(v8 - 1) = aAbcdefghijklmn[v7 >> 2];
          unint64_t v9 = *(unsigned __int8 *)(a1 + v6);
          *unsigned int v8 = aAbcdefghijklmn[(v9 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v7 & 3))];
          unint64_t v10 = *(unsigned __int8 *)(a1 + v6 + 1);
          LOBYTE(v7) = aAbcdefghijklmn[(v10 >> 6) & 0xFFFFFFFFFFFFFFC3LL | (4 * (v9 & 0xF))];
          LOBYTE(v10) = aAbcdefghijklmn[v10 & 0x3F];
          v8[1] = v7;
          v5 += 4LL;
          v8[2] = v10;
          unint64_t v11 = v6 + 4;
          v6 += 3LL;
        }

        while (v11 < a2);
        unint64_t v12 = v6 - 1;
      }

      if (v12 < a2)
      {
        unint64_t v14 = *(unsigned __int8 *)(a1 + v12);
        uint64_t v15 = v5 | 1;
        result[v5] = aAbcdefghijklmn[v14 >> 2];
        uint64_t v16 = 16 * (v14 & 3);
        if (v6 >= a2)
        {
          uint64_t v20 = v5 | 2;
          result[v15] = aAbcdefghijklmn[v16];
          uint64_t v19 = v5 | 3;
          result[v20] = 61;
        }

        else
        {
          unint64_t v17 = *(unsigned __int8 *)(a1 + v6);
          uint64_t v18 = v5 | 2;
          result[v15] = aAbcdefghijklmn[v16 | (v17 >> 4)];
          uint64_t v19 = v5 | 3;
          result[v18] = aAbcdefghijklmn[4 * (v17 & 0xF)];
        }

        result[v19] = 61;
      }
    }

    else
    {
      unsigned int v13 = __error();
      uint64_t result = 0LL;
      *unsigned int v13 = 12;
    }
  }

  return result;
}

uint64_t asl_syslog_faciliy_name_to_num(const char *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!strcasecmp(a1, "auth")) {
    return 32LL;
  }
  if (!strcasecmp(a1, "authpriv")) {
    return 80LL;
  }
  if (!strcasecmp(a1, "cron")) {
    return 72LL;
  }
  if (!strcasecmp(a1, "daemon")) {
    return 24LL;
  }
  if (!strcasecmp(a1, "ftp")) {
    return 88LL;
  }
  if (!strcasecmp(a1, "install")) {
    return 112LL;
  }
  uint64_t result = strcasecmp(a1, "kern");
  if (!(_DWORD)result) {
    return result;
  }
  if (!strcasecmp(a1, "lpr")) {
    return 48LL;
  }
  if (!strcasecmp(a1, "mail")) {
    return 16LL;
  }
  if (!strcasecmp(a1, "netinfo")) {
    return 96LL;
  }
  if (!strcasecmp(a1, "remoteauth")) {
    return 104LL;
  }
  if (!strcasecmp(a1, "news")) {
    return 56LL;
  }
  if (!strcasecmp(a1, "security")) {
    return 32LL;
  }
  if (!strcasecmp(a1, "syslog")) {
    return 40LL;
  }
  if (!strcasecmp(a1, "user")) {
    return 8LL;
  }
  if (!strcasecmp(a1, "uucp")) {
    return 64LL;
  }
  if (!strcasecmp(a1, "local0")) {
    return 128LL;
  }
  if (!strcasecmp(a1, "local1")) {
    return 136LL;
  }
  if (!strcasecmp(a1, "local2")) {
    return 144LL;
  }
  if (!strcasecmp(a1, "local3")) {
    return 152LL;
  }
  if (!strcasecmp(a1, "local4")) {
    return 160LL;
  }
  if (!strcasecmp(a1, "local5")) {
    return 168LL;
  }
  if (!strcasecmp(a1, "local6")) {
    return 176LL;
  }
  if (!strcasecmp(a1, "local7")) {
    return 184LL;
  }
  if (!strcasecmp(a1, "launchd")) {
    return 192LL;
  }
  return 0xFFFFFFFFLL;
}

char *asl_syslog_faciliy_num_to_name(int a1)
{
  if (a1 < 0) {
    return 0LL;
  }
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1;
  unsigned int v1 = v2 >> 3;
  if (v1 > 0x18) {
    return 0LL;
  }
  else {
    return off_189625E00[v1];
  }
}

uint64_t asl_trigger_aslmanager()
{
  mach_service = xpc_connection_create_mach_service("com.apple.aslmanager", 0LL, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
  xpc_connection_resume(mach_service);
  if (!mach_service) {
    return 0xFFFFFFFFLL;
  }
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = v1;
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  if (v3) {
    xpc_release(v3);
  }
  xpc_release(v2);
  xpc_release(mach_service);
  return 0LL;
}

uint64_t asl_object_set_key_val_op(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_2);
  }
  unsigned int v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 16);
  if (v8) {
    return v8(a1, a2, a3, a4);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *_asl_object_init()
{
  asl_jump[0] = (uint64_t)asl_msg_jump_table();
  qword_18C43C998 = (uint64_t)asl_msg_jump_table();
  qword_18C43C9A0 = (uint64_t)asl_msg_list_jump_table();
  qword_18C43C9A8 = (uint64_t)asl_file_jump_table();
  qword_18C43C9B0 = (uint64_t)asl_store_jump_table();
  uint64_t result = asl_client_jump_table();
  qword_18C43C9B8 = (uint64_t)result;
  return result;
}

void asl_object_unset_key(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_2);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 24);
    if (v4) {
      v4(a1, a2);
    }
  }

uint64_t asl_object_get_val_op_for_key(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_4);
  }
  unsigned int v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 32);
  if (v8) {
    return v8(a1, a2, a3, a4);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t asl_object_get_key_val_op_at_index(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_6);
  }
  unint64_t v10 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 40);
  if (v10) {
    return v10(a1, a2, a3, a4, a5);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t asl_object_count(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0LL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_8);
  }
  unint64_t v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 48);
  if (v2) {
    return v2(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t asl_object_next(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0LL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_10);
  }
  unint64_t v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 56);
  if (v2) {
    return v2(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t asl_object_prev(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0LL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_12);
  }
  unint64_t v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 64);
  if (v2) {
    return v2(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t asl_object_get_object_at_index(_DWORD *a1, uint64_t a2)
{
  if (!a1 || *a1 > 6u) {
    return 0LL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_14);
  }
  int v4 = *(uint64_t (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 72);
  if (v4) {
    return v4(a1, a2);
  }
  else {
    return 0LL;
  }
}

void asl_object_set_iteration_index(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_16);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 80);
    if (v4) {
      v4(a1, a2);
    }
  }

void asl_object_remove_object_at_index(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_18);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 88);
    if (v4) {
      v4(a1, a2);
    }
  }

void asl_object_append(int *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    int v6 = *a1;
  }

  else
  {
    int v6 = 5;
  }

  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_20);
  }
  unint64_t v7 = *(void (**)(int *, uint64_t, uint64_t))(asl_jump[v6] + 96);
  if (v7) {
    v7(a1, a2, a3);
  }
}

void asl_object_prepend(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_22);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 104);
    if (v4) {
      v4(a1, a2);
    }
  }

uint64_t asl_object_search(_DWORD *a1, __asl_object_s *a2)
{
  if (!a1) {
    return asl_client_search(0LL, a2);
  }
  if (*a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_24);
    }
    int v4 = *(uint64_t (**)(_DWORD *, __asl_object_s *))(asl_jump[*a1] + 112);
    if (v4) {
      return v4(a1, a2);
    }
  }

  return 0LL;
}

uint64_t asl_object_match( _DWORD *a1, char *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a1) {
    return asl_client_match(0LL, a2, a3, a4, a5, a6, a7);
  }
  if (*a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_26);
    }
    unint64_t v14 = *(uint64_t (**)(_DWORD *, char *, char **, unint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 120);
    if (v14) {
      return v14(a1, a2, a3, a4, a5, a6, a7);
    }
  }

  return 0LL;
}

asl_object_t asl_retain(asl_object_t obj)
{
  if (obj)
  {
    xpc_object_t v1 = (unsigned int *)((char *)obj + 4);
    do
      unsigned int v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }

  return obj;
}

void asl_release(asl_object_t obj)
{
  if (obj && *(_DWORD *)obj <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_28);
    }
    unsigned int v2 = (unsigned int *)((char *)obj + 4);
    do
    {
      unsigned int v3 = __ldaxr(v2);
      unsigned int v4 = v3 - 1;
    }

    while (__stlxr(v4, v2));
    if (!v4)
    {
      uint64_t v5 = *(void (**)(asl_object_t))(asl_jump[*(unsigned int *)obj] + 8);
      if (v5) {
        v5(obj);
      }
    }
  }

asl_object_t asl_new(uint32_t type)
{
  if (type > 6) {
    return 0LL;
  }
  uint64_t v1 = *(void *)&type;
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_30);
  }
  unsigned int v2 = (uint64_t (**)(uint64_t))asl_jump[v1];
  if (*v2) {
    return (asl_object_t)(*v2)(v1);
  }
  else {
    return 0LL;
  }
}

uint32_t asl_get_type(asl_object_t obj)
{
  if (obj) {
    return *(_DWORD *)obj;
  }
  else {
    return -1;
  }
}

uint64_t asl_get_value_for_key(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  asl_object_get_val_op_for_key(a1, a2, (uint64_t)&v4, (uint64_t)v3);
  return v4;
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  if (!obj) {
    return -1;
  }
  if (*(_DWORD *)obj == 1) {
    uint64_t v3 = 0xFFFFLL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  return asl_object_set_key_val_op(obj, (uint64_t)key, (uint64_t)value, v3);
}

uint64_t asl_unset_key(_DWORD *a1, uint64_t a2)
{
  return 0LL;
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return 0;
}

const char *__cdecl asl_key(asl_object_t msg, uint32_t n)
{
  uint64_t v3 = 0LL;
  else {
    return v3;
  }
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  uint64_t v3 = 0LL;
  else {
    return v3;
  }
}

int asl_fetch_key_val_op(asl_object_t msg, uint32_t n, const char **key, const char **val, uint32_t *op)
{
  int result = asl_object_get_key_val_op_at_index(msg, n, (uint64_t)key, (uint64_t)val, (uint64_t)&v7);
  if (op)
  {
    if (!result) {
      *op = v7;
    }
  }

  return result;
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return asl_object_set_key_val_op(msg, (uint64_t)key, (uint64_t)value, (unsigned __int16)op);
}

int asl_unset(asl_object_t obj, const char *key)
{
  return 0;
}

char *__cdecl asl_format(char *msg, const char *msg_fmt, const char *time_fmt, uint32_t text_encoding)
{
  if (msg)
  {
    if (*(_DWORD *)msg) {
      return 0LL;
    }
    else {
      return asl_format_message(msg, (char *)msg_fmt, (char *)time_fmt, text_encoding, &v4);
    }
  }

  return msg;
}

void syslog(int a1, const char *a2, ...)
{
}

void _vsyslog(__int16 a1, const char *a2, va_list a3)
{
  int v5 = a1 & 7;
  int v6 = a1 & 0x3F8;
  pthread_mutex_lock(&_sl_lock);
  unsigned __int16 v7 = (__asl_object_s *)_sl_asl;
  if (!_sl_asl)
  {
    _sl_asl = (uint64_t)asl_open(0LL, 0LL, 0x10000u);
    _sl_mask = 255;
    asl_set_filter((asl_object_t)_sl_asl, 255);
    unsigned __int16 v7 = (__asl_object_s *)_sl_asl;
  }

  unsigned int v8 = asl_retain(v7);
  pthread_mutex_unlock(&_sl_lock);
  unint64_t v9 = asl_new(0);
  if (v6)
  {
    unint64_t v10 = asl_syslog_faciliy_num_to_name(v6);
    if (v10) {
      asl_set(v9, "Facility", v10);
    }
  }

  uint64_t v11 = _asl_evaluate_send(v8, v9, v5);
  if ((v11 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v11 & 0x80000) != 0) {
      _asl_lib_vlog_text(v8, v11, v9, a2, a3);
    }
  }

  else if ((v11 & 0x1A0000) != 0)
  {
    _asl_lib_vlog(v8, v11, v9, a2, a3);
  }

  asl_release(v8);
  asl_release(v9);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void openlog(const char *a1, int a2, int a3)
{
  if (_sl_asl) {
    asl_release((asl_object_t)_sl_asl);
  }
  _sl_asl = 0LL;
  free((void *)_sl_ident);
  _sl_ident = 0LL;
  if (a1) {
    _sl_ident = (uint64_t)strdup(a1);
  }
  _sl_fac = a3;
  int v6 = asl_syslog_faciliy_num_to_name(a3);
  _sl_opts = a2;
  if ((a2 & 0x1000) != 0) {
    int v7 = 65540;
  }
  else {
    int v7 = 0x10000;
  }
  _sl_mask = 255;
  _sl_asl = (uint64_t)asl_open((const char *)_sl_ident, v6, v7 & 0xFFFFFFFE | (a2 >> 5) & 1);
  asl_set_filter((asl_object_t)_sl_asl, _sl_mask);
  pthread_mutex_unlock(&_sl_lock);
}

void closelog(void)
{
  if (_sl_asl) {
    asl_close((asl_object_t)_sl_asl);
  }
  _sl_asl = 0LL;
  free((void *)_sl_ident);
  _sl_ident = 0LL;
  _sl_fac = 0;
  pthread_mutex_unlock(&_sl_lock);
}

int setlogmask(int a1)
{
  if (!a1) {
    return _sl_mask;
  }
  pthread_mutex_lock(&_sl_lock);
  _sl_mask = a1;
  int v2 = asl_set_filter((asl_object_t)_sl_asl, a1);
  if ((_sl_opts & 0x20) != 0) {
    asl_set_output_file_filter((asl_object_t)_sl_asl, 2, a1);
  }
  pthread_mutex_unlock(&_sl_lock);
  return v2;
}

uint64_t _asl_server_create_aux_link( mach_port_t a1, uint64_t a2, int a3, _DWORD *a4, void *a5, _DWORD *a6, _DWORD *a7)
{
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 16777473;
  *(_DWORD *)unsigned int v21 = a3;
  *(void *)&v21[4] = *MEMORY[0x1895FF688];
  int v22 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = reply_port;
  v17.msgh_bits = -2147478253;
  *(void *)&v17.msgh_voucher_port = 0x7500000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t reply_port = v17.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v17, 3, 0x38u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v17.msgh_id == 217)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 2 && v17.msgh_size == 72 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112 && v21[11] == 1)
          {
            int v15 = v22;
            if (v22 == v23)
            {
              uint64_t v14 = 0LL;
              *a4 = v19;
              *a5 = *(void *)v21;
              *a6 = v15;
              *a7 = v24;
              return v14;
            }
          }
        }

        else if (v17.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&v17);
      return v14;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v14;
}

uint64_t _asl_server_message(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 16777473;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895FF688];
  int v9 = a3;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18013AB60;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t _asl_server_register_direct_watch(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895FF688];
  int v5 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 119;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_cancel_direct_watch(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895FF688];
  int v5 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 120;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_query_2( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, void *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  uint64_t v23 = *MEMORY[0x1895FF688];
  int v24 = a3;
  uint64_t v25 = a4;
  int v26 = a5;
  int v27 = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x7900000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996LL;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0LL;
              *a7 = v20;
              *a8 = v16;
              *a9 = v25;
              *a10 = v26;
              return v15;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996LL;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }

        else
        {
          uint64_t v15 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v15;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v15;
}

uint64_t _asl_server_match( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, void *a8, _DWORD *a9, void *a10, _DWORD *a11)
{
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  uint64_t v23 = *MEMORY[0x1895FF688];
  int v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  int v27 = a6;
  int v28 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  v18.msgh_remote_port = a1;
  v18.msgh_local_port = reply_port;
  v18.msgh_bits = -2147478253;
  *(void *)&v18.msgh_voucher_port = 0x7A00000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&v18);
    mach_port_t reply_port = v18.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&v18, 3, 0x50u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v18.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v14)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (v18.msgh_id == 222)
      {
        if ((v18.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996LL;
          if (v19 == 1 && v18.msgh_size == 68 && !v18.msgh_remote_port && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0LL;
              *a8 = v20;
              *a9 = v16;
              *a10 = v25;
              *a11 = v26;
              return v15;
            }
          }
        }

        else if (v18.msgh_size == 36)
        {
          uint64_t v15 = 4294966996LL;
          if (HIDWORD(v20))
          {
            if (v18.msgh_remote_port) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }

        else
        {
          uint64_t v15 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

      mach_msg_destroy(&v18);
      return v15;
    }

    mig_dealloc_reply_port(v18.msgh_local_port);
  }

  return v15;
}

void asl_log_descriptor_cold_1()
{
  __assert_rtn("asl_log_descriptor", "asl_fd.c", 292, "fd_type == ASL_LOG_DESCRIPTOR_WRITE");
}

void asl_descriptor_init_cold_1()
{
  __assert_rtn( "asl_descriptor_init",  "asl_fd.c",  195,  "(redirect_descriptors = calloc(16, sizeof(*redirect_descriptors))) != NULL");
}

void asl_descriptor_init_cold_2()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 199, "redirect_serial_q != NULL");
}

void asl_descriptor_init_cold_3()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 202, "read_source_group != NULL");
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1895FED98]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895FEDD0](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895FEDD8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1895FEF58](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895FEF60](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1895FEF68](a1);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1896009D0]();
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

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1895FEFD0](a1, a2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1895FE908](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FE920](data);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FE950]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FE968](group, timeout);
}

dispatch_io_t dispatch_io_create( dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1895FE978](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_read( dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FEA78](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FEA80](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FEA88](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FEAC8](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1895FEAD8](source);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FEB30](when, delta);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1895FF9A0](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FF000](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FF9D8](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FF008](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FF028](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FF038](a1);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1895FFA00]();
}

int fls(int a1)
{
  return MEMORY[0x189600530](*(void *)&a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FF068](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF070](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FF078](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FF080](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF088](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FF090](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FF098](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FF0B0](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF0D8](__ptr, __size, __nitems, __stream);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FFA98]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

gid_t getgid(void)
{
  return MEMORY[0x1895FFAB8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FF108](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FF110](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FF150](a1, a2);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x1895FF660](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1895FF668](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FF670](*(void *)&uid, uu);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FF160](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FF178](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FF180](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FFDF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FFE20](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1895FF1A8](a1);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x189600360](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x189600368](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x189600380](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x189600388](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x189600398]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return MEMORY[0x189600880](activity, parent_id);
}

uint64_t os_log_shim_enabled()
{
  return MEMORY[0x1896008A8]();
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1896008B8]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FFEA0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1896006F0](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1896006F8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x189600708](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FFF48](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FF210](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600330](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FF230](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1895FF238](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FFF68](__old, __new);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1895FF270](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FF2C8](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF2E0](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1895FF310](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FF338](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FF410](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1895FF418](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1896000E8](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FF460](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FF478](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x189600110](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x189600168](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x189600208](*(void *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x189600A80](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x189600AB0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x189600B28](interval);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x189600C18](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x189600C30]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x189600C78](string);
}