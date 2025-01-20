@interface UMUserMutablePersona
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
@end

@implementation UMUserMutablePersona

- (BOOL)commitChanges
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMUserMutablePersona;
  return -[UMUserPersona commitChanges](&v3, sel_commitChanges);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UMUserMutablePersona;
  return -[UMUserPersona commitChangesWithError:](&v4, sel_commitChangesWithError_, a3);
}

@end