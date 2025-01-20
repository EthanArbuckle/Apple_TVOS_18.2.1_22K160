@interface MPAuthoringController
+ (id)sharedController;
+ (void)releaseSharedController;
- (BOOL)_tryAndCollapseMaps:(id)a3;
- (BOOL)canDocumentFitToAudio:(id)a3 withOptions:(id)a4 requiredAudioDuration:(double *)a5;
- (BOOL)canLayerGroupFitToAudio:(id)a3 inDocument:(id)a4 withOptions:(id)a5 requiredAudioDuration:(double *)a6;
- (BOOL)canScaleToAudioInDocument:(id)a3 withOptions:(id)a4;
- (BOOL)determineIfSlideDisplayesForTheWholeDurationForEffect:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 inStyleID:(id)a6;
- (BOOL)imagesHaveMovie:(id)a3 start:(int64_t)a4 count:(int64_t)a5;
- (BOOL)isAuthoring;
- (BOOL)prepareDocumentForExport:(id)a3 withOptions:(id)a4;
- (BOOL)rect:(CGRect)a3 intersectsRects:(id)a4 index:(int64_t *)a5;
- (MPAuthoringController)init;
- (double)findClosestBeatForTime:(double)a3 inBeats:(id)a4 atIndex:(int64_t *)a5;
- (double)maximumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (double)minimumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (id)_addVideoPaths:(id)a3 toEndOfLayer:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (id)_collectVersionInformationFromStyle:(id)a3;
- (id)_createMapsWithImages:(id)a3 withOptions:(id)a4;
- (id)_grabAndRemoveTitleEffectFromDocument:(id)a3 withOptions:(id)a4;
- (id)_mapsSortedByCity:(id)a3 hasCities:(BOOL *)a4;
- (id)_mapsSortedByState:(id)a3;
- (id)_placeEffectContainersForPhotos:(id)a3 options:(id)a4;
- (id)authoredDocument;
- (id)beatsForAudioPlaylist:(id)a3 withOptions:(id)a4;
- (id)createAudioPlayListFromAudioPaths:(id)a3 andOptions:(id)a4;
- (id)createEffectToTransitionMapWithOptions:(id)a3;
- (id)createLayerWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5;
- (id)createLayersForPlacesForImages:(id)a3 forDocument:(id)a4 withOptions:(id)a5;
- (id)delegate;
- (id)dynamicLayerWithImages:(id)a3 withOptions:(id)a4;
- (id)effectAuthoredLayerWithImages:(id)a3 withOptions:(id)a4;
- (id)effectContainersWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5;
- (id)effectContainersWithPaths:(id)a3 forDocument:(id)a4 withOptions:(id)a5;
- (id)effectsForImages:(id)a3 withOptions:(id)a4;
- (id)exportTransitionFromOptions:(id)a3;
- (id)filtersForEffectFromOptions:(id)a3;
- (id)filtersForLayerFromOptions:(id)a3;
- (id)filtersForSlideFromOptions:(id)a3;
- (id)findEffectIDInPresetArray:(id)a3 forImages:(id)a4 withOptions:(id)a5;
- (id)findEffectIDInWeighter:(id)a3 images:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 triesToFind:(int64_t *)a7 constraints:(id)a8 previousTags:(id)a9;
- (id)frameFromOptions:(id)a3;
- (id)loopTransitionFromOptions:(id)a3;
- (id)orderImages:(id)a3 withOptions:(id)a4;
- (id)pickRandomPathsInArray:(id)a3 excludingPaths:(id)a4 count:(int64_t)a5;
- (id)shuffleImagesByRating:(id)a3 withOptions:(id)a4;
- (id)slidesWithImages:(id)a3 andOptions:(id)a4;
- (id)sortImagePaths:(id)a3 toAspectRatiosInEffectPresetID:(id)a4 withOptions:(id)a5;
- (id)titleEffectsForImages:(id)a3 withOptions:(id)a4;
- (id)transitionFromOptions:(id)a3;
- (id)transitionFromOptions:(id)a3 firstEffectContainer:(id)a4 nextEffectContainer:(id)a5;
- (int64_t)_countOfEmptyContainersInIntroOfLayer:(id)a3 withOptions:(id)a4;
- (int64_t)_numberOfSlidesForOutroInLayer:(id)a3 withOptions:(id)a4;
- (int64_t)bestCountFromClusterForEffectWithImages:(id)a3 atStartIndex:(int64_t)a4 withWeighter:(id)a5 usedIndex:(int64_t *)a6;
- (int64_t)indexOfBeatWithTimestamp:(double)a3 inBeats:(id)a4 inRange:(_NSRange)a5;
- (int64_t)mapTypeForPoint0:(CGPoint)a3 point1:(CGPoint)a4 point2:(CGPoint)a5 map:(id)a6 flight:(id)a7;
- (int64_t)tileSetForMap1:(int64_t)a3 map2:(int64_t)a4 needsWater:(BOOL)a5;
- (unint64_t)authorDocument:(id)a3 withOptions:(id)a4;
- (unint64_t)authorLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)_checkForEmptyLayersInDocument:(id)a3;
- (void)_gatherLocationInfoForMaps:(id)a3;
- (void)_readdTitleEffect:(id)a3 toDocument:(id)a4 withOptions:(id)a5;
- (void)_renameMapsAndPins:(id)a3 withOptions:(id)a4;
- (void)_reorderImagesInDocument:(id)a3 withOptions:(id)a4;
- (void)addStyledCaptionToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)authorPlacesWithImages:(id)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)beatAlignEffectContainers:(id)a3 toBeats:(id)a4 withOptions:(id)a5;
- (void)beatAlignLayer:(id)a3 toBeats:(id)a4 withOptions:(id)a5;
- (void)beatAlignLayers:(id)a3 toAudioPlaylist:(id)a4 forDocument:(id)a5 withOptions:(id)a6;
- (void)cacheROIInformationForImages:(id)a3 withOptions:(id)a4;
- (void)checkForOffsetsForLayers:(id)a3 withOptions:(id)a4;
- (void)cleanup;
- (void)cleanup:(BOOL)a3;
- (void)cleanupClusters;
- (void)clearROICache;
- (void)combineEffectsNearSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)combineSlides:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)configureFiltersInDocument:(id)a3 withOptions:(id)a4;
- (void)configureIntroInDocument:(id)a3 withOptions:(id)a4;
- (void)configureOutroInDocument:(id)a3 withOptions:(id)a4;
- (void)configurePanoramaInformationToEffect:(id)a3 inDocument:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 removeOldIndex:(int64_t)a7;
- (void)configureTransitionsInDocument:(id)a3 withOptions:(id)a4;
- (void)createBeatsThreaded:(id)a3;
- (void)dealloc;
- (void)fillDurationsForLayers:(id)a3 withOptions:(id)a4;
- (void)findUsableClustersForUserDefinedSlideOrderPresentation:(id)a3 inClusters:(id)a4;
- (void)finishLogging;
- (void)insertVideoPaths:(id)a3 atIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)matchDurationsForLayers:(id)a3 withOptions:(id)a4;
- (void)moveSlidesFromIndicies:(id)a3 toIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)performInitialFaceDetectionInGroup:(id)a3 withOptions:(id)a4;
- (void)populateWeighter:(id)a3 withEffects:(id)a4 andOptions:(id)a5;
- (void)populateWeighter:(id)a3 withTransitions:(id)a4 andOptions:(id)a5;
- (void)prepareDocumentForPlayback:(id)a3 withOptions:(id)a4;
- (void)reconfigureColorSchemeForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)reconfigureColorSchemeInDocument:(id)a3 withOptions:(id)a4;
- (void)reconfigureImagesInDocument:(id)a3 withOptions:(id)a4;
- (void)reconfigureTitleEffectForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)reconfigureTitleEffectInDocument:(id)a3 withOptions:(id)a4;
- (void)recreateMapsInDocument:(id)a3;
- (void)removeAllMapsInDocument:(id)a3;
- (void)removeSlidesAtIndicies:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)removeStyledCaptionFromSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)scaleDurationsForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)scaleDurationsInDocument:(id)a3 withOptions:(id)a4;
- (void)scaleDurationsInEffectContainers:(id)a3 withOptions:(id)a4;
- (void)scaleDurationsInLayer:(id)a3 withMutableOptions:(id)a4;
- (void)scaleDurationsInLayer:(id)a3 withOptions:(id)a4;
- (void)scaleDurationsInPlacesForDocument:(id)a3 withOptions:(id)a4;
- (void)scaleLayerToMatchAudio:(id)a3 withBeats:(id)a4 withOptions:(id)a5;
- (void)scaleLayerToMatchAudio:(id)a3 withOptions:(id)a4;
- (void)setAuthoredDocument:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleTextToColor:(CGColor *)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)setTitleTextToColor:(CGColor *)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)setupClustersWithPaths:(id)a3 withOptions:(id)a4;
- (void)startLogging;
- (void)upgradeDocument:(id)a3 withOptions:(id)a4;
- (void)upgradeLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
@end

@implementation MPAuthoringController

- (id)_createMapsWithImages:(id)a3 withOptions:(id)a4
{
  char v296 = 1;
  id v6 = -[MPAuthoringController _mapsSortedByCity:hasCities:](self, "_mapsSortedByCity:hasCities:", a3, &v296);
  if (v296
    || (id v201 = -[MPAuthoringController _mapsSortedByState:](self, "_mapsSortedByState:", a3)) == 0LL
    || (v7 = v201, id v202 = [v6 count], v202 >= objc_msgSend(v7, "count")))
  {
    v7 = v6;
  }

  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v292 = 0u;
  __int128 v293 = 0u;
  __int128 v294 = 0u;
  __int128 v295 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v292 objects:v308 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v293;
    do
    {
      v11 = v7;
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v293 != v10) {
          objc_enumerationMutation(v11);
        }
        v13 = *(void **)(*((void *)&v292 + 1) + 8LL * (void)i);
        id v14 = [v13 objectForKey:@"PlaceName"];
        id v15 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v15 setObject:v14 forKey:@"MapName"];
        id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        [v16 addObject:v13];
        [v15 setObject:v16 forKey:@"pins"];
        [obj addObject:v15];
      }

      v7 = v11;
      id v9 = [v11 countByEnumeratingWithState:&v292 objects:v308 count:16];
    }

    while (v9);
  }

  -[MPAuthoringController _gatherLocationInfoForMaps:](self, "_gatherLocationInfoForMaps:", obj);
  if (-[MPAuthoringController _tryAndCollapseMaps:](self, "_tryAndCollapseMaps:", obj)) {
    -[MPAuthoringController _gatherLocationInfoForMaps:](self, "_gatherLocationInfoForMaps:", obj);
  }
  context = objc_autoreleasePoolPush();
  __int128 v288 = 0u;
  __int128 v289 = 0u;
  __int128 v290 = 0u;
  __int128 v291 = 0u;
  id v206 = [obj countByEnumeratingWithState:&v288 objects:v307 count:16];
  if (v206)
  {
    uint64_t v205 = *(void *)v289;
    double y = CGPointZero.y;
    double v18 = 0.0;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v289 != v205) {
          objc_enumerationMutation(obj);
        }
        uint64_t v207 = v19;
        v20 = *(void **)(*((void *)&v288 + 1) + 8 * v19);
        id v21 = objc_msgSend( objc_msgSend(objc_msgSend(v20, "objectForKey:", @"pins"), "lastObject"),  "objectForKey:",  @"photos");
        if ([v21 count])
        {
          id v22 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
          __int128 v284 = 0u;
          __int128 v285 = 0u;
          __int128 v286 = 0u;
          __int128 v287 = 0u;
          id v23 = [v21 countByEnumeratingWithState:&v284 objects:v306 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v285;
            do
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v285 != v25) {
                  objc_enumerationMutation(v21);
                }
                id v27 = -[MPDocument areaForPath:]( self->_authoredDocument,  "areaForPath:",  *(void *)(*((void *)&v284 + 1) + 8LL * (void)j));
                if (v27)
                {
                  id v28 = v27;
                  if ([v27 length]) {
                    [v22 addObject:v28];
                  }
                }
              }

              id v24 = [v21 countByEnumeratingWithState:&v284 objects:v306 count:16];
            }

            while (v24);
          }

          v222 = v20;
          if ((unint64_t)[v22 count] >= 2)
          {
            id v209 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            id v223 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
            __int128 v280 = 0u;
            __int128 v281 = 0u;
            __int128 v282 = 0u;
            __int128 v283 = 0u;
            id v213 = [v21 countByEnumeratingWithState:&v280 objects:v305 count:16];
            v29 = 0LL;
            if (!v213) {
              goto LABEL_96;
            }
            id v30 = 0LL;
            uint64_t v31 = 0LL;
            uint64_t v211 = *(void *)v281;
            while (1)
            {
              uint64_t v32 = 0LL;
              v236 = (char *)(v31 + 1);
              do
              {
                if (*(void *)v281 != v211) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v33 = *(void *)(*((void *)&v280 + 1) + 8 * v32);
                v34 = -[MPDocument areaForPath:](self->_authoredDocument, "areaForPath:", v33);
                id v219 = -[MPDocument latitudeForPath:](self->_authoredDocument, "latitudeForPath:", v33);
                id v215 = -[MPDocument longitudeForPath:](self->_authoredDocument, "longitudeForPath:", v33);
                uint64_t v229 = v32;
                uint64_t v232 = v31;
                v240 = v29;
                v244 = v34;
                uint64_t v226 = v33;
                if (v34)
                {
                  BOOL v35 = (-[__CFString isEqualToString:](v29, "isEqualToString:", v34) & 1) == 0
                     && -[__CFString length](v34, "length")
                     && -[__CFString length](v29, "length") != 0LL;
                  if (-[__CFString length](v34, "length")) {
                    BOOL v36 = 1;
                  }
                  else {
                    BOOL v36 = v29 == 0LL;
                  }
                  if (v36) {
                    goto LABEL_58;
                  }
                }

                else
                {
                  if (!v29) {
                    goto LABEL_63;
                  }
                  BOOL v35 = 0;
                }

                id v37 = 0LL;
                id v38 = 0LL;
                double v39 = 0.0;
                v40 = v236;
                while (v40 < (char *)[v21 count] - 1)
                {
                  id v37 = [v21 objectAtIndex:v40];
                  id v38 = -[MPDocument areaForPath:](self->_authoredDocument, "areaForPath:", v37);
                  objc_msgSend( -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v37),  "timeIntervalSince1970");
                  double v39 = v39 + v41;
                  ++v40;
                  if (v38 && [v38 length]) {
                    goto LABEL_53;
                  }
                }

                if (v38)
                {
LABEL_53:
                  if ([v38 length]
                    && ([v38 isEqualToString:v240] & 1) != 0)
                  {
                    goto LABEL_63;
                  }

                  if ([v38 length])
                  {
                    objc_msgSend( -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v37),  "timeIntervalSince1970");
                    if (vabdd_f64(v18, v39 / 0.0) >= vabdd_f64(v42, v39 / 0.0)) {
                      goto LABEL_59;
                    }
                    goto LABEL_63;
                  }
                }

- (void)_gatherLocationInfoForMaps:(id)a3
{
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v34 = [a3 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v52;
    double y = CGPointZero.y;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(a3);
        }
        uint64_t v36 = v5;
        id v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        id v7 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        BOOL v35 = v6;
        id v38 = [v6 objectForKey:@"pins"];
        id v41 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
        uint64_t v8 = 0LL;
        if (v41)
        {
          uint64_t v39 = *(void *)v48;
          v40 = v7;
          double x = CGPointZero.x;
          double v10 = y;
          do
          {
            uint64_t v37 = v8;
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = v11;
              v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
              id v13 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              id v14 = [v12 objectForKey:@"photos"];
              id v15 = [v14 countByEnumeratingWithState:&v43 objects:v55 count:16];
              double v16 = CGPointZero.x;
              double v17 = y;
              if (v15)
              {
                id v18 = v15;
                uint64_t v19 = *(void *)v44;
                double v16 = CGPointZero.x;
                double v17 = y;
                do
                {
                  for (i = 0LL; i != v18; i = (char *)i + 1)
                  {
                    if (*(void *)v44 != v19) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
                    id v22 = -[MPDocument latitudeForPath:](self->_authoredDocument, "latitudeForPath:", v21);
                    objc_msgSend( -[MPDocument longitudeForPath:](self->_authoredDocument, "longitudeForPath:", v21),  "floatValue");
                    float v24 = v23;
                    [v22 floatValue];
                    if (v24 != 0.0 && v25 != 0.0)
                    {
                      if (CGPointZero.x == v16 && y == v17)
                      {
                        double v16 = v24;
                        double v17 = v25;
                      }

                      objc_msgSend( v13,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24));
                    }
                  }

                  id v18 = [v14 countByEnumeratingWithState:&v43 objects:v55 count:16];
                }

                while (v18);
              }

              BOOL v26 = v16 == CGPointZero.x;
              BOOL v27 = v17 == y;
              if (v26 && v27) {
                double v28 = -122.031113;
              }
              else {
                double v28 = v16;
              }
              if (v26 && v27) {
                double v29 = 37.3230591;
              }
              else {
                double v29 = v17;
              }
              objc_msgSend( v12,  "setObject:forKey:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v28, v29),  @"pinLocation");
              double x = x + v28;
              double v10 = v10 + v29;
              id v7 = v40;
              objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(v13, "allObjects"));
              uint64_t v11 = v42 + 1;
            }

            while ((id)(v42 + 1) != v41);
            uint64_t v8 = (uint64_t)v41 + v37;
            id v41 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }

          while (v41);
        }

        else
        {
          double x = CGPointZero.x;
          double v10 = y;
        }

        if (x != CGPointZero.x || (double v30 = -122.031113, v31 = 37.3230591, v10 != y))
        {
          double v30 = x / (double)v8;
          double v31 = v10 / (double)v8;
        }

        objc_msgSend( v35,  "setObject:forKey:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v30, v31),  @"mapLocation");
        if (![v7 count]) {
          objc_msgSend( v7,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -122.031113, 37.3230591));
        }
        [v35 setObject:v7 forKey:@"allPoints"];
        uint64_t v5 = v36 + 1;
      }

      while ((id)(v36 + 1) != v34);
      id v34 = [a3 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v34);
  }

- (BOOL)_tryAndCollapseMaps:(id)a3
{
  id v3 = a3;
  id v29 = [a3 count];
  if ((unint64_t)[v3 count] >= 2)
  {
    unint64_t v5 = 1LL;
    uint64_t v32 = v3;
    do
    {
      id v6 = [v3 objectAtIndex:v5 - 1];
      id v7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", @"allPoints"), "allObjects");
      uint64_t v8 = (char *)objc_msgSend(objc_msgSend(v6, "objectForKey:", @"pins"), "count");
      unint64_t v33 = v5;
      id v9 = [v3 objectAtIndex:v5];
      id v10 = [v9 objectForKey:@"allPoints"];
      uint64_t v11 = (char *)objc_msgSend(objc_msgSend(v9, "objectForKey:", @"pins"), "count");
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v35;
        if (v8 == (_BYTE *)&dword_0 + 1 || v11 == (_BYTE *)&dword_0 + 1) {
          double v16 = 512.0;
        }
        else {
          double v16 = 1000.0;
        }
        double v17 = 4096.0 - v16;
        id v30 = v9;
        id v31 = v6;
        do
        {
          id v18 = 0LL;
          do
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v18);
            v20 = kMPAssetMapLatLongPoints[0];
            uint64_t v21 = kMPAssetOptionMapLatLong[0];
            id v22 = +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 768.0, 768.0);
            -[MPDocument pointForMap:withAttributes:]( self->_authoredDocument,  "pointForMap:withAttributes:",  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  v20,  v19,  v21,  v22,  kMPAssetMapInset[0],  0LL));
            if (v23 < v16 || v23 > v17 || v24 < v16 || v24 > v17)
            {
              id v3 = v32;
              unint64_t v5 = v33 + 1;
              goto LABEL_28;
            }

            id v18 = (char *)v18 + 1;
          }

          while (v13 != v18);
          id v13 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
          id v9 = v30;
          id v6 = v31;
        }

        while (v13);
      }

      objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(v6, "objectForKey:", @"pins"), "objectAtIndex:", 0),  "objectForKey:",  @"photos"),  "addObjectsFromArray:",  objc_msgSend( objc_msgSend(objc_msgSend(v9, "objectForKey:", @"pins"), "objectAtIndex:", 0),  "objectForKey:",  @"photos"));
      id v3 = v32;
      [v32 removeObjectAtIndex:v33];
      -[MPAuthoringController _gatherLocationInfoForMaps:](self, "_gatherLocationInfoForMaps:", v32);
      unint64_t v5 = 1LL;
LABEL_28:
      ;
    }

    while (v5 < (unint64_t)[v3 count]);
  }

  return v29 != [v3 count];
}

- (id)_mapsSortedByCity:(id)a3 hasCities:(BOOL *)a4
{
  id v102 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  double v100 = objc_autoreleasePoolPush();
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  id v106 = [a3 countByEnumeratingWithState:&v126 objects:v131 count:16];
  if (!v106)
  {
    uint64_t v107 = 0LL;
    uint64_t v8 = 0LL;
    goto LABEL_109;
  }

  uint64_t v107 = 0LL;
  uint64_t v112 = 0LL;
  id v113 = 0LL;
  id v7 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v105 = *(void *)v127;
  double y = CGPointZero.y;
  double v12 = 0.0;
  id obj = a3;
  do
  {
    uint64_t v13 = 0LL;
    float v114 = (char *)(v10 + 1);
    do
    {
      if (*(void *)v127 != v105) {
        objc_enumerationMutation(obj);
      }
      uint64_t v109 = v13;
      uint64_t v14 = *(void *)(*((void *)&v126 + 1) + 8 * v13);
      id v15 = -[MPDocument cityForPath:](self->_authoredDocument, "cityForPath:", v14);
      float v116 = v15;
      if (v15)
      {
        id v16 = -[__CFString length](v15, "length");
        uint64_t v17 = v107;
        if (v16) {
          uint64_t v17 = v107 + 1;
        }
        uint64_t v107 = v17;
      }

      float v119 = (__CFString *)v8;
      uint64_t v110 = v10;
      id v115 = -[MPDocument stateForPath:](self->_authoredDocument, "stateForPath:", v14);
      id v18 = -[MPDocument countryForPath:](self->_authoredDocument, "countryForPath:", v14);
      id v117 = v19;
      uint64_t v108 = v7;
      v111 = v6;
      id v20 = -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v14);
      id v21 = -[MPDocument latitudeForPath:](self->_authoredDocument, "latitudeForPath:", v14);
      id v118 = -[MPDocument longitudeForPath:](self->_authoredDocument, "longitudeForPath:", v14);
      uint64_t v120 = v14;
      if (self->_placesDebug)
      {
        id v22 = -[MPDocument definedPlaceNameForPath:](self->_authoredDocument, "definedPlaceNameForPath:", v14);
        id v23 = -[MPDocument placeForPath:](self->_authoredDocument, "placeForPath:", v14);
        id v24 = -[MPDocument areaForPath:](self->_authoredDocument, "areaForPath:", v120);
        id v25 = -[MPDocument neighborhoodForPath:](self->_authoredDocument, "neighborhoodForPath:", v120);
        [v21 floatValue];
        double v27 = v26;
        [v118 floatValue];
        id v98 = v23;
        uint64_t v14 = v120;
        NSLog( @"%@: d:%@, p:%@, a:%@, n:%@, c:%@, s:%@, co:%@, lat: %f, long: %f, d:%@",  v120,  v22,  v98,  v24,  v25,  v116,  v115,  v117,  *(void *)&v27,  v28,  v20);
      }

      if (!v116)
      {
        id v29 = v119;
        uint64_t v32 = v117;
        if (!v119) {
          goto LABEL_46;
        }
        BOOL v30 = 0;
LABEL_28:
        BOOL v103 = v30;
        id v34 = 0LL;
        id v35 = 0LL;
        double v36 = 0.0;
        __int128 v37 = v114;
        while (v37 < (char *)[obj count] - 1)
        {
          id v34 = [obj objectAtIndex:v37];
          id v35 = -[MPDocument cityForPath:](self->_authoredDocument, "cityForPath:", v34);
          objc_msgSend( -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v34),  "timeIntervalSince1970");
          double v36 = v36 + v38;
          ++v37;
          if (v35 && [v35 length]) {
            goto LABEL_34;
          }
        }

        if (!v35)
        {
          uint64_t v14 = v120;
          id v31 = v118;
          BOOL v30 = v103;
          goto LABEL_40;
        }

- (id)_mapsSortedByState:(id)a3
{
  id v81 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  context = objc_autoreleasePoolPush();
  id v88 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id v83 = [a3 countByEnumeratingWithState:&v100 objects:v105 count:16];
  if (!v83)
  {
    id v6 = 0LL;
    goto LABEL_90;
  }

  double v89 = 0LL;
  unint64_t v5 = 0LL;
  id v6 = 0LL;
  id v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v82 = *(void *)v101;
  double y = CGPointZero.y;
  double v10 = 0.0;
  do
  {
    uint64_t v11 = 0LL;
    uint64_t v93 = (char *)(v8 + 1);
    do
    {
      uint64_t v94 = v8;
      double v12 = v6;
      if (*(void *)v101 != v82) {
        objc_enumerationMutation(a3);
      }
      uint64_t v13 = v5;
      uint64_t v14 = *(void *)(*((void *)&v100 + 1) + 8 * v11);
      v95 = -[MPDocument stateForPath:](self->_authoredDocument, "stateForPath:", v14);
      id v15 = -[MPDocument countryForPath:](self->_authoredDocument, "countryForPath:", v14);
      id v17 = -[MPDocument latitudeForPath:](self->_authoredDocument, "latitudeForPath:", v14);
      id v85 = -[MPDocument longitudeForPath:](self->_authoredDocument, "longitudeForPath:", v14);
      [v85 floatValue];
      double v19 = v18;
      float v86 = v17;
      [v17 floatValue];
      double v21 = v20;
      BOOL v22 = CGPointZero.x == v19 && y == v21;
      id v92 = v16;
      if (v22)
      {
        id v23 = v13;
      }

      else
      {
        id v23 = v13;
        if (!v13) {
          id v23 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
        }
        objc_msgSend( v23,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, v21));
      }

      id v6 = v12;
      uint64_t v24 = v94;
      double v87 = v23;
      uint64_t v90 = v14;
      uint64_t v91 = v11;
      if (v95)
      {
        BOOL v25 = (-[__CFString isEqualToString:](v6, "isEqualToString:", v95) & 1) == 0
           && -[__CFString length](v95, "length")
           && -[__CFString length](v6, "length") != 0LL;
        if (-[__CFString length](v95, "length")) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = v6 == 0LL;
        }
        if (v26) {
          goto LABEL_41;
        }
      }

      else
      {
        if (!v6) {
          goto LABEL_47;
        }
        BOOL v25 = 0;
      }

      id v27 = 0LL;
      id v28 = 0LL;
      double v29 = 0.0;
      BOOL v30 = v93;
      while (v30 < (char *)[a3 count] - 1)
      {
        id v27 = [a3 objectAtIndex:v30];
        id v28 = -[MPDocument stateForPath:](self->_authoredDocument, "stateForPath:", v27);
        objc_msgSend( -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v27),  "timeIntervalSince1970");
        double v29 = v29 + v31;
        ++v30;
        if (v28 && [v28 length]) {
          goto LABEL_36;
        }
      }

      if (!v28) {
        goto LABEL_41;
      }
LABEL_36:
      if ([v28 length])
      {
        objc_msgSend( -[MPDocument creationDateForPath:](self->_authoredDocument, "creationDateForPath:", v27),  "timeIntervalSince1970");
        if (vabdd_f64(v10, v29 / 0.0) < vabdd_f64(v32, v29 / 0.0)) {
          goto LABEL_47;
        }
        goto LABEL_42;
      }

- (void)_renameMapsAndPins:(id)a3 withOptions:(id)a4
{
  id v280 = [a4 objectForKey:@"kMPAuthoringPlaceLabels"];
  __int128 v398 = 0u;
  __int128 v399 = 0u;
  __int128 v400 = 0u;
  __int128 v401 = 0u;
  id obj = a3;
  id v249 = [a3 countByEnumeratingWithState:&v398 objects:v431 count:16];
  if (v249)
  {
    uint64_t v248 = *(void *)v399;
    __int128 v281 = self;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v399 != v248) {
          objc_enumerationMutation(obj);
        }
        uint64_t v250 = v6;
        id v7 = *(void **)(*((void *)&v398 + 1) + 8 * v6);
        id v271 = +[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set");
        id v269 = +[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set");
        id v265 = +[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set");
        id v267 = +[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set");
        id v273 = +[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set");
        __int128 v394 = 0u;
        __int128 v395 = 0u;
        __int128 v396 = 0u;
        __int128 v397 = 0u;
        __int128 v262 = v7;
        id v254 = [v7 objectForKey:@"pins"];
        id v258 = [v254 countByEnumeratingWithState:&v394 objects:v430 count:16];
        if (!v258)
        {
          uint64_t v263 = 0LL;
          uint64_t v275 = -1LL;
          __int128 v277 = 0LL;
          goto LABEL_57;
        }

        uint64_t v263 = 0LL;
        uint64_t v256 = *(void *)v395;
        uint64_t v275 = -1LL;
        __int128 v277 = 0LL;
        do
        {
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v395 != v256) {
              objc_enumerationMutation(v254);
            }
            uint64_t v260 = v8;
            id v9 = [*(id *)(*((void *)&v394 + 1) + 8 * v8) objectForKey:@"photos"];
            __int128 v390 = 0u;
            __int128 v391 = 0u;
            __int128 v392 = 0u;
            __int128 v393 = 0u;
            id v10 = [v9 countByEnumeratingWithState:&v390 objects:v429 count:16];
            if (v10)
            {
              id v11 = v10;
              uint64_t v12 = *(void *)v391;
              do
              {
                uint64_t v13 = 0LL;
                do
                {
                  if (*(void *)v391 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void *)(*((void *)&v390 + 1) + 8LL * (void)v13);
                  id v15 = [v280 objectForKey:v14];
                  if (v15)
                  {
                    id v16 = [v15 objectForKey:@"mapLabel"];
                    if (v16) {
                      [v271 addObject:v16];
                    }
                  }

                  id v17 = -[MPDocument countryForPath:](self->_authoredDocument, "countryForPath:", v14);
                  if (!v17
                    || (float v18 = v17, -[__CFString isEqualToString:](v17, "isEqualToString:", &stru_259C60)))
                  {
                    float v18 = -[MPDocument oceanForPath:](self->_authoredDocument, "oceanForPath:", v14);
                  }

                  double v19 = -[MPDocument neighborhoodForPath:](self->_authoredDocument, "neighborhoodForPath:", v14);
                  float v20 = -[MPDocument stateForPath:](self->_authoredDocument, "stateForPath:", v14);
                  double v21 = -[MPDocument cityForPath:](self->_authoredDocument, "cityForPath:", v14);
                  BOOL v22 = self;
                  id v23 = v21;
                  id v24 = -[MPDocument definedPlaceNameForPath:](v22->_authoredDocument, "definedPlaceNameForPath:", v14);
                  if (!v24) {
                    goto LABEL_31;
                  }
                  id v25 = v24;
                  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", v24) & 1) != 0)
                  {
                    uint64_t v275 = 4LL;
                    __int128 v277 = v19;
                    if (!v19) {
                      goto LABEL_34;
                    }
                    goto LABEL_32;
                  }

                  if ((-[__CFString isEqualToString:](v23, "isEqualToString:", v25) & 1) != 0)
                  {
                    uint64_t v275 = 3LL;
                    __int128 v277 = v23;
                    if (!v19) {
                      goto LABEL_34;
                    }
                    goto LABEL_32;
                  }

                  if ((-[__CFString isEqualToString:](v20, "isEqualToString:", v25) & 1) != 0)
                  {
                    uint64_t v275 = 2LL;
                    __int128 v277 = v20;
LABEL_31:
                    if (!v19) {
                      goto LABEL_34;
                    }
LABEL_32:
                    if (-[__CFString length](v19, "length")) {
                      [v273 addObject:v19];
                    }
                    goto LABEL_34;
                  }

                  unsigned int v26 = -[__CFString isEqualToString:](v18, "isEqualToString:", v25);
                  if (v26) {
                    uint64_t v27 = 1LL;
                  }
                  else {
                    uint64_t v27 = v275;
                  }
                  id v28 = v277;
                  if (v26) {
                    id v28 = v18;
                  }
                  uint64_t v275 = v27;
                  __int128 v277 = v28;
                  if (v19) {
                    goto LABEL_32;
                  }
LABEL_34:
                  if (v23 && -[__CFString length](v23, "length")) {
                    [v269 addObject:v23];
                  }
                  if (v20 && -[__CFString length](v20, "length")) {
                    [v265 addObject:v20];
                  }
                  self = v281;
                  if (v18 && -[__CFString length](v18, "length")) {
                    [v267 addObject:v18];
                  }
                  uint64_t v13 = (char *)v13 + 1;
                }

                while (v11 != v13);
                v263 += (uint64_t)v11;
                id v29 = [v9 countByEnumeratingWithState:&v390 objects:v429 count:16];
                id v11 = v29;
              }

              while (v29);
            }

            uint64_t v8 = v260 + 1;
          }

          while ((id)(v260 + 1) != v258);
          id v258 = [v254 countByEnumeratingWithState:&v394 objects:v430 count:16];
        }

        while (v258);
LABEL_57:
        __int128 v389 = 0u;
        __int128 v388 = 0u;
        __int128 v387 = 0u;
        __int128 v386 = 0u;
        id v30 = [v271 countByEnumeratingWithState:&v386 objects:v428 count:16];
        if (v30)
        {
          id v31 = v30;
          double v32 = 0LL;
          int v33 = 0;
          uint64_t v34 = *(void *)v387;
          uint64_t v35 = v262;
          double v36 = (double)v263 * 0.5;
          do
          {
            for (i = 0LL; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v387 != v34) {
                objc_enumerationMutation(v271);
              }
              double v38 = *(__CFString **)(*((void *)&v386 + 1) + 8LL * (void)i);
              id v39 = [v271 countForObject:v38];
              uint64_t v40 = v277;
              __int128 v277 = v40;
              v33 |= v36 <= (double)(uint64_t)v39;
            }

            id v31 = [v271 countByEnumeratingWithState:&v386 objects:v428 count:16];
          }

          while (v31);
        }

        else
        {
          double v32 = 0LL;
          int v33 = 0;
          uint64_t v35 = v7;
        }

        if (v277) {
          BOOL v41 = v275 < 1;
        }
        else {
          BOOL v41 = 1;
        }
        int v251 = v33;
        if (!v41)
        {
          __int128 v385 = 0u;
          __int128 v384 = 0u;
          __int128 v383 = 0u;
          __int128 v382 = 0u;
          id v42 = [v267 countByEnumeratingWithState:&v382 objects:v427 count:16];
          if (v42)
          {
            id v43 = v42;
            char v44 = 0;
            uint64_t v45 = *(void *)v383;
            double v46 = (double)v263 * 0.75;
            do
            {
              for (j = 0LL; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v383 != v45) {
                  objc_enumerationMutation(v267);
                }
                if (v46 <= (double)(uint64_t)[v267 countForObject:*(void *)(*((void *)&v382 + 1) + 8 * (void)j)]) {
                  char v44 = 1;
                }
              }

              id v43 = [v267 countByEnumeratingWithState:&v382 objects:v427 count:16];
            }

            while (v43);
            int v48 = v44 & 1;
            if ((v44 & 1) == 0 || v275 < 2) {
              goto LABEL_118;
            }
            __int128 v381 = 0u;
            __int128 v380 = 0u;
            __int128 v379 = 0u;
            __int128 v378 = 0u;
            id v49 = [v265 countByEnumeratingWithState:&v378 objects:v426 count:16];
            if (!v49) {
              goto LABEL_120;
            }
            id v50 = v49;
            char v51 = 0;
            uint64_t v52 = *(void *)v379;
            do
            {
              for (k = 0LL; k != v50; k = (char *)k + 1)
              {
                if (*(void *)v379 != v52) {
                  objc_enumerationMutation(v265);
                }
                if (v46 <= (double)(uint64_t)[v265 countForObject:*(void *)(*((void *)&v378 + 1) + 8 * (void)k)]) {
                  char v51 = 1;
                }
              }

              id v50 = [v265 countByEnumeratingWithState:&v378 objects:v426 count:16];
            }

            while (v50);
            int v48 = v51 & 1;
            if ((v51 & 1) == 0 || v275 < 3) {
              goto LABEL_118;
            }
            __int128 v377 = 0u;
            __int128 v376 = 0u;
            __int128 v375 = 0u;
            __int128 v374 = 0u;
            id v54 = [v269 countByEnumeratingWithState:&v374 objects:v425 count:16];
            if (!v54) {
              goto LABEL_120;
            }
            id v55 = v54;
            char v56 = 0;
            uint64_t v57 = *(void *)v375;
            do
            {
              for (m = 0LL; m != v55; m = (char *)m + 1)
              {
                if (*(void *)v375 != v57) {
                  objc_enumerationMutation(v269);
                }
                if (v46 <= (double)(uint64_t)[v269 countForObject:*(void *)(*((void *)&v374 + 1) + 8 * (void)m)]) {
                  char v56 = 1;
                }
              }

              id v55 = [v269 countByEnumeratingWithState:&v374 objects:v425 count:16];
            }

            while (v55);
            int v48 = v56 & 1;
            if ((v56 & 1) != 0 && v275 >= 4)
            {
              __int128 v373 = 0u;
              __int128 v372 = 0u;
              __int128 v371 = 0u;
              __int128 v370 = 0u;
              id v59 = [v273 countByEnumeratingWithState:&v370 objects:v424 count:16];
              if (!v59) {
                goto LABEL_120;
              }
              id v60 = v59;
              char v61 = 0;
              uint64_t v62 = *(void *)v371;
              do
              {
                for (n = 0LL; n != v60; n = (char *)n + 1)
                {
                  if (*(void *)v371 != v62) {
                    objc_enumerationMutation(v273);
                  }
                  if (v46 <= (double)(uint64_t)[v273 countForObject:*(void *)(*((void *)&v370 + 1) + 8 * (void)n)]) {
                    char v61 = 1;
                  }
                }

                id v60 = [v273 countByEnumeratingWithState:&v370 objects:v424 count:16];
              }

              while (v60);
              if ((v61 & 1) == 0) {
                goto LABEL_120;
              }
            }

            else
            {
LABEL_118:
              if (!v48) {
                goto LABEL_120;
              }
            }

            double v32 = v277;
          }
        }

- (id)createLayersForPlacesForImages:(id)a3 forDocument:(id)a4 withOptions:(id)a5
{
  id obj = -[MPAuthoringController _createMapsWithImages:withOptions:](self, "_createMapsWithImages:withOptions:", a3, a5);
  id v6 = [a5 mutableCopy];
  id v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  [v6 setObject:v7 forKey:kMPAuthoringUseTitleEffect];
  uint64_t v8 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  [v6 setObject:v8 forKey:kMPAuthoringAlwaysIncludeLastTransition];
  id v9 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
  id v351 = v6;
  [v6 setObject:v9 forKey:kMPAuthoringLayerIndex];
  id v10 = +[MPLayer layer](&OBJC_CLASS___MPLayer, "layer");
  id v360 = +[MPLayer layer](&OBJC_CLASS___MPLayer, "layer");
  id v320 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v319 = a5;
  if (+[MPAuthoringUtilities useTitleEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "useTitleEffectFromOptions:",  a5))
  {
    id v11 = +[MPEffect effectWithEffectID:andStrings:]( MPEffect,  "effectWithEffectID:andStrings:",  @"MapTitle",  [a5 objectForKey:kMPAuthoringTitleStrings]);
    id v12 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
    __int128 v314 = +[MPEffect effectWithEffectID:](&OBJC_CLASS___MPEffect, "effectWithEffectID:", @"PlacesGlobe");
    objc_msgSend(v12, "addEffect:");
    [v12 addEffect:v11];
    uint64_t v13 = +[MPTransition transitionWithTransitionID:]( &OBJC_CLASS___MPTransition,  "transitionWithTransitionID:",  @"Dissolve");
    -[MPTransition setDuration:](v13, "setDuration:", 0.5);
    [v12 setTransition:v13];
    id v14 = v10;
    [v10 addEffectContainer:v12];
    [v12 duration];
    double v16 = v15;
    -[MPTransition duration](v13, "duration");
    double v18 = v16 - v17 + 7.35;
  }

  else
  {
    id v14 = v10;
    __int128 v314 = 0LL;
    double v18 = 7.35;
  }

  id v19 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
  [v19 setDuration:v18];
  [v360 addEffectContainer:v19];
  id v323 = [obj count];
  __int128 v445 = 0u;
  __int128 v446 = 0u;
  __int128 v447 = 0u;
  __int128 v448 = 0u;
  id v318 = [obj countByEnumeratingWithState:&v445 objects:v460 count:16];
  if (v318)
  {
    id v20 = 0LL;
    id v21 = 0LL;
    uint64_t v22 = 0LL;
    id v344 = 0LL;
    id v315 = 0LL;
    id v23 = 0LL;
    id v24 = 0LL;
    id v25 = 0LL;
    uint64_t v317 = *(void *)v446;
    double x = CGPointZero.x;
    double height = CGSizeZero.height;
    uint64_t v336 = -1LL;
    __int128 v337 = v14;
    uint64_t v27 = -1LL;
    double y = CGPointZero.y;
    do
    {
      uint64_t v28 = 0LL;
      id v29 = v20;
      id v30 = v21;
      id v31 = v23;
      id v32 = v24;
      uint64_t v331 = v27;
      id v33 = v25;
      do
      {
        __int128 v374 = v33;
        __int128 v368 = v30;
        __int128 v371 = v32;
        id v321 = v31;
        __int128 v345 = v29;
        uint64_t v343 = v22;
        if (*(void *)v446 != v317) {
          objc_enumerationMutation(obj);
        }
        uint64_t v332 = v28;
        __int128 v356 = *(void **)(*((void *)&v445 + 1) + 8 * v28);
        id v34 = [v356 objectForKey:@"pins"];
        uint64_t v35 = (char *)[v34 count];
        id v393 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v36 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v37 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v441 = 0u;
        __int128 v442 = 0u;
        __int128 v443 = 0u;
        __int128 v444 = 0u;
        id v361 = v34;
        __int128 v388 = (char *)[v34 countByEnumeratingWithState:&v441 objects:v459 count:16];
        if (v388)
        {
          double v38 = 0LL;
          uint64_t v384 = *(void *)v442;
          __int128 v381 = v35 - 1;
          double v39 = 7.35;
          do
          {
            uint64_t v40 = 0LL;
            __int128 v377 = v38;
            do
            {
              if (*(void *)v442 != v384) {
                objc_enumerationMutation(v361);
              }
              BOOL v41 = *(void **)(*((void *)&v441 + 1) + 8LL * (void)v40);
              id v42 = [v41 objectForKey:@"photos"];
              id v43 = -[MPAuthoringController _placeEffectContainersForPhotos:options:]( self,  "_placeEffectContainersForPhotos:options:",  v42,  v351);
              [v360 addEffectContainers:v43];
              objc_msgSend( v36,  "addObject:",  objc_msgSend(objc_msgSend(v42, "objectAtIndex:", 0), "copy"));
              objc_msgSend(v37, "addObject:", objc_msgSend(objc_msgSend(v42, "lastObject"), "copy"));
              char v44 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  [v41 objectForKey:@"pinLocation"],  @"location",  0);
              __int128 v437 = 0u;
              __int128 v438 = 0u;
              __int128 v439 = 0u;
              __int128 v440 = 0u;
              id v45 = [v43 countByEnumeratingWithState:&v437 objects:v458 count:16];
              __int128 v394 = v38;
              if (v45)
              {
                id v46 = v45;
                uint64_t v47 = *(void *)v438;
                double v48 = 0.0;
                do
                {
                  for (i = 0LL; i != v46; i = (char *)i + 1)
                  {
                    if (*(void *)v438 != v47) {
                      objc_enumerationMutation(v43);
                    }
                    [*(id *)(*((void *)&v437 + 1) + 8 * (void)i) duration];
                    double v48 = v48 + v50 + -0.6;
                  }

                  id v46 = [v43 countByEnumeratingWithState:&v437 objects:v458 count:16];
                }

                while (v46);
              }

              else
              {
                double v48 = 0.0;
              }

              double v51 = v48 + 0.6;
              -[NSMutableDictionary setObject:forKey:]( v44,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v51),  @"pinDuration");
              -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v42, @"photos");
              -[NSMutableDictionary setObject:forKey:]( v44,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v39),  @"pinStart");
              double v39 = v39 + v51 + 1.2;
              [v393 addObject:v44];
              if ((uint64_t)v394 < (uint64_t)v381)
              {
                id v52 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
                [v52 setDuration:4.05];
                [v52 duration];
                double v39 = v39 + v53;
                [v360 addEffectContainer:v52];
              }

              double v38 = v394 + 1;
              ++v40;
            }

            while (v40 != v388);
            double v38 = &v388[(void)v377];
            __int128 v388 = (char *)[v361 countByEnumeratingWithState:&v441 objects:v459 count:16];
          }

          while (v388);
        }

        double v54 = dbl_1F60A0[v343 < (uint64_t)v323 - 1];
        id v55 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
        [v55 setDuration:v54];
        [v360 addEffectContainer:v55];
        id v342 = [v356 objectForKey:@"mapLocation"];
        [v342 CGPointValue];
        [v320 addObject:NSStringFromCGPoint(v463)];
        id v334 = v55;
        if (+[MPAuthoringUtilities requestGeneratedImagesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "requestGeneratedImagesFromOptions:",  v319))
        {
          char v56 = objc_autoreleasePoolPush();
          id v335 = [v356 objectForKey:@"allPoints"];
          id v57 = [v335 allObjects];
          float v58 = kMPAssetMapLatLongPoints[0];
          id v59 = +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 768.0, 768.0);
          id v60 =  -[MPDocument tiledMapPathsForAttributes:]( self->_authoredDocument,  "tiledMapPathsForAttributes:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v57,  v58,  v59,  kMPAssetMapInset[0],  0LL));
          id v355 = v60;
          if (v60 && (char v61 = v60, [v60 count])) {
            id v349 = [v61 objectAtIndex:0];
          }
          else {
            id v349 = 0LL;
          }
          __int128 v436 = 0u;
          __int128 v435 = 0u;
          __int128 v434 = 0u;
          __int128 v433 = 0u;
          id v68 = [v393 countByEnumeratingWithState:&v433 objects:v457 count:16];
          if (v68)
          {
            id v69 = v68;
            uint64_t v70 = *(void *)v434;
            do
            {
              for (j = 0LL; j != v69; j = (char *)j + 1)
              {
                if (*(void *)v434 != v70) {
                  objc_enumerationMutation(v393);
                }
                uint64_t v72 = *(void **)(*((void *)&v433 + 1) + 8LL * (void)j);
                id v73 = [v72 objectForKey:@"location"];
                [v73 CGPointValue];
                BOOL v76 = x == v75 && y == v74;
                double v77 = x;
                double v78 = y;
                if (!v76)
                {
                  -[MPDocument pointForMap:withAttributes:]( self->_authoredDocument,  "pointForMap:withAttributes:",  v349,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v73,  kMPAssetOptionMapLatLong[0],  x,  y));
                  double v77 = (v79 + v79) * 0.000244140625 + -1.0;
                  double v78 = (v80 + v80) * 0.000244140625 + -1.0;
                }

                [v72 setObject:NSStringFromCGPoint(*(CGPoint *)&v77) forKey:@"location"];
              }

              id v69 = [v393 countByEnumeratingWithState:&v433 objects:v457 count:16];
            }

            while (v69);
          }

          uint64_t v341 = -[MPDocument mapLevelForPath:](self->_authoredDocument, "mapLevelForPath:", v349);
          double v330 = 0.0;
          if (!v374)
          {
            __int128 v340 = 0LL;
            uint64_t v322 = 0LL;
            uint64_t v325 = 0LL;
            int v333 = 0;
            uint64_t v67 = -1LL;
            double v326 = y;
            double v327 = x;
            double v328 = y;
            double v329 = x;
            id v63 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
            goto LABEL_102;
          }

          authoredDocument = self->_authoredDocument;
          [v374 CGPointValue];
          double v83 = v82;
          double v85 = v84;
          [v342 CGPointValue];
          id v88 = -[MPDocument flightPlanFrom:to:](authoredDocument, "flightPlanFrom:to:", v83, v85, v86, v87);
          id v63 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if (!v88)
          {
            __int128 v340 = 0LL;
            uint64_t v322 = 0LL;
            uint64_t v325 = 0LL;
            int v333 = 0;
            uint64_t v67 = -1LL;
            double v326 = y;
            double v327 = CGPointZero.x;
            double v328 = y;
            double v329 = CGPointZero.x;
            uint64_t v336 = -1LL;
            goto LABEL_102;
          }

          id v89 = v88;
          [v88 headingInDegrees];
          BOOL v91 = v90 < 45.0 || v90 >= 315.0;
          if (v91)
          {
            int v92 = 0;
            BOOL v93 = 0;
            int v395 = 0;
            uint64_t v94 = 1LL;
            goto LABEL_70;
          }

          if (v90 < 45.0 || v90 >= 135.0)
          {
            if (v90 < 135.0 || v90 >= 225.0)
            {
              int v92 = 0;
              int v395 = 0;
              BOOL v95 = v90 >= 225.0;
              BOOL v96 = v90 < 315.0;
              BOOL v93 = v95 && v96;
              BOOL v76 = !v95 || !v96;
              uint64_t v94 = 2LL;
              if (v76) {
                uint64_t v94 = -1LL;
              }
            }

            else
            {
              int v92 = 0;
              BOOL v93 = 0;
              int v395 = 1;
              uint64_t v94 = 3LL;
            }

- (BOOL)rect:(CGRect)a3 intersectsRects:(id)a4 index:(int64_t *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = (char *)[a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      double v15 = 0LL;
      double v16 = &v12[(void)v13];
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(a4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v15) CGRectValue];
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        if (CGRectIntersectsRect(v23, v24))
        {
          *a5 = (int64_t)&v15[(void)v13];
          LOBYTE(v11) = 1;
          return (char)v11;
        }

        ++v15;
      }

      while (v12 != v15);
      id v11 = (char *)[a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v12 = v11;
      uint64_t v13 = v16;
      if (v11) {
        continue;
      }
      break;
    }
  }

  return (char)v11;
}

- (int64_t)mapTypeForPoint0:(CGPoint)a3 point1:(CGPoint)a4 point2:(CGPoint)a5 map:(id)a6 flight:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  double v11 = a4.y;
  double v12 = a4.x;
  double v13 = a3.y;
  double v14 = a3.x;
  double v16 = +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:");
  -[MPDocument latLongPointForMap:withAttributes:]( self->_authoredDocument,  "latLongPointForMap:withAttributes:",  a6,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v16,  kMPAssetOptionMapPoint[0]));
  double v50 = v18;
  double v51 = v17;
  __int128 v19 = +[NSValue valueWithCGPoint:]( &OBJC_CLASS___NSValue,  "valueWithCGPoint:",  v14 + (v12 - v14) * 0.5,  v13 + (v11 - v13) * 0.5);
  -[MPDocument latLongPointForMap:withAttributes:]( self->_authoredDocument,  "latLongPointForMap:withAttributes:",  a6,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v19,  kMPAssetOptionMapPoint[0]));
  double v49 = v20;
  double v22 = v21;
  CGRect v23 = +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v12, v11);
  -[MPDocument latLongPointForMap:withAttributes:]( self->_authoredDocument,  "latLongPointForMap:withAttributes:",  a6,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v23,  kMPAssetOptionMapPoint[0]));
  double v25 = v24;
  double v27 = v26;
  uint64_t v28 = +[NSValue valueWithCGPoint:]( &OBJC_CLASS___NSValue,  "valueWithCGPoint:",  v12 + (x - v12) * 0.5,  v11 + (y - v11) * 0.5);
  -[MPDocument latLongPointForMap:withAttributes:]( self->_authoredDocument,  "latLongPointForMap:withAttributes:",  a6,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v28,  kMPAssetOptionMapPoint[0]));
  double v30 = v29;
  double v32 = v31;
  id v33 = +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", x, y);
  -[MPDocument latLongPointForMap:withAttributes:]( self->_authoredDocument,  "latLongPointForMap:withAttributes:",  a6,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v33,  kMPAssetOptionMapPoint[0]));
  double v35 = v34;
  double v37 = v36;
  unsigned int v38 = objc_msgSend(a7, "waterAtLocation:", v51, v50);
  unsigned int v39 = objc_msgSend(a7, "waterAtLocation:", v35, v37);
  unsigned int v40 = objc_msgSend(a7, "waterAtLocation:", v25, v27);
  unsigned int v41 = objc_msgSend(a7, "waterAtLocation:", v30, v32);
  unsigned int v42 = objc_msgSend(a7, "waterAtLocation:", v49, v22);
  int v43 = v38 ^ 1;
  int v44 = v39 ^ 1;
  int v45 = v40 ^ 1;
  if (((v38 ^ 1) & 1) == 0 && (v44 & 1) == 0 && !v45) {
    return 1LL;
  }
  int v46 = v41 ^ 1;
  int v47 = v42 ^ 1;
  if (((v43 | v39 | v45) & 1) == 0 && (v46 & 1) == 0 && !v47) {
    return 1LL;
  }
  if ((v38 | v44 | v45 | v46 | v47) != 1) {
    return 1LL;
  }
  if ((v38 | v39 | v40) != 1 || (v43 | v42 | v41 | v39 | v40) != 1 || (v38 | v42 | v41 | v44 | v40) != 1) {
    return 0LL;
  }
  if (((v43 | v47) & (v44 | v46) & (v46 | v45) & (v47 | v45)) != 0) {
    return 0LL;
  }
  return 2LL;
}

- (int64_t)tileSetForMap1:(int64_t)a3 map2:(int64_t)a4 needsWater:(BOOL)a5
{
  if ((a4 | a3) == 0 && a5) {
    int64_t result = 8LL;
  }
  else {
    int64_t result = 0LL;
  }
  if (a4 | a3)
  {
    if (a3 == 1 && a4 == 1 || a3 >= 1 && a4 >= 1 && a5)
    {
      return 7LL;
    }

    else if (a3 || (unint64_t)(a4 - 1) >= 2)
    {
      if (a4) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = (unint64_t)(a3 - 1) >= 2;
      }
      if (v6) {
        return 0LL;
      }
      else {
        return 4LL;
      }
    }

    else
    {
      return 3LL;
    }
  }

  return result;
}

- (void)scaleDurationsInPlacesForDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  id v8 = objc_msgSend(objc_msgSend(v7, "layers"), "objectAtIndex:", 0);
  id v9 = objc_msgSend(objc_msgSend(v7, "layers"), "objectAtIndex:", 1);
  context = objc_autoreleasePoolPush();
  if (!self->_isAuthoring)
  {
    objc_msgSend(objc_msgSend(a3, "montage"), "lock");
    if (a4) {
      goto LABEL_4;
    }
LABEL_53:
    a4 = [v7 authoringOptions];
    goto LABEL_4;
  }

  if (!a4) {
    goto LABEL_53;
  }
LABEL_4:
  if (!self->_isAuthoring) {
    -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a3);
  }
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a4);
  double v11 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
  if (!-[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringAudioDuration))
  {
    objc_msgSend(objc_msgSend(v7, "audioPlaylist"), "duration");
    double v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, kMPAuthoringAudioDuration);
  }

  unsigned int v13 = +[MPAuthoringUtilities alignToBeatsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "alignToBeatsFromOptions:",  v10);
  double v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 zIndex]);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, kMPAuthoringLayerIndex);
  -[MPAuthoringController scaleDurationsInLayer:withOptions:](self, "scaleDurationsInLayer:withOptions:", v9, v10);
  if (v13)
  {
    if ((uint64_t)objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "countOfSongs") >= 1)
    {
      id v15 = -[MPAuthoringController beatsForAudioPlaylist:withOptions:]( self,  "beatsForAudioPlaylist:withOptions:",  [v7 audioPlaylist],  v10);
      if (v15) {
        -[MPAuthoringController beatAlignLayer:toBeats:withOptions:]( self,  "beatAlignLayer:toBeats:withOptions:",  v9,  v15,  v10);
      }
    }
  }

  double v54 = v7;
  id v55 = self;
  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v16 = [v8 effectContainers];
  id v17 = [v16 countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v75;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v75 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(v21, "effects"), "lastObject"), "effectID"),  "isEqualToString:",  @"PinMap")) {
          [obj addObject:v21];
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v74 objects:v81 count:16];
    }

    while (v18);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16, a3);
  if (v22)
  {
    id v23 = v22;
    id v61 = 0LL;
    uint64_t v24 = *(void *)v71;
    double v25 = 0.0;
    uint64_t v26 = 1LL;
    uint64_t v56 = *(void *)v71;
    do
    {
      uint64_t v27 = 0LL;
      id v57 = v23;
      do
      {
        if (*(void *)v71 != v24) {
          objc_enumerationMutation(obj);
        }
        id v28 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * v27), "effects"), "lastObject");
        NSRange v30 = NSRangeFromString((NSString *)[v28 effectAttributeForKey:@"pinRange"]);
        NSUInteger length = v30.length;
        NSUInteger location = v30.location;
        double v32 = 0.0;
        id v59 = v28;
        uint64_t v60 = v27;
        if (!v30.location)
        {
          id v61 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
          id v33 = [v28 effectAttributeForKey:@"pinInformation"];
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          id v34 = [v33 countByEnumeratingWithState:&v66 objects:v79 count:16];
          if (v34)
          {
            id v35 = v34;
            double v36 = v11;
            uint64_t v37 = *(void *)v67;
            double v38 = 7.35;
            do
            {
              for (j = 0LL; j != v35; j = (char *)j + 1)
              {
                if (*(void *)v67 != v37) {
                  objc_enumerationMutation(v33);
                }
                id v40 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)j) mutableCopy];
                id v41 = [v9 objectInEffectContainersAtIndex:v26];
                double v42 = 0.0;
                if ((uint64_t)[v41 countOfEffects] >= 1)
                {
                  do
                  {
                    [v41 duration];
                    double v42 = v42 + v43 + -0.6;
                    id v41 = [v9 objectInEffectContainersAtIndex:++v26];
                  }

                  while ((uint64_t)[v41 countOfEffects] > 0);
                }

                double v44 = v42 + 0.6;
                ++v26;
                objc_msgSend( v40,  "setObject:forKey:",  -[AVAudioTimePitchAlgorithm numberWithDouble:]((id)v36[234], "numberWithDouble:", v44),  @"pinDuration");
                objc_msgSend( v40,  "setObject:forKey:",  -[AVAudioTimePitchAlgorithm numberWithDouble:]((id)v36[234], "numberWithDouble:", v38),  @"pinStart");
                [v61 addObject:v40];

                double v38 = v38 + v44 + 1.2 + 2.85;
              }

              id v35 = [v33 countByEnumeratingWithState:&v66 objects:v79 count:16];
            }

            while (v35);
            double v25 = 0.0;
            double v32 = 4.6;
            double v11 = v36;
            uint64_t v24 = v56;
            id v23 = v57;
            NSUInteger location = 0LL;
          }

          else
          {
            double v25 = 0.0;
            double v32 = 4.6;
            id v23 = v57;
          }

          NSUInteger length = v30.length;
        }

        int v45 = +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  location,  length);
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        id v46 = [v61 objectsAtIndexes:v45];
        id v47 = [v46 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v63;
          do
          {
            for (k = 0LL; k != v48; k = (char *)k + 1)
            {
              if (*(void *)v63 != v49) {
                objc_enumerationMutation(v46);
              }
              objc_msgSend( objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * (void)k), "objectForKey:", @"pinDuration"),  "doubleValue");
              double v32 = v32 + v51 + 0.4 + 1.75 + 0.3 + 0.4 + 1.2;
            }

            id v48 = [v46 countByEnumeratingWithState:&v62 objects:v78 count:16];
          }

          while (v48);
        }

        [v59 setEffectAttribute:v61 forKey:@"pinInformation"];
        objc_msgSend( v59,  "setEffectAttribute:forKey:",  -[AVAudioTimePitchAlgorithm numberWithDouble:]((id)v11[234], "numberWithDouble:", v25),  @"startTime");
        double v25 = v25 + v32;
        [v59 setMainDuration:v32];
        uint64_t v27 = v60 + 1;
      }

      while ((id)(v60 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    }

    while (v23);
  }

  [v54 reconfigureLoopingMode];
  if (!v55->_isAuthoring)
  {
    -[MPAuthoringController cleanup](v55, "cleanup");
    objc_msgSend(objc_msgSend(v52, "montage"), "unlock");
  }

  objc_autoreleasePoolPop(context);
}

- (id)_placeEffectContainersForPhotos:(id)a3 options:(id)a4
{
  unint64_t v5 = (NSArray *)[a3 mutableCopy];
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id obj = v5;
  if (-[NSArray count](v5, "count") >= 5) {
    id obj = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0LL),  -[NSArray lastObject](v5, "lastObject"),  0LL);
  }
  id v41 = v5;
  id delegate = self->_delegate;
  if (delegate) {
    int v8 = objc_opt_respondsToSelector(delegate, "document:needsFiltersForSlide:effectIndex:containerIndex:layerIndex:");
  }
  else {
    int v8 = 0;
  }
  unsigned int v44 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldDuckMoviesFromOptions:",  a4);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v45 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v65,  16LL);
  if (v45)
  {
    id v9 = 0LL;
    uint64_t v42 = *(void *)v60;
    double v43 = v6;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        uint64_t v49 = v9;
        if (*(void *)v60 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v10;
        uint64_t v11 = *(void *)(*((void *)&v59 + 1) + 8 * v10);
        -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", v11);
        double v14 = v12 / v13;
        if (v14 > 2.0 || v14 < 0.5) {
          id v16 = @"MapSlideBreak";
        }
        else {
          id v16 = @"MapSlide";
        }
        id v17 = +[MPEffect effectWithEffectID:andPaths:]( &OBJC_CLASS___MPEffect,  "effectWithEffectID:andPaths:",  v16,  +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v47 = v17;
        id v18 = -[MPEffect slides](v17, "slides");
        id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v55,  v64,  16LL);
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v56;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v56 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
              [v23 setMirrorToDuplicatePaths:1];
              if (-[MPDocument isImageAtPath:](self->_authoredDocument, "isImageAtPath:", [v23 path])) {
                uint64_t v24 = 2LL;
              }
              else {
                uint64_t v24 = 3LL;
              }
              [v23 setMediaType:v24];
              if ((v8 & 1) != 0)
              {
                unsigned int v25 = [self->_delegate document:self->_authoredDocument shouldUseDefaultFiltersForSlide:v23 effectIndex:0 containerIndex:0 layerIndex:1];
                if (((v25 | v8 ^ 1) & 1) == 0)
                {
                  id v26 = [self->_delegate document:self->_authoredDocument needsFiltersForSlide:v23 effectIndex:0 containerIndex:0 layerIndex:1];
                  goto LABEL_30;
                }

                if (!v25) {
                  continue;
                }
              }

              id v26 = -[MPAuthoringController filtersForSlideFromOptions:](self, "filtersForSlideFromOptions:", a4);
LABEL_30:
              id v27 = v26;
              if (v26 && [v26 count]) {
                [v23 addFilters:v27];
              }
            }

            id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v55,  v64,  16LL);
          }

          while (v20);
        }

        if (v44)
        {
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v28 = -[MPEffect slides](v47, "slides");
          id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v52;
            do
            {
              for (j = 0LL; j != v30; j = (char *)j + 1)
              {
                if (*(void *)v52 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
                if ([v33 hasMovie])
                {
                  [v33 setAudioDuckInDuration:1.0];
                  [v33 setAudioDuckOutDuration:1.0];
                  [v33 setAudioDuckLevel:0.25];
                }
              }

              id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
            }

            while (v30);
          }
        }

        id v34 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
        [v34 addEffect:v47];
        if (v49) {
          double v35 = 4.5;
        }
        else {
          double v35 = 3.9;
        }
        if (v49 == (char *)-[NSArray count](obj, "count") - 1)
        {
          double v35 = v35 + -0.6;
        }

        else
        {
          double v36 = +[MPTransition transitionWithTransitionID:]( &OBJC_CLASS___MPTransition,  "transitionWithTransitionID:",  @"SourceOver");
          -[MPTransition setDuration:](v36, "setDuration:", 0.6);
          [v34 setTransition:v36];
        }

        id v6 = v43;
        [v34 setDuration:v35];
        [v43 addObject:v34];
        id v9 = v49 + 1;
        uint64_t v10 = v48 + 1;
      }

      while ((id)(v48 + 1) != v45);
      id v45 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v65,  16LL);
    }

    while (v45);
  }

  if (-[NSArray count](v41, "count") >= 5)
  {
    -[NSArray removeObjectAtIndex:](v41, "removeObjectAtIndex:", 0LL);
    -[NSArray removeLastObject](v41, "removeLastObject");
    id v37 = [a4 mutableCopy];
    [v37 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
    double v38 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    [v37 setObject:v38 forKey:kMPAuthoringUseLoopTransition];
    id v39 = -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( self,  "effectContainersWithImages:effects:andOptions:",  v41,  -[MPAuthoringController effectsForImages:withOptions:](self, "effectsForImages:withOptions:", v41, v37),  v37);
    objc_msgSend( v6,  "insertObjects:atIndexes:",  v39,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  1,  objc_msgSend(v39, "count")));
  }

  -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  v6,  a4);
  objc_msgSend( objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 0), "objectInEffectsAtIndex:", 0),  "setPhaseInDuration:",  0.0);
  objc_msgSend( objc_msgSend(objc_msgSend(v6, "lastObject"), "objectInEffectsAtIndex:", 0),  "setPhaseOutDuration:",  0.0);
  return v6;
}

- (void)removeAllMapsInDocument:(id)a3
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentLayerGroup"), "layers"), "objectAtIndex:", 0),  "effectContainers");
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((uint64_t)[v8 countOfEffects] >= 1)
        {
          id v9 = objc_msgSend(objc_msgSend(v8, "effects"), "lastObject");
          if (objc_msgSend(objc_msgSend(v9, "effectID"), "isEqualToString:", @"PinMap"))
          {
            __int128 v17 = 0u;
            __int128 v18 = 0u;
            __int128 v15 = 0u;
            __int128 v16 = 0u;
            id v10 = objc_msgSend(v9, "secondarySlides", 0);
            id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v16;
              do
              {
                for (j = 0LL; j != v12; j = (char *)j + 1)
                {
                  if (*(void *)v16 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) setPath:0];
                }

                id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
              }

              while (v12);
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v5);
  }

- (void)recreateMapsInDocument:(id)a3
{
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v3 = objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentLayerGroup"), "layers"), "objectAtIndex:", 0),  "effectContainers");
  id v4 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
    uint64_t v24 = *(void *)v36;
    id v25 = v3;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if ((uint64_t)[v8 countOfEffects] >= 1)
        {
          id v9 = objc_msgSend(objc_msgSend(v8, "effects"), "lastObject");
          if (objc_msgSend(objc_msgSend(v9, "effectID"), "isEqualToString:", @"PinMap"))
          {
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            id v10 = [v9 secondarySlides];
            id v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v32;
              while (2)
              {
                for (j = 0LL; j != v12; j = (char *)j + 1)
                {
                  if (*(void *)v32 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  if (![*(id *)(*((void *)&v31 + 1) + 8 * (void)j) path])
                  {
                    [v9 removeAllSecondarySlides];
                    id v15 = [v9 effectAttributeForKey:@"pinLocations"];
                    id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                    __int128 v27 = 0u;
                    __int128 v28 = 0u;
                    __int128 v29 = 0u;
                    __int128 v30 = 0u;
                    id v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
                    if (v17)
                    {
                      id v18 = v17;
                      uint64_t v19 = *(void *)v28;
                      do
                      {
                        for (k = 0LL; k != v18; k = (char *)k + 1)
                        {
                          if (*(void *)v28 != v19) {
                            objc_enumerationMutation(v15);
                          }
                          CGPoint v21 = CGPointFromString((NSString *)*(void *)(*((void *)&v27 + 1) + 8LL * (void)k));
                          objc_msgSend( v16,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v21.x, v21.y));
                        }

                        id v18 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
                      }

                      while (v18);
                    }

                    __int128 v22 = kMPAssetMapLatLongPoints[0];
                    id v23 = +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 768.0, 768.0);
                    objc_msgSend( v9,  "createSecondarySlidesWithPaths:",  objc_msgSend( a3,  "tiledMapPathsForAttributes:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v16,  v22,  v23,  kMPAssetMapInset[0],  0)));
                    uint64_t v6 = v24;
                    id v3 = v25;
                    goto LABEL_25;
                  }
                }

                id v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
          }
        }

- (id)beatsForAudioPlaylist:(id)a3 withOptions:(id)a4
{
  id v5 = self;
  uint64_t v6 = 32LL;
  -[NSRecursiveLock lock](self->_beatLock, "lock", a3, a4);
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  double v8 = 0.0;
  objc_msgSend(v7, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v9 = [a3 songs];
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v29 = 32LL;
    __int128 v30 = v5;
    uint64_t v12 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        objc_msgSend(v14, "startTime", v29, v30);
        double v16 = v15;
        [v14 duration];
        double v18 = v17;
        id v19 = objc_msgSend( +[MPSongManager sharedManager](MPSongManager, "sharedManager"),  "cachedBeatsForSongAtPath:",  objc_msgSend(v14, "path"));
        if (!v19 || (__int128 v20 = v19, ![v19 count]))
        {
          id v7 = 0LL;
          goto LABEL_24;
        }

        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (j = 0LL; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) doubleValue];
              double v26 = fabs(v25);
              if (v26 >= v16 && v26 <= v16 + v18) {
                objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 + v26 - v16));
              }
            }

            id v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }

          while (v22);
        }

        double v8 = v8 + v18;
        objc_msgSend(v7, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
      }

      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }

- (double)findClosestBeatForTime:(double)a3 inBeats:(id)a4 atIndex:(int64_t *)a5
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = (char *)[a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      id v11 = 0LL;
      uint64_t v12 = *(void *)v20;
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      double v14 = 999999.9;
LABEL_4:
      uint64_t v15 = 0LL;
      double v16 = &v10[(void)v11];
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(a4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v15) doubleValue];
        double v18 = vabdd_f64(v17, a3);
        if (v18 < v14)
        {
          double v14 = v18;
          int64_t v13 = (int64_t)&v11[v15];
        }

        if (v18 > v14) {
          break;
        }
        if (v10 == (char *)++v15)
        {
          id v10 = (char *)[a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
          id v11 = v16;
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    else
    {
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    *a5 = v13;
    objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v13), "doubleValue");
  }

  return result;
}

- (int64_t)indexOfBeatWithTimestamp:(double)a3 inBeats:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = [a4 count];
  if (!length) {
    return location;
  }
  int64_t v11 = location + (length >> 1);
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v11), "doubleValue");
  if (vabdd_f64(a3, v12) >= 0.01)
  {
    uint64_t v13 = a3 - v12 >= 0.0 ? v11 + 1 : location;
    if (location != v13 || length != 1) {
      return -[MPAuthoringController indexOfBeatWithTimestamp:inBeats:inRange:]( self,  "indexOfBeatWithTimestamp:inBeats:inRange:",  a4,  a3);
    }
  }

  return v11;
}

- (void)createBeatsThreaded:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  id v6 = [a3 objectAtIndex:0];
  id v7 = [a3 objectAtIndex:1];
  id v8 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "songPathsForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", v6));
  -[NSRecursiveLock lock](self->_beatLock, "lock");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (([v8 containsObject:v13] & 1) == 0) {
          objc_msgSend( +[MPSongManager sharedManager](MPSongManager, "sharedManager"),  "beatsForSongAtPath:progressCallback:context:",  v13,  0,  0);
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  -[NSRecursiveLock unlock](self->_beatLock, "unlock");
  objc_autoreleasePoolPop(v5);
}

+ (id)sharedController
{
  id result = (id)qword_2B0560;
  if (!qword_2B0560)
  {
    objc_sync_enter(a1);
    if (!qword_2B0560) {
      qword_2B0560 = objc_alloc_init(&OBJC_CLASS___MPAuthoringController);
    }
    objc_sync_exit(a1);
    return (id)qword_2B0560;
  }

  return result;
}

+ (void)releaseSharedController
{
  if (qword_2B0560)
  {
    objc_sync_enter(a1);

    qword_2B0560 = 0LL;
    objc_sync_exit(a1);
  }

  +[MPClusterController releaseSharedController](&OBJC_CLASS___MPClusterController, "releaseSharedController");
}

- (MPAuthoringController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MPAuthoringController;
  v2 = -[MPAuthoringController init](&v8, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v2->_beatLock = v3;
    -[NSRecursiveLock setName:](v3, "setName:", @"MPAuthoringController.beatLock");
    v2->_weighter = objc_alloc_init(&OBJC_CLASS___MPWeighter);
    v2->_transitionWeighter = objc_alloc_init(&OBJC_CLASS___MPWeighter);
    v2->_stats = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v4 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v2->_cachedROILock = v4;
    -[NSLock setName:](v4, "setName:", @"MPAuthoringController.cachedROILock");
    v2->_cachedROIInformation = 0LL;
    v2->_authorLock = objc_alloc_init(&OBJC_CLASS___NSLock);
    v2->_logLevel = 0LL;
    v2->_double placesDistanceSeperation = 2000.0;
    v2->_placesDebug = 0;
    id v5 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    if (-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"PlacesDebug")) {
      v2->_placesDebug = -[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", @"PlacesDebug");
    }
    if (-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"placesDistanceSeperation"))
    {
      -[NSUserDefaults floatForKey:](v5, "floatForKey:", @"placesDistanceSeperation");
      v2->_double placesDistanceSeperation = v6;
    }

    if (-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"logLevel")) {
      v2->_logLevel = -[NSUserDefaults integerForKey:](v5, "integerForKey:", @"logLevel");
    }
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAuthoringController;
  -[MPAuthoringController dealloc](&v3, "dealloc");
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (unint64_t)authorDocument:(id)a3 withOptions:(id)a4
{
  return -[MPAuthoringController authorLayerGroup:inDocument:withOptions:]( self,  "authorLayerGroup:inDocument:withOptions:",  [a3 documentLayerGroup],  a3,  a4);
}

- (unint64_t)authorLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  context = objc_autoreleasePoolPush();
  -[NSLock lock](self->_authorLock, "lock");
  -[MPAuthoringController startLogging](self, "startLogging");
  self->_cancelAuthoring = 0;
  if (!a5) {
    a5 = [a3 authoringOptions];
  }
  -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
  self->_isAuthoring = 1;
  unint64_t v9 = +[MPAuthoringUtilities randomSeedFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "randomSeedFromOptions:", a5);
  self->_seed = v9;
  srandom(v9);
  id v10 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a5);
  uint64_t v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_seed);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, kMPAuthoringSeed);
  double v12 = (const __CFString *)-[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringStyleID);
  if (!v12
    || (uint64_t v13 = v12,
        !objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  v12)))
  {
    uint64_t v13 = @"Classic";
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", @"Classic", kMPAuthoringStyleID);
  }

  if (-[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"MPUseImageOnlyTitleEffect"))
  {
    __int128 v14 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, kMPAuthoringUseTitleEffect);
    __int128 v15 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v15, kMPAuthoringUseImageOnlyTitleEffect);
  }

  unsigned int v170 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "isDynamicForStyleID:",  v13);
  unsigned int v183 = objc_msgSend( -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLive),  "BOOLValue");
  if ([a3 countOfLayers])
  {
    if (-[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLiveReset)) {
      unsigned int v16 = objc_msgSend( -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLiveReset),  "BOOLValue") ^ 1;
    }
    else {
      unsigned int v16 = 1;
    }
    unsigned int v178 = v16;
  }

  else
  {
    unsigned int v178 = 0;
  }

  if (v183)
  {
    -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v178),  @"isSetup");
    __int128 v17 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v17, kMPAuthoringAlwaysIncludeLastTransition);
    if ((v178 & 1) != 0)
    {
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", kMPAuthoringIntroEffectID);
    }

    else
    {
      -[MPWeighter clearAllItems](self->_weighter, "clearAllItems");
      -[MPWeighter clearAllItems](self->_transitionWeighter, "clearAllItems");
    }
  }

  id v181 = (__CFString *)v13;
  if (objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "canCancelAuthoringForStyleID:",  v13)) {
    id v18 = [a3 copy];
  }
  else {
    id v18 = 0LL;
  }
  id v186 = a5;
  unint64_t v19 = +[MPAuthoringUtilities presentationOrderFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "presentationOrderFromOptions:",  a5);
  __int128 v20 = (NSMutableArray *)[a3 videoPaths];
  unint64_t v21 = (unint64_t)+[MPAuthoringUtilities videoPathsRangeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "videoPathsRangeFromOptions:",  v10);
  id v182 = a4;
  id v187 = v10;
  id v188 = v22;
  id v190 = a3;
  double v168 = v18;
  unint64_t v165 = v21;
  if (v21 | (unint64_t)v22)
  {
    unint64_t v23 = v21;
    uint64_t v172 = v22;
    if (&v22[v21] > -[NSMutableArray count](v20, "count")) {
      uint64_t v172 = (char *)-[NSMutableArray count](v20, "count") - v23;
    }
    if (v19 == 4)
    {
      __int128 v20 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[MPAuthoringController shuffleImagesByRating:withOptions:]( self,  "shuffleImagesByRating:withOptions:",  v20,  v10));
    }

    else
    {
      uint64_t v24 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  v23,  v172);
      if (v172) {
        double v25 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[NSMutableArray objectsAtIndexes:](v20, "objectsAtIndexes:", v24));
      }
      else {
        double v25 = (NSMutableArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      }
      __int128 v20 = v25;
    }

    id v26 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLiveMissedImages);
    BOOL v27 = 0;
    if (v26 && v19 != 4)
    {
      __int128 v28 = v26;
      id v184 = [v26 copy];
      if ([v28 count])
      {
        uint64_t v29 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  0,  [v28 count]);
        -[NSMutableArray insertObjects:atIndexes:](v20, "insertObjects:atIndexes:", v28, v29);
      }

      __int128 v30 = (NSMutableArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v203 = 0u;
      __int128 v204 = 0u;
      __int128 v205 = 0u;
      __int128 v206 = 0u;
      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v203,  v210,  16LL);
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v204;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v204 != v34) {
              objc_enumerationMutation(v20);
            }
            uint64_t v36 = *(void *)(*((void *)&v203 + 1) + 8LL * (void)i);
            if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  -[MPDocument absolutePathForAssetAtPath:]( self->_authoredDocument,  "absolutePathForAssetAtPath:",  v36)))
            {
              __int128 v37 = v30;
            }

            else
            {
              __int128 v37 = v31;
            }

            -[NSMutableArray addObject:](v37, "addObject:", v36);
          }

          id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v203,  v210,  16LL);
        }

        while (v33);
      }

      __int128 v38 = +[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v184);
      -[NSMutableSet intersectsSet:]( v38,  "intersectsSet:",  +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));
      __int128 v199 = 0u;
      __int128 v200 = 0u;
      __int128 v201 = 0u;
      __int128 v202 = 0u;
      id v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v199,  v209,  16LL);
      a3 = v190;
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v200;
        do
        {
          for (j = 0LL; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v200 != v41) {
              objc_enumerationMutation(v38);
            }
            -[NSMutableArray removeObject:](v31, "removeObject:", *(void *)(*((void *)&v199 + 1) + 8LL * (void)j));
          }

          id v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v199,  v209,  16LL);
        }

        while (v40);
      }

      -[MPDocument setAuthoringOption:forKey:]( self->_authoredDocument,  "setAuthoringOption:forKey:",  v31,  kMPAuthoringLiveMissedImages);
      BOOL v27 = -[NSMutableArray count](v31, "count") != 0LL;

      __int128 v20 = v30;
      a4 = v182;
      id v10 = v187;
    }

    if (v183)
    {
      id v43 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLiveUseOutro);
      unsigned int v44 = v43 ? [v43 BOOLValue] : 1;
      char v45 = &v172[v165] < objc_msgSend(objc_msgSend(a3, "videoPaths"), "count") || v27;
      if ((v45 & 1) != 0 || !v44)
      {
        id v46 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v46, kMPAuthoringUseLoopTransition);
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", kMPFadeNone, kMPAuthoringOutroEffectID);
        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"hasMoreImages");
      }
    }
  }

  else
  {
    uint64_t v172 = 0LL;
  }

  id v47 = -[NSMutableArray count](v20, "count");
  BOOL v174 = v47 != 0LL;
  int64_t v48 = +[MPAuthoringUtilities minimumNumberOfDynamicSlidesToAddFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumNumberOfDynamicSlidesToAddFromOptions:",  v10);
  if ([a3 loopingMode] == (char *)&dword_4 + 1)
  {
    if ((v170 & 1) != 0)
    {
      BOOL v161 = 1;
      int v167 = 0;
      goto LABEL_76;
    }

    BOOL v161 = 1;
    int v167 = 1;
    __int128 v51 = v188;
  }

  else
  {
    uint64_t v49 = (char *)[a3 loopingMode];
    char v50 = v170;
    int v167 = v170 ^ 1;
    if (v49 != (_BYTE *)&dword_0 + 2) {
      char v50 = 0;
    }
    if ((v50 & 1) != 0)
    {
      BOOL v161 = 1;
      goto LABEL_76;
    }

    BOOL v161 = v49 == (_BYTE *)&dword_0 + 2;
    __int128 v51 = v188;
    if (v49 != (_BYTE *)&dword_0 + 2) {
      __int128 v51 = v172;
    }
  }

  __int128 v52 = (char *)objc_msgSend(objc_msgSend(a3, "videoPaths"), "count");
  if (v51 >= v52) {
    int64_t v48 = (int64_t)v52;
  }
  else {
    int64_t v48 = (int64_t)v51;
  }
LABEL_76:
  uint64_t v53 = v48 - (void)-[NSMutableArray count](v20, "count");
  id v163 = (char *)-[NSMutableArray count](v20, "count");
  id v162 = (char *)objc_msgSend(objc_msgSend(a3, "videoPaths"), "count");
  char v54 = v178;
  if (v47) {
    char v54 = 1;
  }
  unint64_t v176 = v53;
  if ((v54 & 1) != 0)
  {
    if (v53 > 0) {
      unsigned int v55 = v183;
    }
    else {
      unsigned int v55 = 0;
    }
    p_cancelAuthoring = &self->_cancelAuthoring;
    if (v55 != 1)
    {
      uint64_t v160 = -1LL;
      goto LABEL_105;
    }

    id v57 = [a3 videoPaths];
    __int128 v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v59 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMPAuthoringLivePlaceholderIndex);
    if (v59) {
      __int128 v60 = (char *)[v59 integerValue];
    }
    else {
      __int128 v60 = 0LL;
    }
    __int128 v62 = (char *)[v57 count];
    if ((uint64_t)v62 < 1)
    {
      a3 = v190;
    }

    else
    {
      __int128 v63 = v62;
      uint64_t v64 = 0LL;
      do
      {
        id v65 = [v57 objectAtIndex:v60];
        if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  -[MPDocument absolutePathForAssetAtPath:](self->_authoredDocument, "absolutePathForAssetAtPath:", v65)))
        {
          -[NSMutableArray addObject:](v58, "addObject:", v65);
        }

        else
        {
          ++v64;
        }

        a4 = v182;
        id v10 = v187;
        else {
          __int128 v60 = 0LL;
        }
      }

      while (v64 < (uint64_t)v63);
      a3 = v190;
      if (-[NSMutableArray count](v58, "count"))
      {
        -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v58);
        BOOL v174 = 1;
      }

      authoredDocument = self->_authoredDocument;
      __int128 v67 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v60);
      -[MPDocument setAuthoringOption:forKey:]( authoredDocument,  "setAuthoringOption:forKey:",  v67,  kMPAuthoringLivePlaceholderIndex);
    }

    uint64_t v160 = (uint64_t)v60;
  }

  else
  {
    uint64_t v160 = -1LL;
    self->_seed = -1LL;
    __int128 v61 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:userInfo:]( v61,  "postNotificationName:object:userInfo:",  kMPAuthoringNoImagesAvailableNotification[0],  self->_authoredDocument,  0LL);
    BOOL v174 = 0;
  }

  p_cancelAuthoring = &self->_cancelAuthoring;
LABEL_105:
  unsigned int v175 = v183 ^ 1;
  -[MPAuthoringController clearROICache](self, "clearROICache");
  __int128 v197 = 0u;
  __int128 v198 = 0u;
  __int128 v195 = 0u;
  __int128 v196 = 0u;
  id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v195,  v208,  16LL);
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v196;
    do
    {
      for (k = 0LL; k != v69; k = (char *)k + 1)
      {
        if (*(void *)v196 != v70) {
          objc_enumerationMutation(v20);
        }
        -[MPDocument absolutePathForAssetAtPath:]( self->_authoredDocument,  "absolutePathForAssetAtPath:",  *(void *)(*((void *)&v195 + 1) + 8LL * (void)k));
      }

      id v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v195,  v208,  16LL);
    }

    while (v69);
  }

  [a4 setTemporarilyCacheAbsolutePaths:1];
  -[MPAuthoringController cacheROIInformationForImages:withOptions:]( self,  "cacheROIInformationForImages:withOptions:",  v20,  v10);
  id v177 = objc_msgSend(objc_msgSend(a3, "audioPaths"), "mutableCopy");
  p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
  unsigned __int8 v185 = +[MPAuthoringUtilities ignoreClusteringForImages:withOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "ignoreClusteringForImages:withOptions:",  v20,  v10);
  int v166 = v178 ^ 1;
  int v171 = v175 | v178 ^ 1;
  if (v171 != 1)
  {
    unsigned int v75 = 0;
    goto LABEL_142;
  }

  objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
  unsigned int v73 = +[MPAuthoringUtilities replaceAudioPlaylistFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "replaceAudioPlaylistFromOptions:",  v10);
  if (v73)
  {
    objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "removeAllSongs");
    if ([v177 count]) {
      char v74 = v73;
    }
    else {
      char v74 = 0;
    }
    if ((v74 & 1) == 0)
    {
      [v177 count];
      goto LABEL_122;
    }

- (void)upgradeDocument:(id)a3 withOptions:(id)a4
{
}

- (void)upgradeLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a3, "authoredVersionInfo"), "mutableCopy");
  LODWORD(v8) = 1032805417;
  objc_msgSend( v7,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8),  @"authoringVersion");
  [a3 setAuthoredVersionInfo:v7];

  if (v7) {
    [a4 setDocumentAttribute:v7 forKey:kMPDocumentAuthoringVersions[0]];
  }
  objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
}

- (id)effectContainersWithPaths:(id)a3 forDocument:(id)a4 withOptions:(id)a5
{
  id v5 = a5;
  if (!a5) {
    id v5 = [a4 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
  id v9 = -[MPAuthoringController orderImages:withOptions:](self, "orderImages:withOptions:", a3, v5);
  id v10 = -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( self,  "effectContainersWithImages:effects:andOptions:",  v9,  -[MPAuthoringController effectsForImages:withOptions:](self, "effectsForImages:withOptions:", v9, v5),  v5);
  -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  v10,  v5);
  objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlidesInEffectContainers:inDocument:withOptions:",  v10,  a4,  v5);
  -[MPWeighter clearAllItems](self->_weighter, "clearAllItems");
  -[MPAuthoringController cleanup](self, "cleanup");
  return v10;
}

- (id)transitionFromOptions:(id)a3
{
  return -[MPAuthoringController transitionFromOptions:firstEffectContainer:nextEffectContainer:]( self,  "transitionFromOptions:firstEffectContainer:nextEffectContainer:",  a3,  0LL,  0LL);
}

- (void)beatAlignLayers:(id)a3 toAudioPlaylist:(id)a4 forDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a5);
  id v11 = -[MPAuthoringController beatsForAudioPlaylist:withOptions:](self, "beatsForAudioPlaylist:withOptions:", a4, v6);
  if (v11)
  {
    id v12 = v11;
    if ([v11 count])
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v13 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          unsigned int v16 = 0LL;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(a3);
            }
            -[MPAuthoringController beatAlignLayer:toBeats:withOptions:]( self,  "beatAlignLayer:toBeats:withOptions:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v16),  v12,  v6);
            unsigned int v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }

        while (v14);
      }
    }
  }

  -[MPAuthoringController cleanup](self, "cleanup");
}

- (void)scaleDurationsInDocument:(id)a3 withOptions:(id)a4
{
}

- (void)scaleDurationsForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v5 = a5;
  if (objc_msgSend( objc_msgSend(a5, "objectForKey:", kMPAuthoringStyleID),  "isEqualToString:",  @"Places"))
  {
    -[MPAuthoringController scaleDurationsInPlacesForDocument:withOptions:]( self,  "scaleDurationsInPlacesForDocument:withOptions:",  a4,  v5);
    return;
  }

  context = objc_autoreleasePoolPush();
  if (!self->_isAuthoring)
  {
    objc_msgSend(objc_msgSend(a4, "montage", context), "lock");
    [a3 reconnectAll];
    if (v5) {
      goto LABEL_5;
    }
LABEL_33:
    id v5 = objc_msgSend(a3, "authoringOptions", context);
    goto LABEL_5;
  }

  if (!v5) {
    goto LABEL_33;
  }
LABEL_5:
  if (!self->_isAuthoring) {
    -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
  }
  id v7 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v5);
  if (!-[NSMutableDictionary objectForKey:](v7, "objectForKey:", kMPAuthoringAudioDuration))
  {
    objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "duration");
    double v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, kMPAuthoringAudioDuration);
  }

  unsigned int v32 = +[MPAuthoringUtilities alignToBeatsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "alignToBeatsFromOptions:",  v7,  context);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = [a3 layers];
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  id v33 = self;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (!+[MPAuthoringUtilities isLayerEffectAuthoredFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "isLayerEffectAuthoredFromOptions:",  v5))
        {
          unsigned int v16 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v15 zIndex]);
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, kMPAuthoringLayerIndex);
          -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", kMPAuthoringMinimumDuration);
          -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", kMPAuthoringMaximumDuration);
          -[MPAuthoringController scaleDurationsInLayer:withMutableOptions:]( self,  "scaleDurationsInLayer:withMutableOptions:",  v15,  v7);
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration),  "doubleValue");
          double v18 = v17;
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration),  "doubleValue");
          if (v18 >= v13) {
            double v13 = v18;
          }
          if (v19 >= v12) {
            double v20 = v12;
          }
          else {
            double v20 = v19;
          }
          if (v19 <= 0.0) {
            double v20 = v12;
          }
          if (v12 == 0.0) {
            double v12 = v19;
          }
          else {
            double v12 = v20;
          }
          if (v32)
          {
            if ((uint64_t)objc_msgSend(objc_msgSend(a4, "audioPlaylist"), "countOfSongs") >= 1)
            {
              id v21 = -[MPAuthoringController beatsForAudioPlaylist:withOptions:]( self,  "beatsForAudioPlaylist:withOptions:",  [a3 audioPlaylist],  v7);
              if (v21) {
                -[MPAuthoringController beatAlignLayer:toBeats:withOptions:]( self,  "beatAlignLayer:toBeats:withOptions:",  v15,  v21,  v7);
              }
            }
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v10);
  }

  else
  {
    double v12 = 0.0;
    double v13 = 0.0;
  }

  authoredDocument = self->_authoredDocument;
  unint64_t v23 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13);
  -[MPDocument setAuthoringOption:forKey:]( authoredDocument,  "setAuthoringOption:forKey:",  v23,  kMPAuthoringMinimumDuration);
  uint64_t v24 = v33->_authoredDocument;
  double v25 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12);
  -[MPDocument setAuthoringOption:forKey:](v24, "setAuthoringOption:forKey:", v25, kMPAuthoringMaximumDuration);
  id v26 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v26,  kMPAuthoringMinimumDuration);
  BOOL v27 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v27,  kMPAuthoringMaximumDuration);
  -[MPAuthoringController matchDurationsForLayers:withOptions:](v33, "matchDurationsForLayers:withOptions:", obj, v7);
  -[MPAuthoringController fillDurationsForLayers:withOptions:](v33, "fillDurationsForLayers:withOptions:", obj, v7);
  -[MPAuthoringController checkForOffsetsForLayers:withOptions:](v33, "checkForOffsetsForLayers:withOptions:", obj, v7);

  [a3 reconfigureLoopingMode];
  if (!v33->_isAuthoring)
  {
    -[MPAuthoringController cleanup](v33, "cleanup");
    objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
  }

  objc_autoreleasePoolPop(contexta);
}

- (void)reconfigureImagesInDocument:(id)a3 withOptions:(id)a4
{
  if (objc_msgSend( objc_msgSend(objc_msgSend(a3, "documentLayerGroup"), "styleID"),  "isEqualToString:",  @"Places")) {
    -[MPAuthoringController authorDocument:withOptions:](self, "authorDocument:withOptions:", a3, a4);
  }
  else {
    -[MPAuthoringController _reorderImagesInDocument:withOptions:]( self,  "_reorderImagesInDocument:withOptions:",  a3,  a4);
  }
}

- (void)reconfigureTitleEffectInDocument:(id)a3 withOptions:(id)a4
{
}

- (void)reconfigureTitleEffectForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if ((uint64_t)[a3 countOfLayers] >= 1)
  {
    objc_msgSend(objc_msgSend(a4, "montage"), "lock");
    if (!a5) {
      a5 = [a3 authoringOptions];
    }
    id v8 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a5);
    id v9 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "titleEffectLayoutForStyleID:",  v8);
    id v10 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfTitleEffectLayerForStyleID:",  v8);
    id v11 = [a3 layers];
    if (v10 < [v11 count])
    {
      id v12 = objc_msgSend( objc_msgSend(objc_msgSend(v11, "objectAtIndex:", v10), "effectContainers"),  "objectAtIndex:",  0);
      id v13 = [v9 objectForKey:@"backgroundEffect"];
      if (v13) {
        uint64_t v14 = 2LL;
      }
      else {
        uint64_t v14 = 1LL;
      }
      if (v14 <= (uint64_t)[v12 countOfEffects])
      {
        id v15 = objc_msgSend(objc_msgSend(v12, "effects"), "objectAtIndex:", v13 != 0);
        objc_msgSend(v15, "replaceTextsWitStrings:", objc_msgSend(a5, "objectForKey:", kMPAuthoringTitleStrings));
      }
    }

    objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
  }

- (void)reconfigureColorSchemeInDocument:(id)a3 withOptions:(id)a4
{
}

- (void)reconfigureColorSchemeForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if (!a5) {
    a5 = [a3 authoringOptions];
  }
  id v9 = +[MPAuthoringUtilities colorSchemeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "colorSchemeFromOptions:",  a5);
  if (v9)
  {
    id v10 = v9;
    if ([a5 objectForKey:kMPAuthoringBackgroundColor]
      || (id v16 = [v10 objectForKey:@"background"]) == 0)
    {
      id v11 = +[MPAuthoringUtilities backgroundColorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "backgroundColorFromOptions:",  a5);
    }

    else
    {
      id v11 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v16);
    }

    [a3 setBackgroundCGColor:v11];
    id v17 = [v10 objectForKey:@"titleText"];
    if (v17)
    {
      id v18 = v17;
      if ([a5 objectForKeyedSubscript:kMPAuthoringColorScheme])
      {
        id v15 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v18);
LABEL_14:
        -[MPAuthoringController setTitleTextToColor:forLayerGroup:inDocument:withOptions:]( self,  "setTitleTextToColor:forLayerGroup:inDocument:withOptions:",  v15,  a3,  a4,  a5);
      }
    }
  }

  else
  {
    objc_msgSend( a3,  "setBackgroundCGColor:",  +[MPAuthoringUtilities backgroundColorFromOptions:]( MPAuthoringUtilities,  "backgroundColorFromOptions:",  a5));
    id v12 = [a5 objectForKey:kMPAuthoringTitleColor];
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
    {
      id v15 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v12);
      if (v15) {
        goto LABEL_14;
      }
    }
  }

  objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
}

- (BOOL)prepareDocumentForExport:(id)a3 withOptions:(id)a4
{
  id v4 = a4;
  if (!a4) {
    id v4 = [a3 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  id v7 = (char *)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", v4));
  id v8 = (char *)[a3 countOfLayers];
  else {
    id v9 = v7;
  }
  if (((unint64_t)v9 & 0x8000000000000000LL) == 0)
  {
    objc_msgSend(objc_msgSend(a3, "montage"), "lock");
    id v10 = objc_msgSend(objc_msgSend(a3, "layers"), "objectAtIndex:", v9);
    id v11 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "lastObject");
    id v12 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4);
    uint64_t v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, kMPAuthoringLayerIndex);
    if (+[MPAuthoringUtilities exportTransitionIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "exportTransitionIDFromOptions:",  v12))
    {
      id v14 = -[MPAuthoringController exportTransitionFromOptions:](self, "exportTransitionFromOptions:", v12);
      id v15 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
      +[MPAuthoringUtilities exportTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "exportTransitionDurationFromOptions:",  v12);
      double v17 = v16;
      objc_msgSend(v14, "setDuration:");
      [v15 setDuration:v17];
      [v10 addEffectContainer:v15];
      [v11 duration];
      double v19 = v18;
      [v11 introTransitionDuration];
      if (v19 - v20 >= v17)
      {
        objc_msgSend( v11,  "setUserInfoAttribute:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -1.0),  @"savedExportDuration");
      }

      else
      {
        [v11 duration];
        objc_msgSend( v11,  "setUserInfoAttribute:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"savedExportDuration");
        [v11 duration];
        double v22 = v21;
        [v11 duration];
        double v24 = v23;
        [v11 introTransitionDuration];
        [v11 setDuration:v22 + v17 - (v24 - v25)];
      }

      uint64_t v29 = v11;
      id v30 = v14;
      goto LABEL_16;
    }

    id v27 = [v11 countOfEffects];
    id v28 = [v11 transition];
    if (v27)
    {
      if (v28)
      {
        uint64_t v29 = v11;
        id v30 = 0LL;
LABEL_16:
        [v29 setTransition:v30];
LABEL_17:
        if ((char *)+[MPAuthoringUtilities audioScalingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioScalingModeFromOptions:",  v4) == (char *)&dword_0 + 1)
        {
          objc_msgSend( a3,  "setDocumentAttribute:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(a3, "loopingMode")),  @"exportLoopingMode");
          [a3 setLoopingMode:0];
        }

        BOOL v26 = 1;
        __int128 v31 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
        [a3 setDocumentAttribute:v31 forKey:kMPDocumentPreparedForExport[0]];
        -[MPAuthoringController matchDurationsForLayers:withOptions:]( self,  "matchDurationsForLayers:withOptions:",  [a3 layers],  v12);
        -[MPAuthoringController fillDurationsForLayers:withOptions:]( self,  "fillDurationsForLayers:withOptions:",  [a3 layers],  v12);
        goto LABEL_20;
      }
    }

    else if (v28)
    {
      [v28 duration];
      double v34 = v33;
      [v11 setTransition:0];
      [v11 duration];
      objc_msgSend( v11,  "setUserInfoAttribute:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"savedExportDuration");
      [v11 duration];
      [v11 setDuration:v35 - v34];
      goto LABEL_17;
    }

    BOOL v26 = 0;
LABEL_20:
    objc_msgSend(objc_msgSend(a3, "montage"), "unlock");
    return v26;
  }

  return 0;
}

- (void)prepareDocumentForPlayback:(id)a3 withOptions:(id)a4
{
  id v4 = a4;
  if (!a4) {
    id v4 = [a3 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  id v7 = (char *)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", v4));
  id v8 = (char *)[a3 countOfLayers];
  else {
    id v9 = v7;
  }
  if (((unint64_t)v9 & 0x8000000000000000LL) == 0)
  {
    objc_msgSend(objc_msgSend(a3, "montage"), "lock");
    id v10 = [a3 objectInLayersAtIndex:v9];
    if ([v10 countOfEffectContainers])
    {
      id v11 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4);
      id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      uint64_t v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, kMPAuthoringLayerIndex);
      id v14 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "lastObject");
      if ([a3 documentAttributeForKey:@"exportLoopingMode"])
      {
        objc_msgSend( a3,  "setLoopingMode:",  objc_msgSend(objc_msgSend(a3, "documentAttributeForKey:", @"exportLoopingMode"), "integerValue"));
        [a3 setDocumentAttribute:0 forKey:@"exportLoopingMode"];
      }

      unsigned int v15 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeLoopTransitionFromOptions:",  v11);
      id v16 = +[MPAuthoringUtilities exportTransitionIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "exportTransitionIDFromOptions:",  v11);
      if (!v16)
      {
        unsigned int v17 = [v14 countOfEffects] ? v15 : 1;
        if (v17 != 1) {
          goto LABEL_51;
        }
      }

      double v18 = (char *)[v14 index];
      id v19 = [a3 documentAttributeForKey:kMPDocumentPreparedForExport[0]];
      if (v16 && v19 && [v19 BOOLValue])
      {
        id v20 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "objectAtIndex:", v18 - 1);
        objc_msgSend( v10,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v18));
      }

      else
      {
        id v20 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "objectAtIndex:", v18);
      }

      char v21 = objc_opt_respondsToSelector( self->_delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:");
      int v22 = objc_opt_respondsToSelector( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:");
      if ((v21 & 1) != 0)
      {
        int v23 = v22;
        unsigned int v24 = objc_msgSend( self->_delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:",  a3,  v20,  objc_msgSend(v20, "index"),  v9);
        if ((v24 & 1) == 0)
        {
          id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if (((v23 ^ 1) & 1) == 0)
          {
            id v25 = objc_msgSend( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:",  a3,  v20,  objc_msgSend(v20, "index"),  v9);
            if (!v25) {
              goto LABEL_33;
            }
            goto LABEL_30;
          }

- (BOOL)canDocumentFitToAudio:(id)a3 withOptions:(id)a4 requiredAudioDuration:(double *)a5
{
  return -[MPAuthoringController canLayerGroupFitToAudio:inDocument:withOptions:requiredAudioDuration:]( self,  "canLayerGroupFitToAudio:inDocument:withOptions:requiredAudioDuration:",  [a3 documentLayerGroup],  a3,  a4,  a5);
}

- (BOOL)canLayerGroupFitToAudio:(id)a3 inDocument:(id)a4 withOptions:(id)a5 requiredAudioDuration:(double *)a6
{
  id v7 = a5;
  if (!a5) {
    id v7 = [a3 authoringOptions];
  }
  id v10 = objc_alloc_init(&OBJC_CLASS___MPDocument);
  id v11 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7);
  id v12 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, kMPAuthoringAudioScalingMode);
  uint64_t v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, kMPAuthoringRequestGeneratedImages);
  -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", kMPAuthoringLayerTimeScale);
  -[MPDocument setVideoPaths:](v10, "setVideoPaths:", [a3 videoPaths]);
  -[MPDocument setAudioPaths:](v10, "setAudioPaths:", [a3 audioPaths]);
  -[MPDocument _setMediaProperties:](v10, "_setMediaProperties:", [a4 mediaProperties]);
  -[MPDocument setDocumentAttribute:forKey:](v10, "setDocumentAttribute:forKey:", v11, kMPDocumentAuthoringOptions[0]);
  -[MPDocument setAssetKeyDelegate:](v10, "setAssetKeyDelegate:", [a4 assetKeyDelegate]);
  id v14 = objc_alloc_init(&OBJC_CLASS___MPAuthoringController);
  -[MPAuthoringController authorLayerGroup:inDocument:withOptions:]( v14,  "authorLayerGroup:inDocument:withOptions:",  -[MPDocument documentLayerGroup](v10, "documentLayerGroup"),  v10,  v11);

  id v15 = [v7 objectForKey:kMPAuthoringAudioDuration];
  if (v15) {
    [v15 doubleValue];
  }
  else {
    objc_msgSend(-[MPDocument audioPlaylist](v10, "audioPlaylist"), "duration");
  }
  double v17 = v16;
  -[MPDocument videoDuration](v10, "videoDuration");
  if (a6) {
    *a6 = v18;
  }
  BOOL v19 = vabdd_f64(v18, v17) < 1.0;

  return v19;
}

- (BOOL)canScaleToAudioInDocument:(id)a3 withOptions:(id)a4
{
  return -[MPAuthoringController canDocumentFitToAudio:withOptions:requiredAudioDuration:]( self,  "canDocumentFitToAudio:withOptions:requiredAudioDuration:",  a3,  a4,  0LL);
}

- (void)cleanup
{
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPAuthoringController cleanupClusters](self, "cleanupClusters");
  if (v3)
  {
    -[MPWeighter clearAllItems](self->_weighter, "clearAllItems");
    -[MPWeighter clearAllItems](self->_transitionWeighter, "clearAllItems");
    shuffleWeighter = self->_shuffleWeighter;
    if (shuffleWeighter)
    {
      -[MPWeighter clearAllItems](shuffleWeighter, "clearAllItems");

      self->_shuffleWeighter = 0LL;
    }
  }

  cachedROIInformation = self->_cachedROIInformation;
  if (cachedROIInformation)
  {

    self->_cachedROIInformation = 0LL;
  }

  -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", 0LL);
}

- (void)clearROICache
{
  cachedROIInformation = self->_cachedROIInformation;
  if (cachedROIInformation)
  {

    self->_cachedROIInformation = 0LL;
  }

- (void)configureIntroInDocument:(id)a3 withOptions:(id)a4
{
  id v4 = a4;
  if (!objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAuthoringLive), "BOOLValue")
    || !MRIsAppleTV())
  {
LABEL_20:
    id v19 = +[MPAuthoringUtilities introEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "introEffectIDFromOptions:",  v4,  v21,  v22);
    if (v19 && [v19 isEqualToString:kMPFadeInEffect])
    {
      +[MPAuthoringUtilities introDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "introDurationFromOptions:",  v4);
      if (v20 == -1.0) {
        double v20 = 0.5;
      }
      [a3 setFadeInDuration:v20];
    }

    return;
  }

  id v6 = [v4 mutableCopy];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = [a3 layers];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8)
  {

    goto LABEL_20;
  }

  id v10 = v8;
  id v21 = v4;
  id v22 = a3;
  uint64_t v11 = 0LL;
  char v23 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v9);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      {
        double v16 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (char *)i + v11);
        [v6 setObject:v16 forKey:kMPAuthoringLayerIndex];
        if (+[MPAuthoringUtilities useIntroTransition:](&OBJC_CLASS___MPAuthoringUtilities, "useIntroTransition:", v6))
        {
          id v17 = (uint64_t)[v14 countOfEffectContainers] < 1
              ? 0LL
              : [v14 objectInEffectContainersAtIndex:0];
          id v18 = -[MPAuthoringController transitionFromOptions:firstEffectContainer:nextEffectContainer:]( self,  "transitionFromOptions:firstEffectContainer:nextEffectContainer:",  v6,  v17,  v17,  v21,  v22);
          if ((objc_msgSend( objc_msgSend(v18, "transitionID"),  "isEqualToString:",  @"FadeThroughColor") & 1) == 0)
          {
            [v14 setIntroTransition:v18];
            char v23 = 1;
          }
        }
      }
    }

    id v10 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    v11 += (uint64_t)i;
  }

  while (v10);

  id v4 = v21;
  a3 = v22;
  if ((v23 & 1) == 0) {
    goto LABEL_20;
  }
}

- (void)configureOutroInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a4);
  if (v7 && [v7 isEqualToString:kMPFadeOutEffect])
  {
    +[MPAuthoringUtilities outroDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroDurationFromOptions:",  a4);
    if (v8 == -1.0) {
      objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", a4), "duration");
    }
    objc_msgSend(a3, "setFadeOutDuration:");
  }

- (void)setTitleTextToColor:(CGColor *)a3 inDocument:(id)a4 withOptions:(id)a5
{
}

- (void)setTitleTextToColor:(CGColor *)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v23 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager", a3, a4, a5),  "titleEffectLayoutForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a6));
  id v8 = [a4 layers];
  if ([v8 count])
  {
    id obj = objc_msgSend(objc_msgSend(v8, "objectAtIndex:", 0), "effectContainers");
    if ([obj count])
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v24)
      {
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v9 = 0LL;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = v9;
            id v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
            id v11 = [v23 objectForKey:@"backgroundEffect"];
            if (v11) {
              uint64_t v12 = 2LL;
            }
            else {
              uint64_t v12 = 1LL;
            }
            if (v12 <= (uint64_t)[v10 countOfEffects])
            {
              id v13 = objc_msgSend(objc_msgSend(v10, "effects"), "objectAtIndex:", v11 != 0);
              __int128 v26 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              id v14 = [v13 texts];
              id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v27;
                do
                {
                  for (i = 0LL; i != v16; i = (char *)i + 1)
                  {
                    if (*(void *)v27 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    id v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
                    double v20 = -[NSMutableAttributedString initWithAttributedString:]( [NSMutableAttributedString alloc],  "initWithAttributedString:",  [v19 attributedString]);
                    -[NSMutableAttributedString addAttributes:range:]( v20,  "addAttributes:range:",  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a3,  kCTForegroundColorAttributeName),  0LL,  -[NSMutableAttributedString length](v20, "length"));
                    [v19 setAttributedString:v20];
                  }

                  id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
                }

                while (v16);
              }
            }

            uint64_t v9 = v25 + 1;
          }

          while ((id)(v25 + 1) != v24);
          id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }

        while (v24);
      }
    }
  }

- (BOOL)isAuthoring
{
  return self->_isAuthoring;
}

- (id)authoredDocument
{
  return self->_authoredDocument;
}

- (void)setAuthoredDocument:(id)a3
{
  authoredDocument = self->_authoredDocument;
  if (authoredDocument)
  {

    self->_authoredDocument = 0LL;
  }

  if (a3) {
    self->_authoredDocument = (MPDocument *)a3;
  }
}

- (id)_collectVersionInformationFromStyle:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "effectIDsForStyleID:",  a3);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v10);
        id v12 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "versionOfEffectID:",  v11);
        if (v12) {
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v11);
        }
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }

    while (v8);
  }

  [v4 setObject:v5 forKey:@"effectVersions"];

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v14 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "transitionsForStyleID:",  a3);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)v18);
        id v20 = objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "versionOfTransitionID:",  v19);
        if (v20) {
          -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v20, v19);
        }
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v16);
  }

  [v4 setObject:v13 forKey:@"transitionVersions"];

  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v22 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "framesForStyleID:",  a3);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      __int128 v26 = 0LL;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v26);
        id v28 = objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "versionOfFrameID:",  v27);
        if (v28) {
          -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v28, v27);
        }
        __int128 v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }

    while (v24);
  }

  [v4 setObject:v21 forKey:@"frameVersions"];

  id v29 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "versionOfStyleID:",  a3);
  if (v29) {
    [v4 setObject:v29 forKey:@"styleVersion"];
  }
  LODWORD(v30) = 1032805417;
  objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30),  @"authoringVersion");
  return v4;
}

- (id)shuffleImagesByRating:(id)a3 withOptions:(id)a4
{
  unint64_t v7 = v6;
  id v8 = [a3 count];
  else {
    uint64_t v9 = v7;
  }
  if (!self->_shuffleWeighter)
  {
    self->_shuffleWeighter = objc_alloc_init(&OBJC_CLASS___MPWeighter);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v15 = -[MPDocument propertiesForMediaPath:](self->_authoredDocument, "propertiesForMediaPath:", v14);
          objc_msgSend(objc_msgSend(v15, "objectForKey:", kMPMetaDataRating), "floatValue");
          -[MPWeighter addItem:withWeight:andContraints:]( self->_shuffleWeighter,  "addItem:withWeight:andContraints:",  v14,  (uint64_t)(float)(v16 * 100.0),  0LL);
        }

        id v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v11);
    }
  }

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v9 >= 1)
  {
    do
    {
      int64_t v19 = -[MPWeighter getRandomIndex](self->_shuffleWeighter, "getRandomIndex");
      -[NSMutableArray addObject:]( v18,  "addObject:",  objc_msgSend(-[MPWeighter allItems](self->_weighter, "allItems"), "objectAtIndex:", v19));
      -[NSMutableIndexSet addIndex:](v17, "addIndex:", v19);
      -[MPWeighter addIndexToIgnore:](self->_shuffleWeighter, "addIndexToIgnore:", v19);
      --v9;
    }

    while (v9);
  }

  -[MPWeighter ignoreIndices:](self->_shuffleWeighter, "ignoreIndices:", v17);

  return v18;
}

- (id)orderImages:(id)a3 withOptions:(id)a4
{
  if (!+[MPAuthoringUtilities layerHasImagesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerHasImagesFromOptions:",  a4)) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  switch(+[MPAuthoringUtilities presentationOrderFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "presentationOrderFromOptions:",  a4))
  {
    case 0uLL:
      if (!self->_isAuthoring) {
        -[MPAuthoringController setupClustersWithPaths:withOptions:]( self,  "setupClustersWithPaths:withOptions:",  a3,  a4);
      }
      id v8 = +[NSMutableArray arrayWithArray:]( NSMutableArray,  "arrayWithArray:",  objc_msgSend( +[MPClusterController sharedController](MPClusterController, "sharedController"),  "orderedAndPrioritizedSlideClusters"));
      uint64_t v9 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", a3);
      a3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      while (-[NSMutableArray count](v9, "count"))
      {
        if (!-[NSMutableArray count](v8, "count")
          || (id v10 = -[NSMutableArray objectAtIndex:](v8, "objectAtIndex:", 0LL)) == 0LL)
        {
          [a3 addObjectsFromArray:v9];
          -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
          break;
        }

        id v11 = v10;
        id v12 = [v10 allSlides];
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v32;
LABEL_13:
          uint64_t v16 = 0LL;
          while (1)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            if (!-[NSMutableArray containsObject:]( v9,  "containsObject:",  [*(id *)(*((void *)&v31 + 1) + 8 * v16) path])) {
              break;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
              if (v14) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
        }

        else
        {
LABEL_19:
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          id v17 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v28;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v28 != v19) {
                  objc_enumerationMutation(v12);
                }
                __int128 v21 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
                objc_msgSend(a3, "addObject:", objc_msgSend(v21, "path"));
                -[NSMutableArray removeObject:](v9, "removeObject:", [v21 path]);
              }

              id v18 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }

            while (v18);
          }
        }

        -[NSMutableArray removeObject:](v8, "removeObject:", v11);
      }

      if (!self->_isAuthoring) {
        -[MPAuthoringController cleanupClusters](self, "cleanupClusters");
      }
      break;
    case 1uLL:
    case 6uLL:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_AADE8;
      v35[3] = &unk_24E398;
      v35[4] = self;
      a3 = [a3 sortedArrayUsingComparator:v35];
      break;
    case 3uLL:
      id v22 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      id v23 = [a3 mutableCopy];
      __int128 v24 = v23;
      while ([v23 count])
      {
        unint64_t v25 = random();
        unint64_t v26 = v25 % (unint64_t)[v24 count];
        objc_msgSend(v22, "addObject:", objc_msgSend(v24, "objectAtIndex:", v26));
        [v24 removeObjectAtIndex:v26];
        id v23 = v24;
      }

      a3 = v22;
      break;
    default:
      return a3;
  }

  return a3;
}

- (void)authorPlacesWithImages:(id)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v11 = objc_autoreleasePoolPush();
  id v12 = -[MPAuthoringController orderImages:withOptions:](self, "orderImages:withOptions:", a3, a6);
  if ([v12 count])
  {
    id v13 = -[MPAuthoringController createLayersForPlacesForImages:forDocument:withOptions:]( self,  "createLayersForPlacesForImages:forDocument:withOptions:",  v12,  a5,  a6);
    if (!self->_cancelAuthoring)
    {
      id v14 = v13;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = 0LL;
        uint64_t v18 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) setAudioPriority:(char *)i + v17 + 10];
          }

          id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
          v17 += (uint64_t)i;
        }

        while (v16);
      }

      [a4 removeAllLayers];
      [a4 addLayers:v14];
      -[MPAuthoringController scaleDurationsInDocument:withOptions:]( self,  "scaleDurationsInDocument:withOptions:",  a5,  a6);
    }
  }

  else
  {
    [a4 removeAllLayers];
  }

  objc_autoreleasePoolPop(v11);
}

- (void)cacheROIInformationForImages:(id)a3 withOptions:(id)a4
{
  if (!self->_cachedROIInformation)
  {
    self->_cachedROIInformation = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([a3 count])
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x2020000000LL;
      char v11 = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_AB0C8;
      v6[3] = &unk_24E3C0;
      char v7 = 0;
      v6[4] = self;
      v6[5] = &v8;
      [a3 enumerateObjectsWithOptions:1 usingBlock:v6];
      -[NSMutableDictionary setObject:forKey:]( self->_cachedROIInformation,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *((unsigned __int8 *)v9 + 24)),  @"movieExists");
      _Block_object_dispose(&v8, 8);
    }
  }

- (id)effectsForImages:(id)a3 withOptions:(id)a4
{
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = +[MPClusterController sharedController](&OBJC_CLASS___MPClusterController, "sharedController");
  id v9 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  id v180 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  id v171 = +[MPAuthoringUtilities layerIndexFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerIndexFromOptions:",  a4);
  unsigned int v178 = +[MPAuthoringUtilities effectListFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "effectListFromOptions:",  a4);
  unsigned int v10 = +[MPAuthoringUtilities layerHasImagesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerHasImagesFromOptions:",  a4);
  unsigned __int8 v168 = +[MPAuthoringUtilities canRepeatEffectWithPreset:]( &OBJC_CLASS___MPAuthoringUtilities,  "canRepeatEffectWithPreset:",  a4);
  unsigned __int8 v161 = +[MPAuthoringUtilities canRepeatPreset:](&OBJC_CLASS___MPAuthoringUtilities, "canRepeatPreset:", a4);
  unsigned int v167 = +[MPAuthoringUtilities useLargestEffectsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "useLargestEffectsFromOptions:",  a4);
  unsigned int v162 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchEffectsUsingTagsFromOptions:",  a4);
  id v11 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a4);
  id v183 = a3;
  id v12 = [a3 count];
  BOOL v174 = v9;
  uint64_t v159 = v11;
  int64_t v13 = v12 - (_BYTE *)[v9 numberOfSlidesForEffectID:v11];
  if (-[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", @"movieExists")) {
    unsigned int v166 = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_cachedROIInformation,  "objectForKey:",  @"movieExists"),  "BOOLValue");
  }
  else {
    unsigned int v166 = 1;
  }
  unsigned int v14 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "canUseClusteringForStyleID:",  v180);
  unsigned __int8 v15 = objc_msgSend(objc_msgSend(a4, "objectForKey:", @"isSetup"), "BOOLValue");
  id v16 = v7;
  if (v13 < 0) {
    goto LABEL_8;
  }
  if (!v13)
  {
    if (![v183 count])
    {
      int64_t v13 = 0LL;
      goto LABEL_6;
    }

- (BOOL)imagesHaveMovie:(id)a3 start:(int64_t)a4 count:(int64_t)a5
{
  id v9 = [a3 count];
  if (a5 < 1) {
    return 0;
  }
  int64_t v10 = (int64_t)v9;
  int64_t v11 = a5 + a4;
  while (a4 >= v10
       || (objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_cachedROIInformation,  "objectForKey:",  objc_msgSend(a3, "objectAtIndex:", a4)),  "objectForKey:",  @"isMovie"),  "BOOLValue") & 1) == 0)
  {
    if (++a4 >= v11) {
      return 0;
    }
  }

  return 1;
}

- (int64_t)bestCountFromClusterForEffectWithImages:(id)a3 atStartIndex:(int64_t)a4 withWeighter:(id)a5 usedIndex:(int64_t *)a6
{
  id v9 = objc_msgSend( +[MPClusterController sharedController](MPClusterController, "sharedController"),  "slideForPath:",  objc_msgSend(a3, "objectAtIndex:", a4));
  id v10 = objc_msgSend( +[MPClusterController sharedController](MPClusterController, "sharedController"),  "findBestCluster:withMaxEffectSize:idealEffectSize:",  objc_msgSend(v9, "usableSlideClusters"),  objc_msgSend(objc_msgSend(a5, "imageCounts"), "lastIndex"),  4);
  if (!v10) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = [v10 allSlides];
  id v12 = [v11 count];
  int64_t v13 = v12 - (_BYTE *)[v11 indexOfObject:v9];
  -[MPWeighter clearIgnoreIndices](self->_weighter, "clearIgnoreIndices");
  unsigned int v14 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13),  @"numOfImages",  0LL);
  id v15 = [a5 indicesEqualingConstraints:v14];
  if ([v15 count]) {
    id v16 = [a5 getRandomIndexInSubset:v15];
  }
  else {
    id v16 = [a5 getRandomIndexMeetingContraints:v14];
  }
  int64_t v17 = *((void *)objc_msgSend(objc_msgSend(a5, "allConstraints"), "objectAtIndex:", v16) + 1);

  if (a6) {
    *a6 = v17;
  }
  return v17;
}

- (id)findEffectIDInPresetArray:(id)a3 forImages:(id)a4 withOptions:(id)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___MPWeighter);
  -[MPAuthoringController populateWeighter:withEffects:andOptions:]( self,  "populateWeighter:withEffects:andOptions:",  v9,  a3,  a5);
  id v10 = -[MPWeighter imageCounts](v9, "imageCounts");
  if (![v10 lastIndex]) {
    goto LABEL_26;
  }
  if (+[MPAuthoringUtilities ignoreClusteringForImages:withOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "ignoreClusteringForImages:withOptions:",  a4,  a5))
  {
    goto LABEL_14;
  }

  id v11 = -[MPAuthoringController bestCountFromClusterForEffectWithImages:atStartIndex:withWeighter:usedIndex:]( self,  "bestCountFromClusterForEffectWithImages:atStartIndex:withWeighter:usedIndex:",  a4,  0LL,  v9,  0LL);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL
    || (id v12 = -[MPAuthoringController findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:]( self,  "findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:",  v9,  a4,  0LL,  v11,  0LL,  0LL,  0LL)) == 0LL)
  {
LABEL_14:
    id v13 = [v10 lastIndex];
    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
    unint64_t v14 = (unint64_t)v13;
    do
    {
      if ((unint64_t)[a4 count] >= v14) {
        id v12 = -[MPAuthoringController findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:]( self,  "findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:",  v9,  a4,  0LL,  v14,  0LL,  0LL,  0LL);
      }
      else {
        id v12 = 0LL;
      }
      id v15 = [v10 indexLessThanIndex:v14];
      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v14 = (unint64_t)v15;
    }

    while (!v12);
    if (!v12) {
      goto LABEL_26;
    }
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v16 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
LABEL_17:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(a3);
      }
      id v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
      id v21 = [v20 objectForKey:@"presetID"];
      id v22 = [v20 objectForKey:@"backgroundEffect"];
      if (!v22) {
        id v22 = v21;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v20 = 0LL;
        if (v17) {
          goto LABEL_17;
        }
        break;
      }
    }
  }

  else
  {
LABEL_26:
    id v20 = 0LL;
  }

  return v20;
}

- (void)populateWeighter:(id)a3 withEffects:(id)a4 andOptions:(id)a5
{
  if ([a3 count])
  {
    [a3 clearAllItems];
  }

  id v102 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a5);
  double v8 = v7;
  unint64_t v9 = +[MPAuthoringUtilities screenSizeFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "screenSizeFromOptions:", a5);
  unsigned int v90 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchEffectsUsingTagsFromOptions:",  a5);
  id v10 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a5);
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  id v11 = [a4 countByEnumeratingWithState:&v139 objects:v149 count:16];
  if (v11)
  {
    id v12 = v11;
    char v97 = 0;
    uint64_t v103 = *(void *)v140;
    uint64_t v87 = self;
    id v88 = v10;
    unint64_t v89 = v9;
    do
    {
      id v13 = 0LL;
      id v93 = v12;
      do
      {
        if (*(void *)v140 != v103) {
          objc_enumerationMutation(a4);
        }
        unint64_t v14 = *(void **)(*((void *)&v139 + 1) + 8LL * (void)v13);
        id v15 = [v14 objectForKey:@"likelihood"];
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
        if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
        {
          else {
            uint64_t v18 = @"Desktop";
          }
          id v15 = [v15 objectForKey:v18];
        }

        id v19 = [v14 objectForKey:@"presetID"];
        if ([v14 objectForKey:@"backgroundEffect"]) {
          id v19 = [v14 objectForKey:@"backgroundEffect"];
        }
        id v20 = [v14 objectForKey:@"exclusion"];
        id v104 = v15;
        uint64_t v105 = v14;
        if (MRIsAppleTV())
        {
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          id v21 = [v20 countByEnumeratingWithState:&v135 objects:v148 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v136;
            char v24 = 1;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v136 != v23) {
                  objc_enumerationMutation(v20);
                }
                if ([*(id *)(*((void *)&v135 + 1) + 8 * (void)i) isEqualToString:@"AppleTV"]) {
                  char v24 = 0;
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v135 objects:v148 count:16];
            }

            while (v22);
          }

          else
          {
            char v24 = 1;
          }

          int v26 = v24 & 1;
        }

        else
        {
          int v26 = 1;
        }

        switch(v9)
        {
          case 2uLL:
            __int128 v125 = 0u;
            __int128 v126 = 0u;
            __int128 v123 = 0u;
            __int128 v124 = 0u;
            id v35 = [v20 countByEnumeratingWithState:&v123 objects:v145 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v124;
              do
              {
                for (j = 0LL; j != v36; j = (char *)j + 1)
                {
                  if (*(void *)v124 != v37) {
                    objc_enumerationMutation(v20);
                  }
                  v26 &= [*(id *)(*((void *)&v123 + 1) + 8 * (void)j) isEqualToString:@"smallScreen"] ^ 1;
                }

                id v36 = [v20 countByEnumeratingWithState:&v123 objects:v145 count:16];
              }

              while (v36);
            }

            break;
          case 1uLL:
            __int128 v129 = 0u;
            __int128 v130 = 0u;
            __int128 v127 = 0u;
            __int128 v128 = 0u;
            id v31 = [v20 countByEnumeratingWithState:&v127 objects:v146 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v128;
              do
              {
                for (k = 0LL; k != v32; k = (char *)k + 1)
                {
                  if (*(void *)v128 != v33) {
                    objc_enumerationMutation(v20);
                  }
                  v26 &= [*(id *)(*((void *)&v127 + 1) + 8 * (void)k) isEqualToString:@"mediumScreen"] ^ 1;
                }

                id v32 = [v20 countByEnumeratingWithState:&v127 objects:v146 count:16];
              }

              while (v32);
            }

            break;
          case 0uLL:
            __int128 v133 = 0u;
            __int128 v134 = 0u;
            __int128 v131 = 0u;
            __int128 v132 = 0u;
            id v27 = [v20 countByEnumeratingWithState:&v131 objects:v147 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v132;
              do
              {
                for (m = 0LL; m != v28; m = (char *)m + 1)
                {
                  if (*(void *)v132 != v29) {
                    objc_enumerationMutation(v20);
                  }
                  v26 &= [*(id *)(*((void *)&v131 + 1) + 8 * (void)m) isEqualToString:@"largeScreen"] ^ 1;
                }

                id v28 = [v20 countByEnumeratingWithState:&v131 objects:v147 count:16];
              }

              while (v28);
            }

            break;
        }

        id v39 = [v105 objectForKey:@"minAspectRatio"];
        if (v39)
        {
          [v39 floatValue];
          BOOL v41 = v40 <= 1.0 || v8 <= 1.0;
          if ((!v41 || v40 < 1.0 && v8 < 1.0) && v8 < v40 + -0.00999999978) {
            int v26 = 0;
          }
        }

        id v42 = [v105 objectForKey:@"maxAspectRatio"];
        if (!v42
          || (([v42 floatValue], v43 <= 1.0) || v8 <= 1.0) && (v43 >= 1.0 || v8 >= 1.0)
          || v8 <= v43 + 0.00999999978)
        {
          int v44 = v19 ? v26 : 0;
          if (v44 == 1)
          {
            id v45 = v19;
            id v46 = [v102 numOfImagesForEffectPresetID:v19];
            id v47 = objc_alloc_init(&OBJC_CLASS___MPWeighterConstraint);
            uint64_t v99 = (uint64_t)v46;
            v47->numOfImages = (int64_t)v46;
            unsigned __int8 v101 = objc_msgSend(objc_msgSend(v105, "objectForKey:", @"moviesOnly"), "BOOLValue");
            unsigned __int8 v100 = objc_msgSend( objc_msgSend(v105, "objectForKey:", @"ignoreMovies"),  "BOOLValue");
            id v48 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", v45);
            id v49 = [v102 orientationForEffectID:v48];
            uint64_t v50 = v49;
            if ((v8 >= 1.0 || ([v49 isEqualToString:@"landscape"] & 1) == 0)
              && (v8 < 1.0 || ([v50 isEqualToString:@"portrait"] & 1) == 0))
            {
              id v94 = v47;
              id v95 = v45;
              id v96 = v13;
              id v51 = +[MPUtilities presetIDOfCombinedID:](&OBJC_CLASS___MPUtilities, "presetIDOfCombinedID:", v45);
              id v52 = v48;
              id v53 = objc_msgSend( objc_msgSend( v102,  "mediaAspectRatioHintsForEffectID:usingPresetID:defaultAspectRatio:",  v48,  v51,  v8),  "allValues");
              id v54 = [v105 objectForKey:@"aspectRatios"];
              if (v54) {
                id v53 = v54;
              }
              __int128 v119 = 0u;
              __int128 v120 = 0u;
              __int128 v121 = 0u;
              __int128 v122 = 0u;
              id v55 = [v53 countByEnumeratingWithState:&v119 objects:v144 count:16];
              if (v55)
              {
                id v56 = v55;
                int64_t v114 = 0LL;
                uint64_t v57 = 0LL;
                uint64_t v58 = 0LL;
                int64_t v106 = 0LL;
                uint64_t v59 = *(void *)v120;
                do
                {
                  for (n = 0LL; n != v56; n = (char *)n + 1)
                  {
                    if (*(void *)v120 != v59) {
                      objc_enumerationMutation(v53);
                    }
                    [*(id *)(*((void *)&v119 + 1) + 8 * (void)n) floatValue];
                    double v62 = v61;
                    if (v61 >= 1.075 || v62 <= 0.95)
                    {
                      if (v61 >= 3.0)
                      {
                        ++v114;
                      }

                      else if (v62 >= 1.075)
                      {
                        ++v106;
                      }

                      else
                      {
                        ++v58;
                      }
                    }

                    else
                    {
                      ++v57;
                    }
                  }

                  id v56 = [v53 countByEnumeratingWithState:&v119 objects:v144 count:16];
                }

                while (v56);
              }

              else
              {
                int64_t v114 = 0LL;
                uint64_t v58 = 0LL;
                int64_t v106 = 0LL;
              }

              int64_t v92 = v58;
              id v113 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
              id v63 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
              id v64 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  v52);
              __int128 v115 = 0u;
              __int128 v116 = 0u;
              __int128 v117 = 0u;
              __int128 v118 = 0u;
              id v65 = [v64 countByEnumeratingWithState:&v115 objects:v143 count:16];
              if (v65)
              {
                id v66 = v65;
                int64_t v111 = 0LL;
                int64_t v112 = 0LL;
                uint64_t v108 = 0LL;
                int64_t v109 = 0LL;
                int64_t v110 = 0LL;
                int64_t v107 = 0LL;
                uint64_t v67 = 0LL;
                uint64_t v68 = *(void *)v116;
                do
                {
                  for (id ii = 0LL; ii != v66; id ii = (char *)ii + 1)
                  {
                    if (*(void *)v116 != v68) {
                      objc_enumerationMutation(v64);
                    }
                    uint64_t v70 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)ii);
                    switch((unint64_t)objc_msgSend( +[MPEffectManager sharedManager]( MPEffectManager,  "sharedManager"),  "panoTypeForSlideAtIndex:inEffect:forPresetID:",  (char *)ii + v67,  v52,  v51))
                    {
                      case 1uLL:
                        ++v108;
                        break;
                      case 2uLL:
                        ++v112;
                        break;
                      case 3uLL:
                        ++v107;
                        break;
                      case 4uLL:
                        ++v111;
                        break;
                      case 5uLL:
                        ++v110;
                        break;
                      case 6uLL:
                        ++v109;
                        break;
                      default:
                        break;
                    }

                    id v71 = [v70 objectForKey:@"maxBreak"];
                    if (v71) {
                      [v113 addObject:v71];
                    }
                    id v72 = [v70 objectForKey:@"minBreak"];
                    if (v72) {
                      [v63 addObject:v72];
                    }
                  }

                  id v66 = [v64 countByEnumeratingWithState:&v115 objects:v143 count:16];
                  v67 += (uint64_t)ii;
                }

                while (v66);
              }

              else
              {
                int64_t v111 = 0LL;
                int64_t v112 = 0LL;
                uint64_t v108 = 0LL;
                int64_t v109 = 0LL;
                int64_t v110 = 0LL;
                int64_t v107 = 0LL;
              }

              uint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
              if (v99 == 0x7FFFFFFFFFFFFFFFLL)
              {
                int64_t v74 = 0LL;
                int64_t v75 = 0LL;
                int64_t v76 = 0LL;
                int64_t v77 = 0LL;
              }

              else
              {
                if (v99 < 1)
                {
                  int64_t v77 = 0LL;
                  int64_t v74 = v92;
                }

                else
                {
                  uint64_t v78 = 0LL;
                  int64_t v77 = 0LL;
                  int64_t v74 = v92;
                  do
                  {
                    unsigned int v79 = -[MPAuthoringController determineIfSlideDisplayesForTheWholeDurationForEffect:presetID:atIndex:inStyleID:]( v87,  "determineIfSlideDisplayesForTheWholeDurationForEffect:presetID:atIndex:inStyleID:",  v52,  v51,  v78,  v88);
                    if (v99 == 1) {
                      uint64_t v80 = 1LL;
                    }
                    else {
                      uint64_t v80 = v79;
                    }
                    v77 += v80;
                    ++v78;
                  }

                  while (v99 != v78);
                }

                int64_t v76 = v114;
                int64_t v75 = v106;
                uint64_t v73 = v99 - v106 - (v114 + v74);
              }

              unint64_t v9 = v89;
              -[MPWeighterConstraint setNextConstraints:]( v94,  "setNextConstraints:",  [v105 objectForKey:@"nextConstraints"]);
              -[MPWeighterConstraint setPresetID:](v94, "setPresetID:", v51);
              v94->movieCount = v77;
              id v47 = v94;
              v94->moviesOnldouble y = v101;
              v94->ignoreMovies = v100;
              v94->wideLandscape = v76;
              v94->square = v73;
              v94->landscape = v75;
              v94->portrait = v74;
              v94->hPanoramas = v108;
              v94->vPanoramas = v112;
              v94->supportsHPanoramas = v111;
              v94->supportsVPanoramas = v110;
              v94->supportsAllPanoramas = v109;
              v94->allPanoramas = v107;
              BOOL v86 = v108 > 0 || v112 > 0 || v107 > 0 || v111 > 0 || v110 > 0 || v109 > 0;
              v94->hasPanorama = v86;
              -[MPWeighterConstraint setMaxAspectRatios:](v94, "setMaxAspectRatios:", v113);
              -[MPWeighterConstraint setMinAspectRatios:](v94, "setMinAspectRatios:", v63);
              if (v90) {
                -[MPWeighterConstraint setTags:]( v94,  "setTags:",  objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  v52,  v51),  "objectForKey:",  @"startLayoutTags"));
              }
              v97 |= v94->hasPanorama;
              objc_msgSend(a3, "addItem:withWeight:andContraints:", v95, objc_msgSend(v104, "integerValue"), v94);
              id v13 = v96;
            }

            id v12 = v93;
          }
        }

        id v13 = (char *)v13 + 1;
      }

      while (v13 != v12);
      id v12 = [a4 countByEnumeratingWithState:&v139 objects:v149 count:16];
    }

    while (v12);
  }

  else
  {
    char v97 = 0;
  }

  [a3 setIgnorePanoramas:(v97 & 1) == 0];
}

- (void)populateWeighter:(id)a3 withTransitions:(id)a4 andOptions:(id)a5
{
  if ([a3 count])
  {
    [a3 clearAllItems];
  }

  unsigned int v7 = +[MPAuthoringUtilities useTransitionLayoutTagsWithOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "useTransitionLayoutTagsWithOptions:",  a5);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(a4);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          id v21 = objc_alloc_init(&OBJC_CLASS___MPWeighterConstraint);
          if (v7)
          {
            id v26 = objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "attributesForTransitionID:andPresetID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v13),  +[MPUtilities presetIDOfCombinedID:](MPUtilities, "presetIDOfCombinedID:", v13));
            -[MPWeighterConstraint setTags:](v21, "setTags:", [v26 objectForKey:@"tags"]);
            v21->tagsOnSourceOnldouble y = objc_msgSend( objc_msgSend(v26, "objectForKey:", @"tagsOnSourceOnly"),  "BOOLValue");
          }

          id v24 = a3;
          __int128 v25 = v13;
          id v23 = &dword_0 + 1;
          goto LABEL_22;
        }

        id v15 = [v13 objectForKey:@"likelihood"];
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
        if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
        {
          else {
            uint64_t v18 = @"Desktop";
          }
          id v15 = [v15 objectForKey:v18];
        }

        id v19 = [v13 objectForKey:@"presetID"];
        if (v19)
        {
          id v20 = v19;
          id v21 = objc_alloc_init(&OBJC_CLASS___MPWeighterConstraint);
          id v22 = [v13 objectForKey:@"constraints"];
          if (v22) {
            -[MPWeighterConstraint setPresetID:]( v21,  "setPresetID:",  [v22 objectForKey:@"presetID"]);
          }
          id v23 = [v15 integerValue];
          id v24 = a3;
          __int128 v25 = v20;
LABEL_22:
          [v24 addItem:v25 withWeight:v23 andContraints:v21];

          continue;
        }
      }

      id v10 = [a4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v10);
  }

- (id)findEffectIDInWeighter:(id)a3 images:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 triesToFind:(int64_t *)a7 constraints:(id)a8 previousTags:(id)a9
{
  id v12 = [a4 count];
  int64_t v13 = a6 + a5;
  int64_t v42 = a6;
  int64_t v40 = a5;
  if (a6 < 1)
  {
    uint64_t v45 = 0LL;
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v45 = 0LL;
    do
    {
      if (a5 < (uint64_t)v12)
      {
        id v15 = -[NSMutableDictionary objectForKey:]( self->_cachedROIInformation,  "objectForKey:",  [a4 objectAtIndex:a5]);
        v14 += objc_msgSend(objc_msgSend(v15, "objectForKey:", @"canSwitch"), "BOOLValue");
        v45 += objc_msgSend(objc_msgSend(v15, "objectForKey:", @"isMovie"), "BOOLValue");
      }

      ++a5;
    }

    while (a5 < v13);
  }

  float v16 = exp2f((float)v14);
  int64_t v17 = 0LL;
  uint64_t v41 = (uint64_t)v16;
  id v49 = v12;
  do
  {
    int64_t v46 = v17;
    id v51 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if (v42 < 1)
    {
      uint64_t v22 = 0LL;
      uint64_t v47 = 0LL;
      uint64_t v48 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v18 = 0LL;
    }

    else
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v47 = 0LL;
      uint64_t v48 = 0LL;
      uint64_t v22 = 0LL;
      int64_t v23 = v40;
      do
      {
        if (v23 < (uint64_t)v12)
        {
          uint64_t v52 = v20;
          int64_t v24 = v13;
          id v25 = [a4 objectAtIndex:v23];
          id v26 = -[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", v25);
          objc_msgSend(objc_msgSend(v26, "objectForKey:", @"aspectRatio"), "floatValue");
          id v27 = [v26 objectForKey:@"imageAspectRatio"];
          __int128 v28 = self;
          if (v27)
          {
            id v29 = v27;
            [v27 floatValue];
            double v31 = v30;
            [v51 addObject:v29];
            self = v28;
          }

          else
          {
            authoredDocument = self->_authoredDocument;
            if (!authoredDocument)
            {
              NSLog(@"Going to create some bad layouts!!!");
              authoredDocument = self->_authoredDocument;
            }

            -[MPDocument resolutionForPath:](authoredDocument, "resolutionForPath:", v25);
            double v31 = v33 / v34;
            *(float *)&double v33 = v33 / v34;
            objc_msgSend( v51,  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33));
          }

          int64_t v13 = v24;
          id v35 = (char *)objc_msgSend(objc_msgSend(v26, "objectForKey:", @"panoramaType"), "integerValue");
          if (v35 == (_BYTE *)&dword_0 + 2)
          {
            ++v47;
          }

          else if (v35 == (_BYTE *)&dword_0 + 1)
          {
            ++v48;
          }

          v22 += objc_msgSend(objc_msgSend(v26, "objectForKey:", @"fitsInExtraWide"), "BOOLValue");
          objc_msgSend(objc_msgSend(v26, "objectForKey:", @"canSwitch"), "BOOLValue");
          if (v31 > 1.0)
          {
            ++v18;
          }

          else
          {
            ++v19;
            ++v21;
          }

          uint64_t v20 = v52;
          if (v31 > 1.0) {
            uint64_t v20 = v52 + 1;
          }
          id v12 = v49;
        }

        ++v23;
      }

      while (v23 < v13);
    }

    id v36 = [a3 getRandomItemMeetingNumberOfFaceLandscapes:v18 facePortraits:v19 imageLandscapes:v20 imagePortraits:v21 vPanoramas:v47 hPanorama s:v48 movies:v45 fitsInExtraWide:v22 aspectRatios:v51 previousTags:a9];
    uint64_t v37 = v36;
    if (a8
      && v36
      && !objc_msgSend( a3,  "itemAtIndex:meetsContraints:",  objc_msgSend(-[MPWeighter allItems](self->_weighter, "allItems"), "indexOfObject:", v36),  a8))
    {
      uint64_t v37 = 0LL;
    }

    int64_t v17 = v46;
    if (v37) {
      break;
    }
    int64_t v17 = v46 + 1;
  }

  while (v46 + 1 < v41);
  if (a7) {
    *a7 = v17;
  }
  return v37;
}

- (BOOL)determineIfSlideDisplayesForTheWholeDurationForEffect:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 inStyleID:(id)a6
{
  if (objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "hasCustomTimingForEffectID:",  a3))
  {
    objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "allowUserDefinedDurationForStyleID:",  a6);
    if (v10 == 0.0) {
      return 0;
    }
  }

  id v11 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "showTimeScriptForEffectID:atSlideIndex:",  a3,  a5);
  if (!v11) {
    return 1;
  }
  id v12 = v11;
  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  &v23,  &v24,  &v22);
  double v13 = v24 + v23 + v22;
  id v14 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  a4);
  id v15 = objc_alloc(&OBJC_CLASS___NSDictionary);
  float v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23);
  int64_t v17 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24);
  uint64_t v18 = -[NSDictionary initWithObjectsAndKeys:]( v15,  "initWithObjectsAndKeys:",  v16,  @"phaseInDuration",  v17,  @"mainDuration",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22),  @"phaseOutDuration",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13),  @"fullDuration",  0LL);
  uint64_t v19 = +[MPUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MPUtilities,  "executeScript:withHeader:andAttributes:",  v12,  v18,  v14);

  if (!v19) {
    return 1;
  }
  CGSize v20 = CGSizeFromString(v19);
  if (v20.height < 0.0 && v20.width == 0.0) {
    return 1;
  }
  if (v20.height + v20.width > v13) {
    return v20.height == 0.0;
  }
  return 0;
}

- (void)scaleDurationsInLayer:(id)a3 withOptions:(id)a4
{
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerCanSkipScaleCalculation:withOptions:"))
  {
    unsigned int v7 = objc_autoreleasePoolPush();
    +[MPAuthoringUtilities audioDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFromOptions:",  a4);
    double v9 = v8;
    +[MPAuthoringUtilities audioDurationFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFactorFromOptions:",  a4);
    double v11 = v10;
    unint64_t v12 = +[MPAuthoringUtilities audioScalingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioScalingModeFromOptions:",  a4);
    id v13 = [a4 mutableCopy];
    id v14 = v13;
    if ((v11 > -1.0 || v9 > 0.0) && v12 == 1)
    {
      [v13 removeObjectForKey:kMPAuthoringLayerTimeScale];
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  [a3 effectContainers],  v14);
      [a3 setSkipTimeCalculations:0];
      -[MPAuthoringController scaleLayerToMatchAudio:withOptions:](self, "scaleLayerToMatchAudio:withOptions:", a3, v14);
    }

    else
    {
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  [a3 effectContainers],  v14);
      [a3 setSkipTimeCalculations:0];
    }

    objc_autoreleasePoolPop(v7);
  }

- (void)scaleDurationsInLayer:(id)a3 withMutableOptions:(id)a4
{
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerCanSkipScaleCalculation:withOptions:"))
  {
    unsigned int v7 = objc_autoreleasePoolPush();
    +[MPAuthoringUtilities audioDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFromOptions:",  a4);
    double v9 = v8;
    +[MPAuthoringUtilities audioDurationFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFactorFromOptions:",  a4);
    double v11 = v10;
    unint64_t v12 = +[MPAuthoringUtilities audioScalingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioScalingModeFromOptions:",  a4);
    BOOL v13 = v11 > -1.0 || v9 > 0.0;
    BOOL v14 = v12 == 1 && v13;
    id v15 = [a4 mutableCopy];
    float v16 = v15;
    if (v14) {
      [v15 removeObjectForKey:kMPAuthoringLayerTimeScale];
    }
    [a3 setSkipTimeCalculations:1];
    -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  [a3 effectContainers],  v16);

    [a3 setSkipTimeCalculations:0];
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
    if (v17 == 0.0)
    {
      -[MPAuthoringController minimumDurationForLayer:inDocument:withOptions:]( self,  "minimumDurationForLayer:inDocument:withOptions:",  a3,  self->_authoredDocument,  a4);
      uint64_t v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      [a4 setObject:v18 forKeyedSubscript:kMPAuthoringMinimumDuration];
    }

    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
    if (v19 == 0.0)
    {
      -[MPAuthoringController maximumDurationForLayer:inDocument:withOptions:]( self,  "maximumDurationForLayer:inDocument:withOptions:",  a3,  self->_authoredDocument,  a4);
      CGSize v20 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      [a4 setObject:v20 forKeyedSubscript:kMPAuthoringMaximumDuration];
    }

    if (v14) {
      -[MPAuthoringController scaleLayerToMatchAudio:withOptions:](self, "scaleLayerToMatchAudio:withOptions:", a3, a4);
    }
    objc_autoreleasePoolPop(v7);
  }

- (void)scaleDurationsInEffectContainers:(id)a3 withOptions:(id)a4
{
  id v128 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  +[MPAuthoringUtilities durationPerEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "durationPerEffectFromOptions:",  a4);
  double v8 = v7;
  objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", a4), "duration");
  double v107 = v9;
  +[MPAuthoringUtilities layerTimeScaleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerTimeScaleFromOptions:",  a4);
  double v109 = v10;
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumTransitionDurationFromOptions:",  a4);
  double v12 = v11;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a4);
  double v120 = v13;
  unsigned int v119 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchPhasesWithTransitionFromOptions:",  a4);
  unsigned int v106 = +[MPAuthoringUtilities useUniformDurations:](&OBJC_CLASS___MPAuthoringUtilities, "useUniformDurations:", a4);
  id v114 = +[MPAuthoringUtilities idFromPresetID:]( &OBJC_CLASS___MPAuthoringUtilities,  "idFromPresetID:",  +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a4));
  unsigned int v113 = +[MPAuthoringUtilities scaleOutroEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleOutroEffectFromOptions:",  a4);
  objc_msgSend(objc_msgSend(a3, "lastObject"), "outroTransitionDuration");
  double v15 = v14;
  unsigned int v118 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a4);
  +[MPAuthoringUtilities breakDurationScaleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "breakDurationScaleFromOptions:",  a4);
  double v111 = v16;
  +[MPAuthoringUtilities portraitBreakDurationScaleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "portraitBreakDurationScaleFromOptions:",  a4);
  double v110 = v17;
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "allowUserDefinedDurationForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a4));
  double v112 = v18;
  id v19 = +[MPAuthoringUtilities customDurationsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "customDurationsFromOptions:",  a4);
  +[MPAuthoringUtilities baseBreakAspectRatioFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "baseBreakAspectRatioFromOptions:",  a4);
  double v21 = v20;
  +[MPAuthoringUtilities basePortraitBreakAspectRatioFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "basePortraitBreakAspectRatioFromOptions:",  a4);
  double v23 = v22;
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a4);
  double v137 = v24;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  __int128 v162 = 0u;
  id obj = a3;
  id v121 = [a3 countByEnumeratingWithState:&v159 objects:v167 count:16];
  if (v121)
  {
    uint64_t v117 = *(void *)v160;
    double v116 = v8 * v109;
    double v25 = 1.0 / v21;
    if (v23 > 0.0) {
      double v25 = v23;
    }
    double v108 = v25;
    double v26 = v107;
    if (v107 < v12) {
      double v26 = v12;
    }
    double v122 = v26;
    double v135 = v21;
    id v136 = v19;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v160 != v117) {
          objc_enumerationMutation(obj);
        }
        __int128 v28 = *(void **)(*((void *)&v159 + 1) + 8 * v27);
        uint64_t v123 = v27;
        double v124 = v15;
        if (!objc_msgSend(objc_msgSend(v28, "effects"), "count"))
        {
          id v134 = 0LL;
          int v32 = 0;
          int v33 = 0;
          double v34 = 0.0;
          double v35 = 0.0;
          double v36 = v8 * v109;
          double v37 = v120;
          goto LABEL_94;
        }

        id v29 = objc_msgSend(objc_msgSend(v28, "effects"), "objectAtIndex:", 0);
        if ((objc_msgSend(v114, "isEqualToString:", objc_msgSend(v29, "effectID")) ^ 1 | v113) != 1)
        {
          id v134 = 0LL;
          int v38 = 0;
          int v33 = 0;
          double v34 = 0.0;
          double v35 = 0.0;
          double v36 = v8 * v109;
          double v37 = v120;
          goto LABEL_93;
        }

        else {
          objc_msgSend(v128, "defaultFullDurationForEffectID:", objc_msgSend(v29, "effectID", v30));
        }
        double v39 = v109 * v31;
        double v34 = 0.0;
        BOOL v40 = v39 > v116 || v116 < 0.0;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        if (v40) {
          double v36 = v39;
        }
        else {
          double v36 = v8 * v109;
        }
        __int128 v155 = 0uLL;
        __int128 v156 = 0uLL;
        id v125 = [v28 effects];
        id v129 = [v125 countByEnumeratingWithState:&v155 objects:v166 count:16];
        if (!v129)
        {
          LODWORD(v29) = 0;
          BOOL v43 = 0;
          id v134 = 0LL;
          int v139 = 0;
          double v35 = 0.0;
          double v37 = v120;
          goto LABEL_90;
        }

        __int128 v138 = v29;
        LOBYTE(v29) = 0;
        uint64_t v41 = 0LL;
        char v42 = 0;
        LOBYTE(v43) = 0;
        id v134 = 0LL;
        int v139 = 0;
        uint64_t v126 = *(void *)v156;
        __int128 v127 = v28;
        double v35 = 0.0;
        double v37 = v120;
        do
        {
          for (id i = 0LL; i != v129; id i = v72 + 1)
          {
            BOOL v131 = v43;
            double v133 = v37;
            if (*(void *)v156 != v126) {
              objc_enumerationMutation(v125);
            }
            char v132 = (char)v29;
            __int128 v130 = (char *)i;
            uint64_t v45 = *(void **)(*((void *)&v155 + 1) + 8LL * (void)i);
            objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "durationPaddingForEffectID:",  objc_msgSend(v45, "effectID"));
            double v47 = v46;
            __int128 v151 = 0u;
            __int128 v152 = 0u;
            __int128 v153 = 0u;
            __int128 v154 = 0u;
            __int128 v141 = v45;
            id v142 = [v45 slides];
            id v48 = [v142 countByEnumeratingWithState:&v151 objects:v165 count:16];
            if (v48)
            {
              id v49 = v48;
              uint64_t v140 = 0LL;
              uint64_t v50 = *(void *)v152;
              uint64_t v51 = v41;
              do
              {
                for (j = 0LL; j != v49; j = (char *)j + 1)
                {
                  if (*(void *)v152 != v50) {
                    objc_enumerationMutation(v142);
                  }
                  id v53 = *(void **)(*((void *)&v151 + 1) + 8LL * (void)j);
                  id v54 = objc_msgSend(v19, "objectForKeyedSubscript:", objc_msgSend(v53, "path"));
                  if ([v53 hasMovie])
                  {
                    -[MPDocument stopTimeForPath:]( self->_authoredDocument,  "stopTimeForPath:",  [v53 path]);
                    if (v55 == 0.0) {
                      -[MPDocument durationForPath:]( self->_authoredDocument,  "durationForPath:",  [v53 path]);
                    }
                    double v56 = v55;
                    -[MPDocument startTimeForPath:]( self->_authoredDocument,  "startTimeForPath:",  [v53 path]);
                    double v58 = v57;
                    if (self->_logLevel >= 2) {
                      -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_stats,  "objectForKey:",  @"movieCount"),  "integerValue")
                    }
                        + 1),
                        @"movieCount");
                    char v42 = 1;
                  }

                  else if (v54)
                  {
                    [v54 doubleValue];
                    if (v59 >= v36) {
                      double v60 = v59;
                    }
                    else {
                      double v60 = v36;
                    }
                    BOOL v87 = (v51 & 1) == 0;
                    uint64_t v51 = 1LL;
                    if (v87) {
                      double v36 = v59;
                    }
                    else {
                      double v36 = v60;
                    }
                  }

                  else if ((objc_msgSend( +[MPEffectManager sharedManager]( MPEffectManager,  "sharedManager"),  "skipPanoramaScaleForEffectID:",  objc_msgSend(v141, "effectID")) & 1) == 0)
                  {
                    -[MPDocument resolutionForPath:]( self->_authoredDocument,  "resolutionForPath:",  [v53 path]);
                    double v63 = v61 / v62;
                    if (v61 / v62 < 0.5 || v63 > 2.0)
                    {
                      objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:",  objc_msgSend(v138, "effectID"),  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  objc_msgSend(v138, "effectID"),  objc_msgSend(v138, "presetID")),  (char *)j + v140,  v137,  v63);
                      double v66 = v65;
                      if (v63 >= 1.0 || v63 <= v65)
                      {
                        BOOL v68 = v63 > 1.0;
                        if (v63 >= v65) {
                          BOOL v68 = 0;
                        }
                      }

                      else
                      {
                        BOOL v68 = 1;
                      }

                      uint64_t v51 = v51;
                      if (v68 && v135 < 0.0)
                      {
                        id v19 = v136;
                      }

                      else
                      {
                        double v69 = v63 / v65;
                        double v70 = v35 / v34;
                        if ((v139 & 1) == 0) {
                          double v70 = 0.0;
                        }
                        double v71 = v34 / v35;
                        if ((v139 & 1) == 0) {
                          double v71 = 0.0;
                        }
                        if (v63 < 1.0)
                        {
                          double v69 = v66 / v63;
                          double v70 = v71;
                        }

                        id v19 = v136;
                        if (v69 <= v70)
                        {
                          int v139 = 1;
                        }

                        else
                        {
                          if (!v134) {
                            id v134 = [v141 effectID];
                          }
                          int v139 = 1;
                          double v34 = v66;
                          double v35 = v63;
                        }
                      }
                    }
                  }
                }

                id v49 = [v142 countByEnumeratingWithState:&v151 objects:v165 count:16];
                v140 += (uint64_t)j;
              }

              while (v49);
            }

            else
            {
              uint64_t v51 = v41;
            }

            uint64_t v41 = v51;
            if (v131)
            {
              BOOL v43 = 1;
              __int128 v28 = v127;
              double v37 = v133;
              id v72 = v130;
              uint64_t v73 = v141;
              if ((v132 & 1) == 0) {
                goto LABEL_81;
              }
            }

            else
            {
              uint64_t v73 = v141;
              BOOL v43 = (uint64_t)[v141 countOfSlides] > 0;
              __int128 v28 = v127;
              double v37 = v133;
              id v72 = v130;
              if ((v132 & 1) == 0)
              {
LABEL_81:
                LODWORD(v29) = [v73 supportsEffectTiming];
                goto LABEL_84;
              }
            }

            LODWORD(v29) = 1;
LABEL_84:
            objc_msgSend(v128, "minimumEffectDurationForEffectID:", objc_msgSend(v73, "effectID"));
            if (v74 > v37) {
              double v37 = v74;
            }
          }

          id v129 = [v125 countByEnumeratingWithState:&v155 objects:v166 count:16];
        }

        while (v129);
LABEL_90:
        int v75 = v29 ^ 1;
        if (v112 != 0.0) {
          int v75 = 1;
        }
        int v33 = v43 & v75;
        int v38 = v139;
LABEL_93:
        int v32 = v38;
LABEL_94:
        id v76 = [v28 transition];
        if (v76) {
          double v77 = v122;
        }
        else {
          double v77 = 0.0;
        }
        if ((v32 & v118) == 1)
        {
          double v78 = v111;
          if (v110 > 0.0 && v35 < 1.0) {
            double v78 = v110;
          }
          if (v135 >= 0.0)
          {
            double v80 = v35 / v135;
            double v81 = v108 / v35;
          }

          else
          {
            double v80 = v35 / v34;
            double v81 = v34 / v35;
          }

          if (v35 < 1.0) {
            double v80 = v81;
          }
          if (v80 > 1.1)
          {
            double v82 = v78 * v80;
            [v128 panoramaScaleOffsetForEffectID:v134];
            double v36 = v83 + v82 * (v36 - v83);
          }
        }

        if (v33)
        {
          double v84 = v124 + v77;
          if (v36 >= v124 + v77) {
            double v84 = v36;
          }
          if (v84 >= v37) {
            double v85 = v84;
          }
          else {
            double v85 = v37;
          }
          [v28 duration];
          BOOL v87 = v85 <= 0.0 || v85 == v86;
          if (!v87) {
            [v28 setDuration:v85];
          }
        }

        if (v76) {
          objc_msgSend(objc_msgSend(v28, "transition"), "setDuration:", v122);
        }
        if (v119)
        {
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          __int128 v147 = 0u;
          __int128 v148 = 0u;
          id v88 = [v28 effects];
          id v89 = [v88 countByEnumeratingWithState:&v147 objects:v164 count:16];
          if (v89)
          {
            id v90 = v89;
            uint64_t v91 = *(void *)v148;
            do
            {
              for (k = 0LL; k != v90; k = (char *)k + 1)
              {
                if (*(void *)v148 != v91) {
                  objc_enumerationMutation(v88);
                }
                id v93 = *(void **)(*((void *)&v147 + 1) + 8LL * (void)k);
                [v93 setPhaseInDuration:v124];
                [v28 outroTransitionDuration];
                objc_msgSend(v93, "setPhaseOutDuration:");
              }

              id v90 = [v88 countByEnumeratingWithState:&v147 objects:v164 count:16];
            }

            while (v90);
          }
        }

        [v28 outroTransitionDuration];
        double v15 = v94;
        uint64_t v27 = v123 + 1;
      }

      while ((id)(v123 + 1) != v121);
      id v121 = [obj countByEnumeratingWithState:&v159 objects:v167 count:16];
    }

    while (v121);
  }

  if (v106)
  {
    objc_msgSend(objc_msgSend(obj, "lastObject"), "outroTransitionDuration");
    double v96 = v95;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    id v97 = [obj countByEnumeratingWithState:&v143 objects:v163 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v144;
      do
      {
        for (m = 0LL; m != v98; m = (char *)m + 1)
        {
          if (*(void *)v144 != v99) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v101 = *(void **)(*((void *)&v143 + 1) + 8LL * (void)m);
          [v101 outroTransitionDuration];
          double v103 = -(v96 + v102 - v107 * 2.0);
          if (v103 > 0.0)
          {
            [v101 duration];
            [v101 setDuration:v104 - v103];
          }

          [v101 outroTransitionDuration];
          double v96 = v105;
        }

        id v98 = [obj countByEnumeratingWithState:&v143 objects:v163 count:16];
      }

      while (v98);
    }
  }

- (void)matchDurationsForLayers:(id)a3 withOptions:(id)a4
{
  p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
  id v6 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  double v7 = &OBJC_CLASS___MRAnimationPathPhysics;
  id v8 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  v6),  "objectForKey:",  @"layout");
  double v9 = (char *)[a3 count];
  if ((uint64_t)v9 >= 1)
  {
    double v10 = v9;
    double v11 = 0LL;
    id v35 = v8;
    do
    {
      id v12 = objc_msgSend( objc_msgSend(p_cache + 193, "layerDescriptionForLayerWithZIndex:forStyle:", v11, v6),  "objectForKey:",  @"matchDuration");
      if (v12)
      {
        id v13 = v12;
        id v14 = [a3 objectAtIndex:v11];
        id v15 = objc_msgSend(objc_msgSend(&v7[45], "sharedManager"), "layerIDForLayerIndex:ofStyle:", v11, v6);
        if (![v14 layerID]
          || objc_msgSend(v15, "isEqualToString:", objc_msgSend(v14, "layerID")))
        {
          double v16 = (char *)objc_msgSend( objc_msgSend(objc_msgSend(v8, "objectForKey:", v13), "objectForKey:", @"zIndex"),  "integerValue");
          if ((uint64_t)v16 < (uint64_t)v10)
          {
            id v17 = a3;
            objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v16), "duration");
            double v19 = v18;
            [v14 duration];
            double v21 = v20;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            id v22 = [v14 effectContainers];
            id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v37;
              double v26 = v19 / v21;
              do
              {
                for (id i = 0LL; i != v24; id i = (char *)i + 1)
                {
                  if (*(void *)v37 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  __int128 v28 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
                  if ((uint64_t)[v28 countOfEffects] >= 1)
                  {
                    [v28 duration];
                    [v28 setDuration:v26 * v29];
                  }
                }

                id v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
              }

              while (v24);
            }

            [v14 duration];
            p_cache = (void **)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
            a3 = v17;
            double v7 = &OBJC_CLASS___MRAnimationPathPhysics;
            id v8 = v35;
            if (v19 != v30)
            {
              id v31 = objc_msgSend(objc_msgSend(v14, "effectContainers"), "lastObject");
              [v31 duration];
              double v33 = v32;
              [v14 duration];
              [v31 setDuration:v33 + v19 - v34];
            }
          }
        }
      }

      ++v11;
    }

    while (v11 != v10);
  }

- (void)fillDurationsForLayers:(id)a3 withOptions:(id)a4
{
  id v5 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  id v6 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  v5),  "objectForKey:",  @"layout");
  double v7 = (char *)[a3 count];
  if ((uint64_t)v7 >= 1)
  {
    id v8 = v7;
    for (id i = 0LL; i != v8; ++i)
    {
      id v10 = objc_msgSend( +[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:]( MPAuthoringUtilities,  "layerDescriptionForLayerWithZIndex:forStyle:",  i,  v5),  "objectForKey:",  @"fillDuration");
      if (v10)
      {
        id v11 = v10;
        id v12 = [a3 objectAtIndex:i];
        id v13 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIDForLayerIndex:ofStyle:",  i,  v5);
        if (![v12 layerID]
          || objc_msgSend(v13, "isEqualToString:", objc_msgSend(v12, "layerID")))
        {
          id v14 = (char *)objc_msgSend( objc_msgSend(objc_msgSend(v6, "objectForKey:", v11), "objectForKey:", @"zIndex"),  "integerValue");
          if ((uint64_t)v14 < (uint64_t)v8)
          {
            objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v14), "duration");
            double v16 = v15;
            [v12 duration];
            double v18 = v17;
            id v19 = objc_msgSend(objc_msgSend(v12, "effectContainers"), "lastObject");
            if (v19 && (double v20 = v19, !objc_msgSend(objc_msgSend(v19, "effects"), "count")))
            {
              [v20 startTime];
              [v20 setDuration:v18 + v16 - v18 - v22];
            }

            else
            {
              id v21 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
              [v21 setDuration:v16 - v18];
              [v12 addEffectContainer:v21];
            }
          }
        }
      }
    }
  }

- (void)checkForOffsetsForLayers:(id)a3 withOptions:(id)a4
{
  if ([a3 count] == (char *)&dword_0 + 1)
  {
    id v5 = [a3 lastObject];
    if (objc_msgSend(objc_msgSend(v5, "effectContainers"), "count"))
    {
      id v6 = objc_msgSend(objc_msgSend(v5, "effectContainers"), "objectAtIndex:", 0);
      if (!objc_msgSend(objc_msgSend(v6, "effects"), "count") && !objc_msgSend(v6, "transition")) {
        objc_msgSend( v5,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
      }
    }
  }

- (void)beatAlignLayer:(id)a3 toBeats:(id)a4 withOptions:(id)a5
{
  double v10 = v9;
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerCanSkipScaleCalculation:withOptions:",  a3,  a5)
    && v10 > 0.0
    && (char *)+[MPAuthoringUtilities audioScalingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioScalingModeFromOptions:",  a5) == (char *)&dword_0 + 1)
  {
    id v11 = [a4 count];
    +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a5);
    double v13 = v12;
    +[MPAuthoringUtilities minimumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumTransitionDurationFromOptions:",  a5);
    double v15 = v14;
    double v16 = (double)(uint64_t)[a3 countOfEffectContainers];
    BOOL v18 = (double)(unint64_t)[a4 count] * 0.5 <= v16;
    double v17 = (double)(unint64_t)v11 / v10;
    BOOL v18 = v18 || v17 <= v13 - v15;
    if (!v18)
    {
      -[MPAuthoringController scaleLayerToMatchAudio:withBeats:withOptions:]( self,  "scaleLayerToMatchAudio:withBeats:withOptions:",  a3,  a4,  a5,  v17);
      [a3 duration];
      double v17 = vabdd_f64(v20, v10);
      if (v17 > 1.0)
      {
        -[MPAuthoringController beatAlignEffectContainers:toBeats:withOptions:]( self,  "beatAlignEffectContainers:toBeats:withOptions:",  [a3 effectContainers],  a4,  a5);
        -[MPAuthoringController scaleLayerToMatchAudio:withBeats:withOptions:]( self,  "scaleLayerToMatchAudio:withBeats:withOptions:",  a3,  a4,  a5);
        [a3 duration];
        if (vabdd_f64(v17, v10) > 1.0)
        {
          double v21 = v17 - v10;
          +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a5);
          double v23 = v22;
          id v24 = objc_msgSend(objc_msgSend(a3, "effectContainers"), "lastObject");
          [v24 duration];
          double v17 = v25 - v21;
          if (v17 >= v23) {
            objc_msgSend(v24, "setDuration:");
          }
        }
      }
    }

    objc_msgSend(a3, "duration", v17);
    if (vabdd_f64(v19, v10) > 1.0)
    {
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:]( self,  "scaleDurationsInEffectContainers:withOptions:",  [a3 effectContainers],  a5);
      [a3 setSkipTimeCalculations:0];
      -[MPAuthoringController scaleLayerToMatchAudio:withOptions:](self, "scaleLayerToMatchAudio:withOptions:", a3, a5);
    }
  }

- (void)scaleLayerToMatchAudio:(id)a3 withOptions:(id)a4
{
  double v7 = v6;
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumTransitionDurationFromOptions:",  a4);
  double v9 = v8;
  +[MPAuthoringUtilities maximumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "maximumTransitionDurationFromOptions:",  a4);
  double v11 = v10;
  +[MPAuthoringUtilities audioDurationFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "audioDurationFromOptions:", a4);
  double v13 = v12;
  +[MPAuthoringUtilities audioDurationFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFactorFromOptions:",  a4);
  double v15 = v14;
  id v126 = a3;
  [a3 duration];
  double v17 = v16;
  id v141 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  unsigned int v132 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchPhasesWithTransitionFromOptions:",  a4);
  unsigned int v142 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a4);
  id v18 = +[MPAuthoringUtilities customDurationsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "customDurationsFromOptions:",  a4);
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
  double v20 = v19;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
  if (v15 <= -1.0 || v21 <= 0.0)
  {
    if (v13 >= v20)
    {
      if (v21 <= 0.0 || v13 <= v21) {
        double v20 = v13;
      }
      else {
        double v20 = v21;
      }
    }
  }

  else
  {
    double v20 = v20 + (v21 - v20) * v15;
  }

  __int128 v185 = 0u;
  __int128 v186 = 0u;
  __int128 v183 = 0u;
  __int128 v184 = 0u;
  id v23 = [a3 effectContainers];
  id v24 = [v23 countByEnumeratingWithState:&v183 objects:v197 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v184;
    double v27 = 0.0;
    do
    {
      for (id i = 0LL; i != v25; id i = (char *)i + 1)
      {
        if (*(void *)v184 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v183 + 1) + 8 * (void)i) outroTransitionDuration];
        double v27 = v27 + v29;
      }

      id v25 = [v23 countByEnumeratingWithState:&v183 objects:v197 count:16];
    }

    while (v25);
  }

  else
  {
    double v27 = 0.0;
  }

  if (v27 <= v20)
  {
    id v133 = [v126 effectContainers];
    id v58 = [v133 objectAtIndex:0];
    if ([v58 countOfEffects])
    {
      id v125 = 0LL;
      double v59 = 0.0;
    }

    else
    {
      id v125 = v58;
      [v58 duration];
      double v59 = v60;
    }

    id v61 = [v133 lastObject];
    if ((uint64_t)[v61 countOfEffects] >= 1
      && ((id v62 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a4),  v63 = +[MPAuthoringUtilities scaleOutroEffectFromOptions:]( MPAuthoringUtilities,  "scaleOutroEffectFromOptions:",  a4),  !objc_msgSend( v62,  "hasPrefix:",  objc_msgSend(objc_msgSend(objc_msgSend(v61, "effects"), "lastObject"), "effectID")))
       || (v63 & 1) != 0))
    {
      id v65 = 0LL;
    }

    else
    {
      [v61 duration];
      double v59 = v59 + v64;
      id v65 = v61;
    }

    __int128 v169 = 0u;
    __int128 v170 = 0u;
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    id v66 = [v133 countByEnumeratingWithState:&v167 objects:v193 count:16];
    double v67 = 0.0;
    id v124 = v65;
    if (!v66)
    {
      double v70 = 0.0;
      goto LABEL_127;
    }

    id v68 = v66;
    uint64_t v69 = *(void *)v168;
    double v70 = 0.0;
    id v71 = v125;
    uint64_t v120 = *(void *)v168;
    while (1)
    {
      id v72 = 0LL;
      id v122 = v68;
      do
      {
        if (*(void *)v168 != v69) {
          objc_enumerationMutation(v133);
        }
        id v73 = *(id *)(*((void *)&v167 + 1) + 8LL * (void)v72);
        if (v73 != v71 && v73 != v65)
        {
          __int128 v127 = *(void **)(*((void *)&v167 + 1) + 8LL * (void)v72);
          id obja = v72;
          __int128 v165 = 0u;
          __int128 v166 = 0u;
          __int128 v163 = 0u;
          __int128 v164 = 0u;
          id v139 = [v73 effects];
          id v75 = [v139 countByEnumeratingWithState:&v163 objects:v192 count:16];
          if (v75)
          {
            id v76 = v75;
            LOBYTE(v77) = 0;
            int v135 = 0;
            uint64_t v78 = *(void *)v164;
            do
            {
              for (j = 0LL; j != v76; j = (char *)j + 1)
              {
                if (*(void *)v164 != v78) {
                  objc_enumerationMutation(v139);
                }
                double v80 = *(void **)(*((void *)&v163 + 1) + 8LL * (void)j);
                __int128 v159 = 0u;
                __int128 v160 = 0u;
                __int128 v161 = 0u;
                __int128 v162 = 0u;
                id v81 = objc_msgSend(v80, "slides", v120);
                id v82 = [v81 countByEnumeratingWithState:&v159 objects:v191 count:16];
                if (!v82)
                {
LABEL_106:
                  int v86 = 1;
                  if ((v77 & 1) != 0) {
                    goto LABEL_110;
                  }
                  goto LABEL_107;
                }

                id v83 = v82;
                uint64_t v84 = *(void *)v160;
LABEL_100:
                uint64_t v85 = 0LL;
                while (1)
                {
                  if (*(void *)v160 != v84) {
                    objc_enumerationMutation(v81);
                  }
                  if (objc_msgSend( v18,  "objectForKeyedSubscript:",  objc_msgSend(*(id *)(*((void *)&v159 + 1) + 8 * v85), "path")))
                  {
                    break;
                  }

                  if (v83 == (id)++v85)
                  {
                    id v83 = [v81 countByEnumeratingWithState:&v159 objects:v191 count:16];
                    if (!v83) {
                      goto LABEL_106;
                    }
                    goto LABEL_100;
                  }
                }

                int v86 = 0;
                if ((v77 & 1) != 0)
                {
LABEL_110:
                  unsigned int v77 = 1;
                  goto LABEL_111;
                }

- (void)scaleLayerToMatchAudio:(id)a3 withBeats:(id)a4 withOptions:(id)a5
{
  double v10 = v9;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a5);
  double v12 = v11;
  id v113 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  unsigned int v13 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a5);
  [a3 duration];
  id v102 = a4;
  if (v14 < v10)
  {
    id v100 = (char *)[a4 count];
    uint64_t v138 = 0x7FFFFFFFFFFFFFFFLL;
    [a3 duration];
    -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v138);
    uint64_t v97 = v138;
    id v99 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"duration",  1LL);
    uint64_t v103 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v134 = 0u;
    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    id obj = [a3 effectContainers];
    id v109 = [obj countByEnumeratingWithState:&v134 objects:v144 count:16];
    if (!v109) {
      goto LABEL_27;
    }
    id v107 = *(id *)v135;
    while (1)
    {
      for (id i = 0LL; i != v109; id i = (char *)i + 1)
      {
        if (*(id *)v135 != v107) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v134 + 1) + 8LL * (void)i);
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        id v17 = objc_msgSend(v16, "effects", v97);
        id v18 = [v17 countByEnumeratingWithState:&v130 objects:v143 count:16];
        if (v18)
        {
          id v19 = v18;
          double v111 = v16;
          LOBYTE(v20) = 0;
          uint64_t v21 = *(void *)v131;
          while (1)
          {
            for (j = 0LL; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v131 != v21) {
                objc_enumerationMutation(v17);
              }
              id v23 = *(void **)(*((void *)&v130 + 1) + 8LL * (void)j);
              if ((v20 & 1) != 0)
              {
                unsigned int v20 = 1;
              }

              else
              {
                if ((uint64_t)[*(id *)(*((void *)&v130 + 1) + 8 * (void)j) countOfSlides] < 1)
                {
                  unsigned int v20 = 0;
                  continue;
                }

                unsigned int v20 = [v23 hasMovies] ^ 1;
              }

              if ((v13 & v20) == 1)
              {
                if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "skipPanoramaScaleForEffectID:",  objc_msgSend(v23, "effectID"))) {
                  unsigned int v20 = 1;
                }
                else {
                  unsigned int v20 = [v23 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
                }
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v130 objects:v143 count:16];
            if (!v19)
            {
              if (v20) {
                -[NSMutableArray addObject:](v103, "addObject:", v111);
              }
              break;
            }
          }
        }
      }

      id v109 = [obj countByEnumeratingWithState:&v134 objects:v144 count:16];
      if (!v109)
      {
LABEL_27:
        id v24 = -[NSMutableArray sortedArrayUsingDescriptors:]( v103,  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v99, v97));

        if ([v24 count] && (uint64_t)&v100[-v98] >= 1)
        {
          unint64_t v25 = 0LL;
          do
          {
            id v26 = [v24 count];
            unint64_t v27 = v25;
            id v28 = [v24 objectAtIndex:v27];
            __int128 v126 = 0u;
            __int128 v127 = 0u;
            __int128 v128 = 0u;
            __int128 v129 = 0u;
            id v29 = [v28 effects];
            id v30 = [v29 countByEnumeratingWithState:&v126 objects:v142 count:16];
            double v31 = v12;
            if (v30)
            {
              id v32 = v30;
              uint64_t v33 = *(void *)v127;
              double v31 = v12;
              do
              {
                for (id k = 0LL; k != v32; id k = (char *)k + 1)
                {
                  if (*(void *)v127 != v33) {
                    objc_enumerationMutation(v29);
                  }
                  objc_msgSend( v113,  "minimumEffectDurationForEffectID:",  objc_msgSend(*(id *)(*((void *)&v126 + 1) + 8 * (void)k), "effectID"));
                  if (v35 > v31) {
                    double v31 = v35;
                  }
                }

                id v32 = [v29 countByEnumeratingWithState:&v126 objects:v142 count:16];
              }

              while (v32);
            }

            [v28 startTime];
            double v37 = v36;
            [v28 duration];
            -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  v102,  &v138,  v37 + v38);
            if ((char *)v138 != v100 - 1)
            {
              objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138 + 1), "doubleValue");
              double v40 = v39;
              objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138), "doubleValue");
              double v42 = v40 - v41;
              [v28 duration];
              double v44 = v43 + v42;
              [v28 outroTransitionDuration];
              double v46 = v45;
              [v28 introTransitionDuration];
              if (v44 >= v46 + v47)
              {
                if (v44 >= v31) {
                  double v48 = v44;
                }
                else {
                  double v48 = v31;
                }
                [v28 setDuration:v48];
              }
            }

            ++v25;
          }

          while ((char *)v25 != &v100[-v98]);
        }

        return;
      }
    }
  }

  if (v14 > v10)
  {
    double v49 = v14;
    objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "doubleValue");
    double v51 = v50;
    double v52 = v49 - v10 + v50;
    double v53 = (char *)[a4 count];
    int64_t v54 = 0LL;
    if (v51 < v52 && (uint64_t)v53 >= 2)
    {
      int64_t v54 = 0LL;
      double v56 = v53 - 1;
      do
        objc_msgSend(objc_msgSend(a4, "objectAtIndex:", ++v54), "doubleValue");
      while (v57 < v52 && v54 < (uint64_t)v56);
    }

    unint64_t v104 = v54;
    uint64_t v138 = v54;
    id v101 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"duration",  0LL);
    id obja = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    id v108 = [a3 effectContainers];
    id v112 = [v108 countByEnumeratingWithState:&v122 objects:v141 count:16];
    if (v112)
    {
      uint64_t v110 = *(void *)v123;
      do
      {
        for (m = 0LL; m != v112; m = (char *)m + 1)
        {
          if (*(void *)v123 != v110) {
            objc_enumerationMutation(v108);
          }
          double v60 = *(void **)(*((void *)&v122 + 1) + 8LL * (void)m);
          __int128 v118 = 0u;
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          __int128 v121 = 0u;
          id v61 = [v60 effects];
          id v62 = [v61 countByEnumeratingWithState:&v118 objects:v140 count:16];
          if (v62)
          {
            id v63 = v62;
            LOBYTE(v64) = 0;
            uint64_t v65 = *(void *)v119;
            do
            {
              for (n = 0LL; n != v63; n = (char *)n + 1)
              {
                if (*(void *)v119 != v65) {
                  objc_enumerationMutation(v61);
                }
                if ((v64 & 1) != 0)
                {
                  int v64 = 1;
                }

                else
                {
                  double v67 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)n);
                  else {
                    unsigned int v68 = [v67 hasMovies] ^ 1;
                  }
                  if (((v13 ^ 1 | v68) & 1) != 0) {
                    int v64 = v13 | v68;
                  }
                  else {
                    int v64 = [v67 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
                  }
                }
              }

              id v63 = [v61 countByEnumeratingWithState:&v118 objects:v140 count:16];
            }

            while (v63);
            if (v64) {
              -[NSMutableArray addObject:](obja, "addObject:", v60);
            }
          }
        }

        id v112 = [v108 countByEnumeratingWithState:&v122 objects:v141 count:16];
      }

      while (v112);
    }

    uint64_t v69 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[NSMutableArray sortedArrayUsingDescriptors:]( obja,  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v101)));

    if (-[NSMutableArray count](v69, "count"))
    {
      if (v104 <= (unint64_t)-[NSMutableArray count](v69, "count"))
      {
        if (!v104) {
          return;
        }
      }

      else
      {
        double v70 = (char *)(v104 - (void)-[NSMutableArray count](v69, "count"));
        if (v70 >= -[NSMutableArray count](v69, "count")) {
          double v70 = (char *)-[NSMutableArray count](v69, "count") - 1;
        }
        -[NSMutableArray addObjectsFromArray:]( v69,  "addObjectsFromArray:",  -[NSMutableArray objectsAtIndexes:]( v69,  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndexesInRange:", 0LL, v70)));
      }

      unint64_t v71 = 0LL;
      do
      {
        id v72 = -[NSMutableArray count](v69, "count");
        unint64_t v73 = v71;
        id v74 = -[NSMutableArray objectAtIndex:](v69, "objectAtIndex:", v73);
        __int128 v114 = 0u;
        __int128 v115 = 0u;
        __int128 v116 = 0u;
        __int128 v117 = 0u;
        id v75 = [v74 effects];
        id v76 = [v75 countByEnumeratingWithState:&v114 objects:v139 count:16];
        double v77 = v12;
        if (v76)
        {
          id v78 = v76;
          uint64_t v79 = *(void *)v115;
          double v77 = v12;
          do
          {
            for (id ii = 0LL; ii != v78; id ii = (char *)ii + 1)
            {
              if (*(void *)v115 != v79) {
                objc_enumerationMutation(v75);
              }
              objc_msgSend( v113,  "minimumEffectDurationForEffectID:",  objc_msgSend(*(id *)(*((void *)&v114 + 1) + 8 * (void)ii), "effectID"));
              if (v81 > v77) {
                double v77 = v81;
              }
            }

            id v78 = [v75 countByEnumeratingWithState:&v114 objects:v139 count:16];
          }

          while (v78);
        }

        [v74 startTime];
        double v83 = v82;
        [v74 duration];
        -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  v102,  &v138,  v83 + v84);
        if (v138)
        {
          objc_msgSend(objc_msgSend(v102, "objectAtIndex:"), "doubleValue");
          double v86 = v85;
          objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138 - 1), "doubleValue");
          double v88 = v86 - v87;
          [v74 duration];
          double v90 = v89;
          [v74 duration];
          double v92 = v91 - v88;
          [v74 outroTransitionDuration];
          double v94 = v93;
          [v74 introTransitionDuration];
          if (v92 >= v94 + v95)
          {
            double v96 = v90 - v88;
            if (v90 - v88 < v77) {
              double v96 = v77;
            }
            [v74 setDuration:v96];
          }
        }

        ++v71;
      }

      while (v71 != v104);
    }
  }

- (void)beatAlignEffectContainers:(id)a3 toBeats:(id)a4 withOptions:(id)a5
{
  id v82 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  unsigned __int8 v81 = +[MPAuthoringUtilities lockTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "lockTransitionDurationFromOptions:",  a5);
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumTransitionDurationFromOptions:",  a5);
  double v78 = v9;
  +[MPAuthoringUtilities maximumTransitionDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "maximumTransitionDurationFromOptions:",  a5);
  double v77 = v10;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a5);
  double v90 = v11;
  unsigned int v80 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchPhasesWithTransitionFromOptions:",  a5);
  unsigned int v85 = +[MPAuthoringUtilities canAdjustPhaseDurations:]( &OBJC_CLASS___MPAuthoringUtilities,  "canAdjustPhaseDurations:",  a5);
  unsigned int v12 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a5);
  id v79 = [a4 count];
  uint64_t v99 = 0LL;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id obj = a3;
  id v89 = [a3 countByEnumeratingWithState:&v95 objects:v101 count:16];
  if (v89)
  {
    double v87 = 0LL;
    uint64_t v88 = *(void *)v96;
    do
    {
      for (id i = 0LL; i != v89; id i = (char *)i + 1)
      {
        if (*(void *)v96 != v88) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        id v15 = [v14 effects];
        id v16 = [v15 countByEnumeratingWithState:&v91 objects:v100 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v92;
          while (2)
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v92 != v18) {
                objc_enumerationMutation(v15);
              }
              unsigned int v20 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)j);
              if (([v20 hasMovies] & 1) != 0
                || v12 && ([v20 hasPanoramasInDocument:self->_authoredDocument] & 1) != 0)
              {
                [v14 countOfEffects];
                goto LABEL_80;
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v91 objects:v100 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        if ((uint64_t)[v14 countOfEffects] >= 1)
        {
          id v21 = objc_msgSend(objc_msgSend(v14, "effects"), "objectAtIndex:", 0);
          objc_msgSend(v82, "minimumEffectDurationForEffectID:", objc_msgSend(v21, "effectID"));
          if (v22 <= v90) {
            double v23 = v90;
          }
          else {
            double v23 = v22;
          }
          [v14 startTime];
          double v25 = v24;
          [v21 mainDuration];
          double v27 = v26;
          [v21 phaseInDuration];
          double v29 = v28;
          [v21 phaseOutDuration];
          double v31 = v30;
          [v14 outroTransitionDuration];
          double v83 = v32;
          if (v29 == 0.0) {
            unsigned int v33 = 0;
          }
          else {
            unsigned int v33 = v85;
          }
          double v34 = v25 + v29;
          if (v33 == 1)
          {
            -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v99,  v25 + v29);
            double v34 = v35;
          }

          -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v99,  v27 + v34);
          double v37 = v36;
          if (v31 == 0.0) {
            unsigned int v38 = 0;
          }
          else {
            unsigned int v38 = v85;
          }
          double v39 = v31 + v36;
          if (v38 == 1)
          {
            -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v99,  v31 + v36);
            double v39 = v40;
          }

          uint64_t v41 = v99;
          if (v29 == 0.0) {
            double v42 = 0.0;
          }
          else {
            double v42 = v34 - v25;
          }
          double v43 = v37 - v42 - v25;
          if (v31 == 0.0) {
            double v44 = 0.0;
          }
          else {
            double v44 = v39 - v43 - v42 - v25;
          }
          double v84 = v42;
          double v45 = v42 + v43 + v44;
          if (v45 >= v23)
          {
            double v58 = v42;
          }

          else
          {
            if (v99 + 1 < (uint64_t)v79)
            {
              uint64_t v46 = v99 + 2;
              do
              {
                objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v46 - 1), "doubleValue");
                double v48 = v47;
                objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v99), "doubleValue");
                double v50 = v48 - v49;
                double v51 = v37 + v50;
                double v52 = v43 + v50;
                double v53 = v45 + v50;
                BOOL v54 = v53 >= v23 || v46 < (uint64_t)v79;
                double v55 = v90 - v53;
                if (v54) {
                  double v55 = -0.0;
                }
                double v43 = v52 + v55;
                double v45 = v53 + v55;
                double v37 = v51 + v55;
              }

              while (v53 + v55 < v23 && v46++ < (uint64_t)v79);
            }

            if (v31 != 0.0)
            {
              -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v99,  v31 + v37);
              double v37 = v57;
            }

            double v58 = v84;
            if (v31 == 0.0) {
              double v44 = 0.0;
            }
            else {
              double v44 = v37 - v43 - v84 - v25;
            }
            uint64_t v41 = v99;
            double v39 = v37;
          }

          objc_msgSend(objc_msgSend(a4, "lastObject"), "doubleValue");
          if (v39 >= v59) {
            return;
          }
          id v60 = [v14 transition];
          if (v60) {
            char v61 = v81;
          }
          else {
            char v61 = 1;
          }
          if ((v61 & 1) == 0)
          {
            id v62 = v60;
            -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:]( self,  "findClosestBeatForTime:inBeats:atIndex:",  a4,  &v99,  v39 - v83);
            double v64 = vabdd_f64(v39, v63);
            objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "beatStrengthForTransitionID:",  objc_msgSend(v62, "transitionID"));
            BOOL v66 = vabdd_f64(v83, v64) > v65 * 0.4 + 0.1 || v64 < v78;
            if (!v66 && v64 <= v77) {
              [v62 setDuration:v64];
            }
          }

          double v68 = v58 + v43 + v44;
          [v14 outroTransitionDuration];
          double v70 = v69;
          [v14 introTransitionDuration];
          if (v68 < v70 + v71)
          {
            [v14 outroTransitionDuration];
            double v73 = v72;
            [v14 introTransitionDuration];
            double v43 = v43 + v73 + v74 - v68;
          }

          if (v80)
          {
            [v14 introTransitionDuration];
            objc_msgSend(v21, "setPhaseInDuration:");
            [v21 setMainDuration:v43];
            [v14 outroTransitionDuration];
            double v44 = v75;
          }

          else
          {
            [v21 setPhaseInDuration:v58];
            [v21 setMainDuration:v43];
          }

          [v21 setPhaseOutDuration:v44];
          double v76 = (double)v41;
          double v87 = (_BYTE *)(uint64_t)v76;
        }

- (double)minimumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  double v8 = v7;
  unsigned int v42 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a5);
  id v41 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  id v9 = +[MPAuthoringUtilities customDurationsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "customDurationsFromOptions:",  a5);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = [a3 effectContainers];
  id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v52;
    double v10 = 0.0;
    while (1)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v37 = v11;
        unsigned int v38 = v12;
        id v40 = [v12 effects];
        id v13 = [v40 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v13)
        {
          id v14 = v13;
          char v15 = 0;
          uint64_t v16 = *(void *)v48;
          double v17 = v8;
          while (1)
          {
            for (id i = 0LL; i != v14; id i = (char *)i + 1)
            {
              if (*(void *)v48 != v16) {
                objc_enumerationMutation(v40);
              }
              id v19 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              id v20 = [v19 slides];
              id v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v44;
LABEL_13:
                uint64_t v24 = 0LL;
                while (1)
                {
                  if (*(void *)v44 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  if (objc_msgSend( v9,  "objectForKeyedSubscript:",  objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v24), "path")))
                  {
                    break;
                  }

                  if (v22 == (id)++v24)
                  {
                    id v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
                    if (v22) {
                      goto LABEL_13;
                    }
                    goto LABEL_19;
                  }
                }

                int v25 = 0;
                if ((v15 & 1) == 0) {
                  goto LABEL_20;
                }
LABEL_23:
                unsigned int v26 = 1;
                goto LABEL_24;
              }

- (double)maximumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  double v8 = v7;
  +[MPAuthoringUtilities audioDurationFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "audioDurationFactorFromOptions:",  a5);
  double v10 = v9;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "minimumEffectDurationFromOptions:",  a5);
  double v12 = v11;
  unsigned int v53 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "scaleEffectsForPanoramasFromOptions:",  a5);
  id v52 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  id v13 = +[MPAuthoringUtilities customDurationsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "customDurationsFromOptions:",  a5);
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v14 = [a3 effectContainers];
  id v15 = [v14 countByEnumeratingWithState:&v66 objects:v73 count:16];
  double v16 = 0.0;
  double v17 = 0.0;
  if (v15)
  {
    id v18 = v15;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (id i = 0LL; i != v18; id i = (char *)i + 1)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v66 + 1) + 8 * (void)i) outroTransitionDuration];
        double v17 = v17 + v21;
      }

      id v18 = [v14 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }

    while (v18);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = [a3 effectContainers];
  id v47 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v63;
    double v16 = 0.0;
    do
    {
      uint64_t v22 = 0LL;
      do
      {
        if (*(void *)v63 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v62 + 1) + 8 * v22);
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v48 = v23;
        uint64_t v49 = v22;
        id v51 = [v23 effects];
        id v24 = [v51 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (!v24) {
          goto LABEL_45;
        }
        id v25 = v24;
        LOBYTE(v26) = 0;
        uint64_t v27 = *(void *)v59;
        double v28 = v12;
        while (2)
        {
          for (j = 0LL; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v59 != v27) {
              objc_enumerationMutation(v51);
            }
            double v30 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
            __int128 v54 = 0u;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            id v31 = [v30 slides];
            id v32 = [v31 countByEnumeratingWithState:&v54 objects:v70 count:16];
            if (v32)
            {
              id v33 = v32;
              uint64_t v34 = *(void *)v55;
LABEL_20:
              uint64_t v35 = 0LL;
              while (1)
              {
                if (*(void *)v55 != v34) {
                  objc_enumerationMutation(v31);
                }
                if (objc_msgSend( v13,  "objectForKeyedSubscript:",  objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * v35), "path")))
                {
                  break;
                }

                if (v33 == (id)++v35)
                {
                  id v33 = [v31 countByEnumeratingWithState:&v54 objects:v70 count:16];
                  if (v33) {
                    goto LABEL_20;
                  }
                  goto LABEL_26;
                }
              }

              int v36 = 0;
              if ((v26 & 1) == 0) {
                goto LABEL_27;
              }
LABEL_30:
              unsigned int v26 = 1;
              goto LABEL_31;
            }

- (void)configureFiltersInDocument:(id)a3 withOptions:(id)a4
{
  int v50 = objc_opt_respondsToSelector( self->_delegate,  "document:shouldUseDefaultFiltersForSlide:effectIndex:containerIndex:layerIndex:");
  int v7 = objc_opt_respondsToSelector( self->_delegate,  "document:needsFiltersForSlide:effectIndex:containerIndex:layerIndex:");
  id v32 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a4);
  id v47 = a4;
  id v40 = +[MPAuthoringUtilities reconfigureRangeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reconfigureRangeFromOptions:",  a4);
  NSUInteger range1 = v8;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v49 = a3;
  id obj = [a3 layers];
  id v33 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v33)
  {
    *(_DWORD *)&v48[8] = 0;
    NSUInteger v46 = 0LL;
    uint64_t v31 = *(void *)v64;
    *(void *)__int128 v48 = v7 ^ 1u;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
        double v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)&v48[4]);
        -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v11, kMPAuthoringLayerIndex);
        unsigned int v12 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeSlideFiltersFromOptions:",  v32);
        uint64_t v34 = v9;
        if (((v12 | v50) & 1) != 0)
        {
          unsigned int v13 = v12;
          id v14 = [v10 effectContainers];
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v35 = v14;
          id v37 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v37)
          {
            uint64_t v15 = 0LL;
            uint64_t v36 = *(void *)v60;
            do
            {
              uint64_t v16 = 0LL;
              do
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v38 = v16;
                double v17 = *(void **)(*((void *)&v59 + 1) + 8 * v16);
                __int128 v55 = 0u;
                __int128 v56 = 0u;
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                id v39 = [v17 effects];
                id v42 = [v39 countByEnumeratingWithState:&v55 objects:v68 count:16];
                if (v42)
                {
                  uint64_t v18 = 0LL;
                  uint64_t v41 = *(void *)v56;
                  do
                  {
                    uint64_t v19 = 0LL;
                    do
                    {
                      if (*(void *)v56 != v41) {
                        objc_enumerationMutation(v39);
                      }
                      uint64_t v44 = v19;
                      id v20 = *(void **)(*((void *)&v55 + 1) + 8 * v19);
                      NSUInteger v45 = (NSUInteger)objc_msgSend(objc_msgSend(v20, "slides"), "count");
                      if (!range1
                        || (v71.NSUInteger location = (NSUInteger)v40,
                            v71.NSUInteger length = range1,
                            v72.NSUInteger length = v45,
                            v72.NSUInteger location = v46,
                            NSIntersectionRange(v71, v72).length))
                      {
                        __int128 v53 = 0u;
                        __int128 v54 = 0u;
                        __int128 v51 = 0u;
                        __int128 v52 = 0u;
                        id v21 = [v20 slides];
                        id v22 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                        if (v22)
                        {
                          id v23 = v22;
                          uint64_t v24 = *(void *)v52;
                          do
                          {
                            for (id i = 0LL; i != v23; id i = (char *)i + 1)
                            {
                              if (*(void *)v52 != v24) {
                                objc_enumerationMutation(v21);
                              }
                              unsigned int v26 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
                              if ((v50 & 1) != 0)
                              {
                                unsigned int v27 = [self->_delegate document:v49 shouldUseDefaultFiltersForSlide:*(void *)(*((void *)&v51 + 1) + 8 * (void)i) effectIndex:v18 containerIndex:v15 layerIndex:*(void *)&v48[4]];
                                if (((v27 | *(_DWORD *)v48) & 1) == 0)
                                {
                                  id v28 = [self->_delegate document:v49 needsFiltersForSlide:v26 effectIndex:v18 containerIndex:v15 layerIndex:*(void *)&v48[4]];
                                  goto LABEL_30;
                                }
                              }

                              else
                              {
                                unsigned int v27 = 1;
                              }

                              if ((v13 & v27) != 1) {
                                continue;
                              }
                              id v28 = -[MPAuthoringController filtersForSlideFromOptions:]( self,  "filtersForSlideFromOptions:",  v47);
LABEL_30:
                              id v29 = v28;
                              if (v28 && [v28 count]) {
                                [v26 addFilters:v29];
                              }
                            }

                            id v23 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                          }

                          while (v23);
                        }
                      }

                      v46 += v45;
                      ++v18;
                      uint64_t v19 = v44 + 1;
                    }

                    while ((id)(v44 + 1) != v42);
                    id v42 = [v39 countByEnumeratingWithState:&v55 objects:v68 count:16];
                  }

                  while (v42);
                }

                ++v15;
                uint64_t v16 = v38 + 1;
              }

              while ((id)(v38 + 1) != v37);
              id v37 = [v35 countByEnumeratingWithState:&v59 objects:v69 count:16];
            }

            while (v37);
          }
        }

        ++*(void *)&v48[4];
        uint64_t v9 = v34 + 1;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    }

    while (v33);
  }
}

- (void)configureTransitionsInDocument:(id)a3 withOptions:(id)a4
{
  char v7 = objc_opt_respondsToSelector( self->_delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:");
  int v8 = objc_opt_respondsToSelector( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:");
  id v39 = a4;
  unsigned int v33 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeTransitionsFromOptions:",  a4);
  if ((v33 & 1) != 0 || (v7 & 1) != 0)
  {
    uint64_t v9 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a4);
    id v40 = +[MPAuthoringUtilities reconfigureRangeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reconfigureRangeFromOptions:",  a4);
    unint64_t v11 = v10;
    unsigned __int8 v12 = objc_msgSend(objc_msgSend(a4, "objectForKey:", @"keepTransitions"), "BOOLValue");
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v35 = a3;
    id obj = [a3 layers];
    id v13 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (!v13) {
      goto LABEL_43;
    }
    id v14 = v13;
    unint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v31 = *(void *)v48;
    int v34 = v8 ^ 1;
    id v28 = v9;
    while (1)
    {
      uint64_t v17 = 0LL;
      id v29 = v14;
      do
      {
        if (*(void *)v48 != v31)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(obj);
          uint64_t v17 = v18;
        }

        uint64_t v32 = v17;
        uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
        id v20 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16, v28);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v20, kMPAuthoringLayerIndex);
        if (+[MPAuthoringUtilities canHaveTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "canHaveTransitionsFromOptions:",  v9))
        {
          uint64_t v38 = v16;
          id v21 = [v19 effectContainers];
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id v42 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (!v42) {
            goto LABEL_40;
          }
          id v22 = 0LL;
          uint64_t v41 = *(void *)v44;
          id v36 = v21;
          id v37 = v19;
          while (1)
          {
            for (id i = 0LL; i != v42; id i = (char *)i + 1)
            {
              if (*(void *)v44 != v41) {
                objc_enumerationMutation(v21);
              }
              uint64_t v24 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              if ([v24 transition]) {
                unsigned __int8 v25 = v12;
              }
              else {
                unsigned __int8 v25 = 0;
              }
              if ((v25 & 1) == 0)
              {
                if ((v7 & 1) != 0)
                {
                  unsigned int v26 = [self->_delegate document:v35 shouldUseDefaultTransitionForEffectContainer:v24 containerIndex:v22 layerIndex:v38];
                  if (((v26 | v34) & 1) != 0)
                  {
                    id v21 = v36;
                    uint64_t v19 = v37;
                    if (v26) {
                      goto LABEL_24;
                    }
LABEL_37:
                    ++v15;
                    ++v22;
                    continue;
                  }

                  id v21 = v36;
                  uint64_t v19 = v37;
                  if (![self->_delegate document:v35 needsTransitionForEffectContainer:v24 containerIndex:v22 layerIndex:v38]) {
                    goto LABEL_37;
                  }
                }

                else
                {
LABEL_24:
                  if (v22 == (char *)objc_msgSend(objc_msgSend(v19, "effectContainers"), "count") - 1
                    && +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeLoopTransitionFromOptions:",  v39))
                  {
                    id v27 = -[MPAuthoringController loopTransitionFromOptions:](self, "loopTransitionFromOptions:", v39);
                  }

                  else
                  {
                    if (v22 == (char *)objc_msgSend(objc_msgSend(v19, "effectContainers"), "count") - 1)
                    {
                      if ((v33 & +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeLoopTransitionFromOptions:",  v39) & 1) == 0) {
                        goto LABEL_37;
                      }
                    }

                    else if (!v33)
                    {
                      goto LABEL_37;
                    }

                    id v27 = -[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", v39);
                  }

                  if (!v27) {
                    goto LABEL_37;
                  }
                }

                objc_msgSend(v24, "setTransition:");
                goto LABEL_37;
              }
            }

            id v42 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (!v42)
            {
LABEL_40:
              uint64_t v16 = v38 + 1;
              uint64_t v9 = v28;
              id v14 = v29;
              break;
            }
          }
        }

        uint64_t v17 = v32 + 1;
      }

      while ((id)(v32 + 1) != v14);
      id v14 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (!v14)
      {
LABEL_43:

        return;
      }
    }
  }

- (id)createLayerWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5
{
  id v9 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a5);
  int64_t v10 = +[MPAuthoringUtilities layerIndexFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerIndexFromOptions:", a5);
  id v11 = +[MPLayer layer](&OBJC_CLASS___MPLayer, "layer");
  id v12 = objc_msgSend( -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( self,  "effectContainersWithImages:effects:andOptions:",  a3,  a4,  a5),  "mutableCopy");
  +[MPAuthoringUtilities layerOffsetFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerOffsetFromOptions:", a5);
  if (v13 != 0.0)
  {
    double v14 = v13;
    id v15 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
    [v15 setDuration:v14];
    [v12 insertObject:v15 atIndex:0];
  }

  [v11 addEffectContainers:v12];

  id v16 = -[MPAuthoringController filtersForLayerFromOptions:](self, "filtersForLayerFromOptions:", a5);
  if ([v16 count]) {
    [v11 addFilters:v16];
  }
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultSizeForZIndex:ofStyle:",  v10,  v9);
  objc_msgSend(v11, "setSize:");
  objc_msgSend( v11,  "setLayerID:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIDForLayerIndex:ofStyle:",  v10,  v9));
  return v11;
}

- (id)slidesWithImages:(id)a3 andOptions:(id)a4
{
  id v7 = [a3 count];
  unsigned int v8 = +[MPAuthoringUtilities shouldComputeFramesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeFramesFromOptions:",  a4);
  unsigned __int8 v9 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeSlideFiltersFromOptions:",  a4);
  int64_t v26 = +[MPAuthoringUtilities layerIndexFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerIndexFromOptions:", a4);
  +[MPAuthoringUtilities movieVolumeFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "movieVolumeFromOptions:", a4);
  double v11 = v10;
  unsigned int v27 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldDuckMoviesFromOptions:",  a4);
  id v29 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a4);
  id delegate = self->_delegate;
  if (delegate)
  {
    char v13 = objc_opt_respondsToSelector( delegate,  "document:shouldUseDefaultFiltersForSlide:effectIndex:containerIndex:layerIndex:");
    int v28 = objc_opt_respondsToSelector( self->_delegate,  "document:needsFiltersForSlide:effectIndex:containerIndex:layerIndex:");
  }

  else
  {
    int v28 = 0;
    char v13 = 0;
  }

  id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v15 = [a4 objectForKey:kMPAuthoringCachedAbsolutePaths];
  if ((uint64_t)v7 >= 1)
  {
    id v16 = v15;
    uint64_t v17 = 0LL;
    char v18 = v9 | v13;
    while (1)
    {
      uint64_t v19 = -[MPSlide initWithPath:]( [MPSlide alloc],  "initWithPath:",  [a3 objectAtIndex:v17]);
      if (v16) {
        -[MPSlide setAbsolutePath:](v19, "setAbsolutePath:", [v16 objectAtIndex:v17]);
      }
      if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", -[MPSlide path](v19, "path"))) {
        uint64_t v20 = 3LL;
      }
      else {
        uint64_t v20 = 2LL;
      }
      -[MPSlide setMediaType:](v19, "setMediaType:", v20);
      if (-[MPSlide hasMovie](v19, "hasMovie"))
      {
        -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", -[MPSlide path](v19, "path"));
        -[MPSlide setAudioVolume:](v19, "setAudioVolume:");
        if (v11 != 1.0) {
          -[MPSlide setAudioVolume:](v19, "setAudioVolume:", v11);
        }
        if (v27)
        {
          -[MPSlide setAudioDuckInDuration:](v19, "setAudioDuckInDuration:", 1.0);
          -[MPSlide setAudioDuckOutDuration:](v19, "setAudioDuckOutDuration:", 1.0);
          -[MPSlide setAudioDuckLevel:](v19, "setAudioDuckLevel:", 0.25);
        }
      }

      if (v8)
      {
        id v21 = -[MPAuthoringController frameFromOptions:](self, "frameFromOptions:", v29);
        if (v21) {
          -[MPSlide setFrame:](v19, "setFrame:", v21);
        }
      }

      if ((v18 & 1) == 0) {
        goto LABEL_28;
      }
      if ((v28 & 1) == 0) {
        break;
      }
      unsigned int v22 = [self->_delegate document:self->_authoredDocument shouldUseDefaultFiltersForSlide:v19 effectIndex:0 containerIndex:0 layerIndex:v26];
      if (((v22 | v28 ^ 1) & 1) == 0)
      {
        id v23 = [self->_delegate document:self->_authoredDocument needsFiltersForSlide:v19 effectIndex:0 containerIndex:0 layerIndex:v26];
        goto LABEL_25;
      }

      if (v22) {
        break;
      }
LABEL_28:
      [v14 addObject:v19];

      if (v7 == (id)++v17) {
        goto LABEL_29;
      }
    }

    id v23 = -[MPAuthoringController filtersForSlideFromOptions:](self, "filtersForSlideFromOptions:", v29);
LABEL_25:
    id v24 = v23;
    if (v23 && [v23 count]) {
      -[MPSlide addFilters:](v19, "addFilters:", v24);
    }
    goto LABEL_28;
  }

- (id)dynamicLayerWithImages:(id)a3 withOptions:(id)a4
{
  id v7 = +[MPAuthoringUtilities effectListFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "effectListFromOptions:", a4);
  unsigned int v8 = +[MPAuthoringUtilities layerHasImagesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerHasImagesFromOptions:",  a4);
  if ([v7 count]
    && ((id v9 = objc_msgSend(objc_msgSend(v7, "lastObject"), "objectForKey:", @"presetID"),
         id v10 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectPresetID:",  v9),  v11 = objc_msgSend( +[MPAuthoringUtilities styleFromOptions:]( MPAuthoringUtilities,  "styleFromOptions:",  a4),  "isEqualToString:",  @"Dateline"),  v10 == (id)0x7FFFFFFFFFFFFFFFLL)
      ? (unsigned int v12 = v8)
      : (unsigned int v12 = 0),
        v12 == 1))
  {
    unsigned int v13 = v11;
    id v14 = -[MPLayerEffect initWithEffectID:andPaths:]( objc_alloc(&OBJC_CLASS___MPLayerEffect),  "initWithEffectID:andPaths:",  +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", v9),  a3);
    if (v13) {
      -[MPLayerEffect setEffectAttribute:forKey:]( v14,  "setEffectAttribute:forKey:",  [a4 objectForKey:kMPAuthoringJournalRepresentation],  @"journal");
    }
    -[MPAuthoringController configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:]( self,  "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:",  v14,  self->_authoredDocument,  0LL,  -1LL,  -1LL);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v15 = -[MPLayerEffect slides](v14, "slides");
    id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (id i = 0LL; i != v17; id i = (char *)i + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v20 path])) {
            uint64_t v21 = 3LL;
          }
          else {
            uint64_t v21 = 2LL;
          }
          [v20 setMediaType:v21];
        }

        id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      }

      while (v17);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    unsigned int v22 = -[MPLayerEffect slides](v14, "slides", 0LL);
    id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          unsigned int v27 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
          if ([v27 hasMovie])
          {
            -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v27 path]);
            objc_msgSend(v27, "setAudioVolume:");
          }
        }

        id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
      }

      while (v24);
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)titleEffectsForImages:(id)a3 withOptions:(id)a4
{
  id v27 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  id v7 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "titleEffectLayoutsForStyleID:",  v6);
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = [v7 objectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (id i = 0LL; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v11);
  }

  id v15 = -[MPAuthoringController findEffectIDInPresetArray:forImages:withOptions:]( self,  "findEffectIDInPresetArray:forImages:withOptions:",  v8,  a3,  a4);

  if (v15
    || (id v15 = +[MPAuthoringUtilities titleEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "titleEffectFromOptions:",  a4)) != 0LL)
  {
    id v16 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfTitleEffectLayerForStyleID:",  v6);
    if ((id)+[MPAuthoringUtilities layerIndexFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerIndexFromOptions:",  a4) == v16)
    {
      id v17 = (NSArray *)[v15 objectForKey:@"presetID"];
      id v18 = [v15 objectForKey:@"backgroundEffect"];
      id v19 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
      uint64_t v20 = (char *)objc_msgSend( v19,  "numberOfSlidesForEffectID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v17));
      if (v18) {
        uint64_t v20 = &v20[(void)objc_msgSend( v19,  "numberOfSlidesForEffectID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v18))];
      }
      id v21 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a4);
      unsigned int v22 = [a3 count];
      int64_t v23 = v22 - (_BYTE *)[v19 numberOfSlidesForEffectID:v21];
      unsigned __int8 v24 = +[MPAuthoringUtilities layerHasImagesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerHasImagesFromOptions:",  a4);
      if ((uint64_t)v20 <= v23 || (v24 & 1) == 0)
      {
        if (v18) {
          id v17 = +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v18, v17, 0LL);
        }
        [v27 addObject:v17];
      }
    }
  }

  return v27;
}

- (id)effectAuthoredLayerWithImages:(id)a3 withOptions:(id)a4
{
  unsigned int v7 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldDuckMoviesFromOptions:",  a4);
  +[MPAuthoringUtilities movieVolumeFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "movieVolumeFromOptions:", a4);
  double v9 = v8;
  id v10 = objc_msgSend( objc_msgSend( +[MPAuthoringUtilities effectListFromOptions:]( MPAuthoringUtilities,  "effectListFromOptions:",  a4),  "lastObject"),  "objectForKey:",  @"presetID");
  id v83 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", v10);
  id v81 = +[MPUtilities presetIDOfCombinedID:](&OBJC_CLASS___MPUtilities, "presetIDOfCombinedID:", v10);
  id v11 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  int64_t v12 = +[MPAuthoringUtilities layerIndexFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerIndexFromOptions:", a4);
  id v78 = a4;
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a4);
  double v14 = v13;
  id v79 = +[MPLayer layer](&OBJC_CLASS___MPLayer, "layer");
  objc_msgSend( v79,  "setLayerID:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIDForLayerIndex:ofStyle:",  v12,  v11));
  id v85 = [a3 mutableCopy];
  id v91 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  id v15 = a3;
  id v16 = [a3 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v110;
    do
    {
      for (id i = 0LL; i != v17; id i = (char *)i + 1)
      {
        if (*(void *)v110 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)i);
        id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", v20);
        double v24 = v22 / v23;
        *(float *)&double v24 = v24;
        -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v24),  @"aspectRatio");
        if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", v20))
        {
          -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"isMovie");
          -[MPDocument durationForPath:](self->_authoredDocument, "durationForPath:", v20);
          -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"duration");
        }

        [v91 addObject:v21];
      }

      id v17 = [v15 countByEnumeratingWithState:&v109 objects:v117 count:16];
    }

    while (v17);
  }

  unsigned int v25 = objc_msgSend( objc_msgSend(v78, "objectForKey:", kMPAuthoringTellEffectsToSyncToMusic),  "BOOLValue");
  int64_t v26 = &off_26F8F8;
  if (!v25) {
    int64_t v26 = 0LL;
  }
  unsigned int v80 = v26;
  id v27 = v85;
  id v28 = v91;
  while ([v85 count])
  {
    id v29 = objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  v83,  v80,  v28,  0,  v14);
    id v30 = [v29 effectAuthoredSlideCount];
    id v31 = [v29 effectAuthoredAttributes];
    id v89 = +[NSIndexSet indexSetWithIndexesInRange:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndexesInRange:", 0LL, v30);
    id v32 = objc_msgSend(v27, "objectsAtIndexes:");
    id v87 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
    __int128 v33 = +[MPEffect effectWithEffectID:andPaths:](&OBJC_CLASS___MPEffect, "effectWithEffectID:andPaths:", v83, v32);
    -[MPEffect setPresetID:](v33, "setPresetID:", v81);
    -[MPEffect setEffectAttributes:](v33, "setEffectAttributes:", v31);
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v34 = -[MPEffect slides](v33, "slides");
    id v35 = -[NSArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v105,  v116,  16LL);
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v106;
      do
      {
        for (j = 0LL; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v106 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)j);
          unsigned int v40 = -[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v39 path]);
          if (v40) {
            uint64_t v41 = 3LL;
          }
          else {
            uint64_t v41 = 2LL;
          }
          [v39 setMediaType:v41];
          if (v40)
          {
            double v42 = v9;
            if (v9 == 1.0) {
              -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", objc_msgSend(v39, "path", v9));
            }
            [v39 setAudioVolume:v42];
            if (v7)
            {
              [v39 setAudioDuckInDuration:1.0];
              [v39 setAudioDuckOutDuration:1.0];
              [v39 setAudioDuckLevel:0.25];
            }
          }
        }

        id v36 = -[NSArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v105,  v116,  16LL);
      }

      while (v36);
    }

    -[MPAuthoringController configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:]( self,  "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:",  v33,  self->_authoredDocument,  0LL,  -1LL,  -1LL);
    [v87 addEffect:v33];
    [v79 addEffectContainer:v87];
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v43 = -[MPEffect slides](v33, "slides");
    id v44 = -[NSArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v101,  v115,  16LL);
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v102;
      do
      {
        for (id k = 0LL; k != v45; id k = (char *)k + 1)
        {
          if (*(void *)v102 != v46) {
            objc_enumerationMutation(v43);
          }
          __int128 v48 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)k);
          if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v48 path])) {
            uint64_t v49 = 3LL;
          }
          else {
            uint64_t v49 = 2LL;
          }
          [v48 setMediaType:v49];
        }

        id v45 = -[NSArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v101,  v115,  16LL);
      }

      while (v45);
    }

    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v50 = -[MPEffect slides](v33, "slides");
    id v51 = -[NSArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v97,  v114,  16LL);
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v98;
      do
      {
        for (m = 0LL; m != v52; m = (char *)m + 1)
        {
          if (*(void *)v98 != v53) {
            objc_enumerationMutation(v50);
          }
          __int128 v55 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)m);
          if ([v55 hasMovie])
          {
            -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v55 path]);
            objc_msgSend(v55, "setAudioVolume:");
          }
        }

        id v52 = -[NSArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v97,  v114,  16LL);
      }

      while (v52);
    }

    id v28 = v91;
    [v91 removeObjectsAtIndexes:v89];
    id v27 = v85;
    [v85 removeObjectsAtIndexes:v89];
  }

  id v56 = [v79 effectContainers];
  __int128 v57 = (char *)[v56 count];
  unsigned int v58 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeLoopTransitionFromOptions:",  v78);
  unsigned int v59 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeTransitionsFromOptions:",  v78);
  id v92 = [v78 mutableCopy];
  unsigned __int8 v84 = +[MPAuthoringUtilities repeatTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "repeatTransitionsFromOptions:",  v78);
  __int128 v60 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v61 = [v56 countByEnumeratingWithState:&v93 objects:v113 count:16];
  if (!v61)
  {
    id v82 = 0LL;
    goto LABEL_86;
  }

  id v62 = v61;
  id v82 = 0LL;
  uint64_t v63 = 0LL;
  uint64_t v64 = *(void *)v94;
  unsigned int v88 = v58;
  int v65 = v59 | v58;
  id v86 = v56;
  do
  {
    __int128 v66 = 0LL;
    uint64_t v90 = 1LL - (void)v57 + v63;
    do
    {
      if (*(void *)v94 != v64) {
        objc_enumerationMutation(v56);
      }
      else {
        int v67 = 0;
      }
      if (v67 == 1)
      {
        __int128 v68 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)v66);
        if (objc_msgSend(objc_msgSend(v68, "effects"), "count"))
        {
          unsigned int v69 = v88;
          if (v69 == 1)
          {
            id v70 = -[MPAuthoringController loopTransitionFromOptions:](self, "loopTransitionFromOptions:", v92);
          }

          else
          {
            if ((char *)v66 + v90)
            {
              id v71 = [v56 objectAtIndex:(char *)v66 + v63 + 1];
            }

            else
            {
              if ([v92 objectForKey:kMPAuthoringUseLoopTransition]
                && ![v68 countOfEffects]
                && (objc_msgSend( objc_msgSend(v92, "objectForKey:", kMPAuthoringUseLoopTransition),  "BOOLValue") & 1) == 0)
              {
                goto LABEL_77;
              }

              id v71 = 0LL;
            }

            id v70 = -[MPAuthoringController transitionFromOptions:firstEffectContainer:nextEffectContainer:]( self,  "transitionFromOptions:firstEffectContainer:nextEffectContainer:",  v92,  v68,  v71);
          }

          NSRange v72 = v70;
          if (!v70) {
            goto LABEL_76;
          }
          [v68 setTransition:v70];
          if ((v84 & 1) == 0)
          {
            double v75 = -[NSArray initWithObjects:]( [NSArray alloc],  "initWithObjects:",  [v72 transitionPresetID],  0);
            [v92 setObject:v75 forKey:kMPAuthoringIgnoreTransitionList];

LABEL_76:
            id v56 = v86;
            goto LABEL_77;
          }

          id v73 = [v72 transitionPresetID];
          if (!v82)
          {
            id v82 = v73;
            goto LABEL_76;
          }

          if ([v82 isEqualToString:v73])
          {
            double v74 = -[NSArray initWithObjects:]( [NSArray alloc],  "initWithObjects:",  [v72 transitionPresetID],  0);
            [v92 setObject:v74 forKey:kMPAuthoringIgnoreTransitionList];
          }

          else
          {
            [v92 removeObjectForKey:kMPAuthoringIgnoreTransitionList];

            id v82 = v73;
          }

          id v56 = v86;
        }
      }

- (id)effectContainersWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5
{
  id v209 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  id v201 = a3;
  __int128 v206 = (char *)[a3 count];
  unsigned int v196 = +[MPAuthoringUtilities shouldComputeFramesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeFramesFromOptions:",  a5);
  unsigned int v8 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeTransitionsFromOptions:",  a5);
  unsigned __int8 v9 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeSlideFiltersFromOptions:",  a5);
  unsigned int v177 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldComputeLoopTransitionFromOptions:",  a5);
  unsigned __int8 v203 = +[MPAuthoringUtilities useBestAspectRatioFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "useBestAspectRatioFromOptions:",  a5);
  int64_t v198 = +[MPAuthoringUtilities layerIndexFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "layerIndexFromOptions:",  a5);
  +[MPAuthoringUtilities movieVolumeFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "movieVolumeFromOptions:", a5);
  double v11 = v10;
  unsigned __int8 v175 = +[MPAuthoringUtilities repeatTransitionsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "repeatTransitionsFromOptions:",  a5);
  +[MPAuthoringUtilities effectPadding:](&OBJC_CLASS___MPAuthoringUtilities, "effectPadding:", a5);
  double v13 = v12;
  unsigned int v195 = +[MPAuthoringUtilities padTextOnlyEffects:](&OBJC_CLASS___MPAuthoringUtilities, "padTextOnlyEffects:", a5);
  id v14 = -[MPAuthoringController filtersForEffectFromOptions:](self, "filtersForEffectFromOptions:", a5);
  id v190 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  a5);
  id v183 = -[MPAuthoringController createEffectToTransitionMapWithOptions:]( self,  "createEffectToTransitionMapWithOptions:",  a5);
  unsigned int v194 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "shouldDuckMoviesFromOptions:",  a5);
  unsigned int v189 = objc_msgSend( +[MPAuthoringUtilities styleFromOptions:]( MPAuthoringUtilities,  "styleFromOptions:",  a5),  "isEqualToString:",  @"Dateline");
  if (+[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "fitMoviesWhenPossibleFromOptions:",  a5))
  {
    unsigned int v15 = !+[MPAuthoringUtilities needsFitMovieAttributeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "needsFitMovieAttributeFromOptions:",  a5);
  }

  else
  {
    LOBYTE(v15) = 1;
  }

  char v188 = v15;
  unsigned int v192 = +[MPAuthoringUtilities effectNeedsPreviousAttributesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "effectNeedsPreviousAttributesFromOptions:",  a5);
  uint64_t v218 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a5);
  id delegate = self->_delegate;
  if (delegate)
  {
    char v178 = objc_opt_respondsToSelector( delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:");
    char v17 = objc_opt_respondsToSelector( self->_delegate,  "document:shouldUseDefaultFiltersForSlide:effectIndex:containerIndex:layerIndex:");
    int v18 = objc_opt_respondsToSelector( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:");
    int v197 = objc_opt_respondsToSelector( self->_delegate,  "document:needsFiltersForSlide:effectIndex:containerIndex:layerIndex:");
    int v19 = v18 ^ 1;
  }

  else
  {
    int v197 = 0;
    char v17 = 0;
    char v178 = 0;
    int v19 = 1;
  }

  int v174 = v19;
  if (objc_msgSend( +[MPAuthoringUtilities transitionListFromOptions:]( MPAuthoringUtilities,  "transitionListFromOptions:",  a5),  "count") == (char *)&dword_0 + 1) {
    unsigned int v20 = v8;
  }
  else {
    unsigned int v20 = 0;
  }
  char v173 = v8;
  __int128 v181 = v14;
  if (v20 == 1)
  {
    id v176 = -[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", a5);
  }

  else
  {
    if (v8)
    {
      BOOL v21 = +[MPAuthoringUtilities pickTransitionsEvenlyByIDWithOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "pickTransitionsEvenlyByIDWithOptions:",  a5);
      unsigned int v22 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "matchEffectsUsingTagsFromOptions:",  a5);
      id v23 = +[MPAuthoringUtilities transitionListFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "transitionListFromOptions:",  a5);
      id v24 = [v23 lastObject];
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary, v25);
      if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0 || v21 || v22)
      {
        -[MPAuthoringController populateWeighter:withTransitions:andOptions:]( self,  "populateWeighter:withTransitions:andOptions:",  self->_transitionWeighter,  v23,  a5);
        -[MPWeighter setEvenlyPickByID:](self->_transitionWeighter, "setEvenlyPickByID:", v21);
      }
    }

    id v176 = 0LL;
  }

  id v186 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if ((objc_msgSend( -[NSMutableDictionary objectForKey:](v218, "objectForKey:", kMPAuthoringLive),  "BOOLValue") & v192) == 1 && objc_msgSend(-[MPDocument layers](self->_authoredDocument, "layers"), "count"))
  {
    id v191 = objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend(-[MPDocument layers](self->_authoredDocument, "layers"), "objectAtIndex:", v198),  "effectContainers"),  "lastObject"),  "effects"),  "lastObject"),  "effectAttributes"),  "mutableCopy");
  }

  else
  {
    id v191 = 0LL;
  }

  __int128 v184 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  __int128 v267 = 0u;
  __int128 v268 = 0u;
  __int128 v269 = 0u;
  __int128 v270 = 0u;
  id v27 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
  id v204 = a5;
  id v182 = [a4 countByEnumeratingWithState:&v267 objects:v283 count:16];
  if (v182)
  {
    uint64_t v28 = 0LL;
    id v29 = 0LL;
    uint64_t v180 = *(void *)v268;
    char v193 = v9 | v17;
    double y = CGPointZero.y;
    do
    {
      uint64_t v32 = 0LL;
      do
      {
        if (*(void *)v268 != v180) {
          objc_enumerationMutation(a4);
        }
        uint64_t v185 = v32;
        __int128 v33 = *(void **)(*((void *)&v267 + 1) + 8 * v32);
        id v34 = +[MPEffectContainer effectContainer](&OBJC_CLASS___MPEffectContainer, "effectContainer");
        uint64_t v36 = objc_opt_class(v27[203], v35);
        if ((objc_opt_isKindOfClass(v33, v36) & 1) != 0) {
          id v37 = v33;
        }
        else {
          id v37 = objc_msgSend(objc_alloc((Class)v27[203]), "initWithObjects:", v33, 0);
        }
        __int128 v266 = 0u;
        __int128 v265 = 0u;
        __int128 v263 = 0u;
        __int128 v264 = 0u;
        id v187 = v37;
        id v202 = [v37 countByEnumeratingWithState:&v263 objects:v282 count:16];
        if (v202)
        {
          uint64_t v38 = 0LL;
          uint64_t v199 = *(void *)v264;
          __int128 v200 = v34;
          uint64_t v213 = v28;
          do
          {
            uint64_t v39 = 0LL;
            do
            {
              id v215 = v38;
              if (*(void *)v264 != v199)
              {
                uint64_t v40 = v39;
                objc_enumerationMutation(v187);
                uint64_t v39 = v40;
              }

              uint64_t v207 = v39;
              uint64_t v41 = *(void *)(*((void *)&v263 + 1) + 8 * v39);
              id v42 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", v41);
              id v43 = +[MPUtilities presetIDOfCombinedID:](&OBJC_CLASS___MPUtilities, "presetIDOfCombinedID:", v41);
              id v44 = (char *)[v209 numberOfSlidesForEffectID:v42];
              __int128 v208 = v29;
              uint64_t v210 = (uint64_t)v44;
              if ((uint64_t)v44 < 1)
              {
                unsigned int v59 = +[MPEffect effectWithEffectID:](&OBJC_CLASS___MPEffect, "effectWithEffectID:", v42);
                -[MPEffect setPresetID:](v59, "setPresetID:", v43);
                goto LABEL_129;
              }

              id v45 = v44;
              id v205 = v43;
              id v211 = v42;
              uint64_t v46 = objc_alloc(&OBJC_CLASS___NSIndexSet);
              else {
                __int128 v47 = v206;
              }
              __int128 v48 = -[NSIndexSet initWithIndexesInRange:](v46, "initWithIndexesInRange:", v29, v47);
              id v49 = [v201 objectsAtIndexes:v48];

              id v50 = [a5 objectForKey:kMPAuthoringCachedAbsolutePaths];
              if (v50)
              {
                id v51 = v50;
                id v52 = v29;
                uint64_t v53 = objc_alloc(&OBJC_CLASS___NSIndexSet);
                __int128 v54 = (char *)[v51 count];
                if (v54 >= v45) {
                  __int128 v55 = v45;
                }
                else {
                  __int128 v55 = v54;
                }
                id v56 = -[NSIndexSet initWithIndexesInRange:](v53, "initWithIndexesInRange:", v52, v55);
                unint64_t v57 = (unint64_t)v45;
                id v58 = [v51 objectsAtIndexes:v56];
              }

              else
              {
                unint64_t v57 = (unint64_t)v45;
                id v58 = 0LL;
              }

              if (v57 < 2) {
                char v60 = 1;
              }
              else {
                char v60 = v203;
              }
              if ((v60 & 1) != 0)
              {
                char v61 = 0;
              }

              else
              {
                __int128 v261 = 0u;
                __int128 v262 = 0u;
                __int128 v259 = 0u;
                __int128 v260 = 0u;
                id v62 = [v49 countByEnumeratingWithState:&v259 objects:v281 count:16];
                if (v62)
                {
                  id v63 = v62;
                  char v64 = 0;
                  uint64_t v65 = *(void *)v260;
                  do
                  {
                    for (id i = 0LL; i != v63; id i = (char *)i + 1)
                    {
                      if (*(void *)v260 != v65) {
                        objc_enumerationMutation(v49);
                      }
                      objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_cachedROIInformation,  "objectForKey:",  *(void *)(*((void *)&v259 + 1) + 8 * (void)i)),  "objectForKey:",  @"aspectRatio"),  "floatValue");
                      if (v67 > 2.0 || v67 < 0.5) {
                        char v64 = 1;
                      }
                    }

                    id v63 = [v49 countByEnumeratingWithState:&v259 objects:v281 count:16];
                  }

                  while (v63);
                }

                else
                {
                  char v64 = 0;
                }

                char v61 = v64 & 1;
              }

              id v69 = v205;
              if ((v203 & 1) != 0)
              {
              }

              else
              {
                if ((v61 & 1) != 0)
                {
LABEL_73:
                  id v71 = -[MPAuthoringController sortImagePaths:toAspectRatiosInEffectPresetID:withOptions:]( self,  "sortImagePaths:toAspectRatiosInEffectPresetID:withOptions:",  v49,  v41,  v218);
                  id v70 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                  id v72 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                  __int128 v255 = 0u;
                  __int128 v256 = 0u;
                  __int128 v257 = 0u;
                  __int128 v258 = 0u;
                  id v73 = [v71 countByEnumeratingWithState:&v255 objects:v280 count:16];
                  if (v73)
                  {
                    id v74 = v73;
                    uint64_t v75 = *(void *)v256;
                    do
                    {
                      for (j = 0LL; j != v74; j = (char *)j + 1)
                      {
                        if (*(void *)v256 != v75) {
                          objc_enumerationMutation(v71);
                        }
                        unint64_t v77 = (unint64_t)[*(id *)(*((void *)&v255 + 1) + 8 * (void)j) integerValue];
                        if ((v77 & 0x8000000000000000LL) == 0)
                        {
                          unint64_t v78 = v77;
                          objc_msgSend(v70, "addObject:", objc_msgSend(v49, "objectAtIndex:", v77));
                          if (v58) {
                            objc_msgSend(v72, "addObject:", objc_msgSend(v58, "objectAtIndex:", v78));
                          }
                        }
                      }

                      id v74 = [v71 countByEnumeratingWithState:&v255 objects:v280 count:16];
                    }

                    while (v74);
                  }

                  if (v58) {
                    id v58 = v72;
                  }
                  else {
                    id v58 = 0LL;
                  }
                  a5 = v204;
                  id v69 = v205;
                  goto LABEL_87;
                }
              }

              id v70 = v49;
LABEL_87:
              id v79 = v211;
              unsigned int v80 = +[MPEffect effectWithEffectID:andPaths:]( &OBJC_CLASS___MPEffect,  "effectWithEffectID:andPaths:",  v211,  v70);
              -[MPEffect setSkipEffectTiming:](v80, "setSkipEffectTiming:", 1LL);
              -[MPEffect setPresetID:](v80, "setPresetID:", v69);
              if (v192)
              {
                id v81 = objc_msgSend(-[MPEffect effectAttributes](v80, "effectAttributes"), "mutableCopy");
                if (v191)
                {
                  id v82 = [v191 mutableCopy];
                  [v82 removeObjectForKey:@"previousAttributes"];
                  [v81 setObject:v82 forKey:@"previousAttributes"];
                  -[MPEffect setEffectAttributes:](v80, "setEffectAttributes:", v81);
                }

                else
                {
                  -[MPEffect setEffectAttributes:](v80, "setEffectAttributes:", v81);
                }

                id v191 = v81;
                id v79 = v211;
              }

              if (v189) {
                -[MPEffect setEffectAttribute:forKey:]( v80,  "setEffectAttribute:forKey:",  [a5 objectForKey:kMPAuthoringJournalRepresentation],  @"journal");
              }
              if ((v188 & 1) == 0) {
                -[MPEffect setEffectAttribute:forKey:]( v80,  "setEffectAttribute:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"fitMovies");
              }
              -[MPAuthoringController configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:]( self,  "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:",  v80,  self->_authoredDocument,  0LL,  -1LL,  -1LL);
              id v83 = [v209 numberOfSecondarySlidesForEffectID:v79];
              if ((uint64_t)v83 >= 1)
              {
                id v84 = v83;
                id v85 = [a5 objectForKey:kMPAuthoringSecondaryPaths];
                if (v85) {
                  id v86 = v85;
                }
                else {
                  id v86 = v201;
                }
                -[MPEffect createSecondarySlidesWithPaths:]( v80,  "createSecondarySlidesWithPaths:",  -[MPAuthoringController pickRandomPathsInArray:excludingPaths:count:]( self,  "pickRandomPathsInArray:excludingPaths:count:",  v86,  v70,  v84));
              }

              __int128 v253 = 0u;
              __int128 v254 = 0u;
              __int128 v251 = 0u;
              __int128 v252 = 0u;
              unsigned int v59 = v80;
              id v87 = -[MPEffect slides](v80, "slides");
              id v88 = -[NSArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v251,  v279,  16LL);
              if (v88)
              {
                id v89 = v88;
                uint64_t v90 = *(void *)v252;
                do
                {
                  for (id k = 0LL; k != v89; id k = (char *)k + 1)
                  {
                    if (*(void *)v252 != v90) {
                      objc_enumerationMutation(v87);
                    }
                    id v92 = *(void **)(*((void *)&v251 + 1) + 8LL * (void)k);
                    if (-[MPDocument isMovieAtPath:]( self->_authoredDocument,  "isMovieAtPath:",  [v92 path]))
                    {
                      uint64_t v93 = 3LL;
                    }

                    else
                    {
                      uint64_t v93 = 2LL;
                    }

                    [v92 setMediaType:v93];
                  }

                  id v89 = -[NSArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v251,  v279,  16LL);
                }

                while (v89);
              }

              __int128 v249 = 0u;
              __int128 v250 = 0u;
              __int128 v247 = 0u;
              __int128 v248 = 0u;
              __int128 v94 = -[MPEffect slides](v59, "slides");
              id v95 = -[NSArray countByEnumeratingWithState:objects:count:]( v94,  "countByEnumeratingWithState:objects:count:",  &v247,  v278,  16LL);
              if (v95)
              {
                id v96 = v95;
                uint64_t v97 = *(void *)v248;
                do
                {
                  for (m = 0LL; m != v96; m = (char *)m + 1)
                  {
                    if (*(void *)v248 != v97) {
                      objc_enumerationMutation(v94);
                    }
                    __int128 v99 = *(void **)(*((void *)&v247 + 1) + 8LL * (void)m);
                    if ([v99 hasMovie])
                    {
                      -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v99 path]);
                      objc_msgSend(v99, "setAudioVolume:");
                    }
                  }

                  id v96 = -[NSArray countByEnumeratingWithState:objects:count:]( v94,  "countByEnumeratingWithState:objects:count:",  &v247,  v278,  16LL);
                }

                while (v96);
              }

              if (v58)
              {
                __int128 v245 = 0u;
                __int128 v246 = 0u;
                __int128 v243 = 0u;
                __int128 v244 = 0u;
                __int128 v100 = -[MPEffect slides](v59, "slides");
                id v101 = -[NSArray countByEnumeratingWithState:objects:count:]( v100,  "countByEnumeratingWithState:objects:count:",  &v243,  v277,  16LL);
                if (v101)
                {
                  id v102 = v101;
                  uint64_t v103 = 0LL;
                  uint64_t v104 = *(void *)v244;
                  do
                  {
                    for (n = 0LL; n != v102; n = (char *)n + 1)
                    {
                      if (*(void *)v244 != v104) {
                        objc_enumerationMutation(v100);
                      }
                      objc_msgSend( *(id *)(*((void *)&v243 + 1) + 8 * (void)n),  "setAbsolutePath:",  objc_msgSend(v58, "objectAtIndex:", (char *)n + v103));
                    }

                    id v102 = -[NSArray countByEnumeratingWithState:objects:count:]( v100,  "countByEnumeratingWithState:objects:count:",  &v243,  v277,  16LL);
                    v103 += (uint64_t)n;
                  }

                  while (v102);
                }
              }

              -[MPEffect setSkipEffectTiming:](v59, "setSkipEffectTiming:", 0LL);
              -[MPEffect updateTiming](v59, "updateTiming");
              id v42 = v211;
LABEL_129:
              if ((uint64_t)[v209 numOfTextsForEffectID:v42] >= 1)
              {
                id v106 = [a5 objectForKey:kMPAuthoringTitleStrings];
                id v107 = [a5 objectForKey:kMPAuthoringOutroTitleStrings];
                else {
                  BOOL v108 = 1;
                }
                if (v108 || ![v107 count])
                {
                  +[MPAuthoringUtilities multilineSizeFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "multilineSizeFactorFromOptions:",  a5);
                  if (!v106) {
                    goto LABEL_140;
                  }
                  double v110 = v111;
                  id v107 = v106;
                }

                else
                {
                  +[MPAuthoringUtilities multilineSizeFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "multilineSizeFactorFromOptions:",  a5);
                  double v110 = v109;
                }

                if (![v107 count])
                {
LABEL_140:
                  -[MPEffect createTextsWithDefaultStrings](v59, "createTextsWithDefaultStrings");
                  goto LABEL_141;
                }

                -[MPEffect createTextsWithStrings:secondLineFactor:]( v59,  "createTextsWithStrings:secondLineFactor:",  v107,  v110);
              }

- (id)createEffectToTransitionMapWithOptions:(id)a3
{
  id v4 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:");
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "titleEffectLayoutsForStyleID:",  v4));
  -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  +[MPAuthoringUtilities effectListFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "effectListFromOptions:", a3));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = [v11 objectForKey:@"transitionID"];
        if (v12) {
          objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v11, "objectForKey:", @"presetID"));
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  if ([v5 count]) {
    return v5;
  }
  else {
    return 0LL;
  }
}

- (id)loopTransitionFromOptions:(id)a3
{
  id v5 = +[MPAuthoringUtilities loopTransitionIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "loopTransitionIDFromOptions:");
  id v7 = +[MPAuthoringUtilities idFromPresetID:](&OBJC_CLASS___MPAuthoringUtilities, "idFromPresetID:", v5);
  id v8 = +[MPAuthoringUtilities presetIDFromPresetID:](&OBJC_CLASS___MPAuthoringUtilities, "presetIDFromPresetID:", v5);
  if (v7)
  {
    id v9 = v8;
    id v7 = +[MPTransition transitionWithTransitionID:](&OBJC_CLASS___MPTransition, "transitionWithTransitionID:", v7);
    -[MPTransition setPresetID:](v7, "setPresetID:", v9);
  }

  return v7;
}

- (id)exportTransitionFromOptions:(id)a3
{
  id v3 = +[MPAuthoringUtilities exportTransitionIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "exportTransitionIDFromOptions:",  a3);
  id v4 = +[MPAuthoringUtilities idFromPresetID:](&OBJC_CLASS___MPAuthoringUtilities, "idFromPresetID:", v3);
  id v5 = +[MPAuthoringUtilities presetIDFromPresetID:](&OBJC_CLASS___MPAuthoringUtilities, "presetIDFromPresetID:", v3);
  id v6 = +[MPTransition transitionWithTransitionID:](&OBJC_CLASS___MPTransition, "transitionWithTransitionID:", v4);
  -[MPTransition setPresetID:](v6, "setPresetID:", v5);
  return v6;
}

- (id)sortImagePaths:(id)a3 toAspectRatiosInEffectPresetID:(id)a4 withOptions:(id)a5
{
  if ([a3 count] == (char *)&dword_0 + 1
    || objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectPresetID:",  a4) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if ([a3 count])
    {
      unint64_t v9 = 0LL;
      do
        objc_msgSend( v8,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9++));
      while (v9 < (unint64_t)[a3 count]);
    }

    return v8;
  }

  id v10 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", a4);
  id v11 = +[MPUtilities presetIDOfCombinedID:](&OBJC_CLASS___MPUtilities, "presetIDOfCombinedID:", a4);
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a5);
  id v13 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "mediaAspectRatioHintsForEffectID:usingPresetID:defaultAspectRatio:",  v10,  v11,  v12);
  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v14 = [v13 count];
  if ((uint64_t)v14 < 1)
  {
    uint64_t v18 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v120 = 0LL;
  }

  else
  {
    id v15 = v14;
    uint64_t v120 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    for (int64_t i = 0LL; (id)i != v15; ++i)
    {
      id v20 = [v13 objectForKey:ImageKey(i)];
      [v20 floatValue];
      if (v21 <= 0.95)
      {
        ++v120;
      }

      else if (v21 >= 3.0)
      {
        ++v18;
      }

      else if (v21 >= 1.075)
      {
        ++v16;
      }

      else
      {
        ++v17;
      }

      [obj addObject:v20];
    }
  }

  uint64_t v118 = v16;
  uint64_t v112 = v18;
  p_vtable = &OBJC_CLASS___MPEffect.vtable;
  id v23 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  v10);
  id v123 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  id v124 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  id v116 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  id v24 = (char *)[v23 count];
  if ((uint64_t)v24 >= 1)
  {
    uint64_t v25 = v24;
    uint64_t v26 = 0LL;
    id v27 = 0LL;
    while (1)
    {
      unint64_t v28 = (unint64_t)objc_msgSend( objc_msgSend(p_vtable + 492, "sharedManager"),  "panoTypeForSlideAtIndex:inEffect:forPresetID:",  v27,  v10,  v11);
      if (v28 <= 6)
      {
        unint64_t v29 = v28;
        uint64_t v30 = 1LL << v28;
        id v31 = v124;
        if ((v30 & 0x12) != 0) {
          goto LABEL_26;
        }
        id v31 = v123;
        if (((1LL << v29) & 0x24) != 0) {
          goto LABEL_26;
        }
        if (((1LL << v29) & 0x48) != 0) {
          break;
        }
      }

- (id)filtersForLayerFromOptions:(id)a3
{
  id v4 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:");
  int64_t v5 = +[MPAuthoringUtilities layerIndexFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerIndexFromOptions:", a3);
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = objc_msgSend( +[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:]( MPAuthoringUtilities,  "layerDescriptionForLayerWithZIndex:forStyle:",  v5,  v4),  "objectForKey:",  @"layerFilterPresets");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (int64_t i = 0LL; i != v9; int64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v13 = +[MPFilter filterWithFilterID:]( MPFilter,  "filterWithFilterID:",  [v12 stringByDeletingLastPathComponent]);
        -[MPFilter setPresetID:](v13, "setPresetID:", [v12 lastPathComponent]);
        [v6 addObject:v13];
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)filtersForEffectFromOptions:(id)a3
{
  int64_t v4 = +[MPAuthoringUtilities layerIndexFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "layerIndexFromOptions:");
  id v5 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a3);
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultFilterLikelihoodForZIndex:ofStyle:",  v4,  v5);
  double v8 = v7;
  uint64_t v9 = random();
  if (v8 == -1.0)
  {
    if (0xAAAAAAAAAAAAAAABLL * v9 + 0x2AAAAAAAAAAAAAAALL >= 0x5555555555555555LL) {
      return v6;
    }
  }

  else if ((double)(v9 % 100) + v8 * -100.0 >= 0.0)
  {
    return v6;
  }

  id v10 = objc_msgSend( +[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:]( MPAuthoringUtilities,  "layerDescriptionForLayerWithZIndex:forStyle:",  v4,  v5),  "objectForKey:",  @"filterPresets");
  if (![v10 count]) {
    return 0LL;
  }
  id v11 = objc_msgSend(v10, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v10, "count"));
  if (v11)
  {
    double v12 = v11;
    id v13 = +[MPFilter filterWithFilterID:]( MPFilter,  "filterWithFilterID:",  [v11 stringByDeletingLastPathComponent]);
    -[MPFilter setPresetID:](v13, "setPresetID:", [v12 lastPathComponent]);
    [v6 addObject:v13];
  }

  return v6;
}

- (id)filtersForSlideFromOptions:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v5 = objc_msgSend( +[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:]( MPAuthoringUtilities,  "layerDescriptionForLayerWithZIndex:forStyle:",  +[MPAuthoringUtilities layerIndexFromOptions:]( MPAuthoringUtilities,  "layerIndexFromOptions:",  a3),  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a3)),  "objectForKey:",  @"filterPresets");
  if (v5)
  {
    id v6 = v5;
    if ([v5 count])
    {
      id v7 = objc_msgSend(v6, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v6, "count"));
      if (v7)
      {
        double v8 = v7;
        uint64_t v9 = +[MPFilter filterWithFilterID:]( MPFilter,  "filterWithFilterID:",  [v7 stringByDeletingLastPathComponent]);
        -[MPFilter setPresetID:](v9, "setPresetID:", [v8 lastPathComponent]);
        [v4 addObject:v9];
      }
    }
  }

  return v4;
}

- (id)frameFromOptions:(id)a3
{
  id v3 = objc_msgSend( +[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:]( MPAuthoringUtilities,  "layerDescriptionForLayerWithZIndex:forStyle:",  +[MPAuthoringUtilities layerIndexFromOptions:](MPAuthoringUtilities, "layerIndexFromOptions:"),  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a3)),  "objectForKey:",  @"frames");
  if (v3
    && (id v4 = v3, [v3 count])
    && (id v5 = objc_msgSend(v4, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v4, "count"))) != 0)
  {
    return +[MPFrame frameWithFrameID:](&OBJC_CLASS___MPFrame, "frameWithFrameID:", v5);
  }

  else
  {
    return 0LL;
  }

- (id)createAudioPlayListFromAudioPaths:(id)a3 andOptions:(id)a4
{
  id v6 = +[MPAudioPlaylist audioPlaylist](&OBJC_CLASS___MPAudioPlaylist, "audioPlaylist");
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(a3);
        }
        -[NSMutableArray addObject:]( v7,  "addObject:",  +[MPSong songWithPath:]( &OBJC_CLASS___MPSong,  "songWithPath:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v11)));
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  [v6 addSongs:v7];
  if (+[MPAuthoringUtilities fadeOutAudioFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "fadeOutAudioFromOptions:",  a4))
  {
    [v6 setFadeOutDuration:1.0];
  }

  return v6;
}

- (id)pickRandomPathsInArray:(id)a3 excludingPaths:(id)a4 count:(int64_t)a5
{
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  for (id i = [a3 mutableCopy];
        (unint64_t)[v8 count] < a5 && objc_msgSend(i, "count");
        [i removeObjectAtIndex:v11])
  {
    unint64_t v10 = random();
    unint64_t v11 = v10 % (unint64_t)[i count];
    id v12 = [i objectAtIndex:v11];
  }

  while ((unint64_t)[v8 count] < a5)
    objc_msgSend( v8,  "addObject:",  objc_msgSend(a3, "objectAtIndex:", random() % (unint64_t)objc_msgSend(a3, "count")));
  return v8;
}

- (id)transitionFromOptions:(id)a3 firstEffectContainer:(id)a4 nextEffectContainer:(id)a5
{
  id v9 = +[MPTransitionManager sharedManager](&OBJC_CLASS___MPTransitionManager, "sharedManager");
  p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
  id v11 = +[MPAuthoringUtilities transitionListFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "transitionListFromOptions:",  a3);
  if (![v11 count]) {
    return 0LL;
  }
  id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
  if (-[MPWeighter count](self->_transitionWeighter, "count") >= 1)
  {
    if (+[MPAuthoringUtilities effectDecidesTransitionFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "effectDecidesTransitionFromOptions:",  a3))
    {
      unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  objc_msgSend(objc_msgSend(a4, "objectInEffectsAtIndex:", 0), "presetID"),  @"presetID",  0));
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v13 = -[MPWeighter getRandomIndex](self->_transitionWeighter, "getRandomIndex");
      }
LABEL_149:
      id v16 = [v11 objectAtIndex:v13];
      uint64_t v86 = objc_opt_class(v12[215], v85);
      if ((objc_opt_isKindOfClass(v16, v86) & 1) != 0) {
        id v16 = [v16 objectForKey:@"presetID"];
      }
      goto LABEL_151;
    }

    id v98 = a5;
    id v101 = v11;
    id v102 = a3;
    id v20 = +[MPAuthoringUtilities ignoreTransitionListFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "ignoreTransitionListFromOptions:",  a3);
    id v21 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    id v22 = [v20 countByEnumeratingWithState:&v129 objects:v139 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v130;
      do
      {
        for (id i = 0LL; i != v23; id i = (char *)i + 1)
        {
          if (*(void *)v130 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = objc_msgSend( -[MPWeighter allItems](self->_transitionWeighter, "allItems"),  "indexOfObject:",  *(void *)(*((void *)&v129 + 1) + 8 * (void)i));
          if (v26 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [v21 addIndex:v26];
          }
        }

        id v23 = [v20 countByEnumeratingWithState:&v129 objects:v139 count:16];
      }

      while (v23);
    }

    -[MPWeighter ignoreIndices:](self->_transitionWeighter, "ignoreIndices:", v21);
    p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
    a3 = v102;
    id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    if (!+[MPAuthoringUtilities useTransitionLayoutTagsWithOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "useTransitionLayoutTagsWithOptions:",  v102)) {
      goto LABEL_61;
    }
    id v27 = [a4 objectInEffectsAtIndex:0];
    id v28 = [v27 effectID];
    id v29 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  v28,  objc_msgSend(v27, "presetID"));
    unsigned __int8 v30 = +[MPAuthoringUtilities aspectRatioMatchesDefault:withOptions:]( MPAuthoringUtilities,  "aspectRatioMatchesDefault:withOptions:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "aspectRatioForEffectID:",  v28),  v102);
    uint64_t v95 = v28;
    id v31 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "orientationForEffectID:",  v28);
    unsigned int v32 = [v31 isEqualToString:@"landscape"];
    unsigned int v33 = [v31 isEqualToString:@"portrait"];
    id v103 = objc_msgSend(objc_msgSend(v29, "objectForKey:", @"endLayoutTags"), "mutableCopy");
    id v97 = v9;
    if ((v30 & 1) == 0)
    {
      id v34 = [v103 copy];
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      id v35 = [v34 countByEnumeratingWithState:&v125 objects:v138 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v126;
        do
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v126 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v125 + 1) + 8LL * (void)j);
            if (v32
              && ([*(id *)(*((void *)&v125 + 1) + 8 * (void)j) hasPrefix:@"X"] & 1) != 0 || v33 && objc_msgSend(v39, "hasPrefix:", @"Y"))
            {
              [v103 removeObject:v39];
            }
          }

          id v36 = [v34 countByEnumeratingWithState:&v125 objects:v138 count:16];
        }

        while (v36);
      }

      a3 = v102;
    }

    id v40 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    id obj = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    if (v98)
    {
      id v94 = v40;
      id v41 = [v98 objectInEffectsAtIndex:0];
      id v42 = [v41 effectID];
      id v43 =  objc_msgSend( objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  v42,  objc_msgSend(v41, "presetID")),  "objectForKey:",  @"startLayoutTags"),  "mutableCopy");
      p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
      unsigned __int8 v44 = +[MPAuthoringUtilities aspectRatioMatchesDefault:withOptions:]( MPAuthoringUtilities,  "aspectRatioMatchesDefault:withOptions:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "aspectRatioForEffectID:",  v42),  a3);
      id v45 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "orientationForEffectID:",  v42);
      unsigned int v46 = [v45 isEqualToString:@"landscape"];
      unsigned int v47 = [v45 isEqualToString:@"portrait"];
      if ((v44 & 1) == 0)
      {
        unsigned int v48 = v47;
        id v99 = v42;
        unsigned int v49 = v43;
        id v50 = [v43 copy];
        __int128 v121 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        __int128 v124 = 0u;
        id v51 = [v50 countByEnumeratingWithState:&v121 objects:v137 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v122;
          do
          {
            for (id k = 0LL; k != v52; id k = (char *)k + 1)
            {
              if (*(void *)v122 != v53) {
                objc_enumerationMutation(v50);
              }
              __int128 v55 = *(void **)(*((void *)&v121 + 1) + 8LL * (void)k);
              if (v46
                && ([*(id *)(*((void *)&v121 + 1) + 8 * (void)k) hasPrefix:@"X"] & 1) != 0 || v48 && objc_msgSend(v55, "hasPrefix:", @"Y"))
              {
                [v49 removeObject:v55];
              }
            }

            id v52 = [v50 countByEnumeratingWithState:&v121 objects:v137 count:16];
          }

          while (v52);
        }

        id v9 = v97;
        id v42 = v99;
        a3 = v102;
        p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
        id v43 = v49;
      }

      unsigned int v56 = [v42 isEqualToString:@"JustASlide"];
      id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      id v40 = v94;
      if (v56)
      {
        unint64_t v57 = v103;
        [v94 addObjectsFromArray:v103];
        goto LABEL_56;
      }

      unsigned __int8 v58 = [v95 isEqualToString:@"JustASlide"];
      [v94 addObjectsFromArray:v43];
      if ((v58 & 1) == 0)
      {
        unint64_t v57 = v103;
        [v94 addObjectsFromArray:v103];
        [obj addObjectsFromArray:v43];
        objc_msgSend( obj,  "intersectSet:",  +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v103));
LABEL_56:
        id v100 = [v57 count];
        if ([v40 count]) {
          unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  -[AVAudioTimePitchAlgorithm dictionaryWithObjectsAndKeys:]( (id)v12[215],  "dictionaryWithObjectsAndKeys:",  [v40 allObjects],  @"tags",  0),  0);
        }
        else {
          unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (([0 isEqualToString:@"JustASlide"] & 1) == 0)
        {
          id v96 = v43;
          id v59 = [v103 mutableCopy];
          __int128 v117 = 0u;
          __int128 v118 = 0u;
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          id v60 = [v103 countByEnumeratingWithState:&v117 objects:v136 count:16];
          if (v60)
          {
            id v61 = v60;
            uint64_t v62 = *(void *)v118;
            do
            {
              for (m = 0LL; m != v61; m = (char *)m + 1)
              {
                if (*(void *)v118 != v62) {
                  objc_enumerationMutation(v103);
                }
                char v64 = *(void **)(*((void *)&v117 + 1) + 8LL * (void)m);
              }

              id v61 = [v103 countByEnumeratingWithState:&v117 objects:v136 count:16];
            }

            while (v61);
          }

          id v65 = [v103 mutableCopy];
          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v115 = 0u;
          __int128 v116 = 0u;
          id v66 = [v103 countByEnumeratingWithState:&v113 objects:v135 count:16];
          if (v66)
          {
            id v67 = v66;
            uint64_t v68 = *(void *)v114;
            do
            {
              for (n = 0LL; n != v67; n = (char *)n + 1)
              {
                if (*(void *)v114 != v68) {
                  objc_enumerationMutation(v103);
                }
                id v70 = *(void **)(*((void *)&v113 + 1) + 8LL * (void)n);
              }

              id v67 = [v103 countByEnumeratingWithState:&v113 objects:v135 count:16];
            }

            while (v67);
          }

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v71 = obj;
            if (v100)
            {
              if ([v59 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v59,  @"tags",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"tagsOnSourceOnly",  0LL),  0LL);
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }

          else
          {
            id v71 = obj;
          }

          id v72 = [v71 mutableCopy];
          __int128 v109 = 0u;
          __int128 v110 = 0u;
          __int128 v111 = 0u;
          __int128 v112 = 0u;
          id v73 = [v71 countByEnumeratingWithState:&v109 objects:v134 count:16];
          if (v73)
          {
            id v74 = v73;
            uint64_t v75 = *(void *)v110;
            do
            {
              for (id ii = 0LL; ii != v74; id ii = (char *)ii + 1)
              {
                if (*(void *)v110 != v75) {
                  objc_enumerationMutation(obj);
                }
                float v77 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)ii);
              }

              id v71 = obj;
              id v74 = [obj countByEnumeratingWithState:&v109 objects:v134 count:16];
            }

            while (v74);
          }

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v72 count]) {
              unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  [v72 allObjects],  @"tags",  0),  0);
            }
            else {
              unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100)
            {
              if ([v59 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v59,  @"tags",  0LL),  0LL);
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }

            if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100)
            {
              if ([v65 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v65,  @"tags",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"tagsOnSourceOnly",  0LL),  0LL);
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }

          id v78 = [v71 mutableCopy];
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          id v79 = [v71 countByEnumeratingWithState:&v105 objects:v133 count:16];
          if (v79)
          {
            id v80 = v79;
            uint64_t v81 = *(void *)v106;
            do
            {
              for (jj = 0LL; jj != v80; jj = (char *)jj + 1)
              {
                if (*(void *)v106 != v81) {
                  objc_enumerationMutation(obj);
                }
                id v83 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)jj);
              }

              id v80 = [obj countByEnumeratingWithState:&v105 objects:v133 count:16];
            }

            while (v80);
          }

          a3 = v102;
          p_cache = (void **)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v78 count]) {
              unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  [v78 allObjects],  @"tags",  0),  0);
            }
            else {
              unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100)
            {
              if ([v65 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:oneMatch:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v65,  @"tags",  0LL),  0LL);
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }

            if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100)
            {
              if ([v59 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v59,  @"tags",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"tagsOnSourceOnly",  0LL));
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }

            if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100)
            {
              if ([v65 count]) {
                unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v65,  @"tags",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"tagsOnSourceOnly",  0LL));
              }
              else {
                unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }

          id v12 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if ([obj count]) {
            unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  [obj allObjects],  @"tags",  0));
          }
          id v9 = v97;
          if (v13 == 0x7FFFFFFFFFFFFFFFLL && v100) {
            unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v103,  @"tags",  0LL));
          }
          if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_147;
          }
          if (v100)
          {
            unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }

          else
          {
            unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            if (v96) {
              unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v96,  @"tags",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL),  @"tagsOnSourceOnly",  0LL));
            }
          }

          if (v13 == 0x7FFFFFFFFFFFFFFFLL && v96) {
            unint64_t v13 = -[MPWeighter getRandomIndexMeetingContraints:]( self->_transitionWeighter,  "getRandomIndexMeetingContraints:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v96,  @"tags",  0LL));
          }
        }

        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_147:
          id v11 = v101;
          if (v13 >= (unint64_t)[v101 count])
          {
            unint64_t v84 = random();
            unint64_t v13 = v84 % (unint64_t)[v101 count];
          }

          goto LABEL_149;
        }

- (void)performInitialFaceDetectionInGroup:(id)a3 withOptions:(id)a4
{
  id v37 = [a3 layers];
  id v38 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  if ((objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAuthoringSkipFaceDetectionAtStart), "BOOLValue") & 1) == 0)
  {
    unsigned int v7 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "needsFaceDetectionForStyleID:",  v38);
    if ([a3 detectFacesInBackground])
    {
      if (v7)
      {
        id v36 = [v37 count];
        if ((uint64_t)v36 >= 1)
        {
          uint64_t v8 = 0LL;
          while (1)
          {
            uint64_t v40 = v8;
            id v9 = objc_msgSend(v37, "objectAtIndex:");
            unsigned int v10 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "hasImagesForLayerID:forStyleID:",  objc_msgSend(v9, "layerID"),  v38);
            uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v11);
            if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0) {
              break;
            }
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            id v13 = [v9 slides];
            id v14 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
            if (!v14) {
              goto LABEL_47;
            }
            id v15 = v14;
            uint64_t v16 = 0LL;
            uint64_t v17 = *(void *)v60;
            do
            {
              for (id i = 0LL; i != v15; id i = (char *)i + 1)
              {
                if (*(void *)v60 != v17) {
                  objc_enumerationMutation(v13);
                }
                if (v16 <= 4)
                {
                  uint64_t v19 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
                  [v19 showTime];
                  if (v20 < 3.0)
                  {
                    -[MPDocument regionsOfInterestForPath:detect:]( self->_authoredDocument,  "regionsOfInterestForPath:detect:",  [v19 path],  1);
                    ++v16;
                  }
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
            }

            while (v15);
            uint64_t v21 = v40;
            if (v16 > 4) {
              return;
            }
LABEL_48:
            uint64_t v8 = v21 + 1;
          }

          if (v10)
          {
            if ((uint64_t)[v9 countOfEffectContainers] >= 1)
            {
              __int128 v57 = 0u;
              __int128 v58 = 0u;
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              id obj = [v9 effectContainers];
              id v42 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
              if (v42)
              {
                uint64_t v22 = 0LL;
                uint64_t v41 = *(void *)v56;
LABEL_23:
                uint64_t v23 = 0LL;
                while (1)
                {
                  if (*(void *)v56 != v41) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v24 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
                  __int128 v51 = 0u;
                  __int128 v52 = 0u;
                  __int128 v53 = 0u;
                  __int128 v54 = 0u;
                  uint64_t v43 = v23;
                  unsigned __int8 v44 = v24;
                  id v45 = [v24 effects];
                  id v25 = [v45 countByEnumeratingWithState:&v51 objects:v64 count:16];
                  if (v25)
                  {
                    id v26 = v25;
                    uint64_t v46 = *(void *)v52;
LABEL_28:
                    uint64_t v27 = 0LL;
                    while (1)
                    {
                      if (*(void *)v52 != v46) {
                        objc_enumerationMutation(v45);
                      }
                      id v28 = *(void **)(*((void *)&v51 + 1) + 8 * v27);
                      __int128 v47 = 0u;
                      __int128 v48 = 0u;
                      __int128 v49 = 0u;
                      __int128 v50 = 0u;
                      id v29 = [v28 slides];
                      id v30 = [v29 countByEnumeratingWithState:&v47 objects:v63 count:16];
                      if (v30)
                      {
                        id v31 = v30;
                        uint64_t v32 = *(void *)v48;
                        do
                        {
                          for (j = 0LL; j != v31; j = (char *)j + 1)
                          {
                            if (*(void *)v48 != v32) {
                              objc_enumerationMutation(v29);
                            }
                            if (v22 <= 4)
                            {
                              id v34 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
                              [v34 showTime];
                              if (v35 < 3.0)
                              {
                                -[MPDocument regionsOfInterestForPath:detect:]( self->_authoredDocument,  "regionsOfInterestForPath:detect:",  [v34 path],  1);
                                ++v22;
                              }
                            }
                          }

                          id v31 = [v29 countByEnumeratingWithState:&v47 objects:v63 count:16];
                        }

                        while (v31);
                      }

                      if (v22 > 4) {
                        break;
                      }
                      if ((id)++v27 == v26)
                      {
                        id v26 = [v45 countByEnumeratingWithState:&v51 objects:v64 count:16];
                        if (v26) {
                          goto LABEL_28;
                        }
                        break;
                      }
                    }
                  }

                  uint64_t v23 = v43 + 1;
                  if ((id)(v43 + 1) == v42)
                  {
                    id v42 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
                    if (v42) {
                      goto LABEL_23;
                    }
                    break;
                  }
                }
              }
            }
          }

- (void)configurePanoramaInformationToEffect:(id)a3 inDocument:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 removeOldIndex:(int64_t)a7
{
  if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsPanoInformation:",  objc_msgSend(a3, "effectID")))
  {
    id v12 = [a3 slides];
    if (a6 <= 0) {
      a6 = (int64_t)[v12 count] - a5;
    }
    int64_t v51 = a7;
    id v13 = objc_msgSend( objc_msgSend(a3, "slides"),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a5, a6));
    id v14 = [a3 effectAttributeForKey:@"breakInformation"];
    if (!v14) {
      id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    }
    __int128 v52 = v14;
    id v50 = a3;
    id v15 = [a3 liveIndex];
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v16 = [v13 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v16)
    {
      id v17 = v16;
      int64_t v18 = (int64_t)v15 + a5;
      uint64_t v19 = *(void *)v70;
      uint64_t v53 = *(void *)v70;
      id v54 = v13;
      do
      {
        double v20 = 0LL;
        id v55 = v17;
        do
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v20);
          objc_msgSend(a4, "resolutionForPath:", objc_msgSend(v21, "path"));
          double v24 = v22 / v23;
          if (v22 / v23 < 0.5 || v24 > 2.0)
          {
            __int128 v56 = ImageKey(v18);
            id v26 = objc_msgSend(a4, "regionsOfInterestForPath:", objc_msgSend(v21, "path"));
            uint64_t v27 = v26;
            if (v24 >= 1.0)
            {
              __int128 v67 = 0uLL;
              __int128 v68 = 0uLL;
              __int128 v65 = 0uLL;
              __int128 v66 = 0uLL;
              id v35 = [v26 countByEnumeratingWithState:&v65 objects:v75 count:16];
              if (v35)
              {
                id v36 = v35;
                char v37 = 0;
                char v31 = 0;
                uint64_t v38 = *(void *)v66;
                do
                {
                  for (id i = 0LL; i != v36; id i = (char *)i + 1)
                  {
                    if (*(void *)v66 != v38) {
                      objc_enumerationMutation(v27);
                    }
                    double v40 = COERCE_DOUBLE(CGRectFromString((NSString *)[*(id *)(*((void *)&v65 + 1) + 8 * (void)i) objectForKey:kMPMetaDataRegionOfInterestBounds]));
                    v31 |= v40 < 0.333000004;
                    v37 |= v40 > 0.666000009;
                  }

                  id v36 = [v27 countByEnumeratingWithState:&v65 objects:v75 count:16];
                }

                while (v36);
                char v41 = v37 ^ v31;
                uint64_t v19 = v53;
                id v13 = v54;
                id v17 = v55;
                if ((v41 & 1) != 0)
                {
LABEL_33:
                  id v42 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                  if ((v31 & 1) != 0) {
                    uint64_t v43 = -1LL;
                  }
                  else {
                    uint64_t v43 = 1LL;
                  }
                  objc_msgSend( v42,  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v43),  @"panEndDirection");
                  [v52 setObject:v42 forKey:v56];
                }
              }
            }

            else
            {
              __int128 v63 = 0uLL;
              __int128 v64 = 0uLL;
              __int128 v61 = 0uLL;
              __int128 v62 = 0uLL;
              id v28 = [v26 countByEnumeratingWithState:&v61 objects:v74 count:16];
              if (v28)
              {
                id v29 = v28;
                char v30 = 0;
                char v31 = 0;
                uint64_t v32 = *(void *)v62;
                do
                {
                  for (j = 0LL; j != v29; j = (char *)j + 1)
                  {
                    if (*(void *)v62 != v32) {
                      objc_enumerationMutation(v27);
                    }
                    CGRect v77 = CGRectFromString((NSString *)[*(id *)(*((void *)&v61 + 1) + 8 * (void)j) objectForKey:kMPMetaDataRegionOfInterestBounds]);
                    v31 |= v77.origin.y < 0.333000004;
                    v30 |= v77.origin.y > 0.666000009;
                  }

                  id v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v74, 16, v77.origin.x);
                }

                while (v29);
                int v34 = v30 & 1;
                uint64_t v19 = v53;
                id v13 = v54;
                id v17 = v55;
                if (v34 != (v31 & 1)) {
                  goto LABEL_33;
                }
              }
            }
          }

          ++v18;
          double v20 = (char *)v20 + 1;
        }

        while (v20 != v17);
        id v17 = [v13 countByEnumeratingWithState:&v69 objects:v76 count:16];
      }

      while (v17);
    }

    if ([v52 count]) {
      [v50 setEffectAttribute:v52 forKey:@"breakInformation"];
    }
    if (v51 >= 1)
    {
      id v44 = [v52 allKeys];
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v45 = [v44 countByEnumeratingWithState:&v57 objects:v73 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v58;
        do
        {
          for (id k = 0LL; k != v46; id k = (char *)k + 1)
          {
            if (*(void *)v58 != v47) {
              objc_enumerationMutation(v44);
            }
            __int128 v49 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)k);
          }

          id v46 = [v44 countByEnumeratingWithState:&v57 objects:v73 count:16];
        }

        while (v46);
      }
    }
  }

- (void)startLogging
{
  self->_logTiming = MRGetCurrentTime();
  if (self->_logLevel >= 2)
  {
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"numOfLandscapes");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"numOfPortraits");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"movieCount");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"numOfDZPortraits");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"numOfDZLandscapes");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"numOfDZSquares");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"misplacedLandscapes");
    -[NSMutableDictionary setObject:forKey:]( self->_stats,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"misplacedPortraits");
  }

- (void)finishLogging
{
  if (self->_logLevel >= 1)
  {
    v2 = self;
    double v3 = MRGetCurrentTime();
    authoredDocument = v2->_authoredDocument;
    id v5 = authoredDocument ? -[MPDocument styleID](authoredDocument, "styleID") : @"None";
    NSLog( @"iLifeSlideshow Authoring: Seed #: %d, Style ID: %@, Time Taken: %.5f",  v2->_seed,  v5,  v3 - v2->_logTiming);
    if (v2->_logLevel >= 2)
    {
      NSLog(@"Quick Stats:");
      id v6 = (char *)objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfLandscapes"),  "integerValue");
      id v7 = objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfPortraits"),  "integerValue");
      NSLog( @" - Images: %d Count, %d Landscapes, %d Portraits, Including %d Movies",  &v6[(void)v7],  v6,  v7,  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"movieCount"),  "integerValue"));
      NSLog( @" - Drop Zones: %d Landscapes, %d Portraits, %d Squares",  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZLandscapes"),  "integerValue"),  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZPortraits"),  "integerValue"),  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZSquares"),  "integerValue"));
      NSLog( @" - Wrong Aspect Ratio Placement: %d Landscapes, %d Portraits",  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"misplacedLandscapes"),  "integerValue"),  objc_msgSend( -[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"misplacedPortraits"),  "integerValue"));
      if (v2->_logLevel >= 3)
      {
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v8 = -[MPWeighter allConstraints](v2->_weighter, "allConstraints");
        id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          double v23 = v2;
          uint64_t v11 = 0LL;
          uint64_t v12 = 0LL;
          uint64_t v13 = 0LL;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (id i = 0LL; i != v10; id i = (char *)i + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v8);
              }
              id v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
              v13 += v16[8];
              v11 += v16[9];
              v12 += v16[7];
            }

            id v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }

          while (v10);
          v2 = v23;
        }

        else
        {
          uint64_t v11 = 0LL;
          uint64_t v12 = 0LL;
          uint64_t v13 = 0LL;
        }

        NSLog(@" - Default %@ Dropzones: %d Landscapes, %d Portraits, %d Squares", v5, v13, v11, v12);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v17 = -[MPWeighter allUsageCounts](v2->_weighter, "allUsageCounts");
        id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = 0LL;
          uint64_t v21 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v17);
              }
              NSLog( @" - %@ : %d",  objc_msgSend(-[MPWeighter allItems](v2->_weighter, "allItems"), "objectAtIndex:", (char *)j + v20),  objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)j), "integerValue"));
            }

            id v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            v20 += (uint64_t)j;
          }

          while (v19);
        }
      }
    }
  }

- (void)moveSlidesFromIndicies:(id)a3 toIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  unint64_t v11 = +[MPAuthoringUtilities reorderModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reorderModeFromOptions:",  v6);
  switch(v11)
  {
    case 1uLL:
      id v18 = objc_autoreleasePoolPush();
      -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a5);
      objc_msgSend(objc_msgSend(a5, "montage"), "lock");
      id v19 = [a5 mainLayers];
      if ([v19 count])
      {
        id v20 = [v19 lastObject];
        if ((uint64_t)[v20 countOfEffectContainers] >= 1)
        {
          unsigned int v21 = [a3 containsIndex:0];
          if (!a4 || (id v22 = 0LL, v21)) {
            id v22 = -[MPAuthoringController _grabAndRemoveTitleEffectFromDocument:withOptions:]( self,  "_grabAndRemoveTitleEffectFromDocument:withOptions:",  a5,  v6);
          }
          uint64_t v23 = 0LL;
          if (!objc_msgSend(objc_msgSend(v20, "objectInEffectContainersAtIndex:", 0), "countOfEffects"))
          {
            uint64_t v23 = 0LL;
            do
              ++v23;
            while (!objc_msgSend(objc_msgSend(v20, "objectInEffectContainersAtIndex:", v23), "countOfEffects"));
          }

          id v24 = [a3 indexSetWithOffset:v23];
          int64_t v25 = v23 + a4;
          if (v25 >= (uint64_t)[v20 countOfEffectContainers] - 1)
          {
            uint64_t v26 = (uint64_t)objc_msgSend( objc_msgSend(objc_msgSend(v20, "effectContainers"), "lastObject"),  "countOfEffects") < 1 || -[MPAuthoringController _numberOfSlidesForOutroInLayer:withOptions:]( self,  "_numberOfSlidesForOutroInLayer:withOptions:",  v20,  v6) == 0;
            if (v25 >= (uint64_t)[v20 countOfEffectContainers] - v26)
            {
              char v37 = [v20 countOfEffectContainers];
              int64_t v25 = v37 - (_BYTE *)[v24 count];
            }

            v25 -= v26;
          }

          [v20 moveEffectContainersFromIndices:v24 toIndex:v25];
          if (v22) {
            -[MPAuthoringController _readdTitleEffect:toDocument:withOptions:]( self,  "_readdTitleEffect:toDocument:withOptions:",  v22,  a5,  v6);
          }
        }
      }

      id v38 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      [a5 setVideoPaths:v38];

      objc_msgSend(objc_msgSend(a5, "montage"), "unlock");
      -[MPAuthoringController cleanup](self, "cleanup");
      objc_autoreleasePoolPop(v18);
      break;
    case 2uLL:
      id v39 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v17 = [v39 objectsAtIndexes:a3];
      -[MPAuthoringController removeSlidesAtIndicies:inDocument:withOptions:]( self,  "removeSlidesAtIndicies:inDocument:withOptions:",  a3,  a5,  v6);
      -[MPAuthoringController insertVideoPaths:atIndex:inDocument:withOptions:]( self,  "insertVideoPaths:atIndex:inDocument:withOptions:",  v17,  a4,  a5,  v6);

      return;
    case 3uLL:
      id v12 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v13 = [v12 objectsAtIndexes:a3];
      [v12 removeObjectsAtIndexes:a3];
      objc_msgSend( v12,  "insertObjects:atIndexes:",  v13,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  objc_msgSend(v13, "count")));
      [a5 setVideoPaths:v12];

      id v14 = [v6 objectForKey:kMPAuthoringUseBestAspectRatio];
      if (!v14)
      {
        id v35 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
        [a5 setAuthoringOption:v35 forKey:kMPAuthoringUseBestAspectRatio];
        -[MPAuthoringController authorDocument:withOptions:](self, "authorDocument:withOptions:", a5, v6);
LABEL_37:
        id v36 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
        [a5 setAuthoringOption:v36 forKey:kMPAuthoringUseBestAspectRatio];
        return;
      }

      unsigned __int8 v15 = [v14 BOOLValue];
      id v16 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
      [a5 setAuthoringOption:v16 forKey:kMPAuthoringUseBestAspectRatio];
      -[MPAuthoringController authorDocument:withOptions:](self, "authorDocument:withOptions:", a5, v6);
      if ((v15 & 1) != 0) {
        goto LABEL_37;
      }
      break;
    default:
      id v27 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v28 = [v27 objectsAtIndexes:a3];
      [v27 removeObjectsAtIndexes:a3];
      objc_msgSend( v27,  "insertObjects:atIndexes:",  v28,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  objc_msgSend(v28, "count")));
      [a5 setVideoPaths:v27];

      id v29 = +[MPAuthoringUtilities subtitlesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "subtitlesFromOptions:",  v6);
      if (v29)
      {
        __int128 v30 = v29;
        if ([v29 count])
        {
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id v31 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v41;
            do
            {
              int v34 = 0LL;
              do
              {
                if (*(void *)v41 != v33) {
                  objc_enumerationMutation(v30);
                }
                -[MPAuthoringController removeStyledCaptionFromSlide:inDocument:withOptions:]( self,  "removeStyledCaptionFromSlide:inDocument:withOptions:",  +[MPUtilities slideForPath:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForPath:inDocument:",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)v34),  a5),  a5,  v6);
                int v34 = (char *)v34 + 1;
              }

              while (v32 != v34);
              id v32 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
            }

            while (v32);
          }
        }
      }

      -[MPAuthoringController _reorderImagesInDocument:withOptions:]( self,  "_reorderImagesInDocument:withOptions:",  a5,  v6);
      break;
  }

- (void)insertVideoPaths:(id)a3 atIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  id v101 = +[MPAuthoringUtilities reorderModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reorderModeFromOptions:",  v6);
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v135 objects:v147 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v136;
    do
    {
      for (id i = 0LL; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v136 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
        if (([v14 hasPrefix:@"iphoto://"] & 1) != 0
          || [v14 hasPrefix:@"aperture://"])
        {
          [a5 absolutePathForAssetAtPath:v14];
        }
      }

      id v11 = [a3 countByEnumeratingWithState:&v135 objects:v147 count:16];
    }

    while (v11);
  }

  unsigned __int8 v15 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", a3);
  uint64_t v16 = (uint64_t)v101;
  if (v101 == (_BYTE *)&dword_0 + 2)
  {
    id v17 = [a5 allSlides];
    if ((unint64_t)[v17 count] <= a4 || (id v18 = objc_msgSend(v17, "objectAtIndex:", a4)) == 0)
    {
      id v30 = [a5 mainLayers];
      id v29 = self;
      if ([v30 count]) {
        a4 = (int64_t)objc_msgSend(objc_msgSend(v30, "lastObject"), "countOfEffectContainers");
      }
      goto LABEL_31;
    }

    id v19 = v18;
    id v20 = [v18 parentEffect];
    id v21 = [v19 index];
    if (v21 >= objc_msgSend(objc_msgSend(v20, "slides"), "count")
      || (unint64_t)objc_msgSend(objc_msgSend(v20, "slides"), "count") < 2)
    {
      a4 = (int64_t)objc_msgSend(objc_msgSend(v20, "parentContainer"), "index");
      id v29 = self;
      goto LABEL_31;
    }

    id v97 = v20;
    id v22 = objc_msgSend( objc_msgSend(v20, "slides"),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  objc_msgSend(v19, "index"),  (_BYTE *)objc_msgSend(objc_msgSend(v20, "slides"), "count") - (_BYTE *)objc_msgSend(v19, "index")));
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v131 objects:v146 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v132;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v132 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)j);
          id v28 = objc_msgSend(objc_msgSend(v27, "path"), "copy");
          objc_msgSend(v27, "setPath:", -[NSMutableArray objectAtIndex:](v15, "objectAtIndex:", 0));
          -[NSMutableArray removeObjectAtIndex:](v15, "removeObjectAtIndex:", 0LL);
          -[NSMutableArray addObject:](v15, "addObject:", v28);
        }

        id v24 = [v22 countByEnumeratingWithState:&v131 objects:v146 count:16];
      }

      while (v24);
    }

    a4 = (int64_t)objc_msgSend(objc_msgSend(v97, "parentContainer"), "index") + 1;
    uint64_t v16 = 2LL;
  }

  id v29 = self;
  if (v16 == 3)
  {
LABEL_42:
    id v36 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
    objc_msgSend( v36,  "insertObjects:atIndexes:",  v15,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  -[NSMutableArray count](v15, "count")));
    [a5 setVideoPaths:v36];

    id v37 = [v6 objectForKey:kMPAuthoringUseBestAspectRatio];
    if (v37)
    {
      unsigned __int8 v38 = [v37 BOOLValue];
      id v39 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
      [a5 setAuthoringOption:v39 forKey:kMPAuthoringUseBestAspectRatio];
      -[MPAuthoringController authorDocument:withOptions:](v29, "authorDocument:withOptions:", a5, v6);
      if ((v38 & 1) == 0) {
        return;
      }
    }

    else
    {
      __int128 v41 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
      [a5 setAuthoringOption:v41 forKey:kMPAuthoringUseBestAspectRatio];
      -[MPAuthoringController authorDocument:withOptions:](v29, "authorDocument:withOptions:", a5, v6);
    }

    __int128 v42 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    [a5 setAuthoringOption:v42 forKey:kMPAuthoringUseBestAspectRatio];
    return;
  }

- (void)removeSlidesAtIndicies:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v7 = a3;
  if (![a3 count]) {
    return;
  }
  if (!a5) {
    a5 = [a4 documentAttributeForKey:kMPDocumentAuthoringOptions[0]];
  }
  id v160 = a5;
  id v139 = a4;
  id v144 = self;
  switch(+[MPAuthoringUtilities reorderModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reorderModeFromOptions:",  a5))
  {
    case 1uLL:
      id v9 = objc_autoreleasePoolPush();
      -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
      objc_msgSend(objc_msgSend(a4, "montage"), "lock");
      id v10 = [a4 mainLayers];
      if ([v10 count])
      {
        id v11 = [v10 lastObject];
        if ((objc_msgSend( objc_msgSend(v160, "objectForKey:", @"skipEmptyContainerCheck"),  "BOOLValue") & 1) == 0)
        {
          uint64_t v12 = 0LL;
          if (!objc_msgSend(objc_msgSend(v11, "objectInEffectContainersAtIndex:", 0), "countOfEffects"))
          {
            uint64_t v12 = 0LL;
            do
              ++v12;
            while (!objc_msgSend(objc_msgSend(v11, "objectInEffectContainersAtIndex:", v12), "countOfEffects"));
          }

          id v7 = objc_msgSend( objc_msgSend(v7, "indexSetWithOffset:", v12),  "indexSetWithMaximum:",  (char *)objc_msgSend(v11, "countOfEffectContainers") - 1);
        }

        if ([v7 containsIndex:0]
          && (uint64_t)[v11 countOfEffectContainers] > 0)
        {
          id v13 = v160;
          id v14 = -[MPAuthoringController _grabAndRemoveTitleEffectFromDocument:withOptions:]( self,  "_grabAndRemoveTitleEffectFromDocument:withOptions:",  a4,  v160);
          [v11 removeEffectContainersAtIndices:v7];
          if (v14) {
            -[MPAuthoringController _readdTitleEffect:toDocument:withOptions:]( self,  "_readdTitleEffect:toDocument:withOptions:",  v14,  a4,  v160);
          }
        }

        else
        {
          [v11 removeEffectContainersAtIndices:v7];
          id v13 = v160;
        }

        -[MPAuthoringController _checkForEmptyLayersInDocument:](self, "_checkForEmptyLayersInDocument:", a4);
        -[MPAuthoringController scaleDurationsInDocument:withOptions:]( self,  "scaleDurationsInDocument:withOptions:",  a4,  v13);
      }

      id v134 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [a4 setVideoPaths:v134];

      objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
      -[MPAuthoringController cleanup](self, "cleanup");
      objc_autoreleasePoolPop(v9);
      return;
    case 2uLL:
      context = objc_autoreleasePoolPush();
      -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
      objc_msgSend(objc_msgSend(a4, "montage"), "lock");
      id v173 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      id v15 = [a4 mainLayers];
      if ([v15 count])
      {
        id v169 = [v15 lastObject];
        id v16 = objc_msgSend(objc_msgSend(a4, "allSlides"), "objectsAtIndexes:", v7);
        __int128 v196 = 0u;
        __int128 v197 = 0u;
        __int128 v198 = 0u;
        __int128 v199 = 0u;
        id v17 = [v16 countByEnumeratingWithState:&v196 objects:v245 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v197;
          do
          {
            for (id i = 0LL; i != v18; id i = (char *)i + 1)
            {
              if (*(void *)v197 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v196 + 1) + 8LL * (void)i);
              id v22 = [v21 parentEffect];
              if (objc_msgSend(objc_msgSend(v22, "slides"), "count") == (char *)&dword_0 + 1)
              {
                id v23 = +[NSIndexSet indexSetWithIndex:]( NSIndexSet,  "indexSetWithIndex:",  objc_msgSend(objc_msgSend(v22, "parentContainer"), "index"));
                id v24 = 0LL;
                if (-[NSIndexSet containsIndex:](v23, "containsIndex:", 0LL))
                {
                  else {
                    id v24 = -[MPAuthoringController _grabAndRemoveTitleEffectFromDocument:withOptions:]( self,  "_grabAndRemoveTitleEffectFromDocument:withOptions:",  v139,  v160);
                  }
                }

                objc_msgSend( objc_msgSend(objc_msgSend(v22, "parentContainer"), "parentLayer"),  "removeEffectContainersAtIndices:",  v23);
                if (v24) {
                  -[MPAuthoringController _readdTitleEffect:toDocument:withOptions:]( self,  "_readdTitleEffect:toDocument:withOptions:",  v24,  v139,  v160);
                }
              }

              else
              {
                [v22 setReplaceSlides:0];
                objc_msgSend( v22,  "removeSlidesAtIndices:",  +[NSIndexSet indexSetWithIndex:]( NSIndexSet,  "indexSetWithIndex:",  objc_msgSend(v21, "index")));
                [v22 setReplaceSlides:1];
                id v25 = [v160 mutableCopy];
                uint64_t v26 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
                [v25 setObject:v26 forKey:kMPAuthoringUseTitleEffect];
                [v25 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
                id v27 = -[MPAuthoringController effectsForImages:withOptions:]( self,  "effectsForImages:withOptions:",  [v22 videoPaths],  v25);

                if ([v27 count] == (char *)&dword_0 + 1)
                {
                  id v28 = [v27 lastObject];
                  objc_msgSend( v22,  "setEffectID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v28));
                  objc_msgSend( v22,  "setPresetID:",  +[MPUtilities presetIDOfCombinedID:](MPUtilities, "presetIDOfCombinedID:", v28));
                }
              }

              objc_msgSend(v173, "addObject:", objc_msgSend(v21, "path"));
            }

            id v18 = [v16 countByEnumeratingWithState:&v196 objects:v245 count:16];
          }

          while (v18);
        }

        a4 = v139;
        -[MPAuthoringController _checkForEmptyLayersInDocument:](self, "_checkForEmptyLayersInDocument:", v139);
        -[MPAuthoringController scaleDurationsInDocument:withOptions:]( self,  "scaleDurationsInDocument:withOptions:",  v139,  v160);
      }

      id v29 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [a4 setVideoPaths:v29];
      id v30 = [v29 count];
      if ((uint64_t)v30 >= 1)
      {
        unint64_t v31 = (unint64_t)v30;
        __int128 v194 = 0u;
        __int128 v195 = 0u;
        __int128 v192 = 0u;
        __int128 v193 = 0u;
        id obj = [v139 layers];
        id v142 = [obj countByEnumeratingWithState:&v192 objects:v244 count:16];
        if (v142)
        {
          id v140 = *(id *)v193;
          do
          {
            uint64_t v32 = 0LL;
            do
            {
              if (*(id *)v193 != v140) {
                objc_enumerationMutation(obj);
              }
              uint64_t v146 = v32;
              id v33 = *(void **)(*((void *)&v192 + 1) + 8 * v32);
              if (([v33 isAudioLayer] & 1) == 0)
              {
                __int128 v190 = 0u;
                __int128 v191 = 0u;
                __int128 v188 = 0u;
                __int128 v189 = 0u;
                id v148 = [v33 effectContainers];
                id v154 = [v148 countByEnumeratingWithState:&v188 objects:v243 count:16];
                if (v154)
                {
                  uint64_t v151 = *(void *)v189;
                  do
                  {
                    uint64_t v34 = 0LL;
                    do
                    {
                      if (*(void *)v189 != v151) {
                        objc_enumerationMutation(v148);
                      }
                      uint64_t v157 = v34;
                      uint64_t v35 = *(void **)(*((void *)&v188 + 1) + 8 * v34);
                      __int128 v184 = 0u;
                      __int128 v185 = 0u;
                      __int128 v186 = 0u;
                      __int128 v187 = 0u;
                      id v161 = [v35 effects];
                      __int128 v166 = (char *)[v161 countByEnumeratingWithState:&v184 objects:v242 count:16];
                      if (v166)
                      {
                        uint64_t v163 = *(void *)v185;
                        do
                        {
                          id v36 = 0LL;
                          do
                          {
                            if (*(void *)v185 != v163) {
                              objc_enumerationMutation(v161);
                            }
                            double v170 = v36;
                            id v37 = *(void **)(*((void *)&v184 + 1) + 8LL * (void)v36);
                            id v38 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                            __int128 v180 = 0u;
                            __int128 v181 = 0u;
                            __int128 v182 = 0u;
                            __int128 v183 = 0u;
                            id v39 = [v37 secondarySlides];
                            id v40 = [v39 countByEnumeratingWithState:&v180 objects:v241 count:16];
                            if (v40)
                            {
                              id v41 = v40;
                              uint64_t v42 = *(void *)v181;
                              do
                              {
                                for (j = 0LL; j != v41; j = (char *)j + 1)
                                {
                                  if (*(void *)v181 != v42) {
                                    objc_enumerationMutation(v39);
                                  }
                                  objc_msgSend( v38,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v180 + 1) + 8 * (void)j), "path"));
                                }

                                id v41 = [v39 countByEnumeratingWithState:&v180 objects:v241 count:16];
                              }

                              while (v41);
                            }

                            __int128 v178 = 0u;
                            __int128 v179 = 0u;
                            __int128 v176 = 0u;
                            __int128 v177 = 0u;
                            id v44 = [v37 secondarySlides];
                            id v45 = [v44 countByEnumeratingWithState:&v176 objects:v240 count:16];
                            if (v45)
                            {
                              id v46 = v45;
                              uint64_t v47 = *(void *)v177;
                              do
                              {
                                for (id k = 0LL; k != v46; id k = (char *)k + 1)
                                {
                                  if (*(void *)v177 != v47) {
                                    objc_enumerationMutation(v44);
                                  }
                                  __int128 v49 = *(void **)(*((void *)&v176 + 1) + 8LL * (void)k);
                                  if (objc_msgSend(v173, "indexOfObject:", objc_msgSend(v49, "path")) != (id)0x7FFFFFFFFFFFFFFFLL)
                                  {
                                    do
                                      id v50 = [v29 objectAtIndex:random() % (uint64_t)v31];
                                    while ([v38 indexOfObject:v50] != (id)0x7FFFFFFFFFFFFFFFLL
                                         && v31 > (unint64_t)[v38 count]);
                                    [v49 setPath:v50];
                                  }
                                }

                                id v46 = [v44 countByEnumeratingWithState:&v176 objects:v240 count:16];
                              }

                              while (v46);
                            }

                            id v36 = v170 + 1;
                          }

                          while (v170 + 1 != v166);
                          __int128 v166 = (char *)[v161 countByEnumeratingWithState:&v184 objects:v242 count:16];
                        }

                        while (v166);
                      }

                      uint64_t v34 = v157 + 1;
                    }

                    while ((id)(v157 + 1) != v154);
                    id v154 = [v148 countByEnumeratingWithState:&v188 objects:v243 count:16];
                  }

                  while (v154);
                }
              }

              uint64_t v32 = v146 + 1;
            }

            while ((id)(v146 + 1) != v142);
            id v142 = [obj countByEnumeratingWithState:&v192 objects:v244 count:16];
          }

          while (v142);
        }
      }

      objc_msgSend(objc_msgSend(v139, "montage"), "unlock");
      -[MPAuthoringController cleanup](v144, "cleanup");
      objc_autoreleasePoolPop(context);
      return;
    case 3uLL:
      id v51 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [v51 removeObjectsAtIndexes:v7];
      [a4 setVideoPaths:v51];

      id v52 = [v160 objectForKey:kMPAuthoringUseBestAspectRatio];
      if (v52) {
        unsigned int v53 = [v52 BOOLValue];
      }
      else {
        unsigned int v53 = 1;
      }
      __int128 v135 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
      [a4 setAuthoringOption:v135 forKey:kMPAuthoringUseBestAspectRatio];
      if (objc_msgSend(objc_msgSend(a4, "videoPaths"), "count"))
      {
        -[MPAuthoringController authorDocument:withOptions:](self, "authorDocument:withOptions:", a4, v160);
        if (!v53) {
          return;
        }
      }

      else
      {
        [a4 removeAllLayers];
        if (!v53) {
          return;
        }
      }

      __int128 v136 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
      [a4 setAuthoringOption:v136 forKey:kMPAuthoringUseBestAspectRatio];
      return;
    case 4uLL:
      id v54 = objc_msgSend(objc_msgSend(a4, "allSlides"), "objectsAtIndexes:", v7);
      id v171 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      id v174 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      __int128 v236 = 0u;
      __int128 v237 = 0u;
      __int128 v238 = 0u;
      __int128 v239 = 0u;
      id v55 = [v54 countByEnumeratingWithState:&v236 objects:v255 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v237;
        do
        {
          for (m = 0LL; m != v56; m = (char *)m + 1)
          {
            if (*(void *)v237 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void **)(*((void *)&v236 + 1) + 8LL * (void)m);
            id v60 = objc_msgSend(objc_msgSend(v59, "parentEffect"), "parentContainer");
            id v61 = objc_msgSend( v171,  "objectForKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(v60, "index")));
            if (!v61)
            {
              id v61 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
              objc_msgSend( v171,  "setObject:forKey:",  v61,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v60, "index")));
            }

            [v61 addObject:v59];
            objc_msgSend(v174, "addObject:", objc_msgSend(v59, "path"));
          }

          id v56 = [v54 countByEnumeratingWithState:&v236 objects:v255 count:16];
        }

        while (v56);
      }

      id v62 = [a4 mainLayers];
      uint64_t v63 = v144;
      id v64 = v160;
      if (![v62 count]) {
        return;
      }
      id v65 = [v62 lastObject];
      id v66 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v160);
      id v67 = [v160 objectForKey:kMPAuthoringStyleID];
      id v68 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "reorderModeForStyleID:",  v67);
      id v69 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIndexForLayerID:ofStyle:",  objc_msgSend(v65, "layerID"),  v67));
      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v69, kMPAuthoringLayerIndex);
      id v70 = +[NSMutableArray arrayWithArray:]( NSMutableArray,  "arrayWithArray:",  [a4 videoPaths]);
      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v70, kMPAuthoringSecondaryPaths);
      __int128 v235 = 0u;
      __int128 v234 = 0u;
      __int128 v233 = 0u;
      __int128 v232 = 0u;
      id v164 = [v171 countByEnumeratingWithState:&v232 objects:v254 count:16];
      if (!v164) {
        goto LABEL_161;
      }
      unsigned __int8 v149 = 0;
      unint64_t v167 = (unint64_t)v68 - 1;
      uint64_t v71 = *(void *)v233;
      id v155 = v65;
      id v158 = v66;
      uint64_t v152 = *(void *)v233;
      break;
    default:
      id v175 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [v175 removeObjectsAtIndexes:v7];
      [a4 setVideoPaths:v175];
      -[MPAuthoringController _reorderImagesInDocument:withOptions:]( self,  "_reorderImagesInDocument:withOptions:",  a4,  a5);

      return;
  }

  do
  {
    for (n = 0LL; n != v164; n = (char *)n + 1)
    {
      if (*(void *)v233 != v71) {
        objc_enumerationMutation(v171);
      }
      id v73 = [v171 objectForKey:*(void *)(*((void *)&v232 + 1) + 8 * (void)n)];
      id v74 = objc_msgSend(objc_msgSend(v73, "lastObject"), "parentEffect");
      id v75 = objc_msgSend(objc_msgSend(v74, "parentContainer"), "index");
      id v76 = [v74 countOfSlides];
      id v77 = [v73 count];
      BOOL v79 = v167 < 2 || (uint64_t)v75 > 0;
      if (v76 == v77 && v79)
      {
        if (v75)
        {
          id v90 = 0LL;
        }

        else
        {
          id v90 = 0LL;
          if ((uint64_t)[v65 countOfEffectContainers] >= 1 && v167 <= 1) {
            id v90 = -[MPAuthoringController _grabAndRemoveTitleEffectFromDocument:withOptions:]( v63,  "_grabAndRemoveTitleEffectFromDocument:withOptions:",  a4,  v160);
          }
        }

        objc_msgSend( v65,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v75));
        if (v90) {
          -[MPAuthoringController _readdTitleEffect:toDocument:withOptions:]( v63,  "_readdTitleEffect:toDocument:withOptions:",  v90,  a4,  v160);
        }
        continue;
      }

      id v81 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      __int128 v228 = 0u;
      __int128 v229 = 0u;
      __int128 v230 = 0u;
      __int128 v231 = 0u;
      id v82 = [v74 slides];
      id v83 = [v82 countByEnumeratingWithState:&v228 objects:v253 count:16];
      if (v83)
      {
        id v84 = v83;
        uint64_t v85 = *(void *)v229;
        do
        {
          for (id ii = 0LL; ii != v84; id ii = (char *)ii + 1)
          {
            if (*(void *)v229 != v85) {
              objc_enumerationMutation(v82);
            }
            uint64_t v87 = *(void **)(*((void *)&v228 + 1) + 8LL * (void)ii);
          }

          id v84 = [v82 countByEnumeratingWithState:&v228 objects:v253 count:16];
        }

        while (v84);
      }

      id v65 = v155;
      if (!v75 && v167 >= 2)
      {
        id v88 = [v74 countOfSlides];
        a4 = v139;
        uint64_t v63 = v144;
        id v66 = v158;
        if (v88 == [v73 count])
        {
          id v89 = [v160 objectForKey:kMPAuthoringUseTitleEffect];
          if (v89) {
            unsigned __int8 v149 = [v89 BOOLValue];
          }
          else {
            unsigned __int8 v149 = 1;
          }
        }

        [v155 countOfEffectContainers];
LABEL_130:
        id v91 = 0LL;
        goto LABEL_131;
      }

      a4 = v139;
      uint64_t v63 = v144;
      id v66 = v158;
      if (v75) {
        goto LABEL_130;
      }
      id v91 = 0LL;
      if ((uint64_t)[v155 countOfEffectContainers] >= 1 && v167 <= 1) {
        id v91 = -[MPAuthoringController _grabAndRemoveTitleEffectFromDocument:withOptions:]( v144,  "_grabAndRemoveTitleEffectFromDocument:withOptions:",  v139,  v160);
      }
LABEL_131:
      objc_msgSend( v155,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v75));
      -[NSMutableDictionary removeObjectForKey:](v66, "removeObjectForKey:", kMPAuthoringOutroEffectID);
      -[NSMutableDictionary removeObjectForKey:](v66, "removeObjectForKey:", kMPAuthoringReconfigureIndices);
      uint64_t v92 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v92, kMPAuthoringUseTitleEffect);
      if ((uint64_t)v75 >= (uint64_t)[v155 countOfEffectContainers])
      {
        id v93 = -[MPAuthoringController _addVideoPaths:toEndOfLayer:inDocument:withOptions:]( v63,  "_addVideoPaths:toEndOfLayer:inDocument:withOptions:",  v81,  v155,  a4,  v66);
        if (!v91) {
          goto LABEL_136;
        }
LABEL_135:
        -[MPAuthoringController _readdTitleEffect:toDocument:withOptions:]( v63,  "_readdTitleEffect:toDocument:withOptions:",  v91,  a4,  v160);
        goto LABEL_136;
      }

      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", &stru_259C60, kMPAuthoringOutroEffectID);
      id v93 = -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( v63,  "effectContainersWithImages:effects:andOptions:",  v81,  -[MPAuthoringController effectsForImages:withOptions:](v63, "effectsForImages:withOptions:", v81, v66),  v66);
      [v155 insertEffectContainers:v93 atIndex:v75];
      if (v91) {
        goto LABEL_135;
      }
LABEL_136:
      if ([v93 count])
      {
        objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlidesInEffectContainers:inDocument:withOptions:",  v93,  a4,  v66);
        id v94 = objc_msgSend(objc_msgSend(v93, "objectAtIndex:", 0), "allSlides");
        if ([v94 count])
        {
          uint64_t v95 = +[NSValue valueWithRange:]( NSValue,  "valueWithRange:",  objc_msgSend( objc_msgSend(a4, "allSlides"),  "indexOfObject:",  objc_msgSend(v94, "objectAtIndex:", 0)),  objc_msgSend(v81, "count"));
          -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v95, kMPAuthoringReconfigureIndices);
          -[MPAuthoringController configureFiltersInDocument:withOptions:]( v63,  "configureFiltersInDocument:withOptions:",  a4,  v66);
          -[MPAuthoringController configureTransitionsInDocument:withOptions:]( v63,  "configureTransitionsInDocument:withOptions:",  a4,  v66);
        }
      }

      uint64_t v71 = v152;
    }

    id v164 = [v171 countByEnumeratingWithState:&v232 objects:v254 count:16];
  }

  while (v164);
  id v64 = v160;
  if ((v149 & 1) != 0 && (uint64_t)[v65 countOfEffectContainers] >= 1)
  {
    -[NSMutableDictionary removeObjectForKey:](v66, "removeObjectForKey:", kMPAuthoringOutroEffectID);
    -[NSMutableDictionary removeObjectForKey:](v66, "removeObjectForKey:", kMPAuthoringReconfigureIndices);
    uint64_t v96 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v96, kMPAuthoringUseTitleEffect);
    -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", &stru_259C60, kMPAuthoringOutroEffectID);
    id v97 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v224 = 0u;
    __int128 v225 = 0u;
    __int128 v226 = 0u;
    __int128 v227 = 0u;
    id v98 = objc_msgSend(objc_msgSend(objc_msgSend(v65, "effectContainers"), "objectAtIndex:", 0), "effects");
    id v99 = [v98 countByEnumeratingWithState:&v224 objects:v252 count:16];
    if (v99)
    {
      id v100 = v99;
      uint64_t v101 = *(void *)v225;
      do
      {
        for (jj = 0LL; jj != v100; jj = (char *)jj + 1)
        {
          if (*(void *)v225 != v101) {
            objc_enumerationMutation(v98);
          }
          __int128 v103 = *(void **)(*((void *)&v224 + 1) + 8LL * (void)jj);
          __int128 v220 = 0u;
          __int128 v221 = 0u;
          __int128 v222 = 0u;
          __int128 v223 = 0u;
          id v104 = [v103 slides];
          id v105 = [v104 countByEnumeratingWithState:&v220 objects:v251 count:16];
          if (v105)
          {
            id v106 = v105;
            uint64_t v107 = *(void *)v221;
            do
            {
              for (uint64_t kk = 0LL; kk != v106; uint64_t kk = (char *)kk + 1)
              {
                if (*(void *)v221 != v107) {
                  objc_enumerationMutation(v104);
                }
                objc_msgSend( v97,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v220 + 1) + 8 * (void)kk), "path"));
              }

              id v106 = [v104 countByEnumeratingWithState:&v220 objects:v251 count:16];
            }

            while (v106);
          }
        }

        id v100 = [v98 countByEnumeratingWithState:&v224 objects:v252 count:16];
      }

      while (v100);
    }

    objc_msgSend( v155,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
    uint64_t v63 = v144;
    id v109 = -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( v144,  "effectContainersWithImages:effects:andOptions:",  v97,  -[MPAuthoringController effectsForImages:withOptions:](v144, "effectsForImages:withOptions:", v97, v158),  v158);
    [v155 insertEffectContainers:v109 atIndex:0];
    a4 = v139;
    id v64 = v160;
    if ([v109 count])
    {
      objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlidesInEffectContainers:inDocument:withOptions:",  v109,  v139,  v158);
      id v110 = objc_msgSend(objc_msgSend(v109, "objectAtIndex:", 0), "allSlides");
      if ([v110 count])
      {
        __int128 v111 = +[NSValue valueWithRange:]( NSValue,  "valueWithRange:",  objc_msgSend( objc_msgSend(v139, "allSlides"),  "indexOfObject:",  objc_msgSend(v110, "objectAtIndex:", 0)),  objc_msgSend(v97, "count"));
        -[NSMutableDictionary setObject:forKey:](v158, "setObject:forKey:", v111, kMPAuthoringReconfigureIndices);
        -[MPAuthoringController configureFiltersInDocument:withOptions:]( v144,  "configureFiltersInDocument:withOptions:",  v139,  v158);
        -[MPAuthoringController configureTransitionsInDocument:withOptions:]( v144,  "configureTransitionsInDocument:withOptions:",  v139,  v158);
      }
    }
  }

- (void)addStyledCaptionToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v9 = a5 ? a5 : objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9);
  id v11 = [a4 videoPaths];
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, kMPAuthoringSecondaryPaths);
  uint64_t v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, kMPAuthoringAlwaysIncludeLastTransition);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", kMPFadeNone, kMPAuthoringOutroEffectID);
  id v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, kMPAuthoringUseLoopTransition);
  id v14 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", v10);
  id v15 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "interstitialEffectLayoutsForStyleID:",  v14);
  if (!v15) {
    return;
  }
  id v16 = v15;
  if (![v15 count]) {
    return;
  }
  id v80 = self;
  id v72 = objc_msgSend(objc_msgSend(a3, "path"), "copy");
  id v17 = [a3 parentEffect];
  id v18 = [v17 parentContainer];
  id v77 = (char *)[v18 index];
  id v76 = a3;
  id v73 = [v18 parentLayer];
  id v71 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIndexForLayerID:ofStyle:",  objc_msgSend(v73, "layerID"),  v14);
  uint64_t v19 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:");
  BOOL v79 = v10;
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v19, kMPAuthoringLayerIndex);
  id v20 = (char *)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "subtitleOrderForStyleID:",  v14);
  id v21 = (char *)[a3 index];
  id v74 = (NSDictionary *)a5;
  id v75 = a4;
  if (v20 == (_BYTE *)&dword_0 + 1) {
    id v22 = (char *)[a3 index] + 1;
  }
  else {
    id v22 = v21;
  }
  id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v24 = objc_msgSend( objc_msgSend(v17, "slides"),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v22));
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v94;
    do
    {
      for (id i = 0LL; i != v26; id i = (char *)i + 1)
      {
        if (*(void *)v94 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * (void)i), "path"));
      }

      id v26 = [v24 countByEnumeratingWithState:&v93 objects:v100 count:16];
    }

    while (v26);
  }

  id v29 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v30 = objc_msgSend( objc_msgSend(v17, "slides"),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  v22,  (_BYTE *)objc_msgSend(v17, "countOfSlides") - v22));
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  id v31 = [v30 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v90;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v90 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * (void)j), "path"));
      }

      id v32 = [v30 countByEnumeratingWithState:&v89 objects:v99 count:16];
    }

    while (v32);
  }

  if (v80->_isAuthoring)
  {
    uint64_t v35 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v71);
    id v36 = v79;
    -[NSMutableDictionary setObject:forKey:](v79, "setObject:forKey:", v35, kMPAuthoringLayerIndex);
  }

  else
  {
    -[MPAuthoringController setAuthoredDocument:](v80, "setAuthoredDocument:", v75);
    id v37 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v23);
    -[NSMutableArray addObjectsFromArray:](v37, "addObjectsFromArray:", v29);
    id v38 = v37;
    id v36 = v79;
    -[MPAuthoringController cacheROIInformationForImages:withOptions:]( v80,  "cacheROIInformationForImages:withOptions:",  v38,  v79);
  }

  id v39 = -[MPAuthoringController findEffectIDInPresetArray:forImages:withOptions:]( v80,  "findEffectIDInPresetArray:forImages:withOptions:",  v16,  v29,  v36);
  if (v39)
  {
    id v40 = v39;
    id v41 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  }

  else
  {
    id v40 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "interstitialEffectLayoutForStyleID:",  v14);
    id v41 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if (!v40) {
      goto LABEL_35;
    }
  }

  uint64_t v42 = (NSArray *)[v40 objectForKey:@"presetID"];
  id v43 = [v40 objectForKey:@"backgroundEffect"];
  id v44 = (char *)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v42));
  if (v43)
  {
    id v45 = &v44[(void)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v43))];
    if (v45 <= [v30 count])
    {
      uint64_t v42 = +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v43, v42, 0LL);
LABEL_34:
      [v41 addObject:v42];
    }
  }

  else if (v44 <= [v30 count])
  {
    goto LABEL_34;
  }

- (void)removeStyledCaptionFromSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if (objc_msgSend(objc_msgSend(a3, "userInfoAttributeForKey:", @"hasSubtitle"), "BOOLValue"))
  {
    if (!a5) {
      a5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
    }
    id v7 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a5);
    id v8 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "interstitialEffectLayoutsForStyleID:",  v7);
    if (v8)
    {
      id v9 = v8;
      if ([v8 count])
      {
        id v10 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
        id v59 = objc_msgSend(objc_msgSend(a3, "path"), "copy");
        id v11 = [a5 mutableCopy];
        uint64_t v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
        [v11 setObject:v12 forKey:kMPAuthoringUseTitleEffect];
        id v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
        [v11 setObject:v13 forKey:kMPAuthoringAlwaysIncludeLastTransition];
        id v14 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIndexForLayerID:ofStyle:",  objc_msgSend(objc_msgSend(v10, "parentLayer"), "layerID"),  v7));
        [v11 setObject:v14 forKey:kMPAuthoringLayerIndex];
        id v15 = [a4 videoPaths];
        uint64_t v60 = v11;
        [v11 setObject:v15 forKey:kMPAuthoringSecondaryPaths];
        id v16 = [v10 parentLayer];
        id v17 = objc_msgSend(objc_msgSend(v16, "effectContainers"), "lastObject");
        id v18 = (char *)[v16 countOfEffectContainers] - 2;
        if (v18 == [v10 index] && !objc_msgSend(v17, "countOfEffects"))
        {
          int v20 = 1;
        }

        else
        {
          [v60 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
          uint64_t v19 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
          [v60 setObject:v19 forKey:kMPAuthoringUseLoopTransition];
          int v20 = 0;
        }

        if (!self->_isAuthoring) {
          -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", a4);
        }
        id v21 = (char *)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "subtitleOrderForStyleID:",  v7);
        if (v21 == (_BYTE *)&dword_0 + 2)
        {
          id v25 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
          id v23 = [v25 parentLayer];
          id v24 = (char *)[v25 index] - 1;
        }

        else
        {
          if (v21 != (_BYTE *)&dword_0 + 1)
          {
            int v69 = v20;
            __int128 v93 = 0u;
            __int128 v94 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            id v29 = [v10 effects];
            id v30 = [v29 countByEnumeratingWithState:&v91 objects:v100 count:16];
            if (v30)
            {
              id v31 = v30;
              id v67 = *(id *)v92;
              while (2)
              {
                for (id i = 0LL; i != v31; id i = (char *)i + 1)
                {
                  if (*(id *)v92 != v67) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@",  [*(id *)(*((void *)&v91 + 1) + 8 * (void)i) effectID],  objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * (void)i), "presetID"));
                  __int128 v87 = 0u;
                  __int128 v88 = 0u;
                  __int128 v89 = 0u;
                  __int128 v90 = 0u;
                  id v34 = [v9 countByEnumeratingWithState:&v87 objects:v99 count:16];
                  if (v34)
                  {
                    id v35 = v34;
                    uint64_t v36 = *(void *)v88;
LABEL_23:
                    uint64_t v37 = 0LL;
                    while (1)
                    {
                      if (*(void *)v88 != v36) {
                        objc_enumerationMutation(v9);
                      }
                      if (objc_msgSend( objc_msgSend( *(id *)(*((void *)&v87 + 1) + 8 * v37),  "objectForKey:",  @"presetID"),  "isEqualToString:",  v33)) {
                        goto LABEL_31;
                      }
                      if (v35 == (id)++v37)
                      {
                        id v35 = [v9 countByEnumeratingWithState:&v87 objects:v99 count:16];
                        if (v35) {
                          goto LABEL_23;
                        }
                        break;
                      }
                    }
                  }
                }

                id v31 = [v29 countByEnumeratingWithState:&v91 objects:v100 count:16];
                if (v31) {
                  continue;
                }
                break;
              }
            }

- (void)combineSlides:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v9 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (id i = 0LL; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        objc_msgSend(v8, "addObject:", objc_msgSend(v14, "path"));
        objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v14, "parentEffect"), "parentContainer"));
      }

      id v11 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v11);
  }

  id v15 = objc_msgSend(objc_msgSend(v9, "anyObject"), "parentLayer");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v9);
        }
        id v21 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) index];
        objc_msgSend( v15,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v21));
      }

      id v17 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v17);
  }

  else
  {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  objc_msgSend( v15,  "insertEffectContainers:atIndex:",  -[MPAuthoringController effectContainersWithPaths:forDocument:withOptions:]( self,  "effectContainersWithPaths:forDocument:withOptions:",  v8,  a4,  a5),  v19);
}

- (void)combineEffectsNearSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v8 = +[MPAuthoringUtilities effectListFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "effectListFromOptions:", a5);
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v75;
    do
    {
      for (id i = 0LL; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( v9,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * (void)i), "objectForKey:", @"presetID"));
      }

      id v11 = [v8 countByEnumeratingWithState:&v74 objects:v82 count:16];
    }

    while (v11);
  }

  if ((unint64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "maxNumOfImagesPerEffectInList:",  v9) < 3) {
    return;
  }
  id v14 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
  id v15 = [v14 parentLayer];
  id v16 = 0LL;
  while (1)
  {
    id v17 = v14;
    if (v16) {
      break;
    }
LABEL_13:
    if ((uint64_t)[v17 index] >= 2)
    {
      id v18 = objc_msgSend(v15, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v17, "index") - 1);
      if (v18)
      {
        id v16 = v18;
      }
    }

    goto LABEL_19;
  }

  if ([v16 slideCount] == (char *)&dword_0 + 1)
  {
    id v17 = v16;
    goto LABEL_13;
  }

  id v17 = v16;
LABEL_19:
  uint64_t v19 = 0LL;
  while (2)
  {
    int v20 = v14;
    if (!v19)
    {
LABEL_23:
      id v22 = (char *)[v20 index];
      id v23 = objc_msgSend(v15, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v20, "index") + 1);
      if (!v23) {
        goto LABEL_28;
      }
      uint64_t v19 = v23;
      if ([v23 textCount]) {
        goto LABEL_28;
      }
      continue;
    }

    break;
  }

  if ([v19 slideCount] == (char *)&dword_0 + 1)
  {
    id v21 = [v19 index];
    int v20 = v19;
    goto LABEL_23;
  }

  int v20 = v19;
LABEL_28:
  if (v17 != v20)
  {
    id v24 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    uint64_t v50 = self;
    if ([v20 countOfEffects]
      || (__int128 v25 = (char *)[v15 countOfEffectContainers] - 1, v25 != objc_msgSend(v20, "index")))
    {
      uint64_t v27 = 0LL;
    }

    else
    {
      id v26 = [a5 objectForKey:kMPAuthoringOutroEffectID];
      uint64_t v27 = [v26 isEqualToString:kMPFadeNone] ^ 1;
    }

    id v49 = v15;
    id v48 = +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  [v17 index],  (_BYTE *)objc_msgSend(v20, "index") + v27 - (_BYTE *)objc_msgSend(v17, "index"));
    id v28 = objc_msgSend(objc_msgSend(v15, "effectContainers"), "objectsAtIndexes:", v48);
    id v29 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id obj = v28;
    id v54 = [v28 countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v71;
      do
      {
        uint64_t v30 = 0LL;
        do
        {
          if (*(void *)v71 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = v30;
          id v31 = *(void **)(*((void *)&v70 + 1) + 8 * v30);
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          id v56 = [v31 effects];
          id v32 = [v56 countByEnumeratingWithState:&v66 objects:v80 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v57 = *(void *)v67;
            do
            {
              for (j = 0LL; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v67 != v57) {
                  objc_enumerationMutation(v56);
                }
                id v35 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
                __int128 v62 = 0u;
                __int128 v63 = 0u;
                __int128 v64 = 0u;
                __int128 v65 = 0u;
                id v36 = [v35 slides];
                id v37 = [v36 countByEnumeratingWithState:&v62 objects:v79 count:16];
                if (v37)
                {
                  id v38 = v37;
                  uint64_t v39 = *(void *)v63;
                  do
                  {
                    for (id k = 0LL; k != v38; id k = (char *)k + 1)
                    {
                      if (*(void *)v63 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      id v41 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)k);
                      if (objc_msgSend( objc_msgSend(v41, "userInfoAttributeForKey:", @"hasSubtitle"),  "BOOLValue")) {
                        objc_msgSend(v29, "addObject:", objc_msgSend(v41, "path"));
                      }
                      objc_msgSend(v24, "addObject:", objc_msgSend(v41, "path"));
                    }

                    id v38 = [v36 countByEnumeratingWithState:&v62 objects:v79 count:16];
                  }

                  while (v38);
                }
              }

              id v33 = [v56 countByEnumeratingWithState:&v66 objects:v80 count:16];
            }

            while (v33);
          }

          uint64_t v30 = v55 + 1;
        }

        while ((id)(v55 + 1) != v54);
        id v54 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      }

      while (v54);
    }

    [v49 removeEffectContainersAtIndices:v48];
    id v42 = [a5 mutableCopy];
    id v43 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    [v42 setObject:v43 forKey:kMPAuthoringUseTitleEffect];
    objc_msgSend( v49,  "insertEffectContainers:atIndex:",  -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( v50,  "effectContainersWithImages:effects:andOptions:",  v24,  -[MPAuthoringController effectsForImages:withOptions:](v50, "effectsForImages:withOptions:", v24, v42),  v42),  -[NSIndexSet firstIndex](v48, "firstIndex"));
    if ([v29 count])
    {
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v44 = [v29 countByEnumeratingWithState:&v58 objects:v78 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v59;
        do
        {
          for (m = 0LL; m != v45; m = (char *)m + 1)
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(v29);
            }
            objc_msgSend( +[MPUtilities slideForPath:inDocument:]( MPUtilities,  "slideForPath:inDocument:",  *(void *)(*((void *)&v58 + 1) + 8 * (void)m),  a4),  "setUserInfoAttribute:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"hasSubtitle");
          }

          id v45 = [v29 countByEnumeratingWithState:&v58 objects:v78 count:16];
        }

        while (v45);
      }
    }
  }

- (void)_reorderImagesInDocument:(id)a3 withOptions:(id)a4
{
  id v4 = a3;
  if (objc_msgSend(objc_msgSend(a3, "videoPaths"), "count"))
  {
    if ([v4 countOfLayers])
    {
      context = objc_autoreleasePoolPush();
      -[MPAuthoringController setAuthoredDocument:](self, "setAuthoredDocument:", v4);
      objc_msgSend(objc_msgSend(v4, "montage"), "lock");
      id v6 = [v4 mainLayers];
      id v84 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
      id v7 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a4);
      id v71 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      v86.NSUInteger location = (NSUInteger)+[MPAuthoringUtilities reconfigureRangeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reconfigureRangeFromOptions:",  a4);
      v86.NSUInteger length = v8;
      id v70 = [a4 objectForKey:kMPAuthoringStyleID];
      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      id obj = v6;
      id v9 = [v6 countByEnumeratingWithState:&v115 objects:v126 count:16];
      __int128 v75 = self;
      __int128 v76 = v4;
      __int128 v72 = v7;
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v116;
        uint64_t v69 = *(void *)v116;
        do
        {
          uint64_t v12 = 0LL;
          id v73 = v10;
          do
          {
            if (*(void *)v116 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)v12);
            if (([v13 isAudioLayer] & 1) == 0)
            {
              __int128 v79 = v13;
              id v14 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIndexForLayerID:ofStyle:",  objc_msgSend(v13, "layerID"),  v70));
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, kMPAuthoringLayerIndex);
              id v15 = +[NSMutableArray arrayWithArray:]( NSMutableArray,  "arrayWithArray:",  -[MPAuthoringController orderImages:withOptions:]( self,  "orderImages:withOptions:",  [v4 videoPaths],  v7));
              id v16 = +[MPAuthoringUtilities effectListFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "effectListFromOptions:",  v7);
              id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
              __int128 v111 = 0u;
              __int128 v112 = 0u;
              __int128 v113 = 0u;
              __int128 v114 = 0u;
              id v18 = [v16 countByEnumeratingWithState:&v111 objects:v125 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v112;
                do
                {
                  for (id i = 0LL; i != v19; id i = (char *)i + 1)
                  {
                    if (*(void *)v112 != v20) {
                      objc_enumerationMutation(v16);
                    }
                    objc_msgSend( v17,  "addObject:",  objc_msgSend( *(id *)(*((void *)&v111 + 1) + 8 * (void)i),  "objectForKey:",  @"presetID"));
                  }

                  id v19 = [v16 countByEnumeratingWithState:&v111 objects:v125 count:16];
                }

                while (v19);
              }

              __int128 v78 = v12;
              __int128 v77 = (char *)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "maxNumOfImagesPerEffectInList:",  v17);
              id v22 = [v13 effectContainers];
              __int128 v107 = 0u;
              __int128 v108 = 0u;
              __int128 v109 = 0u;
              __int128 v110 = 0u;
              id v80 = v22;
              id v82 = [v22 countByEnumeratingWithState:&v107 objects:v124 count:16];
              if (v82)
              {
                NSUInteger v23 = 0LL;
                uint64_t v81 = *(void *)v108;
                do
                {
                  uint64_t v24 = 0LL;
                  do
                  {
                    if (*(void *)v108 != v81) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v83 = v24;
                    __int128 v25 = *(void **)(*((void *)&v107 + 1) + 8 * v24);
                    __int128 v103 = 0u;
                    __int128 v104 = 0u;
                    __int128 v105 = 0u;
                    __int128 v106 = 0u;
                    id v85 = [v25 effects];
                    id v26 = [v85 countByEnumeratingWithState:&v103 objects:v123 count:16];
                    if (v26)
                    {
                      id v27 = v26;
                      uint64_t v28 = *(void *)v104;
                      do
                      {
                        for (j = 0LL; j != v27; j = (char *)j + 1)
                        {
                          if (*(void *)v104 != v28) {
                            objc_enumerationMutation(v85);
                          }
                          uint64_t v30 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)j);
                          int64_t v31 = (int64_t)[v30 countOfSlides];
                          if (v86.length
                            && (v127.location = v23, v127.NSUInteger length = v31, !NSIntersectionRange(v86, v127).length)
                            && (unint64_t)-[NSMutableArray count](v15, "count") >= v31)
                          {
                            if (-[NSMutableArray count](v15, "count")) {
                              -[NSMutableArray removeObjectsAtIndexes:]( v15,  "removeObjectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  0LL,  v31));
                            }
                          }

                          else if (v31 >= 1)
                          {
                            uint64_t v32 = 0LL;
                            while (-[NSMutableArray count](v15, "count"))
                            {
                              id v33 = objc_msgSend(objc_msgSend(v30, "slides"), "objectAtIndex:", v32);
                              id v34 = -[NSMutableArray objectAtIndex:](v15, "objectAtIndex:", 0LL);
                              if ((objc_msgSend(objc_msgSend(v33, "path"), "isEqualToString:", v34) & 1) == 0) {
                                objc_msgSend( v30,  "replaceSlideAtIndex:withSlide:",  v32,  +[MPSlide slideWithPath:](MPSlide, "slideWithPath:", v34));
                              }
                              -[NSMutableArray removeObjectAtIndex:](v15, "removeObjectAtIndex:", 0LL);
                              if (v31 == ++v32) {
                                goto LABEL_39;
                              }
                            }

                            [v30 setReplaceSlides:0];
                            objc_msgSend( v30,  "removeSlidesAtIndices:",  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  v32,  v31 - v32));
                            [v30 setReplaceSlides:1];
                            [v84 addObject:v30];
                          }

- (id)_addVideoPaths:(id)a3 toEndOfLayer:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a6);
  id v40 = [a4 zIndex];
  p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
  id v12 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  v10);
  id v39 = a6;
  id v13 = objc_msgSend(objc_msgSend(a4, "effectContainers"), "lastObject");
  if (!objc_msgSend(objc_msgSend(v13, "effects"), "count"))
  {
    id v21 = (char *)[v13 index];
    objc_msgSend( a4,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v21));
    BOOL v16 = (uint64_t)v21 < 1;
    id v22 = v21 - 1;
    goto LABEL_14;
  }

  unsigned int v14 = objc_msgSend( v12,  "hasPrefix:",  objc_msgSend(objc_msgSend(v13, "objectInEffectsAtIndex:", 0), "effectID"));
  if (!v14
    || (id v15 = (char *)[v13 index],
        objc_msgSend( a4,  "removeEffectContainersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v15)),  BOOL v16 = (uint64_t)v15 < 1,  v17 = v15 - 1,  v16))
  {
    id v18 = a3;
  }

  else
  {
    id v18 = a3;
  }

  id v19 = objc_msgSend(objc_msgSend(v13, "effects"), "objectAtIndex:", 0);
  uint64_t v20 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@",  [v19 effectID],  objc_msgSend(v19, "presetID"));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v20, kMPAuthoringInitiallyIgnoreEffect);
  a3 = v18;
  p_cache = (void **)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
  if (v14) {
LABEL_14:
  }
    id v13 = 0LL;
LABEL_15:
  if ([a4 countOfEffectContainers]) {
    id v23 = 0LL;
  }
  else {
    id v23 = [p_cache + 193 useTitleEffectFromOptions:v10];
  }
  uint64_t v24 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v23);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v24, kMPAuthoringUseTitleEffect);
  id v25 = -[MPAuthoringController orderImages:withOptions:](self, "orderImages:withOptions:", a3, v10);
  id v26 = -[MPAuthoringController effectContainersWithImages:effects:andOptions:]( self,  "effectContainersWithImages:effects:andOptions:",  v25,  -[MPAuthoringController effectsForImages:withOptions:](self, "effectsForImages:withOptions:", v25, v10),  v10);
  if (v13)
  {
    char v27 = objc_opt_respondsToSelector( self->_delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:");
    int v28 = objc_opt_respondsToSelector( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:");
    if ((v27 & 1) != 0)
    {
      int v29 = v28;
      unsigned int v30 = objc_msgSend( self->_delegate,  "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:",  a5,  v13,  objc_msgSend(v13, "index"),  v40);
      if ((v30 & 1) == 0 && ((v29 ^ 1) & 1) == 0)
      {
        id v31 = objc_msgSend( self->_delegate,  "document:needsTransitionForEffectContainer:containerIndex:layerIndex:",  a5,  v13,  objc_msgSend(v13, "index"),  v40);
LABEL_26:
        id v32 = v31;
LABEL_27:
        [a4 addEffectContainers:v26];
        [v13 setTransition:v32];
        goto LABEL_28;
      }

      if (!v30)
      {
        id v32 = 0LL;
        goto LABEL_27;
      }
    }

    id v31 = -[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", v39);
    goto LABEL_26;
  }

  [a4 addEffectContainers:v26];
LABEL_28:
  if ([v12 isEqualToString:kMPFadeOutEffect])
  {
    id v33 = (char *)[a4 countOfEffectContainers];
    if ((uint64_t)v33 >= 3)
    {
      id v34 = objc_msgSend(objc_msgSend(a4, "effectContainers"), "objectAtIndex:", v33 - 2);
      id v35 = [v34 transition];
      if (v35)
      {
        [v35 setTransitionID:@"Dissolve"];
      }

      else
      {
        id v36 = +[MPTransition transitionWithTransitionID:]( &OBJC_CLASS___MPTransition,  "transitionWithTransitionID:",  @"Dissolve");
        objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", v10), "duration");
        if (v37 > 0.0) {
          -[MPTransition setDuration:](v36, "setDuration:");
        }
        [v34 setTransition:v36];
      }
    }
  }

  return v26;
}

- (id)_grabAndRemoveTitleEffectFromDocument:(id)a3 withOptions:(id)a4
{
  id v6 = +[MPAuthoringUtilities titleEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "titleEffectFromOptions:",  a4);
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", a4);
  id v9 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfTitleEffectLayerForStyleID:",  v8);
  if (v9 != objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  v8)) {
    goto LABEL_13;
  }
  id v10 = [a3 objectInLayersAtIndex:v9];
  id v11 = +[MPUtilities idOfCombinedID:]( MPUtilities,  "idOfCombinedID:",  [v7 objectForKey:@"presetID"]);
  id v12 = [v10 objectInEffectContainersAtIndex:0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v13 = objc_msgSend(v12, "effects", 0);
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (id i = 0LL; i != v15; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "isEqualToString:", objc_msgSend(v18, "effectID")))
        {
          id v21 = v18;
          id v19 = v21;
          if (v21) {
            objc_msgSend( v12,  "removeEffectsAtIndices:",  +[NSIndexSet indexSetWithIndex:]( NSIndexSet,  "indexSetWithIndex:",  objc_msgSend(v21, "zIndex")));
          }
          return v19;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v19 = 0LL;
      if (v15) {
        continue;
      }
      break;
    }
  }

  else
  {
LABEL_13:
    id v19 = 0LL;
  }

  return v19;
}

- (void)_readdTitleEffect:(id)a3 toDocument:(id)a4 withOptions:(id)a5
{
  id v6 = objc_msgSend( a4,  "objectInLayersAtIndex:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfTitleEffectLayerForStyleID:",  +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a5)));
}

- (void)_checkForEmptyLayersInDocument:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "allSlides"), "count"))
  {
    id v4 = (char *)[a3 countOfLayers];
    if ((uint64_t)v4 >= 1)
    {
      id v5 = v4;
      for (id i = 0LL; i != v5; ++i)
      {
        if (!objc_msgSend(objc_msgSend(a3, "objectInLayersAtIndex:", i), "countOfEffectContainers")) {
          objc_msgSend( a3,  "removeLayersAtIndices:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", i));
        }
      }
    }
  }

  else
  {
    [a3 removeAllLayers];
  }

- (int64_t)_numberOfSlidesForOutroInLayer:(id)a3 withOptions:(id)a4
{
  id v6 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a4);
  id v7 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "layerIndexForLayerID:ofStyle:",  objc_msgSend(a3, "layerID"),  objc_msgSend(a4, "objectForKey:", kMPAuthoringStyleID)));
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, kMPAuthoringLayerIndex);
  id v8 = +[MPAuthoringUtilities outroEffectIDFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "outroEffectIDFromOptions:",  v6);
  if (v8
    && (id v9 = v8,
        id v10 = objc_msgSend(objc_msgSend(a3, "effectContainers"), "lastObject"),
        (uint64_t)[v10 countOfEffects] >= 1)
    && (id v11 = objc_msgSend(objc_msgSend(v10, "effects"), "lastObject"),
        objc_msgSend(v9, "hasPrefix:", objc_msgSend(v11, "effectID"))))
  {
    return (int64_t)[v11 countOfSlides];
  }

  else
  {
    return -1LL;
  }

- (int64_t)_countOfEmptyContainersInIntroOfLayer:(id)a3 withOptions:(id)a4
{
  int64_t v5 = 0LL;
  if (!objc_msgSend(objc_msgSend(a3, "objectInEffectContainersAtIndex:", 0, a4), "countOfEffects"))
  {
    int64_t v5 = 0LL;
    do
      ++v5;
    while (!objc_msgSend(objc_msgSend(a3, "objectInEffectContainersAtIndex:", v5), "countOfEffects"));
  }

  return v5;
}

- (void)setupClustersWithPaths:(id)a3 withOptions:(id)a4
{
  id v6 = +[MPClusterController sharedController](&OBJC_CLASS___MPClusterController, "sharedController", a3, a4);
  [v6 setAuthoredDocument:self->_authoredDocument];
  [v6 flush];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(a3);
        }
        [v6 addSlideForPath:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) withIndex:(char *)v11 + v9];
        id v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v9 += (uint64_t)v11;
    }

    while (v8);
  }

- (void)cleanupClusters
{
}

- (void)findUsableClustersForUserDefinedSlideOrderPresentation:(id)a3 inClusters:(id)a4
{
  id v6 = +[MPClusterController sharedController](&OBJC_CLASS___MPClusterController, "sharedController");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = a4;
  id v22 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v22)
  {
    uint64_t v25 = 0LL;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v7;
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v26 = v8;
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            __int128 v12 = 0LL;
            id v24 = v10;
            do
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v26);
              }
              uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v12);
              id v14 = [v6 clusterSlidesSortedByUserDefinedSortOrder:v13 userDefinedSlideOrder:a3];
              if ([v14 count])
              {
                __int128 v15 = (char *)objc_msgSend(a3, "indexOfObject:", objc_msgSend(v14, "objectAtIndex:", 0));
                if (![v14 count]) {
                  goto LABEL_20;
                }
                id v16 = v6;
                unint64_t v17 = 0LL;
                do
                {
                  id v18 = [v14 objectAtIndex:v17];
                  BOOL v19 = &v15[v17] < [a3 count] && v18 == objc_msgSend(a3, "objectAtIndex:", &v15[v17]);
                  ++v17;
                }

                while (v17 < (unint64_t)[v14 count] && v19);
                id v6 = v16;
                id v10 = v24;
                if (v19) {
LABEL_20:
                }
                  objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v25), "usableSlideClusters"),  "addObject:",  v13);
              }

              __int128 v12 = (char *)v12 + 1;
            }

            while (v12 != v10);
            id v10 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }

          while (v10);
        }

        ++v25;
        uint64_t v7 = v23 + 1;
      }

      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v22);
  }

@end