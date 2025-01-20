@interface MCMActionArgumentBase
- (MCMActionArgumentBase)initWithString:(id)a3;
- (NSString)string;
- (NSURL)fileURL;
@end

@implementation MCMActionArgumentBase

- (MCMActionArgumentBase)initWithString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMActionArgumentBase;
  v6 = -[MCMActionArgumentBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_string, a3);
  }

  return v7;
}

- (NSURL)fileURL
{
  return 0LL;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end