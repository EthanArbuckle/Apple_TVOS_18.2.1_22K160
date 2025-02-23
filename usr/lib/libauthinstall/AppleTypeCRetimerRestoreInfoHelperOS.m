@interface AppleTypeCRetimerRestoreInfoHelperOS
- (AppleTypeCRetimerRestoreInfoHelperOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation AppleTypeCRetimerRestoreInfoHelperOS

- (AppleTypeCRetimerRestoreInfoHelperOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerRestoreInfoHelperOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](v10, "verboseLog:", @"%@: options = %@", v12, v8);
  }

  return v10;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  v6 = (objc_class *)MEMORY[0x189607940];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

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
    -[AppleTypeCRetimerRestoreInfoHelperOS logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
  }
}

@end