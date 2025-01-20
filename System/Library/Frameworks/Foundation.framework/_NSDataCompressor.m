@interface _NSDataCompressor
- (BOOL)finishProcessing;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5;
- (_NSDataCompressor)initWithAlgorithm:(int)a3 operation:(int)a4 dataHandler:(id)a5;
- (void)dealloc;
@end

@implementation _NSDataCompressor

- (_NSDataCompressor)initWithAlgorithm:(int)a3 operation:(int)a4 dataHandler:(id)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____NSDataCompressor;
  v8 = -[_NSDataCompressor init](&v11, sel_init);
  v9 = (_NSDataCompressor *)v8;
  if (v8)
  {
    if (compression_stream_init( (compression_stream *)(v8 + 8),  (compression_stream_operation)a4,  (compression_algorithm)a3))
    {

      return 0LL;
    }

    else
    {
      v9->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.dst_size = 0LL;
      v9->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.src_size = 0LL;
      v9->_operation = a4;
      v9->_status = 0;
      v9->_dataHandler = (id)[a5 copy];
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  compression_stream_destroy((compression_stream *)&self->_stream);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSDataCompressor;
  -[_NSDataCompressor dealloc](&v3, sel_dealloc);
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4
{
  return -[_NSDataCompressor processBytes:size:flags:](self, "processBytes:size:flags:", a3, a4, 0LL);
}

- (BOOL)finishProcessing
{
  return -[_NSDataCompressor processBytes:size:flags:]( self,  "processBytes:size:flags:",  &_NSDataCompressorEmptyBuffer,  0LL,  1LL);
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5
{
  int status = self->_status;
  if (status)
  {
    return !a4 && status == 1;
  }

  else
  {
    p_stream = &self->_stream;
    dst_ptr = self->_stream.dst_ptr;
    self->_stream.src_ptr = a3;
    self->_stream.src_size = a4;
    if (dst_ptr == (char *)&_NSDataCompressorEmptyBuffer)
    {
      self->_stream.dst_ptr = (char *)self->_buffer;
      self->_stream.dst_size = 1024LL;
    }

    int v12 = 0;
    buffer = self->_buffer;
    while (!v12)
    {
      if ((a5 & 1) == 0 && !self->_stream.src_size)
      {
        BOOL result = 1;
        goto LABEL_26;
      }

      int v12 = compression_stream_process((compression_stream *)p_stream, a5);
      self->_int status = v12;
      if (!v12 && !self->_stream.dst_size)
      {
        (*((void (**)(void))self->_dataHandler + 2))();
        self->_stream.dst_ptr = (char *)buffer;
        self->_stream.dst_size = 1024LL;
        int v12 = self->_status;
      }
    }

    if (v12 == 1)
    {
      (*((void (**)(void))self->_dataHandler + 2))();
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0LL;
      int v12 = self->_status;
    }

    else if (v12 == -1 && buffer != (unsigned __int8 *)&_NSDataCompressorEmptyBuffer)
    {
      BOOL result = 0;
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0LL;
      goto LABEL_26;
    }

    BOOL result = v12 != -1 && self->_stream.src_size == 0;
LABEL_26:
    self->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
    self->_stream.src_size = 0LL;
  }

  return result;
}

@end