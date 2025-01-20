@interface GTVMBufferSubRegion_tools_diagnostics
- (GTVMBufferSubRegion_tools_diagnostics)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (id)GTGPUToolsData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation GTVMBufferSubRegion_tools_diagnostics

- (GTVMBufferSubRegion_tools_diagnostics)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTVMBufferSubRegion_tools_diagnostics;
  v7 = -[GTVMBufferSubRegion_tools_diagnostics init](&v9, "init");
  if (v7)
  {
    v7->_parent = (GTVMBuffer_tools_diagnostics *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTVMBufferSubRegion_tools_diagnostics;
  -[GTVMBufferSubRegion_tools_diagnostics dealloc](&v3, "dealloc");
}

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  result = -[GTVMBuffer_tools_diagnostics bytes](self->_parent, "bytes");
  if (result) {
    return (char *)result + self->_range.location;
  }
  return result;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length <= -[GTVMBufferSubRegion_tools_diagnostics length](self, "length")) {
    return  -[GTVMBufferSubRegion_tools_diagnostics initWithGTVMBuffer:range:]( objc_alloc(&OBJC_CLASS___GTVMBufferSubRegion_tools_diagnostics),  "initWithGTVMBuffer:range:",  self->_parent,  self->_range.location + location,  length);
  }
  else {
    return 0LL;
  }
}

- (id)GTGPUToolsData
{
  objc_super v3 = -[GTVMBufferSubRegion_tools_diagnostics bytes](self, "bytes");
  if (!v3) {
    return +[NSData data](&OBJC_CLASS___NSData, "data");
  }
  v4 = v3;
  v5 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __37__GTVMBufferSubRegion_GTGPUToolsData__block_invoke;
  v7[3] = &unk_20B68;
  v7[4] = self;
  return  -[NSData initWithBytesNoCopy:length:deallocator:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:deallocator:",  v4,  -[GTVMBufferSubRegion_tools_diagnostics length](self, "length"),  v7);
}

@end