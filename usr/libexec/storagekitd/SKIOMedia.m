@interface SKIOMedia
- (NSString)BSDName;
- (SKIOMedia)initWithDADisk:(id)a3;
- (SKIOMedia)initWithDevName:(id)a3;
- (id)copyBlockDevice;
@end

@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  id v4 = a3;
  id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  v6 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v5 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);

  if ((_DWORD)MatchingService)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___SKIOMedia;
    self = -[SKIOObject initWithIOObject:](&v12, "initWithIOObject:", MatchingService);
    v8 = self;
  }

  else
  {
    id v9 = sub_10000E2BC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to find IO media entry for %@",  buf,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  id v4 = (__DADisk *)a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_7:
    v7 = 0LL;
    goto LABEL_8;
  }

  uint64_t v6 = DADiskCopyIOMedia(v4);
  if (!(_DWORD)v6)
  {
    id v8 = sub_10000E2BC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to get IO media object for DA disk %@",  buf,  0xCu);
    }

    goto LABEL_7;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKIOMedia;
  self = -[SKIOObject initWithIOObject:](&v11, "initWithIOObject:", v6);
  v7 = self;
LABEL_8:

  return v7;
}

- (NSString)BSDName
{
  return (NSString *) -[SKIOObject copyPropertyWithClass:key:]( self,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"BSD Name");
}

- (id)copyBlockDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SKIOObject ioObjectWithClassName:iterateParents:]( self,  "ioObjectWithClassName:iterateParents:",  @"IOBlockStorageDevice",  1LL));
  v3 = -[SKIOObject initWithSKIOObject:](objc_alloc(&OBJC_CLASS___SKBlockDevice), "initWithSKIOObject:", v2);

  return v3;
}

@end