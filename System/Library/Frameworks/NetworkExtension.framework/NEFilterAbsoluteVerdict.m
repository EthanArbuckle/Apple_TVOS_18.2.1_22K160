@interface NEFilterAbsoluteVerdict
+ (BOOL)supportsSecureCoding;
- (NEFilterAbsoluteVerdict)initWithCoder:(id)a3;
- (NEFilterAbsoluteVerdict)initWithDrop:(BOOL)a3 inboundPassOffset:(unint64_t)a4 inboundPeekOffset:(unint64_t)a5 outboundPassOffset:(unint64_t)a6 outboundPeekOffset:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (int64_t)statisticsReportFrequency;
- (unint64_t)inboundPassOffset;
- (unint64_t)inboundPeekOffset;
- (unint64_t)outboundPassOffset;
- (unint64_t)outboundPeekOffset;
- (void)encodeWithCoder:(id)a3;
- (void)setInboundPassOffset:(unint64_t)a3;
- (void)setInboundPeekOffset:(unint64_t)a3;
- (void)setOutboundPassOffset:(unint64_t)a3;
- (void)setOutboundPeekOffset:(unint64_t)a3;
- (void)setStatisticsReportFrequency:(int64_t)a3;
@end

@implementation NEFilterAbsoluteVerdict

- (NEFilterAbsoluteVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_inboundPassOffset = [v4 decodeInt64ForKey:@"Inbound pass offset"];
    v5->_inboundPeekOffset = [v4 decodeInt64ForKey:@"Inbound peek offset"];
    v5->_outboundPassOffset = [v4 decodeInt64ForKey:@"Outbound pass offset"];
    v5->_outboundPeekOffset = [v4 decodeInt64ForKey:@"Outbound peek offset"];
    v5->_statisticsReportFrequency = (int)[v4 decodeIntForKey:@"StatisticsReportFrequency"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  id v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset", v5.receiver, v5.super_class),  @"Inbound pass offset");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"),  @"Inbound peek offset");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"),  @"Outbound pass offset");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"),  @"Outbound peek offset");
  objc_msgSend( v4,  "encodeInt:forKey:",  -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency"),  @"StatisticsReportFrequency");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  id v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInboundPassOffset:", -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset"));
  objc_msgSend(v4, "setInboundPeekOffset:", -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"));
  objc_msgSend(v4, "setOutboundPassOffset:", -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"));
  objc_msgSend(v4, "setOutboundPeekOffset:", -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"));
  objc_msgSend( v4,  "setStatisticsReportFrequency:",  -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (NEFilterAbsoluteVerdict)initWithDrop:(BOOL)a3 inboundPassOffset:(unint64_t)a4 inboundPeekOffset:(unint64_t)a5 outboundPassOffset:(unint64_t)a6 outboundPeekOffset:(unint64_t)a7
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  result = -[NEFilterVerdict initWithDrop:remediate:](&v12, sel_initWithDrop_remediate_, a3, 0LL);
  if (result)
  {
    result->_inboundPassOffset = a4;
    result->_inboundPeekOffset = a5;
    result->_outboundPassOffset = a6;
    result->_outboundPeekOffset = a7;
  }

  return result;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset"),  @"inboundPassOffset",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"),  @"inboundPeekOffset",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"),  @"outboundPassOffset",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"),  @"outboundPeekOffset",  v5,  a4);
  int64_t v8 = -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
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
  v4.super_class = (Class)&OBJC_CLASS___NEFilterAbsoluteVerdict;
  int64_t result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset") == -1
      && -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset") == -1)
    {
      return 1LL;
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

- (unint64_t)inboundPassOffset
{
  return self->_inboundPassOffset;
}

- (void)setInboundPassOffset:(unint64_t)a3
{
  self->_inboundPassOffset = a3;
}

- (unint64_t)inboundPeekOffset
{
  return self->_inboundPeekOffset;
}

- (void)setInboundPeekOffset:(unint64_t)a3
{
  self->_inboundPeekOffset = a3;
}

- (unint64_t)outboundPassOffset
{
  return self->_outboundPassOffset;
}

- (void)setOutboundPassOffset:(unint64_t)a3
{
  self->_outboundPassOffset = a3;
}

- (unint64_t)outboundPeekOffset
{
  return self->_outboundPeekOffset;
}

- (void)setOutboundPeekOffset:(unint64_t)a3
{
  self->_outboundPeekOffset = a3;
}

- (int64_t)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (void)setStatisticsReportFrequency:(int64_t)a3
{
  self->_statisticsReportFrequency = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end