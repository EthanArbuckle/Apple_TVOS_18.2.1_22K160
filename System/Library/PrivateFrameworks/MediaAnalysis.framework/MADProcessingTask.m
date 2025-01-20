@interface MADProcessingTask
- (MADProcessingTask)init;
- (NSUUID)uuid;
- (id)cancelBlock;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADProcessingTask

- (MADProcessingTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MADProcessingTask;
  v2 = -[MADProcessingTask init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }

  return v2;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end