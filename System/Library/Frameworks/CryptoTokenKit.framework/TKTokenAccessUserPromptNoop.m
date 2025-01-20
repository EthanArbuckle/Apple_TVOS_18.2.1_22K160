@interface TKTokenAccessUserPromptNoop
- (TKTokenAccessUserPromptNoop)initWithPreflightStatus:(int64_t)a3;
- (int64_t)preflightStatus;
- (int64_t)promptUserToEvaluateRequest:(id)a3 error:(id *)a4;
- (void)setPreflightStatus:(int64_t)a3;
@end

@implementation TKTokenAccessUserPromptNoop

- (TKTokenAccessUserPromptNoop)initWithPreflightStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TKTokenAccessUserPromptNoop;
  result = -[TKTokenAccessUserPromptNoop init](&v5, sel_init);
  if (result) {
    result->_preflightStatus = a3;
  }
  return result;
}

- (int64_t)promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (int64_t)preflightStatus
{
  return self->_preflightStatus;
}

- (void)setPreflightStatus:(int64_t)a3
{
  self->_preflightStatus = a3;
}

@end