@interface GCControllerElement
+ (id)tvset_assetNameLookup;
- (id)tvset_assetName;
@end

@implementation GCControllerElement

+ (id)tvset_assetNameLookup
{
  if (qword_56930 != -1) {
    dispatch_once(&qword_56930, &stru_4D058);
  }
  return (id)qword_56938;
}

- (id)tvset_assetName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GCControllerElement tvset_assetNameLookup]( &OBJC_CLASS___GCControllerElement,  "tvset_assetNameLookup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCControllerElement primaryAlias](self, "primaryAlias"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCControllerElement primaryAlias](self, "primaryAlias"));
  }
  return v5;
}

@end