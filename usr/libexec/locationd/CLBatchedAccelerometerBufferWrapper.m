@interface CLBatchedAccelerometerBufferWrapper
- (CLBatchedAccelerometerBufferWrapper)initWithMovedBuffer:(void *)a3;
- (const)buffer;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation CLBatchedAccelerometerBufferWrapper

- (CLBatchedAccelerometerBufferWrapper)initWithMovedBuffer:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLBatchedAccelerometerBufferWrapper;
  v4 = -[CLBatchedAccelerometerBufferWrapper init](&v7, "init");
  v5 = v4;
  if (v4) {
    sub_100007664((uint64_t)&v4->_buffer, (__n128 *)a3);
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLBatchedAccelerometerBufferWrapper;
  -[CLBatchedAccelerometerBufferWrapper dealloc](&v2, "dealloc");
}

- (const)buffer
{
  return &self->_buffer;
}

- (void).cxx_destruct
{
  begin = self->_buffer.__begin_;
  if (begin)
  {
    self->_buffer.__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end