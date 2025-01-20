@interface CPLContainerRelationChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (BOOL)shouldAppearInCKUploadContext;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLContainerRelationChange

- (BOOL)shouldAppearInCKUploadContext
{
  return 0;
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"itemId";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  v4 = self;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"itemId"]);
  -[CPLContainerRelationChange setItemIdentifier:](v4, "setItemIdentifier:", v6);

  id v13 = objc_alloc_init(&OBJC_CLASS___CPLContainerRelation);
  id v7 = objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"position", objc_opt_class(NSNumber));
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v8) {
    v8 = &off_10025A188;
  }
  objc_msgSend(v13, "setPosition:", objc_msgSend(v8, "integerValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"containerId"]);
  [v13 setContainerIdentifier:v10];

  id v11 = objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"isKeyAsset", objc_opt_class(NSNumber));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v13, "setKeyAsset:", objc_msgSend(v12, "BOOLValue"));
  -[CPLContainerRelationChange setRelation:](v4, "setRelation:", v13);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v15 = a3;
  v6 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLContainerRelationChange hasChangeType:](v6, "hasChangeType:", 2LL))
  {
    if (-[CPLContainerRelationChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"itemIdentifier")))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLContainerRelationChange itemIdentifier](v6, "itemIdentifier"));
      [v15 setObject:v8 forKey:@"itemId"];
    }

    if (-[CPLContainerRelationChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"relation")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLContainerRelationChange relation](v6, "relation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerIdentifier]);
      [v15 setObject:v10 forKey:@"containerId"];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLContainerRelationChange relation](v6, "relation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 position]));
      [v15 setObject:v12 forKey:@"position"];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLContainerRelationChange relation](v6, "relation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 isKeyAsset]));
      [v15 setObject:v14 forKey:@"isKeyAsset"];
    }
  }
}

@end