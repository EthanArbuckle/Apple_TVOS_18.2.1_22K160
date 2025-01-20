@interface MRMCBlockAction
+ (id)blockActionWithBlock:(id)a3;
- (MRMCBlockAction)initWithImprint:(id)a3;
- (id)block;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setBlock:(id)a3;
@end

@implementation MRMCBlockAction

+ (id)blockActionWithBlock:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___MRMCBlockAction);
  -[MRMCBlockAction setBlock:](v4, "setBlock:", a3);
  return v4;
}

- (MRMCBlockAction)initWithImprint:(id)a3
{
  return 0LL;
}

- (void)demolish
{
  self->_block = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMCBlockAction;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  return 0LL;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRMCBlockAction;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  id block = self->_block;
  if (block) {
    *((void *)a3 + 3) = block;
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMCBlockAction;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @"\n\tblock='%@'",  self->_block);
}

- (id)block
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBlock:(id)a3
{
}

@end