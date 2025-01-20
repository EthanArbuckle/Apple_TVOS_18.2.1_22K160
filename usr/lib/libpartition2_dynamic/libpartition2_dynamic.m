uint64_t __os_log_helper_1_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_52:
  v15[0] = 0LL;
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v108, v15[0]);
  objc_storeStrong(&v109, v15[0]);
  objc_storeStrong(&v111, v15[0]);
  objc_storeStrong(location, v15[0]);
  return v118;
}

uint64_t __os_log_helper_1_2_3_8_32_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_18620F720(uint64_t a1)
{
  *(void *)(v1 - 336) = a1;
  _Unwind_Resume(*(_Unwind_Exception **)(v1 - 336));
}

_BYTE *__os_log_helper_1_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

uint64_t __os_log_helper_1_3_1_8_65(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 65;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_8:
    v12 = 0;
    v10 = 1;
    goto LABEL_9;
  }

  v12 = 1;
  v10 = 1;
LABEL_9:
  objc_storeStrong(location, 0LL);
  return v12;
}

uint64_t _is_running_in_ramdisk()
{
  predicate = (dispatch_once_t *)&_is_running_in_ramdisk_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_170);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return _is_running_in_ramdisk_is_ramdisk & 1;
}

LABEL_16:
  v5 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(v21, 0LL);
  return v5;
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v33 = a1;
  v15 = &v32;
  unsigned int v32 = 0;
  removefile_state_t v31 = removefile_state_alloc();
  removefile_state_set(v31, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v31, 2u, &v32);
  removefile_state_set(v31, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v31, 4u, &v32);
  uint64_t v30 = _os_log_pack_size();
  uint64_t v14 = v30;
  v29 = v5;
  unint64_t v13 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858]();
  uint64_t v28 = v14;
  v27 = &v5[-v13];
  uint64_t v26 = _os_log_pack_fill();
  __os_log_helper_1_3_1_8_33(v26, (uint64_t)v33);
  _LPLogPack(1);
  if (removefile(v33, v31, 3u))
  {
    if (!v32) {
      unsigned int v32 = *__error();
    }
  }

  else
  {
    unsigned int v32 = _lp2_reset_directory_metadata(v33);
    if (v32)
    {
      uint64_t v25 = 0LL;
      uint64_t v25 = _os_log_pack_size();
      uint64_t v10 = v25;
      v24 = v5;
      unint64_t v9 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      MEMORY[0x1895F8858]();
      uint64_t v23 = v10;
      v22 = &v5[-v9];
      uint64_t v21 = _os_log_pack_fill();
      uint64_t v12 = v21;
      v11 = v33;
      uint64_t v1 = strerror(v32);
      __os_log_helper_1_3_2_8_33_8_32(v12, (uint64_t)v11, (uint64_t)v1);
      _LPLogPack(1);
    }
  }

  uint64_t v20 = 0LL;
  uint64_t v20 = _os_log_pack_size();
  uint64_t v7 = v20;
  v19 = v5;
  unint64_t v6 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858]();
  uint64_t v18 = v7;
  v17 = &v5[-v6];
  uint64_t v2 = _os_log_pack_fill();
  uint64_t v16 = v2;
  int v8 = 1;
  if (v32) {
    v3 = "failed";
  }
  else {
    v3 = "succeeded";
  }
  __os_log_helper_1_3_3_8_33_8_32_4_0(v2, (uint64_t)v33, (uint64_t)v3, v32);
  _LPLogPack(v8);
  removefile_state_free(v31);
  return v32;
}

uint64_t __os_log_helper_1_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_33_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t _execForLibpartition(char *const *a1)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  v59 = (const char **)a1;
  unsigned int v58 = -1;
  pid_t v57 = 0;
  *(void *)v61 = -1LL;
  if (pipe(v61))
  {
    uint64_t v31 = _os_log_pack_size();
    uint64_t v9 = v31;
    uint64_t v30 = v7;
    unint64_t v8 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    MEMORY[0x1895F8858]();
    uint64_t v29 = v9;
    uint64_t v28 = &v7[-v8];
    uint64_t v27 = _os_log_pack_fill();
    uint64_t v11 = v27;
    uint64_t v10 = *v59;
    v4 = __error();
    v5 = strerror(*v4);
    __os_log_helper_1_2_2_8_32_8_32(v11, (uint64_t)v10, (uint64_t)v5);
    _LPLogPack(1);
  }

  else
  {
    uint64_t v25 = &v56;
    uint64_t v26 = 0LL;
    posix_spawn_file_actions_t v56 = 0LL;
    v24 = &v55;
    posix_spawnattr_t v55 = 0LL;
    posix_spawn_file_actions_init(&v56);
    posix_spawn_file_actions_adddup2(&v56, v61[1], 1);
    posix_spawn_file_actions_addclose(&v56, v61[0]);
    posix_spawnattr_init(&v55);
    posix_spawnattr_setflags(&v55, 0x4000);
    unsigned int v58 = posix_spawn(&v57, *v59, &v56, 0LL, (char *const *)v59, 0LL);
    if (v58)
    {
      uint64_t v36 = _os_log_pack_size();
      uint64_t v13 = v36;
      v35 = v7;
      unint64_t v12 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      MEMORY[0x1895F8858]();
      uint64_t v34 = v13;
      v33 = &v7[-v12];
      uint64_t v32 = _os_log_pack_fill();
      uint64_t v15 = v32;
      uint64_t v14 = *v59;
      v3 = strerror(v58);
      __os_log_helper_1_2_2_8_32_8_32(v15, (uint64_t)v14, (uint64_t)v3);
      _LPLogPack(1);
      close(v61[0]);
    }

    else
    {
      bzero(v60, 0x400uLL);
      ssize_t v54 = 0LL;
      int v53 = v61[0];
      close(v61[1]);
      v61[1] = -1;
      while (1)
      {
        ssize_t v54 = read(v53, v60, 0x400uLL);
        if (v54 <= 0) {
          break;
        }
        execlogfunction(@"%.*s", v54, v60);
      }

      int v52 = 0;
      if (waitpid(v57, &v52, 0) == -1)
      {
        unsigned int v58 = *__error();
        uint64_t v41 = _os_log_pack_size();
        uint64_t v17 = v41;
        v40 = v7;
        unint64_t v16 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        MEMORY[0x1895F8858]();
        uint64_t v39 = v17;
        v38 = &v7[-v16];
        uint64_t v37 = _os_log_pack_fill();
        uint64_t v19 = v37;
        uint64_t v18 = *v59;
        uint64_t v1 = __error();
        uint64_t v2 = strerror(*v1);
        __os_log_helper_1_2_2_8_32_8_32(v19, (uint64_t)v18, (uint64_t)v2);
        _LPLogPack(1);
      }

      else if ((v52 & 0x7F) != 0)
      {
        if ((v52 & 0x7F) == 0x7F || (v52 & 0x7F) == 0)
        {
          uint64_t v46 = _os_log_pack_size();
          uint64_t v21 = v46;
          v45 = v7;
          unint64_t v20 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          MEMORY[0x1895F8858]();
          uint64_t v44 = v21;
          v43 = &v7[-v20];
          uint64_t v42 = _os_log_pack_fill();
          __os_log_helper_1_2_2_8_32_4_0(v42, (uint64_t)*v59, v52 >> 8);
          _LPLogPack(1);
          unsigned int v58 = -1;
        }

        else
        {
          uint64_t v51 = _os_log_pack_size();
          uint64_t v23 = v51;
          v50 = v7;
          unint64_t v22 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          MEMORY[0x1895F8858]();
          uint64_t v49 = v23;
          v48 = &v7[-v22];
          uint64_t v47 = _os_log_pack_fill();
          __os_log_helper_1_2_2_8_32_4_0(v47, (uint64_t)*v59, v52 & 0x7F);
          _LPLogPack(1);
          unsigned int v58 = -1;
        }
      }

      else
      {
        unsigned int v58 = BYTE1(v52);
      }
    }

    posix_spawnattr_destroy(&v55);
    posix_spawn_file_actions_destroy(&v56);
    if (v61[1] != -1) {
      close(v61[1]);
    }
  }

  return v58;
}

uint64_t __os_log_helper_1_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_64_8_65_8_65(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 65;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_64_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_64_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_32_8_65_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_2_4_0_8_32(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 32;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

char *___is_running_in_ramdisk_block_invoke(size_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2[2] = a1;
  v2[1] = a1;
  bzero(__big, 0x400uLL);
  v2[0] = 1024LL;
  result = (char *)sysctlbyname("kern.bootargs", __big, v2, 0LL, 0LL);
  if (!(_DWORD)result)
  {
    result = strstr(__big, "-restore");
    if (result) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }

  return result;
}

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0LL;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  unint64_t v16 = a3;
  int v15 = 0;
  int v15 = *__error();
  *unint64_t v16 = v15;
  uint64_t v14 = _os_log_pack_size();
  uint64_t v7 = v14;
  uint64_t v13 = &v5;
  unint64_t v6 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858]();
  uint64_t v12 = v7;
  uint64_t v11 = (char *)&v5 - v6;
  uint64_t v10 = _os_log_pack_fill();
  uint64_t v9 = v10;
  uint64_t v8 = v18;
  v3 = strerror(v15);
  __os_log_helper_1_3_2_8_33_8_32(v9, v8, (uint64_t)v3);
  _LPLogPack(1);
  return 2LL;
}

uint64_t __os_log_helper_1_3_1_8_33(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t _lp2_reset_directory_metadata(const char *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  unsigned int v4 = 0;
  int from_fd = -1;
  strcpy(path, ".XXXXXXXX");
  int dfd = open(a1, 1048832);
  if (dfd == -1)
  {
    unsigned int v4 = *__error();
  }

  else
  {
    int from_fd = mkstempsat_np(dfd, path, 8);
    if (from_fd == -1 || unlinkat(dfd, path, 0) || fcopyfile(from_fd, dfd, 0LL, 5u)) {
      unsigned int v4 = *__error();
    }
  }

  if (from_fd != -1) {
    close(from_fd);
  }
  if (dfd != -1) {
    close(dfd);
  }
  return v4;
}

uint64_t __os_log_helper_1_3_2_8_33_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_33_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void execlogfunction(id obj, ...)
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  location[0] = 0LL;
  objc_storeStrong(location, obj);
  va_copy((va_list)&v11[1], va);
  id v1 = objc_alloc(NSString);
  v11[0] = (id)[v1 initWithFormat:location[0] arguments:va];
  uint64_t v10 = _os_log_pack_size();
  uint64_t v5 = v10;
  uint64_t v9 = &v2;
  unint64_t v4 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858]();
  uint64_t v8 = v5;
  uint64_t v7 = (char *)&v2 - v4;
  uint64_t v6 = _os_log_pack_fill();
  __os_log_helper_1_2_1_8_64(v6, (uint64_t)v11[0]);
  _LPLogPack(3);
  id v3 = 0LL;
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(location, v3);
}

uint64_t __os_log_helper_1_2_2_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id _LPLogObject()
{
  predicate = (dispatch_once_t *)&_LPLogObject_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)_LPLogObject_obj;
}

void _LPLogPack(int a1)
{
  if (sLogLevel >= a1)
  {
    id v2 = _LPLogObject();
    id v3 = (char *)os_log_pack_compose();

    if ((sLogToStandardOut & 1) != 0) {
      fprintf((FILE *)*MEMORY[0x1895F89E0], "%s\n", v3);
    }
    if ((sLogToOSLog & 1) != 0)
    {
      id v1 = _LPLogObject();
      os_log_pack_send();
    }

    if ((sLogToConsole & 1) != 0) {
      dprintf(sConsoleFD, "%s\n", v3);
    }
    free(v3);
  }

uint64_t LPLogSetOutput(uint64_t result)
{
  sLogToStandardOut = (result & 1) != 0;
  sLogToOSLog = (result & 2) != 0;
  sLogToConsole = (result & 4) != 0;
  if ((result & 4) != 0)
  {
    if (sConsoleFD == -1)
    {
      result = open("/dev/console", 10);
      sConsoleFD = result;
      if ((_DWORD)result == -1) {
        sLogToConsole = 0;
      }
    }
  }

  else
  {
    if (sConsoleFD != -1) {
      result = close(sConsoleFD);
    }
    sConsoleFD = -1;
  }

  return result;
}

uint64_t LPLogSetVerbosity(uint64_t result)
{
  sLogLevel = result;
  return result;
}

uint64_t __os_log_helper_1_2_4_8_32_8_64_4_0_8_32(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 32;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_4_8_32_8_32_8_33_8_65( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 33;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 65;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_4_0_8_32(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 32;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

LABEL_10:
  id v3 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v13, 0LL);
  return v3;
}

void __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 32);
  id v3 = (id *)(a1 + 32);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t iterateSafely(io_iterator_t a1, int a2, id obj, void *a4)
{
  id v9 = a4;
  uint64_t v8 = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
  uint64_t v23 = *MEMORY[0x1895F89C0];
  io_iterator_t v21 = a1;
  int v20 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v18 = 0LL;
  objc_storeStrong(&v18, v9);
  for (int i = 0; i < v20; ++i)
  {
    for (io_object_t j = 0; ; IOObjectRelease(j))
    {
      io_object_t j = IOIteratorNext(v21);
      if (!j) {
        break;
      }
      (*((void (**)(id, void))location + 2))(location, j);
    }

    if (IOIteratorIsValid(v21))
    {
      char v22 = 1;
      int v15 = 1;
      goto LABEL_10;
    }

    MEMORY[0x186E34A98](v21);
    (*((void (**)(void))v18 + 2))();
  }

  uint64_t v14 = _os_log_pack_size();
  uint64_t v7 = v14;
  uint64_t v13 = &v5;
  unint64_t v6 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858]();
  uint64_t v12 = v7;
  uint64_t v11 = (char *)&v5 - v6;
  uint64_t v10 = _os_log_pack_fill();
  __os_log_helper_1_2_2_8_32_4_0(v10, (uint64_t)v8, v20);
  _LPLogPack(1);
  char v22 = 0;
  int v15 = 1;
LABEL_10:
  id v5 = 0LL;
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&location, v5);
  return v22 & 1;
}

uint64_t APFSVolumeCreate()
{
  return MEMORY[0x18960CC60]();
}

uint64_t APFSVolumeCreateForMSU()
{
  return MEMORY[0x18960CC68]();
}

uint64_t APFSVolumeDelete()
{
  return MEMORY[0x18960CC70]();
}

uint64_t APFSVolumeGetVEKState()
{
  return MEMORY[0x18960CC80]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x18960CCB0]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
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

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x189608388](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator( io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x189608480](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1896084B0](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return MEMORY[0x189608538](*(void *)&iterator);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1895F8DD0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1895F8DD8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1895FAF98](*(void *)&a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1895FB218](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1895FB3E0](*(void *)&a1, a2, *(void *)&a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1895FB3E8](*(void *)&a1, a2, *(void *)&a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return MEMORY[0x1895FB3F0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1895FB3F8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1895FB400](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t fs_snapshot_root()
{
  return MEMORY[0x1895FB408]();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1895FB5D0](a1, *(void *)&a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

int mkstempsat_np(int dfd, char *path, int slen)
{
  return MEMORY[0x1895FBF50](*(void *)&dfd, path, *(void *)&slen);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x1895FC448]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x1895FC450]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC7E0](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1895FC7E8](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1895FC7F0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC808](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC810](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC818](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC828](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1895FC840](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
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

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FCE50](a1, a2, a3, a4, *(void *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD470](*(void *)&a1, a2, *(void *)&a3);
}

int unmount(const char *a1, int a2)
{
  return MEMORY[0x1895FD478](a1, *(void *)&a2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}