@interface RBStateCaptureItem
- (NSString)identifier;
- (NSString)title;
- (RBStateCaptureItem)initWithTitle:(id)a3 identifier:(id)a4 block:(id)a5;
- (id)block;
- (void)dealloc;
@end

@implementation RBStateCaptureItem

- (RBStateCaptureItem)initWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RBStateCaptureItem;
  v11 = -[RBStateCaptureItem init](&v22, sel_init);
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id block = v11->_block;
    v11->_id block = (id)v16;

    dispatch_get_global_queue(17LL, 0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = _RBLogAddStateCaptureBlockWithTitle(v18, v11->_title, v11->_block);
    invalidatable = v11->_invalidatable;
    v11->_invalidatable = (RBSInvalidatable *)v19;
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBStateCaptureItem;
  -[RBStateCaptureItem dealloc](&v3, sel_dealloc);
}

- (id)block
{
  return self->_block;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end