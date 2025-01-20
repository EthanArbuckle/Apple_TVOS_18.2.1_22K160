@interface CUKeyValueStoreReader
- (BOOL)enumerateKeyType:(Class)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)enumerateKeysAndValuesAndReturnError:(id *)a3 handler:(id)a4;
- (BOOL)enumerateValuesForKey:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateValuesForKey:(id)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)openAtPath:(id)a3 error:(id *)a4;
- (BOOL)valueExistsForKey:(id)a3;
- (CUKeyValueStoreReader)init;
- (CUKeyValueStoreReader)initWithKeyType:(Class)a3 valueType:(Class)a4;
- (id)_readObjectAtOffset:(unsigned int)a3 length:(unsigned int)a4 type:(Class)a5 error:(id *)a6;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (id)valueForKey:(id)a3 valueType:(Class)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
@end

@implementation CUKeyValueStoreReader

- (CUKeyValueStoreReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUKeyValueStoreReader;
  v2 = -[CUKeyValueStoreReader init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    v4 = v2;
  }

  return v3;
}

- (CUKeyValueStoreReader)initWithKeyType:(Class)a3 valueType:(Class)a4
{
  objc_super v6 = -[CUKeyValueStoreReader init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_keyType = a3;
    v6->_valueType = a4;
    v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0LL;
  }

  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error()) {
      __error();
    }
    self->_int fd = -1;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUKeyValueStoreReader;
  -[CUKeyValueStoreReader dealloc](&v5, sel_dealloc);
}

- (BOOL)openAtPath:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 UTF8String];
  if (!v6)
  {
    if (a4)
    {
      uint64_t v14 = 4294960592LL;
LABEL_19:
      NSErrorWithOSStatusF((const char *)v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a4 = v15;
      return result;
    }

    return 0;
  }

  v7 = (const char *)v6;
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error()) {
      __error();
    }
    self->_int fd = -1;
  }

  int v9 = open(v7, 0);
  self->_int fd = v9;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  if (!*__error())
  {
    uint64_t v14 = 4294960596LL;
    if (a4) {
      goto LABEL_19;
    }
    return 0;
  }

  uint64_t v14 = *__error();
  if ((_DWORD)v14)
  {
    if (a4) {
      goto LABEL_19;
    }
    return 0;
  }

- (void)close
{
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0LL;
  }

  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd))
    {
      if (*__error()) {
        __error();
      }
    }

    self->_int fd = -1;
  }

- (id)_readObjectAtOffset:(unsigned int)a3 length:(unsigned int)a4 type:(Class)a5 error:(id *)a6
{
  size_t v8 = *(void *)&a4;
  if (a4 <= 1) {
    size_t v11 = 1LL;
  }
  else {
    size_t v11 = a4;
  }
  v12 = (char *)malloc(v11);
  if (!v12)
  {
    if (a6)
    {
      uint64_t v14 = 4294960568LL;
LABEL_15:
      NSErrorWithOSStatusF((const char *)v14);
      id v15 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      return v15;
    }

    goto LABEL_11;
  }

  v13 = v12;
  if (cdb_read((uint64_t)&self->_cdb, v12, v8, a3))
  {
    free(v13);
    if (a6)
    {
      if (*__error()) {
        uint64_t v14 = *__error();
      }
      else {
        uint64_t v14 = 4294960596LL;
      }
      goto LABEL_15;
    }

- (BOOL)enumerateKeysAndValuesAndReturnError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = self->_keyType;
  if (v7)
  {
    size_t v8 = self->_valueType;
    if (v8)
    {
      BOOL v9 = -[CUKeyValueStoreReader enumerateKeyType:valueType:error:handler:]( self,  "enumerateKeyType:valueType:error:handler:",  v7,  v8,  a3,  v6);
    }

    else if (a3)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5A7LL);
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else if (a3)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5A7LL);
    BOOL v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)enumerateKeyType:(Class)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  size_t v8 = (void (**)(id, void *, uint64_t, _BYTE *))a6;
  if (self->_fd < 0)
  {
    if (a5)
    {
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5A7LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }

    goto LABEL_21;
  }

  if (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 4uLL, 0))
  {
    unsigned int v10 = __dst[0];
    if (__dst[0] < 0x801u)
    {
LABEL_23:
      BOOL v16 = 1;
      goto LABEL_24;
    }

    unsigned int v11 = 2048;
    while (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 8uLL, v11))
    {
      int v13 = __dst[0];
      uint64_t v12 = __dst[1];
      unsigned int v14 = v11 + 8;
      uint64_t v15 = -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:]( self,  "_readObjectAtOffset:length:type:error:",  v11 + 8,  __dst[0],  a3,  a5);
      BOOL v16 = v15 != 0;
      if (!v15) {
        goto LABEL_24;
      }
      id v17 = (void *)v15;
      int v18 = v13 + v14;
      uint64_t v19 = -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:]( self,  "_readObjectAtOffset:length:type:error:",  v13 + v14,  v12,  a4,  a5);
      if (!v19)
      {

        goto LABEL_21;
      }

      v20 = (void *)v19;
      char v25 = 0;
      v8[2](v8, v17, v19, &v25);
      if (v25)
      {

        goto LABEL_23;
      }

      unsigned int v11 = v12 + v18;

      if (v11 >= v10) {
        goto LABEL_23;
      }
    }

    if (!a5) {
      goto LABEL_21;
    }
    if (*__error()) {
      uint64_t v9 = *__error();
    }
    else {
      uint64_t v9 = 4294960596LL;
    }
    goto LABEL_15;
  }

  if (!a5)
  {
LABEL_21:
    BOOL v16 = 0;
    goto LABEL_24;
  }

  if (*__error()) {
    uint64_t v9 = *__error();
  }
  else {
    uint64_t v9 = 4294960596LL;
  }
LABEL_15:
  NSErrorWithOSStatusF((const char *)v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  BOOL v16 = 0;
  *a5 = v21;
LABEL_24:

  return v16;
}

- (BOOL)enumerateValuesForKey:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = self->_valueType;
  if (v10)
  {
    BOOL v11 = -[CUKeyValueStoreReader enumerateValuesForKey:valueType:error:handler:]( self,  "enumerateValuesForKey:valueType:error:handler:",  v8,  v10,  a4,  v9);
  }

  else if (a4)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5A7LL);
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)enumerateValuesForKey:(id)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  BOOL v11 = (void (**)(id, void *, _BYTE *))a6;
  unint64_t v30 = 0LL;
  id v12 = v10;
  id v29 = 0LL;
  int v13 = (unsigned __int8 *)[v12 encodedBytesAndReturnLength:&v30 error:&v29];
  id v14 = v29;
  uint64_t v15 = v14;
  if (v13)
  {
    id v16 = 0LL;
    unint64_t v17 = v30;
    goto LABEL_3;
  }

  if (v14)
  {
    if (a5)
    {
LABEL_9:
      id v19 = v15;
      uint64_t v15 = v19;
      id v16 = 0LL;
      goto LABEL_10;
    }

    goto LABEL_26;
  }

  id v28 = 0LL;
  [v12 encodedDataAndReturnError:&v28];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v28;
  uint64_t v15 = v24;
  if (!v23)
  {
    if (a5)
    {
      if (v24) {
        goto LABEL_9;
      }
      id v25 = NSErrorWithOSStatusF((const char *)0xFFFFE596LL);
      *a5 = v25;
    }

- (BOOL)valueExistsForKey:(id)a3
{
  unint64_t v14 = 0LL;
  id v4 = a3;
  id v13 = 0LL;
  objc_super v5 = (unsigned __int8 *)[v4 encodedBytesAndReturnLength:&v14 error:&v13];
  id v6 = v13;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      id v8 = 0LL;
    }

    else
    {
      id v12 = 0LL;
      [v4 encodedDataAndReturnError:&v12];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = v12;
      if (v8)
      {
        id v8 = v8;
        objc_super v5 = (unsigned __int8 *)[v8 bytes];
        unint64_t v9 = [v8 length];
        unint64_t v14 = v9;
        goto LABEL_3;
      }
    }

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_valueType;
  if (v7)
  {
    -[CUKeyValueStoreReader valueForKey:valueType:error:](self, "valueForKey:valueType:error:", v6, v7, a4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5A7LL);
    id v8 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)valueForKey:(id)a3 valueType:(Class)a4 error:(id *)a5
{
  unint64_t v31 = 0LL;
  id v8 = a3;
  id v30 = 0LL;
  unint64_t v9 = (unsigned __int8 *)[v8 encodedBytesAndReturnLength:&v31 error:&v30];
  id v10 = v30;
  BOOL v11 = v10;
  if (v9)
  {
    id v12 = 0LL;
    unint64_t v13 = v31;
    goto LABEL_3;
  }

  if (v10)
  {
    if (a5)
    {
LABEL_10:
      id v16 = v11;
      BOOL v11 = v16;
      id v12 = 0LL;
      goto LABEL_11;
    }

    goto LABEL_29;
  }

  id v29 = 0LL;
  [v8 encodedDataAndReturnError:&v29];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v29;
  BOOL v11 = v22;
  if (!v21)
  {
    if (a5)
    {
      if (v22) {
        goto LABEL_10;
      }
      id v26 = NSErrorWithOSStatusF((const char *)0xFFFFE596LL);
      *a5 = v26;
    }

@end