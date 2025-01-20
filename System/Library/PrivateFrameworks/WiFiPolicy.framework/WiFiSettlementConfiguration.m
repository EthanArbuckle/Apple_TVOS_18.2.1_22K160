@interface WiFiSettlementConfiguration
- (WiFiSettlementConfiguration)init;
- (double)highConfidenceSettlementTime;
- (double)lowConfidenceSettlementTime;
- (id)description;
- (unint64_t)maxNetworksForSettlement;
- (unint64_t)maxScansWithoutMatchForUnsettlement;
- (void)setHighConfidenceSettlementTime:(double)a3;
- (void)setLowConfidenceSettlementTime:(double)a3;
- (void)setMaxNetworksForSettlement:(unint64_t)a3;
- (void)setMaxScansWithoutMatchForUnsettlement:(unint64_t)a3;
@end

@implementation WiFiSettlementConfiguration

- (WiFiSettlementConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiSettlementConfiguration;
  result = -[WiFiSettlementConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxScansWithoutMatchForUnsettlement = xmmword_187F837C0;
    *(_OWORD *)&result->_lowConfidenceSettlementTime = xmmword_187F837D0;
  }

  return result;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v6,  "appendFormat:",  @"maxNetworks: %lu ",  -[WiFiSettlementConfiguration maxNetworksForSettlement](self, "maxNetworksForSettlement"));
  objc_msgSend( v6,  "appendFormat:",  @"maxScans: %lu ",  -[WiFiSettlementConfiguration maxScansWithoutMatchForUnsettlement](self, "maxScansWithoutMatchForUnsettlement"));
  -[WiFiSettlementConfiguration lowConfidenceSettlementTime](self, "lowConfidenceSettlementTime");
  objc_msgSend(v6, "appendFormat:", @"low: %f ", v7);
  -[WiFiSettlementConfiguration highConfidenceSettlementTime](self, "highConfidenceSettlementTime");
  objc_msgSend(v6, "appendFormat:", @"high: %f", v8);
  [v6 appendString:@">"];
  return v6;
}

- (unint64_t)maxScansWithoutMatchForUnsettlement
{
  return self->_maxScansWithoutMatchForUnsettlement;
}

- (void)setMaxScansWithoutMatchForUnsettlement:(unint64_t)a3
{
  self->_maxScansWithoutMatchForUnsettlement = a3;
}

- (unint64_t)maxNetworksForSettlement
{
  return self->_maxNetworksForSettlement;
}

- (void)setMaxNetworksForSettlement:(unint64_t)a3
{
  self->_maxNetworksForSettlement = a3;
}

- (double)lowConfidenceSettlementTime
{
  return self->_lowConfidenceSettlementTime;
}

- (void)setLowConfidenceSettlementTime:(double)a3
{
  self->_lowConfidenceSettlementTime = a3;
}

- (double)highConfidenceSettlementTime
{
  return self->_highConfidenceSettlementTime;
}

- (void)setHighConfidenceSettlementTime:(double)a3
{
  self->_highConfidenceSettlementTime = a3;
}

@end