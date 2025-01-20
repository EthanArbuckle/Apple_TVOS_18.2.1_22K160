@interface _CPLPrequeliteScopeSyncState
- (CPLPrequeliteVariable)busyStateVar;
- (CPLPrequeliteVariable)classForInitialQueryVar;
- (CPLPrequeliteVariable)downloadTransportGroupVar;
- (CPLPrequeliteVariable)droppedSomeRecordsVar;
- (CPLPrequeliteVariable)featureVersionVar;
- (CPLPrequeliteVariable)hasFetchedInitialSyncAnchorVar;
- (CPLPrequeliteVariable)initialSyncAnchorVar;
- (CPLPrequeliteVariable)lastClearedPushVar;
- (CPLPrequeliteVariable)rewindSyncAnchorsVar;
- (CPLPrequeliteVariable)stagedSyncAnchorVar;
- (CPLPrequeliteVariable)syncAnchorVar;
- (CPLPrequeliteVariable)transientSyncAnchorVar;
- (CPLPrequeliteVariable)uploadTransportGroupVar;
- (_CPLPrequeliteScopeSyncState)init;
@end

@implementation _CPLPrequeliteScopeSyncState

- (_CPLPrequeliteScopeSyncState)init
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"featureVersion",  &off_10025A380,  v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  id obj = (id)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"droppedSomeRecords",  &off_10025A290,  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  id v30 = (id)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"transientSyncAnchor",  0LL,  v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"syncAnchor",  0LL,  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  id v29 = (id)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"stagedSyncAnchor",  0LL,  v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"hasFetchedInitialSyncAnchor",  &off_10025A290,  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialSyncAnchor",  0LL,  v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"classForInitialQuery",  0LL,  v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"uploadTransportGroup",  0LL,  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"downloadTransportGroup",  0LL,  v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"lastClearedPush",  0LL,  v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"rewindSyncAnchors",  0LL,  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"busyState",  &off_10025A290,  v21));

  [v20 setShouldNotCacheValue:1];
  v33[0] = v3;
  v33[1] = obj;
  v33[2] = v30;
  v33[3] = v7;
  v33[4] = v29;
  v33[5] = v10;
  v33[6] = v27;
  v33[7] = v26;
  v33[8] = v14;
  v33[9] = v16;
  v33[10] = v18;
  v33[11] = v20;
  v33[12] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 13LL));
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____CPLPrequeliteScopeSyncState;
  v24 = -[CPLPrequeliteVariableGroup initWithVariables:](&v32, "initWithVariables:", v23);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_featureVersionVar, v3);
    objc_storeStrong((id *)&v24->_droppedSomeRecordsVar, obj);
    objc_storeStrong((id *)&v24->_transientSyncAnchorVar, v30);
    objc_storeStrong((id *)&v24->_syncAnchorVar, v7);
    objc_storeStrong((id *)&v24->_stagedSyncAnchorVar, v29);
    objc_storeStrong((id *)&v24->_hasFetchedInitialSyncAnchorVar, v10);
    objc_storeStrong((id *)&v24->_initialSyncAnchorVar, v27);
    objc_storeStrong((id *)&v24->_classForInitialQueryVar, v26);
    objc_storeStrong((id *)&v24->_uploadTransportGroupVar, v14);
    objc_storeStrong((id *)&v24->_downloadTransportGroupVar, v16);
    objc_storeStrong((id *)&v24->_lastClearedPushVar, v18);
    objc_storeStrong((id *)&v24->_rewindSyncAnchorsVar, v20);
    objc_storeStrong((id *)&v24->_busyStateVar, v22);
  }

  return v24;
}

- (CPLPrequeliteVariable)featureVersionVar
{
  return self->_featureVersionVar;
}

- (CPLPrequeliteVariable)droppedSomeRecordsVar
{
  return self->_droppedSomeRecordsVar;
}

- (CPLPrequeliteVariable)transientSyncAnchorVar
{
  return self->_transientSyncAnchorVar;
}

- (CPLPrequeliteVariable)syncAnchorVar
{
  return self->_syncAnchorVar;
}

- (CPLPrequeliteVariable)stagedSyncAnchorVar
{
  return self->_stagedSyncAnchorVar;
}

- (CPLPrequeliteVariable)hasFetchedInitialSyncAnchorVar
{
  return self->_hasFetchedInitialSyncAnchorVar;
}

- (CPLPrequeliteVariable)initialSyncAnchorVar
{
  return self->_initialSyncAnchorVar;
}

- (CPLPrequeliteVariable)classForInitialQueryVar
{
  return self->_classForInitialQueryVar;
}

- (CPLPrequeliteVariable)uploadTransportGroupVar
{
  return self->_uploadTransportGroupVar;
}

- (CPLPrequeliteVariable)downloadTransportGroupVar
{
  return self->_downloadTransportGroupVar;
}

- (CPLPrequeliteVariable)rewindSyncAnchorsVar
{
  return self->_rewindSyncAnchorsVar;
}

- (CPLPrequeliteVariable)busyStateVar
{
  return self->_busyStateVar;
}

- (CPLPrequeliteVariable)lastClearedPushVar
{
  return self->_lastClearedPushVar;
}

- (void).cxx_destruct
{
}

@end