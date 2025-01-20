@interface DBGDataCoordinatorTargetHub
- (NSMutableDictionary)pendingChildNodes;
- (id)_createNodeWithDict:(id)a3;
- (id)_decompressedDataForRequestResponseData:(id)a3;
- (id)compatibility_modernizedPropertyDescription:(id)a3 targetVersion:(float)a4;
- (void)_addNodeToMatchingRootLevelGroup:(id)a3;
- (void)_processFetchResults:(id)a3 forRequest:(id)a4;
- (void)_processRequestLogs:(id)a3 forRequest:(id)a4;
- (void)_updateComputedPropertiesOfNode:(id)a3;
- (void)_updateGroup:(id)a3 withDict:(id)a4;
- (void)_updateNode:(id)a3 withDict:(id)a4;
- (void)_updatePropertiesWithDicts:(id)a3 onNode:(id)a4;
- (void)_updateProperty:(id)a3 withDict:(id)a4;
- (void)_updateSnapshotWithResponse:(id)a3 forRequest:(id)a4;
- (void)_updateSubHierarchyOfProperty:(id)a3;
- (void)_updateSubpropertiesWithDicts:(id)a3 onProperty:(id)a4;
- (void)_writeRequestResponseToDiskIfNecessary:(id)a3 request:(id)a4 compressedSize:(unint64_t)a5;
- (void)didReceiveData:(id)a3 forRequest:(id)a4;
- (void)processDebugHierarchyObjectDict:(id)a3 inGroup:(id)a4 isDirectChildGroup:(BOOL)a5;
- (void)processGroupDict:(id)a3 isDirectChildGroup:(BOOL)a4 parentNode:(id)a5;
- (void)setPendingChildNodes:(id)a3;
@end

@implementation DBGDataCoordinatorTargetHub

- (void)didReceiveData:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DBGDataCoordinatorTargetHub;
  -[DBGDataCoordinator didReceiveData:forRequest:](&v12, "didReceiveData:forRequest:", v6, v7);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[DBGDataCoordinatorTargetHub _decompressedDataForRequestResponseData:]( self,  "_decompressedDataForRequestResponseData:",  v6));
    if (v8)
    {
      id v11 = 0LL;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithJSONData:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithJSONData:error:",  v8,  &v11));
      id v10 = v11;
      -[DBGDataCoordinatorTargetHub _writeRequestResponseToDiskIfNecessary:request:compressedSize:]( self,  "_writeRequestResponseToDiskIfNecessary:request:compressedSize:",  v9,  v7,  [v6 length]);
      if (v10)
      {
LABEL_7:

        goto LABEL_8;
      }
    }

    else
    {
      v9 = 0LL;
    }

    -[DBGDataCoordinatorTargetHub _processFetchResults:forRequest:](self, "_processFetchResults:forRequest:", v9, v7);
    id v10 = 0LL;
    goto LABEL_7;
  }

- (id)_decompressedDataForRequestResponseData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator dataSourceConnection](self, "dataSourceConnection"));
  [v5 debugHierarchyVersion];
  float v7 = v6;

  if (v7 <= 2.1) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dbg_gzipInflateRaw"));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dbg_gzipInflateIfCompressed"));
  }
  v9 = (void *)v8;

  return v9;
}

- (void)_processFetchResults:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DebugHierarchySnapshotModelOSLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);
  id v11 = v9;
  objc_super v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v61 = 136446466;
    v62 = "All";
    __int16 v63 = 2114;
    v64 = v13;
    _os_signpost_emit_with_name_impl( &dword_0,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "Process Fetch Results",  "Process: %{public}s (%{public}@)",  (uint8_t *)&v61,  0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:DebugHierarchyRequestKey]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDictionary:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDictionary:",  v14));
  }

  else
  {
    v15 = 0LL;
  }

  id v16 = DebugHierarchySnapshotModelOSLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 logs]);
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v17, v18);

  v20 = v17;
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v61 = 136446466;
    v62 = "Logs";
    __int16 v63 = 2114;
    v64 = v22;
    _os_signpost_emit_with_name_impl( &dword_0,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "Process Fetch Results",  "Process: %{public}s (%{public}@)",  (uint8_t *)&v61,  0x16u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v15 logs]);
  -[DBGDataCoordinatorTargetHub _processRequestLogs:forRequest:](self, "_processRequestLogs:forRequest:", v23, v7);

  id v24 = DebugHierarchySnapshotModelOSLog();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 logs]);
  os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v25, v26);

  v28 = v25;
  v29 = v28;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    LOWORD(v61) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v29,  OS_SIGNPOST_INTERVAL_END,  v27,  "Process Fetch Results",  "Completed",  (uint8_t *)&v61,  2u);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:DebugHierarchyRequestRuntimeInformationKey]);
  id v31 = DebugHierarchySnapshotModelOSLog();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, v30);
  v34 = v32;
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v61 = 136446466;
    v62 = "Runtime Info";
    __int16 v63 = 2114;
    v64 = v36;
    _os_signpost_emit_with_name_impl( &dword_0,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  v33,  "Process Fetch Results",  "Process: %{public}s (%{public}@)",  (uint8_t *)&v61,  0x16u);
  }

  if ([v30 count])
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRuntimeInfo runtimeInfoWithSerializedRepresentation:]( &OBJC_CLASS___DebugHierarchyRuntimeInfo,  "runtimeInfoWithSerializedRepresentation:",  v30));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 runtimeInfo]);
    [v39 mergeWith:v37];
  }

  id v40 = DebugHierarchySnapshotModelOSLog();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  os_signpost_id_t v42 = os_signpost_id_make_with_pointer(v41, v30);
  v43 = v41;
  v44 = v43;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    LOWORD(v61) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v44,  OS_SIGNPOST_INTERVAL_END,  v42,  "Process Fetch Results",  "Completed",  (uint8_t *)&v61,  2u);
  }

  id v45 = DebugHierarchySnapshotModelOSLog();
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  os_signpost_id_t v47 = os_signpost_id_make_with_pointer(v46, v6);
  v48 = v46;
  v49 = v48;
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v61 = 136446466;
    v62 = "Snapshot Model";
    __int16 v63 = 2114;
    v64 = v50;
    _os_signpost_emit_with_name_impl( &dword_0,  v49,  OS_SIGNPOST_INTERVAL_BEGIN,  v47,  "Process Fetch Results",  "Process: %{public}s (%{public}@)",  (uint8_t *)&v61,  0x16u);
  }

  -[DBGDataCoordinatorTargetHub _updateSnapshotWithResponse:forRequest:]( self,  "_updateSnapshotWithResponse:forRequest:",  v6,  v7);
  id v51 = DebugHierarchySnapshotModelOSLog();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  os_signpost_id_t v53 = os_signpost_id_make_with_pointer(v52, v6);
  v54 = v52;
  v55 = v54;
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    LOWORD(v61) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v55,  OS_SIGNPOST_INTERVAL_END,  v53,  "Process Fetch Results",  "Completed",  (uint8_t *)&v61,  2u);
  }

  id v56 = DebugHierarchySnapshotModelOSLog();
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  os_signpost_id_t v58 = os_signpost_id_make_with_pointer(v57, v7);
  v59 = v57;
  v60 = v59;
  if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
  {
    LOWORD(v61) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v60,  OS_SIGNPOST_INTERVAL_END,  v58,  "Process Fetch Results",  "Completed",  (uint8_t *)&v61,  2u);
  }
}

- (void)_processRequestLogs:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 logs]);
    id v9 = [v8 count];

    if (v9)
    {
      os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 logs]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 arrayByAddingObjectsFromArray:v6]);
      [v7 setLogs:v11];
    }

    else
    {
      [v7 setLogs:v6];
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager", (void)v19));
          [v18 logMessage:v17];
        }

        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v14);
    }
  }
}

- (void)_updateSnapshotWithResponse:(id)a3 forRequest:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[DBGDataCoordinatorTargetHub setPendingChildNodes:](self, "setPendingChildNodes:", v6);

  v38 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:DebugHierarchyRequestTopLevelGroupsKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v38 allValues]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        -[DBGDataCoordinatorTargetHub processGroupDict:isDirectChildGroup:parentNode:]( self,  "processGroupDict:isDirectChildGroup:parentNode:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i),  1LL,  0LL);
      }

      id v9 = [v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v9);
  }

  -[DBGDataCoordinatorTargetHub setPendingChildNodes:](self, "setPendingChildNodes:", 0LL, v7);
  v39 = v5;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:DebugHierarchyRequestTopLevelPropertyDescriptionsKey]);
  id obj = (id)objc_claimAutoreleasedReturnValue([v40 keyEnumerator]);
  id v12 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      uint64_t v15 = 0LL;
      id v41 = v13;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v15);
        id v17 = [v16 rangeOfString:@"."];
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 substringToIndex:v17]);
          __int128 v19 = self;
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 snapshot]);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifierToNodeMap]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v18]);

          if (v23)
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v16]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"fetchStatus"]);
            v26 = v25;
            if (!v25 || ((unint64_t)[v25 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFF7) != 0)
            {
              os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"propertyName"]);
              v28 = (void *)objc_claimAutoreleasedReturnValue([v23 propertyWithName:v27]);
              -[DBGDataCoordinatorTargetHub _updateProperty:withDict:](v19, "_updateProperty:withDict:", v28, v24);
            }
          }

          id v13 = v41;
          self = v19;
        }

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }

    while (v13);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformers](self, "snapshotTransformers"));
  id v30 = [v29 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 snapshot]);
        [v34 snapshotDidUpdate:v36];
      }

      id v31 = [v29 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }

    while (v31);
  }
}

- (void)processGroupDict:(id)a3 isDirectChildGroup:(BOOL)a4 parentNode:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 snapshot]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"groupingID"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"debugHierarchyObjects"]);
  if (v9)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 groupWithID:v12]);
    if (v14) {
      goto LABEL_9;
    }
    if (v6)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:]( &OBJC_CLASS___DBGSnapshotGroup,  "strongObjectsGroupWithIdentifier:",  v12));
      [v9 setChildGroup:v14];
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotGroup weakObjectsGroupWithIdentifier:]( &OBJC_CLASS___DBGSnapshotGroup,  "weakObjectsGroupWithIdentifier:",  v12));
      [v9 addAdditonalGroup:v14];
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 rootLevelSnapshotGroupWithIdentifier:v12]);
    if (!v14)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:]( &OBJC_CLASS___DBGSnapshotGroup,  "strongObjectsGroupWithIdentifier:",  v12));
      [v11 addRootLevelGroup:v14];
    }
  }

  -[DBGDataCoordinatorTargetHub _updateGroup:withDict:](self, "_updateGroup:withDict:", v14, v8);
LABEL_9:
  __int128 v21 = v9;
  uint64_t v15 = v11;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        -[DBGDataCoordinatorTargetHub processDebugHierarchyObjectDict:inGroup:isDirectChildGroup:]( self,  "processDebugHierarchyObjectDict:inGroup:isDirectChildGroup:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i),  v14,  v6);
      }

      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v18);
  }
}

- (void)processDebugHierarchyObjectDict:(id)a3 inGroup:(id)a4 isDirectChildGroup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 snapshot]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"objectID"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinatorTargetHub pendingChildNodes](self, "pendingChildNodes"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

  uint64_t v15 = (void *)v14;
  __int128 v25 = v11;
  if (v14
    || (id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 identifierToNodeMap]),
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v12]),
        v16,
        v15))
  {
    -[DBGDataCoordinatorTargetHub _updateNode:withDict:](self, "_updateNode:withDict:", v15, v8);
    [v9 addObject:v15];
    if (v14 && v5)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinatorTargetHub pendingChildNodes](self, "pendingChildNodes"));
      [v17 removeObjectForKey:v12];
    }
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinatorTargetHub _createNodeWithDict:](self, "_createNodeWithDict:", v8));
    if (v9)
    {
      if (!v5)
      {
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinatorTargetHub pendingChildNodes](self, "pendingChildNodes"));
        [v24 setObject:v15 forKeyedSubscript:v12];
      }

      [v9 addObject:v15];
    }

    else
    {
      -[DBGDataCoordinatorTargetHub _addNodeToMatchingRootLevelGroup:](self, "_addNodeToMatchingRootLevelGroup:", v15);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"childGroup"]);
  if (v18) {
    -[DBGDataCoordinatorTargetHub processGroupDict:isDirectChildGroup:parentNode:]( self,  "processGroupDict:isDirectChildGroup:parentNode:",  v18,  1LL,  v15);
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"additionalGroups"]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      __int128 v23 = 0LL;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        -[DBGDataCoordinatorTargetHub processGroupDict:isDirectChildGroup:parentNode:]( self,  "processGroupDict:isDirectChildGroup:parentNode:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v23),  0LL,  v15);
        __int128 v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v21);
  }
}

- (void)_addNodeToMatchingRootLevelGroup:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 childGroup]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 groupingIdentifier]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 snapshot]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootLevelSnapshotGroupWithIdentifier:v8]);

  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:]( &OBJC_CLASS___DBGSnapshotGroup,  "strongObjectsGroupWithIdentifier:",  v8));
  }
}

- (id)_createNodeWithDict:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"objectID"]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[DBGSnapshotNode nodeWithIdentifier:](&OBJC_CLASS___DBGSnapshotNode, "nodeWithIdentifier:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshot]);
  [v6 setSnapshot:v8];

  -[DBGDataCoordinatorTargetHub _updateNode:withDict:](self, "_updateNode:withDict:", v6, v4);
  return v6;
}

- (void)_updateGroup:(id)a3 withDict:(id)a4
{
  id v6 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:@"defaultDisplayName"]);
  if (v5) {
    [v6 setDefaultDisplayName:v5];
  }
}

- (void)_updateNode:(id)a3 withDict:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ((_DBGDictionaryDescribesDebugHierarchyObjectReference(v6) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"visibility"]);
    id v8 = [v7 integerValue];

    [v14 setVisibility:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"className"]);
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 runtimeInfo]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 typeWithName:v9]);
      [v14 setRuntimeType:v12];
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"properties"]);
    if ([v13 count]) {
      -[DBGDataCoordinatorTargetHub _updatePropertiesWithDicts:onNode:]( self,  "_updatePropertiesWithDicts:onNode:",  v13,  v14);
    }
  }
}

- (void)_updatePropertiesWithDicts:(id)a3 onNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        if ([v12 count])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"propertyName"]);
          if (v13)
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 propertyWithName:v13]);
            if (!v14)
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotProperty propertyWithName:]( &OBJC_CLASS___DBGSnapshotProperty,  "propertyWithName:",  v13));
              [v7 addProperty:v14];
            }

            -[DBGDataCoordinatorTargetHub _updateProperty:withDict:](self, "_updateProperty:withDict:", v14, v12);
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  -[DBGDataCoordinatorTargetHub _updateComputedPropertiesOfNode:](self, "_updateComputedPropertiesOfNode:", v7);
}

- (void)_updateProperty:(id)a3 withDict:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator dataSourceConnection](self, "dataSourceConnection"));
  [v7 debugHierarchyVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DBGDataCoordinatorTargetHub compatibility_modernizedPropertyDescription:targetVersion:]( self,  "compatibility_modernizedPropertyDescription:targetVersion:",  v6));

  [v12 updateWithJSONPropertyDescription:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"subproperties"]);
  -[DBGDataCoordinatorTargetHub _updateSubpropertiesWithDicts:onProperty:]( self,  "_updateSubpropertiesWithDicts:onProperty:",  v9,  v12);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
  unsigned int v11 = [v10 isEqualToString:@"dbgSubviewHierarchy"];

  if (v11) {
    -[DBGDataCoordinatorTargetHub _updateSubHierarchyOfProperty:](self, "_updateSubHierarchyOfProperty:", v12);
  }
}

- (void)_updateSubpropertiesWithDicts:(id)a3 onProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"propertyName"]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 subpropertyWithName:v13]);
        if (!v14)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotProperty propertyWithName:]( &OBJC_CLASS___DBGSnapshotProperty,  "propertyWithName:",  v13));
          [v7 addSubproperty:v14];
        }

        -[DBGDataCoordinatorTargetHub _updateProperty:withDict:](self, "_updateProperty:withDict:", v14, v12);
      }

      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (void)_updateSubHierarchyOfProperty:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataValue]);
  if ([v5 length])
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformers](self, "snapshotTransformers", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v10);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotManager](self, "snapshotManager"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 snapshot]);
          [v11 updateSnapshot:v13 withSubHierarchyProperty:v4];

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }
  }
}

- (void)_updateComputedPropertiesOfNode:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformers](self, "snapshotTransformers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateComputedPropertiesOfNode:v4];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)_writeRequestResponseToDiskIfNecessary:(id)a3 request:(id)a4 compressedSize:(unint64_t)a5
{
  id v34 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"DBGViewDebuggerWriteFetchedHierarchyToFile"]);

  if ([v9 length])
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByExpandingTildeInPath]);

    uint64_t v11 = DebugHierarchyRequestMetaDataKey;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:DebugHierarchyRequestMetaDataKey]);
    id v13 = [v12 mutableCopy];

    if (v13)
    {
      uint64_t v14 = DebugHierarchyRequestMetaDataRequestPerformanceKey;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:DebugHierarchyRequestMetaDataRequestPerformanceKey]);
      id v16 = [v15 mutableCopy];

      if (v16)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 executionEndDate]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 executionStartDate]);
        [v17 timeIntervalSinceDate:v18];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v16 setObject:v19 forKeyedSubscript:@"totalRequestExecutionDuration"];

        id v20 = objc_alloc_init(&OBJC_CLASS___NSByteCountFormatter);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSByteCountFormatter stringFromByteCount:](v20, "stringFromByteCount:", a5));
        [v16 setObject:v21 forKeyedSubscript:@"compressedSize"];

        [v13 setObject:v16 forKeyedSubscript:v14];
        id v22 = [v34 mutableCopy];
        [v22 setObject:v13 forKeyedSubscript:v11];
      }

      else
      {
        id v22 = 0LL;
      }
    }

    else
    {
      id v22 = 0LL;
    }

    __int128 v23 = v34;
    if (v22) {
      __int128 v23 = v22;
    }
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 generateJSONDataWithError:0]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 pathExtension]);
    id v26 = [v25 length];

    if (!v26)
    {
      __int128 v27 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
      if (!_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter)
      {
        __int128 v28 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
        __int128 v29 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
        _writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter = (uint64_t)v28;

        [(id)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter setDateFormat:@"HH-mm-ss.SSSS"];
        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
        [(id)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter setTimeZone:v30];

        __int128 v27 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v27 stringFromDate:v31]);
      uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@.json", v10, v32));

      __int128 v10 = (void *)v33;
    }

    [v24 writeToFile:v10 atomically:1];

    uint64_t v9 = v10;
  }
}

- (id)compatibility_modernizedPropertyDescription:(id)a3 targetVersion:(float)a4
{
  id v5 = a3;
  id v6 = v5;
  BOOL v7 = a4 < 2.0 && a4 == 1.0;
  id v8 = v5;
  if (!v7) {
    goto LABEL_20;
  }
  id v9 = [v5 mutableCopy];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"propertyValueStatus"]);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"propertyValue"]);

    if (v14) {
      uint64_t v13 = 4LL;
    }
    else {
      uint64_t v13 = 1LL;
    }
    goto LABEL_17;
  }

  __int128 v12 = (char *)[v10 unsignedIntegerValue];
  if (v12)
  {
    if (v12 == (_BYTE *)&dword_0 + 3)
    {
      uint64_t v13 = 8LL;
      goto LABEL_17;
    }

    if (v12 != (_BYTE *)&dword_0 + 1)
    {
      uint64_t v13 = 0LL;
      goto LABEL_17;
    }

    [v9 removeObjectForKey:@"propertyValue"];
  }

  uint64_t v13 = 4LL;
LABEL_17:
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v13));
  [v9 setObject:v15 forKeyedSubscript:@"fetchStatus"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"propertyVisibility"]);
  __int128 v17 = v16;
  if (v16) {
    [v16 integerValue];
  }
  id v8 = [v9 copy];

LABEL_20:
  return v8;
}

- (NSMutableDictionary)pendingChildNodes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPendingChildNodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end