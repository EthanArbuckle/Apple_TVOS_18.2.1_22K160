@interface NEFilterNewFlowVerdict
+ (BOOL)supportsSecureCoding;
+ (NEFilterNewFlowVerdict)URLAppendStringVerdictWithMapKey:(NSString *)urlAppendMapKey;
+ (NEFilterNewFlowVerdict)allowVerdict;
+ (NEFilterNewFlowVerdict)dropVerdict;
+ (NEFilterNewFlowVerdict)filterDataVerdictWithFilterInbound:(BOOL)filterInbound peekInboundBytes:(NSUInteger)peekInboundBytes filterOutbound:(BOOL)filterOutbound peekOutboundBytes:(NSUInteger)peekOutboundBytes;
+ (NEFilterNewFlowVerdict)needRulesVerdict;
+ (NEFilterNewFlowVerdict)pauseVerdict;
+ (NEFilterNewFlowVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey;
- (BOOL)filterInbound;
- (BOOL)filterOutbound;
- (NEFilterNewFlowVerdict)initWithCoder:(id)a3;
- (NEFilterReportFrequency)statisticsReportFrequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (unint64_t)peekInboundBytes;
- (unint64_t)peekOutboundBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterInbound:(BOOL)a3;
- (void)setFilterOutbound:(BOOL)a3;
- (void)setPeekInboundBytes:(unint64_t)a3;
- (void)setPeekOutboundBytes:(unint64_t)a3;
- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency;
@end

@implementation NEFilterNewFlowVerdict

- (NEFilterNewFlowVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEFilterNewFlowVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_filterInbound = [v4 decodeBoolForKey:@"FilterInbound"];
    v5->_filterOutbound = [v4 decodeBoolForKey:@"FilterOutbound"];
    v5->_peekInboundBytes = [v4 decodeInt64ForKey:@"PeekInboundBytes"];
    v5->_peekOutboundBytes = [v4 decodeInt64ForKey:@"PeekOutboundBytes"];
    v5->_statisticsReportFrequency = (int)[v4 decodeIntForKey:@"StatisticsReportFrequency"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEFilterNewFlowVerdict;
  id v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound", v5.receiver, v5.super_class),  @"FilterInbound");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"),  @"FilterOutbound");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"),  @"PeekInboundBytes");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"),  @"PeekOutboundBytes");
  objc_msgSend( v4,  "encodeInt:forKey:",  -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"),  @"StatisticsReportFrequency");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEFilterNewFlowVerdict;
  id v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFilterInbound:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"));
  objc_msgSend(v4, "setFilterOutbound:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"));
  objc_msgSend(v4, "setPeekInboundBytes:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"));
  objc_msgSend(v4, "setPeekOutboundBytes:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"));
  objc_msgSend( v4,  "setStatisticsReportFrequency:",  -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterNewFlowVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"),  @"filterInbound",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"),  @"peekInboundBytes",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"),  @"filterOutbound",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"),  @"peekOutboundBytes",  v5,  a4);
  NEFilterReportFrequency v8 = -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
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
  v4.super_class = (Class)&OBJC_CLASS___NEFilterNewFlowVerdict;
  int64_t result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterNewFlowVerdict filterInbound](self, "filterInbound")
      || -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"))
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

- (BOOL)filterInbound
{
  return self->_filterInbound;
}

- (void)setFilterInbound:(BOOL)a3
{
  self->_filterInbound = a3;
}

- (BOOL)filterOutbound
{
  return self->_filterOutbound;
}

- (void)setFilterOutbound:(BOOL)a3
{
  self->_filterOutbound = a3;
}

- (unint64_t)peekInboundBytes
{
  return self->_peekInboundBytes;
}

- (void)setPeekInboundBytes:(unint64_t)a3
{
  self->_peekInboundBytes = a3;
}

- (unint64_t)peekOutboundBytes
{
  return self->_peekOutboundBytes;
}

- (void)setPeekOutboundBytes:(unint64_t)a3
{
  self->_peekOutboundBytes = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEFilterNewFlowVerdict)needRulesVerdict
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setNeedRules:1];
  return (NEFilterNewFlowVerdict *)v2;
}

+ (NEFilterNewFlowVerdict)allowVerdict
{
  v2 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterNewFlowVerdict),  "initWithDrop:remediate:",  0LL,  0LL);
  -[NEFilterNewFlowVerdict setFilterInbound:](v2, "setFilterInbound:", 0LL);
  -[NEFilterNewFlowVerdict setFilterOutbound:](v2, "setFilterOutbound:", 0LL);
  return v2;
}

+ (NEFilterNewFlowVerdict)dropVerdict
{
  return  -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterNewFlowVerdict),  "initWithDrop:remediate:",  1LL,  0LL);
}

+ (NEFilterNewFlowVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  uint64_t v5 = remediationURLMapKey;
  objc_super v6 = remediationButtonTextMapKey;
  objc_super v7 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterNewFlowVerdict),  "initWithDrop:remediate:",  1LL,  1LL);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16LL);
    objc_setProperty_atomic(v9, v10, v6, 24LL);
  }

  return v9;
}

+ (NEFilterNewFlowVerdict)URLAppendStringVerdictWithMapKey:(NSString *)urlAppendMapKey
{
  v3 = urlAppendMapKey;
  +[NEFilterNewFlowVerdict allowVerdict](&OBJC_CLASS___NEFilterNewFlowVerdict, "allowVerdict");
  objc_super v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v4;
  if (v4)
  {
    v4[12] = 1;
    objc_setProperty_atomic(v4, v5, v3, 32LL);
  }

  return (NEFilterNewFlowVerdict *)v6;
}

+ (NEFilterNewFlowVerdict)filterDataVerdictWithFilterInbound:(BOOL)filterInbound peekInboundBytes:(NSUInteger)peekInboundBytes filterOutbound:(BOOL)filterOutbound peekOutboundBytes:(NSUInteger)peekOutboundBytes
{
  BOOL v7 = filterOutbound;
  BOOL v9 = filterInbound;
  SEL v10 = -[NEFilterVerdict initWithDrop:remediate:]( objc_alloc(&OBJC_CLASS___NEFilterNewFlowVerdict),  "initWithDrop:remediate:",  0LL,  0LL);
  -[NEFilterNewFlowVerdict setFilterInbound:](v10, "setFilterInbound:", v9);
  -[NEFilterNewFlowVerdict setPeekInboundBytes:](v10, "setPeekInboundBytes:", peekInboundBytes);
  -[NEFilterNewFlowVerdict setFilterOutbound:](v10, "setFilterOutbound:", v7);
  -[NEFilterNewFlowVerdict setPeekOutboundBytes:](v10, "setPeekOutboundBytes:", peekOutboundBytes);
  return v10;
}

+ (NEFilterNewFlowVerdict)pauseVerdict
{
  v2 = objc_alloc(&OBJC_CLASS___NEFilterNewFlowVerdict);
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