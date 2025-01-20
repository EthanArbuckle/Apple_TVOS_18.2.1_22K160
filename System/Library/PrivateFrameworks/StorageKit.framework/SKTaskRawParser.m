@interface SKTaskRawParser
- (SKTaskRawParser)initWithCallback:(id)a3;
- (id)callback;
- (void)parseData:(id)a3;
- (void)setCallback:(id)a3;
@end

@implementation SKTaskRawParser

- (SKTaskRawParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKTaskRawParser;
  v5 = -[SKTaskRawParser init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    -[SKTaskRawParser setCallback:](v5, "setCallback:", v4);
  }

  return v6;
}

- (void)parseData:(id)a3
{
  id v4 = a3;
  -[SKTaskRawParser callback](self, "callback");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);
}

- (id)callback
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end