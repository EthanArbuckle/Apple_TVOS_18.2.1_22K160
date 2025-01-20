@interface SKIOMedia
- (NSString)BSDName;
- (SKIOMedia)initWithDADisk:(id)a3;
- (SKIOMedia)initWithDevName:(id)a3;
- (id)copyBlockDevice;
@end

@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  mach_port_t v5 = *MEMORY[0x1896086A8];
  id v6 = [v4 lastPathComponent];
  v7 = IOBSDNameMatching(v5, 0, (const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v7);

  if ((_DWORD)MatchingService)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___SKIOMedia;
    self = -[SKIOObject initWithIOObject:](&v12, sel_initWithIOObject_, MatchingService);
    v9 = self;
  }

  else
  {
    SKGetOSLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "Failed to find IO media entry for %@", buf, 0xCu);
    }

    v9 = 0LL;
  }

  return v9;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = (__DADisk *)a3;
  mach_port_t v5 = v4;
  if (!v4)
  {
LABEL_7:
    v7 = 0LL;
    goto LABEL_8;
  }

  uint64_t v6 = DADiskCopyIOMedia(v4);
  if (!(_DWORD)v6)
  {
    SKGetOSLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v12 = v5;
      _os_log_impl(&dword_188F75000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get IO media object for DA disk %@", buf, 0xCu);
    }

    goto LABEL_7;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SKIOMedia;
  self = -[SKIOObject initWithIOObject:](&v10, sel_initWithIOObject_, v6);
  v7 = self;
LABEL_8:

  return v7;
}

- (NSString)BSDName
{
  return (NSString *) -[SKIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"BSD Name");
}

- (id)copyBlockDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SKIOObject initWithSKIOObject:](objc_alloc(&OBJC_CLASS___SKBlockDevice), "initWithSKIOObject:", v2);

  return v3;
}

@end