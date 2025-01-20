@interface DTTVNLCInfoViewController
- (BOOL)isCustom;
- (BOOL)isNew;
- (DTTVNLCInfoViewController)initWithProfileStore:(id)a3 profileName:(id)a4;
- (DTTVNLCProfileStore)profileStore;
- (NSMutableDictionary)profileDictionary;
- (NSMutableDictionary)profileNameDictionary;
- (NSNumberFormatter)delayFmtr;
- (NSNumberFormatter)downBwFmtr;
- (NSNumberFormatter)plrFmtr;
- (NSNumberFormatter)upBwFmtr;
- (NSString)originalProfileName;
- (NSString)profileName;
- (TSKSettingItem)nameItem;
- (id)_emptyProfile;
- (id)_newNameForProfile;
- (id)_viewControllersUnderViewController:(id)a3;
- (id)interfaceFormatter;
- (id)loadSettingGroups;
- (id)protocolFormatter;
- (void)_applyChangesToProfile:(id)a3;
- (void)_exitSavingChanges:(BOOL)a3;
- (void)_handleMenuButton;
- (void)deleteProfile;
- (void)duplicateProfile;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setCustom:(BOOL)a3;
- (void)setDelayFmtr:(id)a3;
- (void)setDownBwFmtr:(id)a3;
- (void)setNameItem:(id)a3;
- (void)setNew:(BOOL)a3;
- (void)setOriginalProfileName:(id)a3;
- (void)setPlrFmtr:(id)a3;
- (void)setProfileDictionary:(id)a3;
- (void)setProfileNameDictionary:(id)a3;
- (void)setUpBwFmtr:(id)a3;
- (void)viewDidLoad;
@end

@implementation DTTVNLCInfoViewController

- (DTTVNLCInfoViewController)initWithProfileStore:(id)a3 profileName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___DTTVNLCInfoViewController;
  v9 = -[DTTVNLCInfoViewController initWithStyle:](&v50, "initWithStyle:", 0LL);
  v10 = v9;
  if (v9)
  {
    p_profileStore = (id *)&v9->_profileStore;
    objc_storeStrong((id *)&v9->_profileStore, a3);
    v12 = (NSString *)[v8 copy];
    originalProfileName = v10->_originalProfileName;
    v10->_originalProfileName = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    profileNameDictionary = v10->_profileNameDictionary;
    v10->_profileNameDictionary = v14;

    v16 = v10->_profileNameDictionary;
    id v17 = [v8 copy];
    -[NSMutableDictionary setValue:forKey:](v16, "setValue:forKey:", v17, @"ProfileName");

    if (v8)
    {
      -[DTTVNLCInfoViewController setTitle:](v10, "setTitle:", v8);
    }

    else
    {
      v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"NLCNewProfileTitle" value:&stru_18BA0 table:@"Localizable"]);
      -[DTTVNLCInfoViewController setTitle:](v10, "setTitle:", v20);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([*p_profileStore profileDictionaryWithName:v8]);
    v22 = v21;
    if (v21) {
      id v23 = v21;
    }
    else {
      id v23 = (id)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController _emptyProfile](v10, "_emptyProfile"));
    }
    v24 = v23;

    v25 = (NSMutableDictionary *)[v24 mutableCopy];
    profileDictionary = v10->_profileDictionary;
    v10->_profileDictionary = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue([*p_profileStore customProfilesArray]);
    v10->_custom = [v27 containsObject:v8];

    v28 = (void *)objc_claimAutoreleasedReturnValue([*p_profileStore profileDictionaryWithName:v8]);
    v10->_new = v28 == 0LL;

    v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v10->_profileDictionary,  "objectForKeyedSubscript:",  @"UplinkBandwidthUnit"));
    [v29 floatValue];
    float v31 = pow(1000.0, v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v10->_profileDictionary,  "objectForKeyedSubscript:",  @"DownlinkBandwidthUnit"));
    [v32 floatValue];
    float v34 = pow(1000.0, v33);

    v35 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    upBwFmtr = v10->_upBwFmtr;
    v10->_upBwFmtr = v35;

    -[NSNumberFormatter setNumberStyle:](v10->_upBwFmtr, "setNumberStyle:", 1LL);
    -[NSNumberFormatter setMinimum:](v10->_upBwFmtr, "setMinimum:", &off_1A0D0);
    -[NSNumberFormatter setGroupingSize:](v10->_upBwFmtr, "setGroupingSize:", 0LL);
    v37 = v10->_upBwFmtr;
    *(float *)&double v38 = v31;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v38));
    -[NSNumberFormatter setMultiplier:](v37, "setMultiplier:", v39);

    -[NSNumberFormatter setAllowsFloats:](v10->_upBwFmtr, "setAllowsFloats:", 0LL);
    v40 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    downBwFmtr = v10->_downBwFmtr;
    v10->_downBwFmtr = v40;

    -[NSNumberFormatter setNumberStyle:](v10->_downBwFmtr, "setNumberStyle:", 1LL);
    -[NSNumberFormatter setMinimum:](v10->_downBwFmtr, "setMinimum:", &off_1A0D0);
    -[NSNumberFormatter setGroupingSize:](v10->_downBwFmtr, "setGroupingSize:", 0LL);
    v42 = v10->_downBwFmtr;
    *(float *)&double v43 = v34;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v43));
    -[NSNumberFormatter setMultiplier:](v42, "setMultiplier:", v44);

    -[NSNumberFormatter setAllowsFloats:](v10->_downBwFmtr, "setAllowsFloats:", 0LL);
    v45 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    plrFmtr = v10->_plrFmtr;
    v10->_plrFmtr = v45;

    -[NSNumberFormatter setNumberStyle:](v10->_plrFmtr, "setNumberStyle:", 1LL);
    -[NSNumberFormatter setMinimum:](v10->_plrFmtr, "setMinimum:", &off_1A0D0);
    -[NSNumberFormatter setMaximum:](v10->_plrFmtr, "setMaximum:", &off_1A0E8);
    -[NSNumberFormatter setGroupingSize:](v10->_plrFmtr, "setGroupingSize:", 0LL);
    v47 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    delayFmtr = v10->_delayFmtr;
    v10->_delayFmtr = v47;

    -[NSNumberFormatter setNumberStyle:](v10->_delayFmtr, "setNumberStyle:", 1LL);
    -[NSNumberFormatter setMinimum:](v10->_delayFmtr, "setMinimum:", &off_1A0D0);
    -[NSNumberFormatter setGroupingSize:](v10->_delayFmtr, "setGroupingSize:", 0LL);
    -[NSNumberFormatter setAllowsFloats:](v10->_delayFmtr, "setAllowsFloats:", 0LL);
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DTTVNLCInfoViewController;
  -[DTTVNLCInfoViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1A0B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (id)loadSettingGroups
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_super v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"NLCProfileNameTitle" value:&stru_18BA0 table:@"Localizable"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v7,  0LL,  self->_profileNameDictionary,  @"ProfileName"));

  objc_storeWeak((id *)&self->_nameItem, v8);
  v82 = v8;
  -[NSMutableArray addObject:](v4, "addObject:", v8);
  v80 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v4));
  BOOL v10 = -[DTTVNLCInfoViewController isCustom](self, "isCustom") || -[DTTVNLCInfoViewController isNew](self, "isNew");
  [v9 setEditable:v10];
  v81 = v3;
  v79 = v9;
  -[NSMutableArray addObject:](v3, "addObject:", v9);
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"NLCInBandwidth" value:&stru_18BA0 table:@"Localizable"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v14,  0LL,  self->_profileDictionary,  @"DownlinkBandwidth"));

  [v15 setKeyboardType:4];
  [v15 setLocalizedValueFormatter:self->_downBwFmtr];
  -[NSMutableArray addObject:](v11, "addObject:", v15);
  v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"NLCInPacketLoss" value:&stru_18BA0 table:@"Localizable"]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v18,  0LL,  self->_profileDictionary,  @"DownlinkPacketLossRatio"));

  [v19 setKeyboardType:4];
  [v19 setLocalizedValueFormatter:self->_plrFmtr];
  -[NSMutableArray addObject:](v11, "addObject:", v19);
  v20 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"NLCInDelay" value:&stru_18BA0 table:@"Localizable"]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v22,  0LL,  self->_profileDictionary,  @"DownlinkDelay"));

  [v23 setKeyboardType:4];
  [v23 setLocalizedValueFormatter:self->_delayFmtr];
  -[NSMutableArray addObject:](v11, "addObject:", v23);
  v24 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"NLCOutBandwidth" value:&stru_18BA0 table:@"Localizable"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v26,  0LL,  self->_profileDictionary,  @"UplinkBandwidth"));

  [v27 setKeyboardType:4];
  [v27 setLocalizedValueFormatter:self->_upBwFmtr];
  -[NSMutableArray addObject:](v11, "addObject:", v27);
  v28 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  float v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"NLCOutPacketLoss" value:&stru_18BA0 table:@"Localizable"]);
  float v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v30,  0LL,  self->_profileDictionary,  @"UplinkPacketLossRatio"));

  [v31 setKeyboardType:4];
  [v31 setLocalizedValueFormatter:self->_plrFmtr];
  -[NSMutableArray addObject:](v11, "addObject:", v31);
  v32 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  float v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  float v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"NLCOutDelay" value:&stru_18BA0 table:@"Localizable"]);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v34,  0LL,  self->_profileDictionary,  @"UplinkDelay"));

  [v35 setKeyboardType:4];
  [v35 setLocalizedValueFormatter:self->_delayFmtr];
  v76 = v11;
  -[NSMutableArray addObject:](v11, "addObject:", v35);
  v36 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  double v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"NLCDNSDelay" value:&stru_18BA0 table:@"Localizable"]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v38,  0LL,  self->_profileDictionary,  @"DNSDelayValue"));

  [v39 setKeyboardType:4];
  [v39 setLocalizedValueFormatter:self->_delayFmtr];
  v78 = v39;
  -[NSMutableArray addObject:](v11, "addObject:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController protocolFormatter](self, "protocolFormatter"));
  v41 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  double v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"NLCProtocol" value:&stru_18BA0 table:@"Localizable"]);
  profileDictionary = self->_profileDictionary;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v40 inputs]);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v43,  0LL,  profileDictionary,  @"ProtocolFamily",  v45));

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 0LL));
  [v46 setDefaultValue:v47];

  v77 = v40;
  [v46 setLocalizedValueFormatter:v40];
  -[NSMutableArray addObject:](v76, "addObject:", v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController interfaceFormatter](self, "interfaceFormatter"));
  v49 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  objc_super v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue( [v50 localizedStringForKey:@"NLCInterface" value:&stru_18BA0 table:@"Localizable"]);
  v52 = self->_profileDictionary;
  v53 = (void *)objc_claimAutoreleasedReturnValue([v48 inputs]);
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v51,  0LL,  v52,  @"RunOnInterface",  v53));

  [v54 setDefaultValue:&stru_18BA0];
  [v54 setLocalizedValueFormatter:v48];
  -[NSMutableArray addObject:](v76, "addObject:", v54);
  v55 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue( [v56 localizedStringForKey:@"NLCInfoGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v57,  v76));

  BOOL v59 = -[DTTVNLCInfoViewController isCustom](self, "isCustom") || -[DTTVNLCInfoViewController isNew](self, "isNew");
  [v58 setEditable:v59];
  v60 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue( [v61 localizedStringForKey:@"NLCInfoGroupDescription" value:&stru_18BA0 table:@"Localizable"]);
  [v58 setLocalizedDescription:v62];

  -[NSMutableArray addObject:](v81, "addObject:", v58);
  if (-[NSString length](self->_originalProfileName, "length"))
  {
    v63 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v64 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue( [v65 localizedStringForKey:@"NLCProfilesDuplicateTitle" value:&stru_18BA0 table:@"Localizable"]);
    uint64_t v67 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v66,  0LL,  0LL,  0LL,  self,  "duplicateProfile"));

    -[NSMutableArray addObject:](v63, "addObject:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v63));
    -[NSMutableArray addObject:](v81, "addObject:", v68);

    v54 = (void *)v67;
  }

  if (-[DTTVNLCInfoViewController isCustom](self, "isCustom") || -[DTTVNLCInfoViewController isNew](self, "isNew"))
  {
    v69 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v70 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue( [v71 localizedStringForKey:@"NLCProfilesDeleteTitle" value:&stru_18BA0 table:@"Localizable"]);
    uint64_t v73 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v72,  0LL,  0LL,  0LL,  self,  "deleteProfile"));

    -[NSMutableArray addObject:](v69, "addObject:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v69));
    -[NSMutableArray addObject:](v81, "addObject:", v74);

    v54 = (void *)v73;
  }

  return v81;
}

- (NSString)profileName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_profileNameDictionary,  "objectForKeyedSubscript:",  @"ProfileName");
}

- (void)_handleMenuButton
{
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
  v4 = self->_profileDictionary;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[NLCSavedProfiles profileDictionaryWithName:]( self->_profileStore,  "profileDictionaryWithName:",  self->_originalProfileName));
  BOOL v6 = !-[NSString isEqualToString:](v3, "isEqualToString:", self->_originalProfileName)
    && v3 != self->_originalProfileName;
  unsigned int v7 = -[NSMutableDictionary isEqualToDictionary:](v4, "isEqualToDictionary:", v5);
  if (-[NSString length](v3, "length"))
  {
    if ((v6 | v7 ^ 1) != 1)
    {
      -[DTTVNLCInfoViewController _exitSavingChanges:](self, "_exitSavingChanges:", 0LL);
      goto LABEL_10;
    }

    v39 = v5;
    id v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"NLCSaveChangesTitleFormat" value:&stru_18BA0 table:@"Localizable"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v3));

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  0LL,  1LL));
    objc_initWeak(location, self);
    v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"NLCSaveActionTitle" value:&stru_18BA0 table:@"Localizable"]);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_8B34;
    v42[3] = &unk_18748;
    objc_copyWeak(&v43, location);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  v42));
    double v38 = v4;

    [v12 addAction:v16];
    id v17 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"NLCCancelActionTitle" value:&stru_18BA0 table:@"Localizable"]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_8B64;
    v40[3] = &unk_18748;
    objc_copyWeak(&v41, location);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  1LL,  v40));

    [v12 addAction:v20];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
    [v21 presentViewController:v12 animated:1 completion:0];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }

  else
  {
    double v38 = v4;
    v39 = v5;
    v22 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"NLCNameRequiredTitle" value:&stru_18BA0 table:@"Localizable"]);
    v25 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"NLCNameRequiredMessage" value:&stru_18BA0 table:@"Localizable"]);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v24,  v27,  1LL));

    objc_initWeak(location, self);
    v29 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    float v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    float v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"NLCOKActionTitle" value:&stru_18BA0 table:@"Localizable"]);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v31,  0LL,  0LL));

    [v28 addAction:v32];
    float v33 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    float v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"NLCCancelActionTitle" value:&stru_18BA0 table:@"Localizable"]);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_8B04;
    v44[3] = &unk_18748;
    objc_copyWeak(&v45, location);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v35,  1LL,  v44));

    [v28 addAction:v36];
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
    [v37 presentViewController:v28 animated:1 completion:0];

    objc_destroyWeak(&v45);
    objc_destroyWeak(location);
  }

  v4 = v38;
  objc_super v5 = v39;
LABEL_10:
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameItem);

  if (v9
    && WeakRetained == v10
    && ([v9 isEqual:self->_originalProfileName] & 1) == 0
    && (v12 = (void *)objc_claimAutoreleasedReturnValue( -[NLCSavedProfiles profileDictionaryWithName:]( self->_profileStore,  "profileDictionaryWithName:",  v9)),  v12,  v12))
  {
    v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"NLCNameDuplicateTitleFormat" value:&stru_18BA0 table:@"Localizable"]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v9));

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v16,  0LL,  1LL));
    v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"NLCOKActionTitle" value:&stru_18BA0 table:@"Localizable"]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  1LL,  0LL));

    [v17 addAction:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
    [v22 presentViewController:v17 animated:1 completion:0];
  }

  else
  {
    -[DTTVNLCInfoViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___DTTVNLCInfoViewController;
    -[DTTVNLCInfoViewController editingController:didProvideValue:forSettingItem:]( &v23,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
  }
}

- (void)duplicateProfile
{
  id v8 = -[DTTVNLCInfoViewController _newNameForProfile](self, "_newNameForProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles addNewProfile:](self->_profileStore, "addNewProfile:"));
  if (v3)
  {
    -[DTTVNLCProfileStore setSelectedProfileName:](self->_profileStore, "setSelectedProfileName:", v8);
    -[DTTVNLCInfoViewController _applyChangesToProfile:](self, "_applyChangesToProfile:", v3);
    v4 = -[DTTVNLCInfoViewController initWithProfileStore:profileName:]( objc_alloc(&OBJC_CLASS___DTTVNLCInfoViewController),  "initWithProfileStore:profileName:",  self->_profileStore,  v8);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[DTTVNLCInfoViewController _viewControllersUnderViewController:]( self,  "_viewControllersUnderViewController:",  self));
    id v6 = [v5 mutableCopy];

    [v6 addObject:v4];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
    [v7 setViewControllers:v6 animated:1];
  }
}

- (void)deleteProfile
{
  originalProfileName = self->_originalProfileName;
  if (originalProfileName && -[NSString length](originalProfileName, "length"))
  {
    -[NLCSavedProfiles removeProfileWithName:]( self->_profileStore,  "removeProfileWithName:",  self->_originalProfileName);
    -[DTTVNLCProfileStore applyChanges](self->_profileStore, "applyChanges");
  }

  -[DTTVNLCInfoViewController _exitSavingChanges:](self, "_exitSavingChanges:", 0LL);
}

- (id)protocolFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 0LL));
  v19[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 2LL));
  v19[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 30LL));
  v19[2] = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL));

  id v6 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"NLCAnyProtocol" value:&stru_18BA0 table:@"Localizable"]);
  v18[0] = v8;
  id v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"NLCIPv4Protocol" value:&stru_18BA0 table:@"Localizable"]);
  v18[1] = v11;
  v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"NLCIPv6Protocol" value:&stru_18BA0 table:@"Localizable"]);
  v18[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));

  id v16 = [[TSKMappingFormatter alloc] initWithInputs:v5 outputs:v15];
  return v16;
}

- (id)interfaceFormatter
{
  v18[0] = &stru_18BA0;
  v18[1] = @"en1";
  v18[2] = @"en0";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"NLCAllInterfaces" value:&stru_18BA0 table:@"Localizable"]);
  v17[0] = v5;
  id v6 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKWiFiLocString(@"NLCWiFiInterace_WIFI");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_18BA0 table:@"Localizable"]);
  v17[1] = v10;
  v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"NLCEthernetInterface" value:&stru_18BA0 table:@"Localizable"]);
  v17[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));

  id v15 = [[TSKMappingFormatter alloc] initWithInputs:v2 outputs:v14];
  return v15;
}

- (void)_exitSavingChanges:(BOOL)a3
{
  if (a3)
  {
    if (self->_new)
    {
      profileStore = self->_profileStore;
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles addNewProfile:](profileStore, "addNewProfile:", v5));

      if (v6)
      {
        unsigned int v7 = self->_profileStore;
LABEL_10:
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
        -[DTTVNLCProfileStore setSelectedProfileName:](v7, "setSelectedProfileName:", v16);

        goto LABEL_11;
      }

      goto LABEL_12;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
    unsigned __int8 v9 = [v8 isEqual:self->_originalProfileName];

    if ((v9 & 1) == 0)
    {
      v14 = self->_profileStore;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles addNewProfile:](v14, "addNewProfile:", v15));

      if (v6)
      {
        -[NLCSavedProfiles removeProfileWithName:]( self->_profileStore,  "removeProfileWithName:",  self->_originalProfileName);
        unsigned int v7 = self->_profileStore;
        goto LABEL_10;
      }

- (void)_applyChangesToProfile:(id)a3
{
  id v4 = a3;
  [v4 removeAllObjects];
  [v4 addEntriesFromDictionary:self->_profileDictionary];
  [v4 setObject:&__kCFBooleanFalse forKey:@"Preset"];

  -[DTTVNLCProfileStore applyChanges](self->_profileStore, "applyChanges");
}

- (id)_newNameForProfile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@" "]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  id v6 = [v5 integerValue];
  unint64_t v7 = (unint64_t)v6;
  if (v6)
  {
    uint64_t v8 = (uint64_t)v6 + 1;
    uint64_t v9 = (uint64_t)(log((double)((uint64_t)v6 + 1)) / 2.30258509 + 2.0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringToIndex:", (char *)objc_msgSend( v11,  "length") - v9));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
    uint64_t v8 = 2LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", @" %ld", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles profileDictionaryWithName:](self->_profileStore, "profileDictionaryWithName:", v13));

  if (v14)
  {
    if (v7 <= 1) {
      uint64_t v15 = 1LL;
    }
    else {
      uint64_t v15 = v7;
    }
    uint64_t v16 = v15 + 2;
    do
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", @" %ld", v16));

      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NLCSavedProfiles profileDictionaryWithName:]( self->_profileStore,  "profileDictionaryWithName:",  v17));
      ++v16;
      v13 = v17;
    }

    while (v18);
  }

  else
  {
    id v17 = v13;
  }

  return v17;
}

- (id)_viewControllersUnderViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewControllers]);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v9 = [v8 mutableCopy];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_982C;
  v15[3] = &unk_18770;
  id v16 = v4;
  id v10 = v9;
  id v17 = v10;
  id v11 = v4;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v15];
  v12 = v17;
  id v13 = v10;

  return v13;
}

- (id)_emptyProfile
{
  v6[0] = &off_1A160;
  v6[1] = &off_1A160;
  v6[2] = &off_1A160;
  v6[3] = &off_1A0D0;
  v6[4] = &off_1A160;
  v6[5] = &off_1A160;
  v6[6] = &off_1A160;
  v6[7] = &off_1A0D0;
  v6[8] = &stru_18BA0;
  v6[9] = &off_1A0D0;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  0LL,  @"UplinkBandwidth",  @"UplinkDelay",  @"UplinkPacketLossRatio",  @"UplinkBandwidthUnit",  @"DownlinkBandwidth",  @"DownlinkDelay",  @"DownlinkPacketLossRatio",  @"DownlinkBandwidthUnit",  @"RunOnInterface",  @"DNSDelayValue",  @"ProtocolFamily"));
  v5[11] = @"ExcludeLoopback";
  v6[10] = v2;
  v6[11] = &off_1A118;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  12LL));

  return v3;
}

- (DTTVNLCProfileStore)profileStore
{
  return self->_profileStore;
}

- (BOOL)isNew
{
  return self->_new;
}

- (void)setNew:(BOOL)a3
{
  self->_new = a3;
}

- (BOOL)isCustom
{
  return self->_custom;
}

- (void)setCustom:(BOOL)a3
{
  self->_custom = a3;
}

- (NSString)originalProfileName
{
  return self->_originalProfileName;
}

- (void)setOriginalProfileName:(id)a3
{
}

- (NSMutableDictionary)profileDictionary
{
  return self->_profileDictionary;
}

- (void)setProfileDictionary:(id)a3
{
}

- (NSMutableDictionary)profileNameDictionary
{
  return self->_profileNameDictionary;
}

- (void)setProfileNameDictionary:(id)a3
{
}

- (NSNumberFormatter)upBwFmtr
{
  return self->_upBwFmtr;
}

- (void)setUpBwFmtr:(id)a3
{
}

- (NSNumberFormatter)downBwFmtr
{
  return self->_downBwFmtr;
}

- (void)setDownBwFmtr:(id)a3
{
}

- (NSNumberFormatter)plrFmtr
{
  return self->_plrFmtr;
}

- (void)setPlrFmtr:(id)a3
{
}

- (NSNumberFormatter)delayFmtr
{
  return self->_delayFmtr;
}

- (void)setDelayFmtr:(id)a3
{
}

- (TSKSettingItem)nameItem
{
  return (TSKSettingItem *)objc_loadWeakRetained((id *)&self->_nameItem);
}

- (void)setNameItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end