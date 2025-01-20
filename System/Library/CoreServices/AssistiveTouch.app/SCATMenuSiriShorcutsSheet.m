@interface SCATMenuSiriShorcutsSheet
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATMenuSiriShorcutsSheet

- (id)makeMenuItemsIfNeeded
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
}

- (void)menuItemWasActivated:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATMenuSiriShorcutsSheet;
  -[SCATModernMenuSheet menuItemWasActivated:](&v3, "menuItemWasActivated:", a3);
}

@end