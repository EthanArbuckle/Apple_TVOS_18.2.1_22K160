@interface SharingBTLESuggestedItem
+ (id)cornerActionBTLEItemWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 scanner:(id)a7 receiver:(id)a8;
+ (id)cornerActionBTLEItemWithSFAdvertisement:(id)a3 optionBits:(unsigned int)a4 scanner:(id)a5 receiver:(id)a6;
+ (id)statusString;
- (BOOL)requestPayloadWithCompletionHandler:(id)a3;
- (BOOL)updateFromSFAdvertisement:(id)a3;
- (NSDate)currentUntilDate;
- (NSDate)dontPrefetchBefore;
- (NSDate)removeAfter;
- (NSMutableSet)payloadRequestedCompletions;
- (NSSet)teamIDs;
- (SFActivityScanner)scanner;
- (SharingBTLEAdvertisementPayload)advertisementPayload;
- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13;
- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13 dynamicIdentifier:(id)a14;
- (UACornerActionManager)manager;
- (UASharingReceiver)receiver;
- (double)payloadAvailabilityDelay;
- (id)description;
- (id)statusString;
- (id)when;
- (unsigned)optionBits;
- (void)clearPayload;
- (void)resignCurrent;
- (void)setAdvertisementPayload:(id)a3;
- (void)setCurrentUntilDate:(id)a3;
- (void)setDontPrefetchBefore:(id)a3;
- (void)setOptionBits:(unsigned int)a3;
- (void)setPayloadAvailabilityDelay:(double)a3;
- (void)setPayloadRequestedCompletions:(id)a3;
- (void)setRemoveAfter:(id)a3;
- (void)setTeamIDs:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation SharingBTLESuggestedItem

+ (id)cornerActionBTLEItemWithSFAdvertisement:(id)a3 optionBits:(unsigned int)a4 scanner:(id)a5 receiver:(id)a6
{
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    id v9 = a6;
    id v10 = a5;
    id v11 = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 advertisementPayload]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 device]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 options]);

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SharingBTLESuggestedItem cornerActionBTLEItemWithPayload:device:options:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithPayload:device:options:optionBits:scanner:receiver:",  v12,  v13,  v14,  v7,  v10,  v9));
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (id)cornerActionBTLEItemWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 scanner:(id)a7 receiver:(id)a8
{
  v13 = (__CFString *)a3;
  id v14 = a4;
  id v15 = a5;
  id v146 = a7;
  id v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));
  uint64_t v19 = _LSAdvertisementBytesKind(v13);
  if (v19 == 3) {
    uint64_t v20 = 3LL;
  }
  else {
    uint64_t v20 = 1LL;
  }
  if (!v13) {
    goto LABEL_16;
  }
  if ((a6 & 2) != 0)
  {
    os_log_t v29 = sub_100039584(0LL);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v159 = v13;
      __int16 v160 = 2048;
      unint64_t v161 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "** DISCARDING ADVERTISEMENT with hash %{public}@ because it contains a fileProvider (0x%lx), and this platform d oes not support it.",  buf,  0x16u);
    }

    goto LABEL_15;
  }

  if ((a6 & 4) != 0)
  {
LABEL_15:

LABEL_16:
    v31 = 0LL;
    goto LABEL_17;
  }

  uint64_t v21 = v19;
  uint64_t v140 = v20;
  unsigned int v142 = a6;
  v144 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v143 = (__CFString *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising(v13);
  id v141 = v14;
  v145 = v13;
  switch(v21)
  {
    case 1LL:
      os_log_t v22 = sub_100039584(0LL);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      v24 = v143;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v159 = v143;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  " -- Received a kLSAdvertisementStringUserActivityKind; finding application with advertising string %{public}@",
          buf,
          0xCu);
      }

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v144 applicationForUserActivityType:v143]);
      if (v25)
      {
        v26 = (void *)v25;
        v127 = 0LL;
        uint64_t v27 = 0LL;
        v152 = 0LL;
        id v28 = 0LL;
      }

      else
      {
        v134 = v17;
        v138 = v18;
        v76 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
        v147 = -[NSUserDefaults initWithSuiteName:](v76, "initWithSuiteName:", kUADynamicUserActivitesPreferences);
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v147, "objectForKey:", kUADynamicUserActivitiesKey));
        v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:v143]);
        v79 = v78;
        if (v78)
        {
          v127 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKey:kUADynamicUserActivityHashKey]);
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "applicationForUserActivityType:"));
          uint64_t v130 = objc_claimAutoreleasedReturnValue([v79 objectForKey:kUADynamicUserActivityDynamicActivityKey]);
          id v28 = (id)objc_claimAutoreleasedReturnValue([v80 bundleIdentifier]);
          v152 = (__CFString *)objc_claimAutoreleasedReturnValue([v79 objectForKey:kUADynamicUserActivityAppActivityKey]);
          v26 = v80;
          sub_10004B398(v80, v134);
        }

        else
        {
          v127 = 0LL;
          uint64_t v130 = 0LL;
          v26 = 0LL;
          v152 = 0LL;
          id v28 = 0LL;
        }

        v17 = v134;
        v18 = v138;
        v24 = v143;
        uint64_t v27 = v130;
      }

      char v98 = v142;
      v131 = (void *)v27;
      if (v27 || !v26) {
        goto LABEL_91;
      }
      v139 = v18;
      v99 = (void *)objc_claimAutoreleasedReturnValue([v26 activityTypes]);
      if (![v99 count]) {
        goto LABEL_88;
      }
      v149 = v28;
      v135 = v17;
      uint64_t v100 = 0LL;
      while (1)
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue([v99 objectAtIndex:v100]);
        v102 = (__CFString *)_LSCreateHashedBytesForAdvertisingFromString(1LL, v101);
        if (!_LSCompareHashedBytesFromAdvertisingStrings(v102, v13)) {
          break;
        }

        if (++v100 >= (unint64_t)[v99 count])
        {
          v17 = v135;
          id v28 = v149;
LABEL_88:
          if (!v28)
          {

            v26 = 0LL;
          }

          v18 = v139;
          char v98 = v142;
LABEL_91:
          if (!v26)
          {
            if ((v98 & 1) != 0)
            {
              id v112 = sub_10005C524();
              v26 = (void *)objc_claimAutoreleasedReturnValue(v112);
              if (v26)
              {
                v150 = v28;
                os_log_t v113 = sub_100039584(0LL);
                v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v159 = v143;
                  _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "-- Falling back to _UAUserActivityTypeBrowsingWeb because no application matched the advertisement % {public}@ and kUserActivityAdvertisingBytesItemHasWebpageURLMask was set.",  buf,  0xCu);
                }

                sub_10004B398(v26, v17);
                id v28 = (id)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);

                v152 = @"NSUserActivityTypeBrowsingWeb";
                v24 = v143;
              }
            }

            else
            {
              v26 = 0LL;
            }
          }

          v64 = v131;
          goto LABEL_99;
        }
      }

      os_log_t v103 = sub_100039584(0LL);
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v105 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
        *(_DWORD *)buf = 138543875;
        v159 = v102;
        __int16 v160 = 2113;
        unint64_t v161 = (unint64_t)v101;
        __int16 v162 = 2113;
        v163 = v105;
        _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  " -- MATCHED, adverising bytes %{public}@ to activityType %{private}@, from application %{private}@",  buf,  0x20u);
      }

      sub_10004B398(v26, v135);
      uint64_t v106 = objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);

      v107 = (char *)[v101 rangeOfString:@":"];
      if (v108 && (v109 = v107 + 1, v107 + 1 < [v101 length])) {
        v110 = (__CFString *)objc_claimAutoreleasedReturnValue([v101 substringFromIndex:v109]);
      }
      else {
        v110 = v101;
      }
      v111 = v110;

      v152 = v111;
      id v28 = (id)v106;
      v17 = v135;
      v24 = v143;
      goto LABEL_88;
    case 2LL:
      os_log_t v33 = sub_100039584(0LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v159 = v143;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  " -- Received a kLSAdvertisementStringDomainNameKind; looking for native application application with advertisi"
          "ng string %{public}@",
          buf,
          0xCu);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue([v144 applicationForUserActivityType:v143]);
      if (!v26) {
        goto LABEL_39;
      }
      v132 = v17;
      v136 = v18;
      id v126 = v16;
      id v128 = v15;
      v35 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      sub_10004B398(v26, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
      v37 = (void *)((uint64_t (*)(void))_LSCopyUserActivityDomainNamesForBundleID)();
      v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v37));

      __int128 v156 = 0u;
      __int128 v157 = 0u;
      __int128 v154 = 0u;
      __int128 v155 = 0u;
      v38 = v35;
      id v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v154,  v166,  16LL);
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v155;
        do
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v155 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v154 + 1) + 8LL * (void)i);
            uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0)
            {
              v45 = v26;
              v46 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingFormat:@".%@", v46]);

              v48 = (void *)_LSCopyUserActivityDomainNamesForBundleID(v47);
              os_log_t v49 = sub_100039584(0LL);
              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                v159 = v47;
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEBUG,  " -- Adding domains for bundleID: %{private}@",  buf,  0xCu);
              }

              [v153 addObjectsFromArray:v48];
              v26 = v45;
            }
          }

          id v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v154,  v166,  16LL);
        }

        while (v40);
      }

      os_log_t v51 = sub_100039584(0LL);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue([v153 description]);
        id v54 = sub_10005BF18(v53);
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue(v54);
        *(_DWORD *)buf = 138477827;
        v159 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  " -- Domain name strings: %{private}@",  buf,  0xCu);
      }

      id v15 = v128;
      if (![v153 count]) {
        goto LABEL_38;
      }
      unint64_t v56 = 0LL;
      break;
    case 3LL:
      v24 = v143;
      v66 = v143;
      v67 = (void *)UAUserActivityTypeSiri;
      v152 = v66;
      if (-[__CFString isEqualToString:](v66, "isEqualToString:", UAUserActivityTypeSiri))
      {
        id v28 = v67;

        v26 = 0LL;
        v64 = 0LL;
        v17 = 0LL;
        goto LABEL_99;
      }

      id v28 = 0LL;
      v64 = 0LL;
      v26 = 0LL;
      goto LABEL_105;
    case 4LL:
      v137 = v18;
      os_log_t v68 = sub_100039584(0LL);
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      v24 = v143;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v159 = v143;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  " -- Received a kLSAdvertisementStringPrivateSpaceKind; finding application with private space string %{public}@",
          buf,
          0xCu);
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue([v144 applicationForUserActivityType:v143]);
      v26 = v70;
      if (!v70)
      {
        id v28 = 0LL;
        v65 = 0LL;
        v64 = 0LL;
        goto LABEL_106;
      }

      v71 = (void *)objc_claimAutoreleasedReturnValue([v70 activityTypes]);
      if ([v71 count])
      {
        v129 = v26;
        v133 = v17;
        v72 = v13;
        uint64_t v73 = 0LL;
        while (1)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue([v71 objectAtIndex:v73]);
          v75 = (void *)_LSCreateHashedBytesForAdvertisingFromString(4LL, v74);
          if (!_LSCompareHashedBytesFromAdvertisingStrings(v75, v72)) {
            break;
          }

          if (++v73 >= (unint64_t)[v71 count])
          {
            v152 = 0LL;
            id v28 = 0LL;
            v13 = v72;
            v26 = v129;
            v17 = v133;
            goto LABEL_85;
          }
        }

        os_log_t v88 = sub_100039584(0LL);
        v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          id v90 = sub_1000034D8(v75);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue(v90);
          v92 = (void *)objc_claimAutoreleasedReturnValue([v129 bundleIdentifier]);
          *(_DWORD *)buf = 138543875;
          v159 = v91;
          __int16 v160 = 2113;
          unint64_t v161 = (unint64_t)v74;
          __int16 v162 = 2113;
          v163 = v92;
          _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  " -- MATCHED, adverising bytes %{public}@ to privateType string %{private}@, from application %{private}@",  buf,  0x20u);
        }

        uint64_t v148 = objc_claimAutoreleasedReturnValue([v129 bundleIdentifier]);
        v17 = v133;
        sub_10004B398(v129, v133);
        if ([v74 hasPrefix:@"NOTIFICATION#"])
        {
          [v137 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityIsNotificationOptionKey];
          uint64_t v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "substringFromIndex:", objc_msgSend(@"NOTIFICATION#", "length")));

          uint64_t v140 = 2LL;
          v74 = (void *)v93;
        }

        v94 = (char *)[v74 rangeOfString:@":"];
        if (v95 && (v96 = v94 + 1, v94 + 1 < [v74 length])) {
          v97 = (__CFString *)objc_claimAutoreleasedReturnValue([v74 substringFromIndex:v96]);
        }
        else {
          v97 = v74;
        }
        v152 = v97;
        v24 = v143;

        v13 = v72;
        v26 = v129;
        id v28 = (id)v148;
      }

      else
      {
        v152 = 0LL;
        id v28 = 0LL;
      }

- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13 dynamicIdentifier:(id)a14
{
  uint64_t v16 = *(void *)&a6;
  id v21 = a14;
  os_log_t v22 = -[SharingBTLESuggestedItem initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scanner:receiver:]( self,  "initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scanner:receiver:",  a3,  a4,  a5,  v16,  a7,  a8,  a9,  a10,  a11,  a12,  a13);
  v23 = v22;
  if (v22) {
    -[SharingBTLESuggestedItem setDynamicActivityType:](v22, "setDynamicActivityType:", v21);
  }

  return v23;
}

- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13
{
  id v100 = a3;
  id v97 = a4;
  id v96 = a5;
  id v16 = a8;
  id v102 = a9;
  id v17 = a10;
  id v18 = a11;
  id v19 = a12;
  id v95 = a13;
  os_log_t v20 = sub_100039584(0LL);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v22 = sub_10005C364(a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
    id v25 = sub_10005BF18(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 description]);
    id v92 = v19;
    id v28 = v18;
    id v29 = v17;
    id v30 = v16;
    v31 = v27;
    id v32 = sub_10005BF18(v27);
    os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138479363;
    id v105 = v100;
    __int16 v106 = 2048;
    uint64_t v107 = a6;
    __int16 v108 = 2113;
    v109 = v23;
    __int16 v110 = 2113;
    id v111 = v30;
    __int16 v112 = 2113;
    id v113 = v102;
    __int16 v114 = 2113;
    os_log_t v115 = v26;
    __int16 v116 = 2114;
    id v117 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Creating CornerActionBTLEItem, advertisementPayload=%{private}@ optionBit=%ld type=%{private}@ activityType=%{priv ate}@ bundleID=%{private}@ teamID=%{private}@ advertisingOptions=%{public}@",  buf,  0x48u);

    id v16 = v30;
    id v17 = v29;
    id v18 = v28;
    id v19 = v92;
  }

  if (!v16)
  {
    id v99 = v18;
    id v42 = v17;
    os_log_t v43 = sub_100039584(0LL);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    v36 = v100;
    v37 = v97;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = sub_1000034D8(v100);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138543362;
      id v105 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Unable to determine application on this device for advertisement %{public}@, so ignoring this received activity.",  buf,  0xCu);
    }

    v35 = 0LL;
    id v40 = v96;
    goto LABEL_41;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v103.receiver = self;
  v103.super_class = (Class)&OBJC_CLASS___SharingBTLESuggestedItem;
  v35 = -[SharingBTLESuggestedItem initWithUUID:type:options:](&v103, "initWithUUID:type:options:", v34, a7, v18);

  v36 = v100;
  v37 = v97;
  if (v35)
  {
    id v90 = v16;
    objc_storeStrong((id *)&v35->_scanner, a12);
    objc_storeStrong((id *)&v35->_receiver, a13);
    v38 = -[SharingBTLEAdvertisementPayload initWithAdvertisedBytes:]( objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload),  "initWithAdvertisedBytes:",  v100);
    advertisementPayload = v35->_advertisementPayload;
    v35->_advertisementPayload = v38;

    v35->_optionBits = a6;
    id v40 = v96;
    if (v96) {
      uint64_t v41 = (SharingBTLESuggestedItem *)[v96 mutableCopy];
    }
    else {
      uint64_t v41 = (SharingBTLESuggestedItem *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary"));
    }
    v47 = v41;
    if ((a6 & 1) != 0)
    {
      -[SharingBTLESuggestedItem setObject:forKey:]( v41,  "setObject:forKey:",  &__kCFBooleanTrue,  UAUserActivityHasWebPageURLOptionKey);
      if ((a6 & 2) == 0)
      {
LABEL_14:
        if ((a6 & 0x40) == 0) {
          goto LABEL_15;
        }
        goto LABEL_22;
      }
    }

    else if ((a6 & 2) == 0)
    {
      goto LABEL_14;
    }

    -[SharingBTLESuggestedItem setObject:forKey:]( v47,  "setObject:forKey:",  &__kCFBooleanTrue,  _LSUserActivityContainsFileProviderURLKey,  v16);
    if ((a6 & 0x40) == 0)
    {
LABEL_15:
      if ((a6 & 0x80) == 0) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }

- (BOOL)updateFromSFAdvertisement:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
    id v8 = sub_1000034D8(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self, "uuid"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    int v42 = 138543618;
    os_log_t v43 = v9;
    __int16 v44 = 2114;
    id v45 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "RECEIVED advertisement, %{public}@, matched against existing corner item %{public}@ so merely update it from the flags & options",  (uint8_t *)&v42,  0x16u);
  }

  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 advertisementPayload]);
    unsigned __int8 v15 = [v12 isEqual:v14];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
    char v18 = [v17 isCurrent] ^ 1;
  }

  else
  {
    char v18 = 1;
  }

  id v19 = objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload);
  os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
  id v21 = -[SharingBTLEAdvertisementPayload initWithAdvertisedBytes:](v19, "initWithAdvertisedBytes:", v20);
  -[SharingBTLESuggestedItem setAdvertisementPayload:](self, "setAdvertisementPayload:", v21);

  os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 time]);

  if ((v15 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
    unsigned __int8 v25 = [v24 isCurrent];

    if ((v18 & 1) != 0)
    {
      if ((v25 & 1) != 0)
      {
LABEL_15:
        id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[SharingBTLESuggestedItem setLastInterestingTime:](self, "setLastInterestingTime:", v28);

        goto LABEL_16;
      }
    }

    else if ((v25 & 1) == 0)
    {
      goto LABEL_16;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
    unsigned int v27 = [v26 isCurrent];

    if (!v27) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (BOOL)requestPayloadWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self, "uuid"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    else {
      id v9 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    else {
      id v10 = @"NO";
    }
    id v56 = v8;
    __int16 v57 = 2114;
    v58 = v9;
    __int16 v59 = 2114;
    double v60 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "for item %{public}@ requested=%{public}@ available=%{public}@",  buf,  0x20u);
  }

  id v11 = self;
  objc_sync_enter(v11);
  if (-[SharingBTLESuggestedItem isPayloadAvailable](v11, "isPayloadAvailable"))
  {
    os_log_t v12 = sub_100039584(0LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](v11, "uuid"));
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      *(_DWORD *)buf = 138543362;
      id v56 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Requesting payload for item %{public}@ payload, but it is already present, so dispatching directly.",  buf,  0xCu);
    }

    v4[2](v4, 0LL);
  }

  else if (-[SharingBTLESuggestedItem isPayloadRequested](v11, "isPayloadRequested"))
  {
    if (v4)
    {
      payloadRequestedCompletions = v11->_payloadRequestedCompletions;
      id v17 = objc_retainBlock(v4);
      -[NSMutableSet addObject:](payloadRequestedCompletions, "addObject:", v17);
    }
  }

  else
  {
    char v18 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem payloadRequestedCompletions](v11, "payloadRequestedCompletions"));
    BOOL v19 = v18 == 0LL;

    if (v19)
    {
      os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      -[SharingBTLESuggestedItem setPayloadRequestedCompletions:](v11, "setPayloadRequestedCompletions:", v20);
    }

    if (v4)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem payloadRequestedCompletions](v11, "payloadRequestedCompletions"));
      os_log_t v22 = objc_retainBlock(v4);
      [v21 addObject:v22];
    }

    -[SharingBTLESuggestedItem setPayloadRequested:](v11, "setPayloadRequested:", 1LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v11, "wasContinuedInfo"));
    [v23 setPayloadRequested:1];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](v11, "peerDevice"));
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 modelIdentifier]);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v11, "wasContinuedInfo"));
    [v26 setRemoteDeviceType:v25];

    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [v27 handoffPayloadRequestTimout];
    double v29 = v28;

    os_log_t v30 = sub_100039584(0LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](v11, "uuid"));
      id v33 = (id)objc_claimAutoreleasedReturnValue([v32 UUIDString]);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](v11, "advertisementPayload"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 payloadBytes]);
      id v36 = sub_1000034D8(v35);
      double v37 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v36);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](v11, "bundleIdentifier"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
      *(_DWORD *)buf = 138544131;
      id v56 = v33;
      __int16 v57 = 2114;
      v58 = v37;
      __int16 v59 = 2113;
      double v60 = v38;
      __int16 v61 = 2114;
      v62 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Requesting payload for item %{public}@ advertisementPayload=%{public}@ bundleIdentifier=%{private}@ with timeout: %{public}@",  buf,  0x2Au);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v41 = sub_10005C3D4();
    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](v11, "uuid"));
    os_log_t v43 = (void *)qword_1000DE448;
    qword_1000DE448 = v42;

    __int16 v44 = objc_alloc_init(&OBJC_CLASS___NSDate);
    id v45 = (void *)qword_1000DE450;
    qword_1000DE450 = (uint64_t)v44;

    kdebug_trace(722141192LL, 0LL, 0LL, 0LL, 0LL);
    os_log_t v46 = sub_100039584(@"signposts");
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    id v48 = v47;
    if ((unint64_t)&v11->UAUserActivityInfo_opaque[1] >= 2 && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v11,  "sharingFetch",  (const char *)&unk_1000ABCB9,  buf,  2u);
    }

    id v49 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem scanner](v11, "scanner"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](v11, "peerDevice"));
    os_log_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](v11, "advertisementPayload"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 payloadBytes]);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_10004CA3C;
    v54[3] = &unk_1000BDDF8;
    v54[4] = v11;
    *(double *)&v54[5] = v41;
    *(CFAbsoluteTime *)&v54[6] = Current;
    [v49 activityPayloadFromDevice:v50 forAdvertisementPayload:v52 command:@"HANDOFF" timeout:(uint64_t)v29 withCompletionHandler:v54];
  }

  objc_sync_exit(v11);

  return 1;
}

- (void)resignCurrent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem when](self, "when"));
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SharingBTLESuggestedItem;
  -[SharingBTLESuggestedItem setWhen:](&v4, "setWhen:", v3);

  -[SharingBTLESuggestedItem setCurrentUntilDate:](self, "setCurrentUntilDate:", 0LL);
}

- (void)clearPayload
{
  os_log_t v3 = sub_100039584(0LL);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self, "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    *(_DWORD *)buf = 138543619;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "PAYLOAD: clearing payload for activity %{public}@, self=%{private}@",  buf,  0x16u);
  }

  uint64_t v7 = self;
  objc_sync_enter(v7);
  v12.receiver = v7;
  v12.super_class = (Class)&OBJC_CLASS___SharingBTLESuggestedItem;
  -[SharingBTLESuggestedItem clearPayload](&v12, "clearPayload");
  if (-[SharingBTLESuggestedItem isPayloadAvailable](v7, "isPayloadAvailable"))
  {
    os_log_t v8 = sub_100039584(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](v7, "uuid"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      *(_DWORD *)buf = 138543362;
      id v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "--- item %{public}@ payload already present, so nil-ing it out.",  buf,  0xCu);
    }

    -[SharingBTLESuggestedItem setPayloadAvailable:](v7, "setPayloadAvailable:", 0LL);
  }

  objc_sync_exit(v7);
}

- (id)statusString
{
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self, "uuid"));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
  unsigned int v33 = -[SharingBTLESuggestedItem optionBits](self, "optionBits");
  if (v33)
  {
    os_log_t v3 = "";
    else {
      objc_super v4 = "";
    }
    else {
      os_log_t v5 = "";
    }
    else {
      v6 = "";
    }
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s%s%s%s/%lx",  v4,  v5,  v6,  v3,  -[SharingBTLESuggestedItem optionBits](self, "optionBits")));
  }

  else
  {
    v35 = &stru_1000BE738;
  }

  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](self, "bundleIdentifier"));
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem when](self, "when"));
  uint64_t v7 = sub_1000758E0(v32);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(v7);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem removeAfter](self, "removeAfter"));
  if (v8)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem removeAfter](self, "removeAfter"));
    id v9 = sub_1000758E0(v31);
    os_log_t v30 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"remove:%@ ",  v30));
  }

  else
  {
    id v10 = &stru_1000BE738;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](self, "peerDevice"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](self, "peerDevice"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 modelIdentifier]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](self, "peerDevice"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceType]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"BTLEItem:%@ %@%@ id=%@ when=%@ %@device=%@ modelCode=%@ deviceType=%@",  v39,  v38,  v35,  v37,  v36,  v10,  v12,  v14,  v16));

  if (v8)
  {
  }

  if (v33) {
  char v18 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem options](self, "options"));
  }
  id v19 = [v18 count];

  if (v19)
  {
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem options](self, "options"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v20,  0LL,  0LL));

    os_log_t v22 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v21, 4LL);
    [v17 appendFormat:@" options=%@", v22];
  }

  if (-[SharingBTLESuggestedItem isPayloadAvailable](self, "isPayloadAvailable"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[SharingBTLESuggestedItem payloadForIdentifier:]( self,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
    id v24 = sub_10005BD28(v23, 64LL);
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" payload=$%@",  v25));
    [v17 appendString:v26];
  }

  else
  {
    else {
      unsigned int v27 = @" payload NA";
    }
    [v17 appendString:v27];
  }

  id v28 = [v17 copy];

  return v28;
}

- (id)when
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SharingBTLESuggestedItem;
  id v3 = -[SharingBTLESuggestedItem when](&v11, "when");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem currentUntilDate](self, "currentUntilDate"));
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    if ([v8 compare:v6] == (id)-1)
    {
      id v9 = v8;

      objc_super v4 = v9;
    }
  }

  return v4;
}

- (void)setWhen:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem currentUntilDate](self, "currentUntilDate"));
  if (!v4 || v5)
  {
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem when](self, "when"));
    unsigned __int8 v7 = [v4 isEqual:v6];

    if ((v7 & 1) != 0) {
      goto LABEL_7;
    }
  }

  -[SharingBTLESuggestedItem setCurrentUntilDate:](self, "setCurrentUntilDate:", 0LL);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SharingBTLESuggestedItem;
  -[SharingBTLESuggestedItem setWhen:](&v9, "setWhen:", v4);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem manager](self, "manager"));
  [v8 scheduleBestAppDetermination];

LABEL_7:
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self, "uuid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem activityType](self, "activityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](self, "bundleIdentifier"));
  if (v6) {
    unsigned __int8 v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](self, "bundleIdentifier"));
  }
  else {
    unsigned __int8 v7 = @"-";
  }
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem when](self, "when"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UASharingBTLEItem:%@ %@/%@ %@",  v4,  v5,  v7,  v8));

  if (v6) {
  return v9;
  }
}

+ (id)statusString
{
  if (qword_1000DE448)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000DE448 UUIDString]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Last BTLE payload fetched for item %@, at %@, from %@\n",  v2,  qword_1000DE450,  0LL));
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (NSDate)currentUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentUntilDate:(id)a3
{
}

- (SFActivityScanner)scanner
{
  return (SFActivityScanner *)objc_getProperty(self, a2, 24LL, 1);
}

- (SharingBTLEAdvertisementPayload)advertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (double)payloadAvailabilityDelay
{
  return self->_payloadAvailabilityDelay;
}

- (void)setPayloadAvailabilityDelay:(double)a3
{
  self->_payloadAvailabilityDelay = a3;
}

- (NSMutableSet)payloadRequestedCompletions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPayloadRequestedCompletions:(id)a3
{
}

- (UASharingReceiver)receiver
{
  return (UASharingReceiver *)objc_getProperty(self, a2, 56LL, 1);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 64LL, 1);
}

- (unsigned)optionBits
{
  return self->_optionBits;
}

- (void)setOptionBits:(unsigned int)a3
{
  self->_optionBits = a3;
}

- (NSSet)teamIDs
{
  return (NSSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTeamIDs:(id)a3
{
}

- (NSDate)dontPrefetchBefore
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDontPrefetchBefore:(id)a3
{
}

- (NSDate)removeAfter
{
  return (NSDate *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRemoveAfter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end