@interface EventClient
- (EventClient)initWithToken:(unint64_t)a3 name:(id)a4 eventMask:(unint64_t)a5;
- (NSNumber)token;
- (NSString)clientName;
- (unint64_t)eventMask;
@end

@implementation EventClient

- (EventClient)initWithToken:(unint64_t)a3 name:(id)a4 eventMask:(unint64_t)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___EventClient;
  v10 = -[EventClient init](&v14, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    token = v10->_token;
    v10->_token = (NSNumber *)v11;

    objc_storeStrong((id *)&v10->_clientName, a4);
    v10->_eventMask = a5;
  }

  return v10;
}

- (NSNumber)token
{
  return self->_token;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (void).cxx_destruct
{
}

@end