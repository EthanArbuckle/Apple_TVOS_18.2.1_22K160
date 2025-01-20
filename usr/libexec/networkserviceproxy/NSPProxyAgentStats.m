@interface NSPProxyAgentStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)egressProxyLowWaterMarkHitCount;
- (unint64_t)egressProxyTokensAdded;
- (unint64_t)ingressProxyLowWaterMarkHitCount;
- (unint64_t)ingressProxyTokensAdded;
- (void)setEgressProxyLowWaterMarkHitCount:(unint64_t)a3;
- (void)setEgressProxyTokensAdded:(unint64_t)a3;
- (void)setIngressProxyLowWaterMarkHitCount:(unint64_t)a3;
- (void)setIngressProxyTokensAdded:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPProxyAgentStats

- (id)eventName
{
  return @"com.apple.nsp.proxyAgentStats";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyAgentStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"TierType");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProxyAgentStats ingressProxyTokensAdded](self, "ingressProxyTokensAdded")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"IngressProxyTokensAdded");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProxyAgentStats egressProxyTokensAdded](self, "egressProxyTokensAdded")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"EgressProxyTokensAdded");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProxyAgentStats ingressProxyLowWaterMarkHitCount](self, "ingressProxyLowWaterMarkHitCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"IngressProxyLowWaterMarkEventHitCount");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPProxyAgentStats egressProxyLowWaterMarkHitCount](self, "egressProxyLowWaterMarkHitCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"EgressProxyLowWaterMarkEventHitCount");

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)ingressProxyTokensAdded
{
  return self->_ingressProxyTokensAdded;
}

- (void)setIngressProxyTokensAdded:(unint64_t)a3
{
  self->_ingressProxyTokensAdded = a3;
}

- (unint64_t)egressProxyTokensAdded
{
  return self->_egressProxyTokensAdded;
}

- (void)setEgressProxyTokensAdded:(unint64_t)a3
{
  self->_egressProxyTokensAdded = a3;
}

- (unint64_t)ingressProxyLowWaterMarkHitCount
{
  return self->_ingressProxyLowWaterMarkHitCount;
}

- (void)setIngressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_ingressProxyLowWaterMarkHitCount = a3;
}

- (unint64_t)egressProxyLowWaterMarkHitCount
{
  return self->_egressProxyLowWaterMarkHitCount;
}

- (void)setEgressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_egressProxyLowWaterMarkHitCount = a3;
}

- (void).cxx_destruct
{
}

@end