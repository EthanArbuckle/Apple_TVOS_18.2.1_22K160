@interface PFMirroredOneToManyRelationship
- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5;
- (PFMirroredOneToManyRelationship)initWithManagedObject:(id)a3 withRecordName:(id)a4 relatedToRecordWithRecordName:(id)a5 byRelationship:(id)a6;
- (void)dealloc;
- (void)recordTypesToRecordIDs;
@end

@implementation PFMirroredOneToManyRelationship

- (PFMirroredOneToManyRelationship)initWithManagedObject:(id)a3 withRecordName:(id)a4 relatedToRecordWithRecordName:(id)a5 byRelationship:(id)a6
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PFMirroredOneToManyRelationship;
  v10 = -[PFMirroredOneToManyRelationship init](&v22, sel_init);
  if (v10)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "zoneID"), "isEqual:", objc_msgSend(a5, "zoneID")) & 1) == 0)
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@"];
      uint64_t v12 = [a6 name];
      _NSCoreDataLog(17LL, v11, v13, v14, v15, v16, v17, v18, v12);
      v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [a6 name];
        *(_DWORD *)buf = 138413058;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        id v26 = a4;
        __int16 v27 = 2112;
        id v28 = a5;
        __int16 v29 = 2112;
        id v30 = a3;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@",  buf,  0x2Au);
      }
    }

    v10->_recordID = (CKRecordID *)a4;
    v10->_relationshipDescription = (NSRelationshipDescription *)a6;
    v10->_inverseRelationshipDescription = (NSRelationshipDescription *)(id)[a6 inverseRelationship];
    v10->_relatedRecordID = (CKRecordID *)a5;
  }

  return v10;
}

- (void)dealloc
{
  self->_recordID = 0LL;
  self->_relationshipDescription = 0LL;

  self->_inverseRelationshipDescription = 0LL;
  self->_relatedRecordID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFMirroredOneToManyRelationship;
  -[PFMirroredOneToManyRelationship dealloc](&v3, sel_dealloc);
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  recordID = self->_recordID;
  v10 = -[NSEntityDescription name](-[NSPropertyDescription entity](self->_relationshipDescription, "entity"), "name");
  if (!a3
    || (uint64_t v11 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v10), "objectForKey:", recordID)) == 0)
  {
    uint64_t v25 = [NSString stringWithUTF8String:"Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@"];
    _NSCoreDataLog(17LL, v25, v26, v27, v28, v29, v30, v31, (uint64_t)self->_recordID);
    v32 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v33 = self->_recordID;
      relationshipDescription = self->_relationshipDescription;
      *(_DWORD *)buf = 138412546;
      v56 = (const char *)v33;
      __int16 v57 = 2112;
      v58 = relationshipDescription;
      _os_log_fault_impl( &dword_186681000,  v32,  OS_LOG_TYPE_FAULT,  "CoreData: Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@",  buf,  0x16u);
    }

- (void)recordTypesToRecordIDs
{
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", result[4], 0);
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    objc_msgSend(v3, "setObject:forKey:", v2, objc_msgSend((id)objc_msgSend((id)v1[1], "entity"), "name"));

    id v4 = (id)objc_msgSend(v3, "objectForKey:", objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    if (!v4)
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v1[3], 0);
      objc_msgSend(v3, "setObject:forKey:", v4, objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    }

    return v3;
  }

  return result;
}

@end