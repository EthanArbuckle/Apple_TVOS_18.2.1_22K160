@interface SKTaskPlistParser
+ (NSData)plistEndTag;
+ (NSData)plistStartTag;
- (NSMutableData)buffer;
- (SKTaskPlistParser)initWithCallback:(id)a3;
- (_NSRange)startRange;
- (id)callback;
- (void)parseData:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setCallback:(id)a3;
- (void)setStartRange:(_NSRange)a3;
@end

@implementation SKTaskPlistParser

+ (NSData)plistStartTag
{
  if (plistStartTag_onceTokenStart != -1) {
    dispatch_once(&plistStartTag_onceTokenStart, &__block_literal_global_71);
  }
  return (NSData *)(id)plistStartTag__plistStartTag;
}

void __34__SKTaskPlistParser_plistStartTag__block_invoke()
{
  uint64_t v0 = [@"<plist" dataUsingEncoding:4];
  v1 = (void *)plistStartTag__plistStartTag;
  plistStartTag__plistStartTag = v0;
}

+ (NSData)plistEndTag
{
  if (plistEndTag_onceTokenEnd != -1) {
    dispatch_once(&plistEndTag_onceTokenEnd, &__block_literal_global_74);
  }
  return (NSData *)(id)plistEndTag__plistEndTag;
}

void __32__SKTaskPlistParser_plistEndTag__block_invoke()
{
  uint64_t v0 = [@"</plist>" dataUsingEncoding:4];
  v1 = (void *)plistEndTag__plistEndTag;
  plistEndTag__plistEndTag = v0;
}

- (SKTaskPlistParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKTaskPlistParser;
  v5 = -[SKTaskPlistParser init](&v8, sel_init);
  if (v5)
  {
    [MEMORY[0x189603FB8] data];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTaskPlistParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskPlistParser setCallback:](v5, "setCallback:", v4);
    -[SKTaskPlistParser setStartRange:](v5, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v29 = a3;
  -[SKTaskPlistParser buffer](self, "buffer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendData:v29];
  v5 = -[SKTaskPlistParser buffer](self, "buffer");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    do
    {
      if (-[SKTaskPlistParser startRange](self, "startRange") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = -[SKTaskPlistParser buffer](self, "buffer");
        [(id)objc_opt_class() plistStartTag];
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SKTaskPlistParser buffer](self, "buffer");
        uint64_t v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v10, v11);

        if (-[SKTaskPlistParser startRange](self, "startRange") == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      v12 = -[SKTaskPlistParser buffer](self, "buffer");
      [(id)objc_opt_class() plistEndTag];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SKTaskPlistParser buffer](self, "buffer");
      uint64_t v15 = objc_msgSend(v12, "rangeOfData:options:range:", v13, 0, 0, objc_msgSend(v14, "length"));
      uint64_t v17 = v16;

      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v18 = -[SKTaskPlistParser buffer](self, "buffer");
      uint64_t v19 = v15 + v17;
      objc_msgSend( v18,  "subdataWithRange:",  -[SKTaskPlistParser startRange](self, "startRange"),  v15 + v17 - -[SKTaskPlistParser startRange](self, "startRange"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896079E8] propertyListWithData:v20 options:0 format:0 error:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = -[SKTaskPlistParser buffer](self, "buffer");
        v23 = -[SKTaskPlistParser buffer](self, "buffer");
        v24 = -[SKTaskPlistParser buffer](self, "buffer");
        objc_msgSend(v23, "subdataWithRange:", v19 + 1, objc_msgSend(v24, "length") + ~v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 setData:v25];

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
        -[SKTaskPlistParser callback](self, "callback");
        v26 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *))v26)[2](v26, v21);
      }
      v27 = -[SKTaskPlistParser buffer](self, "buffer");
      uint64_t v28 = [v27 length];
    }

    while (v28);
  }
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBuffer:(id)a3
{
}

- (_NSRange)startRange
{
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_startRange, &v3, 16LL, 1, 0);
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