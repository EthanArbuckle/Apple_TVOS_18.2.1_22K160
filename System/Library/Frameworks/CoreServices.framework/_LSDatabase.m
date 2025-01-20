@interface _LSDatabase
- (_LSDatabase)init;
- (id)_init;
- (id)description;
- (uint64_t)accessContext;
- (uint64_t)isSeeded;
- (uint64_t)isSeedingComplete;
- (uint64_t)schema;
- (uint64_t)store;
- (void)dealloc;
- (void)isSeedingComplete;
- (void)setAccessContext:(void *)result;
- (void)setApplicationsChanged:(_LSDatabase *)a1;
- (void)setDocumentTypesChanged:(_LSDatabase *)a1;
- (void)setSeeded:(uint64_t)a1;
- (void)setSeedingComplete:(_LSDatabase *)a1;
- (void)setTypeDeclarationsChanged:(_LSDatabase *)a1;
- (void)setURLTypesChanged:(_LSDatabase *)a1;
@end

@implementation _LSDatabase

- (uint64_t)store
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)isSeedingComplete
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (result)
  {
    _LSDatabaseGetHeader(&v2);
    if ((v3 & 2) != 0)
    {
      _LSDatabaseGetLog();
      v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        -[_LSDatabase isSeedingComplete].cold.1();
      }

      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (uint64_t)isSeeded
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  _LSDatabaseGetHeader(&v26);
  LSDBHeader::GetCurrentBuildVersion(&__p);
  uint64_t v1 = v22;
  if ((v22 & 0x80u) != 0) {
    uint64_t v1 = v21;
  }
  if (!v1)
  {
    _LSDatabaseGetLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_DEFAULT, "Could not get OS build version.", buf, 2u);
    }

    goto LABEL_41;
  }

  *(void *)__dst = 0LL;
  *(void *)&__dst[8] = 0LL;
  strlcpy(__dst, v29, 0x10uLL);
  std::string::basic_string[abi:nn180100]<0>(buf, __dst);
  uint64_t v2 = buf[23];
  uint8_t v3 = buf[23];
  uint64_t v4 = *(void *)&buf[8];
  if ((buf[23] & 0x80u) == 0) {
    uint64_t v5 = buf[23];
  }
  else {
    uint64_t v5 = *(void *)&buf[8];
  }
  uint64_t v6 = v22;
  if ((v22 & 0x80u) != 0) {
    uint64_t v6 = v21;
  }
  if (v5 == v6)
  {
    if ((v22 & 0x80u) == 0) {
      p_p = (unsigned __int8 *)&__p;
    }
    else {
      p_p = (unsigned __int8 *)__p;
    }
    if ((char)buf[23] < 0)
    {
      v11 = *(void **)buf;
      int v12 = memcmp(*(const void **)buf, p_p, *(size_t *)&buf[8]);
      uint64_t v5 = v4;
      if (!v12)
      {
        operator delete(v11);
        goto LABEL_38;
      }
    }

    else
    {
      if (!buf[23]) {
        goto LABEL_38;
      }
      v8 = buf;
      while (*v8 == *p_p)
      {
        ++v8;
        ++p_p;
        if (!--v2)
        {
          char v9 = 0;
          if ((buf[23] & 0x80) == 0) {
            goto LABEL_32;
          }
          goto LABEL_35;
        }
      }
    }
  }

  if (!v5)
  {
    char v9 = 1;
    if ((v3 & 0x80) == 0) {
      goto LABEL_32;
    }
LABEL_35:
    operator delete(*(void **)buf);
    if ((v9 & 1) != 0) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }

  _LSDatabaseGetLog();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = buf;
    if ((buf[23] & 0x80u) != 0) {
      v14 = *(uint8_t **)buf;
    }
    v15 = &__p;
    if ((v22 & 0x80u) != 0) {
      v15 = __p;
    }
    *(_DWORD *)__dst = 136446466;
    *(void *)&__dst[4] = v14;
    *(_WORD *)&__dst[12] = 2082;
    *(void *)&__dst[14] = v15;
    _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "Local database thinks system build version is %{public}s, but the OS really is %{public}s.",  __dst,  0x16u);
  }

  char v9 = 1;
  if ((buf[23] & 0x80) != 0) {
    goto LABEL_35;
  }
LABEL_32:
  if ((v9 & 1) != 0) {
    goto LABEL_42;
  }
LABEL_38:
  _LSGetCurrentSystemVersion(v25);
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  *(_OWORD *)__dst = v25[0];
  *(_OWORD *)&__dst[16] = v25[1];
  if (_LSVersionNumberCompare(buf, __dst))
  {
    _LSDatabaseGetLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = v27;
      v24[1] = v28;
      _LSVersionNumberGetStringRepresentation(v24);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      _LSGetCurrentSystemVersion(v23);
      _LSVersionNumberGetStringRepresentation(v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_DEFAULT,  "Local database thinks system version is %{public}@, but the OS really is %{public}@.",  buf,  0x16u);
    }

- (_LSDatabase)init
{
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSDatabase;
  uint64_t v2 = -[_LSDatabase init](&v5, sel_init);
  if (v2)
  {
    uint8_t v3 = (_LSSchemaCache *)operator new(0x158uLL);
    _LSSchemaCache::_LSSchemaCache(v3);
    v2->schema._cache = v3;
  }

  return v2;
}

- (void)dealloc
{
  store = self->store;
  if (store)
  {
    CFRelease(store);
    self->store = 0LL;
  }

  accessContext = self->accessContext;
  if (accessContext)
  {
    CFRelease(accessContext);
    self->accessContext = 0LL;
  }

  cache = self->schema._cache;
  if (cache)
  {
    _LSSchemaCache::~_LSSchemaCache(cache);
    operator delete(v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSDatabase;
  -[_LSDatabase dealloc](&v7, sel_dealloc);
}

- (id)description
{
  uint64_t v3 = -[FSNode pathWithError:](self->node, "pathWithError:", 0LL);
  uint64_t v4 = (void *)v3;
  objc_super v5 = @"?";
  if (v3) {
    objc_super v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  if (self->sessionKey.systemSession)
  {
    objc_super v7 = (void *)NSString;
    v8 = @"<LSDatabase %p> { system session, path = '%@' }";
  }

  else
  {
    objc_super v7 = (void *)NSString;
    if (self->sessionKey.uid != -2)
    {
      uint64_t v9 = [NSString stringWithFormat:@"<LSDatabase %p> { userID = %llu, path = '%@' }", self, self->sessionKey.uid, v6];
      goto LABEL_8;
    }

    v8 = @"<LSDatabase %p> { path = '%@' }";
  }

  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, self, v6);
LABEL_8:
  v10 = (void *)v9;

  return v10;
}

- (uint64_t)schema
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0LL;
  }
}

- (uint64_t)accessContext
{
  if (result) {
    return *(void *)(result + 1656);
  }
  return result;
}

- (void)setAccessContext:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    CFTypeRef v3 = (CFTypeRef)result[207];
    if (v3 != cf)
    {
      result[207] = cf;
      if (cf) {
        CFRetain(cf);
      }
      if (v3) {
        CFRelease(v3);
      }
      id v4 = v2;
      return (void *)_CSStoreSetExpectedAccessContext();
    }
  }

  return result;
}

- (void)setSeeded:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    _LSDatabaseGetHeader(v19);
    if (a2)
    {
      _LSGetCurrentSystemVersion(&v19[8]);
      LSDBHeader::GetCurrentBuildVersion(__p);
      __int128 v20 = 0uLL;
      if (v8 >= 0) {
        id v4 = __p;
      }
      else {
        id v4 = (void **)__p[0];
      }
      strlcpy((char *)&v20, (const char *)v4, 0x10uLL);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
      LSDBHeader::GetCurrentModelCode(__p);
      __int128 v24 = 0u;
      __int128 v23 = 0u;
      __int128 v22 = 0u;
      __int128 v21 = 0u;
      if (v8 >= 0) {
        objc_super v5 = __p;
      }
      else {
        objc_super v5 = (void **)__p[0];
      }
    }

    else
    {
      memset(&v19[8], 0, 32);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      __int128 v20 = 0uLL;
      if (v8 >= 0) {
        uint64_t v6 = __p;
      }
      else {
        uint64_t v6 = (void **)__p[0];
      }
      strlcpy((char *)&v20, (const char *)v6, 0x10uLL);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      __int128 v24 = 0u;
      __int128 v23 = 0u;
      __int128 v22 = 0u;
      __int128 v21 = 0u;
      if (v8 >= 0) {
        objc_super v5 = __p;
      }
      else {
        objc_super v5 = (void **)__p[0];
      }
    }

    strlcpy((char *)&v21, (const char *)v5, 0x40uLL);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    __int128 v16 = v24;
    __int128 v17 = v25;
    __int128 v18 = v26;
    __int128 v11 = *(_OWORD *)&v19[32];
    __int128 v12 = v20;
    __int128 v13 = v21;
    __int128 v14 = v22;
    __int128 v15 = v23;
    __int128 v9 = *(_OWORD *)v19;
    __int128 v10 = *(_OWORD *)&v19[16];
    _LSDatabaseSetHeader(a1);
  }

- (void)setSeedingComplete:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 2, a2 ^ 1);
  }
}

- (void)setApplicationsChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x1000000, a2);
  }
}

- (void)setDocumentTypesChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x2000000, a2);
  }
}

- (void)setURLTypesChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x4000000, a2);
  }
}

- (void)setTypeDeclarationsChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x8000000, a2);
  }
}

- (void).cxx_destruct
{
}

- (void)isSeedingComplete
{
}

@end