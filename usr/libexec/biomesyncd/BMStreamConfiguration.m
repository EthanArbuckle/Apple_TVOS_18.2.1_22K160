@interface BMStreamConfiguration
- (NSString)syncIdentifier;
- (id)syncIdentifierForTransport:(unint64_t)a3;
@end

@implementation BMStreamConfiguration

- (NSString)syncIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncPolicy](self, "syncPolicy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 legacyDescriptor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamUUID](self, "streamUUID"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  }

  return (NSString *)v7;
}

- (id)syncIdentifierForTransport:(unint64_t)a3
{
  if (a3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncPolicy](self, "syncPolicy"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyDescriptor]);
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamUUID](self, "streamUUID"));
      id v7 = (id)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    }
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncIdentifier](self, "syncIdentifier"));
  }

  return v7;
}

@end