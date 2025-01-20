@interface CUReadRequest
- (BOOL)hasMessageUUID;
- (NSData)data;
- (NSError)error;
- (NSMutableData)bufferData;
- (char)messageUUID;
- (id)completion;
- (unint64_t)length;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (unsigned)statusFlags;
- (void)bufferBytes;
- (void)setBufferBytes:(void *)a3;
- (void)setBufferData:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setData:(id)a3;
- (void)setHasMessageUUID:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setStatusFlags:(unsigned int)a3;
@end

@implementation CUReadRequest

- (char)messageUUID
{
  return (char *)self->_messageUUID;
}

- (void)bufferBytes
{
  return self->_bufferBytes;
}

- (void)setBufferBytes:(void *)a3
{
  self->_bufferBytes = a3;
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (void)setBufferData:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (BOOL)hasMessageUUID
{
  return self->_hasMessageUUID;
}

- (void)setHasMessageUUID:(BOOL)a3
{
  self->_hasMessageUUID = a3;
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unsigned int)a3
{
  self->_statusFlags = a3;
}

- (void).cxx_destruct
{
}

@end