@interface NSString
+ (id)tvh_durationStringForSeconds:(id)a3;
+ (id)tvh_durationStringForSecondsString:(id)a3;
+ (id)tvh_localizedStringWithFormat:(id)a3 arguments:(id)a4;
+ (id)tvh_positionalDurationStringForSeconds:(id)a3;
+ (id)tvh_positionalDurationStringForSecondsString:(id)a3;
+ (id)tvh_stringWithAppendedExplicitIndicator:(id)a3;
- (id)tvh_attributedStringForHTMLStringWithFont:(id)a3 textColor:(id)a4;
- (id)tvh_stringByDecodingXMLEntities;
- (id)tvh_stringByEncodingXMLEntities;
@end

@implementation NSString

+ (id)tvh_localizedStringWithFormat:(id)a3 arguments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"format");
  if (!v7) {
LABEL_3:
  }
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"arguments");
LABEL_4:
  switch((unint64_t)[v7 count])
  {
    case 0uLL:
      NSExceptionName v8 = NSInvalidArgumentException;
      v9 = @"The arguments array cannot be empty";
      goto LABEL_9;
    case 1uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  v11));
      goto LABEL_18;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  v11,  v12));
      goto LABEL_17;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:2]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  v11,  v12,  v13));
      goto LABEL_16;
    case 4uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:2]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:3]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  v11,  v12,  v13,  v14));
      goto LABEL_15;
    case 5uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:2]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:3]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:4]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  v11,  v12,  v13,  v14,  v15));

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

      break;
    default:
      NSExceptionName v8 = NSInvalidArgumentException;
      v9 = @"The max number of supported arguments is 5";
LABEL_9:
      +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", v8, v9);
      v10 = 0LL;
      break;
  }

  return v10;
}

+ (id)tvh_stringWithAppendedExplicitIndicator:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAgeVerificationManager defaultManager](&OBJC_CLASS___ICAgeVerificationManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ageVerificationState]);
  id v6 = [v5 treatment];

  if (v6 == (id)1) {
    v7 = @" ⓳";
  }
  else {
    v7 = @" 🅴";
  }
  NSExceptionName v8 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:v7]);

  return v8;
}

+ (id)tvh_durationStringForSecondsString:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvh_durationStringForSeconds:", v4));

  return v5;
}

+ (id)tvh_durationStringForSeconds:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHDurationValueTransformer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v3]);

  return v5;
}

+ (id)tvh_positionalDurationStringForSecondsString:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvh_positionalDurationStringForSeconds:", v4));

  return v5;
}

+ (id)tvh_positionalDurationStringForSeconds:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHPositionalDurationValueTransformer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v3]);

  return v5;
}

- (id)tvh_stringByEncodingXMLEntities
{
  id v2 = -[NSString mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "tvh_encodeXMLEntities");
  return v2;
}

- (id)tvh_stringByDecodingXMLEntities
{
  id v2 = -[NSString mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "tvh_decodeXMLEntities");
  return v2;
}

- (id)tvh_attributedStringForHTMLStringWithFont:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = NSFontAttributeName;
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v6;
  v27[1] = v7;
  v26[2] = NSParagraphStyleAttributeName;
  NSExceptionName v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](&OBJC_CLASS___NSParagraphStyle, "defaultParagraphStyle"));
  v27[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPUHTMLParser displayDelegateWithDefaultAttributes:]( &OBJC_CLASS___MPUHTMLParser,  "displayDelegateWithDefaultAttributes:",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPUHTMLParser parser](&OBJC_CLASS___MPUHTMLParser, "parser"));
  [v11 setDelegate:v10];
  uint64_t v25 = 0LL;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 attributedStringForHTMLString:self error:&v25]);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 invertedSet]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
    v17 = [v16 rangeOfCharacterFromSet:v15];
    if (v18) {
      v19 = v17;
    }
    else {
      v19 = 0LL;
    }
    v20 = (char *)[v16 rangeOfCharacterFromSet:v15 options:4];
    if (v21) {
      v22 = &v20[v21];
    }
    else {
      v22 = (char *)[v16 length];
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributedSubstringFromRange:", v19, v22 - v19));
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

@end