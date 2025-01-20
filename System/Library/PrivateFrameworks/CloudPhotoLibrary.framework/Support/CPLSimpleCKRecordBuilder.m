@interface CPLSimpleCKRecordBuilder
- (CKRecord)ckRecord;
- (CKRecordID)currentUserRecordID;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLRecordTargetMapping)targetMapping;
- (CPLSimpleCKRecordBuilder)initWithBaseCKRecord:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 targetMapping:(id)a6;
- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6;
- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5;
- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CPLSimpleCKRecordBuilder

- (CPLSimpleCKRecordBuilder)initWithBaseCKRecord:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 targetMapping:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLSimpleCKRecordBuilder;
  v15 = -[CPLSimpleCKRecordBuilder init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_ckRecord, a3);
    objc_storeStrong((id *)&v16->_scopeProvider, a4);
    objc_storeStrong((id *)&v16->_currentUserRecordID, a5);
    objc_storeStrong((id *)&v16->_targetMapping, a6);
  }

  return v16;
}

- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  scopeProvider = self->_scopeProvider;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitScopeProvider cloudKitScopeForScopeIdentifier:]( scopeProvider,  "cloudKitScopeForScopeIdentifier:",  v10));

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    a5 = (id *)objc_claimAutoreleasedReturnValue([v11 recordIDWithRecordName:v12]);

    *a4 = v11;
  }

  else if (a5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2001LL,  @"Can't find CloudKit scope for %@",  v13));

    a5 = 0LL;
  }

  return a5;
}

- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v9));
  if (!v10) {
    sub_100191008((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
  }
  id v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceScopedIdentifier]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLSimpleCKRecordBuilder _recordIDFromScopedIdentifier:cloudKitScope:error:]( self,  "_recordIDFromScopedIdentifier:cloudKitScope:error:",  v12,  a4,  a5));

  return v13;
}

- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5
{
  id v16 = a3;
  if (v16)
  {
    id v8 = a4;
    id v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_ckRecord, "recordID"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
    id v13 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", v10, v12);

    id v14 = -[CKReference initWithRecordID:action:]( objc_alloc(&OBJC_CLASS___CKReference),  "initWithRecordID:action:",  v13,  a5);
    -[CKRecord setObject:forKey:](self->_ckRecord, "setObject:forKey:", v14, v8);
  }

  else
  {
    ckRecord = self->_ckRecord;
    id v13 = (CKRecordID *)a4;
    -[CKRecord setObject:forKey:](ckRecord, "setObject:forKey:", 0LL, v13);
  }
}

- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
}

- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/C PLCKRecordBuilder.m"));
  v17 = NSStringFromSelector(a2);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v15 handleFailureInMethod:a2, self, v16, 88, @"%@ is not supported by %@", v18, objc_opt_class(self) object file lineNumber description];

  abort();
}

- (CKRecord)ckRecord
{
  return self->_ckRecord;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (CKRecordID)currentUserRecordID
{
  return self->_currentUserRecordID;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
}

@end