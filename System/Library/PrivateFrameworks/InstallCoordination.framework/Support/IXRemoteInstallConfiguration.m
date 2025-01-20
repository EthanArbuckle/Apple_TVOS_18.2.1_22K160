@interface IXRemoteInstallConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)provisioningProfileInstallFailureIsFatal;
- (NSArray)provisioningProfileDatas;
- (NSData)geoJSONData;
- (NSData)iconData;
- (NSData)sinfData;
- (NSDictionary)storeMetadata;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)remoteInstallTargetBundleName;
- (NSString)targetLastPathComponent;
- (NSURL)deltaDirectoryURL;
- (NSURL)remoteInstallTargetDirectoryURL;
- (NSURL)remoteInstallTargetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForAppWithBundleID:(id)a3 localizedName:(id)a4 installMode:(unsigned __int8)a5;
- (unint64_t)deltaScheme;
- (unint64_t)hash;
- (unsigned)iconType;
- (unsigned)importance;
- (unsigned)installMode;
- (unsigned)installableType;
- (unsigned)pairedAutoInstallOverride;
- (unsigned)stashMode;
- (void)setBundleVersion:(id)a3;
- (void)setDeltaDirectoryURL:(id)a3;
- (void)setDeltaScheme:(unint64_t)a3;
- (void)setGeoJSONData:(id)a3;
- (void)setIconData:(id)a3 containingImageOfType:(unsigned __int8)a4;
- (void)setImportance:(unsigned __int8)a3;
- (void)setInstallableType:(unsigned __int8)a3;
- (void)setPairedAutoInstallOverride:(unsigned __int8)a3;
- (void)setProvisioningProfileDatas:(id)a3;
- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3;
- (void)setRemoteInstallTargetBundleName:(id)a3;
- (void)setRemoteInstallTargetDirectoryURL:(id)a3;
- (void)setRemoteInstallTargetURL:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setStashMode:(unsigned __int8)a3;
- (void)setStoreMetadata:(id)a3;
- (void)setTargetLastPathComponent:(id)a3;
@end

@implementation IXRemoteInstallConfiguration

- (id)initForAppWithBundleID:(id)a3 localizedName:(id)a4 installMode:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IXRemoteInstallConfiguration;
  v11 = -[IXRemoteInstallConfiguration init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleID, a3);
    objc_storeStrong((id *)&v12->_localizedName, a4);
    v12->_installMode = a5;
  }

  return v12;
}

- (void)setIconData:(id)a3 containingImageOfType:(unsigned __int8)a4
{
  v6 = (NSData *)[a3 copy];
  iconData = self->_iconData;
  self->_iconData = v6;

  self->_iconType = a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class(self) allocWithZone:a3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleID](self, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration localizedName](self, "localizedName"));
  id v8 = objc_msgSend( v5,  "initForAppWithBundleID:localizedName:installMode:",  v6,  v7,  -[IXRemoteInstallConfiguration installMode](self, "installMode"));

  objc_msgSend(v8, "setImportance:", -[IXRemoteInstallConfiguration importance](self, "importance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration iconData](self, "iconData"));
  objc_msgSend(v8, "setIconData:containingImageOfType:", v9, -[IXRemoteInstallConfiguration iconType](self, "iconType"));

  objc_msgSend(v8, "setStashMode:", -[IXRemoteInstallConfiguration stashMode](self, "stashMode"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration deltaDirectoryURL](self, "deltaDirectoryURL"));
  id v11 = [v10 copyWithZone:a3];
  [v8 setDeltaDirectoryURL:v11];

  objc_msgSend( v8,  "setPairedAutoInstallOverride:",  -[IXRemoteInstallConfiguration pairedAutoInstallOverride](self, "pairedAutoInstallOverride"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration storeMetadata](self, "storeMetadata"));
  id v13 = [v12 copyWithZone:a3];
  [v8 setStoreMetadata:v13];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration sinfData](self, "sinfData"));
  id v15 = [v14 copyWithZone:a3];
  [v8 setSinfData:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration provisioningProfileDatas](self, "provisioningProfileDatas"));
  id v17 = [v16 copyWithZone:a3];
  [v8 setProvisioningProfileDatas:v17];

  objc_msgSend( v8,  "setProvisioningProfileInstallFailureIsFatal:",  -[IXRemoteInstallConfiguration provisioningProfileInstallFailureIsFatal]( self,  "provisioningProfileInstallFailureIsFatal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetURL](self, "remoteInstallTargetURL"));
  id v19 = [v18 copyWithZone:a3];
  [v8 setRemoteInstallTargetURL:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue( -[IXRemoteInstallConfiguration remoteInstallTargetDirectoryURL]( self,  "remoteInstallTargetDirectoryURL"));
  id v21 = [v20 copyWithZone:a3];
  [v8 setRemoteInstallTargetDirectoryURL:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetBundleName](self, "remoteInstallTargetBundleName"));
  id v23 = [v22 copyWithZone:a3];
  [v8 setRemoteInstallTargetBundleName:v23];

  objc_msgSend(v8, "setInstallableType:", -[IXRemoteInstallConfiguration installableType](self, "installableType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration targetLastPathComponent](self, "targetLastPathComponent"));
  id v25 = [v24 copyWithZone:a3];
  [v8 setTargetLastPathComponent:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleVersion](self, "bundleVersion"));
  id v27 = [v26 copyWithZone:a3];
  [v8 setBundleVersion:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration geoJSONData](self, "geoJSONData"));
  id v29 = [v28 copyWithZone:a3];
  [v8 setGeoJSONData:v29];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IXRemoteInstallConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
    goto LABEL_13;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_13;
  }

  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleID](self, "bundleID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleID](v6, "bundleID"));
  id v9 = v7;
  id v10 = v8;
  id v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration localizedName](self, "localizedName"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration localizedName](v6, "localizedName"));
  id v9 = v12;
  id v14 = v13;
  id v11 = v14;
  if ((v9 != 0) != (v14 != 0) || v9 && v14 && ![v9 isEqual:v14])
  {
LABEL_8:

    BOOL v15 = 0;
  }

  else
  {

    unsigned int v17 = -[IXRemoteInstallConfiguration installMode](self, "installMode");
    if (v17 != -[IXRemoteInstallConfiguration installMode](v6, "installMode")) {
      goto LABEL_35;
    }
    unsigned int v18 = -[IXRemoteInstallConfiguration importance](self, "importance");
    if (v18 != -[IXRemoteInstallConfiguration importance](v6, "importance")) {
      goto LABEL_35;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration iconData](self, "iconData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration iconData](v6, "iconData"));
    BOOL v21 = sub_100009E7C(v19, v20);

    if (!v21) {
      goto LABEL_35;
    }
    unsigned int v22 = -[IXRemoteInstallConfiguration iconType](self, "iconType");
    if (v22 != -[IXRemoteInstallConfiguration iconType](v6, "iconType")) {
      goto LABEL_35;
    }
    unsigned int v23 = -[IXRemoteInstallConfiguration stashMode](self, "stashMode");
    if (v23 != -[IXRemoteInstallConfiguration stashMode](v6, "stashMode")) {
      goto LABEL_35;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration deltaDirectoryURL](self, "deltaDirectoryURL"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration deltaDirectoryURL](v6, "deltaDirectoryURL"));
    BOOL v26 = sub_100009E7C(v24, v25);

    if (!v26) {
      goto LABEL_35;
    }
    unsigned int v27 = -[IXRemoteInstallConfiguration pairedAutoInstallOverride](self, "pairedAutoInstallOverride");
    if (v27 != -[IXRemoteInstallConfiguration pairedAutoInstallOverride](v6, "pairedAutoInstallOverride")) {
      goto LABEL_35;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration storeMetadata](self, "storeMetadata"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration storeMetadata](v6, "storeMetadata"));
    BOOL v30 = sub_100009E7C(v28, v29);

    if (!v30) {
      goto LABEL_35;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration sinfData](self, "sinfData"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration sinfData](v6, "sinfData"));
    BOOL v33 = sub_100009E7C(v31, v32);

    if (!v33) {
      goto LABEL_35;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration provisioningProfileDatas](self, "provisioningProfileDatas"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration provisioningProfileDatas](v6, "provisioningProfileDatas"));
    BOOL v36 = sub_100009E7C(v34, v35);

    if (!v36) {
      goto LABEL_35;
    }
    unsigned int v37 = -[IXRemoteInstallConfiguration provisioningProfileInstallFailureIsFatal]( self,  "provisioningProfileInstallFailureIsFatal");
    if (v37 != -[IXRemoteInstallConfiguration provisioningProfileInstallFailureIsFatal]( v6,  "provisioningProfileInstallFailureIsFatal")) {
      goto LABEL_35;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetURL](self, "remoteInstallTargetURL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetURL](v6, "remoteInstallTargetURL"));
    BOOL v40 = sub_100009E7C(v38, v39);

    if (!v40) {
      goto LABEL_35;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue( -[IXRemoteInstallConfiguration remoteInstallTargetDirectoryURL]( self,  "remoteInstallTargetDirectoryURL"));
    v42 = (void *)objc_claimAutoreleasedReturnValue( -[IXRemoteInstallConfiguration remoteInstallTargetDirectoryURL]( v6,  "remoteInstallTargetDirectoryURL"));
    BOOL v43 = sub_100009E7C(v41, v42);

    if (!v43) {
      goto LABEL_35;
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetBundleName](self, "remoteInstallTargetBundleName"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetBundleName](v6, "remoteInstallTargetBundleName"));
    BOOL v46 = sub_100009E7C(v44, v45);

    if (!v46) {
      goto LABEL_35;
    }
    unsigned int v47 = -[IXRemoteInstallConfiguration installableType](self, "installableType");
    if (v47 != -[IXRemoteInstallConfiguration installableType](v6, "installableType")) {
      goto LABEL_35;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration targetLastPathComponent](self, "targetLastPathComponent"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration targetLastPathComponent](v6, "targetLastPathComponent"));
    BOOL v50 = sub_100009E7C(v48, v49);

    if (!v50
      || (v51 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleVersion](self, "bundleVersion")),
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleVersion](v6, "bundleVersion")),
          BOOL v53 = sub_100009E7C(v51, v52),
          v52,
          v51,
          !v53))
    {
LABEL_35:
      BOOL v15 = 0;
      goto LABEL_10;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration geoJSONData](self, "geoJSONData"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration geoJSONData](v6, "geoJSONData"));
    BOOL v15 = sub_100009E7C(v9, v11);
  }

LABEL_10:
LABEL_13:

  return v15;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleID](self, "bundleID"));
  unint64_t v4 = (unint64_t)[v3 hash];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration localizedName](self, "localizedName"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  unint64_t v7 = v6 ^ -[IXRemoteInstallConfiguration installMode](self, "installMode");
  uint64_t v8 = -[IXRemoteInstallConfiguration importance](self, "importance");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration iconData](self, "iconData"));
  unint64_t v10 = v7 ^ v8 ^ (unint64_t)[v9 hash];

  uint64_t v11 = -[IXRemoteInstallConfiguration iconType](self, "iconType");
  uint64_t v12 = v11 ^ -[IXRemoteInstallConfiguration stashMode](self, "stashMode");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration deltaDirectoryURL](self, "deltaDirectoryURL"));
  unint64_t v14 = v10 ^ v12 ^ (unint64_t)[v13 hash];

  uint64_t v15 = -[IXRemoteInstallConfiguration pairedAutoInstallOverride](self, "pairedAutoInstallOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration storeMetadata](self, "storeMetadata"));
  unint64_t v17 = v15 ^ (unint64_t)[v16 hash];

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration sinfData](self, "sinfData"));
  unint64_t v19 = v17 ^ (unint64_t)[v18 hash];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration provisioningProfileDatas](self, "provisioningProfileDatas"));
  unint64_t v21 = v14 ^ v19 ^ (unint64_t)[v20 hash];

  uint64_t v22 = -[IXRemoteInstallConfiguration provisioningProfileInstallFailureIsFatal]( self,  "provisioningProfileInstallFailureIsFatal");
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetURL](self, "remoteInstallTargetURL"));
  unint64_t v24 = v22 ^ (unint64_t)[v23 hash];

  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[IXRemoteInstallConfiguration remoteInstallTargetDirectoryURL]( self,  "remoteInstallTargetDirectoryURL"));
  unint64_t v26 = v24 ^ (unint64_t)[v25 hash];

  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration remoteInstallTargetBundleName](self, "remoteInstallTargetBundleName"));
  unint64_t v28 = v26 ^ (unint64_t)[v27 hash];

  unint64_t v29 = v21 ^ v28 ^ -[IXRemoteInstallConfiguration installableType](self, "installableType");
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration targetLastPathComponent](self, "targetLastPathComponent"));
  unint64_t v31 = (unint64_t)[v30 hash];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleVersion](self, "bundleVersion"));
  unint64_t v33 = v31 ^ (unint64_t)[v32 hash];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration geoJSONData](self, "geoJSONData"));
  unint64_t v35 = v29 ^ v33 ^ (unint64_t)[v34 hash];

  return v35;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration bundleID](self, "bundleID"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration localizedName](self, "localizedName"));
  unsigned int v8 = -[IXRemoteInstallConfiguration installMode](self, "installMode");
  unint64_t v9 = -[IXRemoteInstallConfiguration deltaScheme](self, "deltaScheme");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXRemoteInstallConfiguration deltaDirectoryURL](self, "deltaDirectoryURL"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ 0x%p: bundleID=%@ localizedName=%@ installMode=%hhu deltaScheme=%lu deltaDirectory=%@>",  v5,  self,  v6,  v7,  v8,  v9,  v11));

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (unsigned)installMode
{
  return self->_installMode;
}

- (unsigned)importance
{
  return self->_importance;
}

- (void)setImportance:(unsigned __int8)a3
{
  self->_importance = a3;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (unsigned)iconType
{
  return self->_iconType;
}

- (unsigned)stashMode
{
  return self->_stashMode;
}

- (void)setStashMode:(unsigned __int8)a3
{
  self->_stashMode = a3;
}

- (NSURL)deltaDirectoryURL
{
  return self->_deltaDirectoryURL;
}

- (void)setDeltaDirectoryURL:(id)a3
{
}

- (unint64_t)deltaScheme
{
  return self->_deltaScheme;
}

- (void)setDeltaScheme:(unint64_t)a3
{
  self->_deltaScheme = a3;
}

- (unsigned)pairedAutoInstallOverride
{
  return self->_pairedAutoInstallOverride;
}

- (void)setPairedAutoInstallOverride:(unsigned __int8)a3
{
  self->_pairedAutoInstallOverride = a3;
}

- (NSDictionary)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (NSArray)provisioningProfileDatas
{
  return self->_provisioningProfileDatas;
}

- (void)setProvisioningProfileDatas:(id)a3
{
}

- (BOOL)provisioningProfileInstallFailureIsFatal
{
  return self->_provisioningProfileInstallFailureIsFatal;
}

- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3
{
  self->_provisioningProfileInstallFailureIsFatal = a3;
}

- (NSURL)remoteInstallTargetURL
{
  return self->_remoteInstallTargetURL;
}

- (void)setRemoteInstallTargetURL:(id)a3
{
}

- (NSURL)remoteInstallTargetDirectoryURL
{
  return self->_remoteInstallTargetDirectoryURL;
}

- (void)setRemoteInstallTargetDirectoryURL:(id)a3
{
}

- (NSString)remoteInstallTargetBundleName
{
  return self->_remoteInstallTargetBundleName;
}

- (void)setRemoteInstallTargetBundleName:(id)a3
{
}

- (unsigned)installableType
{
  return self->_installableType;
}

- (void)setInstallableType:(unsigned __int8)a3
{
  self->_installableType = a3;
}

- (NSData)geoJSONData
{
  return self->_geoJSONData;
}

- (void)setGeoJSONData:(id)a3
{
}

- (NSString)targetLastPathComponent
{
  return self->_targetLastPathComponent;
}

- (void)setTargetLastPathComponent:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end