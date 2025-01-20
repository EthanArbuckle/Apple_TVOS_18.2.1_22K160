@interface NSPProxyAgentNetworkStatistics
+ (BOOL)supportsSecureCoding;
- (NSPProxyAgentNetworkStatistics)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPProxyAgentNetworkStatistics

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    sub_100043E90(v3, self->_networkCharacteristics, @"Network Characteristics", 0, 14LL);
    sub_100044730(v3, self->_proxyConnectionSuccess, (uint64_t)@"Proxy success", 0, 14);
    sub_100044730(v3, self->_ingressProxyConnectionTimeout, (uint64_t)@"Ingress proxy connection timeout", 0, 14);
    sub_100044730(v3, self->_ingressProxyConnectionRefused, (uint64_t)@"Ingress proxy connection refused", 0, 14);
    sub_100044730( v3,  self->_ingressProxyConnectionHostDown,  (uint64_t)@"Ingress proxy connection host down",  0,  14);
    sub_100044730( v3,  self->_ingressProxyConnectionHostUnreachable,  (uint64_t)@"Ingress proxy connection host unreachable",  0,  14);
    sub_100044730(v3, self->_ingressProxyConnectionError, (uint64_t)@"Ingress proxy connection error", 0, 14);
    sub_100044730(v3, self->_ingressProxyConnectionDNSBlocked, (uint64_t)@"Ingress proxy server DNS error", 0, 14);
    sub_100044730( v3,  self->_ingressProxyConnectionDNSTimeout,  (uint64_t)@"Ingress proxy server DNS timeout",  0,  14);
    sub_100044730(v3, self->_ingressProxyConnectionCertError, (uint64_t)@"Ingress proxy cert error", 0, 14);
    sub_100044730(v3, self->_egressProxyConnectionError, (uint64_t)@"Egress proxy connection error", 0, 14);
    sub_100044730(v3, self->_originProxyConnectionError, (uint64_t)@"Origin proxy connection error", 0, 14);
    sub_100044730(v3, self->_egressProxyUnavailableError, (uint64_t)@"Egress proxy unavailable error", 0, 14);
    sub_100044730(v3, self->_incompleteHandshakeStall, (uint64_t)@"Incomplete handshake stall", 0, 14);
    sub_100044730(v3, self->_postHandshakeStall, (uint64_t)@"Post handshake stall", 0, 14);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxyAgentNetworkStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSPProxyAgentNetworkStatistics;
  v5 = -[NSPProxyAgentNetworkStatistics init](&v14, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v10 forKey:@"ProxyAgentNetworkStatisticsNetworkCharacteristics"]);
    networkCharacteristics = v5->_networkCharacteristics;
    v5->_networkCharacteristics = (NSDictionary *)v11;

    v5->_proxyConnectionSuccess = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsSuccess"];
    v5->_ingressProxyConnectionTimeout = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressConnectionTimeout"];
    v5->_ingressProxyConnectionRefused = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressConnectionRefused"];
    v5->_ingressProxyConnectionHostDown = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressHostDown"];
    v5->_ingressProxyConnectionHostUnreachable = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressHostUnreachable"];
    v5->_ingressProxyConnectionError = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressConnectionError"];
    v5->_ingressProxyConnectionDNSBlocked = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressDNSBlocked"];
    v5->_ingressProxyConnectionDNSTimeout = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressDNSTimeoutError"];
    v5->_ingressProxyConnectionCertError = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIngressConnectionCertError"];
    v5->_egressProxyConnectionError = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsEgressConnectionError"];
    v5->_originProxyConnectionError = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsOriginConnectionError"];
    v5->_egressProxyUnavailableError = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsEgressProxyUnavailableError"];
    v5->_incompleteHandshakeStall = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsIncompleteHandshakeStall"];
    v5->_postHandshakeStall = (unint64_t)[v4 decodeIntegerForKey:@"ProxyAgentNetworkStatisticsPostHandshakeStall"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    networkCharacteristics = self->_networkCharacteristics;
    id v5 = a3;
    [v5 encodeObject:networkCharacteristics forKey:@"ProxyAgentNetworkStatisticsNetworkCharacteristics"];
    [v5 encodeInteger:self->_proxyConnectionSuccess forKey:@"ProxyAgentNetworkStatisticsSuccess"];
    [v5 encodeInteger:self->_ingressProxyConnectionTimeout forKey:@"ProxyAgentNetworkStatisticsIngressConnectionTimeout"];
    [v5 encodeInteger:self->_ingressProxyConnectionRefused forKey:@"ProxyAgentNetworkStatisticsIngressConnectionRefused"];
    [v5 encodeInteger:self->_ingressProxyConnectionHostDown forKey:@"ProxyAgentNetworkStatisticsIngressHostDown"];
    [v5 encodeInteger:self->_ingressProxyConnectionHostUnreachable forKey:@"ProxyAgentNetworkStatisticsIngressHostUnreachable"];
    [v5 encodeInteger:self->_ingressProxyConnectionError forKey:@"ProxyAgentNetworkStatisticsIngressConnectionError"];
    [v5 encodeInteger:self->_ingressProxyConnectionDNSBlocked forKey:@"ProxyAgentNetworkStatisticsIngressDNSBlocked"];
    [v5 encodeInteger:self->_ingressProxyConnectionDNSTimeout forKey:@"ProxyAgentNetworkStatisticsIngressDNSTimeoutError"];
    [v5 encodeInteger:self->_ingressProxyConnectionCertError forKey:@"ProxyAgentNetworkStatisticsIngressConnectionCertError"];
    [v5 encodeInteger:self->_egressProxyConnectionError forKey:@"ProxyAgentNetworkStatisticsEgressConnectionError"];
    [v5 encodeInteger:self->_originProxyConnectionError forKey:@"ProxyAgentNetworkStatisticsOriginConnectionError"];
    [v5 encodeInteger:self->_egressProxyUnavailableError forKey:@"ProxyAgentNetworkStatisticsEgressProxyUnavailableError"];
    [v5 encodeInteger:self->_incompleteHandshakeStall forKey:@"ProxyAgentNetworkStatisticsIncompleteHandshakeStall"];
    unint64_t postHandshakeStall = self->_postHandshakeStall;
  }

  else
  {
    id v7 = a3;
    [v7 encodeObject:0 forKey:@"ProxyAgentNetworkStatisticsNetworkCharacteristics"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsSuccess"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressConnectionTimeout"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressConnectionRefused"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressHostDown"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressHostUnreachable"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressConnectionError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressDNSBlocked"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressDNSTimeoutError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIngressConnectionCertError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsEgressConnectionError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsOriginConnectionError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsEgressProxyUnavailableError"];
    [v7 encodeInteger:0 forKey:@"ProxyAgentNetworkStatisticsIncompleteHandshakeStall"];
    unint64_t postHandshakeStall = 0LL;
  }

  [a3 encodeInteger:postHandshakeStall forKey:@"ProxyAgentNetworkStatisticsPostHandshakeStall"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPProxyAgentNetworkStatistics init]( +[NSPProxyAgentNetworkStatistics allocWithZone:]( &OBJC_CLASS___NSPProxyAgentNetworkStatistics,  "allocWithZone:",  a3),  "init");
  id v5 = v4;
  if (self)
  {
    sub_100011668((uint64_t)v4, self->_networkCharacteristics);
    unint64_t proxyConnectionSuccess = self->_proxyConnectionSuccess;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  sub_100011668((uint64_t)v4, 0LL);
  unint64_t proxyConnectionSuccess = 0LL;
  if (v5) {
LABEL_3:
  }
    v5->_unint64_t proxyConnectionSuccess = proxyConnectionSuccess;
LABEL_4:
  if (self)
  {
    unint64_t ingressProxyConnectionTimeout = self->_ingressProxyConnectionTimeout;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  unint64_t ingressProxyConnectionTimeout = 0LL;
  if (v5) {
LABEL_6:
  }
    v5->_unint64_t ingressProxyConnectionTimeout = ingressProxyConnectionTimeout;
LABEL_7:
  if (self)
  {
    unint64_t ingressProxyConnectionRefused = self->_ingressProxyConnectionRefused;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  unint64_t ingressProxyConnectionRefused = 0LL;
  if (v5) {
LABEL_9:
  }
    v5->_unint64_t ingressProxyConnectionRefused = ingressProxyConnectionRefused;
LABEL_10:
  if (self)
  {
    unint64_t ingressProxyConnectionHostDown = self->_ingressProxyConnectionHostDown;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  unint64_t ingressProxyConnectionHostDown = 0LL;
  if (v5) {
LABEL_12:
  }
    v5->_unint64_t ingressProxyConnectionHostDown = ingressProxyConnectionHostDown;
LABEL_13:
  if (self)
  {
    unint64_t ingressProxyConnectionHostUnreachable = self->_ingressProxyConnectionHostUnreachable;
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  unint64_t ingressProxyConnectionHostUnreachable = 0LL;
  if (v5) {
LABEL_15:
  }
    v5->_unint64_t ingressProxyConnectionHostUnreachable = ingressProxyConnectionHostUnreachable;
LABEL_16:
  if (self)
  {
    unint64_t ingressProxyConnectionError = self->_ingressProxyConnectionError;
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  unint64_t ingressProxyConnectionError = 0LL;
  if (v5) {
LABEL_18:
  }
    v5->_unint64_t ingressProxyConnectionError = ingressProxyConnectionError;
LABEL_19:
  if (self)
  {
    unint64_t ingressProxyConnectionDNSBlocked = self->_ingressProxyConnectionDNSBlocked;
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  unint64_t ingressProxyConnectionDNSBlocked = 0LL;
  if (v5) {
LABEL_21:
  }
    v5->_unint64_t ingressProxyConnectionDNSBlocked = ingressProxyConnectionDNSBlocked;
LABEL_22:
  if (self)
  {
    unint64_t ingressProxyConnectionDNSTimeout = self->_ingressProxyConnectionDNSTimeout;
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  unint64_t ingressProxyConnectionDNSTimeout = 0LL;
  if (v5) {
LABEL_24:
  }
    v5->_unint64_t ingressProxyConnectionDNSTimeout = ingressProxyConnectionDNSTimeout;
LABEL_25:
  if (self)
  {
    unint64_t ingressProxyConnectionCertError = self->_ingressProxyConnectionCertError;
    if (!v5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  unint64_t ingressProxyConnectionCertError = 0LL;
  if (v5) {
LABEL_27:
  }
    v5->_unint64_t ingressProxyConnectionCertError = ingressProxyConnectionCertError;
LABEL_28:
  if (self)
  {
    unint64_t egressProxyConnectionError = self->_egressProxyConnectionError;
    if (!v5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  unint64_t egressProxyConnectionError = 0LL;
  if (v5) {
LABEL_30:
  }
    v5->_unint64_t egressProxyConnectionError = egressProxyConnectionError;
LABEL_31:
  if (self)
  {
    unint64_t originProxyConnectionError = self->_originProxyConnectionError;
    if (!v5) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  unint64_t originProxyConnectionError = 0LL;
  if (v5) {
LABEL_33:
  }
    v5->_unint64_t originProxyConnectionError = originProxyConnectionError;
LABEL_34:
  if (self)
  {
    unint64_t egressProxyUnavailableError = self->_egressProxyUnavailableError;
    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  unint64_t egressProxyUnavailableError = 0LL;
  if (v5) {
LABEL_36:
  }
    v5->_unint64_t egressProxyUnavailableError = egressProxyUnavailableError;
LABEL_37:
  if (self)
  {
    unint64_t incompleteHandshakeStall = self->_incompleteHandshakeStall;
    if (!v5) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  unint64_t incompleteHandshakeStall = 0LL;
  if (v5) {
LABEL_39:
  }
    v5->_unint64_t incompleteHandshakeStall = incompleteHandshakeStall;
LABEL_40:
  if (!self)
  {
    unint64_t postHandshakeStall = 0LL;
    if (!v5) {
      return v5;
    }
    goto LABEL_42;
  }

  unint64_t postHandshakeStall = self->_postHandshakeStall;
  if (v5) {
LABEL_42:
  }
    v5->_unint64_t postHandshakeStall = postHandshakeStall;
  return v5;
}

- (void).cxx_destruct
{
}

@end