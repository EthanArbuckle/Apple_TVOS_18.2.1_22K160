@interface NSUserDefaults
- (BOOL)userHasAcknowledgedFindMy;
- (void)setUserHasAcknowledgedFindMy:(BOOL)a3;
@end

@implementation NSUserDefaults

- (BOOL)userHasAcknowledgedFindMy
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3
{
  NSString v3 = self;
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  id v5 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setValue:forKey:](v3, "setValue:forKey:", isa, v5);
}

@end