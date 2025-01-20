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
  if (qword_100051B20 != -1) {
    dispatch_once(&qword_100051B20, &stru_100044CA0);
  }
  return (NSData *)(id)qword_100051B18;
}

- (SKTaskLineParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKTaskLineParser;
  v5 = -[SKTaskLineParser init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    -[SKTaskLineParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskLineParser setCallback:](v5, "setCallback:", v4);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v22 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
  [v4 appendData:v22];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
  id v6 = [v5 length];

  if (v6)
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      id v8 = [(id)objc_opt_class(self) lineData];
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v11 = (char *)objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v10, "length"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subdataWithRange:", 0, v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "subdataWithRange:",  v11 + 1,  (char *)objc_msgSend(v16, "length") + ~(unint64_t)objc_msgSend(v13, "length")));
      [v14 setData:v17];

      v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKTaskLineParser callback](self, "callback"));
      v19 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v13, 4LL);
      ((void (**)(void, NSString *))v18)[2](v18, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      id v21 = [v20 length];
    }

    while (v21);
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