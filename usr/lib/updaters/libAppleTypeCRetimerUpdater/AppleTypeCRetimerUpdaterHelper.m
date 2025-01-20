@interface AppleTypeCRetimerUpdaterHelper
- (AppleTypeCRetimerUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation AppleTypeCRetimerUpdaterHelper

- (AppleTypeCRetimerUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUpdaterHelper;
  result = -[AppleTypeCRetimerUpdaterHelper init](&v8, sel_init, a3);
  if (result)
  {
    result->_logFunction = a4;
    result->_logContext = a5;
  }

  return result;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  v6 = (objc_class *)MEMORY[0x189607940];
  id v7 = a3;
  objc_super v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

  [v8 appendString:@"\n"];
  logFunction = (void (*)(void *, uint64_t))self->_logFunction;
  logContext = self->_logContext;
  id v11 = v8;
  logFunction(logContext, [v11 UTF8String]);
}

- (void)log:(id)a3
{
}

- (void)verboseLog:(id)a3
{
  if (self->_verbose) {
    -[AppleTypeCRetimerUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
  }
}

@end