@interface IXRemoteInstallResult
- (BOOL)isEqual:(id)a3;
- (IXRemoteInstallResult)initWithDBUUID:(id)a3 dbSequenceNumber:(id)a4 URLOfInstalledApp:(id)a5 persistentIdentifier:(id)a6;
- (IXRemoteInstallResult)initWithURLOfInstalledApp:(id)a3 persistentIdentifier:(id)a4;
- (NSData)persistentIdentifier;
- (NSNumber)dbSequenceNumber;
- (NSURL)URLOfInstalledApp;
- (NSUUID)dbUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDbSequenceNumber:(id)a3;
- (void)setDbUUID:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setURLOfInstalledApp:(id)a3;
@end

@implementation IXRemoteInstallResult

- (BOOL)isEqual:(id)a3
{
  v4 = (IXRemoteInstallResult *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbUUID](self, "dbUUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbUUID](v6, "dbUUID"));
      id v9 = v7;
      id v10 = v8;
      v11 = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbSequenceNumber](self, "dbSequenceNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbSequenceNumber](v6, "dbSequenceNumber"));
      id v9 = v12;
      id v14 = v13;
      v11 = v14;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult URLOfInstalledApp](self, "URLOfInstalledApp"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult URLOfInstalledApp](v6, "URLOfInstalledApp"));
      id v9 = v15;
      id v17 = v16;
      v11 = v17;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult persistentIdentifier](self, "persistentIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult persistentIdentifier](v6, "persistentIdentifier"));
      id v9 = v18;
      id v20 = v19;
      v11 = v20;
      if ((v9 != 0) != (v20 != 0) || v9 && v20 && ![v9 isEqual:v20]) {
LABEL_22:
      }
        BOOL v21 = 0;
      else {
        BOOL v21 = 1;
      }
    }

    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbUUID](self, "dbUUID"));
  unint64_t v4 = (unint64_t)[v3 hash];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbSequenceNumber](self, "dbSequenceNumber"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult URLOfInstalledApp](self, "URLOfInstalledApp"));
  unint64_t v8 = (unint64_t)[v7 hash];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult persistentIdentifier](self, "persistentIdentifier"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbUUID](self, "dbUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbSequenceNumber](self, "dbSequenceNumber"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult URLOfInstalledApp](self, "URLOfInstalledApp"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ 0x%p: dbUUID=%@ dbSequenceNumber=%@ URLOfInstalledApp=%@>",  v5,  self,  v6,  v7,  v8));

  return v9;
}

- (IXRemoteInstallResult)initWithDBUUID:(id)a3 dbSequenceNumber:(id)a4 URLOfInstalledApp:(id)a5 persistentIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IXRemoteInstallResult;
  id v14 = -[IXRemoteInstallResult init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    -[IXRemoteInstallResult setDbUUID:](v14, "setDbUUID:", v10);
    -[IXRemoteInstallResult setDbSequenceNumber:](v15, "setDbSequenceNumber:", v11);
    -[IXRemoteInstallResult setURLOfInstalledApp:](v15, "setURLOfInstalledApp:", v12);
    -[IXRemoteInstallResult setPersistentIdentifier:](v15, "setPersistentIdentifier:", v13);
  }

  return v15;
}

- (IXRemoteInstallResult)initWithURLOfInstalledApp:(id)a3 persistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXRemoteInstallResult;
  unint64_t v8 = -[IXRemoteInstallResult init](&v11, "init");
  id v9 = v8;
  if (v8)
  {
    -[IXRemoteInstallResult setURLOfInstalledApp:](v8, "setURLOfInstalledApp:", v6);
    -[IXRemoteInstallResult setPersistentIdentifier:](v9, "setPersistentIdentifier:", v7);
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v10[0] = @"DBUUID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbUUID](self, "dbUUID"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  v11[0] = v4;
  v10[1] = @"DBSequenceNumber";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult dbSequenceNumber](self, "dbSequenceNumber"));
  v11[1] = v5;
  v10[2] = @"InstallPath";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallResult URLOfInstalledApp](self, "URLOfInstalledApp"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  v11[2] = v7;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

- (NSUUID)dbUUID
{
  return self->_dbUUID;
}

- (void)setDbUUID:(id)a3
{
}

- (NSNumber)dbSequenceNumber
{
  return self->_dbSequenceNumber;
}

- (void)setDbSequenceNumber:(id)a3
{
}

- (NSURL)URLOfInstalledApp
{
  return self->_URLOfInstalledApp;
}

- (void)setURLOfInstalledApp:(id)a3
{
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end