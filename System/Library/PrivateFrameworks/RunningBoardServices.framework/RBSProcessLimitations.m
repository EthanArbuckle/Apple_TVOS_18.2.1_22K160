@interface RBSProcessLimitations
+ (BOOL)supportsRBSXPCSecureCoding;
- (NSString)description;
- (RBSProcessLimitations)init;
- (RBSProcessLimitations)initWithRBSXPCCoder:(id)a3;
- (double)runTime;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setRunTime:(double)a3;
@end

@implementation RBSProcessLimitations

- (RBSProcessLimitations)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessLimitations;
  result = -[RBSProcessLimitations init](&v3, sel_init);
  if (result) {
    result->_runTime = -1.0;
  }
  return result;
}

- (NSString)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_7);
  }
  double runTime = self->_runTime;
  if (runTime == -1.0)
  {
    v4 = 0LL;
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @" %fms",  (runTime - (double)(uint64_t)runTime) * 1000.0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_runTime != -1.0)
    {
      objc_msgSend((id)description_decomposedIntervalFormatter, "stringFromTimeInterval:");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }

  v5 = @"(unlimited)";
LABEL_8:
  id v6 = objc_alloc(NSString);
  uint64_t v7 = [(id)objc_opt_class() description];
  v8 = (void *)v7;
  v9 = &stru_189DE1D08;
  if (v4) {
    v9 = v4;
  }
  v10 = (void *)[v6 initWithFormat:@"<%@| runTime:%@%@>", v7, v5, v9];

  return (NSString *)v10;
}

uint64_t __36__RBSProcessLimitations_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607840]);
  v1 = (void *)description_decomposedIntervalFormatter;
  description_decomposedIntervalFormatter = (uint64_t)v0;

  return [(id)description_decomposedIntervalFormatter setUnitsStyle:1];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  -[RBSProcessLimitations runTime](self, "runTime");
  objc_msgSend(v4, "encodeDouble:forKey:", @"_runTime");
}

- (RBSProcessLimitations)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSProcessLimitations;
  v5 = -[RBSProcessLimitations init](&v8, sel_init);
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_runTime"];
    v5->_double runTime = v6;
  }

  return v5;
}

- (double)runTime
{
  return self->_runTime;
}

- (void)setRunTime:(double)a3
{
  self->_double runTime = a3;
}

@end