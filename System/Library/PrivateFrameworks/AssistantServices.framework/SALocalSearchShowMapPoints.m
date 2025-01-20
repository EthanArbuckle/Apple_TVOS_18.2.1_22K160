@interface SALocalSearchShowMapPoints
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchShowMapPoints

- (id)_ad_transformedMapsRequest
{
  if ((-[SALocalSearchShowMapPoints showDirections](self, "showDirections") & 1) != 0)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___STSiriLocation);
    id v4 = objc_alloc_init(&OBJC_CLASS___STSiriLocation);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemSource](self, "itemSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 placeData2]);
    [v3 setGeoResult:v6];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemDestination](self, "itemDestination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 placeData2]);
    [v4 setGeoResult:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemSource](self, "itemSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 detailType]);
    uint64_t v11 = SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue;
    unsigned int v12 = [v10 isEqualToString:SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue];

    if (v12) {
      uint64_t v13 = 4LL;
    }
    else {
      uint64_t v13 = 1LL;
    }
    [v3 setResultType:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemDestination](self, "itemDestination"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 detailType]);
    unsigned int v16 = [v15 isEqualToString:v11];

    if (v16) {
      uint64_t v17 = 4LL;
    }
    else {
      uint64_t v17 = 1LL;
    }
    [v4 setResultType:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints directionsType](self, "directionsType"));
    unsigned __int8 v19 = [v18 isEqualToString:SALocalSearchDirectionsTypeByCarValue];

    if ((v19 & 1) != 0)
    {
      uint64_t v20 = 1LL;
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints directionsType](self, "directionsType"));
      unsigned __int8 v27 = [v26 isEqualToString:SALocalSearchDirectionsTypeByPublicTransitValue];

      if ((v27 & 1) != 0)
      {
        uint64_t v20 = 2LL;
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints directionsType](self, "directionsType"));
        unsigned __int8 v29 = [v28 isEqualToString:SALocalSearchDirectionsTypeWalkingValue];

        if ((v29 & 1) != 0)
        {
          uint64_t v20 = 3LL;
        }

        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints directionsType](self, "directionsType"));
          unsigned int v31 = [v30 isEqualToString:SALocalSearchDirectionsTypeBikingValue];

          uint64_t v20 = 4LL;
          if (!v31) {
            uint64_t v20 = 0LL;
          }
        }
      }
    }

    uint64_t v40 = v20;
    id v32 = objc_alloc(&OBJC_CLASS___STStartNavigationRequest);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints arrivalDate](self, "arrivalDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints departureDate](self, "departureDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemSource](self, "itemSource"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 extSessionGuid]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemSource](self, "itemSource"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 extSessionGuidCreatedTimestamp]);
    id v25 = [v32 _initWithStartLocation:v3 destinationLocation:v4 directionsType:v40 arrivalDate:v33 departureDate:v34 extSessionGuid:v36 extSessio nGuidCreatedTimestamp:v38];
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowMapPoints itemSource](self, "itemSource"));
    id v21 = objc_alloc(&OBJC_CLASS___STShowMapPointRequest);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v3 placeData2]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v3 extSessionGuid]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v3 extSessionGuidCreatedTimestamp]);
    id v25 = [v21 _initWithPlaceData:v22 extSessionGuid:v23 extSessionGuidCreatedTimestamp:v24];

    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 detailType]);
    objc_msgSend( v25,  "setIsCurrentLocation:",  objc_msgSend(v4, "isEqualToString:", SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue));
  }

  return v25;
}

- (id)_ad_transformedMapsSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SALocalSearchShowMapPointsCompleted);
}

@end