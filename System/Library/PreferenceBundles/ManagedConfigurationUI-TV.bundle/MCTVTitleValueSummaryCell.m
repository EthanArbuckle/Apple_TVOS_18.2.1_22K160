@interface MCTVTitleValueSummaryCell
- (MCTVTitleValueSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (NSArray)titleLabels;
- (NSArray)titleStrings;
- (NSArray)valueLabels;
- (NSArray)valueStrings;
- (NSString)headerText;
- (NSString)subHeaderText;
- (UILabel)headerLabel;
- (UILabel)subHeaderLabel;
- (id)_headerFont;
- (id)_newTitleLabel;
- (id)_newValueLabel;
- (id)_subHeaderFont;
- (id)_summaryFont;
- (void)setHeaderText:(id)a3;
- (void)setSubHeaderText:(id)a3;
- (void)setSummaryTitles:(id)a3 withValues:(id)a4;
- (void)updateConstraints;
@end

@implementation MCTVTitleValueSummaryCell

- (MCTVTitleValueSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCTVTitleValueSummaryCell;
  v4 = -[MCTVTitleValueSummaryCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = v5;

    v7 = v4->_headerLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell _headerFont](v4, "_headerFont"));
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_headerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell contentView](v4, "contentView"));
    [v9 addSubview:v4->_headerLabel];

    v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subHeaderLabel = v4->_subHeaderLabel;
    v4->_subHeaderLabel = v10;

    v12 = v4->_subHeaderLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell _subHeaderFont](v4, "_subHeaderFont"));
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subHeaderLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell contentView](v4, "contentView"));
    [v14 addSubview:v4->_subHeaderLabel];

    -[MCTVTitleValueSummaryCell registerDetailLabelForAppearanceUpdates:]( v4,  "registerDetailLabelForAppearanceUpdates:",  v4->_subHeaderLabel);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIBackgroundConfiguration clearConfiguration]( &OBJC_CLASS___UIBackgroundConfiguration,  "clearConfiguration"));
    -[MCTVTitleValueSummaryCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v15);

    -[MCTVTitleValueSummaryCell setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
  }

  return v4;
}

- (void)setHeaderText:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  headerText = self->_headerText;
  self->_headerText = v5;

  -[UILabel setText:](self->_headerLabel, "setText:", v4);
  -[MCTVTitleValueSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setSubHeaderText:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  subHeaderText = self->_subHeaderText;
  self->_subHeaderText = v5;

  -[UILabel setText:](self->_subHeaderLabel, "setText:", v4);
  -[MCTVTitleValueSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setSummaryTitles:(id)a3 withValues:(id)a4
{
  id v6 = a4;
  v7 = (NSArray *)[a3 copy];
  titleStrings = self->_titleStrings;
  self->_titleStrings = v7;

  v9 = (NSArray *)[v6 copy];
  valueStrings = self->_valueStrings;
  self->_valueStrings = v9;

  -[MCTVTitleValueSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  v109.receiver = self;
  v109.super_class = (Class)&OBJC_CLASS___MCTVTitleValueSummaryCell;
  -[MCTVTitleValueSummaryCell updateConstraints](&v109, "updateConstraints");
  id v3 = MCTVLoggingFacility();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v115 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "UPDATE CONSTRAINTS (summary): %@", buf, 0xCu);
  }

  +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_constraints);
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  v5 = self->_titleLabels;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v105,  v113,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v106;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v106 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v105 + 1) + 8 * (void)i) removeFromSuperview];
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v105,  v113,  16LL);
    }

    while (v7);
  }

  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  v10 = self->_valueLabels;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v101,  v112,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v102;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v102 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v101 + 1) + 8 * (void)j) removeFromSuperview];
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v101,  v112,  16LL);
    }

    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell contentView](self, "contentView"));
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  objc_super v17 = self->_titleStrings;
  id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v97,  v111,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v98;
    double v21 = 0.0;
    do
    {
      for (k = 0LL; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v98 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)k);
        id v24 = -[MCTVTitleValueSummaryCell _newTitleLabel](self, "_newTitleLabel");
        [v24 setText:v23];
        -[NSMutableArray addObject:](v16, "addObject:", v24);
        [v15 addSubview:v24];
        [v15 bounds];
        objc_msgSend(v24, "textRectForBounds:limitedToNumberOfLines:", 1);
        double Width = CGRectGetWidth(v116);
        if (Width > v21) {
          double v21 = Width;
        }
      }

      id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v97,  v111,  16LL);
    }

    while (v19);
  }

  else
  {
    double v21 = 0.0;
  }

  v89 = v16;
  v26 = (NSArray *)-[NSMutableArray copy](v16, "copy");
  titleLabels = self->_titleLabels;
  self->_titleLabels = v26;

  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  v29 = self->_valueStrings;
  id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v93,  v110,  16LL);
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v94;
    do
    {
      for (m = 0LL; m != v31; m = (char *)m + 1)
      {
        if (*(void *)v94 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)m);
        id v35 = -[MCTVTitleValueSummaryCell _newValueLabel](self, "_newValueLabel");
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSAttributedString);
        if ((objc_opt_isKindOfClass(v34, v36) & 1) != 0)
        {
          [v35 setAttributedText:v34];
        }

        else
        {
          [v35 setText:v34];
          -[MCTVTitleValueSummaryCell registerDetailLabelForAppearanceUpdates:]( self,  "registerDetailLabelForAppearanceUpdates:",  v35);
        }

        -[NSMutableArray addObject:](v28, "addObject:", v35);
        [v15 addSubview:v35];
      }

      id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v93,  v110,  16LL);
    }

    while (v31);
  }

  v37 = (NSArray *)-[NSMutableArray copy](v28, "copy");
  valueLabels = self->_valueLabels;
  self->_valueLabels = v37;

  v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell headerText](self, "headerText"));
  id v41 = [v40 length];

  id v90 = v41;
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_headerLabel, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43 constant:15.0]);
    -[NSMutableArray addObject:](v39, "addObject:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_headerLabel, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46 constant:20.0]);
    -[NSMutableArray addObject:](v39, "addObject:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_headerLabel, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v15 trailingAnchor]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v49 constant:20.0]);
    -[NSMutableArray addObject:](v39, "addObject:", v50);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell subHeaderText](self, "subHeaderText"));
  id v52 = [v51 length];

  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_subHeaderLabel, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_headerLabel, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v54]);
    -[NSMutableArray addObject:](v39, "addObject:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subHeaderLabel, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57 constant:20.0]);
    -[NSMutableArray addObject:](v39, "addObject:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subHeaderLabel, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v15 trailingAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v60]);
    -[NSMutableArray addObject:](v39, "addObject:", v61);
  }

  v91 = v39;
  if (-[NSArray count](self->_titleLabels, "count"))
  {
    v62 = 0LL;
    while (1)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", v62));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_valueLabels, "objectAtIndexedSubscript:", v62));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v63 widthAnchor]);
      v66 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToConstant:v21]);
      -[NSMutableArray addObject:](v91, "addObject:", v66);

      v67 = (void *)objc_claimAutoreleasedReturnValue([v63 leadingAnchor]);
      v68 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v68 constant:20.0]);
      -[NSMutableArray addObject:](v91, "addObject:", v69);

      v70 = (void *)objc_claimAutoreleasedReturnValue([v63 firstBaselineAnchor]);
      v71 = (void *)objc_claimAutoreleasedReturnValue([v64 firstBaselineAnchor]);
      v72 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v71]);
      -[NSMutableArray addObject:](v91, "addObject:", v72);

      v73 = (void *)objc_claimAutoreleasedReturnValue([v64 leadingAnchor]);
      v74 = (void *)objc_claimAutoreleasedReturnValue([v63 trailingAnchor]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v74 constant:20.0]);
      -[NSMutableArray addObject:](v91, "addObject:", v75);

      v92 = v64;
      v76 = (void *)objc_claimAutoreleasedReturnValue([v64 trailingAnchor]);
      v77 = (void *)objc_claimAutoreleasedReturnValue([v15 trailingAnchor]);
      v78 = (void *)objc_claimAutoreleasedReturnValue([v76 constraintEqualToAnchor:v77 constant:-20.0]);
      -[NSMutableArray addObject:](v91, "addObject:", v78);

      if (v62) {
        break;
      }
      v79 = (void *)objc_claimAutoreleasedReturnValue([v63 topAnchor]);
      if (v52)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_subHeaderLabel, "lastBaselineAnchor"));
        v81 = (void *)objc_claimAutoreleasedReturnValue([v79 constraintEqualToAnchor:v80 constant:30.0]);
        -[NSMutableArray addObject:](v91, "addObject:", v81);
        goto LABEL_48;
      }

      if (v90)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_headerLabel, "lastBaselineAnchor"));
        double v86 = 30.0;
      }

      else
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
        double v86 = 15.0;
      }

      v81 = (void *)objc_claimAutoreleasedReturnValue([v79 constraintEqualToAnchor:v80 constant:v86]);
      -[NSMutableArray addObject:](v91, "addObject:", v81);
LABEL_49:

      if (v62 == (char *)-[NSArray count](self->_titleLabels, "count") - 1)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue([v64 bottomAnchor]);
        v84 = (void *)objc_claimAutoreleasedReturnValue([v15 bottomAnchor]);
        v85 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v84 constant:-15.0]);
        -[NSMutableArray addObject:](v91, "addObject:", v85);
      }

      if (++v62 >= (_BYTE *)-[NSArray count](self->_titleLabels, "count")) {
        goto LABEL_57;
      }
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_valueLabels, "objectAtIndexedSubscript:", v62 - 1));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v63 topAnchor]);
    v81 = (void *)objc_claimAutoreleasedReturnValue([v79 lastBaselineAnchor]);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v81 constant:15.0]);
    -[NSMutableArray addObject:](v91, "addObject:", v82);

LABEL_48:
    v64 = v92;
    goto LABEL_49;
  }

- (id)_newTitleLabel
{
  id v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell _summaryFont](self, "_summaryFont"));
  -[UILabel setFont:](v3, "setFont:", v4);

  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 4LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  return v3;
}

- (id)_newValueLabel
{
  unsigned int v3 = -[MCTVTitleValueSummaryCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVTitleValueSummaryCell _summaryFont](self, "_summaryFont"));
  -[UILabel setFont:](v4, "setFont:", v5);

  if (v3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  -[UILabel setTextAlignment:](v4, "setTextAlignment:", v6);
  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0LL);
  -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 0LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  return v4;
}

- (id)_headerFont
{
  if (qword_311F8 != -1) {
    dispatch_once(&qword_311F8, &stru_28DB8);
  }
  return (id)qword_311F0;
}

- (id)_subHeaderFont
{
  if (qword_31208 != -1) {
    dispatch_once(&qword_31208, &stru_28DD8);
  }
  return (id)qword_31200;
}

- (id)_summaryFont
{
  if (qword_31218 != -1) {
    dispatch_once(&qword_31218, &stru_28DF8);
  }
  return (id)qword_31210;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)subHeaderText
{
  return self->_subHeaderText;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (UILabel)subHeaderLabel
{
  return self->_subHeaderLabel;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (NSArray)titleLabels
{
  return self->_titleLabels;
}

- (NSArray)valueLabels
{
  return self->_valueLabels;
}

- (NSArray)titleStrings
{
  return self->_titleStrings;
}

- (NSArray)valueStrings
{
  return self->_valueStrings;
}

- (void).cxx_destruct
{
}

@end