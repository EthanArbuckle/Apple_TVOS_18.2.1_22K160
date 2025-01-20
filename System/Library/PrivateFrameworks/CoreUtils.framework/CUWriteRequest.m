@interface CUWriteRequest
- (BOOL)endOfData;
- (BOOL)hasMessageUUID;
- (CUWriteRequest)init;
- (NSArray)dataArray;
- (NSError)error;
- (char)messageUUID;
- (id)completion;
- (iovec)bytesIOArray;
- (unint64_t)bytesIOCount;
- (unint64_t)bytesIOMaxCount;
- (void)setBytesIOCount:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDataArray:(id)a3;
- (void)setEndOfData:(BOOL)a3;
- (void)setHasMessageUUID:(BOOL)a3;
@end

@implementation CUWriteRequest

- (CUWriteRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUWriteRequest;
  result = -[CUWriteRequest init](&v3, sel_init);
  if (result)
  {
    result->_bytesIOArray = result->_iov;
    result->_bytesIOMaxCount = 16LL;
  }

  return result;
}

- (char)messageUUID
{
  return (char *)self->_messageUUID;
}

- (iovec)bytesIOArray
{
  return self->_bytesIOArray;
}

- (unint64_t)bytesIOCount
{
  return self->_bytesIOCount;
}

- (void)setBytesIOCount:(unint64_t)a3
{
  self->_bytesIOCount = a3;
}

- (unint64_t)bytesIOMaxCount
{
  return self->_bytesIOMaxCount;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)dataArray
{
  return self->_dataArray;
}

- (void)setDataArray:(id)a3
{
}

- (BOOL)endOfData
{
  return self->_endOfData;
}

- (void)setEndOfData:(BOOL)a3
{
  self->_endOfData = a3;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)hasMessageUUID
{
  return self->_hasMessageUUID;
}

- (void)setHasMessageUUID:(BOOL)a3
{
  self->_hasMessageUUID = a3;
}

- (void).cxx_destruct
{
}

@end