@interface DIBlockDevice
+ (id)copyUnmatchedDiskImageWithRegEntryID:(unint64_t)a3 error:(id *)a4;
- (BOOL)diskImageDevice;
- (NSString)mediumType;
- (id)copyIOMediaWithError:(id *)a3;
- (id)copyRootBlockDeviceWithError:(id *)a3;
@end

@implementation DIBlockDevice

- (id)copyIOMediaWithError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[DIIOObject ioObjectWithClassName:iterateParent:error:]( self,  "ioObjectWithClassName:iterateParent:error:",  @"IOMedia",  0LL,  a3));
  v4 = -[DIIOObject initWithDIIOObject:](objc_alloc(&OBJC_CLASS___DIIOMedia), "initWithDIIOObject:", v3);

  return v4;
}

- (BOOL)diskImageDevice
{
  return IOObjectConformsTo(-[DIIOObject ioObj](self, "ioObj"), "AppleDiskImageDevice") != 0;
}

- (NSString)mediumType
{
  id v2 = -[DIIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSDictionary, a2),  @"Device Characteristics");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Medium Type"]);
    id v5 = [v4 copy];
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (id)copyRootBlockDeviceWithError:(id *)a3
{
  id v5 = -[DIIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSNumber, a2),  @"RootDeviceEntryID");
  v6 = objc_alloc(&OBJC_CLASS___DIBlockDevice);
  if (v5) {
    v7 = -[DIIOObject initWithRegistryEntryID:error:]( v6,  "initWithRegistryEntryID:error:",  [v5 unsignedLongLongValue],  a3);
  }
  else {
    v7 = -[DIIOObject initWithDIIOObject:](v6, "initWithDIIOObject:", self);
  }
  v8 = v7;

  return v8;
}

+ (id)copyUnmatchedDiskImageWithRegEntryID:(unint64_t)a3 error:(id *)a4
{
  v6 = -[DIIOObject initWithClassName:error:]( objc_alloc(&OBJC_CLASS___DIIOObject),  "initWithClassName:error:",  @"AppleDiskImagesController",  a4);
  id v7 = -[DIIOObject newIteratorWithOptions:error:](v6, "newIteratorWithOptions:error:", 0LL, a4);
  if (v7)
  {
    v8 = 0LL;
    while (1)
    {
      v9 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithIteratorNext:", v7);

      if (!v9) {
        break;
      }
      v8 = v9;
      if (-[DIIOObject registryEntryIDWithError:](v9, "registryEntryIDWithError:", 0LL) == a3) {
        goto LABEL_8;
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find disk image with reg entry ID 0x%llx",  a3));
    v9 = (DIBlockDevice *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v10,  a4));
  }

  else
  {
    v9 = 0LL;
  }

@end