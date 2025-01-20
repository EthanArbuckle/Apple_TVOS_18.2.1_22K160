@interface ADClientLiteWorkItem
- (ADClientLiteWorkItem)initWithWork:(id)a3 timeout:(id)a4;
- (id)timeout;
- (id)workItem;
@end

@implementation ADClientLiteWorkItem

- (ADClientLiteWorkItem)initWithWork:(id)a3 timeout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADClientLiteWorkItem;
  v8 = -[ADClientLiteWorkItem init](&v14, "init");
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id workItem = v8->_workItem;
    v8->_id workItem = v9;

    id v11 = objc_retainBlock(v7);
    id timeout = v8->_timeout;
    v8->_id timeout = v11;
  }

  return v8;
}

- (id)workItem
{
  return objc_retainBlock(self->_workItem);
}

- (id)timeout
{
  return objc_retainBlock(self->_timeout);
}

- (void).cxx_destruct
{
}

@end