@interface WFLoggerBase
- (NSNumber)getLogLifespanInDays;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (unsigned)WFIsInternalInstall;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)dump;
- (void)setLogLevelEnable:(unint64_t)a3;
- (void)setLogLevelPersist:(unint64_t)a3;
- (void)setLogLifespanInDays:(id)a3;
- (void)setLogPrivacy:(unint64_t)a3;
- (void)setMaxSizeInKb:(unint64_t)a3;
- (void)stopWatchingLogFile;
@end

@implementation WFLoggerBase

- (unsigned)WFIsInternalInstall
{
  self->_internalInstall = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__WFLoggerBase_WFIsInternalInstall__block_invoke;
  block[3] = &unk_18A16CD60;
  block[4] = self;
  return self->_internalInstall;
}

uint64_t __35__WFLoggerBase_WFIsInternalInstall__block_invoke(uint64_t a1)
{
  uint64_t result = MGGetBoolAnswer();
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = result;
  return result;
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
}

- (void)setLogLifespanInDays:(id)a3
{
}

- (NSNumber)getLogLifespanInDays
{
  return 0LL;
}

- (void)setLogPrivacy:(unint64_t)a3
{
}

- (unint64_t)getLogPrivacy
{
  return 1LL;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
}

- (unint64_t)getLogLevelEnable
{
  return 3LL;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
}

- (unint64_t)getLogLevelPersist
{
  return 3LL;
}

- (unint64_t)getMaxFileSizeInMB
{
  return 0LL;
}

- (void)setMaxSizeInKb:(unint64_t)a3
{
}

- (void)stopWatchingLogFile
{
}

- (void)dump
{
}

@end