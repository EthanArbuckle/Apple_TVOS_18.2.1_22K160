@interface DIIOMedia
- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4;
- (NSString)BSDName;
- (id)copyBlockDeviceWithError:(id *)a3;
@end

@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  mach_port_t v7 = *MEMORY[0x1896086A8];
  id v8 = [v6 lastPathComponent];
  v9 = IOBSDNameMatching(v7, 0, (const char *)[v8 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v7, v9);

  if ((_DWORD)MatchingService)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___DIIOMedia;
    self = -[DIIOObject initWithIOObject:](&v14, sel_initWithIOObject_, MatchingService);
    v11 = self;
  }

  else
  {
    [NSString stringWithFormat:@"Failed to find IO media entry for %@", v6];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v12,  a4);
    v11 = (DIIOMedia *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)BSDName
{
  return (NSString *) -[DIIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"BSD Name");
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIOObject initWithDIIOObject:](objc_alloc(&OBJC_CLASS___DIBlockDevice), "initWithDIIOObject:", v3);

  return v4;
}

@end