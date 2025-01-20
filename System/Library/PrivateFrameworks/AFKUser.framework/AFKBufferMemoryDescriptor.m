@interface AFKBufferMemoryDescriptor
+ (id)withManager:(id)a3 capacity:(unint64_t)a4;
+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5;
- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (int)appendBytes:(const void *)a3 withSize:(unint64_t)a4;
- (int)assumeControlWithOffset:(unint64_t)a3 andSize:(unint64_t)a4;
- (int)releaseControl:(BOOL)a3 withOffset:(unint64_t)a4 andSize:(unint64_t)a5;
- (void)getBytesNoCopy:(unint64_t)a3 withSize:(unint64_t)a4;
@end

@implementation AFKBufferMemoryDescriptor

+ (id)withManager:(id)a3 capacity:(unint64_t)a4
{
  id v5 = a3;
  v6 = -[AFKBufferMemoryDescriptor initWithManager:capacity:buffer:]( objc_alloc(&OBJC_CLASS___AFKBufferMemoryDescriptor),  "initWithManager:capacity:buffer:",  v5,  a4,  1LL);

  return v6;
}

- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v5) {
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AFKBufferMemoryDescriptor;
  v9 = -[AFKMemoryDescriptor initWithManager:capacity:buffer:](&v12, sel_initWithManager_capacity_buffer_, v8, a4, 1LL);
  if (!v9)
  {
    self = 0LL;
LABEL_5:
    v10 = 0LL;
    goto LABEL_6;
  }

  self = v9;
  v10 = self;
LABEL_6:

  return v10;
}

+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  id v7 = a3;
  id v8 = -[AFKBufferMemoryDescriptor initWithManager:capacity:token:]( objc_alloc(&OBJC_CLASS___AFKBufferMemoryDescriptor),  "initWithManager:capacity:token:",  v7,  a4,  a5);

  return v8;
}

- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AFKBufferMemoryDescriptor;
  BOOL v5 = -[AFKMemoryDescriptor initWithManager:capacity:token:](&v9, sel_initWithManager_capacity_token_, a3, a4, a5);
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (int)assumeControlWithOffset:(unint64_t)a3 andSize:(unint64_t)a4
{
  kern_return_t v8;
  os_log_s *v10;
  uint64_t v11;
  uint64_t input[4];
  input[3] = *MEMORY[0x1895F89C0];
  input[0] = -[AFKMemoryDescriptor token](self, "token");
  input[1] = a3;
  input[2] = a4;
  -[AFKMemoryDescriptor manager](self, "manager");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = IOConnectCallScalarMethod([v7 connect], 6u, input, 3u, 0, 0);

  if (v8)
  {
    _AFKUserLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AFKBufferMemoryDescriptor assumeControlWithOffset:andSize:].cold.1( (uint64_t)&v11,  -[AFKMemoryDescriptor regID](self, "regID"),  v8);
    }
  }

  return v8;
}

- (int)releaseControl:(BOOL)a3 withOffset:(unint64_t)a4 andSize:(unint64_t)a5
{
  kern_return_t v10;
  os_log_s *v12;
  uint64_t v13;
  uint64_t input[5];
  BOOL v7 = a3;
  input[4] = *MEMORY[0x1895F89C0];
  input[0] = -[AFKMemoryDescriptor token](self, "token");
  input[1] = v7;
  input[2] = a4;
  input[3] = a5;
  -[AFKMemoryDescriptor manager](self, "manager");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = IOConnectCallScalarMethod([v9 connect], 7u, input, 4u, 0, 0);

  if (v10)
  {
    _AFKUserLog();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AFKBufferMemoryDescriptor releaseControl:withOffset:andSize:].cold.1( (uint64_t)&v13,  -[AFKMemoryDescriptor regID](self, "regID"),  v10);
    }
  }

  return v10;
}

- (void)getBytesNoCopy:(unint64_t)a3 withSize:(unint64_t)a4
{
  if (__CFADD__(a3, a4) || a3 + a4 > -[AFKMemoryDescriptor length](self, "length")) {
    return 0LL;
  }
  else {
    return -[AFKMemoryDescriptor buffer](self, "buffer") + a3;
  }
}

- (int)appendBytes:(const void *)a3 withSize:(unint64_t)a4
{
  int v7 = -536870181;
  unint64_t v8 = -[AFKMemoryDescriptor length](self, "length");
  unint64_t v9 = v8 + a4;
  if (__CFADD__(v8, a4)) {
    return -536870168;
  }
  unint64_t v10 = v8;
  if (v9 <= -[AFKMemoryDescriptor capacity](self, "capacity"))
  {
    -[AFKMemoryDescriptor setLength:](self, "setLength:", v9);
    int v7 = -[AFKBufferMemoryDescriptor assumeControlWithOffset:andSize:]( self,  "assumeControlWithOffset:andSize:",  v10,  a4);
    if (!v7) {
      memcpy(-[AFKMemoryDescriptor buffer](self, "buffer") + v10, a3, a4);
    }
  }

  return v7;
}

- (void)assumeControlWithOffset:(int)a3 andSize:.cold.1(uint64_t a1, uint64_t a2, int a3)
{
}

- (void)releaseControl:(uint64_t)a1 withOffset:(uint64_t)a2 andSize:(int)a3 .cold.1(uint64_t a1, uint64_t a2, int a3)
{
}

@end