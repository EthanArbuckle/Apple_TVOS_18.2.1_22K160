@interface LSApplicationProxy(Localization)
@end

@implementation LSApplicationProxy(Localization)

- (void)localizedNameForContext:()Localization preferredLocalizations:useShortNameOnly:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_FAULT,  "cannot ask for short name with context (%@)",  (uint8_t *)&v2,  0xCu);
}

@end