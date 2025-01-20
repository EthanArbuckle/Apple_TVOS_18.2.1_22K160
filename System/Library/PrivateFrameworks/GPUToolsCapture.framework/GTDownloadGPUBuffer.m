@interface GTDownloadGPUBuffer
- (GTDownloadGPUBuffer)initWithTracking:(unint64_t *)a3;
- (MTLBuffer)buffer;
- (unint64_t)offset;
- (unint64_t)size;
- (void)dealloc;
- (void)setBuffer:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation GTDownloadGPUBuffer

- (GTDownloadGPUBuffer)initWithTracking:(unint64_t *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTDownloadGPUBuffer;
  result = -[GTDownloadGPUBuffer init](&v5, "init");
  if (result) {
    result->_usedGPUMemory = a3;
  }
  return result;
}

- (void)dealloc
{
  usedGPUMemory = self->_usedGPUMemory;
  if (usedGPUMemory)
  {
    id v4 = -[MTLBuffer length](self->_buffer, "length");
    do
      unint64_t v5 = __ldaxr(usedGPUMemory);
    while (__stlxr(v5 - (void)v4, usedGPUMemory));
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTDownloadGPUBuffer;
  -[GTDownloadGPUBuffer dealloc](&v6, "dealloc");
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (unint64_t)offset
{
  return self->offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->offset = a3;
}

- (unint64_t)size
{
  return self->size;
}

- (void)setSize:(unint64_t)a3
{
  self->size = a3;
}

- (void).cxx_destruct
{
}

@end