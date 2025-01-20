@interface PBSMigrator
+ (void)tvset_registerMigrations;
@end

@implementation PBSMigrator

+ (void)tvset_registerMigrations
{
  id v3 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(TVIdleScreenLocationMigration)];
  [a1 registerMigration:v3];
}

@end