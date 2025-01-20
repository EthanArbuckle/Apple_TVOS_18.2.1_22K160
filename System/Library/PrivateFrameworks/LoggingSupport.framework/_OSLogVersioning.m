@interface _OSLogVersioning
- (BOOL)checkTimesyncDB:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasEndTimeRef;
- (BOOL)performDestructiveUpdates:(id *)a3;
- (BOOL)repairTimesyncDB:(id *)a3;
- (_OSLogVersioning)initWithCollection:(id)a3 closeOnRelease:(BOOL)a4 error:(id *)a5;
- (_OSLogVersioning)initWithCollection:(id)a3 error:(id *)a4;
- (_OSLogVersioning)initWithURL:(id)a3 error:(id *)a4;
- (int64_t)state;
- (int64_t)version;
- (void)dealloc;
@end

@implementation _OSLogVersioning

- (_OSLogVersioning)initWithCollection:(id)a3 closeOnRelease:(BOOL)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS____OSLogVersioning;
  v10 = -[_OSLogVersioning init](&v40, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_40:
    v26 = v11;
    goto LABEL_41;
  }

  objc_storeStrong((id *)&v10->_lcr, a3);
  v11->_closeOnRelease = a4;
  id v12 = v9;
  [v12 diagnosticsDirectoryReference];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 fileDescriptor];

  size_t v41 = 0LL;
  if (fcntl(v14, 50, __s1) == -1) {
    goto LABEL_17;
  }
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  size_t v15 = strlen((const char *)_os_trace_persist_path);
  if (!strncmp(__s1, (const char *)_os_trace_persist_path, v15))
  {
    uint64_t v24 = 0LL;
LABEL_28:
    v11->_uint64_t version = v24;
    goto LABEL_29;
  }

  v16 = (void *)_os_trace_mmap_at();
  if (!v16)
  {
    if (*__error() == 2)
    {
      if (fstatat(v14, "FaultsAndErrors", &v53, 0) || (v53.st_mode & 0xF000) != 0x4000)
      {
        uint64_t v48 = 0LL;
        v49 = &v48;
        uint64_t v50 = 0x2020000000LL;
        char v51 = 0;
        unint64_t v47 = 0LL;
        uint64_t v27 = _os_trace_mmap_at();
        uint64_t v28 = v27;
        if (v27)
        {
          unint64_t v29 = v47;
          v42[0] = MEMORY[0x1895F87A8];
          v42[1] = 3221225472LL;
          v43 = ___OSIsAncientArchive_block_invoke;
          v44 = &unk_189F0F320;
          v45 = &v48;
          uint64_t v46 = v27;
          v30 = v42;
          unint64_t v31 = 0LL;
          do
          {
            if (v29 - v31 < 0x10) {
              break;
            }
            unint64_t v32 = *(void *)(v28 + v31 + 8);
            if (v29 - 16 - v31 < v32) {
              break;
            }
            unint64_t v31 = (v31 + v32 + 23) & 0xFFFFFFFFFFFFFFF8LL;
          }

          while (v31 - 1 < v29);
        }

        int v33 = *((unsigned __int8 *)v49 + 24);
        _Block_object_dispose(&v48, 8);
        uint64_t v24 = -1LL;
        if (v33) {
          uint64_t v24 = 1LL;
        }
      }

      else
      {
        uint64_t v24 = 1LL;
      }

      goto LABEL_28;
    }

- (_OSLogVersioning)initWithCollection:(id)a3 error:(id *)a4
{
  return -[_OSLogVersioning initWithCollection:closeOnRelease:error:]( self,  "initWithCollection:closeOnRelease:error:",  a3,  0LL,  a4);
}

- (_OSLogVersioning)initWithURL:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self =  -[_OSLogVersioning initWithCollection:closeOnRelease:error:]( self,  "initWithCollection:closeOnRelease:error:",  v6,  1LL,  a4);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_closeOnRelease) {
    -[_OSLogCollectionReference close](self->_lcr, "close");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogVersioning;
  -[_OSLogVersioning dealloc](&v3, sel_dealloc);
}

- (BOOL)performDestructiveUpdates:(id *)a3
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  if (!_os_trace_device_unlocked_since_boot())
  {
    uint64_t v52 = 1LL;
    stat v53 = a3;
LABEL_92:
    _OSLogFailWithPOSIXError((id)v52, v53);
    return 0;
  }

  int64_t version = self->_version;
  if (version == -1) {
    goto LABEL_104;
  }
  if (version <= 4) {
    int64_t v6 = 4LL;
  }
  else {
    int64_t v6 = self->_version;
  }
  int64_t v60 = v6 + 1;
  v61 = a3;
  int64_t v62 = v6;
  v63 = self;
  do
  {
    if (version == 2)
    {
      v64 = self->_lcr;
      v7 = -[_OSLogCollectionReference diagnosticsDirectoryReference](v64, "diagnosticsDirectoryReference");
      int v8 = [v7 fileDescriptor];

      if (fcntl(v8, 50, v68) == -1)
      {
        __error();
        _os_assumes_log();
      }

      v67[0] = v68;
      v67[1] = 0LL;
      id v9 = fts_open(v67, 2132, 0LL);
      if (!v9) {
        goto LABEL_94;
      }
      int v10 = openat(v8, "timesync", 0);
      if (v10 == -1)
      {
        if (*__error() != 2)
        {
          int v10 = -1;
LABEL_96:
          uint64_t v54 = v9;
LABEL_97:
          v55 = __error();
          _OSLogFailWithPOSIXError((id)*v55, v61);
          if (v10 != -1 && close(v10) == -1)
          {
            int v58 = *__error();
            uint64_t v59 = *__error();
            if (v58 == 9)
            {
              qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_18C695DD0 = v59;
              __break(1u);
            }

            _os_assumes_log();
            __error();
            _os_assert_log();
            BOOL result = _os_crash();
            __break(1u);
            return result;
          }

          if (v9) {
            fts_close(v54);
          }

          return 0;
        }
      }

      else
      {
        int v11 = _os_trace_fdscandir_b();
        if (v11 >= 1)
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = 8LL * v11;
          while (1)
          {
            int v14 = (const char *)(*(void *)(v65 + v12) + 21LL);
            if (strcmp(v14, "."))
            {
              if (strcmp(v14, "..") && unlinkat(v10, v14, 0) == -1) {
                break;
              }
            }

            v12 += 8LL;
            if (v13 == v12) {
              goto LABEL_18;
            }
          }

          __error();
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_94:
          uint64_t v54 = 0LL;
          int v10 = -1;
          goto LABEL_97;
        }

- (BOOL)checkTimesyncDB:(BOOL *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int64_t v6 = self->_lcr;
  v7 = -[_OSLogCollectionReference timesyncReference](v6, "timesyncReference");
  int v8 = [v7 fileDescriptor];

  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 1;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = ___OSValidateTimesync_block_invoke;
  v12[3] = &unk_189F0F348;
  int v13 = v8;
  v12[4] = &v14;
  v12[5] = &v11;
  _timesync_foreach_reg_file_at(v8, (uint64_t)v12);
  int v9 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  if (v9 < 0) {
    _OSLogFailWithPOSIXError((id)v11, a4);
  }
  else {
    *a3 = v9 != 0;
  }
  return v9 >= 0;
}

- (BOOL)repairTimesyncDB:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v4 = self->_lcr;
  v5 = -[_OSLogCollectionReference timesyncReference](v4, "timesyncReference");
  int v6 = [v5 fileDescriptor];

  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = ___OSRepairTimesync_block_invoke;
  v10[3] = &unk_189F0F348;
  int v11 = v6;
  v10[4] = &v12;
  v10[5] = &v9;
  _timesync_foreach_reg_file_at(v6, (uint64_t)v10);
  int v7 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  if (v7) {
    _OSLogFailWithPOSIXError((id)v9, a3);
  }
  return v7 == 0;
}

- (BOOL)hasEndTimeRef
{
  return self->_hasEndTimeRef;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end