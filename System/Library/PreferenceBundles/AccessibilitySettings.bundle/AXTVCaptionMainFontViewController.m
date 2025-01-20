@interface AXTVCaptionMainFontViewController
- (id)_fontControllerWithItem:(id)a3 nameKey:(id)a4 overrideKey:(id)a5;
- (id)loadSettingGroups;
@end

@implementation AXTVCaptionMainFontViewController

- (id)loadSettingGroups
{
  v182.receiver = self;
  v182.super_class = (Class)&OBJC_CLASS___AXTVCaptionMainFontViewController;
  id v3 = -[AXTVCaptionMultiValueOverrideViewController loadSettingGroups](&v182, "loadSettingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v14 = AXTVLocString(@"AXCaptionMappedFontsSectionTitle", v7, v8, v9, v10, v11, v12, v13, v152);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v167 = [v6 initWithTitle:v15];

  v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v24 = AXTVLocString(@"AXCaptionMappedFontMonospaceSerifTitle", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v33 = AXTVLocString(@"AXCaptionMappedFontDescription", v26, v27, v28, v29, v30, v31, v32, v153);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v180[0] = _NSConcreteStackBlock;
  v180[1] = 3221225472LL;
  v180[2] = sub_71E0;
  v180[3] = &unk_65318;
  objc_copyWeak(&v181, location);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v25,  v34,  0LL,  0LL,  v180));

  -[NSMutableArray addObject:](v16, "addObject:", v35);
  id v43 = AXTVLocString(@"AXCaptionMappedFontProportionalSerifTitle", v36, v37, v38, v39, v40, v41, v42, v154);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  id v52 = AXTVLocString(@"AXCaptionMappedFontDescription", v45, v46, v47, v48, v49, v50, v51, v155);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v178[0] = _NSConcreteStackBlock;
  v178[1] = 3221225472LL;
  v178[2] = sub_7244;
  v178[3] = &unk_65318;
  objc_copyWeak(&v179, location);
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v44,  v53,  0LL,  0LL,  v178));

  -[NSMutableArray addObject:](v16, "addObject:", v54);
  id v62 = AXTVLocString(@"AXCaptionMappedFontMonospaceSansSerifTitle", v55, v56, v57, v58, v59, v60, v61, v156);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  id v71 = AXTVLocString(@"AXCaptionMappedFontDescription", v64, v65, v66, v67, v68, v69, v70, v157);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  v176[0] = _NSConcreteStackBlock;
  v176[1] = 3221225472LL;
  v176[2] = sub_72A8;
  v176[3] = &unk_65318;
  objc_copyWeak(&v177, location);
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v63,  v72,  0LL,  0LL,  v176));

  -[NSMutableArray addObject:](v16, "addObject:", v73);
  id v81 = AXTVLocString(@"AXCaptionMappedFontProportionalSansSerifTitle", v74, v75, v76, v77, v78, v79, v80, v158);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  id v90 = AXTVLocString(@"AXCaptionMappedFontDescription", v83, v84, v85, v86, v87, v88, v89, v159);
  v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
  v174[0] = _NSConcreteStackBlock;
  v174[1] = 3221225472LL;
  v174[2] = sub_730C;
  v174[3] = &unk_65318;
  objc_copyWeak(&v175, location);
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v82,  v91,  0LL,  0LL,  v174));

  -[NSMutableArray addObject:](v16, "addObject:", v92);
  id v100 = AXTVLocString(@"AXCaptionMappedFontCasualTitle", v93, v94, v95, v96, v97, v98, v99, v160);
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
  id v109 = AXTVLocString(@"AXCaptionMappedFontDescription", v102, v103, v104, v105, v106, v107, v108, v161);
  v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
  v172[0] = _NSConcreteStackBlock;
  v172[1] = 3221225472LL;
  v172[2] = sub_7370;
  v172[3] = &unk_65318;
  objc_copyWeak(&v173, location);
  v111 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v101,  v110,  0LL,  0LL,  v172));

  -[NSMutableArray addObject:](v16, "addObject:", v111);
  id v119 = AXTVLocString(@"AXCaptionMappedFontCursiveTitle", v112, v113, v114, v115, v116, v117, v118, v162);
  v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
  id v128 = AXTVLocString(@"AXCaptionMappedFontDescription", v121, v122, v123, v124, v125, v126, v127, v163);
  v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
  v170[0] = _NSConcreteStackBlock;
  v170[1] = 3221225472LL;
  v170[2] = sub_73D4;
  v170[3] = &unk_65318;
  objc_copyWeak(&v171, location);
  v130 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v120,  v129,  0LL,  0LL,  v170));

  -[NSMutableArray addObject:](v16, "addObject:", v130);
  id v138 = AXTVLocString(@"AXCaptionMappedFontSmallCapitalTitle", v131, v132, v133, v134, v135, v136, v137, v164);
  v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
  id v147 = AXTVLocString(@"AXCaptionMappedFontDescription", v140, v141, v142, v143, v144, v145, v146, v165);
  v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
  v168[0] = _NSConcreteStackBlock;
  v168[1] = 3221225472LL;
  v168[2] = sub_7438;
  v168[3] = &unk_65318;
  objc_copyWeak(&v169, location);
  v149 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v139,  v148,  0LL,  0LL,  v168));

  [v149 setAccessoryTypes:1];
  -[NSMutableArray addObject:](v16, "addObject:", v149);
  [v167 setSettingItems:v16];
  [v166 addObject:v167];
  id v150 = [v166 copy];
  objc_destroyWeak(&v169);
  objc_destroyWeak(&v171);
  objc_destroyWeak(&v173);
  objc_destroyWeak(&v175);
  objc_destroyWeak(&v177);
  objc_destroyWeak(&v179);
  objc_destroyWeak(&v181);

  objc_destroyWeak(location);
  return v150;
}

- (id)_fontControllerWithItem:(id)a3 nameKey:(id)a4 overrideKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___AXTVCaptionFontViewController);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController style](self, "style"));
  -[AXTVCaptionMultiValueOverrideViewController setStyle:](v11, "setStyle:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController defaultValue](self, "defaultValue"));
  -[AXTVCaptionMultiValueOverrideViewController setDefaultValue:](v11, "setDefaultValue:", v13);

  -[AXTVCaptionMultiValueOverrideViewController setValueKey:](v11, "setValueKey:", v9);
  -[AXTVCaptionMultiValueOverrideViewController setOverrideKey:](v11, "setOverrideKey:", v8);

  id v21 = AXTVLocString(@"AXCaptionStyleFontOverrideDescription", v14, v15, v16, v17, v18, v19, v20, v26);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[AXTVCaptionMultiValueOverrideViewController setOverrideDescription:](v11, "setOverrideDescription:", v22);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionFontNameFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionFontNameFormatter"));
  -[AXTVCaptionMultiValueOverrideViewController setFormatter:](v11, "setFormatter:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedTitle]);
  -[AXTVCaptionFontViewController setTitle:](v11, "setTitle:", v24);

  return v11;
}

@end