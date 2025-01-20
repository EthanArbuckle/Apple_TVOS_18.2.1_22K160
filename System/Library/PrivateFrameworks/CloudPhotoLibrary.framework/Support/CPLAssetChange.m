@interface CPLAssetChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
- (void)setMostRecentAddedDateOnCKRecord:(id)a3 withCPLEnabledDate:(id)a4;
@end

@implementation CPLAssetChange

- (void)setMostRecentAddedDateOnCKRecord:(id)a3 withCPLEnabledDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10009B354;
  v16[3] = &unk_1002421F8;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLAssetChange addedDate](self, "addedDate"));
  id v17 = v8;
  v9 = objc_retainBlock(v16);
  v10 = (uint64_t (**)(void))v9;
  if (v7 || !v8)
  {
    if (v7 && !v8)
    {
      id v13 = v7;
LABEL_12:
      [v6 setObject:v13 forKey:@"mostRecentAddedDate"];

      goto LABEL_13;
    }

    if ([v8 compare:v7] == (id)1)
    {
      uint64_t v14 = v10[2](v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v13 = (id)objc_claimAutoreleasedReturnValue([v15 laterDate:v7]);

      if (!v13) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }

    id v12 = v7;
  }

  else
  {
    uint64_t v11 = ((uint64_t (*)(void *))v9[2])(v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  id v13 = v12;
  if (v12) {
    goto LABEL_12;
  }
LABEL_13:
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"masterRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  v4 = -[CKReference initWithRecord:action:](objc_alloc(&OBJC_CLASS___CKReference), "initWithRecord:action:", v3, 1LL);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"people"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v140 objects:v144 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v141;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v141 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)i);
        id v14 = objc_alloc(&OBJC_CLASS___CPLPersonReference);
        id v15 = objc_msgSend(v14, "initWithSerializedString:", v13, (void)v140);
        [v7 addObject:v15];
      }

      id v10 = [v8 countByEnumeratingWithState:&v140 objects:v144 count:16];
    }

    while (v10);
  }

  -[CPLAssetChange setPeople:](v5, "setPeople:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"syndicationId"]);
  -[CPLAssetChange setSyndicationIdentifier:](v5, "setSyndicationIdentifier:", v16);

  if (+[CPLAssetChange serverSupportsSharedLibrarySharingState]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsSharedLibrarySharingState"))
  {
    id v17 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"sharedSyncSharingStateEnc",  objc_opt_class(NSNumber));
    v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (!v18) {
      v18 = &off_10025A1A0;
    }
    -[CPLAssetChange setSharedLibrarySharingState:]( v5,  "setSharedLibrarySharingState:",  objc_msgSend(v18, "longLongValue", (void)v140));
  }

  id v20 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"playCount", objc_opt_class(NSNumber));
  v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (!v21) {
    v21 = &off_10025A1A0;
  }
  -[CPLAssetChange setPlayCount:](v5, "setPlayCount:", objc_msgSend(v21, "longLongValue", (void)v140));

  if (+[CPLAssetChange serverSupportsLastViewedDate]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsLastViewedDate"))
  {
    id v23 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"lastViewedDateEnc",  objc_opt_class(NSDate));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[CPLAssetChange setLastViewedDate:](v5, "setLastViewedDate:", v24);
  }

  id v25 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"viewCount", objc_opt_class(NSNumber));
  v26 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (!v26) {
    v26 = &off_10025A1A0;
  }
  -[CPLAssetChange setViewCount:](v5, "setViewCount:", [v26 longLongValue]);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"lastSharedDate"]);
  -[CPLAssetChange setLastSharedDate:](v5, "setLastSharedDate:", v28);

  id v29 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"shareCount", objc_opt_class(NSNumber));
  v30 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v29);
  v31 = v30;
  if (!v30) {
    v30 = &off_10025A1A0;
  }
  -[CPLAssetChange setShareCount:](v5, "setShareCount:", [v30 longLongValue]);

  id v32 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"viewPresentationTypeEnc",  objc_opt_class(NSNumber));
  v33 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v32);
  v34 = v33;
  if (!v33) {
    v33 = &off_10025A1B8;
  }
  -[CPLAssetChange setViewPresentation:]( v5,  "setViewPresentation:",  (__int16)[v33 integerValue]);

  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"computeStateVersion"]);
  -[CPLAssetChange setComputeStateVersion:](v5, "setComputeStateVersion:", v35);

  id v36 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"computeStateAdjustmentFingerprintEnc",  objc_opt_class(NSString));
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  -[CPLAssetChange setComputeStateAdjustmentFingerprint:](v5, "setComputeStateAdjustmentFingerprint:", v37);

  id v38 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"computeStateLastUpdatedDateEnc",  objc_opt_class(NSDate));
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  -[CPLAssetChange setComputeStateLastUpdatedDate:](v5, "setComputeStateLastUpdatedDate:", v39);

  id v40 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"assetDateEnc",  objc_opt_class(NSDate));
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v41) {
    id v43 = v41;
  }
  else {
    id v43 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"assetDate"]);
  }
  v44 = v43;

  -[CPLAssetChange setAssetDate:](v5, "setAssetDate:", v44);
  id v45 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isHidden", objc_opt_class(NSNumber));
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = v46;
  if (!v46) {
    v46 = &__kCFBooleanFalse;
  }
  -[CPLAssetChange setHidden:](v5, "setHidden:", [v46 BOOLValue]);

  id v48 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isFavorite", objc_opt_class(NSNumber));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = v49;
  if (!v49) {
    v49 = &__kCFBooleanFalse;
  }
  -[CPLAssetChange setFavorite:](v5, "setFavorite:", [v49 BOOLValue]);

  id v51 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"captionEnc",  objc_opt_class(NSString));
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[CPLAssetChange setCaption:](v5, "setCaption:", v52);

  id v53 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"keywordsEnc",  objc_opt_class(NSArray));
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  -[CPLAssetChange setKeywords:](v5, "setKeywords:", v54);

  id v55 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"extendedDescEnc",  objc_opt_class(NSString));
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  -[CPLAssetChange setExtendedDescription:](v5, "setExtendedDescription:", v56);

  id v57 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"accessibilityDescEnc",  objc_opt_class(NSString));
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  -[CPLAssetChange setAccessibilityDescription:](v5, "setAccessibilityDescription:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"masterRef"]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 recordID]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v60 recordName]);

  -[CPLAssetChange setMasterIdentifier:](v5, "setMasterIdentifier:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"addedDate"]);
  -[CPLAssetChange setAddedDate:](v5, "setAddedDate:", v62);

  id v63 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"locationEnc",  objc_opt_class(NSDictionary));
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue( +[CLLocation locationWithCPLLocationDictionary:]( &OBJC_CLASS___CLLocation,  "locationWithCPLLocationDictionary:",  v64));
  -[CPLAssetChange setLocation:](v5, "setLocation:", v65);

  if (+[CPLAssetChange serverSupportsDeletedByUserIdentifier]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsDeletedByUserIdentifier"))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"deletedBy"]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 recordID]);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v67 recordName]);
    -[CPLAssetChange setDeletedByUserIdentifier:](v5, "setDeletedByUserIdentifier:", v68);
  }

  id v69 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"placeInfoEnc",  objc_opt_class(NSDictionary));
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPlaceAnnotation placeAnnotationWithCPLPlaceAnnotationDictionary:]( &OBJC_CLASS___CPLPlaceAnnotation,  "placeAnnotationWithCPLPlaceAnnotationDictionary:",  v70));
  -[CPLAssetChange setPlaceAnnotation:](v5, "setPlaceAnnotation:", v71);

  id v72 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"timeZoneNameEnc",  objc_opt_class(NSString));
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  -[CPLAssetChange setTimeZoneName:](v5, "setTimeZoneName:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"burstId"]);
  -[CPLAssetChange setBurstIdentifier:](v5, "setBurstIdentifier:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"mediaGroupId"]);
  -[CPLAssetChange setMediaGroupIdentifier:](v5, "setMediaGroupIdentifier:", v75);

  id v76 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"vidComplDurValue",  objc_opt_class(NSNumber));
  v77 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v76);
  v78 = v77;
  if (!v77) {
    v77 = &off_10025A1A0;
  }
  -[CPLAssetChange setVideoComplementDurationValue:]( v5,  "setVideoComplementDurationValue:",  [v77 integerValue]);

  id v79 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"vidComplDurScale",  objc_opt_class(NSNumber));
  v80 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v79);
  v81 = v80;
  if (!v80) {
    v80 = &off_10025A1A0;
  }
  -[CPLAssetChange setVideoComplementDurationTimescale:]( v5,  "setVideoComplementDurationTimescale:",  [v80 integerValue]);

  id v82 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"vidComplDispValue",  objc_opt_class(NSNumber));
  v83 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v82);
  v84 = v83;
  if (!v83) {
    v83 = &off_10025A1A0;
  }
  -[CPLAssetChange setVideoComplementImageDisplayValue:]( v5,  "setVideoComplementImageDisplayValue:",  [v83 integerValue]);

  id v85 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"vidComplDispScale",  objc_opt_class(NSNumber));
  v86 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v85);
  v87 = v86;
  if (!v86) {
    v86 = &off_10025A1A0;
  }
  -[CPLAssetChange setVideoComplementImageDisplayTimescale:]( v5,  "setVideoComplementImageDisplayTimescale:",  [v86 integerValue]);

  id v88 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"vidComplVisibilityState",  objc_opt_class(NSNumber));
  v89 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v88);
  v90 = v89;
  if (!v89) {
    v89 = &off_10025A1A0;
  }
  -[CPLAssetChange setVideoComplementVisibilityState:]( v5,  "setVideoComplementVisibilityState:",  [v89 integerValue]);

  v91 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"assetSubtypeV2"]);
  v92 = v91;
  if (v91)
  {
    id v93 = [v91 unsignedIntegerValue];
  }

  else
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"assetSubtype"]);
    id v93 = [v94 unsignedIntegerValue];
  }

  -[CPLAssetChange setAssetSubtype:](v5, "setAssetSubtype:", v93);

  v95 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"burstFlags"]);
  unint64_t v96 = (unint64_t)[v95 unsignedIntegerValue];

  v97 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"burstFlagsExt"]);
  v98 = v97;
  if (v97 && v96) {
    v96 |= (unint64_t)[v97 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFE0;
  }
  -[CPLAssetChange setBurstFlags:](v5, "setBurstFlags:", v96);

  v99 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timeZoneOffset"]);
  -[CPLAssetChange setTimeZoneOffset:](v5, "setTimeZoneOffset:", v99);

  id v100 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"assetHDRType",  objc_opt_class(NSNumber));
  v101 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v100);
  v102 = v101;
  if (!v101) {
    v101 = &off_10025A1A0;
  }
  -[CPLAssetChange setAssetHDRType:](v5, "setAssetHDRType:", [v101 unsignedIntegerValue]);

  id v103 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"customRenderedValue",  objc_opt_class(NSNumber));
  v104 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v103);
  v105 = v104;
  if (!v104) {
    v104 = &off_10025A1D0;
  }
  -[CPLAssetChange setCustomRenderedValue:](v5, "setCustomRenderedValue:", [v104 longLongValue]);

  id v106 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"trashReason",  objc_opt_class(NSNumber));
  v107 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v106);
  v108 = v107;
  if (!v107) {
    v107 = &off_10025A1D0;
  }
  -[CPLAssetChange setTrashedReason:](v5, "setTrashedReason:", (unsigned __int16)[v107 longLongValue]);

  id v109 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"orientation",  objc_opt_class(NSNumber));
  v110 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v109);
  v111 = v110;
  if (!v110) {
    v110 = &off_10025A1A0;
  }
  -[CPLAssetChange setOrientation:](v5, "setOrientation:", [v110 integerValue]);

  v112 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustmentType"]);
  if (v112)
  {
    id v113 = objc_alloc_init(&OBJC_CLASS___CPLAdjustments);
    [v113 setAdjustmentType:v112];
    v114 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustmentCompoundVersion"]);
    [v113 setAdjustmentCompoundVersion:v114];

    v115 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustmentCreatorCode"]);
    [v113 setAdjustmentCreatorCode:v115];

    v116 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustmentSourceType"]);
    objc_msgSend(v113, "setAdjustmentSourceType:", objc_msgSend(v116, "integerValue"));

    id v117 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"adjustmentSimpleDataEnc",  objc_opt_class(NSData));
    v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
    [v113 setSimpleAdjustmentData:v118];

    v119 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"similarToOriginalAdjustmentsFingerprint"]);
    [v113 setSimilarToOriginalAdjustmentsFingerprint:v119];

    v120 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"otherAdjustmentsFingerprint"]);
    [v113 setOtherAdjustmentsFingerprint:v120];

    v121 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustmentRenderType"]);
    objc_msgSend(v113, "setAdjustmentRenderTypes:", objc_msgSend(v121, "integerValue"));

    id v122 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"adjustmentTimestampEnc",  objc_opt_class(NSDate));
    v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
    [v113 setAdjustmentTimestamp:v123];

    -[CPLAssetChange setAdjustments:](v5, "setAdjustments:", v113);
  }

  id v124 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"durationEnc",  objc_opt_class(NSNumber));
  v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
  v126 = v125;
  if (v125) {
    v127 = v125;
  }
  else {
    v127 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"duration"]);
  }
  v128 = v127;

  if (v128) {
    v129 = v128;
  }
  else {
    v129 = &off_10025A1A0;
  }
  -[CPLAssetChange setDuration:](v5, "setDuration:", [v129 integerValue]);

  id v130 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"originalChoice",  objc_opt_class(NSNumber));
  v131 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v130);
  v132 = v131;
  if (!v131) {
    v131 = &off_10025A1A0;
  }
  -[CPLAssetChange setOriginalChoice:](v5, "setOriginalChoice:", [v131 unsignedIntegerValue]);

  v133 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adjustedMediaMetaDataStrType"]);
  -[CPLAssetChange setAdjustedMediaMetaDataType:](v5, "setAdjustedMediaMetaDataType:", v133);

  id v134 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"adjustedMediaMetaDataEnc",  objc_opt_class(NSData));
  v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
  -[CPLAssetChange setAdjustedMediaMetaData:](v5, "setAdjustedMediaMetaData:", v135);

  id v136 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"faces",  objc_opt_class(NSData));
  v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
  if ([v137 length]) {
    -[CPLAssetChange setFacesData:](v5, "setFacesData:", v137);
  }
  v138 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"facesVersion"]);
  -[CPLAssetChange setFacesVersion:](v5, "setFacesVersion:", [v138 integerValue]);

  v139 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"facesAdjustmentsFingerprint"]);
  -[CPLAssetChange setFacesAdjustmentsFingerprint:](v5, "setFacesAdjustmentsFingerprint:", v139);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerprintContext]);
  if (-[CPLAssetChange hasChangeType:](v9, "hasChangeType:", 2LL))
  {
    SEL v142 = a2;
    if ((-[CPLAssetChange isFullRecord](v9, "isFullRecord") & 1) != 0)
    {
      id v11 = 0LL;
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[CPLAssetChange attachedDiffTracker](v9, "attachedDiffTracker"));

      if (v11)
      {
        if ((-[CPLAssetChange isFullRecord](v9, "isFullRecord") & 1) == 0
          && ![v11 areObjectsDifferentOnProperty:@"people" changeType:2])
        {
          goto LABEL_22;
        }

        char v12 = 0;
LABEL_9:
        if (-[CPLAssetChange shouldApplyPropertiesWithSelector:]( v9,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"people")))
        {
          id v140 = v11;
          __int128 v141 = v10;
          id v13 = v8;
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAssetChange people](v9, "people"));
          id v16 = [v15 countByEnumeratingWithState:&v143 objects:v151 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v144;
            do
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v144 != v18) {
                  objc_enumerationMutation(v15);
                }
                [v14 addObject:v20];
              }

              id v17 = [v15 countByEnumeratingWithState:&v143 objects:v151 count:16];
            }

            while (v17);
          }

          [v7 setObject:v14 forKey:@"people"];
          if ((v12 & 1) != 0)
          {
            char v21 = 1;
            id v8 = v13;
            id v11 = v140;
            id v10 = v141;
            goto LABEL_25;
          }

          id v8 = v13;
          id v11 = v140;
          id v10 = v141;
        }

        else if ((v12 & 1) != 0)
        {
          char v21 = 1;
          goto LABEL_25;
        }

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 1;
}

@end