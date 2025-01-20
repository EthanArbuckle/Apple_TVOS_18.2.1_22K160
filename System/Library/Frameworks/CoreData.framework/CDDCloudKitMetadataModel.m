@interface CDDCloudKitMetadataModel
+ (id)newMetadataModel;
+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:;
+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:;
@end

@implementation CDDCloudKitMetadataModel

+ (id)newMetadataModel
{
  v17[5] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc_init(&OBJC_CLASS___NSManagedObjectModel);
  v3 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  v4 = (objc_class *)objc_opt_class();
  -[NSEntityDescription setName:](v3, "setName:", NSStringFromClass(v4));
  -[NSEntityDescription setManagedObjectClassName:]( v3,  "setManagedObjectClassName:",  -[NSEntityDescription name](v3, "name"));
  v16[0] = @"bundleIdentifier";
  v16[1] = @"storePath";
  v17[0] = &unk_189F0B1F0;
  v17[1] = &unk_189F0B208;
  v16[2] = @"fileProtectionType";
  v15[0] = &unk_189F04368;
  v15[1] = MEMORY[0x189604A80];
  v15[2] = *MEMORY[0x189607538];
  v17[2] = [MEMORY[0x189603F18] arrayWithObjects:v15 count:3];
  v17[3] = &unk_189F0B220;
  v16[3] = @"storeConfigurationName";
  v16[4] = @"containerIdentifier";
  v17[4] = &unk_189F0B238;
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]( (uint64_t)CDDCloudKitMetadataModel,  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:5],  v3);
  v5 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  v6 = (objc_class *)objc_opt_class();
  -[NSEntityDescription setName:](v5, "setName:", NSStringFromClass(v6));
  -[NSEntityDescription setManagedObjectClassName:]( v5,  "setManagedObjectClassName:",  -[NSEntityDescription name](v5, "name"));
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]( (uint64_t)&OBJC_CLASS___CDDCloudKitMetadataModel,  &unk_189F03D38,  v5);
  v13 = @"registeredClient";
  v12[0] = &unk_189F043E0;
  v12[1] = v3;
  v12[2] = [MEMORY[0x189603FE8] null];
  v12[3] = &unk_189F043F8;
  v12[4] = &unk_189F04410;
  uint64_t v14 = [MEMORY[0x189603F18] arrayWithObjects:v12 count:5];
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]( (uint64_t)CDDCloudKitMetadataModel,  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v14 forKeys:&v13 count:1],  v5);
  v9[4] = &unk_189F043E0;
  v10 = @"scheduledActivities";
  v9[0] = &unk_189F04410;
  v9[1] = v5;
  v9[2] = @"registeredClient";
  v9[3] = &unk_189F04428;
  uint64_t v11 = [MEMORY[0x189603F18] arrayWithObjects:v9 count:5];
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]( (uint64_t)CDDCloudKitMetadataModel,  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1],  v3);
  v8[0] = v3;
  v8[1] = v5;
  -[NSManagedObjectModel setEntities:]( v2,  "setEntities:",  [MEMORY[0x189603F18] arrayWithObjects:v8 count:2]);

  return v2;
}

+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_189EA8958;
  v6[4] = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
  [a3 setProperties:v5];
}

+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_189EA8958;
  v6[4] = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
  [a3 setProperties:v5];
}

void __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v8 = objc_alloc_init(&OBJC_CLASS___NSAttributeDescription);
  -[NSPropertyDescription setName:](v8, "setName:", a2);
  -[NSAttributeDescription setAttributeType:]( v8,  "setAttributeType:",  objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  if (-[NSAttributeDescription attributeType](v8, "attributeType") == NSTransformableAttributeType) {
    -[NSAttributeDescription setValueTransformerName:]( v8,  "setValueTransformerName:",  +[NSCloudKitMirroringDelegate cloudKitMetadataTransformerName]( &OBJC_CLASS___NSCloudKitMirroringDelegate,  "cloudKitMetadataTransformerName"));
  }
  if ((unint64_t)[a3 count] >= 2)
  {
    -[NSPropertyDescription setOptional:]( v8,  "setOptional:",  objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "BOOLValue"));
    if ((unint64_t)[a3 count] >= 3)
    {
      uint64_t v6 = -[NSAttributeDescription attributeType](v8, "attributeType");
      uint64_t v7 = [a3 objectAtIndex:2];
      if (v6 == 1800) {
        -[NSAttributeDescription setAttributeValueClassName:](v8, "setAttributeValueClassName:", v7);
      }
      else {
        -[NSAttributeDescription setDefaultValue:](v8, "setDefaultValue:", v7);
      }
    }
  }

  [*(id *)(a1 + 32) addObject:v8];
}

void __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSRelationshipDescription);
  -[NSPropertyDescription setName:](v7, "setName:", a2);
  -[NSRelationshipDescription setMaxCount:]( v7,  "setMaxCount:",  objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  -[NSRelationshipDescription setDestinationEntity:]( v7,  "setDestinationEntity:",  [a3 objectAtIndex:1]);
  if ((unint64_t)[a3 count] >= 3)
  {
    uint64_t v6 = [a3 objectAtIndex:2];
    if (v6 != [MEMORY[0x189603FE8] null])
    {
      -[NSRelationshipDescription setInverseRelationship:]( v7,  "setInverseRelationship:",  -[NSDictionary objectForKey:]( -[NSEntityDescription relationshipsByName]( -[NSRelationshipDescription destinationEntity](v7, "destinationEntity"),  "relationshipsByName"),  "objectForKey:",  v6));
      if (-[NSRelationshipDescription inverseRelationship](v7, "inverseRelationship")) {
        -[NSRelationshipDescription setInverseRelationship:]( -[NSRelationshipDescription inverseRelationship](v7, "inverseRelationship"),  "setInverseRelationship:",  v7);
      }
    }

    if ((unint64_t)[a3 count] >= 4)
    {
      -[NSRelationshipDescription setDeleteRule:]( v7,  "setDeleteRule:",  objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "unsignedIntegerValue"));
      if ((unint64_t)[a3 count] >= 5) {
        -[NSPropertyDescription setOptional:]( v7,  "setOptional:",  objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "BOOLValue"));
      }
    }
  }

  [*(id *)(a1 + 32) addObject:v7];
}

@end