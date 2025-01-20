@interface CPLEngineScope
- (CPLEngineScope)initWithPrequeliteDictionary:(id)a3 base:(id)a4;
@end

@implementation CPLEngineScope

- (CPLEngineScope)initWithPrequeliteDictionary:(id)a3 base:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifierVar]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);

  if (!v10) {
    sub_1001994A0((uint64_t)a2, (uint64_t)self);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeTypeVar]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v11]);
  id v13 = [v12 integerValue];

  v14 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](self, "initWithScopeIdentifier:scopeType:", v10, v13);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localIndexVar]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
    -[CPLEngineScope setLocalIndex:](v14, "setLocalIndex:", [v16 integerValue]);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudIndexVar]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
    -[CPLEngineScope setCloudIndex:](v14, "setCloudIndex:", [v18 integerValue]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 stableIndexVar]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v19]);
    -[CPLEngineScope setStableIndex:](v14, "setStableIndex:", [v20 integerValue]);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDateVar]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v21]);
    -[CPLEngineScope setCreationDate:](v14, "setCreationDate:", v22);
  }

  return v14;
}

@end