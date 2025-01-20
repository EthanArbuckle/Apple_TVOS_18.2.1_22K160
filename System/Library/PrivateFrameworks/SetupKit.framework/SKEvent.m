@interface SKEvent
- (NSError)error;
- (SKEvent)initWithEventType:(int)a3;
- (SKEvent)initWithEventType:(int)a3 error:(id)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)eventType;
@end

@implementation SKEvent

- (SKEvent)initWithEventType:(int)a3
{
  v4 = -[SKEvent init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (SKEvent)initWithEventType:(int)a3 error:(id)a4
{
  id v7 = a4;
  v8 = -[SKEvent init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v9->_eventType = a3;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return -[SKEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = (__CFString *)0LL;
  }

  if (self->_eventType)
  {
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }

  error = self->_error;
  if (error)
  {
    v8 = error;
    CUPrintNSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v9 = v4;

    v4 = v9;
  }

  v10 = &stru_18A2823D0;
  if (v4) {
    v10 = v4;
  }
  v11 = v10;

  return v11;
}

- (NSError)error
{
  return self->_error;
}

- (int)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
}

@end