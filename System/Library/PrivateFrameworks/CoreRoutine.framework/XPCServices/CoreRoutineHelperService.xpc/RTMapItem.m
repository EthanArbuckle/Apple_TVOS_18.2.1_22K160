@interface RTMapItem
+ (BOOL)addressDictionaryContainsContactsKeys:(id)a3;
+ (id)convertAddressDictionaryFromContactsToGeoServices:(id)a3;
+ (id)extendedAttributesFromGEOMapItem:(id)a3 confidenceScalingFactor:(double)a4;
+ (id)extendedAttributesFromGEOMapItem:(id)a3 wifiLabelType:(int64_t)a4 wifiConfidence:(double)a5;
+ (id)locationFromGEOMapItem:(id)a3;
+ (id)nameFromGEOMapItem:(id)a3 fromSource:(unint64_t)a4;
+ (int64_t)labelTypeFromFromGEOMapItem:(id)a3;
+ (unint64_t)mapItemPlaceTypeFromGEOMapItem:(id)a3 source:(unint64_t)a4;
+ (unint64_t)mapItemPlaceTypeFromGEOMapItemPlaceType:(int)a3;
- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 confidenceScalingFactor:(double)a9;
- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 wifiLabelType:(int64_t)a9 wifiConfidence:(double)a10;
- (id)addressFromGeoMapItem:(id)a3;
- (id)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8;
@end

@implementation RTMapItem

- (id)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8
{
  return -[RTMapItem initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:confidenceScalingFactor:]( self,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:confidenceScalingFactor:",  a3,  a4,  a5,  a6,  a7,  a8,  0.001);
}

- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 confidenceScalingFactor:(double)a9
{
  id v31 = a8;
  id v16 = a7;
  id v33 = a5;
  id v17 = a4;
  id v32 = a3;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[RTMapItem nameFromGEOMapItem:fromSource:]( &OBJC_CLASS___RTMapItem,  "nameFromGEOMapItem:fromSource:",  v17,  a6));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v17 _poiCategory]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RTMapItem addressFromGeoMapItem:](self, "addressFromGeoMapItem:", v17));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[RTMapItem locationFromGEOMapItem:](&OBJC_CLASS___RTMapItem, "locationFromGEOMapItem:", v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RTMapItem extendedAttributesFromGEOMapItem:confidenceScalingFactor:]( &OBJC_CLASS___RTMapItem,  "extendedAttributesFromGEOMapItem:confidenceScalingFactor:",  v17,  a9));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 addressObject]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 displayLanguage]);

  id v21 = [(id)objc_opt_class(self) mapItemPlaceTypeFromGEOMapItem:v17 source:a6];
  id v22 = [v17 _muid];
  uint64_t v23 = (int)[v17 _resultProviderID];
  LOBYTE(a3) = [v17 isDisputed];

  LOBYTE(v25) = (_BYTE)a3;
  v26 = -[RTMapItem initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:]( self,  "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHand le:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:",  v32,  v30,  v29,  v28,  v27,  a6,  v21,  v22,  v23,  v33,  v16,  v31,  v18,  v20,  v25);

  return v26;
}

- (RTMapItem)initWithIdentifier:(id)a3 geoMapItem:(id)a4 geoMapItemHandle:(id)a5 source:(unint64_t)a6 creationDate:(id)a7 expirationDate:(id)a8 wifiLabelType:(int64_t)a9 wifiConfidence:(double)a10
{
  id v17 = a8;
  id v18 = a7;
  id v37 = a5;
  id v19 = a4;
  id v34 = a3;
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[RTMapItem nameFromGEOMapItem:fromSource:]( &OBJC_CLASS___RTMapItem,  "nameFromGEOMapItem:fromSource:",  v19,  a6));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v19 _poiCategory]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RTMapItem addressFromGeoMapItem:](self, "addressFromGeoMapItem:", v19));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[RTMapItem locationFromGEOMapItem:](&OBJC_CLASS___RTMapItem, "locationFromGEOMapItem:", v19));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[RTMapItem extendedAttributesFromGEOMapItem:wifiLabelType:wifiConfidence:]( &OBJC_CLASS___RTMapItem,  "extendedAttributesFromGEOMapItem:wifiLabelType:wifiConfidence:",  v19,  a9,  a10));
  if (a9 == 1) {
    uint64_t v21 = 2LL;
  }
  else {
    uint64_t v21 = a9 == 2;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 addressObject]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 displayLanguage]);

  id v24 = [v19 _muid];
  uint64_t v25 = (int)[v19 _resultProviderID];
  unsigned __int8 v26 = [v19 isDisputed];

  LOBYTE(v28) = v26;
  v36 = -[RTMapItem initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:]( self,  "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHand le:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:",  v34,  v33,  v32,  v30,  v29,  a6,  v21,  v24,  v25,  v37,  v18,  v17,  v20,  v23,  v28);

  return v36;
}

- (id)addressFromGeoMapItem:(id)a3
{
  id v3 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _additionalPlaceInfos]);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) placeType] == 11)
        {
          LODWORD(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

+ (id)nameFromGEOMapItem:(id)a3 fromSource:(unint64_t)a4
{
  return 0LL;
}

+ (int64_t)labelTypeFromFromGEOMapItem:(id)a3
{
  LODWORD(result) = [a3 _wifiFingerprintLabelType];
  id v4 = sub_10000B294(&qword_10002D0A0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    v7 = "+[RTMapItem(GeoMapItem) labelTypeFromFromGEOMapItem:]";
    __int16 v8 = 1024;
    int v9 = 222;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "unknown wifi fingerprint label (in %s:%d)",  (uint8_t *)&v6,  0x12u);
  }

  return -1LL;
}

+ (id)extendedAttributesFromGEOMapItem:(id)a3 confidenceScalingFactor:(double)a4
{
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _clientAttributes]);
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 addressBookAttributes]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 addressIdentifier]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 _clientAttributes]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 addressBookAttributes]);
    id v12 = [v11 isMe];

    double v13 = (double)[v6 _wifiFingerprintConfidence] * a4;
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    double v14 = fmin(v13, 1.0);
    int64_t v15 = +[RTMapItem labelTypeFromFromGEOMapItem:](&OBJC_CLASS___RTMapItem, "labelTypeFromFromGEOMapItem:", v6);
    if (v9 || (v14 > 0.0 ? (char v20 = 1) : (char v20 = (char)v12), (v20 & 1) != 0 || v15)) {
      id v16 = [[RTMapItemExtendedAttributes alloc] initWithAddressIdentifier:v9 isMe:v12 wifiConfidence:v15 wifiFingerprintLabelType:v14];
    }
    else {
      id v16 = 0LL;
    }
  }

  else
  {
    id v17 = sub_10000B294(&qword_10002D0A0);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 v21 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: geoMapItem",  v21,  2u);
    }

    id v16 = 0LL;
  }

  return v16;
}

+ (id)extendedAttributesFromGEOMapItem:(id)a3 wifiLabelType:(int64_t)a4 wifiConfidence:(double)a5
{
  id v7 = a3;
  __int16 v8 = v7;
  if (v7)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _clientAttributes]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 addressBookAttributes]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 addressIdentifier]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 _clientAttributes]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 addressBookAttributes]);
    id v14 = [v13 isMe];

    if (v11 || (a5 <= 0.0 ? (v15 = a4 == 0) : (v15 = 0), !v15 ? (int v16 = 1) : (int v16 = (int)v14), v16 == 1)) {
      id v17 = [[RTMapItemExtendedAttributes alloc] initWithAddressIdentifier:v11 isMe:v14 wifiConfidence:a4 wifiFingerprintLabelType:a5];
    }
    else {
      id v17 = 0LL;
    }
  }

  else
  {
    id v18 = sub_10000B294(&qword_10002D0A0);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 v21 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: geoMapItem",  v21,  2u);
    }

    id v17 = 0LL;
  }

  return v17;
}

+ (id)locationFromGEOMapItem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _clientAttributes]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 correctedLocationAttributes]);
    if ([v6 hasCorrectedCoordinate])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _clientAttributes]);
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 correctedLocationAttributes]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 correctedCoordinate]);
      [v9 coordinate];
      double v11 = v10;
      double v13 = v12;

      if (v13 >= -180.0 && v13 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
      {
        id v14 = objc_alloc(&OBJC_CLASS___RTLocation);
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v4 _clientAttributes]);
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 correctedLocationAttributes]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 correctedCoordinate]);
        [v17 lat];
        double v19 = v18;
        char v20 = (void *)objc_claimAutoreleasedReturnValue([v4 _clientAttributes]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 correctedLocationAttributes]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 correctedCoordinate]);
        [v22 lng];
        id v24 = objc_msgSend( v14,  "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:",  0,  objc_msgSend(v4, "referenceFrame"),  v19,  v23,  1.0);

        goto LABEL_26;
      }
    }

    else
    {
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[CLPlacemark placemarkWithGEOMapItem:](&OBJC_CLASS___CLPlacemark, "placemarkWithGEOMapItem:", v4));
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 region]);
    if (v16)
    {
      id v27 = objc_alloc(&OBJC_CLASS___RTLocation);
      [v16 center];
      double v29 = v28;
      [v16 center];
      double v31 = v30;
      [v16 radius];
      double v33 = v32;
      id v34 = [v4 referenceFrame];
      v35 = v27;
      double v36 = v29;
      double v37 = v31;
      double v38 = v33;
    }

    else
    {
      [v4 centerCoordinate];
      if (v40 < -180.0 || v40 > 180.0 || v39 < -90.0 || v39 > 90.0)
      {
        [v4 coordinate];
        if (v46 < -180.0 || v46 > 180.0 || v45 < -90.0 || v45 > 90.0)
        {
          id v50 = sub_10000B294(&qword_10002D0A0);
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            int v52 = 136315394;
            v53 = "+[RTMapItem(GeoMapItem) locationFromGEOMapItem:]";
            __int16 v54 = 1024;
            int v55 = 319;
            _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "we should have extracted a coordinate out this map item (in %s:%d)",  (uint8_t *)&v52,  0x12u);
          }

          id v24 = 0LL;
          goto LABEL_26;
        }

        id v41 = objc_alloc(&OBJC_CLASS___RTLocation);
        [v4 coordinate];
        double v43 = v47;
        [v4 coordinate];
      }

      else
      {
        id v41 = objc_alloc(&OBJC_CLASS___RTLocation);
        [v4 centerCoordinate];
        double v43 = v42;
        [v4 centerCoordinate];
      }

      double v48 = v44;
      id v34 = [v4 referenceFrame];
      double v38 = 1.0;
      v35 = v41;
      double v36 = v43;
      double v37 = v48;
    }

    id v24 = [v35 initWithLatitude:0 longitude:v34 horizontalUncertainty:v36 date:v37 referenceFrame:v38];
LABEL_26:

    goto LABEL_27;
  }

  id v25 = sub_10000B294(&qword_10002D0A0);
  unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v52 = 136315394;
    v53 = "+[RTMapItem(GeoMapItem) locationFromGEOMapItem:]";
    __int16 v54 = 1024;
    int v55 = 281;
    _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: geoMapItem (in %s:%d)",  (uint8_t *)&v52,  0x12u);
  }

  id v24 = 0LL;
LABEL_27:

  return v24;
}

+ (BOOL)addressDictionaryContainsContactsKeys:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  if ([v4 containsObject:CNPostalAddressStreetKey])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
    if ([v6 containsObject:CNPostalAddressCityKey])
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
      if ([v7 containsObject:CNPostalAddressStateKey])
      {
        unsigned __int8 v5 = 1;
      }

      else
      {
        __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
        if ([v8 containsObject:CNPostalAddressPostalCodeKey])
        {
          unsigned __int8 v5 = 1;
        }

        else
        {
          int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
          if ([v9 containsObject:CNPostalAddressCountryKey])
          {
            unsigned __int8 v5 = 1;
          }

          else
          {
            double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
            unsigned __int8 v5 = [v10 containsObject:CNPostalAddressISOCountryCodeKey];
          }
        }
      }
    }
  }

  return v5;
}

+ (id)convertAddressDictionaryFromContactsToGeoServices:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006238;
  v6[3] = &unk_1000245F8;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

+ (unint64_t)mapItemPlaceTypeFromGEOMapItem:(id)a3 source:(unint64_t)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  if ((v4 & 0x4000) == 0) {
    goto LABEL_2;
  }
  id v8 = [(id)objc_opt_class(a1) labelTypeFromFromGEOMapItem:v6];
  if (v8)
  {
    if (v8 == (id)2)
    {
      unint64_t v7 = 1LL;
      goto LABEL_10;
    }

    if (v8 != (id)1) {
      goto LABEL_2;
    }
LABEL_8:
    unint64_t v7 = 2LL;
    goto LABEL_10;
  }

  if ([v6 _muid]) {
    goto LABEL_8;
  }
LABEL_2:
  unint64_t v7 = (unint64_t)objc_msgSend( (id)objc_opt_class(a1),  "mapItemPlaceTypeFromGEOMapItemPlaceType:",  objc_msgSend(v6, "_placeType"));
LABEL_10:

  return v7;
}

+ (unint64_t)mapItemPlaceTypeFromGEOMapItemPlaceType:(int)a3
{
  else {
    return qword_100019828[a3 - 1];
  }
}

@end