@interface NEFilterDataVerdict
+ (BOOL)supportsSecureCoding;
+ (NEFilterDataVerdict)allowVerdict;
+ (NEFilterDataVerdict)dataVerdictWithPassBytes:(NSUInteger)passBytes peekBytes:(NSUInteger)peekBytes;
+ (NEFilterDataVerdict)dropVerdict;
+ (NEFilterDataVerdict)needRulesVerdict;
+ (NEFilterDataVerdict)pauseVerdict;
+ (NEFilterDataVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey;
- (NEFilterDataVerdict)initWithCoder:(id)a3;
- (NEFilterReportFrequency)statisticsReportFrequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (unint64_t)passBytes;
- (unint64_t)peekBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setPassBytes:(unint64_t)a3;
- (void)setPeekBytes:(unint64_t)a3;
- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency;
@end

@implementation NEFilterDataVerdict

- (NEFilterDataVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEFilterDataVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_passBytes = [v4 decodeInt64ForKey:@"PassBytes"];
    v5->_peekBytes = [v4 decodeInt64ForKey:@"PeekBytes"];
    v5->_statisticsReportFrequency = (int)[v4 decodeIntForKey:@"StatisticsReportFrequency"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEFilterDataVerdict;
  id v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterDataVerdict passBytes](self, "passBytes", v5.receiver, v5.super_class),  @"PassBytes");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"), @"PeekBytes");
  objc_msgSend( v4,  "encodeInt:forKey:",  -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"),  @"StatisticsReportFrequency");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEFilterDataVerdict;
  id v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPassBytes:", -[NEFilterDataVerdict passBytes](self, "passBytes"));
  objc_msgSend(v4, "setPeekBytes:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"));
  objc_msgSend( v4,  "setStatisticsReportFrequency:",  -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterDataVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterDataVerdict passBytes](self, "passBytes"),  @"passBytes",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterDataVerdict peekBytes](self, "peekBytes"),  @"peekBytes",  v5,  a4);
  NEFilterReportFrequency v8 = -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
  objc_opt_self();
  else {
    v9 = off_18A08C500[v8 - 1];
  }
  [v7 appendPrettyObject:v9 withName:@"statisticsReportFrequency" andIndent:v5 options:a4];
  return v7;
}

- (int64_t)filterAction
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEFilterDataVerdict;
  int64_t result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterVerdict drop](self, "drop")
      || self && self->super._remediate
      || -[NEFilterDataVerdict passBytes](self, "passBytes") != -1)
    {
      return 4LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (NEFilterReportFrequency)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency
{
  self->_statisticsReportFrequency = statisticsReportFrequency;
}

- (unint64_t)passBytes
{
  return self->_passBytes;
}

- (void)setPassBytes:(unint64_t)a3
{
  self->_passBytes = a3;
}

- (unint64_t)peekBytes
{
  return self->_peekBytes;
}

- (void)setPeekBytes:(unint64_t)a3
{
  self->_peekBytes = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEFilterDataVerdict)needRulesVerdict
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setNeedRules:1];
  return (NEFilterDataVerdict *)v2;
}

+ (NEFilterDataVerdict)allowVerdict
{
  v2 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterDataVerdict),  "initWithDrop:remediate:",  0LL,  0LL);
  -[NEFilterDataVerdict setPassBytes:](v2, "setPassBytes:", -1LL);
  return v2;
}

+ (NEFilterDataVerdict)dropVerdict
{
  return  -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterDataVerdict),  "initWithDrop:remediate:",  1LL,  0LL);
}

+ (NEFilterDataVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  uint64_t v5 = remediationURLMapKey;
  objc_super v6 = remediationButtonTextMapKey;
  objc_super v7 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterDataVerdict),  "initWithDrop:remediate:",  1LL,  1LL);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16LL);
    objc_setProperty_atomic(v9, v10, v6, 24LL);
  }

  return v9;
}

+ (NEFilterDataVerdict)dataVerdictWithPassBytes:(NSUInteger)passBytes peekBytes:(NSUInteger)peekBytes
{
  objc_super v6 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterDataVerdict),  "initWithDrop:remediate:",  0LL,  0LL);
  -[NEFilterDataVerdict setPassBytes:](v6, "setPassBytes:", passBytes);
  -[NEFilterDataVerdict setPeekBytes:](v6, "setPeekBytes:", peekBytes);
  return v6;
}

+ (NEFilterDataVerdict)pauseVerdict
{
  v2 = objc_alloc(&OBJC_CLASS___NEFilterDataVerdict);
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)&OBJC_CLASS___NEFilterVerdict;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2) {
      v2->super._pause = 1;
    }
  }

  return v2;
}

@end