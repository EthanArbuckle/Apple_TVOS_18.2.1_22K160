@interface PurchaseManifestItem
- (NSDictionary)manifestItemDictionary;
- (NSNumber)libraryPersistentIdentifier;
- (NSString)relativeArtworkPath;
- (NSString)relativeFeedAssetPath;
- (NSString)relativeMediaAssetPath;
- (NSString)relativeMetadataPath;
- (PurchaseManifestItem)init;
- (PurchaseManifestItem)initWithManifestItemDictionary:(id)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setLibraryPersistentIdentifier:(id)a3;
- (void)setRelativeArtworkPath:(id)a3;
- (void)setRelativeFeedAssetPath:(id)a3;
- (void)setRelativeMediaAssetPath:(id)a3;
- (void)setRelativeMetadataPath:(id)a3;
@end

@implementation PurchaseManifestItem

- (PurchaseManifestItem)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PurchaseManifestItem;
  v2 = -[PurchaseManifestItem init](&v4, "init");
  if (v2) {
    v2->_dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (PurchaseManifestItem)initWithManifestItemDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PurchaseManifestItem;
  objc_super v4 = -[PurchaseManifestItem init](&v6, "init");
  if (v4) {
    v4->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseManifestItem;
  -[PurchaseManifestItem dealloc](&v3, "dealloc");
}

- (NSNumber)libraryPersistentIdentifier
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  @"trackPersistentID");
}

- (NSString)relativeArtworkPath
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  @"relativeArtworkAssetPath");
}

- (NSString)relativeFeedAssetPath
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  @"relativeFeedAssetPath");
}

- (NSString)relativeMediaAssetPath
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  @"relativeMediaAssetPath");
}

- (NSString)relativeMetadataPath
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  @"relativeTrackPropertiesPath");
}

- (void)setLibraryPersistentIdentifier:(id)a3
{
}

- (void)setRelativeArtworkPath:(id)a3
{
}

- (void)setRelativeFeedAssetPath:(id)a3
{
}

- (void)setRelativeMediaAssetPath:(id)a3
{
}

- (void)setRelativeMetadataPath:(id)a3
{
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
  }
}

- (NSDictionary)manifestItemDictionary
{
  return &self->_dictionary->super;
}

@end