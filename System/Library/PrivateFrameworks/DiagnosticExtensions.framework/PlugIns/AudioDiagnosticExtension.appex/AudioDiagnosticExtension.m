void sub_1000035B4(id a1)
{
  void *v1;
  v1 = operator new(0x10uLL);
  v1[1] = 0LL;
  *v1 = os_log_create("com.apple.coreaudio", "adel");
  qword_10000C6C8 = (uint64_t)v1;
}

void sub_100003674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003E00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100004088(id a1)
{
  v1 = operator new(0x10uLL);
  v1[1] = 0LL;
  void *v1 = os_log_create("com.apple.coreaudio", "adef");
  qword_10000C6D8 = (uint64_t)v1;
}

void sub_100004274( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

LABEL_36:
                }

                else
                {
                  ++v42;
                }

LABEL_44:
                v14 = v25;
              }

              v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            v17 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
            if (!v17)
            {
LABEL_47:

              goto LABEL_48;
            }
          }
        }

        if (qword_10000C6D0 != -1) {
          dispatch_once(&qword_10000C6D0, &stru_100008210);
        }
        v15 = (os_log_s *)*(id *)qword_10000C6D8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
          *(_DWORD *)buf = 136315906;
          v63 = "FileUtilities.mm";
          v64 = 1024;
          v65 = 68;
          v66 = 2114;
          v67 = v11;
          v68 = 2114;
          v69 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to get file attributes. { filePath=%{public}@, error=%{public}@ }",  buf,  0x26u);
        }

LABEL_48:
        v8 = v14;
        v11 = v43;
LABEL_49:

        v41 = (char *)v41 + 1;
        v6 = v44;
      }

      while (v41 != v39);
      v39 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v57,  v73,  16LL);
      if (!v39) {
        goto LABEL_54;
      }
    }
  }

  v8 = 0LL;
LABEL_53:
  v42 = 0LL;
LABEL_54:

  return v42;
}

void sub_100004B50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29)
{
  _Unwind_Resume(a1);
}

void sub_100005080( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000051A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000525C(id a1)
{
  v1 = operator new(0x10uLL);
  v1[1] = 0LL;
  void *v1 = os_log_create("com.apple.coreaudio", "adez");
  qword_10000C6E8 = (uint64_t)v1;
}

void sub_1000059A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100005EC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_100005F70(&a9);
  _Unwind_Resume(a1);
}

void **sub_100005F70(void **a1)
{
  return a1;
}

void sub_100005FB8(void *a1)
{
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_zipManager(void *a1, const char *a2, ...)
{
  return [a1 zipManager];
}