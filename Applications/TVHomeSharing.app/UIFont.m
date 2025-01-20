@interface UIFont
+ (id)tvh_fontFromTextStyle:(unint64_t)a3;
+ (id)tvh_fontFromTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4;
+ (id)tvh_fontFromTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4 fontSize:(double)a5 symbolicTraits:(unsigned int)a6;
+ (id)tvh_fontFromTextStyle:(unint64_t)a3 maximumContentSizeCategory:(id)a4 fontWeight:(int64_t)a5 fontSize:(double)a6 symbolicTraits:(unsigned int)a7;
@end

@implementation UIFont

+ (id)tvh_fontFromTextStyle:(unint64_t)a3
{
  return objc_msgSend(a1, "tvh_fontFromTextStyle:fontWeight:", a3, 0);
}

+ (id)tvh_fontFromTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4
{
  return objc_msgSend(a1, "tvh_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", a3, a4, 0, 0.0);
}

+ (id)tvh_fontFromTextStyle:(unint64_t)a3 fontWeight:(int64_t)a4 fontSize:(double)a5 symbolicTraits:(unsigned int)a6
{
  return objc_msgSend( a1,  "tvh_fontFromTextStyle:maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:",  a3,  UIContentSizeCategoryUnspecified,  a4,  *(void *)&a6,  a5);
}

+ (id)tvh_fontFromTextStyle:(unint64_t)a3 maximumContentSizeCategory:(id)a4 fontWeight:(int64_t)a5 fontSize:(double)a6 symbolicTraits:(unsigned int)a7
{
  id v11 = a4;
  if (qword_100157650 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  dispatch_once(&qword_100157650, &stru_1000FFBE8);
  if (a3)
  {
LABEL_3:
    v12 = (void *)qword_100157640;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    a3 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);
  }

@end