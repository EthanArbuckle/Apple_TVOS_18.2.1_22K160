@interface CPLRecordChange
+ (id)assetTransferOptionsByRecordTypeAndKey;
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4;
- (BOOL)fillCKRecordBuilderWithResourceChange:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6;
- (BOOL)fillResourcesOfCKRecordBuilder:(id)a3 clearMissing:(BOOL)a4 resourceCountAndSize:(id)a5 scopeProvider:(id)a6 error:(id *)a7;
- (BOOL)prepareWithCKRecordBuilder:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6;
- (BOOL)shouldAppearInCKUploadContext;
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3;
- (BOOL)shouldUseEncryptedPropertiesIfPossibleWithContext:(id)a3;
- (void)fillCKRecord:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3 missingResourceProperties:(id *)a4 scopeProvider:(id)a5;
- (void)prepareWithCKRecord:(id)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6;
@end

@implementation CPLRecordChange

+ (id)assetTransferOptionsByRecordTypeAndKey
{
  if (qword_1002962C8 != -1) {
    dispatch_once(&qword_1002962C8, &stru_100240F30);
  }
  return (id)qword_1002962D0;
}

- (BOOL)fillResourcesOfCKRecordBuilder:(id)a3 clearMissing:(BOOL)a4 resourceCountAndSize:(id)a5 scopeProvider:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier"));
  unsigned int v16 = -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources");
  if (v15)
  {
    id v142 = 0LL;
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v12 recordIDForResourcesOfRecordWithScopedIdentifier:v15 cloudKitScope:&v142 error:a7]);
    id v18 = v142;
    if (!v17)
    {
      BOOL v19 = 0;
      goto LABEL_107;
    }
  }

  else
  {
    id v18 = 0LL;
    v17 = 0LL;
  }

  id v108 = v18;
  v109 = a7;
  v113 = v15;
  int v118 = v16 ^ 1;
  int v112 = v10 & (v16 ^ 1);
  if (v112) {
    bzero(v150, 0x3E9uLL);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange resources](self, "resources"));
  v111 = v14;
  v120 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerprintContext]);
  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v138 objects:v149 count:16];
  if (!v22)
  {
    v24 = 0LL;
    int v54 = 0;
LABEL_91:

    BOOL v19 = v54 == 0;
    int v87 = v112;
    if (v54) {
      int v87 = 0;
    }
    if (v87 == 1)
    {
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472LL;
      v128[2] = sub_100070258;
      v128[3] = &unk_100240FA8;
      v130 = v150;
      v128[4] = self;
      id v129 = v12;
      +[CPLResource enumerateResourceTypesWithBlock:]( &OBJC_CLASS___CPLResource,  "enumerateResourceTypesWithBlock:",  v128);

      BOOL v19 = 1;
    }

    goto LABEL_106;
  }

  id v23 = v22;
  uint64_t v110 = (uint64_t)v13;
  v114 = v12;
  v107 = v17;
  char v121 = 0;
  LOBYTE(v126) = 0;
  v24 = 0LL;
  v25 = &OBJC_METACLASS___CPLCloudKitComputeStateEncryptionHelper;
  uint64_t v26 = *(void *)v139;
  v27 = &_s10Foundation17URLResourceValuesV8fileSizeSiSgvg_ptr;
  v122 = self;
  id v117 = v21;
LABEL_9:
  uint64_t v28 = 0LL;
  while (1)
  {
    if (*(void *)v139 != v26) {
      objc_enumerationMutation(v21);
    }
    v29 = *(void **)(*((void *)&v138 + 1) + 8 * v28);
    if ((CPLIsDynamicResource(v29) & 1) == 0
      && ([&v25[30] isFakeDerivative:v29] & 1) == 0)
    {
      if (!v24)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange fingerprintSchemeWithContext:](self, "fingerprintSchemeWithContext:", v120));
        unsigned int v126 = [v24 isForStableHash] ^ 1;
        char v121 = _CPLShouldValidateStableHash();
      }

      uint64_t v30 = (uint64_t)[v29 resourceType];
      if (([v27[485] shouldIgnoreResourceTypeOnUpload:v30] & 1) == 0)
      {
      }
    }

+ (id)ckAssetProperties
{
  return 0LL;
}

- (void)fillCKRecord:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___CPLSimpleRecordTargetMapping);
  BOOL v10 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  v7,  0LL,  0LL,  v9);
  id v14 = 0LL;
  unsigned __int8 v11 = -[CPLRecordChange prepareWithCKRecordBuilder:resourceCountAndSize:scopeProvider:error:]( self,  "prepareWithCKRecordBuilder:resourceCountAndSize:scopeProvider:error:",  v10,  0LL,  v8,  &v14);
  id v12 = v14;
  id v13 = v12;
  if ((v11 & 1) == 0) {
    sub_10019569C(v12, (uint64_t)a2, (uint64_t)self);
  }
}

- (BOOL)shouldAppearInCKUploadContext
{
  return 1;
}

- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldUseEncryptedPropertiesIfPossibleWithContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange fingerprintSchemeWithContext:](self, "fingerprintSchemeWithContext:", a3));
  unsigned __int8 v4 = [v3 isMMCSv2];

  return v4;
}

+ (id)ckPropertyForRelatedIdentifier
{
  return 0LL;
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CK Record+CPL_base.m"));
  id v8 = NSStringFromSelector(a2);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 handleFailureInMethod:a2, a1, v7, 1138, @"%@ should be implemented by subclasses", v9 object file lineNumber description];

  abort();
}

+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 ckPropertyForRelatedIdentifier]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 ckValueForRelatedRecord:v6]);
    [v9 setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)prepareWithCKRecord:(id)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 scopedIdentifierForCKRecordID:v15]);
  if (!v16) {
    sub_1001976A8((uint64_t)v15, (uint64_t)a2, (uint64_t)self);
  }
  v17 = (void *)v16;
  -[CPLRecordChange setScopedIdentifier:](self, "setScopedIdentifier:", v16);
  char v83 = 0;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "cpl_sharingRecordScopedIdentifierWithScopeProvider:currentUserRecordID:isSparseRecord:",  v13,  v14,  &v83));
  id v19 = -[CPLRecordChange supportsSharingScopedIdentifier](self, "supportsSharingScopedIdentifier");
  if ((_DWORD)v19)
  {
    -[CPLRecordChange setSharingRecordScopedIdentifier:](self, "setSharingRecordScopedIdentifier:", v18);
    if (v83)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange sharingRecordScopedIdentifier](self, "sharingRecordScopedIdentifier"));

      if (!v20)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v22 = __CPLGenericOSLogDomain(v21);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"linkedShareZoneName"]);
            id v69 = v13;
            uint64_t v72 = v15;
            id v67 = v14;
            id v25 = v12;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"linkedShareZoneOwner"]);
            v27 = v18;
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 recordID]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 recordName]);
            *(_DWORD *)buf = 138413058;
            id v86 = self;
            __int16 v87 = 2112;
            id v88 = v24;
            __int16 v89 = 2112;
            v90 = v29;
            __int16 v91 = 2112;
            id v92 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ is a sparse record pointing to an unknown or inactive sharing zone (%@#%@) - interpreting as a delete:\n %@",  buf,  0x2Au);

            id v18 = v27;
            id v12 = v25;
            id v14 = v67;
            id v13 = v69;
            v15 = v72;
          }

- (void)fillWithCKRecord:(id)a3 missingResourceProperties:(id *)a4 scopeProvider:(id)a5
{
  id v7 = a3;
  uint64_t v30 = self;
  id v31 = a5;
  id v8 = [(id)objc_opt_class(self) ckAssetProperties];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  v33 = v9;
  if (!v10)
  {
    id v12 = 0LL;
    id v34 = 0LL;
    goto LABEL_24;
  }

  id v11 = v10;
  id v12 = 0LL;
  id v34 = 0LL;
  id v13 = &_s10Foundation17URLResourceValuesV8fileSizeSiSgvg_ptr;
  uint64_t v14 = *(void *)v37;
  id v32 = v7;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v16]);
      if (v17)
      {
        uint64_t v18 = objc_opt_class(v13[354]);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          id v19 = (NSData *)objc_claimAutoreleasedReturnValue([v17 assetContent]);
          if (v19) {
            goto LABEL_9;
          }
          v20 = v12;
          uint64_t v21 = v13;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 fileURL]);
          if (v22
            && (id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                unsigned __int8 v24 = [v23 cplFileExistsAtURL:v22],
                v23,
                (v24 & 1) != 0))
          {
            id v19 = -[NSData initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfURL:", v22);

            id v13 = v21;
            id v12 = v20;
            id v7 = v32;
            id v9 = v33;
            if (v19)
            {
LABEL_9:
              if (!v12) {
                id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v16);

              goto LABEL_20;
            }
          }

          else
          {

            id v13 = v21;
            id v12 = v20;
            id v7 = v32;
            id v9 = v33;
          }

          id v25 = v34;
          if (!v34) {
            id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          id v34 = v25;
          -[NSMutableArray addObject:](v25, "addObject:", v16);
        }
      }

- (BOOL)prepareWithCKRecordBuilder:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (-[CPLRecordChange supportsResources](self, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8LL)
    && !-[CPLRecordChange fillCKRecordBuilderWithResourceChange:resourceCountAndSize:scopeProvider:error:]( self,  "fillCKRecordBuilderWithResourceChange:resourceCountAndSize:scopeProvider:error:",  v10,  v11,  v12,  a6))
  {
    BOOL v17 = 0;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange recordModificationDate](self, "recordModificationDate"));
    if (v13)
    {
      [v10 setObject:v13 forKey:@"recordModificationDate"];
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v10 setObject:v14 forKey:@"recordModificationDate"];
    }

    if (-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2LL)
      && (-[CPLRecordChange isMasterChange](self, "isMasterChange") & 1) == 0
      && -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2LL)
      && (-[CPLRecordChange supportsDirectDeletion](self, "supportsDirectDeletion") & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange attachedDiffTracker](self, "attachedDiffTracker"));
      if (!v15
        || (-[CPLRecordChange isFullRecord](self, "isFullRecord") & 1) != 0
        || ([v15 areObjectsDifferentOnProperty:@"inTrash" changeType:2] & 1) != 0
        || -[CPLRecordChange inExpunged](self, "inExpunged"))
      {
        else {
          uint64_t v16 = (uint64_t)-[CPLRecordChange inExpunged](self, "inExpunged");
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
        [v10 setObject:v18 forKey:@"isDeleted"];

        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLRecordChange inExpunged](self, "inExpunged")));
        [v10 setObject:v19 forKey:@"isExpunged"];
      }

      else if (-[CPLRecordChange isFullRecord](self, "isFullRecord"))
      {
        [v10 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
      }
    }

    -[CPLRecordChange fillCKRecordBuilder:scopeProvider:](self, "fillCKRecordBuilder:scopeProvider:", v10, v12);
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)fillCKRecordBuilderWithResourceChange:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(a6) = -[CPLRecordChange fillResourcesOfCKRecordBuilder:clearMissing:resourceCountAndSize:scopeProvider:error:]( self,  "fillResourcesOfCKRecordBuilder:clearMissing:resourceCountAndSize:scopeProvider:error:",  v12,  -[CPLRecordChange shouldClearMissingResourcesInCKRecord](self, "shouldClearMissingResourcesInCKRecord"),  v11,  v10,  a6);

  return (char)a6;
}

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 1;
}

@end