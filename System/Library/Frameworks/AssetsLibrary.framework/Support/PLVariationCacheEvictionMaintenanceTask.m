@interface PLVariationCacheEvictionMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLVariationCacheEvictionMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryBundle](self, "libraryBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 variationCache]);

  [v4 evictIfNeeded];
  return 1;
}

@end