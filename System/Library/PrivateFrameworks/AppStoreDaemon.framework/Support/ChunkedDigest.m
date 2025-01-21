@interface ChunkedDigest
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation ChunkedDigest

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

- (void).cxx_destruct
{
}

@end