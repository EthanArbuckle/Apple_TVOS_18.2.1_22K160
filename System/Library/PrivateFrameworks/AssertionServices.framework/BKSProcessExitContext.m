@interface BKSProcessExitContext
+ (BOOL)supportsSecureCoding;
- (BKSProcessExitContext)initWithCoder:(id)a3;
- (id)description;
- (uint64_t)setExitReason:(uint64_t)result;
- (unint64_t)exitReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSProcessExitContext

- (uint64_t)setExitReason:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBKSProcessExitReason(-[BKSProcessExitContext exitReason](self, "exitReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v3 initWithFormat:@"<%@| reason:%@>", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BKSProcessExitContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKSProcessExitContext;
  v5 = -[BKSProcessExitContext init](&v7, sel_init);
  if (v5) {
    v5->_exitReason = [v4 decodeIntegerForKey:@"_exitReason"];
  }

  return v5;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

@end