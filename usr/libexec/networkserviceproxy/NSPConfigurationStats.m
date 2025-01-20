@interface NSPConfigurationStats
- (BOOL)appMetricsEnabled;
- (BOOL)appTrackersEnabled;
- (BOOL)appleCertificatesEnabled;
- (BOOL)brandedCallingEnabled;
- (BOOL)configurationEnabled;
- (BOOL)dnsEnabled;
- (BOOL)exposureNotificationsEnabled;
- (BOOL)knownTrackersEnabled;
- (BOOL)launchWarningDetailsEnabled;
- (BOOL)mailTrackersEnabled;
- (BOOL)metricsUploadEnabled;
- (BOOL)networkToolsEnabled;
- (BOOL)newsEmbeddedContentEnabled;
- (BOOL)newsURLResolutionEnabled;
- (BOOL)passwordManagerIconFetchEnabled;
- (BOOL)postbackFetchEnabled;
- (BOOL)promotedContentEnabled;
- (BOOL)safariAllEnabled;
- (BOOL)safariDNSEnabled;
- (BOOL)safariHTTPEnabled;
- (BOOL)safariMetricsEnabled;
- (BOOL)safariPrivateAllEnabled;
- (BOOL)safariPrivateDNSEnabled;
- (BOOL)safariPrivateUnencryptedEnabled;
- (BOOL)safariTrackersEnabled;
- (BOOL)safariUnencryptedEnabled;
- (BOOL)tokenFetchEnabled;
- (BOOL)unencryptedEnabled;
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configurationVersion;
- (void)setAppMetricsEnabled:(BOOL)a3;
- (void)setAppTrackersEnabled:(BOOL)a3;
- (void)setAppleCertificatesEnabled:(BOOL)a3;
- (void)setBrandedCallingEnabled:(BOOL)a3;
- (void)setConfigurationEnabled:(BOOL)a3;
- (void)setConfigurationVersion:(unint64_t)a3;
- (void)setDnsEnabled:(BOOL)a3;
- (void)setExposureNotificationsEnabled:(BOOL)a3;
- (void)setKnownTrackersEnabled:(BOOL)a3;
- (void)setLaunchWarningDetailsEnabled:(BOOL)a3;
- (void)setMailTrackersEnabled:(BOOL)a3;
- (void)setMetricsUploadEnabled:(BOOL)a3;
- (void)setNetworkToolsEnabled:(BOOL)a3;
- (void)setNewsEmbeddedContentEnabled:(BOOL)a3;
- (void)setNewsURLResolutionEnabled:(BOOL)a3;
- (void)setPasswordManagerIconFetchEnabled:(BOOL)a3;
- (void)setPostbackFetchEnabled:(BOOL)a3;
- (void)setPromotedContentEnabled:(BOOL)a3;
- (void)setSafariAllEnabled:(BOOL)a3;
- (void)setSafariDNSEnabled:(BOOL)a3;
- (void)setSafariHTTPEnabled:(BOOL)a3;
- (void)setSafariMetricsEnabled:(BOOL)a3;
- (void)setSafariPrivateAllEnabled:(BOOL)a3;
- (void)setSafariPrivateDNSEnabled:(BOOL)a3;
- (void)setSafariPrivateUnencryptedEnabled:(BOOL)a3;
- (void)setSafariTrackersEnabled:(BOOL)a3;
- (void)setSafariUnencryptedEnabled:(BOOL)a3;
- (void)setTierType:(id)a3;
- (void)setTokenFetchEnabled:(BOOL)a3;
- (void)setUnencryptedEnabled:(BOOL)a3;
@end

@implementation NSPConfigurationStats

- (id)eventName
{
  return @"com.apple.nsp.configurationStats";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPConfigurationStats configurationVersion](self, "configurationVersion")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"ConfigurationVersion");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats configurationEnabled](self, "configurationEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"ConfigurationEnabled");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats tokenFetchEnabled](self, "tokenFetchEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"TokenFetchEnabled");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"TierType");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariUnencryptedEnabled](self, "safariUnencryptedEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"SafariUnencryptedEnabled");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariDNSEnabled](self, "safariDNSEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"SafariDNSEnabled");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariTrackersEnabled](self, "safariTrackersEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"SafariTrackersEnabled");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariAllEnabled](self, "safariAllEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"SafariAllEnabled");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariHTTPEnabled](self, "safariHTTPEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"SafariHTTPEnabled");

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariPrivateUnencryptedEnabled](self, "safariPrivateUnencryptedEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"SafariPrivateUnencryptedEnabled");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariPrivateDNSEnabled](self, "safariPrivateDNSEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"SafariPrivateDNSEnabled");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariPrivateAllEnabled](self, "safariPrivateAllEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"SafariPrivateAllEnabled");

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats safariMetricsEnabled](self, "safariMetricsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  @"SafariMetricsEnabled");

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats mailTrackersEnabled](self, "mailTrackersEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v17,  @"MailTrackersEnabled");

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats unencryptedEnabled](self, "unencryptedEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"UnencryptedEnabled");

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats dnsEnabled](self, "dnsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, @"DNSEnabled");

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats knownTrackersEnabled](self, "knownTrackersEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  @"KnownTrackersEnabled");

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats appTrackersEnabled](self, "appTrackersEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  @"AppTrackersEnabled");

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats newsURLResolutionEnabled](self, "newsURLResolutionEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  @"NewsURLResolutionEnabled");

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats exposureNotificationsEnabled](self, "exposureNotificationsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v23,  @"ExposureNotificationsEnabled");

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats appleCertificatesEnabled](self, "appleCertificatesEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v24,  @"AppleCertificatesEnabled");

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats networkToolsEnabled](self, "networkToolsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v25,  @"NetworkToolsEnabled");

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats metricsUploadEnabled](self, "metricsUploadEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v26,  @"MetricsUploadEnabled");

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats newsEmbeddedContentEnabled](self, "newsEmbeddedContentEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v27,  @"NewsEmbeddedContentEnabled");

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats appMetricsEnabled](self, "appMetricsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v28,  @"AppMetricsEnabled");

  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats promotedContentEnabled](self, "promotedContentEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v29,  @"PromotedContentEnabled");

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats brandedCallingEnabled](self, "brandedCallingEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v30,  @"BrandedCallingEnabled");

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats postbackFetchEnabled](self, "postbackFetchEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v31,  @"PostbackFetchEnabled");

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats passwordManagerIconFetchEnabled](self, "passwordManagerIconFetchEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v32,  @"PasswordManagerIconFetchEnabled");

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPConfigurationStats launchWarningDetailsEnabled](self, "launchWarningDetailsEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v33,  @"LaunchWarningDetailsEnabled");

  return v3;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (void)setConfigurationVersion:(unint64_t)a3
{
  self->_configurationVersion = a3;
}

- (BOOL)configurationEnabled
{
  return self->_configurationEnabled;
}

- (void)setConfigurationEnabled:(BOOL)a3
{
  self->_configurationEnabled = a3;
}

- (BOOL)tokenFetchEnabled
{
  return self->_tokenFetchEnabled;
}

- (void)setTokenFetchEnabled:(BOOL)a3
{
  self->_tokenFetchEnabled = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (BOOL)safariUnencryptedEnabled
{
  return self->_safariUnencryptedEnabled;
}

- (void)setSafariUnencryptedEnabled:(BOOL)a3
{
  self->_safariUnencryptedEnabled = a3;
}

- (BOOL)safariDNSEnabled
{
  return self->_safariDNSEnabled;
}

- (void)setSafariDNSEnabled:(BOOL)a3
{
  self->_safariDNSEnabled = a3;
}

- (BOOL)safariTrackersEnabled
{
  return self->_safariTrackersEnabled;
}

- (void)setSafariTrackersEnabled:(BOOL)a3
{
  self->_safariTrackersEnabled = a3;
}

- (BOOL)safariAllEnabled
{
  return self->_safariAllEnabled;
}

- (void)setSafariAllEnabled:(BOOL)a3
{
  self->_safariAllEnabled = a3;
}

- (BOOL)safariHTTPEnabled
{
  return self->_safariHTTPEnabled;
}

- (void)setSafariHTTPEnabled:(BOOL)a3
{
  self->_safariHTTPEnabled = a3;
}

- (BOOL)safariPrivateUnencryptedEnabled
{
  return self->_safariPrivateUnencryptedEnabled;
}

- (void)setSafariPrivateUnencryptedEnabled:(BOOL)a3
{
  self->_safariPrivateUnencryptedEnabled = a3;
}

- (BOOL)safariPrivateDNSEnabled
{
  return self->_safariPrivateDNSEnabled;
}

- (void)setSafariPrivateDNSEnabled:(BOOL)a3
{
  self->_safariPrivateDNSEnabled = a3;
}

- (BOOL)safariPrivateAllEnabled
{
  return self->_safariPrivateAllEnabled;
}

- (void)setSafariPrivateAllEnabled:(BOOL)a3
{
  self->_safariPrivateAllEnabled = a3;
}

- (BOOL)safariMetricsEnabled
{
  return self->_safariMetricsEnabled;
}

- (void)setSafariMetricsEnabled:(BOOL)a3
{
  self->_safariMetricsEnabled = a3;
}

- (BOOL)mailTrackersEnabled
{
  return self->_mailTrackersEnabled;
}

- (void)setMailTrackersEnabled:(BOOL)a3
{
  self->_mailTrackersEnabled = a3;
}

- (BOOL)unencryptedEnabled
{
  return self->_unencryptedEnabled;
}

- (void)setUnencryptedEnabled:(BOOL)a3
{
  self->_unencryptedEnabled = a3;
}

- (BOOL)dnsEnabled
{
  return self->_dnsEnabled;
}

- (void)setDnsEnabled:(BOOL)a3
{
  self->_dnsEnabled = a3;
}

- (BOOL)knownTrackersEnabled
{
  return self->_knownTrackersEnabled;
}

- (void)setKnownTrackersEnabled:(BOOL)a3
{
  self->_knownTrackersEnabled = a3;
}

- (BOOL)appTrackersEnabled
{
  return self->_appTrackersEnabled;
}

- (void)setAppTrackersEnabled:(BOOL)a3
{
  self->_appTrackersEnabled = a3;
}

- (BOOL)newsURLResolutionEnabled
{
  return self->_newsURLResolutionEnabled;
}

- (void)setNewsURLResolutionEnabled:(BOOL)a3
{
  self->_newsURLResolutionEnabled = a3;
}

- (BOOL)exposureNotificationsEnabled
{
  return self->_exposureNotificationsEnabled;
}

- (void)setExposureNotificationsEnabled:(BOOL)a3
{
  self->_exposureNotificationsEnabled = a3;
}

- (BOOL)appleCertificatesEnabled
{
  return self->_appleCertificatesEnabled;
}

- (void)setAppleCertificatesEnabled:(BOOL)a3
{
  self->_appleCertificatesEnabled = a3;
}

- (BOOL)networkToolsEnabled
{
  return self->_networkToolsEnabled;
}

- (void)setNetworkToolsEnabled:(BOOL)a3
{
  self->_networkToolsEnabled = a3;
}

- (BOOL)metricsUploadEnabled
{
  return self->_metricsUploadEnabled;
}

- (void)setMetricsUploadEnabled:(BOOL)a3
{
  self->_metricsUploadEnabled = a3;
}

- (BOOL)brandedCallingEnabled
{
  return self->_brandedCallingEnabled;
}

- (void)setBrandedCallingEnabled:(BOOL)a3
{
  self->_brandedCallingEnabled = a3;
}

- (BOOL)newsEmbeddedContentEnabled
{
  return self->_newsEmbeddedContentEnabled;
}

- (void)setNewsEmbeddedContentEnabled:(BOOL)a3
{
  self->_newsEmbeddedContentEnabled = a3;
}

- (BOOL)appMetricsEnabled
{
  return self->_appMetricsEnabled;
}

- (void)setAppMetricsEnabled:(BOOL)a3
{
  self->_appMetricsEnabled = a3;
}

- (BOOL)promotedContentEnabled
{
  return self->_promotedContentEnabled;
}

- (void)setPromotedContentEnabled:(BOOL)a3
{
  self->_promotedContentEnabled = a3;
}

- (BOOL)postbackFetchEnabled
{
  return self->_postbackFetchEnabled;
}

- (void)setPostbackFetchEnabled:(BOOL)a3
{
  self->_postbackFetchEnabled = a3;
}

- (BOOL)passwordManagerIconFetchEnabled
{
  return self->_passwordManagerIconFetchEnabled;
}

- (void)setPasswordManagerIconFetchEnabled:(BOOL)a3
{
  self->_passwordManagerIconFetchEnabled = a3;
}

- (BOOL)launchWarningDetailsEnabled
{
  return self->_launchWarningDetailsEnabled;
}

- (void)setLaunchWarningDetailsEnabled:(BOOL)a3
{
  self->_launchWarningDetailsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end