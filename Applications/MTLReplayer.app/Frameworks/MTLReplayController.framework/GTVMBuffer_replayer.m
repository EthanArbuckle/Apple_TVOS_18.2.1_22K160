@interface GTVMBuffer_replayer
- (GTVMBuffer_replayer)initWithCapacity:(unint64_t)a3;
- (GTVMBuffer_replayer)initWithLength:(unint64_t)a3;
- (GTVMBuffer_replayer)initWithVMBuffer:(VMBuffer *)a3;
- (VMBuffer)vmBuffer;
- (const)bytes;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation GTVMBuffer_replayer

- (GTVMBuffer_replayer)initWithVMBuffer:(VMBuffer *)a3
{
  if (!a3) {
    __assert_rtn("-[GTVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer"");
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTVMBuffer_replayer;
  result = -[GTVMBuffer_replayer init](&v5, "init");
  if (result) {
    result->_vmBuffer = a3;
  }
  return result;
}

- (GTVMBuffer_replayer)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTVMBuffer_replayer;
  v4 = -[GTVMBuffer_replayer init](&v7, "init");
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

- (GTVMBuffer_replayer)initWithLength:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTVMBuffer_replayer;
  v4 = -[GTVMBuffer_replayer init](&v7, "init");
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
  v4.super_class = (Class)&OBJC_CLASS___GTVMBuffer_replayer;
  -[GTVMBuffer_replayer dealloc](&v4, "dealloc");
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
  unint64_t var1 = vmBuffer->var1;
  if (var1 < a3)
  {
    vm_address_t var0 = vmBuffer->var0;
    uint64_t var2 = vmBuffer->var2;
    if (GPUTools::VMBuffer::_alloc((GPUTools::VMBuffer *)self->_vmBuffer, a3, var2))
    {
      if (var1 >= vmBuffer->var1) {
        vm_size_t v9 = vmBuffer->var1;
      }
      else {
        vm_size_t v9 = var1;
      }
      if (vm_copy(mach_task_self_, var0, v9, vmBuffer->var0)) {
        GPUTools::VMBuffer::_dealloc(&vmBuffer->var0);
      }
      else {
        vm_deallocate(mach_task_self_, var0, vm_page_size + var1 + var1 * var2);
      }
    }

    vmBuffer = self->_vmBuffer;
  }

  unint64_t var5 = vmBuffer->var5;
  unint64_t v11 = var5 - 1;
  uint64_t v12 = var5 - 1 + vmBuffer->var0;
  uint64_t v13 = -(uint64_t)var5;
  unint64_t v14 = (v12 & v13) - vmBuffer->var0;
  vmBuffer->var3 = v14;
  vmBuffer->var4 = v14 + ((v11 + a3) & v13);
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length <= -[GTVMBuffer_replayer length](self, "length")) {
    return  -[GTVMBufferSubRegion_replayer initWithGTVMBuffer:range:]( objc_alloc(&OBJC_CLASS___GTVMBufferSubRegion_replayer),  "initWithGTVMBuffer:range:",  self,  location,  length);
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