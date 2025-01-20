@interface MCTextConversion
+ (id)attributedStringWithCTAttributesFromStringAttributes:(id)a3;
+ (id)attributedStringWithNSAttributesFromStringAttributes:(id)a3;
+ (id)stretchForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (id)stringAttributesWithAttributedString:(id)a3;
+ (id)stringFromLigature:(int64_t)a3;
+ (id)stringFromTextAlignment:(int64_t)a3;
+ (id)styleForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (id)textFormatFromUnderlineStyle:(unint64_t)a3;
+ (id)textFormatWithCTAttributesForText:(id)a3 attributes:(id)a4;
+ (id)textFormatWithNSAttributesForText:(id)a3 attributes:(id)a4;
+ (id)weightForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (int64_t)ligatureFromString:(id)a3;
+ (int64_t)textAlignmentFromString:(id)a3;
+ (unint64_t)underlineStyleFromTextFormat:(id)a3;
@end

@implementation MCTextConversion

+ (id)styleForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  v6 = @"italic";
  if ([v5 rangeOfString:@"italic" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = @"oblique";
    if ([v5 rangeOfString:@"oblique" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
      return @"normal";
    }
  }

  return (id)v6;
}

+ (id)weightForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  if ([v5 rangeOfString:@"light" options:1] != (id)0x7FFFFFFFFFFFFFFFLL) {
    return @"lighter";
  }
  if ([v5 rangeOfString:@"bold" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return @"normal";
  }
  return @"bold";
}

+ (id)stretchForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  if ([v5 rangeOfString:@"condensed" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return @"condensed";
  }
}

+ (int64_t)textAlignmentFromString:(id)a3
{
  return 0LL;
}

+ (id)stringFromTextAlignment:(int64_t)a3
{
  else {
    return off_24E528[a3];
  }
}

+ (int64_t)ligatureFromString:(id)a3
{
  return 1LL;
}

+ (id)stringFromLigature:(int64_t)a3
{
  else {
    return off_24E540[a3];
  }
}

+ (unint64_t)underlineStyleFromTextFormat:(id)a3
{
  id v4 = [a3 objectForKey:@"thickness"];
  if ([v4 isEqualToString:@"single"])
  {
    unint64_t v5 = 1LL;
  }

  else if ([v4 isEqualToString:@"thick"])
  {
    unint64_t v5 = 2LL;
  }

  else if ([v4 isEqualToString:@"double"])
  {
    unint64_t v5 = 9LL;
  }

  else
  {
    unint64_t v5 = 1LL;
  }

  id v6 = [a3 objectForKey:@"pattern"];
  if (([v6 isEqualToString:@"solid"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"dot"])
    {
      v5 |= 0x100uLL;
    }

    else if ([v6 isEqualToString:@"dash"])
    {
      v5 |= 0x200uLL;
    }

    else if ([v6 isEqualToString:@"dashdot"])
    {
      v5 |= 0x300uLL;
    }

    else if ([v6 isEqualToString:@"dashdotdot"])
    {
      v5 |= 0x400uLL;
    }
  }

  return v5;
}

+ (id)textFormatFromUnderlineStyle:(unint64_t)a3
{
  __int16 v3 = a3;
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  unint64_t v5 = v4;
  id v6 = @"single";
  else {
    v7 = v6;
  }
  [v4 setObject:v7 forKey:@"thickness"];
  else {
    v8 = off_24E558[(char)(HIBYTE(v3) - 1)];
  }
  [v5 setObject:v8 forKey:@"pattern"];
  [v5 setObject:&__kCFBooleanFalse forKey:@"byWord"];
  return v5;
}

+ (id)textFormatWithCTAttributesForText:(id)a3 attributes:(id)a4
{
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v6 setObject:a3 forKey:@"text"];
  v7 = (const __CTFont *)[a4 objectForKey:kCTFontAttributeName];
  if (!v7) {
    v7 = CTFontCreateWithName(@"Helvetica", 12.0, 0LL);
  }
  v8 = (id)CTFontCopyPostScriptName(v7);
  v9 = (id)CTFontCopyFamilyName(v7);
  v10 = (id)CTFontCopyDisplayName(v7);
  [v6 setObject:v8 forKey:@"fontName"];
  [v6 setObject:v9 forKey:@"fontFamily"];
  CGFloat v11 = CTFontGetSize(v7);
  *(float *)&CGFloat v11 = v11;
  objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11),  @"fontSize");
  objc_msgSend( v6,  "setObject:forKey:",  +[MCTextConversion styleForFontDisplayName:andFamilyName:]( MCTextConversion,  "styleForFontDisplayName:andFamilyName:",  v10,  v9),  @"fontStyle");
  objc_msgSend( v6,  "setObject:forKey:",  +[MCTextConversion weightForFontDisplayName:andFamilyName:]( MCTextConversion,  "weightForFontDisplayName:andFamilyName:",  v10,  v9),  @"fontWeight");
  id v12 = +[MCTextConversion stretchForFontDisplayName:andFamilyName:]( &OBJC_CLASS___MCTextConversion,  "stretchForFontDisplayName:andFamilyName:",  v10,  v9);
  if (v12) {
    [v6 setObject:v12 forKey:@"fontStretch"];
  }
  v13 = (CGColor *)[a4 objectForKey:kCTForegroundColorAttributeName];
  if (!v13) {
    v13 = +[MPUtilities blackCGColor](&OBJC_CLASS___MPUtilities, "blackCGColor");
  }
  objc_msgSend( v6,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v13),  @"foregroundColor");
  id v14 = [a4 objectForKey:@"backgroundColor"];
  if (v14) {
    objc_msgSend( v6,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v14),  @"backgroundColor");
  }
  v15 = (const __CTParagraphStyle *)[a4 objectForKey:kCTParagraphStyleAttributeName];
  if (v15)
  {
    v16 = v15;
    if (CTParagraphStyleGetValueForSpecifier(v15, kCTParagraphStyleSpecifierAlignment, 1uLL, &valueBuffer)) {
      objc_msgSend( v6,  "setObject:forKey:",  +[MCTextConversion stringFromTextAlignment:]( MCTextConversion,  "stringFromTextAlignment:",  valueBuffer),  @"alignment");
    }
    double v43 = 0.0;
    if (CTParagraphStyleGetValueForSpecifier(v16, kCTParagraphStyleSpecifierFirstLineHeadIndent, 8uLL, &v43))
    {
      HIDWORD(v17) = HIDWORD(v43);
      *(float *)&double v17 = v43;
      objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17),  @"firstLineHeadIndent");
    }

    double valuePtr = 0.0;
    if (CTParagraphStyleGetValueForSpecifier(v16, kCTParagraphStyleSpecifierHeadIndent, 8uLL, &valuePtr))
    {
      HIDWORD(v18) = HIDWORD(valuePtr);
      *(float *)&double v18 = valuePtr;
      objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18),  @"headIndent");
    }
  }

  LODWORD(v43) = 0;
  id v19 = [a4 objectForKey:@"shadow"];
  if (v19)
  {
    v20 = v19;
    id v21 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v22 = [v20 objectForKey:@"color"];
    if (v22) {
      objc_msgSend( v21,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v22),  @"color");
    }
    id v23 = [v20 objectForKey:@"offset"];
    if (v23)
    {
      [v23 CGSizeValue];
      [v21 setObject:NSStringFromCGSize(v45) forKey:@"offset"];
    }

    v24 = (const __CFNumber *)[v20 objectForKey:@"blurRadius"];
    if (v24)
    {
      CFNumberGetValue(v24, kCFNumberFloat32Type, &valuePtr);
      LODWORD(v25) = LODWORD(valuePtr);
      objc_msgSend( v21,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25),  @"blurRadius");
    }

    [v6 setObject:v21 forKey:@"shadow"];
  }

  v26 = (const __CFNumber *)[a4 objectForKey:kCTUnderlineStyleAttributeName];
  if (v26)
  {
    v27 = v26;
    id v28 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    CFNumberGetValue(v27, kCFNumberSInt32Type, &v43);
    objc_msgSend( v28,  "addEntriesFromDictionary:",  +[MCTextConversion textFormatFromUnderlineStyle:]( MCTextConversion,  "textFormatFromUnderlineStyle:",  SLODWORD(v43)));
    id v29 = [a4 objectForKey:kCTUnderlineColorAttributeName];
    if (v29) {
      objc_msgSend( v28,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v29),  @"color");
    }
    [v6 setObject:v28 forKey:@"underline"];
  }

  v30 = (const __CFNumber *)[a4 objectForKey:kCTSuperscriptAttributeName];
  if (v30)
  {
    CFNumberGetValue(v30, kCFNumberSInt32Type, &v43);
    objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)),  @"superscript");
  }

  v31 = (const __CFNumber *)[a4 objectForKey:kCTLigatureAttributeName];
  if (v31)
  {
    CFNumberGetValue(v31, kCFNumberSInt32Type, &v43);
    objc_msgSend( v6,  "setObject:forKey:",  +[MCTextConversion stringFromLigature:](MCTextConversion, "stringFromLigature:", SLODWORD(v43)),  @"ligature");
  }

  v32 = (const __CFNumber *)[a4 objectForKey:kCTKernAttributeName];
  if (v32)
  {
    CFNumberGetValue(v32, kCFNumberSInt32Type, &v43);
    objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)),  @"kern");
  }

  v33 = (const __CFNumber *)[a4 objectForKey:kCTStrokeWidthAttributeName];
  if (v33)
  {
    v34 = v33;
    id v35 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    CFNumberGetValue(v34, kCFNumberSInt32Type, &v43);
    objc_msgSend( v6,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)),  @"strokeWidth");
    id v36 = [a4 objectForKey:kCTStrokeColorAttributeName];
    if (v36) {
      objc_msgSend( v35,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v36),  @"strokeColor");
    }
  }

  id v37 = [a4 objectForKey:@"strikethrough"];
  if (v37)
  {
    v38 = v37;
    id v39 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    LODWORD(v43) = [v38 integerValue];
    objc_msgSend( v39,  "addEntriesFromDictionary:",  +[MCTextConversion textFormatFromUnderlineStyle:]( MCTextConversion,  "textFormatFromUnderlineStyle:",  SLODWORD(v43)));
    id v40 = [a4 objectForKey:kCTUnderlineColorAttributeName];
    if (v40) {
      objc_msgSend( v39,  "setObject:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v40),  @"color");
    }
    [v6 setObject:v39 forKey:@"strikethrough"];
  }

  return v6;
}

+ (id)textFormatWithNSAttributesForText:(id)a3 attributes:(id)a4
{
  return +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", a3, a4);
}

+ (id)stringAttributesWithAttributedString:(id)a3
{
  id v4 = (char *)[a3 length];
  id v5 = [a3 string];
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (v4)
  {
    uint64_t v7 = 0LL;
    do
    {
      id v8 = objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v11, v7, v4);
      objc_msgSend( v6,  "addObject:",  +[MCTextConversion textFormatWithCTAttributesForText:attributes:]( MCTextConversion,  "textFormatWithCTAttributesForText:attributes:",  objc_msgSend(v5, "substringWithRange:", v11, v12),  v8));
      v9 = &v4[v7];
      uint64_t v7 = v12 + v11;
      id v4 = &v9[-v12 - v11];
    }

    while (v9 != (char *)(v12 + v11));
  }

  return v6;
}

+ (id)attributedStringWithCTAttributesFromStringAttributes:(id)a3
{
  v62 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obj = a3;
  id v4 = [a3 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v70;
    v61 = kCTStrokeColorAttributeName;
    uint64_t v63 = *(void *)v70;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v70 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(v8, "objectForKey:", @"text", v61);
        if (v9)
        {
          v10 = v9;
          if ([v9 length])
          {
            uint64_t v11 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v10);
            id v12 = [v10 length];
            id v13 = [v8 objectForKey:@"foregroundColor"];
            if (v13)
            {
              id v14 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v13);
              v75.location = 0LL;
              v75.length = (CFIndex)v12;
              CFAttributedStringSetAttribute( (CFMutableAttributedStringRef)v11,  v75,  kCTForegroundColorAttributeName,  v14);
            }

            CFIndex range = (CFIndex)v12;
            id v15 = [v8 objectForKey:@"backgroundColor"];
            if (v15)
            {
              v16 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v15);
              v76.location = 0LL;
              v76.length = (CFIndex)v12;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v76, @"backgroundColor", v16);
            }

            double v17 = (const __CFString *)[v8 objectForKey:@"fontName"];
            if (v17)
            {
              double v18 = v17;
              id v19 = [v8 objectForKey:@"fontSize"];
              uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary, v20);
              if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
                id v19 = [v19 objectForKey:@"3x4"];
              }
              [v19 floatValue];
              id v23 = CTFontCreateWithName(v18, v22, 0LL);
              v77.location = 0LL;
              v77.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v77, kCTFontAttributeName, v23);
              uint64_t v6 = v63;
            }

            unsigned __int8 v68 = 0;
            double v66 = 0.0;
            double v67 = 0.0;
            id v24 = [v8 objectForKey:@"alignment"];
            if (v24)
            {
              unsigned __int8 v68 = +[MCTextConversion textAlignmentFromString:]( &OBJC_CLASS___MCTextConversion,  "textAlignmentFromString:",  v24);
              settings[0].spec = kCTParagraphStyleSpecifierAlignment;
              settings[0].valueSize = 1LL;
              settings[0].value = &v68;
              size_t v25 = 1LL;
            }

            else
            {
              size_t v25 = 0LL;
            }

            id v26 = [v8 objectForKey:@"firstLineHeadIndent"];
            if (v26)
            {
              [v26 floatValue];
              double v67 = v27;
              id v28 = &settings[v25];
              v28->spec = kCTParagraphStyleSpecifierFirstLineHeadIndent;
              ++v25;
              v28->valueSize = 8LL;
              v28->value = &v67;
            }

            id v29 = [v8 objectForKey:@"headIndent"];
            if (v29)
            {
              [v29 floatValue];
              double v66 = v30;
              v31 = &settings[v25];
              v31->spec = kCTParagraphStyleSpecifierHeadIndent;
              ++v25;
              v31->valueSize = 8LL;
              v31->value = &v66;
              goto LABEL_24;
            }

            if (v25)
            {
LABEL_24:
              CTParagraphStyleRef v32 = CTParagraphStyleCreate(settings, v25);
              v78.location = 0LL;
              v78.length = range;
              CFAttributedStringSetAttribute( (CFMutableAttributedStringRef)v11,  v78,  kCTParagraphStyleAttributeName,  v32);
              CFRelease(v32);
            }

            id v33 = [v8 objectForKey:@"shadow"];
            if (v33)
            {
              v34 = v33;
              id v35 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
              id v36 = [v34 objectForKey:@"color"];
              if (v36) {
                objc_msgSend( v35,  "setObject:forKey:",  +[MPUtilities CGColorFromString:](MPUtilities, "CGColorFromString:", v36),  @"color");
              }
              id v37 = (NSString *)[v34 objectForKey:@"offset"];
              if (v37)
              {
                CGSize v38 = CGSizeFromString(v37);
                uint64_t v6 = v63;
                objc_msgSend( v35,  "setObject:forKey:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v38.width, v38.height),  @"offset");
              }

              id v39 = [v34 objectForKey:@"blurRadius"];
              if (v39)
              {
                [v39 floatValue];
                objc_msgSend( v35,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"),  @"blurRadius");
              }

              v79.location = 0LL;
              v79.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v79, @"shadow", v35);
            }

            id v40 = [v8 objectForKey:@"underline"];
            if (v40)
            {
              id v41 = v40;
              id v42 = [v40 objectForKey:@"color"];
              if (v42)
              {
                double v43 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v42);
                v80.location = 0LL;
                v80.length = range;
                CFAttributedStringSetAttribute( (CFMutableAttributedStringRef)v11,  v80,  kCTForegroundColorAttributeName,  v43);
              }

              v44 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  +[MCTextConversion underlineStyleFromTextFormat:]( &OBJC_CLASS___MCTextConversion,  "underlineStyleFromTextFormat:",  v41));
              v81.location = 0LL;
              v81.length = range;
              CFAttributedStringSetAttribute( (CFMutableAttributedStringRef)v11,  v81,  kCTUnderlineStyleAttributeName,  v44);
            }

            id v45 = [v8 objectForKey:@"strikethrough"];
            if (v45)
            {
              id v46 = v45;
              id v47 = [v45 objectForKey:@"color"];
              if (v47)
              {
                v48 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v47);
                v82.location = 0LL;
                v82.length = range;
                CFAttributedStringSetAttribute( (CFMutableAttributedStringRef)v11,  v82,  kCTForegroundColorAttributeName,  v48);
              }

              v49 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[MCTextConversion underlineStyleFromTextFormat:]( &OBJC_CLASS___MCTextConversion,  "underlineStyleFromTextFormat:",  v46));
              v83.location = 0LL;
              v83.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v83, @"strikethrough", v49);
            }

            id v50 = [v8 objectForKey:@"superscript"];
            if (v50)
            {
              v51 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v50 intValue]);
              v84.location = 0LL;
              v84.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v84, kCTSuperscriptAttributeName, v51);
            }

            id v52 = [v8 objectForKey:@"ligature"];
            if (v52)
            {
              v53 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v52 intValue]);
              v85.location = 0LL;
              v85.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v85, kCTLigatureAttributeName, v53);
            }

            id v54 = [v8 objectForKey:@"kern"];
            if (v54)
            {
              v55 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v54 intValue]);
              v86.location = 0LL;
              v86.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v86, kCTKernAttributeName, v55);
            }

            id v56 = [v8 objectForKey:@"strokeWidth"];
            if (v56)
            {
              v57 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v56 intValue]);
              v87.location = 0LL;
              v87.length = range;
              CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v87, kCTStrokeWidthAttributeName, v57);
              id v58 = [v8 objectForKey:@"strokeColor"];
              if (v58)
              {
                v59 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v58);
                v88.location = 0LL;
                v88.length = range;
                CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v11, v88, v61, v59);
              }
            }

            -[NSMutableAttributedString appendAttributedString:](v62, "appendAttributedString:", v11);

            continue;
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    }

    while (v5);
  }

  return v62;
}

+ (id)attributedStringWithNSAttributesFromStringAttributes:(id)a3
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
}

@end