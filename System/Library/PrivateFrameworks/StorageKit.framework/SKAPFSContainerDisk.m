@interface SKAPFSContainerDisk
- (BOOL)isVirtualDiskType;
- (NSString)designatedPSUUID;
- (id)copyVolumesWithIncludeSnapshots:(BOOL)a3;
- (id)designatedPhysicalStore;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)physicalStores;
- (id)volumes;
- (id)volumesExcludingSnapshots;
- (void)setDesignatedPSUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSContainerDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7.receiver = v5;
  v7.super_class = (Class)&OBJC_CLASS___SKAPFSContainerDisk;
  -[SKDisk updateWithDictionary:](&v7, sel_updateWithDictionary_, v4);
  [v4 objectForKey:@"designatedPSUUID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSContainerDisk setDesignatedPSUUID:](v5, "setDesignatedPSUUID:", v6);

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___SKAPFSContainerDisk;
  v3 = -[SKDisk minimalDictionaryRepresentation](&v7, sel_minimalDictionaryRepresentation);
  -[SKAPFSContainerDisk designatedPSUUID](v2, "designatedPSUUID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SKAPFSContainerDisk designatedPSUUID](v2, "designatedPSUUID");
    [v3 setObject:v5 forKey:@"designatedPSUUID"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v5.receiver = v2;
  v5.super_class = (Class)&OBJC_CLASS___SKAPFSContainerDisk;
  v3 = -[SKDisk dictionaryRepresentation](&v5, sel_dictionaryRepresentation);
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk", a3))
  {
    id v4 = @"liveFS";
  }

  else
  {
    objc_super v5 = (void *)NSString;
    uint64_t v6 = -[SKAPFSContainerDisk apfsUUID](self, "apfsUUID");
    objc_super v7 = (void *)v6;
    v8 = @"--";
    if (v6) {
      v8 = (const __CFString *)v6;
    }
    [v5 stringWithFormat:@"APFS UUID: %@", v8];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)physicalStores
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
  [MEMORY[0x189603FA8] arrayWithCapacity:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_msgSend(v3, "allDisks", 0);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v11 = v10;
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)copyVolumesWithIncludeSnapshots:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[SKDisk children](self, "children");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)volumes
{
  return -[SKAPFSContainerDisk copyVolumesWithIncludeSnapshots:](self, "copyVolumesWithIncludeSnapshots:", 1LL);
}

- (id)volumesExcludingSnapshots
{
  return -[SKAPFSContainerDisk copyVolumesWithIncludeSnapshots:](self, "copyVolumesWithIncludeSnapshots:", 0LL);
}

- (id)designatedPhysicalStore
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[SKAPFSContainerDisk physicalStores](self, "physicalStores");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk", (void)v16)) {
          goto LABEL_12;
        }
        uint64_t v9 = -[SKAPFSContainerDisk designatedPSUUID](self, "designatedPSUUID");
        if (!v9) {
          goto LABEL_12;
        }
        uint64_t v10 = (void *)v9;
        -[SKAPFSContainerDisk designatedPSUUID](self, "designatedPSUUID");
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 apfsUUID];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v11 isEqualToString:v12];

        if ((v13 & 1) != 0)
        {
LABEL_12:
          id v14 = v8;
          goto LABEL_14;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v14 = 0LL;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v14 = 0LL;
  }

- (BOOL)isVirtualDiskType
{
  return 1;
}

- (NSString)designatedPSUUID
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setDesignatedPSUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end