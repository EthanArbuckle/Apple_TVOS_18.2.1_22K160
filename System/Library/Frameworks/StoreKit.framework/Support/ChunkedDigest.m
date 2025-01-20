@interface ChunkedDigest
- (NSArray)chunkDigests;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)chunkType;
- (unsigned)chunkSize;
- (void)setChunkDigests:(id)a3;
- (void)setChunkSize:(unsigned int)a3;
- (void)setChunkType:(int64_t)a3;
@end

@implementation ChunkedDigest

- (void)setChunkDigests:(id)a3
{
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lib_mapAndFilterUsingBlock:", &stru_1002E9B88));
  chunkDigests = self->_chunkDigests;
  self->_chunkDigests = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[ChunkedDigest init](+[ChunkedDigest allocWithZone:](&OBJC_CLASS___ChunkedDigest, "allocWithZone:"), "init");
  v6 = (NSArray *)-[NSArray copyWithZone:](self->_chunkDigests, "copyWithZone:", a3);
  chunkDigests = v5->_chunkDigests;
  v5->_chunkDigests = v6;

  v5->_chunkSize = self->_chunkSize;
  v5->_chunkType = self->_chunkType;
  return v5;
}

- (NSArray)chunkDigests
{
  return self->_chunkDigests;
}

- (unsigned)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unsigned int)a3
{
  self->_chunkSize = a3;
}

- (int64_t)chunkType
{
  return self->_chunkType;
}

- (void)setChunkType:(int64_t)a3
{
  self->_chunkType = a3;
}

- (void).cxx_destruct
{
}

@end