void Security::CodeSigning::MachOEditor::~MachOEditor(Security::CodeSigning::MachOEditor *this)
{
  void *v1;
  Security::CodeSigning::MachOEditor::~MachOEditor(this);
  operator delete(v1);
}

{
  uint64_t v2;
  const char *v3;
  *(void *)this = off_189677D40;
  v2 = *((void *)this + 24);
  if (v2)
  {
    free(*(void **)(v2 + 8));
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v2 + 56));
    operator delete((void *)v2);
  }

  if (*((_BYTE *)this + 208))
  {
    v3 = (char *)this + 144;
    remove(v3);
  }

  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachOEditor *)((char *)this + 200));
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 22));
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer((void *)this + 6);
  Security::CodeSigning::ArchEditor::~ArchEditor(this);
}

uint64_t Security::CodeSigning::MachOEditor::component( Security::CodeSigning::MachOEditor *this, uint64_t a2, const __CFData *a3)
{
  return (*(uint64_t (**)(void, uint64_t, const __CFData *))(**((void **)this + 6) + 16LL))( *((void *)this + 6),  a2,  a3);
}

uint64_t Security::CodeSigning::MachOEditor::allocate(Security::CodeSigning::MachOEditor *this)
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  v86 = 0LL;
  *((_BYTE *)this + 208) = 1;
  v2 = (Security::CodeSigning::MachOEditor *)*((void *)this + 3);
  char v3 = 0;
  do
  {
    uint64_t v4 = *(void *)(*((void *)v2 + 5) + 120LL);
    BOOL v5 = v4 == 0;
    if (v4 && (v3 & 1) != 0)
    {
      v74 = (os_log_s *)secLogObjForScope("SecError");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1804F4000,  v74,  OS_LOG_TYPE_DEFAULT,  "codesign allocate error: one architecture signaled removal while another signaled signing",  buf,  2u);
      }

      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
    }

    v6 = (Security::CodeSigning::MachOEditor *)*((void *)v2 + 1);
    if (v6)
    {
      do
      {
        v7 = v6;
        v6 = *(Security::CodeSigning::MachOEditor **)v6;
      }

      while (v6);
    }

    else
    {
      do
      {
        v7 = (Security::CodeSigning::MachOEditor *)*((void *)v2 + 2);
        BOOL v28 = *(void *)v7 == (void)v2;
        v2 = v7;
      }

      while (!v28);
    }

    v3 |= v5;
    v2 = v7;
  }

  while (v7 != (Security::CodeSigning::MachOEditor *)((char *)this + 32));
  if ((v3 & 1) == 0)
  {
LABEL_23:
    v16 = (char *)this + 120;
    v17 = (char *)this + 144;
    v82[0] = MEMORY[0x1895F87A8];
    v82[1] = 0x40000000LL;
    v83 = ___ZN8Security11CodeSigning11MachOEditor8allocateEv_block_invoke;
    v84 = &__block_descriptor_tmp_14652;
    v85 = this;
    v86 = 0LL;
    *(void *)buf = 0LL;
    __dst = 0LL;
    vm_size_t size = 0LL;
    v18 = *(unsigned int **)buf;
    vm_size_t v19 = size;
    if (HIDWORD(size))
    {
      log_error(&v86, "input file too large: %lld bytes\n", size);
      LODWORD(v19) = 0;
      goto LABEL_109;
    }

    v20 = 0LL;
    unsigned int v21 = 0;
    int v22 = **(_DWORD **)buf;
    if ((int)**(_DWORD **)buf > -17958195)
    {
      uint64_t v23 = 0LL;
      if ((v22 + 17958194) < 2)
      {
LABEL_35:
        unsigned int v24 = v22 & 0xFEFFFFFF;
        unsigned int v25 = *(_DWORD *)(*(void *)buf + 4LL);
        unsigned int v26 = *(_DWORD *)(*(void *)buf + 8LL);
        unsigned int v27 = bswap32(v25);
        BOOL v28 = v24 == -822415874;
        if (v24 == -822415874) {
          uint64_t v29 = v27;
        }
        else {
          uint64_t v29 = v25;
        }
        unsigned int v30 = bswap32(v26);
        if (v28) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = v26;
        }
        unsigned int v32 = v83((uint64_t)v82, v29, v31);
        unsigned int v33 = v32;
        if (v32 == -1)
        {
          log_error(&v86, "requested signature size is too long for slice");
        }

        else
        {
          if ((v32 & 0xF) != 0)
          {
            log_error(&v86, "signature size not a multiple of 16\n");
            int v34 = 0;
            uint64_t v23 = 0LL;
            goto LABEL_89;
          }

          uint64_t v35 = v19 + v32;
          BOOL v36 = __CFADD__((_DWORD)v19, v32);
          uint64_t v37 = v35 + 15;
          uint64_t v38 = (v35 + 15) << 31 >> 31;
          unsigned int v88 = v37;
          if (v36 || v38 != v37 || v38 < 0)
          {
            log_error(&v86, "overflow calculating output size (%u + %d + 15)", v19, v32);
          }

          else
          {
            uint64_t v23 = v38 & 0x1FFFFFFFFLL;
            if (vm_alloc((vm_address_t *)&__dst, v38 & 0x1FFFFFFFFLL, &v86))
            {
              v20 = __dst;
              memcpy(__dst, v18, v19);
              if (!assure_signature_space(v20, v33, v19, &v88, &v86))
              {
                int v34 = 0;
                goto LABEL_89;
              }

              unsigned int v21 = v88;
              goto LABEL_88;
            }
          }
        }

LABEL_109:
        munmap(v18, v19);
        goto LABEL_110;
      }
    }

    else
    {
      if (v22 != -1095041334)
      {
        if (v22 != -822415874)
        {
          uint64_t v23 = 0LL;
          if (v22 != -805638658) {
            goto LABEL_88;
          }
        }

        goto LABEL_35;
      }

      unsigned int v21 = *(_DWORD *)(*(void *)buf + 4LL);
      size_t v40 = bswap32(v21);
      v41 = calloc(v40, 4uLL);
      v79 = v18;
      if (v21)
      {
        v42 = v17;
        uint64_t v43 = 0LL;
        LODWORD(v44) = 0;
        v45 = v18 + 3;
        v46 = "requested signature size is too long for slice: %d\n";
        while (1)
        {
          if (bswap32(v45[2]) + bswap32(v45[1]) > v19)
          {
            log_error(&v86, "malformed fat file, slice %d extends past end of file\n", v43);
            v18 = v79;
            goto LABEL_108;
          }

          int v47 = v83((uint64_t)v82, bswap32(*(v45 - 1)), bswap32(*v45));
          if (v47 == -1) {
            goto LABEL_107;
          }
          if ((v47 & 0xF) != 0) {
            break;
          }
          v41[v43] = v47;
          uint64_t v44 = (v47 + v44);
          ++v43;
          v45 += 5;
          if (v40 == v43)
          {
            v18 = v79;
            v17 = v42;
            goto LABEL_78;
          }
        }

        v46 = "signature size not a multiple of 16 in slice %d\n";
LABEL_107:
        log_error(&v86, v46, v43);
        v18 = v79;
LABEL_108:
        free(v41);
        goto LABEL_109;
      }

      uint64_t v44 = 0LL;
LABEL_78:
      uint64_t v23 = (16399 * v40) + (unint64_t)v19 + v44;
      if (!vm_alloc((vm_address_t *)&__dst, v23, &v86)) {
        goto LABEL_108;
      }
      v20 = __dst;
      *(void *)__dst = *(void *)v18;
      if (v21)
      {
        v77 = v17;
        uint64_t v78 = (16399 * v40) + (unint64_t)v19 + v44;
        uint64_t v60 = 0LL;
        v61 = (char *)(v20 + 4096);
        v62 = v18 + 5;
        v63 = v20 + 6;
        while (1)
        {
          __int128 v64 = *(_OWORD *)(v62 - 3);
          _DWORD *v63 = v62[1];
          *((_OWORD *)v63 - 1) = v64;
          size_t v65 = bswap32(*v62);
          memcpy(v61, (char *)v79 + bswap32(*(v62 - 1)), v65);
          unsigned int v66 = v41[v60];
          unsigned int v87 = v66 + v65;
          if ((assure_signature_space(v61, v66, v65, &v87, &v86) & 1) == 0) {
            break;
          }
          unint64_t v67 = v61 - (char *)v20;
          if (v61 < (char *)v20)
          {
            log_error(&v86, "new architecture offset underflows");
            break;
          }

          if (HIDWORD(v67))
          {
            log_error(&v86, "new architecture offset is too large");
            break;
          }

          unsigned int v68 = v87;
          unsigned int v69 = bswap32(v87);
          *(v63 - 2) = bswap32(v67);
          *(v63 - 1) = v69;
          _DWORD *v63 = 234881024;
          unsigned int v21 = v67 + v68;
          if (__CFADD__((_DWORD)v67, v68))
          {
            log_error( &v86,  "new outputsize overflows: newOffset(%d) newSliceSize(%d)\n",  (_DWORD)v61 - (_DWORD)v20,  v68);
            break;
          }

          v61 += (v68 + 0x3FFF) & 0xFFFFC000;
          ++v60;
          v62 += 5;
          v63 += 5;
          if (v40 == v60)
          {
            uint64_t v23 = v78;
            v18 = v79;
            v17 = v77;
            goto LABEL_87;
          }
        }

        free(v41);
        int v34 = 0;
        uint64_t v23 = v78;
        v18 = v79;
LABEL_89:
        BOOL v70 = vm_dealloc(&__dst, v23, &v86);
        munmap(v18, v19);
        if ((v70 & v34 & 1) != 0) {
          goto LABEL_90;
        }
LABEL_110:
        v75 = (os_log_s *)secLogObjForScope("SecError");
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v86;
          _os_log_impl(&dword_1804F4000, v75, OS_LOG_TYPE_DEFAULT, "codesign allocation failed: %s", buf, 0xCu);
        }

        free(v86);
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
      }

void sub_180628AAC(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::MachOEditor::reset(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = Security::Universal::architecture( *(Security::Universal **)(a1 + 192),  (const Security::Architecture *)*(unsigned int *)(a2 + 48),  *(_DWORD *)(a2 + 52));
  uint64_t result = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = v4;
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  v6 = *(void **)(a1 + 168);
  if (v6 != (void *)(a1 + 176))
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      v11[0] = v7;
      v11[1] = 0x40000000LL;
      v11[2] = ___ZN8Security11CodeSigning11MachOEditor5resetERNS0_10ArchEditor4ArchE_block_invoke;
      v11[3] = &__block_descriptor_tmp_4_14647;
      v11[4] = a1;
      v11[5] = a2;
      uint64_t result = Security::CodeSigning::ArchEditor::Arch::eachDigest(a2, (uint64_t)v11);
      v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (void *)*v8;
        }

        while (v8);
      }

      else
      {
        do
        {
          v9 = (void *)v6[2];
          BOOL v10 = *v9 == (void)v6;
          v6 = v9;
        }

        while (!v10);
      }

      v6 = v9;
    }

    while (v9 != (void *)(a1 + 176));
  }

  return result;
}

void Security::CodeSigning::MachOEditor::write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v6 = *(Security::MachOBase **)(a2 + 56);
  CodeSignature = Security::MachOBase::findCodeSignature(v6);
  if (!CodeSignature
    || ((cmd = CodeSignature[1].cmd, v9 = bswap32(cmd), *((_BYTE *)v6 + 33)) ? (uint64_t v10 = v9) : (uint64_t v10 = cmd), !(_DWORD)v10))
  {
    v16 = (os_log_s *)secLogObjForScope("signer");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134217984;
      uint64_t v18 = a1;
      _os_log_debug_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEBUG,  "%p cannot find CODESIGNING data in Mach-O",  (uint8_t *)&v17,  0xCu);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
  }

  vm_size_t v11 = *(Security::MachOBase **)(a2 + 56);
  v12 = Security::MachOBase::findCodeSignature(v11);
  if (v12)
  {
    cmdvm_size_t size = v12[1].cmdsize;
    unsigned int v14 = bswap32(cmdsize);
    if (*((_BYTE *)v11 + 33)) {
      unint64_t v15 = v14;
    }
    else {
      unint64_t v15 = cmdsize;
    }
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  NXGetArchInfoFromCpuType(*(_DWORD *)(a2 + 48), *(_DWORD *)(a2 + 52) & 0xFFFFFF);
  if (v15 < bswap32(*(_DWORD *)(a3 + 4))) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA24LL);
  }
  Security::UnixPlusPlus::FileDesc::seek( (Security::UnixPlusPlus::FileDesc *)*(unsigned int *)(*(void *)(a2 + 56) + 36LL),  *(void *)(*(void *)(a2 + 56) + 48LL) + v10);
  Security::UnixPlusPlus::FileDesc::writeAll(*(void *)(a2 + 56) + 36LL, (char *)a3, bswap32(*(_DWORD *)(a3 + 4)));
  free((void *)a3);
}

uint64_t Security::CodeSigning::MachOEditor::commit(Security::CodeSigning::MachOEditor *this)
{
  v2 = (char *)this + 120;
  int v3 = *((char *)this + 143);
  uint64_t v4 = (char *)this + 120;
  if (v3 < 0) {
    uint64_t v4 = *(const char **)v2;
  }
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v18.st_blkvm_size_t size = v5;
  *(timespec *)v18.st_qspare = v5;
  v18.st_birthtimespec = v5;
  *(timespec *)&v18.st_vm_size_t size = v5;
  v18.st_mtimespec = v5;
  v18.st_ctimespec = v5;
  *(timespec *)&v18.st_uid = v5;
  v18.st_atimespec = v5;
  *(timespec *)&v18.st_dev = v5;
  if (stat(v4, &v18) == -1 || (v6 = copyfile_state_alloc()) == 0LL)
  {
    vm_size_t v11 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v11);
  }

  uint64_t v7 = v6;
  int src = *((_DWORD *)this + 50);
  if (copyfile_state_set(v6, 3u, &src) < 0)
  {
    unsigned int v13 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v13);
  }

  uid_t v16 = -1;
  if (!Security::CodeSigning::UidGuard::seteuid((Security::CodeSigning::UidGuard *)&v16, 0)) {
    Security::CodeSigning::UidGuard::seteuid((Security::CodeSigning::UidGuard *)&v16, v18.st_uid);
  }
  v8 = v2;
  if (copyfile(v8, 0LL, v7, 7u) < 0)
  {
    unsigned int v14 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v14);
  }

  char __buf = -86;
  Security::UnixPlusPlus::FileDesc::read( (Security::UnixPlusPlus::FileDesc *)*((unsigned int *)this + 50),  &__buf,  1uLL,  0LL);
  if (pwrite(*((_DWORD *)this + 50), &__buf, 1uLL, 0LL) == -1) {
    goto LABEL_19;
  }
  unsigned int v9 = (char *)this + 144;
  if (rename(v9, v2) == -1)
  {
LABEL_19:
    v12 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v12);
  }

  *((_BYTE *)this + 208) = 0;
  Security::CodeSigning::UidGuard::~UidGuard(&v16);
  (*(void (**)(void))(**((void **)this + 6) + 48LL))(*((void *)this + 6));
  return copyfile_state_free(v7);
}

void sub_180628F1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

BOOL Security::CodeSigning::UidGuard::seteuid(Security::CodeSigning::UidGuard *this, uid_t a2)
{
  if (geteuid() == a2) {
    return 1LL;
  }
  if (*(_DWORD *)this == -1) {
    *(_DWORD *)this = geteuid();
  }
  return seteuid(a2) == 0;
}

void Security::CodeSigning::UidGuard::~UidGuard(uid_t *this)
{
  uid_t v1 = *this;
  if (v1 != -1 && seteuid(v1) == -1)
  {
    v2 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v2);
  }

void ___ZN8Security11CodeSigning11MachOEditor5resetERNS0_10ArchEditor4ArchE_block_invoke( uint64_t a1, void *a2)
{
  v2 = (Security::UnixPlusPlus::FileDesc *)(a2 + 5);
  if (*((_DWORD *)a2 + 10) != -1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    else {
      std::string __p = *(std::string *)(v5 + 144);
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 56LL);
    uint64_t v7 = *(void *)(v6 + 48);
    CodeSignature = Security::MachOBase::findCodeSignature((Security::MachOBase *)v6);
    if (CodeSignature)
    {
      unsigned int cmd = CodeSignature[1].cmd;
      unsigned int v10 = bswap32(cmd);
      if (*(_BYTE *)(v6 + 33)) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = cmd;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    Security::UnixPlusPlus::FileDesc::close(v2);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    Security::UnixPlusPlus::FileDesc::open(v2, (const char *)p_p, 0, 438);
    a2[6] = v7;
    a2[7] = v11;
  }

void sub_1806290CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::ArchEditor::Arch::eachDigest(uint64_t result, uint64_t a2)
{
  v2 = *(void **)(result + 64);
  int v3 = (void *)(result + 72);
  if (v2 != (void *)(result + 72))
  {
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v2[5]);
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = (void *)*v5;
        }

        while (v5);
      }

      else
      {
        do
        {
          uint64_t v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          v2 = v6;
        }

        while (!v7);
      }

      v2 = v6;
    }

    while (v6 != v3);
  }

  return result;
}

unint64_t ___ZN8Security11CodeSigning11MachOEditor8allocateEv_block_invoke( uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  uint64_t v5 = (void *)(v3 + 32);
  uint64_t v6 = 0xFFFFFFFFLL;
  if (v4 != v5)
  {
    do
    {
      if (*((_DWORD *)v4 + 8) == a2 && (a3 == -1 || ((*((_DWORD *)v4 + 9) ^ a3) & 0xFFFFFF) == 0)) {
        uint64_t v6 = *(void *)(v4[5] + 120LL);
      }
      BOOL v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          BOOL v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }

        while (!v9);
      }

      uint64_t v4 = v8;
    }

    while (v8 != v5);
  }

  if (((v6 - 1) & 0xFFFFFFFFFFFFFFF0LL) + 16 >= 0xFFFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ((v6 - 1) & 0xFFFFFFFFFFFFFFF0LL) + 16;
  }
}

void Security::CodeSigning::BlobWriter::component( uint64_t **this, Security::CodeSigning::CodeDirectory *a2, const __CFData *a3)
{
}

void Security::CodeSigning::DetachedBlobWriter::~DetachedBlobWriter( Security::CodeSigning::DetachedBlobWriter *this)
{
}

{
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24);
  operator delete(this);
}

void Security::CodeSigning::DetachedBlobWriter::flush( Security::CodeSigning::DetachedBlobWriter *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9 = (UInt8 *)Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::make( (uint64_t)this + 24,  a2,  a3,  a4,  a5,  a6,  a7,  a8);
  unsigned int v10 = *(Security::CodeSigning::SecStaticCode **)(*((void *)this + 6) + 16LL);
  v12 = CFDataCreate(0LL, v9, bswap32(*((_DWORD *)v9 + 1)));
  Security::CodeSigning::SecStaticCode::detachedSignature(v10, v12);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v12);
  Security::CodeSigning::SecCodeSigner::returnDetachedSignature( *(CFTypeRef **)(*((void *)this + 6) + 8LL),  (Security::BlobCore *)v9,  v11);
  free(v9);
}

void sub_18062937C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t Security::CodeSigning::ArchEditor::ArchEditor( uint64_t a1, Security::Universal *this, void *a3, int a4)
{
  uint64_t v4 = a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 12) = -1LL;
  *(_DWORD *)(a1 + 20) = a4;
  *(void *)a1 = off_189677C28;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  size_t v40 = (uint64_t **)(a1 + 32);
  *(void *)(a1 + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = a1 + 32;
  v44[0] = 0LL;
  v44[1] = 0LL;
  uint64_t v43 = v44;
  Security::Universal::architectures((uint64_t *)this, (uint64_t *)&v43);
  uint64_t v5 = (uint64_t)v43;
  if (v43 != v44)
  {
    uint64_t v38 = v4;
    do
    {
      uint64_t v6 = (char *)operator new(0x80uLL);
      std::set<unsigned int>::set[abi:ne180100]((uint64_t)&v41, a3);
      *((_DWORD *)v6 + 2) = 0;
      *(void *)(v6 + 12) = -1LL;
      *((_DWORD *)v6 + 5) = 0;
      *((void *)v6 + 5) = 0LL;
      *((void *)v6 + 4) = 0LL;
      *((void *)v6 + 3) = v6 + 32;
      *(void *)uint64_t v6 = off_189677C90;
      uint64_t v7 = *(void *)(v5 + 28);
      *((void *)v6 + 12) = 0LL;
      *((void *)v6 + 6) = v7;
      *((void *)v6 + 7) = 0LL;
      *((void *)v6 + 9) = 0LL;
      v8 = (char **)(v6 + 72);
      *((void *)v6 + 8) = v6 + 72;
      *((void *)v6 + 10) = 0LL;
      *((void *)v6 + 11) = v6 + 96;
      *((void *)v6 + 14) = 0LL;
      *((void *)v6 + 15) = 0LL;
      *((void *)v6 + 13) = 0LL;
      BOOL v9 = v41;
      if (v41 != v42)
      {
        do
        {
          unsigned int v10 = (Security::CodeSigning::CodeDirectory::Builder *)operator new(0xF0uLL);
          Security::CodeSigning::CodeDirectory::Builder::Builder( v10,  (Security::CodeSigning::CodeDirectory *)*((unsigned int *)v9 + 7));
          unsigned int v11 = *((_DWORD *)v9 + 7);
          v12 = *v8;
          unsigned int v13 = (char **)(v6 + 72);
          unsigned int v14 = (char **)(v6 + 72);
          if (*v8)
          {
            while (1)
            {
              while (1)
              {
                unsigned int v14 = (char **)v12;
                unsigned int v15 = *((_DWORD *)v12 + 8);
                if (v11 >= v15) {
                  break;
                }
                v12 = *v14;
                unsigned int v13 = v14;
                if (!*v14) {
                  goto LABEL_11;
                }
              }

              if (v15 >= v11) {
                break;
              }
              v12 = v14[1];
              if (!v12)
              {
                unsigned int v13 = v14 + 1;
                goto LABEL_11;
              }
            }
          }

          else
          {
LABEL_11:
            unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
            uid_t v16 = (char *)operator new(0x70uLL);
            v45[0] = v16;
            v45[1] = v6 + 72;
            LOBYTE(v46) = 0;
            *((_DWORD *)v16 + 8) = v11;
            Security::Mutex::Mutex((pthread_mutex_t *)(v16 + 48));
            do
              unsigned int v17 = __ldxr((unsigned int *)v10);
            while (__stxr(v17 + 1, (unsigned int *)v10));
            *((void *)v16 + 5) = v10;
            LOBYTE(v46) = 1;
            *(void *)uid_t v16 = 0LL;
            *((void *)v16 + 1) = 0LL;
            *((void *)v16 + 2) = v14;
            *unsigned int v13 = v16;
            uint64_t v18 = **((void **)v6 + 8);
            if (v18)
            {
              *((void *)v6 + 8) = v18;
              uid_t v16 = *v13;
            }

            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>( *((uint64_t **)v6 + 9),  (uint64_t *)v16);
            ++*((void *)v6 + 10);
            v45[0] = 0LL;
            std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,void *>>>>::reset[abi:ne180100]((uint64_t)v45);
          }

          uint64_t v19 = v9[1];
          if (v19)
          {
            do
            {
              v20 = (void **)v19;
              uint64_t v19 = (void *)*v19;
            }

            while (v19);
          }

          else
          {
            do
            {
              v20 = (void **)v9[2];
              BOOL v21 = *v20 == v9;
              BOOL v9 = v20;
            }

            while (!v21);
          }

          BOOL v9 = v20;
        }

        while (v20 != v42);
      }

      int v22 = v40;
      uint64_t v23 = *v40;
      unsigned int v24 = v40;
      if (*v40)
      {
        int v25 = *(_DWORD *)(v5 + 28);
        int v26 = *(_DWORD *)(v5 + 32);
        while (1)
        {
          while (1)
          {
            unsigned int v24 = v23;
            int v27 = *((_DWORD *)v23 + 8);
            int v28 = *((_DWORD *)v24 + 9);
            BOOL v29 = v26 < v28;
            if (v25 != v27) {
              BOOL v29 = v25 < v27;
            }
            if (!v29) {
              break;
            }
            uint64_t v23 = (uint64_t *)*v24;
            int v22 = (uint64_t **)v24;
            if (!*v24) {
              goto LABEL_34;
            }
          }

          BOOL v30 = v28 < v26;
          int v31 = v25 == v27 ? v30 : v27 < v25;
          if (v31 != 1) {
            break;
          }
          int v22 = (uint64_t **)(v24 + 1);
          uint64_t v23 = (uint64_t *)v24[1];
          if (!v23) {
            goto LABEL_34;
          }
        }

        unsigned int v32 = v24;
        uint64_t v4 = v38;
      }

      else
      {
LABEL_34:
        unsigned int v32 = (uint64_t *)operator new(0x30uLL);
        v32[4] = *(void *)(v5 + 28);
        v32[5] = 0LL;
        *unsigned int v32 = 0LL;
        v32[1] = 0LL;
        v32[2] = (uint64_t)v24;
        *int v22 = v32;
        uint64_t v4 = v38;
        uint64_t v33 = **(void **)(v38 + 24);
        int v34 = v32;
        if (v33)
        {
          *(void *)(v38 + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = v33;
          int v34 = *v22;
        }

        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v38 + 32), v34);
        ++*(void *)(v38 + 40);
      }

      v32[5] = (uint64_t)v6;
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v42[0]);
      uint64_t v35 = *(void **)(v5 + 8);
      if (v35)
      {
        do
        {
          BOOL v36 = (void **)v35;
          uint64_t v35 = (void *)*v35;
        }

        while (v35);
      }

      else
      {
        do
        {
          BOOL v36 = *(void ***)(v5 + 16);
          BOOL v21 = *v36 == (void *)v5;
          uint64_t v5 = (uint64_t)v36;
        }

        while (!v21);
      }

      uint64_t v5 = (uint64_t)v36;
    }

    while (v36 != v44);
  }

  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v44[0]);
  return v4;
}

void sub_1806296F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
}

uint64_t std::set<unsigned int>::set[abi:ne180100](uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0LL;
  uint64_t v3 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = a1 + 8;
  uint64_t v4 = a2 + 1;
  uint64_t v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>( (uint64_t **)a1,  v3,  *((_DWORD *)v5 + 7),  *((_DWORD *)v5 + 7));
      uint64_t v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = (void *)*v6;
        }

        while (v6);
      }

      else
      {
        do
        {
          uint64_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          uint64_t v5 = v7;
        }

        while (!v8);
      }

      uint64_t v5 = v7;
    }

    while (v7 != v4);
  }

  return a1;
}

void sub_180629850(_Unwind_Exception *a1)
{
}

void std::__tree<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>>>::destroy( void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>>>::destroy(a1[1]);
    Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>::~RefPointer((uint64_t)(a1 + 5));
    operator delete(a1);
  }

uint64_t Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>::~RefPointer(uint64_t a1)
{
  v2 = (pthread_mutex_t *)(a1 + 8);
  v9[0] = a1 + 8;
  v9[1] = 0xAAAAAAAAAAAAAA01LL;
  uint64_t v3 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if ((_DWORD)v3) {
    Security::UnixError::throwMe(v3);
  }
  uint64_t v4 = *(Security::CodeSigning::CodeDirectory::Builder **)a1;
  if (*(void *)a1)
  {
    do
    {
      unsigned int v5 = __ldxr((unsigned int *)v4);
      unsigned int v6 = v5 - 1;
    }

    while (__stxr(v6, (unsigned int *)v4));
    if (!v6)
    {
      if (*(void *)a1)
      {
        Security::CodeSigning::CodeDirectory::Builder::~Builder(*(Security::CodeSigning::CodeDirectory::Builder **)a1);
        operator delete(v7);
      }

      *(void *)a1 = 0LL;
    }
  }

  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)v9);
  Security::Mutex::~Mutex(v2);
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,void *>>>>::reset[abi:ne180100]( uint64_t a1)
{
  uid_t v1 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16)) {
      Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>::~RefPointer((uint64_t)v1 + 40);
    }
    operator delete(v1);
  }

void Security::CodeSigning::ArchEditor::Arch::~Arch(void **this)
{
  *this = off_189677C90;
  v2 = (char *)(this + 11);
  free(this[14]);
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)v2);
  std::__tree<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>>>::destroy(this[9]);
  uint64_t v3 = this[7];
  this[7] = 0LL;
  if (v3) {
    (*(void (**)(void *))(*(void *)v3 + 8LL))(v3);
  }
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)(this + 3));
}

{
  char *v2;
  void *v3;
  *this = off_189677C90;
  v2 = (char *)(this + 11);
  free(this[14]);
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)v2);
  std::__tree<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::RefPointer<Security::CodeSigning::CodeDirectory::Builder>>>>::destroy(this[9]);
  uint64_t v3 = this[7];
  this[7] = 0LL;
  if (v3) {
    (*(void (**)(void *))(*(void *)v3 + 8LL))(v3);
  }
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)(this + 3));
  operator delete(this);
}

uint64_t *std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>( uint64_t **a1, uint64_t *a2, unsigned int a3, int a4)
{
  unsigned int v5 = a2;
  uint64_t v7 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2 || (unsigned int v8 = *((_DWORD *)a2 + 7), v8 > a3))
  {
    uint64_t v9 = *a2;
    if (*a1 == a2)
    {
      unsigned int v11 = a2;
LABEL_16:
      if (v9) {
        unsigned int v14 = (uint64_t **)v11;
      }
      else {
        unsigned int v14 = (uint64_t **)a2;
      }
      if (v9) {
        v12 = (void **)(v11 + 1);
      }
      else {
        v12 = (void **)a2;
      }
      goto LABEL_22;
    }

    if (v9)
    {
      unsigned int v10 = (uint64_t *)*a2;
      do
      {
        unsigned int v11 = v10;
        unsigned int v10 = (uint64_t *)v10[1];
      }

      while (v10);
    }

    else
    {
      uid_t v16 = a2;
      do
      {
        unsigned int v11 = (uint64_t *)v16[2];
        BOOL v17 = *v11 == (void)v16;
        uid_t v16 = v11;
      }

      while (v17);
    }

    if (*((_DWORD *)v11 + 7) < a3) {
      goto LABEL_16;
    }
    uint64_t v18 = *v7;
    if (*v7)
    {
      while (1)
      {
        while (1)
        {
          unsigned int v14 = (uint64_t **)v18;
          unsigned int v19 = *((_DWORD *)v18 + 7);
          if (v19 <= a3) {
            break;
          }
          uint64_t v18 = *v14;
          uint64_t v7 = v14;
          if (!*v14) {
            goto LABEL_44;
          }
        }

        if (v19 >= a3) {
          break;
        }
        uint64_t v7 = v14 + 1;
        uint64_t v18 = v14[1];
        if (!v18) {
          goto LABEL_44;
        }
      }

uint64_t Security::CodeSigning::MachOEditor::MachOEditor( uint64_t a1, unsigned int *a2, Security::Universal *a3, void *a4, __int128 *a5)
{
  int v10 = (*(uint64_t (**)(unsigned int *))(*(void *)a2 + 24LL))(a2);
  Security::CodeSigning::ArchEditor::ArchEditor(a1, a3, v18, v10);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)v18[1]);
  *(void *)a1 = off_189677D40;
  Security::Mutex::Mutex((pthread_mutex_t *)(a1 + 56));
  unsigned int v11 = a2 + 2;
  do
    unsigned int v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  *(void *)(a1 + 48) = a2;
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external( (std::string *)(a1 + 120),  *(const std::string::value_type **)a5,  *((void *)a5 + 1));
  }

  else
  {
    __int128 v13 = *a5;
    *(void *)(a1 + 136) = *((void *)a5 + 2);
    *(_OWORD *)(a1 + 120) = v13;
  }

  *(void *)(a1 + 144) = 0xAAAAAAAAAAAAAAAALL;
  else {
    size_t v14 = *((void *)a5 + 1);
  }
  *(void *)(a1 + 152) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 160) = 0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100](a1 + 144, v14 + 7);
  else {
    unsigned int v15 = *(void **)(a1 + 144);
  }
  if (v14)
  {
    else {
      uid_t v16 = *(const std::string::value_type **)a5;
    }
    memmove(v15, v16, v14);
  }

  strcpy((char *)v15 + v14, ".cstemp");
  std::set<unsigned int>::set[abi:ne180100](a1 + 168, a4);
  *(void *)(a1 + 192) = 0LL;
  *(_DWORD *)(a1 + 200) = -1;
  *(_BYTE *)(a1 + 204) = 0;
  *(_BYTE *)(a1 + 208) = 0;
  return a1;
}

void sub_180629D90(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::InternalRequirements::operator()(uint64_t a1)
{
  v2 = (os_log_s *)secLogObjForScope("signer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_debug_impl( &dword_1804F4000,  v2,  OS_LOG_TYPE_DEBUG,  "Platform does not support signing internal requirements",  v3,  2u);
  }

  *(void *)(a1 + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = 0LL;
}

CFTypeRef *Security::CFRef<__CFArray const*>::operator=(CFTypeRef *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (*a1) {
    CFRelease(*a1);
  }
  *a1 = cf;
  return a1;
}

const void **Security::CFRef<__SecTrust *>::~CFRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **Security::CFRef<__SecPolicy *>::~CFRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void Security::CodeSigning::CodeDirectorySet::add( Security::CodeSigning::CodeDirectorySet *this, const Security::CodeSigning::CodeDirectory *a2)
{
  unsigned int v4 = *((unsigned __int8 *)a2 + 37);
  unsigned int v5 = operator new(0x30uLL);
  v5[8] = v4;
  *((void *)v5 + 5) = a2;
  unsigned int v6 = (uint64_t **)((char *)this + 8);
  uint64_t v7 = (uint64_t *)*((void *)this + 1);
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        unsigned int v8 = (uint64_t **)v7;
        unsigned int v9 = *((_DWORD *)v7 + 8);
        if (v9 <= v4) {
          break;
        }
        uint64_t v7 = *v8;
        unsigned int v6 = v8;
        if (!*v8) {
          goto LABEL_9;
        }
      }

      if (v9 >= v4) {
        break;
      }
      uint64_t v7 = v8[1];
      if (!v7)
      {
        unsigned int v6 = v8 + 1;
        goto LABEL_9;
      }
    }

    operator delete(v5);
  }

  else
  {
    unsigned int v8 = (uint64_t **)((char *)this + 8);
LABEL_9:
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at( (uint64_t **)this,  (uint64_t)v8,  v6,  (uint64_t *)v5);
  }

  if (*((_BYTE *)a2 + 37) == 1) {
    *((void *)this + 3) = a2;
  }
}

const void **Security::CodeSigning::CodeDirectorySet::populate( const void **this, Security::CodeSigning::DiskRep::Writer *a2)
{
  uint64_t v3 = this;
  unsigned int v4 = (const void **)*this;
  if (!this[3]) {
    this[3] = v4[5];
  }
  unsigned int v5 = this + 1;
  if (v4 != this + 1)
  {
    unsigned int v6 = 4096;
    do
    {
      uint64_t v7 = (unsigned int *)v4[5];
      unsigned int v8 = (unsigned int *)v3[3];
      if (v7 == v8) {
        uint64_t v9 = 0LL;
      }
      else {
        uint64_t v9 = v6;
      }
      if (v7 != v8) {
        ++v6;
      }
      CFDataRef v13 = CFDataCreate(0LL, (const UInt8 *)v7, bswap32(v7[1]));
      (*(void (**)(Security::CodeSigning::DiskRep::Writer *, uint64_t, CFDataRef))(*(void *)a2 + 16LL))( a2,  v9,  v13);
      this = Security::CFRef<__CFData const*>::~CFRef((const void **)&v13);
      int v10 = (const void **)v4[1];
      if (v10)
      {
        do
        {
          unsigned int v11 = v10;
          int v10 = (const void **)*v10;
        }

        while (v10);
      }

      else
      {
        do
        {
          unsigned int v11 = (const void **)v4[2];
          BOOL v12 = *v11 == v4;
          unsigned int v4 = v11;
        }

        while (!v12);
      }

      unsigned int v4 = v11;
    }

    while (v11 != v5);
  }

  return this;
}

void sub_18062A088(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

CFMutableArrayRef Security::CodeSigning::CodeDirectorySet::hashList( Security::CodeSigning::CodeDirectorySet *this, uint64_t a2)
{
  CFMutableArray = Security::makeCFMutableArray(this, a2);
  CFMutableArrayRef theArray = CFMutableArray;
  unsigned int v6 = *(char **)this;
  unsigned int v4 = (char *)this + 8;
  unsigned int v5 = v6;
  if (v6 == v4)
  {
    CFMutableArrayRef v10 = CFMutableArray;
  }

  else
  {
    do
    {
      CFDataRef v12 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
      CFDataRef v12 = Security::CodeSigning::CodeDirectory::cdhash(*((Security::CodeSigning::CodeDirectory **)v5 + 5), 1);
      CFArrayAppendValue(theArray, v12);
      Security::CFRef<__CFData const*>::~CFRef((const void **)&v12);
      uint64_t v7 = (char *)*((void *)v5 + 1);
      if (v7)
      {
        do
        {
          unsigned int v8 = v7;
          uint64_t v7 = *(char **)v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          unsigned int v8 = (char *)*((void *)v5 + 2);
          BOOL v9 = *(void *)v8 == (void)v5;
          unsigned int v5 = v8;
        }

        while (!v9);
      }

      unsigned int v5 = v8;
    }

    while (v8 != v4);
    CFMutableArrayRef v10 = theArray;
  }

  CFMutableArrayRef theArray = 0LL;
  Security::CFRef<__CFArray *>::~CFRef((const void **)&theArray);
  return v10;
}

void sub_18062A15C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

__CFDictionary *Security::CodeSigning::CodeDirectorySet::hashDict( Security::CodeSigning::CodeDirectorySet *this)
{
  CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary(this);
  uid_t v16 = CFMutableDictionary;
  unsigned int v5 = *(char **)this;
  uint64_t v3 = (char *)this + 8;
  unsigned int v4 = v5;
  if (v5 == v3)
  {
    CFDataRef v12 = CFMutableDictionary;
  }

  else
  {
    do
    {
      unsigned int v6 = *((_DWORD *)v4 + 8) - 1;
      if (v6 >= 4) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA48LL);
      }
      int v7 = dword_18065A2C0[v6];
      CFNumberRef v15 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
      LODWORD(valuePtr) = v7;
      CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      CFDataRef valuePtr = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
      CFNumberRef v15 = v8;
      CFDataRef valuePtr = Security::CodeSigning::CodeDirectory::cdhash(*((Security::CodeSigning::CodeDirectory **)v4 + 5), 0);
      CFDictionarySetValue(v16, v15, valuePtr);
      Security::CFRef<__CFData const*>::~CFRef((const void **)&valuePtr);
      Security::CFRef<__CFNumber const*>::~CFRef((const void **)&v15);
      BOOL v9 = (char *)*((void *)v4 + 1);
      if (v9)
      {
        do
        {
          CFMutableArrayRef v10 = v9;
          BOOL v9 = *(char **)v9;
        }

        while (v9);
      }

      else
      {
        do
        {
          CFMutableArrayRef v10 = (char *)*((void *)v4 + 2);
          BOOL v11 = *(void *)v10 == (void)v4;
          unsigned int v4 = v10;
        }

        while (!v11);
      }

      unsigned int v4 = v10;
    }

    while (v10 != v3);
    CFDataRef v12 = v16;
  }

  uid_t v16 = 0LL;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v16);
  return v12;
}

void sub_18062A28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void Security::CodeSigning::SecCodeSigner::~SecCodeSigner(Security::CodeSigning::SecCodeSigner *this)
{
  *(void *)this = off_189677EC8;
  uint64_t v2 = *((void *)this + 36);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 39);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)this + 34);
  Security::CFRef<__SecIdentity *>::~CFRef((const void **)this + 33);
  Security::CFRef<__CFNumber const*>::~CFRef((const void **)this + 32);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 20));
  Security::CFRef<void const*>::~CFRef((const void **)this + 15);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)this + 14);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 13);
  uint64_t v3 = (void **)((char *)this + 80);
  std::vector<Security::CFRef<__CFData const*>>::__destroy_vector::operator()[abi:ne180100](&v3);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 8);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 7);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)this + 6);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 5);
  Security::CFRef<void const*>::~CFRef((const void **)this + 4);
  Security::CFRef<__SecIdentity *>::~CFRef((const void **)this + 3);
}

{
  char *v1;
  Security::CodeSigning::SecCodeSigner::~SecCodeSigner(this);
  Security::SecCFObject::operator delete(v1);
}

{
  uint64_t v2;
  void **v3;
  *(void *)this = off_189677EC8;
  uint64_t v2 = *((void *)this + 36);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 39);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)this + 34);
  Security::CFRef<__SecIdentity *>::~CFRef((const void **)this + 33);
  Security::CFRef<__CFNumber const*>::~CFRef((const void **)this + 32);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 20));
  Security::CFRef<void const*>::~CFRef((const void **)this + 15);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)this + 14);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 13);
  uint64_t v3 = (void **)((char *)this + 80);
  std::vector<Security::CFRef<__CFData const*>>::__destroy_vector::operator()[abi:ne180100](&v3);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 8);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 7);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)this + 6);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 5);
  Security::CFRef<void const*>::~CFRef((const void **)this + 4);
  Security::CFRef<__SecIdentity *>::~CFRef((const void **)this + 3);
}

BOOL Security::CodeSigning::SecCodeSigner::valid(Security::CodeSigning::SecCodeSigner *this)
{
  return (*((_WORD *)this + 8) & 0x401) != 0 || *((void *)this + 3) != 0LL;
}

const void **Security::CFRef<__SecIdentity *>::~CFRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **Security::CFRef<void const*>::~CFRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::vector<Security::CFRef<__CFData const*>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uid_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    unsigned int v4 = (const void **)v1[1];
    unsigned int v5 = v2;
    if (v4 != v2)
    {
      do
        unsigned int v4 = Security::CFRef<__CFData const*>::~CFRef(v4 - 1);
      while (v4 != v2);
      unsigned int v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t Security::CodeSigning::SecCodeSigner::parameters( Security::CodeSigning::SecCodeSigner *this, const __CFDictionary *a2)
{
  uint64_t v3 = 4294900225LL;
  Security::CFDictionary::CFDictionary((Security::CFDictionary *)&theDict, a2, (Security::MacOSError *)0xFFFEFA0ELL);
  Value = CFDictionaryGetValue(theDict, @"edit-cpu-type");
  Security::CFRef<__CFNumber const*>::check<void const*>(Value, (Security::MacOSError *)v132);
  unsigned int v5 = CFDictionaryGetValue(theDict, @"edit-cpu-subtype");
  Security::CFRef<__CFNumber const*>::check<void const*>(v5, (Security::MacOSError *)v132);
  if (Value && v5)
  {
    int v6 = Security::cfNumber<unsigned int>((const __CFNumber *)Value);
    int v7 = Security::cfNumber<unsigned int>((const __CFNumber *)v5);
    *((_DWORD *)this + 76) = v6;
    *((_DWORD *)this + 77) = v7;
  }

  CFNumberRef v8 = CFDictionaryGetValue(theDict, @"edit-cms");
  Security::CFRef<__CFData const*>::check<void const*>(v8, (Security::MacOSError *)v132);
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 39, v8);
  BOOL v9 = CFDictionaryGetValue(theDict, @"dryrun");
  CFTypeRef v10 = Security::CFRef<__CFBoolean const*>::check<void const*>(v9, (Security::MacOSError *)v132);
  CFTypeRef v11 = (CFTypeRef)*MEMORY[0x189604DE8];
  if (v10) {
    BOOL v12 = v10 == v11;
  }
  else {
    BOOL v12 = 0;
  }
  char v13 = v12;
  *((_BYTE *)this + 250) = v13;
  size_t v14 = CFDictionaryGetValue(theDict, @"sdkroot");
  Security::CFRef<__CFURL const*>::check<void const*>(v14, (Security::MacOSError *)v132);
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 14, v14);
  CFNumberRef v15 = CFDictionaryGetValue(theDict, @"preserve-afsc");
  CFTypeRef v16 = Security::CFRef<__CFBoolean const*>::check<void const*>(v15, (Security::MacOSError *)v132);
  if (v16) {
    BOOL v17 = v16 == v11;
  }
  else {
    BOOL v17 = 0;
  }
  char v18 = v17;
  *((_BYTE *)this + 300) = v18;
  if ((*((_BYTE *)this + 17) & 4) != 0) {
    goto LABEL_165;
  }
  unsigned int v19 = CFDictionaryGetValue(theDict, @"signer");
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 3, v19);
  if (*((void *)this + 3))
  {
    CFTypeID v20 = CFGetTypeID(*((CFTypeRef *)this + 3));
    if (v20 != SecIdentityGetTypeID() && !CFEqual(*((CFTypeRef *)this + 3), (CFTypeRef)*MEMORY[0x189605018])) {
LABEL_167:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)v3);
  }

  BOOL v21 = CFDictionaryGetValue(theDict, @"flags");
  unsigned int v22 = (const __CFNumber *)Security::CFRef<__CFNumber const*>::check<void const*>(v21, (Security::MacOSError *)v132);
  if (v22)
  {
    *((_BYTE *)this + 144) = 1;
    *((_DWORD *)this + 34) = Security::cfNumber<unsigned int>(v22);
  }

  else
  {
    *((_BYTE *)this + 144) = 0;
  }

  cf[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v23 = CFDictionaryGetValue(theDict, @"digest-algorithm");
  Security::CFCopyRef<void const*>::CFCopyRef(cf, v23);
  CFArrayRef v24 = (CFArrayRef)cf[0];
  if (cf[0])
  {
    unint64_t v134 = 0xAAAAAAAAAAAAAAAALL;
    values.__r_.__value_.__l.__data_ = (std::string::pointer)cf[0];
    CFTypeID v25 = CFGetTypeID(cf[0]);
    if (v25 == CFArrayGetTypeID())
    {
      CFRetain(v24);
      unint64_t v134 = (unint64_t)v24;
    }

    else
    {
      CFArrayRef v24 = CFArrayCreate(0LL, (const void **)&values.__r_.__value_.__l.__data_, 1LL, MEMORY[0x189605228]);
      unint64_t v134 = (unint64_t)v24;
      if (!v24)
      {
LABEL_38:
        Security::CFRef<__CFArray const*>::~CFRef((const void **)&v134);
        goto LABEL_39;
      }
    }

    unsigned int Count = CFArrayGetCount(v24);
    int v27 = (unsigned int *)operator new[](4LL * Count);
    if (Count)
    {
      BOOL v30 = &v27[Count];
      int v31 = (uint64_t *)*((void *)this + 19);
      unsigned int v32 = v27;
      do
      {
        uint64_t v33 = std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>( (uint64_t **)this + 19,  v31,  *v32,  *v32);
        int v34 = (uint64_t *)v33[1];
        if (v34)
        {
          do
          {
            int v31 = v34;
            int v34 = (uint64_t *)*v34;
          }

          while (v34);
        }

        else
        {
          do
          {
            int v31 = (uint64_t *)v33[2];
            BOOL v12 = *v31 == (void)v33;
            uint64_t v33 = v31;
          }

          while (!v12);
        }

        ++v32;
      }

      while (v32 != v30);
    }

    operator delete[](v27);
    goto LABEL_38;
  }

LABEL_127:
    if (!*((_BYTE *)this + 280))
    {
      Security::CFRef<__SecCertificate *>::~CFRef((const void **)&values.__r_.__value_.__l.__data_);
      goto LABEL_129;
    }

LABEL_174:
    v130 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(cf[0]) = 0;
      _os_log_impl( &dword_1804F4000,  v130,  OS_LOG_TYPE_DEFAULT,  "Platform does not support signing secure timestamps",  (uint8_t *)cf,  2u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
  }

LABEL_129:
  v108 = CFDictionaryGetValue(theDict, @"timestamp-authentication");
  v109 = v108;
  if (v108)
  {
    uint64_t v3 = v132;
    CFTypeID v110 = CFGetTypeID(v108);
    if (v110 != SecIdentityGetTypeID()) {
      goto LABEL_167;
    }
  }

  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 33, v109);
  v111 = CFDictionaryGetValue(theDict, @"timestamp-url");
  Security::CFRef<__CFURL const*>::check<void const*>(v111, (Security::MacOSError *)v132);
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 34, v111);
  v112 = CFDictionaryGetValue(theDict, @"timestamp-omit-certificates");
  CFTypeRef v113 = Security::CFRef<__CFBoolean const*>::check<void const*>(v112, (Security::MacOSError *)v132);
  if (v113) {
    BOOL v114 = v113 == v11;
  }
  else {
    BOOL v114 = 0;
  }
  char v115 = v114;
  *((_BYTE *)this + 281) = v115;
  v116 = (const __CFString *)CFDictionaryGetValue(theDict, @"runtime-version");
  Security::CFRef<__CFString const*>::check<void const*>(v116, (Security::MacOSError *)v132);
  if (v116)
  {
    memset(&values, 170, sizeof(values));
    Security::cfString(&values, v116);
    std::string::size_type size = values.__r_.__value_.__s.__size_;
    if ((values.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = values.__r_.__value_.__l.__size_;
    }
    if (!size) {
      goto LABEL_154;
    }
    int v118 = 0;
    v119 = (values.__r_.__value_.__s.__size_ & 0x80u) == 0
         ? &values
         : (std::string *)values.__r_.__value_.__r.__words[0];
    v120 = (std::string *)((char *)v119 + size);
    uint64_t v121 = 16LL;
    while (v119 < v120)
    {
      cf[0] = 0LL;
      *__error() = 0;
      uint64_t v122 = strtol((const char *)v119, (char **)cf, 10);
      v123 = cf[0];
      if (v119 != cf[0])
      {
        uint64_t v124 = v122;
        if (!*__error() && (v124 & 0x8000000000000000LL) == 0 && v124 <= 255)
        {
          v118 |= v124 << v121;
          if (!*v123) {
            break;
          }
          if (*v123 == 46)
          {
            if (v121)
            {
              v121 -= 8LL;
              v119 = (std::string *)(v123 + 1);
              if (v123 + 1 != (_BYTE *)v120) {
                continue;
              }
            }
          }
        }
      }

      goto LABEL_154;
    }

    if (!v118) {
LABEL_154:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA4FLL);
    *((_DWORD *)this + 74) = v118;
  }

  v125 = CFDictionaryGetValue(theDict, @"omit-adhoc-flag");
  CFTypeRef v126 = Security::CFRef<__CFBoolean const*>::check<void const*>(v125, (Security::MacOSError *)v132);
  if (v126) {
    BOOL v127 = v126 == v11;
  }
  else {
    BOOL v127 = 0;
  }
  char v128 = v127;
  *((_BYTE *)this + 301) = v128;
LABEL_165:
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theDict);
  uint64_t result = (*(uint64_t (**)(Security::CodeSigning::SecCodeSigner *))(*(void *)this + 80LL))(this);
  if ((result & 1) == 0) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01LL);
  }
  return result;
}

void sub_18062B1AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, int a18, __int16 a19, char a20, char a21)
{
}

Security::CFDictionary *Security::CFDictionary::CFDictionary( Security::CFDictionary *this, const __CFDictionary *a2, Security::MacOSError *a3)
{
  *((_DWORD *)Security::CFCopyRef<__CFDictionary const*>::CFCopyRef(this, a2) + 2) = (_DWORD)a3;
  if (!a2) {
    Security::MacOSError::throwMe(a3);
  }
  return this;
}

void sub_18062B2B8(_Unwind_Exception *a1)
{
}

CFTypeRef Security::CFRef<__CFNumber const*>::check<void const*>(CFTypeRef cf, Security::MacOSError *a2)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFNumberGetTypeID()) {
      Security::MacOSError::throwMe(a2);
    }
  }

  return cf;
}

CFTypeRef Security::CFRef<__CFData const*>::check<void const*>(CFTypeRef cf, Security::MacOSError *a2)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFDataGetTypeID()) {
      Security::MacOSError::throwMe(a2);
    }
  }

  return cf;
}

CFTypeRef Security::CFRef<__CFBoolean const*>::check<void const*>(CFTypeRef cf, Security::MacOSError *a2)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFBooleanGetTypeID()) {
      Security::MacOSError::throwMe(a2);
    }
  }

  return cf;
}

CFTypeRef Security::CFRef<__CFURL const*>::check<void const*>(CFTypeRef cf, Security::MacOSError *a2)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFURLGetTypeID()) {
      Security::MacOSError::throwMe(a2);
    }
  }

  return cf;
}

void *Security::CFCopyRef<void const*>::CFCopyRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void sub_18062B43C(_Unwind_Exception *a1)
{
}

unint64_t Security::cfNumber<unsigned long>(const __CFNumber *a1)
{
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  Value = (Security::CFError *)CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr);
  if (!(_DWORD)Value) {
    Security::CFError::throwMe(Value);
  }
  return valuePtr;
}

CFTypeRef Security::CFRef<__CFString const*>::check<void const*>(CFTypeRef cf, Security::MacOSError *a2)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFStringGetTypeID()) {
      Security::MacOSError::throwMe(a2);
    }
  }

  return cf;
}

void *Security::CFCopyRef<__CFDictionary const*>::CFCopyRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void sub_18062B508(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::SecCodeSigner::sign( Security::CodeSigning::SecCodeSigner *this, Security::CodeSigning::SecStaticCode *a2, int a3)
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  int v6 = Security::CodeSigning::SecStaticCode::codeDirectory(a2, 0);
  if ((a3 & 2) == 0
    || !v6
    || (int v7 = Security::CodeSigning::SecStaticCode::codeDirectory(a2, 0)) != 0LL && (v7[13] & 2) != 0)
  {
    *((_DWORD *)a2 + 52) = a3;
    memcpy(__dst, &unk_180659EA0, sizeof(__dst));
    Security::CodeSigning::SecCodeSigner::Signer::Signer( (Security::CodeSigning::SecCodeSigner::Signer *)__dst,  this,  a2);
    int v8 = *((_DWORD *)this + 4) | a3;
    if ((v8 & 1) != 0)
    {
      CFTypeRef v10 = (os_log_s *)secLogObjForScope("signer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = this;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = a2;
        _os_log_debug_impl(&dword_1804F4000, v10, OS_LOG_TYPE_DEBUG, "%p will remove signature from %p", buf, 0x16u);
      }

      if (*(void *)(__dst[1] + 32LL))
      {
        uint64_t v68 = 4294900259LL;
        goto LABEL_93;
      }

      Security::RefPointer<Security::CodeSigning::DiskRep>::setPointer(&__dst[3], *(void *)(__dst[2] + 32LL));
      if (*(_BYTE *)(__dst[1] + 300LL))
      {
        (*(void (**)(void))(*(void *)__dst[3] + 256LL))(__dst[3]);
        uint64_t v68 = 4294967292LL;
        goto LABEL_93;
      }

      if (!*(_BYTE *)(__dst[1] + 249LL))
      {
        int v28 = (Security::Universal *)(*(uint64_t (**)(void))(*(void *)__dst[3] + 80LL))(__dst[3]);
        if (v28)
        {
          unint64_t v86 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v84 = v29;
          __int128 v85 = v29;
          __int128 v82 = v29;
          __int128 v83 = v29;
          __int128 v80 = v29;
          __int128 v81 = v29;
          __int128 v78 = v29;
          __int128 v79 = v29;
          __int128 v76 = v29;
          __int128 v77 = v29;
          *(_OWORD *)&buf[16] = v29;
          __int128 v75 = v29;
          *(_OWORD *)buf = v29;
          BOOL v30 = (unsigned int *)(*(uint64_t (**)(void))(*(void *)__dst[3] + 256LL))(__dst[3]);
          int v31 = (void *)(*(uint64_t (**)(void *))(__dst[0] + 24LL))(__dst);
          std::set<unsigned int>::set[abi:ne180100]((uint64_t)&v71, v31);
          (*(void (**)(void **__return_ptr))(*(void *)__dst[3] + 40LL))(__p);
          Security::CodeSigning::MachOEditor::MachOEditor((uint64_t)buf, v30, v28, &v71, (__int128 *)__p);
          if (v70 < 0) {
            operator delete(__p[0]);
          }
          std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v72);
          Security::CodeSigning::MachOEditor::allocate((Security::CodeSigning::MachOEditor *)buf);
          Security::CodeSigning::MachOEditor::commit((Security::CodeSigning::MachOEditor *)buf);
          Security::CodeSigning::MachOEditor::~MachOEditor((Security::CodeSigning::MachOEditor *)buf);
          goto LABEL_21;
        }
      }

      *(void *)&__int128 v77 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v75 = v11;
      __int128 v76 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      uint64_t v12 = (*(uint64_t (**)(void))(*(void *)__dst[3] + 256LL))(__dst[3]);
      Security::Mutex::Mutex((pthread_mutex_t *)&buf[8]);
      if (v12)
      {
        char v13 = (unsigned int *)(v12 + 8);
        do
          unsigned int v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }

      *(void *)buf = v12;
      (*(void (**)(uint64_t))(*(void *)v12 + 40LL))(v12);
      (*(void (**)(void))(**(void **)buf + 48LL))(*(void *)buf);
      goto LABEL_20;
    }

    if ((v8 & 0x400) == 0)
    {
      if ((*(unsigned int (**)(Security::CodeSigning::SecCodeSigner *))(*(void *)this + 80LL))(this))
      {
        BOOL v9 = (os_log_s *)secLogObjForScope("signer");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          *(void *)&buf[4] = this;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(void *)&buf[14] = a2;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = a3;
          _os_log_debug_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEBUG, "%p will sign %p (flags 0x%x)", buf, 0x1Cu);
        }

        Security::CodeSigning::SecCodeSigner::Signer::sign( (Security::CodeSigning::SecCodeSigner::Signer *)__dst,  *((_DWORD *)this + 4) & 0x1000000 | a3);
        goto LABEL_21;
      }

      uint64_t v68 = 4294900225LL;
LABEL_93:
      Security::MacOSError::throwMe((Security::MacOSError *)v68);
    }

    CFNumberRef v15 = (os_log_s *)secLogObjForScope("signer");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = this;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_debug_impl(&dword_1804F4000, v15, OS_LOG_TYPE_DEBUG, "%p will edit signature of %p", buf, 0x16u);
    }

    uint64_t v16 = (*(uint64_t (**)(void))(**(void **)(__dst[2] + 32LL) + 16LL))(*(void *)(__dst[2] + 32LL));
    Security::RefPointer<Security::CodeSigning::DiskRep>::setPointer(&__dst[3], v16);
    if (*(_BYTE *)(__dst[1] + 249LL))
    {
      Security::CodeSigning::SecCodeSigner::Signer::prepareForEdit((Security::CodeSigning::SecCodeSigner::Signer *)__dst);
    }

    else
    {
      unsigned int v32 = (Security::Universal *)(*(uint64_t (**)(void))(*(void *)__dst[3] + 80LL))(__dst[3]);
      Security::CodeSigning::SecCodeSigner::Signer::prepareForEdit((Security::CodeSigning::SecCodeSigner::Signer *)__dst);
      if (v32)
      {
        *(void *)&__int128 v77 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v33 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v75 = v33;
        __int128 v76 = v33;
        *(_OWORD *)buf = v33;
        *(_OWORD *)&buf[16] = v33;
        int v34 = (unsigned int *)(*(uint64_t (**)(void))(*(void *)__dst[3] + 256LL))(__dst[3]);
        Security::Mutex::Mutex((pthread_mutex_t *)&buf[8]);
        if (v34)
        {
          uint64_t v35 = v34 + 2;
          do
            unsigned int v36 = __ldxr(v35);
          while (__stxr(v36 + 1, v35));
        }

        *(void *)buf = v34;
        if (*(_BYTE *)(__dst[1] + 300LL)) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
        }
        unint64_t v37 = operator new(0xD8uLL);
        uint64_t v38 = (void *)(*(uint64_t (**)(void *))(__dst[0] + 24LL))(__dst);
        std::set<unsigned int>::set[abi:ne180100]((uint64_t)&v71, v38);
        (*(void (**)(void **__return_ptr))(*(void *)__dst[3] + 40LL))(__p);
        Security::CodeSigning::MachOEditor::MachOEditor((uint64_t)v37, v34, v32, &v71, (__int128 *)__p);
        if (v70 < 0) {
          operator delete(__p[0]);
        }
        std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v72);
        if (__dst[13] && (v37[20] & 2) == 0) {
          (*(void (**)(_BYTE *, uint64_t))(*(void *)v37 + 16LL))(v37, 3LL);
        }
        int v39 = (void *)*((void *)v37 + 3);
        size_t v40 = v37 + 32;
        if (v39 != (void *)(v37 + 32))
        {
          do
          {
            v41 = (uint64_t *)v39[5];
            CFTypeID v42 = Security::Universal::architecture( v32,  (const Security::Architecture *)*((unsigned int *)v39 + 8),  *((_DWORD *)v39 + 9));
            uint64_t v43 = v41[7];
            v41[7] = (uint64_t)v42;
            if (v43) {
              (*(void (**)(uint64_t))(*(void *)v43 + 8LL))(v43);
            }
            if (__dst[13] && (v37[20] & 2) != 0) {
              (*(void (**)(uint64_t *, uint64_t))(*v41 + 16))(v41, 3LL);
            }
            uint64_t v44 = (void *)*((void *)std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)&__dst[44],  v41[6],  v41 + 6)
                            + 5);
            int v47 = (void *)*v44;
            v45 = v44 + 1;
            unint64_t v46 = v47;
            if (v47 != v45)
            {
              do
              {
                (*(void (**)(uint64_t *, void, void))(*v41 + 16))(v41, *((unsigned int *)v46 + 8), v46[5]);
                BOOL v48 = (void *)v46[1];
                if (v48)
                {
                  do
                  {
                    unsigned int v49 = v48;
                    BOOL v48 = (void *)*v48;
                  }

                  while (v48);
                }

                else
                {
                  do
                  {
                    unsigned int v49 = (void *)v46[2];
                    BOOL v27 = *v49 == (void)v46;
                    unint64_t v46 = v49;
                  }

                  while (!v27);
                }

                unint64_t v46 = v49;
              }

              while (v49 != v45);
            }

            uint64_t v50 = (Security::MachOBase *)v41[7];
            CodeSignature = Security::MachOBase::findCodeSignature(v50);
            if (CodeSignature)
            {
              LODWORD(v52) = CodeSignature[1].cmdsize;
              unsigned int v53 = bswap32(v52);
              if (*((_BYTE *)v50 + 33)) {
                uint64_t v52 = v53;
              }
              else {
                uint64_t v52 = v52;
              }
            }

            else
            {
              uint64_t v52 = 0LL;
            }

            v41[15] = v52;
            __int128 v54 = (void *)v39[1];
            if (v54)
            {
              do
              {
                CFTypeID v55 = v54;
                __int128 v54 = (void *)*v54;
              }

              while (v54);
            }

            else
            {
              do
              {
                CFTypeID v55 = (void *)v39[2];
                BOOL v27 = *v55 == (void)v39;
                int v39 = v55;
              }

              while (!v27);
            }

            int v39 = v55;
          }

          while (v55 != v40);
        }

        (*(void (**)(_BYTE *))(*(void *)v37 + 56LL))(v37);
        CFTypeID v56 = (void *)*((void *)v37 + 3);
        if (v56 != v40)
        {
          do
          {
            uint64_t v57 = v56[5];
            (*(void (**)(_BYTE *, uint64_t))(*(void *)v37 + 64LL))(v37, v57);
            if (!*(_BYTE *)(__dst[1] + 250LL))
            {
              CFTypeRef v65 = Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::make( v57 + 24,  v58,  v59,  v60,  v61,  v62,  v63,  v64);
              (*(void (**)(_BYTE *, uint64_t, _DWORD *))(*(void *)v37 + 72LL))(v37, v57, v65);
            }

            CFTypeID v66 = (void *)v56[1];
            if (v66)
            {
              do
              {
                unint64_t v67 = v66;
                CFTypeID v66 = (void *)*v66;
              }

              while (v66);
            }

            else
            {
              do
              {
                unint64_t v67 = (void *)v56[2];
                BOOL v27 = *v67 == (void)v56;
                CFTypeID v56 = v67;
              }

              while (!v27);
            }

            CFTypeID v56 = v67;
          }

          while (v67 != v40);
        }

        if (!*(_BYTE *)(__dst[1] + 250LL)) {
          (*(void (**)(_BYTE *))(*(void *)v37 + 80LL))(v37);
        }
        (*(void (**)(_BYTE *))(*(void *)v37 + 8LL))(v37);
        goto LABEL_20;
      }
    }

    if (*(_BYTE *)(__dst[1] + 250LL)) {
      goto LABEL_21;
    }
    *(void *)&__int128 v77 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v75 = v17;
    __int128 v76 = v17;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    uint64_t v18 = (*(uint64_t (**)(void))(*(void *)__dst[3] + 256LL))(__dst[3]);
    Security::Mutex::Mutex((pthread_mutex_t *)&buf[8]);
    if (v18)
    {
      unsigned int v19 = (unsigned int *)(v18 + 8);
      do
        unsigned int v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }

    *(void *)buf = v18;
    if (*(_BYTE *)(__dst[1] + 300LL)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
    }
    BOOL v21 = (void *)*((void *)std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)&__dst[44],  __dst[43],  &__dst[43])
                    + 5);
    CFArrayRef v24 = (void *)*v21;
    unsigned int v22 = v21 + 1;
    uint64_t v23 = v24;
    if (v24 != v22)
    {
      do
      {
        (*(void (**)(void, void, void))(**(void **)buf + 16LL))( *(void *)buf,  *((unsigned int *)v23 + 8),  v23[5]);
        CFTypeID v25 = (void *)v23[1];
        if (v25)
        {
          do
          {
            int v26 = v25;
            CFTypeID v25 = (void *)*v25;
          }

          while (v25);
        }

        else
        {
          do
          {
            int v26 = (void *)v23[2];
            BOOL v27 = *v26 == (void)v23;
            uint64_t v23 = v26;
          }

          while (!v27);
        }

        uint64_t v23 = v26;
      }

      while (v26 != v22);
    }

    (*(void (**)(void))(**(void **)buf + 48LL))(*(void *)buf);
LABEL_20:
    Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer(buf);
LABEL_21:
    Security::CodeSigning::SecStaticCode::resetValidity(a2);
    Security::CodeSigning::SecCodeSigner::Signer::~Signer((Security::CodeSigning::SecCodeSigner::Signer *)__dst);
  }

void sub_18062BD70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(a17);
  operator delete(v72);
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer(&a72);
  Security::CodeSigning::SecCodeSigner::Signer::~Signer((Security::CodeSigning::SecCodeSigner::Signer *)&a19);
  _Unwind_Resume(a1);
}

Security::CodeSigning::SecCodeSigner::Signer *Security::CodeSigning::SecCodeSigner::Signer::Signer( Security::CodeSigning::SecCodeSigner::Signer *this, Security::CodeSigning::SecCodeSigner *a2, Security::CodeSigning::SecStaticCode *a3)
{
  *(void *)this = &off_189678AE0;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  *((void *)this + 3) = 0LL;
  Security::Mutex::Mutex((pthread_mutex_t *)((char *)this + 32));
  *((void *)this + 15) = 0LL;
  *((void *)this + 12) = 0LL;
  *((void *)this + 16) = 0LL;
  *((void *)this + 13) = 0LL;
  *((void *)this + 14) = (char *)this + 120;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((void *)this + 31) = 0LL;
  *((void *)this + 32) = 0LL;
  *((void *)this + 30) = 0LL;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((void *)this + 29) = (char *)this + 240;
  *((void *)this + 34) = 0LL;
  *((void *)this + 35) = 0LL;
  *((void *)this + 33) = (char *)this + 272;
  *((void *)this + 37) = 0LL;
  *((_BYTE *)this + 322) = 0;
  *((void *)this + 45) = 0LL;
  *((void *)this + 46) = 0LL;
  *((void *)this + 43) = 0LL;
  *((void *)this + 44) = (char *)this + 360;
  *((void *)this + 41) = 0LL;
  *((void *)this + 42) = 0LL;
  Security::Mutex::Mutex((pthread_mutex_t *)((char *)this + 376));
  *((_BYTE *)this + 321) = ((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16LL))(this) & 0x80) != 0;
  return this;
}

void sub_18062BF44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v18 = v14;
  Security::Mutex::~Mutex(v18);
  std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::destroy(*(const void *****)(v11 + 360));
  Security::CFRef<__CFArray const*>::~CFRef((const void **)(v16 + 216));
  std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>>>::destroy(*(void **)(v11 + 272));
  std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::destroy(*(void **)(v11 + 240));
  Security::CFRef<__CFData const*>::~CFRef(v15);
  a10 = v16 + 72;
  std::vector<Security::CFRef<__CFData const*>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  Security::CFRef<__CFData const*>::~CFRef(v13);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v11 + 120));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v11 + 104));
  Security::CFRef<__CFDictionary const*>::~CFRef(v12);
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer(v10);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::SecCodeSigner::Signer::~Signer( Security::CodeSigning::SecCodeSigner::Signer *this)
{
  *(void *)this = &off_189678AE0;
  free(*((void **)this + 37));
  Security::Mutex::~Mutex((pthread_mutex_t *)((char *)this + 376));
  std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::destroy(*((const void *****)this + 45));
  Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 42);
  std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>>>::destroy(*((void **)this + 34));
  std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::destroy(*((void **)this + 30));
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 27);
  uint64_t v2 = (void **)((char *)this + 192);
  std::vector<Security::CFRef<__CFData const*>>::__destroy_vector::operator()[abi:ne180100](&v2);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 23);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 15));
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 13);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 12);
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer((void *)this + 3);
}

void std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::destroy( const void ****a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::destroy(*a1);
    std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::destroy(a1[1]);
    std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>::reset[abi:ne180100](a1 + 5, 0LL);
    operator delete(a1);
  }

void std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>>>::destroy( void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,unsigned int>>>>::destroy(a1[1]);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)a1[6]);
    operator delete(a1);
  }

void std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::destroy( void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::destroy(*a1);
    std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::destroy(a1[1]);
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy((const void **)a1[6]);
    operator delete(a1);
  }

void std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>::reset[abi:ne180100]( const void ****a1, const void ***a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(v2[1]);
    operator delete(v2);
  }

void Security::CodeSigning::SecCodeSigner::returnDetachedSignature( CFTypeRef *this, Security::BlobCore *a2, Security::CodeSigning::SecCodeSigner::Signer *a3)
{
  CFTypeID v5 = CFGetTypeID(this[4]);
  if (v5 == CFURLGetTypeID())
  {
    Security::cfString((Security *)__p, (const __CFURL *)this[4]);
    unint64_t v14 = 0xAAAAAAAAFFFFFFFFLL;
    if (v13 >= 0) {
      int v6 = __p;
    }
    else {
      int v6 = (void **)__p[0];
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v14, (const char *)v6, 1537, 438);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    Security::UnixPlusPlus::FileDesc::writeAll((ssize_t)&v14, (char *)a2, bswap32(*((_DWORD *)a2 + 1)));
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v14);
  }

  else
  {
    CFTypeID v7 = CFGetTypeID(this[4]);
    CFTypeID TypeID = CFDataGetTypeID();
    BOOL v9 = (__CFData *)this[4];
    if (v7 == TypeID)
    {
      CFDataAppendBytes(v9, (const UInt8 *)a2, bswap32(*((_DWORD *)a2 + 1)));
    }

    else
    {
      CFTypeID v10 = CFGetTypeID(v9);
      if (v10 == CFNullGetTypeID())
      {
        uint64_t v11 = (os_log_s *)secLogObjForScope("SecError");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "Platform does not support the detached signature database",  (uint8_t *)__p,  2u);
        }

        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
      }
    }
  }

void sub_18062C314( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void Security::CodeSigning::SecStaticCode::~SecStaticCode(Security::CodeSigning::SecStaticCode *this)
{
  *(void *)this = off_189678030;
  CEReleaseManagedContext();
  free(*((void **)this + 64));
  uint64_t v2 = *((void *)this + 25);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  uint64_t v3 = *((void *)this + 73);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  CFTypeID v4 = (Security::CodeSigning::ResourceBuilder *)*((void *)this + 2);
  if (v4)
  {
    Security::CodeSigning::ResourceBuilder::~ResourceBuilder(v4);
    operator delete(v5);
  }

  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 80);
  Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 78);
  Security::CFRef<__SecTrust *>::~CFRef((const void **)this + 77);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)this + 71);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 69);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 67);
  Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 66);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 65);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 63);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 62);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 61);
  for (uint64_t i = 0LL; i != -96; i -= 8LL)
    Security::CFRef<__CFData const*>::~CFRef((const void **)((char *)this + i + 480));
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 46);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 44));
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 42);
  Security::Dispatch::Queue::~Queue((Security::CodeSigning::SecStaticCode *)((char *)this + 224));
  Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 21);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 19));
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 17);
  Security::CFRef<__CFData const*>::~CFRef((const void **)this + 16);
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(*((const void ***)this + 14));
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer((void *)this + 4);
}

{
  char *v1;
  Security::CodeSigning::SecStaticCode::~SecStaticCode(this);
  Security::SecCFObject::operator delete(v1);
}

void sub_18062C484(void *a1)
{
  for (uint64_t i = 0LL; i != -96; i -= 8LL)
    Security::CFRef<__CFData const*>::~CFRef((const void **)(v1 + 480 + i));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v1 + 368));
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v1 + 352));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v1 + 336));
  Security::Dispatch::Queue::~Queue((Security::Dispatch::Queue *)(v1 + 224));
  Security::CFRef<__CFArray const*>::~CFRef((const void **)(v1 + 168));
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v1 + 152));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v1 + 136));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v1 + 128));
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(*(const void ***)(v1 + 112));
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer((void *)(v1 + 32));
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18062C470LL);
}

BOOL Security::CodeSigning::SecStaticCode::equal(CFDataRef *this, CFDataRef *a2)
{
  CFDataRef v4 = Security::CodeSigning::SecStaticCode::cdHash(this);
  CFDataRef v5 = Security::CodeSigning::SecStaticCode::cdHash(a2);
  if ((unint64_t)v4 | (unint64_t)v5)
  {
    BOOL v6 = 0LL;
    if (v4 && v5) {
      return CFEqual(v4, v5) != 0;
    }
  }

  else
  {
    BOOL v9 = (const void *)(*(uint64_t (**)(CFDataRef))(*(void *)this[4] + 48LL))(this[4]);
    int v8 = (const void *)(*(uint64_t (**)(CFDataRef))(*(void *)a2[4] + 48LL))(a2[4]);
    BOOL v6 = CFEqual(v9, v8) != 0;
    Security::CFRef<__CFURL const*>::~CFRef(&v8);
    Security::CFRef<__CFURL const*>::~CFRef(&v9);
  }

  return v6;
}

void sub_18062C634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

CFHashCode Security::CodeSigning::SecStaticCode::hash(CFDataRef *this)
{
  CFDataRef v2 = Security::CodeSigning::SecStaticCode::cdHash(this);
  if (v2) {
    return CFHash(v2);
  }
  CFDataRef v5 = (const void *)(*(uint64_t (**)(CFDataRef))(*(void *)this[4] + 48LL))(this[4]);
  CFHashCode v4 = CFHash(v5);
  Security::CFRef<__CFURL const*>::~CFRef(&v5);
  return v4;
}

void sub_18062C6BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

CFTypeRef Security::CodeSigning::SecStaticCode::component( Security::CodeSigning::SecStaticCode *this, unsigned int a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  CFDataRef v2 = (char *)this + 8 * a2;
  CFTypeRef v3 = (CFTypeRef)*((void *)v2 + 49);
  CFHashCode v4 = (CFTypeRef *)MEMORY[0x189605018];
  if (v3) {
    goto LABEL_23;
  }
  CFTypeID v7 = (CFTypeRef *)(v2 + 392);
  CFDataRef theData = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
  CFDataRef theData = (CFDataRef)(*(uint64_t (**)(void))(**((void **)this + 4) + 24LL))(*((void *)this + 4));
  if (theData)
  {
    if (!*((_BYTE *)this + 176)) {
      goto LABEL_6;
    }
    int v8 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    if (!Security::CodeSigning::CodeDirectory::slotIsPresent(v8, -a2))
    {
      Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
      return 0LL;
    }

    BOOL v9 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(theData);
    if (Security::CodeSigning::CodeDirectory::validateSlot(v9, BytePtr, Length, -a2))
    {
LABEL_6:
      Security::CFRef<__CFData const*>::operator=(v7, (CFTypeRef *)&theData);
      goto LABEL_22;
    }

void sub_18062C990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t Security::CodeSigning::SecStaticCode::infoDictionary(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t result = *((void *)this + 61);
  if (!result)
  {
    Dictionary = Security::CodeSigning::SecStaticCode::getDictionary((UInt8 *)this, 1LL, 1);
    CFHashCode v4 = (const void *)*((void *)this + 61);
    if (v4) {
      CFRelease(v4);
    }
    *((void *)this + 61) = Dictionary;
    CFDataRef v5 = (os_log_s *)secLogObjForScope("staticCode");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    uint64_t result = *((void *)this + 61);
    if (v6)
    {
      int v7 = 134218240;
      int v8 = this;
      __int16 v9 = 2048;
      uint64_t v10 = result;
      _os_log_debug_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEBUG, "%p loaded InfoDict %p", (uint8_t *)&v7, 0x16u);
      return *((void *)this + 61);
    }
  }

  return result;
}

BOOL Security::CodeSigning::SecStaticCode::validateComponent( Security::CodeSigning::SecStaticCode *this, unsigned int a2, Security::MacOSError *a3)
{
  CFDataRef v5 = (const __CFData *)*((void *)this + a2 + 49);
  BOOL v6 = (const __CFData *)*MEMORY[0x189605018];
  int v7 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
  int v8 = v7;
  if (v5 != v6)
  {
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex Length = CFDataGetLength(v5);
    BOOL result = Security::CodeSigning::CodeDirectory::validateSlot(v8, BytePtr, Length, -a2);
    if (result) {
      return result;
    }
LABEL_5:
    Security::MacOSError::throwMe(a3);
  }

  BOOL result = Security::CodeSigning::CodeDirectory::slotIsPresent(v7, -a2);
  if (result) {
    goto LABEL_5;
  }
  return result;
}

const UInt8 *Security::CodeSigning::SecStaticCode::codeDirectory( Security::CodeSigning::SecStaticCode *this, int a2)
{
  CFTypeRef v3 = (const __CFData *)*((void *)this + 42);
  if (v3) {
    return CFDataGetBytePtr(v3);
  }
  CFDataRef v5 = (const __CFData **)((char *)this + 336);
  BOOL v6 = Security::CodeSigning::SecStaticCode::codeDirectories(this, a2);
  if (v6)
  {
    int v7 = &Security::CodeSigning::hashPriorities;
    unsigned int v8 = 4;
    while (1)
    {
      if (*((void *)this + 44))
      {
        __int16 v9 = (_DWORD *)((char *)this + 352);
        uint64_t v10 = *((void *)this + 44);
        do
        {
          unsigned int v11 = *(_DWORD *)(v10 + 28);
          BOOL v12 = v11 >= v8;
          if (v11 >= v8) {
            char v13 = (uint64_t *)v10;
          }
          else {
            char v13 = (uint64_t *)(v10 + 8);
          }
          if (v12) {
            __int16 v9 = (_DWORD *)v10;
          }
          uint64_t v10 = *v13;
        }

        while (*v13);
      }

      unsigned int v14 = v7[1];
      ++v7;
      unsigned int v8 = v14;
      if (!v14) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA48LL);
      }
    }

    unsigned int v15 = (uint64_t *)v6[1];
    if (!v15) {
LABEL_23:
    }
      std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
    while (1)
    {
      while (1)
      {
        unsigned int v16 = *((_DWORD *)v15 + 8);
        if (v8 >= v16) {
          break;
        }
        unsigned int v15 = (uint64_t *)*v15;
        if (!v15) {
          goto LABEL_23;
        }
      }

      if (v16 >= v8) {
        break;
      }
      unsigned int v15 = (uint64_t *)v15[1];
      if (!v15) {
        goto LABEL_23;
      }
    }

    Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 42, (CFTypeRef *)v15 + 5);
  }

  CFTypeRef v3 = *v5;
  if (*v5) {
    return CFDataGetBytePtr(v3);
  }
  if (a2) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
  }
  return 0LL;
}

void sub_18062CC64(void *a1)
{
  if (!v1)
  {
    if (!*v2)
    {
      __cxa_end_catch();
      if (!*v2) {
        JUMPOUT(0x18062CC44LL);
      }
      JUMPOUT(0x18062CC30LL);
    }

    Security::Syslog::warning((Security::Syslog *)"code signing internal problem: mDir set despite exception exit", v3);
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
  }

  __cxa_rethrow();
}

void sub_18062CCAC(_Unwind_Exception *a1)
{
}

void *Security::CodeSigning::SecStaticCode::codeDirectories( Security::CodeSigning::SecStaticCode *this, int a2)
{
  CFDataRef v2 = (char *)this + 104;
  CFTypeRef v3 = (void *)((char *)this + 104);
  if (!*((void *)this + 15))
  {
    uint64_t v49 = 0LL;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x4002000000LL;
    uint64_t v52 = __Block_byref_object_copy__14695;
    unsigned int v53 = __Block_byref_object_dispose__14696;
    v55[0] = 0LL;
    v55[1] = 0LL;
    __int128 v54 = v55;
    uint64_t v42 = 0LL;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x4002000000LL;
    v45 = __Block_byref_object_copy__13;
    unint64_t v46 = __Block_byref_object_dispose__14;
    v48[0] = 0LL;
    v48[1] = 0LL;
    int v47 = v48;
    uint64_t v36 = 0LL;
    unint64_t v37 = (CFTypeRef *)&v36;
    uint64_t v38 = 0x3002000000LL;
    int v39 = __Block_byref_object_copy__15;
    size_t v40 = __Block_byref_object_dispose__16;
    v41 = 0LL;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 0x40000000LL;
    BOOL v30 = ___ZNK8Security11CodeSigning13SecStaticCode19loadCodeDirectoriesERNSt3__13mapIjNS_9CFCopyRefIPK8__CFDataEENS2_4lessIjEENS2_9allocatorINS2_4pairIKjS8_EEEEEE_block_invoke;
    int v31 = &unk_189678118;
    unsigned int v32 = &v49;
    __int128 v33 = &v42;
    int v34 = &v36;
    uint64_t v35 = this;
    if (___ZNK8Security11CodeSigning13SecStaticCode19loadCodeDirectoriesERNSt3__13mapIjNS_9CFCopyRefIPK8__CFDataEENS2_4lessIjEENS2_9allocatorINS2_4pairIKjS8_EEEEEE_block_invoke( v29,  0))
    {
      uint64_t v6 = 4096LL;
      do
      {
        BOOL v7 = v30(v29, v6);
        BOOL v8 = (_DWORD)v6 == 4100;
        uint64_t v6 = (v6 + 1);
      }

      while (!v8 && v7);
      uint64_t v10 = v50;
      if (!v50[7]) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0BLL);
      }
      unsigned int v11 = v50 + 5;
      uint64_t v12 = *((void *)this + 13);
      *((void *)this + 13) = v50[5];
      v10[5] = v12;
      uint64_t v15 = *((void *)this + 14);
      uint64_t v14 = *((void *)this + 15);
      char v13 = (void *)((char *)this + 112);
      __int128 v17 = *((_OWORD *)v10 + 3);
      unsigned int v16 = v10 + 6;
      *((_OWORD *)this + 7) = v17;
      void *v16 = v15;
      v16[1] = v14;
      if (*((void *)this + 15)) {
        CFTypeRef v3 = (void *)(*v13 + 16LL);
      }
      *CFTypeRef v3 = v13;
      if (v14) {
        unsigned int v11 = (void *)(*v16 + 16LL);
      }
      *unsigned int v11 = v16;
      uint64_t v18 = v43;
      unsigned int v19 = v43 + 5;
      uint64_t v20 = *((void *)this + 43);
      *((void *)this + 43) = v43[5];
      *unsigned int v19 = v20;
      uint64_t v21 = (void *)((char *)this + 352);
      __int128 v23 = *((_OWORD *)v18 + 3);
      CFPropertyListRef v22 = v18 + 6;
      uint64_t v25 = *((void *)this + 44);
      uint64_t v24 = *((void *)this + 45);
      *((_OWORD *)this + 22) = v23;
      *CFPropertyListRef v22 = v25;
      v22[1] = v24;
      if (*((void *)this + 45)) {
        uint64_t v26 = (void *)(*v21 + 16LL);
      }
      else {
        uint64_t v26 = (void *)((char *)this + 344);
      }
      *uint64_t v26 = v21;
      if (v24) {
        unsigned int v19 = (void *)(*v22 + 16LL);
      }
      *unsigned int v19 = v22;
      Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 16, v37 + 5);
    }

    _Block_object_dispose(&v36, 8);
    Security::CFRef<__CFData const*>::~CFRef(&v41);
    _Block_object_dispose(&v42, 8);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v48[0]);
    _Block_object_dispose(&v49, 8);
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(v55[0]);
    uint64_t v27 = *((void *)this + 15);
    if (v27) {
      CFTypeRef v3 = v2;
    }
    else {
      CFTypeRef v3 = 0LL;
    }
    if (!v27 && a2) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
    }
  }

  return v3;
}

void sub_18062CF40()
{
}

void sub_18062CFD4(_Unwind_Exception *a1)
{
}

void *__Block_byref_object_copy__14695(void *result, void *a2)
{
  result[5] = a2[5];
  CFDataRef v2 = a2 + 6;
  uint64_t v3 = a2[6];
  result[6] = v3;
  CFHashCode v4 = result + 6;
  uint64_t v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[5] = v2;
    void *v2 = 0LL;
    a2[7] = 0LL;
  }

  else
  {
    result[5] = v4;
  }

  return result;
}

void __Block_byref_object_dispose__14696(uint64_t a1)
{
}

void *__Block_byref_object_copy__13(void *result, void *a2)
{
  result[5] = a2[5];
  CFDataRef v2 = a2 + 6;
  uint64_t v3 = a2[6];
  result[6] = v3;
  CFHashCode v4 = result + 6;
  uint64_t v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[5] = v2;
    void *v2 = 0LL;
    a2[7] = 0LL;
  }

  else
  {
    result[5] = v4;
  }

  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__16(uint64_t a1)
{
  return Security::CFRef<__CFData const*>::~CFRef((const void **)(a1 + 40));
}

BOOL ___ZNK8Security11CodeSigning13SecStaticCode19loadCodeDirectoriesERNSt3__13mapIjNS_9CFCopyRefIPK8__CFDataEENS2_4lessIjEENS2_9allocatorINS2_4pairIKjS8_EEEEEE_block_invoke( void *a1, int a2)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  CFHashCode v4 = (const __CFData *)(*(uint64_t (**)(void))(**(void **)(a1[7] + 32LL) + 24LL))(*(void *)(a1[7] + 32LL));
  uint64_t v5 = v4;
  *(void *)&v58[1] = v4;
  if (!v4) {
    goto LABEL_73;
  }
  BytePtr = CFDataGetBytePtr(v4);
  unint64_t Length = CFDataGetLength(*(CFDataRef *)&v58[1]);
  v58[0] = -67061;
  if (Length < 0x60) {
    goto LABEL_42;
  }
  if (*(_DWORD *)BytePtr != 34397946 || (unsigned int v8 = bswap32(*((_DWORD *)BytePtr + 1)), v8 <= 0x5F))
  {
    *__error() = 22;
    goto LABEL_42;
  }

  if (Length != v8) {
    goto LABEL_42;
  }
  unsigned int v9 = *((_DWORD *)BytePtr + 2);
  unsigned int v10 = bswap32(v9);
  if (v10 - 192513 < 0xFFFF1000)
  {
    v58[0] = -67059;
    goto LABEL_42;
  }

  if (v10 > 0x20500)
  {
    unsigned int v11 = (os_log_s *)secLogObjForScope("codedir");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    unsigned int v9 = *((_DWORD *)BytePtr + 2);
    if (v12)
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = BytePtr;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = bswap32(v9);
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 132352;
      _os_log_debug_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEBUG,  "%p version 0x%x newer than current 0x%x",  buf,  0x18u);
      unsigned int v9 = *((_DWORD *)BytePtr + 2);
    }
  }

  unsigned int v13 = bswap32(v9);
  BOOL v14 = v13 > 0x204FF && *((_DWORD *)BytePtr + 23) != 0;
  unsigned int v15 = bswap32(*((_DWORD *)BytePtr + 5));
  unint64_t v16 = bswap32(*((_DWORD *)BytePtr + 1));
  __int128 v17 = &BytePtr[v15];
  if (!memchr(v17, 0, v16 - v15) || v17 == 0LL) {
    goto LABEL_42;
  }
  if (v13 > 0x201FF)
  {
    unsigned int v19 = *((_DWORD *)BytePtr + 12);
    if (v19)
    {
      unsigned int v20 = bswap32(v19);
      uint64_t v21 = &BytePtr[v20];
      if (!memchr(v21, 0, v16 - v20) || v21 == 0LL) {
        goto LABEL_42;
      }
    }
  }

  uint64_t v23 = bswap32(*((_DWORD *)BytePtr + 4));
  uint64_t v24 = BytePtr[36];
  uint64_t v25 = bswap32(*((_DWORD *)BytePtr + 6));
  uint64_t v26 = v23 - v24 * v25;
  uint64_t v27 = bswap32(*((_DWORD *)BytePtr + 7));
  if (v26 < 8 || v26 + (v27 + v25) * v24 > v16) {
    goto LABEL_42;
  }
  if (v14)
  {
    unsigned int v29 = bswap32(*((_DWORD *)BytePtr + 23));
    BOOL v30 = v29 >= 8;
    unint64_t v31 = v27 * (unint64_t)v24 + v29;
    if (!v30 || v31 > v16) {
      goto LABEL_42;
    }
  }

  if (v13 <= 0x200FF)
  {
LABEL_57:
    unint64_t v47 = bswap32(*((_DWORD *)BytePtr + 8));
    goto LABEL_58;
  }

  unsigned int v33 = *((_DWORD *)BytePtr + 11);
  if (v33)
  {
    uint64_t v34 = bswap32(v33);
    uint64_t v35 = (unsigned int *)&BytePtr[v34];
    if (&BytePtr[v34])
    {
      int v36 = 0;
      uint64_t v37 = v34;
      while (1)
      {
        if (v34 + 24 > v16) {
          goto LABEL_42;
        }
        if (!*v35) {
          break;
        }
        v36 += bswap32(*v35);
        v35 += 6;
        uint64_t v34 = (char *)v35 - (char *)BytePtr;
        v37 += 24LL;
        if (v37 <= 7) {
          goto LABEL_42;
        }
      }

      int v38 = v36 - 1;
      int v39 = &BytePtr[v23];
      int v40 = v38 * v24;
      uint64_t v41 = &v39[v38 * (int)v24] - BytePtr;
      BOOL v42 = v41 < 8 || v41 + v24 > v16;
      if (v42
        || v14
        && (v13 <= 0x204FF || (unsigned int v43 = *((_DWORD *)BytePtr + 23)) == 0
          ? (uint64_t v44 = 0LL)
          : (uint64_t v44 = &BytePtr[bswap32(v43) + v40]),
            (uint64_t v45 = v44 - BytePtr, v45 < 8) || v45 + v24 > v16))
      {
LABEL_42:
        Security::MacOSError::throwMe((Security::MacOSError *)v58[0]);
      }
    }
  }

  if (v13 <= 0x202FF) {
    goto LABEL_57;
  }
  unint64_t v46 = *((void *)BytePtr + 7);
  if (!v46) {
    goto LABEL_57;
  }
  unint64_t v47 = bswap64(v46);
LABEL_58:
  if (BytePtr[39])
  {
    if (!v47 || ((v47 - 1) >> BytePtr[39]) + 1 != v27) {
      goto LABEL_42;
    }
  }

  else if ((_DWORD)v27 != (v47 != 0))
  {
    goto LABEL_42;
  }

  uint64_t v48 = *(void *)(a1[4] + 8LL);
  uint64_t v49 = *(const void **)&v58[1];
  int v50 = BytePtr[37];
  *(void *)&buf[16] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v51 = operator new(0x30uLL);
  uint64_t v52 = (uint64_t **)(v48 + 48);
  *(void *)buf = v51;
  *(void *)&buf[8] = v48 + 48;
  buf[16] = 0;
  v51[8] = v50;
  Security::CFCopyRef<__CFData const*>::CFCopyRef((void *)v51 + 5, v49);
  buf[16] = 1;
  unsigned int v53 = *(uint64_t **)(v48 + 48);
  __int128 v54 = (uint64_t **)(v48 + 48);
  if (v53)
  {
    unsigned int v55 = v51[8];
    do
    {
      while (1)
      {
        __int128 v54 = (uint64_t **)v53;
        unsigned int v56 = *((_DWORD *)v53 + 8);
        if (v55 >= v56) {
          break;
        }
        unsigned int v53 = *v54;
        uint64_t v52 = v54;
        if (!*v54) {
          goto LABEL_71;
        }
      }

      if (v56 >= v55)
      {
        std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
      }

      unsigned int v53 = v54[1];
    }

    while (v53);
    uint64_t v52 = v54 + 1;
  }

void sub_18062D540(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

const __CFData *Security::CodeSigning::SecStaticCode::getDictionary(UInt8 *this, uint64_t a2, int a3)
{
  if (a3) {
    Security::CodeSigning::SecStaticCode::validateDirectory(this);
  }
  BOOL result = (const __CFData *)(*(uint64_t (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 80LL))( this,  a2,  4294900235LL);
  if (result)
  {
    uint64_t v6 = result;
    (*(void (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 96LL))(this, a2, 4294900235LL);
    BOOL result = (const __CFData *)Security::makeCFDictionaryFrom(v6, v7);
    if (!result) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
    }
  }

  return result;
}

UInt8 *Security::CodeSigning::SecStaticCode::validateDirectory(UInt8 *this)
{
  uint64_t v1 = (uint64_t)this;
  __p[6] = *(void **)MEMORY[0x1895F89C0];
  if (!this[176] || (this[211] & 0x40) != 0 && !this[177])
  {
    CFDataRef v2 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)this, 0);
    if (!v2 || (v2[15] & 2) == 0)
    {
      __p[3] = (void *)v1;
      uint64_t v3 = (const __CFData *)Security::CodeSigning::SecStaticCode::signature((Security::CodeSigning::SecStaticCode *)v1);
      Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)v1, 1);
      *(void *)(v1 + 376) = 0LL;
      unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
      CFTypeRef cf = 0LL;
      if ((*(_BYTE *)(v1 + 209) & 4) != 0) {
        __p[0] = SecPolicyCreateAppleSoftwareSigning();
      }
      else {
        __p[0] = SecPolicyCreateAppleTVOSApplicationSigning();
      }
      CFArrayRef CFArray = Security::makeCFArray((Security *)__p[0], v4, __p[0]);
      Security::CFRef<__SecPolicy *>::~CFRef((const void **)__p);
      unint64_t v25 = (unint64_t)CFArray;
      uint64_t v6 = *(const __CFData **)(v1 + 128);
      BOOL v7 = *(const void **)(v1 + 616);
      if (v7) {
        CFRelease(v7);
      }
      *(void *)(v1 + 616) = 0LL;
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = 0LL;
      unsigned int v8 = (Security::MacOSError *)SecCMSVerifySignedData_internal( v3,  v6,  CFArray,  (SecTrustRef *)(v1 + 616),  0LL,  0LL,  (const __CFDictionary **)&cf);
      if ((_DWORD)v8) {
        Security::MacOSError::throwMe(v8);
      }
      *(CFAbsoluteTime *)(v1 + 376) = SecTrustGetVerifyTime(*(SecTrustRef *)(v1 + 616));
      int v24 = 0;
      unsigned int v9 = (Security::MacOSError *)SecTrustEvaluateInternal(*(__SecTrust **)(v1 + 616), &v24);
      if ((_DWORD)v9) {
        Security::MacOSError::throwMe(v9);
      }
      __p[0] = 0LL;
      Value = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSecCMSHashAgility);
      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)__p, Value);
      if (__p[0])
      {
        CFDictionaryFrom = (const __CFDictionary *)Security::makeCFDictionaryFrom((CFDataRef)__p[0], v11);
        BOOL v12 = CFDictionaryGetValue(CFDictionaryFrom, @"cdhashes");
        CFTypeRef v14 = Security::CodeSigning::SecStaticCode::cdHashes((Security::CodeSigning::SecStaticCode *)v1, v13);
        if (!v12 || !CFEqual(v12, v14)) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0BLL);
        }
        Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&CFDictionaryFrom);
      }

      CFArrayRef v15 = SecTrustCopyCertificateChain(*(SecTrustRef *)(v1 + 616));
      unint64_t v16 = *(const void **)(v1 + 624);
      if (v16) {
        CFRelease(v16);
      }
      *(void *)(v1 + 6Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = v15;
      BOOL v18 = v24 == 4 || v24 == 1;
      *(_BYTE *)(v1 + 632) = v18;
      Security::CFRef<__CFData const*>::~CFRef((const void **)__p);
      Security::CFRef<__CFArray const*>::~CFRef((const void **)&v25);
      Security::CFRef<__CFDictionary const*>::~CFRef(&cf);
      Security::CodeSigning::SecStaticCode::verifySignature(void)::_DTFrameCODESIGN_EVAL_STATIC_SIGNATURE::~_DTFrameCODESIGN_EVAL_STATIC_SIGNATURE();
    }

    *(_BYTE *)(v1 + 184) = 0;
    if ((*(_BYTE *)(v1 + 211) & 0x40) != 0) {
      *(_BYTE *)(v1 + 177) = 1;
    }
    this = (UInt8 *)Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)v1, 1);
    unsigned int v19 = bswap32(*((_DWORD *)this + 6));
    if (v19 >= 0xB) {
      uint64_t v20 = 11LL;
    }
    else {
      uint64_t v20 = v19;
    }
    for (; (_DWORD)v20; --v20)
    {
      if (*(void *)(v1 + 392 + 8 * v20))
      {
        if (v20 == 3) {
          unsigned int v21 = -67023;
        }
        else {
          unsigned int v21 = -67061;
        }
        if (v20 == 1) {
          uint64_t v22 = 4294900266LL;
        }
        else {
          uint64_t v22 = v21;
        }
        this = (UInt8 *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v1 + 96LL))(v1, v20, v22);
      }
    }

    *(_BYTE *)(v1 + 176) = 1;
    *(_DWORD *)(v1 + 180) = 0;
  }

  return this;
}

void sub_18062D91C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, void *__p, uint64_t a15, uint64_t a16, __int128 buf)
{
  if (a2)
  {
    Security::CFRef<__SecPolicy *>::~CFRef((const void **)&__p);
    Security::CFRef<__CFDictionary const*>::~CFRef(&a13);
    Security::CodeSigning::SecStaticCode::verifySignature(void)::_DTFrameCODESIGN_EVAL_STATIC_SIGNATURE::~_DTFrameCODESIGN_EVAL_STATIC_SIGNATURE();
    uint64_t v20 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      *(_BYTE *)(v17 + 176) = 1;
      *(_DWORD *)(v17 + 180) = (*(uint64_t (**)(void *))(*(void *)v20 + 24LL))(v20);
      __cxa_rethrow();
    }

    unsigned int v21 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_debug_impl( &dword_1804F4000,  v21,  OS_LOG_TYPE_DEBUG,  "%p validation threw non-common exception",  (uint8_t *)&buf,  0xCu);
    }

    *(_BYTE *)(v17 + 176) = 1;
    Security::Syslog::notice( (Security::Syslog *)"code signing internal problem: unknown exception thrown by validation",  v22);
    *(_DWORD *)(v17 + 180) = -67048;
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_18062DAC4(_Unwind_Exception *a1)
{
}

void sub_18062DAD0(_Unwind_Exception *a1)
{
}

void sub_18062DADC(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x18062DAE4LL);
  }
  __clang_call_terminate(a1);
}

uint64_t Security::CodeSigning::SecStaticCode::signature(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v1 = *((void *)this + 46);
  if (!v1)
  {
    uint64_t v1 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 4) + 24LL))(*((void *)this + 4), 0x10000LL);
    uint64_t v3 = (const void *)*((void *)this + 46);
    if (v3) {
      CFRelease(v3);
    }
    *((void *)this + 46) = v1;
    if (!v1) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
    }
  }

  return v1;
}

CFTypeRef Security::CodeSigning::SecStaticCode::cdHashes( Security::CodeSigning::SecStaticCode *this, uint64_t a2)
{
  CFTypeRef result = (CFTypeRef)*((void *)this + 66);
  if (!result)
  {
    CFMutableArray = Security::makeCFMutableArray(0LL, a2);
    CFMutableArrayRef theArray = CFMutableArray;
    uint64_t v5 = (Security::CodeSigning::SecStaticCode *)*((void *)this + 13);
    if (v5 == (Security::CodeSigning::SecStaticCode *)((char *)this + 112))
    {
      CFMutableArrayRef v11 = CFMutableArray;
    }

    else
    {
      do
      {
        BytePtr = (Security::CodeSigning::CodeDirectory *)CFDataGetBytePtr(*((CFDataRef *)v5 + 5));
        unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
        CFDataRef v7 = Security::CodeSigning::CodeDirectory::cdhash(BytePtr, 1);
        unint64_t v13 = (unint64_t)v7;
        if (v7) {
          CFArrayAppendValue(theArray, v7);
        }
        Security::CFRef<__CFData const*>::~CFRef((const void **)&v13);
        unsigned int v8 = (Security::CodeSigning::SecStaticCode *)*((void *)v5 + 1);
        if (v8)
        {
          do
          {
            unsigned int v9 = v8;
            unsigned int v8 = *(Security::CodeSigning::SecStaticCode **)v8;
          }

          while (v8);
        }

        else
        {
          do
          {
            unsigned int v9 = (Security::CodeSigning::SecStaticCode *)*((void *)v5 + 2);
            BOOL v10 = *(void *)v9 == (void)v5;
            uint64_t v5 = v9;
          }

          while (!v10);
        }

        uint64_t v5 = v9;
      }

      while (v9 != (Security::CodeSigning::SecStaticCode *)((char *)this + 112));
      CFMutableArrayRef v11 = theArray;
    }

    BOOL v12 = (CFTypeRef *)((char *)this + 528);
    Security::CFRef<__CFArray const*>::operator=(v12, v11);
    Security::CFRef<__CFArray *>::~CFRef((const void **)&theArray);
    return *v12;
  }

  return result;
}

void sub_18062DC30(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

  ;
}

__CFData *Security::Blob<Security::CodeSigning::EntitlementDERBlob,4208882034u>::blobify(const __CFData *a1)
{
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFIndex Length = CFDataGetLength(a1);
  CFDataSetLength(Mutable, Length + 8);
  if (!Mutable) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFF94LL);
  }
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  int v5 = CFDataGetLength(a1);
  *(_DWORD *)MutableBytePtr = 1920065274;
  *((_DWORD *)MutableBytePtr + 1) = bswap32(v5 + 8);
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v7 = CFDataGetLength(a1);
  memcpy(MutableBytePtr + 8, BytePtr, v7);
  return Mutable;
}

CFDataRef Security::CodeSigning::SecStaticCode::cdHash(CFDataRef *this)
{
  if (!this[65])
  {
    CFDataRef v2 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory( (Security::CodeSigning::SecStaticCode *)this,  0);
    if (v2)
    {
      uint64_t v3 = Security::CodeSigning::CodeDirectory::cdhash(v2, 1);
      CFDataRef v4 = this[65];
      if (v4) {
        CFRelease(v4);
      }
      this[65] = v3;
      CFDataGetBytePtr(v3);
      CFDataGetLength(this[65]);
    }
  }

  return this[65];
}

void Security::CodeSigning::SecStaticCode::ValidationContext::reportProblem( Security::CodeSigning::SecStaticCode::ValidationContext *this, Security::CodeSigning::CSError *a2, const __CFString *a3, const __CFString *a4)
{
}

uint64_t Security::CodeSigning::SecStaticCode::ValidationContext::osStatus( Security::CodeSigning::SecStaticCode::ValidationContext *this)
{
  return 0LL;
}

void Security::CodeSigning::SecStaticCode::CollectingContext::~CollectingContext( Security::CodeSigning::SecStaticCode::CollectingContext *this)
{
  *(void *)this = off_189678590;
  uint64_t v1 = (const void **)((char *)this + 16);
  Security::Mutex::~Mutex((pthread_mutex_t *)((char *)this + 32));
  Security::CFRef<__CFDictionary *>::~CFRef(v1);
}

{
  const void **v2;
  *(void *)this = off_189678590;
  CFDataRef v2 = (const void **)((char *)this + 16);
  Security::Mutex::~Mutex((pthread_mutex_t *)((char *)this + 32));
  Security::CFRef<__CFDictionary *>::~CFRef(v2);
  operator delete(this);
}

uint64_t Security::CodeSigning::SecStaticCode::CollectingContext::reportProblem( Security::CodeSigning::SecStaticCode::CollectingContext *this, int a2, const __CFString *a3, const void *a4)
{
  CFTypeRef v14 = (char *)this + 32;
  unint64_t v15 = 0xAAAAAAAAAAAAAA01LL;
  unsigned int v8 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  if ((_DWORD)v8) {
    Security::UnixError::throwMe(v8);
  }
  if (*((_DWORD *)this + 6))
  {
    if (!a3) {
      return Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)&v14);
    }
  }

  else
  {
    *((_DWORD *)this + 6) = a2;
    if (!a3) {
      return Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)&v14);
    }
  }

  CFMutableDictionaryRef CFMutableDictionary = (const __CFDictionary *)*((void *)this + 2);
  if (!CFMutableDictionary)
  {
    CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary(v8);
    BOOL v10 = (const void *)*((void *)this + 2);
    if (v10) {
      CFRelease(v10);
    }
    *((void *)this + 2) = CFMutableDictionary;
  }

  Value = (void *)CFDictionaryGetValue(CFMutableDictionary, a3);
  if (!Value)
  {
    Value = Security::makeCFMutableArray(0LL, v11, v14, v15);
    if (!Value) {
      Security::CFError::throwMe(0LL);
    }
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 2), a3, Value);
    CFRelease(Value);
  }

  CFArrayAppendValue((CFMutableArrayRef)Value, a4);
  return Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)&v14);
}

void sub_18062DF38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t Security::CodeSigning::SecStaticCode::CollectingContext::osStatus( Security::CodeSigning::SecStaticCode::CollectingContext *this)
{
  return *((unsigned int *)this + 6);
}

void Security::CodeSigning::SecStaticCode::CollectingContext::throwMe( Security::CodeSigning::SecStaticCode::CollectingContext *this)
{
  exception = (Security::CodeSigning::CSError *)__cxa_allocate_exception(0xA0uLL);
  int v3 = *((_DWORD *)this + 6);
  CFDataRef v4 = (const void *)*((void *)this + 2);
  if (v4)
  {
    CFRetain(v4);
    int v5 = (const __CFDictionary *)*((void *)this + 2);
  }

  else
  {
    int v5 = 0LL;
  }

  Security::CodeSigning::CSError::CSError(exception, v3, v5);
}

void sub_18062DFB8(_Unwind_Exception *a1)
{
}

Security::MacOSError *Security::CodeSigning::CSError::CSError( Security::CodeSigning::CSError *this, int a2, const __CFDictionary *a3)
{
  CFTypeRef result = Security::MacOSError::MacOSError(this, a2);
  *(void *)CFTypeRef result = off_1896790B0;
  *((void *)result + 19) = a3;
  return result;
}

Security::CodeSigning::SecStaticCode *Security::CodeSigning::SecStaticCode::SecStaticCode( Security::CodeSigning::SecStaticCode *this, Security::CodeSigning::DiskRep *a2, int a3)
{
  *((void *)this + 1) = 1LL;
  *(void *)this = off_189678030;
  *((void *)this + 2) = 0LL;
  Security::Mutex::Mutex((pthread_mutex_t *)((char *)this + 40));
  if (a2)
  {
    uint64_t v6 = (unsigned int *)((char *)a2 + 8);
    do
      unsigned int v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  *((void *)this + 16) = 0LL;
  *((void *)this + 4) = a2;
  *((void *)this + 15) = 0LL;
  *((void *)this + 14) = 0LL;
  *((void *)this + 13) = (char *)this + 112;
  *((void *)this + 20) = 0LL;
  *((void *)this + 21) = 0LL;
  *((void *)this + 19) = 0LL;
  *((void *)this + 17) = 0LL;
  *((void *)this + 18) = (char *)this + 152;
  *((_BYTE *)this + 176) = 0;
  *((_BYTE *)this + 185) = 0;
  *((_BYTE *)this + 192) = 0;
  *((void *)this + 28) = off_189676CF8;
  *((void *)this + 25) = 0LL;
  Security::Mutex::Mutex((pthread_mutex_t *)((char *)this + 232));
  *((_BYTE *)this + 296) = 0;
  *((void *)this + 38) = 0LL;
  unsigned int v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UNSPECIFIED, 0);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.security.validation-progress", v8);
  *(_OWORD *)((char *)this + 360) = 0u;
  *((void *)this + 39) = v9;
  *((void *)this + 40) = 0LL;
  *(_OWORD *)((char *)this + 328) = 0u;
  *((void *)this + 43) = (char *)this + 352;
  *((void *)this + 44) = 0LL;
  *((void *)this + 69) = 0LL;
  *((_BYTE *)this + 560) = 0;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 4Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *(_OWORD *)((char *)this + 456) = 0u;
  *(_OWORD *)((char *)this + 472) = 0u;
  *(_OWORD *)((char *)this + 488) = 0u;
  *(_OWORD *)((char *)this + 504) = 0u;
  *(_OWORD *)((char *)this + 520) = 0u;
  *((void *)this + 67) = 0LL;
  *((void *)this + 73) = 0LL;
  *(_OWORD *)((char *)this + 568) = 0u;
  *((_DWORD *)this + 148) = a3;
  *((_WORD *)this + 298) = 0;
  *((void *)this + 75) = 0x7FF8000000000000LL;
  *((_BYTE *)this + 608) = 1;
  *((_DWORD *)this + 159) = 0;
  *((void *)this + 80) = 0LL;
  *(_OWORD *)((char *)this + 616) = 0u;
  *((_BYTE *)this + 632) = 0;
  return this;
}

void sub_18062E1AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const void **a17, const void **a18)
{
  unsigned int v29 = v25;
  Security::CFRef<__CFDictionary const*>::~CFRef(v22);
  Security::CFRef<__CFArray const*>::~CFRef((const void **)(v18 + 624));
  Security::CFRef<__SecTrust *>::~CFRef(v24);
  Security::CFRef<__CFURL const*>::~CFRef(v26);
  Security::CFRef<__CFData const*>::~CFRef(a17);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)(v18 + 536));
  Security::CFRef<__CFArray const*>::~CFRef((const void **)(v18 + 528));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v18 + 520));
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)(v18 + 504));
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)(v18 + 496));
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)(v18 + 488));
  for (uint64_t i = 0LL; i != -96; i -= 8LL)
    Security::CFRef<__CFData const*>::~CFRef((const void **)(v18 + 480 + i));
  Security::CFRef<__CFData const*>::~CFRef(v20);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*v23);
  Security::CFRef<__CFData const*>::~CFRef(v29);
  Security::Dispatch::Queue::~Queue(v21);
  Security::CFRef<__CFArray const*>::~CFRef(a18);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v18 + 152));
  Security::CFRef<__CFData const*>::~CFRef((const void **)(v18 + 136));
  Security::CFRef<__CFData const*>::~CFRef(v19);
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(*(const void ***)(v18 + 112));
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer((void *)(v18 + 32));
  _Unwind_Resume(a1);
}

void Security::CodeSigning::SecStaticCode::initializeFromParent( Security::CodeSigning::SecStaticCode *this, const Security::CodeSigning::SecStaticCode *a2)
{
  *((void *)this + 40) = a2;
  *((void *)this + 72) = *((void *)a2 + 72);
  uint64_t v2 = *((void *)a2 + 73);
  if (v2)
  {
    CFDataRef v4 = operator new(0x10uLL);
    *CFDataRef v4 = off_189678ED8;
    int v5 = operator new(0x10uLL);
    uint64_t v6 = *(dispatch_object_s **)(*(void *)(v2 + 8) + 8LL);
    *int v5 = off_189676D78;
    v5[1] = v6;
    dispatch_retain(v6);
    v4[1] = v5;
    *((void *)this + 73) = v4;
  }

void sub_18062E334(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::SecStaticCode::prepareProgress( Security::CodeSigning::SecStaticCode *this, int a2)
{
  CFDataRef v4 = (dispatch_queue_s *)*((void *)this + 39);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___ZN8Security11CodeSigning13SecStaticCode15prepareProgressEj_block_invoke;
  block[3] = &__block_descriptor_tmp_14711;
  block[4] = this;
  dispatch_sync(v4, block);
  if ((*((_BYTE *)this + 211) & 0x10) != 0)
  {
    *((_DWORD *)this + 53) = a2;
    *((_DWORD *)this + 54) = 0;
  }

uint64_t ___ZN8Security11CodeSigning13SecStaticCode15prepareProgressEj_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 220LL) = 0;
  return result;
}

void Security::CodeSigning::SecStaticCode::reportProgress(Security::CodeSigning::SecStaticCode *this)
{
  if (*((void *)this + 72) && (*((_BYTE *)this + 211) & 0x10) != 0)
  {
    uint64_t v4 = 0LL;
    int v5 = &v4;
    uint64_t v6 = 0x2000000000LL;
    char v7 = 0;
    uint64_t v1 = (dispatch_queue_s *)*((void *)this + 39);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___ZN8Security11CodeSigning13SecStaticCode14reportProgressEj_block_invoke;
    block[3] = &unk_1896780C0;
    block[4] = &v4;
    void block[5] = this;
    int v3 = 1;
    dispatch_sync(v1, block);
    if (*((_BYTE *)v5 + 24)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA42LL);
    }
    _Block_object_dispose(&v4, 8);
  }

void sub_18062E47C(_Unwind_Exception *a1)
{
}

const void **___ZN8Security11CodeSigning13SecStaticCode14reportProgressEj_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v1 + 220)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  *(_DWORD *)(v1 + 216) += *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(v1 + 576);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 16LL))(v1);
  Security::CFTemp<__CFDictionary const*>::CFTemp( &v11,  (uint64_t)"{current=%d,total=%d}",  v4,  v5,  v6,  v7,  v8,  v9,  *(unsigned int *)(v1 + 216));
  (*(void (**)(uint64_t, uint64_t, const __CFString *, const void *))(v2 + 16))(v2, v3, @"progress", v11);
  return Security::CFRef<__CFDictionary const*>::~CFRef(&v11);
}

void sub_18062E53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

const void *Security::CFDictionary::get<__CFArray const*>(uint64_t a1, const char *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)a1, key);
  uint64_t v4 = Value;
  if (Value)
  {
    uint64_t v5 = (Security::MacOSError *)*(unsigned int *)(a1 + 8);
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 != CFArrayGetTypeID()) {
      Security::MacOSError::throwMe(v5);
    }
  }

  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  return v4;
}

void sub_18062E5CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t *Security::CodeSigning::addError(Security::CodeSigning *this, uint64_t *a2, void *a3)
{
  CFTypeID v5 = CFGetTypeID(this);
  CFTypeRef result = (uint64_t *)CFNumberGetTypeID();
  if ((uint64_t *)v5 == result)
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
    return std::__tree<int>::__emplace_unique_key_args<int,int const&>(a2, valuePtr, valuePtr);
  }

  return result;
}

Security::CodeSigning::SecStaticCode *Security::CodeSigning::SecStaticCode::detachedSignature( Security::CodeSigning::SecStaticCode *this, const __CFData *a2)
{
  uint64_t v3 = (CFTypeRef *)((char *)this + 136);
  if (a2)
  {
    Security::CFRef<__CFArray const*>::operator=(v3, a2);
    CFTypeID v5 = (char *)operator new(0x98uLL);
    uint64_t v6 = (*(uint64_t (**)(void))(**((void **)this + 4) + 16LL))(*((void *)this + 4));
    std::string::basic_string[abi:ne180100]<0>(__p, "explicit detached");
    *((_DWORD *)v5 + 2) = 0;
    *(void *)CFTypeID v5 = off_1896772D8;
    Security::Mutex::Mutex((pthread_mutex_t *)(v5 + 24));
    if (v6)
    {
      uint64_t v7 = (unsigned int *)(v6 + 8);
      do
        unsigned int v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }

    *((void *)v5 + 2) = v6;
    *(void *)CFTypeID v5 = off_1896771A8;
    Security::CFCopyRef<__CFData const*>::CFCopyRef((void *)v5 + 11, a2);
    *((void *)v5 + 12) = 0LL;
    v5[104] = 1;
    if (SHIBYTE(v29) < 0)
    {
      std::string::__init_copy_ctor_external( (std::string *)(v5 + 128),  (const std::string::value_type *)__p[0],  (std::string::size_type)__p[1]);
    }

    else
    {
      *((_OWORD *)v5 + _Block_object_dispose((const void *)(v1 - 48), 8) = *(_OWORD *)__p;
      *((void *)v5 + 1_Block_object_dispose((const void *)(v1 - 48), 8) = v29;
    }

    BytePtr = (UInt8 *)CFDataGetBytePtr(a2);
    uint64_t v13 = (uint64_t)BytePtr;
    if (*(_DWORD *)BytePtr == -1056121094)
    {
      uint64_t v15 = bswap32(*((_DWORD *)BytePtr + 2));
      unint64_t v16 = 8LL * v15 + 12;
      unint64_t v17 = bswap32(*((_DWORD *)BytePtr + 1));
      if (v16 > v17)
      {
        *__error() = 22;
      }

      else
      {
        unint64_t v18 = (unint64_t)&BytePtr[8 * v15 + 12];
        while (1)
        {
          v18 -= 8LL;
          unsigned int v19 = *(_DWORD *)(v18 + 4);
          if (v19)
          {
            unint64_t v20 = bswap32(v19);
            BOOL v21 = v16 > v20 || v20 + 8 > v17;
            if (v21 || bswap32(*(_DWORD *)&BytePtr[v20 + 4]) + v20 > v17) {
              goto LABEL_24;
            }
          }
        }

        uint64_t v22 = (Security::Universal *)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 80LL))(v6);
        if (v22)
        {
          int v23 = Security::Universal::bestNativeArch(v22);
          int v24 = (_DWORD *)Security::SuperBlobCore<Security::SuperBlob<4208856257u,unsigned int>,4208856257u,unsigned int>::find( v13,  v23);
          if (v24)
          {
            unint64_t v25 = Security::Blob<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u>::specific(v24);
            *((void *)v5 + 14) = v25;
            if (v25)
            {
              uint64_t v26 = (_DWORD *)Security::SuperBlobCore<Security::SuperBlob<4208856257u,unsigned int>,4208856257u,unsigned int>::find( v13,  0);
              uint64_t v27 = Security::Blob<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u>::specific(v26);
              *((void *)v5 + 15) = v27;
              if (v27) {
                goto LABEL_29;
              }
            }
          }
        }
      }
    }

    else if (*(_DWORD *)BytePtr == -1072898310)
    {
      CFTypeRef v14 = Security::Blob<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u>::specific(BytePtr);
      *((void *)v5 + 14) = v14;
      if (v14)
      {
        *((void *)v5 + 15) = 0LL;
LABEL_29:
        Security::RefPointer<Security::CodeSigning::DiskRep>::setPointer((void *)this + 4, (uint64_t)v5);
        if (SHIBYTE(v29) < 0) {
          operator delete(__p[0]);
        }
        return this;
      }
    }

void sub_18062E92C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (v15[151] < 0) {
    operator delete(*v19);
  }
  Security::CFRef<__CFData const*>::~CFRef(v18);
  Security::CFRef<__CFData const*>::~CFRef(v17);
  *(void *)uint64_t v15 = v20;
  Security::RefPointer<Security::CodeSigning::DiskRep>::~RefPointer(v16);
  Security::CodeSigning::DiskRep::~DiskRep((Security::CodeSigning::DiskRep *)v15);
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v15);
  _Unwind_Resume(a1);
}

void *Security::CodeSigning::SecStaticCode::requiredStatic( Security::CodeSigning::SecStaticCode *this, const __SecCode *a2)
{
  if (!this) {
    goto LABEL_8;
  }
  uint64_t v2 = (char *)this + 24;
  if (result) {
    return result;
  }
  if (!v4) {
LABEL_8:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01LL);
  CFTypeID v5 = v4;
  if (!v4[24])
  {
    (*(void (**)(_BYTE *))(*(void *)v4 + 80LL))(v4);
    v5[24] = 1;
  }

  return (void *)*((void *)v5 + 4);
}

uint64_t Security::CodeSigning::SecStaticCode::resetValidity(Security::CodeSigning::SecStaticCode *this)
{
  *((_BYTE *)this + 176) = 0;
  *((_BYTE *)this + 192) = 0;
  *((_BYTE *)this + 185) = 0;
  uint64_t v2 = *((void *)this + 25);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
    *((void *)this + 25) = 0LL;
  }

  uint64_t v3 = (const void *)*((void *)this + 42);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void **)*((void *)this + 14);
  *((void *)this + 42) = 0LL;
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(v4);
  *((void *)this + 13) = (char *)this + 112;
  *((void *)this + 14) = 0LL;
  *((void *)this + 15) = 0LL;
  CFTypeID v5 = (const void *)*((void *)this + 46);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = 0LL;
  *((void *)this + 46) = 0LL;
  uint64_t v7 = (char *)this + 392;
  do
  {
    unsigned int v8 = *(const void **)&v7[v6];
    if (v8) {
      CFRelease(v8);
    }
    *(void *)&v7[v6] = 0LL;
    v6 += 8LL;
  }

  while (v6 != 96);
  CFTypeRef v9 = (const void *)*((void *)this + 61);
  if (v9) {
    CFRelease(v9);
  }
  *((void *)this + 61) = 0LL;
  uint64_t v10 = (const void *)*((void *)this + 62);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)this + 62) = 0LL;
  uint64_t v11 = (const void *)*((void *)this + 63);
  if (v11) {
    CFRelease(v11);
  }
  *((void *)this + 63) = 0LL;
  *((void *)this + 64) = 0LL;
  BOOL v12 = (const void *)*((void *)this + 65);
  if (v12) {
    CFRelease(v12);
  }
  *((void *)this + 65) = 0LL;
  *((_BYTE *)this + 560) = 0;
  uint64_t v13 = (const void *)*((void *)this + 77);
  if (v13) {
    CFRelease(v13);
  }
  *((void *)this + 77) = 0LL;
  CFTypeRef v14 = (const void *)*((void *)this + 78);
  if (v14) {
    CFRelease(v14);
  }
  *((void *)this + 7_Block_object_dispose((const void *)(v1 - 48), 8) = 0LL;
  *((_WORD *)this + 29_Block_object_dispose((const void *)(v1 - 48), 8) = 0;
  *((void *)this + 75) = 0x7FF8000000000000LL;
  (*(void (**)(void))(**((void **)this + 4) + 152LL))(*((void *)this + 4));
  uint64_t v15 = (const void *)*((void *)this + 69);
  if (v15) {
    CFRelease(v15);
  }
  *((void *)this + 69) = 0LL;
  return CEReleaseManagedContext();
}

const UInt8 *Security::CodeSigning::SecStaticCode::validateNonResourceComponents(UInt8 *this)
{
  CFTypeRef result = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)this, 1);
  unsigned int v3 = bswap32(*((_DWORD *)result + 6));
  if (v3 >= 0xB) {
    uint64_t v4 = 11LL;
  }
  else {
    uint64_t v4 = v3;
  }
  while (1)
  {
    if ((_DWORD)v4 == 3) {
      goto LABEL_7;
    }
    if (!(_DWORD)v4) {
      return result;
    }
    CFTypeRef result = (const UInt8 *)(*(uint64_t (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 80LL))( this,  v4,  4294900235LL);
LABEL_7:
    uint64_t v4 = (v4 - 1);
  }

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

  ;
}

BOOL ___ZN8Security11CodeSigning13SecStaticCode18validateExecutableEv_block_invoke( uint64_t a1, unsigned int a2, Security::DynamicHash *a3)
{
  unsigned int v11 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t **)(v5 + 104),  a2,  &v11);
  BytePtr = CFDataGetBytePtr((CFDataRef)v6[5]);
  if ((*(_BYTE *)(v5 + 209) & 8) == 0)
  {
    unsigned int v8 = *((_DWORD *)BytePtr + 4);
LABEL_5:
    CFTypeRef v9 = &BytePtr[bswap32(v8) + *(int *)(a1 + 48) * (unint64_t)BytePtr[36]];
    goto LABEL_7;
  }

  if (bswap32(*((_DWORD *)BytePtr + 2)) >> 8 >= 0x205)
  {
    unsigned int v8 = *((_DWORD *)BytePtr + 23);
    if (v8) {
      goto LABEL_5;
    }
  }

  CFTypeRef v9 = 0LL;
LABEL_7:
  BOOL result = Security::DynamicHash::verify(a3, v9);
  if (!result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  uint64_t v7 = a1 + 1;
  unsigned int v8 = a1 + 1;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        unsigned int v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v9 <= a2) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v7 = v8;
        if (!*v8) {
          goto LABEL_8;
        }
      }

      if (v9 >= a2) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v7 = v8 + 1;
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    v12[2] = 0xAAAAAAAAAAAAAA01LL;
    uint64_t v10 = operator new(0x30uLL);
    v12[1] = v6;
    v10[8] = *a3;
    *((void *)v10 + 5) = 0LL;
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at( a1,  (uint64_t)v8,  v7,  (uint64_t *)v10);
    v12[0] = 0LL;
    std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12);
    return (uint64_t **)v10;
  }

  return v8;
}

uint64_t Security::CodeSigning::SecStaticCode::resourceDictionary( Security::CodeSigning::SecStaticCode *this, int a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *((void *)this + 63);
  if (!v2)
  {
    Dictionary = (const __CFString *)Security::CodeSigning::SecStaticCode::getDictionary((UInt8 *)this, 3LL, a2);
    unsigned int v9 = Dictionary;
    if (Dictionary && Security::cfscan(Dictionary, "{rules=%Dn,files=%Dn}", v5))
    {
      uint64_t v6 = (os_log_s *)secLogObjForScope("staticCode");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *((void *)this + 63);
        *(_DWORD *)buf = 134218240;
        unsigned int v11 = this;
        __int16 v12 = 2048;
        uint64_t v13 = v8;
        _os_log_debug_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEBUG, "%p loaded ResourceDict %p", buf, 0x16u);
      }

      Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 63, (CFTypeRef *)&v9);
      uint64_t v2 = *((void *)this + 63);
      Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&v9);
    }

    else
    {
      Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&v9);
      return 0LL;
    }
  }

  return v2;
}

void sub_18062EEFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

const void *Security::cfget<__CFDictionary const*>( const void *Value, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = &a9;
  v15[0] = a2;
  v15[1] = &v14;
  v15[2] = 0LL;
  int v16 = 0;
  char v17 = 0;
  while (Security::CFMunge::next((Security::CFMunge *)v15))
  {
    if (!Value) {
      return 0LL;
    }
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 != CFDictionaryGetTypeID()) {
      return 0LL;
    }
    CFDataRef v11 = Security::CFMake::make((Security::CFMake *)v15);
    Value = CFDictionaryGetValue((CFDictionaryRef)Value, v11);
    CFRelease(v11);
  }

  if (!Value) {
    return 0LL;
  }
  CFTypeID v12 = CFGetTypeID(Value);
  if (v12 == CFDictionaryGetTypeID()) {
    return Value;
  }
  else {
    return 0LL;
  }
}

BOOL Security::CodeSigning::itemQualifiesForResourceExemption(char *a1, const char *a2)
{
  uint64_t v2 = (std::string *)a1;
  if (a1[23] < 0) {
    a1 = *(char **)a1;
  }
  if ((Security::CodeSigning::isOnRootFilesystem((Security::CodeSigning *)a1, a2) & 1) != 0) {
    return 1LL;
  }
  std::string::basic_string[abi:ne180100]<0>(v18, "/AppleInternal/");
  else {
    std::string __s = *v2;
  }
  if ((Security::CodeSigning::isPathPrefix((char *)v18, &__s) & 1) != 0)
  {
    char isPathPrefix = 1;
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(v15, "/System/Volumes/Data/AppleInternal/");
    else {
      std::string v14 = *v2;
    }
    if ((Security::CodeSigning::isPathPrefix((char *)v15, &v14) & 1) != 0)
    {
      char isPathPrefix = 1;
    }

    else
    {
      std::string::basic_string[abi:ne180100]<0>(v12, "/System/AppleInternal/");
      else {
        std::string v11 = *v2;
      }
      if ((Security::CodeSigning::isPathPrefix((char *)v12, &v11) & 1) != 0)
      {
        char isPathPrefix = 1;
      }

      else
      {
        std::string::basic_string[abi:ne180100]<0>(v9, "/usr/local/");
        else {
          std::string v8 = *v2;
        }
        if ((Security::CodeSigning::isPathPrefix((char *)v9, &v8) & 1) != 0)
        {
          char isPathPrefix = 1;
        }

        else
        {
          std::string::basic_string[abi:ne180100]<0>(v6, "/usr/appleinternal/");
          else {
            std::string __p = *v2;
          }
          char isPathPrefix = Security::CodeSigning::isPathPrefix((char *)v6, &__p);
          if (v7 < 0) {
            operator delete(v6[0]);
          }
        }

        if (v10 < 0) {
          operator delete(v9[0]);
        }
      }

      if (v13 < 0) {
        operator delete(v12[0]);
      }
    }

    if (v16 < 0) {
      operator delete(v15[0]);
    }
  }

  if (v19 < 0) {
    operator delete(v18[0]);
  }
  return (isPathPrefix & 1) != 0;
}

void sub_18062F260( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, void *a27, uint64_t a28, int a29, __int16 a30, char a31, char a32, void *a33, uint64_t a34, int a35, __int16 a36, char a37, char a38, void *a39, uint64_t a40, int a41, __int16 a42, char a43, char a44)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a38 < 0) {
    operator delete(a33);
  }
  if (a44 < 0) {
    operator delete(a39);
  }
  _Unwind_Resume(exception_object);
}

BOOL Security::CodeSigning::SecStaticCode::loadResources( Security::CodeSigning::SecStaticCode *this, const __CFDictionary **a2, const __CFDictionary **a3, unsigned int *a4)
{
  std::string v8 = (const __CFDictionary *)Security::CodeSigning::SecStaticCode::resourceDictionary(this, 1);
  uint64_t v9 = Security::CodeSigning::SecStaticCode::resourceBase(this);
  if (!v9)
  {
    if (!v8) {
      return v9 != 0;
    }
LABEL_17:
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA10LL);
  }

  if (!v8) {
    goto LABEL_17;
  }
  Value = CFDictionaryGetValue(v8, @"files2");
  if (Value) {
    char v17 = "rules2";
  }
  else {
    char v17 = "rules";
  }
  if (Value) {
    unint64_t v18 = "files2";
  }
  else {
    unint64_t v18 = "files";
  }
  if (Value) {
    unsigned int v19 = 2;
  }
  else {
    unsigned int v19 = 1;
  }
  *a2 = (const __CFDictionary *)Security::cfget<__CFDictionary const*>( v8,  (uint64_t)v17,  v11,  v12,  v13,  v14,  v15,  v16,  v27);
  *a3 = (const __CFDictionary *)Security::cfget<__CFDictionary const*>( v8,  (uint64_t)v18,  v20,  v21,  v22,  v23,  v24,  v25,  v28);
  *a4 = v19;
  if (!*a2 || !*a3) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11LL);
  }
  return v9 != 0;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__28(uint64_t a1)
{
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)(a1 + 40));
}

uint64_t Security::CodeSigning::SecStaticCode::resourceBase(Security::CodeSigning::SecStaticCode *this)
{
  if (!*((_BYTE *)this + 560))
  {
    memset(__p, 170, sizeof(__p));
    (*(void (**)(void **__return_ptr))(**((void **)this + 4) + 56LL))(__p);
    unsigned int v3 = (void *)HIBYTE(__p[2]);
    char v4 = HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) < 0) {
      unsigned int v3 = __p[1];
    }
    if (v3)
    {
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = (void **)__p[0];
      }
      CFURLRef CFURL = Security::makeCFURL((Security *)v5, (const char *)1, 0LL, v2);
      char v7 = (const void *)*((void *)this + 71);
      if (v7) {
        CFRelease(v7);
      }
      *((void *)this + 71) = CFURL;
      char v4 = HIBYTE(__p[2]);
    }

    *((_BYTE *)this + 560) = 1;
    if (v4 < 0) {
      operator delete(__p[0]);
    }
  }

  return *((void *)this + 71);
}

void sub_18062F510( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke( uint64_t a1, uint64_t a2, char a3, char *a4)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  char v7 = *(Security::CodeSigning::SecStaticCode **)(a1 + 32);
  unsigned int v8 = a3 & 0x40;
  uint64_t v9 = (os_log_s *)secLogObjForScope("staticCode");
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (!v8) {
      return;
    }
LABEL_3:
    CFTypeRef cf = 0LL;
    int v10 = *(unsigned __int16 *)(a2 + 88);
    if (v10 != 8)
    {
      if (v10 == 12)
      {
        memset(__b, 170, 0x400uLL);
        if (realpath_DARWIN_EXTSN(*(const char **)(a2 + 48), (char *)__b))
        {
          CFTypeRef cf = Security::makeCFURL((Security *)__b, 0LL, 0LL, v11);
          uint64_t v12 = (os_log_s *)secLogObjForScope("staticCode");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            BOOL v30 = __b;
            _os_log_debug_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEBUG, "Checking symlink target: %s", buf, 0xCu);
          }

          CFURLRef CFURL = (void *)cf;
LABEL_13:
          CFTypeRef cf = 0LL;
          v26[0] = MEMORY[0x1895F87A8];
          v26[1] = 0x40000000LL;
          v26[2] = ___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_30;
          v26[3] = &__block_descriptor_tmp_31_14805;
          v26[4] = v7;
          v26[5] = CFURL;
          int v27 = *(_DWORD *)(a1 + 48);
          Security::CodeSigning::LimitedAsync::perform( *(void *)(*((void *)v7 + 73) + 8LL),  *(void *)(a1 + 40),  (uint64_t)v26);
LABEL_21:
          Security::CFRef<__CFURL const*>::~CFRef(&cf);
          return;
        }

        uint64_t v23 = (os_log_s *)secLogObjForScope("SecError");
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        int v24 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v24;
        unsigned int v19 = "realpath failed checking symlink: %d";
        uint64_t v20 = buf;
        uint64_t v21 = v23;
        uint32_t v22 = 8;
      }

      else
      {
        char v17 = (os_log_s *)secLogObjForScope("SecError");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        int v18 = *(unsigned __int16 *)(a2 + 88);
        if (a4[23] < 0) {
          a4 = *(char **)a4;
        }
        __b[0] = 67109378;
        __b[1] = v18;
        LOWORD(__b[2]) = 2080;
        *(void *)((char *)&__b[2] + 2) = a4;
        unsigned int v19 = "Unexpected scan input: %d, %s";
        uint64_t v20 = (uint8_t *)__b;
        uint64_t v21 = v17;
        uint32_t v22 = 18;
      }

      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, v19, v20, v22);
      goto LABEL_21;
    }

    uint64_t v14 = Security::CodeSigning::SecStaticCode::resourceBase(v7);
    if (a4[23] >= 0) {
      uint64_t v16 = (Security *)a4;
    }
    else {
      uint64_t v16 = *(Security **)a4;
    }
    CFURLRef CFURL = Security::makeCFURL(v16, 0LL, v14, v15);
    goto LABEL_13;
  }

  uint64_t v25 = a4;
  if (a4[23] < 0) {
    uint64_t v25 = *(char **)a4;
  }
  __b[0] = 67109378;
  __b[1] = v8 >> 6;
  LOWORD(__b[2]) = 2080;
  *(void *)((char *)&__b[2] + 2) = v25;
  _os_log_debug_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEBUG, "Visiting unhandled file: %d, %s", (uint8_t *)__b, 0x12u);
  if (v8) {
    goto LABEL_3;
  }
}

void sub_18062F830( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void ___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t a3, std::string *a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  unsigned int v8 = *(__CFDictionary **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  else {
    std::string v18 = *a4;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v19, (char *)&v18);
  CFDictionaryRemoveValue(v8, v19);
  Security::CFRef<__CFString const*>::~CFRef(&v19);
  BOOL v9 = *(unsigned __int16 *)(a2 + 88) == 12;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 1174405120LL;
  v11[2] = ___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_3;
  v11[3] = &__block_descriptor_tmp_35_14754;
  v11[4] = v7;
  char v15 = *(_BYTE *)(a1 + 72);
  else {
    std::string __p = *a4;
  }
  char v16 = *(_BYTE *)(a1 + 73);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 48);
  BOOL v17 = v9;
  uint64_t v14 = *(void *)(a1 + 64);
  Security::CodeSigning::LimitedAsync::perform(*(void *)(*(void *)(v7 + 584) + 8LL), v10, (uint64_t)v11);
}

void sub_18062F998( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const void **Security::CodeSigning::SecStaticCode::checkOptionalResource( const __CFString *this, const void *a2, Security::CodeSigning::SecStaticCode **a3, void *a4)
{
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v15 = v6;
  __int128 v16 = v6;
  Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)&v15, a2);
  if ((BYTE8(v16) & 1) == 0)
  {
    if (this && (CFTypeID v7 = CFGetTypeID(this), v7 == CFStringGetTypeID()))
    {
      uint64_t v8 = Security::CodeSigning::SecStaticCode::resourceBase(a3[1]);
      if (v8) {
        CFURLRef v9 = (CFURLRef)MEMORY[0x186DFE668](0LL, this, 0LL, 0LL, v8);
      }
      else {
        CFURLRef v9 = CFURLCreateWithFileSystemPath(0LL, this, kCFURLPOSIXPathStyle, 0);
      }
      CFURLRef v14 = v9;
      if (v9) {
        uint64_t v10 = 4294900242LL;
      }
      else {
        uint64_t v10 = 4294900238LL;
      }
      if (v9) {
        uint64_t v11 = (const __CFString *)v9;
      }
      else {
        uint64_t v11 = this;
      }
      if (v9) {
        uint64_t v12 = @"SecCSResourceMissing";
      }
      else {
        uint64_t v12 = @"SecCSResourceSeal";
      }
      (*((void (**)(Security::CodeSigning::SecStaticCode **, uint64_t, const __CFString *, const __CFString *))*a3
       + 2))( a3,  v10,  v12,  v11);
      Security::CFRef<__CFURL const*>::~CFRef((const void **)&v14);
    }

    else
    {
      (*((void (**)(Security::CodeSigning::SecStaticCode **, uint64_t, const __CFString *, const __CFString *))*a3
       + 2))( a3,  4294900242LL,  @"SecCSResourceSeal",  this);
    }
  }

  return Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&v15);
}

void sub_18062FAF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  unsigned int v3 = va_arg(va1, const void *);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)va);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)va1);
  _Unwind_Resume(a1);
}

  ;
}

CFStringRef *Security::CFTempString::CFTempString<std::string>(CFStringRef *a1, char *cStr)
{
  uint64_t v2 = cStr;
  if (cStr[23] < 0 && (uint64_t v2 = *(const char **)cStr) == 0LL)
  {
    CFStringRef v4 = 0LL;
  }

  else
  {
    CFStringRef v4 = CFStringCreateWithCString(0LL, v2, 0x8000100u);
    if (!v4)
    {
      CFStringRef v4 = CFStringCreateWithCString(0LL, v2, 0x600u);
      if (!v4) {
        Security::CFError::throwMe(0LL);
      }
    }
  }

  *a1 = v4;
  return a1;
}

void ___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(Security::CodeSigning::SecStaticCode **)(a1 + 32);
  if (!*(_BYTE *)(a1 + 80)) {
    goto LABEL_17;
  }
  unsigned int v3 = (const __CFURL *)Security::CodeSigning::SecStaticCode::resourceBase(*(Security::CodeSigning::SecStaticCode **)(a1 + 32));
  Security::cfString((Security *)&v26, v3);
  CFStringRef v4 = std::string::append(&v26, "/", 1uLL);
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__l.__cap_ = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  __int128 v6 = (void *)(a1 + 40);
  int v7 = *(char *)(a1 + 63);
  if (v7 >= 0) {
    uint64_t v8 = (const std::string::value_type *)(a1 + 40);
  }
  else {
    uint64_t v8 = *(const std::string::value_type **)(a1 + 40);
  }
  if (v7 >= 0) {
    std::string::size_type v9 = *(unsigned __int8 *)(a1 + 63);
  }
  else {
    std::string::size_type v9 = *(void *)(a1 + 48);
  }
  uint64_t v10 = std::string::append(&v27, v8, v9);
  __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__l.__cap_ = v10->__r_.__value_.__l.__cap_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
  int IsValidXattrFile = Security::CodeSigning::pathIsValidXattrFile(&__p, "staticCode");
  if ((char)v26.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if (IsValidXattrFile) {
      goto LABEL_14;
    }
LABEL_17:
    int v14 = 1;
    goto LABEL_18;
  }

  if (!IsValidXattrFile) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v13 = (os_log_s *)secLogObjForScope("staticCode");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v27.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v27.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
    _os_log_debug_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEBUG,  "resource validation on xattr file skipped: %s",  (uint8_t *)&v27,  0xCu);
  }

  int v14 = 0;
LABEL_18:
  if (!*(_BYTE *)(a1 + 81))
  {
    if (!v14) {
      goto LABEL_36;
    }
    goto LABEL_30;
  }

  uint64_t v15 = Security::CodeSigning::SecStaticCode::resourceBase(v2);
  else {
    BOOL v17 = *(Security **)(a1 + 40);
  }
  CFURLRef CFURL = Security::makeCFURL(v17, 0LL, v15, v16);
  memset(&v27, 170, sizeof(v27));
  Security::cfString((Security *)&v27, CFURL);
  if (Security::CodeSigning::itemQualifiesForResourceExemption((char *)&v27, v18))
  {
    unsigned int v19 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v22 = &v27;
      if ((v27.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint32_t v22 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }
      LODWORD(v26.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v26.__r_.__value_.__r.__words + 4) = (std::string::size_type)v22;
      _os_log_debug_impl( &dword_1804F4000,  v19,  OS_LOG_TYPE_DEBUG,  "resource validation on root volume skipped: %s",  (uint8_t *)&v26,  0xCu);
    }

    LOBYTE(v14) = 0;
  }

  Security::CFRef<__CFURL const*>::~CFRef((const void **)&CFURL);
  if ((v14 & 1) != 0)
  {
LABEL_30:
    uint64_t v20 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = (void *)(a1 + 40);
      LODWORD(v27.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v27.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
      _os_log_debug_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEBUG,  "performing resource validation on item: %s",  (uint8_t *)&v27,  0xCu);
    }

    else {
      std::string v23 = *(std::string *)(a1 + 40);
    }
    Security::CodeSigning::SecStaticCode::validateResource((uint64_t)v2);
  }

void sub_18062FEF8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }

  else
  {
    __int128 v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__l.__cap_ = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
}

const void **Security::CodeSigning::SecStaticCode::validateResource(uint64_t a1)
{
  uint64_t v1 = (Security::CodeSigning::SecStaticCode *)MEMORY[0x1895F8858](a1);
  unsigned int v3 = v2;
  int v5 = v4;
  uint64_t v7 = v6;
  int v9 = v8;
  __int128 v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = (uint64_t)v1;
  uint64_t v181 = *MEMORY[0x1895F89C0];
  if (!Security::CodeSigning::SecStaticCode::resourceBase(v1)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA10LL);
  }
  uint64_t v15 = Security::CodeSigning::SecStaticCode::resourceBase((Security::CodeSigning::SecStaticCode *)v14);
  if ((v11->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    BOOL v17 = (std::string::value_type *)v11;
  }
  else {
    BOOL v17 = (std::string::value_type *)v11->__r_.__value_.__r.__words[0];
  }
  CFURLRef CFURL = Security::makeCFURL((Security *)v17, 0LL, v15, v16);
  v155 = CFURL;
  if (v3 >= 2 && (v5 & 0x210) == 0x210)
  {
    __b[0].__r_.__value_.__r.__words[0] = 0xAAAAAAAAFFFFFFFFLL;
    Security::cfString((Security *)__p, CFURL);
    if (SHIBYTE(__p[2]) >= 0) {
      unsigned int v19 = __p;
    }
    else {
      unsigned int v19 = (void **)__p[0];
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)__b, (const char *)v19, 0, 438);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    data_low = (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_),  "com.apple.ResourceFork"))
    {
      Security::cfString((Security *)__p, v155);
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v21 = __p;
      }
      else {
        uint64_t v21 = (void **)__p[0];
      }
      CFStringRef v22 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Disallowed xattr %s found on %s",  "com.apple.ResourceFork",  v21);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      (*(void (**)(uint64_t, uint64_t, const __CFString *, CFStringRef))(*(void *)v7 + 16LL))( v7,  4294900297LL,  @"SecCSResourceHasSidebandData",  v22);
    }

    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(data_low, "com.apple.FinderInfo"))
    {
      Security::cfString((Security *)__p, v155);
      if (SHIBYTE(__p[2]) >= 0) {
        std::string v23 = __p;
      }
      else {
        std::string v23 = (void **)__p[0];
      }
      CFStringRef v24 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Disallowed xattr %s found on %s",  "com.apple.FinderInfo",  v23);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      (*(void (**)(uint64_t, uint64_t, const __CFString *, CFStringRef))(*(void *)v7 + 16LL))( v7,  4294900297LL,  @"SecCSResourceHasSidebandData",  v24);
    }

    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)__b);
  }

  (*(void (**)(void **__return_ptr))(**(void **)(v14 + 32) + 40LL))(__p);
  Security::cfString((Security *)__b, v155);
  char v25 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    std::string v26 = (void *)HIBYTE(__p[2]);
  }
  else {
    std::string v26 = __p[1];
  }
  std::string::size_type size = __b[0].__r_.__value_.__s.__size_;
  int v28 = (char)__b[0].__r_.__value_.__s.__size_;
  if ((__b[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = __b[0].__r_.__value_.__l.__size_;
  }
  if (v26 == (void *)size)
  {
    if ((__b[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v29 = __b;
    }
    else {
      uint64_t v29 = (std::string *)__b[0].__r_.__value_.__r.__words[0];
    }
    if (SHIBYTE(__p[2]) < 0)
    {
      BOOL v38 = memcmp(__p[0], v29, (size_t)__p[1]) == 0;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_45;
      }
    }

    else if (HIBYTE(__p[2]))
    {
      uint64_t v30 = HIBYTE(__p[2]) - 1LL;
      unint64_t v31 = __p;
      do
      {
        int v33 = *(unsigned __int8 *)v31;
        unint64_t v31 = (void **)((char *)v31 + 1);
        int v32 = v33;
        int v35 = v29->__r_.__value_.__s.__data_[0];
        uint64_t v29 = (std::string *)((char *)v29 + 1);
        int v34 = v35;
        BOOL v37 = v30-- != 0;
        BOOL v38 = v32 == v34;
      }

      while (v32 == v34 && v37);
      if (((char)__b[0].__r_.__value_.__s.__size_ & 0x80000000) == 0)
      {
LABEL_45:
        if ((v25 & 0x80) == 0) {
          goto LABEL_46;
        }
LABEL_50:
        operator delete(__p[0]);
        if (v38) {
          goto LABEL_47;
        }
        goto LABEL_51;
      }
    }

    else
    {
      BOOL v38 = 1;
    }
  }

  else
  {
    BOOL v38 = 0;
  }

  operator delete(__b[0].__r_.__value_.__l.__data_);
  if ((HIBYTE(__p[2]) & 0x80) != 0) {
    goto LABEL_50;
  }
LABEL_46:
  if (v38)
  {
LABEL_47:
    (*(void (**)(uint64_t, uint64_t, const __CFString *, __CFURL *))(*(void *)v7 + 16LL))( v7,  4294900242LL,  @"SecCSResourceRecursive",  v155);
    return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v155);
  }

LABEL_189:
      else {
        std::string v142 = *v11;
      }
      uint64_t v102 = Security::CodeSigning::SecStaticCode::resourceBase((Security::CodeSigning::SecStaticCode *)v14);
      if ((v142.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v104 = &v142;
      }
      else {
        v104 = (std::string *)v142.__r_.__value_.__r.__words[0];
      }
      __p[0] = Security::makeCFURL((Security *)v104, 0LL, v102, v103);
      (*(void (**)(uint64_t, uint64_t, const __CFString *, void *))(*(void *)v7 + 16LL))( v7,  4294900242LL,  @"SecCSResourceAdded",  __p[0]);
      Security::CFRef<__CFURL const*>::~CFRef((const void **)__p);
      return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v155);
    }

    else {
      std::string v143 = *v11;
    }
    int v99 = Security::CodeSigning::SecStaticCode::checkfix30814861(v14, (const std::string::value_type *)&v143, 1);
    char v100 = v99;
    if ((char)v143.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v143.__r_.__value_.__l.__data_);
      if ((v100 & 1) == 0) {
        goto LABEL_189;
      }
    }

    else if (!v99)
    {
      goto LABEL_189;
    }

    CFTypeRef v101 = (os_log_s *)secLogObjForScope("validateResource");
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v11;
      _os_log_debug_impl(&dword_1804F4000, v101, OS_LOG_TYPE_DEBUG, "%s check-fixed (added).", (uint8_t *)__p, 0xCu);
    }

    return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v155);
  }

  operator delete(v154.__r_.__value_.__l.__data_);
  if (!Value) {
    goto LABEL_73;
  }
LABEL_58:
  *(void *)&__int128 v40 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)text = v40;
  *(_OWORD *)theString = v40;
  Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)text, Value);
  if (((uint64_t)theString[1] & 4) == 0)
  {
    if (theString[0])
    {
      if (v9)
      {
        Security::cfString((Security *)&__str, v155);
        Security::cfString(&v149, theString[0]);
        if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_str = &__str;
        }
        else {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        memset(__p, 170, 0x400uLL);
        ssize_t v42 = readlink((const char *)p_str, (char *)__p, 0x3FFuLL);
        if (v42 < 0)
        {
          v138 = __error();
          Security::UnixError::throwMe((Security::UnixError *)*v138);
        }

        *((_BYTE *)__p + v42) = 0;
        memset(v170, 170, 24);
        std::string::basic_string[abi:ne180100]<0>(v170, (char *)__p);
        if (LOBYTE(__p[0]) != 47)
        {
          std::string::size_type v43 = __str.__r_.__value_.__s.__size_;
          uint64_t v44 = &__str;
          if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0)
          {
            std::string::size_type v43 = __str.__r_.__value_.__l.__size_;
            uint64_t v44 = (std::string *)__str.__r_.__value_.__r.__words[0];
          }

          if (v43)
          {
            do
            {
              if (!v43) {
                goto LABEL_197;
              }
              int v45 = v44->__r_.__value_.__s.__data_[--v43];
            }

            while (v45 != 47);
            std::string::size_type v46 = v43;
          }

          else
          {
LABEL_197:
            std::string::size_type v46 = -1LL;
          }

          std::string::basic_string((std::string *)v161, &__str, 0LL, v46, (std::allocator<char> *)v169);
          std::string::push_back((std::string *)v161, 47);
          __b[0] = *(std::string *)v161;
          memset(v161, 0, 24);
          std::string::size_type v105 = strlen((const char *)__p);
          CFDataRef v106 = std::string::append(__b, (const std::string::value_type *)__p, v105);
          BOOL v107 = (void *)v106->__r_.__value_.__r.__words[0];
          *(void *)v171 = v106->__r_.__value_.__l.__size_;
          *(void *)&v171[7] = *(std::string::size_type *)((char *)&v106->__r_.__value_.__r.__words[1] + 7);
          unsigned __int8 v108 = v106->__r_.__value_.__s.__size_;
          v106->__r_.__value_.__l.__size_ = 0LL;
          v106->__r_.__value_.__l.__cap_ = 0LL;
          v106->__r_.__value_.__r.__words[0] = 0LL;
          if (SHIBYTE(v170[2]) < 0) {
            operator delete(v170[0]);
          }
          v170[0] = v107;
          v170[1] = *(void **)v171;
          *(void **)((char *)&v170[1] + 7) = *(void **)&v171[7];
          HIBYTE(v170[2]) = v108;
          if ((v161[23] & 0x80000000) != 0) {
            operator delete(*(void **)v161);
          }
        }

        if ((v149.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          size_t v109 = v149.__r_.__value_.__s.__size_;
        }
        else {
          size_t v109 = v149.__r_.__value_.__l.__size_;
        }
        if (v109 != strlen((const char *)__p)
          || ((v149.__r_.__value_.__s.__size_ & 0x80u) == 0
            ? (CFTypeID v110 = &v149)
            : (CFTypeID v110 = (std::string *)v149.__r_.__value_.__r.__words[0]),
              memcmp(v110, __p, v109)))
        {
          if ((char)__str.__r_.__value_.__s.__size_ < 0) {
            std::string::__init_copy_ctor_external( __b,  __str.__r_.__value_.__l.__data_,  __str.__r_.__value_.__l.__size_);
          }
          else {
            __b[0] = __str;
          }
          Security::CFTempString::CFTempString<std::string>((CFStringRef *)v161, (char *)__b);
          (*(void (**)(uint64_t, uint64_t, const __CFString *, void))(*(void *)v7 + 16LL))( v7,  4294900242LL,  @"SecCSResourceAltered",  *(void *)v161);
          Security::CFRef<__CFString const*>::~CFRef((const void **)v161);
          v111 = (void *)__b[0].__r_.__value_.__r.__words[0];
          goto LABEL_217;
        }

        if ((~*(_DWORD *)(v14 + 208) & 0x90) != 0) {
          goto LABEL_273;
        }
        memset(__b, 170, 0x400uLL);
        if (SHIBYTE(v170[2]) >= 0) {
          v112 = v170;
        }
        else {
          v112 = (void **)v170[0];
        }
        size_t v113 = strlen((const char *)__b);
        if (LOBYTE(__p[0]) == 47)
        {
          size_t v114 = v113;
          char v115 = "/System/";
          v116 = &off_1896782E8;
          while (1)
          {
            size_t v117 = strlen(v115);
            int v118 = *v116++;
            char v115 = v118;
            if (!v118) {
              goto LABEL_259;
            }
          }
        }

        uint64_t v119 = v14;
        while (1)
        {
          memset(v161, 170, 24);
          uint64_t v120 = *(void *)(v119 + 328);
          if (*(char *)(v120 + 23) < 0)
          {
            std::string::__init_copy_ctor_external( (std::string *)v161,  *(const std::string::value_type **)v120,  *(void *)(v120 + 8));
          }

          else
          {
            *(_OWORD *)v161 = *(_OWORD *)v120;
            *(void *)&v161[16] = *(void *)(v120 + 16);
          }

          uint64_t v121 = v161[23];
          if ((v161[23] & 0x80000000) != 0)
          {
            uint64_t v126 = *(void *)&v161[8];
            uint64_t v122 = *(void **)v161;
            operator delete(v122);
          }

          else if (!strncmp((const char *)__b, v161, v161[23]))
          {
            uint64_t v126 = v121;
LABEL_254:
            uint64_t v127 = *(void *)(v119 + 328);
            std::string::basic_string[abi:ne180100]<0>(v171, (char *)&__b[0].__r_.__value_.__l.__data_ + v126 + 1);
            char v128 = Security::CodeSigning::ResourceBuilder::includes(v127, (std::string *)v171);
            if ((v171[23] & 0x80000000) != 0) {
              operator delete(*(void **)v171);
            }
            if ((v121 & 0x80) != 0) {
              operator delete(*(void **)v161);
            }
            if ((v128 & 1) == 0)
            {
LABEL_259:
              uint64_t v131 = *(void *)(v14 + 152);
              uint64_t v130 = v14 + 152;
              uint64_t v129 = v131;
              if (v131)
              {
                uint64_t v132 = v130;
                do
                {
                  int v133 = *(_DWORD *)(v129 + 28);
                  BOOL v134 = v133 < -67003;
                  if (v133 >= -67003) {
                    v135 = (uint64_t *)v129;
                  }
                  else {
                    v135 = (uint64_t *)(v129 + 8);
                  }
                  if (!v134) {
                    uint64_t v132 = v129;
                  }
                  uint64_t v129 = *v135;
                }

                while (*v135);
              }

              if ((char)__str.__r_.__value_.__s.__size_ < 0) {
                std::string::__init_copy_ctor_external( (std::string *)v161,  __str.__r_.__value_.__l.__data_,  __str.__r_.__value_.__l.__size_);
              }
              else {
                *(std::string *)v161 = __str;
              }
              Security::CFTempString::CFTempString<std::string>((CFStringRef *)v169, v161);
              (*(void (**)(uint64_t, uint64_t, const __CFString *, void *))(*(void *)v7 + 16LL))( v7,  4294900293LL,  @"SecCSResourceAltered",  v169[0]);
              Security::CFRef<__CFString const*>::~CFRef((const void **)v169);
              if ((v161[23] & 0x80000000) == 0) {
                goto LABEL_273;
              }
              v111 = *(void **)v161;
LABEL_217:
              operator delete(v111);
            }

LABEL_273:
            if (SHIBYTE(v170[2]) < 0) {
              operator delete(v170[0]);
            }
            if ((char)__str.__r_.__value_.__s.__size_ < 0)
            {
              v98 = (void *)__str.__r_.__value_.__r.__words[0];
LABEL_279:
              operator delete(v98);
            }

            goto LABEL_280;
          }

          uint64_t v119 = *(void *)(v119 + 320);
          if (!v119) {
            goto LABEL_259;
          }
        }
      }

LABEL_252:
    _Block_object_dispose(__p, 8);
LABEL_253:
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)v170);
    goto LABEL_280;
  }

  if ((v9 & 1) != 0) {
    goto LABEL_83;
  }
  memset(v151, 170, sizeof(v151));
  std::string::basic_string[abi:ne180100]<0>(v151, ".framework");
  if ((char)v11->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v55 = v11->__r_.__value_.__l.__size_;
    BOOL v50 = v151[2] < 0;
    if (v151[2] >= 0) {
      size_t v51 = HIBYTE(v151[2]);
    }
    else {
      size_t v51 = v151[1];
    }
    BOOL v134 = v55 > v51;
    size_t v52 = v55 - v51;
    if (!v134) {
      goto LABEL_116;
    }
    __int128 v11 = (std::string *)v11->__r_.__value_.__r.__words[0];
LABEL_112:
    if (v50) {
      unsigned int v56 = (void *)v151[0];
    }
    else {
      unsigned int v56 = v151;
    }
    BOOL v57 = memcmp((char *)v11 + v52, v56, v51) == 0;
    goto LABEL_117;
  }

  size_t v49 = v11->__r_.__value_.__s.__size_;
  BOOL v50 = v151[2] < 0;
  if (v151[2] >= 0) {
    size_t v51 = HIBYTE(v151[2]);
  }
  else {
    size_t v51 = v151[1];
  }
  BOOL v134 = v49 > v51;
  size_t v52 = v49 - v51;
  if (v134) {
    goto LABEL_112;
  }
LABEL_116:
  BOOL v57 = 0;
LABEL_117:
  uint64_t v58 = v155;
  SecRequirementRef requirement = 0LL;
  if (SecRequirementCreateWithStringAndErrors(text[1], 0, 0LL, &requirement)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11LL);
  }
  if ((v5 & 8) != 0) {
    int v59 = v5;
  }
  else {
    int v59 = v5 | 0x4000006;
  }
  unint64_t v156 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v60 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
  uint64_t v62 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x288,  *(void *)(v60 + 200),  v61);
  Security::cfString((Security *)__p, v58);
  if (SHIBYTE(__p[2]) >= 0) {
    uint64_t v63 = (char *)__p;
  }
  else {
    uint64_t v63 = (char *)__p[0];
  }
  uint64_t v64 = Security::CodeSigning::DiskRep::bestGuess(v63, 0LL);
  Security::CodeSigning::SecStaticCode::SecStaticCode(v62, (Security::CodeSigning::DiskRep *)v64, 0);
  CFTypeRef v65 = (unsigned __int8 *)v62 - 8;
  do
    unsigned __int8 v66 = __ldaxr(v65);
  while (__stlxr(1u, v65));
  if ((v66 & 1) != 0)
  {
    unint64_t v67 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)v62 + 16LL))(v62);
    CFRetain(v67);
  }

  unint64_t v156 = (unint64_t)v62;
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    uint64_t v62 = (Security::CodeSigning::SecStaticCode *)v156;
  }

  Security::CodeSigning::SecStaticCode::initializeFromParent(v62, (const Security::CodeSigning::SecStaticCode *)v14);
  uint64_t v68 = (Security::CodeSigning::SecStaticCode *)v156;
  char v70 = (const Security::CodeSigning::SecRequirement *)Security::CodeSigning::SecRequirement::required(requirement, v69);
  unsigned int v140 = v59 & 0xFFFFFEFF;
  Security::CodeSigning::SecStaticCode::staticValidate(v68, v59 & 0xFFFFFEFF, v70);
  char v71 = !v57;
  if ((v59 & 0x10) == 0) {
    char v71 = 1;
  }
  if ((v71 & 1) == 0)
  {
    SecRequirementRef v139 = requirement;
    memset(v169, 170, sizeof(v169));
    v72 = (const __CFURL *)(*(uint64_t (**)(void))(**(void **)(v156 + 32) + 48LL))(*(void *)(v156 + 32));
    Security::cfStringRelease((Security *)v169, v72);
    memset(__b, 170, 0x400uLL);
    if (SHIBYTE(v169[2]) >= 0) {
      CFTypeRef v73 = v169;
    }
    else {
      CFTypeRef v73 = (void **)v169[0];
    }
    v141 = realpath_DARWIN_EXTSN((const char *)v73, (char *)__b);
    unint64_t v168 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v74 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v74 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v167[7] = v74;
    v167[8] = v74;
    v167[5] = v74;
    v167[6] = v74;
    v167[3] = v74;
    v167[4] = v74;
    v167[1] = v74;
    v167[2] = v74;
    __int128 v166 = v74;
    v167[0] = v74;
    *(_OWORD *)v164 = v74;
    __int128 v165 = v74;
    __int128 v162 = v74;
    __int128 v163 = v74;
    *(_OWORD *)v161 = v74;
    *(_OWORD *)&v161[16] = v74;
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v161);
    Security::cfString((Security *)__p, v58);
    if (SHIBYTE(__p[2]) >= 0) {
      __int128 v75 = __p;
    }
    else {
      __int128 v75 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v76 = HIBYTE(__p[2]);
    }
    else {
      uint64_t v76 = (uint64_t)__p[1];
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v161, (uint64_t)v75, v76);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v161, (uint64_t)"/Versions/", 10LL);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    memset(__p, 170, sizeof(__p));
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>(&__dst, (uint64_t)&v161[8]);
    Security::CodeSigning::DirScanner::DirScanner((uint64_t)__p, &__dst);
    uint64_t v77 = *MEMORY[0x189614738];
    uint64_t v78 = *(void *)(MEMORY[0x189614738] + 24LL);
    if (LOBYTE(__p[135]))
    {
      uint64_t v79 = MEMORY[0x189614750] + 16LL;
      while (1)
      {
        Next = Security::CodeSigning::DirScanner::getNext((DIR **)__p);
        if (!Next) {
          break;
        }
        unint64_t v178 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v81 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v81 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v177[8] = v81;
        v177[7] = v81;
        v177[6] = v81;
        v177[5] = v81;
        v177[4] = v81;
        v177[3] = v81;
        v177[2] = v81;
        v177[1] = v81;
        v177[0] = v81;
        __int128 v176 = v81;
        __int128 v175 = v81;
        *(_OWORD *)v174 = v81;
        __int128 v173 = v81;
        __int128 v172 = v81;
        *(_OWORD *)&v171[16] = v81;
        *(_OWORD *)v171 = v81;
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v171);
        if (Next->d_type == 4)
        {
          d_name = Next->d_name;
          if (strcmp(d_name, "Current"))
          {
            std::stringbuf::str[abi:ne180100]<std::allocator<char>>(v170, (uint64_t)&v161[8]);
            if (SHIBYTE(v170[2]) >= 0) {
              __int128 v83 = v170;
            }
            else {
              __int128 v83 = (void **)v170[0];
            }
            if (SHIBYTE(v170[2]) >= 0) {
              uint64_t v84 = HIBYTE(v170[2]);
            }
            else {
              uint64_t v84 = (uint64_t)v170[1];
            }
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v171, (uint64_t)v83, v84);
            size_t v85 = strlen(d_name);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v171, (uint64_t)d_name, v85);
            if (SHIBYTE(v170[2]) < 0) {
              operator delete(v170[0]);
            }
            memset(v170, 170, sizeof(v170));
            std::stringbuf::str[abi:ne180100]<std::allocator<char>>(v158, (uint64_t)&v171[8]);
            if (v159 >= 0) {
              unint64_t v86 = v158;
            }
            else {
              unint64_t v86 = (void **)v158[0];
            }
            uint64_t v87 = realpath_DARWIN_EXTSN((const char *)v86, (char *)v170);
            if (v159 < 0) {
              operator delete(v158[0]);
            }
            if (!v87)
            {
              v137 = __error();
              Security::UnixError::throwMe((Security::UnixError *)*v137);
            }

            if (!v141 || strcmp((const char *)__b, (const char *)v170))
            {
              v158[0] = (void *)0xAAAAAAAAAAAAAAAALL;
              uint64_t v88 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
              v90 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x288,  *(void *)(v88 + 200),  v89);
              uint64_t v91 = Security::CodeSigning::DiskRep::bestGuess((char *)v170, 0LL);
              Security::CodeSigning::SecStaticCode::SecStaticCode(v90, (Security::CodeSigning::DiskRep *)v91, 0);
              uint64_t v92 = (unsigned __int8 *)v90 - 8;
              do
                unsigned __int8 v93 = __ldaxr(v92);
              while (__stlxr(1u, v92));
              if ((v93 & 1) != 0)
              {
                v94 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)v90 + 16LL))(v90);
                CFRetain(v94);
              }

              v158[0] = v90;
              Security::CodeSigning::SecStaticCode::initializeFromParent( v90,  (const Security::CodeSigning::SecStaticCode *)v14);
              v95 = (Security::CodeSigning::SecStaticCode *)v158[0];
              v97 = (const Security::CodeSigning::SecRequirement *)Security::CodeSigning::SecRequirement::required( v139,  v96);
              Security::CodeSigning::SecStaticCode::staticValidate(v95, v140, v97);
              Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)v158);
            }
          }
        }

        *(void *)v171 = v77;
        *(void *)&v171[*(void *)(v77 - 24)] = v78;
        *(void *)&v171[8] = v79;
        if (SHIBYTE(v175) < 0) {
          operator delete(v174[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x186DFEA1C](v177);
      }
    }

    Security::CodeSigning::DirScanner::~DirScanner((Security::CodeSigning::DirScanner *)__p);
    *(void *)v161 = v77;
    *(void *)&v161[*(void *)(v77 - 24)] = v78;
    *(void *)&v161[8] = MEMORY[0x189614750] + 16LL;
    if (SHIBYTE(v165) < 0) {
      operator delete(v164[1]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x186DFEA1C](v167);
    if (SHIBYTE(v169[2]) < 0) {
      operator delete(v169[0]);
    }
  }

  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v156);
  Security::CFRef<__SecRequirement *>::~CFRef((const void **)&requirement);
  if (SHIBYTE(v151[2]) < 0)
  {
    v98 = (void *)v151[0];
    goto LABEL_279;
  }

LABEL_280:
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)text);
  return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v155);
}

void sub_1806312A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, void *a38, uint64_t a39, int a40, __int16 a41, char a42, char a43, void *a44, uint64_t a45, int a46, __int16 a47, char a48, char a49, void *a50,uint64_t a51,uint64_t a52,const void *a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  if (SLOBYTE(STACK[0x6E7]) < 0) {
    operator delete((void *)STACK[0x6D0]);
  }
  if (v69 < 0) {
    operator delete(a69);
  }
  if (SLOBYTE(STACK[0x2E7]) < 0) {
    operator delete((void *)STACK[0x2D0]);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a49 < 0) {
    operator delete(a44);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&a53);
  JUMPOUT(0x1806317B4LL);
}

void sub_180631580()
{
}

void sub_1806315A0()
{
  if (SLOBYTE(STACK[0x2E7]) < 0) {
    JUMPOUT(0x1806315B4LL);
  }
  std::ostringstream::~ostringstream(&STACK[0x6D0]);
  JUMPOUT(0x180631618LL);
}

void sub_1806315BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  if (a56 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1806317B4LL);
}

void sub_1806315F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_18063160C()
{
}

void sub_18063174C()
{
}

void sub_18063175C()
{
}

void sub_18063176C()
{
}

void sub_180631778()
{
}

void sub_180631788()
{
  if (SLOBYTE(STACK[0x7F7]) < 0) {
    JUMPOUT(0x180631798LL);
  }
  JUMPOUT(0x1806317B4LL);
}

void sub_1806317A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,const void *a54)
{
}

void sub_1806317C4(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x1806317BCLL);
}

BOOL ___ZN8Security11CodeSigning13SecStaticCode16validateResourceEPK14__CFDictionaryNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEbRNS1_17ValidationContextEjj_block_invoke( uint64_t a1, int a2, Security::DynamicHash *a3)
{
  int v5 = Security::CodeSigning::ResourceSeal::hash(*(CFDictionaryRef **)(a1 + 40), a2);
  BOOL result = Security::DynamicHash::verify(a3, v5);
  if (!result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
  return result;
}

uint64_t Security::CodeSigning::SecStaticCode::checkfix30814861( uint64_t a1, const std::string::value_type *a2, int a3)
{
  v30[2] = *MEMORY[0x1895F89C0];
  std::string v27 = *(uint64_t (**(void))(**(void **)(a1 + 32) + 160LL))(*(void *)(a1 + 32));
  CFDictionaryRef theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  v30[0] = 0xAAAAAAAAAAAAAAAALL;
  Security::CFDictionary::CFDictionary((Security::CFDictionary *)&theDict, v27, (Security::MacOSError *)0xFFFEFA23LL);
  Value = CFDictionaryGetValue(theDict, @"VersionPlatform");
  uint64_t v7 = (const __CFNumber *)Security::CFRef<__CFNumber const*>::check<void const*>( Value,  (Security::MacOSError *)0xFFFEFA23LL);
  unsigned int valuePtr = -1431655766;
  int v8 = CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
  unsigned int v9 = valuePtr;
  uint64_t v10 = CFDictionaryGetValue(theDict, @"VersionSDK");
  __int128 v11 = (const __CFNumber *)Security::CFRef<__CFNumber const*>::check<void const*>( v10,  (Security::MacOSError *)0xFFFEFA23LL);
  unsigned int valuePtr = -1431655766;
  if (CFNumberGetValue(v11, kCFNumberIntType, &valuePtr)) {
    BOOL v12 = valuePtr >= 0x90000;
  }
  else {
    BOOL v12 = 0;
  }
  char v13 = !v12;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theDict);
  uint64_t v14 = 0LL;
  if (!v8 || v9 != 2 || (v13 & 1) == 0) {
    goto LABEL_34;
  }
  if (Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::once != -1) {
    dispatch_once( &Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::once,  &__block_literal_global_14769);
  }
  if (a3) {
    uint64_t v15 = (const regex_t *)&Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::pathre_sinf;
  }
  else {
    uint64_t v15 = (const regex_t *)&Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::pathre_supp_supf;
  }
  __int128 v16 = a2;
  if (a2[23] < 0) {
    __int128 v16 = *(const char **)a2;
  }
  int v17 = regexec(v15, v16, 0LL, 0LL, 0);
  int v18 = v17;
  if (!v17)
  {
    uint64_t v20 = *(void *)(a1 + 24);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___ZN8Security11CodeSigning13SecStaticCode16checkfix30814861ENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEb_block_invoke_51;
    block[3] = &__block_descriptor_tmp_52_14772;
    block[4] = a1;
    if (v20 != -1) {
      dispatch_once((dispatch_once_t *)(a1 + 24), block);
    }
    uint64_t v21 = *(void *)(a1 + 16);
    if (a2[23] < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else {
      std::string __p = *(std::string *)a2;
    }
    uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule(v21, (uint64_t)&__p);
    uint64_t v23 = Rule;
    if ((char)__p.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (!v23) {
        goto LABEL_33;
      }
    }

    else if (!Rule)
    {
      goto LABEL_33;
    }

    uint64_t v14 = (*(unsigned __int8 *)(v23 + 36) >> 1) & 1;
    goto LABEL_34;
  }

  if (v17 == 1)
  {
LABEL_33:
    uint64_t v14 = 0LL;
    goto LABEL_34;
  }

  unsigned int v19 = (os_log_s *)secLogObjForScope("SecError");
  uint64_t v14 = 0LL;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (a2[23] < 0) {
      a2 = *(const std::string::value_type **)a2;
    }
    LODWORD(theDict) = 67109378;
    HIDWORD(theDict) = v18;
    LOWORD(v30[0]) = 2080;
    *(void *)((char *)v30 + 2) = a2;
    _os_log_impl( &dword_1804F4000,  v19,  OS_LOG_TYPE_DEFAULT,  "unexpected regexec result %d for path '%s'",  (uint8_t *)&theDict,  0x12u);
    goto LABEL_33;
  }

void ___ZN8Security11CodeSigning13SecStaticCode16checkfix30814861ENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEb_block_invoke_51( uint64_t a1)
{
  uint64_t v1 = *(Security::CodeSigning::SecStaticCode **)(a1 + 32);
  unsigned int v2 = (const void *)Security::CodeSigning::SecStaticCode::resourceDictionary(v1, 1);
  unsigned int v9 = Security::cfget<__CFDictionary const*>(v2, (uint64_t)"rules", v3, v4, v5, v6, v7, v8, v12);
  memset(&__p, 170, sizeof(__p));
  uint64_t v10 = (const __CFURL *)Security::CodeSigning::SecStaticCode::resourceBase(v1);
  Security::cfString((Security *)&__p, v10);
  __int128 v11 = operator new(0x60uLL);
  Security::CodeSigning::ResourceBuilder::ResourceBuilder( (std::string::size_type)v11,  (uint64_t)&__p,  &__p,  v9,  0,  (uint64_t)v1 + 144);
  *((void *)v1 + 2) = v11;
}

void sub_180631BF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN8Security11CodeSigning13SecStaticCode16checkfix30814861ENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEb_block_invoke()
{
  if (regcomp( &Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::pathre_sinf,  "^(Frameworks/[^/]+\\.framework/|PlugIns/[^/]+\\.appex/|())SC_Info/[^/]+\\.sinf$",  5))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_5;
  }

  uint64_t result = regcomp( &Security::CodeSigning::SecStaticCode::checkfix30814861(std::string,BOOL)::pathre_supp_supf,  "^(Frameworks/[^/]+\\.framework/|PlugIns/[^/]+\\.appex/|())SC_Info/[^/]+\\.(supf|supp)$",  5);
  if ((_DWORD)result)
  {
LABEL_5:
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  return result;
}

const void **Security::CodeSigning::SecStaticCode::staticValidate( Security::CodeSigning::SecStaticCode *this, int a2, Security::CodeSigning::Requirement **a3)
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  *((_DWORD *)this + 52) = a2;
  if ((a2 & 0x10000000) != 0)
  {
    uint64_t v6 = (const void *)Security::CodeSigning::SecStaticCode::resourceDictionary(this, 1);
    char v13 = (const __CFDictionary *)Security::cfget<__CFDictionary const*>( v6,  (uint64_t)"files2",  v7,  v8,  v9,  v10,  v11,  v12,  v82);
    if (v13
      || (char v13 = (const __CFDictionary *)Security::cfget<__CFDictionary const*>( v6,  (uint64_t)"files",  v14,  v15,  v16,  v17,  v18,  v19,  v83)) != 0LL)
    {
      LODWORD(v13) = CFDictionaryGetCount(v13);
    }

    Security::CodeSigning::SecStaticCode::prepareProgress(this, (_DWORD)v13 + 2);
  }

  Security::CodeSigning::SecStaticCode::staticValidateCore((UInt8 *)this, a2, a3);
  if ((a2 & 1) != 0)
  {
    v84[0] = MEMORY[0x1895F87A8];
    v84[1] = 0x40000000LL;
    v84[2] = ___ZN8Security11CodeSigning13SecStaticCode14staticValidateEjPKNS0_14SecRequirementE_block_invoke;
    v84[3] = &__block_descriptor_tmp_72_14785;
    int v85 = a2;
    v84[4] = this;
    v84[5] = a3;
    buf.__r_.__value_.__r.__words[0] = MEMORY[0x1895F87A8];
    buf.__r_.__value_.__l.__size_ = 0x40000000LL;
    buf.__r_.__value_.__l.__cap_ = (std::string::size_type)___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
    *(void *)&__int128 v121 = &unk_189678518;
    *((void *)&v121 + 1) = v84;
    *(void *)uint64_t v122 = this;
    Security::CodeSigning::SecStaticCode::visitOtherArchitectures((uint64_t)this, (uint64_t)&buf);
  }

  Security::CodeSigning::SecStaticCode::reportProgress(this);
  uint64_t v20 = *((void *)this + 72);
  if (v20)
  {
    uint64_t v21 = (*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)this + 16LL))(this);
    (*(void (**)(uint64_t, uint64_t, const __CFString *, void))(v20 + 16))(v20, v21, @"prepared", 0LL);
  }

  if ((a2 & 4) == 0)
  {
    if (*((_BYTE *)this + 192) && ((a2 & 8) == 0 || *((_BYTE *)this + 193)))
    {
LABEL_97:
      char v70 = (Security::MacOSError *)*((unsigned int *)this + 49);
      if ((_DWORD)v70) {
        Security::MacOSError::throwMe(v70);
      }
      goto LABEL_100;
    }

    memset(__p, 170, sizeof(__p));
    CFStringRef v22 = (const __CFURL *)(*(uint64_t (**)(void))(**((void **)this + 4) + 48LL))(*((void *)this + 4));
    Security::cfStringRelease((Security *)__p, v22);
    BOOL v24 = Security::CodeSigning::itemQualifiesForResourceExemption((char *)__p, v23);
    BOOL v26 = v24;
    unsigned int v27 = *((_DWORD *)this + 52) & 0x4000;
    if (v27) {
      BOOL v28 = 0;
    }
    else {
      BOOL v28 = v24;
    }
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v29 = __p;
    }
    else {
      uint64_t v29 = (void **)__p[0];
    }
    BOOL v30 = Security::CodeSigning::pathFileSystemUsesXattrFiles((Security::CodeSigning *)v29, v25);
    unint64_t v31 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      __int128 v81 = __p;
      if (SHIBYTE(__p[2]) < 0) {
        __int128 v81 = (void **)__p[0];
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 136316162;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v81;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v26;
      WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
      HIDWORD(buf.__r_.__value_.__r.__words[2]) = v27 >> 14;
      LOWORD(v121) = 1024;
      *(_DWORD *)((char *)&v121 + 2) = v28;
      WORD3(v121) = 1024;
      DWORD2(v121) = v30;
      _os_log_debug_impl( &dword_1804F4000,  v31,  OS_LOG_TYPE_DEBUG,  "performing resource validation for %s (%d, %d, %d, %d)",  (uint8_t *)&buf,  0x24u);
    }

    if (!*((void *)this + 73))
    {
      if ((a2 & 0x1000) != 0)
      {
        unsigned __int8 v38 = 0;
      }

      else
      {
        int v32 = (unsigned int *)(*(uint64_t (**)(void))(**((void **)this + 4) + 144LL))(*((void *)this + 4));
        Security::UnixPlusPlus::FileDesc::mediumType(&buf, (Security::UnixPlusPlus::FileDesc *)*v32);
        std::string::size_type size = buf.__r_.__value_.__s.__size_;
        if ((buf.__r_.__value_.__s.__size_ & 0x80u) != 0) {
          std::string::size_type size = buf.__r_.__value_.__l.__size_;
        }
        if (size == 11)
        {
          p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
          if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            p_std::string buf = &buf;
          }
          std::string::size_type v35 = p_buf->__r_.__value_.__r.__words[0];
          uint64_t v36 = *(std::string::size_type *)((char *)p_buf->__r_.__value_.__r.__words + 3);
          unsigned __int8 v38 = v35 == 0x74532064696C6F53LL && v36 == 0x6574617453206469LL;
        }

        else
        {
          unsigned __int8 v38 = 0;
        }
      }

      int v39 = (Security::CodeSigning::LimitedAsync *)operator new(0x10uLL);
      Security::CodeSigning::LimitedAsync::LimitedAsync(v39, v38);
      *((void *)this + 73) = v39;
    }

    memset(v111, 170, sizeof(v111));
    if (Security::CodeSigning::SecStaticCode::loadResources( this,  (const __CFDictionary **)&v111[3],  (const __CFDictionary **)&v111[1],  v111))
    {
      v110[1] = this;
      __int128 v40 = (char *)operator new(0x60uLL);
      *(void *)__int128 v40 = off_189678590;
      *((void *)v40 + 1) = this;
      *((void *)v40 + 2) = 0LL;
      *((_DWORD *)v40 + 6) = 0;
      Security::Mutex::Mutex((pthread_mutex_t *)(v40 + 32));
      *((void *)this + 25) = v40;
      if (!v28 && (a2 & 0x10) != 0)
      {
        uint64_t v41 = *(const __CFDictionary **)&v111[3];
        unsigned int v42 = v111[0];
        std::string::size_type v43 = (const __CFArray *)*((void *)this + 21);
        int v45 = (const __CFArray *)(*(uint64_t (**)(void))(**((void **)this + 4) + 240LL))(*((void *)this + 4));
        *(void *)v125 = v45;
        if (!v45)
        {
          Security::Syslog::notice( (Security::Syslog *)"code signing internal problem: diskRep returned no allowedResourceOmissions",  v44);
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
        }

        unint64_t v113 = 0xAAAAAAAAAAAAAAAALL;
        CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v45);
        unint64_t v113 = (unint64_t)MutableCopy;
        if (v43)
        {
          v127.length = CFArrayGetCount(v43);
          v127.location = 0LL;
          CFArrayAppendArray(MutableCopy, v43, v127);
          CFMutableArrayRef MutableCopy = (CFMutableArrayRef)v113;
        }

        CFIndex Count = CFArrayGetCount(MutableCopy);
        *((void *)&v98 + 1) = 0xAAAAAAAAAAAAAAAALL;
        int v99 = (void (*)(uint64_t, uint64_t, char, char *))0xAAAAAAAAAAAAAAAALL;
        if (v42 == 1) {
          ssize_t v48 = "^Resources/";
        }
        else {
          ssize_t v48 = "^.*";
        }
        *(void *)&__int128 v98 = 0xAAAAAAAAAAAAAAAALL;
        std::string::basic_string[abi:ne180100]<0>(&v98, v48);
        *(void *)&__int128 v114 = 0LL;
        *((void *)&v114 + 1) = &v114;
        *(void *)&__int128 v115 = 0x2000000000LL;
        BYTE8(v115) = 0;
        uint64_t v86 = 0LL;
        uint64_t v87 = (uint64_t)&v86;
        uint64_t v88 = 0x2000000000LL;
        LOBYTE(v89) = 0;
        unint64_t v49 = v113;
        CFDictionaryRef theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
        p_CFDictionaryRef theDict = (CFDictionaryRef *)0xAAAAAAAAAAAAAAAALL;
        Security::CFDictionary::CFDictionary( (Security::CFDictionary *)&theDict,  v41,  (Security::MacOSError *)0xFFFEFA13LL);
        buf.__r_.__value_.__r.__words[0] = MEMORY[0x1895F87A8];
        buf.__r_.__value_.__l.__size_ = 1174405120LL;
        buf.__r_.__value_.__l.__cap_ = (std::string::size_type)___ZN8Security11CodeSigning13SecStaticCode20hasWeakResourceRulesEPK14__CFDictionaryjPK9__CFArray_block_invoke;
        *(void *)&__int128 v121 = &unk_189678210;
        if (SHIBYTE(v99) < 0)
        {
          std::string::__init_copy_ctor_external( (std::string *)&v122[8],  (const std::string::value_type *)v98,  *((std::string::size_type *)&v98 + 1));
        }

        else
        {
          *(_OWORD *)&v122[8] = v98;
          *(void *)&v122[24] = v99;
        }

        *((void *)&v121 + 1) = &v114;
        *(void *)uint64_t v122 = &v86;
        __int128 v123 = v49;
        dispatch_group_t v124 = (dispatch_group_t)Count;
        context.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf;
        CFDictionaryApplyFunction( theDict,  (CFDictionaryApplierFunction)Security::CFDictionary::BlockApplier<__CFString const*,void const*>::apply,  &context);
        if (*(_BYTE *)(*((void *)&v114 + 1) + 24LL)) {
          BOOL v50 = *(_BYTE *)(v87 + 24) != 0;
        }
        else {
          BOOL v50 = 1;
        }
        if ((v122[31] & 0x80000000) != 0) {
          operator delete(*(void **)&v122[8]);
        }
        Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theDict);
        _Block_object_dispose(&v86, 8);
        _Block_object_dispose(&v114, 8);
        if (SHIBYTE(v99) < 0) {
          operator delete((void *)v98);
        }
        Security::CFRef<__CFArray *>::~CFRef((const void **)&v113);
        Security::CFRef<__CFArray const*>::~CFRef((const void **)v125);
        if (v50)
        {
          uint64_t v51 = 4294900283LL;
          uint64_t v52 = *((void *)this + 19);
          if (!v52) {
            goto LABEL_119;
          }
          unsigned int v53 = (int *)((char *)this + 152);
          do
          {
            int v54 = *(_DWORD *)(v52 + 28);
            BOOL v55 = v54 < -67013;
            if (v54 >= -67013) {
              unsigned int v56 = (uint64_t *)v52;
            }
            else {
              unsigned int v56 = (uint64_t *)(v52 + 8);
            }
            if (!v55) {
              unsigned int v53 = (int *)v52;
            }
            uint64_t v52 = *v56;
          }

          while (*v56);
        }

        if (v42 == 1)
        {
          uint64_t v57 = *((void *)this + 19);
          if (v57)
          {
            uint64_t v58 = (int *)((char *)this + 152);
            do
            {
              int v59 = *(_DWORD *)(v57 + 28);
              uint64_t v51 = 4294900289LL;
              BOOL v60 = v59 < -67007;
              if (v59 >= -67007) {
                uint64_t v61 = (uint64_t *)v57;
              }
              else {
                uint64_t v61 = (uint64_t *)(v57 + 8);
              }
              if (!v60) {
                uint64_t v58 = (int *)v57;
              }
              uint64_t v57 = *v61;
            }

            while (*v61);
            if (v58 != (int *)((char *)this + 152))
            {
              uint64_t v51 = 4294900289LL;
              if (v58[7] <= -67007) {
                goto LABEL_82;
              }
            }
          }

          else
          {
            uint64_t v51 = 4294900289LL;
          }

LABEL_100:
  if ((a2 & 0x10) != 0)
  {
    uint64_t v73 = *((void *)this + 4);
    __int128 v74 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    (*(void (**)(uint64_t, const UInt8 *, char *, void))(*(void *)v73 + 224LL))( v73,  v74,  (char *)this + 144,  *((unsigned int *)this + 52));
    Security::CodeSigning::SecStaticCode::reportProgress(this);
  }

  else if ((a2 & 0x2000) != 0)
  {
    uint64_t v71 = *((void *)this + 4);
    v72 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    (*(void (**)(uint64_t, const UInt8 *, char *, void))(*(void *)v71 + 232LL))( v71,  v72,  (char *)this + 144,  *((unsigned int *)this + 52));
  }

  buf.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v75 = *((void *)this + 72);
  if (v75)
  {
    uint64_t v76 = (*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)this + 16LL))(this);
    uint64_t v77 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void))(v75 + 16))( v75,  v76,  @"validated",  0LL);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v77;
    if (v77)
    {
      CFTypeID v78 = CFGetTypeID(v77);
      if (v78 == CFNumberGetTypeID()) {
        uint64_t v79 = Security::cfNumber<int>((const __CFNumber *)buf.__r_.__value_.__l.__data_);
      }
      else {
        uint64_t v79 = 4294900276LL;
      }
      Security::MacOSError::throwMe((Security::MacOSError *)v79);
    }
  }

  else
  {
    buf.__r_.__value_.__r.__words[0] = 0LL;
  }

  return Security::CFRef<void const*>::~CFRef((const void **)&buf.__r_.__value_.__l.__data_);
}

        secLogObjForScope("remotesigner");
        uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)unint64_t v113 = 67109378;
          *(_DWORD *)&v113[4] = v77;
          *(_WORD *)&v113[8] = 2112;
          *(void *)&v113[10] = v69;
          _os_log_debug_impl( &dword_1804F4000,  v79,  OS_LOG_TYPE_DEBUG,  "Passing out external digest: %d, %@",  v113,  0x12u);
        }

        CFTypeID v78 = (os_log_s *)((uint64_t (**)(void, void *, uint64_t))v101)[2](v101, v69, v77);
        if (v78)
        {
          secLogObjForScope("remotesigner");
          __int128 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)unint64_t v113 = 138412290;
            *(void *)&v113[4] = v78;
            _os_log_debug_impl(&dword_1804F4000, v80, OS_LOG_TYPE_DEBUG, "Got external signature blob: %@", v113, 0xCu);
          }

          -[os_log_s setSignature:](v94, "setSignature:", v78);
          __int128 v81 = v74;
          int v103 = v74;
          [v100 encodeMessageSecurityObject:&v103];
          uint64_t v82 = (id)objc_claimAutoreleasedReturnValue();
          __int128 v74 = v103;

          if (!v82 || v74)
          {
            secLogObjForScope("SecError");
            uint64_t v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)unint64_t v113 = 138412290;
              *(void *)&v113[4] = v74;
              _os_log_impl(&dword_1804F4000, v84, OS_LOG_TYPE_DEFAULT, "Failed to encode signature: %@", v113, 0xCu);
            }

            BOOL v60 = 4294900305LL;
          }

          else
          {
            secLogObjForScope("remotesigner");
            uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)unint64_t v113 = 138412290;
              *(void *)&v113[4] = v82;
              _os_log_debug_impl(&dword_1804F4000, v83, OS_LOG_TYPE_DEBUG, "Encoded CMS signature: %@", v113, 0xCu);
            }

            uint64_t v82 = v82;
            __int128 v74 = 0LL;
            BOOL v60 = 0LL;
            uint64_t v102 = (const __CFData *)v82;
          }
        }

        else
        {
          secLogObjForScope("SecError");
          uint64_t v82 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v60 = 4294900306LL;
          if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unint64_t v113 = 0;
            _os_log_impl( &dword_1804F4000,  (os_log_t)v82,  OS_LOG_TYPE_DEFAULT,  "External block did not provide a signature, failing.",  v113,  2u);
          }
        }

LABEL_116:
        char v70 = (_CMSEncoder *)v74;
LABEL_117:

        BOOL v30 = v70;
        unint64_t v67 = v90;
LABEL_118:

        __int128 v62 = v93;
LABEL_119:

        goto LABEL_61;
      }

      uint64_t v77 = 4LL;
    }

    goto LABEL_100;
  }

  secLogObjForScope("SecError");
  BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unint64_t v113 = 138412290;
    *(void *)&v113[4] = v24;
    uint64_t v57 = "Unable to perform remote signing with no certificates: %@";
    uint64_t v58 = v30;
    int v59 = 12;
    goto LABEL_59;
  }

void sub_180632710( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *__p, uint64_t a28, int a29, __int16 a30, char a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, void *a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, const void *a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49, uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,const void *a59,__int128 buf)
{
  if (a2)
  {
    Security::CFRef<__CFDictionary const*>::~CFRef(&a43);
    _Block_object_dispose(&a17, 8);
    _Block_object_dispose(&buf, 8);
    if (a32 < 0) {
      operator delete(__p);
    }
    Security::CFRef<__CFArray *>::~CFRef(&a59);
    Security::CFRef<__CFArray const*>::~CFRef((const void **)(v62 - 112));
    Security::CodeSigning::SecStaticCode::validateResources::_DTFrameCODESIGN_EVAL_STATIC_RESOURCES::~_DTFrameCODESIGN_EVAL_STATIC_RESOURCES();
    CFTypeRef v65 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      *(_BYTE *)(v60 + 192) = 1;
      *(_BYTE *)(v60 + 193) = (v61 & 8) != 0;
      *(_DWORD *)(v60 + 196) = (*(uint64_t (**)(void *))(*(void *)v65 + 24LL))(v65);
      __cxa_rethrow();
    }

    __int128 v66 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v60;
      _os_log_debug_impl( &dword_1804F4000,  v66,  OS_LOG_TYPE_DEBUG,  "%p executable validation threw non-common exception",  (uint8_t *)&buf,  0xCu);
    }

    *(_BYTE *)(v60 + 192) = 1;
    *(_BYTE *)(v60 + 193) = (v61 & 8) != 0;
    *(_DWORD *)(v60 + 196) = -67048;
    Security::Syslog::notice( (Security::Syslog *)"code signing internal problem: unknown exception thrown by validation",  v67);
    __cxa_rethrow();
  }

  _Unwind_Resume(exception_object);
}

void sub_1806329C4(_Unwind_Exception *a1)
{
}

void sub_1806329D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, void *a47, uint64_t a48, int a49, __int16 a50,char a51,char a52)
{
  if (a52 < 0) {
    operator delete(a47);
  }
  JUMPOUT(0x180632A10LL);
}

void sub_1806329E0()
{
}

void sub_1806329FC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void Security::CodeSigning::SecStaticCode::staticValidateCore( UInt8 *this, char a2, Security::CodeSigning::Requirement **a3)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  Security::CodeSigning::SecStaticCode::validateNonResourceComponents(this);
  uint64_t v6 = (const __CFData *)(*(uint64_t (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 80LL))( this,  4LL,  4294900235LL);
  uint64_t v7 = v6;
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(v6);
    CFIndex Length = CFDataGetLength(v7);
    unint64_t v10 = Length;
    if ((unint64_t)Length >= 4)
    {
      if (Length < 0) {
        std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(Length >> 2);
      uint64_t v13 = 0LL;
      do
      {
        *(_DWORD *)&v11[v13] = bswap32(*(_DWORD *)&BytePtr[v13]);
        v13 += 4LL;
      }

      while (4 * (v10 >> 2) != v13);
      uint64_t v12 = &v11[v13];
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
    }

    uint64_t v60 = v12;
    char v61 = a2;
    uint64_t v62 = (const Security::CodeSigning::SecRequirement *)a3;
    CFMutableDictionaryRef v64 = v11;
    uint64_t v14 = (char *)operator new(4uLL);
    *(_DWORD *)uint64_t v14 = 0;
    uint64_t v15 = v14 + 4;
    uint64_t v16 = 1LL;
    uint64_t v17 = v14 + 4;
    do
    {
      if ((_DWORD)v16 != 7
        || (uint64_t v18 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory( (Security::CodeSigning::SecStaticCode *)this,  1),  Security::CodeSigning::CodeDirectory::slotIsPresent(v18, -7)))
      {
        if ((*(uint64_t (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 80LL))(this, v16, 4294900235LL))
        {
          if (v15 >= v17)
          {
            uint64_t v19 = (v15 - v14) >> 2;
            unint64_t v20 = v19 + 1;
            if ((v17 - v14) >> 1 > v20) {
              unint64_t v20 = (v17 - v14) >> 1;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v21);
            }
            else {
              uint64_t v22 = 0LL;
            }
            uint64_t v23 = (char *)(v21 + 4 * v19);
            *(_DWORD *)uint64_t v23 = v16;
            BOOL v24 = v23 + 4;
            while (v15 != v14)
            {
              int v25 = *((_DWORD *)v15 - 1);
              v15 -= 4;
              *((_DWORD *)v23 - 1) = v25;
              v23 -= 4;
            }

            uint64_t v17 = (char *)(v21 + 4 * v22);
            if (v14) {
              operator delete(v14);
            }
            uint64_t v14 = v23;
            uint64_t v15 = v24;
          }

          else
          {
            *(_DWORD *)uint64_t v15 = v16;
            v15 += 4;
          }
        }
      }

      uint64_t v16 = (v16 + 1);
    }

    while ((_DWORD)v16 != 12);
    int v26 = *((_DWORD *)this + 30) - 1;
    if (v26 < 1)
    {
      uint64_t v29 = v15;
    }

    else
    {
      for (int i = 0; i != v26; ++i)
      {
        int v28 = i + 4096;
        if (v15 >= v17)
        {
          uint64_t v30 = (v15 - v14) >> 2;
          unint64_t v31 = v30 + 1;
          if ((v17 - v14) >> 1 > v31) {
            unint64_t v31 = (v17 - v14) >> 1;
          }
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v32);
          }
          else {
            uint64_t v33 = 0LL;
          }
          int v34 = (char *)(v32 + 4 * v30);
          *(_DWORD *)int v34 = v28;
          uint64_t v29 = v34 + 4;
          while (v15 != v14)
          {
            int v35 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v34 - 1) = v35;
            v34 -= 4;
          }

          uint64_t v17 = (char *)(v32 + 4 * v33);
          if (v14) {
            operator delete(v14);
          }
          uint64_t v14 = v34;
        }

        else
        {
          *(_DWORD *)uint64_t v15 = v28;
          uint64_t v29 = v15 + 4;
        }

        uint64_t v15 = v29;
      }
    }

    if (v29 >= v17)
    {
      uint64_t v38 = (v29 - v14) >> 2;
      unint64_t v39 = v38 + 1;
      BOOL v37 = v64;
      if ((v17 - v14) >> 1 > v39) {
        unint64_t v39 = (v17 - v14) >> 1;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v40) {
        unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v40);
      }
      a3 = (Security::CodeSigning::Requirement **)v62;
      a2 = v61;
      uint64_t v41 = (char *)(v40 + 4 * v38);
      *(_DWORD *)uint64_t v41 = 0x10000;
      uint64_t v36 = v41 + 4;
      while (v29 != v14)
      {
        int v42 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *((_DWORD *)v41 - 1) = v42;
        v41 -= 4;
      }

      if (v14) {
        operator delete(v14);
      }
      uint64_t v14 = v41;
    }

    else
    {
      *(_DWORD *)uint64_t v29 = 0x10000;
      uint64_t v36 = v29 + 4;
      a3 = (Security::CodeSigning::Requirement **)v62;
      BOOL v37 = v64;
      a2 = v61;
    }

    if (v60 - v37 != v36 - v14 || memcmp(v37, v14, v60 - v37)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0BLL);
    }
    if (v14) {
      operator delete(v14);
    }
    if (v37) {
      operator delete(v37);
    }
  }

  if ((a2 & 2) != 0) {
    goto LABEL_106;
  }
  if (!this[185])
  {
    v75[1] = this;
    std::string::size_type v43 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)this, 1);
    if (!v43) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
    }
    v75[0] = 0xAAAAAAAAFFFFFFFFLL;
    (*(void (**)(void **__return_ptr))(**((void **)this + 4) + 40LL))(__p);
    if (SHIBYTE(v67) >= 0) {
      uint64_t v44 = __p;
    }
    else {
      uint64_t v44 = (void **)__p[0];
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)v75, (const char *)v44, 0, 438);
    if (SHIBYTE(v67) < 0) {
      operator delete(__p[0]);
    }
    float v47 = Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)v75, v45, v46);
    ssize_t v48 = (Security::Universal *)(*(uint64_t (**)(void, float))(**((void **)this + 4) + 80LL))( *((void *)this + 4),  v47);
    if (v48)
    {
      off_t v49 = Security::Universal::archOffset(v48);
    }

    else
    {
      if (!(*(uint64_t (**)(void))(**((void **)this + 4) + 88LL))(*((void *)this + 4)))
      {
LABEL_87:
        uint64_t v63 = (const Security::CodeSigning::SecRequirement *)a3;
        int v65 = v43[39];
        if (v43[39]) {
          unint64_t v50 = 1 << v43[39];
        }
        else {
          unint64_t v50 = 0LL;
        }
        if (bswap32(*((_DWORD *)v43 + 2)) >> 8 >= 0x203 && (unint64_t v51 = *((void *)v43 + 7)) != 0) {
          unint64_t v52 = bswap64(v51);
        }
        else {
          unint64_t v52 = bswap32(*((_DWORD *)v43 + 8));
        }
        if (*((_DWORD *)v43 + 7))
        {
          unsigned int v53 = 0;
          int v54 = v75[0];
          char v55 = BYTE4(v75[0]);
          do
          {
            unsigned int v56 = v43;
            if (v50 >= v52) {
              size_t v57 = v52;
            }
            else {
              size_t v57 = v50;
            }
            uint64_t v76 = 0LL;
            uint64_t v77 = &v76;
            if (v65) {
              size_t v58 = v57;
            }
            else {
              size_t v58 = v52;
            }
            uint64_t v78 = 0x2000000000LL;
            char v79 = 1;
            int v73 = v54;
            char v74 = v55;
            std::set<unsigned int>::set[abi:ne180100]((uint64_t)v72, (void *)this + 43);
            __p[0] = (void *)MEMORY[0x1895F87A8];
            __p[1] = (void *)0x40000000;
            unint64_t v67 = ___ZN8Security11CodeSigning13SecStaticCode18validateExecutableEv_block_invoke;
            int v68 = &unk_189678140;
            unsigned int v71 = v53;
            char v69 = &v76;
            char v70 = this;
            Security::CodeSigning::CodeDirectory::multipleHashFileData((uint64_t)&v73, v58, v72, (uint64_t)__p);
            std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)v72[1]);
            if (!*((_BYTE *)v77 + 24)) {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0BLL);
            }
            v52 -= v58;
            _Block_object_dispose(&v76, 8);
            ++v53;
            std::string::size_type v43 = v56;
          }

          while (v53 < bswap32(*((_DWORD *)v56 + 7)));
        }

        this[185] = 1;
        *((_DWORD *)this + 47) = 0;
        Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)v75);
        Security::CodeSigning::SecStaticCode::validateExecutable(void)::_DTFrameCODESIGN_EVAL_STATIC_EXECUTABLE::~_DTFrameCODESIGN_EVAL_STATIC_EXECUTABLE();
        a3 = (Security::CodeSigning::Requirement **)v63;
        goto LABEL_105;
      }

      off_t v49 = (*(uint64_t (**)(void))(**((void **)this + 4) + 88LL))(*((void *)this + 4));
    }

    Security::UnixPlusPlus::FileDesc::seek((Security::UnixPlusPlus::FileDesc *)LODWORD(v75[0]), v49);
    goto LABEL_87;
  }

LABEL_105:
  uint64_t v59 = *((unsigned int *)this + 47);
  if ((_DWORD)v59) {
    goto LABEL_114;
  }
LABEL_106:
  if (a3 && !Security::CodeSigning::SecStaticCode::satisfiesRequirement((uint64_t)this, a3[2]))
  {
    uint64_t v59 = 4294900246LL;
LABEL_114:
    Security::MacOSError::throwMe((Security::MacOSError *)v59);
  }

void sub_1806330C8( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, void *__p, uint64_t a27, int a28, __int16 a29, char a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  if (a2)
  {
    unint64_t v40 = __cxa_begin_catch(a1);
    if (a2 == 4)
    {
      *(_BYTE *)(v37 + 185) = 1;
      *(_DWORD *)(v37 + 18_Block_object_dispose((const void *)(v1 - 48), 8) = (*(uint64_t (**)(void *))(*(void *)v40 + 24LL))(v40);
      __cxa_rethrow();
    }

    uint64_t v41 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)(v38 - 144) = 134217984;
      *(void *)(v38 - 140) = v37;
      _os_log_debug_impl( &dword_1804F4000,  v41,  OS_LOG_TYPE_DEBUG,  "%p executable validation threw non-common exception",  (uint8_t *)(v38 - 144),  0xCu);
    }

    *(_BYTE *)(v37 + 185) = 1;
    *(_DWORD *)(v37 + 18_Block_object_dispose((const void *)(v1 - 48), 8) = -67048;
    Security::Syslog::notice( (Security::Syslog *)"code signing internal problem: unknown exception thrown by validation",  v42);
    __cxa_rethrow();
  }

  JUMPOUT(0x1806334E4LL);
}

void sub_180633280()
{
}

void sub_1806332B4(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x1806334E4LL);
  }
  JUMPOUT(0x1806332ECLL);
}

void sub_1806332C8( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (v26) {
    operator delete(v26);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a2 == 2)
  {
    uint64_t v30 = (Security::CodeSigning::CSError *)__cxa_begin_catch(a1);
    unint64_t v31 = (off_t *)(*(uint64_t (**)(void))(**(void **)(v25 + 32) + 80LL))(*(void *)(v25 + 32));
    if (v31)
    {
      int v34 = Security::Universal::architecture(v31);
      uint64_t v35 = v34[1];
      unsigned int v36 = *(_DWORD *)(v35 + 4);
      LODWORD(v35) = *(_DWORD *)(v35 + 8);
      unsigned int v37 = bswap32(v36);
      if (*((_BYTE *)v34 + 33)) {
        uint64_t v38 = v37;
      }
      else {
        uint64_t v38 = v36;
      }
      unsigned int v39 = bswap32(v35);
      if (*((_BYTE *)v34 + 33)) {
        uint64_t v35 = v39;
      }
      else {
        uint64_t v35 = v35;
      }
      *(void *)(v27 - 152) = v38 | (v35 << 32);
      Security::Architecture::displayName((Security::Architecture *)&a14, (cpu_type_t *)(v27 - 152));
      Security::CFTempString::CFTempString<std::string>((CFStringRef *)(v27 - 144), (char *)&a14);
      Security::CodeSigning::CSError::augment( v30,  @"SecCSArchitecture",  *(void *)(v27 - 144),  v40,  v41,  v42,  v43,  v44);
      Security::CFRef<__CFString const*>::~CFRef((const void **)(v27 - 144));
      if (a19 < 0) {
        operator delete(a14);
      }
      (*(void (**)(void *))(*v34 + 8LL))(v34);
    }

    __cxa_rethrow();
  }

  if (a2 == 1)
  {
    unint64_t v32 = (unsigned int *)__cxa_begin_catch(a1);
    uint64_t v33 = (off_t *)(*(uint64_t (**)(void))(**(void **)(v25 + 32) + 80LL))(*(void *)(v25 + 32));
    if (!v33) {
      __cxa_rethrow();
    }
    int v45 = Security::Universal::architecture(v33);
    *(void *)(v27 - 144) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v46 = v45[1];
    unsigned int v47 = *(_DWORD *)(v46 + 4);
    LODWORD(v46) = *(_DWORD *)(v46 + 8);
    unsigned int v48 = bswap32(v47);
    if (*((_BYTE *)v45 + 33)) {
      uint64_t v49 = v48;
    }
    else {
      uint64_t v49 = v47;
    }
    unsigned int v50 = bswap32(v46);
    if (*((_BYTE *)v45 + 33)) {
      uint64_t v46 = v50;
    }
    else {
      uint64_t v46 = v46;
    }
    *(void *)(v27 - 152) = v49 | (v46 << 32);
    Security::Architecture::displayName((Security::Architecture *)&a20, (cpu_type_t *)(v27 - 152));
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)(v27 - 144), (char *)&a20);
    if (a25 < 0) {
      operator delete(a20);
    }
    (*(void (**)(void *))(*v45 + 8LL))(v45);
    Security::CodeSigning::CSError::throwMe( (Security::CodeSigning::CSError *)v32[36],  (uint64_t)@"SecCSArchitecture",  *(const __CFString **)(v27 - 144),  v51);
  }

  JUMPOUT(0x1806334E4LL);
}

void sub_18063345C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
}

void sub_1806334CC()
{
}

void sub_1806334DC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN8Security11CodeSigning13SecStaticCode14staticValidateEjPKNS0_14SecRequirementE_block_invoke( uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 48) & 0x41) == 0
    || (uint64_t v5 = (Security::Universal *)(*(uint64_t (**)(void))(**((void **)this + 4) + 80LL))(*((void *)this + 4)),
        (Security::Universal::bestNativeArch(v5) & 0xFFFFFF) != 0x12))
  {
    Security::CodeSigning::SecStaticCode::detachedSignature(this, *(const __CFData **)(v4 + 136));
    Security::CodeSigning::SecStaticCode::staticValidateCore( (UInt8 *)this,  *(_DWORD *)(a1 + 48),  *(Security::CodeSigning::Requirement ***)(a1 + 40));
  }

uint64_t ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke( uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v4 = *(Security::CodeSigning::SecStaticCode **)(a1 + 40);
  if (Security::CodeSigning::SecStaticCode::teamID(v4) && Security::CodeSigning::SecStaticCode::teamID(a2))
  {
    uint64_t v5 = (const char *)Security::CodeSigning::SecStaticCode::teamID(v4);
    uint64_t v6 = (const char *)Security::CodeSigning::SecStaticCode::teamID(a2);
    if (strcmp(v5, v6)) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v7 = Security::CodeSigning::SecStaticCode::teamID(v4);
    if (v7 != Security::CodeSigning::SecStaticCode::teamID(a2)) {
LABEL_4:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void Security::CodeSigning::SecStaticCode::visitOtherArchitectures(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 80LL))(*(void *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = (Security::Universal *)v4;
    uint64_t v59 = 0LL;
    unint64_t v60 = 0LL;
    size_t v58 = &v59;
    Security::Universal::architectures(v4, (uint64_t *)&v58);
    if (v60 >= 2)
    {
      __int128 v55 = 0xAAAAAAAAAAAAAA00LL;
      unint64_t v57 = 0xAAAAAAAAAAAAAA00LL;
      v53[0] = 0xFFFFFFFF00000000LL;
      v53[1] = 0LL;
      unint64_t v54 = 0LL;
      uint64_t v56 = 0LL;
      uint64_t v6 = Security::Universal::archOffset(v5);
      uint64_t v7 = (uint64_t)v58;
      if (v58 != &v59)
      {
        uint64_t v8 = v6;
        uint64_t v9 = (void *)((char *)v5 + 56);
        uint64_t v46 = v6;
        while (1)
        {
          unint64_t v10 = Security::Universal::archOffset( v5,  (const Security::Architecture *)*(unsigned int *)(v7 + 28),  *(_DWORD *)(v7 + 32));
          unint64_t v54 = v10;
          uint64_t v11 = (void *)*v9;
          if (!*v9) {
            goto LABEL_69;
          }
          uint64_t v12 = (void *)((char *)v5 + 56);
          do
          {
            unint64_t v13 = v11[4];
            BOOL v14 = v13 >= v10;
            if (v13 >= v10) {
              uint64_t v15 = v11;
            }
            else {
              uint64_t v15 = v11 + 1;
            }
            if (v14) {
              uint64_t v12 = v11;
            }
            uint64_t v11 = (void *)*v15;
          }

          while (*v15);
          if (v12 == v9 || v12[4] > v10) {
LABEL_69:
          }
            Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEF7A9LL);
          uint64_t v56 = v12[5];
          if (v10 == v8) {
            goto LABEL_61;
          }
          unint64_t v52 = (Security::CodeSigning::SecStaticCode *)0xAAAAAAAAAAAAAAAALL;
          uint64_t v16 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
          uint64_t v18 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x288,  *(void *)(v16 + 200),  v17);
          (*(void (**)(void **__return_ptr))(**(void **)(a1 + 32) + 40LL))(&__p);
          if ((v51 & 0x80u) == 0) {
            p_p = (char *)&__p;
          }
          else {
            p_p = (char *)__p;
          }
          unint64_t v20 = Security::CodeSigning::DiskRep::bestGuess(p_p, (unsigned int *)v53);
          Security::CodeSigning::SecStaticCode::SecStaticCode(v18, (Security::CodeSigning::DiskRep *)v20, 0);
          unint64_t v21 = (unsigned __int8 *)v18 - 8;
          do
            unsigned __int8 v22 = __ldaxr(v21);
          while (__stlxr(1u, v21));
          if ((v22 & 1) != 0)
          {
            uint64_t v23 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)v18 + 16LL))(v18);
            CFRetain(v23);
          }

          unint64_t v52 = v18;
          if ((char)v51 < 0)
          {
            operator delete(__p);
            uint64_t v18 = v52;
          }

          (*(void (**)(void **__return_ptr))(**((void **)v18 + 4) + 40LL))(&__p);
          (*(void (**)(void **__return_ptr))(**(void **)(a1 + 32) + 40LL))(v47);
          unsigned __int8 v24 = v51;
          if ((v51 & 0x80u) == 0) {
            size_t v25 = v51;
          }
          else {
            size_t v25 = __n;
          }
          unint64_t v26 = v48;
          int v27 = (char)v48;
          if ((v48 & 0x80u) != 0) {
            unint64_t v26 = (unint64_t)v47[1];
          }
          if (v25 != v26)
          {
            BOOL v36 = 0;
            goto LABEL_52;
          }

          int v28 = (v48 & 0x80u) == 0 ? v47 : (void **)v47[0];
          if (v51)
          {
            uint64_t v29 = v51 - 1LL;
            uint64_t v30 = &__p;
            do
            {
              int v32 = *(unsigned __int8 *)v30;
              uint64_t v30 = (void **)((char *)v30 + 1);
              int v31 = v32;
              int v34 = *(unsigned __int8 *)v28;
              int v28 = (void **)((char *)v28 + 1);
              int v33 = v34;
              BOOL v14 = v29-- != 0;
              char v35 = v14;
              BOOL v36 = v31 == v33;
            }

            while (v31 == v33 && (v35 & 1) != 0);
LABEL_47:
            if ((v27 & 0x80000000) == 0) {
              goto LABEL_48;
            }
            goto LABEL_52;
          }

          BOOL v36 = 1;
          if (((char)v48 & 0x80000000) == 0)
          {
LABEL_48:
            if ((v24 & 0x80) == 0) {
              goto LABEL_49;
            }
            goto LABEL_53;
          }

void sub_1806339D0( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::logic_error a13, int a14, __int16 a15, char a16, char a17, char a18)
{
}

const UInt8 *Security::CodeSigning::SecStaticCode::teamID(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v1 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
  if (bswap32(*((_DWORD *)v1 + 2)) >> 9 >= 0x101 && (unsigned int v2 = *((_DWORD *)v1 + 12)) != 0) {
    return &v1[bswap32(v2)];
  }
  else {
    return 0LL;
  }
}

BOOL Security::CodeSigning::SecStaticCode::satisfiesRequirement( uint64_t a1, Security::CodeSigning::Requirement *a2)
{
  CFDateRef v41 = 0LL;
  Security::CodeSigning::SecStaticCode::validateDirectory((UInt8 *)a1);
  double v4 = *(double *)(a1 + 384);
  if (v4 != 0.0) {
    CFDateRef v41 = CFDateCreate(0LL, v4);
  }
  uint64_t v40 = (const __CFURL *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v40 = (const __CFURL *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 48LL))(*(void *)(a1 + 32));
  memset(v39, 170, sizeof(v39));
  Security::cfString((Security *)v39, v40);
  if (*((_DWORD *)a2 + 2) == 0x2000000)
  {
    uint64_t v5 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 80LL))(*(void *)(a1 + 32));
    if (v5)
    {
      v26[0] = (Security::CodeSigning::CodeDirectory *)Security::Universal::bestNativeArch(v5);
      char v6 = (*(uint64_t (**)(void, Security::CodeSigning::CodeDirectory **))(**(void **)(a1 + 32) + 120LL))( *(void *)(a1 + 32),  v26);
    }

    else
    {
      char v6 = 0;
    }

    if (SHIBYTE(v39[2]) >= 0) {
      uint64_t v9 = (const char *)v39;
    }
    else {
      uint64_t v9 = (const char *)v39[0];
    }
    int v10 = openat_authenticated_np(-2, v9, 0, -1);
    BOOL v7 = v10 != -1;
    if (v10 != -1) {
      close(v10);
    }
    if (SHIBYTE(v39[2]) >= 0) {
      uint64_t v12 = (Security::CodeSigning *)v39;
    }
    else {
      uint64_t v12 = (Security::CodeSigning *)v39[0];
    }
    char v8 = Security::CodeSigning::isOnRootFilesystem(v12, v11);
    int v24 = Security::CodeSigning::SecStaticCode::validationCategory((CFDataRef *)a1);
  }

  else
  {
    char v6 = 0;
    BOOL v7 = 0;
    char v8 = 0;
    int v24 = 0;
  }

  unint64_t v13 = *(Security::CodeSigning::CodeDirectory **)(a1 + 624);
  BOOL v14 = (Security::CodeSigning::CodeDirectory *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  uint64_t v15 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::entitlements((UInt8 *)a1);
  uint64_t v23 = a2;
  uint64_t v16 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)a1, 1);
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)&v16[bswap32(*((_DWORD *)v16 + 5))]);
  uint64_t v17 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)a1, 1);
  char v18 = (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 248LL))(*(void *)(a1 + 32));
  CFDateRef v19 = v41;
  unint64_t v20 = Security::CodeSigning::SecStaticCode::teamID((Security::CodeSigning::SecStaticCode *)a1);
  v26[0] = v13;
  v26[1] = v14;
  v26[2] = v15;
  else {
    std::string __p = v25;
  }
  int v28 = v17;
  uint64_t v29 = 0LL;
  int v30 = 0;
  char v31 = v18;
  CFDateRef v32 = v19;
  int v33 = v20;
  char v34 = v6;
  char v35 = 0;
  BOOL v36 = v7;
  char v37 = v8;
  int v38 = v24;
  BOOL v21 = Security::CodeSigning::Requirement::validates(v23, v26);
  if (SHIBYTE(v39[2]) < 0) {
    operator delete(v39[0]);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&v40);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)&v41);
  return v21;
}

void sub_180633DF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
}

uint64_t Security::CodeSigning::SecStaticCode::validationCategory(CFDataRef *this)
{
  uint64_t result = *((unsigned int *)this + 159);
  if (!(_DWORD)result)
  {
    uint64_t v3 = Security::CodeSigning::SecStaticCode::cdHash(this);
    uint64_t v13 = 0LL;
    BytePtr = CFDataGetBytePtr(v3);
    CFIndex Length = CFDataGetLength(v3);
    if (!amfi_interface_cdhash_in_trustcache((uint64_t)BytePtr, Length, &v13) && v13 == 1)
    {
      uint64_t result = 1LL;
LABEL_27:
      *((_DWORD *)this + 159) = result;
      return result;
    }

    char v6 = (const __CFData *)Security::CodeSigning::SecStaticCode::signature((Security::CodeSigning::SecStaticCode *)this);
    BOOL v7 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)this, 0);
    if (v7 && (v7[15] & 2) != 0)
    {
      uint64_t result = 10LL;
      goto LABEL_27;
    }

    uint64_t v13 = 0LL;
    if ((os_variant_allows_internal_security_policies() & 1) != 0)
    {
      char v8 = 1;
    }

    else
    {
      if (SecAreQARootCertificatesEnabled_onceToken != -1) {
        dispatch_once(&SecAreQARootCertificatesEnabled_onceToken, &__block_literal_global_13141);
      }
      char v8 = SecAreQARootCertificatesEnabled_sQACertsEnabled != 0;
    }

    uint64_t v9 = CFDataGetBytePtr(v6);
    CFIndex v10 = CFDataGetLength(v6);
    int v11 = CTVerifyAmfiCertificateChain((uint64_t)v9, v10, v8, 16, &v13);
    uint64_t result = 10LL;
    *((_DWORD *)this + 159) = 10;
    if (!v11)
    {
      if ((v13 & 0x80000001140LL) != 0 || ((v13 & 0x100000002200LL) != 0 ? (char v12 = v8) : (char v12 = 0), (v12 & 1) != 0))
      {
        uint64_t result = 4LL;
        goto LABEL_27;
      }

      if ((v13 & 0x90) != 0)
      {
        uint64_t result = 3LL;
        goto LABEL_27;
      }

      if ((v13 & 0x10000) != 0)
      {
        uint64_t result = 5LL;
        goto LABEL_27;
      }

      if ((v13 & 0x400) == 0 && (v13 & 0xC000) != 0)
      {
        uint64_t result = 2LL;
        goto LABEL_27;
      }
    }
  }

  return result;
}

uint64_t Security::CodeSigning::SecStaticCode::entitlements(UInt8 *this)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!*((void *)this + 62))
  {
    Security::CodeSigning::SecStaticCode::validateDirectory(this);
    uint64_t v3 = (*(uint64_t (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 80LL))(this, 7LL, 4294900235LL);
    if (v3)
    {
      double v4 = (const __CFData *)v3;
      uint64_t v5 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::codeDirectory( (Security::CodeSigning::SecStaticCode *)this,  1);
      if (Security::CodeSigning::CodeDirectory::slotIsPresent(v5, -7)) {
        (*(void (**)(UInt8 *, uint64_t, uint64_t))(*(void *)this + 96LL))(this, 7LL, 4294900235LL);
      }
      BytePtr = CFDataGetBytePtr(v4);
      unsigned int v7 = bswap32(*((_DWORD *)BytePtr + 1));
      if (*(_DWORD *)BytePtr == 1920065274 && v7 > 7)
      {
        uint64_t v9 = BytePtr;
        CFIndex v10 = (os_log_s *)secLogObjForScope("staticCode");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          CFIndex v16 = bswap32(*((_DWORD *)v9 + 1));
          *(_DWORD *)std::string buf = 134218240;
          unsigned __int8 v22 = this;
          __int16 v23 = 2048;
          CFIndex v24 = v16;
          _os_log_debug_impl(&dword_1804F4000, v10, OS_LOG_TYPE_DEBUG, "%p loaded DER blob with length %zu", buf, 0x16u);
        }

        int v11 = (void *)MEMORY[0x1896135D8];
        if (!*((void *)this + 68))
        {
          CFDataRef v12 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v9 + 8,  bswap32(*((_DWORD *)v9 + 1)) - 8LL,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
          unint64_t v20 = (unint64_t)v12;
          uint64_t v13 = (os_log_s *)secLogObjForScope("staticCode");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            CFIndex Length = CFDataGetLength(v12);
            *(_DWORD *)std::string buf = 134218240;
            unsigned __int8 v22 = this;
            __int16 v23 = 2048;
            CFIndex v24 = Length;
            _os_log_debug_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEBUG,  "%p creating new CEQueryContext DER blob with length %lu",  buf,  0x16u);
          }

          if (CEManagedContextFromCFData() != *v11)
          {
            *((void *)this + 6_Block_object_dispose((const void *)(v1 - 48), 8) = 0LL;
            CFDateRef v19 = (os_log_s *)secLogObjForScope("SecError");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)std::string buf = 134217984;
              unsigned __int8 v22 = this;
              _os_log_impl( &dword_1804F4000,  v19,  OS_LOG_TYPE_DEFAULT,  "%p caused an error during CoreEntitlements parsing",  buf,  0xCu);
            }

            Security::MacOSError::throwMe((Security::MacOSError *)0xFFFF995DLL);
          }

          Security::CFRef<__CFData const*>::~CFRef((const void **)&v20);
        }

        unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
        if (CEQueryContextToCFDictionary() != *v11)
        {
          char v18 = (os_log_s *)secLogObjForScope("SecError");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 134217984;
            unsigned __int8 v22 = this;
            _os_log_impl( &dword_1804F4000,  v18,  OS_LOG_TYPE_DEFAULT,  "%p caused an error during CoreEntitlements dictionary generation",  buf,  0xCu);
          }

          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFF995DLL);
        }

        unint64_t v14 = v20;
        uint64_t v15 = (const void *)*((void *)this + 62);
        if (v15) {
          CFRelease(v15);
        }
        *((void *)this + 62) = v14;
      }

      else
      {
        *__error() = 22;
      }
    }
  }

  return *((void *)this + 62);
}

void sub_180634348(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

const void **___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_30(uint64_t a1)
{
  char v6 = *(const __CFURL **)(a1 + 40);
  v5[1] = -1431655766;
  Security::cfString((Security *)__p, v6);
  v5[0] = -1;
  if (v4 >= 0) {
    uint64_t v1 = __p;
  }
  else {
    uint64_t v1 = (void **)__p[0];
  }
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)v5, (const char *)v1, 0, 4096);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)v5);
  return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v6);
}

void sub_1806343F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)(v15 - 24));
  _Unwind_Resume(a1);
}

void ___ZN8Security11CodeSigning13SecStaticCode20hasWeakResourceRulesEPK14__CFDictionaryjPK9__CFArray_block_invoke( uint64_t a1, __CFString *a2, const void *a3)
{
  uint64_t size = __s1.__r_.__value_.__s.__size_;
  if ((__s1.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v7 = __s1.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v7 = __s1.__r_.__value_.__l.__size_;
  }
  uint64_t v8 = *(unsigned __int8 *)(a1 + 71);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0LL) {
    uint64_t v8 = *(void *)(a1 + 56);
  }
  if (v7 != v8)
  {
LABEL_16:
    uint64_t v13 = (const void *)*MEMORY[0x189604DE8];
    goto LABEL_17;
  }

  if (v9 >= 0) {
    CFIndex v10 = (unsigned __int8 *)(a1 + 48);
  }
  else {
    CFIndex v10 = *(unsigned __int8 **)(a1 + 48);
  }
  if ((__s1.__r_.__value_.__s.__size_ & 0x80) != 0)
  {
    BOOL v12 = memcmp(__s1.__r_.__value_.__l.__data_, v10, __s1.__r_.__value_.__l.__size_) == 0;
  }

  else
  {
    if (__s1.__r_.__value_.__s.__size_)
    {
      p_s1 = &__s1;
      while (p_s1->__r_.__value_.__s.__data_[0] == *v10)
      {
        p_s1 = (std::string *)((char *)p_s1 + 1);
        ++v10;
        if (!--size) {
          goto LABEL_15;
        }
      }

      goto LABEL_16;
    }

void sub_1806345CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t Security::CFDictionary::BlockApplier<__CFString const*,void const*>::apply( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)a3 + 16LL))();
}

void __copy_helper_block_e8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( std::string *a1, uint64_t a2)
{
  unsigned int v2 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }

  else
  {
    __int128 v3 = *(_OWORD *)(a2 + 48);
    v2->__r_.__value_.__l.__cap_ = *(void *)(a2 + 64);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }

void __destroy_helper_block_e8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
}

Security::CFDictionary *Security::CFDictionary::CFDictionary(Security::CFDictionary *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (!cf)
  {
    *((_DWORD *)this + 2) = -67053;
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
  }

  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 != CFDictionaryGetTypeID()) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
  }
  if (*(void *)this) {
    CFRetain(*(CFTypeRef *)this);
  }
  *((_DWORD *)this + 2) = -67053;
  return this;
}

void sub_1806346D4(_Unwind_Exception *a1)
{
}

const void *Security::CFDictionary::get<__CFBoolean const*>(uint64_t a1, const char *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)a1, key);
  Security::CFRef<__CFBoolean const*>::check<void const*>(Value, (Security::MacOSError *)*(unsigned int *)(a1 + 8));
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  return Value;
}

void sub_18063473C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

unsigned int *Security::CodeSigning::SecStaticCode::internalRequirements( Security::CodeSigning::SecStaticCode *this)
{
  uint64_t result = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *, uint64_t, uint64_t))(*(void *)this + 80LL))( this,  2LL,  4294900235LL);
  if (result)
  {
    uint64_t result = (unsigned int *)CFDataGetBytePtr((CFDataRef)result);
    if (*result != 17620730
      || (v2 = bswap32(result[2]), unint64_t v3 = 8LL * v2 + 12, v4 = bswap32(result[1]), v3 > v4))
    {
      *__error() = 22;
LABEL_12:
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14LL);
    }

    unint64_t v5 = (unint64_t)&result[2 * v2 + 3];
    while (1)
    {
      v5 -= 8LL;
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if (v6)
      {
        unint64_t v7 = bswap32(v6);
        BOOL v8 = v3 > v7 || v7 + 8 > v4;
      }
    }
  }

  return result;
}

_DWORD *Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>( uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  LODWORD(v4) = bswap32(v2);
  uint64_t v4 = v4 <= 1 ? 1LL : v4;
  unint64_t v5 = (unsigned int *)(a1 + 12);
  while (1)
  {
    unsigned int v6 = *v5;
    v5 += 2;
    if (bswap32(v6) == a2) {
      break;
    }
    if (v4 == ++v3) {
      return 0LL;
    }
  }

  unsigned int v7 = *(_DWORD *)(a1 + 8 * v3 + 16);
  if (!v7) {
    return 0LL;
  }
  uint64_t result = (_DWORD *)(bswap32(v7) + a1);
  if (result)
  {
    unsigned int v9 = bswap32(result[1]);
    if (*result != 843514 || v9 <= 0xB)
    {
      int v11 = __error();
      uint64_t result = 0LL;
      *int v11 = 22;
    }
  }

  return result;
}

void *Security::CodeSigning::SecStaticCode::designatedRequirement( Security::CodeSigning::SecStaticCode *this)
{
  unsigned int v2 = Security::CodeSigning::SecStaticCode::internalRequirements(this);
  if (!v2
    || (uint64_t v3 = Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>( (uint64_t)v2,  3)) == 0LL)
  {
    uint64_t v3 = (void *)*((void *)this + 64);
    if (!v3)
    {
      uint64_t v4 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 0);
      if (!v4 || (v4[15] & 2) == 0) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA00LL);
      }
      unint64_t v5 = malloc(0x400uLL);
      __int16 v23 = v5;
      *(void *)unint64_t v5 = 843514LL;
      _DWORD v5[2] = 0x1000000;
      uint64_t v24 = 0xC00000400LL;
      v22[0] = 0xAAAAAAAA0000000CLL;
      v22[1] = &v23;
      v22[2] = 7LL;
      uint64_t v16 = 0LL;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x3002000000LL;
      CFDateRef v19 = __Block_byref_object_copy__64;
      unint64_t v20 = __Block_byref_object_dispose__65;
      CFMutableArrayRef MutableCopy = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
      unsigned int v7 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, v6);
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v7);
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 0x40000000LL;
      v15[2] = ___ZN8Security11CodeSigning13SecStaticCode28defaultDesignatedRequirementEv_block_invoke;
      void v15[3] = &unk_189678300;
      v15[4] = &v16;
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 0x40000000LL;
      v25[2] = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
      v25[3] = &unk_189678518;
      v25[4] = v15;
      v25[5] = this;
      Security::CodeSigning::SecStaticCode::visitOtherArchitectures((uint64_t)this, (uint64_t)v25);
      CFIndex Count = CFArrayGetCount((CFArrayRef)v17[5]);
      if (Count >= 1)
      {
        for (CFIndex i = 0LL; i != Count; ++i)
        {
          Security::CodeSigning::Requirement::Maker::Chain::add(v22);
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v17[5], i);
          Security::CodeSigning::Requirement::Maker::require(&v23, 4LL);
          uint64_t v11 = HIDWORD(v24);
          HIDWORD(v24) += 4;
          *(_DWORD *)((char *)v23 + v11) = 0x8000000;
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          CFIndex Length = CFDataGetLength(ValueAtIndex);
          Security::CodeSigning::Requirement::Maker::putData( (Security::CodeSigning::Requirement::Maker *)&v23,  BytePtr,  Length);
        }
      }

      uint64_t v3 = v23;
      *((_DWORD *)v23 + 1) = bswap32(HIDWORD(v24));
      __int16 v23 = 0LL;
      _Block_object_dispose(&v16, 8);
      Security::CFRef<__CFArray *>::~CFRef((const void **)&MutableCopy);
      free(v23);
      *((void *)this + 64) = v3;
    }
  }

  return v3;
}

void sub_180634B00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__65(uint64_t a1)
{
  return Security::CFRef<__CFArray *>::~CFRef((const void **)(a1 + 40));
}

void ___ZN8Security11CodeSigning13SecStaticCode28defaultDesignatedRequirementEv_block_invoke( uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v3 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, (uint64_t)this);
  uint64_t v4 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0LL;
  CFArrayAppendArray(v4, v3, v5);
}

_DWORD *Security::CodeSigning::Requirement::Maker::Chain::add(_DWORD *this)
{
  int v1 = this[5];
  this[5] = v1 + 1;
  if (v1)
  {
    unsigned int v2 = this;
    unsigned int v3 = this[4];
    uint64_t v4 = *((void *)this + 1);
    Security::CodeSigning::Requirement::Maker::require((void *)v4, 4LL);
    this = memmove( (void *)(*v2 + *(void *)v4 + 4LL),  (const void *)(*v2 + *(void *)v4),  (*(_DWORD *)(v4 + 12) - *v2));
    *(_DWORD *)(v4 + 12) += 4;
    *(_DWORD *)(*v2 + *(void *)v4) = bswap32(v3);
  }

  return this;
}

uint64_t Security::CodeSigning::SecStaticCode::defaultDesignatedLightWeightCodeRequirement( Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t result = *((void *)this + 80);
  if (!result)
  {
    memset(__p, 170, sizeof(__p));
    unsigned int v3 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&v3[bswap32(*((_DWORD *)v3 + 5))]);
    uint64_t v4 = Security::CodeSigning::SecStaticCode::teamID(this);
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3002000000LL;
    int v27 = __Block_byref_object_copy__64;
    int v28 = __Block_byref_object_dispose__65;
    CFMutableArrayRef MutableCopy = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v6 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, v5);
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v6);
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 0x40000000LL;
    v23[2] = ___ZN8Security11CodeSigning13SecStaticCode43defaultDesignatedLightWeightCodeRequirementEv_block_invoke;
    v23[3] = &unk_189678328;
    v23[4] = &v24;
    *(void *)&__int128 buf = MEMORY[0x1895F87A8];
    *((void *)&buf + 1) = 0x40000000LL;
    CFDateRef v32 = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
    int v33 = &unk_189678518;
    char v34 = v23;
    char v35 = this;
    Security::CodeSigning::SecStaticCode::visitOtherArchitectures((uint64_t)this, (uint64_t)&buf);
    int v7 = Security::CodeSigning::SecStaticCode::validationCategory((CFDataRef *)this);
    if (SHIBYTE(__p[2]) >= 0) {
      BOOL v8 = __p;
    }
    else {
      BOOL v8 = (void **)__p[0];
    }
    switch(v7)
    {
      case 1:
        if (v8)
        {
          *(void *)&__int128 buf = &unk_18969C0A8;
          uint64_t v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          [NSString stringWithUTF8String:v8];
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          *((void *)&buf + 1) = v9;
          uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:&v40 count:2];
        }

        else
        {
          secLogObjForScope("SecError");
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "defaultPlatformLWCR";
            _os_log_impl( &dword_1804F4000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: signing identifier is NULL, cannot generate a LWCR",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v10 = 0LL;
        }

        goto LABEL_50;
      case 2:
        if (v8)
        {
          *(void *)&__int128 buf = &unk_18969C0C0;
          uint64_t v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          [NSString stringWithUTF8String:v8];
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          *((void *)&buf + 1) = v9;
          uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:&v40 count:2];
        }

        else
        {
          secLogObjForScope("SecError");
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "defaultTestflightLWCR";
            _os_log_impl( &dword_1804F4000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: signing identifier is NULL, cannot generate a LWCR",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v10 = 0LL;
        }

        goto LABEL_50;
      case 3:
        if (!v8)
        {
          secLogObjForScope("SecError");
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDevelopmentLWCR";
          CFDateRef v19 = "%s: signing identifier is NULL, cannot generate a LWCR";
          goto LABEL_40;
        }

        if (v4)
        {
          *(void *)&__int128 buf = &unk_18969C0D8;
          uint64_t v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          [NSString stringWithUTF8String:v8];
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          *((void *)&buf + 1) = v9;
          uint64_t v42 = @"team-identifier";
          [NSString stringWithUTF8String:v4];
          uint64_t v11 = (uint64_t (*)(uint64_t, Security::CodeSigning::SecStaticCode *))objc_claimAutoreleasedReturnValue();
          CFDateRef v32 = v11;
          uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:&v40 count:3];

          goto LABEL_50;
        }

        secLogObjForScope("SecError");
        unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDevelopmentLWCR";
          CFDateRef v19 = "%s: team identifier is NULL, cannot generate a LWCR";
LABEL_40:
          _os_log_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&buf, 0xCu);
        }

void sub_1806354A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  _Block_object_dispose(&a14, 8);
  Security::CFRef<__CFArray *>::~CFRef(v25);
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN8Security11CodeSigning13SecStaticCode43defaultDesignatedLightWeightCodeRequirementEv_block_invoke( uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  unsigned int v3 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, (uint64_t)this);
  uint64_t v4 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0LL;
  CFArrayAppendArray(v4, v3, v5);
}

void Security::CodeSigning::SecStaticCode::validateRequirements( Security::CodeSigning::SecStaticCode *this, int a2, Security::CodeSigning::SecStaticCode *a3, uint64_t a4)
{
  int v7 = Security::CodeSigning::SecStaticCode::internalRequirements(this);
  if (v7
    && (BOOL v8 = (Security::CodeSigning::Requirement *)Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>( (uint64_t)v7,  a2)) != 0LL)
  {
    if ((_DWORD)a4) {
      a4 = a4;
    }
    else {
      a4 = 4294900246LL;
    }
    if (!Security::CodeSigning::SecStaticCode::satisfiesRequirement((uint64_t)a3, v8)) {
LABEL_7:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)a4);
  }

  else if ((_DWORD)a4)
  {
    goto LABEL_7;
  }

  Security::CodeSigning::SecStaticCode::validateRequirements(SecRequirementType,Security::CodeSigning::SecStaticCode*,int)::_DTFrameCODESIGN_EVAL_STATIC_INTREQ::~_DTFrameCODESIGN_EVAL_STATIC_INTREQ();
}

void sub_18063564C(_Unwind_Exception *a1)
{
}

  ;
}

CFNumberRef ___ZN8Security11CodeSigning13SecStaticCode18signingInformationEj_block_invoke( uint64_t a1, unsigned int a2)
{
  unint64_t valuePtr = a2;
  CFNumberRef v2 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
  unint64_t valuePtr = (unint64_t)v2;
  Security::CFRef<__CFNumber const*>::~CFRef((const void **)&valuePtr);
  return v2;
}

void Security::CodeSigning::SecStaticCode::staticValidateResource( Security::CodeSigning::SecStaticCode *a1, std::string *a2, int a3, uint64_t a4)
{
  uint64_t v122 = *MEMORY[0x1895F89C0];
  memset(&v118, 0, sizeof(v118));
  memset(&__s, 0, sizeof(__s));
  (*(void (**)(_BYTE *__return_ptr))(**((void **)a1 + 4) + 40LL))(__p);
  if (__p[23] >= 0) {
    uint64_t v8 = __p[23];
  }
  else {
    uint64_t v8 = *(void *)&__p[8];
  }
  std::string::size_type size = a2->__r_.__value_.__s.__size_;
  int v10 = (char)size;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  if (v8 == size)
  {
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v11 = (const std::string::value_type *)a2->__r_.__value_.__r.__words[0];
    }
    if ((__p[23] & 0x80) != 0)
    {
      uint64_t v16 = *(void **)__p;
      int v17 = memcmp(*(const void **)__p, v11, *(size_t *)&__p[8]);
      operator delete(v16);
      if (!v17)
      {
LABEL_28:
        std::string::size_type v21 = 0LL;
        LOBYTE(v22) = 0;
LABEL_46:
        LODWORD(v25) = a3 | 2;
        goto LABEL_47;
      }
    }

    else
    {
      if (!__p[23]) {
        goto LABEL_28;
      }
      uint64_t v12 = 0LL;
      do
      {
        int v13 = __p[v12];
        int v14 = v11[v12];
      }

      while (v13 == v14 && __p[23] - 1LL != v12++);
      if (v13 == v14) {
        goto LABEL_28;
      }
    }
  }

  else if ((__p[23] & 0x80) != 0)
  {
    operator delete(*(void **)__p);
  }

  uint64_t v18 = (const __CFURL *)Security::CodeSigning::SecStaticCode::resourceBase(a1);
  Security::cfString((Security *)__p, v18);
  std::string v118 = *(std::string *)__p;
  if ((__p[23] & 0x80000000) != 0)
  {
    unint64_t v20 = (std::string *)v118.__r_.__value_.__r.__words[0];
    if (*(_BYTE *)(v118.__r_.__value_.__r.__words[0] + v118.__r_.__value_.__l.__size_ - 1) != 46) {
      goto LABEL_32;
    }
    uint64_t v19 = --v118.__r_.__value_.__l.__size_;
  }

  else
  {
    if (v118.__r_.__value_.__s.__data_[__p[23] - 1] != 46) {
      goto LABEL_32;
    }
    uint64_t v19 = __p[23] - 1LL;
    v118.__r_.__value_.__s.__size_ = (__p[23] - 1) & 0x7F;
    unint64_t v20 = &v118;
  }

  v20->__r_.__value_.__s.__data_[v19] = 0;
LABEL_32:
  else {
    std::string v116 = *a2;
  }
  else {
    std::string v115 = v118;
  }
  Security::CodeSigning::pathRemaining((std::string *)__p, &v116, &v115);
  std::string __s = *(std::string *)__p;
  __p[23] = 0;
  __p[0] = 0;
  std::string::size_type v23 = __s.__r_.__value_.__s.__size_;
  int v22 = (char)__s.__r_.__value_.__s.__size_;
  std::string::size_type v21 = __s.__r_.__value_.__l.__size_;
  if ((__s.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v24 = __s.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v24 = __s.__r_.__value_.__l.__size_;
  }
  if (v24) {
    goto LABEL_46;
  }
  char v34 = (void *)__s.__r_.__value_.__r.__words[0];
  memset(__p, 170, sizeof(__p));
  if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    char v35 = &v118;
  }
  else {
    char v35 = (std::string *)v118.__r_.__value_.__r.__words[0];
  }
  BOOL v36 = realpath_DARWIN_EXTSN((const char *)v35, __p);
  if (v36)
  {
    char v37 = (os_log_s *)secLogObjForScope("staticCode");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__b = 136315138;
      *(void *)&__b[4] = __p;
      _os_log_debug_impl( &dword_1804F4000,  v37,  OS_LOG_TYPE_DEBUG,  "Checking resolved path for containment: %s",  __b,  0xCu);
    }

    else {
      std::string v114 = *a2;
    }
    std::string::basic_string[abi:ne180100]<0>(&v113, __p);
    Security::CodeSigning::pathRemaining((std::string *)__b, &v114, &v113);
    if (v22 < 0) {
      operator delete(v34);
    }
    std::string __s = *(std::string *)__b;
    __b[23] = 0;
    __b[0] = 0;
    std::string::size_type v23 = __s.__r_.__value_.__s.__size_;
    std::string::size_type v21 = __s.__r_.__value_.__l.__size_;
    LOBYTE(v22) = __s.__r_.__value_.__s.__size_;
  }

  if ((v22 & 0x80u) == 0) {
    std::string::size_type v40 = v23;
  }
  else {
    std::string::size_type v40 = v21;
  }
  if (!v40)
  {
    BOOL v45 = (void *)__s.__r_.__value_.__r.__words[0];
    memset(__b, 170, sizeof(__b));
    uint64_t v46 = (const char *)a2;
    if (realpath_DARWIN_EXTSN(v46, __b))
    {
      unsigned int v47 = (os_log_s *)secLogObjForScope("staticCode");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)__b;
        _os_log_debug_impl( &dword_1804F4000,  v47,  OS_LOG_TYPE_DEBUG,  "Checking resolved resource path for containment: %s",  (uint8_t *)&buf,  0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v112, __b);
      std::string::basic_string[abi:ne180100]<0>(&v111, __p);
      Security::CodeSigning::pathRemaining(&buf, &v112, &v111);
      if ((v22 & 0x80) != 0) {
        operator delete(v45);
      }
      std::string __s = buf;
      buf.__r_.__value_.__s.__size_ = 0;
      buf.__r_.__value_.__s.__data_[0] = 0;
      std::string::size_type v23 = __s.__r_.__value_.__s.__size_;
      LOBYTE(v22) = __s.__r_.__value_.__s.__size_;
      std::string::size_type v21 = __s.__r_.__value_.__l.__size_;
      if ((__s.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v48 = __s.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v48 = __s.__r_.__value_.__l.__size_;
      }
      if (v48)
      {
        std::string::__assign_external(a2, __b);
        uint64_t v49 = (os_log_s *)secLogObjForScope("staticCode");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v50 = (std::string::size_type)a2;
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v50;
          _os_log_debug_impl( &dword_1804F4000,  v49,  OS_LOG_TYPE_DEBUG,  "Updated resource path: %s",  (uint8_t *)&buf,  0xCu);
        }
      }
    }
  }

  if ((v22 & 0x80u) == 0) {
    std::string::size_type v41 = v23;
  }
  else {
    std::string::size_type v41 = v21;
  }
  if (!v41)
  {
    uint64_t v86 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v87 = &v118;
      if ((v118.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v87 = (std::string *)v118.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string __p = 136315394;
      *(void *)&__p[4] = a2;
      *(_WORD *)&__p[12] = 2080;
      *(void *)&__p[14] = v87;
      _os_log_impl( &dword_1804F4000,  v86,  OS_LOG_TYPE_DEFAULT,  "Requested resource was not within the code object: %s, %s",  __p,  0x16u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
  }

  LODWORD(v25) = a3 | 2;
  if (v36)
  {
    memset(__p, 170, sizeof(__p));
    (*(void (**)(_BYTE *__return_ptr))(**((void **)a1 + 4) + 40LL))(__b);
    if (__b[23] >= 0) {
      uint64_t v42 = __b;
    }
    else {
      uint64_t v42 = *(const char **)__b;
    }
    uint64_t v43 = realpath_DARWIN_EXTSN(v42, __p);
    uint64_t v44 = v43;
    if ((__b[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__b);
      if (!v44) {
        goto LABEL_124;
      }
    }

    else if (!v43)
    {
      goto LABEL_124;
    }

    unsigned __int8 v51 = (const char *)a2;
    if (!strcmp(__p, v51)) {
      goto LABEL_125;
    }
LABEL_124:
    int v52 = 1;
    goto LABEL_127;
  }

LABEL_125:
  int v52 = 0;
  if ((v25 & 0x20000) == 0) {
    LODWORD(v25) = v25 & 0xFFFFFFFD;
  }
LABEL_127:
  std::string::size_type v53 = v22;
  if ((v22 & 0x80u) != 0) {
    std::string::size_type v53 = v21;
  }
  if (v53 == 10)
  {
    unint64_t v54 = (v22 & 0x80u) == 0 ? &__s : (std::string *)__s.__r_.__value_.__r.__words[0];
    unint64_t v55 = 0x496E666F2E706C69LL;
    unint64_t v56 = bswap64(v54->__r_.__value_.__r.__words[0]);
    if (v56 == 0x496E666F2E706C69LL
      && (v56 = bswap32(LOWORD(v54->__r_.__value_.__r.__words[1])) >> 16, unint64_t v55 = 29556LL, (_DWORD)v56 == 29556))
    {
      int v57 = 0;
    }

    else
    {
      int v57 = v56 < v55 ? -1 : 1;
    }

    if (!v57) {
      int v52 = 0;
    }
  }

  Security::CodeSigning::SecStaticCode::staticValidateCore((UInt8 *)a1, v25, 0LL);
  if (a4
    && !Security::CodeSigning::SecStaticCode::satisfiesRequirement( (uint64_t)a1,  *(Security::CodeSigning::Requirement **)(a4 + 16)))
  {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12LL);
  }

  if (v52)
  {
    if ((v25 & 0x4000) == 0 && Security::CodeSigning::itemQualifiesForResourceExemption((char *)a2, v58))
    {
      uint64_t v59 = (os_log_s *)secLogObjForScope("staticCode");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::string __p = 136315138;
        *(void *)&__p[4] = a2;
        _os_log_debug_impl( &dword_1804F4000,  v59,  OS_LOG_TYPE_DEBUG,  "Requested resource was on root filesystem: %s",  __p,  0xCu);
      }

      goto LABEL_225;
    }

    memset(v110, 170, sizeof(v110));
    if (!Security::CodeSigning::SecStaticCode::loadResources( a1,  (const __CFDictionary **)&v110[3],  (const __CFDictionary **)&v110[1],  v110)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA10LL);
    }
    v109[0] = 0LL;
    v109[1] = 0LL;
    unsigned __int8 v108 = v109;
    *(void *)&__int128 v60 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__b[64] = v60;
    *(_OWORD *)&__b[80] = v60;
    *(_OWORD *)&__b[32] = v60;
    *(_OWORD *)&__b[48] = v60;
    *(_OWORD *)__b = v60;
    *(_OWORD *)&__b[16] = v60;
    Security::CodeSigning::ResourceBuilder::ResourceBuilder( (std::string::size_type)__b,  (uint64_t)&v118,  &v118,  *(const void **)&v110[3],  (v25 & 0x10) != 0,  (uint64_t)&v108);
    (*(void (**)(void *, _BYTE *))(**((void **)a1 + 4) + 64LL))(*((void **)a1 + 4), __b);
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v107, __s.__r_.__value_.__l.__data_, v21);
    }
    else {
      std::string v107 = __s;
    }
    uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule((uint64_t)__b, (uint64_t)&v107);
    uint64_t v62 = Rule;
    if ((char)v107.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v107.__r_.__value_.__l.__data_);
      if (!v62) {
        goto LABEL_159;
      }
    }

    else if (!Rule)
    {
      goto LABEL_159;
    }

    if ((*(_BYTE *)(v62 + 36) & 0x12) != 0)
    {
      uint64_t v88 = (os_log_s *)secLogObjForScope("SecError");
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        int v89 = *(_DWORD *)(v62 + 36);
        *(_DWORD *)std::string __p = 67109120;
        *(_DWORD *)&__p[4] = v89;
        _os_log_impl(&dword_1804F4000, v88, OS_LOG_TYPE_DEFAULT, "Requested resource was not sealed: %d", __p, 8u);
      }

      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0FLL);
    }

        break;
      case 4u:
        char v35 = (os_log_s *)secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v56 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v56;
          _os_log_debug_impl( &dword_1804F4000,  v35,  OS_LOG_TYPE_DEBUG,  "cannot read directory %s",  (uint8_t *)&v84,  0xCu);
        }

        if (*(_BYTE *)(a1 + 88)) {
          goto LABEL_145;
        }
        goto LABEL_125;
      case 6u:
        int v32 = (os_log_s *)secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v54 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v54;
          _os_log_debug_impl(&dword_1804F4000, v32, OS_LOG_TYPE_DEBUG, "leaving %s", (uint8_t *)&v84, 0xCu);
          if ((v5 & 1) == 0) {
            goto LABEL_116;
          }
        }

        else if ((v5 & 1) == 0)
        {
          goto LABEL_116;
        }

        if ((v83.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          int v33 = v83.__r_.__value_.__s.__size_;
        }
        else {
          int v33 = v83.__r_.__value_.__l.__size_;
        }
        if (v33 == strlen((const char *)p_str)
          && ((v83.__r_.__value_.__s.__size_ & 0x80u) == 0
            ? (char v34 = &v83)
            : (char v34 = (std::string *)v83.__r_.__value_.__r.__words[0]),
              !memcmp(v34, p_str, v33)))
        {
          std::string::size_type v50 = (os_log_s *)secLogObjForScope("rdirenum");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v59 = &v83;
            if ((v83.__r_.__value_.__s.__size_ & 0x80u) != 0) {
              uint64_t v59 = (std::string *)v83.__r_.__value_.__r.__words[0];
            }
            LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v59;
            _os_log_debug_impl( &dword_1804F4000,  v50,  OS_LOG_TYPE_DEBUG,  "exiting excluded path: %s",  (uint8_t *)&v84,  0xCu);
          }

          CFRange v5 = 0;
          if ((char)v83.__r_.__value_.__s.__size_ < 0)
          {
            *v83.__r_.__value_.__l.__data_ = 0;
            v83.__r_.__value_.__l.__size_ = 0LL;
          }

          else
          {
            v83.__r_.__value_.__s.__data_[0] = 0;
            v83.__r_.__value_.__s.__size_ = 0;
          }
        }

        else
        {
          CFRange v5 = 1;
        }

        goto LABEL_125;
      case 8u:
        BOOL v36 = (os_log_s *)secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          int v57 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v57;
          _os_log_debug_impl(&dword_1804F4000, v36, OS_LOG_TYPE_DEBUG, "file %s", (uint8_t *)&v84, 0xCu);
        }

        ++GKBIS_Num_files;
        if (!strncasecmp(v7->fts_name, "._", 2uLL)) {
          ++GKBIS_Dot_underbar_Present;
        }
        if (!strcasecmp(v7->fts_name, ".DS_Store")) {
          ++GKBIS_DS_Store_Present;
        }
        std::string::basic_string[abi:ne180100]<0>(v80, (char *)p_str);
        char v37 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)v80);
        if (v81 < 0) {
          operator delete(v80[0]);
        }
        if ((v37 == 0) | v5 & 1 || (int v38 = *(unsigned int *)(v37 + 36), (v38 & 0x12) != 0))
        {
          if (a3)
          {
            int v39 = v37 ? *(unsigned int *)(v37 + 36) : 0LL;
            std::string::basic_string[abi:ne180100]<0>(v76, (char *)p_str);
            (*(void (**)(uint64_t, FTSENT *, uint64_t, void *, uint64_t))(a3 + 16))(a3, v7, v39, v76, v37);
            if (v77 < 0)
            {
              uint64_t v44 = (void *)v76[0];
              goto LABEL_104;
            }
          }

          goto LABEL_125;
        }

        std::string::basic_string[abi:ne180100]<0>(v78, (char *)p_str);
        (*(void (**)(uint64_t, FTSENT *, uint64_t, void *, uint64_t))(a2 + 16))(a2, v7, v38, v78, v37);
        if ((v79 & 0x80000000) == 0) {
          goto LABEL_116;
        }
        unsigned int v47 = (void *)v78[0];
        goto LABEL_115;
      case 0xCu:
        std::string::size_type v40 = (os_log_s *)secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          size_t v58 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v58;
          _os_log_debug_impl(&dword_1804F4000, v40, OS_LOG_TYPE_DEBUG, "symlink %s", (uint8_t *)&v84, 0xCu);
        }

        ++GKBIS_Num_symlinks;
        if (!strcasecmp(v7->fts_name, ".DS_Store"))
        {
          char v61 = -67012;
LABEL_144:
          uint64_t v62 = v61;
LABEL_145:
          Security::MacOSError::throwMe((Security::MacOSError *)v62);
        }

        std::string::basic_string[abi:ne180100]<0>(__p, (char *)p_str);
        std::string::size_type v41 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)__p);
        if (v75 < 0) {
          operator delete(__p[0]);
        }
        if ((v41 == 0) | v5 & 1 || (uint64_t v42 = *(_DWORD *)(v41 + 36), (v42 & 0x12) != 0))
        {
          if (a3)
          {
            uint64_t v43 = v41 ? *(unsigned int *)(v41 + 36) : 0LL;
            std::string::basic_string[abi:ne180100]<0>(v70, (char *)p_str);
            (*(void (**)(uint64_t, FTSENT *, uint64_t, void **, uint64_t))(a3 + 16))(a3, v7, v43, v70, v41);
            if (v71 < 0)
            {
              uint64_t v44 = v70[0];
LABEL_104:
              operator delete(v44);
            }
          }
        }

        else
        {
          std::string::basic_string[abi:ne180100]<0>(v72, (char *)p_str);
          (*(void (**)(uint64_t, FTSENT *, void, void **, uint64_t))(a2 + 16))( a2,  v7,  v42 & 0xFFFFFFFB,  v72,  v41);
          if (v73 < 0)
          {
            unsigned int v47 = v72[0];
LABEL_115:
            operator delete(v47);
          }

LABEL_159:
    uint64_t v63 = *(const __CFDictionary **)&v110[1];
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v106, __s.__r_.__value_.__l.__data_, v21);
    }
    else {
      std::string v106 = __s;
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)__p, (char *)&v106);
    Value = CFDictionaryGetValue(v63, *(const void **)__p);
    Security::CFRef<__CFString const*>::~CFRef((const void **)__p);
    if ((char)v106.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v106.__r_.__value_.__l.__data_);
      if (Value) {
        goto LABEL_164;
      }
    }

    else if (Value)
    {
LABEL_164:
      std::string::size_type v105 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
      if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v65 = (const char *)a2;
      }
      else {
        int v65 = (const char *)a2->__r_.__value_.__r.__words[0];
      }
      Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v105, v65, 0x200000, 438);
      *(void *)&__int128 v66 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v66 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&__p[112] = v66;
      *(_OWORD *)&__p[128] = v66;
      *(_OWORD *)&__p[80] = v66;
      *(_OWORD *)&__p[96] = v66;
      *(_OWORD *)&__p[48] = v66;
      *(_OWORD *)&__p[64] = v66;
      *(_OWORD *)&__p[16] = v66;
      *(_OWORD *)&__p[32] = v66;
      *(_OWORD *)std::string __p = v66;
      Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)v105, (stat *)__p);
      if ((v25 & 0x20000) != 0) {
        uint64_t v25 = v25;
      }
      else {
        uint64_t v25 = v25 & 0xFFFFFFFD;
      }
      *(void *)&__int128 v67 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string __p = v67;
      *(_OWORD *)&__p[16] = v67;
      Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)__p, Value);
      if ((__p[24] & 4) != 0)
      {
        buf.__r_.__value_.__r.__words[0] = 0LL;
        if (SecRequirementCreateWithStringAndErrors(*(CFStringRef *)&__p[8], 0, 0LL, (SecRequirementRef *)&buf)) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11LL);
        }
        unint64_t v104 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v68 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
        uint64_t v70 = Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(void *)(v68 + 200), v69);
        if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
          unsigned int v71 = (char *)a2;
        }
        else {
          unsigned int v71 = (char *)a2->__r_.__value_.__r.__words[0];
        }
        v72 = Security::CodeSigning::DiskRep::bestGuess(v71, 0LL);
        Security::CodeSigning::SecStaticCode::SecStaticCode( (Security::CodeSigning::SecStaticCode *)v70,  (Security::CodeSigning::DiskRep *)v72,  0);
        int v73 = (unsigned __int8 *)(v70 - 8);
        do
          unsigned __int8 v74 = __ldaxr(v73);
        while (__stlxr(1u, v73));
        if ((v74 & 1) != 0)
        {
          uint64_t v75 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v70 + 16LL))(v70);
          CFRetain(v75);
        }

        unint64_t v104 = v70;
        Security::CodeSigning::SecStaticCode::initializeFromParent((Security::CodeSigning::SecStaticCode *)v70, a1);
        *(_DWORD *)(v70 + 20_Block_object_dispose((const void *)(v1 - 48), 8) = v25;
        (*(void (**)(void **__return_ptr))(**(void **)(v70 + 32) + 40LL))(v102);
        uint64_t v77 = Security::CodeSigning::SecRequirement::required( (Security::CodeSigning::SecRequirement *)buf.__r_.__value_.__l.__data_,  v76);
        Security::CodeSigning::SecStaticCode::staticValidateResource(v70, v102, v25, v77);
        if (v103 < 0) {
          operator delete(v102[0]);
        }
        Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v104);
        Security::CFRef<__SecRequirement *>::~CFRef((const void **)&buf.__r_.__value_.__l.__data_);
      }

      else
      {
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)off_189678548;
        buf.__r_.__value_.__l.__size_ = (std::string::size_type)a1;
        if ((v22 & 0x80) != 0) {
          std::string::__init_copy_ctor_external(&v101, __s.__r_.__value_.__l.__data_, v21);
        }
        else {
          std::string v101 = __s;
        }
        Security::CodeSigning::SecStaticCode::validateResource((uint64_t)a1);
      }

      Security::CFRef<__CFDictionary const*>::~CFRef((const void **)__p);
      Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v105);
LABEL_224:
      Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)__b);
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v109[0]);
      goto LABEL_225;
    }

    *(void *)std::string __p = 0LL;
    *(void *)&__p[8] = __p;
    *(void *)&__p[16] = 0x2000000000LL;
    __p[24] = 0;
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v100, __s.__r_.__value_.__l.__data_, v21);
    }
    else {
      std::string v100 = __s;
    }
    v91[0] = MEMORY[0x1895F87A8];
    v91[1] = 1174405120LL;
    uint64_t v92 = ___ZN8Security11CodeSigning13SecStaticCode22staticValidateResourceENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEjPKNS0_14SecRequirementE_block_invoke;
    unsigned __int8 v93 = &unk_1896784E0;
    unsigned int v95 = a1;
    BOOL v96 = v63;
    int v94 = __p;
    int v98 = v25;
    else {
      std::string v97 = *a2;
    }
    unsigned int v99 = v110[0];
    if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v78 = v100.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v78 = v100.__r_.__value_.__l.__size_;
    }
    while (1)
    {
      unsigned __int8 v79 = v100.__r_.__value_.__s.__size_;
      unint64_t v81 = v100.__r_.__value_.__l.__size_;
      uint64_t v80 = (std::string *)v100.__r_.__value_.__r.__words[0];
      if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0)
      {
        uint64_t v80 = &v100;
        unint64_t v81 = v100.__r_.__value_.__s.__size_;
      }

      if (v81 > v78) {
        unint64_t v81 = v78 + 1;
      }
      do
      {
        if (!v81) {
          goto LABEL_214;
        }
        int v82 = v80->__r_.__value_.__s.__data_[--v81];
      }

      while (v82 != 47);
      std::string::size_type v78 = v81 - 1;
      if (v81 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        break;
      }
      if ((char)v100.__r_.__value_.__s.__size_ < 0)
      {
        if (v100.__r_.__value_.__l.__size_ < v81) {
LABEL_247:
        }
          std::string::__throw_out_of_range[abi:ne180100]();
        uint64_t v83 = (std::string *)v100.__r_.__value_.__r.__words[0];
        v100.__r_.__value_.__l.__size_ = v81;
      }

      else
      {
        if (v81 > v100.__r_.__value_.__s.__size_) {
          goto LABEL_247;
        }
        v100.__r_.__value_.__s.__size_ = v81 & 0x7F;
        uint64_t v83 = &v100;
      }

      v83->__r_.__value_.__s.__data_[v81] = 0;
      else {
        std::string buf = v100;
      }
      int v84 = v92((uint64_t)v91, &buf);
      int v85 = v84;
      if ((char)buf.__r_.__value_.__s.__size_ < 0)
      {
        operator delete(buf.__r_.__value_.__l.__data_);
        if (v85)
        {
LABEL_213:
          unsigned __int8 v79 = v100.__r_.__value_.__s.__size_;
          break;
        }
      }

      else if (v84)
      {
        goto LABEL_213;
      }
    }

LABEL_214:
    if ((v79 & 0x80) != 0) {
      operator delete(v100.__r_.__value_.__l.__data_);
    }
    if (!*(_BYTE *)(*(void *)&__p[8] + 24LL))
    {
      v90 = (os_log_s *)secLogObjForScope("SecError");
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)a2;
        _os_log_impl( &dword_1804F4000,  v90,  OS_LOG_TYPE_DEFAULT,  "Requested resource was not found: %s",  (uint8_t *)&buf,  0xCu);
      }

      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12LL);
    }

    _Block_object_dispose(__p, 8);
    goto LABEL_224;
  }

LABEL_225:
  if ((v22 & 0x80) != 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_1806365A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25, uint64_t a26, uint64_t a27, void *a28, uint64_t a29, uint64_t a30, uint64_t a31, __int16 a32, void *a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, void *a46, uint64_t a47, uint64_t a48, void *a49, uint64_t a50,uint64_t a51,void *a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (v71 < 0) {
    operator delete(__p);
  }
  if (SLOBYTE(STACK[0x207]) < 0) {
    operator delete(a71);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN8Security11CodeSigning13SecStaticCode22staticValidateResourceENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEjPKNS0_14SecRequirementE_block_invoke( uint64_t a1, std::string *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(Security::CodeSigning::SecStaticCode **)(a1 + 40);
  CFRange v5 = *(const __CFDictionary **)(a1 + 48);
  else {
    std::string v36 = *a2;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&v36);
  Value = CFDictionaryGetValue(v5, *(const void **)&key.st_dev);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  if ((char)v36.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v36.__r_.__value_.__l.__data_);
    if (Value) {
      goto LABEL_6;
    }
    return 0LL;
  }

  if (!Value) {
    return 0LL;
  }
LABEL_6:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  CFURLRef CFURL = (const __CFURL *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = Security::CodeSigning::SecStaticCode::resourceBase(v4);
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unsigned int v9 = (Security *)a2;
  }
  else {
    unsigned int v9 = (Security *)a2->__r_.__value_.__r.__words[0];
  }
  CFURLRef CFURL = Security::makeCFURL(v9, 0LL, v7, v8);
  memset(v34, 170, sizeof(v34));
  Security::cfString((Security *)v34, CFURL);
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)text = v10;
  __int128 v33 = v10;
  Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)text, Value);
  unsigned int v11 = DWORD2(v33);
  if ((BYTE8(v33) & 4) != 0)
  {
    *(void *)&key.st_dev = 0LL;
    if (SecRequirementCreateWithStringAndErrors(text[1], 0, 0LL, (SecRequirementRef *)&key)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11LL);
    }
    int v31 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v12 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
    int v14 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x288,  *(void *)(v12 + 200),  v13);
    if (SHIBYTE(v34[2]) >= 0) {
      id v15 = (char *)v34;
    }
    else {
      id v15 = (char *)v34[0];
    }
    uint64_t v16 = Security::CodeSigning::DiskRep::bestGuess(v15, 0LL);
    Security::CodeSigning::SecStaticCode::SecStaticCode(v14, (Security::CodeSigning::DiskRep *)v16, 0);
    int v17 = (unsigned __int8 *)v14 - 8;
    do
      unsigned __int8 v18 = __ldaxr(v17);
    while (__stlxr(1u, v17));
    if ((v18 & 1) != 0)
    {
      uint64_t v19 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)v14 + 16LL))(v14);
      CFRetain(v19);
    }

    int v31 = v14;
    Security::CodeSigning::SecStaticCode::initializeFromParent(v14, v4);
    *((_DWORD *)v14 + 52) = *(_DWORD *)(a1 + 80);
    else {
      std::string v30 = *(std::string *)(a1 + 56);
    }
    uint64_t v25 = *(unsigned int *)(a1 + 80);
    uint64_t v26 = Security::CodeSigning::SecRequirement::required(*(Security::CodeSigning::SecRequirement **)&key.st_dev, v20);
    Security::CodeSigning::SecStaticCode::staticValidateResource(v14, &v30, v25, v26);
    Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v31);
    Security::CFRef<__SecRequirement *>::~CFRef((const void **)&key);
  }

  else
  {
    if (!(void)v33)
    {
      int v28 = (os_log_s *)secLogObjForScope("SecError");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        key.st_dev = 138412290;
        *(void *)&key.st_mode = Value;
        _os_log_impl( &dword_1804F4000,  v28,  OS_LOG_TYPE_DEFAULT,  "Unexpected item hit traversing resource: %@",  (uint8_t *)&key,  0xCu);
      }

      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12LL);
    }

    int v22 = operator new(0x10uLL);
    *int v22 = off_189678548;
    v22[1] = v4;
    int v31 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
    if (SHIBYTE(v34[2]) >= 0) {
      std::string::size_type v23 = v34;
    }
    else {
      std::string::size_type v23 = (void **)v34[0];
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v31, (const char *)v23, 0x200000, 438);
    v24.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v24.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&key.st_blkstd::string::size_type size = v24;
    *(timespec *)key.st_qspare = v24;
    key.st_birthtimespec = v24;
    *(timespec *)&key.st_std::string::size_type size = v24;
    key.st_mtimespec = v24;
    key.st_ctimespec = v24;
    *(timespec *)&key.st_uid = v24;
    key.st_atimespec = v24;
    *(timespec *)&key.st_dev = v24;
    Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)v31, &key);
    else {
      std::string __p = *a2;
    }
    Security::CodeSigning::SecStaticCode::validateResource((uint64_t)v4);
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v31);
  }

  uint64_t v21 = (v11 >> 2) & 1;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)text);
  if (SHIBYTE(v34[2]) < 0) {
    operator delete(v34[0]);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&CFURL);
  return v21;
}

void sub_180636BF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35, char a36, void *a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, uint64_t a43, char a44)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1, uint64_t a2)
{
  CFNumberRef v2 = (std::string *)(a1 + 56);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }

  else
  {
    __int128 v3 = *(_OWORD *)(a2 + 56);
    v2->__r_.__value_.__l.__cap_ = *(void *)(a2 + 72);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }

void __destroy_helper_block_e8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
}

BOOL Security::CodeSigning::Requirement::validates( Security::CodeSigning::Requirement *this, Security::CodeSigning::CodeDirectory **a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  unsigned int v3 = *((_DWORD *)this + 2);
  unsigned int v4 = bswap32(v3);
  if (v4 != 2)
  {
    if (v4 != 1) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA15LL);
    }
    *(void *)std::string buf = this;
    *(_DWORD *)&buf[8] = 12;
    *(void *)&buf[16] = a2;
    return Security::CodeSigning::Requirement::Interpreter::eval( (Security::CodeSigning::Requirement::Interpreter *)buf,  1000) != 0;
  }

  if (v3 != 0x2000000) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14LL);
  }
  *(void *)std::string buf = this;
  *(void *)&buf[8] = 0xAAAAAAAA0000000CLL;
  unint64_t v35 = 0LL;
  __std::string::size_type size = 0LL;
  Security::CodeSigning::Requirement::Reader::getData( (Security::CodeSigning::Requirement::Reader *)buf,  (const void **)&__size,  &v35);
  CFDataRef v6 = CFDataCreate(0LL, (const UInt8 *)__size, v35);
  CFDataRef v34 = v6;
  uint64_t v7 = MEMORY[0x186DFF9D0]();
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::string context = (void *)v7;
  uint64_t v9 = os_variant_allows_internal_security_policies();
  bindAndAddBoolFact(v8, "apple-internal", v9);
  CFDataRef v10 = Security::CodeSigning::CodeDirectory::cdhash(a2[6], 1);
  +[sec_LWCRFact dataFact:](&OBJC_CLASS___sec_LWCRFact, "dataFact:", v10);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();

  bindAndAdd(v8, "cdhash", v11);
  bindAndAddIntegerFact(v8, "code-signing-flags", bswap32(*((_DWORD *)a2[6] + 3)));
  BOOL v12 = amfi_developer_mode_status();
  bindAndAddBoolFact(v8, "developer-mode", v12);
  +[sec_LWCRFact entitlementsFact:](&OBJC_CLASS___sec_LWCRFact, "entitlementsFact:", a2[2]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  bindAndAdd(v8, "entitlements", v13);
  int v14 = a2[6];
  uint64_t v15 = *((unsigned __int8 *)v14 + 36);
  if ((int)(bswap32(*((_DWORD *)v14 + 6)) - 1) < 0
    || (int v16 = *((unsigned __int8 *)v14 + 36), (*((_BYTE *)v14 + 28) & 0x80) != 0))
  {
    __security_simulatecrash(@"Execution has encountered an unexpected state", 0x53C0000Eu);
    int v16 = *((unsigned __int8 *)v14 + 36);
  }

  [MEMORY[0x189603F48] dataWithBytes:(char *)v14 + bswap32(*((_DWORD *)v14 + 4)) - v16 length:v15];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[sec_LWCRFact dataFact:](&OBJC_CLASS___sec_LWCRFact, "dataFact:", v17);
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue();
  bindAndAdd(v8, "info-plist-hash", v18);
  bindAndAddBoolFact(v8, "is-main-binary", HIBYTE(*((void *)a2[6] + 10)) & 1LL);
  bindAndAddBoolFact(v8, "is-sip-protected", *((unsigned __int8 *)a2 + 89));
  bindAndAddBoolFact(v8, "on-authorized-authapfs-volume", *((unsigned __int8 *)a2 + 90));
  bindAndAddBoolFact(v8, "on-system-volume", *((unsigned __int8 *)a2 + 91));
  __std::string::size_type size = 0LL;
  if (sysctlbyname("hw.osenvironment", 0LL, &__size, 0LL, 0LL))
  {
    secLogObjForScope("SecError");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = __error();
      uint64_t v21 = strerror(*v20);
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "getOSEnvironment";
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = v21;
      _os_log_impl( &dword_1804F4000,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: failed to query hw.osenvironment sysctl (error: %s)",  buf,  0x16u);
    }

    goto LABEL_12;
  }

  if (__size)
  {
    std::string::size_type v23 = malloc(__size);
    if (sysctlbyname("hw.osenvironment", v23, &__size, 0LL, 0LL))
    {
      secLogObjForScope("SecError");
      timespec v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = __error();
        uint64_t v26 = strerror(*v25);
        *(_DWORD *)std::string buf = 136315394;
        *(void *)&uint8_t buf[4] = "getOSEnvironment";
        *(_WORD *)&_BYTE buf[12] = 2080;
        *(void *)&buf[14] = v26;
        _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: failed to retrieve hw.osenvironment (error: %s)",  buf,  0x16u);
      }

      std::string::size_type v27 = 0LL;
    }

    else
    {
      [NSString stringWithCString:v23 encoding:4];
      std::string::size_type v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    free(v23);
    if (!v27) {
      goto LABEL_12;
    }
LABEL_22:
    id v22 = v27;
    bindAndAddStringFact(v8, "os-environment", [v22 UTF8String]);
    goto LABEL_23;
  }

  std::string::size_type v27 = (void *)objc_opt_new();
  if (v27) {
    goto LABEL_22;
  }
LABEL_12:
  id v22 = 0LL;
  bindAndAddStringFact(v8, "os-environment", (uint64_t)&unk_18065A197);
LABEL_23:
  bindAndAddIntegerFact(v8, "platform", *((unsigned __int8 *)a2 + 88));
  bindAndAddIntegerFact(v8, "platform-identifier", *((unsigned __int8 *)a2[6] + 38));
  else {
    int v28 = a2[3];
  }
  bindAndAddStringFact(v8, "signing-identifier", (uint64_t)v28);
  uint64_t v29 = (uint64_t)a2[10];
  if (v29) {
    bindAndAddStringFact(v8, "team-identifier", v29);
  }
  bindAndAddIntegerFact(v8, "validation-category", *((unsigned int *)a2 + 23));

  makeLightweightCodeRequirement(v6);
  std::string v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFC73LL);
  }
  +[sec_LWCRExecutor executor](&OBJC_CLASS___sec_LWCRExecutor, "executor");
  int v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v31 evaluateRequirements:v30 withFacts:v8];

  objc_autoreleasePoolPop(context);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v34);
  return v5;
}

void sub_18063732C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

const void *Security::CodeSigning::Requirement::Context::cert(CFArrayRef *this, int a2)
{
  unsigned int v3 = *this;
  if (!v3) {
    return 0LL;
  }
  int v4 = a2;
  if (a2 < 0)
  {
    int v4 = CFArrayGetCount(v3) + a2;
    unsigned int v3 = *this;
  }

  if (CFArrayGetCount(v3) <= v4) {
    return 0LL;
  }
  uint64_t result = CFArrayGetValueAtIndex(*this, v4);
  if (!result) {
    return 0LL;
  }
  return result;
}

void Security::CodeSigning::SecRequirement::~SecRequirement(void **this)
{
  *this = off_1896785E0;
  free(this[2]);
}

{
  *this = off_1896785E0;
  free(this[2]);
  Security::SecCFObject::operator delete((char *)this);
}

BOOL Security::CodeSigning::SecRequirement::equal(const void **this, const void **a2)
{
  return memcmp(this[2], a2[2], bswap32(*((_DWORD *)this[2] + 1))) == 0;
}

CFHashCode Security::CodeSigning::SecRequirement::hash(const UInt8 **this)
{
  CFDataRef v3 = CFDataCreateWithBytesNoCopy( 0LL,  this[2],  bswap32(*((_DWORD *)this[2] + 1)),  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  CFHashCode v1 = CFHash(v3);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v3);
  return v1;
}

void sub_180637530(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *Security::CodeSigning::SecRequirement::SecRequirement(void *a1, unsigned int *a2, char a3)
{
  a1[1] = 1LL;
  *a1 = off_1896785E0;
  a1[2] = 0LL;
  unsigned int v3 = bswap32(a2[1]);
  if (*a2 != 843514 || v3 <= 0xB)
  {
    *__error() = 22;
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14LL);
  }

  if ((a3 & 1) == 0) {
    a2 = Security::Blob<Security::CodeSigning::Requirement,4208856064u>::clone((Security::BlobCore *)a2);
  }
  a1[2] = a2;
  return a1;
}

void *Security::RefPointer<Security::LoadableBundle>::~RefPointer(void *a1)
{
  CFNumberRef v2 = (pthread_mutex_t *)(a1 + 1);
  v8[0] = a1 + 1;
  v8[1] = 0xAAAAAAAAAAAAAA01LL;
  unsigned int v3 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(a1 + 1));
  if ((_DWORD)v3) {
    Security::UnixError::throwMe(v3);
  }
  if (*a1)
  {
    int v4 = (unsigned int *)(*a1 + 8LL);
    do
    {
      unsigned int v5 = __ldxr(v4);
      unsigned int v6 = v5 - 1;
    }

    while (__stxr(v6, v4));
    if (!v6)
    {
      if (*a1) {
        (*(void (**)(void))(*(void *)*a1 + 8LL))(*a1);
      }
      *a1 = 0LL;
    }
  }

  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)v8);
  Security::Mutex::~Mutex(v2);
  return a1;
}

uint64_t Security::ModuleNexus<Security::CodeSigning::PluginHost>::operator()()
{
  if (!Security::CodeSigning::plugin) {
    Security::CodeSigning::plugin = Security::ModuleNexusCommon::create( (Security::ModuleNexusCommon *)&Security::CodeSigning::plugin,  (void *(*)(void))Security::ModuleNexus<Security::CodeSigning::PluginHost>::make);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C533998);
  return Security::CodeSigning::plugin;
}

void sub_1806376BC(void *a1)
{
}

void sub_1806376D4(_Unwind_Exception *a1)
{
}

void *Security::ModuleNexus<Security::CodeSigning::PluginHost>::make()
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v0 = operator new(0x50uLL);
  void *v0 = 0LL;
  Security::Mutex::Mutex((pthread_mutex_t *)(v0 + 1));
  Bundle = (__CFBundle *)SecFrameworkGetBundle();
  if (!Bundle)
  {
LABEL_27:
    Security::Syslog::warning((Security::Syslog *)"code signing problem: unable to load csparser plug-in", v2);
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
  }

  CFURLRef v3 = CFBundleCopyBuiltInPlugInsURL(Bundle);
  CFURLRef v21 = v3;
  if (!v3)
  {
LABEL_26:
    Security::CFRef<__CFURL const*>::~CFRef((const void **)&v21);
    goto LABEL_27;
  }

  CFURLRef CFURL = Security::makeCFURL((Security *)"csparser.bundle", (const char *)1, (uint64_t)v3, v4);
  CFURLRef v20 = CFURL;
  if (!CFURL)
  {
    Security::CFRef<__CFURL const*>::~CFRef((const void **)&v20);
    goto LABEL_26;
  }

  unsigned int v6 = (char *)operator new(0x48uLL);
  Security::cfString((Security *)__p, CFURL);
  if (v19 >= 0) {
    uint64_t v7 = (char *)__p;
  }
  else {
    uint64_t v7 = (char *)__p[0];
  }
  *((_DWORD *)v6 + 2) = 0;
  uint64_t v8 = (unsigned int *)(v6 + 8);
  *(void *)unsigned int v6 = off_1896770F0;
  std::string::basic_string[abi:ne180100]<0>((void *)v6 + 2, v7);
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  uint64_t v9 = (os_log_s *)secLogObjForScope("bundle");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    (*(void (**)(void **__return_ptr, char *))(*(void *)v6 + 24LL))(v22, v6);
    int v17 = v23 >= 0 ? v22 : (void **)v22[0];
    *(_DWORD *)std::string buf = 134218498;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&_BYTE buf[12] = 2080;
    *(void *)&buf[14] = v7;
    __int16 v25 = 2080;
    uint64_t v26 = v17;
    _os_log_debug_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEBUG, "%p Bundle from path %s(%s)", buf, 0x20u);
    if (v23 < 0) {
      operator delete(v22[0]);
    }
  }

  *(void *)unsigned int v6 = off_189678658;
  *(void *)std::string buf = v0 + 1;
  *(void *)&buf[8] = 0xAAAAAAAAAAAAAAAALL;
  CFDataRef v10 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(v0 + 1));
  if ((_DWORD)v10) {
    Security::UnixError::throwMe(v10);
  }
  buf[8] = 1;
  do
    unsigned int v11 = __ldxr(v8);
  while (__stxr(v11 + 1, v8));
  if (*v0)
  {
    BOOL v12 = (unsigned int *)(*v0 + 8LL);
    do
    {
      unsigned int v13 = __ldxr(v12);
      unsigned int v14 = v13 - 1;
    }

    while (__stxr(v14, v12));
    if (!v14 && *v0) {
      (*(void (**)(void))(*(void *)*v0 + 8LL))(*v0);
    }
  }

  void *v0 = v6;
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)buf);
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  (*(void (**)(void))(*(void *)*v0 + 56LL))(*v0);
  uint64_t v15 = (uint64_t (*)(void))(*(uint64_t (**)(void, const char *))(*(void *)*v0 + 40LL))( *v0,  "findAntlrPlugin");
  v0[9] = v15();
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&v20);
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&v21);
  return v0;
}

void sub_1806379B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, const void *a15, const void *a16)
{
  if (v17[63] < 0) {
    operator delete(*v19);
  }
  if (v17[39] < 0) {
    operator delete(*v18);
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v17);
  Security::CFRef<__CFURL const*>::~CFRef(&a15);
  Security::CFRef<__CFURL const*>::~CFRef(&a16);
  Security::RefPointer<Security::LoadableBundle>::~RefPointer(v16);
  operator delete(v16);
  _Unwind_Resume(a1);
}

std::string *Security::CodeSigning::Dumper::print(Security::CodeSigning::Dumper *this, const char *__format, ...)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v20 = v3;
  __int128 v21 = v3;
  __int128 v18 = v3;
  __int128 v19 = v3;
  __int128 v16 = v3;
  __int128 v17 = v3;
  __int128 v14 = v3;
  __int128 v15 = v3;
  __int128 v12 = v3;
  __int128 v13 = v3;
  __int128 v10 = v3;
  __int128 v11 = v3;
  __int128 v8 = v3;
  __int128 v9 = v3;
  *(_OWORD *)std::string __str = v3;
  __int128 v7 = v3;
  vsnprintf(__str, 0x100uLL, __format, va);
  std::string::size_type v4 = strlen(__str);
  return std::string::append((std::string *)((char *)this + 16), __str, v4);
}

std::string *Security::CodeSigning::Dumper::expr(uint64_t a1, int a2)
{
  while (2)
  {
    if (*(_BYTE *)(a1 + 40)) {
      Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "/*@0x%x*/", *(_DWORD *)(a1 + 8));
    }
    int v4 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)a1);
    LODWORD(v5) = 0;
    unsigned int v6 = "! ";
    switch(v4 & 0xFFFFFF)
    {
      case 0:
        __int128 v8 = "never";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 1:
        __int128 v8 = "always";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 2:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "identifier ");
        return Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
      case 3:
        __int128 v8 = "anchor apple";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 4:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " = ");
        return Security::CodeSigning::Dumper::hashData((Security::CodeSigning::Dumper *)a1);
      case 5:
        if (*(_BYTE *)(a1 + 40)) {
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "/*legacy*/");
        }
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "info[");
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "] = ");
        return Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
      case 6:
        if (a2 > 0)
        {
          uint64_t v5 = 1LL;
          unsigned int v6 = " and ";
LABEL_8:
          Security::CodeSigning::Dumper::expr(a1, v5);
LABEL_9:
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v6);
          a2 = v5;
          continue;
        }

        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
        Security::CodeSigning::Dumper::expr(a1, 1LL);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " and ");
        uint64_t v9 = a1;
        uint64_t v10 = 1LL;
LABEL_40:
        Security::CodeSigning::Dumper::expr(v9, v10);
LABEL_41:
        __int128 v8 = ")";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 7:
        if (a2 <= 1)
        {
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
          Security::CodeSigning::Dumper::expr(a1, 2LL);
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " or ");
          uint64_t v9 = a1;
          uint64_t v10 = 2LL;
          goto LABEL_40;
        }

        uint64_t v5 = 2LL;
        unsigned int v6 = " or ";
        goto LABEL_8;
      case 8:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "cdhash ");
        return Security::CodeSigning::Dumper::hashData((Security::CodeSigning::Dumper *)a1);
      case 9:
        goto LABEL_9;
      case 0xA:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "info[");
        goto LABEL_30;
      case 0xB:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "[");
        goto LABEL_30;
      case 0xC:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        __int128 v8 = "trusted";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 0xD:
        __int128 v8 = "anchor trusted";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 0xE:
      case 0x11:
      case 0x16:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "[");
        goto LABEL_31;
      case 0xF:
        __int128 v8 = "anchor apple generic";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 0x10:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "entitlement[");
LABEL_30:
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 1);
LABEL_31:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "]");
        return Security::CodeSigning::Dumper::match((Security::CodeSigning::Dumper *)a1);
      case 0x12:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "anchor apple ");
        return Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
      case 0x13:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
        goto LABEL_41;
      case 0x14:
        Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)a1);
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "platform = %d");
      case 0x15:
        __int128 v8 = "notarized";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 0x17:
        __int128 v8 = "legacy";
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      default:
        if (v4 < 0) {
          return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " false /* opcode %d */");
        }
        if ((v4 & 0x40000000) != 0) {
          return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " /* opcode %d */");
        }
        return Security::CodeSigning::Dumper::print( (Security::CodeSigning::Dumper *)a1,  "OPCODE %d NOT UNDERSTOOD (ending print)");
    }
  }

uint64_t Security::CodeSigning::Requirement::Reader::get<unsigned int>(unsigned int *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = *(void *)a1;
  a1[2] = v1 + 4;
  return bswap32(*(_DWORD *)(v2 + v1));
}

std::string *Security::CodeSigning::Dumper::data(Security::CodeSigning::Requirement::Reader *a1, int a2)
{
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  __int128 v33 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(a1, (const void **)&v33, &v32);
  unint64_t v5 = v32;
  int v4 = (unsigned __int8 *)v33;
  if (v32)
  {
    uint64_t v6 = 0LL;
    int v7 = 0;
    unsigned int v8 = 1;
    uint64_t v9 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v10 = v4[v6];
      if ((char)v4[v6] < 0)
      {
        if (__maskrune(v10, 0x500uLL)) {
          goto LABEL_15;
        }
      }

      else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x500) != 0)
      {
        goto LABEL_15;
      }

      uint64_t v11 = v4[v6];
      if (v11 == 46 && a2 != 0)
      {
LABEL_15:
        if (v8 == 1 && (*(_DWORD *)(v9 + 4LL * v4[v6] + 60) & 0x400) != 0) {
          int v7 = 1;
        }
        goto LABEL_24;
      }

      if ((v11 & 0x80) != 0)
      {
        if (!__maskrune(v11, 0x800uLL))
        {
LABEL_19:
          uint64_t v13 = v4[v6];
          if ((char)v4[v6] < 0)
          {
            if (!__maskrune(v13, 0x4000uLL))
            {
LABEL_52:
              Security::CodeSigning::Dumper::print(a1, "0x");
              uint64_t v29 = 0LL;
              unsigned int v30 = 1;
              do
              {
                uint64_t result = Security::CodeSigning::Dumper::print(a1, "%02.2x", v4[v29]);
                uint64_t v29 = v30;
                BOOL v14 = v5 > v30++;
              }

              while (v14);
              return result;
            }
          }

          else if ((*(_DWORD *)(v9 + 4 * v13 + 60) & 0x4000) == 0)
          {
            goto LABEL_52;
          }
        }
      }

      else if ((*(_DWORD *)(v9 + 4 * v11 + 60) & 0x800) == 0)
      {
        goto LABEL_19;
      }

      int v7 = 1;
LABEL_24:
      uint64_t v6 = v8;
      BOOL v14 = v5 > v8++;
      if (!v14)
      {
        size_t v15 = v5;
        if (!v7) {
          goto LABEL_28;
        }
        Security::CodeSigning::Dumper::print(a1, "", v5);
        goto LABEL_43;
      }
    }
  }

  size_t v15 = 0LL;
LABEL_28:
  memset(__dst, 170, sizeof(__dst));
  __int128 v16 = __dst;
  std::string::basic_string[abi:ne180100](__dst, v4, v15);
  int v17 = SHIBYTE(__dst[2]);
  __int128 v18 = (void *)__dst[0];
  if (__dst[2] >= 0) {
    size_t v19 = HIBYTE(__dst[2]);
  }
  else {
    size_t v19 = __dst[1];
  }
  if (__dst[2] < 0) {
    __int128 v16 = (void *)__dst[0];
  }
  __int128 v20 = "guest";
  __int128 v21 = off_1896786B0;
  while (v19 != strlen(v20) || memcmp(v16, v20, v19))
  {
    uint64_t v22 = *v21++;
    __int128 v20 = v22;
    if (!v22)
    {
      int v23 = 1;
      if ((v17 & 0x80000000) == 0) {
        goto LABEL_38;
      }
LABEL_41:
      operator delete(v18);
      if (!v23) {
        goto LABEL_42;
      }
      return Security::CodeSigning::Dumper::print(a1, "%.*s");
    }
  }

  int v23 = 0;
  if (v17 < 0) {
    goto LABEL_41;
  }
LABEL_38:
  if (v23) {
    return Security::CodeSigning::Dumper::print(a1, "%.*s");
  }
LABEL_42:
  Security::CodeSigning::Dumper::print(a1, "");
  if (v5)
  {
LABEL_43:
    uint64_t v25 = 0LL;
    unsigned int v26 = 1;
    do
    {
      int v27 = v4[v25];
      if (v27 == 34 || v27 == 92) {
        Security::CodeSigning::Dumper::print(a1, "\\%c");
      }
      else {
        Security::CodeSigning::Dumper::print(a1, "%c");
      }
      uint64_t v25 = v26;
      BOOL v14 = v5 > v26++;
    }

    while (v14);
  }

  return Security::CodeSigning::Dumper::print(a1, "");
}

std::string *Security::CodeSigning::Dumper::certSlot(Security::CodeSigning::Dumper *this)
{
  int v2 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  if (!v2)
  {
    __int128 v3 = " leaf";
    return Security::CodeSigning::Dumper::print(this, v3);
  }

  if (v2 == -1)
  {
    __int128 v3 = " root";
    return Security::CodeSigning::Dumper::print(this, v3);
  }

  return Security::CodeSigning::Dumper::print(this, " %d", v2);
}

std::string *Security::CodeSigning::Dumper::hashData(Security::CodeSigning::Dumper *this)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(this, (const void **)&v9, &v8);
  unint64_t v2 = v8;
  if (v8)
  {
    uint64_t v3 = 0LL;
    int v4 = (unsigned __int8 *)v9;
    unsigned int v5 = 1;
    do
    {
      Security::CodeSigning::Dumper::print(this, "%02.2x", v4[v3]);
      uint64_t v3 = v5;
    }

    while (v2 > v5++);
  }

  return Security::CodeSigning::Dumper::print(this, "");
}

std::string *Security::CodeSigning::Dumper::match(Security::CodeSigning::Dumper *this)
{
  int v2 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  switch(v2)
  {
    case 0:
      uint64_t v3 = " /* exists */";
      goto LABEL_20;
    case 1:
      Security::CodeSigning::Dumper::print(this, " = ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 2:
      Security::CodeSigning::Dumper::print(this, " ~ ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 3:
      Security::CodeSigning::Dumper::print(this, " = ");
      Security::CodeSigning::Dumper::data(this, 0);
      uint64_t v3 = "*";
      goto LABEL_20;
    case 4:
      Security::CodeSigning::Dumper::print(this, " = *");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 5:
      Security::CodeSigning::Dumper::print(this, " < ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 6:
      Security::CodeSigning::Dumper::print(this, " > ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 7:
      Security::CodeSigning::Dumper::print(this, " <= ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 8:
      Security::CodeSigning::Dumper::print(this, " >= ");
      return Security::CodeSigning::Dumper::data(this, 0);
    case 9:
      Security::CodeSigning::Dumper::print(this, " = ");
      goto LABEL_18;
    case 10:
      Security::CodeSigning::Dumper::print(this, " < ");
      goto LABEL_18;
    case 11:
      Security::CodeSigning::Dumper::print(this, " > ");
      goto LABEL_18;
    case 12:
      Security::CodeSigning::Dumper::print(this, " <= ");
      goto LABEL_18;
    case 13:
      Security::CodeSigning::Dumper::print(this, " >= ");
LABEL_18:
      uint64_t result = (std::string *)Security::CodeSigning::Dumper::timestamp(this);
      break;
    case 14:
      uint64_t v3 = " absent ";
LABEL_20:
      uint64_t result = Security::CodeSigning::Dumper::print(this, v3);
      break;
    default:
      uint64_t result = Security::CodeSigning::Dumper::print(this, "MATCH OPCODE %d NOT UNDERSTOOD", v2);
      break;
  }

  return result;
}

const void **Security::CodeSigning::Dumper::timestamp(Security::CodeSigning::Dumper *this)
{
  int64_t v2 = Security::CodeSigning::Requirement::Reader::get<long long>((unsigned int *)this);
  CFDateRef v7 = CFDateCreate(0LL, (double)v2);
  uint64_t v6 = CFCopyDescription(v7);
  Security::cfString(&__p, v6);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  Security::CodeSigning::Dumper::print(this, "<%s>", (const char *)p_p);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&v6);
  return Security::CFRef<__CFDate const*>::~CFRef((const void **)&v7);
}

void sub_18063852C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  Security::CFRef<__CFString const*>::~CFRef(&a16);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)(v16 - 24));
  _Unwind_Resume(a1);
}

unint64_t Security::CodeSigning::Requirement::Reader::get<long long>(unsigned int *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = *(void *)a1;
  a1[2] = v1 + 8;
  return bswap64(*(void *)(v2 + v1));
}

void Security::CodeSigning::Dumper::dump(std::string *a1, uint64_t a2)
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v2;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__p[16] = v2;
  uint64_t v6 = a2;
  *(_DWORD *)std::string __p = 12;
  if (bswap32(*(_DWORD *)(a2 + 8)) - 1 >= 2) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA15LL);
  }
  memset(&__p[8], 0, 24);
  LOBYTE(v_Block_object_dispose((const void *)(v1 - 48), 8) = 0;
  Security::CodeSigning::Dumper::expr((uint64_t)&v6, 3);
  unsigned __int8 size = __p[31];
  unsigned int v5 = *(_BYTE **)&__p[8];
  if (__p[31] >= 0) {
    unsigned int v5 = &__p[8];
  }
  if (*v5 == 32)
  {
    std::string::basic_string( &v9,  (const std::string *)&__p[8],  1uLL,  0xFFFFFFFFFFFFFFFFLL,  (std::allocator<char> *)&v10);
    if ((__p[31] & 0x80000000) != 0) {
      operator delete(*(void **)&__p[8]);
    }
    *(std::string *)&__p[8] = v9;
    unsigned __int8 size = v9.__r_.__value_.__s.__size_;
  }

  if ((size & 0x80) != 0)
  {
    std::string::__init_copy_ctor_external( a1,  *(const std::string::value_type **)&__p[8],  *(std::string::size_type *)&__p[16]);
    if ((__p[31] & 0x80000000) != 0) {
      operator delete(*(void **)&__p[8]);
    }
  }

  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = *(_OWORD *)&__p[8];
    a1->__r_.__value_.__l.__cap_ = *(void *)&__p[24];
  }

void Security::CodeSigning::SecCodeSignerRemote::~SecCodeSignerRemote(const void **this)
{
  *this = off_1896787B0;
  Security::CFRef<__CFArray const*>::~CFRef(this + 41);
  Security::CodeSigning::SecCodeSigner::~SecCodeSigner((Security::CodeSigning::SecCodeSigner *)this);
}

{
  char *v2;
  *this = off_1896787B0;
  Security::CFRef<__CFArray const*>::~CFRef(this + 41);
  Security::CodeSigning::SecCodeSigner::~SecCodeSigner((Security::CodeSigning::SecCodeSigner *)this);
  Security::SecCFObject::operator delete(v2);
}

uint64_t Security::CodeSigning::SecCodeSignerRemote::valid(Security::CodeSigning::SecCodeSignerRemote *this)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v2 = (const __CFArray *)*((void *)this + 41);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      BOOL v5 = 0;
      for (i = 0LL; i != v4; BOOL v5 = i >= v4)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 41), i);
        CFTypeID TypeID = SecCertificateGetTypeID();
        if (TypeID != CFGetTypeID(ValueAtIndex)) {
          break;
        }
        ++i;
      }

      if (v5) {
        return 1LL;
      }
    }
  }

  char v10 = (os_log_s *)secLogObjForScope("SecError");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v11)
  {
    uint64_t v12 = *((void *)this + 41);
    int v13 = 134218242;
    BOOL v14 = this;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "Invalid remote signing operation: %p, %@",  (uint8_t *)&v13,  0x16u);
    return 0LL;
  }

  return result;
}

uint64_t Security::CodeSigning::Requirement::Interpreter::eval( Security::CodeSigning::Requirement::Interpreter *this, int a2)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  if (a2 < 2) {
LABEL_157:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14LL);
  unsigned int v2 = a2;
  int v4 = 0;
  while (2)
  {
    unsigned int v5 = v2;
LABEL_4:
    unsigned int v2 = v5 - 1;
    CC_LONG v6 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
    CC_LONG v7 = v6;
    switch(v6 & 0xFFFFFF)
    {
      case 0u:
        goto LABEL_112;
      case 1u:
        goto LABEL_122;
      case 2u:
        if (!*(void *)(*((void *)this + 2) + 48LL)) {
          goto LABEL_112;
        }
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        int Nl_high = SHIBYTE(c.Nl);
        if ((c.Nl & 0x80000000) == 0) {
          size_t v13 = HIBYTE(c.Nl);
        }
        else {
          size_t v13 = *(void *)&c.h2;
        }
        if (v13 == strlen((const char *)v35))
        {
          if ((c.Nl & 0x80000000) == 0) {
            p_CC_SHA1_CTX c = &c;
          }
          else {
            p_CC_SHA1_CTX c = *(CC_SHA1_CTX **)&c.h0;
          }
          LODWORD(v13) = memcmp(p_c, v35, v13) == 0;
        }

        else
        {
          LODWORD(v13) = 0;
        }

        if (Nl_high < 0) {
          goto LABEL_57;
        }
        return (v4 ^ v13) & 1;
      case 3u:
        *(void *)md = Security::CodeSigning::CodeDirectory::cdhash( *(Security::CodeSigning::CodeDirectory **)(*((void *)this + 2) + 48LL),  1);
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)md);
        CFIndex Length = CFDataGetLength(*(CFDataRef *)md);
        if (BytePtr) {
          BOOL v33 = Length == 20;
        }
        else {
          BOOL v33 = 0;
        }
        if (v33)
        {
          c.Nl = -1431655766;
          __int128 v54 = *(_OWORD *)BytePtr;
          c.h4 = *((_DWORD *)BytePtr + 4);
          *(_OWORD *)&c.h0 = v54;
          *(void *)&c.Nh = 0LL;
        }

        Security::CFRef<__CFData const*>::~CFRef((const void **)md);
        if (Security::CodeSigning::Requirement::Interpreter::appleAnchored(*((CFArrayRef **)this + 2)))
        {
          if (Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), -2))
          {
            std::string::basic_string[abi:ne180100]<0>(&c, "subject.CN");
            *(void *)md = @"Apple Code Signing Certification Authority";
            CFRetain(@"Apple Code Signing Certification Authority");
            *(_DWORD *)&md[8] = 1;
LABEL_34:
            Security::CFRef<void const*>::~CFRef((const void **)md);
            if (SHIBYTE(c.Nl) < 0) {
              operator delete(*(void **)&c.h0);
            }
          }
        }

        else
        {
          if (*(_BYTE *)(*((void *)this + 2) + 68LL)) {
            goto LABEL_122;
          }
          *(void *)&c.h0 = MEMORY[0x1895F87A8];
          *(void *)&c.h2 = 0x40000000LL;
          *(void *)&c.h4 = ___ZN8Security11CodeSigning11Requirement11Interpreter18appleLocalAnchoredEv_block_invoke;
          *(void *)&c.Nh = &__block_descriptor_tmp_7_15019;
          *(void *)&c.data[1] = this;
          if (Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates)
          {
            unint64_t v55 = Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), 0);
            *(void *)md = SecCertificateCopySHA256Digest(v55);
            if (!*(void *)md) {
              goto LABEL_111;
            }
            unint64_t v56 = (const __CFArray *)Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates;
            v91.length = CFArrayGetCount((CFArrayRef)Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates);
            v91.location = 0LL;
            LODWORD(v56) = CFArrayContainsValue(v56, v91, *(const void **)md);
            Security::CFRef<__CFData const*>::~CFRef((const void **)md);
            if ((_DWORD)v56)
            {
LABEL_122:
              LODWORD(v13) = 1;
              return (v4 ^ v13) & 1;
            }
          }
        }

        goto LABEL_112;
      case 4u:
        BOOL v11 = (CFArrayRef *)*((void *)this + 2);
        int v12 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        size_t v13 = (size_t)Security::CodeSigning::Requirement::Context::cert(v11, v12);
        *(void *)&c.h0 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)md = 0xAAAAAAAAAAAAAAAALL;
        Security::CodeSigning::Requirement::Reader::getData(this, (const void **)&c, (unint64_t *)md);
        if (*(void *)md != 20LL) {
          goto LABEL_157;
        }
        if (!v13) {
          return (v4 ^ v13) & 1;
        }
        uint64_t v14 = *(void *)&c.h0;
        *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&c.data[9] = v15;
        *(_OWORD *)&c.data[13] = v15;
        *(_OWORD *)&c.data[1] = v15;
        *(_OWORD *)&c.data[5] = v15;
        *(_OWORD *)&c.h0 = v15;
        *(_OWORD *)&c.h4 = v15;
        CC_SHA1_Init(&c);
        CC_SHA1_Update(&c, *(const void **)(v13 + 16), *(_DWORD *)(v13 + 24));
        memset(md, 170, 20);
        CC_SHA1_Final(md, &c);
        BOOL v17 = *(void *)md == *(void *)v14
           && *(void *)&md[8] == *(void *)(v14 + 8)
           && *(unsigned int *)&md[16] == (unint64_t)*(unsigned int *)(v14 + 16);
        goto LABEL_84;
      case 5u:
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)__p, this);
        Security::CFTempString::CFTempString<std::string>((CFStringRef *)cf1, (char *)__p);
        Security::CFCopyRef<void const*>::CFCopyRef(md, cf1[0]);
        *(_DWORD *)&md[8] = 1;
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::infoKeyValue( *(const __CFDictionary **)(*((void *)this + 2) + 8LL),  (uint64_t)&c,  (uint64_t)md);
        Security::CFRef<void const*>::~CFRef((const void **)md);
        Security::CFRef<__CFString const*>::~CFRef(cf1);
        if (v83 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_56;
      case 6u:
        int v26 = Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        LODWORD(v13) = v26 & Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        return (v4 ^ v13) & 1;
      case 7u:
        int v25 = Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        LODWORD(v13) = v25 | Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        return (v4 ^ v13) & 1;
      case 8u:
        int v23 = *(Security::CodeSigning::CodeDirectory **)(*((void *)this + 2) + 48LL);
        if (!v23) {
          goto LABEL_112;
        }
        cf1[0] = Security::CodeSigning::CodeDirectory::cdhash(v23, 1);
        *(void *)&c.h0 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)md = 0xAAAAAAAAAAAAAAAALL;
        Security::CodeSigning::Requirement::Reader::getData(this, (const void **)&c, (unint64_t *)md);
        stat key = CFDataCreate(0LL, *(const UInt8 **)&c.h0, *(CFIndex *)md);
        LODWORD(v13) = CFEqual(cf1[0], key) != 0;
        Security::CFRef<__CFData const*>::~CFRef((const void **)&key);
        timespec v24 = cf1;
        goto LABEL_155;
      case 9u:
        v4 ^= 1u;
        if (v5 < 3) {
          goto LABEL_157;
        }
        continue;
      case 0xAu:
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        memset(md, 170, 16);
        Security::CodeSigning::Requirement::Interpreter::Match::Match( (Security::CodeSigning::Requirement::Interpreter::Match *)md,  this);
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::infoKeyValue( *(const __CFDictionary **)(*((void *)this + 2) + 8LL),  (uint64_t)&c,  (uint64_t)md);
        Security::CFRef<void const*>::~CFRef((const void **)md);
        goto LABEL_56;
      case 0xBu:
        uint64_t v29 = (CFArrayRef *)*((void *)this + 2);
        int v30 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        Security::CodeSigning::Requirement::Context::cert(v29, v30);
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        memset(md, 170, 16);
        Security::CodeSigning::Requirement::Interpreter::Match::Match( (Security::CodeSigning::Requirement::Interpreter::Match *)md,  this);
        goto LABEL_34;
      case 0xCu:
        int v39 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        if (Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), v39))
        {
          std::string::size_type v40 = (const __CFArray *)**((void **)this + 2);
          if (v40) {
            CFArrayGetCount(v40);
          }
        }

        goto LABEL_112;
      case 0xDu:
        std::string::size_type v41 = (const __CFArray *)**((void **)this + 2);
        if (!v41) {
          goto LABEL_112;
        }
        int v42 = CFArrayGetCount(v41) - 1;
        if (v42 < 0) {
          goto LABEL_112;
        }
        int v43 = 0;
        do
        {
          LODWORD(v13) = 0;
          if (Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), v43)) {
            BOOL v44 = v42 == v43;
          }
          else {
            BOOL v44 = 1;
          }
          ++v43;
        }

        while (!v44);
        return (v4 ^ v13) & 1;
      case 0xFu:
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::appleAnchored(*((CFArrayRef **)this + 2));
        return (v4 ^ v13) & 1;
      case 0x10u:
        memset(md, 170, sizeof(md));
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)md, this);
        cf1[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        cf1[1] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        Security::CodeSigning::Requirement::Interpreter::Match::Match( (Security::CodeSigning::Requirement::Interpreter::Match *)cf1,  this);
        __int128 v18 = *(const __CFDictionary **)(*((void *)this + 2) + 16LL);
        if (!v18) {
          goto LABEL_118;
        }
        if ((char)md[23] < 0)
        {
          std::string::__init_copy_ctor_external( (std::string *)&c,  *(const std::string::value_type **)md,  *(std::string::size_type *)&md[8]);
        }

        else
        {
          *(_OWORD *)&c.h0 = *(_OWORD *)md;
          *(void *)&c.h4 = *(void *)&md[16];
        }

        Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&c);
        Value = (const __CFString *)CFDictionaryGetValue(v18, key);
        Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
        if (SHIBYTE(c.Nl) < 0) {
          operator delete(*(void **)&c.h0);
        }
        if (Value) {
          int v66 = Security::CodeSigning::Requirement::Interpreter::Match::operator()((uint64_t)cf1, Value);
        }
        else {
LABEL_118:
        }
          int v66 = Security::CodeSigning::Requirement::Interpreter::Match::operator()( (uint64_t)cf1,  (const __CFString *)*MEMORY[0x189605018]);
        LODWORD(v13) = v66;
        Security::CFRef<void const*>::~CFRef(cf1);
        uint64_t v38 = *(void **)md;
        goto LABEL_58;
      case 0x12u:
        uint64_t v27 = Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()();
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        int v28 = Security::CodeSigning::Fragments::evalNamed( v27,  "anchorreq",  (std::string *)&c,  *((const Security::CodeSigning::Requirement::Context **)this + 2));
        goto LABEL_44;
      case 0x13u:
        uint64_t v34 = Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()();
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        int v28 = Security::CodeSigning::Fragments::evalNamed( v34,  "subreq",  (std::string *)&c,  *((const Security::CodeSigning::Requirement::Context **)this + 2));
LABEL_44:
        LODWORD(v13) = v28;
LABEL_56:
        if (SHIBYTE(c.Nl) < 0)
        {
LABEL_57:
          uint64_t v38 = *(void **)&c.h0;
LABEL_58:
          operator delete(v38);
        }

        return (v4 ^ v13) & 1;
      case 0x14u:
        int v52 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        uint64_t v53 = *(void *)(*((void *)this + 2) + 48LL);
        if (!v53) {
          goto LABEL_112;
        }
        BOOL v17 = v52 == *(unsigned __int8 *)(v53 + 38);
LABEL_84:
        LODWORD(v13) = v17;
        return (v4 ^ v13) & 1;
      case 0x15u:
        uint64_t v19 = *((void *)this + 2);
        *(void *)md = 0LL;
        cf1[0] = 0LL;
        if (!v19) {
          goto LABEL_108;
        }
        __int128 v20 = *(Security::CodeSigning::CodeDirectory **)(v19 + 48);
        if (v20)
        {
          CFDataRef v21 = Security::CodeSigning::CodeDirectory::cdhash(v20, 1);
          *(void *)md = v21;
          if (!v21) {
            goto LABEL_108;
          }
          CC_LONG v22 = *(unsigned __int8 *)(*(void *)(v19 + 48) + 37LL);
        }

        else
        {
          CFDataRef v21 = *(CFDataRef *)(v19 + 56);
          if (!v21) {
            goto LABEL_108;
          }
          CFRetain(*(CFTypeRef *)(v19 + 56));
          *(void *)md = v21;
          CC_LONG v22 = *(_DWORD *)(v19 + 64);
        }

        uint64_t v63 = (os_log_s *)secLogObjForScope("notarization");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          c.h0 = 67109378;
          c.h1 = v22;
          LOWORD(c.h2) = 2112;
          *(void *)((char *)&c.h2 + 2) = v21;
          _os_log_debug_impl( &dword_1804F4000,  v63,  OS_LOG_TYPE_DEBUG,  "checking notarization on %d, %@",  (uint8_t *)&c,  0x12u);
        }

LABEL_152:
        uint64_t v76 = (os_log_s *)secLogObjForScope("legacy_list");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          c.h0 = 67109120;
          c.h1 = v13;
          _os_log_impl( &dword_1804F4000,  v76,  OS_LOG_TYPE_DEFAULT,  "meetsDeveloperIDLegacyAllowedPolicy = %d",  (uint8_t *)&c,  8u);
        }

        Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
        Security::CFRef<__CFError *>::~CFRef(cf1);
        timespec v24 = (const void **)md;
LABEL_155:
        Security::CFRef<__CFData const*>::~CFRef(v24);
        return (v4 ^ v13) & 1;
      default:
        if (!(v6 >> 30))
        {
          uint64_t v80 = (os_log_s *)secLogObjForScope("csinterp");
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            c.h0 = 67109120;
            c.h1 = v7;
            _os_log_debug_impl( &dword_1804F4000,  v80,  OS_LOG_TYPE_DEBUG,  "opcode 0x%x cannot be handled; aborting",
              (uint8_t *)&c,
              8u);
          }

          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA00LL);
        }

        unsigned int v8 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        uint64_t v9 = *((unsigned int *)this + 2);
        *((_DWORD *)this + 2) = v9 + v8;
        if ((v7 & 0x80000000) != 0)
        {
          LODWORD(v13) = 0;
          return (v4 ^ v13) & 1;
        }

        if (v5-- < 3) {
          goto LABEL_157;
        }
        goto LABEL_4;
    }
  }

void sub_180639724( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, int a26, __int16 a27, char a28, char a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
}

BOOL Security::CodeSigning::Requirement::Interpreter::appleAnchored(CFArrayRef *this)
{
  uint64_t v1 = Security::CodeSigning::Requirement::Context::cert(this, -1);
  if (!v1) {
    return 0LL;
  }
  unsigned int v2 = v1;
  if (SecAreQARootCertificatesEnabled_onceToken != -1) {
    dispatch_once(&SecAreQARootCertificatesEnabled_onceToken, &__block_literal_global_13141);
  }
  if (SecAreQARootCertificatesEnabled_sQACertsEnabled)
  {
LABEL_6:
    uint64_t v3 = v2;
    char v4 = 3;
  }

  else
  {
    uint64_t v3 = v2;
    char v4 = 0;
  }

  return (SecIsAppleTrustAnchor(v3, v4) & 1) != 0;
}

uint64_t Security::CodeSigning::Requirement::Interpreter::infoKeyValue( const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    goto LABEL_9;
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&__p);
  Value = (const __CFString *)CFDictionaryGetValue(a1, key);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Value) {
      goto LABEL_7;
    }
LABEL_9:
    CC_LONG v7 = (const __CFString *)*MEMORY[0x189605018];
    uint64_t v6 = a3;
    return Security::CodeSigning::Requirement::Interpreter::Match::operator()(v6, v7);
  }

  if (!Value) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v6 = a3;
  CC_LONG v7 = Value;
  return Security::CodeSigning::Requirement::Interpreter::Match::operator()(v6, v7);
}

void sub_180639A20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, const void *a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

Security::CodeSigning::Requirement::Interpreter::Match *Security::CodeSigning::Requirement::Interpreter::Match::Match( Security::CodeSigning::Requirement::Interpreter::Match *this, Security::CodeSigning::Requirement::Interpreter *a2)
{
  *(void *)this = 0LL;
  uint64_t v3 = *((unsigned int *)a2 + 2);
  uint64_t v4 = *(void *)a2;
  *((_DWORD *)a2 + 2) = v3 + 4;
  unsigned int v5 = bswap32(*(_DWORD *)(v4 + v3));
  *((_DWORD *)this + 2) = v5;
  if (v5 > 0xE)
  {
    Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&v13, a2);
    if ((v14 & 0x80000000) == 0) {
      return this;
    }
    BOOL v11 = v13;
    goto LABEL_19;
  }

  int v6 = 1 << v5;
  if ((v6 & 0x1FE) == 0)
  {
    if ((v6 & 0x3E00) != 0)
    {
      int64_t v8 = Security::CodeSigning::Requirement::Reader::get<long long>((unsigned int *)a2);
      CFDateRef v9 = CFDateCreate(0LL, (double)v8);
      if (*(void *)this) {
        CFRelease(*(CFTypeRef *)this);
      }
      *(void *)this = v9;
    }

    return this;
  }

  Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)cStr, a2);
  if (v16 < 0)
  {
    CC_LONG v7 = *(char **)cStr;
    if (!*(void *)cStr)
    {
      CFStringRef v10 = 0LL;
      goto LABEL_15;
    }
  }

  else
  {
    CC_LONG v7 = cStr;
  }

  CFStringRef v10 = CFStringCreateWithCString(0LL, v7, 0x8000100u);
  if (!v10)
  {
    CFStringRef v10 = CFStringCreateWithCString(0LL, v7, 0x600u);
    if (!v10) {
      Security::CFError::throwMe(0LL);
    }
  }

void sub_180639BA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
}

uint64_t Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()()
{
  if (!Security::CodeSigning::fragments) {
    Security::CodeSigning::fragments = Security::ModuleNexusCommon::create( (Security::ModuleNexusCommon *)&Security::CodeSigning::fragments,  (void *(*)(void))Security::ModuleNexus<Security::CodeSigning::Fragments>::make);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C5339B0);
  return Security::CodeSigning::fragments;
}

void sub_180639C30(void *a1)
{
}

void sub_180639C48(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::Fragments::evalNamed( uint64_t a1, const char *a2, std::string *a3, const Security::CodeSigning::Requirement::Context *a4)
{
  if ((a3->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    size_t size = a3->__r_.__value_.__s.__size_;
  }
  else {
    size_t size = a3->__r_.__value_.__l.__size_;
  }
  memset(&v46, 170, sizeof(v46));
  CFDateRef v9 = &v46;
  std::string::basic_string[abi:ne180100]((uint64_t)&v46, size + 2);
  if ((v46.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    CFDateRef v9 = (std::string *)v46.__r_.__value_.__r.__words[0];
  }
  if (size)
  {
    if ((a3->__r_.__value_.__s.__size_ & 0x80u) == 0) {
      CFStringRef v10 = (const std::string::value_type *)a3;
    }
    else {
      CFStringRef v10 = (const std::string::value_type *)a3->__r_.__value_.__r.__words[0];
    }
    memmove(v9, v10, size);
  }

  strcpy((char *)v9 + size, "!!");
  std::string::size_type v11 = strlen(a2);
  int v12 = std::string::append(&v46, a2, v11);
  std::string __p = *v12;
  v12->__r_.__value_.__l.__size_ = 0LL;
  v12->__r_.__value_.__l.__cap_ = 0LL;
  v12->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v43 = a1 + 8;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  size_t v13 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if ((_DWORD)v13) {
    Security::UnixError::throwMe(v13);
  }
  LOBYTE(v44) = 1;
  __int128 v15 = (uint64_t **)(a1 + 80);
  char v14 = *(void **)(a1 + 80);
  if (v14)
  {
    char v16 = (uint64_t **)(a1 + 80);
    do
    {
      char v17 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v14 + 4, &__p);
      if (v17 >= 0) {
        __int128 v18 = v14;
      }
      else {
        __int128 v18 = v14 + 1;
      }
      if (v17 >= 0) {
        char v16 = (uint64_t **)v14;
      }
      char v14 = (void *)*v18;
    }

    while (*v18);
    if (v16 != v15
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, v16 + 4) & 0x80) == 0)
    {
      uint64_t v19 = (const __CFData *)v16[7];
      goto LABEL_58;
    }
  }

  std::string::size_type v41 = (__CFURL *)0xAAAAAAAAAAAAAAAALL;
  CFDataRef theData = 0LL;
  __int128 v20 = *(__CFBundle **)a1;
  else {
    std::string v40 = *a3;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v46, (char *)&v40);
  CFDataRef v21 = (const __CFString *)v46.__r_.__value_.__r.__words[0];
  Security::CFTempString::CFTempString<char const*>(&subDirName, a2);
  std::string::size_type v41 = CFBundleCopyResourceURL(v20, v21, @"csreq", subDirName);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&subDirName);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&v46.__r_.__value_.__l.__data_);
  if (v41)
  {
    CFStringRef subDirName = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
    File = (const __CFString *)Security::cfLoadFile(v41, v22);
    CFStringRef subDirName = File;
    if (File)
    {
      BytePtr = CFDataGetBytePtr((CFDataRef)File);
      unint64_t Length = CFDataGetLength((CFDataRef)subDirName);
      if (Length >= 0xC)
      {
        if (*(_DWORD *)BytePtr == 843514 && (unsigned int v26 = bswap32(*((_DWORD *)BytePtr + 1)), v26 > 0xB))
        {
          if (Length == v26)
          {
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)&theData, (CFTypeRef *)&subDirName);
            goto LABEL_43;
          }
        }

        else
        {
          *__error() = 22;
        }
      }

      Security::cfString((Security *)&v46, v41);
      if ((v46.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v28 = &v46;
      }
      else {
        int v28 = (std::string *)v46.__r_.__value_.__r.__words[0];
      }
      Security::Syslog::warning((Security::Syslog *)"Invalid sub-requirement at %s", v27, v28);
    }

void sub_18063A0D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, int a19, const void *a20, __int16 a21, char a22, char a23, uint64_t a24, void *__p, uint64_t a26, int a27, __int16 a28, char a29, char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,Security::CFRef<__CFData const*>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,Security::CFRef<__CFData const*>>,0>( uint64_t a1)
{
}

char *Security::ModuleNexus<Security::CodeSigning::Fragments>::make()
{
  v0 = (char *)operator new(0x60uLL);
  Security::Mutex::Mutex((pthread_mutex_t *)(v0 + 8));
  *((void *)v0 + 11) = 0LL;
  *((void *)v0 + 10) = 0LL;
  *((void *)v0 + 9) = v0 + 80;
  *(void *)v0 = SecFrameworkGetBundle();
  return v0;
}

void sub_18063A278(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::Requirement::Interpreter::Match::operator()(uint64_t a1, const __CFString *a2)
{
  if (!a2) {
    return 0LL;
  }
  if ((const __CFString *)*MEMORY[0x189605018] == a2)
  {
    return *(_DWORD *)(a1 + 8) == 14;
  }

  else
  {
    CFTypeID v4 = CFGetTypeID(a2);
    if (v4 == CFArrayGetTypeID() && (CFIndex Count = CFArrayGetCount((CFArrayRef)a2), Count >= 1))
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v7);
        if ((Security::CodeSigning::Requirement::Interpreter::Match::operator()(a1, ValueAtIndex) & 1) != 0) {
          return 1LL;
        }
        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
    }

    else
    {
LABEL_8:
      switch(*(_DWORD *)(a1 + 8))
      {
        case 0:
          return CFEqual(a2, (CFTypeRef)*MEMORY[0x189604DE0]) == 0;
        case 1:
          return CFEqual(a2, *(CFTypeRef *)a1) != 0;
        case 2:
          CFTypeID v15 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v15 != CFStringGetTypeID()) {
            return 0LL;
          }
          CFTypeID v16 = CFGetTypeID(a2);
          if (v16 != CFStringGetTypeID()) {
            return 0LL;
          }
          char v17 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          v18.length = CFStringGetLength(a2);
          uint64_t v19 = a2;
          __int128 v20 = v17;
          goto LABEL_29;
        case 3:
          CFTypeID v26 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v26 != CFStringGetTypeID()) {
            return 0LL;
          }
          CFTypeID v27 = CFGetTypeID(a2);
          if (v27 != CFStringGetTypeID()) {
            return 0LL;
          }
          int v28 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          uint64_t v29 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          v18.length = CFStringGetLength(v29);
          uint64_t v19 = a2;
          __int128 v20 = v28;
LABEL_29:
          v18.location = 0LL;
          return CFStringFindWithOptions(v19, v20, v18, 0LL, 0LL) != 0;
        case 4:
          CFTypeID v21 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v21 != CFStringGetTypeID()) {
            return 0LL;
          }
          CFTypeID v22 = CFGetTypeID(a2);
          if (v22 != CFStringGetTypeID()) {
            return 0LL;
          }
          int v23 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          CFIndex Length = CFStringGetLength(v23);
          CFIndex v25 = CFStringGetLength(a2) - Length;
          if (v25 < 0) {
            return 0LL;
          }
          __int128 v20 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          uint64_t v19 = a2;
          v18.location = v25;
          v18.length = Length;
          return CFStringFindWithOptions(v19, v20, v18, 0LL, 0LL) != 0;
        case 5:
          uint64_t v30 = (CFTypeRef *)a1;
          int v31 = a2;
          uint64_t v32 = -1LL;
          goto LABEL_36;
        case 6:
          uint64_t v30 = (CFTypeRef *)a1;
          int v31 = a2;
          uint64_t v32 = 1LL;
LABEL_36:
          CFComparisonResult v33 = kCFCompareGreaterThan;
          goto LABEL_40;
        case 7:
          uint64_t v30 = (CFTypeRef *)a1;
          int v31 = a2;
          uint64_t v32 = 1LL;
          goto LABEL_39;
        case 8:
          uint64_t v30 = (CFTypeRef *)a1;
          int v31 = a2;
          uint64_t v32 = -1LL;
LABEL_39:
          CFComparisonResult v33 = kCFCompareEqualTo;
LABEL_40:
          uint64_t result = Security::CodeSigning::Requirement::Interpreter::Match::inequality(v30, v31, v32, v33);
          break;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
          CFTypeID v9 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v9 == CFDateGetTypeID())
          {
            CFTypeID v10 = CFGetTypeID(a2);
            if (v10 == CFDateGetTypeID())
            {
              CFTypeID v11 = CFGetTypeID(*(CFTypeRef *)a1);
              if (v11 == CFDateGetTypeID()) {
                int v12 = *(const __CFDate **)a1;
              }
              else {
                int v12 = 0LL;
              }
              CFComparisonResult v34 = CFDateCompare((CFDateRef)a2, v12, 0LL);
              switch(*(_DWORD *)(a1 + 8))
              {
                case 9:
                  return v34 == kCFCompareEqualTo;
                case 0xA:
                  return (unint64_t)v34 >> 63;
                case 0xB:
                  return v34 > kCFCompareEqualTo;
                case 0xC:
                  return v34 < kCFCompareGreaterThan;
                case 0xD:
                  return v34 >= kCFCompareEqualTo;
                default:
                  abort();
              }
            }
          }

          return 0LL;
        default:
          return 0LL;
      }
    }
  }

  return result;
}

CFTypeRef Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue(CFTypeRef *this)
{
  CFTypeID v2 = CFGetTypeID(*this);
  if (v2 == CFStringGetTypeID()) {
    return *this;
  }
  else {
    return 0LL;
  }
}

BOOL Security::CodeSigning::Requirement::Interpreter::Match::inequality( CFTypeRef *this, const __CFString *a2, uint64_t a3, CFComparisonResult a4)
{
  int v4 = a4;
  CFTypeID v8 = CFGetTypeID(*this);
  BOOL result = 0;
  if (v8 == CFStringGetTypeID())
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFStringGetTypeID())
    {
      CFTypeID v10 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue(this);
      if ((CFStringCompare(a2, v10, 0x40uLL) == a3) == v4) {
        return 1;
      }
    }
  }

  return result;
}

const void **___ZN8Security11CodeSigning11Requirement11Interpreter18appleLocalAnchoredEv_block_invoke( Security *a1, uint64_t a2)
{
  uint64_t v15 = 0LL;
  CFTypeID v16 = &v15;
  uint64_t v17 = 0x3002000000LL;
  CFRange v18 = __Block_byref_object_copy__15021;
  uint64_t v19 = __Block_byref_object_dispose__15022;
  CFMutableArrayRef CFMutableArray = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef CFMutableArray = Security::makeCFMutableArray(a1, a2);
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  io_object_t v3 = v2;
  if (!v2) {
    goto LABEL_10;
  }
  int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDataRef theData = (CFDataRef)IORegistryEntryCreateCFProperty( v2,  @"AMFITrustedKeys",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  IOObjectRelease(v3);
  if (!theData) {
    goto LABEL_9;
  }
  BytePtr = (const char *)CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  CFTypeRef v7 = IOCFUnserializeWithSize(BytePtr, Length, v4, 0LL, 0LL);
  size_t v13 = v7;
  if (!v7
    || (Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v7, @"trustedKeys")) == 0LL
    && (CFTypeID v9 = CFGetTypeID(0LL), v9 != CFArrayGetTypeID()))
  {
    Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
LABEL_9:
    Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
    goto LABEL_10;
  }

  context[0] = MEMORY[0x1895F87A8];
  context[1] = 0x40000000LL;
  conCFStringRef text[2] = ___ZN8Security11CodeSigning11Requirement11Interpreter27getAdditionalTrustedAnchorsEv_block_invoke;
  context[3] = &unk_189678828;
  context[4] = &v15;
  v21.length = CFArrayGetCount(Value);
  v21.location = 0LL;
  CFArrayApplyFunction(Value, v21, (CFArrayApplierFunction)Security::cfarrayApplyBlock_func, context);
  Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
  if (!CFArrayGetCount((CFArrayRef)v16[5]))
  {
LABEL_10:
    uint64_t v10 = 0LL;
    goto LABEL_11;
  }

  uint64_t v10 = v16[5];
  v16[5] = 0LL;
LABEL_11:
  _Block_object_dispose(&v15, 8);
  BOOL result = Security::CFRef<__CFArray *>::~CFRef((const void **)&CFMutableArray);
  Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates = v10;
  return result;
}

void sub_18063A880(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_18063A8BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__15021(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__15022(uint64_t a1)
{
  return Security::CFRef<__CFArray *>::~CFRef((const void **)(a1 + 40));
}

void ___ZN8Security11CodeSigning11Requirement11Interpreter27getAdditionalTrustedAnchorsEv_block_invoke( uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict || (CFTypeID v4 = CFGetTypeID(0LL), v4 == CFDictionaryGetTypeID()))
  {
    Value = CFDictionaryGetValue(theDict, @"certDigest");
    if (Value || (CFTypeID v6 = CFGetTypeID(0LL), v6 == CFDataGetTypeID())) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), Value);
    }
  }

void *Security::CodeSigning::Requirement::Maker::require(void *this, uint64_t a2)
{
  unint64_t v2 = *((unsigned int *)this + 2);
  unint64_t v3 = *((unsigned int *)this + 3) + a2;
  if (v3 > v2)
  {
    CFTypeID v4 = this;
    unint64_t v5 = (2 * v2);
    if (v3 <= v5) {
      size_t v6 = v5;
    }
    else {
      size_t v6 = v3;
    }
    *((_DWORD *)this + 2) = v6;
    this = realloc((void *)*this, v6);
    *CFTypeID v4 = this;
    if (!this) {
      Security::UnixError::throwMe((Security::UnixError *)0xC);
    }
  }

  return this;
}

uint64_t Security::CodeSigning::Requirement::Maker::alloc( Security::CodeSigning::Requirement::Maker *this, uint64_t a2)
{
  unint64_t v4 = (a2 - 1) & 0xFFFFFFFFFFFFFFFCLL;
  Security::CodeSigning::Requirement::Maker::require(this, v4 + 4);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((unsigned int *)this + 3);
  uint64_t v7 = v6 + *(void *)this;
  uint64_t v8 = (v6 + v4 + 4);
  *((_DWORD *)this + 3) = v8;
  __int src = 0;
  memcpy((void *)(a2 - v4 + v5 + v8 - 4), &__src, v4 + 4 - a2);
  return v7;
}

void *Security::CodeSigning::Requirement::Maker::putData( Security::CodeSigning::Requirement::Maker *this, const void *a2, size_t a3)
{
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((unsigned int *)this + 3);
  *((_DWORD *)this + 3) = v7 + 4;
  *(_DWORD *)(v7 + v6) = bswap32(a3);
  uint64_t v8 = (void *)Security::CodeSigning::Requirement::Maker::alloc(this, a3);
  return memcpy(v8, a2, a3);
}

void Security::CodeSigning::SecCodeSigner::Signer::sdkPath( uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v5 = *(const __CFURL **)(*(void *)(a1 + 8) + 112LL);
  if (v5)
  {
    Security::cfString((Security *)&v10, v5);
    int v6 = *(char *)(a2 + 23);
    if (v6 >= 0) {
      uint64_t v7 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v7 = *(const std::string::value_type **)a2;
    }
    if (v6 >= 0) {
      std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      std::string::size_type v8 = *(void *)(a2 + 8);
    }
    CFTypeID v9 = std::string::append(&v10, v7, v8);
    *a3 = *v9;
    v9->__r_.__value_.__l.__size_ = 0LL;
    v9->__r_.__value_.__l.__cap_ = 0LL;
    v9->__r_.__value_.__r.__words[0] = 0LL;
  }

  else if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__l.__cap_ = *(void *)(a2 + 16);
  }

void sub_18063AB70( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL Security::CodeSigning::SecCodeSigner::Signer::isAdhoc( Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return *(void *)(*((void *)this + 1) + 24LL) == *MEMORY[0x189605018];
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::signingFlags( Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return *(unsigned int *)(*((void *)this + 1) + 16LL);
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::digestAlgorithms( Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return (uint64_t)this + 112;
}

void Security::CodeSigning::SecCodeSigner::Signer::setDigestAlgorithms(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 112;
  if (v2 != a2) {
    std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>( v2,  *(void **)a2,  (void *)(a2 + 8));
  }
}

void std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>( uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 16))
  {
    int v6 = *(uint64_t **)a1;
    std::string::size_type v8 = (uint64_t **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 8);
    *(void *)a1 = a1 + 8;
    *(void *)(v7 + 16) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    if (v6[1]) {
      CFTypeID v9 = (uint64_t *)v6[1];
    }
    else {
      CFTypeID v9 = v6;
    }
    if (!v9)
    {
      __int128 v20 = 0LL;
LABEL_29:
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v20);
      goto LABEL_30;
    }

    std::string v10 = std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v9);
    if (a2 != a3)
    {
      CFTypeID v11 = v9;
      int v12 = a2;
      do
      {
        CFTypeID v9 = v10;
        unsigned int v13 = *((_DWORD *)v12 + 7);
        *((_DWORD *)v11 + 7) = v13;
        char v14 = *v8;
        uint64_t v15 = (uint64_t **)(a1 + 8);
        CFTypeID v16 = (uint64_t **)(a1 + 8);
        if (*v8)
        {
          do
          {
            while (1)
            {
              uint64_t v15 = (uint64_t **)v14;
              if (v13 >= *((_DWORD *)v14 + 7)) {
                break;
              }
              char v14 = (uint64_t *)*v14;
              CFTypeID v16 = v15;
              if (!*v15) {
                goto LABEL_14;
              }
            }

            char v14 = (uint64_t *)v14[1];
          }

          while (v14);
          CFTypeID v16 = v15 + 1;
        }

void *std::__tree<unsigned int>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  BOOL result = *(void **)(a1 + 16);
  if (result)
  {
    unint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *BOOL result = 0LL;
      while (1)
      {
        unint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          BOOL result = v4;
          unint64_t v4 = (void *)*v4;
        }

        while (v4);
      }
    }

    else
    {
      for (result[1] = 0LL; v3; unint64_t v3 = (void *)result[1])
      {
        do
        {
          BOOL result = v3;
          unint64_t v3 = (void *)*v3;
        }

        while (v3);
      }
    }
  }

  return result;
}

void Security::CodeSigning::SecCodeSigner::Signer::sign( Security::CodeSigning::SecCodeSigner::Signer *this, int a2)
{
  uint64_t v173 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL) + 16LL))(*(void *)(*((void *)this + 2) + 32LL));
  uint64_t v126 = (void *)((char *)this + 24);
  Security::RefPointer<Security::CodeSigning::DiskRep>::setPointer((void *)this + 3, v4);
  Security::CodeSigning::SecCodeSigner::Signer::prepare(this, a2);
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)CFTypeRef cf = v5;
  __int128 v132 = v5;
  __int128 v131 = v5;
  __int128 v130 = v5;
  *(_OWORD *)std::string __p = v5;
  CFArrayRef v128 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_18065A197);
  *((void *)&v130 + 1) = 0LL;
  *(void *)&__int128 v131 = 0LL;
  *(void *)((char *)&v131 + 5) = 0LL;
  __int128 v132 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  int v6 = (const void *)*((void *)this + 42);
  uint64_t v7 = (void *)MEMORY[0x189605018];
  if (!v6)
  {
    if (*(void *)(*((void *)this + 1) + 24LL) == *MEMORY[0x189605018]) {
      goto LABEL_19;
    }
    CFTypeID v9 = (os_log_s *)secLogObjForScope("signer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v118 = *(void *)(*((void *)this + 1) + 24LL);
      *(_DWORD *)certificates = 138412290;
      *(void *)&certificates[4] = v118;
      _os_log_debug_impl( &dword_1804F4000,  v9,  OS_LOG_TYPE_DEBUG,  "looking at identity to create cert chain: %@",  certificates,  0xCu);
    }

    *(void *)certificates = *(void *)(*(void *)(*((void *)this + 1) + 24LL) + 16LL);
    CFRetain(*(CFTypeRef *)certificates);
    *(void *)unint64_t v168 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)unint64_t v168 = SecPolicyCreateWithProperties(@"1.2.840.113635.100.1.16", 0LL);
    SecTrustRef trust = 0LL;
    std::string v10 = (Security::MacOSError *)SecTrustCreateWithCertificates(*(CFTypeRef *)certificates, *(CFTypeRef *)v168, &trust);
    if ((_DWORD)v10) {
      Security::MacOSError::throwMe(v10);
    }
    if (!SecTrustEvaluateWithError(trust, 0LL))
    {
      CFTypeID v11 = (os_log_s *)secLogObjForScope("signer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13_Block_object_dispose(va, 8) = 0;
        _os_log_debug_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEBUG,  "SecTrust evaluation of signing certificate failed - not fatal",  (uint8_t *)&v138,  2u);
      }
    }

    SecTrustRef v138 = (SecTrustRef)0xAAAAAAAAAAAAAAAALL;
    int v12 = SecTrustCopyCertificateChain(trust);
    SecTrustRef v138 = v12;
    if (v12)
    {
      CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v12);
      if (cf[1]) {
        CFRelease(cf[1]);
      }
      cf[1] = Copy;
      if (Copy)
      {
        CFArrayRef v128 = Copy;
        Security::CFRef<__CFArray const*>::~CFRef((const void **)&v138);
        Security::CFRef<__SecTrust *>::~CFRef((const void **)&trust);
        Security::CFRef<__SecPolicy *>::~CFRef((const void **)v168);
        Security::CFRef<__SecCertificate *>::~CFRef((const void **)certificates);
        goto LABEL_19;
      }

      uint64_t v122 = (os_log_s *)secLogObjForScope("SecError");
      uint64_t v121 = 4294900248LL;
      if (!os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT)) {
LABEL_211:
      }
        Security::MacOSError::throwMe((Security::MacOSError *)v121);
      LOWORD(v137[0]) = 0;
      __int128 v123 = "Unable to copy certChain array";
    }

    else
    {
      uint64_t v121 = 4294900225LL;
      uint64_t v122 = (os_log_s *)secLogObjForScope("SecError");
      if (!os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_211;
      }
      LOWORD(v137[0]) = 0;
      __int128 v123 = "Certificate chain is NULL";
    }

    _os_log_impl(&dword_1804F4000, v122, OS_LOG_TYPE_DEFAULT, v123, (uint8_t *)v137, 2u);
    goto LABEL_211;
  }

  CFRetain(*((CFTypeRef *)this + 42));
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  cf[1] = v6;
  std::string::size_type v8 = (os_log_s *)secLogObjForScope("signer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)certificates = 138412290;
    *(CFTypeRef *)&certificates[4] = cf[1];
    _os_log_debug_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEBUG,  "signing context setup with existing cert chain: %@",  certificates,  0xCu);
  }

  CFArrayRef v128 = (CFArrayRef)cf[1];
LABEL_19:
  if (*((char *)this + 159) < 0)
  {
    std::string::__init_copy_ctor_external( (std::string *)certificates,  *((const std::string::value_type **)this + 17),  *((void *)this + 18));
  }

  else
  {
    *(_OWORD *)certificates = *(_OWORD *)((char *)this + 136);
    *(void *)&certificates[16] = *((void *)this + 19);
  }

  if (SBYTE7(v130) < 0) {
    operator delete(__p[0]);
  }
  *(_OWORD *)std::string __p = *(_OWORD *)certificates;
  *(void *)&__int128 v130 = *(void *)&certificates[16];
  memset(certificates, 170, 24);
  uint64_t v14 = *(void *)(*((void *)this + 1) + 24LL);
  if (!v14 || v14 == *v7) {
    goto LABEL_34;
  }
  *(void *)unint64_t v168 = *(void *)(v14 + 16);
  CFRetain(*(CFTypeRef *)v168);
  SecTrustRef trust = (SecTrustRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = (__SecTrust *)SecPolicyCreateiPhoneProfileApplicationSigning();
  SecTrustRef trust = v15;
  if (!v15)
  {
    __int128 v119 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13_Block_object_dispose(va, 8) = 0;
      _os_log_impl( &dword_1804F4000,  v119,  OS_LOG_TYPE_DEFAULT,  "Unable to create iPhoneProfileApplicationSigning SecPolicy",  (uint8_t *)&v138,  2u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18LL);
  }

  SecTrustRef v138 = 0LL;
  CFTypeID v16 = (Security::MacOSError *)SecTrustCreateWithCertificates(v128, v15, &v138);
  if ((_DWORD)v16) {
    Security::MacOSError::throwMe(v16);
  }
  if (!SecTrustEvaluateWithError(v138, 0LL))
  {
    Security::CFRef<__SecTrust *>::~CFRef((const void **)&v138);
    Security::CFRef<__SecPolicy *>::~CFRef((const void **)&trust);
    Security::CFRef<__SecCertificate *>::~CFRef((const void **)v168);
LABEL_34:
    std::string::basic_string[abi:ne180100]<0>(certificates, (char *)&unk_18065A197);
    goto LABEL_35;
  }

  v137[0] = 0LL;
  uint64_t v17 = (const __CFString *)SecCertificateCopySubjectAttributeValue( *(uint64_t *)v168,  (uint64_t)&oidOrganizationalUnitName);
  if (v137[0]) {
    CFRelease(v137[0]);
  }
  v137[0] = v17;
  if (!v17)
  {
    uint64_t v120 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( &dword_1804F4000,  v120,  OS_LOG_TYPE_DEFAULT,  "Unable to get team ID (OrganizationalUnitName) from Apple signed certificate",  (uint8_t *)buf,  2u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA4ALL);
  }

  Security::cfString((std::string *)certificates, v17);
  Security::CFRef<__CFString const*>::~CFRef(v137);
  Security::CFRef<__SecTrust *>::~CFRef((const void **)&v138);
  Security::CFRef<__SecPolicy *>::~CFRef((const void **)&trust);
  Security::CFRef<__SecCertificate *>::~CFRef((const void **)v168);
LABEL_35:
  uint64_t v18 = *((void *)this + 1);
  char v19 = certificates[23];
  uint64_t v20 = *(void *)&certificates[8];
  if (certificates[23] >= 0) {
    uint64_t v20 = certificates[23];
  }
  if ((*(_BYTE *)(v18 + 140) & 0x20) != 0)
  {
    if (!v20) {
      goto LABEL_72;
    }
    uint64_t v23 = *((unsigned __int8 *)this + 183);
    if ((v23 & 0x80u) == 0LL) {
      uint64_t v24 = *((unsigned __int8 *)this + 183);
    }
    else {
      uint64_t v24 = *((void *)this + 21);
    }
    if (v24 == v20)
    {
      CFIndex v25 = (const void **)((char *)this + 160);
      if (certificates[23] >= 0) {
        CFTypeID v26 = certificates;
      }
      else {
        CFTypeID v26 = *(unsigned __int8 **)certificates;
      }
      if ((v23 & 0x80) != 0)
      {
        if (!memcmp(*v25, v26, *((void *)this + 21))) {
          goto LABEL_72;
        }
      }

      else
      {
        if (!*((_BYTE *)this + 183)) {
          goto LABEL_72;
        }
        while (*(unsigned __int8 *)v25 == *v26)
        {
          CFIndex v25 = (const void **)((char *)v25 + 1);
          ++v26;
          if (!--v23) {
            goto LABEL_72;
          }
        }
      }
    }

LABEL_196:
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02LL);
  }

  CFRange v21 = (const std::string *)(v18 + 224);
  if (v20)
  {
    uint64_t v22 = *(unsigned __int8 *)(v18 + 247);
    if (*(char *)(v18 + 247) < 0)
    {
      if (!*(void *)(v18 + 232)) {
        goto LABEL_70;
      }
    }

    else if (!*(_BYTE *)(v18 + 247))
    {
      goto LABEL_70;
    }

    size_t v27 = *(void *)(v18 + 232);
    if ((v22 & 0x80u) == 0LL) {
      uint64_t v28 = *(unsigned __int8 *)(v18 + 247);
    }
    else {
      uint64_t v28 = *(void *)(v18 + 232);
    }
    if (v28 != v20) {
      goto LABEL_196;
    }
    uint64_t v29 = *(unsigned __int8 **)certificates;
    if (certificates[23] >= 0) {
      uint64_t v29 = certificates;
    }
    if ((v22 & 0x80) != 0)
    {
      if (memcmp(v21->__r_.__value_.__l.__data_, v29, v27)) {
        goto LABEL_196;
      }
    }

    else if ((_DWORD)v22)
    {
      while (v21->__r_.__value_.__s.__data_[0] == *v29)
      {
        CFRange v21 = (const std::string *)((char *)v21 + 1);
        ++v29;
        if (!--v22) {
          goto LABEL_70;
        }
      }

      goto LABEL_196;
    }

LABEL_155:
        SecTrustRef trust = (SecTrustRef)MEMORY[0x1895F87A8];
        uint64_t v144 = 0x40000000LL;
        v145 = ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke;
        v146 = (const Security::CodeSigning::CodeDirectory *)&__block_descriptor_tmp_39_15090;
        int v147 = this;
        uint64_t v148 = v62;
        BOOL v150 = v70;
        unsigned int v149 = v74;
        Security::CodeSigning::ArchEditor::Arch::eachDigest(v62, (uint64_t)&trust);
        char v83 = (void *)v72[1];
        int v84 = v72;
        uint64_t v38 = v61;
        if (v83)
        {
          do
          {
            uint64_t v72 = v83;
            char v83 = (void *)*v83;
          }

          while (v83);
        }

        else
        {
          do
          {
            uint64_t v72 = (void *)v84[2];
            BOOL v66 = *v72 == (void)v84;
            int v84 = v72;
          }

          while (!v66);
        }
      }

      if (*(void *)(*((void *)this + 1) + 32LL))
      {
        *(void *)unint64_t v168 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)unint64_t v168 = Security::CodeSigning::MachORep::identificationFor(*(const void ***)(v62 + 56), v73);
        BytePtr = (Security::BlobWrapper *)CFDataGetBytePtr(*(CFDataRef *)v168);
        CFIndex Length = CFDataGetLength(*(CFDataRef *)v168);
        CFRange v91 = (uint64_t *)Security::BlobWrapper::alloc(BytePtr, Length);
        Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::Maker::add( (uint64_t **)(v62 + 24),  0x10001u,  v91);
        Security::CFRef<__CFData const*>::~CFRef((const void **)v168);
        uint64_t v38 = v61;
      }

      *(void *)unint64_t v168 = 0LL;
      *(void *)&v168[2] = v168;
      *(void *)&__int128 v169 = 0x4002000000LL;
      *((void *)&v169 + 1) = __Block_byref_object_copy__40;
      *(void *)&__int128 v170 = __Block_byref_object_dispose__41;
      __int128 v171 = 0uLL;
      *((void *)&v170 + 1) = 0LL;
      SecTrustRef v138 = (SecTrustRef)MEMORY[0x1895F87A8];
      uint64_t v139 = 0x40000000LL;
      unsigned int v140 = ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_42;
      v141 = &unk_189678950;
      std::string v142 = v168;
      Security::CodeSigning::ArchEditor::Arch::eachDigest(v62, (uint64_t)&v138);
      *(void *)(v62 + 120) = Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::size( (void *)(v62 + 24),  (uint64_t **)(*(void *)&v168[2] + 40LL),  *(void *)(*((void *)this + 1) + 128LL),  v92,  v93,  v94,  v95,  v96,  0);
      _Block_object_dispose(v168, 8);
      if (*((void *)&v170 + 1))
      {
        *(void *)&__int128 v171 = *((void *)&v170 + 1);
        operator delete(*((void **)&v170 + 1));
      }

      std::string v97 = (void *)v60[1];
      if (v97)
      {
        do
        {
          int v98 = v97;
          std::string v97 = (void *)*v97;
        }

        while (v97);
      }

      else
      {
        do
        {
          int v98 = (void *)v60[2];
          BOOL v66 = *v98 == (void)v60;
          __int128 v60 = v98;
        }

        while (!v66);
      }

      __int128 v60 = v98;
    }

    while (v98 != v125);
  }

  (*(void (**)(void *))(*v38 + 56LL))(v38);
  unsigned int v99 = (void *)v38[3];
  if (v99 != v125)
  {
    do
    {
      std::string v100 = (uint64_t **)v99[5];
      (*(void (**)(void *, uint64_t **))(*v61 + 64LL))(v61, v100);
      *(void *)unint64_t v168 = 0LL;
      *(void *)&v168[2] = v168;
      *(void *)&__int128 v169 = 0x4802000000LL;
      *((void *)&v169 + 1) = __Block_byref_object_copy__44;
      *(void *)&__int128 v170 = __Block_byref_object_dispose__45;
      __int128 v171 = 0uLL;
      *((void *)&v170 + 1) = &v171;
      unint64_t v172 = 0LL;
      v137[0] = (CFTypeRef)MEMORY[0x1895F87A8];
      v137[1] = (CFTypeRef)0x40000000;
      v137[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_46;
      v137[3] = &unk_189678978;
      v137[4] = v168;
      Security::CodeSigning::ArchEditor::Arch::eachDigest((uint64_t)v100, (uint64_t)v137);
      v136 = (__CFDictionary *)0xAAAAAAAAAAAAAAAALL;
      std::string v101 = Security::CodeSigning::CodeDirectorySet::hashDict((Security::CodeSigning::CodeDirectorySet *)(*(void *)&v168[2] + 40LL));
      unint64_t v135 = 0xAAAAAAAAAAAAAAAALL;
      v136 = v101;
      CFMutableArrayRef v103 = Security::CodeSigning::CodeDirectorySet::hashList( (Security::CodeSigning::CodeDirectorySet *)(*(void *)&v168[2] + 40LL),  v102);
      CFDataRef theData = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
      unint64_t v135 = (unint64_t)v103;
      unint64_t v104 = *(const Security::CodeSigning::CodeDirectory **)(*(void *)&v168[2] + 64LL);
      if (!v104)
      {
        unint64_t v104 = *(const Security::CodeSigning::CodeDirectory **)(*(void *)(*(void *)&v168[2] + 40LL) + 40LL);
        *(void *)(*(void *)&v168[2] + 6Security::CodeSigning::Requirement::Maker::require(this, 4LL) = v104;
      }

      CFDataRef theData = Security::CodeSigning::SecCodeSigner::Signer::signCodeDirectory(this, v104, v136, v103);
      Security::CodeSigning::CodeDirectorySet::populate( (const void **)(*(void *)&v168[2] + 40LL),  (Security::CodeSigning::DiskRep::Writer *)v100);
      std::string::size_type v105 = (Security::BlobWrapper *)CFDataGetBytePtr(theData);
      CFIndex v106 = CFDataGetLength(theData);
      std::string v107 = (uint64_t *)Security::BlobWrapper::alloc(v105, v106);
      Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::Maker::add( v100 + 3,  0x10000u,  v107);
      if (!*(_BYTE *)(*((void *)this + 1) + 250LL))
      {
        std::string v115 = Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::make( (uint64_t)(v100 + 3),  v108,  v109,  v110,  v111,  v112,  v113,  v114);
        (*(void (**)(void *, uint64_t **, _DWORD *))(*v61 + 72LL))(v61, v100, v115);
      }

      Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
      Security::CFRef<__CFArray const*>::~CFRef((const void **)&v135);
      Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&v136);
      _Block_object_dispose(v168, 8);
      Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)&v170 + 8);
      std::string v116 = (void *)v99[1];
      if (v116)
      {
        do
        {
          __int128 v117 = v116;
          std::string v116 = (void *)*v116;
        }

        while (v116);
      }

      else
      {
        do
        {
          __int128 v117 = (void *)v99[2];
          BOOL v66 = *v117 == (void)v99;
          unsigned int v99 = v117;
        }

        while (!v66);
      }

      unsigned int v99 = v117;
    }

    while (v117 != v125);
  }

  if (!*(_BYTE *)(*((void *)this + 1) + 250LL)) {
    (*(void (**)(void *))(*v61 + 80LL))(v61);
  }
  (*(void (**)(void *))(*v61 + 8LL))(v61);
  size_t v58 = (unsigned int *)certificates;
LABEL_193:
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer(v58);
  Security::CFRef<__CFArray const*>::~CFRef(&cf[1]);
  if (SBYTE7(v130) < 0) {
    operator delete(__p[0]);
  }
}

void sub_18063C0BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, void *a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  if (a57 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)a59);
  operator delete(v62);
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer(&a62);
  Security::CodeSigning::PreSigningContext::~PreSigningContext((Security::CodeSigning::PreSigningContext *)&a17);
  _Unwind_Resume(a1);
}

const void **Security::CodeSigning::SecCodeSigner::Signer::prepare( Security::CodeSigning::SecCodeSigner::Signer *this, int a2)
{
  uint64_t v251 = *MEMORY[0x1895F89C0];
  if (*((_BYTE *)this + 321))
  {
    uint64_t v3 = *((void *)this + 3);
    *(_OWORD *)&v250[8] = 0uLL;
    *(void *)v250 = &v250[8];
    (*(void (**)(uint64_t, void, _BYTE *, void))(*(void *)v3 + 224LL))(v3, 0LL, v250, a2 | 0x4000200u);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)&v250[8]);
  }

  Security::CodeSigning::SecStaticCode::prepareProgress(*((Security::CodeSigning::SecStaticCode **)this + 2), 0);
  CFTypeRef cf = 0LL;
  *(void *)v250 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = (const __CFData *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 24LL))( *((void *)this + 3),  1LL);
  *(void *)v250 = v4;
  if (v4) {
    CFTypeRef cf = Security::makeCFDictionaryFrom(v4, v5);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)v250);
  if (!Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)
    || (Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)[13] & 2) != 0)
  {
    LOWORD(v6) = 0;
  }

  else
  {
    int v6 = *(_DWORD *)(*((void *)this + 1) + 140LL);
  }

  uint64_t v7 = (void **)((char *)this + 136);
  std::string::operator=((std::string *)((char *)this + 136), (const std::string *)(*((void *)this + 1) + 176LL));
  LODWORD(v_Block_object_dispose(va, 8) = *((char *)this + 159);
  if ((v8 & 0x80000000) != 0)
  {
    if (*((void *)this + 18)) {
      goto LABEL_17;
    }
  }

  else if (*((_BYTE *)this + 159))
  {
    goto LABEL_17;
  }

  if ((v6 & 1) != 0)
  {
    CFTypeID v9 = Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 1);
    std::string::basic_string[abi:ne180100]<0>(v250, (char *)&v9[bswap32(*((_DWORD *)v9 + 5))]);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v250;
    *((void *)this + 19) = *(void *)&v250[16];
    LOBYTE(v_Block_object_dispose(va, 8) = *((_BYTE *)this + 159);
  }

LABEL_90:
  uint64_t v34 = *((void *)this + 1);
  if ((Security::CodeSigning::SecCodeSigner::Signer *)((char *)this + 112) != (Security::CodeSigning::SecCodeSigner::Signer *)(v34 + 152)) {
    std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>( (uint64_t)this + 112,  *(void **)(v34 + 152),  (void *)(v34 + 160));
  }
  if (!*((void *)this + 16) && (v6 & 0x40) != 0)
  {
    std::set<unsigned int>::set[abi:ne180100]((uint64_t)v250, (void *)(*((void *)this + 2) + 344LL));
    uint64_t v35 = (char *)this + 120;
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 15));
    unsigned int v36 = *(void **)&v250[8];
    *((void *)this + 14) = *(void *)v250;
    *((void *)this + 15) = v36;
    uint64_t v37 = *(void *)&v250[16];
    *((void *)this + 16) = *(void *)&v250[16];
    if (v37)
    {
      void v36[2] = v35;
      *(void *)v250 = &v250[8];
      *(_OWORD *)&v250[8] = 0uLL;
      unsigned int v36 = 0LL;
    }

    else
    {
      *((void *)this + 14) = v35;
    }

    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v36);
  }

  Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 23, (CFTypeRef *)(*((void *)this + 1) + 64LL));
  if (!*((void *)this + 23) && (v6 & 4) != 0)
  {
    uint64_t v38 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80LL))( *((void *)this + 2),  5LL,  4294900235LL);
    Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 23, v38);
  }

  uint64_t v39 = *((void *)this + 1);
  std::string v40 = (CFTypeRef **)((char *)this + 192);
  v222 = (uint64_t *)((char *)this + 112);
  if ((Security::CodeSigning::SecCodeSigner::Signer *)((char *)this + 192) == (Security::CodeSigning::SecCodeSigner::Signer *)(v39 + 80))
  {
    uint64_t v45 = (CFTypeRef *)*((void *)this + 25);
  }

  else
  {
    unsigned int v41 = *(CFTypeRef **)(v39 + 80);
    int v42 = *(CFTypeRef **)(v39 + 88);
    unint64_t v43 = v42 - v41;
    uint64_t v44 = *((void *)this + 26);
    uint64_t v45 = (CFTypeRef *)*((void *)this + 24);
    if (v43 <= (v44 - (uint64_t)v45) >> 3)
    {
      int v52 = (const void **)*((void *)this + 25);
      int64_t v53 = (char *)v52 - (char *)v45;
      unint64_t v54 = v52 - v45;
      if (v54 >= v43)
      {
        if (v41 != v42)
        {
          do
            Security::CFRef<__CFData const*>::operator=(v45++, v41++);
          while (v41 != v42);
          int v52 = (const void **)*((void *)this + 25);
        }

        while (v52 != v45)
          int v52 = Security::CFRef<__CFData const*>::~CFRef(v52 - 1);
      }

      else
      {
        if (v52 != v45)
        {
          uint64_t v55 = v41;
          do
          {
            Security::CFRef<__CFData const*>::operator=(v45++, v55++);
            v53 -= 8LL;
          }

          while (v53);
          uint64_t v45 = (CFTypeRef *)*((void *)this + 25);
        }

        unint64_t v56 = &v41[v54];
        int v57 = v45;
        if (v56 != v42)
        {
          int v57 = v45;
          do
          {
            size_t v58 = *v56++;
            *v57++ = v58;
          }

          while (v56 != v42);
        }

        uint64_t v45 = v57;
      }
    }

    else
    {
      if (v45)
      {
        uint64_t v46 = (const void **)*((void *)this + 25);
        uint64_t v47 = (CFTypeRef *)*((void *)this + 24);
        if (v46 != v45)
        {
          do
            uint64_t v46 = Security::CFRef<__CFData const*>::~CFRef(v46 - 1);
          while (v46 != v45);
          uint64_t v47 = *v40;
        }

        *((void *)this + 25) = v45;
        operator delete(v47);
        uint64_t v44 = 0LL;
        *std::string v40 = 0LL;
        *((void *)this + 25) = 0LL;
        *((void *)this + 26) = 0LL;
      }

      uint64_t v48 = v44 >> 2;
      if (v44 >> 2 <= v43) {
        uint64_t v48 = v42 - v41;
      }
      unint64_t v49 = (unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8LL ? 0x1FFFFFFFFFFFFFFFLL : v48;
      if (v49 >> 61) {
LABEL_411:
      }
        std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
      uint64_t v45 = (CFTypeRef *)std::__allocate_at_least[abi:ne180100]<std::allocator<Security::CodeSigning::ResourceBuilder::Rule *>>(v49);
      *((void *)this + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = v45;
      *((void *)this + 25) = v45;
      *((void *)this + 26) = &v45[v50];
      while (v41 != v42)
      {
        CFTypeRef v51 = *v41++;
        *v45++ = v51;
      }
    }

    *((void *)this + 25) = v45;
  }

  for (CFIndex i = *v40; i != v45; ++i)
  {
    if (*i) {
      CFRetain(*i);
    }
  }

  if ((v6 & 0x200) != 0)
  {
    __int128 v60 = *v40;
    if (!**v40 && !v60[1] && !v60[2])
    {
      char v61 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80LL))( *((void *)this + 2),  8LL,  4294900235LL);
      if (v61) {
        Security::CFRef<__CFArray const*>::operator=(*v40, v61);
      }
      uint64_t v62 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80LL))( *((void *)this + 2),  9LL,  4294900235LL);
      if (v62) {
        Security::CFRef<__CFArray const*>::operator=(*v40 + 1, v62);
      }
      uint64_t v63 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80LL))( *((void *)this + 2),  10LL,  4294900235LL);
      if (v63) {
        Security::CFRef<__CFArray const*>::operator=(*v40 + 2, v63);
      }
    }
  }

  Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 27, (CFTypeRef *)(*((void *)this + 1) + 104LL));
  if ((v6 & 0x400) != 0 && !*((void *)this + 27))
  {
    uint64_t v64 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80LL))( *((void *)this + 2),  11LL,  4294900235LL);
    if (v64) {
      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 27, v64);
    }
  }

  *((_DWORD *)this + 72) = 0;
  uint64_t v65 = *((void *)this + 1);
  if (*(_BYTE *)(v65 + 144))
  {
    *((_DWORD *)this + 72) = *(_DWORD *)(v65 + 136);
    BOOL v66 = (os_log_s *)secLogObjForScope("signer");
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
LABEL_155:
      BOOL v67 = (v6 & 0x100) == 0;
      goto LABEL_156;
    }

    int v195 = *((_DWORD *)this + 72);
    *(_DWORD *)v250 = 67109120;
    *(_DWORD *)&v250[4] = v195;
    unsigned int v86 = "using explicit cdFlags=0x%x";
LABEL_346:
    _os_log_debug_impl(&dword_1804F4000, v66, OS_LOG_TYPE_DEBUG, v86, v250, 8u);
    goto LABEL_155;
  }

  if (cf)
  {
    int v82 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"CSFlags");
    char v83 = v82;
    if (v82)
    {
      CFTypeID v84 = CFGetTypeID(v82);
      if (v84 == CFNumberGetTypeID())
      {
        *((_DWORD *)this + 72) = Security::cfNumber<unsigned int>(v83);
        BOOL v66 = (os_log_s *)secLogObjForScope("signer");
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_155;
        }
        int v85 = *((_DWORD *)this + 72);
        *(_DWORD *)v250 = 67109120;
        *(_DWORD *)&v250[4] = v85;
        unsigned int v86 = "using numeric cdFlags=0x%x from Info.plist";
      }

      else
      {
        CFTypeID v116 = CFGetTypeID(v83);
        if (v116 != CFStringGetTypeID()) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
        }
        Security::cfString(&v231, (CFStringRef)v83);
        unsigned __int8 v117 = v231.__r_.__value_.__s.__size_;
        if ((v231.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          size_t v118 = v231.__r_.__value_.__s.__size_;
        }
        else {
          size_t v118 = v231.__r_.__value_.__l.__size_;
        }
        __int16 v220 = v6;
        if (v118)
        {
          if ((v231.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            __int128 v119 = &v231;
          }
          else {
            __int128 v119 = (std::string *)v231.__r_.__value_.__r.__words[0];
          }
          uint64_t v120 = memchr(v119, 44, v118);
          if (v120) {
            std::string::size_type v121 = v120 - (_BYTE *)v119;
          }
          else {
            std::string::size_type v121 = -1LL;
          }
        }

        else
        {
          std::string::size_type v121 = -1LL;
        }

        int v196 = 0;
        while (1)
        {
          memset(v250, 170, 24);
          if (v121 == -1LL)
          {
            if ((v117 & 0x80) != 0) {
              std::string::__init_copy_ctor_external( (std::string *)v250,  v231.__r_.__value_.__l.__data_,  v231.__r_.__value_.__l.__size_);
            }
            else {
              *(std::string *)v250 = v231;
            }
          }

          else
          {
            std::string::basic_string((std::string *)v250, &v231, 0LL, v121, (std::allocator<char> *)v237);
          }

          int v197 = v250[23];
          v198 = *(void **)v250;
          if (v250[23] >= 0) {
            size_t v199 = v250[23];
          }
          else {
            size_t v199 = *(void *)&v250[8];
          }
          if (v250[23] >= 0) {
            v200 = v250;
          }
          else {
            v200 = *(_BYTE **)v250;
          }
          v201 = "host";
          for (j = &kSecCodeDirectoryFlagTable;
                !*((_BYTE *)j + 12) || v199 != strlen(v201) || memcmp(v200, v201, v199);
                j += 2)
          {
            v203 = j[2];
            v201 = v203;
            if (!v203) {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02LL);
            }
          }

          int v204 = *((_DWORD *)j + 2);
          if (v197 < 0) {
            operator delete(v198);
          }
          v196 |= v204;
          if (v121 == -1LL) {
            break;
          }
          std::string::basic_string( (std::string *)v250,  &v231,  v121 + 1,  0xFFFFFFFFFFFFFFFFLL,  (std::allocator<char> *)v237);
          std::string v231 = *(std::string *)v250;
          unint64_t v205 = *(void *)&v250[16];
          v250[23] = 0;
          v250[0] = 0;
          std::string::size_type v206 = HIBYTE(v205);
          unsigned __int8 v117 = v206;
          if ((v206 & 0x80u) == 0LL) {
            std::string::size_type v207 = v206;
          }
          else {
            std::string::size_type v207 = v231.__r_.__value_.__l.__size_;
          }
          if (v207)
          {
            if ((v206 & 0x80u) == 0LL) {
              v208 = &v231;
            }
            else {
              v208 = (std::string *)v231.__r_.__value_.__r.__words[0];
            }
            v209 = memchr(v208, 44, v207);
            if (v209) {
              std::string::size_type v121 = v209 - (_BYTE *)v208;
            }
            else {
              std::string::size_type v121 = -1LL;
            }
          }

          else
          {
            std::string::size_type v121 = -1LL;
          }
        }

        *((_DWORD *)this + 72) = v196;
        BOOL v66 = (os_log_s *)secLogObjForScope("signer");
        LOWORD(v6) = v220;
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_155;
        }
        int v210 = *((_DWORD *)this + 72);
        *(_DWORD *)v250 = 67109120;
        *(_DWORD *)&v250[4] = v210;
        unsigned int v86 = "using text cdFlags=0x%x from Info.plist";
      }

      goto LABEL_346;
    }
  }

  BOOL v67 = (v6 & 0x100) == 0;
  if ((v6 & 0x100) != 0) {
    *((_DWORD *)this + 72) |= (*((_DWORD *)Security::CodeSigning::SecStaticCode::codeDirectory( *((Security::CodeSigning::SecStaticCode **)this + 2),  0)
  }
                               + 3) << 8) & 0x10000;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)this + 72) = bswap32(*((_DWORD *)Security::CodeSigning::SecStaticCode::codeDirectory( *((Security::CodeSigning::SecStaticCode **)this + 2),  0)
                                     + 3) & 0xFDFFFFFF);
    CFRange v91 = (os_log_s *)secLogObjForScope("signer");
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      int v92 = *((_DWORD *)this + 72);
      *(_DWORD *)v250 = 67109120;
      *(_DWORD *)&v250[4] = v92;
      _os_log_debug_impl(&dword_1804F4000, v91, OS_LOG_TYPE_DEBUG, "using inherited cdFlags=0x%x", v250, 8u);
    }
  }

LABEL_206:
  memset(&__str, 170, sizeof(__str));
  (*(void (**)(std::string *__return_ptr))(**((void **)this + 3) + 56LL))(&__str);
  memset(&v228, 0, sizeof(v228));
  CFTypeRef v227 = 0LL;
  std::string::size_type v96 = __str.__r_.__value_.__s.__size_;
  if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type v96 = __str.__r_.__value_.__l.__size_;
  }
  if (v96)
  {
    Security::CFRef<__CFData const*>::operator=(&v227, (CFTypeRef *)(*((void *)this + 1) + 40LL));
    CFTypeRef v97 = v227;
    if (!v227 && (v6 & 8) != 0)
    {
      int v98 = (const void *)Security::CodeSigning::SecStaticCode::resourceDictionary( *((Security::CodeSigning::SecStaticCode **)this + 2),  0);
      CFTypeRef v97 = v98;
      if (v98)
      {
        CFRetain(v98);
        if (v227) {
          CFRelease(v227);
        }
        CFTypeRef v227 = v97;
        goto LABEL_219;
      }

      CFTypeRef v97 = v227;
    }

    if (v97) {
      goto LABEL_219;
    }
    if (cf)
    {
      std::string v101 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x189604AC0]);
      uint64_t v102 = v101;
      if (v101)
      {
        CFTypeID v103 = CFGetTypeID(v101);
        if (v103 == CFStringGetTypeID())
        {
          CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
          if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            size_t v104 = __str.__r_.__value_.__s.__size_;
          }
          else {
            size_t v104 = __str.__r_.__value_.__l.__size_;
          }
          memset(v237, 170, 24);
          std::string::basic_string[abi:ne180100]((uint64_t)v237, v104 + 1);
          if (v237[23] >= 0) {
            std::string::size_type v105 = v237;
          }
          else {
            std::string::size_type v105 = *(_BYTE **)v237;
          }
          if (v104)
          {
            if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              p_str = &__str;
            }
            else {
              p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
            }
            memmove(v105, p_str, v104);
          }

          *(_WORD *)&v105[v104] = 47;
          Security::cfString(&__p, v102);
          if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            std::string::size_type v108 = __p.__r_.__value_.__s.__size_;
          }
          else {
            std::string::size_type v108 = __p.__r_.__value_.__l.__size_;
          }
          uint64_t v109 = std::string::append((std::string *)v237, (const std::string::value_type *)p_p, v108);
          uint64_t v112 = (std::string::value_type *)v109->__r_.__value_.__r.__words[0];
          std::string::size_type v111 = v109->__r_.__value_.__l.__size_;
          LODWORD(v242) = v109->__r_.__value_.__r.__words[2];
          *(_DWORD *)((char *)&v242 + 3) = *(_DWORD *)((char *)&v109->__r_.__value_.__r.__words[2] + 3);
          int v113 = (char)v109->__r_.__value_.__s.__size_;
          v109->__r_.__value_.__l.__size_ = 0LL;
          v109->__r_.__value_.__l.__cap_ = 0LL;
          v109->__r_.__value_.__r.__words[0] = 0LL;
          if (v113 < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v250, v112, v111);
            char v115 = v250[23];
            uint64_t v114 = *(std::string::value_type **)v250;
          }

          else
          {
            *(void *)v250 = v112;
            *(void *)&v250[8] = v111;
            *(_DWORD *)&v250[16] = (_DWORD)v242;
            *(_DWORD *)&v250[19] = *(_DWORD *)((char *)&v242 + 3);
            v250[23] = v113;
            uint64_t v114 = v112;
            char v115 = v113;
          }

          if (v115 >= 0) {
            v212 = (Security *)v250;
          }
          else {
            v212 = (Security *)v114;
          }
          theData.__r_.__value_.__r.__words[0] = (std::string::size_type)Security::makeCFURL(v212, 0LL, 0LL, v110);
          File = Security::cfLoadFile((Security *)theData.__r_.__value_.__l.__data_, v213);
          Security::CFRef<__CFURL const*>::~CFRef((const void **)&theData.__r_.__value_.__l.__data_);
          if ((v250[23] & 0x80000000) != 0) {
            operator delete(*(void **)v250);
          }
          CFMutableDictionaryRef theDict = File;
          if (v113 < 0) {
            operator delete(v112);
          }
          if ((v237[23] & 0x80000000) != 0) {
            operator delete(*(void **)v237);
          }
          if (theDict)
          {
            CFPropertyListRef CFDictionaryFrom = Security::makeCFDictionaryFrom(theDict, v215);
            if (CFDictionaryFrom)
            {
              if (v227) {
                CFRelease(v227);
              }
              CFTypeRef v227 = CFDictionaryFrom;
            }
          }

          Security::CFRef<__CFData const*>::~CFRef((const void **)&theDict);
        }

        CFTypeRef v97 = v227;
        if (!v227) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
        }
LABEL_219:
        unsigned int v99 = CFDictionaryGetValue((CFDictionaryRef)v97, @"rules");
        if (!v99 || (CFTypeID v100 = CFGetTypeID(v99), v100 != CFDictionaryGetTypeID())) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
        }
        if (v227) {
          goto LABEL_260;
        }
        goto LABEL_257;
      }

      CFTypeRef v97 = v227;
      if (v227) {
        goto LABEL_219;
      }
    }

LABEL_257:
    uint64_t v122 = (const void *)(*(uint64_t (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3) + 200LL))( *((void *)this + 3),  this);
    if (v227) {
      CFRelease(v227);
    }
    CFTypeRef v227 = v122;
LABEL_260:
    std::string::operator=(&v228, &__str);
    if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16LL))(this) & 0x40) != 0)
    {
      __int128 v123 = (const __CFURL *)(*(uint64_t (**)(void))(**((void **)this + 3) + 48LL))(*((void *)this + 3));
      Security::cfStringRelease((Security *)v250, v123);
      std::string v228 = *(std::string *)v250;
    }
  }

  uint64_t v124 = *((void *)this + 1);
  uint64_t v125 = *(void *)(v124 + 48);
  if (v125 == v69)
  {
    *((_BYTE *)this + 320) = 0;
  }

  else if (v125)
  {
    double v126 = MEMORY[0x186DFE188]();
    if (v126 > CFAbsoluteTimeGetCurrent()) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
    }
    *((_BYTE *)this + 320) = 1;
    *((double *)this + 39) = v126;
    uint64_t v124 = *((void *)this + 1);
  }

  else
  {
    *((_BYTE *)this + 320) = 1;
    *((void *)this + 39) = 0LL;
  }

  CFRange v127 = *(const __CFNumber **)(v124 + 256);
  if (v127) {
    unint64_t v128 = Security::cfNumber<unsigned long>(v127);
  }
  else {
    unint64_t v128 = (*(uint64_t (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3)
  }
                                                                                             + 216LL))( *((void *)this + 3),  this);
  *((void *)this + 3_Block_object_dispose(va, 8) = v128;
  (*(void (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3) + 72LL))( *((void *)this + 3),  this);
  if (!*((void *)this + 16))
  {
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(v222, 1u, 1);
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(v222, 2u, 2);
  }

  std::string::size_type v129 = __str.__r_.__value_.__s.__size_;
  if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type v129 = __str.__r_.__value_.__l.__size_;
  }
  if (!v129) {
    goto LABEL_316;
  }
  if ((char)v228.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v226, v228.__r_.__value_.__l.__data_, v228.__r_.__value_.__l.__size_);
    if ((__str.__r_.__value_.__s.__size_ & 0x80) == 0) {
      goto LABEL_280;
    }
  }

  else
  {
    std::string v226 = v228;
    if ((__str.__r_.__value_.__s.__size_ & 0x80) == 0)
    {
LABEL_280:
      std::string v225 = __str;
      goto LABEL_283;
    }
  }

  std::string::__init_copy_ctor_external(&v225, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
LABEL_283:
  CFTypeRef v130 = v227;
  __int128 v131 = (os_log_s *)secLogObjForScope("codesign");
  BOOL v132 = os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG);
  if (v132)
  {
    *(_WORD *)v250 = 0;
    _os_log_debug_impl(&dword_1804F4000, v131, OS_LOG_TYPE_DEBUG, "start building resource directory", v250, 2u);
  }

  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = Security::makeCFMutableDictionary((Security *)v132);
  uint64_t v139 = Security::cfget<__CFDictionary const*>(v130, (uint64_t)"rules", v133, v134, v135, v136, v137, v138, v218);
  if (!*(void *)(*((void *)this + 1) + 288LL))
  {
    if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16LL))(this) & 0x800) != 0)
    {
      uint64_t v148 = (Security::CodeSigning::LimitedAsync *)operator new(0x10uLL);
      Security::CodeSigning::LimitedAsync::LimitedAsync(v148, 0);
      *(void *)(*((void *)this + 1) + 288LL) = v148;
    }

    else
    {
      unsigned int v140 = (Security::CodeSigning::LimitedAsync *)operator new(0x10uLL);
      v141 = (unsigned int *)(*(uint64_t (**)(void))(**((void **)this + 3) + 144LL))(*((void *)this + 3));
      Security::UnixPlusPlus::FileDesc::mediumType((std::string *)v250, (Security::UnixPlusPlus::FileDesc *)*v141);
      uint64_t v142 = v250[23];
      if (v250[23] < 0) {
        uint64_t v142 = *(void *)&v250[8];
      }
      if (v142 == 11)
      {
        std::string v143 = (uint64_t *)v250;
        if (v250[23] < 0) {
          std::string v143 = *(uint64_t **)v250;
        }
        uint64_t v144 = *v143;
        uint64_t v145 = *(uint64_t *)((char *)v143 + 3);
        unsigned __int8 v147 = v144 == 0x74532064696C6F53LL && v145 == 0x6574617453206469LL;
      }

      else
      {
        unsigned __int8 v147 = 0;
      }

      Security::CodeSigning::LimitedAsync::LimitedAsync(v140, v147);
      *(void *)(*((void *)this + 1) + 288LL) = v140;
      if ((v250[23] & 0x80000000) != 0) {
        operator delete(*(void **)v250);
      }
    }
  }

  if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16LL))(this) & 0x10) != 0)
  {
    CFMutableDictionaryRef v168 = 0LL;
  }

  else
  {
    theData.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    __int128 v155 = Security::cfget<__CFDictionary const*>(v130, (uint64_t)"rules2", v149, v150, v151, v152, v153, v154, v219);
    Security::CFCopyRef<__CFDictionary const*>::CFCopyRef(&theData, v155);
    if (!theData.__r_.__value_.__r.__words[0])
    {
      CFDataRef v163 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{+%O'^(Frameworks|SharedFrameworks|PlugIns|Plug-ins|XPCServices|Helpers|MacOS|Library/(Automator |Spotlight|LoginItems))/' = {nested=#T, weight=0}}",  v156,  v157,  v158,  v159,  v160,  v161,  v162,  (uint64_t)v139);
      if (theData.__r_.__value_.__r.__words[0]) {
        CFRelease(theData.__r_.__value_.__l.__data_);
      }
      theData.__r_.__value_.__r.__words[0] = (std::string::size_type)v163;
    }

    *(void *)&__int128 v164 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v164 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v250[72] = v164;
    *(_OWORD *)&v250[56] = v164;
    *(_OWORD *)&v250[40] = v164;
    *(_OWORD *)&v250[24] = v164;
    *(_OWORD *)&v250[8] = v164;
    *(void *)&v250[88] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v250 = off_189676D58;
    Security::Mutex::Mutex((pthread_mutex_t *)&v250[8]);
    v250[72] = 0;
    *(void *)&v250[80] = 0LL;
    *(void *)&v250[88] = dispatch_group_create();
    CFMutableDictionaryRef v242 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary(*(Security **)&v250[88]);
    CFMutableDictionaryRef v242 = CFMutableDictionary;
    *(void *)&__int128 v166 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v166 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v240 = v166;
    __int128 v241 = v166;
    __int128 v238 = v166;
    *(_OWORD *)value = v166;
    *(_OWORD *)v237 = v166;
    *(_OWORD *)&v237[16] = v166;
    char v167 = *((_BYTE *)this + 321);
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
    Security::CodeSigning::ResourceBuilder::ResourceBuilder( (std::string::size_type)v237,  (uint64_t)&v226,  &v225,  theData.__r_.__value_.__l.__data_,  v167,  (uint64_t)&__p);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)__p.__r_.__value_.__l.__size_);
    (*(void (**)(void, _BYTE *))(**((void **)this + 3) + 64LL))(*((void *)this + 3), v237);
    __p.__r_.__value_.__r.__words[0] = MEMORY[0x1895F87A8];
    __p.__r_.__value_.__l.__size_ = 0x40000000LL;
    __p.__r_.__value_.__l.__cap_ = (std::string::size_type)___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke;
    v245 = &__block_descriptor_tmp_26_15115;
    v246 = this;
    CFMutableDictionaryRef v247 = CFMutableDictionary;
    v248 = v250;
    v249 = v237;
    Security::CodeSigning::ResourceBuilder::scan((uint64_t)v237, (uint64_t)&__p, 0LL);
    Security::Dispatch::Group::wait((Security::Dispatch::Group *)v250);
    CFDictionaryAddValue(theDict, @"rules2", value[1]);
    CFMutableDictionaryRef v168 = v242;
    CFDictionaryAddValue(theDict, @"files2", v242);
    Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)v237);
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v242);
    Security::Dispatch::Group::~Group((Security::Dispatch::Group *)v250);
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theData.__r_.__value_.__l.__data_);
  }

  CFDictionaryAddValue(theDict, @"rules", v139);
  __int128 v169 = (Security *)(*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16LL))(this);
  if ((v169 & 0x20) == 0)
  {
    theData.__r_.__value_.__r.__words[0] = 0LL;
    theData.__r_.__value_.__l.__size_ = (std::string::size_type)&theData;
    theData.__r_.__value_.__l.__cap_ = 0x3002000000LL;
    v234 = __Block_byref_object_copy__15118;
    v235 = __Block_byref_object_dispose__15119;
    unint64_t v236 = 0xAAAAAAAAAAAAAAAALL;
    CFMutableDictionaryRef v170 = Security::makeCFMutableDictionary(v169);
    *(void *)&__int128 v171 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v171 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v250[64] = v171;
    *(_OWORD *)&v250[80] = v171;
    *(_OWORD *)&v250[32] = v171;
    *(_OWORD *)&v250[48] = v171;
    *(_OWORD *)v250 = v171;
    *(_OWORD *)&v250[16] = v171;
    char v172 = *((_BYTE *)this + 321);
    *(_OWORD *)&v237[8] = 0uLL;
    unint64_t v236 = (unint64_t)v170;
    *(void *)v237 = &v237[8];
    Security::CodeSigning::ResourceBuilder::ResourceBuilder( (std::string::size_type)v250,  (uint64_t)&v226,  &v225,  v139,  v172,  (uint64_t)v237);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)&v237[8]);
    (*(void (**)(void, _BYTE *))(**((void **)this + 3) + 64LL))(*((void *)this + 3), v250);
    *(void *)v237 = MEMORY[0x1895F87A8];
    *(void *)&v237[8] = 0x40000000LL;
    *(void *)&v237[16] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_31;
    *(void *)&v237[24] = &unk_189678900;
    *((void *)&v238 + 1) = v168;
    value[0] = v250;
    *(void *)&__int128 v238 = &theData;
    Security::CodeSigning::ResourceBuilder::scan((uint64_t)v250, (uint64_t)v237, 0LL);
    CFDictionaryAddValue(theDict, @"files", *(const void **)(theData.__r_.__value_.__l.__size_ + 40));
    Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)v250);
    _Block_object_dispose(&theData, 8);
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v236);
  }

  uint64_t v173 = Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 12, theDict);
  CFDataRef Data = CFPropertyListCreateData(0LL, *v173, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  __int128 v175 = (const void *)*((void *)this + 13);
  if (v175) {
    CFRelease(v175);
  }
  *((void *)this + 13) = Data;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&theDict);
  if ((char)v226.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v226.__r_.__value_.__l.__data_);
    if ((v6 & 0x80) == 0) {
      goto LABEL_329;
    }
    goto LABEL_317;
  }

LABEL_316:
  if ((v6 & 0x80) == 0) {
    goto LABEL_329;
  }
LABEL_317:
  if ((*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL) + 80LL))(*(void *)(*((void *)this + 2) + 32LL)))
  {
    __int128 v176 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL) + 80LL))(*(void *)(*((void *)this + 2) + 32LL));
    unint64_t v177 = Security::Universal::bestNativeArch(v176);
  }

  else
  {
    Security::MainMachOImage::MainMachOImage((Security::MainMachOImage *)v250);
    unsigned int v179 = *(_DWORD *)(*(void *)&v250[8] + 4LL);
    LODWORD(v17_Block_object_dispose(va, 8) = *(_DWORD *)(*(void *)&v250[8] + 8LL);
    unsigned int v180 = bswap32(v179);
    if (v250[33]) {
      uint64_t v181 = v180;
    }
    else {
      uint64_t v181 = v179;
    }
    unsigned int v182 = bswap32(v178);
    if (v250[33]) {
      uint64_t v178 = v182;
    }
    else {
      uint64_t v178 = v178;
    }
    unint64_t v177 = v181 | (v178 << 32);
  }

  *((void *)this + 2_Block_object_dispose(va, 8) = v177;
  v183 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)this + 29,  v177,  (uint64_t *)this + 28);
  Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes( (uint64_t **)v183 + 5,  *((Security::CodeSigning::SecStaticCode **)this + 2));
  uint64_t v184 = *((void *)this + 2);
  v224[0] = MEMORY[0x1895F87A8];
  v224[1] = 0x40000000LL;
  v224[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke;
  v224[3] = &__block_descriptor_tmp_15107;
  v224[4] = this;
  *(void *)v250 = MEMORY[0x1895F87A8];
  *(void *)&v250[8] = 0x40000000LL;
  *(void *)&v250[16] = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
  *(void *)&v250[24] = &unk_189678518;
  *(void *)&v250[32] = v224;
  *(void *)&v250[40] = v184;
  Security::CodeSigning::SecStaticCode::visitOtherArchitectures(v184, (uint64_t)v250);
LABEL_329:
  if (!v67)
  {
    if ((*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL) + 80LL))(*(void *)(*((void *)this + 2) + 32LL)))
    {
      unint64_t v186 = Security::Universal::bestNativeArch(v185);
    }

    else
    {
      Security::MainMachOImage::MainMachOImage((Security::MainMachOImage *)v250);
      unsigned int v188 = *(_DWORD *)(*(void *)&v250[8] + 4LL);
      LODWORD(v187) = *(_DWORD *)(*(void *)&v250[8] + 8LL);
      unsigned int v189 = bswap32(v188);
      if (v250[33]) {
        uint64_t v190 = v189;
      }
      else {
        uint64_t v190 = v188;
      }
      unsigned int v191 = bswap32(v187);
      if (v250[33]) {
        uint64_t v187 = v191;
      }
      else {
        uint64_t v187 = v187;
      }
      unint64_t v186 = v190 | (v187 << 32);
    }

    *((void *)this + 32) = v186;
    v192 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)this + 33,  v186,  (uint64_t *)this + 32);
    Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions( (uint64_t **)v192 + 5,  *((Security::CodeSigning::SecStaticCode **)this + 2));
    uint64_t v193 = *((void *)this + 2);
    v223[0] = MEMORY[0x1895F87A8];
    v223[1] = 0x40000000LL;
    v223[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke_2;
    v223[3] = &__block_descriptor_tmp_9_15108;
    v223[4] = this;
    *(void *)v250 = MEMORY[0x1895F87A8];
    *(void *)&v250[8] = 0x40000000LL;
    *(void *)&v250[16] = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
    *(void *)&v250[24] = &unk_189678518;
    *(void *)&v250[32] = v223;
    *(void *)&v250[40] = v193;
    Security::CodeSigning::SecStaticCode::visitOtherArchitectures(v193, (uint64_t)v250);
  }

  Security::CFRef<__CFDictionary const*>::~CFRef(&v227);
  return Security::CFRef<__CFDictionary const*>::~CFRef(&cf);
}

void sub_18063DEC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, const void *a30, void *a31, uint64_t a32, int a33, __int16 a34, char a35, char a36, void *a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, const void *a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  if (a73 < 0) {
    operator delete(__p);
  }
  if (a62 < 0) {
    operator delete(a57);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&a30);
  if (a36 < 0) {
    operator delete(a31);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&a50);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::PreSigningContext::~PreSigningContext( Security::CodeSigning::PreSigningContext *this)
{
}

char *std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  int v6 = (char *)(a1 + 1);
  __int128 v5 = (int *)a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        int v6 = (char *)v5;
        int v7 = v5[8];
        int v8 = *((_DWORD *)v6 + 9);
        BOOL v9 = SHIDWORD(a2) < v8;
        if ((_DWORD)a2 != v7) {
          BOOL v9 = (int)a2 < v7;
        }
        if (!v9) {
          break;
        }
        __int128 v5 = *(int **)v6;
        std::string v10 = (uint64_t **)v6;
        if (!*(void *)v6) {
          goto LABEL_14;
        }
      }

      BOOL v11 = v8 < SHIDWORD(a2);
      int v12 = (_DWORD)a2 == v7 ? v11 : v7 < (int)a2;
      if (v12 != 1) {
        break;
      }
      std::string v10 = (uint64_t **)(v6 + 8);
      __int128 v5 = (int *)*((void *)v6 + 1);
      if (!v5) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    std::string v10 = a1 + 1;
LABEL_14:
    uint64_t v13 = v6;
    int v6 = (char *)operator new(0x40uLL);
    uint64_t v14 = *a3;
    *((void *)v6 + 7) = 0LL;
    *((void *)v6 + 6) = 0LL;
    *((void *)v6 + 4) = v14;
    *((void *)v6 + 5) = v6 + 48;
    *(void *)int v6 = 0LL;
    *((void *)v6 + 1) = 0LL;
    *((void *)v6 + 2) = v13;
    os_log_s *v10 = (uint64_t *)v6;
    size_t v15 = (uint64_t *)**a1;
    CFTypeID v16 = (uint64_t *)v6;
    if (v15)
    {
      *a1 = v15;
      CFTypeID v16 = *v10;
    }

    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }

  return v6;
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::populate( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10, int a11)
{
  v106[4] = *(Security::CodeSigning::SecCodeSigner::Signer **)MEMORY[0x1895F89C0];
  (*(void (**)(void **__return_ptr))(**(void **)(a1 + 24) + 40LL))(__p);
  uint64_t v19 = *(void *)(a1 + 304);
  Security::UnixPlusPlus::FileDesc::close((Security::UnixPlusPlus::FileDesc *)(a2 + 40));
  if (v102 >= 0) {
    uint64_t v20 = __p;
  }
  else {
    uint64_t v20 = (void **)__p[0];
  }
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)(a2 + 40), (const char *)v20, 0, 438);
  *(void *)(a2 + 56) = a6;
  *(void *)(a2 + 64) = v19;
  *(void *)(a2 + 4_Block_object_dispose(va, 8) = a5;
  if (v102 < 0) {
    operator delete(__p[0]);
  }
  *(_DWORD *)(a2 + 72) = *(_DWORD *)(a1 + 288);
  std::string::operator=((std::string *)(a2 + 88), (const std::string *)(a1 + 136));
  std::string::operator=((std::string *)(a2 + 112), (const std::string *)(a1 + 160));
  *(_BYTE *)(a2 + 80) = *(_BYTE *)(*(void *)(a1 + 8) + 248LL);
  *(void *)(a2 + 16_Block_object_dispose(va, 8) = a8;
  *(void *)(a2 + 176) = a9;
  *(void *)(a2 + 184) = a7;
  uint64_t v95 = a4;
  char v96 = a7;
  *(_BYTE *)(a2 + 192) = ((*(unsigned __int16 (**)(uint64_t))(*(void *)a1 + 16LL))(a1) >> 8) & 1;
  unsigned int v99 = 0LL;
  uint64_t v100 = 0LL;
  int v98 = &v99;
  size_t v21 = (void *)*a10;
  if ((void *)*a10 != a10 + 1)
  {
    do
    {
      uint64_t v22 = v99;
      uint64_t v23 = &v99;
      if (v98 == &v99) {
        goto LABEL_13;
      }
      uint64_t v24 = v99;
      CFIndex v25 = &v99;
      if (v99)
      {
        do
        {
          uint64_t v23 = (uint64_t **)v24;
          uint64_t v24 = (uint64_t *)v24[1];
        }

        while (v24);
      }

      else
      {
        do
        {
          uint64_t v23 = (uint64_t **)v25[2];
          BOOL v26 = *v23 == (uint64_t *)v25;
          CFIndex v25 = v23;
        }

        while (v26);
      }

      unsigned int v27 = *((_DWORD *)v21 + 8);
      if (*((_DWORD *)v23 + 8) < v27)
      {
LABEL_13:
        if (v99) {
          uint64_t v28 = v23;
        }
        else {
          uint64_t v28 = &v99;
        }
        if (v99) {
          std::string::size_type v29 = v23 + 1;
        }
        else {
          std::string::size_type v29 = &v99;
        }
      }

      else
      {
        uint64_t v28 = &v99;
        std::string::size_type v29 = &v99;
        if (v99)
        {
          std::string::size_type v29 = &v99;
          while (1)
          {
            while (1)
            {
              uint64_t v28 = (uint64_t **)v22;
              unsigned int v33 = *((_DWORD *)v22 + 8);
              if (v27 >= v33) {
                break;
              }
              uint64_t v22 = *v28;
              std::string::size_type v29 = v28;
              if (!*v28) {
                goto LABEL_20;
              }
            }

            if (v33 >= v27) {
              break;
            }
            std::string::size_type v29 = v28 + 1;
            uint64_t v22 = v28[1];
            if (!v22) {
              goto LABEL_20;
            }
          }
        }
      }

      if (!*v29)
      {
LABEL_20:
        memset(v106, 170, 24);
        std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__construct_node<std::pair<unsigned int const,Security::CFCopyRef<__CFData const*>> const&>( v106,  (uint64_t)&v98,  *((_DWORD *)v21 + 8),  (const void *)v21[5]);
        uint64_t v30 = (uint64_t *)v106[0];
        *(void *)v106[0] = 0LL;
        v30[1] = 0LL;
        v30[2] = (uint64_t)v28;
        *std::string::size_type v29 = v30;
        if (*v98)
        {
          int v98 = (uint64_t **)*v98;
          uint64_t v30 = *v29;
        }

        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v99, v30);
        ++v100;
        v106[0] = 0LL;
        std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v106);
      }

      std::string::size_type v31 = (void *)v21[1];
      if (v31)
      {
        do
        {
          uint64_t v32 = v31;
          std::string::size_type v31 = (void *)*v31;
        }

        while (v31);
      }

      else
      {
        do
        {
          uint64_t v32 = (void *)v21[2];
          BOOL v26 = *v32 == (void)v21;
          size_t v21 = v32;
        }

        while (!v26);
      }

      size_t v21 = v32;
    }

    while (v32 != a10 + 1);
  }

  if ((uint64_t ***)(a2 + 200) != &v98)
  {
    uint64_t v34 = v98;
    if (*(void *)(a2 + 216))
    {
      unsigned int v36 = (uint64_t **)(a2 + 208);
      uint64_t v35 = *(void *)(a2 + 208);
      uint64_t v37 = *(Security::CodeSigning::SecCodeSigner::Signer ***)(a2 + 200);
      *(void *)(a2 + 200) = a2 + 208;
      *(void *)(v35 + 16) = 0LL;
      *(void *)(a2 + 20_Block_object_dispose(va, 8) = 0LL;
      *(void *)(a2 + 216) = 0LL;
      if (v37[1]) {
        uint64_t v38 = v37[1];
      }
      else {
        uint64_t v38 = (Security::CodeSigning::SecCodeSigner::Signer *)v37;
      }
      v106[0] = (Security::CodeSigning::SecCodeSigner::Signer *)(a2 + 200);
      v106[1] = v38;
      v106[2] = v38;
      if (v38)
      {
        v106[1] = (Security::CodeSigning::SecCodeSigner::Signer *)std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v38);
        uint64_t v39 = &v99;
        if (v34 != &v99)
        {
          do
          {
            *((_DWORD *)v38 + _Block_object_dispose(va, 8) = *((_DWORD *)v34 + 8);
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)v38 + 5, (CFTypeRef *)v34 + 5);
            std::string v40 = *v36;
            unsigned int v41 = (uint64_t **)(a2 + 208);
            int v42 = (uint64_t **)(a2 + 208);
            if (*v36)
            {
              do
              {
                while (1)
                {
                  unsigned int v41 = (uint64_t **)v40;
                  if (*((_DWORD *)v106[2] + 8) >= *((_DWORD *)v40 + 8)) {
                    break;
                  }
                  std::string v40 = (uint64_t *)*v40;
                  int v42 = v41;
                  if (!*v41) {
                    goto LABEL_51;
                  }
                }

                std::string v40 = (uint64_t *)v40[1];
              }

              while (v40);
              int v42 = v41 + 1;
            }

void sub_18063ECC4( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, __int128 buf)
{
  if (a2 == 1)
  {
    uint64_t v24 = __cxa_begin_catch(a1);
    CFIndex v25 = (os_log_s *)secLogObjForScope("SecWarning");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = (*(uint64_t (**)(void *))(*(void *)v24 + 16LL))(v24);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "failed to parse entitlements: %s",  (uint8_t *)&buf,  0xCu);
    }

    __cxa_rethrow();
  }

  Security::CFRef<__CFData const*>::~CFRef(&a12);
  _Unwind_Resume(a1);
}

void sub_18063EDA8()
{
}

void sub_18063EDBC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_18063EDCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void **a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

CFDataRef Security::CodeSigning::SecCodeSigner::Signer::signCodeDirectory( Security::CodeSigning::SecCodeSigner::Signer *this, const Security::CodeSigning::CodeDirectory *a2, const __CFDictionary *a3, const __CFArray *a4)
{
  uint64_t v116 = *MEMORY[0x1895F89C0];
  if (!*((_BYTE *)this + 322))
  {
    *(void *)int v113 = 0LL;
    if (*(void *)(*((void *)this + 1) + 24LL) != *MEMORY[0x189605018])
    {
      cmsEncoderOut[0] = 0LL;
      uint64_t updated = CMSEncoderCreate(cmsEncoderOut);
      if (!(_DWORD)updated)
      {
        CMSEncoderRef v10 = cmsEncoderOut[0];
        if (!cmsEncoderOut[0]
          || *((_DWORD *)cmsEncoderOut[0] + 4)
          || (*((_DWORD *)cmsEncoderOut[0] + 30) = 4,
              CMSEncoderAddSigners(v10, *(CFTypeRef *)(*((void *)this + 1) + 24LL)),
              CMSEncoderSetSignerAlgorithm(v10, @"sha256"),
              *((_DWORD *)v10 + 4)))
        {
          uint64_t updated = 4294967246LL;
        }

        else
        {
          *((_BYTE *)v10 + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = 1;
          if (*((_BYTE *)this + 320))
          {
            *((_DWORD *)v10 + 18) |= 8u;
            double Current = *((double *)this + 39);
            if (Current == 0.0 && (Current = CFAbsoluteTimeGetCurrent(), (CMSEncoderRef v10 = cmsEncoderOut[0]) == 0LL)
              || *((_DWORD *)v10 + 4))
            {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
            }

            *((double *)v10 + 10) = Current;
          }

          if (a3)
          {
            *((_DWORD *)v10 + 18) |= 0x20u;
            CFRetain(a3);
            *((void *)v10 + 17) = a3;
            *(void *)propertyList = 0xAAAAAAAAAAAAAAAALL;
            Security::CFTemp<__CFDictionary const*>::CFTemp( (CFTypeRef *)propertyList,  (uint64_t)"{cdhashes=%O}",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)a4);
            CFDataRef Data = CFPropertyListCreateData( 0LL,  *(CFPropertyListRef *)propertyList,  kCFPropertyListXMLFormat_v1_0,  0LL,  0LL);
            CFDataRef v19 = Data;
            CFTypeRef cf = Data;
            CMSEncoderRef v20 = cmsEncoderOut[0];
            if (!cmsEncoderOut[0] || *((_DWORD *)cmsEncoderOut[0] + 4)) {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
            }
            *((_DWORD *)cmsEncoderOut[0] + 18) |= 0x10u;
            if (Data) {
              CFRetain(Data);
            }
            *((void *)v20 + 16) = v19;
            Security::CFRef<__CFData const*>::~CFRef(&cf);
            Security::CFRef<__CFDictionary const*>::~CFRef((const void **)propertyList);
            CMSEncoderRef v10 = cmsEncoderOut[0];
          }

          uint64_t updated = CMSEncoderUpdateContent(v10, a2, bswap32(*((_DWORD *)a2 + 1)));
          if (!(_DWORD)updated)
          {
            if (!*(_BYTE *)(*((void *)this + 1) + 280LL))
            {
              *(void *)propertyList = 0xAAAAAAAAAAAAAAAALL;
              size_t v21 = (Security::MacOSError *)CMSEncoderCopyEncodedContent(cmsEncoderOut[0], (CFDataRef *)propertyList);
              if ((_DWORD)v21) {
                Security::MacOSError::throwMe(v21);
              }
              CFDataRef v22 = *(CFDataRef *)propertyList;
              Security::CFRef<_CMSEncoder *>::~CFRef((const void **)cmsEncoderOut);
              goto LABEL_64;
            }

            uint64_t v88 = (os_log_s *)secLogObjForScope("SecError");
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)propertyList = 0;
              _os_log_impl( &dword_1804F4000,  v88,  OS_LOG_TYPE_DEFAULT,  "Platform does not support signing secure timestamps",  propertyList,  2u);
            }

            uint64_t updated = 4294967292LL;
          }
        }
      }

      Security::MacOSError::throwMe((Security::MacOSError *)updated);
    }

    CFDataRef v22 = CFDataCreate(0LL, 0LL, 0LL);
LABEL_64:
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)v113);
    return v22;
  }

  if (*((_BYTE *)this + 320))
  {
    double v8 = *((double *)this + 39);
    if (v8 == 0.0) {
      double v8 = CFAbsoluteTimeGetCurrent();
    }
  }

  else
  {
    double v8 = 0.0;
  }

  uint64_t v23 = (void *)*((void *)this + 41);
  uint64_t v24 = (const __CFArray *)*((void *)this + 42);
  char v102 = 0LL;
  id v25 = v23;
  CFTypeRef cf = 0LL;
  std::string v101 = (uint64_t (**)(void, void, void))v25;
  if (!a2 || !*((_DWORD *)a2 + 1))
  {
    secLogObjForScope("SecError");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    int v57 = "Remote signing requires valid code directory.";
LABEL_58:
    unsigned int v58 = v30;
    uint32_t v59 = 2;
LABEL_59:
    _os_log_impl(&dword_1804F4000, v58, OS_LOG_TYPE_DEFAULT, v57, v113, v59);
    goto LABEL_60;
  }

  if (!a3)
  {
    secLogObjForScope("SecError");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    int v57 = "Remote signing requires hash dictionary.";
    goto LABEL_58;
  }

  if (!a4)
  {
    secLogObjForScope("SecError");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    int v57 = "Remote signing requires hash list.";
    goto LABEL_58;
  }

  if (!v25)
  {
    secLogObjForScope("SecError");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    int v57 = "Remote signing requires signing block.";
    goto LABEL_58;
  }

  if (v24 && CFArrayGetCount(v24))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v24, 0LL);
    unsigned int v27 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
    CFTypeRef cf = v27;
    uint64_t v28 = *MEMORY[0x189611018];
    id v106 = 0LL;
    uint64_t v29 = [MEMORY[0x189611078] OIDWithString:v28 error:&v106];
    uint64_t v30 = (os_log_s *)v106;
    int v98 = (void *)v29;
    if (!v29)
    {
      secLogObjForScope("SecError");
      CFIndex v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v60 = 4294899624LL;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412290;
        *(void *)&v113[4] = v30;
        _os_log_impl(&dword_1804F4000, v62, OS_LOG_TYPE_DEFAULT, "Unable to create signing algorithm: %@", v113, 0xCu);
      }

      goto LABEL_119;
    }

    std::string::size_type v31 = (os_log_s *)objc_alloc(MEMORY[0x189611060]);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      secLogObjForScope("SecError");
      uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v113 = 0;
        _os_log_impl( &dword_1804F4000,  v63,  OS_LOG_TYPE_DEFAULT,  "Unable to create signer due to old CMS interfaces",  v113,  2u);
      }

      uint64_t v60 = 4294966387LL;
      CFIndex v62 = v31;
      goto LABEL_119;
    }

    uint64_t v32 = v31;
    std::string::size_type v105 = v30;
    int v94 = -[os_log_s initWithCertificate:signatureAlgorithm:useIssuerAndSerialNumber:error:]( v32,  "initWithCertificate:signatureAlgorithm:useIssuerAndSerialNumber:error:",  cf,  v29,  1LL,  &v105);
    unsigned int v33 = v105;

    if (!v94 || v33)
    {
      secLogObjForScope("SecError");
      int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        CFTypeRef v65 = cf;
        [v98 OIDString];
        CFIndex v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)int v113 = 138412802;
        *(void *)&v113[4] = v65;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v66;
        __int16 v114 = 2112;
        char v115 = v33;
        _os_log_impl( &dword_1804F4000,  v64,  OS_LOG_TYPE_DEFAULT,  "Unable to create signer info: %@, %@, %@",  v113,  0x20u);
      }

      uint64_t v60 = 4294900305LL;
      CFIndex v62 = v94;
      uint64_t v30 = v33;
      goto LABEL_119;
    }

    [MEMORY[0x189603F48] dataWithBytes:a2 length:bswap32(*((_DWORD *)a2 + 1))];
    int v92 = (void *)objc_claimAutoreleasedReturnValue();
    id v104 = 0LL;
    uint64_t v34 = [objc_alloc(MEMORY[0x189611058]) initWithDataContent:v92 isDetached:1 signer:v94 additionalCertificates:v24 error:&v104];
    uint64_t v30 = (os_log_s *)v104;
    uint64_t v93 = (os_log_s *)v34;
    if (!v34)
    {
      uint64_t v60 = 4294900305LL;
      secLogObjForScope("SecError");
      BOOL v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412290;
        *(void *)&v113[4] = v30;
        _os_log_impl(&dword_1804F4000, v67, OS_LOG_TYPE_DEFAULT, "Unable to create signed data: %@", v113, 0xCu);
      }

      goto LABEL_118;
    }

    if (v8 != 0.0)
    {
      [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:v8];
      unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue();
      int v42 = (void *)[objc_alloc(MEMORY[0x189611068]) initWithSigningTime:v41];
      -[os_log_s addProtectedAttribute:](v94, "addProtectedAttribute:", v42);
    }

    *(void *)int v113 = 0xAAAAAAAAAAAAAAAALL;
    Security::CFTemp<__CFDictionary const*>::CFTemp( (CFTypeRef *)v113,  (uint64_t)"{cdhashes=%O}",  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)a4);
    cmsEncoderOut[0] = CFPropertyListCreateData( 0LL,  *(CFPropertyListRef *)v113,  kCFPropertyListXMLFormat_v1_0,  0LL,  0LL);
    unint64_t v43 = cmsEncoderOut[0];
    Security::CFRef<__CFData const*>::~CFRef((const void **)cmsEncoderOut);
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)v113);
    uint64_t v90 = v43;
    CFRange v91 = (void *)[objc_alloc(MEMORY[0x189611030]) initWithHashAgilityValue:v43];
    -[os_log_s addProtectedAttribute:](v94, "addProtectedAttribute:", v91);
    uint64_t v89 = a3;
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    *(_OWORD *)cmsEncoderOut = 0u;
    __int128 v109 = 0u;
    uint64_t v45 = v89;
    uint64_t v46 = v44;
    uint64_t v47 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  cmsEncoderOut,  v113,  16LL);
    if (v47)
    {
      uint64_t v48 = *(void *)v109;
      char v96 = (void *)*MEMORY[0x189611010];
      unsigned int v99 = (void *)*MEMORY[0x189611008];
      uint64_t v95 = (void *)*MEMORY[0x189611000];
      unint64_t v49 = (void *)*MEMORY[0x189610FF8];
      while (2)
      {
        for (uint64_t i = 0LL; i != v47; ++i)
        {
          if (*(void *)v109 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = (void *)*((void *)cmsEncoderOut[1] + i);
          int v52 = [v51 intValue];
          if (v52 > 192)
          {
            int64_t v53 = v99;
            if (v52 != 193)
            {
              int64_t v53 = v96;
              if (v52 != 194)
              {
LABEL_84:
                secLogObjForScope("SecError");
                unsigned int v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)propertyList = 138412290;
                  *(void *)&propertyList[4] = v51;
                  _os_log_impl( &dword_1804F4000,  v68,  OS_LOG_TYPE_DEFAULT,  "Unexpected digest algorithm: %@",  propertyList,  0xCu);
                }

                uint64_t v44 = v46;
                id v56 = 0LL;
                goto LABEL_87;
              }
            }
          }

          else
          {
            int64_t v53 = v49;
            if (v52 != 4)
            {
              int64_t v53 = v95;
              if (v52 != 192) {
                goto LABEL_84;
              }
            }
          }

          id v54 = v53;
          -[__CFDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", v51);
          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v44 = v46;
          [v46 setObject:v55 forKeyedSubscript:v54];
        }

        uint64_t v47 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  cmsEncoderOut,  v113,  16LL);
        if (v47) {
          continue;
        }
        break;
      }
    }

    id v56 = v44;
LABEL_87:

    CFTypeRef v97 = (void *)[objc_alloc(MEMORY[0x189611038]) initWithHashAgilityValues:v56];
    -[os_log_s addProtectedAttribute:](v94, "addProtectedAttribute:", v97);
    uint64_t v100 = (void *)[objc_alloc(MEMORY[0x189611048]) initWithEmbeddedContent:v93];
    cmsEncoderOut[0] = v30;
    -[os_log_s calculateSignerInfoDigest:](v94, "calculateSignerInfoDigest:", cmsEncoderOut);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v70 = cmsEncoderOut[0];

    if (!v69)
    {
      uint64_t v60 = 4294900305LL;
      secLogObjForScope("SecError");
      int v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412546;
        *(void *)&v113[4] = v94;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v70;
        _os_log_impl( &dword_1804F4000,  v73,  OS_LOG_TYPE_DEFAULT,  "Unable to create signature digest: %@, %@",  v113,  0x16u);
      }

      goto LABEL_117;
    }

    CFTypeID v71 = (void *)MEMORY[0x189611020];
    -[os_log_s signatureAlgorithm](v94, "signatureAlgorithm");
    unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)propertyList = v70;
    [v71 digestAlgorithmWithSignatureAlgorithm:v72 error:propertyList];
    int v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v74 = *(id *)propertyList;

    if (!v73)
    {
      uint64_t v60 = 4294900305LL;
      secLogObjForScope("SecError");
      unsigned int v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412546;
        *(void *)&v113[4] = v94;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v74;
        _os_log_impl( &dword_1804F4000,  v78,  OS_LOG_TYPE_DEFAULT,  "Unable to create digest algorithm: %@, %@",  v113,  0x16u);
      }

      goto LABEL_116;
    }

    -[os_log_s algorithm](v73, "algorithm");
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
    [v75 OIDString];
    id v76 = (id)objc_claimAutoreleasedReturnValue();
    if ([v76 isEqualToString:*MEMORY[0x189610FF8]])
    {
      uint64_t v77 = 1LL;
    }

    else if ([v76 isEqualToString:*MEMORY[0x189611000]])
    {
      uint64_t v77 = 2LL;
    }

    else
    {
      if (([v76 isEqualToString:*MEMORY[0x189611008]] & 1) == 0)
      {
        int v85 = [v76 isEqualToString:*MEMORY[0x189611010]];
        if (v85) {
          uint64_t v77 = 5LL;
        }
        else {
          uint64_t v77 = 0LL;
        }

        if (v85 != 1)
        {
          secLogObjForScope("SecError");
          unsigned int v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v60 = 4294900296LL;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            -[os_log_s algorithm](v73, "algorithm");
            uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
            [v86 OIDString];
            uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)int v113 = 138412290;
            *(void *)&v113[4] = v87;
            _os_log_impl(&dword_1804F4000, v78, OS_LOG_TYPE_DEFAULT, "Unable to map digest algorithm: %@", v113, 0xCu);
          }

          goto LABEL_116;
        }

void sub_18063FDD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, _Unwind_Exception *exception_object, void *a17, void *a18, void *a19, void *a20, const void *a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, const void *a26, __int16 a27, char a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, char a39)
{
  Security::CFRef<__SecCertificate *>::~CFRef(&a26);
  Security::CFRef<__CFData const*>::~CFRef(&a21);
  _Unwind_Resume(a1);
}

const void **Security::CFRef<_CMSEncoder *>::~CFRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const __CFBoolean *Security::CodeSigning::SecCodeSigner::Signer::BOOLeanEntitlement( Security::CodeSigning::SecCodeSigner::Signer *this, const __CFDictionary *a2, const __CFString *a3)
{
  BOOL result = (const __CFBoolean *)CFDictionaryGetValue(this, a2);
  if (result)
  {
    uint64_t v4 = result;
    CFTypeID v5 = CFGetTypeID(result);
    if (v5 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v4) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }

      while (v3);
      *(void *)(a1 + _Block_object_dispose(va, 8) = v2;
    }

    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy((const void **)v2);
  }

  return a1;
}

_DWORD *std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__construct_node<std::pair<unsigned int const,Security::CFCopyRef<__CFData const*>> const&>( void *a1, uint64_t a2, int a3, const void *a4)
{
  uint64_t v7 = a2 + 8;
  memset(a1, 170, 24);
  BOOL result = operator new(0x30uLL);
  *a1 = result;
  a1[1] = v7;
  *((_BYTE *)a1 + 16) = 0;
  result[8] = a3;
  *((void *)result + 5) = a4;
  if (a4) {
    BOOL result = CFRetain(a4);
  }
  *((_BYTE *)a1 + 16) = 1;
  return result;
}

void sub_18064016C(_Unwind_Exception *a1)
{
}

uint64_t **std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  int v6 = a1 + 1;
  CFTypeID v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unsigned int v8 = *((_DWORD *)v5 + 7);
        if (v8 <= a2) {
          break;
        }
        CFTypeID v5 = *v7;
        int v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }

      if (v8 >= a2) {
        break;
      }
      CFTypeID v5 = v7[1];
      if (!v5)
      {
        int v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }

  else
  {
    uint64_t v7 = a1 + 1;
LABEL_9:
    BOOL v9 = (uint64_t *)v7;
    uint64_t v7 = (uint64_t **)operator new(0x28uLL);
    *((_DWORD *)v7 + 7) = *a3;
    *((_DWORD *)v7 + _Block_object_dispose(va, 8) = 0;
    void *v7 = 0LL;
    v7[1] = 0LL;
    v7[2] = v9;
    char *v6 = (uint64_t *)v7;
    CMSEncoderRef v10 = (uint64_t *)**a1;
    BOOL v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      BOOL v11 = *v6;
    }

    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }

  return v7;
}

uint64_t ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void ***)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(Security::MachO **)(v5 + 56);
  uint64_t v7 = *((void *)v6 + 6);
  uint64_t v8 = Security::MachO::signingExtent(v6);
  unsigned int v9 = *(unsigned __int8 *)(a1 + 52);
  uint64_t v10 = (*(uint64_t (**)(void *, uint64_t))(*v4[3] + 104LL))(v4[3], *(void *)(a1 + 40) + 48LL);
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t))(*v4[3] + 112LL))(v4[3], *(void *)(a1 + 40) + 48LL);
  ((void (*)(void **))(*v4)[3])(v4);
  uint64_t v12 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( v4 + 29,  *(void *)(*(void *)(a1 + 40) + 48LL),  (uint64_t *)(*(void *)(a1 + 40) + 48LL));
  return Security::CodeSigning::SecCodeSigner::Signer::populate( (uint64_t)v4,  a2,  v5,  v5 + 88,  v7,  v8,  v9,  v10,  v11,  (void *)v12 + 5,  *(_DWORD *)(a1 + 48));
}

__n128 __Block_byref_object_copy__40(void *a1, uint64_t a2)
{
  a1[5] = 0LL;
  a1[6] = 0LL;
  a1[7] = 0LL;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 4_Block_object_dispose(va, 8) = 0LL;
  *(void *)(a2 + 56) = 0LL;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v2;
    operator delete(v2);
  }

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_42( uint64_t a1, Security::CodeSigning::CodeDirectory::Builder *this)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  unint64_t v3 = Security::CodeSigning::CodeDirectory::Builder::size(this, 0x20500u);
  unint64_t v4 = v3;
  int v6 = (unint64_t *)v2[6];
  unint64_t v5 = v2[7];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = (unint64_t *)v2[5];
    uint64_t v9 = v6 - v8;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = (char *)operator new(8 * v12);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v14 = (unint64_t *)&v13[8 * v9];
    *uint64_t v14 = v4;
    uint64_t v7 = v14 + 1;
    while (v6 != v8)
    {
      unint64_t v15 = *--v6;
      *--uint64_t v14 = v15;
    }

    v2[5] = v14;
    v2[6] = v7;
    v2[7] = &v13[8 * v12];
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    unint64_t *v6 = v3;
    uint64_t v7 = v6 + 1;
  }

  v2[6] = v7;
}

uint64_t *__Block_byref_object_copy__44(uint64_t *result, void *a2)
{
  unint64_t v3 = result;
  result[6] = 0LL;
  unint64_t v4 = result + 6;
  result[5] = (uint64_t)(result + 6);
  unint64_t v5 = (uint64_t **)(result + 5);
  result[7] = 0LL;
  int v6 = (void *)a2[5];
  uint64_t v7 = a2 + 6;
  if (v6 != a2 + 6)
  {
    do
    {
      uint64_t v8 = (unsigned int *)(v6 + 4);
      uint64_t v9 = (uint64_t *)*v4;
      unint64_t v10 = v4;
      if (*v5 == v4) {
        goto LABEL_8;
      }
      uint64_t v11 = (uint64_t *)*v4;
      unint64_t v12 = v4;
      if (v9)
      {
        do
        {
          unint64_t v10 = v11;
          uint64_t v11 = (uint64_t *)v11[1];
        }

        while (v11);
      }

      else
      {
        do
        {
          unint64_t v10 = (uint64_t *)v12[2];
          BOOL v13 = *v10 == (void)v12;
          unint64_t v12 = v10;
        }

        while (v13);
      }

      unsigned int v14 = *v8;
      if (*((_DWORD *)v10 + 8) < *v8)
      {
LABEL_8:
        if (v9) {
          unint64_t v15 = (uint64_t **)v10;
        }
        else {
          unint64_t v15 = (uint64_t **)v4;
        }
        if (v9) {
          uint64_t v16 = (uint64_t **)(v10 + 1);
        }
        else {
          uint64_t v16 = (uint64_t **)v4;
        }
      }

      else
      {
        unint64_t v15 = (uint64_t **)v4;
        uint64_t v16 = (uint64_t **)v4;
        if (v9)
        {
          uint64_t v16 = (uint64_t **)v4;
          while (1)
          {
            while (1)
            {
              unint64_t v15 = (uint64_t **)v9;
              unsigned int v20 = *((_DWORD *)v9 + 8);
              if (v14 >= v20) {
                break;
              }
              uint64_t v9 = *v15;
              uint64_t v16 = v15;
              if (!*v15) {
                goto LABEL_15;
              }
            }

            if (v20 >= v14) {
              break;
            }
            uint64_t v16 = v15 + 1;
            uint64_t v9 = v15[1];
            if (!v9) {
              goto LABEL_15;
            }
          }
        }
      }

      if (!*v16)
      {
LABEL_15:
        uint64_t v17 = (uint64_t *)operator new(0x30uLL);
        *((_OWORD *)v17 + 2) = *(_OWORD *)v8;
        __n128 result = std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at( v5,  (uint64_t)v15,  v16,  v17);
      }

      uint64_t v18 = (void *)v6[1];
      if (v18)
      {
        do
        {
          CFDataRef v19 = v18;
          uint64_t v18 = (void *)*v18;
        }

        while (v18);
      }

      else
      {
        do
        {
          CFDataRef v19 = (void *)v6[2];
          BOOL v13 = *v19 == (void)v6;
          int v6 = v19;
        }

        while (!v13);
      }

      int v6 = v19;
    }

    while (v19 != v7);
  }

  v3[8] = a2[8];
  return result;
}

void sub_1806405F4(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_dispose__45(uint64_t a1)
{
  return Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker(a1 + 40);
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_46( uint64_t a1, Security::CodeSigning::CodeDirectory::Builder *this)
{
  unint64_t v3 = (const Security::CodeSigning::CodeDirectory *)Security::CodeSigning::CodeDirectory::Builder::build(this);
  Security::CodeSigning::CodeDirectorySet::add( (Security::CodeSigning::CodeDirectorySet *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL),  v3);
}

_DWORD *Security::Blob<Security::SuperBlob<4208856065u,unsigned int>,4208856065u>::specific(_DWORD *result)
{
  if (*result == 17620730
    && (v1 = bswap32(result[2]), v2 = 8LL * v1 + 12, unint64_t v3 = bswap32(result[1]), v2 <= v3))
  {
    unint64_t v5 = (unint64_t)&result[2 * v1 + 3];
    while (1)
    {
      v5 -= 8LL;
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if (v6)
      {
        unint64_t v7 = bswap32(v6);
        BOOL v8 = v2 > v7 || v7 + 8 > v3;
      }
    }
  }

  else
  {
    unint64_t v4 = __error();
    __n128 result = 0LL;
    *unint64_t v4 = 22;
  }

  return result;
}

const void **Security::CFRef<__CFString *>::~CFRef(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

_DWORD *Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes( uint64_t **a1, Security::CodeSigning::SecStaticCode *this)
{
  __n128 result = Security::CodeSigning::SecStaticCode::codeDirectories(this, 1);
  if (result)
  {
    unint64_t v4 = result + 2;
    unint64_t v5 = *(void **)result;
    if (*(_DWORD **)result != result + 2)
    {
      do
      {
        unsigned int v6 = *((_DWORD *)v5 + 8);
        unsigned int v14 = v6;
        __n128 result = CFDataGetBytePtr((CFDataRef)v5[5]);
        if (bswap32(result[2]) >> 8 >= 0x205)
        {
          unsigned int v7 = result[23];
          BOOL v9 = v7 == 0;
          uint64_t v8 = bswap32(v7);
          BOOL v9 = v9 || (_DWORD *)((char *)result + v8) == 0LL;
          if (!v9)
          {
            CFDataRef v13 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
            CFDataRef v13 = CFDataCreate(0LL, (const UInt8 *)result + v8, bswap32(result[7]) * *((unsigned __int8 *)result + 36));
            unint64_t v10 = std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( a1,  v6,  &v14);
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)v10 + 5, (CFTypeRef *)&v13);
            __n128 result = Security::CFRef<__CFData const*>::~CFRef((const void **)&v13);
          }
        }

        uint64_t v11 = (void *)v5[1];
        if (v11)
        {
          do
          {
            unint64_t v12 = v11;
            uint64_t v11 = (void *)*v11;
          }

          while (v11);
        }

        else
        {
          do
          {
            unint64_t v12 = (void *)v5[2];
            BOOL v9 = *v12 == (void)v5;
            unint64_t v5 = v12;
          }

          while (!v9);
        }

        unint64_t v5 = v12;
      }

      while (v12 != v4);
    }
  }

  return result;
}

void sub_180640828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke( uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (Security::Universal *)(*(uint64_t (**)(void *))(**((void **)a2 + 4) + 80LL))(*((void **)a2 + 4));
  unint64_t v7 = Security::Universal::bestNativeArch(v4);
  unint64_t v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)(v3 + 232),  v7,  (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes((uint64_t **)v5 + 5, a2);
}

_DWORD *Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions( uint64_t **a1, Security::CodeSigning::SecStaticCode *this)
{
  __n128 result = Security::CodeSigning::SecStaticCode::codeDirectories(this, 1);
  if (result)
  {
    unint64_t v4 = result + 2;
    unint64_t v5 = *(void **)result;
    if (*(_DWORD **)result != result + 2)
    {
      do
      {
        unsigned int v6 = *((_DWORD *)v5 + 8);
        unsigned int v12 = v6;
        __n128 result = CFDataGetBytePtr((CFDataRef)v5[5]);
        if (bswap32(result[2]) >> 8 >= 0x205)
        {
          unsigned int v7 = result[22];
          if (v7)
          {
            unsigned int v8 = bswap32(v7);
            __n128 result = std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( a1,  v6,  &v12);
            result[8] = v8;
          }
        }

        BOOL v9 = (void *)v5[1];
        if (v9)
        {
          do
          {
            unint64_t v10 = v9;
            BOOL v9 = (void *)*v9;
          }

          while (v9);
        }

        else
        {
          do
          {
            unint64_t v10 = (void *)v5[2];
            BOOL v11 = *v10 == (void)v5;
            unint64_t v5 = v10;
          }

          while (!v11);
        }

        unint64_t v5 = v10;
      }

      while (v10 != v4);
    }
  }

  return result;
}

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke_2( uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (Security::Universal *)(*(uint64_t (**)(void *))(**((void **)a2 + 4) + 80LL))(*((void **)a2 + 4));
  unint64_t v7 = Security::Universal::bestNativeArch(v4);
  unint64_t v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)(v3 + 264),  v7,  (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions((uint64_t **)v5 + 5, a2);
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke( void *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = a1[4];
  BOOL v9 = *(unsigned __int16 *)(a2 + 88) == 12;
  memset(&v24, 170, sizeof(v24));
  std::string::basic_string[abi:ne180100]<0>(&v24, *(char **)(a2 + 48));
  memset(&v23, 170, sizeof(v23));
  std::string::basic_string[abi:ne180100]<0>(&v23, *(char **)(a2 + 40));
  CFDataRef v22 = 0LL;
  unint64_t v10 = (const void *)a1[5];
  if (v10) {
    CFRetain(v10);
  }
  CFDataRef v22 = 0LL;
  uint64_t v11 = *(void *)(*(void *)(v8 + 8) + 288LL);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 1174405120LL;
  v14[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_24_15133;
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  v14[4] = v8;
  v14[5] = v12;
  BOOL v20 = (a3 & 4) != 0;
  else {
    std::string v15 = v24;
  }
  else {
    std::string v16 = *(std::string *)a4;
  }
  BOOL v21 = v9;
  else {
    std::string __p = v23;
  }
  uint64_t v18 = a1[7];
  int v19 = a3;
  Security::CodeSigning::LimitedAsync::perform(*(void *)(v11 + 8), v13, (uint64_t)v14);
  Security::CFRef<__CFDictionary *>::~CFRef(&v22);
}

void sub_180640BA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26, void *a27, uint64_t a28, int a29, __int16 a30, char a31, char a32)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)(v32 - 120));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15118(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__15119(uint64_t a1)
{
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)(a1 + 40));
}

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_31( const void **result, uint64_t a2, int a3, std::string *a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (*(_WORD *)(a2 + 88) == 8)
  {
    unsigned int v6 = a4;
    BOOL v9 = result;
    CFTypeRef cf = 0LL;
    unint64_t v10 = (const __CFDictionary *)result[5];
    if (!v10) {
      goto LABEL_15;
    }
    else {
      std::string v29 = *a4;
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)key, (char *)&v29);
    Value = CFDictionaryGetValue(v10, *(const void **)key);
    Security::CFRef<__CFString const*>::~CFRef((const void **)key);
    if ((char)v29.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v29.__r_.__value_.__l.__data_);
      if (!Value) {
        goto LABEL_14;
      }
    }

    else if (!Value)
    {
LABEL_14:
      Value = cf;
      if (cf) {
        goto LABEL_22;
      }
LABEL_15:
      std::string v16 = *(const char **)(a2 + 40);
      unint64_t v31 = 0xAAAAAAAAFFFFFFFFLL;
      Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v31, v16, 0, 438);
      Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v31, v17, v18);
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v36 = v19;
      __int128 v37 = v19;
      *(_OWORD *)stat key = v19;
      *(_OWORD *)&key[16] = v19;
      BOOL v20 = Security::CodeSigning::CodeDirectory::hashFor((Security::CodeSigning::CodeDirectory *)1);
      Security::Mutex::Mutex((pthread_mutex_t *)&key[8]);
      BOOL v21 = (unsigned int *)((char *)v20 + 8);
      do
        unsigned int v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
      *(void *)stat key = v20;
      int v33 = v31;
      char v34 = BYTE4(v31);
      __p[0] = (void *)MEMORY[0x1895F87A8];
      __p[1] = (void *)0x40000000;
      __p[2] = ___ZN8Security11CodeSigning12hashFileDataINS_11DynamicHashEEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke_15259;
      __p[3] = &__block_descriptor_tmp_34_15260;
      __p[4] = v20;
      Security::CodeSigning::scanFileData(&v33, 0LL, (uint64_t)__p);
      memset(__p, 170, 24);
      size_t v23 = (*(uint64_t (**)(void))(**(void **)key + 16LL))(*(void *)key);
      std::vector<unsigned char>::vector(__p, v23);
      (*(void (**)(void, void *))(**(void **)key + 32LL))(*(void *)key, __p[0]);
      Value = CFDataCreate(0LL, (const UInt8 *)__p[0], (char *)__p[1] - (char *)__p[0]);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }

      Security::RefPointer<Security::DynamicHash>::~RefPointer(key);
      Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v31);
      CFTypeRef v14 = cf;
      if (!cf) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

    CFTypeID v13 = CFGetTypeID(Value);
    if (v13 == CFDataGetTypeID())
    {
      CFRetain(Value);
      CFTypeRef v14 = cf;
      if (!cf)
      {
LABEL_21:
        CFTypeRef cf = Value;
LABEL_22:
        std::string v24 = *(Security **)(*((void *)v9[4] + 1) + 40LL);
        int size = (char)v6->__r_.__value_.__s.__size_;
        uint64_t v26 = v6;
        if ((a3 & 0xFFFFFFBF) != 0)
        {
          if (size < 0) {
            uint64_t v26 = (std::string *)v6->__r_.__value_.__r.__words[0];
          }
          Security::cfadd(v24, (__CFDictionary *)"{%s={hash=%O,optional=%B}}", v12, v26, Value, a3 & 1);
          unsigned int v27 = (os_log_s *)secLogObjForScope("csresource");
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            return Security::CFRef<__CFData const*>::~CFRef(&cf);
          }
          *(_DWORD *)stat key = 136315394;
          *(void *)&key[4] = v6;
          *(_WORD *)&key[12] = 2048;
          *(void *)&key[14] = a5;
          uint64_t v28 = "%s added complex (rule %p)";
        }

        else
        {
          if (size < 0) {
            uint64_t v26 = (std::string *)v6->__r_.__value_.__r.__words[0];
          }
          Security::cfadd(v24, (__CFDictionary *)"{%s=%O}", v12, v26, Value);
          unsigned int v27 = (os_log_s *)secLogObjForScope("csresource");
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            return Security::CFRef<__CFData const*>::~CFRef(&cf);
          }
          *(_DWORD *)stat key = 136315394;
          *(void *)&key[4] = v6;
          *(_WORD *)&key[12] = 2048;
          *(void *)&key[14] = a5;
          uint64_t v28 = "%s added simple (rule %p)";
        }

        _os_log_debug_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEBUG, v28, key, 0x16u);
        return Security::CFRef<__CFData const*>::~CFRef(&cf);
      }

void sub_180640FE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, const void *a20, __int16 a21, char a22, char a23, void *a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_2( std::string *a1)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  std::string::size_type size = a1[1].__r_.__value_.__l.__size_;
  cap = (__CFDictionary *)a1[1].__r_.__value_.__l.__cap_;
  CFTypeRef cf = 0LL;
  int v64 = cap;
  if (a1[5].__r_.__value_.__s.__data_[12])
  {
    uint64_t v69 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v4 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
    unsigned int v6 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x288,  *(void *)(v4 + 200),  v5);
    if ((a1[2].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      data = (char *)&a1[2];
    }
    else {
      data = a1[2].__r_.__value_.__l.__data_;
    }
    uint64_t v8 = Security::CodeSigning::DiskRep::bestGuess(data, 0LL);
    Security::CodeSigning::SecStaticCode::SecStaticCode(v6, (Security::CodeSigning::DiskRep *)v8, 0);
    BOOL v9 = (unsigned __int8 *)v6 - 8;
    do
      unsigned __int8 v10 = __ldaxr(v9);
    while (__stlxr(1u, v9));
    if ((v10 & 1) != 0)
    {
      uint64_t v11 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(void *)v6 + 16LL))(v6);
      CFRetain(v11);
    }

    uint64_t v69 = v6;
    if (((*(uint64_t (**)(std::string::size_type))(*(void *)size + 16LL))(size) & 4) != 0)
    {
      uint64_t v12 = *(Security::CodeSigning::SecCodeSigner **)(size + 8);
      unsigned int v13 = (*(uint64_t (**)(std::string::size_type))(*(void *)size + 16LL))(size);
      Security::CodeSigning::SecCodeSigner::sign(v12, v69, v13);
    }

    memset(__b, 170, 24);
    CFTypeRef v14 = Security::CodeSigning::SecStaticCode::designatedRequirement(v69);
    Security::CodeSigning::Dumper::dump(__b, (uint64_t)v14);
    if (!Security::CodeSigning::SecStaticCode::cdHash((CFDataRef *)v69)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
    }
    std::string v15 = Security::CodeSigning::SecStaticCode::designatedRequirement(v69);
    Security::CodeSigning::Dumper::dump(&__p, (uint64_t)v15);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    std::string v24 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{requirement=%s,cdhash=%O}",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)p_p);
    Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v69);
    goto LABEL_26;
  }

  if (a1[5].__r_.__value_.__s.__data_[13])
  {
    memset(__b, 170, 0x400uLL);
    id v25 = (const char *)&a1[4];
    ssize_t v26 = readlink(v25, (char *)__b, 0x3FFuLL);
    if (v26 < 0)
    {
      uint64_t v55 = __error();
      Security::UnixError::throwMe((Security::UnixError *)*v55);
    }

    __b[0].__r_.__value_.__s.__data_[v26] = 0;
    std::string v24 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{symlink=%s}",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)__b);
    if (cf) {
      CFRelease(cf);
    }
LABEL_26:
    CFTypeRef cf = v24;
    if (v24) {
      goto LABEL_27;
    }
LABEL_56:
    uint64_t v50 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = a1[5].__r_.__value_.__s.__data_[12];
      int v52 = a1[5].__r_.__value_.__s.__data_[13];
      int64_t v53 = (std::string::__raw *)&a1[4];
      LODWORD(__b[0].__r_.__value_.__l.__data_) = 67109634;
      HIDWORD(__b[0].__r_.__value_.__r.__words[0]) = v51;
      LOWORD(__b[0].__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&__b[0].__r_.__value_.__r.__words[1] + 2) = v52;
      HIWORD(__b[0].__r_.__value_.__r.__words[1]) = 2080;
      __b[0].__r_.__value_.__l.__cap_ = (std::string::size_type)v53;
      _os_log_impl( &dword_1804F4000,  v50,  OS_LOG_TYPE_DEFAULT,  "Failed to generate sealed resource: %d, %d, %s",  (uint8_t *)__b,  0x18u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12LL);
  }

  if (((*(uint64_t (**)(std::string::size_type))(*(void *)size + 16LL))(size) & 0x1000000) != 0)
  {
    __b[0].__r_.__value_.__r.__words[0] = 0xAAAAAAAAFFFFFFFFLL;
    if ((a1[2].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v39 = (const char *)&a1[2];
    }
    else {
      uint64_t v39 = a1[2].__r_.__value_.__l.__data_;
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)__b, v39, 0, 438);
    data_low = (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_),  "com.apple.ResourceFork"))
    {
      Security::UnixPlusPlus::FileDesc::removeAttr(data_low, "com.apple.ResourceFork");
    }

    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(data_low, "com.apple.FinderInfo")) {
      Security::UnixPlusPlus::FileDesc::removeAttr(data_low, "com.apple.FinderInfo");
    }
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)__b);
  }

  unsigned int v41 = (const char *)&a1[4];
  int v42 = (void *)(*(uint64_t (**)(std::string::size_type))(*(void *)size + 24LL))(size);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)v62, v42);
  char v43 = (*(uint64_t (**)(std::string::size_type))(*(void *)size + 16LL))(size);
  uint64_t v69 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v69, v41, 0, 438);
  Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v69, v44, v45);
  if (v43 < 0)
  {
    uint64_t v47 = (Security::UnixPlusPlus::FileDesc *)v69;
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)v69,  "com.apple.ResourceFork"))
    {
      id v56 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Disallowed xattr %s found on %s",  "com.apple.ResourceFork",  v41);
      Security::CodeSigning::CSError::throwMe( (Security::CodeSigning::CSError *)0xFFFEFA49LL,  (uint64_t)@"SecCSResourceHasSidebandData",  v56,  v57);
    }

    BOOL hasExtendedAttribute = Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(v47, "com.apple.FinderInfo");
    if (hasExtendedAttribute)
    {
      unsigned int v58 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Disallowed xattr %s found on %s",  "com.apple.FinderInfo",  v41);
      Security::CodeSigning::CSError::throwMe( (Security::CodeSigning::CSError *)0xFFFEFA49LL,  (uint64_t)@"SecCSResourceHasSidebandData",  v58,  v59);
    }
  }

  CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary((Security *)hasExtendedAttribute);
  CFMutableDictionaryRef v68 = CFMutableDictionary;
  int v66 = (int)v69;
  char v67 = BYTE4(v69);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)&__p, v62);
  __b[0].__r_.__value_.__r.__words[0] = MEMORY[0x1895F87A8];
  __b[0].__r_.__value_.__l.__size_ = 0x40000000LL;
  __b[0].__r_.__value_.__l.__cap_ = (std::string::size_type)___ZN8Security11CodeSigning15ResourceBuilder8hashFileEPKcNSt3__13setIjNS4_4lessIjEENS4_9allocatorIjEEEEb_block_invoke;
  __b[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&__block_descriptor_tmp_15267;
  __b[1].__r_.__value_.__l.__size_ = (std::string::size_type)CFMutableDictionary;
  Security::CodeSigning::CodeDirectory::multipleHashFileData((uint64_t)&v66, 0LL, &__p, (uint64_t)__b);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)__p.__r_.__value_.__l.__size_);
  CFMutableDictionaryRef v49 = v68;
  CFMutableDictionaryRef v68 = 0LL;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v68);
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v69);
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = v49;
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)v62[1]);
  std::string v24 = (void *)cf;
  if (!cf) {
    goto LABEL_56;
  }
LABEL_27:
  if ((a1[5].__r_.__value_.__s.__data_[8] & 1) != 0) {
    CFDictionaryAddValue((CFMutableDictionaryRef)v24, @"optional", (const void *)*MEMORY[0x189604DE8]);
  }
  __b[0].__r_.__value_.__r.__words[0] = size + 376;
  __b[0].__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  char v34 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(size + 376));
  if ((_DWORD)v34) {
    Security::UnixError::throwMe(v34);
  }
  __b[0].__r_.__value_.__s.__data_[8] = 1;
  Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"hash");
  if (Value && CFDictionaryGetCount((CFDictionaryRef)cf) == 1)
  {
    __int128 v36 = v64;
    else {
      std::string v61 = a1[3];
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)&__p, (char *)&v61);
    CFDictionaryAddValue(v36, __p.__r_.__value_.__l.__data_, Value);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&__p.__r_.__value_.__l.__data_);
    if ((char)v61.__r_.__value_.__s.__size_ < 0)
    {
      unint64_t v38 = (void *)v61.__r_.__value_.__r.__words[0];
      goto LABEL_64;
    }
  }

  else
  {
    __int128 v37 = v64;
    else {
      std::string v60 = a1[3];
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)&__p, (char *)&v60);
    CFDictionaryAddValue(v37, __p.__r_.__value_.__l.__data_, cf);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&__p.__r_.__value_.__l.__data_);
    if ((char)v60.__r_.__value_.__s.__size_ < 0)
    {
      unint64_t v38 = (void *)v60.__r_.__value_.__r.__words[0];
LABEL_64:
      operator delete(v38);
    }
  }

  Security::CodeSigning::SecStaticCode::reportProgress(*(Security::CodeSigning::SecStaticCode **)(size + 16));
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)__b);
  Security::CFRef<__CFDictionary *>::~CFRef(&cf);
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v64);
}

void sub_18064170C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, void *a22, uint64_t a23, char a24, int a25, __int16 a26, char a27, char a28, int a29, __int16 a30, char a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, int a37, __int16 a38, char a39, char a40, int a41, __int16 a42, char a43, char a44)
{
}

void sub_1806417AC( void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, uint64_t a22, char a23, std::string *a24, uint64_t a25, void *__pa, uint64_t a27, int a28, __int16 a29, char a30, char a31, uint64_t a32, uint64_t a33, char a34, __int128 a35, uint64_t a36)
{
  if (a31 < 0) {
    operator delete(__pa);
  }
  if (SHIBYTE(a36) < 0) {
    operator delete((void *)a35);
  }
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&a34);
  if (a2 == 1)
  {
    uint64_t v40 = __cxa_begin_catch(a1);
    int v42 = (Security::CodeSigning::CSError *)(*(uint64_t (**)(void *))(*(void *)v40 + 24LL))(v40);
    if (*(char *)(v36 + 71) < 0)
    {
      std::string::__init_copy_ctor_external( (std::string *)&a35,  *(const std::string::value_type **)(v36 + 48),  *(void *)(v36 + 56));
    }

    else
    {
      a35 = *v37;
      a36 = *((void *)v37 + 2);
    }

    if (a36 >= 0) {
      char v43 = (Security *)&a35;
    }
    else {
      char v43 = (Security *)a35;
    }
    __pb = (const __CFString *)Security::makeCFURL(v43, 0LL, 0LL, v41);
    Security::CodeSigning::CSError::throwMe(v42, (uint64_t)@"SecComponentPath", __pb, v44);
  }

  JUMPOUT(0x180641930LL);
}

void sub_1806417D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, __int16 a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  if (a8 < 0) {
    JUMPOUT(0x1806417F0LL);
  }
  JUMPOUT(0x180641928LL);
}

void sub_1806417F8()
{
}

void sub_180641814()
{
}

void sub_18064182C( void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, __int128 a29, uint64_t a30)
{
  uint64_t v33 = v31;
  Security::SecCFObject::operator delete(v33);
  if (a2 == 1)
  {
    uint64_t v36 = __cxa_begin_catch(a1);
    unint64_t v38 = (Security::CodeSigning::CSError *)(*(uint64_t (**)(void *))(*(void *)v36 + 24LL))(v36);
    if (*(char *)(v30 + 71) < 0)
    {
      std::string::__init_copy_ctor_external( (std::string *)&a29,  *(const std::string::value_type **)(v30 + 48),  *(void *)(v30 + 56));
    }

    else
    {
      a29 = *v32;
      a30 = *((void *)v32 + 2);
    }

    if (a30 >= 0) {
      uint64_t v39 = (Security *)&a29;
    }
    else {
      uint64_t v39 = (Security *)a29;
    }
    CFURLRef CFURL = (const __CFString *)Security::makeCFURL(v39, 0LL, 0LL, v37);
    Security::CodeSigning::CSError::throwMe(v38, (uint64_t)@"SecComponentPath", CFURL, v40);
  }

  JUMPOUT(0x180641930LL);
}

void sub_180641844()
{
}

void sub_1806418D0( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
}

void sub_18064190C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE96c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( std::string *a1, uint64_t a2)
{
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }

  else
  {
    __int128 v4 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__l.__cap_ = *(void *)(a2 + 64);
    *(_OWORD *)&a1[2].__r_.__value_.__l.__data_ = v4;
  }

  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 3, *(const std::string::value_type **)(a2 + 72), *(void *)(a2 + 80));
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__l.__cap_ = *(void *)(a2 + 88);
    *(_OWORD *)&a1[3].__r_.__value_.__l.__data_ = v5;
  }

  unsigned int v6 = a1 + 4;
  if (*(char *)(a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 96), *(void *)(a2 + 104));
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 96);
    a1[4].__r_.__value_.__l.__cap_ = *(void *)(a2 + 112);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }

void sub_1806419FC(_Unwind_Exception *exception_object)
{
}

void __destroy_helper_block_e8_48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE96c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
}

CFTypeRef *Security::CodeSigning::SecCodeSigner::Signer::prepareForEdit( Security::CodeSigning::SecCodeSigner::Signer *this)
{
  if ((*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL) + 80LL))(*(void *)(*((void *)this + 2) + 32LL))
    && (uint64_t v2 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32LL)
                                                                      + 80LL))(*(void *)(*((void *)this + 2) + 32LL))) != 0LL)
  {
    uint64_t v3 = v2;
    *((void *)this + 43) = Security::Universal::bestNativeArch(v2);
    if (*((void *)v3 + 4)) {
      goto LABEL_9;
    }
    uint64_t v6 = *((void *)this + 1);
    int v7 = *(_DWORD *)(v6 + 304);
    if (v7 && !*((void *)v3 + 1)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02LL, v4, v5);
    }
    if (*(void *)(v6 + 312) && !v7 && *((void *)v3 + 1)) {
LABEL_9:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA23LL, v4, v5);
  }

  else
  {
    Security::MainMachOImage::MainMachOImage((Security::MainMachOImage *)&v16);
    *((int8x8_t *)this + 43) = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(BYTE1(v20) == 0), 0x1FuLL)),  *(int8x8_t *)(v17 + 4),  vrev32_s8(*(int8x8_t *)(v17 + 4)));
  }

  uint64_t v8 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 0x40000000LL;
  v13[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke;
  v13[3] = &__block_descriptor_tmp_70_15155;
  v13[4] = this;
  ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke( (uint64_t)v13,  *((void *)this + 2),  *((const char **)this + 43));
  uint64_t v9 = *((void *)this + 2);
  v12[0] = v8;
  v12[1] = 0x40000000LL;
  v12[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke_2;
  void v12[3] = &unk_189678AB0;
  v12[4] = v13;
  uint64_t v16 = v8;
  uint64_t v17 = 0x40000000LL;
  uint64_t v18 = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
  uint64_t v19 = &unk_189678518;
  uint64_t v20 = v12;
  uint64_t v21 = v9;
  Security::CodeSigning::SecStaticCode::visitOtherArchitectures(v9, (uint64_t)&v16);
  unsigned __int8 v10 = (const void *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 24LL))( *((void *)this + 3),  3LL);
  return Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 13, v10);
}

void sub_180641C54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
}

char *std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (char *)(a1 + 1);
  __int128 v5 = (int *)a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (char *)v5;
        int v7 = v5[8];
        int v8 = *((_DWORD *)v6 + 9);
        BOOL v9 = SHIDWORD(a2) < v8;
        if ((_DWORD)a2 != v7) {
          BOOL v9 = (int)a2 < v7;
        }
        if (!v9) {
          break;
        }
        __int128 v5 = *(int **)v6;
        unsigned __int8 v10 = (uint64_t **)v6;
        if (!*(void *)v6) {
          goto LABEL_14;
        }
      }

      BOOL v11 = v8 < SHIDWORD(a2);
      int v12 = (_DWORD)a2 == v7 ? v11 : v7 < (int)a2;
      if (v12 != 1) {
        break;
      }
      unsigned __int8 v10 = (uint64_t **)(v6 + 8);
      __int128 v5 = (int *)*((void *)v6 + 1);
      if (!v5) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    unsigned __int8 v10 = a1 + 1;
LABEL_14:
    unsigned int v13 = v6;
    uint64_t v6 = (char *)operator new(0x30uLL);
    *((void *)v6 + 4) = *a3;
    *((void *)v6 + 5) = 0LL;
    *(void *)uint64_t v6 = 0LL;
    *((void *)v6 + 1) = 0LL;
    *((void *)v6 + 2) = v13;
    const void *v10 = (uint64_t *)v6;
    CFTypeRef v14 = (uint64_t *)**a1;
    std::string v15 = (uint64_t *)v6;
    if (v14)
    {
      *a1 = v14;
      std::string v15 = *v10;
    }

    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v15);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }

  return v6;
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke( uint64_t a1, uint64_t a2, const char *a3)
{
  void (***v6)(void *__return_ptr);
  void (***v7)(void *__return_ptr);
  void (***v8)(void *__return_ptr);
  const void ***v9;
  const void ***v10;
  const void **v11;
  void *v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  BOOL v18;
  const void *v19;
  uint64_t **v20;
  uint64_t v21;
  uint64_t **v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  const char *v26;
  const void ***v27;
  const void **v28;
  unint64_t v29;
  ssize_t v26 = a3;
  uint64_t v3 = *(const void **)(a2 + 32);
  if (!v3 {
    || (uint64_t v5 = *(void *)(a1 + 32),
  }
  {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA23LL, a2, a3);
  }

  int v7 = v6;
  if (v8)
  {
    int v8 = (void (***)(void *__return_ptr))v8[13];
    if (v8) {
  }
    }

  if (!v8) {
    int v8 = v7;
  }
  (**v8)(&v27);
  BOOL v9 = (const void ***)operator new(0x18uLL);
  unsigned __int8 v10 = v9;
  BOOL v11 = v28;
  unsigned __int8 *v9 = (const void **)v27;
  v9[1] = v11;
  int v12 = v9 + 1;
  unsigned int v13 = v29;
  void v9[2] = (const void **)v29;
  if (v13)
  {
    v11[2] = v12;
    uint64_t v27 = &v28;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
  }

  else
  {
    unsigned __int8 *v9 = (const void **)v12;
  }

  CFTypeRef v14 = std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)(v5 + 352),  (uint64_t)a3,  &v26);
  std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>::reset[abi:ne180100]( (const void ****)v14 + 5,  v10);
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(v28);
  std::string v15 = *(void *)(v5 + 8);
  uint64_t v16 = *(_DWORD *)(v15 + 304);
  uint64_t v17 = v16 == (_DWORD)a3 && ((*(_DWORD *)(v15 + 308) ^ HIDWORD(a3)) & 0xFFFFFF) == 0;
  if (v16) {
    uint64_t v18 = !v17;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!v18)
  {
    uint64_t v19 = *(const void **)(v15 + 312);
    if (v19)
    {
      uint64_t v20 = (uint64_t **)*((void *)std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>( (uint64_t **)(v5 + 352),  (uint64_t)a3,  &v26)
                        + 5);
      uint64_t v21 = (uint64_t)v20[1];
      uint64_t v22 = v20 + 1;
      size_t v23 = (uint64_t)(v20 + 1);
      if (v21)
      {
        while (1)
        {
          while (1)
          {
            size_t v23 = v21;
            std::string v24 = *(_DWORD *)(v21 + 32);
            if (v24 <= 0x10000) {
              break;
            }
            uint64_t v21 = *(void *)v23;
            uint64_t v22 = (uint64_t **)v23;
            if (!*(void *)v23) {
              goto LABEL_26;
            }
          }

          if (v24 == 0x10000) {
            break;
          }
          uint64_t v21 = *(void *)(v23 + 8);
          if (!v21)
          {
            uint64_t v22 = (uint64_t **)(v23 + 8);
            goto LABEL_26;
          }
        }
      }

      else
      {
LABEL_26:
        uint64_t v29 = 0xAAAAAAAAAAAAAA01LL;
        id v25 = operator new(0x30uLL);
        uint64_t v28 = (const void **)(v20 + 1);
        v25[8] = 0x10000;
        *((void *)v25 + 5) = 0LL;
        std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at( v20,  v23,  v22,  (uint64_t *)v25);
        uint64_t v27 = 0LL;
        std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v27);
        size_t v23 = (uint64_t)v25;
      }

      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)(v23 + 40), v19);
    }
  }

void sub_180641F94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void ***a10, uint64_t a11, uint64_t a12, const void **a13)
{
}

uint64_t ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke_2( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(a2 + 32) + 80LL))(*(void *)(a2 + 32));
  Security::Universal::bestNativeArch(v3);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void Security::CodeSigning::MachORep::~MachORep(Security::CodeSigning::MachORep *this)
{
}

{
  uint64_t v2;
  *(void *)this = off_189678B88;
  *((void *)this + 6) = &unk_189678CA8;
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    free(*(void **)(v2 + 8));
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v2 + 56));
    operator delete((void *)v2);
  }

  free(*((void **)this + 8));
  *(void *)this = off_189678F30;
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachORep *)((char *)this + 40));
  Security::CodeSigning::DiskRep::~DiskRep(this);
}

CFDataRef Security::CodeSigning::MachORep::component( Security::CodeSigning::MachORep *this, Security::CodeSigning::EmbeddedSignatureBlob *a2)
{
  if ((_DWORD)a2 == 1) {
    return (CFDataRef)Security::CodeSigning::MachORep::infoPlist(this);
  }
  CFDataRef result = (CFDataRef)Security::CodeSigning::MachORep::signingData(this);
  if (result)
  {
    uint64_t v5 = (Security::CodeSigning::EmbeddedSignatureBlob *)Security::CodeSigning::MachORep::signingData(this);
    return Security::CodeSigning::EmbeddedSignatureBlob::component(v5, a2, v6);
  }

  return result;
}

CFDataRef Security::CodeSigning::MachORep::identification(Security::CodeSigning::MachORep *this)
{
  uint64_t v1 = (off_t *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
  uint64_t v2 = (const void **)Security::Universal::architecture(v1);
  CFDataRef v4 = Security::CodeSigning::MachORep::identificationFor(v2, v3);
  (*((void (**)(const void **))*v2 + 1))(v2);
  return v4;
}

void sub_1806420BC(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::MachORep::prepareForSigning(uint64_t a1, uint64_t a2)
{
  if (!*(void *)((*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2) + 16))
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    std::string v15 = v16;
    Security::Universal::architectures(*(uint64_t **)(a1 + 56), (uint64_t *)&v15);
    uint64_t v4 = (uint64_t)v15;
    if (v15 == v16) {
      goto LABEL_19;
    }
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (Security::MachOBase *)Security::Universal::architecture( *(Security::Universal **)(a1 + 56),  (const Security::Architecture *)*(unsigned int *)(v4 + 28),  *(_DWORD *)(v4 + 32));
      v19[0] = -1431655766;
      int v7 = Security::MachOBase::version(v6, v19, 0LL, 0LL);
      unsigned int v8 = v19[0];
      if (!v7) {
        unsigned int v8 = 0;
      }
      unsigned int v9 = 658180;
      uint64_t v10 = 1LL;
      switch(v8)
      {
        case 0u:
        case 4u:
          break;
        case 1u:
          goto LABEL_8;
        case 2u:
        case 3u:
          unsigned int v9 = 720896;
LABEL_8:
          v19[0] = -1431655766;
          int v11 = Security::MachOBase::version(v6, 0LL, v19, 0LL) ^ 1;
          if (v19[0] < v9) {
            int v11 = 1;
          }
          uint64_t v10 = v11 | v5;
          break;
        default:
          uint64_t v10 = v5;
          break;
      }

      (*(void (**)(Security::MachOBase *))(*(void *)v6 + 8LL))(v6);
      int v12 = *(void **)(v4 + 8);
      if (v12)
      {
        do
        {
          unsigned int v13 = (void **)v12;
          int v12 = (void *)*v12;
        }

        while (v12);
      }

      else
      {
        do
        {
          unsigned int v13 = *(void ***)(v4 + 16);
          BOOL v14 = *v13 == (void *)v4;
          uint64_t v4 = (uint64_t)v13;
        }

        while (!v14);
      }

      uint64_t v5 = v10;
      uint64_t v4 = (uint64_t)v13;
    }

    while (v13 != v16);
    if ((v10 & 1) == 0)
    {
LABEL_19:
      v20[0] = 0LL;
      v20[1] = 0LL;
      *(void *)uint64_t v19 = v20;
      std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>((uint64_t *)v19, 2u, 2);
      std::set<unsigned int>::set[abi:ne180100]((uint64_t)v17, v19);
      (*(void (**)(uint64_t, _BYTE *))(*(void *)a2 + 32LL))(a2, v17);
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v18);
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v20[0]);
    }

    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v16[0]);
  }

void sub_1806422A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
}

uint64_t Security::CodeSigning::MachORep::mainExecutableImage(Security::CodeSigning::MachORep *this)
{
  return *((void *)this + 7);
}

uint64_t Security::CodeSigning::MachORep::signingBase(Security::CodeSigning::MachORep *this)
{
  uint64_t v1 = (Security::Universal *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
  return Security::Universal::archOffset(v1);
}

uint64_t Security::CodeSigning::MachORep::signingLimit(off_t **this)
{
  uint64_t v1 = (Security::MachO *)Security::Universal::architecture(this[7]);
  uint64_t v2 = Security::MachO::signingExtent(v1);
  (*(void (**)(Security::MachO *))(*(void *)v1 + 8LL))(v1);
  return v2;
}

void sub_180642358(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::MachORep::execSegBase( Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal *)*((void *)this + 7);
  if (a2) {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture( v2,  (const Security::Architecture *)*(unsigned int *)a2,  *((_DWORD *)a2 + 1));
  }
  else {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture((off_t *)v2);
  }
  uint64_t v4 = v3;
  unsigned int v11 = -1431655766;
  char v5 = Security::MachOBase::version(v3, &v11, 0LL, 0LL);
  if (v11) {
    char v7 = v5;
  }
  else {
    char v7 = 0;
  }
  if ((v7 & 1) != 0 && (unint64_t Segment = Security::MachOBase::findSegment(v4, v6)) != 0)
  {
    if (*((_BYTE *)v4 + 32)) {
      uint64_t v9 = *(void *)(Segment + 40);
    }
    else {
      uint64_t v9 = *(unsigned int *)(Segment + 32);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  (*(void (**)(Security::MachOBase *))(*(void *)v4 + 8LL))(v4);
  return v9;
}

void sub_180642418(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::MachORep::execSegLimit( Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal *)*((void *)this + 7);
  if (a2) {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture( v2,  (const Security::Architecture *)*(unsigned int *)a2,  *((_DWORD *)a2 + 1));
  }
  else {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture((off_t *)v2);
  }
  uint64_t v4 = v3;
  unsigned int v11 = -1431655766;
  char v5 = Security::MachOBase::version(v3, &v11, 0LL, 0LL);
  if (v11) {
    char v7 = v5;
  }
  else {
    char v7 = 0;
  }
  if ((v7 & 1) != 0 && (unint64_t Segment = Security::MachOBase::findSegment(v4, v6)) != 0)
  {
    if (*((_BYTE *)v4 + 32)) {
      uint64_t v9 = *(void *)(Segment + 48);
    }
    else {
      uint64_t v9 = *(unsigned int *)(Segment + 36);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  (*(void (**)(Security::MachOBase *))(*(void *)v4 + 8LL))(v4);
  return v9;
}

void sub_1806424DC(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::MachORep::platformType( Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal *)*((void *)this + 7);
  if (a2) {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture( v2,  (const Security::Architecture *)*(unsigned int *)a2,  *((_DWORD *)a2 + 1));
  }
  else {
    uint64_t v3 = (Security::MachOBase *)Security::Universal::architecture((off_t *)v2);
  }
  uint64_t v4 = v3;
  *(void *)uint64_t v9 = 0LL;
  unsigned int v8 = 0;
  int v5 = Security::MachOBase::version(v3, &v9[1], v9, &v8);
  unsigned int v6 = v9[1];
  (*(void (**)(Security::MachOBase *))(*(void *)v4 + 8LL))(v4);
  if (v5) {
    return v6;
  }
  else {
    return 0LL;
  }
}

void sub_18064257C(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::MachORep::format(Security::CodeSigning::MachORep *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
  if (!v3)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "Mach-O (unrecognized format)");
    return;
  }

  uint64_t v4 = v3;
  v25[0] = 0LL;
  v25[1] = 0LL;
  std::string v24 = (cpu_type_t *)v25;
  Security::Universal::architectures(v3, (uint64_t *)&v24);
  if (v4[1])
  {
    memset(&v23, 170, sizeof(v23));
    std::string::basic_string[abi:ne180100]<0>(&v23, "Mach-O universal (");
    uint64_t v5 = (uint64_t)v24;
    if (v24 != (cpu_type_t *)v25)
    {
      do
      {
        if ((cpu_type_t *)v5 != v24) {
          std::string::append(&v23, " ", 1uLL);
        }
        Security::Architecture::displayName((Security::Architecture *)&__p, (cpu_type_t *)(v5 + 28));
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type size = __p.__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        std::string::append(&v23, (const std::string::value_type *)p_p, size);
        unsigned int v8 = *(void **)(v5 + 8);
        if (v8)
        {
          do
          {
            uint64_t v9 = (void **)v8;
            unsigned int v8 = (void *)*v8;
          }

          while (v8);
        }

        else
        {
          do
          {
            uint64_t v9 = *(void ***)(v5 + 16);
            BOOL v10 = *v9 == (void *)v5;
            uint64_t v5 = (uint64_t)v9;
          }

          while (!v10);
        }

        uint64_t v5 = (uint64_t)v9;
      }

      while (v9 != v25);
    }

    if ((v23.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      size_t v11 = v23.__r_.__value_.__s.__size_;
    }
    else {
      size_t v11 = v23.__r_.__value_.__l.__size_;
    }
    memset((void *)a2, 170, 24);
    std::string::basic_string[abi:ne180100](a2, v11 + 1);
    if (v11)
    {
      if ((v23.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v12 = &v23;
      }
      else {
        int v12 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      memmove((void *)a2, v12, v11);
    }

    *(_WORD *)(a2 + v11) = 41;
    unsigned int v13 = (void *)v23.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Mach-O thin (");
    Security::Architecture::displayName((Security::Architecture *)v20, v24 + 7);
    if ((v21 & 0x80u) == 0) {
      BOOL v14 = v20;
    }
    else {
      BOOL v14 = (void **)v20[0];
    }
    if ((v21 & 0x80u) == 0) {
      std::string::size_type v15 = v21;
    }
    else {
      std::string::size_type v15 = (std::string::size_type)v20[1];
    }
    uint64_t v16 = std::string::append(&__p, (const std::string::value_type *)v14, v15);
    __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v23.__r_.__value_.__l.__cap_ = v16->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0LL;
    v16->__r_.__value_.__l.__cap_ = 0LL;
    v16->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v18 = std::string::append(&v23, ")", 1uLL);
    __int128 v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    *(void *)(a2 + 16) = v18->__r_.__value_.__l.__cap_;
    *(_OWORD *)a2 = v19;
    v18->__r_.__value_.__l.__size_ = 0LL;
    v18->__r_.__value_.__l.__cap_ = 0LL;
    v18->__r_.__value_.__r.__words[0] = 0LL;
    unsigned int v13 = (void *)__p.__r_.__value_.__r.__words[0];
  }

  operator delete(v13);
LABEL_46:
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v25[0]);
}

void sub_180642820( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, void *a28)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(a28);
  _Unwind_Resume(a1);
}

uint64_t Security::CodeSigning::MachORep::flush(Security::CodeSigning::MachORep *this)
{
  uint64_t v2 = *((void *)this + 7);
  off_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  free(*(void **)(v2 + 8));
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v2 + 56));
  operator delete((void *)v2);
  *((void *)this + 7) = 0LL;
  free(*((void **)this + 8));
  *((void *)this + _Block_object_dispose(va, 8) = 0LL;
  Security::UnixPlusPlus::FileDesc::close((Security::CodeSigning::MachORep *)((char *)this + 40));
  uint64_t v5 = operator new(0x50uLL);
  uint64_t v6 = (*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 144LL))(this);
  unsigned int v8 = *(_DWORD *)v6;
  char v9 = *(_BYTE *)(v6 + 4);
  uint64_t result = Security::Universal::Universal((uint64_t)v5, &v8, v3, v4);
  *((void *)this + 7) = v5;
  return result;
}

void sub_180642960(_Unwind_Exception *a1)
{
}

CFDataRef Security::CodeSigning::MachORep::copyDiskRepInformation(Security::CodeSigning::MachORep *this)
{
  uint64_t v1 = (off_t *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
  uint64_t v2 = (Security::MachOBase *)Security::Universal::architecture(v1);
  *(void *)uint64_t v20 = 0LL;
  CFDataRef v21 = 0LL;
  unsigned int v19 = 0;
  if ((Security::MachOBase::version(v2, &v20[1], v20, &v19) & 1) != 0)
  {
    CFDataRef v17 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{%O = %d,%O = %d,%O = %d}",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)@"VersionPlatform");
    if (v21) {
      CFRelease(v21);
    }
    CFDataRef v21 = v17;
    if (v20[1] == 1 && v19 >> 8 <= 0xA08)
    {
      CFDataRef v17 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{+%O, %O = 'OS X SDK version before 10.9 does not support Library Validation'}",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v17);
      if (v21) {
        CFRelease(v21);
      }
    }
  }

  else
  {
    CFDataRef v17 = v21;
  }

  CFDataRef v21 = 0LL;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&v21);
  (*(void (**)(Security::MachOBase *))(*(void *)v2 + 8LL))(v2);
  return v17;
}

void sub_180642A7C(_Unwind_Exception *a1)
{
}

const void **Security::CodeSigning::MachORep::registerStapledTicket(Security::CodeSigning::MachORep *this)
{
  uint64_t v3 = (Security::CodeSigning *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 176LL))(this);
  Security::CodeSigning::registerStapledTicketWithSystem(v3, v1);
  return Security::CFRef<__CFData const*>::~CFRef((const void **)&v3);
}

CFDataRef Security::CodeSigning::MachORep::copyStapledTicket( Security::CodeSigning::MachORep *this, uint64_t a2, const Security::BlobCore *a3)
{
  CFTypeRef cf = 0LL;
  uint64_t v3 = (Security::CodeSigning::EmbeddedSignatureBlob *)*((void *)this + 8);
  if (v3) {
    CFDataRef v4 = Security::CodeSigning::EmbeddedSignatureBlob::component( v3,  (Security::CodeSigning::EmbeddedSignatureBlob *)0x10002,  a3);
  }
  else {
    CFDataRef v4 = 0LL;
  }
  CFTypeRef cf = 0LL;
  Security::CFRef<__CFData const*>::~CFRef(&cf);
  return v4;
}

void sub_180642B34(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void Security::CodeSigning::MachORep::recommendedIdentifier(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 192LL))(__p);
  CFDataRef v4 = (void *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) < 0) {
    CFDataRef v4 = __p[1];
  }
  if (v4)
  {
    *(_OWORD *)a2 = *(_OWORD *)__p;
    *(void **)(a2 + 16) = __p[2];
  }

  else
  {
    Security::CodeSigning::DiskRep::canonicalIdentifier((std::string *)a2, (std::string *)(a1 + 16));
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }

void sub_180642BD4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const void **Security::CodeSigning::MachORep::explicitIdentifier@<X0>( Security::CodeSigning::MachORep *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = (const __CFData *)Security::CodeSigning::MachORep::infoPlist(this);
  if (!v3) {
    return (const void **)std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_18065A197);
  }
  CFPropertyListRef CFDictionaryFrom = Security::makeCFDictionaryFrom(v3, v4);
  uint64_t v10 = CFDictionaryFrom;
  if (!CFDictionaryFrom) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
  }
  Value = (const __CFString *)CFDictionaryGetValue( (CFDictionaryRef)CFDictionaryFrom,  (const void *)*MEMORY[0x189604E00]);
  uint64_t v7 = Value;
  if (!Value)
  {
    Security::CFRef<__CFDictionary const*>::~CFRef(&v10);
    return (const void **)std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_18065A197);
  }

  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 != CFStringGetTypeID()) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
  }
  Security::cfString(a2, v7);
  return Security::CFRef<__CFDictionary const*>::~CFRef(&v10);
}

void sub_180642CB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

_DWORD *Security::CodeSigning::MachORep::defaultRequirements(uint64_t a1, unsigned int *a2)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  v69[0] = 0LL;
  v69[1] = 0LL;
  CFMutableDictionaryRef v68 = v69;
  CFDataRef v4 = (Security::Universal *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  uint64_t v5 = (Security::MachOBase *)Security::Universal::architecture(v4, (const Security::Architecture *)*a2, a2[1]);
  uint64_t v6 = malloc(0x400uLL);
  uint64_t v75 = v6;
  *(void *)uint64_t v6 = 843514LL;
  v6[2] = 0x1000000;
  uint64_t v76 = 0xC00000400LL;
  v73[0] = 0xAAAAAAAA0000000CLL;
  v73[1] = &v75;
  uint64_t v74 = 7LL;
  Command = Security::MachOBase::findCommand(v5, 43);
  if (!Command) {
    goto LABEL_16;
  }
  cmdstd::string::size_type size = Command->cmdsize;
  unsigned int v9 = bswap32(cmdsize);
  if (*((_BYTE *)v5 + 33)) {
    cmdstd::string::size_type size = v9;
  }
  if (cmdsize <= 0xF) {
    Security::UnixError::throwMe((Security::UnixError *)8);
  }
  unsigned int cmd = Command[1].cmd;
  unsigned int v11 = Command[1].cmdsize;
  unsigned int v12 = bswap32(cmd);
  uint64_t v13 = *((_BYTE *)v5 + 33) ? v12 : cmd;
  unsigned int v14 = bswap32(v11);
  size_t v15 = *((_BYTE *)v5 + 33) ? v14 : v11;
  Blob = Security::BlobCore::readBlob( (Security::BlobCore *)*((unsigned int *)v5 + 9),  *((void *)v5 + 6) + v13,  -86111227,  v15);
  CFDataRef v17 = Blob;
  if (!Blob) {
    goto LABEL_16;
  }
  if (*Blob != 84729594
    || (v18 = bswap32(Blob[2]), unint64_t v19 = 8LL * v18 + 12, v20 = bswap32(Blob[1]), v19 > v20))
  {
    *__error() = 22;
LABEL_15:
    free(v17);
LABEL_16:
    CFDataRef v21 = 0LL;
    uint64_t v22 = v75;
    goto LABEL_17;
  }

  unint64_t v25 = (unint64_t)&Blob[2 * v18 + 3];
  while (1)
  {
    v25 -= 8LL;
    unsigned int v26 = *(_DWORD *)(v25 + 4);
    if (v26)
    {
      unint64_t v27 = bswap32(v26);
      BOOL v28 = v19 > v27 || v27 + 8 > v20;
    }
  }

  uint64_t v29 = (os_log_s *)secLogObjForScope("machorep");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v56 = v17[1];
    unsigned int v55 = v17[2];
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(void *)a1 + 40LL))(&v72, a1);
    if ((v72.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v57 = &v72;
    }
    else {
      int v57 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    uint64_t v58 = *((void *)v5 + 1);
    unsigned int v60 = *(_DWORD *)(v58 + 4);
    unsigned int v59 = *(_DWORD *)(v58 + 8);
    unsigned int v61 = bswap32(v60);
    if (*((_BYTE *)v5 + 33)) {
      cpu_type_t v62 = v61;
    }
    else {
      cpu_type_t v62 = v60;
    }
    unsigned int v63 = bswap32(v59);
    if (*((_BYTE *)v5 + 33)) {
      unsigned int v59 = v63;
    }
    int v64 = NXGetArchInfoFromCpuType(v62, v59 & 0xFFFFFF);
    uint64_t v65 = bswap32(v56);
    unsigned int v66 = bswap32(v55);
    if (v64) {
      name = v64->name;
    }
    else {
      name = 0LL;
    }
    *(_DWORD *)std::string buf = 134218754;
    *(void *)&void buf[4] = v65;
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = v66;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v57;
    __int16 v78 = 2080;
    unsigned int v79 = name;
    _os_log_debug_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEBUG,  "%zd library dependency bytes in %d blob(s) from %s(%s)",  buf,  0x26u);
  }

  unsigned int v30 = v17[2];
  if (!v30) {
    goto LABEL_15;
  }
  uint64_t v31 = 0LL;
  unsigned int v32 = bswap32(v30);
  if (v32 <= 1) {
    uint64_t v33 = 1LL;
  }
  else {
    uint64_t v33 = v32;
  }
  uint64_t v34 = 4LL;
  do
  {
    unsigned int v35 = v17[v34];
    uint64_t v36 = (_DWORD *)((char *)v17 + bswap32(v35));
    if (v35) {
      BOOL v37 = v36 == 0LL;
    }
    else {
      BOOL v37 = 1;
    }
    if (v37)
    {
      unint64_t v38 = (os_log_s *)secLogObjForScope("machorep");
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_70;
      }
      *(_DWORD *)std::string buf = 67109120;
      *(_DWORD *)&void buf[4] = v31;
      uint64_t v39 = v38;
      uint64_t v40 = "missing DR info for library index %d";
      uint32_t v41 = 8;
      goto LABEL_42;
    }

    unsigned int v42 = bswap32(v36[1]);
    if (*v36 == 843514 && v42 > 0xB) {
      goto LABEL_68;
    }
    *__error() = 22;
    unsigned int v44 = bswap32(v36[1]);
    if (*v36 == 17555194 && v44 > 7)
    {
      memset(buf, 170, 24);
      std::string::basic_string[abi:ne180100](buf, v36 + 2, bswap32(v36[1]) - 8LL);
      SecRequirementRef requirement = 0LL;
      if ((buf[23] & 0x80000000) != 0) {
        std::string::__init_copy_ctor_external( &v72,  *(const std::string::value_type **)buf,  *(std::string::size_type *)&buf[8]);
      }
      else {
        std::string v72 = *(std::string *)buf;
      }
      Security::CFTempString::CFTempString<std::string>((CFStringRef *)&data, (char *)&v72);
      uint64_t v48 = (const __CFString *)data;
      if (requirement) {
        CFRelease(requirement);
      }
      SecRequirementRef requirement = 0LL;
      CFMutableDictionaryRef v49 = (Security::MacOSError *)SecRequirementCreateWithStringAndErrors(v48, 0, 0LL, &requirement);
      if ((_DWORD)v49) {
        Security::MacOSError::throwMe(v49);
      }
      Security::CFRef<__CFString const*>::~CFRef((const void **)&data);
      CFDataRef data = 0LL;
      uint64_t v50 = (Security::MacOSError *)SecRequirementCopyData(requirement, 0, &data);
      if ((_DWORD)v50) {
        Security::MacOSError::throwMe(v50);
      }
      BytePtr = CFDataGetBytePtr(data);
      uint64_t v36 = (unsigned int *)BytePtr;
      if (BytePtr && (*(_DWORD *)BytePtr != 843514 || bswap32(*((_DWORD *)BytePtr + 1)) <= 0xB))
      {
        uint64_t v36 = 0LL;
        *__error() = 22;
      }

      Security::CFRef<__CFData const*>::~CFRef((const void **)&data);
      Security::CFRef<__SecRequirement *>::~CFRef((const void **)&requirement);
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
LABEL_68:
      Security::CodeSigning::Requirement::Maker::Chain::add(v73);
      if (v36[2] != 0x1000000) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA15LL);
      }
      uint64_t v52 = bswap32(v36[1]) - 12LL;
      int64_t v53 = (void *)Security::CodeSigning::Requirement::Maker::alloc( (Security::CodeSigning::Requirement::Maker *)&v75,  v52);
      memcpy(v53, v36 + 3, v52);
      goto LABEL_70;
    }

    *__error() = 22;
    uint64_t v46 = (os_log_s *)secLogObjForScope("machorep");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v47 = bswap32(*v36);
      *(_DWORD *)std::string buf = 67109376;
      *(_DWORD *)&void buf[4] = v47;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v31;
      uint64_t v39 = v46;
      uint64_t v40 = "unexpected blob type 0x%x in slot %d of binary dependencies";
      uint32_t v41 = 14;
LABEL_42:
      _os_log_debug_impl(&dword_1804F4000, v39, OS_LOG_TYPE_DEBUG, v40, buf, v41);
    }

void sub_1806432DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, const void *a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, uint64_t a30, void *__p, uint64_t a32, int a33, __int16 a34, char a35, char a36)
{
  if (a2)
  {
    Security::CFRef<__SecRequirement *>::~CFRef(&a19);
    if (a36 < 0) {
      operator delete(__p);
    }
    __cxa_begin_catch(exception_object);
    free(v36);
    __cxa_rethrow();
  }

  _Unwind_Resume(exception_object);
}

void sub_1806433A4()
{
}

void sub_1806433C8(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x1806433E4LL);
}

uint64_t Security::CodeSigning::MachORep::pageSize()
{
  return 4096LL;
}

void Security::CodeSigning::MachORep::strictValidate(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(void *)(a1 + 56);
  if (!*(_BYTE *)(v6 + 76))
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    unint64_t v20 = v21;
    Security::Universal::architectures((uint64_t *)v6, (uint64_t *)&v20);
    uint64_t v14 = (uint64_t)v20;
    if (v20 == v21)
    {
LABEL_21:
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v21[0]);
      return;
    }

    while (1)
    {
      size_t v15 = (unsigned __int8 *)Security::Universal::architecture( (Security::Universal *)v6,  (const Security::Architecture *)*(unsigned int *)(v14 + 28),  *(_DWORD *)(v14 + 32));
      int v16 = v15[104];
      (*(void (**)(unsigned __int8 *))(*(void *)v15 + 8LL))(v15);
      if (v16) {
        break;
      }
      CFDataRef v17 = *(void **)(v14 + 8);
      if (v17)
      {
        do
        {
          uint64_t v18 = (void **)v17;
          CFDataRef v17 = (void *)*v17;
        }

        while (v17);
      }

      else
      {
        do
        {
          uint64_t v18 = *(void ***)(v14 + 16);
          BOOL v19 = *v18 == (void *)v14;
          uint64_t v14 = (uint64_t)v18;
        }

        while (!v19);
      }

      uint64_t v14 = (uint64_t)v18;
      if (v18 == v21) {
        goto LABEL_21;
      }
    }

    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v21[0]);
  }

  uint64_t v9 = *(void *)(a3 + 8);
  uint64_t v8 = a3 + 8;
  uint64_t v7 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v10 = v8;
  do
  {
    int v11 = *(_DWORD *)(v7 + 28);
    BOOL v12 = v11 < -67010;
    if (v11 >= -67010) {
      uint64_t v13 = (uint64_t *)v7;
    }
    else {
      uint64_t v13 = (uint64_t *)(v7 + 8);
    }
    if (!v12) {
      uint64_t v10 = v7;
    }
    uint64_t v7 = *v13;
  }

  while (*v13);
  if (v10 == v8 || *(int *)(v10 + 28) > -67010) {
LABEL_12:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA3ELL);
}

void sub_180643520( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

Security::CodeSigning::SingleDiskRep::Writer *Security::CodeSigning::MachORep::writer( Security::CodeSigning::MachORep *this)
{
  uint64_t v2 = (Security::CodeSigning::SingleDiskRep::Writer *)operator new(0x68uLL);
  Security::CodeSigning::SingleDiskRep::Writer::Writer(v2, this, 2);
  *(void *)uint64_t v2 = off_189678CE0;
  return v2;
}

void sub_18064357C(_Unwind_Exception *a1)
{
}

CFTypeRef *Security::CodeSigning::MachORep::createRawComponents@<X0>( Security::CodeSigning::MachORep *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)a2 = a2 + 8;
  if (!Security::CodeSigning::MachORep::signingData(this)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
  }
  uint64_t result = (CFTypeRef *)Security::CodeSigning::MachORep::signingData(this);
  uint64_t v6 = (uint64_t)result;
  if (*((_DWORD *)result + 2))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = (unsigned int *)(result + 2);
    do
    {
      uint64_t v9 = (Security::CodeSigning::EmbeddedSignatureBlob *)bswap32(*(v8 - 1));
      int v14 = (int)v9;
      uint64_t v10 = (const UInt8 *)(bswap32(*v8) + v6);
      if (*v8) {
        int v11 = v10;
      }
      else {
        int v11 = 0LL;
      }
      CFDataRef v12 = Security::CodeSigning::EmbeddedSignatureBlob::blobData(v9, v11, v5);
      uint64_t v13 = std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>( (uint64_t **)a2,  (int)v9,  &v14);
      uint64_t result = Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)v13 + 5, v12);
      v8 += 2;
      ++v7;
    }

    while (v7 < bswap32(*(_DWORD *)(v6 + 8)));
  }

  return result;
}

void sub_180643674(_Unwind_Exception *a1)
{
}

CFTypeRef *non-virtual thunk to'Security::CodeSigning::MachORep::createRawComponents@<X0>( Security::CodeSigning::MachORep *this@<X0>, uint64_t a2@<X8>)
{
  return Security::CodeSigning::MachORep::createRawComponents( (Security::CodeSigning::MachORep *)((char *)this - 48),  a2);
}

uint64_t Security::CodeSigning::MachORep::signingData(Security::CodeSigning::MachORep *this)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  uint64_t result = *((void *)this + 8);
  if (!result)
  {
    uint64_t v3 = (off_t *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
    CFDataRef v4 = (Security::MachOBase *)Security::Universal::architecture(v3);
    CodeSignature = Security::MachOBase::findCodeSignature(v4);
    if (CodeSignature)
    {
      unsigned int cmd = CodeSignature[1].cmd;
      cmdstd::string::size_type size = CodeSignature[1].cmdsize;
      unsigned int v8 = bswap32(cmd);
      if (*((_BYTE *)v4 + 33)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = cmd;
      }
      unsigned int v10 = bswap32(cmdsize);
      if (*((_BYTE *)v4 + 33)) {
        size_t v11 = v10;
      }
      else {
        size_t v11 = cmdsize;
      }
      Blob = Security::BlobCore::readBlob( (Security::BlobCore *)*((unsigned int *)v4 + 9),  *((void *)v4 + 6) + v9,  -86111040,  v11);
      uint64_t v13 = Blob;
      if (Blob)
      {
        if (*Blob == -1072898310)
        {
          uint64_t v14 = bswap32(Blob[2]);
          unint64_t v15 = 8LL * v14 + 12;
          unint64_t v16 = bswap32(Blob[1]);
          if (v15 <= v16)
          {
            unint64_t v17 = (unint64_t)&Blob[2 * v14 + 3];
            while (1)
            {
              v17 -= 8LL;
              unsigned int v18 = *(_DWORD *)(v17 + 4);
              if (v18)
              {
                unint64_t v19 = bswap32(v18);
                BOOL v20 = v15 > v19 || v19 + 8 > v16;
              }
            }

            *((void *)this + _Block_object_dispose(va, 8) = Blob;
            CFDataRef v21 = (os_log_s *)secLogObjForScope("machorep");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v32 = *((void *)this + 8);
              unsigned int v34 = *(_DWORD *)(v32 + 4);
              unsigned int v33 = *(_DWORD *)(v32 + 8);
              unsigned int v35 = v46;
              (*(void (**)(_BYTE *__return_ptr, Security::CodeSigning::MachORep *))(*(void *)this + 40LL))( v46,  this);
              if (v49 < 0) {
                unsigned int v35 = *(_BYTE **)v46;
              }
              uint64_t v36 = *((void *)v4 + 1);
              unsigned int v38 = *(_DWORD *)(v36 + 4);
              unsigned int v37 = *(_DWORD *)(v36 + 8);
              unsigned int v39 = bswap32(v38);
              if (*((_BYTE *)v4 + 33)) {
                cpu_type_t v40 = v39;
              }
              else {
                cpu_type_t v40 = v38;
              }
              unsigned int v41 = bswap32(v37);
              if (*((_BYTE *)v4 + 33)) {
                unsigned int v37 = v41;
              }
              unsigned int v42 = NXGetArchInfoFromCpuType(v40, v37 & 0xFFFFFF);
              uint64_t v43 = bswap32(v34);
              unsigned int v44 = bswap32(v33);
              if (v42) {
                name = v42->name;
              }
              else {
                name = 0LL;
              }
              *(_DWORD *)std::string __p = 134218754;
              *(void *)&__p[4] = v43;
              __int16 v51 = 1024;
              unsigned int v52 = v44;
              __int16 v53 = 2080;
              int v54 = v35;
              __int16 v55 = 2080;
              unsigned int v56 = name;
              _os_log_debug_impl( &dword_1804F4000,  v21,  OS_LOG_TYPE_DEBUG,  "%zd signing bytes in %d blob(s) from %s(%s)",  __p,  0x26u);
              if (v49 < 0) {
                operator delete(*(void **)v46);
              }
            }

            goto LABEL_22;
          }
        }

        *__error() = 22;
LABEL_25:
        free(v13);
      }

      *((void *)this + _Block_object_dispose(va, 8) = 0LL;
      uint64_t v22 = (os_log_s *)secLogObjForScope("machorep");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        (*(void (**)(_BYTE *__return_ptr, Security::CodeSigning::MachORep *))(*(void *)this + 40LL))( __p,  this);
        if (SBYTE3(v54) >= 0) {
          std::string v23 = __p;
        }
        else {
          std::string v23 = *(_BYTE **)__p;
        }
        uint64_t v24 = *((void *)v4 + 1);
        unsigned int v26 = *(_DWORD *)(v24 + 4);
        unsigned int v25 = *(_DWORD *)(v24 + 8);
        unsigned int v27 = bswap32(v26);
        if (*((_BYTE *)v4 + 33)) {
          cpu_type_t v28 = v27;
        }
        else {
          cpu_type_t v28 = v26;
        }
        unsigned int v29 = bswap32(v25);
        if (*((_BYTE *)v4 + 33)) {
          unsigned int v25 = v29;
        }
        unsigned int v30 = NXGetArchInfoFromCpuType(v28, v25 & 0xFFFFFF);
        if (v30) {
          uint64_t v31 = v30->name;
        }
        else {
          uint64_t v31 = 0LL;
        }
        *(_DWORD *)uint64_t v46 = 136315394;
        *(void *)&v46[4] = v23;
        __int16 v47 = 2080;
        uint64_t v48 = v31;
        _os_log_debug_impl( &dword_1804F4000,  v22,  OS_LOG_TYPE_DEBUG,  "failed to read signing bytes from %s(%s)",  v46,  0x16u);
        if (SBYTE3(v54) < 0) {
          operator delete(*(void **)__p);
        }
      }

      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
    }

void sub_1806439D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  (*(void (**)(uint64_t))(*(void *)v21 + 8LL))(v21);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::Writer::~Writer(Security::CodeSigning::MachORep::Writer *this)
{
  *(void *)this = off_189678DC8;
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachORep::Writer *)((char *)this + 96));
  Security::RefPointer<Security::CodeSigning::SingleDiskRep>::~RefPointer((void *)this + 3);
}

{
  *(void *)this = off_189678DC8;
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachORep::Writer *)((char *)this + 96));
  Security::RefPointer<Security::CodeSigning::SingleDiskRep>::~RefPointer((void *)this + 3);
  operator delete(this);
}

void Security::CodeSigning::MachORep::Writer::component( Security::CodeSigning::MachORep::Writer *this, const char *a2, const __CFData *a3)
{
}

CFTypeRef Security::CodeSigning::MachORep::infoPlist(Security::CodeSigning::MachORep *this)
{
  CFTypeRef cf = 0LL;
  uint64_t v1 = (off_t *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80LL))(this);
  uint64_t v2 = (unsigned __int8 *)Security::Universal::architecture(v1);
  unint64_t Segment = (unsigned int *)Security::MachOBase::findSegment((Security::MachOBase *)v2, v3);
  if (!Segment) {
    goto LABEL_41;
  }
  int v5 = v2[32];
  if (!v2[32])
  {
    unsigned int v12 = Segment[12];
    LODWORD(v13) = Segment[1];
    int v6 = v2[33];
    unsigned int v14 = bswap32(v13);
    if (v2[33]) {
      unint64_t v13 = v14;
    }
    else {
      unint64_t v13 = v13;
    }
    unsigned int v15 = bswap32(v12);
    unsigned int v16 = v2[33] ? v15 : Segment[12];
    if (!v16) {
      goto LABEL_41;
    }
    size_t v11 = Segment + 14;
    while (strncmp((const char *)v11, "__info_plist", 0x10uLL))
    {
      v11 += 17;
      if (!--v16) {
        goto LABEL_41;
      }
    }

    goto LABEL_27;
  }

  int v6 = v2[33];
  unsigned int v7 = bswap32(Segment[1]);
  if (!v2[33]) {
    unsigned int v7 = Segment[1];
  }
  if (v7 <= 0x47) {
    Security::UnixError::throwMe((Security::UnixError *)8);
  }
  unsigned int v8 = Segment[16];
  if (80 * (unint64_t)v8 + 72 <= v7)
  {
    unsigned int v9 = bswap32(v8);
    unsigned int v10 = v2[33] ? v9 : Segment[16];
    if (v10)
    {
      size_t v11 = Segment + 18;
      while (strncmp((const char *)v11, "__info_plist", 0x10uLL))
      {
        v11 += 20;
        if (!--v10) {
          goto LABEL_41;
        }
      }

void sub_180643C9C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  size_t v11 = (os_log_s *)secLogObjForScope("machorep");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    a9 = 0;
    _os_log_debug_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEBUG,  "exception reading embedded Info.plist",  (uint8_t *)&a9,  2u);
  }

  __cxa_end_catch();
  JUMPOUT(0x180643C64LL);
}

void sub_180643D18(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

CFDataRef Security::CodeSigning::MachORep::identificationFor(const void **this, Security::MachO *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  Command = Security::MachOBase::findCommand((Security::MachOBase *)this, 27);
  if (Command)
  {
    cmdstd::string::size_type size = Command->cmdsize;
    unsigned int v5 = bswap32(cmdsize);
    if (*((_BYTE *)this + 33)) {
      cmdstd::string::size_type size = v5;
    }
    if (cmdsize != 24) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
    }
    c.h0 = 1145656661;
    *(_OWORD *)&c.h1 = *(_OWORD *)&Command[1].cmd;
    p_CC_SHA1_CTX c = (const UInt8 *)&c;
  }

  else
  {
    *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&c.data[9] = v7;
    *(_OWORD *)&c.data[13] = v7;
    *(_OWORD *)&c.data[1] = v7;
    *(_OWORD *)&c.data[5] = v7;
    *(_OWORD *)&c.h0 = v7;
    *(_OWORD *)&c.h4 = v7;
    CC_SHA1_Init(&c);
    CC_SHA1_Update(&c, this[1], 0x1Cu);
    unsigned int v8 = bswap32(*((_DWORD *)this[1] + 5));
    if (*((_BYTE *)this + 33)) {
      CC_LONG v9 = v8;
    }
    else {
      CC_LONG v9 = *((_DWORD *)this[1] + 5);
    }
    CC_SHA1_Update(&c, this[2], v9);
    memset(md, 170, 20);
    CC_SHA1_Final(md, &c);
    p_CC_SHA1_CTX c = md;
  }

  return CFDataCreate(0LL, p_c, 20LL);
}

CFDataRef Security::CodeSigning::EmbeddedSignatureBlob::component( Security::CodeSigning::EmbeddedSignatureBlob *this, Security::CodeSigning::EmbeddedSignatureBlob *a2, const Security::BlobCore *a3)
{
  unsigned int v3 = *((_DWORD *)this + 2);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  LODWORD(v5) = bswap32(v3);
  uint64_t v5 = v5 <= 1 ? 1LL : v5;
  int v6 = (unsigned int *)((char *)this + 12);
  while (1)
  {
    unsigned int v7 = *v6;
    v6 += 2;
    if (bswap32(v7) == (_DWORD)a2) {
      break;
    }
    if (v5 == ++v4) {
      return 0LL;
    }
  }

  unsigned int v8 = *((_DWORD *)this + 2 * v4 + 4);
  BOOL v10 = v8 == 0;
  CC_LONG v9 = (const UInt8 *)this + bswap32(v8);
  BOOL v10 = v10 || v9 == 0LL;
  if (v10) {
    return 0LL;
  }
  else {
    return Security::CodeSigning::EmbeddedSignatureBlob::blobData(a2, v9, a3);
  }
}

CFDataRef Security::CodeSigning::EmbeddedSignatureBlob::blobData( Security::CodeSigning::EmbeddedSignatureBlob *this, const UInt8 *a2, const Security::BlobCore *a3)
{
  if (Security::CodeSigning::CodeDirectory::slotAttributes(this) >= 2)
  {
    CFIndex v7 = bswap32(*((_DWORD *)a2 + 1));
    int v6 = a2;
  }

  else
  {
    if (!a2) {
      goto LABEL_11;
    }
    uint64_t v4 = bswap32(*((_DWORD *)a2 + 1));
    if (*(_DWORD *)a2 != 17555194 || v4 <= 7)
    {
      *__error() = 22;
LABEL_11:
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
    }

    int v6 = a2 + 8;
    CFIndex v7 = v4 - 8;
  }

  return CFDataCreate(0LL, v6, v7);
}

void Security::CodeSigning::EmbeddedSignatureBlob::Maker::component( uint64_t **this, Security::CodeSigning::CodeDirectory *a2, const __CFData *a3)
{
  unsigned int v4 = a2;
  unsigned int v6 = Security::CodeSigning::CodeDirectory::slotAttributes(a2);
  BytePtr = (Security::BlobCore *)CFDataGetBytePtr(a3);
  unsigned int v8 = BytePtr;
  if (v6 >= 2)
  {
    BOOL v10 = (uint64_t *)Security::BlobCore::clone(BytePtr);
  }

  else
  {
    CFIndex Length = CFDataGetLength(a3);
    BOOL v10 = (uint64_t *)Security::BlobWrapper::alloc(v8, Length);
  }

  Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::Maker::add( this,  v4,  v10);
}

CFPropertyListRef Security::CodeSigning::EntitlementBlob::entitlements( Security::CodeSigning::EntitlementBlob *this)
{
  unsigned int v4 = CFDataCreate(0LL, (const UInt8 *)this + 8, bswap32(*((_DWORD *)this + 1)) - 8LL);
  CFPropertyListRef CFDictionaryFrom = Security::makeCFDictionaryFrom(v4, v1);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v4);
  return CFDictionaryFrom;
}

void sub_18064407C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void Security::CodeSigning::ResourceBuilder::addRule( Security::CodeSigning::ResourceBuilder *this, __CFString *a2, const void *a3)
{
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == CFBooleanGetTypeID())
  {
    int v6 = 2 * (*MEMORY[0x189604DE0] == (void)a3);
    int v7 = 1;
  }

  else
  {
    CFDictionaryRef theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
    Security::CFDictionary::CFDictionary((Security::CFDictionary *)&theDict, a3);
    Security::CFTempString::CFTempString<char const*>((CFStringRef *)&key, "weight");
    Value = CFDictionaryGetValue(theDict, key);
    Security::CFRef<__CFNumber const*>::check<void const*>(Value, (Security::MacOSError *)v35);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
    if (Value) {
      int v7 = Security::cfNumber<unsigned int>((const __CFNumber *)Value);
    }
    else {
      int v7 = 1;
    }
    CC_LONG v9 = Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "omit");
    BOOL v10 = Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "optional");
    size_t v11 = Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "nested");
    unsigned int v12 = (const void *)*MEMORY[0x189604DE8];
    if (v10) {
      BOOL v13 = v10 == v12;
    }
    else {
      BOOL v13 = 0;
    }
    int v14 = v13;
    if (v9 != v12 || v9 == 0LL) {
      int v16 = 0;
    }
    else {
      int v16 = 2;
    }
    int v17 = v16 | v14;
    if (v11 != v12 || v11 == 0LL) {
      int v6 = v17;
    }
    else {
      int v6 = v17 | 4;
    }
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theDict);
  }

  uint64_t v19 = (regex_t *)operator new(0x40uLL);
  Security::CodeSigning::ResourceBuilder::Rule::Rule(v19, (__int128 *)&__p, v7, v6 | 0x40);
  size_t v21 = (regex_t **)*((void *)this + 9);
  unint64_t v20 = *((void *)this + 10);
  if ((unint64_t)v21 >= v20)
  {
    uint64_t v23 = *((void *)this + 8);
    uint64_t v24 = ((uint64_t)v21 - v23) >> 3;
    uint64_t v25 = v20 - v23;
    uint64_t v26 = v25 >> 2;
    else {
      unint64_t v27 = v26;
    }
    if (v27) {
      unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Security::CodeSigning::ResourceBuilder::Rule *>>(v27);
    }
    else {
      uint64_t v28 = 0LL;
    }
    unsigned int v29 = (regex_t **)(v27 + 8 * v24);
    unint64_t v30 = v27 + 8 * v28;
    *unsigned int v29 = v19;
    unsigned int v22 = v29 + 1;
    uint64_t v32 = (char *)*((void *)this + 8);
    uint64_t v31 = (char *)*((void *)this + 9);
    if (v31 != v32)
    {
      do
      {
        unsigned int v33 = (regex_t *)*((void *)v31 - 1);
        v31 -= 8;
        *--unsigned int v29 = v33;
      }

      while (v31 != v32);
      uint64_t v31 = (char *)*((void *)this + 8);
    }

    *((void *)this + _Block_object_dispose(va, 8) = v29;
    *((void *)this + 9) = v22;
    *((void *)this + 10) = v30;
    if (v31) {
      operator delete(v31);
    }
  }

  else
  {
    *size_t v21 = v19;
    unsigned int v22 = v21 + 1;
  }

  *((void *)this + 9) = v22;
}

void sub_1806442B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t Security::CFDictionary::Applier<Security::CodeSigning::ResourceBuilder>::apply( uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeID v5 = (uint64_t (*)(void *, uint64_t, uint64_t))a3[1];
  uint64_t v6 = a3[2];
  int v7 = (void *)(*a3 + (v6 >> 1));
  if ((v6 & 1) != 0) {
    CFTypeID v5 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*v7 + v5);
  }
  return v5(v7, a1, a2);
}

regex_t *Security::CodeSigning::ResourceBuilder::Rule::Rule(regex_t *a1, __int128 *a2, int a3, int a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  a1[1].re_magiCC_SHA1_CTX c = a3;
  *(&a1[1].re_magic + 1) = a4;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external( (std::string *)&a1[1].re_nsub,  *(const std::string::value_type **)a2,  *((void *)a2 + 1));
  }

  else
  {
    __int128 v8 = *a2;
    a1[1].re_g = (re_guts *)*((void *)a2 + 2);
    *(_OWORD *)&a1[1].re_nsub = v8;
  }

  else {
    CC_LONG v9 = *(const char **)a2;
  }
  if (regcomp(a1, v9, 5)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
  }
  BOOL v10 = (os_log_s *)secLogObjForScope("csresource");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    else {
      unsigned int v12 = *(const std::string::value_type **)a2;
    }
    int v13 = 134218754;
    int v14 = a1;
    __int16 v15 = 2080;
    int v16 = v12;
    __int16 v17 = 1024;
    int v18 = a3;
    __int16 v19 = 1024;
    int v20 = a4;
    _os_log_debug_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEBUG,  "%p rule %s added (weight %d, flags 0x%x)",  (uint8_t *)&v13,  0x22u);
  }

  return a1;
}

void sub_180644490(_Unwind_Exception *exception_object)
{
}

std::string::size_type Security::CodeSigning::ResourceBuilder::ResourceBuilder( std::string::size_type a1, uint64_t a2, std::string *a3, const void *a4, char a5, uint64_t a6)
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  *(_OWORD *)(a1 + 56) = 0u;
  BOOL v10 = (CFTypeRef *)(a1 + 56);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  size_t v11 = (std::string *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  if ((a5 & 1) != 0)
  {
    uint64_t v14 = *(void *)(a6 + 8);
    uint64_t v12 = a6 + 8;
    uint64_t v13 = v14;
    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    do
    {
      int v17 = *(_DWORD *)(v16 + 28);
      BOOL v18 = v17 < -67060;
      if (v17 >= -67060) {
        __int16 v19 = (uint64_t *)v16;
      }
      else {
        __int16 v19 = (uint64_t *)(v16 + 8);
      }
      if (!v18) {
        uint64_t v15 = v16;
      }
      uint64_t v16 = *v19;
    }

    while (*v19);
    if (v15 == v12 || *(int *)(v15 + 28) > -67060) {
LABEL_12:
    }
      uint64_t v15 = v12;
    *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = v15 == v12;
    if (!v13) {
      goto LABEL_23;
    }
    uint64_t v20 = v12;
    do
    {
      int v21 = *(_DWORD *)(v13 + 28);
      BOOL v22 = v21 < -67016;
      if (v21 >= -67016) {
        uint64_t v23 = (uint64_t *)v13;
      }
      else {
        uint64_t v23 = (uint64_t *)(v13 + 8);
      }
      if (!v22) {
        uint64_t v20 = v13;
      }
      uint64_t v13 = *v23;
    }

    while (*v23);
    if (v20 == v12 || *(int *)(v20 + 28) > -67016) {
LABEL_23:
    }
      uint64_t v20 = v12;
    BOOL v24 = v20 == v12;
  }

  else
  {
    BOOL v24 = 0;
    *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = 0;
  }

  *(_BYTE *)(a1 + 89) = v24;
  memset(__b, 170, sizeof(__b));
  else {
    uint64_t v25 = *(const char **)a2;
  }
  if (!realpath_DARWIN_EXTSN(v25, __b))
  {
LABEL_130:
    cpu_type_t v62 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v62);
  }

  std::string::__assign_external((std::string *)a1, __b);
  else {
    std::string __str = *a3;
  }
  std::string::size_type size = __str.__r_.__value_.__s.__size_;
  if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&context, &__str, size - 2, 2uLL, (std::allocator<char> *)theDict);
  std::string::size_type v27 = context.__r_.__value_.__s.__size_;
  if ((context.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type v27 = context.__r_.__value_.__l.__size_;
  }
  if (v27 != 2)
  {
    BOOL v29 = 0;
LABEL_46:
    operator delete(context.__r_.__value_.__l.__data_);
    if (v29) {
      goto LABEL_42;
    }
    goto LABEL_47;
  }

  p_std::string context = (std::string *)context.__r_.__value_.__r.__words[0];
  if ((context.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_std::string context = &context;
  }
  BOOL v29 = LOWORD(p_context->__r_.__value_.__l.__data_) == 11823;
LABEL_41:
  if (v29)
  {
LABEL_42:
    std::string::size_type v30 = __str.__r_.__value_.__s.__size_;
    if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v30 = __str.__r_.__value_.__l.__size_;
    }
    std::string::basic_string(&v67, &__str, 0LL, v30 - 2, (std::allocator<char> *)&context);
    goto LABEL_62;
  }

void sub_180644A98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  BOOL v29 = *(void **)(v25 + 64);
  if (v29)
  {
    *(void *)(v25 + 72) = v29;
    operator delete(v29);
  }

  Security::CFRef<__CFDictionary const*>::~CFRef(v27);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::ResourceBuilder::Rule::~Rule(void **this)
{
}

void Security::CodeSigning::ResourceBuilder::~ResourceBuilder(Security::CodeSigning::ResourceBuilder *this)
{
  unsigned int v3 = (void ***)*((void *)this + 8);
  uint64_t v2 = (void ***)*((void *)this + 9);
  while (v3 != v2)
  {
    if (*v3)
    {
      Security::CodeSigning::ResourceBuilder::Rule::~Rule(*v3);
      operator delete(v4);
      uint64_t v2 = (void ***)*((void *)this + 9);
    }

    ++v3;
  }

  fts_close(*((FTS **)this + 6));
  CFTypeID v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }

  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 7);
}

void Security::CodeSigning::ResourceBuilder::scan(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = 0;
  uint64_t v86 = *MEMORY[0x1895F89C0];
  unsigned int v62 = -67060;
  memset(&v83, 0, sizeof(v83));
  uint64_t v65 = (const void **)(a1 + 24);
  int v64 = 1;
  while (1)
  {
    uint64_t v6 = fts_read(*(FTS **)(a1 + 48));
    int v7 = v6;
    if (!v6) {
      break;
    }
    char v8 = *(_BYTE *)(a1 + 23);
    if (v8 < 0) {
      uint64_t v9 = *(void *)(a1 + 8);
    }
    else {
      uint64_t v9 = *(unsigned __int8 *)(a1 + 23);
    }
    BOOL v10 = &v6->fts_path[v9];
    int v12 = *v10;
    size_t v11 = (std::string *)(v10 + 1);
    if (v12) {
      p_str = v11;
    }
    else {
      p_str = (std::string *)&v6->fts_path[v9];
    }
    memset(&__str, 0, sizeof(__str));
    uint64_t v14 = *(unsigned __int8 *)(a1 + 47);
    if ((v14 & 0x80u) == 0LL) {
      uint64_t v15 = *(unsigned __int8 *)(a1 + 47);
    }
    else {
      uint64_t v15 = *(void *)(a1 + 32);
    }
    if (v15 != v9) {
      goto LABEL_23;
    }
    if (v8 >= 0) {
      uint64_t v16 = (unsigned __int8 *)a1;
    }
    else {
      uint64_t v16 = *(unsigned __int8 **)a1;
    }
    if ((v14 & 0x80) != 0)
    {
      if (memcmp(*v65, v16, *(void *)(a1 + 32))) {
        goto LABEL_23;
      }
    }

    else if (*(_BYTE *)(a1 + 47))
    {
      int v17 = v65;
      while (*(unsigned __int8 *)v17 == *v16)
      {
        int v17 = (const void **)((char *)v17 + 1);
        ++v16;
        if (!--v14) {
          goto LABEL_49;
        }
      }

void sub_1806455D8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, uint64_t a32, int a33, __int16 a34, char a35, char a36, uint64_t a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, uint64_t a43, uint64_t a44, int a45, __int16 a46, char a47, char a48, uint64_t a49, uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,int a57,__int16 a58,char a59,char a60)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::ResourceBuilder::findRule(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unsigned int v4 = (os_log_s *)secLogObjForScope("rscan");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v18 = (const char *)a2;
    *(_DWORD *)std::string buf = 136315138;
    std::string::size_type v20 = v18;
    _os_log_debug_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEBUG, "test %s", buf, 0xCu);
  }

  int v5 = *(uint64_t **)(a1 + 64);
  if (v5 != *(uint64_t **)(a1 + 72))
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v7 = *v5;
      char v8 = (os_log_s *)secLogObjForScope("rscan");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        size_t v11 = (const char *)(v7 + 40);
        *(_DWORD *)std::string buf = 136315138;
        std::string::size_type v20 = v11;
        _os_log_debug_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEBUG, "try %s", buf, 0xCu);
      }

      uint64_t v9 = (const char *)a2;
      if (Security::CodeSigning::ResourceBuilder::Rule::match((const regex_t *)v7, v9))
      {
        BOOL v10 = (os_log_s *)secLogObjForScope("rscan");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_debug_impl(&dword_1804F4000, v10, OS_LOG_TYPE_DEBUG, "match", buf, 2u);
        }

        if ((*(_BYTE *)(v7 + 36) & 0x10) != 0)
        {
          uint64_t v16 = (os_log_s *)secLogObjForScope("rscan");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_debug_impl(&dword_1804F4000, v16, OS_LOG_TYPE_DEBUG, "excluded", buf, 2u);
          }

          return v7;
        }

        if (!v6 || *(_DWORD *)(v7 + 32) > *(_DWORD *)(v6 + 32)) {
          uint64_t v6 = v7;
        }
      }
    }
  }

  uint64_t v6 = 0LL;
LABEL_20:
  int v12 = (os_log_s *)secLogObjForScope("rscan");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
    {
      uint64_t v15 = (const char *)(v6 + 40);
      int v13 = *(_DWORD *)(v6 + 32);
      int v14 = *(_DWORD *)(v6 + 36);
    }

    else
    {
      int v13 = 0;
      int v14 = 0;
      uint64_t v15 = "NOTHING";
    }

    *(_DWORD *)std::string buf = 136315650;
    std::string::size_type v20 = v15;
    __int16 v21 = 1024;
    int v22 = v13;
    __int16 v23 = 1024;
    int v24 = v14;
    _os_log_debug_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEBUG, "choosing %s (%d,0x%x)", buf, 0x18u);
  }

  return v6;
}

uint64_t Security::CodeSigning::ResourceBuilder::Rule::match(const regex_t *this, const char *a2)
{
  int v2 = regexec(this, a2, 0LL, 0LL, 0);
  if (!v2) {
    return 1LL;
  }
  if (v2 != 1) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13LL);
  }
  return 0LL;
}

uint64_t Security::CodeSigning::ResourceBuilder::includes(uint64_t a1, std::string *this)
{
  std::string::size_type v4 = std::string::find(this, 47, 0LL);
  if (v4 == -1LL) {
    goto LABEL_7;
  }
  std::string::basic_string(&v12, this, 0LL, v4, (std::allocator<char> *)&v13);
  uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)&v12);
  uint64_t v6 = Rule;
  if ((char)v12.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v12.__r_.__value_.__l.__data_);
    if (!v6) {
      goto LABEL_7;
    }
  }

  else if (!Rule)
  {
    goto LABEL_7;
  }

  unsigned int v7 = *(_DWORD *)(v6 + 36);
  if ((v7 & 0x10) != 0) {
    return (v7 >> 5) & 1;
  }
LABEL_7:
  else {
    std::string __p = *this;
  }
  uint64_t v8 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)&__p);
  uint64_t v9 = v8;
  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (v8) {
      goto LABEL_12;
    }
    return 0LL;
  }

  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v9) {
    return 0LL;
  }
LABEL_12:
  if ((*(_DWORD *)(v9 + 36) & 0x12) != 0) {
    return (*(_DWORD *)(v9 + 36) >> 5) & 1;
  }
  else {
    return 1LL;
  }
}

void sub_180645B00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN8Security11CodeSigning12hashFileDataINS_11DynamicHashEEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke_15259( uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 24LL))(*(void *)(a1 + 32));
}

void ___ZN8Security11CodeSigning15ResourceBuilder8hashFileEPKcNSt3__13setIjNS4_4lessIjEENS4_9allocatorIjEEEEb_block_invoke( uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 16LL))(a3);
  memset(v13, 170, sizeof(v13));
  std::vector<unsigned char>::vector(v13, v6);
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 32LL))(a3, v13[0]);
  unsigned int v7 = *(__CFDictionary **)(a1 + 32);
  Security::CodeSigning::ResourceBuilder::hashName((Security::CodeSigning::ResourceBuilder *)__p, a2);
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v12, (char *)__p);
  uint64_t v8 = v12;
  CFDataRef v9 = CFDataCreate(0LL, (const UInt8 *)v13[0], v6);
  CFDictionaryAddValue(v7, v8, v9);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v9);
  Security::CFRef<__CFString const*>::~CFRef(&v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13[0])
  {
    v13[1] = v13[0];
    operator delete(v13[0]);
  }

void sub_180645C28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16, void *a17, uint64_t a18)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a17)
  {
    a18 = (uint64_t)a17;
    operator delete(a17);
  }

  _Unwind_Resume(a1);
}

void *Security::CodeSigning::ResourceBuilder::hashName( Security::CodeSigning::ResourceBuilder *this, int a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a2 == 1) {
    return std::string::basic_string[abi:ne180100]<0>(this, "hash");
  }
  memset(__str, 170, 20);
  snprintf(__str, 0x14uLL, "hash%d", a2);
  return std::string::basic_string[abi:ne180100]<0>(this, __str);
}

void Security::CodeSigning::ResourceBuilder::escapeRE(std::string *a1, std::string::value_type *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0LL;
  a1->__r_.__value_.__l.__size_ = 0LL;
  a1->__r_.__value_.__l.__cap_ = 0LL;
  uint64_t v2 = a2[23];
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0LL) {
    uint64_t v2 = *((void *)a2 + 1);
  }
  if (v2)
  {
    if (v3 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(std::string::value_type **)a2;
    }
    do
    {
      std::string::value_type v7 = *v6;
      if (memchr("\\[]{}().+*?^$|", *v6, 0xFuLL)) {
        std::string::push_back(a1, 92);
      }
      std::string::push_back(a1, v7);
      ++v6;
      uint64_t v8 = a2[23];
      if ((v8 & 0x80u) == 0LL) {
        CFDataRef v9 = a2;
      }
      else {
        CFDataRef v9 = *(std::string::value_type **)a2;
      }
      if ((v8 & 0x80u) != 0LL) {
        uint64_t v8 = *((void *)a2 + 1);
      }
    }

    while (v6 != &v9[v8]);
  }

void sub_180645DF8(_Unwind_Exception *exception_object)
{
}

Security::CodeSigning::ResourceSeal *Security::CodeSigning::ResourceSeal::ResourceSeal( Security::CodeSigning::ResourceSeal *this, CFTypeRef cf)
{
  *((void *)this + 1) = 0LL;
  int v3 = (char *)this + 8;
  *((void *)this + 2) = 0LL;
  std::string::size_type v4 = (char *)this + 16;
  *(void *)this = 0LL;
  *((_DWORD *)this + 6) = 0;
  if (!cf) {
    goto LABEL_20;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFDataGetTypeID())
  {
    CFTypeID v15 = CFGetTypeID(cf);
    if (v15 == CFDictionaryGetTypeID())
    {
      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this, cf);
      int v14 = *(const __CFDictionary **)this;
      goto LABEL_8;
    }

void sub_180645F94(_Unwind_Exception *a1)
{
}

const UInt8 *Security::CodeSigning::ResourceSeal::hash(CFDictionaryRef *this, int a2)
{
  int v3 = *this;
  else {
    std::string __p = v10;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&__p);
  Value = CFDictionaryGetValue(v3, key);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Value) {
      goto LABEL_9;
    }
  }

  else if (Value)
  {
    goto LABEL_9;
  }

  Value = CFDictionaryGetValue(*this, @"hash");
  if (!Value) {
    goto LABEL_13;
  }
LABEL_9:
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFDataGetTypeID()) {
LABEL_13:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11LL);
  BytePtr = CFDataGetBytePtr((CFDataRef)Value);
  return BytePtr;
}

void sub_1806460B0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SecCodeSignerRemoteGetTypeID()
{
  return *(void *)(Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()() + 512);
}

void sub_180646110(void *a1)
{
}

uint64_t SecCodeSignerRemoteCreate(const __CFDictionary *a1, const void *a2, int a3, void *a4)
{
  if ((a3 & 0xFFFFFC0D) != 0) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02LL);
  }
  uint64_t v16 = (Security::SecCFObject *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
  std::string v10 = (Security::SecCFObject *)Security::SecCFObject::allocate( (Security::SecCFObject *)0x150,  *(void *)(v8 + 512),  v9);
  *((void *)v10 + 1) = 1LL;
  *((_DWORD *)v10 + 4) = a3;
  *((void *)v10 + 21) = 0LL;
  *((void *)v10 + 20) = 0LL;
  *(_OWORD *)((char *)v10 + Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)this + 24) = 0u;
  *(_OWORD *)((char *)v10 + 40) = 0u;
  *(_OWORD *)((char *)v10 + 56) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((void *)v10 + 19) = (char *)v10 + 160;
  *((void *)v10 + 36) = 0LL;
  *((_DWORD *)v10 + 74) = 0;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 14) = 0u;
  *((void *)v10 + 30) = 0LL;
  *((void *)v10 + 32) = 0LL;
  *((void *)v10 + 33) = 0LL;
  *((void *)v10 + 34) = 0LL;
  *((void *)v10 + 3_Block_object_dispose(va, 8) = 0LL;
  *((void *)v10 + 39) = 0LL;
  *(void *)std::string v10 = off_1896787B0;
  *((void *)v10 + 41) = 0LL;
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)v10 + 41, a2);
  uint64_t v11 = (unsigned __int8 *)v10 - 8;
  do
    unsigned __int8 v12 = __ldaxr(v11);
  while (__stlxr(1u, v11));
  if ((v12 & 1) != 0)
  {
    uint64_t v13 = (const void *)(*(uint64_t (**)(Security::SecCFObject *))(*(void *)v10 + 16LL))(v10);
    CFRetain(v13);
  }

  uint64_t v16 = v10;
  Security::CodeSigning::SecCodeSigner::parameters(v10, a1);
  int v14 = Security::SecCFObject::handle(v10, 1);
  if (!a4) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA03LL);
  }
  *a4 = v14;
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v16);
  return 0LL;
}

void sub_180646284(void *a1, int a2)
{
  switch(a2)
  {
    case 7:
      uint64_t v8 = (CFDictionaryRef *)__cxa_begin_catch(a1);
      Security::CodeSigning::CSError::cfError(v8, v2);
      goto LABEL_32;
    case 6:
      uint64_t v9 = __cxa_begin_catch(a1);
      if (v9[36] == 8) {
        int v10 = -67049;
      }
      else {
        int v10 = (*(uint64_t (**)(_DWORD *))(*(void *)v9 + 24LL))(v9);
      }
      if (v2)
      {
LABEL_30:
        CFErrorRef v13 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], v10, 0LL);
        goto LABEL_31;
      }

void sub_1806464E0(_Unwind_Exception *a1)
{
}

uint64_t SecCodeSignerRemoteAddSignature( uint64_t a1, Security::CodeSigning::SecStaticCode *a2, int a3, uint64_t a4)
{
  void __dst[55] = *MEMORY[0x1895F89C0];
  if (a3) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02LL);
  }
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1
  {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01LL);
  }

  uint64_t v8 = v6;
  uint64_t v9 = (unsigned __int8 *)v6 - 8;
  do
    unsigned __int8 v10 = __ldaxr(v9);
  while (__stlxr(1u, v9));
  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecCodeSigner *))(*(void *)v6 + 16LL))(v6);
    CFRetain(v11);
  }

  unint64_t v20 = (unint64_t)v8;
  int v12 = (Security::CodeSigning::SecStaticCode *)Security::CodeSigning::SecStaticCode::required(a2, v7);
  Security::CodeSigning::SecStaticCode::codeDirectory(v12, 0);
  CFErrorRef v13 = (os_log_s *)secLogObjForScope("remotesigner");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__dst[0]) = 134218496;
    *(void *)((char *)__dst + 4) = v8;
    WORD2(__dst[1]) = 2048;
    *(void *)((char *)&__dst[1] + 6) = v12;
    HIWORD(__dst[2]) = 2048;
    void __dst[3] = a4;
    _os_log_debug_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEBUG,  "%p will start remote signature from %p with block %p",  (uint8_t *)__dst,  0x20u);
  }

  *((_DWORD *)v12 + 52) = 0;
  memcpy(__dst, &unk_180659EA0, 0x1B8uLL);
  Security::CodeSigning::SecCodeSigner::Signer::Signer((Security::CodeSigning::SecCodeSigner::Signer *)__dst, v8, v12);
  if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner *))(*(void *)v8 + 80LL))(v8) & 1) == 0)
  {
    __int16 v19 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1804F4000, v19, OS_LOG_TYPE_DEFAULT, "Invalid signing operation, bailing.", buf, 2u);
    }

    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01LL);
  }

  int v14 = (os_log_s *)secLogObjForScope("remotesigner");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *((void *)v8 + 41);
    *(_DWORD *)std::string buf = 134218754;
    int v22 = v8;
    __int16 v23 = 2048;
    int v24 = v12;
    __int16 v25 = 1024;
    int v26 = 0;
    __int16 v27 = 2112;
    uint64_t v28 = v18;
    _os_log_debug_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEBUG,  "%p will sign %p (flags 0x%x) with certs: %@",  buf,  0x26u);
  }

  unsigned int v15 = (Security::CodeSigning::SecCodeSigner *)*((void *)v8 + 41);
  int v16 = (os_log_s *)secLogObjForScope("signer");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 138412290;
    int v22 = v15;
    _os_log_debug_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEBUG,  "configuring remote signing with cert chain: %@",  buf,  0xCu);
  }

  BYTE2(__dst[40]) = 1;
  __dst[41] = a4;
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)&__dst[42], v15);
  Security::CodeSigning::SecCodeSigner::Signer::sign((Security::CodeSigning::SecCodeSigner::Signer *)__dst, 0);
  Security::CodeSigning::SecStaticCode::resetValidity(v12);
  Security::CodeSigning::SecCodeSigner::Signer::~Signer((Security::CodeSigning::SecCodeSigner::Signer *)__dst);
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v20);
  return 0LL;
}

void sub_180646850( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  switch(a2)
  {
    case 7:
      __int16 v19 = (CFDictionaryRef *)__cxa_begin_catch(exception_object);
      Security::CodeSigning::CSError::cfError(v19, v17);
      __cxa_end_catch();
      goto LABEL_36;
    case 6:
      unint64_t v20 = __cxa_begin_catch(exception_object);
      if (v20[36] == 8) {
        int v21 = -67049;
      }
      else {
        int v21 = (*(uint64_t (**)(_DWORD *))(*(void *)v20 + 24LL))(v20);
      }
      if (v17) {
        void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], v21, 0LL);
      }
LABEL_23:
      __cxa_end_catch();
LABEL_36:
      JUMPOUT(0x1806466C0LL);
    case 5:
      int v22 = __cxa_begin_catch(exception_object);
      int v23 = (*(uint64_t (**)(void *))(*(void *)v22 + 24LL))(v22);
      if (v17) {
        void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], v23, 0LL);
      }
      goto LABEL_23;
  }

  if (a2 != 4)
  {
    if (a2 == 3)
    {
      uint64_t v28 = __cxa_begin_catch(exception_object);
      int v29 = (*(uint64_t (**)(void *))(*(void *)v28 + 24LL))(v28);
      if (v17) {
        void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], v29, 0LL);
      }
    }

    else
    {
      __cxa_begin_catch(exception_object);
      if (a2 == 2)
      {
        if (v17) {
          void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], -108LL, 0LL);
        }
      }

      else
      {
        Security::Syslog::notice((Security::Syslog *)"unknown exception in CSAPI", v30);
        if (v17) {
          void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], -67048LL, 0LL);
        }
      }
    }

    goto LABEL_23;
  }

  int v24 = __cxa_begin_catch(exception_object);
  unsigned int v25 = v24[36];
  if (v25 > 0x1A) {
    goto LABEL_31;
  }
  int v26 = -67033;
  int v27 = 1 << v25;
  if ((v27 & 0x800108) != 0) {
    goto LABEL_32;
  }
  if ((v27 & 0x4014000) != 0) {
    int v26 = -67032;
  }
  else {
LABEL_31:
  }
    int v26 = (*(uint64_t (**)(_DWORD *))(*(void *)v24 + 24LL))(v24);
LABEL_32:
  if (v17) {
    void *v17 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F50], v26, 0LL);
  }
  goto LABEL_23;
}

void Security::CodeSigning::LimitedAsync::~LimitedAsync(Security::CodeSigning::LimitedAsync *this)
{
  *(void *)this = off_189678ED8;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
}

{
  uint64_t v2;
  *(void *)this = off_189678ED8;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(this);
}

Security::CodeSigning::LimitedAsync *Security::CodeSigning::LimitedAsync::LimitedAsync( Security::CodeSigning::LimitedAsync *this, unsigned __int8 a2)
{
  *(void *)this = off_189678ED8;
  uint64_t v4 = sysconf(58);
  if ((a2 & (v4 > 0)) != 0) {
    uint64_t v5 = v4 - 1;
  }
  else {
    uint64_t v5 = 0LL;
  }
  CFTypeID v6 = operator new(0x10uLL);
  void *v6 = off_189676D78;
  v6[1] = dispatch_semaphore_create(v5);
  *((void *)this + 1) = v6;
  return this;
}

void Security::CodeSigning::LimitedAsync::perform(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x4002000000LL;
  uint64_t v11 = __Block_byref_object_copy__15319;
  int v12 = __Block_byref_object_dispose__15320;
  uint64_t v14 = a1;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  CFErrorRef v13 = off_189676D98;
  LOBYTE(v15) = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 8), 0LL) == 0;
  if (*((_BYTE *)v9 + 56))
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = ___ZN8Security11CodeSigning12LimitedAsync7performERNS_8Dispatch5GroupEU13block_pointerFvvE_block_invoke;
    v7[3] = &unk_189678EF0;
    v7[4] = a3;
    v7[5] = &v8;
    if (!*(_BYTE *)(a2 + 72))
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      block[0] = v5;
      block[1] = 0x40000000LL;
      block[2] = ___ZN8Security8Dispatch23ExceptionAwareEnqueuing21enqueueWithDispatcherEU13block_pointerFvU13block_pointerFvvEES3__block_invoke;
      block[3] = &unk_189676CC8;
      block[4] = v7;
      void block[5] = a2 + 8;
      dispatch_group_async(*(dispatch_group_t *)(a2 + 88), global_queue, block);
    }
  }

  else
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
  }

  _Block_object_dispose(&v8, 8);
  CFErrorRef v13 = off_189676D98;
  if ((_BYTE)v15) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v14 + 8));
  }
}

void sub_180646D88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
  if (a22) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a21 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15319(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = off_189676D98;
  *(void *)(result + 4_Block_object_dispose(va, 8) = v2;
  *(_BYTE *)(result + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a2 + 56) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__15320(uint64_t result)
{
  *(void *)(result + 40) = off_189676D98;
  if (*(_BYTE *)(result + 56)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 48) + 8LL));
  }
  return result;
}

uint64_t ___ZN8Security11CodeSigning12LimitedAsync7performERNS_8Dispatch5GroupEU13block_pointerFvvE_block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v2 = *(void *)(v1 + 48);
  int v3 = *(unsigned __int8 *)(v1 + 56);
  *(_BYTE *)(v1 + 56) = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (v3) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 8));
  }
  return result;
}

void sub_180646E48(_Unwind_Exception *exception_object)
{
  if (v1) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 8));
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::isOnRootFilesystem(Security::CodeSigning *this, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  memset(&__b, 170, sizeof(__b));
  int v3 = (os_log_s *)secLogObjForScope("SecError");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v4)
  {
    int v6 = *__error();
    v7[0] = 67109378;
    v7[1] = v6;
    __int16 v8 = 2080;
    uint64_t v9 = this;
    _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "Unable to check if path is on rootfs: %d, %s",  (uint8_t *)v7,  0x12u);
    return 0LL;
  }

  return result;
}

BOOL Security::CodeSigning::pathFileSystemUsesXattrFiles(Security::CodeSigning *this, const char *a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  int v23 = -1431655766;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v21 = v3;
  __int128 v22 = v3;
  memset(&__b, 170, sizeof(__b));
  if (!this)
  {
    uint64_t v11 = (os_log_s *)secLogObjForScope("SecError");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (!v12) {
      return result;
    }
    *(_WORD *)std::string buf = 0;
    uint64_t v10 = "path is NULL";
    CFErrorRef v13 = v11;
    uint32_t v14 = 2;
    goto LABEL_11;
  }

  if (statfs((const char *)this, &__b))
  {
    BOOL v4 = (os_log_s *)secLogObjForScope("SecError");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (!v5) {
      return result;
    }
    int v7 = *__error();
    __int16 v8 = __error();
    uint64_t v9 = strerror(*v8);
    *(_DWORD *)std::string buf = 136315650;
    uint64_t f_mntonname = (uint64_t)this;
    __int16 v27 = 1024;
    int v28 = v7;
    __int16 v29 = 2080;
    uint64_t v30 = v9;
    uint64_t v10 = "Unable to convert %s to its filesystem mount [statfs failed]: %d [%s]";
LABEL_10:
    CFErrorRef v13 = v4;
    uint32_t v14 = 28;
LABEL_11:
    _os_log_impl(&dword_1804F4000, v13, OS_LOG_TYPE_DEFAULT, v10, buf, v14);
    return 0LL;
  }

  v24[2] = 0LL;
  v24[0] = 5LL;
  v24[1] = 2147614720LL;
  if (getattrlist(__b.f_mntonname, v24, &v21, 0x24uLL, 0))
  {
    BOOL v4 = (os_log_s *)secLogObjForScope("SecError");
    BOOL v15 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (!v15) {
      return result;
    }
    int v16 = *__error();
    int v17 = __error();
    uint64_t v18 = strerror(*v17);
    *(_DWORD *)std::string buf = 136315650;
    uint64_t f_mntonname = (uint64_t)__b.f_mntonname;
    __int16 v27 = 1024;
    int v28 = v16;
    __int16 v29 = 2080;
    uint64_t v30 = v18;
    uint64_t v10 = "Unable to get volume capabilities from %s: %d [%s]";
    goto LABEL_10;
  }

  if ((_DWORD)v21 == 36)
  {
    return (BYTE9(v21) & 0x40) == 0 || (BYTE9(v22) & 0x40) == 0;
  }

  else
  {
    __int16 v19 = (os_log_s *)secLogObjForScope("SecError");
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (v20)
    {
      *(_DWORD *)std::string buf = 134218240;
      uint64_t f_mntonname = 36LL;
      __int16 v27 = 1024;
      int v28 = v21;
      uint64_t v10 = "getattrlist return length incorrect, expected %lu, got %u";
      CFErrorRef v13 = v19;
      uint32_t v14 = 18;
      goto LABEL_11;
    }
  }

  return result;
}

uint64_t Security::CodeSigning::pathIsValidXattrFile(const std::string *a1, const char *a2)
{
  __int128 v3 = a1;
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if ((char)a1->__r_.__value_.__s.__size_ < 0)
  {
    BOOL v5 = (const char *)a1->__r_.__value_.__r.__words[0];
    int v4 = *(unsigned __int8 *)a1->__r_.__value_.__l.__data_;
  }

  else
  {
    int v4 = a1->__r_.__value_.__s.__data_[0];
    BOOL v5 = (const char *)a1;
  }

  if (v4 != 47)
  {
    uint64_t v11 = (os_log_s *)secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s isn't a full path, but a relative path";
LABEL_28:
    _os_log_debug_impl(&dword_1804F4000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v64, 0xCu);
    return 0LL;
  }

  v6.tv_seCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nseCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v64.st_blkstd::string::size_type size = v6;
  *(timespec *)v64.st_qspare = v6;
  v64.st_birthtimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_std::string::size_type size = v6;
  v64.st_mtimespeCC_SHA1_CTX c = v6;
  v64.st_ctimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_uid = v6;
  v64.st_atimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_dev = v6;
  if (stat(v5, &v64))
  {
    int v7 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *__error();
      uint64_t v9 = __error();
      uint64_t v10 = strerror(*v9);
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v10;
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, "Unable to stat %s: %d [%s]", buf, 0x1Cu);
    }

    goto LABEL_13;
  }

  if (((__int16)v64.st_mode & 0x80000000) == 0)
  {
LABEL_13:
    uint64_t v11 = (os_log_s *)secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s isn't a regular file";
    goto LABEL_28;
  }

  BOOL v15 = (const char *)v3;
  if ((char)v3->__r_.__value_.__s.__size_ < 0)
  {
    BOOL v15 = (const char *)v3->__r_.__value_.__r.__words[0];
    if (!v3->__r_.__value_.__r.__words[0])
    {
      size_t v33 = (os_log_s *)secLogObjForScope("SecError");
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      LOWORD(v64.st_dev) = 0;
      int v26 = "path is NULL";
      __int16 v27 = v33;
      uint32_t v28 = 2;
      goto LABEL_36;
    }
  }

  size_t v16 = strlen(v15);
  int v17 = (char *)malloc(v16 + 1);
  if (!v17)
  {
    __int128 v22 = (os_log_s *)secLogObjForScope("SecError");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    int v23 = *__error();
    int v24 = __error();
    unsigned int v25 = strerror(*v24);
    v64.st_dev = 67109378;
    *(_DWORD *)&v64.st_mode = v23;
    LOWORD(v64.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v64.st_ino + 2) = (__darwin_ino64_t)v25;
    int v26 = "Unable to allocate space for storing basename: %d [%s]";
    __int16 v27 = v22;
    uint32_t v28 = 18;
LABEL_36:
    _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v64, v28);
    goto LABEL_37;
  }

  uint64_t v18 = (unsigned __int8 *)v17;
  if (!basename_r(v15, v17))
  {
    __int16 v29 = (os_log_s *)secLogObjForScope("SecError");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = *__error();
      std::string::size_type v31 = __error();
      uint64_t v32 = strerror(*v31);
      v64.st_dev = 136315650;
      *(void *)&v64.st_mode = v15;
      WORD2(v64.st_ino) = 1024;
      *(_DWORD *)((char *)&v64.st_ino + 6) = v30;
      HIWORD(v64.st_uid) = 2080;
      *(void *)&v64.st_gid = v32;
      _os_log_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEFAULT,  "Could not get basename of %s: %d [%s]",  (uint8_t *)&v64,  0x1Cu);
    }

    goto LABEL_33;
  }

  if (strlen((const char *)v18) < 3 || *v18 != 46)
  {
LABEL_33:
    free(v18);
    goto LABEL_37;
  }

  int v19 = v18[1];
  free(v18);
  if (v19 != 95)
  {
LABEL_37:
    uint64_t v11 = (os_log_s *)secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s doesn't match Xattr file path spec";
    goto LABEL_28;
  }

  if ((char)v3->__r_.__value_.__s.__size_ < 0)
  {
    __int128 v21 = (const std::string *)v3->__r_.__value_.__r.__words[0];
    std::string::size_type size = v3->__r_.__value_.__l.__size_;
  }

  else
  {
    std::string::size_type size = v3->__r_.__value_.__s.__size_;
    __int128 v21 = v3;
  }

  while (size)
  {
    int v34 = v21->__r_.__value_.__s.__data_[--size];
    if (v34 == 47)
    {
      std::string::size_type v35 = size;
      goto LABEL_46;
    }
  }

  std::string::size_type v35 = -1LL;
LABEL_46:
  std::string::basic_string(&v61, v3, 0LL, v35, (std::allocator<char> *)&v60);
  uint64_t v36 = std::string::append(&v61, "/", 1uLL);
  __int128 v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  *(void *)&uint8_t buf[16] = v36->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string buf = v37;
  v36->__r_.__value_.__l.__size_ = 0LL;
  v36->__r_.__value_.__l.__cap_ = 0LL;
  v36->__r_.__value_.__r.__words[0] = 0LL;
  std::string::basic_string(&v60, v3, v35 + 3, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v62);
  if ((v60.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v38 = &v60;
  }
  else {
    uint64_t v38 = (std::string *)v60.__r_.__value_.__r.__words[0];
  }
  if ((v60.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v39 = v60.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v39 = v60.__r_.__value_.__l.__size_;
  }
  size_t v40 = std::string::append((std::string *)buf, (const std::string::value_type *)v38, v39);
  __int128 v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(void *)&v64.st_uid = v40->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v64.st_dev = v41;
  v40->__r_.__value_.__l.__size_ = 0LL;
  v40->__r_.__value_.__l.__cap_ = 0LL;
  v40->__r_.__value_.__r.__words[0] = 0LL;
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if ((v64.st_gid & 0x80000000) == 0) {
    int v42 = &v64;
  }
  else {
    int v42 = *(stat **)&v64.st_dev;
  }
  if (!v42)
  {
    uint64_t v48 = (os_log_s *)secLogObjForScope("SecError");
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
LABEL_69:
      size_t v49 = (os_log_s *)secLogObjForScope(a2);
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
LABEL_70:
        uint64_t v13 = 0LL;
        goto LABEL_71;
      }

      unsigned int v59 = &v64;
      if ((v64.st_gid & 0x80000000) != 0) {
        unsigned int v59 = *(stat **)&v64.st_dev;
      }
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = v59;
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = v3;
      std::string::size_type v58 = "%s does not exist, forcing resource validation on %s";
LABEL_96:
      _os_log_debug_impl(&dword_1804F4000, v49, OS_LOG_TYPE_DEBUG, v58, buf, 0x16u);
      goto LABEL_70;
    }

    *(_WORD *)std::string buf = 0;
    uint64_t v45 = "path is NULL";
    uint64_t v46 = v48;
    uint32_t v47 = 2;
LABEL_68:
    _os_log_impl(&dword_1804F4000, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
    goto LABEL_69;
  }

  if (access((const char *)v42, 0))
  {
    if (*__error() == 2) {
      goto LABEL_69;
    }
    uint64_t v43 = (os_log_s *)secLogObjForScope("SecError");
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    int v44 = *__error();
    *(_DWORD *)std::string buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v44;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v42;
    uint64_t v45 = "Unable to check if path exists: %d, %s";
    uint64_t v46 = v43;
    uint32_t v47 = 18;
    goto LABEL_68;
  }

  if ((v64.st_gid & 0x80000000) == 0) {
    std::string::size_type v50 = &v64;
  }
  else {
    std::string::size_type v50 = *(stat **)&v64.st_dev;
  }
  if (!v50)
  {
    unsigned int v52 = (os_log_s *)secLogObjForScope("SecError");
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_WORD *)std::string buf = 0;
    std::string::size_type v53 = "path is NULL";
    std::string::size_type v54 = v52;
    uint32_t v55 = 2;
LABEL_84:
    _os_log_impl(&dword_1804F4000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
    goto LABEL_85;
  }

  ssize_t v51 = listxattr((const char *)v50, 0LL, 0LL, 0);
  if (v51 == -1)
  {
    std::string::size_type v56 = (os_log_s *)secLogObjForScope("SecError");
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v50;
    std::string::size_type v53 = "Unable to acquire the xattr list from %s";
    std::string::size_type v54 = v56;
    uint32_t v55 = 12;
    goto LABEL_84;
  }

  if (v51 <= 0)
  {
LABEL_85:
    size_t v49 = (os_log_s *)secLogObjForScope(a2);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_70;
    }
    std::string::size_type v57 = &v64;
    if ((v64.st_gid & 0x80000000) != 0) {
      std::string::size_type v57 = *(stat **)&v64.st_dev;
    }
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = v57;
    *(_WORD *)&_BYTE buf[12] = 2080;
    *(void *)&buf[14] = v3;
    std::string::size_type v58 = "%s does not contain xattrs, forcing resource validation on %s";
    goto LABEL_96;
  }

  uint64_t v13 = 1LL;
LABEL_71:
  if (SHIBYTE(v64.st_gid) < 0) {
    operator delete(*(void **)&v64.st_dev);
  }
  return v13;
}

void sub_180647998( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *Security::CodeSigning::pathRemaining(std::string *a1, const std::string *a2, std::string *a3)
{
  __int128 v3 = a3;
  int size = (char)a2->__r_.__value_.__s.__size_;
  if (size < 0) {
    std::string::size_type v7 = a2->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v7 = a2->__r_.__value_.__s.__size_;
  }
  std::string::size_type v8 = a3->__r_.__value_.__s.__size_;
  if ((char)a3->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = a3->__r_.__value_.__l.__size_;
    if (v7 < v9) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
    }
  }

  else
  {
    std::string::size_type v9 = a3->__r_.__value_.__s.__size_;
    if (v7 < v8) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
    }
  }

  if (!v9) {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
  }
  if (size < 0)
  {
    if (!a2->__r_.__value_.__l.__size_) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
    }
  }

  else if (!a2->__r_.__value_.__s.__size_)
  {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
  }

  if ((v8 & 0x80) != 0)
  {
    std::string::__init_copy_ctor_external(&v17, a3->__r_.__value_.__l.__data_, a3->__r_.__value_.__l.__size_);
    if ((a2->__r_.__value_.__s.__size_ & 0x80) == 0) {
      goto LABEL_15;
    }
LABEL_17:
    std::string::__init_copy_ctor_external(&__p, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    goto LABEL_18;
  }

  std::string v17 = *a3;
  if ((size & 0x80) != 0) {
    goto LABEL_17;
  }
LABEL_15:
  std::string __p = *a2;
LABEL_18:
  char isPathPrefix = Security::CodeSigning::isPathPrefix((char *)&v17, &__p);
  if ((char)v17.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v17.__r_.__value_.__l.__data_);
    if ((isPathPrefix & 1) == 0) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
    }
  }

  else if ((isPathPrefix & 1) == 0)
  {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
  }

  if ((char)v3->__r_.__value_.__s.__size_ < 0)
  {
    BOOL v12 = v3;
    __int128 v3 = (std::string *)v3->__r_.__value_.__r.__words[0];
    std::string::size_type v11 = v12->__r_.__value_.__l.__size_;
  }

  else
  {
    std::string::size_type v11 = v3->__r_.__value_.__s.__size_;
  }

  if (v3->__r_.__value_.__s.__data_[v11 - 1] == 47) {
    std::string::size_type v13 = v11;
  }
  else {
    std::string::size_type v13 = v11 + 1;
  }
  else {
    std::string::size_type v14 = a2->__r_.__value_.__s.__size_;
  }
  if (v13 < v14) {
    return std::string::basic_string(a1, a2, v13, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v18);
  }
  return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18065A197);
}

void sub_180647B7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::isPathPrefix(char *a1, void *__s)
{
  uint64_t v2 = __s;
  unint64_t v4 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    BOOL v5 = (void *)*__s;
    int64_t v6 = __s[1];
  }

  else
  {
    BOOL v5 = __s;
    int64_t v6 = *((unsigned __int8 *)__s + 23);
  }

  unint64_t v7 = a1[23];
  uint64_t v9 = *(void *)a1;
  unint64_t v8 = *((void *)a1 + 1);
  if ((v7 & 0x80u) == 0LL) {
    uint64_t v10 = a1;
  }
  else {
    uint64_t v10 = *(char **)a1;
  }
  if ((v7 & 0x80u) == 0LL) {
    int64_t v11 = a1[23];
  }
  else {
    int64_t v11 = *((void *)a1 + 1);
  }
  if (!v11) {
    goto LABEL_20;
  }
  if (v6 < v11) {
    return 0LL;
  }
  BOOL v20 = v5;
  unint64_t v21 = *((unsigned __int8 *)__s + 23);
  BOOL v12 = (char *)v5 + v6;
  int v13 = *v10;
  std::string::size_type v14 = v5;
  while (1)
  {
    int64_t v15 = v6 - v11;
    if (v15 == -1) {
      return 0LL;
    }
    uint64_t result = (uint64_t)memchr(v14, v13, v15 + 1);
    if (!result) {
      return result;
    }
    uint64_t v17 = result;
    uint64_t result = memcmp((const void *)result, v10, v11);
    if (!(_DWORD)result) {
      break;
    }
    std::string::size_type v14 = (const void *)(v17 + 1);
    int64_t v6 = (int64_t)&v12[-v17 - 1];
    if (v6 < v11) {
      return 0LL;
    }
  }

  if ((char *)v17 != v12)
  {
    unint64_t v4 = v21;
    if ((void *)v17 == v20)
    {
LABEL_20:
      if ((v4 & 0x80) != 0) {
        unint64_t v18 = v2[1];
      }
      else {
        unint64_t v18 = v4;
      }
      if (v11 == v18) {
        return 0LL;
      }
      if ((v7 & 0x80) != 0)
      {
        int v19 = *(unsigned __int8 *)(v9 + v8 - 1);
        unint64_t v7 = v8;
      }

      else
      {
        int v19 = a1[v7 - 1];
      }

      if (v19 == 47) {
        return 1LL;
      }
      if ((v4 & 0x80) != 0)
      {
        if (v2[1] <= v7) {
          goto LABEL_37;
        }
        uint64_t v2 = (void *)*v2;
      }

      else if (v7 >= v4)
      {
LABEL_37:
        std::string::__throw_out_of_range[abi:ne180100]();
      }

      return *((unsigned __int8 *)v2 + v7) == 47;
    }
  }

  return result;
}

CFDataRef Security::CodeSigning::SingleDiskRep::identification(Security::CodeSigning::SingleDiskRep *this)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.data[9] = v2;
  *(_OWORD *)&v7.data[13] = v2;
  *(_OWORD *)&v7.data[1] = v2;
  *(_OWORD *)&v7.data[5] = v2;
  *(_OWORD *)&v7.h0 = v2;
  *(_OWORD *)&v7.h4 = v2;
  CC_SHA1_Init(&v7);
  __int128 v3 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144LL))(this);
  Security::UnixPlusPlus::FileDesc::seek((Security::UnixPlusPlus::FileDesc *)*v3, 0LL);
  uint64_t v4 = (*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144LL))(this);
  char v5 = *(_BYTE *)(v4 + 4);
  int v8 = *(_DWORD *)v4;
  char v9 = v5;
  *(void *)md = MEMORY[0x1895F87A8];
  *(void *)&md[8] = 0x40000000LL;
  *(void *)&md[16] = ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke;
  int64_t v11 = &__block_descriptor_tmp_15390;
  BOOL v12 = &v7;
  Security::CodeSigning::scanFileData(&v8, 0LL, (uint64_t)md);
  memset(md, 170, 20);
  CC_SHA1_Final(md, &v7);
  return CFDataCreate(0LL, md, 20LL);
}

void Security::CodeSigning::SingleDiskRep::mainExecutablePath( Security::CodeSigning::SingleDiskRep *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 39) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 2), *((void *)this + 3));
  }

  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 1);
    a2->__r_.__value_.__l.__cap_ = *((void *)this + 4);
  }

CFURLRef Security::CodeSigning::SingleDiskRep::copyCanonicalPath( Security::CodeSigning::SingleDiskRep *this, uint64_t a2, uint64_t a3, const __CFURL *a4)
{
  int64_t v6 = (char *)*((void *)this + 2);
  uint64_t v4 = (char *)this + 16;
  char v5 = v6;
  if (v4[23] < 0) {
    uint64_t v4 = v5;
  }
  return Security::makeCFURL((Security *)v4, 0LL, 0LL, a4);
}

off_t Security::CodeSigning::SingleDiskRep::signingLimit(Security::CodeSigning::SingleDiskRep *this)
{
  int v1 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144LL))(this);
  v2.tv_seCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nseCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v4.st_blkint size = v2;
  *(timespec *)v4.st_qspare = v2;
  v4.st_birthtimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_int size = v2;
  v4.st_mtimespeCC_SHA1_CTX c = v2;
  v4.st_ctimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_uid = v2;
  v4.st_atimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_dev = v2;
  Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)*v1, &v4);
  return v4.st_size;
}

uint64_t Security::CodeSigning::SingleDiskRep::execSegLimit()
{
  return 0LL;
}

Security::UnixPlusPlus::FileDesc *Security::CodeSigning::SingleDiskRep::fd( Security::CodeSigning::SingleDiskRep *this)
{
  int v1 = (Security::CodeSigning::SingleDiskRep *)((char *)this + 40);
  if (*((_DWORD *)this + 10) == -1)
  {
    stat v4 = (const char *)*((void *)this + 2);
    timespec v2 = (char *)this + 16;
    __int128 v3 = v4;
    if (v2[23] >= 0) {
      char v5 = v2;
    }
    else {
      char v5 = v3;
    }
    Security::UnixPlusPlus::FileDesc::open(v1, v5, 0, 438);
  }

  return v1;
}

void Security::CodeSigning::SingleDiskRep::flush(Security::CodeSigning::SingleDiskRep *this)
{
}

void Security::CodeSigning::SingleDiskRep::recommendedIdentifier(uint64_t a1@<X0>, std::string *a2@<X8>)
{
}

void Security::CodeSigning::SingleDiskRep::strictValidate(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 & 0x1000000) != 0)
  {
    int v8 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)*v8,  "com.apple.ResourceFork"))
    {
      char v9 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v9, "com.apple.ResourceFork");
    }

    uint64_t v10 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)*v10,  "com.apple.FinderInfo"))
    {
      int64_t v11 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v11, "com.apple.FinderInfo");
    }
  }

  if ((a4 & 0x200) != 0)
  {
    uint64_t v14 = *(void *)(a3 + 8);
    uint64_t v13 = a3 + 8;
    uint64_t v12 = v14;
    if (!v14) {
      goto LABEL_17;
    }
    uint64_t v15 = v13;
    do
    {
      int v16 = *(_DWORD *)(v12 + 28);
      BOOL v17 = v16 < -66999;
      if (v16 >= -66999) {
        unint64_t v18 = (uint64_t *)v12;
      }
      else {
        unint64_t v18 = (uint64_t *)(v12 + 8);
      }
      if (!v17) {
        uint64_t v15 = v12;
      }
      uint64_t v12 = *v18;
    }

    while (*v18);
    if (v15 == v13 || *(int *)(v15 + 28) > -66999)
    {
LABEL_17:
      int v19 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1);
      BOOL v20 = "com.apple.ResourceFork";
      if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)*v19,  "com.apple.ResourceFork")
        || (unint64_t v21 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144LL))(a1),
            BOOL v20 = "com.apple.FinderInfo",
            Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)*v21,  "com.apple.FinderInfo")))
      {
        int v24 = a1 + 16;
        if (a1[39] < 0) {
          int v24 = (void *)*v24;
        }
        unsigned int v25 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Disallowed xattr %s found on %s",  v20,  v24);
        Security::CodeSigning::CSError::throwMe( (Security::CodeSigning::CSError *)0xFFFEFA49LL,  (uint64_t)@"SecCSResourceHasSidebandData",  v25,  v26);
      }
    }
  }

  if (a2)
  {
    if (bswap32(*(_DWORD *)(a2 + 8)) >> 8 >= 0x203 && (unint64_t v22 = *(void *)(a2 + 56)) != 0) {
      unint64_t v23 = bswap64(v22);
    }
    else {
      unint64_t v23 = bswap32(*(_DWORD *)(a2 + 32));
    }
  }

BOOL Security::CodeSigning::SingleDiskRep::appleInternalForcePlatform( Security::CodeSigning::SingleDiskRep *this)
{
  return Security::UnixPlusPlus::FileDesc::hasExtendedAttribute( (Security::UnixPlusPlus::FileDesc *)*((unsigned int *)this + 10),  "com.apple.root.installed");
}

uint64_t ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke( uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 32), a2, a3);
}

uint64_t Security::CodeSigning::SingleDiskRep::SingleDiskRep(uint64_t a1, __int128 *a2)
{
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 0;
  *(void *)a1 = off_189678F30;
  __int128 v3 = (std::string *)(a1 + 16);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    v3->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }

  *(_DWORD *)(a1 + 40) = -1;
  *(_BYTE *)(a1 + 44) = 0;
  return a1;
}

void sub_1806481A8(_Unwind_Exception *a1)
{
}

Security::UnixPlusPlus::FileDesc *Security::CodeSigning::SingleDiskRep::Writer::fd( Security::CodeSigning::SingleDiskRep::Writer *this)
{
  int v1 = (Security::CodeSigning::SingleDiskRep::Writer *)((char *)this + 96);
  if (*((_DWORD *)this + 24) == -1)
  {
    uint64_t v2 = *((void *)this + 3);
    else {
      std::string __p = *(std::string *)(v2 + 16);
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    Security::UnixPlusPlus::FileDesc::open(v1, (const char *)p_p, 2, 438);
  }

  return v1;
}

void sub_180648250( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::Requirement::Reader::getData( Security::CodeSigning::Requirement::Reader *this, const void **a2, unint64_t *a3)
{
  uint64_t result = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  *a3 = result;
  uint64_t v7 = *((unsigned int *)this + 2);
  *a2 = (const void *)(*(void *)this + v7);
  *((_DWORD *)this + 2) = ((result - 1) & 0xFFFFFFFC) + v7 + 4;
  return result;
}

void *Security::CodeSigning::Requirement::Reader::getString( Security::CodeSigning::Requirement::Reader *this, Security::CodeSigning::Requirement::Reader *a2)
{
  size_t v4 = 0xAAAAAAAAAAAAAAAALL;
  char v5 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(a2, (const void **)&v5, &v4);
  return std::string::basic_string[abi:ne180100](this, v5, v4);
}

void Security::CodeSigning::CSError::~CSError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_1896790B0;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;
  this->__vftable = (std::exception_vtbl *)off_1896790B0;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

void Security::CodeSigning::CSError::throwMe( Security::CodeSigning::CSError *this, uint64_t a2, const __CFString *a3, const void *a4)
{
  int v5 = (int)this;
  exception = (Security::CodeSigning::CSError *)__cxa_allocate_exception(0xA0uLL);
  uint64_t v14 = Security::cfmake<__CFDictionary const*>((uint64_t)"{%O=%O}", v7, v8, v9, v10, v11, v12, v13, a2);
  Security::CodeSigning::CSError::CSError(exception, v5, v14);
}

void sub_1806483F8(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::CSError::augment( Security::CodeSigning::CSError *this, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9 = Security::cfmake<__CFDictionary const*>( (uint64_t)"{+%O,%O=%O}",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *((void *)this + 19));
  uint64_t v10 = (const void *)*((void *)this + 19);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)this + 19) = v9;
}

uint64_t Security::CodeSigning::CSError::cfError(CFDictionaryRef *this, __CFError **a2)
{
  if (a2)
  {
    size_t v4 = (const __CFString *)*MEMORY[0x189604F50];
    int v5 = (*((uint64_t (**)(CFDictionaryRef *))*this + 3))(this);
    *a2 = CFErrorCreate(0LL, v4, v5, this[19]);
  }

  return (*((uint64_t (**)(CFDictionaryRef *))*this + 3))(this);
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal( CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F80C0](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1895F8118](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigest()
{
  return MEMORY[0x1895F8150]();
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x1895F8158]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x1895F8160]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1895F8168]();
}

uint64_t CCDigestOutputSize()
{
  return MEMORY[0x1895F8180]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1895F8190]();
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF( CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1895F81F8]( *(void *)&algorithm,  password,  passwordLen,  salt,  saltLen,  *(void *)&prf,  *(void *)&rounds,  derivedKey);
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x1895F8220]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1895F8228](bytes, count);
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  return MEMORY[0x1895F8258](md, c);
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  return MEMORY[0x1895F8260](c);
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8268](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8270](data, *(void *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8278](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8280](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8288](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82B0](data, *(void *)&len, md);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82B8](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82C0](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82C8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82F0](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8310](data, *(void *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

uint64_t CEAcquireManagedContext()
{
  return MEMORY[0x1896134C0]();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x1896134D0]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x1896134E0]();
}

uint64_t CEDeserialize()
{
  return MEMORY[0x1896134F8]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x189613500]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x189613510]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x189613518]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x189613530]();
}

uint64_t CESerializeWithOptions()
{
  return MEMORY[0x189613540]();
}

uint64_t CESerializeXML()
{
  return MEMORY[0x189613548]();
}

uint64_t CESizeDeserialization()
{
  return MEMORY[0x189613550]();
}

uint64_t CESizeSerialization()
{
  return MEMORY[0x189613558]();
}

uint64_t CESizeXMLSerialization()
{
  return MEMORY[0x189613560]();
}

uint64_t CEValidate()
{
  return MEMORY[0x189613568]();
}

uint64_t CEValidateWithOptions()
{
  return MEMORY[0x189613570]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues( CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027E0](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x189602808](url);
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602880](bundle);
}

CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602898](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1896028C8](bundle, functionName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028D8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

CFTypeID CFBundleGetTypeID(void)
{
  return MEMORY[0x189602900]();
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x189602918](bundle);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return MEMORY[0x189602920](bundle);
}

void CFBundleUnloadExecutable(CFBundleRef bundle)
{
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x189602940](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x189602950](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x189602958](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x189602988](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1896029B0](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1896029B8](theSetIdentifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x189602A18]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x189602A38](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x189602A60](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x189602A78](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

CFRange CFDataFind( CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4 = MEMORY[0x189602A90](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x189602B00](allocator, locale, dateStyle, timeStyle);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter( CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x189602B18](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x189602B20](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x189602B78]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x189602C48](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x189602C58](err);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x189602C68](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x189602D60]();
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x189602D98]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x189602E88]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x189602E90](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602FA0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateFromXMLData( CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x189602FE8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x189603268](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x189603278]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x189603280](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetReplaceValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C8](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603458]( alloc,  bytes,  numBytes,  *(void *)&encoding,  isExternalRepresentation,  contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace( CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896034C8]( theString,  stringToFind,  replacementString,  rangeToSearch.location,  rangeToSearch.length,  compareOptions);
}

Boolean CFStringFindCharacterFromSet( CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D8]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  result);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x189603688](allocator, ti);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey( CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x189603708](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes( CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037B8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037C8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFTypeRef IOCFUnserializeWithSize( const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x189607CA0](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x189607440](table);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

fat_arch *__cdecl NXFindBestFatArch( cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1895F8548](*(void *)&cputype, *(void *)&cpusubtype, fat_archs, *(void *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1895F8550](*(void *)&cputype, *(void *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1895F8558](name);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x189611CF8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x189611D00]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x189611D10]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x189611D18]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x189611D20]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x189611D28]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x189611D40]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x189611D48]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x189611D50]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x189611D58]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x189611D60]();
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

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x189604128]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFBundleCreateWithExecutableURLIfMightBeBundle()
{
  return MEMORY[0x189604178]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x189604238]();
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x189604310]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find( const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x189614170](this, __c, __pos);
}

int std::string::compare( const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x189614188](this, __pos1, __n1, __s);
}

int std::string::compare( const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string *__str, std::string::size_type __pos2, std::string::size_type __n2)
{
  return MEMORY[0x189614190](this, __pos1, __n1, __str, __pos2, __n2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1896141F0](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x189614208](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::exception_ptr *__cdecl std::exception_ptr::operator=(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x189614218](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

void std::string::__grow_by_and_replace( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x189614310](this, __pos, __s, __n);
}

std::string *__cdecl std::string::replace( std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x189614320](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string( std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x189614348](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143E0]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614418]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x189614680]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x189614688](this);
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1896146A8]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_189661D88(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189661D90(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1896147C8](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1896147E0](a1);
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __dtoa()
{
  return MEMORY[0x1895F8890]();
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __freedtoa()
{
  return MEMORY[0x1895F88D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1895F8978]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895F8C00](*(void *)&image_index);
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1895F8D40](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
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

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void audit_token_to_au32( audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895F95F8](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1895F9758]();
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x1895F9778]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1895F9780]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1895F9788]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895F9790]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895F9798]();
}

uint64_t ccansikdf_x963()
{
  return MEMORY[0x1895F97A8]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x1895F97E0]();
}

uint64_t cccurve25519_make_key_pair()
{
  return MEMORY[0x1895F9870]();
}

uint64_t cccurve25519_make_pub_with_rng()
{
  return MEMORY[0x1895F9888]();
}

uint64_t cccurve25519_with_rng()
{
  return MEMORY[0x1895F9890]();
}

uint64_t cccurve448()
{
  return MEMORY[0x1895F9898]();
}

uint64_t cccurve448_make_key_pair()
{
  return MEMORY[0x1895F98A0]();
}

uint64_t cccurve448_make_pub()
{
  return MEMORY[0x1895F98B0]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1895F98B8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1895F98E0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1895F98E8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1895F98F0]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x1895F98F8]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1895F9900]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1895F9918]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1895F9928]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1895F9940]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1895F9950]();
}

uint64_t ccder_decode_seqii()
{
  return MEMORY[0x1895F9958]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x1895F9960]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1895F9968]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1895F9970]();
}

uint64_t ccder_decode_uint64()
{
  return MEMORY[0x1895F9978]();
}

uint64_t ccder_encode_body()
{
  return MEMORY[0x1895F9980]();
}

uint64_t ccder_encode_body_nocopy()
{
  return MEMORY[0x1895F9988]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1895F9990]();
}

uint64_t ccder_encode_implicit_raw_octet_string()
{
  return MEMORY[0x1895F9998]();
}

uint64_t ccder_encode_integer()
{
  return MEMORY[0x1895F99A0]();
}

uint64_t ccder_encode_tl()
{
  return MEMORY[0x1895F99C0]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1895F99C8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1895F99D0]();
}

uint64_t ccder_sizeof_implicit_raw_octet_string()
{
  return MEMORY[0x1895F99D8]();
}

uint64_t ccder_sizeof_integer()
{
  return MEMORY[0x1895F99E8]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1895F99F0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1895F9A00]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1895F9A08]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1895F9A10]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1895F9A28]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1895F9A30]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1895F9A50]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1895F9A60]();
}

uint64_t ccdh_gp_size()
{
  return MEMORY[0x1895F9A78]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1895F9A80]();
}

uint64_t ccdh_init_gp_from_bytes()
{
  return MEMORY[0x1895F9A88]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1895F9A98]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1895F9AA0]();
}

uint64_t ccec_compact_export()
{
  return MEMORY[0x1895F9AB0]();
}

uint64_t ccec_compact_generate_key()
{
  return MEMORY[0x1895F9AC0]();
}

uint64_t ccec_compact_import_priv()
{
  return MEMORY[0x1895F9AC8]();
}

uint64_t ccec_compact_import_priv_size()
{
  return MEMORY[0x1895F9AD0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1895F9AD8]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1895F9AE0]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1895F9AE8]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1895F9AF0]();
}

uint64_t ccec_compute_key()
{
  return MEMORY[0x1895F9AF8]();
}

uint64_t ccec_cp_192()
{
  return MEMORY[0x1895F9B00]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1895F9B08]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_curve_for_length_lookup()
{
  return MEMORY[0x1895F9B28]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x1895F9B40]();
}

uint64_t ccec_der_import_priv_keytype()
{
  return MEMORY[0x1895F9B48]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1895F9B68]();
}

uint64_t ccec_generate_key_deterministic()
{
  return MEMORY[0x1895F9B88]();
}

uint64_t ccec_generate_key_fips()
{
  return MEMORY[0x1895F9B90]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1895F9BA0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1895F9BA8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1895F9BB0]();
}

uint64_t ccec_rfc6637_unwrap_key()
{
  return MEMORY[0x1895F9BE8]();
}

uint64_t ccec_rfc6637_wrap_key()
{
  return MEMORY[0x1895F9C00]();
}

uint64_t ccec_rfc6637_wrap_key_size()
{
  return MEMORY[0x1895F9C08]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1895F9C20]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895F9C40]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1895F9C48]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1895F9C60]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895F9C70]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1895F9C78]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1895F9C80]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1895F9C90]();
}

uint64_t ccecies_decrypt_gcm()
{
  return MEMORY[0x1895F9C98]();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return MEMORY[0x1895F9CA8]();
}

uint64_t ccecies_encrypt_gcm()
{
  return MEMORY[0x1895F9CB8]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1895F9CC0]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1895F9CD0]();
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1895F9CE0]();
}

uint64_t cced25519_make_pub_with_rng()
{
  return MEMORY[0x1895F9CF8]();
}

uint64_t cced25519_sign_with_rng()
{
  return MEMORY[0x1895F9D08]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x1895F9D10]();
}

uint64_t cced448_make_key_pair()
{
  return MEMORY[0x1895F9D18]();
}

uint64_t cced448_make_pub()
{
  return MEMORY[0x1895F9D20]();
}

uint64_t cced448_sign()
{
  return MEMORY[0x1895F9D28]();
}

uint64_t cced448_verify()
{
  return MEMORY[0x1895F9D30]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1895F9D70]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895F9F08]();
}

uint64_t cchmac()
{
  return MEMORY[0x1895F9F20]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1895F9F28]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1895F9F30]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1895F9F38]();
}

uint64_t cckem_decapsulate()
{
  return MEMORY[0x1895F9FA0]();
}

uint64_t cckem_encapsulate()
{
  return MEMORY[0x1895F9FA8]();
}

uint64_t cckem_encapsulated_key_nbytes_ctx()
{
  return MEMORY[0x1895F9FB0]();
}

uint64_t cckem_encapsulated_key_nbytes_info()
{
  return MEMORY[0x1895F9FB8]();
}

uint64_t cckem_export_privkey()
{
  return MEMORY[0x1895F9FC0]();
}

uint64_t cckem_export_pubkey()
{
  return MEMORY[0x1895F9FC8]();
}

uint64_t cckem_full_ctx_init()
{
  return MEMORY[0x1895F9FD0]();
}

uint64_t cckem_generate_key()
{
  return MEMORY[0x1895F9FD8]();
}

uint64_t cckem_import_privkey()
{
  return MEMORY[0x1895F9FE0]();
}

uint64_t cckem_import_pubkey()
{
  return MEMORY[0x1895F9FE8]();
}

uint64_t cckem_kyber1024()
{
  return MEMORY[0x1895F9FF0]();
}

uint64_t cckem_kyber768()
{
  return MEMORY[0x1895F9FF8]();
}

uint64_t cckem_privkey_nbytes_ctx()
{
  return MEMORY[0x1895FA000]();
}

uint64_t cckem_privkey_nbytes_info()
{
  return MEMORY[0x1895FA008]();
}

uint64_t cckem_pubkey_nbytes_ctx()
{
  return MEMORY[0x1895FA018]();
}

uint64_t cckem_pubkey_nbytes_info()
{
  return MEMORY[0x1895FA020]();
}

uint64_t cckem_public_ctx()
{
  return MEMORY[0x1895FA028]();
}

uint64_t cckem_shared_key_nbytes_ctx()
{
  return MEMORY[0x1895FA030]();
}

uint64_t cckem_shared_key_nbytes_info()
{
  return MEMORY[0x1895FA038]();
}

uint64_t cckem_sizeof_full_ctx()
{
  return MEMORY[0x1895FA040]();
}

uint64_t cckem_sizeof_pub_ctx()
{
  return MEMORY[0x1895FA048]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1895FA068]();
}

uint64_t ccn_add()
{
  return MEMORY[0x1895FA070]();
}

uint64_t ccn_add1()
{
  return MEMORY[0x1895FA078]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1895FA080]();
}

uint64_t ccn_cmpn()
{
  return MEMORY[0x1895FA090]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1895FA098]();
}

uint64_t ccn_set_bit()
{
  return MEMORY[0x1895FA0A0]();
}

uint64_t ccn_write_int()
{
  return MEMORY[0x1895FA0B8]();
}

uint64_t ccn_write_int_size()
{
  return MEMORY[0x1895FA0C0]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1895FA0C8]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1895FA0D0]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1895FA0E0]();
}

uint64_t ccn_zero()
{
  return MEMORY[0x1895FA0E8]();
}

uint64_t ccoid_equal()
{
  return MEMORY[0x1895FA0F0]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1895FA0F8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x1895FA130]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x1895FA138]();
}

uint64_t ccrsa_eme_pkcs1v15_decode()
{
  return MEMORY[0x1895FA140]();
}

uint64_t ccrsa_eme_pkcs1v15_decode_safe()
{
  return MEMORY[0x1895FA148]();
}

uint64_t ccrsa_eme_pkcs1v15_encode()
{
  return MEMORY[0x1895FA150]();
}

uint64_t ccrsa_emsa_pkcs1v15_encode()
{
  return MEMORY[0x1895FA158]();
}

uint64_t ccrsa_emsa_pkcs1v15_verify()
{
  return MEMORY[0x1895FA160]();
}

uint64_t ccrsa_emsa_pss_decode()
{
  return MEMORY[0x1895FA168]();
}

uint64_t ccrsa_emsa_pss_encode()
{
  return MEMORY[0x1895FA170]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x1895FA180]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x1895FA188]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x1895FA1A0]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x1895FA1B8]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x1895FA1C0]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1895FA1C8]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1895FA1D0]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x1895FA1E0]();
}

uint64_t ccrsa_oaep_decode()
{
  return MEMORY[0x1895FA1E8]();
}

uint64_t ccrsa_oaep_encode()
{
  return MEMORY[0x1895FA1F0]();
}

uint64_t ccrsa_priv_crypt()
{
  return MEMORY[0x1895FA1F8]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1895FA200]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1895FA218]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FA268]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FA270]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FA298]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1895FA460]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1895FA468]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1895FA470]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1895FA478]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
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

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1895FAA68]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1895FAA70](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1895FAA78](s, *(void *)&flag, src);
}

uint64_t csops()
{
  return MEMORY[0x1895FAAA0]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FAAA8]();
}

uint64_t csr_check()
{
  return MEMORY[0x1895FAAB0]();
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x189613578]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x189613580]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x189613588]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x189613590]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x1896135A0]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x1896135A8]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x1896135B8]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x1896135C0]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x1896135C8]();
}

double difftime(time_t a1, time_t a2)
{
  return result;
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FABE8](data, applier);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1895FAEF0](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FB2E8](*(void *)&fd, namebuff, size, *(void *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1895FB3C8](*(void *)&fd, name, *(void *)&options);
}

double frexp(double a1, int *a2)
{
  return result;
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FB4A8](a1, a2, *(void *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1895FB598](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FB728](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FBA00](path, namebuff, size, *(void *)&options);
}

double log2(double a1)
{
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1895FC270](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FC5F8](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1895FCA78]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FCC48](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FCCC8](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1895FCCD8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int remove(const char *a1)
{
  return MEMORY[0x1895FCD08](a1);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1895FCE70](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170C0](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1896170D8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1896170E0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1896170E8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1896170F0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x189617108](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x189617110](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x189617118](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x189617128](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x189617130](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617138](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617140](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617150](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617158](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x189617160](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x189617178](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617180](a1, *(void *)&iCol);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1896171F0](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x189617238](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617288](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int sqlite3_system_errno(sqlite3 *a1)
{
  return MEMORY[0x189617318](a1);
}

uint64_t sslCipherSuiteGetMacSize()
{
  return MEMORY[0x1896149F0]();
}

uint64_t sslCipherSuiteGetSymmetricCipherBlockIvSize()
{
  return MEMORY[0x1896149F8]();
}

uint64_t sslCipherSuiteGetSymmetricCipherKeySize()
{
  return MEMORY[0x189614A00]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1895FD118](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1895FD408](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1895FD418](__b1, __b2, __len);
}

uint64_t tls_cache_cleanup()
{
  return MEMORY[0x189614A08]();
}

uint64_t tls_cache_create()
{
  return MEMORY[0x189614A10]();
}

uint64_t tls_cache_delete_session_data()
{
  return MEMORY[0x189614A18]();
}

uint64_t tls_cache_empty()
{
  return MEMORY[0x189614A20]();
}

uint64_t tls_cache_load_session_data()
{
  return MEMORY[0x189614A28]();
}

uint64_t tls_cache_save_session_data()
{
  return MEMORY[0x189614A30]();
}

uint64_t tls_handshake_close()
{
  return MEMORY[0x189614A38]();
}

uint64_t tls_handshake_continue()
{
  return MEMORY[0x189614A40]();
}

uint64_t tls_handshake_create()
{
  return MEMORY[0x189614A48]();
}

uint64_t tls_handshake_destroy()
{
  return MEMORY[0x189614A50]();
}

uint64_t tls_handshake_get_ciphersuites()
{
  return MEMORY[0x189614A58]();
}

uint64_t tls_handshake_get_max_protocol_version()
{
  return MEMORY[0x189614A60]();
}

uint64_t tls_handshake_get_min_dh_group_size()
{
  return MEMORY[0x189614A68]();
}

uint64_t tls_handshake_get_min_protocol_version()
{
  return MEMORY[0x189614A70]();
}

uint64_t tls_handshake_get_negotiated_cipherspec()
{
  return MEMORY[0x189614A78]();
}

uint64_t tls_handshake_get_negotiated_curve()
{
  return MEMORY[0x189614A80]();
}

uint64_t tls_handshake_get_peer_acceptable_client_auth_type()
{
  return MEMORY[0x189614A88]();
}

uint64_t tls_handshake_get_peer_acceptable_dn_list()
{
  return MEMORY[0x189614A90]();
}

uint64_t tls_handshake_get_peer_alpn_data()
{
  return MEMORY[0x189614A98]();
}

uint64_t tls_handshake_get_peer_hostname()
{
  return MEMORY[0x189614AA8]();
}

uint64_t tls_handshake_get_peer_npn_data()
{
  return MEMORY[0x189614AB0]();
}

uint64_t tls_handshake_get_peer_signature_algorithms()
{
  return MEMORY[0x189614AC8]();
}

uint64_t tls_handshake_get_server_identity_change()
{
  return MEMORY[0x189614AD0]();
}

uint64_t tls_handshake_get_session_match()
{
  return MEMORY[0x189614AD8]();
}

uint64_t tls_handshake_get_session_warning()
{
  return MEMORY[0x189614AE0]();
}

uint64_t tls_handshake_get_sni_hostname()
{
  return MEMORY[0x189614AE8]();
}

uint64_t tls_handshake_internal_client_random()
{
  return MEMORY[0x189614AF0]();
}

uint64_t tls_handshake_internal_master_secret()
{
  return MEMORY[0x189614AF8]();
}

uint64_t tls_handshake_internal_prf()
{
  return MEMORY[0x189614B00]();
}

uint64_t tls_handshake_internal_server_random()
{
  return MEMORY[0x189614B08]();
}

uint64_t tls_handshake_internal_set_master_secret_function()
{
  return MEMORY[0x189614B10]();
}

uint64_t tls_handshake_internal_set_session_ticket()
{
  return MEMORY[0x189614B18]();
}

uint64_t tls_handshake_negotiate()
{
  return MEMORY[0x189614B20]();
}

uint64_t tls_handshake_process()
{
  return MEMORY[0x189614B28]();
}

uint64_t tls_handshake_request_renegotiation()
{
  return MEMORY[0x189614B30]();
}

uint64_t tls_handshake_retransmit_timer_expired()
{
  return MEMORY[0x189614B38]();
}

uint64_t tls_handshake_send_alert()
{
  return MEMORY[0x189614B40]();
}

uint64_t tls_handshake_set_acceptable_dn_list()
{
  return MEMORY[0x189614B48]();
}

uint64_t tls_handshake_set_alpn_data()
{
  return MEMORY[0x189614B50]();
}

uint64_t tls_handshake_set_callbacks()
{
  return MEMORY[0x189614B58]();
}

uint64_t tls_handshake_set_ciphersuites()
{
  return MEMORY[0x189614B60]();
}

uint64_t tls_handshake_set_client_auth()
{
  return MEMORY[0x189614B68]();
}

uint64_t tls_handshake_set_config()
{
  return MEMORY[0x189614B70]();
}

uint64_t tls_handshake_set_curves()
{
  return MEMORY[0x189614B78]();
}

uint64_t tls_handshake_set_dh_parameters()
{
  return MEMORY[0x189614B80]();
}

uint64_t tls_handshake_set_fallback()
{
  return MEMORY[0x189614B88]();
}

uint64_t tls_handshake_set_false_start()
{
  return MEMORY[0x189614B90]();
}

uint64_t tls_handshake_set_max_protocol_version()
{
  return MEMORY[0x189614BA0]();
}

uint64_t tls_handshake_set_min_dh_group_size()
{
  return MEMORY[0x189614BA8]();
}

uint64_t tls_handshake_set_min_protocol_version()
{
  return MEMORY[0x189614BB0]();
}

uint64_t tls_handshake_set_mtu()
{
  return MEMORY[0x189614BB8]();
}

uint64_t tls_handshake_set_npn_data()
{
  return MEMORY[0x189614BC0]();
}

uint64_t tls_handshake_set_npn_enable()
{
  return MEMORY[0x189614BC8]();
}

uint64_t tls_handshake_set_ocsp_enable()
{
  return MEMORY[0x189614BD0]();
}

uint64_t tls_handshake_set_ocsp_response()
{
  return MEMORY[0x189614BD8]();
}

uint64_t tls_handshake_set_peer_hostname()
{
  return MEMORY[0x189614BE8]();
}

uint64_t tls_handshake_set_peer_trust()
{
  return MEMORY[0x189614BF8]();
}

uint64_t tls_handshake_set_psk_identity()
{
  return MEMORY[0x189614C00]();
}

uint64_t tls_handshake_set_psk_secret()
{
  return MEMORY[0x189614C08]();
}

uint64_t tls_handshake_set_renegotiation()
{
  return MEMORY[0x189614C10]();
}

uint64_t tls_handshake_set_resumption()
{
  return MEMORY[0x189614C18]();
}

uint64_t tls_handshake_set_sct_enable()
{
  return MEMORY[0x189614C20]();
}

uint64_t tls_handshake_set_server_identity_change()
{
  return MEMORY[0x189614C28]();
}

uint64_t tls_handshake_set_session_ticket_enabled()
{
  return MEMORY[0x189614C30]();
}

uint64_t tls_helper_create_peer_trust()
{
  return MEMORY[0x189614CD0]();
}

uint64_t tls_helper_set_identity_from_array()
{
  return MEMORY[0x189614CD8]();
}

uint64_t tls_helper_set_peer_pubkey()
{
  return MEMORY[0x189614CE0]();
}

uint64_t tls_record_advance_read_cipher()
{
  return MEMORY[0x189614C50]();
}

uint64_t tls_record_advance_write_cipher()
{
  return MEMORY[0x189614C58]();
}

uint64_t tls_record_create()
{
  return MEMORY[0x189614C60]();
}

uint64_t tls_record_decrypt()
{
  return MEMORY[0x189614C68]();
}

uint64_t tls_record_decrypted_size()
{
  return MEMORY[0x189614C70]();
}

uint64_t tls_record_destroy()
{
  return MEMORY[0x189614C78]();
}

uint64_t tls_record_encrypt()
{
  return MEMORY[0x189614C80]();
}

uint64_t tls_record_encrypted_size()
{
  return MEMORY[0x189614C88]();
}

uint64_t tls_record_get_header_size()
{
  return MEMORY[0x189614C90]();
}

uint64_t tls_record_init_pending_ciphers()
{
  return MEMORY[0x189614C98]();
}

uint64_t tls_record_parse_header()
{
  return MEMORY[0x189614CA0]();
}

uint64_t tls_record_parse_ssl2_header()
{
  return MEMORY[0x189614CA8]();
}

uint64_t tls_record_rollback_write_cipher()
{
  return MEMORY[0x189614CB0]();
}

uint64_t tls_record_set_protocol_version()
{
  return MEMORY[0x189614CB8]();
}

uint64_t tls_record_set_record_splitting()
{
  return MEMORY[0x189614CC0]();
}

int uname(utsname *a1)
{
  return MEMORY[0x1895FD450](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD470](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x1895FD508](a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1895FD810](xarray, index, length);
}

uint64_t xpc_array_get_pointer()
{
  return MEMORY[0x1895FD838]();
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD848](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

uint64_t xpc_array_set_pointer()
{
  return MEMORY[0x1895FD888]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1895FD938]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1895FD9A0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_create_with_format()
{
  return MEMORY[0x1895FDAF0]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC10](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
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

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1895FDD88](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1895FE070](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend_initWithCertificate_signatureAlgorithm_useIssuerAndSerialNumber_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithCertificate_signatureAlgorithm_useIssuerAndSerialNumber_error_);
}

uint64_t objc_msgSend_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_);
}

uint64_t objc_msgSend_initWithParticipantID_handle_permissionLevel_isCurrentUser_inviteStatus_sharingInvitationData_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithParticipantID_handle_permissionLevel_isCurrentUser_inviteStatus_sharingInvitationData_);
}

uint64_t objc_msgSend_initWithView_tlkUUID_receiverPeerID_senderPeerID_wrappedTLK_signature_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithView_tlkUUID_receiverPeerID_senderPeerID_wrappedTLK_signature_);
}

uint64_t objc_msgSend_logResultForEvent_hardFailure_result_withAttributes_timestampBucket_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_logResultForEvent_hardFailure_result_withAttributes_timestampBucket_);
}

uint64_t objc_msgSend_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply_);
}

uint64_t objc_msgSend_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply_);
}

uint64_t objc_msgSend_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error_);
}

uint64_t objc_msgSend_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply_);
}

uint64_t objc_msgSend_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error_);
}

uint64_t objc_msgSend_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply_);
}

uint64_t objc_msgSend_secItemFetchCurrentItemAcrossAllDevices_identifier_viewHint_fetchCloudValue_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_secItemFetchCurrentItemAcrossAllDevices_identifier_viewHint_fetchCloudValue_complete_);
}

uint64_t objc_msgSend_secItemSetCurrentItemAcrossAllDevices_newCurrentItemHash_accessGroup_identifier_viewHint_oldCurrentItemReference_oldCurrentItemHash_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_secItemSetCurrentItemAcrossAllDevices_newCurrentItemHash_accessGroup_identifier_viewHint_oldCurrentItemReference_oldCurrentItemHash_complete_);
}

uint64_t objc_msgSend_secItemUnsetCurrentItemsAcrossAllDevices_identifiers_viewHint_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_secItemUnsetCurrentItemsAcrossAllDevices_identifiers_viewHint_complete_);
}

uint64_t objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_);
}

uint64_t objc_msgSend_tapToRadar_description_radar_componentName_componentVersion_componentID_attributes_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_tapToRadar_description_radar_componentName_componentVersion_componentID_attributes_);
}

uint64_t objc_msgSend_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess_);
}