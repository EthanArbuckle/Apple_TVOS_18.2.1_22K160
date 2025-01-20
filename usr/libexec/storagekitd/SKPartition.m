@interface SKPartition
- (NSString)name;
- (SKFilesystem)fs;
- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4;
- (unint64_t)size;
- (void)setFs:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SKPartition

- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4
{
  unsigned __int16 v5 = a3;
  int v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartition fs](self, "fs"));
  id v8 = [v7 contentMask];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartition name](self, "name"));
  v10 = (void *)MKCFBuildPartition(v5, 0LL, v8, v9, -[SKPartition size](self, "size") / a4, 0LL, &v17, 0LL);

  if (v17)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100045590];

    id v12 = sub_10000E2BC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to create partition", v16, 2u);
    }

    id v14 = 0LL;
  }

  else
  {
    id v14 = v10;
  }

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKFilesystem)fs
{
  return self->_fs;
}

- (void)setFs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end