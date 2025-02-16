@interface CSDPauseDigits
- (BOOL)isHardPause;
- (CSDPauseDigits)init;
- (CSDPauseDigits)initWithDigits:(id)a3 isHardPause:(BOOL)a4;
- (NSString)digits;
- (id)description;
- (void)setDigits:(id)a3;
- (void)setHardPause:(BOOL)a3;
@end

@implementation CSDPauseDigits

- (CSDPauseDigits)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDPauseDigits.m",  21,  @"%s is not available. Use a designated initializer instead.",  "-[CSDPauseDigits init]");

  return 0LL;
}

- (CSDPauseDigits)initWithDigits:(id)a3 isHardPause:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDPauseDigits;
  v8 = -[CSDPauseDigits init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_digits, a3);
    v9->_hardPause = a4;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigits digits](self, "digits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p digits=%@ isHardPause=%d>",  v3,  self,  v4,  -[CSDPauseDigits isHardPause](self, "isHardPause")));

  return v5;
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (BOOL)isHardPause
{
  return self->_hardPause;
}

- (void)setHardPause:(BOOL)a3
{
  self->_hardPause = a3;
}

- (void).cxx_destruct
{
}

@end