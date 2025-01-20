@interface PBSMigrator
+ (void)pb_registerMigrations;
@end

@implementation PBSMigrator

+ (void)pb_registerMigrations
{
  id v2 = [[PBSMigration alloc] initWithName:@"TV-App Developer Settings" handler:&stru_1003D7BC8];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v2);
  id v3 = [[PBSMigration alloc] initWithName:@"Auto App Updates" handler:&stru_1003D7BE8];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v3);
  id v4 = [[PBSMigration alloc] initWithName:@"Reset Restrictions" handler:&stru_1003D7C08];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v4);
  id v5 = [[PBSMigration alloc] initWithName:@"HomeSharing Settings" handler:&stru_1003D7C28];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v5);
  id v6 = [[PBSMigration alloc] initWithName:@"TVIdleScreen Assets" handler:&stru_1003D7C48];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v6);
  id v7 = [[PBSMigration alloc] initWithName:@"Siri Settings" handler:&stru_1003D7C90];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v7);
  id v8 = [[PBSMigration alloc] initWithName:@"Multilingual Keyboards" handler:&stru_1003D7CB0];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v8);
  id v9 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(PBSAirPlaySettings)];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v9);
  id v10 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(PBSConferenceRoomDisplaySettings)];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v10);
  id v11 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(PBSnapshotService)];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v11);
  id v12 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(PBDisplayManager)];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v12);
  id v13 = [[PBSMigration alloc] initWithHandlingClass:objc_opt_class(PBOSSoftwareUpdateMonitor)];

  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v13);
}

@end