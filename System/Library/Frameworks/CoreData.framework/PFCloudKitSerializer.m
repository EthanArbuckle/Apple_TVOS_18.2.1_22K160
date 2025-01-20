@interface PFCloudKitSerializer
+ (BOOL)shouldTrackAttribute:(uint64_t)a1;
+ (BOOL)shouldTrackProperty:(uint64_t)a1;
+ (id)assetsOnRecord:(uint64_t)a1 withOptions:(void *)a2;
+ (id)createSetOfObjectIDsRelatedToObject:(uint64_t)a1;
+ (id)defaultRecordZoneIDForDatabaseScope:(int64_t)a3;
+ (id)newSetOfRecordKeysForAttribute:(int)a3 includeCKAssetsForFileBackedFutures:;
+ (id)newSetOfRecordKeysForEntitiesInConfiguration:(void *)a3 inManagedObjectModel:(int)a4 includeCKAssetsForFileBackedFutures:;
+ (uint64_t)applyCDPrefixToName:(uint64_t)a1;
+ (uint64_t)assetStorageDirectoryURLForStore:(uint64_t)a1;
+ (uint64_t)estimateByteSizeOfRecordID:(uint64_t)a1;
+ (uint64_t)generateCKAssetFileURLForObjectInStore:(uint64_t)a1;
+ (uint64_t)isMirroredRelationshipRecordType:(uint64_t)a1;
+ (uint64_t)isPrivateAttribute:(uint64_t)a1;
+ (uint64_t)isVariableLengthAttributeType:(uint64_t)a1;
+ (uint64_t)mtmKeyForObjectWithRecordName:(uint64_t)a3 relatedToObjectWithRecordName:(uint64_t)a4 byRelationship:(uint64_t)a5 withInverse:;
+ (uint64_t)oldAssetStorageDirectoryURLForStore:(uint64_t)a1;
+ (uint64_t)recordTypeForEntity:(uint64_t)a1;
+ (uint64_t)sizeOfVariableLengthAttribute:(void *)a3 withValue:;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
- (BOOL)applyUpdatedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 toStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 onlyUpdatingAttributes:(uint64_t)a7 andRelationships:(uint64_t)a8 madeChanges:(void *)a9 error:;
- (PFCloudKitSerializer)initWithMirroringOptions:(id)a3 metadataCache:(id)a4 recordNamePrefix:(id)a5;
- (id)getRecordMetadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (id)newCKRecordsFromObject:(int)a3 fullyMaterializeRecords:(int)a4 includeRelationships:(void *)a5 error:;
- (uint64_t)shouldEncryptValueForAttribute:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFCloudKitSerializer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__PFCloudKitSerializer_initialize__block_invoke;
    block[3] = &unk_189EA7758;
    block[4] = a1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }

uint64_t __34__PFCloudKitSerializer_initialize__block_invoke()
{
  return objc_opt_self();
}

- (PFCloudKitSerializer)initWithMirroringOptions:(id)a3 metadataCache:(id)a4 recordNamePrefix:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PFCloudKitSerializer;
  v8 = -[PFCloudKitSerializer init](&v10, sel_init);
  if (v8)
  {
    v8->_manyToManyRecordNameToRecord = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v8->_recordNamePrefix = (NSString *)[a5 copy];
    v8->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a3;
    v8->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v8->_metadataCache = (PFCloudKitMetadataCache *)a4;
  }

  return v8;
}

- (void)dealloc
{
  self->_manyToManyRecordNameToRecord = 0LL;
  self->_recordNamePrefix = 0LL;

  self->_mirroringOptions = 0LL;
  self->_writtenAssetURLs = 0LL;

  self->_metadataCache = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitSerializer;
  -[PFCloudKitSerializer dealloc](&v3, sel_dealloc);
}

- (id)newCKRecordsFromObject:(int)a3 fullyMaterializeRecords:(int)a4 includeRelationships:(void *)a5 error:
{
  uint64_t v152 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v142 = 0LL;
  v143 = &v142;
  uint64_t v144 = 0x2020000000LL;
  char v145 = 1;
  uint64_t v136 = 0LL;
  v137 = &v136;
  uint64_t v138 = 0x3052000000LL;
  v139 = __Block_byref_object_copy__35;
  v140 = __Block_byref_object_dispose__35;
  uint64_t v141 = 0LL;
  id v113 = (id)[a2 managedObjectContext];
  id v115 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v114 = (id)[a2 entity];
  id v112 = (id)objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore");
  v6 = (void *)[a2 managedObjectContext];
  id v7 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](a1, a2, v6, v137 + 5);
  v8 = v7;
  if (v7)
  {
    v116 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v7 recordZone]);
    if (objc_msgSend((id)objc_msgSend(v8, "encodedRecord"), "length"))
    {
      uint64_t v9 = *(void *)(a1 + 24);
      if (v9) {
        uint64_t v10 = *(void *)(v9 + 136);
      }
      else {
        uint64_t v10 = 0LL;
      }
      v11 = (void *)[v8 encodedRecord];
      id v12 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:](v10, v11, v137 + 5);
      v119 = v12;
      if (!v12)
      {
        *((_BYTE *)v143 + 24) = 0;
        id v12 = (id)v137[5];
        if (!*((_BYTE *)v143 + 24))
        {
          v121 = 0LL;
          id obj = 0LL;
          v119 = 0LL;
LABEL_25:
          id v117 = 0LL;
          goto LABEL_59;
        }

        goto LABEL_14;
      }
    }

    else
    {
      id v12 = (id)[v8 createRecordFromSystemFields];
      v119 = v12;
    }

    if (!*((_BYTE *)v143 + 24))
    {
      v121 = 0LL;
      id obj = 0LL;
      goto LABEL_25;
    }

    if (v119)
    {
      id v117 = (id)[v119 recordID];
      goto LABEL_15;
    }

- (id)getRecordMetadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v29 = 0LL;
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8 || (id v9 = (id)objc_msgSend(*(id *)(v8 + 16), "objectForKey:", objc_msgSend(a2, "objectID"))) == 0)
  {
    id v9 = (id)+[NSCKRecordMetadata metadataForObject:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  a2,  a3,  &v29);
    if (!v9)
    {
      if (v29
        || (v20 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  [*(id *)(a1 + 24) databaseScope]),  id v9 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:]( NSCKRecordMetadata,  "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:",  a2,  objc_msgSend(*(id *)(a1 + 24), "preserveLegacyRecordMetadataBehavior"),  v20,  *(void *)(a1 + 16),  &v29),  objc_msgSend(v9, "setNeedsUpload:", 1),  v20,  !v9))
      {
        v11 = (void *)MEMORY[0x186E3E5D8]();
        BOOL v12 = __ckLoggingOverride != 0;
        uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to get a metadata zone: %@"];
        _NSCoreDataLog( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:]");
        objc_autoreleasePoolPop(v11);
        if (v29)
        {
          if (a4)
          {
            id v9 = 0LL;
            *a4 = v29;
            return v9;
          }
        }

        else
        {
          uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
          unint64_t v28 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
            __int16 v32 = 1024;
            int v33 = 1596;
            _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
          }
        }

        return 0LL;
      }
    }

    -[PFCloudKitMetadataCache registerRecordMetadata:forObject:](*(void *)(a1 + 48), v9, a2);
  }

  return v9;
}

+ (uint64_t)recordTypeForEntity:(uint64_t)a1
{
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 120) & 4) != 0)
    {
      objc_super v3 = *(void **)(a2 + 72);
    }

    else
    {
      do
      {
        objc_super v3 = (void *)a2;
        a2 = [(id)a2 superentity];
      }

      while (a2);
    }
  }

  else
  {
    objc_super v3 = 0LL;
  }

  uint64_t v4 = [v3 name];
  objc_opt_self();
  return [@"CD_" stringByAppendingString:v4];
}

+ (uint64_t)applyCDPrefixToName:(uint64_t)a1
{
  return [@"CD_" stringByAppendingString:a2];
}

+ (uint64_t)generateCKAssetFileURLForObjectInStore:(uint64_t)a1
{
  return [(id)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]( (uint64_t)PFCloudKitSerializer a2):"URLByAppendingPathComponent:isDirectory:", objc_msgSend( NSString, "stringWithFormat:", @"%@.fxd", objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString")), 0];
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke( uint64_t a1,  void *a2)
{
  if ([a2 isTransient]) {
    return 0LL;
  }
  else {
    return [a2 isReadOnly] ^ 1;
  }
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  int v6 = +[PFCloudKitSerializer isVariableLengthAttributeType:]( (uint64_t)PFCloudKitSerializer,  [a2 attributeType]);
  int v7 = +[PFCloudKitSerializer isVariableLengthAttributeType:]( (uint64_t)PFCloudKitSerializer,  [a3 attributeType]);
  if (((v6 ^ 1) & 1) == 0 && !v7) {
    return 1LL;
  }
  if ((v6 & v7) != 1) {
    return (uint64_t)((unint64_t)(v7 & (v6 ^ 1u)) << 63) >> 63;
  }
  id v9 = (void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]( (uint64_t)PFCloudKitSerializer,  a2,  (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "name"))));
  return objc_msgSend( v9,  "compare:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]( (uint64_t)PFCloudKitSerializer,  a3,  (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a3, "name")))));
}

+ (uint64_t)isVariableLengthAttributeType:(uint64_t)a1
{
  uint64_t result = 1LL;
  if (a2 > 799)
  {
    if (a2 > 1199)
    {
      if (a2 > 1999)
      {
        if (a2 == 2100) {
          return result;
        }
        return 0LL;
      }

      if (a2 != 1200 && a2 != 1800) {
        return 0LL;
      }
    }

    else if (a2 <= 999 || a2 != 1000)
    {
      return 0LL;
    }
  }

  else if (a2 <= 399 || a2 <= 600 || a2 != 700)
  {
    return 0LL;
  }

  return result;
}

+ (uint64_t)sizeOfVariableLengthAttribute:(void *)a3 withValue:
{
  uint64_t v5 = [a2 attributeType];
  if (!a3) {
    return 0LL;
  }
  if (v5 <= 1199)
  {
    if (v5 != 700)
    {
      if (v5 == 1000) {
        goto LABEL_6;
      }
      return 0LL;
    }
  }

  else if (v5 != 1200)
  {
    if (v5 == 2100 || v5 == 1800)
    {
LABEL_6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        return [a3 fileSize];
      }
      return [a3 length];
    }

    return 0LL;
  }

  return [a3 length];
}

+ (BOOL)shouldTrackAttribute:(uint64_t)a1
{
  return (+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, a2) & 1) == 0
      && [a2 attributeType]
      && +[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, a2);
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_3( uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) name];
  objc_opt_self();
  uint64_t v3 = [@"CD_" stringByAppendingString:v2];
  uint64_t v4 = (void *)[*(id *)(a1 + 40) objectForKey:v2];
  if ([*(id *)(a1 + 32) attributeType] == 1000
    || [*(id *)(a1 + 32) attributeType] == 1800)
  {
    unint64_t v5 = objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "ckAssetThresholdBytes"),  "unsignedIntegerValue");
    objc_opt_self();
    int v6 = (void *)[@"CD_" stringByAppendingString:v2];
    objc_opt_self();
    uint64_t v7 = [v6 stringByAppendingString:@"_ckAsset"];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v4 = (void *)objc_msgSend( MEMORY[0x189603F48],  "dataWithBytes:length:",  objc_msgSend(v4, "bytes"),  objc_msgSend(v4, "length"));
      }
      if (([*(id *)(a1 + 32) isFileBackedFuture] & 1) != 0
        || v5
        || *(_BYTE *)(a1 + 88)
        || (uint64_t v8 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v8) > 0xAAE60))
      {
        if (([*(id *)(a1 + 32) isFileBackedFuture] & 1) != 0
          || [v4 length] >= v5
          || *(_BYTE *)(a1 + 88)
          || (uint64_t v9 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v9) > 0xAAE60))
        {
          if (*(_BYTE *)(a1 + 88))
          {
            uint64_t v10 = *(void *)(a1 + 48);
            int v11 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v10, *(void **)(a1 + 32));
            id v12 = v4;
            if (v10)
            {
              int v13 = v11;
              uint64_t v14 = *(void **)(a1 + 56);
              if (v13) {
                uint64_t v14 = (void *)[v14 encryptedValues];
              }
              [v14 setObject:v4 forKey:v3];
              id v12 = v4;
            }
          }

          else
          {
            id v12 = 0LL;
          }

          uint64_t v24 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]( (uint64_t)PFCloudKitSerializer,  (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
          id v55 = 0LL;
          if ([*(id *)(a1 + 32) isFileBackedFuture])
          {
            id v25 = (id)[v4 fileURL];
            if (v25)
            {
              if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "copyItemAtURL:toURL:error:",  v25,  v24,  &v55))
              {
                [*(id *)(*(void *)(a1 + 48) + 40) addObject:v24];
                objc_msgSend( *(id *)(a1 + 56),  "setObject:forKey:",  (id)objc_msgSend( objc_alloc((Class)getCloudKitCKAssetClass[0]()),  "initWithFileURL:",  v24),  v7);
                id v12 = -[_NSDataFileBackedFuture _storeMetadata]((uint64_t)v4);

                goto LABEL_56;
              }

              __int16 v32 = (void *)MEMORY[0x186E3E5D8]();
              BOOL v33 = __ckLoggingOverride != 0;
              uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to copy CKAsset data for '%@' on '%@' backing record '%@'.\n%@"];
              [*(id *)(a1 + 64) objectID];
              [*(id *)(a1 + 56) recordID];
              _NSCoreDataLog( v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:erro r:]_block_invoke_3");
              objc_autoreleasePoolPop(v32);
            }

            return;
          }

          if ([v4 writeToURL:v24 options:0 error:&v55])
          {
            [*(id *)(*(void *)(a1 + 48) + 40) addObject:v24];
            uint64_t v26 = *(void **)(a1 + 56);
            id v27 = objc_alloc((Class)getCloudKitCKAssetClass[0]());
            uint64_t v28 = v24;
LABEL_54:
            objc_msgSend(v26, "setObject:forKey:", (id)objc_msgSend(v27, "initWithFileURL:", v28), v7);
            goto LABEL_56;
          }

          goto LABEL_55;
        }
      }

      goto LABEL_44;
    }

    uint64_t v15 = *(void **)(a1 + 56);
    goto LABEL_20;
  }

  if ([*(id *)(a1 + 32) attributeType] != 700 && objc_msgSend(*(id *)(a1 + 32), "attributeType") != 1200) {
    goto LABEL_45;
  }
  unint64_t v16 = objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "ckAssetThresholdBytes"),  "unsignedIntegerValue");
  objc_opt_self();
  uint64_t v17 = (void *)[@"CD_" stringByAppendingString:v2];
  objc_opt_self();
  uint64_t v7 = [v17 stringByAppendingString:@"_ckAsset"];
  if (!v4)
  {
    uint64_t v29 = *(void *)(a1 + 48);
    int v30 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v29, *(void **)(a1 + 32));
    if (!v29) {
      goto LABEL_21;
    }
    int v31 = v30;
    uint64_t v15 = *(void **)(a1 + 56);
    if (v31) {
      uint64_t v15 = (void *)[v15 encryptedValues];
    }
LABEL_20:
    [v15 setObject:0 forKey:v7];
LABEL_21:
    id v12 = 0LL;
    goto LABEL_56;
  }

  if (!v16
    && !*(_BYTE *)(a1 + 88)
    && (uint64_t v18 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v18) <= 0xAAE60)
    || [v4 length] < v16
    && !*(_BYTE *)(a1 + 88)
    && (uint64_t v19 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v19) <= 0xAAE60))
  {
LABEL_44:
    [*(id *)(a1 + 56) setObject:0 forKey:v7];
LABEL_45:
    id v12 = v4;
    goto LABEL_56;
  }

  if (*(_BYTE *)(a1 + 88))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    int v21 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v20, *(void **)(a1 + 32));
    id v12 = v4;
    if (v20)
    {
      int v22 = v21;
      uint64_t v23 = *(void **)(a1 + 56);
      if (v22) {
        uint64_t v23 = (void *)[v23 encryptedValues];
      }
      [v23 setObject:v4 forKey:v3];
      id v12 = v4;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  uint64_t v41 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]( (uint64_t)PFCloudKitSerializer,  (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
  id v55 = 0LL;
  if (objc_msgSend( (id)objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 0),  "writeToURL:options:error:",  v41,  0,  &v55))
  {
    [*(id *)(*(void *)(a1 + 48) + 40) addObject:v41];
    uint64_t v26 = *(void **)(a1 + 56);
    id v27 = objc_alloc((Class)getCloudKitCKAssetClass[0]());
    uint64_t v28 = v41;
    goto LABEL_54;
  }

- (uint64_t)shouldEncryptValueForAttribute:(uint64_t)result
{
  if (result)
  {
    if ([*(id *)(result + 24) useDeviceToDeviceEncryption])
    {
      return 1LL;
    }

    else
    {
      uint64_t v3 = (void *)objc_msgSend( (id)objc_msgSend(a2, "userInfo"),  "objectForKey:",  @"NSPersistentCloudKitContainerEncryptedAttributeKey");
      if (v3) {
        return [v3 BOOLValue];
      }
      else {
        return [a2 allowsCloudEncryption];
      }
    }
  }

  return result;
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v78 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v84 = (void *)[a3 inverseRelationship];
  if (![a3 isToMany] || !objc_msgSend(v84, "isToMany"))
  {
    if (([a3 isToMany] & 1) == 0)
    {
      v62 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
      uint64_t v63 = *(void *)(a1 + 40);
      if (v62)
      {
        id v64 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:]( v63,  v62,  (void *)[v62 managedObjectContext],  (void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
        if (!v64)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
          id v75 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
          v61 = 0LL;
          *a4 = 1;
          goto LABEL_67;
        }

        uint64_t v65 = *(void *)(a1 + 40);
        uint64_t v66 = [v64 ckRecordName];
        objc_opt_self();
        uint64_t v67 = [@"CD_" stringByAppendingString:a2];
        int v68 = [*(id *)(*(void *)(a1 + 40) + 24) useDeviceToDeviceEncryption];
        if (v65)
        {
          int v69 = v68;
          v70 = *(void **)(a1 + 88);
          if (v69) {
            v70 = (void *)[v70 encryptedValues];
          }
          [v70 setObject:v66 forKey:v67];
        }
      }

      else
      {
        objc_opt_self();
        uint64_t v71 = [@"CD_" stringByAppendingString:a2];
        int v72 = [*(id *)(*(void *)(a1 + 40) + 24) useDeviceToDeviceEncryption];
        if (v63)
        {
          int v73 = v72;
          int v74 = *(void **)(a1 + 88);
          if (v73) {
            int v74 = (void *)[v74 encryptedValues];
          }
          [v74 setObject:0 forKey:v71];
        }
      }
    }

    v61 = 0LL;
    goto LABEL_67;
  }

  id obj = (id)[*(id *)(a1 + 32) valueForKey:a2];
  id v81 = objc_alloc_init(MEMORY[0x189603FE0]);
  v76 = a4;
  uint64_t v77 = a2;
  uint64_t v82 = (uint64_t)a3;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (!v8) {
    goto LABEL_36;
  }
  uint64_t v9 = v8;
  uint64_t v83 = *(void *)v91;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v91 != v83) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v90 + 1) + 8 * v10);
      context = (void *)MEMORY[0x186E3E5D8]();
      id v12 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:]( *(void *)(a1 + 40),  v11,  (void *)[*(id *)(a1 + 32) managedObjectContext],  (void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
      if (v12)
      {
        uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]( (uint64_t)PFCloudKitSerializer,  [*(id *)(a1 + 48) ckRecordName],  objc_msgSend(v12, "ckRecordName"),  v82,  (uint64_t)v84);
        [v81 addObject:v13];
        uint64_t v14 = *(id **)(*(void *)(a1 + 40) + 48LL);
        uint64_t v15 = [*(id *)(a1 + 56) zoneID];
        if (v14
          && (unint64_t v16 = (void *)objc_msgSend((id)objc_msgSend(v14[4], "objectForKey:", v15), "objectForKey:", v13),
              (uint64_t v14 = (id *)v16) != 0LL))
        {
          if (objc_msgSend((id)objc_msgSend(v16, "isUploaded"), "BOOLValue")) {
            goto LABEL_31;
          }
          int v17 = 0;
        }

        else
        {
          int v17 = 1;
        }

        id v19 = (id)[*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v13];
        if (!v19)
        {
          uint64_t v20 = (void *)[v14 ckRecordID];
          if ([v20 length])
          {
            id v21 = objc_alloc(getCloudKitCKRecordIDClass());
          }

          else
          {
            id v21 = objc_alloc(getCloudKitCKRecordIDClass());
            uint64_t v20 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString");
          }

          int v22 = (void *)[v21 initWithRecordName:v20 zoneID:*(void *)(a1 + 64)];
          uint64_t v79 = (void *)-[NSCKRecordMetadata createRecordID](*(void **)(a1 + 48));
          uint64_t v23 = (void *)-[NSCKRecordMetadata createRecordID](v12);
          uint64_t v24 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]( [PFMirroredManyToManyRelationshipV2 alloc],  "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:",  v22,  v79,  v23,  v82,  objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v11, "entity"), "relationshipsByName"),  "objectForKeyedSubscript:",  objc_msgSend(v84, "name")),  0);
          if (v17)
          {
            id v25 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]( (uint64_t)NSCKMirroredRelationship,  (uint64_t)v24,  [*(id *)(a1 + 48) recordZone],  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectID"), "persistentStore"),  *(void **)(a1 + 72));
            -[NSManagedObject setIsUploaded:](v25, "setIsUploaded:", MEMORY[0x189604A80]);
            -[NSManagedObject setNeedsDelete:](v25, "setNeedsDelete:", MEMORY[0x189604A80]);
            -[NSManagedObject setIsPending:](v25, "setIsPending:", MEMORY[0x189604A80]);
          }

          if (!objc_msgSend( (id)objc_msgSend(v22, "zoneID"),  "isEqual:",  objc_msgSend(*(id *)(a1 + 56), "zoneID"))
            || (objc_msgSend((id)objc_msgSend(v22, "zoneID"), "isEqual:", objc_msgSend(v23, "zoneID")) & 1) == 0)
          {
            uint64_t v26 = [NSString stringWithUTF8String:"Serializer is attempting to link relationships across zones: %@ - %@ / %@"];
            _NSCoreDataLog(17LL, v26, v27, v28, v29, v30, v31, v32, (uint64_t)v22);
            BOOL v33 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v37 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412802;
              uint64_t v96 = (uint64_t)v22;
              __int16 v97 = 2112;
              uint64_t v98 = v37;
              __int16 v99 = 2112;
              id v100 = v23;
              _os_log_fault_impl( &dword_186681000,  v33,  OS_LOG_TYPE_FAULT,  "CoreData: Serializer is attempting to link relationships across zones: %@ - %@ / %@",  buf,  0x20u);
            }
          }

          id v19 = (id)[objc_alloc(getCloudKitCKRecordClass()) initWithRecordType:@"CDMR" recordID:v22];
          [*(id *)(a1 + 80) addObject:v19];
          uint64_t v34 = *(void *)(a1 + 40);
          if (v34)
          {
            int v35 = [*(id *)(v34 + 24) useDeviceToDeviceEncryption];
            uint64_t v36 = (uint64_t)v19;
            if (v35) {
              uint64_t v36 = objc_msgSend(v19, "encryptedValueStore", v19);
            }
          }

          else
          {
            uint64_t v36 = 0LL;
          }

          -[PFMirroredManyToManyRelationshipV2 populateRecordValues:](v24, "populateRecordValues:", v36);
          [*(id *)(*(void *)(a1 + 40) + 8) setObject:v19 forKey:v13];
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
        id v18 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
      }

+ (uint64_t)mtmKeyForObjectWithRecordName:(uint64_t)a3 relatedToObjectWithRecordName:(uint64_t)a4 byRelationship:(uint64_t)a5 withInverse:
{
  v27[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v27[0] = a4;
  v27[1] = a5;
  uint64_t v9 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v27, 2),  "sortedArrayUsingComparator:",  &__block_literal_global_138);
  uint64_t v10 = (void *)NSString;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "entity");
  if (v11)
  {
    if ((*(_BYTE *)(v11 + 120) & 4) != 0)
    {
      id v12 = *(void **)(v11 + 72);
    }

    else
    {
      do
      {
        id v12 = (void *)v11;
        uint64_t v11 = [(id)v11 superentity];
      }

      while (v11);
    }
  }

  else
  {
    id v12 = 0LL;
  }

  uint64_t v13 = [v10 stringWithFormat:@"%@%@_%@", @"CD_M2M_", objc_msgSend(v12, "name"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "name")];
  id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v15 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v9);
        }
        if (*(void *)(*((void *)&v22 + 1) + 8 * v18) == a4) {
          uint64_t v19 = a2;
        }
        else {
          uint64_t v19 = a3;
        }
        [v14 addObject:v19];
        ++v18;
      }

      while (v16 != v18);
      uint64_t v16 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v16);
  }

  uint64_t v20 = [NSString stringWithFormat:@"%@:%@", v13, objc_msgSend(v14, "componentsJoinedByString:", @":")];

  return v20;
}

- (BOOL)applyUpdatedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 toStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 onlyUpdatingAttributes:(uint64_t)a7 andRelationships:(uint64_t)a8 madeChanges:(void *)a9 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  uint64_t v21 = 0LL;
  __int128 v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  __int128 v24 = __Block_byref_object_copy__35;
  __int128 v25 = __Block_byref_object_dispose__35;
  uint64_t v26 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke;
  v20[3] = &unk_189EAACE0;
  v20[4] = a5;
  v20[5] = a1;
  v20[6] = a4;
  v20[7] = a2;
  v20[8] = a3;
  v20[9] = a6;
  v20[10] = a7;
  v20[11] = &v21;
  v20[12] = &v27;
  v20[13] = a8;
  [a5 performBlockAndWait:v20];
  if (!*((_BYTE *)v28 + 24))
  {
    id v11 = (id)v22[5];
    if (v11)
    {
      if (a9) {
        *a9 = v11;
      }
    }

    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
      uint64_t v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
        __int16 v33 = 1024;
        int v34 = 1225;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v22[5] = 0LL;
  BOOL v9 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke( uint64_t a1)
{
  uint64_t v432 = *MEMORY[0x1895F89C0];
  id v356 = (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"),  "managedObjectModel");
  id v360 = objc_alloc_init(MEMORY[0x189603FC8]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32LL));
  uint64_t v376 = a1;
  uint64_t v2 = (void *)objc_msgSend(v356, "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configurationName"));
  v411[0] = MEMORY[0x1895F87A8];
  v411[1] = 3221225472LL;
  v411[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2;
  v411[3] = &unk_189EAAC40;
  v411[4] = v360;
  [v2 enumerateObjectsUsingBlock:v411];
  uint64_t v3 = -[PFCloudKitImportZoneContext initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:]( [PFCloudKitImportZoneContext alloc],  "initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:",  *(void *)(v376 + 56),  *(void *)(v376 + 64),  *(void *)(*(void *)(v376 + 40) + 24),  [*(id *)(v376 + 48) fileBackedFuturesDirectory]);
  uint64_t v370 = (uint64_t)v3;
  if (-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]( (uint64_t)v3,  *(void **)(v376 + 32),  *(void **)(v376 + 48),  (id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL)))
  {
    __int128 v409 = 0u;
    __int128 v410 = 0u;
    __int128 v407 = 0u;
    __int128 v408 = 0u;
    v354 = v3;
    if (v3) {
      modifiedRecords = v3->_modifiedRecords;
    }
    else {
      modifiedRecords = 0LL;
    }
    id obj = modifiedRecords;
    uint64_t v359 = -[NSArray countByEnumeratingWithState:objects:count:]( modifiedRecords,  "countByEnumeratingWithState:objects:count:",  &v407,  v426,  16LL);
    if (v359)
    {
      uint64_t v358 = *(void *)v408;
      do
      {
        uint64_t v366 = 0LL;
        do
        {
          if (*(void *)v408 != v358) {
            objc_enumerationMutation(obj);
          }
          v371 = *(void **)(*((void *)&v407 + 1) + 8 * v366);
          context = (void *)MEMORY[0x186E3E5D8]();
          int v5 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", @"CD_");
          uint64_t v6 = *(void *)(v376 + 40);
          uint64_t v7 = v6;
          uint64_t v8 = @"entityName";
          if (v5)
          {
            objc_opt_self();
            uint64_t v8 = (__CFString *)[@"CD_" stringByAppendingString:@"entityName"];
            uint64_t v7 = *(void *)(v376 + 40);
          }

          int v9 = [*(id *)(v7 + 24) useDeviceToDeviceEncryption];
          if (!v6) {
            goto LABEL_16;
          }
          int v10 = v9;
          id v11 = v371;
          if (v10)
          {
            char v12 = -[__CFString hasSuffix:](v8, "hasSuffix:", @"_ckAsset");
            id v11 = v371;
            if ((v12 & 1) == 0) {
              id v11 = (void *)[v371 encryptedValues];
            }
          }

          uint64_t v13 = (void *)[v11 objectForKey:v8];
          if (!v13)
          {
LABEL_16:
            uint64_t v13 = (void *)[v371 recordType];
            objc_opt_self();
          }

          if ([v360 objectForKey:v13])
          {
            uint64_t v14 = +[NSCKRecordMetadata metadataForRecord:inManagedObjectContext:fromStore:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  v371,  *(void **)(v376 + 32),  *(void *)(v376 + 48),  (void *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL));
            uint64_t v15 = v14;
            if (!v14)
            {
              *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
              id v28 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
              goto LABEL_234;
            }

            if (!-[NSManagedObject recordZone](v14, "recordZone"))
            {
              uint64_t v16 = *(void *)(*(void *)(v376 + 40) + 48LL);
              uint64_t v17 = objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID");
              if (!v16 || (uint64_t v18 = (NSManagedObject *)[*(id *)(v16 + 8) objectForKey:v17]) == 0)
              {
                uint64_t v18 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID"),  objc_msgSend(*(id *)(*(void *)(v376 + 40) + 24), "databaseScope"),  *(void *)(v376 + 48),  *(void **)(v376 + 32),  *(void *)(*(void *)(v376 + 88) + 8) + 40);
                if (v18)
                {
                  -[PFCloudKitMetadataCache cacheZoneMetadata:](*(void *)(*(void *)(v376 + 40) + 48LL), v18);
                }

                else
                {
                  *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
                  id v29 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
                  uint64_t v18 = 0LL;
                }
              }

              if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL)) {
                -[NSManagedObject setRecordZone:](v15, "setRecordZone:", v18);
              }
            }

            v367 = v15;
            if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
            {
              uint64_t v30 = [v371 recordID];
              if (v370
                && (uint64_t v31 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v13),  "objectForKey:",  v30)) != 0)
              {
                v375 = (NSManagedObject *)[*(id *)(v376 + 32) objectWithID:v31];
                uint64_t v32 = _sqlEntityForEntityDescription( [*(id *)(v376 + 48) model],  (void *)objc_msgSend(v31, "entity"));
                if (v32) {
                  uint64_t v33 = *(unsigned int *)(v32 + 184);
                }
                else {
                  uint64_t v33 = 0LL;
                }
                if (objc_msgSend((id)-[NSManagedObject entityId](v15, "entityId"), "longValue") != v33
                  || (uint64_t v34 = [v31 _referenceData64],
                      v34 != objc_msgSend((id)-[NSManagedObject entityPK](v15, "entityPK"), "integerValue")))
                {
                  uint64_t v35 = [NSString stringWithUTF8String:"Record metadata doesn't match row: %@\n%@"];
                  _NSCoreDataLog(17LL, v35, v36, v37, v38, v39, v40, v41, (uint64_t)v31);
                  id v42 = (os_log_s *)__pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v31;
                    __int16 v429 = 2112;
                    v430 = v15;
                    _os_log_fault_impl( &dword_186681000,  v42,  OS_LOG_TYPE_FAULT,  "CoreData: Record metadata doesn't match row: %@\n%@",  buf,  0x16u);
                  }
                }
              }

              else
              {
                v375 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v13,  *(void *)(v376 + 32));
                -[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:](v370, v375, v371, v15);
              }

              uint64_t v43 = *(void **)(v376 + 72);
              if (v43)
              {
                uint64_t v44 = objc_msgSend( v43,  "objectForKey:",  -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                if (v44) {
                  uint64_t v45 = (NSArray *)v44;
                }
                else {
                  uint64_t v45 = (NSArray *)MEMORY[0x189604A58];
                }
              }

              else
              {
                uint64_t v45 = 0LL;
              }

              uint64_t v46 = *(void **)(v376 + 80);
              if (v46)
              {
                uint64_t v47 = objc_msgSend( v46,  "objectForKey:",  -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                uint64_t v48 = (NSArray *)MEMORY[0x189604A58];
                if (v47) {
                  uint64_t v48 = (NSArray *)v47;
                }
                v372 = v48;
              }

              else
              {
                v372 = 0LL;
              }

              uint64_t v374 = *(void *)(v376 + 40);
              if (!v374) {
                goto LABEL_220;
              }
              uint64_t v49 = *(void *)(*(void *)(v376 + 88) + 8LL);
              uint64_t v420 = 0LL;
              if (-[NSManagedObject isInserted](v375, "isInserted")
                && [*(id *)(v374 + 24) preserveLegacyRecordMetadataBehavior]
                && -[NSDictionary objectForKey:]( -[NSEntityDescription attributesByName]( -[NSManagedObject entity](v375, "entity"),  "attributesByName"),  "objectForKey:",  @"ckRecordID")
                && !-[NSManagedObject valueForKey:](v375, "valueForKey:", @"ckRecordID"))
              {
                -[NSManagedObject setValue:forKey:]( v375,  "setValue:forKey:",  objc_msgSend((id)objc_msgSend(v371, "recordID"), "recordName"),  @"ckRecordID");
              }

              uint64_t v50 = *(void *)(v374 + 24);
              if (v50) {
                uint64_t v51 = *(void *)(v50 + 136);
              }
              else {
                uint64_t v51 = 0LL;
              }
              id v52 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v51, (uint64_t)v371, &v420);
              if (v52)
              {
                -[NSManagedObject setEncodedRecord:](v367, "setEncodedRecord:", v52);
                -[NSManagedObject setCkRecordSystemFields:](v367, "setCkRecordSystemFields:", 0LL);
              }

              int v368 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", @"CD_");
              if (!v52) {
                goto LABEL_216;
              }
              if (!v45) {
                uint64_t v45 = -[NSDictionary allValues]( -[NSEntityDescription attributesByName]( -[NSManagedObject entity](v375, "entity"),  "attributesByName"),  "allValues");
              }
              __int128 v419 = 0u;
              __int128 v418 = 0u;
              __int128 v417 = 0u;
              __int128 v416 = 0u;
              uint64_t v53 = -[NSArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v416,  v431,  16LL);
              if (!v53) {
                goto LABEL_185;
              }
              uint64_t v355 = v49;
              uint64_t v54 = *(void *)v417;
              char v361 = 1;
              v364 = v45;
              while (2)
              {
                uint64_t v55 = 0LL;
LABEL_69:
                if (*(void *)v417 != v54) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v56 = *(void **)(*((void *)&v416 + 1) + 8 * v55);
                if ((+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, v56) & 1) != 0
                  || ([v56 isTransient] & 1) != 0
                  || ([v56 isReadOnly] & 1) != 0
                  || (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v56, "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateIgnoredPropertyKey"),  "BOOLValue") & 1) != 0)
                {
                  goto LABEL_155;
                }

                uint64_t v57 = [v56 name];
                uint64_t v58 = (void *)v57;
                if (v368)
                {
                  objc_opt_self();
                  uint64_t v58 = (void *)[@"CD_" stringByAppendingString:v57];
                }

                int v59 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                uint64_t v60 = v371;
                if (v59)
                {
                  char v61 = [v58 hasSuffix:@"_ckAsset"];
                  uint64_t v60 = v371;
                  if ((v61 & 1) == 0) {
                    uint64_t v60 = (void *)[v371 encryptedValues];
                  }
                }

                v62 = (void *)[v60 objectForKey:v58];
                id v63 = v62;
                if (!v62)
                {
                  if (!+[PFCloudKitSerializer isVariableLengthAttributeType:]( (uint64_t)PFCloudKitSerializer,  [v56 attributeType])) {
                    goto LABEL_96;
                  }
                  int v69 = (void *)v57;
                  if (v368)
                  {
                    objc_opt_self();
                    int v69 = (void *)[@"CD_" stringByAppendingString:v57];
                  }

                  objc_opt_self();
                  v62 = (void *)objc_msgSend( v371,  "objectForKey:",  objc_msgSend(v69, "stringByAppendingString:", @"_ckAsset"));
                  if (!v62)
                  {
LABEL_96:
                    if (([v56 isTransient] & 1) == 0)
                    {
                      uint64_t v70 = *(void *)(v374 + 48);
                      uint64_t v71 = -[NSManagedObject objectID](v375, "objectID");
                      if (v70
                        && (objc_msgSend( (id)objc_msgSend(*(id *)(v70 + 48), "objectForKey:", v71),  "containsObject:",  v57) & 1) != 0)
                      {
                        int v72 = (void *)MEMORY[0x186E3E5D8]();
                        else {
                          uint64_t v73 = __ckLoggingOverride;
                        }
                        uint64_t v74 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                        -[NSManagedObject objectID](v375, "objectID");
                        _NSCoreDataLog( v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:w ithRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v72);
                      }

                      else
                      {
                        -[NSManagedObject setValue:forKey:]( v375,  "setValue:forKey:",  [v56 defaultValue],  v57);
                      }
                    }

                    id v369 = 0LL;

                    char v110 = 1;
                    id v63 = 0LL;
                    goto LABEL_153;
                  }
                }

                id v369 = objc_loadWeakRetained((id *)(v374 + 32));
                if ([v56 attributeType] == 1000
                  || [v56 attributeType] == 1800
                  || [v56 attributeType] == 2100)
                {
                  if ([v56 isFileBackedFuture])
                  {
                    getCloudKitCKAssetClass[0]();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      id v64 = v62;
                      uint64_t v65 = (void *)v57;
                      if (v368)
                      {
                        objc_opt_self();
                        uint64_t v65 = (void *)[@"CD_" stringByAppendingString:v57];
                      }

                      int v66 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                      uint64_t v67 = v371;
                      if (v66)
                      {
                        char v68 = [v65 hasSuffix:@"_ckAsset"];
                        uint64_t v67 = v371;
                        if ((v68 & 1) == 0) {
                          uint64_t v67 = (void *)[v371 encryptedValues];
                        }
                      }

                      id v365 = (id)[v67 objectForKey:v65];
                    }

                    else
                    {
                      id v365 = v62;
                      uint64_t v82 = (void *)v57;
                      if (v368)
                      {
                        objc_opt_self();
                        uint64_t v82 = (void *)[@"CD_" stringByAppendingString:v57];
                      }

                      objc_opt_self();
                      id v64 = (id)objc_msgSend( v371,  "objectForKey:",  objc_msgSend(v82, "stringByAppendingString:", @"_ckAsset"));
                    }

                    if (v365)
                    {
                      if (v64)
                      {
                        uint64_t v83 = [v369 cloudKitSerializer:v374 safeSaveURLForAsset:v64];
                        if (v83)
                        {
                          uint64_t v84 = objc_alloc(&OBJC_CLASS____NSCloudKitDataFileBackedFuture);
                          if (v370) {
                            uint64_t v85 = *(void *)(v370 + 104);
                          }
                          else {
                            uint64_t v85 = 0LL;
                          }
                          uint64_t v86 = -[_NSCloudKitDataFileBackedFuture initWithStoreMetadata:directory:originalFileURL:]( v84,  "initWithStoreMetadata:directory:originalFileURL:",  v365,  v85,  v83);
                          goto LABEL_125;
                        }

                        uint64_t v121 = [NSString stringWithUTF8String:"Delegate didn't return a file url for asset: %@"];
                        _NSCoreDataLog(17LL, v121, v122, v123, v124, v125, v126, v127, (uint64_t)v64);
                        __int128 v128 = (os_log_s *)__pflogFaultLog;
                        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v64;
                          _os_log_fault_impl( &dword_186681000,  v128,  OS_LOG_TYPE_FAULT,  "CoreData: Delegate didn't return a file url for asset: %@",  buf,  0xCu);
                        }

                        v109 = 0LL;
                      }

                      else
                      {
                        uint64_t v107 = objc_alloc(&OBJC_CLASS____NSCloudKitDataFileBackedFuture);
                        if (v370) {
                          uint64_t v108 = *(void *)(v370 + 104);
                        }
                        else {
                          uint64_t v108 = 0LL;
                        }
                        uint64_t v86 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:]( v107,  "initWithStoreMetadata:directory:",  v365,  v108);
LABEL_125:
                        v109 = (void *)v86;
                      }

                      id v129 = -[NSManagedObject valueForKey:](v375, "valueForKey:", [v56 name]);
                      if ([v129 isEqual:v109]
                        && ([v129 fileURL] || !v109 || !objc_getProperty(v109, v130, 16, 1)))
                      {
                      }

                      else
                      {

                        id v129 = v109;
                      }

                      id v63 = v129;
                    }
                  }

                  else
                  {
                    getCloudKitCKAssetClass[0]();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      id v81 = -[_PFEvanescentData initWithURL:]( [_PFEvanescentData alloc],  "initWithURL:",  [v369 cloudKitSerializer:v374 safeSaveURLForAsset:v62]);

                      if (v81)
                      {
                        id v63 = v81;
                      }

                      else
                      {
                        v111 = (void *)MEMORY[0x186E3E5D8]();
                        uint64_t v112 = __ckLoggingOverride;
                        uint64_t v113 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Error attempting to read CKAsset file: %@"];
                        _NSCoreDataLog( v112 != 0,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:w ithRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v111);
                        id v63 = 0LL;
                      }
                    }

                    else
                    {
                      getCloudKitCKEncryptedDataClass[0]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {

                        id v87 = (id)[v62 data];
                        __int128 v88 = (void *)MEMORY[0x186E3E5D8]();
                        uint64_t v89 = __ckLoggingOverride;
                        uint64_t v90 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ encountered CKEncryptedData blob on record (%@): %@"];
                        _NSCoreDataLog( v89 != 0,  v90,  v91,  v92,  v93,  v94,  v95,  v96,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:w ithRecordMetadata:importContext:error:]");
                        id v63 = v87;
                        objc_autoreleasePoolPop(v88);
                      }

                      else if (([v62 isNSData] & 1) == 0)
                      {
                        uint64_t v98 = (void *)MEMORY[0x186E3E5D8]();
                        BOOL v99 = __ckLoggingOverride != 0;
                        uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unknown value class (%@) for attribute:\n%@"];
                        objc_opt_class();
                        _NSCoreDataLog( v99,  v100,  v101,  v102,  v103,  v104,  v105,  v106,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:w ithRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v98);

                        id v63 = 0LL;
                      }
                    }

                    if ([v56 attributeType] == 1800 || objc_msgSend(v56, "attributeType") == 2100)
                    {
                      id v120 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v63,  v56);

                      id v63 = v120;
                    }
                  }

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2( uint64_t a1,  void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, objc_msgSend(a2, "name"));
}

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_62( uint64_t a1,  void *a2)
{
  id v22 = 0LL;
  if (([a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 32) andManagedObjectContext:*(void *)(a1 + 40) error:&v22] & 1) == 0)
  {
    uint64_t v4 = (void *)[v22 domain];
    if ([v4 isEqualToString:*MEMORY[0x189607460]]
      && ([v22 code] == 134412 || objc_msgSend(v22, "code") == 134413))
    {
      int v5 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v6 = __ckLoggingOverride;
      }
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleted relationship failed to update because one or more of the objects in it is already gone: %@"];
      _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdating Attributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }

    else
    {
      int v5 = (void *)MEMORY[0x186E3E5D8]( [*(id *)(a1 + 48) cloudKitSerializer:*(void *)(a1 + 56) failedToUpdateRelationship:a2 withError:v22]);
      else {
        uint64_t v14 = __ckLoggingOverride;
      }
      uint64_t v15 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to update deleted mirrored relationship: %@\n%@"];
      _NSCoreDataLog( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdating Attributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }

    objc_autoreleasePoolPop(v5);
  }

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v42 = 0LL;
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v5 = __ckLoggingOverride;
  }
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Updating relationship: %@"];
  _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttr ibutes:andRelationships:madeChanges:error:]_block_invoke_3");
  objc_autoreleasePoolPop(v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a2)
    {
      uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]( (uint64_t)PFCloudKitSerializer,  [*(id *)(a2 + 48) recordName],  objc_msgSend(*(id *)(a2 + 56), "recordName"),  *(void *)(a2 + 16),  *(void *)(a2 + 24));
      uint64_t v14 = *(void **)(a2 + 32);
    }

    else
    {
      uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]( (uint64_t)PFCloudKitSerializer,  [0 recordName],  objc_msgSend(0, "recordName"),  0,  0);
      uint64_t v14 = 0LL;
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 48LL);
    uint64_t v16 = [v14 zoneID];
    if (!v15
      || (uint64_t v17 = (NSManagedObject *)objc_msgSend( (id)objc_msgSend(*(id *)(v15 + 32), "objectForKey:", v16),  "objectForKey:",  v13)) == 0)
    {
      uint64_t v23 = (NSManagedObject *)+[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  a2,  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v42);
      uint64_t v24 = v42;
      if (v42)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
        uint64_t result = v24;
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = result;
        return result;
      }

      uint64_t v17 = v23;
      if (!v23)
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 48LL);
        if (a2) {
          uint64_t v26 = *(void **)(a2 + 48);
        }
        else {
          uint64_t v26 = 0LL;
        }
        uint64_t v27 = [v26 zoneID];
        if (!v25 || (uint64_t v28 = [*(id *)(v25 + 8) objectForKey:v27]) == 0)
        {
          if (a2) {
            id v29 = *(void **)(a2 + 48);
          }
          else {
            id v29 = 0LL;
          }
          uint64_t v30 = (void *)[v29 zoneID];
          uint64_t v31 = *(void *)(a1 + 56);
          if (v31) {
            uint64_t v32 = *(void **)(v31 + 96);
          }
          else {
            uint64_t v32 = 0LL;
          }
          uint64_t v33 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v30,  [v32 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v42);
          if (v33)
          {
            uint64_t v28 = (uint64_t)v33;
            -[PFCloudKitMetadataCache cacheZoneMetadata:](*(void *)(*(void *)(a1 + 32) + 48LL), v33);
          }

          else
          {
            uint64_t v34 = [NSString stringWithUTF8String:"Need to handle fetch errors here for the zone and abort serialization. %@"];
            _NSCoreDataLog(17LL, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v42);
            uint64_t v41 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v42;
              _os_log_fault_impl( &dword_186681000,  v41,  OS_LOG_TYPE_FAULT,  "CoreData: Need to handle fetch errors here for the zone and abort serialization. %@",  buf,  0xCu);
            }

            uint64_t v28 = 0LL;
          }
        }

        uint64_t v17 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  a2,  v28,  *(void *)(a1 + 40),  *(void **)(a1 + 48));
      }
    }

    if ([(id)a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 56) andManagedObjectContext:*(void *)(a1 + 48) error:&v42])
    {
      uint64_t v18 = MEMORY[0x189604A80];
      -[NSManagedObject setIsPending:](v17, "setIsPending:", MEMORY[0x189604A80]);
      -[NSManagedObject setNeedsDelete:](v17, "setNeedsDelete:", v18);
      uint64_t v19 = MEMORY[0x189604A88];
      uint64_t v20 = v17;
    }

    else
    {
      uint64_t v22 = MEMORY[0x189604A88];
      -[NSManagedObject setIsPending:](v17, "setIsPending:", MEMORY[0x189604A88]);
      -[NSManagedObject setNeedsDelete:](v17, "setNeedsDelete:", MEMORY[0x189604A80]);
      uint64_t v20 = v17;
      uint64_t v19 = v22;
    }

    return -[NSManagedObject setIsUploaded:](v20, "setIsUploaded:", v19);
  }

  else
  {
    uint64_t result = [(id)a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 56) andManagedObjectContext:*(void *)(a1 + 48) error:&v42];
    if ((result & 1) == 0) {
      return [*(id *)(a1 + 64) cloudKitSerializer:*(void *)(a1 + 32) failedToUpdateRelationship:a2 withError:v42];
    }
  }

  return result;
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_73( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4,  _BYTE *a5)
{
  uint64_t v139 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
    return result;
  }

  uint64_t v6 = a2;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v126 objects:v138 count:16];
  if (!v7) {
    goto LABEL_83;
  }
  uint64_t v8 = v7;
  uint64_t v113 = *(void *)v127;
  uint64_t v109 = *MEMORY[0x189607460];
  char v110 = v6;
  do
  {
    uint64_t v9 = 0LL;
    uint64_t v111 = v8;
    do
    {
      if (*(void *)v127 != v113) {
        objc_enumerationMutation(v6);
      }
      uint64_t v115 = v9;
      uint64_t v10 = *(void **)(*((void *)&v126 + 1) + 8 * v9);
      context = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v114 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  objc_msgSend(v10, "cdEntityName")),  "relationshipsByName"),  "objectForKey:",  objc_msgSend(v10, "relationshipName"));
      uint64_t v11 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend(v10, "recordZoneName"),  objc_msgSend(v10, "recordZoneOwnerName"));
      uint64_t v12 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v10, "recordName"),  v11);
      uint64_t v13 = objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend(v10, "relatedRecordZoneName"),  objc_msgSend(v10, "relatedRecordZoneOwnerName"));
      id v120 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v10, "relatedRecordName"),  v13);
      uint64_t v117 = (void *)v13;
      if (([v11 isEqual:v13] & 1) == 0)
      {
        uint64_t v14 = [NSString stringWithUTF8String:"Import is attempting to link objects across zones: %@"];
        _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v10);
        uint64_t v21 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Import is attempting to link objects across zones: %@",  buf,  0xCu);
        }
      }

      uint64_t v118 = v11;
      uint64_t v22 = a1;
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v119 = v10;
      uint64_t v24 = [v10 cdEntityName];
      if (v23) {
        uint64_t v25 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v23 + 64), "objectForKey:", v24), "objectForKey:", v12);
      }
      else {
        uint64_t v25 = 0LL;
      }
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = [v119 relatedEntityName];
      if (v26)
      {
        uint64_t v28 = objc_msgSend((id)objc_msgSend(*(id *)(v26 + 64), "objectForKey:", v27), "objectForKey:", v120);
        id v29 = (void *)v28;
        if (v25 && v28) {
          goto LABEL_41;
        }
        id v30 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v31 = v30;
        if (v25)
        {
          if (v29) {
            goto LABEL_20;
          }
        }

        else
        {
          [v30 addObject:v12];
          if (v29) {
            goto LABEL_20;
          }
        }
      }

      else
      {
        id v95 = objc_alloc_init(MEMORY[0x189603FA8]);
        if (v25)
        {
          uint64_t v22 = a1;
          uint64_t v31 = v95;
        }

        else
        {
          uint64_t v31 = v95;
          [v95 addObject:v12];
          uint64_t v22 = a1;
        }
      }

      [v31 addObject:v120];
      id v29 = 0LL;
LABEL_20:
      id v125 = 0LL;
      uint64_t v112 = v31;
      id v32 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  v31,  *(void **)(v22 + 48),  *(void **)(v22 + 32),  &v125);
      if (!v32)
      {
        uint64_t v98 = (void *)MEMORY[0x186E3E5D8]();
        BOOL v99 = __ckLoggingOverride != 0;
        uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Pending relationship Fallback fetch failed (%@ / %@): %@"];
        _NSCoreDataLog( v99,  v100,  v101,  v102,  v103,  v104,  v105,  v106,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdati ngAttributes:andRelationships:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v98);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v125;
        *a4 = 1;

        objc_autoreleasePoolPop(context);
        goto LABEL_83;
      }

      uint64_t v33 = v32;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      uint64_t v34 = [v32 countByEnumeratingWithState:&v121 objects:v137 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v122;
        do
        {
          for (uint64_t i = 0LL; i != v35; ++i)
          {
            if (*(void *)v122 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void **)(*((void *)&v121 + 1) + 8 * i);
            uint64_t v39 = (void *)-[NSCKRecordMetadata createRecordID](v38);
            if ([v39 isEqual:v12])
            {
              uint64_t v25 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              uint64_t v40 = *(void *)(a1 + 40);
              if (v40) {
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:]( v40,  v25,  *(void **)(v40 + 64),  (uint64_t)v39);
              }
            }

            else if ([v39 isEqual:v120])
            {
              id v29 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              uint64_t v41 = *(void *)(a1 + 40);
              if (v41) {
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:]( v41,  v29,  *(void **)(v41 + 64),  (uint64_t)v39);
              }
            }

            else
            {
              uint64_t v42 = [NSString stringWithUTF8String:"Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@"];
              _NSCoreDataLog(17LL, v42, v43, v44, v45, v46, v47, v48, (uint64_t)v39);
              uint64_t v49 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v39;
                __int16 v133 = 2112;
                __int128 v134 = v33;
                __int16 v135 = 2112;
                uint64_t v136 = v119;
                _os_log_fault_impl( &dword_186681000,  v49,  OS_LOG_TYPE_FAULT,  "CoreData: Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@",  buf,  0x20u);
              }
            }
          }

          uint64_t v35 = [v33 countByEnumeratingWithState:&v121 objects:v137 count:16];
        }

        while (v35);

        uint64_t v6 = v110;
        uint64_t v8 = v111;
      }

      else
      {
      }

      uint64_t v22 = a1;
      if (!v25)
      {
LABEL_46:
        uint64_t v55 = (void *)MEMORY[0x186E3E5D8]();
        else {
          uint64_t v56 = __ckLoggingOverride;
        }
        uint64_t v57 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to find matching objectIDs for %@ / %@ in pending relationship: %@"];
        [v119 objectID];
        _NSCoreDataLog( v56,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdati ngAttributes:andRelationships:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v55);

        uint64_t v65 = v115;
        id v64 = context;
        goto LABEL_73;
      }

+ (uint64_t)isPrivateAttribute:(uint64_t)a1
{
  if (objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"ckRecordSystemFields")) {
    return 1LL;
  }
  else {
    return objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"ckRecordID");
  }
}

+ (uint64_t)assetStorageDirectoryURLForStore:(uint64_t)a1
{
  if (+[_PFRoutines _isInMemoryStoreURL:]( (uint64_t)_PFRoutines,  (void *)[a2 URL])) {
    return objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByAppendingPathComponent:]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  objc_msgSend(a2, "identifier")),  "stringByAppendingPathComponent:",  @"inMemory_store_ckAssets"));
  }
  uint64_t v4 = (void *)[a2 URL];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "lastPathComponent"), "stringByDeletingPathExtension");
  uint64_t v6 = (void *)[v4 URLByDeletingLastPathComponent];
  return [v6 URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@_ckAssets", v5)];
}

+ (uint64_t)oldAssetStorageDirectoryURLForStore:(uint64_t)a1
{
  if (+[_PFRoutines _isInMemoryStoreURL:]( (uint64_t)_PFRoutines,  (void *)[a2 URL])) {
    return objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByAppendingPathComponent:]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  objc_msgSend(a2, "identifier")),  "stringByAppendingPathComponent:",  @"ckAssetFiles"));
  }
  else {
    return objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "URL"), "URLByDeletingLastPathComponent"),  "URLByAppendingPathComponent:isDirectory:",  @"ckAssetFiles",  1);
  }
}

+ (uint64_t)isMirroredRelationshipRecordType:(uint64_t)a1
{
  if ([a2 hasPrefix:@"CD_M2M_"]) {
    return 1LL;
  }
  else {
    return [a2 isEqualToString:@"CDMR"];
  }
}

+ (id)assetsOnRecord:(uint64_t)a1 withOptions:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v4 = (void *)[a2 allKeys];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 hasSuffix:@"_ckAsset"])
        {
          uint64_t v10 = [a2 objectForKey:v9];
          if (v10) {
            [v3 addObject:v10];
          }
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

+ (uint64_t)estimateByteSizeOfRecordID:(uint64_t)a1
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"), "length");
  return v3 + objc_msgSend((id)objc_msgSend(a2, "recordName"), "length") + 24;
}

+ (id)newSetOfRecordKeysForEntitiesInConfiguration:(void *)a3 inManagedObjectModel:(int)a4 includeCKAssetsForFileBackedFutures:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v7 = 0x189603000uLL;
  id v34 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)[a3 entitiesForConfiguration:a2];
  uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v35)
  {
    uint64_t v32 = *(void *)v39;
    int v33 = a4;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        context = (void *)MEMORY[0x186E3E5D8]();
        objc_opt_self();
        id v10 = objc_alloc_init(*(Class *)(v7 + 4064));
        objc_opt_self();
        objc_msgSend(v10, "addObject:", objc_msgSend(@"CD_", "stringByAppendingString:", @"entityName"));
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        uint64_t v11 = (void *)objc_msgSend((id)objc_msgSend(v9, "attributesByName"), "allValues");
        uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v47;
          do
          {
            uint64_t v15 = 0LL;
            do
            {
              if (*(void *)v47 != v14) {
                objc_enumerationMutation(v11);
              }
              __int128 v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
              uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
              id v18 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  v16,  a4);
              [v10 unionSet:v18];

              objc_autoreleasePoolPop(v17);
              ++v15;
            }

            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }

          while (v13);
        }

        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        uint64_t v19 = (void *)objc_msgSend((id)objc_msgSend(v9, "relationshipsByName"), "allValues");
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
        unint64_t v7 = 0x189603000uLL;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            uint64_t v23 = 0LL;
            do
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v42 + 1) + 8 * v23);
              uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
              objc_opt_self();
              id v26 = objc_alloc_init(*(Class *)(v7 + 4064));
              if ([v24 isToMany])
              {
                [v26 addObject:@"CD_recordNames"];
                [v26 addObject:@"CD_relationships"];
                uint64_t v27 = v26;
                uint64_t v28 = @"CD_entityNames";
              }

              else
              {
                objc_opt_self();
                uint64_t v29 = [v24 name];
                unint64_t v7 = 0x189603000LL;
                objc_opt_self();
                uint64_t v28 = (const __CFString *)[@"CD_" stringByAppendingString:v29];
                uint64_t v27 = v26;
              }

              [v27 addObject:v28];
LABEL_24:
              [v10 unionSet:v26];

              objc_autoreleasePoolPop(v25);
              ++v23;
            }

            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }

          while (v21);
        }

        objc_opt_self();
        objc_msgSend(v10, "addObject:", objc_msgSend(@"CD_", "stringByAppendingString:", @"moveReceipt"));
        [v34 unionSet:v10];

        objc_autoreleasePoolPop(context);
        uint64_t v8 = v37 + 1;
        a4 = v33;
      }

      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }

    while (v35);
  }

  return v34;
}

+ (id)newSetOfRecordKeysForAttribute:(int)a3 includeCKAssetsForFileBackedFutures:
{
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  if (+[PFCloudKitSerializer shouldTrackAttribute:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, a2))
  {
    uint64_t v6 = [a2 name];
    objc_opt_self();
    objc_msgSend(v5, "addObject:", objc_msgSend(@"CD_", "stringByAppendingString:", v6));
    if (+[PFCloudKitSerializer isVariableLengthAttributeType:]( (uint64_t)PFCloudKitSerializer,  [a2 attributeType]))
    {
      if (![a2 isFileBackedFuture] || a3)
      {
        uint64_t v7 = [a2 name];
        objc_opt_self();
        uint64_t v8 = (void *)[@"CD_" stringByAppendingString:v7];
        objc_opt_self();
        objc_msgSend(v5, "addObject:", objc_msgSend(v8, "stringByAppendingString:", @"_ckAsset"));
      }
    }
  }

  return v5;
}

+ (BOOL)shouldTrackProperty:(uint64_t)a1
{
  return ([a2 isTransient] & 1) == 0
      && !objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a2, "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateIgnoredPropertyKey"),  "BOOLValue");
}

uint64_t __111__PFCloudKitSerializer_mtmKeyForObjectWithRecordName_relatedToObjectWithRecordName_byRelationship_withInverse___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v5 = [a2 entity];
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void **)(v5 + 72);
    }

    else
    {
      do
      {
        uint64_t v6 = (void *)v5;
        uint64_t v5 = [(id)v5 superentity];
      }

      while (v5);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = (void *)[v6 name];
  uint64_t v8 = [a3 entity];
  if (v8)
  {
    if ((*(_BYTE *)(v8 + 120) & 4) != 0)
    {
      uint64_t v9 = *(void **)(v8 + 72);
    }

    else
    {
      do
      {
        uint64_t v9 = (void *)v8;
        uint64_t v8 = [(id)v8 superentity];
      }

      while (v8);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t result = objc_msgSend(v7, "compare:options:", objc_msgSend(v9, "name"), 1);
  if (!result) {
    return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:options:", objc_msgSend(a3, "name"), 1);
  }
  return result;
}

+ (id)createSetOfObjectIDsRelatedToObject:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", a2, 0);
  uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithObjects:", objc_msgSend(a2, "objectID"), 0);
  do
  {
    id v6 = (id)[v4 objectAtIndex:0];
    [v4 removeObjectAtIndex:0];
    context = (void *)MEMORY[0x186E3E5D8](objc_msgSend(v3, "addObject:", objc_msgSend(v6, "objectID")));
    uint64_t v24 = v6;
    uint64_t v7 = (void *)[v6 entity];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v23 = v7;
    id obj = (id)[v7 relationshipsByName];
    uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v25; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v10 = (void *)MEMORY[0x186E3E5D8]();
          int v11 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v23, "relationshipsByName"), "objectForKey:", v9),  "isToMany");
          uint64_t v12 = (void *)[v24 valueForKey:v9];
          uint64_t v13 = v12;
          if (v11)
          {
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              do
              {
                for (uint64_t j = 0LL; j != v15; ++j)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  id v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0
                    && (objc_msgSend(v5, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0)
                  {
                    [v4 addObject:v18];
                    objc_msgSend(v5, "addObject:", objc_msgSend(v18, "objectID"));
                  }
                }

                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }

              while (v15);
            }
          }

          else if (v12 {
                 && (objc_msgSend(v3, "containsObject:", objc_msgSend(v12, "objectID")) & 1) == 0
          }
                 && (objc_msgSend(v5, "containsObject:", objc_msgSend(v13, "objectID")) & 1) == 0)
          {
            [v4 addObject:v13];
            objc_msgSend(v5, "addObject:", objc_msgSend(v13, "objectID"));
          }

          objc_autoreleasePoolPop(v10);
        }

        uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v25);
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend( (id)objc_msgSend(v24, "managedObjectContext"),  "refreshObject:mergeChanges:",  v24,  objc_msgSend(v24, "hasChanges"));
  }

  while ([v4 count]);

  return v3;
}

+ (id)defaultRecordZoneIDForDatabaseScope:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (_MergedGlobals_80 != -1) {
    dispatch_once(&_MergedGlobals_80, &__block_literal_global_145);
  }
  if (a3 == 1) {
    return (id)qword_18C4ABAD8;
  }
  if (a3 == 2) {
    return (id)qword_18C4ABAD0;
  }
  uint64_t v5 = [NSString stringWithUTF8String:"Unable to provide a default CKRecordZoneID for database scope: %@"];
  uint64_t v6 = softLinkCKDatabaseScopeString(a3);
  _NSCoreDataLog(17LL, v5, v7, v8, v9, v10, v11, v12, v6);
  uint64_t v13 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = softLinkCKDatabaseScopeString(a3);
    _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Unable to provide a default CKRecordZoneID for database scope: %@",  buf,  0xCu);
  }

  return 0LL;
}

uint64_t __60__PFCloudKitSerializer_defaultRecordZoneIDForDatabaseScope___block_invoke()
{
  id v0 = objc_alloc(getCloudKitCKRecordZoneIDClass());
  qword_18C4ABAD0 = [v0 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
  id v1 = objc_alloc(getCloudKitCKRecordZoneIDClass());
  uint64_t CloudKitCKRecordZoneDefaultName = getCloudKitCKRecordZoneDefaultName();
  uint64_t result = [v1 initWithZoneName:CloudKitCKRecordZoneDefaultName ownerName:getCloudKitCKCurrentUserDefaultName()];
  qword_18C4ABAD8 = result;
  return result;
}

+ (void)_invalidateStaticCaches
{
  qword_18C4ABAD0 = 0LL;

  qword_18C4ABAD8 = 0LL;
}

- (void).cxx_destruct
{
}

@end