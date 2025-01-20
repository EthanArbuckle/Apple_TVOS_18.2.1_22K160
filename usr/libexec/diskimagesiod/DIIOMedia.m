@interface DIIOMedia
- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4;
- (NSString)BSDName;
- (id)copyBlockDeviceWithError:(id *)a3;
@end

@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  v8 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v7 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v8);

  if ((_DWORD)MatchingService)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___DIIOMedia;
    self = -[DIIOObject initWithIOObject:](&v13, "initWithIOObject:", MatchingService);
    v10 = self;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find IO media entry for %@",  v6));
    v10 = (DIIOMedia *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v11,  a4));
  }

  return v10;
}

- (NSString)BSDName
{
  return (NSString *) -[DIIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString, a2),  @"BSD Name");
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[DIIOObject ioObjectWithClassName:iterateParent:error:]( self,  "ioObjectWithClassName:iterateParent:error:",  @"IOBlockStorageDevice",  1LL,  a3));
  v4 = -[DIIOObject initWithDIIOObject:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithDIIOObject:", v3);

  return v4;
}

@end