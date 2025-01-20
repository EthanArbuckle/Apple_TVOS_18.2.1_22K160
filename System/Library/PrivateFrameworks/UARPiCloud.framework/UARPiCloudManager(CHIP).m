@interface UARPiCloudManager(CHIP)
- (void)performRemoteFetchForCHIPVerificationCertificateSync;
@end

@implementation UARPiCloudManager(CHIP)

- (void)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:()CHIP productGroup:batchRequest:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  v3 = @"chipAccessories";
  OUTLINED_FUNCTION_0( &dword_1887DD000,  v0,  v1,  "%s: Timed out waiting for fetchRecordZoneChangesCompletionBlock callback for zone=%@",  (uint8_t *)v2);
}

- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:()CHIP subjectKeyIdentifier:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  v3 = @"chipAttestationCertificates";
  OUTLINED_FUNCTION_0( &dword_1887DD000,  v0,  v1,  "%s: Timed out waiting for fetchRecordZoneChangesCompletionBlock callback for zone=%@",  (uint8_t *)v2);
}

- (void)performRemoteFetchForCHIPVerificationCertificateSync
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl( &dword_1887DD000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Timed out waiting for CHIPVerificationCertificate callback for zone=%@, record=%@",  (uint8_t *)v4,  0x20u);
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.1(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 recordName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0( &dword_1887DD000,  v3,  v4,  "Stonehenge Signature validation failed, invalid digest for CHIPAccessoryRecord %@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.2(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 recordName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0( &dword_1887DD000,  v3,  v4,  "Stonehenge Signature validation failed, no signature found for CHIPAccessoryRecord %@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.3(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 recordName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0( &dword_1887DD000,  v3,  v4,  "Stonehenge Signature validation failed, no publicKey found for CHIPAccessoryRecord %@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a1 recordID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 recordName];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0( &dword_1887DD000,  a3,  v6,  "Stonehenge Signature validation failed for CHIPAccessoryRecord %@, error:%@",  v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)processCHIPAttestationCertificateRecord:()CHIP subjectKeyIdentifier:.cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 ckRecord];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0( &dword_1887DD000,  a3,  v5,  "Signature validation failed for CHIPAttestationCertificateRecord %@, error:%@",  v6);

  OUTLINED_FUNCTION_0_0();
}

- (void)validateCHIPFirmwareRecord:()CHIP inContainer:forAccessory:.cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 ckRecord];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1887DD000, a3, v5, "Signature validation failed for CHIPFirmwareRecord %@, error:%@", v6);

  OUTLINED_FUNCTION_0_0();
}

@end