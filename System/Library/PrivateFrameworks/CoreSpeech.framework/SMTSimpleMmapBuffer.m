@interface SMTSimpleMmapBuffer
- (SMTSimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4;
- (unint64_t)size;
- (void)dataPointer;
- (void)dealloc;
- (void)setDataPointer:(void *)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SMTSimpleMmapBuffer

- (SMTSimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4
{
  v6 = -[SMTSimpleMmapBuffer init](self, "init");
  if (!v6) {
    goto LABEL_60;
  }
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  id v11 = objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v10]);
  sub_1000041E0(__p, (char *)[v11 UTF8String]);

  v44 = v12;
  *(void *)&v45[(void)*(v12 - 3) - 8] = v13;
  v14 = (std::ios_base *)&v45[(void)*(v44 - 3) - 8];
  std::ios_base::init(v14, v45);
  v14[1].__vftable = 0LL;
  v14[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v45);
  if (v41 >= 0) {
    v15 = __p;
  }
  else {
    v15 = (void **)__p[0];
  }
  if (!std::filebuf::open(v45, v15, 20LL)) {
    std::ios_base::clear((std::ios_base *)&v45[(void)*(v44 - 3) - 8], *(_DWORD *)&v45[(void)*(v44 - 3) + 24] | 4);
  }
  if (a3)
  {
    std::ostream::write(&v44, a3, a4);
    if ((v45[(void)*(v44 - 3) + 24] & 5) != 0)
    {
      if (v41 >= 0) {
        v16 = __p;
      }
      else {
        v16 = (void **)__p[0];
      }
      unlink((const char *)v16);
      goto LABEL_57;
    }
  }

  else
  {
    std::ostream::sentry::sentry(&v42, &v44);
    v17 = &v45[(void)*(v44 - 3) - 8];
    if ((v17[32] & 5) == 0)
    {
      uint64_t v18 = *((void *)v17 + 5);
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 __b = 0u;
      __int128 v49 = 0u;
      unint64_t v56 = a4;
      (*(void (**)(void *__return_ptr, uint64_t, __int128 *, uint64_t))(*(void *)v18 + 40LL))( v47,  v18,  &__b,  16LL);
      if (v47[16] == -1LL) {
        std::ios_base::clear( (std::ios_base *)&v45[(void)*(v44 - 3) - 8],  *(_DWORD *)&v45[(void)*(v44 - 3) + 24] | 4);
      }
    }

    std::ostream::sentry::~sentry(&v42);
    char v42 = 0;
    std::ostream::sentry::sentry(v47, &v44);
    if (LOBYTE(v47[0]))
    {
      v19 = &v45[(void)*(v44 - 3) - 8];
      uint64_t v20 = *((void *)v19 + 5);
      int v21 = *((_DWORD *)v19 + 2);
      int v22 = *((_DWORD *)v19 + 36);
      if (v22 == -1)
      {
        std::ios_base::getloc((const std::ios_base *)&v45[(void)*(v44 - 3) - 8]);
        v23 = std::locale::use_facet((const std::locale *)&__b, &std::ctype<char>::id);
        int v22 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 32LL);
        std::locale::~locale((std::locale *)&__b);
        *((_DWORD *)v19 + 36) = v22;
      }

      if ((v21 & 0xB0) == 0x20) {
        v24 = v43;
      }
      else {
        v24 = &v42;
      }
      if (!v20) {
        goto LABEL_44;
      }
      uint64_t v25 = *((void *)v19 + 3);
      BOOL v26 = v25 <= 1;
      uint64_t v27 = v25 - 1;
      size_t v28 = v26 ? 0LL : v27;
      if (v24 - &v42 >= 1
        && (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v20 + 96LL))(v20, &v42, v24 - &v42) != v24 - &v42)
      {
        goto LABEL_44;
      }

      if ((uint64_t)v28 >= 1)
      {
        if (v28 >= 0x7FFFFFFFFFFFFFF8LL) {
          sub_10000428C();
        }
        if (v28 >= 0x17)
        {
          uint64_t v30 = (v28 & 0xFFFFFFFFFFFFFFF8LL) + 8;
          if ((v28 | 7) != 0x17) {
            uint64_t v30 = v28 | 7;
          }
          uint64_t v39 = v30 + 1;
          p_b = (__int128 *)operator new(v30 + 1);
          *((void *)&__b + 1) = v28;
          *(void *)&__int128 v49 = v39 | 0x8000000000000000LL;
          *(void *)&__int128 __b = p_b;
        }

        else
        {
          BYTE7(v49) = v28;
          p_b = &__b;
        }

        memset(p_b, v22, v28);
        *((_BYTE *)p_b + v28) = 0;
        if ((SBYTE7(v49) & 0x80u) == 0) {
          v31 = &__b;
        }
        else {
          v31 = (__int128 *)__b;
        }
        uint64_t v32 = (*(uint64_t (**)(uint64_t, __int128 *, size_t))(*(void *)v20 + 96LL))(v20, v31, v28);
        if (SBYTE7(v49) < 0) {
          operator delete((void *)__b);
        }
        if (v32 != v28) {
          goto LABEL_44;
        }
      }

      if (v43 - v24 < 1
        || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v20 + 96LL))(v20, v24, v43 - v24) == v43 - v24)
      {
        *((void *)v19 + 3) = 0LL;
      }

      else
      {
LABEL_44:
        std::ios_base::clear( (std::ios_base *)&v45[(void)*(v44 - 3) - 8],  *(_DWORD *)&v45[(void)*(v44 - 3) + 24] | 5);
      }
    }

    std::ostream::sentry::~sentry(v47);
  }

  if (!std::filebuf::close(v45)) {
    std::ios_base::clear((std::ios_base *)&v45[(void)*(v44 - 3) - 8], *(_DWORD *)&v45[(void)*(v44 - 3) + 24] | 4);
  }
  if (v41 >= 0) {
    v33 = __p;
  }
  else {
    v33 = (void **)__p[0];
  }
  int v34 = open((const char *)v33, 514, 384LL);
  if ((v34 & 0x80000000) == 0)
  {
    -[SMTSimpleMmapBuffer setDataPointer:](v6, "setDataPointer:", mmap(0LL, a4, 3, 1, v34, 0LL));
    close(v34);
    v35 = v41 >= 0 ? (const char *)__p : (const char *)__p[0];
    unlink(v35);
    if (-[SMTSimpleMmapBuffer dataPointer](v6, "dataPointer") != (id)-1LL)
    {
      -[SMTSimpleMmapBuffer setSize:](v6, "setSize:", a4);
      char v36 = 1;
      goto LABEL_58;
    }
  }

- (void)dealloc
{
  if (-[SMTSimpleMmapBuffer dataPointer](self, "dataPointer")
    && -[SMTSimpleMmapBuffer dataPointer](self, "dataPointer") != (id)-1LL)
  {
    munmap(-[SMTSimpleMmapBuffer dataPointer](self, "dataPointer"), -[SMTSimpleMmapBuffer size](self, "size"));
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SMTSimpleMmapBuffer;
  -[SMTSimpleMmapBuffer dealloc](&v3, "dealloc");
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void)dataPointer
{
  return self->_dataPointer;
}

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

@end