@interface UARPHeySiriModelCompact
+ (id)tag;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPHeySiriModelCompact)init;
- (id)generateAsset:(id *)a3;
- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
@end

@implementation UARPHeySiriModelCompact

- (UARPHeySiriModelCompact)init
{
  return 0LL;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelCompact;
  BOOL v4 = -[UARPHeySiriModelBase processDynamicAsset:](&v11, sel_processDynamicAsset_, a3);
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelCompact;
    -[UARPHeySiriModelBase setDelegate:](&v10, sel_setDelegate_, self);
    if ((-[UARPHeySiriModelBase engineType](self, "engineType") & 2) != 0)
    {
      v9.receiver = self;
      v5 = &selRef_checkCurrentJustSiriModel;
      v6 = &v9;
    }

    else
    {
      v8 = self;
      v5 = &selRef_checkCurrentHeySiriModel;
      v6 = (objc_super *)&v8;
    }

    v6->super_class = (Class)&OBJC_CLASS___UARPHeySiriModelCompact;
    objc_msgSendSuper2(v6, *v5, v8);
  }

  return v4;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[UARPHeySiriModelCompact tag](&OBJC_CLASS___UARPHeySiriModelCompact, "tag");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  0LL,  0LL,  0LL,  0LL);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelCompact;
  -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:]( &v13,  sel_offerDownloadModel_fallbackModel_tag_assetVersion_error_,  v10,  v9,  v11,  v12,  v8);
}

- (id)generateAsset:(id *)a3
{
  return 0LL;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructHeySiriModel();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

@end