LABEL_33:
    if (v10)
    {
      v5 = v67;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v67 string]);
      v34 = objc_msgSend(v62, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", v10 - 1));
    }

    else
    {
      v34 = 0;
      v5 = v67;
    }

    v6 = v64;
    v12 = &CFLocaleCreate_ptr;
    if (((v68 | v34) & 1) != 0)
    {
      v31 = v72;
      -[NSMutableAttributedString appendAttributedString:](v64, "appendAttributedString:", v72);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
      -[NSMutableArray addObject:](v65, "addObject:", v35);

      v9 = 1;
    }

    else
    {
      v36 = v17;
      if (v17)
      {
        v63 = [v17 integerValue];
        v9 = 0;
        v66 = 1;
        v8 = 1;
        v31 = v72;
        goto LABEL_50;
      }

      v37 = (uint64_t)v63;
      if ((v66 & 1) == 0) {
        v37 = 1LL;
      }
      v63 = (id)v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v72 string]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([&off_B930 objectForKey:v38]);
      v69 = (uint64_t)[v39 integerValue];

      if (v11 <= 3)
      {
        v40 = v11 + ~v69;
        if (v40 >= 1)
        {
          v41 = -2LL;
          if ((v66 & 1) == 0) {
            v41 = -1LL;
          }
          v42 = v41 + v10;
          do
          {
            v43 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @"0");
            -[NSMutableAttributedString appendAttributedString:](v64, "appendAttributedString:", v43);

            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v42));
            -[NSMutableArray addObject:](v65, "addObject:", v44);

            --v40;
          }

          while (v40);
        }
      }

      v45 = objc_alloc(&OBJC_CLASS___NSAttributedString);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v63));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v46));
      v48 = -[NSAttributedString initWithString:](v45, "initWithString:", v47);

      -[NSMutableAttributedString appendAttributedString:](v64, "appendAttributedString:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 - (v66 & 1)));
      -[NSMutableArray addObject:](v65, "addObject:", v49);

      v66 = 0;
      v9 = 0;
      v8 = 1;
      v11 = v69;
      v31 = v72;
    }

LABEL_49:
    v36 = v73;
LABEL_50:

    ++v10;
  }

  while (v10 < (unint64_t)[v5 length]);
  a4 = v61;
  v7 = v65;
  if ((v8 & 1) != 0)
  {
    if ((v66 & 1) != 0)
    {
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v50 = v11 - 1;
        do
        {
          v51 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @"0");
          -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v51);

          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v5 length] - 2));
          -[NSMutableArray addObject:](v65, "addObject:", v52);

          --v50;
        }

        while (v50);
      }

      v53 = objc_alloc(&OBJC_CLASS___NSAttributedString);
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v63));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v54));
      v56 = -[NSAttributedString initWithString:](v53, "initWithString:", v55);

      -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v5 length] - 1));
      -[NSMutableArray addObject:](v65, "addObject:", v57);

      v7 = v65;
    }

    else
    {
      v7 = v65;
      if ((unint64_t)(v11 - 1) <= 2)
      {
        do
        {
          v58 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @"0");
          -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v58);

          v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v5 length] - 1));
          -[NSMutableArray addObject:](v65, "addObject:", v59);

          --v11;
        }

        while (v11);
      }
    }
  }

LABEL_59:
  if (a4) {
    *a4 = v7;
  }

  return v6;
}

LABEL_16:
        if (v15 >= (unint64_t)[v4 length])
        {
          v25 = v15 - (void)v8;
LABEL_30:
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", v8, v25));
          if ([v26 length])
          {
            v54 = 0LL;
            do
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", &v8[v54]));
              -[NSMutableArray addObject:](v7, "addObject:", v55);

              ++v54;
            }

            while (v54 < (unint64_t)[v26 length]);
            v8 += v54;
          }

          -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v26);
          goto LABEL_35;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
        v25 = v15 - (void)v8;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", v8, v15 - (void)v8 + 1));

        numeralInfo = self->_numeralInfo;
        if (numeralInfo
          && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](numeralInfo, "objectForKey:", v26))) != 0LL)
        {
          v29 = v28;
          v58 = v26;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"reading"]);
          v59 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"locations"]);
          v32 = &CFLocaleCreate_ptr;
          if ([v30 length])
          {
            v33 = 0LL;
            do
            {
              v34 = v32[21];
              v35 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:v33]);
              v36 = v31;
              v37 = v32;
              v38 = v35;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "numberWithInteger:", &v8[(void)objc_msgSend(v35, "integerValue")]));
              -[NSMutableArray addObject:](v7, "addObject:", v39);

              v32 = v37;
              v31 = v36;
              ++v33;
            }

            while (v33 < (unint64_t)[v30 length]);
          }

          v40 = objc_alloc(&OBJC_CLASS___NSAttributedString);
          v64[0] = @"token";
          v41 = (void *)objc_claimAutoreleasedReturnValue([v32[21] numberWithInteger:v60]);
          v64[1] = @"partOfSpeech";
          v65[0] = v41;
          v65[1] = &off_9E88;
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  2LL));
          v43 = -[NSAttributedString initWithString:attributes:](v40, "initWithString:attributes:", v30, v42);
          -[NSMutableAttributedString appendAttributedString:](v63, "appendAttributedString:", v43);

          --v60;
          v26 = v58;
          v44 = v59;
        }

        else
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
          v46 = [v45 characterAtIndex:v15];

          if (v46 != 26085)
          {

            v5 = v61;
            goto LABEL_30;
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", v8, v15 - (void)v8));
          -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v47);

          if ((uint64_t)v8 <= (uint64_t)v16)
          {
            do
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
              -[NSMutableArray addObject:](v7, "addObject:", v48);

              ++v8;
            }

            while (v16 + 1 != v8);
          }

          v49 = objc_alloc(&OBJC_CLASS___NSAttributedString);
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedStringForKey:@"にち" value:&stru_93A0 table:0]);
          v52 = -[NSAttributedString initWithString:](v49, "initWithString:", v51);
          -[NSMutableAttributedString appendAttributedString:](v63, "appendAttributedString:", v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
          -[NSMutableArray addObject:](v7, "addObject:", v53);

          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
          -[NSMutableArray addObject:](v7, "addObject:", v44);
        }

        v8 = v16 + 2;
        v6 = v63;
        v5 = v61;
LABEL_35:

        if (v8 >= [v4 length]) {
          break;
        }
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", v8, 1));
        -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
        -[NSMutableArray addObject:](v7, "addObject:", v14);

        ++v8;
      }
    }
  }

  if (a4) {
    *a4 = v7;
  }

  return v6;
}

LABEL_26:
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string", v84));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "substringWithRange:", CurrentTokenRange.location, length));

      v38 = 0LL;
      v24 = (void *)v40;
LABEL_27:
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesAtIndex:effectiveRange:", CurrentTokenRange.location, 0, v84));
      if (CurrentTokenRange.location < 1) {
        v42 = 0LL;
      }
      else {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesAtIndex:CurrentTokenRange.location - 1 effectiveRange:0]);
      }
      if (length < 1) {
        v93 = 0LL;
      }
      else {
        v93 = objc_claimAutoreleasedReturnValue([v5 attributesAtIndex:CurrentTokenRange.location + length - 1 effectiveRange:0]);
      }
      v103 = CurrentTokenRange.location + length;
      v95 = v42;
      v96 = v41;
      if (v42 && v41)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:@"token"]);
        v44 = v41;
        v45 = objc_claimAutoreleasedReturnValue([v41 objectForKey:@"token"]);
        v46 = (void *)v45;
        v47 = 0;
        if (v43 && v45) {
          v47 = [v43 isEqual:v45];
        }

        v41 = v44;
      }

      else
      {
        v47 = 0;
        if (!v41) {
          goto LABEL_42;
        }
      }

      v48 = v41;
      v49 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"partOfSpeech"]);

      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"partOfSpeech"]);
        v38 = [v50 integerValue];
      }

LABEL_42:
      else {
        v51 = [&off_B850 containsObject:v24];
      }
      if (-[NSMutableString length](v99, "length")) {
        v52 = CurrentTokenRange.location == v97;
      }
      else {
        v52 = 0;
      }
      if (v52) {
        v53 = v47;
      }
      else {
        v53 = 1;
      }
      if (((v38 == &dword_4) & ~v94) == 0 && ((v91 | v90 | v53) & 1) == 0)
      {
        v54 = (v94 ^ 1) & (v38 == (char *)&dword_8 + 2);
        if (v38 == &dword_C) {
          v54 = 1;
        }
        if (((v54 | v51 | v89) & 1) == 0 && ((v94 ^ 1 | v37) & 1) != 0)
        {
          -[NSMutableString appendString:](v99, "appendString:", @" ");
          if (-[NSMutableArray count](v88, "count")) {
            v55 = objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( v88,  "objectAtIndex:",  (char *)-[NSMutableArray count](v88, "count") - 1));
          }
          else {
            v55 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v97 - 1));
          }
          v56 = (void *)v55;
          -[NSMutableArray addObject:](v88, "addObject:", v55);
        }
      }

      v98 = (int *)v38;
      v57 = 0LL;
      v58 = -1LL;
      v17 = &CFLocaleCreate_ptr;
      v59 = v103;
      while ((CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63)) != v57)
      {
        v60 = (_BYTE *)v57;
        if (v57 < (unint64_t)[v24 length])
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue([v101 string]);
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "substringWithRange:", v59 + v58, 1));

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", (char *)objc_msgSend(v24, "length") + v58, 1));
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_kataToHira, "objectForKey:", v62));
          v65 = v64;
          if (v64)
          {
            v66 = v64;

            v62 = v66;
          }

          v67 = [v62 isEqual:v63];
          ++v57;

          --v58;
          v17 = &CFLocaleCreate_ptr;
          v59 = v103;
          if ((v67 & 1) != 0) {
            continue;
          }
        }

        goto LABEL_69;
      }

      v60 = (_BYTE *)(CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63));
LABEL_69:
      v12 = v88;
      if ([v24 length] != v60)
      {
        v68 = 0LL;
        do
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue([v17[21] numberWithLong:CurrentTokenRange.location]);
          -[NSMutableArray addObject:](v88, "addObject:", v69);

          ++v68;
        }

        while ((unint64_t)v68 < (_BYTE *)[v24 length] - v60);
      }

      v6 = v86;
      if (v60)
      {
        v70 = (uint64_t)(v60 + 1);
        v71 = CurrentTokenRange.location + CurrentTokenRange.length - (void)v60;
        do
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue([v17[21] numberWithInteger:v71]);
          -[NSMutableArray addObject:](v88, "addObject:", v72);

          --v70;
          ++v71;
        }

        while (v70 > 1);
      }

      v73 = (__CFString *)objc_claimAutoreleasedReturnValue( -[ABTTranslator _longVowelExpressedFor:partOfSpeech:]( self,  "_longVowelExpressedFor:partOfSpeech:",  v24,  v98));

      if (v98 == &dword_4)
      {
        v75 = @"わ";
        v5 = v101;
        v74 = (void *)v93;
        if ((-[__CFString isEqual:](v73, "isEqual:", @"は") & 1) != 0
          || (v75 = @"え", -[__CFString isEqual:](v73, "isEqual:", @"へ")))
        {

          v73 = (__CFString *)v75;
        }
      }

      else
      {
        v5 = v101;
        v74 = (void *)v93;
      }

      -[NSMutableString appendString:](v99, "appendString:", v73);
      if (v74)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKey:@"partOfSpeech"]);

        if (v76)
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKey:@"partOfSpeech"]);
          v98 = (int *)[v77 integerValue];
        }
      }

      v14 = v98 == (int *)((char *)&dword_8 + 3);
      else {
        v15 = [&off_B868 containsObject:v73];
      }

      v11 = tokenizer;
      Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      v13 = v59;
      v16 = v104;
      if (!Token) {
        goto LABEL_89;
      }
    }
  }

  v59 = 0LL;
LABEL_89:
  v79 = (char *)objc_msgSend(v5, "length", v84) - v59;
  v80 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "substringWithRange:", v59, v79));
  -[NSMutableString appendString:](v99, "appendString:", v81);

  for (; v59 < (unint64_t)[v5 length]; ++v59)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v59));
    -[NSMutableArray addObject:](v12, "addObject:", v82);
  }

  if (v85) {
    *v85 = v12;
  }
  CFRelease(tokenizer);

  return v99;
}

            v14 = !v11;
LABEL_43:
            if (((v14 | v5) & 1) != 0)
            {
              if (v14) {
                v15 = v4;
              }
              else {
                v15 = 2;
              }
              if (v15 != 2)
              {
                if (v15 != 1) {
                  goto LABEL_55;
                }
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToNumber, "objectForKey:", v7));
                v28 = v27;
                if (v27) {
                  v21 = v27;
                }
                else {
                  v21 = &stru_93A0;
                }

                v22 = 0LL;
                v4 = 1;
LABEL_85:
                -[NSMutableString appendString:](v40, "appendString:", v21);
                i += v22;

                goto LABEL_23;
              }

LABEL_105:
          if ((v78 & 1) != 0)
          {
            if ((v13 - 97) <= 0x19)
            {
              v32 = v9;
              v33 = @"⠰";
LABEL_50:
              -[NSMutableString appendString:](v32, "appendString:", v33);
              v78 = 0;
              goto LABEL_51;
            }

            v78 = 1;
LABEL_52:
            v35 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_romajiToBraille, "objectForKey:", v84));
            if (!v35) {
              v35 = self->_unknownPlaceholder;
            }
            v36 = (__CFString *)v35;
            v37 = 0LL;
            v38 = 0LL;
            v39 = 0LL;
            v40 = 2;
LABEL_83:
            v83 = v40;
            goto LABEL_84;
          }

LABEL_44:
          if ((v13 - 65) > 0x19)
          {
            v78 = 0;
          }

          else
          {
            if (v12 + 1 >= (unint64_t)[v8 length]
              || [v8 characterAtIndex:v12 + 1] - 65 > 0x19)
            {
              v32 = v9;
              v33 = @"⠠";
              goto LABEL_50;
            }

            -[NSMutableString appendString:](v9, "appendString:", @"⠠⠠");
            v31 = (void *)objc_claimAutoreleasedReturnValue([v20[21] numberWithInteger:v12]);
            -[NSMutableArray addObject:](v10, "addObject:", v31);

            v78 = 1;
LABEL_51:
            v34 = (void *)objc_claimAutoreleasedReturnValue([v20[21] numberWithInteger:v12]);
            -[NSMutableArray addObject:](v10, "addObject:", v34);
          }

          goto LABEL_52;
        }

        if (v13 > 0x7F)
        {
          v82 = 0LL;
          if (__maskrune(v13, 0x100uLL) || (v13 & 0xFFFE) == 0x2E) {
            goto LABEL_105;
          }
          v56 = __maskrune(v13, 0x400uLL);
        }

        else
        {
          v82 = 0LL;
          if ((_DefaultRuneLocale.__runetype[v13] & 0x100) != 0 || (v13 & 0xFFFE) == 0x2E) {
            goto LABEL_105;
          }
          v56 = _DefaultRuneLocale.__runetype[v13] & 0x400;
        }

        v28 = v56 != 0;
        if (v56) {
          v60 = 1;
        }
        else {
          v60 = v14;
        }
        if ((v60 & 1) != 0) {
          goto LABEL_77;
        }
        v82 = 0LL;
        if (v13 <= 12288)
        {
          if (v13 != 38 && v13 != 64) {
            goto LABEL_71;
          }
        }

        else if ((v13 - 12289) >= 2 && v13 != 65281 && v13 != 65311)
        {
          goto LABEL_71;
        }

        goto LABEL_140;
      }

      if (v12 >= (unint64_t)[v8 length])
      {
        v26 = 45;
        v24 = v12;
      }

      else
      {
        v24 = v12;
        do
        {
          v25 = [v8 characterAtIndex:v24];
          v26 = v25;
          if (v25 > 0x7F) {
            v27 = __maskrune(v25, 0x100uLL);
          }
          else {
            v27 = _DefaultRuneLocale.__runetype[v25] & 0x100;
          }
          if (v26 - 48 <= 0xFFFFFFFC && !v27) {
            break;
          }
          ++v24;
        }

        while (v24 < (unint64_t)[v8 length]);
      }

      if (v24 >= (unint64_t)[v8 length])
      {
LABEL_122:
        -[NSMutableString appendString:](v9, "appendString:", @"⠤");
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        -[NSMutableArray addObject:](v10, "addObject:", v36);
        v82 = 0LL;
        v83 = 0;
        goto LABEL_96;
      }

      if (v26 > 0x3B) {
        goto LABEL_121;
      }
      if (((1LL << v26) & 0xC00F00000000000LL) != 0) {
        goto LABEL_62;
      }
      if (v26 == 32LL)
      {
        v57 = v24 + 1;
        v58 = [v8 characterAtIndex:v57];
        if (!(v58 > 0x7F ? __maskrune(v58, 0x100uLL) : _DefaultRuneLocale.__runetype[v58] & 0x100)) {
          goto LABEL_122;
        }
      }

      else
      {
LABEL_121:
        if (v26 != 8212 && v26 != 8230) {
          goto LABEL_122;
        }
      }

LABEL_62:
      if (v77 == -1) {
        goto LABEL_122;
      }
      -[NSMutableString replaceCharactersInRange:withString:]( v9,  "replaceCharactersInRange:withString:",  v77,  1LL,  @"⠦");
LABEL_64:
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_romajiToBraille, "objectForKey:", v84));

      if (v42)
      {
        v82 = 1LL;
        v20 = &CFLocaleCreate_ptr;
        goto LABEL_105;
      }

      -[NSMutableString appendString:](v9, "appendString:", @"⠴");
      v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( v10,  "objectAtIndex:",  (char *)-[NSMutableArray count](v10, "count") - 1));
      -[NSMutableArray addObject:](v10, "addObject:", v44);
      else {
        v45 = _DefaultRuneLocale.__runetype[v13] & 0x400;
      }
      v28 = v45 != 0;

LABEL_77:
      v29 = 0LL;
LABEL_78:
      v82 = v29;
      if (!v28) {
        goto LABEL_140;
      }
      -[NSMutableString appendString:](v9, "appendString:", @"⠼");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
      -[NSMutableArray addObject:](v10, "addObject:", v47);

LABEL_80:
      v48 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_numberToBraille, "objectForKey:", v84));
      if (!v48) {
        v48 = self->_unknownPlaceholder;
      }
      v36 = (__CFString *)v48;
      v37 = 0LL;
      v38 = 0LL;
      v39 = 0LL;
      v40 = 1;
      goto LABEL_83;
    }

    if (v13 > 0x7F)
    {
      if (__maskrune(v13, 0x100uLL))
      {
LABEL_43:
        v77 = (uint64_t)-[NSMutableString length](v9, "length");
        -[NSMutableString appendString:](v9, "appendString:", @"⠰");
        v30 = (void *)objc_claimAutoreleasedReturnValue([v20[21] numberWithInteger:v12]);
        -[NSMutableArray addObject:](v10, "addObject:", v30);

        goto LABEL_44;
      }

      if (__maskrune(v13, 0x400uLL)) {
        goto LABEL_80;
      }
    }

    else
    {
      v23 = _DefaultRuneLocale.__runetype[v13];
      if ((v23 & 0x100) != 0) {
        goto LABEL_43;
      }
      if ((v23 & 0x400) != 0) {
        goto LABEL_80;
      }
    }

    if ((v13 | 2) == 0x2E) {
      goto LABEL_80;
    }
    if (!v14 && [&off_B8B0 containsObject:v84] && v12 > 0)
    {
LABEL_71:
      -[NSMutableString appendString:](v9, "appendString:", @"⠤");
      v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( v10,  "objectAtIndex:",  (char *)-[NSMutableArray count](v10, "count") - 1));
      -[NSMutableArray addObject:](v10, "addObject:", v43);
    }

LABEL_140:
    if (v12 + 1 < (unint64_t)[v8 length]
      && (v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v12, 2)),
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_kanaToBraille, "objectForKey:", v61)),
          v61,
          v36))
    {
      v37 = 0LL;
      v38 = 0LL;
      v83 = 0;
      v39 = 1LL;
    }

    else
    {
      if (v13 <= 8220)
      {
        if (v13 == 40)
        {
          v37 = 0LL;
          v38 = 0LL;
          v39 = 0LL;
          v83 = 0;
          if (v74 <= 0) {
            v36 = @"⠶";
          }
          else {
            v36 = @"⠰⠶";
          }
          ++v74;
          goto LABEL_84;
        }

        if (v13 == 41)
        {
          v37 = 0LL;
          v38 = 0LL;
          v39 = 0LL;
          v83 = 0;
          if (v74 <= 1) {
            v36 = @"⠶";
          }
          else {
            v36 = @"⠶⠆";
          }
          v74 -= v74 > 0;
          goto LABEL_84;
        }
      }

      else
      {
        switch(v13)
        {
          case 8221:
            goto LABEL_167;
          case 12301:
            v37 = 0LL;
            v38 = 0LL;
            v39 = 0LL;
            v83 = 0;
            if (v75 <= 1) {
              v36 = @"⠤";
            }
            else {
              v36 = @"⠤⠆";
            }
            v75 -= v75 > 0;
            goto LABEL_84;
          case 12300:
            v37 = 0LL;
            v38 = 0LL;
            v39 = 0LL;
            v83 = 0;
            if (v75 <= 0) {
              v36 = @"⠤";
            }
            else {
              v36 = @"⠰⠤";
            }
            ++v75;
            goto LABEL_84;
        }
      }

      if (v13 == 34 && v76 >= 1)
      {
LABEL_167:
        v37 = 0LL;
        v38 = 0LL;
        v39 = 0LL;
        v83 = 0;
        --v76;
LABEL_168:
        v36 = @"⠠⠆";
        goto LABEL_84;
      }

      v63 = v13 == 34 && v76 == 0;
      if (v13 == 8220 || v63)
      {
        v37 = 0LL;
        v38 = 0LL;
        v39 = 0LL;
        v83 = 0;
        ++v76;
LABEL_182:
        v36 = @"⠰⠄";
        goto LABEL_84;
      }

      if (v13 == 8217 || v13 == 39 && v72 >= 1)
      {
        v37 = 0LL;
        v38 = 0LL;
        v39 = 0LL;
        v83 = 0;
        --v72;
        goto LABEL_168;
      }

      v65 = v13 == 39 && v72 == 0;
      if (v13 == 8216 || v65)
      {
        v37 = 0LL;
        v38 = 0LL;
        v39 = 0LL;
        v83 = 0;
        ++v72;
        goto LABEL_182;
      }

      if (v13 <= 125)
      {
        v37 = 0LL;
        v39 = 0LL;
        v83 = 0;
        v66 = @"⠰⠯";
        v38 = 1LL;
        v36 = @"⠰⠏";
        switch(v13)
        {
          case '#':
            v37 = 0LL;
            v39 = 0LL;
            v83 = 0;
            v38 = 1LL;
            v36 = @"⠰⠩";
            goto LABEL_84;
          case '$':
          case '\'':
          case '(':
          case ')':
          case '+':
          case '-':
            goto LABEL_218;
          case '%':
            goto LABEL_84;
          case '&':
            goto LABEL_212;
          case '*':
            v37 = 0LL;
            v39 = 0LL;
            v83 = 0;
            v38 = 1LL;
            v36 = @"⠰⠡";
            goto LABEL_84;
          case ',':
            goto LABEL_206;
          case '.':
            v39 = 0LL;
            v83 = 0;
            v37 = 1LL;
            v38 = 1LL;
            goto LABEL_226;
          case '/':
            v37 = 0LL;
            v38 = 0LL;
            v39 = 0LL;
            v83 = 0;
            v36 = @"⠌";
            goto LABEL_84;
          default:
            if (v13 != 64) {
              goto LABEL_218;
            }
            v66 = @"⠰⠪";
LABEL_212:
            v67 = v12 < 1 || v14;
            if ((v67 & 1) == 0)
            {
              -[NSMutableString appendString:](v9, "appendString:", @"⠀");
              v68 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( v10,  "objectAtIndex:",  (char *)-[NSMutableArray count](v10, "count") - 1));
              -[NSMutableArray addObject:](v10, "addObject:", v68);
            }

            v39 = 0LL;
            v83 = 0;
            v37 = 1LL;
            v38 = 1LL;
            v36 = (__CFString *)v66;
            break;
        }

        goto LABEL_84;
      }

      if (v13 > 12289)
      {
        if (v13 > 65280)
        {
          if (v13 == 65281)
          {
            v39 = 0LL;
            v83 = 0;
            v37 = 2LL;
            v38 = 2LL;
            v36 = @"⠖";
          }

          else
          {
            if (v13 != 65311) {
              goto LABEL_218;
            }
            v39 = 0LL;
            v83 = 0;
            v37 = 2LL;
            v38 = 2LL;
            v36 = @"⠢";
          }
        }

        else
        {
          if (v13 == 12290)
          {
            v39 = 0LL;
            v83 = 0;
            v37 = 2LL;
            v38 = 2LL;
LABEL_226:
            v36 = @"⠲";
            goto LABEL_84;
          }

          if (v13 != 12539)
          {
LABEL_218:
            v69 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v80->_kanaToBraille, "objectForKey:", v84));
            if (!v69) {
              v69 = v80->_unknownPlaceholder;
            }
            v36 = v69;
            v37 = 0LL;
            v38 = 0LL;
            v39 = 0LL;
            v83 = 0;
            goto LABEL_84;
          }

          v39 = 0LL;
          v83 = 0;
          v37 = 1LL;
          v38 = 1LL;
          v36 = @"⠐";
        }
      }

      else if (v13 > 8450)
      {
        if (v13 == 8451)
        {
          v37 = 0LL;
          v39 = 0LL;
          v83 = 0;
          v38 = 1LL;
          v36 = @"⠰⠙⠠⠉";
        }

        else
        {
          if (v13 != 12289) {
            goto LABEL_218;
          }
LABEL_206:
          v39 = 0LL;
          v83 = 0;
          v37 = 1LL;
          v38 = 1LL;
          v36 = @"⠰";
        }
      }

      else if (v13 == 126)
      {
        v37 = 0LL;
        v38 = 0LL;
        v39 = 0LL;
        v83 = 0;
        v36 = @"⠤⠤";
      }

      else
      {
        if (v13 != 176) {
          goto LABEL_218;
        }
        v37 = 0LL;
        v39 = 0LL;
        v83 = 0;
        v38 = 1LL;
        v36 = @"⠰⠙";
      }
    }

LABEL_84:
    v81 = v39;
    -[NSMutableString appendString:](v9, "appendString:", v36);
    if (-[__CFString length](v36, "length"))
    {
      v49 = 0LL;
      do
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        -[NSMutableArray addObject:](v10, "addObject:", v50);

        ++v49;
      }

      while (v49 < (unint64_t)-[__CFString length](v36, "length"));
    }

    if (v12 + 1 < (unint64_t)[v8 length])
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v12 + 1, 1));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v80->_kanaToBraille, "objectForKey:", v51));

      if (v52) {
        v37 = v38;
      }
    }

    if (v12 + 1 < (unint64_t)[v8 length])
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v12 + 1, 1));
      v54 = [&off_B8C8 containsObject:v53];
      if (v37 && (v54 & 1) == 0)
      {
        do
        {
          -[NSMutableString appendString:](v79, "appendString:", @"⠀");
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
          -[NSMutableArray addObject:](v10, "addObject:", v55);

          --v37;
        }

        while (v37);
      }
    }

    self = v80;
    v12 += v81;
    v9 = v79;
LABEL_96:

    ++v12;
    v11 = v83;
  }

  while (v12 < (unint64_t)[v8 length]);
  a4 = v73;
  if (v82)
  {
    -[NSMutableString appendString:](v9, "appendString:", @"⠴");
    v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v8 length] - 1));
    -[NSMutableArray addObject:](v10, "addObject:", v70);
  }

LABEL_231:
  if (a4) {
    *a4 = v10;
  }

  return v9;
}

LABEL_57:
              if ((v5 & 1) != 0 && [v7 isEqual:@"⠶"])
              {
                v20 = CFSTR("(");
                if ((v38 & 1) != 0) {
                  v20 = @"");
                }
                v21 = v20;
                v38 ^= 1u;
LABEL_62:
                v22 = 0LL;
                v4 = 2;
                goto LABEL_85;
              }

              v23 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v9));
              if (v23)
              {
                v21 = (__CFString *)v23;
                v4 = 2;
                v22 = 2LL;
                goto LABEL_85;
              }

              v29 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v8));
              if (!v29)
              {
                v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v7));
                if (!v31)
                {
                  v22 = 0LL;
                  v4 = 2;
                  v21 = &stru_93A0;
                  goto LABEL_85;
                }

                v21 = v31;
                if (((v39 | HIDWORD(v39)) & 1) != 0)
                {
                  v35 = objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v31, "uppercaseString"));

                  LODWORD(v39) = 0;
                  v22 = 0LL;
                  v4 = 2;
                  v21 = (__CFString *)v35;
                  goto LABEL_85;
                }

                LODWORD(v39) = 0;
                goto LABEL_62;
              }

              v21 = (__CFString *)v29;
              v4 = 2;
            }

            else
            {
              v34 = [v7 isEqual:@"⠠"];
              v33 = [v7 isEqual:@"⠶"];
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v7));

              v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v8));
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToRomaji, "objectForKey:", v9));

              if ((v34 & 1) != 0 || (v33 & 1) != 0 || v16 || v17 || v18) {
                goto LABEL_57;
              }
LABEL_55:
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToKana, "objectForKey:", v8));
              if (v19)
              {
              }

              else if ([v7 isEqual:@"⠤"])
              {
                v24 = @"「";
                if ((v36 & 1) != 0) {
                  v24 = @"」";
                }
                v21 = v24;
                v4 = 0;
                v22 = 0LL;
                LOBYTE(v36) = v36 ^ 1;
                goto LABEL_85;
              }

              if ([v7 isEqual:@"⠶"])
              {
                v25 = @"（";
                if ((v36 & 0x100000000LL) != 0) {
                  v25 = @"）";
                }
                v21 = v25;
                v4 = 0;
                BYTE4(v36) ^= 1u;
                v22 = 0LL;
                goto LABEL_85;
              }

              v26 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToKana, "objectForKey:", v8));
              if (!v26)
              {
                v30 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToKana, "objectForKey:", v7));
                v4 = 0;
                v22 = 0LL;
                if (v30) {
                  v21 = (__CFString *)v30;
                }
                else {
                  v21 = &stru_93A0;
                }
                goto LABEL_85;
              }

              v21 = (__CFString *)v26;
              v4 = 0;
            }

            v22 = 1LL;
            goto LABEL_85;
          }

          v4 = 2;
          LODWORD(v39) = 1;
        }
      }

LABEL_23:
    }
  }

  return v40;
}

void sub_6030( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_6054()
{
  if (qword_C9F0 != -1) {
    dispatch_once(&qword_C9F0, &stru_8240);
  }
  return (id)qword_C9E8;
}

void sub_6094(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.Apple");
  v2 = (void *)qword_C9E8;
  qword_C9E8 = (uint64_t)v1;
}

id sub_60C4()
{
  if (qword_CA00 != -1) {
    dispatch_once(&qword_CA00, &stru_8260);
  }
  return (id)qword_C9F8;
}

void sub_6104(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.AppleFormat");
  v2 = (void *)qword_C9F8;
  qword_C9F8 = (uint64_t)v1;
}

void sub_6134()
{
}

void sub_6160()
{
}

void sub_618C()
{
}

void sub_61B8()
{
}

void sub_61E4()
{
}

void sub_6210()
{
}

void sub_623C()
{
}

void sub_6268()
{
}

void sub_6294()
{
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}