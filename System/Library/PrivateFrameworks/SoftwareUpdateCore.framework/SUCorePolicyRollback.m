@interface SUCorePolicyRollback
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPhase;
- (BOOL)performRollbackApplyPhase;
- (BOOL)performRollbackPreparePhase;
- (BOOL)performRollbackResumePhase;
- (BOOL)performRollbackSuspendPhase;
- (BOOL)skipCancelPreviousUpdate;
- (NSDictionary)additionalOptions;
- (NSDictionary)baseRollbackOptions;
- (SUCorePolicyRollback)init;
- (SUCorePolicyRollback)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBaseRollbackOptions:(id)a3;
- (void)setPerformPhase:(BOOL)a3;
- (void)setPerformRollbackApplyPhase:(BOOL)a3;
- (void)setPerformRollbackPreparePhase:(BOOL)a3;
- (void)setPerformRollbackResumePhase:(BOOL)a3;
- (void)setPerformRollbackSuspendPhase:(BOOL)a3;
- (void)setSkipCancelPreviousUpdate:(BOOL)a3;
@end

@implementation SUCorePolicyRollback

- (SUCorePolicyRollback)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyRollback;
  v2 = -[SUCorePolicyRollback init](&v7, sel_init);
  v3 = (SUCorePolicyRollback *)v2;
  if (v2)
  {
    v2[8] = 0;
    *(_DWORD *)(v2 + 9) = 16843009;
    v2[13] = 0;
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0LL;

    baseRollbackOptions = v3->_baseRollbackOptions;
    v3->_baseRollbackOptions = 0LL;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyRollback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyRollback;
  v5 = -[SUCorePolicyRollback init](&v9, sel_init);
  if (v5)
  {
    v5->_performPhase = [v4 decodeBoolForKey:@"PerformPhase"];
    v5->_performRollbackPreparePhase = [v4 decodeBoolForKey:@"PerformPreparePhase"];
    v5->_performRollbackSuspendPhase = [v4 decodeBoolForKey:@"PerformSuspendPhase"];
    v5->_performRollbackResumePhase = [v4 decodeBoolForKey:@"PerformResumePhase"];
    v5->_performRollbackApplyPhase = [v4 decodeBoolForKey:@"PerformApplyPhase"];
    v5->_skipCancelPreviousUpdate = [v4 decodeBoolForKey:@"SkipCancelPreviousUpdate"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;

    baseRollbackOptions = v5->_baseRollbackOptions;
    v5->_baseRollbackOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback performPhase](self, "performPhase"),  @"PerformPhase");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"),  @"PerformPreparePhase");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"),  @"PerformSuspendPhase");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"),  @"PerformResumePhase");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"),  @"PerformApplyPhase");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"),  @"SkipCancelPreviousUpdate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPerformPhase:", -[SUCorePolicyRollback performPhase](self, "performPhase"));
  objc_msgSend( v5,  "setPerformRollbackPreparePhase:",  -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"));
  objc_msgSend( v5,  "setPerformRollbackSuspendPhase:",  -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"));
  objc_msgSend( v5,  "setPerformRollbackResumePhase:",  -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"));
  objc_msgSend( v5,  "setPerformRollbackApplyPhase:",  -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"));
  objc_msgSend( v5,  "setSkipCancelPreviousUpdate:",  -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"));
  v6 = -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBaseRollbackOptions:v7];
  v8 = -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyRollback *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      BOOL v6 = -[SUCorePolicyRollback performPhase](v5, "performPhase");
      if (v6 == -[SUCorePolicyRollback performPhase](self, "performPhase")
        && (BOOL v7 = -[SUCorePolicyRollback performRollbackPreparePhase](v5, "performRollbackPreparePhase"),
            v7 == -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"))
        && (BOOL v8 = -[SUCorePolicyRollback performRollbackSuspendPhase](v5, "performRollbackSuspendPhase"),
            v8 == -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"))
        && (BOOL v9 = -[SUCorePolicyRollback performRollbackResumePhase](v5, "performRollbackResumePhase"),
            v9 == -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"))
        && (BOOL v10 = -[SUCorePolicyRollback performRollbackApplyPhase](v5, "performRollbackApplyPhase"),
            v10 == -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase")))
      {
        BOOL v13 = -[SUCorePolicyRollback skipCancelPreviousUpdate](v5, "skipCancelPreviousUpdate");
        int v11 = v13 ^ -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate") ^ 1;
      }

      else
      {
        LOBYTE(v11) = 0;
      }
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)description
{
  v16 = (void *)NSString;
  v3 = @"NO";
  if (-[SUCorePolicyRollback performPhase](self, "performPhase")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v15 = v4;
  if (-[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (-[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase")) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if (-[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase")) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if (-[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase")) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if (-[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate")) {
    v3 = @"YES";
  }
  -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = @"none";
  if (v9)
  {
    -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
    [v16 stringWithFormat:@"SUCorePolicyRollback(performPhase:%@|performRollbackPreparePhase:%@|performRollbackSuspendPhase:%@|performRollbackResumePhase:%@|performRollbackApplyPhase:%@|skipCancelPreviousUpdate:%@|baseRollbackOptions:%@|additionalOptions:%@)", v15, v5, v6, v7, v8, v3, v10, v12];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v16 stringWithFormat:@"SUCorePolicyRollback(performPhase:%@|performRollbackPreparePhase:%@|performRollbackSuspendPhase:%@|performRollbackResumePhase:%@|performRollbackApplyPhase:%@|skipCancelPreviousUpdate:%@|baseRollbackOptions:%@|additionalOptions:%@)", v15, v5, v6, v7, v8, v3, v10, @"none"];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9) {
  return v13;
  }
}

- (id)summary
{
  if (-[SUCorePolicyRollback performPhase](self, "performPhase"))
  {
    [&stru_18A0F22B0 stringByAppendingString:@"|performPhase"];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"))
  {
    uint64_t v4 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|performRollbackPreparePhase");

    v3 = (__CFString *)v4;
  }

  if (-[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|performRollbackSuspendPhase");

    v3 = (__CFString *)v5;
  }

  if (-[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"))
  {
    uint64_t v6 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|performRollbackResumePhase");

    v3 = (__CFString *)v6;
  }

  if (-[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"))
  {
    uint64_t v7 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|performRollbackApplyPhase");

    v3 = (__CFString *)v7;
  }

  if (-[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"))
  {
    uint64_t v8 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|skipCancelPreviousUpdate");

    v3 = (__CFString *)v8;
  }

  -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    BOOL v10 = @"|withBaseRollbackOptions";
  }
  else {
    BOOL v10 = @"|noBaseRollbackOptions";
  }
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v10);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  if (v12) {
    BOOL v13 = @"|withAdditionalOptions";
  }
  else {
    BOOL v13 = @"|noAdditionalOptions";
  }
  [v11 stringByAppendingString:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v14 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v15 = [v14 stringByAppendingString:@"|"];

    v14 = (void *)v15;
  }

  return v14;
}

- (BOOL)performPhase
{
  return self->_performPhase;
}

- (void)setPerformPhase:(BOOL)a3
{
  self->_performPhase = a3;
}

- (BOOL)performRollbackPreparePhase
{
  return self->_performRollbackPreparePhase;
}

- (void)setPerformRollbackPreparePhase:(BOOL)a3
{
  self->_performRollbackPreparePhase = a3;
}

- (BOOL)performRollbackSuspendPhase
{
  return self->_performRollbackSuspendPhase;
}

- (void)setPerformRollbackSuspendPhase:(BOOL)a3
{
  self->_performRollbackSuspendPhase = a3;
}

- (BOOL)performRollbackResumePhase
{
  return self->_performRollbackResumePhase;
}

- (void)setPerformRollbackResumePhase:(BOOL)a3
{
  self->_performRollbackResumePhase = a3;
}

- (BOOL)performRollbackApplyPhase
{
  return self->_performRollbackApplyPhase;
}

- (void)setPerformRollbackApplyPhase:(BOOL)a3
{
  self->_performRollbackApplyPhase = a3;
}

- (BOOL)skipCancelPreviousUpdate
{
  return self->_skipCancelPreviousUpdate;
}

- (void)setSkipCancelPreviousUpdate:(BOOL)a3
{
  self->_skipCancelPreviousUpdate = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (NSDictionary)baseRollbackOptions
{
  return self->_baseRollbackOptions;
}

- (void)setBaseRollbackOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end