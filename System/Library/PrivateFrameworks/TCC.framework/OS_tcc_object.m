@interface OS_tcc_object
- (void)dealloc;
@end

@implementation OS_tcc_object

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 134218242;
  v4 = a1;
  __int16 v5 = 2080;
  ClassName = object_getClassName(a1);
  _os_log_debug_impl(&dword_186DC2000, a2, OS_LOG_TYPE_DEBUG, "disposing: %p(%s)", (uint8_t *)&v3, 0x16u);
}

@end