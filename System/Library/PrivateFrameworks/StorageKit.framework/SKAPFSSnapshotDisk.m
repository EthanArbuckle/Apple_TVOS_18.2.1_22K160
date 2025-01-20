@interface SKAPFSSnapshotDisk
- (NSString)apfsUUID;
- (NSString)snapshotName;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (int64_t)sealStatus;
- (void)setApfsUUID:(id)a3;
- (void)setSealStatus:(int64_t)a3;
- (void)setSnapshotName:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSSnapshotDisk

- (NSString)apfsUUID
{
  return self->_apfsUUID;
}

- (void)setApfsUUID:(id)a3
{
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v9.receiver = v5;
  v9.super_class = (Class)&OBJC_CLASS___SKAPFSSnapshotDisk;
  -[SKAPFSDisk updateWithDictionary:](&v9, sel_updateWithDictionary_, v4);
  [v4 objectForKey:@"snapshotName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setSnapshotName:](v5, "setSnapshotName:", v6);

  [v4 objectForKey:@"snapshotSealStatus"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setSealStatus:](v5, "setSealStatus:", [v7 integerValue]);

  [v4 objectForKey:@"apfsUUID"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setApfsUUID:](v5, "setApfsUUID:", v8);

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)&OBJC_CLASS___SKAPFSSnapshotDisk;
  v3 = -[SKAPFSDisk dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
    [v3 setObject:v5 forKeyedSubscript:@"snapshotName"];
  }

  if (-[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKeyedSubscript:@"snapshotSealStatus"];
  }
  v7 = -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
  if (v7)
  {
    v8 = -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
    [v3 setObject:v8 forKeyedSubscript:@"apfsUUID"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)&OBJC_CLASS___SKAPFSSnapshotDisk;
  v3 = -[SKAPFSDisk minimalDictionaryRepresentation](&v10, sel_minimalDictionaryRepresentation);
  -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
    [v3 setObject:v5 forKeyedSubscript:@"snapshotName"];
  }

  if (-[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKeyedSubscript:@"snapshotSealStatus"];
  }
  v7 = -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
  if (v7)
  {
    v8 = -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
    [v3 setObject:v8 forKeyedSubscript:@"apfsUUID"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)NSString;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SKAPFSSnapshotDisk;
  v6 = -[SKAPFSDisk innerDescriptionWithPrivateData:](&v13, sel_innerDescriptionWithPrivateData_);
  if (v3)
  {
    -[SKAPFSSnapshotDisk snapshotName](self, "snapshotName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = @"<private>";
  }

  uint64_t v8 = -[SKAPFSSnapshotDisk snapshotUUID](self, "snapshotUUID");
  objc_super v9 = (void *)v8;
  objc_super v10 = @"--";
  if (v8) {
    objc_super v10 = (const __CFString *)v8;
  }
  [v5 stringWithFormat:@"%@, Snapshot Name: %@, Snapshot UUID: %@", v6, v7, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
  return v11;
  }
}

- (NSString)snapshotName
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setSnapshotName:(id)a3
{
}

- (int64_t)sealStatus
{
  return self->_sealStatus;
}

- (void)setSealStatus:(int64_t)a3
{
  self->_sealStatus = a3;
}

- (void).cxx_destruct
{
}

@end