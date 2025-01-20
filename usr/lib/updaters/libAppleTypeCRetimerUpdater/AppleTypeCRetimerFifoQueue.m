@interface AppleTypeCRetimerFifoQueue
- (id)dequeueDataOfLength:(unint64_t)a3;
- (id)description;
- (unint64_t)length;
- (void)enqueueData:(id)a3;
@end

@implementation AppleTypeCRetimerFifoQueue

- (unint64_t)length
{
  return -[NSData length](self->_buffer, "length");
}

- (void)enqueueData:(id)a3
{
  id v8 = a3;
  [MEMORY[0x189603FB8] data];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_buffer) {
    objc_msgSend(v4, "appendData:");
  }
  [v5 appendData:v8];
  [MEMORY[0x189603F48] dataWithData:v5];
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  self->_buffer = v6;
}

- (id)dequeueDataOfLength:(unint64_t)a3
{
  if (-[AppleTypeCRetimerFifoQueue length](self, "length") >= a3)
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", -[NSData bytes](self->_buffer, "bytes"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AppleTypeCRetimerFifoQueue length](self, "length") == a3)
    {
      v6 = 0LL;
    }

    else
    {
      unint64_t v7 = -[AppleTypeCRetimerFifoQueue length](self, "length") - a3;
      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", -[NSData bytes](self->_buffer, "bytes") + a3, v7);
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    }

    buffer = self->_buffer;
    self->_buffer = v6;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ len=%lu>", v5, -[AppleTypeCRetimerFifoQueue length](self, "length")];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
}

@end