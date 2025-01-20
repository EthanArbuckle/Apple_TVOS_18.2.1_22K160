@interface NSSet
- (id)pb_setByRemovingObjectsFromSet:(id)a3;
@end

@implementation NSSet

- (id)pb_setByRemovingObjectsFromSet:(id)a3
{
  id v4 = a3;
  id v5 = -[NSSet mutableCopy](self, "mutableCopy");
  [v5 minusSet:v4];

  return v5;
}

@end