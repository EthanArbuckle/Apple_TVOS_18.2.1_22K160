@interface GTMTLReplaySharedBufferRange
- (GTMTLReplaySharedBufferRange)initWithBuffer:(id)a3;
- (GTMTLReplaySharedBufferRange)initWithHeap:(id)a3 range:(_NSRange)a4;
- (id)data;
- (id)heapBuffer;
- (unint64_t)heapLocation;
- (unint64_t)length;
- (void)contents;
@end

@implementation GTMTLReplaySharedBufferRange

- (GTMTLReplaySharedBufferRange)initWithBuffer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBufferRange;
  v6 = -[GTMTLReplaySharedBufferRange init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_heapBuffer, a3);
    id v8 = [v5 length];
    v7->_heapRange.location = 0LL;
    v7->_heapRange.length = (NSUInteger)v8;
  }

  return v7;
}

- (GTMTLReplaySharedBufferRange)initWithHeap:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBufferRange;
  v9 = -[GTMTLReplaySharedBufferRange init](&v14, "init");
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heap, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 buffer]);
    heapBuffer = v10->_heapBuffer;
    v10->_heapBuffer = (MTLBuffer *)v11;

    v10->_heapRange.NSUInteger location = location;
    v10->_heapRange.NSUInteger length = length;
  }

  return v10;
}

- (id)heapBuffer
{
  return self->_heapBuffer;
}

- (unint64_t)heapLocation
{
  return self->_heapRange.location;
}

- (void)contents
{
  return (char *)-[MTLBuffer contents](self->_heapBuffer, "contents") + self->_heapRange.location;
}

- (unint64_t)length
{
  return self->_heapRange.length;
}

- (id)data
{
  v3 = self->_heap;
  v4 = self->_heapBuffer;
  id v5 = objc_alloc(&OBJC_CLASS___NSData);
  v6 = v4;
  v7 = (char *)-[MTLBuffer contents](v6, "contents");
  NSUInteger location = self->_heapRange.location;
  NSUInteger length = self->_heapRange.length;
  objc_super v10 = &v7[location];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __36__GTMTLReplaySharedBufferRange_data__block_invoke;
  v15[3] = &unk_58F098;
  v16 = v6;
  v17 = v3;
  uint64_t v11 = v3;
  v12 = v6;
  v13 = -[NSData initWithBytesNoCopy:length:deallocator:]( v5,  "initWithBytesNoCopy:length:deallocator:",  v10,  length,  v15);

  return v13;
}

- (void).cxx_destruct
{
}

id __36__GTMTLReplaySharedBufferRange_data__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) buffer];
}

@end