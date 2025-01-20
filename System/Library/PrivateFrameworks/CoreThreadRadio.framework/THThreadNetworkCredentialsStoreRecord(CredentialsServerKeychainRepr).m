@interface THThreadNetworkCredentialsStoreRecord(CredentialsServerKeychainRepr)
- (void)computedUniqueIdentifier;
- (void)keyChainQueryForUpdateOperation;
@end

@implementation THThreadNetworkCredentialsStoreRecord(CredentialsServerKeychainRepr)

- (void)computedUniqueIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 keychainAccessGroup]);
  int v10 = 138412802;
  v11 = v5;
  __int16 v12 = 2112;
  v13 = v7;
  __int16 v14 = 2112;
  v15 = v8;
  OUTLINED_FUNCTION_3_4( (void *)&_mh_execute_header,  a2,  v9,  "Failed to calculate UUID (name=%@; xpanid=%@; keychainAccessGroup=%@)!",
    (uint8_t *)&v10);

  OUTLINED_FUNCTION_18();
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.1()
{
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.3( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Warning: decoded record with identifier %@ but does not match expected %@!",  (uint8_t *)&v6,  0x16u);
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.4()
{
}

- (void)keyChainQueryForUpdateOperation
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 networkName]);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 network]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 extendedPANID]);
  int v11 = 138412802;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  __int16 v14 = v9;
  __int16 v15 = 2112;
  uint64_t v16 = a2;
  OUTLINED_FUNCTION_3_4( (void *)&_mh_execute_header,  a3,  v10,  "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; uuid=%@)!",
    (uint8_t *)&v11);

  OUTLINED_FUNCTION_18();
}

@end