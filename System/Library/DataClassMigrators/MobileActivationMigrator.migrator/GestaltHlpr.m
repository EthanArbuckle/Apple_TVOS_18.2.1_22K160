@interface GestaltHlpr
+ (id)getSharedInstance;
- (BOOL)getBoolAnswer:(__CFString *)a3;
- (id)copyAnswer:(__CFString *)a3;
- (id)copyDeviceIDInfo:(id *)a3;
- (id)copyDeviceInfo:(id *)a3;
- (id)copyRegulatoryImagesInfo:(id *)a3;
- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (void)updateRecertInfo:(id)a3 errors:(id *)a4;
@end

@implementation GestaltHlpr

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1) {
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  }
  return (id)getSharedInstance_sharedInstance;
}

void __32__GestaltHlpr_getSharedInstance__block_invoke(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___GestaltHlpr);
  v2 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = (uint64_t)v1;
}

- (id)copyAnswer:(__CFString *)a3
{
  if (!a3) {
    return 0LL;
  }
  v4 = (void *)MGCopyAnswer(a3, 0LL);
  if (os_variant_allows_internal_security_policies([@"com.apple.mobileactivationd" UTF8String])
    && is_virtual_machine())
  {
    if ((-[__CFString isEqualToString:](a3, "isEqualToString:", @"ProductType") & 1) != 0)
    {
      v5 = @"iPod5,1";
LABEL_9:

      return (id)v5;
    }

    if (-[__CFString isEqualToString:](a3, "isEqualToString:", @"DeviceClass"))
    {
      v5 = @"iPod";
      goto LABEL_9;
    }
  }

  return v4;
}

- (BOOL)getBoolAnswer:(__CFString *)a3
{
  id v3 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", a3);
  id v4 = isNSNumber(v3);

  LOBYTE(v3) = [v4 BOOLValue];
  return (char)v3;
}

- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", a3);
  v13 = v12;
  if (v12
    && ((id v14 = isNSString(v12)) == 0LL
     || (v15 = v14, id v16 = [v13 length], v15, v16)))
  {
    [v10 setObject:v13 forKeyedSubscript:a3];
  }

  else if (v7)
  {
    v17 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to query required gestalt key: %@",  a3);
    [v11 addObject:v17];
  }
}

- (id)copyDeviceIDInfo:(id *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SerialNumber",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueDeviceID",  v6,  1LL,  v5);
  id v7 = -[NSMutableArray count](v5, "count");
  if (a3 && v7) {
    *a3 = v5;
  }

  return v6;
}

- (id)copyDeviceInfo:(id *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceClass",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductType",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"BuildVersion",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ModelNumber",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductVersion",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegionCode",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegionInfo",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegulatoryModelNumber",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ReleaseType",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueChipID",  v6,  1LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceVariant",  v6,  0LL,  v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SigningFuse",  v6,  0LL,  v5);
  id v7 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", @"ProductName");
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, @"OSType");
  }

  else
  {
    v8 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to query required gestalt key: %@",  @"ProductName");
    -[NSMutableArray addObject:](v5, "addObject:", v8);
  }

  id v9 = -[NSMutableArray count](v5, "count");
  if (a3 && v9) {
    *a3 = v5;
  }

  return v6;
}

- (id)copyRegulatoryImagesInfo:(id *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceVariant",  v6,  1LL,  v5);
  id v7 = -[NSMutableArray count](v5, "count");
  if (a3 && v7) {
    *a3 = v5;
  }

  return v6;
}

- (void)updateRecertInfo:(id)a3 errors:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v6)
  {
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SerialNumber",  v6,  0LL,  v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceClass",  v6,  1LL,  v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductType",  v6,  1LL,  v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"BuildVersion",  v6,  0LL,  v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueDeviceID",  v6,  0LL,  v7);
    if (-[GestaltHlpr getBoolAnswer:](self, "getBoolAnswer:", @"HasBaseband"))
    {
      -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"InternationalMobileEquipmentIdentity",  v6,  0LL,  v7);
      id v8 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", @"xRyzf9zFE/ycr/wJPweZvQ");
      if (v8) {
        [v6 setObject:v8 forKeyedSubscript:@"InternationalMobileEquipmentIdentity2"];
      }
      -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"MobileEquipmentIdentifier",  v6,  0LL,  v7);
    }

    else
    {
      id v8 = 0LL;
    }

    id v9 = -[NSMutableArray count](v7, "count");
    if (a4 && v9) {
      *a4 = v7;
    }
  }

  else
  {
    id v8 = 0LL;
  }
}

@end