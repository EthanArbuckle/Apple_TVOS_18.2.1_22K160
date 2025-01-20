@interface CPLPlaceAnnotation
+ (CPLPlaceAnnotation)placeAnnotationWithCPLPlaceAnnotationDictionary:(id)a3;
- (id)cplPlaceAnnotationDictionary;
@end

@implementation CPLPlaceAnnotation

+ (CPLPlaceAnnotation)placeAnnotationWithCPLPlaceAnnotationDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"level", objc_opt_class(NSNumber));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
    id v6 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"name", objc_opt_class(NSString));
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

    if (v5 | v7)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___CPLPlaceAnnotation);
      -[CPLPlaceAnnotation setPlaceLevel:](v8, "setPlaceLevel:", v5);
      -[CPLPlaceAnnotation setPlaceName:](v8, "setPlaceName:", v7);
    }

    else
    {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)cplPlaceAnnotationDictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPlaceAnnotation placeLevel](self, "placeLevel"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPlaceAnnotation placeLevel](self, "placeLevel"));
    [v3 setObject:v5 forKey:@"level"];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPlaceAnnotation placeName](self, "placeName"));

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPlaceAnnotation placeName](self, "placeName"));
    [v3 setObject:v7 forKey:@"name"];
  }

  return v3;
}

@end