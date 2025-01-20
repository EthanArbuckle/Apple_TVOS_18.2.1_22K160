@interface SQLiteFunction.SQLiteFunctionPointers
- (_TtCC9storekitd14SQLiteFunction22SQLiteFunctionPointers)init;
- (const)name;
- (void)implementation;
- (void)setImplementation:(void *)a3;
- (void)setName:(const char *)a3;
- (void)setXDestroy:(void *)a3;
- (void)setXFunc:(void *)a3;
- (void)xDestroy;
- (void)xFunc;
@end

@implementation SQLiteFunction.SQLiteFunctionPointers

- (const)name
{
  return (const char *)sub_10007DF8C();
}

- (void)setName:(const char *)a3
{
}

- (void)implementation
{
  return (void *)sub_10007DFE8();
}

- (void)setImplementation:(void *)a3
{
}

- (void)xFunc
{
  return (void *)sub_10007E044();
}

- (void)setXFunc:(void *)a3
{
}

- (void)xDestroy
{
  return (void *)sub_10007E0A0();
}

- (void)setXDestroy:(void *)a3
{
}

- (_TtCC9storekitd14SQLiteFunction22SQLiteFunctionPointers)init
{
}

@end