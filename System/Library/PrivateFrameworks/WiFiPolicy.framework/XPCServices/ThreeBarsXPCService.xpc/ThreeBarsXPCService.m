int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  NSLog(@"%s: listener has resumed", "main");

  return 0;
}

void sub_10000252C(uint64_t a1)
{
  id v2 = [[WiFi3BarsSource alloc] initWithChangeHandler:0 localStoreType:1];
  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      v4 = *(void (**)(void))(v3 + 16);
      v6 = v2;
LABEL_8:
      v4();
LABEL_9:
      id v2 = v6;
    }
  }

  else
  {
    v6 = v2;
    NSLog( @"%s: submitting cache size metric",  "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke");
    [v6 submitCacheAnalyticsEvent];
    if (!*(_BYTE *)(*(void *)(a1 + 32) + 8LL))
    {
      NSLog( @"%s: purging local store if it size exceeds %lu bytes",  "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke",  *(void *)(a1 + 56));
      [v6 prune3BarsNetworks:*(void *)(a1 + 56) completionHandler:0];
      if (!*(_BYTE *)(*(void *)(a1 + 32) + 8LL))
      {
        NSLog( @"%s: fetching networks predicted based on current location",  "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke");
        [v6 fetch3BarsNetworksPredictedForLocation:*(void *)(a1 + 40) duration:*(void *)(a1 + 72) maxLocations:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
        goto LABEL_9;
      }
    }

    uint64_t v5 = *(void *)(a1 + 48);
    id v2 = v6;
    if (v5)
    {
      v4 = *(void (**)(void))(v5 + 16);
      goto LABEL_8;
    }
  }
}

void sub_100002888(uint64_t a1, void *a2, void *a3, int a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);

    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);
      NSLog( @"%s: fetch for %llu failed, error %@",  "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]_block_invoke",  v10,  v11);
    }

    else
    {
      NSLog( @"%s: fetch for %llu completed",  "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]_block_invoke",  v10);
    }
  }
}

void sub_1000029E8(uint64_t a1)
{
  id v2 = [[WiFi3BarsSource alloc] initWithChangeHandler:0 localStoreType:1];
  NSLog( @"%s: fetching networks based on given location",  "-[TBXPCService fetch3BarsNetworksForLocation:]_block_invoke");
  [v2 fetch3BarsNetworksFor:*(void *)(a1 + 32)];
}

void sub_100002AC8(uint64_t a1)
{
  id v2 = [[WiFi3BarsSource alloc] initWithChangeHandler:0 localStoreType:1];
  [v2 prune3BarsNetworks:*(void *)(a1 + 32) completionHandler:0];
}

void sub_100002BD8(uint64_t a1)
{
  id v2 = [[WiFi3BarsSource alloc] initWithChangeHandler:0 localStoreType:1];
  [v2 forceFetch3BarsNetworkMatchingBSSID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

id objc_msgSend_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetch3BarsNetworksPredictedForLocation:duration:maxLocations:completionHandler:");
}

id objc_msgSend_tileItemDescriptorWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tileItemDescriptorWithKey:");
}