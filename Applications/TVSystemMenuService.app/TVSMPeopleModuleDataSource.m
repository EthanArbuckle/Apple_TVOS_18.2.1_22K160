@interface TVSMPeopleModuleDataSource
- (TVSMPeopleModuleDataSource)init;
- (id)childModules;
@end

@implementation TVSMPeopleModuleDataSource

- (TVSMPeopleModuleDataSource)init
{
  v4 = 0LL;
  v4 = -[TVSMModuleDataSource initWithModuleType:](self, "initWithModuleType:", 1LL);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (id)childModules
{
  v4 = -[TVSMModuleDataSource availableModules](self, "availableModules");
  id v3 = -[NSArray firstObject](v4, "firstObject");
  id v5 = [v3 childModules];

  return v5;
}

@end