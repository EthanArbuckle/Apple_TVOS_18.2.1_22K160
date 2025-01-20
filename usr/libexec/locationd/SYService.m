@interface SYService
- (BOOL)changesAvailable;
- (BOOL)suspended;
- (SYService)initWithService:(id)a3 priority:(int64_t)a4 asMasterStore:(BOOL)a5 options:(id)a6;
- (int64_t)sessionStalenessInterval;
- (void)setChangesAvailable:(BOOL)a3;
- (void)setHasChangesAvailable;
- (void)setSessionStalenessInterval:(int64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)suspend;
@end

@implementation SYService

- (SYService)initWithService:(id)a3 priority:(int64_t)a4 asMasterStore:(BOOL)a5 options:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SYService;
  result = -[SYService init](&v7, "init", a3, a4, a5, a6);
  if (result) {
    *(_WORD *)&result->_changesAvailable = 0;
  }
  return result;
}

- (void)setHasChangesAvailable
{
}

- (void)suspend
{
}

- (BOOL)changesAvailable
{
  return self->_changesAvailable;
}

- (void)setChangesAvailable:(BOOL)a3
{
  self->_changesAvailable = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (int64_t)sessionStalenessInterval
{
  return self->_sessionStalenessInterval;
}

- (void)setSessionStalenessInterval:(int64_t)a3
{
  self->_sessionStalenessInterval = a3;
}

@end