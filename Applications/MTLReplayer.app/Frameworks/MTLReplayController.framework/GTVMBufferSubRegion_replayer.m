@interface GTVMBufferSubRegion_replayer
- (GTVMBufferSubRegion_replayer)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (id)GTGPUToolsData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation GTVMBufferSubRegion_replayer

- (GTVMBufferSubRegion_replayer)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTVMBufferSubRegion_replayer;
  v7 = -[GTVMBufferSubRegion_replayer init](&v9, "init");
  if (v7)
  {
    v7->_parent = (GTVMBuffer_replayer *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTVMBufferSubRegion_replayer;
  -[GTVMBufferSubRegion_replayer dealloc](&v3, "dealloc");
}

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  result = -[GTVMBuffer_replayer bytes](self->_parent, "bytes");
  if (result) {
    return (char *)result + self->_range.location;
  }
  return result;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length <= -[GTVMBufferSubRegion_replayer length](self, "length")) {
    return  -[GTVMBufferSubRegion_replayer initWithGTVMBuffer:range:]( objc_alloc(&OBJC_CLASS___GTVMBufferSubRegion_replayer),  "initWithGTVMBuffer:range:",  self->_parent,  self->_range.location + location,  length);
  }
  else {
    return 0LL;
  }
}

- (id)GTGPUToolsData
{
  objc_super v3 = -[GTVMBufferSubRegion_replayer bytes](self, "bytes");
  if (!v3) {
    return +[NSData data](&OBJC_CLASS___NSData, "data");
  }
  v4 = v3;
  v5 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __37__GTVMBufferSubRegion_GTGPUToolsData__block_invoke;
  v7[3] = &unk_58EC78;
  v7[4] = self;
  return  -[NSData initWithBytesNoCopy:length:deallocator:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:deallocator:",  v4,  -[GTVMBufferSubRegion_replayer length](self, "length"),  v7);
}

@end