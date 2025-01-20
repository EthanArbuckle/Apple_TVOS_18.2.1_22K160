@interface GTVMBuffer_capture
- (GTVMBuffer_capture)initWithCapacity:(unint64_t)a3;
- (GTVMBuffer_capture)initWithLength:(unint64_t)a3;
- (GTVMBuffer_capture)initWithVMBuffer:(VMBuffer *)a3;
- (VMBuffer)vmBuffer;
- (const)bytes;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation GTVMBuffer_capture

- (GTVMBuffer_capture)initWithVMBuffer:(VMBuffer *)a3
{
  if (!a3) {
    __assert_rtn("-[GTVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer"");
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTVMBuffer_capture;
  result = -[GTVMBuffer_capture init](&v5, "init");
  if (result) {
    result->_vmBuffer = a3;
  }
  return result;
}

- (GTVMBuffer_capture)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTVMBuffer_capture;
  v4 = -[GTVMBuffer_capture init](&v7, "init");
  if (v4)
  {
    objc_super v5 = (VMBuffer *)operator new(0x30uLL);
    *(_OWORD *)&v5->var0 = 0u;
    *(_OWORD *)&v5->var2 = 0u;
    v5->var4 = 0LL;
    v5->var5 = 1LL;
    GPUTools::VMBuffer::_dealloc(&v5->var0);
    GPUTools::VMBuffer::_alloc((GPUTools::VMBuffer *)v5, a3, 0LL);
    v4->_vmBuffer = v5;
  }

  return v4;
}

- (GTVMBuffer_capture)initWithLength:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTVMBuffer_capture;
  v4 = -[GTVMBuffer_capture init](&v7, "init");
  if (v4)
  {
    objc_super v5 = (VMBuffer *)operator new(0x30uLL);
    *(_OWORD *)&v5->var0 = 0u;
    *(_OWORD *)&v5->var2 = 0u;
    v5->var4 = 0LL;
    v5->var5 = 1LL;
    GPUTools::VMBuffer::_dealloc(&v5->var0);
    GPUTools::VMBuffer::_alloc((GPUTools::VMBuffer *)v5, a3, 0LL);
    v4->_vmBuffer = v5;
    v5->var4 += (a3 + v5->var5 - 1) & -v5->var5;
  }

  return v4;
}

- (void)dealloc
{
  vmBuffer = self->_vmBuffer;
  if (vmBuffer)
  {
    GPUTools::VMBuffer::_dealloc(&self->_vmBuffer->var0);
    operator delete(vmBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTVMBuffer_capture;
  -[GTVMBuffer_capture dealloc](&v4, "dealloc");
}

- (unint64_t)length
{
  return self->_vmBuffer->var4;
}

- (const)bytes
{
  return (const void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (void)mutableBytes
{
  return (void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (void)setLength:(unint64_t)a3
{
  vmBuffer = self->_vmBuffer;
  if (vmBuffer->var1 < a3)
  {
    GPUTools::VMBuffer::resize((GPUTools::VMBuffer *)vmBuffer, a3);
    vmBuffer = self->_vmBuffer;
  }

  unint64_t var5 = vmBuffer->var5;
  unint64_t v7 = var5 - 1;
  uint64_t v8 = var5 - 1 + vmBuffer->var0;
  uint64_t v9 = -(uint64_t)var5;
  unint64_t v10 = (v8 & v9) - vmBuffer->var0;
  vmBuffer->var3 = v10;
  vmBuffer->var4 = v10 + ((v7 + a3) & v9);
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length <= -[GTVMBuffer_capture length](self, "length")) {
    return  -[GTVMBufferSubRegion_capture initWithGTVMBuffer:range:]( objc_alloc(&OBJC_CLASS___GTVMBufferSubRegion_capture),  "initWithGTVMBuffer:range:",  self,  location,  length);
  }
  else {
    return 0LL;
  }
}

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

@end