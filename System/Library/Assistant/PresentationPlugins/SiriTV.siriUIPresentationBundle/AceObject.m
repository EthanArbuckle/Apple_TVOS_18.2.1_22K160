@interface AceObject
- (BOOL)shouldHideContentPlatterIfPerformed;
@end

@implementation AceObject

- (BOOL)shouldHideContentPlatterIfPerformed
{
  v2 = self;
  unsigned __int8 v3 = sub_455AC();

  return v3 & 1;
}

@end