@interface SKAPFSStoreDisk
- (BOOL)canResize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOurContainerWithDisk:(id)a3;
- (NSString)apfsContainerIdentifier;
- (NSString)apfsContainerUUID;
- (id)container;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (void)setApfsContainerIdentifier:(id)a3;
- (void)setApfsContainerUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSStoreDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_CLASS___SKAPFSStoreDisk;
  -[SKDisk updateWithDictionary:](&v8, sel_updateWithDictionary_, v4);
  [v4 objectForKey:@"apfsContainerUUID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSStoreDisk setApfsContainerUUID:](v5, "setApfsContainerUUID:", v6);

  [v4 objectForKey:@"apfsContainerIdentifier"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSStoreDisk setApfsContainerIdentifier:](v5, "setApfsContainerIdentifier:", v7);

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___SKAPFSStoreDisk;
  v3 = -[SKDisk minimalDictionaryRepresentation](&v7, sel_minimalDictionaryRepresentation);
  -[SKAPFSStoreDisk apfsContainerUUID](v2, "apfsContainerUUID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v4 forKey:@"apfsContainerUUID"];
  v5 = -[SKAPFSStoreDisk apfsContainerIdentifier](v2, "apfsContainerIdentifier");
  [v3 setValue:v5 forKey:@"apfsContainerIdentifier"];

  objc_sync_exit(v2);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKAPFSStoreDisk;
  if (-[SKDisk isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    [v4 apfsContainerUUID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToString:v6])
    {
      -[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier");
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 apfsContainerIdentifier];
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqualToString:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  id v4 = (void *)NSString;
  v5 = -[SKAPFSStoreDisk apfsUUID](self, "apfsUUID", a3);
  if (v5)
  {
    -[SKAPFSStoreDisk apfsUUID](self, "apfsUUID");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = @"--";
  }

  -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"APFS UUID: %@, Container UUID: %@", v6, v8];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 stringWithFormat:@"APFS UUID: %@, Container UUID: %@", v6, @"--"];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5) {
  return v9;
  }
}

- (BOOL)canResize
{
  return 1;
}

- (BOOL)isOurContainerWithDisk:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    uint64_t v6 = -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    if (!v6) {
      goto LABEL_4;
    }
    objc_super v7 = (void *)v6;
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 apfsUUID];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
      char v13 = 0;
    }

    else
    {
LABEL_4:
      [v5 diskIdentifier];
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier");
      char v13 = [v11 isEqualToString:v12];
    }
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)container
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_msgSend(v3, "allDisks", 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (-[SKAPFSStoreDisk isOurContainerWithDisk:](self, "isOurContainerWithDisk:", v9))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (NSString)apfsContainerUUID
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setApfsContainerUUID:(id)a3
{
}

- (NSString)apfsContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setApfsContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end