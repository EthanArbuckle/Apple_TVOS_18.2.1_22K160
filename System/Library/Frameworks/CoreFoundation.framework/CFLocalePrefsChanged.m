@interface CFLocalePrefsChanged
@end

@implementation CFLocalePrefsChanged

void ____CFLocalePrefsChanged_block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 32) == *(double *)&__lastNote)
  {
    _CFCalendarResetCurrent();
    CFPreferencesAppSynchronize(@"kCFPreferencesCurrentApplication");
    dispatch_async(MEMORY[0x1895F8AE0], &__block_literal_global_13);
  }

@end