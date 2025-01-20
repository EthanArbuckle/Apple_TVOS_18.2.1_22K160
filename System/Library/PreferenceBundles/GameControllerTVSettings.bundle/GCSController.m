@interface GCSController
+ (id)generateElementDictionaryFromElements:(id)a3;
+ (id)productCategoryLocalizationKeyForProductCategory:(id)a3;
- (BOOL)supportsBuddyController;
- (GCColor)leftJoyConColor;
- (GCColor)rightJoyConColor;
- (GCSController)initWithController:(id)a3;
- (NSArray)macAddresses;
- (NSArray)uuidIdentifiers;
- (int64_t)tvset_controllerType;
@end

@implementation GCSController

- (int64_t)tvset_controllerType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));

  if (!v3) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v5 = [v4 isEqualToString:@"PRODUCT_CATEGORY_DUALSHOCK4"];

  if ((v5 & 1) != 0) {
    return 3LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v8 = [v7 isEqualToString:@"PRODUCT_CATEGORY_DUALSENSE"];

  if ((v8 & 1) != 0) {
    return 5LL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v10 = [v9 isEqualToString:@"PRODUCT_CATEGORY_XBOX_ONE"];

  if ((v10 & 1) != 0) {
    return 1LL;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v12 = [v11 isEqualToString:@"PRODUCT_CATEGORY_XBOX_ELITE"];

  if ((v12 & 1) != 0) {
    return 1LL;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v14 = [v13 isEqualToString:@"PRODUCT_CATEGORY_XBOX_ADAPTIVE"];

  if ((v14 & 1) != 0) {
    return 2LL;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
  unsigned __int8 v16 = [v15 isEqualToString:@"PRODUCT_CATEGORY_MFI"];

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController productCategoryKey](self, "productCategoryKey"));
    [v17 isEqualToString:@"PRODUCT_CATEGORY_HID"];
  }

  return 4LL;
}

+ (id)productCategoryLocalizationKeyForProductCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:GCProductCategoryDualShock4])
  {
    v4 = @"PRODUCT_CATEGORY_DUALSHOCK4";
  }

  else if ([v3 isEqualToString:GCProductCategoryDualSense])
  {
    v4 = @"PRODUCT_CATEGORY_DUALSENSE";
  }

  else
  {
    if ([v3 isEqualToString:@"Xbox Elite"])
    {
      v4 = @"PRODUCT_CATEGORY_XBOX_ELITE";
      goto LABEL_21;
    }

    if ([v3 isEqualToString:@"Xbox Adaptive"])
    {
      v4 = @"PRODUCT_CATEGORY_XBOX_ADAPTIVE";
      goto LABEL_21;
    }

    if ([v3 isEqualToString:@"Xbox Series X"])
    {
LABEL_6:
      v4 = @"PRODUCT_CATEGORY_XBOX_ONE";
    }

    else if ([v3 isEqualToString:GCProductCategoryMFi])
    {
      v4 = @"PRODUCT_CATEGORY_MFI";
    }

    else if ([v3 isEqualToString:GCProductCategoryHID])
    {
      v4 = @"PRODUCT_CATEGORY_HID";
    }

    else if ([v3 containsString:@"Nintendo Switch Joy-Con"])
    {
      v4 = @"PRODUCT_CATEGORY_NINTENDO_JOY_CON";
    }

    else if ([v3 isEqualToString:@"Switch Pro Controller"])
    {
      v4 = @"PRODUCT_CATEGORY_NINTENDO_PRO_CONTROLLER";
    }

    else
    {
      v4 = @"PRODUCT_CATEGORY_GENERIC_CONTROLLER";
    }
  }

- (GCSController)initWithController:(id)a3
{
  id v3 = a3;
  uint64_t v47 = objc_claimAutoreleasedReturnValue([v3 vendorName]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0) {
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  else {
    v50 = @"CONTROLLER";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 buttons]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GCInputButtonShare]);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 buttons]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:GCInputButtonOptions]);

  if (v9)
  {
    v13 = objc_alloc(&OBJC_CLASS___GCSElement);
    uint64_t v14 = v9;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 buttons]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:GCInputButtonOptions]);

    if (!v17)
    {
      v45 = 0LL;
      goto LABEL_9;
    }

    v13 = objc_alloc(&OBJC_CLASS___GCSElement);
    uint64_t v14 = v12;
  }

  v45 = -[GCSElement initWithElement:](v13, "initWithElement:", v14);
LABEL_9:
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allButtons]);
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[GCSController generateElementDictionaryFromElements:]( &OBJC_CLASS___GCSController,  "generateElementDictionaryFromElements:",  v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allDpads]);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[GCSController generateElementDictionaryFromElements:]( &OBJC_CLASS___GCSController,  "generateElementDictionaryFromElements:",  v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 physicalInputProfile]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:GCInputButtonHome]);
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 unmappedSfSymbolsName]);

  v48 = (void *)v9;
  if (v24 && (-[__CFString hasPrefix:](v24, "hasPrefix:", @"logo") & 1) != 0)
  {
    v42 = v24;
  }

  else
  {

    v42 = @"gamecontroller.fill";
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 haptics]);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 light]);
  id v41 = +[GCSProfile newBaseProfile](&OBJC_CLASS___GCSProfile, "newBaseProfile");
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 components]);
  id v28 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
  v46 = (void *)v12;
  if (v28)
  {
    id v29 = v28;
    v30 = 0LL;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        if ([v33 conformsToProtocol:&OBJC_PROTOCOL___GCControllerProductInfo])
        {
          uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 miscellaneous]);

          v30 = (void *)v34;
        }
      }

      id v29 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }

    while (v29);
  }

  else
  {
    v30 = 0LL;
  }

  if (v47) {
    v35 = (__CFString *)v47;
  }
  else {
    v35 = @"GAME_CONTROLLER_DEFAULT_NAME";
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 detailedProductCategory]);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[GCSController productCategoryLocalizationKeyForProductCategory:]( &OBJC_CLASS___GCSController,  "productCategoryLocalizationKeyForProductCategory:",  v36));
  BYTE1(v40) = v26 != 0LL;
  LOBYTE(v40) = v25 != 0LL;
  v38 =  -[GCSController initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:]( self,  "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supp ortsHaptics:supportsLight:baseProfile:miscellaneous:",  v35,  v50,  v37,  0LL,  v45,  v44,  v43,  v42,  v40,  v41,  v30);

  return v38;
}

+ (id)generateElementDictionaryFromElements:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "remappable", (void)v15))
        {
          v11 = -[GCSElement initWithElement:](objc_alloc(&OBJC_CLASS___GCSElement), "initWithElement:", v10);
          uint64_t v12 = v11;
          if (v11)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCSElement name](v11, "name"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v13);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

- (NSArray)macAddresses
{
  return (NSArray *)sub_19FE0(self, (uint64_t)a2, (uint64_t (*)(void))sub_19BFC);
}

- (NSArray)uuidIdentifiers
{
  return (NSArray *)sub_19FE0(self, (uint64_t)a2, (uint64_t (*)(void))sub_1A03C);
}

- (GCColor)leftJoyConColor
{
  v2 = self;
  id v3 = sub_1A38C(1952867692LL, 0xE400000000000000LL);

  return (GCColor *)v3;
}

- (GCColor)rightJoyConColor
{
  v2 = self;
  id v3 = sub_1A38C(0x7468676972LL, 0xE500000000000000LL);

  return (GCColor *)v3;
}

- (BOOL)supportsBuddyController
{
  v2 = self;
  id v3 = -[GCSController productCategoryKey](v2, "productCategoryKey");
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v6 = v5;

  if (v4 == 0xD000000000000021LL && v6 == 0x8000000000041410LL)
  {

    swift_bridgeObjectRelease(0x8000000000041410LL);
    char v7 = 0;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 0xD000000000000021LL, 0x8000000000041410LL, 0LL);

    swift_bridgeObjectRelease(v6);
    char v7 = v8 ^ 1;
  }

  return v7 & 1;
}

@end