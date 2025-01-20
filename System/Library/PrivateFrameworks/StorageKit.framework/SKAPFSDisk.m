@interface SKAPFSDisk
- (BOOL)defaultEffaceable;
- (BOOL)hasVolumeSiblings;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDictionary:(id)a3;
- (NSString)apfsRole;
- (NSString)apfsVolumeGroupUUID;
- (id)container;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)wholeDiskIdentifier;
- (unint64_t)quotaSpace;
- (unint64_t)reserveSpace;
- (unint64_t)usedSpace;
- (void)setApfsRole:(id)a3;
- (void)setApfsVolumeGroupUUID:(id)a3;
- (void)setDefaultEffaceable:(BOOL)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setQuotaSpace:(unint64_t)a3;
- (void)setReserveSpace:(unint64_t)a3;
- (void)setUsedSpace:(unint64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13.receiver = v5;
  v13.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
  -[SKDisk updateWithDictionary:](&v13, sel_updateWithDictionary_, v4);
  [v4 objectForKey:@"isEncrypted"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setIsEncrypted:](v5, "setIsEncrypted:", [v6 BOOLValue]);

  [v4 objectForKey:@"defaultEffaceable"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setDefaultEffaceable:](v5, "setDefaultEffaceable:", [v7 BOOLValue]);

  [v4 objectForKey:@"usedSpace"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setUsedSpace:](v5, "setUsedSpace:", [v8 unsignedLongLongValue]);

  [v4 objectForKey:@"reserveSpace"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setReserveSpace:](v5, "setReserveSpace:", [v9 unsignedLongLongValue]);

  [v4 objectForKey:@"quotaSpace"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setQuotaSpace:](v5, "setQuotaSpace:", [v10 unsignedLongLongValue]);

  [v4 objectForKey:@"apfsRole"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", v11);

  [v4 objectForKey:@"apfsVolumeGroupUUID"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setApfsVolumeGroupUUID:](v5, "setApfsVolumeGroupUUID:", v12);

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v14.receiver = v2;
  v14.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
  v3 = -[SKDisk dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKAPFSDisk usedSpace](v2, "usedSpace"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"usedSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKAPFSDisk quotaSpace](v2, "quotaSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"quotaSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKAPFSDisk reserveSpace](v2, "reserveSpace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKey:@"reserveSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKAPFSDisk isEncrypted](v2, "isEncrypted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKey:@"isEncrypted"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKAPFSDisk defaultEffaceable](v2, "defaultEffaceable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"defaultEffaceable"];
  v9 = -[SKAPFSDisk apfsVolumeGroupUUID](v2, "apfsVolumeGroupUUID");
  if (v9)
  {
    v10 = -[SKAPFSDisk apfsVolumeGroupUUID](v2, "apfsVolumeGroupUUID");
    [v3 setObject:v10 forKey:@"apfsVolumeGroupUUID"];
  }
  v11 = -[SKAPFSDisk apfsRole](v2, "apfsRole");
  if (v11)
  {
    v12 = -[SKAPFSDisk apfsRole](v2, "apfsRole");
    [v3 setObject:v12 forKey:@"apfsRole"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  id v4 = (void *)NSString;
  v5 = -[SKAPFSDisk apfsUUID](self, "apfsUUID", a3);
  if (v5)
  {
    -[SKAPFSDisk apfsUUID](self, "apfsUUID");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = @"--";
  }

  BOOL v7 = -[SKAPFSDisk isEncrypted](self, "isEncrypted");
  v8 = @"No";
  if (v7) {
    v8 = @"Yes";
  }
  [v4 stringWithFormat:@"APFS UUID: %@, Encrypted: %@", v6, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {

  }
  return v9;
}

- (id)container
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (id)wholeDiskIdentifier
{
  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    id v3 = objc_alloc(MEMORY[0x189604030]);
    -[SKDisk diskIdentifier](self, "diskIdentifier");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)[v3 initWithString:v4];

    v6 = (void *)NSString;
    [v5 host];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"apfs://%@", v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
    -[SKDisk wholeDiskIdentifier](&v10, sel_wholeDiskIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)matchesDictionary:(id)a3
{
  id v4 = a3;
  if (-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
    unsigned __int8 v5 = -[SKDisk matchesDictionary:](&v12, sel_matchesDictionary_, v4);
  }

  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"**ClassName**"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 isEqualToString:v8])
    {
      v9 = -[SKDisk mountPoint](self, "mountPoint");
      [v4 objectForKey:@"mountPoint"];
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned __int8 v5 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
  -[SKDisk minimalDictionaryRepresentation](&v6, sel_minimalDictionaryRepresentation);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SKDisk isIOMediaDisk](v2, "isIOMediaDisk"))
  {
    -[SKDisk mountPoint](v2, "mountPoint");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setValue:v4 forKey:@"mountPoint"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
    unsigned __int8 v5 = -[SKDisk isEqual:](&v10, sel_isEqual_, v4);
  }

  else if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v6 = v4;
    -[SKDisk mountPoint](self, "mountPoint");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 mountPoint];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    unsigned __int8 v5 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)hasVolumeSiblings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKAPFSDisk container](self, "container");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 volumes];
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SKAPFSDisk container](self, "container");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 volumes];
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = (unint64_t)[v7 count] > 1;
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)usedSpace
{
  return self->_usedSpace;
}

- (void)setUsedSpace:(unint64_t)a3
{
  self->_usedSpace = a3;
}

- (unint64_t)reserveSpace
{
  return self->_reserveSpace;
}

- (void)setReserveSpace:(unint64_t)a3
{
  self->_reserveSpace = a3;
}

- (unint64_t)quotaSpace
{
  return self->_quotaSpace;
}

- (void)setQuotaSpace:(unint64_t)a3
{
  self->_quotaSpace = a3;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (NSString)apfsVolumeGroupUUID
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setApfsVolumeGroupUUID:(id)a3
{
}

- (NSString)apfsRole
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setApfsRole:(id)a3
{
}

- (void).cxx_destruct
{
}

@end