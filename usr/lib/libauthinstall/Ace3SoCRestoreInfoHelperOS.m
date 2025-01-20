@interface Ace3SoCRestoreInfoHelperOS
- (Ace3SoCRestoreInfoHelperOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation Ace3SoCRestoreInfoHelperOS

- (Ace3SoCRestoreInfoHelperOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___Ace3SoCRestoreInfoHelperOS;
  v9 = -[Ace3SoCRestoreInfoHelperOS init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    [v8 objectForKeyedSubscript:@"Options"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"Verbose"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12) {
      v10->_verbose = 1;
    }
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[Ace3SoCRestoreInfoHelperOS verboseLog:](v10, "verboseLog:", @"%@: options = %@", v14, v8);
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
    -[Ace3SoCRestoreInfoHelperOS logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
  }
}

@end