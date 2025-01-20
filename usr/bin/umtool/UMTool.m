@interface UMTool
+ (id)description;
+ (id)name;
+ (id)subcommands;
@end

@implementation UMTool

+ (id)name
{
  return @"umtool";
}

+ (id)description
{
  return @"A tool for diagnosing the UserManagement framework";
}

+ (id)subcommands
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UMTestSysdiagnose);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

@end