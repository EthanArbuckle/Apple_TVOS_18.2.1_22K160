@interface XBApplicationSnapshot
- (BOOL)pb_isTemplateImage;
- (id)_extendedDataValueForKey:(id)a3;
- (void)_setExtendedDataValue:(id)a3 forKey:(id)a4;
- (void)pb_setIsTemplateImage:(BOOL)a3;
@end

@implementation XBApplicationSnapshot

- (BOOL)pb_isTemplateImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[XBApplicationSnapshot _extendedDataValueForKey:]( self,  "_extendedDataValueForKey:",  @"PBApplicationSnapshotIsTemplateImageKey"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)pb_setIsTemplateImage:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[XBApplicationSnapshot _setExtendedDataValue:forKey:]( self,  "_setExtendedDataValue:forKey:",  v4,  @"PBApplicationSnapshotIsTemplateImageKey");
}

- (void)_setExtendedDataValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationSnapshot extendedData](self, "extendedData"));
  id v9 = [v8 mutableCopy];
  v10 = v9;
  if (v9) {
    v11 = (NSMutableDictionary *)v9;
  }
  else {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v12 = v11;

  -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v7, v6);
  -[XBApplicationSnapshot setExtendedData:](self, "setExtendedData:", v12);
}

- (id)_extendedDataValueForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationSnapshot extendedData](self, "extendedData"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:v4]);

  return v6;
}

@end