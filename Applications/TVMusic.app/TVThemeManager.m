@interface TVThemeManager
+ (UIColor)labelQuaternaryColor;
+ (id)_darkModeListTitleTextColor;
+ (id)_lightModeListTitleTextColor;
+ (id)bodyEmphasizedFont;
+ (id)bodyFont;
+ (id)calloutEmphasizedFont;
+ (id)calloutFont;
+ (id)caption1EmphasizedFont;
+ (id)caption1Font;
+ (id)caption2Font;
+ (id)footnoteFont;
+ (id)headlineEmphasizedFont;
+ (id)headlineFont;
+ (id)listTitleTextColor;
+ (id)subtitle1Font;
+ (id)subtitle3Font;
+ (id)textOpacityAColor;
+ (id)textOpacityAColorReversed;
+ (id)textOpacityBColor;
+ (id)textOpacityCColor;
+ (id)textOpacityDColor;
+ (id)title2Font;
@end

@implementation TVThemeManager

+ (id)title2Font
{
  if (qword_1002BEA08 != -1) {
    dispatch_once(&qword_1002BEA08, &stru_10026CBA0);
  }
  return (id)qword_1002BEA00;
}

+ (id)headlineFont
{
  if (qword_1002BEA18 != -1) {
    dispatch_once(&qword_1002BEA18, &stru_10026CBC0);
  }
  return (id)qword_1002BEA10;
}

+ (id)headlineEmphasizedFont
{
  if (qword_1002BEA28 != -1) {
    dispatch_once(&qword_1002BEA28, &stru_10026CBE0);
  }
  return (id)qword_1002BEA20;
}

+ (id)subtitle1Font
{
  if (qword_1002BEA38 != -1) {
    dispatch_once(&qword_1002BEA38, &stru_10026CC00);
  }
  return (id)qword_1002BEA30;
}

+ (id)subtitle3Font
{
  if (qword_1002BEA48 != -1) {
    dispatch_once(&qword_1002BEA48, &stru_10026CC20);
  }
  return (id)qword_1002BEA40;
}

+ (id)calloutFont
{
  if (qword_1002BEA58 != -1) {
    dispatch_once(&qword_1002BEA58, &stru_10026CC40);
  }
  return (id)qword_1002BEA50;
}

+ (id)calloutEmphasizedFont
{
  if (qword_1002BEA68 != -1) {
    dispatch_once(&qword_1002BEA68, &stru_10026CC60);
  }
  return (id)qword_1002BEA60;
}

+ (id)bodyFont
{
  if (qword_1002BEA78 != -1) {
    dispatch_once(&qword_1002BEA78, &stru_10026CC80);
  }
  return (id)qword_1002BEA70;
}

+ (id)bodyEmphasizedFont
{
  if (qword_1002BEA88 != -1) {
    dispatch_once(&qword_1002BEA88, &stru_10026CCA0);
  }
  return (id)qword_1002BEA80;
}

+ (id)footnoteFont
{
  if (qword_1002BEA98 != -1) {
    dispatch_once(&qword_1002BEA98, &stru_10026CCC0);
  }
  return (id)qword_1002BEA90;
}

+ (id)caption1Font
{
  if (qword_1002BEAA8 != -1) {
    dispatch_once(&qword_1002BEAA8, &stru_10026CCE0);
  }
  return (id)qword_1002BEAA0;
}

+ (id)caption1EmphasizedFont
{
  if (qword_1002BEAB8 != -1) {
    dispatch_once(&qword_1002BEAB8, &stru_10026CD00);
  }
  return (id)qword_1002BEAB0;
}

+ (id)caption2Font
{
  if (qword_1002BEAC8 != -1) {
    dispatch_once(&qword_1002BEAC8, &stru_10026CD20);
  }
  return (id)qword_1002BEAC0;
}

+ (id)listTitleTextColor
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10009BF34;
  v3[3] = &unk_10026CD40;
  v3[4] = a1;
  return (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  v3));
}

+ (id)_lightModeListTitleTextColor
{
  if (qword_1002BEAD8 != -1) {
    dispatch_once(&qword_1002BEAD8, &stru_10026CD60);
  }
  return (id)qword_1002BEAD0;
}

+ (id)_darkModeListTitleTextColor
{
  if (qword_1002BEAE8 != -1) {
    dispatch_once(&qword_1002BEAE8, &stru_10026CD80);
  }
  return (id)qword_1002BEAE0;
}

+ (id)textOpacityAColor
{
  if (qword_1002BEAF8 != -1) {
    dispatch_once(&qword_1002BEAF8, &stru_10026CDA0);
  }
  return (id)qword_1002BEAF0;
}

+ (id)textOpacityAColorReversed
{
  if (qword_1002BEB08 != -1) {
    dispatch_once(&qword_1002BEB08, &stru_10026CE00);
  }
  return (id)qword_1002BEB00;
}

+ (id)textOpacityBColor
{
  if (qword_1002BEB18 != -1) {
    dispatch_once(&qword_1002BEB18, &stru_10026CE40);
  }
  return (id)qword_1002BEB10;
}

+ (id)textOpacityCColor
{
  if (qword_1002BEB28 != -1) {
    dispatch_once(&qword_1002BEB28, &stru_10026CE80);
  }
  return (id)qword_1002BEB20;
}

+ (id)textOpacityDColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009C500;
  block[3] = &unk_100269BE8;
  block[4] = a1;
  if (qword_1002BEB38 != -1) {
    dispatch_once(&qword_1002BEB38, block);
  }
  return (id)qword_1002BEB30;
}

+ (UIColor)labelQuaternaryColor
{
  return +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_10026CEC0);
}

@end