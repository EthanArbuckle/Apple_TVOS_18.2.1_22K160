@interface CKAsset
+ (id)cplFingerPrintForSignature:(id)a3;
- (id)cplCopyCleanAsset;
- (id)cplFingerPrint;
@end

@implementation CKAsset

+ (id)cplFingerPrintForSignature:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue([a3 base64EncodedStringWithOptions:0]);
  }
  else {
    return 0LL;
  }
}

- (id)cplFingerPrint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset signature](self, "signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKAsset cplFingerPrintForSignature:](&OBJC_CLASS___CKAsset, "cplFingerPrintForSignature:", v2));

  return v3;
}

- (id)cplCopyCleanAsset
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset assetReference](self, "assetReference"));

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___CKAsset);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset assetReference](self, "assetReference"));
    id v7 = [v6 copy];
    v8 = -[CKAsset initWithAssetReference:](v5, "initWithAssetReference:", v7);
    goto LABEL_3;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset fileURL](self, "fileURL"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset signature](self, "signature"));

    v16 = objc_alloc(&OBJC_CLASS___CKAsset);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset fileURL](self, "fileURL"));
    if (!v15)
    {
      v9 = -[CKAsset initWithFileURL:](v16, "initWithFileURL:", v6);
      goto LABEL_4;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CKAsset signature](self, "signature"));
    v8 = -[CKAsset initWithFileURL:signature:](v16, "initWithFileURL:signature:", v6, v7);
LABEL_3:
    v9 = v8;

LABEL_4:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset itemTypeHint](self, "itemTypeHint"));
    -[CKAsset setItemTypeHint:](v9, "setItemTypeHint:", v10);
    goto LABEL_5;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset assetContent](self, "assetContent"));

  if (!v17) {
    sub_100195620((uint64_t)a2, (uint64_t)self);
  }
  v18 = objc_alloc(&OBJC_CLASS___CKAsset);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset assetContent](self, "assetContent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset itemTypeHint](self, "itemTypeHint"));
  v9 = -[CKAsset initWithAssetContent:itemTypeHint:](v18, "initWithAssetContent:itemTypeHint:", v10, v19);

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset assetTransferOptions](self, "assetTransferOptions"));
  -[CKAsset setAssetTransferOptions:](v9, "setAssetTransferOptions:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKAsset boundaryKey](self, "boundaryKey"));
  -[CKAsset setBoundaryKey:](v9, "setBoundaryKey:", v12);

  return v9;
}

@end