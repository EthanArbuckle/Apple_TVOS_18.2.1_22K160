@interface PBSystemGestureExpectation
+ (PBSystemGestureExpectation)expectationWithHandle:(id)a3 options:(unint64_t)a4 fulfillment:(id)a5;
- (PBSystemGestureHandle)handle;
- (id)_initWithWithHandle:(id)a3 options:(unint64_t)a4 fulfillment:(id)a5;
- (id)fulfillmentBlock;
- (unint64_t)options;
- (unint64_t)type;
- (void)_invalidateWithSuccess:(BOOL)a3;
- (void)fulfill;
- (void)invalidate;
@end

@implementation PBSystemGestureExpectation

+ (PBSystemGestureExpectation)expectationWithHandle:(id)a3 options:(unint64_t)a4 fulfillment:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) _initWithWithHandle:v9 options:a4 fulfillment:v8];

  return (PBSystemGestureExpectation *)v10;
}

- (void)fulfill
{
}

- (void)invalidate
{
}

- (id)_initWithWithHandle:(id)a3 options:(unint64_t)a4 fulfillment:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  Class v13 = NSClassFromString(@"PBSystemGestureHandle");
  if (!v12)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288C38(a2);
    }
LABEL_16:
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x100177DF8LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSystemGestureHandleClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288C38(a2);
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x100177E5CLL);
  }

  if (!v11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288CDC(a2);
    }
    goto LABEL_16;
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBSystemGestureExpectation;
  v14 = -[PBSystemGestureExpectation init](&v21, "init");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 recipe]);
    v14->_type = (unint64_t)[v15 type];

    v14->_options = a4;
    id v16 = objc_retainBlock(v11);
    id fulfillmentBlock = v14->_fulfillmentBlock;
    v14->_id fulfillmentBlock = v16;

    if (a4) {
      objc_storeStrong((id *)&v14->_handle, a3);
    }
  }

  return v14;
}

- (void)_invalidateWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  handle = self->_handle;
  if (handle)
  {
    unint64_t options = self->_options;
    if ((options & 1) != 0)
    {
      -[PBSystemGestureHandle invalidate](handle, "invalidate");
    }

    else if ((options & 2) != 0)
    {
      -[PBSystemGestureHandle relinquish](handle, "relinquish");
    }

    v7 = self->_handle;
    self->_handle = 0LL;
  }

  id v8 = (void (**)(id, BOOL))objc_retainBlock(self->_fulfillmentBlock);
  if (v8)
  {
    id fulfillmentBlock = self->_fulfillmentBlock;
    self->_id fulfillmentBlock = 0LL;

    v8[2](v8, v3);
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)options
{
  return self->_options;
}

- (PBSystemGestureHandle)handle
{
  return self->_handle;
}

- (id)fulfillmentBlock
{
  return self->_fulfillmentBlock;
}

- (void).cxx_destruct
{
}

@end