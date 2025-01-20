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
  if (qword_100051B30 != -1) {
    dispatch_once(&qword_100051B30, &stru_100044CC0);
  }
  return (NSData *)(id)qword_100051B28;
}

+ (NSData)plistEndTag
{
  if (qword_100051B40 != -1) {
    dispatch_once(&qword_100051B40, &stru_100044CE0);
  }
  return (NSData *)(id)qword_100051B38;
}

- (SKTaskPlistParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKTaskPlistParser;
  v5 = -[SKTaskPlistParser init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    -[SKTaskPlistParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskPlistParser setCallback:](v5, "setCallback:", v4);
    -[SKTaskPlistParser setStartRange:](v5, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v31 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
  [v4 appendData:v31];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
  id v6 = [v5 length];

  if (v6)
  {
    do
    {
      if (-[SKTaskPlistParser startRange](self, "startRange") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        id v8 = [(id)objc_opt_class(self) plistStartTag];
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        id v11 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v10, "length"));
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v11, v12);

        if (-[SKTaskPlistParser startRange](self, "startRange") == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      id v14 = [(id)objc_opt_class(self) plistEndTag];
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      v17 = objc_msgSend(v13, "rangeOfData:options:range:", v15, 0, 0, objc_msgSend(v16, "length"));
      uint64_t v19 = v18;

      if (v17 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      unint64_t v21 = (unint64_t)&v17[v19];
      v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "subdataWithRange:",  -[SKTaskPlistParser startRange](self, "startRange"),  &v17[v19] - (_BYTE *)-[SKTaskPlistParser startRange](self, "startRange")));

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v22,  0LL,  0LL,  0LL));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subdataWithRange:", v21 + 1, (char *)objc_msgSend(v26, "length") + ~v21));
        [v24 setData:v27];

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
        v28 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser callback](self, "callback"));
        ((void (**)(void, void *))v28)[2](v28, v23);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      id v30 = [v29 length];
    }

    while (v30);
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