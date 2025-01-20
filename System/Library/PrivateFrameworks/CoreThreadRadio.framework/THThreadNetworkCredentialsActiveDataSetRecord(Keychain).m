@interface THThreadNetworkCredentialsActiveDataSetRecord(Keychain)
- (void)computedUniqueIdentifier;
- (void)computedUniqueIdentifierWithBorderAgent;
- (void)keyChainItemRepresentationForActiveDataSetRecordAddOperation;
- (void)keyChainQueryForActiveDataSetRecordUpdateOperation;
@end

@implementation THThreadNetworkCredentialsActiveDataSetRecord(Keychain)

- (void)computedUniqueIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  int v10 = 138412546;
  v11 = v5;
  OUTLINED_FUNCTION_6_0();
  uint64_t v12 = v8;
  OUTLINED_FUNCTION_1_2( (void *)&_mh_execute_header,  a2,  v9,  "Failed to calculate UUID (name=%@; xpanid=%@)!",
    (uint8_t *)&v10);
}

- (void)computedUniqueIdentifierWithBorderAgent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 networkName]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedPANID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 borderAgent]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 discriminatorId]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 keychainAccessGroup]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v9,  v10,  "Failed to calculate UUID (name=%@; xpanid=%@; discriminatorId=%@; keychainAccessGroup=%@)!",
    v11,
    v12,
    v13,
    v14,
    2u);

  OUTLINED_FUNCTION_2_4();
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.1()
{
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.2()
{
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.4( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = a2;
  OUTLINED_FUNCTION_1_2( (void *)&_mh_execute_header,  a3,  v6,  "Warning: decoded record with identifier %@ but does not match expected %@!",  (uint8_t *)&v7);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.5()
{
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.6()
{
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.7( os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "+[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]";
  __int16 v3 = 1024;
  int v4 = 187;
  __int16 v5 = 2112;
  uint64_t v6 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s:%d, Failed to decode Keychain item - Ba Discriminator Id  (baDiscriminatorId=%@)!",  (uint8_t *)&v1,  0x1Cu);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.8()
{
}

- (void)keyChainItemRepresentationForActiveDataSetRecordAddOperation
{
}

- (void)keyChainQueryForActiveDataSetRecordUpdateOperation
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 networkName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedPANID]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 borderAgent]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 discriminatorId]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v8,  v9,  "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; discriminatorId=%@; uuid=%@)!",
    v10,
    v11,
    v12,
    v13,
    2u);

  OUTLINED_FUNCTION_2_4();
}

@end