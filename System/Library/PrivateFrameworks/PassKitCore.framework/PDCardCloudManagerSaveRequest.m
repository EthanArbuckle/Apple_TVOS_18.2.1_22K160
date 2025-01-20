@interface PDCardCloudManagerSaveRequest
- (BOOL)hasLocalPortion;
- (BOOL)hasRemotePortion;
- (BOOL)isEmpty;
- (BOOL)shouldDelayExecutionOfRemotePortion;
- (NSArray)changeEventsToErase;
- (NSArray)conflictingRemotePasses;
- (NSArray)passesToAddRemotely;
- (NSArray)passesToRemoveLocally;
- (NSArray)passesToRemoveRemotely;
- (NSArray)passesToUpdateLocally;
- (NSArray)passesToUpdateRemotely;
- (NSArray)uniqueIDsOfConflictingRemotePasses;
- (NSArray)uniqueIDsOfPassesToAddRemotely;
- (NSArray)uniqueIDsOfPassesToRemoveLocally;
- (NSArray)uniqueIDsOfPassesToRemoveRemotely;
- (NSArray)uniqueIDsOfPassesToUpdateLocally;
- (NSArray)uniqueIDsOfPassesToUpdateRemotely;
- (NSString)originator;
- (PDCardCloudManagerSaveRequest)init;
- (PKCatalog)catalogToUpdateLocally;
- (PKCatalog)catalogToUpdateRemotely;
- (id)description;
- (void)addRemotePass:(id)a3;
- (void)delayExecutionOfRemotePortion;
- (void)eraseChangeEvent:(id)a3;
- (void)removeLocalPass:(id)a3;
- (void)removeRemotePass:(id)a3;
- (void)resolveRemoteConflictingPass:(id)a3;
- (void)setOriginator:(id)a3;
- (void)updateLocalCatalogWithCatalog:(id)a3;
- (void)updateLocalPassWithPass:(id)a3;
- (void)updateRemoteCatalogWithCatalog:(id)a3;
- (void)updateRemotePassWithPass:(id)a3;
@end

@implementation PDCardCloudManagerSaveRequest

- (PDCardCloudManagerSaveRequest)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDCardCloudManagerSaveRequest;
  v2 = -[PDCardCloudManagerSaveRequest init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    passesToAddRemotelyByUniqueID = v2->_passesToAddRemotelyByUniqueID;
    v2->_passesToAddRemotelyByUniqueID = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    passesToUpdateRemotelyByUniqueID = v2->_passesToUpdateRemotelyByUniqueID;
    v2->_passesToUpdateRemotelyByUniqueID = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    passesToUpdateLocallyByUniqueID = v2->_passesToUpdateLocallyByUniqueID;
    v2->_passesToUpdateLocallyByUniqueID = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    passesToRemoveRemotelyByUniqueID = v2->_passesToRemoveRemotelyByUniqueID;
    v2->_passesToRemoveRemotelyByUniqueID = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    passesToRemoveLocallyByUniqueID = v2->_passesToRemoveLocallyByUniqueID;
    v2->_passesToRemoveLocallyByUniqueID = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    conflctingRemotePassesByUniqueID = v2->_conflctingRemotePassesByUniqueID;
    v2->_conflctingRemotePassesByUniqueID = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    changeEventsToErase = v2->_changeEventsToErase;
    v2->_changeEventsToErase = v15;

    v2->_shouldDelayExecutionOfRemotePortion = 0;
  }

  return v2;
}

- (NSArray)passesToAddRemotely
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_passesToAddRemotelyByUniqueID, "allValues");
}

- (NSArray)passesToUpdateRemotely
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_passesToUpdateRemotelyByUniqueID, "allValues");
}

- (NSArray)passesToUpdateLocally
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_passesToUpdateLocallyByUniqueID, "allValues");
}

- (NSArray)passesToRemoveRemotely
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_passesToRemoveRemotelyByUniqueID, "allValues");
}

- (NSArray)passesToRemoveLocally
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_passesToRemoveLocallyByUniqueID, "allValues");
}

- (NSArray)conflictingRemotePasses
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_conflctingRemotePassesByUniqueID, "allValues");
}

- (NSArray)changeEventsToErase
{
  return (NSArray *)-[NSMutableArray copy](self->_changeEventsToErase, "copy");
}

- (BOOL)isEmpty
{
  if (-[PDCardCloudManagerSaveRequest hasLocalPortion](self, "hasLocalPortion")) {
    return 0;
  }
  else {
    return !-[PDCardCloudManagerSaveRequest hasRemotePortion](self, "hasRemotePortion");
  }
}

- (BOOL)hasLocalPortion
{
  return -[NSMutableDictionary count](self->_passesToUpdateLocallyByUniqueID, "count")
      || -[NSMutableDictionary count](self->_passesToRemoveLocallyByUniqueID, "count")
      || -[NSMutableDictionary count](self->_conflctingRemotePassesByUniqueID, "count")
      || -[NSMutableArray count](self->_changeEventsToErase, "count")
      || self->_catalogToUpdateLocally != 0LL;
}

- (BOOL)hasRemotePortion
{
  return -[NSMutableDictionary count](self->_passesToAddRemotelyByUniqueID, "count")
      || -[NSMutableDictionary count](self->_passesToUpdateRemotelyByUniqueID, "count")
      || -[NSMutableDictionary count](self->_passesToRemoveRemotelyByUniqueID, "count")
      || self->_catalogToUpdateRemotely != 0LL;
}

- (BOOL)shouldDelayExecutionOfRemotePortion
{
  return self->_shouldDelayExecutionOfRemotePortion;
}

- (void)addRemotePass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_passesToAddRemotelyByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)updateRemotePassWithPass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_passesToUpdateRemotelyByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)updateLocalPassWithPass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_passesToUpdateLocallyByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)removeRemotePass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_passesToRemoveRemotelyByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)removeLocalPass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_passesToRemoveLocallyByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)resolveRemoteConflictingPass:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_conflctingRemotePassesByUniqueID,  "setObject:forKeyedSubscript:",  v5,  v4);
  }
}

- (void)updateLocalCatalogWithCatalog:(id)a3
{
}

- (void)updateRemoteCatalogWithCatalog:(id)a3
{
}

- (void)eraseChangeEvent:(id)a3
{
}

- (void)delayExecutionOfRemotePortion
{
  self->_shouldDelayExecutionOfRemotePortion = 1;
}

- (NSArray)uniqueIDsOfPassesToAddRemotely
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_passesToAddRemotelyByUniqueID, "allKeys");
}

- (NSArray)uniqueIDsOfPassesToUpdateRemotely
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_passesToUpdateRemotelyByUniqueID, "allKeys");
}

- (NSArray)uniqueIDsOfPassesToUpdateLocally
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_passesToUpdateLocallyByUniqueID, "allKeys");
}

- (NSArray)uniqueIDsOfPassesToRemoveRemotely
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_passesToRemoveRemotelyByUniqueID, "allKeys");
}

- (NSArray)uniqueIDsOfPassesToRemoveLocally
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_passesToRemoveLocallyByUniqueID, "allKeys");
}

- (NSArray)uniqueIDsOfConflictingRemotePasses
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_conflctingRemotePassesByUniqueID, "allKeys");
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"PDCardCloudManagerSaveRequest: \n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerSaveRequest uniqueIDsOfPassesToAddRemotely](self, "uniqueIDsOfPassesToAddRemotely"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"remote adds: %@ \n", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerSaveRequest uniqueIDsOfPassesToUpdateRemotely]( self,  "uniqueIDsOfPassesToUpdateRemotely"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"remote updates: %@ \n", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerSaveRequest uniqueIDsOfPassesToUpdateLocally]( self,  "uniqueIDsOfPassesToUpdateLocally"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"local updates: %@ \n", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerSaveRequest uniqueIDsOfPassesToRemoveRemotely]( self,  "uniqueIDsOfPassesToRemoveRemotely"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"remote deletes: %@ \n", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerSaveRequest uniqueIDsOfPassesToRemoveLocally]( self,  "uniqueIDsOfPassesToRemoveLocally"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"local deletes: %@ \n", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerSaveRequest uniqueIDsOfConflictingRemotePasses]( self,  "uniqueIDsOfConflictingRemotePasses"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"conflicts: %@ \n", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerSaveRequest catalogToUpdateRemotely](self, "catalogToUpdateRemotely"));
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"remote catalog: %@ \n", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerSaveRequest catalogToUpdateLocally](self, "catalogToUpdateLocally"));
  if (v12) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"local catalog: %@ \n", v13);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"change events: %@ \n", self->_changeEventsToErase);
  id v14 = -[NSMutableString copy](v3, "copy");

  return v14;
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (PKCatalog)catalogToUpdateRemotely
{
  return self->_catalogToUpdateRemotely;
}

- (PKCatalog)catalogToUpdateLocally
{
  return self->_catalogToUpdateLocally;
}

- (void).cxx_destruct
{
}

@end