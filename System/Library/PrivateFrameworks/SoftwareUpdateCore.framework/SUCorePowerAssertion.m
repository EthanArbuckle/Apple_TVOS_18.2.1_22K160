@interface SUCorePowerAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SUCorePowerAssertion)init;
- (SUCorePowerAssertion)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int)activeAssertionCount;
- (unsigned)assertionID;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAssertionCount:(int)a3;
- (void)setAssertionID:(unsigned int)a3;
@end

@implementation SUCorePowerAssertion

- (SUCorePowerAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUCorePowerAssertion;
  result = -[SUCorePowerAssertion init](&v3, sel_init);
  if (result) {
    *(void *)&result->_activeAssertionCount = 0xFFFFFFFF00000000LL;
  }
  return result;
}

- (SUCorePowerAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePowerAssertion;
  v5 = -[SUCorePowerAssertion init](&v7, sel_init);
  if (v5)
  {
    v5->_activeAssertionCount = [v4 decodeIntegerForKey:@"activeAssertionCount"];
    v5->_assertionID = [v4 decodeIntegerForKey:@"assertionID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"),  @"activeAssertionCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  (int)-[SUCorePowerAssertion assertionID](self, "assertionID"),  @"assertionID");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePowerAssertion *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      int v6 = -[SUCorePowerAssertion activeAssertionCount](v5, "activeAssertionCount");
      if (v6 == -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"))
      {
        unsigned int v7 = -[SUCorePowerAssertion assertionID](v5, "assertionID");
        BOOL v8 = v7 == -[SUCorePowerAssertion assertionID](self, "assertionID");
      }

      else
      {
        BOOL v8 = 0;
      }
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"\n[>>>\n    activeAssertionCount: %d\n             assertionID: %d\n<<<]",  -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"),  -[SUCorePowerAssertion assertionID](self, "assertionID"));
}

- (id)summary
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"active:%d ID:%d",  -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"),  -[SUCorePowerAssertion assertionID](self, "assertionID"));
}

- (int)activeAssertionCount
{
  return self->_activeAssertionCount;
}

- (void)setActiveAssertionCount:(int)a3
{
  self->_activeAssertionCount = a3;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

@end