@interface _TVSSCameraZoomMarkerView
- (CGSize)intrinsicContentSize;
- (_TVSSCameraZoomMarkerView)initWithMarker:(_TVSSZoomMarker *)a3;
- (_TVSSZoomMarker)marker;
@end

@implementation _TVSSCameraZoomMarkerView

- (_TVSSCameraZoomMarkerView)initWithMarker:(_TVSSZoomMarker *)a3
{
  SEL v15 = a2;
  v14 = a3;
  v16 = 0LL;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____TVSSCameraZoomMarkerView;
  v8 = -[_TVSSCameraZoomMarkerView initWithFrame:]( &v13,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v16 = v8;
  objc_storeStrong((id *)&v16, v8);
  if (v8)
  {
    memcpy(&v16->_marker, a3, sizeof(v16->_marker));
    -[_TVSSCameraZoomMarkerView _setCornerRadius:](v16, "_setCornerRadius:", 1.0);
    v6 = v16;
    char v11 = 0;
    char v9 = 0;
    if (v16->_marker.showLargeMarker)
    {
      v12 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
      char v11 = 1;
      v5 = v12;
    }

    else
    {
      v10 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6);
      char v9 = 1;
      v5 = v10;
    }

    -[_TVSSCameraZoomMarkerView setBackgroundColor:](v6, "setBackgroundColor:", v5);
    if ((v9 & 1) != 0) {

    }
    if ((v11 & 1) != 0) {
  }
    }

  v4 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TVSSZoomMarker)marker
{
  return (_TVSSZoomMarker *)memcpy(retstr, &self->_marker, sizeof(_TVSSZoomMarker));
}

@end