@interface StoreAsset
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation StoreAsset

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[StoreAsset init](+[StoreAsset allocWithZone:](&OBJC_CLASS___StoreAsset, "allocWithZone:"), "init");
  v5->_archiveType = self->_archiveType;
  v5->_assetType = self->_assetType;
  v6 = (NSDictionary *)-[NSDictionary copyWithZone:](self->_backgroundAssetMetadata, "copyWithZone:", a3);
  backgroundAssetMetadata = v5->_backgroundAssetMetadata;
  v5->_backgroundAssetMetadata = v6;

  v8 = (NSNumber *)-[NSNumber copyWithZone:](self->_bytesTotal, "copyWithZone:", a3);
  bytesTotal = v5->_bytesTotal;
  v5->_bytesTotal = v8;

  v10 = (NSArray *)-[NSArray copyWithZone:](self->_clearHashes, "copyWithZone:", a3);
  clearHashes = v5->_clearHashes;
  v5->_clearHashes = v10;

  v12 = (NSData *)-[NSData copyWithZone:](self->_dpInfo, "copyWithZone:", a3);
  dpInfo = v5->_dpInfo;
  v5->_dpInfo = v12;

  v14 = (NSNumber *)-[NSNumber copyWithZone:](self->_expectedDiskspace, "copyWithZone:", a3);
  expectedDiskspace = v5->_expectedDiskspace;
  v5->_expectedDiskspace = v14;

  v16 = (NSArray *)-[NSArray copyWithZone:](self->_hashes, "copyWithZone:", a3);
  hashes = v5->_hashes;
  v5->_hashes = v16;

  v18 = (NSNumber *)-[NSNumber copyWithZone:](self->_hashType, "copyWithZone:", a3);
  hashType = v5->_hashType;
  v5->_hashType = v18;

  v20 = (NSNumber *)-[NSNumber copyWithZone:](self->_initialODRSize, "copyWithZone:", a3);
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = v20;

  v5->_locallyCacheable = self->_locallyCacheable;
  v22 = (NSString *)-[NSString copyWithZone:](self->_md5, "copyWithZone:", a3);
  md5 = v5->_md5;
  v5->_md5 = v22;

  v24 = (NSNumber *)-[NSNumber copyWithZone:](self->_numberOfBytesToHash, "copyWithZone:", a3);
  numberOfBytesToHash = v5->_numberOfBytesToHash;
  v5->_numberOfBytesToHash = v24;

  v26 = (NSArray *)-[NSArray copyWithZone:](self->_priorVariantIdentifiers, "copyWithZone:", a3);
  priorVariantIdentifiers = v5->_priorVariantIdentifiers;
  v5->_priorVariantIdentifiers = v26;

  v28 = (NSNumber *)-[NSNumber copyWithZone:](self->_priorVersionEvid, "copyWithZone:", a3);
  priorVersionEvid = v5->_priorVersionEvid;
  v5->_priorVersionEvid = v28;

  v30 = (NSData *)-[NSData copyWithZone:](self->_sinf, "copyWithZone:", a3);
  sinf = v5->_sinf;
  v5->_sinf = v30;

  v32 = (NSString *)-[NSString copyWithZone:](self->_variantID, "copyWithZone:", a3);
  variantID = v5->_variantID;
  v5->_variantID = v32;

  v5->_zipStreamable = self->_zipStreamable;
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StoreAsset;
  id v3 = -[StoreAsset description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: {URL = %@; variant = %@; delta = %d}",
                   v4,
                   self->_assetURL,
                   self->_variantDescriptor,
                   self->_assetType == 3));

  return v5;
}

- (void).cxx_destruct
{
}

@end