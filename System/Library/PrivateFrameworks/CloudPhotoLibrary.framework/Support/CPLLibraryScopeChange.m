@interface CPLLibraryScopeChange
- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5;
@end

@implementation CPLLibraryScopeChange

- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36 = self;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___CPLLibraryScopeChange;
  v34 = v9;
  -[CPLLibraryScopeChange updateWithLibraryInfoCKRecord:zone:userRecordID:]( &v43,  "updateWithLibraryInfoCKRecord:zone:userRecordID:",  v8,  v9,  v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"linkedShareZoneJoinContinuationToken"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"linkedShareZoneNameList"]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"linkedShareZoneOwnerList"]);
  if ([v11 count])
  {
    id v12 = [v11 count];
    id v13 = [v37 count];
    if (v12 == v13 && (v14 = [v11 count], id v13 = objc_msgSend(v35, "count"), v14 == v13))
    {
      v15 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v11 count]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10005CD44;
      v38[3] = &unk_100240728;
      id v39 = v37;
      id v40 = v10;
      id v41 = v35;
      v16 = v15;
      v42 = v16;
      [v11 enumerateObjectsUsingBlock:v38];
      -[CPLLibraryScopeChange setRewindAnchorsPerSharingScopes:](v36, "setRewindAnchorsPerSharingScopes:", v16);
    }

    else if (!_CPLSilentLogging)
    {
      uint64_t v17 = __CPLGenericOSLogDomain(v13);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cpl_zoneName"));
        *(_DWORD *)buf = 138412546;
        v45 = v20;
        __int16 v46 = 2112;
        id v47 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Invalid rewind tokens in %@:\n%@",  buf,  0x16u);
      }
    }
  }

  else
  {
    -[CPLLibraryScopeChange setRewindAnchorsPerSharingScopes:](v36, "setRewindAnchorsPerSharingScopes:", 0LL);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"quarantinedSharedLibraryExitZoneName"]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"quarantinedSharedLibraryExitZoneOwner"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringForKey:@"CPLSimulateQuarantinedSharedLibraryExitZoneName"]);

  if (v24 && [v24 length])
  {
    id v25 = v24;

    v21 = v25;
  }

  else if (!v21)
  {
    -[CPLLibraryScopeChange setProblematicFormerSharedScopeIdentifier:]( v36,  "setProblematicFormerSharedScopeIdentifier:",  0LL);
    v21 = 0LL;
    goto LABEL_19;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v22 recordID]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 recordName]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  unsigned int v29 = [v27 isEqualToString:v28];

  if (v29)
  {
    v30 = v21;
  }

  else
  {
    v31 = objc_alloc(&OBJC_CLASS___NSString);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v22 recordID]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 recordName]);
    v30 = -[NSString initWithFormat:](v31, "initWithFormat:", @"%@#%@", v21, v33);
  }

  -[CPLLibraryScopeChange setProblematicFormerSharedScopeIdentifier:]( v36,  "setProblematicFormerSharedScopeIdentifier:",  v30);

LABEL_19:
}

@end