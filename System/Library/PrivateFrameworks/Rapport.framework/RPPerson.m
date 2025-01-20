@interface RPPerson
+ (BOOL)supportsSecureCoding;
- (CURangingMeasurement)relativeLocation;
- (NSArray)devices;
- (NSMutableDictionary)deviceDict;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)name;
- (RPPerson)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)activityLevel;
- (int)proximity;
- (unsigned)_updateDeviceDerivedInfo;
- (unsigned)flags;
- (unsigned)removeRPDevice:(id)a3;
- (unsigned)updateWithRPDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceDict:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation RPPerson

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPPerson;
  v5 = -[RPPerson init](&v12, sel_init);
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  id v7 = v6;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  if (!v5->_identifier)
  {
    RPErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 failWithError:v10];

LABEL_11:
    v9 = 0LL;
    goto LABEL_12;
  }

  id v8 = v7;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  objc_opt_class();
  NSDecodeObjectIfPresent();
  v9 = v5;
LABEL_12:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t activityLevel = self->_activityLevel;
  id v13 = v4;
  if ((_DWORD)activityLevel)
  {
    [v4 encodeInteger:activityLevel forKey:@"al"];
    id v4 = v13;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    [v13 encodeObject:contactID forKey:@"cnid"];
    id v4 = v13;
  }

  devices = self->_devices;
  if (devices)
  {
    [v13 encodeObject:devices forKey:@"dv"];
    id v4 = v13;
  }

  uint64_t flags = self->_flags;
  if ((_DWORD)flags)
  {
    [v13 encodeInt64:flags forKey:@"fl"];
    id v4 = v13;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v13 encodeObject:identifier forKey:@"id"];
    id v4 = v13;
  }

  name = self->_name;
  if (name)
  {
    [v13 encodeObject:name forKey:@"nm"];
    id v4 = v13;
  }

  uint64_t proximity = self->_proximity;
  if ((_DWORD)proximity)
  {
    [v13 encodeInteger:proximity forKey:@"px"];
    id v4 = v13;
  }

  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    [v13 encodeObject:relativeLocation forKey:@"rl"];
    id v4 = v13;
  }
}

- (id)description
{
  return -[RPPerson descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (a3 <= 49) {
    uint64_t v5 = 100LL;
  }
  else {
    uint64_t v5 = 8LL;
  }
  uint64_t v55 = 0LL;
  identifier = self->_identifier;
  NSAppendPrintF();
  id v6 = (NSArray *)0LL;
  id v7 = v6;
  uint64_t flags = (NSString *)self->_flags;
  if ((_DWORD)flags)
  {
    v54 = v6;
    identifier = flags;
    v43 = (NSString *)&unk_1873E77FE;
    NSAppendPrintF();
    v9 = v54;

    id v7 = v9;
  }

  name = self->_name;
  if (name)
  {
    v53 = v7;
    identifier = name;
    NSAppendPrintF();
    v11 = v7;

    id v7 = v11;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    v52 = v7;
    identifier = (NSString *)v5;
    v43 = contactID;
    NSAppendPrintF();
    id v13 = v7;

    id v7 = v13;
  }

  int proximity = self->_proximity;
  if (proximity)
  {
    v51 = v7;
    switch(proximity)
    {
      case 10:
        v15 = "Immed";
        break;
      case 30:
        v15 = "Far";
        break;
      case 20:
        v15 = "Near";
        break;
      default:
        v15 = "?";
        break;
    }

    identifier = (NSString *)v15;
    NSAppendPrintF();
    v16 = v51;

    id v7 = v16;
  }

  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    v50 = v7;
    identifier = relativeLocation;
    NSAppendPrintF();
    v18 = v7;

    id v7 = v18;
  }

  unsigned int activityLevel = self->_activityLevel;
  if (activityLevel)
  {
    v49 = v7;
    if (activityLevel > 0xE) {
      v20 = "?";
    }
    else {
      v20 = off_18A033AD0[activityLevel - 1];
    }
    identifier = (NSString *)v20;
    NSAppendPrintF();
    v21 = v49;

    id v7 = v21;
  }

  v22 = self->_devices;
  v23 = v22;
  if (v22)
  {
    uint64_t v24 = -[NSArray count](v22, "count", identifier);
    if (a3 > 49)
    {
      NSAppendPrintF();
      v39 = v7;
    }

    else
    {
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      v25 = v23;
      uint64_t v26 = -[NSArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
      if (!v26)
      {
LABEL_44:

        goto LABEL_45;
      }

      uint64_t v27 = v26;
      v44 = v23;
      int v28 = 0;
      char v29 = 1;
      uint64_t v30 = v24;
      uint64_t v31 = *(void *)v46;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v25);
          }
          v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if ((v29 & 1) != 0)
          {
            v42 = (const char *)v30;
            NSAppendPrintF();
            v34 = v7;

            id v7 = v34;
          }

          uint64_t v35 = objc_msgSend(v33, "name", v42, v43);
          v36 = (void *)v35;
          if (v35)
          {
            v37 = ", ";
            if (!v28) {
              v37 = "";
            }
            v42 = v37;
            v43 = (NSString *)v35;
            NSAppendPrintF();
            v38 = v7;

            ++v28;
            id v7 = v38;
          }

          char v29 = 0;
        }

        uint64_t v27 = -[NSArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
        char v29 = 0;
      }

      while (v27);

      NSAppendPrintF();
      v39 = v7;
      v23 = v44;
    }

    v25 = v7;
    id v7 = v39;
    goto LABEL_44;
  }

- (unsigned)removeRPDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDict, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDict, "setObject:forKeyedSubscript:", 0LL, v4);
    -[NSMutableDictionary allValues](self->_deviceDict, "allValues");
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    devices = self->_devices;
    self->_devices = v6;

    unsigned int v8 = -[RPPerson _updateDeviceDerivedInfo](self, "_updateDeviceDerivedInfo") | 2;
  }

  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (unsigned)updateWithRPDevice:(id)a3
{
  id v4 = a3;
  [v4 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDict, "objectForKeyedSubscript:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  deviceDict = self->_deviceDict;
  if (!deviceDict)
  {
    unsigned int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v9 = self->_deviceDict;
    self->_deviceDict = v8;

    deviceDict = self->_deviceDict;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDict, "setObject:forKeyedSubscript:", v4, v5);
  -[NSMutableDictionary allValues](self->_deviceDict, "allValues");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v10;

  unsigned int v12 = -[RPPerson _updateDeviceDerivedInfo](self, "_updateDeviceDerivedInfo") | (2 * (v6 == 0LL));
  return v12;
}

- (unsigned)_updateDeviceDerivedInfo
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 0;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  unsigned int flags = self->_flags;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 0;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 0;
  deviceDict = self->_deviceDict;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __36__RPPerson__updateDeviceDerivedInfo__block_invoke;
  v11[3] = &unk_18A033AB0;
  v11[4] = self;
  v11[5] = &v20;
  v11[6] = &v24;
  v11[7] = &v16;
  v11[8] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceDict, "enumerateKeysAndObjectsUsingBlock:", v11);
  int v5 = *((_DWORD *)v21 + 6);
  id v6 = v25;
  if (v5 != self->_activityLevel)
  {
    self->_unsigned int activityLevel = v5;
    *((_DWORD *)v6 + 6) |= 1u;
  }

  unsigned int v7 = *((_DWORD *)v17 + 6);
  if (v7 != flags)
  {
    self->_unsigned int flags = v7;
    *((_DWORD *)v6 + 6) |= 1u;
  }

  int v8 = *((_DWORD *)v13 + 6);
  if (v8 == self->_proximity)
  {
    unsigned int v9 = *((_DWORD *)v6 + 6);
  }

  else
  {
    self->_int proximity = v8;
    unsigned int v9 = *((_DWORD *)v6 + 6) | 4;
    *((_DWORD *)v6 + 6) = v9;
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void __36__RPPerson__updateDeviceDerivedInfo__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  int v4 = [v11 activityLevel];
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  if (v4 > *(_DWORD *)(v5 + 24)) {
    *(_DWORD *)(v5 + 24) = v4;
  }
  if (!*(void *)(a1[4] + 24LL))
  {
    [v11 contactID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)(a1[4] + 24LL), v6);
      *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) |= 1u;
    }
  }

  __int16 v7 = [v11 flags];
  if ((v7 & 8) != 0)
  {
    *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 8u;
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }

  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_9;
  }

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 0x10u;
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSArray)devices
{
  return self->_devices;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int)proximity
{
  return self->_proximity;
}

- (CURangingMeasurement)relativeLocation
{
  return (CURangingMeasurement *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSMutableDictionary)deviceDict
{
  return self->_deviceDict;
}

- (void)setDeviceDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end