@interface _PFModelUtilities
+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:;
+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:;
@end

@implementation _PFModelUtilities

+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  objc_opt_self();
  id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = (void *)[a2 objectForKey:v9];
        objc_opt_self();
        v11 = objc_alloc_init(&OBJC_CLASS___NSAttributeDescription);
        -[NSPropertyDescription setName:](v11, "setName:", v9);
        -[NSAttributeDescription setAttributeType:]( v11,  "setAttributeType:",  objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "unsignedIntegerValue"));
        if ((unint64_t)[v10 count] >= 2)
        {
          -[NSPropertyDescription setOptional:]( v11,  "setOptional:",  objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "BOOLValue"));
          if ((unint64_t)[v10 count] >= 3)
          {
            if (-[NSAttributeDescription attributeType](v11, "attributeType") == NSTransformableAttributeType)
            {
              uint64_t v12 = [v10 objectAtIndex:2];
              if (v12 != [MEMORY[0x189603FE8] null]) {
                -[NSAttributeDescription setAttributeValueClassName:]( v11,  "setAttributeValueClassName:",  [v10 objectAtIndex:2]);
              }
              if ((unint64_t)[v10 count] >= 4) {
                -[NSAttributeDescription setValueTransformerName:]( v11,  "setValueTransformerName:",  [v10 objectAtIndex:3]);
              }
            }

            else
            {
              uint64_t v13 = -[NSAttributeDescription attributeType](v11, "attributeType");
              v14 = (void *)[v10 objectAtIndex:2];
              if (v13 == 1000) {
                -[NSAttributeDescription setAllowsExternalBinaryDataStorage:]( v11,  "setAllowsExternalBinaryDataStorage:",  [v14 BOOLValue]);
              }
              else {
                -[NSAttributeDescription setDefaultValue:](v11, "setDefaultValue:", v14);
              }
            }
          }
        }

        [v16 addObject:v11];
      }

      uint64_t v6 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  [v15 addObjectsFromArray:v16];
  [a3 setProperties:v15];
}

+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __59___PFModelUtilities_addRelationships_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_189EA8958;
  v6[4] = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
  [a3 setProperties:v5];
}

@end