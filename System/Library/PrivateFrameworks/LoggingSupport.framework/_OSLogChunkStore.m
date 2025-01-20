@interface _OSLogChunkStore
- (NSString)fileName;
- (_OSLogChunkStore)initWithBytes:(const void *)a3 size:(unint64_t)a4;
- (void)enumerateChunksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateChunksUsingBlock:(id)a3;
- (void)setFileName:(id)a3;
@end

@implementation _OSLogChunkStore

- (_OSLogChunkStore)initWithBytes:(const void *)a3 size:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____OSLogChunkStore;
  v6 = -[_OSLogChunkStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ptr = a3;
    v6->_sz = a4;
    fileName = v6->fileName;
    v6->fileName = 0LL;
  }

  return v7;
}

- (void)enumerateChunksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (location + length > self->_sz)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: enumerateChunksInRange:options:usingBlock: called with range larger than mapped file";
    qword_18C695DD0 = location + length;
    __break(1u);
  }

  else
  {
    v8 = (char *)self->_ptr + location;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v14 = __54___OSLogChunkStore_enumerateChunksInRange_usingBlock___block_invoke;
    v15 = &unk_189F0E718;
    v16 = self;
    id v9 = v7;
    id v17 = v9;
    objc_super v10 = v13;
    unint64_t v11 = 0LL;
    do
    {
      if (length - v11 < 0x10) {
        break;
      }
      unint64_t v12 = *(void *)&v8[v11 + 8];
      if (length - v11 - 16 < v12) {
        break;
      }
      unint64_t v11 = (v11 + v12 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    }

    while (v11 - 1 < length);
  }

- (void)enumerateChunksUsingBlock:(id)a3
{
}

- (NSString)fileName
{
  return self->fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end