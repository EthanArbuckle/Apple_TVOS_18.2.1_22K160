@interface RBAssertionOriginatorPidStore
- (BOOL)_lock_allocSharedMemoryWithName:(size_t)a3 size:(void *)a4 address:(int *)a5 fileDescriptor:(_BYTE *)a6 created:;
- (BOOL)containsPid:(int)a3;
- (BOOL)isValid;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBAssertionOriginatorPidStore)initWithPath:(id)a3;
- (uint64_t)_lock_indexOfPidInSharedMemory:(uint64_t)result;
- (uint64_t)_lock_isHeaderValid;
- (uint64_t)_lock_isPidDataValid;
- (uint64_t)_lock_resizeSharedMemoryIfNecessary;
- (void)_allocSharedMemory;
- (void)_lock_addPidToSharedMemory:(void *)a1;
- (void)_lock_deallocSharedMemory;
- (void)_lock_isHeaderValid;
- (void)_lock_removePidFromSharedMemory:(uint64_t)a1;
- (void)_lock_resizeSharedMemoryIfNecessary;
- (void)addPid:(int)a3;
- (void)dealloc;
- (void)removePid:(int)a3;
- (void)setValidProcesses:(id)a3;
@end

@implementation RBAssertionOriginatorPidStore

- (RBAssertionOriginatorPidStore)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBAssertionOriginatorPidStore;
  v5 = -[RBAssertionOriginatorPidStore init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    path = v6->_path;
    v6->_path = (NSString *)v7;

    -[RBAssertionOriginatorPidStore _allocSharedMemory]((uint64_t)v6);
  }

  return v6;
}

- (void)_allocSharedMemory
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    char v9 = 0;
    id v3 = [*(id *)(a1 + 16) stringByAppendingPathComponent:@"header"];
    id v4 = (uint64_t *)(a1 + 8);
    if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:]( a1,  (char *)[v3 UTF8String],  0xCuLL,  (void **)(a1 + 8),  (int *)(a1 + 32),  &v9))
    {
      if (v9)
      {
        uint64_t v5 = *v4;
        if (*v4)
        {
          *(void *)uint64_t v5 = 4096LL;
          *(_DWORD *)(v5 + 8) = 0;
        }
      }

      if (-[RBAssertionOriginatorPidStore _lock_isHeaderValid](a1))
      {
        if (*(_DWORD *)(*(void *)(a1 + 8) + 8LL)) {
          v6 = @"pids2";
        }
        else {
          v6 = @"pids1";
        }
        id v7 = [*(id *)(a1 + 16) stringByAppendingPathComponent:v6];
        if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:]( a1,  (char *)[v7 UTF8String],  4 * **(unsigned int **)(a1 + 8),  (void **)(a1 + 24),  (int *)(a1 + 36),  &v9))
        {
          char isPidData = -[RBAssertionOriginatorPidStore _lock_isPidDataValid](a1);

          if ((isPidData & 1) != 0) {
            goto LABEL_15;
          }
        }

        else
        {
        }
      }
    }

    -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory](a1);
LABEL_15:
    os_unfair_lock_unlock(v2);
  }

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  header = self->_header;
  id v5 = objc_alloc(NSString);
  uint64_t v6 = [(id)objc_opt_class() description];
  id v7 = (void *)v6;
  path = self->_path;
  uint64_t pidsID = self->_pidsID;
  if (header) {
    uint64_t v10 = [v5 initWithFormat:@"<%@| path:%@ headerID:%d pidsID:%d header:{size:%u count:%u bufferIndex:%u}", v6, path, self->_headerID, pidsID, self->_header->var0, self->_header->var1, self->_header->var2];
  }
  else {
    uint64_t v10 = [v5 initWithFormat:@"<%@| path:%@ headerID:%d pidsID:%d>", v6, path, self->_headerID, pidsID, v13, v14, v15];
  }
  v11 = (void *)v10;

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v11;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RBAssertionOriginatorPidStore;
  -[RBAssertionOriginatorPidStore dealloc](&v4, sel_dealloc);
}

- (void)_lock_deallocSharedMemory
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      id v3 = *(unsigned int **)(a1 + 8);
      if (v3)
      {
        munmap(v2, 4LL * *v3);
        close(*(_DWORD *)(a1 + 36));
        if (*(_DWORD *)(*(void *)(a1 + 8) + 8LL)) {
          objc_super v4 = @"pids2";
        }
        else {
          objc_super v4 = @"pids1";
        }
        id v5 = [*(id *)(a1 + 16) stringByAppendingPathComponent:v4];
        shm_unlink((const char *)[v5 UTF8String]);
        *(void *)(a1 + 24) = 0LL;
      }
    }

    uint64_t v6 = *(void **)(a1 + 8);
    if (v6)
    {
      munmap(v6, 0xCuLL);
      close(*(_DWORD *)(a1 + 32));
      id v7 = [*(id *)(a1 + 16) stringByAppendingPathComponent:@"header"];
      shm_unlink((const char *)[v7 UTF8String]);
      *(void *)(a1 + 8) = 0LL;
    }
  }

- (void)addPid:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_addPidToSharedMemory:](self, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_addPidToSharedMemory:(void *)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1 && a1[3] && a1[1])
  {
    if (-[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:]((uint64_t)a1, a2) == -1)
    {
      if (!-[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary](a1))
      {
        rbs_assertion_log();
        objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          -[RBAssertionOriginatorPidStore _lock_addPidToSharedMemory:].cold.1(v4);
        }
        goto LABEL_13;
      }

      v8 = (_DWORD *)a1[3];
      uint64_t v9 = a1[1];
      v8[*(unsigned int *)(v9 + 4)] = a2;
      size_t v10 = (*(_DWORD *)(v9 + 4) + 1);
      *(_DWORD *)(v9 + 4) = v10;
      qsort(v8, v10, 4uLL, (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
      rbs_assertion_log();
      objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v11 = *(_DWORD *)a1[1];
        int v12 = *(_DWORD *)(a1[1] + 4LL);
        int v13 = 67109632;
        int v14 = a2;
        __int16 v15 = 1024;
        int v16 = v12;
        __int16 v17 = 1024;
        int v18 = v11;
        id v5 = "Added pid %d to RBSAssertionManagerStore; count %d; size %d";
        uint64_t v6 = v4;
        uint32_t v7 = 20;
        goto LABEL_10;
      }
    }

    else
    {
      rbs_assertion_log();
      objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v13 = 67109120;
        int v14 = a2;
        id v5 = "Ignoring existing pid %d in RBSAssertionManagerStore";
        uint64_t v6 = v4;
        uint32_t v7 = 8;
LABEL_10:
        _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v13, v7);
      }
    }

- (void)removePid:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_removePidFromSharedMemory:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1 && *(void *)(a1 + 24) && *(void *)(a1 + 8))
  {
    unsigned int v4 = -[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:](a1, a2);
    if (v4 == -1)
    {
      rbs_assertion_log();
      size_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:].cold.1(a2, v10);
      }
    }

    else
    {
      uint64_t v5 = *(void *)(a1 + 8);
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      LODWORD(v7) = v6 - 1;
      if (v6 <= 1)
      {
        uint64_t v8 = *(void *)(a1 + 24);
      }

      else
      {
        uint64_t v8 = *(void *)(a1 + 24);
        if (v4 < v7)
        {
          unint64_t v9 = v4;
          do
          {
            *(_DWORD *)(v8 + 4 * v9) = *(_DWORD *)(v8 + 4 * v9 + 4);
            unint64_t v7 = (*(_DWORD *)(v5 + 4) - 1);
            ++v9;
          }

          while (v9 < v7);
        }
      }

      *(_DWORD *)(v5 + 4) = v7;
      *(_DWORD *)(v8 + 4LL * v7) = 0;
      rbs_assertion_log();
      size_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = **(_DWORD **)(a1 + 8);
        int v12 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
        v13[0] = 67109632;
        v13[1] = a2;
        __int16 v14 = 1024;
        int v15 = v12;
        __int16 v16 = 1024;
        int v17 = v11;
        _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_INFO,  "Removed pid %d from RBSAssertionManagerStore; count %d; size %d",
          (uint8_t *)v13,
          0x14u);
      }
    }
  }

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_pids != 0LL;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)containsPid:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    BOOL v6 = -[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:]((uint64_t)self, a3) != -1;
  }
  else {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setValidProcesses:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_pids)
  {
    uint64_t v5 = malloc(4 * [v4 count]);
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    int v10 = 0;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __51__RBAssertionOriginatorPidStore_setValidProcesses___block_invoke;
    v8[3] = &unk_18A256B88;
    v8[4] = v9;
    v8[5] = v5;
    [v4 enumerateObjectsUsingBlock:v8];
    qsort( v5,  [v4 count],  4uLL,  (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
    if (self->_header->var1)
    {
      unsigned int v6 = 0;
      do
      {
        int __key = self->_pids[v6];
        if (!bsearch( &__key,  v5,  [v4 count],  4uLL,  (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids))
        {
          -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:]((uint64_t)self, __key);
          --v6;
        }

        ++v6;
      }

      while (v6 < self->_header->var1);
    }

    free(v5);
    _Block_object_dispose(v9, 8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

void __51__RBAssertionOriginatorPidStore_setValidProcesses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(void *)(a1 + 40) + 4 * *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = [v3 pid];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)_lock_allocSharedMemoryWithName:(size_t)a3 size:(void *)a4 address:(int *)a5 fileDescriptor:(_BYTE *)a6 created:
{
  if (!result) {
    return result;
  }
  *a4 = (void *)-1LL;
  int v10 = shm_open(a2, 514, 384LL);
  *a5 = v10;
  if (v10 < 0)
  {
    rbs_assertion_log();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.2();
    }
    goto LABEL_12;
  }

  int v11 = fstat(v10, &v15);
  int v12 = *a5;
  if (v11 == -1 || v15.st_size)
  {
    *a4 = mmap(0LL, a3, 3, 1, v12, 0LL);
    *a6 = 0;
    goto LABEL_13;
  }

  if (ftruncate(v12, a3) < 0)
  {
    rbs_assertion_log();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.1();
    }
LABEL_12:

    goto LABEL_13;
  }

  *a4 = mmap(0LL, a3, 3, 1, *a5, 0LL);
  *a6 = 1;
LABEL_13:
  __int16 v14 = *a4;
  if (*a4 == (void *)-1LL)
  {
    __int16 v14 = 0LL;
    *a4 = 0LL;
  }

  return v14 != 0LL;
}

- (uint64_t)_lock_isHeaderValid
{
  if (result)
  {
    v2 = (int **)(result + 8);
    v1 = *(_DWORD **)(result + 8);
    if (!v1) {
      return 0LL;
    }
    if (*(_DWORD *)(*(void *)(result + 8) + 4LL) > *v1)
    {
      rbs_assertion_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionOriginatorPidStore _lock_isHeaderValid].cold.1(v2, v3);
      }

      return 0LL;
    }

    return 1LL;
  }

  return result;
}

- (uint64_t)_lock_isPidDataValid
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 24);
    if (v2 && (uint64_t v3 = *(void *)(result + 8)) != 0)
    {
      unsigned int v4 = *(_DWORD *)(v3 + 4);
      if (v4 >= 2)
      {
        uint64_t v5 = 0LL;
        uint64_t v6 = 4LL * (v4 - 1);
        while (v6 != v5)
        {
          int v8 = *(_DWORD *)(v2 + v5);
          int v7 = *(_DWORD *)(v2 + v5 + 4);
          v5 += 4LL;
          if (v8 >= v7)
          {
            rbs_assertion_log();
            unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              int v10 = (_DWORD *)(*(void *)(v1 + 24) + v5);
              int v11 = *(v10 - 1);
              LODWORD(v10) = *v10;
              v12[0] = 67109376;
              v12[1] = v11;
              __int16 v13 = 1024;
              int v14 = (int)v10;
              _os_log_error_impl( &dword_188634000,  v9,  OS_LOG_TYPE_ERROR,  "Shared memory for RBSAssertionManagerStore contains misordered or duplicate pids: %d; %d",
                (uint8_t *)v12,
                0xEu);
            }

            return 0LL;
          }
        }
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

- (uint64_t)_lock_resizeSharedMemoryIfNecessary
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    if (!a1[3]) {
      return 0LL;
    }
    uint64_t v2 = (int *)a1[1];
    if (!v2) {
      return 0LL;
    }
    int v3 = *v2;
    int v4 = 2 * v3;
    size_t v5 = 4LL * (2 * v3);
    uint64_t v6 = (void *)a1[2];
    if (v2[2]) {
      int v7 = @"pids1";
    }
    else {
      int v7 = @"pids2";
    }
    [v6 stringByAppendingPathComponent:v7];
    __dst = 0LL;
    v8 = int v17 = 0;
    shm_unlink((const char *)[v8 UTF8String]);
    id v9 = v8;
    if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:]( v1,  (char *)[v9 UTF8String],  v5,  &__dst,  &v17,  &v16))
    {
      int v10 = __dst;
      if (__dst)
      {
        memcpy(__dst, *(const void **)(v1 + 24), 4LL * **(unsigned int **)(v1 + 8));
        munmap(*(void **)(v1 + 24), 4LL * **(unsigned int **)(v1 + 8));
        close(*(_DWORD *)(v1 + 36));
        if (*(_DWORD *)(*(void *)(v1 + 8) + 8LL)) {
          int v11 = "pids2";
        }
        else {
          int v11 = "pids1";
        }
        shm_unlink(v11);
        *(void *)(v1 + 24) = v10;
        *(_DWORD *)(v1 + 36) = v17;
        int v12 = *(int **)(v1 + 8);
        _DWORD v12[2] = 1 - v12[2];
        *int v12 = v4;
        rbs_assertion_log();
        __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary].cold.2(v4, v13);
        }

        uint64_t v1 = 1LL;
        goto LABEL_23;
      }

      rbs_assertion_log();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary].cold.1();
      }
    }

    else
    {
      rbs_assertion_log();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.1();
      }
    }

    -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory](v1);
    uint64_t v1 = 0LL;
LABEL_23:
  }

  return v1;
}

- (uint64_t)_lock_indexOfPidInSharedMemory:(uint64_t)result
{
  int __key = a2;
  if (result)
  {
    uint64_t v2 = result;
    int v3 = *(const void **)(result + 24);
    if (v3 && (uint64_t v4 = *(void *)(result + 8)) != 0)
    {
      size_t v5 = bsearch( &__key,  v3,  *(unsigned int *)(v4 + 4),  4uLL,  (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
      if (v5) {
        return ((unint64_t)v5 - *(void *)(v2 + 24)) >> 2;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void).cxx_destruct
{
}

- (void)_lock_addPidToSharedMemory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Abandoning attempt to add pid to shared memory as resize failed",  v1,  2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_lock_removePidFromSharedMemory:(int)a1 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Cannot remove unknown pid %d from RBSAssertionManagerStore",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:.cold.1()
{
}

- (void)_lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:.cold.2()
{
}

- (void)_lock_isHeaderValid
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v2 = **a1;
  int v3 = (*a1)[1];
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Shared memory for RBSAssertionManagerStore contains a bad header.  count: %d; size: %d",
    (uint8_t *)v4,
    0xEu);
}

- (void)_lock_resizeSharedMemoryIfNecessary
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( &dword_188634000,  a2,  OS_LOG_TYPE_DEBUG,  "Resized RBSAssertionManagerStore shared memory to %d",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_0();
}

@end