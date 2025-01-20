@interface _CPLPrequeliteScopeBase
- (CPLPrequeliteVariable)cloudIndexVar;
- (CPLPrequeliteVariable)creationDateVar;
- (CPLPrequeliteVariable)localIndexVar;
- (CPLPrequeliteVariable)scopeIdentifierVar;
- (CPLPrequeliteVariable)scopeTypeVar;
- (CPLPrequeliteVariable)stableIndexVar;
- (_CPLPrequeliteScopeBase)init;
@end

@implementation _CPLPrequeliteScopeBase

- (_CPLPrequeliteScopeBase)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"scopeIdentifier",  0LL,  v3));

  [v4 setUnique:1];
  [v4 setAllowsNull:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"scopeType",  &off_10025A368,  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"localIndex",  0LL,  v7));

  [v8 setUnique:1];
  [v8 setAllowsNull:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"cloudIndex",  0LL,  v9));

  [v10 setUnique:1];
  [v10 setAllowsNull:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"stableIndex",  0LL,  v11));

  [v12 setUnique:1];
  [v12 setAllowsNull:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"creationDate",  0LL,  v13));

  [v14 setAllowsNull:0];
  v19[0] = v4;
  v19[1] = v6;
  v19[2] = v8;
  v19[3] = v10;
  v19[4] = v12;
  v19[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 6LL));
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____CPLPrequeliteScopeBase;
  v16 = -[CPLPrequeliteVariableGroup initWithVariables:](&v18, "initWithVariables:", v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_scopeIdentifierVar, v4);
    objc_storeStrong((id *)&v16->_scopeTypeVar, v6);
    objc_storeStrong((id *)&v16->_localIndexVar, v8);
    objc_storeStrong((id *)&v16->_cloudIndexVar, v10);
    objc_storeStrong((id *)&v16->_stableIndexVar, v12);
    objc_storeStrong((id *)&v16->_creationDateVar, v14);
  }

  return v16;
}

- (CPLPrequeliteVariable)scopeIdentifierVar
{
  return self->_scopeIdentifierVar;
}

- (CPLPrequeliteVariable)scopeTypeVar
{
  return self->_scopeTypeVar;
}

- (CPLPrequeliteVariable)localIndexVar
{
  return self->_localIndexVar;
}

- (CPLPrequeliteVariable)cloudIndexVar
{
  return self->_cloudIndexVar;
}

- (CPLPrequeliteVariable)stableIndexVar
{
  return self->_stableIndexVar;
}

- (CPLPrequeliteVariable)creationDateVar
{
  return self->_creationDateVar;
}

- (void).cxx_destruct
{
}

@end