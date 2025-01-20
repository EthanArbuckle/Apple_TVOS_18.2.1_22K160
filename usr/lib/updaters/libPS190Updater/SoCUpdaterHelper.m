@interface SoCUpdaterHelper
- (SoCUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)verboseLog:(id)a3;
@end

@implementation SoCUpdaterHelper

- (SoCUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SoCUpdaterHelper;
  v9 = -[SoCUpdaterHelper init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    id v11 = (id)[v8 objectForKeyedSubscript:@"Options"];
    id v12 = (id)[v11 objectForKeyedSubscript:@"Verbose"];

    if (v12) {
      v10->_verbose = 1;
    }
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
    -[SoCUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
  }
}

@end