@interface PFCloudKitImporterZoneDeletedWorkItem
- (PFCloudKitImporterZoneDeletedWorkItem)initWithDeletedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5;
- (id)description;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
@end

@implementation PFCloudKitImporterZoneDeletedWorkItem

- (PFCloudKitImporterZoneDeletedWorkItem)initWithDeletedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneDeletedWorkItem;
  v6 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6) {
    v6->_deletedRecordZoneID = (CKRecordZoneID *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_deletedRecordZoneID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneDeletedWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x189607940]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super._request;
  }
  else {
    request = 0LL;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];
  [v7 appendFormat:@" { %@ }", self->_deletedRecordZoneID];
  return v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x1895F89C0];
  uint64_t v26 = 0LL;
  if (self)
  {
    options = self->super._options;
    if (options) {
      v10 = options->_options;
    }
    else {
      v10 = 0LL;
    }
    uint64_t v11 = -[NSCloudKitMirroringDelegateOptions databaseScope](v10, "databaseScope");
    if (v11 == 3) {
      uint64_t v12 = 299LL;
    }
    else {
      uint64_t v12 = 298LL;
    }
    v13 = self->super._options;
    if (v13 && (v14 = v13->_options) != 0LL) {
      uint64_t metadataPurger = (uint64_t)v14->_metadataPurger;
    }
    else {
      uint64_t metadataPurger = 0LL;
    }
  }

  else
  {
    uint64_t v11 = [0 databaseScope];
    uint64_t metadataPurger = 0LL;
    if (v11 == 3) {
      uint64_t v12 = 299LL;
    }
    else {
      uint64_t v12 = 298LL;
    }
  }

  v27[0] = self->_deletedRecordZoneID;
  BOOL v16 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]( metadataPurger,  (uint64_t)a3,  (uint64_t)a4,  v12,  [MEMORY[0x189603F18] arrayWithObjects:v27 count:1],  v11,  @"NSCloudKitMirroringDelegate.import",  &v26);
  v17 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
  request = self->super._request;
  uint64_t v19 = [a3 identifier];
  if (v16)
  {
    v20 = v17;
    v21 = request;
    uint64_t v22 = 1LL;
    uint64_t v23 = 1LL;
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v24 = v26;
    v20 = v17;
    v21 = request;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
  }

  v25 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v20,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v21,  v19,  v22,  v23,  v24);
  if (a5) {
    (*((void (**)(id, NSCloudKitMirroringResult *))a5 + 2))(a5, v25);
  }
}

@end