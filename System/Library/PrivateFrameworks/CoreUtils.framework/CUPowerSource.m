@interface CUPowerSource
+ (BOOL)supportsSecureCoding;
- (BOOL)adapterSharedSource;
- (BOOL)aggregate;
- (BOOL)charging;
- (BOOL)hasAllComponents;
- (BOOL)isAggregateComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)present;
- (BOOL)showChargingUI;
- (CUPowerSource)initWithCoder:(id)a3;
- (CUPowerSource)subCase;
- (CUPowerSource)subLeft;
- (CUPowerSource)subMain;
- (CUPowerSource)subRight;
- (NSArray)LEDs;
- (NSDictionary)ioKitAdapterDescription;
- (NSDictionary)ioKitDescription;
- (NSString)accessoryCategory;
- (NSString)accessoryID;
- (NSString)adapterName;
- (NSString)groupID;
- (NSString)name;
- (NSString)partID;
- (NSString)partName;
- (NSString)state;
- (NSString)transportType;
- (NSString)type;
- (double)chargeLevel;
- (double)maxCapacity;
- (id)description;
- (id)detailedDescription;
- (int)powerState;
- (int)publish;
- (int)role;
- (int64_t)adapterErrorFlags;
- (int64_t)adapterFamilyCode;
- (int64_t)adapterSourceID;
- (int64_t)familyCode;
- (int64_t)productID;
- (int64_t)sourceID;
- (int64_t)temperature;
- (int64_t)vendorID;
- (unint64_t)hash;
- (unsigned)expectedComponents;
- (unsigned)updateWithPowerAdapterDetails:(id)a3;
- (unsigned)updateWithPowerSourceDescription:(id)a3;
- (void)_updateWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleSubComponentsUpdated;
- (void)handleSubComponentsUpdatedWithBaseSource:(id)a3;
- (void)invalidate;
- (void)setAccessoryCategory:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAdapterErrorFlags:(int64_t)a3;
- (void)setAdapterFamilyCode:(int64_t)a3;
- (void)setAdapterName:(id)a3;
- (void)setAdapterSharedSource:(BOOL)a3;
- (void)setAdapterSourceID:(int64_t)a3;
- (void)setAggregate:(BOOL)a3;
- (void)setChargeLevel:(double)a3;
- (void)setCharging:(BOOL)a3;
- (void)setExpectedComponents:(unsigned int)a3;
- (void)setFamilyCode:(int64_t)a3;
- (void)setGroupID:(id)a3;
- (void)setIoKitAdapterDescription:(id)a3;
- (void)setIoKitDescription:(id)a3;
- (void)setLEDs:(id)a3;
- (void)setMaxCapacity:(double)a3;
- (void)setName:(id)a3;
- (void)setPartID:(id)a3;
- (void)setPartName:(id)a3;
- (void)setPowerState:(int)a3;
- (void)setPresent:(BOOL)a3;
- (void)setProductID:(int64_t)a3;
- (void)setRole:(int)a3;
- (void)setShowChargingUI:(BOOL)a3;
- (void)setSourceID:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setSubCase:(id)a3;
- (void)setSubLeft:(id)a3;
- (void)setSubMain:(id)a3;
- (void)setSubRight:(id)a3;
- (void)setTemperature:(int64_t)a3;
- (void)setTransportType:(id)a3;
- (void)setType:(id)a3;
- (void)setVendorID:(int64_t)a3;
- (void)updateWithPowerSource:(id)a3;
@end

@implementation CUPowerSource

- (CUPowerSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CUPowerSource;
  v5 = -[CUPowerSource init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CUPowerSource _updateWithCoder:](v5, "_updateWithCoder:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)_updateWithCoder:(id)a3
{
  id v4 = a3;
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = 0LL;

  id v6 = v4;
  uint64_t v7 = objc_opt_class();
  NSDecodeObjectIfPresent(v6, @"accessoryCategory", v7, (void **)&self->_accessoryCategory);

  accessoryID = self->_accessoryID;
  self->_accessoryID = 0LL;

  id v9 = v6;
  uint64_t v10 = objc_opt_class();
  NSDecodeObjectIfPresent(v9, @"accessoryID", v10, (void **)&self->_accessoryID);

  self->_adapterErrorFlags = 0LL;
  id v11 = v9;

  self->_adapterFamilyCode = 0LL;
  id v12 = v11;

  adapterName = self->_adapterName;
  self->_adapterName = 0LL;

  id v14 = v12;
  uint64_t v15 = objc_opt_class();
  NSDecodeObjectIfPresent(v14, @"adapterName", v15, (void **)&self->_adapterName);

  self->_adapterSharedSource = 0;
  id v16 = v14;

  self->_adapterSourceID = 0LL;
  id v17 = v16;

  self->_aggregate = 0;
  id v18 = v17;

  self->_charging = 0;
  id v19 = v18;

  self->_chargeLevel = 0.0;
  id v20 = v19;
  if ([v20 containsValueForKey:@"chargeLevel"])
  {
    [v20 decodeDoubleForKey:@"chargeLevel"];
    self->_chargeLevel = v21;
  }

  self->_familyCode = 0LL;
  id v22 = v20;

  groupID = self->_groupID;
  self->_groupID = 0LL;

  id v24 = v22;
  uint64_t v25 = objc_opt_class();
  NSDecodeObjectIfPresent(v24, @"groupID", v25, (void **)&self->_groupID);

  LEDs = self->_LEDs;
  self->_LEDs = 0LL;

  uint64_t v27 = objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent(v24, @"LEDs", v27, (void **)&self->_LEDs);
  self->_maxCapacity = 0.0;
  id v28 = v24;
  if ([v28 containsValueForKey:@"maxCapacity"])
  {
    [v28 decodeDoubleForKey:@"maxCapacity"];
    self->_maxCapacity = v29;
  }

  name = self->_name;
  self->_name = 0LL;

  id v31 = v28;
  uint64_t v32 = objc_opt_class();
  NSDecodeObjectIfPresent(v31, @"name", v32, (void **)&self->_name);

  partID = self->_partID;
  self->_partID = 0LL;

  id v34 = v31;
  uint64_t v35 = objc_opt_class();
  NSDecodeObjectIfPresent(v34, @"partID", v35, (void **)&self->_partID);

  partName = self->_partName;
  self->_partName = 0LL;

  id v37 = v34;
  uint64_t v38 = objc_opt_class();
  NSDecodeObjectIfPresent(v37, @"partName", v38, (void **)&self->_partName);

  self->_powerState = 0;
  self->_productID = 0LL;
  id v39 = v37;

  self->_role = 0;
  self->_sourceID = 0LL;
  id v40 = v39;

  state = self->_state;
  self->_state = 0LL;

  id v42 = v40;
  uint64_t v43 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"state", v43, (void **)&self->_state);

  subLeft = self->_subLeft;
  self->_subLeft = 0LL;

  uint64_t v45 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subLeft", v45, (void **)&self->_subLeft);
  subRight = self->_subRight;
  self->_subRight = 0LL;

  uint64_t v47 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subRight", v47, (void **)&self->_subRight);
  subCase = self->_subCase;
  self->_subCase = 0LL;

  uint64_t v49 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subCase", v49, (void **)&self->_subCase);
  subMain = self->_subMain;
  self->_subMain = 0LL;

  uint64_t v51 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subMain", v51, (void **)&self->_subMain);
  self->_temperature = 0LL;
  id v52 = v42;

  transportType = self->_transportType;
  self->_transportType = 0LL;

  id v54 = v52;
  uint64_t v55 = objc_opt_class();
  NSDecodeObjectIfPresent(v54, @"transportType", v55, (void **)&self->_transportType);

  type = self->_type;
  self->_type = 0LL;

  id v57 = v54;
  uint64_t v58 = objc_opt_class();
  NSDecodeObjectIfPresent(v57, @"type", v58, (void **)&self->_type);

  self->_vendorID = 0LL;
  id v59 = v57;

  ioKitDescription = self->_ioKitDescription;
  self->_ioKitDescription = 0LL;

  id v61 = v59;
  uint64_t v62 = objc_opt_class();
  NSDecodeStandardContainerIfPresent(v61, @"ioKitDictionary", v62, (void **)&self->_ioKitDescription);

  self->_present = 0;
  id v63 = v61;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory) {
    [v30 encodeObject:accessoryCategory forKey:@"accessoryCategory"];
  }
  accessoryID = self->_accessoryID;
  if (accessoryID) {
    [v30 encodeObject:accessoryID forKey:@"accessoryID"];
  }
  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags) {
    [v30 encodeInteger:adapterErrorFlags forKey:@"adapterErrorFlag"];
  }
  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode) {
    [v30 encodeInteger:adapterFamilyCode forKey:@"adapterFamilyCode"];
  }
  adapterName = self->_adapterName;
  if (adapterName) {
    [v30 encodeObject:adapterName forKey:@"adapterName"];
  }
  if (self->_adapterSharedSource) {
    [v30 encodeBool:1 forKey:@"adapterSharedSource"];
  }
  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID) {
    [v30 encodeInteger:adapterSourceID forKey:@"adapterSourceID"];
  }
  if (self->_aggregate) {
    [v30 encodeBool:1 forKey:@"aggregate"];
  }
  int64_t familyCode = self->_familyCode;
  if (familyCode) {
    [v30 encodeInteger:familyCode forKey:@"familyCode"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v30 encodeObject:groupID forKey:@"groupID"];
  }
  if (-[NSArray count](self->_LEDs, "count")) {
    [v30 encodeObject:self->_LEDs forKey:@"LEDs"];
  }
  if (self->_maxCapacity > 0.0) {
    objc_msgSend(v30, "encodeDouble:forKey:", @"maxCapacity");
  }
  name = self->_name;
  v13 = v30;
  if (name)
  {
    [v30 encodeObject:name forKey:@"name"];
    v13 = v30;
  }

  partID = self->_partID;
  if (partID)
  {
    [v30 encodeObject:partID forKey:@"partID"];
    v13 = v30;
  }

  partName = self->_partName;
  if (partName)
  {
    [v30 encodeObject:partName forKey:@"partName"];
    v13 = v30;
  }

  uint64_t powerState = self->_powerState;
  if ((_DWORD)powerState)
  {
    [v30 encodeInteger:powerState forKey:@"powerState"];
    v13 = v30;
  }

  int64_t productID = self->_productID;
  if (productID)
  {
    [v30 encodeInteger:productID forKey:@"productID"];
    v13 = v30;
  }

  uint64_t role = self->_role;
  if ((_DWORD)role)
  {
    [v30 encodeInteger:role forKey:@"role"];
    v13 = v30;
  }

  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    [v30 encodeInteger:sourceID forKey:@"sourceID"];
    v13 = v30;
  }

  state = self->_state;
  if (state)
  {
    [v30 encodeObject:state forKey:@"state"];
    v13 = v30;
  }

  subLeft = self->_subLeft;
  if (subLeft)
  {
    [v30 encodeObject:subLeft forKey:@"subLeft"];
    v13 = v30;
  }

  subRight = self->_subRight;
  if (subRight)
  {
    [v30 encodeObject:subRight forKey:@"subRight"];
    v13 = v30;
  }

  subCase = self->_subCase;
  if (subCase)
  {
    [v30 encodeObject:subCase forKey:@"subCase"];
    v13 = v30;
  }

  subMain = self->_subMain;
  if (subMain)
  {
    [v30 encodeObject:subMain forKey:@"subMain"];
    v13 = v30;
  }

  int64_t temperature = self->_temperature;
  if (temperature)
  {
    [v30 encodeInteger:temperature forKey:@"temperature"];
    v13 = v30;
  }

  transportType = self->_transportType;
  if (transportType)
  {
    [v30 encodeObject:transportType forKey:@"transportType"];
    v13 = v30;
  }

  type = self->_type;
  if (type)
  {
    [v30 encodeObject:type forKey:@"type"];
    v13 = v30;
  }

  int64_t vendorID = self->_vendorID;
  if (vendorID)
  {
    [v30 encodeInteger:vendorID forKey:@"vendorID"];
    v13 = v30;
  }

  ioKitDescription = self->_ioKitDescription;
  if (ioKitDescription)
  {
    [v30 encodeObject:ioKitDescription forKey:@"ioKitDictionary"];
    v13 = v30;
  }

  if (self->_present)
  {
    [v30 encodeBool:1 forKey:@"present"];
    v13 = v30;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUPowerSource;
  -[CUPowerSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    int64_t sourceID = self->_sourceID;
    if (sourceID == [v4 sourceID])
    {
      int64_t adapterSourceID = self->_adapterSourceID;
      if (adapterSourceID == [v4 adapterSourceID])
      {
        accessoryID = self->_accessoryID;
        [v4 accessoryID];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = accessoryID;
        uint64_t v10 = v8;
        id v11 = v10;
        if (v9 == v10)
        {
        }

        else
        {
          if ((v9 == 0LL) == (v10 != 0LL))
          {
            char v13 = 0;
            id v17 = v10;
LABEL_32:

            goto LABEL_33;
          }

          int v12 = -[NSString isEqual:](v9, "isEqual:", v10);

          if (!v12)
          {
            char v13 = 0;
LABEL_34:

            goto LABEL_9;
          }
        }

        groupID = self->_groupID;
        [v4 groupID];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = groupID;
        id v18 = v16;
        id v9 = v18;
        if (v17 == v18)
        {
        }

        else
        {
          if ((v17 == 0LL) == (v18 != 0LL))
          {
            char v13 = 0;
            id v22 = v18;
LABEL_31:

            goto LABEL_32;
          }

          int v19 = -[NSString isEqual:](v17, "isEqual:", v18);

          if (!v19)
          {
            char v13 = 0;
LABEL_33:

            goto LABEL_34;
          }
        }

        accessoryCategory = self->_accessoryCategory;
        [v4 accessoryCategory];
        double v21 = (void *)objc_claimAutoreleasedReturnValue();
        id v22 = accessoryCategory;
        v23 = v21;
        id v17 = v23;
        if (v22 == v23)
        {
        }

        else
        {
          if ((v22 == 0LL) == (v23 != 0LL))
          {
            char v13 = 0;
            uint64_t v27 = v23;
LABEL_30:

            goto LABEL_31;
          }

          int v24 = -[NSString isEqual:](v22, "isEqual:", v23);

          if (!v24)
          {
            char v13 = 0;
            goto LABEL_32;
          }
        }

        partID = self->_partID;
        [v4 partID];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = partID;
        id v28 = v26;
        id v22 = v28;
        if (v27 == v28)
        {
          char v13 = 1;
        }

        else if ((v27 == 0LL) == (v28 != 0LL))
        {
          char v13 = 0;
        }

        else
        {
          char v13 = -[NSString isEqual:](v27, "isEqual:", v28);
        }

        goto LABEL_30;
      }
    }
  }

  char v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)hasAllComponents
{
  BOOL result = 1;
  if (self->_aggregate)
  {
    unsigned int expectedComponents = self->_expectedComponents;
    if ((expectedComponents & 1) != 0 && !self->_subLeft) {
      return 0;
    }
    if ((expectedComponents & 2) != 0 && !self->_subRight || (expectedComponents & 4) != 0 && !self->_subCase) {
      return 0;
    }
  }

  return result;
}

- (unint64_t)hash
{
  int64_t v3 = self->_adapterSourceID ^ self->_sourceID;
  NSUInteger v4 = v3 ^ -[NSString hash](self->_accessoryID, "hash");
  NSUInteger v5 = -[NSString hash](self->_groupID, "hash");
  NSUInteger v6 = v4 ^ v5 ^ -[NSString hash](self->_accessoryCategory, "hash");
  return v6 ^ -[NSString hash](self->_partID, "hash");
}

- (id)description
{
  CFMutableStringRef v82 = 0LL;
  v53 = self;
  NSAppendPrintF(&v82);
  int64_t v3 = v82;
  NSUInteger v4 = v3;
  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    CFMutableStringRef v81 = v3;
    v53 = (CUPowerSource *)sourceID;
    NSAppendPrintF(&v81);
    NSUInteger v6 = v81;

    NSUInteger v4 = v6;
  }

  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
  {
    CFMutableStringRef v80 = v4;
    v53 = (CUPowerSource *)accessoryCategory;
    NSAppendPrintF(&v80);
    v8 = v80;

    NSUInteger v4 = v8;
  }

  accessoryID = self->_accessoryID;
  if (accessoryID)
  {
    CFMutableStringRef v79 = v4;
    v53 = (CUPowerSource *)accessoryID;
    NSAppendPrintF(&v79);
    uint64_t v10 = v79;

    NSUInteger v4 = v10;
  }

  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
  {
    CFMutableStringRef v78 = v4;
    v53 = (CUPowerSource *)adapterErrorFlags;
    NSAppendPrintF(&v78);
    int v12 = v78;

    NSUInteger v4 = v12;
  }

  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
  {
    CFMutableStringRef v77 = v4;
    v53 = (CUPowerSource *)adapterFamilyCode;
    NSAppendPrintF(&v77);
    id v14 = v77;

    NSUInteger v4 = v14;
  }

  adapterName = self->_adapterName;
  if (adapterName)
  {
    CFMutableStringRef v76 = v4;
    v53 = (CUPowerSource *)adapterName;
    NSAppendPrintF(&v76);
    id v16 = v76;

    NSUInteger v4 = v16;
  }

  if (self->_adapterSharedSource)
  {
    CFMutableStringRef v75 = v4;
    v53 = (CUPowerSource *)"yes";
    NSAppendPrintF(&v75);
    id v17 = v75;

    NSUInteger v4 = v17;
  }

  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
  {
    CFMutableStringRef v74 = v4;
    v53 = (CUPowerSource *)adapterSourceID;
    NSAppendPrintF(&v74);
    int v19 = v74;

    NSUInteger v4 = v19;
  }

  if (self->_showChargingUI)
  {
    CFMutableStringRef v73 = v4;
    v53 = (CUPowerSource *)"yes";
    NSAppendPrintF(&v73);
    id v20 = v73;

    NSUInteger v4 = v20;
  }

  int64_t familyCode = self->_familyCode;
  if (familyCode)
  {
    CFMutableStringRef v72 = v4;
    v53 = (CUPowerSource *)familyCode;
    NSAppendPrintF(&v72);
    id v22 = v72;

    NSUInteger v4 = v22;
  }

  groupID = self->_groupID;
  if (groupID)
  {
    CFMutableStringRef v71 = v4;
    v53 = (CUPowerSource *)groupID;
    NSAppendPrintF(&v71);
    int v24 = v71;

    NSUInteger v4 = v24;
  }

  if (-[NSArray count](self->_LEDs, "count", v53))
  {
    CFMutableStringRef v70 = v4;
    LEDs = self->_LEDs;
    NSAppendPrintF(&v70);
    uint64_t v25 = v70;

    NSUInteger v4 = v25;
  }

  double maxCapacity = self->_maxCapacity;
  if (maxCapacity > 0.0)
  {
    CFMutableStringRef v69 = v4;
    LEDs = *(NSArray **)&maxCapacity;
    NSAppendPrintF(&v69);
    uint64_t v27 = v69;

    NSUInteger v4 = v27;
  }

  partID = self->_partID;
  if (partID)
  {
    CFMutableStringRef v68 = v4;
    LEDs = (NSArray *)partID;
    NSAppendPrintF(&v68);
    double v29 = v68;

    NSUInteger v4 = v29;
  }

  int64_t productID = self->_productID;
  if (productID)
  {
    CFMutableStringRef v67 = v4;
    LEDs = (NSArray *)productID;
    NSAppendPrintF(&v67);
    id v31 = v67;

    NSUInteger v4 = v31;
  }

  int64_t vendorID = self->_vendorID;
  if (vendorID)
  {
    CFMutableStringRef v66 = v4;
    LEDs = (NSArray *)vendorID;
    NSAppendPrintF(&v66);
    v33 = v66;

    NSUInteger v4 = v33;
  }

  int64_t temperature = self->_temperature;
  if (temperature)
  {
    CFMutableStringRef v65 = v4;
    LEDs = (NSArray *)temperature;
    NSAppendPrintF(&v65);
    uint64_t v35 = v65;

    NSUInteger v4 = v35;
  }

  type = self->_type;
  if (type)
  {
    CFMutableStringRef v64 = v4;
    LEDs = (NSArray *)type;
    NSAppendPrintF(&v64);
    id v37 = v64;

    NSUInteger v4 = v37;
  }

  transportType = self->_transportType;
  if (transportType)
  {
    CFMutableStringRef v63 = v4;
    LEDs = (NSArray *)transportType;
    NSAppendPrintF(&v63);
    id v39 = v63;

    NSUInteger v4 = v39;
  }

  name = self->_name;
  if (name)
  {
    CFMutableStringRef v62 = v4;
    LEDs = (NSArray *)name;
    NSAppendPrintF(&v62);
    v41 = v62;

    NSUInteger v4 = v41;
  }

  double chargeLevel = self->_chargeLevel;
  if (chargeLevel != 0.0)
  {
    CFMutableStringRef v61 = v4;
    double v55 = chargeLevel * 100.0;
    uint64_t v43 = 43LL;
    LEDs = (NSArray *)v43;
    NSAppendPrintF(&v61);
    v44 = v61;

    NSUInteger v4 = v44;
  }

  unsigned int powerState = self->_powerState;
  if (powerState)
  {
    CFMutableStringRef v60 = v4;
    if (powerState > 3) {
      v46 = "?";
    }
    else {
      v46 = off_189F31A00[powerState - 1];
    }
    LEDs = (NSArray *)v46;
    NSAppendPrintF(&v60);
    uint64_t v47 = v60;

    NSUInteger v4 = v47;
  }

  if ((self->_aggregate || self->_expectedComponents)
    && !-[CUPowerSource isAggregateComponent](self, "isAggregateComponent", LEDs, *(void *)&v55))
  {
    CFMutableStringRef v59 = v4;
    NSAppendPrintF(&v59);
    v48 = v59;

    if (self->_subLeft)
    {
      CFMutableStringRef v58 = v48;
      NSAppendPrintF(&v58);
      uint64_t v49 = v58;

      v48 = v49;
    }

    if (self->_subRight)
    {
      CFMutableStringRef v57 = v48;
      NSAppendPrintF(&v57);
      v50 = v57;

      v48 = v50;
    }

    if (self->_subCase)
    {
      CFMutableStringRef v56 = v48;
      NSAppendPrintF(&v56);
      uint64_t v51 = v56;

      return v51;
    }

    NSUInteger v4 = v48;
  }

  return v4;
}

- (id)detailedDescription
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)publish
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v49 = v2;
  if (v2->_psID || (int v46 = IOPSCreatePowerSource()) == 0)
  {
    v48 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    accessoryCategory = v2->_accessoryCategory;
    if (accessoryCategory) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  accessoryCategory,  @"Accessory Category");
    }
    accessoryID = v2->_accessoryID;
    if (accessoryID) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  accessoryID,  @"Accessory Identifier");
    }
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", v2->_charging, &v2->_psID);
    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v5, @"Is Charging");

    [MEMORY[0x189607968] numberWithInt:fabs(v2->_chargeLevel + -1.0) < 0.00000011920929];
    NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v6, @"Is Charged");

    [MEMORY[0x189607968] numberWithInt:(int)(v2->_chargeLevel * 100.0)];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v7, @"Current Capacity");

    groupID = v2->_groupID;
    if (groupID) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  groupID,  @"Group Identifier");
    }
    if (-[NSArray count](v2->_LEDs, "count"))
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      obj = v2->_LEDs;
      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v57,  16LL);
      if (v10)
      {
        uint64_t v11 = *(void *)v52;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(obj);
            }
            char v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            id v14 = (void *)NSString;
            unsigned int v15 = [v13 LEDState];
            id v16 = "?";
            if (v15 <= 2) {
              id v16 = off_189F31A18[v15];
            }
            [v14 stringWithUTF8String:v16];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            id v18 = (void *)NSString;
            unsigned int v19 = [v13 LEDColor];
            id v20 = "?";
            if (v19 <= 3) {
              id v20 = off_189F31A30[v19];
            }
            [v18 stringWithUTF8String:v20];
            double v21 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = @"State";
            v55[1] = @"Color";
            v56[0] = v17;
            v56[1] = v21;
            [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:v55 count:2];
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 addObject:v22];
          }

          uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v57,  16LL);
        }

        while (v10);
      }

      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v9, @"LEDs");
    }

    [MEMORY[0x189607968] numberWithDouble:v2->_maxCapacity];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v23, @"Max Capacity");

    name = v2->_name;
    if (name) {
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", name, @"Name");
    }
    partID = v2->_partID;
    if (partID) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  partID,  @"Part Identifier");
    }
    partName = v2->_partName;
    if (partName) {
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", partName, @"Part Name");
    }
    if (v2->_productID)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v27, @"Product ID");
    }

    state = v2->_state;
    if (state) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  state,  @"Power Source State");
    }
    [MEMORY[0x189607968] numberWithInteger:v2->_temperature];
    double v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v29, @"Temperature");

    transportType = v2->_transportType;
    if (transportType) {
      -[NSDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  transportType,  @"Transport Type");
    }
    type = v2->_type;
    if (type) {
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", type, @"Type");
    }
    if (v2->_vendorID)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v32, @"Vendor ID");
    }

    if (-[NSString isEqual:](v2->_type, "isEqual:", @"Accessory Source"))
    {
      id v33 = objc_alloc_init(MEMORY[0x189603FC8]);
      if (v2->_adapterErrorFlags)
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
        id v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 setObject:v34 forKeyedSubscript:@"ErrorFlags"];
      }

      if (v2->_adapterFamilyCode)
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 setObject:v35 forKeyedSubscript:@"FamilyCode"];
      }

      adapterName = v2->_adapterName;
      if (adapterName) {
        [v33 setObject:adapterName forKeyedSubscript:@"Name"];
      }
      [MEMORY[0x189607968] numberWithBool:v2->_adapterSharedSource];
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 setObject:v37 forKeyedSubscript:@"SharedSource"];

      if (v2->_adapterSourceID)
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 setObject:v38 forKeyedSubscript:@"Source"];
      }

      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v33, @"AdapterDetails");
    }

    id v39 = v48;
    if (!v48) {
      goto LABEL_57;
    }
    p_ioKitDescription = (id *)&v2->_ioKitDescription;
    ioKitDescription = v2->_ioKitDescription;
    id v42 = v48;
    uint64_t v43 = ioKitDescription;
    if (v42 == v43)
    {

      id v39 = v48;
    }

    else
    {
      v44 = v43;
      if (v43)
      {
        char v45 = -[NSDictionary isEqual:](v42, "isEqual:", v43);

        id v39 = v48;
        if ((v45 & 1) != 0) {
          goto LABEL_57;
        }
      }

      else
      {

        id v39 = v48;
      }

      objc_storeStrong(p_ioKitDescription, v39);
      int v46 = IOPSSetPowerSourceDetails();
      id v39 = v48;
      if (v46) {
        goto LABEL_58;
      }
    }

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_psID)
  {
    IOPSReleasePowerSource();
    obj->_psID = 0LL;
  }

  -[CUPowerSource invalidate](obj->_subLeft, "invalidate");
  subLeft = obj->_subLeft;
  obj->_subLeft = 0LL;

  -[CUPowerSource invalidate](obj->_subRight, "invalidate");
  subRight = obj->_subRight;
  obj->_subRight = 0LL;

  -[CUPowerSource invalidate](obj->_subCase, "invalidate");
  subCase = obj->_subCase;
  obj->_subCase = 0LL;

  -[CUPowerSource invalidate](obj->_subMain, "invalidate");
  subMain = obj->_subMain;
  obj->_subMain = 0LL;

  objc_sync_exit(obj);
}

- (NSArray)LEDs
{
  if (self->_LEDs) {
    return self->_LEDs;
  }
  else {
    return (NSArray *)MEMORY[0x189604A58];
  }
}

- (void)handleSubComponentsUpdated
{
}

- (void)handleSubComponentsUpdatedWithBaseSource:(id)a3
{
  NSUInteger v4 = (CUPowerSource *)a3;
  subLeft = v4;
  if (v4 || (subLeft = self->_subLeft) != 0LL || (subLeft = self->_subRight) != 0LL)
  {
    CFMutableStringRef v69 = subLeft;

    NSUInteger v6 = v69;
    goto LABEL_5;
  }

  NSUInteger v6 = self->_subCase;
  if (v6)
  {
LABEL_5:
    CFMutableStringRef v70 = v6;
    -[CUPowerSource accessoryID](v6, "accessoryID");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7) {
      goto LABEL_13;
    }
    accessoryID = self->_accessoryID;
    uint64_t v10 = v7;
    uint64_t v11 = accessoryID;
    if (v10 == v11)
    {

      goto LABEL_13;
    }

    int v12 = v11;
    if (v11)
    {
      char v13 = -[NSString isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
      {
LABEL_13:
        int64_t v14 = -[CUPowerSource adapterErrorFlags](v70, "adapterErrorFlags");
        if (v14 != self->_adapterErrorFlags) {
          self->_int64_t adapterErrorFlags = v14;
        }
        int64_t v15 = -[CUPowerSource adapterFamilyCode](v70, "adapterFamilyCode");
        if (v15 != self->_adapterFamilyCode) {
          self->_int64_t adapterFamilyCode = v15;
        }
        -[CUPowerSource adapterName](v70, "adapterName");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          adapterName = self->_adapterName;
          id v18 = v16;
          unsigned int v19 = adapterName;
          if (v18 == v19)
          {

            goto LABEL_25;
          }

          id v20 = v19;
          if (v19)
          {
            char v21 = -[NSString isEqual:](v18, "isEqual:", v19);

            if ((v21 & 1) != 0) {
              goto LABEL_25;
            }
          }

          else
          {
          }

          objc_storeStrong((id *)&self->_adapterName, v16);
        }

- (BOOL)isAggregateComponent
{
  return -[NSString isEqualToString:](self->_accessoryCategory, "isEqualToString:", @"Audio Battery Case")
      || -[NSString isEqualToString:](self->_accessoryCategory, "isEqualToString:", @"Headphone");
}

- (unsigned)updateWithPowerAdapterDetails:(id)a3
{
  NSUInteger v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, a3);
  int Int64Ranged = CFDictionaryGetInt64Ranged(v5, @"FamilyCode", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  if (Int64Ranged == self->_adapterFamilyCode)
  {
    unsigned int v7 = 0;
  }

  else
  {
    self->_int64_t adapterFamilyCode = Int64Ranged;
    unsigned int v7 = 256;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, @"Name", TypeID, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  adapterName = self->_adapterName;
  uint64_t v11 = v9;
  int v12 = adapterName;
  if (v11 == v12)
  {

    int64_t v15 = v11;
LABEL_11:

    goto LABEL_12;
  }

  char v13 = v12;
  if ((v11 == 0LL) == (v12 != 0LL))
  {

    goto LABEL_10;
  }

  char v14 = -[NSString isEqual:](v11, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {
LABEL_10:
    id v16 = v11;
    int64_t v15 = self->_adapterName;
    self->_adapterName = v16;
    unsigned int v7 = 256;
    goto LABEL_11;
  }

- (void)updateWithPowerSource:(id)a3
{
  NSUInteger v4 = (objc_class *)MEMORY[0x1896078F8];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  [v5 encodeWithCoder:v9];

  id v6 = objc_alloc(MEMORY[0x189607908]);
  [v9 encodedData];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v6 initForReadingFromData:v7 error:0];

  -[CUPowerSource _updateWithCoder:](self, "_updateWithCoder:", v8);
  [v8 finishDecoding];
}

- (unsigned)updateWithPowerSourceDescription:(id)a3
{
  uint64_t v131 = *MEMORY[0x1895F89C0];
  id v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitDescription, a3);
  self->_present = 1;
  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, @"Accessory Category", TypeID, 0LL);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  accessoryCategory = self->_accessoryCategory;
  uint64_t v10 = v7;
  uint64_t v11 = accessoryCategory;
  if (v10 == v11)
  {

    goto LABEL_7;
  }

  int v12 = v11;
  if (v11)
  {
    char v13 = -[NSString isEqual:](v10, "isEqual:", v11);

    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accessoryCategory, v8);
  unsigned int v14 = 1;
LABEL_10:
  CFTypeID v15 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, @"Accessory Identifier", v15, 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16) {
    goto LABEL_18;
  }
  accessoryID = self->_accessoryID;
  int v18 = v16;
  int v19 = accessoryID;
  if (v18 == v19)
  {

    goto LABEL_18;
  }

  id v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }

  char v21 = -[NSString isEqual:](v18, "isEqual:", v19);

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_accessoryID, v16);
    unsigned int v14 = 1;
  }

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (BOOL)charging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (double)chargeLevel
{
  return self->_chargeLevel;
}

- (void)setChargeLevel:(double)a3
{
  self->_double chargeLevel = a3;
}

- (unsigned)expectedComponents
{
  return self->_expectedComponents;
}

- (void)setExpectedComponents:(unsigned int)a3
{
  self->_unsigned int expectedComponents = a3;
}

- (int64_t)familyCode
{
  return self->_familyCode;
}

- (void)setFamilyCode:(int64_t)a3
{
  self->_int64_t familyCode = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (void)setLEDs:(id)a3
{
}

- (double)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(double)a3
{
  self->_double maxCapacity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)partID
{
  return self->_partID;
}

- (void)setPartID:(id)a3
{
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_unsigned int powerState = a3;
}

- (int64_t)productID
{
  return self->_productID;
}

- (void)setProductID:(int64_t)a3
{
  self->_int64_t productID = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_uint64_t role = a3;
}

- (BOOL)showChargingUI
{
  return self->_showChargingUI;
}

- (void)setShowChargingUI:(BOOL)a3
{
  self->_showChargingUI = a3;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_int64_t sourceID = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (CUPowerSource)subLeft
{
  return self->_subLeft;
}

- (void)setSubLeft:(id)a3
{
}

- (CUPowerSource)subRight
{
  return self->_subRight;
}

- (void)setSubRight:(id)a3
{
}

- (CUPowerSource)subCase
{
  return self->_subCase;
}

- (void)setSubCase:(id)a3
{
}

- (CUPowerSource)subMain
{
  return self->_subMain;
}

- (void)setSubMain:(id)a3
{
}

- (int64_t)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(int64_t)a3
{
  self->_int64_t temperature = a3;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(int64_t)a3
{
  self->_int64_t vendorID = a3;
}

- (int64_t)adapterErrorFlags
{
  return self->_adapterErrorFlags;
}

- (void)setAdapterErrorFlags:(int64_t)a3
{
  self->_int64_t adapterErrorFlags = a3;
}

- (int64_t)adapterFamilyCode
{
  return self->_adapterFamilyCode;
}

- (void)setAdapterFamilyCode:(int64_t)a3
{
  self->_int64_t adapterFamilyCode = a3;
}

- (NSString)adapterName
{
  return self->_adapterName;
}

- (void)setAdapterName:(id)a3
{
}

- (BOOL)adapterSharedSource
{
  return self->_adapterSharedSource;
}

- (void)setAdapterSharedSource:(BOOL)a3
{
  self->_adapterSharedSource = a3;
}

- (int64_t)adapterSourceID
{
  return self->_adapterSourceID;
}

- (void)setAdapterSourceID:(int64_t)a3
{
  self->_int64_t adapterSourceID = a3;
}

- (NSDictionary)ioKitAdapterDescription
{
  return self->_ioKitAdapterDescription;
}

- (void)setIoKitAdapterDescription:(id)a3
{
}

- (NSDictionary)ioKitDescription
{
  return self->_ioKitDescription;
}

- (void)setIoKitDescription:(id)a3
{
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end