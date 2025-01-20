@interface PDDeviceCheckInTask
- (BOOL)canPromptForAuth;
- (BOOL)cancelled;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)completionHandlers;
- (NSUUID)identifier;
- (PDDeviceCheckInTask)init;
- (void)setCanPromptForAuth:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PDDeviceCheckInTask

- (PDDeviceCheckInTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDDeviceCheckInTask;
  v2 = -[PDDeviceCheckInTask init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    char v7 = PKEqualObjects(self->_identifier, v4[2]);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)canPromptForAuth
{
  return self->_canPromptForAuth;
}

- (void)setCanPromptForAuth:(BOOL)a3
{
  self->_canPromptForAuth = a3;
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCompletionHandlers:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
}

@end