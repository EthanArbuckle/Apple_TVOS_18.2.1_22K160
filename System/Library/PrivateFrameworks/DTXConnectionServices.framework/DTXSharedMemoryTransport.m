@interface DTXSharedMemoryTransport
+ (id)addressForMemory:(unint64_t)a3 inProcess:(int)a4;
+ (id)addressForPosixSharedMemoryWithName:(id)a3;
+ (id)schemes;
- (BOOL)_setupCreatingSharedMemory:(id)a3 size:(int)a4;
- (BOOL)_setupWithShm:(DTXSharedMemory *)a3 asCreator:(BOOL)a4;
- (DTXSharedMemory)sharedMemory;
- (DTXSharedMemoryTransport)initWithLocalName:(id)a3 size:(int)a4;
- (DTXSharedMemoryTransport)initWithMappedMemory:(DTXSharedMemory *)a3;
- (DTXSharedMemoryTransport)initWithMemoryAddress:(unint64_t)a3 inTask:(unsigned int)a4;
- (DTXSharedMemoryTransport)initWithRemoteAddress:(id)a3;
- (id)localAddresses;
- (id)permittedBlockCompressionTypes;
- (int)remotePid;
- (unint64_t)totalSharedMemorySize;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (void)dealloc;
- (void)disconnect;
- (void)setRemotePid:(int)a3;
@end

@implementation DTXSharedMemoryTransport

+ (id)schemes
{
  return (id)objc_msgSend_setWithObjects_( MEMORY[0x189604010],  a2,  (uint64_t)@"shm",  @"mmap",  @"shmem",  0);
}

+ (id)addressForPosixSharedMemoryWithName:(id)a3
{
  v3 = (void *)MEMORY[0x189604030];
  objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"%@://%@", @"shm", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)addressForMemory:(unint64_t)a3 inProcess:(int)a4
{
  v4 = (void *)MEMORY[0x189604030];
  objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"%@://%d/%#llx", @"mmap", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v4, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)totalSharedMemorySize
{
  return self->_shm->var0;
}

- (BOOL)_setupWithShm:(DTXSharedMemory *)a3 asCreator:(BOOL)a4
{
  if (a3)
  {
    self->_shm = a3;
    self->_creator = a4;
    v6 = (OS_dispatch_queue *)dispatch_queue_create("shared memory transport listener queue", 0LL);
    listenQueue = self->_listenQueue;
    self->_listenQueue = v6;

    v8 = self->_listenQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_188BCFAC4;
    block[3] = &unk_18A2ED618;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v8, block);
  }

  return a3 != 0LL;
}

- (BOOL)_setupCreatingSharedMemory:(id)a3 size:(int)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  uint64_t v10 = (2 * a4);
  if (v9)
  {
    v11 = v9;
    size_t v12 = strlen(v9);
    size_t v13 = v12 + 1;
    size_t v14 = (v10 + 16463 + v12 + 1) & 0xFFFFFFFFFFFFC000LL;
    if (v12 != -1LL)
    {
      int v15 = shm_open(v11, 16777730, 511LL);
      if (v15 == -1)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          int v21 = *__error();
          *(_DWORD *)buf = 136315906;
          v23 = v11;
          __int16 v24 = 2048;
          size_t v25 = v14;
          __int16 v26 = 1024;
          int v27 = 511;
          __int16 v28 = 1024;
          int v29 = v21;
          _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error creating shared memory (name: %s, size: %lld, permissions: %x): %d\n",  buf,  0x22u);
        }
      }

      else
      {
        int v16 = v15;
        ftruncate(v15, v14);
        v17 = mmap(0LL, v14, 3, 1, v16, 0LL);
        close(v16);
        if (v17 != (void *)-1LL)
        {
          *(void *)v17 = v14;
          *((void *)v17 + 1) = v17;
          *((void *)v17 + 2) = v10 + 80;
          strlcpy((char *)v17 + v10 + 80, v11, v13);
LABEL_9:
          *((_DWORD *)v17 + 6) = 0;
          *((_DWORD *)v17 + 7) = a4;
          *((_DWORD *)v17 + 8) = a4;
          *((_DWORD *)v17 + 9) = a4;
          atomic_store(0, (unsigned int *)v17 + 13);
          atomic_store(0, (unsigned int *)v17 + 14);
          atomic_store(0, (unsigned int *)v17 + 15);
          atomic_store(0, (unsigned int *)v17 + 16);
          atomic_store(0, (unsigned int *)v17 + 12);
          atomic_store(getpid(), (unsigned int *)v17 + 10);
          atomic_store(0, (unsigned int *)v17 + 11);
          return objc_msgSend__setupWithShm_asCreator_(self, v19, (uint64_t)v17, 1);
        }
      }

      return 0;
    }
  }

  else
  {
    size_t v14 = (v10 + 16463) & 0x1FFFFC000LL;
  }

  v18 = mmap(0LL, v14, 3, 4098, 167772160, 0LL);
  if (v18 != (void *)-1LL)
  {
    v17 = v18;
    void *v18 = v14;
    v18[1] = v18;
    v18[2] = 0LL;
    goto LABEL_9;
  }

  return 0;
}

- (DTXSharedMemoryTransport)initWithLocalName:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  v7 = -[DTXTransport init](&v11, sel_init);
  v9 = v7;
  if (v7 && (objc_msgSend__setupCreatingSharedMemory_size_(v7, v8, (uint64_t)v6, v4) & 1) == 0)
  {

    v9 = 0LL;
  }

  return v9;
}

- (DTXSharedMemoryTransport)initWithRemoteAddress:(id)a3
{
  kern_return_t v45;
  int v46;
  os_log_s *v47;
  const char *v48;
  uint32_t v49;
  vm_map_t v50;
  vm_map_t v51;
  _BYTE *v52;
  int v53;
  os_log_s *v54;
  const char *v55;
  int v56;
  const char *v57;
  vm_map_t v59;
  kern_return_t v60;
  mach_vm_address_t v61;
  mach_vm_size_t v62;
  kern_return_t v63;
  unsigned int v64;
  uint64_t v65;
  mach_port_name_t name;
  objc_super v67;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  _BYTE buf[24];
  void *v71;
  uint8_t *v72;
  uint8_t v73[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t v77[4];
  mach_vm_address_t v78;
  __int16 v79;
  vm_map_t v80;
  __int16 v81;
  vm_prot_t v82;
  uint64_t v83;
  v83 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  v7 = -[DTXTransport initWithRemoteAddress:](&v67, sel_initWithRemoteAddress_, v4);
  if (!v7) {
    goto LABEL_40;
  }
  objc_msgSend_scheme(v4, v5, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, (uint64_t)@"shm"))
  {

LABEL_5:
    id v17 = objc_msgSend_host(v4, v12, v13);
    v20 = (const char *)objc_msgSend_UTF8String(v17, v18, v19);
    int v21 = v20;
    if (!v20 || !*v20) {
      goto LABEL_36;
    }
    int v22 = shm_open(v20, 2);
    if (v22 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        v46 = *__error();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v46;
        v47 = (os_log_s *)MEMORY[0x1895F8DA0];
        v48 = "Error connecting to shared memory (name: %s): %d\n";
        v49 = 18;
LABEL_24:
        _os_log_impl(&dword_188BBF000, v47, OS_LOG_TYPE_ERROR, v48, buf, v49);
      }

- (DTXSharedMemoryTransport)initWithMemoryAddress:(unint64_t)a3 inTask:(unsigned int)a4
{
  kern_return_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  kern_return_t v14;
  DTXSharedMemoryTransport *v15;
  const char *v17;
  void v18[2];
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  vm_prot_t v33;
  uint64_t v34;
  v34 = *MEMORY[0x1895F89C0];
  if (!a3) {
    goto LABEL_21;
  }
  if (a4 - 1 > 0xFFFFFFFD) {
    goto LABEL_21;
  }
  uint64_t v6 = (vm_map_t *)MEMORY[0x1895FBBE0];
  vm_map_t v7 = *MEMORY[0x1895FBBE0];
  int v22 = 0LL;
  v23 = &v22;
  size_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  uint64_t v19 = sub_188BD14B0;
  v20 = &unk_18A2EDF50;
  int v21 = &v22;
  v9 = v18;
  if (mach_task_is_self(a4))
  {
    v19((uint64_t)v9, (void *)a3);
  }

  else
  {
    vm_map_t v10 = *v6;
    *(void *)cur_protection = 0LL;
    target_address = 0LL;
    uint64_t v11 = mach_vm_remap(v10, &target_address, 0x50uLL, 0LL, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        int v29 = a3;
        uint64_t v30 = 1024;
        int v31 = a4;
        v32 = 1024;
        uint64_t v33 = v11;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory for address: %#llx in task: %d (%d)\n",  buf,  0x18u);
      }

      size_t v12 = 0LL;
    }

    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          int v29 = a3;
          uint64_t v30 = 1024;
          int v31 = a4;
          v32 = 1024;
          uint64_t v33 = cur_protection[1];
          _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory r/w for address: %#llx in task: %d (%d)\n",  buf,  0x18u);
        }

        mach_vm_deallocate(v10, target_address, 0x50uLL);
      }

      size_t v12 = target_address;
    }

    v19((uint64_t)v9, (void *)v12);
    mach_vm_deallocate(*v6, v12, 0x50uLL);
  }

  uint64_t v13 = v23[3];
  if (!v13)
  {
LABEL_20:
    _Block_object_dispose(&v22, 8);
LABEL_21:
    int v15 = 0LL;
    goto LABEL_22;
  }

  *(void *)cur_protection = 0LL;
  target_address = 0LL;
  size_t v14 = mach_vm_remap(v7, &target_address, v13, 0LL, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      int v29 = a3;
      uint64_t v30 = 1024;
      int v31 = a4;
      v32 = 1024;
      uint64_t v33 = v14;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory for address: %#llx in task: %d (%d)\n",  buf,  0x18u);
    }

    goto LABEL_20;
  }

  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      int v29 = a3;
      uint64_t v30 = 1024;
      int v31 = a4;
      v32 = 1024;
      uint64_t v33 = cur_protection[1];
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory r/w for address: %#llx in task: %d (%d)\n",  buf,  0x18u);
    }

    mach_vm_deallocate(v7, target_address, v13);
  }

  int v15 = (DTXSharedMemoryTransport *)target_address;
  _Block_object_dispose(&v22, 8);
  if (v15)
  {
    self = (DTXSharedMemoryTransport *)(id)objc_msgSend_initWithMappedMemory_(self, v17, (uint64_t)v15);
    int v15 = self;
  }

- (DTXSharedMemoryTransport)initWithMappedMemory:(DTXSharedMemory *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  v5 = -[DTXTransport init](&v9, sel_init);
  if (v5)
  {
    if (a3)
    {
      unsigned int v6 = atomic_load((unsigned int *)&a3->var8);
      if (v6 && v6 != getpid())
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v11 = v6;
          _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to attach to shared memory - process %d already attached.\n",  buf,  8u);
        }

        a3 = 0LL;
      }

      else
      {
        atomic_store(getpid(), (unsigned int *)&a3->var8);
        unint64_t var2 = a3->var2;
        if (var2) {
          shm_unlink((const char *)a3 + var2);
        }
      }
    }

    if ((objc_msgSend__setupWithShm_asCreator_(v5, v4, (uint64_t)a3, 0) & 1) == 0)
    {

      return 0LL;
    }
  }

  return v5;
}

- (void)dealloc
{
  shm = self->_shm;
  if (shm)
  {
    atomic_store(1u, &shm->var9);
    if (shm->var2)
    {
    }

    mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)shm, shm->var0);
  }

  self->_shm = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  -[DTXTransport dealloc](&v5, sel_dealloc);
}

- (int)remotePid
{
  uint64_t v2 = 44LL;
  if (!self->_creator) {
    uint64_t v2 = 40LL;
  }
  return atomic_load((unsigned int *)((char *)self->_shm + v2));
}

- (void)setRemotePid:(int)a3
{
  uint64_t v3 = 44LL;
  if (!self->_creator) {
    uint64_t v3 = 40LL;
  }
  atomic_store(a3, (unsigned int *)((char *)self->_shm + v3));
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  shm = self->_shm;
  if (shm)
  {
    uint64_t v6 = 52LL;
    if (self->_creator)
    {
      p_var10 = (unsigned int *)&shm->var10;
    }

    else
    {
      uint64_t v6 = 60LL;
      p_var10 = (unsigned int *)&shm->var12;
    }

    uint64_t v8 = 56LL;
    if (!self->_creator) {
      uint64_t v8 = 64LL;
    }
    uint64_t v9 = 32LL;
    if (self->_creator) {
      uint64_t v9 = 24LL;
    }
    uint64_t v10 = 36LL;
    if (self->_creator) {
      uint64_t v10 = 28LL;
    }
    uint64_t v11 = 44LL;
    if (!self->_creator) {
      uint64_t v11 = 40LL;
    }
    if (a4)
    {
      uint64_t v12 = (char *)a3;
      unint64_t v13 = 0LL;
      int v14 = *(_DWORD *)((char *)&shm->var0 + v10);
      int v15 = &shm->var17[*(unsigned int *)((char *)&shm->var0 + v9)];
      v35 = (unsigned int *)((char *)shm + v6);
      uint64_t v36 = (unsigned int *)((char *)shm + v8);
      v32 = (unsigned int *)((char *)shm + v11);
      unint64_t v16 = a4;
      unsigned int v17 = 64;
      v34 = v15;
      int v33 = v14;
      while (1)
      {
        if (atomic_load(&shm->var9)) {
          goto LABEL_57;
        }
        signed int v19 = atomic_load(v36);
        signed int v20 = atomic_load(v35);
        if (v19 <= v20) {
          int v21 = v14;
        }
        else {
          int v21 = 0;
        }
        unsigned int v22 = v19 + ~v20 + v21;
        if (v22)
        {
          signed int v23 = v20;
          LODWORD(v24) = v14 - v20;
          if (v14 - v20 >= v22) {
            size_t v24 = v22;
          }
          else {
            size_t v24 = v24;
          }
          if (v16 >= v24) {
            size_t v25 = v24;
          }
          else {
            size_t v25 = v16;
          }
          memcpy(&v15[v20], v12, v25);
          v12 += v25;
          v16 -= v25;
          v13 += v25;
          if (v16) {
            BOOL v26 = v22 == (_DWORD)v25;
          }
          else {
            BOOL v26 = 1;
          }
          if (v26)
          {
            LODWORD(v25) = v23 + v25;
          }

          else
          {
            else {
              size_t v25 = v16;
            }
            memmove(v15, v12, v25);
            v12 += v25;
            v16 -= v25;
            v13 += v25;
          }

          int v15 = v34;
          while (1)
          {
            unsigned int v29 = __ldaxr(p_var10);
            if (v29 != v23) {
              break;
            }
            if (!__stlxr(v25, p_var10))
            {
              unsigned int v17 = 64;
              goto LABEL_49;
            }
          }

          __clrex();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Inconsistent writer offset in shared memory! MT transmission suspected...\n",  buf,  2u);
          }

          goto LABEL_57;
        }

        pid_t v27 = atomic_load(v32);
        useconds_t v28 = v17 <= 0x40 ? 64 : v17;
        usleep(v28);
        if (v28 <= 0x10000) {
          break;
        }
        if (!v27 || kill(v27, 0) != -1)
        {
          unsigned int v17 = 0x20000;
          goto LABEL_48;
        }

        uint64_t v30 = __error();
        int v14 = v33;
        if (*v30 == 3) {
          goto LABEL_57;
        }
        unsigned int v17 = 0x20000;
        int v15 = v34;
LABEL_50:
        if (!v16) {
          goto LABEL_57;
        }
      }

      unsigned int v17 = 2 * v28;
LABEL_48:
      int v15 = v34;
LABEL_49:
      int v14 = v33;
      goto LABEL_50;
    }
  }

  unint64_t v13 = 0LL;
LABEL_57:
  if (v13 < a4) {
    objc_msgSend_disconnect(self, a2, (uint64_t)a3);
  }
  return v13;
}

- (void)disconnect
{
  listenQueue = self->_listenQueue;
  if (listenQueue) {
    dispatch_sync((dispatch_queue_t)listenQueue, &unk_18A2EDF28);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  -[DTXTransport disconnect](&v4, sel_disconnect);
}

- (id)localAddresses
{
  uint64_t v3 = atomic_load((unsigned int *)&self->_shm->var7);
  objc_msgSend_addressForMemory_inProcess_(DTXSharedMemoryTransport, a2, self->_shm->var1, v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  shm = self->_shm;
  unint64_t var2 = shm->var2;
  if (var2)
  {
    objc_msgSend_stringWithUTF8String_(NSString, v4, (uint64_t)shm + var2);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_addressForPosixSharedMemoryWithName_(DTXSharedMemoryTransport, v8, (uint64_t)v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_(MEMORY[0x189603F18], v11, (uint64_t)v5, v10, 0);
    }

    else
    {
      uint64_t v10 = 0LL;
      objc_msgSend_arrayWithObjects_(MEMORY[0x189603F18], v8, (uint64_t)v5, 0, 0);
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    objc_msgSend_arrayWithObjects_(MEMORY[0x189603F18], v4, (uint64_t)v5, 0, 0);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)permittedBlockCompressionTypes
{
  return (id)objc_msgSend_set(MEMORY[0x189604010], a2, v2);
}

- (DTXSharedMemory)sharedMemory
{
  return self->_shm;
}

- (void).cxx_destruct
{
}

@end