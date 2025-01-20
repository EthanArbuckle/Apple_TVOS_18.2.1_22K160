@interface __CFN_ConnectionMetrics
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)tlsMetadataReceived:(_WORD *)a1;
@end

@implementation __CFN_ConnectionMetrics

- (id).cxx_construct
{
  *((void *)self + 23) = 0LL;
  *((void *)self + 24) = 0LL;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_transportConnection.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_establishmentReport, 0LL);
  objc_storeStrong((id *)&self->_networkProtocolName, 0LL);
  objc_storeStrong((id *)&self->_interfaceName, 0LL);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0LL);
  objc_storeStrong((id *)&self->_localEndpoint, 0LL);
  objc_storeStrong((id *)&self->_endpoint, 0LL);
  objc_storeStrong((id *)&self->_initiatingTransactionID, 0LL);
  objc_storeStrong((id *)&self->_UUID, 0LL);
  objc_storeStrong((id *)&self->_cachedSubflowCounts, 0LL);
  objc_storeStrong((id *)&self->_cachedTCPInfoAtEnd, 0LL);
  objc_storeStrong((id *)&self->_connection, 0LL);
}

- (void)tlsMetadataReceived:(_WORD *)a1
{
  v3 = a2;
  if (a1)
  {
    metadata = v3;
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(v3);
    if (negotiated_protocol)
    {
      [NSString stringWithUTF8String:negotiated_protocol];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic_copy(a1, v6, v5, 160LL);
    }

    a1[14] = sec_protocol_metadata_get_negotiated_tls_protocol_version(metadata);
    a1[15] = sec_protocol_metadata_get_negotiated_tls_ciphersuite(metadata);
    v3 = metadata;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v11 encodeObject:Property forKey:@"UUID"];
  [v11 encodeInt64:self->_identifier forKey:@"identifier"];
  [v11 encodeObject:self->_initiatingTransactionID forKey:@"initiatingTransactionID"];
  [v11 encodeDouble:@"beginTime" forKey:self->_beginTime];
  [v11 encodeDouble:@"establishTime" forKey:self->_establishTime];
  [v11 encodeDouble:@"endTime" forKey:self->_endTime];
  if (self->_endpoint)
  {
    objc_msgSend(MEMORY[0x189608DF0], "endpointWithCEndpoint:");
    SEL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 encodeObject:v6 forKey:@"endpoint"];
  }

  [v11 encodeBool:self->_TLSConfigured forKey:@"TLSConfigured"];
  [v11 encodeInteger:self->_http3DiscoveryStatus forKey:@"http3DiscoveryStatus"];
  if (self->_localEndpoint)
  {
    objc_msgSend(MEMORY[0x189608DF0], "endpointWithCEndpoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 encodeObject:v7 forKey:@"localEndpoint"];
  }

  if (self->_remoteEndpoint)
  {
    objc_msgSend(MEMORY[0x189608DF0], "endpointWithCEndpoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 encodeObject:v8 forKey:@"remoteEndpoint"];
  }

  [v11 encodeObject:self->_interfaceName forKey:@"interfaceName"];
  [v11 encodeBool:self->_cellular forKey:@"cellular"];
  [v11 encodeBool:self->_expensive forKey:@"expensive"];
  [v11 encodeBool:self->_constrained forKey:@"constrained"];
  [v11 encodeBool:self->_multipath forKey:@"multipath"];
  [v11 encodeBool:self->_usedTFO forKey:@"usedTFO"];
  [v11 encodeBool:self->_isUnlistedTracker forKey:@"isUnlistedTracker"];
  objc_msgSend(v11, "encodeObject:forKey:", objc_getProperty(self, v9, 160, 1), @"networkProtocolName");
  [v11 encodeInt:self->_negotiatedTLSProtocolVersion forKey:@"negotiatedTLSProtocolVersion"];
  [v11 encodeInt:self->_negotiatedTLSCipherSuite forKey:@"negotiatedTLSCipherSuite"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_establishmentReport)
  {
    v10 = (void *)nw_establishment_report_copy_dictionary();
    [v11 encodeXPCObject:v10 forKey:@"establishmentReport"];
  }

  [v11 encodeInt:self->_privacyStance forKey:@"privacyStance"];
  [v11 encodeDouble:@"idleAtTime" forKey:self->_idleAtTime];
}

@end