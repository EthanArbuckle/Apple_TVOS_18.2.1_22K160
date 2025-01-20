@interface CLPMeta
+ (BOOL)isInCountry:(id)a3;
+ (BOOL)isInIndia;
+ (id)meta;
+ (void)updateRegulatoryDomainEstimates;
@end

@implementation CLPMeta

+ (BOOL)isInCountry:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = objc_msgSend(+[CLPMeta meta](CLPMeta, "meta"), "regulatoryDomainEstimates", 0);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "countryCode"),  "isEqualToString:",  a3))
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (char)v5;
}

+ (BOOL)isInIndia
{
  return +[CLPMeta isInCountry:](&OBJC_CLASS___CLPMeta, "isInCountry:", @"IN");
}

+ (id)meta
{
  if (qword_10199F5C8 != -1) {
    dispatch_once(&qword_10199F5C8, &stru_10188D418);
  }
  return (id)qword_10199F5C0;
}

+ (void)updateRegulatoryDomainEstimates
{
  id v2 = +[CLPMeta meta](&OBJC_CLASS___CLPMeta, "meta");
  [v2 clearRegulatoryDomainEstimates];
  id v3 = +[RDEstimate currentEstimates](&OBJC_CLASS___RDEstimate, "currentEstimates");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v7);
        id v9 = objc_alloc_init(&OBJC_CLASS___CLPRegulatoryDomainEstimate);
        objc_msgSend(v9, "setCountryCode:", objc_msgSend(v8, "countryCode"));
        objc_msgSend(v9, "setIsInDisputedArea:", objc_msgSend(v8, "isInDisputedArea"));
        [v2 addRegulatoryDomainEstimates:v9];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

@end