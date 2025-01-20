@interface ATSSymbolsMapCapture
- (ATSSymbolsMapCapture)initWithLogger:(id)a3;
- (void)addChunksToFile:(ktrace_file *)a3;
- (void)encodeLiveKernelMap:(ktrace_file *)a3;
- (void)encodeSharedCachesUsingCS:(ktrace_file *)a3;
- (void)encodeSharedCachesUsingDyldIntrospection:(ktrace_file *)a3;
@end

@implementation ATSSymbolsMapCapture

- (ATSSymbolsMapCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ATSSymbolsMapCapture;
  v6 = -[ATSSymbolsMapCapture init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)encodeLiveKernelMap:(ktrace_file *)a3
{
  uint64_t v5 = CSSymbolicatorCreateWithMachKernel(self, a2);
  uint64_t v7 = v6;
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x9012000000LL;
    v49 = sub_4FC0;
    v50 = sub_4FCC;
    v51 = "";
    uint64_t v52 = 0LL;
    char v53 = 0;
    __int128 v54 = xmmword_E450;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v57 = 0LL;
    uint64_t v58 = 1LL;
    __int16 v59 = 256;
    uint64_t v60 = 0LL;
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x4812000000LL;
    v40 = sub_4FD4;
    v41 = sub_4FF8;
    v42 = "";
    __p = 0LL;
    v44 = 0LL;
    uint64_t v45 = 0LL;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_5010;
    v36[3] = &unk_104E0;
    v36[4] = &v46;
    v36[5] = &v37;
    CSSymbolicatorForeachSymbolOwnerAtTime(v5, v7, 0x8000000000000000LL, v36);
    uint64_t AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner(v5, v7);
    uint64_t v10 = v9;
    if ((CSIsNull() & 1) != 0
      || (CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes(AOutSymbolOwner, v10)) == 0LL)
    {
      unsigned int v13 = 0;
    }

    else
    {
      uuid_unparse(CFUUIDBytes, out);
      size_t v12 = strlen(out);
      unsigned int v13 = sub_8E74(v47 + 6, out, v12);
    }

    CSRelease(v5, v7);
    uint64_t v14 = v38[7] - v38[6];
    if (v14) {
      v15 = (void *)v38[6];
    }
    else {
      v15 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
    }
    unsigned int v16 = sub_5494((_DWORD *)v47 + 12, (uint64_t)v15, v14 >> 2);
    unsigned int v17 = sub_8E74(v47 + 6, "kernel_task", 0xBuLL);
    v18 = v47;
    v19 = v47 + 6;
    sub_6E54((uint64_t)(v47 + 6));
    *((_BYTE *)v18 + 118) = 1;
    int v20 = *((_DWORD *)v18 + 20);
    int v21 = *((_DWORD *)v18 + 24);
    LODWORD(v18) = *((_DWORD *)v18 + 22);
    sub_6E7C((unint64_t)v19, 6LL, 0LL, -1LL);
    sub_6E7C((unint64_t)v19, 8LL, 0LL, -1LL);
    sub_7140(v19, 4LL, v17);
    sub_7140(v19, 10LL, v13);
    unsigned int v22 = sub_72B0((uint64_t)v19, v20 - v21 + (int)v18);
    v23 = v47;
    v24 = v47 + 6;
    sub_6E54((uint64_t)(v47 + 6));
    *((_BYTE *)v23 + 118) = 1;
    int v25 = *((_DWORD *)v23 + 20);
    int v26 = *((_DWORD *)v23 + 24);
    LODWORD(v23) = *((_DWORD *)v23 + 22);
    sub_7140(v24, 10LL, 0);
    sub_7140(v24, 8LL, v16);
    sub_7140(v24, 6LL, v22);
    sub_8D90((unint64_t)v24, 4LL, 1, 0);
    *(_DWORD *)out = sub_72B0((uint64_t)v24, v25 - v26 + (int)v23);
    LODWORD(v24) = sub_5494((_DWORD *)v47 + 12, (uint64_t)out, 1LL);
    v27 = v47;
    v28 = v47 + 6;
    sub_6E54((uint64_t)(v47 + 6));
    *((_BYTE *)v27 + 118) = 1;
    int v29 = *((_DWORD *)v27 + 20);
    int v30 = *((_DWORD *)v27 + 24);
    LODWORD(v27) = *((_DWORD *)v27 + 22);
    sub_7140(v28, 6LL, 0);
    sub_7140(v28, 4LL, v24);
    unsigned int v31 = sub_72B0((uint64_t)v28, v29 - v30 + (int)v27);
    sub_9490((uint64_t)(v47 + 6), v31, "SYMB", 0);
    uint64_t v32 = sub_5504((uint64_t)(v47 + 6));
    if (!ktrace_file_append_chunk( a3,  20585LL,  0LL,  0LL,  v32,  (*((_DWORD *)v47 + 20) - *((_DWORD *)v47 + 24) + *((_DWORD *)v47 + 22))))
    {
      v33 = __error();
      v34 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append kernel map chunk. Error: %s",  strerror(*v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v35);
    }

    _Block_object_dispose(&v37, 8);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }

    _Block_object_dispose(&v46, 8);
    sub_6674(&v52);
  }

- (void)encodeSharedCachesUsingDyldIntrospection:(ktrace_file *)a3
{
  uint64_t v29 = 0LL;
  int v30 = &v29;
  uint64_t v31 = 0x9012000000LL;
  uint64_t v32 = sub_4FC0;
  v33 = sub_4FCC;
  v34 = "";
  uint64_t v35 = 0LL;
  char v36 = 0;
  __int128 v37 = xmmword_E450;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v40 = 0LL;
  uint64_t v41 = 1LL;
  __int16 v42 = 256;
  uint64_t v43 = 0LL;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x4812000000LL;
  v23 = sub_5854;
  v24 = sub_5878;
  int v25 = "";
  __p = 0LL;
  v27 = 0LL;
  uint64_t v28 = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x5812000000LL;
  v18[3] = sub_5890;
  v18[4] = sub_589C;
  memset(&v18[5], 0, 40);
  int v19 = 1065353216;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_58A4;
  v17[3] = &unk_10508;
  v17[4] = v18;
  v17[5] = &v29;
  v17[6] = &v20;
  dyld_for_each_installed_shared_cache(v17, a2);
  uint64_t v5 = v21[6];
  uint64_t v6 = v21[7];
  if (v5 != v6)
  {
    unsigned int v7 = sub_5494((_DWORD *)v30 + 12, v5, (v6 - v5) >> 2);
    v8 = v30;
    uint64_t v9 = v30 + 6;
    sub_6E54((uint64_t)(v30 + 6));
    *((_BYTE *)v8 + 118) = 1;
    int v10 = *((_DWORD *)v8 + 20);
    int v11 = *((_DWORD *)v8 + 24);
    LODWORD(v8) = *((_DWORD *)v8 + 22);
    sub_7140(v9, 6LL, 0);
    sub_7140(v9, 4LL, v7);
    unsigned int v12 = sub_72B0((uint64_t)v9, v10 - v11 + (int)v8);
    sub_9490((uint64_t)(v30 + 6), v12, "SYMB", 0);
    uint64_t v13 = sub_5504((uint64_t)(v30 + 6));
    if (!ktrace_file_append_chunk( a3,  20584LL,  0LL,  0LL,  v13,  (*((_DWORD *)v30 + 20) - *((_DWORD *)v30 + 24) + *((_DWORD *)v30 + 22))))
    {
      uint64_t v14 = __error();
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append kernel map chunk. Error: %s",  strerror(*v14));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v16);
    }
  }

  _Block_object_dispose(v18, 8);
  sub_B734((uint64_t)&v18[6]);
  _Block_object_dispose(&v20, 8);
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v29, 8);
  sub_6674(&v35);
}

- (void)encodeSharedCachesUsingCS:(ktrace_file *)a3
{
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x9012000000LL;
  int v30 = sub_4FC0;
  uint64_t v31 = sub_4FCC;
  uint64_t v32 = "";
  uint64_t v33 = 0LL;
  char v34 = 0;
  __int128 v35 = xmmword_E450;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v38 = 0LL;
  uint64_t v39 = 1LL;
  __int16 v40 = 256;
  uint64_t v41 = 0LL;
  uint64_t v18 = 0LL;
  int v19 = &v18;
  uint64_t v20 = 0x4812000000LL;
  int v21 = sub_5854;
  uint64_t v22 = sub_5878;
  v23 = "";
  __p = 0LL;
  int v25 = 0LL;
  uint64_t v26 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_5F7C;
  v17[3] = &unk_104E0;
  v17[4] = &v27;
  v17[5] = &v18;
  CSSymbolicatorForeachSharedCache(v17, a2);
  uint64_t v5 = v19[6];
  uint64_t v6 = v19[7];
  if (v5 != v6)
  {
    unsigned int v7 = sub_5494((_DWORD *)v28 + 12, v5, (v6 - v5) >> 2);
    v8 = v28;
    uint64_t v9 = v28 + 6;
    sub_6E54((uint64_t)(v28 + 6));
    *((_BYTE *)v8 + 118) = 1;
    int v10 = *((_DWORD *)v8 + 20);
    int v11 = *((_DWORD *)v8 + 24);
    LODWORD(v8) = *((_DWORD *)v8 + 22);
    sub_7140(v9, 6LL, 0);
    sub_7140(v9, 4LL, v7);
    unsigned int v12 = sub_72B0((uint64_t)v9, v10 - v11 + (int)v8);
    sub_9490((uint64_t)(v28 + 6), v12, "SYMB", 0);
    uint64_t v13 = sub_5504((uint64_t)(v28 + 6));
    if (!ktrace_file_append_chunk( a3,  20584LL,  0LL,  0LL,  v13,  (*((_DWORD *)v28 + 20) - *((_DWORD *)v28 + 24) + *((_DWORD *)v28 + 22))))
    {
      uint64_t v14 = __error();
      v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append kernel map chunk. Error: %s",  strerror(*v14));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v16);
    }
  }

  _Block_object_dispose(&v18, 8);
  if (__p)
  {
    int v25 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v27, 8);
  sub_6674(&v33);
}

- (void)addChunksToFile:(ktrace_file *)a3
{
}

- (void).cxx_destruct
{
}

@end