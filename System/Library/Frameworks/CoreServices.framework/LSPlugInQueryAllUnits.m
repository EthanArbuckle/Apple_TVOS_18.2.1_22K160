@interface LSPlugInQueryAllUnits
+ (BOOL)supportsSecureCoding;
- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6;
@end

@implementation LSPlugInQueryAllUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc(&OBJC_CLASS___LSPlugInQueryAllUnitsResult);
  [v9 allObjects];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  _LSDatabaseGetCacheGUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LSPlugInQueryAllUnitsResult initWithPlugInUnits:forDatabaseWithUUID:]( v10,  "initWithPlugInUnits:forDatabaseWithUUID:",  v13,  v11);
  (*((void (**)(id, LSPlugInQueryAllUnitsResult *, void))a5 + 2))(v8, v12, 0LL);
}

@end