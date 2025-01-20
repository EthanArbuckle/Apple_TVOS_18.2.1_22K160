@interface _LSCanOpenURLManager(PrivateSchemeChecking)
- (void)copySchemesMap;
- (void)writeSchemesMap;
@end

@implementation _LSCanOpenURLManager(PrivateSchemeChecking)

- (void)writeSchemesMap
{
}

- (void)copySchemesMap
{
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.1()
{
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.2()
{
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.3()
{
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.4( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40LL);
  OUTLINED_FUNCTION_1_0( &dword_183E58000,  a2,  a3,  "LSTesting: app %@ has exceeded their schemes quota. Schemes queried:\n%@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end