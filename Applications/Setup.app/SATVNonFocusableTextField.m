@interface SATVNonFocusableTextField
- (BOOL)canBecomeFocused;
@end

@implementation SATVNonFocusableTextField

- (BOOL)canBecomeFocused
{
  return 0;
}

@end