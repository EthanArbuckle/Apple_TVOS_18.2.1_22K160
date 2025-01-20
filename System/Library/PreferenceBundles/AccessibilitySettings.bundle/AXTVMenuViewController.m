@interface AXTVMenuViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (NSArray)currentTripleClickOptions;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)editButton;
- (UIGestureRecognizer)backGestureRecognizer;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tripleClickOptionsCount;
- (void)handleBackGesture:(id)a3;
- (void)handleEditingButton:(id)a3;
- (void)setBackGestureRecognizer:(id)a3;
- (void)setCurrentTripleClickOptions:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateViews;
- (void)updateViewsAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXTVMenuViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AXTVMenuViewController;
  -[AXTVMenuViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "handleBackGesture:");
  -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_6FFA0);
  -[AXTVMenuViewController setBackGestureRecognizer:](self, "setBackGestureRecognizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v5 addGestureRecognizer:v3];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSKTableViewTextCell);
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewTextCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v6 registerClass:v7 forCellReuseIdentifier:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVMenuViewController;
  -[AXTVMenuViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[AXTVMenuViewController updateViewsAnimated:](self, "updateViewsAnimated:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController backGestureRecognizer](self, "backGestureRecognizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController backGestureRecognizer](self, "backGestureRecognizer"));
  [v6 removeGestureRecognizer:v7];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVMenuViewController;
  -[AXTVMenuViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[AXTVMenuViewController updateViewsAnimated:](self, "updateViewsAnimated:", a4);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVMenuViewController;
  -[AXTVMenuViewController setEditing:animated:](&v7, "setEditing:animated:", v5, v4);
}

- (id)loadSettingGroups
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v4 = (NSArray *)objc_claimAutoreleasedReturnValue([v196 tripleClickOrderedOptions]);
  currentTripleClickOptions = self->_currentTripleClickOptions;
  self->_currentTripleClickOptions = v4;

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v14 = AXTVLocString(@"AXVoiceOverTitle", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v196);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v23 = AXTVLocString(@"AXVoiceOverDescription", v16, v17, v18, v19, v20, v21, v22, v197);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v15,  v24,  v3,  @"showAXMenuVoiceOver",  1LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v25);
  if (+[TVSDevice supportsTouchRemote](&OBJC_CLASS___TVSDevice, "supportsTouchRemote"))
  {
    id v33 = AXTVLocString(@"AXZoomTitle", v26, v27, v28, v29, v30, v31, v32, v198);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v34,  0LL,  v3,  @"showAXMenuZoom",  2LL,  &stru_65B18));

    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    -[NSMutableParagraphStyle setAlignment:](v36, "setAlignment:", 4LL);
    v214[0] = NSFontAttributeName;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
    v214[1] = NSParagraphStyleAttributeName;
    v215[0] = v37;
    v215[1] = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v215,  v214,  2LL));

    v39 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    id v47 = AXTVLocString(@"AXZoomDescription", v40, v41, v42, v43, v44, v45, v46, v199);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = -[NSAttributedString initWithString:attributes:](v39, "initWithString:attributes:", v48, v38);

    [v35 setAttributedLocalizedDescription:v49];
    -[NSMutableArray addObject:](v6, "addObject:", v35);

    v25 = v35;
  }

  id v50 = AXTVLocString(@"AXHoverTextTitle", v26, v27, v28, v29, v30, v31, v32, v198);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  id v59 = AXTVLocString(@"AXHoverTextDescription", v52, v53, v54, v55, v56, v57, v58, v200);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v51,  v60,  v3,  @"showAXMenuHoverText",  1024LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v61);
  id v69 = AXTVLocString(@"AXClosedCaptionsTitle", v62, v63, v64, v65, v66, v67, v68, v201);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  id v78 = AXTVLocString(@"AXCaptionsAndSDHDescription", v71, v72, v73, v74, v75, v76, v77, v202);
  v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v70,  v79,  v3,  @"showAXMenuClosedCaptions",  4LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v80);
  id v88 = AXTVLocString(@"AXAudioDescriptionsTitle", v81, v82, v83, v84, v85, v86, v87, v203);
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  id v97 = AXTVLocString(@"AXAudioDescriptionsDescription", v90, v91, v92, v93, v94, v95, v96, v204);
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v89,  v98,  v3,  @"showAXMenuVideoDescriptions",  8LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v99);
  uint64_t v100 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_LABEL");
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
  uint64_t v102 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_FOOTER_TEXT_ATV");
  v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v101,  v103,  v3,  @"showAXMenuSwitchControl",  32LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v104);
  id v112 = AXTVLocString(@"AXColorFiltersTitle", v105, v106, v107, v108, v109, v110, v111, v205);
  v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
  id v121 = AXTVLocString(@"AXColorFiltersDescription", v114, v115, v116, v117, v118, v119, v120, v206);
  v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v113,  v122,  v3,  @"showAXMenuDisplayFilterColorAdjustments",  128LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v123);
  id v131 = AXTVLocString(@"AXLightSensitivityTitle", v124, v125, v126, v127, v128, v129, v130, v207);
  v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
  id v140 = AXTVLocString(@"AXLightSensitivityDescription", v133, v134, v135, v136, v137, v138, v139, v208);
  v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v132,  v141,  v3,  @"showAXMenuDisplayFilterLightSensitivity",  256LL,  &stru_65B18));

  -[NSMutableArray addObject:](v6, "addObject:", v142);
  id v150 = AXTVLocString(@"AXReduceWhitePointTitle", v143, v144, v145, v146, v147, v148, v149, v209);
  v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
  id v159 = AXTVLocString(@"AXReduceWhitePointDescription", v152, v153, v154, v155, v156, v157, v158, v210);
  v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
  v161 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v151,  v160,  v3,  @"showAXMenuDisplayFilterReduceWhitePoint",  512LL,  &stru_65B18));

  if (AXDeviceSupportsPhotosensitiveMitigation(-[NSMutableArray addObject:](v6, "addObject:", v161)))
  {
    id v168 = AXTVLocStringWithTable( @"DIM_MITIGATION_TITLE",  @"Accessibility-PSE",  v162,  v163,  v164,  v165,  v166,  v167,  (uint64_t)v211);
    v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
    uint64_t v170 = PSESettingsFooterText();
    v171 = (void *)objc_claimAutoreleasedReturnValue(v170);
    uint64_t v172 = objc_claimAutoreleasedReturnValue( +[AXTVMenuSettingItem tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:]( &OBJC_CLASS___AXTVMenuSettingItem,  "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:",  v169,  v171,  v3,  @"showAXMenuPhotosensitiveMitigation",  2048LL,  &stru_65B18));

    -[NSMutableArray addObject:](v6, "addObject:", v172);
    v161 = (void *)v172;
  }

  v173 = v211;
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray ax_mappedArrayUsingBlock:](v6, "ax_mappedArrayUsingBlock:", &stru_65B58));
  v175 = v174;
  if (self->_currentTripleClickOptions)
  {
    v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v174));
    [v176 removeObjectsInArray:self->_currentTripleClickOptions];
    v177 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  self->_currentTripleClickOptions));
    [v177 removeObjectsInArray:v175];
    v178 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  self->_currentTripleClickOptions));
    v179 = v178;
    if (v177) {
      [v178 removeObjectsInArray:v177];
    }
    if (v176) {
      [v179 addObjectsFromArray:v176];
    }
    v180 = (NSArray *)[v179 copy];
    v181 = self->_currentTripleClickOptions;
    self->_currentTripleClickOptions = v180;

    [v211 setTripleClickOrderedOptions:self->_currentTripleClickOptions];
    v212[0] = _NSConcreteStackBlock;
    v212[1] = 3221225472LL;
    v212[2] = sub_15668;
    v212[3] = &unk_65B80;
    v212[4] = self;
    -[NSMutableArray sortUsingComparator:](v6, "sortUsingComparator:", v212);
  }

  else
  {
    v189 = (NSArray *)[v174 copy];
    v190 = self->_currentTripleClickOptions;
    self->_currentTripleClickOptions = v189;

    [v211 setTripleClickOrderedOptions:self->_currentTripleClickOptions];
  }

  id v191 = AXTVLocString( @"AXAccessibilityMenuOptionsSectionTitle",  v182,  v183,  v184,  v185,  v186,  v187,  v188,  (uint64_t)v211);
  v192 = (void *)objc_claimAutoreleasedReturnValue(v191);
  v193 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v192,  v6));

  v213 = v193;
  v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v213, 1LL));

  return v194;
}

- (UIBarButtonItem)editButton
{
  editButton = self->_editButton;
  if (!editButton)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    id v12 = AXTVLocString(@"Edit", v5, v6, v7, v8, v9, v10, v11, v16);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = -[UIBarButtonItem initWithTitle:style:target:action:]( v4,  "initWithTitle:style:target:action:",  v13,  0LL,  self,  "handleEditingButton:");
    -[AXTVMenuViewController setEditButton:](self, "setEditButton:", v14);

    -[UIBarButtonItem setTag:](self->_editButton, "setTag:", 0LL);
    editButton = self->_editButton;
  }

  return editButton;
}

- (UIBarButtonItem)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    id v12 = AXTVLocString(@"Done", v5, v6, v7, v8, v9, v10, v11, v16);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = -[UIBarButtonItem initWithTitle:style:target:action:]( v4,  "initWithTitle:style:target:action:",  v13,  0LL,  self,  "handleEditingButton:");
    -[AXTVMenuViewController setDoneButton:](self, "setDoneButton:", v14);

    -[UIBarButtonItem setTag:](self->_doneButton, "setTag:", 1LL);
    doneButton = self->_doneButton;
  }

  return doneButton;
}

- (void)handleEditingButton:(id)a3
{
  BOOL v4 = (char *)[a3 tag];
  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView"));
    [v6 setEditing:0];
  }

  else if (!v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView"));
    [v5 setEditing:1];

    -[AXTVMenuViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  -[AXTVMenuViewController updateViews](self, "updateViews");
}

- (void)updateViews
{
}

- (void)updateViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController navigationItem](self, "navigationItem"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView"));
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController doneButton](self, "doneButton"));
    id v12 = v8;
    uint64_t v9 = &v12;
  }

  else
  {
    if (-[AXTVMenuViewController tripleClickOptionsCount](self, "tripleClickOptionsCount") < 2)
    {
      [v5 setRightBarButtonItems:0];
      goto LABEL_7;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController editButton](self, "editButton"));
    uint64_t v11 = v8;
    uint64_t v9 = &v11;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 1LL));
  [v5 setRightBarButtonItems:v10 animated:v3];

LABEL_7:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0LL;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = [a4 row];
  id v9 = [v7 row];

  if (v8 != v9)
  {
    uint64_t v10 = (NSArray *)-[NSArray mutableCopy](self->_currentTripleClickOptions, "mutableCopy");
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_currentTripleClickOptions, "objectAtIndex:", v8));
    -[NSArray removeObjectAtIndex:](v10, "removeObjectAtIndex:", v8);
    -[NSArray insertObject:atIndex:](v10, "insertObject:atIndex:", v14, v9);
    currentTripleClickOptions = self->_currentTripleClickOptions;
    self->_currentTripleClickOptions = v10;
    id v12 = v10;

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v13 setTripleClickOrderedOptions:self->_currentTripleClickOptions];

    -[AXTVMenuViewController reloadSettings](self, "reloadSettings");
    -[AXTVMenuViewController updateViews](self, "updateViews");
  }

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController backGestureRecognizer](self, "backGestureRecognizer"));

  if (v5 != v4) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView"));
  unsigned __int8 v8 = [v7 isEditing];

  return v8;
}

- (void)handleBackGesture:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXTVMenuViewController doneButton](self, "doneButton"));
    -[AXTVMenuViewController handleEditingButton:](self, "handleEditingButton:", v6);
  }

- (int64_t)tripleClickOptionsCount
{
  return -[NSArray count](self->_currentTripleClickOptions, "count");
}

- (UIGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
  self->_backGestureRecognizer = (UIGestureRecognizer *)a3;
}

- (void)setEditButton:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (NSArray)currentTripleClickOptions
{
  return self->_currentTripleClickOptions;
}

- (void)setCurrentTripleClickOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end