@interface PBDisplayLayoutElementHandle
- (PBDisplayLayoutElementHandle)initWithElement:(id)a3 publisher:(id)a4;
- (PBDisplayLayoutElementPublisher)publisher;
- (PBSDisplayLayoutElement)element;
- (void)invalidate;
- (void)setElement:(id)a3;
- (void)update:(id)a3 withReason:(id)a4;
@end

@implementation PBDisplayLayoutElementHandle

- (PBDisplayLayoutElementHandle)initWithElement:(id)a3 publisher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBDisplayLayoutElementHandle;
  v9 = -[PBDisplayLayoutElementHandle init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeWeak((id *)&v10->_publisher, v8);
  }

  return v10;
}

- (void)invalidate
{
  element = self->_element;
  self->_element = 0LL;

  objc_storeWeak((id *)&self->_publisher, 0LL);
}

- (void)update:(id)a3 withReason:(id)a4
{
  id v7 = (void (**)(id, PBSDisplayLayoutElement *))a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"updateBlock != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10029302C(a2);
    }
LABEL_10:
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x100208EE4LL);
  }

  if (!self->_element
    || (v9 = v8, id WeakRetained = objc_loadWeakRetained((id *)&self->_publisher),
                 WeakRetained,
                 !WeakRetained))
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Handle has been invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002930E8(a2);
    }
    goto LABEL_10;
  }

  v7[2](v7, self->_element);
  id v11 = objc_loadWeakRetained((id *)&self->_publisher);
  [v11 displayLayoutElementHandle:self didUpdateElement:self->_element withReason:v9];
}

- (PBDisplayLayoutElementPublisher)publisher
{
  return (PBDisplayLayoutElementPublisher *)objc_loadWeakRetained((id *)&self->_publisher);
}

- (PBSDisplayLayoutElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end