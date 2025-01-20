@interface PFCKRecordConflictResolver
- (PFCKRecordConflictResolver)initWithAncestorRecord:(id)a3 serverRecord:(id)a4 clientRecord:(id)a5;
- (void)dealloc;
@end

@implementation PFCKRecordConflictResolver

- (PFCKRecordConflictResolver)initWithAncestorRecord:(id)a3 serverRecord:(id)a4 clientRecord:(id)a5
{
  v42[1] = *MEMORY[0x1895F89C0];
  if (a3 && (getCloudKitCKShareClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a4 && (getCloudKitCKShareClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a5 && (getCloudKitCKShareClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Conflict resolver only knows how to work with CKShares today."];
    _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, v30);
    v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Conflict resolver only knows how to work with CKShares today.",  buf,  2u);
    }
  }

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PFCKRecordConflictResolver;
  v17 = -[PFCKRecordConflictResolver init](&v31, sel_init);
  if (v17)
  {
    v17->_ancestorRecord = (CKShare *)a3;
    v17->_serverRecord = (CKShare *)a4;
    v17->_clientRecord = (CKShare *)a5;
    objc_opt_self();
    v18 = objc_alloc_init(&OBJC_CLASS___NSManagedObjectModel);
    v19 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
    v20 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setName:](v19, "setName:", NSStringFromClass(v20));
    v21 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setManagedObjectClassName:](v19, "setManagedObjectClassName:", NSStringFromClass(v21));
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]( (uint64_t)&OBJC_CLASS____PFModelUtilities,  &unk_189F031D0,  v19);
    -[NSEntityDescription setUniquenessConstraints:](v19, "setUniquenessConstraints:", &unk_189F0B118);
    v22 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
    v23 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setName:](v22, "setName:", NSStringFromClass(v23));
    v24 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setManagedObjectClassName:](v22, "setManagedObjectClassName:", NSStringFromClass(v24));
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]( (uint64_t)&OBJC_CLASS____PFModelUtilities,  &unk_189F031F8,  v22);
    -[NSEntityDescription setUniquenessConstraints:](v22, "setUniquenessConstraints:", &unk_189F0B160);
    v41 = @"participants";
    v40[0] = &unk_189F042F0;
    v40[1] = v22;
    v40[2] = [MEMORY[0x189603FE8] null];
    v40[3] = &unk_189F04308;
    v42[0] = [MEMORY[0x189603F18] arrayWithObjects:v40 count:4];
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]( (uint64_t)_PFModelUtilities,  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:&v41 count:1],  v19);
    v38 = @"share";
    *(void *)buf = &unk_189F04320;
    v34 = v19;
    v35 = @"participants";
    v36 = &unk_189F04338;
    v37 = &unk_189F042F0;
    uint64_t v39 = [MEMORY[0x189603F18] arrayWithObjects:buf count:5];
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]( (uint64_t)_PFModelUtilities,  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v39 forKeys:&v38 count:1],  v22);
    v32[0] = v19;
    v32[1] = v22;
    -[NSManagedObjectModel setEntities:]( v18,  "setEntities:",  [MEMORY[0x189603F18] arrayWithObjects:v32 count:2]);

    v25 = objc_alloc(&OBJC_CLASS___NSPersistentContainer);
    v26 = (void *)NSString;
    v27 = (objc_class *)objc_opt_class();
    v28 = -[NSPersistentContainer initWithName:managedObjectModel:]( v25,  "initWithName:managedObjectModel:",  [v26 stringWithFormat:@"%@-%p", NSStringFromClass(v27), v17],  v18);
    v17->_container = v28;
    objc_msgSend( -[NSArray objectAtIndexedSubscript:]( -[NSPersistentContainer persistentStoreDescriptions](v17->_container, "persistentStoreDescriptions"),  "objectAtIndexedSubscript:",  0),  "setURL:",  objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  objc_msgSend( NSString,  "stringWithFormat:",  @"/dev/null/%@",  -[NSPersistentContainer name](v28, "name"))));

    v17->_allParticipantsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v17->_participantObjectIDsByParticipantID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v17->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v17;
}

- (void)dealloc
{
  self->_ancestorRecord = 0LL;
  self->_serverRecord = 0LL;

  self->_clientRecord = 0LL;
  self->_resolvedRecord = 0LL;

  self->_container = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCKRecordConflictResolver;
  -[PFCKRecordConflictResolver dealloc](&v3, sel_dealloc);
}

@end