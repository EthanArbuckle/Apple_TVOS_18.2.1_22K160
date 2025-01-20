@interface IOBufferMutableData
- (IOBufferMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 bufferID:(unsigned int)a5 deallocator:(id)a6;
- (const)bytes;
- (id)deallocator;
- (unint64_t)length;
- (unsigned)bufferID;
- (void)dealloc;
- (void)mutableBytes;
- (void)setDeallocator:(id)a3;
- (void)setID:(unsigned int)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation IOBufferMutableData

- (IOBufferMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 bufferID:(unsigned int)a5 deallocator:(id)a6
{
  self->_bytes = a3;
  self->_length = a4;
  self->_bufferID = a5;
  -[IOBufferMutableData setDeallocator:](self, "setDeallocator:", a6);
  return self;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IOBufferMutableData deallocator](self, "deallocator");
    v4 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, IOBufferMutableData *, unint64_t))v4)[2](v4, self, self->_length);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IOBufferMutableData;
  -[IOBufferMutableData dealloc](&v5, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
  -[IOBufferMutableData bufferID](v4, v5);
}

- (unsigned)bufferID
{
  return self->_bufferID;
}

- (void)setID:(unsigned int)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
  -[IOBufferMutableData bytes](v4, v5);
}

- (const)bytes
{
  return self->_bytes;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)deallocator
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDeallocator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end