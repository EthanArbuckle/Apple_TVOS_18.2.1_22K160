@interface _OSLogEnumeratorCatalog
- (_OSLogChunkStore)store;
- (_OSLogEnumeratorCatalog)initWithStore:(id)a3 index:(id)a4 fileHeader:(tracev3_chunk_s *)a5 range:(_NSRange)a6 chunk:(tracev3_chunk_s *)a7;
- (_OSLogIndex)index;
- (catalog_s)catalog;
- (const)bootUUID;
- (tracev3_chunk_s)chunk;
- (tracev3_chunk_s)fileHeader;
- (unint64_t)endTime;
- (unint64_t)oldestTime;
- (void)dealloc;
- (void)enumerateSubchunksUsingBlock:(id)a3;
- (void)unionWithRange:(_NSRange)a3;
@end

@implementation _OSLogEnumeratorCatalog

- (_OSLogEnumeratorCatalog)initWithStore:(id)a3 index:(id)a4 fileHeader:(tracev3_chunk_s *)a5 range:(_NSRange)a6 chunk:(tracev3_chunk_s *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v14 = a3;
  id v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____OSLogEnumeratorCatalog;
  v16 = -[_OSLogEnumeratorCatalog init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_index, v15);
    objc_storeStrong((id *)&v17->_store, a3);
    *(_OWORD *)&v17->_ot = xmmword_1869D9140;
    p_ot = &v17->_ot;
    v17->_chunkRange.NSUInteger location = location;
    v17->_chunkRange.NSUInteger length = length;
    v17->_chunk = a7;
    v17->_fileHeader = a5;
    if (a7->var0.var1 == 17)
    {
      if (a7->var1.var2.var4)
      {
        *(_OWORD *)p_ot = xmmword_1869D9100;
        _catalog_lite_read_limits((uint64_t)a7, (uint64_t)p_ot, (uint64_t)&v17->_et);
      }
    }
  }

  return v17;
}

- (void)dealloc
{
  catalog = self->_catalog;
  if (catalog) {
    _catalog_destroy((uint64_t)catalog);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____OSLogEnumeratorCatalog;
  -[_OSLogEnumeratorCatalog dealloc](&v4, sel_dealloc);
}

- (const)bootUUID
{
  return (const char *)&self->_fileHeader->var1.var0.var12;
}

- (catalog_s)catalog
{
  result = self->_catalog;
  if (!result)
  {
    result = (catalog_s *)_catalog_create_with_chunk((uint64_t)self->_chunk, 0);
    self->_catalog = result;
  }

  return result;
}

- (void)unionWithRange:(_NSRange)a3
{
  self->_chunkRange = NSUnionRange(self->_chunkRange, a3);
}

- (void)enumerateSubchunksUsingBlock:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  catalog = self->_catalog;
  if (catalog
    || (catalog = (catalog_s *)_catalog_create_with_chunk((uint64_t)self->_chunk, 0), (self->_catalog = catalog) != 0LL))
  {
    if (catalog->var0.var0 < 0x11u)
    {
      uint64_t v20 = 0LL;
      v21 = &v20;
      uint64_t v22 = 0x3010000000LL;
      var0 = (catalog_subchunk_s *)&unk_1869E294A;
      __int128 v24 = xmmword_1869D9150;
      uint64_t v16 = 0LL;
      v17 = &v16;
      uint64_t v18 = 0x2020000000LL;
      uint64_t v19 = -1LL;
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      store = self->_store;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke_2;
      v11[3] = &unk_189F0E808;
      v11[4] = &v20;
      v11[5] = &v16;
      v11[6] = &v12;
      -[_OSLogChunkStore enumerateChunksInRange:usingBlock:]( store,  "enumerateChunksInRange:usingBlock:",  self->_chunkRange.location,  self->_chunkRange.length,  v11);
      p_var7 = &self->_catalog->var7;
      do
        p_var7 = (subchunk_queue_t *)p_var7->var0;
      while (p_var7 && !p_var7[1].var1);
      v9 = objc_alloc(&OBJC_CLASS____OSLogEnumeratorCatalogSubchunk);
      v10 = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:oldestTime:endTime:]( v9,  "initWithCatalog:subchunk:range:oldestTime:endTime:",  self,  p_var7,  v21[4],  v21[5],  v17[3],  v13[3]);
      v4[2](v4, v10);

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
    }

    else
    {
      uint64_t v20 = 0LL;
      v21 = &v20;
      uint64_t v22 = 0x2020000000LL;
      var0 = catalog->var7.var0;
      v6 = self->_store;
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke;
      v25[3] = &unk_189F0E7E0;
      v27 = &v20;
      v25[4] = self;
      v26 = v4;
      -[_OSLogChunkStore enumerateChunksInRange:usingBlock:]( v6,  "enumerateChunksInRange:usingBlock:",  self->_chunkRange.location,  self->_chunkRange.length,  v25);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (_OSLogIndex)index
{
  return (_OSLogIndex *)objc_loadWeakRetained((id *)&self->_index);
}

- (tracev3_chunk_s)chunk
{
  return self->_chunk;
}

- (tracev3_chunk_s)fileHeader
{
  return self->_fileHeader;
}

- (_OSLogChunkStore)store
{
  return self->_store;
}

- (unint64_t)oldestTime
{
  return self->_ot;
}

- (unint64_t)endTime
{
  return self->_et;
}

- (void).cxx_destruct
{
}

@end