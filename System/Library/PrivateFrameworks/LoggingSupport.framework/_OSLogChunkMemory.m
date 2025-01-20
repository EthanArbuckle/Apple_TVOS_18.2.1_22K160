@interface _OSLogChunkMemory
- (_OSLogChunkMemory)initWithBytes:(const void *)a3 size:(unint64_t)a4 deallocator:(id)a5;
- (void)dealloc;
@end

@implementation _OSLogChunkMemory

- (_OSLogChunkMemory)initWithBytes:(const void *)a3 size:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____OSLogChunkMemory;
  v9 = -[_OSLogChunkStore initWithBytes:size:](&v13, sel_initWithBytes_size_, a3, a4);
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id deallocator = v9->_deallocator;
    v9->_id deallocator = (id)v10;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogChunkMemory;
  -[_OSLogChunkMemory dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end