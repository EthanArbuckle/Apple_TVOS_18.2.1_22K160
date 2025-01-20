@interface CUKeyValueStoreWriter
- (BOOL)addKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)finishAndReturnError:(id *)a3;
- (BOOL)startAtPath:(id)a3 error:(id *)a4;
- (CUKeyValueStoreWriter)init;
- (void)cancel;
- (void)dealloc;
@end

@implementation CUKeyValueStoreWriter

- (CUKeyValueStoreWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUKeyValueStoreWriter;
  v2 = -[CUKeyValueStoreWriter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tempFD = -1;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUKeyValueStoreWriter;
  -[CUKeyValueStoreWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)startAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (NSString *)[v6 copy];
  finalPath = self->_finalPath;
  self->_finalPath = v7;

  [v6 stringByAppendingString:@".XXXXXX"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v9 getCString:self->_tempPath maxLength:1024 encoding:4] & 1) == 0)
  {
    if (a4)
    {
      uint64_t v14 = 4294960592LL;
LABEL_20:
      NSErrorWithOSStatusF((const char *)v14);
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }

    goto LABEL_17;
  }

  int v10 = mkstemp(self->_tempPath);
  if (v10 < 0)
  {
    if (a4)
    {
      if (!*__error())
      {
        uint64_t v14 = 4294960596LL;
        goto LABEL_20;
      }

      goto LABEL_13;
    }

- (BOOL)finishAndReturnError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    p_cdb = &self->_cdb;
    bzero(self->_cdb.count, 0x400uLL);
    head = self->_cdb.head;
    if (head)
    {
      v8 = self->_cdb.head;
      do
      {
        uint64_t v9 = *((int *)v8 + 2002);
        if ((_DWORD)v9)
        {
          uint64_t v10 = v9 - 1;
          int v11 = (unsigned __int8 *)v8 + 8 * v9 - 8;
          do
          {
            int v12 = *v11;
            v11 -= 8;
            ++p_cdb->count[v12];
          }

          while ((_DWORD)v10--);
        }

        v8 = (cdb_hplist *)*((void *)v8 + 1000);
      }

      while (v8);
    }

    uint64_t v14 = 0LL;
    v15.i64[0] = 0x100000001LL;
    v15.i64[1] = 0x100000001LL;
    do
    {
      uint32x4_t v15 = vmaxq_u32( (uint32x4_t)vaddq_s32(*(int32x4_t *)&self->_cdb.count[v14], *(int32x4_t *)&self->_cdb.count[v14]),  v15);
      v14 += 4LL;
    }

    while (v14 != 256);
    unsigned int v16 = vmaxvq_u32(v15);
    uint64_t numentries = self->_cdb.numentries;
    if ((numentries + v16) >> 29)
    {
LABEL_11:
      *__error() = 12;
    }

    else
    {
      v19 = (cdb_hp *)malloc(8LL * (numentries + v16));
      self->_cdb.split = v19;
      if (v19)
      {
        unsigned int v20 = 0;
        self->_cdb.hash = (cdb_hp *)((char *)v19 + 8 * numentries);
        uint64_t v21 = 0x3FFFFFFFFFFFFF00LL;
        do
        {
          v20 += self->_cdb.start[v21];
          self->_cdb.start[v21 + 256] = v20;
          ++v21;
        }

        while (v21 * 4);
        while (head)
        {
          uint64_t v22 = *((int *)head + 2002);
          if ((_DWORD)v22)
          {
            uint64_t v23 = v22 - 1;
            v24 = (unsigned __int8 *)head + 8 * v22 - 8;
            do
            {
              v25 = &p_cdb->bspace[4 * *v24];
              unsigned int v26 = *((_DWORD *)v25 + 2816) - 1;
              *((_DWORD *)v25 + 2816) = v26;
              uint64_t v27 = *(void *)v24;
              v24 -= 8;
              *((void *)self->_cdb.split + v26) = v27;
              LODWORD(v25) = v23--;
            }

            while ((_DWORD)v25);
          }

          head = (cdb_hplist *)*((void *)head + 1000);
        }

        for (uint64_t i = 0LL; i != 256; ++i)
        {
          unsigned int v29 = p_cdb->count[i];
          v30 = &self->_cdb.final[8 * i];
          *(_DWORD *)v30 = self->_cdb.pos;
          unsigned int v31 = 2 * v29;
          *((_WORD *)v30 + 2) = __PAIR16__((2 * v29) >> 24, 2 * v29);
          v30[6] = v29 >> 15;
          v30[7] = v29 >> 23;
          if (2 * v29) {
            bzero(self->_cdb.hash, 16LL * v29);
          }
          if (v29)
          {
            int v32 = 0;
            v33 = (_DWORD *)((char *)self->_cdb.split + 8 * p_cdb->start[i]);
            do
            {
              uint64_t v34 = (*v33 >> 8) % v31;
              hash = self->_cdb.hash;
              while (*((_DWORD *)hash + 2 * v34 + 1))
              {
                if ((_DWORD)v34 + 1 == v31) {
                  uint64_t v34 = 0LL;
                }
                else {
                  uint64_t v34 = (v34 + 1);
                }
              }

              uint64_t v36 = *(void *)v33;
              v33 += 2;
              *((void *)hash + v34) = v36;
              ++v32;
            }

            while (v32 != v29);
            if (v31)
            {
              uint64_t v37 = 0LL;
              uint64_t v38 = 8LL * v31;
              do
              {
                v39 = (int *)((char *)self->_cdb.hash + v37);
                int v40 = *v39;
                LODWORD(v39) = v39[1];
                __src[0] = v40;
                __src[1] = (_DWORD)v39;
                unsigned int pos = self->_cdb.pos;
                if (pos >= 0xFFFFFFF8) {
                  goto LABEL_11;
                }
                self->_cdb.unsigned int pos = pos + 8;
                v37 += 8LL;
              }

              while (v38 != v37);
            }
          }
        }

        if (buffer_flush((uint64_t *)&self->_cdb.b) != -1 && lseek(self->_cdb.fd, 0LL, 0) != -1)
        {
          int v18 = buffer_putflush((uint64_t)&self->_cdb.b, (uint64_t)self->_cdb.final);
          goto LABEL_43;
        }
      }
    }

- (void)cancel
{
  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    split = self->_cdb.split;
    if (split)
    {
      free(split);
      self->_cdb.split = 0LL;
    }

    head = self->_cdb.head;
    if (head)
    {
      do
      {
        id v6 = (cdb_hplist *)*((void *)head + 1000);
        free(head);
        self->_cdb.head = v6;
        head = v6;
      }

      while (v6);
    }

    BOOL *p_cdbStarted = 0;
  }

  int tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0)
  {
    if (close(tempFD) && *__error()) {
      __error();
    }
    self->_int tempFD = -1;
  }

  BOOL v9 = p_cdbStarted[20];
  v8 = (const char *)(p_cdbStarted + 20);
  if (v9)
  {
    unlink(v8);
    const char *v8 = 0;
  }

- (BOOL)addKey:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (self->_cdbStarted)
  {
    unint64_t v45 = 0LL;
    id v10 = v8;
    id v44 = 0LL;
    int v11 = (char *)[v10 encodedBytesAndReturnLength:&v45 error:&v44];
    id v12 = v44;
    BOOL v13 = v12;
    if (v11)
    {
      id v14 = 0LL;
      unint64_t v15 = v45;
      goto LABEL_4;
    }

    if (v12)
    {
      if (a5)
      {
LABEL_11:
        id v16 = v13;
        BOOL v13 = v16;
        id v14 = 0LL;
        goto LABEL_12;
      }
    }

    else
    {
      id v43 = 0LL;
      [v10 encodedDataAndReturnError:&v43];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = v43;
      BOOL v13 = v25;
      if (v24)
      {
        id v14 = v24;
        int v11 = (char *)[v14 bytes];
        unint64_t v15 = [v14 length];
        unint64_t v45 = v15;
LABEL_4:
        if (HIDWORD(v15))
        {
          if (a5)
          {
            NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
            BOOL v17 = 0;
            *a5 = v16;
LABEL_52:

            goto LABEL_53;
          }

- (void).cxx_destruct
{
}

@end