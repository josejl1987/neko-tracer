#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
	FILEH	fh;
	UINT	trks;
	_CDTRK	trk[100];
	OEMCHAR	path[MAX_PATH];
} _CDINFO, *CDINFO;

long issec2048(FILEH fh);
long issec2352(FILEH fh);
long issec2448(FILEH fh);
long issec(FILEH fh, _CDTRK *trk, UINT trks);

long set_trkinfo(FILEH fh, _CDTRK *trk, UINT trks, UINT64 imagesize);

REG8 sec2048_read(SXSIDEV sxsi, long pos, UINT8 *buf, UINT size);
REG8 sec2352_read(SXSIDEV sxsi, long pos, UINT8 *buf, UINT size);
REG8 sec2448_read(SXSIDEV sxsi, long pos, UINT8 *buf, UINT size);
REG8 sec_read(SXSIDEV sxsi, long pos, UINT8 *buf, UINT size);

BRESULT cd_reopen(SXSIDEV sxsi);
void cd_close(SXSIDEV sxsi);
void cd_destroy(SXSIDEV sxsi);

void set_secread(SXSIDEV sxsi, const _CDTRK *trk, UINT trks);

BRESULT setsxsidev(SXSIDEV sxsi, const OEMCHAR *path, const _CDTRK *trk, UINT trks);

#ifdef __cplusplus
}
#endif
