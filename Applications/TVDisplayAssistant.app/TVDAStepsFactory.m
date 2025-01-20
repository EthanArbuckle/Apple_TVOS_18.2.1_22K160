@interface TVDAStepsFactory
+ (id)makeCableCautiousSuccessSteps;
+ (id)makeCableCheckStepsWithModeSwitch:(id)a3;
+ (id)makeCableFailureSteps;
+ (id)makeCableSuccessSteps;
+ (id)makeEARCErrorSteps;
+ (id)makeEARCStepsToEnable:(BOOL)a3;
+ (id)makeEARCUsingARCSteps;
+ (id)makeEARCUsingEARCSteps;
+ (id)makeHDRBuddyRevertSteps;
+ (id)makeHDRBuddyStepsWithModeSwitch:(id)a3;
+ (id)makeInconclusiveCableWarningSteps;
+ (id)makeNetworkFailureSteps;
+ (id)makePoorCableWarningStepsWithDestinationMode:(id)a3;
+ (id)makePostModeSwitchStepsWithModeSwitch:(id)a3;
+ (id)makeRealModeSwitchStepsWithModeSwitch:(id)a3;
+ (id)makeRegionChangeStepsWithModeSwitch:(id)a3;
+ (id)makeUpgradeRevertStepsWithDestinationMode:(id)a3;
+ (id)makeUpgradeRevertStepsWithDestinationMode:(id)a3 noSupportKind:(int64_t)a4;
+ (id)makeUpgradeStepsWithModeSwitch:(id)a3 forQMS:(BOOL)a4;
+ (id)makeVerifyModeStepsWithModeSwitch:(id)a3;
+ (id)makeVirtualModeSwitchStepsWithModeSwitch:(id)a3;
@end

@implementation TVDAStepsFactory

+ (id)makeHDRBuddyStepsWithModeSwitch:(id)a3
{
  id v68 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v66 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v65 = 0LL;
  v8 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v14 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v13 = sub_10001B768(@"InitialHeader", v14, 1, 0, @"Localizable");
  v12 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v11 = sub_10001B768(@"HDRBuddyInitialSubtitle", v12, 1, 0, @"Localizable");
  v10 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v9 = sub_10001B768(@"AppleSupportFooter", v10, 1, 0, @"Localizable");
  v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v8,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v13,  v11,  0LL);
  v4 = v65;
  v65 = v3;

  v15 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v17 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v16 = sub_10001B768(@"HDRBuddyInitialTryButtonTitle", v17, 1, 0, @"Localizable");
  v58[1] = _NSConcreteStackBlock;
  int v59 = -1073741824;
  int v60 = 0;
  v61 = sub_100012F58;
  v62 = &unk_100028FF0;
  id v63 = location[0];
  v64 = -[TVDAStepAction initWithTitle:flow:handler:](v15, "initWithTitle:flow:handler:", v16, 0LL);

  v18 = v64;
  v19 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeIdeal");
  -[TVDAStepAction setMeasurement:](v18, "setMeasurement:");

  -[TVDAUserStep addAction:](v65, "addAction:", v64);
  v21 = v65;
  v20 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v24 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v23 = sub_10001B768(@"NotNowButton", v24, 1, 0, @"Localizable");
  v22 = -[TVDAStepAction initWithTitle:flow:handler:](v20, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v21, "addAction:");

  v25 = v65;
  v26 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeBase");
  -[TVDAUserStep setMeasurement:](v25, "setMeasurement:");

  -[NSMutableArray addObject:](v66, "addObject:", v65);
  v27 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v33 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v32 = sub_10001B768(@"HDRBuddyCanSeeHDR10Header", v33, 1, 0, @"Localizable");
  v31 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v30 = sub_10001B768(@"HDRBuddyCanSeeHDR10Subtitle", v31, 1, 0, @"Localizable");
  v29 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v28 = sub_10001B768(@"AppleSupportFooter", v29, 1, 0, @"Localizable");
  v5 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v27,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v32,  v30,  0LL);
  v6 = v65;
  v65 = v5;

  v35 = v65;
  v34 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v38 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v37 = sub_10001B768(@"OKButtonTitle", v38, 1, 0, @"Localizable");
  v53[1] = _NSConcreteStackBlock;
  int v54 = -1073741824;
  int v55 = 0;
  v56 = sub_100013070;
  v57 = &unk_100028FF0;
  v58[0] = location[0];
  v36 = -[TVDAStepAction initWithTitle:flow:handler:](v34, "initWithTitle:flow:handler:", v37, 5LL);
  -[TVDAUserStep addAction:](v35, "addAction:");

  v39 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v41 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v40 = sub_10001B768(@"CancelButtonTitle", v41, 1, 0, @"Localizable");
  v47 = _NSConcreteStackBlock;
  int v48 = -1073741824;
  int v49 = 0;
  v50 = sub_100013230;
  v51 = &unk_100028FF0;
  id v52 = location[0];
  v53[0] = -[TVDAStepAction initWithTitle:flow:handler:](v39, "initWithTitle:flow:handler:", v40, 1LL);

  [v53[0] setIdleSecondsToTrigger:25.0];
  -[TVDAUserStep addAction:](v65, "addAction:", v53[0]);
  -[TVDAUserStep setPreferredAction:](v65, "setPreferredAction:", v53[0]);
  v42 = v65;
  v43 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeFinal");
  -[TVDAUserStep setMeasurement:](v42, "setMeasurement:");

  -[NSMutableArray addObject:](v66, "addObject:", v65);
  v44 = v66;
  id v45 = [v68 makeHDRBuddyRevertSteps];
  -[NSMutableArray addObjectsFromArray:](v44, "addObjectsFromArray:");

  v46 = v66;
  objc_storeStrong(v53, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(v58, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong((id *)&v66, 0LL);
  objc_storeStrong(location, 0LL);
  return v46;
}

+ (id)makeUpgradeStepsWithModeSwitch:(id)a3 forQMS:(BOOL)a4
{
  id v127 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v125 = a4;
  id v124 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  v123 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v122 = 2LL;
  id v59 = [location[0] source];
  char v120 = 0;
  BOOL v60 = 0;
  if (([v59 isAboveBandwidthThreshold] & 1) == 0)
  {
    id v121 = [location[0] destination];
    char v120 = 1;
    BOOL v60 = ([v121 isAboveBandwidthThreshold] & 1) == 0;
  }

  if ((v120 & 1) != 0) {

  }
  if (v60)
  {
    uint64_t v122 = 0LL;
  }

  else
  {
    id v56 = [location[0] source];
    unsigned __int8 v57 = [v56 isAboveBandwidthThreshold];

    if ((v57 & 1) != 0) {
      uint64_t v122 = 1LL;
    }
  }

  id v55 = [location[0] source];
  char v117 = 0;
  char v115 = 0;
  if ([v55 isAboveBandwidthThreshold])
  {
    id v118 = [v124 fallbackDisplayMode];
    char v117 = 1;
    id v4 = v118;
  }

  else
  {
    id v116 = [location[0] source];
    char v115 = 1;
    id v4 = v116;
  }

  id v119 = v4;
  if ((v115 & 1) != 0) {

  }
  if ((v117 & 1) != 0) {
  v114 = 0LL;
  }
  id v54 = [location[0] destination];
  id v113 = objc_msgSend(v54, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 0);

  char v110 = 0;
  char v108 = 0;
  char v106 = 0;
  char v104 = 0;
  char v102 = 0;
  if (v125)
  {
    v111 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v110 = 1;
    id v109 = sub_10001B768(@"TryUpgradeForQMSTitleFormat", v111, 1, 1, @"Localizable-QMS");
    char v108 = 1;
    v107 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v113);
    char v106 = 1;
    v5 = v107;
  }

  else
  {
    v105 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v104 = 1;
    id v103 = sub_10001B768(@"InitialHeader", v105, 1, 0, @"Localizable");
    char v102 = 1;
    v5 = (NSString *)v103;
  }

  v112 = v5;
  if ((v102 & 1) != 0) {

  }
  if ((v104 & 1) != 0) {
  if ((v106 & 1) != 0)
  }

  if ((v108 & 1) != 0) {
  if ((v110 & 1) != 0)
  }

  char v99 = 0;
  char v97 = 0;
  char v95 = 0;
  char v93 = 0;
  if (v125)
  {
    v100 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v99 = 1;
    id v98 = sub_10001B768(@"TryUpgradeForQMSSubtitleFormat", v100, 1, 1, @"Localizable-QMS");
    char v97 = 1;
    id v53 = v98;
  }

  else
  {
    id v96 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v95 = 1;
    id v94 = sub_10001B768(@"TryUpgradeInitialSubtitleFormat", v96, 1, 0, @"Localizable");
    char v93 = 1;
    id v53 = v94;
  }

  v101 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v53, v113);
  if ((v93 & 1) != 0) {

  }
  if ((v95 & 1) != 0) {
  if ((v97 & 1) != 0)
  }

  if ((v99 & 1) != 0) {
  id v52 = [location[0] destination];
  }
  char v90 = 0;
  char v88 = 0;
  char v86 = 0;
  char v84 = 0;
  if (PBSDynamicRangeIsDolbyVision([v52 dynamicRange]))
  {
    id v91 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v90 = 1;
    id v89 = sub_10001B768(@"TryUpgradeDolbyInitialTryButtonTitle", v91, 1, 0, @"Localizable");
    char v88 = 1;
    id v6 = v89;
  }

  else
  {
    id v87 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v86 = 1;
    id v85 = sub_10001B768(@"TryUpgradeInitialTryButtonTitle", v87, 1, 0, @"Localizable");
    char v84 = 1;
    id v6 = v85;
  }

  id v92 = v6;
  if ((v84 & 1) != 0) {

  }
  if ((v86 & 1) != 0) {
  if ((v88 & 1) != 0)
  }

  if ((v90 & 1) != 0) {
  v14 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  }
  v12 = v112;
  id v13 = v101;
  id v16 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v15 = sub_10001B768(@"AppleSupportFooter", v16, 1, 0, @"Localizable");
  v7 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v14,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v12,  v13);
  v8 = v114;
  v114 = v7;

  v18 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v17 = v92;
  v77 = _NSConcreteStackBlock;
  int v78 = -1073741824;
  int v79 = 0;
  v80 = sub_1000144D4;
  v81 = &unk_100028FF0;
  id v82 = location[0];
  v83 = -[TVDAStepAction initWithTitle:flow:handler:](v18, "initWithTitle:flow:handler:", v17, 0LL, &v77);
  v19 = v83;
  v20 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeIdeal");
  -[TVDAStepAction setMeasurement:](v19, "setMeasurement:");

  -[TVDAUserStep addAction:](v114, "addAction:", v83);
  v22 = v114;
  v21 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v25 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v24 = sub_10001B768(@"NotNowButton", v25, 1, 0, @"Localizable");
  id v23 = -[TVDAStepAction initWithTitle:flow:handler:](v21, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v22, "addAction:");

  v26 = v114;
  v27 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeBase");
  -[TVDAUserStep setMeasurement:](v26, "setMeasurement:");

  -[NSMutableArray addObject:](v123, "addObject:", v114);
  id v28 = [location[0] destination];
  id v76 = objc_msgSend(v28, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 1);

  id v30 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v29 = sub_10001B768(@"TryUpgradeCanSeeHeaderFormat", v30, 1, 0, @"Localizable");
  v75 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v76);

  id v32 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v31 = v75;
  v36 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v35 = sub_10001B768(@"TryUpgradeCanSeeSubtitle", v36, 1, 0, @"Localizable");
  v34 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v33 = sub_10001B768(@"AppleSupportFooter", v34, 1, 0, @"Localizable");
  id v9 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v32,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v31,  v35,  0LL);
  v10 = v114;
  v114 = v9;

  v38 = v114;
  id v37 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v41 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v40 = sub_10001B768(@"OKButtonTitle", v41, 1, 0, @"Localizable");
  v69 = _NSConcreteStackBlock;
  int v70 = -1073741824;
  int v71 = 0;
  v72 = sub_1000145EC;
  v73 = &unk_100028FF0;
  id v74 = location[0];
  v39 = -[TVDAStepAction initWithTitle:flow:handler:](v37, "initWithTitle:flow:handler:", v40, 5LL, &v69);
  -[TVDAUserStep addAction:](v38, "addAction:");

  v42 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v44 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v43 = sub_10001B768(@"CancelButtonTitle", v44, 1, 0, @"Localizable");
  v61 = _NSConcreteStackBlock;
  int v62 = -1073741824;
  int v63 = 0;
  v64 = sub_10001487C;
  v65 = &unk_100029080;
  id v66 = v119;
  id v67 = location[0];
  id v68 = -[TVDAStepAction initWithTitle:flow:handler:](v42, "initWithTitle:flow:handler:", v43, 1LL, &v61);

  -[TVDAStepAction setIdleSecondsToTrigger:](v68, "setIdleSecondsToTrigger:", 25.0);
  -[TVDAUserStep addAction:](v114, "addAction:", v68);
  -[TVDAUserStep setPreferredAction:](v114, "setPreferredAction:", v68);
  id v45 = v114;
  v46 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeFinal");
  -[TVDAUserStep setMeasurement:](v45, "setMeasurement:");

  -[NSMutableArray addObject:](v123, "addObject:", v114);
  int v48 = v123;
  v47 = v127;
  id v50 = [location[0] destination];
  id v49 = objc_msgSend(v47, "makeUpgradeRevertStepsWithDestinationMode:noSupportKind:");
  -[NSMutableArray addObjectsFromArray:](v48, "addObjectsFromArray:");

  v51 = v123;
  objc_storeStrong((id *)&v68, 0LL);
  objc_storeStrong(&v67, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong((id *)&v75, 0LL);
  objc_storeStrong(&v76, 0LL);
  objc_storeStrong((id *)&v83, 0LL);
  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v92, 0LL);
  objc_storeStrong((id *)&v101, 0LL);
  objc_storeStrong((id *)&v112, 0LL);
  objc_storeStrong(&v113, 0LL);
  objc_storeStrong((id *)&v114, 0LL);
  objc_storeStrong(&v119, 0LL);
  objc_storeStrong((id *)&v123, 0LL);
  objc_storeStrong(&v124, 0LL);
  objc_storeStrong(location, 0LL);
  return v51;
}

+ (id)makeCableCheckStepsWithModeSwitch:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v47 = 0LL;
  id v6 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v12 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v11 = sub_10001B768(@"CableCheckInitialHeader", v12, 1, 0, @"Localizable");
  v10 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v9 = sub_10001B768(@"CableCheckInitialSubtitle", v10, 1, 0, @"Localizable");
  v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v7 = sub_10001B768(@"AppleSupportFooter", v8, 1, 0, @"Localizable");
  v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v6,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v11,  v9,  0LL);
  id v4 = v47;
  v47 = v3;

  id v13 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v15 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v14 = sub_10001B768(@"CableCheckInitialTryButtonTitle", v15, 1, 0, @"Localizable");
  id v40 = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  id v43 = sub_1000150B4;
  v44 = &unk_100028FF0;
  id v45 = location[0];
  v46 = -[TVDAStepAction initWithTitle:flow:handler:](v13, "initWithTitle:flow:handler:", v14);

  id v16 = v46;
  id v17 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeIdeal");
  -[TVDAStepAction setMeasurement:](v16, "setMeasurement:");

  -[TVDAUserStep addAction:](v47, "addAction:", v46);
  v19 = v47;
  v18 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v22 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v21 = sub_10001B768(@"CancelButtonTitle", v22, 1, 0, @"Localizable");
  v20 = -[TVDAStepAction initWithTitle:flow:handler:](v18, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v19, "addAction:");

  id v23 = v47;
  id v24 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeBase");
  -[TVDAUserStep setMeasurement:](v23, "setMeasurement:");

  -[NSMutableArray addObject:](v48, "addObject:", v47);
  double v39 = PBSCableMinimumCheckInterval + 5.0;
  v26 = objc_alloc(&OBJC_CLASS___TVDALoadingStep);
  id v28 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v27 = sub_10001B768(@"CableCheckLoadingTitle", v28, 1, 0, @"Localizable");
  double v25 = v39;
  id v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  id v35 = sub_1000151B4;
  v36 = &unk_100028FF0;
  id v37 = location[0];
  v38 = -[TVDALoadingStep initWithTitle:loadingDuration:actionHandler:]( v26,  "initWithTitle:loadingDuration:actionHandler:",  v27,  v25);

  -[TVDALoadingStep setMenuBehavior:](v38, "setMenuBehavior:", 0LL);
  -[TVDALoadingStep setShouldDisableIdleTimer:](v38, "setShouldDisableIdleTimer:", 1LL);
  id v29 = v38;
  id v30 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( objc_alloc(&OBJC_CLASS___TVDAWiFiQualityMeasurement),  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeFinal");
  -[TVDALoadingStep setMeasurement:](v29, "setMeasurement:");

  -[NSMutableArray addObject:](v48, "addObject:", v38);
  v31 = v48;
  objc_storeStrong((id *)&v38, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong((id *)&v46, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v47, 0LL);
  objc_storeStrong((id *)&v48, 0LL);
  objc_storeStrong(location, 0LL);
  return v31;
}

+ (id)makeVerifyModeStepsWithModeSwitch:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v25 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v24 = sub_10001B768(@"VerifyModeSwitchInitialHeaderFormat", v25, 1, 0, @"Localizable");
  id v23 = [location[0] destination];
  id v22 = objc_msgSend(v23, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 1);
  id v74 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v24, v22);

  v26 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v28 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v27 = sub_10001B768(@"VerifyModeSwitchInitialSubtitle", v28, 1, 0, @"Localizable");
  v75 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v26,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v74);

  id v30 = v75;
  id v29 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  int v33 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v32 = sub_10001B768(@"OKButtonTitle", v33, 1, 0, @"Localizable");
  id v68 = _NSConcreteStackBlock;
  int v69 = -1073741824;
  int v70 = 0;
  int v71 = sub_100015DD0;
  v72 = &unk_100028FF0;
  id v73 = location[0];
  v31 = -[TVDAStepAction initWithTitle:flow:handler:](v29, "initWithTitle:flow:handler:", v32, 0LL, &v68);
  -[TVDAUserStep addAction:](v30, "addAction:");

  id v35 = v75;
  int v34 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v38 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v37 = sub_10001B768(@"CancelButtonTitle", v38, 1, 0, @"Localizable");
  v36 = -[TVDAStepAction initWithTitle:flow:handler:](v34, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v35, "addAction:");

  -[NSMutableArray addObject:](v76, "addObject:", v75);
  double v39 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v46 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v45 = sub_10001B768(@"PostVerifyModeSwitchCanSeeHeaderFormat", v46, 1, 0, @"Localizable");
  id v44 = [location[0] destination];
  id v43 = objc_msgSend(v44, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 1);
  int v42 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v45, v43);
  int v41 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v40 = sub_10001B768(@"PostVerifyModeSwitchCanSeeSubtitle", v41, 1, 0, @"Localizable");
  v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v39,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v42);
  id v4 = v75;
  v75 = v3;

  int v48 = v75;
  v47 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v51 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v50 = sub_10001B768(@"OKButtonTitle", v51, 1, 0, @"Localizable");
  int v62 = _NSConcreteStackBlock;
  int v63 = -1073741824;
  int v64 = 0;
  v65 = sub_100015E60;
  id v66 = &unk_100028FF0;
  id v67 = location[0];
  id v49 = -[TVDAStepAction initWithTitle:flow:handler:](v47, "initWithTitle:flow:handler:", v50, 5LL, &v62);
  -[TVDAUserStep addAction:](v48, "addAction:");

  id v52 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v54 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v53 = sub_10001B768(@"CancelButtonTitle", v54, 1, 0, @"Localizable");
  id v55 = _NSConcreteStackBlock;
  int v56 = -1073741824;
  int v57 = 0;
  v58 = sub_100016228;
  id v59 = &unk_100028FF0;
  id v60 = location[0];
  id v61 = -[TVDAStepAction initWithTitle:flow:handler:](v52, "initWithTitle:flow:handler:", v53, 1LL, &v55);

  [v61 setIdleSecondsToTrigger:25.0];
  -[TVDAUserStep addAction:](v75, "addAction:", v61);
  -[TVDAUserStep setPreferredAction:](v75, "setPreferredAction:", v61);
  -[NSMutableArray addObject:](v76, "addObject:", v75);
  v8 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v15 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v14 = sub_10001B768(@"VerifyModeSwitchNoSupportPreviousHeader", v15, 1, 0, @"Localizable");
  id v13 = [location[0] destination];
  id v12 = objc_msgSend(v13, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 1);
  id v11 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v14, v12);
  v10 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v9 = sub_10001B768(@"VerifyModeSwitchNoSupportPreviousSubtitle", v10, 1, 0, @"Localizable");
  v5 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v8,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v11);
  id v6 = v75;
  v75 = v5;

  id v17 = v75;
  id v16 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v20 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v19 = sub_10001B768(@"OKButtonTitle", v20, 1, 0, @"Localizable");
  v18 = -[TVDAStepAction initWithTitle:flow:handler:](v16, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v17, "addAction:");

  -[TVDAUserStep setMenuBehavior:](v75, "setMenuBehavior:", 1LL);
  -[NSMutableArray addObject:](v76, "addObject:", v75);
  id v21 = v76;
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v67, 0LL);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong((id *)&v75, 0LL);
  objc_storeStrong((id *)&v76, 0LL);
  objc_storeStrong(location, 0LL);
  return v21;
}

+ (id)makeVirtualModeSwitchStepsWithModeSwitch:(id)a3
{
  id v33 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v30 = 0LL;
  id v6 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v10 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v9 = sub_10001B768(@"VirtualModeSwitchInitialHeader", v10, 1, 0, @"Localizable");
  v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v7 = sub_10001B768(@"VirtualModeSwitchInitialSubtitle", v8, 1, 0, @"Localizable");
  v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v6,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v9);
  id v4 = v30;
  id v30 = v3;

  id v12 = v30;
  id v11 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v15 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v14 = sub_10001B768(@"VirtualModeSwitchInitialTryButtonTitle", v15, 1, 0, @"Localizable");
  id v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  id v27 = sub_10001667C;
  id v28 = &unk_100028FF0;
  id v29 = location[0];
  id v13 = -[TVDAStepAction initWithTitle:flow:handler:](v11, "initWithTitle:flow:handler:", v14, 0LL);
  -[TVDAUserStep addAction:](v12, "addAction:");

  id v17 = v30;
  id v16 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  v20 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v19 = sub_10001B768(@"NotNowButton", v20, 1, 0, @"Localizable");
  v18 = -[TVDAStepAction initWithTitle:flow:handler:](v16, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v17, "addAction:");

  -[NSMutableArray addObject:](v31, "addObject:", v30);
  id v21 = v31;
  id v22 = [v33 makePostModeSwitchStepsWithModeSwitch:location[0]];
  -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:");

  id v23 = v31;
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong(location, 0LL);
  return v23;
}

+ (id)makeRealModeSwitchStepsWithModeSwitch:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [v6 makePostModeSwitchStepsWithModeSwitch:location[0]];
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)makePostModeSwitchStepsWithModeSwitch:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v24 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v23 = sub_10001B768(@"PostModeSwitchCanSeeHeaderFormat", v24, 1, 0, @"Localizable");
  id v22 = [location[0] destination];
  id v21 = objc_msgSend(v22, "tvda_localizedStringForChange:detailedFormat:", objc_msgSend(location[0], "change"), 1);
  v20 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v23, v21);
  id v19 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v18 = sub_10001B768(@"PostModeSwitchCanSeeSubtitle", v19, 1, 0, @"Localizable");
  v46 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v17,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v20);

  int v26 = v46;
  int v25 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v29 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v28 = sub_10001B768(@"OKButtonTitle", v29, 1, 0, @"Localizable");
  id v40 = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  id v43 = sub_100016E18;
  id v44 = &unk_100028FF0;
  id v45 = location[0];
  id v27 = -[TVDAStepAction initWithTitle:flow:handler:](v25, "initWithTitle:flow:handler:", v28, 5LL, &v40);
  -[TVDAUserStep addAction:](v26, "addAction:");

  id v30 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v32 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v31 = sub_10001B768(@"CancelButtonTitle", v32, 1, 0, @"Localizable");
  id v33 = _NSConcreteStackBlock;
  int v34 = -1073741824;
  int v35 = 0;
  v36 = sub_100016FD8;
  id v37 = &unk_100028FF0;
  id v38 = location[0];
  id v39 = -[TVDAStepAction initWithTitle:flow:handler:](v30, "initWithTitle:flow:handler:", v31, 1LL, &v33);

  [v39 setIdleSecondsToTrigger:25.0];
  -[TVDAUserStep addAction:](v46, "addAction:", v39);
  -[TVDAUserStep setPreferredAction:](v46, "setPreferredAction:", v39);
  -[NSMutableArray addObject:](v47, "addObject:", v46);
  id v6 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  v10 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v9 = sub_10001B768(@"TryUpgradeNoSupportPreviousHeader", v10, 1, 0, @"Localizable");
  v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v7 = sub_10001B768(@"PostModeSwitchRevertSubtitle", v8, 1, 0, @"Localizable");
  v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v6,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v9);
  id v4 = v46;
  v46 = v3;

  id v12 = v46;
  id v11 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v15 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v14 = sub_10001B768(@"OKButtonTitle", v15, 1, 0, @"Localizable");
  id v13 = -[TVDAStepAction initWithTitle:flow:handler:](v11, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v12, "addAction:");

  -[TVDAUserStep setMenuBehavior:](v46, "setMenuBehavior:", 1LL);
  -[NSMutableArray addObject:](v47, "addObject:", v46);
  id v16 = v47;
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v46, 0LL);
  objc_storeStrong((id *)&v47, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

+ (id)makeHDRBuddyRevertSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v8 = sub_10001B768(@"HDRBuddyNoSupportHeader", v9, 1, 0, @"Localizable");
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"HDRBuddyNoSupportSubtitle", v7, 1, 0, @"Localizable");
  v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v4 = sub_10001B768(@"AppleSupportFooter", v5, 1, 0, @"Localizable");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeUpgradeRevertStepsWithDestinationMode:(id)a3 noSupportKind:(int64_t)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v41[1] = (id)a4;
  v41[0] = 0LL;
  id v40 = 0LL;
  if (a4)
  {
    if (a4 == 1)
    {
      id v32 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v8 = sub_10001B768(@"TryUpgradeNoSupportCompatibleHeader", v32, 1, 0, @"Localizable");
      id v9 = v41[0];
      v41[0] = v8;

      int v35 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
      id v34 = sub_10001B768(@"TryUpgradeNoSupportSubtitleFormat", v35, 1, 0, @"Localizable");
      id v33 = objc_msgSend(location[0], "tvda_localizedStringForChange:detailedFormat:", 0, 0);
      v10 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v34, v33);
      id v11 = v40;
      id v40 = v10;
    }

    else if (a4 == 2)
    {
      id v28 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v12 = sub_10001B768(@"TryUpgradeNoSupportPreviousHeader", v28, 1, 0, @"Localizable");
      id v13 = v41[0];
      v41[0] = v12;

      id v31 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
      id v30 = sub_10001B768(@"TryUpgradeNoSupportSubtitleFormat", v31, 1, 0, @"Localizable");
      id v29 = objc_msgSend(location[0], "tvda_localizedStringForChange:detailedFormat:", 0, 0);
      id v14 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v30, v29);
      id v15 = v40;
      id v40 = v14;
    }
  }

  else
  {
    v36 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
    id v4 = sub_10001B768(@"CableCheckNoSupportSameModeHeader", v36, 1, 0, @"Localizable");
    id v5 = v41[0];
    v41[0] = v4;

    id v37 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    id v6 = (NSString *)sub_10001B768(@"CableCheckNoSupportSameModeSubtitle", v37, 1, 0, @"Localizable");
    id v7 = v40;
    id v40 = v6;
  }

  id v19 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v17 = v41[0];
  id v18 = v40;
  id v21 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v20 = sub_10001B768(@"AppleSupportFooter", v21, 1, 0, @"Localizable");
  id v39 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v19,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v17,  v18);

  id v23 = v39;
  id v22 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  int v26 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v25 = sub_10001B768(@"OKButtonTitle", v26, 1, 0, @"Localizable");
  id v24 = -[TVDAStepAction initWithTitle:flow:handler:](v22, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v23, "addAction:");

  -[TVDAUserStep setMenuBehavior:](v39, "setMenuBehavior:");
  id v43 = v39;
  id v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL);
  objc_storeStrong((id *)&v39, 0LL);
  objc_storeStrong((id *)&v40, 0LL);
  objc_storeStrong(v41, 0LL);
  objc_storeStrong(location, 0LL);
  return v27;
}

+ (id)makeUpgradeRevertStepsWithDestinationMode:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [v6 makeUpgradeRevertStepsWithDestinationMode:location[0] noSupportKind:2];
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)makeCableSuccessSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v8 = sub_10001B768(@"YouGotGoodCableHeader", v9, 1, 0, @"Localizable");
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"YouGotGoodCableSubtitle", v7, 1, 0, @"Localizable");
  id v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v4 = sub_10001B768(@"AppleSupportFooter", v5, 1, 0, @"Localizable");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeCableCautiousSuccessSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v8 = sub_10001B768(@"MaybeYouGotGoodCableHeader", v9, 1, 0, @"Localizable");
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"MaybeYouGotGoodCableSubtitle", v7, 1, 0, @"Localizable");
  id v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v4 = sub_10001B768(@"AppleSupportFooter", v5, 1, 0, @"Localizable");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeNetworkFailureSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v8 = sub_10001B768(@"NetworkNo4KForYouHeader", v9, 1, 0, @"Localizable");
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"NetworkNo4KForYouSubtitle", v7, 1, 0, @"Localizable");
  id v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v4 = sub_10001B768(@"AppleSupportFooter", v5, 1, 0, @"Localizable");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeCableFailureSteps
{
  id v30 = a1;
  SEL v29 = a2;
  id v2 = +[TVSEthernetInterface RJ45EthernetInterface](&OBJC_CLASS___TVSEthernetInterface, "RJ45EthernetInterface");
  BOOL v17 = v2 != 0LL;

  BOOL v28 = v17;
  char v25 = 0;
  char v23 = 0;
  char v21 = 0;
  char v19 = 0;
  if (v17)
  {
    int v26 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v25 = 1;
    id v24 = sub_10001B768(@"CableNo4KForYouSubtitle_WIFI", v26, 1, 1, @"Localizable");
    char v23 = 1;
    id v3 = v24;
  }

  else
  {
    id v22 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    char v21 = 1;
    id v20 = sub_10001B768(@"CableNo4KForYouNoEnetSubtitle_WIFI", v22, 1, 1, @"Localizable-J255");
    char v19 = 1;
    id v3 = v20;
  }

  id v27 = v3;
  if ((v19 & 1) != 0) {

  }
  if ((v21 & 1) != 0) {
  if ((v23 & 1) != 0)
  }

  if ((v25 & 1) != 0) {
  id v6 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  }
  v10 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v9 = sub_10001B768(@"CableNo4KForYouHeader", v10, 1, 0, @"Localizable");
  id v5 = v27;
  id v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v7 = sub_10001B768(@"AppleSupportFooter", v8, 1, 0, @"Localizable");
  id v18 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v6,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v9,  v5);

  id v12 = v18;
  id v11 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v15 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v14 = sub_10001B768(@"OKButtonTitle", v15, 1, 0, @"Localizable");
  id v13 = -[TVDAStepAction initWithTitle:flow:handler:](v11, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v12, "addAction:");

  -[TVDAUserStep setMenuBehavior:](v18, "setMenuBehavior:");
  id v31 = v18;
  id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v27, 0LL);
  return v16;
}

+ (id)makeRegionChangeStepsWithModeSwitch:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v10 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
  int v64 = -[NSLocale countryCode](v10, "countryCode");

  id v11 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
  int v63 = -[NSLocale displayNameForKey:value:](v11, "displayNameForKey:value:", NSLocaleCountryCode, v64);

  int v62 = 0LL;
  id v12 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  BOOL v17 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v16 = sub_10001B768(@"RegionModeSwitchInitialHeader", v17, 1, 0, @"Localizable");
  id v15 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v63);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"RegionModeSwitchInitialSubtitle", v14, 1, 0, @"Localizable");
  id v3 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v12,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v15);
  id v4 = v62;
  int v62 = v3;

  char v19 = v62;
  id v18 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v22 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v21 = sub_10001B768(@"RegionModeSwitchInitialTryButtonTitle", v22, 1, 0, @"Localizable");
  v56[1] = _NSConcreteStackBlock;
  int v57 = -1073741824;
  int v58 = 0;
  id v59 = sub_100019014;
  id v60 = &unk_100028FF0;
  id v61 = location[0];
  id v20 = -[TVDAStepAction initWithTitle:flow:handler:](v18, "initWithTitle:flow:handler:", v21, 0LL);
  -[TVDAUserStep addAction:](v19, "addAction:");

  id v24 = v62;
  char v23 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v27 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v26 = sub_10001B768(@"RegionModeSwitchInitialCancelButtonTitle", v27, 1, 0, @"Localizable");
  char v25 = -[TVDAStepAction initWithTitle:flow:handler:](v23, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v24, "addAction:");

  -[NSMutableArray addObject:](v65, "addObject:", v62);
  BOOL v28 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v32 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v31 = sub_10001B768(@"RegionModeSwitchCanSeeHeader", v32, 1, 0, @"Localizable");
  id v30 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v29 = sub_10001B768(@"RegionModeSwitchCanSeeSubtitle", v30, 1, 0, @"Localizable");
  id v5 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v28,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v31);
  id v6 = v62;
  int v62 = v5;

  id v34 = v62;
  id v33 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v37 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v36 = sub_10001B768(@"RegionModeSwitchAffirmativeResponse", v37, 1, 0, @"Localizable");
  v51[1] = _NSConcreteStackBlock;
  int v52 = -1073741824;
  int v53 = 0;
  id v54 = sub_1000190A4;
  id v55 = &unk_100028FF0;
  v56[0] = location[0];
  int v35 = -[TVDAStepAction initWithTitle:flow:handler:](v33, "initWithTitle:flow:handler:", v36, 5LL);
  -[TVDAUserStep addAction:](v34, "addAction:");

  id v38 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v40 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v39 = sub_10001B768(@"RegionModeSwitchNegativeResponse", v40, 1, 0, @"Localizable");
  id v50 = location[0];
  v51[0] = -[TVDAStepAction initWithTitle:flow:handler:](v38, "initWithTitle:flow:handler:", v39);

  [v51[0] setIdleSecondsToTrigger:25.0];
  -[TVDAUserStep addAction:](v62, "addAction:", v51[0]);
  -[TVDAUserStep setPreferredAction:](v62, "setPreferredAction:", v51[0]);
  -[NSMutableArray addObject:](v65, "addObject:", v62);
  int v41 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v43 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v42 = sub_10001B768(@"RegionModeSwitchNoSupportPreviousHeader", v43, 1, 0, @"Localizable");
  id v7 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v41,  "initWithTitle:subtitle:footer:appleSupportFooter:");
  id v8 = v62;
  int v62 = v7;

  id v45 = v62;
  id v44 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  int v48 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v47 = sub_10001B768(@"OKButtonTitle", v48, 1, 0, @"Localizable");
  v46 = -[TVDAStepAction initWithTitle:flow:handler:](v44, "initWithTitle:flow:handler:");
  -[TVDAUserStep addAction:](v45, "addAction:");

  -[TVDAUserStep setMenuBehavior:](v62, "setMenuBehavior:", 1LL);
  -[NSMutableArray addObject:](v65, "addObject:", v62);
  id v49 = v65;
  objc_storeStrong(v51, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(v56, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong(location, 0LL);
  return v49;
}

+ (id)makePoorCableWarningStepsWithDestinationMode:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = objc_msgSend(location[0], "tvda_localizedStringForChange:detailedFormat:", 3, 0);
  id v27 = 0LL;
  id v3 = [location[0] resolution];
  v26[1] = (id)v4.n128_u64[0];
  v26[2] = (id)v5.n128_u64[0];
  if ((PBSDisplayResolutionIs4K(v3, v4, v5) & 1) != 0)
  {
    char v25 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    id v6 = (NSString *)sub_10001B768(@"PoorCable4KSubtitle", v25, 1, 0, @"Localizable");
    id v7 = v27;
    id v27 = v6;
  }

  else
  {
    id v24 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    id v23 = sub_10001B768(@"PoorCableSubtitleFormat", v24, 1, 0, @"Localizable");
    id v8 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v28);
    id v9 = v27;
    id v27 = v8;
  }

  id v12 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v16 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v15 = sub_10001B768(@"PoorCableHeader", v16, 1, 0, @"Localizable");
  id v11 = v27;
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"AppleSupportFooter", v14, 1, 0, @"Localizable");
  v26[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v12,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v15,  v11);

  id v18 = v26[0];
  BOOL v17 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v21 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v20 = sub_10001B768(@"OKButtonTitle", v21, 1, 0, @"Localizable");
  char v19 = -[TVDAStepAction initWithTitle:flow:handler:](v17, "initWithTitle:flow:handler:");
  objc_msgSend(v18, "addAction:");

  objc_msgSend(v26[0], "setMenuBehavior:");
  id v30 = v26[0];
  id v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL);
  objc_storeStrong(v26, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
  return v22;
}

+ (id)makeInconclusiveCableWarningSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
  id v8 = sub_10001B768(@"InconclusiveCableHeader", v9, 1, 0, @"Localizable");
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"InconclusiveCableSubtitle", v7, 1, 0, @"Localizable");
  __n128 v5 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v4 = sub_10001B768(@"AppleSupportFooter", v5, 1, 0, @"Localizable");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeEARCStepsToEnable:(BOOL)a3
{
  id v29 = a1;
  SEL v28 = a2;
  BOOL v27 = a3;
  id v16 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  if (v27)
  {
    char v25 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    char v24 = 1;
    id v23 = sub_10001B768(@"eARCTurnOnInitialHeader", v25, 1, 0, @"Localizable-J305");
    char v22 = 1;
    id v15 = v23;
  }

  else
  {
    id v21 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    char v20 = 1;
    id v19 = sub_10001B768(@"eARCTurnOffInitialHeader", v21, 1, 0, @"Localizable-J305");
    char v18 = 1;
    id v15 = v19;
  }

  id v14 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v13 = sub_10001B768(@"eARCToggleInitialSubtitle", v14, 1, 0, @"Localizable-J305");
  id v12 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v11 = sub_10001B768(@"eARCAppleSupportFooter", v12, 1, 0, @"Localizable-J305");
  id v26 = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v16,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v15,  v13,  0LL);

  if ((v18 & 1) != 0) {
  if ((v20 & 1) != 0)
  }

  if ((v22 & 1) != 0) {
  if ((v24 & 1) != 0)
  }

  __n128 v5 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v7 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v6 = sub_10001B768(@"OKButtonTitle", v7, 1, 0, @"Localizable");
  id v17 = -[TVDAStepAction initWithTitle:flow:handler:](v5, "initWithTitle:flow:handler:");

  id v8 = v17;
  id v3 = objc_alloc(&OBJC_CLASS___TVDAToggleEARCMeasurement);
  id v9 = -[TVDAToggleEARCMeasurement initWithEARCEnableIntention:](v3, "initWithEARCEnableIntention:", v27);
  -[TVDAStepAction setMeasurement:](v8, "setMeasurement:");

  -[TVDAUserStep addAction:](v26, "addAction:", v17);
  id v30 = v26;
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  return v10;
}

+ (id)makeEARCErrorSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v8 = sub_10001B768(@"eARCToggleFailedHeader", v9, 1, 0, @"Localizable-J305");
  id v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v6 = sub_10001B768(@"eARCToggleFailedSubtitle", v7, 1, 0, @"Localizable-J305");
  __n128 v5 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = sub_10001B768(@"eARCAppleSupportFooter", v5, 1, 0, @"Localizable-J305");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeEARCUsingARCSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v8 = sub_10001B768(@"eARCToggleConnectedARCHeader", v9, 1, 0, @"Localizable-J305");
  id v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v6 = sub_10001B768(@"eARCToggleConnectedARCSubtitle", v7, 1, 0, @"Localizable-J305");
  __n128 v5 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = sub_10001B768(@"eARCAppleSupportFooter", v5, 1, 0, @"Localizable-J305");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

+ (id)makeEARCUsingEARCSteps
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v3 = objc_alloc(&OBJC_CLASS___TVDAUserStep);
  id v9 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v8 = sub_10001B768(@"eARCToggleConnectedEARCHeader", v9, 1, 0, @"Localizable-J305");
  id v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v6 = sub_10001B768(@"eARCToggleConnectedEARCSubtitle", v7, 1, 0, @"Localizable-J305");
  __n128 v5 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = sub_10001B768(@"eARCAppleSupportFooter", v5, 1, 0, @"Localizable-J305");
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( v3,  "initWithTitle:subtitle:footer:appleSupportFooter:",  v8,  v6);

  id v11 = v16[0];
  v10 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v14 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
  id v13 = sub_10001B768(@"OKButtonTitle", v14, 1, 0, @"Localizable");
  id v12 = -[TVDAStepAction initWithTitle:flow:handler:](v10, "initWithTitle:flow:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(v16[0], "setMenuBehavior:");
  id v17 = v16[0];
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
  objc_storeStrong(v16, 0LL);
  return v15;
}

@end