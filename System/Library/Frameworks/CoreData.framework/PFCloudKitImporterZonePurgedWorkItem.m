@interface PFCloudKitImporterZonePurgedWorkItem
- (PFCloudKitImporterZonePurgedWorkItem)initWithPurgedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5;
- (id)description;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
@end

@implementation PFCloudKitImporterZonePurgedWorkItem

- (PFCloudKitImporterZonePurgedWorkItem)initWithPurgedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZonePurgedWorkItem;
  v6 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6) {
    v6->_purgedRecordZoneID = (CKRecordZoneID *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_purgedRecordZoneID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZonePurgedWorkItem;
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
  [v7 appendFormat:@" { %@ }", self->_purgedRecordZoneID];
  return v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1895F89C0];
  uint64_t v31 = 0LL;
  id v9 = (id)[a3 mirroringDelegate];
  id v10 = objc_alloc(MEMORY[0x189607950]);
  v35 = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
  v36[0] = &unk_189F04488;
  v11 = (void *)objc_msgSend( v10,  "initWithName:object:userInfo:",  @"NSCloudKitMirroringDelegateWillResetSyncNotificationName",  v9,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  [v9 logResetSyncNotification:v11];
  objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v11);

  if (self && (options = self->super._options) != 0LL && (v13 = options->_options) != 0LL) {
    uint64_t metadataPurger = (uint64_t)v13->_metadataPurger;
  }
  else {
    uint64_t metadataPurger = 0LL;
  }
  purgedRecordZoneID = self->_purgedRecordZoneID;
  uint64_t v15 = [MEMORY[0x189603F18] arrayWithObjects:&purgedRecordZoneID count:1];
  v16 = self->super._options;
  if (v16) {
    v17 = v16->_options;
  }
  else {
    v17 = 0LL;
  }
  if (-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]( metadataPurger,  (uint64_t)a3,  (uint64_t)a4,  9LL,  v15,  -[NSCloudKitMirroringDelegateOptions databaseScope](v17, "databaseScope"),  @"NSCloudKitMirroringDelegate.reset",  &v31))
  {
    id v18 = objc_alloc(MEMORY[0x189607950]);
    v32 = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v33 = &unk_189F04488;
    v19 = (void *)objc_msgSend( v18,  "initWithName:object:userInfo:",  @"NSCloudKitMirroringDelegateDidResetSyncNotificationName",  v9,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    [v9 logResetSyncNotification:v19];
    objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v19);

    v20 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    request = self->super._request;
    uint64_t v22 = [a3 identifier];
    v23 = v20;
    v24 = request;
    uint64_t v25 = 1LL;
    uint64_t v26 = 1LL;
    uint64_t v27 = 0LL;
  }

  else
  {
    v28 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    v29 = self->super._request;
    uint64_t v22 = [a3 identifier];
    uint64_t v27 = v31;
    v23 = v28;
    v24 = v29;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
  }

  v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v23,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v24,  v22,  v25,  v26,  v27);
  if (a5) {
    (*((void (**)(id, NSCloudKitMirroringResult *))a5 + 2))(a5, v30);
  }
}

@end