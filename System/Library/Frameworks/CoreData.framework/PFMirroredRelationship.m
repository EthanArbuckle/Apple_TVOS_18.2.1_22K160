@interface PFMirroredRelationship
+ (BOOL)isValidMirroredRelationshipRecord:(id)a3 values:(id)a4;
+ (PFMirroredManyToManyRelationship)mirroredRelationshipWithDeletedRecordType:(uint64_t)a3 recordID:(uint64_t)a4 andManagedObjectModel:;
+ (PFMirroredManyToManyRelationshipV2)mirroredRelationshipWithManyToManyRecord:(uint64_t)a3 values:(uint64_t)a4 andManagedObjectModel:;
+ (PFMirroredOneToManyRelationship)mirroredRelationshipWithManagedObject:(uint64_t)a3 withRecordID:(uint64_t)a4 relatedToObjectWithRecordID:(uint64_t)a5 byRelationship:;
- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5;
@end

@implementation PFMirroredRelationship

+ (PFMirroredOneToManyRelationship)mirroredRelationshipWithManagedObject:(uint64_t)a3 withRecordID:(uint64_t)a4 relatedToObjectWithRecordID:(uint64_t)a5 byRelationship:
{
  return  -[PFMirroredOneToManyRelationship initWithManagedObject:withRecordName:relatedToRecordWithRecordName:byRelationship:]( objc_alloc(&OBJC_CLASS___PFMirroredOneToManyRelationship),  "initWithManagedObject:withRecordName:relatedToRecordWithRecordName:byRelationship:",  a2,  a3,  a4,  a5);
}

+ (PFMirroredManyToManyRelationshipV2)mirroredRelationshipWithManyToManyRecord:(uint64_t)a3 values:(uint64_t)a4 andManagedObjectModel:
{
  if (objc_msgSend((id)objc_msgSend(a2, "recordType"), "hasPrefix:", @"CD_M2M_")) {
    v7 = -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]( [PFMirroredManyToManyRelationship alloc],  "initWithRecordID:recordType:managedObjectModel:andType:",  [a2 recordID],  objc_msgSend(a2, "recordType"),  a4,  0);
  }
  else {
    v7 = -[PFMirroredManyToManyRelationshipV2 initWithRecord:andValues:withManagedObjectModel:andType:]( objc_alloc(&OBJC_CLASS___PFMirroredManyToManyRelationshipV2),  "initWithRecord:andValues:withManagedObjectModel:andType:",  a2,  a3,  a4,  0LL);
  }
  return v7;
}

+ (PFMirroredManyToManyRelationship)mirroredRelationshipWithDeletedRecordType:(uint64_t)a3 recordID:(uint64_t)a4 andManagedObjectModel:
{
  return  -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]( objc_alloc(&OBJC_CLASS___PFMirroredManyToManyRelationship),  "initWithRecordID:recordType:managedObjectModel:andType:",  a3,  a2,  a4,  1LL);
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  int v6 = objc_msgSend((id)objc_msgSend(a3, "recordType"), "hasPrefix:", @"CD_M2M_");
  v7 = off_189EA5688;
  if (!v6) {
    v7 = off_189EA5690;
  }
  return -[__objc2_class _isValidMirroredRelationshipRecord:values:]( *v7,  "_isValidMirroredRelationshipRecord:values:",  a3,  a4);
}

@end