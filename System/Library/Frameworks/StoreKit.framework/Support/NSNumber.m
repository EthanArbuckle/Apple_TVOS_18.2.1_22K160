@interface NSNumber
- (BOOL)isIntegerValue;
- (BOOL)isNotZero;
@end

@implementation NSNumber

- (BOOL)isNotZero
{
  return !-[NSNumber isEqualToNumber:](self, "isEqualToNumber:", &off_100302870);
}

- (BOOL)isIntegerValue
{
  v2 = (const char *)-[NSNumber objCType](self, "objCType");
  int v3 = strcmp(v2, "d");
  if (v3) {
    LOBYTE(v3) = strcmp(v2, "f") != 0;
  }
  return v3;
}

@end