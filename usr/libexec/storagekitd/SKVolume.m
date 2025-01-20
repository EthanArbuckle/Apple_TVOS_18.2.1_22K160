@interface SKVolume
- (NSString)name;
- (NSString)password;
- (SKDisk)disk;
- (SKFilesystem)filesystem;
- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5;
- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5 password:(id)a6;
- (id)description;
- (id)formatArgs;
- (id)formatter;
- (id)redactedDescription;
@end

@implementation SKVolume

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[SKVolume initWithDisk:filesystem:name:password:]( objc_alloc(&OBJC_CLASS___SKVolume),  "initWithDisk:filesystem:name:password:",  v10,  v9,  v8,  0LL);

  return v11;
}

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5 password:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SKVolume;
  v15 = -[SKVolume init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_disk, a3);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_password, a6);
    if (v14 && ([v12 isEncrypted] & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v12 majorType]);
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:]( SKFilesystem,  "filesystemFor:caseSensitive:encrypted:isExtension:",  v17,  [v12 isCaseSensitive],  1,  objc_msgSend(v12, "isExtension")));

      id v12 = (id)v18;
    }

    objc_storeStrong((id *)&v16->_filesystem, v12);
  }

  return v16;
}

- (id)formatArgs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 formatArgs]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@" "]);

  if ([v6 count])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    unsigned __int8 v8 = [v7 isEqualToString:&stru_100046600];

    if ((v8 & 1) == 0) {
      [v3 addObjectsFromArray:v6];
    }
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
    id v12 = [v11 length];

    if (v12)
    {
      [v3 addObject:@"-E"];
      [v3 addObject:@"-S"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
      [v3 addObject:v13];
    }
  }

  [v3 addObject:@"-v"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume name](self, "name"));
  [v3 addObject:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diskIdentifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v16));
  [v3 addObject:v17];

  return v3;
}

- (id)formatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 formatExecutable]);

  return v3;
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: { disk: %@, filesystem: %@}>",  v5,  v6,  v7));

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume name](self, "name"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: { disk: %@, filesystem: %@, name: %@}>",  v5,  v6,  v7,  v8));

  return v9;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKFilesystem)filesystem
{
  return self->_filesystem;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
}

@end