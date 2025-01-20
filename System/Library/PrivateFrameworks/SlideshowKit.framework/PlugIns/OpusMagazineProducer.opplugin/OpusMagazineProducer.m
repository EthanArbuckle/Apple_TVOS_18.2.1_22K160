int64_t sub_1C20(id a1, id a2, id a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  [a2 doubleValue];
  v6 = v5;
  [a3 doubleValue];
  if (v6 > v7) {
    return 1LL;
  }
  [a2 doubleValue];
  v10 = v9;
  [a3 doubleValue];
  if (v10 >= v11) {
    return 0LL;
  }
  else {
    return -1LL;
  }
}
}

LABEL_27:
      ++v11;
    }

    while (v13 != 6);
    if (![v10 count]) {
      break;
    }
    [v22 addObject:v10];
    [v7 addObjectsFromArray:v10];
    ++v8;
  }

  while (v8 != 6);
  return v22;
}

int64_t sub_2960(id a1, id a2, id a3)
{
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "doubleValue");
  if (v5 < v6) {
    return 1LL;
  }
  else {
    return -1LL;
  }
}

LABEL_5:
      v26 = v26 + v27;
LABEL_37:
      v11 = v11 + (float)(v18 * v26);
LABEL_38:
    }
  }

  return 0.0;
}

void sub_678C(_Unwind_Exception *a1)
{
}

uint64_t sub_67A4(uint64_t a1, _BYTE *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16LL))(v5);
  *a2 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t sub_6804(uint64_t a1, _BYTE *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16LL))(v5);
  *a2 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t sub_6864(uint64_t a1, _BYTE *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16LL))(v5);
  *a2 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

LABEL_23:
              v18 = (char *)v18 + 1;
            }

            while (v16 != v18);
            v34 = [v68 countByEnumeratingWithState:&v71 objects:v79 count:16];
            v16 = v34;
          }

          while (v34);
        }

        v8 = v63;
        if (-[NSMutableDictionary count](v14, "count"))
        {
          v35 = -1LL;
          double v4 = (OpusMagazineProducer *)v66;
          v7 = v67;
        }

        else
        {
          v7 = v67;
          v35 = (uint64_t)-[NSMutableArray count](v67, "count");
          double v4 = (OpusMagazineProducer *)v66;
          if (v65) {
            v36 = +[OFRescalableSegment rescalableSegmentWithDefaultDuration:minimumDuration:]( &OBJC_CLASS___OFRescalableSegment,  "rescalableSegmentWithDefaultDuration:minimumDuration:",  v6,  v9);
          }
          else {
            v36 = +[OFRescalableSegment rescalableSegmentWithDefaultDuration:minimumDuration:maximumDuration:]( &OBJC_CLASS___OFRescalableSegment,  "rescalableSegmentWithDefaultDuration:minimumDuration:maximumDuration:",  v6,  v9,  v6 * 5.0);
          }
          -[NSMutableArray addObject:](v67, "addObject:", v36);
        }

        -[NSMutableArray addObject:]( v7,  "addObject:",  +[OFRescalableSegment nonRescalableSegmentWithDuration:]( &OBJC_CLASS___OFRescalableSegment,  "nonRescalableSegmentWithDuration:",  v4->_transitionDuration));
        v37 = -[NSMutableDictionary count](v14, "count");
        v38 = (NSNumber *)v14;
        if (!v37) {
          v38 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v35);
        }
        -[NSMutableArray addObject:](v63, "addObject:", v38);
        if (v14) {
      }
        }

      v64 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }

    while (v64);
LABEL_41:
    v39 = (double *)malloc(8LL * (void)-[NSMutableArray count](v7, "count"));
    if (-[NSMutableArray count](v7, "count"))
    {
      objc_msgSend(-[OpusMagazineProducer presentation](v4, "presentation"), "guidelineAuthoringDurationFactor");
      v41 = v40;
      v42 = [[OFRescaler alloc] initWithSegments:v7];
      [v42 defaultDuration];
      if (!v65 || (audioPlaylistDuration = v4->_audioPlaylistDuration, audioPlaylistDuration <= 0.0))
      {
        audioPlaylistDuration = v43;
        if (v41 > -1.0)
        {
          objc_msgSend(v42, "minimumDuration", v43, v43);
          v46 = v45;
          [v42 maximumDuration];
          v48 = v47;
          [v42 minimumDuration];
          audioPlaylistDuration = v46 + v41 * (v48 - v49);
        }
      }

      [v42 computeSegmentDurations:v39 forTotalDuration:audioPlaylistDuration];
      v51 = v50;
      objc_msgSend( -[OpusMagazineProducer presentation](v4, "presentation"),  "addGuideline:",  +[OKPresentationGuideline guidelineAuthoringTotalDuration:]( OKPresentationGuideline,  "guidelineAuthoringTotalDuration:",  v50));
      v52 = -[OpusMagazineProducer presentation](v4, "presentation");
      [v42 minimumDuration];
      objc_msgSend( v52,  "addGuideline:",  +[OKPresentationGuideline guidelineAuthoringMinimumDuration:]( OKPresentationGuideline,  "guidelineAuthoringMinimumDuration:"));
      v53 = -[OpusMagazineProducer presentation](v4, "presentation");
      if ((v65 & 1) == 0)
      {
        [v42 maximumDuration];
        v51 = v54;
      }

      v69 = v42;
      objc_msgSend( v53,  "addGuideline:",  +[OKPresentationGuideline guidelineAuthoringMaximumDuration:]( OKPresentationGuideline,  "guidelineAuthoringMaximumDuration:",  v51));
      v4->_pageDurations = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [obj count]);
      if (-[NSMutableArray count](v8, "count"))
      {
        for (j = 0LL; j < (unint64_t)-[NSMutableArray count](v8, "count"); ++j)
        {
          v56 = -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", j);
          v57 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
          {
            v58 = objc_alloc_init(&OBJC_CLASS___OpusMagazinePageItemDurations);
            v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472LL;
            v70[2] = sub_8134;
            v70[3] = &unk_10360;
            v70[4] = v59;
            v70[5] = v39;
            [v56 enumerateKeysAndObjectsUsingBlock:v70];
            -[OpusMagazinePageItemDurations setItemDurations:](v58, "setItemDurations:", v59);
            if (v59) {

            }
            v8 = v63;
            if (!v58) {
              continue;
            }
          }

          else
          {
            v60 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v56, v60) & 1) == 0) {
              continue;
            }
            v58 = objc_alloc_init(&OBJC_CLASS___OpusMagazinePageItemDurations);
            -[OpusMagazinePageItemDurations setPageDuration:]( v58,  "setPageDuration:",  v39[(void)[v56 integerValue]]);
            if (!v58) {
              continue;
            }
          }

          [v66[4] addObject:v58];
        }
      }

      v7 = v67;
      if (v69) {
    }
      }

    free(v39);
    if (v8) {

    }
    if (v7) {
  }
    }

id sub_8134(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 40) + 8 * (void)objc_msgSend(a3, "integerValue"))),  a2);
}

void sub_8200(_Unwind_Exception *a1)
{
}

void sub_8260(_Unwind_Exception *a1)
{
}

void sub_85C0(_Unwind_Exception *a1)
{
}

void sub_8638(_Unwind_Exception *a1)
{
}

void sub_86B0(_Unwind_Exception *a1)
{
}

void sub_8748(_Unwind_Exception *a1)
{
}

id sub_91F0(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "presentation"),  "guidelineAuthoringMediaAttributesForKey:",  objc_msgSend(objc_msgSend(a3, "uniqueURL"), "absoluteString"));
  if (result)
  {
    double v6 = result;
    [result offset];
    if (v7 != 0.0) {
      return [*(id *)(a1 + 40) setObject:v6 forKey:a2];
    }
    id result = [v6 offset];
    if (v8 != 0.0) {
      return [*(id *)(a1 + 40) setObject:v6 forKey:a2];
    }
  }

  return result;
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend__configPageWidgetsSettings_mediaItemMediaAttributes_textItems_pageItems_pageInfo_properties_progressBlock_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_configPageWidgetsSettings:mediaItemMediaAttributes:textItems:pageItems:pageInfo:properties:progressBlock:error:");
}

id objc_msgSend__findBestMatchingLayoutFromLayouts_forMediaItems_currentIndx_checkFollowingMediaItems_remainingItems_subtitleAttributesForMediaItems_isFirstPage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_findBestMatchingLayoutFromLayouts:forMediaItems:currentIndx:checkFollowingMediaItems:remainingItems:subtitle AttributesForMediaItems:isFirstPage:");
}

id objc_msgSend_lessRescalableSegmentWithDefaultDuration_minimumDuration_maximumDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lessRescalableSegmentWithDefaultDuration:minimumDuration:maximumDuration:");
}

id objc_msgSend_pageWithName_templateName_navigatorName_properties_settings_userData_widgets_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pageWithName:templateName:navigatorName:properties:settings:userData:widgets:");
}

id objc_msgSend_widgetWithName_templateName_className_settings_userData_subWidgets_materials_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widgetWithName:templateName:className:settings:userData:subWidgets:materials:");
}