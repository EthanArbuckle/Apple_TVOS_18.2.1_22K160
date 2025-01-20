@interface PKDUserPrefs
- (PKDUserPrefs)init;
- (id)exclusions;
@end

@implementation PKDUserPrefs

- (PKDUserPrefs)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PKDUserPrefs;
  v2 = -[PKDUserPrefs init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[PKDUserPrefs addSuiteNamed:](v2, "addSuiteNamed:", PKPreferenceDomain);
  }
  return v3;
}

- (id)exclusions
{
  v2 = (const __CFString *)PKPreferenceDomain;
  CFPreferencesSynchronize(PKPreferenceDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  return (id)(id)CFPreferencesCopyValue( PKExclusionsPreferenceKey,  v2,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
}

@end