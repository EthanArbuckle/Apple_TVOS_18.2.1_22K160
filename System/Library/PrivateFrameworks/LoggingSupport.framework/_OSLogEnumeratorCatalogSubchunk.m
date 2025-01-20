@interface _OSLogEnumeratorCatalogSubchunk
- (_OSLogEnumeratorCatalog)catalog;
- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5;
- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5 oldestTime:(unint64_t)a6 endTime:(unint64_t)a7;
- (id)_decompressedBufferForChunk:(tracev3_chunk_s *)a3 subchunk:(catalog_subchunk_s *)a4;
- (int64_t)endTimeCompare:(id)a3;
- (int64_t)oldestTimeCompare:(id)a3;
- (unint64_t)endTime;
- (unint64_t)oldestTime;
- (void)enumerateChunksUsingBlock:(id)a3;
@end

@implementation _OSLogEnumeratorCatalogSubchunk

- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____OSLogEnumeratorCatalogSubchunk;
  v11 = -[_OSLogEnumeratorCatalogSubchunk init](&v16, sel_init);
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:8];
    decompressedChunks = v11->_decompressedChunks;
    v11->_decompressedChunks = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_catalog, a3);
    v11->_range.NSUInteger location = location;
    v11->_range.NSUInteger length = length;
    if (a4)
    {
      v11->_subchunk = a4;
      v11->_ot = a4->var1;
      unint64_t var2 = a4->var2;
    }

    else
    {
      v11->_ot = 0LL;
      unint64_t var2 = -1LL;
    }

    v11->_et = var2;
  }

  return v11;
}

- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5 oldestTime:(unint64_t)a6 endTime:(unint64_t)a7
{
  result = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:]( self,  "initWithCatalog:subchunk:range:",  a3,  a4,  a5.location,  a5.length);
  if (result)
  {
    result->_ot = a6;
    result->_et = a7;
  }

  return result;
}

- (int64_t)oldestTimeCompare:(id)a3
{
  unint64_t ot = self->_ot;
  unint64_t v4 = *((void *)a3 + 6);
  BOOL v5 = ot >= v4;
  BOOL v6 = ot == v4;
  int64_t v7 = -1LL;
  if (v5) {
    int64_t v7 = 1LL;
  }
  if (v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

- (int64_t)endTimeCompare:(id)a3
{
  unint64_t et = self->_et;
  unint64_t v4 = *((void *)a3 + 7);
  BOOL v5 = et >= v4;
  BOOL v6 = et == v4;
  int64_t v7 = -1LL;
  if (v5) {
    int64_t v7 = 1LL;
  }
  if (v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

- (id)_decompressedBufferForChunk:(tracev3_chunk_s *)a3 subchunk:(catalog_subchunk_s *)a4
{
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_decompressedChunks, "objectForKeyedSubscript:", v7);
  v8 = (_OSLogChunkBuffer *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_OSLogChunkBuffer initWithChunk:subchunk:]( objc_alloc(&OBJC_CLASS____OSLogChunkBuffer),  "initWithChunk:subchunk:",  a3,  a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_decompressedChunks,  "setObject:forKeyedSubscript:",  v8,  v7);
  }

  v9 = v8;

  return v9;
}

- (void)enumerateChunksUsingBlock:(id)a3
{
  id v4 = a3;
  -[_OSLogEnumeratorCatalog store](self->_catalog, "store");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke;
  v9[3] = &unk_189F0E7B8;
  v9[4] = self;
  id v10 = v4;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  id v8 = v4;
  objc_msgSend(v5, "enumerateChunksInRange:usingBlock:", location, length, v9);
}

- (_OSLogEnumeratorCatalog)catalog
{
  return self->_catalog;
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