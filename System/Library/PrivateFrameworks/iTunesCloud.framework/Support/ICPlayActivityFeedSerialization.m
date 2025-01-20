@interface ICPlayActivityFeedSerialization
+ (id)defaultOverrideHTTPHeaderFields;
- (NSString)currentStoreFrontID;
- (id)propertyListObjectWithPlayActivityEvent:(id)a3;
- (void)setCurrentStoreFrontID:(id)a3;
@end

@implementation ICPlayActivityFeedSerialization

+ (id)defaultOverrideHTTPHeaderFields
{
  v3[0] = ICStoreHTTPHeaderKeyXGUID;
  v3[1] = ICHTTPHeaderKeyUserAgent;
  v3[2] = ICStoreHTTPHeaderKeyXDSID;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

- (id)propertyListObjectWithPlayActivityEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v63 = 0LL;
    goto LABEL_204;
  }

  v183 = self;
  id v182 = [v4 eventType];
  v6 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  50LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 targetedAudioQuality]);
  if (v7)
  {
    v8 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  6LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 bitDepth]));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, @"audio-bit-depth");

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 bitRate]));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"bit-rate-in-bps");

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 channelLayoutDescription]);
    v12 = (void *)v11;
    if (v11) {
      v13 = (const __CFString *)v11;
    }
    else {
      v13 = &stru_1001A7960;
    }
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, @"audio-channel-type");
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 codecString]);
    v15 = (void *)v14;
    if (v14) {
      v16 = (const __CFString *)v14;
    }
    else {
      v16 = &stru_1001A7960;
    }
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v16, @"codec");
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 sampleRate]));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, @"audio-sample-rate-in-hz");

    else {
      v18 = &off_1001B3E68;
    }
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v18, @"playback-format");
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, @"audio-quality-targeted");
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue([v5 providedAudioQuality]);
  v187 = (void *)v19;
  if (v19)
  {
    v20 = (void *)v19;
    v21 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  6LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v20 bitDepth]));
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, @"audio-bit-depth");

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v187 bitRate]));
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, @"bit-rate-in-bps");

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v187 channelLayoutDescription]);
    v25 = (void *)v24;
    if (v24) {
      v26 = (const __CFString *)v24;
    }
    else {
      v26 = &stru_1001A7960;
    }
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v26, @"audio-channel-type");
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v187 codecString]);
    v28 = (void *)v27;
    if (v27) {
      v29 = (const __CFString *)v27;
    }
    else {
      v29 = &stru_1001A7960;
    }
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v29, @"codec");
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v187 sampleRate]));
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v30, @"audio-sample-rate-in-hz");

    else {
      v31 = &off_1001B3E68;
    }
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v31, @"playback-format");
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v21, @"audio-quality-provided");
  }

  id v32 = [v5 audioQualityPreference];
  if (v32)
  {
    else {
      id v33 = v32;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v33));
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v34, @"user-preference-audio-quality");
  }

  id v35 = [v5 playbackFormatPreference];
  if (v35)
  {
    if (v35 == (id)2) {
      uint64_t v36 = 2LL;
    }
    else {
      uint64_t v36 = v35 == (id)1;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v36));
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v37, @"user-preference-playback-format");
  }

  v38 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v5 buildFeatures]);
  v40 = -[NSMutableArray initWithArray:](v38, "initWithArray:", v39);

  if (v40 && -[NSMutableArray count](v40, "count")) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v40, @"build-features");
  }
  v179 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 enqueuerProperties]);
  v42 = v6;
  v43 = v42;
  v180 = v7;
  if (v41)
  {
    v44 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  8LL);

    v45 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v41 isSBEnabled]));
    -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v46, @"sb-enabled");

    v47 = (void *)objc_claimAutoreleasedReturnValue([v41 deviceName]);
    if ([v47 length]) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v47, @"device-name");
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue([v41 storeFrontID]);
    if ([v48 length]) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v48, @"store-front");
    }
    v185 = v44;
    v177 = (void *)objc_claimAutoreleasedReturnValue([v41 timeZone]);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v177 secondsFromGMT]));
    -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v49, @"utc-offset-in-seconds");

    v50 = (void *)objc_claimAutoreleasedReturnValue([v41 buildVersion]);
    if ([v50 length]) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v50, @"build-version");
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue([v41 deviceGUID]);
    if ([v51 length]) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v51, @"guid");
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue([v41 isPrivateListeningEnabled]);
    if (v52) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v52, @"private-enabled");
    }
    if ([v41 systemReleaseType] == (id)4) {
      -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", &__kCFBooleanTrue, @"internal-build");
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v41 storeAccountID]));
    -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v53, @"dsid");

    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v45, @"enqueuer");
    v43 = v185;
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isSBEnabled]));
  -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v54, @"sb-enabled");

  v55 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceName]);
  if ([v55 length]) {
    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v55, @"device-name");
  }
  v56 = (NSString *)objc_claimAutoreleasedReturnValue([v5 storeFrontID]);
  if (!v56) {
    v56 = v183->_currentStoreFrontID;
  }
  if (-[NSString length](v56, "length")) {
    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v56, @"store-front");
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue([v5 eventTimeZone]);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v57 secondsFromGMT]));
  -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v58, @"utc-offset-in-seconds");

  v59 = (void *)objc_claimAutoreleasedReturnValue([v5 buildVersion]);
  if ([v59 length]) {
    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v59, @"build-version");
  }
  if ([v5 systemReleaseType] == (id)4) {
    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", &__kCFBooleanTrue, @"internal-build");
  }
  v186 = v43;
  v60 = (void *)objc_claimAutoreleasedReturnValue([v5 isPrivateListeningEnabled]);
  if (v60) {
    -[NSMutableDictionary setObject:forKey:](v186, "setObject:forKey:", v60, @"private-enabled");
  }

  v61 = v186;
  if (v41 && v186 != v42) {
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v186, @"player");
  }
  v168 = (char *)objc_msgSend(v5, "containerType", v61);
  else {
    uint64_t v62 = qword_10013B450[(void)(v168 - 1)];
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v62));
  -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v64, @"container-type");

  if ([v5 eventType] == (id)2)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isContinuityCameraUsed]));
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v65, @"is-continuity-camera-used");
  }

  if (v182 != (id)1)
  {
    [v5 itemEndTime];
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  (uint64_t)(v66 * 1000.0)));
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v67, @"end-position-in-milliseconds");

    if (v182 == (id)2)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 displayType]));
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v70, @"display-type");

      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 lyricsDisplayedCharacterCount]));
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v71, @"character-displayed-count");

      v72 = (void *)objc_claimAutoreleasedReturnValue([v5 lyricsLanguage]);
      if (![v72 length])
      {
LABEL_85:

        goto LABEL_86;
      }

      v73 = @"lyric-language";
    }

    else
    {
      if (v182) {
        goto LABEL_86;
      }
      unint64_t v68 = (unint64_t)[v5 endReasonType] - 1;
      if (v68 > 0xE) {
        uint64_t v69 = 0LL;
      }
      else {
        uint64_t v69 = qword_10013B470[v68];
      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v69));
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v74, @"end-reason-type");

      id v75 = [v5 vocalAttenuationAvailability];
      if (v75 == (id)2) {
        uint64_t v76 = 2LL;
      }
      else {
        uint64_t v76 = v75 == (id)1;
      }
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v76));
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v77, @"attenuation-available");

      [v5 vocalAttenuationDuration];
      v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  (uint64_t)(v78 * 1000.0)));
      v73 = @"vocal-attenuation-duration-in-milliseconds";
    }

    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v72, v73);
    goto LABEL_85;
  }

- (NSString)currentStoreFrontID
{
  return self->_currentStoreFrontID;
}

- (void)setCurrentStoreFrontID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end