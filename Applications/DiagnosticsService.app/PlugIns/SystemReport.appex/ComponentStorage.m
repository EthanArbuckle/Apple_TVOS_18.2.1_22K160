@interface ComponentStorage
- (BOOL)isPresent;
- (id)checkDiskSpaceForURLResourceKey:(id)a3;
- (id)dataAvailable;
- (id)dataCapacity;
- (id)serialNumber;
- (id)totalDiskCapacity;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentStorage

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage dataCapacity](self, "dataCapacity"));
  [v4 setObject:v5 forKeyedSubscript:@"nandCapacity"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage dataAvailable](self, "dataAvailable"));
  [v4 setObject:v6 forKeyedSubscript:@"nandAvailable"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage totalDiskCapacity](self, "totalDiskCapacity"));
  [v4 setObject:v7 forKeyedSubscript:@"nandTotalDiskCapacity"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage serialNumber](self, "serialNumber"));
  [v4 setObject:v8 forKeyedSubscript:@"serialNumber"];

  v9 = CopyAppleCareNANDInfo();
  [v4 setObject:v9 forKeyedSubscript:@"nandInfo"];
}

- (id)dataCapacity
{
  if (statfs("/", &v7)) {
    v2 = 0LL;
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v7.f_blocks * v7.f_bsize));
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringValue]);
  id v4 = stringOrNull(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)dataAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[ComponentStorage checkDiskSpaceForURLResourceKey:]( self,  "checkDiskSpaceForURLResourceKey:",  NSURLVolumeAvailableCapacityKey));
  id v3 = numberOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)totalDiskCapacity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[ComponentStorage checkDiskSpaceForURLResourceKey:]( self,  "checkDiskSpaceForURLResourceKey:",  NSURLVolumeTotalCapacityKey));
  id v3 = numberOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)serialNumber
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = [&off_10008E698 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(&off_10008E698);
        }
        uint64_t v6 = objc_claimAutoreleasedReturnValue( +[DAComponentUtil getIORegistryClass:property:optionalKey:]( &OBJC_CLASS___DAComponentUtil,  "getIORegistryClass:property:optionalKey:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v5),  @"Serial Number",  0LL));
        if (v6)
        {
          statfs v7 = (void *)v6;
          v8 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
          goto LABEL_11;
        }

        v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [&off_10008E698 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  statfs v7 = 0LL;
  v8 = 0LL;
LABEL_11:
  id v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)checkDiskSpaceForURLResourceKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/private/var"));
  id v10 = 0LL;
  id v11 = 0LL;
  [v4 getResourceValue:&v11 forKey:v3 error:&v10];
  id v5 = v11;
  id v6 = v10;
  if (!v5)
  {
    uint64_t v7 = DiagnosticsKitLogHandleForCategory(1LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unable to check resource %@ in system report: %@",  buf,  0x16u);
    }
  }

  return v5;
}

@end