@interface CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption
@end

@implementation CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption

uint64_t ___CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue( @"NSShowNonLocalizedStrings",  @"kCFPreferencesCurrentApplication",  0LL);
  _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_capitalize = (_DWORD)result != 0;
  return result;
}

void ___CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_block_invoke_9()
{
  if (CFPreferencesGetAppBooleanValue( @"NSDoubleLocalizedStrings",  @"kCFPreferencesCurrentApplication",  0LL))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_doubleStrings = 1;
  }

  if (CFPreferencesGetAppBooleanValue( @"NSForceRightToLeftLocalizedStrings",  @"kCFPreferencesCurrentApplication",  0LL))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_forceRightToLeftStrings = 1;
  }

  if (CFPreferencesGetAppBooleanValue( @"NSAccentuateLocalizedStrings",  @"kCFPreferencesCurrentApplication",  0LL))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_accentuateStrings = 1;
  }

  if (CFPreferencesGetAppBooleanValue( @"NSSurroundLocalizedStrings",  @"kCFPreferencesCurrentApplication",  0LL))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_surroundStrings = 1;
  }

  v0 = (const __CFString *)CFPreferencesCopyAppValue( @"NSTallLocalizedStrings",  @"kCFPreferencesCurrentApplication");
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      if (CFStringGetLength(v1)) {
        _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_tallStrings = 1;
      }
    }

    CFRelease(v1);
  }

@end