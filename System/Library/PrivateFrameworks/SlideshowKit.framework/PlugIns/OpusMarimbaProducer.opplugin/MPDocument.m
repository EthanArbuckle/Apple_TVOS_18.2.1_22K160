@interface MPDocument
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)isNativeType:(id)a3;
+ (id)readableTypes;
+ (id)writableTypes;
+ (void)initialize;
- (BOOL)detectFacesInBackground;
- (BOOL)isAudioAtPath:(id)a3;
- (BOOL)isImageAtPath:(id)a3;
- (BOOL)isInBatchModify;
- (BOOL)isLive;
- (BOOL)isMovieAtPath:(id)a3;
- (BOOL)isSupportedMovieForAssetAtPath:(id)a3;
- (BOOL)layersCanPositionZIndex;
- (BOOL)nearingEndWithOptions:(id)a3;
- (BOOL)preserveMedia;
- (BOOL)savesPathsAsAbsolute;
- (CGColor)backgroundCGColor;
- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7;
- (CGImage)thumbnailCGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (CGPoint)latLongPointForMap:(id)a3 withAttributes:(id)a4;
- (CGPoint)pointForMap:(id)a3 withAttributes:(id)a4;
- (CGSize)resolutionForAssetAtPath:(id)a3;
- (CGSize)resolutionForPath:(id)a3;
- (MPDocument)init;
- (double)aspectRatio;
- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4;
- (double)duration;
- (double)durationForPath:(id)a3;
- (double)fadeInDuration;
- (double)fadeOutAudioDuration;
- (double)fadeOutDuration;
- (double)numberOfLoops;
- (double)posterTime;
- (double)startTimeForAssetAtPath:(id)a3;
- (double)startTimeForPath:(id)a3;
- (double)stopTimeForAssetAtPath:(id)a3;
- (double)stopTimeForPath:(id)a3;
- (double)videoDuration;
- (double)volumeForPath:(id)a3;
- (id)absolutePathForAssetAtPath:(id)a3;
- (id)absolutePathForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)absoluteVideoPaths;
- (id)actionableObjectForID:(id)a3;
- (id)allEffectContainers;
- (id)allEffects;
- (id)allElements;
- (id)allSlides;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)altitudeForPath:(id)a3;
- (id)areaForPath:(id)a3;
- (id)assetKeyDelegate;
- (id)attributeForAssetAtPath:(id)a3 forKey:(id)a4;
- (id)audioPaths;
- (id)audioPlaylist;
- (id)authoringOptionForKey:(id)a3;
- (id)avAssetForAssetAtPath:(id)a3;
- (id)cachedAbsolutePathFromPath:(id)a3;
- (id)cachedAbsoluteStillPathFromPath:(id)a3;
- (id)captionForPath:(id)a3;
- (id)cityForPath:(id)a3;
- (id)countryForPath:(id)a3;
- (id)creationDateForPath:(id)a3;
- (id)currentStyle;
- (id)dataForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)definedPlaceNameForPath:(id)a3;
- (id)description;
- (id)descriptionForRandomTransitionPresetID:(id)a3;
- (id)displayName;
- (id)documentAttributeForKey:(id)a3;
- (id)documentAttributes;
- (id)documentLayerGroup;
- (id)fileURL;
- (id)flightPlanFrom:(CGPoint)a3 to:(CGPoint)a4;
- (id)fullDebugLog;
- (id)keyedLayers;
- (id)keywordsForPath:(id)a3;
- (id)lastRandomTransition;
- (id)latitudeForPath:(id)a3;
- (id)layerForKey:(id)a3;
- (id)layers;
- (id)longitudeForPath:(id)a3;
- (id)mainLayers;
- (id)mediaProperties;
- (id)montage;
- (id)neighborhoodForPath:(id)a3;
- (id)objectInLayersAtIndex:(int64_t)a3;
- (id)oceanForPath:(id)a3;
- (id)orderedVideoPaths;
- (id)organizedRandomTransitions;
- (id)outroEffect;
- (id)placeForPath:(id)a3;
- (id)propertiesForMediaPath:(id)a3;
- (id)propertiesForMediaPathAndCreateIfNeeded:(id)a3 withValue:(id)a4 forKey:(id)a5;
- (id)regionsOfInterestForPath:(id)a3;
- (id)regionsOfInterestForPath:(id)a3 detect:(BOOL)a4;
- (id)stateForPath:(id)a3;
- (id)styleID;
- (id)tiledMapPathsForAttributes:(id)a3;
- (id)title;
- (id)titleEffect;
- (id)undoManager;
- (id)uuid;
- (id)valueInLayersWithName:(id)a3;
- (id)videoPaths;
- (int64_t)antialiasLevel;
- (int64_t)countOfLayers;
- (int64_t)mapLevelForPath:(id)a3;
- (int64_t)mediaTypeForPath:(id)a3;
- (unint64_t)applyStyle:(id)a3;
- (unint64_t)loopingMode;
- (void)addAudioPath:(id)a3;
- (void)addAudioPaths:(id)a3;
- (void)addLayer:(id)a3;
- (void)addLayers:(id)a3;
- (void)addVideoPath:(id)a3;
- (void)addVideoPaths:(id)a3;
- (void)beginBatchModify;
- (void)cleanup;
- (void)configureActions;
- (void)dealloc;
- (void)endBatchModify;
- (void)insertLayers:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4;
- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)organizeRandomTransitions;
- (void)reconnectAllTransitions;
- (void)removeAllAudioPaths;
- (void)removeAllLayers;
- (void)removeAllVideoPaths;
- (void)removeLayerForKey:(id)a3;
- (void)removeLayersAtIndices:(id)a3;
- (void)removeObjectFromLayersAtIndex:(int64_t)a3;
- (void)removePath:(id)a3;
- (void)removePaths:(id)a3;
- (void)removePropertiesForMediaPath:(id)a3;
- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAbsolutePath:(id)a3 forKey:(id)a4;
- (void)setAbsoluteStillPath:(id)a3 forKey:(id)a4;
- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3;
- (void)setAssetKeyDelegate:(id)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioPaths:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setAuthoringOption:(id)a3 forKey:(id)a4;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setDocumentAttribute:(id)a3 forKey:(id)a4;
- (void)setDocumentLayerGroup:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setFileURL:(id)a3;
- (void)setLastRandomTransition:(id)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
- (void)setLoopingMode:(unint64_t)a3;
- (void)setMediaProperties:(id)a3;
- (void)setMontage:(id)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setPreserveMedia:(BOOL)a3;
- (void)setProperties:(id)a3 forMediaPath:(id)a4;
- (void)setSavesPathsAsAbsolute:(BOOL)a3;
- (void)setStyleID:(id)a3;
- (void)setTemporarilyCacheAbsolutePaths:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setVideoPaths:(id)a3;
- (void)setupDocumentLayerGroup;
- (void)setupLayerGroups;
- (void)upgradeDocument;
@end

@implementation MPDocument

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MPDocument;
  objc_msgSendSuper2(&v3, "initialize");
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"layers"] ^ 1;
}

+ (id)writableTypes
{
  return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"mTGE");
}

+ (id)readableTypes
{
  return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"mTGE");
}

+ (BOOL)isNativeType:(id)a3
{
  return [a3 isEqualToString:@"mTGE"];
}

- (MPDocument)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MPDocument;
  v2 = -[MPDocument init](&v19, "init");
  if (v2)
  {
    v2->_documentAttributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_fileProperties = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_internal = objc_alloc_init(&OBJC_CLASS___MPDocumentInternal);
    -[MPDocumentInternal setPropertiesLock:]( v2->_internal,  "setPropertiesLock:",  objc_alloc_init(&OBJC_CLASS___NSRecursiveLock));
    -[NSRecursiveLock setName:]( -[MPDocumentInternal propertiesLock](v2->_internal, "propertiesLock"),  "setName:",  @"MPDocument.propertiesLock");
    -[MPDocumentInternal setAssetLogging:]( v2->_internal,  "setAssetLogging:",  -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"marimbaAssetLogging"));
    -[MPDocumentInternal setCachedAbsolutePaths:]( v2->_internal,  "setCachedAbsolutePaths:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MPDocumentInternal setCachedAbsoluteStillPaths:]( v2->_internal,  "setCachedAbsoluteStillPaths:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MPDocumentInternal setCachedPathLock:]( v2->_internal,  "setCachedPathLock:",  objc_alloc_init(&OBJC_CLASS___NSLock));
    -[NSLock setName:]( -[MPDocumentInternal cachedPathLock](v2->_internal, "cachedPathLock"),  "setName:",  @"MPDocument.cachedPathLock");
    -[MPDocumentInternal setBatchModifyCount:](v2->_internal, "setBatchModifyCount:", 0LL);
    -[MPDocumentInternal setIsInBatchModify:](v2->_internal, "setIsInBatchModify:", 0LL);
    -[MPDocumentInternal setNeedsActionConfigure:](v2->_internal, "setNeedsActionConfigure:", 0LL);
    -[MPDocumentInternal setUuid:]( v2->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    -[MPDocumentInternal setCacheAbsolutePathOverride:](v2->_internal, "setCacheAbsolutePathOverride:", 0LL);
    -[MPDocumentInternal setAlwaysLookupAbsolutePaths:](v2->_internal, "setAlwaysLookupAbsolutePaths:", 0LL);
    documentAttributes = v2->_documentAttributes;
    v4 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:]( documentAttributes,  "setObject:forKey:",  v4,  kMPDocumentEnforceSafeTiming[0]);
    v5 = v2->_documentAttributes;
    v6 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, kMPDocumentTimingMode[0]);
    v7 = v2->_documentAttributes;
    v8 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, kMPDocumentPreparedForExport[0]);
    v9 = v2->_documentAttributes;
    v10 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kMPDocumentSupportsRandomTransition[0]);
    v11 = v2->_documentAttributes;
    v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, kMPDocumentCacheAbsolutePaths[0]);
    v13 = v2->_documentAttributes;
    LODWORD(v14) = *(_DWORD *)"ffF@";
    v15 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14);
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, kMPDocumentVersion[0]);
    v2->_preserveMedia = 0;
    -[MPDocument setUndoManager:](v2, "setUndoManager:", 0LL);
    v2->_montage = 0LL;
    id v16 = -[MCMontage initFromScratch](objc_alloc(&OBJC_CLASS___MCMontage), "initFromScratch");
    v17 = v16;
    if (v16) {
      objc_msgSend(objc_msgSend(v16, "rootPlug"), "setLoopDuration:", 10000000.0);
    }
    -[MPDocument setMontage:](v2, "setMontage:", v17);

    v2->_layerGroups = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MPDocument setupDocumentLayerGroup](v2, "setupDocumentLayerGroup");
  }

  return v2;
}

- (id)description
{
  objc_super v3 = -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"============================= Document Description =============================\n"),  "stringByAppendingFormat:",  @"\t                   Style ID: %@\n",  -[MPDocument currentStyle](self, "currentStyle"));
  -[MPDocument duration](self, "duration");
  return -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                   Duration: %f\n",  v4);
}

- (void)dealloc
{
  self->_fileProperties = 0LL;
  -[NSRecursiveLock unlock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "unlock");

  self->_internal = 0LL;
  self->_layerGroups = 0LL;
  montage = self->_montage;
  if (montage)
  {

    self->_montage = 0LL;
  }

  self->_documentAttributes = 0LL;
  objc_storeWeak((id *)&self->_assetKeyDelegate, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPDocument;
  -[MPDocument dealloc](&v4, "dealloc");
}

- (id)displayName
{
  return @"My Slideshow";
}

- (id)currentStyle
{
  return -[MPLayerGroup styleID]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "styleID");
}

- (unint64_t)applyStyle:(id)a3
{
  objc_super v4 = -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup");
  v5 = v4;
  unint64_t v6 = -[MPLayerGroup setStyleID:](v4, "setStyleID:", a3);

  return v6;
}

- (id)documentAttributeForKey:(id)a3
{
  if ([a3 isEqualToString:kMPDocumentAuthoringOptions[0]]) {
    return -[MPLayerGroup authoringOptions]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "authoringOptions");
  }
  id result = -[NSMutableDictionary objectForKey:](self->_documentAttributes, "objectForKey:", a3);
  if (!result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)setDocumentAttribute:(id)a3 forKey:(id)a4
{
  if ([a4 isEqualToString:kMPDocumentAuthoringOptions[0]])
  {
    -[MPLayerGroup setAuthoringOptions:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setAuthoringOptions:",  a3);
  }

  else
  {
    documentAttributes = self->_documentAttributes;
    if (a3) {
      -[NSMutableDictionary setObject:forKey:](documentAttributes, "setObject:forKey:", a3, a4);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](documentAttributes, "removeObjectForKey:", a4);
    }
  }

- (BOOL)preserveMedia
{
  return self->_preserveMedia;
}

- (void)setPreserveMedia:(BOOL)a3
{
  self->_preserveMedia = a3;
}

- (id)mediaProperties
{
  return self->_fileProperties;
}

- (void)setMediaProperties:(id)a3
{
  fileProperties = self->_fileProperties;
  if (fileProperties) {

  }
  self->_fileProperties = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v10), "mutableCopy");
        -[NSMutableDictionary setObject:forKey:](self->_fileProperties, "setObject:forKey:", v11, v10);
      }

      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  -[NSRecursiveLock unlock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "unlock");
}

- (id)propertiesForMediaPath:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_fileProperties, "objectForKey:", a3);
  -[NSRecursiveLock unlock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "unlock");
  return v5;
}

- (void)setProperties:(id)a3 forMediaPath:(id)a4
{
  id v7 = [a3 mutableCopy];
  id v8 = [a3 objectForKey:kMPMetaDataRegionOfInterestRectangles];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      objc_super v19 = v7;
      id v12 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v13 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v10);
            }
            uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
            id v18 = [v10 objectForKey:v17];
            objc_msgSend( v12,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  kMPMetaDataRegionOfInterestID,  v18,  kMPMetaDataRegionOfInterestBounds,  0));
          }

          id v14 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v14);
      }

      id v7 = v19;
      [v19 setObject:v12 forKey:kMPMetaDataRegionOfInterestRectangles];
    }
  }

  -[NSRecursiveLock lock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "lock");
  -[NSMutableDictionary setObject:forKey:](self->_fileProperties, "setObject:forKey:", v7, a4);
  -[NSRecursiveLock unlock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "unlock");
  if (!-[MPDocument assetKeyDelegate](self, "assetKeyDelegate")) {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "cacheAttributes:forPath:",  v7,  a4);
  }
}

- (void)removePropertiesForMediaPath:(id)a3
{
}

- (id)authoringOptionForKey:(id)a3
{
  return -[MPLayerGroup authoringOptionForKey:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "authoringOptionForKey:",  a3);
}

- (void)setAuthoringOption:(id)a3 forKey:(id)a4
{
}

- (unint64_t)loopingMode
{
  return -[MPLayerGroup loopingMode]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "loopingMode");
}

- (void)setLoopingMode:(unint64_t)a3
{
}

- (double)numberOfLoops
{
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
}

- (id)assetKeyDelegate
{
  return objc_loadWeak((id *)&self->_assetKeyDelegate);
}

- (void)setAssetKeyDelegate:(id)a3
{
  if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate")) {
    objc_storeWeak((id *)&self->_assetKeyDelegate, 0LL);
  }
  if (a3)
  {
    objc_storeWeak((id *)&self->_assetKeyDelegate, a3);
    if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup")) {
      -[MPLayerGroup cachePaths]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "cachePaths");
    }
  }

- (BOOL)savesPathsAsAbsolute
{
  return -[MPDocumentInternal savesPathsAsAbsolute](self->_internal, "savesPathsAsAbsolute");
}

- (void)setSavesPathsAsAbsolute:(BOOL)a3
{
}

- (id)undoManager
{
  return -[MPDocumentInternal undoManager](self->_internal, "undoManager");
}

- (void)setUndoManager:(id)a3
{
}

- (id)fileURL
{
  return -[MPDocumentInternal fileURL](self->_internal, "fileURL");
}

- (void)setFileURL:(id)a3
{
}

- (void)beginBatchModify
{
  if (!-[MPDocumentInternal batchModifyCount](self->_internal, "batchModifyCount"))
  {
    -[MPDocumentInternal setIsInBatchModify:](self->_internal, "setIsInBatchModify:", 1LL);
    -[MCMontage lock](self->_montage, "lock");
  }

  -[MPDocumentInternal setBatchModifyCount:]( self->_internal,  "setBatchModifyCount:",  (char *)-[MPDocumentInternal batchModifyCount](self->_internal, "batchModifyCount") + 1);
}

- (void)endBatchModify
{
  if (!-[MPDocumentInternal batchModifyCount](self->_internal, "batchModifyCount"))
  {
    -[MPDocumentInternal setIsInBatchModify:](self->_internal, "setIsInBatchModify:", 0LL);
    -[MCMontage unlock](self->_montage, "unlock");
    if (-[MPDocumentInternal needsActionConfigure](self->_internal, "needsActionConfigure"))
    {
      -[MPDocument configureActions](self, "configureActions");
      -[MPDocumentInternal setNeedsActionConfigure:](self->_internal, "setNeedsActionConfigure:", 0LL);
    }
  }

- (id)allSlides
{
  return -[MPDocument allSlides:](self, "allSlides:", 0LL);
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup")) {
    return -[MPLayerGroup allSlides:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "allSlides:",  v3);
  }
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  layerGroups = self->_layerGroups;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(layerGroups);
        }
        objc_msgSend( v6,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layerGroups,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)i)),  "allSlides:",  v3));
      }

      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  return v6;
}

- (id)allElements
{
  id v3 = -[MPDocument documentLayerGroup](self, "documentLayerGroup");
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = objc_msgSend(objc_msgSend(v3, "layers"), "objectAtIndex:", 0);
  id v7 = objc_msgSend(objc_msgSend(v3, "layers"), "objectAtIndex:", 1);
  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v8 = [v6 effectContainers];
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(v13, "effects"), "lastObject"), "effectID"),  "isEqualToString:",  @"PinMap")) {
          [obj addObject:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v10);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    uint64_t v17 = 1LL;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)j), "effects"), "lastObject");
        NSRange v20 = NSRangeFromString((NSString *)[v19 effectAttributeForKey:@"pinRange"]);
        if (!v20.location) {
          objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(v19, "texts"), "objectAtIndex:", 0));
        }
        if ((uint64_t)v20.length >= 1)
        {
          uint64_t v21 = 1LL;
          do
          {
            objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(v19, "texts"), "objectAtIndex:", v21));
            id v22 = [v7 objectInEffectContainersAtIndex:v17];
            if ((uint64_t)[v22 countOfEffects] >= 1)
            {
              do
              {
                objc_msgSend( v4,  "addObjectsFromArray:",  objc_msgSend(objc_msgSend(objc_msgSend(v22, "effects"), "lastObject"), "slides"));
                id v22 = [v7 objectInEffectContainersAtIndex:++v17];
              }

              while ((uint64_t)[v22 countOfEffects] > 0);
            }

            ++v17;
          }

          while (v21++ != v20.length);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v15);
  }

  return v4;
}

- (id)documentAttributes
{
  return self->_documentAttributes;
}

- (void)cleanup
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = -[NSMutableDictionary allValues](self->_layerGroups, "allValues", 0LL);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) cleanup];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[MPDocument removeAllLayers](self, "removeAllLayers");
  -[MPDocument setAudioPlaylist:](self, "setAudioPlaylist:", 0LL);
  -[MCMontage demolish](self->_montage, "demolish");
}

- (double)fadeOutDuration
{
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
}

- (double)fadeInDuration
{
  return result;
}

- (void)setFadeInDuration:(double)a3
{
}

- (double)posterTime
{
  return result;
}

- (void)addVideoPath:(id)a3
{
}

- (void)addVideoPaths:(id)a3
{
}

- (void)addAudioPath:(id)a3
{
}

- (void)addAudioPaths:(id)a3
{
}

- (void)removePath:(id)a3
{
}

- (void)removePaths:(id)a3
{
}

- (id)videoPaths
{
  return -[MPLayerGroup videoPaths]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "videoPaths");
}

- (id)orderedVideoPaths
{
  return -[MPLayerGroup orderedVideoPaths]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "orderedVideoPaths");
}

- (void)setVideoPaths:(id)a3
{
}

- (id)audioPaths
{
  return -[MPLayerGroup audioPaths]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "audioPaths");
}

- (void)setAudioPaths:(id)a3
{
}

- (void)removeAllVideoPaths
{
}

- (void)removeAllAudioPaths
{
}

- (id)layers
{
  return -[MPLayerGroup layers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "layers");
}

- (void)addLayer:(id)a3
{
  id v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[MPDocument insertLayers:atIndex:]( self,  "insertLayers:atIndex:",  v4,  -[MPLayerGroup countOfLayers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "countOfLayers"));
}

- (void)addLayers:(id)a3
{
}

- (void)insertLayers:(id)a3 atIndex:(int64_t)a4
{
}

- (void)removeAllLayers
{
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"))
  {
    -[MPLayerGroup removeAllLayers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "removeAllLayers");
  }

  else
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v3 = -[NSMutableDictionary allKeys](self->_layerGroups, "allKeys", 0LL);
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[MPDocument removeLayerForKey:]( self,  "removeLayerForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }
  }

- (void)removeLayersAtIndices:(id)a3
{
}

- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4
{
}

- (id)layerForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_layerGroups, "objectForKey:", a3);
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  if (-[MPDocument layerForKey:](self, "layerForKey:", a4)) {
    -[MPDocument removeLayerForKey:](self, "removeLayerForKey:", a4);
  }
  id v7 = -[MCPlug container](-[MCMontage rootPlug](self->_montage, "rootPlug"), "container");
  [a3 setParent:self];
  +[MPUtilities createPlugInContainer:forLayer:key:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInContainer:forLayer:key:inDocument:",  v7,  a3,  a4,  self);
  if ((objc_opt_respondsToSelector(a3, "resetDuration") & 1) != 0) {
    [a3 resetDuration];
  }
  -[NSMutableDictionary setObject:forKey:](self->_layerGroups, "setObject:forKey:", a3, a4);
  -[MPDocument configureActions](self, "configureActions");
}

- (void)removeLayerForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_layerGroups, "objectForKey:");
  uint64_t v6 = -[MCPlug container](-[MCMontage rootPlug](self->_montage, "rootPlug"), "container");
  id v7 = [v5 plug];
  if (v7) {
    -[MCContainer removePlug:](v6, "removePlug:", v7);
  }
  [v5 setPlug:0];
  [v5 setContainer:0];
  [v5 setParent:0];
  -[NSMutableDictionary removeObjectForKey:](self->_layerGroups, "removeObjectForKey:", a3);
}

- (id)keyedLayers
{
  return self->_layerGroups;
}

- (CGColor)backgroundCGColor
{
  return -[MPLayerGroup backgroundCGColor]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "backgroundCGColor");
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
}

- (double)duration
{
  return result;
}

- (double)videoDuration
{
  return result;
}

- (id)audioPlaylist
{
  return -[MPLayerGroup audioPlaylist]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "audioPlaylist");
}

- (void)setAudioPlaylist:(id)a3
{
}

- (id)mainLayers
{
  return -[MPLayerGroup mainLayers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "mainLayers");
}

- (id)montage
{
  return self->_montage;
}

- (id)fullDebugLog
{
  return 0LL;
}

- (id)titleEffect
{
  id v3 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "titleEffectLayoutForStyleID:",  -[MPDocument styleID](self, "styleID"));
  id v4 = (const __CFString *)[v3 objectForKey:@"layer"];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"background";
  }
  __int128 v20 = 0uLL;
  __int128 v21 = 0uLL;
  id v6 = -[MPDocument layers](self, "layers", (void)v18);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_6:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v18 + 1) + 8 * v10);
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }

    if (v11) {
      goto LABEL_16;
    }
  }

- (id)outroEffect
{
  id v3 = objc_msgSend(-[MPDocument mainLayers](self, "mainLayers"), "lastObject");
  id v4 = objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  -[MPDocument styleID](self, "styleID")),  "objectForKey:",  @"layout"),  "objectForKey:",  objc_msgSend(v3, "layerID")),  "objectForKey:",  @"outroEffect");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(v3, "effectContainers"), "lastObject"), "effects", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)allEffectContainers
{
  return -[MPLayerGroup allEffectContainers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "allEffectContainers");
}

- (id)allEffects
{
  return -[MPLayerGroup allEffects]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "allEffects");
}

- (id)allSongs
{
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup")) {
    return -[MPLayerGroup allSongs]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "allSongs");
  }
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  layerGroups = self->_layerGroups;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(layerGroups);
        }
        objc_msgSend( v4,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layerGroups,  "objectForKey:",  *(void *)(*((void *)&v10 + 1) + 8 * (void)i)),  "allSongs"));
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  return v4;
}

- (int64_t)antialiasLevel
{
  return (int64_t)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "antialiasLevelForStyleID:",  -[MPDocument styleID](self, "styleID"));
}

- (void)reconnectAllTransitions
{
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup")) {
    layerGroups = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  @"docLayerGroup");
  }
  else {
    layerGroups = self->_layerGroups;
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(layerGroups);
        }
        objc_msgSend( -[NSMutableDictionary objectForKey:]( layerGroups,  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)v7)),  "reconnectAll");
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerGroups,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (id)uuid
{
  return -[MPDocumentInternal uuid](self->_internal, "uuid");
}

- (CGSize)resolutionForPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map"))
  {
    CGFloat width = 2048.0;
    CGFloat height = 2048.0;
  }

  else
  {
    id v7 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
    __int128 v8 = (NSString *)[v7 objectForKey:kMPMetaDataResolution];
    if (v8)
    {
      CGSize v9 = CGSizeFromString(v8);
      CGFloat width = v9.width;
      CGFloat height = v9.height;
    }

    else
    {
      if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate")
        && (objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "resolutionForAssetKey:") & 1) != 0)
      {
        objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "resolutionForAssetKey:", a3);
        CGFloat width = v11;
        CGFloat height = v10;
        if (v11 != CGSizeZero.width || v10 != CGSizeZero.height) {
          goto LABEL_16;
        }
      }

      objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "resolutionForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
      CGFloat width = v14;
      CGFloat height = v13;
      if (v14 != CGSizeZero.width || v13 != CGSizeZero.height)
      {
LABEL_16:
        v18.CGFloat width = width;
        v18.CGFloat height = height;
        -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  NSStringFromCGSize(v18),  kMPMetaDataResolution);
      }
    }
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (double)startTimeForPath:(id)a3
{
  double v5 = 0.0;
  if (!-[MPDocument isImageAtPath:](self, "isImageAtPath:"))
  {
    id v6 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
    id v7 = [v6 objectForKey:kMPMetaDataStartTime];
    if (v7)
    {
      [v7 doubleValue];
      return result;
    }

    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "startTimeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v10,  kMPMetaDataStartTime);
  }

  return v5;
}

- (double)stopTimeForPath:(id)a3
{
  double v5 = 0.0;
  if (!-[MPDocument isImageAtPath:](self, "isImageAtPath:"))
  {
    id v6 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
    id v7 = [v6 objectForKey:kMPMetaDataStopTime];
    if (v7)
    {
      [v7 doubleValue];
      return result;
    }

    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "stopTimeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v10,  kMPMetaDataStopTime);
  }

  return v5;
}

- (double)durationForPath:(id)a3
{
  double v5 = 0.0;
  if (!-[MPDocument isImageAtPath:](self, "isImageAtPath:"))
  {
    id v6 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
    id v7 = [v6 objectForKey:kMPMetaDataDuration];
    if (v7)
    {
      [v7 doubleValue];
      return result;
    }

    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "durationForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v10,  kMPMetaDataDuration);
  }

  return v5;
}

- (int64_t)mediaTypeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6) {
    return (int64_t)[v6 integerValue];
  }
  if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "attributeForKey:forAssetKey:withOptions:") & 1) != 0)
  {
    id v8 = -[MPDocument assetKeyDelegate](self, "assetKeyDelegate");
    id v6 = [v8 attributeForKey:kMPMetaDataMediaType forAssetKey:a3 withOptions:0];
    if (v6) {
      return (int64_t)[v6 integerValue];
    }
  }

  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:", a3)) {
    return 2LL;
  }
  if (-[MPDocument isMovieAtPath:](self, "isMovieAtPath:", a3)) {
    return 3LL;
  }
  return -[MPDocument isAudioAtPath:](self, "isAudioAtPath:", a3);
}

- (id)propertiesForMediaPathAndCreateIfNeeded:(id)a3 withValue:(id)a4 forKey:(id)a5
{
  id v9 = -[NSMutableDictionary objectForKey:](self->_fileProperties, "objectForKey:", a3);
  id v10 = v9;
  if (a3 && !v9)
  {
    id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    -[NSMutableDictionary setObject:forKey:](self->_fileProperties, "setObject:forKey:", v10, a3);
  }

  [v10 setObject:a4 forKey:a5];
  -[NSRecursiveLock unlock](-[MPDocumentInternal propertiesLock](self->_internal, "propertiesLock"), "unlock");
  return v10;
}

- (void)setDocumentLayerGroup:(id)a3
{
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"))
  {
    -[MPLayerGroup cleanup](-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"), "cleanup");
    -[MPLayerGroup setContainer:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setContainer:",  0LL);
    -[MPLayerGroup setPlug:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setPlug:",  0LL);
    -[MPLayerGroup setParent:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setParent:",  0LL);
    -[MPDocumentInternal setDocumentLayerGroup:](self->_internal, "setDocumentLayerGroup:", 0LL);
  }

  if (a3)
  {
    id v5 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layerGroups, "allKeys"), "copy");
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[MPDocument removeLayerForKey:]( self,  "removeLayerForKey:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }

    -[MPDocumentInternal setDocumentLayerGroup:](self->_internal, "setDocumentLayerGroup:", a3);
    -[MPLayerGroup setIsDocumentLayerGroup:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setIsDocumentLayerGroup:",  1LL);
    -[MPLayerGroup setParent:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setParent:",  self);
    -[MPLayerGroup setContainer:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setContainer:",  -[MCPlug container](-[MCMontage rootPlug](self->_montage, "rootPlug"), "container"));
    -[MPLayerGroup setPlug:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setPlug:",  -[MCMontage rootPlug](self->_montage, "rootPlug"));
  }

- (void)setupDocumentLayerGroup
{
  if (!-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"))
  {
    id v3 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layerGroups, "allKeys"), "copy");
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[MPDocument removeLayerForKey:]( self,  "removeLayerForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    -[MPDocumentInternal setDocumentLayerGroup:]( self->_internal,  "setDocumentLayerGroup:",  objc_alloc_init(&OBJC_CLASS___MPLayerGroup));
    -[MPLayerGroup setIsDocumentLayerGroup:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setIsDocumentLayerGroup:",  1LL);
    -[MPLayerGroup setParent:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setParent:",  self);
    -[MPLayerGroup setContainer:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setContainer:",  -[MCPlug container](-[MCMontage rootPlug](self->_montage, "rootPlug"), "container"));
    -[MPLayerGroup setPlug:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setPlug:",  -[MCMontage rootPlug](self->_montage, "rootPlug"));
  }

- (void)setupLayerGroups
{
  if (-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"))
  {
    -[MPLayerGroup cleanup](-[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"), "cleanup");
    -[MPLayerGroup setContainer:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setContainer:",  0LL);
    -[MPLayerGroup setPlug:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setPlug:",  0LL);
    -[MPLayerGroup setParent:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "setParent:",  0LL);
    -[MPDocumentInternal setDocumentLayerGroup:](self->_internal, "setDocumentLayerGroup:", 0LL);
    -[MCPlug setLoopDuration:](-[MCMontage rootPlug](self->_montage, "rootPlug"), "setLoopDuration:", 10000000.0);
  }

- (id)actionableObjectForID:(id)a3
{
  if (!-[MPDocumentInternal cachedActionableLayers](self->_internal, "cachedActionableLayers")
    || (id v5 = -[NSMutableDictionary objectForKey:]( -[MPDocumentInternal cachedActionableLayers](self->_internal, "cachedActionableLayers"),  "objectForKey:",  a3)) == 0LL)
  {
    uint64_t v6 = objc_autoreleasePoolPush();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = -[NSMutableDictionary allValues](self->_layerGroups, "allValues", 0LL);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        __int128 v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) actionableObjectForID:a3];
          if (v12)
          {
            id v5 = v12;
            goto LABEL_13;
          }

          __int128 v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v5 = 0LL;
LABEL_13:
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)documentLayerGroup
{
  return -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup");
}

- (void)upgradeDocument
{
  if (v3 < 3.1)
  {
    float v4 = v3;
    if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"))
    {
      if (v4 == 1.0)
      {
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v5 = -[MPLayerGroup layers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup", 0LL),  "layers");
        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6)
        {
          id v8 = v6;
          uint64_t v9 = *(void *)v18;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v5);
              }
              __int128 v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v10);
              uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v7);
              if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
              {
                id v13 = [v11 effectContainers];
                if ([v13 count] == (char *)&dword_0 + 1)
                {
                  id v14 = [v13 lastObject];
                  if ([v14 transition]) {
                    [v14 setTransition:0];
                  }
                }
              }

              uint64_t v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }

          while (v8);
        }
      }

      objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "upgradeDocument:withOptions:",  self,  0);
      LODWORD(v15) = *(_DWORD *)"ffF@";
      __int128 v16 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15);
      -[MPDocument setDocumentAttribute:forKey:](self, "setDocumentAttribute:forKey:", v16, kMPDocumentVersion[0]);
    }
  }

- (void)setMontage:(id)a3
{
  montage = self->_montage;
  if (montage) {

  }
  self->_montage = (MCMontage *)a3;
}

- (id)absoluteVideoPaths
{
  return -[MPLayerGroup absoluteVideoPaths]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "absoluteVideoPaths");
}

- (double)volumeForPath:(id)a3
{
  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:")) {
    return 1.0;
  }
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  id v6 = [v5 objectForKey:kMPMetaDataVolume];
  if (!v6) {
    return 1.0;
  }
  [v6 doubleValue];
  return result;
}

- (BOOL)isImageAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    uint64_t v7 = (char *)[v6 integerValue];
  }

  else
  {
    uint64_t v7 = (char *)objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "mediaTypeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    id v8 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7);
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v8,  kMPMetaDataMediaType);
  }

  return v7 == (_BYTE *)&dword_0 + 2;
}

- (BOOL)isMovieAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    uint64_t v7 = (char *)[v6 integerValue];
  }

  else
  {
    uint64_t v7 = (char *)objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "mediaTypeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    id v8 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7);
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v8,  kMPMetaDataMediaType);
  }

  return v7 == (_BYTE *)&dword_0 + 3;
}

- (BOOL)isAudioAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    uint64_t v7 = (char *)[v6 integerValue];
  }

  else
  {
    uint64_t v7 = (char *)objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "mediaTypeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    id v8 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7);
    -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v8,  kMPMetaDataMediaType);
  }

  return v7 == (_BYTE *)&dword_0 + 1;
}

- (id)regionsOfInterestForPath:(id)a3
{
  return -[MPDocument regionsOfInterestForPath:detect:](self, "regionsOfInterestForPath:detect:", a3, 0LL);
}

- (id)regionsOfInterestForPath:(id)a3 detect:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:"))
  {
    if (!v4) {
      return 0LL;
    }
    goto LABEL_17;
  }

  id v7 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  id v8 = [v7 objectForKey:kMPMetaDataRegionOfInterestRectangles];
  if (!v8)
  {
    id v13 = 0LL;
    goto LABEL_16;
  }

  uint64_t v9 = v8;
  id v10 = [v8 lastObject];
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0) {
    return v9;
  }
  id v13 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( v13,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  *(void *)(*((void *)&v23 + 1) + 8 * (void)i),  kMPMetaDataRegionOfInterestBounds,  0));
      }

      id v15 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v15);
  }

  -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v13,  kMPMetaDataRegionOfInterestRectangles);
  if (!v13)
  {
LABEL_16:
    if (!v4) {
      return v13;
    }
LABEL_17:
    id v18 = -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3);
    if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "detectRegionsOfInterestForAssetKey:") & 1) != 0)
    {
      id v19 = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "detectRegionsOfInterestForAssetKey:",  a3);
    }

    else if (+[MPUtilities pathIsRelative:](&OBJC_CLASS___MPUtilities, "pathIsRelative:", v18))
    {
      char v22 = 0;
      id v19 = objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "regionsOfInterestForAsset:",  -[MPDocument CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:]( self,  "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:",  a3,  &v22,  1,  0,  256.0,  256.0));
    }

    else
    {
      id v19 = objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "regionsOfInterestForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    }

    id v13 = v19;
    if (v19)
    {
      -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v19,  kMPMetaDataRegionOfInterestRectangles);
    }

    else
    {
      __int128 v20 = +[NSArray array](&OBJC_CLASS___NSArray, "array");
      -[MPDocument propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:]( self,  "propertiesForMediaPathAndCreateIfNeeded:withValue:forKey:",  a3,  v20,  kMPMetaDataRegionOfInterestRectangles);
      return +[NSArray array](&OBJC_CLASS___NSArray, "array");
    }
  }

  return v13;
}

- (id)creationDateForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataCreationDate];
  if (!result) {
    return objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "creationDateForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
  }
  return result;
}

- (id)keywordsForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataKeywords];
  if (!result) {
    return objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "keywordsForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
  }
  return result;
}

- (id)captionForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataCaption];
}

- (id)latitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataLatitude];
  if (!result)
  {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "latitudeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  }

  return result;
}

- (id)longitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataLongitude];
  if (!result)
  {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "longitudeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  }

  return result;
}

- (id)countryForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataCountry];
}

- (id)oceanForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataOcean];
}

- (id)stateForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataStateOrProvince];
}

- (id)cityForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataCity];
}

- (id)placeForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataPlace];
}

- (id)areaForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataArea];
}

- (id)neighborhoodForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataNeighborhood];
}

- (id)definedPlaceNameForPath:(id)a3
{
  id v3 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  return [v3 objectForKey:kMPMetaDataDefinedPlaceName];
}

- (id)altitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataAltitude];
  if (!result)
  {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "altitudeForAssetAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  }

  return result;
}

- (id)tiledMapPathsForAttributes:(id)a3
{
  if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "relativeTiledPathsForAssetWithAttributes:") & 1) == 0 || (id result = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "relativeTiledPathsForAssetWithAttributes:",  a3)) == 0)
  {
    id v6 = [a3 objectForKey:kMPAssetMapInset[0]];
    if (v6)
    {
      [v6 CGSizeValue];
      double v8 = v7;
      double v10 = v9;
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
    }

    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      double v8 = CGSizeZero.width;
      double v10 = height;
    }

    id v13 = [a3 objectForKey:kMPAssetMapLatLongPoints[0]];
    id v14 = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "mapTileCenteredAt:size:inset:",  v13,  4096.0,  4096.0,  width,  height);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) CGPointValue];
          objc_msgSend(v14, "pointForLatLongCoordinates:");
          BOOL v21 = v20 < v8;
          if (v20 > 4096.0 - v8) {
            BOOL v21 = 1;
          }
          if (v19 < v10) {
            BOOL v21 = 1;
          }
          int v22 = v19 > 4096.0 - v10 || v21;
          if ((v22 & 1) != 0) {
            goto LABEL_22;
          }
        }

        id v16 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      if (v22) {
LABEL_22:
      }
        id v14 = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "mapTileCenteredAt:size:inset:",  v13,  4096.0,  4096.0,  v8,  v10);
    }

    return [v14 mapGridWithRows:2 columns:2];
  }

  return result;
}

- (CGPoint)latLongPointForMap:(id)a3 withAttributes:(id)a4
{
  if (a3
    && (double v8 = v6,
        double v9 = v7,
        (objc_opt_respondsToSelector(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:") & 1) != 0))
  {
    objc_msgSend( objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:", a3),  "latLongCoordinatesForPoint:",  v8,  v9);
  }

  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }

  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pointForMap:(id)a3 withAttributes:(id)a4
{
  if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "attributeForKey:forAssetKey:withOptions:") & 1) == 0)
  {
    objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAssetOptionMapLatLong[0]), "CGPointValue");
    double v12 = v11;
    double v14 = v13;
    if (a3
      && (objc_opt_respondsToSelector(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:") & 1) != 0)
    {
      id v15 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:", a3);
    }

    else
    {
      if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "mapTileCenteredAt:size:inset:") & 1) == 0) {
        goto LABEL_30;
      }
      id v16 = [a4 objectForKey:kMPAssetMapLatLongPoints[0]];
      id v17 = -[MPDocument assetKeyDelegate](self, "assetKeyDelegate");
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      id v20 = objc_msgSend(v17, "mapTileCenteredAt:size:inset:", v16, 4096.0, 4096.0, CGSizeZero.width, height);
      if (!v20) {
        goto LABEL_30;
      }
      id v21 = v20;
      id v22 = [a4 objectForKey:kMPAssetMapInset[0]];
      if (v22)
      {
        [v22 CGSizeValue];
        double width = v23;
        double height = v24;
      }

      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v25 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v34;
        while (2)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v34 != v27) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v33 + 1) + 8 * (void)i) CGPointValue];
            objc_msgSend(v21, "pointForLatLongCoordinates:");
            BOOL v31 = v30 < width;
            if (v30 > 4096.0 - width) {
              BOOL v31 = 1;
            }
            if (v29 < height) {
              BOOL v31 = 1;
            }
            int v32 = v29 > 4096.0 - height || v31;
            if ((v32 & 1) != 0) {
              goto LABEL_27;
            }
          }

          id v26 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v26) {
            continue;
          }
          break;
        }

        if (v32) {
LABEL_27:
        }
          id v21 = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "mapTileCenteredAt:size:inset:",  v16,  4096.0,  4096.0,  width,  height);
      }

      id v15 = v21;
    }

    objc_msgSend(v15, "pointForLatLongCoordinates:", v12, v14);
    goto LABEL_31;
  }

  id v7 = -[MPDocument assetKeyDelegate](self, "assetKeyDelegate");
  id v8 = [v7 attributeForKey:kMPAssetAttributeMapPoint[0] forAssetKey:a3 withOptions:a4];
  if (!v8)
  {
LABEL_30:
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    goto LABEL_31;
  }

  [v8 CGPointValue];
LABEL_31:
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)mapLevelForPath:(id)a3
{
  if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "attributeForKey:forAssetKey:withOptions:") & 1) == 0) {
    return 0LL;
  }
  id v5 = -[MPDocument assetKeyDelegate](self, "assetKeyDelegate");
  return (int64_t)objc_msgSend( objc_msgSend( v5,  "attributeForKey:forAssetKey:withOptions:",  kMPAssetAttributeMapLevel[0],  a3,  0),  "integerValue");
}

- (id)flightPlanFrom:(CGPoint)a3 to:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if ((objc_opt_respondsToSelector(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "flightPlanFrom:to:") & 1) != 0) {
    return objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "flightPlanFrom:to:", v7, v6, x, y);
  }
  else {
    return 0LL;
  }
}

- (id)descriptionForRandomTransitionPresetID:(id)a3
{
  return -[MPDocument organizedRandomTransitions](self, "organizedRandomTransitions", a3);
}

- (id)lastRandomTransition
{
  return -[MPDocumentInternal lastRandomTransition](self->_internal, "lastRandomTransition");
}

- (void)setLastRandomTransition:(id)a3
{
}

- (double)fadeOutAudioDuration
{
  return result;
}

- (void)setAudioFadeOutDuration:(double)a3
{
}

- (void)organizeRandomTransitions
{
  id v3 = -[MPDocument documentAttributeForKey:](self, "documentAttributeForKey:", kMPDocumentRandomTransitionList[0]);
  BOOL v4 = -[MPDocumentInternal orderedRandomTransitions](self->_internal, "orderedRandomTransitions");
  id obj = v3;
  if (v3)
  {
    if (!v4) {
      -[MPDocumentInternal setOrderedRandomTransitions:]( self->_internal,  "setOrderedRandomTransitions:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    double v29 = self;
    -[NSMutableDictionary removeAllObjects]( -[MPDocumentInternal orderedRandomTransitions](self->_internal, "orderedRandomTransitions"),  "removeAllObjects");
    id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v6 = [v3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)i) componentsSeparatedByString:@"/"];
          if ([v10 count]) {
            double v11 = (const __CFString *)[v10 objectAtIndex:0];
          }
          else {
            double v11 = 0LL;
          }
          double v12 = @"Default";
          if (v11) {
            double v13 = v11;
          }
          else {
            double v13 = @"Dissolve";
          }
          id v14 = [v5 objectForKey:v13];
          if (v14)
          {
            [v14 addObject:v12];
          }

          else
          {
            id v15 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v12,  0LL);
            [v5 setObject:v15 forKey:v13];
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v7);
    }

    id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v17 = [v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v39;
      uint64_t v30 = *(void *)v39;
      id v31 = v5;
      do
      {
        id v20 = 0LL;
        id obja = v18;
        do
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v5);
          }
          uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)v20);
          id v22 = [v5 objectForKey:v21];
          if ([v22 count] == (char *)&dword_0 + 1)
          {
            double v23 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@",  v21,  [v22 lastObject]);
          }

          else
          {
            double v23 = (NSString *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            id v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
            if (v24)
            {
              id v25 = v24;
              id v26 = v16;
              uint64_t v27 = *(void *)v35;
              do
              {
                for (j = 0LL; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v35 != v27) {
                    objc_enumerationMutation(v22);
                  }
                  -[NSString addObject:]( v23,  "addObject:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v21,  *(void *)(*((void *)&v34 + 1) + 8LL * (void)j)));
                }

                id v25 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
              }

              while (v25);
              id v16 = v26;
              uint64_t v19 = v30;
              id v5 = v31;
            }

            id v18 = obja;
          }

          [v16 addObject:v23];
          id v20 = (char *)v20 + 1;
        }

        while (v20 != v18);
        id v18 = [v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }

      while (v18);
    }

    -[NSMutableDictionary setObject:forKey:]( -[MPDocumentInternal orderedRandomTransitions](v29->_internal, "orderedRandomTransitions"),  "setObject:forKey:",  v16,  @"transitionPresetIDs");
  }

  else if (v4)
  {
    -[MPDocumentInternal setOrderedRandomTransitions:](self->_internal, "setOrderedRandomTransitions:", 0LL);
  }

- (id)organizedRandomTransitions
{
  return -[MPDocumentInternal orderedRandomTransitions](self->_internal, "orderedRandomTransitions");
}

- (BOOL)nearingEndWithOptions:(id)a3
{
  return 1;
}

- (double)aspectRatio
{
  v2 = -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup");
  id v3 = -[MPLayerGroup authoringOptionForKey:](v2, "authoringOptionForKey:", kMPAuthoringAspectRatio);
  if (!v3) {
    return 1.77777779;
  }
  [v3 floatValue];
  return v4;
}

- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4
{
  return result;
}

- (BOOL)detectFacesInBackground
{
  return -[MPLayerGroup detectFacesInBackground]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "detectFacesInBackground");
}

- (BOOL)isLive
{
  id v2 = -[MPDocument authoringOptionForKey:](self, "authoringOptionForKey:", kMPAuthoringLive);
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (id)cachedAbsolutePathFromPath:(id)a3
{
  id v5 =   -[NSMutableDictionary objectForKey:]( -[MPDocumentInternal cachedAbsolutePaths](self->_internal, "cachedAbsolutePaths"),  "objectForKey:",  a3);
  -[NSLock unlock](-[MPDocumentInternal cachedPathLock](self->_internal, "cachedPathLock"), "unlock");
  return v5;
}

- (void)setAbsolutePath:(id)a3 forKey:(id)a4
{
  id v7 = -[MPDocumentInternal cachedAbsolutePaths](self->_internal, "cachedAbsolutePaths");
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [a3 copy], a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", a4);
  }
  -[NSLock unlock](-[MPDocumentInternal cachedPathLock](self->_internal, "cachedPathLock"), "unlock");
}

- (id)cachedAbsoluteStillPathFromPath:(id)a3
{
  id v5 =   -[NSMutableDictionary objectForKey:]( -[MPDocumentInternal cachedAbsoluteStillPaths](self->_internal, "cachedAbsoluteStillPaths"),  "objectForKey:",  a3);
  -[NSLock unlock](-[MPDocumentInternal cachedPathLock](self->_internal, "cachedPathLock"), "unlock");
  return v5;
}

- (void)setAbsoluteStillPath:(id)a3 forKey:(id)a4
{
  id v7 = -[MPDocumentInternal cachedAbsoluteStillPaths](self->_internal, "cachedAbsoluteStillPaths");
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [a3 copy], a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", a4);
  }
  -[NSLock unlock](-[MPDocumentInternal cachedPathLock](self->_internal, "cachedPathLock"), "unlock");
}

- (void)setTemporarilyCacheAbsolutePaths:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_documentAttributes,  "objectForKey:",  kMPDocumentCacheAbsolutePaths[0]),  "BOOLValue") & 1) == 0) {
    -[MPDocumentInternal setCacheAbsolutePathOverride:](self->_internal, "setCacheAbsolutePathOverride:", v3);
  }
}

- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3
{
}

- (BOOL)layersCanPositionZIndex
{
  return 0;
}

- (void)configureActions
{
  if (-[MPDocumentInternal isInBatchModify](self->_internal, "isInBatchModify"))
  {
    -[MPDocumentInternal setNeedsActionConfigure:](self->_internal, "setNeedsActionConfigure:", 1LL);
  }

  else
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v3 = -[NSMutableDictionary allValues](self->_layerGroups, "allValues", 0LL);
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) configureActions];
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }
  }

- (BOOL)isInBatchModify
{
  return -[MPDocumentInternal isInBatchModify](self->_internal, "isInBatchModify");
}

- (int64_t)countOfLayers
{
  return -[MPLayerGroup countOfLayers]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "countOfLayers");
}

- (id)objectInLayersAtIndex:(int64_t)a3
{
  return -[MPLayerGroup objectInLayersAtIndex:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "objectInLayersAtIndex:",  a3);
}

- (id)valueInLayersWithName:(id)a3
{
  return -[MPLayerGroup valueInLayersWithName:]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "valueInLayersWithName:",  a3);
}

- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromLayersAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (id)title
{
  return -[MPDocument documentAttributeForKey:](self, "documentAttributeForKey:", kMPDocumentNameAttribute[0]);
}

- (void)setTitle:(id)a3
{
}

- (id)styleID
{
  return -[MPLayerGroup styleID]( -[MPDocumentInternal documentLayerGroup](self->_internal, "documentLayerGroup"),  "styleID");
}

- (void)setStyleID:(id)a3
{
}

- (id)absolutePathForAssetAtPath:(id)a3
{
  if (!-[MPDocumentInternal alwaysLookupAbsolutePaths](self->_internal, "alwaysLookupAbsolutePaths")
    && !+[MPUtilities pathIsRelative:](&OBJC_CLASS___MPUtilities, "pathIsRelative:", a3))
  {
    return a3;
  }

  if (NSStringHasPrefix(a3, "mtg"))
  {
    id v5 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"media/%@",  [a3 substringFromIndex:6]);
    id v6 = objc_msgSend(objc_msgSend(-[MPDocument fileURL](self, "fileURL"), "path"), "stringByDeletingLastPathComponent");
    id v7 = [v6 stringByAppendingPathComponent:v5];
    __int128 v8 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"2048",  @"1024",  @"768",  @"512",  @"384",  @"256",  0LL);
    if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v7)
      && -[NSArray count](v8, "count"))
    {
      unint64_t v9 = 0LL;
      do
      {
        id v7 = [v6 stringByAppendingPathComponent:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"media/%d-%@", objc_msgSend(-[NSArray objectAtIndex:](v8, "objectAtIndex:", v9), "intValue"), objc_msgSend(a3, "substringFromIndex:", 6))];
        if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v7))
        {
          break;
        }

        ++v9;
      }

      while (v9 < -[NSArray count](v8, "count"));
    }

    return v7;
  }

  if (-[MPDocumentInternal cacheAbsolutePathOverride](self->_internal, "cacheAbsolutePathOverride")
    || objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_documentAttributes,  "objectForKey:",  kMPDocumentCacheAbsolutePaths[0]),  "BOOLValue"))
  {
    id v7 = -[MPDocument cachedAbsolutePathFromPath:](self, "cachedAbsolutePathFromPath:", a3);
    if (v7) {
      return v7;
    }
  }

  if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"))
  {
    id v10 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "absolutePathForAssetKey:", a3);
    if (v10)
    {
      id v7 = v10;
      -[MPDocument setAbsolutePath:forKey:](self, "setAbsolutePath:forKey:", v10, a3);
      return v7;
    }
  }

  return objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "absolutePathFromPath:",  a3);
}

- (id)absolutePathForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (!-[MPDocumentInternal alwaysLookupAbsolutePaths](self->_internal, "alwaysLookupAbsolutePaths")
    && !+[MPUtilities pathIsRelative:](&OBJC_CLASS___MPUtilities, "pathIsRelative:", a3))
  {
    return a3;
  }

  if (NSStringHasPrefix(a3, "mtg"))
  {
    __int128 v8 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"256",  @"384",  @"512",  @"768",  @"1024",  @"2048",  0LL);
    id v9 = objc_msgSend(objc_msgSend(-[MPDocument fileURL](self, "fileURL"), "path"), "stringByDeletingLastPathComponent");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
LABEL_6:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v13) integerValue];
        if (width < (double)(uint64_t)v14)
        {
          id v15 = [v9 stringByAppendingPathComponent:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"media/%d-%@", v14, objc_msgSend(a3, "substringFromIndex:", 6))];
          if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v15))
          {
            break;
          }
        }

        if (v11 == (id)++v13)
        {
          id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_20;
        }
      }

      if (v15) {
        return v15;
      }
    }

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = -[MPDocument cachedAbsoluteStillPathFromPath:](self, "cachedAbsoluteStillPathFromPath:");
  if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"))
  {
    id v8 = objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "absolutePathForStillAssetAtPath:andSize:",  a3,  width,  height);
    if (v8) {
      -[MPDocument setAbsoluteStillPath:forKey:](self, "setAbsoluteStillPath:forKey:", v8, a3);
    }
  }

  return v8;
}

- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  char v5 = 0;
  return -[MPDocument CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:]( self,  "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:",  a3,  &v5,  0LL,  1LL,  a4.width,  a4.height);
}

- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v13 = -[MPDocument assetKeyDelegate](self, "assetKeyDelegate");
  if (v13)
  {
    id v14 = v13;
    if ((objc_opt_respondsToSelector(v13, "retainedCGImageForAssetKey:andSize:orientation:thumbnailIfPossible:now:") & 1) != 0)
    {
      id v15 = objc_msgSend( v14,  "retainedCGImageForAssetKey:andSize:orientation:thumbnailIfPossible:now:",  a3,  a5,  v8,  v7,  width,  height);
      return (CGImage *)v15;
    }

    if ((objc_opt_respondsToSelector(v14, "retainedCGImageForAssetKey:andSize:orientation:") & 1) != 0)
    {
      id v15 = objc_msgSend(v14, "retainedCGImageForAssetKey:andSize:orientation:", a3, a5, width, height);
      return (CGImage *)v15;
    }

    if ((objc_opt_respondsToSelector(v14, "retainedCGImageForAssetKey:andSize:") & 1) != 0)
    {
      id v15 = objc_msgSend(v14, "retainedCGImageForAssetKey:andSize:", a3, width, height);
      return (CGImage *)v15;
    }

    if ((objc_opt_respondsToSelector(v14, "cgImageForAssetKey:andSize:") & 1) != 0) {
      return (CGImage *)objc_msgSend(v14, "cgImageForAssetKey:andSize:", a3, width, height);
    }
    if (v8 && (objc_opt_respondsToSelector(v14, "retainedThumbnailCGImageForAssetKey:andSize:") & 1) != 0)
    {
      id v15 = objc_msgSend(v14, "retainedThumbnailCGImageForAssetKey:andSize:", a3, width, height);
      return (CGImage *)v15;
    }
  }

  return 0LL;
}

- (CGImage)thumbnailCGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if ((objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "retainedThumbnailCGImageForAssetKey:andSize:") & 1) != 0) {
    return (CGImage *) objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "retainedThumbnailCGImageForAssetKey:andSize:",  a3,  width,  height);
  }
  else {
    return 0LL;
  }
}

- (id)avAssetForAssetAtPath:(id)a3
{
  if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate")
    && (objc_opt_respondsToSelector(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "avAssetForAssetKey:") & 1) != 0)
  {
    return objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "avAssetForAssetKey:", a3);
  }

  else
  {
    return 0LL;
  }

- (id)dataForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (-[MPDocument assetKeyDelegate](self, "assetKeyDelegate")
    && (objc_opt_respondsToSelector( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "imageDataForAssetKey:andSize:") & 1) != 0)
  {
    return objc_msgSend( -[MPDocument assetKeyDelegate](self, "assetKeyDelegate"),  "imageDataForAssetKey:andSize:",  a3,  width,  height);
  }

  else
  {
    return 0LL;
  }

- (BOOL)isSupportedMovieForAssetAtPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map")) {
    return 0;
  }
  id v6 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
  id v7 = [v6 objectForKey:kMPMetaDataMediaType];
  if (v7) {
    BOOL v8 = (char *)[v7 integerValue];
  }
  else {
    BOOL v8 = (char *)objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "mediaTypeForAssetAtPath:",  a3);
  }
  return v8 == (_BYTE *)&dword_0 + 3;
}

- (CGSize)resolutionForAssetAtPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map"))
  {
    double width = 2048.0;
    double height = 2048.0;
  }

  else
  {
    id v7 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:", a3);
    BOOL v8 = (NSString *)[v7 objectForKey:kMPMetaDataResolution];
    if (v8)
    {
      CGSize v9 = CGSizeFromString(v8);
      double height = v9.height;
      double width = v9.width;
    }

    else
    {
      -[MPDocument resolutionForPath:](self, "resolutionForPath:", a3);
    }
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (id)attributeForAssetAtPath:(id)a3 forKey:(id)a4
{
  return 0LL;
}

- (double)startTimeForAssetAtPath:(id)a3
{
  return result;
}

- (double)stopTimeForAssetAtPath:(id)a3
{
  return result;
}

@end