@interface SKTaskLineParser
+ (NSData)lineData;
- (NSMutableData)buffer;
- (SKTaskLineParser)initWithCallback:(id)a3;
- (id)callback;
- (void)parseData:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setCallback:(id)a3;
@end

@implementation SKTaskLineParser

+ (NSData)lineData
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global);
  }
  return (NSData *)(id)_lineData;
}

void __28__SKTaskLineParser_lineData__block_invoke()
{
  uint64_t v0 = [@"\n" dataUsingEncoding:4];
  v1 = (void *)_lineData;
  _lineData = v0;
}

- (SKTaskLineParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKTaskLineParser;
  v5 = -[SKTaskLineParser init](&v8, sel_init);
  if (v5)
  {
    [MEMORY[0x189603FB8] data];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTaskLineParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskLineParser setCallback:](v5, "setCallback:", v4);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v21 = a3;
  -[SKTaskLineParser buffer](self, "buffer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendData:v21];
  v5 = -[SKTaskLineParser buffer](self, "buffer");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    do
    {
      v7 = -[SKTaskLineParser buffer](self, "buffer");
      [(id)objc_opt_class() lineData];
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SKTaskLineParser buffer](self, "buffer");
      uint64_t v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));

      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v11 = -[SKTaskLineParser buffer](self, "buffer");
      objc_msgSend(v11, "subdataWithRange:", 0, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SKTaskLineParser buffer](self, "buffer");
      v14 = -[SKTaskLineParser buffer](self, "buffer");
      v15 = -[SKTaskLineParser buffer](self, "buffer");
      objc_msgSend(v14, "subdataWithRange:", v10 + 1, objc_msgSend(v15, "length") + ~objc_msgSend(v12, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setData:v16];

      -[SKTaskLineParser callback](self, "callback");
      v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v18 = (void *)[objc_alloc(NSString) initWithData:v12 encoding:4];
      ((void (**)(void, void *))v17)[2](v17, v18);
      v19 = -[SKTaskLineParser buffer](self, "buffer");
      uint64_t v20 = [v19 length];
    }

    while (v20);
  }
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBuffer:(id)a3
{
}

- (id)callback
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end