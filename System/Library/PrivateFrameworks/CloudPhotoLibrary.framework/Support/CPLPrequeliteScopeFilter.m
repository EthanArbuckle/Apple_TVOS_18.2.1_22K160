@interface CPLPrequeliteScopeFilter
- (CPLPrequeliteScopeFilter)initWithExcludedScopeIdentifiers:(id)a3 localIndexesInjection:(id)a4 localIndexes:(id)a5 cloudIndexesInjection:(id)a6 cloudIndexes:(id)a7;
- (CPLPrequeliteScopeFilter)initWithIncludedScopeIdentifiers:(id)a3 localIndexesInjection:(id)a4 localIndexes:(id)a5 cloudIndexesInjection:(id)a6 cloudIndexes:(id)a7;
- (NSIndexSet)cloudIndexes;
- (NSIndexSet)localIndexes;
- (PQLInjecting)cloudIndexesInjection;
- (PQLInjecting)localIndexesInjection;
- (id)description;
@end

@implementation CPLPrequeliteScopeFilter

- (CPLPrequeliteScopeFilter)initWithIncludedScopeIdentifiers:(id)a3 localIndexesInjection:(id)a4 localIndexes:(id)a5 cloudIndexesInjection:(id)a6 cloudIndexes:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeFilter;
  v17 = -[CPLPrequeliteScopeFilter initWithIncludedScopeIdentifiers:](&v20, "initWithIncludedScopeIdentifiers:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localIndexesInjection, a4);
    objc_storeStrong((id *)&v18->_localIndexes, a5);
    objc_storeStrong((id *)&v18->_cloudIndexesInjection, a6);
    objc_storeStrong((id *)&v18->_cloudIndexes, a7);
  }

  return v18;
}

- (CPLPrequeliteScopeFilter)initWithExcludedScopeIdentifiers:(id)a3 localIndexesInjection:(id)a4 localIndexes:(id)a5 cloudIndexesInjection:(id)a6 cloudIndexes:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeFilter;
  v17 = -[CPLPrequeliteScopeFilter initWithExcludedScopeIdentifiers:](&v20, "initWithExcludedScopeIdentifiers:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localIndexesInjection, a4);
    objc_storeStrong((id *)&v18->_localIndexes, a5);
    objc_storeStrong((id *)&v18->_cloudIndexesInjection, a6);
    objc_storeStrong((id *)&v18->_cloudIndexes, a7);
  }

  return v18;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeFilter includedScopeIdentifiers](self, "includedScopeIdentifiers"));
  if (v3)
  {
    v4 = v3;
    if (![v3 count])
    {
      v11 = @"[incl: none]";
      goto LABEL_11;
    }

    v5 = objc_alloc(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    v8 = -[NSString initWithFormat:](v5, "initWithFormat:", @"[incl: %@ %@]", v7, self->_localIndexesInjection);
LABEL_7:
    v11 = v8;

LABEL_11:
    return v11;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeFilter excludedScopeIdentifiers](self, "excludedScopeIdentifiers"));
  if (v9)
  {
    v4 = v9;
    if (![v9 count])
    {
      v11 = @"[excl: none]";
      goto LABEL_11;
    }

    v10 = objc_alloc(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    v8 = -[NSString initWithFormat:](v10, "initWithFormat:", @"[excl: %@ %@]", v7, self->_localIndexesInjection);
    goto LABEL_7;
  }

  v11 = @"[none]";
  return v11;
}

- (PQLInjecting)localIndexesInjection
{
  return self->_localIndexesInjection;
}

- (NSIndexSet)localIndexes
{
  return self->_localIndexes;
}

- (PQLInjecting)cloudIndexesInjection
{
  return self->_cloudIndexesInjection;
}

- (NSIndexSet)cloudIndexes
{
  return self->_cloudIndexes;
}

- (void).cxx_destruct
{
}

@end